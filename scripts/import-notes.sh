#!/usr/bin/env bash
# import-notes.sh — copy .md files from outside into brain/library/inbox/ with provenance. Never overwrites.
# Usage: scripts/import-notes.sh <src-dir> --kind obsidian|notion|plain --source "label"
set -u
SRC="${1:-}"
KIND="plain"
LABEL="import $(date +%F)"
while [ $# -gt 0 ]; do
  case "$1" in
    --kind) KIND="$2"; shift 2;;
    --source) LABEL="$2"; shift 2;;
    *) shift;;
  esac
done
ROOT="$(dirname "$0")/.."
DEST="$ROOT/brain/library/inbox"
TODAY=$(date +%F)
if [ -z "$SRC" ] || [ ! -d "$SRC" ]; then echo "usage: $0 <src-dir> --kind obsidian|notion|plain --source \"label\""; exit 1; fi
mkdir -p "$DEST"
n=0; skipped=0
while IFS= read -r -d '' f; do
  base=$(basename "$f" .md | tr 'A-Z ' 'a-z-' | tr -cd 'a-z0-9-_')
  [ -z "$base" ] && base="note"
  out="$DEST/${TODAY}-${base}.md"
  i=2
  while [ -e "$out" ]; do out="$DEST/${TODAY}-${base}-$i.md"; i=$((i+1)); done
  {
    echo "# Imported: $(basename "$f" .md)"
    echo "> Source: $LABEL | kind: $KIND | from: $f | date: $(date -u +%FT%TZ)"
    echo ""
    echo "<!-- inbox: unreviewed. /librarian promotes to people/companies/ideas/topics or drops. -->"
    echo ""
    cat "$f"
  } > "$out"
  n=$((n+1))
done < <(find "$SRC" -type f -name "*.md" -print0)
echo "imported $n files -> brain/library/inbox/ (source: $LABEL, kind: $KIND)"
echo "next: /librarian to triage"
