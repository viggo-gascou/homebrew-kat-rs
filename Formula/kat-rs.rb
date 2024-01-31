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
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.1/kat-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "6da73ff4547038dc1e22f1490f35287372b14720f56598c93523082e290319ee"
    elsif Hardware::CPU.arm?
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.1/kat-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "95aa637a30480299691f845bf88b8225aa2b7ad812c5d81e71c678e557853994"
    end
  end

  if OS.linux?
    url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.1/kat-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7d9bdcc39721c44acc2722ce4d52e46ad311ef887fdf618880193621c34d05d5"
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
