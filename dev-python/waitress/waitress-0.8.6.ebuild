# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/waitress/waitress-0.8.6.ebuild,v 1.1 2013/08/26 01:58:34 patrick Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

# doc creation is fatally broken

inherit distutils-r1

DESCRIPTION="A pure-Python WSGI server"
HOMEPAGE="http://docs.pylonsproject.org/projects/waitress/en/latest/ https://pypi.python.org/pypi/waitress/ https://github.com/Pylons/waitress"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	app-arch/unzip
	test? ( dev-python/nose )"

python_test() {
	nosetests || die "Tests fail with ${EPYTHON}"
}
