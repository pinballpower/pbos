################################################################################
#
# enablewifi
#
################################################################################

ENABLEWIFI_DEPENDENCIES += wpa_supplicant

define ENABLEWIFI_INSTALL_INIT_SYSV
    $(INSTALL) -D -m 755 $(BR2_EXTERNAL_PBOS_PATH)/package/enablewifi/wifi.init $(TARGET_DIR)/etc/init.d/S41wifi
    if [ -e $(BR2_EXTERNAL_PBOS_PATH)/package/enablewifi/wpa_supplicant.conf ]; then \
	    $(INSTALL) -D -m 755 $(BR2_EXTERNAL_PBOS_PATH)/package/enablewifi/wpa_supplicant.conf $(TARGET_DIR)/etc/wpa_supplicant.conf; \
    fi
endef

$(eval $(call generic-package))

