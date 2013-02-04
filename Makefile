.PHONY: all
all: doc/elvoke.1

doc/elvoke.1: elvoke
	sed -e 's/L<\([a-z_-]\+\)(\([0-9]\+\))>/B<\1>(\2)/' $(<) \
	| pod2man -c 'elvoke manual' -n elvoke > $(@).tmp
	mv $(@).tmp $(@)

.PHONY: clean
clean:
	rm -f doc/*.1 doc/*.tmp

# vim:ts=4 sw=4 noet
