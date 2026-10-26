class AppStoreConnectMcp < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/app-store-connect-mcp"
  version "0.8.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.8.0/app-store-connect-mcp_0.8.0_darwin_arm64.tar.gz"
      sha256 "8809177cb41455928ba2f2110f2933107943c9d0a878a8bd2adb168ee6c411a8"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.8.0/app-store-connect-mcp_0.8.0_darwin_amd64.tar.gz"
      sha256 "fd7878ea658e968a8bce78b9e7a005281dc255a3cd7edf7db970f6477c0a3093"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.8.0/app-store-connect-mcp_0.8.0_linux_arm64.tar.gz"
      sha256 "3318095fa4fabfc05f3da46efe921b448f0c3b1763c4921cfb4ed34dfa10ae00"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.8.0/app-store-connect-mcp_0.8.0_linux_amd64.tar.gz"
      sha256 "9e1cf734fe8fd9ae44956dc4982203b547529fcddef42908672b5d96d0f27f68"
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
