#!/bin/bash
# Flags literature notes whose frontmatter still carries the pre-fix
# Nunjucks authors/year bug (see _templates/literature-note-template.md history:
# `authors` used to loop over a flat citation string char-by-char instead of
# `creators`, and `year` called .format() on an unset date with no guard).
# Runs independently of extraction-status, since notes already marked `read`
# can still carry this bug — it predates the content-extraction pass entirely.
#
# Output TSV: citekey<TAB>issue<TAB>note_path
#   issue = "authors" and/or "year" (one row per issue found per note)
set -euo pipefail

NOTES_DIR="${1:-Sources/Literature-Notes}"

for f in "$NOTES_DIR"/*.md; do
  [ -e "$f" ] || continue
  citekey=$(grep -m1 '^citekey:' "$f" | sed 's/^citekey:[[:space:]]*//')
  authors_line=$(grep -m1 '^authors:' "$f" || true)
  year_line=$(grep -m1 '^year:' "$f" || true)

  # Broken authors: N empty slots (only commas/whitespace between the brackets).
  # A clean "authors: []" (genuinely zero creators, e.g. some webpage items) is NOT broken.
  if echo "$authors_line" | grep -qE '^authors: \[[, ]+\]$'; then
    printf '%s\tauthors\t%s\n' "$citekey" "$f"
  fi

  # Broken year: literal template-rendering error text landed in the value.
  if echo "$year_line" | grep -q 'Error:'; then
    printf '%s\tyear\t%s\n' "$citekey" "$f"
  fi
done
