class Harmon < Formula
  desc "Lightweight macOS process and battery monitor"
  homepage "https://github.com/Heapy/harmon"
  url "https://github.com/Heapy/harmon/releases/download/v0.5.0/harmon-0.5.0-macos-arm64.tar.gz"
  sha256 "345ffce91ebdb3dad6ad85cb972c6984801fc0efda590172e0959351e7cb2793"
  license "GPL-3.0-only"

  depends_on arch: :arm64
  depends_on macos: :monterey

  def install
    bin.install "bin/harmon"
    libexec.install "libexec/harmon-collector"
    pkgshare.install "share/harmon/Harmon.Info.plist",
                     "share/harmon/Harmon.icns",
                     "share/harmon/harmon.conf.example"
  end

  def caveats
    <<~EOS
      Run `#{bin}/harmon setup` after installation and after every `brew upgrade harmon`.
      Then run `#{bin}/harmon status` to verify the installed agent and collector.
    EOS
  end

  test do
    assert_equal "harmon #{version}", shell_output("#{bin}/harmon --version").strip
    assert_equal "harmon-collector #{version}",
                 shell_output("#{libexec}/harmon-collector --version").strip
  end
end
