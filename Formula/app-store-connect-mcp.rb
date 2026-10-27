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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.15.0/app-store-connect-mcp_0.15.0_darwin_arm64.tar.gz"
      sha256 "dfdfb299415c95a890b12d8a25301f14b12d09b2f0d620eba9ddd82c152a6f68"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.15.0/app-store-connect-mcp_0.15.0_darwin_amd64.tar.gz"
      sha256 "43353e88dc19727e4689c96423c8a15e81d6e7b3bd3071e335d81a88a8e4d64b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.15.0/app-store-connect-mcp_0.15.0_linux_arm64.tar.gz"
      sha256 "78ae6d63894232c5afa88c0d52b78e154b9d378202e8249fb571f6ffc0ca8e0d"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.15.0/app-store-connect-mcp_0.15.0_linux_amd64.tar.gz"
      sha256 "87fd4648cd0e6213a695265f095d3f193e024511696038698ca9f9cc975e15db"
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
