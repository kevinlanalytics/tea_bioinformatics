---
node-type: Region
canonical-id: region_alishan
name-zh: 阿里山鄉
name-en: Alishan
aliases: []
county: Chiayi County
elevation-min-m: 
elevation-max-m: 
elevation-basis: 
lat: 23.35
lon: 120.8
coord-basis: township-point
wild-population-present: unknown
wild-population-evidence: 
cultivars-grown: [Chin-Shin-Oolong, "[[TTES-No-12]]"]
sources: ["[[leeDNABarcodeIdentification2017]]", "[[suConfirmationCamelliaFormosensis]]", "[[taiwan-gazetteer]]"]
conflicts: ["Chinhsuan production areas in [[leeDNABarcodeIdentification2017]]: the Section 3.4 text says the 18 domestic Chinhsuan samples came from seven areas including Chiayi County (Alishan), and Table 2 lists PJK1136 as Alishan, Chiayi TTES No.12; Table 4 lists only six domestic Chinhsuan areas, with no Alishan row. Decision: pending. Reason: disagreement inside one source; check the PDF."]
verified: false
tags: [entity, region]
created: 2026-11-08
---

# Alishan (阿里山鄉)

**County:** Chiayi County
**Canonical ID:** `region_alishan`

---

## Geographic Notes

<!-- Elevation range, climate type, location relative to other named regions. -->
<!-- county: current administrative name; give the source's older name (e.g. Kaohsiung County) here. -->
<!-- aliases: list each spelling variant with its basis: confirmed by a source (cite it) or assumed. -->

Lee et al. (2017) place Alishan in Chiayi County ("Chiayi County (Alishan)"; Table 2 gives "Alishan, Chiayi"). It is one of the domestic production sites the authors sampled for made tea, along with Pinglin (New Taipei City), Lishan (Taichung City), Jhushan, Mingjian and Lugu (Nantou County), Taitung County, Yilan County and Hualien County. The authors say these regions "were selected due to their significance in the market as major tea production sites, both domestically and internationally."

Su et al. (2009) give the locality only as "Alishan, Taiwan" (Table 1) and do not name a county.

**Name and county from the gazetteer:** [[taiwan-gazetteer]] matches this note to Alishan Township, 阿里山鄉 (Wikidata Q709917), in 嘉義縣 Chiayi County. `county` is the current name and agrees with Lee et al. (2017); no source uses an older county name. Neither paper prints a Chinese name, so `name-zh` comes from the gazetteer only. Neither paper says whether its "Alishan" means the township or a wider tea area (see Open Questions).

**Aliases:** none. The only spelling in the vault sources is "Alishan" (Lee et al. 2017; Su et al. 2009). "arisan" turns up in a source search only inside the species name *C. transarisanensis* (Su et al. 2009), so it is not an alias.

No source in the vault gives an elevation range, climate type, or the location of Alishan relative to other named regions. No source calls Alishan a high-mountain oolong area (see Open Questions).

## Coordinates

<!-- Fill lat/lon for the map page. Use the approximate center of the tea-growing area. -->
<!-- Source your coordinates — don't guess. Papers first, then [[taiwan-gazetteer]]. -->
<!-- coord-basis: specimen (a sampled tree/site) | township-point (gazetteer point for the township) | area-centre -->
<!-- elevation-basis: specimen-label | area-survey | gazetteer. Only area-survey describes the tea-growing range. -->

Neither paper gives coordinates. The point below is the gazetteer's single point for Alishan Township (`coord-basis: township-point`). It is for map placement only and is not the centre of the tea-growing area. Gazetteer elevations are not used.

| Field | Value | Source |
|---|---|---|
| Latitude | 23.35 | [[taiwan-gazetteer]] (township point, Wikidata Q709917) |
| Longitude | 120.8 | [[taiwan-gazetteer]] (township point, Wikidata Q709917) |
| Elevation min (m) | | not given in any vault source |
| Elevation max (m) | | not given in any vault source |

## Wild C. formosensis Populations

<!-- Is there documented presence of wild tea populations here? -->
<!-- Reference: Su et al. 2009 distribution map, NTU Experimental Forest reports. -->
<!-- wild-population-present: present | absent | unknown. absent needs a source saying so; no mention = unknown. -->
<!-- wild-population-evidence: dna-sample | herbarium-only | literature-mention -->

No vault source documents wild *C. formosensis* at Alishan, and none says it is absent there, so `wild-population-present` is `unknown` and `wild-population-evidence` is blank. Su et al. (2009) list Chiayi County localities for *C. formosensis* as Kagi and Sitin only; Alishan is not among them.

Alishan does appear in Su et al. (2009) as the collection site of a **wild** (habitat code W) outgroup sample of a different *Camellia* species, ***C. brevistyla*** (sect. *Paracamellia*): voucher Su681, RPB2 GenBank accessions EU849055 and EU849090 (Table 1). This is a wild *Camellia* record, not a wild tea (*C. formosensis*) record, so it does not count as evidence for the field.

## Cultivars Grown Here

<!-- Which TTES cultivars are primarily associated with this region? Link to Cultivar notes. -->
<!-- cultivars-grown: only cultivars a source says are grown/produced here, as [[TTES-No-N]] links or plain names. Cultivars only sampled here go in the body, not the field. -->

The only source on cultivation at Alishan is the made-tea sampling in Lee et al. (2017, Table 2). Made-tea samples labelled "Alishan, Chiayi" count as produced here, so both cultivars below are in `cultivars-grown`. The table does not show that they are the main cultivars of the area.

