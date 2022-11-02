#
# Copyright (C) 2021 ArrowOS
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true

# Inherit proprietary blobs
$(call inherit-product, vendor/realme/x3/x3-vendor.mk)

# Inherit GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong

# APN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Bluetooth
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/qcom/opensource/commonsys-intf/bluetooth/overlay/generic

# GCam
PRODUCT_PACKAGES += \
    GoogleCameraGo

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Dex/ART optimization
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
USE_DEX2OAT_DEBUG := false
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
WITH_DEXPREOPT_DEBUG_INFO := false

# Display
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Doze
PRODUCT_PACKAGES += \
    RealmeDoze

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.x3 \
    vendor.oplus.hardware.biometrics.fingerprint@2.1

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor_overlay/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    libhidltransport \
    libhwbinder

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.device.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.device.rc \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.safailnet.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.safailnet.rc \
    $(LOCAL_PATH)/rootdir/bin/init.set_baseband.sh:$(TARGET_COPY_OUT_PRODUCT)/bin/init.set_baseband.sh

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    NotchBarKiller

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_EXTRA_VNDK_VERSIONS := 30
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Parts
PRODUCT_PACKAGES += \
    RealmeParts

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/parts/init/realmeparts.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/realmeparts.rc

# Permissions
PRODUCT_PROPERTY_OVERRIDES += ro.control_privapp_permissions=log

# Inherit several Android Go Configurations (Beneficial for everyone, even on non-Go devices)
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

# RCS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/oplus

# System
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.binary_xml=false

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Settings \
    SystemUI

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic.x3

# Vendor overlay
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/vendor_overlay/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION))

# WiFi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay

# Permission
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/permissions/privapp-permissions-whitelist-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-whitelist-system_ext.xml
