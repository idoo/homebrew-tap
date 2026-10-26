class AppStoreConnectMcp < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/app-store-connect-mcp"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.5.0/app-store-connect-mcp_0.5.0_darwin_arm64.tar.gz"
      sha256 "0c3b9f61f5f3089eb3fc23c6f5a75f1abcd8f873a2e1ae3d8d4f2146c9e505cf"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.5.0/app-store-connect-mcp_0.5.0_darwin_amd64.tar.gz"
      sha256 "daab22d2e0a0698a58cf62bfb85cc73fe8723cb046f2aeae8bd179850184555b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.5.0/app-store-connect-mcp_0.5.0_linux_arm64.tar.gz"
      sha256 "b906fb1c4b10cd3bae5971f214e1013ec5c4a0dbeee68b0180790932c6b4d769"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.5.0/app-store-connect-mcp_0.5.0_linux_amd64.tar.gz"
      sha256 "20d2c6ee79dd22a448d5205b3b9f3d18404ecff358f2288b7f1e6de9a4ff6855"
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
