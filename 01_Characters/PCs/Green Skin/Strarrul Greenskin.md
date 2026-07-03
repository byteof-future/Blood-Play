---
tags:
  - Character
  - PC
  - CharacterSheet
PlayerName: Strarrul Greenskin
Cover: "[[Greenskin.png]]"
---
![[Greenskin.png]]

---

# Character Sheet

| Level | Class Level |
| :---: | :---------: |
|  25   |      5      |

| Attribute Points | 0   |
| ---------------- | --- |

**Class Level** = floor(Level / 5)

---

## 🛡️ Core Stats
*Modifier = floor(Score / 4)*

| Stat             | Score | Modifier |
| :--------------- | :---: | :------: |
| **Strength**     |  +16  |    +4    |
| **Resistance**   |  +6   |    +1    |
| **Intelligence** |  +1   |    +0    |
| **Health Score** |  +5   |    -     |
| **Mana Score**   |  +7   |    -     |

### Derived Stats
| Stat               |  Value  | Notes                      | temp RN |
| :----------------- | :-----: | :------------------------- | ------- |
| **Resistance No.** |   30    | 5 × Resistance             |         |
| **Total Mana**     | 260/260 | Base 100 + (MP Score × 20) |         |

### Health
*Base HP = 100 + (HP Score × 10)*

| Type                  | Current | Max | Ratio           |
| :-------------------- | :-----: | :-: | :-------------- |
| **Ward Health (WHP)** |   105   | 105 | Increased by +7 |
| **Core Health (CHP)** |   45    | 45  | Increased by +3 |

---

## 📊 Sub-Stats

| Sub-Stat         | Score | Sub-Stat         | Score |
| :--------------- | :---: | :--------------- | :---: |
| **Agility**      |   0   | **Intimidation** |  +2   |
| **Aim**          |   -   | **Perception**   |  +3   |
| **Coordination** |  +4   | **Reflex**       |   -   |
| **Deception**    |   -   | **Seduction**    |  -3   |
| **Dexterity**    |  +2   | **Stealth**      |  +0   |
| **Ingenuity**    |   -   | **Will**         |  +5   |
| **Insight**      |  +3   |                  |       |

---

## 👤 Identity

| Category            | Value                  |
| :------------------ | :--------------------- |
| **Race**            | Hobgoblin              |
| **Primary Class**   | Paladin                |
| **Secondary Class** | -                      |
| **Deity**           | Aveita, God of Genesis |
| **Origin**          | Natural-Born           |
| **Background**      | Noble                  |

---

## ⚔️ Class & Proficiency

### Class Focus
* **EVIL'S BANE:** +5 Damage Vs Fiends/Undead. Smites bypass Resistance.
* **OATHBOUND RESOLVE:** +5 to resist charms. Immune to fear while near allies.

### Proficiency
*Every 5 Levels (1 Class Level) = 1 Proficiency Point*

| Name | Level |
| :--- | :---: |
| Large Shield | 1 |
| Great Sword | 2 |
| Long sword | 2 |

---

