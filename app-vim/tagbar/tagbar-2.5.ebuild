# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/tagbar/tagbar-2.5.ebuild,v 1.2 2013/11/05 16:42:07 chainsaw Exp $

EAPI=5

inherit vim-plugin

DESCRIPTION="vim plugin: display tags of the current file ordered by scope"
HOMEPAGE="http://majutsushi.github.com/tagbar/
	http://www.vim.org/scripts/script.php?script_id=3465"
SRC_URI="https://github.com/majutsushi/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="vim"
KEYWORDS="amd64 ~x86"

RDEPEND=">=dev-util/ctags-5.5"

VIM_PLUGIN_HELPFILES="${PN}.txt"
