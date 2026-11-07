# Entity Note Creation — Setup & Walkthrough Guide
## Taiwan Tea Heritage Knowledge Graph

**Status: verified working** as of 2026-08-07, following two bug fixes documented in §5.

**Purpose.** Complete, step-by-step instructions for setting up Templater's folder-template automation and creating entity notes (Cultivars, Species, Regions, Institutions) correctly on the first try. This supersedes the original `TEMPLATER-FOLDER-TEMPLATE-SETUP.md` by incorporating what was actually verified during setup, including two real template bugs and their fixes.

---

# 1. Prerequisites

Confirm these exist before starting:

```text
_templates/Notes/
  cultivar-template.md
  species-template.md
  region-template.md
  institution-template.md

_templates/
  literature-note-template.md   (separate system — Zotero Integration, not covered here)

Entities/
  Cultivars/
  Species/
  Regions/
  Institutions/
```

If any entity template file is missing, or if you're unsure whether yours contains the fix in §5, **replace all four with the corrected versions** before proceeding — the setup steps below will not produce correct results with the buggy originals.

---

# 2. Update Templater

1. Obsidian → **Settings** → **Community plugins**
2. Find **Templater** in the installed list
3. Click **Check for updates** / **Update** if available
4. Confirm it shows as **Enabled**

Version confirmed working for this setup: `2.25.0` or later.

---

# 3. Set the Template Folder Location

1. **Settings** → **Templater**
2. Under **General Settings**, find **Template folder location**
3. Set it to:
   ```
   _templates/Notes
   ```
4. No leading slash.

This tells Templater where template *source files* live. It does **not** control which template applies to which destination folder — that's a separate setting, covered next.

---

# 4. Enable Folder Template Automation

1. Still in **Settings** → **Templater**
2. Find **File Creation** (may be a subsection or require scrolling)
3. Locate **Trigger Templater on new file creation** → toggle **on**
4. Locate the **Template matching mode** (sometimes shown as part of the same section) → set to **Folder templates**
   - Confirm **File regex templates** is **off** — these two modes are mutually exclusive
5. Under **Folder Templates**, add four mapping rules:

| Destination folder (left field) | Template file (right field) |
|---|---|
| `Entities/Cultivars` | `_templates/Notes/cultivar-template.md` |
| `Entities/Species` | `_templates/Notes/species-template.md` |
| `Entities/Regions` | `_templates/Notes/region-template.md` |
| `Entities/Institutions` | `_templates/Notes/institution-template.md` |

**Important — a mistake that produces a specific error:**

Do **not** put `_templates/Notes` itself in the left-hand **destination folder** field. That field means "when a note is created *here*, apply this template" — `_templates/Notes` is where templates are *stored*, not a place you create entity notes. Mapping it as a destination causes:

```
This folder already has a template associated with it
```

The left field must always be one of the four `Entities/...` subfolders, never `_templates/Notes`.

6. Close Settings (Obsidian auto-saves).

---

# 5. Known Bugs in the Original Templates — Already Fixed, Verify Your Copies

Two real bugs were found during setup and testing. If your template files predate this fix, replace them. If you're unsure, check for these two patterns directly.

## 5.1 Bug: hyphenated frontmatter field names accessed with dot notation

**Symptom when this bug is present:**
```
Templater Error: Template parsing error, aborting.
zh is not defined
```

**Cause.** Lines like this in the template body:
```
<% tp.frontmatter.name-zh %>
```
JavaScript parses `name-zh` as `name` **minus** a variable called `zh`. Since no such variable exists, Templater throws an error and aborts — producing a blank note with a popup error.

**Fix.** Any frontmatter field name containing a hyphen must be accessed with **bracket notation**, not dot notation:
```
<% tp.frontmatter["name-zh"] %>
```

**Check all four template files** for this pattern. As shipped (post-fix), the affected lines look like this:

*species-template.md:*
```
# <% tp.frontmatter["scientific-name"] %>
**Chinese name:** <% tp.frontmatter["name-zh"] %>
**Canonical ID:** `<% tp.frontmatter["canonical-id"] %>`
```

*cultivar-template.md:*
```
# <% tp.frontmatter["name-en"] %> (TTES No. <% tp.frontmatter["ttes-number"] %>)
**Chinese name:** <% tp.frontmatter["name-zh"] %>
**Canonical ID:** `<% tp.frontmatter["canonical-id"] %>`
```

