    .org 0x0
    .section .text.init
    .global __start
    .set noat
    .set noreorder
    .abicalls
__start:
    li $sp, 0x88000000
    bal main
    nop

boot:
    li $s5, 0x80000000
    jr $s5
    nop

    .org 0x380

end:
    j end
    nop