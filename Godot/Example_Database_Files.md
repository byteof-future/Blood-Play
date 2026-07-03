# RENDITION - Example Database Files

## races.json
```json
{
	"races": [
		{
			"id": "human",
			"name": "Human",
			"description": "Versatile and adaptable, humans are the most populous race.",
			"stat_bonuses": {
				"strength": 2,
				"resistance": 2,
				"intelligence": 2,
				"health_points": 3,
				"mana_points": 3,
				"coordination": 1,
				"will": 1,
				"perception": 1
			},
			"hp_ratio": {
				"ward": 0.5,
				"core": 0.5
			},
			"innate_traits": ["Adaptable", "Versatile Training"],
			"portrait": "res://assets/portraits/human.png"
		},
		{
			"id": "elf",
			"name": "Elf",
			"description": "Graceful and magically attuned beings with keen senses.",
			"stat_bonuses": {
				"strength": 1,
				"resistance": 1,
				"intelligence": 4,
				"health_points": 2,
				"mana_points": 5,
				"perception": 2,
				"dexterity": 1,
				"agility": 1
			},
			"hp_ratio": {
				"ward": 0.4,
				"core": 0.6
			},
			"innate_traits": ["Keen Senses", "Arcane Affinity", "Trance"],
			"portrait": "res://assets/portraits/elf.png"
		},
		{
			"id": "dwarf",
			"name": "Dwarf",
			"description": "Hardy and resilient, dwarves are masters of crafting and endurance.",
			"stat_bonuses": {
				"strength": 3,
				"resistance": 4,
				"intelligence": 2,
				"health_points": 5,
				"mana_points": 1,
				"will": 2,
				"intimidation": 1
			},
			"hp_ratio": {
				"ward": 0.6,
				"core": 0.4
			},
			"innate_traits": ["Stone Resilience", "Craft Mastery", "Darkvision"],
			"portrait": "res://assets/portraits/dwarf.png"
		},
		{
			"id": "hobgoblin",
			"name": "Hobgoblin",
			"description": "Militaristic and disciplined warriors with tactical minds.",
			"stat_bonuses": {
				"strength": 3,
				"resistance": 2,
				"intelligence": 2,
				"health_points": 5,
				"mana_points": 2,
				"intimidation": 2,
				"coordination": 1
			},
			"hp_ratio": {
				"ward": 0.7,
				"core": 0.3
			},
			"innate_traits": ["Military Discipline", "Iron Will", "Tactical Advantage"],
			"portrait": "res://assets/portraits/hobgoblin.png"
		},
		{
			"id": "tiefling",
			"name": "Tiefling",
			"description": "Infernal heritage grants them charisma and innate magic.",
			"stat_bonuses": {
				"strength": 1,
				"resistance": 2,
				"intelligence": 3,
				"health_points": 2,
				"mana_points": 4,
				"seduction": 2,
				"deception": 2,
				"will": 1
			},
			"hp_ratio": {
				"ward": 0.45,
				"core": 0.55
			},
			"innate_traits": ["Infernal Resistance", "Hellish Rebuke", "Darkvision"],
			"portrait": "res://assets/portraits/tiefling.png"
		}
	]
}
```

