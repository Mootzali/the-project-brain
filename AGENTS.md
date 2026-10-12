# Continuity contract (auto-loaded by Claude Code, Codex, Cursor, Copilot)

This repo keeps state in `brain/`, not in chat. Small team + full library mode.

## On session start (or `/start`)

1. Read `brain/MAP.md` + `brain/STATUS.md`. If `brain/HANDOFF.md` non-empty, read it.
2. Optional hooks: merge `templates/claude-code-hooks.settings.json` into `.claude/settings.json` to auto-inject STATUS/HANDOFF (deterministic). Prompts alone usually work; hook guarantees it.
3. If `brain/PROJECT.md` has TODOs → NEW business: interview (definition, who pays, scope, explicit non-goals), fill it, first DECISIONS entry. Don't build until filled.
4. Else → resume: "This is [X], stopped at [now], next [next]." Name workstream/person if team mode. Ask continue, don't silently start.

## During work — commands: /start /update /handoff /decide /think /librarian /import

- Brain-first before re-asking or network. `/think` = cited answer + gaps, not page list.
- STATUS/HANDOFF + mechanical MAP/library registrations = write-then-announce (git is review). DECISIONS/PROJECT/structural MAP = ask-then-write.
- DECISIONS: ask "does this count as decided?", needs rejected alternatives + source. Reversals = new entry.
- Library: inbox first, then promote to people/companies/ideas with source per fact. Conflicts → `CONTRADICTIONS.md`, never silent overwrite. Wiki-link slugs, `lint-links.sh` must pass.
- Topics by problem-dimension: systems/operations/planning/feedback. Same module scatters.

## Team + boundaries (docs/TEAM.md, docs/MEMORY-BOUNDARIES.md)

- One brain = one business. Write own STATUS/HANDOFF only. Stage own hunks, never `commit -a`. Prefix commits.
- Durable facts yes, transient todos/config/scratch no. Secrets/PII never in brain/.

## What not to do

- Don't mix businesses, don't invent source, don't whole-file rewrite shared files from stale copy.
