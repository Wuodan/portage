# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kuiviewer/kuiviewer-4.10.0.ebuild,v 1.1 2013/02/07 04:57:13 alexxy Exp $

EAPI=5

KMNAME="kdesdk"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="KDE utility that displays and tests UI files generated by Qt Designer."
KEYWORDS="~amd64 ~arm ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"