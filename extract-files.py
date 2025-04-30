#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
        "device/motorola/borneo",
        "device/motorola/sm6225-common",
        "hardware/qcom/display",
        "hardware/qcom/display/gralloc",
        "hardware/qcom/display/libdebug",
        "hardware/qcom/display/sde-drm",
        "hardware/motorola",
        "vendor/qcom/common/vendor/display",
        "vendor/qcom/common/vendor/display/4.19",
        "vendor/qcom/common/vendor/gps-legacy",
        "vendor/qcom/common/vendor/keymaster",
        "vendor/qcom/common/vendor/media-legacy",
        "vendor/qcom/common/vendor/wlan-legacy",
        "vendor/qcom/common/system/av",
        "vendor/qcom/common/system/telephony",
        "vendor/qcom/common/system/perf",
        "vendor/qcom/common/vendor/perf",
        "vendor/qcom/common/system/wfd",
        "vendor/qcom/common/system/display"
]


def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None


lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'com.qualcomm.qti.dpm.api@1.0',
        'vendor.qti.hardware.fm@1.0',
        'vendor.qti.imsrtpservice@3.0',
        'com.qualcomm.qti.uceservice*',
        'vendor.qti.data.*',
        'vendor.qti.diaghal@1.0',
        'vendor.qti.hardware.data.*',
        'vendor.qti.hardware.mwqemadapter@1.0',
        'vendor.qti.hardware.radio.*',
        'vendor.qti.ims.*',
        'vendor.qti.latency*',
        'vendor.qti.qspmhal@1.0',
        'libril'
    ): lib_fixup_vendor_suffix,
    (
        'libqsap_sdk',
        'libwpa_client',
    ): lib_fixup_remove,
}

blob_fixups: blob_fixups_user_type = {
    'system_ext/etc/permissions/moto-telephony.xml': blob_fixup()
        .regex_replace('/system/', '/system_ext/'),
    'system_ext/priv-app/ims/ims.apk': blob_fixup()
        .apktool_patch('ims-patches'),
    'vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so': blob_fixup()
        .sig_replace('13 0A 00 94', '1F 20 03 D5'),
    'vendor/lib64/libwvhidl.so': blob_fixup()
        .add_needed('libcrypto_shim.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'sm6225-common',
    'motorola',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
