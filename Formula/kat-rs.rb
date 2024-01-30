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
      sha256 "59815a73efd51409b44b2d18e5d40e88b0fdac244cc46fbc6181c61e71099691"
    elsif Hardware::CPU.arm?
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.1/kat-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "796097a11a2b22355b16cbd1ce0f17bbadbc2140fcb01a3fd2fbdfd6f286a138"
    end
  end
    
  if OS.linux?
    url "https://github.com/viggo-gascou/kat-rs/releases/download/v0.1.1/kat-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "532f335578516c882640d5eb649a279338f9349d213410a682d72af46f6caa7e"
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
