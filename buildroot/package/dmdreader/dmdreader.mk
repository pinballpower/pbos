################################################################################
#
# dmdreader
#
################################################################################

DMDREADER_VERSION = 400de07409c510dc9ead761c8cabad8281293b40
DMDREADER_SITE = https://github.com/pinballpower/code_dmdreader
DMDREADER_SITE_METHOD = git
DMDREADER_GIT_SUBMODULES = YES

DMDREADER_DEPENDENCIES = boost rpi-firmware libgpiod

define DMDREADER_POST_INSTALL
 $(INSTALL) -D -m 0755 $(@D)/external/libserum/libSerum.so $(TARGET_DIR)/usr/lib/
endef

define DMDREADER_INSTALL_INIT_SYSV
    $(INSTALL) -D -m 755 $(BR2_EXTERNAL_PBOS_PATH)/package/dmdreader/dmdreader.init $(TARGET_DIR)/etc/init.d/S11dmdreader
endef


DMDREADER_POST_INSTALL_TARGET_HOOKS = DMDREADER_POST_INSTALL

$(eval $(cmake-package))
