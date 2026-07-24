class Kotgent < Formula
  desc "Local-first dispatcher for coding-agent sessions (Claude & Codex in tmux)"
  homepage "https://github.com/Heapy/kotgent"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Heapy/kotgent/releases/download/v0.1.0/kotgent-0.1.0-macos-arm64.tar.gz"
    sha256 "7ecd6a10ea9d4168bd9248d67db7d9734314e68600813d1a9b1c825aab4eee19"
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
    assert_match "kotgent 0.1.0", shell_output("#{bin}/kotgent --version")
  end
end
