################################################################################
#
# 
#
################################################################################

PIVID_VERSION = 62586779c9cda2ea167140ab413098fb185faa1c
PIVID_SITE = $(call github,egnor,pivid,$(PIVID_VERSION))

PIVID_DEPENDENCIES = host-pkgconf libdrm doctest

$(eval $(meson-package))
