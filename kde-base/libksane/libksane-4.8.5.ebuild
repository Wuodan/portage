# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/libksane/libksane-4.8.5.ebuild,v 1.5 2012/10/13 22:36:04 johu Exp $

EAPI=4

KDE_SCM="git"
inherit kde4-base

DESCRIPTION="SANE Library interface for KDE"
KEYWORDS="amd64 ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"
LICENSE="LGPL-2"

DEPEND="
	media-gfx/sane-backends
"
RDEPEND="${DEPEND}"