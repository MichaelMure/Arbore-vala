lib_LTLIBRARIES = libarboreutil@LIBARBORE_API_VERSION@.la

libarboreutil@LIBARBORE_API_VERSION@_la_SOURCES = \
	ab-key.vala \
	ab-log.vala \
	ab-serializable.vala \
	ab-thread.vala \
	ab-time.vala

libarboreutil@LIBARBORE_API_VERSION@_la_VALAFLAGS = \
  --library libarboreutil-@LIBARBORE_API_VERSION@ \
  --vapi=$(top_srcdir)/vapi/libarboreutil-@LIBARBORE_API_VERSION@.vapi \
  -H $(top_srcdir)/vapi/libarboreutil-@LIBARBORE_API_VERSION@.h \
  --internal-header $(top_srcdir)/vapi/libarboreutil-@LIBARBORE_API_VERSION@-internal.h \
  @ARBORE_PACKAGES@

libarboreutil@LIBARBORE_API_VERSION@_la_LDFLAGS = \
  $(ARBORE_LIBS)

libarboreutil@LIBARBORE_API_VERSION@_la_CFLAGS = \
	-include config.h \
	$(ARBORE_CFLAGS) \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DPKGDATADIR=\""$(pkgdatadir)"\" \
	-DPKGLIBDIR=\""$(pkglibdir)"\"

CLEANFILES = *.h *.c *.stamp
