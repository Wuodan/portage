# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/xfwm4-themes/xfwm4-themes-4.10.0.ebuild,v 1.6 2012/07/14 12:08:41 maekke Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Additional themes for the Xfce window manager"
HOMEPAGE="http://www.xfce.org/projects/"
SRC_URI="mirror://xfce/src/art/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 arm hppa ~ia64 ppc ppc64 ~sparc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=xfce-base/xfwm4-4.10"
DEPEND=""

RESTRICT="binchecks strip"

pkg_setup() {
	DOCS=( AUTHORS ChangeLog README TODO )
}