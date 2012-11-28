# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/networkx/networkx-1.7-r1.ebuild,v 1.1 2012/11/03 15:35:36 idella4 Exp $

EAPI=4

PYTHON_DEPEND="*:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.5 3.*"
DISTUTILS_SRC_TEST=nosetests

inherit distutils

DESCRIPTION="Python tools to manipulate graphs and complex networks"
HOMEPAGE="http://networkx.lanl.gov http://pypi.python.org/pypi/networkx"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~ppc-macos ~x86-linux ~x86-macos"
IUSE="doc examples"

DEPEND="dev-python/setuptools
		doc? (
			dev-python/matplotlib
			dev-python/pygraphviz
			dev-python/sphinx
	)
		test? ( dev-python/matplotlib
		sci-libs/scipy
		)"
RDEPEND="examples? (
		dev-python/matplotlib
		dev-python/pygraphviz
		dev-python/pyparsing
		dev-python/pyyaml
		sci-libs/scipy
	 )"

src_compile() {
	distutils_src_compile

	if use doc; then
		# PYTHONPATH is necessary to use networkx to be installed.
		cd "${S}/doc" && PYTHONPATH="${S}" make html \
			|| die "doc compilation failed"
	fi
}

src_install() {
	distutils_src_install
	rm -f "${ED}"usr/share/doc/${PF}/{INSTALL,LICENSE}.txt || die
	use examples || rm -r "${ED}"usr/share/doc/${PF}/examples
	use doc && dohtml -r doc/build/html/*
}