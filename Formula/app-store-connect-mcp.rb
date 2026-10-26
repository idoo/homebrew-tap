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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.12.0/app-store-connect-mcp_0.12.0_darwin_arm64.tar.gz"
      sha256 "18af0315a4a2380a118f8a0a93966c10a3250a8383c6035a73538a6cead5286c"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.12.0/app-store-connect-mcp_0.12.0_darwin_amd64.tar.gz"
      sha256 "f6e9b25e654213d72f0438e591be77dc05a0426f0bbe793f5d8e2b1a5abee7d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.12.0/app-store-connect-mcp_0.12.0_linux_arm64.tar.gz"
      sha256 "f30d1aac28d045592cabc88d87f1afa58ae35ea16d1868b613109d8bfa2e83c3"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.12.0/app-store-connect-mcp_0.12.0_linux_amd64.tar.gz"
      sha256 "5b7c3e4f5c0ce11422c1fddfacb57bdbda3f6f577a7bfb786270776870419627"
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
