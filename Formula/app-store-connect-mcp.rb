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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.10.0/app-store-connect-mcp_0.10.0_darwin_arm64.tar.gz"
      sha256 "0feb3df540cf26090976030ab9311f65c4640bf6d3bf08470ee7207bf987b278"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.10.0/app-store-connect-mcp_0.10.0_darwin_amd64.tar.gz"
      sha256 "097edf9248928cc649502843d56b9bbe0b669553f28caac792ad1d31e465ff7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.10.0/app-store-connect-mcp_0.10.0_linux_arm64.tar.gz"
      sha256 "8ad94eaeea20198e6e77e41ebd1dff24545b8a9b57008052458f48efd9dc7322"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.10.0/app-store-connect-mcp_0.10.0_linux_amd64.tar.gz"
      sha256 "9d73bbae54e0861299824057c011eaebbb48252c5ff0977fcf016b986a76f678"
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
