#!/bin/bash
# Converts a PDF to Markdown using the local markitdown venv.
# Usage: convert_pdf.sh <input.pdf> <output.md>
set -euo pipefail

MARKITDOWN_BIN="${MARKITDOWN_BIN:-/Users/kevinlan/Documents/markitdown/.venv/bin/markitdown}"

if [ ! -x "$MARKITDOWN_BIN" ]; then
  echo "markitdown venv binary not found at $MARKITDOWN_BIN — falling back to 'markitdown' on PATH" >&2
  MARKITDOWN_BIN="markitdown"
fi

in="$1"
out="$2"
mkdir -p "$(dirname "$out")"
"$MARKITDOWN_BIN" "$in" -o "$out"
