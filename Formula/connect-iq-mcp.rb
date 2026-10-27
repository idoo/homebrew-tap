class ConnectIqMcp < Formula
  desc "MCP server for Garmin Connect IQ developers"
  homepage "https://github.com/idoo/connect-iq-mcp"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/connect-iq-mcp/releases/download/v0.1.1/connect-iq-mcp_0.1.1_darwin_arm64.tar.gz"
      sha256 "49674d01362e5a136b39bff266e80acfa502827d42f54d177a438a9765de5302"
    end
    on_intel do
      url "https://github.com/idoo/connect-iq-mcp/releases/download/v0.1.1/connect-iq-mcp_0.1.1_darwin_amd64.tar.gz"
      sha256 "101707a2f98710460ceebd5956d67946166e3b2596de22f1215316a90dab730f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/connect-iq-mcp/releases/download/v0.1.1/connect-iq-mcp_0.1.1_linux_arm64.tar.gz"
      sha256 "791650655726d6db85c08a0232b0ffb5d5f5529fda790a9b92439a31dc52a12c"
    end
    on_intel do
      url "https://github.com/idoo/connect-iq-mcp/releases/download/v0.1.1/connect-iq-mcp_0.1.1_linux_amd64.tar.gz"
      sha256 "f3caf5f3b8444a2a68f91a487715d6019479763c9a381068a284b87c8e7c2fbc"
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
