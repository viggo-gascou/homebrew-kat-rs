class KatRs < Formula
  desc "CLI tool for interacting with the programming problem solving site Kattis"
  homepage "https://github.com/viggo-gascou/kat-rs/"
  url "https://github.com/viggo-gascou/kat-rs/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6b7f2d15467db4ff12f37961d9a0907a2895189995c2a076dcc1844e8093e090"
  version "0.1.0"
  license "Apache-2.0"
  head "https://github.com/viggo-gascou/kat-rs.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bash_completion.install "kat.bash"
    fish_completion.install "kat.fish"
    zsh_completion.install "_kat"
  end

  test do
    output = shell_output("#{bin}/kat help")
    assert_match "Usage: kat [OPTIONS] <COMMAND>", output
    assert_match "Commands:", output
    assert_match "Options:", output
  end
end
