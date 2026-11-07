# Repairing broken authors/year frontmatter

A since-fixed bug in `_templates/literature-note-template.md` produced `authors: [, , , ]`
(the loop ran over a citation string, not `creators`) and error text in `year:` (an unguarded
date format). Error text with a bare colon is invalid YAML and breaks Dataview and the
properties pane, so these are worth fixing even on notes already marked `read`.

This is a frontmatter fix only: leave the body sections, `extraction-status`, and checkboxes
as they are.

1. Convert the PDF if `docs/markdown_pdf/<citekey>.md` doesn't exist yet.
2. Read its title/byline block.
3. `authors`: surnames as printed, e.g. `authors: [Hu, Tsai, Lin]`; an institutional author
   keeps its full name. Update the body's `> **Authors:**` line with "First Last" per person.
4. `year`: the publication year as printed (cover line, received/accepted dates, copyright).
   An access or print date isn't a publication year — leave `year: ` blank if there isn't one.
   Update the body's `> **Year:**` line to match.
5. If the paper doesn't print a name or year, leave the field blank rather than recalling it.

Acceptable shapes: `authors: [Name1, Name2]` or `authors: []`; `year: 2019` or `year: `.
