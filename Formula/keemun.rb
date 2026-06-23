class Keemun < Formula
  desc "Model and explore decision rationale as structured graphs"
  homepage "https://github.com/Heapy/keemun"
  version "0.1.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Heapy/keemun/releases/download/v0.1.0/keemun-0.1.0-darwin-arm64.tar.gz"
    sha256 "7a346ec3bfdb0a063223734a8829fad5f780f0a790f005a22911f1ea51eb4691"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Heapy/keemun/releases/download/v0.1.0/keemun-0.1.0-linux-arm64.tar.gz"
    sha256 "e53d4b1d61ff1e08e929b5f0e4eaca7b5feffbcb416026a90919768ddf6dd7d7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Heapy/keemun/releases/download/v0.1.0/keemun-0.1.0-linux-x64.tar.gz"
    sha256 "03daeaa98372d6b1871a2e047fff2f390eff49f112775210ac22d9b1895e14d1"
  else
    odie "Keemun binary releases are available for macOS ARM64, Linux ARM64, and Linux x64"
  end

  def install
    bin.install "keemun"
  end

  test do
    graph = testpath/"graph.json"

    system bin/"keemun", "init", "--file", graph
    assert_match "Valid graph:", shell_output("#{bin}/keemun validate --file #{graph}")
  end
end
