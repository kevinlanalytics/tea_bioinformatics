# Tagging/Synonym-Mapping Phase — Progress Report

**Date:** 2026-07-09
**Phase:** Tagging & synonym mapping (pre-extraction)
**Status:** Both blocking gaps closed — ready to advance to extraction phase

---

## 1. Purpose of this phase

Before the extraction phase can begin, the literature synthesis table needed two things resolved:

1. **Citation gaps** — three table rows (3, 4, 5) had no verifiable primary source, only topic labels. Unverified citations risk creating phantom entities or duplicate nodes in the Neo4j graph.
2. **Synonym mapping** — Taiwan wild-tea populations appear under multiple romanizations across sources (e.g. Shueijing/Shuei Jing). Without a canonical name map, entity resolution — the core informatics contribution of this project — cannot proceed reliably.

This report documents how each gap was closed, which source resolved it, and what it contributes to the knowledge graph.

---

## 2. Citation gap resolution

### Row 3 — deleted (phantom duplicate)

- **Finding:** A search for "STS/CAPS markers Taiwan tea" returned Hu, Tsai & Lin 2014, *Botanical Studies* 55:12 — already present in the table as row 9.
- **Verification:** DOI `10.1186/1999-3110-55-12` and journal/volume match confirmed exact identity.
- **Action:** Row 3 deleted from synthesis table.
- **Contribution:** Confirms method-vocabulary saturation for STS/CAPS marker searches — no new source exists beyond what's already captured.

### Row 4 — resolved

- **Citation:** Jhou, H.-C., Chen, C.-I., Shen, J.-Y., Wang, C.-T., and Chang, F.-C. 2025. "Influence of natural light intensities on growth and content of catechins and caffeine in *Camellia formosensis* leaves and tea infusion." *BioResources* 20(1), 877–887. DOI: 10.15376/biores.20.1.877-887.
- **Contribution:** Pure chemistry/agronomy source — catechin and caffeine content under varying light intensity, field trial at NTU Experimental Forest. No lineage content; classification as chemistry-only stands.
- **Secondary value:** This paper's introduction section is what first surfaced the TTES No. 18 parentage claim and pointed toward Shen, Sun & Zhou 2015 as a possible source — which triggered the row 5 investigation below.

### Row 5 — deleted (phantom duplicate), replaced with new row

- **Finding:** The URL initially proposed for row 5 (`ejournal.sinica.edu.tw/bbas/content/2001/2/bot422-02.html`) resolved to Lai, Yang & Hsiao 2001, *Botanical Bulletin of Academia Sinica* 42:93–100 — already present as row 7.
- **Action:** Row 5 deleted.
- **Follow-on:** The real open question — primary citation for TTES No. 18 and No. 24 parentage — was pursued separately (see Section 3) since it was never actually a row-5 match to begin with.

---

## 3. TTES No. 18 / No. 24 parentage — primary source resolution

This was the actual unresolved thread underneath row 5. Two authoritative primary sources were located and verified via a fetched PDF of the original trial report (not a secondary summary).

### TTES No. 18 (Red Jade / 紅玉)

- **Primary citation (parentage):** Wang, L.-C. & Ho, H.-F. 1997. "Investigation and utilization of Taiwan wild tea trees" (台灣野生茶樹調查與利用). Special Crops Research Symposium Proceedings, Taiwan Provincial Agricultural Experiment Station Bulletin No. 74, pp. 71–80.
- **How found:** Cited *in-text* (王及何，1997) inside Yu et al. 2019's own reference list as the source for the TTES No. 18 parentage claim — found by reading the primary trial report directly rather than relying on a secondary citation trail.
- **Institutional record:** TBRS cultivar page, `https://www.tbrs.gov.tw/ws.php?id=4689` — confirms mother = Burma large-leaf Assam B-729, father = Taiwan wild tea (*C. formosensis*) B-607, named 1999 (ROC year 88).
- **Contribution:** Direct `DERIVED_FROM` edge evidence for TTES No. 18 — two-parent cross with named parent accessions (B-729, B-607), suitable for a genotype-backed lineage edge in Neo4j.

### TTES No. 24 (Yongkang tea / 山蘊)

- **Primary citation (full breeding record):** Yu, C.-A., Cheng, H.-Y., Lo, S.-K., Shiau, J.-H., Hu, C.-Y., Yang, M.-J., Lin, J.-C., Wu, S.-S., Chiu, C.-F. 2019. "Test Report for TTES No. 24 – New Tea Cultivar Officially Named in 2019" (2019年度命名茶樹新品種臺茶24號試驗報告). *Taiwan Tea Research Bulletin* 38: 11–28. *(Note: an intermediate CV-derived citation listed pp. 1–10; the verified page range from the actual paper is 11–28.)*
- **Institutional record:** TBRS cultivar page, `https://www.tbrs.gov.tw/ws.php?id=3981`.
- **Contribution:** Full breeding lineage — single-parent selection (not a cross) from wild Yongkang population, introduced 2001, individually selected 2012, five elite lines chosen 2015, named 2019. This paper's own reference list also documents the multi-decade Yongkang-tea research trail (Wang et al. 1989, 1990; Feng et al. 1991; Cheng et al. 2003; Cheng & Fan 2013; Cheng, Fan & Yu 2016a, 2016b) — a full provenance chain from wild-population survey to named cultivar.
- **Schema note:** Because TTES No. 24 is a single-source selection rather than a cross, it should NOT be modeled with two parent edges the way TTES No. 18 is — confirms the existing `BreedingLine ≠ RegisteredCultivar` distinction and extends it: cross-derived cultivars need a two-parent edge pattern, single-source selections need a one-parent edge pattern.

