<%*
const shortId = await tp.system.prompt("short ID (e.g. tres)");
const nameZh = await tp.system.prompt("Chinese name (e.g. 行政院農業委員會茶業改良場)");
const nameEn = await tp.system.prompt("English name (e.g. Tea Research and Extension Station)");
const abbreviation = await tp.system.prompt("Abbreviation (e.g. TRES)");
const canonicalId = "institution_" + shortId;
%>
---
node-type: Institution
canonical-id: <% canonicalId %>
name-zh: <% nameZh %>
name-en: <% nameEn %>
abbreviation: <% abbreviation %>
aliases: []
founded-year: 
role: 
url: 
sources: []
conflicts: []
verified: false
tags: [entity, institution]
created: <% tp.date.now("YYYY-MM-DD") %>
---

# <% nameEn %> (<% abbreviation %>)

**Chinese name:** <% nameZh %>
**Canonical ID:** `<% canonicalId %>`

---

## Role in Taiwanese Tea

<!-- What does this institution do, specifically in the context of tea cultivar development or conservation? -->

## Cultivars Developed

<!-- Which TTES cultivars did this institution develop? Link to Cultivar notes. -->

## Key Publications

<!-- Bulletins, journals, reports produced by this institution that are in your Zotero library. -->

## Name History

<!-- Dated renamings and branch-station names, each with its source. List spelling variants in aliases. -->

## Source Conflicts

<!-- Explicitly document any disagreement between sources on any field above. -->
<!-- Format: [Source A] says X. [Source B] says Y. Decision: pending/use A/use B. Reason: -->

## Notes

## Source Notes

---
*Note: flip `verified: true` when name, founding year, and role are confirmed from a primary or institutional source.*
