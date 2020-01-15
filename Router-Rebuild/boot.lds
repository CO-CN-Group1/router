
SECTIONS {
    . = 0x80000000;
    .text 0x80000000 : {
        *(.text.init)
        *(.text)
    }
    .rodata : {
        *(.rodata)
    }
    .data : {
        *(.data)
    }
}