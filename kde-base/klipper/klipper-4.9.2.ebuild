# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/klipper/klipper-4.9.2.ebuild,v 1.2 2012/10/17 19:11:12 maekke Exp $

EAPI=4

KDE_HANDBOOK="optional"
KMNAME="kde-workspace"
inherit kde4-meta

DESCRIPTION="Applet for KDE and X clipboard management"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="debug prison"

DEPEND="
	$(add_kdebase_dep libkworkspace)
	$(add_kdebase_dep libtaskmanager)
	prison? ( media-libs/prison )
	!aqua? ( x11-libs/libXfixes )
"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with prison)
	)

	kde4-meta_src_configure
}