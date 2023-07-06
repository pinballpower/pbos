################################################################################
#
# configtxt
#
################################################################################

CONFIGTXT_DEPENDENCIES = rpi-firmware

define CONFIGTXT_INSTALL_TARGET_CMDS
        echo "# Enable SPI" >> $(BINARIES_DIR)/rpi-firmware/config.txt
	echo "dtparam=i2c=on" >> $(BINARIES_DIR)/rpi-firmware/config.txt
	echo "dtparam=spi=on" >> $(BINARIES_DIR)/rpi-firmware/config.txt
	echo "boot_delay=0" >> $(BINARIES_DIR)/rpi-firmware/config.txt
        echo "disable_splash=1" >> $(BINARIES_DIR)/rpi-firmware/config.txt
        echo "force_eeprom_read=0" >> $(BINARIES_DIR)/rpi-firmware/config.txt
        echo "force_turbo=0" >> $(BINARIES_DIR)/rpi-firmware/config.txt
        echo "initial_turbo=60" >> $(BINARIES_DIR)/rpi-firmware/config.txt
        echo "[pi4]" >> $(BINARIES_DIR)/rpi-firmware/config.txt
        echo "dtoverlay=vc4-kms-v3d" >> $(BINARIES_DIR)/rpi-firmware/config.txt
        echo "max_framebuffers=2" >> $(BINARIES_DIR)/rpi-firmware/config.txt
endef

$(eval $(generic-package))
