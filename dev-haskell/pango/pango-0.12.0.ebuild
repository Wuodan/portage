# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/pango/pango-0.12.0.ebuild,v 1.4 2012/09/12 15:23:10 qnikst Exp $

# ebuild generated by hackport 0.2.13

EAPI="3"

#nocabaldep is for the fancy cabal-detection feature at build-time
CABAL_FEATURES="lib profile haddock hscolour nocabaldep"
inherit haskell-cabal

DESCRIPTION="Haskell bindings to the x11-libs/pango text rendering engine."
HOMEPAGE="http://www.haskell.org/gtk2hs/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="=dev-haskell/cairo-0.12*
		=dev-haskell/glib-0.12*
		dev-haskell/mtl
		>=dev-lang/ghc-6.10.1
		x11-libs/cairo
		x11-libs/pango"
DEPEND="${RDEPEND}
		dev-haskell/gtk2hs-buildtools"