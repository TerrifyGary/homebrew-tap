# TerrifyGary Homebrew tap

## htopModern

A cozy terminal dashboard for Apple Silicon Macs.

```sh
brew install TerrifyGary/tap/htopmodern
htm
```

This initial formula builds the tagged v0.1.0 source and installs the `htopmodern` executable, `htm` shortcut, and macmon dependency. Homebrew installs Rust as a build dependency. Use an up-to-date native Apple Silicon Homebrew installation (normally `/opt/homebrew`), not Intel Homebrew under Rosetta.

```sh
brew upgrade TerrifyGary/tap/htopmodern
brew uninstall htopmodern
```

See [the app README](https://github.com/TerrifyGary/htopModern) for controls, permissions, compatibility, and data storage. The app is tested on Apple Silicon/macOS 26.6.2; other systems are not fully verified. No sudoers changes or saved passwords are required.

## Release validation

The source archive checksum, Rust tests, lint checks, release build, and CLI smoke checks passed. Homebrew style validation passed. A clean Apple Silicon macOS 15 GitHub runner successfully installed the formula, ran `brew test`, and verified both `htopmodern` and `htm`: [installation validation](https://github.com/TerrifyGary/homebrew-tap/actions/runs/39022824044).

The development Mac has Intel Homebrew under `/usr/local`; the install check deliberately ran on a native ARM runner instead of changing that setup.

Formula code is MIT licensed.
