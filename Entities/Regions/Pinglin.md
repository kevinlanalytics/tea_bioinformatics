---
node-type: Region
canonical-id: region_pinglin
name-zh: 坪林區
name-en: Pinglin
aliases: ["Pinglin District"]
county: New Taipei City
elevation-min-m: 
elevation-max-m: 
elevation-basis: 
lat: 24.924444
lon: 121.726667
coord-basis: township-point
wild-population-present: unknown
wild-population-evidence: 
cultivars-grown: ["[[TTES-No-12]]", "Chin-Shin-Oolong"]
sources: ["[[leeDNABarcodeIdentification2017]]", "[[huSSRbasedMolecularDiagnosis2023]]", "[[huDevelopmentSTSCAPS2014]]", "[[suConfirmationCamelliaFormosensis]]", "[[taiwan-gazetteer]]"]
conflicts: ["Pinglin's rank in Chinhsuan ITS2 SNP frequency: [[leeDNABarcodeIdentification2017]] text says the Pinglin samples (PJK570, PJK574) had the highest frequency, 9.4% (15/160); the same paper's Table 4 lists Yilan (PJK907-909) at 12.5% (20/160), higher than Pinglin. Decision: pending. Reason: Disagreement is inside one source."]
verified: false
tags: [entity, region]
created: 2026-11-08
---

# Pinglin (坪林區)

**County:** New Taipei City
**Canonical ID:** `region_pinglin`

---

## Geographic Notes

<!-- Elevation range, climate type, location relative to other named regions. -->
<!-- county: current administrative name; give the source's older name (e.g. Kaohsiung County) here. -->
<!-- aliases: list each spelling variant with its basis: confirmed by a source (cite it) or assumed. -->

- Lee et al. (2017) name it "New Taipei City (Pinglin District)" and list it as a domestic made-tea production site. They chose their sites (Pinglin; Lishan, Taichung; Jhushan, Mingjian and Lugu, Nantou; Alishan, Chiayi; Taitung, Yilan and Hualien counties) "due to their significance in the market as major tea production sites."
- Hu et al. (2023) refer to it as "Pinglin," the home of the Pinglin Farmers' Association (FA). That association supplied the study's Wenshan Paochong tea sample.
- None of the sources used here give elevation, climate type, or Pinglin's position relative to other named regions.
- County-level context, per Hu et al. (2014, citing Council of Agriculture 2012): New Taipei City holds 10.6% of Taiwan's cultivated tea area. Nantou County holds 48.4% and Chiayi County 15.5%. This figure covers the whole city, not Pinglin alone.
- **Name and county, per [[taiwan-gazetteer]]:** Chinese name 坪林區 (Wikidata label "Pinglin District"), current administrative area 新北市 New Taipei City. The gazetteer records the older administrative area as 臺北縣 Taipei County (before the 2010 reorganisation, per Wikidata). None of the papers used here use the older name; Lee et al. (2017) and Hu et al. (2023) both say "New Taipei City."
- **Aliases:**
  - "Pinglin District": confirmed by Lee et al. (2017) ("New Taipei City (Pinglin District)", "Pinglin District, New Taipei City") and by [[taiwan-gazetteer]] (English label "Pinglin District").
  - "Wenshan" / "Wunshan" are **not** aliases; see below.

**Wenshan (文山) as the sources use it.** These sources never state that Pinglin and "Wenshan" are the same place. This note keeps the two names separate.
- **"Wenshan Paochong tea"**: a product name. In Hu et al. (2023), sample ST02 is "Wenshan Paochong tea," provided by the Pinglin FA in spring 2020. That is the only place in these sources where the two names appear together.
- **"Wenshan" TRES experimental plantation**: Hu et al. (2023) collected fresh leaves "from four experimental plantations (Wenshan, Yangmei, Yuchi, and Taitung) of the Tea Research and Extension Station." The paper gives no location for the Wenshan plantation beyond that name.
- **"Wunshan Branch," TRES**: Hu et al. (2014) list an author affiliation of "Wunshan Branch, Tea Research and Extension Station, Council of Agriculture, Executive Yuan, New Taipei City 231, Taiwan." The source spells it "Wunshan." No source says this branch is in Pinglin. No source says it is the same as the "Wenshan" plantation in Hu et al. (2023).

## Coordinates

<!-- Fill lat/lon for the map page. Use the approximate center of the tea-growing area. -->
<!-- Source your coordinates — don't guess. Papers first, then [[taiwan-gazetteer]]. -->
<!-- coord-basis: specimen (a sampled tree/site) | township-point (gazetteer point for the township) | area-centre -->
<!-- elevation-basis: specimen-label | area-survey | gazetteer. Only area-survey describes the tea-growing range. -->

