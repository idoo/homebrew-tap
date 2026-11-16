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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.23.0/app-store-connect-mcp_0.23.0_darwin_arm64.tar.gz"
      sha256 "49497e888fb372837aba9403b91949c2e6cb53b8370d1c7c478a831774afbbbe"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.23.0/app-store-connect-mcp_0.23.0_darwin_amd64.tar.gz"
      sha256 "2594fc9d86bd638b9bba68ebdb396dc1f52aed359831bfa14bf576ecdc82c027"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.23.0/app-store-connect-mcp_0.23.0_linux_arm64.tar.gz"
      sha256 "19a47b3835e4dca08aa1a52841bd7dbd71979ce31c7fcda84f70b3104aff04dd"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.23.0/app-store-connect-mcp_0.23.0_linux_amd64.tar.gz"
      sha256 "55e21a5f46491eb84c75000c0bf728cbab12828067f84cd9245cecd00ca3b571"
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
