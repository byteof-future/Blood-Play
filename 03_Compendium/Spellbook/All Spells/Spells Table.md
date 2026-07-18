
```dataview
TABLE 
From "03_Compendium/Spellbook/All Spells"
sort file.name ASC
```
```dataview
TABLE SpellLevel, MPCost, CastingMethod, Range, CastingTime, Duration
From ""
WHERE contains(file.tags, "#Spell")
Sort SpellLevel ASC

```
sort file.name ASC

WHERE contains(file.tags, "#Bard")