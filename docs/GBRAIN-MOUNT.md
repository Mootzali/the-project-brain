# Upgrade path: mount these files as gbrain sources (no rewrite)

This template is file-only day-one. If a business outgrows grep — 10k+ pages, need semantic search, synthesis, multi-client — mount it into gbrain instead of migrating.

## Idea (gbrain model: brain ⊥ source)

- **Brain** = database (your personal/company Postgres or PGLite).
- **Source** = repo inside that brain (this clone is one source).
- Files stay source of truth. gbrain indexes them; deletes in git become soft-deletes in DB. DB-only state (embeddings, graph edges, history) needs separate DB backup — markdown export is not a full backup.

## When to mount

- Retrieval hurts (grep misses paraphrases, 100+ library pages).
- You want `gbrain think` (cited answer + gaps) over `/think` (file-only version here).
- You want always-on ingestion (email/calendar/voice → pages while you sleep).
- Multiple businesses need one query surface with per-source grants.

Until then, don't pay server costs. Files + `/think` + `/librarian` carry far.

## How (per business clone)

```bash
bun install -g github:garrytan/gbrain
gbrain init --pglite --no-embedding   # keyless start, zero server
gbrain import ~/my-business/brain --no-embed
gbrain search "phrase from a note" --json
# later: add embeddings, then:
# gbrain sources add my-business ~/my-business/brain --profile company-brain
# gbrain schema use gbrain-base-v2   # or keep our 4-dimension layout via custom pack
```

Keep our layout: `topics/` maps to gbrain page types via custom schema pack (`schema detect → suggest → review`), `library/people|companies` map to `person|company`. Links `[[id]]` become typed edges.

## What changes, what doesn't

- Unchanged: PROJECT/MAP/STATUS/DECISIONS/HANDOFF discipline, inbox→promote, CONTRADICTIONS, judgment division.
- Added: hybrid retrieval (vector+BM25+RRF), graph traversal, `think` synthesis, dream-cycle crons, OAuth-scoped team access.
- Watch: sources organize, they don't isolate local-file readers. Multi-tenant isolation needs Postgres + grants + visibility filters, not just folders. Read gbrain sharing boundaries before team mount.
