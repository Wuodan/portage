# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdesdk-strigi-analyzer/kdesdk-strigi-analyzer-4.9.3.ebuild,v 1.3 2012/11/23 18:52:25 ago Exp $

EAPI=4

KMNAME="kdesdk"
KMMODULE="strigi-analyzer"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="kdesdk: strigi plugins"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	app-misc/strigi
"
RDEPEND="${DEPEND}"