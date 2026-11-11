# Change Log

What changed in the vault, newest first. Problems found along the way go in
[`issues.md`](issues.md); this file records what was done.

---

## 2026-11-10

### Cultivar notes TTES No. 1–25 completed

- **Created** `Entities/Cultivars/TTES-No-12.md`, `TTES-No-21.md` … `TTES-No-25.md`. Writers
  stopped by the usage limit on 2026-11-08 were resumed and finished.
- **Filled** `TTES-No-1.md` … `TTES-No-11.md`, `TTES-No-13.md` … `TTES-No-20.md` from the
  literature notes and the full texts in `docs/markdown_pdf/` (2019TTESNo read from its PDF).
- Every note has `canonical-id: cultivar_N` and `verified: false`. All 25 parse as valid YAML.
- **Sourced values:**
  - English names: Chinhsuan (No. 12), Tzuiyu (No. 13), Red Jade (No. 18), Shan Yun (No. 24).
  - Release years: 1999 (No. 18), 2004 (No. 19, 20), 2008 (No. 21), 2019 (No. 24).
  - `name-zh` blank in all 25: no source prints 臺茶N號 ([ISS-026](issues.md#iss-026)).
- **Fixed** conflicts present in the body but missing from `conflicts:` frontmatter in
  No. 5, 6 and 7 (R-006).

### Newest-source rule adopted and applied

- **Rule** (user instruction): when sources disagree, the one whose date is closest to today wins;
  undated web pages use their capture date. Losing values stay visible, marked "superseded".
- **Source order used**, newest first: TTESNo18 / TTESNo24 (TBRS pages, captured 2026-08-07) →
  Jhou 2024, Wang 2024 → Hu 2023 → 2019TTESNo → Lee 2017 → Hu 2014 → Su 2009 → Lai 2001.
- **Applied** to the conflicts in all 25 cultivar notes. Each reads
  `Decision: use [[citekey]] (year). Reason: Newest-source rule (2026-11-10). ...`.
  - Hu 2023's "Sinensis"/"Assamica"/"Hybrid" labels win wherever it is a party
    (flagged for review, ISS-023, now R-009).
  - Lee 2017 wins tea type for No. 1–4, 6, 11, 15, 17; Hu 2014 wins parentage over Lai 2001.
  - TBRS pages win for No. 18 (1999 naming year; B-729 × B-607) and No. 24 (selection of the
    Yongkang variant, not a hybrid).
  - Still `pending`: Tainon-355 vs 335 in No. 16 and 17 (inside one source,
    [ISS-027](issues.md#iss-027)).
- **Documented the rule** in:
  - `AGENTS.md` — new paragraph "Resolving conflicts: newest source wins".
  - `docs/workflow.md` — §1 Overview paragraph; Stage 3 bullet.
  - `.claude/agents/entity-note-writer.md` — replaces "don't pick a winner".
  - `.claude/agents/source-conflict-reviewer.md` — adds decisions to entity notes.
- Not yet applied to region or species notes ([ISS-024](issues.md#iss-024)).

### Finishing the cultivar notes

- **Fixed** `Sources/Literature-Notes/huDevelopmentSTSCAPS2014.md` (ISS-022, now resolved as R-008):
  TTES-9 is Horng-Shin-Dahpan × Kyang (was × Jaipuri); the >98% acreage figure covers all 12
  dominant cultivars (was "top five"); footnote parent spelled Tainon-335.
- **Checked** the Hu 2014 PDF text layer: Table 1 prints Tainon-355 and the footnote Tainon-335,
  so the discrepancy is in the paper itself ([ISS-027](issues.md#iss-027)); recorded as an
  internal inconsistency in the literature note.
- **Refined the rule** in `AGENTS.md`: different classification schemes (Hu 2023 genetic
  groups, Hu 2014 pedigree types, Lee 2017 species codes) are not conflicts; each value is kept
  as its own row (ISS-023, now R-009).
- **Added** "Long sessions (auto-compact)" to `AGENTS.md`: log changes as they happen, keep a
  to-do list, delegate per-item work, re-read `log.md`/`issues.md`/to-dos after compaction.

- **Revised all 25 cultivar notes** under the refined rule (one `entity-note-writer` per note):
  - Classification labels are now one Known Facts row per scheme (Hu 2023 genetic group and
    origin label, Hu 2014 type code, Lee 2017 species and tea-type codes, Lai 2001 grouping),
    with the old "chosen"/"superseded" rows and their `conflicts:` entries removed. Where a label
    sits uneasily with a pedigree (Hu 2023 "Sinensis" for sinensis × assamica crosses, "Hybrid"
    for single-line selections) Parentage Notes says so neutrally.
  - `parent-1`/`parent-2` hold only the parent's printed name (e.g. `FKK-1`, `B-729`,
    `Tainon-355`, `臺灣原生山茶永康變種`); explanations moved to Parentage Notes.
  - Real conflicts kept, decided by the newest-source rule: Lai 2001 "China × Assam hybrid" vs
    Hu 2014 all-sinensis pedigree (No. 12, 13); Lai 2001 "from Peimaohu" vs Hu 2014's cross
    (No. 14, 15, 17); meaning of 1999 (No. 18); Yongkang variant vs species-level framing
    (No. 24). Still pending, inside one source: Tainon-355/335 (No. 16, 17), Hu 2014's "AS"
    definition (No. 21).
  - No. 1, 3, 12: 98% acreage wording matched to the corrected literature note. No. 9:
    transcription note updated. No. 24: Relationship to Wild Species names the Yongkang variant
    (ISS-028, now R-010). No. 15: the Lai RAPD vs Hu STS clustering entry was moved to Molecular
    Data as a method difference.
  - No. 22, 23, 25 needed no change. All 25 notes parse as valid YAML; `verified: false` throughout.
- **Updated** `docs/workflow.md` §1 with the scheme exception.

### Issues backlog updated

- `issues.md`: added ISS-022 … ISS-028; ISS-005 moved to *in progress*; ISS-002 and ISS-020
  updated; ISS-025 narrowed; R-005 … R-010 added to Resolved (ISS-022, 023, 028 resolved).
- Added this log.

---

## 2026-11-08 — commit `f825625`

- Created 8 region notes in `Entities/Regions/`: Alishan, Liouguei, Lugu, Luye, Meiyuanshan,
  Pinglin, Yongkang-Mountain, Yuchi (R-004).
- Started the cultivar notes (TTES No. 1–11, 13–20); finished 2026-11-10.
- `entity-note-writer` now reads each publication's full text, not just its literature note.
- Opened `issues.md` with ISS-001 … ISS-021.

## 2026-11-06 — commit `7eb6055`

- Rewrote `README.md` as the project front page; revised `docs/workflow.md`.
- Added `AGENTS.md` (imported by `CLAUDE.md`), the three skills and three agents, and the
  `.agents/skills` symlink for Codex.
- Added the entity templates (cultivar, species, region, institution) and the species note
  *Camellia formosensis*; setup walkthrough in `docs/setup-guide/`.

## 2026-08-07 — commit `ebd7ffd`

- Initial vault: literature notes, literature-note template, Zotero integration setup.
