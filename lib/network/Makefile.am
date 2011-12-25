
AM_CPPFLAGS = $(glib-2.0_CFLAGS) \
	$(ARBORE_CFLAGS) 
## Process this file with automake to produce Makefile.in


lib_LTLIBRARIES =  \
	libabnetwork.la

libabnetwork_la_SOURCES =  \
	packet-type-list.vala \
	network.vala

libabnetwork_la_VALAFLAGS = --vapi \
	libabnetwork.vapi \
	--library=network \
	--header=libabnetwork.h 

libabnetwork_la_LIBADD = $(glib-2.0_LIBS) \
	$(ARBORE_LIBS) 
