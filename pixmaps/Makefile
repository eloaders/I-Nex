#!/usr/bin/make -f

include ../i-nex.mk

install:
	install -d $(DESTDIR)$(PREFIX)/share/icons/hicolor/256x256/apps \
		$(DESTDIR)$(PREFIX)/share/icons/hicolor/128x128/apps \
		$(DESTDIR)$(PREFIX)/share/icons/hicolor/32x32/apps \
		$(DESTDIR)$(PREFIX)/share/icons/hicolor/16x16/apps
	install --mode=0644 i-nex.png \
		$(DESTDIR)$(PREFIX)/share/icons/hicolor/256x256/apps
	install --mode=0644 -T i-nex-128.png \
		$(DESTDIR)$(PREFIX)/share/icons/hicolor/128x128/apps/i-nex.png
	install --mode=0644 -T i-nex-32.png \
		$(DESTDIR)$(PREFIX)/share/icons/hicolor/32x32/apps/i-nex.png
	install --mode=0644 -T i-nex-16.png \
		$(DESTDIR)$(PREFIX)/share/icons/hicolor/16x16/apps/i-nex.png

uninstall:
	if test -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/256x256/apps/i-nex.png ; then \
		${RM} $(DESTDIR)$(PREFIX)/share/icons/hicolor/256x256/apps/i-nex.png ; fi
	if test -f ${DESTDIR}$(PREFIX)/share/icons/hicolor/128x128/apps/i-nex.png ; then \
		${RM} $(DESTDIR)$(PREFIX)/share/icons/hicolor/128x128/apps/i-nex.png ; fi
	if test -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/32x32/apps/i-nex.png ; then \
		${RM} $(DESTDIR)$(PREFIX)/share/icons/hicolor/32x32/apps/i-nex.png ; fi
	if test -f ${DESTDIR}$(PREFIX)/share/icons/hicolor/16x16/apps/i-nex.png ; then \
		${RM} $(DESTDIR)$(PREFIX)/share/icons/hicolor/16x16/apps/i-nex.png ; fi
