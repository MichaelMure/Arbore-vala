## Process this file with automake to produce Makefile.in


lib_LTLIBRARIES =  \
	libabutil.la

libabutil_la_SOURCES =  \
	ab-thread.vala

libabutil_la_VALAFLAGS = --vapi \
	libabutil.vapi 

libabutil_la_LIBADD = $(ARBORE_LIBS) 

AM_CPPFLAGS = $(ARBORE_CFLAGS) 
