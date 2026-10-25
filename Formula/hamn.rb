class Hamn < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/hamn"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/hamn/releases/download/v0.1.2/hamn_0.1.2_darwin_arm64.tar.gz"
      sha256 "9913bd5b7a27fd73ade1364139ea6fb88ad88826fc06259669d5191bcfe0102a"
    end
    on_intel do
      url "https://github.com/idoo/hamn/releases/download/v0.1.2/hamn_0.1.2_darwin_amd64.tar.gz"
      sha256 "643354e407ac16fbc74e9ec8dd1cc6839ffac309af82d24a93b714abe4d1916a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/hamn/releases/download/v0.1.2/hamn_0.1.2_linux_arm64.tar.gz"
      sha256 "565058c01156d31172d22b4d09c14d5278cdca2cc094929b0e9d72047874596d"
    end
    on_intel do
      url "https://github.com/idoo/hamn/releases/download/v0.1.2/hamn_0.1.2_linux_amd64.tar.gz"
      sha256 "abe4609f5271efc8149e2bbb8099fad56438f4233750c8f946e51324805c673c"
    end
  end

  def install
    bin.install "hamn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hamn version")
  end
end
