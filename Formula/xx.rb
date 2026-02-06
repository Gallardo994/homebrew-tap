# typed: false
# frozen_string_literal: true

class Xx < Formula
  desc "A per‑project alias tool"
  homepage "https://github.com/gallardo994/xx-cli"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.2.0/xx-macos-arm64-release"
    sha256 "cdc7bcbc144bdd886e746ecc1c908c61c8fe429f54fd45031556eb1ef0ad3222"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.2.0/xx-linux-x86_64-release"
    sha256 "7753120167a1046cb62f8ce95033808e8f80b6ab90307178341f7f8f9054a658"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.2.0/xx-linux-arm64-release"
    sha256 "0814584fe85d4abffda884867cc571bd5ef79a2f12e6c673cd1906311eea2086"
  else
    odie "Unsupported platform – no binary available for #{OS.kernel_name} #{Hardware::CPU.arch}"
  end

  version "1.2.0"
  license "MIT"

  head do
    url "https://github.com/gallardo994/xx-cli.git", branch: "main"
  end

  def install
    bin.install "xx-macos-arm64-release" => "xx" if OS.mac? && Hardware::CPU.arm?
    bin.install "xx-linux-x86_64-release" => "xx" if OS.linux? && Hardware::CPU.intel?
    bin.install "xx-linux-arm64-release" => "xx" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    output = shell_output("#{bin}/xx --help")
    assert_match "xx", output
  end
end
