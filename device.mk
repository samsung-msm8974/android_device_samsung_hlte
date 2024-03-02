#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2018,2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/samsung/msm8974-common

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/hlte/hlte-vendor.mk)

# Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS := *

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/audio/hlte/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(COMMON_PATH)/audio/hlte/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Display Device Config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/displayconfig/hlte/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# Input device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/sec_e-pen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/sec_e-pen.idc

# Gestures
PRODUCT_PACKAGES += \
    org.lineageos.keyhandler

# Keylayouts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keylayout/hlte/Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Button_Jack.kl \
    $(COMMON_PATH)/keylayout/hlte/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/keylayout/hlte/philips_remote_ir.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/philips_remote_ir.kl \
    $(COMMON_PATH)/keylayout/hlte/samsung_remote_ir.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/samsung_remote_ir.kl \
    $(COMMON_PATH)/keylayout/hlte/sec_touchkey.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sec_touchkey.kl \
    $(COMMON_PATH)/keylayout/hlte/ue_rf4ce_remote.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ue_rf4ce_remote.kl

# NFC
$(call inherit-product, device/samsung/msm8974-common/nfc/bcm2079x/product.mk)

# common msm8974
$(call inherit-product, device/samsung/msm8974-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/hlte-common/hlte-common-vendor.mk)