## 🧬 Traits
### Race Traits
* **IRON WILL:** Advantage on saves vs. mind-affecting effects while conscious and in formation with allies.
* **NIGHT VISION:** your vision isn't depleted at night (but in complete darkness it is)
### Personal Traits
* **Physical traits:** Shorter than most hobgoblins (5'5), Green colored skin, A row of teeth marks on left hand from eel hound attack.
* **Personality:** Wary of most creatures but a little more friendly to goblins and humans. Kind but doesn't show. Uncontrollable fear for large water bodies.

---

## 🛠️ Skills and Abilities

### Skills
*Usable once per long rest*
1. **LAY ON HANDS:** Heal target for 5xHP+pclvl score or cure disease/poison. Touch range.
2. **Vengeance Conversion:** accumulates damage over 5 turns, accumulated damage can be either dealt as AOE or added to weapon dmg. 

### Abilities
*Usable Class Level times per day*
1. **HOLY STRIKE:** Imbue weapon with radiant energy (2x vs undead/fiends). Lasts 1 minute/6 turns.
2. **SMITE EVIL:** Deal Double dmg to anyone with evil intent towards you.
3. **Axiom of The Unbreeched**-
On activation, choose a number X
Any instance of damage above X is ignored
Damage below X is taken normally
Multi-hit attacks are not combined
Damage-over-time is capped per tick. 
Process of choosing the number : either a dice roll or I choose the number, if I choose the number and I choose too low, I'll need to face a penalty

---

## 🗡️ Weapons & Equipment

| Weapon                 | Effect                                                                                 | Dmg Formula              | Range      | Dmg Type | Actual Dmg                       |
| :--------------------- | :------------------------------------------------------------------------------------- | :----------------------- | :--------- | :------- | :------------------------------- |
| **Dagger**             |                                                                                        | `(SM+P)d6+SS`            | Arm length |          | `3d6+13`                         |
| **Short bow**          |                                                                                        | `(SM+A+P)d6(Aim)`        | 50 ft      |          | `2d6`                            |
| **Fist**               |                                                                                        | `SS`                     |            |          | `13`                             |
| **Great sword**        | Need to take a break after using this attack twice. Can chop off body parts of enemies | `(SM+P+2)d6+SS`          | +2Foot     |          | `2d10+13`                        |
| **Great shield**       | Need to take a break after using this twice.                                           | `(RM+P)(d6res/5mdr)`     |            |          | `3d6+4` (dmg res) `2d6` dmg delt |
| **The Chrisman Blade** | Upon hitting CHP X is increased by 1                                                   | `(SM+P+2+1)d8+SS+(X*5)`  |            |          | `9d8+16+(x*5)`                   |
| **Golden Temptation**  | Can tempt enemies to attack. And can also scare.                                       | `(RM+P)d6+RS+10/SMd6+10` |            |          | `1d6+14` / `1d6+10`              |

### Gear
* A traveling bag
* A great sword and a great shield
* 3 snake dead bodies
* **A golden amulet restoration:** (it has 2 snakes around the central gem one eating its own tail and the other coiled around another made of gold). It can give you advantage on 1 Death save once a day and can carry 5 souls in it when another soul is added the 1st one is destroyed to release those souls you need to break the amulet and to purge all souls in it you need to pour 50MP per soul.
* **Plated armour**

### Armor
| Armor Res (ARN) | Armor HP (AHP) | Current AHP |
| :---: | :---: | :---: |
| 25 | 25 | 10000/10000 |

---

## 📜 Spells

| Lvl | Spell               |     Time     | MP  | Effect                                                                             | Range | Duration       | Dmg Formula | Actual Dmg |
| :-: | :------------------ | :----------: | :-: | :--------------------------------------------------------------------------------- | :---- | :------------- | :---------- | :--------- |
|  -  | **Minor Heal**      |   Instant    | 20  | Can heal a creatures WHP                                                           | Touch | none           | `IMd6+ IS`  | `d6+1`     |
|  -  | **Shine**           |   Instant    | 20  | You light up an area around you increasing your vision...                          | 20ft  | 15 turns/30min |             |            |
|  -  | **Iron body**       |   Instant    | 50  | Doubles your dmg reduced but gives you 2 point of fatigue                          |       | 5turns/10min   |             |            |
|  -  | **Major heal**      |    1 turn    | 40  | Can heal a creatures WHP and CHP by                                                | Touch | none           | `<M>d10+IS` | `<d10>+1`  |
|  -  | **Enchant**         |    1 turn    | 20  | Can enchant any weapon for a single time increasing its die count by 2.ex (X+2)dy. | Touch | 5turns/10min   | `(X+2)dX`   |            |
|  -  | **Holy Light**      |    1 turn    | 40  | Cures Dizeas, Calms Emotions, Heals Whp, Removes madness, Cures Possession,        | touch |                |             |            |
|  -  | **Purify**          |    1 turn    | 40  | Can turn 1 L normal water into holy water (can do this once a day)                 | touch |                |             |            |
|  -  | **Bless**           |   1 Action   | 30  | You bless up to 3 creatures... add a d20 to their attack rolls and saving throws.  | 30ft  | 10 turns       |             |            |
|  -  | **Shield of Faith** | Bonus Action | 20  | A shimmering field surrounds a creature, increasing its ARN by +10.                | 60ft  | 10 turns       |             |            |
|  -  | **Heal**            |   1 Action   | 150 | The most powerful single target healing spell... Restores all WHP & CHP.           | Touch | Instant        | `8d8+1`     |            |

---

## 📖 Backstory & Description
## Glance
[[Strarrul Greenskin Glance]]
## Depth
[[Strarrul Greenskin History]]
[[What Strarrul Greenskin Knows]]
[[Who Strarrul Greenskin Knows]]
___
## Iventory

Golden amulet of restoration-
