
# LVDS Deserializer Vivado Project

This project implements a 12-bit deserializer using Xilinx ISERDESE2 primitive. It is designed to receive LVDS serial data and convert it back into 12-bit parallel data.

## 📁 Structure

- `src/`: Contains the HDL for the deserializer.
- `sim/`: Testbench to verify deserialization logic.
- `constraints/`: XDC constraints for LVDS pin and clocks.
- `README.md`: This file.

## 🛠 How to Run

1. Open Vivado (2022.2 or newer)
2. Create a new project and add:
   - All files from `src/` and `sim/`
   - Constraints from `constraints/lvds_deserializer.xdc`
3. Set `top` as top module
4. Run behavioral simulation

## 📌 Function

- `deserializer_12bit.v`: Cascades two ISERDESE2 blocks (8 + 4 bit) to recover 12-bit parallel data.
- `top.v`: Buffers differential input using IBUFDS, instantiates deserializer.
- `tb_top.v`: Stimulates the input with a 12-bit pattern looped at high speed.
