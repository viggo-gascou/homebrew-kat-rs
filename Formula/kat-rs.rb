class KatRs < Formula
  desc "CLI tool for interacting with the programming problem solving site Kattis"
  homepage "https://github.com/viggo-gascou/kat-rs/"
  version "0.1.1"
  license "Apache-2.0"
  head "https://github.com/viggo-gascou/kat-rs.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v#{version}/kat-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "your_sha256_for_intel"
    else
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v#{version}/kat-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "your_sha256_for_arm"
    end
  end

  on_linux do
    url "https://github.com/viggo-gascou/kat-rs/releases/download/v#{version}/kat-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "your_sha256_for_linux"
  end

  def install
    bin.install "kat"
    bash_completion.install "completions/kat.bash"
    fish_completion.install "completions/kat.fish"
    zsh_completion.install "completions/_kat"
  end

  test do
    output = shell_output("#{bin}/kat help")
    assert_match "Usage: kat [OPTIONS] <COMMAND>", output
    assert_match "Commands:", output
    assert_match "Options:", output
  end
end
