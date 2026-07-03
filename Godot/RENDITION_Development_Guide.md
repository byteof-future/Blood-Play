# RENDITION TTRPG - Godot Development Guide
## Complete Beginner-Friendly Roadmap

---

## **Project Overview**
- **Target Platform:** Desktop (Windows/Mac/Linux) + Mobile (Android/iOS)
- **Art Style:** Pixel Art Fantasy
- **Language:** GDScript
- **Architecture:** Single-device, GM-controlled, screen-sharing for players
- **Save System:** Local storage only

---

## **Required Godot Plugins & Assets**

### **Essential Plugins (Install via AssetLib)**
1. **Godot SQLite** - Database management
   - URL: Search "SQLite" in AssetLib
   - Purpose: Store all game data (characters, monsters, items, spells)

2. **File Access Encrypted** (built-in)
   - Purpose: Save/load character sheets and campaigns

3. **UUID (optional but recommended)**
   - URL: Search "UUID" in AssetLib  
   - Purpose: Generate unique IDs for characters/items

### **Recommended Asset Packs**
1. **Pixel Art UI Kit** (search itch.io for free fantasy UI)
2. **Pixel Font** (example: "m5x7" or "Kenney Pixel")

### **Built-in Godot Tools You'll Use**
- **Control Nodes** (UI elements)
- **Resource System** (for data templates)
- **Signals** (event system)
- **FileAccess** (save/load system)

---

## **Project Structure**

```
RENDITION/
├── project.godot
├── assets/
│   ├── fonts/
│   ├── ui/
│   │   ├── buttons/
│   │   ├── panels/
│   │   └── icons/
│   └── sounds/ (optional)
├── data/
│   ├── databases/
│   │   ├── races.json
│   │   ├── origins.json
│   │   ├── backgrounds.json
│   │   ├── classes.json
│   │   ├── weapons.json
│   │   ├── armor.json
│   │   ├── spells.json
│   │   └── monsters.json
│   └── templates/
├── scripts/
│   ├── core/
│   │   ├── Character.gd
│   │   ├── Stats.gd
│   │   ├── Combat.gd
│   │   ├── Equipment.gd
│   │   └── Spell.gd
│   ├── managers/
│   │   ├── DataManager.gd (loads/saves all data)
│   │   ├── CombatManager.gd
│   │   └── CampaignManager.gd
│   └── utils/
│       ├── DiceRoller.gd
│       └── Calculator.gd
├── scenes/
│   ├── Main.tscn (main menu)
│   ├── ui/
│   │   ├── CharacterCreation.tscn
│   │   ├── CharacterSheet.tscn
│   │   ├── CombatTracker.tscn
│   │   ├── SpellBuilder.tscn
│   │   ├── DatabaseBrowser.tscn
│   │   └── CampaignManager.tscn
│   └── components/
│       ├── StatDisplay.tscn
│       ├── HealthBar.tscn
│       └── InitiativeEntry.tscn
└── saves/
    ├── characters/
    └── campaigns/
```

---

## **Phase-by-Phase Development Plan**

---

## **PHASE 1: Project Setup & Core Data Structures (Week 1)**

### **1.1 Create New Godot Project**
1. Open Godot → New Project
2. Name: "RENDITION_TTRPG"
3. Renderer: Choose "Forward+" (better for desktop/mobile)
4. Create the folder structure above

### **1.2 Install SQLite Plugin**
1. AssetLib tab → Search "SQLite"
2. Download & Install → Enable in Project Settings

### **1.3 Create Core Data Classes**

**File: `scripts/core/Stats.gd`**
```gdscript
extends Resource
class_name CharacterStats

# Core Stats
var strength: int = 0
var resistance: int = 0
var intelligence: int = 0
var health_points: int = 0
var mana_points: int = 0

# Sub-Stats
var agility: int = 0
var aim: int = 0
var coordination: int = 0
var deception: int = 0
var dexterity: int = 0
var ingenuity: int = 0
var insight: int = 0
var intimidation: int = 0
var perception: int = 0
var reflex: int = 0
var seduction: int = 0
var stealth: int = 0
var will: int = 0

# Calculated Properties
func get_str_modifier() -> int:
	return floor(strength / 4.0)

func get_res_modifier() -> int:
	return floor(resistance / 4.0)

func get_int_modifier() -> int:
	return floor(intelligence / 4.0)

func get_resistance_number() -> int:
	return resistance * 5

func calculate_max_hp(race_whp_ratio: float, race_chp_ratio: float) -> Dictionary:
	var base_hp = 100 + (health_points * 10)
	return {
		"ward": base_hp * race_whp_ratio,
		"core": base_hp * race_chp_ratio
	}

func calculate_max_mp() -> int:
	return 100 + (mana_points * 20)

# Serialize for saving
func to_dict() -> Dictionary:
	return {
		"strength": strength,
		"resistance": resistance,
		"intelligence": intelligence,
		"health_points": health_points,
		"mana_points": mana_points,
		"agility": agility,
		"aim": aim,
		"coordination": coordination,
		"deception": deception,
		"dexterity": dexterity,
		"ingenuity": ingenuity,
		"insight": insight,
		"intimidation": intimidation,
		"perception": perception,
		"reflex": reflex,
		"seduction": seduction,
		"stealth": stealth,
		"will": will
	}

func from_dict(data: Dictionary):
	strength = data.get("strength", 0)
	resistance = data.get("resistance", 0)
	intelligence = data.get("intelligence", 0)
	health_points = data.get("health_points", 0)
	mana_points = data.get("mana_points", 0)
	agility = data.get("agility", 0)
	aim = data.get("aim", 0)
	coordination = data.get("coordination", 0)
	deception = data.get("deception", 0)
	dexterity = data.get("dexterity", 0)
	ingenuity = data.get("ingenuity", 0)
	insight = data.get("insight", 0)
	intimidation = data.get("intimidation", 0)
	perception = data.get("perception", 0)
	reflex = data.get("reflex", 0)
	seduction = data.get("seduction", 0)
	stealth = data.get("stealth", 0)
	will = data.get("will", 0)
```

