# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-puzzle/bubble-chains/bubble-chains-0.1.1.ebuild,v 1.5 2013/03/02 21:18:11 hwoarang Exp $

EAPI=2
inherit eutils qt4-r2 games

MY_P=${P/bubble-}-src

DESCRIPTION="Arcade-puzzle game"
HOMEPAGE="http://bubble-chains.sintegrial.com/"
SRC_URI="http://${PN}.sintegrial.com/files/${MY_P}.7z"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

RDEPEND="x11-libs/libXrandr
	dev-qt/qtgui:4
	dev-qt/qtopengl:4
	media-libs/libsdl[audio,video]
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}
	app-arch/p7zip"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i \
		-e "s:/usr/local/bin:${GAMES_BINDIR}:g" \
		-e "s:/usr/local/games:${GAMES_DATADIR}:g" \
		-e "s:LIBS += -lSDLmain:LIBS += -lSDL -lX11:" \
		Game.pro main.cpp || die
}

src_configure() {
	eqmake4 Game.pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die
	dodoc README
	newicon images/img64_base.png ${PN}.png
	make_desktop_entry chains "Bubble Chains"
	prepgamesdirs
}
