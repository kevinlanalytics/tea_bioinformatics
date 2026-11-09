---
node-type: Cultivar
canonical-id: cultivar_3
ttes-number: 3
breeding-code: 
name-zh: 
name-en: 
year-released: 
purpose: black, green (per Hu et al. 2014; see Source Conflicts)
parent-1: Horng-Shin-Dahpan
parent-2: Manipuri
parent-confidence: single-source (Hu et al. 2014 Table 1 only; female/male roles not labelled for this cross)
regions: []
sources: ["[[huDevelopmentSTSCAPS2014]]", "[[huSSRbasedMolecularDiagnosis2023]]", "[[leeDNABarcodeIdentification2017]]"]
conflicts: ["taxonomic-group: huDevelopmentSTSCAPS2014 = SA (C. sinensis var. sinensis x var. assamica hybrid) vs huSSRbasedMolecularDiagnosis2023 = Sinensis (C. sinensis var. sinensis) vs leeDNABarcodeIdentification2017 = I (Camellia sinensis, no variety)", "purpose: huDevelopmentSTSCAPS2014 = black + green vs leeDNABarcodeIdentification2017 = red tea + Mee tea"]
verified: false
tags: [entity, cultivar]
created: 2026-11-08
---

# TTES No. 3

**Chinese name:** not found in any source (see Open Questions)
**Canonical ID:** `cultivar_3`

---

## Known Facts

<!-- Fill in what is verified from primary sources. Every claim should cite a source. -->

| Field | Value | Source |
|---|---|---|
| Year released | Not stated in any source | — |
| Purpose (oolong/black/green) | Black tea and green tea (Table 1 code "B,G"). Lee et al. 2017 instead lists tea types "red tea" and "Mee Tea" (see Source Conflicts) | [[huDevelopmentSTSCAPS2014]]; [[leeDNABarcodeIdentification2017]] |
| Parent 1 | Horng-Shin-Dahpan (Taiwan landrace) | [[huDevelopmentSTSCAPS2014]] |
| Parent 2 | Manipuri (introduced *C. sinensis* var. *assamica* variety, of Indian origin) | [[huDevelopmentSTSCAPS2014]] |
| Primary growing regions | Not stated in any source; only sampling locations are given (see Geographic Range) | — |

