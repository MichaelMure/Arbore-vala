SUBDIRS = \
	util \
	network

AM_CFLAGS = \
	-include config.h \
	-I$(top_srcdir)/vapi \
	$(ARBORE_CFLAGS) \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DPKGDATADIR=\""$(pkgdatadir)"\" \
	-DPKGLIBDIR=\""$(pkglibdir)"\"

VALAFLAGS = \
	--vapidir=$(top_srcdir)/vapi \
	--pkg config \
	--pkg libarboreutil-@LIBARBORE_API_VERSION@ \
	--pkg libarborenetwork-@LIBARBORE_API_VERSION@ \
	@ARBORE_PACKAGES@

LIBS =\
	$(ARBORE_LIBS) \
	$(top_builddir)/src/util/libarboreutil@LIBARBORE_API_VERSION@.la \
	$(top_builddir)/src/network/libarborenetwork@LIBARBORE_API_VERSION@.la

TESTS = \
	util-key-test \
	network-packet-test

util_key_test_SOURCES = util/ab-key-test.vala
network_packet_test_SOURCES = network/ab-packet-test.vala

check_PROGRAMS = $(TESTS)

CLEANFILES = *.c *.stamp
