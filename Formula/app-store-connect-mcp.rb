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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.2/app-store-connect-mcp_0.20.2_darwin_arm64.tar.gz"
      sha256 "30e02101d58637445ade5042d03a0b10f8d2348d0e7a34667442c4b1b2198e81"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.2/app-store-connect-mcp_0.20.2_darwin_amd64.tar.gz"
      sha256 "12c0f001e1e879ce25d3c7a34ee8547f9a3e30c2a71f4f915e74051e3f75ba7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.2/app-store-connect-mcp_0.20.2_linux_arm64.tar.gz"
      sha256 "8a03c1aee40264e8a0ccca5d449774bb465121ee3678c32b8a347bcc3b755bf1"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.2/app-store-connect-mcp_0.20.2_linux_amd64.tar.gz"
      sha256 "d7ab541cfa4956c277b89690fc58944a47f7cb03ecbc47a4a4db7614e2152179"
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
