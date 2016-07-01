# -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
AC_PREREQ([2.62])
DUNE_AC_INIT # gets module version from dune.module file
AC_CONFIG_SRCDIR([src/dune-heat.cc])
AC_CONFIG_HEADERS([config.h])

# we need no more than the standard DE-stuff
# this module depends on dune-common dune-typetree dune-geometry dune-grid dune-localfunctions dune-istl dune-alugrid dune-pdelab
# this implies checking for [dune-common], [dune-typetree], [dune-geometry], [dune-grid], [dune-localfunctions], [dune-istl], [dune-alugrid], [dune-pdelab]
DUNE_CHECK_ALL

# implicitly set the Dune-flags everywhere
AC_SUBST(AM_CPPFLAGS, $DUNE_CPPFLAGS)
AC_SUBST(AM_LDFLAGS, $DUNE_LDFLAGS)
LIBS="$DUNE_LIBS"

AC_CONFIG_FILES([
  Makefile
  src/Makefile
  cmake/Makefile
  cmake/modules/Makefile
  doc/Makefile
  doc/doxygen/Makefile
  doc/doxygen/Doxyfile
  dune/Makefile
  dune/heat/Makefile
  m4/Makefile
  dune-heat.pc
])
AC_OUTPUT
# finally print the summary information
DUNE_SUMMARY_ALL
