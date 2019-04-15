# Copyright © 2013-2019 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

version = $(shell IFS='()' read _ v _ < changelog && echo $$v)

rst2xml = $(notdir $(shell command -v rst2xml || echo rst2xml.py)) \
	--input-encoding=UTF-8 \
	--strict

.PHONY: all
all: elvoke.1

elvoke.1: manpage.pod
	perl -pe 's/L<([a-z_-]+)[(]([0-9]+)[)]>/B<\1>(\2)/' $(<) \
	| pod2man -c '' -n ELVOKE -r 'elvoke $(version)' > $(@).tmp
	mv $(@).tmp $(@)

.PHONY: check
check: check-changelog check-pod check-rst

.PHONY: check-changelog
check-changelog: changelog
	dpkg-parsechangelog -l$(<) --all 2>&1 >/dev/null | { ! grep .; }

.PHONY: check-pod
check-pod: manpage.pod
	podchecker -warnings -warnings $(<)

.PHONY: check-rst
check-rst: README
	$(rst2xml) $(<) /dev/null

.PHONY: clean
clean:
	rm -f *.1 *.tmp

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
