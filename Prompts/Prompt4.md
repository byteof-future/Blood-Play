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
        
    - Base MP = 100 + (MP Score × 20)
	    
    - Resistance Number(RN) = 5 x Resistance
    
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

- **Time Scale:** 1 Turn = 2 Minutes in-game
    
- **Conversions:**
    
    - 5 Turns = 10 Minutes
        
    - 15 Turns = 30 Minutes
        
    - 30 Turns = 60 Minutes
        

**Per Turn Actions:**

1. **One Action** (Attack, Cast Spell, etc.)
    
2. **One Bonus Action** (Retreat, Dash, Hide, etc.)
    
3. **Use Skills/Abilities**(Abilities can be used in combination with Attacking/Casting  a spell or a bonus action)
    
4. **One Free Action** (Communication, simple interaction)
    

### **Attack Resolution Sequence**

**Step 1: Calculate DMGA (Damage Roll)**

- **Physical:** DMGA = (SM × (dX + P)) + SS
    
    - SM = Strength Modifier, P = Proficiency, SS = Strength Score, dX = X-sided die
        
- **Spell:** DMGA = (IM × (dX + P) + IS
    
    - IM = Intelligence Modifier, IS = Intelligence Score
        

**Step 2: Check Armor**

- If target has armor AND damage type doesn't bypass armor:(AC is Armor Class)
    
    - ARN = AC × 5 (Armor Resistance Number)
        
    - AHP = Current Armor Health (AC × 1000 max)
        
- **If ARN ≥ DMGA:**
    
    - AHP = AHP - DMGA
        
    - DMGT = 0 (no damage through)
        
- **If ARN < DMGA:**
    
    - AHP = AHP - DMGA
        
    - DMGT = DMGA - ARN (damage that penetrates)
        

**Step 3: Apply Damage Type Modifiers to DMGT**

- Each damage type has specific post-armor effects (see Damage Type table)
    

**Step 4: Resolve vs Resistance & Health**

- RN = RES × 4 (Resistance Number)
    
- **If DMGT ≤ RN:** WHP = WHP - DMGT
    
- **If DMGT > RN:**
    
    - FDMG = DMGT - RN
        
    - WHP = WHP - DMGT
        
    - CHP = CHP - FDMG
        

**Step 5: Apply Damage Type Effects**

- Bleeding, ongoing damage, status effects, etc.
    

**Special Case:** If target has no armor (ARN = 0), DMGA acts as DMGT directly.

### **Damage Types Table**(work in progress)

| Type          | Effect                                                  | Notes                                                    |
| ------------- | ------------------------------------------------------- | -------------------------------------------------------- |
| **Blunt**     | 2 x DMG to Solid(tough) Enemies(Rock Golem)             | Is ineffective Against Squishy Targets(0.5 x DMG)(Slime) |
| **Piercing**  | Effective against Meaty (Squishy)foe's(Humans)(2 x DMG) | Ineffective Against Tough foe's(Rock Golem)(0.5 x DMG)   |
| **Slashing**  | ...                                                     |                                                          |
| **Acid**      |                                                         |                                                          |
| **Fire**      |                                                         |                                                          |
| **Cold**      |                                                         |                                                          |
| **Lightning** |                                                         |                                                          |
| **Poison**    |                                                         |                                                          |
| **Psionic**   |                                                         |                                                          |
| **Necrotic**  |                                                         |                                                          |
| **Radiant**   |                                                         |                                                          |
| **Force**     |                                                         |                                                          |

---

## **Equipment System**

### **Armor Table**

| Armor                    | ARN | AHP   |
| ------------------------ | --- | ----- |
| None                     | 0   | 0     |
| Padded Clothes           | 5   | 1000  |
| Leather                  | 10  | 2000  |
| Reinforced Leather       | 15  | 3000  |
| Chainmail                | 20  | 4000  |
| Half Plate               | 25  | 5000  |
| Full Plate               | 30  | 6000  |
| Mithril Plate            | 35  | 7000  |
| Dwarven Full Plate       | 40  | 8000  |
| Juggernaut Armor         | 50  | 10000 |
| Legendary Fortress Armor | 60  | 12000 |

### **Weapon Properties**

Weapons use the format: `dice: (Modifier + P)dX + Stat`

**Example Weapons:**

- **Dagger:** `(SM + P)d4  + SS` -  Thrown (20/40 ft)
    
- **Longsword:** (SM + P)d8 + SS
    
- **Katana:** (SM + P)d8 + SS`
    
- **Long Bow:** (SM + P + AIM)d8


## **Magic System**

### **Spellcasting Attributes**

- **Primary:** Intelligence (INT) - `IM = floor(INT_Score / 4)`
    
- **Secondary (case-specific):** Will, Seduction, or MP may influence certain spells
    

### **Casting Methods**

1. **Chanting:** Verbal incantations, possible gesture component. Longer casting (minutes). Enables complex, conditional, or multi-effect spells.
    
2. **Non-Verbal:** Thought-based. Instantaneous. Simpler, single-effect spells.
    
3. **Ritual:** Requires materials/tools. Lengthy preparation (10 mins to 1+ hours).
    
4. **Rune:** Pre-carved into stones. Complexity determines rune size. Always ready.
    
5. **Spirit:** Cast by bound spirits per instruction or their own will.
    
### **Spell Effects Categories**

Aegis,Alteration,Cognition,Compulsion,Energy,Phantasm,Summoning,Vitality
