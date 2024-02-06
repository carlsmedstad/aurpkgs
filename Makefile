.PHONY: sync
sync:
	aur-list-pkgs --pkgbase | xargs aur-sync-super-repo

.PHONY: check-versions
check-versions:
	aur-list-pkgs --pkgbase \
		| grep -vxf .nvcheckerignore \
		| xargs pkgctl version check

.PHONY: check-watchlist
check-watchlist:
	./check-watchlist
