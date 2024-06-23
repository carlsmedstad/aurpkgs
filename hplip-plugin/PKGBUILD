# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: andmars <andreas.marschall @ unitybox.de>
# Contributor: PyroPeter <googlemail.com @ abi1789>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=hplip-plugin
pkgver=3.24.4
pkgrel=1
pkgdesc="Binary plugin for HPs hplip printer driver library"
arch=(x86_64 aarch64 armv6h armv7h i686)
url="https://developers.hp.com/hp-linux-imaging-and-printing/binary_plugin.html"
license=(LicenseRef-HPLIP-LICENSE)
depends=(
  # While hplip-plugin requires the version of hplip to match exactly,
  # specifying such a requirement breaks the ability to upgrade hplip.
  "hplip>=1:$pkgver"
  gcc-libs
  glibc
  libusb-compat
  sane
)
backup=(var/lib/hp/hplip.state)
source=(
  "https://developers.hp.com/sites/default/files/hplip-$pkgver-plugin.run"
  "https://developers.hp.com/sites/default/files/hplip-$pkgver-plugin.run.asc"
)
sha256sums=(
  '1f3c6bdd25661a8a2e18153655d6f06f028c1d9c308d69c8ecfd7767a2d0c5aa'
  'SKIP'
)
validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>

prepare() {
  sh "hplip-$pkgver-plugin.run" --target "$srcdir/hplip-$pkgver-plugin" --noexec
}

package() {
  cd "$srcdir/hplip-$pkgver-plugin"

  case $CARCH in
  "i686")
    _arch='x86_32'
    ;;
  "x86_64")
    _arch='x86_64'
    ;;
  "armv6h" | "armv7h")
    _arch='arm32'
    ;;
  "aarch64")
    _arch='arm64'
    ;;
  esac

  install -Dm644 -t "$pkgdir/usr/share/hplip" plugin.spec
  install -Dm644 -t "$pkgdir/usr/share/hplip/data/firmware" hp_laserjet_*.fw.gz
  install -Dm755 -t "$pkgdir/usr/share/hplip/fax/plugins" fax_marvell-"$_arch".so
  install -Dm755 -t "$pkgdir/usr/share/hplip/prnt/plugins" hbpl1-"$_arch".so
  install -Dm755 -t "$pkgdir/usr/share/hplip/prnt/plugins" lj-"$_arch".so
  install -Dm755 -t "$pkgdir/usr/share/hplip/scan/plugins" bb_*-"$_arch".so

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

  # Create hplip.state used by hplip-tools
  cat << EOF > hplip.state
[plugin]
installed = 1
eula = 1
version = $pkgver
EOF
  install -Dm644 -t "$pkgdir/var/lib/hp" hplip.state

  # Create symlinks
  find "$pkgdir/usr/share/hplip" -type f -name "*.so" | while read -r f; do
    lib_dir="${f%/*}"
    lib_name="${f##*/}"
    ln -vsf "$lib_name" "$lib_dir/${lib_name%%-*}.so"
  done
}

# Note: to check the install, perform: hp-diagnose_plugin
