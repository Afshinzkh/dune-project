#!/bin/bash

# This script is part of the convenience build system for the IWR Dune course.
# It installs all external dependencies of Dune used throughout the course.

# Install UG
wget http://conan.iwr.uni-heidelberg.de/download/ug-3.12.1.tar.gz
tar xzf ug-3.12.1.tar.gz
INSTALL_HOME=$(pwd)/external
pushd ug-3.12.1
( ./configure MPICC=$MPICC CC=$CXX --prefix=$INSTALL_HOME/ug CXXFLAGS="$CXXFLAGS" --enable-parallel --enable-dune && make $MAKE_FLAGS && make install ) || exit $?
popd
rm -rf ug-3.12.1
rm ug-3.12.1.tar.gz
