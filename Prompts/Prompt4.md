# **RENDITION TTRPG - Final Game Design Document**

## **Project Vision & Core Request**

I want to develop a  digital tool for my custom TTRPG, "RENDITION." This  application will facilitate gameplay with a focus on combat, character progression, equipment mechanics, monster archives, weapons archive, spell archive, Races, origin and background, armor archive, class archive and item databases.

## **What is RENDITION TTRPG?**

RENDITION is a collaborative, narrative-focused tabletop roleplaying game where players assume one of two roles:

- **The Game Master (GM):** Crafts the world, narrates the story, controls all Non-Player Characters (NPCs), and adjudicates outcomes.
    
- **The Players:** Each creates and roleplays a Player Character (PC), making decisions that drive the narrative forward within the GM's world.
    

---

## **Core Character Mechanics**

### **Stats System**

**5 Core Stats:**

- Strength (STR), Resistance (RES), Intelligence (INT), Health Points (HP), Mana Points (MP)
    
- **Modifiers:** STR, RES, INT have Modifiers = floor(Score / 5)
    
- **HP System:** Split into Ward Health (WHP) and Core Health (CHP)
    
    - Ratio is species-dependent (e.g., Hobgoblin: +7 WHP, +3 CHP per HP point)
        
    - Base HP = 100 + (HP Score × 10)
	    
    - Resistance Number(RN) = Resistance Score x Resistance Modifier
    
- 

**13 Sub-Stats:**

- Agility, Aim, Coordination, Deception, Dexterity, Ingenuity, Insight, Intimidation, Perception, Reflex, Seduction, Stealth, Will
    
- These scores act as direct modifiers to relevant checks

### **Progression System**

**Level Structure:**

- **100 PC Levels:** Each grants 1 AP (Attribute Point) to increase any Core or Sub stat score by 1
    
- **Class Levels:** Every 5 PC Levels = 1 Class Level (max 20)
    
- **Proficiency Levels:** Every 5 PC Levels = 1 Proficiency Level (max 20) - can be allocated to any weapon or spell type
    

**Character Development:**

- **Starting Profile:** Level 1 characters have:
    
    - 27 total stat points (15 Race + 5 [[OriginIndex|Origin]] + 7 [[BackgroundIndex|Background]])
        
    - 1 chosen Trait + all innate Race traits
        
    - One Proficiency Level with 1 weapon/Spell Type
        
- **Class Progression:** At each Class Level:
    
    - Choose 1 Ability (odd levels) or 1 Skill (even levels)
        
    - **Selection Options:** 1 out of 6 (with 2 classes) or 1 out of 3 (with 1 class)
        
    - **Ability Points:** Total = Class Level, reset per short rest, all abilities cost 1 AP
	    
	- Choosing only a single class gives you Class Focus(An extra Class Specific Skill)

**Classes (20):**  
Fighter, Rogue, Barbarian, Ranger, Paladin, Bard, Sorcerer, Wizard, Cleric, Monk, Druid, Warlock, Artificer, Alchemist, Witch, Beast Master, Runesmith, Necromancer, Summoner, Spirit Medium

---

## **Combat System**

### **Initiative & Surprise**

1. **Detection:** If parties are unaware of each other, no combat occurs.
    
2. **Spotting:** If Party A spots Party B (who is unaware):
    
    - **Option 1 - Ambush:** Roll Stealth (A) vs Perception (B)
        
        - Success: A gains TEMPO (1 free action) → Surprise Round
            
        - Failure: Proceed to standard Initiative
            
    - **Option 2 - Head-On:** Roll Agility/Dexterity (A) vs Reflex (B)
        
        - Success: A gains TEMPO → Standard Initiative
            
        - Failure: Standard Initiative
            
3. **Surprise Round:** Attacking party takes Tempo action, surprised party may use Reaction to roll Reflex for defense.
    
4. **Standard Initiative:** Roll for turn order if no Tempo triggered.
    

### **Turn Structure**

- **Time Scale:** 1 Round = 2 Minutes in-game
    