| Field | Value | Source |
|---|---|---|
| Latitude | 24.924444 | [[taiwan-gazetteer]] (Wikidata Q570245; township point, not the tea-growing area centre) |
| Longitude | 121.726667 | [[taiwan-gazetteer]] (Wikidata Q570245; township point, not the tea-growing area centre) |
| Elevation min (m) | | not given in any vault source (gazetteer elevations not used) |
| Elevation max (m) | | not given in any vault source (gazetteer elevations not used) |

No paper used here gives coordinates for Pinglin, so the gazetteer township point is used (`coord-basis: township-point`). It is suitable for map placement only.

## Wild C. formosensis Populations

<!-- Is there documented presence of wild tea populations here? -->
<!-- Reference: Su et al. 2009 distribution map, NTU Experimental Forest reports. -->
<!-- wild-population-present: present | absent | unknown. absent needs a source saying so; no mention = unknown. -->
<!-- wild-population-evidence: dna-sample | herbarium-only | literature-mention -->

No vault source documents wild tea in Pinglin or New Taipei City.
- Su et al. (2009) describe *C. formosensis* as endemic to "the central, southern and southeastern parts of the island, including Nantou, Yunlin, Chiayi, Kaohsiung, Pingtung and Taitung Counties, at the elevation of 800-1,800 m." New Taipei City is not on that list.
- Hu et al. (2014) likewise place the wild species in "the central, southern and eastern regions of Taiwan."

`wild-population-present` is `unknown`: New Taipei is absent from these distribution statements, but no source states that wild tea is absent from Pinglin, and no survey of Pinglin itself has been found. `wild-population-evidence` is left blank.

## Cultivars Grown Here

<!-- Which TTES cultivars are primarily associated with this region? Link to Cultivar notes. -->
<!-- cultivars-grown: only cultivars a source says are grown/produced here, as [[TTES-No-N]] links or plain names. Cultivars only sampled here go in the body, not the field. -->

Lee et al. (2017), Table 2, list two domestic made-tea samples from "Pinglin, New Taipei." Both were obtained through the TRES Tungding Substation and collected in November 2011 (per the literature note). The text describes the Chinhsuan samples as "produced in Pinglin." Both cultivars are therefore in `cultivars-grown`.
- **[[TTES-No-12]] (Chinhsuan)**, samples PJK570 and PJK574. Of 160 aligned ITS2 sites, 15 were SNPs (9.4%). Lee et al. (2017, text) call this the highest SNP frequency among the domestic Chinhsuan production areas sampled. The lowest was Jhushan, Nantou, at 1.3% (2/160). The domestic Chinhsuan average was 5.1% (8.1/160), per Lee et al. 2017, Table 4 and text.
  - Caveat: Table 4 lists Yilan (PJK907-909) at 12.5% (20/160), which is higher than Pinglin. See Source Conflicts.
- **Chin-Shin-Oolong** (Lee: "Chin Shin Oolong"), samples PJK550 and PJK552. The ITS2 SNP frequency was 10.6% (17/160), against a domestic Chin Shin Oolong average of 8.8% (14.1/160), per Lee et al. 2017, Table 4.

Lee et al. (2017) conclude that ITS2 can identify the variety of made tea but not its provenance. They also report that the provenance-diagnostic SNPs depend on which samples are analysed together. The Pinglin SNP figures therefore should not be read as a Pinglin "signature."

**Hu et al. (2023)**: the Wenshan Paochong tea sample from the Pinglin FA (ST02; stripe-shaped, light fermentation, light roasting) was classified as a single-cultivar product. Its genotypes at all 12 SSR loci were "unequivocally identified." The cultivar it matched is reported only in Fig. 4, which is not legible in the text extraction (`docs/markdown_pdf/`). It is not in `cultivars-grown` until identified. See Open Questions.

**Cultivar suitability for Paochong tea (not specific to Pinglin):**
- Hu et al. (2014), Table 1, mark Chin-Shin-Oolong and TTES-12 as suitable for Paochong ("P") and Oolong ("O") tea.
- Lee et al. (2017), Table 1, assign TTES No. 12 to tea types 2 (Oolong) and 5 (Pou Chong).
- Neither source ties these cultivars to Pinglin in particular.

**Landraces and cultivar names (association with Pinglin unconfirmed; not in `cultivars-grown`):**
- Hu et al. (2014) list Chin-Shin-Gantzy and Ying-Jy-Horng-Shin as "Planting in New Taipei City." They do not name a district.
- Several accessions carry "Wenshan" in their names: Wen-Shan-Zhi-Lan (L049) and Zhu-Ye-Wen-Shan (L052) in Hu et al. (2023); "Wen Sun Jy Lan" and "Wen Sun Dah Yeh Wu" in Lee et al. (2017). Neither source says these names refer to Pinglin.
- Hu et al. (2023) sampled many accessions at the "Wenshan" TRES plantation (Table 1), including TTES No. 1–6, 8–14, 17, 19, 20, 21, Chin-Shin-Oolong and Shy-Jih-Chuen. That is a germplasm sampling location, not evidence that these cultivars are grown commercially in Pinglin.

## Terroir Notes

<!-- Climate, soil, rainfall — relevant to the web app's map page context. -->

No vault source gives climate, soil, or rainfall for Pinglin.

The only processing details tied to Pinglin come from Hu et al. (2023), Table 2. Sample ST02 (Wenshan Paochong tea, Pinglin FA, spring 2020) has stripe appearance, light fermentation and light roasting. Its DNA was among the best of the nine specialty teas: multi-granular sampling gave 95.7 ± 1.4 µg/g (Table 5), and ST01–ST03 "showed strong chromatographic signals across 12 SSR loci."

## Source Conflicts

<!-- Explicitly document any disagreement between sources on any field above. -->
<!-- Format: [Source A] says X. [Source B] says Y. Decision: pending/use A/use B. Reason: -->

- **Pinglin's rank in Chinhsuan (TTES No. 12) ITS2 SNP frequency.** [[leeDNABarcodeIdentification2017]] (text) says the Pinglin samples PJK570 and PJK574 had the highest frequency among domestic production areas, 9.4% (15/160). [[leeDNABarcodeIdentification2017]] (Table 4) lists Yilan (PJK907-909) at 12.5% (20/160), higher than Pinglin. Checked against the PDF on 2026-11-10: the inconsistency is in the paper itself, not a conversion error. Decision: pending. Reason: Disagreement is inside one source, so the newest-source rule cannot decide it. Both values are kept in Cultivars Grown Here.

## Open Questions

- **Wenshan and Pinglin.** Is "Wenshan" (the Paochong production district) the same as Pinglin, does it include Pinglin, or is it a wider area? No vault source says. This needs a source that defines the Wenshan district before the two names can be linked or merged.
- **Location of the TRES "Wenshan" plantation and "Wunshan Branch."** Where are they, and are they the same unit? Hu et al. (2014) give only "New Taipei City 231." Hu et al. (2023) give only "Wenshan." No source places either one in Pinglin.
- **Cultivar in ST02.** Which cultivar did Hu et al. (2023) identify in the Pinglin Wenshan Paochong sample? The answer is in Fig. 4 of the PDF, which the markdown cache doesn't capture. It needs to be read from the PDF (see `docs/note_journal_map.md`); once known, it can be added to `cultivars-grown`.
- **Tea-growing-area coordinates.** Lat/lon are now the [[taiwan-gazetteer]] township point; the centre of the tea-growing area is still unsourced.
- **Elevation range, climate and soil.** These are not in any vault source.
- **Pinglin's share of cultivation.** Hu et al. (2014) give only city-level acreage for New Taipei (10.6%). Pinglin's own figure is unknown.
- **"Wenshan" cultivar names.** Do Wen-Shan-Zhi-Lan, Zhu-Ye-Wen-Shan, Wen Sun Jy Lan and Wen Sun Dah Yeh Wu come from Pinglin? No source says so.
- **Wild tea.** No source covers wild or naturalized tea in Pinglin specifically, so `wild-population-present` stays `unknown`.

## Source Notes

- [[leeDNABarcodeIdentification2017]]: Lee, S.-C., Wang, C.-H., Yen, C.-E., and Chang, C. (2017). *Journal of Food and Drug Analysis* 25: 260–274. Provides the Pinglin District made-tea samples: TTES No. 12 (PJK570, PJK574) and Chin Shin Oolong (PJK550, PJK552), with their ITS2 SNP frequencies.
- [[huSSRbasedMolecularDiagnosis2023]]: Hu, C.-Y., Tsai, H.-T., Chiu, C.-F., Su, T.-C., Le, N.H.K., and Yeh, S.-D. (2023). *Journal of Food and Drug Analysis* 31: 446–457. Provides the Wenshan Paochong tea sample ST02 from the Pinglin FA and the "Wenshan" TRES experimental plantation.
- [[huDevelopmentSTSCAPS2014]]: Hu, C.-Y., Tsai, Y.-Z., and Lin, S.-F. (2014). *Botanical Studies* 55: 12. Does not mention Pinglin by name. Used for the Wunshan Branch of TRES (author affiliation, New Taipei City 231), New Taipei City's 10.6% share of tea acreage, the New Taipei landraces, and Paochong suitability by cultivar.
- [[suConfirmationCamelliaFormosensis]]: Su, M.-H., Hsieh, C.-F., and Tsou, C.-H. (2009). *Botanical Studies* 50: 477–485. Used only for the *C. formosensis* distribution statement, which does not include New Taipei.
- [[taiwan-gazetteer]]: Wikidata extract (accessed 2026-11-10), item Q570245. Used for `name-zh` (坪林區), the current county and its former name (臺北縣 Taipei County), and the township-point lat/lon.

---
*Note: flip `verified: true` only when coordinates, elevation range, and cultivar associations are confirmed from a primary source.*
