#!/bin/bash
pkg_origin=rarenerd
pkg_name=popt
pkg_version=1.16
pkg_descriptyon="Popt is a C library for parsing command line parameters"
pkg_maintainer="Kristian Vlaardingerbroek <kvlaardingerbroek@schubergphilis.com>"
pkg_license=("MIT")
pkg_upstream_url=http://rpm5.org
pkg_source=http://rpm5.org/files/${pkg_name}/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8
pkg_deps=(core/glibc)
pkg_build_deps=(core/gcc core/make)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)