# the-project-brain

Template project brain for small teams. Clone per business, fill once, resume every session.

Mix: company-brain thesis (org-in-files, librarian, skillify, hygiene) + gbrain (markdown-first, truth+timeline, think+gaps) + project-brain (volatility split, rejected alternatives, judgment division).

## Use per new business

```bash
git clone <this-repo> my-business
cd my-business
rm -rf .git && git init && git add -A && git commit -m "from template"
# in agent:
/start
```

## Commands

`/start` orient/bootstrap · `/update` propose+approve · `/handoff` close window · `/decide` log judgment · `/think` cited answer+gaps · `/librarian` weekly hygiene · `/import` outside notes → inbox

## Layout

```
brain/ PROJECT,MAP,STATUS,DECISIONS,HANDOFF,handoffs/
  topics/systems|operations|planning|feedback
  library/inbox|people|companies|ideas + CONTRADICTIONS.md
.claude/commands/ + skills/project-brain/SKILL.md
templates/claude-code-hooks.settings.json (optional SessionStart inject)
scripts/doctor.sh + lint-links.sh
docs/HYBRID-DESIGN,TEAM,MEMORY-BOUNDARIES
```

## Rules

Brain-first. Judgment in model, state in code/git. Source per fact, conflicts to CONTRADICTIONS, inbox empties, repeats become pages/skills. Own STATUS only, stage own hunks, secrets never in brain/.
