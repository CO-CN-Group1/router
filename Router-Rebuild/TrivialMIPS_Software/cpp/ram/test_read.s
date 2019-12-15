
test_read.ram.elf:     file format elf32-tradlittlemips
test_read.ram.elf


Disassembly of section .text:

88000000 <_mem_avail_end>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:8
	.set        noreorder

.org 0x0
_start:
	# write the segment to indicate boot progress
    li      $s2, 0xbff0f010
88000000:	3c12bff0 	lui	s2,0xbff0
88000004:	3652f010 	ori	s2,s2,0xf010
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:9
    li      $t3, 0x00000001
88000008:	240b0001 	li	t3,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:10
    sw      $t3, 0($s2)
8800000c:	ae4b0000 	sw	t3,0(s2)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:15

#ifndef CODE_INTO_BOOTROM
	# setup exception handler
	# la		$t1, _text
    mtc0    $zero, $15, 1 # set c0_ebase to 0
88000010:	40807801 	mtc0	zero,$15,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:16
    mtc0    $zero, $12 # use ebase and disable interrupts
88000014:	40806000 	mtc0	zero,c0_status
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:20
#endif

	# progress: 2
	li      $t3, 0x00000002
88000018:	240b0002 	li	t3,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:21
    sw      $t3, 0($s2)
8800001c:	ae4b0000 	sw	t3,0(s2)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:24

	# setup stack pointer
    la 		$sp, _stack
88000020:	3c1d8800 	lui	sp,0x8800
88000024:	27bdffe0 	addiu	sp,sp,-32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:25
    la		$gp, _gp
88000028:	3c1c8000 	lui	gp,0x8000
8800002c:	279c0000 	addiu	gp,gp,0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:28

	# progress: 3
	li      $t3, 0x00000003
88000030:	240b0003 	li	t3,3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:29
    sw      $t3, 0($s2)
88000034:	ae4b0000 	sw	t3,0(s2)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:32

	# jump to our code
    jal 	_main
88000038:	0e0000a4 	jal	88000290 <_main>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:33
    nop
8800003c:	00000000 	nop

88000040 <_loop>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:36

_loop:
    li      $t3, 0x00000000
88000040:	240b0000 	li	t3,0

88000044 <_loop_body>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:38
_loop_body:
	li		$s1, 0xbff0e000   # $s1 = 0xbfd0e0000 (100 MHz Clock)
88000044:	3c11bff0 	lui	s1,0xbff0
88000048:	3631e000 	ori	s1,s1,0xe000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:39
	lw		$t1, 0($s1)       # $t1 = time
8800004c:	8e290000 	lw	t1,0(s1)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:40
	li      $t2, 0x02faf080    # $t2 = 0x02faf080 (50000000)
88000050:	3c0a02fa 	lui	t2,0x2fa
88000054:	354af080 	ori	t2,t2,0xf080
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:41
	add     $t0, $t1, $t2     # $t0 = $t1 + 0.5s
88000058:	012a4020 	add	t0,t1,t2

8800005c <_wait>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:44

_wait:
    lw      $t1, 0($s1)
8800005c:	8e290000 	lw	t1,0(s1)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:45
    beq     $t0, $t1, _switch_led_status
88000060:	11090003 	beq	t0,t1,88000070 <_switch_led_status>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:46
    nop
88000064:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:47
    b       _wait
88000068:	1000fffc 	b	8800005c <_wait>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:48
    nop
8800006c:	00000000 	nop

88000070 <_switch_led_status>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:51

_switch_led_status:
    li      $s2, 0xbff0f010      # write 0xbfd0f010 (numbers)
88000070:	3c12bff0 	lui	s2,0xbff0
88000074:	3652f010 	ori	s2,s2,0xf010
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:52
    nor     $t3, $t3, $t3    # $t3 = ~$t3
88000078:	016b5827 	nor	t3,t3,t3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:53
    sw      $t3, 0($s2)
8800007c:	ae4b0000 	sw	t3,0(s2)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:54
    b       _loop_body
88000080:	1000fff0 	b	88000044 <_loop_body>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:55
    nop
88000084:	00000000 	nop
	...

88000180 <_exception>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:73
#else
.org 0x180
#endif

_exception:
    li    $k0, 0x0
88000180:	241a0000 	li	k0,0

88000184 <_exception_entry>:
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:75
_exception_entry:
    move  $k1, $s0                  # save old sp
88000184:	0200d825 	move	k1,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:76
    la    $sp, _exception_stack_top # switch to exception stack
88000188:	3c1d8000 	lui	sp,0x8000
8800018c:	27bd1000 	addiu	sp,sp,4096
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:77
	addiu $sp, $sp, -200
88000190:	27bdff38 	addiu	sp,sp,-200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:80

	# save general registers
	sw $ra, 160($sp)
