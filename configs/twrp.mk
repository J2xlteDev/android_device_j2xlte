#######################################################
# TWRP
RECOVERY_VARIANT := twrp

# Display
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
RECOVERY_GRAPHICS_FORCE_SINGLE_BUFFER := true
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162

# Storage
RECOVERY_SDCARD_ON_DATA := true

# Keys
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../$(PLATFORM_PATH)/recovery/recovery_keys.c
BOARD_HAS_NO_SELECT_BUTTON := true

# Crypto.
TW_INCLUDE_CRYPTO := true

# Misc.
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_EXFAT_FUSE := true
TW_NEW_ION_HEAP := true
TW_MTP_DEVICE := "/dev/mtp_usb"
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_TWRPAPP := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone1/temp"
BOARD_RECOVERY_SWIPE := true

# TWRP recovery fstab
ifeq ($(RECOVERY_VARIANT), twrp)
PRODUCT_COPY_FILES += $(PLATFORM_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab
endif
