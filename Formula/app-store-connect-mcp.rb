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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.14.0/app-store-connect-mcp_0.14.0_darwin_arm64.tar.gz"
      sha256 "aa215af7a5dcb746ee5f8250eeb879a1bdc95c73455530e945502f1b53fbd682"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.14.0/app-store-connect-mcp_0.14.0_darwin_amd64.tar.gz"
      sha256 "76bc4cd3415be2fada988a7c3daf9dc7dd005e32ec98d6fb0ccec7cad7bce1dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.14.0/app-store-connect-mcp_0.14.0_linux_arm64.tar.gz"
      sha256 "e28222f5521c53878683e92a661bedcb83c3df45ddc74db044b07f6603839f62"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.14.0/app-store-connect-mcp_0.14.0_linux_amd64.tar.gz"
      sha256 "2188ce7a35736bd49afdc5a766458b01c7d99eee0c9cec04a56179fecde2af31"
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
