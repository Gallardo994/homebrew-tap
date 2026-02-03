# typed: false
# frozen_string_literal: true

class Xx < Formula
  desc "A per‑project alias tool"
  homepage "https://github.com/gallardo994/xx-cli"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/0.9.0/__FILE_NAME_MAC_ARM64_"
    sha256 "1b2c11130b7f7324c2ac0721c8ccd7958fe6edc7a2fde4a1f2e839357f1fb5c9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Gallardo994/xx-cli/releases/download/0.9.0/xx-linux-x86_64-release"
    sha256 "4177191d72909df8f5514475a137d3043bba2d27d5ddb085e1f6de58d3303c99"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/0.9.0/xx-linux-arm64-release"
    sha256 "2b63a54f54af5c1eec114ddcdb9f1e3600e4c3421660308c3789701fa84dbe40"
  else
    odie "Unsupported platform – no binary available for #{OS.kernel_name} #{Hardware::CPU.arch}"
  end

  version "0.9.0"
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
