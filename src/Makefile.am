SUBDIRS = \
	util \
	network

bin_PROGRAMS = arbore

arbore_SOURCES = \
	arbore.vala

arbore_CFLAGS = \
	-include config.h \
	-I$(top_srcdir)/vapi \
	$(ARBORE_CFLAGS) \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DPKGDATADIR=\""$(pkgdatadir)"\" \
	-DPKGLIBDIR=\""$(pkglibdir)"\"

arbore_VALAFLAGS = \
	--vapidir=$(top_srcdir)/vapi \
	--pkg config \
	--pkg libarboreutil-@LIBARBORE_API_VERSION@ \
	--pkg libarborenetwork-@LIBARBORE_API_VERSION@ \
	@ARBORE_PACKAGES@

arbore_LDADD = \
	$(ARBORE_LIBS) \
	$(top_builddir)/src/util/libarboreutil@LIBARBORE_API_VERSION@.la \
	$(top_builddir)/src/network/libarborenetwork@LIBARBORE_API_VERSION@.la

uidir = $(datadir)/arbore/ui
ui_DATA = arbore.ui

EXTRA_DIST = $(ui_DATA)

# Remove ui directory on uninstall
uninstall-local:
	-rm -r $(uidir)
	-rm -r $(datadir)/arbore

CLEANFILES = *.h *.c *.stamp
