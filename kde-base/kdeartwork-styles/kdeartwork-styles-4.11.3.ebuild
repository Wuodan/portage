# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdeartwork-styles/kdeartwork-styles-4.11.3.ebuild,v 1.1 2013/11/05 22:22:37 dilfridge Exp $

EAPI=5

KMMODULE="styles"
KMNAME="kdeartwork"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="Extra KWin styles and window decorations"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kwin)
"
RDEPEND="${DEPEND}"

KMEXTRA="
	kwin-styles/
"
