# Process this file with autoconf to produce a configure script.

AC_INIT([lustre-ldiskfs], [3.3.0], [http://bugs.whamclound.com/])

dnl #
dnl # TODO: What is the point of this? Is it needed?
dnl #
dnl # AC_CONFIG_SRCDIR([lustre-ldiskfs.spec.in])
dnl # ldiskfs_is_ext4=yes
dnl #

AC_LANG(C)
AC_CONFIG_AUX_DIR([.]) # Don't look for install-sh, etc. in ..
AC_CANONICAL_SYSTEM

dnl #
dnl # TODO: Do we really need to specify these options?
dnl #
AM_INIT_AUTOMAKE([1.9 tar-ustar])

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

dnl #
dnl # TODO: Why is this here?
dnl #
#if test x$linux25 = xyes ; then
#	LB_LINUX_MODPOST
#fi

LDISKFS_AC_CONFIG_HEADERS

dnl #
dnl # TODO: What is the purpose of these? There are dependant rules in
dnl #       the build/autoMakefile.am.toplevel file, but I'm unsure what
dnl #       their purpose is.
dnl #
# These allow Lustre Makefiles and autoMakefiles to be used unchanged.
AM_CONDITIONAL(MODULES, true)
AM_CONDITIONAL(LINUX, true)
AM_CONDITIONAL(DARWIN, true)
AM_CONDITIONAL(LINUX25, true)

LDISKFS_AC_LDISKFSDIR
LDISKFS_AC_QUILT
LDISKFS_AC_PATH_PROGS
LDISKFS_AC_DEFINE_OPTIONS

LDISKFS_AC_ENABLE_EXT4
LDISKFS_AC_COMPAT_LB_HAVE_EXT4_ENABLED

LDISKFS_AC_DIST_LDISKFS_SERIES

AC_SUBST(ac_configure_args)

LDISKFS_AC_CHECK_SYMBOL_EXPORTS

LB_CONFIG_FILES
AC_CONFIG_FILES([ldiskfs/autoMakefile ldiskfs/Makefile])

MOSTLYCLEANFILES='.*.cmd .*.flags *.o *.ko *.mod.c .depend .*.1.* Modules.symvers Module.symvers'
AC_SUBST(MOSTLYCLEANFILES)

AC_OUTPUT
