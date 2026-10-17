class Htopmodern < Formula
  desc "Cozy macOS terminal dashboard with monitoring, lo-fi scenes, music, and weather"
  homepage "https://github.com/TerrifyGary/htopModern"
  url "https://github.com/TerrifyGary/htopModern/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "758405a763b6211a9b8f33e1535e122ea0e3e9d47e68149692e11d39663ab0bb"
  license "MIT"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on "macmon"
  depends_on :macos

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args
    bin.install_symlink "htopmodern" => "htm"
  end

  def caveats
    <<~EOS
      Run htm (or htopmodern) to start the dashboard.
      Press F2 to cycle themes; Q quits.
      Apple Music may require Automation permission for your terminal.
      Native weather images require a supported terminal; other terminals use half-blocks.
      Personal data is stored in ~/Library/Application Support/htopmodern/.
    EOS
  end

  test do
    assert_equal "htopmodern 0.1.0", shell_output("#{bin}/htopmodern --version").strip
    assert_equal "htopmodern 0.1.0", shell_output("#{bin}/htm --version").strip
    assert_match "Ctrl+B", shell_output("#{bin}/htm --help")
    assert_match "CPUs:", shell_output("#{bin}/htm --check")
  end
end
