# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Plymouth and Plasma boot themes for Lenovo Thinkpads"
HOMEPAGE="https://github.com/dex6/lenovo-e590-gentoo-linux"
EGIT_COMMIT="3016683d0470399bc8b4350724275cb7c1ffa04e"
SRC_URI="https://github.com/dex6/lenovo-e590-gentoo-linux/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"

LICENSE="GPL-2+ GPL-3+"
SLOT="0"
IUSE="+plasma +plymouth"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/lenovo-e590-gentoo-linux-${EGIT_COMMIT}"

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
