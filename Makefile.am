SUBDIRS          = ldiskfs
AUTOMAKE_OPTIONS = foreign
EXTRA_DIST       = autogen.sh kernel_patches META
EXTRA_DIST      += ldiskfs.spec.in config/rpm.am
noinst_HEADERS   = config.h

install-data-local:
	destname=$(LDISKFS_META_NAME)-$(LDISKFS_META_VERSION)/$(LINUX_VERSION); \
	instdest=$(DESTDIR)/usr/src/$$destname; \
	touch $$instdest/ldiskfs.release; \
	echo "$(LDISKFS_META_VERSION)" >$$instdest/ldiskfs.release; \
	for instfile in $(noinst_HEADERS) ldiskfs/$(LINUX_SYMBOLS); do \
		$(INSTALL) -D $$instfile $$instdest/$$instfile; \
	done

include $(top_srcdir)/config/rpm.am
