#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-

include ../i-nex.mk

MANPAGE_FILES = $(wildcard *.1)

all: install

install: | install-man compress-man

install-man:
	@echo -e '$(OK_BGCOLOR)Installing manpages...$(NO_COLOR)'
	$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)$(MANDIR) $(MANPAGE_FILES)

compress-man: install-man
	@echo -e '$(OK_BGCOLOR)Compressing manpages...$(NO_COLOR)'
	$(COMPRESS) $(addprefix $(DESTDIR)$(PREFIX)$(MANDIR)/,$(MANPAGE_FILES))

.PHONY: all install install-man compress-man
