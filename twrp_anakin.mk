#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common OrangeFox stuff.
# NOTE: not yet verified against an actual OrangeFox manifest sync - this path
# matches the OmniROM-derived common.mk OrangeFox historically forks from, but
# needs confirming against whichever OrangeFox-XX.X manifest branch is actually
# used for the real build attempt.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from anakin device
$(call inherit-product, device/asustek/anakin/device.mk)

PRODUCT_DEVICE := anakin
PRODUCT_NAME := twrp_anakin
PRODUCT_BRAND := ASUS
PRODUCT_MODEL := ASUS_I005D
PRODUCT_MANUFACTURER := ASUSTeK

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="derp_anakin-userdebug 13 TQ3A.230901.001 1787985701 release-keys"

BUILD_FINGERPRINT := ASUS/derp_anakin/anakin:13/TQ3A.230901.001/android-build08290817:userdebug/release-keys
