#!/bin/sh

tmpfile="$(mktemp)"
file="packages.x86_64"

sort "$file" > "$tmpfile"
uniq "$tmpfile" > "$file"
