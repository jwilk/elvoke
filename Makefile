.PHONY: all
all: doc/elvoke.1

doc/elvoke.1: elvoke
	pod2man -c 'elvoke manual' $(<) > $(@).tmp
	mv $(@).tmp $(@)

.PHONY: clean
clean:
	rm -f doc/*.1 doc/*.tmp

# vim:ts=4 sw=4 noet
