$updatedDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Monsters Rebalanced to new mechanics"
$mainDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Monsters"

$mainFiles = Get-ChildItem -Path $mainDir -Filter "*.md" -File
foreach ($mFile in $mainFiles) {
    $uPath = Join-Path $updatedDir $mFile.Name
    if (-not (Test-Path $uPath)) {
        # Unique to Monsters. Apply AHP/RN.
        $lines = Get-Content $mFile.FullName
        $newLines = @()
        $currentRes = 0
        
        foreach ($line in $lines) {
            $newLines += $line
            if ($line -match "\|\s*Resistance\s*\|\s*(\d+)\s*\|") {
                $currentRes = [int]$matches[1]
            }
            if ($line -match "\|\s*Core Health\s*\|") {
                $rn = $currentRes * 5
                $newLines += "| Combined RN  | $rn    | -        |"
                $newLines += "| Armor HP(AHP)| 0      | -        |"
            }
        }
        Set-Content -Path $mFile.FullName -Value ($newLines -join "`n")
        Write-Host "Updated stats for unique monster: $($mFile.Name)"
    }
}

Copy-Item -Path "$updatedDir\*" -Destination $mainDir -Force
Remove-Item -Path $updatedDir -Recurse -Force
Write-Host "Monsters consolidated successfully."
