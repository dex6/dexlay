# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-mod eutils git-r3

EGIT_REPO_URI="https://github.com/lwfinger/${PN}.git"
EGIT_BRANCH="v5.2.2.4"
EGIT_COMMIT="60cb0b5a3cfc95e3f2e6fc294a28d987096b0559"

DESCRIPTION="Stand-alone RTL8188EU driver using nl80211/cfg80211 stack with AP mode support"
HOMEPAGE="https://github.com/lwfinger/rtl8188eu"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND="sys-kernel/linux-firmware"

MODULE_NAMES="8188eu(kernel/drivers/net/wireless:)"
BUILD_TARGETS="modules"


pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KSRC=${KV_DIR}"
}

