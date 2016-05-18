'git-remote-bzr' is the semi-official Bazaar bridge from the Git project, once
installed, it allows you to clone, fetch and push to and from Bazaar
repositories as if they were Git ones:

--------------------------------------
git clone "bzr::lp:ubuntu/hello"
--------------------------------------

To enable this, simply add the 'git-remote-bzr' script anywhere in your
`$PATH`:

--------------------------------------
wget https://raw.github.com/felipec/git-remote-bzr/master/git-remote-bzr -O ~/bin/git-remote-bzr
chmod +x ~/bin/git-remote-bzr
--------------------------------------

That's it :)

Obviously you will need Bazaar installed.

== Notes ==

Remember to run `git gc --aggressive` after cloning a repository, specially if
it's a big one. Otherwise lots of space will be wasted.

The oldest version of Bazaar supported is 2.0. Older versions are not tested.

=== Branches vs. repositories ===

Bazaar's UI can clone only branches, but a repository can contain multiple
branches, and 'git-remote-bzr' can clone both.

For example, to clone a branch:

-------------------------------------
git clone bzr::bzr://bzr.savannah.gnu.org/emacs/trunk emacs-trunk
-------------------------------------

And to clone the whole repository:

-------------------------------------
git clone bzr::bzr://bzr.savannah.gnu.org/emacs emacs
-------------------------------------

The second command would clone all the branches contained in the emacs
repository, however, it's possible to specify only certain branches:

-------------------------------------
git config remote-bzr.branches 'trunk, xwindow'
-------------------------------------

Some remotes don't support listing the branches contained in the repository, in
which cases you need to manually specify the branches, and while you can
specify the configuration in the clone command, you might find this easier:

-------------------------------------
git init emacs
git remote add origin bzr::bzr://bzr.savannah.gnu.org/emacs
git config remote-bzr.branches 'trunk, xwindow'
git fetch
-------------------------------------

=== Caveats ===

Limitations of the remote-helpers' framework apply. In particular, these
commands don't work:

* `git push origin :branch-to-delete`
* `git push origin old:new` (it will push 'old') (patches available)
* `git push --dry-run origin branch` (it will push) (patches available)

== Other projects ==

There are other 'git-remote-bzr' projects out there, do not confuse this one,
this is the one distributed officially by the Git project:

* https://launchpad.net/bzr-git[bzr-git's git-remote-bzr]
* https://github.com/lelutin/git-remote-bzr[lelutin 's git-remote-bzr]

For a comparison between these and other projects go
https://github.com/felipec/git/wiki/Comparison-of-git-remote-bzr-alternatives[here].

== Contributing ==

Send your patches to the mailing list git-fc@googlegroups.com (no need to
subscribe).
