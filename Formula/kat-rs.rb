class KatRs < Formula
  desc "CLI tool for interacting with the programming problem solving site Kattis"
  homepage "https://github.com/viggo-gascou/kat-rs/"
  license "Apache-2.0"
  head "https://github.com/viggo-gascou/kat-rs.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.2/kat-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "5429bf7fe22d79ff795d84c4fec957c21f6f1102084f70b8efe732124be2fcfc"
    elsif Hardware::CPU.arm?
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.2/kat-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "cd3bbdda4dc7f0b3385f3b4589c8407a06a44cb65e26a7d8d1e6f3a00348ad7e"
    end
  end

  if OS.linux?
    url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.2/kat-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ecd1ea2ffec46bdbe91f3f3f8a1156ec1f352fc22bc155bd02fa43d17c0e2393"
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
