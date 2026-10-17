# SystemVerilog UART Verification Environment

A clean, self-checking verification environment for a Universal Asynchronous Receiver-Transmitter (UART) serial protocol, implemented using SystemVerilog and verified using Synopsys VCS on EDA Playground.


## 🚀 Project Overview
This project demonstrates foundational **Chip Design Verification (DV)** concepts. While the RTL design handles the underlying protocol behavior, the primary focus of this repository is the **Verification Environment**—featuring modular interface encapsulation, stimulus generation, loopback connection, and an automated self-checking scoreboard.


## 🛠️ Architecture & File Structure
The environment is broken down into clean, modular components following industry standards:

* **`uart_if.sv`**: SystemVerilog Interface that bundles UART signals together to achieve clean transaction-level abstraction.
* **`uart_tx.sv`**: The UART Transmitter block (responsible for parallel-to-serial conversion, framing with start/stop bits, and baud rate generation).
* **`uart_rx.sv`**: The UART Receiver block (responsible for oversampling, serial-to-parallel conversion, and data reconstruction).
* **`uart.sv`**: The top-level design module instantiating both TX and RX sub-modules.
* **`testbench.sv`**: The testbench environment containing stimulus drivers, loopback wiring, and an automated scoreboard checker.


## 🔍 Key Verification Features
* **Interface-Based Design:** Utilized SystemVerilog `interface` constructs to connect the testbench and Design Under Test (DUT) cleanly.
* **Automated Self-Checking Scoreboard:** Programmatically captures transmitted and received data bytes, runs an automatic comparison, and logs verification status (`[SCOREBOARD] TEST PASSED`).
* **Protocol Observability:** Integrated a loopback mechanism (`assign rxif.sig = txif.sig;`) to validate end-to-end data integrity.


## 📊 Simulation Results & Waveforms
The simulation was compiled and run using **Synopsys VCS** with waveforms visualized via **EPWave**.

*<img width="1822" height="588" alt="Screenshot 2026-10-17 200230" src="https://github.com/user-attachments/assets/92f75078-435c-4cbd-828e-788f7966a88d" />
*

**Console Log Output:**
```text
[SCOREBOARD] SUCCESS: Data matched! Sent: 0xa5, Received: 0xa5
[SCOREBOARD] TEST PASSED SUCCESSFULLY!
