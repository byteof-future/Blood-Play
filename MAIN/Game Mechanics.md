# Game Mechanics

## Combat Sequence & Armor

In RENDITION, combat and damage calculation follow a precise sequence. Your **Resistance Number (RN)** is a combined defensive stat that takes both your innate toughness and your physical armor into account.

### 1. Calculate Damage (DMGA)
- **Physical Attack:** `DMGA = (SM × (dX + P)) + SS`
- **Spell Attack:** `DMGA = (IM × (dX + P)) + IS`
*(SM = Strength Modifier, P = Proficiency, SS = Strength Score, IM = INT Modifier, IS = INT Score)*

### 2. Check Combined RN and Armor Health (AHP)
Your total Resistance Number is calculated by combining your Resistance Score and your Armor Class (AC):
**`RN = (RES × 5) + (AC × 5)`**

Armor Health Points (AHP) are optional but recommended for deep mechanical play. When you are hit by an attack, follow this logic:

- **AHP ALWAYS takes the full DMGA.** (Your armor degrades as it takes hits).
- **If DMGA > RN (RN is Breached):**
  - The attack has pierced your defenses.
  - Calculate **Penetrating Damage** = `DMGA - RN`.
  - Your Ward Health (WHP) takes damage equal to your `RN` **PLUS** 50% of the Penetrating Damage.
  - Your Core Health (CHP) takes the remaining 50% of the Penetrating Damage.
- **If DMGA ≤ RN (RN is NOT Breached):**
  - The attack failed to pierce your core defenses.
  - Your Ward Health (WHP) takes the full `DMGA` (it tires you out, but doesn't wound you mortally).
  - Your Core Health (CHP) takes 0 damage.

---

## Tempo and Initiative (Moved to `Stealth.md`)
Initiative and ambush mechanics are handled via the **Tempo** system. See `Stealth.md` for the full breakdown of Surprise Rounds and Tempo actions.
