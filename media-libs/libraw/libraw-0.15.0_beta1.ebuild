# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libraw/libraw-0.15.0_beta1.ebuild,v 1.2 2012/10/15 07:09:27 radhermit Exp $

EAPI="4"

inherit eutils autotools toolchain-funcs

MY_PV="${PV/_b/-B}"
MY_P="LibRaw-${MY_PV}"

DESCRIPTION="LibRaw is a library for reading RAW files obtained from digital photo cameras"
HOMEPAGE="http://www.libraw.org/"
SRC_URI="http://www.libraw.org/data/${MY_P}.tar.gz
	demosaic? (	http://www.libraw.org/data/LibRaw-demosaic-pack-GPL2-${MY_PV}.tar.gz
		http://www.libraw.org/data/LibRaw-demosaic-pack-GPL3-${MY_PV}.tar.gz )"

# Libraw also has it's own license, which is a pdf file and
# can be obtained from here:
# http://www.libraw.org/data/LICENSE.LibRaw.pdf
LICENSE="LGPL-2.1 CDDL GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="demosaic examples jpeg jpeg2k +lcms openmp static-libs"

RDEPEND="jpeg? ( virtual/jpeg )
	jpeg2k? ( media-libs/jasper )
	lcms? ( media-libs/lcms:2 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/${MY_P}

DOCS=( Changelog.txt README )

pkg_setup() {
	if use openmp ; then
		tc-has-openmp || die "Please switch to an openmp compatible compiler"
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.13.4-docs.patch
	epatch "${FILESDIR}"/${PN}-0.14.7-pkgconfig.patch
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_enable openmp) \
		$(use_enable jpeg) \
		$(use_enable jpeg2k jasper) \
		$(use_enable lcms) \
		$(use_enable examples) \
		$(use_enable demosaic demosaic-pack-gpl2) \
		$(use_enable demosaic demosaic-pack-gpl3)
}

src_install() {
	default
	prune_libtool_files
}