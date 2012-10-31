# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-client/claws-mail-spam_report/claws-mail-spam_report-0.3.15.ebuild,v 1.4 2012/05/04 08:42:23 jdhore Exp $

EAPI=4

inherit eutils multilib

MY_P="${P#claws-mail-}"

DESCRIPTION="Plugin for Claws to report spam to various places"
HOMEPAGE="http://www.claws-mail.org/"
SRC_URI="http://www.claws-mail.org/downloads/plugins/${MY_P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""
RDEPEND=">=mail-client/claws-mail-3.8.0
		>=net-misc/curl-7.9.7"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog README

	# kill useless files
	rm -f "${D}"/usr/$(get_libdir)/claws-mail/plugins/*.{a,la}
}