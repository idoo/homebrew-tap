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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.26.1/app-store-connect-mcp_0.26.1_darwin_arm64.tar.gz"
      sha256 "a91e41d6b1069e0cb948f230eea90e673b32c15af08941005c06481e8b571cf3"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.26.1/app-store-connect-mcp_0.26.1_darwin_amd64.tar.gz"
      sha256 "1638d3e3952e1f6b6221e376ddc9a2f0032ad0124a774b796b3a5f196495e63b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.26.1/app-store-connect-mcp_0.26.1_linux_arm64.tar.gz"
      sha256 "2a882561c605dcbc721a1d4064b8e4408b05545ff98177901aa27885a6ae2bfd"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.26.1/app-store-connect-mcp_0.26.1_linux_amd64.tar.gz"
      sha256 "f0e600e0f56e2c1836da1999267ec44684d18d7f8ba9e1e22d02436160a9d362"
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
