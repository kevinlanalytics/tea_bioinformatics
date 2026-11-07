<%*
const ttesNumber = await tp.system.prompt("TTES number (e.g. 12)");
const nameZh = await tp.system.prompt("Chinese name (e.g. 金萱)");
const nameEn = await tp.system.prompt("English name (e.g. Jin Xuan)");
const canonicalId = "cultivar_" + ttesNumber;
%>
---
node-type: Cultivar
canonical-id: <% canonicalId %>
ttes-number: <% ttesNumber %>
breeding-code: 
name-zh: <% nameZh %>
name-en: <% nameEn %>
year-released: 
purpose: 
parent-1: 
parent-2: 
parent-confidence: 
regions: []
sources: []
conflicts: []
verified: false
tags: [entity, cultivar]
created: <% tp.date.now("YYYY-MM-DD") %>
---

# <% nameEn %> (TTES No. <% ttesNumber %>)

**Chinese name:** <% nameZh %>
**Canonical ID:** `<% canonicalId %>`

---

## Known Facts

<!-- Fill in what is verified from primary sources. Every claim should cite a source. -->

| Field | Value | Source |
|---|---|---|
| Year released | | |
| Purpose (oolong/black/green) | | |
| Parent 1 | | |
| Parent 2 | | |
| Primary growing regions | | |

## Parentage Notes

<!-- Describe the breeding cross in prose. Note if sources disagree on parentage. -->

## Geographic Range

<!-- Which named regions grow this cultivar? Link to Region notes. -->

## Relationship to Wild Species

<!-- Does this cultivar trace back to C. formosensis? Note the lineage path. -->

## Source Conflicts

<!-- Explicitly document any disagreement between sources on any field above. -->
<!-- Format: [Source A] says X. [Source B] says Y. Decision: pending/use A/use B. Reason: -->

## Open Questions

<!-- What do you still need to verify before flipping verified: true? -->

## Source Notes

<!-- Link to relevant literature notes -->

---
*Note: flip `verified: true` in frontmatter only when all required fields in the table above are filled and all open questions are resolved.*
