class Flowmark < Formula
  desc "Markdown auto-formatter for clean diffs and semantic line breaks"
  homepage "https://github.com/jlevy/flowmark-rs"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "21d0b759b7989e83253b8218177c8ac977e19696c6969ba3da5efc75d73ae77e"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "27818906ac511a5b58efb0f43ba2351549dd15c3c264e1d1f020b41fe8967424"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "906921f17a642521d696b0886b871b48ed1e7a1739d27c5e3cbad60802a371b4"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c723b0a3ad82803a517e26ba3156c4e3726cc59b63142f88052d0edfd932191c"
    end
  end

  def install
    bin.install "flowmark"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flowmark --version")
  end
end
