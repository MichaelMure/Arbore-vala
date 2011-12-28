## Process this file with automake to produce Makefile.in


lib_LTLIBRARIES =  \
	libabutil.la

libabutil_la_SOURCES =  \
	ab-thread.vala \
	test.vala

libabutil_la_VALAFLAGS = --vapi ../libabutil.vapi \
	--library=util \
	--header=../libabutil.h

libabutil_la_LIBADD = $(ARBORE_LIBS) 

AM_CPPFLAGS = $(ARBORE_CFLAGS) 

CLEANFILES = *.c *.stamp