**File: `scripts/core/Character.gd`**
```gdscript
extends Resource
class_name Character

# Identity
var character_name: String = ""
var race: String = ""
var origin: String = ""
var background: String = ""
var portrait_path: String = ""

# Progression
var level: int = 1
var experience: int = 0
var class_primary: String = ""
var class_secondary: String = "" # Empty if single class
var has_class_focus: bool = true
var class_level: int = 1  # level / 5

# Stats
var stats: CharacterStats = CharacterStats.new()

# Current State
var current_ward_hp: float = 0
var current_core_hp: float = 0
var current_mp: float = 0

# Equipment
var equipped_weapon: Dictionary = {}
var equipped_armor: Dictionary = {}
var inventory: Array = []

# Progression
var known_spells: Array = []  # Array of spell IDs
var weapon_proficiencies: Dictionary = {}  # {"sword": 3, "bow": 1}
var spell_proficiencies: Dictionary = {}   # {"fire": 2, "ice": 1}
var chosen_abilities: Array = []  # Array of ability IDs
var chosen_skills: Array = []     # Array of skill IDs
var ability_points_current: int = 0
var ability_points_max: int = 1

# Traits
var racial_traits: Array = []
var chosen_trait: String = ""

# Combat State
var initiative_roll: int = 0
var is_in_combat: bool = false
var status_effects: Array = []

func initialize_new_character():
	level = 1
	class_level = 1
	ability_points_max = 1
	ability_points_current = 1

func level_up():
	level += 1
	# Every 5 levels = 1 class level
	class_level = floor(level / 5.0)
	ability_points_max = class_level
	ability_points_current = ability_points_max

func allocate_stat_point(stat_name: String):
	# Called when player spends 1 AP after level 1
	match stat_name:
		"strength": stats.strength += 1
		"resistance": stats.resistance += 1
		"intelligence": stats.intelligence += 1
		"health_points": stats.health_points += 1
		"mana_points": stats.mana_points += 1
		# ... add all sub-stats

func apply_race_stats(race_data: Dictionary):
	# Load from races.json
	stats.from_dict(race_data.get("stat_bonuses", {}))

func apply_origin_stats(origin_data: Dictionary):
	var bonuses = origin_data.get("stat_bonuses", {})
	for stat in bonuses:
		stats.set(stat, stats.get(stat) + bonuses[stat])

func apply_background_stats(background_data: Dictionary):
	var bonuses = background_data.get("stat_bonuses", {})
	for stat in bonuses:
		stats.set(stat, stats.get(stat) + bonuses[stat])

func update_max_hp_mp(race_whp_ratio: float, race_chp_ratio: float):
	var hp_data = stats.calculate_max_hp(race_whp_ratio, race_chp_ratio)
	current_ward_hp = hp_data.ward
	current_core_hp = hp_data.core
	current_mp = stats.calculate_max_mp()

func multiclass(new_class: String):
	if class_secondary == "":
		class_secondary = new_class
		has_class_focus = false

func to_dict() -> Dictionary:
	return {
		"character_name": character_name,
		"race": race,
		"origin": origin,
		"background": background,
		"portrait_path": portrait_path,
		"level": level,
		"experience": experience,
		"class_primary": class_primary,
		"class_secondary": class_secondary,
		"has_class_focus": has_class_focus,
		"class_level": class_level,
		"stats": stats.to_dict(),
		"current_ward_hp": current_ward_hp,
		"current_core_hp": current_core_hp,
		"current_mp": current_mp,
		"equipped_weapon": equipped_weapon,
		"equipped_armor": equipped_armor,
		"inventory": inventory,
		"known_spells": known_spells,
		"weapon_proficiencies": weapon_proficiencies,
		"spell_proficiencies": spell_proficiencies,
		"chosen_abilities": chosen_abilities,
		"chosen_skills": chosen_skills,
		"ability_points_current": ability_points_current,
		"ability_points_max": ability_points_max,
		"racial_traits": racial_traits,
		"chosen_trait": chosen_trait
	}

func from_dict(data: Dictionary):
	character_name = data.get("character_name", "")
	race = data.get("race", "")
	origin = data.get("origin", "")
	background = data.get("background", "")
	portrait_path = data.get("portrait_path", "")
	level = data.get("level", 1)
	experience = data.get("experience", 0)
	class_primary = data.get("class_primary", "")
	class_secondary = data.get("class_secondary", "")
	has_class_focus = data.get("has_class_focus", true)
	class_level = data.get("class_level", 1)
	stats.from_dict(data.get("stats", {}))
	current_ward_hp = data.get("current_ward_hp", 0)
	current_core_hp = data.get("current_core_hp", 0)
	current_mp = data.get("current_mp", 0)
	equipped_weapon = data.get("equipped_weapon", {})
	equipped_armor = data.get("equipped_armor", {})
	inventory = data.get("inventory", [])
	known_spells = data.get("known_spells", [])
	weapon_proficiencies = data.get("weapon_proficiencies", {})
	spell_proficiencies = data.get("spell_proficiencies", {})
	chosen_abilities = data.get("chosen_abilities", [])
	chosen_skills = data.get("chosen_skills", [])
	ability_points_current = data.get("ability_points_current", 1)
	ability_points_max = data.get("ability_points_max", 1)
	racial_traits = data.get("racial_traits", [])
	chosen_trait = data.get("chosen_trait", "")
```

