---
citekey: {{citekey}}
title: "{{title}}"
authors: [{% for creator in creators %}{{ creator.name or creator.lastName }}{% if not loop.last %}, {% endif %}{% endfor %}]
year: {% if date %}{{ date | format("YYYY") }}{% endif %}
journal: "{{publicationTitle}}"
doi: "{{DOI}}"
url: "{{url}}"
zotero-link: "{{desktopURI}}"
extraction-status: unread
lineage-relevant: 
species-relevant: 
region-relevant: 
tags: [literature, source]
---

# {{title}}

> **Authors:** {% for creator in creators %}{% if creator.name %}{{ creator.name }}{% else %}{{ creator.firstName }} {{ creator.lastName }}{% endif %}{% if not loop.last %}, {% endif %}{% endfor %}
> **Year:** {% if date %}{{ date | format("YYYY") }}{% endif %}
> **Journal:** {{publicationTitle}}
> **DOI:** {{DOI}}
> [Open in Zotero]({{desktopURI}})

---

## Abstract

{{abstractNote}}

---

## Key Claims Relevant to Tea KG

<!-- What does this paper say that directly informs a node, relationship, or property in the graph? -->

## Cultivars / Species Mentioned

<!-- List every named cultivar or taxon. These become candidates for entity notes. -->

## Regions Mentioned

<!-- List every named geographic location. These become Region node candidates. -->

## Methods Used

<!-- Molecular method, survey method, breeding record, etc. Relevant for provenance tagging. -->

## Conflicts With Other Sources

<!-- Does this source disagree with another source already in the vault? Document explicitly. -->

## Extraction Status

- [ ] Key claims noted above
- [ ] Entity candidates identified
- [ ] Conflicts documented
- [ ] Ready to extract to CSV

---

## Annotations

{% for annotation in annotations %}
{% if annotation.color == "#ffd400" %}
### 🟡 Key Point
> {{annotation.annotatedText}}
{{annotation.comment}}

{% elif annotation.color == "#ff6666" %}
### 🔴 Conflict / Contradiction
> {{annotation.annotatedText}}
{{annotation.comment}}

{% elif annotation.color == "#5fb236" %}
### 🟢 Entity / Data
> {{annotation.annotatedText}}
{{annotation.comment}}

{% elif annotation.color == "#2ea8e5" %}
### 🔵 Method
> {{annotation.annotatedText}}
{{annotation.comment}}

{% else %}
### Note
> {{annotation.annotatedText}}
{{annotation.comment}}

{% endif %}
{% endfor %}
