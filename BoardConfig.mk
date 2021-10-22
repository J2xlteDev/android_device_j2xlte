# inherit from samsung sharkls-common
-include device/samsung/sharkls-common/BoardConfigCommon.mk

# kernel
TARGET_KERNEL_CONFIG := j2xlte_defconfig
#TARGET_KERNEL_CONFIG := j2xlte_permissive_defconfig

# Init
TARGET_INIT_VENDOR_LIB := libinit_j2xlte
TARGET_RECOVERY_DEVICE_MODULES := libinit_j2xlte
