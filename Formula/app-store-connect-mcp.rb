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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.9.0/app-store-connect-mcp_0.9.0_darwin_arm64.tar.gz"
      sha256 "88eefc3dfcd5aad83242766577b560686562d46d65b9ad562e3cf3a69e8f9eab"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.9.0/app-store-connect-mcp_0.9.0_darwin_amd64.tar.gz"
      sha256 "e4b36e8e220b9c8d404b3b8cfa886e2048a91d547b055233238350c8e98715dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.9.0/app-store-connect-mcp_0.9.0_linux_arm64.tar.gz"
      sha256 "ae9260a722e9d51c03a5f648e820a172514dbecac3a22f5adf2bff237cba2f59"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.9.0/app-store-connect-mcp_0.9.0_linux_amd64.tar.gz"
      sha256 "4893942a2f7129c1be90f4d4922938e8a2e099eed03f6172195e07f2323fa76a"
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