### Shen, Sun & Zhou 2015 — status: unresolved, deprioritized

- Originally suspected (via Jhou et al. 2025's citation) as the source for TTES No. 18/24 parentage.
- Does not appear anywhere in Yu et al. 2019's own reference list — meaning the actual primary sources (Wang & Ho 1997 for No. 18, Yu et al. 2019 itself for No. 24) supersede it.
- **Action:** Deprioritized. If cited at all, cite through Jhou et al. 2025 as a secondary reference, not as an independently verified source.

---

## 4. Synonym map — wild tea population names

**Purpose:** Establishes canonical names for Taiwan wild tea (*C. formosensis*) populations so that naming variants across sources resolve to single graph entities rather than duplicate nodes. This is the core entity-resolution deliverable for the project's informatics contribution.

**Source of canonical list:** Yu et al. 2019 introduction — the only source in the table that lists all ten TRES/TBRS-recognized wild tea populations together in one place.

| Canonical name | Romanization | Variants seen | Taxonomy status | Source(s) |
|---|---|---|---|---|
| 眉原山茶 | Meiyuan | Mei Yuan | *C. formosensis*, undisputed | Lee et al. 2017 |
| 鳳凰山茶 | Fenghuang | Fong Huang | *C. formosensis*, undisputed | Lai 2001, Lee 2017 |
| 德化社山茶 | Dehuashe | — | Unconfirmed, new locality | Yu et al. 2019 |
| 瀨頭赤芽山茶 | Laitou | Lai Tou | **Disputed** — Hu 2014 reclassifies as *C. furfuracea*; Lee 2017 includes as wild tea (No. 93) | Lai 2001, Hu 2014, Lee 2017 |
| 水井赤芽山茶 | Shueijing | Shuei Jing | **Disputed** — same pattern as Laitou (Lee 2017 No. 100) | Lai 2001, Hu 2014, Lee 2017 |
| 龍頭山茶 | Longtou | — | Unconfirmed, new locality | Yu et al. 2019 |
| 樂野山茶 | Leye | — | *C. formosensis*, undisputed | Lai 2001 |
| 南鳳山茶 | Nanfeng | — (do not conflate with Fenghuang) | Unconfirmed, new locality | Yu et al. 2019 |
| 鳴海山茶 | Minghai | Min Ghai | *C. formosensis*, undisputed | Lai 2001, Lee 2017 |
| 永康山茶 | Yongkang | Yungkangensis, Yung Kang | *C. formosensis* var. *yungkangensis*, confirmed source population for TTES No. 24 | Yu et al. 2019 |

**Open flags (not blocking, noted for future resolution):**
- **Senshan** (from Lai 2001's six wild samples) does not match any of the ten canonical names — possible OCR/transliteration artifact or a genuinely separate, unlisted locality.
- **Sun Cha** (from Lee 2017's wild tea cluster) may be a mistranslation of the generic Chinese term 山茶 ("mountain tea" = wild tea broadly) rather than a place name — flagged as `unresolved`, not to be treated as an 11th population until confirmed.

**Contribution:** This table becomes the ground-truth reference for every wild-tea entity note going forward — new notes should cite the canonical name column, not whatever spelling a given source happens to use.

---

## 5. Taxonomy-correction chain (reinforced by this session)

The Laitou/Shueijing dispute is now triangulated across three sources, forming a complete evidence chain for the `provenance-correction` flag already established as a project principle:

1. **Lai, Yang & Hsiao 2001** — originally classifies Laitou and Shueijing as native wild tea (pre-2009, under the old *var. assamica* f. *formosensis* naming).
2. **Hu, Tsai & Lin 2014** — corrects this: Laitou and Shueijing samples are actually *C. furfuracea*, not *C. formosensis*.
3. **Lee, Wang, Yen & Chang 2017** — re-includes Laitou (No. 93) and Shuei Jing (No. 100) as wild tea, contradicting Hu 2014's correction.

**Contribution:** This is a real, documented taxonomic conflict — not a data error on your part. Both entity notes for these two populations need explicit `provenance-correction` flags citing all three sources, with Hu 2014's correction noted as the most recent peer-reviewed position, and Lee 2017's contradiction flagged as an open disagreement in the literature rather than resolved.

---

## 6. Documentation actions completed / still needed

| Action | Status |
|---|---|
| Delete table rows 3 and 5 (phantom duplicates) | To do in your synthesis table |
| Update row 4 with Jhou et al. 2025 citation | To do |
| Add new table row for TTES No. 18/24 parentage cluster | To do |
| Add Zotero items: Jhou et al. 2025, Wang & Ho 1997, Yu et al. 2019 (corrected pages 11-28), TBRS cultivar pages (×2) | To do |
| Create `synonym-map.md` in Obsidian with table from Section 4 | To do |
| Create/update entity notes `TTES-18.md` and `TTES-24.md` with parent accession data and `node_type` | To do |
| Update `search-log.md` with query trail from this session | To do |
| Flag Senshan and Sun Cha as `unresolved` — no further action needed now | Noted, deferred |

---

## 7. Where this leaves the project

Both blocking gaps identified at the start of this phase are now closed:

- **Citation gaps:** rows 3–5 resolved (two deleted as duplicates, one replaced; plus a previously-unknown parentage citation gap for TTES No. 18/24 independently discovered and resolved).
- **Synonym map:** built from an authoritative institutional source (Yu et al. 2019), covering all ten canonical wild-tea populations with variant spellings and taxonomy-dispute flags.

**Next phase:** extraction — pulling structured entity and relationship data from the verified literature set into your DuckDB staging layer, using the synonym map as the canonical-name lookup and the taxonomy-correction chain as the basis for `provenance-correction` flags on affected nodes.
