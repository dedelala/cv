#!/bin/sh

set -o pipefail

die() { echo "oh noes: $* gone bad" 1>&2; exit 1; }

docs="header.md cv.md footer.md metadata.yaml"
html="index.html"
pdf="esme-lamb-cv.pdf"

css=/root/style.css
if [ -r style.css ]; then
        css=style.css
fi

echo "====== CONVERTING TO HTML ======"
echo "$docs" | xargs pandoc -s -f markdown+smart -H "$css" -o "$html" \
|| die "create html"

echo "====== PRINTING TO PDF ======"
weasyprint --full-fonts --hinting "$html" "$pdf" || die "create pdf"
