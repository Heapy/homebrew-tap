cask "kinetica-terminal" do
  version "0.5.0"
  sha256 "1b4634133ca5069203fcf6aa52e0b787369973336b87b2ab5561249cf7bee99d"

  url "https://github.com/Heapy/kinetica-terminal/releases/download/v#{version}/Kinetica-Terminal-#{version}-macos-arm64.zip"
  name "Kinetica Terminal"
  desc "Terminal with Metal rendering, tabs, search, and scrollback"
  homepage "https://github.com/Heapy/kinetica-terminal"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Kinetica Terminal.app"

  caveats <<~EOS
    Known limitations are documented at:
      https://github.com/Heapy/kinetica-terminal/releases/tag/v#{version}
  EOS
end
