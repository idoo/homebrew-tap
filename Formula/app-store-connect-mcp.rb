class AppStoreConnectMcp < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/app-store-connect-mcp"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.3.0/app-store-connect-mcp_0.3.0_darwin_arm64.tar.gz"
      sha256 "a50db4d2341f7c14bc7a02bba6b2b4f91f4908859abbb8d90729b1d6cc42f9b3"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.3.0/app-store-connect-mcp_0.3.0_darwin_amd64.tar.gz"
      sha256 "b71f8c2447807b86a5a4151504509f4474592029c0f8fca896421bf9dc6df72c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.3.0/app-store-connect-mcp_0.3.0_linux_arm64.tar.gz"
      sha256 "136759ea5d28499e7f7ca0f7cc96893e972c4b85b67f5d1e98430b35f63108c1"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.3.0/app-store-connect-mcp_0.3.0_linux_amd64.tar.gz"
      sha256 "afd9150d2712bad7312dad0d679043b1b42bc7fb0906f5649955b2e5fd65b5d5"
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
