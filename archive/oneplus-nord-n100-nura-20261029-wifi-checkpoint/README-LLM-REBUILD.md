# Nura / postmarketOS port archive: OnePlus Nord N100 (billie2)

## Purpose

This folder is a known-working checkpoint for the OnePlus Nord N100 Nura/postmarketOS port. It is intended for a future engineer or LLM to restore the tested build first, then continue development without repeating the hardware bring-up investigation.

Date archived: 2026-10-28
Device: OnePlus Nord N100, codename `billie2`, fastboot product `bengal`
Kernel ABI: `4.19.95-perf+`
UI: Phosh with Phrog/greetd and Squeekboard
Test account: `nura` / `nura`

## Verified behavior at this checkpoint

Verified on the physical N100:

1. The phone boots unattended to the graphical Phrog login.
2. Touch works at the login screen.
3. Squeekboard appears for credential entry.
4. Logging in as `nura` reaches the Phosh home screen.
5. Touch, swipes, and the app drawer work after the greeter-to-user-session handoff.
6. USB networking and SSH work at `172.16.42.1` when the host is configured as `172.16.42.2/24`.

This checkpoint is not a claim that every phone subsystem works. Calls, modem data, cameras, suspend, audio routing, GPS, Bluetooth, and long-duration power behavior still require explicit testing.

## Archive layout

- `images/rootfs.img`: final tested ext4 userdata/root filesystem image. Original working name: `/tmp/nura-billie2-phosh-rootfs-v5.img`.
- `images/boot.img`: known-good boot image using the UBports downstream kernel. Original working name: `/tmp/nura-billie2-clean-boot.img`.
- `sources/device/device-oneplus-billie2-downstream/`: exact device package files used at this checkpoint.
- `sources/device/linux-oneplus-billie2-downstream/`: kernel package metadata and source recipe.
- `live-state/apk-world.txt`: requested packages from the running device.
- `live-state/apk-packages.txt`: complete installed package/version list from the tested device.
- `live-state/system.txt`: kernel, command line, and OS release captured from the tested device.
- `SHA256SUMS`: integrity hashes for every archived file except `SHA256SUMS` itself.

## Fastest exact restoration

Put the N100 in fastboot mode and verify that it identifies as `bengal`:

```sh
fastboot devices
fastboot getvar product
```

Then flash the archived checkpoint:

```sh
fastboot flash boot images/boot.img
fastboot flash userdata images/rootfs.img
fastboot reboot
```

If the device uses an explicitly selected slot and `fastboot flash boot` does not target it, inspect the active slot first and flash the corresponding `boot_a` or `boot_b`. Do not flash unrelated Android partitions.

The first boot can remain on the unlocked-bootloader warning and progress spinner for several minutes. USB Ethernet can enumerate with a new host interface name on each boot. A working NetworkManager host profile used:

```sh
nmcli connection modify nura-n100-usb connection.interface-name <new-enx-interface>
nmcli connection up nura-n100-usb
ping 172.16.42.1
```

SSH credentials:

```text
host: 172.16.42.1
user: nura
password: nura
```

## Hardware and graphical fixes that must not be lost

### Known-good downstream kernel

The runtime-working kernel is the exact UBports-derived `4.19.95-perf+` binary in `images/boot.img`. Rebuilding the same source with an arbitrary host Clang produced Qualcomm CrashDump during this port. Treat compiler version, linker, config, DTB, DTBO, and kernel ABI as a single compatibility unit.

The device package uses the UBports adaptation commit:

```text
3ed93c9d8bf0808cdce1d7d9ec5eb4536c26ff3d
```

The matching `nord_n100.dtb` and `dtbo.img` are referenced by the archived APKBUILD.

### Root filesystem boot

A non-empty `/etc/fstab` is required. The Android camera devices caused udev `v4l_id` workers to prevent normal boot settling, so the device package supplies a no-op `udev-settle` OpenRC service and configuration.

### Downstream DRM renderer

Current Mesa/Freedreno cannot initialize EGL on this downstream DRM implementation. Both the greeter and authenticated Phosh session must use:

```text
WLR_RENDERER=pixman
```

The greeter receives this through `greetd-config.toml`. The authenticated session uses the higher-priority `/usr/local/share/wayland-sessions/phosh.desktop` installed from `phosh-billie2.desktop`. Removing the latter causes authentication to open a PAM session briefly, fail renderer startup, and return to the greeter.

The internal panel is `DSI-1`, 720x1600, and uses scale 2 from `phoc.ini`.

### GPU bring-up result after this checkpoint

`GPU-STATUS.txt` records the complete 2026-10-29 GPU investigation and exact
reproduction commands. Hardware acceleration is only partial:

- A custom Mesa 26.2.5 Turnip build using the KGSL KMD opens
  `/dev/kgsl-3d0` and identifies the physical `Adreno 610`.
- This requires the vendor `a630_sqe.fw` firmware and access to the KGSL and
  ION devices.
- EGL/GLES does not initialize through this KGSL build on Linux/musl.
- Phoc's wlroots Vulkan renderer requires a display DRM FD corresponding to
  the Vulkan device; Turnip is on KGSL while display scanout is on the old
  downstream `msm_drm` device.
- A Wayland `vkcube` selects the Adreno hardware but cannot present through
  the Pixman compositor.

Do not remove `WLR_RENDERER=pixman`. The successful Vulkan enumeration proves
the GPU and firmware path, not an accelerated login or Phosh session. Ubuntu
Touch instead uses Android EGL/gralloc/KGSL through libhybris and Mir in a
glibc/Halium environment. That stack is not a drop-in wlroots GBM backend.

