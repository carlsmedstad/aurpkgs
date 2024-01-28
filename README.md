# aurpkgs

Package sources for all the [Arch User Repository (AUR)][AUR] packages I
[maintain][packages-maintained-by-me] or
[co-maintain][packages-co-maintained-by-me].

[AUR]: https://aur.archlinux.org/
[packages-maintained-by-me]: https://aur.archlinux.org/packages?O=0&SeB=m&K=carsme&submit=Go
[packages-co-maintained-by-me]: https://aur.archlinux.org/packages?O=0&SeB=c&K=carsme&submit=Go

## Packaging Methodology

I try my best to follow the packaging guidelines as documented by:

* <https://wiki.archlinux.org/title/Arch_package_guidelines>
* <https://wiki.archlinux.org/title/Arch_package_guidelines/Security>
* <https://wiki.archlinux.org/title/creating_packages>

Additionally, my goal is take advantage of tooling as much as possible. My main
work horse is a custom [aurutils][] command, `aur-commit` from
[carlsmedstad/aurutils-extra][], which performs a number of checks in addition
to building packages.

### Checking for New Versions

All packages, except those in [`.nvcheckerignore`](.nvcheckerignore), contain a
`.nvchecker.toml` file and new version can as such be discovered using
[nvchecker][]. To check for new versions, run:

```sh
make check-versions
```

**NOTE:** This functionality relies on an as-of-yet unreleased version of
`pkgctl` from [devtools][]

[aurutils]: https://github.com/aurutils/aurutils
[nvchecker]: https://github.com/lilydjwg/nvchecker
[devtools]: https://gitlab.archlinux.org/archlinux/devtools

## Structure of this Repository

While there are great tools for maintaining super repositories for AUR
packages, for example [aurpublish][], none of them caught my liking. As such I
wrote my own, `aur-sync-super-repo` from [carlsmedstad/aurutils-extra][] with
the following characteristics:

* Intentionally exclude the ability push changes to packages from within the
  super repository. I prefer to work in the standalone package repositories and
  use this repository mostly for sharing my PKGBUILDs.

* Simple and linear commit history. I don't have the need to be able to track
  all the changes to individual packages in this repository and prefer to keep
  the commit history clean.

Updates to this repository are currently done manually (semi-regularly) by
executing the following:

```sh
make sync
```

[aurpublish]: https://github.com/eli-schwartz/aurpublish
[carlsmedstad/aurutils-extra]: https://github.com/carlsmedstad/aurutils-extra

## Copyright

All package additions and edits authored by me are licensed under the
[Zero-Clause BSD license](https://spdx.org/licenses/0BSD.html). To check if a
change is authored by me, refer to the corresponding AUR repository.
