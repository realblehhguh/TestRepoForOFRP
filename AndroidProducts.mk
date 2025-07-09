#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/omni_kona.mk \
    $(LOCAL_DIR)/orangefox_kona.mk

COMMON_LUNCH_CHOICES := \
    omni_kona-user \
    omni_kona-userdebug \
    omni_kona-eng \
    orangefox_kona-user \
    orangefox_kona-userdebug \
    orangefox_kona-eng
