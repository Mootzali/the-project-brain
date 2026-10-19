#!/usr/bin/env bash
# new-business.sh — start a fresh business brain from this template.
# Usage: scripts/new-business.sh <target-dir> [--from <template-repo-or-path>]
set -eu
TARGET="${1:-}"
if [ -z "$TARGET" ]; then echo "usage: $0 <target-dir> [--from <repo-or-path>]"; exit 1; fi
if [ -e "$TARGET" ] && [ -n "$(ls -A "$TARGET" 2>/dev/null)" ]; then
  echo "FAIL target '$TARGET' exists and is not empty. Pick a new path."; exit 1
fi
SRC="${3:-$(cd "$(dirname "$0")/.." && pwd)}"

mkdir -p "$TARGET"
# copy template, excluding git history and examples
tar -C "$SRC" --exclude=.git --exclude=examples -cf - . | tar -C "$TARGET" -xf -
cd "$TARGET"
git init -q -b main
git add -A
git commit -q -m "brain: scaffold from the-project-brain template"
echo "ok   created $TARGET"
echo ""
echo "next:"
echo "  1. cd $TARGET && <your agent>"
echo "  2. run /start  (interview fills brain/PROJECT.md)"
echo "  3. optional: merge templates/claude-code-hooks.settings.json into .claude/settings.json"
echo "  4. optional: gh repo create <name> --private --source=. --remote=origin --push"
