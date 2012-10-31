# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/buddy/buddy-2.4.ebuild,v 1.10 2012/10/18 21:31:27 jlec Exp $

EAPI=4

inherit eutils fortran-2

DESCRIPTION="Binary Decision Diagram Package"
HOMEPAGE="http://sourceforge.net/projects/buddy/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE="doc examples static-libs"

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-gcc43.patch \
		"${FILESDIR}"/${P}-gold.patch
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default

	dodoc doc/*.txt

	use doc && docinto /usr/share/doc/${PF}/ps && dodoc doc/*.ps

	if use examples; then
		insinto /usr/share/${PN}/
		doins -r examples
	fi
}