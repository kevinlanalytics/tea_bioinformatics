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
| [ISS-001](#iss-001) | P1 | 2026-11-08 | open | 2019TTESNo literature note claims a Yuchi headquarters that the PDF never mentions |
| [ISS-002](#iss-002) | P1 | 2026-11-08 | open | Lee 2017 literature note repeats a "highest SNP rate" claim that the paper's own table contradicts |
| [ISS-003](#iss-003) | P1 | 2026-11-08 | needs PDF check | Species note may list Luku as a DNA sampling site by mistake |
| [ISS-004](#iss-004) | P2 | 2026-11-08 | open | Region template has no `## Source Conflicts` section |
| [ISS-005](#iss-005) | P2 | 2026-11-08 | in progress | `cultivars-grown` is free text with inconsistent cultivar names |
| [ISS-006](#iss-006) | P2 | 2026-11-08 | open | `wild-population-present` can't say "unknown" |
| [ISS-007](#iss-007) | P2 | 2026-11-08 | open | Coordinates and elevation missing from 7 of 8 region notes |
| [ISS-008](#iss-008) | P2 | 2026-11-08 | open | Institution names unresolved (TTES / TRES / TBRS and their branch stations) |
| [ISS-009](#iss-009) | P2 | 2026-11-08 | open | No `aliases` field for spelling variants of place names |
| [ISS-010](#iss-010) | P2 | 2026-11-08 | open | Chinese place names not backed by any vault source |
| [ISS-011](#iss-011) | P2 | 2026-11-08 | open | Blank first line before frontmatter in the species note |
| [ISS-024](#iss-024) | P2 | 2026-11-10 | open | Region and species conflicts predate the newest-source rule and have no decisions |
| [ISS-025](#iss-025) | P2 | 2026-11-10 | in progress | Cultivar `parent-1`/`parent-2` are free text; parent germplasm has no notes |
| [ISS-026](#iss-026) | P2 | 2026-11-10 | open | Cultivar names and release years mostly missing; primary registration sources not in Zotero |
| [ISS-012](#iss-012) | P3 | 2026-11-08 | open | markitdown loses figures and scrambles two-column tables |
| [ISS-013](#iss-013) | P3 | 2026-11-08 | open | No markitdown cache file for 2019TTESNo |
| [ISS-014](#iss-014) | P3 | 2026-11-08 | needs PDF check | Lee 2017 contradicts itself in its own numbers |
| [ISS-015](#iss-015) | P3 | 2026-11-08 | open | County field mixes old and current names of administrative areas |
| [ISS-016](#iss-016) | P3 | 2026-11-08 | open | Elevation fields mean different things in different notes |
| [ISS-017](#iss-017) | P3 | 2026-11-08 | open | Region boundaries unclear (Meishan vs Alishan, Wenshan vs Pinglin, Taitung station) |
| [ISS-018](#iss-018) | P3 | 2026-11-08 | open | Germplasm accession names not reconciled across papers |
| [ISS-019](#iss-019) | P3 | 2026-11-08 | open | Species-level findings stranded in region notes; species note not updated |
| [ISS-020](#iss-020) | P3 | 2026-11-06 | open | New skills and agents not yet trial-run; `cross-check-sources` not run on region or cultivar notes |
| [ISS-027](#iss-027) | P3 | 2026-11-10 | open | Hu 2014 gives TTES No. 16/17's parent as both Tainon-355 and Tainon-335 |
| [ISS-021](#iss-021) | P4 | 2026-11-08 | open | Orchestrator briefs passed unsourced facts to subagents |

---

## P1 — Critical

<a id="iss-001"></a>
### ISS-001 · 2019TTESNo literature note claims a Yuchi headquarters that the PDF never mentions

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 (Yuchi region note) | Literature note | open | `Sources/Literature-Notes/2019TTESNo.md` |

- **Problem:** The note's Regions section says the 03- phone prefix is "consistent with TBRS's main Yuchi (魚池), Nantou headquarters."
- **Evidence:** The PDF (Zotero `4L5MPQDI`) never mentions Yuchi. `huSSRbasedMolecularDiagnosis2023` gives the station's address as Yangmei, Taoyuan. Older papers call Yuchi a *substation* or *branch*.
- **Impact:** Any entity built from this note would get a wrong headquarters location for the institution.
- **Fix:** Remove the inference from the literature note, or mark it as the extractor's guess and not the source's claim. The conflict is already recorded in `Entities/Regions/Yuchi.md`.

<a id="iss-002"></a>
### ISS-002 · Lee 2017 literature note repeats a "highest SNP rate" claim that the paper's own table contradicts

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 (Pinglin region note) | Literature note | open | `Sources/Literature-Notes/leeDNABarcodeIdentification2017.md` |

- **Problem:** The paper's text says Pinglin has the highest Chinhsuan (TTES No. 12) ITS2 SNP rate of the domestic production areas, and the literature note repeats this.
- **Evidence:** The paper's Table 4 shows Yilan at 12.5% (20/160), higher than Pinglin at 9.4% (15/160).
- **Impact:** The literature note passes the source's internal error on as fact.
- **Fix:** Note both values in the literature note and record it as a contradiction within the source. Don't choose a winner: the newest-source rule doesn't apply inside one source.

<a id="iss-003"></a>
### ISS-003 · Species note may list Luku as a DNA sampling site by mistake

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 (Lugu region note) | Entity note | needs PDF check | `Entities/Species/Camellia-formosensis.md` (Distribution section) |

- **Problem:** The species note counts Luku among Su et al. 2009's DNA sampling sites.
- **Evidence:** In the markitdown text, Luku appears only in the "Additional specimens examined" list (C. C. Liao 719, 1992, HAST). Table 1, the DNA sample table, came out garbled in conversion, so the text can't settle it.
- **Impact:** The graph could overstate the genetic evidence for Lugu.
- **Fix:** Check Table 1 in the Su 2009 PDF (Zotero `QGLNX8H9`), then correct the species note or confirm it.

---

## P2 — High

<a id="iss-004"></a>
### ISS-004 · Region template has no `## Source Conflicts` section

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Template / schema | open | `_templates/Notes/region-template.md`; all 8 `Entities/Regions/*.md` |

- **Problem:** The cultivar and species templates have a Source Conflicts section; the region and institution templates do not.
- **Evidence:** Agents added the section to some notes and not others:
  - **Have it:** Alishan, Liouguei, Meiyuanshan, Yongkang-Mountain, Yuchi
  - **Don't have it:** Lugu, Luye, Pinglin. Their conflict-like points are under Open Questions instead.
- **Impact:** The export can't rely on finding conflicts in the same place in every note.
- **Fix:** Add the section to `region-template.md` and `institution-template.md`, then add it to Lugu, Luye and Pinglin, moving their conflict-like Open Questions into it.

<a id="iss-005"></a>
### ISS-005 · `cultivars-grown` is free text with inconsistent cultivar names

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Schema / entity resolution | open | `Entities/Regions/{Alishan,Lugu,Pinglin,Yuchi}.md` |

- **Problem:** The same cultivar is written several different ways:

  | Note | Value |
  |---|---|
  | Alishan | `Chin Shin Oolong`, `TTES No.12 (Chinhsuan)` |
  | Lugu | `Chin-Shin-Oolong`, `TTES No. 12` |
  | Pinglin | `TTES No. 12 (Chinhsuan)`, `Chin-Shin-Oolong` |
  | Yuchi | `"TTES No. 18"` |

- **Impact:** The `GROWN_IN` edges can't be built reliably, and Obsidian links won't resolve.
- **Fix:** Create the Cultivar notes first (MVP: 15–25), then replace these values with `[[wikilinks]]` or canonical IDs (`cultivar_12`, `cultivar_chin_shin_oolong`). Also decide what `cultivars-grown` means: a cultivar the sources say is grown there, or one that was sampled there. Alishan and Pinglin currently mean "sampled".
- **Progress 2026-11-10:** cultivar notes for TTES No. 1–25 now exist (`Entities/Cultivars/TTES-No-N.md`), so TTES values can become `[[TTES-No-12]]` etc. Chin-Shin-Oolong has no note yet ([ISS-025](#iss-025)).

<a id="iss-006"></a>
### ISS-006 · `wild-population-present` can't say "unknown"

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Schema | open | `_templates/Notes/region-template.md`; all region notes |

- **Problem:** The field is a boolean that defaults to `false`, so "confirmed absent" and "no source says" look the same.
- **Evidence:**

  | Note | Value | What it actually means |
  |---|---|---|
  | Luye, Pinglin | `false` | not documented |
  | Alishan | blank | only *C. brevistyla* is recorded there |
  | Yuchi | `true` with an inline YAML comment | old herbarium records that may be planted trees |
  | Lugu, Liouguei | `true` | one herbarium record each (1992, 1996), with no information on current status |

- **Impact:** The Species→Region `FOUND_IN` edges would overstate both presence and absence.
- **Fix:** Change the field to `present` / `absent` / `unknown`, and add a `wild-population-evidence` field: `dna-sample` · `herbarium-only` · `literature-mention`. Then backfill all 8 notes.

<a id="iss-007"></a>
### ISS-007 · Coordinates and elevation missing from 7 of 8 region notes

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Data gap | open | all region notes except Meiyuanshan |

- **Problem:** None of the 12 papers in the vault gives coordinates for a tea-growing area. Meiyuanshan has one tree's coordinates (Wang 2024). Yongkang and Meiyuanshan have elevations taken from specimen labels.
- **Impact:** This blocks the MVP **Map** page.
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

<a id="iss-009"></a>
### ISS-009 · No `aliases` field for spelling variants of place names

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Schema | open | `_templates/Notes/region-template.md` |

- **Problem:** The sources romanize place names in different ways, and the link between variants is often an assumption:

  | Region note | Variants in the sources | Variant confirmed by a source? |
  |---|---|---|
  | Yuchi | Yuchih, Gyoti | yes (Su 2009 gives "Gyoti (Yuchih)") |
  | Lugu | Luku | no |
  | Liouguei | Liukui | no |
  | Yongkang-Mountain | Yungkangshan, Yung-Kang, Yong-Kang | partly |
  | Meiyuanshan | Meiyuenshan | same paper, same county |
  | Pinglin | Wenshan | no, kept separate on purpose |

- **Impact:** Search and grep miss mentions, and the export can't merge variants.
- **Fix:** Add an `aliases:` list (Obsidian supports it natively) and an `alias-basis` note for each variant saying whether a source confirms it or it is assumed.

<a id="iss-010"></a>
### ISS-010 · Chinese place names not backed by any vault source

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Data provenance | open | Liouguei (六龜), Lugu (鹿谷), Luye (鹿野), Yongkang-Mountain (永康山), Meiyuanshan (blank) |

- **Problem:** These `name-zh` values came from the agent brief, not from a source. Meiyuanshan's was left blank because no source gives its Chinese characters.
- **Evidence:** Each note's Open Questions says this. 魚池 is sourced (Wang 2024 address), and so are 阿里山 and 坪林.
- **Impact:** This breaks the rule that every claim traces to a source.
- **Fix:** Use the same gazetteer reference source as [ISS-007](#iss-007), or mark these values as unsourced in frontmatter until one is found.

<a id="iss-011"></a>
### ISS-011 · Blank first line before frontmatter in the species note

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Formatting | open | `Entities/Species/Camellia-formosensis.md` |

- **Problem:** The file starts with `\n---` and not `---`.
- **Impact:** Obsidian, and most YAML-frontmatter parsers, may not recognize the frontmatter, and the planned DuckDB export would miss this note.
- **Fix:** Delete the leading blank line. All 8 region notes already start correctly.

<a id="iss-024"></a>
### ISS-024 · Region and species conflicts predate the newest-source rule and have no decisions

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-10 | Entity notes | open | `Entities/Regions/*.md`, `Entities/Species/Camellia-formosensis.md` |

- **Problem:** The newest-source rule (adopted 2026-11-10, `AGENTS.md`) was applied to the 25 cultivar notes only. None of the 8 region notes or the species note has a `Decision:` line.
- **Fix:** Run `cross-check-sources` over the region and species notes; the updated `source-conflict-reviewer` adds decisions. Do this together with [ISS-020](#iss-020).

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

<a id="iss-014"></a>
### ISS-014 · Lee 2017 contradicts itself in its own numbers

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Source quality | needs PDF check | `Sources/Literature-Notes/leeDNABarcodeIdentification2017.md` |

- **Problem:** Three places where the paper disagrees with itself:
  1. The text says 23/156 where its table says 23/160 (Luye note).
  2. The text and Table 2 include an Alishan Chinhsuan sample (PJK1136), but Table 4's Chinhsuan rows list only six areas and leave Alishan out (Alishan note).
  3. The Pinglin "highest" claim, covered in [ISS-002](#iss-002).
- **Fix:** Check the paper's Tables 3 and 4 in the PDF, then record the inconsistencies in the literature note's conflicts section as contradictions within the source.

<a id="iss-015"></a>
### ISS-015 · County field mixes old and current names of administrative areas

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Schema / normalization | open | `Entities/Regions/Liouguei.md` (`Kaohsiung County`) |

- **Problem:** Liouguei uses Su 2009's historical "Kaohsiung County". Other notes use current names such as New Taipei City. Sources also mix Taoyuan County and Taoyuan City.
- **Impact:** Filtering and grouping by county on the map won't be consistent.
- **Fix:** Decide on a rule: current administrative name in `county`, and the name as the source gives it in an alias or note.

<a id="iss-016"></a>
### ISS-016 · Elevation fields mean different things in different notes

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Schema | open | `Yongkang-Mountain.md` (900–1,100 m), `Meiyuanshan.md` (1,250–1,500 m) |

- **Problem:** The template asks for the elevation range of the tea-growing area. These two values are specimen collection elevations.
- **Fix:** Add an `elevation-basis` field (`specimen-label` · `area-survey` · `gazetteer`), or keep specimen elevations in the body only.

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

---

## P4 — Low

<a id="iss-021"></a>
### ISS-021 · Orchestrator briefs passed unsourced facts to subagents

| Found | Area | Status | Files |
|---|---|---|---|
| 2026-11-08 | Process | open | `.claude/skills/fill-entity-note/SKILL.md` |

- **Problem:** The region briefs included general-knowledge descriptions: "around Sun Moon Lake", "Tung-ting oolong area", "high-mountain oolong area", and the Chinese names. The subagents correctly declined to use them as fact, but these values still made it into the notes, as described in [ISS-010](#iss-010).
- **Fix:** Add a line to the skill telling the orchestrator to give only the entity name, type, path and candidate source list, with no descriptive facts.

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
