# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-dict/ruby-dict-0.9.4-r2.ebuild,v 1.1 2013/10/27 18:23:15 a3li Exp $

EAPI=2

USE_RUBY="ruby18 ruby19 jruby"

inherit ruby-ng

DESCRIPTION="RFC 2229 client in Ruby"
HOMEPAGE="http://www.caliban.org/ruby/ruby-dict.shtml"
SRC_URI="http://www.caliban.org/files/ruby/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"
IUSE=""

RUBY_PATCHES=( "${PN}-ruby19.patch" )

each_ruby_test() {
	ewarn "Tests will use network connection"

	${RUBY} -Ilib ./rdict test || die
}

each_ruby_install() {
	doruby lib/dict.rb || die "doruby failed"
}

all_ruby_install() {
	dobin rdict || die "rdict failed"

	dodoc README Changelog TODO doc/rfc2229.txt || die
	dohtml doc/dict.html doc/rdict.html || die

	# This would probably need a 3rb section..
	# doman doc/dict.3
	doman doc/rdict.1 || die "doman failed"
}
