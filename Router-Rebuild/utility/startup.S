	.globl 		_start
	.section	.text.startup
	.set        noreorder

.org 0x0
_start:
	# write the segment to indicate boot progress
    li      $s2, 0xbff0f010
    li      $t3, 0x00000001
    sw      $t3, 0($s2)

#ifndef CODE_INTO_BOOTROM
	# setup exception handler
	# la		$t1, _text
    mtc0    $zero, $15, 1 # set c0_ebase to 0
    mtc0    $zero, $12 # use ebase and disable interrupts
#endif

	# progress: 2
	li      $t3, 0x00000002
    sw      $t3, 0($s2)

	# setup stack pointer
    la 		$sp, _stack
    la		$gp, _gp

	# progress: 3
	li      $t3, 0x00000003
    sw      $t3, 0($s2)

	# jump to our code
    jal 	_main
    nop

_loop:
    li      $t3, 0x00000000
_loop_body:
	li		$s1, 0xbff0e000   # $s1 = 0xbfd0e0000 (100 MHz Clock)
	lw		$t1, 0($s1)       # $t1 = time
	li      $t2, 0x02faf080    # $t2 = 0x02faf080 (50000000)
	add     $t0, $t1, $t2     # $t0 = $t1 + 0.5s

_wait:
    lw      $t1, 0($s1)
    beq     $t0, $t1, _switch_led_status
    nop
    b       _wait
    nop

_switch_led_status:
    li      $s2, 0xbff0f010      # write 0xbfd0f010 (numbers)
    nor     $t3, $t3, $t3    # $t3 = ~$t3
    sw      $t3, 0($s2)
    b       _loop_body
    nop


#ifdef CODE_INTO_BOOTROM
.org 0x180
_cpu_assertion:
    li  $k0, 0x1
    j   _exception_entry
#endif


#ifdef CODE_INTO_BOOTROM
.org 0x380
#else
.org 0x180
#endif

_exception:
    li    $k0, 0x0
_exception_entry:
    move  $k1, $s0                  # save old sp
    la    $sp, _exception_stack_top # switch to exception stack
	addiu $sp, $sp, -200

	# save general registers
	sw $ra, 160($sp)
	sw $fp, 156($sp)
	sw $k1, 152($sp)  # k1 = old sp
	sw $gp, 148($sp)
	sw $k1, 144($sp)  # real k1 is damaged
	sw $k0, 140($sp)  # real k0 is damaged
	sw $t9, 136($sp)
	sw $t8, 132($sp)
	sw $s7, 128($sp)
	sw $s6, 124($sp)
	sw $s5, 120($sp)
	sw $s4, 116($sp)
	sw $s3, 112($sp)
	sw $s2, 108($sp)
	sw $s1, 104($sp)
	sw $s0, 100($sp)
	sw $t7,  96($sp)
	sw $t6,  92($sp)
	sw $t5,  88($sp)
	sw $t4,  84($sp)
	sw $t3,  80($sp)
	sw $t2,  76($sp)
	sw $t1,  72($sp)
	sw $t0,  68($sp)
	sw $a3,  64($sp)
	sw $a2,  60($sp)
	sw $a1,  56($sp)
	sw $a0,  52($sp)
	sw $v1,  48($sp)
	sw $v0,  44($sp)
	sw $at,  40($sp)
    # save cp0
    mfc0 $t1, $15, 1    # EBase
    sw   $t1, 32($sp)
    mfc0 $t1, $8,  0    # BadVAddr
    sw   $t1, 28($sp)
    mfc0 $t1, $12, 0    # Status
    sw   $t1, 24($sp)
    mfc0 $t1, $13, 0    # Cause
    sw   $t1, 20($sp)
    mfc0 $t1, $14, 0    # EPC
    sw   $t1, 16($sp)

    move $a0, $sp
    move $a1, $k0

    jal _exception_handler
    nop
    j _loop
    nop


    .section .bss.exception
    .align 12
_exception_stack:
    .space 1024 * 4 # 4KB for exception stack
_exception_stack_top:
