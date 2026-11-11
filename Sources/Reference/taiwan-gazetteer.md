---
node-type: Reference
citekey: taiwan-gazetteer
title: Taiwan place-name gazetteer (Wikidata extract)
source: Wikidata (https://www.wikidata.org), queried via https://query.wikidata.org/sparql
accessed: 2026-11-10
tags: [reference, gazetteer]
---

# Taiwan place-name gazetteer

Reference source for place data the papers don't give: Chinese place names, current
administrative area (county / special municipality), and an approximate point location. Cite it
in entity notes as `[[taiwan-gazetteer]]`. Adopted 2026-11-10 (see `issues.md` ISS-007, ISS-010,
ISS-015).

**What it is and isn't.**
- Values come from Wikidata, a community-maintained structured database, not from an official
  Taiwan government gazetteer. The Ministry of the Interior's place-name service
  (https://gn.moi.gov.tw/geonames/) is the preferred official source but has no documented
  public API, so it wasn't used. Replace values here with official ones when they are captured
  (ideally into Zotero).
- Township coordinates are Wikidata's single point for the whole township (usually near the
  township seat), **not** the centre of the tea-growing area. Use them for map placement only.
- Township elevations in Wikidata describe that point, not the tea-growing range, so they are
  **not** used for `elevation-min-m` / `elevation-max-m`.

## Entries

| Region note | Wikidata item | Chinese name | English label | Current administrative area | Lat | Lon |
|---|---|---|---|---|---|---|
| [[Alishan]] | [Q709917](https://www.wikidata.org/wiki/Q709917) | 阿里山鄉 | Alishan Township | 嘉義縣 Chiayi County | 23.35 | 120.8 |
| [[Liouguei]] | [Q712920](https://www.wikidata.org/wiki/Q712920) | 六龜區 | Liouguei District | 高雄市 Kaohsiung (City) | 22.997 | 120.648 |
| [[Lugu]] | [Q712911](https://www.wikidata.org/wiki/Q712911) | 鹿谷鄉 | Lugu Township | 南投縣 Nantou County | 23.75 | 120.733333 |
| [[Luye]] | [Q712915](https://www.wikidata.org/wiki/Q712915) | 鹿野鄉 | Luye | 臺東縣 Taitung County | 22.9525 | 121.163 |
| [[Pinglin]] | [Q570245](https://www.wikidata.org/wiki/Q570245) | 坪林區 | Pinglin District | 新北市 New Taipei City (formerly 臺北縣 Taipei County) | 24.924444 | 121.726667 |
| [[Yuchi]] | [Q708696](https://www.wikidata.org/wiki/Q708696) | 魚池鄉 | Yuchih Township | 南投縣 Nantou County | 23.883333 | 120.916667 |
| [[Meiyuanshan]] | [Q31600306](https://www.wikidata.org/wiki/Q31600306) | 眉原山 | Meiyuan Shan | not given (summit; no administrative area recorded) | 24.1138 | 120.9869 |
| [[Yongkang-Mountain]] | — | — | — | — | — | — |

Notes:
- **Meiyuanshan = 眉原山** is an inference: Wikidata's summit "Meiyuan Shan" lies about 0.7 km
  from the C. formosensis tree that [[liang-jongwangPlastomeCamelliaFormosensis2024]] locates at
  24.10736, 120.98606 ("Meiyuanshan"). No source states the Chinese name for the paper's site.
- **Yongkang Mountain (永康山)** has no Wikidata item. A query for 永康山 and the Taitung township
  延平鄉 (Q712965, 22.9, 120.983333) found no link between them, so nothing is recorded.
- Wikidata lists Pinglin under both 臺北縣 (historical) and 新北市 (current, since the 2010
  reorganisation per Wikidata).
- Query used (2026-11-10): items with Chinese label 鹿谷鄉, 魚池鄉, 阿里山鄉, 六龜區, 鹿野鄉, 坪林區,
  延平鄉, 眉原山, 永康山; properties P625 (coordinates), P131 (located in administrative entity),
  P2044 (elevation).
