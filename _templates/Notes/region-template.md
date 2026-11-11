<%*
const shortId = await tp.system.prompt("short ID (e.g. alishan)");
const nameZh = await tp.system.prompt("Chinese name (e.g. 阿里山)");
const nameEn = await tp.system.prompt("English name (e.g. Alishan)");
const county = await tp.system.prompt("Current county or city (e.g. Chiayi County)");
const canonicalId = "region_" + shortId;
%>
---
node-type: Region
canonical-id: <% canonicalId %>
name-zh: <% nameZh %>
name-en: <% nameEn %>
aliases: []
county: <% county %>
elevation-min-m: 
elevation-max-m: 
elevation-basis: 
lat: 
lon: 
coord-basis: 
wild-population-present: unknown
wild-population-evidence: 
cultivars-grown: []
sources: []
conflicts: []
verified: false
tags: [entity, region]
created: <% tp.date.now("YYYY-MM-DD") %>
---

# <% nameEn %> (<% nameZh %>)

**County:** <% county %>
**Canonical ID:** `<% canonicalId %>`

---

## Geographic Notes

<!-- Elevation range, climate type, location relative to other named regions. -->
<!-- county: current administrative name; give the source's older name (e.g. Kaohsiung County) here. -->
<!-- aliases: list each spelling variant with its basis: confirmed by a source (cite it) or assumed. -->

## Coordinates

<!-- Fill lat/lon for the map page. Use the approximate center of the tea-growing area. -->
<!-- Source your coordinates — don't guess. Papers first, then [[taiwan-gazetteer]]. -->
<!-- coord-basis: specimen (a sampled tree/site) | township-point (gazetteer point for the township) | area-centre -->
<!-- elevation-basis: specimen-label | area-survey | gazetteer. Only area-survey describes the tea-growing range. -->

| Field | Value | Source |
|---|---|---|
| Latitude | | |
| Longitude | | |
| Elevation min (m) | | |
| Elevation max (m) | | |

## Wild C. formosensis Populations

<!-- Is there documented presence of wild tea populations here? -->
<!-- Reference: Su et al. 2009 distribution map, NTU Experimental Forest reports. -->
<!-- wild-population-present: present | absent | unknown. absent needs a source saying so; no mention = unknown. -->
<!-- wild-population-evidence: dna-sample | herbarium-only | literature-mention -->

## Cultivars Grown Here

<!-- Which TTES cultivars are primarily associated with this region? Link to Cultivar notes. -->
<!-- cultivars-grown: only cultivars a source says are grown/produced here, as [[TTES-No-N]] links or plain names. Cultivars only sampled here go in the body, not the field. -->

## Terroir Notes

<!-- Climate, soil, rainfall — relevant to the web app's map page context. -->

## Source Conflicts

<!-- Explicitly document any disagreement between sources on any field above. -->
<!-- Format: [Source A] says X. [Source B] says Y. Decision: pending/use A/use B. Reason: -->

## Open Questions

## Source Notes

---
*Note: flip `verified: true` only when coordinates, elevation range, and cultivar associations are confirmed from a primary source.*
