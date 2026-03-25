class CliTuner < Formula
  desc "CLI microphone tuner for bouzouki, tzouras, baglama, and classical guitar"
  homepage "https://github.com/thrasos/cli_tuner"
  url "https://github.com/thrasos/cli_tuner/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "817565d203e28262b04c3192f7e0e31c828ff4208b6cea7a232655267b5be6db"
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
