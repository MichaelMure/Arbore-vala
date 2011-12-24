## Process this file with automake to produce Makefile.in
## Created by Anjuta

SUBDIRS = src \
	lib 

arboredocdir = ${prefix}/doc/arbore
arboredoc_DATA = \
	README\
	COPYING\
	AUTHORS\
	ChangeLog\
	INSTALL\
	NEWS


EXTRA_DIST = $(arboredoc_DATA)


# Remove doc directory on uninstall
uninstall-local:
	-rm -r $(arboredocdir)