**Other sourced attributes:**
- **Designations used in sources:** "TTES No.3 (TTES-3)", accession code **H3**, germplasm type "Developed variety" (Hu et al. 2014, Table 1); "TTES No.3", cultivar code **V003**, origin "Hybrid" (Hu et al. 2023, Table 1); "TTES No.3", code 3 (Lee et al. 2017, Table 1). These are study accession codes, not breeding codes, so `breeding-code` is left blank.
- **Taxonomic group:** "SA" = *C. sinensis* var. *sinensis* × var. *assamica* hybrid (Hu et al. 2014); "Sinensis" = cultivars belonging to *C. sinensis* var. *sinensis* (Hu et al. 2023); "I" = *Camellia sinensis*, with no variety assigned (Lee et al. 2017). See Source Conflicts.
- **Leaf type:** medium ("M") (Lee et al. 2017, Table 1).
- **Molecular clustering:** in the UPGMA dendrogram from 39 STS/CAPS loci (modified Roger's distance), TTES-3 falls in **Group IIIa** of the sinensis-type group (Group III). Group IIIa also holds Chin-Shin-Oolong, Shy-Jih-Chuen, Bair-Mau-Hour, Wuu-Yi, and Horng-Shin-Dahpan, with TTES-3, TTES-4 and TTES-9 described as Horng-Shin-Dahpan's "derived varieties" (Hu et al. 2014).
- **Marker coverage:** included in the 144-cultivar SSR genotype database behind the TTVID 12-SSR identification kit (Hu et al. 2023), and in the 113-accession ITS2 phylogenetic tree set (Lee et al. 2017). Neither paper discusses TTES No. 3's results individually.
- **Not a prevailing cultivar:** TTES-3 is not one of the 12 prevailing cultivars that Hu et al. 2014 selected for variety identification, which covered over 98% of Taiwan's tea acreage (2011 TRES statistics). Lee et al. 2017 also does not flag it as a "popular or distinguishing" variety (footnote f).

## Parentage Notes

<!-- Describe the breeding cross in prose. Note if sources disagree on parentage. -->

Hu et al. 2014 (Table 1, "Origin or Parent") gives the cross as **Horng-Shin-Dahpan (TW) × Manipuri (IN)**. That paper is the only source that states TTES No. 3's parentage. Hu et al. 2023 and Lee et al. 2017 list the cultivar but give no parents, so there is nothing for them to disagree with.

- **Horng-Shin-Dahpan**: a landrace, *C. sinensis* var. *sinensis* ("S"), planted in north-west Taiwan, suited to green tea (Hu et al. 2014, Table 1). Hu et al. 2014 names it among six landraces that were prevailing during the Japanese occupation and "have been used as female parents for hybridization breeding" since 1945. The same paper says all six were introduced from Fukien or Guangdong, China. This supports, but does not explicitly state, Horng-Shin-Dahpan as the seed parent of TTES No. 3. Table 1 does not label female/male for individual crosses. Hu et al. 2023 lists Horng-Shin-Dahpan (L009) as a Sinensis landrace. Lee et al. 2017 lists "Horng Shin Dah Pan" as *C. sinensis* var. *sinensis*, partially fermented, small leaf.
- **Manipuri**: an introduced variety, *C. sinensis* var. *assamica* ("A"), originally from India, suited to black tea (Hu et al. 2014, Table 1). Hu et al. 2023 lists Manipuri (I010) as an imported Assamica cultivar. Lee et al. 2017 lists it as *C. sinensis* var. *assamica*, fermented, red tea, large leaf.
- **Sibling cultivar:** Hu et al. 2014 gives the identical cross (Horng-Shin-Dahpan × Manipuri) for TTES No. 4 (H4). The sources do not say whether TTES No. 3 and No. 4 are sister selections from the same cross population.

## Geographic Range

<!-- Which named regions grow this cultivar? Link to Region notes. -->

No source names a commercial growing region for TTES No. 3. The only locations given are where samples were taken:
- Hu et al. 2014: all samples (except four Shan lines) came from the germplasm garden of the Tea Research and Extension Station, Taoyuan County.
- Hu et al. 2023: TTES No. 3 (V003) was sampled at the TRES experimental plantation at **Wenshan** (Table 1, "Sampling plantation"). No Region note exists for Wenshan yet.

These are germplasm or experimental collections, not growing regions, so `regions:` is left empty.

## Relationship to Wild Species

<!-- Does this cultivar trace back to C. formosensis? Note the lineage path. -->

No source traces TTES No. 3 to *C. formosensis*. Per Hu et al. 2014, both parents are cultivated *C. sinensis*: Horng-Shin-Dahpan is var. *sinensis* and Manipuri is var. *assamica*. In that paper's PCoA and UPGMA analyses, TTES-3 sits within the cultivated sinensis-type Group III, separate from Group I (*C. formosensis* and *C. formosensis* var. *yungkangensis*).

## Source Conflicts

<!-- Explicitly document any disagreement between sources on any field above. -->
<!-- Format: [Source A] says X. [Source B] says Y. Decision: pending/use A/use B. Reason: -->

1. **Taxonomic group.** [[huDevelopmentSTSCAPS2014]] classes TTES No. 3 as "SA", a *C. sinensis* var. *sinensis* × var. *assamica* hybrid, consistent with its listed sinensis × assamica parents. [[huSSRbasedMolecularDiagnosis2023]] classes it as "Sinensis" ("cultivars belonging to *C. sinensis* var. *sinensis*"), origin "Hybrid". [[leeDNABarcodeIdentification2017]] gives species code "I" (*Camellia sinensis*), without the var. *sinensis* (II) or var. *assamica* (III) assignment it gives landraces and introduced varieties. Decision: pending. Reason: Hu et al. 2023 uses only three groups (Sinensis / Assamica / Formosana), so its label may be a coarser grouping rather than a real disagreement. The sources do not say which applies.
2. **Processing suitability.** [[huDevelopmentSTSCAPS2014]] gives "B,G" (black tea, green tea). [[leeDNABarcodeIdentification2017]] gives tea types "3,4" ("red tea" and "Mee Tea") and no fermentation-suitability code. Decision: pending. Reason: the two papers use different vocabularies. Neither says whether Lee's "red tea" and "Mee Tea" correspond to Hu's black and green tea, so this may be only a terminology difference.

## Open Questions

<!-- What do you still need to verify before flipping verified: true? -->

- **Chinese name:** none of the sources gives a Chinese name (searched 臺茶3號 and 台茶3號). An official TBRS/TRES cultivar record is needed to fill `name-zh`.
- **English or trade name:** no source gives one. "TTES No. 3", "TTES No.3" and "TTES-3" are the only forms found, and searches for "Taicha 3" found nothing. `name-en` is left blank.
- **Year released or named:** not stated in any source.
- **Parent direction:** which parent was the seed (female) parent and which the pollen (male) parent is not stated for this cross. Only Hu et al. 2014's general remark that the six landraces served as female parents suggests Horng-Shin-Dahpan.
- **Corroborating parentage:** the parentage rests on a single table entry (Hu et al. 2014). A primary breeding or registration record would raise confidence.
- **Relationship to TTES No. 4:** same listed cross. The sources do not say whether the two are sister selections.
- **Growing regions and acreage:** no source says where TTES No. 3 is grown commercially or how much area it covers.
- **Taxonomic group and purpose:** both conflicts above need resolving, ideally from the official cultivar description.

## Source Notes

<!-- Link to relevant literature notes -->

- [[huDevelopmentSTSCAPS2014]]: Hu, Tsai & Lin (2014), *Botanical Studies* 55:12. Table 1 (H3: SA, developed variety, B,G, Horng-Shin-Dahpan × Manipuri), UPGMA Group IIIa placement, sampling at the TRES germplasm garden in Taoyuan.
- [[huSSRbasedMolecularDiagnosis2023]]: Hu et al. (2023), *Journal of Food and Drug Analysis* 31:446–457. Table 1 (V003: Sinensis, Hybrid, sampled at Wenshan), part of the TTVID SSR database.
- [[leeDNABarcodeIdentification2017]]: Lee et al. (2017). Table 1 (code 3: species I, tea types red tea and Mee tea, medium leaf), part of the ITS2 phylogenetic tree set.

---
*Note: flip `verified: true` in frontmatter only when all required fields in the table above are filled and all open questions are resolved.*