## origins.json
```json
{
	"origins": [
		{
			"id": "noble",
			"name": "Noble",
			"description": "Born into privilege, trained in etiquette and leadership.",
			"stat_bonuses": {
				"intelligence": 1,
				"mana_points": 1,
				"seduction": 1,
				"insight": 1,
				"will": 1
			}
		},
		{
			"id": "street_urchin",
			"name": "Street Urchin",
			"description": "Grew up on the streets, learning to survive by wit and stealth.",
			"stat_bonuses": {
				"agility": 2,
				"stealth": 1,
				"deception": 1,
				"reflex": 1
			}
		},
		{
			"id": "soldier",
			"name": "Soldier",
			"description": "Trained in military discipline and combat tactics.",
			"stat_bonuses": {
				"strength": 1,
				"resistance": 1,
				"health_points": 1,
				"intimidation": 1,
				"coordination": 1
			}
		},
		{
			"id": "scholar",
			"name": "Scholar",
			"description": "Devoted to study and the pursuit of knowledge.",
			"stat_bonuses": {
				"intelligence": 2,
				"mana_points": 1,
				"insight": 1,
				"perception": 1
			}
		},
		{
			"id": "outlander",
			"name": "Outlander",
			"description": "Raised in the wilderness, attuned to nature's ways.",
			"stat_bonuses": {
				"strength": 1,
				"health_points": 1,
				"perception": 1,
				"stealth": 1,
				"reflex": 1
			}
		}
	]
}
```

## backgrounds.json
```json
{
	"backgrounds": [
		{
			"id": "mercenary",
			"name": "Mercenary",
			"description": "Fought for coin and learned to handle any job.",
			"stat_bonuses": {
				"strength": 2,
				"resistance": 1,
				"health_points": 2,
				"intimidation": 1,
				"aim": 1
			}
		},
		{
			"id": "artisan",
			"name": "Artisan",
			"description": "Skilled craftsperson with keen attention to detail.",
			"stat_bonuses": {
				"intelligence": 1,
				"dexterity": 2,
				"coordination": 2,
				"ingenuity": 1,
				"perception": 1
			}
		},
		{
			"id": "acolyte",
			"name": "Acolyte",
			"description": "Devoted follower of a deity or philosophy.",
			"stat_bonuses": {
				"intelligence": 1,
				"mana_points": 2,
				"will": 2,
				"insight": 1,
				"seduction": 1
			}
		},
		{
			"id": "criminal",
			"name": "Criminal",
			"description": "Made a living through less-than-legal means.",
			"stat_bonuses": {
				"agility": 2,
				"dexterity": 1,
				"stealth": 2,
				"deception": 1,
				"reflex": 1
			}
		},
		{
			"id": "entertainer",
			"name": "Entertainer",
			"description": "Performer who captivates audiences with talent and charm.",
			"stat_bonuses": {
				"agility": 1,
				"seduction": 2,
				"deception": 1,
				"perception": 1,
				"coordination": 2
			}
		}
	]
}
```

