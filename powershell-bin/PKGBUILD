# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_pkgname=${pkgname%-bin}
pkgver=7.4.2
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (binary package)"
arch=(x86_64 armv7h aarch64)
url="https://github.com/Powershell/Powershell"
license=(MIT)
depends=(
  gcc-libs
  glibc
  zlib
)
optdepends=('lttng-ust2.12: CoreCLR tracing')
provides=(powershell)
conflicts=(powershell)
install=powershell.install
_archive="$pkgname-$pkgver-$pkgrel"
_artifact="$_archive.tar.gz"
source_armv7h=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-arm32.tar.gz")
source_aarch64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-arm64.tar.gz")
source_x86_64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-x64.tar.gz")
noextract=("$_artifact")
sha256sums_x86_64=('36605dc37979de5af2e10783bf70c0ad8150521e81e6d7c9322036ebb897e7fe')
sha256sums_armv7h=('6bf11145e6d15ea8a89d9167bdcef0d75848462e4369c837fda37a6550d2dc5f')
sha256sums_aarch64=('006021694a9e0ce962457d23189e3cb88ae030863b221907f8fb891df9497aeb')

prepare() {
  mkdir -p "$_archive"
  tar -xf $_artifact -C "$_archive"
}

package() {
  cd "$_archive"

  local pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$_pkgname-$pkgnum"
  cp -a -t "$pkgdir/usr/lib/$_pkgname-$pkgnum" ./*

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname-$pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
