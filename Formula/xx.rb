# typed: false
# frozen_string_literal: true

class Xx < Formula
  desc "A per-project alias tool"
  homepage "https://github.com/gallardo994/xx-cli"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/v0.8.2-r1/xx-build_macos_latest_llvm_20_release"
    sha256 "7172957d88370b2c0430266fb7a3123d58e6e63b1fc7e55051d0bbf9907b479b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Gallardo994/xx-cli/releases/download/v0.8.2-r1/xx-build_ubuntu_latest_llvm_20_release"
    sha256 "7d1acca17c5c3bcd04d28bccb89742b9c706cafa1789e7bdfe62685744f5d0f2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/v0.8.2-r1/xx-build_ubuntu_24.04_arm_llvm_20_release"
    sha256 "91e2c041fd2ab23fcdd379e6ff160ae791e63e4463a54ebf89518845c1c4a8ab"
  else
    odie "Unsupported platform – no binary available for #{OS.kernel_name} #{Hardware::CPU.arch}"
  end

  version "0.8.2"
  license "MIT"

  head do
    url "https://github.com/gallardo994/xx-cli.git", branch: "main"
  end

  def install
    bin.install "xx"
  end

  test do
    output = shell_output("#{bin}/xx --help")
    assert_match "xx", output
  end
end
