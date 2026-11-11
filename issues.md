# Issues Backlog

Backlog of data errors, schema gaps, and pipeline problems for the tea knowledge graph.
Issues are grouped by priority (most severe first) and, within each priority, listed in the
order they were found. Resolved issues move to the [Resolved](#resolved) section at the bottom.

## Priority levels

| Level | Meaning | Examples |
|---|---|---|
| **P1 — Critical** | A wrong or unsupported fact sits in a note and would reach the graph | Claim not in the cited source; misattributed sampling site |
| **P2 — High** | A schema or consistency gap that blocks export, linking, or the MVP pages | Missing template section; free-text values where IDs are needed |
| **P3 — Medium** | A pipeline or tooling weakness that slows work or hides evidence | PDF conversion loses figures; missing cache file |
| **P4 — Low** | Process, documentation, or cosmetic | Workflow lessons, wording |

**Status values:** `open` · `in progress` · `needs PDF check` (needs a human to look at the original PDF) · `resolved`

---

## Index

| ID | Priority | Found | Status | Title |
|---|---|---|---|---|
| [ISS-007](#iss-007) | P2 | 2026-11-08 | in progress | Coordinates and elevation missing from 7 of 8 region notes |
| [ISS-008](#iss-008) | P2 | 2026-11-08 | open | Institution names unresolved (TTES / TRES / TBRS and their branch stations) |
| [ISS-024](#iss-024) | P2 | 2026-11-10 | in progress | Species-note conflicts predate the newest-source rule and have no decisions |
| [ISS-025](#iss-025) | P2 | 2026-11-10 | in progress | Cultivar `parent-1`/`parent-2` are free text; parent germplasm has no notes |
| [ISS-026](#iss-026) | P2 | 2026-11-10 | open | Cultivar names and release years mostly missing; primary registration sources not in Zotero |
| [ISS-030](#iss-030) | P2 | 2026-11-11 | open | No source describes withering, rolling/shaping or drying, so those tea-process notes can't be written |
| [ISS-012](#iss-012) | P3 | 2026-11-08 | open | markitdown loses figures and scrambles two-column tables |
| [ISS-013](#iss-013) | P3 | 2026-11-08 | open | No markitdown cache file for 2019TTESNo |
| [ISS-017](#iss-017) | P3 | 2026-11-08 | open | Region boundaries unclear (Meishan vs Alishan, Wenshan vs Pinglin, Taitung station) |
| [ISS-018](#iss-018) | P3 | 2026-11-08 | open | Germplasm accession names not reconciled across papers |
| [ISS-019](#iss-019) | P3 | 2026-11-08 | open | Species-level findings stranded in region notes; species note not updated |
| [ISS-020](#iss-020) | P3 | 2026-11-06 | open | New skills and agents not yet trial-run; `cross-check-sources` not run on region or cultivar notes |
| [ISS-027](#iss-027) | P3 | 2026-11-10 | open | Hu 2014 gives TTES No. 16/17's parent as both Tainon-355 and Tainon-335 |
| [ISS-029](#iss-029) | P3 | 2026-11-10 | open | Gazetteer values come from Wikidata, not an official source; points are township-level |

---

## P1 — Critical

---

## P2 — High

<a id="iss-007"></a>
### ISS-007 · Coordinates and elevation missing from 7 of 8 region notes

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Data gap | open | all region notes except Meiyuanshan |

- **Problem:** None of the 12 papers in the vault gives coordinates for a tea-growing area. Meiyuanshan has one tree's coordinates (Wang 2024). Yongkang and Meiyuanshan have elevations taken from specimen labels.
- **Impact:** This blocks the MVP **Map** page.
- **Progress 2026-11-10:** non-paper source accepted: `Sources/Reference/taiwan-gazetteer.md` (Wikidata). 6 notes now have township points (`coord-basis: township-point`); Meiyuanshan keeps its specimen point. Still missing: Yongkang Mountain (no gazetteer entry), centres of the tea-growing areas, and elevation ranges.
- **Fix:** Decide which non-paper sources are acceptable for location data. The template allows "Google Maps, Taiwan government GIS". Add them as reference sources so each value can still be traced (for example a `gazetteer` source note), then fill the coordinates.

<a id="iss-008"></a>
### ISS-008 · Institution names unresolved (TTES / TRES / TBRS and their branch stations)

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Entity resolution | open | `Entities/Institutions/` (empty); Yuchi, Luye, Pinglin, Lugu region notes |

- **Problem:** The sources name what may be one institution, and its branch stations, in several ways:
  - **Parent body:** Taiwan Tea Experiment Station (TTES) · Tea Research and Extension Station (TRES) · 茶及飲料作物改良場 (TBRS)
  - **Yuchi:** Yuchih Substation · Yuchi Branch · TRES Yuchi plantation
  - **Taitung:** Taitung Substation · 東部分場 · TRES Taitung plantation
  - **Wenshan:** Wunshan Branch · Wenshan plantation
  - **Tungding Substation:** location never stated

  No source in the vault documents the renamings.
- **Impact:** Region↔Institution edges can't be drawn, and two region notes (Luye and Lugu) depend on where these stations are.
- **Fix:** Create the Institution notes with an `aliases` field and a dated name history. Find a source that documents the renamings.

<a id="iss-024"></a>
### ISS-024 · Region and species conflicts predate the newest-source rule and have no decisions

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-10 | Entity notes | open | `Entities/Regions/*.md`, `Entities/Species/Camellia-formosensis.md` |

- **Problem:** The newest-source rule (adopted 2026-11-10, `AGENTS.md`) was applied to the 25 cultivar notes only. None of the 8 region notes or the species note has a `Decision:` line.
- **Progress 2026-11-10:** all 8 region notes revised; their conflicts are decided or pending by the rule.
- **Fix:** Run `cross-check-sources` over the species note; the updated `source-conflict-reviewer` adds decisions. Do this together with [ISS-020](#iss-020).

<a id="iss-025"></a>
### ISS-025 · Cultivar `parent-1`/`parent-2` are free text; parent germplasm has no notes

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-10 | Schema / entity resolution | in progress | `Entities/Cultivars/*.md`; `_templates/Notes/cultivar-template.md` |

- **Problem:** Parent fields mixed plain names (`Jaipuri`), one wikilink (`[[TTES-No-12]]`), and whole sentences (TTES No. 16, 17, 18, 21, 24). Most parents (Chin-Shin-Oolong, Jaipuri, Kyang, Tainon lines, B-729, B-607) have no entity note. This is the README risk "`ParentGermplasm` has no entity template".
- **Impact:** The Lineage Explorer's `BRED_FROM` edges can't be built from these values.
- **Progress 2026-11-10:** every parent field now holds only the parent's printed name; explanations are in Parentage Notes.
- **Fix:** Add a parent-germplasm template (or use Cultivar/Species notes), create notes for the parents, then turn each name into a link.

<a id="iss-026"></a>
### ISS-026 · Cultivar names and release years mostly missing; primary registration sources not in Zotero

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-10 | Data gap | open | `Entities/Cultivars/*.md` |

- **Problem:** Of the 25 cultivar notes, `name-zh` is blank in all 25 (no vault source prints 臺茶N號), `name-en` is filled in 4 (No. 12, 13, 18, 24), and `year-released` in 5 (No. 18, 19, 20, 21, 24).
- **Fix:** Capture into Zotero: the TBRS cultivar pages for the other TTES numbers (as was done for No. 18 and 24), Tsai et al. 2004a (No. 19/20 breeding report) and Chiu et al. 2009 (No. 21 registration). Then re-run `fill-entity-note` on the affected notes.

<a id="iss-030"></a>
### ISS-030 · No source describes withering, rolling/shaping or drying, so those tea-process notes can't be written

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-11 (tea-process notes) | Data gap / sources | open | `Entities/Prepare_process/` |

- **Problem:** The vault's publications describe tea processing only in passing. Only fermentation, roasting and panning have source text, so only those three notes exist. Withering, rolling/shaping and drying, which are standard steps for oolong, Paochong and black tea, appear in no vault source.
- **Evidence:**
  - None of the converted papers in `docs/markdown_pdf/` or the 2019TTESNo PDF mentions withering, rolling or 萎凋/揉捻.
  - Hu et al. 2023 (Table 2) give only each tea's appearance (stripe, rounded "ball type", curly), not how it was shaped.
  - Lee et al. 2017 say only that their samples were "fixed, dried" into green tea.
  - Jhou et al. 2024's oven drying at 60 °C was lab sample preparation, not tea manufacture.
- **Also missing for the existing notes:** no source gives temperatures, durations or equipment for any process, so the Variations sections hold only levels and categories. No source prints the Chinese process terms; Roasting's 焙火 is from the user's template.
- **Impact:** The process layer can't cover the full manufacturing sequence. Teas can't be linked to the steps that define them (e.g. withering and rolling in oolong), and the web app can't explain how tea types differ in processing.
- **Fix:** Add processing sources to Zotero, e.g. TBRS (茶及飲料作物改良場) tea-manufacturing pages or bulletins, or a tea-processing textbook or review. Then run `fill-entity-note` for Withering, Rolling/Shaping and Drying, and update the existing three notes with methods, parameters and Chinese terms.

---

## P3 — Medium

<a id="iss-012"></a>
### ISS-012 · markitdown loses figures and scrambles two-column tables

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Pipeline (PDF→Markdown) | open | `docs/markdown_pdf/` |

- **Problem:** The text extraction misses data that matters:
  - **Hu 2023, Fig. 4:** the cultivar identified in each specialty tea sample (ST02 Pinglin Paochong, ST09 Yuchi black tea) appears only in this figure.
  - **Su 2009:** Table 1 (the DNA sample list) and the two-column specimen list come out garbled.
- **Impact:** Agents can't confirm claims, which leads to [ISS-003](#iss-003) and gaps in Pinglin and Yuchi.
- **Fix:** Add a "figures/tables to verify" checklist to each literature note, and/or try a table-aware extractor (e.g. `pdfplumber`, `marker`) on papers that rely on tables.

<a id="iss-013"></a>
### ISS-013 · No markitdown cache file for 2019TTESNo

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Pipeline | open | `docs/markdown_pdf/` (11 files for 12 literature notes) |

- **Problem:** `2019TTESNo.md` has no converted text, so agents fell back to reading the PDF.
- **Fix:** Re-run the conversion step of `refresh-literature-notes`. If markitdown can't convert it (it may be a web capture), record the reason in `docs/note_journal_map.md`.

<a id="iss-017"></a>
### ISS-017 · Region boundaries unclear (Meishan vs Alishan, Wenshan vs Pinglin, Taitung station)

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Data model | open | Alishan, Pinglin, Luye region notes |

- **Problem:** No source says whether:
  - Meishan (Hu 2023's High-Mountain Oolong sample) belongs under Alishan;
  - "Wenshan" is the same area as Pinglin;
  - the TRES Taitung station is in Luye;
  - Kagi, Sitin or the Le-Ye wild tea fall within Alishan.
- **Fix:** Decide how regions nest (township inside a production district inside a county), possibly with a `part-of` relation, then decide case by case.

<a id="iss-018"></a>
### ISS-018 · Germplasm accession names not reconciled across papers

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Entity resolution | open | Yuchi, Luye, Meiyuanshan region notes |

- **Problem:** The same accession may appear under different names, or with different origins, in different papers:
  - **Variant names:** Fenhuanshan / Fenghuang / Fong-Huang; Derhuasia / De-Hua-She; Lee 2017's No. 98 "Mei Yuan" (possibly Meiyuanshan).
  - **Ming-Hai's origin:** sampled at Yuchi in Lai 2001, but placed at Taitung in Hu 2023 and given as "from Kaohsiung" in Hu 2014.
- **Fix:** Create a germplasm or accession alias table before building Cultivar notes for wild accessions.

<a id="iss-019"></a>
### ISS-019 · Species-level findings stranded in region notes; species note not updated

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Entity note | open | `Entities/Species/Camellia-formosensis.md` |

- **Problem:** Several findings about *C. formosensis* as a species were written into region notes, and the species note wasn't updated (agents were told to read it only):
  - Tree height: 10 m (Wang 2024) vs up to 8 m (Su 2009)
  - Flowering period: Sep–Feb vs Sep–Jan
  - var. *yungkangensis* and the link to TTES No. 24
  - Yuchi as the type locality (1935 neotype)
- **Fix:** Run `fill-entity-note` on the species note and then `cross-check-sources` across species and region notes.

<a id="iss-020"></a>
### ISS-020 · New skills and agents not yet trial-run; `cross-check-sources` not run on region notes

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-06 (carried over) | Tooling | open | `.claude/skills/`, `.claude/agents/` |

- **Problem:** The 2026-11-06 restructure left these checks undone: trial-run `fill-entity-note` on a copy of Camellia-formosensis, run `cross-check-sources` on the 12 literature notes, and run `/doctor`. `fill-entity-note` has now been used for the region notes and the 25 cultivar notes. The other checks are still open; `cross-check-sources` has not been run on the cultivar notes either.
- **Fix:** Run `cross-check-sources` over `Entities/Regions/`, the species note, and the literature notes. That will also help settle [ISS-003](#iss-003) and [ISS-019](#iss-019).

<a id="iss-027"></a>
### ISS-027 · Hu 2014 gives TTES No. 16/17's parent as both Tainon-355 and Tainon-335

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-10 | Source quality | open | `Entities/Cultivars/TTES-No-16.md`, `TTES-No-17.md` |

- **Problem:** Hu et al. 2014 Table 1 prints "Tainon-355"; the same table's footnote defines "Tainon-335". Both notes keep `Decision: pending` because the conflict is inside one source.
- **PDF checked 2026-11-10:** the PDF's own text layer has both spellings, so the error is in the paper, not the conversion. Recorded in the literature note.
- **Fix:** Find a second source for the parent's name (e.g. a TBRS page for No. 16 or 17).

<a id="iss-029"></a>
### ISS-029 · Gazetteer values come from Wikidata, not an official source; points are township-level

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-10 | Data provenance | open | `Sources/Reference/taiwan-gazetteer.md`; 7 region notes |

- **Problem:** Chinese names, current counties and coordinates come from Wikidata. The official Ministry of the Interior place-name service (gn.moi.gov.tw) has no documented public API. Each coordinate is the township's single point, not the centre of the tea-growing area.
- **Also needs review:** Meiyuanshan = 眉原山 rests on a 0.7 km coordinate match; Yuchi's `wild-population-present: present` rests on herbarium records of unstated wild/planted status.
- **Fix:** Capture official gazetteer pages into Zotero and replace the values; add tea-area coordinates where a source gives them.

---

## P4 — Low

---

## Resolved

| ID | Priority | Found → Resolved | Title | Reference |
|---|---|---|---|---|
| R-001 | P2 | 2026-08-07 → 2026-08-07 | Templater: hyphenated frontmatter fields accessed with dot notation (`name-zh` undefined) | `docs/setup-guide/ENTITY-NOTE-SETUP-WALKTHROUGH.md` §5.1 |
| R-002 | P2 | before 2026-11-06 → before 2026-11-06 | Literature-note template produced `authors: [, , , ]` and a broken `year` | `.claude/skills/refresh-literature-notes/references/frontmatter-repair.md` |
| R-003 | P3 | 2026-11-06 → 2026-11-06 | README links broken after the `docs/` prefix was dropped | commit `7eb6055` |
| R-004 | P2 | 2026-11-08 → 2026-11-08 | `Entities/Regions/` empty (MVP target 6–10) | 8 region notes created |
| R-005 | P2 | 2026-11-08 → 2026-11-10 | Cultivar notes missing (MVP target 15–25) | 25 notes, `Entities/Cultivars/TTES-No-1.md` … `TTES-No-25.md`; see `log.md` |
| R-006 | P2 | 2026-11-10 → 2026-11-10 | Conflicts in the body of TTES No. 5, 6, 7 missing from `conflicts:` frontmatter | Entries added; all 25 notes parse as YAML |
| R-007 | P4 | 2026-11-10 → 2026-11-10 | Agents told to record conflicts without deciding them | Newest-source rule in `AGENTS.md`, `docs/workflow.md`, both agent files |
| R-008 | P1 | 2026-11-10 → 2026-11-10 | Hu 2014 literature note misstated TTES No. 9's second parent (× Jaipuri → × Kyang) and the 98% acreage figure (top five → all 12) (was ISS-022) | Checked against the PDF; see `log.md` |
| R-009 | P1 | 2026-11-10 → 2026-11-10 | Newest-source rule replaced pedigree-based labels with Hu 2023's coarse group labels (was ISS-023) | `AGENTS.md`: scheme differences aren't conflicts; 25 cultivar notes revised |
| R-010 | P3 | 2026-11-10 → 2026-11-10 | TTES No. 24's wild-species section didn't match its parentage decision (was ISS-028) | Section names the Yongkang variant per TTESNo24 |
| R-011 | P1 | 2026-11-08 → 2026-11-10 | 2019TTESNo literature note claimed a Yuchi headquarters the PDF never mentions (was ISS-001) | Inference removed from the literature note; Yuchi conflict dropped |
| R-012 | P1 | 2026-11-08 → 2026-11-10 | Lee 2017 literature note repeated the "highest SNP rate" claim its own table contradicts (was ISS-002) | PDF checked; both values in the literature note as an inside-the-paper inconsistency; Pinglin pending |
| R-013 | P1 | 2026-11-08 → 2026-11-10 | Species note listed Luku as a DNA sampling site (was ISS-003) | Su 2009 Table 1 (PDF): Nantou DNA samples are Meiyuanshan, Derhuasia, Fenhuanshan only; species note corrected |
| R-014 | P2 | 2026-11-08 → 2026-11-10 | Region template had no `## Source Conflicts` section (was ISS-004) | Added to region and institution templates; all 8 region notes have it |
| R-015 | P2 | 2026-11-08 → 2026-11-10 | `cultivars-grown` was free text with inconsistent names (was ISS-005) | Means grown/produced per a source; TTES values are `[[TTES-No-N]]` links |
| R-016 | P2 | 2026-11-08 → 2026-11-10 | `wild-population-present` couldn't say "unknown" (was ISS-006) | present/absent/unknown plus `wild-population-evidence`; all 8 notes backfilled |
| R-017 | P2 | 2026-11-08 → 2026-11-10 | No `aliases` field for place-name spelling variants (was ISS-009) | `aliases` added; each note gives every alias's basis |
| R-018 | P2 | 2026-11-08 → 2026-11-10 | Chinese place names not backed by any vault source (was ISS-010) | From `[[taiwan-gazetteer]]`; Yongkang Mountain blanked (no source), 永康山 kept as unsourced candidate |
| R-019 | P2 | 2026-11-08 → 2026-11-10 | Blank first line before the species note's frontmatter (was ISS-011) | Removed |
| R-020 | P3 | 2026-11-08 → 2026-11-10 | Lee 2017 contradicts itself in its own numbers (was ISS-014) | All three checked in the PDF; recorded in the literature note and in Alishan, Pinglin, Luye as pending |
| R-021 | P3 | 2026-11-08 → 2026-11-10 | County field mixed old and current administrative names (was ISS-015) | Rule in template: current name in `county`, source's name in the body; Liouguei now Kaohsiung City |
| R-022 | P3 | 2026-11-08 → 2026-11-10 | Elevation fields meant different things in different notes (was ISS-016) | `elevation-basis` added; Meiyuanshan and Yongkang marked specimen-label |
| R-023 | P4 | 2026-11-08 → 2026-11-10 | Orchestrator briefs passed unsourced facts to subagents (was ISS-021) | Rule added to `.claude/skills/fill-entity-note/SKILL.md` |
