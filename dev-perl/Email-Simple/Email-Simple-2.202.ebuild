# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Email-Simple/Email-Simple-2.202.ebuild,v 1.1 2013/09/13 05:49:16 patrick Exp $

EAPI=4

MODULE_AUTHOR=RJBS
MODULE_VERSION=2.202
inherit perl-module

DESCRIPTION="Simple parsing of RFC2822 message format and headers"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~sparc-solaris ~x86-solaris"
IUSE="test"

RDEPEND="dev-perl/Email-Date-Format"
DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
		virtual/perl-Test-Simple
		dev-perl/Capture-Tiny
	)"
RDEPEND="${RDEPEND}
	!dev-perl/Email-Simple-Creator"

SRC_TEST="do"
