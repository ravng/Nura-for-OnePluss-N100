ONEPLUS NORD N100 GPU HALIUM/MIR HANDOFF
========================================
Verified: 2026-10-29 on the physical billie2

PURPOSE
-------
This directory reproduces the first working accelerated display path for Nura
on the N100. It runs the Ubuntu Touch glibc/Halium/libhybris/Mir stack beside
the normal Alpine/musl Pixman session. It does not replace the default root.

SOURCE ARTIFACT
---------------
UBports GitLab project: porting/community/device-oneplus-billie2
Project ID: 53424424
Commit: 3ed93c9d8bf0808cdce1d7d9ec5eb4536c26ff3d
Pipeline: 2853926385
Build job: 16533298559
Devel-flashable job: 16533298561

The devel-flashable artifact contains ubuntu.img.zst. Decompress it to
/home/nura/ut-gpu/ubuntu.img on the phone. The tested image is approximately
3.0 GB after decompression.

SIDE-BY-SIDE MOUNTS
-------------------
Run as root on the phone. Re-running mount commands may report already mounted;
verify with mountpoint instead of stacking duplicate mounts.

  mkdir -p /opt/ut-root
  mount -o loop,rw /home/nura/ut-gpu/ubuntu.img /opt/ut-root
  mount --rbind /dev /opt/ut-root/dev
  mount --make-rslave /opt/ut-root/dev
  mount --rbind /proc /opt/ut-root/proc
  mount --make-rslave /opt/ut-root/proc
  mount --rbind /sys /opt/ut-root/sys
  mount --make-rslave /opt/ut-root/sys
  mount -t tmpfs tmpfs /opt/ut-root/run

Use Ubuntu Touch's own mount helpers:

  chroot /opt/ut-root /usr/libexec/lxc-android-config/mount-android-system
  chroot /opt/ut-root /usr/libexec/lxc-android-config/mount-android-partitions
  chroot /opt/ut-root /usr/libexec/lxc-android-config/mount-halium-overlay

Required final mountpoints include /opt/ut-root/android and the host /vendor
partition under that Android root. The launcher refuses to run when required
mounts or vendor/lib64/egl/libEGL_adreno.so are absent.

EXACT MIR DEMO PACKAGE
----------------------
The compositor executable must match the installed UBports Mir 1.8.2 ABI.
Ubuntu Focal's mir-demos 1.7.1 starts but segfaults with status 139 when a
client connects.

URL:
  http://repo.ubports.com/pool/main/m/mir/mir-demos_1.8.2+ubports-0ubports1~20250430113019.9~408c596+ubports20.04_arm64.deb
SHA-256:
  d71295ce5ce4119e170c3381d3237ebb1063b64efc851a7074332d52403c38f4

Install inside the staged root:

  cp mir-demos_*.deb /opt/ut-root/tmp/mir-demos.deb
  chroot /opt/ut-root dpkg -i /tmp/mir-demos.deb

VISIBLE AND TOUCH CLIENTS
-------------------------
weston-simple-shm is taken from:
  https://ports.ubuntu.com/ubuntu-ports/pool/universe/w/weston/weston_8.0.0-1_arm64.deb

Extract the package and install usr/bin/weston-simple-shm and
usr/bin/weston-simple-touch into /opt/ut-root/usr/bin. Their direct
dependencies, libc.so.6 and libwayland-client.so.0, already exist in the
Ubuntu root.

RUN
---
Copy all five executable files in this directory to one directory on the
phone. From that directory:

  sudo ./mir-hwc-smoke
  sudo ./mir-hwc-smoke ./mir-visible-smoke-inner
  sudo ./mir-touch-smoke 45

The first command asserts HWC2 and Adreno ES 3.2 initialization. The second
shows weston-simple-shm for five seconds using miral-kiosk and then prints:

  PASS: visible Wayland SHM client remained on the Adreno-backed display for 5 seconds

The outer launcher starts Android LXC, stops greetd only after LXC is running,
and uses a trap to stop LXC and restart greetd on every exit path. SSH remains
available. A successful cleanup leaves greetd STARTED and Android LXC STOPPED.

The touch launcher also keeps billie2_touch_resume active while Phoc is
stopped, binds the host udev database into the Ubuntu root, and waits until
Mir registers /dev/input/event1 before asking for physical input. It passes
only after Mir logs EV_ABS coordinate events.

CURRENT TOUCH RESULT
--------------------
Accelerated touch is not working. Mir 1.8.2 registers event1, but physical
taps and drags produce only EV_SYN frames and no EV_ABS coordinates. The
weston-simple-touch surface is black; Mir's software cursor is a gray square
at the top-left. Working touch would draw small colored crosses along each
finger path.

The physical no-response test still proved recovery: cleanup stopped Android
LXC, removed the temporary /run/udev bind, restarted greetd and the existing
touch-resume helper, and returned to the Pixman login. Do not treat event1
registration alone as a touch milestone.

PROVEN GRAPHICS EVIDENCE
------------------------
- Selected driver: ubports:android2 1.8.0
- HWC version 2.0
- EGL vendor: Android
- GL vendor: Qualcomm
- GL renderer: Adreno (TM) 610
- GL version: OpenGL ES 3.2
- Internal display: 720x1600, approximately 90 Hz
- Visible Wayland SHM client stable for the five-second probe

WHY OVERLAYS ARE DISABLED
-------------------------
The visible probe passes --disable-overlays=on. This forces the client surface
through Mir's Adreno GL compositor rather than allowing HWC direct scanout.
This makes the GPU-composition assertion meaningful.

NON-FATAL WARNINGS
------------------
eglSubDriverAndroid.so, libadreno_app_profiles.so, and libminisf.so may be
reported missing. Do not suppress them. The tested path initializes EGL,
OpenGL ES 3.2, HWC2, physical display composition, and the visible client after
those warnings.

SAFETY
------
The Android init starts multiple vendor services, including modem and Wi-Fi
services. Keep tests short until service isolation is packaged. Before each LXC
start the launcher removes stale /dev/__properties__/* and /dev/socket/*;
without this, Android init enters a reboot loop. Preserve the Pixman session as
the default recovery path.

NEXT STEP
---------
Package this exact runtime as a separate accelerated login session. Do not
remove Pixman until accelerated login, touch, lock/unlock, repeated app launch,
suspend/resume, and recovery have all been demonstrated on the physical phone.
