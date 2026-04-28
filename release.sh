#!/bin/bash
# Create a full plugin release on both repos:
#  1. payit2-campaign-assistant — bump plugin.json, build zip, commit, push, GitHub release
#     (the release workflow attaches the zip automatically; we also upload locally as a backup)
#  2. payit2-plugins-marketplace — bump the git-subdir SHA pointer in marketplace.json to the
#     new plugin commit, commit, push, GitHub release (the release workflow rebuilds all zips
#     from the pinned SHA and attaches them to the release)
#
# The marketplace repo does NOT contain plugin source files. It is index-only and uses
# git-subdir + a SHA pointer to fetch the plugin at build time. Do not rsync plugin files
# into it — that creates a phantom subdirectory that diverges from the source of truth.
#
# Usage:
#   ./release.sh <version> "<release title>" ["<release notes>"]
#
# Examples:
#   ./release.sh v1.7.0 "v1.7.0 — New feature"
#   ./release.sh v1.7.0 "v1.7.0 — New feature" "Added /analyze command"

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
MARKETPLACE_DIR="$REPO_DIR/../payit2-plugins-marketplace"
ZIP_NAME="payit2-campaign-assistant.zip"
MARKETPLACE_JSON="$MARKETPLACE_DIR/.claude-plugin/marketplace.json"

VERSION="${1:-}"
TITLE="${2:-}"
NOTES="${3:-Plugin zip attached. See CHANGELOG.md for details.}"

if [[ -z "$VERSION" || -z "$TITLE" ]]; then
  echo "Usage: ./release.sh <version> \"<title>\" [\"<notes>\"]"
  echo "  Example: ./release.sh v1.7.0 \"v1.7.0 - New feature\""
  exit 1
fi

if [[ ! "$VERSION" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Error: version must be of the form vX.Y.Z (got: $VERSION)"
  exit 1
fi

if [[ ! -d "$MARKETPLACE_DIR" ]]; then
  echo "Error: marketplace repo not found at $MARKETPLACE_DIR"
  echo "Clone it first: git clone https://github.com/PayIt2/payit2-plugins-marketplace.git"
  exit 1
fi

if [[ ! -f "$MARKETPLACE_JSON" ]]; then
  echo "Error: $MARKETPLACE_JSON not found"
  exit 1
fi

SEMVER="${VERSION#v}"
PLUGIN_JSON="plugin/.claude-plugin/plugin.json"

# ---------- Plugin repo ----------

cd "$REPO_DIR"

echo "==> Updating version in $PLUGIN_JSON to $SEMVER..."
python3 -c "
import json
with open('$PLUGIN_JSON') as f:
    data = json.load(f)
data['version'] = '$SEMVER'
with open('$PLUGIN_JSON', 'w') as f:
    json.dump(data, f, indent=2)
    f.write('\n')
"

echo ""
echo "==> Building plugin zip..."
./build-plugin.sh

echo ""
echo "==> Committing and pushing plugin repo..."
git add -A
if git diff --cached --quiet; then
  echo "    (nothing to commit)"
else
  git commit -m "release: $VERSION"
fi
git push

PLUGIN_SHA=$(git rev-parse HEAD)
echo "    Plugin commit: $PLUGIN_SHA"

echo ""
echo "==> Creating GitHub release $VERSION on payit2-campaign-assistant..."
gh release create "$VERSION" "$ZIP_NAME" \
  --title "$TITLE" \
  --notes "$NOTES"

# ---------- Marketplace repo ----------

cd "$MARKETPLACE_DIR"

echo ""
echo "==> Preparing marketplace repo..."
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$CURRENT_BRANCH" != "main" ]]; then
  echo "    Marketplace was on '$CURRENT_BRANCH'. Switching to main..."
  if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "Error: marketplace repo has uncommitted changes on '$CURRENT_BRANCH'."
    echo "       Stash or commit them, then re-run."
    exit 1
  fi
  git checkout main
fi
git pull --ff-only

echo ""
echo "==> Bumping marketplace.json SHA pointer to $PLUGIN_SHA..."
python3 -c "
import json
with open('$MARKETPLACE_JSON') as f:
    data = json.load(f)
for plugin in data.get('plugins', []):
    if plugin.get('name') == 'payit2-campaign-assistant':
        plugin['source']['sha'] = '$PLUGIN_SHA'
        break
else:
    raise SystemExit('payit2-campaign-assistant entry not found in marketplace.json')
with open('$MARKETPLACE_JSON', 'w') as f:
    json.dump(data, f, indent=2)
    f.write('\n')
"

echo ""
echo "==> Committing and pushing marketplace repo..."
git add .claude-plugin/marketplace.json
if git diff --cached --quiet; then
  echo "    (nothing to commit in marketplace)"
else
  git commit -m "release: bump campaign-assistant pointer to $VERSION

Updates the git-subdir SHA pointer to the $VERSION release commit on
payit2-campaign-assistant ($PLUGIN_SHA). The release workflow rebuilds
zips from this SHA when the marketplace release is published."
fi
git push

echo ""
echo "==> Creating GitHub release $VERSION on payit2-plugins-marketplace..."
echo "    The release workflow will build and attach the marketplace + plugin + skill zips."
gh release create "$VERSION" \
  --title "$TITLE" \
  --notes "$NOTES

---

**Sourced from:** https://github.com/PayIt2/payit2-campaign-assistant/releases/tag/$VERSION
**Pinned SHA:** \`$PLUGIN_SHA\`

The marketplace zips (full plugin + per-skill) are built and attached automatically by the release workflow."

echo ""
echo "Done! Released $VERSION to both repos."
echo "  Plugin:      https://github.com/PayIt2/payit2-campaign-assistant/releases/tag/$VERSION"
echo "  Marketplace: https://github.com/PayIt2/payit2-plugins-marketplace/releases/tag/$VERSION"
echo ""
echo "The marketplace release workflow takes ~20s to attach all zips."
echo "Tail it with:"
echo "  gh run watch --repo PayIt2/payit2-plugins-marketplace \$(gh run list --repo PayIt2/payit2-plugins-marketplace --workflow=release.yml --limit=1 --json databaseId -q '.[0].databaseId')"
