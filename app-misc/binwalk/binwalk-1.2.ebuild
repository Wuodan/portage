# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/binwalk/binwalk-1.2.ebuild,v 1.2 2013/04/07 09:48:23 radhermit Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="A tool for identifying files embedded inside firmware images"
HOMEPAGE="http://code.google.com/p/binwalk/"
SRC_URI="http://binwalk.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graph"

RDEPEND="sys-apps/file[python]
	graph? ( dev-python/matplotlib[${PYTHON_USEDEP}] )"

S=${WORKDIR}/${P}/src

DOCS=( ../docs/README ../docs/API )

PATCHES=( "${FILESDIR}"/${P}-no-deps-check.patch )