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
cabal v2-update
cabal v2-install alex happy cpphs hlint ghcid c2hs hpack hscolour hoogle stylish-haskell hindent brittany --disable-documentation
cp -L .cabal/bin/* tools/
```

Last, copy the `tools` folder inside `utils` folder of ghc source tree and add it to the build folder list
inside the root ghc.mk (i.e. `BUILD_DIRS += utils/tools`).
