.PHONY: all
all: elvoke.1

elvoke.1:
	pod2man -c 'elvoke manual' elvoke > elvoke.1

# vim:ts=4 sw=4 noet
