---
tags:
  - Character
  - PC
  - CharacterSheet
PlayerName:
Cover:
---


---

# Character Sheet

| Level | Class Level |
| :---: | :---------: |
|  10   |      2      |

| Attribute Points | 37  |
| ---------------- | --- |

**Class Level** = floor(Level / 5)

---

## 🛡️ Core Stats
*Modifier = floor(Score / 4)*

| Stat             | Score | Modifier |
| :--------------- | :---: | :------: |
| **Strength**     |  10   |          |
| **Resistance**   |   3   |          |
| **Intelligence** |   2   |          |
| **Health Score** |   3   |          |
| **Mana Score**   |   3   |          |

### Derived Stats
| Stat               | Value | Notes                      | temp RN |
| :----------------- | :---: | :------------------------- | ------- |
| **Resistance No.** |  15   | 5 × Resistance             |         |
| **Total Mana**     |  160  | Base 100 + (MP Score × 20) |         |

### Health
*Base HP = 100 + (HP Score × 10)*

| Type                  | Current | Max | Ratio           |
| :-------------------- | :-----: | :-: | :-------------- |
| **Ward Health (WHP)** |   91    | 70  | Increased by +7 |
| **Core Health (CHP)** |   39    | 30  | Increased by +3 |

---

## 📊 Sub-Stats

| Sub-Stat         | Score | Sub-Stat         | Score |
| :--------------- | :---: | :--------------- | :---: |
| **Agility**      |   2   | **Intimidation** |   0   |
| **Aim**          |   8   | **Perception**   |   0   |
| **Coordination** |   0   | **Reflex**       |   0   |
| **Deception**    |   0   | **Seduction**    |   0   |
| **Dexterity**    |   2   | **Stealth**      |   4   |
| **Ingenuity**    |   0   | **Will**         |       |
| **Insight**      |   0   |                  |       |

---

## 👤 Identity

| Category            | Value           |
| :------------------ | :-------------- |
| **Race**            | Human not quite |
| **Primary Class**   | Ranger          |
| **Secondary Class** |                 |
| **Deity**           |                 |
| **Origin**          | anomoly         |
| **Background**      |                 |

---

## ⚔️ Class & Proficiency

### Class Focus
**Infinite ammo  and a lil proficiency:-** u get do i really need to explain... u get 2 proficiency with any projectile based weapon/thingy

### Proficiency
*Every 5 Levels (1 Class Level) = 1 Proficiency Point*

| Name     | Level |
| :------- | :---: |
| Musket   |   1   |
| Crossbow |   1   |
| Shotgun  |       |

---

## 🧬 Traits
### Race Traits
**Natural Affinity:-** Is lorax and stealth + 5 in nature(anything but city/ town).
**Sneak attack:-** 2x dmg and stun the opponent (int 12).
### Personal Traits

His father is a bugbear and his mother is a centaur....


---

## 🛠️ Skills and Abilities

### Skills
*Usable once per long rest*

**Silver Chariot:-** lets u teleport up to 50 ft away and u leave behind a circle of 5ft that deals 1d20 dmg to any enemy who enters for every turn that they stay.

****
### Abilities
*Usable Class Level times per day*
**Sniper's Blessing:-** You will not require to roll Aim(1.5X dmg) all ur shots hit the target.

---

## 🗡️ Weapons & Equipment

| Weapon                 | Effect                                           | Dmg Formula              | Range      | Dmg Type | Actual Dmg                       |
| :--------------------- | :----------------------------------------------- | :----------------------- | :--------- | :------- | :------------------------------- |
| **Dagger**             |                                                  | `(SM+P)d6+SS`            | Arm length |          | `3d6+13`                         |
| **Compound bow**       |                                                  | `(SM+1+P)d8+Aim+Dex`     | 150 ft     |          | ``                               |
| **Fist**               |                                                  | `SS`                     |            |          | `13`                             |
| **Shotgun **           | u can shoot every other turn                     | `(P+2)d20+Dex+Aim`       | +20 ft     |          | `dice: 2d20+13`                  |
| **Great shield**       | Need to take a break after using this twice.     | `(RM+P)(d6res/5mdr)`     |            |          | `3d6+4` (dmg res) `2d6` dmg delt |
| **The Chrisman Blade** | Upon hitting CHP X is increased by 1             | `(SM+P+2+1)d8+SS+(X*5)`  |            |          | `9d8+16+(x*5)`                   |
| **Golden Temptation**  | Can tempt enemies to attack. And can also scare. | `(RM+P)d6+RS+10/SMd6+10` |            |          | `1d6+14` / `1d6+10`              |

### Gear


### Armor
| Armor Res (ARN) | Armor HP (AHP) | Current AHP |
| :-------------: | :------------: | :---------: |
|       10        |      1000      |    10000    |


---

## 📜 Spells

```dataview
TABLE SpellLevel, MPCost, CastingMethod, Range, CastingTime, Duration
From ""
WHERE contains(file.tags, "#Ranger") and contains(file.tags, "#Spell") and MPCost > 1
Sort SpellLevel ASC

```

---

## 📖 Backstory & Description
## Glance
[[Strarrul Greenskin Glance]]
## Depth

___
## Iventory


