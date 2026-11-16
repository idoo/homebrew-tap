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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.25.0/app-store-connect-mcp_0.25.0_darwin_arm64.tar.gz"
      sha256 "ae6e3f8f76667d1840768c8dc75a23a7093d2d15eb83a7951daa6a864520ad0e"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.25.0/app-store-connect-mcp_0.25.0_darwin_amd64.tar.gz"
      sha256 "164657282ab2d0fa259cfa8db7bc258b47eb268362652ce0cfd65eebc37f403d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.25.0/app-store-connect-mcp_0.25.0_linux_arm64.tar.gz"
      sha256 "d39dc8cc3440da1f1b8bcf95323358857aa09d7c533c4b5c66242c7403570140"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.25.0/app-store-connect-mcp_0.25.0_linux_amd64.tar.gz"
      sha256 "7c5e0986a641a58d6b73f788cc104e8492e8ae046fa145ec9a58aca0621e5315"
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
