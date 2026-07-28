class Kotgent < Formula
  desc "Local-first dispatcher for coding-agent sessions (Claude & Codex in tmux)"
  homepage "https://github.com/Heapy/kotgent"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Heapy/kotgent/releases/download/v0.5.0/kotgent-0.5.0-macos-arm64.tar.gz"
    sha256 "d44b4d4283eeec11d11fd563b32bddecfd50d0abc99b7ec3eabb703be8d8fba4"
  else
    odie "kotgent binary releases are available for macOS ARM64 only"
  end

  depends_on "tmux"

  # The daemon serves the web UI from resources/webui, which it locates by walking
  # up from the running binary. Keep the binary and resources together under
  # libexec so that resolution finds #{libexec}/resources/webui; the bin symlink is
  # resolved through realpath, so the executable path still points into libexec.
  def install
    libexec.install "kotgent"
    libexec.install "resources"
    bin.install_symlink libexec/"kotgent"
  end

  test do
    assert_match "kotgent 0.5.0", shell_output("#{bin}/kotgent --version")
  end
end
