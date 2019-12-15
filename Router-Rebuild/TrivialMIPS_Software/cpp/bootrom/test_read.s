
test_read.bootrom.elf:     file format elf32-tradlittlemips
test_read.bootrom.elf


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
bfc00030:	0ff00124 	jal	bfc00490 <_main>
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
bfc00440:	0ff00196 	jal	bfc00658 <_exception_handler>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:127
    nop
bfc00444:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:128
    j _loop
bfc00448:	0bf0000e 	j	bfc00038 <_loop>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:129
    nop
bfc0044c:	00000000 	nop

bfc00450 <_entry>:
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:5
#include <stdint.h>
#include <stdio.h>
#include "trivial_mips.h"

int _entry(){
bfc00450:	27bdffe0 	addiu	sp,sp,-32
bfc00454:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:16
        }
        c = (uint8_t*)0xbb0001fc;
        d = (uint8_t*)0xbb0001fd;
        e = (uint8_t*)0xbb0001fe;
        (*hastoRead) = 0;
        printf("has packet");
bfc00458:	3c10bfc0 	lui	s0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:5
int _entry(){
bfc0045c:	afb10018 	sw	s1,24(sp)
bfc00460:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:10
        while((*hastoRead)==0){
bfc00464:	3c11bb00 	lui	s1,0xbb00
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:16
        printf("has packet");
bfc00468:	26100b68 	addiu	s0,s0,2920
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:10
        while((*hastoRead)==0){
bfc0046c:	922201ff 	lbu	v0,511(s1)
bfc00470:	304200ff 	andi	v0,v0,0xff
bfc00474:	1040fffd 	beqz	v0,bfc0046c <_entry+0x1c>
bfc00478:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:15
        (*hastoRead) = 0;
bfc0047c:	a22001ff 	sb	zero,511(s1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:16
        printf("has packet");
bfc00480:	0ff001c3 	jal	bfc0070c <printf>
bfc00484:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:9
    while(1){
bfc00488:	1000fff8 	b	bfc0046c <_entry+0x1c>
bfc0048c:	00000000 	nop

bfc00490 <_main>:
_main():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:11
extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {
bfc00490:	27bdffe0 	addiu	sp,sp,-32
bfc00494:	afbf001c 	sw	ra,28(sp)
bfc00498:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:13

    init_serial();
bfc0049c:	0ff002ba 	jal	bfc00ae8 <init_serial>
bfc004a0:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:15

    write_segment(0x04);
bfc004a4:	0ff002d5 	jal	bfc00b54 <write_segment>
bfc004a8:	24040004 	li	a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:17

    puts("*****TrivialMIPS Bare Metal System*****");
bfc004ac:	3c04bfc0 	lui	a0,0xbfc0
bfc004b0:	0ff002a3 	jal	bfc00a8c <puts>
bfc004b4:	24840b74 	addiu	a0,a0,2932
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc004b8:	3c118800 	lui	s1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc004bc:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc004c0:	3c108800 	lui	s0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc004c4:	24840b9c 	addiu	a0,a0,2972
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc004c8:	26310000 	addiu	s1,s1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc004cc:	0ff002a3 	jal	bfc00a8c <puts>
bfc004d0:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc004d4:	02118023 	subu	s0,s0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:21
    write_segment(0x05);
bfc004d8:	0ff002d5 	jal	bfc00b54 <write_segment>
bfc004dc:	24040005 	li	a0,5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:25
    if (bss_size > 0) {
bfc004e0:	1a000009 	blez	s0,bfc00508 <_main+0x78>
bfc004e4:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:26
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
bfc004e8:	02003025 	move	a2,s0
bfc004ec:	02202825 	move	a1,s1
bfc004f0:	0ff001c3 	jal	bfc0070c <printf>
bfc004f4:	24840bc4 	addiu	a0,a0,3012
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:27
        memset(&_bss, 0, bss_size);
bfc004f8:	02003025 	move	a2,s0
bfc004fc:	00002825 	move	a1,zero
bfc00500:	0ff00282 	jal	bfc00a08 <memset>
bfc00504:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:30
    }

    write_segment(0x06);
bfc00508:	0ff002d5 	jal	bfc00b54 <write_segment>
bfc0050c:	24040006 	li	a0,6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:33

    // call the actual function
    int result = _entry();
bfc00510:	0ff00114 	jal	bfc00450 <_entry>
bfc00514:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:34
    if (result == 0) {
bfc00518:	1440000a 	bnez	v0,bfc00544 <_main+0xb4>
bfc0051c:	00402825 	move	a1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:35
        puts("Program exited normally.");
bfc00520:	3c04bfc0 	lui	a0,0xbfc0
bfc00524:	0ff002a3 	jal	bfc00a8c <puts>
bfc00528:	24840c00 	addiu	a0,a0,3072
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}
bfc0052c:	8fbf001c 	lw	ra,28(sp)
bfc00530:	8fb10018 	lw	s1,24(sp)
bfc00534:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:40
    write_segment(0x07);
bfc00538:	24040007 	li	a0,7
bfc0053c:	0bf002d5 	j	bfc00b54 <write_segment>
bfc00540:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:37
        printf("Program exited abnormally with code %d.\n", result);
bfc00544:	3c04bfc0 	lui	a0,0xbfc0
bfc00548:	0ff001c3 	jal	bfc0070c <printf>
bfc0054c:	24840c1c 	addiu	a0,a0,3100
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
}
bfc00550:	1000fff7 	b	bfc00530 <_main+0xa0>
bfc00554:	8fbf001c 	lw	ra,28(sp)

bfc00558 <print_trapframe>:
print_trapframe():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
bfc00558:	27bdffd0 	addiu	sp,sp,-48
bfc0055c:	afb30024 	sw	s3,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00560:	3c13bfc0 	lui	s3,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
void print_trapframe(trapframe_t *tf) {
bfc00564:	afb40028 	sw	s4,40(sp)
bfc00568:	afb20020 	sw	s2,32(sp)
bfc0056c:	afb1001c 	sw	s1,28(sp)
bfc00570:	afb00018 	sw	s0,24(sp)
bfc00574:	afbf002c 	sw	ra,44(sp)
bfc00578:	00808025 	move	s0,a0
bfc0057c:	24920028 	addiu	s2,a0,40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
bfc00580:	24110001 	li	s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00584:	26730c48 	addiu	s3,s3,3144
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
bfc00588:	24140020 	li	s4,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64 (discriminator 3)
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc0058c:	8e460000 	lw	a2,0(s2)
bfc00590:	02202825 	move	a1,s1
bfc00594:	02602025 	move	a0,s3
bfc00598:	0ff001c3 	jal	bfc0070c <printf>
bfc0059c:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63 (discriminator 3)
    for(int i = 1; i < 32; ++i) {
bfc005a0:	1634fffa 	bne	s1,s4,bfc0058c <print_trapframe+0x34>
bfc005a4:	26520004 	addiu	s2,s2,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:66
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
bfc005a8:	8e020020 	lw	v0,32(s0)
bfc005ac:	8e070018 	lw	a3,24(s0)
bfc005b0:	afa20014 	sw	v0,20(sp)
bfc005b4:	8e02001c 	lw	v0,28(s0)
bfc005b8:	8e060014 	lw	a2,20(s0)
bfc005bc:	8e050010 	lw	a1,16(s0)
bfc005c0:	3c04bfc0 	lui	a0,0xbfc0
bfc005c4:	afa20010 	sw	v0,16(sp)
bfc005c8:	0ff001c3 	jal	bfc0070c <printf>
bfc005cc:	24840c5c 	addiu	a0,a0,3164
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:67
}
bfc005d0:	8fbf002c 	lw	ra,44(sp)
bfc005d4:	8fb40028 	lw	s4,40(sp)
bfc005d8:	8fb30024 	lw	s3,36(sp)
bfc005dc:	8fb20020 	lw	s2,32(sp)
bfc005e0:	8fb1001c 	lw	s1,28(sp)
bfc005e4:	8fb00018 	lw	s0,24(sp)
bfc005e8:	03e00008 	jr	ra
bfc005ec:	27bd0030 	addiu	sp,sp,48

bfc005f0 <print_tlb>:
print_tlb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69

void print_tlb() {
bfc005f0:	27bdffd8 	addiu	sp,sp,-40
bfc005f4:	afb1001c 	sw	s1,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc005f8:	3c11bfc0 	lui	s1,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69
void print_tlb() {
bfc005fc:	afb20020 	sw	s2,32(sp)
bfc00600:	afb00018 	sw	s0,24(sp)
bfc00604:	afbf0024 	sw	ra,36(sp)
bfc00608:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc0060c:	26310c98 	addiu	s1,s1,3224
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
bfc00610:	24120010 	li	s2,16
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:72 (discriminator 3)
        asm volatile(
bfc00614:	40900000 	mtc0	s0,c0_index
bfc00618:	42000001 	tlbr
bfc0061c:	40065000 	mfc0	a2,c0_entryhi
bfc00620:	40071000 	mfc0	a3,c0_entrylo0
bfc00624:	40021800 	mfc0	v0,c0_entrylo1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81 (discriminator 3)
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc00628:	02002825 	move	a1,s0
bfc0062c:	afa20010 	sw	v0,16(sp)
bfc00630:	02202025 	move	a0,s1
bfc00634:	0ff001c3 	jal	bfc0070c <printf>
bfc00638:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70 (discriminator 3)
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
bfc0063c:	1612fff5 	bne	s0,s2,bfc00614 <print_tlb+0x24>
bfc00640:	8fbf0024 	lw	ra,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:83
    }
}
bfc00644:	8fb20020 	lw	s2,32(sp)
bfc00648:	8fb1001c 	lw	s1,28(sp)
bfc0064c:	8fb00018 	lw	s0,24(sp)
bfc00650:	03e00008 	jr	ra
bfc00654:	27bd0028 	addiu	sp,sp,40

bfc00658 <_exception_handler>:
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85

void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00658:	27bdffe0 	addiu	sp,sp,-32
bfc0065c:	afb10018 	sw	s1,24(sp)
bfc00660:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00664:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00668:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc0066c:	24840b74 	addiu	a0,a0,2932
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00670:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00674:	0ff002a3 	jal	bfc00a8c <puts>
bfc00678:	00a08025 	move	s0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:87
    if (assertion) {
bfc0067c:	12000012 	beqz	s0,bfc006c8 <_exception_handler+0x70>
bfc00680:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:88
        puts("CPU internal assertion failed, abort.");
bfc00684:	3c04bfc0 	lui	a0,0xbfc0
bfc00688:	0ff002a3 	jal	bfc00a8c <puts>
bfc0068c:	24840cd0 	addiu	a0,a0,3280
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:89
        write_segment(0xdeaddead);
bfc00690:	3c04dead 	lui	a0,0xdead
bfc00694:	0ff002d5 	jal	bfc00b54 <write_segment>
bfc00698:	3484dead 	ori	a0,a0,0xdead
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:96
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
bfc0069c:	0ff00156 	jal	bfc00558 <print_trapframe>
bfc006a0:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:97
    print_tlb();
bfc006a4:	0ff0017c 	jal	bfc005f0 <print_tlb>
bfc006a8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:99
    puts("*****System HANG*****");
}
bfc006ac:	8fbf001c 	lw	ra,28(sp)
bfc006b0:	8fb10018 	lw	s1,24(sp)
bfc006b4:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:98
    puts("*****System HANG*****");
bfc006b8:	3c04bfc0 	lui	a0,0xbfc0
bfc006bc:	24840d34 	addiu	a0,a0,3380
bfc006c0:	0bf002a3 	j	bfc00a8c <puts>
bfc006c4:	27bd0020 	addiu	sp,sp,32
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
bfc006c8:	40066800 	mfc0	a2,c0_cause
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:91
        word_t code = (_get_cause() >> 2) & 0xF;
bfc006cc:	00063082 	srl	a2,a2,0x2
bfc006d0:	30c6000f 	andi	a2,a2,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
bfc006d4:	3c03bfc0 	lui	v1,0xbfc0
bfc006d8:	00061080 	sll	v0,a2,0x2
bfc006dc:	24630fc0 	addiu	v1,v1,4032
bfc006e0:	00431021 	addu	v0,v0,v1
bfc006e4:	8c470000 	lw	a3,0(v0)
bfc006e8:	3c04bfc0 	lui	a0,0xbfc0
_get_epc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:46
    asm(
bfc006ec:	40107000 	mfc0	s0,c0_epc
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
bfc006f0:	24840cf8 	addiu	a0,a0,3320
bfc006f4:	0ff001c3 	jal	bfc0070c <printf>
bfc006f8:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:94
        write_led((uint16_t) epc);
bfc006fc:	0ff002d0 	jal	bfc00b40 <write_led>
bfc00700:	3204ffff 	andi	a0,s0,0xffff
bfc00704:	1000ffe5 	b	bfc0069c <_exception_handler+0x44>
bfc00708:	00000000 	nop

bfc0070c <printf>:
printf():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
int printf(const char *fmt, ...)
{
bfc0070c:	27bdffd0 	addiu	sp,sp,-48
bfc00710:	afb00018 	sw	s0,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
bfc00714:	27b00034 	addiu	s0,sp,52
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
{
bfc00718:	afb30024 	sw	s3,36(sp)
bfc0071c:	afb20020 	sw	s2,32(sp)
bfc00720:	afb1001c 	sw	s1,28(sp)
bfc00724:	afbf002c 	sw	ra,44(sp)
bfc00728:	afb40028 	sw	s4,40(sp)
bfc0072c:	00809025 	move	s2,a0
bfc00730:	afa50034 	sw	a1,52(sp)
bfc00734:	afa60038 	sw	a2,56(sp)
bfc00738:	afa7003c 	sw	a3,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	__builtin_va_start(ap, fmt);
bfc0073c:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10
	arg = ap;
	for (i = 0; fmt[i]; i++)
bfc00740:	00008825 	move	s1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
				break;
			}
		}
		else
		{
			if (c == '\n')
bfc00744:	2413000a 	li	s3,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 1)
	for (i = 0; fmt[i]; i++)
bfc00748:	02511021 	addu	v0,s2,s1
bfc0074c:	80540000 	lb	s4,0(v0)
bfc00750:	1680000a 	bnez	s4,bfc0077c <printf+0x70>
bfc00754:	24020025 	li	v0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:85
				putchar('\r');
			putchar(c);
		}
	}
	return 0;
}
bfc00758:	8fbf002c 	lw	ra,44(sp)
bfc0075c:	8fb40028 	lw	s4,40(sp)
bfc00760:	8fb30024 	lw	s3,36(sp)
bfc00764:	8fb20020 	lw	s2,32(sp)
bfc00768:	8fb1001c 	lw	s1,28(sp)
bfc0076c:	8fb00018 	lw	s0,24(sp)
bfc00770:	00001025 	move	v0,zero
bfc00774:	03e00008 	jr	ra
bfc00778:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:13
		if (c == '%')
bfc0077c:	16820066 	bne	s4,v0,bfc00918 <printf+0x20c>
bfc00780:	24050001 	li	a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00784:	24060064 	li	a2,100
bfc00788:	24070025 	li	a3,37
bfc0078c:	24080030 	li	t0,48
bfc00790:	02511021 	addu	v0,s2,s1
bfc00794:	80420001 	lb	v0,1(v0)
bfc00798:	1046003a 	beq	v0,a2,bfc00884 <printf+0x178>
bfc0079c:	28430065 	slti	v1,v0,101
bfc007a0:	10600018 	beqz	v1,bfc00804 <printf+0xf8>
bfc007a4:	2843003a 	slti	v1,v0,58
bfc007a8:	1060000c 	beqz	v1,bfc007dc <printf+0xd0>
bfc007ac:	28430031 	slti	v1,v0,49
bfc007b0:	1060004d 	beqz	v1,bfc008e8 <printf+0x1dc>
bfc007b4:	02512021 	addu	a0,s2,s1
bfc007b8:	10470046 	beq	v0,a3,bfc008d4 <printf+0x1c8>
bfc007bc:	26340001 	addiu	s4,s1,1
bfc007c0:	10480048 	beq	v0,t0,bfc008e4 <printf+0x1d8>
bfc007c4:	02542021 	addu	a0,s2,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:73
				putchar('%');
bfc007c8:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
bfc007cc:	0ff002af 	jal	bfc00abc <putchar>
bfc007d0:	26310001 	addiu	s1,s1,1
bfc007d4:	1000ffdd 	b	bfc0074c <printf+0x40>
bfc007d8:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc007dc:	24030062 	li	v1,98
bfc007e0:	10430036 	beq	v0,v1,bfc008bc <printf+0x1b0>
bfc007e4:	26340001 	addiu	s4,s1,1
bfc007e8:	24030063 	li	v1,99
bfc007ec:	1443fff6 	bne	v0,v1,bfc007c8 <printf+0xbc>
bfc007f0:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:25
				putchar((long)*arg);
bfc007f4:	0ff002af 	jal	bfc00abc <putchar>
bfc007f8:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc007fc:	10000017 	b	bfc0085c <printf+0x150>
bfc00800:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00804:	24030070 	li	v1,112
bfc00808:	1043002f 	beq	v0,v1,bfc008c8 <printf+0x1bc>
bfc0080c:	28430071 	slti	v1,v0,113
bfc00810:	10600008 	beqz	v1,bfc00834 <printf+0x128>
bfc00814:	24030075 	li	v1,117
bfc00818:	2403006c 	li	v1,108
bfc0081c:	10430020 	beq	v0,v1,bfc008a0 <printf+0x194>
bfc00820:	2403006f 	li	v1,111
bfc00824:	1443ffe8 	bne	v0,v1,bfc007c8 <printf+0xbc>
bfc00828:	00003825 	move	a3,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:45
				printbase((long)*arg, w, 8, 0);
bfc0082c:	10000017 	b	bfc0088c <printf+0x180>
bfc00830:	24060008 	li	a2,8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00834:	1043000d 	beq	v0,v1,bfc0086c <printf+0x160>
bfc00838:	26340001 	addiu	s4,s1,1
bfc0083c:	24030078 	li	v1,120
bfc00840:	10430021 	beq	v0,v1,bfc008c8 <printf+0x1bc>
bfc00844:	24030073 	li	v1,115
bfc00848:	1443ffe0 	bne	v0,v1,bfc007cc <printf+0xc0>
bfc0084c:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:20
				putstring(*arg);
bfc00850:	0ff0028b 	jal	bfc00a2c <putstring>
bfc00854:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc00858:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
bfc0085c:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 2)
	for (i = 0; fmt[i]; i++)
bfc00860:	26310001 	addiu	s1,s1,1
bfc00864:	1000ffb9 	b	bfc0074c <printf+0x40>
bfc00868:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:30
				printbase((long)*arg, w, 10, 0);
bfc0086c:	00003825 	move	a3,zero
bfc00870:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
bfc00874:	0ff0024c 	jal	bfc00930 <printbase>
bfc00878:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc0087c:	1000fff7 	b	bfc0085c <printf+0x150>
bfc00880:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:35
				printbase((long)*arg, w, 10, 1);
bfc00884:	24070001 	li	a3,1
bfc00888:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
bfc0088c:	8e040000 	lw	a0,0(s0)
bfc00890:	0ff0024c 	jal	bfc00930 <printbase>
bfc00894:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:59
				break;
bfc00898:	1000fff1 	b	bfc00860 <printf+0x154>
bfc0089c:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:40
				printbase((long)*arg, w, 10, 0);
bfc008a0:	8e040000 	lw	a0,0(s0)
bfc008a4:	00003825 	move	a3,zero
bfc008a8:	0ff0024c 	jal	bfc00930 <printbase>
bfc008ac:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:41
				arg++;
bfc008b0:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:43
				break;
bfc008b4:	1000ffea 	b	bfc00860 <printf+0x154>
bfc008b8:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
bfc008bc:	00003825 	move	a3,zero
bfc008c0:	1000ffec 	b	bfc00874 <printf+0x168>
bfc008c4:	24060002 	li	a2,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
bfc008c8:	00003825 	move	a3,zero
bfc008cc:	1000ffef 	b	bfc0088c <printf+0x180>
bfc008d0:	24060010 	li	a2,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:61
				putchar('%');
bfc008d4:	0ff002af 	jal	bfc00abc <putchar>
bfc008d8:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
bfc008dc:	1000ffe0 	b	bfc00860 <printf+0x154>
bfc008e0:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:65
				i++;
bfc008e4:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:15 (discriminator 1)
			w = 1;
bfc008e8:	00002825 	move	a1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:67 (discriminator 1)
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
bfc008ec:	80830001 	lb	v1,1(a0)
bfc008f0:	00928823 	subu	s1,a0,s2
bfc008f4:	2462ffcf 	addiu	v0,v1,-49
bfc008f8:	304200ff 	andi	v0,v0,0xff
bfc008fc:	2c420009 	sltiu	v0,v0,9
bfc00900:	1040ffa3 	beqz	v0,bfc00790 <printf+0x84>
bfc00904:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:68 (discriminator 3)
					w = w * 10 + (fmt[i + 1] - '0');
bfc00908:	70b31002 	mul	v0,a1,s3
bfc0090c:	2463ffd0 	addiu	v1,v1,-48
bfc00910:	1000fff6 	b	bfc008ec <printf+0x1e0>
bfc00914:	00432821 	addu	a1,v0,v1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
			if (c == '\n')
bfc00918:	16930003 	bne	s4,s3,bfc00928 <printf+0x21c>
bfc0091c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:80
				putchar('\r');
bfc00920:	0ff002af 	jal	bfc00abc <putchar>
bfc00924:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
bfc00928:	1000ffa8 	b	bfc007cc <printf+0xc0>
bfc0092c:	02802025 	move	a0,s4

bfc00930 <printbase>:
printbase():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2
int printbase(long v,int w,int base,int sign)
{
bfc00930:	27bdff98 	addiu	sp,sp,-104
bfc00934:	afb40060 	sw	s4,96(sp)
bfc00938:	afb3005c 	sw	s3,92(sp)
bfc0093c:	afbf0064 	sw	ra,100(sp)
bfc00940:	afb20058 	sw	s2,88(sp)
bfc00944:	afb10054 	sw	s1,84(sp)
bfc00948:	afb00050 	sw	s0,80(sp)
bfc0094c:	00a09825 	move	s3,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
bfc00950:	10e00018 	beqz	a3,bfc009b4 <printbase+0x84>
bfc00954:	00c0a025 	move	s4,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7 (discriminator 1)
bfc00958:	04810004 	bgez	a0,bfc0096c <printbase+0x3c>
bfc0095c:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:9
	{
	value = -v;
bfc00960:	00048023 	negu	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:10
	putchar('-');
bfc00964:	0ff002af 	jal	bfc00abc <putchar>
bfc00968:	2404002d 	li	a0,45
bfc0096c:	27b10010 	addiu	s1,sp,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2 (discriminator 1)
{
bfc00970:	02201025 	move	v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:14 (discriminator 1)
	}
	else value=v;

	for(i=0;value;i++)
bfc00974:	16000011 	bnez	s0,bfc009bc <printbase+0x8c>
bfc00978:	00519023 	subu	s2,v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22
	value=value/base;
	}

#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
bfc0097c:	0272802a 	slt	s0,s3,s2
bfc00980:	0250980b 	movn	s3,s2,s0
bfc00984:	02608025 	move	s0,s3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22 (discriminator 2)
bfc00988:	16000013 	bnez	s0,bfc009d8 <printbase+0xa8>
bfc0098c:	0250102a 	slt	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:28
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}
bfc00990:	8fbf0064 	lw	ra,100(sp)
bfc00994:	8fb40060 	lw	s4,96(sp)
bfc00998:	8fb3005c 	lw	s3,92(sp)
bfc0099c:	8fb20058 	lw	s2,88(sp)
bfc009a0:	8fb10054 	lw	s1,84(sp)
bfc009a4:	8fb00050 	lw	s0,80(sp)
bfc009a8:	00001025 	move	v0,zero
bfc009ac:	03e00008 	jr	ra
bfc009b0:	27bd0068 	addiu	sp,sp,104
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:12
	else value=v;
bfc009b4:	1000ffed 	b	bfc0096c <printbase+0x3c>
bfc009b8:	00808025 	move	s0,a0
bfc009bc:	0214001b 	divu	zero,s0,s4
bfc009c0:	028001f4 	teq	s4,zero,0x7
bfc009c4:	24420001 	addiu	v0,v0,1
bfc009c8:	00002010 	mfhi	a0
bfc009cc:	00008012 	mflo	s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:16 (discriminator 3)
	buf[i]=value%base;
bfc009d0:	1000ffe8 	b	bfc00974 <printbase+0x44>
bfc009d4:	a044ffff 	sb	a0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24
		c=j>i?0:buf[j-1];
bfc009d8:	14400006 	bnez	v0,bfc009f4 <printbase+0xc4>
bfc009dc:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24 (discriminator 1)
bfc009e0:	02301021 	addu	v0,s1,s0
bfc009e4:	8042ffff 	lb	v0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 1)
		putchar((c<=9)?c+'0':c-0xa+'a');
bfc009e8:	2843000a 	slti	v1,v0,10
bfc009ec:	10600002 	beqz	v1,bfc009f8 <printbase+0xc8>
bfc009f0:	24440057 	addiu	a0,v0,87
bfc009f4:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 4)
bfc009f8:	0ff002af 	jal	bfc00abc <putchar>
bfc009fc:	2610ffff 	addiu	s0,s0,-1
bfc00a00:	1000ffe1 	b	bfc00988 <printbase+0x58>
bfc00a04:	00000000 	nop

bfc00a08 <memset>:
memset():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:273
 * @n:      number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
bfc00a08:	00801025 	move	v0,a0
bfc00a0c:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:277
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memset(s, c, n);
#else
    char *p = s;
bfc00a10:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:278
    while (n -- > 0) {
bfc00a14:	14660003 	bne	v1,a2,bfc00a24 <memset+0x1c>
bfc00a18:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:283
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
bfc00a1c:	03e00008 	jr	ra
bfc00a20:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:279
        *p ++ = c;
bfc00a24:	1000fffb 	b	bfc00a14 <memset+0xc>
bfc00a28:	a065ffff 	sb	a1,-1(v1)

bfc00a2c <putstring>:
putstring():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:2
int putstring(const char *s)
{
bfc00a2c:	27bdffe0 	addiu	sp,sp,-32
bfc00a30:	afb20018 	sw	s2,24(sp)
bfc00a34:	afb10014 	sw	s1,20(sp)
bfc00a38:	afbf001c 	sw	ra,28(sp)
bfc00a3c:	afb00010 	sw	s0,16(sp)
bfc00a40:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
    char c;
    while ((c = *s))
    {
        if (c == '\n')
bfc00a44:	2412000a 	li	s2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:4
    while ((c = *s))
bfc00a48:	82300000 	lb	s0,0(s1)
bfc00a4c:	16000007 	bnez	s0,bfc00a6c <putstring+0x40>
bfc00a50:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:12
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
bfc00a54:	8fb20018 	lw	s2,24(sp)
bfc00a58:	8fb10014 	lw	s1,20(sp)
bfc00a5c:	8fb00010 	lw	s0,16(sp)
bfc00a60:	00001025 	move	v0,zero
bfc00a64:	03e00008 	jr	ra
bfc00a68:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
        if (c == '\n')
bfc00a6c:	16120003 	bne	s0,s2,bfc00a7c <putstring+0x50>
bfc00a70:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:7
            putchar('\r');
bfc00a74:	0ff002af 	jal	bfc00abc <putchar>
bfc00a78:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:8
        putchar(c);
bfc00a7c:	0ff002af 	jal	bfc00abc <putchar>
bfc00a80:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:9
        s++;
bfc00a84:	1000fff0 	b	bfc00a48 <putstring+0x1c>
bfc00a88:	26310001 	addiu	s1,s1,1

bfc00a8c <puts>:
puts():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:15

int puts(const char *s)
{
bfc00a8c:	27bdffe8 	addiu	sp,sp,-24
bfc00a90:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:16
    putstring(s);
bfc00a94:	0ff0028b 	jal	bfc00a2c <putstring>
bfc00a98:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:17
    putchar('\r');
bfc00a9c:	0ff002af 	jal	bfc00abc <putchar>
bfc00aa0:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:18
    putchar('\n');
bfc00aa4:	0ff002af 	jal	bfc00abc <putchar>
bfc00aa8:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:20
    return 0;
}
bfc00aac:	8fbf0014 	lw	ra,20(sp)
bfc00ab0:	00001025 	move	v0,zero
bfc00ab4:	03e00008 	jr	ra
bfc00ab8:	27bd0018 	addiu	sp,sp,24

bfc00abc <putchar>:
putchar():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:4
#include <machine.h>

int putchar(int c)
{
bfc00abc:	27bdffe8 	addiu	sp,sp,-24
bfc00ac0:	afb00010 	sw	s0,16(sp)
bfc00ac4:	00808025 	move	s0,a0
bfc00ac8:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:5
	write_serial((byte_t) c);
bfc00acc:	0ff002c8 	jal	bfc00b20 <write_serial>
bfc00ad0:	308400ff 	andi	a0,a0,0xff
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:7
	return c;
bfc00ad4:	8fbf0014 	lw	ra,20(sp)
bfc00ad8:	02001025 	move	v0,s0
bfc00adc:	8fb00010 	lw	s0,16(sp)
bfc00ae0:	03e00008 	jr	ra
bfc00ae4:	27bd0018 	addiu	sp,sp,24

bfc00ae8 <init_serial>:
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
}

template<typename T>
void write(void *addr, T data){
    auto *ptr = reinterpret_cast<volatile T *>(addr);
    *ptr = data;
bfc00ae8:	3c02bfd0 	lui	v0,0xbfd0
bfc00aec:	2403ff81 	li	v1,-127
bfc00af0:	a0433008 	sb	v1,12296(v0)
bfc00af4:	2403ff80 	li	v1,-128
bfc00af8:	a043300c 	sb	v1,12300(v0)
bfc00afc:	24030036 	li	v1,54
bfc00b00:	a0433000 	sb	v1,12288(v0)
bfc00b04:	24030003 	li	v1,3
bfc00b08:	a0403004 	sb	zero,12292(v0)
bfc00b0c:	a043300c 	sb	v1,12300(v0)
bfc00b10:	a0403010 	sb	zero,12304(v0)
bfc00b14:	a0403004 	sb	zero,12292(v0)
init_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:45
	write_byte(UART_LCR_ADDR, ~0x80 & 0x03);
	// disable modem controls
	write_byte(UART_MCR_ADDR, 0);
	// disable interrupts
	write_byte(UART_IER_ADDR, 0);
}
bfc00b18:	03e00008 	jr	ra
bfc00b1c:	00000000 	nop

bfc00b20 <write_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
bfc00b20:	3c03bfd0 	lui	v1,0xbfd0
bfc00b24:	90623014 	lbu	v0,12308(v1)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:53
	while (!(read_byte(UART_LSR_ADDR) & 0x01));
	return read_byte(UART_DAT_ADDR);
}

void write_serial(byte_t data){
	while (!(read_byte(UART_LSR_ADDR) & 0x40));
bfc00b28:	30420040 	andi	v0,v0,0x40
bfc00b2c:	1040fffd 	beqz	v0,bfc00b24 <write_serial+0x4>
bfc00b30:	3c02bfd0 	lui	v0,0xbfd0
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc00b34:	a0443000 	sb	a0,12288(v0)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:55
	write_byte(UART_DAT_ADDR, data);
}
bfc00b38:	03e00008 	jr	ra
bfc00b3c:	00000000 	nop

bfc00b40 <write_led>:
_Z5writeItEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc00b40:	3c02bff0 	lui	v0,0xbff0
bfc00b44:	3442f000 	ori	v0,v0,0xf000
bfc00b48:	a4440000 	sh	a0,0(v0)
write_led():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:68
	return word;
}

void write_led(hword_t data){
	write_hword(LED_ADDR, data);
}
bfc00b4c:	03e00008 	jr	ra
bfc00b50:	00000000 	nop

bfc00b54 <write_segment>:
_Z5writeIjEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc00b54:	3c02bff0 	lui	v0,0xbff0
bfc00b58:	3442f010 	ori	v0,v0,0xf010
bfc00b5c:	ac440000 	sw	a0,0(v0)
write_segment():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:72

void write_segment(word_t data){
	write_word(NUM_ADDR, data);
}
bfc00b60:	03e00008 	jr	ra
bfc00b64:	00000000 	nop
bfc00b68:	20736168 	addi	s3,v1,24936
bfc00b6c:	6b636170 	0x6b636170
bfc00b70:	00007465 	0x7465
bfc00b74:	2a2a2a2a 	slti	t2,s1,10794
bfc00b78:	6972542a 	0x6972542a
bfc00b7c:	6c616976 	0x6c616976
bfc00b80:	5350494d 	beql	k0,s0,bfc130b8 <_text_end+0x12060>
bfc00b84:	72614220 	0x72614220
bfc00b88:	654d2065 	0x654d2065
bfc00b8c:	206c6174 	addi	t4,v1,24948
bfc00b90:	74737953 	jalx	b1cde54c <_mem_end+0x29cce54c>
bfc00b94:	2a2a6d65 	slti	t2,s1,28005
bfc00b98:	002a2a2a 	0x2a2a2a
bfc00b9c:	706d6f43 	0x706d6f43
bfc00ba0:	74616c69 	jalx	b185b1a4 <_mem_end+0x2984b1a4>
bfc00ba4:	206e6f69 	addi	t6,v1,28521
bfc00ba8:	656d6974 	0x656d6974
bfc00bac:	3931203a 	xori	s1,t1,0x203a
bfc00bb0:	3a30323a 	xori	s0,s1,0x323a
bfc00bb4:	44203233 	0x44203233
bfc00bb8:	31206365 	andi	zero,t1,0x6365
bfc00bbc:	30322035 	andi	s2,at,0x2035
bfc00bc0:	00003931 	tgeu	zero,zero,0xe4
bfc00bc4:	6c6c6946 	0x6c6c6946
bfc00bc8:	20676e69 	addi	a3,v1,28265
bfc00bcc:	7373622e 	0x7373622e
bfc00bd0:	63657320 	0x63657320
bfc00bd4:	6e6f6974 	0x6e6f6974
bfc00bd8:	74697720 	jalx	b1a5dc80 <_mem_end+0x29a4dc80>
bfc00bdc:	2c302068 	sltiu	s0,at,8296
bfc00be0:	66666f20 	0x66666f20
bfc00be4:	3a746573 	xori	s4,s3,0x6573
bfc00be8:	25783020 	addiu	t8,t3,12320
bfc00bec:	73202c78 	0x73202c78
bfc00bf0:	3a657a69 	xori	a1,s3,0x7a69
bfc00bf4:	20642520 	addi	a0,v1,9504
bfc00bf8:	65747962 	0x65747962
bfc00bfc:	000a2e73 	tltu	zero,t2,0xb9
bfc00c00:	676f7250 	0x676f7250
bfc00c04:	206d6172 	addi	t5,v1,24946
bfc00c08:	74697865 	jalx	b1a5e194 <_mem_end+0x29a4e194>
bfc00c0c:	6e206465 	0x6e206465
bfc00c10:	616d726f 	0x616d726f
bfc00c14:	2e796c6c 	sltiu	t9,s3,27756
bfc00c18:	00000000 	nop
bfc00c1c:	676f7250 	0x676f7250
bfc00c20:	206d6172 	addi	t5,v1,24946
bfc00c24:	74697865 	jalx	b1a5e194 <_mem_end+0x29a4e194>
bfc00c28:	61206465 	0x61206465
bfc00c2c:	726f6e62 	0x726f6e62
bfc00c30:	6c6c616d 	0x6c6c616d
bfc00c34:	69772079 	0x69772079
bfc00c38:	63206874 	0x63206874
bfc00c3c:	2065646f 	addi	a1,v1,25711
bfc00c40:	0a2e6425 	j	b8b99094 <_mem_end+0x30b89094>
bfc00c44:	00000000 	nop
bfc00c48:	69676552 	0x69676552
bfc00c4c:	72657473 	0x72657473
bfc00c50:	64252420 	0x64252420
bfc00c54:	7025203a 	0x7025203a
bfc00c58:	0000000a 	movz	zero,zero,zero
bfc00c5c:	3a435045 	xori	v1,s2,0x5045
bfc00c60:	2c702520 	sltiu	s0,v1,9504
bfc00c64:	75614320 	jalx	b5850c80 <_mem_end+0x2d840c80>
bfc00c68:	203a6573 	addi	k0,at,25971
bfc00c6c:	202c7025 	addi	t4,at,28709
bfc00c70:	74617453 	jalx	b185d14c <_mem_end+0x2984d14c>
bfc00c74:	203a7375 	addi	k0,at,29557
bfc00c78:	202c7025 	addi	t4,at,28709
bfc00c7c:	56646142 	bnel	s3,a0,bfc19188 <_text_end+0x18130>
bfc00c80:	72646441 	0x72646441
bfc00c84:	7025203a 	0x7025203a
bfc00c88:	4245202c 	c0	0x45202c
bfc00c8c:	3a657361 	xori	a1,s3,0x7361
bfc00c90:	0a702520 	j	b9c09480 <_mem_end+0x31bf9480>
bfc00c94:	00000000 	nop
bfc00c98:	20424c54 	addi	v0,v0,19540
bfc00c9c:	6d657469 	0x6d657469
bfc00ca0:	3a642520 	xori	a0,s3,0x2520
bfc00ca4:	746e4520 	jalx	b1b91480 <_mem_end+0x29b81480>
bfc00ca8:	69487972 	0x69487972
bfc00cac:	2c702520 	sltiu	s0,v1,9504
bfc00cb0:	746e4520 	jalx	b1b91480 <_mem_end+0x29b81480>
bfc00cb4:	6f4c7972 	0x6f4c7972
bfc00cb8:	25203a31 	addiu	zero,t1,14897
bfc00cbc:	45202c70 	0x45202c70
bfc00cc0:	7972746e 	0x7972746e
bfc00cc4:	3a326f4c 	xori	s2,s1,0x6f4c
bfc00cc8:	0a702520 	j	b9c09480 <_mem_end+0x31bf9480>
bfc00ccc:	00000000 	nop
bfc00cd0:	20555043 	addi	s5,v0,20547
bfc00cd4:	65746e69 	0x65746e69
bfc00cd8:	6c616e72 	0x6c616e72
bfc00cdc:	73736120 	0x73736120
bfc00ce0:	69747265 	0x69747265
bfc00ce4:	66206e6f 	0x66206e6f
bfc00ce8:	656c6961 	0x656c6961
bfc00cec:	61202c64 	0x61202c64
bfc00cf0:	74726f62 	jalx	b1c9bd88 <_mem_end+0x29c8bd88>
bfc00cf4:	0000002e 	0x2e
bfc00cf8:	65206e41 	0x65206e41
bfc00cfc:	70656378 	0x70656378
bfc00d00:	6e6f6974 	0x6e6f6974
bfc00d04:	63636f20 	0x63636f20
bfc00d08:	65727275 	0x65727275
bfc00d0c:	77202c64 	jalx	bc80b190 <_mem_end+0x347fb190>
bfc00d10:	20687469 	addi	t0,v1,29801
bfc00d14:	20435045 	addi	v1,v0,20549
bfc00d18:	78257830 	0x78257830
bfc00d1c:	646e6120 	0x646e6120
bfc00d20:	75614320 	jalx	b5850c80 <_mem_end+0x2d840c80>
bfc00d24:	25206573 	addiu	zero,t1,25971
bfc00d28:	25282064 	addiu	t0,t1,8292
bfc00d2c:	0a2e2973 	j	b8b8a5cc <_mem_end+0x30b7a5cc>
bfc00d30:	00000000 	nop
bfc00d34:	2a2a2a2a 	slti	t2,s1,10794
bfc00d38:	7379532a 	0x7379532a
bfc00d3c:	206d6574 	addi	t5,v1,25972
bfc00d40:	474e4148 	c1	0x14e4148
bfc00d44:	2a2a2a2a 	slti	t2,s1,10794
bfc00d48:	0000002a 	slt	zero,zero,zero
bfc00d4c:	65746e49 	0x65746e49
bfc00d50:	70757272 	0x70757272
bfc00d54:	00000074 	teq	zero,zero,0x1
bfc00d58:	20424c54 	addi	v0,v0,19540
bfc00d5c:	69646f6d 	0x69646f6d
bfc00d60:	61636966 	0x61636966
bfc00d64:	6e6f6974 	0x6e6f6974
bfc00d68:	63786520 	0x63786520
bfc00d6c:	69747065 	0x69747065
bfc00d70:	00006e6f 	0x6e6f
bfc00d74:	20424c54 	addi	v0,v0,19540
bfc00d78:	65637865 	0x65637865
bfc00d7c:	6f697470 	0x6f697470
bfc00d80:	6c28206e 	0x6c28206e
bfc00d84:	2064616f 	addi	a0,v1,24943
bfc00d88:	6920726f 	0x6920726f
bfc00d8c:	7274736e 	0x7274736e
bfc00d90:	69746375 	0x69746375
bfc00d94:	66206e6f 	0x66206e6f
bfc00d98:	68637465 	0x68637465
bfc00d9c:	00000029 	0x29
bfc00da0:	20424c54 	addi	v0,v0,19540
bfc00da4:	65637865 	0x65637865
bfc00da8:	6f697470 	0x6f697470
bfc00dac:	7328206e 	0x7328206e
bfc00db0:	65726f74 	0x65726f74
bfc00db4:	00000029 	0x29
bfc00db8:	72646441 	0x72646441
bfc00dbc:	20737365 	addi	s3,v1,29541
bfc00dc0:	6f727265 	0x6f727265
bfc00dc4:	78652072 	0x78652072
bfc00dc8:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00dcc:	206e6f69 	addi	t6,v1,28521
bfc00dd0:	616f6c28 	0x616f6c28
bfc00dd4:	726f2064 	0x726f2064
bfc00dd8:	736e6920 	0x736e6920
bfc00ddc:	63757274 	0x63757274
bfc00de0:	6e6f6974 	0x6e6f6974
bfc00de4:	74656620 	jalx	b1959880 <_mem_end+0x29949880>
bfc00de8:	00296863 	0x296863
bfc00dec:	72646441 	0x72646441
bfc00df0:	20737365 	addi	s3,v1,29541
bfc00df4:	6f727265 	0x6f727265
bfc00df8:	78652072 	0x78652072
bfc00dfc:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00e00:	206e6f69 	addi	t6,v1,28521
bfc00e04:	6f747328 	0x6f747328
bfc00e08:	00296572 	tlt	at,t1,0x195
bfc00e0c:	20737542 	addi	s3,v1,30018
bfc00e10:	6f727265 	0x6f727265
bfc00e14:	78652072 	0x78652072
bfc00e18:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00e1c:	206e6f69 	addi	t6,v1,28521
bfc00e20:	736e6928 	0x736e6928
bfc00e24:	63757274 	0x63757274
bfc00e28:	6e6f6974 	0x6e6f6974
bfc00e2c:	74656620 	jalx	b1959880 <_mem_end+0x29949880>
bfc00e30:	00296863 	0x296863
bfc00e34:	20737542 	addi	s3,v1,30018
bfc00e38:	6f727265 	0x6f727265
bfc00e3c:	78652072 	0x78652072
bfc00e40:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00e44:	206e6f69 	addi	t6,v1,28521
bfc00e48:	74616428 	jalx	b18590a0 <_mem_end+0x298490a0>
bfc00e4c:	65722061 	0x65722061
bfc00e50:	65726566 	0x65726566
bfc00e54:	3a65636e 	xori	a1,s3,0x636e
bfc00e58:	616f6c20 	0x616f6c20
bfc00e5c:	726f2064 	0x726f2064
bfc00e60:	6f747320 	0x6f747320
bfc00e64:	00296572 	tlt	at,t1,0x195
bfc00e68:	63737953 	0x63737953
bfc00e6c:	206c6c61 	addi	t4,v1,27745
bfc00e70:	65637865 	0x65637865
bfc00e74:	6f697470 	0x6f697470
bfc00e78:	0000006e 	0x6e
bfc00e7c:	61657242 	0x61657242
bfc00e80:	696f706b 	0x696f706b
bfc00e84:	6520746e 	0x6520746e
bfc00e88:	70656378 	0x70656378
bfc00e8c:	6e6f6974 	0x6e6f6974
bfc00e90:	00000000 	nop
bfc00e94:	65736552 	0x65736552
bfc00e98:	64657672 	0x64657672
bfc00e9c:	736e6920 	0x736e6920
bfc00ea0:	63757274 	0x63757274
bfc00ea4:	6e6f6974 	0x6e6f6974
bfc00ea8:	63786520 	0x63786520
bfc00eac:	69747065 	0x69747065
bfc00eb0:	00006e6f 	0x6e6f
bfc00eb4:	72706f43 	0x72706f43
bfc00eb8:	7365636f 	0x7365636f
bfc00ebc:	20726f73 	addi	s2,v1,28531
bfc00ec0:	73756e55 	0x73756e55
bfc00ec4:	656c6261 	0x656c6261
bfc00ec8:	63786520 	0x63786520
bfc00ecc:	69747065 	0x69747065
bfc00ed0:	00006e6f 	0x6e6f
bfc00ed4:	74697241 	jalx	b1a5c904 <_mem_end+0x29a4c904>
bfc00ed8:	74656d68 	jalx	b195b5a0 <_mem_end+0x2994b5a0>
bfc00edc:	4f206369 	c3	0x1206369
bfc00ee0:	66726576 	0x66726576
bfc00ee4:	20776f6c 	addi	s7,v1,28524
bfc00ee8:	65637865 	0x65637865
bfc00eec:	6f697470 	0x6f697470
bfc00ef0:	0000006e 	0x6e
bfc00ef4:	70617254 	0x70617254
bfc00ef8:	63786520 	0x63786520
bfc00efc:	69747065 	0x69747065
bfc00f00:	00006e6f 	0x6e6f
bfc00f04:	2041534d 	addi	at,v0,21325
bfc00f08:	616f6c46 	0x616f6c46
bfc00f0c:	676e6974 	0x676e6974
bfc00f10:	696f502d 	0x696f502d
bfc00f14:	6520746e 	0x6520746e
bfc00f18:	70656378 	0x70656378
bfc00f1c:	6e6f6974 	0x6e6f6974
bfc00f20:	00000000 	nop
bfc00f24:	20424c54 	addi	v0,v0,19540
bfc00f28:	64616552 	0x64616552
bfc00f2c:	686e492d 	0x686e492d
bfc00f30:	74696269 	jalx	b1a589a4 <_mem_end+0x29a489a4>
bfc00f34:	63786520 	0x63786520
bfc00f38:	69747065 	0x69747065
bfc00f3c:	00006e6f 	0x6e6f
bfc00f40:	20424c54 	addi	v0,v0,19540
bfc00f44:	63657845 	0x63657845
bfc00f48:	6f697475 	0x6f697475
bfc00f4c:	6e492d6e 	0x6e492d6e
bfc00f50:	69626968 	0x69626968
bfc00f54:	78652074 	0x78652074
bfc00f58:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc00f5c:	006e6f69 	0x6e6f69
bfc00f60:	43544157 	c0	0x1544157
bfc00f64:	00000048 	0x48
bfc00f68:	6863614d 	0x6863614d
bfc00f6c:	20656e69 	addi	a1,v1,28265
bfc00f70:	63656863 	0x63656863
bfc00f74:	0000006b 	0x6b
bfc00f78:	65726854 	0x65726854
bfc00f7c:	41206461 	0x41206461
bfc00f80:	636f6c6c 	0x636f6c6c
bfc00f84:	6f697461 	0x6f697461
bfc00f88:	44202c6e 	0x44202c6e
bfc00f8c:	6c6c6165 	0x6c6c6165
bfc00f90:	7461636f 	jalx	b1858dbc <_mem_end+0x29848dbc>
bfc00f94:	2c6e6f69 	sltiu	t6,v1,28521
bfc00f98:	20726f20 	addi	s2,v1,28448
bfc00f9c:	65686353 	0x65686353
bfc00fa0:	696c7564 	0x696c7564
bfc00fa4:	4520676e 	0x4520676e
bfc00fa8:	70656378 	0x70656378
bfc00fac:	6e6f6974 	0x6e6f6974
bfc00fb0:	00000073 	tltu	zero,zero,0x1
bfc00fb4:	68636143 	0x68636143
bfc00fb8:	72652065 	0x72652065
bfc00fbc:	00726f72 	tlt	v1,s2,0x1bd

bfc00fc0 <EXCEPTION_MESSAGES>:
bfc00fc0:	bfc00d4c 	cache	0x0,3404(s8)
bfc00fc4:	bfc00d58 	cache	0x0,3416(s8)
bfc00fc8:	bfc00d74 	cache	0x0,3444(s8)
bfc00fcc:	bfc00da0 	cache	0x0,3488(s8)
bfc00fd0:	bfc00db8 	cache	0x0,3512(s8)
bfc00fd4:	bfc00dec 	cache	0x0,3564(s8)
bfc00fd8:	bfc00e0c 	cache	0x0,3596(s8)
bfc00fdc:	bfc00e34 	cache	0x0,3636(s8)
bfc00fe0:	bfc00e68 	cache	0x0,3688(s8)
bfc00fe4:	bfc00e7c 	cache	0x0,3708(s8)
bfc00fe8:	bfc00e94 	cache	0x0,3732(s8)
bfc00fec:	bfc00eb4 	cache	0x0,3764(s8)
bfc00ff0:	bfc00ed4 	cache	0x0,3796(s8)
bfc00ff4:	bfc00ef4 	cache	0x0,3828(s8)
bfc00ff8:	bfc00f04 	cache	0x0,3844(s8)
bfc00ffc:	bfc00f08 	cache	0x0,3848(s8)
bfc01000:	bfc00d30 	cache	0x0,3376(s8)
bfc01004:	bfc00d30 	cache	0x0,3376(s8)
bfc01008:	bfc00d30 	cache	0x0,3376(s8)
bfc0100c:	bfc00f24 	cache	0x0,3876(s8)
bfc01010:	bfc00f40 	cache	0x0,3904(s8)
bfc01014:	bfc00d30 	cache	0x0,3376(s8)
bfc01018:	bfc00d30 	cache	0x0,3376(s8)
bfc0101c:	bfc00f60 	cache	0x0,3936(s8)
bfc01020:	bfc00f68 	cache	0x0,3944(s8)
bfc01024:	bfc00f78 	cache	0x0,3960(s8)
bfc01028:	bfc00d30 	cache	0x0,3376(s8)
bfc0102c:	bfc00d30 	cache	0x0,3376(s8)
bfc01030:	bfc00d30 	cache	0x0,3376(s8)
bfc01034:	bfc00d30 	cache	0x0,3376(s8)
bfc01038:	bfc00fb4 	cache	0x0,4020(s8)
bfc0103c:	bfc00d30 	cache	0x0,3376(s8)
bfc01040:	01200000 	0x1200000
bfc01044:	02000101 	0x2000101
	...
bfc01050:	00000001 	movf	zero,zero,$fcc0
bfc01054:	00000000 	nop

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
       0:	000000e6 	0xe6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	00000004 	sllv	zero,zero,zero
       8:	01040000 	0x1040000
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
       c:	000000c2 	srl	zero,zero,0x3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	00006904 	0x6904
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	00000700 	sll	zero,zero,0x1c
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      24:	07040200 	0x7040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	000000a2 	0xa2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	9d070402 	0x9d070402
      30:	02000000 	0x2000000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	00810601 	0x810601
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	02020000 	0x2020000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	0001a105 	0x1a105
      40:	05040300 	0x5040300
      44:	00746e69 	0x746e69
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
#else
    const char *s = src;
    char *d = dst;
    if (s < d && s + n > d) {
        s += n, d += n;
        while (n -- > 0) {
      48:	94050402 	lhu	a1,1026(zero)
      4c:	04000000 	bltz	zero,50 <_mem_avail_start-0x7fffffb0>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	00000077 	0x77
      54:	005f0902 	0x5f0902
      58:	4f050000 	c3	0x1050000
      5c:	02000000 	0x2000000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
        }
    } else {
        while (n -- > 0) {
            *d ++ = *s ++;
      60:	007f0801 	0x7f0801
      64:	02020000 	0x2020000
      68:	0000af07 	0xaf07
      6c:	06010200 	bgez	s0,870 <_mem_avail_start-0x7ffff790>
      70:	00000088 	0x88
      74:	00008d06 	0x8d06
      78:	41050100 	0x41050100
      7c:	50000000 	beqzl	zero,80 <_mem_avail_start-0x7fffff80>
      80:	40bfc004 	0x40bfc004
      84:	01000000 	0x1000000
      88:	0000d89c 	0xd89c
      8c:	005f0700 	0x5f0700
      90:	06010000 	bgez	s0,94 <_mem_avail_start-0x7fffff6c>
      94:	000000d8 	0xd8
      98:	d88083ff 	ldc2	$0,-31745(a0)
      9c:	0063087b 	0x63087b
      a0:	00d80701 	0xd80701
      a4:	83fc0000 	lb	gp,0(ra)
      a8:	087bd880 	j	1ef6200 <_mem_avail_start-0x7e109e00>
      ac:	07010064 	bgez	t8,240 <_mem_avail_start-0x7ffffdc0>
      b0:	000000d8 	0xd8
      b4:	d88083fd 	ldc2	$0,-31747(a0)
      b8:	0065087b 	0x65087b
      bc:	00d80701 	0xd80701
      c0:	83fe0000 	lb	s8,0(ra)
      c4:	097bd880 	j	5ef6200 <_mem_avail_start-0x7a109e00>
      c8:	bfc00488 	cache	0x0,1160(s8)
      cc:	000000de 	0xde
      d0:	0254010a 	0x254010a
      d4:	00000080 	sll	zero,zero,0x2
      d8:	005a040b 	0x5a040b
      dc:	000c0000 	sll	zero,t4,0x0
      e0:	00000000 	nop
      e4:	03000000 	0x3000000
      e8:	0022000c 	syscall	0x8800
      ec:	00020000 	sll	zero,v0,0x0
      f0:	000000a7 	0xa7
      f4:	006a0104 	0x6a0104
      f8:	00000000 	nop
      fc:	0450bfc0 	bltzal	v0,ffff0000 <_text_end+0x403eefa8>
     100:	01abbfc0 	0x1abbfc0
     104:	01bd0000 	0x1bd0000
     108:	01f80000 	0x1f80000
     10c:	80010000 	lb	at,0(zero)
     110:	0000056c 	0x56c
     114:	00bb0004 	sllv	zero,k1,a1
     118:	01040000 	0x1040000
     11c:	000002e3 	0x2e3
     120:	0003f60c 	syscall	0xfd8
     124:	00000700 	sll	zero,zero,0x1c
     128:	00006000 	sll	t4,zero,0x0
     12c:	00000000 	nop
     130:	00010100 	sll	zero,at,0x4
     134:	07040200 	0x7040200
     138:	000000a2 	0xa2
     13c:	9d070402 	0x9d070402
     140:	03000000 	0x3000000
     144:	000003df 	0x3df
     148:	00250f02 	ror	at,a1,0x1c
     14c:	01020000 	0x1020000
     150:	00008806 	srlv	s1,zero,zero
     154:	003e0400 	0x3e0400
     158:	01020000 	0x1020000
     15c:	00008106 	0x8106
     160:	05020200 	bltzl	t0,964 <_mem_avail_start-0x7ffff69c>
     164:	000001a1 	0x1a1
     168:	69050405 	0x69050405
     16c:	0200746e 	0x200746e
     170:	00940504 	0x940504
     174:	77030000 	jalx	c0c0000 <_mem_avail_start-0x73f40000>
     178:	03000000 	0x3000000
     17c:	00007109 	0x7109
     180:	08010200 	j	40800 <_mem_avail_start-0x7ffbf800>
     184:	0000007f 	0x7f
     188:	0003d603 	sra	k0,v1,0x18
     18c:	830a0300 	lb	t2,768(t8)
     190:	02000000 	0x2000000
     194:	00af0702 	0xaf0702
     198:	66030000 	0x66030000
     19c:	04000002 	bltz	zero,1a8 <_mem_avail_start-0x7ffffe58>
     1a0:	0000660b 	0x660b
     1a4:	06160300 	0x6160300
     1a8:	0d040000 	jal	4100000 <_mem_avail_start-0x7bf00000>
     1ac:	00000033 	tltu	zero,zero
     1b0:	0000b006 	srlv	s6,zero,zero
     1b4:	0000b000 	sll	s6,zero,0x0
     1b8:	00250700 	0x250700
     1bc:	001f0000 	sll	zero,ra,0x0
     1c0:	00450408 	0x450408
     1c4:	11090000 	beq	t0,t1,1c8 <_mem_avail_start-0x7ffffe38>
     1c8:	05000002 	bltz	t0,1d4 <_mem_avail_start-0x7ffffe2c>
     1cc:	0000a007 	srav	s4,zero,zero
     1d0:	c0030500 	ll	v1,1280(zero)
     1d4:	0abfc00f 	j	aff003c <_mem_avail_start-0x7500ffc4>
     1d8:	242a05a4 	addiu	t2,at,1444
     1dc:	0b000001 	j	c000004 <_mem_avail_start-0x73fffffc>
     1e0:	000002d0 	0x2d0
     1e4:	01242b05 	0x1242b05
     1e8:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     1ec:	0000023e 	0x23e
     1f0:	00332c05 	0x332c05
     1f4:	0b100000 	j	c400000 <_mem_avail_start-0x73c00000>
     1f8:	00000224 	0x224
     1fc:	00332d05 	0x332d05
     200:	0b140000 	j	c500000 <_mem_avail_start-0x73b00000>
     204:	000002a2 	0x2a2
     208:	00332e05 	0x332e05
     20c:	0b180000 	j	c600000 <_mem_avail_start-0x73a00000>
     210:	00000204 	0x204
     214:	00332f05 	0x332f05
     218:	0b1c0000 	j	c700000 <_mem_avail_start-0x73900000>
     21c:	000003cc 	syscall	0xf
     220:	00333005 	0x333005
     224:	0c200000 	jal	800000 <_mem_avail_start-0x7f800000>
     228:	00727067 	0x727067
     22c:	01343105 	0x1343105
     230:	00240000 	0x240000
     234:	00003306 	0x3306
     238:	00013400 	sll	a2,at,0x10
     23c:	00250700 	0x250700
     240:	00030000 	sll	zero,v1,0x0
     244:	00003306 	0x3306
     248:	00014400 	sll	t0,at,0x10
     24c:	00250700 	0x250700
     250:	001f0000 	sll	zero,ra,0x0
     254:	00041603 	sra	v0,a0,0x18
     258:	c7320500 	lwc1	$f18,1280(t9)
     25c:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
     260:	00000257 	0x257
     264:	008a0601 	0x8a0601
     268:	820d0000 	lb	t5,0(s0)
     26c:	01000002 	0x1000002
     270:	00008a06 	0x8a06
     274:	02bd0e00 	0x2bd0e00
     278:	55010000 	bnel	t0,at,27c <_mem_avail_start-0x7ffffd84>
     27c:	bfc00658 	cache	0x0,1624(s8)
     280:	000000b4 	teq	zero,zero,0x2
     284:	02a99c01 	0x2a99c01
     288:	740f0000 	jalx	3c0000 <_mem_avail_start-0x7fc40000>
     28c:	55010066 	bnel	t0,at,428 <_mem_avail_start-0x7ffffbd8>
     290:	000002a9 	0x2a9
     294:	00000000 	nop
     298:	00040c10 	0x40c10
     29c:	af550100 	sw	s5,256(k0)
     2a0:	37000002 	ori	zero,t8,0x2
     2a4:	11000000 	beqz	t0,2a8 <_mem_avail_start-0x7ffffd58>
     2a8:	bfc006c8 	cache	0x0,1736(s8)
     2ac:	00000044 	0x44
     2b0:	00000232 	tlt	zero,zero,0x8
     2b4:	0002ad12 	0x2ad12
     2b8:	955b0100 	lhu	k1,256(t2)
     2bc:	58000000 	blezl	zero,2c0 <_mem_avail_start-0x7ffffd40>
     2c0:	13000000 	beqz	t8,2c4 <_mem_avail_start-0x7ffffd3c>
     2c4:	00637065 	0x637065
     2c8:	00585c01 	0x585c01
     2cc:	8c140000 	lw	s4,0(zero)
     2d0:	c8000003 	lwc2	$0,3(zero)
     2d4:	04bfc006 	0x4bfc006
     2d8:	01000000 	0x1000000
     2dc:	0001e15b 	0x1e15b
     2e0:	06c81500 	tgei	s6,5376
     2e4:	0004bfc0 	sll	s7,a0,0x1f
     2e8:	1a160000 	0x1a160000
     2ec:	00000005 	0x5
     2f0:	03a61400 	0x3a61400
     2f4:	06ec0000 	teqi	s7,0
     2f8:	0004bfc0 	sll	s7,a0,0x1f
     2fc:	5c010000 	0x5c010000
     300:	00000204 	0x204
     304:	c006ec15 	ll	a2,-5099(zero)
     308:	000004bf 	0x4bf
     30c:	04ff1600 	0x4ff1600
     310:	00000000 	nop
     314:	c006fc17 	ll	a2,-1001(zero)
     318:	000522bf 	0x522bf
     31c:	00022100 	sll	a0,v0,0x4
     320:	54011800 	bnel	zero,at,6324 <_mem_avail_start-0x7fff9cdc>
     324:	0cf80305 	jal	3e00c14 <_mem_avail_start-0x7c1ff3ec>
     328:	0118bfc0 	0x118bfc0
     32c:	00800255 	0x800255
     330:	07041900 	0x7041900
     334:	052dbfc0 	0x52dbfc0
     338:	01180000 	0x1180000
     33c:	00800254 	0x800254
     340:	7c170000 	0x7c170000
     344:	38bfc006 	xori	ra,a1,0xc006
     348:	49000005 	bc2f	360 <_mem_avail_start-0x7ffffca0>
     34c:	18000002 	blez	zero,358 <_mem_avail_start-0x7ffffca8>
     350:	03055401 	0x3055401
     354:	bfc00b74 	cache	0x0,2932(s8)
     358:	06901700 	bltzal	s4,5f5c <_mem_avail_start-0x7fffa0a4>
     35c:	0538bfc0 	0x538bfc0
     360:	02600000 	0x2600000
     364:	01180000 	0x1180000
     368:	d0030554 	0xd0030554
     36c:	00bfc00c 	syscall	0x2ff00
     370:	c0069c17 	ll	a2,-25577(zero)
     374:	000543bf 	0x543bf
     378:	00027800 	sll	t7,v0,0x0
     37c:	54011800 	bnel	zero,at,6380 <_mem_avail_start-0x7fff9c80>
     380:	bdad1106 	cache	0xd,4358(t5)
     384:	007df5b7 	0x7df5b7
     388:	c006a417 	ll	a2,-23529(zero)
     38c:	000328bf 	0x328bf
     390:	00028c00 	sll	s1,v0,0x10
     394:	54011800 	bnel	zero,at,6398 <_mem_avail_start-0x7fff9c68>
     398:	00008102 	srl	s0,zero,0x4
     39c:	c006ac1a 	ll	a2,-21478(zero)
     3a0:	0002b6bf 	0x2b6bf
     3a4:	06c81b00 	tgei	s6,6912
     3a8:	0538bfc0 	0x538bfc0
     3ac:	01180000 	0x1180000
     3b0:	34030554 	li	v1,0x554
     3b4:	00bfc00d 	break	0xbf,0x300
     3b8:	44040800 	mfc1	a0,$f1
     3bc:	02000001 	movf	zero,s0,$fcc0
     3c0:	02380201 	0x2380201
     3c4:	2e1c0000 	sltiu	gp,s0,0
     3c8:	01000002 	0x1000002
     3cc:	c005f045 	ll	a1,-4027(zero)
     3d0:	000068bf 	0x68bf
     3d4:	289c0100 	slti	gp,a0,256
     3d8:	1d000003 	bgtz	t0,3e8 <_mem_avail_start-0x7ffffc18>
     3dc:	00000028 	0x28
     3e0:	0100691e 	0x100691e
     3e4:	00006646 	0x6646
     3e8:	00006b00 	sll	t5,zero,0xc
     3ec:	00401d00 	0x401d00
     3f0:	e8120000 	swc2	$18,0(zero)
     3f4:	01000003 	0x1000003
     3f8:	00003347 	0x3347
     3fc:	00008a00 	sll	s1,zero,0x8
     400:	02b21200 	0x2b21200
     404:	47010000 	c1	0x1010000
     408:	00000033 	tltu	zero,zero
     40c:	0000009d 	0x9d
     410:	0002d812 	0x2d812
     414:	33470100 	andi	a3,k0,0x100
     418:	b0000000 	0xb0000000
     41c:	19000000 	blez	t0,420 <_mem_avail_start-0x7ffffbe0>
     420:	bfc0063c 	cache	0x0,1596(s8)
     424:	00000522 	0x522
     428:	02540118 	0x2540118
     42c:	01180081 	0x1180081
     430:	7f800255 	0x7f800255
     434:	00000000 	nop
     438:	0002920e 	0x2920e
     43c:	583e0100 	0x583e0100
     440:	98bfc005 	lwr	ra,-16379(a1)
     444:	01000000 	0x1000000
     448:	00038c9c 	0x38c9c
     44c:	66740f00 	0x66740f00
     450:	a93e0100 	swl	s8,256(t1)
     454:	c3000002 	ll	zero,2(t8)
     458:	1f000000 	bgtz	t8,45c <_mem_avail_start-0x7ffffba4>
     45c:	00000010 	mfhi	zero
     460:	00000378 	0x378
     464:	0100691e 	0x100691e
     468:	0000583f 	0x583f
     46c:	0000ef00 	sll	sp,zero,0x1c
     470:	05a01900 	bltz	t5,6874 <_mem_avail_start-0x7fff978c>
     474:	0522bfc0 	bltzl	t1,ffff0378 <_text_end+0x403ef320>
     478:	01180000 	0x1180000
     47c:	00830254 	0x830254
     480:	02550118 	0x2550118
     484:	00007f81 	0x7f81
     488:	c005d019 	ll	a1,-12263(zero)
     48c:	000522bf 	0x522bf
     490:	54011800 	bnel	zero,at,6494 <_mem_avail_start-0x7fff9b6c>
     494:	0c5c0305 	jal	1700c14 <_mem_avail_start-0x7e8ff3ec>
     498:	0000bfc0 	sll	s7,zero,0x1f
     49c:	00024c20 	0x24c20
     4a0:	95350100 	lhu	s5,256(t1)
     4a4:	01000000 	0x1000000
     4a8:	000003a6 	0x3a6
     4ac:	01006e13 	0x1006e13
     4b0:	00009536 	tne	zero,zero,0x254
     4b4:	6d200000 	0x6d200000
     4b8:	01000002 	0x1000002
     4bc:	0000952c 	0x952c
     4c0:	03c00100 	0x3c00100
     4c4:	6e130000 	0x6e130000
     4c8:	952d0100 	lhu	t5,256(t1)
     4cc:	00000000 	nop
     4d0:	0002461c 	0x2461c
     4d4:	900b0100 	lbu	t3,256(zero)
     4d8:	c8bfc004 	lwc2	$31,-16380(a1)
     4dc:	01000000 	0x1000000
     4e0:	0004ec9c 	0x4ec9c
     4e4:	03b51200 	0x3b51200
     4e8:	18010000 	0x18010000
     4ec:	00000058 	0x58
     4f0:	00000131 	tgeu	zero,zero,0x4
     4f4:	00040512 	0x40512
     4f8:	58210100 	0x58210100
     4fc:	4f000000 	c3	0x1000000
     500:	1a000001 	blez	s0,508 <_mem_avail_start-0x7ffffaf8>
     504:	bfc004a4 	cache	0x0,1188(s8)
     508:	0000054e 	0x54e
     50c:	c004ac17 	ll	a0,-21481(zero)
     510:	000543bf 	0x543bf
     514:	00040f00 	sll	at,a0,0x1c
     518:	54011800 	bnel	zero,at,651c <_mem_avail_start-0x7fff9ae4>
     51c:	17003401 	bnez	t8,d524 <_mem_avail_start-0x7fff2adc>
     520:	bfc004b8 	cache	0x0,1208(s8)
     524:	00000538 	0x538
     528:	00000426 	0x426
     52c:	05540118 	0x5540118
     530:	c00b7403 	ll	t3,29699(zero)
     534:	d41700bf 	ldc1	$f23,191(zero)
     538:	38bfc004 	xori	ra,a1,0xc004
     53c:	3d000005 	0x3d000005
     540:	18000004 	blez	zero,554 <_mem_avail_start-0x7ffffaac>
     544:	03055401 	0x3055401
     548:	bfc00b9c 	cache	0x0,2972(s8)
     54c:	04e01700 	bltz	a3,6150 <_mem_avail_start-0x7fff9eb0>
     550:	0543bfc0 	bgezl	t2,ffff0454 <_text_end+0x403ef3fc>
     554:	04500000 	bltzal	v0,558 <_mem_avail_start-0x7ffffaa8>
     558:	01180000 	0x1180000
     55c:	00350154 	0x350154
     560:	c004f817 	ll	a0,-2025(zero)
     564:	000522bf 	0x522bf
     568:	00047300 	sll	t6,a0,0xc
     56c:	54011800 	bnel	zero,at,6570 <_mem_avail_start-0x7fff9a90>
     570:	0bc40305 	j	f100c14 <_mem_avail_start-0x70eff3ec>
     574:	0118bfc0 	0x118bfc0
     578:	00810255 	0x810255
     57c:	02560118 	0x2560118
     580:	17000080 	bnez	t8,784 <_mem_avail_start-0x7ffff87c>
     584:	bfc00508 	cache	0x0,1288(s8)
     588:	00000559 	0x559
     58c:	00000492 	0x492
     590:	02540118 	0x2540118
     594:	01180081 	0x1180081
     598:	18300155 	0x18300155
     59c:	80025601 	lb	v0,22017(zero)
     5a0:	10170000 	beq	zero,s7,5a4 <_mem_avail_start-0x7ffffa5c>
     5a4:	43bfc005 	c0	0x1bfc005
     5a8:	a5000005 	sh	zero,5(t0)
     5ac:	18000004 	blez	zero,5c0 <_mem_avail_start-0x7ffffa40>
     5b0:	36015401 	ori	at,s0,0x5401
     5b4:	05181a00 	0x5181a00
     5b8:	0564bfc0 	0x564bfc0
     5bc:	2c170000 	sltiu	s7,zero,0
     5c0:	38bfc005 	xori	ra,a1,0xc005
     5c4:	c5000005 	lwc1	$f0,5(t0)
     5c8:	18000004 	blez	zero,5dc <_mem_avail_start-0x7ffffa24>
     5cc:	03055401 	0x3055401
     5d0:	bfc00c00 	cache	0x0,3072(s8)
     5d4:	05442100 	0x5442100
     5d8:	0543bfc0 	bgezl	t2,ffff04dc <_text_end+0x403ef484>
     5dc:	04d80000 	0x4d80000
     5e0:	01180000 	0x1180000
     5e4:	00370154 	0x370154
     5e8:	c0055019 	ll	a1,20505(zero)
     5ec:	000522bf 	0x522bf
     5f0:	54011800 	bnel	zero,at,65f4 <_mem_avail_start-0x7fff9a0c>
     5f4:	0c1c0305 	jal	700c14 <_mem_avail_start-0x7f8ff3ec>
     5f8:	0000bfc0 	sll	s7,zero,0x1f
     5fc:	0003a622 	0x3a622
     600:	00000000 	nop
     604:	00000c00 	sll	at,zero,0x10
     608:	079c0100 	0x79c0100
     60c:	23000005 	addi	zero,t8,5
     610:	000003b6 	tne	zero,zero,0xe
     614:	22005201 	addi	zero,s0,20993
     618:	0000038c 	syscall	0xe
     61c:	00000000 	nop
     620:	0000000c 	syscall
     624:	05229c01 	bltzl	t1,fffe762c <_text_end+0x403e65d4>
     628:	9c230000 	0x9c230000
     62c:	01000003 	0x1000003
     630:	00240052 	0x240052
     634:	00000000 	nop
     638:	06000000 	bltz	s0,63c <_mem_avail_start-0x7ffff9c4>
     63c:	025c240c 	syscall	0x97090
     640:	025c0000 	0x25c0000
     644:	4a040000 	c2	0x40000
     648:	0003f124 	0x3f124
     64c:	0003f100 	sll	s8,v1,0x4
     650:	240a0600 	li	t2,1536
     654:	000003be 	0x3be
     658:	000003be 	0x3be
     65c:	76244c04 	jalx	8913010 <_mem_avail_start-0x776ecff0>
     660:	76000002 	jalx	8000008 <_mem_avail_start-0x77fffff8>
     664:	04000002 	bltz	zero,670 <_mem_avail_start-0x7ffff990>
     668:	028b2442 	0x28b2442
     66c:	028b0000 	0x28b0000
     670:	15070000 	bne	t0,a3,674 <_mem_avail_start-0x7ffff98c>
     674:	00008d24 	0x8d24
     678:	00008d00 	sll	s1,zero,0x14
     67c:	000a0800 	sll	at,t2,0x0
     680:	000001c2 	srl	zero,zero,0x7
     684:	02a40004 	sllv	zero,a0,s5
     688:	01040000 	0x1040000
     68c:	000002e3 	0x2e3
     690:	0004340c 	syscall	0x10d0
     694:	00044300 	sll	t0,a0,0xc
     698:	00010800 	sll	at,at,0x0
     69c:	00000000 	nop
     6a0:	00025e00 	sll	t3,v0,0x18
     6a4:	03040200 	0x3040200
     6a8:	00a20704 	0xa20704
     6ac:	04030000 	bgezl	zero,6b0 <_mem_avail_start-0x7ffff950>
     6b0:	00009d07 	0x9d07
     6b4:	00000400 	sll	zero,zero,0x10
     6b8:	01010000 	0x1010000
     6bc:	00000185 	0x185
     6c0:	bfc0070c 	cache	0x0,1804(s8)
     6c4:	00000224 	0x224
     6c8:	01859c01 	0x1859c01
     6cc:	66050000 	0x66050000
     6d0:	0100746d 	0x100746d
     6d4:	00018c01 	0x18c01
     6d8:	00016d00 	sll	t5,at,0x14
     6dc:	69070600 	0x69070600
     6e0:	85030100 	lh	v1,256(t0)
     6e4:	a4000001 	sh	zero,1(zero)
     6e8:	07000001 	bltz	t8,6f0 <_mem_avail_start-0x7ffff910>
     6ec:	04010063 	b	87c <_mem_avail_start-0x7ffff784>
     6f0:	00000192 	0x192
     6f4:	0000020c 	syscall	0x8
     6f8:	67726107 	0x67726107
     6fc:	9e050100 	0x9e050100
     700:	2a000001 	slti	zero,s0,1
     704:	08000002 	j	8 <_mem_avail_start-0x7ffffff8>
     708:	01007061 	0x1007061
     70c:	00002506 	0x2506
     710:	60910200 	0x60910200
     714:	01007707 	0x1007707
     718:	00018507 	0x18507
     71c:	00024800 	sll	t1,v0,0x0
     720:	043d0900 	0x43d0900
     724:	10010000 	beq	zero,at,728 <_mem_avail_start-0x7ffff8d8>
     728:	bfc00790 	cache	0x0,1936(s8)
     72c:	0000b80a 	movz	s7,zero,zero
     730:	00013600 	sll	a2,at,0x18
     734:	04820b00 	bltzl	a0,3338 <_mem_avail_start-0x7fffccc8>
     738:	14010000 	bne	zero,at,73c <_mem_avail_start-0x7ffff8c4>
     73c:	00000185 	0x185
     740:	000000c6 	0xc6
     744:	220b0006 	addi	t3,s0,6
     748:	01000004 	sllv	zero,zero,t0
     74c:	00018519 	0x18519
     750:	0000d700 	sll	k0,zero,0x1c
     754:	0b000600 	j	c001800 <_mem_avail_start-0x73ffe800>
     758:	0000042a 	0x42a
     75c:	01851e01 	0x1851e01
     760:	00e80000 	0xe80000
     764:	00060000 	sll	zero,a2,0x0
     768:	c007fc0c 	ll	a3,-1012(zero)
     76c:	0001a4bf 	0x1a4bf
     770:	08580c00 	j	1603000 <_mem_avail_start-0x7e9fd000>
     774:	01afbfc0 	0x1afbfc0
     778:	7c0c0000 	0x7c0c0000
     77c:	babfc008 	swr	ra,-16376(s5)
     780:	0c000001 	jal	4 <_mem_avail_start-0x7ffffffc>
     784:	bfc00898 	cache	0x0,2200(s8)
     788:	000001ba 	0x1ba
     78c:	c008b00d 	ll	t0,-20467(zero)
     790:	0001babf 	0x1babf
     794:	00012500 	sll	a0,at,0x14
     798:	56010e00 	bnel	s0,at,3f9c <_mem_avail_start-0x7fffc064>
     79c:	0e008302 	jal	8020c08 <_mem_avail_start-0x77fdf3f8>
     7a0:	30015701 	andi	at,zero,0x5701
     7a4:	08dc0f00 	j	3703c00 <_mem_avail_start-0x7c8fc400>
     7a8:	01a4bfc0 	0x1a4bfc0
     7ac:	010e0000 	0x10e0000
     7b0:	25080254 	addiu	t0,t0,596
     7b4:	98100000 	lwr	s0,0(zero)
     7b8:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     7bc:	00000422 	0x422
     7c0:	01851901 	0x1851901
     7c4:	014c0000 	0x14c0000
     7c8:	00060000 	sll	zero,a2,0x0
     7cc:	c0092011 	ll	t1,8209(zero)
     7d0:	000008bf 	0x8bf
     7d4:	00017a00 	sll	t7,at,0x8
     7d8:	04220b00 	bltzl	at,33dc <_mem_avail_start-0x7fffcc24>
     7dc:	19010000 	0x19010000
     7e0:	00000185 	0x185
     7e4:	0000016a 	0x16a
     7e8:	280f0006 	slti	t7,zero,6
     7ec:	a4bfc009 	sh	ra,-16375(a1)
     7f0:	0e000001 	jal	8000004 <_mem_avail_start-0x77fffffc>
     7f4:	3d015401 	0x3d015401
     7f8:	d40c0000 	ldc1	$f12,0(zero)
     7fc:	a4bfc007 	sh	ra,-16377(a1)
     800:	00000001 	movf	zero,zero,$fcc0
     804:	05041200 	0x5041200
     808:	00746e69 	0x746e69
     80c:	01990413 	0x1990413
     810:	01030000 	0x1030000
     814:	00008806 	srlv	s1,zero,zero
     818:	01921400 	0x1921400
     81c:	04130000 	bgezall	zero,820 <_mem_avail_start-0x7ffff7e0>
     820:	00000025 	move	zero,zero
     824:	00042215 	0x42215
     828:	00042200 	sll	a0,a0,0x8
     82c:	15190100 	bne	t0,t9,c30 <_mem_avail_start-0x7ffff3d0>
     830:	00000482 	srl	zero,zero,0x12
     834:	00000482 	srl	zero,zero,0x12
     838:	2a151401 	slti	s5,s0,5121
     83c:	2a000004 	slti	zero,s0,4
     840:	01000004 	sllv	zero,zero,t0
     844:	014a001e 	0x14a001e
     848:	00040000 	sll	zero,a0,0x0
     84c:	000003ae 	0x3ae
     850:	02e30104 	0x2e30104
     854:	920c0000 	lbu	t4,0(s0)
     858:	43000004 	c0	0x1000004
     85c:	18000004 	blez	zero,870 <_mem_avail_start-0x7ffff790>
     860:	00000001 	movf	zero,zero,$fcc0
     864:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
     868:	02000003 	0x2000003
     86c:	00a20704 	0xa20704
     870:	04020000 	bltzl	zero,874 <_mem_avail_start-0x7ffff78c>
     874:	00009d07 	0x9d07
     878:	042a0300 	tlti	at,768
     87c:	01010000 	0x1010000
     880:	0000011d 	0x11d
     884:	bfc00930 	cache	0x0,2352(s8)
     888:	000000d8 	0xd8
     88c:	011d9c01 	0x11d9c01
     890:	76040000 	jalx	8100000 <_mem_avail_start-0x77f00000>
     894:	24010100 	li	at,256
     898:	b3000001 	0xb3000001
     89c:	04000002 	bltz	zero,8a8 <_mem_avail_start-0x7ffff758>
     8a0:	01010077 	0x1010077
     8a4:	0000011d 	0x11d
     8a8:	000002fb 	0x2fb
     8ac:	0003d105 	0x3d105
     8b0:	1d010100 	0x1d010100
     8b4:	4b000001 	c2	0x1000001
     8b8:	05000003 	bltz	t0,8c8 <_mem_avail_start-0x7ffff738>
     8bc:	0000049e 	0x49e
     8c0:	011d0101 	0x11d0101
     8c4:	038d0000 	0x38d0000
     8c8:	69060000 	0x69060000
     8cc:	1d030100 	0x1d030100
     8d0:	c7000001 	lwc1	$f0,1(t8)
     8d4:	06000003 	bltz	s0,8e4 <_mem_avail_start-0x7ffff71c>
     8d8:	0301006a 	0x301006a
     8dc:	0000011d 	0x11d
     8e0:	000003f0 	tge	zero,zero,0xf
     8e4:	01006306 	0x1006306
     8e8:	00011d04 	0x11d04
     8ec:	00043f00 	sll	a3,a0,0x1c
     8f0:	75620700 	jalx	5881c00 <_mem_avail_start-0x7a77e400>
     8f4:	05010066 	bgez	t0,a90 <_mem_avail_start-0x7ffff570>
     8f8:	0000012b 	0x12b
     8fc:	7fa89103 	0x7fa89103
     900:	00048c08 	0x48c08
     904:	2c060100 	sltiu	a2,zero,256
     908:	52000000 	beqzl	s0,90c <_mem_avail_start-0x7ffff6f4>
     90c:	09000004 	j	4000010 <_mem_avail_start-0x7bfffff0>
     910:	bfc00960 	cache	0x0,2400(s8)
     914:	00000010 	mfhi	zero
     918:	000000f8 	0xf8
     91c:	0004220a 	0x4220a
     920:	1d0a0100 	0x1d0a0100
     924:	e7000001 	swc1	$f0,1(t8)
     928:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     92c:	096c0c00 	j	5b03000 <_mem_avail_start-0x7a4fd000>
     930:	0142bfc0 	0x142bfc0
     934:	010d0000 	0x10d0000
     938:	2d080254 	sltiu	t0,t0,596
     93c:	d80e0000 	ldc2	$14,0(zero)
     940:	30bfc009 	andi	ra,a1,0xc009
     944:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
     948:	00000422 	0x422
     94c:	011d0a01 	0x11d0a01
     950:	01120000 	0x1120000
     954:	000b0000 	sll	zero,t3,0x0
     958:	c00a000f 	ll	t2,15(zero)
     95c:	000142bf 	0x142bf
     960:	10000000 	b	964 <_mem_avail_start-0x7ffff69c>
     964:	6e690504 	0x6e690504
     968:	04020074 	bltzl	zero,b3c <_mem_avail_start-0x7ffff4c4>
     96c:	00009405 	0x9405
     970:	013b1100 	0x13b1100
     974:	013b0000 	0x13b0000
     978:	25120000 	addiu	s2,t0,0
     97c:	3f000000 	0x3f000000
     980:	06010200 	bgez	s0,1184 <_mem_avail_start-0x7fffee7c>
     984:	00000088 	0x88
     988:	00042213 	0x42213
     98c:	00042200 	sll	a0,a0,0x8
     990:	000a0100 	sll	zero,t2,0x4
     994:	00000416 	0x416
     998:	04b00004 	bltzal	a1,9ac <_mem_avail_start-0x7ffff654>
     99c:	01040000 	0x1040000
     9a0:	000002e3 	0x2e3
     9a4:	0004b10c 	syscall	0x12c4
     9a8:	00044300 	sll	t0,a0,0xc
     9ac:	00012800 	sll	a1,at,0x0
     9b0:	00000000 	nop
     9b4:	00038600 	sll	s0,v1,0x18
     9b8:	03040200 	0x3040200
     9bc:	00a20704 	0xa20704
     9c0:	04030000 	bgezl	zero,9c4 <_mem_avail_start-0x7ffff63c>
     9c4:	00009d07 	0x9d07
     9c8:	04ba0400 	0x4ba0400
     9cc:	10020000 	beq	zero,v0,9d0 <_mem_avail_start-0x7ffff630>
     9d0:	00000027 	nor	zero,zero,zero
     9d4:	0004ab05 	0x4ab05
     9d8:	01720100 	0x1720100
     9dc:	00000000 	nop
     9e0:	0000000c 	syscall
     9e4:	008e9c01 	0x8e9c01
     9e8:	73060000 	madd	t8,a2
     9ec:	01720100 	0x1720100
     9f0:	00000025 	move	zero,zero
     9f4:	6e075401 	0x6e075401
     9f8:	01720100 	0x1720100
     9fc:	00000035 	0x35
     a00:	00000486 	0x486
     a04:	00000008 	jr	zero
     a08:	0001dd00 	sll	k1,at,0x14
     a0c:	54010900 	bnel	zero,at,2e10 <_mem_avail_start-0x7fffd1f0>
     a10:	09007402 	j	401d008 <_mem_avail_start-0x7bfe2ff8>
     a14:	75025501 	jalx	4095404 <_mem_avail_start-0x7bf6abfc>
     a18:	56010900 	bnel	s0,at,2e1c <_mem_avail_start-0x7fffd1e4>
     a1c:	5501f303 	bnel	t0,at,ffffd62c <_text_end+0x403fc5d4>
     a20:	c10a0000 	ll	t2,0(t0)
     a24:	01000004 	sllv	zero,zero,t0
     a28:	00ef0166 	0xef0166
     a2c:	00000000 	nop
     a30:	00400000 	0x400000
     a34:	9c010000 	0x9c010000
     a38:	000000ef 	0xef
     a3c:	00317607 	0x317607
     a40:	f6016601 	sdc1	$f1,26113(s0)
     a44:	b2000000 	0xb2000000
     a48:	07000004 	bltz	t8,a5c <_mem_avail_start-0x7ffff5a4>
     a4c:	01003276 	tne	t0,zero,0xc9
     a50:	00f60166 	0xf60166
     a54:	04d30000 	bgezall	a2,a58 <_mem_avail_start-0x7ffff5a8>
     a58:	6e070000 	0x6e070000
     a5c:	01660100 	0x1660100
     a60:	00000035 	0x35
     a64:	000004f4 	teq	zero,zero,0x13
     a68:	0031730b 	0x31730b
     a6c:	fd016701 	sdc3	$1,26369(t0)
     a70:	01000000 	0x1000000
     a74:	32730b54 	andi	s3,s3,0xb54
     a78:	01680100 	0x1680100
     a7c:	000000fd 	0xfd
     a80:	0c005501 	jal	15404 <_mem_avail_start-0x7ffeabfc>
     a84:	6e690504 	0x6e690504
     a88:	040d0074 	0x40d0074
     a8c:	000000fc 	0xfc
     a90:	0a040d0e 	j	8103438 <_mem_avail_start-0x77efcbc8>
     a94:	03000001 	movf	zero,t8,$fcc0
     a98:	00880601 	0x880601
     a9c:	030f0000 	0x30f0000
     aa0:	0a000001 	j	8000004 <_mem_avail_start-0x77fffffc>
     aa4:	000004a3 	0x4a3
     aa8:	25014301 	addiu	at,t0,17153
     aac:	00000000 	nop
     ab0:	70000000 	madd	zero,zero
     ab4:	01000000 	0x1000000
     ab8:	0001749c 	0x1749c
     abc:	73640700 	0x73640700
     ac0:	43010074 	c0	0x1010074
     ac4:	00002501 	0x2501
     ac8:	00051700 	sll	v0,a1,0x1c
     acc:	72730700 	0x72730700
     ad0:	43010063 	c0	0x1010063
     ad4:	0000f601 	0xf601
     ad8:	00053500 	sll	a2,a1,0x14
     adc:	006e0700 	0x6e0700
     ae0:	35014301 	ori	at,t0,0x4301
     ae4:	6f000000 	0x6f000000
     ae8:	10000005 	b	b00 <_mem_avail_start-0x7ffff500>
     aec:	47010073 	c1	0x1010073
     af0:	0000fd01 	0xfd01
     af4:	0005f300 	sll	s8,a1,0xc
     af8:	00641000 	0x641000
     afc:	74014801 	jalx	52004 <_mem_avail_start-0x7ffadffc>
     b00:	1c000001 	bgtz	zero,b08 <_mem_avail_start-0x7ffff4f8>
     b04:	00000006 	srlv	zero,zero,zero
     b08:	0103040d 	break	0x103,0x10
     b0c:	ed0a0000 	swc3	$10,0(t0)
     b10:	01000004 	sllv	zero,zero,t0
     b14:	0025012c 	0x25012c
     b18:	00000000 	nop
     b1c:	002c0000 	0x2c0000
     b20:	9c010000 	0x9c010000
     b24:	000001dd 	0x1dd
     b28:	74736407 	jalx	1cd901c <_mem_avail_start-0x7e326fe4>
     b2c:	012c0100 	0x12c0100
     b30:	00000025 	move	zero,zero
     b34:	00000671 	tgeu	zero,zero,0x19
     b38:	63727307 	0x63727307
     b3c:	012c0100 	0x12c0100
     b40:	000000f6 	tne	zero,zero,0x3
     b44:	0000068f 	sync	0x1a
     b48:	01006e07 	0x1006e07
     b4c:	0035012c 	0x35012c
     b50:	06b00000 	bltzal	s5,b54 <_mem_avail_start-0x7ffff4ac>
     b54:	730b0000 	madd	t8,t3
     b58:	01300100 	0x1300100
     b5c:	000000fd 	0xfd
     b60:	64105501 	0x64105501
     b64:	01310100 	0x1310100
     b68:	00000174 	teq	zero,zero,0x5
     b6c:	000006fa 	0x6fa
     b70:	028b0a00 	0x28b0a00
     b74:	11010000 	beq	t0,at,b78 <_mem_avail_start-0x7ffff488>
     b78:	00002501 	0x2501
     b7c:	c00a0800 	ll	t2,2048(zero)
     b80:	000024bf 	0x24bf
     b84:	2e9c0100 	sltiu	gp,s4,256
     b88:	07000002 	bltz	t8,b94 <_mem_avail_start-0x7ffff46c>
     b8c:	11010073 	beq	t0,at,d5c <_mem_avail_start-0x7ffff2a4>
     b90:	00002501 	0x2501
     b94:	00071800 	sll	v1,a3,0x0
     b98:	00630600 	0x630600
     b9c:	03011101 	0x3011101
     ba0:	01000001 	movf	zero,t0,$fcc0
     ba4:	006e0755 	0x6e0755
     ba8:	35011101 	ori	at,t0,0x1101
     bac:	36000000 	ori	zero,s0,0x0
     bb0:	10000007 	b	bd0 <_mem_avail_start-0x7ffff430>
     bb4:	15010070 	bne	t0,at,d78 <_mem_avail_start-0x7ffff288>
     bb8:	00017401 	0x17401
     bbc:	00078000 	sll	s0,a3,0x0
     bc0:	03110000 	0x3110000
     bc4:	01000005 	0x1000005
     bc8:	000174a3 	0x174a3
     bcc:	00000000 	nop
     bd0:	00002800 	sll	a1,zero,0x0
     bd4:	609c0100 	0x609c0100
     bd8:	12000002 	beqz	s0,be4 <_mem_avail_start-0x7ffff41c>
     bdc:	a3010073 	sb	at,115(t8)
     be0:	000000fd 	0xfd
     be4:	0000079e 	0x79e
     be8:	01006313 	0x1006313
     bec:	000103a3 	0x103a3
     bf0:	00550100 	0x550100
     bf4:	0004d811 	0x4d811
     bf8:	748f0100 	jalx	23c0400 <_mem_avail_start-0x7dc3fc00>
     bfc:	00000001 	movf	zero,zero,$fcc0
     c00:	2c000000 	sltiu	zero,zero,0
     c04:	01000000 	0x1000000
     c08:	0002929c 	0x2929c
     c0c:	00731200 	0x731200
     c10:	00fd8f01 	0xfd8f01
     c14:	07bc0000 	0x7bc0000
     c18:	63130000 	0x63130000
     c1c:	038f0100 	0x38f0100
     c20:	01000001 	movf	zero,t0,$fcc0
     c24:	fb110055 	sdc2	$17,85(t8)
     c28:	01000004 	sllv	zero,zero,t0
     c2c:	0000ef7f 	0xef7f
     c30:	00000000 	nop
     c34:	00004400 	sll	t0,zero,0x10
     c38:	d59c0100 	ldc1	$f28,256(t4)
     c3c:	12000002 	beqz	s0,c48 <_mem_avail_start-0x7ffff3b8>
     c40:	01003173 	tltu	t0,zero,0xc5
     c44:	0000fd7f 	0xfd7f
     c48:	0007e500 	sll	gp,a3,0x14
     c4c:	32731200 	andi	s3,s3,0x1200
     c50:	fd7f0100 	sdc3	$31,256(t3)
     c54:	03000000 	0x3000000
     c58:	12000008 	beqz	s0,c7c <_mem_avail_start-0x7ffff384>
     c5c:	7f01006e 	0x7f01006e
     c60:	00000035 	0x35
     c64:	00000821 	move	at,zero
     c68:	04e61100 	0x4e61100
     c6c:	68010000 	0x68010000
     c70:	000000ef 	0xef
     c74:	00000000 	nop
     c78:	00000030 	tge	zero,zero
     c7c:	030b9c01 	0x30b9c01
     c80:	73120000 	madd	t8,s2
     c84:	68010031 	0x68010031
     c88:	000000fd 	0xfd
     c8c:	00000860 	0x860
     c90:	00327312 	0x327312
     c94:	00fd6801 	movt	t5,a3,$fcc7
     c98:	087e0000 	j	1f80000 <_mem_avail_start-0x7e080000>
     c9c:	11000000 	beqz	t0,ca0 <_mem_avail_start-0x7ffff360>
     ca0:	000004c8 	0x4c8
     ca4:	01744d01 	0x1744d01
     ca8:	00000000 	nop
     cac:	00340000 	0x340000
     cb0:	9c010000 	0x9c010000
     cb4:	0000035f 	0x35f
     cb8:	74736412 	jalx	1cd9048 <_mem_avail_start-0x7e326fb8>
     cbc:	744d0100 	jalx	1340400 <_mem_avail_start-0x7ecbfc00>
     cc0:	9c000001 	0x9c000001
     cc4:	12000008 	beqz	s0,ce8 <_mem_avail_start-0x7ffff318>
     cc8:	00637273 	tltu	v1,v1,0x1c9
     ccc:	00fd4d01 	0xfd4d01
     cd0:	08ba0000 	j	2e80000 <_mem_avail_start-0x7d180000>
     cd4:	6c120000 	0x6c120000
     cd8:	01006e65 	0x1006e65
     cdc:	0000354d 	break	0x0,0xd5
     ce0:	0008d800 	sll	k1,t0,0x0
     ce4:	00701400 	0x701400
     ce8:	01744e01 	0x1744e01
     cec:	090d0000 	j	4340000 <_mem_avail_start-0x7bcc0000>
     cf0:	11000000 	beqz	t0,cf4 <_mem_avail_start-0x7ffff30c>
     cf4:	000004df 	0x4df
     cf8:	01743701 	0x1743701
     cfc:	00000000 	nop
     d00:	00240000 	0x240000
     d04:	9c010000 	0x9c010000
     d08:	000003a4 	0x3a4
     d0c:	74736412 	jalx	1cd9048 <_mem_avail_start-0x7e326fb8>
     d10:	74370100 	jalx	dc0400 <_mem_avail_start-0x7f23fc00>
     d14:	2b000001 	slti	zero,t8,1
     d18:	12000009 	beqz	s0,d40 <_mem_avail_start-0x7ffff2c0>
     d1c:	00637273 	tltu	v1,v1,0x1c9
     d20:	00fd3701 	0xfd3701
     d24:	09490000 	j	5240000 <_mem_avail_start-0x7adc0000>
     d28:	70140000 	madd	zero,s4
     d2c:	743b0100 	jalx	ec0400 <_mem_avail_start-0x7f13fc00>
     d30:	67000001 	0x67000001
     d34:	00000009 	jalr	zero,zero
     d38:	0004d011 	0x4d011
     d3c:	35220100 	ori	v0,t1,0x100
     d40:	00000000 	nop
     d44:	28000000 	slti	zero,zero,0
     d48:	01000000 	0x1000000
     d4c:	0003e79c 	0x3e79c
     d50:	00731200 	0x731200
     d54:	00fd2201 	0xfd2201
     d58:	09850000 	j	6140000 <_mem_avail_start-0x79ec0000>
     d5c:	6c130000 	0x6c130000
     d60:	01006e65 	0x1006e65
     d64:	00003522 	0x3522
     d68:	14550100 	bne	v0,s5,116c <_mem_avail_start-0x7fffee94>
     d6c:	00746e63 	0x746e63
     d70:	00352301 	0x352301
     d74:	09ca0000 	j	7280000 <_mem_avail_start-0x78d80000>
     d78:	15000000 	bnez	t0,d7c <_mem_avail_start-0x7ffff284>
     d7c:	000004f4 	teq	zero,zero,0x13
     d80:	00350c01 	0x350c01
     d84:	00000000 	nop
     d88:	00200000 	0x200000
     d8c:	9c010000 	0x9c010000
     d90:	01007312 	0x1007312
     d94:	0000fd0c 	syscall	0x3f4
     d98:	0009e900 	sll	sp,t1,0x4
     d9c:	6e631400 	0x6e631400
     da0:	0d010074 	jal	40401d0 <_mem_avail_start-0x7bfbfe30>
     da4:	00000035 	0x35
     da8:	00000a07 	0xa07
     dac:	014c0000 	0x14c0000
     db0:	00040000 	sll	zero,a0,0x0
     db4:	000005f2 	tlt	zero,zero,0x17
     db8:	02e30104 	0x2e30104
     dbc:	0b0c0000 	j	c300000 <_mem_avail_start-0x73d00000>
     dc0:	43000005 	c0	0x1000005
     dc4:	b0000004 	0xb0000004
     dc8:	00000001 	movf	zero,zero,$fcc0
     dcc:	03000000 	0x3000000
     dd0:	02000005 	0x2000005
     dd4:	00a20704 	0xa20704
     dd8:	04020000 	bltzl	zero,ddc <_mem_avail_start-0x7ffff224>
     ddc:	00009d07 	0x9d07
     de0:	03f10300 	0x3f10300
     de4:	0e010000 	jal	8040000 <_mem_avail_start-0x77fc0000>
     de8:	000000a2 	0xa2
     dec:	bfc00a8c 	cache	0x0,2700(s8)
     df0:	00000030 	tge	zero,zero
     df4:	00a29c01 	0xa29c01
     df8:	73040000 	madd	t8,a0
     dfc:	a90e0100 	swl	t6,256(t0)
     e00:	26000000 	addiu	zero,s0,0
     e04:	0500000a 	bltz	t0,e30 <_mem_avail_start-0x7ffff1d0>
     e08:	00000422 	0x422
     e0c:	00a20701 	0xa20701
     e10:	006a0000 	0x6a0000
     e14:	00060000 	sll	zero,a2,0x0
     e18:	c00a9c07 	ll	t2,-25593(zero)
     e1c:	0000bbbf 	0xbbbf
     e20:	00007f00 	sll	t7,zero,0x1c
     e24:	54010800 	bnel	zero,at,2e28 <_mem_avail_start-0x7fffd1d8>
     e28:	5401f303 	bnel	zero,at,ffffda38 <_text_end+0x403fc9e0>
     e2c:	0aa40700 	j	a901c00 <_mem_avail_start-0x756fe400>
     e30:	0144bfc0 	0x144bfc0
     e34:	00920000 	0x920000
     e38:	01080000 	0x1080000
     e3c:	003d0154 	0x3d0154
     e40:	c00aac09 	ll	t2,-21495(zero)
     e44:	000144bf 	0x144bf
     e48:	54010800 	bnel	zero,at,2e4c <_mem_avail_start-0x7fffd1b4>
     e4c:	00003a01 	0x3a01
     e50:	6905040a 	0x6905040a
     e54:	0b00746e 	j	c01d1b8 <_mem_avail_start-0x73fe2e48>
     e58:	0000b604 	0xb604
     e5c:	06010200 	bgez	s0,1660 <_mem_avail_start-0x7fffe9a0>
     e60:	00000088 	0x88
     e64:	0000af0c 	syscall	0x2bc
     e68:	04820300 	bltzl	a0,1a6c <_mem_avail_start-0x7fffe594>
     e6c:	01010000 	0x1010000
     e70:	000000a2 	0xa2
     e74:	bfc00a2c 	cache	0x0,2604(s8)
     e78:	00000060 	0x60
     e7c:	01449c01 	0x1449c01
     e80:	73040000 	madd	t8,a0
     e84:	a9010100 	swl	at,256(t0)
     e88:	47000000 	c1	0x1000000
     e8c:	0d00000a 	jal	4000028 <_mem_avail_start-0x7bffffd8>
     e90:	03010063 	0x3010063
     e94:	000000af 	0xaf
     e98:	00000a70 	tge	zero,zero,0x29
     e9c:	0001980e 	0x1980e
     ea0:	04220500 	bltzl	at,22a4 <_mem_avail_start-0x7fffdd5c>
     ea4:	07010000 	bgez	t8,ea8 <_mem_avail_start-0x7ffff158>
     ea8:	000000a2 	0xa2
     eac:	00000104 	0x104
     eb0:	740f0006 	jalx	3c0018 <_mem_avail_start-0x7fc3ffe8>
     eb4:	08bfc00a 	j	2ff0028 <_mem_avail_start-0x7d00ffd8>
     eb8:	32000000 	andi	zero,s0,0x0
     ebc:	05000001 	bltz	t0,ec4 <_mem_avail_start-0x7ffff13c>
     ec0:	00000422 	0x422
     ec4:	00a20701 	0xa20701
     ec8:	01220000 	0x1220000
     ecc:	00060000 	sll	zero,a2,0x0
     ed0:	c00a7c09 	ll	t2,31753(zero)
     ed4:	000144bf 	0x144bf
     ed8:	54010800 	bnel	zero,at,2edc <_mem_avail_start-0x7fffd124>
     edc:	00003d01 	0x3d01
     ee0:	c00a8409 	ll	t2,-31735(zero)
     ee4:	000144bf 	0x144bf
     ee8:	54010800 	bnel	zero,at,2eec <_mem_avail_start-0x7fffd114>
     eec:	00008002 	srl	s0,zero,0x0
     ef0:	22100000 	addi	s0,s0,0
     ef4:	22000004 	addi	zero,s0,4
     ef8:	01000004 	sllv	zero,zero,t0
     efc:	00b20007 	srav	zero,s2,a1
     f00:	00040000 	sll	zero,a0,0x0
     f04:	000006c5 	0x6c5
     f08:	02e30104 	0x2e30104
     f0c:	1f0c0000 	0x1f0c0000
     f10:	43000005 	c0	0x1000005
     f14:	c8000004 	lwc2	$0,4(zero)
     f18:	00000001 	movf	zero,zero,$fcc0
     f1c:	56000000 	bnezl	s0,f20 <_mem_avail_start-0x7ffff0e0>
     f20:	02000005 	0x2000005
     f24:	00a20704 	0xa20704
     f28:	04020000 	bltzl	zero,f2c <_mem_avail_start-0x7ffff0d4>
     f2c:	00009d07 	0x9d07
     f30:	06010200 	bgez	s0,1734 <_mem_avail_start-0x7fffe8cc>
     f34:	00000081 	0x81
     f38:	a1050202 	sb	a1,514(t0)
     f3c:	03000001 	movf	zero,t8,$fcc0
     f40:	6e690504 	0x6e690504
     f44:	04020074 	bltzl	zero,1118 <_mem_avail_start-0x7fffeee8>
     f48:	00009405 	0x9405
     f4c:	00770400 	0x770400
     f50:	09020000 	j	4080000 <_mem_avail_start-0x7bf80000>
     f54:	0000005a 	0x5a
     f58:	7f080102 	0x7f080102
     f5c:	02000000 	0x2000000
     f60:	00af0702 	0xaf0702
     f64:	66040000 	0x66040000
     f68:	03000002 	0x3000002
     f6c:	00004f0b 	0x4f0b
     f70:	04220500 	bltzl	at,2374 <_mem_avail_start-0x7fffdc8c>
     f74:	03010000 	0x3010000
     f78:	00000041 	0x41
     f7c:	bfc00abc 	cache	0x0,2748(s8)
     f80:	0000002c 	0x2c
     f84:	00aa9c01 	0xaa9c01
     f88:	63060000 	0x63060000
     f8c:	41030100 	bc0tl	1390 <_mem_avail_start-0x7fffec70>
     f90:	8e000000 	lw	zero,0(s0)
     f94:	0700000a 	bltz	t8,fc0 <_mem_avail_start-0x7ffff040>
     f98:	bfc00ad4 	cache	0x0,2772(s8)
     f9c:	000000aa 	0xaa
     fa0:	02540108 	0x2540108
     fa4:	00000080 	sll	zero,zero,0x2
     fa8:	00051209 	0x51209
     fac:	00051200 	sll	v0,a1,0x8
     fb0:	00460300 	0x460300
     fb4:	00000b3b 	0xb3b
     fb8:	074f0004 	0x74f0004
     fbc:	01040000 	0x1040000
     fc0:	000000c2 	srl	zero,zero,0x3
     fc4:	00065a04 	0x65a04
     fc8:	00044300 	sll	t0,a0,0xc
     fcc:	0001f000 	sll	s8,at,0x0
     fd0:	00000000 	nop
     fd4:	0005b300 	sll	s6,a1,0xc
     fd8:	03040200 	0x3040200
     fdc:	00a20704 	0xa20704
     fe0:	27040000 	addiu	a0,t8,0
     fe4:	03000000 	0x3000000
     fe8:	009d0704 	0x9d0704
     fec:	33040000 	andi	a0,t8,0x0
     ff0:	05000000 	bltz	t0,ff4 <_mem_avail_start-0x7ffff00c>
     ff4:	000003df 	0x3df
     ff8:	00270f02 	ror	at,a3,0x1c
     ffc:	01030000 	0x1030000
    1000:	00008106 	0x8106
    1004:	05020300 	bltzl	t0,1c08 <_mem_avail_start-0x7fffe3f8>
    1008:	000001a1 	0x1a1
    100c:	69050406 	0x69050406
    1010:	0300746e 	0x300746e
    1014:	00940504 	0x940504
    1018:	77050000 	jalx	c140000 <_mem_avail_start-0x73ec0000>
    101c:	03000000 	0x3000000
    1020:	00007109 	0x7109
    1024:	08010300 	j	40c00 <_mem_avail_start-0x7ffbf400>
    1028:	0000007f 	0x7f
    102c:	00007104 	0x7104
    1030:	03d60500 	0x3d60500
    1034:	0a030000 	j	80c0000 <_mem_avail_start-0x77f40000>
    1038:	00000088 	0x88
    103c:	af070203 	sw	a3,515(t8)
    1040:	04000000 	bltz	zero,1044 <_mem_avail_start-0x7fffefbc>
    1044:	00000088 	0x88
    1048:	00057e05 	0x57e05
    104c:	330c0300 	andi	t4,t8,0x300
    1050:	05000000 	bltz	t0,1054 <_mem_avail_start-0x7fffefac>
    1054:	00000266 	0x266
    1058:	00660b04 	0x660b04
    105c:	e4050000 	swc1	$f5,0(zero)
    1060:	04000006 	bltz	zero,107c <_mem_avail_start-0x7fffef84>
    1064:	00007d0c 	syscall	0x1f4
    1068:	06160500 	0x6160500
    106c:	0d040000 	jal	4100000 <_mem_avail_start-0x7bf00000>
    1070:	0000003f 	0x3f
    1074:	00061505 	0x61505
    1078:	940e0400 	lhu	t6,1024(zero)
    107c:	07000000 	bltz	t8,1080 <_mem_avail_start-0x7fffef80>
    1080:	000005c7 	0x5c7
    1084:	05a70a01 	0x5a70a01
    1088:	04010000 	b	108c <_mem_avail_start-0x7fffef74>
    108c:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    1090:	00330054 	0x330054
    1094:	0c090000 	jal	240000 <_mem_avail_start-0x7fdc0000>
    1098:	01000002 	0x1000002
    109c:	0000250a 	0x250a
    10a0:	055f0900 	0x55f0900
    10a4:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    10a8:	00000033 	tltu	zero,zero
    10ac:	7274700a 	0x7274700a
    10b0:	040b0100 	tltiu	zero,256
    10b4:	00000001 	movf	zero,zero,$fcc0
    10b8:	003a040b 	0x3a040b
    10bc:	f6070000 	sdc1	$f7,0(s0)
    10c0:	01000006 	srlv	zero,zero,t0
    10c4:	0005350a 	0x5350a
    10c8:	01430100 	0x1430100
    10cc:	54080000 	bnel	zero,t0,10d0 <_mem_avail_start-0x7fffef30>
    10d0:	00002700 	sll	a0,zero,0x1c
    10d4:	020c0900 	0x20c0900
    10d8:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    10dc:	00000025 	move	zero,zero
    10e0:	00055f09 	0x55f09
    10e4:	270a0100 	addiu	t2,t8,256
    10e8:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    10ec:	00727470 	tge	v1,s2,0x1d1
    10f0:	01430b01 	0x1430b01
    10f4:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
    10f8:	00002e04 	0x2e04
    10fc:	062c0700 	teqi	s1,1792
    1100:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    1104:	00000695 	0x695
    1108:	00018201 	0x18201
    110c:	00540800 	0x540800
    1110:	00000088 	0x88
    1114:	00020c09 	0x20c09
    1118:	250a0100 	addiu	t2,t0,256
    111c:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    1120:	0000055f 	0x55f
    1124:	00880a01 	0x880a01
    1128:	700a0000 	madd	zero,t2
    112c:	01007274 	teq	t0,zero,0x1c9
    1130:	0001820b 	0x1820b
    1134:	040b0000 	tltiu	zero,0
    1138:	0000008f 	sync	0x2
    113c:	00058707 	0x58707
    1140:	710a0100 	0x710a0100
    1144:	01000006 	srlv	zero,zero,t0
    1148:	000001c1 	0x1c1
    114c:	71005408 	0x71005408
    1150:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    1154:	0000020c 	syscall	0x8
    1158:	00250a01 	0x250a01
    115c:	5f090000 	0x5f090000
    1160:	01000005 	0x1000005
    1164:	0000710a 	0x710a
    1168:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    116c:	0b010072 	j	c0401c8 <_mem_avail_start-0x73fbfe38>
    1170:	000001c1 	0x1c1
    1174:	78040b00 	0x78040b00
    1178:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    117c:	000005ec 	0x5ec
    1180:	056f0401 	0x56f0401
    1184:	00330000 	0x330000
    1188:	f9010000 	sdc2	$1,0(t0)
    118c:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    1190:	00330054 	0x330054
    1194:	0c090000 	jal	240000 <_mem_avail_start-0x7fdc0000>
    1198:	01000002 	0x1000002
    119c:	00002504 	0x2504
    11a0:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    11a4:	05010072 	bgez	t0,1370 <_mem_avail_start-0x7fffec90>
    11a8:	00000104 	0x104
    11ac:	06820c00 	bltzl	s4,41b0 <_mem_avail_start-0x7fffbe50>
    11b0:	04010000 	b	11b4 <_mem_avail_start-0x7fffee4c>
    11b4:	000006a6 	0x6a6
    11b8:	00000027 	nor	zero,zero,zero
    11bc:	00022b01 	0x22b01
    11c0:	00540800 	0x540800
    11c4:	00000027 	nor	zero,zero,zero
    11c8:	00020c09 	0x20c09
    11cc:	25040100 	addiu	a0,t0,256
    11d0:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    11d4:	00727470 	tge	v1,s2,0x1d1
    11d8:	01430501 	0x1430501
    11dc:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    11e0:	000006cb 	0x6cb
    11e4:	05b80401 	0x5b80401
    11e8:	00880000 	0x880000
    11ec:	5d010000 	0x5d010000
    11f0:	08000002 	j	8 <_mem_avail_start-0x7ffffff8>
    11f4:	00880054 	0x880054
    11f8:	0c090000 	jal	240000 <_mem_avail_start-0x7fdc0000>
    11fc:	01000002 	0x1000002
    1200:	00002504 	0x2504
    1204:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    1208:	05010072 	bgez	t0,13d4 <_mem_avail_start-0x7fffec2c>
    120c:	00000182 	srl	zero,zero,0x6
    1210:	06460c00 	0x6460c00
    1214:	04010000 	b	1218 <_mem_avail_start-0x7fffede8>
    1218:	0000061d 	0x61d
    121c:	00000071 	tgeu	zero,zero,0x1
    1220:	00028f01 	0x28f01
    1224:	00540800 	0x540800
    1228:	00000071 	tgeu	zero,zero,0x1
    122c:	00020c09 	0x20c09
    1230:	25040100 	addiu	a0,t0,256
    1234:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    1238:	00727470 	tge	v1,s2,0x1d1
    123c:	01c10501 	0x1c10501
    1240:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    1244:	00000546 	0x546
    1248:	00b54a01 	0xb54a01
    124c:	00000000 	nop
    1250:	00140000 	sll	zero,s4,0x0
    1254:	9c010000 	0x9c010000
    1258:	000002ef 	0x2ef
    125c:	0009380e 	0x9380e
    1260:	00000000 	nop
    1264:	00000c00 	sll	at,zero,0x10
    1268:	0f4b0100 	jal	d2c0400 <_mem_avail_start-0x72d3fc00>
    126c:	00000948 	0x948
    1270:	00000ab7 	0xab7
    1274:	0001f90e 	0x1f90e
    1278:	00000000 	nop
    127c:	00000c00 	sll	at,zero,0x10
    1280:	0f1c0100 	jal	c700400 <_mem_avail_start-0x738ffc00>
    1284:	00000214 	0x214
    1288:	00000ab7 	0xab7
    128c:	00000010 	mfhi	zero
    1290:	00000c00 	sll	at,zero,0x10
    1294:	021f1100 	0x21f1100
    1298:	e0a00000 	sc	zero,0(a1)
    129c:	007bffc3 	0x7bffc3
    12a0:	12000000 	beqz	s0,12a4 <_mem_avail_start-0x7fffed5c>
    12a4:	000003be 	0x3be
    12a8:	0b544601 	j	d511804 <_mem_avail_start-0x72aee7fc>
    12ac:	0014bfc0 	sll	s7,s4,0x1f
    12b0:	9c010000 	0x9c010000
    12b4:	0000036a 	0x36a
    12b8:	00055f13 	0x55f13
    12bc:	b5460100 	0xb5460100
    12c0:	01000000 	0x1000000
    12c4:	087e0e54 	j	1f83950 <_mem_avail_start-0x7e07c6b0>
    12c8:	0b540000 	j	d500000 <_mem_avail_start-0x72b00000>
    12cc:	000cbfc0 	sll	s7,t4,0x1f
    12d0:	47010000 	c1	0x1010000
    12d4:	0008950f 	0x8950f
    12d8:	000acf00 	sll	t9,t2,0x1c
    12dc:	088a0f00 	j	2283c00 <_mem_avail_start-0x7dd7c400>
    12e0:	0ae20000 	j	b880000 <_mem_avail_start-0x74780000>
    12e4:	0a0e0000 	j	8380000 <_mem_avail_start-0x77c80000>
    12e8:	54000001 	bnezl	zero,12f0 <_mem_avail_start-0x7fffed10>
    12ec:	0cbfc00b 	jal	2ff002c <_mem_avail_start-0x7d00ffd4>
    12f0:	01000000 	0x1000000
    12f4:	012c0f1d 	0x12c0f1d
    12f8:	0acf0000 	j	b3c0000 <_mem_avail_start-0x74c40000>
    12fc:	210f0000 	addi	t7,t0,0
    1300:	e2000001 	sc	zero,1(s0)
    1304:	1000000a 	b	1330 <_mem_avail_start-0x7fffecd0>
    1308:	bfc00b54 	cache	0x0,2900(s8)
    130c:	0000000c 	syscall
    1310:	00013711 	0x13711
    1314:	c3e09000 	ll	zero,-28672(ra)
    1318:	00007bff 	0x7bff
    131c:	5c120000 	0x5c120000
    1320:	01000002 	0x1000002
    1324:	c00b4042 	ll	t3,16450(zero)
    1328:	000014bf 	0x14bf
    132c:	e59c0100 	swc1	$f28,256(t4)
    1330:	13000003 	beqz	t8,1340 <_mem_avail_start-0x7fffecc0>
    1334:	0000055f 	0x55f
    1338:	00aa4201 	0xaa4201
    133c:	54010000 	bnel	zero,at,1340 <_mem_avail_start-0x7fffecc0>
    1340:	0008a10e 	0x8a10e
    1344:	c00b4000 	ll	t3,16384(zero)
    1348:	00000cbf 	0xcbf
    134c:	0f430100 	jal	d0c0400 <_mem_avail_start-0x72f3fc00>
    1350:	000008b8 	0x8b8
    1354:	00000afa 	0xafa
    1358:	0008ad0f 	0x8ad0f
    135c:	000b0d00 	sll	at,t3,0x14
    1360:	01490e00 	0x1490e00
    1364:	0b400000 	j	d000000 <_mem_avail_start-0x73000000>
    1368:	000cbfc0 	sll	s7,t4,0x1f
    136c:	1d010000 	0x1d010000
    1370:	00016b0f 	0x16b0f
    1374:	000afa00 	sll	ra,t2,0x8
    1378:	01600f00 	0x1600f00
    137c:	0b0d0000 	j	c340000 <_mem_avail_start-0x73cc0000>
    1380:	40100000 	mfc0	s0,c0_index
    1384:	0cbfc00b 	jal	2ff002c <_mem_avail_start-0x7d00ffd4>
    1388:	11000000 	beqz	t0,138c <_mem_avail_start-0x7fffec74>
    138c:	00000176 	tne	zero,zero,0x5
    1390:	ffc3e080 	sdc3	$3,-8064(s8)
    1394:	0000007b 	0x7b
    1398:	06040d00 	0x6040d00
    139c:	39010000 	xori	at,t0,0x0
    13a0:	000000b5 	0xb5
    13a4:	00000000 	nop
    13a8:	00000048 	0x48
    13ac:	04329c01 	bltzall	at,fffe83b4 <_text_end+0x403e735c>
    13b0:	c6140000 	lwc1	$f20,0(s0)
    13b4:	01000006 	srlv	zero,zero,t0
    13b8:	0000b53a 	0xb53a
    13bc:	000b2500 	sll	a0,t3,0x14
    13c0:	00001500 	sll	v0,zero,0x14
    13c4:	04ef0000 	0x4ef0000
    13c8:	00150000 	sll	zero,s5,0x0
    13cc:	ef000000 	swc3	$0,0(t8)
    13d0:	15000004 	bnez	t0,13e4 <_mem_avail_start-0x7fffec1c>
    13d4:	00000000 	nop
    13d8:	000004ef 	0x4ef
    13dc:	00000015 	0x15
    13e0:	0004ef00 	sll	sp,a0,0x1c
    13e4:	12120000 	beq	s0,s2,13e8 <_mem_avail_start-0x7fffec18>
    13e8:	01000005 	0x1000005
    13ec:	c00b2034 	ll	t3,8244(zero)
    13f0:	000020bf 	0x20bf
    13f4:	ef9c0100 	swc3	$28,256(gp)
    13f8:	13000004 	beqz	t8,140c <_mem_avail_start-0x7fffebf4>
    13fc:	0000055f 	0x55f
    1400:	009f3401 	0x9f3401
    1404:	54010000 	bnel	zero,at,1408 <_mem_avail_start-0x7fffebf8>
    1408:	0009a116 	0x9a116
    140c:	c00b2000 	ll	t3,8192(zero)
    1410:	000008bf 	0x8bf
    1414:	96350100 	lhu	s5,256(s1)
    1418:	17000004 	bnez	t8,142c <_mem_avail_start-0x7fffebd4>
    141c:	000009b1 	tgeu	zero,zero,0x26
    1420:	00025d0e 	0x25d0e
    1424:	c00b2000 	ll	t3,8192(zero)
    1428:	000008bf 	0x8bf
    142c:	171c0100 	bne	t8,gp,1830 <_mem_avail_start-0x7fffe7d0>
    1430:	00000278 	0x278
    1434:	c00b2010 	ll	t3,8208(zero)
    1438:	000008bf 	0x8bf
    143c:	02831100 	0x2831100
    1440:	e0940000 	sc	s4,0(a0)
    1444:	007bfec0 	0x7bfec0
    1448:	c40e0000 	lwc1	$f14,0(zero)
    144c:	34000008 	li	zero,0x8
    1450:	04bfc00b 	0x4bfc00b
    1454:	01000000 	0x1000000
    1458:	08db0f36 	j	36c3cd8 <_mem_avail_start-0x7c93c328>
    145c:	0b810000 	j	e040000 <_mem_avail_start-0x71fc0000>
    1460:	d00f0000 	0xd00f0000
    1464:	94000008 	lhu	zero,8(zero)
    1468:	0e00000b 	jal	800002c <_mem_avail_start-0x77ffffd4>
    146c:	00000188 	0x188
    1470:	bfc00b34 	cache	0x0,2868(s8)
    1474:	00000004 	sllv	zero,zero,zero
    1478:	aa0f1d01 	swl	t7,7425(s0)
    147c:	81000001 	lb	zero,1(t0)
    1480:	0f00000b 	jal	c00002c <_mem_avail_start-0x73ffffd4>
    1484:	0000019f 	0x19f
    1488:	00000b94 	0xb94
    148c:	c00b3410 	ll	t3,13328(zero)
    1490:	000004bf 	0x4bf
    1494:	01b51100 	0x1b51100
    1498:	e0800000 	sc	zero,0(a0)
    149c:	007bfec0 	0x7bfec0
    14a0:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    14a4:	000006b5 	0x6b5
    14a8:	009f2f01 	0x9f2f01
    14ac:	00000000 	nop
    14b0:	00200000 	0x200000
    14b4:	9c010000 	0x9c010000
    14b8:	00000589 	0x589
    14bc:	0009a116 	0x9a116
    14c0:	00000000 	nop
    14c4:	00000800 	sll	at,zero,0x0
    14c8:	4a300100 	c2	0x300100
    14cc:	17000005 	bnez	t8,14e4 <_mem_avail_start-0x7fffeb1c>
    14d0:	000009b1 	tgeu	zero,zero,0x26
    14d4:	00025d0e 	0x25d0e
    14d8:	00000000 	nop
    14dc:	00000800 	sll	at,zero,0x0
    14e0:	171c0100 	bne	t8,gp,18e4 <_mem_avail_start-0x7fffe71c>
    14e4:	00000278 	0x278
    14e8:	00000010 	mfhi	zero
    14ec:	00000800 	sll	at,zero,0x0
    14f0:	02831100 	0x2831100
    14f4:	e0940000 	sc	s4,0(a0)
    14f8:	007bfec0 	0x7bfec0
    14fc:	a10e0000 	sb	t6,0(t0)
    1500:	00000009 	jalr	zero,zero
    1504:	04000000 	bltz	zero,1508 <_mem_avail_start-0x7fffeaf8>
    1508:	01000000 	0x1000000
    150c:	09b11731 	j	6c45cc4 <_mem_avail_start-0x793ba33c>
    1510:	5d0e0000 	0x5d0e0000
    1514:	00000002 	srl	zero,zero,0x0
    1518:	04000000 	bltz	zero,151c <_mem_avail_start-0x7fffeae4>
    151c:	01000000 	0x1000000
    1520:	0278171c 	0x278171c
    1524:	00100000 	sll	zero,s0,0x0
    1528:	04000000 	bltz	zero,152c <_mem_avail_start-0x7fffead4>
    152c:	11000000 	beqz	t0,1530 <_mem_avail_start-0x7fffead0>
    1530:	00000283 	sra	zero,zero,0xa
    1534:	fec0e080 	sdc3	$0,-8064(s6)
    1538:	0000007b 	0x7b
    153c:	02761200 	0x2761200
    1540:	1f010000 	0x1f010000
    1544:	bfc00ae8 	cache	0x0,2792(s8)
    1548:	00000038 	0x38
    154c:	081b9c01 	j	6e7004 <_mem_avail_start-0x7f918ffc>
    1550:	c4160000 	lwc1	$f22,0(zero)
    1554:	e8000008 	swc2	$0,8(zero)
    1558:	0cbfc00a 	jal	2ff0028 <_mem_avail_start-0x7d00ffd8>
    155c:	01000000 	0x1000000
    1560:	0005fa21 	0x5fa21
    1564:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    1568:	0bac0000 	j	eb00000 <_mem_avail_start-0x71500000>
    156c:	d00f0000 	0xd00f0000
    1570:	c1000008 	ll	zero,8(t0)
    1574:	0e00000b 	jal	800002c <_mem_avail_start-0x77ffffd4>
    1578:	00000188 	0x188
    157c:	bfc00ae8 	cache	0x0,2792(s8)
    1580:	0000000c 	syscall
    1584:	aa0f1d01 	swl	t7,7425(s0)
    1588:	ac000001 	sw	zero,1(zero)
    158c:	0f00000b 	jal	c00002c <_mem_avail_start-0x73ffffd4>
    1590:	0000019f 	0x19f
    1594:	00000bc1 	0xbc1
    1598:	c00ae810 	ll	t2,-6128(zero)
    159c:	00000cbf 	0xcbf
    15a0:	01b51100 	0x1b51100
    15a4:	e0880000 	sc	t0,0(a0)
    15a8:	007bfec0 	0x7bfec0
    15ac:	c4160000 	lwc1	$f22,0(zero)
    15b0:	f4000008 	sdc1	$f0,8(zero)
    15b4:	08bfc00a 	j	2ff0028 <_mem_avail_start-0x7d00ffd8>
    15b8:	01000000 	0x1000000
    15bc:	00065623 	0x65623
    15c0:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    15c4:	0bd90000 	j	f640000 <_mem_avail_start-0x709c0000>
    15c8:	d00f0000 	0xd00f0000
    15cc:	ee000008 	swc3	$0,8(s0)
    15d0:	0e00000b 	jal	800002c <_mem_avail_start-0x77ffffd4>
    15d4:	00000188 	0x188
    15d8:	bfc00af4 	cache	0x0,2804(s8)
    15dc:	00000008 	jr	zero
    15e0:	aa0f1d01 	swl	t7,7425(s0)
    15e4:	d9000001 	ldc2	$0,1(t0)
    15e8:	0f00000b 	jal	c00002c <_mem_avail_start-0x73ffffd4>
    15ec:	0000019f 	0x19f
    15f0:	00000bee 	0xbee
    15f4:	c00af410 	ll	t2,-3056(zero)
    15f8:	000008bf 	0x8bf
    15fc:	01b51100 	0x1b51100
    1600:	e08c0000 	sc	t4,0(a0)
    1604:	007bfec0 	0x7bfec0
    1608:	c4160000 	lwc1	$f22,0(zero)
    160c:	fc000008 	sdc3	$0,8(zero)
    1610:	08bfc00a 	j	2ff0028 <_mem_avail_start-0x7d00ffd8>
    1614:	01000000 	0x1000000
    1618:	0006b225 	0x6b225
    161c:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    1620:	0c060000 	jal	180000 <_mem_avail_start-0x7fe80000>
    1624:	d00f0000 	0xd00f0000
    1628:	1b000008 	blez	t8,164c <_mem_avail_start-0x7fffe9b4>
    162c:	0e00000c 	jal	8000030 <_mem_avail_start-0x77ffffd0>
    1630:	00000188 	0x188
    1634:	bfc00afc 	cache	0x0,2812(s8)
    1638:	00000008 	jr	zero
    163c:	aa0f1d01 	swl	t7,7425(s0)
    1640:	06000001 	bltz	s0,1648 <_mem_avail_start-0x7fffe9b8>
    1644:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    1648:	0000019f 	0x19f
    164c:	00000c1b 	0xc1b
    1650:	c00afc10 	ll	t2,-1008(zero)
    1654:	000008bf 	0x8bf
    1658:	01b51100 	0x1b51100
    165c:	e0800000 	sc	zero,0(a0)
    1660:	007bfec0 	0x7bfec0
    1664:	c4180000 	lwc1	$f24,0(zero)
    1668:	04000008 	bltz	zero,168c <_mem_avail_start-0x7fffe974>
    166c:	d8bfc00b 	ldc2	$31,-16373(a1)
    1670:	01000001 	movf	zero,t0,$fcc0
    1674:	00070a28 	0x70a28
    1678:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    167c:	0c330000 	jal	cc0000 <_mem_avail_start-0x7f340000>
    1680:	d00f0000 	0xd00f0000
    1684:	47000008 	c1	0x1000008
    1688:	1900000c 	blez	t0,16bc <_mem_avail_start-0x7fffe944>
    168c:	00000188 	0x188
    1690:	bfc00b04 	cache	0x0,2820(s8)
    1694:	000001d8 	0x1d8
    1698:	aa0f1d01 	swl	t7,7425(s0)
    169c:	33000001 	andi	zero,t8,0x1
    16a0:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    16a4:	0000019f 	0x19f
    16a8:	00000c47 	0xc47
    16ac:	0001d81a 	0x1d81a
    16b0:	01b51100 	0x1b51100
    16b4:	e08c0000 	sc	t4,0(a0)
    16b8:	007bfec0 	0x7bfec0
    16bc:	c4160000 	lwc1	$f22,0(zero)
    16c0:	08000008 	j	20 <_mem_avail_start-0x7fffffe0>
    16c4:	04bfc00b 	0x4bfc00b
    16c8:	01000000 	0x1000000
    16cc:	00076626 	0x76626
    16d0:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    16d4:	0c5f0000 	jal	17c0000 <_mem_avail_start-0x7e840000>
    16d8:	d00f0000 	0xd00f0000
    16dc:	73000008 	0x73000008
    16e0:	0e00000c 	jal	8000030 <_mem_avail_start-0x77ffffd0>
    16e4:	00000188 	0x188
    16e8:	bfc00b08 	cache	0x0,2824(s8)
    16ec:	00000004 	sllv	zero,zero,zero
    16f0:	aa0f1d01 	swl	t7,7425(s0)
    16f4:	5f000001 	bgtzl	t8,16fc <_mem_avail_start-0x7fffe904>
    16f8:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    16fc:	0000019f 	0x19f
    1700:	00000c73 	tltu	zero,zero,0x31
    1704:	c00b0810 	ll	t3,2064(zero)
    1708:	000004bf 	0x4bf
    170c:	01b51100 	0x1b51100
    1710:	e0840000 	sc	a0,0(a0)
    1714:	007bfec0 	0x7bfec0
    1718:	c4160000 	lwc1	$f22,0(zero)
    171c:	10000008 	b	1740 <_mem_avail_start-0x7fffe8c0>
    1720:	04bfc00b 	0x4bfc00b
    1724:	01000000 	0x1000000
    1728:	0007c22a 	0x7c22a
    172c:	08db0f00 	j	36c3c00 <_mem_avail_start-0x7c93c400>
    1730:	0c8b0000 	jal	22c0000 <_mem_avail_start-0x7dd40000>
    1734:	d00f0000 	0xd00f0000
    1738:	9f000008 	0x9f000008
    173c:	0e00000c 	jal	8000030 <_mem_avail_start-0x77ffffd0>
    1740:	00000188 	0x188
    1744:	bfc00b10 	cache	0x0,2832(s8)
    1748:	00000004 	sllv	zero,zero,zero
    174c:	aa0f1d01 	swl	t7,7425(s0)
    1750:	8b000001 	lwl	zero,1(t8)
    1754:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    1758:	0000019f 	0x19f
    175c:	00000c9f 	0xc9f
    1760:	c00b1010 	ll	t3,4112(zero)
    1764:	000004bf 	0x4bf
    1768:	01b51100 	0x1b51100
    176c:	e0900000 	sc	s0,0(a0)
    1770:	007bfec0 	0x7bfec0
    1774:	c40e0000 	lwc1	$f14,0(zero)
    1778:	14000008 	bnez	zero,179c <_mem_avail_start-0x7fffe864>
    177c:	04bfc00b 	0x4bfc00b
    1780:	01000000 	0x1000000
    1784:	08db0f2c 	j	36c3cb0 <_mem_avail_start-0x7c93c350>
    1788:	0cb70000 	jal	2dc0000 <_mem_avail_start-0x7d240000>
    178c:	d00f0000 	0xd00f0000
    1790:	cb000008 	lwc2	$0,8(t8)
    1794:	0e00000c 	jal	8000030 <_mem_avail_start-0x77ffffd0>
    1798:	00000188 	0x188
    179c:	bfc00b14 	cache	0x0,2836(s8)
    17a0:	00000004 	sllv	zero,zero,zero
    17a4:	aa0f1d01 	swl	t7,7425(s0)
    17a8:	b7000001 	0xb7000001
    17ac:	0f00000c 	jal	c000030 <_mem_avail_start-0x73ffffd0>
    17b0:	0000019f 	0x19f
    17b4:	00000ccb 	0xccb
    17b8:	c00b1410 	ll	t3,5136(zero)
    17bc:	000004bf 	0x4bf
    17c0:	01b51100 	0x1b51100
    17c4:	e0840000 	sc	a0,0(a0)
    17c8:	007bfec0 	0x7bfec0
    17cc:	12000000 	beqz	s0,17d0 <_mem_avail_start-0x7fffe830>
    17d0:	000005e0 	0x5e0
    17d4:	00001d01 	0x1d01
    17d8:	000c0000 	sll	zero,t4,0x0
    17dc:	9c010000 	0x9c010000
    17e0:	0000087e 	0x87e
    17e4:	00020c13 	0x20c13
    17e8:	251d0100 	addiu	sp,t0,256
    17ec:	01000000 	0x1000000
    17f0:	055f1354 	0x55f1354
    17f4:	1d010000 	0x1d010000
    17f8:	000000c0 	ehb
    17fc:	cb0e5501 	lwc2	$14,21761(t8)
    1800:	00000000 	nop
    1804:	04000000 	bltz	zero,1808 <_mem_avail_start-0x7fffe7f8>
    1808:	01000000 	0x1000000
    180c:	00ed0f1d 	0xed0f1d
    1810:	0ce30000 	jal	38c0000 <_mem_avail_start-0x7c740000>
    1814:	e20f0000 	sc	t7,0(s0)
    1818:	f6000000 	sdc1	$f0,0(s0)
    181c:	1000000c 	b	1850 <_mem_avail_start-0x7fffe7b0>
    1820:	00000000 	nop
    1824:	00000004 	sllv	zero,zero,zero
    1828:	0000f81b 	0xf81b
    182c:	00540100 	0x540100
    1830:	541c0000 	bnel	zero,gp,1834 <_mem_avail_start-0x7fffe7cc>
    1834:	01000005 	0x1000005
    1838:	08a1011d 	j	2840474 <_mem_avail_start-0x7d7bfb8c>
    183c:	0c090000 	jal	240000 <_mem_avail_start-0x7fdc0000>
    1840:	01000002 	0x1000002
    1844:	0000251d 	0x251d
    1848:	055f0900 	0x55f0900
    184c:	1d010000 	0x1d010000
    1850:	000000b5 	0xb5
    1854:	05291c00 	tgeiu	t1,7168
    1858:	1d010000 	0x1d010000
    185c:	0008c401 	0x8c401
    1860:	020c0900 	0x20c0900
    1864:	1d010000 	0x1d010000
    1868:	00000025 	move	zero,zero
    186c:	00055f09 	0x55f09
    1870:	aa1d0100 	swl	sp,256(s0)
    1874:	00000000 	nop
    1878:	0005641c 	0x5641c
    187c:	011d0100 	0x11d0100
    1880:	000008e7 	0x8e7
    1884:	00020c09 	0x20c09
    1888:	251d0100 	addiu	sp,t0,256
    188c:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    1890:	0000055f 	0x55f
    1894:	009f1d01 	0x9f1d01
    1898:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    189c:	00000666 	0x666
    18a0:	00c01c01 	0xc01c01
    18a4:	00000000 	nop
    18a8:	000c0000 	sll	zero,t4,0x0
    18ac:	9c010000 	0x9c010000
    18b0:	00000938 	0x938
    18b4:	00020c13 	0x20c13
    18b8:	251c0100 	addiu	gp,t0,256
    18bc:	01000000 	0x1000000
    18c0:	01c70e54 	0x1c70e54
    18c4:	00000000 	nop
    18c8:	00040000 	sll	zero,a0,0x0
    18cc:	1c010000 	0x1c010000
    18d0:	0001e20f 	0x1e20f
    18d4:	000d0900 	sll	at,t5,0x4
    18d8:	00001000 	sll	v0,zero,0x0
    18dc:	00040000 	sll	zero,a0,0x0
    18e0:	ed1b0000 	swc3	$27,0(t0)
    18e4:	01000001 	movf	zero,t0,$fcc0
    18e8:	00000054 	0x54
    18ec:	0006c11d 	0x6c11d
    18f0:	b51c0100 	0xb51c0100
    18f4:	01000000 	0x1000000
    18f8:	00000954 	0x954
    18fc:	00020c09 	0x20c09
    1900:	251c0100 	addiu	gp,t0,256
    1904:	00000000 	nop
    1908:	00059c0d 	break	0x5,0x270
    190c:	aa1c0100 	swl	gp,256(s0)
    1910:	00000000 	nop
    1914:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    1918:	01000000 	0x1000000
    191c:	0009a19c 	0x9a19c
    1920:	020c1300 	0x20c1300
    1924:	1c010000 	0x1c010000
    1928:	00000025 	move	zero,zero
    192c:	2b0e5401 	slti	t6,t8,21505
    1930:	00000002 	srl	zero,zero,0x0
    1934:	04000000 	bltz	zero,1938 <_mem_avail_start-0x7fffe6c8>
    1938:	01000000 	0x1000000
    193c:	0246171c 	0x246171c
    1940:	00100000 	sll	zero,s0,0x0
    1944:	04000000 	bltz	zero,1948 <_mem_avail_start-0x7fffe6b8>
    1948:	1b000000 	blez	t8,194c <_mem_avail_start-0x7fffe6b4>
    194c:	00000251 	0x251
    1950:	00005401 	0x5401
    1954:	06ec1d00 	teqi	s7,7424
    1958:	1c010000 	0x1c010000
    195c:	0000009f 	0x9f
    1960:	0009bd01 	0x9bd01
    1964:	020c0900 	0x20c0900
    1968:	1c010000 	0x1c010000
    196c:	00000025 	move	zero,zero
    1970:	09a11e00 	j	6847800 <_mem_avail_start-0x797b8800>
    1974:	00000000 	nop
    1978:	000c0000 	sll	zero,t4,0x0
    197c:	9c010000 	0x9c010000
    1980:	000009fe 	0x9fe
    1984:	0009b11f 	0x9b11f
    1988:	0e540100 	jal	9500400 <_mem_avail_start-0x76affc00>
    198c:	0000025d 	0x25d
    1990:	00000000 	nop
    1994:	00000004 	sllv	zero,zero,zero
    1998:	78171c01 	0x78171c01
    199c:	10000002 	b	19a8 <_mem_avail_start-0x7fffe658>
    19a0:	00000000 	nop
    19a4:	00000004 	sllv	zero,zero,zero
    19a8:	0002831b 	0x2831b
    19ac:	00540100 	0x540100
    19b0:	381e0000 	xori	s8,zero,0x0
    19b4:	00000009 	jalr	zero,zero
    19b8:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    19bc:	01000000 	0x1000000
    19c0:	000a439c 	0xa439c
    19c4:	09481f00 	j	5207c00 <_mem_avail_start-0x7adf8400>
    19c8:	54010000 	bnel	zero,at,19cc <_mem_avail_start-0x7fffe634>
    19cc:	0001f90e 	0x1f90e
    19d0:	00000000 	nop
    19d4:	00000400 	sll	zero,zero,0x10
    19d8:	0f1c0100 	jal	c700400 <_mem_avail_start-0x738ffc00>
    19dc:	00000214 	0x214
    19e0:	00000d1c 	0xd1c
    19e4:	00000010 	mfhi	zero
    19e8:	00000400 	sll	zero,zero,0x10
    19ec:	021f1b00 	0x21f1b00
    19f0:	54010000 	bnel	zero,at,19f4 <_mem_avail_start-0x7fffe60c>
    19f4:	1e000000 	bgtz	s0,19f8 <_mem_avail_start-0x7fffe608>
    19f8:	000008c4 	0x8c4
    19fc:	00000000 	nop
    1a00:	0000000c 	syscall
    1a04:	0a989c01 	j	a627004 <_mem_avail_start-0x759d8ffc>
    1a08:	d01f0000 	0xd01f0000
    1a0c:	01000008 	jr	t0
    1a10:	08db1f54 	j	36c7d50 <_mem_avail_start-0x7c9382b0>
    1a14:	55010000 	bnel	t0,at,1a18 <_mem_avail_start-0x7fffe5e8>
    1a18:	0001880e 	0x1880e
    1a1c:	00000000 	nop
    1a20:	00000400 	sll	zero,zero,0x10
    1a24:	0f1d0100 	jal	c740400 <_mem_avail_start-0x738bfc00>
    1a28:	000001aa 	0x1aa
    1a2c:	00000d2f 	0xd2f
    1a30:	00019f0f 	0x19f0f
    1a34:	000d4200 	sll	t0,t5,0x8
    1a38:	00001000 	sll	v0,zero,0x0
    1a3c:	00040000 	sll	zero,a0,0x0
    1a40:	b51b0000 	0xb51b0000
    1a44:	01000001 	movf	zero,t0,$fcc0
    1a48:	00000054 	0x54
    1a4c:	0008a11e 	0x8a11e
    1a50:	00000000 	nop
    1a54:	00000c00 	sll	at,zero,0x10
    1a58:	ed9c0100 	swc3	$28,256(t4)
    1a5c:	1f00000a 	bgtz	t8,1a88 <_mem_avail_start-0x7fffe578>
    1a60:	000008ad 	0x8ad
    1a64:	b81f5401 	swr	ra,21505(zero)
    1a68:	01000008 	jr	t0
    1a6c:	01490e55 	0x1490e55
    1a70:	00000000 	nop
    1a74:	00040000 	sll	zero,a0,0x0
    1a78:	1d010000 	0x1d010000
    1a7c:	00016b0f 	0x16b0f
    1a80:	000d5500 	sll	t2,t5,0x14
    1a84:	01600f00 	0x1600f00
    1a88:	0d680000 	jal	5a00000 <_mem_avail_start-0x7a600000>
    1a8c:	00100000 	sll	zero,s0,0x0
    1a90:	04000000 	bltz	zero,1a94 <_mem_avail_start-0x7fffe56c>
    1a94:	1b000000 	blez	t8,1a98 <_mem_avail_start-0x7fffe568>
    1a98:	00000176 	tne	zero,zero,0x5
    1a9c:	00005401 	0x5401
    1aa0:	087e2000 	j	1f88000 <_mem_avail_start-0x7e078000>
    1aa4:	00000000 	nop
    1aa8:	000c0000 	sll	zero,t4,0x0
    1aac:	9c010000 	0x9c010000
    1ab0:	00088a1f 	0x88a1f
    1ab4:	1f540100 	0x1f540100
    1ab8:	00000895 	0x895
    1abc:	0a0e5501 	j	8395404 <_mem_avail_start-0x77c6abfc>
    1ac0:	00000001 	movf	zero,zero,$fcc0
    1ac4:	04000000 	bltz	zero,1ac8 <_mem_avail_start-0x7fffe538>
    1ac8:	01000000 	0x1000000
    1acc:	012c0f1d 	0x12c0f1d
    1ad0:	0d7b0000 	jal	5ec0000 <_mem_avail_start-0x7a140000>
    1ad4:	210f0000 	addi	t7,t0,0
    1ad8:	8e000001 	lw	zero,1(s0)
    1adc:	1000000d 	b	1b14 <_mem_avail_start-0x7fffe4ec>
    1ae0:	00000000 	nop
    1ae4:	00000004 	sllv	zero,zero,zero
    1ae8:	0001371b 	0x1371b
    1aec:	00540100 	0x540100
    1af0:	Address 0x0000000000001af0 is out of bounds.


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
  1c:	24030000 	li	v1,0
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	3e0b0b00 	0x3e0b0b00
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	0008030b 	0x8030b
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	00160400 	sll	zero,s6,0x10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
  30:	13490b3b 	beq	k0,t1,2d20 <_mem_avail_start-0x7fffd2e0>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	35050000 	ori	a1,t0,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	00134900 	sll	t1,s3,0x4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	012e0600 	0x12e0600
  40:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
  44:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	01111349 	0x1111349
  4c:	18400612 	blez	v0,1898 <_mem_avail_start-0x7fffe768>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	01194297 	0x1194297
  54:	07000013 	bltz	t8,a4 <_mem_avail_start-0x7fffff5c>
  58:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
  5c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	0d1c1349 	jal	4704d24 <_mem_avail_start-0x7b8fb2dc>
  64:	34080000 	li	t0,0x0
  68:	3a080300 	xori	t0,s0,0x300
  6c:	490b3b0b 	bc2tl	$cc2,ec9c <_mem_avail_start-0x7fff1364>
  70:	000d1c13 	0xd1c13
  74:	82890900 	lb	t1,2304(s4)
  78:	01110101 	0x1110101
  7c:	00001331 	tgeu	zero,zero,0x4c
  80:	01828a0a 	0x1828a0a
  84:	91180200 	lbu	t8,512(t0)
  88:	00001842 	srl	v1,zero,0x1
  8c:	0b000f0b 	j	c003c2c <_mem_avail_start-0x73ffc3d4>
  90:	0013490b 	0x13490b
  94:	002e0c00 	0x2e0c00
  98:	193c193f 	0x193c193f
  9c:	0e030e6e 	jal	80c39b8 <_mem_avail_start-0x77f3c648>
  a0:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
  a4:	01000000 	0x1000000
  a8:	06100011 	bltzal	s0,f0 <_mem_avail_start-0x7fffff10>
  ac:	01120111 	0x1120111
  b0:	0e1b0e03 	jal	86c380c <_mem_avail_start-0x7793c7f4>
  b4:	05130e25 	bgezall	t0,394c <_mem_avail_start-0x7fffc6b4>
  b8:	01000000 	0x1000000
  bc:	0e250111 	jal	8940444 <_mem_avail_start-0x776bfbbc>
  c0:	0e030b13 	jal	80c2c4c <_mem_avail_start-0x77f3d3b4>
  c4:	17550e1b 	bne	k0,s5,3934 <_mem_avail_start-0x7fffc6cc>
  c8:	17100111 	bne	t8,s0,510 <_mem_avail_start-0x7ffffaf0>
  cc:	24020000 	li	v0,0
  d0:	3e0b0b00 	0x3e0b0b00
  d4:	000e030b 	0xe030b
  d8:	00160300 	sll	zero,s6,0xc
  dc:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
  e0:	13490b3b 	beq	k0,t1,2dd0 <_mem_avail_start-0x7fffd230>
  e4:	26040000 	addiu	a0,s0,0
  e8:	00134900 	sll	t1,s3,0x4
  ec:	00240500 	0x240500
  f0:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
  f4:	00000803 	sra	at,zero,0x0
  f8:	49010106 	bc2t	514 <_mem_avail_start-0x7ffffaec>
  fc:	00130113 	0x130113
 100:	00210700 	0x210700
 104:	0b2f1349 	j	cbc4d24 <_mem_avail_start-0x7343b2dc>
 108:	0f080000 	jal	c200000 <_mem_avail_start-0x73e00000>
 10c:	490b0b00 	bc2tl	$cc2,2d10 <_mem_avail_start-0x7fffd2f0>
 110:	09000013 	j	400004c <_mem_avail_start-0x7bffffb4>
 114:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 118:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 11c:	193f1349 	0x193f1349
 120:	00001802 	srl	v1,zero,0x0
 124:	0b01130a 	j	c044c28 <_mem_avail_start-0x73fbb3d8>
 128:	3b0b3a0b 	xori	t3,t8,0x3a0b
 12c:	0013010b 	0x13010b
 130:	000d0b00 	sll	at,t5,0xc
 134:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 138:	13490b3b 	beq	k0,t1,2e28 <_mem_avail_start-0x7fffd1d8>
 13c:	00000b38 	0xb38
 140:	03000d0c 	syscall	0xc0034
 144:	3b0b3a08 	xori	t3,t8,0x3a08
 148:	3813490b 	xori	s3,zero,0x490b
 14c:	0d00000b 	jal	400002c <_mem_avail_start-0x7bffffd4>
 150:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 154:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 158:	193f1349 	0x193f1349
 15c:	0000193c 	0x193c
 160:	3f012e0e 	0x3f012e0e
 164:	3a0e0319 	xori	t6,s0,0x319
 168:	270b3b0b 	addiu	t3,t8,15115
 16c:	12011119 	beq	s0,at,45d4 <_mem_avail_start-0x7fffba2c>
 170:	97184006 	lhu	t8,16390(t8)
 174:	13011942 	beq	t8,at,6680 <_mem_avail_start-0x7fff9980>
 178:	050f0000 	0x50f0000
 17c:	3a080300 	xori	t0,s0,0x300
 180:	490b3b0b 	bc2tl	$cc2,edb0 <_mem_avail_start-0x7fff1250>
 184:	00170213 	0x170213
 188:	00051000 	sll	v0,a1,0x0
 18c:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 190:	13490b3b 	beq	k0,t1,2e80 <_mem_avail_start-0x7fffd180>
 194:	00001702 	srl	v0,zero,0x1c
 198:	11010b11 	beq	t0,at,2de0 <_mem_avail_start-0x7fffd220>
 19c:	01061201 	0x1061201
 1a0:	12000013 	beqz	s0,1f0 <_mem_avail_start-0x7ffffe10>
 1a4:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 1a8:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 1ac:	17021349 	bne	t8,v0,4ed4 <_mem_avail_start-0x7fffb12c>
 1b0:	34130000 	li	s3,0x0
 1b4:	3a080300 	xori	t0,s0,0x300
 1b8:	490b3b0b 	bc2tl	$cc2,ede8 <_mem_avail_start-0x7fff1218>
 1bc:	14000013 	bnez	zero,20c <_mem_avail_start-0x7ffffdf4>
 1c0:	1331011d 	beq	t9,s1,638 <_mem_avail_start-0x7ffff9c8>
 1c4:	06120111 	bltzall	s0,60c <_mem_avail_start-0x7ffff9f4>
 1c8:	0b590b58 	j	d642d60 <_mem_avail_start-0x729bd2a0>
 1cc:	00001301 	0x1301
 1d0:	11010b15 	beq	t0,at,2e28 <_mem_avail_start-0x7fffd1d8>
 1d4:	00061201 	0x61201
 1d8:	00341600 	0x341600
 1dc:	00001331 	tgeu	zero,zero,0x4c
 1e0:	01828917 	0x1828917
 1e4:	31011101 	andi	at,t0,0x1101
 1e8:	00130113 	0x130113
 1ec:	828a1800 	lb	t2,6144(s4)
 1f0:	18020001 	0x18020001
 1f4:	00184291 	0x184291
 1f8:	82891900 	lb	t1,6400(s4)
 1fc:	01110101 	0x1110101
 200:	00001331 	tgeu	zero,zero,0x4c
 204:	0182891a 	0x182891a
 208:	31011100 	andi	at,t0,0x1100
 20c:	1b000013 	blez	t8,25c <_mem_avail_start-0x7ffffda4>
 210:	01018289 	0x1018289
 214:	42950111 	c0	0x950111
 218:	00133119 	0x133119
 21c:	012e1c00 	0x12e1c00
 220:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 224:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 228:	06120111 	bltzall	s0,670 <_mem_avail_start-0x7ffff990>
 22c:	42971840 	c0	0x971840
 230:	00130119 	0x130119
 234:	010b1d00 	0x10b1d00
 238:	00001755 	0x1755
 23c:	0300341e 	0x300341e
 240:	3b0b3a08 	xori	t3,t8,0x3a08
 244:	0213490b 	0x213490b
 248:	1f000017 	bgtz	t8,2a8 <_mem_avail_start-0x7ffffd58>
 24c:	1755010b 	bne	k0,s5,67c <_mem_avail_start-0x7ffff984>
 250:	00001301 	0x1301
 254:	3f012e20 	0x3f012e20
 258:	3a0e0319 	xori	t6,s0,0x319
 25c:	490b3b0b 	bc2tl	$cc2,ee8c <_mem_avail_start-0x7fff1174>
 260:	010b2013 	0x10b2013
 264:	21000013 	addi	zero,t0,19
 268:	01018289 	0x1018289
 26c:	42950111 	c0	0x950111
 270:	01133119 	0x1133119
 274:	22000013 	addi	zero,s0,19
 278:	1331012e 	beq	t9,s1,734 <_mem_avail_start-0x7ffff8cc>
 27c:	06120111 	bltzall	s0,6c4 <_mem_avail_start-0x7ffff93c>
 280:	42971840 	c0	0x971840
 284:	00130119 	0x130119
 288:	00342300 	0x342300
 28c:	18021331 	0x18021331
 290:	2e240000 	sltiu	a0,s1,0
 294:	3c193f00 	lui	t9,0x3f00
 298:	030e6e19 	0x30e6e19
 29c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 2a0:	0000000b 	movn	zero,zero,zero
 2a4:	25011101 	addiu	at,t0,4353
 2a8:	030b130e 	0x30b130e
 2ac:	550e1b0e 	bnel	t0,t6,6ee8 <_mem_avail_start-0x7fff9118>
 2b0:	10011117 	beq	zero,at,4710 <_mem_avail_start-0x7fffb8f0>
 2b4:	02000017 	0x2000017
 2b8:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
 2bc:	24030000 	li	v1,0
 2c0:	3e0b0b00 	0x3e0b0b00
 2c4:	000e030b 	0xe030b
 2c8:	012e0400 	0x12e0400
 2cc:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 2d0:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 2d4:	13491927 	beq	k0,t1,6774 <_mem_avail_start-0x7fff988c>
 2d8:	06120111 	bltzall	s0,720 <_mem_avail_start-0x7ffff8e0>
 2dc:	42971840 	c0	0x971840
 2e0:	00130119 	0x130119
 2e4:	00050500 	sll	zero,a1,0x14
 2e8:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 2ec:	13490b3b 	beq	k0,t1,2fdc <_mem_avail_start-0x7fffd024>
 2f0:	00001702 	srl	v0,zero,0x1c
 2f4:	00001806 	srlv	v1,zero,zero
 2f8:	00340700 	0x340700
 2fc:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 300:	13490b3b 	beq	k0,t1,2ff0 <_mem_avail_start-0x7fffd010>
 304:	00001702 	srl	v0,zero,0x1c
 308:	03003408 	0x3003408
 30c:	3b0b3a08 	xori	t3,t8,0x3a08
 310:	0213490b 	0x213490b
 314:	09000018 	j	4000060 <_mem_avail_start-0x7bffffa0>
 318:	0e03000a 	jal	80c0028 <_mem_avail_start-0x77f3ffd8>
 31c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 320:	00000111 	0x111
 324:	55010b0a 	bnel	t0,at,2f50 <_mem_avail_start-0x7fffd0b0>
 328:	00130117 	0x130117
 32c:	012e0b00 	0x12e0b00
 330:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 334:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 338:	193c1349 	0x193c1349
 33c:	00001301 	0x1301
 340:	0182890c 	syscall	0x60a24
 344:	31011100 	andi	at,t0,0x1100
 348:	0d000013 	jal	400004c <_mem_avail_start-0x7bffffb4>
 34c:	01018289 	0x1018289
 350:	13310111 	beq	t9,s1,798 <_mem_avail_start-0x7ffff868>
 354:	00001301 	0x1301
 358:	01828a0e 	0x1828a0e
 35c:	91180200 	lbu	t8,512(t0)
 360:	00001842 	srl	v1,zero,0x1
 364:	0182890f 	0x182890f
 368:	31011101 	andi	at,t0,0x1101
 36c:	10000013 	b	3bc <_mem_avail_start-0x7ffffc44>
 370:	1755010b 	bne	k0,s5,7a0 <_mem_avail_start-0x7ffff860>
 374:	0b110000 	j	c440000 <_mem_avail_start-0x73bc0000>
 378:	12011101 	beq	s0,at,4780 <_mem_avail_start-0x7fffb880>
 37c:	00130106 	0x130106
 380:	00241200 	0x241200
 384:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 388:	00000803 	sra	at,zero,0x0
 38c:	0b000f13 	j	c003c4c <_mem_avail_start-0x73ffc3b4>
 390:	0013490b 	0x13490b
 394:	00261400 	0x261400
 398:	00001349 	0x1349
 39c:	3f002e15 	0x3f002e15
 3a0:	6e193c19 	0x6e193c19
 3a4:	3a0e030e 	xori	t6,s0,0x30e
 3a8:	000b3b0b 	0xb3b0b
 3ac:	11010000 	beq	t0,at,3b0 <_mem_avail_start-0x7ffffc50>
 3b0:	130e2501 	beq	t8,t6,97b8 <_mem_avail_start-0x7fff6848>
 3b4:	1b0e030b 	0x1b0e030b
 3b8:	1117550e 	beq	t0,s7,157f4 <_mem_avail_start-0x7ffea80c>
 3bc:	00171001 	0x171001
 3c0:	00240200 	0x240200
 3c4:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 3c8:	00000e03 	sra	at,zero,0x18
 3cc:	3f012e03 	0x3f012e03
 3d0:	3a0e0319 	xori	t6,s0,0x319
 3d4:	270b3b0b 	addiu	t3,t8,15115
 3d8:	11134919 	beq	t0,s3,12840 <_mem_avail_start-0x7ffed7c0>
 3dc:	40061201 	0x40061201
 3e0:	19429718 	0x19429718
 3e4:	00001301 	0x1301
 3e8:	03000504 	0x3000504
 3ec:	3b0b3a08 	xori	t3,t8,0x3a08
 3f0:	0213490b 	0x213490b
 3f4:	05000017 	bltz	t0,454 <_mem_avail_start-0x7ffffbac>
 3f8:	0e030005 	jal	80c0014 <_mem_avail_start-0x77f3ffec>
 3fc:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 400:	17021349 	bne	t8,v0,5128 <_mem_avail_start-0x7fffaed8>
 404:	34060000 	li	a2,0x0
 408:	3a080300 	xori	t0,s0,0x300
 40c:	490b3b0b 	bc2tl	$cc2,f03c <_mem_avail_start-0x7fff0fc4>
 410:	00170213 	0x170213
 414:	00340700 	0x340700
 418:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 41c:	13490b3b 	beq	k0,t1,310c <_mem_avail_start-0x7fffcef4>
 420:	00001802 	srl	v1,zero,0x0
 424:	03003408 	0x3003408
 428:	3b0b3a0e 	xori	t3,t8,0x3a0e
 42c:	0213490b 	0x213490b
 430:	09000017 	j	400005c <_mem_avail_start-0x7bffffa4>
 434:	0111010b 	0x111010b
 438:	13010612 	beq	t8,at,1c84 <_mem_avail_start-0x7fffe37c>
 43c:	2e0a0000 	sltiu	t2,s0,0
 440:	03193f01 	0x3193f01
 444:	3b0b3a0e 	xori	t3,t8,0x3a0e
 448:	3c13490b 	lui	s3,0x490b
 44c:	00130119 	0x130119
 450:	00180b00 	sll	at,t8,0xc
 454:	890c0000 	lwl	t4,0(t0)
 458:	11010182 	beq	t0,at,a64 <_mem_avail_start-0x7ffff59c>
 45c:	00133101 	0x133101
 460:	828a0d00 	lb	t2,3328(s4)
 464:	18020001 	0x18020001
 468:	00184291 	0x184291
 46c:	010b0e00 	0x10b0e00
 470:	06120111 	bltzall	s0,8b8 <_mem_avail_start-0x7ffff748>
 474:	890f0000 	lwl	t7,0(t0)
 478:	11000182 	beqz	t0,a84 <_mem_avail_start-0x7ffff57c>
 47c:	00133101 	0x133101
 480:	00241000 	0x241000
 484:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 488:	00000803 	sra	at,zero,0x0
 48c:	49010111 	bc2t	8d4 <_mem_avail_start-0x7ffff72c>
 490:	00130113 	0x130113
 494:	00211200 	0x211200
 498:	0b2f1349 	j	cbc4d24 <_mem_avail_start-0x7343b2dc>
 49c:	2e130000 	sltiu	s3,s0,0
 4a0:	3c193f00 	lui	t9,0x3f00
 4a4:	030e6e19 	0x30e6e19
 4a8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 4ac:	0000000b 	movn	zero,zero,zero
 4b0:	25011101 	addiu	at,t0,4353
 4b4:	030b130e 	0x30b130e
 4b8:	550e1b0e 	bnel	t0,t6,70f4 <_mem_avail_start-0x7fff8f0c>
 4bc:	10011117 	beq	zero,at,491c <_mem_avail_start-0x7fffb6e4>
 4c0:	02000017 	0x2000017
 4c4:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
 4c8:	24030000 	li	v1,0
 4cc:	3e0b0b00 	0x3e0b0b00
 4d0:	000e030b 	0xe030b
 4d4:	00160400 	sll	zero,s6,0x10
 4d8:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 4dc:	13490b3b 	beq	k0,t1,31cc <_mem_avail_start-0x7fffce34>
 4e0:	2e050000 	sltiu	a1,s0,0
 4e4:	03193f01 	0x3193f01
 4e8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 4ec:	11192705 	beq	t0,t9,a104 <_mem_avail_start-0x7fff5efc>
 4f0:	40061201 	0x40061201
 4f4:	19429718 	0x19429718
 4f8:	00001301 	0x1301
 4fc:	03000506 	0x3000506
 500:	3b0b3a08 	xori	t3,t8,0x3a08
 504:	02134905 	0x2134905
 508:	07000018 	bltz	t8,56c <_mem_avail_start-0x7ffffa94>
 50c:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 510:	053b0b3a 	0x53b0b3a
 514:	17021349 	bne	t8,v0,523c <_mem_avail_start-0x7fffadc4>
 518:	89080000 	lwl	t0,0(t0)
 51c:	11010182 	beq	t0,at,b28 <_mem_avail_start-0x7ffff4d8>
 520:	19429501 	0x19429501
 524:	00001331 	tgeu	zero,zero,0x4c
 528:	01828a09 	0x1828a09
 52c:	91180200 	lbu	t8,512(t0)
 530:	00001842 	srl	v1,zero,0x1
 534:	3f012e0a 	0x3f012e0a
 538:	3a0e0319 	xori	t6,s0,0x319
 53c:	27053b0b 	addiu	a1,t8,15115
 540:	11134919 	beq	t0,s3,129a8 <_mem_avail_start-0x7ffed658>
 544:	40061201 	0x40061201
 548:	19429718 	0x19429718
 54c:	00001301 	0x1301
 550:	0300340b 	0x300340b
 554:	3b0b3a08 	xori	t3,t8,0x3a08
 558:	02134905 	0x2134905
 55c:	0c000018 	jal	60 <_mem_avail_start-0x7fffffa0>
 560:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 564:	08030b3e 	j	c2cf8 <_mem_avail_start-0x7ff3d308>
 568:	0f0d0000 	jal	c340000 <_mem_avail_start-0x73cc0000>
 56c:	490b0b00 	bc2tl	$cc2,3170 <_mem_avail_start-0x7fffce90>
 570:	0e000013 	jal	800004c <_mem_avail_start-0x77ffffb4>
 574:	00000026 	xor	zero,zero,zero
 578:	4900260f 	bc2f	9db8 <_mem_avail_start-0x7fff6248>
 57c:	10000013 	b	5cc <_mem_avail_start-0x7ffffa34>
 580:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 584:	053b0b3a 	0x53b0b3a
 588:	17021349 	bne	t8,v0,52b0 <_mem_avail_start-0x7fffad50>
 58c:	2e110000 	sltiu	s1,s0,0
 590:	03193f01 	0x3193f01
 594:	3b0b3a0e 	xori	t3,t8,0x3a0e
 598:	4919270b 	bc2t	$cc6,a1c8 <_mem_avail_start-0x7fff5e38>
 59c:	12011113 	beq	s0,at,49ec <_mem_avail_start-0x7fffb614>
 5a0:	97184006 	lhu	t8,16390(t8)
 5a4:	13011942 	beq	t8,at,6ab0 <_mem_avail_start-0x7fff9550>
 5a8:	05120000 	bltzall	t0,5ac <_mem_avail_start-0x7ffffa54>
 5ac:	3a080300 	xori	t0,s0,0x300
 5b0:	490b3b0b 	bc2tl	$cc2,f1e0 <_mem_avail_start-0x7fff0e20>
 5b4:	00170213 	0x170213
 5b8:	00051300 	sll	v0,a1,0xc
 5bc:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 5c0:	13490b3b 	beq	k0,t1,32b0 <_mem_avail_start-0x7fffcd50>
 5c4:	00001802 	srl	v1,zero,0x0
 5c8:	03003414 	0x3003414
 5cc:	3b0b3a08 	xori	t3,t8,0x3a08
 5d0:	0213490b 	0x213490b
 5d4:	15000017 	bnez	t0,634 <_mem_avail_start-0x7ffff9cc>
 5d8:	193f012e 	0x193f012e
 5dc:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 5e0:	19270b3b 	0x19270b3b
 5e4:	01111349 	0x1111349
 5e8:	18400612 	blez	v0,1e34 <_mem_avail_start-0x7fffe1cc>
 5ec:	00194297 	0x194297
 5f0:	11010000 	beq	t0,at,5f4 <_mem_avail_start-0x7ffffa0c>
 5f4:	130e2501 	beq	t8,t6,99fc <_mem_avail_start-0x7fff6604>
 5f8:	1b0e030b 	0x1b0e030b
 5fc:	1117550e 	beq	t0,s7,15a38 <_mem_avail_start-0x7ffea5c8>
 600:	00171001 	0x171001
 604:	00240200 	0x240200
 608:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 60c:	00000e03 	sra	at,zero,0x18
 610:	3f012e03 	0x3f012e03
 614:	3a0e0319 	xori	t6,s0,0x319
 618:	270b3b0b 	addiu	t3,t8,15115
 61c:	11134919 	beq	t0,s3,12a84 <_mem_avail_start-0x7ffed57c>
 620:	40061201 	0x40061201
 624:	19429718 	0x19429718
 628:	00001301 	0x1301
 62c:	03000504 	0x3000504
 630:	3b0b3a08 	xori	t3,t8,0x3a08
 634:	0213490b 	0x213490b
 638:	05000017 	bltz	t0,698 <_mem_avail_start-0x7ffff968>
 63c:	193f012e 	0x193f012e
 640:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 644:	13490b3b 	beq	k0,t1,3334 <_mem_avail_start-0x7fffcccc>
 648:	1301193c 	beq	t8,at,6b3c <_mem_avail_start-0x7fff94c4>
 64c:	18060000 	0x18060000
 650:	07000000 	bltz	t8,654 <_mem_avail_start-0x7ffff9ac>
 654:	01018289 	0x1018289
 658:	13310111 	beq	t9,s1,aa0 <_mem_avail_start-0x7ffff560>
 65c:	00001301 	0x1301
 660:	01828a08 	0x1828a08
 664:	91180200 	lbu	t8,512(t0)
 668:	00001842 	srl	v1,zero,0x1
 66c:	01828909 	0x1828909
 670:	31011101 	andi	at,t0,0x1101
 674:	0a000013 	j	800004c <_mem_avail_start-0x77ffffb4>
 678:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 67c:	08030b3e 	j	c2cf8 <_mem_avail_start-0x7ff3d308>
 680:	0f0b0000 	jal	c2c0000 <_mem_avail_start-0x73d40000>
 684:	490b0b00 	bc2tl	$cc2,3288 <_mem_avail_start-0x7fffcd78>
 688:	0c000013 	jal	4c <_mem_avail_start-0x7fffffb4>
 68c:	13490026 	beq	k0,t1,728 <_mem_avail_start-0x7ffff8d8>
 690:	340d0000 	li	t5,0x0
 694:	3a080300 	xori	t0,s0,0x300
 698:	490b3b0b 	bc2tl	$cc2,f2c8 <_mem_avail_start-0x7fff0d38>
 69c:	00170213 	0x170213
 6a0:	010b0e00 	0x10b0e00
 6a4:	00001755 	0x1755
 6a8:	11010b0f 	beq	t0,at,32e8 <_mem_avail_start-0x7fffcd18>
 6ac:	01061201 	0x1061201
 6b0:	10000013 	b	700 <_mem_avail_start-0x7ffff900>
 6b4:	193f002e 	0x193f002e
 6b8:	0e6e193c 	jal	9b864f0 <_mem_avail_start-0x76479b10>
 6bc:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 6c0:	00000b3b 	0xb3b
 6c4:	01110100 	0x1110100
 6c8:	0b130e25 	j	c4c3894 <_mem_avail_start-0x73b3c76c>
 6cc:	0e1b0e03 	jal	86c380c <_mem_avail_start-0x7793c7f4>
 6d0:	01111755 	0x1111755
 6d4:	00001710 	0x1710
 6d8:	0b002402 	j	c009008 <_mem_avail_start-0x73ff6ff8>
 6dc:	030b3e0b 	0x30b3e0b
 6e0:	0300000e 	0x300000e
 6e4:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 6e8:	08030b3e 	j	c2cf8 <_mem_avail_start-0x7ff3d308>
 6ec:	16040000 	bne	s0,a0,6f0 <_mem_avail_start-0x7ffff910>
 6f0:	3a0e0300 	xori	t6,s0,0x300
 6f4:	490b3b0b 	bc2tl	$cc2,f324 <_mem_avail_start-0x7fff0cdc>
 6f8:	05000013 	bltz	t0,748 <_mem_avail_start-0x7ffff8b8>
 6fc:	193f012e 	0x193f012e
 700:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 704:	19270b3b 	0x19270b3b
 708:	01111349 	0x1111349
 70c:	18400612 	blez	v0,1f58 <_mem_avail_start-0x7fffe0a8>
 710:	01194297 	0x1194297
 714:	06000013 	bltz	s0,764 <_mem_avail_start-0x7ffff89c>
 718:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 71c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 720:	17021349 	bne	t8,v0,5448 <_mem_avail_start-0x7fffabb8>
 724:	89070000 	lwl	a3,0(t0)
 728:	11010182 	beq	t0,at,d34 <_mem_avail_start-0x7ffff2cc>
 72c:	00133101 	0x133101
 730:	828a0800 	lb	t2,2048(s4)
 734:	18020001 	0x18020001
 738:	00184291 	0x184291
 73c:	002e0900 	0x2e0900
 740:	193c193f 	0x193c193f
 744:	0e030e6e 	jal	80c39b8 <_mem_avail_start-0x77f3c648>
 748:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 74c:	01000000 	0x1000000
 750:	0e250111 	jal	8940444 <_mem_avail_start-0x776bfbbc>
 754:	0e030b13 	jal	80c2c4c <_mem_avail_start-0x77f3d3b4>
 758:	17550e1b 	bne	k0,s5,3fc8 <_mem_avail_start-0x7fffc038>
 75c:	17100111 	bne	t8,s0,ba4 <_mem_avail_start-0x7ffff45c>
 760:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
 764:	000b0b00 	sll	at,t3,0xc
 768:	00240300 	0x240300
 76c:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 770:	00000e03 	sra	at,zero,0x18
 774:	49003504 	bc2f	db88 <_mem_avail_start-0x7fff2478>
 778:	05000013 	bltz	t0,7c8 <_mem_avail_start-0x7ffff838>
 77c:	0e030016 	jal	80c0058 <_mem_avail_start-0x77f3ffa8>
 780:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 784:	00001349 	0x1349
 788:	0b002406 	j	c009018 <_mem_avail_start-0x73ff6fe8>
 78c:	030b3e0b 	0x30b3e0b
 790:	07000008 	bltz	t8,7b4 <_mem_avail_start-0x7ffff84c>
 794:	193f012e 	0x193f012e
 798:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 79c:	0e6e0b3b 	jal	9b82cec <_mem_avail_start-0x7647d314>
 7a0:	13010b20 	beq	t8,at,3424 <_mem_avail_start-0x7fffcbdc>
 7a4:	2f080000 	sltiu	t0,t8,0
 7a8:	49080300 	bc2f	$cc2,13ac <_mem_avail_start-0x7fffec54>
 7ac:	09000013 	j	400004c <_mem_avail_start-0x7bffffb4>
 7b0:	0e030005 	jal	80c0014 <_mem_avail_start-0x77f3ffec>
 7b4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 7b8:	00001349 	0x1349
 7bc:	0300340a 	0x300340a
 7c0:	3b0b3a08 	xori	t3,t8,0x3a08
 7c4:	0013490b 	0x13490b
 7c8:	000f0b00 	sll	at,t7,0xc
 7cc:	13490b0b 	beq	k0,t1,33fc <_mem_avail_start-0x7fffcc04>
 7d0:	2e0c0000 	sltiu	t4,s0,0
 7d4:	03193f01 	0x3193f01
 7d8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 7dc:	490e6e0b 	bc2fl	$cc3,1c00c <_mem_avail_start-0x7ffe3ff4>
 7e0:	010b2013 	0x10b2013
 7e4:	0d000013 	jal	400004c <_mem_avail_start-0x7bffffb4>
 7e8:	193f012e 	0x193f012e
 7ec:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 7f0:	13490b3b 	beq	k0,t1,34e0 <_mem_avail_start-0x7fffcb20>
 7f4:	06120111 	bltzall	s0,c3c <_mem_avail_start-0x7ffff3c4>
 7f8:	42971840 	c0	0x971840
 7fc:	00130119 	0x130119
 800:	011d0e00 	0x11d0e00
 804:	01111331 	tgeu	t0,s1,0x4c
 808:	0b580612 	j	d601848 <_mem_avail_start-0x729fe7b8>
 80c:	00000b59 	0xb59
 810:	3100050f 	andi	zero,t0,0x50f
 814:	00170213 	0x170213
 818:	010b1000 	0x10b1000
 81c:	06120111 	bltzall	s0,c64 <_mem_avail_start-0x7ffff39c>
 820:	34110000 	li	s1,0x0
 824:	1c133100 	0x1c133100
 828:	1200000d 	beqz	s0,860 <_mem_avail_start-0x7ffff7a0>
 82c:	193f012e 	0x193f012e
 830:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 834:	01110b3b 	0x1110b3b
 838:	18400612 	blez	v0,2084 <_mem_avail_start-0x7fffdf7c>
 83c:	01194297 	0x1194297
 840:	13000013 	beqz	t8,890 <_mem_avail_start-0x7ffff770>
 844:	0e030005 	jal	80c0014 <_mem_avail_start-0x77f3ffec>
 848:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 84c:	18021349 	0x18021349
 850:	34140000 	li	s4,0x0
 854:	3a0e0300 	xori	t6,s0,0x300
 858:	490b3b0b 	bc2tl	$cc2,f488 <_mem_avail_start-0x7fff0b78>
 85c:	00170213 	0x170213
 860:	82891500 	lb	t1,5376(s4)
 864:	01110001 	movt	zero,t0,$fcc4
 868:	00001331 	tgeu	zero,zero,0x4c
 86c:	31011d16 	andi	at,t0,0x1d16
 870:	12011113 	beq	s0,at,4cc0 <_mem_avail_start-0x7fffb340>
 874:	590b5806 	0x590b5806
 878:	0013010b 	0x13010b
 87c:	00051700 	sll	v0,a1,0x1c
 880:	00001331 	tgeu	zero,zero,0x4c
 884:	31011d18 	andi	at,t0,0x1d18
 888:	55015213 	bnel	t0,at,150d8 <_mem_avail_start-0x7ffeaf28>
 88c:	590b5817 	0x590b5817
 890:	0013010b 	0x13010b
 894:	011d1900 	0x11d1900
 898:	01521331 	tgeu	t2,s2,0x4c
 89c:	0b581755 	j	d605d54 <_mem_avail_start-0x729fa2ac>
 8a0:	00000b59 	0xb59
 8a4:	55010b1a 	bnel	t0,at,3510 <_mem_avail_start-0x7fffcaf0>
 8a8:	1b000017 	blez	t8,908 <_mem_avail_start-0x7ffff6f8>
 8ac:	13310034 	beq	t9,s1,980 <_mem_avail_start-0x7ffff680>
 8b0:	00001802 	srl	v1,zero,0x0
 8b4:	3f012e1c 	0x3f012e1c
 8b8:	3a0e0319 	xori	t6,s0,0x319
 8bc:	200b3b0b 	addi	t3,zero,15115
 8c0:	0013010b 	0x13010b
 8c4:	012e1d00 	0x12e1d00
 8c8:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 8cc:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 8d0:	0b201349 	j	c804d24 <_mem_avail_start-0x737fb2dc>
 8d4:	00001301 	0x1301
 8d8:	31012e1e 	andi	at,t0,0x2e1e
 8dc:	12011113 	beq	s0,at,4d2c <_mem_avail_start-0x7fffb2d4>
 8e0:	97184006 	lhu	t8,16390(t8)
 8e4:	13011942 	beq	t8,at,6df0 <_mem_avail_start-0x7fff9210>
 8e8:	051f0000 	0x51f0000
 8ec:	02133100 	0x2133100
 8f0:	20000018 	addi	zero,zero,24
 8f4:	1331012e 	beq	t9,s1,db0 <_mem_avail_start-0x7ffff250>
 8f8:	06120111 	bltzall	s0,d40 <_mem_avail_start-0x7ffff2c0>
 8fc:	42971840 	c0	0x971840
 900:	00000019 	multu	zero,zero

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	0000001c 	0x1c
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
  14:	00000040 	ssnop
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  20:	0000001c 	0x1c
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	00ea0002 	0xea0002
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	00040000 	sll	zero,a0,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	00000000 	nop
  30:	bfc00000 	cache	0x0,0(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	00000450 	0x450
	...
  40:	00000044 	0x44
  44:	01100002 	0x1100002
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	bfc00490 	cache	0x0,1168(s8)
  54:	000000c8 	0xc8
  58:	00000000 	nop
  5c:	0000000c 	syscall
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00000000 	nop
  64:	0000000c 	syscall
  68:	bfc00558 	cache	0x0,1368(s8)
  6c:	00000098 	0x98
  70:	bfc005f0 	cache	0x0,1520(s8)
  74:	00000068 	0x68
  78:	bfc00658 	cache	0x0,1624(s8)
  7c:	000000b4 	teq	zero,zero,0x2
	...
  88:	0000001c 	0x1c
  8c:	06800002 	bltz	s4,98 <_mem_avail_start-0x7fffff68>
  90:	00040000 	sll	zero,a0,0x0
  94:	00000000 	nop
  98:	bfc0070c 	cache	0x0,1804(s8)
  9c:	00000224 	0x224
	...
  a8:	0000001c 	0x1c
  ac:	08460002 	j	1180008 <_mem_avail_start-0x7ee7fff8>
  b0:	00040000 	sll	zero,a0,0x0
  b4:	00000000 	nop
  b8:	bfc00930 	cache	0x0,2352(s8)
  bc:	000000d8 	0xd8
	...
  c8:	0000007c 	0x7c
  cc:	09940002 	j	6500008 <_mem_avail_start-0x79affff8>
  d0:	00040000 	sll	zero,a0,0x0
	...
  dc:	00000020 	add	zero,zero,zero
  e0:	00000000 	nop
  e4:	00000028 	0x28
  e8:	00000000 	nop
  ec:	00000024 	and	zero,zero,zero
  f0:	00000000 	nop
  f4:	00000034 	teq	zero,zero
  f8:	00000000 	nop
  fc:	00000030 	tge	zero,zero
 100:	00000000 	nop
 104:	00000044 	0x44
 108:	00000000 	nop
 10c:	0000002c 	0x2c
 110:	00000000 	nop
 114:	00000028 	0x28
 118:	bfc00a08 	cache	0x0,2568(s8)
 11c:	00000024 	and	zero,zero,zero
 120:	00000000 	nop
 124:	0000002c 	0x2c
 128:	00000000 	nop
 12c:	00000070 	tge	zero,zero,0x1
 130:	00000000 	nop
 134:	00000040 	ssnop
 138:	00000000 	nop
 13c:	0000000c 	syscall
	...
 148:	00000024 	and	zero,zero,zero
 14c:	0dae0002 	jal	6b80008 <_mem_avail_start-0x7947fff8>
 150:	00040000 	sll	zero,a0,0x0
 154:	00000000 	nop
 158:	bfc00a2c 	cache	0x0,2604(s8)
 15c:	00000060 	0x60
 160:	bfc00a8c 	cache	0x0,2700(s8)
 164:	00000030 	tge	zero,zero
	...
 170:	0000001c 	0x1c
 174:	0efe0002 	jal	bf80008 <_mem_avail_start-0x7407fff8>
 178:	00040000 	sll	zero,a0,0x0
 17c:	00000000 	nop
 180:	bfc00abc 	cache	0x0,2748(s8)
 184:	0000002c 	0x2c
	...
 190:	0000008c 	syscall	0x2
 194:	0fb40002 	jal	ed00008 <_mem_avail_start-0x712ffff8>
 198:	00040000 	sll	zero,a0,0x0
	...
 1a4:	0000000c 	syscall
 1a8:	00000000 	nop
 1ac:	0000000c 	syscall
 1b0:	00000000 	nop
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
 1e0:	bfc00ae8 	cache	0x0,2792(s8)
 1e4:	00000038 	0x38
 1e8:	00000000 	nop
 1ec:	00000020 	add	zero,zero,zero
 1f0:	bfc00b20 	cache	0x0,2848(s8)
 1f4:	00000020 	add	zero,zero,zero
 1f8:	00000000 	nop
 1fc:	00000048 	0x48
 200:	bfc00b40 	cache	0x0,2880(s8)
 204:	00000014 	0x14
 208:	bfc00b54 	cache	0x0,2900(s8)
 20c:	00000014 	0x14
 210:	00000000 	nop
 214:	00000014 	0x14
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	bfc00450 	cache	0x0,1104(s8)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	bfc00490 	cache	0x0,1168(s8)
	...
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	bfc00560 	cache	0x0,1376(s8)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	bfc00564 	cache	0x0,1380(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	bfc00580 	cache	0x0,1408(s8)
  1c:	bfc005a8 	cache	0x0,1448(s8)
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  28:	bfc005f8 	cache	0x0,1528(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	bfc005fc 	cache	0x0,1532(s8)
  30:	bfc0060c 	cache	0x0,1548(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	bfc00644 	cache	0x0,1604(s8)
	...
  40:	bfc005f8 	cache	0x0,1528(s8)
  44:	bfc005fc 	cache	0x0,1532(s8)
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	bfc0060c 	cache	0x0,1548(s8)
  4c:	bfc00610 	cache	0x0,1552(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	bfc00614 	cache	0x0,1556(s8)
  54:	bfc0063c 	cache	0x0,1596(s8)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	bfc00490 	cache	0x0,1168(s8)
  64:	bfc00558 	cache	0x0,1368(s8)
  68:	00000001 	movf	zero,zero,$fcc0
  6c:	00000001 	movf	zero,zero,$fcc0
  70:	00000001 	movf	zero,zero,$fcc0
  74:	00000001 	movf	zero,zero,$fcc0
  78:	bfc00558 	cache	0x0,1368(s8)
  7c:	bfc005f0 	cache	0x0,1520(s8)
  80:	bfc005f0 	cache	0x0,1520(s8)
  84:	bfc00658 	cache	0x0,1624(s8)
  88:	bfc00658 	cache	0x0,1624(s8)
  8c:	bfc0070c 	cache	0x0,1804(s8)
	...
  98:	bfc00744 	cache	0x0,1860(s8)
  9c:	bfc00748 	cache	0x0,1864(s8)
  a0:	bfc007cc 	cache	0x0,1996(s8)
  a4:	bfc007dc 	cache	0x0,2012(s8)
  a8:	bfc00918 	cache	0x0,2328(s8)
  ac:	bfc00928 	cache	0x0,2344(s8)
	...
  b8:	bfc007c8 	cache	0x0,1992(s8)
  bc:	bfc007cc 	cache	0x0,1996(s8)
  c0:	bfc007f4 	cache	0x0,2036(s8)
  c4:	bfc007fc 	cache	0x0,2044(s8)
  c8:	bfc00850 	cache	0x0,2128(s8)
  cc:	bfc00860 	cache	0x0,2144(s8)
  d0:	bfc0086c 	cache	0x0,2156(s8)
  d4:	bfc0087c 	cache	0x0,2172(s8)
  d8:	bfc00884 	cache	0x0,2180(s8)
  dc:	bfc008c0 	cache	0x0,2240(s8)
  e0:	bfc008c8 	cache	0x0,2248(s8)
  e4:	bfc008cc 	cache	0x0,2252(s8)
  e8:	bfc008d4 	cache	0x0,2260(s8)
  ec:	bfc008dc 	cache	0x0,2268(s8)
  f0:	bfc008e4 	cache	0x0,2276(s8)
  f4:	bfc008e8 	cache	0x0,2280(s8)
  f8:	bfc008ec 	cache	0x0,2284(s8)
  fc:	bfc00910 	cache	0x0,2320(s8)
	...
 108:	bfc0070c 	cache	0x0,1804(s8)
 10c:	bfc00930 	cache	0x0,2352(s8)
	...
 118:	bfc00930 	cache	0x0,2352(s8)
 11c:	bfc00a08 	cache	0x0,2568(s8)
	...
 128:	00000001 	movf	zero,zero,$fcc0
 12c:	00000001 	movf	zero,zero,$fcc0
 130:	00000001 	movf	zero,zero,$fcc0
 134:	00000001 	movf	zero,zero,$fcc0
 138:	00000001 	movf	zero,zero,$fcc0
 13c:	00000001 	movf	zero,zero,$fcc0
 140:	00000001 	movf	zero,zero,$fcc0
 144:	00000001 	movf	zero,zero,$fcc0
 148:	00000001 	movf	zero,zero,$fcc0
 14c:	00000001 	movf	zero,zero,$fcc0
 150:	00000001 	movf	zero,zero,$fcc0
 154:	00000001 	movf	zero,zero,$fcc0
 158:	00000001 	movf	zero,zero,$fcc0
 15c:	00000001 	movf	zero,zero,$fcc0
 160:	00000001 	movf	zero,zero,$fcc0
 164:	00000001 	movf	zero,zero,$fcc0
 168:	bfc00a08 	cache	0x0,2568(s8)
 16c:	bfc00a2c 	cache	0x0,2604(s8)
 170:	00000001 	movf	zero,zero,$fcc0
 174:	00000001 	movf	zero,zero,$fcc0
 178:	00000001 	movf	zero,zero,$fcc0
 17c:	00000001 	movf	zero,zero,$fcc0
 180:	00000001 	movf	zero,zero,$fcc0
 184:	00000001 	movf	zero,zero,$fcc0
 188:	00000001 	movf	zero,zero,$fcc0
 18c:	00000001 	movf	zero,zero,$fcc0
	...
 198:	bfc00a44 	cache	0x0,2628(s8)
 19c:	bfc00a48 	cache	0x0,2632(s8)
 1a0:	bfc00a6c 	cache	0x0,2668(s8)
 1a4:	bfc00a84 	cache	0x0,2692(s8)
	...
 1b0:	bfc00a2c 	cache	0x0,2604(s8)
 1b4:	bfc00a8c 	cache	0x0,2700(s8)
 1b8:	bfc00a8c 	cache	0x0,2700(s8)
 1bc:	bfc00abc 	cache	0x0,2748(s8)
	...
 1c8:	bfc00abc 	cache	0x0,2748(s8)
 1cc:	bfc00ae8 	cache	0x0,2792(s8)
	...
 1d8:	bfc00b04 	cache	0x0,2820(s8)
 1dc:	bfc00b08 	cache	0x0,2824(s8)
 1e0:	bfc00b0c 	cache	0x0,2828(s8)
 1e4:	bfc00b10 	cache	0x0,2832(s8)
	...
 1f0:	00000001 	movf	zero,zero,$fcc0
 1f4:	00000001 	movf	zero,zero,$fcc0
 1f8:	00000001 	movf	zero,zero,$fcc0
 1fc:	00000001 	movf	zero,zero,$fcc0
 200:	00000001 	movf	zero,zero,$fcc0
 204:	00000001 	movf	zero,zero,$fcc0
 208:	00000001 	movf	zero,zero,$fcc0
 20c:	00000001 	movf	zero,zero,$fcc0
 210:	00000001 	movf	zero,zero,$fcc0
 214:	00000001 	movf	zero,zero,$fcc0
 218:	00000001 	movf	zero,zero,$fcc0
 21c:	00000001 	movf	zero,zero,$fcc0
 220:	00000001 	movf	zero,zero,$fcc0
 224:	00000001 	movf	zero,zero,$fcc0
 228:	00000001 	movf	zero,zero,$fcc0
 22c:	00000001 	movf	zero,zero,$fcc0
 230:	bfc00ae8 	cache	0x0,2792(s8)
 234:	bfc00b20 	cache	0x0,2848(s8)
 238:	00000001 	movf	zero,zero,$fcc0
 23c:	00000001 	movf	zero,zero,$fcc0
 240:	bfc00b20 	cache	0x0,2848(s8)
 244:	bfc00b40 	cache	0x0,2880(s8)
 248:	00000001 	movf	zero,zero,$fcc0
 24c:	00000001 	movf	zero,zero,$fcc0
 250:	bfc00b40 	cache	0x0,2880(s8)
 254:	bfc00b54 	cache	0x0,2900(s8)
 258:	bfc00b54 	cache	0x0,2900(s8)
 25c:	bfc00b68 	cache	0x0,2920(s8)
 260:	00000001 	movf	zero,zero,$fcc0
 264:	00000001 	movf	zero,zero,$fcc0
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	00000066 	0x66
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	00430002 	0x430002
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
  24:	74736574 	jalx	1cd95d0 <_mem_avail_start-0x7e326a30>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	6165725f 	0x6165725f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	70632e64 	0x70632e64
  30:	00000070 	tge	zero,zero,0x1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	64747300 	0x64747300
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	2e746e69 	sltiu	s4,s3,28265
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	00010068 	0x10068
  40:	64747300 	0x64747300
  44:	682e6f69 	0x682e6f69
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	00000100 	sll	zero,zero,0x4
  4c:	02050000 	0x2050000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	bfc00450 	cache	0x0,1104(s8)
  54:	820b0316 	lb	t3,790(s0)
  58:	874a7503 	lh	t2,29955(k0)
  5c:	4a7a0350 	c2	0x7a0350
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	79034bf7 	0x79034bf7
  64:	00080282 	srl	zero,t0,0xa
  68:	00930101 	0x930101
  6c:	00020000 	sll	zero,v0,0x0
  70:	00000028 	0x28
  74:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
  78:	0101000d 	break	0x101
  7c:	00000101 	0x101
  80:	00000100 	sll	zero,zero,0x4
  84:	69747501 	0x69747501
  88:	7974696c 	0x7974696c
  8c:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
  90:	75747261 	jalx	5d1c984 <_mem_avail_start-0x7a2e367c>
  94:	00532e70 	tge	v0,s3,0xb9
  98:	00000001 	movf	zero,zero,$fcc0
  9c:	00020500 	sll	zero,v0,0x14
  a0:	19bfc000 	0x19bfc000
  a4:	0a034b83 	j	80d2e0c <_mem_avail_start-0x77f2d1f4>
  a8:	834d4b4a 	lb	t5,19274(k0)
  ac:	4b4d4b85 	c2	0x14d4b85
  b0:	4b834c4d 	c2	0x1834c4d
  b4:	4b4b4d83 	c2	0x14b4d83
  b8:	834d4b4b 	lb	t5,19275(k0)
  bc:	024b4b4b 	0x24b4b4b
  c0:	4b180284 	c2	0x1180284
  c4:	fc020b03 	sdc3	$2,2819(zero)
  c8:	4b4c0103 	c2	0x14c0103
  cc:	4b4b4d83 	c2	0x14b4d83
  d0:	4b4b4b4b 	c2	0x14b4b4b
  d4:	4b4b4b4b 	c2	0x14b4b4b
  d8:	4b4b4b4b 	c2	0x14b4b4b
  dc:	4b4b4b4b 	c2	0x14b4b4b
  e0:	4b4b4b4b 	c2	0x14b4b4b
  e4:	4b4b4b4b 	c2	0x14b4b4b
  e8:	4b4b4b4b 	c2	0x14b4b4b
  ec:	4b4b4b4c 	c2	0x14b4b4c
  f0:	4b4b4b4b 	c2	0x14b4b4b
  f4:	4b4c4b4b 	c2	0x14c4b4b
  f8:	4b4b4b4c 	c2	0x14b4b4c
  fc:	01000402 	0x1000402
 100:	00015901 	0x15901
 104:	87000200 	lh	zero,512(t8)
 108:	01000000 	0x1000000
 10c:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 110:	01010100 	0x1010100
 114:	00000001 	movf	zero,zero,$fcc0
 118:	01000001 	movf	zero,t0,$fcc0
 11c:	6c697475 	0x6c697475
 120:	00797469 	0x797469
 124:	6c636e69 	0x6c636e69
 128:	00656475 	0x656475
 12c:	69616d00 	0x69616d00
 130:	00632e6e 	0x632e6e
 134:	63000001 	0x63000001
 138:	6f6d6d6f 	0x6f6d6d6f
 13c:	00682e6e 	0x682e6e
 140:	73000002 	mul	zero,t8,zero
 144:	6e696474 	0x6e696474
 148:	00682e74 	teq	v1,t0,0xb9
 14c:	6d000002 	0x6d000002
 150:	69686361 	0x69686361
 154:	682e656e 	0x682e656e
 158:	00000200 	sll	zero,zero,0x8
 15c:	65637865 	0x65637865
 160:	6f697470 	0x6f697470
 164:	00682e6e 	0x682e6e
 168:	73000002 	mul	zero,t8,zero
 16c:	6f696474 	0x6f696474
 170:	0200682e 	0x200682e
 174:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 178:	676e6972 	0x676e6972
 17c:	0200682e 	0x200682e
 180:	6f620000 	0x6f620000
 184:	7473746f 	jalx	1cdd1bc <_mem_avail_start-0x7e322e44>
 188:	2e706172 	sltiu	s0,s3,24946
 18c:	00020068 	0x20068
 190:	05000000 	bltz	t0,194 <_mem_avail_start-0x7ffffe6c>
 194:	c0049002 	ll	a0,-28670(zero)
 198:	010a03bf 	0x10a03bf
 19c:	c18484bc 	ll	a0,-31556(t4)
 1a0:	4f454f45 	c3	0x1454f45
 1a4:	86478745 	lh	a3,-30907(s2)
 1a8:	85f5f383 	lh	s5,-3197(t7)
 1ac:	b8c18383 	swr	at,-31869(a2)
 1b0:	0802bfb7 	j	afedc <_mem_avail_start-0x7ff50124>
 1b4:	00010100 	sll	zero,at,0x4
 1b8:	00000205 	0x205
 1bc:	2b030000 	slti	v1,t8,0
 1c0:	024f1401 	0x24f1401
 1c4:	01010008 	0x1010008
 1c8:	00020500 	sll	zero,v0,0x14
 1cc:	03000000 	0x3000000
 1d0:	4f140134 	c3	0x1140134
 1d4:	01000802 	0x1000802
 1d8:	02050001 	movt	zero,s0,$fcc1
 1dc:	bfc00558 	cache	0x0,1368(s8)
 1e0:	84013d03 	lh	at,15619(zero)
 1e4:	833c0848 	lb	gp,2120(t9)
 1e8:	0200494b 	0x200494b
 1ec:	004b0304 	0x4b0304
 1f0:	08030402 	j	c1008 <_mem_avail_start-0x7ff3eff8>
 1f4:	2802853b 	slti	v0,zero,-31429
 1f8:	00200213 	0x200213
 1fc:	05000101 	bltz	t0,604 <_mem_avail_start-0x7ffff9fc>
 200:	c005f002 	ll	a1,-4094(zero)
 204:	00c403bf 	0xc403bf
 208:	820c0301 	lb	t4,769(s0)
 20c:	ba4a7403 	swr	t2,29699(s2)
 210:	034a0c03 	0x34a0c03
 214:	02004a75 	0x2004a75
 218:	004c0304 	0x4c0304
 21c:	03030402 	0x3030402
 220:	003c0809 	0x3c0809
 224:	03030402 	0x3030402
 228:	033c0875 	0x33c0875
 22c:	1402820d 	bne	zero,v0,fffe0a64 <_text_end+0x403dfa0c>
 230:	00010100 	sll	zero,at,0x4
 234:	06580205 	0x6580205
 238:	d403bfc0 	ldc1	$f3,-16448(zero)
 23c:	49bb0100 	0x49bb0100
 240:	834b494b 	lb	t3,18763(k0)
 244:	83c1bb83 	lb	at,-17533(s8)
 248:	5503b984 	bnel	t0,v1,fffee85c <_text_end+0x403ed804>
 24c:	4a2403f2 	c2	0x2403f2
 250:	08510384 	j	1440e10 <_mem_avail_start-0x7ebbf1f0>
 254:	4a2f0374 	c2	0x2f0374
 258:	001002bb 	0x1002bb
 25c:	00aa0101 	0xaa0101
 260:	00020000 	sll	zero,v0,0x0
 264:	0000001f 	0x1f
 268:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 26c:	0101000d 	break	0x101
 270:	00000101 	0x101
 274:	00000100 	sll	zero,zero,0x4
 278:	72700001 	maddu	s3,s0
 27c:	66746e69 	0x66746e69
 280:	0000632e 	0x632e
 284:	00000000 	nop
 288:	070c0205 	teqi	t8,517
 28c:	8813bfc0 	lwl	s3,-16448(zero)
 290:	084a7a03 	j	129e80c <_mem_avail_start-0x7ed617f4>
 294:	034cf83c 	0x34cf83c
 298:	004a00c5 	0x4a00c5
 29c:	03010402 	0x3010402
 2a0:	034a7fbb 	0x34a7fbb
 2a4:	03f200cb 	0x3f200cb
 2a8:	24027fb8 	li	v0,32696
 2ac:	38038601 	xori	v1,zero,0x8601
 2b0:	52014402 	beql	s0,at,112bc <_mem_avail_start-0x7ffeed44>
 2b4:	08f24003 	j	3c9000c <_mem_avail_start-0x7c36fff4>
 2b8:	7703837c 	jalx	c0e0df0 <_mem_avail_start-0x73f1f210>
 2bc:	021c0382 	0x21c0382
 2c0:	64030128 	0x64030128
 2c4:	88af0882 	lwl	t7,2178(a1)
 2c8:	0402004b 	bltzl	zero,3f8 <_mem_avail_start-0x7ffffc08>
 2cc:	4a6f0302 	c2	0x6f0302
 2d0:	03ba1403 	0x3ba1403
 2d4:	68038214 	0x68038214
 2d8:	82090382 	lb	t1,898(s0)
 2dc:	bd821503 	cache	0x2,5379(t4)
 2e0:	f3826d03 	0xf3826d03
 2e4:	bfc0894c 	cache	0x0,-30388(s8)
 2e8:	03825e03 	0x3825e03
 2ec:	02008226 	0x2008226
 2f0:	4e030104 	c3	0x30104
 2f4:	0402004a 	bltzl	zero,420 <_mem_avail_start-0x7ffffbe0>
 2f8:	4a340301 	c2	0x340301
 2fc:	03040200 	0x3040200
 300:	0b03ad08 	j	c0eb420 <_mem_avail_start-0x73f14be0>
 304:	028383f2 	tlt	s4,v1,0x20f
 308:	01010008 	0x1010008
 30c:	00000076 	tne	zero,zero,0x1
 310:	00220002 	ror	zero,v0,0x0
 314:	01010000 	0x1010000
 318:	000d0efb 	0xd0efb
 31c:	01010101 	0x1010101
 320:	01000000 	0x1000000
 324:	00010000 	sll	zero,at,0x0
 328:	6e697270 	0x6e697270
 32c:	73616274 	0x73616274
 330:	00632e65 	0x632e65
 334:	00000000 	nop
 338:	30020500 	andi	v0,zero,0x500
 33c:	13bfc009 	beq	sp,ra,ffff0364 <_text_end+0x403ef30c>
 340:	004fac08 	0x4fac08
 344:	06010402 	bgez	s0,1350 <_mem_avail_start-0x7fffecb0>
 348:	4b840682 	c2	0x1840682
 34c:	01040200 	0x1040200
 350:	00ba7803 	0xba7803
 354:	03010402 	0x3010402
 358:	008a4a0c 	syscall	0x22928
 35c:	06020402 	bltzl	s0,1368 <_mem_avail_start-0x7fffec98>
 360:	038806ba 	0x38806ba
 364:	01240270 	tge	t1,a0,0x9
 368:	03040200 	0x3040200
 36c:	008ab008 	0x8ab008
 370:	06010402 	bgez	s0,137c <_mem_avail_start-0x7fffec84>
 374:	04020082 	bltzl	zero,580 <_mem_avail_start-0x7ffffa80>
 378:	00830601 	0x830601
 37c:	06040402 	0x6040402
 380:	001002f2 	tlt	zero,s0,0xb
 384:	01790101 	0x1790101
 388:	00020000 	sll	zero,v0,0x0
 38c:	00000036 	tne	zero,zero
 390:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 394:	0101000d 	break	0x101
 398:	00000101 	0x101
 39c:	00000100 	sll	zero,zero,0x4
 3a0:	2f2e2e01 	sltiu	t6,t9,11777
 3a4:	6c636e69 	0x6c636e69
 3a8:	00656475 	0x656475
 3ac:	72747300 	0x72747300
 3b0:	2e676e69 	sltiu	a3,s3,28265
 3b4:	00000063 	0x63
 3b8:	6d6f6300 	0x6d6f6300
 3bc:	2e6e6f6d 	sltiu	t6,s3,28525
 3c0:	00010068 	0x10068
 3c4:	05000000 	bltz	t0,3c8 <_mem_avail_start-0x7ffffc38>
 3c8:	00000002 	srl	zero,zero,0x0
 3cc:	010b0300 	0x10b0300
 3d0:	02780814 	0x2780814
 3d4:	01010008 	0x1010008
 3d8:	00020500 	sll	zero,v0,0x14
 3dc:	03000000 	0x3000000
 3e0:	4b130121 	c2	0x1130121
 3e4:	01040200 	0x1040200
 3e8:	be068206 	cache	0x6,-32250(s0)
 3ec:	0008027f 	0x8027f
 3f0:	05000101 	bltz	t0,7f8 <_mem_avail_start-0x7ffff808>
 3f4:	00000002 	srl	zero,zero,0x0
 3f8:	01360300 	0x1360300
 3fc:	02004e01 	0x2004e01
 400:	084b0104 	j	12c0410 <_mem_avail_start-0x7ed3fbf0>
 404:	00080240 	sll	zero,t0,0x9
 408:	05000101 	bltz	t0,810 <_mem_avail_start-0x7ffff7f0>
 40c:	00000002 	srl	zero,zero,0x0
 410:	00cc0300 	0xcc0300
 414:	4b830101 	c2	0x1830101
 418:	827a0389 	lb	k0,905(s3)
 41c:	08024cbb 	j	932ec <_mem_avail_start-0x7ff6cd14>
 420:	00010100 	sll	zero,at,0x4
 424:	00000205 	0x205
 428:	e7030000 	swc1	$f3,0(t8)
 42c:	00160100 	sll	zero,s6,0x4
 430:	06010402 	bgez	s0,143c <_mem_avail_start-0x7fffebc4>
 434:	84bd06ba 	lh	sp,1722(a1)
 438:	0008027e 	0x8027e
 43c:	05000101 	bltz	t0,844 <_mem_avail_start-0x7ffff7bc>
 440:	00000002 	srl	zero,zero,0x0
 444:	00fe0300 	0xfe0300
 448:	02004b01 	0x2004b01
 44c:	82060104 	lb	a2,260(s0)
 450:	02040200 	0x2040200
 454:	83bd06ba 	lb	sp,1722(sp)
 458:	0802847f 	j	a11fc <_mem_avail_start-0x7ff5ee04>
 45c:	00010100 	sll	zero,at,0x4
 460:	00000205 	0x205
 464:	8e030000 	lw	v1,0(s0)
 468:	f8130101 	sdc2	$19,257(zero)
 46c:	827a034b 	lb	k0,843(s3)
 470:	00080285 	0x80285
 474:	05000101 	bltz	t0,87c <_mem_avail_start-0x7ffff784>
 478:	00000002 	srl	zero,zero,0x0
 47c:	01a20300 	0x1a20300
 480:	03f91301 	0x3f91301
 484:	0285827a 	0x285827a
 488:	01010008 	0x1010008
 48c:	08020500 	j	81400 <_mem_avail_start-0x7ff7ec00>
 490:	03bfc00a 	movz	t8,sp,ra
 494:	01010290 	0x1010290
 498:	7e874b86 	0x7e874b86
 49c:	01000802 	0x1000802
 4a0:	02050001 	movt	zero,s0,$fcc1
 4a4:	00000000 	nop
 4a8:	0102ab03 	0x102ab03
 4ac:	874b8701 	lh	t3,-30975(k0)
 4b0:	0010027e 	0x10027e
 4b4:	05000101 	bltz	t0,8bc <_mem_avail_start-0x7ffff744>
 4b8:	00000002 	srl	zero,zero,0x0
 4bc:	02c20300 	0x2c20300
 4c0:	7a031801 	0x7a031801
 4c4:	4e84504a 	c3	0x84504a
 4c8:	04020088 	bltzl	zero,6ec <_mem_avail_start-0x7ffff914>
 4cc:	82740301 	lb	s4,769(s3)
 4d0:	3d0883f3 	0x3d0883f3
 4d4:	001002f6 	tne	zero,s0,0xb
 4d8:	05000101 	bltz	t0,8e0 <_mem_avail_start-0x7ffff720>
 4dc:	00000002 	srl	zero,zero,0x0
 4e0:	02e50300 	0x2e50300
 4e4:	03894d01 	0x3894d01
 4e8:	3d08827a 	0x3d08827a
 4ec:	000802f4 	teq	zero,t0,0xb
 4f0:	05000101 	bltz	t0,8f8 <_mem_avail_start-0x7ffff708>
 4f4:	00000002 	srl	zero,zero,0x0
 4f8:	02f10300 	0x2f10300
 4fc:	0c021301 	jal	84c04 <_mem_avail_start-0x7ff7b3fc>
 500:	4f010100 	c3	0x1010100
 504:	02000000 	0x2000000
 508:	00001d00 	sll	v1,zero,0x14
 50c:	fb010100 	sdc2	$1,256(t8)
 510:	01000d0e 	0x1000d0e
 514:	00010101 	0x10101
 518:	00010000 	sll	zero,at,0x0
 51c:	70000100 	0x70000100
 520:	2e737475 	sltiu	s3,s3,29813
 524:	00000063 	0x63
 528:	05000000 	bltz	t0,52c <_mem_avail_start-0x7ffffad4>
 52c:	c00a2c02 	ll	t2,11266(zero)
 530:	3c0813bf 	lui	t0,0x13bf
 534:	03c2484e 	0x3c2484e
 538:	8374087a 	lb	s4,2170(k1)
 53c:	08028383 	j	a0e0c <_mem_avail_start-0x7ff5f1f4>
 540:	00010100 	sll	zero,at,0x4
 544:	0a8c0205 	j	a300814 <_mem_avail_start-0x75cff7ec>
 548:	0e03bfc0 	jal	80eff00 <_mem_avail_start-0x77f10100>
 54c:	83838301 	lb	v1,-31999(gp)
 550:	00100284 	0x100284
 554:	00590101 	0x590101
 558:	00020000 	sll	zero,v0,0x0
 55c:	00000044 	0x44
 560:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 564:	0101000d 	break	0x101
 568:	00000101 	0x101
 56c:	00000100 	sll	zero,zero,0x4
 570:	2f2e2e01 	sltiu	t6,t9,11777
 574:	6c636e69 	0x6c636e69
 578:	00656475 	0x656475
 57c:	74757000 	jalx	1d5c000 <_mem_avail_start-0x7e2a4000>
 580:	72616863 	0x72616863
 584:	0000632e 	0x632e
 588:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 58c:	746e6964 	jalx	1b9a590 <_mem_avail_start-0x7e465a70>
 590:	0100682e 	0x100682e
 594:	616d0000 	0x616d0000
 598:	6e696863 	0x6e696863
 59c:	00682e65 	0x682e65
 5a0:	00000001 	movf	zero,zero,$fcc0
 5a4:	bc020500 	cache	0x2,1280(zero)
 5a8:	15bfc00a 	bne	t5,ra,ffff05d4 <_text_end+0x403ef57c>
 5ac:	140284f3 	bne	zero,v0,fffe197c <_text_end+0x403e0924>
 5b0:	a9010100 	swl	at,256(t0)
 5b4:	02000001 	movf	zero,s0,$fcc0
 5b8:	00005200 	sll	t2,zero,0x8
 5bc:	fb010100 	sdc2	$1,256(t8)
 5c0:	01000d0e 	0x1000d0e
 5c4:	00010101 	0x10101
 5c8:	00010000 	sll	zero,at,0x0
 5cc:	2e2e0100 	sltiu	t6,s1,256
 5d0:	636e692f 	0x636e692f
 5d4:	6564756c 	0x6564756c
 5d8:	616d0000 	0x616d0000
 5dc:	6e696863 	0x6e696863
 5e0:	70632e65 	0x70632e65
 5e4:	00000070 	tge	zero,zero,0x1
 5e8:	6d6f6300 	0x6d6f6300
 5ec:	2e6e6f6d 	sltiu	t6,s3,28525
 5f0:	00010068 	0x10068
 5f4:	64747300 	0x64747300
 5f8:	2e746e69 	sltiu	s4,s3,28265
 5fc:	00010068 	0x10068
 600:	63616d00 	0x63616d00
 604:	656e6968 	0x656e6968
 608:	0100682e 	0x100682e
 60c:	00000000 	nop
 610:	00000205 	0x205
 614:	1b030000 	0x1b030000
 618:	016a0301 	0x16a0301
 61c:	024a1603 	0x24a1603
 620:	01010008 	0x1010008
 624:	00020500 	sll	zero,v0,0x14
 628:	03000000 	0x3000000
 62c:	6a03011b 	0x6a03011b
 630:	4a160301 	c2	0x160301
 634:	01000802 	0x1000802
 638:	02050001 	movt	zero,s0,$fcc1
 63c:	00000000 	nop
 640:	03011b03 	0x3011b03
 644:	1603016a 	bne	s0,v1,bf0 <_mem_avail_start-0x7ffff410>
 648:	0008024a 	0x8024a
 64c:	05000101 	bltz	t0,a54 <_mem_avail_start-0x7ffff5ac>
 650:	00000002 	srl	zero,zero,0x0
 654:	011b0300 	0x11b0300
 658:	03016a03 	0x3016a03
 65c:	08024a16 	j	92858 <_mem_avail_start-0x7ff6d7a8>
 660:	00010100 	sll	zero,at,0x4
 664:	00000205 	0x205
 668:	1c030000 	0x1c030000
 66c:	016f0301 	0x16f0301
 670:	024a1103 	0x24a1103
 674:	01010008 	0x1010008
 678:	00020500 	sll	zero,v0,0x14
 67c:	03000000 	0x3000000
 680:	6f03011c 	0x6f03011c
 684:	4a110301 	c2	0x110301
 688:	01000802 	0x1000802
 68c:	02050001 	movt	zero,s0,$fcc1
 690:	00000000 	nop
 694:	03011c03 	0x3011c03
 698:	1103016f 	beq	t0,v1,c58 <_mem_avail_start-0x7ffff3a8>
 69c:	0008024a 	0x8024a
 6a0:	05000101 	bltz	t0,aa8 <_mem_avail_start-0x7ffff558>
 6a4:	00000002 	srl	zero,zero,0x0
 6a8:	011c0300 	0x11c0300
 6ac:	03016f03 	0x3016f03
 6b0:	08024a11 	j	92844 <_mem_avail_start-0x7ff6d7bc>
 6b4:	00010100 	sll	zero,at,0x4
 6b8:	0ae80205 	j	ba00814 <_mem_avail_start-0x745ff7ec>
 6bc:	1e03bfc0 	0x1e03bfc0
 6c0:	016d0301 	0x16d0301
 6c4:	30022103 	andi	v0,zero,0x2103
 6c8:	00080201 	0x80201
 6cc:	05000101 	bltz	t0,ad4 <_mem_avail_start-0x7ffff52c>
 6d0:	00000002 	srl	zero,zero,0x0
 6d4:	012e0300 	0x12e0300
 6d8:	03015703 	0x3015703
 6dc:	5603822a 	bnel	s0,v1,fffe0f88 <_text_end+0x403dff30>
 6e0:	4a2c03ba 	c2	0x2c03ba
 6e4:	01000802 	0x1000802
 6e8:	02050001 	movt	zero,s0,$fcc1
 6ec:	bfc00b20 	cache	0x0,2848(s8)
 6f0:	03013303 	0x3013303
 6f4:	2f030152 	sltiu	v1,t8,338
 6f8:	ba570382 	swr	s7,898(s2)
 6fc:	024a2b03 	0x24a2b03
 700:	01010008 	0x1010008
 704:	00020500 	sll	zero,v0,0x14
 708:	03000000 	0x3000000
 70c:	83840138 	lb	a0,312(gp)
 710:	4b4bb983 	c2	0x14bb983
 714:	024c4884 	0x24c4884
 718:	0101000c 	syscall	0x40400
 71c:	40020500 	0x40020500
 720:	03bfc00b 	movn	t8,sp,ra
 724:	030100c1 	0x30100c1
 728:	3803014a 	xori	v1,zero,0x14a
 72c:	000802ba 	0x802ba
 730:	05000101 	bltz	t0,b38 <_mem_avail_start-0x7ffff4c8>
 734:	c00b5402 	ll	t3,21506(zero)
 738:	00c503bf 	0xc503bf
 73c:	01460301 	0x1460301
 740:	02ba3c03 	0x2ba3c03
 744:	01010008 	0x1010008
 748:	00020500 	sll	zero,v0,0x14
 74c:	03000000 	0x3000000
 750:	030100c9 	0x30100c9
 754:	03017fbc 	0x3017fbc
 758:	02ba00c6 	0x2ba00c6
 75c:	01010008 	0x1010008

Disassembly of section .debug_str:

00000000 <.debug_str>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	6e697270 	0x6e697270
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	2f006674 	sltiu	zero,t8,26228
   8:	2f746e6d 	sltiu	s4,k1,28269
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	73552f63 	0x73552f63
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	2f737265 	sltiu	s3,k1,29285
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	74636146 	jalx	18d8518 <_mem_avail_start-0x7e727ae8>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	6169726f 	0x6169726f
  1c:	642f4e6c 	0x642f4e6c
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	6c6e776f 	0x6c6e776f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	7364616f 	0x7364616f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	776f772f 	jalx	dbddcbc <_mem_avail_start-0x72422344>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	646f632f 	0x646f632f
  30:	72673931 	0x72673931
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	522f3170 	beql	s1,t7,c5f8 <_mem_avail_start-0x7fff3a08>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	6574756f 	0x6574756f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	65522d72 	0x65522d72
  40:	6c697562 	0x6c697562
  44:	72542f64 	0x72542f64
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	61697669 	0x61697669
  4c:	50494d6c 	beql	v0,t1,13600 <_mem_avail_start-0x7ffeca00>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	6f535f53 	0x6f535f53
  54:	61777466 	0x61777466
  58:	632f6572 	0x632f6572
  5c:	68007070 	0x68007070
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	6f747361 	0x6f747361
  64:	64616552 	0x64616552
  68:	73657400 	0x73657400
  6c:	65725f74 	0x65725f74
  70:	632e6461 	0x632e6461
  74:	75007070 	jalx	401c1c0 <_mem_avail_start-0x7bfe3e40>
  78:	38746e69 	xori	s4,v1,0x6e69
  7c:	7500745f 	jalx	401d17c <_mem_avail_start-0x7bfe2e84>
  80:	6769736e 	0x6769736e
  84:	2064656e 	addi	a0,v1,25966
  88:	72616863 	0x72616863
  8c:	6e655f00 	0x6e655f00
  90:	00797274 	teq	v1,t9,0x1c9
  94:	676e6f6c 	0x676e6f6c
  98:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
  9c:	6e6f6c00 	0x6e6f6c00
  a0:	6e752067 	0x6e752067
  a4:	6e676973 	0x6e676973
  a8:	69206465 	0x69206465
  ac:	7300746e 	0x7300746e
  b0:	74726f68 	jalx	1c9bda0 <_mem_avail_start-0x7e364260>
  b4:	736e7520 	0x736e7520
  b8:	656e6769 	0x656e6769
  bc:	6e692064 	0x6e692064
  c0:	4e470074 	c3	0x470074
  c4:	2b432055 	slti	v1,k0,8277
  c8:	2031312b 	addi	s1,at,12587
  cc:	2e342e37 	sltiu	s4,s1,11831
  d0:	6d2d2030 	0x6d2d2030
  d4:	2d206c65 	sltiu	zero,t1,27749
  d8:	6e69736d 	0x6e69736d
  dc:	2d656c67 	sltiu	a1,t3,27751
  e0:	616f6c66 	0x616f6c66
  e4:	6d2d2074 	0x6d2d2074
  e8:	746f6778 	jalx	1bd9de0 <_mem_avail_start-0x7e426220>
  ec:	6e6d2d20 	0x6e6d2d20
  f0:	62612d6f 	0x62612d6f
  f4:	6c616369 	0x6c616369
  f8:	2d20736c 	sltiu	zero,t1,29548
  fc:	7261686d 	0x7261686d
 100:	6c662d64 	0x6c662d64
 104:	2074616f 	addi	s4,v1,24943
 108:	70696d2d 	0x70696d2d
 10c:	20323373 	addi	s2,at,13171
 110:	6c6c6d2d 	0x6c6c6d2d
 114:	2d206373 	sltiu	zero,t1,25459
 118:	2d6f6e6d 	sltiu	t7,t3,28269
 11c:	3163786c 	andi	v1,t3,0x786c
 120:	6378732d 	0x6378732d
 124:	6d2d2031 	0x6d2d2031
 128:	6d2d6f6e 	0x6d2d6f6e
 12c:	34646461 	ori	a0,v1,0x6461
 130:	6e6d2d20 	0x6e6d2d20
 134:	68732d6f 	0x68732d6f
 138:	64657261 	0x64657261
 13c:	616d2d20 	0x616d2d20
 140:	333d6962 	andi	sp,t9,0x6962
 144:	672d2032 	0x672d2032
 148:	734f2d20 	0x734f2d20
 14c:	74732d20 	jalx	1ccb480 <_mem_avail_start-0x7e334b80>
 150:	2b633d64 	slti	v1,k1,15716
 154:	2031312b 	addi	s1,at,12587
 158:	7566662d 	jalx	59998b4 <_mem_avail_start-0x7a66674c>
 15c:	6974636e 	0x6974636e
 160:	732d6e6f 	0x732d6e6f
 164:	69746365 	0x69746365
 168:	20736e6f 	addi	s3,v1,28271
 16c:	6164662d 	0x6164662d
 170:	732d6174 	0x732d6174
 174:	69746365 	0x69746365
 178:	20736e6f 	addi	s3,v1,28271
 17c:	7266662d 	0x7266662d
 180:	74736565 	jalx	1cd9594 <_mem_avail_start-0x7e326a6c>
 184:	69646e61 	0x69646e61
 188:	2d20676e 	sltiu	zero,t1,26478
 18c:	2d6f6e66 	sltiu	t7,t3,28262
 190:	6c697562 	0x6c697562
 194:	206e6974 	addi	t6,v1,26996
 198:	6f6e662d 	0x6f6e662d
 19c:	4549502d 	0x4549502d
 1a0:	6f687300 	0x6f687300
 1a4:	69207472 	0x69207472
 1a8:	7500746e 	jalx	401d1b8 <_mem_avail_start-0x7bfe2e48>
 1ac:	696c6974 	0x696c6974
 1b0:	732f7974 	0x732f7974
 1b4:	74726174 	jalx	1c985d0 <_mem_avail_start-0x7e367a30>
 1b8:	532e7075 	beql	t9,t6,1c390 <_mem_avail_start-0x7ffe3c70>
 1bc:	6e6d2f00 	0x6e6d2f00
 1c0:	2f632f74 	sltiu	v1,k1,12148
 1c4:	72657355 	0x72657355
 1c8:	61462f73 	0x61462f73
 1cc:	726f7463 	0x726f7463
 1d0:	4e6c6169 	c3	0x6c6169
 1d4:	776f642f 	jalx	dbd90bc <_mem_avail_start-0x72426f44>
 1d8:	616f6c6e 	0x616f6c6e
 1dc:	542f7364 	bnel	at,t7,1cf70 <_mem_avail_start-0x7ffe3090>
 1e0:	69766972 	0x69766972
 1e4:	494d6c61 	0x494d6c61
 1e8:	535f5350 	beql	k0,ra,14f2c <_mem_avail_start-0x7ffeb0d4>
 1ec:	7774666f 	jalx	dd199bc <_mem_avail_start-0x722e6644>
 1f0:	2f657261 	sltiu	a1,k1,29281
 1f4:	00707063 	0x707063
 1f8:	20554e47 	addi	s5,v0,20039
 1fc:	32205341 	andi	zero,s1,0x5341
 200:	0030332e 	0x30332e
 204:	5f307063 	0x5f307063
 208:	76646162 	jalx	9918588 <_mem_avail_start-0x766e7a78>
 20c:	72646461 	0x72646461
 210:	43584500 	c0	0x1584500
 214:	49545045 	0x49545045
 218:	4d5f4e4f 	0x4d5f4e4f
 21c:	41535345 	0x41535345
 220:	00534547 	0x534547
 224:	5f307063 	0x5f307063
 228:	73756163 	0x73756163
 22c:	72700065 	0x72700065
 230:	5f746e69 	0x5f746e69
 234:	00626c74 	teq	v1,v0,0x1b1
 238:	6f6f425f 	0x6f6f425f
 23c:	7063006c 	0x7063006c
 240:	70655f30 	0x70655f30
 244:	6d5f0063 	0x6d5f0063
 248:	006e6961 	0x6e6961
 24c:	7465675f 	jalx	1959d7c <_mem_avail_start-0x7e6a6284>
 250:	7561635f 	jalx	5858d7c <_mem_avail_start-0x7a7a7284>
 254:	5f006573 	bgtzl	t8,19824 <_mem_avail_start-0x7ffe67dc>
 258:	00737362 	0x737362
 25c:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 260:	656c5f65 	0x656c5f65
 264:	79620064 	0x79620064
 268:	745f6574 	jalx	17d95d0 <_mem_avail_start-0x7e826a30>
 26c:	65675f00 	0x65675f00
 270:	70655f74 	0x70655f74
 274:	6e690063 	0x6e690063
 278:	735f7469 	0x735f7469
 27c:	61697265 	0x61697265
 280:	625f006c 	0x625f006c
 284:	655f7373 	0x655f7373
 288:	6d00646e 	0x6d00646e
 28c:	65736d65 	0x65736d65
 290:	72700074 	0x72700074
 294:	5f746e69 	0x5f746e69
 298:	70617274 	0x70617274
 29c:	6d617266 	0x6d617266
 2a0:	70630065 	0x70630065
 2a4:	74735f30 	jalx	1cd7cc0 <_mem_avail_start-0x7e328340>
 2a8:	73757461 	0x73757461
 2ac:	646f6300 	0x646f6300
 2b0:	6e650065 	0x6e650065
 2b4:	5f797274 	0x5f797274
 2b8:	315f6f6c 	andi	ra,t2,0x6f6c
 2bc:	78655f00 	0x78655f00
 2c0:	74706563 	jalx	1c1958c <_mem_avail_start-0x7e3e6a74>
 2c4:	5f6e6f69 	0x5f6e6f69
 2c8:	646e6168 	0x646e6168
 2cc:	0072656c 	0x72656c
 2d0:	64646170 	0x64646170
 2d4:	00676e69 	0x676e69
 2d8:	72746e65 	0x72746e65
 2dc:	6f6c5f79 	0x6f6c5f79
 2e0:	4700325f 	c1	0x100325f
 2e4:	4320554e 	c0	0x120554e
 2e8:	37203131 	ori	zero,t9,0x3131
 2ec:	302e342e 	andi	t6,at,0x342e
 2f0:	656d2d20 	0x656d2d20
 2f4:	6d2d206c 	0x6d2d206c
 2f8:	676e6973 	0x676e6973
 2fc:	662d656c 	0x662d656c
 300:	74616f6c 	jalx	185bdb0 <_mem_avail_start-0x7e7a4250>
 304:	786d2d20 	0x786d2d20
 308:	20746f67 	addi	s4,v1,28519
 30c:	6f6e6d2d 	0x6f6e6d2d
 310:	6962612d 	0x6962612d
 314:	6c6c6163 	0x6c6c6163
 318:	6d2d2073 	0x6d2d2073
 31c:	64726168 	0x64726168
 320:	6f6c662d 	0x6f6c662d
 324:	2d207461 	sltiu	zero,t1,29793
 328:	7370696d 	0x7370696d
 32c:	2d203233 	sltiu	zero,t1,12851
 330:	736c6c6d 	0x736c6c6d
 334:	6d2d2063 	0x6d2d2063
 338:	6c2d6f6e 	0x6c2d6f6e
 33c:	2d316378 	sltiu	s1,t1,25464
 340:	31637873 	andi	v1,t3,0x7873
 344:	6e6d2d20 	0x6e6d2d20
 348:	616d2d6f 	0x616d2d6f
 34c:	20346464 	addi	s4,at,25700
 350:	6f6e6d2d 	0x6f6e6d2d
 354:	6168732d 	0x6168732d
 358:	20646572 	addi	a0,v1,25970
 35c:	62616d2d 	0x62616d2d
 360:	32333d69 	andi	s3,s1,0x3d69
 364:	20672d20 	addi	a3,v1,11552
 368:	20734f2d 	addi	s3,v1,20269
 36c:	7566662d 	jalx	59998b4 <_mem_avail_start-0x7a66674c>
 370:	6974636e 	0x6974636e
 374:	732d6e6f 	0x732d6e6f
 378:	69746365 	0x69746365
 37c:	20736e6f 	addi	s3,v1,28271
 380:	6164662d 	0x6164662d
 384:	732d6174 	0x732d6174
 388:	69746365 	0x69746365
 38c:	20736e6f 	addi	s3,v1,28271
 390:	7266662d 	0x7266662d
 394:	74736565 	jalx	1cd9594 <_mem_avail_start-0x7e326a6c>
 398:	69646e61 	0x69646e61
 39c:	2d20676e 	sltiu	zero,t1,26478
 3a0:	2d6f6e66 	sltiu	t7,t3,28262
 3a4:	6c697562 	0x6c697562
 3a8:	206e6974 	addi	t6,v1,26996
 3ac:	6f6e662d 	0x6f6e662d
 3b0:	4549502d 	0x4549502d
 3b4:	73736200 	0x73736200
 3b8:	7a69735f 	0x7a69735f
 3bc:	72770065 	0x72770065
 3c0:	5f657469 	0x5f657469
 3c4:	6d676573 	0x6d676573
 3c8:	00746e65 	0x746e65
 3cc:	5f307063 	0x5f307063
 3d0:	73616265 	0x73616265
 3d4:	69750065 	0x69750065
 3d8:	3631746e 	ori	s1,s1,0x746e
 3dc:	7500745f 	jalx	401d17c <_mem_avail_start-0x7bfe2e84>
 3e0:	33746e69 	andi	s4,k1,0x6e69
 3e4:	00745f32 	tlt	v1,s4,0x17c
 3e8:	72746e65 	0x72746e65
 3ec:	69685f79 	0x69685f79
 3f0:	74757000 	jalx	1d5c000 <_mem_avail_start-0x7e2a4000>
 3f4:	74750073 	jalx	1d401cc <_mem_avail_start-0x7e2bfe34>
 3f8:	74696c69 	jalx	1a5b1a4 <_mem_avail_start-0x7e5a4e5c>
 3fc:	616d2f79 	0x616d2f79
 400:	632e6e69 	0x632e6e69
 404:	73657200 	0x73657200
 408:	00746c75 	0x746c75
 40c:	65737361 	0x65737361
 410:	6f697472 	0x6f697472
 414:	7274006e 	0x7274006e
 418:	72667061 	0x72667061
 41c:	5f656d61 	0x5f656d61
 420:	75700074 	jalx	5c001d0 <_mem_avail_start-0x7a3ffe30>
 424:	61686374 	0x61686374
 428:	72700072 	0x72700072
 42c:	62746e69 	0x62746e69
 430:	00657361 	0x657361
 434:	6e697270 	0x6e697270
 438:	632e6674 	0x632e6674
 43c:	61676100 	0x61676100
 440:	2f006e69 	sltiu	zero,t8,28265
 444:	2f746e6d 	sltiu	s4,k1,28269
 448:	73552f63 	0x73552f63
 44c:	2f737265 	sltiu	s3,k1,29285
 450:	74636146 	jalx	18d8518 <_mem_avail_start-0x7e727ae8>
 454:	6169726f 	0x6169726f
 458:	642f4e6c 	0x642f4e6c
 45c:	6c6e776f 	0x6c6e776f
 460:	7364616f 	0x7364616f
 464:	6972542f 	0x6972542f
 468:	6c616976 	0x6c616976
 46c:	5350494d 	beql	k0,s0,129a4 <_mem_avail_start-0x7ffed65c>
 470:	666f535f 	0x666f535f
 474:	72617774 	0x72617774
 478:	70632f65 	0x70632f65
 47c:	696c2f70 	0x696c2f70
 480:	75700062 	jalx	5c00188 <_mem_avail_start-0x7a3ffe78>
 484:	72747374 	0x72747374
 488:	00676e69 	0x676e69
 48c:	756c6176 	jalx	5b185d8 <_mem_avail_start-0x7a4e7a28>
 490:	72700065 	0x72700065
 494:	62746e69 	0x62746e69
 498:	2e657361 	sltiu	a1,s3,29537
 49c:	69730063 	0x69730063
 4a0:	6d006e67 	0x6d006e67
 4a4:	6f6d6d65 	0x6f6d6d65
 4a8:	62006576 	0x62006576
 4ac:	6f72657a 	0x6f72657a
 4b0:	72747300 	0x72747300
 4b4:	2e676e69 	sltiu	a3,s3,28265
 4b8:	69730063 	0x69730063
 4bc:	745f657a 	jalx	17d95e8 <_mem_avail_start-0x7e826a18>
 4c0:	6d656d00 	0x6d656d00
 4c4:	00706d63 	0x706d63
 4c8:	6e727473 	0x6e727473
 4cc:	00797063 	0x797063
 4d0:	6e727473 	0x6e727473
 4d4:	006e656c 	0x6e656c
 4d8:	63727473 	0x63727473
 4dc:	73007268 	0x73007268
 4e0:	70637274 	0x70637274
 4e4:	74730079 	jalx	1cc01e4 <_mem_avail_start-0x7e33fe1c>
 4e8:	706d6372 	0x706d6372
 4ec:	6d656d00 	0x6d656d00
 4f0:	00797063 	0x797063
 4f4:	6c727473 	0x6c727473
 4f8:	73006e65 	0x73006e65
 4fc:	636e7274 	0x636e7274
 500:	7300706d 	0x7300706d
 504:	69667274 	0x69667274
 508:	7000646e 	0x7000646e
 50c:	2e737475 	sltiu	s3,s3,29813
 510:	72770063 	0x72770063
 514:	5f657469 	0x5f657469
 518:	69726573 	0x69726573
 51c:	70006c61 	0x70006c61
 520:	68637475 	0x68637475
 524:	632e7261 	0x632e7261
 528:	69727700 	0x69727700
 52c:	685f6574 	0x685f6574
 530:	64726f77 	0x64726f77
 534:	355a5f00 	ori	k0,t2,0x5f00
 538:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 53c:	456a4965 	0x456a4965
 540:	54765076 	bnel	v1,s6,1471c <_mem_avail_start-0x7ffeb8e4>
 544:	6572005f 	0x6572005f
 548:	735f6461 	0x735f6461
 54c:	63746977 	0x63746977
 550:	00736568 	0x736568
 554:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 558:	6f775f65 	0x6f775f65
 55c:	64006472 	0x64006472
 560:	00617461 	0x617461
 564:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 568:	79625f65 	0x79625f65
 56c:	5f006574 	bgtzl	t8,19b40 <_mem_avail_start-0x7ffe64c0>
 570:	6572345a 	0x6572345a
 574:	6d496461 	0x6d496461
 578:	505f5445 	beql	v0,ra,15690 <_mem_avail_start-0x7ffea970>
 57c:	69750076 	0x69750076
 580:	3436746e 	ori	s6,at,0x746e
 584:	7700745f 	jalx	c01d17c <_mem_avail_start-0x73fe2e84>
 588:	65746972 	0x65746972
 58c:	736e753c 	0x736e753c
 590:	656e6769 	0x656e6769
 594:	68632064 	0x68632064
 598:	003e7261 	0x3e7261
 59c:	64616572 	0x64616572
 5a0:	6f77685f 	0x6f77685f
 5a4:	5f006472 	bgtzl	t8,19770 <_mem_avail_start-0x7ffe6890>
 5a8:	7277355a 	0x7277355a
 5ac:	49657469 	0x49657469
 5b0:	5076456d 	beql	v1,s6,11b68 <_mem_avail_start-0x7ffee498>
 5b4:	005f5476 	tne	v0,ra,0x151
 5b8:	72345a5f 	0x72345a5f
 5bc:	49646165 	0x49646165
 5c0:	5f544574 	0x5f544574
 5c4:	77007650 	jalx	c01d940 <_mem_avail_start-0x73fe26c0>
 5c8:	65746972 	0x65746972
 5cc:	6e6f6c3c 	0x6e6f6c3c
 5d0:	6e752067 	0x6e752067
 5d4:	6e676973 	0x6e676973
 5d8:	69206465 	0x69206465
 5dc:	003e746e 	0x3e746e
 5e0:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 5e4:	77645f65 	jalx	d917d94 <_mem_avail_start-0x726e826c>
 5e8:	0064726f 	0x64726f
 5ec:	64616572 	0x64616572
 5f0:	6e6f6c3c 	0x6e6f6c3c
 5f4:	6e752067 	0x6e752067
 5f8:	6e676973 	0x6e676973
 5fc:	69206465 	0x69206465
 600:	003e746e 	0x3e746e
 604:	64616572 	0x64616572
 608:	7265735f 	0x7265735f
 60c:	5f6c6169 	0x5f6c6169
 610:	64726f77 	0x64726f77
 614:	6f776400 	0x6f776400
 618:	745f6472 	jalx	17d91c8 <_mem_avail_start-0x7e826e38>
 61c:	345a5f00 	ori	k0,v0,0x5f00
 620:	64616572 	0x64616572
 624:	54456849 	bnel	v0,a1,1a74c <_mem_avail_start-0x7ffe58b4>
 628:	0076505f 	0x76505f
 62c:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 630:	68733c65 	0x68733c65
 634:	2074726f 	addi	s4,v1,29295
 638:	69736e75 	0x69736e75
 63c:	64656e67 	0x64656e67
 640:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 644:	6572003e 	0x6572003e
 648:	753c6461 	jalx	4f19184 <_mem_avail_start-0x7b0e6e7c>
 64c:	6769736e 	0x6769736e
 650:	2064656e 	addi	a0,v1,25966
 654:	72616863 	0x72616863
 658:	616d003e 	0x616d003e
 65c:	6e696863 	0x6e696863
 660:	70632e65 	0x70632e65
 664:	65720070 	0x65720070
 668:	645f6461 	0x645f6461
 66c:	64726f77 	0x64726f77
 670:	355a5f00 	ori	k0,t2,0x5f00
 674:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 678:	45684965 	0x45684965
 67c:	54765076 	bnel	v1,s6,14858 <_mem_avail_start-0x7ffeb7a8>
 680:	6572005f 	0x6572005f
 684:	753c6461 	jalx	4f19184 <_mem_avail_start-0x7b0e6e7c>
 688:	6769736e 	0x6769736e
 68c:	2064656e 	addi	a0,v1,25966
 690:	3e746e69 	0x3e746e69
 694:	355a5f00 	ori	k0,t2,0x5f00
 698:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 69c:	45744965 	0x45744965
 6a0:	54765076 	bnel	v1,s6,1487c <_mem_avail_start-0x7ffeb784>
 6a4:	5a5f005f 	0x5a5f005f
 6a8:	61657234 	0x61657234
 6ac:	456a4964 	0x456a4964
 6b0:	76505f54 	jalx	9417d50 <_mem_avail_start-0x76be82b0>
 6b4:	61657200 	0x61657200
 6b8:	65735f64 	0x65735f64
 6bc:	6c616972 	0x6c616972
 6c0:	61657200 	0x61657200
 6c4:	6f775f64 	0x6f775f64
 6c8:	72006472 	0x72006472
 6cc:	3c646165 	0x3c646165
 6d0:	726f6873 	0x726f6873
 6d4:	6e752074 	0x6e752074
 6d8:	6e676973 	0x6e676973
 6dc:	69206465 	0x69206465
 6e0:	003e746e 	0x3e746e
 6e4:	726f7768 	0x726f7768
 6e8:	00745f64 	0x745f64
 6ec:	64616572 	0x64616572
 6f0:	7479625f 	jalx	1e5897c <_mem_avail_start-0x7e1a7684>
 6f4:	72770065 	0x72770065
 6f8:	3c657469 	0x3c657469
 6fc:	69736e75 	0x69736e75
 700:	64656e67 	0x64656e67
 704:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 708:	Address 0x0000000000000708 is out of bounds.


Disassembly of section .debug_loc:

00000000 <.debug_loc>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	bfc00658 	cache	0x0,1624(s8)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	bfc00668 	cache	0x0,1640(s8)
   8:	68540001 	0x68540001
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	b4bfc006 	0xb4bfc006
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	01bfc006 	srlv	t8,ra,t5
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	06b46100 	0x6b46100
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	06c8bfc0 	tgei	s6,-16448
  1c:	0004bfc0 	sll	s7,a0,0x1f
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	9f5401f3 	0x9f5401f3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	bfc006c8 	cache	0x0,1736(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	bfc0070c 	cache	0x0,1804(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	00610001 	movt	zero,v1,$fcc0
  30:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	58000000 	blezl	zero,38 <_mem_avail_start-0x7fffffc8>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	7bbfc006 	0x7bbfc006
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	01bfc006 	srlv	t8,ra,t5
  40:	067b5500 	0x67b5500
  44:	070cbfc0 	teqi	t8,-16448
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	0004bfc0 	sll	s7,a0,0x1f
  4c:	9f5501f3 	0x9f5501f3
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  58:	bfc006d4 	cache	0x0,1748(s8)
  5c:	bfc006fb 	cache	0x0,1787(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00560001 	0x560001
  64:	00000000 	nop
  68:	f0000000 	0xf0000000
  6c:	14bfc005 	bne	a1,ra,ffff0084 <_text_end+0x403ef02c>
  70:	02bfc006 	srlv	t8,ra,s5
  74:	149f3000 	bne	a0,ra,c078 <_mem_avail_start-0x7fff3f88>
  78:	34bfc006 	ori	ra,a1,0xc006
  7c:	01bfc006 	srlv	t8,ra,t5
  80:	00006000 	sll	t4,zero,0x0
  84:	00000000 	nop
  88:	06280000 	tgei	s1,0
  8c:	063bbfc0 	0x63bbfc0
  90:	0001bfc0 	sll	s7,at,0x1f
  94:	00000056 	0x56
  98:	00000000 	nop
  9c:	c0062800 	ll	a2,10240(zero)
  a0:	c0063bbf 	ll	a2,15295(zero)
  a4:	570001bf 	bnezl	t8,7a4 <_mem_avail_start-0x7ffff85c>
  a8:	00000000 	nop
  ac:	00000000 	nop
  b0:	bfc00628 	cache	0x0,1576(s8)
  b4:	bfc0063b 	cache	0x0,1595(s8)
  b8:	00520001 	0x520001
  bc:	00000000 	nop
  c0:	58000000 	blezl	zero,c4 <_mem_avail_start-0x7fffff3c>
  c4:	8cbfc005 	lw	ra,-16379(a1)
  c8:	01bfc005 	0x1bfc005
  cc:	058c5400 	teqi	t4,21504
  d0:	05e8bfc0 	tgei	t7,-16448
  d4:	0001bfc0 	sll	s7,at,0x1f
  d8:	c005e860 	ll	a1,-6048(zero)
  dc:	c005f0bf 	ll	a1,-3905(zero)
  e0:	f30004bf 	0xf30004bf
  e4:	009f5401 	0x9f5401
  e8:	00000000 	nop
  ec:	58000000 	blezl	zero,f0 <_mem_avail_start-0x7fffff10>
  f0:	8cbfc005 	lw	ra,-16379(a1)
  f4:	02bfc005 	0x2bfc005
  f8:	8c9f3100 	lw	ra,12544(a0)
  fc:	98bfc005 	lwr	ra,-16379(a1)
 100:	01bfc005 	0x1bfc005
 104:	05986100 	0x5986100
 108:	059fbfc0 	0x59fbfc0
 10c:	0001bfc0 	sll	s7,at,0x1f
 110:	c0059f55 	ll	a1,-24747(zero)
 114:	c005a0bf 	ll	a1,-24385(zero)
 118:	810003bf 	lb	zero,959(t0)
 11c:	05a09f7f 	bltz	t5,fffe7f1c <_text_end+0x403e6ec4>
 120:	05e4bfc0 	0x5e4bfc0
 124:	0001bfc0 	sll	s7,at,0x1f
 128:	00000061 	0x61
 12c:	00000000 	nop
 130:	c004e000 	ll	a0,-8192(zero)
 134:	c00538bf 	ll	a1,14527(zero)
 138:	600001bf 	0x600001bf
 13c:	bfc00544 	cache	0x0,1348(s8)
 140:	bfc00558 	cache	0x0,1368(s8)
 144:	00600001 	movf	zero,v1,$fcc0
 148:	00000000 	nop
 14c:	18000000 	blez	zero,150 <_mem_avail_start-0x7ffffeb0>
 150:	2bbfc005 	slti	ra,sp,-16379
 154:	01bfc005 	0x1bfc005
 158:	05445200 	0x5445200
 15c:	054fbfc0 	0x54fbfc0
 160:	0001bfc0 	sll	s7,at,0x1f
 164:	00000052 	mflhxu	zero
 168:	00000000 	nop
 16c:	c0070c00 	ll	a3,3072(zero)
 170:	c00748bf 	ll	a3,18623(zero)
 174:	540001bf 	bnezl	zero,874 <_mem_avail_start-0x7ffff78c>
 178:	bfc00748 	cache	0x0,1864(s8)
 17c:	bfc00768 	cache	0x0,1896(s8)
 180:	68620001 	0x68620001
 184:	7cbfc007 	0x7cbfc007
 188:	04bfc007 	0x4bfc007
 18c:	5401f300 	bnel	zero,at,ffffcd90 <_text_end+0x403fbd38>
 190:	c0077c9f 	ll	a3,31903(zero)
 194:	c00930bf 	ll	t1,12479(zero)
 198:	620001bf 	0x620001bf
	...
 1a4:	bfc00740 	cache	0x0,1856(s8)
 1a8:	bfc00748 	cache	0x0,1864(s8)
 1ac:	9f300002 	0x9f300002
 1b0:	bfc00748 	cache	0x0,1864(s8)
 1b4:	bfc0076c 	cache	0x0,1900(s8)
 1b8:	7c610001 	0x7c610001
 1bc:	90bfc007 	lbu	ra,-16377(a1)
 1c0:	01bfc008 	0x1bfc008
 1c4:	08906100 	j	2418400 <_mem_avail_start-0x7dbe7c00>
 1c8:	0898bfc0 	j	262ff00 <_mem_avail_start-0x7d9d0100>
 1cc:	0003bfc0 	sll	s7,v1,0x1f
 1d0:	989f7f81 	lwr	ra,32641(a0)
 1d4:	e8bfc008 	swc2	$31,-16376(a1)
 1d8:	01bfc008 	0x1bfc008
 1dc:	08f46100 	j	3d18400 <_mem_avail_start-0x7c2e7c00>
 1e0:	0910bfc0 	j	442ff00 <_mem_avail_start-0x7bbd0100>
 1e4:	0001bfc0 	sll	s7,at,0x1f
 1e8:	c0091061 	ll	t1,4193(zero)
 1ec:	c00918bf 	ll	t1,6335(zero)
 1f0:	740006bf 	jalx	1afc <_mem_avail_start-0x7fffe504>
 1f4:	1c008200 	bgtz	zero,fffe09f8 <_text_end+0x403df9a0>
 1f8:	c009189f 	ll	t1,6303(zero)
 1fc:	c00930bf 	ll	t1,12479(zero)
 200:	610001bf 	0x610001bf
	...
 20c:	bfc0077c 	cache	0x0,1916(s8)
 210:	bfc00790 	cache	0x0,1936(s8)
 214:	18640001 	0x18640001
 218:	30bfc009 	andi	ra,a1,0xc009
 21c:	01bfc009 	0x1bfc009
 220:	00006400 	sll	t4,zero,0x10
 224:	00000000 	nop
 228:	07400000 	bltz	k0,22c <_mem_avail_start-0x7ffffdd4>
 22c:	0770bfc0 	bltzal	k1,ffff0130 <_text_end+0x403ef0d8>
 230:	0001bfc0 	sll	s7,at,0x1f
 234:	c0077c60 	ll	a3,31840(zero)
 238:	c00930bf 	ll	t1,12479(zero)
 23c:	600001bf 	0x600001bf
	...
 248:	bfc00790 	cache	0x0,1936(s8)
 24c:	bfc007cc 	cache	0x0,1996(s8)
 250:	dc550001 	ldc3	$21,1(v0)
 254:	fbbfc007 	sdc2	$31,-16377(sp)
 258:	01bfc007 	srav	t8,ra,t5
 25c:	08045500 	j	115400 <_mem_avail_start-0x7feeac00>
 260:	0857bfc0 	j	15eff00 <_mem_avail_start-0x7ea10100>
 264:	0001bfc0 	sll	s7,at,0x1f
 268:	c0086c55 	ll	t0,27733(zero)
 26c:	c0087bbf 	ll	t0,31679(zero)
 270:	550001bf 	bnezl	t0,970 <_mem_avail_start-0x7ffff690>
 274:	bfc00884 	cache	0x0,2180(s8)
 278:	bfc00897 	cache	0x0,2199(s8)
 27c:	a0550001 	sb	s5,1(v0)
 280:	afbfc008 	sw	ra,-16376(sp)
 284:	01bfc008 	0x1bfc008
 288:	08bc5500 	j	2f15400 <_mem_avail_start-0x7d0eac00>
 28c:	08dbbfc0 	j	36eff00 <_mem_avail_start-0x7c910100>
 290:	0001bfc0 	sll	s7,at,0x1f
 294:	c008e455 	ll	t0,-7083(zero)
 298:	c008ecbf 	ll	t0,-4929(zero)
 29c:	550001bf 	bnezl	t0,99c <_mem_avail_start-0x7ffff664>
 2a0:	bfc008f4 	cache	0x0,2292(s8)
 2a4:	bfc00918 	cache	0x0,2328(s8)
 2a8:	00550001 	movt	zero,v0,$fcc5
 2ac:	00000000 	nop
 2b0:	30000000 	andi	zero,zero,0x0
 2b4:	64bfc009 	0x64bfc009
 2b8:	01bfc009 	0x1bfc009
 2bc:	09645400 	j	5915000 <_mem_avail_start-0x7a6eb000>
 2c0:	096cbfc0 	j	5b2ff00 <_mem_avail_start-0x7a4d0100>
 2c4:	0004bfc0 	sll	s7,a0,0x1f
 2c8:	9f1f0080 	0x9f1f0080
 2cc:	bfc0096c 	cache	0x0,2412(s8)
 2d0:	bfc009b4 	cache	0x0,2484(s8)
 2d4:	01f30004 	sllv	zero,s3,t7
 2d8:	09b49f54 	j	6d27d50 <_mem_avail_start-0x792d82b0>
 2dc:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
 2e0:	0001bfc0 	sll	s7,at,0x1f
 2e4:	c009bc54 	ll	t1,-17324(zero)
 2e8:	c00a08bf 	ll	t2,2239(zero)
 2ec:	f30004bf 	0xf30004bf
 2f0:	009f5401 	0x9f5401
 2f4:	00000000 	nop
 2f8:	30000000 	andi	zero,zero,0x0
 2fc:	6bbfc009 	0x6bbfc009
 300:	01bfc009 	0x1bfc009
 304:	096b5500 	j	5ad5400 <_mem_avail_start-0x7a52ac00>
 308:	0984bfc0 	j	612ff00 <_mem_avail_start-0x79ed0100>
 30c:	0001bfc0 	sll	s7,at,0x1f
 310:	c0098463 	ll	t1,-31645(zero)
 314:	c009b4bf 	ll	t1,-19265(zero)
 318:	f30004bf 	0xf30004bf
 31c:	b49f5501 	0xb49f5501
 320:	bcbfc009 	cache	0x1f,-16375(a1)
 324:	01bfc009 	0x1bfc009
 328:	09bc5500 	j	6f15400 <_mem_avail_start-0x790eac00>
 32c:	09d8bfc0 	j	762ff00 <_mem_avail_start-0x789d0100>
 330:	0001bfc0 	sll	s7,at,0x1f
 334:	c009d863 	ll	t1,-10141(zero)
 338:	c00a08bf 	ll	t2,2239(zero)
 33c:	f30004bf 	0xf30004bf
 340:	009f5501 	0x9f5501
 344:	00000000 	nop
 348:	30000000 	andi	zero,zero,0x0
 34c:	6bbfc009 	0x6bbfc009
 350:	01bfc009 	0x1bfc009
 354:	096b5600 	j	5ad5800 <_mem_avail_start-0x7a52a800>
 358:	0998bfc0 	j	662ff00 <_mem_avail_start-0x799d0100>
 35c:	0001bfc0 	sll	s7,at,0x1f
 360:	c0099864 	ll	t1,-26524(zero)
 364:	c009b4bf 	ll	t1,-19265(zero)
 368:	f30004bf 	0xf30004bf
 36c:	b49f5601 	0xb49f5601
 370:	bcbfc009 	cache	0x1f,-16375(a1)
 374:	01bfc009 	0x1bfc009
 378:	09bc5600 	j	6f15800 <_mem_avail_start-0x790ea800>
 37c:	0a08bfc0 	j	822ff00 <_mem_avail_start-0x77dd0100>
 380:	0001bfc0 	sll	s7,at,0x1f
 384:	00000064 	0x64
 388:	00000000 	nop
 38c:	c0093000 	ll	t1,12288(zero)
 390:	c0096bbf 	ll	t1,27583(zero)
 394:	570001bf 	bnezl	t8,a94 <_mem_avail_start-0x7ffff56c>
 398:	bfc0096b 	cache	0x0,2411(s8)
 39c:	bfc009b4 	cache	0x0,2484(s8)
 3a0:	01f30004 	sllv	zero,s3,t7
 3a4:	09b49f57 	j	6d27d5c <_mem_avail_start-0x792d82a4>
 3a8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
 3ac:	0001bfc0 	sll	s7,at,0x1f
 3b0:	c009bc57 	ll	t1,-17321(zero)
 3b4:	c00a08bf 	ll	t2,2239(zero)
 3b8:	f30004bf 	0xf30004bf
 3bc:	009f5701 	0x9f5701
 3c0:	00000000 	nop
 3c4:	74000000 	jalx	0 <_mem_avail_start-0x80000000>
 3c8:	a0bfc009 	sb	ra,-16375(a1)
 3cc:	01bfc009 	0x1bfc009
 3d0:	09bc6200 	j	6f18800 <_mem_avail_start-0x790e7800>
 3d4:	09d0bfc0 	j	742ff00 <_mem_avail_start-0x78bd0100>
 3d8:	0001bfc0 	sll	s7,at,0x1f
 3dc:	c009d862 	ll	t1,-10142(zero)
 3e0:	c00a08bf 	ll	t2,2239(zero)
 3e4:	620001bf 	0x620001bf
	...
 3f0:	bfc0097c 	cache	0x0,2428(s8)
 3f4:	bfc00984 	cache	0x0,2436(s8)
 3f8:	0083000e 	0x83000e
 3fc:	16008212 	bnez	s0,fffe0c48 <_text_end+0x403dfbf0>
 400:	01282b14 	0x1282b14
 404:	9f131600 	0x9f131600
 408:	bfc00984 	cache	0x0,2436(s8)
 40c:	bfc00988 	cache	0x0,2440(s8)
 410:	01f3000f 	0x1f3000f
 414:	00821255 	0x821255
 418:	282b1416 	slti	t3,at,5142
 41c:	13160001 	beq	t8,s6,424 <_mem_avail_start-0x7ffffbdc>
 420:	c009889f 	ll	t1,-30561(zero)
 424:	c009a8bf 	ll	t1,-22337(zero)
 428:	600001bf 	0x600001bf
 42c:	bfc009d8 	cache	0x0,2520(s8)
 430:	bfc00a08 	cache	0x0,2568(s8)
 434:	00600001 	movf	zero,v1,$fcc0
 438:	00000000 	nop
 43c:	e8000000 	swc2	$0,0(zero)
 440:	f4bfc009 	sdc1	$f31,-16375(a1)
 444:	01bfc009 	0x1bfc009
 448:	00005200 	sll	t2,zero,0x8
 44c:	00000000 	nop
 450:	09640000 	j	5900000 <_mem_avail_start-0x7a700000>
 454:	096cbfc0 	j	5b2ff00 <_mem_avail_start-0x7a4d0100>
 458:	0001bfc0 	sll	s7,at,0x1f
 45c:	c0097460 	ll	t1,29792(zero)
 460:	c00980bf 	ll	t1,-32577(zero)
 464:	600001bf 	0x600001bf
 468:	bfc009b4 	cache	0x0,2484(s8)
 46c:	bfc009bc 	cache	0x0,2492(s8)
 470:	bc540001 	cache	0x14,1(v0)
 474:	d8bfc009 	ldc2	$31,-16375(a1)
 478:	01bfc009 	0x1bfc009
 47c:	00006000 	sll	t4,zero,0x0
	...
 48c:	00010000 	sll	zero,at,0x0
 490:	00000055 	0x55
 494:	00000000 	nop
 498:	56000100 	bnezl	s0,89c <_mem_avail_start-0x7ffff764>
 49c:	00000000 	nop
 4a0:	00000000 	nop
 4a4:	01f30004 	sllv	zero,s3,t7
 4a8:	00009f55 	0x9f55
	...
 4b8:	00010000 	sll	zero,at,0x0
 4bc:	00000054 	0x54
 4c0:	00000000 	nop
 4c4:	f3000400 	0xf3000400
 4c8:	009f5401 	0x9f5401
	...
 4d8:	01000000 	0x1000000
 4dc:	00005500 	sll	t2,zero,0x14
 4e0:	00000000 	nop
 4e4:	00040000 	sll	zero,a0,0x0
 4e8:	9f5501f3 	0x9f5501f3
	...
 4fc:	00560001 	0x560001
 500:	00000000 	nop
 504:	06000000 	bltz	s0,508 <_mem_avail_start-0x7ffffaf8>
 508:	5601f300 	bnel	s0,at,ffffd10c <_text_end+0x403fc0b4>
 50c:	009f1c31 	tgeu	a0,ra,0x70
	...
 51c:	01000000 	0x1000000
 520:	00005400 	sll	t2,zero,0x10
 524:	00000000 	nop
 528:	00010000 	sll	zero,at,0x0
 52c:	00000052 	mflhxu	zero
	...
 53c:	55000100 	bnezl	t0,940 <_mem_avail_start-0x7ffff6c0>
 540:	00000000 	nop
 544:	00000000 	nop
 548:	01f30004 	sllv	zero,s3,t7
 54c:	00009f55 	0x9f55
 550:	00000000 	nop
 554:	00010000 	sll	zero,at,0x0
 558:	00000055 	0x55
 55c:	00000000 	nop
 560:	f3000400 	0xf3000400
 564:	009f5501 	0x9f5501
	...
 574:	01000000 	0x1000000
 578:	00005600 	sll	t2,zero,0x18
 57c:	00000000 	nop
 580:	000a0000 	sll	zero,t2,0x0
 584:	72200073 	0x72200073
 588:	00762200 	0x762200
 58c:	00009f22 	0x9f22
 590:	00000000 	nop
 594:	00010000 	sll	zero,at,0x0
 598:	00000056 	0x56
 59c:	00000000 	nop
 5a0:	f3001000 	0xf3001000
 5a4:	73205601 	0x73205601
 5a8:	01f32200 	0x1f32200
 5ac:	01f31c55 	0x1f31c55
 5b0:	009f2256 	0x9f2256
 5b4:	00000000 	nop
 5b8:	07000000 	bltz	t8,5bc <_mem_avail_start-0x7ffffa44>
 5bc:	f3007300 	0xf3007300
 5c0:	9f1c5501 	0x9f1c5501
	...
 5cc:	0073000a 	movz	zero,v1,s3
 5d0:	22007220 	addi	zero,s0,29216
 5d4:	9f220076 	0x9f220076
	...
 5e0:	00720009 	0x720009
 5e4:	761c0073 	jalx	87001cc <_mem_avail_start-0x778ffe34>
 5e8:	009f2200 	0x9f2200
	...
 5f8:	01000000 	0x1000000
 5fc:	00005500 	sll	t2,zero,0x14
 600:	00000000 	nop
 604:	00010000 	sll	zero,at,0x0
 608:	00000053 	mtlhx	zero
 60c:	00000000 	nop
 610:	55000100 	bnezl	t0,a14 <_mem_avail_start-0x7ffff5ec>
 614:	00000000 	nop
	...
 624:	00540001 	movf	zero,v0,$fcc5
 628:	00000000 	nop
 62c:	01000000 	0x1000000
 630:	00005200 	sll	t2,zero,0x8
 634:	00000000 	nop
 638:	00010000 	sll	zero,at,0x0
 63c:	00000053 	mtlhx	zero
 640:	00000000 	nop
 644:	52000100 	beqzl	s0,a48 <_mem_avail_start-0x7ffff5b8>
 648:	00000000 	nop
 64c:	00000000 	nop
 650:	00570001 	0x570001
 654:	00000000 	nop
 658:	01000000 	0x1000000
 65c:	00005500 	sll	t2,zero,0x14
 660:	00000000 	nop
 664:	00010000 	sll	zero,at,0x0
 668:	00000053 	mtlhx	zero
	...
 678:	54000100 	bnezl	zero,a7c <_mem_avail_start-0x7ffff584>
 67c:	00000000 	nop
 680:	00000000 	nop
 684:	00520001 	0x520001
	...
 694:	01000000 	0x1000000
 698:	00005500 	sll	t2,zero,0x14
 69c:	00000000 	nop
 6a0:	00040000 	sll	zero,a0,0x0
 6a4:	9f5501f3 	0x9f5501f3
	...
 6b8:	00560001 	0x560001
 6bc:	00000000 	nop
 6c0:	04000000 	bltz	zero,6c4 <_mem_avail_start-0x7ffff93c>
 6c4:	5601f300 	bnel	s0,at,ffffd2c8 <_text_end+0x403fc270>
 6c8:	0000009f 	0x9f
 6cc:	00000000 	nop
 6d0:	73000b00 	0x73000b00
 6d4:	00722000 	0x722000
 6d8:	5601f322 	bnel	s0,at,ffffd364 <_text_end+0x403fc30c>
 6dc:	00009f22 	0x9f22
 6e0:	00000000 	nop
 6e4:	000a0000 	sll	zero,t2,0x0
 6e8:	00730072 	tlt	v1,s3,0x1
 6ec:	5601f31c 	bnel	s0,at,ffffd360 <_text_end+0x403fc308>
 6f0:	00009f22 	0x9f22
	...
 700:	00010000 	sll	zero,at,0x0
 704:	00000054 	0x54
 708:	00000000 	nop
 70c:	53000100 	beqzl	t8,b10 <_mem_avail_start-0x7ffff4f0>
 710:	00000000 	nop
 714:	00000000 	nop
 718:	bfc00a08 	cache	0x0,2568(s8)
 71c:	bfc00a14 	cache	0x0,2580(s8)
 720:	14540001 	bne	v0,s4,728 <_mem_avail_start-0x7ffff8d8>
 724:	2cbfc00a 	sltiu	ra,a1,-16374
 728:	01bfc00a 	movz	t8,t5,ra
 72c:	00005200 	sll	t2,zero,0x8
 730:	00000000 	nop
 734:	0a080000 	j	8200000 <_mem_avail_start-0x77e00000>
 738:	0a10bfc0 	j	842ff00 <_mem_avail_start-0x77bd0100>
 73c:	0001bfc0 	sll	s7,at,0x1f
 740:	c00a1056 	ll	t2,4182(zero)
 744:	c00a14bf 	ll	t2,5311(zero)
 748:	f30004bf 	0xf30004bf
 74c:	149f5601 	bne	a0,ra,15f54 <_mem_avail_start-0x7ffea0ac>
 750:	24bfc00a 	addiu	ra,a1,-16374
 754:	0bbfc00a 	j	eff0028 <_mem_avail_start-0x7100ffd8>
 758:	20007300 	addi	zero,zero,29440
 75c:	f3220072 	0xf3220072
 760:	9f225601 	0x9f225601
 764:	bfc00a24 	cache	0x0,2596(s8)
 768:	bfc00a2c 	cache	0x0,2604(s8)
 76c:	0072000a 	movz	zero,v1,s2
 770:	f31c0073 	0xf31c0073
 774:	9f225601 	0x9f225601
	...
 780:	bfc00a0c 	cache	0x0,2572(s8)
 784:	bfc00a14 	cache	0x0,2580(s8)
 788:	14540001 	bne	v0,s4,790 <_mem_avail_start-0x7ffff870>
 78c:	2cbfc00a 	sltiu	ra,a1,-16374
 790:	01bfc00a 	movz	t8,t5,ra
 794:	00005300 	sll	t2,zero,0xc
	...
 7a4:	00010000 	sll	zero,at,0x0
 7a8:	00000054 	0x54
 7ac:	00000000 	nop
 7b0:	52000100 	beqzl	s0,bb4 <_mem_avail_start-0x7ffff44c>
 7b4:	00000000 	nop
	...
 7c4:	00540001 	movf	zero,v0,$fcc5
 7c8:	00000000 	nop
 7cc:	01000000 	0x1000000
 7d0:	00005200 	sll	t2,zero,0x8
 7d4:	00000000 	nop
 7d8:	00010000 	sll	zero,at,0x0
 7dc:	00000052 	mflhxu	zero
	...
 7ec:	54000100 	bnezl	zero,bf0 <_mem_avail_start-0x7ffff410>
 7f0:	00000000 	nop
 7f4:	00000000 	nop
 7f8:	00540001 	movf	zero,v0,$fcc5
	...
 808:	01000000 	0x1000000
 80c:	00005500 	sll	t2,zero,0x14
 810:	00000000 	nop
 814:	00010000 	sll	zero,at,0x0
 818:	00000055 	0x55
	...
 828:	56000100 	bnezl	s0,c2c <_mem_avail_start-0x7ffff3d4>
 82c:	00000000 	nop
 830:	00000000 	nop
 834:	01f30004 	sllv	zero,s3,t7
 838:	00009f56 	0x9f56
 83c:	00000000 	nop
 840:	00060000 	sll	zero,a2,0x0
 844:	315601f3 	andi	s6,t2,0x1f3
 848:	00009f1c 	0x9f1c
 84c:	00000000 	nop
 850:	00040000 	sll	zero,a0,0x0
 854:	9f5601f3 	0x9f5601f3
	...
 868:	00540001 	movf	zero,v0,$fcc5
 86c:	00000000 	nop
 870:	01000000 	0x1000000
 874:	00005400 	sll	t2,zero,0x10
	...
 884:	00010000 	sll	zero,at,0x0
 888:	00000055 	0x55
 88c:	00000000 	nop
 890:	55000100 	bnezl	t0,c94 <_mem_avail_start-0x7ffff36c>
 894:	00000000 	nop
	...
 8a4:	00540001 	movf	zero,v0,$fcc5
 8a8:	00000000 	nop
 8ac:	01000000 	0x1000000
 8b0:	00005200 	sll	t2,zero,0x8
	...
 8c0:	00010000 	sll	zero,at,0x0
 8c4:	00000055 	0x55
 8c8:	00000000 	nop
 8cc:	55000100 	bnezl	t0,cd0 <_mem_avail_start-0x7ffff330>
 8d0:	00000000 	nop
	...
 8e0:	00560001 	0x560001
 8e4:	00000000 	nop
 8e8:	04000000 	bltz	zero,8ec <_mem_avail_start-0x7ffff714>
 8ec:	5601f300 	bnel	s0,at,ffffd4f0 <_text_end+0x403fc498>
 8f0:	0000009f 	0x9f
 8f4:	00000000 	nop
 8f8:	72000a00 	0x72000a00
 8fc:	1c007300 	bgtz	zero,1d500 <_mem_avail_start-0x7ffe2b00>
 900:	225601f3 	addi	s6,s2,499
 904:	0000009f 	0x9f
	...
 914:	54000100 	bnezl	zero,d18 <_mem_avail_start-0x7ffff2e8>
 918:	00000000 	nop
 91c:	00000000 	nop
 920:	00530001 	0x530001
	...
 930:	01000000 	0x1000000
 934:	00005400 	sll	t2,zero,0x10
 938:	00000000 	nop
 93c:	00010000 	sll	zero,at,0x0
 940:	00000052 	mflhxu	zero
	...
 950:	55000100 	bnezl	t0,d54 <_mem_avail_start-0x7ffff2ac>
 954:	00000000 	nop
 958:	00000000 	nop
 95c:	00550001 	movt	zero,v0,$fcc5
	...
 96c:	01000000 	0x1000000
 970:	00005400 	sll	t2,zero,0x10
 974:	00000000 	nop
 978:	00010000 	sll	zero,at,0x0
 97c:	00000053 	mtlhx	zero
	...
 98c:	54000100 	bnezl	zero,d90 <_mem_avail_start-0x7ffff270>
 990:	00000000 	nop
 994:	00000000 	nop
 998:	00740006 	srlv	zero,s4,v1
 99c:	9f220072 	0x9f220072
	...
 9a8:	00720008 	0x720008
 9ac:	23220074 	addi	v0,t9,116
 9b0:	00009f01 	0x9f01
 9b4:	00000000 	nop
 9b8:	00060000 	sll	zero,a2,0x0
 9bc:	00740072 	tlt	v1,s4,0x1
 9c0:	00009f22 	0x9f22
	...
 9d0:	00020000 	sll	zero,v0,0x0
 9d4:	00009f30 	tge	zero,zero,0x27c
 9d8:	00000000 	nop
 9dc:	00010000 	sll	zero,at,0x0
 9e0:	00000052 	mflhxu	zero
	...
 9f0:	54000100 	bnezl	zero,df4 <_mem_avail_start-0x7ffff20c>
 9f4:	00000000 	nop
 9f8:	00000000 	nop
 9fc:	00530001 	0x530001
	...
 a0c:	02000000 	0x2000000
 a10:	009f3000 	0x9f3000
 a14:	00000000 	nop
 a18:	01000000 	0x1000000
 a1c:	00005200 	sll	t2,zero,0x8
 a20:	00000000 	nop
 a24:	0a8c0000 	j	a300000 <_mem_avail_start-0x75d00000>
 a28:	0a9bbfc0 	j	a6eff00 <_mem_avail_start-0x75910100>
 a2c:	0001bfc0 	sll	s7,at,0x1f
 a30:	c00a9b54 	ll	t2,-25772(zero)
 a34:	c00abcbf 	ll	t2,-17217(zero)
 a38:	f30004bf 	0xf30004bf
 a3c:	009f5401 	0x9f5401
 a40:	00000000 	nop
 a44:	2c000000 	sltiu	zero,zero,0
 a48:	48bfc00a 	0x48bfc00a
 a4c:	01bfc00a 	movz	t8,t5,ra
 a50:	0a485400 	j	9215000 <_mem_avail_start-0x76deb000>
 a54:	0a5cbfc0 	j	972ff00 <_mem_avail_start-0x768d0100>
 a58:	0001bfc0 	sll	s7,at,0x1f
 a5c:	c00a6c61 	ll	t2,27745(zero)
 a60:	c00a8cbf 	ll	t2,-29505(zero)
 a64:	610001bf 	0x610001bf
	...
 a70:	bfc00a4c 	cache	0x0,2636(s8)
 a74:	bfc00a60 	cache	0x0,2656(s8)
 a78:	6c600001 	0x6c600001
 a7c:	8cbfc00a 	lw	ra,-16374(a1)
 a80:	01bfc00a 	movz	t8,t5,ra
 a84:	00006000 	sll	t4,zero,0x0
 a88:	00000000 	nop
 a8c:	0abc0000 	j	af00000 <_mem_avail_start-0x75100000>
 a90:	0ac8bfc0 	j	b22ff00 <_mem_avail_start-0x74dd0100>
 a94:	0001bfc0 	sll	s7,at,0x1f
 a98:	c00ac854 	ll	t2,-14252(zero)
 a9c:	c00ae0bf 	ll	t2,-8001(zero)
 aa0:	600001bf 	0x600001bf
 aa4:	bfc00ae0 	cache	0x0,2784(s8)
 aa8:	bfc00ae8 	cache	0x0,2792(s8)
 aac:	00520001 	0x520001
	...
 abc:	06000000 	bltz	s0,ac0 <_mem_avail_start-0x7ffff540>
 ac0:	20049e00 	addi	a0,zero,-25088
 ac4:	00bff0f0 	tge	a1,ra,0x3c3
 ac8:	00000000 	nop
 acc:	54000000 	bnezl	zero,ad0 <_mem_avail_start-0x7ffff530>
 ad0:	60bfc00b 	0x60bfc00b
 ad4:	01bfc00b 	movn	t8,t5,ra
 ad8:	00005400 	sll	t2,zero,0x10
 adc:	00000000 	nop
 ae0:	0b540000 	j	d500000 <_mem_avail_start-0x72b00000>
 ae4:	0b60bfc0 	j	d82ff00 <_mem_avail_start-0x727d0100>
 ae8:	0006bfc0 	sll	s7,a2,0x1f
 aec:	f010049e 	0xf010049e
 af0:	0000bff0 	tge	zero,zero,0x2ff
 af4:	00000000 	nop
 af8:	0b400000 	j	d000000 <_mem_avail_start-0x73000000>
 afc:	0b4cbfc0 	j	d32ff00 <_mem_avail_start-0x72cd0100>
 b00:	0001bfc0 	sll	s7,at,0x1f
 b04:	00000054 	0x54
 b08:	00000000 	nop
 b0c:	c00b4000 	ll	t3,16384(zero)
 b10:	c00b4cbf 	ll	t3,19647(zero)
 b14:	9e0006bf 	0x9e0006bf
 b18:	f0f00004 	0xf0f00004
 b1c:	000000bf 	0xbf
	...
 b2c:	30000200 	andi	zero,zero,0x200
 b30:	0000009f 	0x9f
 b34:	00000000 	nop
 b38:	74000600 	jalx	1800 <_mem_avail_start-0x7fffe800>
 b3c:	1aff0800 	0x1aff0800
 b40:	0000009f 	0x9f
 b44:	00000000 	nop
 b48:	75000e00 	jalx	4003800 <_mem_avail_start-0x7bffc800>
 b4c:	1aff0800 	0x1aff0800
 b50:	00742438 	0x742438
 b54:	211aff08 	addi	k0,t0,-248
 b58:	0000009f 	0x9f
 b5c:	00000000 	nop
 b60:	54000100 	bnezl	zero,f64 <_mem_avail_start-0x7ffff09c>
 b64:	00000000 	nop
 b68:	00000000 	nop
 b6c:	0072000b 	movn	zero,v1,s2
 b70:	481aff08 	0x481aff08
 b74:	21007424 	addi	zero,t0,29732
 b78:	0000009f 	0x9f
 b7c:	00000000 	nop
 b80:	c00b3400 	ll	t3,13312(zero)
 b84:	c00b38bf 	ll	t3,14527(zero)
 b88:	540001bf 	bnezl	zero,1288 <_mem_avail_start-0x7fffed78>
 b8c:	00000000 	nop
 b90:	00000000 	nop
 b94:	bfc00b34 	cache	0x0,2868(s8)
 b98:	bfc00b38 	cache	0x0,2872(s8)
 b9c:	049e0006 	0x49e0006
 ba0:	bfd03000 	cache	0x10,12288(s8)
	...
 bac:	bfc00ae8 	cache	0x0,2792(s8)
 bb0:	bfc00af4 	cache	0x0,2804(s8)
 bb4:	81090003 	lb	t1,3(t0)
 bb8:	0000009f 	0x9f
 bbc:	00000000 	nop
 bc0:	c00ae800 	ll	t2,-6144(zero)
 bc4:	c00af4bf 	ll	t2,-2881(zero)
 bc8:	9e0006bf 	0x9e0006bf
 bcc:	d0300804 	0xd0300804
 bd0:	000000bf 	0xbf
 bd4:	00000000 	nop
 bd8:	c00af400 	ll	t2,-3072(zero)
 bdc:	c00afcbf 	ll	t2,-833(zero)
 be0:	090003bf 	j	4000efc <_mem_avail_start-0x7bfff104>
 be4:	00009f80 	sll	s3,zero,0x1e
 be8:	00000000 	nop
 bec:	0af40000 	j	bd00000 <_mem_avail_start-0x74300000>
 bf0:	0afcbfc0 	j	bf2ff00 <_mem_avail_start-0x740d0100>
 bf4:	0006bfc0 	sll	s7,a2,0x1f
 bf8:	300c049e 	andi	t4,zero,0x49e
 bfc:	0000bfd0 	0xbfd0
 c00:	00000000 	nop
 c04:	0afc0000 	j	bf00000 <_mem_avail_start-0x74100000>
 c08:	0b04bfc0 	j	c12ff00 <_mem_avail_start-0x73ed0100>
 c0c:	0003bfc0 	sll	s7,v1,0x1f
 c10:	009f3608 	0x9f3608
 c14:	00000000 	nop
 c18:	fc000000 	sdc3	$0,0(zero)
 c1c:	04bfc00a 	0x4bfc00a
 c20:	06bfc00b 	0x6bfc00b
 c24:	00049e00 	sll	s3,a0,0x18
 c28:	00bfd030 	tge	a1,ra,0x340
 c2c:	00000000 	nop
 c30:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
 c34:	10bfc00b 	beq	a1,ra,ffff0c64 <_text_end+0x403efc0c>
 c38:	02bfc00b 	movn	t8,s5,ra
 c3c:	009f3300 	0x9f3300
 c40:	00000000 	nop
 c44:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
 c48:	10bfc00b 	beq	a1,ra,ffff0c78 <_text_end+0x403efc20>
 c4c:	06bfc00b 	0x6bfc00b
 c50:	0c049e00 	jal	127800 <_mem_avail_start-0x7fed8800>
 c54:	00bfd030 	tge	a1,ra,0x340
 c58:	00000000 	nop
 c5c:	04000000 	bltz	zero,c60 <_mem_avail_start-0x7ffff3a0>
 c60:	0cbfc00b 	jal	2ff002c <_mem_avail_start-0x7d00ffd4>
 c64:	02bfc00b 	movn	t8,s5,ra
 c68:	009f3000 	0x9f3000
 c6c:	00000000 	nop
 c70:	04000000 	bltz	zero,c74 <_mem_avail_start-0x7ffff38c>
 c74:	0cbfc00b 	jal	2ff002c <_mem_avail_start-0x7d00ffd4>
 c78:	06bfc00b 	0x6bfc00b
 c7c:	04049e00 	0x4049e00
 c80:	00bfd030 	tge	a1,ra,0x340
 c84:	00000000 	nop
 c88:	10000000 	b	c8c <_mem_avail_start-0x7ffff374>
 c8c:	14bfc00b 	bne	a1,ra,ffff0cbc <_text_end+0x403efc64>
 c90:	02bfc00b 	movn	t8,s5,ra
 c94:	009f3000 	0x9f3000
 c98:	00000000 	nop
 c9c:	10000000 	b	ca0 <_mem_avail_start-0x7ffff360>
 ca0:	14bfc00b 	bne	a1,ra,ffff0cd0 <_text_end+0x403efc78>
 ca4:	06bfc00b 	0x6bfc00b
 ca8:	10049e00 	beq	zero,a0,fffe84ac <_text_end+0x403e7454>
 cac:	00bfd030 	tge	a1,ra,0x340
 cb0:	00000000 	nop
 cb4:	14000000 	bnez	zero,cb8 <_mem_avail_start-0x7ffff348>
 cb8:	18bfc00b 	0x18bfc00b
 cbc:	02bfc00b 	movn	t8,s5,ra
 cc0:	009f3000 	0x9f3000
 cc4:	00000000 	nop
 cc8:	14000000 	bnez	zero,ccc <_mem_avail_start-0x7ffff334>
 ccc:	18bfc00b 	0x18bfc00b
 cd0:	06bfc00b 	0x6bfc00b
 cd4:	04049e00 	0x4049e00
 cd8:	00bfd030 	tge	a1,ra,0x340
	...
 ce8:	01000000 	0x1000000
 cec:	00005500 	sll	t2,zero,0x14
	...
 cfc:	00010000 	sll	zero,at,0x0
 d00:	00000054 	0x54
	...
 d10:	54000100 	bnezl	zero,1114 <_mem_avail_start-0x7fffeeec>
 d14:	00000000 	nop
	...
 d24:	00540001 	movf	zero,v0,$fcc5
	...
 d34:	01000000 	0x1000000
 d38:	00005500 	sll	t2,zero,0x14
	...
 d48:	00010000 	sll	zero,at,0x0
 d4c:	00000054 	0x54
	...
 d5c:	55000100 	bnezl	t0,1160 <_mem_avail_start-0x7fffeea0>
 d60:	00000000 	nop
	...
 d70:	00540001 	movf	zero,v0,$fcc5
	...
 d80:	01000000 	0x1000000
 d84:	00005500 	sll	t2,zero,0x14
	...
 d94:	00010000 	sll	zero,at,0x0
 d98:	00000054 	0x54
 d9c:	00000000 	nop
	...

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
  18:	bfc00490 	cache	0x0,1168(s8)
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
  5c:	bfc00558 	cache	0x0,1368(s8)
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
  88:	bfc005f0 	cache	0x0,1520(s8)
  8c:	00000068 	0x68
  90:	44280e44 	0x44280e44
  94:	92500391 	lbu	s0,913(s2)
  98:	9f049002 	0x9f049002
  9c:	0e500201 	jal	9400804 <_mem_avail_start-0x76bff7fc>
  a0:	d2d1d000 	0xd2d1d000
  a4:	000000df 	0xdf
  a8:	00000024 	and	zero,zero,zero
  ac:	00000000 	nop
  b0:	bfc00658 	cache	0x0,1624(s8)
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
  e8:	bfc0070c 	cache	0x0,1804(s8)
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
 128:	bfc00930 	cache	0x0,2352(s8)
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
 1e4:	bfc00a08 	cache	0x0,2568(s8)
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
 244:	bfc00a2c 	cache	0x0,2604(s8)
 248:	00000060 	0x60
 24c:	50200e44 	beqzl	at,3b60 <_mem_avail_start-0x7fffc4a0>
 250:	03910292 	0x3910292
 254:	0490019f 	bltzal	a0,8d4 <_mem_avail_start-0x7ffff72c>
 258:	000e0a6c 	0xe0a6c
 25c:	dfd2d1d0 	ldc3	$18,-11824(s8)
 260:	0000000b 	movn	zero,zero,zero
 264:	00000018 	mult	zero,zero
 268:	0000022c 	0x22c
 26c:	bfc00a8c 	cache	0x0,2700(s8)
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
 298:	bfc00abc 	cache	0x0,2748(s8)
 29c:	0000002c 	0x2c
 2a0:	44180e44 	0x44180e44
 2a4:	9f480290 	0x9f480290
 2a8:	000e5c01 	0xe5c01
 2ac:	0000dfd0 	0xdfd0
