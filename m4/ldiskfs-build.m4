AC_DEFUN([LDISKFS_AC_DIST], [
	AC_MSG_CHECKING([whether to only configure enough for make dist])

	AC_ARG_ENABLE([dist],
		[AC_HELP_STRING([--enable-dist],
			[only configure enough for make dist])],
		[],
		[enable_dist='no']
	)

	AS_IF([test x$enable_dist != xno], [enable_modules='no'])

	AC_MSG_RESULT([$enable_dist])
])

AC_DEFUN([LDISKFS_AC_CONFIG_HEADERS], [
	AC_CONFIG_HEADERS([config.h])

	CPPFLAGS="-include $PWD/config.h $CPPFLAGS"
	EXTRA_KCFLAGS="-include $PWD/config.h $EXTRA_KCFLAGS"

	AC_SUBST(EXTRA_KCFLAGS)
])

AC_DEFUN([LDISKFS_AC_LDISKFSDIR], [
	LDISKFSDIR="$PWD/ldiskfs"
	AC_SUBST(LDISKFSDIR)
])

AC_DEFUN([LDISKFS_AC_QUILT], [
	AC_MSG_CHECKING([whether to enable quilt for making ldiskfs])

	AC_ARG_ENABLE([quilt],
		[AC_HELP_STRING([--disable-quilt],
			[disable use of quilt for ldiskfs])],
		[],
		[enable_quilt='yes']
	)

	AC_MSG_RESULT([$enable_quilt])
])

AC_DEFUN([LDISKFS_AC_PATH_PROGS], [
	AC_PATH_PROG([PATCH], [patch], [no])
	AC_PATH_PROG([QUILT], [quilt], [no])

	AS_IF([test x$PATCH$QUILT = xnono], [
		AC_MSG_ERROR([
		*** Quilt or patch are needed to build the ldiskfs module])
	])

	AM_CONDITIONAL([USE_QUILT], [test x$QUILT != xno])
])

AC_DEFUN([LDISKFS_AC_DEFINE_OPTIONS], [
	AC_DEFINE([CONFIG_LDISKFS_FS_MODULE], [1],
		[build ldiskfs as a module])

	AC_DEFINE([CONFIG_LDISKFS_FS_XATTR], [1],
		[enable extended attributes for ldiskfs])

	AC_DEFINE([CONFIG_LDISKFS_FS_POSIX_ACL], [1],
		[enable posix acls for ldiskfs])

	AC_DEFINE([CONFIG_LDISKFS_FS_SECURITY], [1],
		[enable fs security for ldiskfs])

	AC_DEFINE([CONFIG_LDISKFSDEV_FS_POSIX_ACL], [1],
		[enable posix acls for ldiskfs])

	AC_DEFINE([CONFIG_LDISKFSDEV_FS_XATTR], [1],
		[enable extented attributes for ldiskfs])

	AC_DEFINE([CONFIG_LDISKFSDEV_FS_SECURITY], [1],
		[enable fs security for ldiskfs])
])

