# Example library pages — shape reference only

These are NOT part of the live brain. They show the page pattern (compiled truth → facts with source → timeline → open gaps) and how links work.

They live outside `brain/` on purpose: anything inside `brain/` is treated as real knowledge by `/think` and `/librarian`. Copy a shape, don't copy the fiction.

- `people/alice-example.md` — person page, links to company
- `companies/acme-example.md` — org page, links to person
- `ideas/pricing-bet-example.md` — idea page, links to both

Note the frontmatter `id:` — that's what `[[wiki-links]]` resolve to. `scripts/lint-links.sh` checks them.
