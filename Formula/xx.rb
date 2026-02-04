# typed: false
# frozen_string_literal: true

class Xx < Formula
  desc "A per‑project alias tool"
  homepage "https://github.com/gallardo994/xx-cli"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/0.9.3/xx-macos-arm64-release"
    sha256 "7d90786c41eca0134e288d507634b8ddebaead958874a4bee8f42098f77421d7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Gallardo994/xx-cli/releases/download/0.9.3/xx-linux-x86_64-release"
    sha256 "4e9c97d37972e2609a72af3035a4bc5a9084d576959811b810acdd5a471383bc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/0.9.3/xx-linux-arm64-release"
    sha256 "3f93e6e45faab84f8860243a217acd6e580e629761fa1f065decc60eaf3611be"
  else
    odie "Unsupported platform – no binary available for #{OS.kernel_name} #{Hardware::CPU.arch}"
  end

  version "0.9.3"
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
