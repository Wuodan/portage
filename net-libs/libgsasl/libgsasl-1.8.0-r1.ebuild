# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libgsasl/libgsasl-1.8.0-r1.ebuild,v 1.2 2012/10/20 17:47:47 jer Exp $

EAPI="4"

inherit autotools eutils

DESCRIPTION="The GNU SASL library"
HOMEPAGE="http://www.gnu.org/software/gsasl/"
SRC_URI="mirror://gnu/${PN/lib}/${P}.tar.gz"
LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE="idn gcrypt kerberos nls ntlm static-libs"
DEPEND="
	gcrypt? ( dev-libs/libgcrypt )
	idn? ( net-dns/libidn )
	kerberos? ( virtual/krb5 )
	nls? ( >=sys-devel/gettext-0.18.1 )
	ntlm? ( net-libs/libntlm )
"
RDEPEND="${DEPEND}
	!net-misc/gsasl"

src_prepare() {
	epatch "${FILESDIR}/${PN}-gss-extra.patch"
	sed -i -e 's/ -Werror//' configure.ac || die
	eautoreconf
}

src_configure() {
	local krb5_impl
	if use kerberos; then
		krb5_impl="--with-gssapi-impl="
		krb5_impl+=$(has_version app-crypt/mit-krb5 && echo "mit" || echo "heimdal")
	fi
	econf \
		$(use_with gcrypt libgcrypt) \
		$(use_with idn stringprep) \
		$(use_enable kerberos gssapi) \
		${krb5_impl} \
		$(use_enable nls) \
		$(use_enable ntlm) \
		$(use_enable static-libs static)
}

src_install() {
	default

	if ! use static-libs; then
		rm -f "${D}"/usr/lib*/lib*.la
	fi
}