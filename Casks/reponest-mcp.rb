# DEPRECATED-ALIAS: an alias of a current manifest, not a manifest of its own.
# DEPRECATED NAME — the project was renamed from RepoNest to Cinder.
#
# This alias exists so a command saved before the rename keeps working. It
# serves the CURRENT release: the previous version of this file pointed at
# RepoNest v1.8.0, so installing it silently fetched a six-versions-old
# build. Use the new name instead.
#
# Cinder MCP server (macOS)
#
# The MCP stdio server is the AI execution interface for Cinder — the desktop
# app is not required to use it, it reads the same local SQLite database.
#
# Version is stamped by scripts/update-manifests.sh from wails.json
# (info.productVersion) — never edit it by hand.
cask "reponest-mcp" do
  version "2.32.1"
  name "Cinder MCP Server"
  desc "MCP stdio server exposing the Cinder local knowledge base to AI agents"
  homepage "https://github.com/sky-jiangcheng/cinder"
  # NOTE: no `license` stanza — `license` is a FORMULA method, not a Cask
  # one. `brew install --cask` rejects the whole definition with
  # "undefined method 'license' for Cask". The license is MIT; see README.

  on_arm do
    url "https://github.com/sky-jiangcheng/cinder/releases/download/v#{version}/repotory-mcp-darwin-arm64.tar.gz"
    sha256 "3355a40b7a9abcda8ae66f03455153d7602cad9a83c1aabe00b1a801f235b34a"
  end

  on_intel do
    url "https://github.com/sky-jiangcheng/cinder/releases/download/v#{version}/repotory-mcp-darwin-amd64.tar.gz"
    sha256 "e014dd4a132385cad8c44917ae34b160f83e831000fb99457cf2c6c995a7fe89"
  end

  # The tarball stages a single bare `repotory-mcp` at its root; `binary` links
  # it into $(brew --prefix)/bin so `which repotory-mcp` works for
  # `claude mcp add repotory -- $(which repotory-mcp)`.
  binary "repotory-mcp"
end
