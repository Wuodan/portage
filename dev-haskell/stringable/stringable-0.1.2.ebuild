# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/stringable/stringable-0.1.2.ebuild,v 1.2 2013/11/05 09:40:43 chainsaw Exp $

EAPI=5

# ebuild generated by hackport 0.3.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A Stringable type class, in the spirit of Foldable and Traversable"
HOMEPAGE="http://hackage.haskell.org/package/stringable"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/system-filepath-0.4.7:=[profile?]
	>=dev-haskell/text-0.11.2:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"
