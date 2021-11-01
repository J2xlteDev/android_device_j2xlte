PLATFORM_PATH := device/samsung/j2xlte

BOARD_NEEDS_MEMORYHEAPION_SPRD := true
TARGET_BOOTLOADER_BOARD_NAME   := SC9830I
DEVICE_RESOLUTION              := 720x1280
BOARD_USE_EMMC                 := true

# Import Camera and TWRP configs
-include $(PLATFORM_PATH)/configs/camera.mk
-include $(PLATFORM_PATH)/configs/twrp.mk

# Architecture
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER  := true
TARGET_NO_RADIOIMAGE  := true
TARGET_BOARD_PLATFORM := sc8830
TARGET_CPU_ABI        := armeabi-v7a
TARGET_CPU_ABI2       := armeabi
TARGET_ARCH_VARIANT   := armv7-a-neon
TARGET_CPU_VARIANT    := cortex-a7
TARGET_CPU_SMP        := true
WITH_SU               := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Init
TARGET_INIT_VENDOR_LIB         := libinit_j2xlte
TARGET_RECOVERY_DEVICE_MODULES := libinit_j2xlte

# Kernel
TARGET_KERNEL_CONFIG := j2xlte_defconfig
#TARGET_KERNEL_CONFIG := j2xlte_permissive_defconfig
TARGET_KERNEL_SOURCE     := kernel/samsung/j2xlte
TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS  := true
NEED_KERNEL_MODULE_ROOT  := true
BOARD_KERNEL_SEPARATED_DT := true

GPU_DRIVER_PATH  := vendor/sprd/modules/libgpu/gpu/utgard
WLAN_DRIVER_PATH := vendor/sprd/wcn/wifi/sc2331/6.0

TARGET_KERNEL_MODULES          := SPRD_MODULES
TARGET_IGNORE_RO_BOOT_REVISION := true

BOARD_KERNEL_CMDLINE  := console=ttyS1,115200n8
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS  := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --cmdline 'console=ttyS1,115200n8'

BOARD_CUSTOM_BOOTIMG_MK := $(PLATFORM_PATH)/mkbootimg.mk
TARGET_CUSTOM_DTBTOOL   := dtbToolSprd

# Fix this by examining /proc/mtd on a working device
# Reserve space for data encryption (5272240128-16384)
BOARD_BOOTIMAGE_PARTITION_SIZE     := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5272223744
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 10485760
BOARD_FLASH_BLOCK_SIZE             := 131072

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_HAS_LARGE_FILESYSTEM  := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_USERIMAGES_USE_EXT4  := true
TARGET_USERIMAGES_USE_F2FS  := true

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Bionic
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH  := 720
TARGET_BOOTANIMATION_PRELOAD       := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# telephony
BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_RILD   := true
USE_BOOT_AT_DIAG      := true
BOARD_RIL_CLASS       := ../../../$(PLATFORM_PATH)/ril/java/

# lights
TARGET_PROVIDES_LIBLIGHT := true

# Graphics
TARGET_GPU_PLATFORM             := utgard
USE_SPRD_HWCOMPOSER             := true
USE_OPENGL_RENDERER             := true
USE_OVERLAY_COMPOSER_GPU        := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH   := "/sys/devices/20200000.usb/gadget/lun%d/file"

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Audio
BOARD_USES_GENERIC_AUDIO  := true
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_ALSA_AUDIO     := false
BUILD_WITH_ALSA_UTILS     := false
BOARD_AUDIO_OLD_MODEM     := false

# power
BOARD_POWERHINT_HAL       := interactive

# Charger
BOARD_CHARGER_ENABLE_SUSPEND     := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_NO_CHARGER_LED             := true
HAVE_KEYBOARD_BACKLIGHT          := false
BACKLIGHT_PATH                   := "/sys/class/backlight/panel/brightness"
BOARD_CHARGING_MODE_BOOTING_LPM  := "/sys/class/power_supply/battery/batt_lp_charging"
CHARGING_ENABLED_PATH            := "/sys/class/power_supply/battery/batt_lp_charging"
PATH_WHITELIST_EXTRA_H           := "/sys/devices/sec-battery.4/power_supply/battery/batt_lp_charging"

