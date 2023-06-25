################################################################################
#
# doctest
#
################################################################################

DOCTEST_VERSION = v2.4.11 
DOCTEST_SITE = $(call github,doctest,doctest,$(DOCTEST_VERSION))

DOCTEST_DEPENDENCIES = host-pkgconf

DOCTEST_CONFIG_OPTS=-DBUILD_DOCS=1 -DBUILD_TEST=1 

$(eval $(cmake-package))
