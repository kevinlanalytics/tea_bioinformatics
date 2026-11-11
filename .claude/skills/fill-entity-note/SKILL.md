---
name: fill-entity-note
description: Create or fill entity notes (Cultivar, Species, Region, Institution, tea process) in Entities/ from the vault's literature notes. For "make a note for TTES No. 12", "fill in the Alishan region", or building out entities named in literature notes.
---

# Fill entity notes

1. Work out which entities are wanted. If the user asks for candidates, collect names from the
   `## Cultivars / Species Mentioned` and `## Regions Mentioned` sections of
   `Sources/Literature-Notes/`, and check which already exist under `Entities/`.
2. Hand each entity to an `entity-note-writer` agent with its type, name, and either the
   existing note path or the folder to create it in. Entities are independent, so run them in
   parallel. Without subagents, follow `.claude/agents/entity-note-writer.md` yourself.
   Keep the brief to the entity's name, type, path and candidate sources. Don't pass
   descriptive facts from general knowledge (locations, Chinese names, product types); the
   writer would have to treat them as unsourced. Facts checked against a source this session
   may be passed with that source named.
3. Report each note's gaps and open questions. The user reviews the notes and flips `verified`.

Conflicts between sources found along the way go into the note's `## Source Conflicts`
section; for a vault-wide pass, suggest `cross-check-sources`.
