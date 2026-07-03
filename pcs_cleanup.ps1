$sheetsDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\01_Characters\PC Sheets"
$pcsDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\01_Characters\PCs"

$map = @{
    "Strarrul_Greenskin_CharacterSheet.md" = "Green Skin\Strarrul Greenskin.md"
    "Hunter_Moonshine_CharacterSheet.md" = "Hunter Moonshine\Hunter Moonshine.md"
    "Kael_Issac_CharacterSheet.md" = "Kael Issac\Kael Issac.md"
    "Kaien_Kagari_CharacterSheet.md" = "Kaien_Kagari\Kaien Kagari.md"
    "Lucien_Vorth_CharacterSheet.md" = "Lucien vorth\Lucien Vorth.md"
    "Rigel_Corvus_CharacterSheet.md" = "Rigel Corvus\Rigel Corvus.md"
    "Flint Lockwood.md" = "Flint Lockwood\Flint Lockwood.md"
    "Jeff.md" = "Jeff\Jeff.md"
    "Kirmanda.md" = "Kirmanda\Kirmanda.md"
}

foreach ($kvp in $map.GetEnumerator()) {
    $sourcePath = Join-Path $sheetsDir $kvp.Key
    $destRel = $kvp.Value
    $destPath = Join-Path $pcsDir $destRel
    $destFolder = Split-Path $destPath
    
    if (Test-Path $sourcePath) {
        if (-not (Test-Path $destFolder)) {
            New-Item -ItemType Directory -Path $destFolder | Out-Null
        }
        Move-Item -Path $sourcePath -Destination $destPath -Force
        Write-Host "Moved $($kvp.Key) to $destRel"
    }
}

# Now delete the PC Sheets directory if we got them all
$remaining = Get-ChildItem -Path $sheetsDir -File
if ($remaining.Count -eq 0) {
    Remove-Item -Path $sheetsDir -Recurse -Force
    Write-Host "PC Sheets consolidated and folder removed."
} else {
    Write-Host "There are still files in PC Sheets, not deleting root folder."
}