## weapons.json
```json
{
	"weapons": [
		{
			"id": "dagger",
			"name": "Dagger",
			"damage_type": "piercing",
			"damage_dice": 4,
			"damage_formula": "(SM + P)d4 + SS",
			"properties": ["Light", "Thrown (20/40 ft)", "Finesse"],
			"proficiency_type": "blade",
			"weight": 1,
			"cost": 20
		},
		{
			"id": "shortsword",
			"name": "Shortsword",
			"damage_type": "slashing",
			"damage_dice": 6,
			"damage_formula": "(SM + P)d6 + SS",
			"properties": ["Light", "Finesse"],
			"proficiency_type": "blade",
			"weight": 2,
			"cost": 100
		},
		{
			"id": "longsword",
			"name": "Longsword",
			"damage_type": "slashing",
			"damage_dice": 8,
			"damage_formula": "(SM + P)d8 + SS",
			"properties": ["Versatile"],
			"proficiency_type": "blade",
			"weight": 3,
			"cost": 150
		},
		{
			"id": "greatsword",
			"name": "Greatsword",
			"damage_type": "slashing",
			"damage_dice": 12,
			"damage_formula": "(SM + P)d12 + SS",
			"properties": ["Two-Handed", "Heavy"],
			"proficiency_type": "blade",
			"weight": 6,
			"cost": 500
		},
		{
			"id": "battleaxe",
			"name": "Battleaxe",
			"damage_type": "slashing",
			"damage_dice": 8,
			"damage_formula": "(SM + P)d8 + SS",
			"properties": ["Versatile"],
			"proficiency_type": "axe",
			"weight": 4,
			"cost": 100
		},
		{
			"id": "warhammer",
			"name": "Warhammer",
			"damage_type": "blunt",
			"damage_dice": 8,
			"damage_formula": "(SM + P)d8 + SS",
			"properties": ["Versatile"],
			"proficiency_type": "hammer",
			"weight": 5,
			"cost": 150
		},
		{
			"id": "spear",
			"name": "Spear",
			"damage_type": "piercing",
			"damage_dice": 6,
			"damage_formula": "(SM + P)d6 + SS",
			"properties": ["Thrown (20/60 ft)", "Versatile"],
			"proficiency_type": "polearm",
			"weight": 3,
			"cost": 10
		},
		{
			"id": "longbow",
			"name": "Longbow",
			"damage_type": "piercing",
			"damage_dice": 8,
			"damage_formula": "(SM + P + AIM)d8",
			"properties": ["Two-Handed", "Range (150/600 ft)"],
			"proficiency_type": "bow",
			"weight": 2,
			"cost": 500
		},
		{
			"id": "crossbow",
			"name": "Crossbow",
			"damage_type": "piercing",
			"damage_dice": 10,
			"damage_formula": "(SM + P)d10",
			"properties": ["Two-Handed", "Range (100/400 ft)", "Loading"],
			"proficiency_type": "crossbow",
			"weight": 5,
			"cost": 750
		},
		{
			"id": "staff",
			"name": "Staff",
			"damage_type": "blunt",
			"damage_dice": 6,
			"damage_formula": "(SM + P)d6 + SS",
			"properties": ["Two-Handed", "Versatile", "Arcane Focus"],
			"proficiency_type": "staff",
			"weight": 4,
			"cost": 50
		}
	]
}
```

## armor.json
```json
{
	"armor": [
		{
			"id": "none",
			"name": "No Armor",
			"armor_class": 0,
			"arn": 0,
			"max_ahp": 0,
			"effects": [],
			"penalties": [],
			"weight": 0,
			"cost": 0
		},
		{
			"id": "padded",
			"name": "Padded Clothes",
			"armor_class": 1,
			"arn": 5,
			"max_ahp": 1000,
			"effects": [],
			"penalties": [],
			"weight": 8,
			"cost": 50
		},
		{
			"id": "leather",
			"name": "Leather Armor",
			"armor_class": 2,
			"arn": 10,
			"max_ahp": 2000,
			"effects": ["Stealth +1"],
			"penalties": [],
			"weight": 10,
			"cost": 100
		},
		{
			"id": "reinforced_leather",
			"name": "Reinforced Leather",
			"armor_class": 3,
			"arn": 15,
			"max_ahp": 3000,
			"effects": [],
			"penalties": [],
			"weight": 13,
			"cost": 450
		},
		{
			"id": "chainmail",
			"name": "Chainmail",
			"armor_class": 4,
			"arn": 20,
			"max_ahp": 4000,
			"effects": [],
			"penalties": ["Stealth Disadvantage"],
			"weight": 20,
			"cost": 750
		},
		{
			"id": "half_plate",
			"name": "Half Plate",
			"armor_class": 5,
			"arn": 25,
			"max_ahp": 5000,
			"effects": [],
			"penalties": ["Stealth Disadvantage", "Agility -1"],
			"weight": 40,
			"cost": 7500
		},
		{
			"id": "full_plate",
			"name": "Full Plate",
			"armor_class": 6,
			"arn": 30,
			"max_ahp": 6000,
			"effects": [],
			"penalties": ["Stealth Disadvantage", "Agility -2"],
			"weight": 65,
			"cost": 15000
		},
		{
			"id": "mithril_plate",
			"name": "Mithril Plate",
			"armor_class": 7,
			"arn": 35,
			"max_ahp": 7000,
			"effects": ["Magic Resistance +1"],
			"penalties": ["Agility -1"],
			"weight": 45,
			"cost": 50000
		},
		{
			"id": "dwarven_plate",
			"name": "Dwarven Full Plate",
			"armor_class": 8,
			"arn": 40,
			"max_ahp": 8000,
			"effects": ["Fire Resistance", "Knockback Immunity"],
			"penalties": ["Agility -2"],
			"weight": 70,
			"cost": 100000
		},
		{
			"id": "juggernaut",
			"name": "Juggernaut Armor",
			"armor_class": 10,
			"arn": 50,
			"max_ahp": 10000,
			"effects": ["All Physical Resistance +2", "Intimidation +3"],
			"penalties": ["Agility -3", "Reflex -2"],
			"weight": 100,
			"cost": 250000
		},
		{
			"id": "fortress",
			"name": "Legendary Fortress Armor",
			"armor_class": 12,
			"arn": 60,
			"max_ahp": 12000,
			"effects": ["All Resistances +3", "Regeneration 10 HP/turn"],
			"penalties": ["Agility -3", "Reflex -3"],
			"weight": 120,
			"cost": 1000000
		}
	]
}
```

