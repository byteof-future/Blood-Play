$updatedDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Spells\All Spells"
$mainDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\03_Compendium\Spellbook\All Spells"

# 1. Update any spells in mainDir that aren't in updatedDir
$mainFiles = Get-ChildItem -Path $mainDir -Filter "*.md" -File
foreach ($mFile in $mainFiles) {
    $uPath = Join-Path $updatedDir $mFile.Name
    if (-not (Test-Path $uPath)) {
        # Spell is unique to 03_Compendium. We must apply the new damage formula!
        $content = Get-Content $mFile.FullName -Raw
        if ($content -match "Actual Damage is (\d+)d(\d+)\s*\+\s*(\d+)") {
            $dice = "d" + $matches[2]
            $newFormula = "Damage Formula: (IM * ($dice + P)) + IS"
            $content = $content -replace "Actual Damage is \d+d\d+\s*\+\s*\d+.*", $newFormula
            Set-Content -Path $mFile.FullName -Value $content
            Write-Host "Updated formula for unique spell: $($mFile.Name)"
        }
    }
}

# 2. Copy all files from updatedDir to mainDir, overwriting the old ones
Copy-Item -Path "$updatedDir\*" -Destination $mainDir -Force

# 3. Move the Master Spell Book and Spells by Type to 03_Compendium
Move-Item -Path "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Spells\Master Spell Book.md" -Destination "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\03_Compendium\Spellbook\Master Spell Book.md" -Force
Move-Item -Path "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Spells\Spells by Type.md" -Destination "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\03_Compendium\Spellbook\Spells by Type.md" -Force
Move-Item -Path "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Spells\SpellBook.md" -Destination "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\03_Compendium\Spellbook\SpellBook.md" -Force -ErrorAction SilentlyContinue

# 4. Delete the root Spells directory
Remove-Item -Path "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Spells" -Recurse -Force
Write-Host "Spells consolidated successfully."
