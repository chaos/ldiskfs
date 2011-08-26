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
	if test -f "$META"; then
		_ldiskfs_ac_meta_got_file=yes

		LDISKFS_META_NAME=_LDISKFS_AC_META_GETVAL([(?:NAME|PROJECT|PACKAGE)]);
		if test -n "$LDISKFS_META_NAME"; then
			AC_DEFINE_UNQUOTED([LDISKFS_META_NAME], ["$LDISKFS_META_NAME"],
				[Define the project name.]
			)
			AC_SUBST([LDISKFS_META_NAME])
		fi

		LDISKFS_META_VERSION=_LDISKFS_AC_META_GETVAL([VERSION]);
		if test -n "$LDISKFS_META_VERSION"; then
			AC_DEFINE_UNQUOTED([LDISKFS_META_VERSION], ["$LDISKFS_META_VERSION"],
				[Define the project version.]
			)
			AC_SUBST([LDISKFS_META_VERSION])
		fi

		LDISKFS_META_RELEASE=_LDISKFS_AC_META_GETVAL([RELEASE]);
		if test -n "$LDISKFS_META_RELEASE"; then
			AC_DEFINE_UNQUOTED([LDISKFS_META_RELEASE], ["$LDISKFS_META_RELEASE"],
				[Define the project release.]
			)
			AC_SUBST([LDISKFS_META_RELEASE])
		fi

		LDISKFS_META_LICENSE=_LDISKFS_AC_META_GETVAL([LICENSE]);
		if test -n "$LDISKFS_META_LICENSE"; then
			AC_DEFINE_UNQUOTED([LDISKFS_META_LICENSE], ["$LDISKFS_META_LICENSE"],
				[Define the project license.]
			)
			AC_SUBST([LDISKFS_META_LICENSE])
		fi

		if test -n "$LDISKFS_META_NAME" -a -n "$LDISKFS_META_VERSION"; then
				LDISKFS_META_ALIAS="$LDISKFS_META_NAME-$LDISKFS_META_VERSION"
				test -n "$LDISKFS_META_RELEASE" &&
				        LDISKFS_META_ALIAS="$LDISKFS_META_ALIAS-$LDISKFS_META_RELEASE"
				AC_DEFINE_UNQUOTED([LDISKFS_META_ALIAS],
					["$LDISKFS_META_ALIAS"],
					[Define the project alias string.]
				)
				AC_SUBST([LDISKFS_META_ALIAS])
		fi

		LDISKFS_META_DATA=_LDISKFS_AC_META_GETVAL([DATE]);
		if test -n "$LDISKFS_META_DATA"; then
			AC_DEFINE_UNQUOTED([LDISKFS_META_DATA], ["$LDISKFS_META_DATA"],
				[Define the project release date.]
			)
			AC_SUBST([LDISKFS_META_DATA])
		fi

		LDISKFS_META_AUTHOR=_LDISKFS_AC_META_GETVAL([AUTHOR]);
		if test -n "$LDISKFS_META_AUTHOR"; then
			AC_DEFINE_UNQUOTED([LDISKFS_META_AUTHOR], ["$LDISKFS_META_AUTHOR"],
				[Define the project author.]
			)
			AC_SUBST([LDISKFS_META_AUTHOR])
		fi

		m4_pattern_allow([^LT_(CURRENT|REVISION|AGE)$])
		LDISKFS_META_LT_CURRENT=_LDISKFS_AC_META_GETVAL([LT_CURRENT]);
		LDISKFS_META_LT_REVISION=_LDISKFS_AC_META_GETVAL([LT_REVISION]);
		LDISKFS_META_LT_AGE=_LDISKFS_AC_META_GETVAL([LT_AGE]);
		if test -n "$LDISKFS_META_LT_CURRENT" \
				 -o -n "$LDISKFS_META_LT_REVISION" \
				 -o -n "$LDISKFS_META_LT_AGE"; then
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
		fi
	fi

	AC_MSG_RESULT([$_ldiskfs_ac_meta_got_file])
	]
)

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