*region-template.md:*
```
# <% tp.frontmatter["name-en"] %> (<% tp.frontmatter["name-zh"] %>)
**County:** <% tp.frontmatter.county %>
**Canonical ID:** `<% tp.frontmatter["canonical-id"] %>`
```
(Note: `county` has no hyphen, so dot notation is fine there — only hyphenated field names need brackets.)

*institution-template.md:*
```
# <% tp.frontmatter["name-en"] %> (<% tp.frontmatter.abbreviation %>)
**Chinese name:** <% tp.frontmatter["name-zh"] %>
**Canonical ID:** `<% tp.frontmatter["canonical-id"] %>`
```

**Diagnostic note for future template edits:** this bug is easy to reintroduce. Anytime you add a new frontmatter field with a hyphen in its name (e.g. `year-released`, `parent-confidence`) and later reference it in the template body, use bracket notation from the start.

## 5.2 Pitfall: doubling the ID prefix at the prompt

**Symptom.** `canonical-id` ends up as `species_species_c_formosensis` instead of `species_c_formosensis`.

**Cause.** Not a template bug — a data-entry mistake. The template line is:
```yaml
canonical-id: species_<% tp.system.prompt("short ID (e.g. c_formosensis)") %>
```
The template already writes the `species_` prefix literally, before the prompt's answer is inserted. If you type `species_c_formosensis` at the prompt (including the prefix), you get it twice.

**Fix — at the prompt, type only the part after the prefix:**

| Template | Prompt asks for | Type this |
|---|---|---|
| species-template | short ID | `c_formosensis` — not `species_c_formosensis` |
| cultivar-template | TTES number | just the number, e.g. `12` — check the `canonical-id` line for the exact prefix pattern before typing |
| region-template | short ID | e.g. `alishan` — not `region_alishan` |
| institution-template | short ID | e.g. `tres` — not `institution_tres` |

Before running a prompt for the first time on a given template, open the template file and look at exactly how the `canonical-id` (or `region-` / `institution-` equivalent) line is constructed, so you know whether a prefix is already hard-coded.

---

# 6. Creating an Entity Note — Full Walkthrough

## 6.1 Species (worked example: Camellia formosensis)

