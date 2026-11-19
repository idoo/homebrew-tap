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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.26.0/app-store-connect-mcp_0.26.0_darwin_arm64.tar.gz"
      sha256 "310fb742c070a74b0c4448d000a38bc6af029ab4064db5a883808d3ae9b0abcd"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.26.0/app-store-connect-mcp_0.26.0_darwin_amd64.tar.gz"
      sha256 "0c7f0182f193618e722248f0694319526397471627f2c167cff34fab1929ce87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.26.0/app-store-connect-mcp_0.26.0_linux_arm64.tar.gz"
      sha256 "75c2740c8a63b98836ab6f2e6175c24dfd7b8b84ed34253c4deaf29a775167aa"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.26.0/app-store-connect-mcp_0.26.0_linux_amd64.tar.gz"
      sha256 "42d25e301e3c4f3e553fd024648146fcd9f04cf127f4972fad0e5bca9a29edb7"
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
