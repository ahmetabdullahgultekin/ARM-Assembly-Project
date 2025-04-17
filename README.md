# ARM Cortex‑M4 Assembly Mini‑Projects

This repository contains three self‑contained assembly programs targeting the **STM32L476RG** Nucleo board.  Each project is organised as a Keil µVision 5 workspace and demonstrates fundamental ARM Cortex‑M4 concepts—from integer arithmetic to memory manipulation and bitwise DSP‑style reductions.

| Folder | Theme | Highlights |
|--------|-------|------------|
| `P1/Q1` | **Arithmetic series** | Builds the concatenated integer `123…n` and multiplies it by *n* (e.g. *n = 4 → 1234 × 4 = 4936*). Demonstrates loops, barrel shifter (`LSL`), multiply‑accumulate (`MLA`) and register usage. |
| `P1/Q2` | **Matrix manipulation** | Copies a 10 × 10 integer matrix and swaps two selected columns in‑place. Exercises indexed addressing, nested loops and separate source/​destination pointers. |
| `P1/Q3` | **Bit‑population analysis** | Iterates over a word array, counts set bits per weight (`2^k`) and computes mode histograms—useful for simple DSP / parity checks. Shows conditional execution and accumulator patterns. |

---

## 🏗 Directory Layout

```
ARM-Assembly-Project/
├── P1/
│   ├── Q1/
│   │   ├── main_basic.s             # Source
│   │   ├── Q1.uvprojx / .uvoptx     # Keil project
│   │   └── Listings/Objects/…       # Build artefacts
│   ├── Q2/
│   └── Q3/
└── Shared Files/                    # Core and device constant headers
```

* **`core_cm4_constants.s`** – CMSIS register & flag definitions
* **`stm32l476xx_constants.s`** – Peripheral addresses for GPIO, RCC, etc.

---

## 🔧 Toolchain

| Tool | Version | Notes |
|------|---------|-------|
| **Keil MDK‑Arm** | 5.38 or newer | Free license covers STM32 Nucleo boards |
| **ST‑Link Utility / CubeProgrammer** | ≥ 2.15 | Flashing the `.axf` or `.hex` |
| **GNU Arm Embedded (optional)** | 13‑2023q4 | Build via `make` if you prefer gcc’s `as` |

### Building with Keil
1. Open `P1/QN/QN.uvprojx` *(N = 1,2,3)*.
2. Click **Build** (F7).  The resulting binary is placed in `Objects/QN.axf`.
3. **Flash** to the board via **Flash → Download** or the *ST‑Link* icon.

### Building with GNU make
A minimal `Makefile` template is provided:
```bash
cd P1/Q1
make                # produces build/q1.elf & q1.hex
make flash          # uses st-flash
```
Edit `PORT` / `OPENOCD_CFG` variables as needed.

---

## 📝 Program Inputs
Some projects read constants from the source:
```asm
        MOV     r3, #4      ; n  (Q1 – highest digit)
        MOV     r6, #6      ; first column to swap (Q2)
        MOV     r7, #9      ; second column to swap (Q2)
```
Change these literals and re‑assemble to test different scenarios.

---

## ⚙️ Debugging Tips
* Use **µVision’s Logic Analyzer** to watch key registers `r0–r7` in real time.
* Set breakpoints on the `B loop` labels to inspect loop progression.
* The **Disassembly** window maps each `asm` line to the hex op‑codes.
* For GNU users, `arm-none-eabi-gdb -tui build/q1.elf` + `mon reset halt`.

---

## 📚 References
* *Embedded Systems with ARM Cortex‑M Microcontrollers in Assembly & C* – Yifeng Zhu
* ARMv7‑M Architecture Reference Manual
* STM32L4 Reference Manual (RM0351)


