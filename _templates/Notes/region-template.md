<%*
const shortId = await tp.system.prompt("short ID (e.g. alishan)");
const nameZh = await tp.system.prompt("Chinese name (e.g. 阿里山)");
const nameEn = await tp.system.prompt("English name (e.g. Alishan)");
const county = await tp.system.prompt("County (e.g. Chiayi County)");
const canonicalId = "region_" + shortId;
%>
---
node-type: Region
canonical-id: <% canonicalId %>
name-zh: <% nameZh %>
name-en: <% nameEn %>
county: <% county %>
elevation-min-m: 
elevation-max-m: 
lat: 
lon: 
wild-population-present: false
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

## Coordinates

<!-- Fill lat/lon for the map page. Use the approximate center of the tea-growing area. -->
<!-- Source your coordinates — don't guess. Google Maps, Taiwan government GIS data, etc. -->

| Field | Value | Source |
|---|---|---|
| Latitude | | |
| Longitude | | |
| Elevation min (m) | | |
| Elevation max (m) | | |

## Wild C. formosensis Populations

<!-- Is there documented presence of wild tea populations here? -->
<!-- Reference: Su et al. 2009 distribution map, NTU Experimental Forest reports. -->

## Cultivars Grown Here

<!-- Which TTES cultivars are primarily associated with this region? Link to Cultivar notes. -->

## Terroir Notes

<!-- Climate, soil, rainfall — relevant to the web app's map page context. -->

## Open Questions

## Source Notes

---
*Note: flip `verified: true` only when coordinates, elevation range, and cultivar associations are confirmed from a primary source.*
