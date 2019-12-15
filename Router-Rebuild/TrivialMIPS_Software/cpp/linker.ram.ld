ENTRY(_start);
MEMORY
{
    BOOTROM (rx) : ORIGIN = 0xBFC00000, LENGTH = 128K
    OCM (rwx) : ORIGIN = 0x88000000, LENGTH = 64K
    RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 128M
}
SECTIONS
{
    . = ORIGIN(OCM);
    _mem_start = ORIGIN(RAM);
    _mem_end = ORIGIN(RAM) + LENGTH(RAM);
    _mem_avail_start = _stack;
    _mem_avail_end = ORIGIN(RAM) + LENGTH(RAM);
    .text :
    {
        _text = .;
        *(.text.startup)
        *(.text*)
        *(.rodata*)
        *(.reginfo)
        *(.init)
        *(.stub)
        *(.gnu.warning)
        *(.MIPS.abiflags)
        _text_end = .;
    } > OCM
    .data :
    {
        _data = .;
        _stack = _data + LENGTH(RAM) - 32;
        *(.data)
        *(.data*)
        *(.eh_frame)
        _gp = ALIGN(16);
        *(.got.plt) *(.got)
        *(.sdata)
        *(.lit8)
        *(.lit4)
        _data_end = .;
    } > RAM
    .sbss :
    {
        *(.sbss)
        *(.scommon)
    } > RAM
    .bss :
    {
        _bss = .;
        *(.dynbss)
        *(.bss*)
        *(COMMON)
        _bss_end = .;
    } > RAM
    /DISCARD/ :
    {
        *(.note*);
        *(.iplt*);
        *(.igot*);
        *(.rel*);
        *(.comment);
    }
}
