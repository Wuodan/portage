# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/zeitgeist/zeitgeist-0.9.12.ebuild,v 1.8 2013/05/29 15:39:03 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

AUTOTOOLS_AUTORECONF=true
VALA_MIN_API_VERSION=0.18

inherit autotools-utils eutils python-r1 versionator vala

DIR_PV=$(get_version_component_range 1-2)
EXT_VER=0.0.13

DESCRIPTION="Service to log activities and present to other apps"
HOMEPAGE="http://launchpad.net/zeitgeist/"
SRC_URI="http://launchpad.net/zeitgeist/${DIR_PV}/${PV}/+download/${P}.tar.xz"

LICENSE="LGPL-2+ LGPL-3+ GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="+datahub +dbus downloads-monitor extensions +fts icu introspection nls plugins sql-debug telepathy"

REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
	downloads-monitor? ( datahub )"

RDEPEND="
	${PYTHON_DEPS}
	!gnome-extra/zeitgeist-datahub
	dev-libs/json-glib
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/pygobject:2[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/rdflib[${PYTHON_USEDEP}]
	media-libs/raptor:2
	>=dev-libs/glib-2.26.0:2
	>=dev-db/sqlite-3.7.11:3
	datahub? ( x11-libs/gtk+:3 )
	extensions? ( gnome-extra/zeitgeist-extensions  )
	fts? ( dev-libs/xapian[inmemory] )
	icu? ( dev-libs/dee[icu?] )
	introspection? ( dev-libs/gobject-introspection )
	plugins? ( gnome-extra/zeitgeist-datasources )
	telepathy? ( net-libs/telepathy-glib )
"
DEPEND="${RDEPEND}
	$(vala_depend)
	virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/${P}-download_monitor.patch )

src_prepare() {
	sed \
		-e 's:python::g' \
		-i Makefile.am || die
	vala_src_prepare
	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		--docdir="${EPREFIX}/usr/share/doc/${PF}"
		$(use_enable sql-debug explain-queries)
		$(use_enable datahub)
		$(use_enable downloads-monitor)
		$(use_enable telepathy)
		$(use_enable introspection)
		$(use_with icu dee-icu)
		$(use_with dbus session-bus-services-dir /usr/share/dbus-1/services)
	)
	use nls || myeconfargs+=( --disable-nls )
	use fts && myeconfargs+=( --enable-fts )
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
	cd python || die
	python_moduleinto ${PN}
	python_foreach_impl python_domodule *py
}
