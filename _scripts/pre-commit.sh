#!/bin/bash
# Regenerates images/trail/manifest.json from whatever image files are actually
# sitting in images/trail/. Run automatically by watch-and-commit.sh before every
# commit, so adding/removing/renaming files there (in Finder or Cursor) is all it
# takes to change the cursor-trail images — no code or manifest editing needed.

cd "$(dirname "$0")/.." || exit 1

node -e '
const fs = require("fs");
const dir = "images/trail";
const files = fs.readdirSync(dir)
  .filter(f => /\.(jpe?g|png|webp|gif)$/i.test(f))
  .sort();
fs.writeFileSync(dir + "/manifest.json", JSON.stringify(files, null, 2) + "\n");
'
