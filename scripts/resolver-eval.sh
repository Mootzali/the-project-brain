#!/usr/bin/env bash
# resolver-eval.sh — does the MAP §3 resolver actually route to real files?
# A written route that points nowhere is org-chart theater. This is the performance review.
# Read-only. Exit 1 on failure.
set -u
ROOT="${1:-$(dirname "$0")/..}"
MAP="$ROOT/brain/MAP.md"
fail=0
route() { # route <task-kind> <expected-path-prefix> <hint>
  kind="$1"; expect="$2"; hint="$3"
  # 1. kind mentioned in MAP?
  if ! grep -qiE "$kind" "$MAP"; then echo "FAIL route '$kind' not in MAP §3"; fail=1; return; fi
  # 2. target exists (file or dir with content beyond .gitkeep)?
  if [ -e "$ROOT/$expect" ]; then
    if [ -d "$ROOT/$expect" ]; then
      n=$(find "$ROOT/$expect" -type f -name "*.md" ! -name ".gitkeep" ! -name "_example.md" ! -name "*-example.md" | wc -l)
      if [ "$n" -gt 0 ]; then echo "ok   $kind -> $expect ($n docs)"; else echo "WARN $kind -> $expect exists but empty ($hint)"; fi
    else
      echo "ok   $kind -> $expect"
    fi
  else
    echo "FAIL route '$kind' -> missing $expect ($hint)"; fail=1
  fi
}
echo "--- resolver eval (MAP §3) ---"
route "tests|alter-test" "brain/topics/systems" "add systems doc or fix route"
route "deploy|release" "brain/topics/operations" "add operations doc or fix route"
route "feature|planning" "brain/topics/planning" "add planning doc or fix route"
route "bug|feedback" "brain/topics/feedback" "add feedback doc or fix route"
route "who|think|library" "brain/library" "library missing?"
# full natural-language check: would agent recognize request? manual spot-check list:
echo "--- spot checks (human confirms) ---"
echo "try: 'change a test' loads topics/systems + test files"
echo "try: 'how do I release?' loads topics/operations"
echo "try: 'who is alice?' runs /think over library/"
exit $fail
