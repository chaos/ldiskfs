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
LB_PROG_LINUX
if test x$linux25 = xyes ; then
	LB_LINUX_MODPOST
fi

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

LB_HAVE_EXT4_ENABLED

if test x$enable_ext4 = xyes ; then
	AC_DEFINE(HAVE_EXT4_LDISKFS, 1, [ldiskfs based on ext4])
	BACKFS=ext4
else
	BACKFS=ext3
fi

AC_SUBST(BACKFS)
BACKFSU=${BACKFS/ext/EXT}
AC_SUBST(BACKFSU) # We need a Upper string

AM_CONDITIONAL(USE_EXT4, test x$enable_ext4 = xyes)

if test x$enable_dist != xyes; then
	# don't need to do this if only configuring for make dist
AC_MSG_CHECKING([which ldiskfs series to use])
case $LINUXRELEASE in
2.6.5*) LDISKFS_SERIES="2.6-suse.series" ;;
2.6.9*) LDISKFS_SERIES="2.6-rhel4.series" ;;
2.6.10-ac*) LDISKFS_SERIES="2.6-fc3.series" ;;
2.6.10*) LDISKFS_SERIES="2.6-rhel4.series" ;;
2.6.12*) LDISKFS_SERIES="2.6.12-vanilla.series" ;;
2.6.15*) LDISKFS_SERIES="2.6-fc5.series";;
2.6.16*) LDISKFS_SERIES="2.6-sles10.series";;
2.6.18*)
	if test x$RHEL_KENEL = xyes; then
                if test x$enable_ext4 = xyes; then
		        LDISKFS_SERIES="2.6-rhel5-ext4.series"
                else
		        LDISKFS_SERIES="2.6-rhel5.series"
                fi
	else
		LDISKFS_SERIES="2.6.18-vanilla.series"
	fi
	;;
2.6.22*) LDISKFS_SERIES="2.6.22-vanilla.series";;
2.6.27*) LDISKFS_SERIES="2.6-sles11.series";;
2.6.32*) LDISKFS_SERIES="2.6-rhel6.series";;
*) AC_MSG_WARN([Unknown kernel version $LINUXRELEASE, fix ldiskfs/configure.ac])
esac
AC_MSG_RESULT([$LDISKFS_SERIES])
fi
AC_SUBST(LDISKFS_SERIES)

AC_SUBST(ac_configure_args)

LB_CHECK_SYMBOL_EXPORT([d_rehash_cond],
		       [fs/dcache.c],
		       [AC_DEFINE(HAVE_D_REHASH_COND, 1,
				  [d_rehash_cond is exported by the kernel])],
				  [])

LB_CHECK_SYMBOL_EXPORT([__d_rehash],
		       [fs/dcache.c],
		       [AC_DEFINE(HAVE___D_REHASH, 1,
				  [__d_rehash is exported by the kernel])],
				  [])

LB_CONFIG_FILES
AC_CONFIG_FILES([ldiskfs/autoMakefile ldiskfs/Makefile])

MOSTLYCLEANFILES='.*.cmd .*.flags *.o *.ko *.mod.c .depend .*.1.* Modules.symvers Module.symvers'
AC_SUBST(MOSTLYCLEANFILES)

AC_OUTPUT
