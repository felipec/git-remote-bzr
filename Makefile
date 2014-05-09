prefix := $(HOME)

all:

test:
	$(MAKE) -C test

D = $(DESTDIR)

install:
	install -D -m 755 git-remote-bzr \
		$(D)$(prefix)/bin/git-remote-bzr

.PHONY: all test
