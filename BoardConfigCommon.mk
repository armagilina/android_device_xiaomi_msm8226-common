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

COMMON_PATH := device/xiaomi/msm8226-common

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true

QCOM_BOARD_PLATFORMS              := msm8226
TARGET_BOARD_PLATFORM             := msm8226
TARGET_BOOTLOADER_BOARD_NAME      := MSM8226

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -DQCOM_HARDWARE
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Architecture
TARGET_ARCH_VARIANT_CPU    := cortex-a9
TARGET_CPU_ABI             := armeabi-v7a
TARGET_CPU_ABI2            := armeabi
TARGET_CPU_SMP             := true
TARGET_CPU_VARIANT         := krait
TARGET_ARCH                := arm
TARGET_ARCH_VARIANT        := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_USES_QCOM_HARDWARE   := true
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
TARGET_CPU_VARIANT := krait

# Krait optimizations
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET             := true
TARGET_KRAIT_BIONIC_PLDOFFS          := 10
TARGET_KRAIT_BIONIC_PLDTHRESH        := 10
TARGET_KRAIT_BIONIC_BBTHRESH         := 64
TARGET_KRAIT_BIONIC_PLDSIZE          := 64

TARGET_PREBUILT_KERNEL :=

# Power
TARGET_POWERHAL_VARIANT := qcom

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# FM
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED
QCOM_FM_ENABLED := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_ENABLED_FM := true

BOARD_EGL_CFG := $(COMMON_PATH)/rootdir/etc/egl.cfg

TARGET_USES_QCOM_BSP        := true

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Display
TARGET_USES_ION             := true
USE_OPENGL_RENDERER         := true
TARGET_USES_C2D_COMPOSITION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
#TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Media
#COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Shader cache config options
# Maximum size of the GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_FM := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true

# GPS
#The below will be needed if we ever want to build GPS HAL from source
#TARGET_PROVIDES_GPS_LOC_API := true
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
#TARGET_NO_RPC := true

# Camera
COMMON_GLOBAL_CFLAGS       += -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"xiaomi.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0}, {"persist.camera.", AID_MEDIA, 0},'

# Bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_QCOM                   := true
BLUETOOTH_HCI_USE_MCT                       := true

# Webkit
ENABLE_WEBGL            := true
TARGET_FORCE_CPU_UPLOAD := true

# Recovery
TARGET_RECOVERY_FSTAB            := $(COMMON_PATH)/rootdir/ramdisk/fstab.qcom
RECOVERY_FSTAB_VERSION           := 2
TARGET_RECOVERY_PIXEL_FORMAT     := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON       := true
BOARD_CHARGING_CMDLINE_NAME := "androidboot.mode"
BOARD_CHARGING_CMDLINE_VALUE := "hwcharger"

BOARD_USES_SECURE_SERVICES := true

USE_DEVICE_SPECIFIC_CAMERA:= true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

BOARD_USES_LEGACY_MMAP := true

MALLOC_IMPL := dlmalloc

# SELinux
include device/qcom/sepolicy/sepolicy.mk
