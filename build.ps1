# Builds dist/no-snacks.zip for upload via WordPress admin (Plugins > Add New > Upload).
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem

$slug = 'no-snacks'
$root = $PSScriptRoot
$dist = Join-Path $root 'dist'
$zipPath = Join-Path $dist "$slug.zip"
$files = @('tbshiki-no-snacks.php')

New-Item -ItemType Directory -Force $dist | Out-Null
if (Test-Path $zipPath) { Remove-Item $zipPath }

$zip = [System.IO.Compression.ZipFile]::Open($zipPath, 'Create')
try {
	foreach ($file in $files) {
		# Entry names use forward slashes so the archive extracts correctly on Linux hosts.
		[System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
			$zip, (Join-Path $root $file), "$slug/$file") | Out-Null
	}
} finally {
	$zip.Dispose()
}

"Built $zipPath"
