## Process this file with automake to produce Makefile.in

## Created by Anjuta


uidir = $(datadir)/arbore/ui
ui_DATA = arbore.ui


AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(datadir)"\" \
	$(ARBORE_CFLAGS)

bin_PROGRAMS = arbore

arbore_SOURCES = \
	arbore.vala config.vapi

arbore_VALAFLAGS =  \
	--pkg gtk+-3.0

arbore_LDFLAGS = \
	-Wl,--export-dynamic

arbore_LDADD = $(ARBORE_LIBS)


EXTRA_DIST = $(ui_DATA)

# Remove ui directory on uninstall
uninstall-local:
	-rm -r $(uidir)
	-rm -r $(datadir)/arbore
