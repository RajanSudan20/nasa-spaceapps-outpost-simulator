# 7-Meter Logic & Resource Formulas

Is document mein base system ke 7 meters, unki depletion rates, aur player actions ke trade-offs defined hain.

---

## 1. Core Meters & Default Values

| Meter Name | Initial Value | Natural Depletion Rate (per Sol/Turn) | Critical Level |
| :--- | :---: | :---: | :---: |
| **Power (Energy)** | 100% | -5% (Base Grid Consumption) | < 20% |
| **Oxygen (O2)** | 100% | -10% (Without Generator) | < 25% |
| **Water (H2O)** | 100% | -8% (Crew + Crop Baseline) | < 20% |
| **Food** | 100% | -12% (Ration Usage) | < 15% |
| **Radiation Shielding** | 0% (OFF) | 0% (Manual Toggle) | N/A |
| **Cabin Pressure** | 100% | 0% (Drops only on breach) | < 50% |
| **Crew Health & Morale** | 100% | Calculated based on other meters | < 30% (Fail State) |

---

## 2. Dynamic Rules & Interdependencies

### A. Power Supply Dependencies
* **If Power > 20%:** Oxygen Generator and Water Recycler operate at 100% efficiency.
* **If Power <= 20%:** 
  * Oxygen depletion rate doubles (-20% per Sol).
  * Water recycling stops (Water depletion rate increases to -15% per Sol).

### B. Radiation Shielding Trade-Off
* **Shield OFF (0%):** 
  * Power Consumption: Normal (-5% per Sol).
  * Radiation Hazard (DONKI Event): Crew Health drops by -25% per Sol during a solar flare.
* **Shield ON (100%):** 
  * Power Consumption: High (-25% per Sol).
  * Radiation Hazard: Crew Health is protected (0% damage).

### C. Cabin Pressure & Hull Integrity
* **Normal Seal (100% Pressure):** No effect on Oxygen.
* **Micrometeorite Leak (Pressure < 100%):** 
  * Oxygen leaks at -30% per Sol.
  * Fixing leak costs 15% Power + 1 Sol turn.

---

## 3. Crew Health & Morale Formula

Crew Health har Sol ke end mein is formula par evaluate hoti hai:

$$\text{Health Change} = \text{Base Status} - \text{Penalty (Oxygen)} - \text{Penalty (Food/Water)} - \text{Penalty (Radiation)}$$

* **Oxygen Penalty:** If $O_2 < 25\%$, Health drops $-15\%$ per turn.
* **Food/Water Penalty:** If Food or Water $< 20\%$, Health drops $-10\%$ per turn.
* **Pressure Penalty:** If Cabin Pressure $< 50\%$, Health drops $-20\%$ per turn.
* **Recovery:** If all meters $> 60\%$, Health restores $+5\%$ per turn (Max 100%).

---

## 4. NASA Open Data Triggers

* **DONKI Integration:** High Radiation alerts trigger mandatory Shielding trade-off decisions.
* **OSDR Integration:** Low Health states display real astronaut biological study tooltips explaining microgravity & stress impacts.
