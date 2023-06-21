################################################################################
#
# dmdreader
#
################################################################################

DMDREADER_VERSION = ce9c41b8acb115bb395143b2df178f24e21eae98
DMDREADER_SITE = https://github.com/pinballpower/code_dmdreader
DMDREADER_SITE_METHOD = git
DMDREADER_GIT_SUBMODULES = YES

DMDREADER_DEPENDENCIES = boost rpi-firmware libgpiod

define DMDREADER_POST_INSTALL
 $(INSTALL) -D -m 0755 $(@D)/external/libserum/libSerum.so $(TARGET_DIR)/usr/lib/
endef

DMDREADER_POST_INSTALL_TARGET_HOOKS = DMDREADER_POST_INSTALL

$(eval $(cmake-package))
