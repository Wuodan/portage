# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-dicts/qvortaro/qvortaro-0.4.1.ebuild,v 1.3 2013/03/02 19:18:01 hwoarang Exp $

EAPI=2
inherit eutils qt4-r2

DESCRIPTION="Esperanto Dictionary"
HOMEPAGE="http://qvortaro.berlios.de/"
SRC_URI="mirror://berlios/qvortaro/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtgui:4
	dev-qt/qtsql:4"

PATCHES=( "${FILESDIR}/${P}-gcc45.patch" )

src_install() {
	dobin qvortaro || die
	newicon src/img/icon_16.png ${PN}.png
	make_desktop_entry ${PN} qVortaro
	dodoc readme.txt
}
