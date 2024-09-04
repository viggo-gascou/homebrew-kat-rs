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
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.4/kat-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "b4f4df8890022ef98244579b0d15e694369c1cc92517ff4148a7418058d1d6f5"
    elsif Hardware::CPU.arm?
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.4/kat-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "47b882297c8eac89056f08e13096d19353d765fe8145cdf54991032176f8b445"
    end
  end

  if OS.linux?
    url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.4/kat-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "87464cb3e877ebe37a4f35ba0ed327fc564c2bb839b5984be19f052dc226a578"
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
