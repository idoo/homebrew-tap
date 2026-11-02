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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.1/app-store-connect-mcp_0.20.1_darwin_arm64.tar.gz"
      sha256 "d987ea4e773f5a907af9509f3e4e87b03c68c3af68bb621bb409c935b7b3b69e"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.1/app-store-connect-mcp_0.20.1_darwin_amd64.tar.gz"
      sha256 "dbbc41ec70dbe5042b9cb4e3766b804e172d90df479c7787c274287d64b8d8d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.1/app-store-connect-mcp_0.20.1_linux_arm64.tar.gz"
      sha256 "0125cad594eee5998e9eb543f6e8fb30812050fc7ba510cb6b144ca87709e6be"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.1/app-store-connect-mcp_0.20.1_linux_amd64.tar.gz"
      sha256 "3f6b897a6ae57518a62ed83557541950b8f78e61ba93f10238f548ab1ea9ebfb"
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
