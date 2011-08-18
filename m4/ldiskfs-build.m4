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
