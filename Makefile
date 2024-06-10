MAINTAINER = carsme

.PHONY: sync
sync:
	aur-lspkg --repo aur --maintainer $(MAINTAINER) --pkgbase \
		| xargs aur-sync-super-repo

.PHONY: check-versions
check-versions:
	aur-lspkg --repo aur --maintainer $(MAINTAINER) --pkgbase \
		| grep -vxf .nvcheckerignore \
		| xargs pkgctl version check

.PHONY: check-watchlist
check-watchlist:
	keyfile="$${XDG_CONFIG_HOME:-$HOME/.config}/nvchecker/keyfile.toml" \
		nvchecker -k "$$keyfile" -c watchlist.nvchecker.toml
	nvcmp --exit-status -c watchlist.nvchecker.toml
