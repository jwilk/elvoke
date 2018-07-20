version = $(shell IFS='()' read _ v _ < changelog && echo $$v)

.PHONY: all
all: elvoke.1

elvoke.1: ../elvoke
	perl -pe 's/L<([a-z_-]+)[(]([0-9]+)[)]>/B<\1>(\2)/' $(<) \
	| pod2man -c '' -n ELVOKE -r 'elvoke $(version)' > $(@).tmp
	mv $(@).tmp $(@)

.PHONY: test check
test check: ../elvoke
	podchecker -warnings -warnings $(<)

.PHONY: clean
clean:
	rm -f *.1 *.tmp

# vim:ts=4 sts=4 sw=4 noet
