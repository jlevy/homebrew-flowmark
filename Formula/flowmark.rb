class Flowmark < Formula
  desc "Markdown auto-formatter for clean diffs and semantic line breaks"
  homepage "https://github.com/jlevy/flowmark-rs"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "35a872122b2251273b5900fa4729d2096d939b80dc5767657913563fa68f962c"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2edeaa2481972a4aafc70cd0dfdf718e8b3cdf8291bd84ebc8935e6b3ea0ee89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "afbedf4addaa206c6b7070496bed556d1e5ac2434bfd775f02e67429e0fb1336"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d3a24fffbba1000d8f61f76c53b1a6c1c3c8c8a139e2a7c3c55bce5b12b47dc7"
    end
  end

  def install
    bin.install "flowmark"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flowmark --version")
  end
end
