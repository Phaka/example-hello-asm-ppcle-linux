# Hello World in PowerPC Little-Endian Assembly (Linux)

A simple Hello World implementation in 32-bit PowerPC Little-Endian assembly language for Linux systems. This implementation demonstrates the less common little-endian variant of the PowerPC architecture, which was developed to improve compatibility with little-endian systems.

## Installation

On a PowerPC Linux system, you'll need the standard GNU toolchain:

```bash
sudo apt-get update
sudo apt-get install binutils gcc
```

## Running

Assemble and link:
```bash
as -o main.o main.s -mlittle -32
ld -o hello main.o -EL
./hello
```

## Code Explanation

The 32-bit PowerPC Little-Endian implementation appears very similar to its big-endian counterpart in source form, but produces different binary output due to the endianness change. The architectural features remain the same, but the byte ordering is reversed.

Key differences from big-endian PPC:

Memory Organization:
- Uses little-endian byte ordering (least significant byte first)
- Multi-byte values are stored in reverse order compared to big-endian
- Instruction encoding is also little-endian
- String data remains in natural byte order

Build Process:
- Requires -mlittle flag for assembly
- Requires -EL flag for linking
- Produces little-endian ELF binary

Register Usage (unchanged):
- Register 0: System call number
- Register 3: First argument (file descriptor or return code)
- Register 4: Second argument (message address)
- Register 5: Third argument (message length)

Instructions (unchanged):
- li (Load Immediate): Loads a 16-bit value
- lis (Load Immediate Shifted): Loads a 16-bit value into the upper half
- la (Load Address): Combines base and displacement
- sc (System Call): Triggers kernel service

While the assembly code looks identical to the big-endian version, the resulting binary and memory layout are different:
- Multi-byte loads and stores handle endianness automatically
- The toolchain handles instruction encoding differently
- Memory access patterns may affect performance differently
- Alignment requirements remain the same but byte ordering differs within aligned units
