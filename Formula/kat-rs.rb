
class KatRs < Formula
  desc "A simple CLI tool for interacting with the programming problem solving site Kattis - written in rust."
  homepage "https://github.com/viggo-gascou/kat-rs/"
  license "MIT"
  version "0.1.0"
  head "https://github.com/viggo-gascou/kat-rs.git", branch: "main"
    
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  if Hardware::CPU.intel?
    if OS.mac?
      url "https://github.com/viggo-gascou/kat-rs/releases/download/v#{version}/kat-v#{version}-Darwin-x86_64"
      sha256 "0be3b7ca6da4d8a0882e0f025317284f9f343f8437324a99f3e4c653a860ff35"
    elsif OS.linux?
      url "https://github.com/vigg-gascou/kat-rs/releases/download/v#{version}/kat-v#{version}-Linux-x86_64"
      sha256 "4488a10b37ea3b1fbfb68bcb3dbe29d2a2b7a711d90d10912f41e687cff8ea1a"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/viggo-gascou/kat-rs/releases/download/v#{version}/kat-v#{version}-Darwin-arm64"
    sha256 "235de7865cfd614c1e397bef6000eab52bff37d5e3f9fcfca326a8c5cc0c379d"
  end

  def install
    bin.install "kat-v#{version}-Darwin-#{Hardware::CPU.arch}" => "kat"
  end

  test do
    output = shell_output("#{bin}/kat help")
    assert_match "Usage: kat [OPTIONS] <COMMAND>", output
    assert_match "Commands:", output
    assert_match "Options:", output
  end
end
