---
name: refresh-literature-notes
description: Syncs the tea_bioinformatics vault's literature notes with Zotero. Detects PDFs in ~/Zotero/storage or literature notes in Sources/Literature-Notes/ that aren't yet reflected in docs/note_journal_map.md, updates that map, converts each source PDF to Markdown with markitdown, and rewrites the corresponding note strictly from that converted text following _templates/literature-note-template.md. Use whenever the user asks to refresh/update/sync/import literature notes, process new papers or journals, extract a paper into its note, or mentions docs/note_journal_map.md, Sources/Literature-Notes, or markitdown in this project.
---

# Refresh Literature Notes

Keeps `Sources/Literature-Notes/*.md` in sync with the PDFs sitting in the user's Zotero
library, using `docs/note_journal_map.md` as the source of truth for which citekey maps to
which PDF. Every extraction is grounded **only** in the markitdown conversion of that paper's
own PDF — never fill gaps from general knowledge, memory of the paper, or any other source in
the vault.

Run the steps below in order. Steps 1–4 are the user's required workflow; step 5 is a
recommended finishing pass carried over from how this was first done by hand.

## Step 0 — Preconditions

- Run everything with the project root (`tea_bioinformatics/`) as the working directory, since
  the scripts and template paths below are relative to it.
- The four helper scripts in `scripts/` are executable; call them directly, don't re-derive
  their SQL/logic inline.
