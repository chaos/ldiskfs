# Process this file with autoconf to produce a configure script.

AC_INIT
LDISKFS_AC_META
AC_LANG(C)
AC_CONFIG_AUX_DIR([.]) dnl # Don't look for install-sh, etc. in ..
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE([$LDISKFS_META_NAME], [$LDISKFS_META_VERSION])
AC_PROG_CC

LDISKFS_AC_CONFIG

AC_CONFIG_FILES([
	Makefile
	ldiskfs/Makefile
	lustre-ldiskfs.spec
])

AC_OUTPUT
