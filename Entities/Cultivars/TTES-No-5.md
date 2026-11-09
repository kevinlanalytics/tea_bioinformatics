---
node-type: Cultivar
canonical-id: cultivar_5
ttes-number: 5
breeding-code: 
name-zh: 
name-en: 
year-released: 
purpose: [oolong, paochong, green]
parent-1: Fwu-Jou line
parent-2: 
parent-confidence: low
regions: []
sources: ["[[huDevelopmentSTSCAPS2014]]", "[[leeDNABarcodeIdentification2017]]", "[[huSSRbasedMolecularDiagnosis2023]]"]
conflicts: ["origin-type: Hu et al. 2014 lists origin as 'Fwu-Jou line (CN)' (a line, no second parent) vs Hu et al. 2023 labels origin 'Hybrid'; decision pending"]
verified: false
tags: [entity, cultivar]
created: 2026-11-08
---

# TTES No. 5

**Chinese name:** (not found in any source in the vault; see Open Questions)
**Canonical ID:** `cultivar_5`

---

## Known Facts

<!-- Fill in what is verified from primary sources. Every claim should cite a source. -->

| Field | Value | Source |
|---|---|---|
| Year released | Not stated in any vault source | n/a |
| Purpose (oolong/black/green) | Oolong, Paochong, green tea (Hu et al. 2014 Table 1: "O,P,G"). Lee et al. 2017 Table 1 gives tea types 1, 2, 5 = green, oolong, Pou Chong | [[huDevelopmentSTSCAPS2014]], [[leeDNABarcodeIdentification2017]] |
| Parent 1 | "Fwu-Jou line (CN)" (given as the single origin/parent entry) | [[huDevelopmentSTSCAPS2014]] |
| Parent 2 | None given; Hu et al. 2014 names no second parent | [[huDevelopmentSTSCAPS2014]] |
| Primary growing regions | Not stated in any vault source. Only germplasm or sampling locations are recorded (see Geographic Range) | n/a |

**Names and codes found in sources:**
- "TTES No.5 (TTES-5)", study code **H5**, type "Developed variety" (Hu et al. 2014, Table 1).
- "TTES No.5", table code **5** (Lee et al. 2017, Table 1). The results text calls it "Taiwan tea No.5" (Lee et al. 2017).
- "TTES No.5", cultivar code **V005** (Hu et al. 2023, Table 1).
- H5 and V005 are accession codes made up for those studies. They are not TRES breeding codes, so `breeding-code` stays blank.

**Taxonomic classification:**
- Hu et al. 2014 classify it as "S", *C. sinensis* var. *sinensis*. They did not label it "SA", the sinensis x assamica hybrid code they used for several other TTES varieties.
- Hu et al. 2023 classify it as group "Sinensis".
- Lee et al. 2017 classify it as "(I)", *Camellia sinensis*, the species-level code they apply to all TRES breeding varieties. They give leaf type **M (medium)**.

**Molecular data:**
- **ITS2 (Lee et al. 2017):** TTES No. 5 had the longest ITS2 sequence of the 113 TRES varieties, at 164 bp. The shortest were No. 88 Kyang and No. 114 Dah Pan at 149 bp. TTES No. 5 is also one of five varieties (Nos. 4, 5, 30, 59, 89) that fell outside both the "long" (160 ± 1 bp) and "short" (150 ± 1 bp) ITS2 length groups.
- **STS/CAPS (Hu et al. 2014):** H5 is one of the 55 germplasm accessions genotyped. The text naming the UPGMA subgroups (IIIa/IIIb/IIIc) does not mention TTES-5, so its cluster placement would have to be read from Figure 3.
- **SSR (Hu et al. 2023):** V005 is one of the 144 cultivars in the 12-SSR TTVID reference database. The paper does not discuss it individually.

## Parentage Notes

<!-- Describe the breeding cross in prose. Note if sources disagree on parentage. -->

Hu et al. (2014, Table 1, "Origin or Parent" column) give "Fwu-Jou line (CN)" for TTES No. 5. The CN tag marks a Chinese origin. The table uses the same "X line" form for other single-source varieties: TTES-6 (Chin-Shin-Oolong line), TTES-7 (Shan line), TTES-8 (Jaipuri line) and TTES-21 (FKK-1 line). Two-parent crosses are written as "A × B". This suggests, but the paper does not say, that TTES No. 5 was selected from the Fwu-Jou line rather than bred from a controlled cross. The paper does not describe how the selection was done.

The same paper lists Fwu-Jou separately as introduced variety I16. It is classed "S", Paochong-suitable ("P") and "Original from China" (Hu et al. 2014). Hu et al. (2023) list Fwu-Jou as imported cultivar I014. Lee et al. (2017) list Fwu Jou as accession No. 121: *C. sinensis* var. *sinensis*, partially fermented, small leaf. None of these sources says the Fwu-Jou accession they hold is the exact source plant of TTES No. 5.

