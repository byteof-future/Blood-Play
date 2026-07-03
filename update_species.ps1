$speciesDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Species"
$files = Get-ChildItem -Path $speciesDir -Filter "*.md" -File

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $speciesName = $file.BaseName
    
    # Defaults
    $str = "+0"; $res = "+0"; $int = "+0"; $hp = "+0"; $mp = "+0"
    
    # Extract core stats
    if ($content -match "\|\s*Strength\s*\|\s*([-\d]+)") { $str = $matches[1] }
    if ($content -match "\|\s*Resistance\s*\|\s*([-\d]+)") { $res = $matches[1] }
    if ($content -match "\|\s*Inteligence\s*\|\s*([-\d]+)" -or $content -match "\|\s*Intelligence\s*\|\s*([-\d]+)") { $int = $matches[1] }
    if ($content -match "\|\s*Health Points\s*\|\s*([-\d]+)") { $hp = $matches[1] }
    if ($content -match "\|\s*Mana Points\s*\|\s*([-\d]+)") { $mp = $matches[1] }
    
    # Sub-stats
    $substats = @{}
    $substatNames = @("Agility", "Aim", "Coordination", "Deception", "Dexterity", "Ingenuity", "Insight", "Intimidation", "Perception", "Reflex", "Seduction", "Stealth", "Will")
    foreach ($sn in $substatNames) {
        if ($content -match "\|\s*$sn\s*\|\s*([-\d]+)") {
            $val = $matches[1]
            if ($val -notmatch "^[-+]") { $val = "+$val" }
            $substats[$sn] = $val
        } else {
            $substats[$sn] = "+0"
        }
    }
    
    # Format core stats to have + if positive
    if ($str -notmatch "^[-+]") { $str = "+$str" }
    if ($res -notmatch "^[-+]") { $res = "+$res" }
    if ($int -notmatch "^[-+]") { $int = "+$int" }
    if ($hp -notmatch "^[-+]") { $hp = "+$hp" }
    if ($mp -notmatch "^[-+]") { $mp = "+$mp" }
    
    # Extract Traits
    $traitsBlock = ""
    if ($content -match "(?is)## Race [Ss]pecific Traits\s*(.*)") {
        $traitsBlock = $matches[1]
    } elseif ($content -match "(?is)## Traits\s*(.*)") {
        $traitsBlock = $matches[1]
    }
    
    # Parse traits
    $traitsList = @()
    $lines = $traitsBlock -split "\r?\n"
    foreach ($line in $lines) {
        if ($line -match "^\s*\*\*\s*(.*?)\s*\*\*\s*-\s*(.*)") {
            $traitsList += "* **$($matches[1]):** $($matches[2])"
        } elseif ($line -match "^\s*\*\s*\*\*(.*?)\*\*\s*[:-]\s*(.*)") {
            $traitsList += "* **$($matches[1]):** $($matches[2])"
        } elseif ($line.Trim() -ne "") {
            if ($line -match "^\*\*") {
                $line = $line -replace "\*\*\s*-\s*", "**:"
                $traitsList += "* $line"
            }
        }
    }
    
    $traitsString = $traitsList -join "`n"
    if ([string]::IsNullOrWhiteSpace($traitsString)) {
        $traitsString = "* **[Trait 1 Name]:** [Description]"
    }
    
    # Generate new content
    $newContent = @"
# $speciesName

*A brief description of the species, their culture, and their place in the world.*

---

## 🛡️ Species Base Stats
*When creating a character of this species, these are your starting core stats before applying any Class or Attribute points.*

| Stat             | Base Score | Modifier |
| :--------------- | :--------: | :------: |
| **Strength**     |     $str     |    +0    |
| **Resistance**   |     $res     |    +0    |
| **Intelligence** |     $int     |    +0    |
| **Health Score** |     $hp     |    -     |
| **Mana Score**   |     $mp     |    -     |

---

## 📊 Species Base Sub-Stats
*Starting sub-stats for this species.*

| Sub-Stat         | Score | Sub-Stat         | Score |
| :--------------- | :---: | :--------------- | :---: |
| **Agility**      |  $($substats['Agility'])   | **Intimidation** |  $($substats['Intimidation'])   |
| **Aim**          |  $($substats['Aim'])   | **Perception**   |  $($substats['Perception'])   |
| **Coordination** |  $($substats['Coordination'])   | **Reflex**       |  $($substats['Reflex'])   |
| **Deception**    |  $($substats['Deception'])   | **Seduction**    |  $($substats['Seduction'])   |
| **Dexterity**    |  $($substats['Dexterity'])   | **Stealth**      |  $($substats['Stealth'])   |
| **Ingenuity**    |  $($substats['Ingenuity'])   | **Will**         |  $($substats['Will'])   |
| **Insight**      |  $($substats['Insight'])   |                  |       |

---

## 🧬 Traits
*Copy these directly into the "Race Traits" section of your Character Sheet.*

### Race Traits
$traitsString
"@

    Set-Content -Path $file.FullName -Value $newContent
    Write-Host "Updated species: $speciesName"
}
