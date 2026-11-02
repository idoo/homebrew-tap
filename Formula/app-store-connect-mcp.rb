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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.0/app-store-connect-mcp_0.20.0_darwin_arm64.tar.gz"
      sha256 "46eaa3e84444afdd82043ebcc2a73a6427aee9345f6b4f6a145997adfa562f93"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.0/app-store-connect-mcp_0.20.0_darwin_amd64.tar.gz"
      sha256 "d00f5c2f4b39628d5654e576f2d51d4c259a340c9be312454fdb9b0749aa416b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.0/app-store-connect-mcp_0.20.0_linux_arm64.tar.gz"
      sha256 "b62ba89560c394ba1afe2f5bd384755ebbae2d1c82f7ca64f2d41606943f9ec4"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.20.0/app-store-connect-mcp_0.20.0_linux_amd64.tar.gz"
      sha256 "d94ca403fde26241620d00a8e672996ae3dc1fdbb66ae6a50b6ffe6c417de880"
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
