# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-tripwire/selinux-tripwire-2.20130424-r3.ebuild,v 1.1 2013/09/26 17:24:25 swift Exp $
EAPI="4"

IUSE=""
MODS="tripwire"
BASEPOL="2.20130424-r3"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for tripwire"

KEYWORDS="~amd64 ~x86"
