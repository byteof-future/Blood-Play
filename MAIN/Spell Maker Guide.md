


## **Spell Design Philosophy**

1. **Dual Scaling:** Spells scale with both **Spell Level** (intrinsic power) and **Caster Level** (caster's mastery)
    
2. **Resource Balance:** More powerful spells cost significantly more mana, creating meaningful choices
    
3. **Progression Curve:** Spells become exponentially more powerful but with exponentially higher costs
    
4. **Specialization Rewards:** Focusing on specific spell types or schools provides significant bonuses
    

## **1. Spell Tier System**

### **Spell Categories by Power Level**

|Tier|Spell Level|Class Level Req|Description|Typical Battle Impact|
|---|---|---|---|---|
|**Cantrip**|0|1|Basic magical effects|Minor utility/damage|
|**Novice**|1-3|1-3|Foundational spells|Single target focus|
|**Adept**|4-7|4-7|Enhanced effects|Multi-target/control|
|**Expert**|8-12|8-12|Powerful magic|Battle-changing|
|**Master**|13-16|13-16|Devastating spells|Encounter-ending|
|**Legendary**|17-20|17-20|Reality-altering|Campaign-altering|

## **2. Comprehensive Spell Design Formula**

### **Base Spell Power Equation**

text

SPP (Spell Power Points) = SL × (10 + √SL × 5)

This creates an accelerating curve where higher-level spells get disproportionately more points.

**SPP by Spell Level:**

- SL 1: 15 points
    
- SL 3: 51 points
    
- SL 5: 91 points
    
- SL 10: 258 points
    
- SL 15: 528 points
    
- SL 20: 847 points
    

### **Point Allocation System**

#### **A. Damage/Healing Base (Cost: X points)**

text

Base Damage = (CEL^E) × (dY)

Where:

- **CEL** = Caster's Effective Level (Class Level)
    
- **E** = Exponent (0.8 for balanced, 1.0 for level-linear, 1.2 for accelerated)
    
- **dY** = Die size determined by points
    

|Points|Effect|
|---|---|
|1 per die|Add one damage die|
|2 per size|Increase die size (d4→d6→d8→d10→d12)|
|5 per 0.1E|Adjust exponent (min 0.5, max 1.5)|

**Example:** 20 points could buy: 10d6 with E=1.0, or 5d10 with E=1.2

#### **B. Area of Effect (AoE)**

|AoE Type|Point Cost|Radius/Shape|
|---|---|---|
|Single Target|0|One creature|
|Small Burst|10|10ft radius|
|Medium Burst|25|20ft radius|
|Large Burst|50|30ft radius|
|Cone (15ft)|15|15ft cone|
|Cone (30ft)|30|30ft cone|
|Line (30ft)|20|5ft wide, 30ft long|
|Line (60ft)|40|5ft wide, 60ft long|

#### **C. Duration**

|Duration|Point Cost|Multiplier|
|---|---|---|
|Instant|0|1.0|
|1 Round|5|1.2|
|1 Round/Level|15|1.5|
|1 Minute/Level|30|2.0|
|10 Minutes/Level|50|2.5|
|1 Hour/Level|75|3.0|
|Permanent*|150|4.0|

*Permanent duration may have conditions/ways to dispel

#### **D. Range**

|Range|Point Cost|Multiplier|
|---|---|---|
|Touch|0|0.8|
|Close (30ft)|5|1.0|
|Medium (60ft)|10|1.2|
|Long (120ft)|20|1.5|
|Sight (500ft)|40|2.0|
|Unlimited*|100|3.0|

*Unlimited range usually requires special conditions or components

#### **E. Casting Time**

|Time|Point Cost|Multiplier|
|---|---|---|
|1 Action|0|1.0|
|1 Bonus Action|10|1.3|
|1 Reaction*|15|1.5|
|1 Minute|-5|0.8|
|10 Minutes|-10|0.6|
|1 Hour (Ritual)|-20|0.4|

*Reaction spells have specific triggers

#### **F. Additional Effects**

|Effect Type|Point Cost|Description|
|---|---|---|
|**Damage Over Time**|20|Deals damage each round for duration|
|**Condition: Minor**|15|-2 to rolls, disadvantage, etc.|
|**Condition: Major**|30|Stun, paralysis, charm, fear|
|**Condition: Save Ends**|+10|Add "save ends" to condition|
|**Healing**|×1.5|Convert damage to healing|
|**Summoning**|40 + CR×10|Summon creature of CR = SL/2|
|**Transformation**|50|Polymorph, invisibility, etc.|
|**Utility**|Variable|Teleport, creation, divination|
|**Ritual Only**|-30|Can only be cast as ritual|

#### **G. Saving Throws**

|Save Type|Point Cost|Effect|
|---|---|---|
|None|0|Auto-hit/effect|
|Half Damage|-10|Save for half damage|
|Negate|-20|Save to avoid completely|
|Partial Effect|-15|Save reduces/avoids secondary effects|

## **3. Mana Cost Calculation**

### **Base Mana Cost Formula**

text

BMC = (SPP / 5) × (1 + SL/20)

### **Final Mana Cost**

text

Mana Cost = BMC × (Range Multiplier) × (Duration Multiplier) × (Casting Time Multiplier) × (1 + Additional Effects Cost/100)

### **Mana Regeneration Rules**

- **Natural Regeneration:** 10% of max MP per hour of rest
    
- **Meditation:** 1% of max MP per minute (requires concentration)
    
- **Mana Potions:** Restore 25/50/100 MP based on quality
    
- **Arcane Recovery:** Once per day, regain MP equal to INT score × Class Level
    

## **4. Player Casting Mechanics**

### **Scaling with Caster Stats**

When a player casts a spell:

**For Damage Spells:**

text

Final Damage = Base Damage × (1 + (IM + SP)/K) + IS × √SL

Where:

- **IM** = Intelligence Modifier
    
- **SP** = Spell Proficiency (invested points)
    
- **K** = Scaling Constant (30 for balance)
    
- **IS** = Intelligence Score
    
- **SL** = Spell Level
    

**For Non-Damage Spells:**

text

Effect Potency = Base Potency × (1 + (IM + SP)/40) + (IS/10)

### **Proficiency System**

- Players gain **1 Spell Proficiency Point** every 5 PC Levels (max 20)
    
- Can invest in:
    
    - **Specific Spell** (×2 effectiveness for that spell)
        
    - **Spell School** (×1.5 effectiveness for school)
        
    - **Element Type** (×1.25 effectiveness for element)
        
    - **Casting Method** (reduce mana cost by 10% per point)
        

## **5. Spell Design Examples**

### **Fireball (SL 3)**

- **SPP:** 51 points
    
- **Allocation:**
    
    - Base Damage: 25 points → `CEL^0.9 × 8d6` (8d6 scaling with CEL^0.9)
        
    - AoE: 25 points → 20ft radius burst
        
    - Range: 5 points → 60ft (Medium)
        
    - Casting: 0 points → 1 Action
        
    - Save: -10 points → Half damage on successful DEX save
        
- **BMC:** (51/5) × (1 + 3/20) = 10.2 × 1.15 = 11.73
    
- **Mana Cost:** 11.73 × 1.2 × 1.0 × 1.0 = 14
    

**At Class Level 5:**

- Base: `5^0.9 × 8d6` = 4.26 × 8×3.5 = 119.28 average
    
- With IM=4, SP=5, IS=18: `119.28 × (1 + 9/30) + 18×√3` = 119.28×1.3 + 31.18 = 155.06 + 31.18 = 186.24
    

### **Wish (SL 20)**

- **SPP:** 847 points
    
- **Allocation:**
    
    - Effect: 500 points → Reality alteration within limits
        
    - Range: 100 points → Unlimited (with conditions)
        
    - Casting: 0 points → 1 Action
        
    - Special: 247 points → Can duplicate any spell of SL 15 or lower
        
- **BMC:** (847/5) × (1 + 20/20) = 169.4 × 2 = 338.8
    
- **Mana Cost:** 338.8 × 3.0 × 1.0 × 1.0 = 1016 (requires multiple turns/ritual components)
    

## **6. Balancing Against Martial Classes**

### **Damage Comparison Table**

|Class Level|Martial Avg DPR|Spell Avg DPR (SL = CL)|Ratio|Notes|
|---|---|---|---|---|
|1|15-25|10-20|0.8|Cantrips/level 1 spells|
|5|40-60|50-75|1.25|Fireball equivalent|
|10|80-120|100-150|1.25|Balanced tier|
|15|150-220|200-300|1.33|Spells pulling ahead|
|20|250-350|400-600|1.6|High-level magic dominance|

### **Mitigating Factors:**

1. **Resource Expenditure:** Spells cost mana, martial attacks don't
    
2. **Limited Slots:** High-level spells limited by mana pool
    
3. **Concentration:** Many powerful spells require concentration
    
4. **Counterspells/Dispels:** Magic can be countered
    
5. **Magic Resistance:** Many creatures have resistance/immunity
    

## **7. Spell Acquisition & Progression**

### **Learning Spells**

- **Spells Known:** INT modifier + Class Level × 2
    
- **Spell Preparation:** Can prepare (INT modifier + Class Level) spells per day
    
- **Spell Research:** Can create new spells with time/resources
    
    - Research Time: 1 week × SL
        
    - Cost: 1000 gp × SL
        
    - Requires: Appropriate ingredients, laboratory/library
        

### **Spellbooks & Grimoires**

- Wizards use spellbooks (50 pages per SL of spells)
    
- Other casters use thematic focuses (holy symbols, instruments, etc.)
    
- Losing spellbook requires re-learning or copying from backup
    

## **8. Specialized Casting Rules**

### **Ritual Casting**

- ×10 casting time
    
- No mana cost
    
- Requires ritual components
    
- Limited to spells with "Ritual" tag
    

### **Counterspelling**

- Reaction to interrupt casting
    
- Opposed check: Caster's (IM + SP) vs. Countercaster's (IM + SP)
    
- Success: Spell fails, mana is lost
    
- Failure: Spell proceeds, countercaster loses reaction
    

### **Spell Combinations**

- Multiple casters can combine spells for enhanced effects
    
- Requires coordinated casting (same initiative count)
    
- Combined mana cost ×1.5, but effects stack/multiply
    

## **9. Environmental & Material Factors**

### **Material Components**

- **Consumed:** Spell consumes component
    
- **Focus:** Component focuses energy, not consumed
    
- **Priceless:** Unique components for high-level spells
    

### **Environmental Modifiers**

|Environment|Effect on Casting|
|---|---|
|Anti-magic Field|Cannot cast|
|High Magic Area|-20% mana cost|
|Magic Dead Zone|+50% mana cost|
|During Storm (lightning)|+50% damage for lightning spells|
|Near Volcano (fire)|+50% damage for fire spells|

## **10. Epic Level Spellcasting (Beyond Level 20)**

### **Mythic Spells (SL 21-25)**

- Require multiple casters (min 2-5)
    
- Require rare components (dragon heart, phoenix feather, etc.)
    
- Casting time: 1 hour to 1 day
    
- Effects: Alter geography, create pocket dimensions, resurrect without penalty
    

### **Divine Intervention**

- Cleric/Paladin exclusive
    
- Chance = Class Level %
    
- Effect determined by deity
    
- Once per week limit
    

---

## **Summary of Key Design Principles**

1. **Exponential Scaling:** Spells grow in power faster than linear but with exponentially increasing costs
    
2. **Point-Buy Flexibility:** GMs can design any spell within point budget
    
3. **Player Customization:** Proficiency system allows specialization
    
4. **Resource Management:** Mana costs create meaningful decisions
    
5. **Balance Through Limitations:** Concentration, components, and counterspells balance power
    
6. **Progressive Unlocking:** Higher spell levels require higher class levels
    

**This system provides:**

- Clear mathematical foundation for spell design
    
- Balanced progression against martial classes
    
- Flexibility for creative spell design
    
- Meaningful player choices in specialization
    
- Scalability from cantrips to reality-altering magic