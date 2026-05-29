class Flowmark < Formula
  desc "Markdown auto-formatter for clean diffs and semantic line breaks"
  homepage "https://github.com/jlevy/flowmark-rs"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2017fc0f60a99cdc9fab7e488ee82015c9667cb379baa54be4119b98ebacfb5b"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e701568b05cbd5ab8ffe57b9b04ab37c016d75441ea6d29c28ab519c1e6635bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "33e8667afa400cc704f7126f98d23316cfe79a4b428632c59644af5464233e4a"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0ddaeceb9479db13adcca29dbe479dc4cea207036e1c2d2dacd133f9a599ff9a"
    end
  end

  def install
    bin.install "flowmark"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flowmark --version")
  end
end
