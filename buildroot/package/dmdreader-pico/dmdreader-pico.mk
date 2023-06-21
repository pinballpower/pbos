################################################################################
#
# dmdreader-pico
#
################################################################################

DMDREADER_PICO_VERSION=v0.1-alpha
DMDREADER_PICO_BINARY_NAME=dmdreader.elf
DMDREADER_PICO_SOURCE=$(DMDREADER_PICO_BINARY_NAME)
DMDREADER_PICO_SITE=https://github.com/pinballpower/code_dmd/releases/download/$(DMDREADER_PICO_VERSION)$

define DMDREADER_PICO_EXTRACT_CMDS
endef

define DMDREADER_PICO_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/firmware
    $(INSTALL) -D -m 0644 $(DMDREADER_PICO_DL_DIR)/$(DMDREADER_PICO_BINARY_NAME) $(TARGET_DIR)/firmware
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PBOS_PATH)/package/dmdreader-pico/program-rp2040.sh \
                $(TARGET_DIR)/firmware
    $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_PBOS_PATH)/package/dmdreader-pico/raspberrypi-swd-dmdreader.cfg \
	    	$(TARGET_DIR)/firmware
endef

define DMDREADER_PICO_INSTALL_INIT_SYSV
    $(INSTALL) -D -m 755 $(BR2_EXTERNAL_PBOS_PATH)/package/dmdreader-pico/firmware-2040.init $(TARGET_DIR)/etc/init.d/S10firmware2040
endef

$(eval $(call generic-package))

