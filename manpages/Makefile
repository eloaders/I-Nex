#!/usr/bin/make -f

include ../i-nex.mk

MANPAGE_FILES = $(wildcard *.1)

install: install-man compress-man

install-man:
	@echo -e '\033[1;32mInstalling Man pages 1...\033[0m'
	install -D --mode=0644 --target-directory="$(DESTDIR)$(PREFIX)$(MANDIR)" \
		$(MANPAGE_FILES)

compress-man: install-man
	@echo -e '\033[1;32mCompress Man pages 1...\033[0m'
	gzip -9 $(addprefix $(DESTDIR)$(PREFIX)$(MANDIR)/,$(MANPAGE_FILES))
