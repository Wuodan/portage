# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/mediastreamer-silk/mediastreamer-silk-0.0.1.ebuild,v 1.1 2012/11/19 21:30:49 mgorny Exp $

EAPI=4

MY_PN="mssilk"
SDK_FILE="SILK_SDK_SRC_v1.0.8.zip" # please update silk version on bumps!

inherit autotools eutils

DESCRIPTION="SILK (skype codec) implementation for Linphone"
HOMEPAGE="http://www.linphone.org"
SRC_URI="mirror://nongnu/linphone/plugins/sources/${MY_PN}-${PV}.tar.gz
	http://developer.skype.com/silk/${SDK_FILE}"

LICENSE="GPL-3 as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bindist"

RDEPEND=">=media-libs/mediastreamer-2.0.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${MY_PN}"

RESTRICT="mirror" # silk license forbids distribution

pkg_setup() {
	if use bindist; then
		die "This package can't be redistributable due to SILK license."
	fi
}

src_prepare() {
	epatch "${FILESDIR}/${P}-sdk.patch"
	eautoreconf
}