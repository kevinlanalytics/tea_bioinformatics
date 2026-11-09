# Tea Bioinformatics

An Obsidian vault that reconciles Taiwanese tea genetics literature into a knowledge graph.
Pipeline: Zotero → literature notes (`Sources/Literature-Notes/`) → entity notes (`Entities/`)
→ `verified: true` notes exported → DuckDB → Neo4j → web app. The export and graph stages
aren't built yet.

The project's value is reconciling sources honestly, so every claim in a note should trace to
a specific source, and disagreements between sources get recorded rather than smoothed over.

## Gotchas

- Source PDFs live in `/Users/kevinlan/Zotero/storage/<attachment_key>/`;
  `docs/note_journal_map.md` is the authoritative citekey ↔ Zotero item ↔ PDF map.
- `docs/markdown_pdf/` is a gitignored markitdown cache; regenerate it, don't hand-edit it.
- Two template engines live here: Zotero Integration (Nunjucks `{{ }}`) renders
  `_templates/literature-note-template.md`; Templater (`<% %>`) renders `_templates/Notes/`.
  Hyphenated frontmatter fields need bracket access in Templater: `tp.frontmatter["name-zh"]`.
- Literature notes are created by the Obsidian plugin, not by hand; their bibliographic
  frontmatter comes from Zotero.
- `verified: false` on an entity note is the export gate — a human flips it after review.
- Setup and troubleshooting history for the Obsidian plugins: `docs/setup-guide/`.

## Skills and agents

Skills in `.claude/skills/` (Codex sees them via the `.agents/skills` symlink) run the
workflows: `refresh-literature-notes`, `fill-entity-note`, `cross-check-sources`. Each hands
per-item work to a subagent in `.claude/agents/` — `paper-extractor`, `entity-note-writer`,
`source-conflict-reviewer` — whose file is also the procedure to follow when subagents
aren't available.
