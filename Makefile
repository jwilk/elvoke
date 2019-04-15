# Copyright © 2017-2018 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

PREFIX = /usr/local
DESTDIR =

bindir = $(PREFIX)/bin
mandir = $(PREFIX)/share/man

.PHONY: all
all: ;

.PHONY: install
install:
	install -d $(DESTDIR)$(bindir)
	install elvoke $(DESTDIR)$(bindir)/elvoke
ifeq "$(wildcard doc/elvoke.1)" ""
	# run "$(MAKE) -C doc" to build the manpage
else
	install -d $(DESTDIR)$(mandir)/man1
	install doc/elvoke.1 $(DESTDIR)$(mandir)/man1/elvoke.1
endif

.PHONY: test
test:
	prove -v

.PHONY: test-installed
test-installed: $(or $(shell command -v elvoke;),$(bindir)/elvoke)
	ELVOKE_TEST_TARGET=elvoke prove -v

.PHONY: clean
clean: ;

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
