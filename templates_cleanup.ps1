$mainDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\05_Assets\Templates"
$oldDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Templates"

$oldFiles = Get-ChildItem -Path $oldDir -Recurse -File
foreach ($file in $oldFiles) {
    $exists = Get-ChildItem -Path $mainDir -Recurse -Filter $file.Name | Select-Object -First 1
    if (-not $exists) {
        Copy-Item -Path $file.FullName -Destination $mainDir -Force
        Write-Host "Moved unique template: $($file.Name)"
    }
}
Remove-Item -Path $oldDir -Recurse -Force
Write-Host "Templates consolidated successfully."
