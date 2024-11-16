MAINTAINER = carsme

PACKAGES = $(shell aur-lspkg --repo aur --maintainer $(MAINTAINER) --pkgbase)

.PHONY: sync
sync:
	@aur-sync-super-repo $(PACKAGES)

.PHONY: check-versions
check-versions:
	@echo $(PACKAGES) \
		| xargs -n1 \
		| grep -vxf .nvcheckerignore \
		| xargs pkgctl version check

.PHONY: check-watchlist
check-watchlist:
	keyfile="$${XDG_CONFIG_HOME:-$HOME/.config}/nvchecker/keyfile.toml" \
		nvchecker -k "$$keyfile" -c watchlist.nvchecker.toml
	nvcmp --exit-status -c watchlist.nvchecker.toml
