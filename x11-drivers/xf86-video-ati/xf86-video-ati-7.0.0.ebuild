# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-ati/xf86-video-ati-7.0.0.ebuild,v 1.4 2012/11/18 12:13:21 ago Exp $

EAPI=4

XORG_DRI=always
inherit xorg-2

DESCRIPTION="ATI video driver"

KEYWORDS="~alpha amd64 ~ia64 ~ppc ~ppc64 ~sparc x86"
IUSE="glamor udev"

RDEPEND=">=x11-libs/libdrm-2.4.36[video_cards_radeon]
	glamor? ( x11-libs/glamor )
	udev? ( sys-fs/udev )"
DEPEND="${RDEPEND}"

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable glamor)
		$(use_enable udev)
	)
	xorg-2_src_configure
}