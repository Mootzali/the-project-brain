# the-project-brain

Template project brain for small teams. Clone per business, fill once, resume every session.

Mix: company-brain thesis (org-in-files, librarian, skillify, hygiene) + gbrain (markdown-first, truth+timeline, think+gaps) + project-brain (volatility split, rejected alternatives, judgment division).

## Start a new business (pick one)

**A. GitHub template (no clone history):**
```bash
gh repo create my-business --private --template Mootzali/the-project-brain --clone
cd my-business
# agent: /start
```

**B. Local script:**
```bash
git clone https://github.com/Mootzali/the-project-brain.git
./the-project-brain/scripts/new-business.sh ~/Codes/my-business
cd ~/Codes/my-business
# agent: /start
```

**C. Plain clone + reset history:**
```bash
git clone https://github.com/Mootzali/the-project-brain.git my-business
cd my-business && rm -rf .git && git init -b main && git add -A && git commit -m "from template"
# agent: /start
```

Do NOT edit the template repo directly for business work. One brain = one business. Improve the template here, pull changes into clones deliberately.

## First `/start` vs later

- First `/start` in a fresh clone → interviews you (one-line definition, who pays, scope, explicit non-goals), fills `brain/PROJECT.md`, logs first decision. No code before this.
- Later `/start` → reads `MAP + STATUS (+ HANDOFF)` and reports "this is X, stopped at Y, next Z". No re-explaining.

## Commands

`/start` orient/bootstrap · `/update` propose+approve · `/handoff` close window · `/decide` log judgment · `/think` cited answer+gaps · `/librarian` weekly hygiene · `/import` outside notes → inbox

## Layout

```
brain/ PROJECT,MAP,STATUS,DECISIONS,HANDOFF,handoffs/
  topics/systems|operations|planning|feedback
  library/inbox|people|companies|ideas + CONTRADICTIONS.md
.claude/commands/ + skills/project-brain/SKILL.md
templates/claude-code-hooks.settings.json (optional SessionStart inject)
scripts/ doctor.sh, lint-links.sh, resolver-eval.sh, import-notes.sh, new-business.sh
docs/ HYBRID-DESIGN, TEAM, MEMORY-BOUNDARIES, GBRAIN-MOUNT
examples/ page shapes (not live brain)
```

## Rules

Brain-first. Judgment in model, state in code/git. Source per fact, conflicts to CONTRADICTIONS, inbox empties, repeats become pages/skills. Own STATUS only, stage own hunks, secrets never in brain/.
