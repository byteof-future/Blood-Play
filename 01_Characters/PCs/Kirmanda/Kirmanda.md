---
tags:
  - Character
  - PC
  - CharacterSheet
PlayerName:
Cover:
---
 
# Character Sheet: Hunter Draya

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
| **Strength**     |       |          |
| **Resistance**   |       |          |
| **Intelligence** |       |          |
| **Health Score** |       |          |
| **Mana Score**   |       |          |

### Derived Stats
| Stat               | Value | Notes                               |
| :----------------- | :---: | :---------------------------------- |
| **Resistance No.** |       | 5 × Resistance (shown as Res*5(20)) |
| **Total Mana**     |       | Base 100 + (MP Score × 20)          |

### Health
*Base HP = 100 + (HP Score × 10)*

| Type                  | Current | Max | Modifier        |
| :-------------------- | :-----: | :-: | :-------------- |
| **Ward Health (WHP)** |         |     | Increased by +6 |
| **Core Health (CHP)** |         |     | Increased by +4 |

---
## 📊 Sub-Stats

| Sub-Stat         | Score | Sub-Stat         | Score |
| :--------------- | :---: | :--------------- | :---: |
| **Agility**      |       | **Intimidation** |       |
| **Aim**          |       | **Perception**   |       |
| **Coordination** |       | **Reflex**       |       |
| **Deception**    |       | **Seduction**    |       |
| **Dexterity**    |       | **Stealth**      |       |
| **Ingenuity**    |       | **Will**         |       |
| **Insight**      |       |                  |       |

---

## 👤 Identity

| Category            | Value        |
| :------------------ | :----------- |
| **Race**            | Tiefling     |
| **Primary Class**   | Artificer    |
| **Secondary Class** | Runesmith    |
| **Origin**          | Cosmic Child |
| **Background**      | Slave        |

---

## ⚔️ Class & Proficiency

### Class Focus
****

****

### Proficiency
*Every 5 Levels (1 Class Level) = 1 Proficiency Point*

| Name | Level |
| :--- | :---: |
|      |       |

---

## 🧬 Traits

* **Night vision:** your vision isn't depleted at night (but in complete darkness it is)
* **Keen Senses:** You have advantage on Perception checks related to sight and hearing. You can see twice as far in dim light and can detect hidden creatures within 30 feet with a successful Perception check (DC 15).

---

## 🛠️ Skills and Abilities

### Skills
*Usable once per long rest*
1.**Expert Infusion:-** Infuse ur magic into objects at 3 times the potency.

### Abilities
*Usable Class Level times per day*
1. **Machination:-**  Can Create one object of machination that performs a simple task. 

---

## 🗡️ Weapons & Equipment

| Weapon | Effect                                  | Dmg Formula     | Range | Dmg Type | Actual Dmg |
| :----- | :-------------------------------------- | :-------------- | :---- | :------- | :--------- |
| sai    | has a chance to poison resistance dc 12 | (SM+P)d6+SS+Dex | 5ft   | Piercing | `dice:`    |

---

## 📜 Spells
# Current Spells


```dataview
TABLE SpellLevel, MPCost, CastingMethod, Range, CastingTime, Duration
From ""
WHERE contains(file.tags, "#Artificer") and contains(file.tags, "#Spell") and MPCost > 1 and SpellLevel < 3
Sort SpellLevel ASC

```

## Inventory

**Beast Ball:-** can hold 1 willing creature or a unwilling creature of CHP < 20 that fails a DC 12 Will Check

**Body suit:-** it enhances ur Strength and Agility by 4 and dex will be lowered by 2.