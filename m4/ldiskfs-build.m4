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
