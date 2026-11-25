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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.29.1/app-store-connect-mcp_0.29.1_darwin_arm64.tar.gz"
      sha256 "cbf7f71b6f6f283b1f6765e76586c27eb3821f1b8902463c8ffb2625bb680103"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.29.1/app-store-connect-mcp_0.29.1_darwin_amd64.tar.gz"
      sha256 "05fd21617a057a9ac00f2d0044c9f2111d30406eb6b228afbdb1338598cb275b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.29.1/app-store-connect-mcp_0.29.1_linux_arm64.tar.gz"
      sha256 "43955c2a6d6ed52afa828d5910f3e62045ed603b0efc7cc2be938bea973ad134"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.29.1/app-store-connect-mcp_0.29.1_linux_amd64.tar.gz"
      sha256 "6a7c55851c6952469a182c90ca5181cf9e0204950ea66608d6cb88cc340e6226"
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
