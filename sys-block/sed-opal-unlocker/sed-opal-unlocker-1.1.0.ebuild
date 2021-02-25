# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Micro-utility for unlocking TCG-OPAL encrypted disks"
HOMEPAGE="https://github.com/dex6/sed-opal-unlocker"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dex6/${PN}.git"
else
	SRC_URI="https://github.com/dex6/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE="+argon2 static"

DEPEND="
	argon2? (
		static? ( app-crypt/argon2:=[static-libs] )
		!static? ( app-crypt/argon2:= )
	)
	>=sys-kernel/linux-headers-5.3"
RDEPEND="${DEPEND}"


src_compile() {
	emake \
		CC="$(tc-getCC)" \
		STATIC=$(use static && echo 1 || echo 0) \
		ENCRYPTED_PASSWORDS=$(use argon2 && echo 1 || echo 0)
}

src_install() {
	dodoc README.*
	dosbin sed-opal-unlocker
	newsbin sedutil-passhasher.py sedutil-passhasher
}
