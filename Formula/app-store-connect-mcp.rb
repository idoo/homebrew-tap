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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.18.0/app-store-connect-mcp_0.18.0_darwin_arm64.tar.gz"
      sha256 "792555d57b59553ab95022e9061d38ca4b3ef99066b10514062f3231e45b8d49"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.18.0/app-store-connect-mcp_0.18.0_darwin_amd64.tar.gz"
      sha256 "24eaccb7baa6e400a378df973218cc3048966d450b88066e53b296f8a629ae90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.18.0/app-store-connect-mcp_0.18.0_linux_arm64.tar.gz"
      sha256 "3e707c710be9a94380d66a6dc2fe3febebbe5a7ecde7c4992486d43f7880a643"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.18.0/app-store-connect-mcp_0.18.0_linux_amd64.tar.gz"
      sha256 "90513355547a247c43e784ad93e2f08d3853ae8633860c6330fe2720eb9e2ca7"
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
