# typed: false
# frozen_string_literal: true

class Xx < Formula
  desc "A per‑project alias tool"
  homepage "https://github.com/gallardo994/xx-cli"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.1.0/xx-macos-arm64-release"
    sha256 "1163208bd7124e4479a7a5c343a3e7091004b74d8b6fe1cc63ff16ef2498cf16"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.1.0/xx-linux-x86_64-release"
    sha256 "5c1ffbea15d0b8611e72489075892009f490a986c9ac991f5de1284a24edac69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.1.0/xx-linux-arm64-release"
    sha256 "165acba11cf21a648ee3351e900f26d15f1a96d70b1de4456222ed7313c96450"
  else
    odie "Unsupported platform – no binary available for #{OS.kernel_name} #{Hardware::CPU.arch}"
  end

  version "1.1.0"
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