- markitdown lives in a local venv at `/Users/kevinlan/Documents/markitdown/.venv/bin/markitdown`.
  `scripts/convert_pdf.sh` already points at it (override with `MARKITDOWN_BIN=...` env var if
  the user's setup changes).
- `_templates/literature-note-template.md` had a Nunjucks bug (fixed 2026-08-07) where
  `authors` looped over the wrong variable — a flat citation string instead of the `creators`
  array — silently producing N empty comma slots (`[, , , ,]`) instead of names, and `year`
  called an unguarded `.format()` on an unset date, throwing a literal error string into the
  frontmatter value. Notes imported before that fix can carry either symptom in their
  frontmatter **regardless of `extraction-status`**, since the bug predates this skill's content
  extraction entirely — a note can be `extraction-status: read` with a fully-populated body and
  still have garbage `authors:`/`year:` frontmatter. Step 1.5 below exists specifically to catch
  those. Malformed values like these aren't just cosmetic — an embedded error string with a bare
  colon in a frontmatter scalar is invalid/ambiguous YAML and risks breaking Obsidian's metadata
  parser (Dataview queries, the properties pane, etc.), so treat this as a correctness bug, not
  a nice-to-have cleanup.

## Step 1 — Locate journals + detect anything not yet in the map

Run both scan scripts and compare their output against `docs/note_journal_map.md`:

```bash
.claude/skills/refresh-literature-notes/scripts/scan_zotero_attachments.sh
# TSV: item_key  attachment_key  filename  has_parent (0 = orphan/standalone attachment)

.claude/skills/refresh-literature-notes/scripts/list_note_keys.sh
# TSV: citekey  item_key  extraction_status  note_path
```

Cross-reference the two outputs:

- **New literature note, not yet in the map**: a row from `list_note_keys.sh` whose citekey
  doesn't appear in `docs/note_journal_map.md`'s table. This happens when the user has already
  run the Obsidian "Tea bioinformatics journals import" command (see
  `docs/obsidian-zotero-integration.md`) for a new Zotero item, so an empty/`unread` note now
  exists. Look up its `item_key` in the `scan_zotero_attachments.sh` output to find the matching
  PDF (`attachment_key` + `filename`, full path is
  `~/Zotero/storage/<attachment_key>/<filename>`).
- **New/changed Zotero attachment not linked to any note**: a row from
  `scan_zotero_attachments.sh` whose `item_key` doesn't match any note's `item_key`. If
  `has_parent=0` it's an orphan/standalone attachment (not tied to a Zotero item) — list it
  under the map's "Orphan / duplicate attachments" section, don't invent a note for it. Note
  creation itself is the Obsidian plugin's job, not this skill's — flag it for the user instead
  of fabricating a citekey.
- **Note with `extraction-status: unread`**: needs (re)extraction even if already in the map.

This mirrors the manual process documented in `docs/note_journal_map.md`'s own footer — reuse
that file's existing table format and columns.

## Step 1.5 — Frontmatter sanity check (runs on every note, not just new/unread ones)

Run the fourth helper script, which is independent of `extraction-status`:

```bash
.claude/skills/refresh-literature-notes/scripts/check_broken_frontmatter.sh
# TSV: citekey  issue  note_path   (issue = "authors" and/or "year")
```

Every citekey this reports needs a **frontmatter-only repair**, done later in Step 4a — separate
from, and in addition to, whatever Step 1–4 content work that note also needs. A note can appear
here even if it's fully extracted and otherwise untouched this run.

## Step 2 — Update the map

Edit `docs/note_journal_map.md`:
- Add a row to the main table for every newly-matched citekey ↔ PDF pair found in Step 1.
- Add newly-found orphan/standalone attachments to the "Orphan / duplicate attachments" section.
- Leave existing rows alone unless their underlying Zotero mapping actually changed.

## Step 3 — Convert PDF → Markdown

For every citekey that needs (re)extraction (new, or `extraction-status: unread`, or the user
explicitly asked to refresh it), convert its source PDF:

```bash
.claude/skills/refresh-literature-notes/scripts/convert_pdf.sh \
  "<absolute path to PDF from the map>" \
  "docs/markdown_pdf/<citekey>.md"
```

Skip the conversion (reuse the existing file) only if `docs/markdown_pdf/<citekey>.md` already
exists **and** is newer than the source PDF — that's the "refresh" check. Note that
`markitdown`'s PDF text extraction sometimes drops spaces between words in dense, justified,
two-column academic layouts (e.g. `asaninvaluableresource`). Read through this carefully rather
than guessing — the words are still all there, just glued together.

## Step 4 — Rewrite the note strictly from the converted Markdown

Open `_templates/literature-note-template.md` and use its section structure as the exact
contract for what to fill in and how: `## Abstract`, `## Key Claims Relevant to Tea KG`,
`## Cultivars / Species Mentioned`, `## Regions Mentioned`, `## Methods Used`,
`## Conflicts With Other Sources`, `## Extraction Status`, `## Annotations`. Do not add,
remove, rename, or reorder sections.

For each note:

1. Read `docs/markdown_pdf/<citekey>.md` (the converted paper) in full.
2. Read the existing note at `Sources/Literature-Notes/<citekey>.md`.
3. **Leave frontmatter bibliographic fields alone** (`citekey`, `title`, `authors`, `year`,
   `journal`, `doi`, `url`, `zotero-link`) — those came from Zotero via the Obsidian plugin and
   are provenance data this skill doesn't own (see `docs/obsidian-zotero-integration.md`: literature
   notes are provenance records, not synthesis). The one exception: if a field shows a literal
   template-rendering error (e.g. `Error: format can only be applied to dates...`), you may
   correct it, but only using a fact stated in the converted paper itself (e.g. its own
   publication year on the title page) — never guess.
4. Fill in `## Abstract` only if it's currently empty, using the paper's own abstract text
   verbatim if present in the markdown, otherwise a one-paragraph summary built only from the
   paper's own text.
5. Fill in `## Key Claims Relevant to Tea KG`, `## Cultivars / Species Mentioned`,
   `## Regions Mentioned`, and `## Methods Used` as detailed, concrete bullet lists — specific
   numbers, names, marker counts, genetic distances, sample sizes, cultivar/taxon names,
   place names — pulled **only** from `docs/markdown_pdf/<citekey>.md`. If the paper doesn't
   mention something (e.g. no regions given), leave that section's bullet list empty rather than
   inferring or importing knowledge from elsewhere.
6. Leave `## Conflicts With Other Sources` as the placeholder for now — that needs the
   cross-vault pass in Step 5.
