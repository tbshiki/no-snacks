#!/bin/sh
# Builds dist/tbshiki-no-snacks.zip for upload via WordPress admin (Plugins > Add New > Upload).
# macOS / Linux counterpart of build.ps1.
set -eu

slug="tbshiki-no-snacks"
root=$(cd "$(dirname "$0")" && pwd)
dist="$root/dist"
zip_path="$dist/$slug.zip"
files="$slug.php"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

mkdir -p "$tmp/$slug" "$dist"
for file in $files; do
	cp "$root/$file" "$tmp/$slug/"
done

rm -f "$zip_path"
# -X omits extra file attributes so the archive holds only the plugin files.
(cd "$tmp" && zip -rqX "$zip_path" "$slug")

echo "Built $zip_path"
