<%*
const nameEn = await tp.system.prompt("Process name (e.g. Roasting)");
const nameZh = await tp.system.prompt("Chinese name (e.g. 焙火) — leave blank unless a source gives it");
%>
---
type: tea-process
name: <% nameEn %>
name-zh: <% nameZh %>
verified: false
sources: []
---

# <% nameEn %>

## Definition
<!-- What happens during this process? Cite the source. -->

## Distinguishing features
<!-- What separates it from similar processes? -->

## Variations
<!-- Relevant differences in temperature, duration, or method, with sources. -->
