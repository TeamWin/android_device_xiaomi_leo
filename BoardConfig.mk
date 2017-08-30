DEVICE_PATH := device/xiaomi/leo

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/xiaomi/leo/BoardConfigVendor.mk

#Platform
TARGET_BOARD_PLATFORM := msm8994
TARGET_BOOTLOADER_BOARD_NAME := msm8994
TARGET_NO_BOOTLOADER := true
BOOTLOADER_PLATFORM := msm8994 # use msm8994 LK configuration
TARGET_BOARD_PLATFORM_GPU := qcom-adreno430
TARGET_BOARD_SUFFIX := _64

#Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

ENABLE_CPUSETS := true

TARGET_USES_64_BIT_BINDER := true
TARGET_CPU_SMP := true

# Graphics
BOARD_USES_ADRENO := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_OVERLAY := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_GRALLOC1_ADAPTER := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048
TARGET_USES_HWC2 := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# Assertions
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := NotePro,leo

HAVE_ADRENO_SOURCE:= false
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
BOARD_USES_OPENSSL_SYMBOLS := true

# Enable keymaster app checking
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true
USE_DEVICE_SPECIFIC_LOC_API := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-uart"

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_NO_RPC := true
BOARD_SUPPORTS_SOUND_TRIGGER := false

AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAS_QCA_BT_ROME := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/leo/bluetooth
QCOM_BT_USE_BTNV := true
QCOM_BT_USE_SMD_TTY := true
WCNSS_FILTER_USES_SIBS := true

USE_OPENGL_RENDERER := true
BOARD_USE_LEGACY_UI := true

#Kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/leo
TARGET_KERNEL_CONFIG := leo_user_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-5 androidboot.selinux=permissive
TARGET_KERNEL_APPEND_DTB := true
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/qca_cld
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/qca_cld/qca_cld_wlan.ko
	ln -sf /system/lib/modules/qca_cld/qca_cld_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864 #64M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864 #64M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1744830464 #1920M
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184 #384M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 59852700672 #58G
TARGET_USERIMAGES_USE_EXT4 := true
ifneq (,$(filter linux darwin, $(HOST_OS)))
TARGET_USERIMAGES_USE_F2FS := true
endif
BOARD_FLASH_BLOCK_SIZE := 131072 #262144 #(BOARD_KERNEL_PAGESIZE * 64)

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# CNE
BOARD_USES_QCNE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
# Force camera module to be compiled only in 32-bit mode on 64-bit systems
# Once camera module can run in the native mode of the system (either
# 32-bit or 64-bit), the following line should be deleted
BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true

#Light HAL
TARGET_PROVIDES_LIBLIGHT := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

#Disable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := false

#Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true
BOARD_GLOBAL_CFLAGS += -DIS_MIUI_SENSOR

# QC_AV
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Ril
FEATURE_QCRIL_UIM_SAP_SERVER_MODE := true
TARGET_RIL_VARIANT := caf

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# CM Hardware
BOARD_USES_CM_HARDWARE = true
BOARD_HARDWARE_CLASS := device/xiaomi/leo/cmhw

# Wifi
BOARD_HAS_QCOM_WLAN             := true
BOARD_HAS_QCOM_WLAN_SDK         := true
BOARD_HOSTAPD_DRIVER            := NL80211
BOARD_HOSTAPD_PRIVATE_LIB       :=lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE               := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER :=  NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_WCNSS_CTRL          := true
WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME         := "wlan"
WIFI_DRIVER_FW_PATH_AP          := "ap"
WIFI_DRIVER_FW_PATH_STA         := "sta"
TARGET_USES_QCOM_WCNSS_QMI      := true
WPA_SUPPLICANT_VERSION          := VER_0_8_X

#Recovery
#RECOVERY_VARIANT := twrp
ifneq ($(RECOVERY_VARIANT),twrp)
#TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/recovery.fstab
else
TW_THEME := portrait_hdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/twrp/twrp.fstab
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true
DEVICE_RESOLUTION := 1080x1920
RECOVERY_SDCARD_ON_DATA := true
TW_NEW_ION_HEAP := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_TARGET_USES_QCOM_BSP := true
TW_EXTRA_LANGUAGES := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
TW_NO_EXFAT_FUSE := true
TW_NO_EXFAT := true
endif

# Releasetools
# TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_leo
# TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# SELinux
# include device/qcom/sepolicy/sepolicy.mk

# BOARD_SEPOLICY_DIRS += device/xiaomi/leo/sepolicy
