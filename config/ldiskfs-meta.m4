dnl #
dnl # LDISKFS_AC_META
dnl # Read metadata from the META file.
dnl #
dnl # AUTHOR:
dnl # Chris Dunlap <cdunlap@llnl.gov>
dnl #
dnl # Modified by:
dnl # Prakash Surya <surya1@llnl.gov>
dnl #
AC_DEFUN([LDISKFS_AC_META], [

	AH_BOTTOM([
#undef PACKAGE
#undef PACKAGE_BUGREPORT
#undef PACKAGE_NAME
#undef PACKAGE_STRING
#undef PACKAGE_TARNAME
#undef PACKAGE_VERSION
#undef STDC_HEADERS
#undef VERSION])

	AC_MSG_CHECKING([metadata])

	META="$srcdir/META"
	_ldiskfs_ac_meta_got_file=no
	AS_IF([test -f "$META"], [
		_ldiskfs_ac_meta_got_file=yes

		LDISKFS_META_NAME=_LDISKFS_AC_META_GETVAL([(?:NAME|PROJECT|PACKAGE)]);
		AS_IF([test -n "$LDISKFS_META_NAME"], [
			AC_DEFINE_UNQUOTED([LDISKFS_META_NAME], ["$LDISKFS_META_NAME"],
				[Define the project name.]
			)
			AC_SUBST([LDISKFS_META_NAME])
		])

		LDISKFS_META_VERSION=_LDISKFS_AC_META_GETVAL([VERSION]);
		AS_IF([test -n "$LDISKFS_META_VERSION"], [
			AC_DEFINE_UNQUOTED([LDISKFS_META_VERSION], ["$LDISKFS_META_VERSION"],
				[Define the project version.]
			)
			AC_SUBST([LDISKFS_META_VERSION])
		])

		LDISKFS_META_RELEASE=_LDISKFS_AC_META_GETVAL([RELEASE]);
		AS_IF([test -n "$LDISKFS_META_RELEASE"], [
			AC_DEFINE_UNQUOTED([LDISKFS_META_RELEASE], ["$LDISKFS_META_RELEASE"],
				[Define the project release.]
			)
			AC_SUBST([LDISKFS_META_RELEASE])
		])

		LDISKFS_META_LICENSE=_LDISKFS_AC_META_GETVAL([LICENSE]);
		AS_IF([test -n "$LDISKFS_META_LICENSE"], [
			AC_DEFINE_UNQUOTED([LDISKFS_META_LICENSE], ["$LDISKFS_META_LICENSE"],
				[Define the project license.]
			)
			AC_SUBST([LDISKFS_META_LICENSE])
		])

		AS_IF([test -n "$LDISKFS_META_NAME" -a -n "$LDISKFS_META_VERSION"], [
				LDISKFS_META_ALIAS="$LDISKFS_META_NAME-$LDISKFS_META_VERSION"
				test -n "$LDISKFS_META_RELEASE" &&
				        LDISKFS_META_ALIAS="$LDISKFS_META_ALIAS-$LDISKFS_META_RELEASE"
				AC_DEFINE_UNQUOTED([LDISKFS_META_ALIAS],
					["$LDISKFS_META_ALIAS"],
					[Define the project alias string.]
				)
				AC_SUBST([LDISKFS_META_ALIAS])
		])

		LDISKFS_META_DATA=_LDISKFS_AC_META_GETVAL([DATE]);
		AS_IF([test -n "$LDISKFS_META_DATA"], [
			AC_DEFINE_UNQUOTED([LDISKFS_META_DATA], ["$LDISKFS_META_DATA"],
				[Define the project release date.]
			)
			AC_SUBST([LDISKFS_META_DATA])
		])

		LDISKFS_META_AUTHOR=_LDISKFS_AC_META_GETVAL([AUTHOR]);
		AS_IF([test -n "$LDISKFS_META_AUTHOR"], [
			AC_DEFINE_UNQUOTED([LDISKFS_META_AUTHOR], ["$LDISKFS_META_AUTHOR"],
				[Define the project author.]
			)
			AC_SUBST([LDISKFS_META_AUTHOR])
		])

		m4_pattern_allow([^LT_(CURRENT|REVISION|AGE)$])
		LDISKFS_META_LT_CURRENT=_LDISKFS_AC_META_GETVAL([LT_CURRENT]);
		LDISKFS_META_LT_REVISION=_LDISKFS_AC_META_GETVAL([LT_REVISION]);
		LDISKFS_META_LT_AGE=_LDISKFS_AC_META_GETVAL([LT_AGE]);
		AS_IF([test -n "$LDISKFS_META_LT_CURRENT" \
				 -o -n "$LDISKFS_META_LT_REVISION" \
				 -o -n "$LDISKFS_META_LT_AGE"], [
			test -n "$LDISKFS_META_LT_CURRENT" || LDISKFS_META_LT_CURRENT="0"
			test -n "$LDISKFS_META_LT_REVISION" || LDISKFS_META_LT_REVISION="0"
			test -n "$LDISKFS_META_LT_AGE" || LDISKFS_META_LT_AGE="0"
			AC_DEFINE_UNQUOTED([LDISKFS_META_LT_CURRENT],
				["$LDISKFS_META_LT_CURRENT"],
				[Define the libtool library 'current'
				 version information.]
			)
			AC_DEFINE_UNQUOTED([LDISKFS_META_LT_REVISION],
				["$LDISKFS_META_LT_REVISION"],
				[Define the libtool library 'revision'
				 version information.]
			)
			AC_DEFINE_UNQUOTED([LDISKFS_META_LT_AGE], ["$LDISKFS_META_LT_AGE"],
				[Define the libtool library 'age'
				 version information.]
			)
			AC_SUBST([LDISKFS_META_LT_CURRENT])
			AC_SUBST([LDISKFS_META_LT_REVISION])
			AC_SUBST([LDISKFS_META_LT_AGE])
		])
	])

	AC_MSG_RESULT([$_ldiskfs_ac_meta_got_file])

	AS_IF([test x$_ldiskfs_ac_meta_got_file = xyes], [
		AC_MSG_CHECKING([name])
		AC_MSG_RESULT([$LDISKFS_META_NAME])

		AC_MSG_CHECKING([license(s)])
		AC_MSG_RESULT([$LDISKFS_META_LICENSE])

		AC_MSG_CHECKING([author(s)])
		AC_MSG_RESULT([$LDISKFS_META_AUTHOR])
	])
])

AC_DEFUN([_LDISKFS_AC_META_GETVAL],
	[`perl -n\
		-e "BEGIN { \\$key=shift @ARGV; }"\
		-e "next unless s/^\s*\\$key@<:@:=@:>@//i;"\
		-e "s/^((?:@<:@^'\"#@:>@*(?:(@<:@'\"@:>@)@<:@^\2@:>@*\2)*)*)#.*/\\@S|@1/;"\
		-e "s/^\s+//;"\
		-e "s/\s+$//;"\
		-e "s/^(@<:@'\"@:>@)(.*)\1/\\@S|@2/;"\
		-e "\\$val=\\$_;"\
		-e "END { print \\$val if defined \\$val; }"\
		'$1' $META`]dnl
)
