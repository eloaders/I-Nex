#!/usr/bin/make -f

include i-nex.mk

make: build-inex build-json

install: install-pixmaps install-desktop-files install-manpages \
	install-changelogs install-json install-inex install-udev-rule link-inex

clean: clean-json clean-inex clean-all

distclean: clean

sysclean: uninstall rmgambas

build-inex:
	@echo -e '\033[1;32mBuild I-Nex...\033[0m'
	$(MAKE) -C I-Nex

build-json:
	@echo -e '\033[1;32mBuild JSON...\033[0m'
	$(MAKE) -C JSON

install-desktop-files:
	@echo -e '\033[1;32mCreate needed dirs...\033[0m'
	install -D --mode=0644 \
		--target-directory=$(DESTDIR)$(PREFIX)/share/applications \
		debian/pl.linux.I_Nex.desktop
	install -D --mode=0644 \
		--target-directory=$(DESTDIR)$(PREFIX)/share/metainfo \
		pl.linux.I_Nex.metainfo.xml

install-pixmaps:
	@echo -e '\033[1;32mInstall pixmaps...\033[0m'
	$(MAKE) -C pixmaps install

install-manpages:
	@echo -e '\033[1;32mInstall manpages...\033[0m'
	$(MAKE) --eval .NOTPARALLEL: -C manpages install

install-json: build-json
	@echo -e '\033[1;32mInstall JSON...\033[0m'
	$(MAKE) -C JSON install

install-inex: build-inex
	@echo -e '\033[1;32mInstall I-Nex...\033[0m'
	$(MAKE) -C I-Nex install

install-changelogs:
	@echo -e '\033[1;32mInstalling Changelogs...\033[0m'
	install -D --mode=0644 --target-directory=$(DESTDIR)$(PREFIX)$(DOCSDIR) \
		Changelog.md

clean-json:
	$(MAKE) -C JSON clean

clean-inex:
	if test -f "I-Nex/Makefile" ; then $(MAKE) -C I-Nex distclean ; fi

install-udev-rule:
	$(INSTALL_DM) 0644 i2c_smbus.rules $(DESTDIR)$(UDEV_RULES_DIR)/i2c_smbus.rules

clean-all:
	$(RM_COM) $(RMDIR_OPT) `find . -name ".gambas"`
	$(RM_COM) $(RMDIR_OPT) `find . -name "*.gambas"`
	$(RM_COM) $(RMDIR_OPT) `find . -name ".directory"`
	$(RM_COM) $(RMDIR_OPT) I-Nex/i-nex/.gambas
	$(RM_COM) $(RMDIR_OPT) I-Nex/autom4te.cache
	$(RM_COM) $(RMDIR_OPT) I-Nex/config.log
	$(RM_COM) $(RMDIR_OPT) I-Nex/config.status
	$(RM_COM) $(RMDIR_OPT) I-Nex/configure
	$(RM_COM) $(RMDIR_OPT) I-Nex/install-sh
	$(RM_COM) $(RMDIR_OPT) I-Nex/missing

link-inex: install-inex
	install -d $(DESTDIR)$(bindir)
	ln -s $(DESTDIR)$(bindir)/i-nex.gambas $(DESTDIR)$(bindir)/i-nex