### **1.4 Create JSON Data Templates**

**File: `data/databases/races.json`**
```json
{
	"races": [
		{
			"id": "hobgoblin",
			"name": "Hobgoblin",
			"description": "A militaristic and disciplined race.",
			"stat_bonuses": {
				"strength": 3,
				"resistance": 2,
				"intelligence": 1,
				"health_points": 5,
				"mana_points": 2,
				"intimidation": 2
			},
			"hp_ratio": {
				"ward": 0.7,
				"core": 0.3
			},
			"innate_traits": ["Military Discipline", "Iron Will"],
			"portrait": "res://assets/portraits/hobgoblin.png"
		},
		{
			"id": "elf",
			"name": "Elf",
			"description": "Graceful and magically attuned.",
			"stat_bonuses": {
				"strength": 1,
				"resistance": 1,
				"intelligence": 4,
				"health_points": 2,
				"mana_points": 5,
				"perception": 2
			},
			"hp_ratio": {
				"ward": 0.4,
				"core": 0.6
			},
			"innate_traits": ["Keen Senses", "Arcane Affinity"],
			"portrait": "res://assets/portraits/elf.png"
		}
	]
}
```

**File: `data/databases/armor.json`**
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
			"penalties": []
		},
		{
			"id": "leather",
			"name": "Leather Armor",
			"armor_class": 2,
			"arn": 10,
			"max_ahp": 2000,
			"effects": [],
			"penalties": []
		},
		{
			"id": "full_plate",
			"name": "Full Plate",
			"armor_class": 6,
			"arn": 30,
			"max_ahp": 6000,
			"effects": [],
			"penalties": ["Movement -10%"]
		}
	]
}
```

**File: `data/databases/weapons.json`**
```json
{
	"weapons": [
		{
			"id": "dagger",
			"name": "Dagger",
			"damage_type": "piercing",
			"damage_dice": 4,
			"damage_formula": "(SM + P)d4 + SS",
			"properties": ["Light", "Thrown (20/40 ft)"],
			"proficiency_type": "blade"
		},
		{
			"id": "longsword",
			"name": "Longsword",
			"damage_type": "slashing",
			"damage_dice": 8,
			"damage_formula": "(SM + P)d8 + SS",
			"properties": ["Versatile"],
			"proficiency_type": "blade"
		},
		{
			"id": "longbow",
			"name": "Longbow",
			"damage_type": "piercing",
			"damage_dice": 8,
			"damage_formula": "(SM + P + AIM)d8",
			"properties": ["Two-Handed", "Range (150/600)"],
			"proficiency_type": "bow"
		}
	]
}
```

---

## **PHASE 2: Data Manager & Save System (Week 2)**

### **2.1 Create Data Manager**

**File: `scripts/managers/DataManager.gd`**
```gdscript
extends Node

var races: Dictionary = {}
var origins: Dictionary = {}
var backgrounds: Dictionary = {}
var classes: Dictionary = {}
var weapons: Dictionary = {}
var armor: Dictionary = {}
var spells: Dictionary = {}
var monsters: Dictionary = {}

func _ready():
	load_all_databases()

func load_all_databases():
	races = load_json_database("res://data/databases/races.json", "races")
	origins = load_json_database("res://data/databases/origins.json", "origins")
	backgrounds = load_json_database("res://data/databases/backgrounds.json", "backgrounds")
	classes = load_json_database("res://data/databases/classes.json", "classes")
	weapons = load_json_database("res://data/databases/weapons.json", "weapons")
	armor = load_json_database("res://data/databases/armor.json", "armor")
	spells = load_json_database("res://data/databases/spells.json", "spells")
	monsters = load_json_database("res://data/databases/monsters.json", "monsters")

func load_json_database(path: String, key: String) -> Dictionary:
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if parse_result == OK:
			var data = json.data
			# Convert array to dictionary with IDs as keys
			var result = {}
			for item in data[key]:
				result[item["id"]] = item
			return result
	return {}

func get_race(race_id: String) -> Dictionary:
	return races.get(race_id, {})

func get_origin(origin_id: String) -> Dictionary:
	return origins.get(origin_id, {})

func get_background(bg_id: String) -> Dictionary:
	return backgrounds.get(bg_id, {})

func get_weapon(weapon_id: String) -> Dictionary:
	return weapons.get(weapon_id, {})

