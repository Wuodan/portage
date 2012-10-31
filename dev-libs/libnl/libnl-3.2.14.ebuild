# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libnl/libnl-3.2.14.ebuild,v 1.2 2012/10/26 02:18:02 blueness Exp $

EAPI=4
inherit eutils multilib

DESCRIPTION="A library for applications dealing with netlink socket"
HOMEPAGE="http://www.infradead.org/~tgr/libnl/"
SRC_URI="
	http://www.infradead.org/~tgr/libnl/files/${P}.tar.gz
	http://www.infradead.org/~tgr/libnl/files/${PN}-doc-${PV}.tar.gz
"
LICENSE="LGPL-2.1"
SLOT="3"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~ia64-linux ~x86-linux"
IUSE="doc static-libs utils"

DEPEND="
	sys-devel/flex
	sys-devel/bison
"

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-1.1-vlan-header.patch
}

src_configure() {
	econf \
		--disable-silent-rules \
		$(use_enable static-libs static) \
		$(use_enable utils cli)
}

src_install() {
	default
	if use doc; then
		dohtml -r \
			-a css,html,js,map,png \
			"${WORKDIR}"/${PN}-doc-${PV}

	fi

	if ! use static-libs; then
		rm -f "${D}"/usr/lib*/lib*.la
	fi

	dodoc ChangeLog
}