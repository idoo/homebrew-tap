class AppStoreConnectMcp < Formula
  desc "MCP server to ship iOS and macOS apps through App Store Connect"
  homepage "https://github.com/idoo/app-store-connect-mcp"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.27.0/app-store-connect-mcp_0.27.0_darwin_arm64.tar.gz"
      sha256 "bc33ccab3bf0d4e7194e73f54f0af8130eeb748749ed2f90e636f3b3a8f1e59a"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.27.0/app-store-connect-mcp_0.27.0_darwin_amd64.tar.gz"
      sha256 "67bea7a2262f1dc8e8051608b1ca9fac1d70dfdfa9a478cd527e7523b1610b7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.27.0/app-store-connect-mcp_0.27.0_linux_arm64.tar.gz"
      sha256 "813cc1a227f00e391730664b69b870dc478b6b98b34237e134f80c20d27017f9"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.27.0/app-store-connect-mcp_0.27.0_linux_amd64.tar.gz"
      sha256 "84455213a3a735dd7561a99e09e4b078cfd419b0f20b31be668ce7856a6f6959"
    end
  end

  def install
    bin.install "app-store-connect-mcp"
  end

  def caveats
    <<~TEXT
      app-store-connect-mcp needs an App Store Connect API key:
        App Store Connect > Users and Access > Integrations > App Store Connect API
      Then register it and connect your client:
        app-store-connect-mcp auth import
        app-store-connect-mcp config install <client>   # claude-code, claude-desktop, codex, cursor, vscode, windsurf
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/app-store-connect-mcp version")
  end
end
