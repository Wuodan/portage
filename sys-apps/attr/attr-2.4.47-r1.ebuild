# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/attr/attr-2.4.47-r1.ebuild,v 1.3 2013/10/14 18:20:05 mgorny Exp $

EAPI="4"

inherit eutils toolchain-funcs multilib-minimal

DESCRIPTION="Extended attributes tools"
HOMEPAGE="http://savannah.nongnu.org/projects/attr"
SRC_URI="mirror://nongnu/${PN}/${P}.src.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~arm-linux ~x86-linux"
IUSE="nls static-libs"

DEPEND="nls? ( sys-devel/gettext )
	sys-devel/autoconf"
RDEPEND="abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20130224-r9
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
	)"

src_prepare() {
	sed -i \
		-e "/^PKG_DOC_DIR/s:@pkg_name@:${PF}:" \
		-e '/HAVE_ZIPPED_MANPAGES/s:=.*:=false:' \
		include/builddefs.in \
		|| die
	strip-linguas -u po
	multilib_copy_sources # https://savannah.nongnu.org/bugs/index.php?39736
}

multilib_src_configure() {
	unset PLATFORM #184564
	export OPTIMIZER=${CFLAGS}
	export DEBUG=-DNDEBUG

	econf \
		$(use_enable nls gettext) \
		--enable-shared $(use_enable static-libs static) \
		--libexecdir="${EPREFIX}"/usr/$(get_libdir) \
		--bindir="${EPREFIX}"/bin
}

multilib_src_compile() {
	emake $(multilib_is_native_abi || echo TOOL_SUBDIRS=)
}

multilib_src_install() {
	emake \
		$(multilib_is_native_abi || echo TOOL_SUBDIRS=) \
		DIST_ROOT="${D}" \
		install install-lib install-dev

	# we install attr into /bin, so we need the shared lib with it
	multilib_is_native_abi && gen_usr_ldscript -a attr
}

multilib_src_install_all() {
	use static-libs || prune_libtool_files --all
	einstalldocs
	# the man-pages packages provides the man2 files
	rm -r "${ED}"/usr/share/man/man2 || die
}
