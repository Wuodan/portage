# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-devel/gcc/gcc-2.95.3-r10.ebuild,v 1.10 2012/12/29 06:58:20 vapier Exp $

PATCH_VER="1.4"

inherit toolchain eutils flag-o-matic

DESCRIPTION="The GNU Compiler Collection"

KEYWORDS="~alpha ~ppc ~sparc ~x86"

gcc2-flags() {
	# Are we trying to compile with gcc3 ?  CFLAGS and CXXFLAGS needs to be
	# valid for gcc-2.95.3 ...
	if [[ $(tc-arch) == "x86" || $(tc-arch) == "amd64" ]] ; then
		CFLAGS=${CFLAGS//-mtune=/-mcpu=}
		CXXFLAGS=${CXXFLAGS//-mtune=/-mcpu=}
	fi

	replace-cpu-flags k6-{2,3} k6
	replace-cpu-flags athlon{,-{tbird,4,xp,mp}} i686

	replace-cpu-flags pentium-mmx i586
	replace-cpu-flags pentium{2,3,4} i686

	replace-cpu-flags ev6{7,8} ev6
}

src_unpack() {
	toolchain_src_unpack
	rm -rf texinfo
}

src_compile() {
	strip-linguas -u */po
	gcc2-flags
	toolchain_src_compile
}
