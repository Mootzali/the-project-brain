# /librarian — weekly hygiene pass (dream-cycle lite, no server)

Run on demand or weekly. Report, then propose fixes, user approves.

1. Provenance: every fact in `library/people|companies|ideas` has `(source: ...)`? List orphans.
2. Contradictions: new conflicts vs existing? Append to `library/CONTRADICTIONS.md`, never silent overwrite.
3. Inbox: triage `library/inbox/` → promote to people/companies/ideas + link, or drop. Inbox > 14 days = debt.
4. Hot/cold: demote stale STATUS rows to topics/archive, promote oft-linked pages (backlinks = value).
5. Links: run `scripts/lint-links.sh`. Fix dangling `[[...]]`.
6. Skillify: asked twice but not captured? Propose permanent page/skill. Announce all writes.
