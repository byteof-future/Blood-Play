# RENDITION - Troubleshooting Guide

## Common Godot Beginner Issues & Solutions

---

## **Installation & Setup Issues**

### ❌ "SQLite plugin not showing in AssetLib"
**Solution:**
1. Make sure you're connected to the internet
2. Try searching for "godot-sqlite" with a hyphen
3. Alternative: Download manually from GitHub:
   - Visit: https://github.com/2shady4u/godot-sqlite
   - Download the latest release
   - Extract to `res://addons/godot-sqlite/`
   - Enable in Project Settings → Plugins

### ❌ "Cannot find FileAccess class"
**Solution:**
- This is Godot 4 syntax. If you're using Godot 3.x:
  - Replace `FileAccess` with `File`
  - Replace `DirAccess` with `Directory`
- **Recommended:** Use Godot 4.2+ for this project

---

## **Scripting Errors**

### ❌ "Invalid get index 'stat_bonuses'"
**Solution:**
```gdscript
# Wrong:
var bonuses = race_data.stat_bonuses

# Right:
var bonuses = race_data.get("stat_bonuses", {})
```
Always use `.get()` with a default value when accessing dictionary keys!

### ❌ "Node not found" errors
**Solution:**
1. Check the `@onready` node paths match your scene tree
2. Use the "Copy Node Path" feature:
   - Right-click node in Scene Tree → "Copy Node Path"
   - Paste in your script

Example:
```gdscript
# If your scene tree is:
# Control → VBoxContainer → Label
@onready var my_label = $VBoxContainer/Label

# NOT:
@onready var my_label = $Label  # ❌ Wrong!
```

### ❌ "Parser Error: Identifier not declared"
**Solutions:**
- Make sure class names are defined: `class_name Character` at top of script
- Check for typos in variable names
- Ensure you've created the script file before referencing it

---

## **JSON Loading Issues**

### ❌ "JSON Parse Error" or empty dictionaries
**Debug steps:**
1. Check JSON syntax with a validator: https://jsonlint.com
2. Common JSON mistakes:
   - Missing commas between items
   - Trailing comma on last item (not allowed!)
   - Not using double quotes for strings
   - Comments (not allowed in JSON!)

**Valid JSON:**
```json
{
	"races": [
		{
			"id": "human",
			"name": "Human"
		}
	]
}
```

**Invalid JSON:**
```json
{
	"races": [
		{
			"id": "human",
			"name": "Human",  // ❌ Trailing comma!
		}  // ❌ Another trailing comma!
	]
}
```

### ❌ "Cannot open file" when loading JSON
**Solution:**
1. Check file path is correct: `res://data/databases/races.json`
2. Make sure folders exist
3. Try printing the path:
```gdscript
func load_json_database(path: String, key: String) -> Dictionary:
	print("Attempting to load: ", path)  # Add this
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		print("File opened successfully!")
	else:
		print("ERROR: Could not open file!")
		print("Error code: ", FileAccess.get_open_error())
	# ... rest of code
```

---

## **UI Issues**

### ❌ "UI elements not showing"
**Solutions:**
1. Check Control node anchors/margins
2. Make sure parent containers are visible
3. Use "Layout" menu → "Center" or "Full Rect" for testing
4. Check if node is hidden in Inspector (eye icon)

### ❌ "Buttons not responding to clicks"
**Solutions:**
1. Check if button has a signal connected:
   - Select button → Node tab (right side) → Signals tab
   - Connect `pressed()` signal
2. Ensure parent Control nodes have `mouse_filter` set properly
3. Test with simple print statement:
```gdscript
func _on_button_pressed():
	print("Button clicked!")  # Add this to verify
```

### ❌ "OptionButton dropdown empty"
**Solution:**
```gdscript
# Add items like this:
race_option.add_item("Human")
race_option.add_item("Elf")

# To store data with each item:
race_option.add_item("Human")
race_option.set_item_metadata(race_option.get_item_count() - 1, "human_id")
```

---

## **Save/Load Issues**

### ❌ "Save file not created"
**Debug steps:**
1. Check if directory exists:
```gdscript
func _ready():
	var dir = DirAccess.open("user://")
	print("User directory: ", OS.get_user_data_dir())
	
	# Create directories
	DirAccess.make_dir_recursive_absolute("user://saves/characters")
	print("Directory created!")
```

2. Find where Godot saves files:
   - Windows: `%APPDATA%\Godot\app_userdata\[project_name]`
   - Mac: `~/Library/Application Support/Godot/app_userdata/[project_name]`
   - Linux: `~/.local/share/godot/app_userdata/[project_name]`

### ❌ "Cannot load character - parse error"
**Solution:**
Add error checking:
```gdscript
func load_character(character_name: String) -> Character:
	var load_path = "user://saves/characters/" + character_name + ".save"
	var file = FileAccess.open(load_path, FileAccess.READ)
	
	if not file:
		print("ERROR: File not found at ", load_path)
		return null
	
	var json_string = file.get_as_text()
	file.close()
	
	print("Loaded JSON: ", json_string)  # Debug print
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	
	if parse_result != OK:
		print("ERROR: JSON parse failed at line ", json.get_error_line())
		print("Error message: ", json.get_error_message())
		return null
	
	# ... rest
```

---

## **Combat System Issues**

### ❌ "Damage calculation returning 0"
**Debug with prints:**
```gdscript
func calculate_damage(attacker: Character, target, weapon: Dictionary, gm_multiplier: float = 1.0) -> Dictionary:
	var stats = attacker.stats
	var SM = stats.get_str_modifier()
	var SS = stats.strength
	var P = attacker.weapon_proficiencies.get(weapon.proficiency_type, 0)
	
	print("=== DAMAGE CALCULATION ===")
	print("SM: ", SM)
	print("SS: ", SS)
	print("P: ", P)
	print("Weapon dice: ", weapon.damage_dice)
	
	var num_dice = SM + P
	print("Rolling ", num_dice, "d", weapon.damage_dice)
	
	# ... rest
```

