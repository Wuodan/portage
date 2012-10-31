# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/pango/pango-1.28.4.ebuild,v 1.22 2012/10/17 11:18:22 tetromino Exp $

EAPI="3"
GCONF_DEBUG="yes"
GNOME2_LA_PUNT="yes"

inherit autotools eutils gnome2 multilib toolchain-funcs

DESCRIPTION="Internationalized text layout and rendering library"
HOMEPAGE="http://www.pango.org/"

LICENSE="LGPL-2 FTL"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="X +introspection"

RDEPEND=">=dev-libs/glib-2.24:2
	>=media-libs/fontconfig-2.5.0:1.0
	media-libs/freetype:2
	>=x11-libs/cairo-1.7.6[X?]
	X? (
		x11-libs/libXrender
		x11-libs/libX11
		x11-libs/libXft )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	>=dev-util/gtk-doc-am-1.13
	introspection? ( >=dev-libs/gobject-introspection-0.9.5 )
	X? ( x11-proto/xproto )
	!<=sys-devel/autoconf-2.63:2.5"

function multilib_enabled() {
	has_multilib_profile || ( use x86 && [ "$(get_libdir)" = "lib32" ] )
}

pkg_setup() {
	tc-export CXX
	G2CONF="${G2CONF}
		$(use_enable introspection)
		$(use_with X x)
		$(use X && echo --x-includes=${EPREFIX}/usr/include)
		$(use X && echo --x-libraries=${EPREFIX}/usr/$(get_libdir))"
	DOCS="AUTHORS ChangeLog* NEWS README THANKS"
}

src_prepare() {
	# make config file location host specific so that a 32bit and 64bit pango
	# wont fight with each other on a multilib system.  Fix building for
	# emul-linux-x86-gtklibs
	if multilib_enabled ; then
		epatch "${FILESDIR}/${PN}-1.26.0-lib64.patch"
		eautoreconf
	fi

	gnome2_src_prepare
}

pkg_postinst() {
	if [ "${ROOT}" = "/" ] ; then
		einfo "Generating modules listing..."

		local PANGO_CONFDIR=

		if multilib_enabled ; then
			PANGO_CONFDIR="${EPREFIX}/etc/pango/${CHOST}"
		else
			PANGO_CONFDIR="${EPREFIX}/etc/pango"
		fi

		mkdir -p "${PANGO_CONFDIR}"
		local pango_conf="${PANGO_CONFDIR}/pango.modules"
		local tmp_file=$(mktemp -t tmp_pango_ebuild.XXXXXXXXXX)

		# be atomic!
		if pango-querymodules > "${tmp_file}"; then
			cat "${tmp_file}" > "${pango_conf}" || {
				rm "${tmp_file}"; die; }
		else
			ewarn "Cannot update pango.modules, file generation failed"
		fi
		rm "${tmp_file}"

	fi
}