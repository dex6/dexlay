# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs git-r3

DESCRIPTION="Plymouth and Plasma boot themes for Lenovo Thinkpads"
HOMEPAGE="https://github.com/dex6/sed-opal-unlocker"
EGIT_REPO_URI="https://github.com/dex6/lenovo-e590-gentoo-linux.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2+ GPL-3+"
SLOT="0"
IUSE="+plasma +plymouth"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	if use plasma; then
		insinto /usr/share/plasma/look-and-feel/
		doins -r artwork/plasma/*
	fi
	if use plymouth; then
		insinto /usr/share/plymouth/themes/
		doins -r artwork/plymouth/*
	fi
}
