# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-gnomevfs/gst-plugins-gnomevfs-0.10.36.ebuild,v 1.1 2012/10/21 08:00:07 tetromino Exp $

EAPI=4

inherit gst-plugins-base

KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-solaris"
IUSE=""

RDEPEND=">=gnome-base/gnome-vfs-2:2"
DEPEND="${RDEPEND}"

GST_PLUGINS_BUILD="gnome_vfs"