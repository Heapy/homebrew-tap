cask "kinetica-terminal" do
  version "0.3.0"
  sha256 "3e297bd73dbfbeefe7828a2bea2a1cf0c43df28773be5aa05d048d201de82147"

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
