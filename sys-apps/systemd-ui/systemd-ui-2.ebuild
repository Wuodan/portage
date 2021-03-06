# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/systemd-ui/systemd-ui-2.ebuild,v 1.4 2013/10/06 12:18:54 pacho Exp $

EAPI=4
VALA_MIN_API_VERSION=0.14

inherit autotools-utils systemd vala

DESCRIPTION="System and service manager for Linux"
HOMEPAGE="http://www.freedesktop.org/wiki/Software/systemd"
SRC_URI="http://www.freedesktop.org/software/systemd/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	!sys-apps/systemd[gtk]
	>=dev-libs/glib-2.26:2
	dev-libs/libgee:0.8
	sys-apps/dbus
	x11-libs/gtk+:2
	>=x11-libs/libnotify-0.7
"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	$(vala_depend)
"

# Due to vala being broken.
AUTOTOOLS_IN_SOURCE_BUILD=1

src_prepare() {
	# Force the rebuild of .vala sources
	touch src/*.vala || die

	# Fix hardcoded path in .vala.
	sed -i -e "s^/lib/systemd^$(systemd_get_utildir)^g" src/*.vala || die

	autotools-utils_src_prepare
	vala_src_prepare
}
