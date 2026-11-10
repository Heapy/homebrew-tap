cask "kinetica-terminal" do
  version "0.4.0"
  sha256 "a5b5c855ccf3bad8f5b04357e5058e7855f66c706b5de20cbfb2f3e83913336f"

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
