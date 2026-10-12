# Team + git discipline (small team mode)

One checkout, several humans + AI windows. Isolation beats discipline — use branches/worktrees when streams can diverge. Below is for shared checkout.

## Roster (copy into MAP.md §4)

| Person | Role | Owns | Current focus |
|--------|------|------|---------------|
| TODO name | owner/dev/ops | dirs/areas | TODO |
| AI windows | agent | own workstream only | named per workstream |

## Rules

1. Shared staging area: never `commit -a`, `add -A`, `add .`. Stage by name. Check `git diff --cached --stat` before commit. Staged unknowns = someone mid-commit, wait/ask.
2. Commit only own hunks. Shared file with others' edits: stage own part (`git add -p` human; AI rebuilds index entry from HEAD + own edit, checks `git diff --cached -- <file>` empty first).
3. Shared brain files edited in place: re-read right before edit, targeted change, never whole-file rewrite from stale copy.
4. Write only own STATUS/HANDOFF. Read others', never write them.
5. Prefix commits: `main: ...`, `docs(brain): ...`, `<ws>: ...`. Deploy from commit, not tree.
6. Cross-requests: sender logs "Handed to X (sent)" in own STATUS, owner logs "From Y, done means Z" in theirs. Live ping delivers, ledgers remember. Announce deploys before+after.
