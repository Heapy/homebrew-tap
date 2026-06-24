class Keemun < Formula
  desc "Model and explore decision rationale as structured graphs"
  homepage "https://github.com/Heapy/keemun"
  version "0.3.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Heapy/keemun/releases/download/v0.3.0/keemun-0.3.0-darwin-arm64.tar.gz"
    sha256 "c30f1e4fea92ceda61debea4b0d9de1a1282f409de1b19199a0044309c91cdf9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Heapy/keemun/releases/download/v0.3.0/keemun-0.3.0-linux-arm64.tar.gz"
    sha256 "6f4a48700bce256fdc02d835a0d93fcf531762c62f8515197101aec3d712b4e3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Heapy/keemun/releases/download/v0.3.0/keemun-0.3.0-linux-x64.tar.gz"
    sha256 "3721ad9bcb2bd9532b88b05c17dc7fb3d22af5f2de2c49e7f3e64873112225ba"
  else
    odie "Keemun binary releases are available for macOS ARM64, Linux ARM64, and Linux x64"
  end

  def install
    bin.install "keemun"
  end

  test do
    graph = testpath/"graph.jsonl"

    system bin/"keemun", "init", "--file", graph
    assert_match "Valid log:", shell_output("#{bin}/keemun validate --file #{graph}")
  end
end
