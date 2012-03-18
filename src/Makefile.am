bin_PROGRAMS = arbore

arbore_SOURCES = \
	arbore.vala \
	network/ab-addr.vala \
	network/ab-network.vala \
	network/ab-packet-arg.vala \
	network/ab-packet-type-list.vala \
	network/ab-packet-type.vala \
	network/ab-packet-handler.vala \
	network/ab-packet.vala \
	network/ab-host.vala \
	util/ab-key.vala \
	util/ab-log.vala \
	util/ab-serializable.vala \
	util/ab-thread.vala \
	util/ab-time.vala

AM_CPPFLAGS = \
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
