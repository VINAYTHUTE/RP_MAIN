# 🔄 LVDS Serializer & Deserializer – Vivado Projects

This repository contains **modular and simulation-ready** Vivado 2022.2 projects that implement a complete **12-bit LVDS communication system** using Xilinx UltraScale+/7-Series FPGAs.

✅ The system includes:

- **LVDS Serializer** (`lvds_serializer_vivado/`)  
- **LVDS Deserializer** (`lvds_deserializer_vivado/`)  
- ✅ Fully testable in simulation  
- ✅ Synthesizable and ready for real hardware

---

## 🔧 What It Does

- **Serializer**: Accepts 12-bit parallel input at 50 kHz and serializes it at 200 Mbps using `OSERDESE2` or `OSERDESE3`, transmitting over LVDS.
- **Deserializer**: Receives that LVDS serial stream and reconstructs the original 12-bit word using cascaded `ISERDESE2` primitives.

---

## 🗂️ Repository Structure

```plaintext
RP_MAIN/
├── lvds_serializer_vivado/     # 12-bit to serial LVDS output
├── lvds_deserializer_vivado/   # LVDS input to 12-bit parallel output
└── README.md                   # This file
