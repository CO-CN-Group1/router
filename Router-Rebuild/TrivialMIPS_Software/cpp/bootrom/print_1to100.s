
print_1to100.bootrom.elf:     file format elf32-tradlittlemips
print_1to100.bootrom.elf


Disassembly of section .text:

bfc00000 <_start>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:8
	.set        noreorder

.org 0x0
_start:
	# write the segment to indicate boot progress
    li      $s2, 0xbff0f010
bfc00000:	3c12bff0 	lui	s2,0xbff0
bfc00004:	3652f010 	ori	s2,s2,0xf010
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:9
    li      $t3, 0x00000001
bfc00008:	240b0001 	li	t3,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:10
    sw      $t3, 0($s2)
bfc0000c:	ae4b0000 	sw	t3,0(s2)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:20
    mtc0    $zero, $15, 1 # set c0_ebase to 0
    mtc0    $zero, $12 # use ebase and disable interrupts
#endif

	# progress: 2
	li      $t3, 0x00000002
bfc00010:	240b0002 	li	t3,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:21
    sw      $t3, 0($s2)
bfc00014:	ae4b0000 	sw	t3,0(s2)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:24

	# setup stack pointer
    la 		$sp, _stack
bfc00018:	3c1d8801 	lui	sp,0x8801
bfc0001c:	27bdffe0 	addiu	sp,sp,-32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:25
    la		$gp, _gp
bfc00020:	3c1c8800 	lui	gp,0x8800
bfc00024:	279c0000 	addiu	gp,gp,0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:28

	# progress: 3
	li      $t3, 0x00000003
bfc00028:	240b0003 	li	t3,3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:29
    sw      $t3, 0($s2)
bfc0002c:	ae4b0000 	sw	t3,0(s2)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:32

	# jump to our code
    jal 	_main
bfc00030:	0ff00151 	jal	bfc00544 <_main>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:33
    nop
bfc00034:	00000000 	nop

bfc00038 <_loop>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:36

_loop:
    li      $t3, 0x00000000
bfc00038:	240b0000 	li	t3,0

bfc0003c <_loop_body>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:38
_loop_body:
	li		$s1, 0xbff0e000   # $s1 = 0xbfd0e0000 (100 MHz Clock)
bfc0003c:	3c11bff0 	lui	s1,0xbff0
bfc00040:	3631e000 	ori	s1,s1,0xe000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:39
	lw		$t1, 0($s1)       # $t1 = time
bfc00044:	8e290000 	lw	t1,0(s1)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:40
	li      $t2, 0x02faf080    # $t2 = 0x02faf080 (50000000)
bfc00048:	3c0a02fa 	lui	t2,0x2fa
bfc0004c:	354af080 	ori	t2,t2,0xf080
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:41
	add     $t0, $t1, $t2     # $t0 = $t1 + 0.5s
bfc00050:	012a4020 	add	t0,t1,t2

bfc00054 <_wait>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:44

_wait:
    lw      $t1, 0($s1)
bfc00054:	8e290000 	lw	t1,0(s1)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:45
    beq     $t0, $t1, _switch_led_status
bfc00058:	11090003 	beq	t0,t1,bfc00068 <_switch_led_status>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:46
    nop
bfc0005c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:47
    b       _wait
bfc00060:	1000fffc 	b	bfc00054 <_wait>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:48
    nop
bfc00064:	00000000 	nop

bfc00068 <_switch_led_status>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:51

_switch_led_status:
    li      $s2, 0xbff0f010      # write 0xbfd0f010 (numbers)
bfc00068:	3c12bff0 	lui	s2,0xbff0
bfc0006c:	3652f010 	ori	s2,s2,0xf010
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:52
    nor     $t3, $t3, $t3    # $t3 = ~$t3
bfc00070:	016b5827 	nor	t3,t3,t3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:53
    sw      $t3, 0($s2)
bfc00074:	ae4b0000 	sw	t3,0(s2)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:54
    b       _loop_body
bfc00078:	1000fff0 	b	bfc0003c <_loop_body>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:55
    nop
bfc0007c:	00000000 	nop
	...

bfc00180 <_cpu_assertion>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:61


#ifdef CODE_INTO_BOOTROM
.org 0x180
_cpu_assertion:
    li  $k0, 0x1
bfc00180:	241a0001 	li	k0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:62
    j   _exception_entry
bfc00184:	0bf000e1 	j	bfc00384 <_exception_entry>
bfc00188:	00000000 	nop
	...

bfc00380 <_exception>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:73
#else
.org 0x180
#endif

_exception:
    li    $k0, 0x0
bfc00380:	241a0000 	li	k0,0

bfc00384 <_exception_entry>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:75
_exception_entry:
    move  $k1, $s0                  # save old sp
bfc00384:	0200d825 	move	k1,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:76
    la    $sp, _exception_stack_top # switch to exception stack
bfc00388:	3c1d8800 	lui	sp,0x8800
bfc0038c:	27bd1000 	addiu	sp,sp,4096
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:77
	addiu $sp, $sp, -200
bfc00390:	27bdff38 	addiu	sp,sp,-200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:80

	# save general registers
	sw $ra, 160($sp)
