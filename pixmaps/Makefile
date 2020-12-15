#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-

include ../i-nex.mk

IMG_SIZES ::= 16 22 32 48 64 128 256

all: install

install:
	cp $(CURDIR)/i-nex.png $(CURDIR)/i-nex-256.png
	for px in $(IMG_SIZES) ; do \
		$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)/share/icons/hicolor/$${px}x$${px}/apps \
			$(CURDIR)/i-nex-$${px}.png ; \
	done
	$(RM) $(CURDIR)/i-nex-256.png

uninstall:
	for px in $(IMG_SIZES) ; do \
		if test -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/$${px}x$${px}/apps/i-nex.png ; then \
			$(RM) $(DESTDIR)$(PREFIX)/share/icons/hicolor/$${px}x$${px}/apps/i-nex.png ; fi ; \
	done

.PHONY: all install uninstall
