# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/systemsettings/systemsettings-4.9.3.ebuild,v 1.3 2012/11/23 19:37:23 ago Exp $

EAPI=4

KDE_HANDBOOK="optional"
KMNAME="kde-workspace"
OPENGL_REQUIRED="optional"
VIRTUALX_REQUIRED="test"
VIRTUALDBUS_TEST="true"
inherit kde4-meta

DESCRIPTION="System settings utility"
IUSE="debug gtk +usb"
KEYWORDS="amd64 ~arm x86 ~amd64-linux ~x86-linux"

COMMONDEPEND="
	dev-libs/glib:2
	$(add_kdebase_dep libkworkspace)
	media-libs/fontconfig
	>=media-libs/freetype-2
	>=x11-libs/libxklavier-3.2
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXft
	x11-libs/libXrandr
	x11-libs/libXtst
	opengl? ( virtual/opengl )
	usb? ( virtual/libusb:0 )
"
DEPEND="${COMMONDEPEND}
	x11-proto/kbproto
	x11-proto/xextproto
"
RDEPEND="${COMMONDEPEND}
	sys-libs/timezone-data
	x11-apps/setxkbmap
	x11-misc/xkeyboard-config
	gtk? ( kde-misc/kde-gtk-config )
"

KMEXTRA="
	kcontrol/
"
KMEXTRACTONLY="
	krunner/dbus/org.kde.krunner.App.xml
	krunner/dbus/org.kde.screensaver.xml
	kwin/
	libs/
	plasma/
"

add_blocker kdeaccessibility-colorschemes '<4.6.50'

src_unpack() {
	if use handbook; then
		KMEXTRA+="
			doc/kcontrol
			doc/kfontview
		"
	fi

	kde4-meta_src_unpack
}

src_prepare() {
	sed -i -e 's/systemsettingsrc DESTINATION ${SYSCONF_INSTALL_DIR}/systemsettingsrc DESTINATION ${CONFIG_INSTALL_DIR}/' \
		systemsettings/CMakeLists.txt \
		|| die "Failed to fix systemsettingsrc install location"

	kde4-meta_src_prepare
}

# FIXME: is have_openglxvisual found without screensaver
src_configure() {
	# Old keyboard-detection code is unmaintained,
	# so we force the new stuff, using libxklavier.
	mycmakeargs=(
		-DUSE_XKLAVIER=ON -DWITH_LibXKlavier=ON
		-DWITH_GLIB2=ON -DWITH_GObject=ON
		$(cmake-utils_use_with opengl OpenGL)
		$(cmake-utils_use_with usb)
	)

	kde4-meta_src_configure
}