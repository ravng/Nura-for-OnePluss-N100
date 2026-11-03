#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <linux/qrtr.h>

#define BDF_MSG 0x25
#define CAL_REPORT_MSG 0x26
#define CHUNK 6144

static void le16(uint8_t *p, uint16_t v) { p[0] = v; p[1] = v >> 8; }
static void le32(uint8_t *p, uint32_t v) { p[0] = v; p[1] = v >> 8; p[2] = v >> 16; p[3] = v >> 24; }
static uint16_t get16(const uint8_t *p) { return p[0] | ((uint16_t)p[1] << 8); }
static uint8_t *tlv(uint8_t *p, uint8_t type, const void *data, uint16_t len) {
    *p++ = type; le16(p, len); p += 2; memcpy(p, data, len); return p + len;
}
static uint8_t *tlv_u32(uint8_t *p, uint8_t type, uint32_t value) {
    uint8_t v[4]; le32(v, value); return tlv(p, type, v, sizeof(v));
}
static uint8_t *tlv_array16(uint8_t *p, uint8_t type, const uint8_t *data, uint16_t len) {
    *p++ = type; le16(p, len + 2); p += 2; le16(p, len); p += 2; memcpy(p, data, len); return p + len;
}
static int transact(int fd, const struct sockaddr_qrtr *server, uint16_t txn,
                    uint16_t msg, const uint8_t *body, size_t body_len) {
    uint8_t packet[CHUNK + 128], reply[256];
    if (body_len + 7 > sizeof(packet)) return -EMSGSIZE;
    packet[0] = 0; le16(packet + 1, txn); le16(packet + 3, msg); le16(packet + 5, body_len);
    memcpy(packet + 7, body, body_len);
    if (sendto(fd, packet, body_len + 7, 0, (const struct sockaddr *)server, sizeof(*server)) < 0) return -errno;
    ssize_t n = recv(fd, reply, sizeof(reply), 0);
    if (n < 0) return -errno;
    if (n < 14 || reply[0] != 2 || get16(reply + 1) != txn || get16(reply + 3) != msg) return -EPROTO;
    size_t off = 7;
    while (off + 3 <= (size_t)n) {
        uint8_t type = reply[off]; uint16_t len = get16(reply + off + 1); off += 3;
        if (off + len > (size_t)n) return -EPROTO;
        if (type == 2 && len == 4) {
            uint16_t result = get16(reply + off), error = get16(reply + off + 2);
            if (result) { fprintf(stderr, "QMI message 0x%04x failed: result=%u error=%u\n", msg, result, error); return -EREMOTEIO; }
            return 0;
        }
        off += len;
    }
    return -EPROTO;
}
int main(int argc, char **argv) {
    if (argc != 5) { fprintf(stderr, "usage: %s NODE PORT FILE_ID BDF_FILE\n", argv[0]); return 2; }
    uint32_t node = strtoul(argv[1], NULL, 0), port = strtoul(argv[2], NULL, 0);
    uint32_t file_id = strtoul(argv[3], NULL, 0);
    FILE *f = fopen(argv[4], "rb");
    if (!f) { perror(argv[4]); return 1; }
    if (fseek(f, 0, SEEK_END) || ftell(f) < 0) { perror("size"); return 1; }
    size_t size = ftell(f); rewind(f);
    uint8_t *data = malloc(size);
    if (!data || fread(data, 1, size, f) != size) { perror("read"); return 1; }
    fclose(f);
    int fd = socket(AF_QIPCRTR, SOCK_DGRAM, 0);
    if (fd < 0) { perror("socket(AF_QIPCRTR)"); return 1; }
    struct timeval timeout = { .tv_sec = 10 };
    setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));
    struct sockaddr_qrtr server = { .sq_family = AF_QIPCRTR, .sq_node = node, .sq_port = port };
    uint16_t txn = 1; uint32_t seg = 0; size_t off = 0;
    while (off < size) {
        size_t count = size - off > CHUNK ? CHUNK : size - off;
        uint8_t body[CHUNK + 64], one = 1, bdf_type = 1;
        uint8_t end = off + count == size;
        uint8_t *p = body;
        p = tlv(p, 0x01, &one, 1);
        p = tlv_u32(p, 0x10, file_id);
        /* WLFW validates the final segment against the original file size. */
        p = tlv_u32(p, 0x11, size);
        p = tlv_u32(p, 0x12, seg);
        p = tlv_array16(p, 0x13, data + off, count);
        p = tlv(p, 0x14, &end, 1);
        p = tlv(p, 0x15, &bdf_type, 1);
        int rc = transact(fd, &server, txn++, BDF_MSG, body, p - body);
        if (rc) { fprintf(stderr, "BDF segment %u: %s\n", seg, strerror(-rc)); return 1; }
        off += count; seg++; fprintf(stderr, "BDF %zu/%zu\n", off, size);
    }
    uint8_t report[4], count = 0;
    uint8_t *p = tlv(report, 0x01, &count, 1);
    int rc = transact(fd, &server, txn, CAL_REPORT_MSG, report, p - report);
    if (rc) { fprintf(stderr, "cal report: %s\n", strerror(-rc)); return 1; }
    fprintf(stderr, "BDF and calibration report accepted\n");
    return 0;
}
