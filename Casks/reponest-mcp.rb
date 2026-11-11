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
  version "2.35.5"
  name "Cinder MCP Server"
  desc "MCP stdio server exposing the Cinder local knowledge base to AI agents"
  homepage "https://github.com/sky-jiangcheng/cinder"
  # NOTE: no `license` stanza — `license` is a FORMULA method, not a Cask
  # one. `brew install --cask` rejects the whole definition with
  # "undefined method 'license' for Cask". The license is MIT; see README.

  on_arm do
    url "https://github.com/sky-jiangcheng/cinder/releases/download/v#{version}/cinder-mcp-#{version}-darwin-arm64.tar.gz"
    sha256 "2e5cbd62f5d379086a0186431a2a1dac6a1120e6af0e053f052f8f6adcfd6718"
  end

  on_intel do
    url "https://github.com/sky-jiangcheng/cinder/releases/download/v#{version}/cinder-mcp-#{version}-darwin-amd64.tar.gz"
    sha256 "b1599fed01bde9590854d46c6756b721df5a9d8bb5c52f7189a36dc2b6779937"
  end

  # The tarball stages `cinder-mcp` plus a `repotory-mcp` symlink; `binary`
  # links both into $(brew --prefix)/bin. The old name is the one every
  # existing client config already points at, so it has to keep resolving.
  binary "cinder-mcp"
  binary "cinder-mcp", target: "repotory-mcp"
end
