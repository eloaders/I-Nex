#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-

include i-nex.mk

all: make

make: build-inex build-json

install: install-inex install-json install-changelogs install-desktop-files \
	install-manpages install-pixmaps install-udev-rule link-inex

clean: clean-inex clean-json

distclean: clean
	find . \( -name '.gambas' -o -name '*.gambas' -o -name '.directory' \) \
		-type d -execdir $(RM) $(RMDIR_OPT) '{}' \+
	cd I-Nex && $(RM) $(RMDIR_OPT) ./i-nex/.gambas ./autom4te.cache
	cd I-Nex && $(RM) config.log config.status configure install-sh missing

sysclean:
	@echo -e '$(OK_BGCOLOR)Uninstalling I-Nex...$(NO_COLOR)'
	$(MAKE) -C I-Nex uninstall

build-inex:
	@echo -e '$(OK_BGCOLOR)Building I-Nex...$(NO_COLOR)'
	$(MAKE) -C I-Nex

build-json:
	@echo -e '$(OK_BGCOLOR)Building EDID parser...$(NO_COLOR)'
	$(MAKE) -C JSON

install-inex: build-inex
	@echo -e '$(OK_BGCOLOR)Installing I-Nex...$(NO_COLOR)'
	$(MAKE) -C I-Nex install

install-json: build-json
	@echo -e '$(OK_BGCOLOR)Installing EDID parser...$(NO_COLOR)'
	$(MAKE) -C JSON install

install-changelogs:
	@echo -e '$(OK_BGCOLOR)Installing Changelogs...$(NO_COLOR)'
	$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)$(DOCSDIR) $(CURDIR)/Changelog.md

install-desktop-files:
	@echo -e '$(OK_BGCOLOR)Installing XDG desktop/metainfo files...$(NO_COLOR)'
	$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)/share/applications \
		pl.linux.i_nex.desktop
	$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)/share/metainfo \
		pl.linux.i_nex.metainfo.xml

install-manpages:
	@echo -e '$(OK_BGCOLOR)Installing manpages...$(NO_COLOR)'
	$(MAKE) -C manpages

install-pixmaps:
	@echo -e '$(OK_BGCOLOR)Installing pixmaps...$(NO_COLOR)'
	$(MAKE) -C pixmaps

install-udev-rule:
	@echo -e '$(OK_BGCOLOR)Installing udev rules...$(NO_COLOR)'
	$(INSTALL_DM)0644 $(CURDIR)/i2c_smbus.rules \
		$(DESTDIR)$(UDEV_RULES_DIR)/60-i2c_smbus.rules

link-inex: install-inex
	install -d $(DESTDIR)$(bindir)
	ln -s $(DESTDIR)$(bindir)/i-nex.gambas $(DESTDIR)$(bindir)/i-nex

clean-inex:
ifneq (,$(wildcard I-Nex/Makefile))
	$(MAKE) -C I-Nex distclean
endif

clean-json:
	$(MAKE) -C JSON clean

.PHONY: all make install clean distclean sysclean build-inex build-json \
	install-inex install-json install-changelogs install-desktop-files \
	install-manpages install-pixmaps install-udev-rule link-inex clean-inex \
	clean-json
