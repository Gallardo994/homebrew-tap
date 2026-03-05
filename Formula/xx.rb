# typed: false
# frozen_string_literal: true

class Xx < Formula
  desc "A per‑project alias tool"
  homepage "https://github.com/gallardo994/xx-cli"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.2.2/xx-macos-arm64-release"
    sha256 "e021d0b3319d53c2554296feb5f7dcb537ff5c67d156e8386016a51abf190288"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.2.2/xx-linux-x86_64-release"
    sha256 "9cda35983185aede6e8912aecae01ac97401706a5df8237fe4740d0da0f4d2d4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.2.2/xx-linux-arm64-release"
    sha256 "e2b90b9dfba4494ff6a7f2a12aec3a09af1b13b871c15cbdd167063d50f90d35"
  else
    odie "Unsupported platform – no binary available for #{OS.kernel_name} #{Hardware::CPU.arch}"
  end

  version "1.2.2"
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
