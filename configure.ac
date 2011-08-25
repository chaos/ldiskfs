# Process this file with autoconf to produce a configure script.

AC_INIT([lustre-ldiskfs], [3.3.0], [http://bugs.whamclound.com/])
AC_LANG(C)
AC_CONFIG_AUX_DIR([.]) dnl # Don't look for install-sh, etc. in ..
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE
AC_PROG_CC

LDISKFS_AC_INCLUDE_RULES
LDISKFS_AC_DIST
LDISKFS_AC_KERNEL

dnl #
dnl # TODO: When the build system restructuring is completed, this
dnl #       compatibility macro should be unnecessary and should be
dnl #       removed. This is needed to temporarily provide some of
dnl #       the functionality that the LB_LINUX_PATH macro provided.
dnl #
LDISKFS_AC_COMPAT_LB_LINUX_PATH

LDISKFS_AC_CONFIG_HEADERS
LDISKFS_AC_LDISKFSDIR
LDISKFS_AC_QUILT
LDISKFS_AC_PATH_PROGS
LDISKFS_AC_DEFINE_OPTIONS
LDISKFS_AC_ENABLE_EXT4

dnl #
dnl # TODO: Just as the above compatibility macro, this should be
dnl #       removed when the refactoring is complete.
dnl #
LDISKFS_AC_COMPAT_LB_HAVE_EXT4_ENABLED

LDISKFS_AC_DIST_LDISKFS_SERIES
LDISKFS_AC_CHECK_SYMBOL_EXPORTS
LDISKFS_AC_MOSTLYCLEANFILES

AC_CONFIG_FILES([
	Makefile
	autoMakefile
	Rules
	ldiskfs/Makefile
	ldiskfs/autoMakefile
	lustre-ldiskfs.spec
])

AC_OUTPUT
