# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/stevedore/stevedore-0.11.ebuild,v 1.1 2013/08/29 20:23:21 radhermit Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3} pypy2_0 )

inherit distutils-r1

DESCRIPTION="Manage dynamic plugins for Python applications"
HOMEPAGE="https://github.com/dreamhost/stevedore"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/flake8[$(python_gen_usedep python{2_7,3_2,3_3})] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/pillow[$(python_gen_usedep python{2_7,3_2,3_3})] )"

python_compile_all() {
	if use doc; then
		mkdir docs/source/_build || die
		sphinx-build -b html -c docs/source docs/source/ docs/source/_build
	fi
}

python_test() {
	nosetests -d --with-coverage --cover-inclusive --cover-package stevedore \
		|| die "Tests failed under ${EPYTHON}"
	flake8 stevedore setup.py || die
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/source/_build/. )
	distutils-r1_python_install_all
}
