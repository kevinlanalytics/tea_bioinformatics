---
name: cross-check-sources
description: Find factual disagreements between the vault's sources (rankings, taxonomy, parentage, dates, places) and record them in both notes' conflict sections. Use after refreshing literature notes or filling entities, or when asked to check sources for conflicts.
---

# Cross-check sources

1. Choose the scope: the notes touched in this session, the ones the user named, or all of
   `Sources/Literature-Notes/` plus `Entities/`.
2. Hand the scope to a `source-conflict-reviewer` agent; it needs the whole set in one context
   to compare claims. Without subagents, follow `.claude/agents/source-conflict-reviewer.md`
   yourself.
3. Pass on its summary: the conflicts found, and anything it was unsure about.
