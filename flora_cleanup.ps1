$floraDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\04_Flora_&_Fauna"
$allFiles = Get-ChildItem -Path $floraDir -Recurse -File -Filter "*.md"

$groups = $allFiles | Group-Object Name | Where-Object Count -gt 1

foreach ($group in $groups) {
    # Pick the first one as master
    $master = $group.Group[0]
    $duplicates = $group.Group | Select-Object -Skip 1
    
    foreach ($dup in $duplicates) {
        # Overwrite the duplicate's content with an embed to the master
        $embedLink = "![[$($master.BaseName)]]"
        Set-Content -Path $dup.FullName -Value $embedLink
        Write-Host "Replaced duplicate with embed: $($dup.FullName)"
    }
}
Write-Host "Flora & Fauna streamlined successfully."
