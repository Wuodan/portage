# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/bioruby/bioruby-9999.ebuild,v 1.4 2013/09/14 12:55:24 mrueg Exp $

EAPI=5

USE_RUBY="ruby18 ruby19"
EGIT_REPO_URI="git://github.com/bioruby/bioruby.git
	https://github.com/bioruby/bioruby.git"

inherit git-2 ruby-fakegem

DESCRIPTION="An integrated environment for bioinformatics using the Ruby language"
LICENSE="Ruby"
HOMEPAGE="http://www.bioruby.org/"
SRC_URI=""
SLOT="0"
IUSE=""
KEYWORDS=""

all_ruby_unpack() {
	git-2_src_unpack
}

each_ruby_configure() {
	${RUBY} setup.rb config || die
}

each_ruby_compile() {
	${RUBY} setup.rb setup || die
}

each_ruby_install() {
	${RUBY} setup.rb install --prefix="${D}" || die
}

each_ruby_test() {
	${RUBY} -rubygems test/runner.rb || die
}
