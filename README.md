Install all those useful Haskell programs.

Supposed to be used with a cross-compiler.
See and modify cabal.project
(it contains absolute paths because I don't care that's why).

NB: build ghc-8.6.5 with perf-cross flavour:
```
LD=/usr/bin/aarch64-linux-gnu-ld.gold NM=/usr/bin/aarch64-linux-gnu-nm CLANG=clang-6.0 ./configure --target=aarch64-linux-gnu --prefix=/usr/aarch64-linux-gnu
```

Don't forget install C dependencies:
```
sudo apt-get install zlib1g-dev:arm64
```
Build it (for some reason, need to force disable-documentation:
```
mkdir .cabal
mkdir .cabal/bin
cabal v2-update
cabal v2-build --disable-documentation
```
