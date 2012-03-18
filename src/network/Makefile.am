lib_LTLIBRARIES = libarborenetwork@LIBARBORE_API_VERSION@.la

libarborenetwork@LIBARBORE_API_VERSION@_la_SOURCES = \
	ab-addr.vala \
	ab-network.vala \
	ab-packet-arg.vala \
	ab-packet-type-list.vala \
	ab-packet-type.vala \
	ab-packet-handler.vala \
	ab-packet.vala \
	ab-host.vala

libarborenetwork@LIBARBORE_API_VERSION@_la_VALAFLAGS = \
  --library libarborenetwork-@LIBARBORE_API_VERSION@ \
  --vapi=$(top_srcdir)/vapi/libarborenetwork-@LIBARBORE_API_VERSION@.vapi \
  -H $(top_srcdir)/vapi/libarborenetwork-@LIBARBORE_API_VERSION@.h \
  --internal-header $(top_srcdir)/vapi/libarborenetwork-@LIBARBORE_API_VERSION@-internal.h \
  @ARBORE_PACKAGES@ \
  $(top_srcdir)/vapi/libarboreutil-@LIBARBORE_API_VERSION@.vapi

libarborenetwork@LIBARBORE_API_VERSION@_la_LDFLAGS = \
  $(ARBORE_LIBS)

libarborenetwork@LIBARBORE_API_VERSION@_la_CFLAGS = \
	-include config.h \
	-I$(top_srcdir)/vapi/ \
	$(ARBORE_CFLAGS) \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DPKGDATADIR=\""$(pkgdatadir)"\" \
	-DPKGLIBDIR=\""$(pkglibdir)"\"

libarborenetwork@LIBARBORE_API_VERSION@_la_LIBADD = \
  $(top_builddir)/src/util/libarboreutil@LIBARBORE_API_VERSION@.la

CLEANFILES = *.h *.c *.stamp