1. Right-click `Entities/Species` in the file explorer → **New note**
2. **Name the file directly at creation** — type `Camellia-formosensis`, not "Untitled" followed by a rename later. (Renaming after the fact doesn't cause problems, but naming it correctly up front avoids a stray "Untitled" note if you forget the rename step.)
3. Templater should fire **immediately** on creation — a sequence of prompt dialogs appears
4. Answer each prompt as it appears:

   | Prompt | Example answer |
   |---|---|
   | short ID | `c_formosensis` |
   | Scientific name | `Camellia formosensis` |
   | Chinese name | `台灣山茶` |
   | English name | `Taiwan Wild Tea` |

5. The note populates with:
   - Frontmatter: `node-type: Species`, `canonical-id: species_c_formosensis`, `scientific-name: Camellia formosensis`, `name-zh: 台灣山茶`, `name-en: Taiwan Wild Tea`, plus empty fields (`taxonomic-type`, `first-described-year`, `iucn-status`, `conservation-notes`, `regions: []`, `sources: []`, `conflicts: []`, `verified: false`, `tags: [entity, species]`, `created:` today's date)
   - Body: a rendered H1 heading (`# Camellia formosensis`), Chinese name and Canonical ID lines, and empty section headers (`## Taxonomic Notes`, `## Distribution`, `## Conservation Status`, `## Relationship to Bred Cultivars`, `## Molecular Evidence`, `## Source Conflicts`, `## Open Questions`, `## Source Notes`)

6. **Verify before filling in content:** open the note and confirm no `<% %>` syntax and no `undefined` text appears anywhere. If either appears, stop and see §7 (Troubleshooting) before continuing.

## 6.2 Filling in real content

With the shell correctly generated, fill in each section using your already-validated literature notes as the source. For *Camellia formosensis* specifically, the primary source is the Su et al. 2009 confirmation paper (`suConfirmationCamelliaFormosensis` citekey).

- `## Taxonomic Notes` — the RPB2 nuclear gene evidence separating it from *C. sinensis* var. *sinensis* and var. *assamica*
- `## Distribution` — Nantou, Yunlin, Chiayi, Kaohsiung, Pingtung, Taitung Counties; 800–1,800m elevation
- `## Conservation Status` — population decline concern; NTU Experimental Forest Administration's Fonghuang Mountain proposal
- `## Relationship to Bred Cultivars` — e.g. TTES No. 18's cross to a wild population
- Fill `sources: [suConfirmationCamelliaFormosensis]` in the frontmatter to record provenance

**Do not flip `verified: true`** until the content is complete and reviewed. This is the project's export gate — nothing with `verified: false` becomes a CSV row or graph node later.

## 6.3 Repeating for Cultivars, Regions, Institutions

Same mechanical pattern, different folder and template:

- `Entities/Cultivars` → prompts for TTES number, breeding code, Chinese/English name
- `Entities/Regions` → prompts for short ID, Chinese/English name, county
- `Entities/Institutions` → prompts for short ID, Chinese/English name, abbreviation

Check each template's `canonical-id` line before the first use, per §5.2, to know whether to include or omit a prefix at the prompt.

---

# 7. Troubleshooting

Work through in this order.

## 7.1 Note creates but stays blank, with a popup error

- Open the Developer Console (`Cmd+Option+I`) immediately after retrying — the error appears in red
- `"[field] is not defined"` → this is the §5.1 bug pattern. Check the template body for dot-notation access on a hyphenated field name; fix with bracket notation
- Any other error text → note the exact wording and the plugin name shown (e.g. `plugin:templater-obsidian:...`) before further diagnosis

## 7.2 Prompts never appear at all — note is created instantly with the template's literal text unrendered

Check in this order:

1. Is Templater actually enabled? (Settings → Community plugins)
2. Is **Trigger Templater on new file creation** toggled on?
3. Is **Template matching mode** set to **Folder templates** (not `None`, not `File regex templates`)?
4. Does the destination folder path in your Folder Templates mapping exactly match the real vault folder — including capitalization? `Entities/Species` and `entities/species` are not the same.
5. Does the mapped template file actually exist at the path specified? A typo in the right-hand field will fail silently in some Templater versions.

## 7.3 Frontmatter shows correct values, but body text shows `undefined`

This means the note was created **before** a template fix was saved, or the body still contains the old dot-notation syntax. Templater does not retroactively re-render existing notes — editing the template file only affects notes created *after* the edit.

**Fix:** delete the stale note, confirm the template file on disk shows the corrected bracket-notation syntax, then create a fresh note.

## 7.4 `canonical-id` (or similar) shows a doubled prefix

This is the §5.2 data-entry pitfall, not a bug. Delete the note, recreate it, and at the relevant prompt type only the suffix — check the template's frontmatter line to see exactly what prefix is already hard-coded before answering.

## 7.5 "This folder already has a template associated with it"

You mapped `_templates/Notes` (or another template-storage folder) as a **destination** folder in Folder Templates. Destination folders must always be one of the `Entities/...` subfolders — never the folder where templates themselves live. Remove the incorrect mapping and re-add it pointing at the correct `Entities/...` subfolder.

## 7.6 New note doesn't trigger the template at all, but no error appears either

- Confirm you're creating the note **inside** the mapped folder (right-click *on* `Entities/Species`, not a parent folder, then **New note**) — creating a note elsewhere and moving it into the folder afterward will not trigger Templater, since the trigger fires only at creation time inside the mapped folder
- Confirm the note was created **after** the Folder Templates settings were saved — pre-existing empty notes do not retroactively pick up a newly configured mapping

---

# 8. Quick Reference — Full Working Recipe

```text
1. Right-click destination folder (e.g. Entities/Species) → New note
2. Name it immediately (e.g. Camellia-formosensis) — don't leave as "Untitled"
3. Templater fires automatically, prompts appear in sequence
4. Answer each prompt (check canonical-id prefix pattern first — §5.2)
5. Confirm no <% %> syntax or "undefined" text in the result
6. Fill in body sections from validated literature notes
7. Cite sources in the `sources:` frontmatter field
8. Leave verified: false until content is complete and reviewed
9. Flip verified: true only when done — this is the export gate
```

---

# 9. Cross-References

- Original setup instructions this guide supersedes: `TEMPLATER-FOLDER-TEMPLATE-SETUP.md`
- Two-layer note architecture, entity note field reference: `LITERATURE-NOTE-ARCHITECTURE.md`, Parts 1 and 5
- Verification gate rule: `LITERATURE-NOTE-ARCHITECTURE.md`, §4.2
- Templater vs. Zotero Integration syntax distinction: `LITERATURE-NOTE-ARCHITECTURE.md`, §7.10
- Session history / goal framing for entity note work: `SESSION-LOG-entity-note-setup.md`
