# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdeartwork-styles/kdeartwork-styles-4.9.2.ebuild,v 1.1 2012/10/02 18:11:44 johu Exp $

EAPI=4

KMMODULE="styles"
KMNAME="kdeartwork"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="Extra KWin styles and window decorations"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

add_blocker kwin '<4.5.67'

DEPEND="
		$(add_kdebase_dep kwin)
"
RDEPEND="${DEPEND}"

KMEXTRA="
	aurorae/
	kwin-styles/
"