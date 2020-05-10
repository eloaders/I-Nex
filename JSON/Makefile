#!/usr/bin/make -f

include ../i-nex.mk

make: make-binary

make-binary: compile-i-nex-edid

compile-i-nex-edid:
	@echo -e '$(OK_COLOR)Compile i-nex-edid $(OK_STRING)$(NO_COLOR)'
	$(CC) -o i-nex-edid i-nex-edid.c $(CFLAGS) $(additional_confflags)

install: install-set-executables install-bin
install-set-executables: set-executable-i-nex-edid

set-executable-i-nex-edid:
	chmod 0755 i-nex-edid

install-bin: install-bin-i-nex-edid

install-bin-i-nex-edid:
	install -D --mode=0755 --target-directory=$(DESTDIR)$(bindir) i-nex-edid

clean:
	@echo -e '$(ACTION_COLOR)Clean JSON$(NO_COLOR)'
	$(RM_COM) $(RMFILE_OPT) i-nex-edid
