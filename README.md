# My Gentoo ebuild repository

Contains some random stuff I find useful.


## Installation:

Ensure you have git installed:

    # emerge -av dev-vcs/git

And put:
```
[dexlay]
priority = 100
location = /mnt/gentoo/overlays/dexlay
sync-type = git
clone-depth = 0
sync-uri = https://github.com/dex6/dexlay.git
auto-sync = yes
```

to `/etc/portage/repos.conf/dexlay.conf`. Adjust `location` parameter to your needs.
