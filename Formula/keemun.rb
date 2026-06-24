class Keemun < Formula
  desc "Model and explore decision rationale as structured graphs"
  homepage "https://github.com/Heapy/keemun"
  version "0.2.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Heapy/keemun/releases/download/v0.2.0/keemun-0.2.0-darwin-arm64.tar.gz"
    sha256 "cd1609cc4e6e7c7c1be373d85ba251cf266c06305b558b014282b358421fe26d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Heapy/keemun/releases/download/v0.2.0/keemun-0.2.0-linux-arm64.tar.gz"
    sha256 "f5ac5629cf4f2880414653f112519587503a7bbee06231354a6bef7598166530"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Heapy/keemun/releases/download/v0.2.0/keemun-0.2.0-linux-x64.tar.gz"
    sha256 "274d7d145fb48503cf711dabe729cac4d7f8d1cca824ee190dc8f278a11c6a3b"
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
