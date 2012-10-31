# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/krusader/krusader-2.4.0_beta3.ebuild,v 1.1 2012/10/26 19:53:28 creffett Exp $

EAPI=4

KDE_HANDBOOK="optional"
KDE_LINGUAS="bg bs ca ca@valencia cs da de el en_GB eo es et fi fr ga
gl hr hu it ja ko lt mai nb nds nl pa pl pt pt_BR ro ru sk sl sr
sr@ijekavian sr@ijekavianlatin sr@latin sv tr ug uk zh_CN zh_TW"
inherit kde4-base

MY_P="${P/_/-}"

DESCRIPTION="An advanced twin-panel (commander-style) file-manager for KDE with many extras."
HOMEPAGE="http://www.krusader.org/"
SRC_URI="mirror://sourceforge/krusader/${MY_P}.tar.bz2"
LICENSE="GPL-2"

SLOT="4"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="+bookmarks debug"

RDEPEND="
	$(add_kdebase_dep libkonq)
	sys-libs/zlib
	bookmarks? ( $(add_kdebase_dep keditbookmarks) )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"

S="${WORKDIR}/${MY_P}"