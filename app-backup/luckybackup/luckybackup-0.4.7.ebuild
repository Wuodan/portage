# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-backup/luckybackup/luckybackup-0.4.7.ebuild,v 1.4 2012/07/24 21:44:18 pesa Exp $

EAPI=4
inherit qt4-r2

DESCRIPTION="Powerful and flexible backup (and syncing) tool, using RSync and Qt4"
HOMEPAGE="http://luckybackup.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="x11-libs/qt-core:4
	x11-libs/qt-gui:4"
RDEPEND="${DEPEND}
	net-misc/rsync"

DOCS="readme/*"

src_prepare() {
	sed -i \
		-e "s:/usr/share/doc/${PN}:/usr/share/doc/${PF}:g" \
		-e "s:/usr/share/doc/packages/${PN}:/usr/share/doc/${PF}:g" \
		luckybackup.pro src/global.h || die "sed failed"

	# causes empty directory to be installed
	sed -i -e '/^INSTALLS/s/debianmenu //' luckybackup.pro \
		|| die "sed installs failed"

	# remove text version - cannot remote HTML version
	# as it's used within the application
	rm license/gpl.txt || die "rm failed"
}