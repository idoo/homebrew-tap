class Hamn < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/hamn"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/hamn/releases/download/v0.1.1/hamn_0.1.1_darwin_arm64.tar.gz"
      sha256 "b661acc7b8e7487620a047197f0fd0f21299109500f3ffef460a3ca89e12e3b2"
    end
    on_intel do
      url "https://github.com/idoo/hamn/releases/download/v0.1.1/hamn_0.1.1_darwin_amd64.tar.gz"
      sha256 "73342a8f16b15355e7ea3679a21894dc383bc73d5bb066f86295913fa6156616"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/hamn/releases/download/v0.1.1/hamn_0.1.1_linux_arm64.tar.gz"
      sha256 "9da640aff3f54b392f5054ad5e5f416ca04e32e465224cd0107e6246c1b721a5"
    end
    on_intel do
      url "https://github.com/idoo/hamn/releases/download/v0.1.1/hamn_0.1.1_linux_amd64.tar.gz"
      sha256 "756fbee9f45f1f1e21f78cdbadb65c43b700c8168d2d43e729ce29d58113eefb"
    end
  end

  def install
    bin.install "hamn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hamn version")
  end
end
