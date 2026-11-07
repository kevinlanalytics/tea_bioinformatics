<%*
const shortId = await tp.system.prompt("short ID (e.g. c_formosensis)");
const scientificName = await tp.system.prompt("Scientific name (e.g. Camellia formosensis)");
const nameZh = await tp.system.prompt("Chinese name (e.g. 台灣山茶)");
const nameEn = await tp.system.prompt("English name (e.g. Taiwan Wild Tea)");
const canonicalId = "species_" + shortId;
%>
---
node-type: Species
canonical-id: <% canonicalId %>
scientific-name: <% scientificName %>
name-zh: <% nameZh %>
name-en: <% nameEn %>
taxonomic-type: 
first-described-year: 
iucn-status: 
conservation-notes: 
regions: []
sources: []
conflicts: []
verified: false
tags: [entity, species]
created: <% tp.date.now("YYYY-MM-DD") %>
---

# <% scientificName %>

**Chinese name:** <% nameZh %>
**Canonical ID:** `<% canonicalId %>`

---

## Taxonomic Notes

<!-- History of classification. Note any reclassifications or disputes. -->
<!-- E.g. Laitou and Shueijing populations misclassified across Lai 2001, Hu 2014, Lee 2017 -->

## Distribution

<!-- Which regions / counties / elevations is this species documented in? -->
<!-- Link to Region notes. -->

## Conservation Status

<!-- Is it designated? Proposed for designation? At risk? -->

## Relationship to Bred Cultivars

<!-- Which TTES cultivars carry this species in their lineage? -->
<!-- E.g. TTES No. 18 (Ruby Red) is a direct C. formosensis × Burma Assamica cross -->

## Molecular Evidence

<!-- ITS2 barcoding, SSR, plastome — what molecular studies confirm this taxon? -->

## Source Conflicts

<!-- Taxonomic disputes between sources — document here with provenance chain. -->

## Open Questions

## Source Notes

---
*Note: flip `verified: true` in frontmatter only when taxonomic status, distribution, and key source conflicts are resolved.*
