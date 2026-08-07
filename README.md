# Tea Bioinformatics

A public knowledge graph (Neo4j/Cypher) reconciling Taiwanese tea cultivar genetics from
fragmented literature, institutional records, and vernacular naming.

## What this is

Tea in Taiwan exists in three genetically and historically distinct lineages — wild endemic
*Camellia formosensis*, introduced/naturalized Assamica-type tea, and institutionally bred
cultivars (TTES No. 1–25+) developed by the Tea Research and Extension Station (TRES) since
1903. The science behind these lineages is real and rigorous, but it's scattered across
peer-reviewed molecular studies (each with its own inconsistent identifier system),
institution-only web pages in English and Chinese with no machine-readable export, and vernacular
names that don't map 1:1 onto official cultivar numbers.

Nobody has reconciled these sources — the studies, the institutional records, and the historical
breeding lineage — into one internally consistent, queryable structure that's honest about where
sources disagree. That reconciliation, not the tea itself, is this project's contribution.

The primary deliverable is a public web application: a map of tea-growing regions plus a
searchable lineage explorer showing how today's commercial cultivars trace back to wild or
historically introduced ancestors. See [`docs/tea-heritage-kg-proposal.qmd`](docs/tea-heritage-kg-proposal.qmd)
for the full proposal and reasoning.

## Repository layout

```
Sources/Literature-Notes/   Per-paper literature notes (one per Zotero citekey)
_templates/                 Obsidian note templates (Zotero Integration import format)
docs/                       Project docs, proposal, execution guide, and PDF→Markdown cache
  note_journal_map.md         Citekey ↔ Zotero item/attachment ↔ PDF path map
  markdown_pdf/                markitdown conversions of each source PDF (generated, gitignored)
  *.qmd                        Proposal, execution guide, workflow recipe, tagging how-to
Tea_Taxonomy/                Working taxonomy notes and synthesis
research_journal/            Progress notes/log
.claude/skills/              Claude Code skills that automate parts of this workflow
zotero/                      Local Zotero reference library (gitignored, not source-controlled)
pyproject.toml               Python deps: neo4j, pandas, duckdb (managed with uv)
```

This is also an **Obsidian vault** — the root directory opens directly in Obsidian, and
`Sources/`, `Tea_Taxonomy/`, and `_templates/` are used through the Obsidian + Zotero Integration
plugin (see [`docs/obsidian-zotero-integration.md`](docs/obsidian-zotero-integration.md)).

## How the pipeline works

The workflow is split into three layers, each with one job, so that every claim in the eventual
graph/web app can be traced back to a specific source and extraction step:

| Layer | Tool | Responsibility |
|---|---|---|
| Capture | Zotero | Collect and tag source literature (papers, TRES bulletins, database records) |
| Synthesis | Obsidian | Human-readable literature notes, linking, AI-assisted summarization (clearly labeled) |
| Execution | Claude Code (CLI) | Data pipeline, extraction, and knowledge graph construction with filesystem/execution access |

Downstream of that: extracted data is staged and validated in DuckDB, loaded into a Neo4j AuraDB
graph over Cypher, analyzed with Neo4j GDS, then exported to static JSON for a D3/Leaflet web app
deployed on GitHub Pages. Full step-by-step details are in
[`docs/km-workflow-recipe.qmd`](docs/km-workflow-recipe.qmd) and
[`docs/tea-kg-execution-guide.qmd`](docs/tea-kg-execution-guide.qmd).

## Literature notes

Each source paper gets one note in `Sources/Literature-Notes/<citekey>.md`, generated from
`_templates/literature-note-template.md` via the Obsidian Zotero Integration plugin, then filled
in with the paper's key claims, cultivars/species mentioned, regions, methods, and any conflicts
with other sources in the vault.

[`docs/note_journal_map.md`](docs/note_journal_map.md) is the ground-truth map between each
note's citekey, its Zotero item/attachment keys, and its source PDF path — kept in sync by the
`refresh-literature-notes` Claude Code skill described below.

### `refresh-literature-notes` Claude Code skill

`.claude/skills/refresh-literature-notes/` automates the extraction step: it detects new PDFs in
Zotero or new (but still `unread`) literature notes, updates `note_journal_map.md`, converts each
PDF to Markdown with [markitdown](https://github.com/microsoft/markitdown), and rewrites the
corresponding note strictly from that converted text — no outside knowledge, nothing pulled from
other papers. See the skill's own `SKILL.md` for the full step-by-step contract.

This skill depends on a local [markitdown](https://github.com/microsoft/markitdown) checkout with
its venv built (path is configurable via the `MARKITDOWN_BIN` env var; see
`scripts/convert_pdf.sh`), and reads directly from a local Zotero installation's `zotero.sqlite`.

## Getting started

Requirements:
- Python 3.12+ and [uv](https://docs.astral.sh/uv/)
- [Obsidian](https://obsidian.md/) (to browse/edit the vault as intended)
- [Zotero](https://www.zotero.org/) with the Better BibTeX and Zotero Integration plugins (for
  literature capture and note generation)
- [Claude Code](https://claude.com/claude-code) (for the extraction/graph-construction pipeline
  and the `refresh-literature-notes` skill)

```bash
uv sync
```

Open the repository root as a vault in Obsidian to browse notes with full linking.

## Documentation index

| Doc | Covers |
|---|---|
| [`docs/tea-heritage-kg-proposal.qmd`](docs/tea-heritage-kg-proposal.qmd) | Full project proposal: background, objectives, methods, tech stack, cost/time analysis |
| [`docs/tea-kg-execution-guide.qmd`](docs/tea-kg-execution-guide.qmd) | Hands-on setup/execution guide: accounts, environment, literature-to-graph-to-web pipeline |
| [`docs/km-workflow-recipe.qmd`](docs/km-workflow-recipe.qmd) | The Zotero → Obsidian → Claude Code knowledge-management workflow, step by step |
| [`docs/tagging-taxonomy-howto.qmd`](docs/tagging-taxonomy-howto.qmd) | How to build and apply the tagging taxonomy used across literature notes |
| [`docs/obsidian-zotero-integration.md`](docs/obsidian-zotero-integration.md) | Obsidian + Zotero Integration plugin setup, troubleshooting history |
| [`docs/note_journal_map.md`](docs/note_journal_map.md) | Citekey ↔ Zotero ↔ PDF map for every literature note |

## Status

Early-stage and actively evolving. Literature capture and note synthesis are underway; the
DuckDB staging, Neo4j graph construction, and public web application are not yet built. See the
proposal doc's Part 6 for the current time/cost-constrained roadmap.

## License

[CC BY-NC 4.0](LICENSE) — free to share and adapt for academic, research, or personal/hobby use
with attribution; commercial use is not permitted. Third-party PDFs and other primary sources
referenced by this project are not included in the repo and remain under their own copyright.

## Author

Kevin Lan
