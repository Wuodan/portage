# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/d-feet/d-feet-0.1.15.ebuild,v 1.1 2012/10/21 11:32:51 eva Exp $

EAPI="4"
GCONF_DEBUG="no"
PYTHON_COMPAT=( python2_5 python2_6 python2_7 )

inherit gnome2 distutils-r1

DESCRIPTION="D-Feet is a powerful D-Bus debugger"
HOMEPAGE="http://live.gnome.org/DFeet"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome"

RDEPEND="
	>=sys-apps/dbus-1.0
	>=dev-python/dbus-python-0.82.3
	dev-python/pygtk:2
	gnome? ( dev-python/libwnck-python )
"
DEPEND="
	dev-python/setuptools
"

DOCS=( NEWS )

src_prepare() {
	# Do not run scrollkeeper tools, it is eclass job
	sed "s:scrollkeeper-\(preinstall\|update\):$(type -P true):" \
		-i setup.py || die "sed failed"

	distutils-r1_src_prepare
}