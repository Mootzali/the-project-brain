#!/usr/bin/env bash
# lint-links.sh — verify [[wiki-links]] resolve to brain files by id/slug. Read-only.
set -u
ROOT="${1:-$(dirname "$0")/..}"
fail=0
# collect candidate slugs: filenames without ext under brain/
mapfile -t files < <(find "$ROOT/brain" -type f -name "*.md" | sort)
declare -A slugs
for f in "${files[@]}"; do
  base=$(basename "$f" .md)
  slugs["$base"]=1
  # also frontmatter id: if present
  id=$(grep -m1 -E "^id:" "$f" 2>/dev/null | sed -E 's/^id:[[:space:]]*//;s/[\"'\'']//g' | tr -d '[:space:]')
  if [ -n "$id" ]; then slugs["$id"]=1; fi
done
# check links
while IFS= read -r -d '' f; do
  while IFS= read -r link; do
    # link like [[people/name]] -> check last segment
    slug=$(echo "$link" | sed -E 's/.*\[\[([^]]+)\]\].*/\1/' | awk -F/ '{print $NF}' | tr -d '[:space:]')
    if [ -z "${slugs[$slug]:-}" ]; then echo "FAIL dangling [[$link]] in $f"; fail=1; fi
  done < <(grep -o "\[\[[^]]*\]\]" "$f" 2>/dev/null || true)
done < <(find "$ROOT/brain" -type f -name "*.md" -print0)
[ $fail -eq 0 ] && echo "ok links resolve"
exit $fail
