# OrangeFox Recovery Device Tree for Retroid Pocket 5 (kona)

# **This device tree supports both TWRP and OrangeFox Recovery for the Retroid Pocket 5. (not flip or mini)**

## Device Information

| Device | Retroid Pocket 5 |
| --- | --- |
| **Codename** | kona |
| **Manufacturer** | MooreChip |
| **Brand** | QTI |
| **Model** | Retroid Pocket 5 |
| **Platform** | Qualcomm Snapdragon (kona) |
| **Architecture** | arm64 |
| **Android Version** | 13 |
| **Security Patch** | 2024-07-05 |
| **Build Fingerprint** | qti/kona/kona:11/RKQ1.230824.001/RP501212251:user/release-keys |

## Hardware Specifications

| Component | Specification |
| --- | --- |
| **CPU** | ARM64-v8a (Primary), ARMv7-A Neon (Secondary) |
| **Architecture** | 64-bit with 32-bit compatibility |
| **Bootloader** | Qualcomm |
| **Kernel** | Prebuilt kernel with DTB support |
| **Screen Density** | 360 DPI |
| **Partition Type** | A/B (Seamless Updates) |
| **File Systems** | ext4, f2fs |

## Partition Layout

| Partition | Size | Type |
| --- | --- | --- |
| **Boot** | 100 MB | A/B |
| **Recovery** | 100 MB | A/B (recovery-as-boot) |
| **Super** | ~8.5 GB | Dynamic partitions |
| **Dynamic Partitions** | system, system_ext, product, vendor, odm | ext4 |

## Building Recovery

### Prerequisites

1. Set up OrangeFox or TWRP build environment
2. Initialize recovery minimal manifest
3. Clone this device tree

### Building OrangeFox Recovery (Recommended)

```bash
# Clone the device tree
git clone https://github.com/realblehhguh/android_device_moorechip_kona device/moorechip/kona

# Set up environment
source build/envsetup.sh

# Choose build target
lunch orangefox_kona-eng

# Build OrangeFox recovery image
mka recoveryimage
```

### Building TWRP Recovery

```bash
# Clone the device tree
git clone https://github.com/realblehhguh/android_device_moorechip_kona device/moorechip/kona

# Set up environment
source build/envsetup.sh

# Choose build target
lunch omni_kona-eng

# Build TWRP recovery image
mka recoveryimage
```

### Alternative Build Targets

```bash
# For OrangeFox
lunch orangefox_kona-user      # User build
lunch orangefox_kona-userdebug # User-debug build
lunch orangefox_kona-eng       # Engineering build (recommended)

# For TWRP
lunch omni_kona-user      # User build
lunch omni_kona-userdebug # User-debug build
lunch omni_kona-eng       # Engineering build (recommended)
```

## Installation

**Note**: The Retroid Pocket 5 comes with an unlocked bootloader from the factory.

1. **Enable USB Debugging**: Go to Settings > Developer Options > Enable USB Debugging
2. **Boot to Fastboot**: 
   ```bash
   adb reboot bootloader
   ```
   Or use hardware keys: Power + Volume Down while booting
3. **Flash Recovery**: 
   ```bash
   # For OrangeFox
   fastboot flash boot OrangeFox-kona.img
   
   # For TWRP
   fastboot flash boot recovery.img
   ```
   Note: Flash to `boot` partition since this is a recovery-as-boot A/B device
4. **Boot to Recovery**: 
   ```bash
   fastboot reboot
   ```
   Then use hardware keys to boot to recovery mode

## Device-Specific Notes

- **A/B Device**: This device uses A/B partitioning with seamless updates
- **Recovery-as-Boot**: Recovery is flashed to the boot partition, not a separate recovery partition
- **Prebuilt Kernel**: Uses prebuilt kernel, DTB, and DTBO images
- **Dynamic Partitions**: Uses super partition with dynamic sub-partitions
- **OrangeFox Features**: Enhanced UI, Magisk support, advanced backup options
- **Dual Recovery Support**: Can build both TWRP and OrangeFox from the same tree


## Credits

- **twrpdtgen**
- **TeamWin**
- **OrangeFox Recovery Project**
- **AOSP**
## License

```
Copyright (C) 2025 The Android Open Source Project
Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
Copyright (C) 2025 OrangeFox Recovery Project

SPDX-License-Identifier: Apache-2.0
```
