#!/usr/bin/env bash
set -e

url_escape() {
  echo "$(echo -n "$1" | python -c "
import urllib
import sys
sys.stdout.write(urllib.quote(sys.stdin.read()))
  ")"
}

TAGS_DIR="Thread Tags"
OUTFILE="tags.txt"
echo "$(url_escape "${TAGS_DIR}")" > "${OUTFILE}"

# Abuse command substition to strip trailing newline.
printf %s "$(find "${TAGS_DIR}" -name "*.png" -exec basename {} \;)" >> "${OUTFILE}"

# If this script is used as a pre-commit hook, tags.txt is added to the index despite it not being listed in the commit message.
git add "${OUTFILE}"
