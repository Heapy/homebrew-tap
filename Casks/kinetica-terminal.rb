cask "kinetica-terminal" do
  version "0.2.0"
  sha256 "9f192a63760127fb377a4814897f4b31b61bd3398a9f2e63e1abd66fcfbbc519"

  url "https://github.com/Heapy/kinetica-terminal/releases/download/v#{version}/Kinetica-Terminal-#{version}-macos-arm64.zip"
  name "Kinetica Terminal"
  desc "Terminal with Metal rendering, tabs, search, and scrollback"
  homepage "https://github.com/Heapy/kinetica-terminal"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Kinetica Terminal.app"

  caveats <<~EOS
    This is a preview release. Known test failures are documented at:
      https://github.com/Heapy/kinetica-terminal/releases/tag/v#{version}

    The app is ad-hoc signed and is not notarized by Apple.
    macOS may require approval on first launch; see:
      https://support.apple.com/102445
  EOS
end
