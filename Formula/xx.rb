# typed: false
# frozen_string_literal: true

class Xx < Formula
  desc "A per‑project alias tool"
  homepage "https://github.com/gallardo994/xx-cli"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.1.1/xx-macos-arm64-release"
    sha256 "debe682697bfc5b003507957db462c8b17a6dec7e718687fd33bf339d4dfbad0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.1.1/xx-linux-x86_64-release"
    sha256 "34187b0e1b91c862aeea604a9e31aec96b0eef6dc9f7f304155c91116866e231"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Gallardo994/xx-cli/releases/download/1.1.1/xx-linux-arm64-release"
    sha256 "bc467462498c1566c6dd902271235599988476c99aaa8cb0e67dab0516c16e22"
  else
    odie "Unsupported platform – no binary available for #{OS.kernel_name} #{Hardware::CPU.arch}"
  end

  version "1.1.1"
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
