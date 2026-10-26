class AppStoreConnectMcp < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/app-store-connect-mcp"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.4.0/app-store-connect-mcp_0.4.0_darwin_arm64.tar.gz"
      sha256 "68e1c08abf6e999fbc2b92df0554e709b9acb16c26a16f28590fb9e130a3eaec"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.4.0/app-store-connect-mcp_0.4.0_darwin_amd64.tar.gz"
      sha256 "121414c72bef33f20bf4d146ff79146f561619dcf5965f50b2dfa990dc909b79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.4.0/app-store-connect-mcp_0.4.0_linux_arm64.tar.gz"
      sha256 "92170cd0534579ea435c5ed0efa49c5d1bee443391518065960710f0ab31976c"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.4.0/app-store-connect-mcp_0.4.0_linux_amd64.tar.gz"
      sha256 "4fb3ef07a2804da757042e4986ee2a18c7914ff3bf6bc055709c62f6c042b3f0"
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