bfc00394:	afbf00a0 	sw	ra,160(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:81
	sw $fp, 156($sp)
bfc00398:	afbe009c 	sw	s8,156(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:82
	sw $k1, 152($sp)  # k1 = old sp
bfc0039c:	afbb0098 	sw	k1,152(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:83
	sw $gp, 148($sp)
bfc003a0:	afbc0094 	sw	gp,148(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:84
	sw $k1, 144($sp)  # real k1 is damaged
bfc003a4:	afbb0090 	sw	k1,144(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:85
	sw $k0, 140($sp)  # real k0 is damaged
bfc003a8:	afba008c 	sw	k0,140(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:86
	sw $t9, 136($sp)
bfc003ac:	afb90088 	sw	t9,136(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:87
	sw $t8, 132($sp)
bfc003b0:	afb80084 	sw	t8,132(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:88
	sw $s7, 128($sp)
bfc003b4:	afb70080 	sw	s7,128(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:89
	sw $s6, 124($sp)
bfc003b8:	afb6007c 	sw	s6,124(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:90
	sw $s5, 120($sp)
bfc003bc:	afb50078 	sw	s5,120(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:91
	sw $s4, 116($sp)
bfc003c0:	afb40074 	sw	s4,116(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:92
	sw $s3, 112($sp)
bfc003c4:	afb30070 	sw	s3,112(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:93
	sw $s2, 108($sp)
bfc003c8:	afb2006c 	sw	s2,108(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:94
	sw $s1, 104($sp)
bfc003cc:	afb10068 	sw	s1,104(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:95
	sw $s0, 100($sp)
bfc003d0:	afb00064 	sw	s0,100(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:96
	sw $t7,  96($sp)
bfc003d4:	afaf0060 	sw	t7,96(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:97
	sw $t6,  92($sp)
bfc003d8:	afae005c 	sw	t6,92(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:98
	sw $t5,  88($sp)
bfc003dc:	afad0058 	sw	t5,88(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:99
	sw $t4,  84($sp)
bfc003e0:	afac0054 	sw	t4,84(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:100
	sw $t3,  80($sp)
bfc003e4:	afab0050 	sw	t3,80(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:101
	sw $t2,  76($sp)
bfc003e8:	afaa004c 	sw	t2,76(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:102
	sw $t1,  72($sp)
bfc003ec:	afa90048 	sw	t1,72(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:103
	sw $t0,  68($sp)
bfc003f0:	afa80044 	sw	t0,68(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:104
	sw $a3,  64($sp)
bfc003f4:	afa70040 	sw	a3,64(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:105
	sw $a2,  60($sp)
bfc003f8:	afa6003c 	sw	a2,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:106
	sw $a1,  56($sp)
bfc003fc:	afa50038 	sw	a1,56(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:107
	sw $a0,  52($sp)
bfc00400:	afa40034 	sw	a0,52(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:108
	sw $v1,  48($sp)
bfc00404:	afa30030 	sw	v1,48(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:109
	sw $v0,  44($sp)
bfc00408:	afa2002c 	sw	v0,44(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:110
	sw $at,  40($sp)
bfc0040c:	afa10028 	sw	at,40(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:112
    # save cp0
    mfc0 $t1, $15, 1    # EBase
bfc00410:	40097801 	mfc0	t1,$15,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:113
    sw   $t1, 32($sp)
bfc00414:	afa90020 	sw	t1,32(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:114
    mfc0 $t1, $8,  0    # BadVAddr
bfc00418:	40094000 	mfc0	t1,c0_badvaddr
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:115
    sw   $t1, 28($sp)
bfc0041c:	afa9001c 	sw	t1,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:116
    mfc0 $t1, $12, 0    # Status
bfc00420:	40096000 	mfc0	t1,c0_status
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:117
    sw   $t1, 24($sp)
bfc00424:	afa90018 	sw	t1,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:118
    mfc0 $t1, $13, 0    # Cause
bfc00428:	40096800 	mfc0	t1,c0_cause
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:119
    sw   $t1, 20($sp)
bfc0042c:	afa90014 	sw	t1,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:120
    mfc0 $t1, $14, 0    # EPC
bfc00430:	40097000 	mfc0	t1,c0_epc
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:121
    sw   $t1, 16($sp)
bfc00434:	afa90010 	sw	t1,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:123

    move $a0, $sp
bfc00438:	03a02025 	move	a0,sp
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:124
    move $a1, $k0
bfc0043c:	03402825 	move	a1,k0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:126

    jal _exception_handler
bfc00440:	0ff001c3 	jal	bfc0070c <_exception_handler>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:127
    nop
bfc00444:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:128
    j _loop
bfc00448:	0bf0000e 	j	bfc00038 <_loop>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:129
    nop
bfc0044c:	00000000 	nop

bfc00450 <_Z16send_serial_charh>:
_Z16send_serial_charh():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:22
	unsigned char *const var = reinterpret_cast<unsigned char *const>(MEM_ADDR)

inline void send_serial_char(unsigned char c)
{
	LOAD_SERIAL_ENTRY(serial_entry);
	while(!(serial_entry[0] & 1));
bfc00450:	3c03a300 	lui	v1,0xa300
bfc00454:	8c620000 	lw	v0,0(v1)
bfc00458:	30420001 	andi	v0,v0,0x1
bfc0045c:	1040fffd 	beqz	v0,bfc00454 <_Z16send_serial_charh+0x4>
bfc00460:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:23
	if(c) serial_entry[1] = c;
bfc00464:	10800002 	beqz	a0,bfc00470 <_Z16send_serial_charh+0x20>
bfc00468:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:23 (discriminator 1)
bfc0046c:	ac640004 	sw	a0,4(v1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:24
}
bfc00470:	03e00008 	jr	ra
bfc00474:	00000000 	nop

bfc00478 <_Z28send_serial_integer_unsignedj>:
_Z28send_serial_integer_unsignedj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:68
}


inline void send_serial_integer_unsigned(unsigned v)
{
	if (v != 0){
bfc00478:	1080000f 	beqz	a0,bfc004b8 <_Z28send_serial_integer_unsignedj+0x40>
bfc0047c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:67
{
bfc00480:	27bdffe8 	addiu	sp,sp,-24
bfc00484:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:69
		send_serial_integer_unsigned(v / 10);
bfc00488:	2410000a 	li	s0,10
bfc0048c:	0090001b 	divu	zero,a0,s0
bfc00490:	020001f4 	teq	s0,zero,0x7
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:67
{
bfc00494:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:69
		send_serial_integer_unsigned(v / 10);
bfc00498:	00008010 	mfhi	s0
bfc0049c:	0ff0011e 	jal	bfc00478 <_Z28send_serial_integer_unsignedj>
bfc004a0:	00002012 	mflo	a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:72
		send_serial_char((v % 10) + '0');
	}
}
bfc004a4:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:70
		send_serial_char((v % 10) + '0');
bfc004a8:	26040030 	addiu	a0,s0,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:72
}
bfc004ac:	8fb00010 	lw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:70
		send_serial_char((v % 10) + '0');
bfc004b0:	0bf00114 	j	bfc00450 <_Z16send_serial_charh>
bfc004b4:	27bd0018 	addiu	sp,sp,24
bfc004b8:	03e00008 	jr	ra
bfc004bc:	00000000 	nop

bfc004c0 <_entry>:
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:4
#include "trivial_mips.h"

int _entry()
{
bfc004c0:	27bdffe0 	addiu	sp,sp,-32
bfc004c4:	3c028000 	lui	v0,0x8000
bfc004c8:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:6
	LOAD_MEMORY_ENTRY(mem);
	for(int i = 0; i != 100; ++i)
bfc004cc:	3c108000 	lui	s0,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:4
{
bfc004d0:	afbf001c 	sw	ra,28(sp)
bfc004d4:	afb10018 	sw	s1,24(sp)
bfc004d8:	24421000 	addiu	v0,v0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:6
	for(int i = 0; i != 100; ++i)
bfc004dc:	26031064 	addiu	v1,s0,4196
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:7 (discriminator 2)
		mem[i + 0x1000] = i;
bfc004e0:	a0420000 	sb	v0,0(v0)
bfc004e4:	24420001 	addiu	v0,v0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:6 (discriminator 2)
	for(int i = 0; i != 100; ++i)
bfc004e8:	1443fffd 	bne	v0,v1,bfc004e0 <_entry+0x20>
bfc004ec:	00000000 	nop
bfc004f0:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:8
	for(int i = 0; i != 100; ++i)
bfc004f4:	26110064 	addiu	s1,s0,100
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:10 (discriminator 2)
	{
		send_serial_integer(mem[i + 0x1000]);
bfc004f8:	92040000 	lbu	a0,0(s0)
_Z19send_serial_integeri():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:80 (discriminator 2)
inline void send_serial_integer(int v)
{
	if(v < 0) {
		send_serial_char('-');
		send_serial_integer_unsigned(-v);
	} else if(v > 0) {
bfc004fc:	1080000d 	beqz	a0,bfc00534 <_entry+0x74>
bfc00500:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:81
		send_serial_integer_unsigned(v);
bfc00504:	0ff0011e 	jal	bfc00478 <_Z28send_serial_integer_unsignedj>
bfc00508:	00000000 	nop
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:11 (discriminator 2)
		send_serial_char('\n');
bfc0050c:	2404000a 	li	a0,10
bfc00510:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00514:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:8 (discriminator 2)
	for(int i = 0; i != 100; ++i)
bfc00518:	1611fff7 	bne	s0,s1,bfc004f8 <_entry+0x38>
bfc0051c:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:14
	}
	return 0;
}
bfc00520:	8fb10018 	lw	s1,24(sp)
bfc00524:	8fb00014 	lw	s0,20(sp)
bfc00528:	00001025 	move	v0,zero
bfc0052c:	03e00008 	jr	ra
bfc00530:	27bd0020 	addiu	sp,sp,32
_Z19send_serial_integeri():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:83
	} else {
		send_serial_char('0');
bfc00534:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00538:	24040030 	li	a0,48
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/print_1to100.cpp:11
		send_serial_char('\n');
bfc0053c:	1000fff4 	b	bfc00510 <_entry+0x50>
bfc00540:	2404000a 	li	a0,10

bfc00544 <_main>:
_main():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:11
extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {
bfc00544:	27bdffe0 	addiu	sp,sp,-32
bfc00548:	afbf001c 	sw	ra,28(sp)
bfc0054c:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:13

    init_serial();
bfc00550:	0ff002e7 	jal	bfc00b9c <init_serial>
bfc00554:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:15

    write_segment(0x04);
bfc00558:	0ff00302 	jal	bfc00c08 <write_segment>
bfc0055c:	24040004 	li	a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:17

    puts("*****TrivialMIPS Bare Metal System*****");
bfc00560:	3c04bfc0 	lui	a0,0xbfc0
bfc00564:	0ff002d0 	jal	bfc00b40 <puts>
bfc00568:	24840c1c 	addiu	a0,a0,3100
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc0056c:	3c118800 	lui	s1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00570:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00574:	3c108800 	lui	s0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00578:	24840c44 	addiu	a0,a0,3140
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc0057c:	26310000 	addiu	s1,s1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00580:	0ff002d0 	jal	bfc00b40 <puts>
bfc00584:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00588:	02118023 	subu	s0,s0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:21
    write_segment(0x05);
bfc0058c:	0ff00302 	jal	bfc00c08 <write_segment>
bfc00590:	24040005 	li	a0,5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:25
    if (bss_size > 0) {
bfc00594:	1a000009 	blez	s0,bfc005bc <_main+0x78>
bfc00598:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:26
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
bfc0059c:	02003025 	move	a2,s0
bfc005a0:	02202825 	move	a1,s1
bfc005a4:	0ff001f0 	jal	bfc007c0 <printf>
bfc005a8:	24840c6c 	addiu	a0,a0,3180
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:27
        memset(&_bss, 0, bss_size);
bfc005ac:	02003025 	move	a2,s0
bfc005b0:	00002825 	move	a1,zero
bfc005b4:	0ff002af 	jal	bfc00abc <memset>
bfc005b8:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:30
    }

    write_segment(0x06);
bfc005bc:	0ff00302 	jal	bfc00c08 <write_segment>
bfc005c0:	24040006 	li	a0,6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:33

    // call the actual function
    int result = _entry();
bfc005c4:	0ff00130 	jal	bfc004c0 <_entry>
bfc005c8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:34
    if (result == 0) {
bfc005cc:	1440000a 	bnez	v0,bfc005f8 <_main+0xb4>
bfc005d0:	00402825 	move	a1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:35
        puts("Program exited normally.");
bfc005d4:	3c04bfc0 	lui	a0,0xbfc0
bfc005d8:	0ff002d0 	jal	bfc00b40 <puts>
bfc005dc:	24840ca8 	addiu	a0,a0,3240
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}
bfc005e0:	8fbf001c 	lw	ra,28(sp)
bfc005e4:	8fb10018 	lw	s1,24(sp)
bfc005e8:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:40
    write_segment(0x07);
bfc005ec:	24040007 	li	a0,7
bfc005f0:	0bf00302 	j	bfc00c08 <write_segment>
bfc005f4:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:37
        printf("Program exited abnormally with code %d.\n", result);
bfc005f8:	3c04bfc0 	lui	a0,0xbfc0
bfc005fc:	0ff001f0 	jal	bfc007c0 <printf>
bfc00600:	24840cc4 	addiu	a0,a0,3268
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
}
bfc00604:	1000fff7 	b	bfc005e4 <_main+0xa0>
bfc00608:	8fbf001c 	lw	ra,28(sp)

bfc0060c <print_trapframe>:
print_trapframe():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
bfc0060c:	27bdffd0 	addiu	sp,sp,-48
bfc00610:	afb30024 	sw	s3,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00614:	3c13bfc0 	lui	s3,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
void print_trapframe(trapframe_t *tf) {
bfc00618:	afb40028 	sw	s4,40(sp)
bfc0061c:	afb20020 	sw	s2,32(sp)
bfc00620:	afb1001c 	sw	s1,28(sp)
bfc00624:	afb00018 	sw	s0,24(sp)
bfc00628:	afbf002c 	sw	ra,44(sp)
bfc0062c:	00808025 	move	s0,a0
bfc00630:	24920028 	addiu	s2,a0,40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
bfc00634:	24110001 	li	s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00638:	26730cf0 	addiu	s3,s3,3312
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
bfc0063c:	24140020 	li	s4,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64 (discriminator 3)
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00640:	8e460000 	lw	a2,0(s2)
bfc00644:	02202825 	move	a1,s1
bfc00648:	02602025 	move	a0,s3
bfc0064c:	0ff001f0 	jal	bfc007c0 <printf>
bfc00650:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63 (discriminator 3)
    for(int i = 1; i < 32; ++i) {
bfc00654:	1634fffa 	bne	s1,s4,bfc00640 <print_trapframe+0x34>
bfc00658:	26520004 	addiu	s2,s2,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:66
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
bfc0065c:	8e020020 	lw	v0,32(s0)
bfc00660:	8e070018 	lw	a3,24(s0)
bfc00664:	afa20014 	sw	v0,20(sp)
bfc00668:	8e02001c 	lw	v0,28(s0)
bfc0066c:	8e060014 	lw	a2,20(s0)
bfc00670:	8e050010 	lw	a1,16(s0)
bfc00674:	3c04bfc0 	lui	a0,0xbfc0
bfc00678:	afa20010 	sw	v0,16(sp)
bfc0067c:	0ff001f0 	jal	bfc007c0 <printf>
bfc00680:	24840d04 	addiu	a0,a0,3332
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:67
}
bfc00684:	8fbf002c 	lw	ra,44(sp)
bfc00688:	8fb40028 	lw	s4,40(sp)
bfc0068c:	8fb30024 	lw	s3,36(sp)
bfc00690:	8fb20020 	lw	s2,32(sp)
bfc00694:	8fb1001c 	lw	s1,28(sp)
bfc00698:	8fb00018 	lw	s0,24(sp)
bfc0069c:	03e00008 	jr	ra
bfc006a0:	27bd0030 	addiu	sp,sp,48

bfc006a4 <print_tlb>:
print_tlb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69

void print_tlb() {
bfc006a4:	27bdffd8 	addiu	sp,sp,-40
bfc006a8:	afb1001c 	sw	s1,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc006ac:	3c11bfc0 	lui	s1,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69
void print_tlb() {
bfc006b0:	afb20020 	sw	s2,32(sp)
bfc006b4:	afb00018 	sw	s0,24(sp)
bfc006b8:	afbf0024 	sw	ra,36(sp)
bfc006bc:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc006c0:	26310d40 	addiu	s1,s1,3392
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
bfc006c4:	24120010 	li	s2,16
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:72 (discriminator 3)
        asm volatile(
bfc006c8:	40900000 	mtc0	s0,c0_index
bfc006cc:	42000001 	tlbr
bfc006d0:	40065000 	mfc0	a2,c0_entryhi
bfc006d4:	40071000 	mfc0	a3,c0_entrylo0
bfc006d8:	40021800 	mfc0	v0,c0_entrylo1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81 (discriminator 3)
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc006dc:	02002825 	move	a1,s0
bfc006e0:	afa20010 	sw	v0,16(sp)
bfc006e4:	02202025 	move	a0,s1
bfc006e8:	0ff001f0 	jal	bfc007c0 <printf>
bfc006ec:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70 (discriminator 3)
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
bfc006f0:	1612fff5 	bne	s0,s2,bfc006c8 <print_tlb+0x24>
bfc006f4:	8fbf0024 	lw	ra,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:83
    }
}
bfc006f8:	8fb20020 	lw	s2,32(sp)
bfc006fc:	8fb1001c 	lw	s1,28(sp)
bfc00700:	8fb00018 	lw	s0,24(sp)
bfc00704:	03e00008 	jr	ra
bfc00708:	27bd0028 	addiu	sp,sp,40

bfc0070c <_exception_handler>:
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85

void _exception_handler(trapframe_t *tf, bool assertion) {
bfc0070c:	27bdffe0 	addiu	sp,sp,-32
bfc00710:	afb10018 	sw	s1,24(sp)
bfc00714:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00718:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
bfc0071c:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00720:	24840c1c 	addiu	a0,a0,3100
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00724:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00728:	0ff002d0 	jal	bfc00b40 <puts>
bfc0072c:	00a08025 	move	s0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:87
    if (assertion) {
bfc00730:	12000012 	beqz	s0,bfc0077c <_exception_handler+0x70>
bfc00734:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:88
        puts("CPU internal assertion failed, abort.");
bfc00738:	3c04bfc0 	lui	a0,0xbfc0
bfc0073c:	0ff002d0 	jal	bfc00b40 <puts>
bfc00740:	24840d78 	addiu	a0,a0,3448
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:89
        write_segment(0xdeaddead);
bfc00744:	3c04dead 	lui	a0,0xdead
bfc00748:	0ff00302 	jal	bfc00c08 <write_segment>
bfc0074c:	3484dead 	ori	a0,a0,0xdead
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:96
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
bfc00750:	0ff00183 	jal	bfc0060c <print_trapframe>
bfc00754:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:97
    print_tlb();
bfc00758:	0ff001a9 	jal	bfc006a4 <print_tlb>
bfc0075c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:99
    puts("*****System HANG*****");
}
bfc00760:	8fbf001c 	lw	ra,28(sp)
bfc00764:	8fb10018 	lw	s1,24(sp)
bfc00768:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:98
    puts("*****System HANG*****");
bfc0076c:	3c04bfc0 	lui	a0,0xbfc0
bfc00770:	24840ddc 	addiu	a0,a0,3548
bfc00774:	0bf002d0 	j	bfc00b40 <puts>
bfc00778:	27bd0020 	addiu	sp,sp,32
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
bfc0077c:	40066800 	mfc0	a2,c0_cause
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:91
        word_t code = (_get_cause() >> 2) & 0xF;
bfc00780:	00063082 	srl	a2,a2,0x2
bfc00784:	30c6000f 	andi	a2,a2,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
bfc00788:	3c03bfc0 	lui	v1,0xbfc0
bfc0078c:	00061080 	sll	v0,a2,0x2
bfc00790:	24631068 	addiu	v1,v1,4200
bfc00794:	00431021 	addu	v0,v0,v1
bfc00798:	8c470000 	lw	a3,0(v0)
bfc0079c:	3c04bfc0 	lui	a0,0xbfc0
_get_epc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:46
    asm(
bfc007a0:	40107000 	mfc0	s0,c0_epc
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
bfc007a4:	24840da0 	addiu	a0,a0,3488
bfc007a8:	0ff001f0 	jal	bfc007c0 <printf>
bfc007ac:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:94
        write_led((uint16_t) epc);
bfc007b0:	0ff002fd 	jal	bfc00bf4 <write_led>
bfc007b4:	3204ffff 	andi	a0,s0,0xffff
bfc007b8:	1000ffe5 	b	bfc00750 <_exception_handler+0x44>
bfc007bc:	00000000 	nop

bfc007c0 <printf>:
printf():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
int printf(const char *fmt, ...)
{
bfc007c0:	27bdffd0 	addiu	sp,sp,-48
bfc007c4:	afb00018 	sw	s0,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
bfc007c8:	27b00034 	addiu	s0,sp,52
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
{
bfc007cc:	afb30024 	sw	s3,36(sp)
bfc007d0:	afb20020 	sw	s2,32(sp)
bfc007d4:	afb1001c 	sw	s1,28(sp)
bfc007d8:	afbf002c 	sw	ra,44(sp)
bfc007dc:	afb40028 	sw	s4,40(sp)
bfc007e0:	00809025 	move	s2,a0
bfc007e4:	afa50034 	sw	a1,52(sp)
bfc007e8:	afa60038 	sw	a2,56(sp)
bfc007ec:	afa7003c 	sw	a3,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	__builtin_va_start(ap, fmt);
bfc007f0:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10
	arg = ap;
	for (i = 0; fmt[i]; i++)
bfc007f4:	00008825 	move	s1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
				break;
			}
		}
		else
		{
			if (c == '\n')
bfc007f8:	2413000a 	li	s3,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 1)
	for (i = 0; fmt[i]; i++)
bfc007fc:	02511021 	addu	v0,s2,s1
bfc00800:	80540000 	lb	s4,0(v0)
bfc00804:	1680000a 	bnez	s4,bfc00830 <printf+0x70>
bfc00808:	24020025 	li	v0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:85
				putchar('\r');
			putchar(c);
		}
	}
	return 0;
}
bfc0080c:	8fbf002c 	lw	ra,44(sp)
bfc00810:	8fb40028 	lw	s4,40(sp)
bfc00814:	8fb30024 	lw	s3,36(sp)
bfc00818:	8fb20020 	lw	s2,32(sp)
bfc0081c:	8fb1001c 	lw	s1,28(sp)
bfc00820:	8fb00018 	lw	s0,24(sp)
bfc00824:	00001025 	move	v0,zero
bfc00828:	03e00008 	jr	ra
bfc0082c:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:13
		if (c == '%')
bfc00830:	16820066 	bne	s4,v0,bfc009cc <printf+0x20c>
bfc00834:	24050001 	li	a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00838:	24060064 	li	a2,100
bfc0083c:	24070025 	li	a3,37
bfc00840:	24080030 	li	t0,48
bfc00844:	02511021 	addu	v0,s2,s1
bfc00848:	80420001 	lb	v0,1(v0)
bfc0084c:	1046003a 	beq	v0,a2,bfc00938 <printf+0x178>
bfc00850:	28430065 	slti	v1,v0,101
bfc00854:	10600018 	beqz	v1,bfc008b8 <printf+0xf8>
bfc00858:	2843003a 	slti	v1,v0,58
bfc0085c:	1060000c 	beqz	v1,bfc00890 <printf+0xd0>
bfc00860:	28430031 	slti	v1,v0,49
bfc00864:	1060004d 	beqz	v1,bfc0099c <printf+0x1dc>
bfc00868:	02512021 	addu	a0,s2,s1
bfc0086c:	10470046 	beq	v0,a3,bfc00988 <printf+0x1c8>
bfc00870:	26340001 	addiu	s4,s1,1
bfc00874:	10480048 	beq	v0,t0,bfc00998 <printf+0x1d8>
bfc00878:	02542021 	addu	a0,s2,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:73
				putchar('%');
bfc0087c:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
bfc00880:	0ff002dc 	jal	bfc00b70 <putchar>
bfc00884:	26310001 	addiu	s1,s1,1
bfc00888:	1000ffdd 	b	bfc00800 <printf+0x40>
bfc0088c:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00890:	24030062 	li	v1,98
bfc00894:	10430036 	beq	v0,v1,bfc00970 <printf+0x1b0>
bfc00898:	26340001 	addiu	s4,s1,1
bfc0089c:	24030063 	li	v1,99
bfc008a0:	1443fff6 	bne	v0,v1,bfc0087c <printf+0xbc>
bfc008a4:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:25
				putchar((long)*arg);
bfc008a8:	0ff002dc 	jal	bfc00b70 <putchar>
bfc008ac:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc008b0:	10000017 	b	bfc00910 <printf+0x150>
bfc008b4:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc008b8:	24030070 	li	v1,112
bfc008bc:	1043002f 	beq	v0,v1,bfc0097c <printf+0x1bc>
bfc008c0:	28430071 	slti	v1,v0,113
bfc008c4:	10600008 	beqz	v1,bfc008e8 <printf+0x128>
bfc008c8:	24030075 	li	v1,117
bfc008cc:	2403006c 	li	v1,108
bfc008d0:	10430020 	beq	v0,v1,bfc00954 <printf+0x194>
bfc008d4:	2403006f 	li	v1,111
bfc008d8:	1443ffe8 	bne	v0,v1,bfc0087c <printf+0xbc>
bfc008dc:	00003825 	move	a3,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:45
				printbase((long)*arg, w, 8, 0);
bfc008e0:	10000017 	b	bfc00940 <printf+0x180>
bfc008e4:	24060008 	li	a2,8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc008e8:	1043000d 	beq	v0,v1,bfc00920 <printf+0x160>
bfc008ec:	26340001 	addiu	s4,s1,1
bfc008f0:	24030078 	li	v1,120
bfc008f4:	10430021 	beq	v0,v1,bfc0097c <printf+0x1bc>
bfc008f8:	24030073 	li	v1,115
bfc008fc:	1443ffe0 	bne	v0,v1,bfc00880 <printf+0xc0>
bfc00900:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:20
				putstring(*arg);
bfc00904:	0ff002b8 	jal	bfc00ae0 <putstring>
bfc00908:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc0090c:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
bfc00910:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 2)
	for (i = 0; fmt[i]; i++)
bfc00914:	26310001 	addiu	s1,s1,1
bfc00918:	1000ffb9 	b	bfc00800 <printf+0x40>
bfc0091c:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:30
				printbase((long)*arg, w, 10, 0);
bfc00920:	00003825 	move	a3,zero
bfc00924:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
bfc00928:	0ff00279 	jal	bfc009e4 <printbase>
bfc0092c:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc00930:	1000fff7 	b	bfc00910 <printf+0x150>
bfc00934:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:35
				printbase((long)*arg, w, 10, 1);
bfc00938:	24070001 	li	a3,1
bfc0093c:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
bfc00940:	8e040000 	lw	a0,0(s0)
bfc00944:	0ff00279 	jal	bfc009e4 <printbase>
bfc00948:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:59
				break;
bfc0094c:	1000fff1 	b	bfc00914 <printf+0x154>
bfc00950:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:40
				printbase((long)*arg, w, 10, 0);
bfc00954:	8e040000 	lw	a0,0(s0)
bfc00958:	00003825 	move	a3,zero
bfc0095c:	0ff00279 	jal	bfc009e4 <printbase>
bfc00960:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:41
				arg++;
bfc00964:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:43
				break;
bfc00968:	1000ffea 	b	bfc00914 <printf+0x154>
bfc0096c:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
bfc00970:	00003825 	move	a3,zero
bfc00974:	1000ffec 	b	bfc00928 <printf+0x168>
bfc00978:	24060002 	li	a2,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
bfc0097c:	00003825 	move	a3,zero
bfc00980:	1000ffef 	b	bfc00940 <printf+0x180>
bfc00984:	24060010 	li	a2,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:61
				putchar('%');
bfc00988:	0ff002dc 	jal	bfc00b70 <putchar>
bfc0098c:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
bfc00990:	1000ffe0 	b	bfc00914 <printf+0x154>
bfc00994:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:65
				i++;
bfc00998:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:15 (discriminator 1)
			w = 1;
bfc0099c:	00002825 	move	a1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:67 (discriminator 1)
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
bfc009a0:	80830001 	lb	v1,1(a0)
bfc009a4:	00928823 	subu	s1,a0,s2
bfc009a8:	2462ffcf 	addiu	v0,v1,-49
bfc009ac:	304200ff 	andi	v0,v0,0xff
bfc009b0:	2c420009 	sltiu	v0,v0,9
bfc009b4:	1040ffa3 	beqz	v0,bfc00844 <printf+0x84>
bfc009b8:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:68 (discriminator 3)
					w = w * 10 + (fmt[i + 1] - '0');
bfc009bc:	70b31002 	mul	v0,a1,s3
bfc009c0:	2463ffd0 	addiu	v1,v1,-48
bfc009c4:	1000fff6 	b	bfc009a0 <printf+0x1e0>
bfc009c8:	00432821 	addu	a1,v0,v1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
			if (c == '\n')
bfc009cc:	16930003 	bne	s4,s3,bfc009dc <printf+0x21c>
bfc009d0:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:80
				putchar('\r');
bfc009d4:	0ff002dc 	jal	bfc00b70 <putchar>
bfc009d8:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
bfc009dc:	1000ffa8 	b	bfc00880 <printf+0xc0>
bfc009e0:	02802025 	move	a0,s4

bfc009e4 <printbase>:
printbase():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2
int printbase(long v,int w,int base,int sign)
{
bfc009e4:	27bdff98 	addiu	sp,sp,-104
bfc009e8:	afb40060 	sw	s4,96(sp)
bfc009ec:	afb3005c 	sw	s3,92(sp)
bfc009f0:	afbf0064 	sw	ra,100(sp)
bfc009f4:	afb20058 	sw	s2,88(sp)
bfc009f8:	afb10054 	sw	s1,84(sp)
bfc009fc:	afb00050 	sw	s0,80(sp)
bfc00a00:	00a09825 	move	s3,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
bfc00a04:	10e00018 	beqz	a3,bfc00a68 <printbase+0x84>
bfc00a08:	00c0a025 	move	s4,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7 (discriminator 1)
bfc00a0c:	04810004 	bgez	a0,bfc00a20 <printbase+0x3c>
bfc00a10:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:9
	{
	value = -v;
bfc00a14:	00048023 	negu	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:10
	putchar('-');
bfc00a18:	0ff002dc 	jal	bfc00b70 <putchar>
bfc00a1c:	2404002d 	li	a0,45
bfc00a20:	27b10010 	addiu	s1,sp,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2 (discriminator 1)
{
bfc00a24:	02201025 	move	v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:14 (discriminator 1)
	}
	else value=v;

	for(i=0;value;i++)
bfc00a28:	16000011 	bnez	s0,bfc00a70 <printbase+0x8c>
bfc00a2c:	00519023 	subu	s2,v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22
	value=value/base;
	}

#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
bfc00a30:	0272802a 	slt	s0,s3,s2
bfc00a34:	0250980b 	movn	s3,s2,s0
bfc00a38:	02608025 	move	s0,s3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22 (discriminator 2)
bfc00a3c:	16000013 	bnez	s0,bfc00a8c <printbase+0xa8>
bfc00a40:	0250102a 	slt	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:28
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}
bfc00a44:	8fbf0064 	lw	ra,100(sp)
bfc00a48:	8fb40060 	lw	s4,96(sp)
bfc00a4c:	8fb3005c 	lw	s3,92(sp)
bfc00a50:	8fb20058 	lw	s2,88(sp)
bfc00a54:	8fb10054 	lw	s1,84(sp)
bfc00a58:	8fb00050 	lw	s0,80(sp)
bfc00a5c:	00001025 	move	v0,zero
bfc00a60:	03e00008 	jr	ra
bfc00a64:	27bd0068 	addiu	sp,sp,104
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:12
	else value=v;
bfc00a68:	1000ffed 	b	bfc00a20 <printbase+0x3c>
bfc00a6c:	00808025 	move	s0,a0
bfc00a70:	0214001b 	divu	zero,s0,s4
bfc00a74:	028001f4 	teq	s4,zero,0x7
bfc00a78:	24420001 	addiu	v0,v0,1
bfc00a7c:	00002010 	mfhi	a0
bfc00a80:	00008012 	mflo	s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:16 (discriminator 3)
	buf[i]=value%base;
bfc00a84:	1000ffe8 	b	bfc00a28 <printbase+0x44>
bfc00a88:	a044ffff 	sb	a0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24
		c=j>i?0:buf[j-1];
bfc00a8c:	14400006 	bnez	v0,bfc00aa8 <printbase+0xc4>
bfc00a90:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24 (discriminator 1)
bfc00a94:	02301021 	addu	v0,s1,s0
bfc00a98:	8042ffff 	lb	v0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 1)
		putchar((c<=9)?c+'0':c-0xa+'a');
bfc00a9c:	2843000a 	slti	v1,v0,10
bfc00aa0:	10600002 	beqz	v1,bfc00aac <printbase+0xc8>
bfc00aa4:	24440057 	addiu	a0,v0,87
bfc00aa8:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 4)
bfc00aac:	0ff002dc 	jal	bfc00b70 <putchar>
bfc00ab0:	2610ffff 	addiu	s0,s0,-1
bfc00ab4:	1000ffe1 	b	bfc00a3c <printbase+0x58>
bfc00ab8:	00000000 	nop

bfc00abc <memset>:
memset():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:273
 * @n:      number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
bfc00abc:	00801025 	move	v0,a0
bfc00ac0:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:277
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memset(s, c, n);
#else
    char *p = s;
bfc00ac4:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:278
    while (n -- > 0) {
bfc00ac8:	14660003 	bne	v1,a2,bfc00ad8 <memset+0x1c>
bfc00acc:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:283
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
bfc00ad0:	03e00008 	jr	ra
bfc00ad4:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:279
        *p ++ = c;
bfc00ad8:	1000fffb 	b	bfc00ac8 <memset+0xc>
bfc00adc:	a065ffff 	sb	a1,-1(v1)

bfc00ae0 <putstring>:
putstring():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:2
int putstring(const char *s)
{
bfc00ae0:	27bdffe0 	addiu	sp,sp,-32
bfc00ae4:	afb20018 	sw	s2,24(sp)
bfc00ae8:	afb10014 	sw	s1,20(sp)
bfc00aec:	afbf001c 	sw	ra,28(sp)
bfc00af0:	afb00010 	sw	s0,16(sp)
bfc00af4:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
    char c;
    while ((c = *s))
    {
        if (c == '\n')
bfc00af8:	2412000a 	li	s2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:4
    while ((c = *s))
bfc00afc:	82300000 	lb	s0,0(s1)
bfc00b00:	16000007 	bnez	s0,bfc00b20 <putstring+0x40>
bfc00b04:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:12
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
bfc00b08:	8fb20018 	lw	s2,24(sp)
bfc00b0c:	8fb10014 	lw	s1,20(sp)
bfc00b10:	8fb00010 	lw	s0,16(sp)
bfc00b14:	00001025 	move	v0,zero
bfc00b18:	03e00008 	jr	ra
bfc00b1c:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
        if (c == '\n')
bfc00b20:	16120003 	bne	s0,s2,bfc00b30 <putstring+0x50>
bfc00b24:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:7
            putchar('\r');
bfc00b28:	0ff002dc 	jal	bfc00b70 <putchar>
bfc00b2c:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:8
        putchar(c);
bfc00b30:	0ff002dc 	jal	bfc00b70 <putchar>
bfc00b34:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:9
        s++;
bfc00b38:	1000fff0 	b	bfc00afc <putstring+0x1c>
bfc00b3c:	26310001 	addiu	s1,s1,1

bfc00b40 <puts>:
puts():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:15

int puts(const char *s)
{
bfc00b40:	27bdffe8 	addiu	sp,sp,-24
bfc00b44:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:16
    putstring(s);
bfc00b48:	0ff002b8 	jal	bfc00ae0 <putstring>
bfc00b4c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:17
    putchar('\r');
bfc00b50:	0ff002dc 	jal	bfc00b70 <putchar>
bfc00b54:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:18
    putchar('\n');
bfc00b58:	0ff002dc 	jal	bfc00b70 <putchar>
bfc00b5c:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:20
    return 0;
}
bfc00b60:	8fbf0014 	lw	ra,20(sp)
bfc00b64:	00001025 	move	v0,zero
bfc00b68:	03e00008 	jr	ra
bfc00b6c:	27bd0018 	addiu	sp,sp,24

bfc00b70 <putchar>:
putchar():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:4
#include <machine.h>

int putchar(int c)
{
bfc00b70:	27bdffe8 	addiu	sp,sp,-24
bfc00b74:	afb00010 	sw	s0,16(sp)
bfc00b78:	00808025 	move	s0,a0
bfc00b7c:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:5
	write_serial((byte_t) c);
bfc00b80:	0ff002f5 	jal	bfc00bd4 <write_serial>
bfc00b84:	308400ff 	andi	a0,a0,0xff
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:7
	return c;
bfc00b88:	8fbf0014 	lw	ra,20(sp)
bfc00b8c:	02001025 	move	v0,s0
bfc00b90:	8fb00010 	lw	s0,16(sp)
bfc00b94:	03e00008 	jr	ra
bfc00b98:	27bd0018 	addiu	sp,sp,24

bfc00b9c <init_serial>:
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
}

template<typename T>
void write(void *addr, T data){
    auto *ptr = reinterpret_cast<volatile T *>(addr);
    *ptr = data;
bfc00b9c:	3c02bfd0 	lui	v0,0xbfd0
bfc00ba0:	2403ff81 	li	v1,-127
bfc00ba4:	a0433008 	sb	v1,12296(v0)
bfc00ba8:	2403ff80 	li	v1,-128
bfc00bac:	a043300c 	sb	v1,12300(v0)
bfc00bb0:	24030036 	li	v1,54
bfc00bb4:	a0433000 	sb	v1,12288(v0)
bfc00bb8:	24030003 	li	v1,3
bfc00bbc:	a0403004 	sb	zero,12292(v0)
bfc00bc0:	a043300c 	sb	v1,12300(v0)
bfc00bc4:	a0403010 	sb	zero,12304(v0)
bfc00bc8:	a0403004 	sb	zero,12292(v0)
init_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:45
	write_byte(UART_LCR_ADDR, ~0x80 & 0x03);
	// disable modem controls
	write_byte(UART_MCR_ADDR, 0);
	// disable interrupts
	write_byte(UART_IER_ADDR, 0);
}
bfc00bcc:	03e00008 	jr	ra
bfc00bd0:	00000000 	nop

bfc00bd4 <write_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
bfc00bd4:	3c03bfd0 	lui	v1,0xbfd0
bfc00bd8:	90623014 	lbu	v0,12308(v1)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:53
	while (!(read_byte(UART_LSR_ADDR) & 0x01));
	return read_byte(UART_DAT_ADDR);
}

void write_serial(byte_t data){
	while (!(read_byte(UART_LSR_ADDR) & 0x40));
bfc00bdc:	30420040 	andi	v0,v0,0x40
bfc00be0:	1040fffd 	beqz	v0,bfc00bd8 <write_serial+0x4>
bfc00be4:	3c02bfd0 	lui	v0,0xbfd0
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc00be8:	a0443000 	sb	a0,12288(v0)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:55
	write_byte(UART_DAT_ADDR, data);
}
bfc00bec:	03e00008 	jr	ra
bfc00bf0:	00000000 	nop

bfc00bf4 <write_led>:
_Z5writeItEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc00bf4:	3c02bff0 	lui	v0,0xbff0
bfc00bf8:	3442f000 	ori	v0,v0,0xf000
bfc00bfc:	a4440000 	sh	a0,0(v0)
write_led():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:68
	return word;
}

void write_led(hword_t data){
	write_hword(LED_ADDR, data);
}
bfc00c00:	03e00008 	jr	ra
bfc00c04:	00000000 	nop

bfc00c08 <write_segment>:
_Z5writeIjEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc00c08:	3c02bff0 	lui	v0,0xbff0
bfc00c0c:	3442f010 	ori	v0,v0,0xf010
bfc00c10:	ac440000 	sw	a0,0(v0)
write_segment():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:72

void write_segment(word_t data){
	write_word(NUM_ADDR, data);
}
bfc00c14:	03e00008 	jr	ra
bfc00c18:	00000000 	nop
bfc00c1c:	2a2a2a2a 	slti	t2,s1,10794
bfc00c20:	6972542a 	0x6972542a
bfc00c24:	6c616976 	0x6c616976
bfc00c28:	5350494d 	beql	k0,s0,bfc13160 <_text_end+0x12060>
bfc00c2c:	72614220 	0x72614220
bfc00c30:	654d2065 	0x654d2065
bfc00c34:	206c6174 	addi	t4,v1,24948
bfc00c38:	74737953 	jalx	b1cde54c <_mem_end+0x29cce54c>
bfc00c3c:	2a2a6d65 	slti	t2,s1,28005
bfc00c40:	002a2a2a 	0x2a2a2a
bfc00c44:	706d6f43 	0x706d6f43
bfc00c48:	74616c69 	jalx	b185b1a4 <_mem_end+0x2984b1a4>
bfc00c4c:	206e6f69 	addi	t6,v1,28521
bfc00c50:	656d6974 	0x656d6974
bfc00c54:	3931203a 	xori	s1,t1,0x203a
bfc00c58:	3a34313a 	xori	s4,s1,0x313a
bfc00c5c:	44203635 	0x44203635
bfc00c60:	31206365 	andi	zero,t1,0x6365
bfc00c64:	30322035 	andi	s2,at,0x2035
bfc00c68:	00003931 	tgeu	zero,zero,0xe4
bfc00c6c:	6c6c6946 	0x6c6c6946
bfc00c70:	20676e69 	addi	a3,v1,28265
bfc00c74:	7373622e 	0x7373622e
bfc00c78:	63657320 	0x63657320
bfc00c7c:	6e6f6974 	0x6e6f6974
bfc00c80:	74697720 	jalx	b1a5dc80 <_mem_end+0x29a4dc80>
bfc00c84:	2c302068 	sltiu	s0,at,8296
bfc00c88:	66666f20 	0x66666f20
bfc00c8c:	3a746573 	xori	s4,s3,0x6573
bfc00c90:	25783020 	addiu	t8,t3,12320
bfc00c94:	73202c78 	0x73202c78
bfc00c98:	3a657a69 	xori	a1,s3,0x7a69
bfc00c9c:	20642520 	addi	a0,v1,9504
bfc00ca0:	65747962 	0x65747962
bfc00ca4:	000a2e73 	tltu	zero,t2,0xb9
bfc00ca8:	676f7250 	0x676f7250
bfc00cac:	206d6172 	addi	t5,v1,24946
bfc00cb0:	74697865 	jalx	b1a5e194 <_mem_end+0x29a4e194>
bfc00cb4:	6e206465 	0x6e206465
bfc00cb8:	616d726f 	0x616d726f
bfc00cbc:	2e796c6c 	sltiu	t9,s3,27756
bfc00cc0:	00000000 	nop
bfc00cc4:	676f7250 	0x676f7250
bfc00cc8:	206d6172 	addi	t5,v1,24946
bfc00ccc:	74697865 	jalx	b1a5e194 <_mem_end+0x29a4e194>
bfc00cd0:	61206465 	0x61206465
bfc00cd4:	726f6e62 	0x726f6e62
bfc00cd8:	6c6c616d 	0x6c6c616d
bfc00cdc:	69772079 	0x69772079
bfc00ce0:	63206874 	0x63206874
bfc00ce4:	2065646f 	addi	a1,v1,25711
bfc00ce8:	0a2e6425 	j	b8b99094 <_mem_end+0x30b89094>
bfc00cec:	00000000 	nop
bfc00cf0:	69676552 	0x69676552
bfc00cf4:	72657473 	0x72657473
bfc00cf8:	64252420 	0x64252420
bfc00cfc:	7025203a 	0x7025203a
bfc00d00:	0000000a 	movz	zero,zero,zero
bfc00d04:	3a435045 	xori	v1,s2,0x5045
bfc00d08:	2c702520 	sltiu	s0,v1,9504
bfc00d0c:	75614320 	jalx	b5850c80 <_mem_end+0x2d840c80>
bfc00d10:	203a6573 	addi	k0,at,25971
bfc00d14:	202c7025 	addi	t4,at,28709
bfc00d18:	74617453 	jalx	b185d14c <_mem_end+0x2984d14c>
bfc00d1c:	203a7375 	addi	k0,at,29557
bfc00d20:	202c7025 	addi	t4,at,28709
bfc00d24:	56646142 	bnel	s3,a0,bfc19230 <_text_end+0x18130>
bfc00d28:	72646441 	0x72646441
bfc00d2c:	7025203a 	0x7025203a
bfc00d30:	4245202c 	c0	0x45202c
bfc00d34:	3a657361 	xori	a1,s3,0x7361
bfc00d38:	0a702520 	j	b9c09480 <_mem_end+0x31bf9480>
bfc00d3c:	00000000 	nop
bfc00d40:	20424c54 	addi	v0,v0,19540
bfc00d44:	6d657469 	0x6d657469
bfc00d48:	3a642520 	xori	a0,s3,0x2520
bfc00d4c:	746e4520 	jalx	b1b91480 <_mem_end+0x29b81480>
bfc00d50:	69487972 	0x69487972
bfc00d54:	2c702520 	sltiu	s0,v1,9504
bfc00d58:	746e4520 	jalx	b1b91480 <_mem_end+0x29b81480>
bfc00d5c:	6f4c7972 	0x6f4c7972
bfc00d60:	25203a31 	addiu	zero,t1,14897
bfc00d64:	45202c70 	0x45202c70
bfc00d68:	7972746e 	0x7972746e
bfc00d6c:	3a326f4c 	xori	s2,s1,0x6f4c
bfc00d70:	0a702520 	j	b9c09480 <_mem_end+0x31bf9480>
bfc00d74:	00000000 	nop
bfc00d78:	20555043 	addi	s5,v0,20547
bfc00d7c:	65746e69 	0x65746e69
bfc00d80:	6c616e72 	0x6c616e72
bfc00d84:	73736120 	0x73736120
bfc00d88:	69747265 	0x69747265
bfc00d8c:	66206e6f 	0x66206e6f
bfc00d90:	656c6961 	0x656c6961
bfc00d94:	61202c64 	0x61202c64
bfc00d98:	74726f62 	jalx	b1c9bd88 <_mem_end+0x29c8bd88>
bfc00d9c:	0000002e 	0x2e
bfc00da0:	65206e41 	0x65206e41
bfc00da4:	70656378 	0x70656378
bfc00da8:	6e6f6974 	0x6e6f6974
bfc00dac:	63636f20 	0x63636f20
bfc00db0:	65727275 	0x65727275
bfc00db4:	77202c64 	jalx	bc80b190 <_mem_end+0x347fb190>
bfc00db8:	20687469 	addi	t0,v1,29801
bfc00dbc:	20435045 	addi	v1,v0,20549
bfc00dc0:	78257830 	0x78257830
bfc00dc4:	646e6120 	0x646e6120
bfc00dc8:	75614320 	jalx	b5850c80 <_mem_end+0x2d840c80>
bfc00dcc:	25206573 	addiu	zero,t1,25971
bfc00dd0:	25282064 	addiu	t0,t1,8292
bfc00dd4:	0a2e2973 	j	b8b8a5cc <_mem_end+0x30b7a5cc>
bfc00dd8:	00000000 	nop
bfc00ddc:	2a2a2a2a 	slti	t2,s1,10794
bfc00de0:	7379532a 	0x7379532a
bfc00de4:	206d6574 	addi	t5,v1,25972
bfc00de8:	474e4148 	c1	0x14e4148
bfc00dec:	2a2a2a2a 	slti	t2,s1,10794
bfc00df0:	0000002a 	slt	zero,zero,zero
bfc00df4:	65746e49 	0x65746e49
bfc00df8:	70757272 	0x70757272
bfc00dfc:	00000074 	teq	zero,zero,0x1
bfc00e00:	20424c54 	addi	v0,v0,19540
bfc00e04:	69646f6d 	0x69646f6d
bfc00e08:	61636966 	0x61636966
bfc00e0c:	6e6f6974 	0x6e6f6974
bfc00e10:	63786520 	0x63786520
bfc00e14:	69747065 	0x69747065
bfc00e18:	00006e6f 	0x6e6f
bfc00e1c:	20424c54 	addi	v0,v0,19540
bfc00e20:	65637865 	0x65637865
bfc00e24:	6f697470 	0x6f697470
bfc00e28:	6c28206e 	0x6c28206e
bfc00e2c:	2064616f 	addi	a0,v1,24943
bfc00e30:	6920726f 	0x6920726f
bfc00e34:	7274736e 	0x7274736e
bfc00e38:	69746375 	0x69746375
bfc00e3c:	66206e6f 	0x66206e6f
bfc00e40:	68637465 	0x68637465
bfc00e44:	00000029 	0x29
bfc00e48:	20424c54 	addi	v0,v0,19540
bfc00e4c:	65637865 	0x65637865
bfc00e50:	6f697470 	0x6f697470
bfc00e54:	7328206e 	0x7328206e
bfc00e58:	65726f74 	0x65726f74
bfc00e5c:	00000029 	0x29
bfc00e60:	72646441 	0x72646441
bfc00e64:	20737365 	addi	s3,v1,29541
bfc00e68:	6f727265 	0x6f727265
bfc00e6c:	78652072 	0x78652072
bfc00e70:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00e74:	206e6f69 	addi	t6,v1,28521
bfc00e78:	616f6c28 	0x616f6c28
bfc00e7c:	726f2064 	0x726f2064
bfc00e80:	736e6920 	0x736e6920
bfc00e84:	63757274 	0x63757274
bfc00e88:	6e6f6974 	0x6e6f6974
bfc00e8c:	74656620 	jalx	b1959880 <_mem_end+0x29949880>
bfc00e90:	00296863 	0x296863
bfc00e94:	72646441 	0x72646441
bfc00e98:	20737365 	addi	s3,v1,29541
bfc00e9c:	6f727265 	0x6f727265
bfc00ea0:	78652072 	0x78652072
bfc00ea4:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00ea8:	206e6f69 	addi	t6,v1,28521
bfc00eac:	6f747328 	0x6f747328
bfc00eb0:	00296572 	tlt	at,t1,0x195
bfc00eb4:	20737542 	addi	s3,v1,30018
bfc00eb8:	6f727265 	0x6f727265
bfc00ebc:	78652072 	0x78652072
bfc00ec0:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00ec4:	206e6f69 	addi	t6,v1,28521
bfc00ec8:	736e6928 	0x736e6928
bfc00ecc:	63757274 	0x63757274
bfc00ed0:	6e6f6974 	0x6e6f6974
bfc00ed4:	74656620 	jalx	b1959880 <_mem_end+0x29949880>
bfc00ed8:	00296863 	0x296863
bfc00edc:	20737542 	addi	s3,v1,30018
bfc00ee0:	6f727265 	0x6f727265
bfc00ee4:	78652072 	0x78652072
bfc00ee8:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00eec:	206e6f69 	addi	t6,v1,28521
bfc00ef0:	74616428 	jalx	b18590a0 <_mem_end+0x298490a0>
bfc00ef4:	65722061 	0x65722061
bfc00ef8:	65726566 	0x65726566
bfc00efc:	3a65636e 	xori	a1,s3,0x636e
bfc00f00:	616f6c20 	0x616f6c20
bfc00f04:	726f2064 	0x726f2064
bfc00f08:	6f747320 	0x6f747320
bfc00f0c:	00296572 	tlt	at,t1,0x195
bfc00f10:	63737953 	0x63737953
bfc00f14:	206c6c61 	addi	t4,v1,27745
bfc00f18:	65637865 	0x65637865
bfc00f1c:	6f697470 	0x6f697470
bfc00f20:	0000006e 	0x6e
bfc00f24:	61657242 	0x61657242
bfc00f28:	696f706b 	0x696f706b
bfc00f2c:	6520746e 	0x6520746e
bfc00f30:	70656378 	0x70656378
bfc00f34:	6e6f6974 	0x6e6f6974
bfc00f38:	00000000 	nop
bfc00f3c:	65736552 	0x65736552
bfc00f40:	64657672 	0x64657672
bfc00f44:	736e6920 	0x736e6920
bfc00f48:	63757274 	0x63757274
bfc00f4c:	6e6f6974 	0x6e6f6974
bfc00f50:	63786520 	0x63786520
bfc00f54:	69747065 	0x69747065
bfc00f58:	00006e6f 	0x6e6f
bfc00f5c:	72706f43 	0x72706f43
bfc00f60:	7365636f 	0x7365636f
bfc00f64:	20726f73 	addi	s2,v1,28531
bfc00f68:	73756e55 	0x73756e55
bfc00f6c:	656c6261 	0x656c6261
bfc00f70:	63786520 	0x63786520
bfc00f74:	69747065 	0x69747065
bfc00f78:	00006e6f 	0x6e6f
bfc00f7c:	74697241 	jalx	b1a5c904 <_mem_end+0x29a4c904>
bfc00f80:	74656d68 	jalx	b195b5a0 <_mem_end+0x2994b5a0>
bfc00f84:	4f206369 	c3	0x1206369
bfc00f88:	66726576 	0x66726576
bfc00f8c:	20776f6c 	addi	s7,v1,28524
bfc00f90:	65637865 	0x65637865
bfc00f94:	6f697470 	0x6f697470
bfc00f98:	0000006e 	0x6e
bfc00f9c:	70617254 	0x70617254
bfc00fa0:	63786520 	0x63786520
bfc00fa4:	69747065 	0x69747065
bfc00fa8:	00006e6f 	0x6e6f
bfc00fac:	2041534d 	addi	at,v0,21325
bfc00fb0:	616f6c46 	0x616f6c46
bfc00fb4:	676e6974 	0x676e6974
bfc00fb8:	696f502d 	0x696f502d
bfc00fbc:	6520746e 	0x6520746e
bfc00fc0:	70656378 	0x70656378
bfc00fc4:	6e6f6974 	0x6e6f6974
bfc00fc8:	00000000 	nop
bfc00fcc:	20424c54 	addi	v0,v0,19540
bfc00fd0:	64616552 	0x64616552
bfc00fd4:	686e492d 	0x686e492d
bfc00fd8:	74696269 	jalx	b1a589a4 <_mem_end+0x29a489a4>
bfc00fdc:	63786520 	0x63786520
bfc00fe0:	69747065 	0x69747065
bfc00fe4:	00006e6f 	0x6e6f
bfc00fe8:	20424c54 	addi	v0,v0,19540
bfc00fec:	63657845 	0x63657845
bfc00ff0:	6f697475 	0x6f697475
bfc00ff4:	6e492d6e 	0x6e492d6e
bfc00ff8:	69626968 	0x69626968
bfc00ffc:	78652074 	0x78652074
bfc01000:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc01004:	006e6f69 	0x6e6f69
bfc01008:	43544157 	c0	0x1544157
bfc0100c:	00000048 	0x48
bfc01010:	6863614d 	0x6863614d
bfc01014:	20656e69 	addi	a1,v1,28265
bfc01018:	63656863 	0x63656863
bfc0101c:	0000006b 	0x6b
bfc01020:	65726854 	0x65726854
bfc01024:	41206461 	0x41206461
bfc01028:	636f6c6c 	0x636f6c6c
bfc0102c:	6f697461 	0x6f697461
bfc01030:	44202c6e 	0x44202c6e
bfc01034:	6c6c6165 	0x6c6c6165
bfc01038:	7461636f 	jalx	b1858dbc <_mem_end+0x29848dbc>
bfc0103c:	2c6e6f69 	sltiu	t6,v1,28521
bfc01040:	20726f20 	addi	s2,v1,28448
bfc01044:	65686353 	0x65686353
bfc01048:	696c7564 	0x696c7564
bfc0104c:	4520676e 	0x4520676e
bfc01050:	70656378 	0x70656378
bfc01054:	6e6f6974 	0x6e6f6974
bfc01058:	00000073 	tltu	zero,zero,0x1
bfc0105c:	68636143 	0x68636143
bfc01060:	72652065 	0x72652065
bfc01064:	00726f72 	tlt	v1,s2,0x1bd

bfc01068 <EXCEPTION_MESSAGES>:
bfc01068:	bfc00df4 	cache	0x0,3572(s8)
bfc0106c:	bfc00e00 	cache	0x0,3584(s8)
bfc01070:	bfc00e1c 	cache	0x0,3612(s8)
bfc01074:	bfc00e48 	cache	0x0,3656(s8)
bfc01078:	bfc00e60 	cache	0x0,3680(s8)
bfc0107c:	bfc00e94 	cache	0x0,3732(s8)
bfc01080:	bfc00eb4 	cache	0x0,3764(s8)
bfc01084:	bfc00edc 	cache	0x0,3804(s8)
bfc01088:	bfc00f10 	cache	0x0,3856(s8)
bfc0108c:	bfc00f24 	cache	0x0,3876(s8)
bfc01090:	bfc00f3c 	cache	0x0,3900(s8)
bfc01094:	bfc00f5c 	cache	0x0,3932(s8)
bfc01098:	bfc00f7c 	cache	0x0,3964(s8)
bfc0109c:	bfc00f9c 	cache	0x0,3996(s8)
bfc010a0:	bfc00fac 	cache	0x0,4012(s8)
bfc010a4:	bfc00fb0 	cache	0x0,4016(s8)
bfc010a8:	bfc00dd8 	cache	0x0,3544(s8)
bfc010ac:	bfc00dd8 	cache	0x0,3544(s8)
bfc010b0:	bfc00dd8 	cache	0x0,3544(s8)
bfc010b4:	bfc00fcc 	cache	0x0,4044(s8)
bfc010b8:	bfc00fe8 	cache	0x0,4072(s8)
bfc010bc:	bfc00dd8 	cache	0x0,3544(s8)
bfc010c0:	bfc00dd8 	cache	0x0,3544(s8)
bfc010c4:	bfc01008 	cache	0x0,4104(s8)
bfc010c8:	bfc01010 	cache	0x0,4112(s8)
bfc010cc:	bfc01020 	cache	0x0,4128(s8)
bfc010d0:	bfc00dd8 	cache	0x0,3544(s8)
bfc010d4:	bfc00dd8 	cache	0x0,3544(s8)
bfc010d8:	bfc00dd8 	cache	0x0,3544(s8)
bfc010dc:	bfc00dd8 	cache	0x0,3544(s8)
bfc010e0:	bfc0105c 	cache	0x0,4188(s8)
bfc010e4:	bfc00dd8 	cache	0x0,3544(s8)
bfc010e8:	01200000 	0x1200000
bfc010ec:	02000101 	0x2000101
	...
bfc010f8:	00000001 	movf	zero,zero,$fcc0
bfc010fc:	00000000 	nop

Disassembly of section .bss:

88000000 <_bss>:
	...

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	00000f41 	0xf41
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	756e6700 	jalx	5b99c00 <_mem_avail_start-0x7a466400>
   8:	00070100 	sll	zero,a3,0x4
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	02040000 	0x2040000

Disassembly of section .debug_info:

00000000 <.debug_info>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
       0:	0000017a 	0x17a
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	00000004 	sllv	zero,zero,zero
       8:	01040000 	0x1040000
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
       c:	000000fc 	0xfc
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	00005804 	sllv	t3,zero,zero
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	00004800 	sll	t1,zero,0x0
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	07040200 	0x7040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	0000006e 	0x6e
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	00002503 	sra	a0,zero,0x14
      30:	07040200 	0x7040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	00000069 	0x69
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	0000f504 	0xf504
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	d1030200 	0xd1030200
      40:	c0000000 	ll	zero,0(zero)
      44:	84bfc004 	lh	ra,-16380(a1)
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
#else
    const char *s = src;
    char *d = dst;
    if (s < d && s + n > d) {
        s += n, d += n;
        while (n -- > 0) {
      48:	01000000 	0x1000000
      4c:	0000d19c 	0xd19c
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	656d0500 	0x656d0500
      54:	0502006d 	bltzl	t0,20c <_mem_avail_start-0x7ffffdf4>
      58:	000000de 	0xde
      5c:	80808080 	lb	zero,-32640(a0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
        }
    } else {
        while (n -- > 0) {
            *d ++ = *s ++;
      60:	00000678 	0x678
      64:	00780000 	0x780000
      68:	69070000 	0x69070000
      6c:	d1060200 	0xd1060200
	...
      78:	00001808 	0x1808
      7c:	00690700 	0x690700
      80:	00d10802 	0xd10802
      84:	00470000 	0x470000
      88:	ea090000 	swc2	$9,0(s0)
      8c:	fc000000 	sdc3	$0,0(zero)
      90:	30bfc004 	andi	ra,a1,0xc004
      94:	02000000 	0x2000000
      98:	0000c00a 	movz	t8,zero,zero
      9c:	00fa0a00 	0xfa0a00
      a0:	00820000 	0x820000
      a4:	0c0b0000 	jal	2c0000 <_mem_avail_start-0x7fd40000>
      a8:	04bfc005 	0x4bfc005
      ac:	0c000001 	jal	4 <_mem_avail_start-0x7ffffffc>
      b0:	bfc0053c 	cache	0x0,1340(s8)
      b4:	0000013d 	0x13d
      b8:	0254010d 	break	0x254,0x4
      bc:	00003008 	0x3008
      c0:	c005180c 	ll	a1,6156(zero)
      c4:	00013dbf 	0x13dbf
      c8:	54010d00 	bnel	zero,at,34cc <_mem_avail_start-0x7fffcb34>
      cc:	00003a01 	0x3a01
      d0:	05040e00 	0x5040e00
      d4:	00746e69 	0x746e69
      d8:	00e3040f 	0xe3040f
      dc:	d8100000 	ldc2	$16,0(zero)
      e0:	02000000 	0x2000000
      e4:	00bf0801 	0xbf0801
      e8:	db110000 	ldc2	$17,0(t8)
      ec:	01000001 	movf	zero,t0,$fcc0
      f0:	0001ef4b 	0x1ef4b
      f4:	01040300 	0x1040300
      f8:	76120000 	jalx	8480000 <_mem_avail_start-0x77b80000>
      fc:	d14b0100 	0xd14b0100
     100:	00000000 	nop
     104:	00007b13 	0x7b13
     108:	cd420100 	pref	0x2,256(t2)
     10c:	78000000 	0x78000000
     110:	48bfc004 	0x48bfc004
     114:	01000000 	0x1000000
     118:	00013d9c 	0x13d9c
     11c:	00761400 	0x761400
     120:	00254201 	0x254201
     124:	00ac0000 	0xac0000
     128:	a40b0000 	sh	t3,0(zero)
     12c:	04bfc004 	0x4bfc004
     130:	15000001 	bnez	t0,138 <_mem_avail_start-0x7ffffec8>
     134:	bfc004b8 	cache	0x0,1208(s8)
     138:	0000013d 	0x13d
     13c:	00981300 	0x981300
     140:	13010000 	beq	t8,at,144 <_mem_avail_start-0x7ffffebc>
     144:	000000a9 	0xa9
     148:	bfc00450 	cache	0x0,1104(s8)
     14c:	00000028 	0x28
     150:	01729c01 	0x1729c01
     154:	63160000 	0x63160000
     158:	e3130100 	sc	s3,256(t8)
     15c:	01000000 	0x1000000
     160:	00ef1754 	0xef1754
     164:	15010000 	bne	t0,at,168 <_mem_avail_start-0x7ffffe98>
     168:	00000178 	0x178
     16c:	98808080 	lwr	zero,-32640(a0)
     170:	040f007a 	0x40f007a
     174:	0000002c 	0x2c
     178:	00017210 	0x17210
     17c:	00220000 	0x220000
     180:	00020000 	sll	zero,v0,0x0
     184:	0000013a 	0x13a
     188:	00c90104 	0xc90104
     18c:	00000000 	nop
     190:	0450bfc0 	bltzal	v0,ffff0094 <_text_end+0x403eef94>
     194:	0208bfc0 	0x208bfc0
     198:	021a0000 	0x21a0000
     19c:	02550000 	0x2550000
     1a0:	80010000 	lb	at,0(zero)
     1a4:	0000056c 	0x56c
     1a8:	014e0004 	sllv	zero,t6,t2
     1ac:	01040000 	0x1040000
     1b0:	0000035b 	0x35b
     1b4:	0004880c 	syscall	0x1220
     1b8:	00000000 	nop
     1bc:	0000b800 	sll	s7,zero,0x0
     1c0:	00000000 	nop
     1c4:	00016000 	sll	t4,at,0x0
     1c8:	07040200 	0x7040200
     1cc:	0000006e 	0x6e
     1d0:	69070402 	0x69070402
     1d4:	03000000 	0x3000000
     1d8:	00000468 	0x468
     1dc:	00250f02 	ror	at,a1,0x1c
     1e0:	01020000 	0x1020000
     1e4:	0000c806 	srlv	t9,zero,zero
     1e8:	003e0400 	0x3e0400
     1ec:	01020000 	0x1020000
     1f0:	0000c106 	0xc106
     1f4:	05020200 	bltzl	t0,9f8 <_mem_avail_start-0x7ffff608>
     1f8:	0000044b 	0x44b
     1fc:	69050405 	0x69050405
     200:	0200746e 	0x200746e
     204:	04710504 	bgezal	v1,1618 <_mem_avail_start-0x7fffe9e8>
     208:	48030000 	mfc2	v1,$0
     20c:	03000003 	0x3000003
     210:	00007109 	0x7109
     214:	08010200 	j	40800 <_mem_avail_start-0x7ffbf800>
     218:	000000bf 	0xbf
     21c:	00045f03 	sra	t3,a0,0x1c
     220:	830a0300 	lb	t2,768(t8)
     224:	02000000 	0x2000000
     228:	02d30702 	0x2d30702
     22c:	c3030000 	ll	v1,0(t8)
     230:	04000002 	bltz	zero,23c <_mem_avail_start-0x7ffffdc4>
     234:	0000660b 	0x660b
     238:	06a80300 	tgei	s5,768
     23c:	0d040000 	jal	4100000 <_mem_avail_start-0x7bf00000>
     240:	00000033 	tltu	zero,zero
     244:	0000b006 	srlv	s6,zero,zero
     248:	0000b000 	sll	s6,zero,0x0
     24c:	00250700 	0x250700
     250:	001f0000 	sll	zero,ra,0x0
     254:	00450408 	0x450408
     258:	6e090000 	0x6e090000
     25c:	05000002 	bltz	t0,268 <_mem_avail_start-0x7ffffd98>
     260:	0000a007 	srav	s4,zero,zero
     264:	68030500 	0x68030500
     268:	0abfc010 	j	aff0040 <_mem_avail_start-0x7500ffc0>
     26c:	242a05a4 	addiu	t2,at,1444
     270:	0b000001 	j	c000004 <_mem_avail_start-0x73fffffc>
     274:	00000340 	sll	zero,zero,0xd
     278:	01242b05 	0x1242b05
     27c:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     280:	0000029b 	0x29b
     284:	00332c05 	0x332c05
     288:	0b100000 	j	c400000 <_mem_avail_start-0x73c00000>
     28c:	00000281 	0x281
     290:	00332d05 	0x332d05
     294:	0b140000 	j	c500000 <_mem_avail_start-0x73b00000>
     298:	00000312 	0x312
     29c:	00332e05 	0x332e05
     2a0:	0b180000 	j	c600000 <_mem_avail_start-0x73a00000>
     2a4:	00000261 	0x261
     2a8:	00332f05 	0x332f05
     2ac:	0b1c0000 	j	c700000 <_mem_avail_start-0x73900000>
     2b0:	00000455 	0x455
     2b4:	00333005 	0x333005
     2b8:	0c200000 	jal	800000 <_mem_avail_start-0x7f800000>
     2bc:	00727067 	0x727067
     2c0:	01343105 	0x1343105
     2c4:	00240000 	0x240000
     2c8:	00003306 	0x3306
     2cc:	00013400 	sll	a2,at,0x10
     2d0:	00250700 	0x250700
     2d4:	00030000 	sll	zero,v1,0x0
     2d8:	00003306 	0x3306
     2dc:	00014400 	sll	t0,at,0x10
     2e0:	00250700 	0x250700
     2e4:	001f0000 	sll	zero,ra,0x0
     2e8:	0004a803 	sra	s5,a0,0x0
     2ec:	c7320500 	lwc1	$f18,1280(t9)
     2f0:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
     2f4:	000002b4 	teq	zero,zero,0xa
     2f8:	008a0601 	0x8a0601
     2fc:	f20d0000 	0xf20d0000
     300:	01000002 	0x1000002
     304:	00008a06 	0x8a06
     308:	032d0e00 	0x32d0e00
     30c:	55010000 	bnel	t0,at,310 <_mem_avail_start-0x7ffffcf0>
     310:	bfc0070c 	cache	0x0,1804(s8)
     314:	000000b4 	teq	zero,zero,0x2
     318:	02a99c01 	0x2a99c01
     31c:	740f0000 	jalx	3c0000 <_mem_avail_start-0x7fc40000>
     320:	55010066 	bnel	t0,at,4bc <_mem_avail_start-0x7ffffb44>
     324:	000002a9 	0x2a9
     328:	000000d8 	0xd8
     32c:	00049e10 	0x49e10
     330:	af550100 	sw	s5,256(k0)
     334:	0f000002 	jal	c000008 <_mem_avail_start-0x73fffff8>
     338:	11000001 	beqz	t0,340 <_mem_avail_start-0x7ffffcc0>
     33c:	bfc0077c 	cache	0x0,1916(s8)
     340:	00000044 	0x44
     344:	00000232 	tlt	zero,zero,0x8
     348:	00031d12 	0x31d12
     34c:	955b0100 	lhu	k1,256(t2)
     350:	30000000 	andi	zero,zero,0x0
     354:	13000001 	beqz	t8,35c <_mem_avail_start-0x7ffffca4>
     358:	00637065 	0x637065
     35c:	00585c01 	0x585c01
     360:	8c140000 	lw	s4,0(zero)
     364:	7c000003 	0x7c000003
     368:	04bfc007 	0x4bfc007
     36c:	01000000 	0x1000000
     370:	0001e15b 	0x1e15b
     374:	077c1500 	0x77c1500
     378:	0004bfc0 	sll	s7,a0,0x1f
     37c:	1a160000 	0x1a160000
     380:	00000005 	0x5
     384:	03a61400 	0x3a61400
     388:	07a00000 	bltz	sp,38c <_mem_avail_start-0x7ffffc74>
     38c:	0004bfc0 	sll	s7,a0,0x1f
     390:	5c010000 	0x5c010000
     394:	00000204 	0x204
     398:	c007a015 	ll	a3,-24555(zero)
     39c:	000004bf 	0x4bf
     3a0:	04ff1600 	0x4ff1600
     3a4:	00000000 	nop
     3a8:	c007b017 	ll	a3,-20457(zero)
     3ac:	000522bf 	0x522bf
     3b0:	00022100 	sll	a0,v0,0x4
     3b4:	54011800 	bnel	zero,at,63b8 <_mem_avail_start-0x7fff9c48>
     3b8:	0da00305 	jal	6800c14 <_mem_avail_start-0x797ff3ec>
     3bc:	0118bfc0 	0x118bfc0
     3c0:	00800255 	0x800255
     3c4:	07b81900 	0x7b81900
     3c8:	052dbfc0 	0x52dbfc0
     3cc:	01180000 	0x1180000
     3d0:	00800254 	0x800254
     3d4:	30170000 	andi	s7,zero,0x0
     3d8:	38bfc007 	xori	ra,a1,0xc007
     3dc:	49000005 	bc2f	3f4 <_mem_avail_start-0x7ffffc0c>
     3e0:	18000002 	blez	zero,3ec <_mem_avail_start-0x7ffffc14>
     3e4:	03055401 	0x3055401
     3e8:	bfc00c1c 	cache	0x0,3100(s8)
     3ec:	07441700 	0x7441700
     3f0:	0538bfc0 	0x538bfc0
     3f4:	02600000 	0x2600000
     3f8:	01180000 	0x1180000
     3fc:	78030554 	0x78030554
     400:	00bfc00d 	break	0xbf,0x300
     404:	c0075017 	ll	a3,20503(zero)
     408:	000543bf 	0x543bf
     40c:	00027800 	sll	t7,v0,0x0
     410:	54011800 	bnel	zero,at,6414 <_mem_avail_start-0x7fff9bec>
     414:	bdad1106 	cache	0xd,4358(t5)
     418:	007df5b7 	0x7df5b7
     41c:	c0075817 	ll	a3,22551(zero)
     420:	000328bf 	0x328bf
     424:	00028c00 	sll	s1,v0,0x10
     428:	54011800 	bnel	zero,at,642c <_mem_avail_start-0x7fff9bd4>
     42c:	00008102 	srl	s0,zero,0x4
     430:	c007601a 	ll	a3,24602(zero)
     434:	0002b6bf 	0x2b6bf
     438:	077c1b00 	0x77c1b00
     43c:	0538bfc0 	0x538bfc0
     440:	01180000 	0x1180000
     444:	dc030554 	ldc3	$3,1364(zero)
     448:	00bfc00d 	break	0xbf,0x300
     44c:	44040800 	mfc1	a0,$f1
     450:	02000001 	movf	zero,s0,$fcc0
     454:	02950201 	0x2950201
     458:	8b1c0000 	lwl	gp,0(t8)
     45c:	01000002 	0x1000002
     460:	c006a445 	ll	a2,-23483(zero)
     464:	000068bf 	0x68bf
     468:	289c0100 	slti	gp,a0,256
     46c:	1d000003 	bgtz	t0,47c <_mem_avail_start-0x7ffffb84>
     470:	00000080 	sll	zero,zero,0x2
     474:	0100691e 	0x100691e
     478:	00006646 	0x6646
     47c:	00014300 	sll	t0,at,0xc
     480:	00981d00 	0x981d00
     484:	7a120000 	0x7a120000
     488:	01000004 	sllv	zero,zero,t0
     48c:	00003347 	0x3347
     490:	00016200 	sll	t4,at,0x8
     494:	03221200 	0x3221200
     498:	47010000 	c1	0x1010000
     49c:	00000033 	tltu	zero,zero
     4a0:	00000175 	0x175
     4a4:	00035012 	0x35012
     4a8:	33470100 	andi	a3,k0,0x100
     4ac:	88000000 	lwl	zero,0(zero)
     4b0:	19000001 	blez	t0,4b8 <_mem_avail_start-0x7ffffb48>
     4b4:	bfc006f0 	cache	0x0,1776(s8)
     4b8:	00000522 	0x522
     4bc:	02540118 	0x2540118
     4c0:	01180081 	0x1180081
     4c4:	7f800255 	0x7f800255
     4c8:	00000000 	nop
     4cc:	0003020e 	0x3020e
     4d0:	0c3e0100 	jal	f80400 <_mem_avail_start-0x7f07fc00>
     4d4:	98bfc006 	lwr	ra,-16378(a1)
     4d8:	01000000 	0x1000000
     4dc:	00038c9c 	0x38c9c
     4e0:	66740f00 	0x66740f00
     4e4:	a93e0100 	swl	s8,256(t1)
     4e8:	9b000002 	lwr	zero,2(t8)
     4ec:	1f000001 	bgtz	t8,4f4 <_mem_avail_start-0x7ffffb0c>
     4f0:	00000068 	0x68
     4f4:	00000378 	0x378
     4f8:	0100691e 	0x100691e
     4fc:	0000583f 	0x583f
     500:	0001c700 	sll	t8,at,0x1c
     504:	06541900 	0x6541900
     508:	0522bfc0 	bltzl	t1,ffff040c <_text_end+0x403ef30c>
     50c:	01180000 	0x1180000
     510:	00830254 	0x830254
     514:	02550118 	0x2550118
     518:	00007f81 	0x7f81
     51c:	c0068419 	ll	a2,-31719(zero)
     520:	000522bf 	0x522bf
     524:	54011800 	bnel	zero,at,6528 <_mem_avail_start-0x7fff9ad8>
     528:	0d040305 	jal	4100c14 <_mem_avail_start-0x7beff3ec>
     52c:	0000bfc0 	sll	s7,zero,0x1f
     530:	0002a920 	0x2a920
     534:	95350100 	lhu	s5,256(t1)
     538:	01000000 	0x1000000
     53c:	000003a6 	0x3a6
     540:	01006e13 	0x1006e13
     544:	00009536 	tne	zero,zero,0x254
     548:	ca200000 	lwc2	$0,0(s1)
     54c:	01000002 	0x1000002
     550:	0000952c 	0x952c
     554:	03c00100 	0x3c00100
     558:	6e130000 	0x6e130000
     55c:	952d0100 	lhu	t5,256(t1)
     560:	00000000 	nop
     564:	0002a31c 	0x2a31c
     568:	440b0100 	0x440b0100
     56c:	c8bfc005 	lwc2	$31,-16379(a1)
     570:	01000000 	0x1000000
     574:	0004ec9c 	0x4ec9c
     578:	042d1200 	0x42d1200
     57c:	18010000 	0x18010000
     580:	00000058 	0x58
     584:	00000209 	0x209
     588:	00049712 	0x49712
     58c:	58210100 	0x58210100
     590:	27000000 	addiu	zero,t8,0
     594:	1a000002 	blez	s0,5a0 <_mem_avail_start-0x7ffffa60>
     598:	bfc00558 	cache	0x0,1368(s8)
     59c:	0000054e 	0x54e
     5a0:	c0056017 	ll	a1,24599(zero)
     5a4:	000543bf 	0x543bf
     5a8:	00040f00 	sll	at,a0,0x1c
     5ac:	54011800 	bnel	zero,at,65b0 <_mem_avail_start-0x7fff9a50>
     5b0:	17003401 	bnez	t8,d5b8 <_mem_avail_start-0x7fff2a48>
     5b4:	bfc0056c 	cache	0x0,1388(s8)
     5b8:	00000538 	0x538
     5bc:	00000426 	0x426
     5c0:	05540118 	0x5540118
     5c4:	c00c1c03 	ll	t4,7171(zero)
     5c8:	881700bf 	lwl	s7,191(zero)
     5cc:	38bfc005 	xori	ra,a1,0xc005
     5d0:	3d000005 	0x3d000005
     5d4:	18000004 	blez	zero,5e8 <_mem_avail_start-0x7ffffa18>
     5d8:	03055401 	0x3055401
     5dc:	bfc00c44 	cache	0x0,3140(s8)
     5e0:	05941700 	0x5941700
     5e4:	0543bfc0 	bgezl	t2,ffff04e8 <_text_end+0x403ef3e8>
     5e8:	04500000 	bltzal	v0,5ec <_mem_avail_start-0x7ffffa14>
     5ec:	01180000 	0x1180000
     5f0:	00350154 	0x350154
     5f4:	c005ac17 	ll	a1,-21481(zero)
     5f8:	000522bf 	0x522bf
     5fc:	00047300 	sll	t6,a0,0xc
     600:	54011800 	bnel	zero,at,6604 <_mem_avail_start-0x7fff99fc>
     604:	0c6c0305 	jal	1b00c14 <_mem_avail_start-0x7e4ff3ec>
     608:	0118bfc0 	0x118bfc0
     60c:	00810255 	0x810255
     610:	02560118 	0x2560118
     614:	17000080 	bnez	t8,818 <_mem_avail_start-0x7ffff7e8>
     618:	bfc005bc 	cache	0x0,1468(s8)
     61c:	00000559 	0x559
     620:	00000492 	0x492
     624:	02540118 	0x2540118
     628:	01180081 	0x1180081
     62c:	18300155 	0x18300155
     630:	80025601 	lb	v0,22017(zero)
     634:	c4170000 	lwc1	$f23,0(zero)
     638:	43bfc005 	c0	0x1bfc005
     63c:	a5000005 	sh	zero,5(t0)
     640:	18000004 	blez	zero,654 <_mem_avail_start-0x7ffff9ac>
     644:	36015401 	ori	at,s0,0x5401
     648:	05cc1a00 	teqi	t6,6656
     64c:	0564bfc0 	0x564bfc0
     650:	e0170000 	sc	s7,0(zero)
     654:	38bfc005 	xori	ra,a1,0xc005
     658:	c5000005 	lwc1	$f0,5(t0)
     65c:	18000004 	blez	zero,670 <_mem_avail_start-0x7ffff990>
     660:	03055401 	0x3055401
     664:	bfc00ca8 	cache	0x0,3240(s8)
     668:	05f82100 	0x5f82100
     66c:	0543bfc0 	bgezl	t2,ffff0570 <_text_end+0x403ef470>
     670:	04d80000 	0x4d80000
     674:	01180000 	0x1180000
     678:	00370154 	0x370154
     67c:	c0060419 	ll	a2,1049(zero)
     680:	000522bf 	0x522bf
     684:	54011800 	bnel	zero,at,6688 <_mem_avail_start-0x7fff9978>
     688:	0cc40305 	jal	3100c14 <_mem_avail_start-0x7ceff3ec>
     68c:	0000bfc0 	sll	s7,zero,0x1f
     690:	0003a622 	0x3a622
     694:	00000000 	nop
     698:	00000c00 	sll	at,zero,0x10
     69c:	079c0100 	0x79c0100
     6a0:	23000005 	addi	zero,t8,5
     6a4:	000003b6 	tne	zero,zero,0xe
     6a8:	22005201 	addi	zero,s0,20993
     6ac:	0000038c 	syscall	0xe
     6b0:	00000000 	nop
     6b4:	0000000c 	syscall
     6b8:	05229c01 	bltzl	t1,fffe76c0 <_text_end+0x403e65c0>
     6bc:	9c230000 	0x9c230000
     6c0:	01000003 	0x1000003
     6c4:	44240052 	0x44240052
     6c8:	44000004 	0x44000004
     6cc:	06000004 	bltz	s0,6e0 <_mem_avail_start-0x7ffff920>
     6d0:	02b9240c 	syscall	0xae490
     6d4:	02b90000 	0x2b90000
     6d8:	4a040000 	c2	0x40000
     6dc:	00048324 	0x48324
     6e0:	00048300 	sll	s0,a0,0xc
     6e4:	240a0600 	li	t2,1536
     6e8:	00000436 	tne	zero,zero,0x10
     6ec:	00000436 	tne	zero,zero,0x10
     6f0:	e6244c04 	swc1	$f4,19460(s1)
     6f4:	e6000002 	swc1	$f0,2(s0)
     6f8:	04000002 	bltz	zero,704 <_mem_avail_start-0x7ffff8fc>
     6fc:	02fb2442 	0x2fb2442
     700:	02fb0000 	0x2fb0000
     704:	15070000 	bne	t0,a3,708 <_mem_avail_start-0x7ffff8f8>
     708:	0000f524 	0xf524
     70c:	0000f500 	sll	s8,zero,0x14
     710:	000a0800 	sll	at,t2,0x0
     714:	000001c2 	srl	zero,zero,0x7
     718:	03370004 	sllv	zero,s7,t9
     71c:	01040000 	0x1040000
     720:	0000035b 	0x35b
     724:	0004c60c 	syscall	0x1318
     728:	0004d500 	sll	k0,a0,0x14
     72c:	00016000 	sll	t4,at,0x0
     730:	00000000 	nop
     734:	0002bd00 	sll	s7,v0,0x14
     738:	03040200 	0x3040200
     73c:	006e0704 	0x6e0704
     740:	04030000 	bgezl	zero,744 <_mem_avail_start-0x7ffff8bc>
     744:	00006907 	0x6907
     748:	04440400 	0x4440400
     74c:	01010000 	0x1010000
     750:	00000185 	0x185
     754:	bfc007c0 	cache	0x0,1984(s8)
     758:	00000224 	0x224
     75c:	01859c01 	0x1859c01
     760:	66050000 	0x66050000
     764:	0100746d 	0x100746d
     768:	00018c01 	0x18c01
     76c:	00024500 	sll	t0,v0,0x14
     770:	69070600 	0x69070600
     774:	85030100 	lh	v1,256(t0)
     778:	7c000001 	0x7c000001
     77c:	07000002 	bltz	t8,788 <_mem_avail_start-0x7ffff878>
     780:	04010063 	b	910 <_mem_avail_start-0x7ffff6f0>
     784:	00000192 	0x192
     788:	000002e4 	0x2e4
     78c:	67726107 	0x67726107
     790:	9e050100 	0x9e050100
     794:	02000001 	movf	zero,s0,$fcc0
     798:	08000003 	j	c <_mem_avail_start-0x7ffffff4>
     79c:	01007061 	0x1007061
     7a0:	00002506 	0x2506
     7a4:	60910200 	0x60910200
     7a8:	01007707 	0x1007707
     7ac:	00018507 	0x18507
     7b0:	00032000 	sll	a0,v1,0x0
     7b4:	04cf0900 	0x4cf0900
     7b8:	10010000 	beq	zero,at,7bc <_mem_avail_start-0x7ffff844>
     7bc:	bfc00844 	cache	0x0,2116(s8)
     7c0:	0001100a 	movz	v0,zero,at
     7c4:	00013600 	sll	a2,at,0x18
     7c8:	05140b00 	0x5140b00
     7cc:	14010000 	bne	zero,at,7d0 <_mem_avail_start-0x7ffff830>
     7d0:	00000185 	0x185
     7d4:	000000c6 	0xc6
     7d8:	b40b0006 	0xb40b0006
     7dc:	01000004 	sllv	zero,zero,t0
     7e0:	00018519 	0x18519
     7e4:	0000d700 	sll	k0,zero,0x1c
     7e8:	0b000600 	j	c001800 <_mem_avail_start-0x73ffe800>
     7ec:	000004bc 	0x4bc
     7f0:	01851e01 	0x1851e01
     7f4:	00e80000 	0xe80000
     7f8:	00060000 	sll	zero,a2,0x0
     7fc:	c008b00c 	ll	t0,-20468(zero)
     800:	0001a4bf 	0x1a4bf
     804:	090c0c00 	j	4303000 <_mem_avail_start-0x7bcfd000>
     808:	01afbfc0 	0x1afbfc0
     80c:	300c0000 	andi	t4,zero,0x0
     810:	babfc009 	swr	ra,-16375(s5)
     814:	0c000001 	jal	4 <_mem_avail_start-0x7ffffffc>
     818:	bfc0094c 	cache	0x0,2380(s8)
     81c:	000001ba 	0x1ba
     820:	c009640d 	ll	t1,25613(zero)
     824:	0001babf 	0x1babf
     828:	00012500 	sll	a0,at,0x14
     82c:	56010e00 	bnel	s0,at,4030 <_mem_avail_start-0x7fffbfd0>
     830:	0e008302 	jal	8020c08 <_mem_avail_start-0x77fdf3f8>
     834:	30015701 	andi	at,zero,0x5701
     838:	09900f00 	j	6403c00 <_mem_avail_start-0x79bfc400>
     83c:	01a4bfc0 	0x1a4bfc0
     840:	010e0000 	0x10e0000
     844:	25080254 	addiu	t0,t0,596
     848:	f0100000 	0xf0100000
     84c:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     850:	000004b4 	teq	zero,zero,0x12
     854:	01851901 	0x1851901
     858:	014c0000 	0x14c0000
     85c:	00060000 	sll	zero,a2,0x0
     860:	c009d411 	ll	t1,-11247(zero)
     864:	000008bf 	0x8bf
     868:	00017a00 	sll	t7,at,0x8
     86c:	04b40b00 	0x4b40b00
     870:	19010000 	0x19010000
     874:	00000185 	0x185
     878:	0000016a 	0x16a
     87c:	dc0f0006 	ldc3	$15,6(zero)
     880:	a4bfc009 	sh	ra,-16375(a1)
     884:	0e000001 	jal	8000004 <_mem_avail_start-0x77fffffc>
     888:	3d015401 	0x3d015401
     88c:	880c0000 	lwl	t4,0(zero)
     890:	a4bfc008 	sh	ra,-16376(a1)
     894:	00000001 	movf	zero,zero,$fcc0
     898:	05041200 	0x5041200
     89c:	00746e69 	0x746e69
     8a0:	01990413 	0x1990413
     8a4:	01030000 	0x1030000
     8a8:	0000c806 	srlv	t9,zero,zero
     8ac:	01921400 	0x1921400
     8b0:	04130000 	bgezall	zero,8b4 <_mem_avail_start-0x7ffff74c>
     8b4:	00000025 	move	zero,zero
     8b8:	0004b415 	0x4b415
     8bc:	0004b400 	sll	s6,a0,0x10
     8c0:	15190100 	bne	t0,t9,cc4 <_mem_avail_start-0x7ffff33c>
     8c4:	00000514 	0x514
     8c8:	00000514 	0x514
     8cc:	bc151401 	cache	0x15,5121(zero)
     8d0:	bc000004 	cache	0x0,4(zero)
     8d4:	01000004 	sllv	zero,zero,t0
     8d8:	014a001e 	0x14a001e
     8dc:	00040000 	sll	zero,a0,0x0
     8e0:	00000441 	0x441
     8e4:	035b0104 	0x35b0104
     8e8:	240c0000 	li	t4,0
     8ec:	d5000005 	ldc1	$f0,5(t0)
     8f0:	70000004 	msub	zero,zero
     8f4:	00000001 	movf	zero,zero,$fcc0
     8f8:	6b000000 	0x6b000000
     8fc:	02000003 	0x2000003
     900:	006e0704 	0x6e0704
     904:	04020000 	bltzl	zero,908 <_mem_avail_start-0x7ffff6f8>
     908:	00006907 	0x6907
     90c:	04bc0300 	0x4bc0300
     910:	01010000 	0x1010000
     914:	0000011d 	0x11d
     918:	bfc009e4 	cache	0x0,2532(s8)
     91c:	000000d8 	0xd8
     920:	011d9c01 	0x11d9c01
     924:	76040000 	jalx	8100000 <_mem_avail_start-0x77f00000>
     928:	24010100 	li	at,256
     92c:	8b000001 	lwl	zero,1(t8)
     930:	04000003 	bltz	zero,940 <_mem_avail_start-0x7ffff6c0>
     934:	01010077 	0x1010077
     938:	0000011d 	0x11d
     93c:	000003d3 	0x3d3
     940:	00045a05 	0x45a05
     944:	1d010100 	0x1d010100
     948:	23000001 	addi	zero,t8,1
     94c:	05000004 	bltz	t0,960 <_mem_avail_start-0x7ffff6a0>
     950:	00000530 	tge	zero,zero,0x14
     954:	011d0101 	0x11d0101
     958:	04650000 	0x4650000
     95c:	69060000 	0x69060000
     960:	1d030100 	0x1d030100
     964:	9f000001 	0x9f000001
     968:	06000004 	bltz	s0,97c <_mem_avail_start-0x7ffff684>
     96c:	0301006a 	0x301006a
     970:	0000011d 	0x11d
     974:	000004c8 	0x4c8
     978:	01006306 	0x1006306
     97c:	00011d04 	0x11d04
     980:	00051700 	sll	v0,a1,0x1c
     984:	75620700 	jalx	5881c00 <_mem_avail_start-0x7a77e400>
     988:	05010066 	bgez	t0,b24 <_mem_avail_start-0x7ffff4dc>
     98c:	0000012b 	0x12b
     990:	7fa89103 	0x7fa89103
     994:	00051e08 	0x51e08
     998:	2c060100 	sltiu	a2,zero,256
     99c:	2a000000 	slti	zero,s0,0
     9a0:	09000005 	j	4000014 <_mem_avail_start-0x7bffffec>
     9a4:	bfc00a14 	cache	0x0,2580(s8)
     9a8:	00000010 	mfhi	zero
     9ac:	000000f8 	0xf8
     9b0:	0004b40a 	0x4b40a
     9b4:	1d0a0100 	0x1d0a0100
     9b8:	e7000001 	swc1	$f0,1(t8)
     9bc:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     9c0:	0a200c00 	j	8803000 <_mem_avail_start-0x777fd000>
     9c4:	0142bfc0 	0x142bfc0
     9c8:	010d0000 	0x10d0000
     9cc:	2d080254 	sltiu	t0,t0,596
     9d0:	8c0e0000 	lw	t6,0(zero)
     9d4:	30bfc00a 	andi	ra,a1,0xc00a
     9d8:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
     9dc:	000004b4 	teq	zero,zero,0x12
     9e0:	011d0a01 	0x11d0a01
     9e4:	01120000 	0x1120000
     9e8:	000b0000 	sll	zero,t3,0x0
     9ec:	c00ab40f 	ll	t2,-19441(zero)
     9f0:	000142bf 	0x142bf
     9f4:	10000000 	b	9f8 <_mem_avail_start-0x7ffff608>
     9f8:	6e690504 	0x6e690504
     9fc:	04020074 	bltzl	zero,bd0 <_mem_avail_start-0x7ffff430>
     a00:	00047105 	0x47105
     a04:	013b1100 	0x13b1100
     a08:	013b0000 	0x13b0000
     a0c:	25120000 	addiu	s2,t0,0
     a10:	3f000000 	0x3f000000
     a14:	06010200 	bgez	s0,1218 <_mem_avail_start-0x7fffede8>
     a18:	000000c8 	0xc8
     a1c:	0004b413 	0x4b413
     a20:	0004b400 	sll	s6,a0,0x10
     a24:	000a0100 	sll	zero,t2,0x4
     a28:	00000416 	0x416
     a2c:	05430004 	bgezl	t2,a40 <_mem_avail_start-0x7ffff5c0>
     a30:	01040000 	0x1040000
     a34:	0000035b 	0x35b
     a38:	0005430c 	syscall	0x150c
     a3c:	0004d500 	sll	k0,a0,0x14
     a40:	00018000 	sll	s0,at,0x0
     a44:	00000000 	nop
     a48:	0003e500 	sll	gp,v1,0x14
     a4c:	03040200 	0x3040200
     a50:	006e0704 	0x6e0704
     a54:	04030000 	bgezl	zero,a58 <_mem_avail_start-0x7ffff5a8>
     a58:	00006907 	0x6907
     a5c:	054c0400 	teqi	t2,1024
     a60:	10020000 	beq	zero,v0,a64 <_mem_avail_start-0x7ffff59c>
     a64:	00000027 	nor	zero,zero,zero
     a68:	00053d05 	0x53d05
     a6c:	01720100 	0x1720100
     a70:	00000000 	nop
     a74:	0000000c 	syscall
     a78:	008e9c01 	0x8e9c01
     a7c:	73060000 	madd	t8,a2
     a80:	01720100 	0x1720100
     a84:	00000025 	move	zero,zero
     a88:	6e075401 	0x6e075401
     a8c:	01720100 	0x1720100
     a90:	00000035 	0x35
     a94:	0000055e 	0x55e
     a98:	00000008 	jr	zero
     a9c:	0001dd00 	sll	k1,at,0x14
     aa0:	54010900 	bnel	zero,at,2ea4 <_mem_avail_start-0x7fffd15c>
     aa4:	09007402 	j	401d008 <_mem_avail_start-0x7bfe2ff8>
     aa8:	75025501 	jalx	4095404 <_mem_avail_start-0x7bf6abfc>
     aac:	56010900 	bnel	s0,at,2eb0 <_mem_avail_start-0x7fffd150>
     ab0:	5501f303 	bnel	t0,at,ffffd6c0 <_text_end+0x403fc5c0>
     ab4:	530a0000 	beql	t8,t2,ab8 <_mem_avail_start-0x7ffff548>
     ab8:	01000005 	0x1000005
     abc:	00ef0166 	0xef0166
     ac0:	00000000 	nop
     ac4:	00400000 	0x400000
     ac8:	9c010000 	0x9c010000
     acc:	000000ef 	0xef
     ad0:	00317607 	0x317607
     ad4:	f6016601 	sdc1	$f1,26113(s0)
     ad8:	8a000000 	lwl	zero,0(s0)
     adc:	07000005 	bltz	t8,af4 <_mem_avail_start-0x7ffff50c>
     ae0:	01003276 	tne	t0,zero,0xc9
     ae4:	00f60166 	0xf60166
     ae8:	05ab0000 	tltiu	t5,0
     aec:	6e070000 	0x6e070000
     af0:	01660100 	0x1660100
     af4:	00000035 	0x35
     af8:	000005cc 	syscall	0x17
     afc:	0031730b 	0x31730b
     b00:	fd016701 	sdc3	$1,26369(t0)
     b04:	01000000 	0x1000000
     b08:	32730b54 	andi	s3,s3,0xb54
     b0c:	01680100 	0x1680100
     b10:	000000fd 	0xfd
     b14:	0c005501 	jal	15404 <_mem_avail_start-0x7ffeabfc>
     b18:	6e690504 	0x6e690504
     b1c:	040d0074 	0x40d0074
     b20:	000000fc 	0xfc
     b24:	0a040d0e 	j	8103438 <_mem_avail_start-0x77efcbc8>
     b28:	03000001 	movf	zero,t8,$fcc0
     b2c:	00c80601 	0xc80601
     b30:	030f0000 	0x30f0000
     b34:	0a000001 	j	8000004 <_mem_avail_start-0x77fffffc>
     b38:	00000535 	0x535
     b3c:	25014301 	addiu	at,t0,17153
     b40:	00000000 	nop
     b44:	70000000 	madd	zero,zero
     b48:	01000000 	0x1000000
     b4c:	0001749c 	0x1749c
     b50:	73640700 	0x73640700
     b54:	43010074 	c0	0x1010074
     b58:	00002501 	0x2501
     b5c:	0005ef00 	sll	sp,a1,0x1c
     b60:	72730700 	0x72730700
     b64:	43010063 	c0	0x1010063
     b68:	0000f601 	0xf601
     b6c:	00060d00 	sll	at,a2,0x14
     b70:	006e0700 	0x6e0700
     b74:	35014301 	ori	at,t0,0x4301
     b78:	47000000 	c1	0x1000000
     b7c:	10000006 	b	b98 <_mem_avail_start-0x7ffff468>
     b80:	47010073 	c1	0x1010073
     b84:	0000fd01 	0xfd01
     b88:	0006cb00 	sll	t9,a2,0xc
     b8c:	00641000 	0x641000
     b90:	74014801 	jalx	52004 <_mem_avail_start-0x7ffadffc>
     b94:	f4000001 	sdc1	$f0,1(zero)
     b98:	00000006 	srlv	zero,zero,zero
     b9c:	0103040d 	break	0x103,0x10
     ba0:	7f0a0000 	0x7f0a0000
     ba4:	01000005 	0x1000005
     ba8:	0025012c 	0x25012c
     bac:	00000000 	nop
     bb0:	002c0000 	0x2c0000
     bb4:	9c010000 	0x9c010000
     bb8:	000001dd 	0x1dd
     bbc:	74736407 	jalx	1cd901c <_mem_avail_start-0x7e326fe4>
     bc0:	012c0100 	0x12c0100
     bc4:	00000025 	move	zero,zero
     bc8:	00000749 	0x749
     bcc:	63727307 	0x63727307
     bd0:	012c0100 	0x12c0100
     bd4:	000000f6 	tne	zero,zero,0x3
     bd8:	00000767 	0x767
     bdc:	01006e07 	0x1006e07
     be0:	0035012c 	0x35012c
     be4:	07880000 	tgei	gp,0
     be8:	730b0000 	madd	t8,t3
     bec:	01300100 	0x1300100
     bf0:	000000fd 	0xfd
     bf4:	64105501 	0x64105501
     bf8:	01310100 	0x1310100
     bfc:	00000174 	teq	zero,zero,0x5
     c00:	000007d2 	0x7d2
     c04:	02fb0a00 	0x2fb0a00
     c08:	11010000 	beq	t0,at,c0c <_mem_avail_start-0x7ffff3f4>
     c0c:	00002501 	0x2501
     c10:	c00abc00 	ll	t2,-17408(zero)
     c14:	000024bf 	0x24bf
     c18:	2e9c0100 	sltiu	gp,s4,256
     c1c:	07000002 	bltz	t8,c28 <_mem_avail_start-0x7ffff3d8>
     c20:	11010073 	beq	t0,at,df0 <_mem_avail_start-0x7ffff210>
     c24:	00002501 	0x2501
     c28:	0007f000 	sll	s8,a3,0x0
     c2c:	00630600 	0x630600
     c30:	03011101 	0x3011101
     c34:	01000001 	movf	zero,t0,$fcc0
     c38:	006e0755 	0x6e0755
     c3c:	35011101 	ori	at,t0,0x1101
     c40:	0e000000 	jal	8000000 <_mem_avail_start-0x78000000>
     c44:	10000008 	b	c68 <_mem_avail_start-0x7ffff398>
     c48:	15010070 	bne	t0,at,e0c <_mem_avail_start-0x7ffff1f4>
     c4c:	00017401 	0x17401
     c50:	00085800 	sll	t3,t0,0x0
     c54:	95110000 	lhu	s1,0(t0)
     c58:	01000005 	0x1000005
     c5c:	000174a3 	0x174a3
     c60:	00000000 	nop
     c64:	00002800 	sll	a1,zero,0x0
     c68:	609c0100 	0x609c0100
     c6c:	12000002 	beqz	s0,c78 <_mem_avail_start-0x7ffff388>
     c70:	a3010073 	sb	at,115(t8)
     c74:	000000fd 	0xfd
     c78:	00000876 	tne	zero,zero,0x21
     c7c:	01006313 	0x1006313
     c80:	000103a3 	0x103a3
     c84:	00550100 	0x550100
     c88:	00056a11 	0x56a11
     c8c:	748f0100 	jalx	23c0400 <_mem_avail_start-0x7dc3fc00>
     c90:	00000001 	movf	zero,zero,$fcc0
     c94:	2c000000 	sltiu	zero,zero,0
     c98:	01000000 	0x1000000
     c9c:	0002929c 	0x2929c
     ca0:	00731200 	0x731200
     ca4:	00fd8f01 	0xfd8f01
     ca8:	08940000 	j	2500000 <_mem_avail_start-0x7db00000>
     cac:	63130000 	0x63130000
     cb0:	038f0100 	0x38f0100
     cb4:	01000001 	movf	zero,t0,$fcc0
     cb8:	8d110055 	lw	s1,85(t0)
     cbc:	01000005 	0x1000005
     cc0:	0000ef7f 	0xef7f
     cc4:	00000000 	nop
     cc8:	00004400 	sll	t0,zero,0x10
     ccc:	d59c0100 	ldc1	$f28,256(t4)
     cd0:	12000002 	beqz	s0,cdc <_mem_avail_start-0x7ffff324>
     cd4:	01003173 	tltu	t0,zero,0xc5
     cd8:	0000fd7f 	0xfd7f
     cdc:	0008bd00 	sll	s7,t0,0x14
     ce0:	32731200 	andi	s3,s3,0x1200
     ce4:	fd7f0100 	sdc3	$31,256(t3)
     ce8:	db000000 	ldc2	$0,0(t8)
     cec:	12000008 	beqz	s0,d10 <_mem_avail_start-0x7ffff2f0>
     cf0:	7f01006e 	0x7f01006e
     cf4:	00000035 	0x35
     cf8:	000008f9 	0x8f9
     cfc:	05781100 	0x5781100
     d00:	68010000 	0x68010000
     d04:	000000ef 	0xef
     d08:	00000000 	nop
     d0c:	00000030 	tge	zero,zero
     d10:	030b9c01 	0x30b9c01
     d14:	73120000 	madd	t8,s2
     d18:	68010031 	0x68010031
     d1c:	000000fd 	0xfd
     d20:	00000938 	0x938
     d24:	00327312 	0x327312
     d28:	00fd6801 	movt	t5,a3,$fcc7
     d2c:	09560000 	j	5580000 <_mem_avail_start-0x7aa80000>
     d30:	11000000 	beqz	t0,d34 <_mem_avail_start-0x7ffff2cc>
     d34:	0000055a 	0x55a
     d38:	01744d01 	0x1744d01
     d3c:	00000000 	nop
     d40:	00340000 	0x340000
     d44:	9c010000 	0x9c010000
     d48:	0000035f 	0x35f
     d4c:	74736412 	jalx	1cd9048 <_mem_avail_start-0x7e326fb8>
     d50:	744d0100 	jalx	1340400 <_mem_avail_start-0x7ecbfc00>
     d54:	74000001 	jalx	4 <_mem_avail_start-0x7ffffffc>
     d58:	12000009 	beqz	s0,d80 <_mem_avail_start-0x7ffff280>
     d5c:	00637273 	tltu	v1,v1,0x1c9
     d60:	00fd4d01 	0xfd4d01
     d64:	09920000 	j	6480000 <_mem_avail_start-0x79b80000>
     d68:	6c120000 	0x6c120000
     d6c:	01006e65 	0x1006e65
     d70:	0000354d 	break	0x0,0xd5
     d74:	0009b000 	sll	s6,t1,0x0
     d78:	00701400 	0x701400
     d7c:	01744e01 	0x1744e01
     d80:	09e50000 	j	7940000 <_mem_avail_start-0x786c0000>
     d84:	11000000 	beqz	t0,d88 <_mem_avail_start-0x7ffff278>
     d88:	00000571 	tgeu	zero,zero,0x15
     d8c:	01743701 	0x1743701
     d90:	00000000 	nop
     d94:	00240000 	0x240000
     d98:	9c010000 	0x9c010000
     d9c:	000003a4 	0x3a4
     da0:	74736412 	jalx	1cd9048 <_mem_avail_start-0x7e326fb8>
     da4:	74370100 	jalx	dc0400 <_mem_avail_start-0x7f23fc00>
     da8:	03000001 	movf	zero,t8,$fcc0
     dac:	1200000a 	beqz	s0,dd8 <_mem_avail_start-0x7ffff228>
     db0:	00637273 	tltu	v1,v1,0x1c9
     db4:	00fd3701 	0xfd3701
     db8:	0a210000 	j	8840000 <_mem_avail_start-0x777c0000>
     dbc:	70140000 	madd	zero,s4
     dc0:	743b0100 	jalx	ec0400 <_mem_avail_start-0x7f13fc00>
     dc4:	3f000001 	0x3f000001
     dc8:	0000000a 	movz	zero,zero,zero
     dcc:	00056211 	0x56211
     dd0:	35220100 	ori	v0,t1,0x100
     dd4:	00000000 	nop
     dd8:	28000000 	slti	zero,zero,0
     ddc:	01000000 	0x1000000
     de0:	0003e79c 	0x3e79c
     de4:	00731200 	0x731200
     de8:	00fd2201 	0xfd2201
     dec:	0a5d0000 	j	9740000 <_mem_avail_start-0x768c0000>
     df0:	6c130000 	0x6c130000
     df4:	01006e65 	0x1006e65
     df8:	00003522 	0x3522
     dfc:	14550100 	bne	v0,s5,1200 <_mem_avail_start-0x7fffee00>
     e00:	00746e63 	0x746e63
     e04:	00352301 	0x352301
     e08:	0aa20000 	j	a880000 <_mem_avail_start-0x75780000>
     e0c:	15000000 	bnez	t0,e10 <_mem_avail_start-0x7ffff1f0>
     e10:	00000586 	0x586
     e14:	00350c01 	0x350c01
     e18:	00000000 	nop
     e1c:	00200000 	0x200000
     e20:	9c010000 	0x9c010000
     e24:	01007312 	0x1007312
     e28:	0000fd0c 	syscall	0x3f4
     e2c:	000ac100 	sll	t8,t2,0x4
     e30:	6e631400 	0x6e631400
     e34:	0d010074 	jal	40401d0 <_mem_avail_start-0x7bfbfe30>
     e38:	00000035 	0x35
     e3c:	00000adf 	0xadf
     e40:	014c0000 	0x14c0000
     e44:	00040000 	sll	zero,a0,0x0
     e48:	00000685 	0x685
     e4c:	035b0104 	0x35b0104
     e50:	9d0c0000 	0x9d0c0000
     e54:	d5000005 	ldc1	$f0,5(t0)
     e58:	08000004 	j	10 <_mem_avail_start-0x7ffffff0>
     e5c:	00000002 	srl	zero,zero,0x0
     e60:	62000000 	0x62000000
     e64:	02000005 	0x2000005
     e68:	006e0704 	0x6e0704
     e6c:	04020000 	bltzl	zero,e70 <_mem_avail_start-0x7ffff190>
     e70:	00006907 	0x6907
     e74:	04830300 	bgezl	a0,1a78 <_mem_avail_start-0x7fffe588>
     e78:	0e010000 	jal	8040000 <_mem_avail_start-0x77fc0000>
     e7c:	000000a2 	0xa2
     e80:	bfc00b40 	cache	0x0,2880(s8)
     e84:	00000030 	tge	zero,zero
     e88:	00a29c01 	0xa29c01
     e8c:	73040000 	madd	t8,a0
     e90:	a90e0100 	swl	t6,256(t0)
     e94:	fe000000 	sdc3	$0,0(s0)
     e98:	0500000a 	bltz	t0,ec4 <_mem_avail_start-0x7ffff13c>
     e9c:	000004b4 	teq	zero,zero,0x12
     ea0:	00a20701 	0xa20701
     ea4:	006a0000 	0x6a0000
     ea8:	00060000 	sll	zero,a2,0x0
     eac:	c00b5007 	ll	t3,20487(zero)
     eb0:	0000bbbf 	0xbbbf
     eb4:	00007f00 	sll	t7,zero,0x1c
     eb8:	54010800 	bnel	zero,at,2ebc <_mem_avail_start-0x7fffd144>
     ebc:	5401f303 	bnel	zero,at,ffffdacc <_text_end+0x403fc9cc>
     ec0:	0b580700 	j	d601c00 <_mem_avail_start-0x729fe400>
     ec4:	0144bfc0 	0x144bfc0
     ec8:	00920000 	0x920000
     ecc:	01080000 	0x1080000
     ed0:	003d0154 	0x3d0154
     ed4:	c00b6009 	ll	t3,24585(zero)
     ed8:	000144bf 	0x144bf
     edc:	54010800 	bnel	zero,at,2ee0 <_mem_avail_start-0x7fffd120>
     ee0:	00003a01 	0x3a01
     ee4:	6905040a 	0x6905040a
     ee8:	0b00746e 	j	c01d1b8 <_mem_avail_start-0x73fe2e48>
     eec:	0000b604 	0xb604
     ef0:	06010200 	bgez	s0,16f4 <_mem_avail_start-0x7fffe90c>
     ef4:	000000c8 	0xc8
     ef8:	0000af0c 	syscall	0x2bc
     efc:	05140300 	0x5140300
     f00:	01010000 	0x1010000
     f04:	000000a2 	0xa2
     f08:	bfc00ae0 	cache	0x0,2784(s8)
     f0c:	00000060 	0x60
     f10:	01449c01 	0x1449c01
     f14:	73040000 	madd	t8,a0
     f18:	a9010100 	swl	at,256(t0)
     f1c:	1f000000 	bgtz	t8,f20 <_mem_avail_start-0x7ffff0e0>
     f20:	0d00000b 	jal	400002c <_mem_avail_start-0x7bffffd4>
     f24:	03010063 	0x3010063
     f28:	000000af 	0xaf
     f2c:	00000b48 	0xb48
     f30:	0001f00e 	0x1f00e
     f34:	04b40500 	0x4b40500
     f38:	07010000 	bgez	t8,f3c <_mem_avail_start-0x7ffff0c4>
     f3c:	000000a2 	0xa2
     f40:	00000104 	0x104
     f44:	280f0006 	slti	t7,zero,6
     f48:	08bfc00b 	j	2ff002c <_mem_avail_start-0x7d00ffd4>
     f4c:	32000000 	andi	zero,s0,0x0
     f50:	05000001 	bltz	t0,f58 <_mem_avail_start-0x7ffff0a8>
     f54:	000004b4 	teq	zero,zero,0x12
     f58:	00a20701 	0xa20701
     f5c:	01220000 	0x1220000
     f60:	00060000 	sll	zero,a2,0x0
     f64:	c00b3009 	ll	t3,12297(zero)
     f68:	000144bf 	0x144bf
     f6c:	54010800 	bnel	zero,at,2f70 <_mem_avail_start-0x7fffd090>
     f70:	00003d01 	0x3d01
     f74:	c00b3809 	ll	t3,14345(zero)
     f78:	000144bf 	0x144bf
     f7c:	54010800 	bnel	zero,at,2f80 <_mem_avail_start-0x7fffd080>
     f80:	00008002 	srl	s0,zero,0x0
     f84:	b4100000 	0xb4100000
     f88:	b4000004 	0xb4000004
     f8c:	01000004 	sllv	zero,zero,t0
     f90:	00b20007 	srav	zero,s2,a1
     f94:	00040000 	sll	zero,a0,0x0
     f98:	00000758 	0x758
     f9c:	035b0104 	0x35b0104
     fa0:	b10c0000 	0xb10c0000
     fa4:	d5000005 	ldc1	$f0,5(t0)
     fa8:	20000004 	addi	zero,zero,4
     fac:	00000002 	srl	zero,zero,0x0
     fb0:	b5000000 	0xb5000000
     fb4:	02000005 	0x2000005
     fb8:	006e0704 	0x6e0704
     fbc:	04020000 	bltzl	zero,fc0 <_mem_avail_start-0x7ffff040>
     fc0:	00006907 	0x6907
     fc4:	06010200 	bgez	s0,17c8 <_mem_avail_start-0x7fffe838>
     fc8:	000000c1 	0xc1
     fcc:	4b050202 	c2	0x1050202
     fd0:	03000004 	sllv	zero,zero,t8
     fd4:	6e690504 	0x6e690504
     fd8:	04020074 	bltzl	zero,11ac <_mem_avail_start-0x7fffee54>
     fdc:	00047105 	0x47105
     fe0:	03480400 	0x3480400
     fe4:	09020000 	j	4080000 <_mem_avail_start-0x7bf80000>
     fe8:	0000005a 	0x5a
     fec:	bf080102 	cache	0x8,258(t8)
     ff0:	02000000 	0x2000000
     ff4:	02d30702 	0x2d30702
     ff8:	c3040000 	ll	a0,0(t8)
     ffc:	03000002 	0x3000002
    1000:	00004f0b 	0x4f0b
    1004:	04b40500 	0x4b40500
    1008:	03010000 	0x3010000
    100c:	00000041 	0x41
    1010:	bfc00b70 	cache	0x0,2928(s8)
    1014:	0000002c 	0x2c
    1018:	00aa9c01 	0xaa9c01
    101c:	63060000 	0x63060000
    1020:	41030100 	bc0tl	1424 <_mem_avail_start-0x7fffebdc>
    1024:	66000000 	0x66000000
    1028:	0700000b 	bltz	t8,1058 <_mem_avail_start-0x7fffefa8>
    102c:	bfc00b88 	cache	0x0,2952(s8)
    1030:	000000aa 	0xaa
    1034:	02540108 	0x2540108
    1038:	00000080 	sll	zero,zero,0x2
    103c:	0005a409 	0x5a409
    1040:	0005a400 	sll	s4,a1,0x10
    1044:	00460300 	0x460300
    1048:	00000b3b 	0xb3b
    104c:	07e20004 	bltzl	ra,1060 <_mem_avail_start-0x7fffefa0>
    1050:	01040000 	0x1040000
    1054:	000000fc 	0xfc
    1058:	0006ec04 	0x6ec04
    105c:	0004d500 	sll	k0,a0,0x14
    1060:	00024800 	sll	t1,v0,0x0
    1064:	00000000 	nop
    1068:	00061200 	sll	v0,a2,0x8
    106c:	03040200 	0x3040200
    1070:	006e0704 	0x6e0704
    1074:	27040000 	addiu	a0,t8,0
    1078:	03000000 	0x3000000
    107c:	00690704 	0x690704
    1080:	33040000 	andi	a0,t8,0x0
    1084:	05000000 	bltz	t0,1088 <_mem_avail_start-0x7fffef78>
    1088:	00000468 	0x468
    108c:	00270f02 	ror	at,a3,0x1c
    1090:	01030000 	0x1030000
    1094:	0000c106 	0xc106
    1098:	05020300 	bltzl	t0,1c9c <_mem_avail_start-0x7fffe364>
    109c:	0000044b 	0x44b
    10a0:	69050406 	0x69050406
    10a4:	0300746e 	0x300746e
    10a8:	04710504 	bgezal	v1,24bc <_mem_avail_start-0x7fffdb44>
    10ac:	48050000 	mfc2	a1,$0
    10b0:	03000003 	0x3000003
    10b4:	00007109 	0x7109
    10b8:	08010300 	j	40c00 <_mem_avail_start-0x7ffbf400>
    10bc:	000000bf 	0xbf
    10c0:	00007104 	0x7104
    10c4:	045f0500 	0x45f0500
    10c8:	0a030000 	j	80c0000 <_mem_avail_start-0x77f40000>
    10cc:	00000088 	0x88
    10d0:	d3070203 	0xd3070203
    10d4:	04000002 	bltz	zero,10e0 <_mem_avail_start-0x7fffef20>
    10d8:	00000088 	0x88
    10dc:	00061005 	0x61005
    10e0:	330c0300 	andi	t4,t8,0x300
    10e4:	05000000 	bltz	t0,10e8 <_mem_avail_start-0x7fffef18>
    10e8:	000002c3 	sra	zero,zero,0xb
    10ec:	00660b04 	0x660b04
    10f0:	76050000 	jalx	8140000 <_mem_avail_start-0x77ec0000>
    10f4:	04000007 	bltz	zero,1114 <_mem_avail_start-0x7fffeeec>
    10f8:	00007d0c 	syscall	0x1f4
    10fc:	06a80500 	tgei	s5,1280
    1100:	0d040000 	jal	4100000 <_mem_avail_start-0x7bf00000>
    1104:	0000003f 	0x3f
    1108:	0006a705 	0x6a705
    110c:	940e0400 	lhu	t6,1024(zero)
    1110:	07000000 	bltz	t8,1114 <_mem_avail_start-0x7fffeeec>
    1114:	00000659 	0x659
    1118:	06390a01 	0x6390a01
    111c:	04010000 	b	1120 <_mem_avail_start-0x7fffeee0>
    1120:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    1124:	00330054 	0x330054
    1128:	69090000 	0x69090000
    112c:	01000002 	0x1000002
    1130:	0000250a 	0x250a
    1134:	05f10900 	bgezal	t7,3538 <_mem_avail_start-0x7fffcac8>
    1138:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    113c:	00000033 	tltu	zero,zero
    1140:	7274700a 	0x7274700a
    1144:	040b0100 	tltiu	zero,256
    1148:	00000001 	movf	zero,zero,$fcc0
    114c:	003a040b 	0x3a040b
    1150:	88070000 	lwl	a3,0(zero)
    1154:	01000007 	srav	zero,zero,t0
    1158:	0005c70a 	0x5c70a
    115c:	01430100 	0x1430100
    1160:	54080000 	bnel	zero,t0,1164 <_mem_avail_start-0x7fffee9c>
    1164:	00002700 	sll	a0,zero,0x1c
    1168:	02690900 	0x2690900
    116c:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    1170:	00000025 	move	zero,zero
    1174:	0005f109 	0x5f109
    1178:	270a0100 	addiu	t2,t8,256
    117c:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    1180:	00727470 	tge	v1,s2,0x1d1
    1184:	01430b01 	0x1430b01
    1188:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
    118c:	00002e04 	0x2e04
    1190:	06be0700 	0x6be0700
    1194:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    1198:	00000727 	0x727
    119c:	00018201 	0x18201
    11a0:	00540800 	0x540800
    11a4:	00000088 	0x88
    11a8:	00026909 	0x26909
    11ac:	250a0100 	addiu	t2,t0,256
    11b0:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    11b4:	000005f1 	tgeu	zero,zero,0x17
    11b8:	00880a01 	0x880a01
    11bc:	700a0000 	madd	zero,t2
    11c0:	01007274 	teq	t0,zero,0x1c9
    11c4:	0001820b 	0x1820b
    11c8:	040b0000 	tltiu	zero,0
    11cc:	0000008f 	sync	0x2
    11d0:	00061907 	0x61907
    11d4:	030a0100 	0x30a0100
    11d8:	01000007 	srav	zero,zero,t0
    11dc:	000001c1 	0x1c1
    11e0:	71005408 	0x71005408
    11e4:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    11e8:	00000269 	0x269
    11ec:	00250a01 	0x250a01
    11f0:	f1090000 	0xf1090000
    11f4:	01000005 	0x1000005
    11f8:	0000710a 	0x710a
    11fc:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    1200:	0b010072 	j	c0401c8 <_mem_avail_start-0x73fbfe38>
    1204:	000001c1 	0x1c1
    1208:	78040b00 	0x78040b00
    120c:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    1210:	0000067e 	0x67e
    1214:	06010401 	bgez	s0,221c <_mem_avail_start-0x7fffdde4>
    1218:	00330000 	0x330000
    121c:	f9010000 	sdc2	$1,0(t0)
    1220:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    1224:	00330054 	0x330054
    1228:	69090000 	0x69090000
    122c:	01000002 	0x1000002
    1230:	00002504 	0x2504
    1234:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    1238:	05010072 	bgez	t0,1404 <_mem_avail_start-0x7fffebfc>
    123c:	00000104 	0x104
    1240:	07140c00 	0x7140c00
    1244:	04010000 	b	1248 <_mem_avail_start-0x7fffedb8>
    1248:	00000738 	0x738
    124c:	00000027 	nor	zero,zero,zero
    1250:	00022b01 	0x22b01
    1254:	00540800 	0x540800
    1258:	00000027 	nor	zero,zero,zero
    125c:	00026909 	0x26909
    1260:	25040100 	addiu	a0,t0,256
    1264:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    1268:	00727470 	tge	v1,s2,0x1d1
    126c:	01430501 	0x1430501
    1270:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    1274:	0000075d 	0x75d
    1278:	064a0401 	tlti	s2,1025
    127c:	00880000 	0x880000
    1280:	5d010000 	0x5d010000
    1284:	08000002 	j	8 <_mem_avail_start-0x7ffffff8>
    1288:	00880054 	0x880054
    128c:	69090000 	0x69090000
    1290:	01000002 	0x1000002
    1294:	00002504 	0x2504
    1298:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    129c:	05010072 	bgez	t0,1468 <_mem_avail_start-0x7fffeb98>
    12a0:	00000182 	srl	zero,zero,0x6
    12a4:	06d80c00 	0x6d80c00
    12a8:	04010000 	b	12ac <_mem_avail_start-0x7fffed54>
    12ac:	000006af 	0x6af
    12b0:	00000071 	tgeu	zero,zero,0x1
    12b4:	00028f01 	0x28f01
    12b8:	00540800 	0x540800
    12bc:	00000071 	tgeu	zero,zero,0x1
    12c0:	00026909 	0x26909
    12c4:	25040100 	addiu	a0,t0,256
    12c8:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    12cc:	00727470 	tge	v1,s2,0x1d1
    12d0:	01c10501 	0x1c10501
    12d4:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    12d8:	000005d8 	0x5d8
    12dc:	00b54a01 	0xb54a01
    12e0:	00000000 	nop
    12e4:	00140000 	sll	zero,s4,0x0
    12e8:	9c010000 	0x9c010000
    12ec:	000002ef 	0x2ef
    12f0:	0009380e 	0x9380e
    12f4:	00000000 	nop
    12f8:	00000c00 	sll	at,zero,0x10
    12fc:	0f4b0100 	jal	d2c0400 <_mem_avail_start-0x72d3fc00>
    1300:	00000948 	0x948
    1304:	00000b8f 	0xb8f
    1308:	0001f90e 	0x1f90e
    130c:	00000000 	nop
    1310:	00000c00 	sll	at,zero,0x10
    1314:	0f1c0100 	jal	c700400 <_mem_avail_start-0x738ffc00>
    1318:	00000214 	0x214
    131c:	00000b8f 	0xb8f
    1320:	00000010 	mfhi	zero
    1324:	00000c00 	sll	at,zero,0x10
    1328:	021f1100 	0x21f1100
    132c:	e0a00000 	sc	zero,0(a1)
    1330:	007bffc3 	0x7bffc3
    1334:	12000000 	beqz	s0,1338 <_mem_avail_start-0x7fffecc8>
    1338:	00000436 	tne	zero,zero,0x10
    133c:	0c084601 	jal	211804 <_mem_avail_start-0x7fdee7fc>
    1340:	0014bfc0 	sll	s7,s4,0x1f
    1344:	9c010000 	0x9c010000
    1348:	0000036a 	0x36a
    134c:	0005f113 	0x5f113
    1350:	b5460100 	0xb5460100
    1354:	01000000 	0x1000000
    1358:	087e0e54 	j	1f83950 <_mem_avail_start-0x7e07c6b0>
    135c:	0c080000 	jal	200000 <_mem_avail_start-0x7fe00000>
    1360:	000cbfc0 	sll	s7,t4,0x1f
    1364:	47010000 	c1	0x1010000
    1368:	0008950f 	0x8950f
    136c:	000ba700 	sll	s4,t3,0x1c
    1370:	088a0f00 	j	2283c00 <_mem_avail_start-0x7dd7c400>
    1374:	0bba0000 	j	ee80000 <_mem_avail_start-0x71180000>
    1378:	0a0e0000 	j	8380000 <_mem_avail_start-0x77c80000>
    137c:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    1380:	0cbfc00c 	jal	2ff0030 <_mem_avail_start-0x7d00ffd0>
    1384:	01000000 	0x1000000
    1388:	012c0f1d 	0x12c0f1d
    138c:	0ba70000 	j	e9c0000 <_mem_avail_start-0x71640000>
    1390:	210f0000 	addi	t7,t0,0
    1394:	ba000001 	swr	zero,1(s0)
    1398:	1000000b 	b	13c8 <_mem_avail_start-0x7fffec38>
    139c:	bfc00c08 	cache	0x0,3080(s8)
    13a0:	0000000c 	syscall
    13a4:	00013711 	0x13711
    13a8:	c3e09000 	ll	zero,-28672(ra)
    13ac:	00007bff 	0x7bff
    13b0:	b9120000 	swr	s2,0(t0)
    13b4:	01000002 	0x1000002
    13b8:	c00bf442 	ll	t3,-3006(zero)
    13bc:	000014bf 	0x14bf
    13c0:	e59c0100 	swc1	$f28,256(t4)
    13c4:	13000003 	beqz	t8,13d4 <_mem_avail_start-0x7fffec2c>
    13c8:	000005f1 	tgeu	zero,zero,0x17
    13cc:	00aa4201 	0xaa4201
    13d0:	54010000 	bnel	zero,at,13d4 <_mem_avail_start-0x7fffec2c>
    13d4:	0008a10e 	0x8a10e
    13d8:	c00bf400 	ll	t3,-3072(zero)
    13dc:	00000cbf 	0xcbf
    13e0:	0f430100 	jal	d0c0400 <_mem_avail_start-0x72f3fc00>
    13e4:	000008b8 	0x8b8
    13e8:	00000bd2 	0xbd2
    13ec:	0008ad0f 	0x8ad0f
    13f0:	000be500 	sll	gp,t3,0x14
    13f4:	01490e00 	0x1490e00
    13f8:	0bf40000 	j	fd00000 <_mem_avail_start-0x70300000>
    13fc:	000cbfc0 	sll	s7,t4,0x1f
    1400:	1d010000 	0x1d010000
    1404:	00016b0f 	0x16b0f
    1408:	000bd200 	sll	k0,t3,0x8
    140c:	01600f00 	0x1600f00
    1410:	0be50000 	j	f940000 <_mem_avail_start-0x706c0000>
    1414:	f4100000 	sdc1	$f16,0(zero)
    1418:	0cbfc00b 	jal	2ff002c <_mem_avail_start-0x7d00ffd4>
    141c:	11000000 	beqz	t0,1420 <_mem_avail_start-0x7fffebe0>
    1420:	00000176 	tne	zero,zero,0x5
    1424:	ffc3e080 	sdc3	$3,-8064(s8)
    1428:	0000007b 	0x7b
    142c:	06960d00 	0x6960d00
    1430:	39010000 	xori	at,t0,0x0
    1434:	000000b5 	0xb5
    1438:	00000000 	nop
    143c:	00000048 	0x48
    1440:	04329c01 	bltzall	at,fffe8448 <_text_end+0x403e7348>
    1444:	58140000 	0x58140000
    1448:	01000007 	srav	zero,zero,t0
    144c:	0000b53a 	0xb53a
    1450:	000bfd00 	sll	ra,t3,0x14
    1454:	00001500 	sll	v0,zero,0x14
    1458:	04ef0000 	0x4ef0000
    145c:	00150000 	sll	zero,s5,0x0
    1460:	ef000000 	swc3	$0,0(t8)
    1464:	15000004 	bnez	t0,1478 <_mem_avail_start-0x7fffeb88>
    1468:	00000000 	nop
    146c:	000004ef 	0x4ef
    1470:	00000015 	0x15
    1474:	0004ef00 	sll	sp,a0,0x1c
    1478:	a4120000 	sh	s2,0(zero)
    147c:	01000005 	0x1000005
    1480:	c00bd434 	ll	t3,-11212(zero)
    1484:	000020bf 	0x20bf
    1488:	ef9c0100 	swc3	$28,256(gp)
    148c:	13000004 	beqz	t8,14a0 <_mem_avail_start-0x7fffeb60>
    1490:	000005f1 	tgeu	zero,zero,0x17
    1494:	009f3401 	0x9f3401
    1498:	54010000 	bnel	zero,at,149c <_mem_avail_start-0x7fffeb64>
    149c:	0009a116 	0x9a116
    14a0:	c00bd400 	ll	t3,-11264(zero)
    14a4:	000008bf 	0x8bf
    14a8:	96350100 	lhu	s5,256(s1)
    14ac:	17000004 	bnez	t8,14c0 <_mem_avail_start-0x7fffeb40>
    14b0:	000009b1 	tgeu	zero,zero,0x26
    14b4:	00025d0e 	0x25d0e
    14b8:	c00bd400 	ll	t3,-11264(zero)
    14bc:	000008bf 	0x8bf
    14c0:	171c0100 	bne	t8,gp,18c4 <_mem_avail_start-0x7fffe73c>
    14c4:	00000278 	0x278
    14c8:	c00bd410 	ll	t3,-11248(zero)
    14cc:	000008bf 	0x8bf
    14d0:	02831100 	0x2831100
    14d4:	e0940000 	sc	s4,0(a0)
    14d8:	007bfec0 	0x7bfec0
    14dc:	c40e0000 	lwc1	$f14,0(zero)
    14e0:	e8000008 	swc2	$0,8(zero)
    14e4:	04bfc00b 	0x4bfc00b
    14e8:	01000000 	0x1000000
    14ec:	08db0f36 	j	36c3cd8 <_mem_avail_start-0x7c93c328>
    14f0:	0c590000 	jal	1640000 <_mem_avail_start-0x7e9c0000>
    14f4:	d00f0000 	0xd00f0000
    14f8:	6c000008 	0x6c000008
    14fc:	0e00000c 	jal	8000030 <_mem_avail_start-0x77ffffd0>
    1500:	00000188 	0x188
    1504:	bfc00be8 	cache	0x0,3048(s8)
    1508:	00000004 	sllv	zero,zero,zero
    150c:	aa0f1d01 	swl	t7,7425(s0)
    1510:	59000001 	blezl	t0,1518 <_mem_avail_start-0x7fffeae8>
    1514:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    1518:	0000019f 	0x19f
    151c:	00000c6c 	0xc6c
    1520:	c00be810 	ll	t3,-6128(zero)
    1524:	000004bf 	0x4bf
    1528:	01b51100 	0x1b51100
    152c:	e0800000 	sc	zero,0(a0)
    1530:	007bfec0 	0x7bfec0
    1534:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    1538:	00000747 	0x747
    153c:	009f2f01 	0x9f2f01
    1540:	00000000 	nop
    1544:	00200000 	0x200000
    1548:	9c010000 	0x9c010000
    154c:	00000589 	0x589
    1550:	0009a116 	0x9a116
    1554:	00000000 	nop
    1558:	00000800 	sll	at,zero,0x0
    155c:	4a300100 	c2	0x300100
    1560:	17000005 	bnez	t8,1578 <_mem_avail_start-0x7fffea88>
    1564:	000009b1 	tgeu	zero,zero,0x26
    1568:	00025d0e 	0x25d0e
    156c:	00000000 	nop
    1570:	00000800 	sll	at,zero,0x0
    1574:	171c0100 	bne	t8,gp,1978 <_mem_avail_start-0x7fffe688>
    1578:	00000278 	0x278
    157c:	00000010 	mfhi	zero
    1580:	00000800 	sll	at,zero,0x0
    1584:	02831100 	0x2831100
    1588:	e0940000 	sc	s4,0(a0)
    158c:	007bfec0 	0x7bfec0
    1590:	a10e0000 	sb	t6,0(t0)
    1594:	00000009 	jalr	zero,zero
    1598:	04000000 	bltz	zero,159c <_mem_avail_start-0x7fffea64>
    159c:	01000000 	0x1000000
    15a0:	09b11731 	j	6c45cc4 <_mem_avail_start-0x793ba33c>
    15a4:	5d0e0000 	0x5d0e0000
    15a8:	00000002 	srl	zero,zero,0x0
    15ac:	04000000 	bltz	zero,15b0 <_mem_avail_start-0x7fffea50>
    15b0:	01000000 	0x1000000
    15b4:	0278171c 	0x278171c
    15b8:	00100000 	sll	zero,s0,0x0
    15bc:	04000000 	bltz	zero,15c0 <_mem_avail_start-0x7fffea40>
    15c0:	11000000 	beqz	t0,15c4 <_mem_avail_start-0x7fffea3c>
    15c4:	00000283 	sra	zero,zero,0xa
    15c8:	fec0e080 	sdc3	$0,-8064(s6)
    15cc:	0000007b 	0x7b
    15d0:	02e61200 	0x2e61200
    15d4:	1f010000 	0x1f010000
    15d8:	bfc00b9c 	cache	0x0,2972(s8)
    15dc:	00000038 	0x38
    15e0:	081b9c01 	j	6e7004 <_mem_avail_start-0x7f918ffc>
    15e4:	c4160000 	lwc1	$f22,0(zero)
    15e8:	9c000008 	0x9c000008
    15ec:	0cbfc00b 	jal	2ff002c <_mem_avail_start-0x7d00ffd4>
    15f0:	01000000 	0x1000000
    15f4:	0005fa21 	0x5fa21
    15f8:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    15fc:	0c840000 	jal	2100000 <_mem_avail_start-0x7df00000>
    1600:	d00f0000 	0xd00f0000
    1604:	99000008 	lwr	zero,8(t0)
    1608:	0e00000c 	jal	8000030 <_mem_avail_start-0x77ffffd0>
    160c:	00000188 	0x188
    1610:	bfc00b9c 	cache	0x0,2972(s8)
    1614:	0000000c 	syscall
    1618:	aa0f1d01 	swl	t7,7425(s0)
    161c:	84000001 	lh	zero,1(zero)
    1620:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    1624:	0000019f 	0x19f
    1628:	00000c99 	0xc99
    162c:	c00b9c10 	ll	t3,-25584(zero)
    1630:	00000cbf 	0xcbf
    1634:	01b51100 	0x1b51100
    1638:	e0880000 	sc	t0,0(a0)
    163c:	007bfec0 	0x7bfec0
    1640:	c4160000 	lwc1	$f22,0(zero)
    1644:	a8000008 	swl	zero,8(zero)
    1648:	08bfc00b 	j	2ff002c <_mem_avail_start-0x7d00ffd4>
    164c:	01000000 	0x1000000
    1650:	00065623 	0x65623
    1654:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    1658:	0cb10000 	jal	2c40000 <_mem_avail_start-0x7d3c0000>
    165c:	d00f0000 	0xd00f0000
    1660:	c6000008 	lwc1	$f0,8(s0)
    1664:	0e00000c 	jal	8000030 <_mem_avail_start-0x77ffffd0>
    1668:	00000188 	0x188
    166c:	bfc00ba8 	cache	0x0,2984(s8)
    1670:	00000008 	jr	zero
    1674:	aa0f1d01 	swl	t7,7425(s0)
    1678:	b1000001 	0xb1000001
    167c:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    1680:	0000019f 	0x19f
    1684:	00000cc6 	0xcc6
    1688:	c00ba810 	ll	t3,-22512(zero)
    168c:	000008bf 	0x8bf
    1690:	01b51100 	0x1b51100
    1694:	e08c0000 	sc	t4,0(a0)
    1698:	007bfec0 	0x7bfec0
    169c:	c4160000 	lwc1	$f22,0(zero)
    16a0:	b0000008 	0xb0000008
    16a4:	08bfc00b 	j	2ff002c <_mem_avail_start-0x7d00ffd4>
    16a8:	01000000 	0x1000000
    16ac:	0006b225 	0x6b225
    16b0:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    16b4:	0cde0000 	jal	3780000 <_mem_avail_start-0x7c880000>
    16b8:	d00f0000 	0xd00f0000
    16bc:	f3000008 	0xf3000008
    16c0:	0e00000c 	jal	8000030 <_mem_avail_start-0x77ffffd0>
    16c4:	00000188 	0x188
    16c8:	bfc00bb0 	cache	0x0,2992(s8)
    16cc:	00000008 	jr	zero
    16d0:	aa0f1d01 	swl	t7,7425(s0)
    16d4:	de000001 	ldc3	$0,1(s0)
    16d8:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    16dc:	0000019f 	0x19f
    16e0:	00000cf3 	tltu	zero,zero,0x33
    16e4:	c00bb010 	ll	t3,-20464(zero)
    16e8:	000008bf 	0x8bf
    16ec:	01b51100 	0x1b51100
    16f0:	e0800000 	sc	zero,0(a0)
    16f4:	007bfec0 	0x7bfec0
    16f8:	c4180000 	lwc1	$f24,0(zero)
    16fc:	b8000008 	swr	zero,8(zero)
    1700:	30bfc00b 	andi	ra,a1,0xc00b
    1704:	01000002 	0x1000002
    1708:	00070a28 	0x70a28
    170c:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    1710:	0d0b0000 	jal	42c0000 <_mem_avail_start-0x7bd40000>
    1714:	d00f0000 	0xd00f0000
    1718:	1f000008 	bgtz	t8,173c <_mem_avail_start-0x7fffe8c4>
    171c:	1900000d 	blez	t0,1754 <_mem_avail_start-0x7fffe8ac>
    1720:	00000188 	0x188
    1724:	bfc00bb8 	cache	0x0,3000(s8)
    1728:	00000230 	tge	zero,zero,0x8
    172c:	aa0f1d01 	swl	t7,7425(s0)
    1730:	0b000001 	j	c000004 <_mem_avail_start-0x73fffffc>
    1734:	0f00000d 	jal	c000034 <_mem_avail_start-0x73ffffcc>
    1738:	0000019f 	0x19f
    173c:	00000d1f 	0xd1f
    1740:	0002301a 	0x2301a
    1744:	01b51100 	0x1b51100
    1748:	e08c0000 	sc	t4,0(a0)
    174c:	007bfec0 	0x7bfec0
    1750:	c4160000 	lwc1	$f22,0(zero)
    1754:	bc000008 	cache	0x0,8(zero)
    1758:	04bfc00b 	0x4bfc00b
    175c:	01000000 	0x1000000
    1760:	00076626 	0x76626
    1764:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    1768:	0d370000 	jal	4dc0000 <_mem_avail_start-0x7b240000>
    176c:	d00f0000 	0xd00f0000
    1770:	4b000008 	c2	0x1000008
    1774:	0e00000d 	jal	8000034 <_mem_avail_start-0x77ffffcc>
    1778:	00000188 	0x188
    177c:	bfc00bbc 	cache	0x0,3004(s8)
    1780:	00000004 	sllv	zero,zero,zero
    1784:	aa0f1d01 	swl	t7,7425(s0)
    1788:	37000001 	ori	zero,t8,0x1
    178c:	0f00000d 	jal	c000034 <_mem_avail_start-0x73ffffcc>
    1790:	0000019f 	0x19f
    1794:	00000d4b 	0xd4b
    1798:	c00bbc10 	ll	t3,-17392(zero)
    179c:	000004bf 	0x4bf
    17a0:	01b51100 	0x1b51100
    17a4:	e0840000 	sc	a0,0(a0)
    17a8:	007bfec0 	0x7bfec0
    17ac:	c4160000 	lwc1	$f22,0(zero)
    17b0:	c4000008 	lwc1	$f0,8(zero)
    17b4:	04bfc00b 	0x4bfc00b
    17b8:	01000000 	0x1000000
    17bc:	0007c22a 	0x7c22a
    17c0:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    17c4:	0d630000 	jal	58c0000 <_mem_avail_start-0x7a740000>
    17c8:	d00f0000 	0xd00f0000
    17cc:	77000008 	jalx	c000020 <_mem_avail_start-0x73ffffe0>
    17d0:	0e00000d 	jal	8000034 <_mem_avail_start-0x77ffffcc>
    17d4:	00000188 	0x188
    17d8:	bfc00bc4 	cache	0x0,3012(s8)
    17dc:	00000004 	sllv	zero,zero,zero
    17e0:	aa0f1d01 	swl	t7,7425(s0)
    17e4:	63000001 	0x63000001
    17e8:	0f00000d 	jal	c000034 <_mem_avail_start-0x73ffffcc>
    17ec:	0000019f 	0x19f
    17f0:	00000d77 	0xd77
    17f4:	c00bc410 	ll	t3,-15344(zero)
    17f8:	000004bf 	0x4bf
    17fc:	01b51100 	0x1b51100
    1800:	e0900000 	sc	s0,0(a0)
    1804:	007bfec0 	0x7bfec0
    1808:	c40e0000 	lwc1	$f14,0(zero)
    180c:	c8000008 	lwc2	$0,8(zero)
    1810:	04bfc00b 	0x4bfc00b
    1814:	01000000 	0x1000000
    1818:	08db0f2c 	j	36c3cb0 <_mem_avail_start-0x7c93c350>
    181c:	0d8f0000 	jal	63c0000 <_mem_avail_start-0x79c40000>
    1820:	d00f0000 	0xd00f0000
    1824:	a3000008 	sb	zero,8(t8)
    1828:	0e00000d 	jal	8000034 <_mem_avail_start-0x77ffffcc>
    182c:	00000188 	0x188
    1830:	bfc00bc8 	cache	0x0,3016(s8)
    1834:	00000004 	sllv	zero,zero,zero
    1838:	aa0f1d01 	swl	t7,7425(s0)
    183c:	8f000001 	lw	zero,1(t8)
    1840:	0f00000d 	jal	c000034 <_mem_avail_start-0x73ffffcc>
    1844:	0000019f 	0x19f
    1848:	00000da3 	0xda3
    184c:	c00bc810 	ll	t3,-14320(zero)
    1850:	000004bf 	0x4bf
    1854:	01b51100 	0x1b51100
    1858:	e0840000 	sc	a0,0(a0)
    185c:	007bfec0 	0x7bfec0
    1860:	12000000 	beqz	s0,1864 <_mem_avail_start-0x7fffe79c>
    1864:	00000672 	tlt	zero,zero,0x19
    1868:	00001d01 	0x1d01
    186c:	000c0000 	sll	zero,t4,0x0
    1870:	9c010000 	0x9c010000
    1874:	0000087e 	0x87e
    1878:	00026913 	0x26913
    187c:	251d0100 	addiu	sp,t0,256
    1880:	01000000 	0x1000000
    1884:	05f11354 	bgezal	t7,65d8 <_mem_avail_start-0x7fff9a28>
    1888:	1d010000 	0x1d010000
    188c:	000000c0 	ehb
    1890:	cb0e5501 	lwc2	$14,21761(t8)
    1894:	00000000 	nop
    1898:	04000000 	bltz	zero,189c <_mem_avail_start-0x7fffe764>
    189c:	01000000 	0x1000000
    18a0:	00ed0f1d 	0xed0f1d
    18a4:	0dbb0000 	jal	6ec0000 <_mem_avail_start-0x79140000>
    18a8:	e20f0000 	sc	t7,0(s0)
    18ac:	ce000000 	pref	0x0,0(s0)
    18b0:	1000000d 	b	18e8 <_mem_avail_start-0x7fffe718>
    18b4:	00000000 	nop
    18b8:	00000004 	sllv	zero,zero,zero
    18bc:	0000f81b 	0xf81b
    18c0:	00540100 	0x540100
    18c4:	e61c0000 	swc1	$f28,0(s0)
    18c8:	01000005 	0x1000005
    18cc:	08a1011d 	j	2840474 <_mem_avail_start-0x7d7bfb8c>
    18d0:	69090000 	0x69090000
    18d4:	01000002 	0x1000002
    18d8:	0000251d 	0x251d
    18dc:	05f10900 	bgezal	t7,3ce0 <_mem_avail_start-0x7fffc320>
    18e0:	1d010000 	0x1d010000
    18e4:	000000b5 	0xb5
    18e8:	05bb1c00 	0x5bb1c00
    18ec:	1d010000 	0x1d010000
    18f0:	0008c401 	0x8c401
    18f4:	02690900 	0x2690900
    18f8:	1d010000 	0x1d010000
    18fc:	00000025 	move	zero,zero
    1900:	0005f109 	0x5f109
    1904:	aa1d0100 	swl	sp,256(s0)
    1908:	00000000 	nop
    190c:	0005f61c 	0x5f61c
    1910:	011d0100 	0x11d0100
    1914:	000008e7 	0x8e7
    1918:	00026909 	0x26909
    191c:	251d0100 	addiu	sp,t0,256
    1920:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    1924:	000005f1 	tgeu	zero,zero,0x17
    1928:	009f1d01 	0x9f1d01
    192c:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    1930:	000006f8 	0x6f8
    1934:	00c01c01 	0xc01c01
    1938:	00000000 	nop
    193c:	000c0000 	sll	zero,t4,0x0
    1940:	9c010000 	0x9c010000
    1944:	00000938 	0x938
    1948:	00026913 	0x26913
    194c:	251c0100 	addiu	gp,t0,256
    1950:	01000000 	0x1000000
    1954:	01c70e54 	0x1c70e54
    1958:	00000000 	nop
    195c:	00040000 	sll	zero,a0,0x0
    1960:	1c010000 	0x1c010000
    1964:	0001e20f 	0x1e20f
    1968:	000de100 	sll	gp,t5,0x4
    196c:	00001000 	sll	v0,zero,0x0
    1970:	00040000 	sll	zero,a0,0x0
    1974:	ed1b0000 	swc3	$27,0(t0)
    1978:	01000001 	movf	zero,t0,$fcc0
    197c:	00000054 	0x54
    1980:	0007531d 	0x7531d
    1984:	b51c0100 	0xb51c0100
    1988:	01000000 	0x1000000
    198c:	00000954 	0x954
    1990:	00026909 	0x26909
    1994:	251c0100 	addiu	gp,t0,256
    1998:	00000000 	nop
    199c:	00062e0d 	break	0x6,0xb8
    19a0:	aa1c0100 	swl	gp,256(s0)
    19a4:	00000000 	nop
    19a8:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    19ac:	01000000 	0x1000000
    19b0:	0009a19c 	0x9a19c
    19b4:	02691300 	0x2691300
    19b8:	1c010000 	0x1c010000
    19bc:	00000025 	move	zero,zero
    19c0:	2b0e5401 	slti	t6,t8,21505
    19c4:	00000002 	srl	zero,zero,0x0
    19c8:	04000000 	bltz	zero,19cc <_mem_avail_start-0x7fffe634>
    19cc:	01000000 	0x1000000
    19d0:	0246171c 	0x246171c
    19d4:	00100000 	sll	zero,s0,0x0
    19d8:	04000000 	bltz	zero,19dc <_mem_avail_start-0x7fffe624>
    19dc:	1b000000 	blez	t8,19e0 <_mem_avail_start-0x7fffe620>
    19e0:	00000251 	0x251
    19e4:	00005401 	0x5401
    19e8:	077e1d00 	0x77e1d00
    19ec:	1c010000 	0x1c010000
    19f0:	0000009f 	0x9f
    19f4:	0009bd01 	0x9bd01
    19f8:	02690900 	0x2690900
    19fc:	1c010000 	0x1c010000
    1a00:	00000025 	move	zero,zero
    1a04:	09a11e00 	j	6847800 <_mem_avail_start-0x797b8800>
    1a08:	00000000 	nop
    1a0c:	000c0000 	sll	zero,t4,0x0
    1a10:	9c010000 	0x9c010000
    1a14:	000009fe 	0x9fe
    1a18:	0009b11f 	0x9b11f
    1a1c:	0e540100 	jal	9500400 <_mem_avail_start-0x76affc00>
    1a20:	0000025d 	0x25d
    1a24:	00000000 	nop
    1a28:	00000004 	sllv	zero,zero,zero
    1a2c:	78171c01 	0x78171c01
    1a30:	10000002 	b	1a3c <_mem_avail_start-0x7fffe5c4>
    1a34:	00000000 	nop
    1a38:	00000004 	sllv	zero,zero,zero
    1a3c:	0002831b 	0x2831b
    1a40:	00540100 	0x540100
    1a44:	381e0000 	xori	s8,zero,0x0
    1a48:	00000009 	jalr	zero,zero
    1a4c:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    1a50:	01000000 	0x1000000
    1a54:	000a439c 	0xa439c
    1a58:	09481f00 	j	5207c00 <_mem_avail_start-0x7adf8400>
    1a5c:	54010000 	bnel	zero,at,1a60 <_mem_avail_start-0x7fffe5a0>
    1a60:	0001f90e 	0x1f90e
    1a64:	00000000 	nop
    1a68:	00000400 	sll	zero,zero,0x10
    1a6c:	0f1c0100 	jal	c700400 <_mem_avail_start-0x738ffc00>
    1a70:	00000214 	0x214
    1a74:	00000df4 	teq	zero,zero,0x37
    1a78:	00000010 	mfhi	zero
    1a7c:	00000400 	sll	zero,zero,0x10
    1a80:	021f1b00 	0x21f1b00
    1a84:	54010000 	bnel	zero,at,1a88 <_mem_avail_start-0x7fffe578>
    1a88:	1e000000 	bgtz	s0,1a8c <_mem_avail_start-0x7fffe574>
    1a8c:	000008c4 	0x8c4
    1a90:	00000000 	nop
    1a94:	0000000c 	syscall
    1a98:	0a989c01 	j	a627004 <_mem_avail_start-0x759d8ffc>
    1a9c:	d01f0000 	0xd01f0000
    1aa0:	01000008 	jr	t0
    1aa4:	08db1f54 	j	36c7d50 <_mem_avail_start-0x7c9382b0>
    1aa8:	55010000 	bnel	t0,at,1aac <_mem_avail_start-0x7fffe554>
    1aac:	0001880e 	0x1880e
    1ab0:	00000000 	nop
    1ab4:	00000400 	sll	zero,zero,0x10
    1ab8:	0f1d0100 	jal	c740400 <_mem_avail_start-0x738bfc00>
    1abc:	000001aa 	0x1aa
    1ac0:	00000e07 	0xe07
    1ac4:	00019f0f 	0x19f0f
    1ac8:	000e1a00 	sll	v1,t6,0x8
    1acc:	00001000 	sll	v0,zero,0x0
    1ad0:	00040000 	sll	zero,a0,0x0
    1ad4:	b51b0000 	0xb51b0000
    1ad8:	01000001 	movf	zero,t0,$fcc0
    1adc:	00000054 	0x54
    1ae0:	0008a11e 	0x8a11e
    1ae4:	00000000 	nop
    1ae8:	00000c00 	sll	at,zero,0x10
    1aec:	ed9c0100 	swc3	$28,256(t4)
    1af0:	1f00000a 	bgtz	t8,1b1c <_mem_avail_start-0x7fffe4e4>
    1af4:	000008ad 	0x8ad
    1af8:	b81f5401 	swr	ra,21505(zero)
    1afc:	01000008 	jr	t0
    1b00:	01490e55 	0x1490e55
    1b04:	00000000 	nop
    1b08:	00040000 	sll	zero,a0,0x0
    1b0c:	1d010000 	0x1d010000
    1b10:	00016b0f 	0x16b0f
    1b14:	000e2d00 	sll	a1,t6,0x14
    1b18:	01600f00 	0x1600f00
    1b1c:	0e400000 	jal	9000000 <_mem_avail_start-0x77000000>
    1b20:	00100000 	sll	zero,s0,0x0
    1b24:	04000000 	bltz	zero,1b28 <_mem_avail_start-0x7fffe4d8>
    1b28:	1b000000 	blez	t8,1b2c <_mem_avail_start-0x7fffe4d4>
    1b2c:	00000176 	tne	zero,zero,0x5
    1b30:	00005401 	0x5401
    1b34:	087e2000 	j	1f88000 <_mem_avail_start-0x7e078000>
    1b38:	00000000 	nop
    1b3c:	000c0000 	sll	zero,t4,0x0
    1b40:	9c010000 	0x9c010000
    1b44:	00088a1f 	0x88a1f
    1b48:	1f540100 	0x1f540100
    1b4c:	00000895 	0x895
    1b50:	0a0e5501 	j	8395404 <_mem_avail_start-0x77c6abfc>
    1b54:	00000001 	movf	zero,zero,$fcc0
    1b58:	04000000 	bltz	zero,1b5c <_mem_avail_start-0x7fffe4a4>
    1b5c:	01000000 	0x1000000
    1b60:	012c0f1d 	0x12c0f1d
    1b64:	0e530000 	jal	94c0000 <_mem_avail_start-0x76b40000>
    1b68:	210f0000 	addi	t7,t0,0
    1b6c:	66000001 	0x66000001
    1b70:	1000000e 	b	1bac <_mem_avail_start-0x7fffe454>
    1b74:	00000000 	nop
    1b78:	00000004 	sllv	zero,zero,zero
    1b7c:	0001371b 	0x1371b
    1b80:	00540100 	0x540100
    1b84:	Address 0x0000000000001b84 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	25011101 	addiu	at,t0,4353
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	030b130e 	0x30b130e
   8:	550e1b0e 	bnel	t0,t6,6c44 <_mem_avail_start-0x7fff93bc>
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	10011117 	beq	zero,at,446c <_mem_avail_start-0x7fffbb94>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	02000017 	0x2000017
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	0e030b3e 	jal	80c2cf8 <_mem_avail_start-0x77f3d308>
  1c:	35030000 	ori	v1,t0,0x0
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	00134900 	sll	t1,s3,0x4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	012e0400 	0x12e0400
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
  30:	01111349 	0x1111349
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	18400612 	blez	v0,1880 <_mem_avail_start-0x7fffe780>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	01194297 	0x1194297
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	05000013 	bltz	t0,8c <_mem_avail_start-0x7fffff74>
  40:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
  44:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	0d1c1349 	jal	4704d24 <_mem_avail_start-0x7b8fb2dc>
  4c:	0b060000 	j	c180000 <_mem_avail_start-0x73e80000>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	01175501 	0x1175501
  54:	07000013 	bltz	t8,a4 <_mem_avail_start-0x7fffff5c>
  58:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
  5c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	17021349 	bne	t8,v0,4d88 <_mem_avail_start-0x7fffb278>
  64:	0b080000 	j	c200000 <_mem_avail_start-0x73e00000>
  68:	00175501 	0x175501
  6c:	011d0900 	0x11d0900
  70:	01521331 	tgeu	t2,s2,0x4c
  74:	0b581755 	j	d605d54 <_mem_avail_start-0x729fa2ac>
  78:	13010b59 	beq	t8,at,2de0 <_mem_avail_start-0x7fffd220>
  7c:	050a0000 	tlti	t0,0
  80:	02133100 	0x2133100
  84:	0b000017 	j	c00005c <_mem_avail_start-0x73ffffa4>
  88:	00018289 	0x18289
  8c:	13310111 	beq	t9,s1,4d4 <_mem_avail_start-0x7ffffb2c>
  90:	890c0000 	lwl	t4,0(t0)
  94:	11010182 	beq	t0,at,6a0 <_mem_avail_start-0x7ffff960>
  98:	00133101 	0x133101
  9c:	828a0d00 	lb	t2,3328(s4)
  a0:	18020001 	0x18020001
  a4:	00184291 	0x184291
  a8:	00240e00 	0x240e00
  ac:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
  b0:	00000803 	sra	at,zero,0x0
  b4:	0b000f0f 	j	c003c3c <_mem_avail_start-0x73ffc3c4>
  b8:	0013490b 	0x13490b
  bc:	00261000 	0x261000
  c0:	00001349 	0x1349
  c4:	3f012e11 	0x3f012e11
  c8:	3a0e0319 	xori	t6,s0,0x319
  cc:	6e0b3b0b 	0x6e0b3b0b
  d0:	010b200e 	0x10b200e
  d4:	12000013 	beqz	s0,124 <_mem_avail_start-0x7ffffedc>
  d8:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
  dc:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
  e0:	00001349 	0x1349
  e4:	3f012e13 	0x3f012e13
  e8:	3a0e0319 	xori	t6,s0,0x319
  ec:	6e0b3b0b 	0x6e0b3b0b
  f0:	1201110e 	beq	s0,at,452c <_mem_avail_start-0x7fffbad4>
  f4:	97184006 	lhu	t8,16390(t8)
  f8:	13011942 	beq	t8,at,6604 <_mem_avail_start-0x7fff99fc>
  fc:	05140000 	0x5140000
 100:	3a080300 	xori	t0,s0,0x300
 104:	490b3b0b 	bc2tl	$cc2,ed34 <_mem_avail_start-0x7fff12cc>
 108:	00170213 	0x170213
 10c:	82891500 	lb	t1,5376(s4)
 110:	01110001 	movt	zero,t0,$fcc4
 114:	31194295 	andi	t9,t0,0x4295
 118:	16000013 	bnez	s0,168 <_mem_avail_start-0x7ffffe98>
 11c:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 120:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 124:	18021349 	0x18021349
 128:	34170000 	li	s7,0x0
 12c:	3a0e0300 	xori	t6,s0,0x300
 130:	490b3b0b 	bc2tl	$cc2,ed60 <_mem_avail_start-0x7fff12a0>
 134:	000d1c13 	0xd1c13
 138:	11010000 	beq	t0,at,13c <_mem_avail_start-0x7ffffec4>
 13c:	11061000 	beq	t0,a2,4140 <_mem_avail_start-0x7fffbec0>
 140:	03011201 	0x3011201
 144:	250e1b0e 	addiu	t6,t0,6926
 148:	0005130e 	0x5130e
 14c:	11010000 	beq	t0,at,150 <_mem_avail_start-0x7ffffeb0>
 150:	130e2501 	beq	t8,t6,9558 <_mem_avail_start-0x7fff6aa8>
 154:	1b0e030b 	0x1b0e030b
 158:	1117550e 	beq	t0,s7,15594 <_mem_avail_start-0x7ffeaa6c>
 15c:	00171001 	0x171001
 160:	00240200 	0x240200
 164:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 168:	00000e03 	sra	at,zero,0x18
 16c:	03001603 	0x3001603
 170:	3b0b3a0e 	xori	t3,t8,0x3a0e
 174:	0013490b 	0x13490b
 178:	00260400 	0x260400
 17c:	00001349 	0x1349
 180:	0b002405 	j	c009014 <_mem_avail_start-0x73ff6fec>
 184:	030b3e0b 	0x30b3e0b
 188:	06000008 	bltz	s0,1ac <_mem_avail_start-0x7ffffe54>
 18c:	13490101 	beq	k0,t1,594 <_mem_avail_start-0x7ffffa6c>
 190:	00001301 	0x1301
 194:	49002107 	bc2f	85b4 <_mem_avail_start-0x7fff7a4c>
 198:	000b2f13 	0xb2f13
 19c:	000f0800 	sll	at,t7,0x0
 1a0:	13490b0b 	beq	k0,t1,2dd0 <_mem_avail_start-0x7fffd230>
 1a4:	34090000 	li	t1,0x0
 1a8:	3a0e0300 	xori	t6,s0,0x300
 1ac:	490b3b0b 	bc2tl	$cc2,eddc <_mem_avail_start-0x7fff1224>
 1b0:	02193f13 	0x2193f13
 1b4:	0a000018 	j	8000060 <_mem_avail_start-0x77ffffa0>
 1b8:	0b0b0113 	j	c2c044c <_mem_avail_start-0x73d3fbb4>
 1bc:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 1c0:	00001301 	0x1301
 1c4:	03000d0b 	0x3000d0b
 1c8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 1cc:	3813490b 	xori	s3,zero,0x490b
 1d0:	0c00000b 	jal	2c <_mem_avail_start-0x7fffffd4>
 1d4:	0803000d 	j	c0034 <_mem_avail_start-0x7ff3ffcc>
 1d8:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 1dc:	0b381349 	j	ce04d24 <_mem_avail_start-0x731fb2dc>
 1e0:	340d0000 	li	t5,0x0
 1e4:	3a0e0300 	xori	t6,s0,0x300
 1e8:	490b3b0b 	bc2tl	$cc2,ee18 <_mem_avail_start-0x7fff11e8>
 1ec:	3c193f13 	lui	t9,0x3f13
 1f0:	0e000019 	jal	8000064 <_mem_avail_start-0x77ffff9c>
 1f4:	193f012e 	0x193f012e
 1f8:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 1fc:	19270b3b 	0x19270b3b
 200:	06120111 	bltzall	s0,648 <_mem_avail_start-0x7ffff9b8>
 204:	42971840 	c0	0x971840
 208:	00130119 	0x130119
 20c:	00050f00 	sll	at,a1,0x1c
 210:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 214:	13490b3b 	beq	k0,t1,2f04 <_mem_avail_start-0x7fffd0fc>
 218:	00001702 	srl	v0,zero,0x1c
 21c:	03000510 	0x3000510
 220:	3b0b3a0e 	xori	t3,t8,0x3a0e
 224:	0213490b 	0x213490b
 228:	11000017 	beqz	t0,288 <_mem_avail_start-0x7ffffd78>
 22c:	0111010b 	0x111010b
 230:	13010612 	beq	t8,at,1a7c <_mem_avail_start-0x7fffe584>
 234:	34120000 	li	s2,0x0
 238:	3a0e0300 	xori	t6,s0,0x300
 23c:	490b3b0b 	bc2tl	$cc2,ee6c <_mem_avail_start-0x7fff1194>
 240:	00170213 	0x170213
 244:	00341300 	0x341300
 248:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 24c:	13490b3b 	beq	k0,t1,2f3c <_mem_avail_start-0x7fffd0c4>
 250:	1d140000 	0x1d140000
 254:	11133101 	beq	t0,s3,c65c <_mem_avail_start-0x7fff39a4>
 258:	58061201 	0x58061201
 25c:	010b590b 	0x10b590b
 260:	15000013 	bnez	t0,2b0 <_mem_avail_start-0x7ffffd50>
 264:	0111010b 	0x111010b
 268:	00000612 	0x612
 26c:	31003416 	andi	zero,t0,0x3416
 270:	17000013 	bnez	t8,2c0 <_mem_avail_start-0x7ffffd40>
 274:	01018289 	0x1018289
 278:	13310111 	beq	t9,s1,6c0 <_mem_avail_start-0x7ffff940>
 27c:	00001301 	0x1301
 280:	01828a18 	0x1828a18
 284:	91180200 	lbu	t8,512(t0)
 288:	00001842 	srl	v1,zero,0x1
 28c:	01828919 	0x1828919
 290:	31011101 	andi	at,t0,0x1101
 294:	1a000013 	blez	s0,2e4 <_mem_avail_start-0x7ffffd1c>
 298:	00018289 	0x18289
 29c:	13310111 	beq	t9,s1,6e4 <_mem_avail_start-0x7ffff91c>
 2a0:	891b0000 	lwl	k1,0(t0)
 2a4:	11010182 	beq	t0,at,8b0 <_mem_avail_start-0x7ffff750>
 2a8:	19429501 	0x19429501
 2ac:	00001331 	tgeu	zero,zero,0x4c
 2b0:	3f012e1c 	0x3f012e1c
 2b4:	3a0e0319 	xori	t6,s0,0x319
 2b8:	110b3b0b 	beq	t0,t3,eee8 <_mem_avail_start-0x7fff1118>
 2bc:	40061201 	0x40061201
 2c0:	19429718 	0x19429718
 2c4:	00001301 	0x1301
 2c8:	55010b1d 	bnel	t0,at,2f40 <_mem_avail_start-0x7fffd0c0>
 2cc:	1e000017 	bgtz	s0,32c <_mem_avail_start-0x7ffffcd4>
 2d0:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 2d4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 2d8:	17021349 	bne	t8,v0,5000 <_mem_avail_start-0x7fffb000>
 2dc:	0b1f0000 	j	c7c0000 <_mem_avail_start-0x73840000>
 2e0:	01175501 	0x1175501
 2e4:	20000013 	addi	zero,zero,19
 2e8:	193f012e 	0x193f012e
 2ec:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 2f0:	13490b3b 	beq	k0,t1,2fe0 <_mem_avail_start-0x7fffd020>
 2f4:	13010b20 	beq	t8,at,2f78 <_mem_avail_start-0x7fffd088>
 2f8:	89210000 	lwl	at,0(t1)
 2fc:	11010182 	beq	t0,at,908 <_mem_avail_start-0x7ffff6f8>
 300:	19429501 	0x19429501
 304:	13011331 	beq	t8,at,4fcc <_mem_avail_start-0x7fffb034>
 308:	2e220000 	sltiu	v0,s1,0
 30c:	11133101 	beq	t0,s3,c714 <_mem_avail_start-0x7fff38ec>
 310:	40061201 	0x40061201
 314:	19429718 	0x19429718
 318:	00001301 	0x1301
 31c:	31003423 	andi	zero,t0,0x3423
 320:	00180213 	0x180213
 324:	002e2400 	0x2e2400
 328:	193c193f 	0x193c193f
 32c:	0e030e6e 	jal	80c39b8 <_mem_avail_start-0x77f3c648>
 330:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 334:	01000000 	0x1000000
 338:	0e250111 	jal	8940444 <_mem_avail_start-0x776bfbbc>
 33c:	0e030b13 	jal	80c2c4c <_mem_avail_start-0x77f3d3b4>
 340:	17550e1b 	bne	k0,s5,3bb0 <_mem_avail_start-0x7fffc450>
 344:	17100111 	bne	t8,s0,78c <_mem_avail_start-0x7ffff874>
 348:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
 34c:	000b0b00 	sll	at,t3,0xc
 350:	00240300 	0x240300
 354:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 358:	00000e03 	sra	at,zero,0x18
 35c:	3f012e04 	0x3f012e04
 360:	3a0e0319 	xori	t6,s0,0x319
 364:	270b3b0b 	addiu	t3,t8,15115
 368:	11134919 	beq	t0,s3,127d0 <_mem_avail_start-0x7ffed830>
 36c:	40061201 	0x40061201
 370:	19429718 	0x19429718
 374:	00001301 	0x1301
 378:	03000505 	0x3000505
 37c:	3b0b3a08 	xori	t3,t8,0x3a08
 380:	0213490b 	0x213490b
 384:	06000017 	bltz	s0,3e4 <_mem_avail_start-0x7ffffc1c>
 388:	00000018 	mult	zero,zero
 38c:	03003407 	0x3003407
 390:	3b0b3a08 	xori	t3,t8,0x3a08
 394:	0213490b 	0x213490b
 398:	08000017 	j	5c <_mem_avail_start-0x7fffffa4>
 39c:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 3a0:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 3a4:	18021349 	0x18021349
 3a8:	0a090000 	j	8240000 <_mem_avail_start-0x77dc0000>
 3ac:	3a0e0300 	xori	t6,s0,0x300
 3b0:	110b3b0b 	beq	t0,t3,efe0 <_mem_avail_start-0x7fff1020>
 3b4:	0a000001 	j	8000004 <_mem_avail_start-0x77fffffc>
 3b8:	1755010b 	bne	k0,s5,7e8 <_mem_avail_start-0x7ffff818>
 3bc:	00001301 	0x1301
 3c0:	3f012e0b 	0x3f012e0b
 3c4:	3a0e0319 	xori	t6,s0,0x319
 3c8:	490b3b0b 	bc2tl	$cc2,eff8 <_mem_avail_start-0x7fff1008>
 3cc:	01193c13 	0x1193c13
 3d0:	0c000013 	jal	4c <_mem_avail_start-0x7fffffb4>
 3d4:	00018289 	0x18289
 3d8:	13310111 	beq	t9,s1,820 <_mem_avail_start-0x7ffff7e0>
 3dc:	890d0000 	lwl	t5,0(t0)
 3e0:	11010182 	beq	t0,at,9ec <_mem_avail_start-0x7ffff614>
 3e4:	01133101 	0x1133101
 3e8:	0e000013 	jal	800004c <_mem_avail_start-0x77ffffb4>
 3ec:	0001828a 	0x1828a
 3f0:	42911802 	c0	0x911802
 3f4:	0f000018 	jal	c000060 <_mem_avail_start-0x73ffffa0>
 3f8:	01018289 	0x1018289
 3fc:	13310111 	beq	t9,s1,844 <_mem_avail_start-0x7ffff7bc>
 400:	0b100000 	j	c400000 <_mem_avail_start-0x73c00000>
 404:	00175501 	0x175501
 408:	010b1100 	0x10b1100
 40c:	06120111 	bltzall	s0,854 <_mem_avail_start-0x7ffff7ac>
 410:	00001301 	0x1301
 414:	0b002412 	j	c009048 <_mem_avail_start-0x73ff6fb8>
 418:	030b3e0b 	0x30b3e0b
 41c:	13000008 	beqz	t8,440 <_mem_avail_start-0x7ffffbc0>
 420:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
 424:	00001349 	0x1349
 428:	49002614 	bc2f	9c7c <_mem_avail_start-0x7fff6384>
 42c:	15000013 	bnez	t0,47c <_mem_avail_start-0x7ffffb84>
 430:	193f002e 	0x193f002e
 434:	0e6e193c 	jal	9b864f0 <_mem_avail_start-0x76479b10>
 438:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 43c:	00000b3b 	0xb3b
 440:	01110100 	0x1110100
 444:	0b130e25 	j	c4c3894 <_mem_avail_start-0x73b3c76c>
 448:	0e1b0e03 	jal	86c380c <_mem_avail_start-0x7793c7f4>
 44c:	01111755 	0x1111755
 450:	00001710 	0x1710
 454:	0b002402 	j	c009008 <_mem_avail_start-0x73ff6ff8>
 458:	030b3e0b 	0x30b3e0b
 45c:	0300000e 	0x300000e
 460:	193f012e 	0x193f012e
 464:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 468:	19270b3b 	0x19270b3b
 46c:	01111349 	0x1111349
 470:	18400612 	blez	v0,1cbc <_mem_avail_start-0x7fffe344>
 474:	01194297 	0x1194297
 478:	04000013 	bltz	zero,4c8 <_mem_avail_start-0x7ffffb38>
 47c:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 480:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 484:	17021349 	bne	t8,v0,51ac <_mem_avail_start-0x7fffae54>
 488:	05050000 	0x5050000
 48c:	3a0e0300 	xori	t6,s0,0x300
 490:	490b3b0b 	bc2tl	$cc2,f0c0 <_mem_avail_start-0x7fff0f40>
 494:	00170213 	0x170213
 498:	00340600 	0x340600
 49c:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 4a0:	13490b3b 	beq	k0,t1,3190 <_mem_avail_start-0x7fffce70>
 4a4:	00001702 	srl	v0,zero,0x1c
 4a8:	03003407 	0x3003407
 4ac:	3b0b3a08 	xori	t3,t8,0x3a08
 4b0:	0213490b 	0x213490b
 4b4:	08000018 	j	60 <_mem_avail_start-0x7fffffa0>
 4b8:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 4bc:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 4c0:	17021349 	bne	t8,v0,51e8 <_mem_avail_start-0x7fffae18>
 4c4:	0b090000 	j	c240000 <_mem_avail_start-0x73dc0000>
 4c8:	12011101 	beq	s0,at,48d0 <_mem_avail_start-0x7fffb730>
 4cc:	00130106 	0x130106
 4d0:	012e0a00 	0x12e0a00
 4d4:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 4d8:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 4dc:	193c1349 	0x193c1349
 4e0:	00001301 	0x1301
 4e4:	0000180b 	movn	v1,zero,zero
 4e8:	82890c00 	lb	t1,3072(s4)
 4ec:	01110101 	0x1110101
 4f0:	00001331 	tgeu	zero,zero,0x4c
 4f4:	01828a0d 	break	0x182,0x228
 4f8:	91180200 	lbu	t8,512(t0)
 4fc:	00001842 	srl	v1,zero,0x1
 500:	11010b0e 	beq	t0,at,313c <_mem_avail_start-0x7fffcec4>
 504:	00061201 	0x61201
 508:	82890f00 	lb	t1,3840(s4)
 50c:	01110001 	movt	zero,t0,$fcc4
 510:	00001331 	tgeu	zero,zero,0x4c
 514:	0b002410 	j	c009040 <_mem_avail_start-0x73ff6fc0>
 518:	030b3e0b 	0x30b3e0b
 51c:	11000008 	beqz	t0,540 <_mem_avail_start-0x7ffffac0>
 520:	13490101 	beq	k0,t1,928 <_mem_avail_start-0x7ffff6d8>
 524:	00001301 	0x1301
 528:	49002112 	bc2f	8974 <_mem_avail_start-0x7fff768c>
 52c:	000b2f13 	0xb2f13
 530:	002e1300 	0x2e1300
 534:	193c193f 	0x193c193f
 538:	0e030e6e 	jal	80c39b8 <_mem_avail_start-0x77f3c648>
 53c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 540:	01000000 	0x1000000
 544:	0e250111 	jal	8940444 <_mem_avail_start-0x776bfbbc>
 548:	0e030b13 	jal	80c2c4c <_mem_avail_start-0x77f3d3b4>
 54c:	17550e1b 	bne	k0,s5,3dbc <_mem_avail_start-0x7fffc244>
 550:	17100111 	bne	t8,s0,998 <_mem_avail_start-0x7ffff668>
 554:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
 558:	000b0b00 	sll	at,t3,0xc
 55c:	00240300 	0x240300
 560:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 564:	00000e03 	sra	at,zero,0x18
 568:	03001604 	0x3001604
 56c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 570:	0013490b 	0x13490b
 574:	012e0500 	0x12e0500
 578:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 57c:	053b0b3a 	0x53b0b3a
 580:	01111927 	0x1111927
 584:	18400612 	blez	v0,1dd0 <_mem_avail_start-0x7fffe230>
 588:	01194297 	0x1194297
 58c:	06000013 	bltz	s0,5dc <_mem_avail_start-0x7ffffa24>
 590:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 594:	053b0b3a 	0x53b0b3a
 598:	18021349 	0x18021349
 59c:	05070000 	0x5070000
 5a0:	3a080300 	xori	t0,s0,0x300
 5a4:	49053b0b 	bc2t	$cc1,f1d4 <_mem_avail_start-0x7fff0e2c>
 5a8:	00170213 	0x170213
 5ac:	82890800 	lb	t1,2048(s4)
 5b0:	01110101 	0x1110101
 5b4:	31194295 	andi	t9,t0,0x4295
 5b8:	09000013 	j	400004c <_mem_avail_start-0x7bffffb4>
 5bc:	0001828a 	0x1828a
 5c0:	42911802 	c0	0x911802
 5c4:	0a000018 	j	8000060 <_mem_avail_start-0x77ffffa0>
 5c8:	193f012e 	0x193f012e
 5cc:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 5d0:	1927053b 	0x1927053b
 5d4:	01111349 	0x1111349
 5d8:	18400612 	blez	v0,1e24 <_mem_avail_start-0x7fffe1dc>
 5dc:	01194297 	0x1194297
 5e0:	0b000013 	j	c00004c <_mem_avail_start-0x73ffffb4>
 5e4:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 5e8:	053b0b3a 	0x53b0b3a
 5ec:	18021349 	0x18021349
 5f0:	240c0000 	li	t4,0
 5f4:	3e0b0b00 	0x3e0b0b00
 5f8:	0008030b 	0x8030b
 5fc:	000f0d00 	sll	at,t7,0x14
 600:	13490b0b 	beq	k0,t1,3230 <_mem_avail_start-0x7fffcdd0>
 604:	260e0000 	addiu	t6,s0,0
 608:	0f000000 	jal	c000000 <_mem_avail_start-0x74000000>
 60c:	13490026 	beq	k0,t1,6a8 <_mem_avail_start-0x7ffff958>
 610:	34100000 	li	s0,0x0
 614:	3a080300 	xori	t0,s0,0x300
 618:	49053b0b 	bc2t	$cc1,f248 <_mem_avail_start-0x7fff0db8>
 61c:	00170213 	0x170213
 620:	012e1100 	0x12e1100
 624:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 628:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 62c:	13491927 	beq	k0,t1,6acc <_mem_avail_start-0x7fff9534>
 630:	06120111 	bltzall	s0,a78 <_mem_avail_start-0x7ffff588>
 634:	42971840 	c0	0x971840
 638:	00130119 	0x130119
 63c:	00051200 	sll	v0,a1,0x8
 640:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 644:	13490b3b 	beq	k0,t1,3334 <_mem_avail_start-0x7fffcccc>
 648:	00001702 	srl	v0,zero,0x1c
 64c:	03000513 	0x3000513
 650:	3b0b3a08 	xori	t3,t8,0x3a08
 654:	0213490b 	0x213490b
 658:	14000018 	bnez	zero,6bc <_mem_avail_start-0x7ffff944>
 65c:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 660:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 664:	17021349 	bne	t8,v0,538c <_mem_avail_start-0x7fffac74>
 668:	2e150000 	sltiu	s5,s0,0
 66c:	03193f01 	0x3193f01
 670:	3b0b3a0e 	xori	t3,t8,0x3a0e
 674:	4919270b 	bc2t	$cc6,a2a4 <_mem_avail_start-0x7fff5d5c>
 678:	12011113 	beq	s0,at,4ac8 <_mem_avail_start-0x7fffb538>
 67c:	97184006 	lhu	t8,16390(t8)
 680:	00001942 	srl	v1,zero,0x5
 684:	01110100 	0x1110100
 688:	0b130e25 	j	c4c3894 <_mem_avail_start-0x73b3c76c>
 68c:	0e1b0e03 	jal	86c380c <_mem_avail_start-0x7793c7f4>
 690:	01111755 	0x1111755
 694:	00001710 	0x1710
 698:	0b002402 	j	c009008 <_mem_avail_start-0x73ff6ff8>
 69c:	030b3e0b 	0x30b3e0b
 6a0:	0300000e 	0x300000e
 6a4:	193f012e 	0x193f012e
 6a8:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 6ac:	19270b3b 	0x19270b3b
 6b0:	01111349 	0x1111349
 6b4:	18400612 	blez	v0,1f00 <_mem_avail_start-0x7fffe100>
 6b8:	01194297 	0x1194297
 6bc:	04000013 	bltz	zero,70c <_mem_avail_start-0x7ffff8f4>
 6c0:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 6c4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 6c8:	17021349 	bne	t8,v0,53f0 <_mem_avail_start-0x7fffac10>
 6cc:	2e050000 	sltiu	a1,s0,0
 6d0:	03193f01 	0x3193f01
 6d4:	3b0b3a0e 	xori	t3,t8,0x3a0e
 6d8:	3c13490b 	lui	s3,0x490b
 6dc:	00130119 	0x130119
 6e0:	00180600 	sll	zero,t8,0x18
 6e4:	89070000 	lwl	a3,0(t0)
 6e8:	11010182 	beq	t0,at,cf4 <_mem_avail_start-0x7ffff30c>
 6ec:	01133101 	0x1133101
 6f0:	08000013 	j	4c <_mem_avail_start-0x7fffffb4>
 6f4:	0001828a 	0x1828a
 6f8:	42911802 	c0	0x911802
 6fc:	09000018 	j	4000060 <_mem_avail_start-0x7bffffa0>
 700:	01018289 	0x1018289
 704:	13310111 	beq	t9,s1,b4c <_mem_avail_start-0x7ffff4b4>
 708:	240a0000 	li	t2,0
 70c:	3e0b0b00 	0x3e0b0b00
 710:	0008030b 	0x8030b
 714:	000f0b00 	sll	at,t7,0xc
 718:	13490b0b 	beq	k0,t1,3348 <_mem_avail_start-0x7fffccb8>
 71c:	260c0000 	addiu	t4,s0,0
 720:	00134900 	sll	t1,s3,0x4
 724:	00340d00 	0x340d00
 728:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 72c:	13490b3b 	beq	k0,t1,341c <_mem_avail_start-0x7fffcbe4>
 730:	00001702 	srl	v0,zero,0x1c
 734:	55010b0e 	bnel	t0,at,3370 <_mem_avail_start-0x7fffcc90>
 738:	0f000017 	jal	c00005c <_mem_avail_start-0x73ffffa4>
 73c:	0111010b 	0x111010b
 740:	13010612 	beq	t8,at,1f8c <_mem_avail_start-0x7fffe074>
 744:	2e100000 	sltiu	s0,s0,0
 748:	3c193f00 	lui	t9,0x3f00
 74c:	030e6e19 	0x30e6e19
 750:	3b0b3a0e 	xori	t3,t8,0x3a0e
 754:	0000000b 	movn	zero,zero,zero
 758:	25011101 	addiu	at,t0,4353
 75c:	030b130e 	0x30b130e
 760:	550e1b0e 	bnel	t0,t6,739c <_mem_avail_start-0x7fff8c64>
 764:	10011117 	beq	zero,at,4bc4 <_mem_avail_start-0x7fffb43c>
 768:	02000017 	0x2000017
 76c:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 770:	0e030b3e 	jal	80c2cf8 <_mem_avail_start-0x77f3d308>
 774:	24030000 	li	v1,0
 778:	3e0b0b00 	0x3e0b0b00
 77c:	0008030b 	0x8030b
 780:	00160400 	sll	zero,s6,0x10
 784:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 788:	13490b3b 	beq	k0,t1,3478 <_mem_avail_start-0x7fffcb88>
 78c:	2e050000 	sltiu	a1,s0,0
 790:	03193f01 	0x3193f01
 794:	3b0b3a0e 	xori	t3,t8,0x3a0e
 798:	4919270b 	bc2t	$cc6,a3c8 <_mem_avail_start-0x7fff5c38>
 79c:	12011113 	beq	s0,at,4bec <_mem_avail_start-0x7fffb414>
 7a0:	97184006 	lhu	t8,16390(t8)
 7a4:	13011942 	beq	t8,at,6cb0 <_mem_avail_start-0x7fff9350>
 7a8:	05060000 	0x5060000
 7ac:	3a080300 	xori	t0,s0,0x300
 7b0:	490b3b0b 	bc2tl	$cc2,f3e0 <_mem_avail_start-0x7fff0c20>
 7b4:	00170213 	0x170213
 7b8:	82890700 	lb	t1,1792(s4)
 7bc:	01110101 	0x1110101
 7c0:	00001331 	tgeu	zero,zero,0x4c
 7c4:	01828a08 	0x1828a08
 7c8:	91180200 	lbu	t8,512(t0)
 7cc:	00001842 	srl	v1,zero,0x1
 7d0:	3f002e09 	0x3f002e09
 7d4:	6e193c19 	0x6e193c19
 7d8:	3a0e030e 	xori	t6,s0,0x30e
 7dc:	000b3b0b 	0xb3b0b
 7e0:	11010000 	beq	t0,at,7e4 <_mem_avail_start-0x7ffff81c>
 7e4:	130e2501 	beq	t8,t6,9bec <_mem_avail_start-0x7fff6414>
 7e8:	1b0e030b 	0x1b0e030b
 7ec:	1117550e 	beq	t0,s7,15c28 <_mem_avail_start-0x7ffea3d8>
 7f0:	00171001 	0x171001
 7f4:	000f0200 	sll	zero,t7,0x8
 7f8:	00000b0b 	0xb0b
 7fc:	0b002403 	j	c00900c <_mem_avail_start-0x73ff6ff4>
 800:	030b3e0b 	0x30b3e0b
 804:	0400000e 	bltz	zero,840 <_mem_avail_start-0x7ffff7c0>
 808:	13490035 	beq	k0,t1,8e0 <_mem_avail_start-0x7ffff720>
 80c:	16050000 	bne	s0,a1,810 <_mem_avail_start-0x7ffff7f0>
 810:	3a0e0300 	xori	t6,s0,0x300
 814:	490b3b0b 	bc2tl	$cc2,f444 <_mem_avail_start-0x7fff0bbc>
 818:	06000013 	bltz	s0,868 <_mem_avail_start-0x7ffff798>
 81c:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 820:	08030b3e 	j	c2cf8 <_mem_avail_start-0x7ff3d308>
 824:	2e070000 	sltiu	a3,s0,0
 828:	03193f01 	0x3193f01
 82c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 830:	200e6e0b 	addi	t6,zero,28171
 834:	0013010b 	0x13010b
 838:	002f0800 	0x2f0800
 83c:	13490803 	beq	k0,t1,284c <_mem_avail_start-0x7fffd7b4>
 840:	05090000 	tgeiu	t0,0
 844:	3a0e0300 	xori	t6,s0,0x300
 848:	490b3b0b 	bc2tl	$cc2,f478 <_mem_avail_start-0x7fff0b88>
 84c:	0a000013 	j	800004c <_mem_avail_start-0x77ffffb4>
 850:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 854:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 858:	00001349 	0x1349
 85c:	0b000f0b 	j	c003c2c <_mem_avail_start-0x73ffc3d4>
 860:	0013490b 	0x13490b
 864:	012e0c00 	0x12e0c00
 868:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 86c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 870:	13490e6e 	beq	k0,t1,422c <_mem_avail_start-0x7fffbdd4>
 874:	13010b20 	beq	t8,at,34f8 <_mem_avail_start-0x7fffcb08>
 878:	2e0d0000 	sltiu	t5,s0,0
 87c:	03193f01 	0x3193f01
 880:	3b0b3a0e 	xori	t3,t8,0x3a0e
 884:	1113490b 	beq	t0,s3,12cb4 <_mem_avail_start-0x7ffed34c>
 888:	40061201 	0x40061201
 88c:	19429718 	0x19429718
 890:	00001301 	0x1301
 894:	31011d0e 	andi	at,t0,0x1d0e
 898:	12011113 	beq	s0,at,4ce8 <_mem_avail_start-0x7fffb318>
 89c:	590b5806 	0x590b5806
 8a0:	0f00000b 	jal	c00002c <_mem_avail_start-0x73ffffd4>
 8a4:	13310005 	beq	t9,s1,8bc <_mem_avail_start-0x7ffff744>
 8a8:	00001702 	srl	v0,zero,0x1c
 8ac:	11010b10 	beq	t0,at,34f0 <_mem_avail_start-0x7fffcb10>
 8b0:	00061201 	0x61201
 8b4:	00341100 	0x341100
 8b8:	0d1c1331 	jal	4704cc4 <_mem_avail_start-0x7b8fb33c>
 8bc:	2e120000 	sltiu	s2,s0,0
 8c0:	03193f01 	0x3193f01
 8c4:	3b0b3a0e 	xori	t3,t8,0x3a0e
 8c8:	1201110b 	beq	s0,at,4cf8 <_mem_avail_start-0x7fffb308>
 8cc:	97184006 	lhu	t8,16390(t8)
 8d0:	13011942 	beq	t8,at,6ddc <_mem_avail_start-0x7fff9224>
 8d4:	05130000 	bgezall	t0,8d8 <_mem_avail_start-0x7ffff728>
 8d8:	3a0e0300 	xori	t6,s0,0x300
 8dc:	490b3b0b 	bc2tl	$cc2,f50c <_mem_avail_start-0x7fff0af4>
 8e0:	00180213 	0x180213
 8e4:	00341400 	0x341400
 8e8:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 8ec:	13490b3b 	beq	k0,t1,35dc <_mem_avail_start-0x7fffca24>
 8f0:	00001702 	srl	v0,zero,0x1c
 8f4:	01828915 	0x1828915
 8f8:	31011100 	andi	at,t0,0x1100
 8fc:	16000013 	bnez	s0,94c <_mem_avail_start-0x7ffff6b4>
 900:	1331011d 	beq	t9,s1,d78 <_mem_avail_start-0x7ffff288>
 904:	06120111 	bltzall	s0,d4c <_mem_avail_start-0x7ffff2b4>
 908:	0b590b58 	j	d642d60 <_mem_avail_start-0x729bd2a0>
 90c:	00001301 	0x1301
 910:	31000517 	andi	zero,t0,0x517
 914:	18000013 	blez	zero,964 <_mem_avail_start-0x7ffff69c>
 918:	1331011d 	beq	t9,s1,d90 <_mem_avail_start-0x7ffff270>
 91c:	17550152 	bne	k0,s5,e68 <_mem_avail_start-0x7ffff198>
 920:	0b590b58 	j	d642d60 <_mem_avail_start-0x729bd2a0>
 924:	00001301 	0x1301
 928:	31011d19 	andi	at,t0,0x1d19
 92c:	55015213 	bnel	t0,at,1517c <_mem_avail_start-0x7ffeae84>
 930:	590b5817 	0x590b5817
 934:	1a00000b 	blez	s0,964 <_mem_avail_start-0x7ffff69c>
 938:	1755010b 	bne	k0,s5,d68 <_mem_avail_start-0x7ffff298>
 93c:	341b0000 	li	k1,0x0
 940:	02133100 	0x2133100
 944:	1c000018 	bgtz	zero,9a8 <_mem_avail_start-0x7ffff658>
 948:	193f012e 	0x193f012e
 94c:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 950:	0b200b3b 	j	c802cec <_mem_avail_start-0x737fd314>
 954:	00001301 	0x1301
 958:	3f012e1d 	0x3f012e1d
 95c:	3a0e0319 	xori	t6,s0,0x319
 960:	490b3b0b 	bc2tl	$cc2,f590 <_mem_avail_start-0x7fff0a70>
 964:	010b2013 	0x10b2013
 968:	1e000013 	bgtz	s0,9b8 <_mem_avail_start-0x7ffff648>
 96c:	1331012e 	beq	t9,s1,e28 <_mem_avail_start-0x7ffff1d8>
 970:	06120111 	bltzall	s0,db8 <_mem_avail_start-0x7ffff248>
 974:	42971840 	c0	0x971840
 978:	00130119 	0x130119
 97c:	00051f00 	sll	v1,a1,0x1c
 980:	18021331 	0x18021331
 984:	2e200000 	sltiu	zero,s1,0
 988:	11133101 	beq	t0,s3,cd90 <_mem_avail_start-0x7fff3270>
 98c:	40061201 	0x40061201
 990:	19429718 	0x19429718
 994:	Address 0x0000000000000994 is out of bounds.


Disassembly of section .debug_loc:

00000000 <.debug_loc>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	bfc004c0 	cache	0x0,1216(s8)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	bfc004e0 	cache	0x0,1248(s8)
   8:	9f300002 	0x9f300002
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	bfc004e0 	cache	0x0,1248(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	bfc004e4 	cache	0x0,1252(s8)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	80720007 	lb	s2,7(v1)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	07ffffe0 	0x7ffffe0
  1c:	c004e49f 	ll	a0,-7009(zero)
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	c004e8bf 	ll	a0,-5953(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	720007bf 	sdbbp	0x8001e
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	ffffe081 	sdc3	$31,-8063(ra)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	04e89f07 	tgei	a3,-24825
  30:	04f8bfc0 	0x4f8bfc0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	0007bfc0 	sll	s7,a3,0x1f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	ffe08072 	sdc3	$0,-32654(ra)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	009f07ff 	0x9f07ff
  40:	00000000 	nop
  44:	f8000000 	sdc2	$0,0(zero)
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	10bfc004 	beq	a1,ra,ffff005c <_text_end+0x403eef5c>
  4c:	07bfc005 	0x7bfc005
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	e0808000 	sc	zero,-32768(a0)
  54:	9f07ffff 	0x9f07ffff
  58:	bfc00510 	cache	0x0,1296(s8)
  5c:	bfc00518 	cache	0x0,1304(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	ff800007 	sdc3	$0,7(gp)
  64:	07ffffdf 	0x7ffffdf
  68:	c005349f 	ll	a1,13471(zero)
  6c:	c00544bf 	ll	a1,17599(zero)
  70:	800007bf 	lb	zero,1983(zero)
  74:	ffffe080 	sdc3	$31,-8064(ra)
  78:	00009f07 	0x9f07
  7c:	00000000 	nop
  80:	04fc0000 	0x4fc0000
  84:	050bbfc0 	tltiu	t0,-16448
  88:	0006bfc0 	sll	s7,a2,0x1f
  8c:	ff080074 	sdc3	$8,116(t8)
  90:	05349f1a 	0x5349f1a
  94:	053bbfc0 	0x53bbfc0
  98:	0008bfc0 	sll	s7,t0,0x1f
  9c:	01940080 	0x1940080
  a0:	9f1aff08 	0x9f1aff08
	...
  ac:	bfc00478 	cache	0x0,1144(s8)
  b0:	bfc0049c 	cache	0x0,1180(s8)
  b4:	9c540001 	0x9c540001
  b8:	b8bfc004 	swr	ra,-16380(a1)
  bc:	04bfc004 	0x4bfc004
  c0:	5401f300 	bnel	zero,at,ffffccc4 <_text_end+0x403fbbc4>
  c4:	c004b89f 	ll	a0,-18273(zero)
  c8:	c004c0bf 	ll	a0,-16193(zero)
  cc:	540001bf 	bnezl	zero,7cc <_mem_avail_start-0x7ffff834>
  d0:	00000000 	nop
  d4:	00000000 	nop
  d8:	bfc0070c 	cache	0x0,1804(s8)
  dc:	bfc0071c 	cache	0x0,1820(s8)
  e0:	1c540001 	0x1c540001
  e4:	68bfc007 	0x68bfc007
  e8:	01bfc007 	srav	t8,ra,t5
  ec:	07686100 	tgei	k1,24832
  f0:	077cbfc0 	0x77cbfc0
  f4:	0004bfc0 	sll	s7,a0,0x1f
  f8:	9f5401f3 	0x9f5401f3
  fc:	bfc0077c 	cache	0x0,1916(s8)
 100:	bfc007c0 	cache	0x0,1984(s8)
 104:	00610001 	movt	zero,v1,$fcc0
 108:	00000000 	nop
 10c:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
 110:	2fbfc007 	sltiu	ra,sp,-16377
 114:	01bfc007 	srav	t8,ra,t5
 118:	072f5500 	0x72f5500
 11c:	07c0bfc0 	bltz	s8,ffff0020 <_text_end+0x403eef20>
 120:	0004bfc0 	sll	s7,a0,0x1f
 124:	9f5501f3 	0x9f5501f3
	...
 130:	bfc00788 	cache	0x0,1928(s8)
 134:	bfc007af 	cache	0x0,1967(s8)
 138:	00560001 	0x560001
 13c:	00000000 	nop
 140:	a4000000 	sh	zero,0(zero)
 144:	c8bfc006 	lwc2	$31,-16378(a1)
 148:	02bfc006 	srlv	t8,ra,s5
 14c:	c89f3000 	lwc2	$31,12288(a0)
 150:	e8bfc006 	swc2	$31,-16378(a1)
 154:	01bfc006 	srlv	t8,ra,t5
 158:	00006000 	sll	t4,zero,0x0
 15c:	00000000 	nop
 160:	06dc0000 	0x6dc0000
 164:	06efbfc0 	0x6efbfc0
 168:	0001bfc0 	sll	s7,at,0x1f
 16c:	00000056 	0x56
 170:	00000000 	nop
 174:	c006dc00 	ll	a2,-9216(zero)
 178:	c006efbf 	ll	a2,-4161(zero)
 17c:	570001bf 	bnezl	t8,87c <_mem_avail_start-0x7ffff784>
 180:	00000000 	nop
 184:	00000000 	nop
 188:	bfc006dc 	cache	0x0,1756(s8)
 18c:	bfc006ef 	cache	0x0,1775(s8)
 190:	00520001 	0x520001
 194:	00000000 	nop
 198:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
 19c:	40bfc006 	0x40bfc006
 1a0:	01bfc006 	srlv	t8,ra,t5
 1a4:	06405400 	bltz	s2,151a8 <_mem_avail_start-0x7ffeae58>
 1a8:	069cbfc0 	0x69cbfc0
 1ac:	0001bfc0 	sll	s7,at,0x1f
 1b0:	c0069c60 	ll	a2,-25504(zero)
 1b4:	c006a4bf 	ll	a2,-23361(zero)
 1b8:	f30004bf 	0xf30004bf
 1bc:	009f5401 	0x9f5401
 1c0:	00000000 	nop
 1c4:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
 1c8:	40bfc006 	0x40bfc006
 1cc:	02bfc006 	srlv	t8,ra,s5
 1d0:	409f3100 	0x409f3100
 1d4:	4cbfc006 	0x4cbfc006
 1d8:	01bfc006 	srlv	t8,ra,t5
 1dc:	064c6100 	teqi	s2,24832
 1e0:	0653bfc0 	bgezall	s2,ffff00e4 <_text_end+0x403eefe4>
 1e4:	0001bfc0 	sll	s7,at,0x1f
 1e8:	c0065355 	ll	a2,21333(zero)
 1ec:	c00654bf 	ll	a2,21695(zero)
 1f0:	810003bf 	lb	zero,959(t0)
 1f4:	06549f7f 	0x6549f7f
 1f8:	0698bfc0 	0x698bfc0
 1fc:	0001bfc0 	sll	s7,at,0x1f
 200:	00000061 	0x61
 204:	00000000 	nop
 208:	c0059400 	ll	a1,-27648(zero)
 20c:	c005ecbf 	ll	a1,-4929(zero)
 210:	600001bf 	0x600001bf
 214:	bfc005f8 	cache	0x0,1528(s8)
 218:	bfc0060c 	cache	0x0,1548(s8)
 21c:	00600001 	movf	zero,v1,$fcc0
 220:	00000000 	nop
 224:	cc000000 	pref	0x0,0(zero)
 228:	dfbfc005 	ldc3	$31,-16379(sp)
 22c:	01bfc005 	0x1bfc005
 230:	05f85200 	0x5f85200
 234:	0603bfc0 	bgezl	s0,ffff0138 <_text_end+0x403ef038>
 238:	0001bfc0 	sll	s7,at,0x1f
 23c:	00000052 	mflhxu	zero
 240:	00000000 	nop
 244:	c007c000 	ll	a3,-16384(zero)
 248:	c007fcbf 	ll	a3,-833(zero)
 24c:	540001bf 	bnezl	zero,94c <_mem_avail_start-0x7ffff6b4>
 250:	bfc007fc 	cache	0x0,2044(s8)
 254:	bfc0081c 	cache	0x0,2076(s8)
 258:	1c620001 	0x1c620001
 25c:	30bfc008 	andi	ra,a1,0xc008
 260:	04bfc008 	0x4bfc008
 264:	5401f300 	bnel	zero,at,ffffce68 <_text_end+0x403fbd68>
 268:	c008309f 	ll	t0,12447(zero)
 26c:	c009e4bf 	ll	t1,-6977(zero)
 270:	620001bf 	0x620001bf
	...
 27c:	bfc007f4 	cache	0x0,2036(s8)
 280:	bfc007fc 	cache	0x0,2044(s8)
 284:	9f300002 	0x9f300002
 288:	bfc007fc 	cache	0x0,2044(s8)
 28c:	bfc00820 	cache	0x0,2080(s8)
 290:	30610001 	andi	at,v1,0x1
 294:	44bfc008 	0x44bfc008
 298:	01bfc009 	0x1bfc009
 29c:	09446100 	j	5118400 <_mem_avail_start-0x7aee7c00>
 2a0:	094cbfc0 	j	532ff00 <_mem_avail_start-0x7acd0100>
 2a4:	0003bfc0 	sll	s7,v1,0x1f
 2a8:	4c9f7f81 	0x4c9f7f81
 2ac:	9cbfc009 	0x9cbfc009
 2b0:	01bfc009 	0x1bfc009
 2b4:	09a86100 	j	6a18400 <_mem_avail_start-0x795e7c00>
 2b8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
 2bc:	0001bfc0 	sll	s7,at,0x1f
 2c0:	c009c461 	ll	t1,-15263(zero)
 2c4:	c009ccbf 	ll	t1,-13121(zero)
 2c8:	740006bf 	jalx	1afc <_mem_avail_start-0x7fffe504>
 2cc:	1c008200 	bgtz	zero,fffe0ad0 <_text_end+0x403df9d0>
 2d0:	c009cc9f 	ll	t1,-13153(zero)
 2d4:	c009e4bf 	ll	t1,-6977(zero)
 2d8:	610001bf 	0x610001bf
	...
 2e4:	bfc00830 	cache	0x0,2096(s8)
 2e8:	bfc00844 	cache	0x0,2116(s8)
 2ec:	cc640001 	pref	0x4,1(v1)
 2f0:	e4bfc009 	swc1	$f31,-16375(a1)
 2f4:	01bfc009 	0x1bfc009
 2f8:	00006400 	sll	t4,zero,0x10
 2fc:	00000000 	nop
 300:	07f40000 	0x7f40000
 304:	0824bfc0 	j	92ff00 <_mem_avail_start-0x7f6d0100>
 308:	0001bfc0 	sll	s7,at,0x1f
 30c:	c0083060 	ll	t0,12384(zero)
 310:	c009e4bf 	ll	t1,-6977(zero)
 314:	600001bf 	0x600001bf
	...
 320:	bfc00844 	cache	0x0,2116(s8)
 324:	bfc00880 	cache	0x0,2176(s8)
 328:	90550001 	lbu	s5,1(v0)
 32c:	afbfc008 	sw	ra,-16376(sp)
 330:	01bfc008 	0x1bfc008
 334:	08b85500 	j	2e15400 <_mem_avail_start-0x7d1eac00>
 338:	090bbfc0 	j	42eff00 <_mem_avail_start-0x7bd10100>
 33c:	0001bfc0 	sll	s7,at,0x1f
 340:	c0092055 	ll	t1,8277(zero)
 344:	c0092fbf 	ll	t1,12223(zero)
 348:	550001bf 	bnezl	t0,a48 <_mem_avail_start-0x7ffff5b8>
 34c:	bfc00938 	cache	0x0,2360(s8)
 350:	bfc0094b 	cache	0x0,2379(s8)
 354:	54550001 	bnel	v0,s5,35c <_mem_avail_start-0x7ffffca4>
 358:	63bfc009 	0x63bfc009
 35c:	01bfc009 	0x1bfc009
 360:	09705500 	j	5c15400 <_mem_avail_start-0x7a3eac00>
 364:	098fbfc0 	j	63eff00 <_mem_avail_start-0x79c10100>
 368:	0001bfc0 	sll	s7,at,0x1f
 36c:	c0099855 	ll	t1,-26539(zero)
 370:	c009a0bf 	ll	t1,-24385(zero)
 374:	550001bf 	bnezl	t0,a74 <_mem_avail_start-0x7ffff58c>
 378:	bfc009a8 	cache	0x0,2472(s8)
 37c:	bfc009cc 	cache	0x0,2508(s8)
 380:	00550001 	movt	zero,v0,$fcc5
 384:	00000000 	nop
 388:	e4000000 	swc1	$f0,0(zero)
 38c:	18bfc009 	0x18bfc009
 390:	01bfc00a 	movz	t8,t5,ra
 394:	0a185400 	j	8615000 <_mem_avail_start-0x779eb000>
 398:	0a20bfc0 	j	882ff00 <_mem_avail_start-0x777d0100>
 39c:	0004bfc0 	sll	s7,a0,0x1f
 3a0:	9f1f0080 	0x9f1f0080
 3a4:	bfc00a20 	cache	0x0,2592(s8)
 3a8:	bfc00a68 	cache	0x0,2664(s8)
 3ac:	01f30004 	sllv	zero,s3,t7
 3b0:	0a689f54 	j	9a27d50 <_mem_avail_start-0x765d82b0>
 3b4:	0a70bfc0 	j	9c2ff00 <_mem_avail_start-0x763d0100>
 3b8:	0001bfc0 	sll	s7,at,0x1f
 3bc:	c00a7054 	ll	t2,28756(zero)
 3c0:	c00abcbf 	ll	t2,-17217(zero)
 3c4:	f30004bf 	0xf30004bf
 3c8:	009f5401 	0x9f5401
 3cc:	00000000 	nop
 3d0:	e4000000 	swc1	$f0,0(zero)
 3d4:	1fbfc009 	0x1fbfc009
 3d8:	01bfc00a 	movz	t8,t5,ra
 3dc:	0a1f5500 	j	87d5400 <_mem_avail_start-0x7782ac00>
 3e0:	0a38bfc0 	j	8e2ff00 <_mem_avail_start-0x771d0100>
 3e4:	0001bfc0 	sll	s7,at,0x1f
 3e8:	c00a3863 	ll	t2,14435(zero)
 3ec:	c00a68bf 	ll	t2,26815(zero)
 3f0:	f30004bf 	0xf30004bf
 3f4:	689f5501 	0x689f5501
 3f8:	70bfc00a 	0x70bfc00a
 3fc:	01bfc00a 	movz	t8,t5,ra
 400:	0a705500 	j	9c15400 <_mem_avail_start-0x763eac00>
 404:	0a8cbfc0 	j	a32ff00 <_mem_avail_start-0x75cd0100>
 408:	0001bfc0 	sll	s7,at,0x1f
 40c:	c00a8c63 	ll	t2,-29597(zero)
 410:	c00abcbf 	ll	t2,-17217(zero)
 414:	f30004bf 	0xf30004bf
 418:	009f5501 	0x9f5501
 41c:	00000000 	nop
 420:	e4000000 	swc1	$f0,0(zero)
 424:	1fbfc009 	0x1fbfc009
 428:	01bfc00a 	movz	t8,t5,ra
 42c:	0a1f5600 	j	87d5800 <_mem_avail_start-0x7782a800>
 430:	0a4cbfc0 	j	932ff00 <_mem_avail_start-0x76cd0100>
 434:	0001bfc0 	sll	s7,at,0x1f
 438:	c00a4c64 	ll	t2,19556(zero)
 43c:	c00a68bf 	ll	t2,26815(zero)
 440:	f30004bf 	0xf30004bf
 444:	689f5601 	0x689f5601
 448:	70bfc00a 	0x70bfc00a
 44c:	01bfc00a 	movz	t8,t5,ra
 450:	0a705600 	j	9c15800 <_mem_avail_start-0x763ea800>
 454:	0abcbfc0 	j	af2ff00 <_mem_avail_start-0x750d0100>
 458:	0001bfc0 	sll	s7,at,0x1f
 45c:	00000064 	0x64
 460:	00000000 	nop
 464:	c009e400 	ll	t1,-7168(zero)
 468:	c00a1fbf 	ll	t2,8127(zero)
 46c:	570001bf 	bnezl	t8,b6c <_mem_avail_start-0x7ffff494>
 470:	bfc00a1f 	cache	0x0,2591(s8)
 474:	bfc00a68 	cache	0x0,2664(s8)
 478:	01f30004 	sllv	zero,s3,t7
 47c:	0a689f57 	j	9a27d5c <_mem_avail_start-0x765d82a4>
 480:	0a70bfc0 	j	9c2ff00 <_mem_avail_start-0x763d0100>
 484:	0001bfc0 	sll	s7,at,0x1f
 488:	c00a7057 	ll	t2,28759(zero)
 48c:	c00abcbf 	ll	t2,-17217(zero)
 490:	f30004bf 	0xf30004bf
 494:	009f5701 	0x9f5701
 498:	00000000 	nop
 49c:	28000000 	slti	zero,zero,0
 4a0:	54bfc00a 	bnel	a1,ra,ffff04cc <_text_end+0x403ef3cc>
 4a4:	01bfc00a 	movz	t8,t5,ra
 4a8:	0a706200 	j	9c18800 <_mem_avail_start-0x763e7800>
 4ac:	0a84bfc0 	j	a12ff00 <_mem_avail_start-0x75ed0100>
 4b0:	0001bfc0 	sll	s7,at,0x1f
 4b4:	c00a8c62 	ll	t2,-29598(zero)
 4b8:	c00abcbf 	ll	t2,-17217(zero)
 4bc:	620001bf 	0x620001bf
	...
 4c8:	bfc00a30 	cache	0x0,2608(s8)
 4cc:	bfc00a38 	cache	0x0,2616(s8)
 4d0:	0083000e 	0x83000e
 4d4:	16008212 	bnez	s0,fffe0d20 <_text_end+0x403dfc20>
 4d8:	01282b14 	0x1282b14
 4dc:	9f131600 	0x9f131600
 4e0:	bfc00a38 	cache	0x0,2616(s8)
 4e4:	bfc00a3c 	cache	0x0,2620(s8)
 4e8:	01f3000f 	0x1f3000f
 4ec:	00821255 	0x821255
 4f0:	282b1416 	slti	t3,at,5142
 4f4:	13160001 	beq	t8,s6,4fc <_mem_avail_start-0x7ffffb04>
 4f8:	c00a3c9f 	ll	t2,15519(zero)
 4fc:	c00a5cbf 	ll	t2,23743(zero)
 500:	600001bf 	0x600001bf
 504:	bfc00a8c 	cache	0x0,2700(s8)
 508:	bfc00abc 	cache	0x0,2748(s8)
 50c:	00600001 	movf	zero,v1,$fcc0
 510:	00000000 	nop
 514:	9c000000 	0x9c000000
 518:	a8bfc00a 	swl	ra,-16374(a1)
 51c:	01bfc00a 	movz	t8,t5,ra
 520:	00005200 	sll	t2,zero,0x8
 524:	00000000 	nop
 528:	0a180000 	j	8600000 <_mem_avail_start-0x77a00000>
 52c:	0a20bfc0 	j	882ff00 <_mem_avail_start-0x777d0100>
 530:	0001bfc0 	sll	s7,at,0x1f
 534:	c00a2860 	ll	t2,10336(zero)
 538:	c00a34bf 	ll	t2,13503(zero)
 53c:	600001bf 	0x600001bf
 540:	bfc00a68 	cache	0x0,2664(s8)
 544:	bfc00a70 	cache	0x0,2672(s8)
 548:	70540001 	maddu	v0,s4
 54c:	8cbfc00a 	lw	ra,-16374(a1)
 550:	01bfc00a 	movz	t8,t5,ra
 554:	00006000 	sll	t4,zero,0x0
	...
 564:	00010000 	sll	zero,at,0x0
 568:	00000055 	0x55
 56c:	00000000 	nop
 570:	56000100 	bnezl	s0,974 <_mem_avail_start-0x7ffff68c>
 574:	00000000 	nop
 578:	00000000 	nop
 57c:	01f30004 	sllv	zero,s3,t7
 580:	00009f55 	0x9f55
	...
 590:	00010000 	sll	zero,at,0x0
 594:	00000054 	0x54
 598:	00000000 	nop
 59c:	f3000400 	0xf3000400
 5a0:	009f5401 	0x9f5401
	...
 5b0:	01000000 	0x1000000
 5b4:	00005500 	sll	t2,zero,0x14
 5b8:	00000000 	nop
 5bc:	00040000 	sll	zero,a0,0x0
 5c0:	9f5501f3 	0x9f5501f3
	...
 5d4:	00560001 	0x560001
 5d8:	00000000 	nop
 5dc:	06000000 	bltz	s0,5e0 <_mem_avail_start-0x7ffffa20>
 5e0:	5601f300 	bnel	s0,at,ffffd1e4 <_text_end+0x403fc0e4>
 5e4:	009f1c31 	tgeu	a0,ra,0x70
	...
 5f4:	01000000 	0x1000000
 5f8:	00005400 	sll	t2,zero,0x10
 5fc:	00000000 	nop
 600:	00010000 	sll	zero,at,0x0
 604:	00000052 	mflhxu	zero
	...
 614:	55000100 	bnezl	t0,a18 <_mem_avail_start-0x7ffff5e8>
 618:	00000000 	nop
 61c:	00000000 	nop
 620:	01f30004 	sllv	zero,s3,t7
 624:	00009f55 	0x9f55
 628:	00000000 	nop
 62c:	00010000 	sll	zero,at,0x0
 630:	00000055 	0x55
 634:	00000000 	nop
 638:	f3000400 	0xf3000400
 63c:	009f5501 	0x9f5501
	...
 64c:	01000000 	0x1000000
 650:	00005600 	sll	t2,zero,0x18
 654:	00000000 	nop
 658:	000a0000 	sll	zero,t2,0x0
 65c:	72200073 	0x72200073
 660:	00762200 	0x762200
 664:	00009f22 	0x9f22
 668:	00000000 	nop
 66c:	00010000 	sll	zero,at,0x0
 670:	00000056 	0x56
 674:	00000000 	nop
 678:	f3001000 	0xf3001000
 67c:	73205601 	0x73205601
 680:	01f32200 	0x1f32200
 684:	01f31c55 	0x1f31c55
 688:	009f2256 	0x9f2256
 68c:	00000000 	nop
 690:	07000000 	bltz	t8,694 <_mem_avail_start-0x7ffff96c>
 694:	f3007300 	0xf3007300
 698:	9f1c5501 	0x9f1c5501
	...
 6a4:	0073000a 	movz	zero,v1,s3
 6a8:	22007220 	addi	zero,s0,29216
 6ac:	9f220076 	0x9f220076
	...
 6b8:	00720009 	0x720009
 6bc:	761c0073 	jalx	87001cc <_mem_avail_start-0x778ffe34>
 6c0:	009f2200 	0x9f2200
	...
 6d0:	01000000 	0x1000000
 6d4:	00005500 	sll	t2,zero,0x14
 6d8:	00000000 	nop
 6dc:	00010000 	sll	zero,at,0x0
 6e0:	00000053 	mtlhx	zero
 6e4:	00000000 	nop
 6e8:	55000100 	bnezl	t0,aec <_mem_avail_start-0x7ffff514>
 6ec:	00000000 	nop
	...
 6fc:	00540001 	movf	zero,v0,$fcc5
 700:	00000000 	nop
 704:	01000000 	0x1000000
 708:	00005200 	sll	t2,zero,0x8
 70c:	00000000 	nop
 710:	00010000 	sll	zero,at,0x0
 714:	00000053 	mtlhx	zero
 718:	00000000 	nop
 71c:	52000100 	beqzl	s0,b20 <_mem_avail_start-0x7ffff4e0>
 720:	00000000 	nop
 724:	00000000 	nop
 728:	00570001 	0x570001
 72c:	00000000 	nop
 730:	01000000 	0x1000000
 734:	00005500 	sll	t2,zero,0x14
 738:	00000000 	nop
 73c:	00010000 	sll	zero,at,0x0
 740:	00000053 	mtlhx	zero
	...
 750:	54000100 	bnezl	zero,b54 <_mem_avail_start-0x7ffff4ac>
 754:	00000000 	nop
 758:	00000000 	nop
 75c:	00520001 	0x520001
	...
 76c:	01000000 	0x1000000
 770:	00005500 	sll	t2,zero,0x14
 774:	00000000 	nop
 778:	00040000 	sll	zero,a0,0x0
 77c:	9f5501f3 	0x9f5501f3
	...
 790:	00560001 	0x560001
 794:	00000000 	nop
 798:	04000000 	bltz	zero,79c <_mem_avail_start-0x7ffff864>
 79c:	5601f300 	bnel	s0,at,ffffd3a0 <_text_end+0x403fc2a0>
 7a0:	0000009f 	0x9f
 7a4:	00000000 	nop
 7a8:	73000b00 	0x73000b00
 7ac:	00722000 	0x722000
 7b0:	5601f322 	bnel	s0,at,ffffd43c <_text_end+0x403fc33c>
 7b4:	00009f22 	0x9f22
 7b8:	00000000 	nop
 7bc:	000a0000 	sll	zero,t2,0x0
 7c0:	00730072 	tlt	v1,s3,0x1
 7c4:	5601f31c 	bnel	s0,at,ffffd438 <_text_end+0x403fc338>
 7c8:	00009f22 	0x9f22
	...
 7d8:	00010000 	sll	zero,at,0x0
 7dc:	00000054 	0x54
 7e0:	00000000 	nop
 7e4:	53000100 	beqzl	t8,be8 <_mem_avail_start-0x7ffff418>
 7e8:	00000000 	nop
 7ec:	00000000 	nop
 7f0:	bfc00abc 	cache	0x0,2748(s8)
 7f4:	bfc00ac8 	cache	0x0,2760(s8)
 7f8:	c8540001 	lwc2	$20,1(v0)
 7fc:	e0bfc00a 	sc	ra,-16374(a1)
 800:	01bfc00a 	movz	t8,t5,ra
 804:	00005200 	sll	t2,zero,0x8
 808:	00000000 	nop
 80c:	0abc0000 	j	af00000 <_mem_avail_start-0x75100000>
 810:	0ac4bfc0 	j	b12ff00 <_mem_avail_start-0x74ed0100>
 814:	0001bfc0 	sll	s7,at,0x1f
 818:	c00ac456 	ll	t2,-15274(zero)
 81c:	c00ac8bf 	ll	t2,-14145(zero)
 820:	f30004bf 	0xf30004bf
 824:	c89f5601 	lwc2	$31,22017(a0)
 828:	d8bfc00a 	ldc2	$31,-16374(a1)
 82c:	0bbfc00a 	j	eff0028 <_mem_avail_start-0x7100ffd8>
 830:	20007300 	addi	zero,zero,29440
 834:	f3220072 	0xf3220072
 838:	9f225601 	0x9f225601
 83c:	bfc00ad8 	cache	0x0,2776(s8)
 840:	bfc00ae0 	cache	0x0,2784(s8)
 844:	0072000a 	movz	zero,v1,s2
 848:	f31c0073 	0xf31c0073
 84c:	9f225601 	0x9f225601
	...
 858:	bfc00ac0 	cache	0x0,2752(s8)
 85c:	bfc00ac8 	cache	0x0,2760(s8)
 860:	c8540001 	lwc2	$20,1(v0)
 864:	e0bfc00a 	sc	ra,-16374(a1)
 868:	01bfc00a 	movz	t8,t5,ra
 86c:	00005300 	sll	t2,zero,0xc
	...
 87c:	00010000 	sll	zero,at,0x0
 880:	00000054 	0x54
 884:	00000000 	nop
 888:	52000100 	beqzl	s0,c8c <_mem_avail_start-0x7ffff374>
 88c:	00000000 	nop
	...
 89c:	00540001 	movf	zero,v0,$fcc5
 8a0:	00000000 	nop
 8a4:	01000000 	0x1000000
 8a8:	00005200 	sll	t2,zero,0x8
 8ac:	00000000 	nop
 8b0:	00010000 	sll	zero,at,0x0
 8b4:	00000052 	mflhxu	zero
	...
 8c4:	54000100 	bnezl	zero,cc8 <_mem_avail_start-0x7ffff338>
 8c8:	00000000 	nop
 8cc:	00000000 	nop
 8d0:	00540001 	movf	zero,v0,$fcc5
	...
 8e0:	01000000 	0x1000000
 8e4:	00005500 	sll	t2,zero,0x14
 8e8:	00000000 	nop
 8ec:	00010000 	sll	zero,at,0x0
 8f0:	00000055 	0x55
	...
 900:	56000100 	bnezl	s0,d04 <_mem_avail_start-0x7ffff2fc>
 904:	00000000 	nop
 908:	00000000 	nop
 90c:	01f30004 	sllv	zero,s3,t7
 910:	00009f56 	0x9f56
 914:	00000000 	nop
 918:	00060000 	sll	zero,a2,0x0
 91c:	315601f3 	andi	s6,t2,0x1f3
 920:	00009f1c 	0x9f1c
 924:	00000000 	nop
 928:	00040000 	sll	zero,a0,0x0
 92c:	9f5601f3 	0x9f5601f3
	...
 940:	00540001 	movf	zero,v0,$fcc5
 944:	00000000 	nop
 948:	01000000 	0x1000000
 94c:	00005400 	sll	t2,zero,0x10
	...
 95c:	00010000 	sll	zero,at,0x0
 960:	00000055 	0x55
 964:	00000000 	nop
 968:	55000100 	bnezl	t0,d6c <_mem_avail_start-0x7ffff294>
 96c:	00000000 	nop
	...
 97c:	00540001 	movf	zero,v0,$fcc5
 980:	00000000 	nop
 984:	01000000 	0x1000000
 988:	00005200 	sll	t2,zero,0x8
	...
 998:	00010000 	sll	zero,at,0x0
 99c:	00000055 	0x55
 9a0:	00000000 	nop
 9a4:	55000100 	bnezl	t0,da8 <_mem_avail_start-0x7ffff258>
 9a8:	00000000 	nop
	...
 9b8:	00560001 	0x560001
 9bc:	00000000 	nop
 9c0:	04000000 	bltz	zero,9c4 <_mem_avail_start-0x7ffff63c>
 9c4:	5601f300 	bnel	s0,at,ffffd5c8 <_text_end+0x403fc4c8>
 9c8:	0000009f 	0x9f
 9cc:	00000000 	nop
 9d0:	72000a00 	0x72000a00
 9d4:	1c007300 	bgtz	zero,1d5d8 <_mem_avail_start-0x7ffe2a28>
 9d8:	225601f3 	addi	s6,s2,499
 9dc:	0000009f 	0x9f
	...
 9ec:	54000100 	bnezl	zero,df0 <_mem_avail_start-0x7ffff210>
 9f0:	00000000 	nop
 9f4:	00000000 	nop
 9f8:	00530001 	0x530001
	...
 a08:	01000000 	0x1000000
 a0c:	00005400 	sll	t2,zero,0x10
 a10:	00000000 	nop
 a14:	00010000 	sll	zero,at,0x0
 a18:	00000052 	mflhxu	zero
	...
 a28:	55000100 	bnezl	t0,e2c <_mem_avail_start-0x7ffff1d4>
 a2c:	00000000 	nop
 a30:	00000000 	nop
 a34:	00550001 	movt	zero,v0,$fcc5
	...
 a44:	01000000 	0x1000000
 a48:	00005400 	sll	t2,zero,0x10
 a4c:	00000000 	nop
 a50:	00010000 	sll	zero,at,0x0
 a54:	00000053 	mtlhx	zero
	...
 a64:	54000100 	bnezl	zero,e68 <_mem_avail_start-0x7ffff198>
 a68:	00000000 	nop
 a6c:	00000000 	nop
 a70:	00740006 	srlv	zero,s4,v1
 a74:	9f220072 	0x9f220072
	...
 a80:	00720008 	0x720008
 a84:	23220074 	addi	v0,t9,116
 a88:	00009f01 	0x9f01
 a8c:	00000000 	nop
 a90:	00060000 	sll	zero,a2,0x0
 a94:	00740072 	tlt	v1,s4,0x1
 a98:	00009f22 	0x9f22
	...
 aa8:	00020000 	sll	zero,v0,0x0
 aac:	00009f30 	tge	zero,zero,0x27c
 ab0:	00000000 	nop
 ab4:	00010000 	sll	zero,at,0x0
 ab8:	00000052 	mflhxu	zero
	...
 ac8:	54000100 	bnezl	zero,ecc <_mem_avail_start-0x7ffff134>
 acc:	00000000 	nop
 ad0:	00000000 	nop
 ad4:	00530001 	0x530001
	...
 ae4:	02000000 	0x2000000
 ae8:	009f3000 	0x9f3000
 aec:	00000000 	nop
 af0:	01000000 	0x1000000
 af4:	00005200 	sll	t2,zero,0x8
 af8:	00000000 	nop
 afc:	0b400000 	j	d000000 <_mem_avail_start-0x73000000>
 b00:	0b4fbfc0 	j	d3eff00 <_mem_avail_start-0x72c10100>
 b04:	0001bfc0 	sll	s7,at,0x1f
 b08:	c00b4f54 	ll	t3,20308(zero)
 b0c:	c00b70bf 	ll	t3,28863(zero)
 b10:	f30004bf 	0xf30004bf
 b14:	009f5401 	0x9f5401
 b18:	00000000 	nop
 b1c:	e0000000 	sc	zero,0(zero)
 b20:	fcbfc00a 	sdc3	$31,-16374(a1)
 b24:	01bfc00a 	movz	t8,t5,ra
 b28:	0afc5400 	j	bf15000 <_mem_avail_start-0x740eb000>
 b2c:	0b10bfc0 	j	c42ff00 <_mem_avail_start-0x73bd0100>
 b30:	0001bfc0 	sll	s7,at,0x1f
 b34:	c00b2061 	ll	t3,8289(zero)
 b38:	c00b40bf 	ll	t3,16575(zero)
 b3c:	610001bf 	0x610001bf
	...
 b48:	bfc00b00 	cache	0x0,2816(s8)
 b4c:	bfc00b14 	cache	0x0,2836(s8)
 b50:	20600001 	addi	zero,v1,1
 b54:	40bfc00b 	0x40bfc00b
 b58:	01bfc00b 	movn	t8,t5,ra
 b5c:	00006000 	sll	t4,zero,0x0
 b60:	00000000 	nop
 b64:	0b700000 	j	dc00000 <_mem_avail_start-0x72400000>
 b68:	0b7cbfc0 	j	df2ff00 <_mem_avail_start-0x720d0100>
 b6c:	0001bfc0 	sll	s7,at,0x1f
 b70:	c00b7c54 	ll	t3,31828(zero)
 b74:	c00b94bf 	ll	t3,-27457(zero)
 b78:	600001bf 	0x600001bf
 b7c:	bfc00b94 	cache	0x0,2964(s8)
 b80:	bfc00b9c 	cache	0x0,2972(s8)
 b84:	00520001 	0x520001
	...
 b94:	06000000 	bltz	s0,b98 <_mem_avail_start-0x7ffff468>
 b98:	20049e00 	addi	a0,zero,-25088
 b9c:	00bff0f0 	tge	a1,ra,0x3c3
 ba0:	00000000 	nop
 ba4:	08000000 	j	0 <_mem_avail_start-0x80000000>
 ba8:	14bfc00c 	bne	a1,ra,ffff0bdc <_text_end+0x403efadc>
 bac:	01bfc00c 	syscall	0x6ff00
 bb0:	00005400 	sll	t2,zero,0x10
 bb4:	00000000 	nop
 bb8:	0c080000 	jal	200000 <_mem_avail_start-0x7fe00000>
 bbc:	0c14bfc0 	jal	52ff00 <_mem_avail_start-0x7fad0100>
 bc0:	0006bfc0 	sll	s7,a2,0x1f
 bc4:	f010049e 	0xf010049e
 bc8:	0000bff0 	tge	zero,zero,0x2ff
 bcc:	00000000 	nop
 bd0:	0bf40000 	j	fd00000 <_mem_avail_start-0x70300000>
 bd4:	0c00bfc0 	jal	2ff00 <_mem_avail_start-0x7ffd0100>
 bd8:	0001bfc0 	sll	s7,at,0x1f
 bdc:	00000054 	0x54
 be0:	00000000 	nop
 be4:	c00bf400 	ll	t3,-3072(zero)
 be8:	c00c00bf 	ll	t4,191(zero)
 bec:	9e0006bf 	0x9e0006bf
 bf0:	f0f00004 	0xf0f00004
 bf4:	000000bf 	0xbf
	...
 c04:	30000200 	andi	zero,zero,0x200
 c08:	0000009f 	0x9f
 c0c:	00000000 	nop
 c10:	74000600 	jalx	1800 <_mem_avail_start-0x7fffe800>
 c14:	1aff0800 	0x1aff0800
 c18:	0000009f 	0x9f
 c1c:	00000000 	nop
 c20:	75000e00 	jalx	4003800 <_mem_avail_start-0x7bffc800>
 c24:	1aff0800 	0x1aff0800
 c28:	00742438 	0x742438
 c2c:	211aff08 	addi	k0,t0,-248
 c30:	0000009f 	0x9f
 c34:	00000000 	nop
 c38:	54000100 	bnezl	zero,103c <_mem_avail_start-0x7fffefc4>
 c3c:	00000000 	nop
 c40:	00000000 	nop
 c44:	0072000b 	movn	zero,v1,s2
 c48:	481aff08 	0x481aff08
 c4c:	21007424 	addi	zero,t0,29732
 c50:	0000009f 	0x9f
 c54:	00000000 	nop
 c58:	c00be800 	ll	t3,-6144(zero)
 c5c:	c00becbf 	ll	t3,-4929(zero)
 c60:	540001bf 	bnezl	zero,1360 <_mem_avail_start-0x7fffeca0>
 c64:	00000000 	nop
 c68:	00000000 	nop
 c6c:	bfc00be8 	cache	0x0,3048(s8)
 c70:	bfc00bec 	cache	0x0,3052(s8)
 c74:	049e0006 	0x49e0006
 c78:	bfd03000 	cache	0x10,12288(s8)
	...
 c84:	bfc00b9c 	cache	0x0,2972(s8)
 c88:	bfc00ba8 	cache	0x0,2984(s8)
 c8c:	81090003 	lb	t1,3(t0)
 c90:	0000009f 	0x9f
 c94:	00000000 	nop
 c98:	c00b9c00 	ll	t3,-25600(zero)
 c9c:	c00ba8bf 	ll	t3,-22337(zero)
 ca0:	9e0006bf 	0x9e0006bf
 ca4:	d0300804 	0xd0300804
 ca8:	000000bf 	0xbf
 cac:	00000000 	nop
 cb0:	c00ba800 	ll	t3,-22528(zero)
 cb4:	c00bb0bf 	ll	t3,-20289(zero)
 cb8:	090003bf 	j	4000efc <_mem_avail_start-0x7bfff104>
 cbc:	00009f80 	sll	s3,zero,0x1e
 cc0:	00000000 	nop
 cc4:	0ba80000 	j	ea00000 <_mem_avail_start-0x71600000>
 cc8:	0bb0bfc0 	j	ec2ff00 <_mem_avail_start-0x713d0100>
 ccc:	0006bfc0 	sll	s7,a2,0x1f
 cd0:	300c049e 	andi	t4,zero,0x49e
 cd4:	0000bfd0 	0xbfd0
 cd8:	00000000 	nop
 cdc:	0bb00000 	j	ec00000 <_mem_avail_start-0x71400000>
 ce0:	0bb8bfc0 	j	ee2ff00 <_mem_avail_start-0x711d0100>
 ce4:	0003bfc0 	sll	s7,v1,0x1f
 ce8:	009f3608 	0x9f3608
 cec:	00000000 	nop
 cf0:	b0000000 	0xb0000000
 cf4:	b8bfc00b 	swr	ra,-16373(a1)
 cf8:	06bfc00b 	0x6bfc00b
 cfc:	00049e00 	sll	s3,a0,0x18
 d00:	00bfd030 	tge	a1,ra,0x340
 d04:	00000000 	nop
 d08:	c0000000 	ll	zero,0(zero)
 d0c:	c4bfc00b 	lwc1	$f31,-16373(a1)
 d10:	02bfc00b 	movn	t8,s5,ra
 d14:	009f3300 	0x9f3300
 d18:	00000000 	nop
 d1c:	c0000000 	ll	zero,0(zero)
 d20:	c4bfc00b 	lwc1	$f31,-16373(a1)
 d24:	06bfc00b 	0x6bfc00b
 d28:	0c049e00 	jal	127800 <_mem_avail_start-0x7fed8800>
 d2c:	00bfd030 	tge	a1,ra,0x340
 d30:	00000000 	nop
 d34:	b8000000 	swr	zero,0(zero)
 d38:	c0bfc00b 	ll	ra,-16373(a1)
 d3c:	02bfc00b 	movn	t8,s5,ra
 d40:	009f3000 	0x9f3000
 d44:	00000000 	nop
 d48:	b8000000 	swr	zero,0(zero)
 d4c:	c0bfc00b 	ll	ra,-16373(a1)
 d50:	06bfc00b 	0x6bfc00b
 d54:	04049e00 	0x4049e00
 d58:	00bfd030 	tge	a1,ra,0x340
 d5c:	00000000 	nop
 d60:	c4000000 	lwc1	$f0,0(zero)
 d64:	c8bfc00b 	lwc2	$31,-16373(a1)
 d68:	02bfc00b 	movn	t8,s5,ra
 d6c:	009f3000 	0x9f3000
 d70:	00000000 	nop
 d74:	c4000000 	lwc1	$f0,0(zero)
 d78:	c8bfc00b 	lwc2	$31,-16373(a1)
 d7c:	06bfc00b 	0x6bfc00b
 d80:	10049e00 	beq	zero,a0,fffe8584 <_text_end+0x403e7484>
 d84:	00bfd030 	tge	a1,ra,0x340
 d88:	00000000 	nop
 d8c:	c8000000 	lwc2	$0,0(zero)
 d90:	ccbfc00b 	pref	0x1f,-16373(a1)
 d94:	02bfc00b 	movn	t8,s5,ra
 d98:	009f3000 	0x9f3000
 d9c:	00000000 	nop
 da0:	c8000000 	lwc2	$0,0(zero)
 da4:	ccbfc00b 	pref	0x1f,-16373(a1)
 da8:	06bfc00b 	0x6bfc00b
 dac:	04049e00 	0x4049e00
 db0:	00bfd030 	tge	a1,ra,0x340
	...
 dc0:	01000000 	0x1000000
 dc4:	00005500 	sll	t2,zero,0x14
	...
 dd4:	00010000 	sll	zero,at,0x0
 dd8:	00000054 	0x54
	...
 de8:	54000100 	bnezl	zero,11ec <_mem_avail_start-0x7fffee14>
 dec:	00000000 	nop
	...
 dfc:	00540001 	movf	zero,v0,$fcc5
	...
 e0c:	01000000 	0x1000000
 e10:	00005500 	sll	t2,zero,0x14
	...
 e20:	00010000 	sll	zero,at,0x0
 e24:	00000054 	0x54
	...
 e34:	55000100 	bnezl	t0,1238 <_mem_avail_start-0x7fffedc8>
 e38:	00000000 	nop
	...
 e48:	00540001 	movf	zero,v0,$fcc5
	...
 e58:	01000000 	0x1000000
 e5c:	00005500 	sll	t2,zero,0x14
	...
 e6c:	00010000 	sll	zero,at,0x0
 e70:	00000054 	0x54
 e74:	00000000 	nop
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	0000002c 	0x2c
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	00000002 	srl	zero,zero,0x0
   8:	00040000 	sll	zero,a0,0x0
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	bfc00450 	cache	0x0,1104(s8)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	00000028 	0x28
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	bfc00478 	cache	0x0,1144(s8)
  1c:	00000048 	0x48
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	bfc004c0 	cache	0x0,1216(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	00000084 	0x84
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  30:	0000001c 	0x1c
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	017e0002 	0x17e0002
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	00040000 	sll	zero,a0,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	00000000 	nop
  40:	bfc00000 	cache	0x0,0(s8)
  44:	00000450 	0x450
	...
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	00000044 	0x44
  54:	01a40002 	0x1a40002
  58:	00040000 	sll	zero,a0,0x0
  5c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	bfc00544 	cache	0x0,1348(s8)
  64:	000000c8 	0xc8
  68:	00000000 	nop
  6c:	0000000c 	syscall
  70:	00000000 	nop
  74:	0000000c 	syscall
  78:	bfc0060c 	cache	0x0,1548(s8)
  7c:	00000098 	0x98
  80:	bfc006a4 	cache	0x0,1700(s8)
  84:	00000068 	0x68
  88:	bfc0070c 	cache	0x0,1804(s8)
  8c:	000000b4 	teq	zero,zero,0x2
	...
  98:	0000001c 	0x1c
  9c:	07140002 	0x7140002
  a0:	00040000 	sll	zero,a0,0x0
  a4:	00000000 	nop
  a8:	bfc007c0 	cache	0x0,1984(s8)
  ac:	00000224 	0x224
	...
  b8:	0000001c 	0x1c
  bc:	08da0002 	j	3680008 <_mem_avail_start-0x7c97fff8>
  c0:	00040000 	sll	zero,a0,0x0
  c4:	00000000 	nop
  c8:	bfc009e4 	cache	0x0,2532(s8)
  cc:	000000d8 	0xd8
	...
  d8:	0000007c 	0x7c
  dc:	0a280002 	j	8a00008 <_mem_avail_start-0x775ffff8>
  e0:	00040000 	sll	zero,a0,0x0
	...
  ec:	00000020 	add	zero,zero,zero
  f0:	00000000 	nop
  f4:	00000028 	0x28
  f8:	00000000 	nop
  fc:	00000024 	and	zero,zero,zero
 100:	00000000 	nop
 104:	00000034 	teq	zero,zero
 108:	00000000 	nop
 10c:	00000030 	tge	zero,zero
 110:	00000000 	nop
 114:	00000044 	0x44
 118:	00000000 	nop
 11c:	0000002c 	0x2c
 120:	00000000 	nop
 124:	00000028 	0x28
 128:	bfc00abc 	cache	0x0,2748(s8)
 12c:	00000024 	and	zero,zero,zero
 130:	00000000 	nop
 134:	0000002c 	0x2c
 138:	00000000 	nop
 13c:	00000070 	tge	zero,zero,0x1
 140:	00000000 	nop
 144:	00000040 	ssnop
 148:	00000000 	nop
 14c:	0000000c 	syscall
	...
 158:	00000024 	and	zero,zero,zero
 15c:	0e420002 	jal	9080008 <_mem_avail_start-0x76f7fff8>
 160:	00040000 	sll	zero,a0,0x0
 164:	00000000 	nop
 168:	bfc00ae0 	cache	0x0,2784(s8)
 16c:	00000060 	0x60
 170:	bfc00b40 	cache	0x0,2880(s8)
 174:	00000030 	tge	zero,zero
	...
 180:	0000001c 	0x1c
 184:	0f920002 	jal	e480008 <_mem_avail_start-0x71b7fff8>
 188:	00040000 	sll	zero,a0,0x0
 18c:	00000000 	nop
 190:	bfc00b70 	cache	0x0,2928(s8)
 194:	0000002c 	0x2c
	...
 1a0:	0000008c 	syscall	0x2
 1a4:	10480002 	beq	v0,t0,1b0 <_mem_avail_start-0x7ffffe50>
 1a8:	00040000 	sll	zero,a0,0x0
	...
 1b4:	0000000c 	syscall
 1b8:	00000000 	nop
 1bc:	0000000c 	syscall
 1c0:	00000000 	nop
 1c4:	0000000c 	syscall
 1c8:	00000000 	nop
 1cc:	0000000c 	syscall
 1d0:	00000000 	nop
 1d4:	0000000c 	syscall
 1d8:	00000000 	nop
 1dc:	0000000c 	syscall
 1e0:	00000000 	nop
 1e4:	0000000c 	syscall
 1e8:	00000000 	nop
 1ec:	0000000c 	syscall
 1f0:	bfc00b9c 	cache	0x0,2972(s8)
 1f4:	00000038 	0x38
 1f8:	00000000 	nop
 1fc:	00000020 	add	zero,zero,zero
 200:	bfc00bd4 	cache	0x0,3028(s8)
 204:	00000020 	add	zero,zero,zero
 208:	00000000 	nop
 20c:	00000048 	0x48
 210:	bfc00bf4 	cache	0x0,3060(s8)
 214:	00000014 	0x14
 218:	bfc00c08 	cache	0x0,3080(s8)
 21c:	00000014 	0x14
 220:	00000000 	nop
 224:	00000014 	0x14
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	bfc004cc 	cache	0x0,1228(s8)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	bfc004d0 	cache	0x0,1232(s8)
   8:	bfc004dc 	cache	0x0,1244(s8)
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	bfc004f4 	cache	0x0,1268(s8)
	...
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	bfc004f4 	cache	0x0,1268(s8)
  1c:	bfc00520 	cache	0x0,1312(s8)
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	bfc00534 	cache	0x0,1332(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	bfc0053c 	cache	0x0,1340(s8)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  30:	bfc004fc 	cache	0x0,1276(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	bfc0050c 	cache	0x0,1292(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	bfc00534 	cache	0x0,1332(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	bfc0053c 	cache	0x0,1340(s8)
	...
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	bfc00450 	cache	0x0,1104(s8)
  4c:	bfc00478 	cache	0x0,1144(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	bfc00478 	cache	0x0,1144(s8)
  54:	bfc004c0 	cache	0x0,1216(s8)
  58:	bfc004c0 	cache	0x0,1216(s8)
  5c:	bfc00544 	cache	0x0,1348(s8)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  68:	bfc00614 	cache	0x0,1556(s8)
  6c:	bfc00618 	cache	0x0,1560(s8)
  70:	bfc00634 	cache	0x0,1588(s8)
  74:	bfc0065c 	cache	0x0,1628(s8)
	...
  80:	bfc006ac 	cache	0x0,1708(s8)
  84:	bfc006b0 	cache	0x0,1712(s8)
  88:	bfc006c0 	cache	0x0,1728(s8)
  8c:	bfc006f8 	cache	0x0,1784(s8)
	...
  98:	bfc006ac 	cache	0x0,1708(s8)
  9c:	bfc006b0 	cache	0x0,1712(s8)
  a0:	bfc006c0 	cache	0x0,1728(s8)
  a4:	bfc006c4 	cache	0x0,1732(s8)
  a8:	bfc006c8 	cache	0x0,1736(s8)
  ac:	bfc006f0 	cache	0x0,1776(s8)
	...
  b8:	bfc00544 	cache	0x0,1348(s8)
  bc:	bfc0060c 	cache	0x0,1548(s8)
  c0:	00000001 	movf	zero,zero,$fcc0
  c4:	00000001 	movf	zero,zero,$fcc0
  c8:	00000001 	movf	zero,zero,$fcc0
  cc:	00000001 	movf	zero,zero,$fcc0
  d0:	bfc0060c 	cache	0x0,1548(s8)
  d4:	bfc006a4 	cache	0x0,1700(s8)
  d8:	bfc006a4 	cache	0x0,1700(s8)
  dc:	bfc0070c 	cache	0x0,1804(s8)
  e0:	bfc0070c 	cache	0x0,1804(s8)
  e4:	bfc007c0 	cache	0x0,1984(s8)
	...
  f0:	bfc007f8 	cache	0x0,2040(s8)
  f4:	bfc007fc 	cache	0x0,2044(s8)
  f8:	bfc00880 	cache	0x0,2176(s8)
  fc:	bfc00890 	cache	0x0,2192(s8)
 100:	bfc009cc 	cache	0x0,2508(s8)
 104:	bfc009dc 	cache	0x0,2524(s8)
	...
 110:	bfc0087c 	cache	0x0,2172(s8)
 114:	bfc00880 	cache	0x0,2176(s8)
 118:	bfc008a8 	cache	0x0,2216(s8)
 11c:	bfc008b0 	cache	0x0,2224(s8)
 120:	bfc00904 	cache	0x0,2308(s8)
 124:	bfc00914 	cache	0x0,2324(s8)
 128:	bfc00920 	cache	0x0,2336(s8)
 12c:	bfc00930 	cache	0x0,2352(s8)
 130:	bfc00938 	cache	0x0,2360(s8)
 134:	bfc00974 	cache	0x0,2420(s8)
 138:	bfc0097c 	cache	0x0,2428(s8)
 13c:	bfc00980 	cache	0x0,2432(s8)
 140:	bfc00988 	cache	0x0,2440(s8)
 144:	bfc00990 	cache	0x0,2448(s8)
 148:	bfc00998 	cache	0x0,2456(s8)
 14c:	bfc0099c 	cache	0x0,2460(s8)
 150:	bfc009a0 	cache	0x0,2464(s8)
 154:	bfc009c4 	cache	0x0,2500(s8)
	...
 160:	bfc007c0 	cache	0x0,1984(s8)
 164:	bfc009e4 	cache	0x0,2532(s8)
	...
 170:	bfc009e4 	cache	0x0,2532(s8)
 174:	bfc00abc 	cache	0x0,2748(s8)
	...
 180:	00000001 	movf	zero,zero,$fcc0
 184:	00000001 	movf	zero,zero,$fcc0
 188:	00000001 	movf	zero,zero,$fcc0
 18c:	00000001 	movf	zero,zero,$fcc0
 190:	00000001 	movf	zero,zero,$fcc0
 194:	00000001 	movf	zero,zero,$fcc0
 198:	00000001 	movf	zero,zero,$fcc0
 19c:	00000001 	movf	zero,zero,$fcc0
 1a0:	00000001 	movf	zero,zero,$fcc0
 1a4:	00000001 	movf	zero,zero,$fcc0
 1a8:	00000001 	movf	zero,zero,$fcc0
 1ac:	00000001 	movf	zero,zero,$fcc0
 1b0:	00000001 	movf	zero,zero,$fcc0
 1b4:	00000001 	movf	zero,zero,$fcc0
 1b8:	00000001 	movf	zero,zero,$fcc0
 1bc:	00000001 	movf	zero,zero,$fcc0
 1c0:	bfc00abc 	cache	0x0,2748(s8)
 1c4:	bfc00ae0 	cache	0x0,2784(s8)
 1c8:	00000001 	movf	zero,zero,$fcc0
 1cc:	00000001 	movf	zero,zero,$fcc0
 1d0:	00000001 	movf	zero,zero,$fcc0
 1d4:	00000001 	movf	zero,zero,$fcc0
 1d8:	00000001 	movf	zero,zero,$fcc0
 1dc:	00000001 	movf	zero,zero,$fcc0
 1e0:	00000001 	movf	zero,zero,$fcc0
 1e4:	00000001 	movf	zero,zero,$fcc0
	...
 1f0:	bfc00af8 	cache	0x0,2808(s8)
 1f4:	bfc00afc 	cache	0x0,2812(s8)
 1f8:	bfc00b20 	cache	0x0,2848(s8)
 1fc:	bfc00b38 	cache	0x0,2872(s8)
	...
 208:	bfc00ae0 	cache	0x0,2784(s8)
 20c:	bfc00b40 	cache	0x0,2880(s8)
 210:	bfc00b40 	cache	0x0,2880(s8)
 214:	bfc00b70 	cache	0x0,2928(s8)
	...
 220:	bfc00b70 	cache	0x0,2928(s8)
 224:	bfc00b9c 	cache	0x0,2972(s8)
	...
 230:	bfc00bb8 	cache	0x0,3000(s8)
 234:	bfc00bbc 	cache	0x0,3004(s8)
 238:	bfc00bc0 	cache	0x0,3008(s8)
 23c:	bfc00bc4 	cache	0x0,3012(s8)
	...
 248:	00000001 	movf	zero,zero,$fcc0
 24c:	00000001 	movf	zero,zero,$fcc0
 250:	00000001 	movf	zero,zero,$fcc0
 254:	00000001 	movf	zero,zero,$fcc0
 258:	00000001 	movf	zero,zero,$fcc0
 25c:	00000001 	movf	zero,zero,$fcc0
 260:	00000001 	movf	zero,zero,$fcc0
 264:	00000001 	movf	zero,zero,$fcc0
 268:	00000001 	movf	zero,zero,$fcc0
 26c:	00000001 	movf	zero,zero,$fcc0
 270:	00000001 	movf	zero,zero,$fcc0
 274:	00000001 	movf	zero,zero,$fcc0
 278:	00000001 	movf	zero,zero,$fcc0
 27c:	00000001 	movf	zero,zero,$fcc0
 280:	00000001 	movf	zero,zero,$fcc0
 284:	00000001 	movf	zero,zero,$fcc0
 288:	bfc00b9c 	cache	0x0,2972(s8)
 28c:	bfc00bd4 	cache	0x0,3028(s8)
 290:	00000001 	movf	zero,zero,$fcc0
 294:	00000001 	movf	zero,zero,$fcc0
 298:	bfc00bd4 	cache	0x0,3028(s8)
 29c:	bfc00bf4 	cache	0x0,3060(s8)
 2a0:	00000001 	movf	zero,zero,$fcc0
 2a4:	00000001 	movf	zero,zero,$fcc0
 2a8:	bfc00bf4 	cache	0x0,3060(s8)
 2ac:	bfc00c08 	cache	0x0,3080(s8)
 2b0:	bfc00c08 	cache	0x0,3080(s8)
 2b4:	bfc00c1c 	cache	0x0,3100(s8)
 2b8:	00000001 	movf	zero,zero,$fcc0
 2bc:	00000001 	movf	zero,zero,$fcc0
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	000000c5 	0xc5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	00410002 	0x410002
   8:	01010000 	0x1010000
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	000d0efb 	0xd0efb
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	01010101 	0x1010101
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	01000000 	0x1000000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	69010000 	0x69010000
  1c:	756c636e 	jalx	5b18db8 <_mem_avail_start-0x7a4e7248>
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	00006564 	0x6564
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	76697274 	jalx	9a5c9d0 <_mem_avail_start-0x765a3630>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	5f6c6169 	0x5f6c6169
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	7370696d 	0x7370696d
  30:	0100682e 	0x100682e
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	72700000 	madd	s3,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	5f746e69 	0x5f746e69
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	316f7431 	andi	t7,t3,0x7431
  40:	632e3030 	0x632e3030
  44:	00007070 	tge	zero,zero,0x1c1
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	00000000 	nop
  4c:	04500205 	bltzal	v0,864 <_mem_avail_start-0x7ffff79c>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	1303bfc0 	beq	t8,v1,fffeff54 <_text_end+0x403eee54>
  54:	3d081401 	0x3d081401
  58:	01040200 	0x1040200
  5c:	4b068206 	c2	0x1068206
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	01000802 	0x1000802
  64:	02050001 	movt	zero,s0,$fcc1
  68:	bfc00478 	cache	0x0,1144(s8)
  6c:	0100c203 	0x100c203
  70:	b8848113 	swr	a0,-32493(a0)
  74:	4c48bd4c 	0x4c48bd4c
  78:	00100248 	0x100248
  7c:	02040101 	0x2040101
  80:	c0020500 	ll	v0,1280(zero)
  84:	15bfc004 	bne	t5,ra,ffff0098 <_text_end+0x403eef98>
  88:	4c8248bc 	0x4c8248bc
  8c:	02040200 	0x2040200
  90:	0402004b 	bltzl	zero,1c0 <_mem_avail_start-0x7ffffe40>
  94:	00bc8102 	0xbc8102
  98:	4c020402 	0x4c020402
  9c:	02000104 	0x2000104
  a0:	c6030204 	lwc1	$f3,516(s0)
  a4:	04834a00 	bgezl	a0,128a8 <_mem_avail_start-0x7ffed758>
  a8:	04020002 	bltzl	zero,b4 <_mem_avail_start-0x7fffff4c>
  ac:	7fba0302 	0x7fba0302
  b0:	04020082 	bltzl	zero,2bc <_mem_avail_start-0x7ffffd44>
  b4:	0488b702 	tgei	a0,-18686
  b8:	00c50301 	0xc50301
  bc:	02043c08 	0x2043c08
  c0:	827fb803 	lb	ra,-18429(s3)
  c4:	01000802 	0x1000802
  c8:	00009301 	0x9301
  cc:	28000200 	slti	zero,zero,512
  d0:	01000000 	0x1000000
  d4:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
  d8:	01010100 	0x1010100
  dc:	00000001 	movf	zero,zero,$fcc0
  e0:	01000001 	movf	zero,t0,$fcc0
  e4:	6c697475 	0x6c697475
  e8:	00797469 	0x797469
  ec:	61747300 	0x61747300
  f0:	70757472 	0x70757472
  f4:	0100532e 	0x100532e
  f8:	00000000 	nop
  fc:	00000205 	0x205
 100:	8319bfc0 	lb	t9,-16448(t8)
 104:	4a0a034b 	c2	0xa034b
 108:	85834d4b 	lh	v1,19787(t4)
 10c:	4d4b4d4b 	0x4d4b4d4b
 110:	834b834c 	lb	t3,-31924(k0)
 114:	4b4b4b4d 	c2	0x14b4b4d
 118:	4b834d4b 	c2	0x1834d4b
 11c:	84024b4b 	lh	v0,19275(zero)
 120:	034b1802 	0x34b1802
 124:	03fc020b 	0x3fc020b
 128:	834b4c01 	lb	t3,19457(k0)
 12c:	4b4b4b4d 	c2	0x14b4b4d
 130:	4b4b4b4b 	c2	0x14b4b4b
 134:	4b4b4b4b 	c2	0x14b4b4b
 138:	4b4b4b4b 	c2	0x14b4b4b
 13c:	4b4b4b4b 	c2	0x14b4b4b
 140:	4b4b4b4b 	c2	0x14b4b4b
 144:	4b4b4b4b 	c2	0x14b4b4b
 148:	4c4b4b4b 	0x4c4b4b4b
 14c:	4b4b4b4b 	c2	0x14b4b4b
 150:	4b4b4b4b 	c2	0x14b4b4b
 154:	4c4b4c4b 	0x4c4b4c4b
 158:	024b4b4b 	0x24b4b4b
 15c:	01010004 	sllv	zero,at,t0
 160:	00000159 	0x159
 164:	00870002 	0x870002
 168:	01010000 	0x1010000
 16c:	000d0efb 	0xd0efb
 170:	01010101 	0x1010101
 174:	01000000 	0x1000000
 178:	75010000 	jalx	4040000 <_mem_avail_start-0x7bfc0000>
 17c:	696c6974 	0x696c6974
 180:	69007974 	0x69007974
 184:	756c636e 	jalx	5b18db8 <_mem_avail_start-0x7a4e7248>
 188:	00006564 	0x6564
 18c:	6e69616d 	0x6e69616d
 190:	0100632e 	0x100632e
 194:	6f630000 	0x6f630000
 198:	6e6f6d6d 	0x6e6f6d6d
 19c:	0200682e 	0x200682e
 1a0:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 1a4:	746e6964 	jalx	1b9a590 <_mem_avail_start-0x7e465a70>
 1a8:	0200682e 	0x200682e
 1ac:	616d0000 	0x616d0000
 1b0:	6e696863 	0x6e696863
 1b4:	00682e65 	0x682e65
 1b8:	65000002 	0x65000002
 1bc:	70656378 	0x70656378
 1c0:	6e6f6974 	0x6e6f6974
 1c4:	0200682e 	0x200682e
 1c8:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 1cc:	2e6f6964 	sltiu	t7,s3,26980
 1d0:	00020068 	0x20068
 1d4:	72747300 	0x72747300
 1d8:	2e676e69 	sltiu	a3,s3,28265
 1dc:	00020068 	0x20068
 1e0:	6f6f6200 	0x6f6f6200
 1e4:	72747374 	0x72747374
 1e8:	682e7061 	0x682e7061
 1ec:	00000200 	sll	zero,zero,0x8
 1f0:	02050000 	0x2050000
 1f4:	bfc00544 	cache	0x0,1348(s8)
 1f8:	bc010a03 	cache	0x1,2563(zero)
 1fc:	45c18484 	0x45c18484
 200:	454f454f 	0x454f454f
 204:	83864787 	lb	a2,18311(gp)
 208:	8385f5f3 	lb	a1,-2573(gp)
 20c:	b7b8c183 	0xb7b8c183
 210:	000802bf 	0x802bf
 214:	05000101 	bltz	t0,61c <_mem_avail_start-0x7ffff9e4>
 218:	00000002 	srl	zero,zero,0x0
 21c:	012b0300 	0x12b0300
 220:	08024f14 	j	93c50 <_mem_avail_start-0x7ff6c3b0>
 224:	00010100 	sll	zero,at,0x4
 228:	00000205 	0x205
 22c:	34030000 	li	v1,0x0
 230:	024f1401 	0x24f1401
 234:	01010008 	0x1010008
 238:	0c020500 	jal	81400 <_mem_avail_start-0x7ff7ec00>
 23c:	03bfc006 	srlv	t8,ra,sp
 240:	4884013d 	0x4884013d
 244:	4b833c08 	c2	0x1833c08
 248:	04020049 	bltzl	zero,370 <_mem_avail_start-0x7ffffc90>
 24c:	02004b03 	0x2004b03
 250:	3b080304 	xori	t0,t8,0x304
 254:	13280285 	beq	t9,t0,c6c <_mem_avail_start-0x7ffff394>
 258:	01002002 	0x1002002
 25c:	02050001 	movt	zero,s0,$fcc1
 260:	bfc006a4 	cache	0x0,1700(s8)
 264:	0100c403 	0x100c403
 268:	03820c03 	0x3820c03
 26c:	03ba4a74 	teq	sp,k0,0x129
 270:	75034a0c 	jalx	40d2830 <_mem_avail_start-0x7bf2d7d0>
 274:	0402004a 	bltzl	zero,3a0 <_mem_avail_start-0x7ffffc60>
 278:	02004c03 	0x2004c03
 27c:	09030304 	j	40c0c10 <_mem_avail_start-0x7bf3f3f0>
 280:	02003c08 	0x2003c08
 284:	75030304 	jalx	40c0c10 <_mem_avail_start-0x7bf3f3f0>
 288:	0d033c08 	jal	40cf020 <_mem_avail_start-0x7bf30fe0>
 28c:	00140282 	srl	zero,s4,0xa
 290:	05000101 	bltz	t0,698 <_mem_avail_start-0x7ffff968>
 294:	c0070c02 	ll	a3,3074(zero)
 298:	00d403bf 	0xd403bf
 29c:	4b49bb01 	c2	0x149bb01
 2a0:	83834b49 	lb	v1,19273(gp)
 2a4:	8483c1bb 	lh	v1,-15941(a0)
 2a8:	f25503b9 	0xf25503b9
 2ac:	844a2403 	lh	t2,9219(v0)
 2b0:	74085103 	jalx	21440c <_mem_avail_start-0x7fdebbf4>
 2b4:	bb4a2f03 	swr	t2,12035(k0)
 2b8:	01001002 	0x1001002
 2bc:	0000aa01 	0xaa01
 2c0:	1f000200 	bgtz	t8,ac4 <_mem_avail_start-0x7ffff53c>
 2c4:	01000000 	0x1000000
 2c8:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 2cc:	01010100 	0x1010100
 2d0:	00000001 	movf	zero,zero,$fcc0
 2d4:	01000001 	movf	zero,t0,$fcc0
 2d8:	69727000 	0x69727000
 2dc:	2e66746e 	sltiu	a2,s3,29806
 2e0:	00000063 	0x63
 2e4:	05000000 	bltz	t0,2e8 <_mem_avail_start-0x7ffffd18>
 2e8:	c007c002 	ll	a3,-16382(zero)
 2ec:	038813bf 	0x38813bf
 2f0:	3c084a7a 	lui	t0,0x4a7a
 2f4:	c5034cf8 	lwc1	$f3,19704(t0)
 2f8:	02004a00 	0x2004a00
 2fc:	bb030104 	swr	v1,260(t8)
 300:	cb034a7f 	lwc2	$3,19071(t8)
 304:	b803f200 	swr	v1,-3584(zero)
 308:	0124027f 	0x124027f
 30c:	02380386 	0x2380386
 310:	03520144 	0x3520144
 314:	7c08f240 	0x7c08f240
 318:	82770383 	lb	s7,899(s3)
 31c:	28021c03 	slti	v0,zero,7171
 320:	82640301 	lb	a0,769(s3)
 324:	4b88af08 	c2	0x188af08
 328:	02040200 	0x2040200
 32c:	034a6f03 	0x34a6f03
 330:	1403ba14 	bne	zero,v1,fffeeb84 <_text_end+0x403eda84>
 334:	82680382 	lb	t0,898(s3)
 338:	03820903 	0x3820903
 33c:	03bd8215 	0x3bd8215
 340:	4cf3826d 	0x4cf3826d
 344:	03bfc089 	0x3bfc089
 348:	2603825e 	addiu	v1,s0,-32162
 34c:	04020082 	bltzl	zero,558 <_mem_avail_start-0x7ffffaa8>
 350:	4a4e0301 	c2	0x4e0301
 354:	01040200 	0x1040200
 358:	004a3403 	0x4a3403
 35c:	08030402 	j	c1008 <_mem_avail_start-0x7ff3eff8>
 360:	f20b03ad 	0xf20b03ad
 364:	08028383 	j	a0e0c <_mem_avail_start-0x7ff5f1f4>
 368:	76010100 	jalx	8040400 <_mem_avail_start-0x77fbfc00>
 36c:	02000000 	0x2000000
 370:	00002200 	sll	a0,zero,0x8
 374:	fb010100 	sdc2	$1,256(t8)
 378:	01000d0e 	0x1000d0e
 37c:	00010101 	0x10101
 380:	00010000 	sll	zero,at,0x0
 384:	70000100 	0x70000100
 388:	746e6972 	jalx	1b9a5c8 <_mem_avail_start-0x7e465a38>
 38c:	65736162 	0x65736162
 390:	0000632e 	0x632e
 394:	00000000 	nop
 398:	09e40205 	j	7900814 <_mem_avail_start-0x786ff7ec>
 39c:	0813bfc0 	j	4eff00 <_mem_avail_start-0x7fb10100>
 3a0:	02004fac 	0x2004fac
 3a4:	82060104 	lb	a2,260(s0)
 3a8:	004b8406 	0x4b8406
 3ac:	03010402 	0x3010402
 3b0:	0200ba78 	0x200ba78
 3b4:	0c030104 	jal	c0410 <_mem_avail_start-0x7ff3fbf0>
 3b8:	02008a4a 	0x2008a4a
 3bc:	ba060204 	swr	a2,516(s0)
 3c0:	70038806 	0x70038806
 3c4:	00012402 	srl	a0,at,0x10
 3c8:	08030402 	j	c1008 <_mem_avail_start-0x7ff3eff8>
 3cc:	02008ab0 	tge	s0,zero,0x22a
 3d0:	82060104 	lb	a2,260(s0)
 3d4:	01040200 	0x1040200
 3d8:	02008306 	0x2008306
 3dc:	f2060404 	0xf2060404
 3e0:	01001002 	0x1001002
 3e4:	00017901 	0x17901
 3e8:	36000200 	ori	zero,s0,0x200
 3ec:	01000000 	0x1000000
 3f0:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 3f4:	01010100 	0x1010100
 3f8:	00000001 	movf	zero,zero,$fcc0
 3fc:	01000001 	movf	zero,t0,$fcc0
 400:	692f2e2e 	0x692f2e2e
 404:	756c636e 	jalx	5b18db8 <_mem_avail_start-0x7a4e7248>
 408:	00006564 	0x6564
 40c:	69727473 	0x69727473
 410:	632e676e 	0x632e676e
 414:	00000000 	nop
 418:	6d6d6f63 	0x6d6d6f63
 41c:	682e6e6f 	0x682e6e6f
 420:	00000100 	sll	zero,zero,0x4
 424:	02050000 	0x2050000
 428:	00000000 	nop
 42c:	14010b03 	bne	zero,at,303c <_mem_avail_start-0x7fffcfc4>
 430:	08027808 	j	9e020 <_mem_avail_start-0x7ff61fe0>
 434:	00010100 	sll	zero,at,0x4
 438:	00000205 	0x205
 43c:	21030000 	addi	v1,t0,0
 440:	004b1301 	0x4b1301
 444:	06010402 	bgez	s0,1450 <_mem_avail_start-0x7fffebb0>
 448:	7fbe0682 	0x7fbe0682
 44c:	01000802 	0x1000802
 450:	02050001 	movt	zero,s0,$fcc1
 454:	00000000 	nop
 458:	01013603 	0x1013603
 45c:	0402004e 	bltzl	zero,598 <_mem_avail_start-0x7ffffa68>
 460:	40084b01 	0x40084b01
 464:	01000802 	0x1000802
 468:	02050001 	movt	zero,s0,$fcc1
 46c:	00000000 	nop
 470:	0100cc03 	0x100cc03
 474:	894b8301 	lwl	t3,-31999(t2)
 478:	bb827a03 	swr	v0,31235(gp)
 47c:	0008024c 	syscall	0x2009
 480:	05000101 	bltz	t0,888 <_mem_avail_start-0x7ffff778>
 484:	00000002 	srl	zero,zero,0x0
 488:	00e70300 	0xe70300
 48c:	02001601 	0x2001601
 490:	ba060104 	swr	a2,260(s0)
 494:	7e84bd06 	0x7e84bd06
 498:	01000802 	0x1000802
 49c:	02050001 	movt	zero,s0,$fcc1
 4a0:	00000000 	nop
 4a4:	0100fe03 	0x100fe03
 4a8:	0402004b 	bltzl	zero,5d8 <_mem_avail_start-0x7ffffa28>
 4ac:	00820601 	0x820601
 4b0:	ba020402 	swr	v0,1026(s0)
 4b4:	7f83bd06 	0x7f83bd06
 4b8:	00080284 	0x80284
 4bc:	05000101 	bltz	t0,8c4 <_mem_avail_start-0x7ffff73c>
 4c0:	00000002 	srl	zero,zero,0x0
 4c4:	018e0300 	0x18e0300
 4c8:	4bf81301 	c2	0x1f81301
 4cc:	85827a03 	lh	v0,31235(t4)
 4d0:	01000802 	0x1000802
 4d4:	02050001 	movt	zero,s0,$fcc1
 4d8:	00000000 	nop
 4dc:	0101a203 	0x101a203
 4e0:	7a03f913 	0x7a03f913
 4e4:	08028582 	j	a1608 <_mem_avail_start-0x7ff5e9f8>
 4e8:	00010100 	sll	zero,at,0x4
 4ec:	0abc0205 	j	af00814 <_mem_avail_start-0x750ff7ec>
 4f0:	9003bfc0 	lbu	v1,-16448(zero)
 4f4:	86010102 	lh	at,258(s0)
 4f8:	027e874b 	0x27e874b
 4fc:	01010008 	0x1010008
 500:	00020500 	sll	zero,v0,0x14
 504:	03000000 	0x3000000
 508:	010102ab 	0x10102ab
 50c:	7e874b87 	0x7e874b87
 510:	01001002 	0x1001002
 514:	02050001 	movt	zero,s0,$fcc1
 518:	00000000 	nop
 51c:	0102c203 	0x102c203
 520:	4a7a0318 	c2	0x7a0318
 524:	884e8450 	lwl	t6,-31664(v0)
 528:	01040200 	0x1040200
 52c:	f3827403 	0xf3827403
 530:	f63d0883 	sdc1	$f29,2179(s1)
 534:	01001002 	0x1001002
 538:	02050001 	movt	zero,s0,$fcc1
 53c:	00000000 	nop
 540:	0102e503 	0x102e503
 544:	7a03894d 	0x7a03894d
 548:	f43d0882 	sdc1	$f29,2178(at)
 54c:	01000802 	0x1000802
 550:	02050001 	movt	zero,s0,$fcc1
 554:	00000000 	nop
 558:	0102f103 	0x102f103
 55c:	000c0213 	0xc0213
 560:	004f0101 	0x4f0101
 564:	00020000 	sll	zero,v0,0x0
 568:	0000001d 	0x1d
 56c:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 570:	0101000d 	break	0x101
 574:	00000101 	0x101
 578:	00000100 	sll	zero,zero,0x4
 57c:	75700001 	jalx	5c00004 <_mem_avail_start-0x7a3ffffc>
 580:	632e7374 	0x632e7374
 584:	00000000 	nop
 588:	02050000 	0x2050000
 58c:	bfc00ae0 	cache	0x0,2784(s8)
 590:	4e3c0813 	c3	0x3c0813
 594:	7a03c248 	0x7a03c248
 598:	83837408 	lb	v1,29704(gp)
 59c:	00080283 	sra	zero,t0,0xa
 5a0:	05000101 	bltz	t0,9a8 <_mem_avail_start-0x7ffff658>
 5a4:	c00b4002 	ll	t3,16386(zero)
 5a8:	010e03bf 	0x10e03bf
 5ac:	84838383 	lh	v1,-31869(a0)
 5b0:	01001002 	0x1001002
 5b4:	00005901 	0x5901
 5b8:	44000200 	0x44000200
 5bc:	01000000 	0x1000000
 5c0:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 5c4:	01010100 	0x1010100
 5c8:	00000001 	movf	zero,zero,$fcc0
 5cc:	01000001 	movf	zero,t0,$fcc0
 5d0:	692f2e2e 	0x692f2e2e
 5d4:	756c636e 	jalx	5b18db8 <_mem_avail_start-0x7a4e7248>
 5d8:	00006564 	0x6564
 5dc:	63747570 	0x63747570
 5e0:	2e726168 	sltiu	s2,s3,24936
 5e4:	00000063 	0x63
 5e8:	64747300 	0x64747300
 5ec:	2e746e69 	sltiu	s4,s3,28265
 5f0:	00010068 	0x10068
 5f4:	63616d00 	0x63616d00
 5f8:	656e6968 	0x656e6968
 5fc:	0100682e 	0x100682e
 600:	00000000 	nop
 604:	0b700205 	j	dc00814 <_mem_avail_start-0x723ff7ec>
 608:	f315bfc0 	0xf315bfc0
 60c:	00140284 	0x140284
 610:	01a90101 	0x1a90101
 614:	00020000 	sll	zero,v0,0x0
 618:	00000052 	mflhxu	zero
 61c:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 620:	0101000d 	break	0x101
 624:	00000101 	0x101
 628:	00000100 	sll	zero,zero,0x4
 62c:	2f2e2e01 	sltiu	t6,t9,11777
 630:	6c636e69 	0x6c636e69
 634:	00656475 	0x656475
 638:	63616d00 	0x63616d00
 63c:	656e6968 	0x656e6968
 640:	7070632e 	0x7070632e
 644:	00000000 	nop
 648:	6d6d6f63 	0x6d6d6f63
 64c:	682e6e6f 	0x682e6e6f
 650:	00000100 	sll	zero,zero,0x4
 654:	69647473 	0x69647473
 658:	682e746e 	0x682e746e
 65c:	00000100 	sll	zero,zero,0x4
 660:	6863616d 	0x6863616d
 664:	2e656e69 	sltiu	a1,s3,28265
 668:	00010068 	0x10068
 66c:	05000000 	bltz	t0,670 <_mem_avail_start-0x7ffff990>
 670:	00000002 	srl	zero,zero,0x0
 674:	011b0300 	0x11b0300
 678:	03016a03 	0x3016a03
 67c:	08024a16 	j	92858 <_mem_avail_start-0x7ff6d7a8>
 680:	00010100 	sll	zero,at,0x4
 684:	00000205 	0x205
 688:	1b030000 	0x1b030000
 68c:	016a0301 	0x16a0301
 690:	024a1603 	0x24a1603
 694:	01010008 	0x1010008
 698:	00020500 	sll	zero,v0,0x14
 69c:	03000000 	0x3000000
 6a0:	6a03011b 	0x6a03011b
 6a4:	4a160301 	c2	0x160301
 6a8:	01000802 	0x1000802
 6ac:	02050001 	movt	zero,s0,$fcc1
 6b0:	00000000 	nop
 6b4:	03011b03 	0x3011b03
 6b8:	1603016a 	bne	s0,v1,c64 <_mem_avail_start-0x7ffff39c>
 6bc:	0008024a 	0x8024a
 6c0:	05000101 	bltz	t0,ac8 <_mem_avail_start-0x7ffff538>
 6c4:	00000002 	srl	zero,zero,0x0
 6c8:	011c0300 	0x11c0300
 6cc:	03016f03 	0x3016f03
 6d0:	08024a11 	j	92844 <_mem_avail_start-0x7ff6d7bc>
 6d4:	00010100 	sll	zero,at,0x4
 6d8:	00000205 	0x205
 6dc:	1c030000 	0x1c030000
 6e0:	016f0301 	0x16f0301
 6e4:	024a1103 	0x24a1103
 6e8:	01010008 	0x1010008
 6ec:	00020500 	sll	zero,v0,0x14
 6f0:	03000000 	0x3000000
 6f4:	6f03011c 	0x6f03011c
 6f8:	4a110301 	c2	0x110301
 6fc:	01000802 	0x1000802
 700:	02050001 	movt	zero,s0,$fcc1
 704:	00000000 	nop
 708:	03011c03 	0x3011c03
 70c:	1103016f 	beq	t0,v1,ccc <_mem_avail_start-0x7ffff334>
 710:	0008024a 	0x8024a
 714:	05000101 	bltz	t0,b1c <_mem_avail_start-0x7ffff4e4>
 718:	c00b9c02 	ll	t3,-25598(zero)
 71c:	011e03bf 	0x11e03bf
 720:	03016d03 	0x3016d03
 724:	01300221 	0x1300221
 728:	01000802 	0x1000802
 72c:	02050001 	movt	zero,s0,$fcc1
 730:	00000000 	nop
 734:	03012e03 	0x3012e03
 738:	2a030157 	slti	v1,s0,343
 73c:	ba560382 	swr	s6,898(s2)
 740:	024a2c03 	0x24a2c03
 744:	01010008 	0x1010008
 748:	d4020500 	ldc1	$f2,1280(zero)
 74c:	03bfc00b 	movn	t8,sp,ra
 750:	52030133 	beql	s0,v1,c20 <_mem_avail_start-0x7ffff3e0>
 754:	822f0301 	lb	t7,769(s1)
 758:	03ba5703 	0x3ba5703
 75c:	08024a2b 	j	928ac <_mem_avail_start-0x7ff6d754>
 760:	00010100 	sll	zero,at,0x4
 764:	00000205 	0x205
 768:	38030000 	xori	v1,zero,0x0
 76c:	83838401 	lb	v1,-31743(gp)
 770:	844b4bb9 	lh	t3,19385(v0)
 774:	0c024c48 	jal	93120 <_mem_avail_start-0x7ff6cee0>
 778:	00010100 	sll	zero,at,0x4
 77c:	0bf40205 	j	fd00814 <_mem_avail_start-0x702ff7ec>
 780:	c103bfc0 	ll	v1,-16448(t0)
 784:	4a030100 	c2	0x30100
 788:	ba380301 	swr	t8,769(s1)
 78c:	01000802 	0x1000802
 790:	02050001 	movt	zero,s0,$fcc1
 794:	bfc00c08 	cache	0x0,3080(s8)
 798:	0100c503 	0x100c503
 79c:	03014603 	0x3014603
 7a0:	0802ba3c 	j	ae8f0 <_mem_avail_start-0x7ff51710>
 7a4:	00010100 	sll	zero,at,0x4
 7a8:	00000205 	0x205
 7ac:	c9030000 	lwc2	$3,0(t0)
 7b0:	bc030100 	cache	0x3,256(zero)
 7b4:	c603017f 	lwc1	$f3,383(s0)
 7b8:	0802ba00 	j	ae800 <_mem_avail_start-0x7ff51800>
 7bc:	Address 0x00000000000007bc is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	746e6d2f 	jalx	1b9b4bc <_mem_avail_start-0x7e464b44>
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	552f632f 	bnel	t1,t7,18cc4 <_mem_avail_start-0x7ffe733c>
   8:	73726573 	0x73726573
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	6361462f 	0x6361462f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	69726f74 	0x69726f74
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	2f4e6c61 	sltiu	t6,k0,27745
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	6e776f64 	0x6e776f64
  1c:	64616f6c 	0x64616f6c
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	6f772f73 	0x6f772f73
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	6f632f77 	0x6f632f77
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	67393164 	0x67393164
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	2f317072 	sltiu	s1,t9,28786
  30:	74756f52 	jalx	1d5bd48 <_mem_avail_start-0x7e2a42b8>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	522d7265 	beql	s1,t5,1c9cc <_mem_avail_start-0x7ffe3634>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	69756265 	0x69756265
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	542f646c 	bnel	at,t7,191f0 <_mem_avail_start-0x7ffe6e10>
  40:	69766972 	0x69766972
  44:	494d6c61 	0x494d6c61
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	535f5350 	beql	k0,ra,14d8c <_mem_avail_start-0x7ffeb274>
  4c:	7774666f 	jalx	dd199bc <_mem_avail_start-0x722e6644>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	2f657261 	sltiu	a1,k1,29281
  54:	00707063 	0x707063
  58:	6e697270 	0x6e697270
  5c:	74315f74 	jalx	c57dd0 <_mem_avail_start-0x7f3a8230>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	3030316f 	andi	s0,at,0x316f
  64:	7070632e 	0x7070632e
  68:	6e6f6c00 	0x6e6f6c00
  6c:	6e752067 	0x6e752067
  70:	6e676973 	0x6e676973
  74:	69206465 	0x69206465
  78:	7300746e 	0x7300746e
  7c:	5f646e65 	0x5f646e65
  80:	69726573 	0x69726573
  84:	695f6c61 	0x695f6c61
  88:	6765746e 	0x6765746e
  8c:	755f7265 	jalx	57dc994 <_mem_avail_start-0x7a82366c>
  90:	6769736e 	0x6769736e
  94:	0064656e 	0x64656e
  98:	646e6573 	0x646e6573
  9c:	7265735f 	0x7265735f
  a0:	5f6c6169 	0x5f6c6169
  a4:	72616863 	0x72616863
  a8:	315a5f00 	andi	k0,t2,0x5f00
  ac:	6e657336 	0x6e657336
  b0:	65735f64 	0x65735f64
  b4:	6c616972 	0x6c616972
  b8:	6168635f 	0x6168635f
  bc:	75006872 	jalx	401a1c8 <_mem_avail_start-0x7bfe5e38>
  c0:	6769736e 	0x6769736e
  c4:	2064656e 	addi	a0,v1,25966
  c8:	72616863 	0x72616863
  cc:	325a5f00 	andi	k0,s2,0x5f00
  d0:	6e657338 	0x6e657338
  d4:	65735f64 	0x65735f64
  d8:	6c616972 	0x6c616972
  dc:	746e695f 	jalx	1b9a57c <_mem_avail_start-0x7e465a84>
  e0:	72656765 	0x72656765
  e4:	736e755f 	0x736e755f
  e8:	656e6769 	0x656e6769
  ec:	73006a64 	0x73006a64
  f0:	61697265 	0x61697265
  f4:	6e655f6c 	0x6e655f6c
  f8:	00797274 	teq	v1,t9,0x1c9
  fc:	20554e47 	addi	s5,v0,20039
 100:	312b2b43 	andi	t3,t1,0x2b43
 104:	2e372031 	sltiu	s7,s1,8241
 108:	20302e34 	addi	s0,at,11828
 10c:	6c656d2d 	0x6c656d2d
 110:	736d2d20 	0x736d2d20
 114:	6c676e69 	0x6c676e69
 118:	6c662d65 	0x6c662d65
 11c:	2074616f 	addi	s4,v1,24943
 120:	67786d2d 	0x67786d2d
 124:	2d20746f 	sltiu	zero,t1,29807
 128:	2d6f6e6d 	sltiu	t7,t3,28269
 12c:	63696261 	0x63696261
 130:	736c6c61 	0x736c6c61
 134:	686d2d20 	0x686d2d20
 138:	2d647261 	sltiu	a0,t3,29281
 13c:	616f6c66 	0x616f6c66
 140:	6d2d2074 	0x6d2d2074
 144:	33737069 	andi	s3,k1,0x7069
 148:	6d2d2032 	0x6d2d2032
 14c:	63736c6c 	0x63736c6c
 150:	6e6d2d20 	0x6e6d2d20
 154:	786c2d6f 	0x786c2d6f
 158:	732d3163 	0x732d3163
 15c:	20316378 	addi	s1,at,25464
 160:	6f6e6d2d 	0x6f6e6d2d
 164:	64616d2d 	0x64616d2d
 168:	2d203464 	sltiu	zero,t1,13412
 16c:	2d6f6e6d 	sltiu	t7,t3,28269
 170:	72616873 	0x72616873
 174:	2d206465 	sltiu	zero,t1,25701
 178:	6962616d 	0x6962616d
 17c:	2032333d 	addi	s2,at,13117
 180:	2d20672d 	sltiu	zero,t1,26413
 184:	2d20734f 	sltiu	zero,t1,29519
 188:	3d647473 	0x3d647473
 18c:	312b2b63 	andi	t3,t1,0x2b63
 190:	662d2031 	0x662d2031
 194:	636e7566 	0x636e7566
 198:	6e6f6974 	0x6e6f6974
 19c:	6365732d 	0x6365732d
 1a0:	6e6f6974 	0x6e6f6974
 1a4:	662d2073 	0x662d2073
 1a8:	61746164 	0x61746164
 1ac:	6365732d 	0x6365732d
 1b0:	6e6f6974 	0x6e6f6974
 1b4:	662d2073 	0x662d2073
 1b8:	65657266 	0x65657266
 1bc:	6e617473 	0x6e617473
 1c0:	676e6964 	0x676e6964
 1c4:	6e662d20 	0x6e662d20
 1c8:	75622d6f 	jalx	588b5bc <_mem_avail_start-0x7a774a44>
 1cc:	69746c69 	0x69746c69
 1d0:	662d206e 	0x662d206e
 1d4:	502d6f6e 	beql	at,t5,1bf90 <_mem_avail_start-0x7ffe4070>
 1d8:	73004549 	0x73004549
 1dc:	5f646e65 	0x5f646e65
 1e0:	69726573 	0x69726573
 1e4:	695f6c61 	0x695f6c61
 1e8:	6765746e 	0x6765746e
 1ec:	5f007265 	bgtzl	t8,1cb84 <_mem_avail_start-0x7ffe347c>
 1f0:	7339315a 	0x7339315a
 1f4:	5f646e65 	0x5f646e65
 1f8:	69726573 	0x69726573
 1fc:	695f6c61 	0x695f6c61
 200:	6765746e 	0x6765746e
 204:	00697265 	0x697265
 208:	6c697475 	0x6c697475
 20c:	2f797469 	sltiu	t9,k1,29801
 210:	72617473 	0x72617473
 214:	2e707574 	sltiu	s0,s3,30068
 218:	6d2f0053 	0x6d2f0053
 21c:	632f746e 	0x632f746e
 220:	6573552f 	0x6573552f
 224:	462f7372 	c1	0x2f7372
 228:	6f746361 	0x6f746361
 22c:	6c616972 	0x6c616972
 230:	6f642f4e 	0x6f642f4e
 234:	6f6c6e77 	0x6f6c6e77
 238:	2f736461 	sltiu	s3,k1,25697
 23c:	76697254 	jalx	9a5c950 <_mem_avail_start-0x765a36b0>
 240:	4d6c6169 	0x4d6c6169
 244:	5f535049 	0x5f535049
 248:	74666f53 	jalx	199bd4c <_mem_avail_start-0x7e6642b4>
 24c:	65726177 	0x65726177
 250:	7070632f 	0x7070632f
 254:	554e4700 	bnel	t2,t6,11e58 <_mem_avail_start-0x7ffee1a8>
 258:	20534120 	addi	s3,v0,16672
 25c:	30332e32 	andi	s3,at,0x2e32
 260:	30706300 	andi	s0,v1,0x6300
 264:	6461625f 	0x6461625f
 268:	64646176 	0x64646176
 26c:	58450072 	0x58450072
 270:	54504543 	bnel	v0,s0,11780 <_mem_avail_start-0x7ffee880>
 274:	5f4e4f49 	0x5f4e4f49
 278:	5353454d 	beql	k0,s3,117b0 <_mem_avail_start-0x7ffee850>
 27c:	53454741 	beql	k0,a1,11f84 <_mem_avail_start-0x7ffee07c>
 280:	30706300 	andi	s0,v1,0x6300
 284:	7561635f 	jalx	5858d7c <_mem_avail_start-0x7a7a7284>
 288:	70006573 	0x70006573
 28c:	746e6972 	jalx	1b9a5c8 <_mem_avail_start-0x7e465a38>
 290:	626c745f 	0x626c745f
 294:	6f425f00 	0x6f425f00
 298:	63006c6f 	0x63006c6f
 29c:	655f3070 	0x655f3070
 2a0:	5f006370 	bgtzl	t8,19064 <_mem_avail_start-0x7ffe6f9c>
 2a4:	6e69616d 	0x6e69616d
 2a8:	65675f00 	0x65675f00
 2ac:	61635f74 	0x61635f74
 2b0:	00657375 	0x657375
 2b4:	7373625f 	0x7373625f
 2b8:	69727700 	0x69727700
 2bc:	6c5f6574 	0x6c5f6574
 2c0:	62006465 	0x62006465
 2c4:	5f657479 	0x5f657479
 2c8:	675f0074 	0x675f0074
 2cc:	655f7465 	0x655f7465
 2d0:	73006370 	0x73006370
 2d4:	74726f68 	jalx	1c9bda0 <_mem_avail_start-0x7e364260>
 2d8:	736e7520 	0x736e7520
 2dc:	656e6769 	0x656e6769
 2e0:	6e692064 	0x6e692064
 2e4:	6e690074 	0x6e690074
 2e8:	735f7469 	0x735f7469
 2ec:	61697265 	0x61697265
 2f0:	625f006c 	0x625f006c
 2f4:	655f7373 	0x655f7373
 2f8:	6d00646e 	0x6d00646e
 2fc:	65736d65 	0x65736d65
 300:	72700074 	0x72700074
 304:	5f746e69 	0x5f746e69
 308:	70617274 	0x70617274
 30c:	6d617266 	0x6d617266
 310:	70630065 	0x70630065
 314:	74735f30 	jalx	1cd7cc0 <_mem_avail_start-0x7e328340>
 318:	73757461 	0x73757461
 31c:	646f6300 	0x646f6300
 320:	6e650065 	0x6e650065
 324:	5f797274 	0x5f797274
 328:	315f6f6c 	andi	ra,t2,0x6f6c
 32c:	78655f00 	0x78655f00
 330:	74706563 	jalx	1c1958c <_mem_avail_start-0x7e3e6a74>
 334:	5f6e6f69 	0x5f6e6f69
 338:	646e6168 	0x646e6168
 33c:	0072656c 	0x72656c
 340:	64646170 	0x64646170
 344:	00676e69 	0x676e69
 348:	746e6975 	jalx	1b9a5d4 <_mem_avail_start-0x7e465a2c>
 34c:	00745f38 	0x745f38
 350:	72746e65 	0x72746e65
 354:	6f6c5f79 	0x6f6c5f79
 358:	4700325f 	c1	0x100325f
 35c:	4320554e 	c0	0x120554e
 360:	37203131 	ori	zero,t9,0x3131
 364:	302e342e 	andi	t6,at,0x342e
 368:	656d2d20 	0x656d2d20
 36c:	6d2d206c 	0x6d2d206c
 370:	676e6973 	0x676e6973
 374:	662d656c 	0x662d656c
 378:	74616f6c 	jalx	185bdb0 <_mem_avail_start-0x7e7a4250>
 37c:	786d2d20 	0x786d2d20
 380:	20746f67 	addi	s4,v1,28519
 384:	6f6e6d2d 	0x6f6e6d2d
 388:	6962612d 	0x6962612d
 38c:	6c6c6163 	0x6c6c6163
 390:	6d2d2073 	0x6d2d2073
 394:	64726168 	0x64726168
 398:	6f6c662d 	0x6f6c662d
 39c:	2d207461 	sltiu	zero,t1,29793
 3a0:	7370696d 	0x7370696d
 3a4:	2d203233 	sltiu	zero,t1,12851
 3a8:	736c6c6d 	0x736c6c6d
 3ac:	6d2d2063 	0x6d2d2063
 3b0:	6c2d6f6e 	0x6c2d6f6e
 3b4:	2d316378 	sltiu	s1,t1,25464
 3b8:	31637873 	andi	v1,t3,0x7873
 3bc:	6e6d2d20 	0x6e6d2d20
 3c0:	616d2d6f 	0x616d2d6f
 3c4:	20346464 	addi	s4,at,25700
 3c8:	6f6e6d2d 	0x6f6e6d2d
 3cc:	6168732d 	0x6168732d
 3d0:	20646572 	addi	a0,v1,25970
 3d4:	62616d2d 	0x62616d2d
 3d8:	32333d69 	andi	s3,s1,0x3d69
 3dc:	20672d20 	addi	a3,v1,11552
 3e0:	20734f2d 	addi	s3,v1,20269
 3e4:	7566662d 	jalx	59998b4 <_mem_avail_start-0x7a66674c>
 3e8:	6974636e 	0x6974636e
 3ec:	732d6e6f 	0x732d6e6f
 3f0:	69746365 	0x69746365
 3f4:	20736e6f 	addi	s3,v1,28271
 3f8:	6164662d 	0x6164662d
 3fc:	732d6174 	0x732d6174
 400:	69746365 	0x69746365
 404:	20736e6f 	addi	s3,v1,28271
 408:	7266662d 	0x7266662d
 40c:	74736565 	jalx	1cd9594 <_mem_avail_start-0x7e326a6c>
 410:	69646e61 	0x69646e61
 414:	2d20676e 	sltiu	zero,t1,26478
 418:	2d6f6e66 	sltiu	t7,t3,28262
 41c:	6c697562 	0x6c697562
 420:	206e6974 	addi	t6,v1,26996
 424:	6f6e662d 	0x6f6e662d
 428:	4549502d 	0x4549502d
 42c:	73736200 	0x73736200
 430:	7a69735f 	0x7a69735f
 434:	72770065 	0x72770065
 438:	5f657469 	0x5f657469
 43c:	6d676573 	0x6d676573
 440:	00746e65 	0x746e65
 444:	6e697270 	0x6e697270
 448:	73006674 	0x73006674
 44c:	74726f68 	jalx	1c9bda0 <_mem_avail_start-0x7e364260>
 450:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 454:	30706300 	andi	s0,v1,0x6300
 458:	6162655f 	0x6162655f
 45c:	75006573 	jalx	40195cc <_mem_avail_start-0x7bfe6a34>
 460:	31746e69 	andi	s4,t3,0x6e69
 464:	00745f36 	tne	v1,s4,0x17c
 468:	746e6975 	jalx	1b9a5d4 <_mem_avail_start-0x7e465a2c>
 46c:	745f3233 	jalx	17cc8cc <_mem_avail_start-0x7e833734>
 470:	6e6f6c00 	0x6e6f6c00
 474:	6e692067 	0x6e692067
 478:	6e650074 	0x6e650074
 47c:	5f797274 	0x5f797274
 480:	70006968 	0x70006968
 484:	00737475 	0x737475
 488:	6c697475 	0x6c697475
 48c:	2f797469 	sltiu	t9,k1,29801
 490:	6e69616d 	0x6e69616d
 494:	7200632e 	0x7200632e
 498:	6c757365 	0x6c757365
 49c:	73610074 	0x73610074
 4a0:	74726573 	jalx	1c995cc <_mem_avail_start-0x7e366a34>
 4a4:	006e6f69 	0x6e6f69
 4a8:	70617274 	0x70617274
 4ac:	6d617266 	0x6d617266
 4b0:	00745f65 	0x745f65
 4b4:	63747570 	0x63747570
 4b8:	00726168 	0x726168
 4bc:	6e697270 	0x6e697270
 4c0:	73616274 	0x73616274
 4c4:	72700065 	0x72700065
 4c8:	66746e69 	0x66746e69
 4cc:	6100632e 	0x6100632e
 4d0:	6e696167 	0x6e696167
 4d4:	6e6d2f00 	0x6e6d2f00
 4d8:	2f632f74 	sltiu	v1,k1,12148
 4dc:	72657355 	0x72657355
 4e0:	61462f73 	0x61462f73
 4e4:	726f7463 	0x726f7463
 4e8:	4e6c6169 	c3	0x6c6169
 4ec:	776f642f 	jalx	dbd90bc <_mem_avail_start-0x72426f44>
 4f0:	616f6c6e 	0x616f6c6e
 4f4:	542f7364 	bnel	at,t7,1d288 <_mem_avail_start-0x7ffe2d78>
 4f8:	69766972 	0x69766972
 4fc:	494d6c61 	0x494d6c61
 500:	535f5350 	beql	k0,ra,15244 <_mem_avail_start-0x7ffeadbc>
 504:	7774666f 	jalx	dd199bc <_mem_avail_start-0x722e6644>
 508:	2f657261 	sltiu	a1,k1,29281
 50c:	2f707063 	sltiu	s0,k1,28771
 510:	0062696c 	0x62696c
 514:	73747570 	0x73747570
 518:	6e697274 	0x6e697274
 51c:	61760067 	0x61760067
 520:	0065756c 	0x65756c
 524:	6e697270 	0x6e697270
 528:	73616274 	0x73616274
 52c:	00632e65 	0x632e65
 530:	6e676973 	0x6e676973
 534:	6d656d00 	0x6d656d00
 538:	65766f6d 	0x65766f6d
 53c:	657a6200 	0x657a6200
 540:	73006f72 	0x73006f72
 544:	6e697274 	0x6e697274
 548:	00632e67 	0x632e67
 54c:	657a6973 	0x657a6973
 550:	6d00745f 	0x6d00745f
 554:	6d636d65 	0x6d636d65
 558:	74730070 	jalx	1cc01c0 <_mem_avail_start-0x7e33fe40>
 55c:	70636e72 	0x70636e72
 560:	74730079 	jalx	1cc01e4 <_mem_avail_start-0x7e33fe1c>
 564:	656c6e72 	0x656c6e72
 568:	7473006e 	jalx	1cc01b8 <_mem_avail_start-0x7e33fe48>
 56c:	72686372 	0x72686372
 570:	72747300 	0x72747300
 574:	00797063 	0x797063
 578:	63727473 	0x63727473
 57c:	6d00706d 	0x6d00706d
 580:	70636d65 	0x70636d65
 584:	74730079 	jalx	1cc01e4 <_mem_avail_start-0x7e33fe1c>
 588:	6e656c72 	0x6e656c72
 58c:	72747300 	0x72747300
 590:	706d636e 	0x706d636e
 594:	72747300 	0x72747300
 598:	646e6966 	0x646e6966
 59c:	74757000 	jalx	1d5c000 <_mem_avail_start-0x7e2a4000>
 5a0:	00632e73 	tltu	v1,v1,0xb9
 5a4:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 5a8:	65735f65 	0x65735f65
 5ac:	6c616972 	0x6c616972
 5b0:	74757000 	jalx	1d5c000 <_mem_avail_start-0x7e2a4000>
 5b4:	72616863 	0x72616863
 5b8:	7700632e 	jalx	c018cb8 <_mem_avail_start-0x73fe7348>
 5bc:	65746972 	0x65746972
 5c0:	6f77685f 	0x6f77685f
 5c4:	5f006472 	bgtzl	t8,19790 <_mem_avail_start-0x7ffe6870>
 5c8:	7277355a 	0x7277355a
 5cc:	49657469 	0x49657469
 5d0:	5076456a 	beql	v1,s6,11b7c <_mem_avail_start-0x7ffee484>
 5d4:	005f5476 	tne	v0,ra,0x151
 5d8:	64616572 	0x64616572
 5dc:	6977735f 	0x6977735f
 5e0:	65686374 	0x65686374
 5e4:	72770073 	0x72770073
 5e8:	5f657469 	0x5f657469
 5ec:	64726f77 	0x64726f77
 5f0:	74616400 	jalx	1859000 <_mem_avail_start-0x7e7a7000>
 5f4:	72770061 	0x72770061
 5f8:	5f657469 	0x5f657469
 5fc:	65747962 	0x65747962
 600:	345a5f00 	ori	k0,v0,0x5f00
 604:	64616572 	0x64616572
 608:	54456d49 	bnel	v0,a1,1bb30 <_mem_avail_start-0x7ffe44d0>
 60c:	0076505f 	0x76505f
 610:	746e6975 	jalx	1b9a5d4 <_mem_avail_start-0x7e465a2c>
 614:	745f3436 	jalx	17cd0d8 <_mem_avail_start-0x7e832f28>
 618:	69727700 	0x69727700
 61c:	753c6574 	jalx	4f195d0 <_mem_avail_start-0x7b0e6a30>
 620:	6769736e 	0x6769736e
 624:	2064656e 	addi	a0,v1,25966
 628:	72616863 	0x72616863
 62c:	6572003e 	0x6572003e
 630:	685f6461 	0x685f6461
 634:	64726f77 	0x64726f77
 638:	355a5f00 	ori	k0,t2,0x5f00
 63c:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 640:	456d4965 	0x456d4965
 644:	54765076 	bnel	v1,s6,14820 <_mem_avail_start-0x7ffeb7e0>
 648:	5a5f005f 	0x5a5f005f
 64c:	61657234 	0x61657234
 650:	45744964 	0x45744964
 654:	76505f54 	jalx	9417d50 <_mem_avail_start-0x76be82b0>
 658:	69727700 	0x69727700
 65c:	6c3c6574 	0x6c3c6574
 660:	20676e6f 	addi	a3,v1,28271
 664:	69736e75 	0x69736e75
 668:	64656e67 	0x64656e67
 66c:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 670:	7277003e 	0x7277003e
 674:	5f657469 	0x5f657469
 678:	726f7764 	0x726f7764
 67c:	65720064 	0x65720064
 680:	6c3c6461 	0x6c3c6461
 684:	20676e6f 	addi	a3,v1,28271
 688:	69736e75 	0x69736e75
 68c:	64656e67 	0x64656e67
 690:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 694:	6572003e 	0x6572003e
 698:	735f6461 	0x735f6461
 69c:	61697265 	0x61697265
 6a0:	6f775f6c 	0x6f775f6c
 6a4:	64006472 	0x64006472
 6a8:	64726f77 	0x64726f77
 6ac:	5f00745f 	bgtzl	t8,1d82c <_mem_avail_start-0x7ffe27d4>
 6b0:	6572345a 	0x6572345a
 6b4:	68496461 	0x68496461
 6b8:	505f5445 	beql	v0,ra,157d0 <_mem_avail_start-0x7ffea830>
 6bc:	72770076 	0x72770076
 6c0:	3c657469 	0x3c657469
 6c4:	726f6873 	0x726f6873
 6c8:	6e752074 	0x6e752074
 6cc:	6e676973 	0x6e676973
 6d0:	69206465 	0x69206465
 6d4:	003e746e 	0x3e746e
 6d8:	64616572 	0x64616572
 6dc:	736e753c 	0x736e753c
 6e0:	656e6769 	0x656e6769
 6e4:	68632064 	0x68632064
 6e8:	003e7261 	0x3e7261
 6ec:	6863616d 	0x6863616d
 6f0:	2e656e69 	sltiu	a1,s3,28265
 6f4:	00707063 	0x707063
 6f8:	64616572 	0x64616572
 6fc:	6f77645f 	0x6f77645f
 700:	5f006472 	bgtzl	t8,198cc <_mem_avail_start-0x7ffe6734>
 704:	7277355a 	0x7277355a
 708:	49657469 	0x49657469
 70c:	50764568 	beql	v1,s6,11cb0 <_mem_avail_start-0x7ffee350>
 710:	005f5476 	tne	v0,ra,0x151
 714:	64616572 	0x64616572
 718:	736e753c 	0x736e753c
 71c:	656e6769 	0x656e6769
 720:	6e692064 	0x6e692064
 724:	5f003e74 	bgtzl	t8,100f8 <_mem_avail_start-0x7ffeff08>
 728:	7277355a 	0x7277355a
 72c:	49657469 	0x49657469
 730:	50764574 	beql	v1,s6,11d04 <_mem_avail_start-0x7ffee2fc>
 734:	005f5476 	tne	v0,ra,0x151
 738:	72345a5f 	0x72345a5f
 73c:	49646165 	0x49646165
 740:	5f54456a 	0x5f54456a
 744:	72007650 	0x72007650
 748:	5f646165 	0x5f646165
 74c:	69726573 	0x69726573
 750:	72006c61 	0x72006c61
 754:	5f646165 	0x5f646165
 758:	64726f77 	0x64726f77
 75c:	61657200 	0x61657200
 760:	68733c64 	0x68733c64
 764:	2074726f 	addi	s4,v1,29295
 768:	69736e75 	0x69736e75
 76c:	64656e67 	0x64656e67
 770:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 774:	7768003e 	jalx	da000f8 <_mem_avail_start-0x725fff08>
 778:	5f64726f 	0x5f64726f
 77c:	65720074 	0x65720074
 780:	625f6461 	0x625f6461
 784:	00657479 	0x657479
 788:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 78c:	6e753c65 	0x6e753c65
 790:	6e676973 	0x6e676973
 794:	69206465 	0x69206465
 798:	003e746e 	0x3e746e

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	0000000c 	syscall
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	ffffffff 	sdc3	$31,-1(ra)
   8:	7c010001 	0x7c010001
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	001d0d1f 	0x1d0d1f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	00000020 	add	zero,zero,zero
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	bfc00544 	cache	0x0,1348(s8)
  1c:	000000c8 	0xc8
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	48200e44 	0x48200e44
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	0291019f 	0x291019f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	a0020390 	sb	v0,912(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	dfd1d00a 	ldc3	$17,-12278(s8)
  30:	0b000e48 	j	c003920 <_mem_avail_start-0x73ffc6e0>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	0000000c 	syscall
	...
  40:	0000000c 	syscall
  44:	0000000c 	syscall
	...
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	0000000c 	syscall
  54:	00000028 	0x28
  58:	00000000 	nop
  5c:	bfc0060c 	cache	0x0,1548(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00000098 	0x98
  64:	44300e44 	0x44300e44
  68:	94580393 	lhu	t8,915(v0)
  6c:	91049202 	lbu	a0,-28158(t0)
  70:	9f069005 	0x9f069005
  74:	0e780201 	jal	9e00804 <_mem_avail_start-0x761ff7fc>
  78:	d2d1d000 	0xd2d1d000
  7c:	00dfd4d3 	0xdfd4d3
  80:	00000024 	and	zero,zero,zero
  84:	00000000 	nop
  88:	bfc006a4 	cache	0x0,1700(s8)
  8c:	00000068 	0x68
  90:	44280e44 	0x44280e44
  94:	92500391 	lbu	s0,913(s2)
  98:	9f049002 	0x9f049002
  9c:	0e500201 	jal	9400804 <_mem_avail_start-0x76bff7fc>
  a0:	d2d1d000 	0xd2d1d000
  a4:	000000df 	0xdf
  a8:	00000024 	and	zero,zero,zero
  ac:	00000000 	nop
  b0:	bfc0070c 	cache	0x0,1804(s8)
  b4:	000000b4 	teq	zero,zero,0x2
  b8:	44200e44 	0x44200e44
  bc:	90540291 	lbu	s4,657(v0)
  c0:	02019f03 	0x2019f03
  c4:	d1d00a4c 	0xd1d00a4c
  c8:	000e48df 	0xe48df
  cc:	0000000b 	movn	zero,zero,zero
  d0:	0000000c 	syscall
  d4:	ffffffff 	sdc3	$31,-1(ra)
  d8:	7c010001 	0x7c010001
  dc:	001d0d1f 	0x1d0d1f
  e0:	0000002c 	0x2c
  e4:	000000d0 	0xd0
  e8:	bfc007c0 	cache	0x0,1984(s8)
  ec:	00000224 	0x224
  f0:	44300e44 	0x44300e44
  f4:	93580690 	lbu	t8,1680(k0)
  f8:	91049203 	lbu	a0,-28157(t0)
  fc:	94019f05 	lhu	at,-24827(zero)
 100:	0a500202 	j	9400808 <_mem_avail_start-0x76bff7f8>
 104:	d1d0000e 	0xd1d0000e
 108:	dfd4d3d2 	ldc3	$20,-11310(s8)
 10c:	0000000b 	movn	zero,zero,zero
 110:	0000000c 	syscall
 114:	ffffffff 	sdc3	$31,-1(ra)
 118:	7c010001 	0x7c010001
 11c:	001d0d1f 	0x1d0d1f
 120:	00000028 	0x28
 124:	00000110 	0x110
 128:	bfc009e4 	cache	0x0,2532(s8)
 12c:	000000d8 	0xd8
 130:	58680e44 	0x58680e44
 134:	03930294 	0x3930294
 138:	0492019f 	bltzall	a0,7b8 <_mem_avail_start-0x7ffff848>
 13c:	06900591 	bltzal	s4,1784 <_mem_avail_start-0x7fffe87c>
 140:	0e0a6802 	jal	829a008 <_mem_avail_start-0x77d65ff8>
 144:	d2d1d000 	0xd2d1d000
 148:	0bdfd4d3 	j	f7f534c <_mem_avail_start-0x7080acb4>
 14c:	0000000c 	syscall
 150:	ffffffff 	sdc3	$31,-1(ra)
 154:	7c010001 	0x7c010001
 158:	001d0d1f 	0x1d0d1f
 15c:	0000000c 	syscall
 160:	0000014c 	syscall	0x5
 164:	00000000 	nop
 168:	00000020 	add	zero,zero,zero
 16c:	0000000c 	syscall
 170:	0000014c 	syscall	0x5
 174:	00000000 	nop
 178:	00000028 	0x28
 17c:	0000000c 	syscall
 180:	0000014c 	syscall	0x5
 184:	00000000 	nop
 188:	00000024 	and	zero,zero,zero
 18c:	0000000c 	syscall
 190:	0000014c 	syscall	0x5
 194:	00000000 	nop
 198:	00000034 	teq	zero,zero
 19c:	0000000c 	syscall
 1a0:	0000014c 	syscall	0x5
 1a4:	00000000 	nop
 1a8:	00000030 	tge	zero,zero
 1ac:	0000000c 	syscall
 1b0:	0000014c 	syscall	0x5
 1b4:	00000000 	nop
 1b8:	00000044 	0x44
 1bc:	0000000c 	syscall
 1c0:	0000014c 	syscall	0x5
 1c4:	00000000 	nop
 1c8:	0000002c 	0x2c
 1cc:	0000000c 	syscall
 1d0:	0000014c 	syscall	0x5
 1d4:	00000000 	nop
 1d8:	00000028 	0x28
 1dc:	0000000c 	syscall
 1e0:	0000014c 	syscall	0x5
 1e4:	bfc00abc 	cache	0x0,2748(s8)
 1e8:	00000024 	and	zero,zero,zero
 1ec:	0000000c 	syscall
 1f0:	0000014c 	syscall	0x5
 1f4:	00000000 	nop
 1f8:	0000002c 	0x2c
 1fc:	0000000c 	syscall
 200:	0000014c 	syscall	0x5
 204:	00000000 	nop
 208:	00000070 	tge	zero,zero,0x1
 20c:	0000000c 	syscall
 210:	0000014c 	syscall	0x5
 214:	00000000 	nop
 218:	00000040 	ssnop
 21c:	0000000c 	syscall
 220:	0000014c 	syscall	0x5
 224:	00000000 	nop
 228:	0000000c 	syscall
 22c:	0000000c 	syscall
 230:	ffffffff 	sdc3	$31,-1(ra)
 234:	7c010001 	0x7c010001
 238:	001d0d1f 	0x1d0d1f
 23c:	00000024 	and	zero,zero,zero
 240:	0000022c 	0x22c
 244:	bfc00ae0 	cache	0x0,2784(s8)
 248:	00000060 	0x60
 24c:	50200e44 	beqzl	at,3b60 <_mem_avail_start-0x7fffc4a0>
 250:	03910292 	0x3910292
 254:	0490019f 	bltzal	a0,8d4 <_mem_avail_start-0x7ffff72c>
 258:	000e0a6c 	0xe0a6c
 25c:	dfd2d1d0 	ldc3	$18,-11824(s8)
 260:	0000000b 	movn	zero,zero,zero
 264:	00000018 	mult	zero,zero
 268:	0000022c 	0x22c
 26c:	bfc00b40 	cache	0x0,2880(s8)
 270:	00000030 	tge	zero,zero
 274:	44180e44 	0x44180e44
 278:	0e68019f 	jal	9a0067c <_mem_avail_start-0x765ff984>
 27c:	0000df00 	sll	k1,zero,0x1c
 280:	0000000c 	syscall
 284:	ffffffff 	sdc3	$31,-1(ra)
 288:	7c010001 	0x7c010001
 28c:	001d0d1f 	0x1d0d1f
 290:	0000001c 	0x1c
 294:	00000280 	sll	zero,zero,0xa
 298:	bfc00b70 	cache	0x0,2928(s8)
 29c:	0000002c 	0x2c
 2a0:	44180e44 	0x44180e44
 2a4:	9f480290 	0x9f480290
 2a8:	000e5c01 	0xe5c01
 2ac:	0000dfd0 	0xdfd0
