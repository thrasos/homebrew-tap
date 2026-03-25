class CliTuner < Formula
  desc "CLI microphone tuner for bouzouki, tzouras, baglama, and classical guitar"
  homepage "https://github.com/thrasos/cli_tuner"
  url "https://github.com/thrasos/cli_tuner/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "78b330b890d4c6a89c9a7fe99fae1ccdbad60e95d868a2e5754ff117a9fb061b"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    output = shell_output("#{bin}/cli_tuner --list")
    assert_match "tetrachordo tuning targets:", output
  end
end
