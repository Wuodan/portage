# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rev/rev-0.3.2-r1.ebuild,v 1.1 2013/11/11 12:28:00 mrueg Exp $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20"

RUBY_FAKEGEM_EXTRADOC="CHANGES README.textile"

RUBY_FAKEGEM_TASK_TEST=""

inherit multilib ruby-fakegem

DESCRIPTION="Rev is an event library for Ruby, built on the libev event library."
HOMEPAGE="https://rubygems.org/gems/rev"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/iobuffer-0.1.0"

each_ruby_configure() {
	${RUBY} -C ext/rev extconf.rb || die "Unable to configure rev extionsion."

	${RUBY} -C ext/http11_client extconf.rb || die "Unable to configure http11 extension."
}

each_ruby_compile() {
	# We have injected --no-undefined in Ruby as a safety precaution
	# against broken ebuilds, but these bindings unfortunately rely on
	# the lazy load of other extensions; see bug #320545.
	find ext/rev -name Makefile -print0 | xargs -0 \
		sed -i -e 's:-Wl,--no-undefined::' || die "--no-undefined removal failed"
	emake -C ext/rev V=1 || die "Unable to compile rev extension."

	emake -C ext/http11_client V=1 || die "Unable to compile http11 extension."
}

each_ruby_install() {
	cp ext/rev/rev_ext$(get_modname) lib || die
	cp ext/http11_client/http11_client$(get_modname) lib || die

	each_fakegem_install
}

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}/examples
	doins examples/* || die "Unable to install examples."
}
