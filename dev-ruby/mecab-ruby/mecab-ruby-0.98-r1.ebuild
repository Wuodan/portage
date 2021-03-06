# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mecab-ruby/mecab-ruby-0.98-r1.ebuild,v 1.7 2013/08/03 11:09:41 hattya Exp $

EAPI=2
USE_RUBY="ruby18"

inherit ruby-ng toolchain-funcs

IUSE=""

DESCRIPTION="Ruby binding for MeCab"
HOMEPAGE="http://mecab.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN/-*}/${P}.tar.gz"

LICENSE="|| ( BSD LGPL-2.1 GPL-2 )"
KEYWORDS="amd64 ppc ppc64 x86"
SLOT="0"

DEPEND="~app-text/mecab-${PV}"
RDEPEND="${DEPEND}"

each_ruby_configure() {
	${RUBY} extconf.rb || die
}

each_ruby_compile() {
	tc-export CXX
	emake || die
}

each_ruby_install() {
	emake install DESTDIR="${D}" || die
}

all_ruby_install() {
	dodoc AUTHORS README test.rb || die
	dohtml bindings.html || die
}
