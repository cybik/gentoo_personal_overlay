# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5


DESCRIPTION="Qt password manager compatible with its Win32 and Pocket PC versions"
HOMEPAGE="http://www.keepassx.org/"

SCM="git-r3"
EGIT_REPO_URI="https://github.com/Ivan0xFF/keepassx.git"
SRC_URI="" #git
inherit cmake-utils vcs-snapshot git-r3

LICENSE="|| ( GPL-2 GPL-3 ) BSD GPL-2 LGPL-2.1 LGPL-3+ CC0-1.0 public-domain || ( LGPL-2.1 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="
	dev-libs/qjson
        dev-libs/libgcrypt:0=
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qttest:4
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXtst
"
RDEPEND="${DEPEND}"

DOCS=(CHANGELOG)
src_unpack() {
        git-r3_src_unpack
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with test TESTS)
	)
	cmake-utils_src_configure
}