AC_DEFUN([LDISKFS_AC_LINUX], [
	AC_ARG_WITH([linux],
		[AC_HELP_STRING([--with-linux=PATH],
			[Path to kernel source])],
		[kernelsrc="${withval}"])

	AC_MSG_CHECKING([kernel source directory])

	AS_IF([test -z "${kernelsrc}"], [
		AS_IF([test -e "/lib/modules/$(uname -r)/source"], [
			headersdir="/lib/modules/$(uname -r)/source"
			sourcelink=$(readlink -f "$headersdir")
		], [test -e "/lib/modules/$(uname -r)/build"], [
			headersdir="/lib/modules/$(uname -r)/build"
			sourcelink=$(readlink -f "$headersdir")
		], [
			sourcelink=$(ls -1d /usr/src/kernels/* \
			             /usr/src/linux-* \
			             2>/dev/null | grep -v obj | tail -1)
		])

		AS_IF([test -n "${sourcelink}" && test -e ${sourcelink}], [
			kernelsrc=$(readlink -f ${sourcelink})
		], [
			AC_MSG_RESULT([Not found])
			AC_MSG_ERROR([
	*** Please make sure the kernel devel package for your distribution
	*** is installed then try again. If that fails you can specify the
	*** location of the kernel with the '--with-linux=PATH' option.])
		])
	], [
		AS_IF([test "${kernelsrc}" = "NONE"], [
			kernsrcver=NONE
		])
	])

	AC_MSG_RESULT([${kernelsrc}])

	LINUX=${kernelsrc}
	AC_SUBST(LINUX)
])

AC_DEFUN([LDISKFS_AC_LINUX_OBJ], [
	AC_ARG_WITH([linux-obj],
		[AC_HELP_STRING([--with-linux-obj=PATH],
			[Path to kernel build objects])],
		[kernelbuild="${withval}"])

	AC_MSG_CHECKING([kernel build directory])

	AS_IF([test -z "$kernelbuild"], [
		AS_IF([test -e "/lib/modules/$(uname -r)/build"], [
			kernelbuild=$(readlink -f /lib/modules/$(uname -r)/build)
		], [test -d ${LINUX}-obj/${target_cpu}/${target_cpu}], [
			kernelbuild=${LINUX}-obj/${target_cpu}/${target_cpu}
		], [test -d ${LINUX}-obj/${target_cpu}/default], [
			kernelbuild=${LINUX}-obj/${target_cpu}/default
		], [test -d $(dirname ${LINUX})/build-${target_cpu}], [
			kernelbuild=$(dirname ${LINUX})/build-${target_cpu}
		], [
			kernelbuild=${LINUX}
		])
	])

	AC_MSG_RESULT([${kernelbuild}])

	LINUX_OBJ=${kernelbuild}
	AC_SUBST(LINUX_OBJ)
])

AC_DEFUN([LDISKFS_AC_LINUX_VERSION], [
	AC_MSG_CHECKING([kernel source version])

	utsrelease1=${LINUX_OBJ}/include/linux/version.h
	utsrelease2=${LINUX_OBJ}/include/linux/utsrelease.h
	utsrelease3=${LINUX_OBJ}/include/generated/utsrelease.h
	AS_IF([test -r ${utsrelease1} && fgrep -q UTS_RELEASE ${utsrelease1}], [
		utsrelease=linux/version.h
	], [test -r ${utsrelease2} && fgrep -q UTS_RELEASE ${utsrelease2}], [
		utsrelease=linux/utsrelease.h
	], [test -r ${utsrelease3} && fgrep -q UTS_RELEASE ${utsrelease3}], [
		utsrelease=generated/utsrelease.h
	])

	AS_IF([test "${utsrelease}"], [
		kernsrcver=$((echo "#include <$utsrelease>";
		             echo "kernsrcver=UTS_RELEASE") |
		             cpp -I ${LINUX_OBJ}/include |
		             grep "^kernsrcver=" | cut -d \" -f 2)

		AS_IF([test -z "$kernsrcver"], [
			AC_MSG_RESULT([Not found])
			AC_MSG_ERROR([*** Cannot determine kernel version.])
		])
	], [
		AC_MSG_RESULT([Not found])
		AC_MSG_ERROR([
	*** Cannot find UTS_RELEASE definition.
	*** This is often provided by the kernel-devel package.])
	])

	AC_MSG_RESULT([${kernsrcver}])

	LINUX_VERSION=${kernsrcver}
	AC_SUBST(LINUX_VERSION)
])

AC_DEFUN([LDISKFS_AC_LINUX_CONFIG], [
	AC_ARG_WITH([linux-config],
		[AC_HELP_STRING([--with-linux-config=PATH],
			[Path to kernel kernel .config file])],
		[kernelconfig="${withval}"],
		[kernelconfig="${LINUX_OBJ}/.config"])

	AC_MSG_CHECKING([kernel .config file])

	AS_IF([test ! -e ${kernelconfig}], [
		AC_MSG_ERROR([*** kernel .config file could not be found.])
	])

	AC_MSG_RESULT([${kernelconfig}])

	LINUX_CONFIG=${kernelconfig}
	AC_SUBST(LINUX_CONFIG)
])

AC_DEFUN([LDISKFS_AC_LINUX_SYMBOLS], [
	AC_MSG_CHECKING([kernel file name for module symbols])

	modpost1=${LINUX}/scripts/Makefile.modpost
	modpost2=${LINUX_OBJ}/scripts/Makefile.modpost
	AS_IF([test -f "${modpost1}" || test -f "${modpost2}"], [
		AS_IF([grep -qs Modules.symvers ${modpost1} ${modpost2}], [
			LINUX_SYMBOLS=Modules.symvers
		], [
			LINUX_SYMBOLS=Module.symvers
		])

		AS_IF([test ! -f "${LINUX_OBJ}/${LINUX_SYMBOLS}"], [
			AC_MSG_ERROR([
	*** Please make sure the kernel devel package for your distribution
	*** is installed.  If your building with a custom kernel make sure the
	*** kernel is configured, built, and the '--with-linux=PATH' configure
	*** option refers to the location of the kernel source.])
		])

	], [
		LINUX_SYMBOLS=NONE
	])

	AC_MSG_RESULT(${LINUX_SYMBOLS})
	AC_SUBST(LINUX_SYMBOLS)
])

AC_DEFUN([LDISKFS_AC_LINUX_COMPILE_IFELSE], [
	m4_ifvaln([$1], [AC_LANG_CONFTEST([$1])])
	rm -Rf ldiskfs-build && mkdir -p ldiskfs-build
	echo "obj-m := conftest.o" >ldiskfs-build/Makefile
	AS_IF(
		[AC_TRY_COMMAND(cp conftest.c ldiskfs-build && make [$2] -C $LINUX_OBJ EXTRA_CFLAGS="-Werror-implicit-function-declaration $EXTRA_KCFLAGS" M=$PWD/ldiskfs-build) >/dev/null && AC_TRY_COMMAND([$3])],
		[$4],
		[_AC_MSG_LOG_CONFTEST m4_ifvaln([$5],[$5])]
	)
	rm -Rf ldiskfs-build
])

m4_define([LDISKFS_AC_LANG_PROGRAM], [
$1
int
main (void)
{
dnl Do *not* indent the following line: there may be CPP directives.
dnl Don't move the `;' right after for the same reason.
$2
  ;
  return 0;
}
])

AC_DEFUN([LDISKFS_AC_LINUX_TRY_COMPILE],
	[LDISKFS_AC_LINUX_COMPILE_IFELSE(
	[AC_LANG_SOURCE([LDISKFS_AC_LANG_PROGRAM([[$1]], [[$2]])])],
	[modules],
	[test -s ldiskfs-build/conftest.o],
	[$3], [$4])
])

AC_DEFUN([LDISKFS_AC_LINUX_CONFIG_OPTION],
	[AC_MSG_CHECKING([whether Linux was built with CONFIG_$1])

	LDISKFS_AC_LINUX_TRY_COMPILE([
		#include <linux/module.h>
	],[
		#ifndef CONFIG_$1
		#error CONFIG_$1 not #defined
		#endif
	],[
		AC_MSG_RESULT([yes])
		$2
	],[
		AC_MSG_RESULT([no])
		$3
	])
])

AC_DEFUN([LDISKFS_AC_LINUX_CONFIGURATION], [
	LDISKFS_AC_LINUX_CONFIG_OPTION([MODULES], [], [
		AC_MSG_ERROR([
	*** Kernel not built with CONFIG_MODULES which is required to
	*** build ldiskfs kernel modules.])
	])
])

AC_DEFUN([LDISKFS_AC_KERNEL], [
	LDISKFS_AC_LINUX
	LDISKFS_AC_LINUX_OBJ
	LDISKFS_AC_LINUX_VERSION
	LDISKFS_AC_LINUX_CONFIG
	LDISKFS_AC_LINUX_SYMBOLS
	LDISKFS_AC_LINUX_CONFIGURATION
])

AC_DEFUN([LDISKFS_AC_EXT4_SOURCES], [
	AC_CHECK_FILES([
		${LINUX}/fs/ext4/acl.h
		${LINUX}/fs/ext4/ext4.h
		${LINUX}/fs/ext4/ext4_extents.h
		${LINUX}/fs/ext4/ext4_jbd2.h
		${LINUX}/fs/ext4/mballoc.h
		${LINUX}/fs/ext4/xattr.h

		${LINUX}/fs/ext4/acl.c
		${LINUX}/fs/ext4/balloc.c
		${LINUX}/fs/ext4/bitmap.c
		${LINUX}/fs/ext4/block_validity.c
		${LINUX}/fs/ext4/dir.c
		${LINUX}/fs/ext4/ext4_jbd2.c
		${LINUX}/fs/ext4/extents.c
		${LINUX}/fs/ext4/file.c
		${LINUX}/fs/ext4/fsync.c
		${LINUX}/fs/ext4/hash.c
		${LINUX}/fs/ext4/ialloc.c
		${LINUX}/fs/ext4/inode.c
		${LINUX}/fs/ext4/ioctl.c
		${LINUX}/fs/ext4/mballoc.c
		${LINUX}/fs/ext4/migrate.c
		${LINUX}/fs/ext4/move_extent.c
		${LINUX}/fs/ext4/namei.c
		${LINUX}/fs/ext4/resize.c
		${LINUX}/fs/ext4/super.c
		${LINUX}/fs/ext4/symlink.c
		${LINUX}/fs/ext4/xattr.c
		${LINUX}/fs/ext4/xattr_security.c
		${LINUX}/fs/ext4/xattr_trusted.c
		${LINUX}/fs/ext4/xattr_user.c
	], [], [
		AC_MSG_ERROR([*** Complete Ext4 source tree not found])
	])
])

AC_DEFUN([LDISKFS_AC_EXT3_SOURCES], [
	AC_CHECK_FILES([
		${LINUX}/fs/ext3/acl.h
		${LINUX}/fs/ext3/namei.h
		${LINUX}/fs/ext3/xattr.h

		${LINUX}/fs/ext3/acl.c
		${LINUX}/fs/ext3/balloc.c
		${LINUX}/fs/ext3/bitmap.c
		${LINUX}/fs/ext3/dir.c
		${LINUX}/fs/ext3/ext3_jbd.c
		${LINUX}/fs/ext3/file.c
		${LINUX}/fs/ext3/fsync.c
		${LINUX}/fs/ext3/hash.c
		${LINUX}/fs/ext3/ialloc.c
		${LINUX}/fs/ext3/inode.c
		${LINUX}/fs/ext3/ioctl.c
		${LINUX}/fs/ext3/namei.c
		${LINUX}/fs/ext3/resize.c
		${LINUX}/fs/ext3/super.c
		${LINUX}/fs/ext3/symlink.c
		${LINUX}/fs/ext3/xattr.c
		${LINUX}/fs/ext3/xattr_security.c
		${LINUX}/fs/ext3/xattr_trusted.c
		${LINUX}/fs/ext3/xattr_user.c
	], [], [
		AC_MSG_ERROR([*** Complete Ext3 source tree not found])
	])
])

AC_DEFUN([LDISKFS_AC_ENABLE_EXT4], [
	AC_MSG_CHECKING([whether to build ldiskfs based on ext4])

	AC_ARG_ENABLE([ext4],
		[AC_HELP_STRING([--enable-ext4],
			[enable building ldiskfs based on ext4])],
		[],
		[enable_ext4=yes]
	)

	AC_MSG_RESULT([${enable_ext4}])

	BACKFS=""
	AS_IF([test x${enable_ext4} = xyes], [
		AC_DEFINE(HAVE_EXT4_LDISKFS, 1, [build ldiskfs based on ext4])
		BACKFS="ext4"
		LDISKFS_AC_EXT4_SOURCES
	], [
		BACKFS="ext3"
		LDISKFS_AC_EXT3_SOURCES
	])
	AC_SUBST(BACKFS)

	dnl # The sed flags variable in ldiskfs/Makefile.in needs an
	dnl # uppercase version of BACKFS.
	BACKFSU=${BACKFS/ext/EXT}
	AC_SUBST(BACKFSU)

	AM_CONDITIONAL([USE_EXT4], [test x$enable_ext4 = xyes])
])

AC_DEFUN([LDISKFS_AC_RHEL_KERNEL], [
	AC_MSG_CHECKING([whether the kernel is a RedHat kernel])

	LDISKFS_AC_LINUX_TRY_COMPILE([
		#include <linux/version.h>
	], [
		#ifndef RHEL_RELEASE_CODE
		#error "not redhat kernel"
		#endif
	], [
		AC_MSG_RESULT([yes])
		RHEL_KERNEL="yes"
	], [
		AC_MSG_RESULT([no])
	])
])

AC_DEFUN([LDISKFS_AC_LDISKFS_SERIES], [
	LDISKFS_AC_RHEL_KERNEL

	AC_MSG_CHECKING([which ldiskfs series to use])

	LDISKFS_SERIES=""
	AS_CASE([${LINUX_VERSION}],
		[2.6.5*],     [LDISKFS_SERIES="2.6-suse.series"],
		[2.6.9*],     [LDISKFS_SERIES="2.6-rhel4.series"],
		[2.6.10-ac*], [LDISKFS_SERIES="2.6-fc3.series"],
		[2.6.10*],    [LDISKFS_SERIES="2.6-rhel4.series"],
		[2.6.12*],    [LDISKFS_SERIES="2.6.12-vanilla.series"],
		[2.6.15*],    [LDISKFS_SERIES="2.6-fc5.series"],
		[2.6.16*],    [LDISKFS_SERIES="2.6-sles10.series"],
		[2.6.18*],    [
			AS_IF([test x${RHEL_KERNEL} = xyes], [
				AS_IF([test x${enable_ext4} = xyes], [
					LDISKFS_SERIES="2.6-rhel5-ext4.series"
				], [
					LDISKFS_SERIES="2.6-rhel5.series"
				])
			], [
				LDISKFS_SERIES="2.6.18-vanilla.series"
			])
		],
		[2.6.22*],    [LDISKFS_SERIES="2.6.22-vanilla.series"],
		[2.6.27*],    [LDISKFS_SERIES="2.6.22-sles11.series"],
		[2.6.32*],    [LDISKFS_SERIES="2.6-rhel6.series"],
		[AC_MSG_RESULT([indeterminate])
		 AC_MSG_ERROR([*** Unknown kernel version ${LINUX_VERSION}])]
	)

	AC_MSG_RESULT([${LDISKFS_SERIES}])

	AC_SUBST(LDISKFS_SERIES)
])

AC_DEFUN([LDISKFS_AC_DIST_LDISKFS_SERIES], [
	AS_IF([test x$enable_dist != xyes], [
		LDISKFS_AC_LDISKFS_SERIES
	])
])

AC_DEFUN([LDISKFS_AC_LINUX_SYMBOL_EXPORT], [
	AC_MSG_CHECKING([whether Linux was build with symbol $1 exported])

	grep -q -E '[[[:space:]]]$1[[[:space:]]]' \
		${LINUX_OBJ}/${LINUX_SYMBOLS} 2>/dev/null
	rc=$?
	AS_IF([test ${rc} -ne 0], [
		export=0
		for file in $2; do
			grep -q -E "EXPORT_SYMBOL.*\($1\)" \
				"${LINUX}/${file}" 2>/dev/null
			rc=$?
			AS_IF([test ${rc} -eq 0], [
				export=1
				break
			])
		done

		AS_IF([test ${export} -eq 0], [
			AC_MSG_RESULT([no])
			$4
		], [
			AC_MSG_RESULT([yes])
			$3
		])
	], [
		AC_MSG_RESULT([yes])
		$3
	])
])

AC_DEFUN([LDISKFS_AC_CHECK_SYMBOL_EXPORTS], [
	LDISKFS_AC_LINUX_SYMBOL_EXPORT([d_rehash_cond],
		[fs/dcache.c], [AC_DEFINE(HAVE_D_REHASH_COND, 1,
			[d_rehash_cond is exported by the kernel])],
		[]
	)

	LDISKFS_AC_LINUX_SYMBOL_EXPORT([__d_rehash],
		[fs/dcache.c], [AC_DEFINE(HAVE___D_REHASH, 1,
			[__d_rehash is exported by the kernel])],
		[]
	)
])

AC_DEFUN([LDISKFS_AC_MOSTLYCLEANFILES], [
	MOSTLYCLEANFILES='.*.cmd \
	                  .*.flags \
	                  *.o \
	                  *.ko \
	                  *.mod.c \
	                  .depend \
	                  .*.1.* \
	                  Modules.symvers \
	                  Module.symvers'

	AC_SUBST(MOSTLYCLEANFILES)
])

AC_DEFUN([LDISKFS_AC_RPM], [
	RPM=rpm
	RPMBUILD=rpmbuild

	AC_MSG_CHECKING([whether $RPM is available])
	AS_IF([tmp=$($RPM --version 2>/dev/null)], [
		RPM_VERSION=$(echo $tmp | $AWK '/RPM/ { print $[3] }')
		HAVE_RPM=yes
		AC_MSG_RESULT([$HAVE_RPM ($RPM_VERSION)])
	],[
		HAVE_RPM=no
		AC_MSG_RESULT([$HAVE_RPM])
	])

	AC_MSG_CHECKING([whether $RPMBUILD is available])
	AS_IF([tmp=$($RPMBUILD --version 2>/dev/null)], [
		RPMBUILD_VERSION=$(echo $tmp | $AWK '/RPM/ { print $[3] }')
		HAVE_RPMBUILD=yes
		AC_MSG_RESULT([$HAVE_RPMBUILD ($RPMBUILD_VERSION)])
	],[
		HAVE_RPMBUILD=no
		AC_MSG_RESULT([$HAVE_RPMBUILD])
	])

	AC_SUBST(HAVE_RPM)
	AC_SUBST(RPM)
	AC_SUBST(RPM_VERSION)

	AC_SUBST(HAVE_RPMBUILD)
	AC_SUBST(RPMBUILD)
	AC_SUBST(RPMBUILD_VERSION)
])

AC_DEFUN([LDISKFS_AC_CONFIG], [
	LDISKFS_AC_DIST
	LDISKFS_AC_KERNEL
	LDISKFS_AC_CONFIG_HEADERS
	LDISKFS_AC_LDISKFSDIR
	LDISKFS_AC_QUILT
	LDISKFS_AC_PATH_PROGS
	LDISKFS_AC_DEFINE_OPTIONS
	LDISKFS_AC_ENABLE_EXT4
	LDISKFS_AC_DIST_LDISKFS_SERIES
	LDISKFS_AC_CHECK_SYMBOL_EXPORTS
	LDISKFS_AC_MOSTLYCLEANFILES
	LDISKFS_AC_RPM
])
