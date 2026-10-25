class Hamn < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/hamn"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/idoo/hamn/releases/download/v0.1.0/hamn_0.1.0_darwin_arm64.tar.gz"
      sha256 "225cb43c21a1724bf3549b0cfc85bb0bab4a787b980be84d868cf662dec25edb"
    end
    on_intel do
      url "https://github.com/idoo/hamn/releases/download/v0.1.0/hamn_0.1.0_darwin_amd64.tar.gz"
      sha256 "a860b93e1dd54d28a5ff3211f6e5204b6cccf8f75f304b18359579c19f3df2bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/hamn/releases/download/v0.1.0/hamn_0.1.0_linux_arm64.tar.gz"
      sha256 "5e8c418df9c1b1ef9d84f6be84cf2ff26db7f513c8b6180cbbd35f95c0973c70"
    end
    on_intel do
      url "https://github.com/idoo/hamn/releases/download/v0.1.0/hamn_0.1.0_linux_amd64.tar.gz"
      sha256 "5c4dab94253175831de807c38a3db4bfb0e1113357682e029091508e9052530b"
    end
  end

  def install
    bin.install "hamn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hamn version")
  end
end
