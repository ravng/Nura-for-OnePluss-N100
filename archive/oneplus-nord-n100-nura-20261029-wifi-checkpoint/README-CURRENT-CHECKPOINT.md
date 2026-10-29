# OnePlus Nord N100 Nura checkpoint — 2026-10-29

This is a self-contained checkpoint of the current OnePlus Nord N100 (`billie2`, fastboot product `bengal`) port before further hardware work.

## Recommended recovery baseline

Use:

- `images/boot.img` — known-good UBports-derived downstream boot image.
- `images/rootfs.img` — known-good graphical root image from the 2026-10-28 checkpoint.

This pair has physically demonstrated:

- boot to graphical Phrog login;
- login to Phosh as `nura`;
- display and software-rendered UI;
- touchscreen through the archived resume workaround;
- USB Ethernet and SSH at `172.16.42.1` after configuring the host as `172.16.42.2/24`.

The checkpoint credentials are username `nura`, password `nura`. Change them before exposing the device beyond the private USB link.

## Current experimental root image

`images/rootfs-wifi-checkpoint.img` is a clone of the known-good root image with the current Wi-Fi investigation files installed:

- `/usr/local/sbin/qrtr-ns`
- `/usr/local/sbin/pd-mapper`
- `/usr/local/sbin/rmtfs-downstream`
- `/usr/local/sbin/tqftpserv-downstream`
- `/usr/local/sbin/billie2-wifi-start`
- `/usr/local/lib/icnss_quirk_override.ko`
- `/usr/local/lib/qca_cld3_wlan_smmu.ko`
- `/etc/init.d/billie2-wifi`

The Wi-Fi service is intentionally **not linked into an OpenRC runlevel**. Do not enable it at boot: WLAN initialization remains incomplete, and bad modem/WLAN startup ordering previously caused Qualcomm CrashDump.

The locally rebuilt `qca_cld3_wlan_smmu.ko` and `icnss_quirk_override.ko` are diagnostic artifacts, not production fixes. Use the stock `/vendor/lib/modules/qca_cld3_wlan.ko` for normal work.

The experimental root image was checked with `e2fsck -fy` after construction.

## Wi-Fi status

Read `WIFI-HANDOFF-2026-10-29.txt` completely before continuing.

Verified progress:

1. Legacy `qrtr-ns` provides the namespace required by the downstream kernel.
2. Patched `rmtfs` supports `/dev/subsys_modem` when `/sys/class/remoteproc` is absent.
3. Legacy `pd-mapper` registers `msm/modem/wlan_pd` from the stock JSON maps.
4. Patched `tqftpserv` serves all 3,892,648 bytes of `wlanmdsp.mbn`.
5. QRTR WLFW service 69 appears.
6. ICNSS completes indication registration, MSA setup, MSA-ready indication, and capability query.
7. Loading `ipa_fws.mdt` through `/dev/ipa`, as done by Ubuntu Touch, brings IPA firmware out of reset, creates `rmnet_ipa0`, and fixes the IPA/WLAN SMMU mismatch.

Remaining blocker:

- WLAN firmware never emits `QMI_WLFW_FW_READY_IND`.
- Consequently there is no `wlan0`, AP scan, association, or Wi-Fi traffic.
- Forcing `SKIP_QMI` is invalid: the firmware rejects the premature config request with QMI error 90 and BMI times out.

## Hardware status

Working or demonstrated:

- graphical boot and login;
- display;
- touch through the resume workaround;
- volume-up, volume-down, and power/wake buttons;
- internal root storage;
- USB Ethernet and SSH.

Partial:

- modem firmware, QRTR, QMI enumeration, rmtfs, and IPA firmware;
- charging/battery detection;
- Wi-Fi transport and ICNSS handshake before FW_READY.

Not demonstrated:

- Wi-Fi interface/scan/association;
- SIM registration, calls, SMS, or mobile data;
- audio routing;
- Bluetooth;
- cameras;
- GPS/GNSS;
- sensors, fingerprint, NFC, microSD, haptics, LEDs, or flashlight;
- suspend/resume and long-duration power behavior;
- GPU acceleration, hardware video decode, MTP, or USB host mode.

## Archive contents

- `images/`: known-good boot/root images plus the experimental Wi-Fi root image.
- `sources/device/`: current billie2 device and kernel package recipes.
- `wifi-artifacts/bin/`: exact binaries copied from the live phone plus diagnostic modules.
- `wifi-artifacts/source/`: qrtr, pd-mapper, rmtfs, tqftpserv, module source, kernel config, Module.symvers, and diagnostic kernel diff.
- `wifi-artifacts/device-overlay/`: exact live startup and OpenRC files.
- `live-state/`: package inventory, system state, and live Wi-Fi file hashes.
- `WIFI-SOURCE-PATCHES.txt`: source-level changes to the native Qualcomm service tools.
- `HARDWARE-STATUS.txt`: current component-by-component progress reference.
- `SHA256SUMS-CURRENT`: checksums for this checkpoint.

## Recovery procedure

Transient recovery boot, preferred while experimenting:

```sh
fastboot boot images/boot.img
```

Restoring userdata is destructive. Only do this when intentionally replacing the device filesystem:

```sh
fastboot flash userdata images/rootfs.img
fastboot boot images/boot.img
```

Use `rootfs-wifi-checkpoint.img` instead of `rootfs.img` only when the archived experimental files are required. The service remains disabled and must be started manually.

After boot, USB Ethernet may enumerate with a new host interface name:

```sh
nmcli connection modify nura-n100-usb connection.interface-name <enx-interface>
nmcli connection up nura-n100-usb
ssh nura@172.16.42.1
```

## Safety

- Never boot `nura-billie2-no-rejuvenation.img`; that rebuilt kernel entered CrashDump.
- Never unload a partially initialized WLAN module live; an earlier `rmmod` caused a kernel Oops.
- Reboot between WLAN module experiments.
- Keep fastboot recovery available.
- Do not enable `billie2-wifi` automatically until `FW_READY`, `wlan0`, AP scanning, association, and real traffic are proven.
