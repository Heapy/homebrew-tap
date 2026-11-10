# homebrew-tap

Homebrew tap for Heapy tools.

```bash
brew tap Heapy/tap
```

## Formulae

```bash
brew install keemun
```

Or without tapping first:

```bash
brew install Heapy/tap/keemun
```

## Casks

### Kinetica Terminal

Native macOS terminal for Apple Silicon with Metal rendering, tabs, search and scrollback. JetBrains Mono is bundled as the default font with programming ligatures.

```bash
brew install --cask Heapy/tap/kinetica-terminal
```

Requires an Apple Silicon Mac and macOS Monterey or later. The current `0.5.0`
release is signed with Developer ID and notarized by Apple, with a
stapled notarization ticket. See the
[release notes](https://github.com/Heapy/kinetica-terminal/releases/tag/v0.5.0)
for changes, validation and known limitations. Older macOS versions have not
been tested; the release was tested on macOS 27.0.1.
