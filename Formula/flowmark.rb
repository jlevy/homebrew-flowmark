class Flowmark < Formula
  desc "Markdown auto-formatter for clean diffs and semantic line breaks"
  homepage "https://github.com/jlevy/flowmark-rs"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9ba6c96bb93d6960ac994ea5658b45099bf62e296589f1d997f6f6b04166d1fb"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a087036e5cbf303019965695951349e9adf974464e33a5b201b7c6bdf933291e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1ee02c0657eeb2dd748093a5b60ef94a99e1e18aac62c0ddbb34ca055192b9f2"
    else
      url "https://github.com/jlevy/flowmark-rs/releases/download/v#{version}/flowmark-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a55b379d55f0963d5630faf073c128d7b70553c8e77ee24316d7b196100474bc"
    end
  end

  def install
    bin.install "flowmark"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flowmark --version")
  end
end
