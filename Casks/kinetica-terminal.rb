cask "kinetica-terminal" do
  version "0.2.1"
  sha256 "b3112c770c2dcd5b44fe3bd1748561edf231b84ffefaef037cc4fadaf2d07588"

  url "https://github.com/Heapy/kinetica-terminal/releases/download/v#{version}/Kinetica-Terminal-#{version}-macos-arm64.zip"
  name "Kinetica Terminal"
  desc "Terminal with Metal rendering, tabs, search, and scrollback"
  homepage "https://github.com/Heapy/kinetica-terminal"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Kinetica Terminal.app"

  caveats <<~EOS
    This is a preview release. Known limitations are documented at:
      https://github.com/Heapy/kinetica-terminal/releases/tag/v#{version}
  EOS
end