### Linux 4.19 Bubblewrap compatibility

The current Bubblewrap build uses a kernel operation unavailable on 4.19 and fails with:

```text
bwrap: Can't open source /: Function not implemented
```

`bwrap-4.19` is Bubblewrap 0.12.0 from Alpine v3.21 and is installed as `/usr/local/bin/bwrap`, ahead of `/usr/bin` in the graphical session PATH.

### Phrog / libphosh AppStream crash

Phrog linked against `libphosh-0.45.so.0` crashed with status 139 while loading the asynchronous AppStream metainfo cache on this 4.19 userspace/kernel combination. The last messages included `faccessat doesn't support supplied flags` and a corrupted metainfo-pool error string.

`libphosh-4.19.so` is the tested compatibility binary. It is the installed libphosh binary with the tail branch to `as_pool_load_async@plt` at virtual/file offset `0xC3220` replaced by an AArch64 `ret` instruction:

```text
before: d8 74 fd 17
 after: c0 03 5f d6
```

This is intentionally version-specific. Do not apply that byte offset to a different libphosh build. For a maintainable future fix, patch the matching libphosh source to skip or synchronously guard `as_pool_load_async` on this platform, rebuild it, and repeat the full login test.

### D-Bus activation helper ownership

`/usr/libexec/dbus-daemon-launch-helper` must be:

```text
owner root
 group messagebus (GID 102 in this image)
 mode 04750
```

Incorrect ownership prevents AccountsService activation and leaves the greeter unusable.

### Touchscreen resume

The OnePlus touchscreen driver suspends on Qualcomm DRM blank notifications, while this Phoc/downstream-DRM combination misses the matching unblank notification. Symptoms are a rendered UI with no touch events. The kernel logs show `tp_suspend`, and injecting `MSM_DRM_BLANK_UNBLANK` calls `tp_resume` and restores touch.

The archive contains:

- `billie2-touch-resume.ko`: module built against the exact `4.19.95-perf+` ABI and Module.symvers.
- `billie2-touch-resume`: helper that waits for any `phoc` process and retriggers the module every 15 seconds.
- `billie2-touch-resume.initd`: persistent OpenRC service.
- `device-oneplus-billie2-downstream-phosh.post-install`: adds `greetd` to the `input` group.

The helper monitors `phoc`, not `phrog`. This is essential: Phrog exits during login, and a Phrog-scoped helper previously stopped exactly during the handoff and left the returned greeter or user session without touch.

The module calls the exported `msm_drm_notifier_call_chain` twice with `MSM_DRM_BLANK_UNBLANK`: early blank and regular blank. The kernel is expected to report an out-of-tree/signature taint when loading it.

## Rebuilding rather than restoring the image

Use the archived pmaports package directories as the authoritative device-specific input. The root image was assembled from postmarketOS/Alpine packages and then validated directly on hardware; it was not produced by a single preserved one-command build script. Therefore, use the archived image as the behavioral oracle when reconstructing an automated build.

Recommended reconstruction sequence:

1. Start from the same postmarketOS package generation listed in `live-state/apk-packages.txt`.
2. Install the requested world from `live-state/apk-world.txt` into an aarch64 root.
3. Install `postmarketos-ui-phosh`, greetd/Phrog, Squeekboard, OpenRC, SSH, NetworkManager, and the archived device/kernel packages.
4. Create user `nura` with UID 10000 and groups `wheel,audio,input,video,netdev,plugdev,feedbackd`; set its password to `nura` for checkpoint equivalence.
5. Ensure `greetd` belongs to `input` and `video`.
6. Preserve the D-Bus helper owner/group/mode described above.
7. Enable `greetd`, `udev-settle`, and `billie2-touch-resume` in the default OpenRC runlevel.
8. Create a 2,621,440,000-byte ext4 image labeled `pmOS_root`, populate it with correct numeric ownership, and run `e2fsck -fy`.
9. Use the archived boot image until the downstream kernel has been reproduced with its matching Android/UBports toolchain.
10. Flash, then verify the complete sequence: cold boot -> login UI -> touch -> keyboard -> authenticate -> stable Phosh home -> touch/swipes after handoff.

Do not accept process presence or a test suite as proof. The physical display and touchscreen are the acceptance surface.

## Useful diagnostics

Graphical processes:

```sh
ps -ef | grep -E 'greetd|phoc|phrog|phosh|gnome-session'
```

OpenRC services:

```sh
rc-status default
rc-service greetd status
rc-service billie2-touch-resume status
```

Touchscreen state and notifier evidence:

```sh
cat /proc/touchpanel/irq_depth
dmesg | grep -E 'tp_suspend|tp_resume|fb_notifier_callback'
lsmod | grep billie2_touch_resume
```

Graphical logs:

```sh
logread | grep -E 'greetd|phrog|phosh|phoc|renderer|AppStream|metainfo'
```

A failed authenticated session that returns immediately to login usually means the user Phosh session did not receive `WLR_RENDERER=pixman`. A visible login with no touch usually means either `greetd` lacks the `input` group or the DRM unblank notifier module/helper is not active.

## Current development debt

1. Replace the binary libphosh patch with a source-level compatibility fix.
2. Reproduce the UBports kernel using its exact compiler/toolchain and remove reliance on the archived binary boot image.
3. Replace periodic touchscreen notifier injection with a correct downstream DRM/Phoc unblank notification fix.
4. Turn the manually validated root-image assembly into a deterministic pmbootstrap build.
5. Change the checkpoint password before using the device with sensitive data or exposing SSH beyond the private USB link.