## classes.json (partial example)
```json
{
	"classes": [
		{
			"id": "fighter",
			"name": "Fighter",
			"description": "Master of martial combat and weapons.",
			"primary_stat": "strength",
			"abilities": [
				{
					"level": 1,
					"name": "Power Strike",
					"description": "Add +5 damage to next melee attack",
					"cost": 1
				},
				{
					"level": 3,
					"name": "Second Wind",
					"description": "Restore 20% of max HP",
					"cost": 1
				}
			],
			"skills": [
				{
					"level": 2,
					"name": "Weapon Mastery",
					"description": "+1 Proficiency with all weapons"
				},
				{
					"level": 4,
					"name": "Armor Expert",
					"description": "Armor penalties reduced by 50%"
				}
			],
			"class_focus": {
				"name": "Combat Superiority",
				"description": "Roll advantage on all attack rolls once per turn"
			}
		},
		{
			"id": "wizard",
			"name": "Wizard",
			"description": "Scholar of arcane magic and spellcasting.",
			"primary_stat": "intelligence",
			"abilities": [
				{
					"level": 1,
					"name": "Arcane Bolt",
					"description": "Fire a magical projectile for (IM + P)d6 + IS force damage",
					"cost": 1
				},
				{
					"level": 3,
					"name": "Counterspell",
					"description": "Negate an enemy spell (MP cost = enemy spell level × 10)",
					"cost": 1
				}
			],
			"skills": [
				{
					"level": 2,
					"name": "Spell Focus",
					"description": "+1 Proficiency with all spell types"
				},
				{
					"level": 4,
					"name": "Arcane Recovery",
					"description": "Restore 50 MP on short rest"
				}
			],
			"class_focus": {
				"name": "Spell Mastery",
				"description": "Reduce mana cost of all spells by 20%"
			}
		}
	]
}
```

## monsters.json (example)
```json
{
	"monsters": [
		{
			"id": "goblin",
			"name": "Goblin",
			"type": "Humanoid",
			"challenge_rating": 1,
			"stats": {
				"strength": 8,
				"resistance": 10,
				"intelligence": 10,
				"health_points": 7,
				"mana_points": 0,
				"agility": 14,
				"stealth": 6,
				"perception": 8
			},
			"hp": {
				"ward": 50,
				"core": 20
			},
			"attacks": [
				{
					"name": "Scimitar",
					"damage_formula": "1d6 + 1",
					"damage_type": "slashing"
				},
				{
					"name": "Shortbow",
					"damage_formula": "1d6",
					"damage_type": "piercing",
					"range": "80/320"
				}
			],
			"abilities": ["Nimble Escape"],
			"armor": {
				"type": "leather",
				"arn": 10,
				"ahp": 2000
			}
		},
		{
			"id": "dragon_wyrmling",
			"name": "Red Dragon Wyrmling",
			"type": "Dragon",
			"challenge_rating": 4,
			"stats": {
				"strength": 19,
				"resistance": 17,
				"intelligence": 12,
				"health_points": 75,
				"mana_points": 0,
				"intimidation": 13,
				"perception": 14
			},
			"hp": {
				"ward": 500,
				"core": 250
			},
			"attacks": [
				{
					"name": "Bite",
					"damage_formula": "1d10 + 4",
					"damage_type": "piercing"
				},
				{
					"name": "Fire Breath",
					"damage_formula": "7d6",
					"damage_type": "fire",
					"recharge": "5-6",
					"area": "15 ft cone"
				}
			],
			"resistances": ["Fire Immunity"],
			"armor": {
				"type": "natural",
				"arn": 35,
				"ahp": 7000
			}
		}
	]
}
```

