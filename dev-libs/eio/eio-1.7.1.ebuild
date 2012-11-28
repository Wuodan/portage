# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/eio/eio-1.7.1.ebuild,v 1.1 2012/11/09 16:44:48 tommy Exp $

EAPI=2

inherit enlightenment

DESCRIPTION="Enlightenment's integration to IO"
HOMEPAGE="http://trac.enlightenment.org/e/wiki/EIO"

SRC_URI="http://download.enlightenment.org/releases/${P}.tar.bz2"
LICENSE="BSD"

KEYWORDS="~amd64 ~x86"
IUSE="examples static-libs"

RDEPEND=">=dev-libs/ecore-1.7.0"
DEPEND="${RDEPEND}"

src_configure() {
	MY_ECONF="--enable-posix-threads
		$(use_enable doc)
		$(use_enable examples build-examples)
		$(use_enable examples install-examples)"
	enlightenment_src_configure
}