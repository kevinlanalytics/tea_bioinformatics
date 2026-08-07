#!/bin/bash
# Dumps every Zotero item that has a PDF (or other file) attachment as TSV:
#   item_key<TAB>attachment_key<TAB>filename<TAB>has_parent
#
# item_key is empty for standalone/orphan attachments (has_parent=0).
# attachment_key is the folder name under ~/Zotero/storage/.
# Reads a throwaway copy of zotero.sqlite so it works even while Zotero is running.
set -euo pipefail

ZOTERO_DB="${ZOTERO_DB:-$HOME/Zotero/zotero.sqlite}"
TMP_DB="$(mktemp -t zotero_scan).sqlite"
trap 'rm -f "$TMP_DB"' EXIT

cp "$ZOTERO_DB" "$TMP_DB"

sqlite3 -separator '	' "$TMP_DB" "
SELECT
  IFNULL(parentItem.key, ''),
  attItem.key,
  REPLACE(ia.path, 'storage:', ''),
  CASE WHEN parentItem.key IS NULL THEN 0 ELSE 1 END
FROM itemAttachments ia
JOIN items attItem ON attItem.itemID = ia.itemID
LEFT JOIN items parentItem ON parentItem.itemID = ia.parentItemID
WHERE ia.path LIKE 'storage:%'
ORDER BY 1, 2;
"