# Bluetooth
BOARD_HAVE_BLUETOOTH    := true
SPRD_WCNBT_CHISET       := marlin
BOARD_SPRD_WCNBT_MARLIN := true

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/configs/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(PLATFORM_PATH)/configs/bluetooth/libbt_vndcfg.txt

# WIFI configs
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_sprdwl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_sprdwl
BOARD_WLAN_DEVICE           := sc2341
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/fwpath"
WIFI_DRIVER_FW_PATH_STA     := "sta_mode"
WIFI_DRIVER_FW_PATH_P2P     := "p2p_mode"
WIFI_DRIVER_FW_PATH_AP      := "ap_mode"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/sprdwl.ko"
WIFI_DRIVER_MODULE_NAME     := "sprdwl"

# FM
BOARD_HAVE_SPRD_FM      := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# DRM & Assert
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3
TARGET_OTA_ASSERT_DEVICE       := j3xnlte,j3xnltexx,j2xlte,j2xltedd,j3xlte

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(PLATFORM_PATH)/sepolicy

# build.prop
TARGET_SYSTEM_PROP := $(PLATFORM_PATH)/system.prop

# Recovery
TARGET_RECOVERY_DEVICE_DIRS := $(PLATFORM_PATH)
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/recovery/recovery.fstab

ifeq ($(TARGET_BUILD_VARIANT),eng)
MBUILD_VAR := debug
else
MBUILD_VAR := release
endif

SPRD_MODULES:
	mkdir -p $(PRODUCT_OUT)/system/lib/modules
	$(hide) if grep -q '^CONFIG_MODULES=y' $(KERNEL_CONFIG); then \
			echo "Installing Kernel Modules"; \
			$(MAKE) $(MAKE_FLAGS) -C $(KERNEL_SRC) O=$(KERNEL_OUT) ARCH=$(KERNEL_ARCH) $(KERNEL_CROSS_COMPILE) INSTALL_MOD_PATH=../../$(KERNEL_MODULES_INSTALL) modules_install && \
			mofile=$$(find $(KERNEL_MODULES_OUT) -type f -name modules.order) && \
			mpath=$$(dirname $$mofile) && \
			for f in $$(find $$mpath/kernel -type f -name '*.ko'); do \
				$(KERNEL_TOOLCHAIN_PATH)strip --strip-unneeded $$f; \
				mv $$f $(KERNEL_MODULES_OUT); \
				mfile=$$(basename $$f); \
				ln -sf /lib/modules/$$mfile $(PRODUCT_OUT)/system/lib/modules/$$mfile; \
			done && \
			rm -rf $$mpath; \
		fi
	make $(MAKE_FLAGS) -C $(GPU_DRIVER_PATH) MALI_PLATFORM=sc8830 BUILD=$(MBUILD_VAR) KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(KERNEL_CROSS_COMPILE) clean
	make $(MAKE_FLAGS) -C $(GPU_DRIVER_PATH) MALI_PLATFORM=sc8830 BUILD=$(MBUILD_VAR) KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(KERNEL_CROSS_COMPILE)
	make $(MAKE_FLAGS) -C $(WLAN_DRIVER_PATH) SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=$(MBUILD_VAR) KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(KERNEL_CROSS_COMPILE) clean
	make $(MAKE_FLAGS) -C $(WLAN_DRIVER_PATH) SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=$(MBUILD_VAR) KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(KERNEL_CROSS_COMPILE)
	mv $(GPU_DRIVER_PATH)/mali.ko $(KERNEL_MODULES_OUT)
	mv $(WLAN_DRIVER_PATH)/sprdwl.ko $(KERNEL_MODULES_OUT)
	ln -sf /lib/modules/mali.ko $(PRODUCT_OUT)/system/lib/modules/mali.ko
	ln -sf /lib/modules/sprdwl.ko $(PRODUCT_OUT)/system/lib/modules/sprdwl.ko
