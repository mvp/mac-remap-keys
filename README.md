Remap keys on Mac keyboard
==========================

Remap keys on Mac internal or external keyboards using only MacOS tools.

This is most useful when you have US international or European keyboard,
and want to have `` ` `` (backtick) key to work under `Esc` key
as it does on US keyboard.

This has been tested to work on MacOS 11.x to 15.x.

Installation
============
1. Copy provided file `com.github.mvp.mac-remap-keys.plist` to `~/Library/LaunchAgents`,
or run these commands in terminal:

```
git clone https://github.com/mvp/mac-remap-keys
cd mac-remap-keys
make install
```
2. (MacOS 14.x+ only):
  Open `System Settings` -> `Privacy & Security` -> `Input monitoring` -> `+`.
  Press `Shift+Command+.`, browse to `/usr/bin/hidutil` and click `Open`,
  make sure that `hidutil` is enabled in Input Monitoring list.
3. Restart your Mac, check that keys are now swapped.

If you want to uninstall, delete file `~/Library/LaunchAgents/com.github.mvp.mac-remap-keys.plist` or run `make uninstall` and restart.

Configuration
=============
  If you want different remapping, simply edit \*.plist file as needed.
This Apple [document](https://developer.apple.com/library/archive/technotes/tn2450)
provided full table of all known key codes (Usage IDs).
To make them work for `hidutil`, simply add `0x700000000` to code in that table.

If you want to remap only external keyboard but not internal one
(or other way around), use `--matching` filter rules.
Tip: use `hidutil list` to see all connected devices and their properties.

Filtering examples:

To remap only for internal keyboard:
```
{
  "Built-In":  1,
  "Transport": "FIFO"
}
```

To remap only for external keyboard by vendor/product ID:
```
{
  "VendorID":  0x046d,
  "ProductID": 0xb366
}
```

Copyright
=========
Copyright (C) 2025 Vadim Mikhailov

This file can be distributed under the terms and conditions of the
GNU General Public License version 2.
