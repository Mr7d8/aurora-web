#!/bin/sh
# Wraps src/workspace.html (the Claude Artifact source, which has no document skeleton)
# into a standalone dist/index.html for static hosting. Vercel runs this on every deploy (see vercel.json).
set -e
cd "$(dirname "$0")"
SRC=src/workspace.html
OUT=dist/index.html
mkdir -p dist
TITLE=$(sed -n 's:.*<title>\(.*\)</title>.*:\1:p' "$SRC" | head -1)
DESC="An AI workspace where agents plan, research, design, code and deploy together."
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n'
  printf '<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  # Browser chrome colour per theme; the page script updates both when the user picks Light or Dark explicitly.
  printf '<meta name="theme-color" content="#16181D" media="(prefers-color-scheme: dark)">\n'
  printf '<meta name="theme-color" content="#ECEEF1" media="(prefers-color-scheme: light)">\n'
  printf '<meta name="description" content="%s">\n' "$DESC"
  printf '<meta property="og:title" content="%s">\n' "$TITLE"
  printf '<meta property="og:description" content="%s">\n' "$DESC"
  printf '<meta property="og:type" content="website">\n'
  printf '<link rel="icon" href="data:image/svg+xml,%%3Csvg xmlns=%%27http://www.w3.org/2000/svg%%27 viewBox=%%270 0 32 32%%27%%3E%%3Cdefs%%3E%%3CradialGradient id=%%27g%%27 cx=%%27.45%%27 cy=%%27.3%%27 r=%%27.7%%27%%3E%%3Cstop offset=%%270%%27 stop-color=%%27%%23F2E3AE%%27/%%3E%%3Cstop offset=%%27.55%%27 stop-color=%%27%%23DFC066%%27/%%3E%%3Cstop offset=%%271%%27 stop-color=%%27%%23C09D40%%27/%%3E%%3C/radialGradient%%3E%%3C/defs%%3E%%3Ccircle cx=%%2716%%27 cy=%%2716%%27 r=%%2715%%27 fill=%%27url(%%23g)%%27/%%3E%%3Cpath d=%%27M10.5 14a2.2 2.2 0 0 1 4.4 0zM17.1 14a2.2 2.2 0 0 1 4.4 0z%%27 fill=%%27%%23121216%%27/%%3E%%3Cpath d=%%27M12.6 18.4c2 1.6 4.8 1.6 6.8 0%%27 fill=%%27none%%27 stroke=%%27%%23121216%%27 stroke-width=%%271.4%%27 stroke-linecap=%%27round%%27/%%3E%%3C/svg%%3E">\n'
  printf '<title>%s</title>\n' "$TITLE"
  printf '<style>[hidden]{display:none!important}</style>\n'
  # Font links and the main stylesheet: everything up to the first closing style tag.
  grep -v '<title>' "$SRC" | sed -n '1,/^<\/style>/p'
  printf '</head>\n<body>\n'
  # Markup and script: everything after that closing style tag.
  sed -n '/^<\/style>/,$p' "$SRC" | sed '1d'
  printf '</body>\n</html>\n'
} > "$OUT"
echo "Built $OUT from $SRC"
