class Flowmark < Formula
  desc "Markdown auto-formatter for clean diffs and semantic line breaks"
  homepage "https://github.com/jlevy/flowmark-rs"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c9b432feb44c880c3b3adbb73f2f049cb84b591bdd70752a97911e5261e48b6a"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1c8b9184934b7aa8826e20456c91307d1440e21d6bbde04ff8b6fceb30c6c62c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5b752ae132e59e7ca1610eea0eeb880345d4fbd42cb1e35de1842454c31c37ed"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2e8f90091f1bad8b8b4645e26ed482b4005b2844421738b0231a121ccbd660ff"
    end
  end

  def install
    bin.install "flowmark"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flowmark --version")
  end
end
