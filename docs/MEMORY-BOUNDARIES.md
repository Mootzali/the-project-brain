# Memory boundaries

## Durable (goes in brain/)
Preferences, decisions with rejected alternatives, people/companies/ideas with source, interface contracts.

## Transient (stays local, never brain/)
Task todos, harness config, session scratch, keys.

## Never in brain/
Secrets, tokens, API keys, passwords, customer PII beyond need. If a provider needs text (future embeddings/rerank), that's explicit opt-in per file.

## Sharing
Clone-per-business: no cross-business reads. If a future gbrain server mounts these as sources, sources organize — they don't isolate local-file readers. Visibility labels (`visibility: private`) are convention until server enforces.
