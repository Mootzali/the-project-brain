#!/usr/bin/env bash
# doctor.sh — read-only health check. Reports, never fixes.
set -u
ROOT="${1:-$(dirname "$0")/..}"
fail=0
say() { echo "$1"; }
chk() { if eval "$2"; then say "ok   $1"; else say "FAIL $1"; fail=1; fi; }

chk "brain/PROJECT.md exists" "[ -f $ROOT/brain/PROJECT.md ]"
chk "brain/MAP.md exists" "[ -f $ROOT/brain/MAP.md ]"
chk "brain/STATUS.md exists" "[ -f $ROOT/brain/STATUS.md ]"
chk "brain/DECISIONS.md exists" "[ -f $ROOT/brain/DECISIONS.md ]"
chk "brain/HANDOFF.md exists" "[ -f $ROOT/brain/HANDOFF.md ]"
chk "topics dirs exist" "[ -d $ROOT/brain/topics/systems ] && [ -d $ROOT/brain/topics/operations ] && [ -d $ROOT/brain/topics/planning ] && [ -d $ROOT/brain/topics/feedback ]"
chk "library dirs exist" "[ -d $ROOT/brain/library/inbox ] && [ -d $ROOT/brain/library/people ] && [ -d $ROOT/brain/library/companies ] && [ -d $ROOT/brain/library/ideas ]"
chk "commands exist" "[ -f $ROOT/.claude/commands/start.md ] && [ -f $ROOT/.claude/commands/update.md ] && [ -f $ROOT/.claude/commands/think.md ] && [ -f $ROOT/.claude/commands/librarian.md ] && [ -f $ROOT/.claude/commands/import.md ]"
chk "scripts executable" "[ -x $ROOT/scripts/doctor.sh ] && [ -x $ROOT/scripts/lint-links.sh ] && [ -x $ROOT/scripts/import-notes.sh ] && [ -x $ROOT/scripts/resolver-eval.sh ] && [ -x $ROOT/scripts/new-business.sh ]"
chk "git repo" "[ -d $ROOT/.git ]"

if [ -f "$ROOT/brain/STATUS.md" ]; then
  lines=$(wc -l < "$ROOT/brain/STATUS.md")
  if [ "$lines" -gt 80 ]; then say "FAIL STATUS $lines lines > 80 (trim)"; fail=1; else say "ok   STATUS $lines lines"; fi
fi
if grep -rq "TODO" "$ROOT/brain/PROJECT.md" 2>/dev/null; then say "note PROJECT.md has TODOs (run /start)"; fi
if ! grep -q "Rejected" "$ROOT/brain/DECISIONS.md" 2>/dev/null; then say "FAIL DECISIONS missing rejected alternatives"; fail=1; else say "ok   DECISIONS has rejected-alternatives pattern"; fi
inbox_n=$(find "$ROOT/brain/library/inbox" -type f -name "*.md" 2>/dev/null | wc -l)
say "note inbox has $inbox_n files"
if [ -f "$ROOT/brain/library/CONTRADICTIONS.md" ] && grep -q "\[status: open\]" "$ROOT/brain/library/CONTRADICTIONS.md" 2>/dev/null; then say "note open contradictions (run /librarian)"; fi

exit $fail
