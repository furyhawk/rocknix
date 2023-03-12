# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020-present Fewtarius

PKG_NAME="minivmacsa"
PKG_VERSION="37.03"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://www.gryphel.com/c/minivmac/"
PKG_URL="https://www.gryphel.com/d/minivmac/minivmac-${PKG_VERSION}/minivmac-${PKG_VERSION}.src.tgz"
PKG_DEPENDS_TARGET="toolchain libX11"
PKG_PRIORITY="optional"
PKG_SECTION="emulators"
PKG_SHORTDESC="Virtual Macintosh Plus"
PKG_TOOLCHAIN="manual"

make_target() {
  cd ${PKG_BUILD}
  gcc setup/tool.c -o setup_t
  ./setup_t -t lx64 -fullscreen 1 > setup.sh
  . setup.sh
  make
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_BUILD}/minivmac ${INSTALL}/usr/bin
  chmod 0755 ${INSTALL}/usr/bin/*
}