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
  version "2.35.1"
  name "Cinder MCP Server"
  desc "MCP stdio server exposing the Cinder local knowledge base to AI agents"
  homepage "https://github.com/sky-jiangcheng/cinder"
  # NOTE: no `license` stanza — `license` is a FORMULA method, not a Cask
  # one. `brew install --cask` rejects the whole definition with
  # "undefined method 'license' for Cask". The license is MIT; see README.

  on_arm do
    url "https://github.com/sky-jiangcheng/cinder/releases/download/v#{version}/cinder-mcp-#{version}-darwin-arm64.tar.gz"
    sha256 "f0213cea025e6d4fdcb5a6b00c9aa24460a77b4f5f901dbc694b84001a4043e1"
  end

  on_intel do
    url "https://github.com/sky-jiangcheng/cinder/releases/download/v#{version}/cinder-mcp-#{version}-darwin-amd64.tar.gz"
    sha256 "69f0d3f6ce922d22c0f17c9e9edd8bb43b2bd2ceb1bf9686e3bdbdff0d0ae878"
  end

  # The tarball stages `cinder-mcp` plus a `repotory-mcp` symlink; `binary`
  # links both into $(brew --prefix)/bin. The old name is the one every
  # existing client config already points at, so it has to keep resolving.
  binary "cinder-mcp"
  binary "cinder-mcp", target: "repotory-mcp"
end