88000194:	afbf00a0 	sw	ra,160(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:81
	sw $fp, 156($sp)
88000198:	afbe009c 	sw	s8,156(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:82
	sw $k1, 152($sp)  # k1 = old sp
8800019c:	afbb0098 	sw	k1,152(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:83
	sw $gp, 148($sp)
880001a0:	afbc0094 	sw	gp,148(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:84
	sw $k1, 144($sp)  # real k1 is damaged
880001a4:	afbb0090 	sw	k1,144(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:85
	sw $k0, 140($sp)  # real k0 is damaged
880001a8:	afba008c 	sw	k0,140(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:86
	sw $t9, 136($sp)
880001ac:	afb90088 	sw	t9,136(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:87
	sw $t8, 132($sp)
880001b0:	afb80084 	sw	t8,132(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:88
	sw $s7, 128($sp)
880001b4:	afb70080 	sw	s7,128(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:89
	sw $s6, 124($sp)
880001b8:	afb6007c 	sw	s6,124(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:90
	sw $s5, 120($sp)
880001bc:	afb50078 	sw	s5,120(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:91
	sw $s4, 116($sp)
880001c0:	afb40074 	sw	s4,116(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:92
	sw $s3, 112($sp)
880001c4:	afb30070 	sw	s3,112(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:93
	sw $s2, 108($sp)
880001c8:	afb2006c 	sw	s2,108(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:94
	sw $s1, 104($sp)
880001cc:	afb10068 	sw	s1,104(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:95
	sw $s0, 100($sp)
880001d0:	afb00064 	sw	s0,100(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:96
	sw $t7,  96($sp)
880001d4:	afaf0060 	sw	t7,96(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:97
	sw $t6,  92($sp)
880001d8:	afae005c 	sw	t6,92(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:98
	sw $t5,  88($sp)
880001dc:	afad0058 	sw	t5,88(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:99
	sw $t4,  84($sp)
880001e0:	afac0054 	sw	t4,84(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:100
	sw $t3,  80($sp)
880001e4:	afab0050 	sw	t3,80(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:101
	sw $t2,  76($sp)
880001e8:	afaa004c 	sw	t2,76(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:102
	sw $t1,  72($sp)
880001ec:	afa90048 	sw	t1,72(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:103
	sw $t0,  68($sp)
880001f0:	afa80044 	sw	t0,68(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:104
	sw $a3,  64($sp)
880001f4:	afa70040 	sw	a3,64(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:105
	sw $a2,  60($sp)
880001f8:	afa6003c 	sw	a2,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:106
	sw $a1,  56($sp)
880001fc:	afa50038 	sw	a1,56(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:107
	sw $a0,  52($sp)
88000200:	afa40034 	sw	a0,52(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:108
	sw $v1,  48($sp)
88000204:	afa30030 	sw	v1,48(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:109
	sw $v0,  44($sp)
88000208:	afa2002c 	sw	v0,44(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:110
	sw $at,  40($sp)
8800020c:	afa10028 	sw	at,40(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:112
    # save cp0
    mfc0 $t1, $15, 1    # EBase
88000210:	40097801 	mfc0	t1,$15,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:113
    sw   $t1, 32($sp)
88000214:	afa90020 	sw	t1,32(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:114
    mfc0 $t1, $8,  0    # BadVAddr
88000218:	40094000 	mfc0	t1,c0_badvaddr
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:115
    sw   $t1, 28($sp)
8800021c:	afa9001c 	sw	t1,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:116
    mfc0 $t1, $12, 0    # Status
88000220:	40096000 	mfc0	t1,c0_status
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:117
    sw   $t1, 24($sp)
88000224:	afa90018 	sw	t1,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:118
    mfc0 $t1, $13, 0    # Cause
88000228:	40096800 	mfc0	t1,c0_cause
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:119
    sw   $t1, 20($sp)
8800022c:	afa90014 	sw	t1,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:120
    mfc0 $t1, $14, 0    # EPC
88000230:	40097000 	mfc0	t1,c0_epc
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:121
    sw   $t1, 16($sp)
88000234:	afa90010 	sw	t1,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:123

    move $a0, $sp
88000238:	03a02025 	move	a0,sp
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:124
    move $a1, $k0
8800023c:	03402825 	move	a1,k0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:126

    jal _exception_handler
88000240:	0e000116 	jal	88000458 <_exception_handler>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:127
    nop
88000244:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:128
    j _loop
88000248:	0a000010 	j	88000040 <_loop>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:129
    nop
8800024c:	00000000 	nop

88000250 <_entry>:
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:5
#include <stdint.h>
#include <stdio.h>
#include "trivial_mips.h"

int _entry(){
88000250:	27bdffe0 	addiu	sp,sp,-32
88000254:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:16
        }
        c = (uint8_t*)0xbb0001fc;
        d = (uint8_t*)0xbb0001fd;
        e = (uint8_t*)0xbb0001fe;
        (*hastoRead) = 0;
        printf("has packet");
88000258:	3c108800 	lui	s0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:5
int _entry(){
8800025c:	afb10018 	sw	s1,24(sp)
88000260:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:10
        while((*hastoRead)==0){
88000264:	3c11bb00 	lui	s1,0xbb00
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:16
        printf("has packet");
88000268:	26100968 	addiu	s0,s0,2408
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:10
        while((*hastoRead)==0){
8800026c:	922201ff 	lbu	v0,511(s1)
88000270:	304200ff 	andi	v0,v0,0xff
88000274:	1040fffd 	beqz	v0,8800026c <_entry+0x1c>
88000278:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:15
        (*hastoRead) = 0;
8800027c:	a22001ff 	sb	zero,511(s1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:16
        printf("has packet");
88000280:	0e000143 	jal	8800050c <printf>
88000284:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_read.cpp:9
    while(1){
88000288:	1000fff8 	b	8800026c <_entry+0x1c>
8800028c:	00000000 	nop

88000290 <_main>:
_main():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:11
extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {
88000290:	27bdffe0 	addiu	sp,sp,-32
88000294:	afbf001c 	sw	ra,28(sp)
88000298:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:13

    init_serial();
8800029c:	0e00023a 	jal	880008e8 <init_serial>
880002a0:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:15

    write_segment(0x04);
880002a4:	0e000255 	jal	88000954 <write_segment>
880002a8:	24040004 	li	a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:17

    puts("*****TrivialMIPS Bare Metal System*****");
880002ac:	3c048800 	lui	a0,0x8800
880002b0:	0e000223 	jal	8800088c <puts>
880002b4:	24840974 	addiu	a0,a0,2420
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880002b8:	3c118000 	lui	s1,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880002bc:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880002c0:	3c108000 	lui	s0,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880002c4:	2484099c 	addiu	a0,a0,2460
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880002c8:	26310000 	addiu	s1,s1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880002cc:	0e000223 	jal	8800088c <puts>
880002d0:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880002d4:	02118023 	subu	s0,s0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:21
    write_segment(0x05);
880002d8:	0e000255 	jal	88000954 <write_segment>
880002dc:	24040005 	li	a0,5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:25
    if (bss_size > 0) {
880002e0:	1a000009 	blez	s0,88000308 <_main+0x78>
880002e4:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:26
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
880002e8:	02003025 	move	a2,s0
880002ec:	02202825 	move	a1,s1
880002f0:	0e000143 	jal	8800050c <printf>
880002f4:	248409c4 	addiu	a0,a0,2500
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:27
        memset(&_bss, 0, bss_size);
880002f8:	02003025 	move	a2,s0
880002fc:	00002825 	move	a1,zero
88000300:	0e000202 	jal	88000808 <memset>
88000304:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:30
    }

    write_segment(0x06);
88000308:	0e000255 	jal	88000954 <write_segment>
8800030c:	24040006 	li	a0,6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:33

    // call the actual function
    int result = _entry();
88000310:	0e000094 	jal	88000250 <_entry>
88000314:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:34
    if (result == 0) {
88000318:	1440000a 	bnez	v0,88000344 <_main+0xb4>
8800031c:	00402825 	move	a1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:35
        puts("Program exited normally.");
88000320:	3c048800 	lui	a0,0x8800
88000324:	0e000223 	jal	8800088c <puts>
88000328:	24840a00 	addiu	a0,a0,2560
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}
8800032c:	8fbf001c 	lw	ra,28(sp)
88000330:	8fb10018 	lw	s1,24(sp)
88000334:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:40
    write_segment(0x07);
88000338:	24040007 	li	a0,7
8800033c:	0a000255 	j	88000954 <write_segment>
88000340:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:37
        printf("Program exited abnormally with code %d.\n", result);
88000344:	3c048800 	lui	a0,0x8800
88000348:	0e000143 	jal	8800050c <printf>
8800034c:	24840a1c 	addiu	a0,a0,2588
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
}
88000350:	1000fff7 	b	88000330 <_main+0xa0>
88000354:	8fbf001c 	lw	ra,28(sp)

88000358 <print_trapframe>:
print_trapframe():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
88000358:	27bdffd0 	addiu	sp,sp,-48
8800035c:	afb30024 	sw	s3,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
88000360:	3c138800 	lui	s3,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
void print_trapframe(trapframe_t *tf) {
88000364:	afb40028 	sw	s4,40(sp)
88000368:	afb20020 	sw	s2,32(sp)
8800036c:	afb1001c 	sw	s1,28(sp)
88000370:	afb00018 	sw	s0,24(sp)
88000374:	afbf002c 	sw	ra,44(sp)
88000378:	00808025 	move	s0,a0
8800037c:	24920028 	addiu	s2,a0,40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
88000380:	24110001 	li	s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
        printf("Register $%d: %p\n", i, tf->gpr[i]);
88000384:	26730a48 	addiu	s3,s3,2632
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
88000388:	24140020 	li	s4,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64 (discriminator 3)
        printf("Register $%d: %p\n", i, tf->gpr[i]);
8800038c:	8e460000 	lw	a2,0(s2)
88000390:	02202825 	move	a1,s1
88000394:	02602025 	move	a0,s3
88000398:	0e000143 	jal	8800050c <printf>
8800039c:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63 (discriminator 3)
    for(int i = 1; i < 32; ++i) {
880003a0:	1634fffa 	bne	s1,s4,8800038c <print_trapframe+0x34>
880003a4:	26520004 	addiu	s2,s2,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:66
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
880003a8:	8e020020 	lw	v0,32(s0)
880003ac:	8e070018 	lw	a3,24(s0)
880003b0:	afa20014 	sw	v0,20(sp)
880003b4:	8e02001c 	lw	v0,28(s0)
880003b8:	8e060014 	lw	a2,20(s0)
880003bc:	8e050010 	lw	a1,16(s0)
880003c0:	3c048800 	lui	a0,0x8800
880003c4:	afa20010 	sw	v0,16(sp)
880003c8:	0e000143 	jal	8800050c <printf>
880003cc:	24840a5c 	addiu	a0,a0,2652
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:67
}
880003d0:	8fbf002c 	lw	ra,44(sp)
880003d4:	8fb40028 	lw	s4,40(sp)
880003d8:	8fb30024 	lw	s3,36(sp)
880003dc:	8fb20020 	lw	s2,32(sp)
880003e0:	8fb1001c 	lw	s1,28(sp)
880003e4:	8fb00018 	lw	s0,24(sp)
880003e8:	03e00008 	jr	ra
880003ec:	27bd0030 	addiu	sp,sp,48

880003f0 <print_tlb>:
print_tlb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69

void print_tlb() {
880003f0:	27bdffd8 	addiu	sp,sp,-40
880003f4:	afb1001c 	sw	s1,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
880003f8:	3c118800 	lui	s1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69
void print_tlb() {
880003fc:	afb20020 	sw	s2,32(sp)
88000400:	afb00018 	sw	s0,24(sp)
88000404:	afbf0024 	sw	ra,36(sp)
88000408:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
8800040c:	26310a98 	addiu	s1,s1,2712
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
88000410:	24120010 	li	s2,16
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:72 (discriminator 3)
        asm volatile(
88000414:	40900000 	mtc0	s0,c0_index
88000418:	42000001 	tlbr
8800041c:	40065000 	mfc0	a2,c0_entryhi
88000420:	40071000 	mfc0	a3,c0_entrylo0
88000424:	40021800 	mfc0	v0,c0_entrylo1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81 (discriminator 3)
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
88000428:	02002825 	move	a1,s0
8800042c:	afa20010 	sw	v0,16(sp)
88000430:	02202025 	move	a0,s1
88000434:	0e000143 	jal	8800050c <printf>
88000438:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70 (discriminator 3)
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
8800043c:	1612fff5 	bne	s0,s2,88000414 <print_tlb+0x24>
88000440:	8fbf0024 	lw	ra,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:83
    }
}
88000444:	8fb20020 	lw	s2,32(sp)
88000448:	8fb1001c 	lw	s1,28(sp)
8800044c:	8fb00018 	lw	s0,24(sp)
88000450:	03e00008 	jr	ra
88000454:	27bd0028 	addiu	sp,sp,40

88000458 <_exception_handler>:
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85

void _exception_handler(trapframe_t *tf, bool assertion) {
88000458:	27bdffe0 	addiu	sp,sp,-32
8800045c:	afb10018 	sw	s1,24(sp)
88000460:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
88000464:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
88000468:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
8800046c:	24840974 	addiu	a0,a0,2420
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
88000470:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
88000474:	0e000223 	jal	8800088c <puts>
88000478:	00a08025 	move	s0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:87
    if (assertion) {
8800047c:	12000012 	beqz	s0,880004c8 <_exception_handler+0x70>
88000480:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:88
        puts("CPU internal assertion failed, abort.");
88000484:	3c048800 	lui	a0,0x8800
88000488:	0e000223 	jal	8800088c <puts>
8800048c:	24840ad0 	addiu	a0,a0,2768
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:89
        write_segment(0xdeaddead);
88000490:	3c04dead 	lui	a0,0xdead
88000494:	0e000255 	jal	88000954 <write_segment>
88000498:	3484dead 	ori	a0,a0,0xdead
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:96
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
8800049c:	0e0000d6 	jal	88000358 <print_trapframe>
880004a0:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:97
    print_tlb();
880004a4:	0e0000fc 	jal	880003f0 <print_tlb>
880004a8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:99
    puts("*****System HANG*****");
}
880004ac:	8fbf001c 	lw	ra,28(sp)
880004b0:	8fb10018 	lw	s1,24(sp)
880004b4:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:98
    puts("*****System HANG*****");
880004b8:	3c048800 	lui	a0,0x8800
880004bc:	24840b34 	addiu	a0,a0,2868
880004c0:	0a000223 	j	8800088c <puts>
880004c4:	27bd0020 	addiu	sp,sp,32
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
880004c8:	40066800 	mfc0	a2,c0_cause
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:91
        word_t code = (_get_cause() >> 2) & 0xF;
880004cc:	00063082 	srl	a2,a2,0x2
880004d0:	30c6000f 	andi	a2,a2,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
880004d4:	3c038800 	lui	v1,0x8800
880004d8:	00061080 	sll	v0,a2,0x2
880004dc:	24630dc0 	addiu	v1,v1,3520
880004e0:	00431021 	addu	v0,v0,v1
880004e4:	8c470000 	lw	a3,0(v0)
880004e8:	3c048800 	lui	a0,0x8800
_get_epc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:46
    asm(
880004ec:	40107000 	mfc0	s0,c0_epc
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
880004f0:	24840af8 	addiu	a0,a0,2808
880004f4:	0e000143 	jal	8800050c <printf>
880004f8:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:94
        write_led((uint16_t) epc);
880004fc:	0e000250 	jal	88000940 <write_led>
88000500:	3204ffff 	andi	a0,s0,0xffff
88000504:	1000ffe5 	b	8800049c <_exception_handler+0x44>
88000508:	00000000 	nop

8800050c <printf>:
printf():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
int printf(const char *fmt, ...)
{
8800050c:	27bdffd0 	addiu	sp,sp,-48
88000510:	afb00018 	sw	s0,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
88000514:	27b00034 	addiu	s0,sp,52
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
{
88000518:	afb30024 	sw	s3,36(sp)
8800051c:	afb20020 	sw	s2,32(sp)
88000520:	afb1001c 	sw	s1,28(sp)
88000524:	afbf002c 	sw	ra,44(sp)
88000528:	afb40028 	sw	s4,40(sp)
8800052c:	00809025 	move	s2,a0
88000530:	afa50034 	sw	a1,52(sp)
88000534:	afa60038 	sw	a2,56(sp)
88000538:	afa7003c 	sw	a3,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	__builtin_va_start(ap, fmt);
8800053c:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10
	arg = ap;
	for (i = 0; fmt[i]; i++)
88000540:	00008825 	move	s1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
				break;
			}
		}
		else
		{
			if (c == '\n')
88000544:	2413000a 	li	s3,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 1)
	for (i = 0; fmt[i]; i++)
88000548:	02511021 	addu	v0,s2,s1
8800054c:	80540000 	lb	s4,0(v0)
88000550:	1680000a 	bnez	s4,8800057c <printf+0x70>
88000554:	24020025 	li	v0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:85
				putchar('\r');
			putchar(c);
		}
	}
	return 0;
}
88000558:	8fbf002c 	lw	ra,44(sp)
8800055c:	8fb40028 	lw	s4,40(sp)
88000560:	8fb30024 	lw	s3,36(sp)
88000564:	8fb20020 	lw	s2,32(sp)
88000568:	8fb1001c 	lw	s1,28(sp)
8800056c:	8fb00018 	lw	s0,24(sp)
88000570:	00001025 	move	v0,zero
88000574:	03e00008 	jr	ra
88000578:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:13
		if (c == '%')
8800057c:	16820066 	bne	s4,v0,88000718 <printf+0x20c>
88000580:	24050001 	li	a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000584:	24060064 	li	a2,100
88000588:	24070025 	li	a3,37
8800058c:	24080030 	li	t0,48
88000590:	02511021 	addu	v0,s2,s1
88000594:	80420001 	lb	v0,1(v0)
88000598:	1046003a 	beq	v0,a2,88000684 <printf+0x178>
8800059c:	28430065 	slti	v1,v0,101
880005a0:	10600018 	beqz	v1,88000604 <printf+0xf8>
880005a4:	2843003a 	slti	v1,v0,58
880005a8:	1060000c 	beqz	v1,880005dc <printf+0xd0>
880005ac:	28430031 	slti	v1,v0,49
880005b0:	1060004d 	beqz	v1,880006e8 <printf+0x1dc>
880005b4:	02512021 	addu	a0,s2,s1
880005b8:	10470046 	beq	v0,a3,880006d4 <printf+0x1c8>
880005bc:	26340001 	addiu	s4,s1,1
880005c0:	10480048 	beq	v0,t0,880006e4 <printf+0x1d8>
880005c4:	02542021 	addu	a0,s2,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:73
				putchar('%');
880005c8:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
880005cc:	0e00022f 	jal	880008bc <putchar>
880005d0:	26310001 	addiu	s1,s1,1
880005d4:	1000ffdd 	b	8800054c <printf+0x40>
880005d8:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
880005dc:	24030062 	li	v1,98
880005e0:	10430036 	beq	v0,v1,880006bc <printf+0x1b0>
880005e4:	26340001 	addiu	s4,s1,1
880005e8:	24030063 	li	v1,99
880005ec:	1443fff6 	bne	v0,v1,880005c8 <printf+0xbc>
880005f0:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:25
				putchar((long)*arg);
880005f4:	0e00022f 	jal	880008bc <putchar>
880005f8:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
880005fc:	10000017 	b	8800065c <printf+0x150>
88000600:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000604:	24030070 	li	v1,112
88000608:	1043002f 	beq	v0,v1,880006c8 <printf+0x1bc>
8800060c:	28430071 	slti	v1,v0,113
88000610:	10600008 	beqz	v1,88000634 <printf+0x128>
88000614:	24030075 	li	v1,117
88000618:	2403006c 	li	v1,108
8800061c:	10430020 	beq	v0,v1,880006a0 <printf+0x194>
88000620:	2403006f 	li	v1,111
88000624:	1443ffe8 	bne	v0,v1,880005c8 <printf+0xbc>
88000628:	00003825 	move	a3,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:45
				printbase((long)*arg, w, 8, 0);
8800062c:	10000017 	b	8800068c <printf+0x180>
88000630:	24060008 	li	a2,8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000634:	1043000d 	beq	v0,v1,8800066c <printf+0x160>
88000638:	26340001 	addiu	s4,s1,1
8800063c:	24030078 	li	v1,120
88000640:	10430021 	beq	v0,v1,880006c8 <printf+0x1bc>
88000644:	24030073 	li	v1,115
88000648:	1443ffe0 	bne	v0,v1,880005cc <printf+0xc0>
8800064c:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:20
				putstring(*arg);
88000650:	0e00020b 	jal	8800082c <putstring>
88000654:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
88000658:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
8800065c:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 2)
	for (i = 0; fmt[i]; i++)
88000660:	26310001 	addiu	s1,s1,1
88000664:	1000ffb9 	b	8800054c <printf+0x40>
88000668:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:30
				printbase((long)*arg, w, 10, 0);
8800066c:	00003825 	move	a3,zero
88000670:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
88000674:	0e0001cc 	jal	88000730 <printbase>
88000678:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
8800067c:	1000fff7 	b	8800065c <printf+0x150>
88000680:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:35
				printbase((long)*arg, w, 10, 1);
88000684:	24070001 	li	a3,1
88000688:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
8800068c:	8e040000 	lw	a0,0(s0)
88000690:	0e0001cc 	jal	88000730 <printbase>
88000694:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:59
				break;
88000698:	1000fff1 	b	88000660 <printf+0x154>
8800069c:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:40
				printbase((long)*arg, w, 10, 0);
880006a0:	8e040000 	lw	a0,0(s0)
880006a4:	00003825 	move	a3,zero
880006a8:	0e0001cc 	jal	88000730 <printbase>
880006ac:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:41
				arg++;
880006b0:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:43
				break;
880006b4:	1000ffea 	b	88000660 <printf+0x154>
880006b8:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
880006bc:	00003825 	move	a3,zero
880006c0:	1000ffec 	b	88000674 <printf+0x168>
880006c4:	24060002 	li	a2,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
880006c8:	00003825 	move	a3,zero
880006cc:	1000ffef 	b	8800068c <printf+0x180>
880006d0:	24060010 	li	a2,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:61
				putchar('%');
880006d4:	0e00022f 	jal	880008bc <putchar>
880006d8:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
880006dc:	1000ffe0 	b	88000660 <printf+0x154>
880006e0:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:65
				i++;
880006e4:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:15 (discriminator 1)
			w = 1;
880006e8:	00002825 	move	a1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:67 (discriminator 1)
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
880006ec:	80830001 	lb	v1,1(a0)
880006f0:	00928823 	subu	s1,a0,s2
880006f4:	2462ffcf 	addiu	v0,v1,-49
880006f8:	304200ff 	andi	v0,v0,0xff
880006fc:	2c420009 	sltiu	v0,v0,9
88000700:	1040ffa3 	beqz	v0,88000590 <printf+0x84>
88000704:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:68 (discriminator 3)
					w = w * 10 + (fmt[i + 1] - '0');
88000708:	70b31002 	mul	v0,a1,s3
8800070c:	2463ffd0 	addiu	v1,v1,-48
88000710:	1000fff6 	b	880006ec <printf+0x1e0>
88000714:	00432821 	addu	a1,v0,v1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
			if (c == '\n')
88000718:	16930003 	bne	s4,s3,88000728 <printf+0x21c>
8800071c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:80
				putchar('\r');
88000720:	0e00022f 	jal	880008bc <putchar>
88000724:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
88000728:	1000ffa8 	b	880005cc <printf+0xc0>
8800072c:	02802025 	move	a0,s4

88000730 <printbase>:
printbase():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2
int printbase(long v,int w,int base,int sign)
{
88000730:	27bdff98 	addiu	sp,sp,-104
88000734:	afb40060 	sw	s4,96(sp)
88000738:	afb3005c 	sw	s3,92(sp)
8800073c:	afbf0064 	sw	ra,100(sp)
88000740:	afb20058 	sw	s2,88(sp)
88000744:	afb10054 	sw	s1,84(sp)
88000748:	afb00050 	sw	s0,80(sp)
8800074c:	00a09825 	move	s3,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
88000750:	10e00018 	beqz	a3,880007b4 <printbase+0x84>
88000754:	00c0a025 	move	s4,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7 (discriminator 1)
88000758:	04810004 	bgez	a0,8800076c <printbase+0x3c>
8800075c:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:9
	{
	value = -v;
88000760:	00048023 	negu	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:10
	putchar('-');
88000764:	0e00022f 	jal	880008bc <putchar>
88000768:	2404002d 	li	a0,45
8800076c:	27b10010 	addiu	s1,sp,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2 (discriminator 1)
{
88000770:	02201025 	move	v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:14 (discriminator 1)
	}
	else value=v;

	for(i=0;value;i++)
88000774:	16000011 	bnez	s0,880007bc <printbase+0x8c>
88000778:	00519023 	subu	s2,v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22
	value=value/base;
	}

#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
8800077c:	0272802a 	slt	s0,s3,s2
88000780:	0250980b 	movn	s3,s2,s0
88000784:	02608025 	move	s0,s3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22 (discriminator 2)
88000788:	16000013 	bnez	s0,880007d8 <printbase+0xa8>
8800078c:	0250102a 	slt	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:28
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}
88000790:	8fbf0064 	lw	ra,100(sp)
88000794:	8fb40060 	lw	s4,96(sp)
88000798:	8fb3005c 	lw	s3,92(sp)
8800079c:	8fb20058 	lw	s2,88(sp)
880007a0:	8fb10054 	lw	s1,84(sp)
880007a4:	8fb00050 	lw	s0,80(sp)
880007a8:	00001025 	move	v0,zero
880007ac:	03e00008 	jr	ra
880007b0:	27bd0068 	addiu	sp,sp,104
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:12
	else value=v;
880007b4:	1000ffed 	b	8800076c <printbase+0x3c>
880007b8:	00808025 	move	s0,a0
880007bc:	0214001b 	divu	zero,s0,s4
880007c0:	028001f4 	teq	s4,zero,0x7
880007c4:	24420001 	addiu	v0,v0,1
880007c8:	00002010 	mfhi	a0
880007cc:	00008012 	mflo	s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:16 (discriminator 3)
	buf[i]=value%base;
880007d0:	1000ffe8 	b	88000774 <printbase+0x44>
880007d4:	a044ffff 	sb	a0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24
		c=j>i?0:buf[j-1];
880007d8:	14400006 	bnez	v0,880007f4 <printbase+0xc4>
880007dc:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24 (discriminator 1)
880007e0:	02301021 	addu	v0,s1,s0
880007e4:	8042ffff 	lb	v0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 1)
		putchar((c<=9)?c+'0':c-0xa+'a');
880007e8:	2843000a 	slti	v1,v0,10
880007ec:	10600002 	beqz	v1,880007f8 <printbase+0xc8>
880007f0:	24440057 	addiu	a0,v0,87
880007f4:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 4)
880007f8:	0e00022f 	jal	880008bc <putchar>
880007fc:	2610ffff 	addiu	s0,s0,-1
88000800:	1000ffe1 	b	88000788 <printbase+0x58>
88000804:	00000000 	nop

88000808 <memset>:
memset():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:273
 * @n:      number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
88000808:	00801025 	move	v0,a0
8800080c:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:277
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memset(s, c, n);
#else
    char *p = s;
88000810:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:278
    while (n -- > 0) {
88000814:	14660003 	bne	v1,a2,88000824 <memset+0x1c>
88000818:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:283
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
8800081c:	03e00008 	jr	ra
88000820:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:279
        *p ++ = c;
88000824:	1000fffb 	b	88000814 <memset+0xc>
88000828:	a065ffff 	sb	a1,-1(v1)

8800082c <putstring>:
putstring():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:2
int putstring(const char *s)
{
8800082c:	27bdffe0 	addiu	sp,sp,-32
88000830:	afb20018 	sw	s2,24(sp)
88000834:	afb10014 	sw	s1,20(sp)
88000838:	afbf001c 	sw	ra,28(sp)
8800083c:	afb00010 	sw	s0,16(sp)
88000840:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
    char c;
    while ((c = *s))
    {
        if (c == '\n')
88000844:	2412000a 	li	s2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:4
    while ((c = *s))
88000848:	82300000 	lb	s0,0(s1)
8800084c:	16000007 	bnez	s0,8800086c <putstring+0x40>
88000850:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:12
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
88000854:	8fb20018 	lw	s2,24(sp)
88000858:	8fb10014 	lw	s1,20(sp)
8800085c:	8fb00010 	lw	s0,16(sp)
88000860:	00001025 	move	v0,zero
88000864:	03e00008 	jr	ra
88000868:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
        if (c == '\n')
8800086c:	16120003 	bne	s0,s2,8800087c <putstring+0x50>
88000870:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:7
            putchar('\r');
88000874:	0e00022f 	jal	880008bc <putchar>
88000878:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:8
        putchar(c);
8800087c:	0e00022f 	jal	880008bc <putchar>
88000880:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:9
        s++;
88000884:	1000fff0 	b	88000848 <putstring+0x1c>
88000888:	26310001 	addiu	s1,s1,1

8800088c <puts>:
puts():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:15

int puts(const char *s)
{
8800088c:	27bdffe8 	addiu	sp,sp,-24
88000890:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:16
    putstring(s);
88000894:	0e00020b 	jal	8800082c <putstring>
88000898:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:17
    putchar('\r');
8800089c:	0e00022f 	jal	880008bc <putchar>
880008a0:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:18
    putchar('\n');
880008a4:	0e00022f 	jal	880008bc <putchar>
880008a8:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:20
    return 0;
}
880008ac:	8fbf0014 	lw	ra,20(sp)
880008b0:	00001025 	move	v0,zero
880008b4:	03e00008 	jr	ra
880008b8:	27bd0018 	addiu	sp,sp,24

880008bc <putchar>:
putchar():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:4
#include <machine.h>

int putchar(int c)
{
880008bc:	27bdffe8 	addiu	sp,sp,-24
880008c0:	afb00010 	sw	s0,16(sp)
880008c4:	00808025 	move	s0,a0
880008c8:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:5
	write_serial((byte_t) c);
880008cc:	0e000248 	jal	88000920 <write_serial>
880008d0:	308400ff 	andi	a0,a0,0xff
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:7
	return c;
880008d4:	8fbf0014 	lw	ra,20(sp)
880008d8:	02001025 	move	v0,s0
880008dc:	8fb00010 	lw	s0,16(sp)
880008e0:	03e00008 	jr	ra
880008e4:	27bd0018 	addiu	sp,sp,24

880008e8 <init_serial>:
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
}

template<typename T>
void write(void *addr, T data){
    auto *ptr = reinterpret_cast<volatile T *>(addr);
    *ptr = data;
880008e8:	3c02bfd0 	lui	v0,0xbfd0
880008ec:	2403ff81 	li	v1,-127
880008f0:	a0433008 	sb	v1,12296(v0)
880008f4:	2403ff80 	li	v1,-128
880008f8:	a043300c 	sb	v1,12300(v0)
880008fc:	24030036 	li	v1,54
88000900:	a0433000 	sb	v1,12288(v0)
88000904:	24030003 	li	v1,3
88000908:	a0403004 	sb	zero,12292(v0)
8800090c:	a043300c 	sb	v1,12300(v0)
88000910:	a0403010 	sb	zero,12304(v0)
88000914:	a0403004 	sb	zero,12292(v0)
init_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:45
	write_byte(UART_LCR_ADDR, ~0x80 & 0x03);
	// disable modem controls
	write_byte(UART_MCR_ADDR, 0);
	// disable interrupts
	write_byte(UART_IER_ADDR, 0);
}
88000918:	03e00008 	jr	ra
8800091c:	00000000 	nop

88000920 <write_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
88000920:	3c03bfd0 	lui	v1,0xbfd0
88000924:	90623014 	lbu	v0,12308(v1)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:53
	while (!(read_byte(UART_LSR_ADDR) & 0x01));
	return read_byte(UART_DAT_ADDR);
}

void write_serial(byte_t data){
	while (!(read_byte(UART_LSR_ADDR) & 0x40));
88000928:	30420040 	andi	v0,v0,0x40
8800092c:	1040fffd 	beqz	v0,88000924 <write_serial+0x4>
88000930:	3c02bfd0 	lui	v0,0xbfd0
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88000934:	a0443000 	sb	a0,12288(v0)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:55
	write_byte(UART_DAT_ADDR, data);
}
88000938:	03e00008 	jr	ra
8800093c:	00000000 	nop

88000940 <write_led>:
_Z5writeItEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88000940:	3c02bff0 	lui	v0,0xbff0
88000944:	3442f000 	ori	v0,v0,0xf000
88000948:	a4440000 	sh	a0,0(v0)
write_led():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:68
	return word;
}

void write_led(hword_t data){
	write_hword(LED_ADDR, data);
}
8800094c:	03e00008 	jr	ra
88000950:	00000000 	nop

88000954 <write_segment>:
_Z5writeIjEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88000954:	3c02bff0 	lui	v0,0xbff0
88000958:	3442f010 	ori	v0,v0,0xf010
8800095c:	ac440000 	sw	a0,0(v0)
write_segment():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:72

void write_segment(word_t data){
	write_word(NUM_ADDR, data);
}
88000960:	03e00008 	jr	ra
88000964:	00000000 	nop
88000968:	20736168 	addi	s3,v1,24936
8800096c:	6b636170 	0x6b636170
88000970:	00007465 	0x7465
88000974:	2a2a2a2a 	slti	t2,s1,10794
88000978:	6972542a 	0x6972542a
8800097c:	6c616976 	0x6c616976
88000980:	5350494d 	beql	k0,s0,88012eb8 <_text_end+0x12060>
88000984:	72614220 	0x72614220
88000988:	654d2065 	0x654d2065
8800098c:	206c6174 	addi	t4,v1,24948
88000990:	74737953 	jalx	81cde54c <_bss_end+0x1cdd54c>
88000994:	2a2a6d65 	slti	t2,s1,28005
88000998:	002a2a2a 	0x2a2a2a
8800099c:	706d6f43 	0x706d6f43
880009a0:	74616c69 	jalx	8185b1a4 <_bss_end+0x185a1a4>
880009a4:	206e6f69 	addi	t6,v1,28521
880009a8:	656d6974 	0x656d6974
880009ac:	3931203a 	xori	s1,t1,0x203a
880009b0:	3a30323a 	xori	s0,s1,0x323a
880009b4:	44203233 	0x44203233
880009b8:	31206365 	andi	zero,t1,0x6365
880009bc:	30322035 	andi	s2,at,0x2035
880009c0:	00003931 	tgeu	zero,zero,0xe4
880009c4:	6c6c6946 	0x6c6c6946
880009c8:	20676e69 	addi	a3,v1,28265
880009cc:	7373622e 	0x7373622e
880009d0:	63657320 	0x63657320
880009d4:	6e6f6974 	0x6e6f6974
880009d8:	74697720 	jalx	81a5dc80 <_bss_end+0x1a5cc80>
880009dc:	2c302068 	sltiu	s0,at,8296
880009e0:	66666f20 	0x66666f20
880009e4:	3a746573 	xori	s4,s3,0x6573
880009e8:	25783020 	addiu	t8,t3,12320
880009ec:	73202c78 	0x73202c78
880009f0:	3a657a69 	xori	a1,s3,0x7a69
880009f4:	20642520 	addi	a0,v1,9504
880009f8:	65747962 	0x65747962
880009fc:	000a2e73 	tltu	zero,t2,0xb9
88000a00:	676f7250 	0x676f7250
88000a04:	206d6172 	addi	t5,v1,24946
88000a08:	74697865 	jalx	81a5e194 <_bss_end+0x1a5d194>
88000a0c:	6e206465 	0x6e206465
88000a10:	616d726f 	0x616d726f
88000a14:	2e796c6c 	sltiu	t9,s3,27756
88000a18:	00000000 	nop
88000a1c:	676f7250 	0x676f7250
88000a20:	206d6172 	addi	t5,v1,24946
88000a24:	74697865 	jalx	81a5e194 <_bss_end+0x1a5d194>
88000a28:	61206465 	0x61206465
88000a2c:	726f6e62 	0x726f6e62
88000a30:	6c6c616d 	0x6c6c616d
88000a34:	69772079 	0x69772079
88000a38:	63206874 	0x63206874
88000a3c:	2065646f 	addi	a1,v1,25711
88000a40:	0a2e6425 	j	88b99094 <_text_end+0xb9823c>
88000a44:	00000000 	nop
88000a48:	69676552 	0x69676552
88000a4c:	72657473 	0x72657473
88000a50:	64252420 	0x64252420
88000a54:	7025203a 	0x7025203a
88000a58:	0000000a 	movz	zero,zero,zero
88000a5c:	3a435045 	xori	v1,s2,0x5045
88000a60:	2c702520 	sltiu	s0,v1,9504
88000a64:	75614320 	jalx	85850c80 <_bss_end+0x584fc80>
88000a68:	203a6573 	addi	k0,at,25971
88000a6c:	202c7025 	addi	t4,at,28709
88000a70:	74617453 	jalx	8185d14c <_bss_end+0x185c14c>
88000a74:	203a7375 	addi	k0,at,29557
88000a78:	202c7025 	addi	t4,at,28709
88000a7c:	56646142 	bnel	s3,a0,88018f88 <_text_end+0x18130>
88000a80:	72646441 	0x72646441
88000a84:	7025203a 	0x7025203a
88000a88:	4245202c 	c0	0x45202c
88000a8c:	3a657361 	xori	a1,s3,0x7361
88000a90:	0a702520 	j	89c09480 <_text_end+0x1c08628>
88000a94:	00000000 	nop
88000a98:	20424c54 	addi	v0,v0,19540
88000a9c:	6d657469 	0x6d657469
88000aa0:	3a642520 	xori	a0,s3,0x2520
88000aa4:	746e4520 	jalx	81b91480 <_bss_end+0x1b90480>
88000aa8:	69487972 	0x69487972
88000aac:	2c702520 	sltiu	s0,v1,9504
88000ab0:	746e4520 	jalx	81b91480 <_bss_end+0x1b90480>
88000ab4:	6f4c7972 	0x6f4c7972
88000ab8:	25203a31 	addiu	zero,t1,14897
88000abc:	45202c70 	0x45202c70
88000ac0:	7972746e 	0x7972746e
88000ac4:	3a326f4c 	xori	s2,s1,0x6f4c
88000ac8:	0a702520 	j	89c09480 <_text_end+0x1c08628>
88000acc:	00000000 	nop
88000ad0:	20555043 	addi	s5,v0,20547
88000ad4:	65746e69 	0x65746e69
88000ad8:	6c616e72 	0x6c616e72
88000adc:	73736120 	0x73736120
88000ae0:	69747265 	0x69747265
88000ae4:	66206e6f 	0x66206e6f
88000ae8:	656c6961 	0x656c6961
88000aec:	61202c64 	0x61202c64
88000af0:	74726f62 	jalx	81c9bd88 <_bss_end+0x1c9ad88>
88000af4:	0000002e 	0x2e
88000af8:	65206e41 	0x65206e41
88000afc:	70656378 	0x70656378
88000b00:	6e6f6974 	0x6e6f6974
88000b04:	63636f20 	0x63636f20
88000b08:	65727275 	0x65727275
88000b0c:	77202c64 	jalx	8c80b190 <_text_end+0x480a338>
88000b10:	20687469 	addi	t0,v1,29801
88000b14:	20435045 	addi	v1,v0,20549
88000b18:	78257830 	0x78257830
88000b1c:	646e6120 	0x646e6120
88000b20:	75614320 	jalx	85850c80 <_bss_end+0x584fc80>
88000b24:	25206573 	addiu	zero,t1,25971
88000b28:	25282064 	addiu	t0,t1,8292
88000b2c:	0a2e2973 	j	88b8a5cc <_text_end+0xb89774>
88000b30:	00000000 	nop
88000b34:	2a2a2a2a 	slti	t2,s1,10794
88000b38:	7379532a 	0x7379532a
88000b3c:	206d6574 	addi	t5,v1,25972
88000b40:	474e4148 	c1	0x14e4148
88000b44:	2a2a2a2a 	slti	t2,s1,10794
88000b48:	0000002a 	slt	zero,zero,zero
88000b4c:	65746e49 	0x65746e49
88000b50:	70757272 	0x70757272
88000b54:	00000074 	teq	zero,zero,0x1
88000b58:	20424c54 	addi	v0,v0,19540
88000b5c:	69646f6d 	0x69646f6d
88000b60:	61636966 	0x61636966
88000b64:	6e6f6974 	0x6e6f6974
88000b68:	63786520 	0x63786520
88000b6c:	69747065 	0x69747065
88000b70:	00006e6f 	0x6e6f
88000b74:	20424c54 	addi	v0,v0,19540
88000b78:	65637865 	0x65637865
88000b7c:	6f697470 	0x6f697470
88000b80:	6c28206e 	0x6c28206e
88000b84:	2064616f 	addi	a0,v1,24943
88000b88:	6920726f 	0x6920726f
88000b8c:	7274736e 	0x7274736e
88000b90:	69746375 	0x69746375
88000b94:	66206e6f 	0x66206e6f
88000b98:	68637465 	0x68637465
88000b9c:	00000029 	0x29
88000ba0:	20424c54 	addi	v0,v0,19540
88000ba4:	65637865 	0x65637865
88000ba8:	6f697470 	0x6f697470
88000bac:	7328206e 	0x7328206e
88000bb0:	65726f74 	0x65726f74
88000bb4:	00000029 	0x29
88000bb8:	72646441 	0x72646441
88000bbc:	20737365 	addi	s3,v1,29541
88000bc0:	6f727265 	0x6f727265
88000bc4:	78652072 	0x78652072
88000bc8:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000bcc:	206e6f69 	addi	t6,v1,28521
88000bd0:	616f6c28 	0x616f6c28
88000bd4:	726f2064 	0x726f2064
88000bd8:	736e6920 	0x736e6920
88000bdc:	63757274 	0x63757274
88000be0:	6e6f6974 	0x6e6f6974
88000be4:	74656620 	jalx	81959880 <_bss_end+0x1958880>
88000be8:	00296863 	0x296863
88000bec:	72646441 	0x72646441
88000bf0:	20737365 	addi	s3,v1,29541
88000bf4:	6f727265 	0x6f727265
88000bf8:	78652072 	0x78652072
88000bfc:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000c00:	206e6f69 	addi	t6,v1,28521
88000c04:	6f747328 	0x6f747328
88000c08:	00296572 	tlt	at,t1,0x195
88000c0c:	20737542 	addi	s3,v1,30018
88000c10:	6f727265 	0x6f727265
88000c14:	78652072 	0x78652072
88000c18:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000c1c:	206e6f69 	addi	t6,v1,28521
88000c20:	736e6928 	0x736e6928
88000c24:	63757274 	0x63757274
88000c28:	6e6f6974 	0x6e6f6974
88000c2c:	74656620 	jalx	81959880 <_bss_end+0x1958880>
88000c30:	00296863 	0x296863
88000c34:	20737542 	addi	s3,v1,30018
88000c38:	6f727265 	0x6f727265
88000c3c:	78652072 	0x78652072
88000c40:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000c44:	206e6f69 	addi	t6,v1,28521
88000c48:	74616428 	jalx	818590a0 <_bss_end+0x18580a0>
88000c4c:	65722061 	0x65722061
88000c50:	65726566 	0x65726566
88000c54:	3a65636e 	xori	a1,s3,0x636e
88000c58:	616f6c20 	0x616f6c20
88000c5c:	726f2064 	0x726f2064
88000c60:	6f747320 	0x6f747320
88000c64:	00296572 	tlt	at,t1,0x195
88000c68:	63737953 	0x63737953
88000c6c:	206c6c61 	addi	t4,v1,27745
88000c70:	65637865 	0x65637865
88000c74:	6f697470 	0x6f697470
88000c78:	0000006e 	0x6e
88000c7c:	61657242 	0x61657242
88000c80:	696f706b 	0x696f706b
88000c84:	6520746e 	0x6520746e
88000c88:	70656378 	0x70656378
88000c8c:	6e6f6974 	0x6e6f6974
88000c90:	00000000 	nop
88000c94:	65736552 	0x65736552
88000c98:	64657672 	0x64657672
88000c9c:	736e6920 	0x736e6920
88000ca0:	63757274 	0x63757274
88000ca4:	6e6f6974 	0x6e6f6974
88000ca8:	63786520 	0x63786520
88000cac:	69747065 	0x69747065
88000cb0:	00006e6f 	0x6e6f
88000cb4:	72706f43 	0x72706f43
88000cb8:	7365636f 	0x7365636f
88000cbc:	20726f73 	addi	s2,v1,28531
88000cc0:	73756e55 	0x73756e55
88000cc4:	656c6261 	0x656c6261
88000cc8:	63786520 	0x63786520
88000ccc:	69747065 	0x69747065
88000cd0:	00006e6f 	0x6e6f
88000cd4:	74697241 	jalx	81a5c904 <_bss_end+0x1a5b904>
88000cd8:	74656d68 	jalx	8195b5a0 <_bss_end+0x195a5a0>
88000cdc:	4f206369 	c3	0x1206369
88000ce0:	66726576 	0x66726576
88000ce4:	20776f6c 	addi	s7,v1,28524
88000ce8:	65637865 	0x65637865
88000cec:	6f697470 	0x6f697470
88000cf0:	0000006e 	0x6e
88000cf4:	70617254 	0x70617254
88000cf8:	63786520 	0x63786520
88000cfc:	69747065 	0x69747065
88000d00:	00006e6f 	0x6e6f
88000d04:	2041534d 	addi	at,v0,21325
88000d08:	616f6c46 	0x616f6c46
88000d0c:	676e6974 	0x676e6974
88000d10:	696f502d 	0x696f502d
88000d14:	6520746e 	0x6520746e
88000d18:	70656378 	0x70656378
88000d1c:	6e6f6974 	0x6e6f6974
88000d20:	00000000 	nop
88000d24:	20424c54 	addi	v0,v0,19540
88000d28:	64616552 	0x64616552
88000d2c:	686e492d 	0x686e492d
88000d30:	74696269 	jalx	81a589a4 <_bss_end+0x1a579a4>
88000d34:	63786520 	0x63786520
88000d38:	69747065 	0x69747065
88000d3c:	00006e6f 	0x6e6f
88000d40:	20424c54 	addi	v0,v0,19540
88000d44:	63657845 	0x63657845
88000d48:	6f697475 	0x6f697475
88000d4c:	6e492d6e 	0x6e492d6e
88000d50:	69626968 	0x69626968
88000d54:	78652074 	0x78652074
88000d58:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000d5c:	006e6f69 	0x6e6f69
88000d60:	43544157 	c0	0x1544157
88000d64:	00000048 	0x48
88000d68:	6863614d 	0x6863614d
88000d6c:	20656e69 	addi	a1,v1,28265
88000d70:	63656863 	0x63656863
88000d74:	0000006b 	0x6b
88000d78:	65726854 	0x65726854
88000d7c:	41206461 	0x41206461
88000d80:	636f6c6c 	0x636f6c6c
88000d84:	6f697461 	0x6f697461
88000d88:	44202c6e 	0x44202c6e
88000d8c:	6c6c6165 	0x6c6c6165
88000d90:	7461636f 	jalx	81858dbc <_bss_end+0x1857dbc>
88000d94:	2c6e6f69 	sltiu	t6,v1,28521
88000d98:	20726f20 	addi	s2,v1,28448
88000d9c:	65686353 	0x65686353
88000da0:	696c7564 	0x696c7564
88000da4:	4520676e 	0x4520676e
88000da8:	70656378 	0x70656378
88000dac:	6e6f6974 	0x6e6f6974
88000db0:	00000073 	tltu	zero,zero,0x1
88000db4:	68636143 	0x68636143
88000db8:	72652065 	0x72652065
88000dbc:	00726f72 	tlt	v1,s2,0x1bd

88000dc0 <EXCEPTION_MESSAGES>:
88000dc0:	88000b4c 	lwl	zero,2892(zero)
88000dc4:	88000b58 	lwl	zero,2904(zero)
88000dc8:	88000b74 	lwl	zero,2932(zero)
88000dcc:	88000ba0 	lwl	zero,2976(zero)
88000dd0:	88000bb8 	lwl	zero,3000(zero)
88000dd4:	88000bec 	lwl	zero,3052(zero)
88000dd8:	88000c0c 	lwl	zero,3084(zero)
88000ddc:	88000c34 	lwl	zero,3124(zero)
88000de0:	88000c68 	lwl	zero,3176(zero)
88000de4:	88000c7c 	lwl	zero,3196(zero)
88000de8:	88000c94 	lwl	zero,3220(zero)
88000dec:	88000cb4 	lwl	zero,3252(zero)
88000df0:	88000cd4 	lwl	zero,3284(zero)
88000df4:	88000cf4 	lwl	zero,3316(zero)
88000df8:	88000d04 	lwl	zero,3332(zero)
88000dfc:	88000d08 	lwl	zero,3336(zero)
88000e00:	88000b30 	lwl	zero,2864(zero)
88000e04:	88000b30 	lwl	zero,2864(zero)
88000e08:	88000b30 	lwl	zero,2864(zero)
88000e0c:	88000d24 	lwl	zero,3364(zero)
88000e10:	88000d40 	lwl	zero,3392(zero)
88000e14:	88000b30 	lwl	zero,2864(zero)
88000e18:	88000b30 	lwl	zero,2864(zero)
88000e1c:	88000d60 	lwl	zero,3424(zero)
88000e20:	88000d68 	lwl	zero,3432(zero)
88000e24:	88000d78 	lwl	zero,3448(zero)
88000e28:	88000b30 	lwl	zero,2864(zero)
88000e2c:	88000b30 	lwl	zero,2864(zero)
88000e30:	88000b30 	lwl	zero,2864(zero)
88000e34:	88000b30 	lwl	zero,2864(zero)
88000e38:	88000db4 	lwl	zero,3508(zero)
88000e3c:	88000b30 	lwl	zero,2864(zero)
88000e40:	01200000 	0x1200000
88000e44:	02000101 	0x2000101
	...
88000e50:	00000001 	movf	zero,zero,$fcc0
88000e54:	00000000 	nop

Disassembly of section .bss:

80000000 <_bss>:
	...

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	00000f41 	0xf41
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	756e6700 	jalx	5b99c00 <_data-0x7a466400>
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
      4c:	04000000 	bltz	zero,50 <_data-0x7fffffb0>
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
      6c:	06010200 	bgez	s0,870 <_data-0x7ffff790>
      70:	00000088 	0x88
      74:	00008d06 	0x8d06
      78:	41050100 	0x41050100
      7c:	50000000 	beqzl	zero,80 <_data-0x7fffff80>
      80:	40880002 	mtc0	t0,$0,2
      84:	01000000 	0x1000000
      88:	0000d89c 	0xd89c
      8c:	005f0700 	0x5f0700
      90:	06010000 	bgez	s0,94 <_data-0x7fffff6c>
      94:	000000d8 	0xd8
      98:	d88083ff 	ldc2	$0,-31745(a0)
      9c:	0063087b 	0x63087b
      a0:	00d80701 	0xd80701
      a4:	83fc0000 	lb	gp,0(ra)
      a8:	087bd880 	j	1ef6200 <_data-0x7e109e00>
      ac:	07010064 	bgez	t8,240 <_data-0x7ffffdc0>
      b0:	000000d8 	0xd8
      b4:	d88083fd 	ldc2	$0,-31747(a0)
      b8:	0065087b 	0x65087b
      bc:	00d80701 	0xd80701
      c0:	83fe0000 	lb	s8,0(ra)
      c4:	097bd880 	j	5ef6200 <_data-0x7a109e00>
      c8:	88000288 	lwl	zero,648(zero)
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
      fc:	02508800 	0x2508800
     100:	01ab8800 	0x1ab8800
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
     130:	0000fc00 	sll	ra,zero,0x10
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
     160:	05020200 	bltzl	t0,964 <_data-0x7ffff69c>
     164:	000001a1 	0x1a1
     168:	69050405 	0x69050405
     16c:	0200746e 	0x200746e
     170:	00940504 	0x940504
     174:	77030000 	jalx	c0c0000 <_data-0x73f40000>
     178:	03000000 	0x3000000
     17c:	00007109 	0x7109
     180:	08010200 	j	40800 <_data-0x7ffbf800>
     184:	0000007f 	0x7f
     188:	0003d603 	sra	k0,v1,0x18
     18c:	830a0300 	lb	t2,768(t8)
     190:	02000000 	0x2000000
     194:	00af0702 	0xaf0702
     198:	66030000 	0x66030000
     19c:	04000002 	bltz	zero,1a8 <_data-0x7ffffe58>
     1a0:	0000660b 	0x660b
     1a4:	06160300 	0x6160300
     1a8:	0d040000 	jal	4100000 <_data-0x7bf00000>
     1ac:	00000033 	tltu	zero,zero
     1b0:	0000b006 	srlv	s6,zero,zero
     1b4:	0000b000 	sll	s6,zero,0x0
     1b8:	00250700 	0x250700
     1bc:	001f0000 	sll	zero,ra,0x0
     1c0:	00450408 	0x450408
     1c4:	11090000 	beq	t0,t1,1c8 <_data-0x7ffffe38>
     1c8:	05000002 	bltz	t0,1d4 <_data-0x7ffffe2c>
     1cc:	0000a007 	srav	s4,zero,zero
     1d0:	c0030500 	ll	v1,1280(zero)
     1d4:	0a88000d 	j	a200034 <_data-0x75dfffcc>
     1d8:	242a05a4 	addiu	t2,at,1444
     1dc:	0b000001 	j	c000004 <_data-0x73fffffc>
     1e0:	000002d0 	0x2d0
     1e4:	01242b05 	0x1242b05
     1e8:	0b000000 	j	c000000 <_data-0x74000000>
     1ec:	0000023e 	0x23e
     1f0:	00332c05 	0x332c05
     1f4:	0b100000 	j	c400000 <_data-0x73c00000>
     1f8:	00000224 	0x224
     1fc:	00332d05 	0x332d05
     200:	0b140000 	j	c500000 <_data-0x73b00000>
     204:	000002a2 	0x2a2
     208:	00332e05 	0x332e05
     20c:	0b180000 	j	c600000 <_data-0x73a00000>
     210:	00000204 	0x204
     214:	00332f05 	0x332f05
     218:	0b1c0000 	j	c700000 <_data-0x73900000>
     21c:	000003cc 	syscall	0xf
     220:	00333005 	0x333005
     224:	0c200000 	jal	800000 <_data-0x7f800000>
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
     25c:	0d000000 	jal	4000000 <_data-0x7c000000>
     260:	00000257 	0x257
     264:	008a0601 	0x8a0601
     268:	820d0000 	lb	t5,0(s0)
     26c:	01000002 	0x1000002
     270:	00008a06 	0x8a06
     274:	02bd0e00 	0x2bd0e00
     278:	55010000 	bnel	t0,at,27c <_data-0x7ffffd84>
     27c:	88000458 	lwl	zero,1112(zero)
     280:	000000b4 	teq	zero,zero,0x2
     284:	02a99c01 	0x2a99c01
     288:	740f0000 	jalx	3c0000 <_data-0x7fc40000>
     28c:	55010066 	bnel	t0,at,428 <_data-0x7ffffbd8>
     290:	000002a9 	0x2a9
     294:	00000000 	nop
     298:	00040c10 	0x40c10
     29c:	af550100 	sw	s5,256(k0)
     2a0:	37000002 	ori	zero,t8,0x2
     2a4:	11000000 	beqz	t0,2a8 <_data-0x7ffffd58>
     2a8:	880004c8 	lwl	zero,1224(zero)
     2ac:	00000044 	0x44
     2b0:	00000232 	tlt	zero,zero,0x8
     2b4:	0002ad12 	0x2ad12
     2b8:	955b0100 	lhu	k1,256(t2)
     2bc:	58000000 	blezl	zero,2c0 <_data-0x7ffffd40>
     2c0:	13000000 	beqz	t8,2c4 <_data-0x7ffffd3c>
     2c4:	00637065 	0x637065
     2c8:	00585c01 	0x585c01
     2cc:	8c140000 	lw	s4,0(zero)
     2d0:	c8000003 	lwc2	$0,3(zero)
     2d4:	04880004 	tgei	a0,4
     2d8:	01000000 	0x1000000
     2dc:	0001e15b 	0x1e15b
     2e0:	04c81500 	tgei	a2,5376
     2e4:	00048800 	sll	s1,a0,0x0
     2e8:	1a160000 	0x1a160000
     2ec:	00000005 	0x5
     2f0:	03a61400 	0x3a61400
     2f4:	04ec0000 	teqi	a3,0
     2f8:	00048800 	sll	s1,a0,0x0
     2fc:	5c010000 	0x5c010000
     300:	00000204 	0x204
     304:	0004ec15 	0x4ec15
     308:	00000488 	0x488
     30c:	04ff1600 	0x4ff1600
     310:	00000000 	nop
     314:	0004fc17 	0x4fc17
     318:	00052288 	0x52288
     31c:	00022100 	sll	a0,v0,0x4
     320:	54011800 	bnel	zero,at,6324 <_data-0x7fff9cdc>
     324:	0af80305 	j	be00c14 <_data-0x741ff3ec>
     328:	01188800 	0x1188800
     32c:	00800255 	0x800255
     330:	05041900 	0x5041900
     334:	052d8800 	0x52d8800
     338:	01180000 	0x1180000
     33c:	00800254 	0x800254
     340:	7c170000 	0x7c170000
     344:	38880004 	xori	t0,a0,0x4
     348:	49000005 	bc2f	360 <_data-0x7ffffca0>
     34c:	18000002 	blez	zero,358 <_data-0x7ffffca8>
     350:	03055401 	0x3055401
     354:	88000974 	lwl	zero,2420(zero)
     358:	04901700 	bltzal	a0,5f5c <_data-0x7fffa0a4>
     35c:	05388800 	0x5388800
     360:	02600000 	0x2600000
     364:	01180000 	0x1180000
     368:	d0030554 	0xd0030554
     36c:	0088000a 	movz	zero,a0,t0
     370:	00049c17 	0x49c17
     374:	00054388 	0x54388
     378:	00027800 	sll	t7,v0,0x0
     37c:	54011800 	bnel	zero,at,6380 <_data-0x7fff9c80>
     380:	bdad1106 	cache	0xd,4358(t5)
     384:	007df5b7 	0x7df5b7
     388:	0004a417 	0x4a417
     38c:	00032888 	0x32888
     390:	00028c00 	sll	s1,v0,0x10
     394:	54011800 	bnel	zero,at,6398 <_data-0x7fff9c68>
     398:	00008102 	srl	s0,zero,0x4
     39c:	0004ac1a 	0x4ac1a
     3a0:	0002b688 	0x2b688
     3a4:	04c81b00 	tgei	a2,6912
     3a8:	05388800 	0x5388800
     3ac:	01180000 	0x1180000
     3b0:	34030554 	li	v1,0x554
     3b4:	0088000b 	movn	zero,a0,t0
     3b8:	44040800 	mfc1	a0,$f1
     3bc:	02000001 	movf	zero,s0,$fcc0
     3c0:	02380201 	0x2380201
     3c4:	2e1c0000 	sltiu	gp,s0,0
     3c8:	01000002 	0x1000002
     3cc:	0003f045 	0x3f045
     3d0:	00006888 	0x6888
     3d4:	289c0100 	slti	gp,a0,256
     3d8:	1d000003 	bgtz	t0,3e8 <_data-0x7ffffc18>
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
     41c:	19000000 	blez	t0,420 <_data-0x7ffffbe0>
     420:	8800043c 	lwl	zero,1084(zero)
     424:	00000522 	0x522
     428:	02540118 	0x2540118
     42c:	01180081 	0x1180081
     430:	7f800255 	0x7f800255
     434:	00000000 	nop
     438:	0002920e 	0x2920e
     43c:	583e0100 	0x583e0100
     440:	98880003 	lwr	t0,3(a0)
     444:	01000000 	0x1000000
     448:	00038c9c 	0x38c9c
     44c:	66740f00 	0x66740f00
     450:	a93e0100 	swl	s8,256(t1)
     454:	c3000002 	ll	zero,2(t8)
     458:	1f000000 	bgtz	t8,45c <_data-0x7ffffba4>
     45c:	00000010 	mfhi	zero
     460:	00000378 	0x378
     464:	0100691e 	0x100691e
     468:	0000583f 	0x583f
     46c:	0000ef00 	sll	sp,zero,0x1c
     470:	03a01900 	0x3a01900
     474:	05228800 	bltzl	t1,fffe2478 <_text_end+0x77fe1620>
     478:	01180000 	0x1180000
     47c:	00830254 	0x830254
     480:	02550118 	0x2550118
     484:	00007f81 	0x7f81
     488:	0003d019 	0x3d019
     48c:	00052288 	0x52288
     490:	54011800 	bnel	zero,at,6494 <_data-0x7fff9b6c>
     494:	0a5c0305 	j	9700c14 <_data-0x768ff3ec>
     498:	00008800 	sll	s1,zero,0x0
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
     4d8:	c8880002 	lwc2	$8,2(a0)
     4dc:	01000000 	0x1000000
     4e0:	0004ec9c 	0x4ec9c
     4e4:	03b51200 	0x3b51200
     4e8:	18010000 	0x18010000
     4ec:	00000058 	0x58
     4f0:	00000131 	tgeu	zero,zero,0x4
     4f4:	00040512 	0x40512
     4f8:	58210100 	0x58210100
     4fc:	4f000000 	c3	0x1000000
     500:	1a000001 	blez	s0,508 <_data-0x7ffffaf8>
     504:	880002a4 	lwl	zero,676(zero)
     508:	0000054e 	0x54e
     50c:	0002ac17 	0x2ac17
     510:	00054388 	0x54388
     514:	00040f00 	sll	at,a0,0x1c
     518:	54011800 	bnel	zero,at,651c <_data-0x7fff9ae4>
     51c:	17003401 	bnez	t8,d524 <_data-0x7fff2adc>
     520:	880002b8 	lwl	zero,696(zero)
     524:	00000538 	0x538
     528:	00000426 	0x426
     52c:	05540118 	0x5540118
     530:	00097403 	sra	t6,t1,0x10
     534:	d4170088 	ldc1	$f23,136(zero)
     538:	38880002 	xori	t0,a0,0x2
     53c:	3d000005 	0x3d000005
     540:	18000004 	blez	zero,554 <_data-0x7ffffaac>
     544:	03055401 	0x3055401
     548:	8800099c 	lwl	zero,2460(zero)
     54c:	02e01700 	0x2e01700
     550:	05438800 	bgezl	t2,fffe2554 <_text_end+0x77fe16fc>
     554:	04500000 	bltzal	v0,558 <_data-0x7ffffaa8>
     558:	01180000 	0x1180000
     55c:	00350154 	0x350154
     560:	0002f817 	0x2f817
     564:	00052288 	0x52288
     568:	00047300 	sll	t6,a0,0xc
     56c:	54011800 	bnel	zero,at,6570 <_data-0x7fff9a90>
     570:	09c40305 	j	7100c14 <_data-0x78eff3ec>
     574:	01188800 	0x1188800
     578:	00810255 	0x810255
     57c:	02560118 	0x2560118
     580:	17000080 	bnez	t8,784 <_data-0x7ffff87c>
     584:	88000308 	lwl	zero,776(zero)
     588:	00000559 	0x559
     58c:	00000492 	0x492
     590:	02540118 	0x2540118
     594:	01180081 	0x1180081
     598:	18300155 	0x18300155
     59c:	80025601 	lb	v0,22017(zero)
     5a0:	10170000 	beq	zero,s7,5a4 <_data-0x7ffffa5c>
     5a4:	43880003 	c0	0x1880003
     5a8:	a5000005 	sh	zero,5(t0)
     5ac:	18000004 	blez	zero,5c0 <_data-0x7ffffa40>
     5b0:	36015401 	ori	at,s0,0x5401
     5b4:	03181a00 	0x3181a00
     5b8:	05648800 	0x5648800
     5bc:	2c170000 	sltiu	s7,zero,0
     5c0:	38880003 	xori	t0,a0,0x3
     5c4:	c5000005 	lwc1	$f0,5(t0)
     5c8:	18000004 	blez	zero,5dc <_data-0x7ffffa24>
     5cc:	03055401 	0x3055401
     5d0:	88000a00 	lwl	zero,2560(zero)
     5d4:	03442100 	0x3442100
     5d8:	05438800 	bgezl	t2,fffe25dc <_text_end+0x77fe1784>
     5dc:	04d80000 	0x4d80000
     5e0:	01180000 	0x1180000
     5e4:	00370154 	0x370154
     5e8:	00035019 	0x35019
     5ec:	00052288 	0x52288
     5f0:	54011800 	bnel	zero,at,65f4 <_data-0x7fff9a0c>
     5f4:	0a1c0305 	j	8700c14 <_data-0x778ff3ec>
     5f8:	00008800 	sll	s1,zero,0x0
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
     624:	05229c01 	bltzl	t1,fffe762c <_text_end+0x77fe67d4>
     628:	9c230000 	0x9c230000
     62c:	01000003 	0x1000003
     630:	00240052 	0x240052
     634:	00000000 	nop
     638:	06000000 	bltz	s0,63c <_data-0x7ffff9c4>
     63c:	025c240c 	syscall	0x97090
     640:	025c0000 	0x25c0000
     644:	4a040000 	c2	0x40000
     648:	0003f124 	0x3f124
     64c:	0003f100 	sll	s8,v1,0x4
     650:	240a0600 	li	t2,1536
     654:	000003be 	0x3be
     658:	000003be 	0x3be
     65c:	76244c04 	jalx	8913010 <_data-0x776ecff0>
     660:	76000002 	jalx	8000008 <_data-0x77fffff8>
     664:	04000002 	bltz	zero,670 <_data-0x7ffff990>
     668:	028b2442 	0x28b2442
     66c:	028b0000 	0x28b0000
     670:	15070000 	bne	t0,a3,674 <_data-0x7ffff98c>
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
     6a0:	00025900 	sll	t3,v0,0x4
     6a4:	03040200 	0x3040200
     6a8:	00a20704 	0xa20704
     6ac:	04030000 	bgezl	zero,6b0 <_data-0x7ffff950>
     6b0:	00009d07 	0x9d07
     6b4:	00000400 	sll	zero,zero,0x10
     6b8:	01010000 	0x1010000
     6bc:	00000185 	0x185
     6c0:	8800050c 	lwl	zero,1292(zero)
     6c4:	00000224 	0x224
     6c8:	01859c01 	0x1859c01
     6cc:	66050000 	0x66050000
     6d0:	0100746d 	0x100746d
     6d4:	00018c01 	0x18c01
     6d8:	00016d00 	sll	t5,at,0x14
     6dc:	69070600 	0x69070600
     6e0:	85030100 	lh	v1,256(t0)
     6e4:	a4000001 	sh	zero,1(zero)
     6e8:	07000001 	bltz	t8,6f0 <_data-0x7ffff910>
     6ec:	04010063 	b	87c <_data-0x7ffff784>
     6f0:	00000192 	0x192
     6f4:	0000020c 	syscall	0x8
     6f8:	67726107 	0x67726107
     6fc:	9e050100 	0x9e050100
     700:	2a000001 	slti	zero,s0,1
     704:	08000002 	j	8 <_data-0x7ffffff8>
     708:	01007061 	0x1007061
     70c:	00002506 	0x2506
     710:	60910200 	0x60910200
     714:	01007707 	0x1007707
     718:	00018507 	0x18507
     71c:	00024800 	sll	t1,v0,0x0
     720:	043d0900 	0x43d0900
     724:	10010000 	beq	zero,at,728 <_data-0x7ffff8d8>
     728:	88000590 	lwl	zero,1424(zero)
     72c:	0000b80a 	movz	s7,zero,zero
     730:	00013600 	sll	a2,at,0x18
     734:	04820b00 	bltzl	a0,3338 <_data-0x7fffccc8>
     738:	14010000 	bne	zero,at,73c <_data-0x7ffff8c4>
     73c:	00000185 	0x185
     740:	000000c6 	0xc6
     744:	220b0006 	addi	t3,s0,6
     748:	01000004 	sllv	zero,zero,t0
     74c:	00018519 	0x18519
     750:	0000d700 	sll	k0,zero,0x1c
     754:	0b000600 	j	c001800 <_data-0x73ffe800>
     758:	0000042a 	0x42a
     75c:	01851e01 	0x1851e01
     760:	00e80000 	0xe80000
     764:	00060000 	sll	zero,a2,0x0
     768:	0005fc0c 	syscall	0x17f0
     76c:	0001a488 	0x1a488
     770:	06580c00 	0x6580c00
     774:	01af8800 	0x1af8800
     778:	7c0c0000 	0x7c0c0000
     77c:	ba880006 	swr	t0,6(s4)
     780:	0c000001 	jal	4 <_data-0x7ffffffc>
     784:	88000698 	lwl	zero,1688(zero)
     788:	000001ba 	0x1ba
     78c:	0006b00d 	break	0x6,0x2c0
     790:	0001ba88 	0x1ba88
     794:	00012500 	sll	a0,at,0x14
     798:	56010e00 	bnel	s0,at,3f9c <_data-0x7fffc064>
     79c:	0e008302 	jal	8020c08 <_data-0x77fdf3f8>
     7a0:	30015701 	andi	at,zero,0x5701
     7a4:	06dc0f00 	0x6dc0f00
     7a8:	01a48800 	0x1a48800
     7ac:	010e0000 	0x10e0000
     7b0:	25080254 	addiu	t0,t0,596
     7b4:	98100000 	lwr	s0,0(zero)
     7b8:	0b000000 	j	c000000 <_data-0x74000000>
     7bc:	00000422 	0x422
     7c0:	01851901 	0x1851901
     7c4:	014c0000 	0x14c0000
     7c8:	00060000 	sll	zero,a2,0x0
     7cc:	00072011 	0x72011
     7d0:	00000888 	0x888
     7d4:	00017a00 	sll	t7,at,0x8
     7d8:	04220b00 	bltzl	at,33dc <_data-0x7fffcc24>
     7dc:	19010000 	0x19010000
     7e0:	00000185 	0x185
     7e4:	0000016a 	0x16a
     7e8:	280f0006 	slti	t7,zero,6
     7ec:	a4880007 	sh	t0,7(a0)
     7f0:	0e000001 	jal	8000004 <_data-0x77fffffc>
     7f4:	3d015401 	0x3d015401
     7f8:	d40c0000 	ldc1	$f12,0(zero)
     7fc:	a4880005 	sh	t0,5(a0)
     800:	00000001 	movf	zero,zero,$fcc0
     804:	05041200 	0x5041200
     808:	00746e69 	0x746e69
     80c:	01990413 	0x1990413
     810:	01030000 	0x1030000
     814:	00008806 	srlv	s1,zero,zero
     818:	01921400 	0x1921400
     81c:	04130000 	bgezall	zero,820 <_data-0x7ffff7e0>
     820:	00000025 	move	zero,zero
     824:	00042215 	0x42215
     828:	00042200 	sll	a0,a0,0x8
     82c:	15190100 	bne	t0,t9,c30 <_data-0x7ffff3d0>
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
     85c:	18000004 	blez	zero,870 <_data-0x7ffff790>
     860:	00000001 	movf	zero,zero,$fcc0
     864:	07000000 	bltz	t8,868 <_data-0x7ffff798>
     868:	02000003 	0x2000003
     86c:	00a20704 	0xa20704
     870:	04020000 	bltzl	zero,874 <_data-0x7ffff78c>
     874:	00009d07 	0x9d07
     878:	042a0300 	tlti	at,768
     87c:	01010000 	0x1010000
     880:	0000011d 	0x11d
     884:	88000730 	lwl	zero,1840(zero)
     888:	000000d8 	0xd8
     88c:	011d9c01 	0x11d9c01
     890:	76040000 	jalx	8100000 <_data-0x77f00000>
     894:	24010100 	li	at,256
     898:	b3000001 	0xb3000001
     89c:	04000002 	bltz	zero,8a8 <_data-0x7ffff758>
     8a0:	01010077 	0x1010077
     8a4:	0000011d 	0x11d
     8a8:	000002fb 	0x2fb
     8ac:	0003d105 	0x3d105
     8b0:	1d010100 	0x1d010100
     8b4:	4b000001 	c2	0x1000001
     8b8:	05000003 	bltz	t0,8c8 <_data-0x7ffff738>
     8bc:	0000049e 	0x49e
     8c0:	011d0101 	0x11d0101
     8c4:	038d0000 	0x38d0000
     8c8:	69060000 	0x69060000
     8cc:	1d030100 	0x1d030100
     8d0:	c7000001 	lwc1	$f0,1(t8)
     8d4:	06000003 	bltz	s0,8e4 <_data-0x7ffff71c>
     8d8:	0301006a 	0x301006a
     8dc:	0000011d 	0x11d
     8e0:	000003f0 	tge	zero,zero,0xf
     8e4:	01006306 	0x1006306
     8e8:	00011d04 	0x11d04
     8ec:	00043f00 	sll	a3,a0,0x1c
     8f0:	75620700 	jalx	5881c00 <_data-0x7a77e400>
     8f4:	05010066 	bgez	t0,a90 <_data-0x7ffff570>
     8f8:	0000012b 	0x12b
     8fc:	7fa89103 	0x7fa89103
     900:	00048c08 	0x48c08
     904:	2c060100 	sltiu	a2,zero,256
     908:	52000000 	beqzl	s0,90c <_data-0x7ffff6f4>
     90c:	09000004 	j	4000010 <_data-0x7bfffff0>
     910:	88000760 	lwl	zero,1888(zero)
     914:	00000010 	mfhi	zero
     918:	000000f8 	0xf8
     91c:	0004220a 	0x4220a
     920:	1d0a0100 	0x1d0a0100
     924:	e7000001 	swc1	$f0,1(t8)
     928:	0b000000 	j	c000000 <_data-0x74000000>
     92c:	076c0c00 	teqi	k1,3072
     930:	01428800 	0x1428800
     934:	010d0000 	0x10d0000
     938:	2d080254 	sltiu	t0,t0,596
     93c:	d80e0000 	ldc2	$14,0(zero)
     940:	30880007 	andi	t0,a0,0x7
     944:	0a000000 	j	8000000 <_data-0x78000000>
     948:	00000422 	0x422
     94c:	011d0a01 	0x11d0a01
     950:	01120000 	0x1120000
     954:	000b0000 	sll	zero,t3,0x0
     958:	0008000f 	0x8000f
     95c:	00014288 	0x14288
     960:	10000000 	b	964 <_data-0x7ffff69c>
     964:	6e690504 	0x6e690504
     968:	04020074 	bltzl	zero,b3c <_data-0x7ffff4c4>
     96c:	00009405 	0x9405
     970:	013b1100 	0x13b1100
     974:	013b0000 	0x13b0000
     978:	25120000 	addiu	s2,t0,0
     97c:	3f000000 	0x3f000000
     980:	06010200 	bgez	s0,1184 <_data-0x7fffee7c>
     984:	00000088 	0x88
     988:	00042213 	0x42213
     98c:	00042200 	sll	a0,a0,0x8
     990:	000a0100 	sll	zero,t2,0x4
     994:	00000416 	0x416
     998:	04b00004 	bltzal	a1,9ac <_data-0x7ffff654>
     99c:	01040000 	0x1040000
     9a0:	000002e3 	0x2e3
     9a4:	0004b10c 	syscall	0x12c4
     9a8:	00044300 	sll	t0,a0,0xc
     9ac:	00012800 	sll	a1,at,0x0
     9b0:	00000000 	nop
     9b4:	00038100 	sll	s0,v1,0x4
     9b8:	03040200 	0x3040200
     9bc:	00a20704 	0xa20704
     9c0:	04030000 	bgezl	zero,9c4 <_data-0x7ffff63c>
     9c4:	00009d07 	0x9d07
     9c8:	04ba0400 	0x4ba0400
     9cc:	10020000 	beq	zero,v0,9d0 <_data-0x7ffff630>
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
     a0c:	54010900 	bnel	zero,at,2e10 <_data-0x7fffd1f0>
     a10:	09007402 	j	401d008 <_data-0x7bfe2ff8>
     a14:	75025501 	jalx	4095404 <_data-0x7bf6abfc>
     a18:	56010900 	bnel	s0,at,2e1c <_data-0x7fffd1e4>
     a1c:	5501f303 	bnel	t0,at,ffffd62c <_text_end+0x77ffc7d4>
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
     a48:	07000004 	bltz	t8,a5c <_data-0x7ffff5a4>
     a4c:	01003276 	tne	t0,zero,0xc9
     a50:	00f60166 	0xf60166
     a54:	04d30000 	bgezall	a2,a58 <_data-0x7ffff5a8>
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
     a80:	0c005501 	jal	15404 <_data-0x7ffeabfc>
     a84:	6e690504 	0x6e690504
     a88:	040d0074 	0x40d0074
     a8c:	000000fc 	0xfc
     a90:	0a040d0e 	j	8103438 <_data-0x77efcbc8>
     a94:	03000001 	movf	zero,t8,$fcc0
     a98:	00880601 	0x880601
     a9c:	030f0000 	0x30f0000
     aa0:	0a000001 	j	8000004 <_data-0x77fffffc>
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
     ae8:	10000005 	b	b00 <_data-0x7ffff500>
     aec:	47010073 	c1	0x1010073
     af0:	0000fd01 	0xfd01
     af4:	0005f300 	sll	s8,a1,0xc
     af8:	00641000 	0x641000
     afc:	74014801 	jalx	52004 <_data-0x7ffadffc>
     b00:	1c000001 	bgtz	zero,b08 <_data-0x7ffff4f8>
     b04:	00000006 	srlv	zero,zero,zero
     b08:	0103040d 	break	0x103,0x10
     b0c:	ed0a0000 	swc3	$10,0(t0)
     b10:	01000004 	sllv	zero,zero,t0
     b14:	0025012c 	0x25012c
     b18:	00000000 	nop
     b1c:	002c0000 	0x2c0000
     b20:	9c010000 	0x9c010000
     b24:	000001dd 	0x1dd
     b28:	74736407 	jalx	1cd901c <_data-0x7e326fe4>
     b2c:	012c0100 	0x12c0100
     b30:	00000025 	move	zero,zero
     b34:	00000671 	tgeu	zero,zero,0x19
     b38:	63727307 	0x63727307
     b3c:	012c0100 	0x12c0100
     b40:	000000f6 	tne	zero,zero,0x3
     b44:	0000068f 	sync	0x1a
     b48:	01006e07 	0x1006e07
     b4c:	0035012c 	0x35012c
     b50:	06b00000 	bltzal	s5,b54 <_data-0x7ffff4ac>
     b54:	730b0000 	madd	t8,t3
     b58:	01300100 	0x1300100
     b5c:	000000fd 	0xfd
     b60:	64105501 	0x64105501
     b64:	01310100 	0x1310100
     b68:	00000174 	teq	zero,zero,0x5
     b6c:	000006fa 	0x6fa
     b70:	028b0a00 	0x28b0a00
     b74:	11010000 	beq	t0,at,b78 <_data-0x7ffff488>
     b78:	00002501 	0x2501
     b7c:	00080800 	sll	at,t0,0x0
     b80:	00002488 	0x2488
     b84:	2e9c0100 	sltiu	gp,s4,256
     b88:	07000002 	bltz	t8,b94 <_data-0x7ffff46c>
     b8c:	11010073 	beq	t0,at,d5c <_data-0x7ffff2a4>
     b90:	00002501 	0x2501
     b94:	00071800 	sll	v1,a3,0x0
     b98:	00630600 	0x630600
     b9c:	03011101 	0x3011101
     ba0:	01000001 	movf	zero,t0,$fcc0
     ba4:	006e0755 	0x6e0755
     ba8:	35011101 	ori	at,t0,0x1101
     bac:	36000000 	ori	zero,s0,0x0
     bb0:	10000007 	b	bd0 <_data-0x7ffff430>
     bb4:	15010070 	bne	t0,at,d78 <_data-0x7ffff288>
     bb8:	00017401 	0x17401
     bbc:	00078000 	sll	s0,a3,0x0
     bc0:	03110000 	0x3110000
     bc4:	01000005 	0x1000005
     bc8:	000174a3 	0x174a3
     bcc:	00000000 	nop
     bd0:	00002800 	sll	a1,zero,0x0
     bd4:	609c0100 	0x609c0100
     bd8:	12000002 	beqz	s0,be4 <_data-0x7ffff41c>
     bdc:	a3010073 	sb	at,115(t8)
     be0:	000000fd 	0xfd
     be4:	0000079e 	0x79e
     be8:	01006313 	0x1006313
     bec:	000103a3 	0x103a3
     bf0:	00550100 	0x550100
     bf4:	0004d811 	0x4d811
     bf8:	748f0100 	jalx	23c0400 <_data-0x7dc3fc00>
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
     c3c:	12000002 	beqz	s0,c48 <_data-0x7ffff3b8>
     c40:	01003173 	tltu	t0,zero,0xc5
     c44:	0000fd7f 	0xfd7f
     c48:	0007e500 	sll	gp,a3,0x14
     c4c:	32731200 	andi	s3,s3,0x1200
     c50:	fd7f0100 	sdc3	$31,256(t3)
     c54:	03000000 	0x3000000
     c58:	12000008 	beqz	s0,c7c <_data-0x7ffff384>
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
     c98:	087e0000 	j	1f80000 <_data-0x7e080000>
     c9c:	11000000 	beqz	t0,ca0 <_data-0x7ffff360>
     ca0:	000004c8 	0x4c8
     ca4:	01744d01 	0x1744d01
     ca8:	00000000 	nop
     cac:	00340000 	0x340000
     cb0:	9c010000 	0x9c010000
     cb4:	0000035f 	0x35f
     cb8:	74736412 	jalx	1cd9048 <_data-0x7e326fb8>
     cbc:	744d0100 	jalx	1340400 <_data-0x7ecbfc00>
     cc0:	9c000001 	0x9c000001
     cc4:	12000008 	beqz	s0,ce8 <_data-0x7ffff318>
     cc8:	00637273 	tltu	v1,v1,0x1c9
     ccc:	00fd4d01 	0xfd4d01
     cd0:	08ba0000 	j	2e80000 <_data-0x7d180000>
     cd4:	6c120000 	0x6c120000
     cd8:	01006e65 	0x1006e65
     cdc:	0000354d 	break	0x0,0xd5
     ce0:	0008d800 	sll	k1,t0,0x0
     ce4:	00701400 	0x701400
     ce8:	01744e01 	0x1744e01
     cec:	090d0000 	j	4340000 <_data-0x7bcc0000>
     cf0:	11000000 	beqz	t0,cf4 <_data-0x7ffff30c>
     cf4:	000004df 	0x4df
     cf8:	01743701 	0x1743701
     cfc:	00000000 	nop
     d00:	00240000 	0x240000
     d04:	9c010000 	0x9c010000
     d08:	000003a4 	0x3a4
     d0c:	74736412 	jalx	1cd9048 <_data-0x7e326fb8>
     d10:	74370100 	jalx	dc0400 <_data-0x7f23fc00>
     d14:	2b000001 	slti	zero,t8,1
     d18:	12000009 	beqz	s0,d40 <_data-0x7ffff2c0>
     d1c:	00637273 	tltu	v1,v1,0x1c9
     d20:	00fd3701 	0xfd3701
     d24:	09490000 	j	5240000 <_data-0x7adc0000>
     d28:	70140000 	madd	zero,s4
     d2c:	743b0100 	jalx	ec0400 <_data-0x7f13fc00>
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
     d58:	09850000 	j	6140000 <_data-0x79ec0000>
     d5c:	6c130000 	0x6c130000
     d60:	01006e65 	0x1006e65
     d64:	00003522 	0x3522
     d68:	14550100 	bne	v0,s5,116c <_data-0x7fffee94>
     d6c:	00746e63 	0x746e63
     d70:	00352301 	0x352301
     d74:	09ca0000 	j	7280000 <_data-0x78d80000>
     d78:	15000000 	bnez	t0,d7c <_data-0x7ffff284>
     d7c:	000004f4 	teq	zero,zero,0x13
     d80:	00350c01 	0x350c01
     d84:	00000000 	nop
     d88:	00200000 	0x200000
     d8c:	9c010000 	0x9c010000
     d90:	01007312 	0x1007312
     d94:	0000fd0c 	syscall	0x3f4
     d98:	0009e900 	sll	sp,t1,0x4
     d9c:	6e631400 	0x6e631400
     da0:	0d010074 	jal	40401d0 <_data-0x7bfbfe30>
     da4:	00000035 	0x35
     da8:	00000a07 	0xa07
     dac:	014c0000 	0x14c0000
     db0:	00040000 	sll	zero,a0,0x0
     db4:	000005f2 	tlt	zero,zero,0x17
     db8:	02e30104 	0x2e30104
     dbc:	0b0c0000 	j	c300000 <_data-0x73d00000>
     dc0:	43000005 	c0	0x1000005
     dc4:	b0000004 	0xb0000004
     dc8:	00000001 	movf	zero,zero,$fcc0
     dcc:	fe000000 	sdc3	$0,0(s0)
     dd0:	02000004 	sllv	zero,zero,s0
     dd4:	00a20704 	0xa20704
     dd8:	04020000 	bltzl	zero,ddc <_data-0x7ffff224>
     ddc:	00009d07 	0x9d07
     de0:	03f10300 	0x3f10300
     de4:	0e010000 	jal	8040000 <_data-0x77fc0000>
     de8:	000000a2 	0xa2
     dec:	8800088c 	lwl	zero,2188(zero)
     df0:	00000030 	tge	zero,zero
     df4:	00a29c01 	0xa29c01
     df8:	73040000 	madd	t8,a0
     dfc:	a90e0100 	swl	t6,256(t0)
     e00:	26000000 	addiu	zero,s0,0
     e04:	0500000a 	bltz	t0,e30 <_data-0x7ffff1d0>
     e08:	00000422 	0x422
     e0c:	00a20701 	0xa20701
     e10:	006a0000 	0x6a0000
     e14:	00060000 	sll	zero,a2,0x0
     e18:	00089c07 	0x89c07
     e1c:	0000bb88 	0xbb88
     e20:	00007f00 	sll	t7,zero,0x1c
     e24:	54010800 	bnel	zero,at,2e28 <_data-0x7fffd1d8>
     e28:	5401f303 	bnel	zero,at,ffffda38 <_text_end+0x77ffcbe0>
     e2c:	08a40700 	j	2901c00 <_data-0x7d6fe400>
     e30:	01448800 	0x1448800
     e34:	00920000 	0x920000
     e38:	01080000 	0x1080000
     e3c:	003d0154 	0x3d0154
     e40:	0008ac09 	0x8ac09
     e44:	00014488 	0x14488
     e48:	54010800 	bnel	zero,at,2e4c <_data-0x7fffd1b4>
     e4c:	00003a01 	0x3a01
     e50:	6905040a 	0x6905040a
     e54:	0b00746e 	j	c01d1b8 <_data-0x73fe2e48>
     e58:	0000b604 	0xb604
     e5c:	06010200 	bgez	s0,1660 <_data-0x7fffe9a0>
     e60:	00000088 	0x88
     e64:	0000af0c 	syscall	0x2bc
     e68:	04820300 	bltzl	a0,1a6c <_data-0x7fffe594>
     e6c:	01010000 	0x1010000
     e70:	000000a2 	0xa2
     e74:	8800082c 	lwl	zero,2092(zero)
     e78:	00000060 	0x60
     e7c:	01449c01 	0x1449c01
     e80:	73040000 	madd	t8,a0
     e84:	a9010100 	swl	at,256(t0)
     e88:	47000000 	c1	0x1000000
     e8c:	0d00000a 	jal	4000028 <_data-0x7bffffd8>
     e90:	03010063 	0x3010063
     e94:	000000af 	0xaf
     e98:	00000a70 	tge	zero,zero,0x29
     e9c:	0001980e 	0x1980e
     ea0:	04220500 	bltzl	at,22a4 <_data-0x7fffdd5c>
     ea4:	07010000 	bgez	t8,ea8 <_data-0x7ffff158>
     ea8:	000000a2 	0xa2
     eac:	00000104 	0x104
     eb0:	740f0006 	jalx	3c0018 <_data-0x7fc3ffe8>
     eb4:	08880008 	j	2200020 <_data-0x7ddfffe0>
     eb8:	32000000 	andi	zero,s0,0x0
     ebc:	05000001 	bltz	t0,ec4 <_data-0x7ffff13c>
     ec0:	00000422 	0x422
     ec4:	00a20701 	0xa20701
     ec8:	01220000 	0x1220000
     ecc:	00060000 	sll	zero,a2,0x0
     ed0:	00087c09 	0x87c09
     ed4:	00014488 	0x14488
     ed8:	54010800 	bnel	zero,at,2edc <_data-0x7fffd124>
     edc:	00003d01 	0x3d01
     ee0:	00088409 	0x88409
     ee4:	00014488 	0x14488
     ee8:	54010800 	bnel	zero,at,2eec <_data-0x7fffd114>
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
     f1c:	51000000 	beqzl	t0,f20 <_data-0x7ffff0e0>
     f20:	02000005 	0x2000005
     f24:	00a20704 	0xa20704
     f28:	04020000 	bltzl	zero,f2c <_data-0x7ffff0d4>
     f2c:	00009d07 	0x9d07
     f30:	06010200 	bgez	s0,1734 <_data-0x7fffe8cc>
     f34:	00000081 	0x81
     f38:	a1050202 	sb	a1,514(t0)
     f3c:	03000001 	movf	zero,t8,$fcc0
     f40:	6e690504 	0x6e690504
     f44:	04020074 	bltzl	zero,1118 <_data-0x7fffeee8>
     f48:	00009405 	0x9405
     f4c:	00770400 	0x770400
     f50:	09020000 	j	4080000 <_data-0x7bf80000>
     f54:	0000005a 	0x5a
     f58:	7f080102 	0x7f080102
     f5c:	02000000 	0x2000000
     f60:	00af0702 	0xaf0702
     f64:	66040000 	0x66040000
     f68:	03000002 	0x3000002
     f6c:	00004f0b 	0x4f0b
     f70:	04220500 	bltzl	at,2374 <_data-0x7fffdc8c>
     f74:	03010000 	0x3010000
     f78:	00000041 	0x41
     f7c:	880008bc 	lwl	zero,2236(zero)
     f80:	0000002c 	0x2c
     f84:	00aa9c01 	0xaa9c01
     f88:	63060000 	0x63060000
     f8c:	41030100 	bc0tl	1390 <_data-0x7fffec70>
     f90:	8e000000 	lw	zero,0(s0)
     f94:	0700000a 	bltz	t8,fc0 <_data-0x7ffff040>
     f98:	880008d4 	lwl	zero,2260(zero)
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
     fd4:	0005ae00 	sll	s5,a1,0x18
     fd8:	03040200 	0x3040200
     fdc:	00a20704 	0xa20704
     fe0:	27040000 	addiu	a0,t8,0
     fe4:	03000000 	0x3000000
     fe8:	009d0704 	0x9d0704
     fec:	33040000 	andi	a0,t8,0x0
     ff0:	05000000 	bltz	t0,ff4 <_data-0x7ffff00c>
     ff4:	000003df 	0x3df
     ff8:	00270f02 	ror	at,a3,0x1c
     ffc:	01030000 	0x1030000
    1000:	00008106 	0x8106
    1004:	05020300 	bltzl	t0,1c08 <_data-0x7fffe3f8>
    1008:	000001a1 	0x1a1
    100c:	69050406 	0x69050406
    1010:	0300746e 	0x300746e
    1014:	00940504 	0x940504
    1018:	77050000 	jalx	c140000 <_data-0x73ec0000>
    101c:	03000000 	0x3000000
    1020:	00007109 	0x7109
    1024:	08010300 	j	40c00 <_data-0x7ffbf400>
    1028:	0000007f 	0x7f
    102c:	00007104 	0x7104
    1030:	03d60500 	0x3d60500
    1034:	0a030000 	j	80c0000 <_data-0x77f40000>
    1038:	00000088 	0x88
    103c:	af070203 	sw	a3,515(t8)
    1040:	04000000 	bltz	zero,1044 <_data-0x7fffefbc>
    1044:	00000088 	0x88
    1048:	00057e05 	0x57e05
    104c:	330c0300 	andi	t4,t8,0x300
    1050:	05000000 	bltz	t0,1054 <_data-0x7fffefac>
    1054:	00000266 	0x266
    1058:	00660b04 	0x660b04
    105c:	e4050000 	swc1	$f5,0(zero)
    1060:	04000006 	bltz	zero,107c <_data-0x7fffef84>
    1064:	00007d0c 	syscall	0x1f4
    1068:	06160500 	0x6160500
    106c:	0d040000 	jal	4100000 <_data-0x7bf00000>
    1070:	0000003f 	0x3f
    1074:	00061505 	0x61505
    1078:	940e0400 	lhu	t6,1024(zero)
    107c:	07000000 	bltz	t8,1080 <_data-0x7fffef80>
    1080:	000005c7 	0x5c7
    1084:	05a70a01 	0x5a70a01
    1088:	04010000 	b	108c <_data-0x7fffef74>
    108c:	08000001 	j	4 <_data-0x7ffffffc>
    1090:	00330054 	0x330054
    1094:	0c090000 	jal	240000 <_data-0x7fdc0000>
    1098:	01000002 	0x1000002
    109c:	0000250a 	0x250a
    10a0:	055f0900 	0x55f0900
    10a4:	0a010000 	j	8040000 <_data-0x77fc0000>
    10a8:	00000033 	tltu	zero,zero
    10ac:	7274700a 	0x7274700a
    10b0:	040b0100 	tltiu	zero,256
    10b4:	00000001 	movf	zero,zero,$fcc0
    10b8:	003a040b 	0x3a040b
    10bc:	f6070000 	sdc1	$f7,0(s0)
    10c0:	01000006 	srlv	zero,zero,t0
    10c4:	0005350a 	0x5350a
    10c8:	01430100 	0x1430100
    10cc:	54080000 	bnel	zero,t0,10d0 <_data-0x7fffef30>
    10d0:	00002700 	sll	a0,zero,0x1c
    10d4:	020c0900 	0x20c0900
    10d8:	0a010000 	j	8040000 <_data-0x77fc0000>
    10dc:	00000025 	move	zero,zero
    10e0:	00055f09 	0x55f09
    10e4:	270a0100 	addiu	t2,t8,256
    10e8:	0a000000 	j	8000000 <_data-0x78000000>
    10ec:	00727470 	tge	v1,s2,0x1d1
    10f0:	01430b01 	0x1430b01
    10f4:	0b000000 	j	c000000 <_data-0x74000000>
    10f8:	00002e04 	0x2e04
    10fc:	062c0700 	teqi	s1,1792
    1100:	0a010000 	j	8040000 <_data-0x77fc0000>
    1104:	00000695 	0x695
    1108:	00018201 	0x18201
    110c:	00540800 	0x540800
    1110:	00000088 	0x88
    1114:	00020c09 	0x20c09
    1118:	250a0100 	addiu	t2,t0,256
    111c:	09000000 	j	4000000 <_data-0x7c000000>
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
    1150:	09000000 	j	4000000 <_data-0x7c000000>
    1154:	0000020c 	syscall	0x8
    1158:	00250a01 	0x250a01
    115c:	5f090000 	0x5f090000
    1160:	01000005 	0x1000005
    1164:	0000710a 	0x710a
    1168:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    116c:	0b010072 	j	c0401c8 <_data-0x73fbfe38>
    1170:	000001c1 	0x1c1
    1174:	78040b00 	0x78040b00
    1178:	0c000000 	jal	0 <_data-0x80000000>
    117c:	000005ec 	0x5ec
    1180:	056f0401 	0x56f0401
    1184:	00330000 	0x330000
    1188:	f9010000 	sdc2	$1,0(t0)
    118c:	08000001 	j	4 <_data-0x7ffffffc>
    1190:	00330054 	0x330054
    1194:	0c090000 	jal	240000 <_data-0x7fdc0000>
    1198:	01000002 	0x1000002
    119c:	00002504 	0x2504
    11a0:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    11a4:	05010072 	bgez	t0,1370 <_data-0x7fffec90>
    11a8:	00000104 	0x104
    11ac:	06820c00 	bltzl	s4,41b0 <_data-0x7fffbe50>
    11b0:	04010000 	b	11b4 <_data-0x7fffee4c>
    11b4:	000006a6 	0x6a6
    11b8:	00000027 	nor	zero,zero,zero
    11bc:	00022b01 	0x22b01
    11c0:	00540800 	0x540800
    11c4:	00000027 	nor	zero,zero,zero
    11c8:	00020c09 	0x20c09
    11cc:	25040100 	addiu	a0,t0,256
    11d0:	0a000000 	j	8000000 <_data-0x78000000>
    11d4:	00727470 	tge	v1,s2,0x1d1
    11d8:	01430501 	0x1430501
    11dc:	0c000000 	jal	0 <_data-0x80000000>
    11e0:	000006cb 	0x6cb
    11e4:	05b80401 	0x5b80401
    11e8:	00880000 	0x880000
    11ec:	5d010000 	0x5d010000
    11f0:	08000002 	j	8 <_data-0x7ffffff8>
    11f4:	00880054 	0x880054
    11f8:	0c090000 	jal	240000 <_data-0x7fdc0000>
    11fc:	01000002 	0x1000002
    1200:	00002504 	0x2504
    1204:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    1208:	05010072 	bgez	t0,13d4 <_data-0x7fffec2c>
    120c:	00000182 	srl	zero,zero,0x6
    1210:	06460c00 	0x6460c00
    1214:	04010000 	b	1218 <_data-0x7fffede8>
    1218:	0000061d 	0x61d
    121c:	00000071 	tgeu	zero,zero,0x1
    1220:	00028f01 	0x28f01
    1224:	00540800 	0x540800
    1228:	00000071 	tgeu	zero,zero,0x1
    122c:	00020c09 	0x20c09
    1230:	25040100 	addiu	a0,t0,256
    1234:	0a000000 	j	8000000 <_data-0x78000000>
    1238:	00727470 	tge	v1,s2,0x1d1
    123c:	01c10501 	0x1c10501
    1240:	0d000000 	jal	4000000 <_data-0x7c000000>
    1244:	00000546 	0x546
    1248:	00b54a01 	0xb54a01
    124c:	00000000 	nop
    1250:	00140000 	sll	zero,s4,0x0
    1254:	9c010000 	0x9c010000
    1258:	000002ef 	0x2ef
    125c:	0009380e 	0x9380e
    1260:	00000000 	nop
    1264:	00000c00 	sll	at,zero,0x10
    1268:	0f4b0100 	jal	d2c0400 <_data-0x72d3fc00>
    126c:	00000948 	0x948
    1270:	00000ab7 	0xab7
    1274:	0001f90e 	0x1f90e
    1278:	00000000 	nop
    127c:	00000c00 	sll	at,zero,0x10
    1280:	0f1c0100 	jal	c700400 <_data-0x738ffc00>
    1284:	00000214 	0x214
    1288:	00000ab7 	0xab7
    128c:	00000010 	mfhi	zero
    1290:	00000c00 	sll	at,zero,0x10
    1294:	021f1100 	0x21f1100
    1298:	e0a00000 	sc	zero,0(a1)
    129c:	007bffc3 	0x7bffc3
    12a0:	12000000 	beqz	s0,12a4 <_data-0x7fffed5c>
    12a4:	000003be 	0x3be
    12a8:	09544601 	j	5511804 <_data-0x7aaee7fc>
    12ac:	00148800 	sll	s1,s4,0x0
    12b0:	9c010000 	0x9c010000
    12b4:	0000036a 	0x36a
    12b8:	00055f13 	0x55f13
    12bc:	b5460100 	0xb5460100
    12c0:	01000000 	0x1000000
    12c4:	087e0e54 	j	1f83950 <_data-0x7e07c6b0>
    12c8:	09540000 	j	5500000 <_data-0x7ab00000>
    12cc:	000c8800 	sll	s1,t4,0x0
    12d0:	47010000 	c1	0x1010000
    12d4:	0008950f 	0x8950f
    12d8:	000acf00 	sll	t9,t2,0x1c
    12dc:	088a0f00 	j	2283c00 <_data-0x7dd7c400>
    12e0:	0ae20000 	j	b880000 <_data-0x74780000>
    12e4:	0a0e0000 	j	8380000 <_data-0x77c80000>
    12e8:	54000001 	bnezl	zero,12f0 <_data-0x7fffed10>
    12ec:	0c880009 	jal	2200024 <_data-0x7ddfffdc>
    12f0:	01000000 	0x1000000
    12f4:	012c0f1d 	0x12c0f1d
    12f8:	0acf0000 	j	b3c0000 <_data-0x74c40000>
    12fc:	210f0000 	addi	t7,t0,0
    1300:	e2000001 	sc	zero,1(s0)
    1304:	1000000a 	b	1330 <_data-0x7fffecd0>
    1308:	88000954 	lwl	zero,2388(zero)
    130c:	0000000c 	syscall
    1310:	00013711 	0x13711
    1314:	c3e09000 	ll	zero,-28672(ra)
    1318:	00007bff 	0x7bff
    131c:	5c120000 	0x5c120000
    1320:	01000002 	0x1000002
    1324:	00094042 	srl	t0,t1,0x1
    1328:	00001488 	0x1488
    132c:	e59c0100 	swc1	$f28,256(t4)
    1330:	13000003 	beqz	t8,1340 <_data-0x7fffecc0>
    1334:	0000055f 	0x55f
    1338:	00aa4201 	0xaa4201
    133c:	54010000 	bnel	zero,at,1340 <_data-0x7fffecc0>
    1340:	0008a10e 	0x8a10e
    1344:	00094000 	sll	t0,t1,0x0
    1348:	00000c88 	0xc88
    134c:	0f430100 	jal	d0c0400 <_data-0x72f3fc00>
    1350:	000008b8 	0x8b8
    1354:	00000afa 	0xafa
    1358:	0008ad0f 	0x8ad0f
    135c:	000b0d00 	sll	at,t3,0x14
    1360:	01490e00 	0x1490e00
    1364:	09400000 	j	5000000 <_data-0x7b000000>
    1368:	000c8800 	sll	s1,t4,0x0
    136c:	1d010000 	0x1d010000
    1370:	00016b0f 	0x16b0f
    1374:	000afa00 	sll	ra,t2,0x8
    1378:	01600f00 	0x1600f00
    137c:	0b0d0000 	j	c340000 <_data-0x73cc0000>
    1380:	40100000 	mfc0	s0,c0_index
    1384:	0c880009 	jal	2200024 <_data-0x7ddfffdc>
    1388:	11000000 	beqz	t0,138c <_data-0x7fffec74>
    138c:	00000176 	tne	zero,zero,0x5
    1390:	ffc3e080 	sdc3	$3,-8064(s8)
    1394:	0000007b 	0x7b
    1398:	06040d00 	0x6040d00
    139c:	39010000 	xori	at,t0,0x0
    13a0:	000000b5 	0xb5
    13a4:	00000000 	nop
    13a8:	00000048 	0x48
    13ac:	04329c01 	bltzall	at,fffe83b4 <_text_end+0x77fe755c>
    13b0:	c6140000 	lwc1	$f20,0(s0)
    13b4:	01000006 	srlv	zero,zero,t0
    13b8:	0000b53a 	0xb53a
    13bc:	000b2500 	sll	a0,t3,0x14
    13c0:	00001500 	sll	v0,zero,0x14
    13c4:	04ef0000 	0x4ef0000
    13c8:	00150000 	sll	zero,s5,0x0
    13cc:	ef000000 	swc3	$0,0(t8)
    13d0:	15000004 	bnez	t0,13e4 <_data-0x7fffec1c>
    13d4:	00000000 	nop
    13d8:	000004ef 	0x4ef
    13dc:	00000015 	0x15
    13e0:	0004ef00 	sll	sp,a0,0x1c
    13e4:	12120000 	beq	s0,s2,13e8 <_data-0x7fffec18>
    13e8:	01000005 	0x1000005
    13ec:	00092034 	teq	zero,t1,0x80
    13f0:	00002088 	0x2088
    13f4:	ef9c0100 	swc3	$28,256(gp)
    13f8:	13000004 	beqz	t8,140c <_data-0x7fffebf4>
    13fc:	0000055f 	0x55f
    1400:	009f3401 	0x9f3401
    1404:	54010000 	bnel	zero,at,1408 <_data-0x7fffebf8>
    1408:	0009a116 	0x9a116
    140c:	00092000 	sll	a0,t1,0x0
    1410:	00000888 	0x888
    1414:	96350100 	lhu	s5,256(s1)
    1418:	17000004 	bnez	t8,142c <_data-0x7fffebd4>
    141c:	000009b1 	tgeu	zero,zero,0x26
    1420:	00025d0e 	0x25d0e
    1424:	00092000 	sll	a0,t1,0x0
    1428:	00000888 	0x888
    142c:	171c0100 	bne	t8,gp,1830 <_data-0x7fffe7d0>
    1430:	00000278 	0x278
    1434:	00092010 	0x92010
    1438:	00000888 	0x888
    143c:	02831100 	0x2831100
    1440:	e0940000 	sc	s4,0(a0)
    1444:	007bfec0 	0x7bfec0
    1448:	c40e0000 	lwc1	$f14,0(zero)
    144c:	34000008 	li	zero,0x8
    1450:	04880009 	tgei	a0,9
    1454:	01000000 	0x1000000
    1458:	08db0f36 	j	36c3cd8 <_data-0x7c93c328>
    145c:	0b810000 	j	e040000 <_data-0x71fc0000>
    1460:	d00f0000 	0xd00f0000
    1464:	94000008 	lhu	zero,8(zero)
    1468:	0e00000b 	jal	800002c <_data-0x77ffffd4>
    146c:	00000188 	0x188
    1470:	88000934 	lwl	zero,2356(zero)
    1474:	00000004 	sllv	zero,zero,zero
    1478:	aa0f1d01 	swl	t7,7425(s0)
    147c:	81000001 	lb	zero,1(t0)
    1480:	0f00000b 	jal	c00002c <_data-0x73ffffd4>
    1484:	0000019f 	0x19f
    1488:	00000b94 	0xb94
    148c:	00093410 	0x93410
    1490:	00000488 	0x488
    1494:	01b51100 	0x1b51100
    1498:	e0800000 	sc	zero,0(a0)
    149c:	007bfec0 	0x7bfec0
    14a0:	0d000000 	jal	4000000 <_data-0x7c000000>
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
    14cc:	17000005 	bnez	t8,14e4 <_data-0x7fffeb1c>
    14d0:	000009b1 	tgeu	zero,zero,0x26
    14d4:	00025d0e 	0x25d0e
    14d8:	00000000 	nop
    14dc:	00000800 	sll	at,zero,0x0
    14e0:	171c0100 	bne	t8,gp,18e4 <_data-0x7fffe71c>
    14e4:	00000278 	0x278
    14e8:	00000010 	mfhi	zero
    14ec:	00000800 	sll	at,zero,0x0
    14f0:	02831100 	0x2831100
    14f4:	e0940000 	sc	s4,0(a0)
    14f8:	007bfec0 	0x7bfec0
    14fc:	a10e0000 	sb	t6,0(t0)
    1500:	00000009 	jalr	zero,zero
    1504:	04000000 	bltz	zero,1508 <_data-0x7fffeaf8>
    1508:	01000000 	0x1000000
    150c:	09b11731 	j	6c45cc4 <_data-0x793ba33c>
    1510:	5d0e0000 	0x5d0e0000
    1514:	00000002 	srl	zero,zero,0x0
    1518:	04000000 	bltz	zero,151c <_data-0x7fffeae4>
    151c:	01000000 	0x1000000
    1520:	0278171c 	0x278171c
    1524:	00100000 	sll	zero,s0,0x0
    1528:	04000000 	bltz	zero,152c <_data-0x7fffead4>
    152c:	11000000 	beqz	t0,1530 <_data-0x7fffead0>
    1530:	00000283 	sra	zero,zero,0xa
    1534:	fec0e080 	sdc3	$0,-8064(s6)
    1538:	0000007b 	0x7b
    153c:	02761200 	0x2761200
    1540:	1f010000 	0x1f010000
    1544:	880008e8 	lwl	zero,2280(zero)
    1548:	00000038 	0x38
    154c:	081b9c01 	j	6e7004 <_data-0x7f918ffc>
    1550:	c4160000 	lwc1	$f22,0(zero)
    1554:	e8000008 	swc2	$0,8(zero)
    1558:	0c880008 	jal	2200020 <_data-0x7ddfffe0>
    155c:	01000000 	0x1000000
    1560:	0005fa21 	0x5fa21
    1564:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    1568:	0bac0000 	j	eb00000 <_data-0x71500000>
    156c:	d00f0000 	0xd00f0000
    1570:	c1000008 	ll	zero,8(t0)
    1574:	0e00000b 	jal	800002c <_data-0x77ffffd4>
    1578:	00000188 	0x188
    157c:	880008e8 	lwl	zero,2280(zero)
    1580:	0000000c 	syscall
    1584:	aa0f1d01 	swl	t7,7425(s0)
    1588:	ac000001 	sw	zero,1(zero)
    158c:	0f00000b 	jal	c00002c <_data-0x73ffffd4>
    1590:	0000019f 	0x19f
    1594:	00000bc1 	0xbc1
    1598:	0008e810 	0x8e810
    159c:	00000c88 	0xc88
    15a0:	01b51100 	0x1b51100
    15a4:	e0880000 	sc	t0,0(a0)
    15a8:	007bfec0 	0x7bfec0
    15ac:	c4160000 	lwc1	$f22,0(zero)
    15b0:	f4000008 	sdc1	$f0,8(zero)
    15b4:	08880008 	j	2200020 <_data-0x7ddfffe0>
    15b8:	01000000 	0x1000000
    15bc:	00065623 	0x65623
    15c0:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    15c4:	0bd90000 	j	f640000 <_data-0x709c0000>
    15c8:	d00f0000 	0xd00f0000
    15cc:	ee000008 	swc3	$0,8(s0)
    15d0:	0e00000b 	jal	800002c <_data-0x77ffffd4>
    15d4:	00000188 	0x188
    15d8:	880008f4 	lwl	zero,2292(zero)
    15dc:	00000008 	jr	zero
    15e0:	aa0f1d01 	swl	t7,7425(s0)
    15e4:	d9000001 	ldc2	$0,1(t0)
    15e8:	0f00000b 	jal	c00002c <_data-0x73ffffd4>
    15ec:	0000019f 	0x19f
    15f0:	00000bee 	0xbee
    15f4:	0008f410 	0x8f410
    15f8:	00000888 	0x888
    15fc:	01b51100 	0x1b51100
    1600:	e08c0000 	sc	t4,0(a0)
    1604:	007bfec0 	0x7bfec0
    1608:	c4160000 	lwc1	$f22,0(zero)
    160c:	fc000008 	sdc3	$0,8(zero)
    1610:	08880008 	j	2200020 <_data-0x7ddfffe0>
    1614:	01000000 	0x1000000
    1618:	0006b225 	0x6b225
    161c:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    1620:	0c060000 	jal	180000 <_data-0x7fe80000>
    1624:	d00f0000 	0xd00f0000
    1628:	1b000008 	blez	t8,164c <_data-0x7fffe9b4>
    162c:	0e00000c 	jal	8000030 <_data-0x77ffffd0>
    1630:	00000188 	0x188
    1634:	880008fc 	lwl	zero,2300(zero)
    1638:	00000008 	jr	zero
    163c:	aa0f1d01 	swl	t7,7425(s0)
    1640:	06000001 	bltz	s0,1648 <_data-0x7fffe9b8>
    1644:	0f00000c 	jal	c000030 <_data-0x73ffffd0>
    1648:	0000019f 	0x19f
    164c:	00000c1b 	0xc1b
    1650:	0008fc10 	0x8fc10
    1654:	00000888 	0x888
    1658:	01b51100 	0x1b51100
    165c:	e0800000 	sc	zero,0(a0)
    1660:	007bfec0 	0x7bfec0
    1664:	c4180000 	lwc1	$f24,0(zero)
    1668:	04000008 	bltz	zero,168c <_data-0x7fffe974>
    166c:	d8880009 	ldc2	$8,9(a0)
    1670:	01000001 	movf	zero,t0,$fcc0
    1674:	00070a28 	0x70a28
    1678:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    167c:	0c330000 	jal	cc0000 <_data-0x7f340000>
    1680:	d00f0000 	0xd00f0000
    1684:	47000008 	c1	0x1000008
    1688:	1900000c 	blez	t0,16bc <_data-0x7fffe944>
    168c:	00000188 	0x188
    1690:	88000904 	lwl	zero,2308(zero)
    1694:	000001d8 	0x1d8
    1698:	aa0f1d01 	swl	t7,7425(s0)
    169c:	33000001 	andi	zero,t8,0x1
    16a0:	0f00000c 	jal	c000030 <_data-0x73ffffd0>
    16a4:	0000019f 	0x19f
    16a8:	00000c47 	0xc47
    16ac:	0001d81a 	0x1d81a
    16b0:	01b51100 	0x1b51100
    16b4:	e08c0000 	sc	t4,0(a0)
    16b8:	007bfec0 	0x7bfec0
    16bc:	c4160000 	lwc1	$f22,0(zero)
    16c0:	08000008 	j	20 <_data-0x7fffffe0>
    16c4:	04880009 	tgei	a0,9
    16c8:	01000000 	0x1000000
    16cc:	00076626 	0x76626
    16d0:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    16d4:	0c5f0000 	jal	17c0000 <_data-0x7e840000>
    16d8:	d00f0000 	0xd00f0000
    16dc:	73000008 	0x73000008
    16e0:	0e00000c 	jal	8000030 <_data-0x77ffffd0>
    16e4:	00000188 	0x188
    16e8:	88000908 	lwl	zero,2312(zero)
    16ec:	00000004 	sllv	zero,zero,zero
    16f0:	aa0f1d01 	swl	t7,7425(s0)
    16f4:	5f000001 	bgtzl	t8,16fc <_data-0x7fffe904>
    16f8:	0f00000c 	jal	c000030 <_data-0x73ffffd0>
    16fc:	0000019f 	0x19f
    1700:	00000c73 	tltu	zero,zero,0x31
    1704:	00090810 	0x90810
    1708:	00000488 	0x488
    170c:	01b51100 	0x1b51100
    1710:	e0840000 	sc	a0,0(a0)
    1714:	007bfec0 	0x7bfec0
    1718:	c4160000 	lwc1	$f22,0(zero)
    171c:	10000008 	b	1740 <_data-0x7fffe8c0>
    1720:	04880009 	tgei	a0,9
    1724:	01000000 	0x1000000
    1728:	0007c22a 	0x7c22a
    172c:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    1730:	0c8b0000 	jal	22c0000 <_data-0x7dd40000>
    1734:	d00f0000 	0xd00f0000
    1738:	9f000008 	0x9f000008
    173c:	0e00000c 	jal	8000030 <_data-0x77ffffd0>
    1740:	00000188 	0x188
    1744:	88000910 	lwl	zero,2320(zero)
    1748:	00000004 	sllv	zero,zero,zero
    174c:	aa0f1d01 	swl	t7,7425(s0)
    1750:	8b000001 	lwl	zero,1(t8)
    1754:	0f00000c 	jal	c000030 <_data-0x73ffffd0>
    1758:	0000019f 	0x19f
    175c:	00000c9f 	0xc9f
    1760:	00091010 	0x91010
    1764:	00000488 	0x488
    1768:	01b51100 	0x1b51100
    176c:	e0900000 	sc	s0,0(a0)
    1770:	007bfec0 	0x7bfec0
    1774:	c40e0000 	lwc1	$f14,0(zero)
    1778:	14000008 	bnez	zero,179c <_data-0x7fffe864>
    177c:	04880009 	tgei	a0,9
    1780:	01000000 	0x1000000
    1784:	08db0f2c 	j	36c3cb0 <_data-0x7c93c350>
    1788:	0cb70000 	jal	2dc0000 <_data-0x7d240000>
    178c:	d00f0000 	0xd00f0000
    1790:	cb000008 	lwc2	$0,8(t8)
    1794:	0e00000c 	jal	8000030 <_data-0x77ffffd0>
    1798:	00000188 	0x188
    179c:	88000914 	lwl	zero,2324(zero)
    17a0:	00000004 	sllv	zero,zero,zero
    17a4:	aa0f1d01 	swl	t7,7425(s0)
    17a8:	b7000001 	0xb7000001
    17ac:	0f00000c 	jal	c000030 <_data-0x73ffffd0>
    17b0:	0000019f 	0x19f
    17b4:	00000ccb 	0xccb
    17b8:	00091410 	0x91410
    17bc:	00000488 	0x488
    17c0:	01b51100 	0x1b51100
    17c4:	e0840000 	sc	a0,0(a0)
    17c8:	007bfec0 	0x7bfec0
    17cc:	12000000 	beqz	s0,17d0 <_data-0x7fffe830>
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
    1804:	04000000 	bltz	zero,1808 <_data-0x7fffe7f8>
    1808:	01000000 	0x1000000
    180c:	00ed0f1d 	0xed0f1d
    1810:	0ce30000 	jal	38c0000 <_data-0x7c740000>
    1814:	e20f0000 	sc	t7,0(s0)
    1818:	f6000000 	sdc1	$f0,0(s0)
    181c:	1000000c 	b	1850 <_data-0x7fffe7b0>
    1820:	00000000 	nop
    1824:	00000004 	sllv	zero,zero,zero
    1828:	0000f81b 	0xf81b
    182c:	00540100 	0x540100
    1830:	541c0000 	bnel	zero,gp,1834 <_data-0x7fffe7cc>
    1834:	01000005 	0x1000005
    1838:	08a1011d 	j	2840474 <_data-0x7d7bfb8c>
    183c:	0c090000 	jal	240000 <_data-0x7fdc0000>
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
    188c:	09000000 	j	4000000 <_data-0x7c000000>
    1890:	0000055f 	0x55f
    1894:	009f1d01 	0x9f1d01
    1898:	0d000000 	jal	4000000 <_data-0x7c000000>
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
    1914:	0c000000 	jal	0 <_data-0x80000000>
    1918:	01000000 	0x1000000
    191c:	0009a19c 	0x9a19c
    1920:	020c1300 	0x20c1300
    1924:	1c010000 	0x1c010000
    1928:	00000025 	move	zero,zero
    192c:	2b0e5401 	slti	t6,t8,21505
    1930:	00000002 	srl	zero,zero,0x0
    1934:	04000000 	bltz	zero,1938 <_data-0x7fffe6c8>
    1938:	01000000 	0x1000000
    193c:	0246171c 	0x246171c
    1940:	00100000 	sll	zero,s0,0x0
    1944:	04000000 	bltz	zero,1948 <_data-0x7fffe6b8>
    1948:	1b000000 	blez	t8,194c <_data-0x7fffe6b4>
    194c:	00000251 	0x251
    1950:	00005401 	0x5401
    1954:	06ec1d00 	teqi	s7,7424
    1958:	1c010000 	0x1c010000
    195c:	0000009f 	0x9f
    1960:	0009bd01 	0x9bd01
    1964:	020c0900 	0x20c0900
    1968:	1c010000 	0x1c010000
    196c:	00000025 	move	zero,zero
    1970:	09a11e00 	j	6847800 <_data-0x797b8800>
    1974:	00000000 	nop
    1978:	000c0000 	sll	zero,t4,0x0
    197c:	9c010000 	0x9c010000
    1980:	000009fe 	0x9fe
    1984:	0009b11f 	0x9b11f
    1988:	0e540100 	jal	9500400 <_data-0x76affc00>
    198c:	0000025d 	0x25d
    1990:	00000000 	nop
    1994:	00000004 	sllv	zero,zero,zero
    1998:	78171c01 	0x78171c01
    199c:	10000002 	b	19a8 <_data-0x7fffe658>
    19a0:	00000000 	nop
    19a4:	00000004 	sllv	zero,zero,zero
    19a8:	0002831b 	0x2831b
    19ac:	00540100 	0x540100
    19b0:	381e0000 	xori	s8,zero,0x0
    19b4:	00000009 	jalr	zero,zero
    19b8:	0c000000 	jal	0 <_data-0x80000000>
    19bc:	01000000 	0x1000000
    19c0:	000a439c 	0xa439c
    19c4:	09481f00 	j	5207c00 <_data-0x7adf8400>
    19c8:	54010000 	bnel	zero,at,19cc <_data-0x7fffe634>
    19cc:	0001f90e 	0x1f90e
    19d0:	00000000 	nop
    19d4:	00000400 	sll	zero,zero,0x10
    19d8:	0f1c0100 	jal	c700400 <_data-0x738ffc00>
    19dc:	00000214 	0x214
    19e0:	00000d1c 	0xd1c
    19e4:	00000010 	mfhi	zero
    19e8:	00000400 	sll	zero,zero,0x10
    19ec:	021f1b00 	0x21f1b00
    19f0:	54010000 	bnel	zero,at,19f4 <_data-0x7fffe60c>
    19f4:	1e000000 	bgtz	s0,19f8 <_data-0x7fffe608>
    19f8:	000008c4 	0x8c4
    19fc:	00000000 	nop
    1a00:	0000000c 	syscall
    1a04:	0a989c01 	j	a627004 <_data-0x759d8ffc>
    1a08:	d01f0000 	0xd01f0000
    1a0c:	01000008 	jr	t0
    1a10:	08db1f54 	j	36c7d50 <_data-0x7c9382b0>
    1a14:	55010000 	bnel	t0,at,1a18 <_data-0x7fffe5e8>
    1a18:	0001880e 	0x1880e
    1a1c:	00000000 	nop
    1a20:	00000400 	sll	zero,zero,0x10
    1a24:	0f1d0100 	jal	c740400 <_data-0x738bfc00>
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
    1a5c:	1f00000a 	bgtz	t8,1a88 <_data-0x7fffe578>
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
    1a88:	0d680000 	jal	5a00000 <_data-0x7a600000>
    1a8c:	00100000 	sll	zero,s0,0x0
    1a90:	04000000 	bltz	zero,1a94 <_data-0x7fffe56c>
    1a94:	1b000000 	blez	t8,1a98 <_data-0x7fffe568>
    1a98:	00000176 	tne	zero,zero,0x5
    1a9c:	00005401 	0x5401
    1aa0:	087e2000 	j	1f88000 <_data-0x7e078000>
    1aa4:	00000000 	nop
    1aa8:	000c0000 	sll	zero,t4,0x0
    1aac:	9c010000 	0x9c010000
    1ab0:	00088a1f 	0x88a1f
    1ab4:	1f540100 	0x1f540100
    1ab8:	00000895 	0x895
    1abc:	0a0e5501 	j	8395404 <_data-0x77c6abfc>
    1ac0:	00000001 	movf	zero,zero,$fcc0
    1ac4:	04000000 	bltz	zero,1ac8 <_data-0x7fffe538>
    1ac8:	01000000 	0x1000000
    1acc:	012c0f1d 	0x12c0f1d
    1ad0:	0d7b0000 	jal	5ec0000 <_data-0x7a140000>
    1ad4:	210f0000 	addi	t7,t0,0
    1ad8:	8e000001 	lw	zero,1(s0)
    1adc:	1000000d 	b	1b14 <_data-0x7fffe4ec>
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
   8:	550e1b0e 	bnel	t0,t6,6c44 <_data-0x7fff93bc>
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	10011117 	beq	zero,at,446c <_data-0x7fffbb94>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	02000017 	0x2000017
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	0e030b3e 	jal	80c2cf8 <_data-0x77f3d308>
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
  2c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
  30:	13490b3b 	beq	k0,t1,2d20 <_data-0x7fffd2e0>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	35050000 	ori	a1,t0,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	00134900 	sll	t1,s3,0x4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	012e0600 	0x12e0600
  40:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
  44:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	01111349 	0x1111349
  4c:	18400612 	blez	v0,1898 <_data-0x7fffe768>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	01194297 	0x1194297
  54:	07000013 	bltz	t8,a4 <_data-0x7fffff5c>
  58:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
  5c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	0d1c1349 	jal	4704d24 <_data-0x7b8fb2dc>
  64:	34080000 	li	t0,0x0
  68:	3a080300 	xori	t0,s0,0x300
  6c:	490b3b0b 	bc2tl	$cc2,ec9c <_data-0x7fff1364>
  70:	000d1c13 	0xd1c13
  74:	82890900 	lb	t1,2304(s4)
  78:	01110101 	0x1110101
  7c:	00001331 	tgeu	zero,zero,0x4c
  80:	01828a0a 	0x1828a0a
  84:	91180200 	lbu	t8,512(t0)
  88:	00001842 	srl	v1,zero,0x1
  8c:	0b000f0b 	j	c003c2c <_data-0x73ffc3d4>
  90:	0013490b 	0x13490b
  94:	002e0c00 	0x2e0c00
  98:	193c193f 	0x193c193f
  9c:	0e030e6e 	jal	80c39b8 <_data-0x77f3c648>
  a0:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
  a4:	01000000 	0x1000000
  a8:	06100011 	bltzal	s0,f0 <_data-0x7fffff10>
  ac:	01120111 	0x1120111
  b0:	0e1b0e03 	jal	86c380c <_data-0x7793c7f4>
  b4:	05130e25 	bgezall	t0,394c <_data-0x7fffc6b4>
  b8:	01000000 	0x1000000
  bc:	0e250111 	jal	8940444 <_data-0x776bfbbc>
  c0:	0e030b13 	jal	80c2c4c <_data-0x77f3d3b4>
  c4:	17550e1b 	bne	k0,s5,3934 <_data-0x7fffc6cc>
  c8:	17100111 	bne	t8,s0,510 <_data-0x7ffffaf0>
  cc:	24020000 	li	v0,0
  d0:	3e0b0b00 	0x3e0b0b00
  d4:	000e030b 	0xe030b
  d8:	00160300 	sll	zero,s6,0xc
  dc:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
  e0:	13490b3b 	beq	k0,t1,2dd0 <_data-0x7fffd230>
  e4:	26040000 	addiu	a0,s0,0
  e8:	00134900 	sll	t1,s3,0x4
  ec:	00240500 	0x240500
  f0:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
  f4:	00000803 	sra	at,zero,0x0
  f8:	49010106 	bc2t	514 <_data-0x7ffffaec>
  fc:	00130113 	0x130113
 100:	00210700 	0x210700
 104:	0b2f1349 	j	cbc4d24 <_data-0x7343b2dc>
 108:	0f080000 	jal	c200000 <_data-0x73e00000>
 10c:	490b0b00 	bc2tl	$cc2,2d10 <_data-0x7fffd2f0>
 110:	09000013 	j	400004c <_data-0x7bffffb4>
 114:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
 118:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 11c:	193f1349 	0x193f1349
 120:	00001802 	srl	v1,zero,0x0
 124:	0b01130a 	j	c044c28 <_data-0x73fbb3d8>
 128:	3b0b3a0b 	xori	t3,t8,0x3a0b
 12c:	0013010b 	0x13010b
 130:	000d0b00 	sll	at,t5,0xc
 134:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 138:	13490b3b 	beq	k0,t1,2e28 <_data-0x7fffd1d8>
 13c:	00000b38 	0xb38
 140:	03000d0c 	syscall	0xc0034
 144:	3b0b3a08 	xori	t3,t8,0x3a08
 148:	3813490b 	xori	s3,zero,0x490b
 14c:	0d00000b 	jal	400002c <_data-0x7bffffd4>
 150:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
 154:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 158:	193f1349 	0x193f1349
 15c:	0000193c 	0x193c
 160:	3f012e0e 	0x3f012e0e
 164:	3a0e0319 	xori	t6,s0,0x319
 168:	270b3b0b 	addiu	t3,t8,15115
 16c:	12011119 	beq	s0,at,45d4 <_data-0x7fffba2c>
 170:	97184006 	lhu	t8,16390(t8)
 174:	13011942 	beq	t8,at,6680 <_data-0x7fff9980>
 178:	050f0000 	0x50f0000
 17c:	3a080300 	xori	t0,s0,0x300
 180:	490b3b0b 	bc2tl	$cc2,edb0 <_data-0x7fff1250>
 184:	00170213 	0x170213
 188:	00051000 	sll	v0,a1,0x0
 18c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 190:	13490b3b 	beq	k0,t1,2e80 <_data-0x7fffd180>
 194:	00001702 	srl	v0,zero,0x1c
 198:	11010b11 	beq	t0,at,2de0 <_data-0x7fffd220>
 19c:	01061201 	0x1061201
 1a0:	12000013 	beqz	s0,1f0 <_data-0x7ffffe10>
 1a4:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
 1a8:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 1ac:	17021349 	bne	t8,v0,4ed4 <_data-0x7fffb12c>
 1b0:	34130000 	li	s3,0x0
 1b4:	3a080300 	xori	t0,s0,0x300
 1b8:	490b3b0b 	bc2tl	$cc2,ede8 <_data-0x7fff1218>
 1bc:	14000013 	bnez	zero,20c <_data-0x7ffffdf4>
 1c0:	1331011d 	beq	t9,s1,638 <_data-0x7ffff9c8>
 1c4:	06120111 	bltzall	s0,60c <_data-0x7ffff9f4>
 1c8:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 1cc:	00001301 	0x1301
 1d0:	11010b15 	beq	t0,at,2e28 <_data-0x7fffd1d8>
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
 20c:	1b000013 	blez	t8,25c <_data-0x7ffffda4>
 210:	01018289 	0x1018289
 214:	42950111 	c0	0x950111
 218:	00133119 	0x133119
 21c:	012e1c00 	0x12e1c00
 220:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 224:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 228:	06120111 	bltzall	s0,670 <_data-0x7ffff990>
 22c:	42971840 	c0	0x971840
 230:	00130119 	0x130119
 234:	010b1d00 	0x10b1d00
 238:	00001755 	0x1755
 23c:	0300341e 	0x300341e
 240:	3b0b3a08 	xori	t3,t8,0x3a08
 244:	0213490b 	0x213490b
 248:	1f000017 	bgtz	t8,2a8 <_data-0x7ffffd58>
 24c:	1755010b 	bne	k0,s5,67c <_data-0x7ffff984>
 250:	00001301 	0x1301
 254:	3f012e20 	0x3f012e20
 258:	3a0e0319 	xori	t6,s0,0x319
 25c:	490b3b0b 	bc2tl	$cc2,ee8c <_data-0x7fff1174>
 260:	010b2013 	0x10b2013
 264:	21000013 	addi	zero,t0,19
 268:	01018289 	0x1018289
 26c:	42950111 	c0	0x950111
 270:	01133119 	0x1133119
 274:	22000013 	addi	zero,s0,19
 278:	1331012e 	beq	t9,s1,734 <_data-0x7ffff8cc>
 27c:	06120111 	bltzall	s0,6c4 <_data-0x7ffff93c>
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
 2ac:	550e1b0e 	bnel	t0,t6,6ee8 <_data-0x7fff9118>
 2b0:	10011117 	beq	zero,at,4710 <_data-0x7fffb8f0>
 2b4:	02000017 	0x2000017
 2b8:	0b0b000f 	j	c2c003c <_data-0x73d3ffc4>
 2bc:	24030000 	li	v1,0
 2c0:	3e0b0b00 	0x3e0b0b00
 2c4:	000e030b 	0xe030b
 2c8:	012e0400 	0x12e0400
 2cc:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 2d0:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 2d4:	13491927 	beq	k0,t1,6774 <_data-0x7fff988c>
 2d8:	06120111 	bltzall	s0,720 <_data-0x7ffff8e0>
 2dc:	42971840 	c0	0x971840
 2e0:	00130119 	0x130119
 2e4:	00050500 	sll	zero,a1,0x14
 2e8:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 2ec:	13490b3b 	beq	k0,t1,2fdc <_data-0x7fffd024>
 2f0:	00001702 	srl	v0,zero,0x1c
 2f4:	00001806 	srlv	v1,zero,zero
 2f8:	00340700 	0x340700
 2fc:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 300:	13490b3b 	beq	k0,t1,2ff0 <_data-0x7fffd010>
 304:	00001702 	srl	v0,zero,0x1c
 308:	03003408 	0x3003408
 30c:	3b0b3a08 	xori	t3,t8,0x3a08
 310:	0213490b 	0x213490b
 314:	09000018 	j	4000060 <_data-0x7bffffa0>
 318:	0e03000a 	jal	80c0028 <_data-0x77f3ffd8>
 31c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 320:	00000111 	0x111
 324:	55010b0a 	bnel	t0,at,2f50 <_data-0x7fffd0b0>
 328:	00130117 	0x130117
 32c:	012e0b00 	0x12e0b00
 330:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 334:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 338:	193c1349 	0x193c1349
 33c:	00001301 	0x1301
 340:	0182890c 	syscall	0x60a24
 344:	31011100 	andi	at,t0,0x1100
 348:	0d000013 	jal	400004c <_data-0x7bffffb4>
 34c:	01018289 	0x1018289
 350:	13310111 	beq	t9,s1,798 <_data-0x7ffff868>
 354:	00001301 	0x1301
 358:	01828a0e 	0x1828a0e
 35c:	91180200 	lbu	t8,512(t0)
 360:	00001842 	srl	v1,zero,0x1
 364:	0182890f 	0x182890f
 368:	31011101 	andi	at,t0,0x1101
 36c:	10000013 	b	3bc <_data-0x7ffffc44>
 370:	1755010b 	bne	k0,s5,7a0 <_data-0x7ffff860>
 374:	0b110000 	j	c440000 <_data-0x73bc0000>
 378:	12011101 	beq	s0,at,4780 <_data-0x7fffb880>
 37c:	00130106 	0x130106
 380:	00241200 	0x241200
 384:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 388:	00000803 	sra	at,zero,0x0
 38c:	0b000f13 	j	c003c4c <_data-0x73ffc3b4>
 390:	0013490b 	0x13490b
 394:	00261400 	0x261400
 398:	00001349 	0x1349
 39c:	3f002e15 	0x3f002e15
 3a0:	6e193c19 	0x6e193c19
 3a4:	3a0e030e 	xori	t6,s0,0x30e
 3a8:	000b3b0b 	0xb3b0b
 3ac:	11010000 	beq	t0,at,3b0 <_data-0x7ffffc50>
 3b0:	130e2501 	beq	t8,t6,97b8 <_data-0x7fff6848>
 3b4:	1b0e030b 	0x1b0e030b
 3b8:	1117550e 	beq	t0,s7,157f4 <_data-0x7ffea80c>
 3bc:	00171001 	0x171001
 3c0:	00240200 	0x240200
 3c4:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 3c8:	00000e03 	sra	at,zero,0x18
 3cc:	3f012e03 	0x3f012e03
 3d0:	3a0e0319 	xori	t6,s0,0x319
 3d4:	270b3b0b 	addiu	t3,t8,15115
 3d8:	11134919 	beq	t0,s3,12840 <_data-0x7ffed7c0>
 3dc:	40061201 	0x40061201
 3e0:	19429718 	0x19429718
 3e4:	00001301 	0x1301
 3e8:	03000504 	0x3000504
 3ec:	3b0b3a08 	xori	t3,t8,0x3a08
 3f0:	0213490b 	0x213490b
 3f4:	05000017 	bltz	t0,454 <_data-0x7ffffbac>
 3f8:	0e030005 	jal	80c0014 <_data-0x77f3ffec>
 3fc:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 400:	17021349 	bne	t8,v0,5128 <_data-0x7fffaed8>
 404:	34060000 	li	a2,0x0
 408:	3a080300 	xori	t0,s0,0x300
 40c:	490b3b0b 	bc2tl	$cc2,f03c <_data-0x7fff0fc4>
 410:	00170213 	0x170213
 414:	00340700 	0x340700
 418:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 41c:	13490b3b 	beq	k0,t1,310c <_data-0x7fffcef4>
 420:	00001802 	srl	v1,zero,0x0
 424:	03003408 	0x3003408
 428:	3b0b3a0e 	xori	t3,t8,0x3a0e
 42c:	0213490b 	0x213490b
 430:	09000017 	j	400005c <_data-0x7bffffa4>
 434:	0111010b 	0x111010b
 438:	13010612 	beq	t8,at,1c84 <_data-0x7fffe37c>
 43c:	2e0a0000 	sltiu	t2,s0,0
 440:	03193f01 	0x3193f01
 444:	3b0b3a0e 	xori	t3,t8,0x3a0e
 448:	3c13490b 	lui	s3,0x490b
 44c:	00130119 	0x130119
 450:	00180b00 	sll	at,t8,0xc
 454:	890c0000 	lwl	t4,0(t0)
 458:	11010182 	beq	t0,at,a64 <_data-0x7ffff59c>
 45c:	00133101 	0x133101
 460:	828a0d00 	lb	t2,3328(s4)
 464:	18020001 	0x18020001
 468:	00184291 	0x184291
 46c:	010b0e00 	0x10b0e00
 470:	06120111 	bltzall	s0,8b8 <_data-0x7ffff748>
 474:	890f0000 	lwl	t7,0(t0)
 478:	11000182 	beqz	t0,a84 <_data-0x7ffff57c>
 47c:	00133101 	0x133101
 480:	00241000 	0x241000
 484:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 488:	00000803 	sra	at,zero,0x0
 48c:	49010111 	bc2t	8d4 <_data-0x7ffff72c>
 490:	00130113 	0x130113
 494:	00211200 	0x211200
 498:	0b2f1349 	j	cbc4d24 <_data-0x7343b2dc>
 49c:	2e130000 	sltiu	s3,s0,0
 4a0:	3c193f00 	lui	t9,0x3f00
 4a4:	030e6e19 	0x30e6e19
 4a8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 4ac:	0000000b 	movn	zero,zero,zero
 4b0:	25011101 	addiu	at,t0,4353
 4b4:	030b130e 	0x30b130e
 4b8:	550e1b0e 	bnel	t0,t6,70f4 <_data-0x7fff8f0c>
 4bc:	10011117 	beq	zero,at,491c <_data-0x7fffb6e4>
 4c0:	02000017 	0x2000017
 4c4:	0b0b000f 	j	c2c003c <_data-0x73d3ffc4>
 4c8:	24030000 	li	v1,0
 4cc:	3e0b0b00 	0x3e0b0b00
 4d0:	000e030b 	0xe030b
 4d4:	00160400 	sll	zero,s6,0x10
 4d8:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 4dc:	13490b3b 	beq	k0,t1,31cc <_data-0x7fffce34>
 4e0:	2e050000 	sltiu	a1,s0,0
 4e4:	03193f01 	0x3193f01
 4e8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 4ec:	11192705 	beq	t0,t9,a104 <_data-0x7fff5efc>
 4f0:	40061201 	0x40061201
 4f4:	19429718 	0x19429718
 4f8:	00001301 	0x1301
 4fc:	03000506 	0x3000506
 500:	3b0b3a08 	xori	t3,t8,0x3a08
 504:	02134905 	0x2134905
 508:	07000018 	bltz	t8,56c <_data-0x7ffffa94>
 50c:	08030005 	j	c0014 <_data-0x7ff3ffec>
 510:	053b0b3a 	0x53b0b3a
 514:	17021349 	bne	t8,v0,523c <_data-0x7fffadc4>
 518:	89080000 	lwl	t0,0(t0)
 51c:	11010182 	beq	t0,at,b28 <_data-0x7ffff4d8>
 520:	19429501 	0x19429501
 524:	00001331 	tgeu	zero,zero,0x4c
 528:	01828a09 	0x1828a09
 52c:	91180200 	lbu	t8,512(t0)
 530:	00001842 	srl	v1,zero,0x1
 534:	3f012e0a 	0x3f012e0a
 538:	3a0e0319 	xori	t6,s0,0x319
 53c:	27053b0b 	addiu	a1,t8,15115
 540:	11134919 	beq	t0,s3,129a8 <_data-0x7ffed658>
 544:	40061201 	0x40061201
 548:	19429718 	0x19429718
 54c:	00001301 	0x1301
 550:	0300340b 	0x300340b
 554:	3b0b3a08 	xori	t3,t8,0x3a08
 558:	02134905 	0x2134905
 55c:	0c000018 	jal	60 <_data-0x7fffffa0>
 560:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 564:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 568:	0f0d0000 	jal	c340000 <_data-0x73cc0000>
 56c:	490b0b00 	bc2tl	$cc2,3170 <_data-0x7fffce90>
 570:	0e000013 	jal	800004c <_data-0x77ffffb4>
 574:	00000026 	xor	zero,zero,zero
 578:	4900260f 	bc2f	9db8 <_data-0x7fff6248>
 57c:	10000013 	b	5cc <_data-0x7ffffa34>
 580:	08030034 	j	c00d0 <_data-0x7ff3ff30>
 584:	053b0b3a 	0x53b0b3a
 588:	17021349 	bne	t8,v0,52b0 <_data-0x7fffad50>
 58c:	2e110000 	sltiu	s1,s0,0
 590:	03193f01 	0x3193f01
 594:	3b0b3a0e 	xori	t3,t8,0x3a0e
 598:	4919270b 	bc2t	$cc6,a1c8 <_data-0x7fff5e38>
 59c:	12011113 	beq	s0,at,49ec <_data-0x7fffb614>
 5a0:	97184006 	lhu	t8,16390(t8)
 5a4:	13011942 	beq	t8,at,6ab0 <_data-0x7fff9550>
 5a8:	05120000 	bltzall	t0,5ac <_data-0x7ffffa54>
 5ac:	3a080300 	xori	t0,s0,0x300
 5b0:	490b3b0b 	bc2tl	$cc2,f1e0 <_data-0x7fff0e20>
 5b4:	00170213 	0x170213
 5b8:	00051300 	sll	v0,a1,0xc
 5bc:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 5c0:	13490b3b 	beq	k0,t1,32b0 <_data-0x7fffcd50>
 5c4:	00001802 	srl	v1,zero,0x0
 5c8:	03003414 	0x3003414
 5cc:	3b0b3a08 	xori	t3,t8,0x3a08
 5d0:	0213490b 	0x213490b
 5d4:	15000017 	bnez	t0,634 <_data-0x7ffff9cc>
 5d8:	193f012e 	0x193f012e
 5dc:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 5e0:	19270b3b 	0x19270b3b
 5e4:	01111349 	0x1111349
 5e8:	18400612 	blez	v0,1e34 <_data-0x7fffe1cc>
 5ec:	00194297 	0x194297
 5f0:	11010000 	beq	t0,at,5f4 <_data-0x7ffffa0c>
 5f4:	130e2501 	beq	t8,t6,99fc <_data-0x7fff6604>
 5f8:	1b0e030b 	0x1b0e030b
 5fc:	1117550e 	beq	t0,s7,15a38 <_data-0x7ffea5c8>
 600:	00171001 	0x171001
 604:	00240200 	0x240200
 608:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 60c:	00000e03 	sra	at,zero,0x18
 610:	3f012e03 	0x3f012e03
 614:	3a0e0319 	xori	t6,s0,0x319
 618:	270b3b0b 	addiu	t3,t8,15115
 61c:	11134919 	beq	t0,s3,12a84 <_data-0x7ffed57c>
 620:	40061201 	0x40061201
 624:	19429718 	0x19429718
 628:	00001301 	0x1301
 62c:	03000504 	0x3000504
 630:	3b0b3a08 	xori	t3,t8,0x3a08
 634:	0213490b 	0x213490b
 638:	05000017 	bltz	t0,698 <_data-0x7ffff968>
 63c:	193f012e 	0x193f012e
 640:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 644:	13490b3b 	beq	k0,t1,3334 <_data-0x7fffcccc>
 648:	1301193c 	beq	t8,at,6b3c <_data-0x7fff94c4>
 64c:	18060000 	0x18060000
 650:	07000000 	bltz	t8,654 <_data-0x7ffff9ac>
 654:	01018289 	0x1018289
 658:	13310111 	beq	t9,s1,aa0 <_data-0x7ffff560>
 65c:	00001301 	0x1301
 660:	01828a08 	0x1828a08
 664:	91180200 	lbu	t8,512(t0)
 668:	00001842 	srl	v1,zero,0x1
 66c:	01828909 	0x1828909
 670:	31011101 	andi	at,t0,0x1101
 674:	0a000013 	j	800004c <_data-0x77ffffb4>
 678:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 67c:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 680:	0f0b0000 	jal	c2c0000 <_data-0x73d40000>
 684:	490b0b00 	bc2tl	$cc2,3288 <_data-0x7fffcd78>
 688:	0c000013 	jal	4c <_data-0x7fffffb4>
 68c:	13490026 	beq	k0,t1,728 <_data-0x7ffff8d8>
 690:	340d0000 	li	t5,0x0
 694:	3a080300 	xori	t0,s0,0x300
 698:	490b3b0b 	bc2tl	$cc2,f2c8 <_data-0x7fff0d38>
 69c:	00170213 	0x170213
 6a0:	010b0e00 	0x10b0e00
 6a4:	00001755 	0x1755
 6a8:	11010b0f 	beq	t0,at,32e8 <_data-0x7fffcd18>
 6ac:	01061201 	0x1061201
 6b0:	10000013 	b	700 <_data-0x7ffff900>
 6b4:	193f002e 	0x193f002e
 6b8:	0e6e193c 	jal	9b864f0 <_data-0x76479b10>
 6bc:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 6c0:	00000b3b 	0xb3b
 6c4:	01110100 	0x1110100
 6c8:	0b130e25 	j	c4c3894 <_data-0x73b3c76c>
 6cc:	0e1b0e03 	jal	86c380c <_data-0x7793c7f4>
 6d0:	01111755 	0x1111755
 6d4:	00001710 	0x1710
 6d8:	0b002402 	j	c009008 <_data-0x73ff6ff8>
 6dc:	030b3e0b 	0x30b3e0b
 6e0:	0300000e 	0x300000e
 6e4:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 6e8:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 6ec:	16040000 	bne	s0,a0,6f0 <_data-0x7ffff910>
 6f0:	3a0e0300 	xori	t6,s0,0x300
 6f4:	490b3b0b 	bc2tl	$cc2,f324 <_data-0x7fff0cdc>
 6f8:	05000013 	bltz	t0,748 <_data-0x7ffff8b8>
 6fc:	193f012e 	0x193f012e
 700:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 704:	19270b3b 	0x19270b3b
 708:	01111349 	0x1111349
 70c:	18400612 	blez	v0,1f58 <_data-0x7fffe0a8>
 710:	01194297 	0x1194297
 714:	06000013 	bltz	s0,764 <_data-0x7ffff89c>
 718:	08030005 	j	c0014 <_data-0x7ff3ffec>
 71c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 720:	17021349 	bne	t8,v0,5448 <_data-0x7fffabb8>
 724:	89070000 	lwl	a3,0(t0)
 728:	11010182 	beq	t0,at,d34 <_data-0x7ffff2cc>
 72c:	00133101 	0x133101
 730:	828a0800 	lb	t2,2048(s4)
 734:	18020001 	0x18020001
 738:	00184291 	0x184291
 73c:	002e0900 	0x2e0900
 740:	193c193f 	0x193c193f
 744:	0e030e6e 	jal	80c39b8 <_data-0x77f3c648>
 748:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 74c:	01000000 	0x1000000
 750:	0e250111 	jal	8940444 <_data-0x776bfbbc>
 754:	0e030b13 	jal	80c2c4c <_data-0x77f3d3b4>
 758:	17550e1b 	bne	k0,s5,3fc8 <_data-0x7fffc038>
 75c:	17100111 	bne	t8,s0,ba4 <_data-0x7ffff45c>
 760:	0f020000 	jal	c080000 <_data-0x73f80000>
 764:	000b0b00 	sll	at,t3,0xc
 768:	00240300 	0x240300
 76c:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 770:	00000e03 	sra	at,zero,0x18
 774:	49003504 	bc2f	db88 <_data-0x7fff2478>
 778:	05000013 	bltz	t0,7c8 <_data-0x7ffff838>
 77c:	0e030016 	jal	80c0058 <_data-0x77f3ffa8>
 780:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 784:	00001349 	0x1349
 788:	0b002406 	j	c009018 <_data-0x73ff6fe8>
 78c:	030b3e0b 	0x30b3e0b
 790:	07000008 	bltz	t8,7b4 <_data-0x7ffff84c>
 794:	193f012e 	0x193f012e
 798:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 79c:	0e6e0b3b 	jal	9b82cec <_data-0x7647d314>
 7a0:	13010b20 	beq	t8,at,3424 <_data-0x7fffcbdc>
 7a4:	2f080000 	sltiu	t0,t8,0
 7a8:	49080300 	bc2f	$cc2,13ac <_data-0x7fffec54>
 7ac:	09000013 	j	400004c <_data-0x7bffffb4>
 7b0:	0e030005 	jal	80c0014 <_data-0x77f3ffec>
 7b4:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 7b8:	00001349 	0x1349
 7bc:	0300340a 	0x300340a
 7c0:	3b0b3a08 	xori	t3,t8,0x3a08
 7c4:	0013490b 	0x13490b
 7c8:	000f0b00 	sll	at,t7,0xc
 7cc:	13490b0b 	beq	k0,t1,33fc <_data-0x7fffcc04>
 7d0:	2e0c0000 	sltiu	t4,s0,0
 7d4:	03193f01 	0x3193f01
 7d8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 7dc:	490e6e0b 	bc2fl	$cc3,1c00c <_data-0x7ffe3ff4>
 7e0:	010b2013 	0x10b2013
 7e4:	0d000013 	jal	400004c <_data-0x7bffffb4>
 7e8:	193f012e 	0x193f012e
 7ec:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 7f0:	13490b3b 	beq	k0,t1,34e0 <_data-0x7fffcb20>
 7f4:	06120111 	bltzall	s0,c3c <_data-0x7ffff3c4>
 7f8:	42971840 	c0	0x971840
 7fc:	00130119 	0x130119
 800:	011d0e00 	0x11d0e00
 804:	01111331 	tgeu	t0,s1,0x4c
 808:	0b580612 	j	d601848 <_data-0x729fe7b8>
 80c:	00000b59 	0xb59
 810:	3100050f 	andi	zero,t0,0x50f
 814:	00170213 	0x170213
 818:	010b1000 	0x10b1000
 81c:	06120111 	bltzall	s0,c64 <_data-0x7ffff39c>
 820:	34110000 	li	s1,0x0
 824:	1c133100 	0x1c133100
 828:	1200000d 	beqz	s0,860 <_data-0x7ffff7a0>
 82c:	193f012e 	0x193f012e
 830:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 834:	01110b3b 	0x1110b3b
 838:	18400612 	blez	v0,2084 <_data-0x7fffdf7c>
 83c:	01194297 	0x1194297
 840:	13000013 	beqz	t8,890 <_data-0x7ffff770>
 844:	0e030005 	jal	80c0014 <_data-0x77f3ffec>
 848:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 84c:	18021349 	0x18021349
 850:	34140000 	li	s4,0x0
 854:	3a0e0300 	xori	t6,s0,0x300
 858:	490b3b0b 	bc2tl	$cc2,f488 <_data-0x7fff0b78>
 85c:	00170213 	0x170213
 860:	82891500 	lb	t1,5376(s4)
 864:	01110001 	movt	zero,t0,$fcc4
 868:	00001331 	tgeu	zero,zero,0x4c
 86c:	31011d16 	andi	at,t0,0x1d16
 870:	12011113 	beq	s0,at,4cc0 <_data-0x7fffb340>
 874:	590b5806 	0x590b5806
 878:	0013010b 	0x13010b
 87c:	00051700 	sll	v0,a1,0x1c
 880:	00001331 	tgeu	zero,zero,0x4c
 884:	31011d18 	andi	at,t0,0x1d18
 888:	55015213 	bnel	t0,at,150d8 <_data-0x7ffeaf28>
 88c:	590b5817 	0x590b5817
 890:	0013010b 	0x13010b
 894:	011d1900 	0x11d1900
 898:	01521331 	tgeu	t2,s2,0x4c
 89c:	0b581755 	j	d605d54 <_data-0x729fa2ac>
 8a0:	00000b59 	0xb59
 8a4:	55010b1a 	bnel	t0,at,3510 <_data-0x7fffcaf0>
 8a8:	1b000017 	blez	t8,908 <_data-0x7ffff6f8>
 8ac:	13310034 	beq	t9,s1,980 <_data-0x7ffff680>
 8b0:	00001802 	srl	v1,zero,0x0
 8b4:	3f012e1c 	0x3f012e1c
 8b8:	3a0e0319 	xori	t6,s0,0x319
 8bc:	200b3b0b 	addi	t3,zero,15115
 8c0:	0013010b 	0x13010b
 8c4:	012e1d00 	0x12e1d00
 8c8:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 8cc:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 8d0:	0b201349 	j	c804d24 <_data-0x737fb2dc>
 8d4:	00001301 	0x1301
 8d8:	31012e1e 	andi	at,t0,0x2e1e
 8dc:	12011113 	beq	s0,at,4d2c <_data-0x7fffb2d4>
 8e0:	97184006 	lhu	t8,16390(t8)
 8e4:	13011942 	beq	t8,at,6df0 <_data-0x7fff9210>
 8e8:	051f0000 	0x51f0000
 8ec:	02133100 	0x2133100
 8f0:	20000018 	addi	zero,zero,24
 8f4:	1331012e 	beq	t9,s1,db0 <_data-0x7ffff250>
 8f8:	06120111 	bltzall	s0,d40 <_data-0x7ffff2c0>
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
  10:	88000250 	lwl	zero,592(zero)
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
  30:	88000000 	lwl	zero,0(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	00000250 	0x250
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
  50:	88000290 	lwl	zero,656(zero)
  54:	000000c8 	0xc8
  58:	00000000 	nop
  5c:	0000000c 	syscall
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00000000 	nop
  64:	0000000c 	syscall
  68:	88000358 	lwl	zero,856(zero)
  6c:	00000098 	0x98
  70:	880003f0 	lwl	zero,1008(zero)
  74:	00000068 	0x68
  78:	88000458 	lwl	zero,1112(zero)
  7c:	000000b4 	teq	zero,zero,0x2
	...
  88:	0000001c 	0x1c
  8c:	06800002 	bltz	s4,98 <_data-0x7fffff68>
  90:	00040000 	sll	zero,a0,0x0
  94:	00000000 	nop
  98:	8800050c 	lwl	zero,1292(zero)
  9c:	00000224 	0x224
	...
  a8:	0000001c 	0x1c
  ac:	08460002 	j	1180008 <_data-0x7ee7fff8>
  b0:	00040000 	sll	zero,a0,0x0
  b4:	00000000 	nop
  b8:	88000730 	lwl	zero,1840(zero)
  bc:	000000d8 	0xd8
	...
  c8:	0000007c 	0x7c
  cc:	09940002 	j	6500008 <_data-0x79affff8>
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
 118:	88000808 	lwl	zero,2056(zero)
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
 14c:	0dae0002 	jal	6b80008 <_data-0x7947fff8>
 150:	00040000 	sll	zero,a0,0x0
 154:	00000000 	nop
 158:	8800082c 	lwl	zero,2092(zero)
 15c:	00000060 	0x60
 160:	8800088c 	lwl	zero,2188(zero)
 164:	00000030 	tge	zero,zero
	...
 170:	0000001c 	0x1c
 174:	0efe0002 	jal	bf80008 <_data-0x7407fff8>
 178:	00040000 	sll	zero,a0,0x0
 17c:	00000000 	nop
 180:	880008bc 	lwl	zero,2236(zero)
 184:	0000002c 	0x2c
	...
 190:	0000008c 	syscall	0x2
 194:	0fb40002 	jal	ed00008 <_data-0x712ffff8>
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
 1e0:	880008e8 	lwl	zero,2280(zero)
 1e4:	00000038 	0x38
 1e8:	00000000 	nop
 1ec:	00000020 	add	zero,zero,zero
 1f0:	88000920 	lwl	zero,2336(zero)
 1f4:	00000020 	add	zero,zero,zero
 1f8:	00000000 	nop
 1fc:	00000048 	0x48
 200:	88000940 	lwl	zero,2368(zero)
 204:	00000014 	0x14
 208:	88000954 	lwl	zero,2388(zero)
 20c:	00000014 	0x14
 210:	00000000 	nop
 214:	00000014 	0x14
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	88000250 	lwl	zero,592(zero)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	88000290 	lwl	zero,656(zero)
	...
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	88000360 	lwl	zero,864(zero)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	88000364 	lwl	zero,868(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	88000380 	lwl	zero,896(zero)
  1c:	880003a8 	lwl	zero,936(zero)
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  28:	880003f8 	lwl	zero,1016(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	880003fc 	lwl	zero,1020(zero)
  30:	8800040c 	lwl	zero,1036(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	88000444 	lwl	zero,1092(zero)
	...
  40:	880003f8 	lwl	zero,1016(zero)
  44:	880003fc 	lwl	zero,1020(zero)
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	8800040c 	lwl	zero,1036(zero)
  4c:	88000410 	lwl	zero,1040(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	88000414 	lwl	zero,1044(zero)
  54:	8800043c 	lwl	zero,1084(zero)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	88000290 	lwl	zero,656(zero)
  64:	88000358 	lwl	zero,856(zero)
  68:	00000001 	movf	zero,zero,$fcc0
  6c:	00000001 	movf	zero,zero,$fcc0
  70:	00000001 	movf	zero,zero,$fcc0
  74:	00000001 	movf	zero,zero,$fcc0
  78:	88000358 	lwl	zero,856(zero)
  7c:	880003f0 	lwl	zero,1008(zero)
  80:	880003f0 	lwl	zero,1008(zero)
  84:	88000458 	lwl	zero,1112(zero)
  88:	88000458 	lwl	zero,1112(zero)
  8c:	8800050c 	lwl	zero,1292(zero)
	...
  98:	88000544 	lwl	zero,1348(zero)
  9c:	88000548 	lwl	zero,1352(zero)
  a0:	880005cc 	lwl	zero,1484(zero)
  a4:	880005dc 	lwl	zero,1500(zero)
  a8:	88000718 	lwl	zero,1816(zero)
  ac:	88000728 	lwl	zero,1832(zero)
	...
  b8:	880005c8 	lwl	zero,1480(zero)
  bc:	880005cc 	lwl	zero,1484(zero)
  c0:	880005f4 	lwl	zero,1524(zero)
  c4:	880005fc 	lwl	zero,1532(zero)
  c8:	88000650 	lwl	zero,1616(zero)
  cc:	88000660 	lwl	zero,1632(zero)
  d0:	8800066c 	lwl	zero,1644(zero)
  d4:	8800067c 	lwl	zero,1660(zero)
  d8:	88000684 	lwl	zero,1668(zero)
  dc:	880006c0 	lwl	zero,1728(zero)
  e0:	880006c8 	lwl	zero,1736(zero)
  e4:	880006cc 	lwl	zero,1740(zero)
  e8:	880006d4 	lwl	zero,1748(zero)
  ec:	880006dc 	lwl	zero,1756(zero)
  f0:	880006e4 	lwl	zero,1764(zero)
  f4:	880006e8 	lwl	zero,1768(zero)
  f8:	880006ec 	lwl	zero,1772(zero)
  fc:	88000710 	lwl	zero,1808(zero)
	...
 108:	8800050c 	lwl	zero,1292(zero)
 10c:	88000730 	lwl	zero,1840(zero)
	...
 118:	88000730 	lwl	zero,1840(zero)
 11c:	88000808 	lwl	zero,2056(zero)
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
 168:	88000808 	lwl	zero,2056(zero)
 16c:	8800082c 	lwl	zero,2092(zero)
 170:	00000001 	movf	zero,zero,$fcc0
 174:	00000001 	movf	zero,zero,$fcc0
 178:	00000001 	movf	zero,zero,$fcc0
 17c:	00000001 	movf	zero,zero,$fcc0
 180:	00000001 	movf	zero,zero,$fcc0
 184:	00000001 	movf	zero,zero,$fcc0
 188:	00000001 	movf	zero,zero,$fcc0
 18c:	00000001 	movf	zero,zero,$fcc0
	...
 198:	88000844 	lwl	zero,2116(zero)
 19c:	88000848 	lwl	zero,2120(zero)
 1a0:	8800086c 	lwl	zero,2156(zero)
 1a4:	88000884 	lwl	zero,2180(zero)
	...
 1b0:	8800082c 	lwl	zero,2092(zero)
 1b4:	8800088c 	lwl	zero,2188(zero)
 1b8:	8800088c 	lwl	zero,2188(zero)
 1bc:	880008bc 	lwl	zero,2236(zero)
	...
 1c8:	880008bc 	lwl	zero,2236(zero)
 1cc:	880008e8 	lwl	zero,2280(zero)
	...
 1d8:	88000904 	lwl	zero,2308(zero)
 1dc:	88000908 	lwl	zero,2312(zero)
 1e0:	8800090c 	lwl	zero,2316(zero)
 1e4:	88000910 	lwl	zero,2320(zero)
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
 230:	880008e8 	lwl	zero,2280(zero)
 234:	88000920 	lwl	zero,2336(zero)
 238:	00000001 	movf	zero,zero,$fcc0
 23c:	00000001 	movf	zero,zero,$fcc0
 240:	88000920 	lwl	zero,2336(zero)
 244:	88000940 	lwl	zero,2368(zero)
 248:	00000001 	movf	zero,zero,$fcc0
 24c:	00000001 	movf	zero,zero,$fcc0
 250:	88000940 	lwl	zero,2368(zero)
 254:	88000954 	lwl	zero,2388(zero)
 258:	88000954 	lwl	zero,2388(zero)
 25c:	88000968 	lwl	zero,2408(zero)
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
  1c:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	00006564 	0x6564
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	74736574 	jalx	1cd95d0 <_data-0x7e326a30>
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
  50:	88000250 	lwl	zero,592(zero)
  54:	820b0316 	lb	t3,790(s0)
  58:	874a7503 	lh	t2,29955(k0)
  5c:	4a7a0350 	c2	0x7a0350
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	79034bf7 	0x79034bf7
  64:	00080282 	srl	zero,t0,0xa
  68:	008e0101 	0x8e0101
  6c:	00020000 	sll	zero,v0,0x0
  70:	00000028 	0x28
  74:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
  78:	0101000d 	break	0x101
  7c:	00000101 	0x101
  80:	00000100 	sll	zero,zero,0x4
  84:	69747501 	0x69747501
  88:	7974696c 	0x7974696c
  8c:	74730000 	jalx	1cc0000 <_data-0x7e340000>
  90:	75747261 	jalx	5d1c984 <_data-0x7a2e367c>
  94:	00532e70 	tge	v0,s3,0xb9
  98:	00000001 	movf	zero,zero,$fcc0
  9c:	00020500 	sll	zero,v0,0x14
  a0:	19880000 	0x19880000
  a4:	4b4f4b83 	c2	0x14f4b83
  a8:	834d4b4e 	lb	t5,19278(k0)
  ac:	4b4d4b85 	c2	0x14d4b85
  b0:	4b834c4d 	c2	0x1834c4d
  b4:	4b4b4d83 	c2	0x14b4d83
  b8:	834d4b4b 	lb	t5,19275(k0)
  bc:	034b4b4b 	0x34b4b4b
  c0:	01fc0212 	0x1fc0212
  c4:	834b4c01 	lb	t3,19457(k0)
  c8:	4b4b4b4d 	c2	0x14b4b4d
  cc:	4b4b4b4b 	c2	0x14b4b4b
  d0:	4b4b4b4b 	c2	0x14b4b4b
  d4:	4b4b4b4b 	c2	0x14b4b4b
  d8:	4b4b4b4b 	c2	0x14b4b4b
  dc:	4b4b4b4b 	c2	0x14b4b4b
  e0:	4b4b4b4b 	c2	0x14b4b4b
  e4:	4c4b4b4b 	0x4c4b4b4b
  e8:	4b4b4b4b 	c2	0x14b4b4b
  ec:	4b4b4b4b 	c2	0x14b4b4b
  f0:	4c4b4c4b 	0x4c4b4c4b
  f4:	024b4b4b 	0x24b4b4b
  f8:	01010004 	sllv	zero,at,t0
  fc:	00000159 	0x159
 100:	00870002 	0x870002
 104:	01010000 	0x1010000
 108:	000d0efb 	0xd0efb
 10c:	01010101 	0x1010101
 110:	01000000 	0x1000000
 114:	75010000 	jalx	4040000 <_data-0x7bfc0000>
 118:	696c6974 	0x696c6974
 11c:	69007974 	0x69007974
 120:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 124:	00006564 	0x6564
 128:	6e69616d 	0x6e69616d
 12c:	0100632e 	0x100632e
 130:	6f630000 	0x6f630000
 134:	6e6f6d6d 	0x6e6f6d6d
 138:	0200682e 	0x200682e
 13c:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 140:	746e6964 	jalx	1b9a590 <_data-0x7e465a70>
 144:	0200682e 	0x200682e
 148:	616d0000 	0x616d0000
 14c:	6e696863 	0x6e696863
 150:	00682e65 	0x682e65
 154:	65000002 	0x65000002
 158:	70656378 	0x70656378
 15c:	6e6f6974 	0x6e6f6974
 160:	0200682e 	0x200682e
 164:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 168:	2e6f6964 	sltiu	t7,s3,26980
 16c:	00020068 	0x20068
 170:	72747300 	0x72747300
 174:	2e676e69 	sltiu	a3,s3,28265
 178:	00020068 	0x20068
 17c:	6f6f6200 	0x6f6f6200
 180:	72747374 	0x72747374
 184:	682e7061 	0x682e7061
 188:	00000200 	sll	zero,zero,0x8
 18c:	02050000 	0x2050000
 190:	88000290 	lwl	zero,656(zero)
 194:	bc010a03 	cache	0x1,2563(zero)
 198:	45c18484 	0x45c18484
 19c:	454f454f 	0x454f454f
 1a0:	83864787 	lb	a2,18311(gp)
 1a4:	8385f5f3 	lb	a1,-2573(gp)
 1a8:	b7b8c183 	0xb7b8c183
 1ac:	000802bf 	0x802bf
 1b0:	05000101 	bltz	t0,5b8 <_data-0x7ffffa48>
 1b4:	00000002 	srl	zero,zero,0x0
 1b8:	012b0300 	0x12b0300
 1bc:	08024f14 	j	93c50 <_data-0x7ff6c3b0>
 1c0:	00010100 	sll	zero,at,0x4
 1c4:	00000205 	0x205
 1c8:	34030000 	li	v1,0x0
 1cc:	024f1401 	0x24f1401
 1d0:	01010008 	0x1010008
 1d4:	58020500 	0x58020500
 1d8:	03880003 	0x3880003
 1dc:	4884013d 	0x4884013d
 1e0:	4b833c08 	c2	0x1833c08
 1e4:	04020049 	bltzl	zero,30c <_data-0x7ffffcf4>
 1e8:	02004b03 	0x2004b03
 1ec:	3b080304 	xori	t0,t8,0x304
 1f0:	13280285 	beq	t9,t0,c08 <_data-0x7ffff3f8>
 1f4:	01002002 	0x1002002
 1f8:	02050001 	movt	zero,s0,$fcc1
 1fc:	880003f0 	lwl	zero,1008(zero)
 200:	0100c403 	0x100c403
 204:	03820c03 	0x3820c03
 208:	03ba4a74 	teq	sp,k0,0x129
 20c:	75034a0c 	jalx	40d2830 <_data-0x7bf2d7d0>
 210:	0402004a 	bltzl	zero,33c <_data-0x7ffffcc4>
 214:	02004c03 	0x2004c03
 218:	09030304 	j	40c0c10 <_data-0x7bf3f3f0>
 21c:	02003c08 	0x2003c08
 220:	75030304 	jalx	40c0c10 <_data-0x7bf3f3f0>
 224:	0d033c08 	jal	40cf020 <_data-0x7bf30fe0>
 228:	00140282 	srl	zero,s4,0xa
 22c:	05000101 	bltz	t0,634 <_data-0x7ffff9cc>
 230:	00045802 	srl	t3,a0,0x0
 234:	00d40388 	0xd40388
 238:	4b49bb01 	c2	0x149bb01
 23c:	83834b49 	lb	v1,19273(gp)
 240:	8483c1bb 	lh	v1,-15941(a0)
 244:	f25503b9 	0xf25503b9
 248:	844a2403 	lh	t2,9219(v0)
 24c:	74085103 	jalx	21440c <_data-0x7fdebbf4>
 250:	bb4a2f03 	swr	t2,12035(k0)
 254:	01001002 	0x1001002
 258:	0000aa01 	0xaa01
 25c:	1f000200 	bgtz	t8,a60 <_data-0x7ffff5a0>
 260:	01000000 	0x1000000
 264:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 268:	01010100 	0x1010100
 26c:	00000001 	movf	zero,zero,$fcc0
 270:	01000001 	movf	zero,t0,$fcc0
 274:	69727000 	0x69727000
 278:	2e66746e 	sltiu	a2,s3,29806
 27c:	00000063 	0x63
 280:	05000000 	bltz	t0,284 <_data-0x7ffffd7c>
 284:	00050c02 	srl	at,a1,0x10
 288:	03881388 	0x3881388
 28c:	3c084a7a 	lui	t0,0x4a7a
 290:	c5034cf8 	lwc1	$f3,19704(t0)
 294:	02004a00 	0x2004a00
 298:	bb030104 	swr	v1,260(t8)
 29c:	cb034a7f 	lwc2	$3,19071(t8)
 2a0:	b803f200 	swr	v1,-3584(zero)
 2a4:	0124027f 	0x124027f
 2a8:	02380386 	0x2380386
 2ac:	03520144 	0x3520144
 2b0:	7c08f240 	0x7c08f240
 2b4:	82770383 	lb	s7,899(s3)
 2b8:	28021c03 	slti	v0,zero,7171
 2bc:	82640301 	lb	a0,769(s3)
 2c0:	4b88af08 	c2	0x188af08
 2c4:	02040200 	0x2040200
 2c8:	034a6f03 	0x34a6f03
 2cc:	1403ba14 	bne	zero,v1,fffeeb20 <_text_end+0x77fedcc8>
 2d0:	82680382 	lb	t0,898(s3)
 2d4:	03820903 	0x3820903
 2d8:	03bd8215 	0x3bd8215
 2dc:	4cf3826d 	0x4cf3826d
 2e0:	03bfc089 	0x3bfc089
 2e4:	2603825e 	addiu	v1,s0,-32162
 2e8:	04020082 	bltzl	zero,4f4 <_data-0x7ffffb0c>
 2ec:	4a4e0301 	c2	0x4e0301
 2f0:	01040200 	0x1040200
 2f4:	004a3403 	0x4a3403
 2f8:	08030402 	j	c1008 <_data-0x7ff3eff8>
 2fc:	f20b03ad 	0xf20b03ad
 300:	08028383 	j	a0e0c <_data-0x7ff5f1f4>
 304:	76010100 	jalx	8040400 <_data-0x77fbfc00>
 308:	02000000 	0x2000000
 30c:	00002200 	sll	a0,zero,0x8
 310:	fb010100 	sdc2	$1,256(t8)
 314:	01000d0e 	0x1000d0e
 318:	00010101 	0x10101
 31c:	00010000 	sll	zero,at,0x0
 320:	70000100 	0x70000100
 324:	746e6972 	jalx	1b9a5c8 <_data-0x7e465a38>
 328:	65736162 	0x65736162
 32c:	0000632e 	0x632e
 330:	00000000 	nop
 334:	07300205 	bltzal	t9,b4c <_data-0x7ffff4b4>
 338:	08138800 	j	4e2000 <_data-0x7fb1e000>
 33c:	02004fac 	0x2004fac
 340:	82060104 	lb	a2,260(s0)
 344:	004b8406 	0x4b8406
 348:	03010402 	0x3010402
 34c:	0200ba78 	0x200ba78
 350:	0c030104 	jal	c0410 <_data-0x7ff3fbf0>
 354:	02008a4a 	0x2008a4a
 358:	ba060204 	swr	a2,516(s0)
 35c:	70038806 	0x70038806
 360:	00012402 	srl	a0,at,0x10
 364:	08030402 	j	c1008 <_data-0x7ff3eff8>
 368:	02008ab0 	tge	s0,zero,0x22a
 36c:	82060104 	lb	a2,260(s0)
 370:	01040200 	0x1040200
 374:	02008306 	0x2008306
 378:	f2060404 	0xf2060404
 37c:	01001002 	0x1001002
 380:	00017901 	0x17901
 384:	36000200 	ori	zero,s0,0x200
 388:	01000000 	0x1000000
 38c:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 390:	01010100 	0x1010100
 394:	00000001 	movf	zero,zero,$fcc0
 398:	01000001 	movf	zero,t0,$fcc0
 39c:	692f2e2e 	0x692f2e2e
 3a0:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 3a4:	00006564 	0x6564
 3a8:	69727473 	0x69727473
 3ac:	632e676e 	0x632e676e
 3b0:	00000000 	nop
 3b4:	6d6d6f63 	0x6d6d6f63
 3b8:	682e6e6f 	0x682e6e6f
 3bc:	00000100 	sll	zero,zero,0x4
 3c0:	02050000 	0x2050000
 3c4:	00000000 	nop
 3c8:	14010b03 	bne	zero,at,2fd8 <_data-0x7fffd028>
 3cc:	08027808 	j	9e020 <_data-0x7ff61fe0>
 3d0:	00010100 	sll	zero,at,0x4
 3d4:	00000205 	0x205
 3d8:	21030000 	addi	v1,t0,0
 3dc:	004b1301 	0x4b1301
 3e0:	06010402 	bgez	s0,13ec <_data-0x7fffec14>
 3e4:	7fbe0682 	0x7fbe0682
 3e8:	01000802 	0x1000802
 3ec:	02050001 	movt	zero,s0,$fcc1
 3f0:	00000000 	nop
 3f4:	01013603 	0x1013603
 3f8:	0402004e 	bltzl	zero,534 <_data-0x7ffffacc>
 3fc:	40084b01 	0x40084b01
 400:	01000802 	0x1000802
 404:	02050001 	movt	zero,s0,$fcc1
 408:	00000000 	nop
 40c:	0100cc03 	0x100cc03
 410:	894b8301 	lwl	t3,-31999(t2)
 414:	bb827a03 	swr	v0,31235(gp)
 418:	0008024c 	syscall	0x2009
 41c:	05000101 	bltz	t0,824 <_data-0x7ffff7dc>
 420:	00000002 	srl	zero,zero,0x0
 424:	00e70300 	0xe70300
 428:	02001601 	0x2001601
 42c:	ba060104 	swr	a2,260(s0)
 430:	7e84bd06 	0x7e84bd06
 434:	01000802 	0x1000802
 438:	02050001 	movt	zero,s0,$fcc1
 43c:	00000000 	nop
 440:	0100fe03 	0x100fe03
 444:	0402004b 	bltzl	zero,574 <_data-0x7ffffa8c>
 448:	00820601 	0x820601
 44c:	ba020402 	swr	v0,1026(s0)
 450:	7f83bd06 	0x7f83bd06
 454:	00080284 	0x80284
 458:	05000101 	bltz	t0,860 <_data-0x7ffff7a0>
 45c:	00000002 	srl	zero,zero,0x0
 460:	018e0300 	0x18e0300
 464:	4bf81301 	c2	0x1f81301
 468:	85827a03 	lh	v0,31235(t4)
 46c:	01000802 	0x1000802
 470:	02050001 	movt	zero,s0,$fcc1
 474:	00000000 	nop
 478:	0101a203 	0x101a203
 47c:	7a03f913 	0x7a03f913
 480:	08028582 	j	a1608 <_data-0x7ff5e9f8>
 484:	00010100 	sll	zero,at,0x4
 488:	08080205 	j	200814 <_data-0x7fdff7ec>
 48c:	90038800 	lbu	v1,-30720(zero)
 490:	86010102 	lh	at,258(s0)
 494:	027e874b 	0x27e874b
 498:	01010008 	0x1010008
 49c:	00020500 	sll	zero,v0,0x14
 4a0:	03000000 	0x3000000
 4a4:	010102ab 	0x10102ab
 4a8:	7e874b87 	0x7e874b87
 4ac:	01001002 	0x1001002
 4b0:	02050001 	movt	zero,s0,$fcc1
 4b4:	00000000 	nop
 4b8:	0102c203 	0x102c203
 4bc:	4a7a0318 	c2	0x7a0318
 4c0:	884e8450 	lwl	t6,-31664(v0)
 4c4:	01040200 	0x1040200
 4c8:	f3827403 	0xf3827403
 4cc:	f63d0883 	sdc1	$f29,2179(s1)
 4d0:	01001002 	0x1001002
 4d4:	02050001 	movt	zero,s0,$fcc1
 4d8:	00000000 	nop
 4dc:	0102e503 	0x102e503
 4e0:	7a03894d 	0x7a03894d
 4e4:	f43d0882 	sdc1	$f29,2178(at)
 4e8:	01000802 	0x1000802
 4ec:	02050001 	movt	zero,s0,$fcc1
 4f0:	00000000 	nop
 4f4:	0102f103 	0x102f103
 4f8:	000c0213 	0xc0213
 4fc:	004f0101 	0x4f0101
 500:	00020000 	sll	zero,v0,0x0
 504:	0000001d 	0x1d
 508:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 50c:	0101000d 	break	0x101
 510:	00000101 	0x101
 514:	00000100 	sll	zero,zero,0x4
 518:	75700001 	jalx	5c00004 <_data-0x7a3ffffc>
 51c:	632e7374 	0x632e7374
 520:	00000000 	nop
 524:	02050000 	0x2050000
 528:	8800082c 	lwl	zero,2092(zero)
 52c:	4e3c0813 	c3	0x3c0813
 530:	7a03c248 	0x7a03c248
 534:	83837408 	lb	v1,29704(gp)
 538:	00080283 	sra	zero,t0,0xa
 53c:	05000101 	bltz	t0,944 <_data-0x7ffff6bc>
 540:	00088c02 	srl	s1,t0,0x10
 544:	010e0388 	0x10e0388
 548:	84838383 	lh	v1,-31869(a0)
 54c:	01001002 	0x1001002
 550:	00005901 	0x5901
 554:	44000200 	0x44000200
 558:	01000000 	0x1000000
 55c:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 560:	01010100 	0x1010100
 564:	00000001 	movf	zero,zero,$fcc0
 568:	01000001 	movf	zero,t0,$fcc0
 56c:	692f2e2e 	0x692f2e2e
 570:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 574:	00006564 	0x6564
 578:	63747570 	0x63747570
 57c:	2e726168 	sltiu	s2,s3,24936
 580:	00000063 	0x63
 584:	64747300 	0x64747300
 588:	2e746e69 	sltiu	s4,s3,28265
 58c:	00010068 	0x10068
 590:	63616d00 	0x63616d00
 594:	656e6968 	0x656e6968
 598:	0100682e 	0x100682e
 59c:	00000000 	nop
 5a0:	08bc0205 	j	2f00814 <_data-0x7d0ff7ec>
 5a4:	f3158800 	0xf3158800
 5a8:	00140284 	0x140284
 5ac:	01a90101 	0x1a90101
 5b0:	00020000 	sll	zero,v0,0x0
 5b4:	00000052 	mflhxu	zero
 5b8:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 5bc:	0101000d 	break	0x101
 5c0:	00000101 	0x101
 5c4:	00000100 	sll	zero,zero,0x4
 5c8:	2f2e2e01 	sltiu	t6,t9,11777
 5cc:	6c636e69 	0x6c636e69
 5d0:	00656475 	0x656475
 5d4:	63616d00 	0x63616d00
 5d8:	656e6968 	0x656e6968
 5dc:	7070632e 	0x7070632e
 5e0:	00000000 	nop
 5e4:	6d6d6f63 	0x6d6d6f63
 5e8:	682e6e6f 	0x682e6e6f
 5ec:	00000100 	sll	zero,zero,0x4
 5f0:	69647473 	0x69647473
 5f4:	682e746e 	0x682e746e
 5f8:	00000100 	sll	zero,zero,0x4
 5fc:	6863616d 	0x6863616d
 600:	2e656e69 	sltiu	a1,s3,28265
 604:	00010068 	0x10068
 608:	05000000 	bltz	t0,60c <_data-0x7ffff9f4>
 60c:	00000002 	srl	zero,zero,0x0
 610:	011b0300 	0x11b0300
 614:	03016a03 	0x3016a03
 618:	08024a16 	j	92858 <_data-0x7ff6d7a8>
 61c:	00010100 	sll	zero,at,0x4
 620:	00000205 	0x205
 624:	1b030000 	0x1b030000
 628:	016a0301 	0x16a0301
 62c:	024a1603 	0x24a1603
 630:	01010008 	0x1010008
 634:	00020500 	sll	zero,v0,0x14
 638:	03000000 	0x3000000
 63c:	6a03011b 	0x6a03011b
 640:	4a160301 	c2	0x160301
 644:	01000802 	0x1000802
 648:	02050001 	movt	zero,s0,$fcc1
 64c:	00000000 	nop
 650:	03011b03 	0x3011b03
 654:	1603016a 	bne	s0,v1,c00 <_data-0x7ffff400>
 658:	0008024a 	0x8024a
 65c:	05000101 	bltz	t0,a64 <_data-0x7ffff59c>
 660:	00000002 	srl	zero,zero,0x0
 664:	011c0300 	0x11c0300
 668:	03016f03 	0x3016f03
 66c:	08024a11 	j	92844 <_data-0x7ff6d7bc>
 670:	00010100 	sll	zero,at,0x4
 674:	00000205 	0x205
 678:	1c030000 	0x1c030000
 67c:	016f0301 	0x16f0301
 680:	024a1103 	0x24a1103
 684:	01010008 	0x1010008
 688:	00020500 	sll	zero,v0,0x14
 68c:	03000000 	0x3000000
 690:	6f03011c 	0x6f03011c
 694:	4a110301 	c2	0x110301
 698:	01000802 	0x1000802
 69c:	02050001 	movt	zero,s0,$fcc1
 6a0:	00000000 	nop
 6a4:	03011c03 	0x3011c03
 6a8:	1103016f 	beq	t0,v1,c68 <_data-0x7ffff398>
 6ac:	0008024a 	0x8024a
 6b0:	05000101 	bltz	t0,ab8 <_data-0x7ffff548>
 6b4:	0008e802 	srl	sp,t0,0x0
 6b8:	011e0388 	0x11e0388
 6bc:	03016d03 	0x3016d03
 6c0:	01300221 	0x1300221
 6c4:	01000802 	0x1000802
 6c8:	02050001 	movt	zero,s0,$fcc1
 6cc:	00000000 	nop
 6d0:	03012e03 	0x3012e03
 6d4:	2a030157 	slti	v1,s0,343
 6d8:	ba560382 	swr	s6,898(s2)
 6dc:	024a2c03 	0x24a2c03
 6e0:	01010008 	0x1010008
 6e4:	20020500 	addi	v0,zero,1280
 6e8:	03880009 	0x3880009
 6ec:	52030133 	beql	s0,v1,bbc <_data-0x7ffff444>
 6f0:	822f0301 	lb	t7,769(s1)
 6f4:	03ba5703 	0x3ba5703
 6f8:	08024a2b 	j	928ac <_data-0x7ff6d754>
 6fc:	00010100 	sll	zero,at,0x4
 700:	00000205 	0x205
 704:	38030000 	xori	v1,zero,0x0
 708:	83838401 	lb	v1,-31743(gp)
 70c:	844b4bb9 	lh	t3,19385(v0)
 710:	0c024c48 	jal	93120 <_data-0x7ff6cee0>
 714:	00010100 	sll	zero,at,0x4
 718:	09400205 	j	5000814 <_data-0x7afff7ec>
 71c:	c1038800 	ll	v1,-30720(t0)
 720:	4a030100 	c2	0x30100
 724:	ba380301 	swr	t8,769(s1)
 728:	01000802 	0x1000802
 72c:	02050001 	movt	zero,s0,$fcc1
 730:	88000954 	lwl	zero,2388(zero)
 734:	0100c503 	0x100c503
 738:	03014603 	0x3014603
 73c:	0802ba3c 	j	ae8f0 <_data-0x7ff51710>
 740:	00010100 	sll	zero,at,0x4
 744:	00000205 	0x205
 748:	c9030000 	lwc2	$3,0(t0)
 74c:	bc030100 	cache	0x3,256(zero)
 750:	c603017f 	lwc1	$f3,383(s0)
 754:	0802ba00 	j	ae800 <_data-0x7ff51800>
 758:	Address 0x0000000000000758 is out of bounds.


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
  14:	74636146 	jalx	18d8518 <_data-0x7e727ae8>
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
  28:	776f772f 	jalx	dbddcbc <_data-0x72422344>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	646f632f 	0x646f632f
  30:	72673931 	0x72673931
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	522f3170 	beql	s1,t7,c5f8 <_data-0x7fff3a08>
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
  4c:	50494d6c 	beql	v0,t1,13600 <_data-0x7ffeca00>
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
  74:	75007070 	jalx	401c1c0 <_data-0x7bfe3e40>
  78:	38746e69 	xori	s4,v1,0x6e69
  7c:	7500745f 	jalx	401d17c <_data-0x7bfe2e84>
  80:	6769736e 	0x6769736e
  84:	2064656e 	addi	a0,v1,25966
  88:	72616863 	0x72616863
  8c:	6e655f00 	0x6e655f00
  90:	00797274 	teq	v1,t9,0x1c9
  94:	676e6f6c 	0x676e6f6c
  98:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
  9c:	6e6f6c00 	0x6e6f6c00
  a0:	6e752067 	0x6e752067
  a4:	6e676973 	0x6e676973
  a8:	69206465 	0x69206465
  ac:	7300746e 	0x7300746e
  b0:	74726f68 	jalx	1c9bda0 <_data-0x7e364260>
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
  e8:	746f6778 	jalx	1bd9de0 <_data-0x7e426220>
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
 14c:	74732d20 	jalx	1ccb480 <_data-0x7e334b80>
 150:	2b633d64 	slti	v1,k1,15716
 154:	2031312b 	addi	s1,at,12587
 158:	7566662d 	jalx	59998b4 <_data-0x7a66674c>
 15c:	6974636e 	0x6974636e
 160:	732d6e6f 	0x732d6e6f
 164:	69746365 	0x69746365
 168:	20736e6f 	addi	s3,v1,28271
 16c:	6164662d 	0x6164662d
 170:	732d6174 	0x732d6174
 174:	69746365 	0x69746365
 178:	20736e6f 	addi	s3,v1,28271
 17c:	7266662d 	0x7266662d
 180:	74736565 	jalx	1cd9594 <_data-0x7e326a6c>
 184:	69646e61 	0x69646e61
 188:	2d20676e 	sltiu	zero,t1,26478
 18c:	2d6f6e66 	sltiu	t7,t3,28262
 190:	6c697562 	0x6c697562
 194:	206e6974 	addi	t6,v1,26996
 198:	6f6e662d 	0x6f6e662d
 19c:	4549502d 	0x4549502d
 1a0:	6f687300 	0x6f687300
 1a4:	69207472 	0x69207472
 1a8:	7500746e 	jalx	401d1b8 <_data-0x7bfe2e48>
 1ac:	696c6974 	0x696c6974
 1b0:	732f7974 	0x732f7974
 1b4:	74726174 	jalx	1c985d0 <_data-0x7e367a30>
 1b8:	532e7075 	beql	t9,t6,1c390 <_data-0x7ffe3c70>
 1bc:	6e6d2f00 	0x6e6d2f00
 1c0:	2f632f74 	sltiu	v1,k1,12148
 1c4:	72657355 	0x72657355
 1c8:	61462f73 	0x61462f73
 1cc:	726f7463 	0x726f7463
 1d0:	4e6c6169 	c3	0x6c6169
 1d4:	776f642f 	jalx	dbd90bc <_data-0x72426f44>
 1d8:	616f6c6e 	0x616f6c6e
 1dc:	542f7364 	bnel	at,t7,1cf70 <_data-0x7ffe3090>
 1e0:	69766972 	0x69766972
 1e4:	494d6c61 	0x494d6c61
 1e8:	535f5350 	beql	k0,ra,14f2c <_data-0x7ffeb0d4>
 1ec:	7774666f 	jalx	dd199bc <_data-0x722e6644>
 1f0:	2f657261 	sltiu	a1,k1,29281
 1f4:	00707063 	0x707063
 1f8:	20554e47 	addi	s5,v0,20039
 1fc:	32205341 	andi	zero,s1,0x5341
 200:	0030332e 	0x30332e
 204:	5f307063 	0x5f307063
 208:	76646162 	jalx	9918588 <_data-0x766e7a78>
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
 24c:	7465675f 	jalx	1959d7c <_data-0x7e6a6284>
 250:	7561635f 	jalx	5858d7c <_data-0x7a7a7284>
 254:	5f006573 	bgtzl	t8,19824 <_data-0x7ffe67dc>
 258:	00737362 	0x737362
 25c:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 260:	656c5f65 	0x656c5f65
 264:	79620064 	0x79620064
 268:	745f6574 	jalx	17d95d0 <_data-0x7e826a30>
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
 2a4:	74735f30 	jalx	1cd7cc0 <_data-0x7e328340>
 2a8:	73757461 	0x73757461
 2ac:	646f6300 	0x646f6300
 2b0:	6e650065 	0x6e650065
 2b4:	5f797274 	0x5f797274
 2b8:	315f6f6c 	andi	ra,t2,0x6f6c
 2bc:	78655f00 	0x78655f00
 2c0:	74706563 	jalx	1c1958c <_data-0x7e3e6a74>
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
 300:	74616f6c 	jalx	185bdb0 <_data-0x7e7a4250>
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
 36c:	7566662d 	jalx	59998b4 <_data-0x7a66674c>
 370:	6974636e 	0x6974636e
 374:	732d6e6f 	0x732d6e6f
 378:	69746365 	0x69746365
 37c:	20736e6f 	addi	s3,v1,28271
 380:	6164662d 	0x6164662d
 384:	732d6174 	0x732d6174
 388:	69746365 	0x69746365
 38c:	20736e6f 	addi	s3,v1,28271
 390:	7266662d 	0x7266662d
 394:	74736565 	jalx	1cd9594 <_data-0x7e326a6c>
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
 3dc:	7500745f 	jalx	401d17c <_data-0x7bfe2e84>
 3e0:	33746e69 	andi	s4,k1,0x6e69
 3e4:	00745f32 	tlt	v1,s4,0x17c
 3e8:	72746e65 	0x72746e65
 3ec:	69685f79 	0x69685f79
 3f0:	74757000 	jalx	1d5c000 <_data-0x7e2a4000>
 3f4:	74750073 	jalx	1d401cc <_data-0x7e2bfe34>
 3f8:	74696c69 	jalx	1a5b1a4 <_data-0x7e5a4e5c>
 3fc:	616d2f79 	0x616d2f79
 400:	632e6e69 	0x632e6e69
 404:	73657200 	0x73657200
 408:	00746c75 	0x746c75
 40c:	65737361 	0x65737361
 410:	6f697472 	0x6f697472
 414:	7274006e 	0x7274006e
 418:	72667061 	0x72667061
 41c:	5f656d61 	0x5f656d61
 420:	75700074 	jalx	5c001d0 <_data-0x7a3ffe30>
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
 450:	74636146 	jalx	18d8518 <_data-0x7e727ae8>
 454:	6169726f 	0x6169726f
 458:	642f4e6c 	0x642f4e6c
 45c:	6c6e776f 	0x6c6e776f
 460:	7364616f 	0x7364616f
 464:	6972542f 	0x6972542f
 468:	6c616976 	0x6c616976
 46c:	5350494d 	beql	k0,s0,129a4 <_data-0x7ffed65c>
 470:	666f535f 	0x666f535f
 474:	72617774 	0x72617774
 478:	70632f65 	0x70632f65
 47c:	696c2f70 	0x696c2f70
 480:	75700062 	jalx	5c00188 <_data-0x7a3ffe78>
 484:	72747374 	0x72747374
 488:	00676e69 	0x676e69
 48c:	756c6176 	jalx	5b185d8 <_data-0x7a4e7a28>
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
 4bc:	745f657a 	jalx	17d95e8 <_data-0x7e826a18>
 4c0:	6d656d00 	0x6d656d00
 4c4:	00706d63 	0x706d63
 4c8:	6e727473 	0x6e727473
 4cc:	00797063 	0x797063
 4d0:	6e727473 	0x6e727473
 4d4:	006e656c 	0x6e656c
 4d8:	63727473 	0x63727473
 4dc:	73007268 	0x73007268
 4e0:	70637274 	0x70637274
 4e4:	74730079 	jalx	1cc01e4 <_data-0x7e33fe1c>
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
 538:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 53c:	456a4965 	0x456a4965
 540:	54765076 	bnel	v1,s6,1471c <_data-0x7ffeb8e4>
 544:	6572005f 	0x6572005f
 548:	735f6461 	0x735f6461
 54c:	63746977 	0x63746977
 550:	00736568 	0x736568
 554:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 558:	6f775f65 	0x6f775f65
 55c:	64006472 	0x64006472
 560:	00617461 	0x617461
 564:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 568:	79625f65 	0x79625f65
 56c:	5f006574 	bgtzl	t8,19b40 <_data-0x7ffe64c0>
 570:	6572345a 	0x6572345a
 574:	6d496461 	0x6d496461
 578:	505f5445 	beql	v0,ra,15690 <_data-0x7ffea970>
 57c:	69750076 	0x69750076
 580:	3436746e 	ori	s6,at,0x746e
 584:	7700745f 	jalx	c01d17c <_data-0x73fe2e84>
 588:	65746972 	0x65746972
 58c:	736e753c 	0x736e753c
 590:	656e6769 	0x656e6769
 594:	68632064 	0x68632064
 598:	003e7261 	0x3e7261
 59c:	64616572 	0x64616572
 5a0:	6f77685f 	0x6f77685f
 5a4:	5f006472 	bgtzl	t8,19770 <_data-0x7ffe6890>
 5a8:	7277355a 	0x7277355a
 5ac:	49657469 	0x49657469
 5b0:	5076456d 	beql	v1,s6,11b68 <_data-0x7ffee498>
 5b4:	005f5476 	tne	v0,ra,0x151
 5b8:	72345a5f 	0x72345a5f
 5bc:	49646165 	0x49646165
 5c0:	5f544574 	0x5f544574
 5c4:	77007650 	jalx	c01d940 <_data-0x73fe26c0>
 5c8:	65746972 	0x65746972
 5cc:	6e6f6c3c 	0x6e6f6c3c
 5d0:	6e752067 	0x6e752067
 5d4:	6e676973 	0x6e676973
 5d8:	69206465 	0x69206465
 5dc:	003e746e 	0x3e746e
 5e0:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 5e4:	77645f65 	jalx	d917d94 <_data-0x726e826c>
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
 618:	745f6472 	jalx	17d91c8 <_data-0x7e826e38>
 61c:	345a5f00 	ori	k0,v0,0x5f00
 620:	64616572 	0x64616572
 624:	54456849 	bnel	v0,a1,1a74c <_data-0x7ffe58b4>
 628:	0076505f 	0x76505f
 62c:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 630:	68733c65 	0x68733c65
 634:	2074726f 	addi	s4,v1,29295
 638:	69736e75 	0x69736e75
 63c:	64656e67 	0x64656e67
 640:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
 644:	6572003e 	0x6572003e
 648:	753c6461 	jalx	4f19184 <_data-0x7b0e6e7c>
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
 674:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 678:	45684965 	0x45684965
 67c:	54765076 	bnel	v1,s6,14858 <_data-0x7ffeb7a8>
 680:	6572005f 	0x6572005f
 684:	753c6461 	jalx	4f19184 <_data-0x7b0e6e7c>
 688:	6769736e 	0x6769736e
 68c:	2064656e 	addi	a0,v1,25966
 690:	3e746e69 	0x3e746e69
 694:	355a5f00 	ori	k0,t2,0x5f00
 698:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 69c:	45744965 	0x45744965
 6a0:	54765076 	bnel	v1,s6,1487c <_data-0x7ffeb784>
 6a4:	5a5f005f 	0x5a5f005f
 6a8:	61657234 	0x61657234
 6ac:	456a4964 	0x456a4964
 6b0:	76505f54 	jalx	9417d50 <_data-0x76be82b0>
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
 6f0:	7479625f 	jalx	1e5897c <_data-0x7e1a7684>
 6f4:	72770065 	0x72770065
 6f8:	3c657469 	0x3c657469
 6fc:	69736e75 	0x69736e75
 700:	64656e67 	0x64656e67
 704:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
 708:	Address 0x0000000000000708 is out of bounds.


Disassembly of section .debug_loc:

00000000 <.debug_loc>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	88000458 	lwl	zero,1112(zero)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	88000468 	lwl	zero,1128(zero)
   8:	68540001 	0x68540001
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	b4880004 	0xb4880004
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	01880004 	sllv	zero,t0,t4
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	04b46100 	0x4b46100
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	04c88800 	tgei	a2,-30720
  1c:	00048800 	sll	s1,a0,0x0
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	9f5401f3 	0x9f5401f3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	880004c8 	lwl	zero,1224(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	8800050c 	lwl	zero,1292(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	00610001 	movt	zero,v1,$fcc0
  30:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	58000000 	blezl	zero,38 <_data-0x7fffffc8>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	7b880004 	0x7b880004
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	01880004 	sllv	zero,t0,t4
  40:	047b5500 	0x47b5500
  44:	050c8800 	teqi	t0,-30720
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	00048800 	sll	s1,a0,0x0
  4c:	9f5501f3 	0x9f5501f3
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  58:	880004d4 	lwl	zero,1236(zero)
  5c:	880004fb 	lwl	zero,1275(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00560001 	0x560001
  64:	00000000 	nop
  68:	f0000000 	0xf0000000
  6c:	14880003 	bne	a0,t0,7c <_data-0x7fffff84>
  70:	02880004 	sllv	zero,t0,s4
  74:	149f3000 	bne	a0,ra,c078 <_data-0x7fff3f88>
  78:	34880004 	ori	t0,a0,0x4
  7c:	01880004 	sllv	zero,t0,t4
  80:	00006000 	sll	t4,zero,0x0
  84:	00000000 	nop
  88:	04280000 	tgei	at,0
  8c:	043b8800 	0x43b8800
  90:	00018800 	sll	s1,at,0x0
  94:	00000056 	0x56
  98:	00000000 	nop
  9c:	00042800 	sll	a1,a0,0x0
  a0:	00043b88 	0x43b88
  a4:	57000188 	bnezl	t8,6c8 <_data-0x7ffff938>
  a8:	00000000 	nop
  ac:	00000000 	nop
  b0:	88000428 	lwl	zero,1064(zero)
  b4:	8800043b 	lwl	zero,1083(zero)
  b8:	00520001 	0x520001
  bc:	00000000 	nop
  c0:	58000000 	blezl	zero,c4 <_data-0x7fffff3c>
  c4:	8c880003 	lw	t0,3(a0)
  c8:	01880003 	0x1880003
  cc:	038c5400 	0x38c5400
  d0:	03e88800 	0x3e88800
  d4:	00018800 	sll	s1,at,0x0
  d8:	0003e860 	0x3e860
  dc:	0003f088 	0x3f088
  e0:	f3000488 	0xf3000488
  e4:	009f5401 	0x9f5401
  e8:	00000000 	nop
  ec:	58000000 	blezl	zero,f0 <_data-0x7fffff10>
  f0:	8c880003 	lw	t0,3(a0)
  f4:	02880003 	0x2880003
  f8:	8c9f3100 	lw	ra,12544(a0)
  fc:	98880003 	lwr	t0,3(a0)
 100:	01880003 	0x1880003
 104:	03986100 	0x3986100
 108:	039f8800 	0x39f8800
 10c:	00018800 	sll	s1,at,0x0
 110:	00039f55 	0x39f55
 114:	0003a088 	0x3a088
 118:	81000388 	lb	zero,904(t0)
 11c:	03a09f7f 	0x3a09f7f
 120:	03e48800 	0x3e48800
 124:	00018800 	sll	s1,at,0x0
 128:	00000061 	0x61
 12c:	00000000 	nop
 130:	0002e000 	sll	gp,v0,0x0
 134:	00033888 	0x33888
 138:	60000188 	0x60000188
 13c:	88000344 	lwl	zero,836(zero)
 140:	88000358 	lwl	zero,856(zero)
 144:	00600001 	movf	zero,v1,$fcc0
 148:	00000000 	nop
 14c:	18000000 	blez	zero,150 <_data-0x7ffffeb0>
 150:	2b880003 	slti	t0,gp,3
 154:	01880003 	0x1880003
 158:	03445200 	0x3445200
 15c:	034f8800 	0x34f8800
 160:	00018800 	sll	s1,at,0x0
 164:	00000052 	mflhxu	zero
 168:	00000000 	nop
 16c:	00050c00 	sll	at,a1,0x10
 170:	00054888 	0x54888
 174:	54000188 	bnezl	zero,798 <_data-0x7ffff868>
 178:	88000548 	lwl	zero,1352(zero)
 17c:	88000568 	lwl	zero,1384(zero)
 180:	68620001 	0x68620001
 184:	7c880005 	0x7c880005
 188:	04880005 	tgei	a0,5
 18c:	5401f300 	bnel	zero,at,ffffcd90 <_text_end+0x77ffbf38>
 190:	00057c9f 	0x57c9f
 194:	00073088 	0x73088
 198:	62000188 	0x62000188
	...
 1a4:	88000540 	lwl	zero,1344(zero)
 1a8:	88000548 	lwl	zero,1352(zero)
 1ac:	9f300002 	0x9f300002
 1b0:	88000548 	lwl	zero,1352(zero)
 1b4:	8800056c 	lwl	zero,1388(zero)
 1b8:	7c610001 	0x7c610001
 1bc:	90880005 	lbu	t0,5(a0)
 1c0:	01880006 	srlv	zero,t0,t4
 1c4:	06906100 	bltzal	s4,185c8 <_data-0x7ffe7a38>
 1c8:	06988800 	0x6988800
 1cc:	00038800 	sll	s1,v1,0x0
 1d0:	989f7f81 	lwr	ra,32641(a0)
 1d4:	e8880006 	swc2	$8,6(a0)
 1d8:	01880006 	srlv	zero,t0,t4
 1dc:	06f46100 	0x6f46100
 1e0:	07108800 	bltzal	t8,fffe21e4 <_text_end+0x77fe138c>
 1e4:	00018800 	sll	s1,at,0x0
 1e8:	00071061 	0x71061
 1ec:	00071888 	0x71888
 1f0:	74000688 	jalx	1a20 <_data-0x7fffe5e0>
 1f4:	1c008200 	bgtz	zero,fffe09f8 <_text_end+0x77fdfba0>
 1f8:	0007189f 	0x7189f
 1fc:	00073088 	0x73088
 200:	61000188 	0x61000188
	...
 20c:	8800057c 	lwl	zero,1404(zero)
 210:	88000590 	lwl	zero,1424(zero)
 214:	18640001 	0x18640001
 218:	30880007 	andi	t0,a0,0x7
 21c:	01880007 	srav	zero,t0,t4
 220:	00006400 	sll	t4,zero,0x10
 224:	00000000 	nop
 228:	05400000 	bltz	t2,22c <_data-0x7ffffdd4>
 22c:	05708800 	bltzal	t3,fffe2230 <_text_end+0x77fe13d8>
 230:	00018800 	sll	s1,at,0x0
 234:	00057c60 	0x57c60
 238:	00073088 	0x73088
 23c:	60000188 	0x60000188
	...
 248:	88000590 	lwl	zero,1424(zero)
 24c:	880005cc 	lwl	zero,1484(zero)
 250:	dc550001 	ldc3	$21,1(v0)
 254:	fb880005 	sdc2	$8,5(gp)
 258:	01880005 	0x1880005
 25c:	06045500 	0x6045500
 260:	06578800 	0x6578800
 264:	00018800 	sll	s1,at,0x0
 268:	00066c55 	0x66c55
 26c:	00067b88 	0x67b88
 270:	55000188 	bnezl	t0,894 <_data-0x7ffff76c>
 274:	88000684 	lwl	zero,1668(zero)
 278:	88000697 	lwl	zero,1687(zero)
 27c:	a0550001 	sb	s5,1(v0)
 280:	af880006 	sw	t0,6(gp)
 284:	01880006 	srlv	zero,t0,t4
 288:	06bc5500 	0x6bc5500
 28c:	06db8800 	0x6db8800
 290:	00018800 	sll	s1,at,0x0
 294:	0006e455 	0x6e455
 298:	0006ec88 	0x6ec88
 29c:	55000188 	bnezl	t0,8c0 <_data-0x7ffff740>
 2a0:	880006f4 	lwl	zero,1780(zero)
 2a4:	88000718 	lwl	zero,1816(zero)
 2a8:	00550001 	movt	zero,v0,$fcc5
 2ac:	00000000 	nop
 2b0:	30000000 	andi	zero,zero,0x0
 2b4:	64880007 	0x64880007
 2b8:	01880007 	srav	zero,t0,t4
 2bc:	07645400 	0x7645400
 2c0:	076c8800 	teqi	k1,-30720
 2c4:	00048800 	sll	s1,a0,0x0
 2c8:	9f1f0080 	0x9f1f0080
 2cc:	8800076c 	lwl	zero,1900(zero)
 2d0:	880007b4 	lwl	zero,1972(zero)
 2d4:	01f30004 	sllv	zero,s3,t7
 2d8:	07b49f54 	0x7b49f54
 2dc:	07bc8800 	0x7bc8800
 2e0:	00018800 	sll	s1,at,0x0
 2e4:	0007bc54 	0x7bc54
 2e8:	00080888 	0x80888
 2ec:	f3000488 	0xf3000488
 2f0:	009f5401 	0x9f5401
 2f4:	00000000 	nop
 2f8:	30000000 	andi	zero,zero,0x0
 2fc:	6b880007 	0x6b880007
 300:	01880007 	srav	zero,t0,t4
 304:	076b5500 	tltiu	k1,21760
 308:	07848800 	0x7848800
 30c:	00018800 	sll	s1,at,0x0
 310:	00078463 	0x78463
 314:	0007b488 	0x7b488
 318:	f3000488 	0xf3000488
 31c:	b49f5501 	0xb49f5501
 320:	bc880007 	cache	0x8,7(a0)
 324:	01880007 	srav	zero,t0,t4
 328:	07bc5500 	0x7bc5500
 32c:	07d88800 	0x7d88800
 330:	00018800 	sll	s1,at,0x0
 334:	0007d863 	0x7d863
 338:	00080888 	0x80888
 33c:	f3000488 	0xf3000488
 340:	009f5501 	0x9f5501
 344:	00000000 	nop
 348:	30000000 	andi	zero,zero,0x0
 34c:	6b880007 	0x6b880007
 350:	01880007 	srav	zero,t0,t4
 354:	076b5600 	tltiu	k1,22016
 358:	07988800 	0x7988800
 35c:	00018800 	sll	s1,at,0x0
 360:	00079864 	0x79864
 364:	0007b488 	0x7b488
 368:	f3000488 	0xf3000488
 36c:	b49f5601 	0xb49f5601
 370:	bc880007 	cache	0x8,7(a0)
 374:	01880007 	srav	zero,t0,t4
 378:	07bc5600 	0x7bc5600
 37c:	08088800 	j	222000 <_data-0x7fdde000>
 380:	00018800 	sll	s1,at,0x0
 384:	00000064 	0x64
 388:	00000000 	nop
 38c:	00073000 	sll	a2,a3,0x0
 390:	00076b88 	0x76b88
 394:	57000188 	bnezl	t8,9b8 <_data-0x7ffff648>
 398:	8800076b 	lwl	zero,1899(zero)
 39c:	880007b4 	lwl	zero,1972(zero)
 3a0:	01f30004 	sllv	zero,s3,t7
 3a4:	07b49f57 	0x7b49f57
 3a8:	07bc8800 	0x7bc8800
 3ac:	00018800 	sll	s1,at,0x0
 3b0:	0007bc57 	0x7bc57
 3b4:	00080888 	0x80888
 3b8:	f3000488 	0xf3000488
 3bc:	009f5701 	0x9f5701
 3c0:	00000000 	nop
 3c4:	74000000 	jalx	0 <_data-0x80000000>
 3c8:	a0880007 	sb	t0,7(a0)
 3cc:	01880007 	srav	zero,t0,t4
 3d0:	07bc6200 	0x7bc6200
 3d4:	07d08800 	bltzal	s8,fffe23d8 <_text_end+0x77fe1580>
 3d8:	00018800 	sll	s1,at,0x0
 3dc:	0007d862 	0x7d862
 3e0:	00080888 	0x80888
 3e4:	62000188 	0x62000188
	...
 3f0:	8800077c 	lwl	zero,1916(zero)
 3f4:	88000784 	lwl	zero,1924(zero)
 3f8:	0083000e 	0x83000e
 3fc:	16008212 	bnez	s0,fffe0c48 <_text_end+0x77fdfdf0>
 400:	01282b14 	0x1282b14
 404:	9f131600 	0x9f131600
 408:	88000784 	lwl	zero,1924(zero)
 40c:	88000788 	lwl	zero,1928(zero)
 410:	01f3000f 	0x1f3000f
 414:	00821255 	0x821255
 418:	282b1416 	slti	t3,at,5142
 41c:	13160001 	beq	t8,s6,424 <_data-0x7ffffbdc>
 420:	0007889f 	0x7889f
 424:	0007a888 	0x7a888
 428:	60000188 	0x60000188
 42c:	880007d8 	lwl	zero,2008(zero)
 430:	88000808 	lwl	zero,2056(zero)
 434:	00600001 	movf	zero,v1,$fcc0
 438:	00000000 	nop
 43c:	e8000000 	swc2	$0,0(zero)
 440:	f4880007 	sdc1	$f8,7(a0)
 444:	01880007 	srav	zero,t0,t4
 448:	00005200 	sll	t2,zero,0x8
 44c:	00000000 	nop
 450:	07640000 	0x7640000
 454:	076c8800 	teqi	k1,-30720
 458:	00018800 	sll	s1,at,0x0
 45c:	00077460 	0x77460
 460:	00078088 	0x78088
 464:	60000188 	0x60000188
 468:	880007b4 	lwl	zero,1972(zero)
 46c:	880007bc 	lwl	zero,1980(zero)
 470:	bc540001 	cache	0x14,1(v0)
 474:	d8880007 	ldc2	$8,7(a0)
 478:	01880007 	srav	zero,t0,t4
 47c:	00006000 	sll	t4,zero,0x0
	...
 48c:	00010000 	sll	zero,at,0x0
 490:	00000055 	0x55
 494:	00000000 	nop
 498:	56000100 	bnezl	s0,89c <_data-0x7ffff764>
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
 504:	06000000 	bltz	s0,508 <_data-0x7ffffaf8>
 508:	5601f300 	bnel	s0,at,ffffd10c <_text_end+0x77ffc2b4>
 50c:	009f1c31 	tgeu	a0,ra,0x70
	...
 51c:	01000000 	0x1000000
 520:	00005400 	sll	t2,zero,0x10
 524:	00000000 	nop
 528:	00010000 	sll	zero,at,0x0
 52c:	00000052 	mflhxu	zero
	...
 53c:	55000100 	bnezl	t0,940 <_data-0x7ffff6c0>
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
 5b8:	07000000 	bltz	t8,5bc <_data-0x7ffffa44>
 5bc:	f3007300 	0xf3007300
 5c0:	9f1c5501 	0x9f1c5501
	...
 5cc:	0073000a 	movz	zero,v1,s3
 5d0:	22007220 	addi	zero,s0,29216
 5d4:	9f220076 	0x9f220076
	...
 5e0:	00720009 	0x720009
 5e4:	761c0073 	jalx	87001cc <_data-0x778ffe34>
 5e8:	009f2200 	0x9f2200
	...
 5f8:	01000000 	0x1000000
 5fc:	00005500 	sll	t2,zero,0x14
 600:	00000000 	nop
 604:	00010000 	sll	zero,at,0x0
 608:	00000053 	mtlhx	zero
 60c:	00000000 	nop
 610:	55000100 	bnezl	t0,a14 <_data-0x7ffff5ec>
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
 644:	52000100 	beqzl	s0,a48 <_data-0x7ffff5b8>
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
 678:	54000100 	bnezl	zero,a7c <_data-0x7ffff584>
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
 6c0:	04000000 	bltz	zero,6c4 <_data-0x7ffff93c>
 6c4:	5601f300 	bnel	s0,at,ffffd2c8 <_text_end+0x77ffc470>
 6c8:	0000009f 	0x9f
 6cc:	00000000 	nop
 6d0:	73000b00 	0x73000b00
 6d4:	00722000 	0x722000
 6d8:	5601f322 	bnel	s0,at,ffffd364 <_text_end+0x77ffc50c>
 6dc:	00009f22 	0x9f22
 6e0:	00000000 	nop
 6e4:	000a0000 	sll	zero,t2,0x0
 6e8:	00730072 	tlt	v1,s3,0x1
 6ec:	5601f31c 	bnel	s0,at,ffffd360 <_text_end+0x77ffc508>
 6f0:	00009f22 	0x9f22
	...
 700:	00010000 	sll	zero,at,0x0
 704:	00000054 	0x54
 708:	00000000 	nop
 70c:	53000100 	beqzl	t8,b10 <_data-0x7ffff4f0>
 710:	00000000 	nop
 714:	00000000 	nop
 718:	88000808 	lwl	zero,2056(zero)
 71c:	88000814 	lwl	zero,2068(zero)
 720:	14540001 	bne	v0,s4,728 <_data-0x7ffff8d8>
 724:	2c880008 	sltiu	t0,a0,8
 728:	01880008 	0x1880008
 72c:	00005200 	sll	t2,zero,0x8
 730:	00000000 	nop
 734:	08080000 	j	200000 <_data-0x7fe00000>
 738:	08108800 	j	422000 <_data-0x7fbde000>
 73c:	00018800 	sll	s1,at,0x0
 740:	00081056 	0x81056
 744:	00081488 	0x81488
 748:	f3000488 	0xf3000488
 74c:	149f5601 	bne	a0,ra,15f54 <_data-0x7ffea0ac>
 750:	24880008 	addiu	t0,a0,8
 754:	0b880008 	j	e200020 <_data-0x71dfffe0>
 758:	20007300 	addi	zero,zero,29440
 75c:	f3220072 	0xf3220072
 760:	9f225601 	0x9f225601
 764:	88000824 	lwl	zero,2084(zero)
 768:	8800082c 	lwl	zero,2092(zero)
 76c:	0072000a 	movz	zero,v1,s2
 770:	f31c0073 	0xf31c0073
 774:	9f225601 	0x9f225601
	...
 780:	8800080c 	lwl	zero,2060(zero)
 784:	88000814 	lwl	zero,2068(zero)
 788:	14540001 	bne	v0,s4,790 <_data-0x7ffff870>
 78c:	2c880008 	sltiu	t0,a0,8
 790:	01880008 	0x1880008
 794:	00005300 	sll	t2,zero,0xc
	...
 7a4:	00010000 	sll	zero,at,0x0
 7a8:	00000054 	0x54
 7ac:	00000000 	nop
 7b0:	52000100 	beqzl	s0,bb4 <_data-0x7ffff44c>
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
 7ec:	54000100 	bnezl	zero,bf0 <_data-0x7ffff410>
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
 828:	56000100 	bnezl	s0,c2c <_data-0x7ffff3d4>
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
 890:	55000100 	bnezl	t0,c94 <_data-0x7ffff36c>
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
 8cc:	55000100 	bnezl	t0,cd0 <_data-0x7ffff330>
 8d0:	00000000 	nop
	...
 8e0:	00560001 	0x560001
 8e4:	00000000 	nop
 8e8:	04000000 	bltz	zero,8ec <_data-0x7ffff714>
 8ec:	5601f300 	bnel	s0,at,ffffd4f0 <_text_end+0x77ffc698>
 8f0:	0000009f 	0x9f
 8f4:	00000000 	nop
 8f8:	72000a00 	0x72000a00
 8fc:	1c007300 	bgtz	zero,1d500 <_data-0x7ffe2b00>
 900:	225601f3 	addi	s6,s2,499
 904:	0000009f 	0x9f
	...
 914:	54000100 	bnezl	zero,d18 <_data-0x7ffff2e8>
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
 950:	55000100 	bnezl	t0,d54 <_data-0x7ffff2ac>
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
 98c:	54000100 	bnezl	zero,d90 <_data-0x7ffff270>
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
 9f0:	54000100 	bnezl	zero,df4 <_data-0x7ffff20c>
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
 a24:	088c0000 	j	2300000 <_data-0x7dd00000>
 a28:	089b8800 	j	26e2000 <_data-0x7d91e000>
 a2c:	00018800 	sll	s1,at,0x0
 a30:	00089b54 	0x89b54
 a34:	0008bc88 	0x8bc88
 a38:	f3000488 	0xf3000488
 a3c:	009f5401 	0x9f5401
 a40:	00000000 	nop
 a44:	2c000000 	sltiu	zero,zero,0
 a48:	48880008 	0x48880008
 a4c:	01880008 	0x1880008
 a50:	08485400 	j	1215000 <_data-0x7edeb000>
 a54:	085c8800 	j	1722000 <_data-0x7e8de000>
 a58:	00018800 	sll	s1,at,0x0
 a5c:	00086c61 	0x86c61
 a60:	00088c88 	0x88c88
 a64:	61000188 	0x61000188
	...
 a70:	8800084c 	lwl	zero,2124(zero)
 a74:	88000860 	lwl	zero,2144(zero)
 a78:	6c600001 	0x6c600001
 a7c:	8c880008 	lw	t0,8(a0)
 a80:	01880008 	0x1880008
 a84:	00006000 	sll	t4,zero,0x0
 a88:	00000000 	nop
 a8c:	08bc0000 	j	2f00000 <_data-0x7d100000>
 a90:	08c88800 	j	3222000 <_data-0x7cdde000>
 a94:	00018800 	sll	s1,at,0x0
 a98:	0008c854 	0x8c854
 a9c:	0008e088 	0x8e088
 aa0:	60000188 	0x60000188
 aa4:	880008e0 	lwl	zero,2272(zero)
 aa8:	880008e8 	lwl	zero,2280(zero)
 aac:	00520001 	0x520001
	...
 abc:	06000000 	bltz	s0,ac0 <_data-0x7ffff540>
 ac0:	20049e00 	addi	a0,zero,-25088
 ac4:	00bff0f0 	tge	a1,ra,0x3c3
 ac8:	00000000 	nop
 acc:	54000000 	bnezl	zero,ad0 <_data-0x7ffff530>
 ad0:	60880009 	0x60880009
 ad4:	01880009 	0x1880009
 ad8:	00005400 	sll	t2,zero,0x10
 adc:	00000000 	nop
 ae0:	09540000 	j	5500000 <_data-0x7ab00000>
 ae4:	09608800 	j	5822000 <_data-0x7a7de000>
 ae8:	00068800 	sll	s1,a2,0x0
 aec:	f010049e 	0xf010049e
 af0:	0000bff0 	tge	zero,zero,0x2ff
 af4:	00000000 	nop
 af8:	09400000 	j	5000000 <_data-0x7b000000>
 afc:	094c8800 	j	5322000 <_data-0x7acde000>
 b00:	00018800 	sll	s1,at,0x0
 b04:	00000054 	0x54
 b08:	00000000 	nop
 b0c:	00094000 	sll	t0,t1,0x0
 b10:	00094c88 	0x94c88
 b14:	9e000688 	0x9e000688
 b18:	f0f00004 	0xf0f00004
 b1c:	000000bf 	0xbf
	...
 b2c:	30000200 	andi	zero,zero,0x200
 b30:	0000009f 	0x9f
 b34:	00000000 	nop
 b38:	74000600 	jalx	1800 <_data-0x7fffe800>
 b3c:	1aff0800 	0x1aff0800
 b40:	0000009f 	0x9f
 b44:	00000000 	nop
 b48:	75000e00 	jalx	4003800 <_data-0x7bffc800>
 b4c:	1aff0800 	0x1aff0800
 b50:	00742438 	0x742438
 b54:	211aff08 	addi	k0,t0,-248
 b58:	0000009f 	0x9f
 b5c:	00000000 	nop
 b60:	54000100 	bnezl	zero,f64 <_data-0x7ffff09c>
 b64:	00000000 	nop
 b68:	00000000 	nop
 b6c:	0072000b 	movn	zero,v1,s2
 b70:	481aff08 	0x481aff08
 b74:	21007424 	addi	zero,t0,29732
 b78:	0000009f 	0x9f
 b7c:	00000000 	nop
 b80:	00093400 	sll	a2,t1,0x10
 b84:	00093888 	0x93888
 b88:	54000188 	bnezl	zero,11ac <_data-0x7fffee54>
 b8c:	00000000 	nop
 b90:	00000000 	nop
 b94:	88000934 	lwl	zero,2356(zero)
 b98:	88000938 	lwl	zero,2360(zero)
 b9c:	049e0006 	0x49e0006
 ba0:	bfd03000 	cache	0x10,12288(s8)
	...
 bac:	880008e8 	lwl	zero,2280(zero)
 bb0:	880008f4 	lwl	zero,2292(zero)
 bb4:	81090003 	lb	t1,3(t0)
 bb8:	0000009f 	0x9f
 bbc:	00000000 	nop
 bc0:	0008e800 	sll	sp,t0,0x0
 bc4:	0008f488 	0x8f488
 bc8:	9e000688 	0x9e000688
 bcc:	d0300804 	0xd0300804
 bd0:	000000bf 	0xbf
 bd4:	00000000 	nop
 bd8:	0008f400 	sll	s8,t0,0x10
 bdc:	0008fc88 	0x8fc88
 be0:	09000388 	j	4000e20 <_data-0x7bfff1e0>
 be4:	00009f80 	sll	s3,zero,0x1e
 be8:	00000000 	nop
 bec:	08f40000 	j	3d00000 <_data-0x7c300000>
 bf0:	08fc8800 	j	3f22000 <_data-0x7c0de000>
 bf4:	00068800 	sll	s1,a2,0x0
 bf8:	300c049e 	andi	t4,zero,0x49e
 bfc:	0000bfd0 	0xbfd0
 c00:	00000000 	nop
 c04:	08fc0000 	j	3f00000 <_data-0x7c100000>
 c08:	09048800 	j	4122000 <_data-0x7bede000>
 c0c:	00038800 	sll	s1,v1,0x0
 c10:	009f3608 	0x9f3608
 c14:	00000000 	nop
 c18:	fc000000 	sdc3	$0,0(zero)
 c1c:	04880008 	tgei	a0,8
 c20:	06880009 	tgei	s4,9
 c24:	00049e00 	sll	s3,a0,0x18
 c28:	00bfd030 	tge	a1,ra,0x340
 c2c:	00000000 	nop
 c30:	0c000000 	jal	0 <_data-0x80000000>
 c34:	10880009 	beq	a0,t0,c5c <_data-0x7ffff3a4>
 c38:	02880009 	0x2880009
 c3c:	009f3300 	0x9f3300
 c40:	00000000 	nop
 c44:	0c000000 	jal	0 <_data-0x80000000>
 c48:	10880009 	beq	a0,t0,c70 <_data-0x7ffff390>
 c4c:	06880009 	tgei	s4,9
 c50:	0c049e00 	jal	127800 <_data-0x7fed8800>
 c54:	00bfd030 	tge	a1,ra,0x340
 c58:	00000000 	nop
 c5c:	04000000 	bltz	zero,c60 <_data-0x7ffff3a0>
 c60:	0c880009 	jal	2200024 <_data-0x7ddfffdc>
 c64:	02880009 	0x2880009
 c68:	009f3000 	0x9f3000
 c6c:	00000000 	nop
 c70:	04000000 	bltz	zero,c74 <_data-0x7ffff38c>
 c74:	0c880009 	jal	2200024 <_data-0x7ddfffdc>
 c78:	06880009 	tgei	s4,9
 c7c:	04049e00 	0x4049e00
 c80:	00bfd030 	tge	a1,ra,0x340
 c84:	00000000 	nop
 c88:	10000000 	b	c8c <_data-0x7ffff374>
 c8c:	14880009 	bne	a0,t0,cb4 <_data-0x7ffff34c>
 c90:	02880009 	0x2880009
 c94:	009f3000 	0x9f3000
 c98:	00000000 	nop
 c9c:	10000000 	b	ca0 <_data-0x7ffff360>
 ca0:	14880009 	bne	a0,t0,cc8 <_data-0x7ffff338>
 ca4:	06880009 	tgei	s4,9
 ca8:	10049e00 	beq	zero,a0,fffe84ac <_text_end+0x77fe7654>
 cac:	00bfd030 	tge	a1,ra,0x340
 cb0:	00000000 	nop
 cb4:	14000000 	bnez	zero,cb8 <_data-0x7ffff348>
 cb8:	18880009 	0x18880009
 cbc:	02880009 	0x2880009
 cc0:	009f3000 	0x9f3000
 cc4:	00000000 	nop
 cc8:	14000000 	bnez	zero,ccc <_data-0x7ffff334>
 ccc:	18880009 	0x18880009
 cd0:	06880009 	tgei	s4,9
 cd4:	04049e00 	0x4049e00
 cd8:	00bfd030 	tge	a1,ra,0x340
	...
 ce8:	01000000 	0x1000000
 cec:	00005500 	sll	t2,zero,0x14
	...
 cfc:	00010000 	sll	zero,at,0x0
 d00:	00000054 	0x54
	...
 d10:	54000100 	bnezl	zero,1114 <_data-0x7fffeeec>
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
 d5c:	55000100 	bnezl	t0,1160 <_data-0x7fffeea0>
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
  18:	88000290 	lwl	zero,656(zero)
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
  30:	0b000e48 	j	c003920 <_data-0x73ffc6e0>
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
  5c:	88000358 	lwl	zero,856(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00000098 	0x98
  64:	44300e44 	0x44300e44
  68:	94580393 	lhu	t8,915(v0)
  6c:	91049202 	lbu	a0,-28158(t0)
  70:	9f069005 	0x9f069005
  74:	0e780201 	jal	9e00804 <_data-0x761ff7fc>
  78:	d2d1d000 	0xd2d1d000
  7c:	00dfd4d3 	0xdfd4d3
  80:	00000024 	and	zero,zero,zero
  84:	00000000 	nop
  88:	880003f0 	lwl	zero,1008(zero)
  8c:	00000068 	0x68
  90:	44280e44 	0x44280e44
  94:	92500391 	lbu	s0,913(s2)
  98:	9f049002 	0x9f049002
  9c:	0e500201 	jal	9400804 <_data-0x76bff7fc>
  a0:	d2d1d000 	0xd2d1d000
  a4:	000000df 	0xdf
  a8:	00000024 	and	zero,zero,zero
  ac:	00000000 	nop
  b0:	88000458 	lwl	zero,1112(zero)
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
  e8:	8800050c 	lwl	zero,1292(zero)
  ec:	00000224 	0x224
  f0:	44300e44 	0x44300e44
  f4:	93580690 	lbu	t8,1680(k0)
  f8:	91049203 	lbu	a0,-28157(t0)
  fc:	94019f05 	lhu	at,-24827(zero)
 100:	0a500202 	j	9400808 <_data-0x76bff7f8>
 104:	d1d0000e 	0xd1d0000e
 108:	dfd4d3d2 	ldc3	$20,-11310(s8)
 10c:	0000000b 	movn	zero,zero,zero
 110:	0000000c 	syscall
 114:	ffffffff 	sdc3	$31,-1(ra)
 118:	7c010001 	0x7c010001
 11c:	001d0d1f 	0x1d0d1f
 120:	00000028 	0x28
 124:	00000110 	0x110
 128:	88000730 	lwl	zero,1840(zero)
 12c:	000000d8 	0xd8
 130:	58680e44 	0x58680e44
 134:	03930294 	0x3930294
 138:	0492019f 	bltzall	a0,7b8 <_data-0x7ffff848>
 13c:	06900591 	bltzal	s4,1784 <_data-0x7fffe87c>
 140:	0e0a6802 	jal	829a008 <_data-0x77d65ff8>
 144:	d2d1d000 	0xd2d1d000
 148:	0bdfd4d3 	j	f7f534c <_data-0x7080acb4>
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
 1e4:	88000808 	lwl	zero,2056(zero)
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
 244:	8800082c 	lwl	zero,2092(zero)
 248:	00000060 	0x60
 24c:	50200e44 	beqzl	at,3b60 <_data-0x7fffc4a0>
 250:	03910292 	0x3910292
 254:	0490019f 	bltzal	a0,8d4 <_data-0x7ffff72c>
 258:	000e0a6c 	0xe0a6c
 25c:	dfd2d1d0 	ldc3	$18,-11824(s8)
 260:	0000000b 	movn	zero,zero,zero
 264:	00000018 	mult	zero,zero
 268:	0000022c 	0x22c
 26c:	8800088c 	lwl	zero,2188(zero)
 270:	00000030 	tge	zero,zero
 274:	44180e44 	0x44180e44
 278:	0e68019f 	jal	9a0067c <_data-0x765ff984>
 27c:	0000df00 	sll	k1,zero,0x1c
 280:	0000000c 	syscall
 284:	ffffffff 	sdc3	$31,-1(ra)
 288:	7c010001 	0x7c010001
 28c:	001d0d1f 	0x1d0d1f
 290:	0000001c 	0x1c
 294:	00000280 	sll	zero,zero,0xa
 298:	880008bc 	lwl	zero,2236(zero)
 29c:	0000002c 	0x2c
 2a0:	44180e44 	0x44180e44
 2a4:	9f480290 	0x9f480290
 2a8:	000e5c01 	0xe5c01
 2ac:	0000dfd0 	0xdfd0
