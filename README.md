## Overview

This is a collection of scripts that are used to build a Ubuntu 20.04 preinstalled desktop/server image for the [Honeycomb LX2K](https://www.solid-run.com/arm-servers-networking-platforms/honeycomb-lx2/#overview) from Solid-Run.

![Honeycomb LX2K](https://www.solid-run.com/wp-content/uploads/2020/07/HoneyComb-LX-2K-sideways-large-300x184.png)

## Recommended Hardware

To setup the build environment for the Ubuntu 20.04 image creation, a Linux host with the following configuration is recommended. A host machine with adequate processing power and disk space is ideal as the build process can be severial gigabytes in size and can take alot of time.

* Intel Core i7 CPU (>= 8 cores)
* Strong internet connection
* 25 GB free disk space
* 16 GB RAM

## Requirements

Please install the below packages on your host machine:

```
sudo apt-get install -y build-essential gcc-aarch64-linux-gnu bison \
qemu-user-static u-boot-tools binfmt-support debootstrap flex libssl-dev
```

## Building

To checkout the source and build:

```
git clone https://github.com/Joshua-Riek/ubuntu-honeycomb-lx2k.git
cd ubuntu-honeycomb-lx2k
sudo ./build.sh
```

## Project Layout

```bash
ubuntu-apalis-imx8
├── build-kernel.sh  # Build the Linux kernel and Device Tree Blobs
├── build-rootfs.sh  # Build the root file system
├── build-image.sh   # Build the Ubuntu preinstalled image
├── build.sh         # Build the kernel, rootfs, and image
├── patch
│   └── 0001-spi-nor-shift-out-of-bounds-fix.patch
└── README.md
```

## Boot log

```
NOTICE:  BL2: Built : 10:00:46, Jun  9 2022
NOTICE:  UDIMM KF3200C20S4/16G   
NOTICE:  DDR PMU Hardware version-0x1210
NOTICE:  DDR PMU Firmware vision-0x1001 (vA-2019.04)
NOTICE:  DDR4 UDIMM with 1-rank 64-bit bus (x8)

NOTICE:  32 GB DDR4, 64-bit, CL=20, ECC off, 256B
NOTICE:  BL2: Booting BL31
NOTICE:  BL31: v2.4(release):LSDK-21.08-7-g685790bba
NOTICE:  BL31: Built : 10:00:46, Jun  9 2022
NOTICE:  Welcome to lx2160acex7 BL31 Phase

U-Boot 2021.04-00031-gf336a6048 (Jun 09 2022 - 10:00:42 +0000)

SoC:  LX2160ACE Rev2.0 (0x87360020)
Clock Configuration:
       CPU0(A72):2000 MHz  CPU1(A72):2000 MHz  CPU2(A72):2000 MHz  
       CPU3(A72):2000 MHz  CPU4(A72):2000 MHz  CPU5(A72):2000 MHz  
       CPU6(A72):2000 MHz  CPU7(A72):2000 MHz  CPU8(A72):2000 MHz  
       CPU9(A72):2000 MHz  CPU10(A72):2000 MHz  CPU11(A72):2000 MHz  
       CPU12(A72):2000 MHz  CPU13(A72):2000 MHz  CPU14(A72):2000 MHz  
       CPU15(A72):2000 MHz  
       Bus:      700  MHz  DDR:      3200 MT/s
Reset Configuration Word (RCW):
       00000000: 50838338 24500050 00000000 00000000
       00000010: 00000000 0e010000 00000000 00000000
       00000020: 10c001a0 00002580 00000000 00000000
       00000030: 09240000 00000000 00000000 00000000
       00000040: 00000000 00000000 00000000 00000000
       00000050: 00000000 00000000 00000000 00000000
       00000060: 00000000 00000000 00027000 00000000
       00000070: 08a80001 00151020
Model: SolidRun LX2160ACEX7 COM express type 7 based board
Board: LX2160ACE Rev2.0-CEX7, SD
SERDES1 Reference: Clock1 = 161.13MHz Clock2 = 100MHz
SERDES2 Reference: Clock1 = 100MHz Clock2 = 100MHz
SERDES3 Reference: Clock1 = 100MHz Clock2 = 100Hz
DRAM:  31.9 GiB
DDR    31.9 GiB (DDR4, 64-bit, CL=20, ECC off)
       DDR Controller Interleaving Mode: 256B
dev_get_priv: null device
dev_get_priv: null device
Using SERDES1 Protocol: 8 (0x8)
Using SERDES2 Protocol: 5 (0x5)
Using SERDES3 Protocol: 2 (0x2)
PCIe1: pcie@3400000 disabled
PCIe2: pcie@3500000 disabled
PCIe3: pcie@3600000 Root Complex: x4 gen3
PCIe4: pcie@3700000 disabled
PCIe5: pcie@3800000 Root Complex: x8 gen3
PCIe6: pcie@3900000 disabled
WDT:   Started with servicing (30s timeout)
MMC:   FSL_SDHC: 0, FSL_SDHC: 1
Loading Environment from MMC... *** Warning - bad CRC, using default environment

EEPROM: TlvInfo v1 len=88
In:    serial_pl01x
Out:   serial_pl01x
Err:   serial_pl01x
SEC0:  RNG instantiated
fsl_board_late_init
Net:   eth0: DPMAC3@xgmii, eth1: DPMAC4@xgmii, eth2: DPMAC5@xgmii, eth3: DPMAC6@xgmii, eth4: DPMAC7@xgmii, eth5: DPMAC8@xgmii, eth6: DPMAC9@xgmii, eth7: DPMAC10@xgmii, eth8: DPMAC17@rgmii-id [PRIME]

MMC read: dev # 0, block # 20480, count 4608 ... 4608 blocks read: OK

MMC read: dev # 0, block # 28672, count 2048 ... 2048 blocks read: OK
crc32+ 
fsl-mc: Booting Management Complex ... SUCCESS
fsl-mc: Management Complex booted (version: 10.28.1, boot status: 0x1)
Hit any key to stop autoboot:  0 
Device: FSL_SDHC
Manufacturer ID: 3
OEM: 5344
Name: SC16G 
Bus Speed: 50000000
Mode: SD High Speed (50MHz)
Rd Block Len: 512
SD version 3.0
High Capacity: Yes
Capacity: 14.8 GiB
Bus Width: 4-bit
Erase Group Size: 512 Bytes

MMC read: dev # 0, block # 26624, count 2048 ... 2048 blocks read: OK
starting USB...
Bus usb3@3100000: Register 200017f NbrPorts 2
Starting the controller
USB XHCI 1.00
Bus usb3@3110000: Register 200017f NbrPorts 2
Starting the controller
USB XHCI 1.00
scanning bus usb3@3100000 for devices... cannot reset port 1!?
2 USB Device(s) found
scanning bus usb3@3110000 for devices... 4 USB Device(s) found
       scanning usb for storage devices... 1 Storage Device(s) found

Device 0: Vendor: Samsung  Rev: 1100 Prod: Flash Drive     
            Type: Removable Hard Disk
            Capacity: 122376.2 MB = 119.5 GB (250626566 x 512)
... is now current device
Scanning usb 0:1...
Found U-Boot script /boot.scr
636 bytes read in 1 ms (621.1 KiB/s)
## Executing script at 80000000
45107 bytes read in 1 ms (43 MiB/s)
13291370 bytes read in 46 ms (275.6 MiB/s)
Uncompressed size: 40512000 = 0x26A2A00
64198278 bytes read in 200 ms (306.1 MiB/s)
Moving Image from 0x81100000 to 0x81200000, end=839d0000
## Flattened Device Tree blob at 81000000
   Booting using the fdt blob at 0x81000000
   Loading Device Tree to 000000009fff1000, end 000000009ffff032 ... OK
Releasing fan controller full speed gpio
fsl-mc: Deploying data path layout ... WARNING: Firmware returned an error (GSR: 0x3f)

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 5.15.32-honeycomb-lx2k (root@joshua-MS-7B10) (aarch64-linux-gnu-gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #1 SMP Sun Aug 14 15:59:36 EDT 2022
[    0.000000] Machine model: SolidRun LX2160A Honeycomb
[    0.000000] efi: UEFI not found.
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x000000277fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x277c3c4340-0x277c3c8fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000277fffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000fbdfffff]
[    0.000000]   node   0: [mem 0x0000002080000000-0x000000277fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000277fffffff]
[    0.000000] cma: Reserved 32 MiB at 0x00000000f9c00000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] percpu: Embedded 30 pages/cpu s83096 r8192 d31592 u122880
[    0.000000] pcpu-alloc: s83096 r8192 d31592 u122880 alloc=30*4096
[    0.000000] pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07 
[    0.000000] pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] 14 [0] 15 
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: Spectre-v3a
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 7724544
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=UUID=ad09cbf6-456b-4cc7-8dfc-ba6dd9ff218c console=tty1 console=ttyAMA0,115200 arm-smmu.disable_bypass=0 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf amdgpu.pcie_gen_cap=0x4 amdgpu.noretry=0 rw rootwait
[    0.000000] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.000000] software IO TLB: mapped [mem 0x00000000f5c00000-0x00000000f9c00000] (64MB)
[    0.000000] Memory: 28483616K/31389696K available (17024K kernel code, 4554K rwdata, 8168K rodata, 9664K init, 1182K bss, 2873312K reserved, 32768K cma-reserved)
[    0.000000] random: get_random_u64 called from __kmem_cache_create+0x30/0x528 with crng_init=0
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
[    0.000000] ftrace: allocating 52524 entries in 206 pages
[    0.000000] ftrace: allocated 206 pages with 5 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=16.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 256 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000006200000
[    0.000000] ITS [mem 0x06020000-0x0603ffff]
[    0.000000] ITS@0x0000000006020000: allocated 65536 Devices @2080200000 (flat, esz 8, psz 64K, shr 0)
[    0.000000] ITS: using cache flushing for cmd queue
[    0.000000] GICv3: Using preallocated redistributor tables
[    0.000000] GICv3: using LPI property table @0x0000000080000000
[    0.000000] GICv3: CPU0: using reserved LPI pending table @0x0000000080010000
[    0.000000] arch_timer: cp15 timer(s) running at 25.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x5c409fb33, max_idle_ns: 440795203156 ns
[    0.000000] sched_clock: 56 bits at 25MHz, resolution 39ns, wraps every 4398046511103ns
[    0.000381] Console: colour dummy device 80x25
[    0.000535] printk: console [tty1] enabled
[    0.000587] Calibrating delay loop (skipped), value calculated using timer frequency.. 50.00 BogoMIPS (lpj=100000)
[    0.000596] pid_max: default: 32768 minimum: 301
[    0.000646] LSM: Security Framework initializing
[    0.000664] landlock: Up and running.
[    0.000668] Yama: becoming mindful.
[    0.000717] AppArmor: AppArmor initialized
[    0.000847] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000939] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.001802] rcu: Hierarchical SRCU implementation.
[    0.002217] Platform MSI: gic-its@6020000 domain created
[    0.002277] PCI/MSI: /interrupt-controller@6000000/gic-its@6020000 domain created
[    0.002319] fsl-mc MSI: gic-its@6020000 domain created
[    0.003014] EFI services will not be available.
[    0.003428] smp: Bringing up secondary CPUs ...
[    0.003774] Detected PIPT I-cache on CPU1
[    0.003799] GICv3: CPU1: found redistributor 1 region 0:0x0000000006220000
[    0.003825] GICv3: CPU1: using reserved LPI pending table @0x0000000080020000
[    0.003854] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.004294] Detected PIPT I-cache on CPU2
[    0.004319] GICv3: CPU2: found redistributor 100 region 0:0x0000000006240000
[    0.004343] GICv3: CPU2: using reserved LPI pending table @0x0000000080030000
[    0.004384] CPU2: Booted secondary processor 0x0000000100 [0x410fd083]
[    0.004800] Detected PIPT I-cache on CPU3
[    0.004818] GICv3: CPU3: found redistributor 101 region 0:0x0000000006260000
[    0.004838] GICv3: CPU3: using reserved LPI pending table @0x0000000080040000
[    0.004869] CPU3: Booted secondary processor 0x0000000101 [0x410fd083]
[    0.005228] Detected PIPT I-cache on CPU4
[    0.005253] GICv3: CPU4: found redistributor 200 region 0:0x0000000006280000
[    0.005272] GICv3: CPU4: using reserved LPI pending table @0x0000000080050000
[    0.005298] CPU4: Booted secondary processor 0x0000000200 [0x410fd083]
[    0.005692] Detected PIPT I-cache on CPU5
[    0.005714] GICv3: CPU5: found redistributor 201 region 0:0x00000000062a0000
[    0.005732] GICv3: CPU5: using reserved LPI pending table @0x0000000080060000
[    0.005757] CPU5: Booted secondary processor 0x0000000201 [0x410fd083]
[    0.006117] Detected PIPT I-cache on CPU6
[    0.006146] GICv3: CPU6: found redistributor 300 region 0:0x00000000062c0000
[    0.006163] GICv3: CPU6: using reserved LPI pending table @0x0000000080070000
[    0.006198] CPU6: Booted secondary processor 0x0000000300 [0x410fd083]
[    0.006573] Detected PIPT I-cache on CPU7
[    0.006598] GICv3: CPU7: found redistributor 301 region 0:0x00000000062e0000
[    0.006616] GICv3: CPU7: using reserved LPI pending table @0x0000000080080000
[    0.006636] CPU7: Booted secondary processor 0x0000000301 [0x410fd083]
[    0.007000] Detected PIPT I-cache on CPU8
[    0.007027] GICv3: CPU8: found redistributor 400 region 0:0x0000000006300000
[    0.007040] GICv3: CPU8: using reserved LPI pending table @0x0000000080090000
[    0.007068] CPU8: Booted secondary processor 0x0000000400 [0x410fd083]
[    0.007450] Detected PIPT I-cache on CPU9
[    0.007475] GICv3: CPU9: found redistributor 401 region 0:0x0000000006320000
[    0.007487] GICv3: CPU9: using reserved LPI pending table @0x00000000800a0000
[    0.007509] CPU9: Booted secondary processor 0x0000000401 [0x410fd083]
[    0.007877] Detected PIPT I-cache on CPU10
[    0.007903] GICv3: CPU10: found redistributor 500 region 0:0x0000000006340000
[    0.007918] GICv3: CPU10: using reserved LPI pending table @0x00000000800b0000
[    0.007944] CPU10: Booted secondary processor 0x0000000500 [0x410fd083]
[    0.008309] Detected PIPT I-cache on CPU11
[    0.008329] GICv3: CPU11: found redistributor 501 region 0:0x0000000006360000
[    0.008341] GICv3: CPU11: using reserved LPI pending table @0x00000000800c0000
[    0.008362] CPU11: Booted secondary processor 0x0000000501 [0x410fd083]
[    0.008710] Detected PIPT I-cache on CPU12
[    0.008738] GICv3: CPU12: found redistributor 600 region 0:0x0000000006380000
[    0.008753] GICv3: CPU12: using reserved LPI pending table @0x00000000800d0000
[    0.008781] CPU12: Booted secondary processor 0x0000000600 [0x410fd083]
[    0.009147] Detected PIPT I-cache on CPU13
[    0.009168] GICv3: CPU13: found redistributor 601 region 0:0x00000000063a0000
[    0.009181] GICv3: CPU13: using reserved LPI pending table @0x00000000800e0000
[    0.009202] CPU13: Booted secondary processor 0x0000000601 [0x410fd083]
[    0.009562] Detected PIPT I-cache on CPU14
[    0.009591] GICv3: CPU14: found redistributor 700 region 0:0x00000000063c0000
[    0.009606] GICv3: CPU14: using reserved LPI pending table @0x00000000800f0000
[    0.009633] CPU14: Booted secondary processor 0x0000000700 [0x410fd083]
[    0.009985] Detected PIPT I-cache on CPU15
[    0.010008] GICv3: CPU15: found redistributor 701 region 0:0x00000000063e0000
[    0.010020] GICv3: CPU15: using reserved LPI pending table @0x0000000080100000
[    0.010041] CPU15: Booted secondary processor 0x0000000701 [0x410fd083]
[    0.010094] smp: Brought up 1 node, 16 CPUs
[    0.010227] SMP: Total of 16 processors activated.
[    0.010232] CPU features: detected: 32-bit EL0 Support
[    0.010235] CPU features: detected: 32-bit EL1 Support
[    0.010240] CPU features: detected: CRC32 instructions
[    0.010404] CPU features: emulated: Privileged Access Never (PAN) using TTBR0_EL1 switching
[    0.030663] CPU: All CPU(s) started at EL2
[    0.030730] alternatives: patching kernel code
[    0.031714] devtmpfs: initialized
[    0.039162] Registered cp15_barrier emulation handler
[    0.039182] Registered setend emulation handler
[    0.039189] KASLR enabled
[    0.039268] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.039325] futex hash table entries: 4096 (order: 6, 262144 bytes, linear)
[    0.039719] pinctrl core: initialized pinctrl subsystem
[    0.040031] DMI not present or invalid.
[    0.040263] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.042355] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.043721] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.045079] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.045117] audit: initializing netlink subsys (disabled)
[    0.045221] audit: type=2000 audit(0.044:1): state=initialized audit_enabled=0 res=1
[    0.045702] thermal_sys: Registered thermal governor 'fair_share'
[    0.045706] thermal_sys: Registered thermal governor 'bang_bang'
[    0.045712] thermal_sys: Registered thermal governor 'step_wise'
[    0.045717] thermal_sys: Registered thermal governor 'user_space'
[    0.045721] thermal_sys: Registered thermal governor 'power_allocator'
[    0.046107] cpuidle: using governor ladder
[    0.046123] cpuidle: using governor menu
[    0.046208] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.046410] ASID allocator initialised with 32768 entries
[    0.046885] Serial: AMBA PL011 UART driver
[    0.049293] Machine: SolidRun LX2160A Honeycomb
[    0.049300] SoC family: QorIQ LX2160A
[    0.049304] SoC ID: svr:0x87360020, Revision: 2.0
[    0.050250] 21c0000.serial: ttyAMA0 at MMIO 0x21c0000 (irq = 25, base_baud = 0) is a SBSA
[    1.130874] printk: console [ttyAMA0] enabled
[    1.135535] 21d0000.serial: ttyAMA1 at MMIO 0x21d0000 (irq = 26, base_baud = 0) is a SBSA
[    1.148512] fsl_mc_bus 80c000000.fsl-mc: MC firmware version: 10.28.1
[    1.157496] fsl_mc_dprc dprc.1: DMA mask not set
[    1.187704] HugeTLB registered 1.00 GiB page size, pre-allocated 2 pages
[    1.194420] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    1.201113] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.207807] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    1.217789] fbcon: Taking over console
[    1.221568] ACPI: Interpreter disabled.
[    1.222766] iommu: Default domain type: Translated 
[    1.230273] iommu: DMA domain TLB invalidation policy: strict mode 
[    1.236625] vgaarb: loaded
[    1.239784] SCSI subsystem initialized
[    1.243615] libata version 3.00 loaded.
[    1.243677] usbcore: registered new interface driver usbfs
[    1.249178] usbcore: registered new interface driver hub
[    1.254499] usbcore: registered new device driver usb
[    1.259658] pps_core: LinuxPPS API ver. 1 registered
[    1.264615] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.273744] PTP clock support registered
[    1.277754] EDAC MC: Ver: 3.0.0
[    1.281663] NetLabel: Initializing
[    1.285066] NetLabel:  domain hash size = 128
[    1.289414] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    1.295089] NetLabel:  unlabeled traffic allowed by default
[    1.300962] clocksource: Switched to clocksource arch_sys_counter
[    1.329777] VFS: Disk quotas dquot_6.6.0
[    1.333740] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.340883] AppArmor: AppArmor Filesystem Enabled
[    1.345629] pnp: PnP ACPI: disabled
[    1.352470] NET: Registered PF_INET protocol family
[    1.357738] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    1.368514] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    1.377750] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    1.386817] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    1.394619] TCP: Hash tables configured (established 262144 bind 65536)
[    1.401577] MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
[    1.409360] UDP hash table entries: 16384 (order: 7, 524288 bytes, linear)
[    1.416633] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, linear)
[    1.424480] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.430160] NET: Registered PF_XDP protocol family
[    1.434961] PCI: CLS 0 bytes, default 64
[    1.439015] Trying to unpack rootfs image as initramfs...
[    1.444658] hw perfevents: enabled with armv8_cortex_a72 PMU driver, 7 counters available
[    1.453018] kvm [1]: IPA Size Limit: 44 bits
[    1.457913] kvm [1]: vgic-v2@c0e0000
[    1.461500] kvm [1]: GIC system register CPU interface enabled
[    1.473247] kvm [1]: vgic interrupt IRQ9
[    1.477466] kvm [1]: Hyp mode initialized successfully
[    1.483554] Initialise system trusted keyrings
[    1.488027] Key type blacklist registered
[    1.492154] workingset: timestamp_bits=40 max_order=23 bucket_order=0
[    1.500723] zbud: loaded
[    1.503851] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.510009] fuse: init (API version 7.34)
[    1.514287] integrity: Platform Keyring initialized
[    1.538761] Key type asymmetric registered
[    1.542857] Asymmetric key parser 'x509' registered
[    1.547769] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 242)
[    1.555247] io scheduler mq-deadline registered
[    1.566001] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.573592] layerscape-pcie 3600000.pcie: host bridge /soc/pcie@3600000 ranges:
[    1.580917] layerscape-pcie 3600000.pcie:      MEM 0x9040000000..0x907fffffff -> 0x0040000000
[    1.589816] layerscape-pcie 3600000.pcie: iATU unroll: disabled
[    1.595730] layerscape-pcie 3600000.pcie: Detected iATU regions: 256 outbound, 24 inbound
[    1.704147] layerscape-pcie 3600000.pcie: Link up
[    1.708911] layerscape-pcie 3600000.pcie: PCI host bridge to bus 0000:00
[    1.715610] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.721091] pci_bus 0000:00: root bus resource [mem 0x9040000000-0x907fffffff] (bus address [0x40000000-0x7fffffff])
[    1.731626] pci 0000:00:00.0: [1957:8d80] type 01 class 0x060400
[    1.737683] pci 0000:00:00.0: supports D1 D2
[    1.741947] pci 0000:00:00.0: PME# supported from D0 D1 D2 D3hot
[    1.748896] pci 0000:01:00.0: [144d:a808] type 00 class 0x010802
[    1.754990] pci 0000:01:00.0: reg 0x10: [mem 0x9040000000-0x9040003fff 64bit]
[    1.763757] pci 0000:00:00.0: BAR 14: assigned [mem 0x9040000000-0x90400fffff]
[    1.770979] pci 0000:01:00.0: BAR 0: assigned [mem 0x9040000000-0x9040003fff 64bit]
[    1.778666] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    1.783886] pci 0000:00:00.0:   bridge window [mem 0x9040000000-0x90400fffff]
[    1.791023] pci 0000:00:00.0: Max Payload Size set to  256/ 256 (was  128), Max Read Rq  256
[    1.799507] pci 0000:01:00.0: Max Payload Size set to  256/ 256 (was  128), Max Read Rq  256
[    1.802100] Freeing initrd memory: 62692K
[    1.808068] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.819265] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa07fffffff -> 0x0040000000
[    1.828315] layerscape-pcie 3800000.pcie: iATU unroll: disabled
[    1.834229] layerscape-pcie 3800000.pcie: Detected iATU regions: 256 outbound, 24 inbound
[    1.942739] layerscape-pcie 3800000.pcie: Link up
[    1.947492] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.954190] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.959670] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa07fffffff] (bus address [0x40000000-0x7fffffff])
[    1.970201] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400
[    1.976271] pci 0001:00:00.0: supports D1 D2
[    1.980536] pci 0001:00:00.0: PME# supported from D0 D1 D2 D3hot
[    1.987515] pci 0001:01:00.0: [1002:699f] type 00 class 0x030000
[    1.993637] pci 0001:01:00.0: reg 0x10: [mem 0xa040000000-0xa04fffffff 64bit pref]
[    2.001277] pci 0001:01:00.0: reg 0x18: [mem 0xa050000000-0xa0501fffff 64bit pref]
[    2.008889] pci 0001:01:00.0: reg 0x20: [io  0x1000-0x10ff]
[    2.014504] pci 0001:01:00.0: reg 0x24: [mem 0xa050200000-0xa05023ffff]
[    2.021161] pci 0001:01:00.0: reg 0x30: [mem 0xa050240000-0xa05025ffff pref]
[    2.028239] pci 0001:01:00.0: enabling Extended Tags
[    2.033811] pci 0001:01:00.0: supports D1 D2
[    2.038075] pci 0001:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    2.045045] pci 0001:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    2.053596] pci 0001:01:00.1: [1002:aae0] type 00 class 0x040300
[    2.059715] pci 0001:01:00.1: reg 0x10: [mem 0xa050260000-0xa050263fff 64bit]
[    2.067120] pci 0001:01:00.1: enabling Extended Tags
[    2.072465] pci 0001:01:00.1: supports D1 D2
[    2.077813] pci 0001:00:00.0: BAR 15: assigned [mem 0xa040000000-0xa057ffffff 64bit pref]
[    2.085989] pci 0001:00:00.0: BAR 14: assigned [mem 0xa058000000-0xa0580fffff]
[    2.093206] pci 0001:00:00.0: BAR 13: no space for [io  size 0x1000]
[    2.099554] pci 0001:00:00.0: BAR 13: failed to assign [io  size 0x1000]
[    2.106250] pci 0001:01:00.0: BAR 0: assigned [mem 0xa040000000-0xa04fffffff 64bit pref]
[    2.114384] pci 0001:01:00.0: BAR 2: assigned [mem 0xa050000000-0xa0501fffff 64bit pref]
[    2.122518] pci 0001:01:00.0: BAR 5: assigned [mem 0xa058000000-0xa05803ffff]
[    2.129662] pci 0001:01:00.0: BAR 6: assigned [mem 0xa058040000-0xa05805ffff pref]
[    2.137227] pci 0001:01:00.1: BAR 0: assigned [mem 0xa058060000-0xa058063fff 64bit]
[    2.144925] pci 0001:01:00.0: BAR 4: no space for [io  size 0x0100]
[    2.151186] pci 0001:01:00.0: BAR 4: failed to assign [io  size 0x0100]
[    2.157794] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    2.163014] pci 0001:00:00.0:   bridge window [mem 0xa058000000-0xa0580fffff]
[    2.170145] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa057ffffff 64bit pref]
[    2.178239] pci 0001:00:00.0: Max Payload Size set to  256/ 256 (was  128), Max Read Rq  256
[    2.186741] pci 0001:01:00.0: Max Payload Size set to  256/ 256 (was  128), Max Read Rq  256
[    2.195243] pci 0001:01:00.1: Max Payload Size set to  256/ 256 (was  128), Max Read Rq  256
[    2.203735] pci 0001:01:00.1: D0 power state depends on 0001:01:00.0
[    2.215994] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    2.225836] msm_serial: driver initialized
[    2.230786] arm-smmu 5000000.iommu: probing hardware configuration...
[    2.237233] arm-smmu 5000000.iommu: SMMUv2 with:
[    2.241849] arm-smmu 5000000.iommu: 	stage 1 translation
[    2.247154] arm-smmu 5000000.iommu: 	stage 2 translation
[    2.252457] arm-smmu 5000000.iommu: 	nested translation
[    2.257674] arm-smmu 5000000.iommu: 	coherent table walk
[    2.262978] arm-smmu 5000000.iommu: 	(IDR0.CTTW overridden by FW configuration)
[    2.270288] arm-smmu 5000000.iommu: 	stream matching with 128 register groups
[    2.277419] arm-smmu 5000000.iommu: 	64 context banks (0 stage-2 only)
[    2.283941] arm-smmu 5000000.iommu: 	Supported page sizes: 0x61311000
[    2.290373] arm-smmu 5000000.iommu: 	Stage-1: 48-bit VA -> 48-bit IPA
[    2.296806] arm-smmu 5000000.iommu: 	Stage-2: 48-bit IPA -> 48-bit PA
[    2.309388] loop: module loaded
[    2.312866] SPI driver altr_a10sr has no spi_device_id for altr,a10sr
[    2.320045] tun: Universal TUN/TAP device driver, 1.6
[    2.329908] at803x: module verification failed: signature and/or required key missing - tainting kernel
[    2.353437] PPP generic driver version 2.4.2
[    2.357891] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.364425] ehci-pci: EHCI PCI platform driver
[    2.368891] ehci-orion: EHCI orion driver
[    2.372933] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.379113] ohci-pci: OHCI PCI platform driver
[    2.383562] uhci_hcd: USB Universal Host Controller Interface driver
[    2.390047] mousedev: PS/2 mouse device common for all mice
[    2.395882] i2c_dev: i2c /dev entries driver
[    2.400720] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    2.412937] device-mapper: uevent: version 1.0.3
[    2.417647] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: dm-devel@redhat.com
[    2.427339] ledtrig-cpu: registered to indicate activity on CPUs
[    2.433680] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
[    2.440793] drop_monitor: Initializing network drop monitor service
[    2.447320] NET: Registered PF_INET6 protocol family
[    2.463593] Segment Routing with IPv6
[    2.467271] In-situ OAM (IOAM) with IPv6
[    2.471221] NET: Registered PF_PACKET protocol family
[    2.476352] Key type dns_resolver registered
[    2.481209] registered taskstats version 1
[    2.485631] Loading compiled-in X.509 certificates
[    2.491310] zswap: loaded using pool lzo/zbud
[    2.496371] Key type ._fscrypt registered
[    2.500384] Key type .fscrypt registered
[    2.504335] Key type fscrypt-provisioning registered
[    2.515239] Key type encrypted registered
[    2.519249] AppArmor: AppArmor sha1 policy hashing enabled
[    2.524741] ima: No TPM chip found, activating TPM-bypass!
[    2.530226] Loading compiled-in module X.509 certificates
[    2.535619] ima: Allocated hash algorithm: sha1
[    2.540161] ima: No architecture policies found
[    2.544704] evm: Initialising EVM extended attributes:
[    2.549837] evm: security.selinux
[    2.553147] evm: security.SMACK64
[    2.556450] evm: security.SMACK64EXEC
[    2.560104] evm: security.SMACK64TRANSMUTE
[    2.564194] evm: security.SMACK64MMAP
[    2.567848] evm: security.apparmor
[    2.571243] evm: security.ima
[    2.574202] evm: security.capability
[    2.577770] evm: HMAC attrs: 0x1
[    2.688748] fsl_mc_dprc dprc.1: DPRC device bound to driver
[    2.694670] pcieport 0000:00:00.0: PME: Signaling with IRQ 375
[    2.700627] pcieport 0000:00:00.0: AER: enabled with IRQ 375
[    2.706673] pcieport 0001:00:00.0: PME: Signaling with IRQ 376
[    2.712639] pcieport 0001:00:00.0: AER: enabled with IRQ 376
[    2.722862] Freeing unused kernel memory: 9664K
[    2.877826] Checked W+X mappings: passed, no W+X pages found
[    2.883513] Run /init as init process
[    2.887172]   with arguments:
[    2.887175]     /init
[    2.887178]   with environment:
[    2.887180]     HOME=/
[    2.887182]     TERM=linux
[    3.169936] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    3.190785] imx-i2c 2000000.i2c: can't get pinctrl, bus recovery not supported
[    3.212504] sdhci: Secure Digital Host Controller Interface driver
[    3.213299] i2c i2c-0: IMX I2C adapter registered
[    3.218719] sdhci: Copyright(c) Pierre Ossman
[    3.225232] ahci-qoriq 3200000.sata: supply ahci not found, using dummy regulator
[    3.227359] imx-i2c 2020000.i2c: can't get pinctrl, bus recovery not supported
[    3.232427] i2c i2c-1: IMX I2C adapter registered
[    3.236044] ftm-alarm 2800000.timer: registered as rtc1
[    3.236703] ahci-qoriq 3200000.sata: supply phy not found, using dummy regulator
[    3.236935] sdhci-pltfm: SDHCI platform and OF driver helper
[    3.236978] ahci-qoriq 3200000.sata: supply target not found, using dummy regulator
[    3.237542] ahci-qoriq 3200000.sata: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl platform mode
[    3.237550] ahci-qoriq 3200000.sata: flags: 64bit ncq sntf pm clo only pmp fbs pio slum part ccc sds apst 
[    3.242760] imx-i2c 2040000.i2c: can't get pinctrl, bus recovery not supported
[    3.248853] nvme nvme0: pci function 0000:01:00.0
[    3.252733] i2c i2c-2: IMX I2C adapter registered
[    3.253854] scsi host0: ahci-qoriq
[    3.254017] ata1: SATA max UDMA/133 mmio [mem 0x03200000-0x0320ffff] port 0x100 irq 33
[    3.254161] ahci-qoriq 3210000.sata: supply ahci not found, using dummy regulator
[    3.254233] ahci-qoriq 3210000.sata: supply phy not found, using dummy regulator
[    3.254255] ahci-qoriq 3210000.sata: supply target not found, using dummy regulator
[    3.254325] ahci-qoriq 3210000.sata: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl platform mode
[    3.254332] ahci-qoriq 3210000.sata: flags: 64bit ncq sntf pm clo only pmp fbs pio slum part ccc sds apst 
[    3.262976] nvme nvme0: missing or invalid SUBNQN field.
[    3.265971] scsi host1: ahci-qoriq
[    3.272965] mmc0: SDHCI controller on 2140000.esdhc [2140000.esdhc] using ADMA 64-bit
[    3.272966] mmc1: SDHCI controller on 2150000.esdhc [2150000.esdhc] using ADMA 64-bit
[    3.273305] nvme nvme0: Shutdown timeout set to 8 seconds
[    3.282308] ata2: SATA max UDMA/133 mmio [mem 0x03210000-0x0321ffff] port 0x100 irq 34
[    3.310109] nvme nvme0: 16/0/0 default/read/poll queues
[    3.311985] ahci-qoriq 3220000.sata: supply ahci not found, using dummy regulator
[    3.325219]  nvme0n1: p1
[    3.327320] ahci-qoriq 3220000.sata: supply phy not found, using dummy regulator
[    3.334213] mmc0: new ultra high speed SDR104 SDHC card at address aaaa
[    3.334597] mmcblk0: mmc0:aaaa SC16G 14.8 GiB 
[    3.337133]  mmcblk0: p1
[    3.342310] ahci-qoriq 3220000.sata: supply target not found, using dummy regulator
[    3.354931] mmc1: new HS400 MMC card at address 0001
[    3.360961] ahci-qoriq 3220000.sata: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl platform mode
[    3.366553] mmcblk1: mmc1:0001 DG4064 59.2 GiB 
[    3.369588] ahci-qoriq 3220000.sata: flags: 64bit ncq sntf pm clo only pmp fbs pio slum part ccc sds apst 
[    3.378568]  mmcblk1: p1
[    3.473331] mmcblk1boot0: mmc1:0001 DG4064 4.00 MiB 
[    3.473513] scsi host2: ahci-qoriq
[    3.479242] mmcblk1boot1: mmc1:0001 DG4064 4.00 MiB 
[    3.481806] ata3: SATA max UDMA/133 mmio [mem 0x03220000-0x0322ffff] port 0x100 irq 35
[    3.487515] mmcblk1rpmb: mmc1:0001 DG4064 4.00 MiB, chardev (237:0)
[    3.494704] ahci-qoriq 3230000.sata: supply ahci not found, using dummy regulator
[    3.508385] ahci-qoriq 3230000.sata: supply phy not found, using dummy regulator
[    3.515800] ahci-qoriq 3230000.sata: supply target not found, using dummy regulator
[    3.523518] ahci-qoriq 3230000.sata: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl platform mode
[    3.532475] ahci-qoriq 3230000.sata: flags: 64bit ncq sntf pm clo only pmp fbs pio slum part ccc sds apst 
[    3.542564] scsi host3: ahci-qoriq
[    3.546074] ata4: SATA max UDMA/133 mmio [mem 0x03230000-0x0323ffff] port 0x100 irq 36
[    3.567153] ata1: SATA link down (SStatus 0 SControl 300)
[    3.627141] ata2: SATA link down (SStatus 0 SControl 300)
[    3.807160] ata3: SATA link down (SStatus 0 SControl 300)
[    3.867166] ata4: SATA link down (SStatus 0 SControl 300)
[    3.875441] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    3.879065] fsl_mc_dpio dpio.15: probed
[    3.880958] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
[    3.888126] random: fast init done
[    3.888756] fsl_mc_dpio dpio.14: probed
[    3.892482] xhci-hcd xhci-hcd.1.auto: hcc params 0x0220f66d hci version 0x100 quirks 0x0000000002010810
[    3.892761] fsl_mc_dpio dpio.13: probed
[    3.896711] fsl_mc_dpio dpio.12: probed
[    3.899662] xhci-hcd xhci-hcd.1.auto: irq 31, io mem 0x03100000
[    3.906176] rtc-pcf2127-i2c 2-0051: registered as rtc0
[    3.907662] rtc-pcf2127-i2c 2-0051: setting system clock to 2022-08-14T21:32:17 UTC (1660512737)
[    3.913356] fsl_mc_dpio dpio.11: probed
[    3.913873] i2c i2c-0: Added multiplexed i2c bus 3
[    3.914087] i2c i2c-0: Added multiplexed i2c bus 4
[    3.914256] i2c i2c-0: Added multiplexed i2c bus 5
[    3.914446] i2c i2c-0: Added multiplexed i2c bus 6
[    3.914555] i2c i2c-0: Added multiplexed i2c bus 7
[    3.914662] i2c i2c-0: Added multiplexed i2c bus 8
[    3.914768] i2c i2c-0: Added multiplexed i2c bus 9
[    3.914874] i2c i2c-0: Added multiplexed i2c bus 10
[    3.914878] pca954x 0-0077: registered 8 multiplexed busses for I2C mux pca9547
[    3.915566] sfp sfp-1: Host maximum power 2.0W
[    3.915737] sfp sfp-1: No tx_disable pin: SFP modules will always be emitting.
[    3.916551] sfp sfp-2: Host maximum power 2.0W
[    3.916688] sfp sfp-2: No tx_disable pin: SFP modules will always be emitting.
[    3.916865] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.15
[    3.916872] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.916875] usb usb1: Product: xHCI Host Controller
[    3.916878] usb usb1: Manufacturer: Linux 5.15.32-honeycomb-lx2k xhci-hcd
[    3.916881] usb usb1: SerialNumber: xhci-hcd.1.auto
[    3.917131] hub 1-0:1.0: USB hub found
[    3.917148] hub 1-0:1.0: 1 port detected
[    3.917295] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    3.917302] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
[    3.917308] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[    3.917383] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.15
[    3.917387] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.917390] usb usb2: Product: xHCI Host Controller
[    3.917392] usb usb2: Manufacturer: Linux 5.15.32-honeycomb-lx2k xhci-hcd
[    3.917394] usb usb2: SerialNumber: xhci-hcd.1.auto
[    3.917570] hub 2-0:1.0: USB hub found
[    3.917585] hub 2-0:1.0: 1 port detected
[    3.917805] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[    3.917812] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 3
[    3.917879] xhci-hcd xhci-hcd.2.auto: hcc params 0x0220f66d hci version 0x100 quirks 0x0000000002010810
[    3.917903] xhci-hcd xhci-hcd.2.auto: irq 32, io mem 0x03110000
[    3.918037] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.15
[    3.918041] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.918044] usb usb3: Product: xHCI Host Controller
[    3.918046] usb usb3: Manufacturer: Linux 5.15.32-honeycomb-lx2k xhci-hcd
[    3.918049] usb usb3: SerialNumber: xhci-hcd.2.auto
[    3.918224] hub 3-0:1.0: USB hub found
[    3.918238] hub 3-0:1.0: 1 port detected
[    3.918368] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[    3.918373] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 4
[    3.918378] xhci-hcd xhci-hcd.2.auto: Host supports USB 3.0 SuperSpeed
[    3.918454] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.15
[    3.918458] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.918461] usb usb4: Product: xHCI Host Controller
[    3.918463] usb usb4: Manufacturer: Linux 5.15.32-honeycomb-lx2k xhci-hcd
[    3.918466] usb usb4: SerialNumber: xhci-hcd.2.auto
[    3.918641] hub 4-0:1.0: USB hub found
[    3.918655] hub 4-0:1.0: 1 port detected
[    3.927048] fsl_mc_dpio dpio.10: probed
[    3.928396] sfp sfp-3: Host maximum power 2.0W
[    3.940705] fsl_mc_dpio dpio.9: probed
[    3.945265] sfp sfp-3: No tx_disable pin: SFP modules will always be emitting.
[    3.954013] fsl_mc_dpio dpio.8: probed
[    3.955369] sfp sfp-0: Host maximum power 2.0W
[    3.963707] fsl_mc_dpio dpio.7: probed
[    3.964378] sfp sfp-0: No tx_disable pin: SFP modules will always be emitting.
[    3.973290] fsl_mc_dpio dpio.6: probed
[    4.172970] usb 3-1: new high-speed USB device number 2 using xhci-hcd
[    4.180530] fsl_mc_dpio dpio.5: probed
[    4.253025] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
[    4.259011] fsl_mc_dpio dpio.4: probed
[    4.281927] usb 2-1: New USB device found, idVendor=090c, idProduct=1000, bcdDevice=11.00
[    4.288412] fsl_mc_dpio dpio.3: probed
[    4.294459] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    4.302410] fsl_mc_dpio dpio.2: probed
[    4.306367] usb 2-1: Product: Flash Drive
[    4.306370] usb 2-1: Manufacturer: Samsung
[    4.314318] fsl_mc_dpio dpio.1: probed
[    4.317242] usb 2-1: SerialNumber: 0374122040002593
[    4.341222] usb 3-1: New USB device found, idVendor=04b4, idProduct=6502, bcdDevice=50.10
[    4.341886] fsl_mc_dpio dpio.0: probed
[    4.349404] usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.398470] hub 3-1:1.0: USB hub found
[    4.402248] hub 3-1:1.0: 4 ports detected
[    4.445447] usb-storage 2-1:1.0: USB Mass Storage device detected
[    4.451751] usb-storage 2-1:1.0: Quirks match for vid 090c pid 1000: 400
[    4.458517] scsi host4: usb-storage 2-1:1.0
[    4.462916] usbcore: registered new interface driver usb-storage
[    4.470427] usbcore: registered new interface driver uas
[    4.472987] usb 4-1: new SuperSpeed USB device number 2 using xhci-hcd
[    4.505202] usb 4-1: New USB device found, idVendor=04b4, idProduct=6500, bcdDevice=50.10
[    4.513379] usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.574325] fsl_dpaa2_eth dpni.0 (unnamed net_device) (uninitialized): PHY [0x0000000008b96000:01] driver [Qualcomm Atheros AR8035] (irq=POLL)
[    4.574425] hub 4-1:1.0: USB hub found
[    4.587808] fsl_dpaa2_eth dpni.0: Probed interface eth0
[    4.591103] hub 4-1:1.0: 4 ports detected
[    4.602656] ptp_qoriq: device tree node missing required elements, try automatic configuration
[    4.611387] pps pps0: new PPS source ptp0
[    4.756974] usb 3-1.3: new high-speed USB device number 3 using xhci-hcd
[    4.861091] usb 3-1.3: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
[    4.869441] usb 3-1.3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.910401] hub 3-1.3:1.0: USB hub found
[    4.914363] hub 3-1.3:1.0: 4 ports detected
[    7.035391] scsi 4:0:0:0: Direct-Access     Samsung  Flash Drive      1100 PQ: 0 ANSI: 6
[    7.043809] sd 4:0:0:0: Attached scsi generic sg0 type 0
[    7.044045] sd 4:0:0:0: [sda] 250626566 512-byte logical blocks: (128 GB/120 GiB)
[    7.056741] sd 4:0:0:0: [sda] Write Protect is off
[    7.061533] sd 4:0:0:0: [sda] Mode Sense: 43 00 00 00
[    7.061655] sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    7.072572]  sda: sda1 sda2
[    7.076221] sd 4:0:0:0: [sda] Attached SCSI removable disk
[    7.479873] EXT4-fs (sda2): recovery complete
[    7.488559] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null). Quota mode: none.
[    7.806750] systemd[1]: Inserted module 'autofs4'
[    7.835439] systemd[1]: systemd 245.4-4ubuntu3.17 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[    7.858497] systemd[1]: Detected architecture arm64.
[    7.909298] systemd[1]: Set hostname to <honeycomb-lx2k>.
[    7.990553] systemd-sysv-generator[395]: Overwriting existing symlink /run/systemd/generator.late/expand-rootfs.service with real service.
[    8.222093] random: systemd: uninitialized urandom read (16 bytes read)
[    8.230350] systemd[1]: Created slice system-modprobe.slice.
[    8.249016] random: systemd: uninitialized urandom read (16 bytes read)
[    8.256274] systemd[1]: Created slice system-serial\x2dgetty.slice.
[    8.277012] random: systemd: uninitialized urandom read (16 bytes read)
[    8.284189] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[    8.305634] systemd[1]: Created slice User and Session Slice.
[    8.325159] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    8.349434] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    8.373104] systemd[1]: Reached target User and Group Name Lookups.
[    8.393018] systemd[1]: Reached target Remote File Systems.
[    8.413012] systemd[1]: Reached target Slices.
[    8.429022] systemd[1]: Reached target Swap.
[    8.445273] systemd[1]: Listening on Syslog Socket.
[    8.465200] systemd[1]: Listening on fsck to fsckd communication Socket.
[    8.489152] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    8.509428] systemd[1]: Listening on Journal Audit Socket.
[    8.529237] systemd[1]: Listening on Journal Socket (/dev/log).
[    8.549250] systemd[1]: Listening on Journal Socket.
[    8.569259] systemd[1]: Listening on udev Control Socket.
[    8.589155] systemd[1]: Listening on udev Kernel Socket.
[    8.611143] systemd[1]: Mounting Huge Pages File System...
[    8.631047] systemd[1]: Mounting POSIX Message Queue File System...
[    8.655020] systemd[1]: Mounting Kernel Debug File System...
[    8.675064] systemd[1]: Mounting Kernel Trace File System...
[    8.695927] systemd[1]: Starting Journal Service...
[    8.715491] systemd[1]: Starting Set the console keyboard layout...
[    8.739439] systemd[1]: Starting Create list of static device nodes for the current kernel...
[    8.767356] systemd[1]: Starting Load Kernel Module drm...
[    8.790775] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[    8.799915] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
[    8.812325] systemd[1]: Starting Load Kernel Modules...
[    8.835229] systemd[1]: Starting Remount Root and Kernel File Systems...
[    8.836511] lp: driver loaded but no devices found
[    8.847411] EXT4-fs (sda2): re-mounted. Opts: (null). Quota mode: none.
[    8.859681] ppdev: user-space parallel port driver
[    8.868565] IPMI message handler: version 39.2
[    8.874293] ipmi device interface
[    8.891289] systemd[1]: Starting udev Coldplug all Devices...
[    8.916048] systemd[1]: Started Journal Service.
[    9.149362] systemd-journald[404]: Received client request to flush runtime journal.
[    9.179654] systemd-journald[404]: File /var/log/journal/170181cef54f46bb97c22d7094c03003/system.journal corrupted or uncleanly shut down, renaming and replacing.
[    9.580404] random: crng init done
[    9.580412] random: 7 urandom warning(s) missed due to ratelimiting
[    9.736881] qoriq-cpufreq qoriq-cpufreq: Freescale QorIQ CPU frequency scaling driver
[    9.741841] fsl_mc_err_probe: No ECC DIMMs discovered
[    9.741885] fsl_mc_err_probe: No ECC DIMMs discovered
[    9.770570] sbsa-gwdt 23a0000.watchdog: Initialized with 30s timeout @ 25000050 Hz, action=0. [enabled]
[    9.797381] optee: probing for conduit method.
[    9.797392] optee: api uid mismatch
[    9.797395] optee: probe of firmware:optee failed with error -22
[    9.820092] caam 8000000.crypto: device ID = 0x0a1a020000000000 (Era 10)
[    9.820104] caam 8000000.crypto: job rings = 3, qi = 1
[    9.845286] at24 3-0050: supply vcc not found, using dummy regulator
[    9.849056] spi-nor spi0.0: found mt35xu512aba, expected m25p80
[    9.849525] spi-nor spi0.0: mt35xu512aba (65536 Kbytes)
[    9.853583] at24 3-0050: 65536 byte 24c512 EEPROM, writable, 1 bytes/write
[    9.854299] at24 3-0051: supply vcc not found, using dummy regulator
[    9.862187] at24 3-0051: 256 byte spd EEPROM, read-only
[    9.862856] at24 3-0053: supply vcc not found, using dummy regulator
[    9.871895] hwmon hwmon8: temp1_input not attached to any thermal zone
[    9.871914] hwmon hwmon8: temp2_input not attached to any thermal zone
[    9.877090] at24 3-0053: 256 byte spd EEPROM, read-only
[    9.878541] at24 3-0057: supply vcc not found, using dummy regulator
[    9.887323] spi-nor spi0.1: w25q32 (4096 Kbytes)
[    9.891272] at24 3-0057: 256 byte 24c02 EEPROM, writable, 1 bytes/write
[    9.993292] dpaa2_caam dpseci.0: dpseci v5.3
[   10.000274] cryptd: max_cpu_qlen set to 1000
[   10.016779] fsl_mc_dprc dprc.1 (unnamed net_device) (uninitialized): netif_napi_add() called with weight 512
[   10.082576] dpaa2_caam dpseci.0: algorithms registered in /proc/crypto
[   10.083410] dpaa2_caam dpseci.0: hash algorithms registered in /proc/crypto
[   10.122801] caam algorithms registered in /proc/crypto
[   10.124465] caam 8000000.crypto: caam pkc algorithms registered in /proc/crypto
[   10.124473] caam 8000000.crypto: registering rng-caam
[   10.159558] snd_hda_intel 0001:01:00.1: Force to snoop mode by module option
[   10.180812] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/platform/soc/3800000.pcie/pci0001:00/0001:00:00.0/0001:01:00.1/sound/card0/input1
[   10.598235] [drm] amdgpu kernel modesetting enabled.
[   10.598407] amdgpu: CRAT table disabled by module option
[   10.598413] amdgpu: DSDT table not found for OEM information
[   10.598416] amdgpu: IO link not available for non x86 platforms
[   10.598418] amdgpu: Virtual CRAT table created for CPU
[   10.598451] amdgpu: Topology: Add CPU node
[   10.598936] [drm] initializing kernel modesetting (POLARIS12 0x1002:0x699F 0x1002:0x0B04 0xC7).
[   10.598949] amdgpu 0001:01:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[   10.598970] [drm] register mmio base: 0x58000000
[   10.598973] [drm] register mmio size: 262144
[   10.598977] [drm] PCIE atomic ops is not supported
[   10.598983] [drm] add ip block number 0 <vi_common>
[   10.598987] [drm] add ip block number 1 <gmc_v8_0>
[   10.598989] [drm] add ip block number 2 <tonga_ih>
[   10.598992] [drm] add ip block number 3 <gfx_v8_0>
[   10.598994] [drm] add ip block number 4 <sdma_v3_0>
[   10.598996] [drm] add ip block number 5 <powerplay>
[   10.598999] [drm] add ip block number 6 <dm>
[   10.599002] [drm] add ip block number 7 <uvd_v6_0>
[   10.599004] [drm] add ip block number 8 <vce_v3_0>
[   10.816324] amdgpu 0001:01:00.0: amdgpu: Fetched VBIOS from ROM BAR
[   10.816349] amdgpu: ATOM BIOS: xxx-xxx-xxx
[   10.816402] [drm] UVD is enabled in VM mode
[   10.816406] [drm] UVD ENC is enabled in VM mode
[   10.816412] [drm] VCE enabled in VM mode
[   10.816453] [drm] GPU posting now...
[   10.931375] [drm] vm size is 128 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[   10.937366] amdgpu 0001:01:00.0: BAR 2: releasing [mem 0xa050000000-0xa0501fffff 64bit pref]
[   10.937382] amdgpu 0001:01:00.0: BAR 0: releasing [mem 0xa040000000-0xa04fffffff 64bit pref]
[   10.937536] pcieport 0001:00:00.0: BAR 15: releasing [mem 0xa040000000-0xa057ffffff 64bit pref]
[   10.937555] pcieport 0001:00:00.0: BAR 15: no space for [mem size 0xc0000000 64bit pref]
[   10.937563] pcieport 0001:00:00.0: BAR 15: failed to assign [mem size 0xc0000000 64bit pref]
[   10.937573] amdgpu 0001:01:00.0: BAR 0: no space for [mem size 0x80000000 64bit pref]
[   10.937580] amdgpu 0001:01:00.0: BAR 0: failed to assign [mem size 0x80000000 64bit pref]
[   10.937588] amdgpu 0001:01:00.0: BAR 2: no space for [mem size 0x00200000 64bit pref]
[   10.937594] amdgpu 0001:01:00.0: BAR 2: failed to assign [mem size 0x00200000 64bit pref]
[   10.937602] pcieport 0001:00:00.0: PCI bridge to [bus 01-ff]
[   10.937612] pcieport 0001:00:00.0:   bridge window [mem 0xa058000000-0xa0580fffff]
[   10.937624] pcieport 0001:00:00.0: PCI bridge to [bus 01-ff]
[   10.937633] pcieport 0001:00:00.0:   bridge window [mem 0xa058000000-0xa0580fffff]
[   10.937640] pcieport 0001:00:00.0:   bridge window [mem 0xa040000000-0xa057ffffff 64bit pref]
[   10.937700] [drm] Not enough PCI address space for a large BAR.
[   10.937707] amdgpu 0001:01:00.0: BAR 0: assigned [mem 0xa040000000-0xa04fffffff 64bit pref]
[   10.937766] amdgpu 0001:01:00.0: BAR 2: assigned [mem 0xa050000000-0xa0501fffff 64bit pref]
[   10.937838] amdgpu 0001:01:00.0: amdgpu: VRAM: 2048M 0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
[   10.937849] amdgpu 0001:01:00.0: amdgpu: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
[   10.937859] [drm] Detected VRAM RAM=2048M, BAR=256M
[   10.937864] [drm] RAM width 64bits GDDR5
[   10.937960] [drm] amdgpu: 2048M of VRAM memory ready
[   10.937967] [drm] amdgpu: 3072M of GTT memory ready.
[   10.937996] [drm] GART: num cpu pages 65536, num gpu pages 65536
[   10.940091] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000).
[   10.942636] [drm] Chained IB support enabled!
[   10.964474] amdgpu: hwmgr_sw_init smu backed is polaris10_smu
[   10.974388] [drm] Found UVD firmware Version: 1.130 Family ID: 16
[   10.980222] [drm] Found VCE firmware Version: 53.26 Binary ID: 3
[   11.282682] audit: type=1400 audit(1660512744.871:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=835 comm="apparmor_parser"
[   11.282706] audit: type=1400 audit(1660512744.871:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=835 comm="apparmor_parser"
[   11.283631] audit: type=1400 audit(1660512744.871:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=841 comm="apparmor_parser"
[   11.283754] audit: type=1400 audit(1660512744.871:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=833 comm="apparmor_parser"
[   11.283924] audit: type=1400 audit(1660512744.871:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=839 comm="apparmor_parser"
[   11.285340] audit: type=1400 audit(1660512744.875:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oopslash" pid=832 comm="apparmor_parser"
[   11.285487] audit: type=1400 audit(1660512744.875:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ippusbxd" pid=845 comm="apparmor_parser"
[   11.288680] audit: type=1400 audit(1660512744.875:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=843 comm="apparmor_parser"
[   11.288692] audit: type=1400 audit(1660512744.875:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=843 comm="apparmor_parser"
[   11.288699] audit: type=1400 audit(1660512744.875:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=843 comm="apparmor_parser"
[   11.325586] [drm] Display Core initialized with v3.2.149!
[   11.326557] snd_hda_intel 0001:01:00.1: bound 0001:01:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[   11.380322] [drm] UVD and UVD ENC initialized successfully.
[   11.481391] [drm] VCE initialized successfully.
[   11.481406] kfd kfd: amdgpu: skipped device 1002:699f, PCI rejects atomics 730<0
[   11.481431] amdgpu 0001:01:00.0: amdgpu: SE 2, SH per SE 1, CU per SH 5, active_cu_number 8
[   11.484371] [drm] fb mappable at 0xA040530000
[   11.484382] [drm] vram apper at 0xA040000000
[   11.484386] [drm] size 8294400
[   11.484390] [drm] fb depth is 24
[   11.484394] [drm]    pitch is 7680
[   11.507729] Console: switching to colour frame buffer device 240x67
[   11.530829] amdgpu 0001:01:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[   11.579604] amdgpu 0001:01:00.0: amdgpu: Using BACO for runtime pm
[   11.580420] [drm] Initialized amdgpu 3.42.0 20150101 for 0001:01:00.0 on minor 0
[   12.194111] Process accounting resumed
[   12.703689] fsl_dpaa2_eth dpni.0 eth0: configuring for phy/rgmii-id link mode
[   12.884043] EXT4-fs (sda2): resizing filesystem from 1340672 to 31197248 blocks
[   16.755478] loop0: detected capacity change from 0 to 8
[   18.606219] EXT4-fs (sda2): resized filesystem to 31197248
[   19.367266] systemd-sysv-generator[1329]: Overwriting existing symlink /run/systemd/generator.late/expand-rootfs.service with real service.
[   23.254063] rfkill: input handler disabled
```