## spells.json (example pre-made spells)
```json
{
	"spells": [
		{
			"id": "fireball",
			"name": "Fireball",
			"level": 3,
			"school": "Evocation",
			"casting_time": "1 Action",
			"range": "Long (120ft)",
			"area": "Sphere (20ft radius)",
			"duration": "Instant",
			"damage_type": "fire",
			"damage_formula": "(IM + P)d6 × 3 + IS",
			"mana_cost": 35,
			"description": "A bright streak flashes from your pointing finger to a point you choose, then blossoms into a sphere of fire.",
			"proficiency_type": "evocation"
		},
		{
			"id": "healing_touch",
			"name": "Healing Touch",
			"level": 1,
			"school": "Restoration",
			"casting_time": "1 Action",
			"range": "Touch",
			"area": "Single Target",
			"duration": "Instant",
			"heal_formula": "(IM + P)d8 + IS",
			"mana_cost": 10,
			"description": "Channel positive energy to restore health to a creature you touch.",
			"proficiency_type": "restoration"
		},
		{
			"id": "shield",
			"name": "Shield",
			"level": 1,
			"school": "Abjuration",
			"casting_time": "1 Bonus Action",
			"range": "Self",
			"area": "Single Target",
			"duration": "1 Min/Level",
			"effect": "Gain +15 temporary ARN",
			"mana_cost": 12,
			"description": "An invisible barrier of magical force protects you.",
			"proficiency_type": "abjuration"
		},
		{
			"id": "lightning_bolt",
			"name": "Lightning Bolt",
			"level": 3,
			"school": "Evocation",
			"casting_time": "1 Action",
			"range": "Self",
			"area": "Line (100ft)",
			"duration": "Instant",
			"damage_type": "lightning",
			"damage_formula": "(IM + P)d8 × 3 + IS",
			"mana_cost": 32,
			"description": "A stroke of lightning forms a line 100 feet long and 5 feet wide.",
			"proficiency_type": "evocation"
		},
		{
			"id": "invisibility",
			"name": "Invisibility",
			"level": 2,
			"school": "Illusion",
			"casting_time": "1 Action",
			"range": "Touch",
			"area": "Single Target",
			"duration": "10 Min/Level",
			"effect": "Target becomes invisible. Stealth +10",
			"mana_cost": 27,
			"description": "A creature you touch becomes invisible until the spell ends.",
			"proficiency_type": "illusion"
		}
	]
}
```

---

## Quick Reference: File Paths

When creating your Godot project, place these JSON files in:

```
RENDITION/
└── data/
    └── databases/
        ├── races.json
        ├── origins.json
        ├── backgrounds.json
        ├── classes.json
        ├── weapons.json
        ├── armor.json
        ├── spells.json
        └── monsters.json
```

Make sure the paths in `DataManager.gd` match:
- `res://data/databases/races.json`
- `res://data/databases/origins.json`
- etc.

---

## Adding More Content

To add more races, weapons, etc., simply:
1. Open the appropriate JSON file
2. Copy an existing entry
3. Change the `id` (must be unique!)
4. Modify the values
5. Save

The DataManager will automatically load it on next run!
