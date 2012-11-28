# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kurifilter-plugins/kurifilter-plugins-4.9.3.ebuild,v 1.3 2012/11/23 19:23:02 ago Exp $

EAPI=4

KMNAME="kde-runtime"
inherit kde4-meta

DESCRIPTION="KDE: Plugins to manage filtering URIs."
KEYWORDS="amd64 ~arm x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RESTRICT=test
# bug 420255