- **Chin Shin Oolong** (*C. sinensis* var. *sinensis*, partially fermented, small leaf): samples PJK402–404 ("Alishan, Chiayi").
  - Table 4: the ITS2 SNP frequency for the Alishan Chin Shin Oolong group (107_A_PJK402–404) is **4.4% (7/160 sites)**. That is the lowest of the six domestic Chin Shin Oolong production areas, whose average is 8.8% (14.1/160).
  - Table 5: sample **PJK404 (Alishan, Chiayi)** carries the production-area characteristic SNP **c.154C>T**. It is not listed in the Table 5 "All" re-analysis. The authors note that 9 of the 13 samples with area-characteristic SNPs lost them when all samples were analyzed together.
- **[[TTES-No-12]] (Chinhsuan)**: sample PJK1136 ("Alishan, Chiayi"). The text names Chiayi County (Alishan) as one of seven production areas for the 18 Chinhsuan made-tea samples. The Chinhsuan rows of Table 4 list only six domestic areas, and Alishan is not one of them (see Source Conflicts).

## Terroir Notes

<!-- Climate, soil, rainfall — relevant to the web app's map page context. -->

No vault source gives climate, soil or rainfall data for Alishan.

## Source Conflicts

<!-- Explicitly document any disagreement between sources on any field above. -->
<!-- Format: [Source A] says X. [Source B] says Y. Decision: pending/use A/use B. Reason: -->

No conflicts between sources. The two papers record different things at Alishan (made-tea production in Lee et al. 2017; a wild *C. brevistyla* specimen in Su et al. 2009), and [[taiwan-gazetteer]] agrees with Lee et al. (2017) on Chiayi County.

- **Chinhsuan production areas (inside one source):** [[leeDNABarcodeIdentification2017]] Section 3.4 says the 18 domestic Chinhsuan samples came from seven areas including Chiayi County (Alishan), and Table 2 lists PJK1136 as Alishan, Chiayi TTES No.12. [[leeDNABarcodeIdentification2017]] Table 4 lists only six domestic Chinhsuan areas, with no Alishan row (average 5.1%, 8.1/160), so the ITS2 SNP frequency for PJK1136 is not reported in the extracted text. A reversed label "19.12_A_PJK1136" appears in the cached markdown near the Table 3 similarity matrix, which suggests the sample is in Table 3. Checked against the PDF on 2026-11-10: the inconsistency is in the paper itself, not a conversion error. Decision: pending. Reason: the disagreement is inside one source; check the PDF. Production of TTES No.12 at Alishan is supported by Table 2 and the text either way.

## Open Questions

- **"High-mountain oolong area":** the task brief describes Alishan this way, but no vault source does. Lee et al. (2017) call it only a major production site. This needs a source before it is recorded as fact.
- **Township or tea area:** the gazetteer entry (and so `name-zh`, `lat`, `lon`) is for Alishan Township (阿里山鄉). Neither Lee et al. (2017) nor Su et al. (2009) says whether its "Alishan" means that township or a wider Alishan tea area that may extend into neighbouring townships.
- **Meishan (梅山), Chiayi:** Hu et al. 2023 ([[huSSRbasedMolecularDiagnosis2023]], Table 2) give "Meishan, Chiayi" as the source of sample ST03, "High-Mountain Oolong tea", made by a private manufacturer (Winter 2020). Hu et al. 2023 do not mention Alishan, and no vault source places Meishan within or near Alishan or connects the two. Whether Meishan belongs under this Region node or needs its own node is open.
- **Coordinates and elevation:** coordinates are a gazetteer township point, not a tea-area centre; no source gives specimen or tea-area coordinates. No source gives an elevation range.
- **Wild *C. formosensis*:** Su et al. (2009) list Kagi and Sitin as Chiayi County localities. Whether either lies within the Alishan area is not stated. The "Le-Ye wild tea" that Hu et al. 2014 ([[huDevelopmentSTSCAPS2014]]) attribute to Chiayi is also not tied to Alishan by any source.
- **Main cultivars:** whether Chin Shin Oolong and TTES No.12 are the dominant cultivars at Alishan, or just the ones that happened to be sampled, is not addressed by any source.

## Source Notes

- [[leeDNABarcodeIdentification2017]]: Lee, S.-C., Wang, C.-H., Yen, C.-E., Chang, C. (2017). "DNA barcode and identification of the varieties and provenances of Taiwan's domestic and imported made teas using ribosomal internal transcribed spacer 2 sequences." *Journal of Food and Drug Analysis* 25: 260–274. Alishan, Chiayi appears as a domestic made-tea production site (Tables 2, 4, 5; Section 3.4).
- [[suConfirmationCamelliaFormosensis]]: Su, M.-H., Hsieh, C.-F., Tsou, C.-H. (2009). "The confirmation of *Camellia formosensis* (Theaceae) as an independent species based on DNA sequence analyses." *Botanical Studies* 50: 477–485. Alishan appears as the wild collection site of outgroup *C. brevistyla* (Table 1).
- [[taiwan-gazetteer]]: Wikidata extract (accessed 2026-11-10), entry Alishan Township 阿里山鄉 (Q709917), Chiayi County, 23.35, 120.8. Used for `name-zh`, `county` confirmation, and the township point.
- [[huSSRbasedMolecularDiagnosis2023]] and [[huDevelopmentSTSCAPS2014]] are cited only in Open Questions as Chiayi-related leads not linked to Alishan. They are deliberately left out of `sources:`.

---
*Note: flip `verified: true` only when coordinates, elevation range, and cultivar associations are confirmed from a primary source.*