- **Conversions:**
    
    - 5 Rounds = 10 Minutes
        
    - 15 Rounds = 30 Minutes
        
    - 30 Rounds = 60 Minutes
        

**Per Turn Actions:**

1. **One Action** (Attack, Cast Spell, etc.)
    
2. **One Bonus Action** (Retreat, Dash, Hide, etc.)
    
3. **Use Skills/Abilities**(only one skill and ability can be used per turn along with action & bonus Action)
    
4. ** Free Action** (Communication, simple interaction)
    

### **Attack Resolution Sequence**

**Step 1: Calculate DMGA (Damage Roll)**

- DMGA = (p+x)dy +((RSM or RSS) x RSS)
    
    - P = Proficiency, dy = y-sided die RSM= Relevant stat modifier, RSS=Relevant Stat Score where x is a positive int greater than 1
    
**Step 2: Subtract DMGA from Total Resistance**

Total Resistance(TR) = Resistance Number (RN) +ARN (Armor Resistance Number)
DMG=DMGA-TR

**Step 3: Subtract the DMG from ward health**

DMGA-TR will be the dmg taken by the player or the enemy 
this dmg will reduce their WHP(if its a simple attack like blunt or slashing but if its a piercing attack it will deal dmg to CHP)

once WHP is 0, CHP will start to take hits
### **Damage Types Table**(work in progress)

| Type          | Effect | Notes                                                                                                        |
| ------------- | ------ | ------------------------------------------------------------------------------------------------------------ |
| **Blunt**     | WHP    | can knock prone on nat 20                                                                                    |
| **Piercing**  | CHP    | Half Dmg will hit WHP and Half will hit CHP if rolls higher than 15 all dmg will be taken by CHP on a nat 20 |
| **Slashing**  | WHP    | Applies bleeding status on rolls above 15 (requires a action to stop bleeding)                               |
| **Acid**      |        |                                                                                                              |
| **Fire**      |        |                                                                                                              |
| **Cold**      |        |                                                                                                              |
| **Lightning** |        |                                                                                                              |
| **Poison**    |        |                                                                                                              |
| **Psionic**   |        |                                                                                                              |
| **Necrotic**  |        |                                                                                                              |
| **Radiant**   |        |                                                                                                              |
| **Force**     |        |                                                                                                              |
| ****          |        |                                                                                                              |

---

## **Equipment System**

### **Armor Table**

| Armor                    | ARN | AHP |
| ------------------------ | --- | --- |
| None                     | 0   | 0   |
| Padded Clothes           | 5   | 5   |
| Leather                  | 10  | 10  |
| Reinforced Leather       | 15  | 15  |
| Chainmail                | 20  | 20  |
| Half Plate               | 25  | 25  |
| Full Plate               | 30  | 30  |
| Mithril Plate            | 35  | 35  |
| Dwarven Full Plate       | 40  | 40  |
| Juggernaut Armor         | 50  | 50  |
| Legendary Fortress Armor | 60  | 60  |

### **Weapon Properties**

Weapons use the format: `dice: (P+x)dy+(RSM x RSS)


## **Magic System**

### **Spellcasting Attributes**

- **Primary:** Intelligence (INT) - `IM = floor(INT_Score / 5)`
    
- **Secondary (case-specific):** Will, Seduction, or MP may influence certain spells
    

### **Casting Methods**

1. **Chanting:** Verbal incantations, possible gesture component. Longer casting (minutes). Enables complex, conditional, or multi-effect spells.
    
2. **Non-Verbal:** Thought-based. Instantaneous. Simpler, single-effect spells.
    
3. **Ritual:** Requires materials/tools. Lengthy preparation (10 mins to 1+ hours).
    
4. **Rune:** Pre-carved into stones. Complexity determines rune size. Always ready.
    
5. **Spirit:** Cast by bound spirits per instruction or their own will.
    
### **Spell Effects Categories**

Aegis,Alteration,Cognition,Compulsion,Energy,Phantasm,Summoning,Vitality
