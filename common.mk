#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL aries devices, and
# are also specific to aries devices
#
# Everything in this directory will become public

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

COMMON_PATH := device/xiaomi/msm8226-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/ramdisk/fstab.qcom:root/fstab.qcom \
    $(COMMON_PATH)/rootdir/ramdisk/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(COMMON_PATH)/rootdir/ramdisk/init.class_main.sh:root/init.class_main.sh \
    $(COMMON_PATH)/rootdir/ramdisk/init.mdm.sh:root/init.mdm.sh \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.factory.sh:root/init.qcom.factory.sh \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.rc:root/init.qcom.rc \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.sh:root/init.qcom.sh \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    $(COMMON_PATH)/rootdir/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(COMMON_PATH)/rootdir/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \

# Charger
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/ramdisk/chargeonlymode:root/sbin/chargeonlymode

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    $(COMMON_PATH)/rootdir/etc/init.crda.sh:system/etc/init.crda.sh \
    $(COMMON_PATH)/rootdir/etc/init.qcom.audio.sh:system/etc/init.qcom.audio.sh \
    $(COMMON_PATH)/rootdir/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(COMMON_PATH)/rootdir/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    $(COMMON_PATH)/rootdir/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    $(COMMON_PATH)/rootdir/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

# WIFI
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(COMMON_PATH)/rootdir/wifi/wpa_supplicant_ath6kl.conf:system/etc/wifi/wpa_supplicant_ath6kl.conf \
    $(COMMON_PATH)/rootdir/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay \
    $(COMMON_PATH)/rootdir/wifi/wpa_supplicant_wcn.conf:system/etc/wifi/wpa_supplicant_wcn.conf \
    $(COMMON_PATH)/rootdir/wifi/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(COMMON_PATH)/rootdir/wifi/firmware/wlan/prima/WCNSS_qcom_wlan_nv_h3gbl.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_h3gbl.bin \
    $(COMMON_PATH)/rootdir/wifi/firmware/wlan/prima/WCNSS_qcom_wlan_nv_h3td.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_h3td.bin \
    $(COMMON_PATH)/rootdir/wifi/firmware/wlan/prima/WCNSS_qcom_wlan_nv_h3w.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_h3w.bin

# Hostapd
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(COMMON_PATH)/rootdir/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(COMMON_PATH)/rootdir/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/audio_policy.conf:system/etc/audio_policy.conf

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(COMMON_PATH)/rootdir/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_PATH)/rootdir/etc/media_codecs.xml:system/etc/media_codecs.xml

# BT
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# FM
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# Boot
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# GPS configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/gps.conf:system/etc/gps.conf \
    $(COMMON_PATH)/rootdir/etc/izat.conf:system/etc/izat.conf \
    $(COMMON_PATH)/rootdir/etc/lowi.conf:system/etc/lowi.conf \
    $(COMMON_PATH)/rootdir/etc/lut.dat:system/etc/lut.dat

# Power
PRODUCT_PACKAGES += \
    power.msm8226

# Radio
PRODUCT_BOOT_JARS += \
    qcrilhook

# mpdecision configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/thermal-engine-8226.conf:system/etc/thermal-engine-8226.conf

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/modem/Diag.cfg:system/etc/modem/Diag.cfg

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/usr/keylayout/atmel-maxtouch.kl:system/usr/keylayout/atmel-maxtouch.kl \
    $(COMMON_PATH)/rootdir/usr/keylayout/ft5x06.kl:system/usr/keylayout/ft5x06.kl \
    $(COMMON_PATH)/rootdir/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/rootdir/usr/keylayout/ist30xx.kl:system/usr/keylayout/ist30xx.kl \
    $(COMMON_PATH)/rootdir/usr/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    ril.subscription.types=RUIM \
    persist.radio.apm_sim_not_pwdn=0 \
    ro.telephony.call_ring.multiple=0

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    wlan.driver.ath=0

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so
    com.qc.hardware=true \
    ro.qc.sdk.sensors.gestures=false \
    ro.qc.sensors.wl_dis=true

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    persist.audio.lowlatency.rec=false \
    ro.qc.sdk.audio.fluencetype=none \
    af.resampler.quality=255 \
    lpa.use-stagefright=true \
    qcom.hw.aac.encoder=true \
    lpa.decode=false \
    tunnel.decode=false \
    tunnel.audiovideo.decode=false \
    mm.enable.qcom_parser=33395 \
    media.aac_51_output_enabled=true

# BT
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd \
    ro.bluetooth.request.master=true \
    ro.bluetooth.remote.autoconnect=true \
    bluetooth.a2dp.sink.enabled=false

# transmitter isn't supported
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.transmitter=false

# netmgrd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.rmnet.mux=disabled

# OpenGL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    debug.egl.recordable.rgba8888=1

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=dyn \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    ro.sf.lcd_density=320

# Power Profile
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.sys.aries.power_profile=middle

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.vold.umsdirtyratio=50 \
    persist.sys.isUsbOtgEnabled=1

# Gps
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qmienabled=true

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g \
    mkntfs \
    dumpe2fs \
    resize2fs \
    e2fsck_static \
    mke2fs_static \
    resize2fs_static \
    mkfs.f2fs

# Display
PRODUCT_PACKAGES += \
    copybit.msm8226 \
    gralloc.msm8226 \
    hwcomposer.msm8226 \
    libtinyxml \
    memtrack.msm8226

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8226 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8226 \
    audiod \
    tinymix

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libaudioparameter \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8226

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libdashplayer \
    libstagefrighthw \
    libmm-omxcore \
    qcmediaplayer

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# fmradio support
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2 \
    FMRecord

# Qualcomm random numbers generated
PRODUCT_PACKAGES += \
    qrngd

PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    libcurl \
    libqsap_sdk \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    dhcpcd.conf \
    wcnss-service

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.use-awesome=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

