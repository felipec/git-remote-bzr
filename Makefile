prefix := $(HOME)

bindir := $(prefix)/bin
mandir := $(prefix)/share/man/man1

all: doc

doc: doc/git-remote-bzr.1

test:
	$(MAKE) -C test

doc/git-remote-bzr.1: doc/git-remote-bzr.txt
	a2x -d manpage -f manpage $<

clean:
	$(RM) doc/git-remote-bzr.1

D = $(DESTDIR)

install: install-doc
	install -D -m 755 git-remote-bzr $(D)$(bindir)/git-remote-bzr

install-doc: doc
	install -D -m 644 doc/git-remote-bzr.1 $(D)$(mandir)/git-remote-bzr.1

.PHONY: all test install install-doc clean
