# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dex/dex-0.6.ebuild,v 1.3 2013/09/05 19:44:44 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{3_2,3_3} )
inherit eutils python-r1

DESCRIPTION="DesktopEntry eXecution - tool to manage and launch autostart entries"
HOMEPAGE="http://e-jc.de/"
SRC_URI="https://github.com/jceb/dex/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux"

IUSE=""

RDEPEND="${PYTHON_DEPS}
	virtual/python-argparse[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch_user
}

src_install() {
	dobin dex
	python_replicate_script "${ED}/usr/bin/dex"
	dodoc README
	doman dex.1
}
