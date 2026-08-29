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

# Real ASUS stock identity, matching this project's own device/asus/anakin
# PRODUCT_BUILD_PROP_OVERRIDES - a recovery isn't tied to any one ROM, so it
# shouldn't carry a DerpFest-specific fingerprint (what the generator extracted
# from our own boot.img, since that boot.img happened to be DerpFest-built).
# "PRIVATE_BUILD_DESC" also isn't a recognized PRODUCT_BUILD_PROP_OVERRIDES key
# in AOSP's sysprop generation - "BuildDesc" is the correct one, confirmed by
# this project's own already-working derp_anakin.mk.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="WW_I005D-user 13 TKQ1.220807.001 33.0210.0210.200 release-keys"

BUILD_FINGERPRINT := asus/WW_I005D/ASUS_I005D:13/TKQ1.220807.001/33.0210.0210.200:user/release-keys
