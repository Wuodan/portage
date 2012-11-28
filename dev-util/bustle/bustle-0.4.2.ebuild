# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/bustle/bustle-0.4.2.ebuild,v 1.1 2012/11/14 22:04:51 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.9999

CABAL_FEATURES="bin test-suite"
inherit haskell-cabal

DESCRIPTION="Draw pretty sequence diagrams of D-Bus traffic"
HOMEPAGE="http://willthompson.co.uk/bustle/"
SRC_URI="http://willthompson.co.uk/${PN}/releases/${PV}/${P}.tar.gz http://dev.gentoo.org/~slyfox/bustle-0.4.0-tests.tar.gz"

LICENSE="LGPL-2 GPL-2" # bustle-dbus-monitor.c is GPL-2, rest is LGPL-2
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/glib:2
		net-libs/libpcap
		sys-apps/dbus
		x11-libs/cairo
		x11-libs/pango
		gnome-base/libglade:2.0"
DEPEND="${RDEPEND}
		test? ( dev-haskell/hunit
			dev-haskell/quickcheck
			dev-haskell/test-framework
			dev-haskell/test-framework-hunit
		)
		>=dev-haskell/cabal-1.8
		dev-haskell/cairo
		>=dev-haskell/dbus-0.10
		dev-haskell/glib
		>=dev-haskell/gtk-0.12.3
		dev-haskell/mtl
		dev-haskell/pango
		dev-haskell/parsec
		dev-haskell/pcap
		dev-haskell/text
		dev-haskell/time
		>=dev-lang/ghc-6.10.4"

src_compile() {
	# compile haskell part
	cabal_src_compile || die "could not build haskell parts"

	# compile C part
	emake \
		"CC=$(tc-getCC)" \
		"CFLAGS=${CFLAGS}" \
		"CPPFLAGS=${CPPFLAGS}" \
		"LDFLAGS=${LDFLAGS}"
}

src_install() {
	# install haskell part
	cabal_src_install || die "could not install haskell parts"

	dobin "${S}"/dist/build/bustle-pcap

	dodoc README HACKING NEWS
}