# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/crda/crda-1.1.2-r4.ebuild,v 1.2 2012/10/28 09:14:25 gurligebis Exp $

EAPI=4
inherit eutils toolchain-funcs python

DESCRIPTION="Central Regulatory Domain Agent for wireless networks."
HOMEPAGE="http://wireless.kernel.org/en/developers/Regulatory"
SRC_URI="http://linuxwireless.org/download/crda/${P}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~mips ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND="dev-libs/openssl:0
	dev-libs/libnl
	net-wireless/wireless-regdb
	>=sys-fs/udev-152"
DEPEND="${RDEPEND}
	dev-python/m2crypto
	=dev-lang/python-2*
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/libnl31-support.diff

	python_convert_shebangs 2 utils/key2pub.py

	sed -i \
		-e "s:\<pkg-config\>:$(tc-getPKG_CONFIG):" \
		Makefile || die
}

src_compile() {
	emake \
		UDEV_RULE_DIR="$($(tc-getPKG_CONFIG) --variable=udevdir udev)/rules.d" \
		REG_BIN=/usr/$(get_libdir)/crda/regulatory.bin \
		USE_OPENSSL=1 \
		CC="$(tc-getCC)" \
		all_noverify V=1
}

src_test() {
	emake USE_OPENSSL=1 CC="$(tc-getCC)" verify
}

src_install() {
	emake \
		UDEV_RULE_DIR="$($(tc-getPKG_CONFIG) --variable=udevdir udev)/rules.d" \
		REG_BIN=/usr/$(get_libdir)/crda/regulatory.bin \
		USE_OPENSSL=1 \
		DESTDIR="${D}" \
		install

	keepdir /etc/wireless-regdb/pubkeys
}