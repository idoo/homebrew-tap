class AscMcp < Formula
  desc "App Store Connect MCP server: ship iOS and macOS apps from your agent"
  homepage "https://github.com/idoo/app-store-connect-mcp"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.2.0/asc-mcp_0.2.0_darwin_arm64.tar.gz"
      sha256 "7860a6234aff04a319e1362ff06f36198d770b0a197ce990bc7f6de0932c56a7"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.2.0/asc-mcp_0.2.0_darwin_amd64.tar.gz"
      sha256 "3dad3af7e12beeee6bb329c9eba6fa084429d018044d26f0143650e848bd31af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.2.0/asc-mcp_0.2.0_linux_arm64.tar.gz"
      sha256 "893d8f27a7d855f5ac9a0d77968362467a3164d041ba618d5730de8d8dad5abb"
    end
    on_intel do
      url "https://github.com/idoo/app-store-connect-mcp/releases/download/v0.2.0/asc-mcp_0.2.0_linux_amd64.tar.gz"
      sha256 "c7e099e674d6d57798936536fc748ce74f41391cd8291f8c293d959814ffea9d"
    end
  end

  def install
    bin.install "asc-mcp"
  end

  def caveats
    <<~TEXT
      asc-mcp needs an App Store Connect API key:
        App Store Connect > Users and Access > Integrations > App Store Connect API
      Then register it and connect your client:
        asc-mcp auth import
        asc-mcp config install <client>   # claude-code, claude-desktop, codex, cursor, vscode, windsurf
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc-mcp version")
  end
end
