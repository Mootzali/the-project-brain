# Hybrid design — why this shape

## Borrowed from Garry Tan company-brain thesis
- Org-in-files: `MAP.md §3` resolver (task → doc), skills in `skills/`, trigger = doctor.sh + resume report.
- Judgment in model, state in code: markdown steers, code + git hold truth.
- Librarian: weekly provenance/contradiction/prune pass. Hot (STATUS/HANDOFF) vs cold (topics/archive).
- Skillify-after-correction: repeat fix → permanent `topics/` page or skill, not chat lore.
- Hygiene over volume: source per fact, confident-wrong is worst outcome.

## Borrowed from gbrain
- Markdown is source of truth, anything indexed later rebuilds from it. PGLite/pgvector optional upgrade, never required day-one.
- Page pattern: compiled truth on top, history in git (gbrain does truth+timeline; we do truth + `git log` to stay simple).
- Brain-first lookup + gap note: answer + "what brain doesn't know yet".
- No fixed schema: 4 problem-dimensions, extend per business.

## Borrowed from Ethan-YS/project-brain
- Volatility split: PROJECT (never) / MAP (slow) / STATUS (per session) / DECISIONS (append) / HANDOFF (per switch).
- Rejected alternatives mandatory. Judgment division (user: when, AI: what, user: approve).
- Git mandatory. In-place edits, stage own hunks only.

## Why template-per-business (not mono-brain)
Unrelated business models share no customers, scope, or decisions. Mono-brain mixes STATUS, pollutes retrieval, and forces access scoping you don't need. Clone-per-business keeps blast radius = 1. Share via git template updates, not shared DB. If you later need cross-business memory, add gbrain server with separate sources per business — files here become those sources.
