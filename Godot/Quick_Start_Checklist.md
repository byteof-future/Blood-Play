# RENDITION - Quick Start Checklist

## 🚀 Your First 7 Days - Step-by-Step

This checklist breaks down the development into **bite-sized daily tasks**. Follow this to stay on track!

---

## **DAY 1: Setup & Environment** ✅

**Tasks:**
- [ ] Download and install Godot 4.2+ from https://godotengine.org
- [ ] Create new project named "RENDITION_TTRPG"
- [ ] Choose "Forward+" renderer
- [ ] Create folder structure:
  ```
  - assets/
  - data/databases/
  - scripts/core/
  - scripts/managers/
  - scripts/utils/
  - scenes/ui/
  - scenes/components/
  - saves/characters/
  - saves/campaigns/
  ```
- [ ] Install SQLite plugin from AssetLib (or manually)
- [ ] Test project runs (F5)

**Estimated Time:** 1 hour

---

## **DAY 2: Core Data Classes** ✅

**Tasks:**
- [ ] Create `scripts/core/Stats.gd`
  - Copy code from main guide
  - Test by creating a Stats object in a test scene
- [ ] Create `scripts/core/Character.gd`
  - Copy code from main guide
  - Add test prints to verify functions
- [ ] Create all JSON database files in `data/databases/`:
  - [ ] races.json
  - [ ] origins.json
  - [ ] backgrounds.json
  - [ ] weapons.json
  - [ ] armor.json
  - [ ] classes.json (start with 2 classes)
  - [ ] spells.json
  - [ ] monsters.json (start with 2 monsters)

**Test:** Create a test scene with a button that creates a Character and prints its stats

**Estimated Time:** 2-3 hours

---

## **DAY 3: Data Manager** ✅

**Tasks:**
- [ ] Create `scripts/managers/DataManager.gd`
- [ ] Implement JSON loading functions
- [ ] Add to Autoload (Project Settings → Autoload)
- [ ] Test loading each database:
  ```gdscript
  # In a test scene:
  func _ready():
      print(DataManager.races)
      print(DataManager.weapons)
  ```
- [ ] Implement save_character() function
- [ ] Implement load_character() function
- [ ] Test saving and loading a character

**Test:** Create, save, and reload a character to verify data persists

**Estimated Time:** 2 hours

---

## **DAY 4: Main Menu & Basic UI** ✅

**Tasks:**
- [ ] Create `scenes/Main.tscn`
  - Add VBoxContainer with buttons
  - Style with theme/fonts (optional)
- [ ] Attach script with button functions
- [ ] Set as main scene (Project Settings → Application → Run → Main Scene)
- [ ] Create placeholder scenes:
  - [ ] CharacterCreation.tscn
  - [ ] CombatTracker.tscn
  - [ ] DatabaseBrowser.tscn
- [ ] Test navigation between scenes

**Test:** Click each button and verify scene changes work

**Estimated Time:** 2 hours

---

## **DAY 5: Character Creation UI (Part 1)** ✅

**Tasks:**
- [ ] Build CharacterCreation.tscn scene tree
  - [ ] Name input field
  - [ ] Race dropdown
  - [ ] Origin dropdown
  - [ ] Background dropdown
- [ ] Populate dropdowns from DataManager
- [ ] Create stats preview label
- [ ] Test dropdown population

**Test:** Open character creation, verify all dropdowns show correct options

**Estimated Time:** 3 hours

---

## **DAY 6: Character Creation UI (Part 2)** ✅

**Tasks:**
- [ ] Add class selection dropdowns
- [ ] Add multiclass checkbox
- [ ] Implement preview_stats() function
- [ ] Connect all signals
- [ ] Implement character creation logic
- [ ] Test full character creation flow
- [ ] Verify stats calculate correctly

**Test:** Create 3 different characters with different combinations, verify stats are correct

**Estimated Time:** 3 hours

---

## **DAY 7: Character Sheet Display** ✅

**Tasks:**
- [ ] Create CharacterSheet.tscn
  - Display name, race, class
  - Show all stats
  - Display HP/MP bars
  - Show equipped items
- [ ] Add "Level Up" button
- [ ] Implement level up logic
- [ ] Test character sheet display
- [ ] Test stat point allocation after level up

**Test:** Load a character and verify all information displays correctly

**Estimated Time:** 3 hours

---

## **WEEK 2 PREVIEW**

### Days 8-14: Combat System
- Initiative rolling & sorting
- Turn tracker UI
- Attack resolution
- Damage calculation automation
- Health/Armor damage application

---

## **Quick Win Milestones** 🎯

Check off these as you achieve them:

**Milestone 1: Data Foundation** ✅
- [ ] All JSON files created and loading
- [ ] DataManager working
- [ ] Can create and save a character

