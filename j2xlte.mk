LOCAL_PATH := device/samsung/j2xlte

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/j2xlte/j2xlte-vendor.mk)

# Inherit from sharkls-common
$(call inherit-product, device/samsung/sharkls-common/sharkls.mk)
