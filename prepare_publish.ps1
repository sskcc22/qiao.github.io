$ErrorActionPreference = "Stop"

$sourceDir = "c:\Users\skw\Desktop\qiao\qiao.github.io"
$publishDir = Join-Path $sourceDir "publish"

Write-Host "Preparing publish files..."
Write-Host "Source: $sourceDir"
Write-Host "Destination: $publishDir"

# Clean old directory
if (Test-Path $publishDir) {
    Write-Host "Cleaning old publish dir..."
    Remove-Item $publishDir -Recurse -Force
}

# Create new directory
Write-Host "Creating new publish dir..."
New-Item -ItemType Directory -Path $publishDir | Out-Null

# Files to exclude
$excludeFiles = @(
    "nginx.conf",
    "Dockerfile",
    "DEPLOY_TO_ALIYUN.md",
    "README.md",
    ".gitattributes",
    "prepare_publish.ps1"
)

# Get source files
$files = Get-ChildItem -Path $sourceDir -File
Write-Host "Found $($files.Count) files to process."

$copiedCount = 0
foreach ($file in $files) {
    if ($file.Name -notin $excludeFiles) {
        try {
            Copy-Item -Path $file.FullName -Destination $publishDir -Force
            $copiedCount++
        }
        catch {
            Write-Warning "Failed to copy file: $($file.Name). Error: $_"
        }
    }
}

Write-Host "Successfully copied $copiedCount files to publish folder."
Write-Host "Please check the publish folder."
