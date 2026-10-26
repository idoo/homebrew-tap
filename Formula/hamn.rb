class Hamn < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/hamn"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/hamn/releases/download/v0.1.3/hamn_0.1.3_darwin_arm64.tar.gz"
      sha256 "bb786b2846efebb2dc574112aafaf717cf4039c27b9606fa7a06a5e3146485b6"
    end
    on_intel do
      url "https://github.com/idoo/hamn/releases/download/v0.1.3/hamn_0.1.3_darwin_amd64.tar.gz"
      sha256 "631dcf1667c1fee34d719a3e45848cff98691c1c1e34397e46f6600b07e806b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/hamn/releases/download/v0.1.3/hamn_0.1.3_linux_arm64.tar.gz"
      sha256 "075db89405042f5b4ec0a5fbc7623754017c02af5168584637fbb7dcb89312e3"
    end
    on_intel do
      url "https://github.com/idoo/hamn/releases/download/v0.1.3/hamn_0.1.3_linux_amd64.tar.gz"
      sha256 "6831e0d45a0427ba16fafdb963d78e8602eeb4ae09d45921fcb6b2851fbb1fc7"
    end
  end

  def install
    bin.install "hamn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hamn version")
  end
end
