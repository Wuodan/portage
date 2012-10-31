# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/postgresql-docs/postgresql-docs-8.4.14.ebuild,v 1.1 2012/09/24 17:39:02 patrick Exp $

EAPI="4"

inherit versionator

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~sparc-fbsd ~x86-fbsd"

# Nothing to test here per 232157
RESTRICT="test"

DESCRIPTION="PostgreSQL documentation"
HOMEPAGE="http://www.postgresql.org/"
SRC_URI="mirror://postgresql/source/v${PV}/postgresql-${PV}.tar.bz2"
LICENSE="POSTGRESQL"

S=${WORKDIR}/postgresql-${PV}
SLOT="$(get_version_component_range 1-2)"

IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	tar xjf "${DISTDIR}/${A}" -C "${WORKDIR}" "${A%.tar.bz2}/doc"
}

src_install() {
	cd "${S}/doc"

	dodir /usr/share/doc/${PF}/html
	tar -zxf "postgres.tar.gz" -C "${ED}/usr/share/doc/${PF}/html"
	fowners root:0 -R /usr/share/doc/${PF}/html

	docinto sgml
	dodoc src/sgml/*.{sgml,dsl}
	docinto sgml/ref
	dodoc src/sgml/ref/*.sgml

	docinto
	dodoc TODO

	dodir /etc/eselect/postgresql/slots/${SLOT}
	echo "postgres_ebuilds=\"\${postgres_ebuilds} ${PF}\"" > \
		"${ED}/etc/eselect/postgresql/slots/${SLOT}/docs"
}