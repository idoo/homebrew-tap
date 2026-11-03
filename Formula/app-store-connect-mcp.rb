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
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.22.0/app-store-connect-mcp_0.22.0_darwin_arm64.tar.gz"
      sha256 "cc5bcfaf6fac74f1f33c1c7a4146345bd3aaeb53d0205b6d39a54bb112b085bf"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.22.0/app-store-connect-mcp_0.22.0_darwin_amd64.tar.gz"
      sha256 "b0c772d3243caefbacbd4d492cf3fd49224f99c96cbfbba2d211ae865eb3250d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.22.0/app-store-connect-mcp_0.22.0_linux_arm64.tar.gz"
      sha256 "093b9c09e82f8f54687437a172b129d0cb221d2f7e7a8dd588bb00c4ff943f33"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.22.0/app-store-connect-mcp_0.22.0_linux_amd64.tar.gz"
      sha256 "0313c2810377c261a39544899001451b086497ae9534f7817aa43e676ea1d96c"
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
