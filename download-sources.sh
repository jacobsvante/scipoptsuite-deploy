#!/bin/sh
export LAPACK_VERSION=3.12.0
export GMP_VERSION=6.3.0
export METIS_VERSION=5.1.1
export THIRDPARTY_MUMPS_VERSION=5.6.2.3
export IPOPT_VERSION=3.14.12
export SOPLEX_VERSION=7.0.0
export SCIP_VERSION=9.0.0
cd sources
test -e musl-cross-make.tar.gz || curl -L -o musl-cross-make.tar.gz https://github.com/richfelker/musl-cross-make/archive/refs/heads/master.tar.gz
test -e lapack.tar.gz || curl -L -o lapack.tar.gz https://github.com/Reference-LAPACK/lapack/archive/refs/tags/v${LAPACK_VERSION}.tar.gz
test -e gmp.tar.xz || curl -L -o gmp.tar.xz https://github.com/pmmp/DependencyMirror/releases/download/mirror/gmp-${GMP_VERSION}.tar.xz
test -e gklib.tar.gz || curl -L -o gklib.tar.gz https://github.com/KarypisLab/GKlib/archive/refs/tags/METIS-v${METIS_VERSION}-DistDGL-0.5.tar.gz
test -e metis.tar.gz || curl -L -o metis.tar.gz https://github.com/KarypisLab/METIS/archive/refs/tags/v${METIS_VERSION}-DistDGL-v0.5.tar.gz
test -e mumps.tar.gz || curl -L -o mumps.tar.gz https://github.com/scivision/mumps/archive/refs/tags/v${THIRDPARTY_MUMPS_VERSION}.tar.gz
test -e ipopt.tar.gz || curl -L -o ipopt.tar.gz https://github.com/coin-or/Ipopt/archive/refs/tags/releases/${IPOPT_VERSION}.tar.gz
test -e soplex.tar.gz || curl -L -o soplex.tar.gz https://github.com/jacobsvante/soplex/archive/refs/heads/no-libsoplexshared-so.tar.gz
test -e scip.tar.gz || curl -L -o scip.tar.gz https://github.com/scipopt/scip/archive/refs/tags/v$(echo $SCIP_VERSION | tr -d .).tar.gz
cd ..

# curl -L -o soplex.tar.gz https://github.com/scipopt/soplex/archive/refs/tags/release-$(echo ${SOPLEX_VERSION} | tr -d .).tar.gz
