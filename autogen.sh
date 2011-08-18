#!/bin/bash

#
# TODO: Old m4 macros are in the build/autoconf directory. Thus after
# cleanup is finished this should be removed.
#
aclocal -I m4 -I build/autoconf
autoheader

# Only need no-portability if version > 1.10
automake -a -c -W no-portability

autoconf