7. Update frontmatter `extraction-status: read`, and set `lineage-relevant` /
   `species-relevant` / `region-relevant` to `true`/`false` based on whether the paper actually
   discusses breeding/pedigree, species/taxon classification, or geographic
   distribution/origin, respectively.
8. In `## Extraction Status`, check off `- [x] Key claims noted above` and
   `- [x] Entity candidates identified`. Leave `Conflicts documented` and
   `Ready to extract to CSV` unchecked until Step 5 / a human review pass.
9. Never touch `## Annotations`.

**Hard rule**: every sentence you write into Key Claims / Cultivars / Regions / Methods must be
traceable to a specific passage in that citekey's `docs/markdown_pdf/<citekey>.md`. If you find
yourself writing something you merely recall about the paper or the topic rather than something
you just read in that file, delete it.

If there are multiple notes to process in one run, parallelize with the `Agent` tool
(`general-purpose`, one agent per paper, run in background) exactly as done in the first manual
run of this workflow — each agent gets: the specific `docs/markdown_pdf/<citekey>.md` path, the
specific `Sources/Literature-Notes/<citekey>.md` path, and this same strict-grounding rule.
Don't have agents touch the map file; that's a single sequential edit you make yourself in Step 2.

## Step 4a — Repair broken authors/year frontmatter (for citekeys flagged in Step 1.5)

This is a **surgical frontmatter-only fix** — do not touch body sections, `extraction-status`,
or the Extraction Status checkboxes for a note that's here only because of this bug and didn't
otherwise need re-extraction.

1. Make sure `docs/markdown_pdf/<citekey>.md` exists (run Step 3's conversion if it doesn't —
   this is the only reason a Step-1.5-only citekey needs its PDF converted at all).
2. Read that file's title/byline block (first page/section) — the same place you'd find an
   abstract.
3. **If `authors` was flagged**: replace the frontmatter `authors: [...]` value with the real
   creator surnames exactly as printed on the paper's own title page, comma-separated, matching
   the fixed template's convention — last name only (or the full single-field name for an
   institutional/organizational author), e.g. `authors: [Hu, Tsai, Lin]`. If the source genuinely
   has no named authors (an institutional/anonymous webpage, matching the note's existing
   `authors: []`), leave it as `[]` — that's already correct and won't be flagged by Step 1.5 in
   the first place. Also fix the body block's `> **Authors:**` line the same way, using
   "First Last" per person as printed (or the institutional name), comma-separated.
4. **If `year` was flagged**: replace the frontmatter `year:` value with the four-digit
   publication year exactly as stated on the paper's own title page (journal cover line,
   "Received/Accepted" dates, a copyright line, etc.). If the source doesn't state one — e.g. a
   government webpage snapshot with only a print/access date, not a publication date — leave the
   field blank (`year: `) rather than guessing; do not use an access/print date as if it were a
   publication year. Also fix the body block's `> **Year:**` line the same way.
5. Never fabricate a name or year that isn't printed in `docs/markdown_pdf/<citekey>.md`. This is
   the same hard rule as Step 4, applied to frontmatter instead of body content.
6. Confirm the result is plain, valid YAML: no stray colons, no error text, no unquoted
   punctuation that would need escaping. `authors: [Name1, Name2]` and `year: 2019` (or
   `year: ` when genuinely unknown) are the only acceptable shapes for these two fields.

## Step 5 — Cross-check conflicts (recommended)

After a batch of notes is (re)filled, read back through all touched notes' `## Key Claims`
sections and check for genuine factual disagreements with other notes already in the vault
(different genetic-diversity rankings, different taxonomic treatments of the same taxon,
conflicting pedigree/parentage claims, etc.) — not just topical overlap. Where you find one,
write a short entry in **both** notes' `## Conflicts With Other Sources` sections, linking to
each other with `[[citekey]]` wikilinks, and explain the disagreement plus (if the paper says
so) why it might exist. If you check a note and find no conflicts, still note that you checked
(with today's date) rather than leaving the section as the bare placeholder, and check off
`- [x] Conflicts documented`.
