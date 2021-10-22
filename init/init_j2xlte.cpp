#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

static void import_kernel_hwrev(const std::string& key, const std::string& value, bool for_emulator)
{
    if (key.empty()) return;

    if (key == "hw_revision") {
        property_set("ro.revision", value.c_str());
    }
}

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void vendor_load_properties()
{
    std::string platform = property_get("ro.board.platform");
    if (platform.empty() || platform != ANDROID_TARGET)
        return;

    import_kernel_cmdline(false, import_kernel_hwrev);
    std::string revision = property_get("ro.revision");
    if (revision.empty())
        property_set("ro.revision", "0");
    
    char* simslot_count_path = (char *)"/proc/simslot_count";
    // Create a two byte array, so we can use it as a string
    char simslot_count[2] = "\0";
    
    // Open the file as read-only
    FILE* file = fopen(simslot_count_path, "r");
    if (file != NULL) {
        simslot_count[0] = fgetc(file);
        property_set("ro.multisim.simslotcount", simslot_count);
        property_set("ro.msms.phone_count", simslot_count);
        property_set("ro.modem.w.count", simslot_count);
        property_set("persist.msms.phone_count", simslot_count);
        if (simslot_count[0] == '2')
            property_set("persist.radio.multisim.config", "dsds");

        fclose(file);
    }

    std::string bootloader = property_get("ro.bootloader");
    if (strstr(bootloader.c_str(), "J320FN") == NULL) {
        if (strstr(bootloader.c_str(), "J210F")) {
            /* SM-J210F NullCode */
            property_override("ro.product.model", "SM-J210F");
            property_override("ro.product.name", "j210fdd");
            property_override("ro.build.description",
                "j2xltedd-user 6.0.1 MMB29Q J210FXXU0ARA2 test-keys");
            property_override("ro.build.fingerprint",
                "samsung/j2xltedd/j2xlte:6.0.1/MMB29Q/J210FXXU0ARA2:user/test-keys");
            property_override("ro.bootimage.build.fingerprint",
                "samsung/j2xltedd/j2xlte:6.0.1/MMB29Q/J210FXXU0ARA2:user/test-keys");
        } else {
            /* SM-J320M */
            property_override("ro.product.model", "SM-J320M");
            property_override("ro.product.name", "j3xlteub");
            property_override("ro.build.description", 
                "j3xlteub-user 5.1.1 LMY47V J320MVJU0ARH1 release-keys");
            property_override("ro.build.fingerprint", 
                "samsung/j3xlteub/j3xlte:5.1.1/LMY47V/J320MVJU0ARH1:user/release-keys");
            property_override("ro.bootimage.build.fingerprint", 
                "samsung/j3xlteub/j3xlte:5.1.1/LMY47V/J320MVJU0ARH1:user/release-keys");
        }
    }

    std::string device = property_get("ro.product.device");
    INFO("Found bootloader id %s setting build properties for %s device\n", bootloader.c_str(), device.c_str());
}
