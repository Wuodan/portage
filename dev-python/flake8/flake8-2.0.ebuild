# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flake8/flake8-2.0.ebuild,v 1.5 2013/09/05 18:46:54 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="A wrapper around PyFlakes, pep8 & mccabe"
HOMEPAGE="http://bitbucket.org/tarek/flake8"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="amd64 x86"
IUSE=""
LICENSE="MIT"
SLOT="0"

# requires.txt inc. mccabe however that creates a circular dep
RDEPEND=">=dev-python/pyflakes-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/pep8-1.4.3[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
PDEPEND="dev-python/mccabe[${PYTHON_USEDEP}]"

python_test() {
	esetup.py test || die "tests failed"

}
