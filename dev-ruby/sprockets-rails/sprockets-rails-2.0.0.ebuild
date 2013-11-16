# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/sprockets-rails/sprockets-rails-2.0.0.ebuild,v 1.2 2013/10/13 22:09:24 maekke Exp $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem versionator

DESCRIPTION="Sprockets implementation for Rails 4.x (and beyond) Asset Pipeline."
HOMEPAGE="https://github.com/rails/sprockets-rails"
SRC_URI="https://github.com/rails/sprockets-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~amd64 ~arm"

IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/actionpack-3.0
	>=dev-ruby/activesupport-3.0
	>=dev-ruby/sprockets-2.8:2"

ruby_add_bdepend "
	test? (
		>=dev-ruby/actionpack-4
		>=dev-ruby/railties-4
		dev-ruby/test-unit:2
	)"