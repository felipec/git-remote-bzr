prefix := $(HOME)

all:

doc: doc/git-remote-bzr.1

test:
	$(MAKE) -C test

doc/git-remote-bzr.1: doc/git-remote-bzr.txt
	a2x -d manpage -f manpage $<

D = $(DESTDIR)

install:
	install -D -m 755 git-remote-bzr \
		$(D)$(prefix)/bin/git-remote-bzr

install-doc: doc
	install -D -m 644 doc/git-remote-bzr.1 \
		$(D)$(prefix)/share/man/man1/git-remote-bzr.1

.PHONY: all test