func get_armor(armor_id: String) -> Dictionary:
	return armor.get(armor_id, {})

# Save/Load Characters
func save_character(character: Character):
	var save_path = "user://saves/characters/" + character.character_name + ".save"
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		var save_data = character.to_dict()
		file.store_string(JSON.stringify(save_data, "\t"))
		file.close()
		print("Character saved: ", save_path)

func load_character(character_name: String) -> Character:
	var load_path = "user://saves/characters/" + character_name + ".save"
	var file = FileAccess.open(load_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if parse_result == OK:
			var character = Character.new()
			character.from_dict(json.data)
			return character
	return null

func list_saved_characters() -> Array:
	var characters = []
	var dir = DirAccess.open("user://saves/characters/")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".save"):
				characters.append(file_name.replace(".save", ""))
			file_name = dir.get_next()
	return characters

# Save/Load Campaigns
func save_campaign(campaign_name: String, party: Array):
	var save_path = "user://saves/campaigns/" + campaign_name + ".campaign"
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		var campaign_data = {
			"name": campaign_name,
			"party": []
		}
		for character in party:
			campaign_data.party.append(character.to_dict())
		file.store_string(JSON.stringify(campaign_data, "\t"))
		file.close()

func load_campaign(campaign_name: String) -> Array:
	var load_path = "user://saves/campaigns/" + campaign_name + ".campaign"
	var file = FileAccess.open(load_path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if parse_result == OK:
			var party = []
			for char_data in json.data.party:
				var character = Character.new()
				character.from_dict(char_data)
				party.append(character)
			return party
	return []
```

### **2.2 Create Autoload Singletons**
1. Go to **Project → Project Settings → Autoload**
2. Add `scripts/managers/DataManager.gd` as **DataManager**
3. This makes it globally accessible as `DataManager`

---

## **PHASE 3: Character Creation UI (Week 3-4)**

### **3.1 Create Main Menu Scene**

**File: `scenes/Main.tscn`**
- Root: `Control` node
- Children:
  - `VBoxContainer` (center alignment)
    - `Label` (Title: "RENDITION TTRPG")
    - `Button` (Text: "New Character")
    - `Button` (Text: "Load Character")
    - `Button` (Text: "Database Browser")
    - `Button` (Text: "Combat Tracker")
    - `Button` (Text: "Exit")

**Attach Script: `scenes/Main.gd`**
```gdscript
extends Control

func _on_new_character_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/CharacterCreation.tscn")

func _on_load_character_pressed():
	# Show character selection dialog
	pass

func _on_database_browser_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/DatabaseBrowser.tscn")

func _on_combat_tracker_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/CombatTracker.tscn")

func _on_exit_pressed():
	get_tree().quit()
```

### **3.2 Create Character Creation Scene**

**File: `scenes/ui/CharacterCreation.tscn`**

**Scene Tree:**
```
Control (Root)
├── MarginContainer
│   └── VBoxContainer
│       ├── Label (Title: "Create New Character")
│       ├── HBoxContainer (Name Input)
│       │   ├── Label ("Name:")
│       │   └── LineEdit (variable: name_input)
│       ├── Label ("Step 1: Choose Race")
│       ├── OptionButton (variable: race_option)
│       ├── Label ("Step 2: Choose Origin")
│       ├── OptionButton (variable: origin_option)
│       ├── Label ("Step 3: Choose Background")
│       ├── OptionButton (variable: background_option)
│       ├── Label ("Step 4: Choose Class")
│       ├── HBoxContainer
│       │   ├── OptionButton (variable: class_primary_option)
│       │   └── CheckBox ("Add Second Class", variable: multiclass_check)
│       ├── OptionButton (variable: class_secondary_option, hidden initially)
│       ├── Label ("Starting Stats Preview")
│       ├── RichTextLabel (variable: stats_preview)
│       └── HBoxContainer
│           ├── Button ("Back")
│           └── Button ("Create Character")
```

**Attach Script: `scenes/ui/CharacterCreation.gd`**
```gdscript
extends Control

@onready var name_input = $MarginContainer/VBoxContainer/NameInput/LineEdit
@onready var race_option = $MarginContainer/VBoxContainer/RaceOption
@onready var origin_option = $MarginContainer/VBoxContainer/OriginOption
@onready var background_option = $MarginContainer/VBoxContainer/BackgroundOption
@onready var class_primary_option = $MarginContainer/VBoxContainer/ClassContainer/PrimaryClass
@onready var multiclass_check = $MarginContainer/VBoxContainer/ClassContainer/MulticlassCheck
@onready var class_secondary_option = $MarginContainer/VBoxContainer/SecondaryClass
@onready var stats_preview = $MarginContainer/VBoxContainer/StatsPreview

var current_character: Character = Character.new()

func _ready():
	populate_dropdowns()
	class_secondary_option.visible = false
	
	# Connect signals
	race_option.item_selected.connect(_on_selection_changed)
	origin_option.item_selected.connect(_on_selection_changed)
	background_option.item_selected.connect(_on_selection_changed)
	multiclass_check.toggled.connect(_on_multiclass_toggled)

func populate_dropdowns():
	# Populate races
	for race_id in DataManager.races:
		var race = DataManager.races[race_id]
		race_option.add_item(race.name)
		race_option.set_item_metadata(race_option.get_item_count() - 1, race_id)
	
	# Populate origins
	for origin_id in DataManager.origins:
		var origin = DataManager.origins[origin_id]
		origin_option.add_item(origin.name)
		origin_option.set_item_metadata(origin_option.get_item_count() - 1, origin_id)
	
	# Similar for backgrounds and classes...

func _on_selection_changed(_index):
	preview_stats()

func preview_stats():
	var temp_stats = CharacterStats.new()
	
	# Apply selected race bonuses
	if race_option.selected >= 0:
		var race_id = race_option.get_item_metadata(race_option.selected)
		var race_data = DataManager.get_race(race_id)
		temp_stats.from_dict(race_data.stat_bonuses)
	
	# Apply origin bonuses
	if origin_option.selected >= 0:
		var origin_id = origin_option.get_item_metadata(origin_option.selected)
		var origin_data = DataManager.get_origin(origin_id)
		for stat in origin_data.stat_bonuses:
			temp_stats.set(stat, temp_stats.get(stat) + origin_data.stat_bonuses[stat])
	
	# Apply background bonuses
	if background_option.selected >= 0:
		var bg_id = background_option.get_item_metadata(background_option.selected)
		var bg_data = DataManager.get_background(bg_id)
		for stat in bg_data.stat_bonuses:
			temp_stats.set(stat, temp_stats.get(stat) + bg_data.stat_bonuses[stat])
	
	# Display in preview
	stats_preview.clear()
	stats_preview.append_text("[b]Core Stats:[/b]\n")
	stats_preview.append_text("STR: %d (Mod: +%d)\n" % [temp_stats.strength, temp_stats.get_str_modifier()])
	stats_preview.append_text("RES: %d (Mod: +%d)\n" % [temp_stats.resistance, temp_stats.get_res_modifier()])
	stats_preview.append_text("INT: %d (Mod: +%d)\n" % [temp_stats.intelligence, temp_stats.get_int_modifier()])
	stats_preview.append_text("HP: %d\n" % temp_stats.health_points)
	stats_preview.append_text("MP: %d\n" % temp_stats.mana_points)
	# Add sub-stats...

func _on_multiclass_toggled(enabled: bool):
	class_secondary_option.visible = enabled
	current_character.has_class_focus = !enabled

func _on_create_character_pressed():
	current_character.character_name = name_input.text
	
	# Apply selections
	var race_id = race_option.get_item_metadata(race_option.selected)
	current_character.race = race_id
	current_character.apply_race_stats(DataManager.get_race(race_id))
	
	var origin_id = origin_option.get_item_metadata(origin_option.selected)
	current_character.origin = origin_id
	current_character.apply_origin_stats(DataManager.get_origin(origin_id))
	
	var bg_id = background_option.get_item_metadata(background_option.selected)
	current_character.background = bg_id
	current_character.apply_background_stats(DataManager.get_background(bg_id))
	
	# Set class
	var class_id = class_primary_option.get_item_metadata(class_primary_option.selected)
	current_character.class_primary = class_id
	
	if multiclass_check.button_pressed:
		var class2_id = class_secondary_option.get_item_metadata(class_secondary_option.selected)
		current_character.class_secondary = class2_id
	
	# Initialize HP/MP
	var race_data = DataManager.get_race(race_id)
	current_character.update_max_hp_mp(race_data.hp_ratio.ward, race_data.hp_ratio.core)
	
	# Save character
	DataManager.save_character(current_character)
	
	# Go to character sheet
	get_tree().change_scene_to_file("res://scenes/ui/CharacterSheet.tscn")
```

---

## **PHASE 4: Combat System (Week 5-7)**

### **4.1 Create Combat Manager**

**File: `scripts/managers/CombatManager.gd`**
```gdscript
extends Node

signal combat_started
signal turn_changed(combatant)
signal combat_ended

var combatants: Array = []  # Array of Character or Monster
var turn_order: Array = []
var current_turn_index: int = 0
var is_combat_active: bool = false

func start_combat(participants: Array):
	combatants = participants
	is_combat_active = true
	roll_initiative()
	combat_started.emit()
	start_turn()

func roll_initiative():
	# Roll for each combatant
	for combatant in combatants:
		var roll = randi() % 20 + 1
		var agility_bonus = combatant.stats.agility if combatant is Character else combatant.agility
		combatant.initiative_roll = roll + agility_bonus
	
	# Sort by initiative (highest first)
	turn_order = combatants.duplicate()
	turn_order.sort_custom(func(a, b): return a.initiative_roll > b.initiative_roll)

func manual_set_initiative(combatant_index: int, new_initiative: int):
	combatants[combatant_index].initiative_roll = new_initiative
	turn_order.sort_custom(func(a, b): return a.initiative_roll > b.initiative_roll)

func start_turn():
	if current_turn_index < turn_order.size():
		var current_combatant = turn_order[current_turn_index]
		turn_changed.emit(current_combatant)

func end_turn():
	current_turn_index += 1
	if current_turn_index >= turn_order.size():
		current_turn_index = 0
		# New round
	start_turn()

func end_combat():
	is_combat_active = false
	combatants.clear()
	turn_order.clear()
	current_turn_index = 0
	combat_ended.emit()

# Damage Calculation
func calculate_damage(attacker: Character, target, weapon: Dictionary, gm_multiplier: float = 1.0) -> Dictionary:
	var stats = attacker.stats
	var SM = stats.get_str_modifier()
	var SS = stats.strength
	var P = attacker.weapon_proficiencies.get(weapon.proficiency_type, 0)
	
	# Roll damage: (SM + P)dX + SS
	var num_dice = SM + P
	var dice_result = 0
	for i in range(num_dice):
		dice_result += (randi() % weapon.damage_dice) + 1
	
	var DMGA = dice_result + SS
	DMGA *= gm_multiplier  # GM can adjust
	
	# Check armor
	var equipped_armor = target.equipped_armor if target is Character else {}
	var ARN = 0
	var AHP = 0
	
	if equipped_armor.has("arn"):
		ARN = equipped_armor.arn
		AHP = equipped_armor.current_ahp
	
	var DMGT = 0
	
	if ARN >= DMGA:
		equipped_armor.current_ahp -= DMGA
		DMGT = 0
	else:
		equipped_armor.current_ahp -= DMGA
		DMGT = DMGA - ARN
	
	# Apply to target health
	var RN = target.stats.get_resistance_number() if target is Character else target.resistance * 5
	var damage_to_ward = DMGT
	var damage_to_core = 0
	
	if DMGT > RN:
		damage_to_core = DMGT - RN
	
	if target is Character:
		target.current_ward_hp -= damage_to_ward
		target.current_core_hp -= damage_to_core
		
		# Prevent negative
		if target.current_ward_hp < 0:
			target.current_ward_hp = 0
		if target.current_core_hp < 0:
			target.current_core_hp = 0
	
	return {
		"initial_damage": DMGA,
		"armor_absorbed": ARN if ARN < DMGA else DMGA,
		"damage_through": DMGT,
		"ward_damage": damage_to_ward,
		"core_damage": damage_to_core
	}
```

### **4.2 Create Combat Tracker UI**

**File: `scenes/ui/CombatTracker.tscn`**

**Scene Tree:**
```
Control
├── HBoxContainer
│   ├── VBoxContainer (Left Panel - Turn Order)
│   │   ├── Label ("Initiative Order")
│   │   ├── ScrollContainer
│   │   │   └── VBoxContainer (variable: initiative_list)
│   │   └── HBoxContainer
│   │       ├── Button ("Roll Initiative")
│   │       └── Button ("Manual Initiative")
│   └── VBoxContainer (Right Panel - Current Turn)
│       ├── Label ("Current Turn")
│       ├── Panel (Combatant Info)
│       │   ├── Label (Name)
│       │   ├── ProgressBar (Ward HP)
│       │   ├── ProgressBar (Core HP)
│       │   └── Label (Stats)
│       ├── Label ("Actions")
│       ├── HBoxContainer
│       │   ├── Button ("Attack")
│       │   ├── Button ("Cast Spell")
│       │   └── Button ("Use Ability")
│       └── Button ("End Turn")
```

**Attach Script: `scenes/ui/CombatTracker.gd`**
```gdscript
extends Control

@onready var initiative_list = $HBoxContainer/LeftPanel/ScrollContainer/InitiativeList
@onready var current_combatant_info = $HBoxContainer/RightPanel/CombatantInfo

var current_party: Array = []

func _ready():
	CombatManager.turn_changed.connect(_on_turn_changed)
	load_party()

func load_party():
	# Load current campaign party
	current_party = DataManager.load_campaign("current")  # Replace with actual campaign name

func _on_roll_initiative_pressed():
	CombatManager.start_combat(current_party)
	update_initiative_display()

func update_initiative_display():
	# Clear existing
	for child in initiative_list.get_children():
		child.queue_free()
	
	# Populate with turn order
	for combatant in CombatManager.turn_order:
		var entry = preload("res://scenes/components/InitiativeEntry.tscn").instantiate()
		entry.set_combatant(combatant)
		initiative_list.add_child(entry)

func _on_turn_changed(combatant):
	# Update right panel with current combatant
	current_combatant_info.get_node("Label").text = combatant.character_name
	# Update health bars, etc.

func _on_attack_pressed():
	# Open attack dialog
	var attack_dialog = preload("res://scenes/dialogs/AttackDialog.tscn").instantiate()
	add_child(attack_dialog)

func _on_end_turn_pressed():
	CombatManager.end_turn()
```

---

## **PHASE 5: Equipment & Inventory (Week 8)**

### **5.1 Create Inventory UI Component**

**File: `scenes/components/InventoryGrid.tscn`**

**Scene Tree:**
```
Panel
└── GridContainer (columns: 5, variable: item_grid)
```

**Attach Script:**
```gdscript
extends Panel

@onready var item_grid = $GridContainer

signal item_selected(item)

func display_inventory(inventory: Array):
	# Clear grid
	for child in item_grid.get_children():
		child.queue_free()
	
	# Add items
	for item in inventory:
		var item_button = Button.new()
		item_button.text = item.name
		item_button.pressed.connect(func(): item_selected.emit(item))
		item_grid.add_child(item_button)

func add_item(item: Dictionary):
	var item_button = Button.new()
	item_button.text = item.name
	item_button.pressed.connect(func(): item_selected.emit(item))
	item_grid.add_child(item_button)
```

---

## **PHASE 6: Spell Builder (Week 9)**

### **6.1 Create Spell Builder Scene**

**File: `scenes/ui/SpellBuilder.tscn`**

**Scene Tree:**
```
Control
├── VBoxContainer
│   ├── Label ("Spell Creation Tool")
│   ├── LineEdit (Spell Name)
│   ├── Label ("Spell Level")
│   ├── SpinBox (variable: spell_level, min: 1, max: 9)
│   ├── Label ("Range")
│   ├── OptionButton (variable: range_option)
│   ├── Label ("Area of Effect")
│   ├── OptionButton (variable: aoe_option)
│   ├── Label ("Duration")
│   ├── OptionButton (variable: duration_option)
│   ├── Label ("Additional Effect")
│   ├── OptionButton (variable: effect_option)
│   ├── Label ("Casting Time")
│   ├── OptionButton (variable: casting_time_option)
│   ├── Separator
│   ├── Label (variable: mana_cost_label, "Mana Cost: 0")
│   └── Button ("Create Spell")
```

**Attach Script:**
```gdscript
extends Control

@onready var spell_level = $VBoxContainer/SpellLevel
@onready var range_option = $VBoxContainer/RangeOption
@onready var aoe_option = $VBoxContainer/AoEOption
@onready var duration_option = $VBoxContainer/DurationOption
@onready var effect_option = $VBoxContainer/EffectOption
@onready var casting_time_option = $VBoxContainer/CastingTimeOption
@onready var mana_cost_label = $VBoxContainer/ManaCostLabel

var range_multipliers = {
	"Touch": 0.8,
	"Close (30ft)": 1.0,
	"Medium (60ft)": 1.2,
	"Long (120ft)": 1.5
}

var aoe_multipliers = {
	"Single Target": 1.0,
	"Cone/Line": 1.3,
	"Sphere": 1.5
}

var duration_multipliers = {
	"Instant": 1.0,
	"1 Min/Level": 1.2,
	"10 Min/Level": 1.5,
	"Permanent": 2.0
}

var effect_multipliers = {
	"None": 1.0,
	"Minor Debuff": 1.2,
	"Major Debuff": 1.5
}

var casting_multipliers = {
	"1 Action": 1.0,
	"1 Bonus Action": 1.3,
	"1 Minute": 0.7,
	"Ritual": 0.5
}

func _ready():
	populate_options()
	
	# Connect signals for live calculation
	spell_level.value_changed.connect(_on_parameter_changed)
	range_option.item_selected.connect(_on_parameter_changed)
	aoe_option.item_selected.connect(_on_parameter_changed)
	duration_option.item_selected.connect(_on_parameter_changed)
	effect_option.item_selected.connect(_on_parameter_changed)
	casting_time_option.item_selected.connect(_on_parameter_changed)

func populate_options():
	for key in range_multipliers.keys():
		range_option.add_item(key)
	
	for key in aoe_multipliers.keys():
		aoe_option.add_item(key)
	
	for key in duration_multipliers.keys():
		duration_option.add_item(key)
	
	for key in effect_multipliers.keys():
		effect_option.add_item(key)
	
	for key in casting_multipliers.keys():
		casting_time_option.add_item(key)

func _on_parameter_changed(_value = null):
	calculate_mana_cost()

func calculate_mana_cost():
	var SL = spell_level.value
	var BMC = 3 * SL
	
	var range_mult = range_multipliers[range_option.get_item_text(range_option.selected)]
	var aoe_mult = aoe_multipliers[aoe_option.get_item_text(aoe_option.selected)]
	var duration_mult = duration_multipliers[duration_option.get_item_text(duration_option.selected)]
	var effect_mult = effect_multipliers[effect_option.get_item_text(effect_option.selected)]
	var casting_mult = casting_multipliers[casting_time_option.get_item_text(casting_time_option.selected)]
	
	var final_cost = BMC * range_mult * aoe_mult * duration_mult * effect_mult * casting_mult
	mana_cost_label.text = "Mana Cost: %d" % int(final_cost)

func _on_create_spell_pressed():
	var spell_data = {
		"name": $VBoxContainer/SpellName.text,
		"level": spell_level.value,
		"range": range_option.get_item_text(range_option.selected),
		"aoe": aoe_option.get_item_text(aoe_option.selected),
		"duration": duration_option.get_item_text(duration_option.selected),
		"effect": effect_option.get_item_text(effect_option.selected),
		"casting_time": casting_time_option.get_item_text(casting_time_option.selected),
		"mana_cost": int(mana_cost_label.text.split(": ")[1])
	}
	
	# Save to custom spells database
	# Add to current character's known spells
	print("Spell created: ", spell_data)
```

---

## **PHASE 7: Database Browser (Week 10)**

### **7.1 Create Database Browser**

**File: `scenes/ui/DatabaseBrowser.tscn`**

**Scene Tree:**
```
Control
├── HBoxContainer
│   ├── VBoxContainer (Category List)
│   │   ├── Label ("Categories")
│   │   ├── Button ("Races")
│   │   ├── Button ("Classes")
│   │   ├── Button ("Weapons")
│   │   ├── Button ("Armor")
│   │   ├── Button ("Spells")
│   │   └── Button ("Monsters")
│   └── VBoxContainer (Content Display)
│       ├── LineEdit (Search bar)
│       ├── ScrollContainer
│       │   └── VBoxContainer (variable: content_list)
│       └── RichTextLabel (variable: detail_panel)
```

**Attach Script:**
```gdscript
extends Control

@onready var content_list = $HBoxContainer/ContentDisplay/ScrollContainer/ContentList
@onready var detail_panel = $HBoxContainer/ContentDisplay/DetailPanel

var current_category: String = ""

func _on_races_pressed():
	display_category("races", DataManager.races)

func _on_weapons_pressed():
	display_category("weapons", DataManager.weapons)

func display_category(category: String, data: Dictionary):
	current_category = category
	
	# Clear content
	for child in content_list.get_children():
		child.queue_free()
	
	# Populate list
	for key in data.keys():
		var item = data[key]
		var button = Button.new()
		button.text = item.name
		button.pressed.connect(func(): show_details(item))
		content_list.add_child(button)

func show_details(item: Dictionary):
	detail_panel.clear()
	detail_panel.append_text("[b]%s[/b]\n\n" % item.name)
	detail_panel.append_text("%s\n\n" % item.get("description", ""))
	
	# Display all properties
	for key in item.keys():
		if key != "name" and key != "description":
			detail_panel.append_text("[b]%s:[/b] %s\n" % [key, str(item[key])])
```

---

## **PHASE 8: Polish & Mobile Export (Week 11-12)**

### **8.1 Mobile Optimization**

1. **Touch Controls:**
   - Make all buttons larger (min 64x64 pixels)
   - Add ScrollContainers for all lists
   - Test on smaller screens

2. **UI Scaling:**
   - Go to Project Settings → Display → Window
   - Set Stretch Mode: "canvas_items"
   - Set Stretch Aspect: "expand"

3. **Export Settings:**
   - **Android:**
     - Install Android SDK via Godot Editor Settings
     - Create keystore for signing
     - Export → Android → Export APK
   - **Desktop:**
     - Export → Windows/Mac/Linux → Export Project

### **8.2 Save Directory Creation**

Add to `scripts/managers/DataManager.gd` `_ready()`:
```gdscript
func _ready():
	# Create save directories
	DirAccess.make_dir_recursive_absolute("user://saves/characters")
	DirAccess.make_dir_recursive_absolute("user://saves/campaigns")
	load_all_databases()
```

---

## **Additional Features to Implement**

### **Dice Roller Utility**

**File: `scripts/utils/DiceRoller.gd`**
```gdscript
extends Node

func roll(num_dice: int, dice_size: int, modifier: int = 0) -> Dictionary:
	var rolls = []
	var total = 0
	
	for i in range(num_dice):
		var roll = (randi() % dice_size) + 1
		rolls.append(roll)
		total += roll
	
	total += modifier
	
	return {
		"rolls": rolls,
		"modifier": modifier,
		"total": total
	}

func roll_d20() -> int:
	return (randi() % 20) + 1

func roll_d4() -> int:
	return (randi() % 4) + 1

# Add other dice types as needed
```

---

## **Testing Checklist**

- [ ] Character creation saves correctly
- [ ] Stats calculate properly (modifiers, HP/MP)
- [ ] Combat initiative rolls and sorts
- [ ] Damage calculation follows formula
- [ ] Armor reduces damage correctly
- [ ] Inventory adds/removes items
- [ ] Spell builder calculates mana cost
- [ ] Database browser displays all categories
- [ ] Campaign saves party state
- [ ] Mobile touch controls work
- [ ] Export builds run on target platforms

---

## **Next Steps After Completion**

1. **Playtesting:** Run actual game sessions with the tool
2. **Feedback:** Gather GM/player feedback
3. **Iteration:** Add quality-of-life features
4. **Advanced Features:**
   - Drag-and-drop inventory
   - Custom monster creator
   - Encounter builder
   - Loot generator
   - Status effect tracking
   - Combat log

---

## **Learning Resources**

- **GDScript Basics:** https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html
- **UI Tutorial:** https://docs.godotengine.org/en/stable/tutorials/ui/index.html
- **Saving Data:** https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html
- **Mobile Export:** https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html

---

## **Estimated Timeline**

| Phase | Duration | Deliverable |
|-------|----------|-------------|
| 1 | 1 week | Core data structures |
| 2 | 1 week | Data management & save system |
| 3-4 | 2 weeks | Character creation UI |
| 5-7 | 3 weeks | Combat system |
| 8 | 1 week | Equipment & inventory |
| 9 | 1 week | Spell builder |
| 10 | 1 week | Database browser |
| 11-12 | 2 weeks | Polish & mobile export |
| **Total** | **12 weeks** | **Complete TTRPG Tool** |

---

## **Final Notes**

- **Start small:** Get Phase 1 working before moving on
- **Test frequently:** Run the project after each major change
- **Use print() statements:** Debug with `print("Variable:", variable_name)`
- **Ask for help:** Godot has an active Discord and Reddit community
- **Save often:** Use Git for version control (optional but recommended)

Good luck with your RENDITION TTRPG tool! This is an ambitious project, but breaking it into these phases makes it very achievable. Feel free to ask if you need clarification on any section!
