# Unwired One gpio example

This repository is based on the gpio example from [Working with GPIOs (C/C++)][1] on the Unwired One wiki.

This program blinks gpio pin 27, which is also the onboard LED, on and off every second.

## Compiling

To setup a build environment to build for the Unwired One see [C/C++ Building Environment][2] on the Unwired One wiki.

When you have a working installation, place this repository in the `openwrt/package` folder or create a symlink to this repository in that folder.

Create a `.ipk` file by running

```bash
# make package/unwired-gpio/{prepare,compile}
```

from the `openwrt` folder.

You can find the `unwired-gpio_1_ar71xx.ipk` file in the `bin/ar71xx/packages/base/` folder, copy this file to your Unwired One and install it with

```bash
# opkg install unwired-gpio_1_ar71xx.ipk
```


[1]: hhttp://www.unwireddevices.com/wiki/index.php/Working_with_GPIOs_(C/C%2B%2B)
[2]: http://www.unwireddevices.com/wiki/index.php/C/C%2B%2B_Building_Environment