class AppStoreConnectMcp < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/app-store-connect-mcp"
  version "0.6.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.6.0/app-store-connect-mcp_0.6.0_darwin_arm64.tar.gz"
      sha256 "b2edb891421916ff4738009b6d76bc320b65273a8da3c53d7303843850a85ceb"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.6.0/app-store-connect-mcp_0.6.0_darwin_amd64.tar.gz"
      sha256 "11ea1544cd2b6c3136a4e5e1f8a3c5f35cccec0d096b863a578c14c2200ca05b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.6.0/app-store-connect-mcp_0.6.0_linux_arm64.tar.gz"
      sha256 "06371f88ecd81fd0eb30d3f9acb3ea25f193208718f88380b700ad89643def06"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.6.0/app-store-connect-mcp_0.6.0_linux_amd64.tar.gz"
      sha256 "9df0f4eab9a7bbe40948fc7277e25c99e8a5891269705e33a1094da2ef05b820"
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
