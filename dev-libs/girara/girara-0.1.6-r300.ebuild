# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/girara/girara-0.1.6-r300.ebuild,v 1.1 2013/06/13 22:32:52 xmw Exp $

EAPI=5
inherit multilib toolchain-funcs

DESCRIPTION="A library that implements a user interface that focuses on simplicity and minimalism"
HOMEPAGE="http://pwmt.org/projects/girara/"
SRC_URI="http://pwmt.org/projects/${PN}/download/${P}.tar.gz"

LICENSE="ZLIB"
SLOT="3"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="static-libs"

RDEPEND=">=x11-libs/gtk+-3.0.11:3
	!<${CATEGORY}/${PN}-0.1.5-r200"
DEPEND="${RDEPEND}
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	mygiraraconf=(
		PREFIX="${EPREFIX}"/usr
		LIBDIR='${PREFIX}'/$(get_libdir)
		GIRARA_GTK_VERSION=3
		CC="$(tc-getCC)"
		SFLAGS=""
		VERBOSE=1
		DESTDIR="${D}"
		)
}

src_prepare() {
	# Remove 'static' and 'install-static' targets
	if ! use static-libs; then
		sed -i \
			-e '/^${PROJECT}:/s:static::' \
			-e '/^install:/s:install-static::' \
			Makefile || die
	fi
}

src_compile() {
	emake "${mygiraraconf[@]}"
}

src_install() {
	emake "${mygiraraconf[@]}" install
	dodoc AUTHORS
}
