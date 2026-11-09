#!/bin/sh
# Builds dist/no-snacks.zip for upload via WordPress admin (Plugins > Add New > Upload).
# macOS / Linux counterpart of build.ps1.
set -eu

root=$(cd "$(dirname "$0")" && pwd)
dist="$root/dist"
zip_path="$dist/no-snacks.zip"
files="no-snacks.php"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

mkdir -p "$tmp/no-snacks" "$dist"
for file in $files; do
	cp "$root/$file" "$tmp/no-snacks/"
done

rm -f "$zip_path"
# -X omits extra file attributes so the archive holds only the plugin files.
(cd "$tmp" && zip -rqX "$zip_path" no-snacks)

echo "Built $zip_path"
