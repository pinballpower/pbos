################################################################################
#
# dmdreader
#
################################################################################

DMDREADER_VERSION = 3707916f0e2f65856d3e50801b44bdbf8a1adde4
DMDREADER_SITE = https://github.com/pinballpower/code_dmdreader
DMDREADER_SITE_METHOD = git
DMDREADER_GIT_SUBMODULES = YES

DMDREADER_DEPENDENCIES = boost rpi-firmware libgpiod

DMDREADER_CONF_OPTS += -DFORCE_SPI=1 -DFORCE_LEDMATRIX=1 -DFORCE_SERUM=1

ifeq ($(BR2_PACKAGE_DMDREADER_OGL),y)
DMDREADER_DEPENDENCIES += libdrm mesa3d ffmpeg
DMDREADER_CONF_OPTS += -DFORCE_OPENGLES=1
endif

define DMDREADER_POST_INSTALL
 $(INSTALL) -D -m 0755 $(@D)/external/libserum/libSerum.so $(TARGET_DIR)/usr/lib/
endef

define DMDREADER_INSTALL_INIT_SYSV
    $(INSTALL) -D -m 755 $(BR2_EXTERNAL_PBOS_PATH)/package/dmdreader/dmdreader.init $(TARGET_DIR)/etc/init.d/S11dmdreader
endef

DMDREADER_POST_INSTALL_TARGET_HOOKS = DMDREADER_POST_INSTALL

$(eval $(cmake-package))
