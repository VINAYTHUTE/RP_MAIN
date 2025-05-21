# RP_MAIN
LVDS Serializer project
---

# LVDS Serializer Project

This project implements a 12-bit parallel-to-serial converter using Xilinx's `OSERDESE2` primitive, facilitating high-speed data transmission over Low-Voltage Differential Signaling (LVDS) lines.

## 📁 Repository Structure

```

lvds_serializer_vivado/
├── src/                  # Verilog source files
│   ├── serializer_12bit.v
│   └── top.v
├── sim/                  # Simulation testbenches
│   └── tb_top.v
├── constraints/          # Xilinx constraint files
│   └── lvds_serializer.xdc
├── lvds_serializer_vivado/  # Vivado project directory
│   ├── lvds_serializer_vivado.xpr
│   └── ... (auto-generated files)
└── README.md             # Project documentation:contentReference[oaicite:6]{index=6}
```

## 🔧 Getting Started

### Prerequisites

* Xilinx Vivado Design Suite (version 2022.2 or later)
* Target FPGA board supporting LVDS I/O standards

### Setup Instructions

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/VINAYTHUTE/RP_MAIN.git
   cd RP_MAIN/lvds_serializer_vivado
   ```



2. **Open the Project in Vivado:**

   * Launch Vivado.
   * Navigate to `File` > `Open Project`.
   * Select `lvds_serializer_vivado.xpr` located in the `lvds_serializer_vivado` directory.

3. **Build the Project:**

   * Run synthesis and implementation.
   * Generate the bitstream.

4. **Simulate the Design:**

   * Open the simulation set `sim_1`.
   * Run behavioral simulation to verify functionality.

## 🧠 Project Overview

### Serializer Module (`serializer_12bit.v`)

This module accepts 12-bit parallel data and serializes it using the `OSERDESE2` primitive. Key features include:

* **Data Input:** 12-bit parallel input (`data_in[11:0]`).
* **Clocking:** Utilizes high-speed and divided clocks (`clk`, `clk_div`).
* **LVDS Output:** Differential outputs (`lvds_p`, `lvds_n`) for transmission.

### Top-Level Module (`top.v`)

Integrates the serializer module with clock management and control logic. Responsibilities include:

* **Clock Generation:** Manages clock signals required for serialization.
* **Data Handling:** Interfaces with data sources and passes data to the serializer.
* **Control Signals:** Handles reset and enable signals.

## 🧪 Simulation

The testbench `tb_top.v` provides stimulus to the top-level module, verifying the serialization process. It includes:

* **Clock Generation:** Simulates necessary clock signals.
* **Data Stimulus:** Applies test vectors to `data_in`.
* **Output Monitoring:** Observes `lvds_p` and `lvds_n` for correct serialized output.

## 📌 Constraints

The `lvds_serializer.xdc` file defines:([wired.com][1])

* **Pin Assignments:** Maps logical signals to physical FPGA pins.
* **I/O Standards:** Specifies LVDS standards for differential pairs.
* **Timing Constraints:** Ensures setup and hold times are met.

## 🚀 Future Work

* **Deserializer Module:** Develop a complementary deserializer using `ISERDESE2` to receive and convert serial LVDS data back to parallel form.
* **Error Checking:** Implement error detection and correction mechanisms.
* **Parameterization:** Enhance modules to support variable data widths and serialization factors.
