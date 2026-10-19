# Library — durable knowledge per business

One brain = one business. Library holds what survives sessions. STATUS holds where we are.

## Layout

```
brain/library/
  inbox/          raw captures, unreviewed. Anything lands here first.
  people/         one file per person. Compiled truth on top, provenance below.
  companies/      one file per org/customer/partner.
  ideas/          concepts, bets, insights. One file per idea.
  CONTRADICTIONS.md  conflicts awaiting resolution (never silent overwrite)
```

## Page pattern (gbrain-style, file-only)

```md
# Name
> Compiled truth: 3-5 lines, current best answer.

## Facts
- fact (source: <where/who/date>)

## Timeline
- YYYY-MM-DD: what changed + source
```

- Truth rewrites freely, timeline appends only. No fact without source.
- Cross-refs use wiki-link slugs, where the slug is the target's frontmatter `id` or filename (e.g. link to a page with `id: acme-example`). Run `scripts/lint-links.sh`. Shape examples live in `examples/`, not here.
- Hot (STATUS/HANDOFF/people-active) vs cold (archive). Librarian promotes/demotes weekly.

## Inbox discipline

1. Capture fast to `inbox/<YYYY-MM-DD-slug>.md` with source.
2. Librarian triage (weekly or `/librarian`): promote to people/companies/ideas, link, or drop.
3. Inbox must empty. Stale inbox > 14 days = FAIL in doctor.

## Don't store

Secrets, tokens, keys, personal data beyond need. See `docs/MEMORY-BOUNDARIES.md`.
