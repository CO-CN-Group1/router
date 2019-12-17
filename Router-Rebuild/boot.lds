SECTIONS {
    . = 0xbfc00000;
    .text 0xbfc00000 : {
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