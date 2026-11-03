# Nura aports repository

This repository contains the APKBUILD files for Nura-specific packages, along with the required patches and scripts, if any.

There are many more packages defined in the [Alpine Linux aports](https://gitlab.alpinelinux.org/alpine/aports/) on which these packages depend.

Helpful resources:

* [Issues](https://gitlab.postmarketos.org/postmarketOS/pmaports/-/work_items)
* [How to create a package](https://wiki.nura.eco/wiki/Create_a_package)
* [APKBUILD reference](https://wiki.alpinelinux.org/wiki/APKBUILD_Reference)
* [pmaports commit style](./COMMITSTYLE.md)
* [Approval rules](docs/merge-requests/approval-rules.md)
* [Alpine Linux aports](https://gitlab.alpinelinux.org/alpine/aports/)
* [Alpine Linux package search](https://pkgs.alpinelinux.org/packages)
* [postmarketOS package search](https://pkgs.nura.eco/packages)

## OnePlus Nord N100 (`billie2`) port status

The default graphical session boots to Phrog/Phosh with Pixman software
rendering. A side-by-side Ubuntu Touch Halium/libhybris/Mir path initializes
the Adreno 610 through HWC2 and renders a visible Wayland client on the
physical display, but is not yet the default session. Native internal-speaker
audio starts automatically through OpenRC and works through the physical
WCD937x codec, Bengal ALSA card, PulseAudio, and OS sound settings. Native
Wi-Fi reaches WLFW `FW_READY`, creates `wlan0`, scans and associates, receives
DHCP configuration, and passes traffic. WLAN IPA packet offload is disabled
because the downstream association offload path froze the phone; the OpenRC
service also remains disabled while boot ordering is stabilized.

- [`HARDWARE-STATUS.txt`](./HARDWARE-STATUS.txt): current component matrix.
- [`GPU-STATUS.txt`](./GPU-STATUS.txt): evidence, exact versions, risks, and next step.
- [`gpu/halium/README.txt`](./gpu/halium/README.txt): reproducible GPU smoke setup.
- [`audio/billie2-audio-smoke`](./audio/billie2-audio-smoke): reproducible
  WCD937x/ADSP/ALSA startup and speaker route used by the OpenRC service.
- [`wifi/billie2-wifi-start`](./wifi/billie2-wifi-start): proven native IPA,
  modem WLAN PD, BDF/calibration, and qcacld startup sequence.
- [`archive/`](./archive/): known-good images and historical checkpoints.


## Git Hooks

You can find some useful git hooks in the `.githooks` directory.
To use them, run the following command after cloning this repository:

```sh
git config --local core.hooksPath .githooks
```
