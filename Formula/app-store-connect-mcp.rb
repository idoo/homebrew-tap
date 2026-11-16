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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.24.0/app-store-connect-mcp_0.24.0_darwin_arm64.tar.gz"
      sha256 "233f44500d0b3d46b7f0f8b3f705c05eb01bf45c27200cf541dbb8b2676de274"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.24.0/app-store-connect-mcp_0.24.0_darwin_amd64.tar.gz"
      sha256 "cf63155d780ec39d957c8f11405ab9ded51a0d2a762076139a6d1983d9492adf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.24.0/app-store-connect-mcp_0.24.0_linux_arm64.tar.gz"
      sha256 "a9043fe7fa955c142ed7ed0359de8fe266336bf60ad3b99544692135f975e20b"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.24.0/app-store-connect-mcp_0.24.0_linux_amd64.tar.gz"
      sha256 "9c3cd57f1629f7522ed4051abe3749df9ffb236e6911d6f14505e31494f528b2"
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
