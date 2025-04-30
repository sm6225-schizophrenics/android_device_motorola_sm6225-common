#
# SPDX-FileCopyrightText: 2022-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/motorola/sm6225-common

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

# Audio
AUDIO_FEATURE_ENABLED_DLKM := false
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_USES_ALSA_AUDIO := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Broken
BUILD_BROKEN_DUP_RULES := true

# Filesystem
TARGET_FS_CONFIG_GEN := \
     $(COMMON_PATH)/config.fs \
     $(COMMON_PATH)/mot_aids.fs

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

LOC_HIDL_VERSION := 4.0

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(COMMON_PATH)/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml
ODM_MANIFEST_FILES := $(COMMON_PATH)/manifest-qva.xml
PRODUCT_ENFORCE_VINTF_MANIFEST := false

# Init
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_sm6225

# Kernel
BOARD_BOOT_HEADER_VERSION ?= 3
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyMSM0 \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    console=ttyMSM0,115200n8 \
    earlycon=msm_geni_serial,0x4a90000 \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    swiotlb=2048
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_KERNEL_VERSION := 4.19

BOARD_VENDOR_KERNEL_MODULES := \
     $(KERNEL_MODULES_OUT)/adsp_loader_dlkm.ko \
     $(KERNEL_MODULES_OUT)/apr_dlkm.ko \
     $(KERNEL_MODULES_OUT)/bolero_cdc_dlkm.ko \
     $(KERNEL_MODULES_OUT)/machine_dlkm.ko \
     $(KERNEL_MODULES_OUT)/mbhc_dlkm.ko \
     $(KERNEL_MODULES_OUT)/native_dlkm.ko \
     $(KERNEL_MODULES_OUT)/pinctrl_lpi_dlkm.ko \
     $(KERNEL_MODULES_OUT)/platform_dlkm.ko \
     $(KERNEL_MODULES_OUT)/pm2250_spmi_dlkm.ko \
     $(KERNEL_MODULES_OUT)/q6_dlkm.ko \
     $(KERNEL_MODULES_OUT)/q6_notifier_dlkm.ko \
     $(KERNEL_MODULES_OUT)/q6_pdr_dlkm.ko \
     $(KERNEL_MODULES_OUT)/rouleur_dlkm.ko \
     $(KERNEL_MODULES_OUT)/rouleur_slave_dlkm.ko \
     $(KERNEL_MODULES_OUT)/rx_macro_dlkm.ko \
     $(KERNEL_MODULES_OUT)/snd_event_dlkm.ko \
     $(KERNEL_MODULES_OUT)/aw882xx_dlkm.ko \
     $(KERNEL_MODULES_OUT)/stub_dlkm.ko \
     $(KERNEL_MODULES_OUT)/swr_dlkm.ko \
     $(KERNEL_MODULES_OUT)/swr_ctrl_dlkm.ko \
     $(KERNEL_MODULES_OUT)/tx_macro_dlkm.ko \
     $(KERNEL_MODULES_OUT)/usf_dlkm.ko \
     $(KERNEL_MODULES_OUT)/va_macro_dlkm.ko \
     $(KERNEL_MODULES_OUT)/wcd937x_dlkm.ko \
     $(KERNEL_MODULES_OUT)/wcd937x_slave_dlkm.ko \
     $(KERNEL_MODULES_OUT)/wcd9xxx_dlkm.ko \
     $(KERNEL_MODULES_OUT)/wcd_core_dlkm.ko \
     $(KERNEL_MODULES_OUT)/wsa881x_analog_dlkm.ko \
     $(KERNEL_MODULES_OUT)/wlan.ko

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USES_METADATA_PARTITION := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

BOARD_SUPER_PARTITION_SIZE ?= 7583301632
BOARD_SUPER_PARTITION_GROUPS := moto_dynamic_partitions
BOARD_MOTO_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE ?= 7579107328 # BOARD_SUPER_PARTITION_SIZE - 4MB

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_USERIMAGES_USE_EXT4 := false
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

BOARD_EROFS_COMPRESSOR := lz4
BOARD_EROFS_PCLUSTER_SIZE := 262144

# Platform

BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/fsg:/fsg

# Power
TARGET_USES_INTERACTION_BOOST := true

# Properties
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(COMMON_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true

# Sepolicy
#include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# WiFi
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"

# Inherit from the proprietary version
include vendor/motorola/sm6225-common/BoardConfigVendor.mk
