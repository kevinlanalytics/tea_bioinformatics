#!/bin/bash
# Dumps every literature note's citekey + Zotero item key + extraction-status as TSV:
#   citekey<TAB>item_key<TAB>extraction_status<TAB>note_path
#
# item_key is parsed from the note's `zotero-link: "zotero://select/library/items/<key>"` frontmatter field.
set -euo pipefail

NOTES_DIR="${1:-Sources/Literature-Notes}"

for f in "$NOTES_DIR"/*.md; do
  [ -e "$f" ] || continue
  citekey=$(grep -m1 '^citekey:' "$f" | sed 's/^citekey:[[:space:]]*//')
  item_key=$(grep -m1 '^zotero-link:' "$f" | sed -n 's#.*library/items/\([A-Z0-9]*\)".*#\1#p')
  status=$(grep -m1 '^extraction-status:' "$f" | sed 's/^extraction-status:[[:space:]]*//')
  printf '%s\t%s\t%s\t%s\n' "$citekey" "$item_key" "$status" "$f"
done
