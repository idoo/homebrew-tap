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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.13.0/app-store-connect-mcp_0.13.0_darwin_arm64.tar.gz"
      sha256 "3e04020881ce038cb226e110a088456c3516639d21707f873fb73bab6d53e90d"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.13.0/app-store-connect-mcp_0.13.0_darwin_amd64.tar.gz"
      sha256 "3ed17db5212445254a6cc785a58b34860d768390b1a125b9856a58ca67a2f8f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.13.0/app-store-connect-mcp_0.13.0_linux_arm64.tar.gz"
      sha256 "9e2aaad05f5c6c9853ea6901dccd106652f270e0fc95fcc69ea706508794ba1b"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.13.0/app-store-connect-mcp_0.13.0_linux_amd64.tar.gz"
      sha256 "ced34a6b013abd15df2848d6bc92ce6b946ed79c1ca043f0a0af21d079a1c083"
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
