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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.11.0/app-store-connect-mcp_0.11.0_darwin_arm64.tar.gz"
      sha256 "3c0b1d6bb090d22b824d3bac50b7616aca6ffb67058977372ee995940f056577"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.11.0/app-store-connect-mcp_0.11.0_darwin_amd64.tar.gz"
      sha256 "74c608ff10fd0f5c30ae5f6b526a50507f7323cbad4881018c1741700c0b2245"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.11.0/app-store-connect-mcp_0.11.0_linux_arm64.tar.gz"
      sha256 "06d3c913f1053d507e022a24d58ee8cffd05eb4bce9449e1a5b96ef9f6e6c81d"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.11.0/app-store-connect-mcp_0.11.0_linux_amd64.tar.gz"
      sha256 "acab73b8443b6f5ccba2f243ff3fd7bc68f6c812e74eb97e883b272d69255888"
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
