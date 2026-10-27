class ConnectIqMcp < Formula
  desc "MCP server for Garmin Connect IQ developers"
  homepage "https://github.com/idoo/connect-iq-mcp"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/connect-iq-mcp/releases/download/v0.1.0/connect-iq-mcp_0.1.0_darwin_arm64.tar.gz"
      sha256 "e23148a628a0e612a37962e2a4f0ec34a5aef0b7b73d391f5e99af5ff350d416"
    end
    on_intel do
      url "https://github.com/idoo/connect-iq-mcp/releases/download/v0.1.0/connect-iq-mcp_0.1.0_darwin_amd64.tar.gz"
      sha256 "ed9dea8d7207647dec7b2218368dfef141ffd13dfbb9127c019fd2d369229c23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/connect-iq-mcp/releases/download/v0.1.0/connect-iq-mcp_0.1.0_linux_arm64.tar.gz"
      sha256 "76cc2acdb3f5e5756c38f8b83ce06dd926e1bb4264af201f5f9783988a4e5cf0"
    end
    on_intel do
      url "https://github.com/idoo/connect-iq-mcp/releases/download/v0.1.0/connect-iq-mcp_0.1.0_linux_amd64.tar.gz"
      sha256 "bc60a2f87b0d7c1a87e1982b3ebe4f00249b5097cee7f6b5019207a8ce372668"
    end
  end

  def install
    bin.install "connect-iq-mcp"
  end

  def caveats
    <<~TEXT
      Sign in to the Connect IQ developer portal once, then connect your client:
        connect-iq-mcp auth login
        connect-iq-mcp config install <client>   # claude-code, claude-desktop, codex, cursor, vscode, windsurf
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/connect-iq-mcp version")
  end
end
