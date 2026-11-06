# Lab 3 — Execute Stage
<!--
Replace every item in square brackets before submitting.
Keep this README focused on what the design does, how it is used, and how it was
verified.
-->
## Design Scope and Assumptions
- **In scope:** This lab implements an instruction execute in verilog.
- **Out of scope:** Fetch, Decode, Memory Access, Writeback
- **Assumptions:** All unconnected wires will route to other pipeline states in the future.
- **Limitations:** Limited to 32 bit bus
## Requirements
| Requirement | Description | Verification Method |
|---|---|---|
| Adder |  | Test case, waveform, inspection |
| Top Mux | Adds the sign extend output with the NPC output | Test case, waveform, inspection |
| ALU | Performs arithmetic operations | Test case, waveform, inspection |
| ALU Control | Sends commands to the ALU | Test case, waveform, inspection |
| Bottom Mux | Decides whether the sign extend or Read Data 2 gets passed to the ALU | Test case, waveform, inspection |
| EX/MEM Latch | Holds and passes data on to the next pipeline stage | Test case, waveform, inspection |
| Execute | Ties all 6 minor modules together into overall instruction execute | Test case, waveform, inspection |

## Implementation
### Source Code
| File | Description |
|---|---|
| [`adder.v`](LINK_TO_IMPLEMENTATION_CODE) | Source code for adder module] |
| [`top_mux.v`](LINK_TO_COMPONENT_CODE) | Source code for top mux module |
| [`bottom_mux.v`](LINK_TO_TESTBENCH_CODE) | Source code for bottom mux module |
| [`alu_control.v`](LINK_TO_IMPLEMENTATION_CODE) | Source code for alu control module |
| [`alu.v`](LINK_TO_IMPLEMENTATION_CODE) | Source code for alu module |
| [`EXMEM_Latch.v`](LINK_TO_IMPLEMENTATION_CODE) | Source code for EX/MEM latch module |
| [`Execute.v`](LINK_TO_IMPLEMENTATION_CODE) | Source code for execute module |
### Implementation Notes
- ALU ops include subtract, and, or, and slt operations.
- Execute, ALU, Adder are reusable
- Modules wired to other pipeline stages left disconnected
## Verification
### Verification Strategy
The design is verified using **[simulation, formal checks, hardware testing, or
another method]**.
Verification covers:
- [Normal operating case]
- [Boundary or maximum-value case]
- [Reset or initialization case]
- [Invalid, stalled, or exceptional case, if applicable]
### Testbench and Waveform
Save screenshots and waveform images in the repository's `images/` folder.
![Testbench or waveform](images/[testbench-screenshot-filename].png)
The testbench source is available [*here*](LINK_TO_TESTBENCH_CODE).
### Results
| Test Case | Expected Result | Observed Result | Status |
|---|---|---|---|
| TC-01 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-02 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-03 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
## Reproduction Instructions
### Tools and Versions
- **Simulator / synthesis tool:** [Name and version]
- **Language / standard:** [Verilog/SystemVerilog version]
- **Operating system:** [macOS, Windows, Linux, or other]
- **Additional dependencies:** [List any required tools or libraries]
### Build and Run
```bash
# Replace these commands with the commands required for this lab.
[compile-command]
[run-command]
```
Expected output:
```text
[Paste a short representative output or result here.]
```
## Repository Organization
```text
.
├── README.md
├── images/
│ ├── [timing-diagram-filename].png
│ └── [testbench-screenshot-filename].png
├── [source-files]
└── [testbench-files]
```
## Known Issues and Future Improvements
- [Document any known issue, unverified behavior, or technical debt.]
- [Describe a realistic improvement or extension.]
