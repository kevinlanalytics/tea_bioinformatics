---
node-type: Cultivar
canonical-id: cultivar_1
ttes-number: 1
breeding-code: 
name-zh: 
name-en: 
year-released: 
purpose: "black, green, oolong (Hu et al. 2014); oolong, red, Mee tea (Lee et al. 2017) — see Source Conflicts"
parent-1: Chin-Shin-Dahpan
parent-2: Kyang
parent-confidence: single-source (Hu et al. 2014 only); cross direction not explicitly labelled
regions: []
sources: ["[[huDevelopmentSTSCAPS2014]]", "[[leeDNABarcodeIdentification2017]]", "[[huSSRbasedMolecularDiagnosis2023]]"]
conflicts: ["Taxonomic group: SA hybrid var. sinensis × var. assamica (Hu et al. 2014) vs. Sinensis / C. sinensis var. sinensis (Hu et al. 2023) vs. C. sinensis, variety unspecified (Lee et al. 2017) — pending", "Processing suitability: black/green/oolong (Hu et al. 2014) vs. oolong/red/Mee tea (Lee et al. 2017) — pending"]
verified: false
tags: [entity, cultivar]
created: 2026-11-08
---

# TTES No. 1

**Chinese name:** (none found in sources; see Open Questions)
**Canonical ID:** `cultivar_1`

---

## Known Facts

<!-- Fill in what is verified from primary sources. Every claim should cite a source. -->

| Field | Value | Source |
|---|---|---|
| Year released | Not stated in any source | — |
| Purpose (oolong/black/green) | Black, green, oolong | Hu et al. 2014 (Table 1, processing suitability "B,G,O") |
| Purpose (oolong/black/green) | Oolong, red, Mee tea | Lee et al. 2017 (Table 1, tea types "2,3,4") |
| Parent 1 | Chin-Shin-Dahpan (Taiwan landrace) | Hu et al. 2014 (Table 1) |
| Parent 2 | Kyang (introduced variety, India) | Hu et al. 2014 (Table 1) |
| Primary growing regions | Not stated in any source | — |

**Names and codes as they appear in the sources:**
- "TTES No.1 (TTES-1)", accession code **H1**, type "Developed variety" (Hu et al. 2014, Table 1).
- "TTES No.1", code **1**, leaf type medium (M) (Lee et al. 2017, Table 1). Lee et al. expand TTES as "Tea Research and Extension Substation, Executive Yuan, Taiwan ROC". TTES No.1 is **not** among the varieties they flag as popular or distinguishing in Taiwan.
- "TTES No.1", cultivar code **V001**, origin "Hybrid" (Hu et al. 2023, Table 1).
- H1 and V001 are accession codes specific to each study, not breeding codes, so `breeding-code` is left blank.

**Germplasm accessions sampled** (these are sampling locations, not growing regions):
- Hu et al. 2014: the germplasm garden at the Tea Research and Extension Station, Taoyuan County.
- Lee et al. 2017: plants housed at the Taitung Substation of TRES.
- Hu et al. 2023: the TRES experimental tea plantation at Wenshan.

