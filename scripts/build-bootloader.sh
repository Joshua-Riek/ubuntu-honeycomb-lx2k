#!/bin/bash

set -eE 
trap 'echo Error: in $0 on line $LINENO' ERR

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

cd "$(dirname -- "$(readlink -f -- "$0")")" && cd ..
mkdir -p build && cd build

# Download solidrun build scripts
if [ ! -d lx2160a_build ]; then
    git clone --depth=1 --progress -b master https://github.com/SolidRun/lx2160a_build.git
fi

# Download the MC firmware
if [ ! -d qoriq-mc-binary ]; then
	git clone --depth=1 --progress -b LSDK-21.08 https://github.com/NXP/qoriq-mc-binary.git
fi

# Download and build the RCW
if [ ! -d rcw ]; then
    git clone --depth=1 --progress -b LSDK-21.08 https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
fi
cd rcw

# Apply git patch if not already applied
for patch in ../lx2160a_build/patches/rcw-LSDK-21.08/*.patch; do
    if git apply --check "${patch}" > /dev/null 2>&1; then
        git apply "${patch}"
    fi
done

# Create rcw template
cd lx2160acex7 && mkdir -p RCW
{
    echo "#include <configs/lx2160a_defaults.rcwi>"
    echo "#include <configs/lx2160a_2000_700_3200.rcwi>"
    echo "#include <configs/lx2160a_SD1_8.rcwi>"
    echo "#include <configs/lx2160a_SD2_5.rcwi>"
    echo "#include <configs/lx2160a_SD3_2.rcwi>"
} > RCW/template.rcw

# Build rcw
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j "$(nproc)"
cd ../../ 

# Download and build u-boot
if [ ! -d u-boot ]; then
    git clone --depth=1 --progress -b LSDK-21.08 https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot
fi
cd u-boot

# Apply git patch if not already applied
for patch in ../lx2160a_build/patches/u-boot-LSDK-21.08/*.patch; do
    if git apply --check "${patch}" > /dev/null 2>&1; then
        git apply "${patch}"
    fi
done

# Build u-boot
make ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- lx2160acex7_tfa_defconfig
make ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- -j "$(nproc)"
cd ..

# Download and build the ARM Trusted Firmware (ATF)
if [ ! -d atf ]; then
    git clone --depth=1 --progress -b LSDK-21.08 https://source.codeaurora.org/external/qoriq/qoriq-components/atf
fi
cd atf

# Apply git patch if not already applied
for patch in ../lx2160a_build/patches/atf-LSDK-21.08/*.patch; do
    if git apply --check "${patch}" > /dev/null 2>&1; then
        git apply "${patch}"
    fi
done

cd tools/fiptool

# Download the prebuilt DDR PHY binaries
if [ ! -d ddr-phy-binary ]; then
    git clone --depth=1 --progress https://github.com/NXP/ddr-phy-binary.git
fi

# Build fiptool
make PLAT=imx8qm CROSS_COMPILE=aarch64-linux-gnu-
./fiptool create --ddr-immem-udimm-1d ddr-phy-binary/lx2160a/ddr4_pmu_train_imem.bin \
--ddr-immem-udimm-2d ddr-phy-binary/lx2160a/ddr4_2d_pmu_train_imem.bin \
--ddr-dmmem-udimm-1d ddr-phy-binary/lx2160a/ddr4_pmu_train_dmem.bin \
--ddr-dmmem-udimm-2d ddr-phy-binary/lx2160a/ddr4_2d_pmu_train_dmem.bin \
--ddr-immem-rdimm-1d ddr-phy-binary/lx2160a/ddr4_rdimm_pmu_train_imem.bin \
--ddr-immem-rdimm-2d ddr-phy-binary/lx2160a/ddr4_rdimm2d_pmu_train_imem.bin \
--ddr-dmmem-rdimm-1d ddr-phy-binary/lx2160a/ddr4_rdimm_pmu_train_dmem.bin \
--ddr-dmmem-rdimm-2d ddr-phy-binary/lx2160a/ddr4_rdimm2d_pmu_train_dmem.bin \
fip_ddr_all.bin
cd ../../

# Build atf
make PLAT=lx2160acex7 CROSS_COMPILE=aarch64-linux-gnu- PLAT=lx2160acex7 \
TRUSTED_BOARD_BOOT=0 GENERATE_COT=0 BOOT_MODE=auto SECURE_BOOT=false \
RCW=../rcw/lx2160acex7/RCW/template.bin BL33=../u-boot/u-boot.bin all fip pbl -j "$(nproc)"
cd ..

# Download and build the Management Complex (MC) utils
if [ ! -d mc-utils ]; then
    git clone --depth=1 --progress -b LSDK-21.08 https://source.codeaurora.org/external/qoriq/qoriq-components/mc-utils
fi
cd mc-utils

# Apply git patch if not already applied
for patch in ../lx2160a_build/patches/mc-utils/*.patch; do
    if git apply --check "${patch}" > /dev/null 2>&1; then
        git apply "${patch}"
    fi
done

# Build mc-utils
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C config/
cd ..

# Assembling Boot Image
mkdir -p boot-image
dd if=/dev/zero of=boot-image/lx2160acex7.img bs=1M count=64

# PFE firmware at 0x100

# FIP (BL31+BL32+BL33) at 0x800
dd if=atf/build/lx2160acex7/release/fip.bin of=boot-image/lx2160acex7.img bs=512 seek=2048 conv=notrunc

# DDR PHY FIP at 0x4000
dd if=atf/tools/fiptool/fip_ddr_all.bin of=boot-image/lx2160acex7.img bs=512 seek=16384 conv=notrunc

# DPAA2-MC at 0x5000
MC=$(ls qoriq-mc-binary/lx216?a/ | grep -v sha256sum | cut -f1)
dd if=qoriq-mc-binary/lx216xa/${MC} of=boot-image/lx2160acex7.img bs=512 seek=20480 conv=notrunc

# DPAA2 DPL at 0x6800
dd if=mc-utils/config/lx2160a/CEX7/dpl-eth.8x10g.19.dtb of=boot-image/lx2160acex7.img bs=512 seek=26624 conv=notrunc

# DPAA2 DPC at 0x7000
dd if=mc-utils/config/lx2160a/CEX7/dpc-8_x_usxgmii.dtb of=boot-image/lx2160acex7.img bs=512 seek=28672 conv=notrunc

# RCW+PBI+BL2 at block 8
dd if=atf/build/lx2160acex7/release/bl2_auto.pbl of=boot-image/lx2160acex7.img bs=512 seek=8 conv=notrunc
