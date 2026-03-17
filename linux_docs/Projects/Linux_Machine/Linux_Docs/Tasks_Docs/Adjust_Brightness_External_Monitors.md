### Goal: To adjust the brightness on my external monitors
##### Context:
- Current monitors connected over display port cables to my dock
- Dock plugged in to my laptop over USB-C
- Package installed that could be a solution:
```bash
~ ❯ pacman -Qi ddcutil
Name            : ddcutil
Version         : 2.2.5-2
Description     : Query and change Linux monitor settings using DDC/CI and USB.
Architecture    : x86_64
URL             : http://ddcutil.com/
Licenses        : GPL-2.0-or-later
Groups          : None
Provides        : None
Depends On      : gcc-libs  glibc  glib2  i2c-tools  libusb  libdrm  jansson  libx11  libxext  libxrandr  systemd-libs
Optional Deps   : None
Required By     : None
Optional For    : fastfetch
Conflicts With  : None
Replaces        : None
Installed Size  : 2.38 MiB
Packager        : Christian Heusel <gromit@archlinux.org>
Build Date      : Mon 09 Feb 2026 01:47:45 PM CET
Install Date    : Thu 26 Feb 2026 01:31:48 PM CET
Install Reason  : Explicitly installed
Install Script  : No
Validated By    : Signature
```