# Obsidian + Zotero Integration Configuration
_Last verified: 2026-08-07_

---

# Purpose

This document records the complete setup and debugging process for integrating **Obsidian** with **Zotero Integration** for the Taiwan Tea Heritage Knowledge Graph project.

This serves two purposes:

1. Human documentation so configuration is reproducible.
2. Machine-readable context for future AI assistants to quickly understand the vault architecture, diagnose failures, and avoid repeating previous troubleshooting.

---

# Overall Architecture

The project intentionally separates literature from knowledge synthesis.

```
Zotero Library
      │
      ▼
Import Format (Zotero Integration)
      │
      ▼
Literature Notes
Sources/Literature-Notes/{citekey}.md
      │
      │ human reads paper
      ▼
Entity Notes
Entities/Cultivars/
Entities/Species/
Entities/Regions/
...
      │
      ▼
Export Script
      │
      ▼
DuckDB
      │
      ▼
Neo4j
      │
      ▼
Public Web Application
```

The Zotero Integration plugin is responsible **only** for automatically generating Literature Notes.

It is **not** responsible for knowledge synthesis.

---

# Files Used

Template file

```
_templates/literature-note-template.md
```

Import destination

```
Sources/Literature-Notes/
```

Import format name

```
Tea bioinformatics journals import
```

---

# Working Configuration

## Output Path

```
Sources/Literature-Notes/{{citekey}}.md
```

Purpose:

Determines

- destination folder
- filename

Example

```
huDevelopmentSTSCAPS2014

↓

Sources/Literature-Notes/huDevelopmentSTSCAPS2014.md
```

This is the setting that actually determines where imported markdown files are created.

---

## Template File

```
_templates/literature-note-template.md
```

This template contains Nunjucks variables like

```yaml
---
citekey: {{citekey}}
title: "{{title}}"
year: {{date | format("YYYY")}}
---
```

The Zotero Integration plugin renders these variables during import.

---

## Note Import Location

```
Sources/Literature-Notes
```

Purpose:

This is **NOT** the same thing as Output Path.

It simply tells the plugin

> Imported notes belong in this folder.

It does NOT

- rename files
- execute templates
- determine filenames

It behaves more like a default destination folder.

---

## Database

```
Zotero
```

The plugin reads directly from the local Zotero database.

Zotero must be running.

---

# Commands Available

The command palette exposes several commands.

Example

```
Zotero Integration:
    Import notes
    Data explorer
    Insert notes into current document
    Tea bioinformatics journals import
```

These commands have different purposes.

---

## Import notes

Purpose:

Imports Zotero Notes.

This is NOT the custom import workflow.

Using this command may bypass the custom Import Format.

Avoid using this for literature note generation.

---

## Insert notes into current document

Purpose:

Insert existing Zotero notes into the currently open Obsidian document.

Not relevant for literature import.

---

## Tea bioinformatics journals import

This is the custom Import Format.

This command should always be used.

It applies

- template
- output path
- image settings
- filename templating
- all import configuration

This is the correct workflow.

---

# Correct Import Workflow

Step 1

Open Command Palette

```
Cmd + P
```

Step 2

Run

```
Zotero Integration:
Tea bioinformatics journals import
```

Step 3

Select ONE paper.

Step 4

Press

```
✓
```

Step 5

The plugin generates

```
Sources/Literature-Notes/{citekey}.md
```

using

```
_templates/literature-note-template.md
```

---

# Expected Result

A successful import begins with rendered YAML.

Example

```yaml
---
citekey: huDevelopmentSTSCAPS2014
title: "Development of STS..."
authors:
year: 2014
journal: Scientia Horticulturae
doi:
...
---
```

Notice

```
{{title}}
```

has become

```
Development of STS...
```

meaning the template rendered successfully.

---

# Troubleshooting History

This section records problems encountered during setup.

---

## Problem 1

Imported notes appeared in the wrong location.

Symptoms

```
Files created outside

Sources/Literature-Notes
```

Cause

Incorrect folder configuration.

Resolution

Set

```
Output Path

Sources/Literature-Notes/{{citekey}}.md
```

and

```
Note Import Location

Sources/Literature-Notes
```

---

## Problem 2

Template appeared to be ignored.

Observed symptoms

Imported notes did not contain the expected frontmatter.

Initially suspected causes

- incorrect template path
- broken Nunjucks syntax
- Better BibTeX
- Output Path
- plugin bug

Actual investigation

Verified

✓ Template file existed

✓ Template syntax looked correct

✓ Output Path correct

✓ Database = Zotero

✓ Better BibTeX installed

The missing piece was discovering that the Command Palette contained multiple Zotero commands.

The command being used previously was

```
Import notes
```

instead of

```
Tea bioinformatics journals import
```

The latter is the custom Import Format.

Once this command was used,

the template rendered correctly.

---

# Debugging Checklist

Whenever imports fail, verify in this order.

## 1

Template file exists

```
_templates/literature-note-template.md
```

---

## 2

Output Path

```
Sources/Literature-Notes/{{citekey}}.md
```

---

## 3

Database

```
Zotero
```

---

## 4

Better BibTeX installed.

Citation Keys exist.

Example

```
huDevelopmentSTSCAPS2014
```

---

## 5

Zotero application running.

---

## 6

Delete one existing test note.

Some importers won't overwrite.

---

## 7

Run

```
Tea bioinformatics journals import
```

NOT

```
Import notes
```

---

## 8

Verify generated YAML.

Variables should be rendered.

Never

```
{{title}}
```

Always

```
Development of...
```

---

# AI Agent Guidance

Future AI assistants should assume the following.

The custom Import Format is the canonical workflow.

Never recommend

```
Import notes
```

unless the user explicitly wants Zotero Notes.

The literature note architecture intentionally separates

- source extraction

from

- entity synthesis.

Do not collapse these layers.

Do not suggest moving bibliographic metadata into Entity Notes.

Literature Notes are provenance records.

Entity Notes are canonical synthesized knowledge.

---

# Lessons Learned

The root cause was **not** a broken template.

It was understanding that the Zotero Integration plugin exposes multiple commands, each serving a different purpose.

The custom Import Format is effectively a user-defined workflow and must be invoked explicitly.

Future troubleshooting should always verify:

1. Which command is being executed.
2. Which Import Format it invokes.
3. Whether the generated YAML contains rendered values instead of raw template variables.

Only after those checks should template syntax or plugin configuration be investigated.

---

End of document.
