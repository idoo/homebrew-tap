class AppStoreConnectMcp < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/app-store-connect-mcp"
  version "0.7.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.7.0/app-store-connect-mcp_0.7.0_darwin_arm64.tar.gz"
      sha256 "0716e92d4db9229f3d0ea643f0ee63439c90dd0d29bc90a620007ea24ed0ce9c"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.7.0/app-store-connect-mcp_0.7.0_darwin_amd64.tar.gz"
      sha256 "2eebbd18ca45636a8c0e7494b3ca93e66dbadc8da6d24a6ef9621725bb8ca2e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.7.0/app-store-connect-mcp_0.7.0_linux_arm64.tar.gz"
      sha256 "788ad323804aaef283b97aa0ec98abecb5fa048ee6f66a3f9b18ba468ad390d3"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.7.0/app-store-connect-mcp_0.7.0_linux_amd64.tar.gz"
      sha256 "4a92d2f11ae791c2d182d749fadd50c2ca123baf537701132356beecfb86f5cc"
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
