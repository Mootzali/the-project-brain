# MAP.md — where is X?

Read every session. Slow-changing. Mechanical registrations = write-then-announce; redesign = ask first.

## 1. Modules

| Area | Path | Owner | Notes |
|------|------|-------|-------|
| TODO: e.g. app | `src/` | TODO (see docs/TEAM.md) | TODO |
| TODO: e.g. docs | `docs/` | TODO | TODO |

## 2. Doc index

| Question | Answer lives |
|----------|--------------|
| How is it designed? | `brain/topics/systems/` |
| How do I run/release it? | `brain/topics/operations/` |
| What are we building next? | `brain/topics/planning/` |
| What are users saying / bugs? | `brain/topics/feedback/` |
| Who / which org / what idea? | `brain/library/people|companies|ideas/` |
| Raw captures? | `brain/library/inbox/` |
| Conflicts? | `brain/library/CONTRADICTIONS.md` |
| Why is it this way? | `brain/DECISIONS.md` |
| Where left off? | `brain/STATUS.md` (+ `HANDOFF.md` if exists) |

Topics index:
- systems: (none yet)
- operations: (none yet)
- planning: (none yet)
- feedback: (none yet)

Library index:
- people: (see `brain/library/people/`)
- companies: (see `brain/library/companies/`)
- ideas: (see `brain/library/ideas/`)

> Rule: when you create `brain/topics/*/*.md` or `brain/library/*/*.md`, register it here in same commit. Links use wiki-link slugs, verified by `scripts/lint-links.sh`.

## 3. Resolver (org-chart routing — company-brain thesis)

| Task kind | Load this first |
|-----------|-----------------|
| Change tests | relevant `topics/systems/*` + test files |
| Deploy/release | `topics/operations/*` |
| New feature | `PROJECT.md` scope check + `topics/planning/*` |
| Bug report | `topics/feedback/*` + `DECISIONS.md` why |
| Who is X / what do we know? | `/think` over `library/` + DECISIONS |

## 4. Team + workstreams (small-team mode, see docs/TEAM.md)

| Person/Window | Role | Owns | Current focus |
|---------------|------|------|---------------|
| TODO owner | owner | everything | TODO |
| TODO dev | dev | src/ | TODO |

Single-workstream default: work in `STATUS.md` / `HANDOFF.md`.
If parallel streams emerge: split to `STATUS_<ws>.md` + roster row per ws. Write own only.

## 5. Interface deps (who to tell before changing)

- (none yet — e.g. "landing URL paths owned by dev, outreach depends on them")

## 6. Calibration

Run `scripts/doctor.sh` + `scripts/lint-links.sh` + `scripts/resolver-eval.sh` or ask "MAP calibration" when map feels stale. Weekly `/librarian` for provenance/contradictions/prune. Imports via `/import` land in inbox first, never direct to library.
