# Copyright (C) 2016 The CyanogenMod Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/j2xlte/j2xlte.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := j2xlte
PRODUCT_RELEASE_NAME := j2xlte
PRODUCT_NAME := lineage_j2xlte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J210F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=j3xnltexx \
    PRIVATE_BUILD_DESC="j2xltedd-user 6.0.1 MMB29Q J210FXXU0ARA2 test-keys"

BUILD_FINGERPRINT := samsung/j2xltedd/j2xlte:6.0.1/MMB29Q/J210FXXU0ARA2:user/test-keys
