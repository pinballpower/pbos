################################################################################
#
# dmdreader
#
################################################################################

DMDREADER_VERSION = 499331e5ad95d2ef0af2261ea06d2714f065c659
DMDREADER_SITE = https://github.com/pinballpower/code_dmdreader
DMDREADER_SITE_METHOD = git
DMDREADER_GIT_SUBMODULES = YES

DMDREADER_DEPENDENCIES = boost rpi-firmware libgpiod

$(eval $(cmake-package))
