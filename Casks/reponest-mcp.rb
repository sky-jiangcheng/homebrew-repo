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
  version "2.32.0"
  name "Cinder MCP Server"
  desc "MCP stdio server exposing the Cinder local knowledge base to AI agents"
  homepage "https://github.com/sky-jiangcheng/cinder"
  # NOTE: no `license` stanza — `license` is a FORMULA method, not a Cask
  # one. `brew install --cask` rejects the whole definition with
  # "undefined method 'license' for Cask". The license is MIT; see README.

  on_arm do
    url "https://github.com/sky-jiangcheng/cinder/releases/download/v#{version}/repotory-mcp-darwin-arm64.tar.gz"
    sha256 "25ab8d91ec0da8265e95e5fca7783f671b3547d780ead6ec4d89e6ae3d743f94"
  end

  on_intel do
    url "https://github.com/sky-jiangcheng/cinder/releases/download/v#{version}/repotory-mcp-darwin-amd64.tar.gz"
    sha256 "f888a43db508ee78d592f5047ed5cbecbd0e721c89153862249016e067c530d1"
  end

  # The tarball stages a single bare `repotory-mcp` at its root; `binary` links
  # it into $(brew --prefix)/bin so `which repotory-mcp` works for
  # `claude mcp add repotory -- $(which repotory-mcp)`.
  binary "repotory-mcp"
end
