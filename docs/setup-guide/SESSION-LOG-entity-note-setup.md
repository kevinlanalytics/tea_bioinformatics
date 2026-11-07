# Session Log: Entity Note Creation Setup
## Taiwan Tea Heritage Knowledge Graph

**Session date:** 2026-08-07
**Session focus:** Transitioning from literature notes (Layer 1) to entity notes (Layer 2) — setting up Templater automation for the four entity types and creating the first real entity note.

---

# 1. Purpose / Goal / Objective

## 1.1 What this session was trying to accomplish

Move the project from "literature has been read and captured" to "structured entity records exist that can eventually become graph nodes." Concretely, this meant:

1. Set up Templater so creating a note inside `Entities/Cultivars`, `Entities/Species`, `Entities/Regions`, or `Entities/Institutions` automatically applies the correct template — matching the pattern already working for literature notes via Zotero Integration.
2. Create the **first real entity note** — `Camellia-formosensis.md` in `Entities/Species/` — as a proof that the whole chain (template → structured note → eventually Dataview → eventually export) works end to end.

## 1.2 Why this specific note, and why now

*Camellia formosensis* is the anchor species of the entire project. Its entity note is not just "one of many" — it is structurally load-bearing for three separate downstream artifacts:

- **The Species Deep Page** — one of the four pages in the MVP web application (see project proposal, Part 5, §5.2, Page 3). This page does not exist without this entity note's content.
- **A `Species` node in Neo4j** — the taxonomic anchor that wild-to-cultivar lineage relationships (e.g. TTES No. 18's cross to a wild population) attach to.
- **The conservation argument** — the entity note is where the connection gets made explicit between the wild, ecologically vulnerable species and which commercial cultivars carry its genetic line forward. This is the piece of the project with the most real-world stakes (see the NTU Experimental Forest Administration's documented concern about population decline, referenced in the main proposal §1.2).

Creating this one note first, rather than starting with a cultivar or region, was a deliberate choice: it is the single note every other part of the graph eventually connects back to.

## 1.3 Why the template step matters (not just "type some prose")

The goal of running the entity through Templater rather than writing free-form text is **structural, not cosmetic.** A correctly templated note has:

- Consistent YAML field names (`scientific-name`, `taxonomic-type`, `conservation-notes`, `verified`, etc.) matching the schema already defined for the Neo4j `Species` node type
- Fields that Dataview can query — this is what powers the vault dashboard's "Verified & Ready to Export" table
- A shape that the future `scripts/export_from_obsidian.py` script can parse via PyYAML and turn directly into a CSV row, with no manual reformatting later

Skipping the template and writing prose freehand would produce content that reads fine to a human but cannot be mechanically exported — every one of the downstream steps (Dataview queries, CSV export, Neo4j load) depends on the frontmatter shape being consistent across all entity notes of the same type.

## 1.4 Where this sits in the larger pipeline

```
Literature Notes (Layer 1)          ← DONE: 13 sources imported, filled, validated
        │
        ▼
Entity Notes (Layer 2)              ← THIS SESSION: setting up the mechanism,
        │                              creating the first real note
        ▼
verified: true → export script
        ▼
data/raw/*.csv
        ▼
DuckDB → Neo4j → web app
```

This session is the first work happening in Layer 2. Nothing in Layer 2 has been started before this session.

---

# 2. What Got Blocked

## 2.1 Blocker: no "Folder Templates" auto-fire feature found in this Templater version

**Expected approach.** Configure Templater's settings so that creating any new note inside `Entities/Cultivars/`, `Entities/Species/`, `Entities/Regions/`, or `Entities/Institutions/` would automatically apply the matching template — mirroring how Zotero Integration automatically applies `literature-note-template.md` on import. This was expected to live under Settings → Templater → a "Folder Templates" section with add/remove rows mapping folder → template file.

**What was actually found.** Templater (version installed with Obsidian 1.13.4) does not expose this feature in the expected location. Searching Settings for "folder" surfaced only:

- **"Template folder location"** — this sets *where template files themselves live* (i.e. confirms `_templates` as the templates folder), not which template auto-applies to which destination folder.
- **"Override config folder"** (under Files and links) — unrelated, a general Obsidian config setting.

No per-destination-folder auto-apply mapping was found anywhere in the settings UI, despite three separate screenshots taken while scrolling through the full Templater settings panel (Template hotkeys, Startup templates, User script functions, User system command functions, Trigger Templater on new file creation, Template folder location, Internal variables and functions).

**Root cause, as far as can be determined without deeper plugin-source investigation.** Either:
- This version of the Templater plugin does not include a folder-to-template auto-mapping feature at all, or
- The feature exists under different naming/location than expected and was not found through settings search or manual scroll.

This was **not resolved** — no further troubleshooting was attempted to locate a hidden auto-apply mechanism, because a reliable manual alternative exists (see §3).

## 2.2 What was ruled out

- Not a missing plugin — Templater is confirmed installed and enabled (visible in Community plugins list across all three screenshots).
- Not a search/scroll error — the settings search box was used directly with the query `folder`, and it surfaced every setting containing that word. "Folder Templates" was not among the results.
- Not confused with Zotero Integration's separate (and differently-implemented) import-path configuration — that system uses Output Path / Note Import Location, which is a distinct mechanism already working correctly for literature notes (see `LITERATURE-NOTE-ARCHITECTURE.md`, Part 7).

---

# 3. Resolution / Path Forward Adopted

Rather than continuing to search for a folder-auto-apply setting that may not exist in this plugin version, the session pivoted to a **manual-trigger workflow**, judged reliable and low-cost enough at this project's scale to not be worth further debugging time (consistent with the project's general principle, documented in `LITERATURE-NOTE-ARCHITECTURE.md` §7.8, of not over-investing in automation convenience relative to the size of the task).

**Adopted workflow, per entity note:**

1. Create a blank note in the correct entity folder (e.g. right-click `Entities/Species` → New note → name it `Camellia-formosensis`)
2. `Cmd+P` → **Templater: Insert Template**
3. Search for and select the matching template (e.g. `species-template`)
4. Templater fires immediately, presenting `tp.system.prompt(...)` dialog boxes for each templated field (short ID, scientific name, Chinese name, English name)
5. Fill in each prompt; the note is populated with correct YAML frontmatter and section headers

**Cost of this workaround.** One extra manual command (`Templater: Insert Template`) per entity note, versus zero extra commands if true folder-auto-apply had been found working. At the MVP's expected scale of roughly 15–25 cultivars, 6–10 regions, and a handful of species/institution notes, this is a small, bounded amount of repeated manual action — not considered worth further setup-debugging time.

---

# 4. Expected Output If Everything Goes as Planned

## 4.1 Immediate expected output (this session)

A single new file at:
```
Entities/Species/Camellia-formosensis.md
```

containing, after the Templater prompts are answered and the sections are filled in with real content from the (already-validated) Su et al. 2009 literature note:

```yaml
---
node-type: Species
canonical-id: species_c_formosensis
scientific-name: Camellia formosensis
name-zh: 台灣山茶
name-en: Taiwan Wild Tea
taxonomic-type: wild_endemic
first-described-year: 
iucn-status: 
conservation-notes: 
regions: []
sources: [suConfirmationCamelliaFormosensis]
conflicts: []
verified: false
tags: [entity, species]
created: 2026-08-07
---

# Camellia formosensis

## Taxonomic Notes
[content on the RPB2 nuclear gene evidence separating it as a distinct
species from C. sinensis var. sinensis and var. assamica]

## Distribution
[content on Nantou, Yunlin, Chiayi, Kaohsiung, Pingtung, Taitung Counties,
800-1,800m elevation]

## Conservation Status
[content on population decline concern, NTU Experimental Forest
Administration's Fonghuang Mountain conservation proposal]

## Relationship to Bred Cultivars
[content on TTES No. 18's cross to a wild population]

## Molecular Evidence
[content on the RPB2 nuclear gene study]

## Source Conflicts
[none expected for this particular note, since Su et al. 2009 is the
sole foundational taxonomic source used here]

## Open Questions
[e.g. any gaps Su et al. 2009 doesn't resolve]

## Source Notes
[link back to the literature note]
```

`verified` stays `false` until the content is reviewed a final time and confirmed complete — per the project's verification-gate rule (`LITERATURE-NOTE-ARCHITECTURE.md`, Part 4, §4.2), nothing with `verified: false` is eligible for export later.

## 4.2 Expected output over the next few sessions, if the pattern holds

Repeating the same manual-trigger workflow for additional entities:

- 1–2 more Species notes if applicable (e.g. distinguishing *C. formosensis* var. *yungkangensis* if it's to be modeled as a separate entity)
- First Cultivar notes — likely starting with whichever of TTES No. 12, 13, 18, or 24 has the most complete literature-note backing already
- First Region notes — starting with whichever of Alishan, Lugu, Sun Moon Lake etc. has coordinate data available

Each of these follows the identical mechanical pattern established in this session: blank note → `Templater: Insert Template` → select matching template → fill prompts → fill content sections → cite sources → flip `verified: true` only when complete.

## 4.3 Expected output at MVP completion (longer horizon)

Per the project proposal's §5.6 MVP scope: roughly 15–25 verified Cultivar notes, 6–10 verified Region notes, at minimum this one verified Species note, and enough Institution notes to cover TRES/TBRS at minimum. At that point the `_dashboard.md` "Verified & Ready to Export" Dataview table should show a non-trivial, growing list, which is the signal that Layer 2 has enough material to run the DuckDB export script and move to graph construction.

## 4.4 What would indicate something went wrong

- A Templater prompt box does not appear after selecting the template via **Templater: Insert Template** — would indicate the template file itself has a syntax problem, not a settings problem (compare against the working `_templates/species-template.md` content directly).
- The resulting note has unrendered `<% tp.… %>` syntax visible in the frontmatter instead of substituted values — same category of failure as the Nunjucks `{{ }}` rendering failures documented for literature notes, but using Templater's distinct syntax (see `LITERATURE-NOTE-ARCHITECTURE.md` §7.10 for why the two templating systems are not interchangeable and should not be conflated when debugging).
- Frontmatter field names don't match what's listed in `LITERATURE-NOTE-ARCHITECTURE.md` §5.3 (Species) — would silently break future Dataview queries and the export script, so should be checked against that reference table before considering a note "done."

---

# 5. Cross-References

- Two-layer architecture rationale: `LITERATURE-NOTE-ARCHITECTURE.md`, Part 1
- Full entity note frontmatter field reference: `LITERATURE-NOTE-ARCHITECTURE.md`, Part 5
- Verification gate rule: `LITERATURE-NOTE-ARCHITECTURE.md`, §4.2
- Templater vs. Zotero Integration syntax distinction: `LITERATURE-NOTE-ARCHITECTURE.md`, §7.10
- Web application Species Deep Page spec: main project proposal, Part 5, §5.2 (Page 3)