### ❌ "Initiative not sorting correctly"
**Solution:**
```gdscript
# Wrong:
turn_order.sort_custom(func(a, b): return a.initiative_roll > b.initiative_roll)

# Right (Godot 4):
turn_order.sort_custom(func(a, b): 
	return a.initiative_roll > b.initiative_roll
)

# Or use a named function:
func sort_by_initiative(a, b):
	return a.initiative_roll > b.initiative_roll

turn_order.sort_custom(sort_by_initiative)
```

---

## **Mobile Export Issues**

### ❌ "Android export not working"
**Setup checklist:**
1. Download Android SDK through Godot:
   - Editor → Manage Export Templates → Download
2. Generate Debug Keystore:
   - Project → Export → Android
   - Click "Debug Keystore" → Create
3. Set package name:
   - Use reverse domain: `com.yourname.rendition`
4. Enable permissions in export settings:
   - Storage permissions for save files

### ❌ "App crashes on mobile"
**Common causes:**
1. File paths - use `user://` not absolute paths
2. Large textures - compress images
3. Too many nodes - optimize scenes
4. Memory issues - test on device with adb logcat

---

## **Performance Issues**

### ❌ "Game running slowly"
**Optimizations:**
1. **Reduce draw calls:**
   - Combine similar UI elements
   - Use TextureAtlas for icons
   
2. **Optimize scripts:**
```gdscript
# Slow (runs every frame):
func _process(delta):
	update_all_stats()

# Fast (only when needed):
func update_character():
	update_stats()
```

3. **Use object pooling for combat:**
```gdscript
# Instead of creating/destroying damage numbers:
var damage_label_pool = []

func show_damage(amount):
	var label = damage_label_pool.pop_back() if damage_label_pool.size() > 0 else Label.new()
	# ... use label
	# When done:
	damage_label_pool.append(label)
```

---

## **Debugging Techniques**

### Print Debugging
```gdscript
# Print with context:
print("Character name: ", character.character_name)
print("Stats: ", character.stats.to_dict())

# Print in color (visible in editor):
print_rich("[color=red]ERROR: Something went wrong![/color]")
print_rich("[color=green]SUCCESS: Character saved![/color]")

# Conditional printing:
if OS.is_debug_build():
	print("Debug: Current HP = ", current_hp)
```

### Using Breakpoints
1. Click in the left margin of script editor (gray area)
2. Red dot appears = breakpoint set
3. Run project with F5
4. Game pauses at breakpoint
5. Inspect variables in Debugger panel (bottom)

### Remote Debugging
1. Run project on device
2. Editor → Debug → Deploy with Remote Debug
3. See console output from mobile device

---

## **When to Ask for Help**

If you've tried the above and still stuck:

1. **Godot Discord:** https://discord.gg/godot
   - Very active community
   - #scripting-help channel

2. **Godot Forum:** https://forum.godotengine.org

3. **Reddit:** r/godot
   - Good for longer questions

**When posting, include:**
- Godot version (e.g., "Godot 4.2.1")
- Minimal code example
- Error messages (full text)
- What you've tried already

---

## **Useful Godot Commands**

```gdscript
# Check if node exists before accessing:
if has_node("VBoxContainer/Label"):
	$VBoxContainer/Label.text = "Hello"

# Get node safely:
var label = get_node_or_null("VBoxContainer/Label")
if label:
	label.text = "Hello"

# Check if variable is valid:
if character != null and character is Character:
	# Safe to use

# Print all properties of an object:
for property in character.get_property_list():
	print(property.name, " = ", character.get(property.name))

# Get all children of a node:
for child in get_children():
	print(child.name)

# Free all children:
for child in get_children():
	child.queue_free()
```

---

## **Testing Checklist Before Release**

- [ ] Test character creation with all race/class combinations
- [ ] Verify save/load works
- [ ] Test combat with 2+ characters
- [ ] Check damage calculation with different weapons
- [ ] Test spell creation with extreme values
- [ ] Verify database browser shows all entries
- [ ] Test on lowest-end target device
- [ ] Check all buttons have signals connected
- [ ] Verify no error messages in console
- [ ] Test portrait/image loading
- [ ] Verify inventory add/remove
- [ ] Test multiclassing
- [ ] Check level-up mechanics
- [ ] Verify HP/MP calculations
- [ ] Test armor damage reduction

---

## **Quick Reference: Common Godot Types**

```gdscript
# Arrays
var my_array: Array = []
my_array.append(item)
my_array.size()
my_array[0]

# Dictionaries
var my_dict: Dictionary = {}
my_dict["key"] = "value"
my_dict.get("key", "default")
my_dict.has("key")

# Strings
var text: String = "Hello"
text.length()
text.split(",")
text.replace("old", "new")

# Numbers
var integer: int = 42
var decimal: float = 3.14
floor(3.7)  # = 3
ceil(3.2)   # = 4
round(3.5)  # = 4

# Random
randi() % 20  # Random int 0-19
randf()       # Random float 0.0-1.0
```

---

## **Emergency "Start Over" Procedure**

If everything is broken and you need to start fresh:

1. **Backup current project folder** (just in case!)
2. **Delete Godot cache:**
   - Close Godot
   - Delete `.godot/` folder in project directory
3. **Reimport project:**
   - Open Godot
   - Reimport project
4. **Reset to last working state:**
   - If using Git: `git reset --hard HEAD`
   - Otherwise: restore from backup

Remember: Starting over is sometimes faster than debugging! Don't be afraid to restart a problematic scene.
