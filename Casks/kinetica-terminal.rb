cask "kinetica-terminal" do
  version "0.1.0"
  sha256 "e5e7e0df30c811658fc7baa143b012460e0157e6932649a7e2ed317349d6209f"

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
