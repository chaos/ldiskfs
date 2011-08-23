AC_DEFUN([LDISKFS_AC_DIST], [
	AC_MSG_CHECKING([whether to only configure enough for make dist])

	AC_ARG_ENABLE([dist],
		[AC_HELP_STRING([--enable-dist],
			[only configure enough for make dist])],
		[enable_dist='yes'],
		[enable_dist='no']
	)

	AS_IF([test x$enable_dist != xno], [enable_modules='no'])

	AC_MSG_RESULT([$enable_dist])
])

AC_DEFUN([LDISKFS_TARGET_SUPPORTED], [
	AS_CASE([$target_os], [linux* | darwin*], [$1], [$2])
])

AC_DEFUN([LDISKFS_AC_MODULES], [
	AC_MSG_CHECKING([whether to build kernel modules])

	AC_ARG_ENABLE([modules],
		[AC_HELP_STRING([--disable-modules],
			[disable building of kernel modules])],
		[],
		[LDISKFS_TARGET_SUPPORTED([enable_modules='yes'],
			[enable_modules='no'])]
	)

	AC_MSG_RESULT([$enable_modules])
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

AC_DEFUN([LDISKFS_AC_INCLUDE_RULES], [
	INCLUDE_RULES="include $PWD/Rules"
	AC_SUBST(INCLUDE_RULES)
])

AC_DEFUN([LDISKFS_AC_PATH_PROGS], [
	AC_PATH_PROG([PATCH], [patch], [no])
	AC_PATH_PROG([QUILT], [quilt], [no])

	AS_IF([test x$enable_ldiskfs$PATCH$QUILT = xyesnono], [
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
		AC_MSG_ERROR([*** Cannot find UTS_RELEASE definition.])
	])

	AC_MSG_RESULT([${kernsrcver}])

	LINUX_VERSION=${kernsrcver}
	AC_SUBST(LINUX_VERSION)
])

AC_DEFUN([LDISKFS_AC_KERNEL], [
	LDISKFS_AC_LINUX
	LDISKFS_AC_LINUX_OBJ
	LDISKFS_AC_LINUX_VERSION
])
