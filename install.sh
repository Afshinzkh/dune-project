#!/bin/bash

# The following environment variables are recognized:
# F77 the fortran compiler (gfortran)
# CC the C compiler (gcc)
# CXX the C++ compiler (g++)
# CXXFLAGS the standard C++ flags for external libraries ("-O3 -DNEBUG")
# CFLAGS the standard C flags for external libraries (copy CXXFLAGS)
# MAKE_FLAGS flags to be given to make during the build process ("-j2")


# get the installation path
echo "Enter The aboslute installation Path:"
read path_input
echo "dune will be installed in: $path_input"
mkdir $path_input



ROOT=$(pwd)
if [ ! "$F77" ]; then
  F77=gfortran
fi
if [ ! "$CC" ]; then
CC=gcc
fi
if [ ! "$CXX" ]; then
CXX=g++
fi
if [ ! "$CXXFLAGS" ]; then
CXXFLAGS="-O3 -DNDEBUG"
fi
CFLAGS="$CXXFLAGS"
if [ ! "$MAKE_FLAGS" ]; then
MAKE_FLAGS="-j2"
fi

# To avoid an ugly cmake bug we expand our compiler variables to absolute paths
export CC=$(which $CC)
export CXX=$(which $CXX)
export F77=$(which $F77)

# Check whether we have built external dependencies
if [ ! -d "$(pwd)/external/ug" ]; then
  ./external.sh
fi


# generate an opts file with debug flags
echo "CMAKE_FLAGS=\"
-DUG_ROOT=$ROOT/external/ug
-DCMAKE_C_COMPILER='$CC'
-DCMAKE_CXX_COMPILER='$CXX'
-DMPI_CC_COMPILER=mpicc.mpich 
-DMPI_CXX_COMPILER=mpicxx.mpich
-DCMAKE_CXX_FLAGS='-Wall -DDUNE_AVOID_CAPABILITIES_IS_PARALLEL_DEPRECATION_WARNING'
-DCMAKE_CXX_FLAGS_DEBUG='-O0 -ggdb'
-DDUNE_SYMLINK_TO_SOURCE_TREE=1
-DCMAKE_BUILD_TYPE=Debug
-DCMAKE_INSTALL_PREFIX='$path_input'
\"" > debug.opts

git submodule add https://gitlab.dune-project.org/pdelab/dune-pdelab.git
git submodule add https://gitlab.dune-project.org/pdelab/dune-typetree.git
git submodule add https://gitlab.dune-project.org/extensions/dune-alugrid.git
git submodule add https://gitlab.dune-project.org/core/dune-common.git
git submodule add https://gitlab.dune-project.org/core/dune-istl.git
git submodule add https://gitlab.dune-project.org/core/dune-geometry.git
git submodule add https://gitlab.dune-project.org/core/dune-grid.git
git submodule add https://gitlab.dune-project.org/core/dune-localfunctions.git
git submodule update --init

./dune-common/bin/dunecontrol --opts=debug.opts --builddir=$(pwd)/debug-build all

#to install
./dune-common/bin/dunecontrol --opts=debug.opts --builddir=$(pwd)/debug-build make install

