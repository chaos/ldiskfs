#!/bin/sh

aclocal -I m4
autoheader

# Only need no-portability if version > 1.10
automake -a -c -W no-portability

autoconf
