version = $(shell head -n1 doc/changelog | cut -d ' ' -f2 | tr -d '()')

.PHONY: all
all: doc/elvoke.1

doc/elvoke.1: elvoke
	sed -e 's/L<\([a-z_-]\+\)(\([0-9]\+\))>/B<\1>(\2)/' $(<) \
	| pod2man -c '' -n ELVOKE -r 'elvoke $(version)' > $(@).tmp
	mv $(@).tmp $(@)

.PHONY: clean
clean:
	rm -f doc/*.1 doc/*.tmp

# vim:ts=4 sw=4 noet
