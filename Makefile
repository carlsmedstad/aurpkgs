.PHONY: sync
sync:
	aur-list-pkgs --pkgbase | xargs aur-sync-super-repo