Hu et al. (2023) put TTES No. 5 (V005) under origin "Hybrid", which conflicts with the single-line entry above. See Source Conflicts.

## Geographic Range

<!-- Which named regions grow this cultivar? Link to Region notes. -->

No source in the vault names commercial growing regions for TTES No. 5. Only germplasm or sampling locations are recorded:
- Hu et al. (2023): sampled from the TRES **Wenshan** experimental plantation.
- Lee et al. (2017): one of the 113 varieties held at the TRES **Taitung** Substation.
- Hu et al. (2014): material came mainly from the TRES germplasm garden in Taoyuan County. Their table does not give a separate location for H5.

These are germplasm-collection sites, not cultivation regions, so `regions:` is left empty.

## Relationship to Wild Species

<!-- Does this cultivar trace back to C. formosensis? Note the lineage path. -->

No source traces TTES No. 5 to *C. formosensis*. All three sources classify it as *C. sinensis*: var. *sinensis* in Hu et al. 2014 and 2023, species level in Lee et al. 2017. Its only recorded lineage is the Chinese Fwu-Jou line (Hu et al. 2014).

## Source Conflicts

<!-- Explicitly document any disagreement between sources on any field above. -->
<!-- Format: [Source A] says X. [Source B] says Y. Decision: pending/use A/use B. Reason: -->

- **Origin type.** [[huDevelopmentSTSCAPS2014]] gives TTES No. 5's origin as "Fwu-Jou line (CN)", with no second parent, the format that table uses for single-line selections. [[huSSRbasedMolecularDiagnosis2023]] lists V005 (TTES No. 5) with origin "Hybrid". Decision: pending. Reason: Hu et al. 2023 label all 25 TTES varieties (V001–V025) "Hybrid". That includes TTES No. 24, which other vault sources describe as a wild-population selection (see the conflict note in [[huSSRbasedMolecularDiagnosis2023]]). So "Hybrid" may be a naming convention for TTES varieties rather than a pedigree claim. Neither source gives a second parent.
- **Taxon resolution (minor; probably not a real disagreement).** [[huDevelopmentSTSCAPS2014]] and [[huSSRbasedMolecularDiagnosis2023]] say *C. sinensis* var. *sinensis*. [[leeDNABarcodeIdentification2017]] says only "(I) *Camellia sinensis*", without a variety. Decision: pending. Reason: Lee et al. give all TRES breeding varieties the species-level code (I), so this looks like coarser labelling rather than a contradiction.

## Open Questions

<!-- What do you still need to verify before flipping verified: true? -->

- **Chinese name:** "臺茶5號" / "台茶5號" does not appear in any literature note or cached full text. `name-zh` is blank until a source confirms it.
- **English trade name:** none is given in any source; only "TTES No.5", "TTES-5" and "Taiwan tea No.5" appear. `name-en` is blank.
- **Year of release/registration:** not stated in any vault source.
- **Breeding method:** was TTES No. 5 a pure-line or individual selection from the Fwu-Jou line, or a hybrid (the Hu et al. 2023 label)? A TRES registration report or cultivar profile page for TTES No. 5 would settle this.
- **Fwu-Jou identity:** is the Fwu-Jou accession held by TRES (Hu 2014 I16 / Hu 2023 I014 / Lee 2017 No. 121) the actual source line of TTES No. 5?
- **Breeding code:** no TRES breeding or line code is given. H5 and V005 are study accession codes.
- **Growing regions:** no source documents where TTES No. 5 is grown commercially.
- **Cluster placement:** Hu et al. 2014 Figure 3 (UPGMA dendrogram) should be checked for where H5 falls. The text does not say.

## Source Notes

<!-- Link to relevant literature notes -->

- [[huDevelopmentSTSCAPS2014]]: Hu, Tsai and Lin (2014), *Botanical Studies* 55:12. Table 1 entry H5: classification, processing suitability, "Fwu-Jou line (CN)" origin.
- [[leeDNABarcodeIdentification2017]]: Lee, Wang, Yen and Chang (2017), *J. Food Drug Anal.* 25: 260–274. Table 1 entry No. 5 (species, tea types, leaf type); ITS2 length 164 bp, the longest in the panel; falls outside both ITS2 length groups.
- [[huSSRbasedMolecularDiagnosis2023]]: Hu et al. (2023), *J. Food Drug Anal.* 31: 446–457. Table 1 entry V005 (Sinensis, "Hybrid", sampled at Wenshan).

---
*Note: flip `verified: true` in frontmatter only when all required fields in the table above are filled and all open questions are resolved.*
