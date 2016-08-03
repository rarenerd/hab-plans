pkg_origin=rarenerd
pkg_name=rpm
pkg_version=4.12.0.1
pkg_description="RPM Package Manager"
pkg_upstream_url=http://www.rpm.org/
pkg_maintainer="Kristian Vlaardingerbroek <kvlaardingerbroek@schubergphilis.com>"
pkg_license=("GPL-2.0","LGPL-2.0")
pkg_upstream_url=http://rpm.org
pkg_source=http://www.rpm.org/releases/${pkg_name}-4.12.x/${pkg_name}-${pkg_version}.tar.bz2
pkg_shasum=77ddd228fc332193c874aa0b424f41db1ff8b7edbb6a338703ef747851f50229
pkg_deps=(core/glibc core/zlib rarenerd/nspr rarenerd/nss core/file rarenerd/popt core/libarchive core/db core/lua)
pkg_build_deps=(core/gcc core/make)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
  ./configure --prefix=${pkg_prefix} \
              --with-external-db

  make
}