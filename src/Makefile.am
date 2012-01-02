bin_PROGRAMS = arbore

arbore_SOURCES = \
	arbore.vala \
	network/network.vala \
	network/packet-type-list.vala \
	util/ab-thread.vala

INCLUDES = \
	-include config.h \
	$(ARBORE_CFLAGS) \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DPKGDATADIR=\""$(pkgdatadir)"\" \
	-DPKGLIBDIR=\""$(pkglibdir)"\"

VALAFLAGS = \
	--vapidir=$(srcdir)/../vapi --pkg config \
	@ARBORE_PACKAGES@

arbore_LDADD = \
	$(ARBORE_LIBS)


uidir = $(datadir)/arbore/ui
ui_DATA = arbore.ui

EXTRA_DIST = $(ui_DATA)

# Remove ui directory on uninstall
uninstall-local:
	-rm -r $(uidir)
	-rm -r $(datadir)/arbore
