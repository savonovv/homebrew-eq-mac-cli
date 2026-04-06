class EqMacCli < Formula
  desc "Free and customizable macOS EQ CLI with editable plain-text presets and live audio processing"
  homepage "https://github.com/savonovv/eq-mac-cli"
  url "https://github.com/savonovv/eq-mac-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8c98ce14f39f706464a90c429cb9117cecc6251f964d19c0b49e674603df3a92"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "."), "--bins"
  end

  test do
    assert_match "Manage EQ presets", shell_output("#{bin}/eqcli --help")
    assert_predicate bin/"eqmacd", :exist?
  end
end
