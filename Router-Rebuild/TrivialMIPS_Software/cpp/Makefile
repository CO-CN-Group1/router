SRCS=$(wildcard *.cpp)
HEADERS=$(wildcard include/*.cpp)

export CROSS_COMPILE ?= mipsel-linux-gnu-

CC=${CROSS_COMPILE}gcc
CXX=${CROSS_COMPILE}g++
LD=${CROSS_COMPILE}ld
AR=${CROSS_COMPILE}ar
OBJCOPY=${CROSS_COMPILE}objcopy
OBJDUMP=${CROSS_COMPILE}objdump

COES=$(SRCS:.cpp=.coe)
ASM=$(SRCS:.cpp=.s) 
BASES=$(SRCS:.cpp=.base.bin)
EXTS=$(SRCS:.cpp=.ext.bin)
EXTS=$(SRCS:.cpp=.s)

COMP_FLGAS=-msingle-float -nostdinc -nostdlib -ffunction-sections -fdata-sections -ffreestanding -Wall -mxgot -fno-builtin -fno-PIC -fno-PIE -mno-abicalls -g -EL -mhard-float -mips32 -Os -I include -include common.h -include bootstrap.h
CXXFLAGS=$(COMP_FLGAS) -std=c++11
CFLAGS=$(COMP_FLGAS) -Wno-implicit-function-declaration

LDFLAGS=-static -EL -nostdlib --nmagic --gc-sections

LINKDER_DEFS=

export CC CXX AR CFLAGS CXXFLAGS

all: bootrom sram

.PHONY: main.o

bootrom: $(COES)

sram: $(BASES)  #$(EXTS)

%.coe: %.bootrom.bin convert_bin
	mkdir -p bootrom
	./convert_bin $< bootrom/$@

%.base.bin: %.ram.bin split_bin
	./split_bin $< ram/$(basename $(basename $<)).ext.bin ram/$(basename $(basename $<)).base.bin

convert_bin: ../utility/convert_bin.c
	gcc -Wall -O2 -o $@ $<

split_bin: ../utility/split_bin.cpp
	g++ -Wall -Werror -o $@ $<

%.bootrom.bin: %.bootrom.elf
	$(OBJCOPY) -O binary -j .text $< $@

%.ram.bin: %.ram.elf
	$(OBJCOPY) -O binary -j .text -j .data $< $@

%.bootrom.elf: linker.bootrom.ld %.o startup.bootrom.o main.o lib/libtinyc.a
	mkdir -p bootrom
	$(LD) $(LDFLAGS) -T $< -o $@ $(filter-out $<,$^)
	$(OBJDUMP) -alDS $@ > bootrom/$(basename $(basename $@)).s

%.ram.elf: linker.ram.ld %.o startup.ram.o main.o lib/libtinyc.a
	mkdir -p ram
	$(LD) $(LDFLAGS) -T $< -o $@ $(filter-out $<,$^)
	$(OBJDUMP) -alDS $@ > ram/$(basename $(basename $@)).s

linker.bootrom.ld: utility/linker.ld.S $(HEADERS)
	$(CC) -E -P -DCODE_INTO_BOOTROM $(LINKDER_DEFS) $(CFLAGS) $< -o $@

linker.ram.ld: utility/linker.ld.S $(HEADERS)
	$(CC) -E -P $(LINKDER_DEFS) $(CFLAGS) $< -o $@

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

main.o: utility/main.c
	$(CC) $(CFLAGS) -c -o $@ $<

startup.ram.o: utility/startup.S
	$(CC) $(CFLAGS) -c -o $@ $<

startup.bootrom.o: utility/startup.S
	$(CC) $(CFLAGS) -DCODE_INTO_BOOTROM -c -o $@ $<

lib/libtinyc.a:
	make -C lib libtinyc.a

clean:
	rm -rf ram/ bootrom/ *.ld *.o split_bin convert_bin
	make -C lib clean
