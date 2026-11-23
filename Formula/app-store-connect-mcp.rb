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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.28.0/app-store-connect-mcp_0.28.0_darwin_arm64.tar.gz"
      sha256 "ce75452d6be2b8496f561c693dcf7eef9975d8c2510b5ba680ca39f2ae7620a4"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.28.0/app-store-connect-mcp_0.28.0_darwin_amd64.tar.gz"
      sha256 "a37884c54ec8f81d15b98710c8c717a2e175a9f049e84c18e0a9523fa289aa6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.28.0/app-store-connect-mcp_0.28.0_linux_arm64.tar.gz"
      sha256 "65b8e967960e590d8d0d29c35119c69d4aa7ffa448199355e17b10ceba9325ea"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.28.0/app-store-connect-mcp_0.28.0_linux_amd64.tar.gz"
      sha256 "79b9ec1e515847060350c9a2df716d1de6ca6640565ef30cd91a384783760c12"
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
