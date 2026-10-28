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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.19.0/app-store-connect-mcp_0.19.0_darwin_arm64.tar.gz"
      sha256 "6f277e545a84508d08d61654c518ffff92f580974c32031ac871804822bd4883"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.19.0/app-store-connect-mcp_0.19.0_darwin_amd64.tar.gz"
      sha256 "9a4505376f1d0ea5a3a6865c7159ad693110809f3101f554896c94fce8c77909"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.19.0/app-store-connect-mcp_0.19.0_linux_arm64.tar.gz"
      sha256 "d4c521fb1c59b74a2693266b63e6835db87cb4fd5de9285980894dde2f4f42ac"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.19.0/app-store-connect-mcp_0.19.0_linux_amd64.tar.gz"
      sha256 "2a2710077449d7a6107d6d4b9f841e537e1052d268a1fed054d6de40d115bcc6"
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
