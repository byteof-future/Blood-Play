$classDir = "c:\OBSIDIAN\VAULTS\Blood play\Blood-Play\Classes"

$focuses = @{
    "Alchemist" = "Brewmaster's Insight - Potions you craft have their effects increased by 50%."
    "Artificer" = "Master Crafter - You can attune to one additional magical item."
    "Barbarian" = "Blood Thirsty - Deals 2x dmg once after every time u hit CHP."
    "Bard" = "Encore - Once per combat, you can grant an ally a free immediate action."
    "Beast Master" = "Primal Bond - Your companion shares your RN and benefits from your abilities."
    "Cleric" = "Divine Intervention - Healing spells restore an additional amount equal to your Class Level."
    "Druid" = "Nature's Chosen - You can communicate with all beasts and plants at will."
    "Fighter" = "Weapon Master - Critical hits deal x3 damage and ignore physical resistance."
    "Monk" = "Flowing Ki - Unarmed strikes bypass armor completely."
    "Necromancer" = "Undying Thralls - Minions you summon have double their base HP."
    "Paladin" = "Aura of Justice - Allies within 15ft gain +5 to their RN."
    "Ranger" = "Infinite Ammo - Gain 2 proficiency levels with any projectile weapon."
    "Rogue" = "Shadow Strike - Attacks against targets who haven't acted yet automatically critically hit."
    "Runesmith" = "Runic Resonance - Runes you carve take half the time to prepare and trigger twice."
    "Sorcerer" = "Arcane Bloodline - Spells cost 10% less MP and you add INT to concentration checks."
    "Spirit Medium" = "Ethereal Sight - You can see into the spirit world and interact with incorporeal beings."
    "Summoner" = "Dual Summon - You can maintain two summoned creatures simultaneously."
    "Warlock" = "Eldritch Pact - You regenerate 10% of your maximum MP every time you kill an enemy."
    "Witch" = "Hex Weaver - Enemies have disadvantage on saving throws against your curses."
    "Wizard" = "Spellbook Savant - You learn two additional spells every time you gain a Class Level."
}

$template = @"
# {0}

## Class Focus (Single-Class Only)
_Granted at Character Creation. Lost if you multiclass._
**{1}**

## Abilities (Odd Class Levels)
*(Cost 1 AP unless specified)*
### Level 1 Abilities (Choose 1)
1. 
2. 
3. 

## Skills (Even Class Levels)
### Level 2 Skills (Choose 1)
1. 
2. 
3. 
"@

foreach ($kvp in $focuses.GetEnumerator()) {
    $className = $kvp.Key
    $focusDesc = $kvp.Value
    $filePath = Join-Path $classDir "$className.md"
    
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        if ([string]::IsNullOrWhiteSpace($content)) {
            $newContent = $template -f $className, $focusDesc
            Set-Content $filePath -Value $newContent
        } else {
            if (-not ($content -match "Class Focus")) {
                $inject = "`n## Class Focus (Single-Class Only)`n_Granted at Character Creation. Lost if you multiclass._`n**$focusDesc**`n"
                
                # Simple injection at the top of the file but after the title/quote
                if ($content -match "(?s)^([^\n]+\n[^\n]*\n)(.*)") {
                    $content = $content -replace "(?s)^([^\n]+\n[^\n]*\n)(.*)", "`${1}$inject`${2}"
                    Set-Content $filePath -Value $content
                } else {
                    Set-Content $filePath -Value ("$inject`n" + $content)
                }
            }
        }
    } else {
        $newContent = $template -f $className, $focusDesc
        Set-Content $filePath -Value $newContent
    }
}
Write-Host "Updated all 20 classes with Single-Class Focuses."
