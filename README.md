# 6-bit ALU Design Using VHDL

A modular 6-bit Arithmetic Logic Unit (ALU) implemented in VHDL and deployed on a Basys 3 FPGA development board.

## Overview

This project demonstrates the design, implementation, simulation, and hardware verification of a 6-bit Arithmetic Logic Unit (ALU) using VHDL.

The ALU supports six arithmetic and logical operations, including addition, subtraction, AND, OR, XOR, and NOR. Its architecture consists of independent functional modules integrated through operation-selection logic.

The design was synthesised using Xilinx Vivado and deployed on a Basys 3 development board featuring an Artix-7 FPGA.


## Project Demonstration

A complete walkthrough of the ALU architecture,
VHDL implementation, simulation, and Basys 3
hardware demonstration.

[Watch / Download Project Demo](https://github.com/ZhengyanXu-666/6-bit-ALU-Design-Using-VHDL-on-Basys-3-FPGA/releases/download/v1.0.0/ALU_Introduction_Simulation_and_Hardware_Test.mp4)


## Key Features

- Modular VHDL-based hardware architecture
- 6-bit arithmetic and logic operations
- Ripple Carry Adder implementation
- Two's complement subtraction
- Structural digital logic design
- Boolean logic-based operation selection
- Carry, overflow, and zero flag generation
- Functional simulation and waveform analysis
- FPGA synthesis and physical hardware verification

## Supported Operations

The ALU uses a 3-bit operation selector (`ALUOP`) to determine the required operation.

| ALUOP | Operation | Function |
|:---:|:---:|---|
| `000` | ADD | A + B |
| `010` | SUB | A - B |
| `100` | AND | Bitwise AND |
| `101` | OR | Bitwise OR |
| `110` | XOR | Bitwise XOR |
| `111` | NOR | Bitwise NOR |

## System Architecture

The design follows a modular architecture in which individual functional components operate independently. Their outputs are combined through selection logic to generate the final ALU result.

### Functional Modules

| Module | Description |
|---|---|
| ADD6 | 6-bit Ripple Carry Adder |
| SUB6 | 6-bit Two's Complement Subtractor |
| AND6 | Bitwise AND |
| OR6 | Bitwise OR |
| XOR6 | Bitwise XOR |
| NOR6 | Bitwise NOR |

### Input and Output Interface

| Signal | Width | Description |
|---|---:|---|
| A | 6-bit | First operand |
| B | 6-bit | Second operand |
| ALUOP | 3-bit | Operation selector |
| RES | 6-bit | Operation result |
| ZERO | 1-bit | Zero-result indicator |
| COUT | 1-bit | Carry-out indicator |
| OFI | 1-bit | Overflow indicator |
| SIGN | 1-bit | Subtraction sign indicator |

## FPGA Implementation

**Development Platform:** Digilent Basys 3  
**FPGA Device:** Xilinx Artix-7 (XC7A35T)  
**Development Environment:** Xilinx Vivado Design Suite

The ALU was deployed on the physical FPGA board. Slide switches were used to configure the operands and operation selection, while LEDs displayed the resulting output and status flags.

### Hardware Interface Mapping

| FPGA Interface | Function |
|---|---|
| SW15–SW13 | ALU operation selection |
| SW12–SW7 | Operand A |
| SW6–SW1 | Operand B |
| LED0–LED5 | ALU result |
| LED6 | ZERO |
| LED7 | COUT |
| LED8 | OFI |

## Simulation and Verification

Functional verification was performed using Vivado Simulator, followed by physical testing on the Basys 3 FPGA board.

The verification process covered all six supported operations and included arithmetic and logical test cases.

Key verification activities:

- Arithmetic operation testing
- Bitwise logic operation testing
- Carry and overflow flag verification
- Zero-result detection
- Simulation waveform analysis
- Physical FPGA switch and LED verification

## FPGA Resource Utilisation

Post-synthesis resource utilisation reported by Vivado:

| Resource | Used | Available | Utilisation |
|---|---:|---:|---:|
| LUT | 39 | 20,800 | 0.19% |
| IO | 24 | 106 | 22.64% |

The reported LUT utilisation demonstrates a compact hardware implementation on the target FPGA.

## Technology Stack

| Category | Technology |
|---|---|
| Hardware Description Language | VHDL |
| FPGA Development | Xilinx Vivado |
| Simulation | Vivado Simulator |
| Hardware Platform | Digilent Basys 3 |
| FPGA Architecture | Xilinx Artix-7 |


## Repository Structure

```text
6-bit-ALU-Design-Using-VHDL-on-Basys-3-FPGA/
│
├── README.md
├── ALU.xpr
├── Report.pdf
├── test_alu.vhd
├── test_alu_behav.wcfg
│
└── ALU.srcs/
    ├── sources_1/
    │   └── new/
    │       ├── ALU.vhd
    │       ├── ADD6.vhd
    │       ├── SUB6.vhd
    │       ├── AND6.vhd
    │       ├── OR6.vhd
    │       ├── XOR6.vhd
    │       ├── NOR6.vhd
    │       ├── FA.vhd
    │       └── HA.vhd
    │
    ├── sim_1/
    │   └── new/
    │       ├── test_alu.vhd
    │       ├── tb_ADD6.vhd
    │       ├── tb_ALU.vhd
    │       ├── tb_AND6.vhd
    │       ├── tb_NOR6.vhd
    │       ├── tb_OR6.vhd
    │       ├── tb_SUB6.vhd
    │       └── tb_XOR6.vhd
    │
    ├── constrs_1/
    │   └── new/
    │       └── pin.xdc
    │
    └── utils_1/
        └── imports/
            └── synth_1/
                └── ALU.dcp
```

**Project Demo:** [Watch or download the video demonstration](https://github.com/ZhengyanXu-666/6-bit-ALU-Design-Using-VHDL-on-Basys-3-FPGA/releases/download/v1.0.0/ALU_Introduction_Simulation_and_Hardware_Test.mp4)  


## Documentation

The complete technical report is available in [Report.pdf](Report.pdf).

The report covers the system architecture, detailed module design, hardware configuration, simulation results, FPGA testing, timing analysis, and resource utilisation.
