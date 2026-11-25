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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.29.0/app-store-connect-mcp_0.29.0_darwin_arm64.tar.gz"
      sha256 "cc4316e208489a244309f95ad9a0022521bb19d5062f00fadbea0568fbbb3907"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.29.0/app-store-connect-mcp_0.29.0_darwin_amd64.tar.gz"
      sha256 "db1e74caa9f418ff967a7347d4b0f23c9b4b74374a1e0eedbab70088820d11a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.29.0/app-store-connect-mcp_0.29.0_linux_arm64.tar.gz"
      sha256 "9527a6f96acf13c6117d7bb4867b477d2e4d6fdb847d57902080d5af7e4871be"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.29.0/app-store-connect-mcp_0.29.0_linux_amd64.tar.gz"
      sha256 "73e1a9e2eba9d6ae0eb787e7a6548ef155ae8fa4aa6293e7e012a1d2897cecac"
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
