#!/bin/bash
pkg_origin=rarenerd
pkg_name=nss
pkg_version=3.25
pkg_maintainer="Kristian Vlaardingerbroek <kvlaardingerbroek@schubergphilis.com>"
pkg_license=("MPL-2.0")
pkg_source=https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_${pkg_version//./_}_RTM/src/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=5d1ad475da19d0c033a716350dc5f8a747999d3eba5ac07ee0368c5bad6e2359
pkg_deps=(core/glibc rarenerd/nspr core/zlib core/sqlite)
pkg_build_deps=(core/gcc core/make core/patch core/perl core/zlib core/sqlite)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_prepare() {
  # Use LDFLAGS during linking
  sed -e '/\$(MKSHLIB) -o/ s/$/ \$(LDFLAGS)/' -i nss/coreconf/rules.mk
}

do_build() {
  cd ${pkg_name}

  make -j1 BUILD_OPT=1 \
           NSPR_INCLUDE_DIR="$(pkg_path_for nspr)/include/nspr" \
           NSPR_LIB_DIR="$(pkg_path_for nspr)/lib" \
           NSS_USE_SYSTEM_SQLITE=1 \
           USE_SYSTEM_ZLIB=1 \
           ZLIB_LIBS=-lz \
           USE_64=1 \
           XCFLAGS="${CFLAGS}"
}

do_install() {
  mkdir -p ${pkg_prefix}/{bin,include/nss,lib}

  install -m0755 dist/Linux*/bin/{*util,derdump,pp,shlibsign,signtool,signver,ssltap,vfychain,vfyserv} ${pkg_prefix}/bin
  install -m0644 dist/public/nss/*.h ${pkg_prefix}/include/nss
  install -m0755 dist/Linux*/lib/*.so ${pkg_prefix}/lib
  install -m0644 dist/Linux*/lib/{*.chk,libcrmf.a} ${pkg_prefix}/lib
}