**Molecular placement:**
- Hu et al. 2014 (STS/CAPS markers, UPGMA on modified Roger's distance) place TTES-1 in **Group IIIc** of the sinensis-type cluster, with Chin-Shin-Gantzy and Chin-Shin-Dahpan. The paper describes TTES-1 as Chin-Shin-Dahpan's "derived variety".
- Lee et al. 2017 sequenced ITS2 for all 113 TRES accessions, including TTES No.1, but the extracted text does not discuss TTES No.1 individually.
- Hu et al. 2023 genotyped V001 in the 144-cultivar TTVID reference database (12 SSR loci). The extracted text gives no cultivar-specific finding for V001.

## Parentage Notes

<!-- Describe the breeding cross in prose. Note if sources disagree on parentage. -->

Per Hu et al. 2014 (Table 1, "Origin or Parent" column), TTES No. 1 comes from the cross **Chin-Shin-Dahpan (TW) × Kyang (IN)**. In the same table, Chin-Shin-Dahpan (L3) is a *C. sinensis* var. *sinensis* (S) landrace "planting in north-west of Taiwan", and Kyang (I10) is a *C. sinensis* var. *assamica* (A) introduced variety "original from India". This is consistent with Hu et al. 2014 classing TTES-1 as an SA hybrid (var. *sinensis* × var. *assamica*).

The table does not label which parent is female. In its Discussion, Hu et al. 2014 say Chin-Shin-Dahpan was one of six landraces "used as female parents for hybridization breeding" since 1945, citing Sanui 2011 and Shyu and Juan 1993. That supports Chin-Shin-Dahpan as the seed parent but does not state it for TTES-1 specifically. The order parent-1 = Chin-Shin-Dahpan follows the table and should not be read as a confirmed female parent.

No other source used here gives parents for TTES No. 1. Lee et al. 2017 and Hu et al. 2023 list the cultivar without a pedigree. Hu et al. 2023 gives only "Hybrid" as its origin. So the sources do not conflict on parentage, but the parentage rests on one source.

## Geographic Range

<!-- Which named regions grow this cultivar? Link to Region notes. -->

None of the sources gives a growing region or acreage for TTES No. 1. Hu et al. 2014 list the top five prevailing cultivars, which cover more than 98% of Taiwan's tea acreage in 2011 TRES statistics. TTES-1 is not among them. The only locations tied to the cultivar are germplasm and experimental holdings: TRES Taoyuan, Taitung Substation, and the Wenshan experimental plantation (see Known Facts). For that reason `regions:` is left empty.

## Relationship to Wild Species

<!-- Does this cultivar trace back to C. formosensis? Note the lineage path. -->

None of the sources links TTES No. 1 to *Camellia formosensis*. Per Hu et al. 2014, both recorded parents are cultivated *C. sinensis*: Chin-Shin-Dahpan is var. *sinensis* and Kyang is var. *assamica*. The same study clusters TTES-1 with the cultivated sinensis-type germplasm (Group III), not with the wild-species Group I. Lee et al. 2017 say in general terms that TRES varieties were bred by crossing and seed selection between imported varieties and native Taiwanese wild tea. That statement is not specific to TTES No.1, so it is not evidence of wild-tea ancestry here.

## Source Conflicts

<!-- Explicitly document any disagreement between sources on any field above. -->
<!-- Format: [Source A] says X. [Source B] says Y. Decision: pending/use A/use B. Reason: -->

- **Taxonomic group.** [[huDevelopmentSTSCAPS2014]] says TTES No.1 is "SA", a *C. sinensis* var. *sinensis* × var. *assamica* hybrid (Table 1). [[huSSRbasedMolecularDiagnosis2023]] says it is "Sinensis", which its footnote defines as cultivars belonging to *C. sinensis* var. *sinensis* (Table 1, V001). [[leeDNABarcodeIdentification2017]] says "I", *Camellia sinensis*, with no variety given (Table 1). Decision: pending. Reason: Hu et al. 2023 has no hybrid category in its three-group scheme (Sinensis/Assamica/Formosana), so "Sinensis" may be a coarser grouping rather than a real disagreement. Lee et al. 2017 also give all TTES varieties "I" rather than a variety-level label. This needs a reviewer's judgement.
- **Processing suitability / purpose.** [[huDevelopmentSTSCAPS2014]] says black, green, and oolong tea ("B,G,O"). [[leeDNABarcodeIdentification2017]] says oolong (2), red (3), and Mee tea (4). Lee's scheme has a separate "green tea" category (1) that is not assigned to TTES No.1. Decision: pending. Reason: both sources agree on oolong and on black/red tea. They differ on green tea versus Mee tea. Neither source says whether its Mee tea category falls under green tea, and that should be checked against a source rather than assumed.

## Open Questions

<!-- What do you still need to verify before flipping verified: true? -->

- **Chinese name.** 臺茶1號 / 台茶1號 does not appear in any literature note or cached full text. A TRES/TBRS source is needed to confirm `name-zh`.
- **English or trade name.** No English trade name is sourced; the sources use only "TTES No.1" / "TTES-1". `name-en` is left blank.
- **Year released or registered.** Not stated in any source.
- **Breeding code or selection number.** Not stated. H1 and V001 are study accession codes.
- **Cross direction.** Is Chin-Shin-Dahpan confirmed as the female (seed) parent of TTES No.1? This is inferred only from Hu et al. 2014's general statement about landrace female parents.
- **Corroborating parentage.** Only Hu et al. 2014 gives the parents. An official TBRS cultivar page or registration record for TTES No.1, like those held for TTES No.18 and No.24, would provide independent confirmation.
- **Growing regions and acreage.** No source records where TTES No.1 is commercially grown.
- **Taxonomic group and processing-suitability conflicts.** See Source Conflicts.

## Source Notes

<!-- Link to relevant literature notes -->

- [[huDevelopmentSTSCAPS2014]]: Hu, C.-Y., Tsai, Y.-Z., Lin, S.-F. (2014). "Development of STS and CAPS markers for variety identification and genetic diversity analysis of tea germplasm in Taiwan." *Botanical Studies* 55: 12. Used for parentage, SA classification, processing suitability, and Group IIIc cluster placement.
- [[leeDNABarcodeIdentification2017]]: Lee, S.-C., Wang, C.-H., Yen, C.-E., Chang, C. (2017). "DNA barcode and identification of the varieties and provenances of Taiwan's domestic and imported made teas using ribosomal internal transcribed spacer 2 sequences." *Journal of Food and Drug Analysis* 25: 260–274. Used for species code, tea types, leaf size, and the Taitung Substation accession.
- [[huSSRbasedMolecularDiagnosis2023]]: Hu, C.-Y., Tsai, H.-T., Chiu, C.-F., Su, T.-C., Le, N.H.K., Yeh, S.-D. (2023). "SSR-based molecular diagnosis for Taiwan tea cultivars and its application in identifying cultivar composition of the processed tea." *Journal of Food and Drug Analysis* 31: 446–457. Used for the V001 code, "Sinensis" group, "Hybrid" origin, and Wenshan sampling plantation.

---
*Note: flip `verified: true` in frontmatter only when all required fields in the table above are filled and all open questions are resolved.*
