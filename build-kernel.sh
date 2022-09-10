#!/bin/bash

set -eE 
trap 'echo Error: in $0 on line $LINENO' ERR

if [ "$(id -u)" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

#cd "$(dirname -- "$(readlink -f -- "$0")")" && cd ..
mkdir -p build && cd build

# Download solidrun build scripts
if [ ! -d lx2160a_build ]; then
    git clone --depth=1 --progress -b master https://github.com/SolidRun/lx2160a_build.git
fi

# Download the solidrun linux kernel source
if [ ! -d linux ]; then
    git clone --depth=1 --progress -b LSDK-21.08 https://source.codeaurora.org/external/qoriq/qoriq-components/linux
fi
cd linux

# Apply git patch if not already applied
for patch in ../lx2160a_build/patches/linux-LSDK-21.08/*.patch; do
    if git apply --check "${patch}" > /dev/null 2>&1; then
        git apply "${patch}"
    fi
done

# Merge the honeycomb lx2k configs into the defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- ./scripts/kconfig/merge_config.sh arch/arm64/configs/defconfig arch/arm64/configs/lsdk.config ../lx2160a_build/configs/linux/lx2k_additions.config

# Currently the device tree from linux-5.15.y-cex7 does not seem to work
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j "$(nproc)" dtbs
cd ..

# Download generic kernel config
if [ ! -f config-5.15.0-41-generic ]; then
    mkdir -p /tmp/deb
    wget -nc http://ports.ubuntu.com/ubuntu-ports/pool/main/l/linux-hwe-5.15/linux-modules-5.15.0-41-generic_5.15.0-41.44~20.04.1_arm64.deb -P /tmp/deb 
    dpkg -x /tmp/deb/linux-modules-5.15.0-41-generic_5.15.0-41.44~20.04.1_arm64.deb /tmp/deb
    cp /tmp/deb/boot/config-5.15.0-41-generic .
fi

# Download the solidrun linux kernel source
if [ ! -d linux-stable ]; then
    git clone --depth=1 --progress -b linux-5.15.y-cex7 https://github.com/SolidRun/linux-stable.git
fi
cd linux-stable

# Apply git patch if not already applied
if git apply --check ../../patch/0001-spi-nor-shift-out-of-bounds-fix.patch > /dev/null 2>&1; then
    git apply ../../patch/0001-spi-nor-shift-out-of-bounds-fix.patch
fi

# Set kernel config
cp ../config-5.15.0-41-generic .config
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- olddefconfig

# Disable debug info and remove Debian keys
./scripts/config --set-str CONFIG_SYSTEM_TRUSTED_KEYS ""
./scripts/config --set-str CONFIG_SYSTEM_REVOCATION_KEYS ""
./scripts/config --set-str CONFIG_MODULE_SIG_KEY ""
./scripts/config --disable CONFIG_MODULE_SIG_FORMAT
./scripts/config --disable CONFIG_MODULE_SIG_ALL
./scripts/config --disable CONFIG_MODULE_SIG
./scripts/config --disable CONFIG_DEBUG_INFO

# Temp workaround for network drivers
./scripts/config --enable CONFIG_FIXED_PHY
./scripts/config --enable CONFIG_OF_MDIO
./scripts/config --enable CONFIG_ACPI_MDIO
./scripts/config --enable CONFIG_PHYLIB

# Enable on-board NICs
./scripts/config --enable CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
./scripts/config --enable CONFIG_FSL_MC_UAPI_SUPPORT

# Set custom kernel version
./scripts/config --enable CONFIG_LOCALVERSION_AUTO
echo "-honeycomb-lx2k" > .scmversion
echo "0" > .version

# Compile kernel into deb package
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j "$(nproc)"
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j "$(nproc)" bindeb-pkg
