# Tea Bioinformatics

An Obsidian vault that reconciles Taiwanese tea genetics literature into a knowledge graph.
Pipeline: Zotero → literature notes (`Sources/Literature-Notes/`) → entity notes (`Entities/`)
→ `verified: true` notes exported → DuckDB → Neo4j → web app. The export and graph stages
aren't built yet.

The project's value is reconciling sources honestly, so every claim in a note should trace to
a specific source, and disagreements between sources get recorded rather than smoothed over.

**Resolving conflicts: newest source wins.** Record every side, then decide for the source whose
date is closest to today: its publication year, or for an undated web page (e.g. the TBRS
cultivar pages) its capture date in `docs/markdown_pdf/`. Write
`Decision: use [[citekey]] (year). Reason: Newest-source rule. ...`, keep any caveat, and keep the
losing value visible as "superseded". Leave `Decision: pending` only when the disagreement is
inside one source or the sources share a year. A person still reviews before `verified: true`.

The rule applies only when sources answer the same question in the same terms. Different
classification schemes aren't a conflict — e.g. Hu 2023's genetic groups ("Sinensis",
"Hybrid") vs Hu 2014's pedigree types ("SA") vs Lee 2017's species codes. Keep each value as
its own row, labelled with its source and scheme, and leave it out of `conflicts:`.

## Long sessions (auto-compact)

The conversation is compacted automatically when context fills, and only a summary survives.
Work so that nothing depends on the conversation:

- Log each change in `log.md` as you make it, not at the end; put problems found in
  `issues.md`.
- Keep multi-step work in a to-do list (claude-mem `work_state_write` where available) and
  mark items done as they finish.
- Hand per-item work to subagents, as the skills do, so file contents stay out of the main
  context. Ask them for short reports.
- After a compaction, re-read `log.md`, `issues.md`, the to-do list and `git status` before
  continuing, and don't redo finished items.

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
