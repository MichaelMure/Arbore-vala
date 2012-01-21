# configure.ac

AC_INIT([Arbore],[0.1])
AC_CONFIG_SRCDIR([src/arbore.vala])
AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE([no-dist-gzip dist-bzip2])

# Enable silent rules is available
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

AM_MAINTAINER_MODE

AC_PROG_CC
AC_PROG_CC_STDC
AM_PROG_VALAC([0.14.0])
AC_PROG_INSTALL
IT_PROG_INTLTOOL([0.41.1])

pkg_modules="gtk+-3.0 >= 2.14.0"
ARBORE_PACKAGES="--pkg gtk+-3.0 --pkg gee-1.0 --pkg posix --thread"
PKG_CHECK_MODULES(ARBORE, [gtk+-3.0 >= 2.14.0, gee-1.0])
AC_SUBST(ARBORE_CFLAGS)
AC_SUBST(ARBORE_LIBS)
AC_SUBST(ARBORE_PACKAGES)

GETTEXT_PACKAGE=ARBORE
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE], ["$GETTEXT_PACKAGE"], [Gettext Package])
AC_SUBST(GETTEXT_PACKAGE)
AM_GNU_GETTEXT_VERSION([1.11])
AM_GLIB_GNU_GETTEXT

AC_CONFIG_FILES([
	Makefile
	data/arbore.desktop.in
	data/Makefile
	data/icons/Makefile
	data/icons/16x16/Makefile
	data/icons/22x22/Makefile
	data/icons/24x24/Makefile
	data/icons/32x32/Makefile
	data/icons/48x48/Makefile
	data/icons/scalable/Makefile
	data/images/Makefile
	po/Makefile.in
	src/Makefile
	vapi/Makefile
])
AC_OUTPUT
