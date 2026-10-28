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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.17.0/app-store-connect-mcp_0.17.0_darwin_arm64.tar.gz"
      sha256 "f32cd43e5d12976d6a44bf5f5b3412a46e02e2de50b521485657c2a57a783a5b"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.17.0/app-store-connect-mcp_0.17.0_darwin_amd64.tar.gz"
      sha256 "1c3c5a77dd55c4981b2cd743e167f0b83f12aab9424dd5831ed4ba1f2b5cc086"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.17.0/app-store-connect-mcp_0.17.0_linux_arm64.tar.gz"
      sha256 "2e44f0d8c592c9e159d5258f3129aaeb535be9548f6b8c94499f824cebcc169a"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.17.0/app-store-connect-mcp_0.17.0_linux_amd64.tar.gz"
      sha256 "2fb2d6948c49cb79b839a941f8a1abc7b761bb5796916244d729503689449af6"
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
