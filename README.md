## Overview

This is a collection of scripts that are used to build a Ubuntu 20.04 preinstalled desktop/server image for the [Honeycomb LX2K](https://www.solid-run.com/arm-servers-networking-platforms/honeycomb-lx2/#overview) from Solid-Run.

![Honeycomb LX2K](https://www.solid-run.com/wp-content/uploads/2020/07/HoneyComb-LX-2K-sideways-large-300x184.png)

## Recommended Hardware

To setup the build environment for the Ubuntu 20.04 image creation, a Linux host with the following configuration is recommended. A host machine with adequate processing power and disk space is ideal as the build process can be severial gigabytes in size and can take alot of time.

* Intel Core i7 CPU (>= 8 cores)
* Strong internet connection
* 30 GB free disk space
* 16 GB RAM

## Requirements

Please install the below packages on your host machine:

```
sudo apt-get install -y build-essential gcc-aarch64-linux-gnu bison \
qemu-user-static qemu-system-arm qemu-efi u-boot-tools binfmt-support \
debootstrap flex libssl-dev bc rsync kmod cpio xz-utils fakeroot parted \
udev dosfstools
```

## Building

To checkout the source and build:

```
git clone https://github.com/Joshua-Riek/ubuntu-honeycomb-lx2k.git
cd ubuntu-honeycomb-lx2k
sudo ./build.sh
```

## Virtual Machine

To run the Ubuntu 20.04 preinstalled image in a virtual machine:

```
sudo ./qemu.sh images/ubuntu-20.04-preinstalled-server-arm64-honeycomb.img.xz
```

## Flash Removable Media

To flash the Ubuntu 20.04 preinstalled image to removable media:

```
xz -dc images/ubuntu-20.04-preinstalled-server-arm64-honeycomb.img.xz | sudo dd of=/dev/sdX bs=4k
```

> This assumes that the removable media is added as /dev/sdX and all it’s partitions are unmounted.
