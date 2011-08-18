AC_DEFUN([LDISKFS_AC_DIST], [
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
