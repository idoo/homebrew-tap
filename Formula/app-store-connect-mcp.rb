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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.16.0/app-store-connect-mcp_0.16.0_darwin_arm64.tar.gz"
      sha256 "8c519041fa41a274a86cb7ca713fd28aa0fca4dad51e776f81f04a861f3729d4"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.16.0/app-store-connect-mcp_0.16.0_darwin_amd64.tar.gz"
      sha256 "aadbcd0ce36f3bb014f641851109f7bec3753b441bc5a72c612857224f7c7c92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.16.0/app-store-connect-mcp_0.16.0_linux_arm64.tar.gz"
      sha256 "9b0db797a226f908010e5e3d3e46ecefde88bdb9854a077f329c9d3e283c6746"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.16.0/app-store-connect-mcp_0.16.0_linux_amd64.tar.gz"
      sha256 "ef3f28e44dbcdf8277235444c112fe37541da1a1a14cc25c729bff3475a4e012"
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
