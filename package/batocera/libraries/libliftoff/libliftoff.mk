################################################################################
#
# LIBLIFTOFF
#
################################################################################

LIBLIFTOFF_VERSION = v0.5.0
LIBLIFTOFF_SITE = https://gitlab.freedesktop.org/emersion/libliftoff.git
LIBLIFTOFF_SITE_METHOD = git
LIBLIFTOFF_LICENSE = MIT
LIBLIFTOFF_LICENSE_FILES = LICENSE

LIBLIFTOFF_DEPENDENCIES = libdrm

LIBLIFTOFF_INSTALL_STAGING = YES

$(eval $(meson-package))
