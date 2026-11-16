################################################################################
#
# gamescope
#
################################################################################

GAMESCOPE_VERSION = 3.17.0
GAMESCOPE_SITE = https://github.com/ValveSoftware/gamescope
GAMESCOPE_SITE_METHOD = git
GAMESCOPE_GIT_SUBMODULES = YES
GAMESCOPE_LICENSE = BSD-2-Clause
GAMESCOPE_LICENSE_FILES = LICENSE

ifeq ($(BR2_PACKAGE_GAMESCOPE_WSI_LAYER_ONLY),y)
GAMESCOPE_DEPENDENCIES = glm stb vulkan-headers vulkan-loader wayland
GAMESCOPE_DEPENDENCIES += wayland-protocols xlib_libX11

GAMESCOPE_CONF_OPTS = \
	-Denable_gamescope=false \
	-Denable_gamescope_wsi_layer=true \
	-Dpipewire=disabled \
	-Denable_openvr_support=false \
	-Denable_zenity=false \
	-Denable_tests=false
else
GAMESCOPE_DEPENDENCIES = host-glslang host-pkgconf host-wayland glm hwdata
GAMESCOPE_DEPENDENCIES += libcap libdecor libdisplay-info libdrm libliftoff
GAMESCOPE_DEPENDENCIES += batocera-luajit libinput libxkbcommon pipewire pixman
GAMESCOPE_DEPENDENCIES += seatd stb udev vulkan-headers vulkan-loader wayland
GAMESCOPE_DEPENDENCIES += wayland-protocols wlroots xwayland xlib_libX11
GAMESCOPE_DEPENDENCIES += xlib_libXcomposite xlib_libXcursor xlib_libXdamage
GAMESCOPE_DEPENDENCIES += xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu
GAMESCOPE_DEPENDENCIES += xlib_libXrender xlib_libXres xlib_libXtst
GAMESCOPE_DEPENDENCIES += xlib_libXxf86vm xlib_libxcvt

# vkroots is header-only and gamescope refuses to build without its own copy
GAMESCOPE_CONF_OPTS = \
	-Ddrm_backend=enabled \
	-Dsdl2_backend=disabled \
	-Dpipewire=enabled \
	-Davif_screenshots=disabled \
	-Dinput_emulation=disabled \
	-Drt_cap=enabled \
	-Denable_openvr_support=false \
	-Denable_gamescope_wsi_layer=false \
	-Denable_zenity=false \
	-Denable_tests=false \
	-Dbenchmark=disabled
endif

$(eval $(call register,gamescope._shared.emulator.yml gamescope._global.emulator.yml))

$(eval $(meson-package))
$(eval $(emulator-info-package))
