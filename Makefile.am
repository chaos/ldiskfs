SUBDIRS          = ldiskfs
AUTOMAKE_OPTIONS = foreign
EXTRA_DIST       = autogen.sh kernel_patches META
EXTRA_DIST      += lustre-ldiskfs.spec.in am/rpm.am
noinst_HEADERS   = config.h

install-data-local:
	destname=$(LDISKFS_META_NAME)-$(LDISKFS_META_VERSION)/$(LINUX_VERSION); \
	instdest=$(DESTDIR)/usr/src/$$destname; \
	echo "$(LDISKFS_META_VERSION)" >$$instdest/ldiskfs.release; \
	for instfile in $(noinst_HEADERS) ldiskfs/$(LINUX_SYMBOLS); do \
		$(INSTALL) -D $$instfile $$instdest/$$instfile; \
	done

include $(top_srcdir)/am/rpm.am
