$spellDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Spells\All Spells"
$masterFile = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Spells\Master Spell Book.md"
$byTypeFile = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Spells\Spells by Type.md"

$files = Get-ChildItem -Path $spellDir -Filter "*.md" -File

$masterTable = @()
$masterTable += "| Lvl | Spell | Time | MP | Effect | Range | Duration | Dmg Formula | Actual Dmg |"
$masterTable += "|---|---|---|---|---|---|---|---|---|"

$spellsByType = @{}

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    $name = $file.BaseName
    
    $time = ""
    if ($content -match "CastingTime::(.*?)\n") { $time = $matches[1].Trim() }
    
    $mp = ""
    if ($content -match "MPCost::(.*?)\n") { $mp = $matches[1].Trim() }
    
    $effect = ""
    if ($content -match "PrimaryEffect::(.*?)\n") { $effect = $matches[1].Trim() }
    
    $range = ""
    if ($content -match "Range::(.*?)\n") { $range = $matches[1].Trim() }
    
    $duration = ""
    if ($content -match "Duration::(.*?)\n") { $duration = $matches[1].Trim() }
    
    $type = "Unknown"
    if ($content -match "SpellType:\s*(.*?)\n") { $type = $matches[1].Trim() }
    
    $lvl = "-"
    if ($content -match "_Level (\d+)") { $lvl = $matches[1] }

    $dmgFormula = ""
    
    if ($content -match "Actual Damage is (\d+)d(\d+)\s*\+\s*(\d+)") {
        $dice = "d" + $matches[2]
        $newFormula = "Damage Formula: (IM * ($dice + P)) + IS"
        $content = $content -replace "Actual Damage is \d+d\d+\s*\+\s*\d+.*", $newFormula
        Set-Content -Path $file.FullName -Value $content
        $dmgFormula = "(IM * ($dice + P)) + IS"
    } elseif ($content -match "Damage Formula:\s*\((.*?)\)") {
        $dmgFormula = "(" + $matches[1] + ")"
    }

    $row = "| $lvl | **$name** | $time | $mp | $effect | $range | $duration | $dmgFormula | |"
    $masterTable += $row
    
    if (-not $spellsByType.ContainsKey($type)) {
        $spellsByType[$type] = @()
    }
    $spellsByType[$type] += $row
}

Set-Content -Path $masterFile -Value "# Master Spell Book

"
Add-Content -Path $masterFile -Value ($masterTable -join "
")

Set-Content -Path $byTypeFile -Value "# Spells by Type

"
foreach ($t in $spellsByType.Keys | Sort-Object) {
    Add-Content -Path $byTypeFile -Value "## $t
"
    Add-Content -Path $byTypeFile -Value "| Lvl | Spell | Time | MP | Effect | Range | Duration | Dmg Formula | Actual Dmg |"
    Add-Content -Path $byTypeFile -Value "|---|---|---|---|---|---|---|---|---|"
    Add-Content -Path $byTypeFile -Value ($spellsByType[$t] -join "
")
    Add-Content -Path $byTypeFile -Value "
"
}
Write-Host "Processed $($files.Count) files."
