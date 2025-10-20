#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter borneo capri caprip cebu guam guamna guamp devon hawao rhode, $(TARGET_DEVICE)),)
include $(call all-makefiles-under, $(LOCAL_PATH))

include $(CLEAR_VARS)

include $(CLEAR_VARS)
LOCAL_MODULE := fastcv_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := device/qcom/common/vendor/media/legacy/include
include $(BUILD_HEADER_LIBRARY)

endif
