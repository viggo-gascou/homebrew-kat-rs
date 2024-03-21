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
      sha256 "c9071f4c84730f8b9d190802c48b847cf08ae7ff18bbe9d987d5143792048d87"
    elsif Hardware::CPU.arm?
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.2/kat-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "3514fec519a77855b45a88b27e96688a9c63bf87c91748f07b3b8440cb9f53fb"
    end
  end

  if OS.linux?
    url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.2/kat-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b1fd3a641e06fdabd965526978ec70042c63ce301ee40378fef57ec7e516d8c8"
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
