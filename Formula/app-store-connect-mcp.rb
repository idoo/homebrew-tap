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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.21.0/app-store-connect-mcp_0.21.0_darwin_arm64.tar.gz"
      sha256 "a9884641a51774ed77180299782de758e840be1d01d1ca66480f265f0e7a2091"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.21.0/app-store-connect-mcp_0.21.0_darwin_amd64.tar.gz"
      sha256 "435ea995035e00dc3c92d1873578f4a9d70940d04ba2aa481aae40ecd2b57a5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.21.0/app-store-connect-mcp_0.21.0_linux_arm64.tar.gz"
      sha256 "770f2b9302d8954c7583eed1ec71dcd3e54b0e23db5b0c16a210b84620d822c5"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.21.0/app-store-connect-mcp_0.21.0_linux_amd64.tar.gz"
      sha256 "3f2fa6594fd00e0022daa2871e6d4343dc076777dd12de905af6101b0b4e8b92"
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
