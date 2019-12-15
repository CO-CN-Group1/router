# Software for TrivialMIPS

## Structure

The project contains source code that runs on board and tools/scripts that can be used to convert the source code to proper format:

* `bootrom` folder contains programs that will be pre-initialized in bootrom, whose entry point is `0xBFC00000`. The output will be a `filename.coe` file, which can be used in the customization of Block RAM IP.
* `ram` folder contains programs that are intened to be written to SRAM, whose entry point is `0x80000000`. By design, the final output of a program are two files: `filename.base.bin` and `filename.ext.bin`. You should write it to two slies of SRAM respectively by offset 0. The output of `bootrom/boot_from_mem.s` should be used in bootrom in order to jump to the entry point of SRAM.
* `func_test` contains functional tests from Loongson
* `perf_test` contains performance tests from Loongson

## Endianness

> Endianness __MATTERS__! --Harry

The CPU itself is little-endian, that is, the most significant byte is the one with the highest address. As for initialization files, `coe` and `mem` files put MSB on the leftmost side, so `0x12345678` will still be `12345678` in these files. For little-endian binary memory files, it will be `0x78 0x56 0x34 0x12`, and `xxd` will show it as `78563412`. The compiler and linker should be set in Big Endian mode (`-EL`) when compiling from assembly or C/C++ code.

The converter from `bin` to `mem` we use does the following work on each line of the given file:

* read 4 bytes (`0x78 0x56 0x34 0x12`)
* write it out in reverse sequence (`12345678`)