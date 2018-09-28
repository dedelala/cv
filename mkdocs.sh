#!/bin/sh

die() { echo "oh noes: $* gone bad" 1>&2; exit 1; }

n=$(basename "$PWD") || die "doc name"
d=$(mktemp -d) || "tmp dir"
trap 'rm -rf "$d"' EXIT

md="$d/$n.md"
html="$d/$n.html"
pdf="$n.pdf"

cat "$@" > "$md" || die "cat md"

css=/root/style.css
if [ -r style.css ]; then
        css=style.css
fi

pandoc -s -f markdown+smart -H "$css" -o "$html" "$md" || die "create html"

wkhtmltopdf -T 25mm -L 25mm -R 25mm -B 25mm "$html" "$pdf" || die "create pdf"

