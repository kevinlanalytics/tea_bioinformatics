---
name: refresh-literature-notes
description: Sync literature notes with Zotero — update docs/note_journal_map.md, convert source PDFs to Markdown with markitdown, and fill each note from its converted text. For new or unread papers, refreshing a note, or broken authors/year frontmatter.
---

# Refresh literature notes

Run from the project root.

## 1. Find what needs work

```bash
.claude/skills/refresh-literature-notes/scripts/scan_zotero_attachments.sh   # item_key  attachment_key  filename  has_parent
.claude/skills/refresh-literature-notes/scripts/list_note_keys.sh            # citekey  item_key  extraction_status  note_path
.claude/skills/refresh-literature-notes/scripts/check_broken_frontmatter.sh  # citekey  issue(authors|year)  note_path
```

Compare against the table in `docs/note_journal_map.md`:

- A note whose citekey isn't in the map → match its `item_key` to an attachment; the PDF is
  `~/Zotero/storage/<attachment_key>/<filename>`.
- An attachment no note points to → list it under the map's orphan section if `has_parent=0`;
  otherwise tell the user a note is missing (the Obsidian import creates notes, not this skill).
- `extraction-status: unread`, or a note the user named → needs extraction.
- Anything `check_broken_frontmatter.sh` reports → needs a frontmatter repair; see
  `references/frontmatter-repair.md`. Older notes carry this from a since-fixed template bug,
  whatever their extraction status.

## 2. Update the map

Add rows for new citekey ↔ PDF pairs and new orphans, keeping the existing table format.
Leave rows alone unless the Zotero mapping changed. You make this edit, not the subagents.

## 3. Convert PDFs

```bash
.claude/skills/refresh-literature-notes/scripts/convert_pdf.sh "<pdf path>" "docs/markdown_pdf/<citekey>.md"
```

Reuse an existing conversion when it's newer than the PDF. markitdown sometimes glues words in
two-column layouts (`asaninvaluableresource`) — the words are all there, read carefully.

## 4. Fill the notes

Hand each paper to a `paper-extractor` agent with the two paths
(`docs/markdown_pdf/<citekey>.md`, `Sources/Literature-Notes/<citekey>.md`). Papers are
independent, so run them in parallel. Without subagents, follow
`.claude/agents/paper-extractor.md` yourself.

Do frontmatter-only repairs yourself per `references/frontmatter-repair.md`.

## 5. Afterwards

Report what changed, and suggest the `cross-check-sources` skill for the touched notes.
