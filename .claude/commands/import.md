# /import — bring outside notes into the brain without rot

You point at a folder (Obsidian vault, Notion export, plain markdown). Nothing is auto-trusted — everything lands in `inbox/` first with provenance, then `/librarian` promotes.

## Steps

1. Ask: source path + kind (`obsidian` | `notion` | `plain`) + what it is ("founder's 5y notes", "support export").
2. Run: `scripts/import-notes.sh <src> --kind <kind> --source "<label>"` — copies `.md` files to `brain/library/inbox/<YYYY-MM-DD-slug>.md`, prepends `Source:` header, never overwrites (suffix `-2`, `-3`).
3. Report: N files landed, list top 5, inbox count now. Remind: run `/librarian` to triage → people/companies/ideas/topics, or drop.
4. Never import secrets. If import contains keys/tokens, stop and flag.

## Rules

- Raw stays raw. Don't rewrite truth during import — promotion rewrites, import preserves.
- One import = one source label. Provenance must survive to promoted pages.
- Notion HTML/CSV exports: convert markdown files only; skip databases you can't read as `.md` (note what was skipped).
