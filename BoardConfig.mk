# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2021 The LineageOS Project
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

DEVICE_PATH := device/samsung/hlte
COMMON_PATH := device/samsung/msm8974-common

# inherit from msm8974-common
include device/samsung/msm8974-common/BoardConfigCommon.mk

# Bluetooth
BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/bluetooth/vnd_hlte.txt

# OTA
TARGET_OTA_ASSERT_DEVICE := hlte,hltespr,hltexx

# Partition
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2365587456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651290624

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Include light
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/hlte-include

# Init
TARGET_INIT_VENDOR_LIB := libinit_hlte

# Kernel
TARGET_KERNEL_CONFIG := lineage_hlte_bcm2079x_defconfig

# NFC
include $(COMMON_PATH)/nfc/bcm2079x/board.mk

# Radio/RIL
include $(COMMON_PATH)/radio/single/board.mk

# inherit from the proprietary version
include vendor/samsung/hlte/BoardConfigVendor.mk
include vendor/samsung/hlte-common/BoardConfigVendor.mk
