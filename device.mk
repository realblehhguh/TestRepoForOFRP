#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/moorechip/kona
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.kona

# Boot control HAL shared libraries
PRODUCT_PACKAGES += \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Recovery-specific packages
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Touch input support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.kona.rc:root/init.recovery.kona.rc \
    $(LOCAL_PATH)/recovery/root/system/etc/twrp.flags:recovery/root/system/etc/twrp.flags
