.PHONY: sync
sync:
	aur-lspkg --repo aur --pkgbase | xargs aur-sync-super-repo

.PHONY: check-versions
check-versions:
	aur-lspkg --repo aur --pkgbase \
		| grep -vxf .nvcheckerignore \
		| xargs pkgctl version check

.PHONY: check-watchlist
check-watchlist:
	./check-watchlist