**Milestone 2: Character Creation** ✅
- [ ] Full character creation flow works
- [ ] Stats calculate correctly
- [ ] Characters save and load

**Milestone 3: Combat Basics** (Week 2)
- [ ] Initiative system works
- [ ] Can attack and deal damage
- [ ] HP/Armor tracking functional

**Milestone 4: Full Feature Set** (Week 4-6)
- [ ] Spell creation tool works
- [ ] Inventory management complete
- [ ] Database browser functional

**Milestone 5: Polish** (Week 8-10)
- [ ] UI looks good
- [ ] Mobile version works
- [ ] Ready for playtest!

---

## **Daily Development Routine**

**Start of Session:**
1. Open Godot project
2. Review previous day's work
3. Run project to verify everything still works
4. Check today's tasks

**During Development:**
- Save frequently (Ctrl+S)
- Test after each major change
- Use print() statements liberally
- Don't skip error messages!

**End of Session:**
- Test the project one final time
- Make notes of what's working/broken
- Plan next session's tasks
- Backup project folder (optional but smart!)

---

## **Common First-Week Questions**

**Q: "I finished Day X early, what should I do?"**
A: Move to next day's tasks OR add polish (better UI, more database entries)

**Q: "Day X is taking longer than estimated, is that okay?"**
A: YES! Estimates are rough. Take your time to understand each piece.

**Q: "Can I skip JSON files and use Godot Resources instead?"**
A: Yes, but JSON is easier to edit outside Godot. Resources are more advanced.

**Q: "Should I make pixel art assets now?"**
A: No! Use placeholder buttons/labels first. Art comes later.

**Q: "My code has errors, help!"**
A: Check the Troubleshooting Guide! Most common errors are covered there.

---

## **Tools to Make Life Easier**

**Code Editor Alternatives:**
- Godot's built-in editor (good enough!)
- VS Code with Godot Tools extension
- Sublime Text

**JSON Validators:**
- https://jsonlint.com
- VS Code has built-in JSON validation

**Asset Resources:**
- OpenGameArt.org (free sprites)
- itch.io (free game assets)
- Kenney.nl (free pixel art packs)

**Learning Resources:**
- Godot Docs: https://docs.godotengine.org
- GDQuest YouTube: Excellent tutorials
- Brackeys Godot playlist
- HeartBeast Godot series

---

## **Motivation Tips** 💪

**When you feel stuck:**
1. Take a 10-minute break
2. Re-read the relevant guide section
3. Check troubleshooting guide
4. Ask for help (Discord/Reddit/Forum)
5. Skip to a different task and come back later

**Remember:**
- Every professional developer gets stuck!
- Bugs are learning opportunities
- Small progress is still progress
- Your first version doesn't need to be perfect

**Celebrate small wins:**
- First JSON file loaded? Awesome!
- Character created? Amazing!
- First combat resolved? Incredible!

---

## **Emergency Contact Sheet**

**Godot Discord:** https://discord.gg/godot
- #scripting-help
- #beginner-help

**Godot Forum:** https://forum.godotengine.org

**Reddit:** r/godot
- Friendly community
- Great for feedback

**Stack Overflow:** Tag questions with [godot]

---

## **Week 1 Success Checklist** ✅

By end of Week 1, you should have:
- [ ] Working Godot project
- [ ] All database JSON files
- [ ] DataManager loading data
- [ ] Main menu navigation
- [ ] Character creation working
- [ ] Characters saving/loading
- [ ] Character sheet display

**If you have all these: CONGRATULATIONS! 🎉**
You're ready for Week 2: Combat System!

---

## **What If I'm Behind Schedule?**

**Don't panic!** Here's what to do:

1. **Prioritize:**
   - Focus on Character Creation first
   - Combat can wait
   - Polish comes last

2. **Simplify:**
   - Start with 2 races instead of 5
   - Use 2 classes instead of 20
   - Add more content later

3. **Get Help:**
   - Post specific questions online
   - Share your code for review
   - Watch tutorial videos on confusing topics

4. **Take Breaks:**
   - Burnout helps nobody
   - Come back fresh tomorrow
   - This is a marathon, not a sprint!

---

## **Final Motivation**

You're building a custom TTRPG tool from scratch! That's:
- **Ambitious** ✅
- **Challenging** ✅
- **Totally doable** ✅

Many people have done this before. You can too!

**The secret?**
One day at a time. One feature at a time. One bug fixed at a time.

Before you know it, you'll be running RENDITION sessions with your custom tool!

---

**Now, go create something awesome!** 🚀

```
> Day 1: ☐ Not Started
> Day 1: ☑ Complete!
```

**Ready? START WITH DAY 1!**
