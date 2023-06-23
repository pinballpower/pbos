################################################################################
#
# dmdreader
#
################################################################################

DMDREADER_VERSION = e1e448f7ca11a85241abc3a5e0b3cf9faed97128
DMDREADER_SITE = https://github.com/pinballpower/code_dmdreader
DMDREADER_SITE_METHOD = git
DMDREADER_GIT_SUBMODULES = YES

DMDREADER_DEPENDENCIES = boost rpi-firmware libgpiod 

ifeq ($(BR2_PACKAGE_DMDREADER_OGL),y)
DMDREADER_DEPENDENCIES += libdrm mesa3d
endif

define MYCONFIG
	echo $(@D)
	cp $(BR2_EXTERNAL_PBOS_PATH)/../CMakeLists.txt-dmdreader $(@D)
endef

define CONFIGDONE
	sleep 100
endef

define DMDREADER_POST_INSTALL
 $(INSTALL) -D -m 0755 $(@D)/external/libserum/libSerum.so $(TARGET_DIR)/usr/lib/
endef

define DMDREADER_INSTALL_INIT_SYSV
    $(INSTALL) -D -m 755 $(BR2_EXTERNAL_PBOS_PATH)/package/dmdreader/dmdreader.init $(TARGET_DIR)/etc/init.d/S11dmdreader
endef


DMDREADER_POST_INSTALL_TARGET_HOOKS = DMDREADER_POST_INSTALL
DMDREADER_POST_EXTRACT_HOOKS = MYCONFIG
DMDREADER_POST_CONFIGURE_HOOKS = CONFIGDONE

$(eval $(cmake-package))
