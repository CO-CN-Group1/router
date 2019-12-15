
test_memory.bootrom.elf:     file format elf32-tradlittlemips
test_memory.bootrom.elf


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
bfc00030:	0ff002e9 	jal	bfc00ba4 <_main>
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
bfc00440:	0ff0035b 	jal	bfc00d6c <_exception_handler>
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

bfc00478 <_ZN6__impl19send_serial_str_arrILj5EJLj0ELj1ELj2ELj3ELj4EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.1.constprop.5>:
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:116
	{
		send_serial_char(a);
	}

	template<unsigned N, unsigned... I>
	inline void send_serial_str_arr(const char (&str)[N], unsigned_sequence<I...>)
bfc00478:	27bdffe8 	addiu	sp,sp,-24
bfc0047c:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
bfc00480:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00484:	2404004f 	li	a0,79
bfc00488:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0048c:	2404004b 	li	a0,75
bfc00490:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00494:	24040021 	li	a0,33
bfc00498:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0049c:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:119
	{
		send_serial_str_unpack(str[I]...);
	}
bfc004a0:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
bfc004a4:	00002025 	move	a0,zero
bfc004a8:	0bf00114 	j	bfc00450 <_Z16send_serial_charh>
bfc004ac:	27bd0018 	addiu	sp,sp,24

bfc004b0 <_ZN6__impl19send_serial_str_arrILj10EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.2.constprop.4>:
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:116
	inline void send_serial_str_arr(const char (&str)[N], unsigned_sequence<I...>)
bfc004b0:	27bdffe8 	addiu	sp,sp,-24
bfc004b4:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
bfc004b8:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004bc:	24040045 	li	a0,69
bfc004c0:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004c4:	24040072 	li	a0,114
bfc004c8:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004cc:	24040072 	li	a0,114
bfc004d0:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004d4:	2404006f 	li	a0,111
bfc004d8:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004dc:	24040072 	li	a0,114
bfc004e0:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004e4:	24040020 	li	a0,32
bfc004e8:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004ec:	24040061 	li	a0,97
bfc004f0:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004f4:	24040074 	li	a0,116
bfc004f8:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc004fc:	24040020 	li	a0,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:119
	}
bfc00500:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
bfc00504:	00002025 	move	a0,zero
bfc00508:	0bf00114 	j	bfc00450 <_Z16send_serial_charh>
bfc0050c:	27bd0018 	addiu	sp,sp,24

bfc00510 <_Z15send_serial_hexj>:
_Z15send_serial_hexj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:54
{
bfc00510:	27bdffe0 	addiu	sp,sp,-32
bfc00514:	afb20018 	sw	s2,24(sp)
bfc00518:	00809025 	move	s2,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:55
	send_serial_char('0');
bfc0051c:	24040030 	li	a0,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:54
{
bfc00520:	afbf001c 	sw	ra,28(sp)
bfc00524:	afb10014 	sw	s1,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:55
	send_serial_char('0');
bfc00528:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0052c:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:56
	send_serial_char('x');
bfc00530:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00534:	24040078 	li	a0,120
bfc00538:	2410001c 	li	s0,28
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:57
	for(int i = 7; i >= 0; --i)
bfc0053c:	2411fffc 	li	s1,-4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:59
		unsigned char c = (v >> (i << 2)) & 0xf;
bfc00540:	02121006 	srlv	v0,s2,s0
bfc00544:	3042000f 	andi	v0,v0,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:60
		c = (c < 10) ? c + '0' : c + 'a' - 10;
bfc00548:	2c43000a 	sltiu	v1,v0,10
bfc0054c:	10600002 	beqz	v1,bfc00558 <_Z15send_serial_hexj+0x48>
bfc00550:	24440057 	addiu	a0,v0,87
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:60 (discriminator 1)
bfc00554:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:61 (discriminator 4)
		send_serial_char(c);
bfc00558:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0055c:	2610fffc 	addiu	s0,s0,-4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:57 (discriminator 4)
	for(int i = 7; i >= 0; --i)
bfc00560:	1611fff8 	bne	s0,s1,bfc00544 <_Z15send_serial_hexj+0x34>
bfc00564:	02121006 	srlv	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:63
}
bfc00568:	8fbf001c 	lw	ra,28(sp)
bfc0056c:	8fb20018 	lw	s2,24(sp)
bfc00570:	8fb10014 	lw	s1,20(sp)
bfc00574:	8fb00010 	lw	s0,16(sp)
bfc00578:	03e00008 	jr	ra
bfc0057c:	27bd0020 	addiu	sp,sp,32

bfc00580 <_Z4testIjEvv>:
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
{
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
}

template<typename Type>
inline void test()
bfc00580:	27bdffe8 	addiu	sp,sp,-24
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc00584:	3c047fff 	lui	a0,0x7fff
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
bfc00588:	3c038000 	lui	v1,0x8000
bfc0058c:	afbf0014 	sw	ra,20(sp)
bfc00590:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:15
{
	unsigned rand_seed;

	volatile Type* mem = reinterpret_cast<volatile Type *>(MEM_ADDR);

	rand_seed = 23;
bfc00594:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc00598:	240641a7 	li	a2,16807
bfc0059c:	3484ffff 	ori	a0,a0,0xffff
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc005a0:	3c058080 	lui	a1,0x8080
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5 (discriminator 2)
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc005a4:	70461002 	mul	v0,v0,a2
bfc005a8:	24630004 	addiu	v1,v1,4
bfc005ac:	0044001b 	divu	zero,v0,a0
bfc005b0:	008001f4 	teq	a0,zero,0x7
bfc005b4:	00001010 	mfhi	v0
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:17 (discriminator 2)
		mem[i] = rand(rand_seed);
bfc005b8:	ac62fffc 	sw	v0,-4(v1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16 (discriminator 2)
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc005bc:	1465fffa 	bne	v1,a1,bfc005a8 <_Z4testIjEvv+0x28>
bfc005c0:	70461002 	mul	v0,v0,a2
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc005c4:	3c057fff 	lui	a1,0x7fff
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:19

	rand_seed = 23;
bfc005c8:	24020017 	li	v0,23
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc005cc:	00001825 	move	v1,zero
bfc005d0:	3c072000 	lui	a3,0x2000
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc005d4:	240841a7 	li	t0,16807
bfc005d8:	34a5ffff 	ori	a1,a1,0xffff
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc005dc:	3c060020 	lui	a2,0x20
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc005e0:	70481002 	mul	v0,v0,t0
bfc005e4:	00678021 	addu	s0,v1,a3
bfc005e8:	0045001b 	divu	zero,v0,a1
bfc005ec:	00a001f4 	teq	a1,zero,0x7
bfc005f0:	00108080 	sll	s0,s0,0x2
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
bfc005f4:	8e040000 	lw	a0,0(s0)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc005f8:	00001010 	mfhi	v0
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
bfc005fc:	1082000c 	beq	a0,v0,bfc00630 <_Z4testIjEvv+0xb0>
bfc00600:	24630001 	addiu	v1,v1,1
_Z15send_serial_strILj10EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
/* send a literal string without using memory to store it */
template<unsigned N>
inline void send_serial_str(const char (&str)[N])
{
	typedef typename __impl::maker<N>::type type;
	__impl::send_serial_str_arr(str, type{});
bfc00604:	0ff0012c 	jal	bfc004b0 <_ZN6__impl19send_serial_str_arrILj10EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.2.constprop.4>
bfc00608:	00000000 	nop
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:24
		{
			send_serial_str("Error at ");
			send_serial_hex(MEM_ADDR + i * sizeof(Type));
bfc0060c:	0ff00144 	jal	bfc00510 <_Z15send_serial_hexj>
bfc00610:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
bfc00614:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00618:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
			send_serial_str("\n");
			break;
		}
}
bfc0061c:	8fbf0014 	lw	ra,20(sp)
bfc00620:	8fb00010 	lw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
bfc00624:	00002025 	move	a0,zero
bfc00628:	0bf00114 	j	bfc00450 <_Z16send_serial_charh>
bfc0062c:	27bd0018 	addiu	sp,sp,24
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20 (discriminator 2)
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00630:	1466ffeb 	bne	v1,a2,bfc005e0 <_Z4testIjEvv+0x60>
bfc00634:	00801025 	move	v0,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
bfc00638:	8fbf0014 	lw	ra,20(sp)
bfc0063c:	8fb00010 	lw	s0,16(sp)
bfc00640:	03e00008 	jr	ra
bfc00644:	27bd0018 	addiu	sp,sp,24

bfc00648 <_Z4testItEvv>:
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
bfc00648:	27bdffe8 	addiu	sp,sp,-24
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0064c:	3c047fff 	lui	a0,0x7fff
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
bfc00650:	3c038000 	lui	v1,0x8000
bfc00654:	afbf0014 	sw	ra,20(sp)
bfc00658:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:15
	rand_seed = 23;
bfc0065c:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc00660:	240741a7 	li	a3,16807
bfc00664:	3484ffff 	ori	a0,a0,0xffff
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00668:	3c058080 	lui	a1,0x8080
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0066c:	70471002 	mul	v0,v0,a3
bfc00670:	24630002 	addiu	v1,v1,2
bfc00674:	0044001b 	divu	zero,v0,a0
bfc00678:	008001f4 	teq	a0,zero,0x7
bfc0067c:	00001010 	mfhi	v0
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:17
		mem[i] = rand(rand_seed);
bfc00680:	3046ffff 	andi	a2,v0,0xffff
bfc00684:	a466fffe 	sh	a2,-2(v1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00688:	1465fff9 	bne	v1,a1,bfc00670 <_Z4testItEvv+0x28>
bfc0068c:	70471002 	mul	v0,v0,a3
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc00690:	3c057fff 	lui	a1,0x7fff
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:19
	rand_seed = 23;
bfc00694:	24020017 	li	v0,23
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00698:	00001825 	move	v1,zero
bfc0069c:	3c064000 	lui	a2,0x4000
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc006a0:	240741a7 	li	a3,16807
bfc006a4:	34a5ffff 	ori	a1,a1,0xffff
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc006a8:	3c040040 	lui	a0,0x40
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc006ac:	70471002 	mul	v0,v0,a3
bfc006b0:	00668021 	addu	s0,v1,a2
bfc006b4:	0045001b 	divu	zero,v0,a1
bfc006b8:	00a001f4 	teq	a1,zero,0x7
bfc006bc:	00108040 	sll	s0,s0,0x1
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
bfc006c0:	96080000 	lhu	t0,0(s0)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc006c4:	00001010 	mfhi	v0
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
bfc006c8:	3049ffff 	andi	t1,v0,0xffff
bfc006cc:	1128000c 	beq	t1,t0,bfc00700 <_Z4testItEvv+0xb8>
bfc006d0:	24630001 	addiu	v1,v1,1
_Z15send_serial_strILj10EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
	__impl::send_serial_str_arr(str, type{});
bfc006d4:	0ff0012c 	jal	bfc004b0 <_ZN6__impl19send_serial_str_arrILj10EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.2.constprop.4>
bfc006d8:	00000000 	nop
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:24
			send_serial_hex(MEM_ADDR + i * sizeof(Type));
bfc006dc:	0ff00144 	jal	bfc00510 <_Z15send_serial_hexj>
bfc006e0:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
bfc006e4:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc006e8:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
bfc006ec:	8fbf0014 	lw	ra,20(sp)
bfc006f0:	8fb00010 	lw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
bfc006f4:	00002025 	move	a0,zero
bfc006f8:	0bf00114 	j	bfc00450 <_Z16send_serial_charh>
bfc006fc:	27bd0018 	addiu	sp,sp,24
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20 (discriminator 2)
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00700:	1464ffea 	bne	v1,a0,bfc006ac <_Z4testItEvv+0x64>
bfc00704:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
bfc00708:	8fb00010 	lw	s0,16(sp)
bfc0070c:	03e00008 	jr	ra
bfc00710:	27bd0018 	addiu	sp,sp,24

bfc00714 <_Z4testIhEvv>:
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
bfc00714:	27bdffe8 	addiu	sp,sp,-24
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc00718:	3c047fff 	lui	a0,0x7fff
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
bfc0071c:	3c038000 	lui	v1,0x8000
bfc00720:	afbf0014 	sw	ra,20(sp)
bfc00724:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:15
	rand_seed = 23;
bfc00728:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0072c:	240741a7 	li	a3,16807
bfc00730:	3484ffff 	ori	a0,a0,0xffff
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00734:	3c058080 	lui	a1,0x8080
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc00738:	70471002 	mul	v0,v0,a3
bfc0073c:	24630001 	addiu	v1,v1,1
bfc00740:	0044001b 	divu	zero,v0,a0
bfc00744:	008001f4 	teq	a0,zero,0x7
bfc00748:	00001010 	mfhi	v0
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:17
		mem[i] = rand(rand_seed);
bfc0074c:	304600ff 	andi	a2,v0,0xff
bfc00750:	a066ffff 	sb	a2,-1(v1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00754:	1465fff9 	bne	v1,a1,bfc0073c <_Z4testIhEvv+0x28>
bfc00758:	70471002 	mul	v0,v0,a3
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0075c:	3c057fff 	lui	a1,0x7fff
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:19
	rand_seed = 23;
bfc00760:	24020017 	li	v0,23
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00764:	00001825 	move	v1,zero
bfc00768:	3c068000 	lui	a2,0x8000
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0076c:	240741a7 	li	a3,16807
bfc00770:	34a5ffff 	ori	a1,a1,0xffff
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc00774:	3c040080 	lui	a0,0x80
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc00778:	70471002 	mul	v0,v0,a3
bfc0077c:	00668021 	addu	s0,v1,a2
bfc00780:	0045001b 	divu	zero,v0,a1
bfc00784:	00a001f4 	teq	a1,zero,0x7
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
bfc00788:	92080000 	lbu	t0,0(s0)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0078c:	00001010 	mfhi	v0
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
bfc00790:	304900ff 	andi	t1,v0,0xff
bfc00794:	1128000c 	beq	t1,t0,bfc007c8 <_Z4testIhEvv+0xb4>
bfc00798:	24630001 	addiu	v1,v1,1
_Z15send_serial_strILj10EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
	__impl::send_serial_str_arr(str, type{});
bfc0079c:	0ff0012c 	jal	bfc004b0 <_ZN6__impl19send_serial_str_arrILj10EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.2.constprop.4>
bfc007a0:	00000000 	nop
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:24
			send_serial_hex(MEM_ADDR + i * sizeof(Type));
bfc007a4:	0ff00144 	jal	bfc00510 <_Z15send_serial_hexj>
bfc007a8:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
bfc007ac:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc007b0:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
bfc007b4:	8fbf0014 	lw	ra,20(sp)
bfc007b8:	8fb00010 	lw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
bfc007bc:	00002025 	move	a0,zero
bfc007c0:	0bf00114 	j	bfc00450 <_Z16send_serial_charh>
bfc007c4:	27bd0018 	addiu	sp,sp,24
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20 (discriminator 2)
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
bfc007c8:	1464ffeb 	bne	v1,a0,bfc00778 <_Z4testIhEvv+0x64>
bfc007cc:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
bfc007d0:	8fb00010 	lw	s0,16(sp)
bfc007d4:	03e00008 	jr	ra
bfc007d8:	27bd0018 	addiu	sp,sp,24

bfc007dc <_ZN6__impl22send_serial_str_unpackIJccccccccccccccccccccccccEEEvhDpT_>:
_ZN6__impl22send_serial_str_unpackIJccccccccccccccccccccccccEEEvhDpT_():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:103
	inline void send_serial_str_unpack(unsigned char a, Pack... pack)
bfc007dc:	27bdff88 	addiu	sp,sp,-120
bfc007e0:	83a900a8 	lb	t1,168(sp)
bfc007e4:	83aa00a4 	lb	t2,164(sp)
bfc007e8:	83ab00a0 	lb	t3,160(sp)
bfc007ec:	83ac009c 	lb	t4,156(sp)
bfc007f0:	83ad0098 	lb	t5,152(sp)
bfc007f4:	83ae0094 	lb	t6,148(sp)
bfc007f8:	83af0090 	lb	t7,144(sp)
bfc007fc:	83b8008c 	lb	t8,140(sp)
bfc00800:	83b90088 	lb	t9,136(sp)
bfc00804:	afbf0074 	sw	ra,116(sp)
bfc00808:	afa9001c 	sw	t1,28(sp)
bfc0080c:	afbe0070 	sw	s8,112(sp)
bfc00810:	afb7006c 	sw	s7,108(sp)
bfc00814:	afb60068 	sw	s6,104(sp)
bfc00818:	afb50064 	sw	s5,100(sp)
bfc0081c:	afb40060 	sw	s4,96(sp)
bfc00820:	afb3005c 	sw	s3,92(sp)
bfc00824:	afb20058 	sw	s2,88(sp)
bfc00828:	afb10054 	sw	s1,84(sp)
bfc0082c:	afb00050 	sw	s0,80(sp)
bfc00830:	afaa0020 	sw	t2,32(sp)
bfc00834:	afab0024 	sw	t3,36(sp)
bfc00838:	afac0028 	sw	t4,40(sp)
bfc0083c:	afad002c 	sw	t5,44(sp)
bfc00840:	afae0030 	sw	t6,48(sp)
bfc00844:	afaf0034 	sw	t7,52(sp)
bfc00848:	afb80038 	sw	t8,56(sp)
bfc0084c:	afb9003c 	sw	t9,60(sp)
bfc00850:	afa70040 	sw	a3,64(sp)
bfc00854:	afa60044 	sw	a2,68(sp)
bfc00858:	afa50048 	sw	a1,72(sp)
bfc0085c:	83a800ac 	lb	t0,172(sp)
bfc00860:	83a200b4 	lb	v0,180(sp)
bfc00864:	83a300b0 	lb	v1,176(sp)
bfc00868:	afa20010 	sw	v0,16(sp)
bfc0086c:	afa30014 	sw	v1,20(sp)
bfc00870:	afa80018 	sw	t0,24(sp)
bfc00874:	83be00b8 	lb	s8,184(sp)
bfc00878:	83b700bc 	lb	s7,188(sp)
bfc0087c:	83b600c0 	lb	s6,192(sp)
bfc00880:	83b500c4 	lb	s5,196(sp)
bfc00884:	83b400c8 	lb	s4,200(sp)
bfc00888:	83b300cc 	lb	s3,204(sp)
bfc0088c:	83b200d0 	lb	s2,208(sp)
bfc00890:	83b100d4 	lb	s1,212(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
bfc00894:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00898:	83b000d8 	lb	s0,216(sp)
bfc0089c:	8fa50048 	lw	a1,72(sp)
bfc008a0:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc008a4:	30a400ff 	andi	a0,a1,0xff
bfc008a8:	8fa60044 	lw	a2,68(sp)
bfc008ac:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc008b0:	30c400ff 	andi	a0,a2,0xff
bfc008b4:	8fa70040 	lw	a3,64(sp)
bfc008b8:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc008bc:	30e400ff 	andi	a0,a3,0xff
bfc008c0:	8fb9003c 	lw	t9,60(sp)
bfc008c4:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc008c8:	332400ff 	andi	a0,t9,0xff
bfc008cc:	8fb80038 	lw	t8,56(sp)
bfc008d0:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc008d4:	330400ff 	andi	a0,t8,0xff
bfc008d8:	8faf0034 	lw	t7,52(sp)
bfc008dc:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc008e0:	31e400ff 	andi	a0,t7,0xff
bfc008e4:	8fae0030 	lw	t6,48(sp)
bfc008e8:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc008ec:	31c400ff 	andi	a0,t6,0xff
bfc008f0:	8fad002c 	lw	t5,44(sp)
bfc008f4:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc008f8:	31a400ff 	andi	a0,t5,0xff
bfc008fc:	8fac0028 	lw	t4,40(sp)
bfc00900:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00904:	318400ff 	andi	a0,t4,0xff
bfc00908:	8fab0024 	lw	t3,36(sp)
bfc0090c:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00910:	316400ff 	andi	a0,t3,0xff
bfc00914:	8faa0020 	lw	t2,32(sp)
bfc00918:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0091c:	314400ff 	andi	a0,t2,0xff
bfc00920:	8fa9001c 	lw	t1,28(sp)
bfc00924:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00928:	312400ff 	andi	a0,t1,0xff
bfc0092c:	8fa80018 	lw	t0,24(sp)
bfc00930:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00934:	310400ff 	andi	a0,t0,0xff
bfc00938:	8fa30014 	lw	v1,20(sp)
bfc0093c:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00940:	306400ff 	andi	a0,v1,0xff
bfc00944:	8fa20010 	lw	v0,16(sp)
bfc00948:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0094c:	304400ff 	andi	a0,v0,0xff
bfc00950:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00954:	33c400ff 	andi	a0,s8,0xff
bfc00958:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0095c:	32e400ff 	andi	a0,s7,0xff
bfc00960:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00964:	32c400ff 	andi	a0,s6,0xff
bfc00968:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0096c:	32a400ff 	andi	a0,s5,0xff
bfc00970:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00974:	328400ff 	andi	a0,s4,0xff
bfc00978:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0097c:	326400ff 	andi	a0,s3,0xff
bfc00980:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00984:	324400ff 	andi	a0,s2,0xff
bfc00988:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc0098c:	322400ff 	andi	a0,s1,0xff
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:107
	}
bfc00990:	8fbf0074 	lw	ra,116(sp)
bfc00994:	8fbe0070 	lw	s8,112(sp)
bfc00998:	8fb7006c 	lw	s7,108(sp)
bfc0099c:	8fb60068 	lw	s6,104(sp)
bfc009a0:	8fb50064 	lw	s5,100(sp)
bfc009a4:	8fb40060 	lw	s4,96(sp)
bfc009a8:	8fb3005c 	lw	s3,92(sp)
bfc009ac:	8fb20058 	lw	s2,88(sp)
bfc009b0:	8fb10054 	lw	s1,84(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
bfc009b4:	320400ff 	andi	a0,s0,0xff
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:107
	}
bfc009b8:	8fb00050 	lw	s0,80(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
bfc009bc:	0bf00114 	j	bfc00450 <_Z16send_serial_charh>
bfc009c0:	27bd0078 	addiu	sp,sp,120

bfc009c4 <_ZN6__impl19send_serial_str_arrILj25EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9ELj10ELj11ELj12ELj13ELj14ELj15ELj16ELj17ELj18ELj19ELj20ELj21ELj22ELj23ELj24EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE>:
_ZN6__impl19send_serial_str_arrILj25EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9ELj10ELj11ELj12ELj13ELj14ELj15ELj16ELj17ELj18ELj19ELj20ELj21ELj22ELj23ELj24EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:116
	inline void send_serial_str_arr(const char (&str)[N], unsigned_sequence<I...>)
bfc009c4:	27bdff90 	addiu	sp,sp,-112
bfc009c8:	00801025 	move	v0,a0
bfc009cc:	afbf006c 	sw	ra,108(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:118
		send_serial_str_unpack(str[I]...);
bfc009d0:	80430018 	lb	v1,24(v0)
bfc009d4:	80870003 	lb	a3,3(a0)
bfc009d8:	80860002 	lb	a2,2(a0)
bfc009dc:	80850001 	lb	a1,1(a0)
bfc009e0:	90840000 	lbu	a0,0(a0)
bfc009e4:	afa30060 	sw	v1,96(sp)
bfc009e8:	80430017 	lb	v1,23(v0)
bfc009ec:	afa3005c 	sw	v1,92(sp)
bfc009f0:	80430016 	lb	v1,22(v0)
bfc009f4:	afa30058 	sw	v1,88(sp)
bfc009f8:	80430015 	lb	v1,21(v0)
bfc009fc:	afa30054 	sw	v1,84(sp)
bfc00a00:	80430014 	lb	v1,20(v0)
bfc00a04:	afa30050 	sw	v1,80(sp)
bfc00a08:	80430013 	lb	v1,19(v0)
bfc00a0c:	afa3004c 	sw	v1,76(sp)
bfc00a10:	80430012 	lb	v1,18(v0)
bfc00a14:	afa30048 	sw	v1,72(sp)
bfc00a18:	80430011 	lb	v1,17(v0)
bfc00a1c:	afa30044 	sw	v1,68(sp)
bfc00a20:	80430010 	lb	v1,16(v0)
bfc00a24:	afa30040 	sw	v1,64(sp)
bfc00a28:	8043000f 	lb	v1,15(v0)
bfc00a2c:	afa3003c 	sw	v1,60(sp)
bfc00a30:	8043000e 	lb	v1,14(v0)
bfc00a34:	afa30038 	sw	v1,56(sp)
bfc00a38:	8043000d 	lb	v1,13(v0)
bfc00a3c:	afa30034 	sw	v1,52(sp)
bfc00a40:	8043000c 	lb	v1,12(v0)
bfc00a44:	afa30030 	sw	v1,48(sp)
bfc00a48:	8043000b 	lb	v1,11(v0)
bfc00a4c:	afa3002c 	sw	v1,44(sp)
bfc00a50:	8043000a 	lb	v1,10(v0)
bfc00a54:	afa30028 	sw	v1,40(sp)
bfc00a58:	80430009 	lb	v1,9(v0)
bfc00a5c:	afa30024 	sw	v1,36(sp)
bfc00a60:	80430008 	lb	v1,8(v0)
bfc00a64:	afa30020 	sw	v1,32(sp)
bfc00a68:	80430007 	lb	v1,7(v0)
bfc00a6c:	afa3001c 	sw	v1,28(sp)
bfc00a70:	80430006 	lb	v1,6(v0)
bfc00a74:	afa30018 	sw	v1,24(sp)
bfc00a78:	80430005 	lb	v1,5(v0)
bfc00a7c:	afa30014 	sw	v1,20(sp)
bfc00a80:	80420004 	lb	v0,4(v0)
bfc00a84:	0ff001f7 	jal	bfc007dc <_ZN6__impl22send_serial_str_unpackIJccccccccccccccccccccccccEEEvhDpT_>
bfc00a88:	afa20010 	sw	v0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:119
	}
bfc00a8c:	8fbf006c 	lw	ra,108(sp)
bfc00a90:	03e00008 	jr	ra
bfc00a94:	27bd0070 	addiu	sp,sp,112

bfc00a98 <_entry>:
_Z15send_serial_strILj25EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
	__impl::send_serial_str_arr(str, type{});
bfc00a98:	3c04bfc0 	lui	a0,0xbfc0
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:31

int _entry()
{
bfc00a9c:	27bdff90 	addiu	sp,sp,-112
_Z15send_serial_strILj25EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
bfc00aa0:	00002825 	move	a1,zero
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:31
bfc00aa4:	afbf006c 	sw	ra,108(sp)
_Z15send_serial_strILj25EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
bfc00aa8:	0ff00271 	jal	bfc009c4 <_ZN6__impl19send_serial_str_arrILj25EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9ELj10ELj11ELj12ELj13ELj14ELj15ELj16ELj17ELj18ELj19ELj20ELj21ELj22ELj23ELj24EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE>
bfc00aac:	2484127c 	addiu	a0,a0,4732
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:33
	send_serial_str("Testing memory by word!\n");
	test<unsigned>();
bfc00ab0:	0ff00160 	jal	bfc00580 <_Z4testIjEvv>
bfc00ab4:	00000000 	nop
_Z15send_serial_strILj5EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
bfc00ab8:	0ff0011e 	jal	bfc00478 <_ZN6__impl19send_serial_str_arrILj5EJLj0ELj1ELj2ELj3ELj4EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.1.constprop.5>
bfc00abc:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
bfc00ac0:	0ff00114 	jal	bfc00450 <_Z16send_serial_charh>
bfc00ac4:	24040054 	li	a0,84
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:106
		send_serial_str_unpack(pack...);
bfc00ac8:	2402000a 	li	v0,10
bfc00acc:	afa2005c 	sw	v0,92(sp)
bfc00ad0:	24020021 	li	v0,33
bfc00ad4:	afa20058 	sw	v0,88(sp)
bfc00ad8:	24020074 	li	v0,116
bfc00adc:	afa20054 	sw	v0,84(sp)
bfc00ae0:	24020068 	li	v0,104
bfc00ae4:	afa20048 	sw	v0,72(sp)
bfc00ae8:	24020073 	li	v0,115
bfc00aec:	afa20044 	sw	v0,68(sp)
bfc00af0:	24020020 	li	v0,32
bfc00af4:	24040072 	li	a0,114
bfc00af8:	2403006f 	li	v1,111
bfc00afc:	afa20040 	sw	v0,64(sp)
bfc00b00:	afa20034 	sw	v0,52(sp)
bfc00b04:	afa20018 	sw	v0,24(sp)
bfc00b08:	24020067 	li	v0,103
bfc00b0c:	afa40050 	sw	a0,80(sp)
bfc00b10:	afa3004c 	sw	v1,76(sp)
bfc00b14:	24050079 	li	a1,121
bfc00b18:	afa4002c 	sw	a0,44(sp)
bfc00b1c:	afa30028 	sw	v1,40(sp)
bfc00b20:	24040065 	li	a0,101
bfc00b24:	2403006d 	li	v1,109
bfc00b28:	afa20014 	sw	v0,20(sp)
bfc00b2c:	24060062 	li	a2,98
bfc00b30:	2402006e 	li	v0,110
bfc00b34:	afa20010 	sw	v0,16(sp)
bfc00b38:	afa30024 	sw	v1,36(sp)
bfc00b3c:	afa3001c 	sw	v1,28(sp)
bfc00b40:	24070069 	li	a3,105
bfc00b44:	afa40020 	sw	a0,32(sp)
bfc00b48:	afa5003c 	sw	a1,60(sp)
bfc00b4c:	afa60038 	sw	a2,56(sp)
bfc00b50:	afa50030 	sw	a1,48(sp)
bfc00b54:	24060074 	li	a2,116
bfc00b58:	24050073 	li	a1,115
bfc00b5c:	0ff001f7 	jal	bfc007dc <_ZN6__impl22send_serial_str_unpackIJccccccccccccccccccccccccEEEvhDpT_>
bfc00b60:	afa00060 	sw	zero,96(sp)
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:36
	send_serial_str("OK!\n");
	send_serial_str("Testing memory by short!\n");
	test<unsigned short>();
bfc00b64:	0ff00192 	jal	bfc00648 <_Z4testItEvv>
bfc00b68:	00000000 	nop
_Z15send_serial_strILj5EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
	__impl::send_serial_str_arr(str, type{});
bfc00b6c:	0ff0011e 	jal	bfc00478 <_ZN6__impl19send_serial_str_arrILj5EJLj0ELj1ELj2ELj3ELj4EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.1.constprop.5>
bfc00b70:	00000000 	nop
_Z15send_serial_strILj25EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
bfc00b74:	3c04bfc0 	lui	a0,0xbfc0
bfc00b78:	00002825 	move	a1,zero
bfc00b7c:	0ff00271 	jal	bfc009c4 <_ZN6__impl19send_serial_str_arrILj25EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9ELj10ELj11ELj12ELj13ELj14ELj15ELj16ELj17ELj18ELj19ELj20ELj21ELj22ELj23ELj24EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE>
bfc00b80:	24841298 	addiu	a0,a0,4760
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:39
	send_serial_str("OK!\n");
	send_serial_str("Testing memory by byte!\n");
	test<unsigned char>();
bfc00b84:	0ff001c5 	jal	bfc00714 <_Z4testIhEvv>
bfc00b88:	00000000 	nop
_Z15send_serial_strILj5EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
bfc00b8c:	0ff0011e 	jal	bfc00478 <_ZN6__impl19send_serial_str_arrILj5EJLj0ELj1ELj2ELj3ELj4EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.1.constprop.5>
bfc00b90:	00000000 	nop
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:43
	send_serial_str("OK!\n");

	return 0;
}
bfc00b94:	8fbf006c 	lw	ra,108(sp)
bfc00b98:	00001025 	move	v0,zero
bfc00b9c:	03e00008 	jr	ra
bfc00ba0:	27bd0070 	addiu	sp,sp,112

bfc00ba4 <_main>:
_main():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:11
extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {
bfc00ba4:	27bdffe0 	addiu	sp,sp,-32
bfc00ba8:	afbf001c 	sw	ra,28(sp)
bfc00bac:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:13

    init_serial();
bfc00bb0:	0ff0047f 	jal	bfc011fc <init_serial>
bfc00bb4:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:15

    write_segment(0x04);
bfc00bb8:	0ff0049a 	jal	bfc01268 <write_segment>
bfc00bbc:	24040004 	li	a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:17

    puts("*****TrivialMIPS Bare Metal System*****");
bfc00bc0:	3c04bfc0 	lui	a0,0xbfc0
bfc00bc4:	0ff00468 	jal	bfc011a0 <puts>
bfc00bc8:	248412b4 	addiu	a0,a0,4788
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00bcc:	3c118800 	lui	s1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00bd0:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00bd4:	3c108800 	lui	s0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00bd8:	248412dc 	addiu	a0,a0,4828
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00bdc:	26310000 	addiu	s1,s1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00be0:	0ff00468 	jal	bfc011a0 <puts>
bfc00be4:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00be8:	02118023 	subu	s0,s0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:21
    write_segment(0x05);
bfc00bec:	0ff0049a 	jal	bfc01268 <write_segment>
bfc00bf0:	24040005 	li	a0,5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:25
    if (bss_size > 0) {
bfc00bf4:	1a000009 	blez	s0,bfc00c1c <_main+0x78>
bfc00bf8:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:26
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
bfc00bfc:	02003025 	move	a2,s0
bfc00c00:	02202825 	move	a1,s1
bfc00c04:	0ff00388 	jal	bfc00e20 <printf>
bfc00c08:	24841304 	addiu	a0,a0,4868
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:27
        memset(&_bss, 0, bss_size);
bfc00c0c:	02003025 	move	a2,s0
bfc00c10:	00002825 	move	a1,zero
bfc00c14:	0ff00447 	jal	bfc0111c <memset>
bfc00c18:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:30
    }

    write_segment(0x06);
bfc00c1c:	0ff0049a 	jal	bfc01268 <write_segment>
bfc00c20:	24040006 	li	a0,6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:33

    // call the actual function
    int result = _entry();
bfc00c24:	0ff002a6 	jal	bfc00a98 <_entry>
bfc00c28:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:34
    if (result == 0) {
bfc00c2c:	1440000a 	bnez	v0,bfc00c58 <_main+0xb4>
bfc00c30:	00402825 	move	a1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:35
        puts("Program exited normally.");
bfc00c34:	3c04bfc0 	lui	a0,0xbfc0
bfc00c38:	0ff00468 	jal	bfc011a0 <puts>
bfc00c3c:	24841340 	addiu	a0,a0,4928
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}
bfc00c40:	8fbf001c 	lw	ra,28(sp)
bfc00c44:	8fb10018 	lw	s1,24(sp)
bfc00c48:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:40
    write_segment(0x07);
bfc00c4c:	24040007 	li	a0,7
bfc00c50:	0bf0049a 	j	bfc01268 <write_segment>
bfc00c54:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:37
        printf("Program exited abnormally with code %d.\n", result);
bfc00c58:	3c04bfc0 	lui	a0,0xbfc0
bfc00c5c:	0ff00388 	jal	bfc00e20 <printf>
bfc00c60:	2484135c 	addiu	a0,a0,4956
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
}
bfc00c64:	1000fff7 	b	bfc00c44 <_main+0xa0>
bfc00c68:	8fbf001c 	lw	ra,28(sp)

bfc00c6c <print_trapframe>:
print_trapframe():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
bfc00c6c:	27bdffd0 	addiu	sp,sp,-48
bfc00c70:	afb30024 	sw	s3,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00c74:	3c13bfc0 	lui	s3,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
void print_trapframe(trapframe_t *tf) {
bfc00c78:	afb40028 	sw	s4,40(sp)
bfc00c7c:	afb20020 	sw	s2,32(sp)
bfc00c80:	afb1001c 	sw	s1,28(sp)
bfc00c84:	afb00018 	sw	s0,24(sp)
bfc00c88:	afbf002c 	sw	ra,44(sp)
bfc00c8c:	00808025 	move	s0,a0
bfc00c90:	24920028 	addiu	s2,a0,40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
bfc00c94:	24110001 	li	s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00c98:	26731388 	addiu	s3,s3,5000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
bfc00c9c:	24140020 	li	s4,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64 (discriminator 3)
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00ca0:	8e460000 	lw	a2,0(s2)
bfc00ca4:	02202825 	move	a1,s1
bfc00ca8:	02602025 	move	a0,s3
bfc00cac:	0ff00388 	jal	bfc00e20 <printf>
bfc00cb0:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63 (discriminator 3)
    for(int i = 1; i < 32; ++i) {
bfc00cb4:	1634fffa 	bne	s1,s4,bfc00ca0 <print_trapframe+0x34>
bfc00cb8:	26520004 	addiu	s2,s2,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:66
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
bfc00cbc:	8e020020 	lw	v0,32(s0)
bfc00cc0:	8e070018 	lw	a3,24(s0)
bfc00cc4:	afa20014 	sw	v0,20(sp)
bfc00cc8:	8e02001c 	lw	v0,28(s0)
bfc00ccc:	8e060014 	lw	a2,20(s0)
bfc00cd0:	8e050010 	lw	a1,16(s0)
bfc00cd4:	3c04bfc0 	lui	a0,0xbfc0
bfc00cd8:	afa20010 	sw	v0,16(sp)
bfc00cdc:	0ff00388 	jal	bfc00e20 <printf>
bfc00ce0:	2484139c 	addiu	a0,a0,5020
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:67
}
bfc00ce4:	8fbf002c 	lw	ra,44(sp)
bfc00ce8:	8fb40028 	lw	s4,40(sp)
bfc00cec:	8fb30024 	lw	s3,36(sp)
bfc00cf0:	8fb20020 	lw	s2,32(sp)
bfc00cf4:	8fb1001c 	lw	s1,28(sp)
bfc00cf8:	8fb00018 	lw	s0,24(sp)
bfc00cfc:	03e00008 	jr	ra
bfc00d00:	27bd0030 	addiu	sp,sp,48

bfc00d04 <print_tlb>:
print_tlb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69

void print_tlb() {
bfc00d04:	27bdffd8 	addiu	sp,sp,-40
bfc00d08:	afb1001c 	sw	s1,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc00d0c:	3c11bfc0 	lui	s1,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69
void print_tlb() {
bfc00d10:	afb20020 	sw	s2,32(sp)
bfc00d14:	afb00018 	sw	s0,24(sp)
bfc00d18:	afbf0024 	sw	ra,36(sp)
bfc00d1c:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc00d20:	263113d8 	addiu	s1,s1,5080
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
bfc00d24:	24120010 	li	s2,16
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:72 (discriminator 3)
        asm volatile(
bfc00d28:	40900000 	mtc0	s0,c0_index
bfc00d2c:	42000001 	tlbr
bfc00d30:	40065000 	mfc0	a2,c0_entryhi
bfc00d34:	40071000 	mfc0	a3,c0_entrylo0
bfc00d38:	40021800 	mfc0	v0,c0_entrylo1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81 (discriminator 3)
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc00d3c:	02002825 	move	a1,s0
bfc00d40:	afa20010 	sw	v0,16(sp)
bfc00d44:	02202025 	move	a0,s1
bfc00d48:	0ff00388 	jal	bfc00e20 <printf>
bfc00d4c:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70 (discriminator 3)
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
bfc00d50:	1612fff5 	bne	s0,s2,bfc00d28 <print_tlb+0x24>
bfc00d54:	8fbf0024 	lw	ra,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:83
    }
}
bfc00d58:	8fb20020 	lw	s2,32(sp)
bfc00d5c:	8fb1001c 	lw	s1,28(sp)
bfc00d60:	8fb00018 	lw	s0,24(sp)
bfc00d64:	03e00008 	jr	ra
bfc00d68:	27bd0028 	addiu	sp,sp,40

bfc00d6c <_exception_handler>:
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85

void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00d6c:	27bdffe0 	addiu	sp,sp,-32
bfc00d70:	afb10018 	sw	s1,24(sp)
bfc00d74:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00d78:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00d7c:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00d80:	248412b4 	addiu	a0,a0,4788
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00d84:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00d88:	0ff00468 	jal	bfc011a0 <puts>
bfc00d8c:	00a08025 	move	s0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:87
    if (assertion) {
bfc00d90:	12000012 	beqz	s0,bfc00ddc <_exception_handler+0x70>
bfc00d94:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:88
        puts("CPU internal assertion failed, abort.");
bfc00d98:	3c04bfc0 	lui	a0,0xbfc0
bfc00d9c:	0ff00468 	jal	bfc011a0 <puts>
bfc00da0:	24841410 	addiu	a0,a0,5136
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:89
        write_segment(0xdeaddead);
bfc00da4:	3c04dead 	lui	a0,0xdead
bfc00da8:	0ff0049a 	jal	bfc01268 <write_segment>
bfc00dac:	3484dead 	ori	a0,a0,0xdead
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:96
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
bfc00db0:	0ff0031b 	jal	bfc00c6c <print_trapframe>
bfc00db4:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:97
    print_tlb();
bfc00db8:	0ff00341 	jal	bfc00d04 <print_tlb>
bfc00dbc:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:99
    puts("*****System HANG*****");
}
bfc00dc0:	8fbf001c 	lw	ra,28(sp)
bfc00dc4:	8fb10018 	lw	s1,24(sp)
bfc00dc8:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:98
    puts("*****System HANG*****");
bfc00dcc:	3c04bfc0 	lui	a0,0xbfc0
bfc00dd0:	24841474 	addiu	a0,a0,5236
bfc00dd4:	0bf00468 	j	bfc011a0 <puts>
bfc00dd8:	27bd0020 	addiu	sp,sp,32
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
bfc00ddc:	40066800 	mfc0	a2,c0_cause
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:91
        word_t code = (_get_cause() >> 2) & 0xF;
bfc00de0:	00063082 	srl	a2,a2,0x2
bfc00de4:	30c6000f 	andi	a2,a2,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
bfc00de8:	3c03bfc0 	lui	v1,0xbfc0
bfc00dec:	00061080 	sll	v0,a2,0x2
bfc00df0:	24631700 	addiu	v1,v1,5888
bfc00df4:	00431021 	addu	v0,v0,v1
bfc00df8:	8c470000 	lw	a3,0(v0)
bfc00dfc:	3c04bfc0 	lui	a0,0xbfc0
_get_epc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:46
    asm(
bfc00e00:	40107000 	mfc0	s0,c0_epc
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
bfc00e04:	24841438 	addiu	a0,a0,5176
bfc00e08:	0ff00388 	jal	bfc00e20 <printf>
bfc00e0c:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:94
        write_led((uint16_t) epc);
bfc00e10:	0ff00495 	jal	bfc01254 <write_led>
bfc00e14:	3204ffff 	andi	a0,s0,0xffff
bfc00e18:	1000ffe5 	b	bfc00db0 <_exception_handler+0x44>
bfc00e1c:	00000000 	nop

bfc00e20 <printf>:
printf():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
int printf(const char *fmt, ...)
{
bfc00e20:	27bdffd0 	addiu	sp,sp,-48
bfc00e24:	afb00018 	sw	s0,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
bfc00e28:	27b00034 	addiu	s0,sp,52
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
{
bfc00e2c:	afb30024 	sw	s3,36(sp)
bfc00e30:	afb20020 	sw	s2,32(sp)
bfc00e34:	afb1001c 	sw	s1,28(sp)
bfc00e38:	afbf002c 	sw	ra,44(sp)
bfc00e3c:	afb40028 	sw	s4,40(sp)
bfc00e40:	00809025 	move	s2,a0
bfc00e44:	afa50034 	sw	a1,52(sp)
bfc00e48:	afa60038 	sw	a2,56(sp)
bfc00e4c:	afa7003c 	sw	a3,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	__builtin_va_start(ap, fmt);
bfc00e50:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10
	arg = ap;
	for (i = 0; fmt[i]; i++)
bfc00e54:	00008825 	move	s1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
				break;
			}
		}
		else
		{
			if (c == '\n')
bfc00e58:	2413000a 	li	s3,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 1)
	for (i = 0; fmt[i]; i++)
bfc00e5c:	02511021 	addu	v0,s2,s1
bfc00e60:	80540000 	lb	s4,0(v0)
bfc00e64:	1680000a 	bnez	s4,bfc00e90 <printf+0x70>
bfc00e68:	24020025 	li	v0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:85
				putchar('\r');
			putchar(c);
		}
	}
	return 0;
}
bfc00e6c:	8fbf002c 	lw	ra,44(sp)
bfc00e70:	8fb40028 	lw	s4,40(sp)
bfc00e74:	8fb30024 	lw	s3,36(sp)
bfc00e78:	8fb20020 	lw	s2,32(sp)
bfc00e7c:	8fb1001c 	lw	s1,28(sp)
bfc00e80:	8fb00018 	lw	s0,24(sp)
bfc00e84:	00001025 	move	v0,zero
bfc00e88:	03e00008 	jr	ra
bfc00e8c:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:13
		if (c == '%')
bfc00e90:	16820066 	bne	s4,v0,bfc0102c <printf+0x20c>
bfc00e94:	24050001 	li	a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00e98:	24060064 	li	a2,100
bfc00e9c:	24070025 	li	a3,37
bfc00ea0:	24080030 	li	t0,48
bfc00ea4:	02511021 	addu	v0,s2,s1
bfc00ea8:	80420001 	lb	v0,1(v0)
bfc00eac:	1046003a 	beq	v0,a2,bfc00f98 <printf+0x178>
bfc00eb0:	28430065 	slti	v1,v0,101
bfc00eb4:	10600018 	beqz	v1,bfc00f18 <printf+0xf8>
bfc00eb8:	2843003a 	slti	v1,v0,58
bfc00ebc:	1060000c 	beqz	v1,bfc00ef0 <printf+0xd0>
bfc00ec0:	28430031 	slti	v1,v0,49
bfc00ec4:	1060004d 	beqz	v1,bfc00ffc <printf+0x1dc>
bfc00ec8:	02512021 	addu	a0,s2,s1
bfc00ecc:	10470046 	beq	v0,a3,bfc00fe8 <printf+0x1c8>
bfc00ed0:	26340001 	addiu	s4,s1,1
bfc00ed4:	10480048 	beq	v0,t0,bfc00ff8 <printf+0x1d8>
bfc00ed8:	02542021 	addu	a0,s2,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:73
				putchar('%');
bfc00edc:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
bfc00ee0:	0ff00474 	jal	bfc011d0 <putchar>
bfc00ee4:	26310001 	addiu	s1,s1,1
bfc00ee8:	1000ffdd 	b	bfc00e60 <printf+0x40>
bfc00eec:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00ef0:	24030062 	li	v1,98
bfc00ef4:	10430036 	beq	v0,v1,bfc00fd0 <printf+0x1b0>
bfc00ef8:	26340001 	addiu	s4,s1,1
bfc00efc:	24030063 	li	v1,99
bfc00f00:	1443fff6 	bne	v0,v1,bfc00edc <printf+0xbc>
bfc00f04:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:25
				putchar((long)*arg);
bfc00f08:	0ff00474 	jal	bfc011d0 <putchar>
bfc00f0c:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc00f10:	10000017 	b	bfc00f70 <printf+0x150>
bfc00f14:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00f18:	24030070 	li	v1,112
bfc00f1c:	1043002f 	beq	v0,v1,bfc00fdc <printf+0x1bc>
bfc00f20:	28430071 	slti	v1,v0,113
bfc00f24:	10600008 	beqz	v1,bfc00f48 <printf+0x128>
bfc00f28:	24030075 	li	v1,117
bfc00f2c:	2403006c 	li	v1,108
bfc00f30:	10430020 	beq	v0,v1,bfc00fb4 <printf+0x194>
bfc00f34:	2403006f 	li	v1,111
bfc00f38:	1443ffe8 	bne	v0,v1,bfc00edc <printf+0xbc>
bfc00f3c:	00003825 	move	a3,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:45
				printbase((long)*arg, w, 8, 0);
bfc00f40:	10000017 	b	bfc00fa0 <printf+0x180>
bfc00f44:	24060008 	li	a2,8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00f48:	1043000d 	beq	v0,v1,bfc00f80 <printf+0x160>
bfc00f4c:	26340001 	addiu	s4,s1,1
bfc00f50:	24030078 	li	v1,120
bfc00f54:	10430021 	beq	v0,v1,bfc00fdc <printf+0x1bc>
bfc00f58:	24030073 	li	v1,115
bfc00f5c:	1443ffe0 	bne	v0,v1,bfc00ee0 <printf+0xc0>
bfc00f60:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:20
				putstring(*arg);
bfc00f64:	0ff00450 	jal	bfc01140 <putstring>
bfc00f68:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc00f6c:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
bfc00f70:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 2)
	for (i = 0; fmt[i]; i++)
bfc00f74:	26310001 	addiu	s1,s1,1
bfc00f78:	1000ffb9 	b	bfc00e60 <printf+0x40>
bfc00f7c:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:30
				printbase((long)*arg, w, 10, 0);
bfc00f80:	00003825 	move	a3,zero
bfc00f84:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
bfc00f88:	0ff00411 	jal	bfc01044 <printbase>
bfc00f8c:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc00f90:	1000fff7 	b	bfc00f70 <printf+0x150>
bfc00f94:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:35
				printbase((long)*arg, w, 10, 1);
bfc00f98:	24070001 	li	a3,1
bfc00f9c:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
bfc00fa0:	8e040000 	lw	a0,0(s0)
bfc00fa4:	0ff00411 	jal	bfc01044 <printbase>
bfc00fa8:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:59
				break;
bfc00fac:	1000fff1 	b	bfc00f74 <printf+0x154>
bfc00fb0:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:40
				printbase((long)*arg, w, 10, 0);
bfc00fb4:	8e040000 	lw	a0,0(s0)
bfc00fb8:	00003825 	move	a3,zero
bfc00fbc:	0ff00411 	jal	bfc01044 <printbase>
bfc00fc0:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:41
				arg++;
bfc00fc4:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:43
				break;
bfc00fc8:	1000ffea 	b	bfc00f74 <printf+0x154>
bfc00fcc:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
bfc00fd0:	00003825 	move	a3,zero
bfc00fd4:	1000ffec 	b	bfc00f88 <printf+0x168>
bfc00fd8:	24060002 	li	a2,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
bfc00fdc:	00003825 	move	a3,zero
bfc00fe0:	1000ffef 	b	bfc00fa0 <printf+0x180>
bfc00fe4:	24060010 	li	a2,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:61
				putchar('%');
bfc00fe8:	0ff00474 	jal	bfc011d0 <putchar>
bfc00fec:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
bfc00ff0:	1000ffe0 	b	bfc00f74 <printf+0x154>
bfc00ff4:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:65
				i++;
bfc00ff8:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:15 (discriminator 1)
			w = 1;
bfc00ffc:	00002825 	move	a1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:67 (discriminator 1)
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
bfc01000:	80830001 	lb	v1,1(a0)
bfc01004:	00928823 	subu	s1,a0,s2
bfc01008:	2462ffcf 	addiu	v0,v1,-49
bfc0100c:	304200ff 	andi	v0,v0,0xff
bfc01010:	2c420009 	sltiu	v0,v0,9
bfc01014:	1040ffa3 	beqz	v0,bfc00ea4 <printf+0x84>
bfc01018:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:68 (discriminator 3)
					w = w * 10 + (fmt[i + 1] - '0');
bfc0101c:	70b31002 	mul	v0,a1,s3
bfc01020:	2463ffd0 	addiu	v1,v1,-48
bfc01024:	1000fff6 	b	bfc01000 <printf+0x1e0>
bfc01028:	00432821 	addu	a1,v0,v1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
			if (c == '\n')
bfc0102c:	16930003 	bne	s4,s3,bfc0103c <printf+0x21c>
bfc01030:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:80
				putchar('\r');
bfc01034:	0ff00474 	jal	bfc011d0 <putchar>
bfc01038:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
bfc0103c:	1000ffa8 	b	bfc00ee0 <printf+0xc0>
bfc01040:	02802025 	move	a0,s4

bfc01044 <printbase>:
printbase():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2
int printbase(long v,int w,int base,int sign)
{
bfc01044:	27bdff98 	addiu	sp,sp,-104
bfc01048:	afb40060 	sw	s4,96(sp)
bfc0104c:	afb3005c 	sw	s3,92(sp)
bfc01050:	afbf0064 	sw	ra,100(sp)
bfc01054:	afb20058 	sw	s2,88(sp)
bfc01058:	afb10054 	sw	s1,84(sp)
bfc0105c:	afb00050 	sw	s0,80(sp)
bfc01060:	00a09825 	move	s3,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
bfc01064:	10e00018 	beqz	a3,bfc010c8 <printbase+0x84>
bfc01068:	00c0a025 	move	s4,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7 (discriminator 1)
bfc0106c:	04810004 	bgez	a0,bfc01080 <printbase+0x3c>
bfc01070:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:9
	{
	value = -v;
bfc01074:	00048023 	negu	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:10
	putchar('-');
bfc01078:	0ff00474 	jal	bfc011d0 <putchar>
bfc0107c:	2404002d 	li	a0,45
bfc01080:	27b10010 	addiu	s1,sp,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2 (discriminator 1)
{
bfc01084:	02201025 	move	v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:14 (discriminator 1)
	}
	else value=v;

	for(i=0;value;i++)
bfc01088:	16000011 	bnez	s0,bfc010d0 <printbase+0x8c>
bfc0108c:	00519023 	subu	s2,v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22
	value=value/base;
	}

#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
bfc01090:	0272802a 	slt	s0,s3,s2
bfc01094:	0250980b 	movn	s3,s2,s0
bfc01098:	02608025 	move	s0,s3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22 (discriminator 2)
bfc0109c:	16000013 	bnez	s0,bfc010ec <printbase+0xa8>
bfc010a0:	0250102a 	slt	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:28
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}
bfc010a4:	8fbf0064 	lw	ra,100(sp)
bfc010a8:	8fb40060 	lw	s4,96(sp)
bfc010ac:	8fb3005c 	lw	s3,92(sp)
bfc010b0:	8fb20058 	lw	s2,88(sp)
bfc010b4:	8fb10054 	lw	s1,84(sp)
bfc010b8:	8fb00050 	lw	s0,80(sp)
bfc010bc:	00001025 	move	v0,zero
bfc010c0:	03e00008 	jr	ra
bfc010c4:	27bd0068 	addiu	sp,sp,104
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:12
	else value=v;
bfc010c8:	1000ffed 	b	bfc01080 <printbase+0x3c>
bfc010cc:	00808025 	move	s0,a0
bfc010d0:	0214001b 	divu	zero,s0,s4
bfc010d4:	028001f4 	teq	s4,zero,0x7
bfc010d8:	24420001 	addiu	v0,v0,1
bfc010dc:	00002010 	mfhi	a0
bfc010e0:	00008012 	mflo	s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:16 (discriminator 3)
	buf[i]=value%base;
bfc010e4:	1000ffe8 	b	bfc01088 <printbase+0x44>
bfc010e8:	a044ffff 	sb	a0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24
		c=j>i?0:buf[j-1];
bfc010ec:	14400006 	bnez	v0,bfc01108 <printbase+0xc4>
bfc010f0:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24 (discriminator 1)
bfc010f4:	02301021 	addu	v0,s1,s0
bfc010f8:	8042ffff 	lb	v0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 1)
		putchar((c<=9)?c+'0':c-0xa+'a');
bfc010fc:	2843000a 	slti	v1,v0,10
bfc01100:	10600002 	beqz	v1,bfc0110c <printbase+0xc8>
bfc01104:	24440057 	addiu	a0,v0,87
bfc01108:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 4)
bfc0110c:	0ff00474 	jal	bfc011d0 <putchar>
bfc01110:	2610ffff 	addiu	s0,s0,-1
bfc01114:	1000ffe1 	b	bfc0109c <printbase+0x58>
bfc01118:	00000000 	nop

bfc0111c <memset>:
memset():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:273
 * @n:      number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
bfc0111c:	00801025 	move	v0,a0
bfc01120:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:277
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memset(s, c, n);
#else
    char *p = s;
bfc01124:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:278
    while (n -- > 0) {
bfc01128:	14660003 	bne	v1,a2,bfc01138 <memset+0x1c>
bfc0112c:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:283
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
bfc01130:	03e00008 	jr	ra
bfc01134:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:279
        *p ++ = c;
bfc01138:	1000fffb 	b	bfc01128 <memset+0xc>
bfc0113c:	a065ffff 	sb	a1,-1(v1)

bfc01140 <putstring>:
putstring():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:2
int putstring(const char *s)
{
bfc01140:	27bdffe0 	addiu	sp,sp,-32
bfc01144:	afb20018 	sw	s2,24(sp)
bfc01148:	afb10014 	sw	s1,20(sp)
bfc0114c:	afbf001c 	sw	ra,28(sp)
bfc01150:	afb00010 	sw	s0,16(sp)
bfc01154:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
    char c;
    while ((c = *s))
    {
        if (c == '\n')
bfc01158:	2412000a 	li	s2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:4
    while ((c = *s))
bfc0115c:	82300000 	lb	s0,0(s1)
bfc01160:	16000007 	bnez	s0,bfc01180 <putstring+0x40>
bfc01164:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:12
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
bfc01168:	8fb20018 	lw	s2,24(sp)
bfc0116c:	8fb10014 	lw	s1,20(sp)
bfc01170:	8fb00010 	lw	s0,16(sp)
bfc01174:	00001025 	move	v0,zero
bfc01178:	03e00008 	jr	ra
bfc0117c:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
        if (c == '\n')
bfc01180:	16120003 	bne	s0,s2,bfc01190 <putstring+0x50>
bfc01184:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:7
            putchar('\r');
bfc01188:	0ff00474 	jal	bfc011d0 <putchar>
bfc0118c:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:8
        putchar(c);
bfc01190:	0ff00474 	jal	bfc011d0 <putchar>
bfc01194:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:9
        s++;
bfc01198:	1000fff0 	b	bfc0115c <putstring+0x1c>
bfc0119c:	26310001 	addiu	s1,s1,1

bfc011a0 <puts>:
puts():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:15

int puts(const char *s)
{
bfc011a0:	27bdffe8 	addiu	sp,sp,-24
bfc011a4:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:16
    putstring(s);
bfc011a8:	0ff00450 	jal	bfc01140 <putstring>
bfc011ac:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:17
    putchar('\r');
bfc011b0:	0ff00474 	jal	bfc011d0 <putchar>
bfc011b4:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:18
    putchar('\n');
bfc011b8:	0ff00474 	jal	bfc011d0 <putchar>
bfc011bc:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:20
    return 0;
}
bfc011c0:	8fbf0014 	lw	ra,20(sp)
bfc011c4:	00001025 	move	v0,zero
bfc011c8:	03e00008 	jr	ra
bfc011cc:	27bd0018 	addiu	sp,sp,24

bfc011d0 <putchar>:
putchar():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:4
#include <machine.h>

int putchar(int c)
{
bfc011d0:	27bdffe8 	addiu	sp,sp,-24
bfc011d4:	afb00010 	sw	s0,16(sp)
bfc011d8:	00808025 	move	s0,a0
bfc011dc:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:5
	write_serial((byte_t) c);
bfc011e0:	0ff0048d 	jal	bfc01234 <write_serial>
bfc011e4:	308400ff 	andi	a0,a0,0xff
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:7
	return c;
bfc011e8:	8fbf0014 	lw	ra,20(sp)
bfc011ec:	02001025 	move	v0,s0
bfc011f0:	8fb00010 	lw	s0,16(sp)
bfc011f4:	03e00008 	jr	ra
bfc011f8:	27bd0018 	addiu	sp,sp,24

bfc011fc <init_serial>:
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
}

template<typename T>
void write(void *addr, T data){
    auto *ptr = reinterpret_cast<volatile T *>(addr);
    *ptr = data;
bfc011fc:	3c02bfd0 	lui	v0,0xbfd0
bfc01200:	2403ff81 	li	v1,-127
bfc01204:	a0433008 	sb	v1,12296(v0)
bfc01208:	2403ff80 	li	v1,-128
bfc0120c:	a043300c 	sb	v1,12300(v0)
bfc01210:	24030036 	li	v1,54
bfc01214:	a0433000 	sb	v1,12288(v0)
bfc01218:	24030003 	li	v1,3
bfc0121c:	a0403004 	sb	zero,12292(v0)
bfc01220:	a043300c 	sb	v1,12300(v0)
bfc01224:	a0403010 	sb	zero,12304(v0)
bfc01228:	a0403004 	sb	zero,12292(v0)
init_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:45
	write_byte(UART_LCR_ADDR, ~0x80 & 0x03);
	// disable modem controls
	write_byte(UART_MCR_ADDR, 0);
	// disable interrupts
	write_byte(UART_IER_ADDR, 0);
}
bfc0122c:	03e00008 	jr	ra
bfc01230:	00000000 	nop

bfc01234 <write_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
bfc01234:	3c03bfd0 	lui	v1,0xbfd0
bfc01238:	90623014 	lbu	v0,12308(v1)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:53
	while (!(read_byte(UART_LSR_ADDR) & 0x01));
	return read_byte(UART_DAT_ADDR);
}

void write_serial(byte_t data){
	while (!(read_byte(UART_LSR_ADDR) & 0x40));
bfc0123c:	30420040 	andi	v0,v0,0x40
bfc01240:	1040fffd 	beqz	v0,bfc01238 <write_serial+0x4>
bfc01244:	3c02bfd0 	lui	v0,0xbfd0
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc01248:	a0443000 	sb	a0,12288(v0)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:55
	write_byte(UART_DAT_ADDR, data);
}
bfc0124c:	03e00008 	jr	ra
bfc01250:	00000000 	nop

bfc01254 <write_led>:
_Z5writeItEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc01254:	3c02bff0 	lui	v0,0xbff0
bfc01258:	3442f000 	ori	v0,v0,0xf000
bfc0125c:	a4440000 	sh	a0,0(v0)
write_led():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:68
	return word;
}

void write_led(hword_t data){
	write_hword(LED_ADDR, data);
}
bfc01260:	03e00008 	jr	ra
bfc01264:	00000000 	nop

bfc01268 <write_segment>:
_Z5writeIjEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc01268:	3c02bff0 	lui	v0,0xbff0
bfc0126c:	3442f010 	ori	v0,v0,0xf010
bfc01270:	ac440000 	sw	a0,0(v0)
write_segment():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:72

void write_segment(word_t data){
	write_word(NUM_ADDR, data);
}
bfc01274:	03e00008 	jr	ra
bfc01278:	00000000 	nop
bfc0127c:	74736554 	jalx	b1cd9550 <_mem_end+0x29cc9550>
bfc01280:	20676e69 	addi	a3,v1,28265
bfc01284:	6f6d656d 	0x6f6d656d
bfc01288:	62207972 	0x62207972
bfc0128c:	6f772079 	0x6f772079
bfc01290:	0a216472 	j	b88591c8 <_mem_end+0x308491c8>
bfc01294:	00000000 	nop
bfc01298:	74736554 	jalx	b1cd9550 <_mem_end+0x29cc9550>
bfc0129c:	20676e69 	addi	a3,v1,28265
bfc012a0:	6f6d656d 	0x6f6d656d
bfc012a4:	62207972 	0x62207972
bfc012a8:	79622079 	0x79622079
bfc012ac:	0a216574 	j	b88595d0 <_mem_end+0x308495d0>
bfc012b0:	00000000 	nop
bfc012b4:	2a2a2a2a 	slti	t2,s1,10794
bfc012b8:	6972542a 	0x6972542a
bfc012bc:	6c616976 	0x6c616976
bfc012c0:	5350494d 	beql	k0,s0,bfc137f8 <_text_end+0x12060>
bfc012c4:	72614220 	0x72614220
bfc012c8:	654d2065 	0x654d2065
bfc012cc:	206c6174 	addi	t4,v1,24948
bfc012d0:	74737953 	jalx	b1cde54c <_mem_end+0x29cce54c>
bfc012d4:	2a2a6d65 	slti	t2,s1,28005
bfc012d8:	002a2a2a 	0x2a2a2a
bfc012dc:	706d6f43 	0x706d6f43
bfc012e0:	74616c69 	jalx	b185b1a4 <_mem_end+0x2984b1a4>
bfc012e4:	206e6f69 	addi	t6,v1,28521
bfc012e8:	656d6974 	0x656d6974
bfc012ec:	3931203a 	xori	s1,t1,0x203a
bfc012f0:	3a34313a 	xori	s4,s1,0x313a
bfc012f4:	44203635 	0x44203635
bfc012f8:	31206365 	andi	zero,t1,0x6365
bfc012fc:	30322035 	andi	s2,at,0x2035
bfc01300:	00003931 	tgeu	zero,zero,0xe4
bfc01304:	6c6c6946 	0x6c6c6946
bfc01308:	20676e69 	addi	a3,v1,28265
bfc0130c:	7373622e 	0x7373622e
bfc01310:	63657320 	0x63657320
bfc01314:	6e6f6974 	0x6e6f6974
bfc01318:	74697720 	jalx	b1a5dc80 <_mem_end+0x29a4dc80>
bfc0131c:	2c302068 	sltiu	s0,at,8296
bfc01320:	66666f20 	0x66666f20
bfc01324:	3a746573 	xori	s4,s3,0x6573
bfc01328:	25783020 	addiu	t8,t3,12320
bfc0132c:	73202c78 	0x73202c78
bfc01330:	3a657a69 	xori	a1,s3,0x7a69
bfc01334:	20642520 	addi	a0,v1,9504
bfc01338:	65747962 	0x65747962
bfc0133c:	000a2e73 	tltu	zero,t2,0xb9
bfc01340:	676f7250 	0x676f7250
bfc01344:	206d6172 	addi	t5,v1,24946
bfc01348:	74697865 	jalx	b1a5e194 <_mem_end+0x29a4e194>
bfc0134c:	6e206465 	0x6e206465
bfc01350:	616d726f 	0x616d726f
bfc01354:	2e796c6c 	sltiu	t9,s3,27756
bfc01358:	00000000 	nop
bfc0135c:	676f7250 	0x676f7250
bfc01360:	206d6172 	addi	t5,v1,24946
bfc01364:	74697865 	jalx	b1a5e194 <_mem_end+0x29a4e194>
bfc01368:	61206465 	0x61206465
bfc0136c:	726f6e62 	0x726f6e62
bfc01370:	6c6c616d 	0x6c6c616d
bfc01374:	69772079 	0x69772079
bfc01378:	63206874 	0x63206874
bfc0137c:	2065646f 	addi	a1,v1,25711
bfc01380:	0a2e6425 	j	b8b99094 <_mem_end+0x30b89094>
bfc01384:	00000000 	nop
bfc01388:	69676552 	0x69676552
bfc0138c:	72657473 	0x72657473
bfc01390:	64252420 	0x64252420
bfc01394:	7025203a 	0x7025203a
bfc01398:	0000000a 	movz	zero,zero,zero
bfc0139c:	3a435045 	xori	v1,s2,0x5045
bfc013a0:	2c702520 	sltiu	s0,v1,9504
bfc013a4:	75614320 	jalx	b5850c80 <_mem_end+0x2d840c80>
bfc013a8:	203a6573 	addi	k0,at,25971
bfc013ac:	202c7025 	addi	t4,at,28709
bfc013b0:	74617453 	jalx	b185d14c <_mem_end+0x2984d14c>
bfc013b4:	203a7375 	addi	k0,at,29557
bfc013b8:	202c7025 	addi	t4,at,28709
bfc013bc:	56646142 	bnel	s3,a0,bfc198c8 <_text_end+0x18130>
bfc013c0:	72646441 	0x72646441
bfc013c4:	7025203a 	0x7025203a
bfc013c8:	4245202c 	c0	0x45202c
bfc013cc:	3a657361 	xori	a1,s3,0x7361
bfc013d0:	0a702520 	j	b9c09480 <_mem_end+0x31bf9480>
bfc013d4:	00000000 	nop
bfc013d8:	20424c54 	addi	v0,v0,19540
bfc013dc:	6d657469 	0x6d657469
bfc013e0:	3a642520 	xori	a0,s3,0x2520
bfc013e4:	746e4520 	jalx	b1b91480 <_mem_end+0x29b81480>
bfc013e8:	69487972 	0x69487972
bfc013ec:	2c702520 	sltiu	s0,v1,9504
bfc013f0:	746e4520 	jalx	b1b91480 <_mem_end+0x29b81480>
bfc013f4:	6f4c7972 	0x6f4c7972
bfc013f8:	25203a31 	addiu	zero,t1,14897
bfc013fc:	45202c70 	0x45202c70
bfc01400:	7972746e 	0x7972746e
bfc01404:	3a326f4c 	xori	s2,s1,0x6f4c
bfc01408:	0a702520 	j	b9c09480 <_mem_end+0x31bf9480>
bfc0140c:	00000000 	nop
bfc01410:	20555043 	addi	s5,v0,20547
bfc01414:	65746e69 	0x65746e69
bfc01418:	6c616e72 	0x6c616e72
bfc0141c:	73736120 	0x73736120
bfc01420:	69747265 	0x69747265
bfc01424:	66206e6f 	0x66206e6f
bfc01428:	656c6961 	0x656c6961
bfc0142c:	61202c64 	0x61202c64
bfc01430:	74726f62 	jalx	b1c9bd88 <_mem_end+0x29c8bd88>
bfc01434:	0000002e 	0x2e
bfc01438:	65206e41 	0x65206e41
bfc0143c:	70656378 	0x70656378
bfc01440:	6e6f6974 	0x6e6f6974
bfc01444:	63636f20 	0x63636f20
bfc01448:	65727275 	0x65727275
bfc0144c:	77202c64 	jalx	bc80b190 <_mem_end+0x347fb190>
bfc01450:	20687469 	addi	t0,v1,29801
bfc01454:	20435045 	addi	v1,v0,20549
bfc01458:	78257830 	0x78257830
bfc0145c:	646e6120 	0x646e6120
bfc01460:	75614320 	jalx	b5850c80 <_mem_end+0x2d840c80>
bfc01464:	25206573 	addiu	zero,t1,25971
bfc01468:	25282064 	addiu	t0,t1,8292
bfc0146c:	0a2e2973 	j	b8b8a5cc <_mem_end+0x30b7a5cc>
bfc01470:	00000000 	nop
bfc01474:	2a2a2a2a 	slti	t2,s1,10794
bfc01478:	7379532a 	0x7379532a
bfc0147c:	206d6574 	addi	t5,v1,25972
bfc01480:	474e4148 	c1	0x14e4148
bfc01484:	2a2a2a2a 	slti	t2,s1,10794
bfc01488:	0000002a 	slt	zero,zero,zero
bfc0148c:	65746e49 	0x65746e49
bfc01490:	70757272 	0x70757272
bfc01494:	00000074 	teq	zero,zero,0x1
bfc01498:	20424c54 	addi	v0,v0,19540
bfc0149c:	69646f6d 	0x69646f6d
bfc014a0:	61636966 	0x61636966
bfc014a4:	6e6f6974 	0x6e6f6974
bfc014a8:	63786520 	0x63786520
bfc014ac:	69747065 	0x69747065
bfc014b0:	00006e6f 	0x6e6f
bfc014b4:	20424c54 	addi	v0,v0,19540
bfc014b8:	65637865 	0x65637865
bfc014bc:	6f697470 	0x6f697470
bfc014c0:	6c28206e 	0x6c28206e
bfc014c4:	2064616f 	addi	a0,v1,24943
bfc014c8:	6920726f 	0x6920726f
bfc014cc:	7274736e 	0x7274736e
bfc014d0:	69746375 	0x69746375
bfc014d4:	66206e6f 	0x66206e6f
bfc014d8:	68637465 	0x68637465
bfc014dc:	00000029 	0x29
bfc014e0:	20424c54 	addi	v0,v0,19540
bfc014e4:	65637865 	0x65637865
bfc014e8:	6f697470 	0x6f697470
bfc014ec:	7328206e 	0x7328206e
bfc014f0:	65726f74 	0x65726f74
bfc014f4:	00000029 	0x29
bfc014f8:	72646441 	0x72646441
bfc014fc:	20737365 	addi	s3,v1,29541
bfc01500:	6f727265 	0x6f727265
bfc01504:	78652072 	0x78652072
bfc01508:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc0150c:	206e6f69 	addi	t6,v1,28521
bfc01510:	616f6c28 	0x616f6c28
bfc01514:	726f2064 	0x726f2064
bfc01518:	736e6920 	0x736e6920
bfc0151c:	63757274 	0x63757274
bfc01520:	6e6f6974 	0x6e6f6974
bfc01524:	74656620 	jalx	b1959880 <_mem_end+0x29949880>
bfc01528:	00296863 	0x296863
bfc0152c:	72646441 	0x72646441
bfc01530:	20737365 	addi	s3,v1,29541
bfc01534:	6f727265 	0x6f727265
bfc01538:	78652072 	0x78652072
bfc0153c:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc01540:	206e6f69 	addi	t6,v1,28521
bfc01544:	6f747328 	0x6f747328
bfc01548:	00296572 	tlt	at,t1,0x195
bfc0154c:	20737542 	addi	s3,v1,30018
bfc01550:	6f727265 	0x6f727265
bfc01554:	78652072 	0x78652072
bfc01558:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc0155c:	206e6f69 	addi	t6,v1,28521
bfc01560:	736e6928 	0x736e6928
bfc01564:	63757274 	0x63757274
bfc01568:	6e6f6974 	0x6e6f6974
bfc0156c:	74656620 	jalx	b1959880 <_mem_end+0x29949880>
bfc01570:	00296863 	0x296863
bfc01574:	20737542 	addi	s3,v1,30018
bfc01578:	6f727265 	0x6f727265
bfc0157c:	78652072 	0x78652072
bfc01580:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc01584:	206e6f69 	addi	t6,v1,28521
bfc01588:	74616428 	jalx	b18590a0 <_mem_end+0x298490a0>
bfc0158c:	65722061 	0x65722061
bfc01590:	65726566 	0x65726566
bfc01594:	3a65636e 	xori	a1,s3,0x636e
bfc01598:	616f6c20 	0x616f6c20
bfc0159c:	726f2064 	0x726f2064
bfc015a0:	6f747320 	0x6f747320
bfc015a4:	00296572 	tlt	at,t1,0x195
bfc015a8:	63737953 	0x63737953
bfc015ac:	206c6c61 	addi	t4,v1,27745
bfc015b0:	65637865 	0x65637865
bfc015b4:	6f697470 	0x6f697470
bfc015b8:	0000006e 	0x6e
bfc015bc:	61657242 	0x61657242
bfc015c0:	696f706b 	0x696f706b
bfc015c4:	6520746e 	0x6520746e
bfc015c8:	70656378 	0x70656378
bfc015cc:	6e6f6974 	0x6e6f6974
bfc015d0:	00000000 	nop
bfc015d4:	65736552 	0x65736552
bfc015d8:	64657672 	0x64657672
bfc015dc:	736e6920 	0x736e6920
bfc015e0:	63757274 	0x63757274
bfc015e4:	6e6f6974 	0x6e6f6974
bfc015e8:	63786520 	0x63786520
bfc015ec:	69747065 	0x69747065
bfc015f0:	00006e6f 	0x6e6f
bfc015f4:	72706f43 	0x72706f43
bfc015f8:	7365636f 	0x7365636f
bfc015fc:	20726f73 	addi	s2,v1,28531
bfc01600:	73756e55 	0x73756e55
bfc01604:	656c6261 	0x656c6261
bfc01608:	63786520 	0x63786520
bfc0160c:	69747065 	0x69747065
bfc01610:	00006e6f 	0x6e6f
bfc01614:	74697241 	jalx	b1a5c904 <_mem_end+0x29a4c904>
bfc01618:	74656d68 	jalx	b195b5a0 <_mem_end+0x2994b5a0>
bfc0161c:	4f206369 	c3	0x1206369
bfc01620:	66726576 	0x66726576
bfc01624:	20776f6c 	addi	s7,v1,28524
bfc01628:	65637865 	0x65637865
bfc0162c:	6f697470 	0x6f697470
bfc01630:	0000006e 	0x6e
bfc01634:	70617254 	0x70617254
bfc01638:	63786520 	0x63786520
bfc0163c:	69747065 	0x69747065
bfc01640:	00006e6f 	0x6e6f
bfc01644:	2041534d 	addi	at,v0,21325
bfc01648:	616f6c46 	0x616f6c46
bfc0164c:	676e6974 	0x676e6974
bfc01650:	696f502d 	0x696f502d
bfc01654:	6520746e 	0x6520746e
bfc01658:	70656378 	0x70656378
bfc0165c:	6e6f6974 	0x6e6f6974
bfc01660:	00000000 	nop
bfc01664:	20424c54 	addi	v0,v0,19540
bfc01668:	64616552 	0x64616552
bfc0166c:	686e492d 	0x686e492d
bfc01670:	74696269 	jalx	b1a589a4 <_mem_end+0x29a489a4>
bfc01674:	63786520 	0x63786520
bfc01678:	69747065 	0x69747065
bfc0167c:	00006e6f 	0x6e6f
bfc01680:	20424c54 	addi	v0,v0,19540
bfc01684:	63657845 	0x63657845
bfc01688:	6f697475 	0x6f697475
bfc0168c:	6e492d6e 	0x6e492d6e
bfc01690:	69626968 	0x69626968
bfc01694:	78652074 	0x78652074
bfc01698:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc0169c:	006e6f69 	0x6e6f69
bfc016a0:	43544157 	c0	0x1544157
bfc016a4:	00000048 	0x48
bfc016a8:	6863614d 	0x6863614d
bfc016ac:	20656e69 	addi	a1,v1,28265
bfc016b0:	63656863 	0x63656863
bfc016b4:	0000006b 	0x6b
bfc016b8:	65726854 	0x65726854
bfc016bc:	41206461 	0x41206461
bfc016c0:	636f6c6c 	0x636f6c6c
bfc016c4:	6f697461 	0x6f697461
bfc016c8:	44202c6e 	0x44202c6e
bfc016cc:	6c6c6165 	0x6c6c6165
bfc016d0:	7461636f 	jalx	b1858dbc <_mem_end+0x29848dbc>
bfc016d4:	2c6e6f69 	sltiu	t6,v1,28521
bfc016d8:	20726f20 	addi	s2,v1,28448
bfc016dc:	65686353 	0x65686353
bfc016e0:	696c7564 	0x696c7564
bfc016e4:	4520676e 	0x4520676e
bfc016e8:	70656378 	0x70656378
bfc016ec:	6e6f6974 	0x6e6f6974
bfc016f0:	00000073 	tltu	zero,zero,0x1
bfc016f4:	68636143 	0x68636143
bfc016f8:	72652065 	0x72652065
bfc016fc:	00726f72 	tlt	v1,s2,0x1bd

bfc01700 <EXCEPTION_MESSAGES>:
bfc01700:	bfc0148c 	cache	0x0,5260(s8)
bfc01704:	bfc01498 	cache	0x0,5272(s8)
bfc01708:	bfc014b4 	cache	0x0,5300(s8)
bfc0170c:	bfc014e0 	cache	0x0,5344(s8)
bfc01710:	bfc014f8 	cache	0x0,5368(s8)
bfc01714:	bfc0152c 	cache	0x0,5420(s8)
bfc01718:	bfc0154c 	cache	0x0,5452(s8)
bfc0171c:	bfc01574 	cache	0x0,5492(s8)
bfc01720:	bfc015a8 	cache	0x0,5544(s8)
bfc01724:	bfc015bc 	cache	0x0,5564(s8)
bfc01728:	bfc015d4 	cache	0x0,5588(s8)
bfc0172c:	bfc015f4 	cache	0x0,5620(s8)
bfc01730:	bfc01614 	cache	0x0,5652(s8)
bfc01734:	bfc01634 	cache	0x0,5684(s8)
bfc01738:	bfc01644 	cache	0x0,5700(s8)
bfc0173c:	bfc01648 	cache	0x0,5704(s8)
bfc01740:	bfc01294 	cache	0x0,4756(s8)
bfc01744:	bfc01294 	cache	0x0,4756(s8)
bfc01748:	bfc01294 	cache	0x0,4756(s8)
bfc0174c:	bfc01664 	cache	0x0,5732(s8)
bfc01750:	bfc01680 	cache	0x0,5760(s8)
bfc01754:	bfc01294 	cache	0x0,4756(s8)
bfc01758:	bfc01294 	cache	0x0,4756(s8)
bfc0175c:	bfc016a0 	cache	0x0,5792(s8)
bfc01760:	bfc016a8 	cache	0x0,5800(s8)
bfc01764:	bfc016b8 	cache	0x0,5816(s8)
bfc01768:	bfc01294 	cache	0x0,4756(s8)
bfc0176c:	bfc01294 	cache	0x0,4756(s8)
bfc01770:	bfc01294 	cache	0x0,4756(s8)
bfc01774:	bfc01294 	cache	0x0,4756(s8)
bfc01778:	bfc016f4 	cache	0x0,5876(s8)
bfc0177c:	bfc01294 	cache	0x0,4756(s8)
bfc01780:	01200000 	0x1200000
bfc01784:	02000101 	0x2000101
	...
bfc01790:	00000001 	movf	zero,zero,$fcc0
bfc01794:	00000000 	nop

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
       0:	00004854 	0x4854
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	00000004 	sllv	zero,zero,zero
       8:	01040000 	0x1040000
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
       c:	00001361 	0x1361
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	000bf304 	0xbf304
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	0011df00 	sll	k1,s1,0x1c
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	00061800 	sll	v1,a2,0x0
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	07040200 	0x7040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	000006bc 	0x6bc
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	00002503 	sra	a0,zero,0x14
      30:	07040200 	0x7040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	000006b7 	0x6b7
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	00028904 	0x28904
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	ad580100 	sw	t8,256(t2)
      40:	05000016 	bltz	t0,9c <_mem_avail_start-0x7fffff64>
      44:	00001695 	0x1695
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
#else
    const char *s = src;
    char *d = dst;
    if (s < d && s + n > d) {
        s += n, d += n;
        while (n -- > 0) {
      48:	505a0101 	beql	v0,k0,450 <_mem_avail_start-0x7ffffbb0>
      4c:	06000001 	bltz	s0,54 <_mem_avail_start-0x7fffffac>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	5a010049 	0x5a010049
      54:	00002507 	0x2507
      58:	00000400 	sll	zero,zero,0x10
      5c:	25070000 	addiu	a3,t0,0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
        }
    } else {
        while (n -- > 0) {
            *d ++ = *s ++;
      60:	04000000 	bltz	zero,64 <_mem_avail_start-0x7fffff9c>
      64:	00000001 	movf	zero,zero,$fcc0
      68:	00002507 	0x2507
      6c:	00020400 	sll	zero,v0,0x10
      70:	25070000 	addiu	a3,t0,0
      74:	04000000 	bltz	zero,78 <_mem_avail_start-0x7fffff88>
      78:	00000003 	sra	zero,zero,0x0
      7c:	00002507 	0x2507
      80:	00040400 	sll	zero,a0,0x10
      84:	25070000 	addiu	a3,t0,0
      88:	04000000 	bltz	zero,8c <_mem_avail_start-0x7fffff74>
      8c:	00000005 	0x5
      90:	00002507 	0x2507
      94:	00060400 	sll	zero,a2,0x10
      98:	25070000 	addiu	a3,t0,0
      9c:	04000000 	bltz	zero,a0 <_mem_avail_start-0x7fffff60>
      a0:	00000007 	srav	zero,zero,zero
      a4:	00002507 	0x2507
      a8:	00080400 	sll	zero,t0,0x10
      ac:	25070000 	addiu	a3,t0,0
      b0:	04000000 	bltz	zero,b4 <_mem_avail_start-0x7fffff4c>
      b4:	00000009 	jalr	zero,zero
      b8:	00002507 	0x2507
      bc:	000a0400 	sll	zero,t2,0x10
      c0:	25070000 	addiu	a3,t0,0
      c4:	04000000 	bltz	zero,c8 <_mem_avail_start-0x7fffff38>
      c8:	0000000b 	movn	zero,zero,zero
      cc:	00002507 	0x2507
      d0:	000c0400 	sll	zero,t4,0x10
      d4:	25070000 	addiu	a3,t0,0
      d8:	04000000 	bltz	zero,dc <_mem_avail_start-0x7fffff24>
      dc:	0000000d 	break
      e0:	00002507 	0x2507
      e4:	000e0400 	sll	zero,t6,0x10
      e8:	25070000 	addiu	a3,t0,0
      ec:	04000000 	bltz	zero,f0 <_mem_avail_start-0x7fffff10>
      f0:	0000000f 	sync
      f4:	00002507 	0x2507
      f8:	00100400 	sll	zero,s0,0x10
      fc:	25070000 	addiu	a3,t0,0
     100:	04000000 	bltz	zero,104 <_mem_avail_start-0x7ffffefc>
     104:	00000011 	mthi	zero
     108:	00002507 	0x2507
     10c:	00120400 	sll	zero,s2,0x10
     110:	25070000 	addiu	a3,t0,0
     114:	04000000 	bltz	zero,118 <_mem_avail_start-0x7ffffee8>
     118:	00000013 	mtlo	zero
     11c:	00002507 	0x2507
     120:	00140400 	sll	zero,s4,0x10
     124:	25070000 	addiu	a3,t0,0
     128:	04000000 	bltz	zero,12c <_mem_avail_start-0x7ffffed4>
     12c:	00000015 	0x15
     130:	00002507 	0x2507
     134:	00160400 	sll	zero,s6,0x10
     138:	25070000 	addiu	a3,t0,0
     13c:	04000000 	bltz	zero,140 <_mem_avail_start-0x7ffffec0>
     140:	00000017 	0x17
     144:	00002507 	0x2507
     148:	00180400 	sll	zero,t8,0x10
     14c:	00000000 	nop
     150:	00012805 	0x12805
     154:	5a010100 	0x5a010100
     158:	00000195 	0x195
     15c:	01004906 	0x1004906
     160:	0025075a 	0x25075a
     164:	00040000 	sll	zero,a0,0x0
     168:	07000000 	bltz	t8,16c <_mem_avail_start-0x7ffffe94>
     16c:	00000025 	move	zero,zero
     170:	00000104 	0x104
     174:	00250700 	0x250700
     178:	02040000 	0x2040000
     17c:	07000000 	bltz	t8,180 <_mem_avail_start-0x7ffffe80>
     180:	00000025 	move	zero,zero
     184:	00000304 	0x304
     188:	00250700 	0x250700
     18c:	04040000 	0x4040000
     190:	00000000 	nop
     194:	0a670500 	j	99c1400 <_mem_avail_start-0x7663ec00>
     198:	01010000 	0x1010000
     19c:	0002ac5a 	0x2ac5a
     1a0:	00490600 	0x490600
     1a4:	25075a01 	addiu	a3,t0,23041
     1a8:	04000000 	bltz	zero,1ac <_mem_avail_start-0x7ffffe54>
     1ac:	00000000 	nop
     1b0:	00002507 	0x2507
     1b4:	00010400 	sll	zero,at,0x10
     1b8:	25070000 	addiu	a3,t0,0
     1bc:	04000000 	bltz	zero,1c0 <_mem_avail_start-0x7ffffe40>
     1c0:	00000002 	srl	zero,zero,0x0
     1c4:	00002507 	0x2507
     1c8:	00030400 	sll	zero,v1,0x10
     1cc:	25070000 	addiu	a3,t0,0
     1d0:	04000000 	bltz	zero,1d4 <_mem_avail_start-0x7ffffe2c>
     1d4:	00000004 	sllv	zero,zero,zero
     1d8:	00002507 	0x2507
     1dc:	00050400 	sll	zero,a1,0x10
     1e0:	25070000 	addiu	a3,t0,0
     1e4:	04000000 	bltz	zero,1e8 <_mem_avail_start-0x7ffffe18>
     1e8:	00000006 	srlv	zero,zero,zero
     1ec:	00002507 	0x2507
     1f0:	00070400 	sll	zero,a3,0x10
     1f4:	25070000 	addiu	a3,t0,0
     1f8:	04000000 	bltz	zero,1fc <_mem_avail_start-0x7ffffe04>
     1fc:	00000008 	jr	zero
     200:	00002507 	0x2507
     204:	00090400 	sll	zero,t1,0x10
     208:	25070000 	addiu	a3,t0,0
     20c:	04000000 	bltz	zero,210 <_mem_avail_start-0x7ffffdf0>
     210:	0000000a 	movz	zero,zero,zero
     214:	00002507 	0x2507
     218:	000b0400 	sll	zero,t3,0x10
     21c:	25070000 	addiu	a3,t0,0
     220:	04000000 	bltz	zero,224 <_mem_avail_start-0x7ffffddc>
     224:	0000000c 	syscall
     228:	00002507 	0x2507
     22c:	000d0400 	sll	zero,t5,0x10
     230:	25070000 	addiu	a3,t0,0
     234:	04000000 	bltz	zero,238 <_mem_avail_start-0x7ffffdc8>
     238:	0000000e 	0xe
     23c:	00002507 	0x2507
     240:	000f0400 	sll	zero,t7,0x10
     244:	25070000 	addiu	a3,t0,0
     248:	04000000 	bltz	zero,24c <_mem_avail_start-0x7ffffdb4>
     24c:	00000010 	mfhi	zero
     250:	00002507 	0x2507
     254:	00110400 	sll	zero,s1,0x10
     258:	25070000 	addiu	a3,t0,0
     25c:	04000000 	bltz	zero,260 <_mem_avail_start-0x7ffffda0>
     260:	00000012 	mflo	zero
     264:	00002507 	0x2507
     268:	00130400 	sll	zero,s3,0x10
     26c:	25070000 	addiu	a3,t0,0
     270:	04000000 	bltz	zero,274 <_mem_avail_start-0x7ffffd8c>
     274:	00000014 	0x14
     278:	00002507 	0x2507
     27c:	00150400 	sll	zero,s5,0x10
     280:	25070000 	addiu	a3,t0,0
     284:	04000000 	bltz	zero,288 <_mem_avail_start-0x7ffffd78>
     288:	00000016 	0x16
     28c:	00002507 	0x2507
     290:	00170400 	sll	zero,s7,0x10
     294:	25070000 	addiu	a3,t0,0
     298:	04000000 	bltz	zero,29c <_mem_avail_start-0x7ffffd64>
     29c:	00000018 	mult	zero,zero
     2a0:	00002507 	0x2507
     2a4:	00190400 	sll	zero,t9,0x10
     2a8:	00000000 	nop
     2ac:	000bbc05 	0xbbc05
     2b0:	5a010100 	0x5a010100
     2b4:	00000323 	0x323
     2b8:	01004906 	0x1004906
     2bc:	0025075a 	0x25075a
     2c0:	00040000 	sll	zero,a0,0x0
     2c4:	07000000 	bltz	t8,2c8 <_mem_avail_start-0x7ffffd38>
     2c8:	00000025 	move	zero,zero
     2cc:	00000104 	0x104
     2d0:	00250700 	0x250700
     2d4:	02040000 	0x2040000
     2d8:	07000000 	bltz	t8,2dc <_mem_avail_start-0x7ffffd24>
     2dc:	00000025 	move	zero,zero
     2e0:	00000304 	0x304
     2e4:	00250700 	0x250700
     2e8:	04040000 	0x4040000
     2ec:	07000000 	bltz	t8,2f0 <_mem_avail_start-0x7ffffd10>
     2f0:	00000025 	move	zero,zero
     2f4:	00000504 	0x504
     2f8:	00250700 	0x250700
     2fc:	06040000 	0x6040000
     300:	07000000 	bltz	t8,304 <_mem_avail_start-0x7ffffcfc>
     304:	00000025 	move	zero,zero
     308:	00000704 	0x704
     30c:	00250700 	0x250700
     310:	08040000 	j	100000 <_mem_avail_start-0x7ff00000>
     314:	07000000 	bltz	t8,318 <_mem_avail_start-0x7ffffce8>
     318:	00000025 	move	zero,zero
     31c:	00000904 	0x904
     320:	05000000 	bltz	t0,324 <_mem_avail_start-0x7ffffcdc>
     324:	00000b8e 	0xb8e
     328:	4a5a0101 	c2	0x5a0101
     32c:	06000003 	bltz	s0,33c <_mem_avail_start-0x7ffffcc4>
     330:	5a010049 	0x5a010049
     334:	00002507 	0x2507
     338:	00000400 	sll	zero,zero,0x10
     33c:	25070000 	addiu	a3,t0,0
     340:	04000000 	bltz	zero,344 <_mem_avail_start-0x7ffffcbc>
     344:	00000001 	movf	zero,zero,$fcc0
     348:	71080000 	madd	t0,t0
     34c:	01000000 	0x1000000
     350:	00073c67 	0x73c67
     354:	0003cd00 	sll	t9,v1,0x14
     358:	07240900 	0x7240900
     35c:	03950000 	0x3950000
     360:	ad0a0000 	sw	t2,0(t0)
     364:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     368:	000016ad 	0x16ad
     36c:	0016ad0a 	0x16ad0a
     370:	16ad0a00 	bne	s5,t5,2b74 <_mem_avail_start-0x7fffd48c>
     374:	ad0a0000 	sw	t2,0(t0)
     378:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     37c:	000016ad 	0x16ad
     380:	0016ad0a 	0x16ad0a
     384:	16ad0a00 	bne	s5,t5,2b88 <_mem_avail_start-0x7fffd478>
     388:	ad0a0000 	sw	t2,0(t0)
     38c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     390:	000016ad 	0x16ad
     394:	16b90b00 	bne	s5,t9,2f98 <_mem_avail_start-0x7fffd068>
     398:	ad0b0000 	sw	t3,0(t0)
     39c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     3a0:	000016ad 	0x16ad
     3a4:	0016ad0b 	0x16ad0b
     3a8:	16ad0b00 	bne	s5,t5,2fac <_mem_avail_start-0x7fffd054>
     3ac:	ad0b0000 	sw	t3,0(t0)
     3b0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     3b4:	000016ad 	0x16ad
     3b8:	0016ad0b 	0x16ad0b
     3bc:	16ad0b00 	bne	s5,t5,2fc0 <_mem_avail_start-0x7fffd040>
     3c0:	ad0b0000 	sw	t3,0(t0)
     3c4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     3c8:	000016ad 	0x16ad
     3cc:	112b0800 	beq	t1,t3,23d0 <_mem_avail_start-0x7fffdc30>
     3d0:	67010000 	0x67010000
     3d4:	00001849 	0x1849
     3d8:	0000045a 	0x45a
     3dc:	00072409 	0x72409
     3e0:	00041d00 	sll	v1,a0,0x14
     3e4:	16ad0a00 	bne	s5,t5,2be8 <_mem_avail_start-0x7fffd418>
     3e8:	ad0a0000 	sw	t2,0(t0)
     3ec:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     3f0:	000016ad 	0x16ad
     3f4:	0016ad0a 	0x16ad0a
     3f8:	16ad0a00 	bne	s5,t5,2bfc <_mem_avail_start-0x7fffd404>
     3fc:	ad0a0000 	sw	t2,0(t0)
     400:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     404:	000016ad 	0x16ad
     408:	0016ad0a 	0x16ad0a
     40c:	16ad0a00 	bne	s5,t5,2c10 <_mem_avail_start-0x7fffd3f0>
     410:	ad0a0000 	sw	t2,0(t0)
     414:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     418:	000016ad 	0x16ad
     41c:	16b90b00 	bne	s5,t9,3020 <_mem_avail_start-0x7fffcfe0>
     420:	ad0b0000 	sw	t3,0(t0)
     424:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     428:	000016ad 	0x16ad
     42c:	0016ad0b 	0x16ad0b
     430:	16ad0b00 	bne	s5,t5,3034 <_mem_avail_start-0x7fffcfcc>
     434:	ad0b0000 	sw	t3,0(t0)
     438:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     43c:	000016ad 	0x16ad
     440:	0016ad0b 	0x16ad0b
     444:	16ad0b00 	bne	s5,t5,3048 <_mem_avail_start-0x7fffcfb8>
     448:	ad0b0000 	sw	t3,0(t0)
     44c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     450:	000016ad 	0x16ad
     454:	0016ad0b 	0x16ad0b
     458:	49080000 	bc2f	$cc2,45c <_mem_avail_start-0x7ffffba4>
     45c:	01000001 	movf	zero,t0,$fcc0
     460:	00044a67 	0x44a67
     464:	0004f100 	sll	s8,a0,0x4
     468:	07240900 	0x7240900
     46c:	04af0000 	0x4af0000
     470:	ad0a0000 	sw	t2,0(t0)
     474:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     478:	000016ad 	0x16ad
     47c:	0016ad0a 	0x16ad0a
     480:	16ad0a00 	bne	s5,t5,2c84 <_mem_avail_start-0x7fffd37c>
     484:	ad0a0000 	sw	t2,0(t0)
     488:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     48c:	000016ad 	0x16ad
     490:	0016ad0a 	0x16ad0a
     494:	16ad0a00 	bne	s5,t5,2c98 <_mem_avail_start-0x7fffd368>
     498:	ad0a0000 	sw	t2,0(t0)
     49c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     4a0:	000016ad 	0x16ad
     4a4:	0016ad0a 	0x16ad0a
     4a8:	16ad0a00 	bne	s5,t5,2cac <_mem_avail_start-0x7fffd354>
     4ac:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     4b0:	000016b9 	0x16b9
     4b4:	0016ad0b 	0x16ad0b
     4b8:	16ad0b00 	bne	s5,t5,30bc <_mem_avail_start-0x7fffcf44>
     4bc:	ad0b0000 	sw	t3,0(t0)
     4c0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     4c4:	000016ad 	0x16ad
     4c8:	0016ad0b 	0x16ad0b
     4cc:	16ad0b00 	bne	s5,t5,30d0 <_mem_avail_start-0x7fffcf30>
     4d0:	ad0b0000 	sw	t3,0(t0)
     4d4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     4d8:	000016ad 	0x16ad
     4dc:	0016ad0b 	0x16ad0b
     4e0:	16ad0b00 	bne	s5,t5,30e4 <_mem_avail_start-0x7fffcf1c>
     4e4:	ad0b0000 	sw	t3,0(t0)
     4e8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     4ec:	000016ad 	0x16ad
     4f0:	10910800 	beq	a0,s1,24f4 <_mem_avail_start-0x7fffdb0c>
     4f4:	67010000 	0x67010000
     4f8:	00000036 	tne	zero,zero
     4fc:	00000592 	0x592
     500:	00072409 	0x72409
     504:	00054b00 	sll	t1,a1,0xc
     508:	16ad0a00 	bne	s5,t5,2d0c <_mem_avail_start-0x7fffd2f4>
     50c:	ad0a0000 	sw	t2,0(t0)
     510:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     514:	000016ad 	0x16ad
     518:	0016ad0a 	0x16ad0a
     51c:	16ad0a00 	bne	s5,t5,2d20 <_mem_avail_start-0x7fffd2e0>
     520:	ad0a0000 	sw	t2,0(t0)
     524:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     528:	000016ad 	0x16ad
     52c:	0016ad0a 	0x16ad0a
     530:	16ad0a00 	bne	s5,t5,2d34 <_mem_avail_start-0x7fffd2cc>
     534:	ad0a0000 	sw	t2,0(t0)
     538:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     53c:	000016ad 	0x16ad
     540:	0016ad0a 	0x16ad0a
     544:	16ad0a00 	bne	s5,t5,2d48 <_mem_avail_start-0x7fffd2b8>
     548:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     54c:	000016b9 	0x16b9
     550:	0016ad0b 	0x16ad0b
     554:	16ad0b00 	bne	s5,t5,3158 <_mem_avail_start-0x7fffcea8>
     558:	ad0b0000 	sw	t3,0(t0)
     55c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     560:	000016ad 	0x16ad
     564:	0016ad0b 	0x16ad0b
     568:	16ad0b00 	bne	s5,t5,316c <_mem_avail_start-0x7fffce94>
     56c:	ad0b0000 	sw	t3,0(t0)
     570:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     574:	000016ad 	0x16ad
     578:	0016ad0b 	0x16ad0b
     57c:	16ad0b00 	bne	s5,t5,3180 <_mem_avail_start-0x7fffce80>
     580:	ad0b0000 	sw	t3,0(t0)
     584:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     588:	000016ad 	0x16ad
     58c:	0016ad0b 	0x16ad0b
     590:	4c080000 	mfc3	t0,$0
     594:	01000006 	srlv	zero,zero,t0
     598:	00061067 	0x61067
     59c:	00063d00 	sll	a3,a2,0x14
     5a0:	07240900 	0x7240900
     5a4:	05f10000 	bgezal	t7,5a8 <_mem_avail_start-0x7ffffa58>
     5a8:	ad0a0000 	sw	t2,0(t0)
     5ac:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     5b0:	000016ad 	0x16ad
     5b4:	0016ad0a 	0x16ad0a
     5b8:	16ad0a00 	bne	s5,t5,2dbc <_mem_avail_start-0x7fffd244>
     5bc:	ad0a0000 	sw	t2,0(t0)
     5c0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     5c4:	000016ad 	0x16ad
     5c8:	0016ad0a 	0x16ad0a
     5cc:	16ad0a00 	bne	s5,t5,2dd0 <_mem_avail_start-0x7fffd230>
     5d0:	ad0a0000 	sw	t2,0(t0)
     5d4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     5d8:	000016ad 	0x16ad
     5dc:	0016ad0a 	0x16ad0a
     5e0:	16ad0a00 	bne	s5,t5,2de4 <_mem_avail_start-0x7fffd21c>
     5e4:	ad0a0000 	sw	t2,0(t0)
     5e8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     5ec:	000016ad 	0x16ad
     5f0:	16b90b00 	bne	s5,t9,31f4 <_mem_avail_start-0x7fffce0c>
     5f4:	ad0b0000 	sw	t3,0(t0)
     5f8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     5fc:	000016ad 	0x16ad
     600:	0016ad0b 	0x16ad0b
     604:	16ad0b00 	bne	s5,t5,3208 <_mem_avail_start-0x7fffcdf8>
     608:	ad0b0000 	sw	t3,0(t0)
     60c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     610:	000016ad 	0x16ad
     614:	0016ad0b 	0x16ad0b
     618:	16ad0b00 	bne	s5,t5,321c <_mem_avail_start-0x7fffcde4>
     61c:	ad0b0000 	sw	t3,0(t0)
     620:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     624:	000016ad 	0x16ad
     628:	0016ad0b 	0x16ad0b
     62c:	16ad0b00 	bne	s5,t5,3230 <_mem_avail_start-0x7fffcdd0>
     630:	ad0b0000 	sw	t3,0(t0)
     634:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     638:	000016ad 	0x16ad
     63c:	07740800 	0x7740800
     640:	67010000 	0x67010000
     644:	000001a8 	0x1a8
     648:	000006f2 	tlt	zero,zero,0x1b
     64c:	00072409 	0x72409
     650:	0006a100 	sll	s4,a2,0x4
     654:	16ad0a00 	bne	s5,t5,2e58 <_mem_avail_start-0x7fffd1a8>
     658:	ad0a0000 	sw	t2,0(t0)
     65c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     660:	000016ad 	0x16ad
     664:	0016ad0a 	0x16ad0a
     668:	16ad0a00 	bne	s5,t5,2e6c <_mem_avail_start-0x7fffd194>
     66c:	ad0a0000 	sw	t2,0(t0)
     670:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     674:	000016ad 	0x16ad
     678:	0016ad0a 	0x16ad0a
     67c:	16ad0a00 	bne	s5,t5,2e80 <_mem_avail_start-0x7fffd180>
     680:	ad0a0000 	sw	t2,0(t0)
     684:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     688:	000016ad 	0x16ad
     68c:	0016ad0a 	0x16ad0a
     690:	16ad0a00 	bne	s5,t5,2e94 <_mem_avail_start-0x7fffd16c>
     694:	ad0a0000 	sw	t2,0(t0)
     698:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     69c:	000016ad 	0x16ad
     6a0:	16b90b00 	bne	s5,t9,32a4 <_mem_avail_start-0x7fffcd5c>
     6a4:	ad0b0000 	sw	t3,0(t0)
     6a8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     6ac:	000016ad 	0x16ad
     6b0:	0016ad0b 	0x16ad0b
     6b4:	16ad0b00 	bne	s5,t5,32b8 <_mem_avail_start-0x7fffcd48>
     6b8:	ad0b0000 	sw	t3,0(t0)
     6bc:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     6c0:	000016ad 	0x16ad
     6c4:	0016ad0b 	0x16ad0b
     6c8:	16ad0b00 	bne	s5,t5,32cc <_mem_avail_start-0x7fffcd34>
     6cc:	ad0b0000 	sw	t3,0(t0)
     6d0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     6d4:	000016ad 	0x16ad
     6d8:	0016ad0b 	0x16ad0b
     6dc:	16ad0b00 	bne	s5,t5,32e0 <_mem_avail_start-0x7fffcd20>
     6e0:	ad0b0000 	sw	t3,0(t0)
     6e4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     6e8:	000016ad 	0x16ad
     6ec:	0016ad0b 	0x16ad0b
     6f0:	af080000 	sw	t0,0(t8)
     6f4:	01000003 	0x1000003
     6f8:	000dbf67 	0xdbf67
     6fc:	0007b100 	sll	s6,a3,0x4
     700:	07240900 	0x7240900
     704:	075b0000 	0x75b0000
     708:	ad0a0000 	sw	t2,0(t0)
     70c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     710:	000016ad 	0x16ad
     714:	0016ad0a 	0x16ad0a
     718:	16ad0a00 	bne	s5,t5,2f1c <_mem_avail_start-0x7fffd0e4>
     71c:	ad0a0000 	sw	t2,0(t0)
     720:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     724:	000016ad 	0x16ad
     728:	0016ad0a 	0x16ad0a
     72c:	16ad0a00 	bne	s5,t5,2f30 <_mem_avail_start-0x7fffd0d0>
     730:	ad0a0000 	sw	t2,0(t0)
     734:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     738:	000016ad 	0x16ad
     73c:	0016ad0a 	0x16ad0a
     740:	16ad0a00 	bne	s5,t5,2f44 <_mem_avail_start-0x7fffd0bc>
     744:	ad0a0000 	sw	t2,0(t0)
     748:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     74c:	000016ad 	0x16ad
     750:	0016ad0a 	0x16ad0a
     754:	16ad0a00 	bne	s5,t5,2f58 <_mem_avail_start-0x7fffd0a8>
     758:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     75c:	000016b9 	0x16b9
     760:	0016ad0b 	0x16ad0b
     764:	16ad0b00 	bne	s5,t5,3368 <_mem_avail_start-0x7fffcc98>
     768:	ad0b0000 	sw	t3,0(t0)
     76c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     770:	000016ad 	0x16ad
     774:	0016ad0b 	0x16ad0b
     778:	16ad0b00 	bne	s5,t5,337c <_mem_avail_start-0x7fffcc84>
     77c:	ad0b0000 	sw	t3,0(t0)
     780:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     784:	000016ad 	0x16ad
     788:	0016ad0b 	0x16ad0b
     78c:	16ad0b00 	bne	s5,t5,3390 <_mem_avail_start-0x7fffcc70>
     790:	ad0b0000 	sw	t3,0(t0)
     794:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     798:	000016ad 	0x16ad
     79c:	0016ad0b 	0x16ad0b
     7a0:	16ad0b00 	bne	s5,t5,33a4 <_mem_avail_start-0x7fffcc5c>
     7a4:	ad0b0000 	sw	t3,0(t0)
     7a8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     7ac:	000016ad 	0x16ad
     7b0:	093d0800 	j	4f42000 <_mem_avail_start-0x7b0be000>
     7b4:	67010000 	0x67010000
     7b8:	00001184 	0x1184
     7bc:	0000087a 	0x87a
     7c0:	00072409 	0x72409
     7c4:	00081f00 	sll	v1,t0,0x1c
     7c8:	16ad0a00 	bne	s5,t5,2fcc <_mem_avail_start-0x7fffd034>
     7cc:	ad0a0000 	sw	t2,0(t0)
     7d0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     7d4:	000016ad 	0x16ad
     7d8:	0016ad0a 	0x16ad0a
     7dc:	16ad0a00 	bne	s5,t5,2fe0 <_mem_avail_start-0x7fffd020>
     7e0:	ad0a0000 	sw	t2,0(t0)
     7e4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     7e8:	000016ad 	0x16ad
     7ec:	0016ad0a 	0x16ad0a
     7f0:	16ad0a00 	bne	s5,t5,2ff4 <_mem_avail_start-0x7fffd00c>
     7f4:	ad0a0000 	sw	t2,0(t0)
     7f8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     7fc:	000016ad 	0x16ad
     800:	0016ad0a 	0x16ad0a
     804:	16ad0a00 	bne	s5,t5,3008 <_mem_avail_start-0x7fffcff8>
     808:	ad0a0000 	sw	t2,0(t0)
     80c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     810:	000016ad 	0x16ad
     814:	0016ad0a 	0x16ad0a
     818:	16ad0a00 	bne	s5,t5,301c <_mem_avail_start-0x7fffcfe4>
     81c:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     820:	000016b9 	0x16b9
     824:	0016ad0b 	0x16ad0b
     828:	16ad0b00 	bne	s5,t5,342c <_mem_avail_start-0x7fffcbd4>
     82c:	ad0b0000 	sw	t3,0(t0)
     830:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     834:	000016ad 	0x16ad
     838:	0016ad0b 	0x16ad0b
     83c:	16ad0b00 	bne	s5,t5,3440 <_mem_avail_start-0x7fffcbc0>
     840:	ad0b0000 	sw	t3,0(t0)
     844:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     848:	000016ad 	0x16ad
     84c:	0016ad0b 	0x16ad0b
     850:	16ad0b00 	bne	s5,t5,3454 <_mem_avail_start-0x7fffcbac>
     854:	ad0b0000 	sw	t3,0(t0)
     858:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     85c:	000016ad 	0x16ad
     860:	0016ad0b 	0x16ad0b
     864:	16ad0b00 	bne	s5,t5,3468 <_mem_avail_start-0x7fffcb98>
     868:	ad0b0000 	sw	t3,0(t0)
     86c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     870:	000016ad 	0x16ad
     874:	0016ad0b 	0x16ad0b
     878:	b3080000 	0xb3080000
     87c:	0100000c 	syscall	0x40000
     880:	0004cc67 	0x4cc67
     884:	00094d00 	sll	t1,t1,0x14
     888:	07240900 	0x7240900
     88c:	08ed0000 	j	3b40000 <_mem_avail_start-0x7c4c0000>
     890:	ad0a0000 	sw	t2,0(t0)
     894:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     898:	000016ad 	0x16ad
     89c:	0016ad0a 	0x16ad0a
     8a0:	16ad0a00 	bne	s5,t5,30a4 <_mem_avail_start-0x7fffcf5c>
     8a4:	ad0a0000 	sw	t2,0(t0)
     8a8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     8ac:	000016ad 	0x16ad
     8b0:	0016ad0a 	0x16ad0a
     8b4:	16ad0a00 	bne	s5,t5,30b8 <_mem_avail_start-0x7fffcf48>
     8b8:	ad0a0000 	sw	t2,0(t0)
     8bc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     8c0:	000016ad 	0x16ad
     8c4:	0016ad0a 	0x16ad0a
     8c8:	16ad0a00 	bne	s5,t5,30cc <_mem_avail_start-0x7fffcf34>
     8cc:	ad0a0000 	sw	t2,0(t0)
     8d0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     8d4:	000016ad 	0x16ad
     8d8:	0016ad0a 	0x16ad0a
     8dc:	16ad0a00 	bne	s5,t5,30e0 <_mem_avail_start-0x7fffcf20>
     8e0:	ad0a0000 	sw	t2,0(t0)
     8e4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     8e8:	000016ad 	0x16ad
     8ec:	16b90b00 	bne	s5,t9,34f0 <_mem_avail_start-0x7fffcb10>
     8f0:	ad0b0000 	sw	t3,0(t0)
     8f4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     8f8:	000016ad 	0x16ad
     8fc:	0016ad0b 	0x16ad0b
     900:	16ad0b00 	bne	s5,t5,3504 <_mem_avail_start-0x7fffcafc>
     904:	ad0b0000 	sw	t3,0(t0)
     908:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     90c:	000016ad 	0x16ad
     910:	0016ad0b 	0x16ad0b
     914:	16ad0b00 	bne	s5,t5,3518 <_mem_avail_start-0x7fffcae8>
     918:	ad0b0000 	sw	t3,0(t0)
     91c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     920:	000016ad 	0x16ad
     924:	0016ad0b 	0x16ad0b
     928:	16ad0b00 	bne	s5,t5,352c <_mem_avail_start-0x7fffcad4>
     92c:	ad0b0000 	sw	t3,0(t0)
     930:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     934:	000016ad 	0x16ad
     938:	0016ad0b 	0x16ad0b
     93c:	16ad0b00 	bne	s5,t5,3540 <_mem_avail_start-0x7fffcac0>
     940:	ad0b0000 	sw	t3,0(t0)
     944:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     948:	000016ad 	0x16ad
     94c:	10f60800 	beq	a3,s6,2950 <_mem_avail_start-0x7fffd6b0>
     950:	67010000 	0x67010000
     954:	00000494 	0x494
     958:	0000099e 	0x99e
     95c:	00072409 	0x72409
     960:	00097f00 	sll	t7,t1,0x1c
     964:	16ad0a00 	bne	s5,t5,3168 <_mem_avail_start-0x7fffce98>
     968:	ad0a0000 	sw	t2,0(t0)
     96c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     970:	000016ad 	0x16ad
     974:	0016ad0a 	0x16ad0a
     978:	16ad0a00 	bne	s5,t5,317c <_mem_avail_start-0x7fffce84>
     97c:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     980:	000016b9 	0x16b9
     984:	0016ad0b 	0x16ad0b
     988:	16ad0b00 	bne	s5,t5,358c <_mem_avail_start-0x7fffca74>
     98c:	ad0b0000 	sw	t3,0(t0)
     990:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     994:	000016ad 	0x16ad
     998:	0016ad0b 	0x16ad0b
     99c:	36080000 	ori	t0,s0,0x0
     9a0:	0100000d 	break	0x100
     9a4:	000e9267 	0xe9267
     9a8:	000a7b00 	sll	t7,t2,0xc
     9ac:	07240900 	0x7240900
     9b0:	0a160000 	j	8580000 <_mem_avail_start-0x77a80000>
     9b4:	ad0a0000 	sw	t2,0(t0)
     9b8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     9bc:	000016ad 	0x16ad
     9c0:	0016ad0a 	0x16ad0a
     9c4:	16ad0a00 	bne	s5,t5,31c8 <_mem_avail_start-0x7fffce38>
     9c8:	ad0a0000 	sw	t2,0(t0)
     9cc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     9d0:	000016ad 	0x16ad
     9d4:	0016ad0a 	0x16ad0a
     9d8:	16ad0a00 	bne	s5,t5,31dc <_mem_avail_start-0x7fffce24>
     9dc:	ad0a0000 	sw	t2,0(t0)
     9e0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     9e4:	000016ad 	0x16ad
     9e8:	0016ad0a 	0x16ad0a
     9ec:	16ad0a00 	bne	s5,t5,31f0 <_mem_avail_start-0x7fffce10>
     9f0:	ad0a0000 	sw	t2,0(t0)
     9f4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     9f8:	000016ad 	0x16ad
     9fc:	0016ad0a 	0x16ad0a
     a00:	16ad0a00 	bne	s5,t5,3204 <_mem_avail_start-0x7fffcdfc>
     a04:	ad0a0000 	sw	t2,0(t0)
     a08:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     a0c:	000016ad 	0x16ad
     a10:	0016ad0a 	0x16ad0a
     a14:	b90b0000 	swr	t3,0(t0)
     a18:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     a1c:	000016ad 	0x16ad
     a20:	0016ad0b 	0x16ad0b
     a24:	16ad0b00 	bne	s5,t5,3628 <_mem_avail_start-0x7fffc9d8>
     a28:	ad0b0000 	sw	t3,0(t0)
     a2c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     a30:	000016ad 	0x16ad
     a34:	0016ad0b 	0x16ad0b
     a38:	16ad0b00 	bne	s5,t5,363c <_mem_avail_start-0x7fffc9c4>
     a3c:	ad0b0000 	sw	t3,0(t0)
     a40:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     a44:	000016ad 	0x16ad
     a48:	0016ad0b 	0x16ad0b
     a4c:	16ad0b00 	bne	s5,t5,3650 <_mem_avail_start-0x7fffc9b0>
     a50:	ad0b0000 	sw	t3,0(t0)
     a54:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     a58:	000016ad 	0x16ad
     a5c:	0016ad0b 	0x16ad0b
     a60:	16ad0b00 	bne	s5,t5,3664 <_mem_avail_start-0x7fffc99c>
     a64:	ad0b0000 	sw	t3,0(t0)
     a68:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     a6c:	000016ad 	0x16ad
     a70:	0016ad0b 	0x16ad0b
     a74:	16ad0b00 	bne	s5,t5,3678 <_mem_avail_start-0x7fffc988>
     a78:	08000000 	j	0 <_mem_avail_start-0x80000000>
     a7c:	00000aec 	0xaec
     a80:	16546701 	bne	s2,s4,1a688 <_mem_avail_start-0x7ffe5978>
     a84:	0ad60000 	j	b580000 <_mem_avail_start-0x74a80000>
     a88:	24090000 	li	t1,0
     a8c:	b2000007 	0xb2000007
     a90:	0a00000a 	j	8000028 <_mem_avail_start-0x77ffffd8>
     a94:	000016ad 	0x16ad
     a98:	0016ad0a 	0x16ad0a
     a9c:	16ad0a00 	bne	s5,t5,32a0 <_mem_avail_start-0x7fffcd60>
     aa0:	ad0a0000 	sw	t2,0(t0)
     aa4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     aa8:	000016ad 	0x16ad
     aac:	0016ad0a 	0x16ad0a
     ab0:	b90b0000 	swr	t3,0(t0)
     ab4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     ab8:	000016ad 	0x16ad
     abc:	0016ad0b 	0x16ad0b
     ac0:	16ad0b00 	bne	s5,t5,36c4 <_mem_avail_start-0x7fffc93c>
     ac4:	ad0b0000 	sw	t3,0(t0)
     ac8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     acc:	000016ad 	0x16ad
     ad0:	0016ad0b 	0x16ad0b
     ad4:	40080000 	mfc0	t0,c0_index
     ad8:	01000014 	0x1000014
     adc:	0002e967 	0x2e967
     ae0:	000bbd00 	sll	s7,t3,0x14
     ae4:	07240900 	0x7240900
     ae8:	0b530000 	j	d4c0000 <_mem_avail_start-0x72b40000>
     aec:	ad0a0000 	sw	t2,0(t0)
     af0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     af4:	000016ad 	0x16ad
     af8:	0016ad0a 	0x16ad0a
     afc:	16ad0a00 	bne	s5,t5,3300 <_mem_avail_start-0x7fffcd00>
     b00:	ad0a0000 	sw	t2,0(t0)
     b04:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     b08:	000016ad 	0x16ad
     b0c:	0016ad0a 	0x16ad0a
     b10:	16ad0a00 	bne	s5,t5,3314 <_mem_avail_start-0x7fffccec>
     b14:	ad0a0000 	sw	t2,0(t0)
     b18:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     b1c:	000016ad 	0x16ad
     b20:	0016ad0a 	0x16ad0a
     b24:	16ad0a00 	bne	s5,t5,3328 <_mem_avail_start-0x7fffccd8>
     b28:	ad0a0000 	sw	t2,0(t0)
     b2c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     b30:	000016ad 	0x16ad
     b34:	0016ad0a 	0x16ad0a
     b38:	16ad0a00 	bne	s5,t5,333c <_mem_avail_start-0x7fffccc4>
     b3c:	ad0a0000 	sw	t2,0(t0)
     b40:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     b44:	000016ad 	0x16ad
     b48:	0016ad0a 	0x16ad0a
     b4c:	16ad0a00 	bne	s5,t5,3350 <_mem_avail_start-0x7fffccb0>
     b50:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     b54:	000016b9 	0x16b9
     b58:	0016ad0b 	0x16ad0b
     b5c:	16ad0b00 	bne	s5,t5,3760 <_mem_avail_start-0x7fffc8a0>
     b60:	ad0b0000 	sw	t3,0(t0)
     b64:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     b68:	000016ad 	0x16ad
     b6c:	0016ad0b 	0x16ad0b
     b70:	16ad0b00 	bne	s5,t5,3774 <_mem_avail_start-0x7fffc88c>
     b74:	ad0b0000 	sw	t3,0(t0)
     b78:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     b7c:	000016ad 	0x16ad
     b80:	0016ad0b 	0x16ad0b
     b84:	16ad0b00 	bne	s5,t5,3788 <_mem_avail_start-0x7fffc878>
     b88:	ad0b0000 	sw	t3,0(t0)
     b8c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     b90:	000016ad 	0x16ad
     b94:	0016ad0b 	0x16ad0b
     b98:	16ad0b00 	bne	s5,t5,379c <_mem_avail_start-0x7fffc864>
     b9c:	ad0b0000 	sw	t3,0(t0)
     ba0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     ba4:	000016ad 	0x16ad
     ba8:	0016ad0b 	0x16ad0b
     bac:	16ad0b00 	bne	s5,t5,37b0 <_mem_avail_start-0x7fffc850>
     bb0:	ad0b0000 	sw	t3,0(t0)
     bb4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     bb8:	000016ad 	0x16ad
     bbc:	02a80800 	0x2a80800
     bc0:	67010000 	0x67010000
     bc4:	000007fe 	0x7fe
     bc8:	00000c22 	0xc22
     bcc:	00072409 	0x72409
     bd0:	000bf900 	sll	ra,t3,0x4
     bd4:	16ad0a00 	bne	s5,t5,33d8 <_mem_avail_start-0x7fffcc28>
     bd8:	ad0a0000 	sw	t2,0(t0)
     bdc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     be0:	000016ad 	0x16ad
     be4:	0016ad0a 	0x16ad0a
     be8:	16ad0a00 	bne	s5,t5,33ec <_mem_avail_start-0x7fffcc14>
     bec:	ad0a0000 	sw	t2,0(t0)
     bf0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     bf4:	000016ad 	0x16ad
     bf8:	16b90b00 	bne	s5,t9,37fc <_mem_avail_start-0x7fffc804>
     bfc:	ad0b0000 	sw	t3,0(t0)
     c00:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     c04:	000016ad 	0x16ad
     c08:	0016ad0b 	0x16ad0b
     c0c:	16ad0b00 	bne	s5,t5,3810 <_mem_avail_start-0x7fffc7f0>
     c10:	ad0b0000 	sw	t3,0(t0)
     c14:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     c18:	000016ad 	0x16ad
     c1c:	0016ad0b 	0x16ad0b
     c20:	fd080000 	sdc3	$8,0(t0)
     c24:	0100000d 	break	0x100
     c28:	00050c67 	0x50c67
     c2c:	000d1300 	sll	v0,t5,0xc
     c30:	07240900 	0x7240900
     c34:	0ca40000 	jal	2900000 <_mem_avail_start-0x7d700000>
     c38:	ad0a0000 	sw	t2,0(t0)
     c3c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     c40:	000016ad 	0x16ad
     c44:	0016ad0a 	0x16ad0a
     c48:	16ad0a00 	bne	s5,t5,344c <_mem_avail_start-0x7fffcbb4>
     c4c:	ad0a0000 	sw	t2,0(t0)
     c50:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     c54:	000016ad 	0x16ad
     c58:	0016ad0a 	0x16ad0a
     c5c:	16ad0a00 	bne	s5,t5,3460 <_mem_avail_start-0x7fffcba0>
     c60:	ad0a0000 	sw	t2,0(t0)
     c64:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     c68:	000016ad 	0x16ad
     c6c:	0016ad0a 	0x16ad0a
     c70:	16ad0a00 	bne	s5,t5,3474 <_mem_avail_start-0x7fffcb8c>
     c74:	ad0a0000 	sw	t2,0(t0)
     c78:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     c7c:	000016ad 	0x16ad
     c80:	0016ad0a 	0x16ad0a
     c84:	16ad0a00 	bne	s5,t5,3488 <_mem_avail_start-0x7fffcb78>
     c88:	ad0a0000 	sw	t2,0(t0)
     c8c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     c90:	000016ad 	0x16ad
     c94:	0016ad0a 	0x16ad0a
     c98:	16ad0a00 	bne	s5,t5,349c <_mem_avail_start-0x7fffcb64>
     c9c:	ad0a0000 	sw	t2,0(t0)
     ca0:	00000016 	0x16
     ca4:	0016b90b 	0x16b90b
     ca8:	16ad0b00 	bne	s5,t5,38ac <_mem_avail_start-0x7fffc754>
     cac:	ad0b0000 	sw	t3,0(t0)
     cb0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     cb4:	000016ad 	0x16ad
     cb8:	0016ad0b 	0x16ad0b
     cbc:	16ad0b00 	bne	s5,t5,38c0 <_mem_avail_start-0x7fffc740>
     cc0:	ad0b0000 	sw	t3,0(t0)
     cc4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     cc8:	000016ad 	0x16ad
     ccc:	0016ad0b 	0x16ad0b
     cd0:	16ad0b00 	bne	s5,t5,38d4 <_mem_avail_start-0x7fffc72c>
     cd4:	ad0b0000 	sw	t3,0(t0)
     cd8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     cdc:	000016ad 	0x16ad
     ce0:	0016ad0b 	0x16ad0b
     ce4:	16ad0b00 	bne	s5,t5,38e8 <_mem_avail_start-0x7fffc718>
     ce8:	ad0b0000 	sw	t3,0(t0)
     cec:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     cf0:	000016ad 	0x16ad
     cf4:	0016ad0b 	0x16ad0b
     cf8:	16ad0b00 	bne	s5,t5,38fc <_mem_avail_start-0x7fffc704>
     cfc:	ad0b0000 	sw	t3,0(t0)
     d00:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     d04:	000016ad 	0x16ad
     d08:	0016ad0b 	0x16ad0b
     d0c:	16ad0b00 	bne	s5,t5,3910 <_mem_avail_start-0x7fffc6f0>
     d10:	08000000 	j	0 <_mem_avail_start-0x80000000>
     d14:	00000c90 	0xc90
     d18:	13246701 	beq	t9,a0,1a920 <_mem_avail_start-0x7ffe56e0>
     d1c:	0d460000 	jal	5180000 <_mem_avail_start-0x7ae80000>
     d20:	24090000 	li	t1,0
     d24:	36000007 	ori	zero,s0,0x7
     d28:	0a00000d 	j	8000034 <_mem_avail_start-0x77ffffcc>
     d2c:	000016ad 	0x16ad
     d30:	0016ad0a 	0x16ad0a
     d34:	b90b0000 	swr	t3,0(t0)
     d38:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     d3c:	000016ad 	0x16ad
     d40:	0016ad0b 	0x16ad0b
     d44:	5f080000 	0x5f080000
     d48:	01000015 	0x1000015
     d4c:	00000067 	0x67
     d50:	000db500 	sll	s6,t5,0x14
     d54:	07240900 	0x7240900
     d58:	0d870000 	jal	61c0000 <_mem_avail_start-0x79e40000>
     d5c:	ad0a0000 	sw	t2,0(t0)
     d60:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     d64:	000016ad 	0x16ad
     d68:	0016ad0a 	0x16ad0a
     d6c:	16ad0a00 	bne	s5,t5,3570 <_mem_avail_start-0x7fffca90>
     d70:	ad0a0000 	sw	t2,0(t0)
     d74:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     d78:	000016ad 	0x16ad
     d7c:	0016ad0a 	0x16ad0a
     d80:	16ad0a00 	bne	s5,t5,3584 <_mem_avail_start-0x7fffca7c>
     d84:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     d88:	000016b9 	0x16b9
     d8c:	0016ad0b 	0x16ad0b
     d90:	16ad0b00 	bne	s5,t5,3994 <_mem_avail_start-0x7fffc66c>
     d94:	ad0b0000 	sw	t3,0(t0)
     d98:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     d9c:	000016ad 	0x16ad
     da0:	0016ad0b 	0x16ad0b
     da4:	16ad0b00 	bne	s5,t5,39a8 <_mem_avail_start-0x7fffc658>
     da8:	ad0b0000 	sw	t3,0(t0)
     dac:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     db0:	000016ad 	0x16ad
     db4:	086c0800 	j	1b02000 <_mem_avail_start-0x7e4fe000>
     db8:	67010000 	0x67010000
     dbc:	00000b27 	0xb27
     dc0:	00000eb0 	tge	zero,zero,0x3a
     dc4:	00072409 	0x72409
     dc8:	000e3c00 	sll	a3,t6,0x10
     dcc:	16ad0a00 	bne	s5,t5,35d0 <_mem_avail_start-0x7fffca30>
     dd0:	ad0a0000 	sw	t2,0(t0)
     dd4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     dd8:	000016ad 	0x16ad
     ddc:	0016ad0a 	0x16ad0a
     de0:	16ad0a00 	bne	s5,t5,35e4 <_mem_avail_start-0x7fffca1c>
     de4:	ad0a0000 	sw	t2,0(t0)
     de8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     dec:	000016ad 	0x16ad
     df0:	0016ad0a 	0x16ad0a
     df4:	16ad0a00 	bne	s5,t5,35f8 <_mem_avail_start-0x7fffca08>
     df8:	ad0a0000 	sw	t2,0(t0)
     dfc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     e00:	000016ad 	0x16ad
     e04:	0016ad0a 	0x16ad0a
     e08:	16ad0a00 	bne	s5,t5,360c <_mem_avail_start-0x7fffc9f4>
     e0c:	ad0a0000 	sw	t2,0(t0)
     e10:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     e14:	000016ad 	0x16ad
     e18:	0016ad0a 	0x16ad0a
     e1c:	16ad0a00 	bne	s5,t5,3620 <_mem_avail_start-0x7fffc9e0>
     e20:	ad0a0000 	sw	t2,0(t0)
     e24:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     e28:	000016ad 	0x16ad
     e2c:	0016ad0a 	0x16ad0a
     e30:	16ad0a00 	bne	s5,t5,3634 <_mem_avail_start-0x7fffc9cc>
     e34:	ad0a0000 	sw	t2,0(t0)
     e38:	00000016 	0x16
     e3c:	0016b90b 	0x16b90b
     e40:	16ad0b00 	bne	s5,t5,3a44 <_mem_avail_start-0x7fffc5bc>
     e44:	ad0b0000 	sw	t3,0(t0)
     e48:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     e4c:	000016ad 	0x16ad
     e50:	0016ad0b 	0x16ad0b
     e54:	16ad0b00 	bne	s5,t5,3a58 <_mem_avail_start-0x7fffc5a8>
     e58:	ad0b0000 	sw	t3,0(t0)
     e5c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     e60:	000016ad 	0x16ad
     e64:	0016ad0b 	0x16ad0b
     e68:	16ad0b00 	bne	s5,t5,3a6c <_mem_avail_start-0x7fffc594>
     e6c:	ad0b0000 	sw	t3,0(t0)
     e70:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     e74:	000016ad 	0x16ad
     e78:	0016ad0b 	0x16ad0b
     e7c:	16ad0b00 	bne	s5,t5,3a80 <_mem_avail_start-0x7fffc580>
     e80:	ad0b0000 	sw	t3,0(t0)
     e84:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     e88:	000016ad 	0x16ad
     e8c:	0016ad0b 	0x16ad0b
     e90:	16ad0b00 	bne	s5,t5,3a94 <_mem_avail_start-0x7fffc56c>
     e94:	ad0b0000 	sw	t3,0(t0)
     e98:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     e9c:	000016ad 	0x16ad
     ea0:	0016ad0b 	0x16ad0b
     ea4:	16ad0b00 	bne	s5,t5,3aa8 <_mem_avail_start-0x7fffc558>
     ea8:	ad0b0000 	sw	t3,0(t0)
     eac:	00000016 	0x16
     eb0:	00020f08 	0x20f08
     eb4:	f5670100 	sdc1	$f7,256(t3)
     eb8:	ed00000e 	swc3	$0,14(t0)
     ebc:	0900000e 	j	4000038 <_mem_avail_start-0x7bffffc8>
     ec0:	00000724 	0x724
     ec4:	00000ed8 	0xed8
     ec8:	0016ad0a 	0x16ad0a
     ecc:	16ad0a00 	bne	s5,t5,36d0 <_mem_avail_start-0x7fffc930>
     ed0:	ad0a0000 	sw	t2,0(t0)
     ed4:	00000016 	0x16
     ed8:	0016b90b 	0x16b90b
     edc:	16ad0b00 	bne	s5,t5,3ae0 <_mem_avail_start-0x7fffc520>
     ee0:	ad0b0000 	sw	t3,0(t0)
     ee4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     ee8:	000016ad 	0x16ad
     eec:	18f40800 	0x18f40800
     ef0:	67010000 	0x67010000
     ef4:	00001005 	0x1005
     ef8:	00000f16 	0xf16
     efc:	00072409 	0x72409
     f00:	000f0b00 	sll	at,t7,0xc
     f04:	16ad0a00 	bne	s5,t5,3708 <_mem_avail_start-0x7fffc8f8>
     f08:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
     f0c:	000016b9 	0x16b9
     f10:	0016ad0b 	0x16ad0b
     f14:	e0080000 	sc	t0,0(zero)
     f18:	01000014 	0x1000014
     f1c:	00054f67 	0x54f67
     f20:	000f8f00 	sll	s1,t7,0x1c
     f24:	07240900 	0x7240900
     f28:	0f5c0000 	jal	d700000 <_mem_avail_start-0x72900000>
     f2c:	ad0a0000 	sw	t2,0(t0)
     f30:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     f34:	000016ad 	0x16ad
     f38:	0016ad0a 	0x16ad0a
     f3c:	16ad0a00 	bne	s5,t5,3740 <_mem_avail_start-0x7fffc8c0>
     f40:	ad0a0000 	sw	t2,0(t0)
     f44:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     f48:	000016ad 	0x16ad
     f4c:	0016ad0a 	0x16ad0a
     f50:	16ad0a00 	bne	s5,t5,3754 <_mem_avail_start-0x7fffc8ac>
     f54:	ad0a0000 	sw	t2,0(t0)
     f58:	00000016 	0x16
     f5c:	0016b90b 	0x16b90b
     f60:	16ad0b00 	bne	s5,t5,3b64 <_mem_avail_start-0x7fffc49c>
     f64:	ad0b0000 	sw	t3,0(t0)
     f68:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     f6c:	000016ad 	0x16ad
     f70:	0016ad0b 	0x16ad0b
     f74:	16ad0b00 	bne	s5,t5,3b78 <_mem_avail_start-0x7fffc488>
     f78:	ad0b0000 	sw	t3,0(t0)
     f7c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
     f80:	000016ad 	0x16ad
     f84:	0016ad0b 	0x16ad0b
     f88:	16ad0b00 	bne	s5,t5,3b8c <_mem_avail_start-0x7fffc474>
     f8c:	08000000 	j	0 <_mem_avail_start-0x80000000>
     f90:	00001701 	0x1701
     f94:	03496701 	0x3496701
     f98:	10940000 	beq	a0,s4,f9c <_mem_avail_start-0x7ffff064>
     f9c:	24090000 	li	t1,0
     fa0:	1b000007 	blez	t8,fc0 <_mem_avail_start-0x7ffff040>
     fa4:	0a000010 	j	8000040 <_mem_avail_start-0x77ffffc0>
     fa8:	000016ad 	0x16ad
     fac:	0016ad0a 	0x16ad0a
     fb0:	16ad0a00 	bne	s5,t5,37b4 <_mem_avail_start-0x7fffc84c>
     fb4:	ad0a0000 	sw	t2,0(t0)
     fb8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     fbc:	000016ad 	0x16ad
     fc0:	0016ad0a 	0x16ad0a
     fc4:	16ad0a00 	bne	s5,t5,37c8 <_mem_avail_start-0x7fffc838>
     fc8:	ad0a0000 	sw	t2,0(t0)
     fcc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     fd0:	000016ad 	0x16ad
     fd4:	0016ad0a 	0x16ad0a
     fd8:	16ad0a00 	bne	s5,t5,37dc <_mem_avail_start-0x7fffc824>
     fdc:	ad0a0000 	sw	t2,0(t0)
     fe0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     fe4:	000016ad 	0x16ad
     fe8:	0016ad0a 	0x16ad0a
     fec:	16ad0a00 	bne	s5,t5,37f0 <_mem_avail_start-0x7fffc810>
     ff0:	ad0a0000 	sw	t2,0(t0)
     ff4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
     ff8:	000016ad 	0x16ad
     ffc:	0016ad0a 	0x16ad0a
    1000:	16ad0a00 	bne	s5,t5,3804 <_mem_avail_start-0x7fffc7fc>
    1004:	ad0a0000 	sw	t2,0(t0)
    1008:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    100c:	000016ad 	0x16ad
    1010:	0016ad0a 	0x16ad0a
    1014:	16ad0a00 	bne	s5,t5,3818 <_mem_avail_start-0x7fffc7e8>
    1018:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
    101c:	000016b9 	0x16b9
    1020:	0016ad0b 	0x16ad0b
    1024:	16ad0b00 	bne	s5,t5,3c28 <_mem_avail_start-0x7fffc3d8>
    1028:	ad0b0000 	sw	t3,0(t0)
    102c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1030:	000016ad 	0x16ad
    1034:	0016ad0b 	0x16ad0b
    1038:	16ad0b00 	bne	s5,t5,3c3c <_mem_avail_start-0x7fffc3c4>
    103c:	ad0b0000 	sw	t3,0(t0)
    1040:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1044:	000016ad 	0x16ad
    1048:	0016ad0b 	0x16ad0b
    104c:	16ad0b00 	bne	s5,t5,3c50 <_mem_avail_start-0x7fffc3b0>
    1050:	ad0b0000 	sw	t3,0(t0)
    1054:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1058:	000016ad 	0x16ad
    105c:	0016ad0b 	0x16ad0b
    1060:	16ad0b00 	bne	s5,t5,3c64 <_mem_avail_start-0x7fffc39c>
    1064:	ad0b0000 	sw	t3,0(t0)
    1068:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    106c:	000016ad 	0x16ad
    1070:	0016ad0b 	0x16ad0b
    1074:	16ad0b00 	bne	s5,t5,3c78 <_mem_avail_start-0x7fffc388>
    1078:	ad0b0000 	sw	t3,0(t0)
    107c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1080:	000016ad 	0x16ad
    1084:	0016ad0b 	0x16ad0b
    1088:	16ad0b00 	bne	s5,t5,3c8c <_mem_avail_start-0x7fffc374>
    108c:	ad0b0000 	sw	t3,0(t0)
    1090:	00000016 	0x16
    1094:	0009ba08 	0x9ba08
    1098:	03670100 	0x3670100
    109c:	ad00000c 	sw	zero,12(t0)
    10a0:	09000011 	j	4000044 <_mem_avail_start-0x7bffffbc>
    10a4:	00000724 	0x724
    10a8:	0000112a 	0x112a
    10ac:	0016ad0a 	0x16ad0a
    10b0:	16ad0a00 	bne	s5,t5,38b4 <_mem_avail_start-0x7fffc74c>
    10b4:	ad0a0000 	sw	t2,0(t0)
    10b8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    10bc:	000016ad 	0x16ad
    10c0:	0016ad0a 	0x16ad0a
    10c4:	16ad0a00 	bne	s5,t5,38c8 <_mem_avail_start-0x7fffc738>
    10c8:	ad0a0000 	sw	t2,0(t0)
    10cc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    10d0:	000016ad 	0x16ad
    10d4:	0016ad0a 	0x16ad0a
    10d8:	16ad0a00 	bne	s5,t5,38dc <_mem_avail_start-0x7fffc724>
    10dc:	ad0a0000 	sw	t2,0(t0)
    10e0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    10e4:	000016ad 	0x16ad
    10e8:	0016ad0a 	0x16ad0a
    10ec:	16ad0a00 	bne	s5,t5,38f0 <_mem_avail_start-0x7fffc710>
    10f0:	ad0a0000 	sw	t2,0(t0)
    10f4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    10f8:	000016ad 	0x16ad
    10fc:	0016ad0a 	0x16ad0a
    1100:	16ad0a00 	bne	s5,t5,3904 <_mem_avail_start-0x7fffc6fc>
    1104:	ad0a0000 	sw	t2,0(t0)
    1108:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    110c:	000016ad 	0x16ad
    1110:	0016ad0a 	0x16ad0a
    1114:	16ad0a00 	bne	s5,t5,3918 <_mem_avail_start-0x7fffc6e8>
    1118:	ad0a0000 	sw	t2,0(t0)
    111c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1120:	000016ad 	0x16ad
    1124:	0016ad0a 	0x16ad0a
    1128:	b90b0000 	swr	t3,0(t0)
    112c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1130:	000016ad 	0x16ad
    1134:	0016ad0b 	0x16ad0b
    1138:	16ad0b00 	bne	s5,t5,3d3c <_mem_avail_start-0x7fffc2c4>
    113c:	ad0b0000 	sw	t3,0(t0)
    1140:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1144:	000016ad 	0x16ad
    1148:	0016ad0b 	0x16ad0b
    114c:	16ad0b00 	bne	s5,t5,3d50 <_mem_avail_start-0x7fffc2b0>
    1150:	ad0b0000 	sw	t3,0(t0)
    1154:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1158:	000016ad 	0x16ad
    115c:	0016ad0b 	0x16ad0b
    1160:	16ad0b00 	bne	s5,t5,3d64 <_mem_avail_start-0x7fffc29c>
    1164:	ad0b0000 	sw	t3,0(t0)
    1168:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    116c:	000016ad 	0x16ad
    1170:	0016ad0b 	0x16ad0b
    1174:	16ad0b00 	bne	s5,t5,3d78 <_mem_avail_start-0x7fffc288>
    1178:	ad0b0000 	sw	t3,0(t0)
    117c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1180:	000016ad 	0x16ad
    1184:	0016ad0b 	0x16ad0b
    1188:	16ad0b00 	bne	s5,t5,3d8c <_mem_avail_start-0x7fffc274>
    118c:	ad0b0000 	sw	t3,0(t0)
    1190:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1194:	000016ad 	0x16ad
    1198:	0016ad0b 	0x16ad0b
    119c:	16ad0b00 	bne	s5,t5,3da0 <_mem_avail_start-0x7fffc260>
    11a0:	ad0b0000 	sw	t3,0(t0)
    11a4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    11a8:	000016ad 	0x16ad
    11ac:	00f90800 	0xf90800
    11b0:	67010000 	0x67010000
    11b4:	0000152d 	0x152d
    11b8:	000011f4 	teq	zero,zero,0x47
    11bc:	00072409 	0x72409
    11c0:	0011da00 	sll	k1,s1,0x8
    11c4:	16ad0a00 	bne	s5,t5,39c8 <_mem_avail_start-0x7fffc638>
    11c8:	ad0a0000 	sw	t2,0(t0)
    11cc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    11d0:	000016ad 	0x16ad
    11d4:	0016ad0a 	0x16ad0a
    11d8:	b90b0000 	swr	t3,0(t0)
    11dc:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    11e0:	000016ad 	0x16ad
    11e4:	0016ad0b 	0x16ad0b
    11e8:	16ad0b00 	bne	s5,t5,3dec <_mem_avail_start-0x7fffc214>
    11ec:	ad0b0000 	sw	t3,0(t0)
    11f0:	00000016 	0x16
    11f4:	00163708 	0x163708
    11f8:	c9740100 	lwc2	$20,256(t3)
    11fc:	38000006 	xori	zero,zero,0x6
    1200:	0c000012 	jal	48 <_mem_avail_start-0x7fffffb8>
    1204:	0025004e 	0x25004e
    1208:	02040000 	0x2040000
    120c:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    1210:	73010049 	0x73010049
    1214:	0000122d 	0x122d
    1218:	00002507 	0x2507
    121c:	00000400 	sll	zero,zero,0x10
    1220:	25070000 	addiu	a3,t0,0
    1224:	04000000 	bltz	zero,1228 <_mem_avail_start-0x7fffedd8>
    1228:	00000001 	movf	zero,zero,$fcc0
    122c:	25b70b00 	addiu	s7,t5,2816
    1230:	230b0000 	addi	t3,t8,0
    1234:	00000003 	sra	zero,zero,0x0
    1238:	00090708 	0x90708
    123c:	a6740100 	sh	s4,256(s3)
    1240:	cc000015 	pref	0x0,21(zero)
    1244:	0c000012 	jal	48 <_mem_avail_start-0x7fffffb8>
    1248:	0025004e 	0x25004e
    124c:	0a040000 	j	8100000 <_mem_avail_start-0x77f00000>
    1250:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    1254:	73010049 	0x73010049
    1258:	000012c1 	0x12c1
    125c:	00002507 	0x2507
    1260:	00000400 	sll	zero,zero,0x10
    1264:	25070000 	addiu	a3,t0,0
    1268:	04000000 	bltz	zero,126c <_mem_avail_start-0x7fffed94>
    126c:	00000001 	movf	zero,zero,$fcc0
    1270:	00002507 	0x2507
    1274:	00020400 	sll	zero,v0,0x10
    1278:	25070000 	addiu	a3,t0,0
    127c:	04000000 	bltz	zero,1280 <_mem_avail_start-0x7fffed80>
    1280:	00000003 	sra	zero,zero,0x0
    1284:	00002507 	0x2507
    1288:	00040400 	sll	zero,a0,0x10
    128c:	25070000 	addiu	a3,t0,0
    1290:	04000000 	bltz	zero,1294 <_mem_avail_start-0x7fffed6c>
    1294:	00000005 	0x5
    1298:	00002507 	0x2507
    129c:	00060400 	sll	zero,a2,0x10
    12a0:	25070000 	addiu	a3,t0,0
    12a4:	04000000 	bltz	zero,12a8 <_mem_avail_start-0x7fffed58>
    12a8:	00000007 	srav	zero,zero,zero
    12ac:	00002507 	0x2507
    12b0:	00080400 	sll	zero,t0,0x10
    12b4:	25070000 	addiu	a3,t0,0
    12b8:	04000000 	bltz	zero,12bc <_mem_avail_start-0x7fffed44>
    12bc:	00000009 	jalr	zero,zero
    12c0:	26120b00 	addiu	s2,s0,2816
    12c4:	ac0b0000 	sw	t3,0(zero)
    12c8:	00000002 	srl	zero,zero,0x0
    12cc:	0017a208 	0x17a208
    12d0:	4a670100 	c2	0x670100
    12d4:	db00000c 	ldc2	$0,12(t8)
    12d8:	09000013 	j	400004c <_mem_avail_start-0x7bffffb4>
    12dc:	00000724 	0x724
    12e0:	0000135d 	0x135d
    12e4:	0016ad0a 	0x16ad0a
    12e8:	16ad0a00 	bne	s5,t5,3aec <_mem_avail_start-0x7fffc514>
    12ec:	ad0a0000 	sw	t2,0(t0)
    12f0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    12f4:	000016ad 	0x16ad
    12f8:	0016ad0a 	0x16ad0a
    12fc:	16ad0a00 	bne	s5,t5,3b00 <_mem_avail_start-0x7fffc500>
    1300:	ad0a0000 	sw	t2,0(t0)
    1304:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1308:	000016ad 	0x16ad
    130c:	0016ad0a 	0x16ad0a
    1310:	16ad0a00 	bne	s5,t5,3b14 <_mem_avail_start-0x7fffc4ec>
    1314:	ad0a0000 	sw	t2,0(t0)
    1318:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    131c:	000016ad 	0x16ad
    1320:	0016ad0a 	0x16ad0a
    1324:	16ad0a00 	bne	s5,t5,3b28 <_mem_avail_start-0x7fffc4d8>
    1328:	ad0a0000 	sw	t2,0(t0)
    132c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1330:	000016ad 	0x16ad
    1334:	0016ad0a 	0x16ad0a
    1338:	16ad0a00 	bne	s5,t5,3b3c <_mem_avail_start-0x7fffc4c4>
    133c:	ad0a0000 	sw	t2,0(t0)
    1340:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1344:	000016ad 	0x16ad
    1348:	0016ad0a 	0x16ad0a
    134c:	16ad0a00 	bne	s5,t5,3b50 <_mem_avail_start-0x7fffc4b0>
    1350:	ad0a0000 	sw	t2,0(t0)
    1354:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1358:	000016ad 	0x16ad
    135c:	16b90b00 	bne	s5,t9,3f60 <_mem_avail_start-0x7fffc0a0>
    1360:	ad0b0000 	sw	t3,0(t0)
    1364:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1368:	000016ad 	0x16ad
    136c:	0016ad0b 	0x16ad0b
    1370:	16ad0b00 	bne	s5,t5,3f74 <_mem_avail_start-0x7fffc08c>
    1374:	ad0b0000 	sw	t3,0(t0)
    1378:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    137c:	000016ad 	0x16ad
    1380:	0016ad0b 	0x16ad0b
    1384:	16ad0b00 	bne	s5,t5,3f88 <_mem_avail_start-0x7fffc078>
    1388:	ad0b0000 	sw	t3,0(t0)
    138c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1390:	000016ad 	0x16ad
    1394:	0016ad0b 	0x16ad0b
    1398:	16ad0b00 	bne	s5,t5,3f9c <_mem_avail_start-0x7fffc064>
    139c:	ad0b0000 	sw	t3,0(t0)
    13a0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    13a4:	000016ad 	0x16ad
    13a8:	0016ad0b 	0x16ad0b
    13ac:	16ad0b00 	bne	s5,t5,3fb0 <_mem_avail_start-0x7fffc050>
    13b0:	ad0b0000 	sw	t3,0(t0)
    13b4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    13b8:	000016ad 	0x16ad
    13bc:	0016ad0b 	0x16ad0b
    13c0:	16ad0b00 	bne	s5,t5,3fc4 <_mem_avail_start-0x7fffc03c>
    13c4:	ad0b0000 	sw	t3,0(t0)
    13c8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    13cc:	000016ad 	0x16ad
    13d0:	0016ad0b 	0x16ad0b
    13d4:	16ad0b00 	bne	s5,t5,3fd8 <_mem_avail_start-0x7fffc028>
    13d8:	08000000 	j	0 <_mem_avail_start-0x80000000>
    13dc:	00001911 	0x1911
    13e0:	0f397401 	jal	ce5d004 <_mem_avail_start-0x731a2ffc>
    13e4:	150f0000 	bne	t0,t7,13e8 <_mem_avail_start-0x7fffec18>
    13e8:	4e0c0000 	c3	0xc0000
    13ec:	00002500 	sll	a0,zero,0x14
    13f0:	001a0400 	sll	zero,k0,0x10
    13f4:	490d0000 	bc2t	$cc3,13f8 <_mem_avail_start-0x7fffec08>
    13f8:	04730100 	bgezall	v1,17fc <_mem_avail_start-0x7fffe804>
    13fc:	07000015 	bltz	t8,1454 <_mem_avail_start-0x7fffebac>
    1400:	00000025 	move	zero,zero
    1404:	00000004 	sllv	zero,zero,zero
    1408:	00250700 	0x250700
    140c:	01040000 	0x1040000
    1410:	07000000 	bltz	t8,1414 <_mem_avail_start-0x7fffebec>
    1414:	00000025 	move	zero,zero
    1418:	00000204 	0x204
    141c:	00250700 	0x250700
    1420:	03040000 	0x3040000
    1424:	07000000 	bltz	t8,1428 <_mem_avail_start-0x7fffebd8>
    1428:	00000025 	move	zero,zero
    142c:	00000404 	0x404
    1430:	00250700 	0x250700
    1434:	05040000 	0x5040000
    1438:	07000000 	bltz	t8,143c <_mem_avail_start-0x7fffebc4>
    143c:	00000025 	move	zero,zero
    1440:	00000604 	0x604
    1444:	00250700 	0x250700
    1448:	07040000 	0x7040000
    144c:	07000000 	bltz	t8,1450 <_mem_avail_start-0x7fffebb0>
    1450:	00000025 	move	zero,zero
    1454:	00000804 	sllv	at,zero,zero
    1458:	00250700 	0x250700
    145c:	09040000 	j	4100000 <_mem_avail_start-0x7bf00000>
    1460:	07000000 	bltz	t8,1464 <_mem_avail_start-0x7fffeb9c>
    1464:	00000025 	move	zero,zero
    1468:	00000a04 	0xa04
    146c:	00250700 	0x250700
    1470:	0b040000 	j	c100000 <_mem_avail_start-0x73f00000>
    1474:	07000000 	bltz	t8,1478 <_mem_avail_start-0x7fffeb88>
    1478:	00000025 	move	zero,zero
    147c:	00000c04 	0xc04
    1480:	00250700 	0x250700
    1484:	0d040000 	jal	4100000 <_mem_avail_start-0x7bf00000>
    1488:	07000000 	bltz	t8,148c <_mem_avail_start-0x7fffeb74>
    148c:	00000025 	move	zero,zero
    1490:	00000e04 	0xe04
    1494:	00250700 	0x250700
    1498:	0f040000 	jal	c100000 <_mem_avail_start-0x73f00000>
    149c:	07000000 	bltz	t8,14a0 <_mem_avail_start-0x7fffeb60>
    14a0:	00000025 	move	zero,zero
    14a4:	00001004 	sllv	v0,zero,zero
    14a8:	00250700 	0x250700
    14ac:	11040000 	beq	t0,a0,14b0 <_mem_avail_start-0x7fffeb50>
    14b0:	07000000 	bltz	t8,14b4 <_mem_avail_start-0x7fffeb4c>
    14b4:	00000025 	move	zero,zero
    14b8:	00001204 	0x1204
    14bc:	00250700 	0x250700
    14c0:	13040000 	beq	t8,a0,14c4 <_mem_avail_start-0x7fffeb3c>
    14c4:	07000000 	bltz	t8,14c8 <_mem_avail_start-0x7fffeb38>
    14c8:	00000025 	move	zero,zero
    14cc:	00001404 	0x1404
    14d0:	00250700 	0x250700
    14d4:	15040000 	bne	t0,a0,14d8 <_mem_avail_start-0x7fffeb28>
    14d8:	07000000 	bltz	t8,14dc <_mem_avail_start-0x7fffeb24>
    14dc:	00000025 	move	zero,zero
    14e0:	00001604 	0x1604
    14e4:	00250700 	0x250700
    14e8:	17040000 	bne	t8,a0,14ec <_mem_avail_start-0x7fffeb14>
    14ec:	07000000 	bltz	t8,14f0 <_mem_avail_start-0x7fffeb10>
    14f0:	00000025 	move	zero,zero
    14f4:	00001804 	sllv	v1,zero,zero
    14f8:	00250700 	0x250700
    14fc:	19040000 	0x19040000
    1500:	00000000 	nop
    1504:	0037680b 	movn	t5,at,s7
    1508:	01950b00 	0x1950b00
    150c:	08000000 	j	0 <_mem_avail_start-0x80000000>
    1510:	00000846 	rorv	at,zero,zero
    1514:	05a97401 	tgeiu	t5,29697
    1518:	15710000 	bne	t3,s1,151c <_mem_avail_start-0x7fffeae4>
    151c:	4e0c0000 	c3	0xc0000
    1520:	00002500 	sll	a0,zero,0x14
    1524:	00050400 	sll	zero,a1,0x10
    1528:	490d0000 	bc2t	$cc3,152c <_mem_avail_start-0x7fffead4>
    152c:	66730100 	0x66730100
    1530:	07000015 	bltz	t8,1588 <_mem_avail_start-0x7fffea78>
    1534:	00000025 	move	zero,zero
    1538:	00000004 	sllv	zero,zero,zero
    153c:	00250700 	0x250700
    1540:	01040000 	0x1040000
    1544:	07000000 	bltz	t8,1548 <_mem_avail_start-0x7fffeab8>
    1548:	00000025 	move	zero,zero
    154c:	00000204 	0x204
    1550:	00250700 	0x250700
    1554:	03040000 	0x3040000
    1558:	07000000 	bltz	t8,155c <_mem_avail_start-0x7fffeaa4>
    155c:	00000025 	move	zero,zero
    1560:	00000404 	0x404
    1564:	b30b0000 	0xb30b0000
    1568:	0b000038 	j	c0000e0 <_mem_avail_start-0x73ffff20>
    156c:	00000150 	0x150
    1570:	18820800 	0x18820800
    1574:	74010000 	jalx	40000 <_mem_avail_start-0x7ffc0000>
    1578:	0000125d 	0x125d
    157c:	0000169b 	0x169b
    1580:	25004e0c 	addiu	zero,t0,19980
    1584:	04000000 	bltz	zero,1588 <_mem_avail_start-0x7fffea78>
    1588:	00000019 	multu	zero,zero
    158c:	0100490d 	break	0x100,0x124
    1590:	00169073 	tltu	zero,s6,0x241
    1594:	00250700 	0x250700
    1598:	00040000 	sll	zero,a0,0x0
    159c:	07000000 	bltz	t8,15a0 <_mem_avail_start-0x7fffea60>
    15a0:	00000025 	move	zero,zero
    15a4:	00000104 	0x104
    15a8:	00250700 	0x250700
    15ac:	02040000 	0x2040000
    15b0:	07000000 	bltz	t8,15b4 <_mem_avail_start-0x7fffea4c>
    15b4:	00000025 	move	zero,zero
    15b8:	00000304 	0x304
    15bc:	00250700 	0x250700
    15c0:	04040000 	0x4040000
    15c4:	07000000 	bltz	t8,15c8 <_mem_avail_start-0x7fffea38>
    15c8:	00000025 	move	zero,zero
    15cc:	00000504 	0x504
    15d0:	00250700 	0x250700
    15d4:	06040000 	0x6040000
    15d8:	07000000 	bltz	t8,15dc <_mem_avail_start-0x7fffea24>
    15dc:	00000025 	move	zero,zero
    15e0:	00000704 	0x704
    15e4:	00250700 	0x250700
    15e8:	08040000 	j	100000 <_mem_avail_start-0x7ff00000>
    15ec:	07000000 	bltz	t8,15f0 <_mem_avail_start-0x7fffea10>
    15f0:	00000025 	move	zero,zero
    15f4:	00000904 	0x904
    15f8:	00250700 	0x250700
    15fc:	0a040000 	j	8100000 <_mem_avail_start-0x77f00000>
    1600:	07000000 	bltz	t8,1604 <_mem_avail_start-0x7fffe9fc>
    1604:	00000025 	move	zero,zero
    1608:	00000b04 	0xb04
    160c:	00250700 	0x250700
    1610:	0c040000 	jal	100000 <_mem_avail_start-0x7ff00000>
    1614:	07000000 	bltz	t8,1618 <_mem_avail_start-0x7fffe9e8>
    1618:	00000025 	move	zero,zero
    161c:	00000d04 	0xd04
    1620:	00250700 	0x250700
    1624:	0e040000 	jal	8100000 <_mem_avail_start-0x77f00000>
    1628:	07000000 	bltz	t8,162c <_mem_avail_start-0x7fffe9d4>
    162c:	00000025 	move	zero,zero
    1630:	00000f04 	0xf04
    1634:	00250700 	0x250700
    1638:	10040000 	beq	zero,a0,163c <_mem_avail_start-0x7fffe9c4>
    163c:	07000000 	bltz	t8,1640 <_mem_avail_start-0x7fffe9c0>
    1640:	00000025 	move	zero,zero
    1644:	00001104 	0x1104
    1648:	00250700 	0x250700
    164c:	12040000 	beq	s0,a0,1650 <_mem_avail_start-0x7fffe9b0>
    1650:	07000000 	bltz	t8,1654 <_mem_avail_start-0x7fffe9ac>
    1654:	00000025 	move	zero,zero
    1658:	00001304 	0x1304
    165c:	00250700 	0x250700
    1660:	14040000 	bne	zero,a0,1664 <_mem_avail_start-0x7fffe99c>
    1664:	07000000 	bltz	t8,1668 <_mem_avail_start-0x7fffe998>
    1668:	00000025 	move	zero,zero
    166c:	00001504 	0x1504
    1670:	00250700 	0x250700
    1674:	16040000 	bne	s0,a0,1678 <_mem_avail_start-0x7fffe988>
    1678:	07000000 	bltz	t8,167c <_mem_avail_start-0x7fffe984>
    167c:	00000025 	move	zero,zero
    1680:	00001704 	0x1704
    1684:	00250700 	0x250700
    1688:	18040000 	0x18040000
    168c:	00000000 	nop
    1690:	00397c0b 	0x397c0b
    1694:	00430b00 	0x430b00
    1698:	0e000000 	jal	8000000 <_mem_avail_start-0x78000000>
    169c:	00000396 	0x396
    16a0:	10346e01 	beq	at,s4,1cea8 <_mem_avail_start-0x7ffe3158>
    16a4:	b90b0000 	swr	t3,0(t0)
    16a8:	00000016 	0x16
    16ac:	06010200 	bgez	s0,1eb0 <_mem_avail_start-0x7fffe150>
    16b0:	00000edc 	0xedc
    16b4:	0016ad0f 	0x16ad0f
    16b8:	08010200 	j	40800 <_mem_avail_start-0x7ffbf800>
    16bc:	00000ed3 	0xed3
    16c0:	0016b903 	sra	s7,s6,0x4
    16c4:	034a1000 	0x34a1000
    16c8:	4b030000 	c2	0x1030000
    16cc:	09000017 	j	400005c <_mem_avail_start-0x7bffffa4>
    16d0:	00000724 	0x724
    16d4:	0000170b 	0x170b
    16d8:	0016ad0a 	0x16ad0a
    16dc:	16ad0a00 	bne	s5,t5,3ee0 <_mem_avail_start-0x7fffc120>
    16e0:	ad0a0000 	sw	t2,0(t0)
    16e4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    16e8:	000016ad 	0x16ad
    16ec:	0016ad0a 	0x16ad0a
    16f0:	16ad0a00 	bne	s5,t5,3ef4 <_mem_avail_start-0x7fffc10c>
    16f4:	ad0a0000 	sw	t2,0(t0)
    16f8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    16fc:	000016ad 	0x16ad
    1700:	0016ad0a 	0x16ad0a
    1704:	16ad0a00 	bne	s5,t5,3f08 <_mem_avail_start-0x7fffc0f8>
    1708:	11000000 	beqz	t0,170c <_mem_avail_start-0x7fffe8f4>
    170c:	67010061 	0x67010061
    1710:	000016b9 	0x16b9
    1714:	0b670112 	j	d9c0448 <_mem_avail_start-0x7263fbb8>
    1718:	000016ad 	0x16ad
    171c:	0016ad0b 	0x16ad0b
    1720:	16ad0b00 	bne	s5,t5,4324 <_mem_avail_start-0x7fffbcdc>
    1724:	ad0b0000 	sw	t3,0(t0)
    1728:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    172c:	000016ad 	0x16ad
    1730:	0016ad0b 	0x16ad0b
    1734:	16ad0b00 	bne	s5,t5,4338 <_mem_avail_start-0x7fffbcc8>
    1738:	ad0b0000 	sw	t3,0(t0)
    173c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1740:	000016ad 	0x16ad
    1744:	0016ad0b 	0x16ad0b
    1748:	10000000 	b	174c <_mem_avail_start-0x7fffe8b4>
    174c:	000003cd 	break	0x0,0xf
    1750:	0017db03 	sra	k1,s7,0xc
    1754:	07240900 	0x7240900
    1758:	17960000 	bne	gp,s6,175c <_mem_avail_start-0x7fffe8a4>
    175c:	ad0a0000 	sw	t2,0(t0)
    1760:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1764:	000016ad 	0x16ad
    1768:	0016ad0a 	0x16ad0a
    176c:	16ad0a00 	bne	s5,t5,3f70 <_mem_avail_start-0x7fffc090>
    1770:	ad0a0000 	sw	t2,0(t0)
    1774:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1778:	000016ad 	0x16ad
    177c:	0016ad0a 	0x16ad0a
    1780:	16ad0a00 	bne	s5,t5,3f84 <_mem_avail_start-0x7fffc07c>
    1784:	ad0a0000 	sw	t2,0(t0)
    1788:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    178c:	000016ad 	0x16ad
    1790:	0016ad0a 	0x16ad0a
    1794:	61110000 	0x61110000
    1798:	b9670100 	swr	a3,256(t3)
    179c:	12000016 	beqz	s0,17f8 <_mem_avail_start-0x7fffe808>
    17a0:	ad0b6701 	sw	t3,26369(t0)
    17a4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    17a8:	000016ad 	0x16ad
    17ac:	0016ad0b 	0x16ad0b
    17b0:	16ad0b00 	bne	s5,t5,43b4 <_mem_avail_start-0x7fffbc4c>
    17b4:	ad0b0000 	sw	t3,0(t0)
    17b8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    17bc:	000016ad 	0x16ad
    17c0:	0016ad0b 	0x16ad0b
    17c4:	16ad0b00 	bne	s5,t5,43c8 <_mem_avail_start-0x7fffbc38>
    17c8:	ad0b0000 	sw	t3,0(t0)
    17cc:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    17d0:	000016ad 	0x16ad
    17d4:	0016ad0b 	0x16ad0b
    17d8:	10000000 	b	17dc <_mem_avail_start-0x7fffe824>
    17dc:	0000045a 	0x45a
    17e0:	00187503 	sra	t6,t8,0x14
    17e4:	07240900 	0x7240900
    17e8:	182b0000 	0x182b0000
    17ec:	ad0a0000 	sw	t2,0(t0)
    17f0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    17f4:	000016ad 	0x16ad
    17f8:	0016ad0a 	0x16ad0a
    17fc:	16ad0a00 	bne	s5,t5,4000 <_mem_avail_start-0x7fffc000>
    1800:	ad0a0000 	sw	t2,0(t0)
    1804:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1808:	000016ad 	0x16ad
    180c:	0016ad0a 	0x16ad0a
    1810:	16ad0a00 	bne	s5,t5,4014 <_mem_avail_start-0x7fffbfec>
    1814:	ad0a0000 	sw	t2,0(t0)
    1818:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    181c:	000016ad 	0x16ad
    1820:	0016ad0a 	0x16ad0a
    1824:	16ad0a00 	bne	s5,t5,4028 <_mem_avail_start-0x7fffbfd8>
    1828:	11000000 	beqz	t0,182c <_mem_avail_start-0x7fffe7d4>
    182c:	67010061 	0x67010061
    1830:	000016b9 	0x16b9
    1834:	0b670112 	j	d9c0448 <_mem_avail_start-0x7263fbb8>
    1838:	000016ad 	0x16ad
    183c:	0016ad0b 	0x16ad0b
    1840:	16ad0b00 	bne	s5,t5,4444 <_mem_avail_start-0x7fffbbbc>
    1844:	ad0b0000 	sw	t3,0(t0)
    1848:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    184c:	000016ad 	0x16ad
    1850:	0016ad0b 	0x16ad0b
    1854:	16ad0b00 	bne	s5,t5,4458 <_mem_avail_start-0x7fffbba8>
    1858:	ad0b0000 	sw	t3,0(t0)
    185c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1860:	000016ad 	0x16ad
    1864:	0016ad0b 	0x16ad0b
    1868:	16ad0b00 	bne	s5,t5,446c <_mem_avail_start-0x7fffbb94>
    186c:	ad0b0000 	sw	t3,0(t0)
    1870:	00000016 	0x16
    1874:	04f11000 	bgezal	a3,5878 <_mem_avail_start-0x7fffa788>
    1878:	19030000 	0x19030000
    187c:	09000019 	j	4000064 <_mem_avail_start-0x7bffff9c>
    1880:	00000724 	0x724
    1884:	000018ca 	0x18ca
    1888:	0016ad0a 	0x16ad0a
    188c:	16ad0a00 	bne	s5,t5,4090 <_mem_avail_start-0x7fffbf70>
    1890:	ad0a0000 	sw	t2,0(t0)
    1894:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1898:	000016ad 	0x16ad
    189c:	0016ad0a 	0x16ad0a
    18a0:	16ad0a00 	bne	s5,t5,40a4 <_mem_avail_start-0x7fffbf5c>
    18a4:	ad0a0000 	sw	t2,0(t0)
    18a8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    18ac:	000016ad 	0x16ad
    18b0:	0016ad0a 	0x16ad0a
    18b4:	16ad0a00 	bne	s5,t5,40b8 <_mem_avail_start-0x7fffbf48>
    18b8:	ad0a0000 	sw	t2,0(t0)
    18bc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    18c0:	000016ad 	0x16ad
    18c4:	0016ad0a 	0x16ad0a
    18c8:	61110000 	0x61110000
    18cc:	b9670100 	swr	a3,256(t3)
    18d0:	12000016 	beqz	s0,192c <_mem_avail_start-0x7fffe6d4>
    18d4:	ad0b6701 	sw	t3,26369(t0)
    18d8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    18dc:	000016ad 	0x16ad
    18e0:	0016ad0b 	0x16ad0b
    18e4:	16ad0b00 	bne	s5,t5,44e8 <_mem_avail_start-0x7fffbb18>
    18e8:	ad0b0000 	sw	t3,0(t0)
    18ec:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    18f0:	000016ad 	0x16ad
    18f4:	0016ad0b 	0x16ad0b
    18f8:	16ad0b00 	bne	s5,t5,44fc <_mem_avail_start-0x7fffbb04>
    18fc:	ad0b0000 	sw	t3,0(t0)
    1900:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1904:	000016ad 	0x16ad
    1908:	0016ad0b 	0x16ad0b
    190c:	16ad0b00 	bne	s5,t5,4510 <_mem_avail_start-0x7fffbaf0>
    1910:	ad0b0000 	sw	t3,0(t0)
    1914:	00000016 	0x16
    1918:	05921000 	bltzall	t4,591c <_mem_avail_start-0x7fffa6e4>
    191c:	c7030000 	lwc1	$f3,0(t8)
    1920:	09000019 	j	4000064 <_mem_avail_start-0x7bffff9c>
    1924:	00000724 	0x724
    1928:	00001973 	tltu	zero,zero,0x65
    192c:	0016ad0a 	0x16ad0a
    1930:	16ad0a00 	bne	s5,t5,4134 <_mem_avail_start-0x7fffbecc>
    1934:	ad0a0000 	sw	t2,0(t0)
    1938:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    193c:	000016ad 	0x16ad
    1940:	0016ad0a 	0x16ad0a
    1944:	16ad0a00 	bne	s5,t5,4148 <_mem_avail_start-0x7fffbeb8>
    1948:	ad0a0000 	sw	t2,0(t0)
    194c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1950:	000016ad 	0x16ad
    1954:	0016ad0a 	0x16ad0a
    1958:	16ad0a00 	bne	s5,t5,415c <_mem_avail_start-0x7fffbea4>
    195c:	ad0a0000 	sw	t2,0(t0)
    1960:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1964:	000016ad 	0x16ad
    1968:	0016ad0a 	0x16ad0a
    196c:	16ad0a00 	bne	s5,t5,4170 <_mem_avail_start-0x7fffbe90>
    1970:	11000000 	beqz	t0,1974 <_mem_avail_start-0x7fffe68c>
    1974:	67010061 	0x67010061
    1978:	000016b9 	0x16b9
    197c:	0b670112 	j	d9c0448 <_mem_avail_start-0x7263fbb8>
    1980:	000016ad 	0x16ad
    1984:	0016ad0b 	0x16ad0b
    1988:	16ad0b00 	bne	s5,t5,458c <_mem_avail_start-0x7fffba74>
    198c:	ad0b0000 	sw	t3,0(t0)
    1990:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1994:	000016ad 	0x16ad
    1998:	0016ad0b 	0x16ad0b
    199c:	16ad0b00 	bne	s5,t5,45a0 <_mem_avail_start-0x7fffba60>
    19a0:	ad0b0000 	sw	t3,0(t0)
    19a4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    19a8:	000016ad 	0x16ad
    19ac:	0016ad0b 	0x16ad0b
    19b0:	16ad0b00 	bne	s5,t5,45b4 <_mem_avail_start-0x7fffba4c>
    19b4:	ad0b0000 	sw	t3,0(t0)
    19b8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    19bc:	000016ad 	0x16ad
    19c0:	0016ad0b 	0x16ad0b
    19c4:	10000000 	b	19c8 <_mem_avail_start-0x7fffe638>
    19c8:	0000063d 	0x63d
    19cc:	001a7f03 	sra	t7,k0,0x1c
    19d0:	07240900 	0x7240900
    19d4:	1a260000 	0x1a260000
    19d8:	ad0a0000 	sw	t2,0(t0)
    19dc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    19e0:	000016ad 	0x16ad
    19e4:	0016ad0a 	0x16ad0a
    19e8:	16ad0a00 	bne	s5,t5,41ec <_mem_avail_start-0x7fffbe14>
    19ec:	ad0a0000 	sw	t2,0(t0)
    19f0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    19f4:	000016ad 	0x16ad
    19f8:	0016ad0a 	0x16ad0a
    19fc:	16ad0a00 	bne	s5,t5,4200 <_mem_avail_start-0x7fffbe00>
    1a00:	ad0a0000 	sw	t2,0(t0)
    1a04:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1a08:	000016ad 	0x16ad
    1a0c:	0016ad0a 	0x16ad0a
    1a10:	16ad0a00 	bne	s5,t5,4214 <_mem_avail_start-0x7fffbdec>
    1a14:	ad0a0000 	sw	t2,0(t0)
    1a18:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1a1c:	000016ad 	0x16ad
    1a20:	0016ad0a 	0x16ad0a
    1a24:	61110000 	0x61110000
    1a28:	b9670100 	swr	a3,256(t3)
    1a2c:	12000016 	beqz	s0,1a88 <_mem_avail_start-0x7fffe578>
    1a30:	ad0b6701 	sw	t3,26369(t0)
    1a34:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1a38:	000016ad 	0x16ad
    1a3c:	0016ad0b 	0x16ad0b
    1a40:	16ad0b00 	bne	s5,t5,4644 <_mem_avail_start-0x7fffb9bc>
    1a44:	ad0b0000 	sw	t3,0(t0)
    1a48:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1a4c:	000016ad 	0x16ad
    1a50:	0016ad0b 	0x16ad0b
    1a54:	16ad0b00 	bne	s5,t5,4658 <_mem_avail_start-0x7fffb9a8>
    1a58:	ad0b0000 	sw	t3,0(t0)
    1a5c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1a60:	000016ad 	0x16ad
    1a64:	0016ad0b 	0x16ad0b
    1a68:	16ad0b00 	bne	s5,t5,466c <_mem_avail_start-0x7fffb994>
    1a6c:	ad0b0000 	sw	t3,0(t0)
    1a70:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1a74:	000016ad 	0x16ad
    1a78:	0016ad0b 	0x16ad0b
    1a7c:	10000000 	b	1a80 <_mem_avail_start-0x7fffe580>
    1a80:	000006f2 	tlt	zero,zero,0x1b
    1a84:	001b4103 	sra	t0,k1,0x4
    1a88:	07240900 	0x7240900
    1a8c:	1ae30000 	0x1ae30000
    1a90:	ad0a0000 	sw	t2,0(t0)
    1a94:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1a98:	000016ad 	0x16ad
    1a9c:	0016ad0a 	0x16ad0a
    1aa0:	16ad0a00 	bne	s5,t5,42a4 <_mem_avail_start-0x7fffbd5c>
    1aa4:	ad0a0000 	sw	t2,0(t0)
    1aa8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1aac:	000016ad 	0x16ad
    1ab0:	0016ad0a 	0x16ad0a
    1ab4:	16ad0a00 	bne	s5,t5,42b8 <_mem_avail_start-0x7fffbd48>
    1ab8:	ad0a0000 	sw	t2,0(t0)
    1abc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1ac0:	000016ad 	0x16ad
    1ac4:	0016ad0a 	0x16ad0a
    1ac8:	16ad0a00 	bne	s5,t5,42cc <_mem_avail_start-0x7fffbd34>
    1acc:	ad0a0000 	sw	t2,0(t0)
    1ad0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1ad4:	000016ad 	0x16ad
    1ad8:	0016ad0a 	0x16ad0a
    1adc:	16ad0a00 	bne	s5,t5,42e0 <_mem_avail_start-0x7fffbd20>
    1ae0:	11000000 	beqz	t0,1ae4 <_mem_avail_start-0x7fffe51c>
    1ae4:	67010061 	0x67010061
    1ae8:	000016b9 	0x16b9
    1aec:	0b670112 	j	d9c0448 <_mem_avail_start-0x7263fbb8>
    1af0:	000016ad 	0x16ad
    1af4:	0016ad0b 	0x16ad0b
    1af8:	16ad0b00 	bne	s5,t5,46fc <_mem_avail_start-0x7fffb904>
    1afc:	ad0b0000 	sw	t3,0(t0)
    1b00:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1b04:	000016ad 	0x16ad
    1b08:	0016ad0b 	0x16ad0b
    1b0c:	16ad0b00 	bne	s5,t5,4710 <_mem_avail_start-0x7fffb8f0>
    1b10:	ad0b0000 	sw	t3,0(t0)
    1b14:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1b18:	000016ad 	0x16ad
    1b1c:	0016ad0b 	0x16ad0b
    1b20:	16ad0b00 	bne	s5,t5,4724 <_mem_avail_start-0x7fffb8dc>
    1b24:	ad0b0000 	sw	t3,0(t0)
    1b28:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1b2c:	000016ad 	0x16ad
    1b30:	0016ad0b 	0x16ad0b
    1b34:	16ad0b00 	bne	s5,t5,4738 <_mem_avail_start-0x7fffb8c8>
    1b38:	ad0b0000 	sw	t3,0(t0)
    1b3c:	00000016 	0x16
    1b40:	07b11000 	bgezal	sp,5b44 <_mem_avail_start-0x7fffa4bc>
    1b44:	0d030000 	jal	40c0000 <_mem_avail_start-0x7bf40000>
    1b48:	0900001c 	j	4000070 <_mem_avail_start-0x7bffff90>
    1b4c:	00000724 	0x724
    1b50:	00001baa 	0x1baa
    1b54:	0016ad0a 	0x16ad0a
    1b58:	16ad0a00 	bne	s5,t5,435c <_mem_avail_start-0x7fffbca4>
    1b5c:	ad0a0000 	sw	t2,0(t0)
    1b60:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1b64:	000016ad 	0x16ad
    1b68:	0016ad0a 	0x16ad0a
    1b6c:	16ad0a00 	bne	s5,t5,4370 <_mem_avail_start-0x7fffbc90>
    1b70:	ad0a0000 	sw	t2,0(t0)
    1b74:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1b78:	000016ad 	0x16ad
    1b7c:	0016ad0a 	0x16ad0a
    1b80:	16ad0a00 	bne	s5,t5,4384 <_mem_avail_start-0x7fffbc7c>
    1b84:	ad0a0000 	sw	t2,0(t0)
    1b88:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1b8c:	000016ad 	0x16ad
    1b90:	0016ad0a 	0x16ad0a
    1b94:	16ad0a00 	bne	s5,t5,4398 <_mem_avail_start-0x7fffbc68>
    1b98:	ad0a0000 	sw	t2,0(t0)
    1b9c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1ba0:	000016ad 	0x16ad
    1ba4:	0016ad0a 	0x16ad0a
    1ba8:	61110000 	0x61110000
    1bac:	b9670100 	swr	a3,256(t3)
    1bb0:	12000016 	beqz	s0,1c0c <_mem_avail_start-0x7fffe3f4>
    1bb4:	ad0b6701 	sw	t3,26369(t0)
    1bb8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1bbc:	000016ad 	0x16ad
    1bc0:	0016ad0b 	0x16ad0b
    1bc4:	16ad0b00 	bne	s5,t5,47c8 <_mem_avail_start-0x7fffb838>
    1bc8:	ad0b0000 	sw	t3,0(t0)
    1bcc:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1bd0:	000016ad 	0x16ad
    1bd4:	0016ad0b 	0x16ad0b
    1bd8:	16ad0b00 	bne	s5,t5,47dc <_mem_avail_start-0x7fffb824>
    1bdc:	ad0b0000 	sw	t3,0(t0)
    1be0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1be4:	000016ad 	0x16ad
    1be8:	0016ad0b 	0x16ad0b
    1bec:	16ad0b00 	bne	s5,t5,47f0 <_mem_avail_start-0x7fffb810>
    1bf0:	ad0b0000 	sw	t3,0(t0)
    1bf4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1bf8:	000016ad 	0x16ad
    1bfc:	0016ad0b 	0x16ad0b
    1c00:	16ad0b00 	bne	s5,t5,4804 <_mem_avail_start-0x7fffb7fc>
    1c04:	ad0b0000 	sw	t3,0(t0)
    1c08:	00000016 	0x16
    1c0c:	087a1000 	j	1e84000 <_mem_avail_start-0x7e17c000>
    1c10:	e3030000 	sc	v1,0(t8)
    1c14:	0900001c 	j	4000070 <_mem_avail_start-0x7bffff90>
    1c18:	00000724 	0x724
    1c1c:	00001c7b 	0x1c7b
    1c20:	0016ad0a 	0x16ad0a
    1c24:	16ad0a00 	bne	s5,t5,4428 <_mem_avail_start-0x7fffbbd8>
    1c28:	ad0a0000 	sw	t2,0(t0)
    1c2c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1c30:	000016ad 	0x16ad
    1c34:	0016ad0a 	0x16ad0a
    1c38:	16ad0a00 	bne	s5,t5,443c <_mem_avail_start-0x7fffbbc4>
    1c3c:	ad0a0000 	sw	t2,0(t0)
    1c40:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1c44:	000016ad 	0x16ad
    1c48:	0016ad0a 	0x16ad0a
    1c4c:	16ad0a00 	bne	s5,t5,4450 <_mem_avail_start-0x7fffbbb0>
    1c50:	ad0a0000 	sw	t2,0(t0)
    1c54:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1c58:	000016ad 	0x16ad
    1c5c:	0016ad0a 	0x16ad0a
    1c60:	16ad0a00 	bne	s5,t5,4464 <_mem_avail_start-0x7fffbb9c>
    1c64:	ad0a0000 	sw	t2,0(t0)
    1c68:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1c6c:	000016ad 	0x16ad
    1c70:	0016ad0a 	0x16ad0a
    1c74:	16ad0a00 	bne	s5,t5,4478 <_mem_avail_start-0x7fffbb88>
    1c78:	11000000 	beqz	t0,1c7c <_mem_avail_start-0x7fffe384>
    1c7c:	67010061 	0x67010061
    1c80:	000016b9 	0x16b9
    1c84:	0b670112 	j	d9c0448 <_mem_avail_start-0x7263fbb8>
    1c88:	000016ad 	0x16ad
    1c8c:	0016ad0b 	0x16ad0b
    1c90:	16ad0b00 	bne	s5,t5,4894 <_mem_avail_start-0x7fffb76c>
    1c94:	ad0b0000 	sw	t3,0(t0)
    1c98:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1c9c:	000016ad 	0x16ad
    1ca0:	0016ad0b 	0x16ad0b
    1ca4:	16ad0b00 	bne	s5,t5,48a8 <_mem_avail_start-0x7fffb758>
    1ca8:	ad0b0000 	sw	t3,0(t0)
    1cac:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1cb0:	000016ad 	0x16ad
    1cb4:	0016ad0b 	0x16ad0b
    1cb8:	16ad0b00 	bne	s5,t5,48bc <_mem_avail_start-0x7fffb744>
    1cbc:	ad0b0000 	sw	t3,0(t0)
    1cc0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1cc4:	000016ad 	0x16ad
    1cc8:	0016ad0b 	0x16ad0b
    1ccc:	16ad0b00 	bne	s5,t5,48d0 <_mem_avail_start-0x7fffb730>
    1cd0:	ad0b0000 	sw	t3,0(t0)
    1cd4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1cd8:	000016ad 	0x16ad
    1cdc:	0016ad0b 	0x16ad0b
    1ce0:	10000000 	b	1ce4 <_mem_avail_start-0x7fffe31c>
    1ce4:	0000094d 	break	0x0,0x25
    1ce8:	001d3703 	sra	a2,sp,0x1c
    1cec:	07240900 	0x7240900
    1cf0:	1d100000 	0x1d100000
    1cf4:	ad0a0000 	sw	t2,0(t0)
    1cf8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1cfc:	000016ad 	0x16ad
    1d00:	0016ad0a 	0x16ad0a
    1d04:	16ad0a00 	bne	s5,t5,4508 <_mem_avail_start-0x7fffbaf8>
    1d08:	ad0a0000 	sw	t2,0(t0)
    1d0c:	00000016 	0x16
    1d10:	01006111 	0x1006111
    1d14:	0016b967 	0x16b967
    1d18:	67011200 	0x67011200
    1d1c:	0016ad0b 	0x16ad0b
    1d20:	16ad0b00 	bne	s5,t5,4924 <_mem_avail_start-0x7fffb6dc>
    1d24:	ad0b0000 	sw	t3,0(t0)
    1d28:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1d2c:	000016ad 	0x16ad
    1d30:	0016ad0b 	0x16ad0b
    1d34:	10000000 	b	1d38 <_mem_avail_start-0x7fffe2c8>
    1d38:	0000099e 	0x99e
    1d3c:	001e1703 	sra	v0,s8,0x1c
    1d40:	07240900 	0x7240900
    1d44:	1daa0000 	0x1daa0000
    1d48:	ad0a0000 	sw	t2,0(t0)
    1d4c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1d50:	000016ad 	0x16ad
    1d54:	0016ad0a 	0x16ad0a
    1d58:	16ad0a00 	bne	s5,t5,455c <_mem_avail_start-0x7fffbaa4>
    1d5c:	ad0a0000 	sw	t2,0(t0)
    1d60:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1d64:	000016ad 	0x16ad
    1d68:	0016ad0a 	0x16ad0a
    1d6c:	16ad0a00 	bne	s5,t5,4570 <_mem_avail_start-0x7fffba90>
    1d70:	ad0a0000 	sw	t2,0(t0)
    1d74:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1d78:	000016ad 	0x16ad
    1d7c:	0016ad0a 	0x16ad0a
    1d80:	16ad0a00 	bne	s5,t5,4584 <_mem_avail_start-0x7fffba7c>
    1d84:	ad0a0000 	sw	t2,0(t0)
    1d88:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1d8c:	000016ad 	0x16ad
    1d90:	0016ad0a 	0x16ad0a
    1d94:	16ad0a00 	bne	s5,t5,4598 <_mem_avail_start-0x7fffba68>
    1d98:	ad0a0000 	sw	t2,0(t0)
    1d9c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1da0:	000016ad 	0x16ad
    1da4:	0016ad0a 	0x16ad0a
    1da8:	61110000 	0x61110000
    1dac:	b9670100 	swr	a3,256(t3)
    1db0:	12000016 	beqz	s0,1e0c <_mem_avail_start-0x7fffe1f4>
    1db4:	ad0b6701 	sw	t3,26369(t0)
    1db8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1dbc:	000016ad 	0x16ad
    1dc0:	0016ad0b 	0x16ad0b
    1dc4:	16ad0b00 	bne	s5,t5,49c8 <_mem_avail_start-0x7fffb638>
    1dc8:	ad0b0000 	sw	t3,0(t0)
    1dcc:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1dd0:	000016ad 	0x16ad
    1dd4:	0016ad0b 	0x16ad0b
    1dd8:	16ad0b00 	bne	s5,t5,49dc <_mem_avail_start-0x7fffb624>
    1ddc:	ad0b0000 	sw	t3,0(t0)
    1de0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1de4:	000016ad 	0x16ad
    1de8:	0016ad0b 	0x16ad0b
    1dec:	16ad0b00 	bne	s5,t5,49f0 <_mem_avail_start-0x7fffb610>
    1df0:	ad0b0000 	sw	t3,0(t0)
    1df4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1df8:	000016ad 	0x16ad
    1dfc:	0016ad0b 	0x16ad0b
    1e00:	16ad0b00 	bne	s5,t5,4a04 <_mem_avail_start-0x7fffb5fc>
    1e04:	ad0b0000 	sw	t3,0(t0)
    1e08:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1e0c:	000016ad 	0x16ad
    1e10:	0016ad0b 	0x16ad0b
    1e14:	10000000 	b	1e18 <_mem_avail_start-0x7fffe1e8>
    1e18:	00000a7b 	0xa7b
    1e1c:	001e7503 	sra	t6,s8,0x14
    1e20:	07240900 	0x7240900
    1e24:	1e490000 	0x1e490000
    1e28:	ad0a0000 	sw	t2,0(t0)
    1e2c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1e30:	000016ad 	0x16ad
    1e34:	0016ad0a 	0x16ad0a
    1e38:	16ad0a00 	bne	s5,t5,463c <_mem_avail_start-0x7fffb9c4>
    1e3c:	ad0a0000 	sw	t2,0(t0)
    1e40:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1e44:	000016ad 	0x16ad
    1e48:	00611100 	0x611100
    1e4c:	16b96701 	bne	s5,t9,1ba54 <_mem_avail_start-0x7ffe45ac>
    1e50:	01120000 	0x1120000
    1e54:	16ad0b67 	bne	s5,t5,4bf4 <_mem_avail_start-0x7fffb40c>
    1e58:	ad0b0000 	sw	t3,0(t0)
    1e5c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1e60:	000016ad 	0x16ad
    1e64:	0016ad0b 	0x16ad0b
    1e68:	16ad0b00 	bne	s5,t5,4a6c <_mem_avail_start-0x7fffb594>
    1e6c:	ad0b0000 	sw	t3,0(t0)
    1e70:	00000016 	0x16
    1e74:	0ad61000 	j	b584000 <_mem_avail_start-0x74a7c000>
    1e78:	5f030000 	0x5f030000
    1e7c:	0900001f 	j	400007c <_mem_avail_start-0x7bffff84>
    1e80:	00000724 	0x724
    1e84:	00001eed 	0x1eed
    1e88:	0016ad0a 	0x16ad0a
    1e8c:	16ad0a00 	bne	s5,t5,4690 <_mem_avail_start-0x7fffb970>
    1e90:	ad0a0000 	sw	t2,0(t0)
    1e94:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1e98:	000016ad 	0x16ad
    1e9c:	0016ad0a 	0x16ad0a
    1ea0:	16ad0a00 	bne	s5,t5,46a4 <_mem_avail_start-0x7fffb95c>
    1ea4:	ad0a0000 	sw	t2,0(t0)
    1ea8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1eac:	000016ad 	0x16ad
    1eb0:	0016ad0a 	0x16ad0a
    1eb4:	16ad0a00 	bne	s5,t5,46b8 <_mem_avail_start-0x7fffb948>
    1eb8:	ad0a0000 	sw	t2,0(t0)
    1ebc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1ec0:	000016ad 	0x16ad
    1ec4:	0016ad0a 	0x16ad0a
    1ec8:	16ad0a00 	bne	s5,t5,46cc <_mem_avail_start-0x7fffb934>
    1ecc:	ad0a0000 	sw	t2,0(t0)
    1ed0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1ed4:	000016ad 	0x16ad
    1ed8:	0016ad0a 	0x16ad0a
    1edc:	16ad0a00 	bne	s5,t5,46e0 <_mem_avail_start-0x7fffb920>
    1ee0:	ad0a0000 	sw	t2,0(t0)
    1ee4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1ee8:	000016ad 	0x16ad
    1eec:	00611100 	0x611100
    1ef0:	16b96701 	bne	s5,t9,1baf8 <_mem_avail_start-0x7ffe4508>
    1ef4:	01120000 	0x1120000
    1ef8:	16ad0b67 	bne	s5,t5,4c98 <_mem_avail_start-0x7fffb368>
    1efc:	ad0b0000 	sw	t3,0(t0)
    1f00:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1f04:	000016ad 	0x16ad
    1f08:	0016ad0b 	0x16ad0b
    1f0c:	16ad0b00 	bne	s5,t5,4b10 <_mem_avail_start-0x7fffb4f0>
    1f10:	ad0b0000 	sw	t3,0(t0)
    1f14:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1f18:	000016ad 	0x16ad
    1f1c:	0016ad0b 	0x16ad0b
    1f20:	16ad0b00 	bne	s5,t5,4b24 <_mem_avail_start-0x7fffb4dc>
    1f24:	ad0b0000 	sw	t3,0(t0)
    1f28:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1f2c:	000016ad 	0x16ad
    1f30:	0016ad0b 	0x16ad0b
    1f34:	16ad0b00 	bne	s5,t5,4b38 <_mem_avail_start-0x7fffb4c8>
    1f38:	ad0b0000 	sw	t3,0(t0)
    1f3c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1f40:	000016ad 	0x16ad
    1f44:	0016ad0b 	0x16ad0b
    1f48:	16ad0b00 	bne	s5,t5,4b4c <_mem_avail_start-0x7fffb4b4>
    1f4c:	ad0b0000 	sw	t3,0(t0)
    1f50:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1f54:	000016ad 	0x16ad
    1f58:	0016ad0b 	0x16ad0b
    1f5c:	10000000 	b	1f60 <_mem_avail_start-0x7fffe0a0>
    1f60:	00000bbd 	0xbbd
    1f64:	001fc703 	sra	t8,ra,0x1c
    1f68:	07240900 	0x7240900
    1f6c:	1f960000 	0x1f960000
    1f70:	ad0a0000 	sw	t2,0(t0)
    1f74:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1f78:	000016ad 	0x16ad
    1f7c:	0016ad0a 	0x16ad0a
    1f80:	16ad0a00 	bne	s5,t5,4784 <_mem_avail_start-0x7fffb87c>
    1f84:	ad0a0000 	sw	t2,0(t0)
    1f88:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1f8c:	000016ad 	0x16ad
    1f90:	0016ad0a 	0x16ad0a
    1f94:	61110000 	0x61110000
    1f98:	b9670100 	swr	a3,256(t3)
    1f9c:	12000016 	beqz	s0,1ff8 <_mem_avail_start-0x7fffe008>
    1fa0:	ad0b6701 	sw	t3,26369(t0)
    1fa4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1fa8:	000016ad 	0x16ad
    1fac:	0016ad0b 	0x16ad0b
    1fb0:	16ad0b00 	bne	s5,t5,4bb4 <_mem_avail_start-0x7fffb44c>
    1fb4:	ad0b0000 	sw	t3,0(t0)
    1fb8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    1fbc:	000016ad 	0x16ad
    1fc0:	0016ad0b 	0x16ad0b
    1fc4:	10000000 	b	1fc8 <_mem_avail_start-0x7fffe038>
    1fc8:	00000c22 	0xc22
    1fcc:	0020bb03 	0x20bb03
    1fd0:	07240900 	0x7240900
    1fd4:	20440000 	addi	a0,v0,0
    1fd8:	ad0a0000 	sw	t2,0(t0)
    1fdc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1fe0:	000016ad 	0x16ad
    1fe4:	0016ad0a 	0x16ad0a
    1fe8:	16ad0a00 	bne	s5,t5,47ec <_mem_avail_start-0x7fffb814>
    1fec:	ad0a0000 	sw	t2,0(t0)
    1ff0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    1ff4:	000016ad 	0x16ad
    1ff8:	0016ad0a 	0x16ad0a
    1ffc:	16ad0a00 	bne	s5,t5,4800 <_mem_avail_start-0x7fffb800>
    2000:	ad0a0000 	sw	t2,0(t0)
    2004:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2008:	000016ad 	0x16ad
    200c:	0016ad0a 	0x16ad0a
    2010:	16ad0a00 	bne	s5,t5,4814 <_mem_avail_start-0x7fffb7ec>
    2014:	ad0a0000 	sw	t2,0(t0)
    2018:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    201c:	000016ad 	0x16ad
    2020:	0016ad0a 	0x16ad0a
    2024:	16ad0a00 	bne	s5,t5,4828 <_mem_avail_start-0x7fffb7d8>
    2028:	ad0a0000 	sw	t2,0(t0)
    202c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2030:	000016ad 	0x16ad
    2034:	0016ad0a 	0x16ad0a
    2038:	16ad0a00 	bne	s5,t5,483c <_mem_avail_start-0x7fffb7c4>
    203c:	ad0a0000 	sw	t2,0(t0)
    2040:	00000016 	0x16
    2044:	01006111 	0x1006111
    2048:	0016b967 	0x16b967
    204c:	67011200 	0x67011200
    2050:	0016ad0b 	0x16ad0b
    2054:	16ad0b00 	bne	s5,t5,4c58 <_mem_avail_start-0x7fffb3a8>
    2058:	ad0b0000 	sw	t3,0(t0)
    205c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2060:	000016ad 	0x16ad
    2064:	0016ad0b 	0x16ad0b
    2068:	16ad0b00 	bne	s5,t5,4c6c <_mem_avail_start-0x7fffb394>
    206c:	ad0b0000 	sw	t3,0(t0)
    2070:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2074:	000016ad 	0x16ad
    2078:	0016ad0b 	0x16ad0b
    207c:	16ad0b00 	bne	s5,t5,4c80 <_mem_avail_start-0x7fffb380>
    2080:	ad0b0000 	sw	t3,0(t0)
    2084:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2088:	000016ad 	0x16ad
    208c:	0016ad0b 	0x16ad0b
    2090:	16ad0b00 	bne	s5,t5,4c94 <_mem_avail_start-0x7fffb36c>
    2094:	ad0b0000 	sw	t3,0(t0)
    2098:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    209c:	000016ad 	0x16ad
    20a0:	0016ad0b 	0x16ad0b
    20a4:	16ad0b00 	bne	s5,t5,4ca8 <_mem_avail_start-0x7fffb358>
    20a8:	ad0b0000 	sw	t3,0(t0)
    20ac:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    20b0:	000016ad 	0x16ad
    20b4:	0016ad0b 	0x16ad0b
    20b8:	10000000 	b	20bc <_mem_avail_start-0x7fffdf44>
    20bc:	00000d13 	0xd13
    20c0:	0020f103 	0x20f103
    20c4:	07240900 	0x7240900
    20c8:	20d90000 	addi	t9,a2,0
    20cc:	ad0a0000 	sw	t2,0(t0)
    20d0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    20d4:	000016ad 	0x16ad
    20d8:	00611100 	0x611100
    20dc:	16b96701 	bne	s5,t9,1bce4 <_mem_avail_start-0x7ffe431c>
    20e0:	01120000 	0x1120000
    20e4:	16ad0b67 	bne	s5,t5,4e84 <_mem_avail_start-0x7fffb17c>
    20e8:	ad0b0000 	sw	t3,0(t0)
    20ec:	00000016 	0x16
    20f0:	0d461000 	jal	5184000 <_mem_avail_start-0x7ae7c000>
    20f4:	63030000 	0x63030000
    20f8:	09000021 	j	4000084 <_mem_avail_start-0x7bffff7c>
    20fc:	00000724 	0x724
    2100:	0000212d 	0x212d
    2104:	0016ad0a 	0x16ad0a
    2108:	16ad0a00 	bne	s5,t5,490c <_mem_avail_start-0x7fffb6f4>
    210c:	ad0a0000 	sw	t2,0(t0)
    2110:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2114:	000016ad 	0x16ad
    2118:	0016ad0a 	0x16ad0a
    211c:	16ad0a00 	bne	s5,t5,4920 <_mem_avail_start-0x7fffb6e0>
    2120:	ad0a0000 	sw	t2,0(t0)
    2124:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2128:	000016ad 	0x16ad
    212c:	00611100 	0x611100
    2130:	16b96701 	bne	s5,t9,1bd38 <_mem_avail_start-0x7ffe42c8>
    2134:	01120000 	0x1120000
    2138:	16ad0b67 	bne	s5,t5,4ed8 <_mem_avail_start-0x7fffb128>
    213c:	ad0b0000 	sw	t3,0(t0)
    2140:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2144:	000016ad 	0x16ad
    2148:	0016ad0b 	0x16ad0b
    214c:	16ad0b00 	bne	s5,t5,4d50 <_mem_avail_start-0x7fffb2b0>
    2150:	ad0b0000 	sw	t3,0(t0)
    2154:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2158:	000016ad 	0x16ad
    215c:	0016ad0b 	0x16ad0b
    2160:	10000000 	b	2164 <_mem_avail_start-0x7fffde9c>
    2164:	00000db5 	0xdb5
    2168:	00226103 	0x226103
    216c:	07240900 	0x7240900
    2170:	21e50000 	addi	a1,t7,0
    2174:	ad0a0000 	sw	t2,0(t0)
    2178:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    217c:	000016ad 	0x16ad
    2180:	0016ad0a 	0x16ad0a
    2184:	16ad0a00 	bne	s5,t5,4988 <_mem_avail_start-0x7fffb678>
    2188:	ad0a0000 	sw	t2,0(t0)
    218c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2190:	000016ad 	0x16ad
    2194:	0016ad0a 	0x16ad0a
    2198:	16ad0a00 	bne	s5,t5,499c <_mem_avail_start-0x7fffb664>
    219c:	ad0a0000 	sw	t2,0(t0)
    21a0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    21a4:	000016ad 	0x16ad
    21a8:	0016ad0a 	0x16ad0a
    21ac:	16ad0a00 	bne	s5,t5,49b0 <_mem_avail_start-0x7fffb650>
    21b0:	ad0a0000 	sw	t2,0(t0)
    21b4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    21b8:	000016ad 	0x16ad
    21bc:	0016ad0a 	0x16ad0a
    21c0:	16ad0a00 	bne	s5,t5,49c4 <_mem_avail_start-0x7fffb63c>
    21c4:	ad0a0000 	sw	t2,0(t0)
    21c8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    21cc:	000016ad 	0x16ad
    21d0:	0016ad0a 	0x16ad0a
    21d4:	16ad0a00 	bne	s5,t5,49d8 <_mem_avail_start-0x7fffb628>
    21d8:	ad0a0000 	sw	t2,0(t0)
    21dc:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    21e0:	000016ad 	0x16ad
    21e4:	00611100 	0x611100
    21e8:	16b96701 	bne	s5,t9,1bdf0 <_mem_avail_start-0x7ffe4210>
    21ec:	01120000 	0x1120000
    21f0:	16ad0b67 	bne	s5,t5,4f90 <_mem_avail_start-0x7fffb070>
    21f4:	ad0b0000 	sw	t3,0(t0)
    21f8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    21fc:	000016ad 	0x16ad
    2200:	0016ad0b 	0x16ad0b
    2204:	16ad0b00 	bne	s5,t5,4e08 <_mem_avail_start-0x7fffb1f8>
    2208:	ad0b0000 	sw	t3,0(t0)
    220c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2210:	000016ad 	0x16ad
    2214:	0016ad0b 	0x16ad0b
    2218:	16ad0b00 	bne	s5,t5,4e1c <_mem_avail_start-0x7fffb1e4>
    221c:	ad0b0000 	sw	t3,0(t0)
    2220:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2224:	000016ad 	0x16ad
    2228:	0016ad0b 	0x16ad0b
    222c:	16ad0b00 	bne	s5,t5,4e30 <_mem_avail_start-0x7fffb1d0>
    2230:	ad0b0000 	sw	t3,0(t0)
    2234:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2238:	000016ad 	0x16ad
    223c:	0016ad0b 	0x16ad0b
    2240:	16ad0b00 	bne	s5,t5,4e44 <_mem_avail_start-0x7fffb1bc>
    2244:	ad0b0000 	sw	t3,0(t0)
    2248:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    224c:	000016ad 	0x16ad
    2250:	0016ad0b 	0x16ad0b
    2254:	16ad0b00 	bne	s5,t5,4e58 <_mem_avail_start-0x7fffb1a8>
    2258:	ad0b0000 	sw	t3,0(t0)
    225c:	00000016 	0x16
    2260:	0eb01000 	jal	ac04000 <_mem_avail_start-0x753fc000>
    2264:	a1030000 	sb	v1,0(t0)
    2268:	09000022 	j	4000088 <_mem_avail_start-0x7bffff78>
    226c:	00000724 	0x724
    2270:	00002284 	0x2284
    2274:	0016ad0a 	0x16ad0a
    2278:	16ad0a00 	bne	s5,t5,4a7c <_mem_avail_start-0x7fffb584>
    227c:	ad0a0000 	sw	t2,0(t0)
    2280:	00000016 	0x16
    2284:	01006111 	0x1006111
    2288:	0016b967 	0x16b967
    228c:	67011200 	0x67011200
    2290:	0016ad0b 	0x16ad0b
    2294:	16ad0b00 	bne	s5,t5,4e98 <_mem_avail_start-0x7fffb168>
    2298:	ad0b0000 	sw	t3,0(t0)
    229c:	00000016 	0x16
    22a0:	0eed1000 	jal	bb44000 <_mem_avail_start-0x744bc000>
    22a4:	cd030000 	pref	0x3,0(t0)
    22a8:	09000022 	j	4000088 <_mem_avail_start-0x7bffff78>
    22ac:	00000724 	0x724
    22b0:	000022ba 	0x22ba
    22b4:	0016ad0a 	0x16ad0a
    22b8:	61110000 	0x61110000
    22bc:	b9670100 	swr	a3,256(t3)
    22c0:	12000016 	beqz	s0,231c <_mem_avail_start-0x7fffdce4>
    22c4:	ad0b6701 	sw	t3,26369(t0)
    22c8:	00000016 	0x16
    22cc:	0f161000 	jal	c584000 <_mem_avail_start-0x73a7c000>
    22d0:	49030000 	bc2tl	22d4 <_mem_avail_start-0x7fffdd2c>
    22d4:	09000023 	j	400008c <_mem_avail_start-0x7bffff74>
    22d8:	00000724 	0x724
    22dc:	0000230e 	0x230e
    22e0:	0016ad0a 	0x16ad0a
    22e4:	16ad0a00 	bne	s5,t5,4ae8 <_mem_avail_start-0x7fffb518>
    22e8:	ad0a0000 	sw	t2,0(t0)
    22ec:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    22f0:	000016ad 	0x16ad
    22f4:	0016ad0a 	0x16ad0a
    22f8:	16ad0a00 	bne	s5,t5,4afc <_mem_avail_start-0x7fffb504>
    22fc:	ad0a0000 	sw	t2,0(t0)
    2300:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2304:	000016ad 	0x16ad
    2308:	0016ad0a 	0x16ad0a
    230c:	61110000 	0x61110000
    2310:	b9670100 	swr	a3,256(t3)
    2314:	12000016 	beqz	s0,2370 <_mem_avail_start-0x7fffdc90>
    2318:	ad0b6701 	sw	t3,26369(t0)
    231c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2320:	000016ad 	0x16ad
    2324:	0016ad0b 	0x16ad0b
    2328:	16ad0b00 	bne	s5,t5,4f2c <_mem_avail_start-0x7fffb0d4>
    232c:	ad0b0000 	sw	t3,0(t0)
    2330:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2334:	000016ad 	0x16ad
    2338:	0016ad0b 	0x16ad0b
    233c:	16ad0b00 	bne	s5,t5,4f40 <_mem_avail_start-0x7fffb0c0>
    2340:	ad0b0000 	sw	t3,0(t0)
    2344:	00000016 	0x16
    2348:	0f8f1000 	jal	e3c4000 <_mem_avail_start-0x71c3c000>
    234c:	51030000 	beql	t0,v1,2350 <_mem_avail_start-0x7fffdcb0>
    2350:	09000024 	j	4000090 <_mem_avail_start-0x7bffff70>
    2354:	00000724 	0x724
    2358:	000023d0 	0x23d0
    235c:	0016ad0a 	0x16ad0a
    2360:	16ad0a00 	bne	s5,t5,4b64 <_mem_avail_start-0x7fffb49c>
    2364:	ad0a0000 	sw	t2,0(t0)
    2368:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    236c:	000016ad 	0x16ad
    2370:	0016ad0a 	0x16ad0a
    2374:	16ad0a00 	bne	s5,t5,4b78 <_mem_avail_start-0x7fffb488>
    2378:	ad0a0000 	sw	t2,0(t0)
    237c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2380:	000016ad 	0x16ad
    2384:	0016ad0a 	0x16ad0a
    2388:	16ad0a00 	bne	s5,t5,4b8c <_mem_avail_start-0x7fffb474>
    238c:	ad0a0000 	sw	t2,0(t0)
    2390:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2394:	000016ad 	0x16ad
    2398:	0016ad0a 	0x16ad0a
    239c:	16ad0a00 	bne	s5,t5,4ba0 <_mem_avail_start-0x7fffb460>
    23a0:	ad0a0000 	sw	t2,0(t0)
    23a4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    23a8:	000016ad 	0x16ad
    23ac:	0016ad0a 	0x16ad0a
    23b0:	16ad0a00 	bne	s5,t5,4bb4 <_mem_avail_start-0x7fffb44c>
    23b4:	ad0a0000 	sw	t2,0(t0)
    23b8:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    23bc:	000016ad 	0x16ad
    23c0:	0016ad0a 	0x16ad0a
    23c4:	16ad0a00 	bne	s5,t5,4bc8 <_mem_avail_start-0x7fffb438>
    23c8:	ad0a0000 	sw	t2,0(t0)
    23cc:	00000016 	0x16
    23d0:	01006111 	0x1006111
    23d4:	0016b967 	0x16b967
    23d8:	67011200 	0x67011200
    23dc:	0016ad0b 	0x16ad0b
    23e0:	16ad0b00 	bne	s5,t5,4fe4 <_mem_avail_start-0x7fffb01c>
    23e4:	ad0b0000 	sw	t3,0(t0)
    23e8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    23ec:	000016ad 	0x16ad
    23f0:	0016ad0b 	0x16ad0b
    23f4:	16ad0b00 	bne	s5,t5,4ff8 <_mem_avail_start-0x7fffb008>
    23f8:	ad0b0000 	sw	t3,0(t0)
    23fc:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2400:	000016ad 	0x16ad
    2404:	0016ad0b 	0x16ad0b
    2408:	16ad0b00 	bne	s5,t5,500c <_mem_avail_start-0x7fffaff4>
    240c:	ad0b0000 	sw	t3,0(t0)
    2410:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2414:	000016ad 	0x16ad
    2418:	0016ad0b 	0x16ad0b
    241c:	16ad0b00 	bne	s5,t5,5020 <_mem_avail_start-0x7fffafe0>
    2420:	ad0b0000 	sw	t3,0(t0)
    2424:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2428:	000016ad 	0x16ad
    242c:	0016ad0b 	0x16ad0b
    2430:	16ad0b00 	bne	s5,t5,5034 <_mem_avail_start-0x7fffafcc>
    2434:	ad0b0000 	sw	t3,0(t0)
    2438:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    243c:	000016ad 	0x16ad
    2440:	0016ad0b 	0x16ad0b
    2444:	16ad0b00 	bne	s5,t5,5048 <_mem_avail_start-0x7fffafb8>
    2448:	ad0b0000 	sw	t3,0(t0)
    244c:	00000016 	0x16
    2450:	10941000 	beq	a0,s4,6454 <_mem_avail_start-0x7fff9bac>
    2454:	6d030000 	0x6d030000
    2458:	09000025 	j	4000094 <_mem_avail_start-0x7bffff6c>
    245c:	00000724 	0x724
    2460:	000024e2 	0x24e2
    2464:	0016ad0a 	0x16ad0a
    2468:	16ad0a00 	bne	s5,t5,4c6c <_mem_avail_start-0x7fffb394>
    246c:	ad0a0000 	sw	t2,0(t0)
    2470:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2474:	000016ad 	0x16ad
    2478:	0016ad0a 	0x16ad0a
    247c:	16ad0a00 	bne	s5,t5,4c80 <_mem_avail_start-0x7fffb380>
    2480:	ad0a0000 	sw	t2,0(t0)
    2484:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2488:	000016ad 	0x16ad
    248c:	0016ad0a 	0x16ad0a
    2490:	16ad0a00 	bne	s5,t5,4c94 <_mem_avail_start-0x7fffb36c>
    2494:	ad0a0000 	sw	t2,0(t0)
    2498:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    249c:	000016ad 	0x16ad
    24a0:	0016ad0a 	0x16ad0a
    24a4:	16ad0a00 	bne	s5,t5,4ca8 <_mem_avail_start-0x7fffb358>
    24a8:	ad0a0000 	sw	t2,0(t0)
    24ac:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    24b0:	000016ad 	0x16ad
    24b4:	0016ad0a 	0x16ad0a
    24b8:	16ad0a00 	bne	s5,t5,4cbc <_mem_avail_start-0x7fffb344>
    24bc:	ad0a0000 	sw	t2,0(t0)
    24c0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    24c4:	000016ad 	0x16ad
    24c8:	0016ad0a 	0x16ad0a
    24cc:	16ad0a00 	bne	s5,t5,4cd0 <_mem_avail_start-0x7fffb330>
    24d0:	ad0a0000 	sw	t2,0(t0)
    24d4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    24d8:	000016ad 	0x16ad
    24dc:	0016ad0a 	0x16ad0a
    24e0:	61110000 	0x61110000
    24e4:	b9670100 	swr	a3,256(t3)
    24e8:	12000016 	beqz	s0,2544 <_mem_avail_start-0x7fffdabc>
    24ec:	ad0b6701 	sw	t3,26369(t0)
    24f0:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    24f4:	000016ad 	0x16ad
    24f8:	0016ad0b 	0x16ad0b
    24fc:	16ad0b00 	bne	s5,t5,5100 <_mem_avail_start-0x7fffaf00>
    2500:	ad0b0000 	sw	t3,0(t0)
    2504:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2508:	000016ad 	0x16ad
    250c:	0016ad0b 	0x16ad0b
    2510:	16ad0b00 	bne	s5,t5,5114 <_mem_avail_start-0x7fffaeec>
    2514:	ad0b0000 	sw	t3,0(t0)
    2518:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    251c:	000016ad 	0x16ad
    2520:	0016ad0b 	0x16ad0b
    2524:	16ad0b00 	bne	s5,t5,5128 <_mem_avail_start-0x7fffaed8>
    2528:	ad0b0000 	sw	t3,0(t0)
    252c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2530:	000016ad 	0x16ad
    2534:	0016ad0b 	0x16ad0b
    2538:	16ad0b00 	bne	s5,t5,513c <_mem_avail_start-0x7fffaec4>
    253c:	ad0b0000 	sw	t3,0(t0)
    2540:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2544:	000016ad 	0x16ad
    2548:	0016ad0b 	0x16ad0b
    254c:	16ad0b00 	bne	s5,t5,5150 <_mem_avail_start-0x7fffaeb0>
    2550:	ad0b0000 	sw	t3,0(t0)
    2554:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2558:	000016ad 	0x16ad
    255c:	0016ad0b 	0x16ad0b
    2560:	16ad0b00 	bne	s5,t5,5164 <_mem_avail_start-0x7fffae9c>
    2564:	ad0b0000 	sw	t3,0(t0)
    2568:	00000016 	0x16
    256c:	11ad1000 	beq	t5,t5,6570 <_mem_avail_start-0x7fff9a90>
    2570:	b7030000 	0xb7030000
    2574:	09000025 	j	4000094 <_mem_avail_start-0x7bffff6c>
    2578:	00000724 	0x724
    257c:	00002595 	0x2595
    2580:	0016ad0a 	0x16ad0a
    2584:	16ad0a00 	bne	s5,t5,4d88 <_mem_avail_start-0x7fffb278>
    2588:	ad0a0000 	sw	t2,0(t0)
    258c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2590:	000016ad 	0x16ad
    2594:	00611100 	0x611100
    2598:	16b96701 	bne	s5,t9,1c1a0 <_mem_avail_start-0x7ffe3e60>
    259c:	01120000 	0x1120000
    25a0:	16ad0b67 	bne	s5,t5,5340 <_mem_avail_start-0x7fffacc0>
    25a4:	ad0b0000 	sw	t3,0(t0)
    25a8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    25ac:	000016ad 	0x16ad
    25b0:	0016ad0b 	0x16ad0b
    25b4:	13000000 	beqz	t8,25b8 <_mem_avail_start-0x7fffda48>
    25b8:	0025bd04 	0x25bd04
    25bc:	16b41400 	bne	s5,s4,75c0 <_mem_avail_start-0x7fff8a40>
    25c0:	25cd0000 	addiu	t5,t6,0
    25c4:	25150000 	addiu	s5,t0,0
    25c8:	01000000 	0x1000000
    25cc:	11f41000 	beq	t7,s4,65d0 <_mem_avail_start-0x7fff9a30>
    25d0:	12030000 	beq	s0,v1,25d4 <_mem_avail_start-0x7fffda2c>
    25d4:	0c000026 	jal	98 <_mem_avail_start-0x7fffff68>
    25d8:	0025004e 	0x25004e
    25dc:	02040000 	0x2040000
    25e0:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    25e4:	73010049 	0x73010049
    25e8:	00002601 	0x2601
    25ec:	00002507 	0x2507
    25f0:	00000400 	sll	zero,zero,0x10
    25f4:	25070000 	addiu	a3,t0,0
    25f8:	04000000 	bltz	zero,25fc <_mem_avail_start-0x7fffda04>
    25fc:	00000001 	movf	zero,zero,$fcc0
    2600:	74731100 	jalx	1cc4400 <_mem_avail_start-0x7e33bc00>
    2604:	74010072 	jalx	401c8 <_mem_avail_start-0x7ffbfe38>
    2608:	000025b7 	0x25b7
    260c:	0003230b 	0x3230b
    2610:	04130000 	bgezall	zero,2614 <_mem_avail_start-0x7fffd9ec>
    2614:	00002618 	0x2618
    2618:	0016b414 	0x16b414
    261c:	00262800 	0x262800
    2620:	00251500 	0x251500
    2624:	00090000 	sll	zero,t1,0x0
    2628:	00123810 	0x123810
    262c:	26bd0300 	addiu	sp,s5,768
    2630:	4e0c0000 	c3	0xc0000
    2634:	00002500 	sll	a0,zero,0x14
    2638:	000a0400 	sll	zero,t2,0x10
    263c:	490d0000 	bc2t	$cc3,2640 <_mem_avail_start-0x7fffd9c0>
    2640:	ac730100 	sw	s3,256(v1)
    2644:	07000026 	bltz	t8,26e0 <_mem_avail_start-0x7fffd920>
    2648:	00000025 	move	zero,zero
    264c:	00000004 	sllv	zero,zero,zero
    2650:	00250700 	0x250700
    2654:	01040000 	0x1040000
    2658:	07000000 	bltz	t8,265c <_mem_avail_start-0x7fffd9a4>
    265c:	00000025 	move	zero,zero
    2660:	00000204 	0x204
    2664:	00250700 	0x250700
    2668:	03040000 	0x3040000
    266c:	07000000 	bltz	t8,2670 <_mem_avail_start-0x7fffd990>
    2670:	00000025 	move	zero,zero
    2674:	00000404 	0x404
    2678:	00250700 	0x250700
    267c:	05040000 	0x5040000
    2680:	07000000 	bltz	t8,2684 <_mem_avail_start-0x7fffd97c>
    2684:	00000025 	move	zero,zero
    2688:	00000604 	0x604
    268c:	00250700 	0x250700
    2690:	07040000 	0x7040000
    2694:	07000000 	bltz	t8,2698 <_mem_avail_start-0x7fffd968>
    2698:	00000025 	move	zero,zero
    269c:	00000804 	sllv	at,zero,zero
    26a0:	00250700 	0x250700
    26a4:	09040000 	j	4100000 <_mem_avail_start-0x7bf00000>
    26a8:	00000000 	nop
    26ac:	72747311 	0x72747311
    26b0:	12740100 	beq	s3,s4,2ab4 <_mem_avail_start-0x7fffd54c>
    26b4:	0b000026 	j	c000098 <_mem_avail_start-0x73ffff68>
    26b8:	000002ac 	0x2ac
    26bc:	12cc1600 	beq	s6,t4,7ec0 <_mem_avail_start-0x7fff8140>
    26c0:	07dc0000 	0x7dc0000
    26c4:	01e8bfc0 	0x1e8bfc0
    26c8:	9c010000 	0x9c010000
    26cc:	00003768 	0x3768
    26d0:	00072409 	0x72409
    26d4:	00275200 	0x275200
    26d8:	16ad0a00 	bne	s5,t5,4edc <_mem_avail_start-0x7fffb124>
    26dc:	ad0a0000 	sw	t2,0(t0)
    26e0:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    26e4:	000016ad 	0x16ad
    26e8:	0016ad0a 	0x16ad0a
    26ec:	16ad0a00 	bne	s5,t5,4ef0 <_mem_avail_start-0x7fffb110>
    26f0:	ad0a0000 	sw	t2,0(t0)
    26f4:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    26f8:	000016ad 	0x16ad
    26fc:	0016ad0a 	0x16ad0a
    2700:	16ad0a00 	bne	s5,t5,4f04 <_mem_avail_start-0x7fffb0fc>
    2704:	ad0a0000 	sw	t2,0(t0)
    2708:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    270c:	000016ad 	0x16ad
    2710:	0016ad0a 	0x16ad0a
    2714:	16ad0a00 	bne	s5,t5,4f18 <_mem_avail_start-0x7fffb0e8>
    2718:	ad0a0000 	sw	t2,0(t0)
    271c:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2720:	000016ad 	0x16ad
    2724:	0016ad0a 	0x16ad0a
    2728:	16ad0a00 	bne	s5,t5,4f2c <_mem_avail_start-0x7fffb0d4>
    272c:	ad0a0000 	sw	t2,0(t0)
    2730:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2734:	000016ad 	0x16ad
    2738:	0016ad0a 	0x16ad0a
    273c:	16ad0a00 	bne	s5,t5,4f40 <_mem_avail_start-0x7fffb0c0>
    2740:	ad0a0000 	sw	t2,0(t0)
    2744:	0a000016 	j	8000058 <_mem_avail_start-0x77ffffa8>
    2748:	000016ad 	0x16ad
    274c:	0016ad0a 	0x16ad0a
    2750:	61170000 	0x61170000
    2754:	b9670100 	swr	a3,256(t3)
    2758:	00000016 	0x16
    275c:	18000000 	blez	zero,2760 <_mem_avail_start-0x7fffd8a0>
    2760:	27df6701 	addiu	ra,s8,26369
    2764:	ad0b0000 	sw	t3,0(t0)
    2768:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    276c:	000016ad 	0x16ad
    2770:	0016ad0b 	0x16ad0b
    2774:	16ad0b00 	bne	s5,t5,5378 <_mem_avail_start-0x7fffac88>
    2778:	ad0b0000 	sw	t3,0(t0)
    277c:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2780:	000016ad 	0x16ad
    2784:	0016ad0b 	0x16ad0b
    2788:	16ad0b00 	bne	s5,t5,538c <_mem_avail_start-0x7fffac74>
    278c:	ad0b0000 	sw	t3,0(t0)
    2790:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    2794:	000016ad 	0x16ad
    2798:	0016ad0b 	0x16ad0b
    279c:	16ad0b00 	bne	s5,t5,53a0 <_mem_avail_start-0x7fffac60>
    27a0:	ad0b0000 	sw	t3,0(t0)
    27a4:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    27a8:	000016ad 	0x16ad
    27ac:	0016ad0b 	0x16ad0b
    27b0:	16ad0b00 	bne	s5,t5,53b4 <_mem_avail_start-0x7fffac4c>
    27b4:	ad0b0000 	sw	t3,0(t0)
    27b8:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    27bc:	000016ad 	0x16ad
    27c0:	0016ad0b 	0x16ad0b
    27c4:	16ad0b00 	bne	s5,t5,53c8 <_mem_avail_start-0x7fffac38>
    27c8:	ad0b0000 	sw	t3,0(t0)
    27cc:	0b000016 	j	c000058 <_mem_avail_start-0x73ffffa8>
    27d0:	000016ad 	0x16ad
    27d4:	0016ad0b 	0x16ad0b
    27d8:	16ad0b00 	bne	s5,t5,53dc <_mem_avail_start-0x7fffac24>
    27dc:	19000000 	blez	t0,27e0 <_mem_avail_start-0x7fffd820>
    27e0:	000011c3 	sra	v0,zero,0x7
    27e4:	16ad6701 	bne	s5,t5,1c3ec <_mem_avail_start-0x7ffe3c14>
    27e8:	00210000 	0x210000
    27ec:	ca190000 	lwc2	$25,0(s0)
    27f0:	01000011 	mthi	t0
    27f4:	0016ad67 	0x16ad67
    27f8:	00004200 	sll	t0,zero,0x8
    27fc:	11d11900 	beq	t6,s1,8c00 <_mem_avail_start-0x7fff7400>
    2800:	67010000 	0x67010000
    2804:	000016ad 	0x16ad
    2808:	00000063 	0x63
    280c:	0011d819 	0x11d819
    2810:	ad670100 	sw	a3,256(t3)
    2814:	84000016 	lh	zero,22(zero)
    2818:	19000000 	blez	t0,281c <_mem_avail_start-0x7fffd7e4>
    281c:	000001e5 	0x1e5
    2820:	16ad6701 	bne	s5,t5,1c428 <_mem_avail_start-0x7ffe3bd8>
    2824:	00a40000 	0xa40000
    2828:	37190000 	ori	t9,t8,0x0
    282c:	01000012 	0x1000012
    2830:	0016ad67 	0x16ad67
    2834:	0000c400 	sll	t8,zero,0x10
    2838:	123e1900 	beq	s1,s8,8c3c <_mem_avail_start-0x7fff73c4>
    283c:	67010000 	0x67010000
    2840:	000016ad 	0x16ad
    2844:	000000e4 	0xe4
    2848:	000bec19 	0xbec19
    284c:	ad670100 	sw	a3,256(t3)
    2850:	04000016 	bltz	zero,28ac <_mem_avail_start-0x7fffd754>
    2854:	19000001 	blez	t0,285c <_mem_avail_start-0x7fffd7a4>
    2858:	00001245 	0x1245
    285c:	16ad6701 	bne	s5,t5,1c464 <_mem_avail_start-0x7ffe3b9c>
    2860:	01240000 	0x1240000
    2864:	4c190000 	mfc3	t9,$0
    2868:	01000012 	0x1000012
    286c:	0016ad67 	0x16ad67
    2870:	00014400 	sll	t0,at,0x10
    2874:	02591900 	0x2591900
    2878:	67010000 	0x67010000
    287c:	000016ad 	0x16ad
    2880:	00000164 	0x164
    2884:	00026119 	0x26119
    2888:	ad670100 	sw	a3,256(t3)
    288c:	84000016 	lh	zero,22(zero)
    2890:	19000001 	blez	t0,2898 <_mem_avail_start-0x7fffd768>
    2894:	00000269 	0x269
    2898:	16ad6701 	bne	s5,t5,1c4a0 <_mem_avail_start-0x7ffe3b60>
    289c:	01a40000 	0x1a40000
    28a0:	71190000 	madd	t0,t9
    28a4:	01000002 	0x1000002
    28a8:	0016ad67 	0x16ad67
    28ac:	0001c400 	sll	t8,at,0x10
    28b0:	02791900 	0x2791900
    28b4:	67010000 	0x67010000
    28b8:	000016ad 	0x16ad
    28bc:	000001e4 	0x1e4
    28c0:	00028119 	0x28119
    28c4:	ad670100 	sw	a3,256(t3)
    28c8:	04000016 	bltz	zero,2924 <_mem_avail_start-0x7fffd6dc>
    28cc:	19000002 	blez	t0,28d8 <_mem_avail_start-0x7fffd728>
    28d0:	0000038e 	0x38e
    28d4:	16ad6701 	bne	s5,t5,1c4dc <_mem_avail_start-0x7ffe3b24>
    28d8:	02260000 	0x2260000
    28dc:	90190000 	lbu	t9,0(zero)
    28e0:	01000002 	0x1000002
    28e4:	0016ad67 	0x16ad67
    28e8:	00024800 	sll	t1,v0,0x0
    28ec:	02981900 	0x2981900
    28f0:	67010000 	0x67010000
    28f4:	000016ad 	0x16ad
    28f8:	0000026a 	0x26a
    28fc:	0002a019 	0x2a019
    2900:	ad670100 	sw	a3,256(t3)
    2904:	8c000016 	lw	zero,22(zero)
    2908:	19000002 	blez	t0,2914 <_mem_avail_start-0x7fffd6ec>
    290c:	0000043a 	0x43a
    2910:	16ad6701 	bne	s5,t5,1c518 <_mem_avail_start-0x7ffe3ae8>
    2914:	02ae0000 	0x2ae0000
    2918:	42190000 	c0	0x190000
    291c:	01000004 	sllv	zero,zero,t0
    2920:	0016ad67 	0x16ad67
    2924:	0002d000 	sll	k0,v0,0x0
    2928:	0ad71900 	j	b5c6400 <_mem_avail_start-0x74a39c00>
    292c:	67010000 	0x67010000
    2930:	000016ad 	0x16ad
    2934:	000002f2 	tlt	zero,zero,0xb
    2938:	000adf19 	0xadf19
    293c:	ad670100 	sw	a3,256(t3)
    2940:	14000016 	bnez	zero,299c <_mem_avail_start-0x7fffd664>
    2944:	1a000003 	blez	s0,2954 <_mem_avail_start-0x7fffd6ac>
    2948:	00002349 	0x2349
    294c:	bfc0089c 	cache	0x0,2204(s8)
    2950:	00000300 	sll	zero,zero,0xc
    2954:	375e6a01 	ori	s8,k0,0x6a01
    2958:	4a1b0000 	c2	0x1b0000
    295c:	36000024 	ori	zero,s0,0x24
    2960:	1b000003 	blez	t8,2970 <_mem_avail_start-0x7fffd690>
    2964:	00002445 	0x2445
    2968:	00000361 	0x361
    296c:	0024401b 	0x24401b
    2970:	00038e00 	sll	s1,v1,0x18
    2974:	243b1b00 	addiu	k1,at,6912
    2978:	03bb0000 	0x3bb0000
    297c:	361b0000 	ori	k1,s0,0x0
    2980:	e8000024 	swc2	$0,36(zero)
    2984:	1b000003 	blez	t8,2994 <_mem_avail_start-0x7fffd66c>
    2988:	00002431 	tgeu	zero,zero,0x90
    298c:	00000415 	0x415
    2990:	00242c1b 	0x242c1b
    2994:	00044200 	sll	t0,a0,0x8
    2998:	24271b00 	addiu	a3,at,6912
    299c:	046f0000 	0x46f0000
    29a0:	221b0000 	addi	k1,s0,0
    29a4:	9c000024 	0x9c000024
    29a8:	1b000004 	blez	t8,29bc <_mem_avail_start-0x7fffd644>
    29ac:	0000241d 	0x241d
    29b0:	000004c9 	0x4c9
    29b4:	0024181b 	0x24181b
    29b8:	0004eb00 	sll	sp,a0,0xc
    29bc:	24131b00 	li	s3,6912
    29c0:	050d0000 	0x50d0000
    29c4:	0e1b0000 	jal	86c0000 <_mem_avail_start-0x77940000>
    29c8:	2f000024 	sltiu	zero,t8,36
    29cc:	1b000005 	blez	t8,29e4 <_mem_avail_start-0x7fffd61c>
    29d0:	00002409 	jalr.hb	a0,zero
    29d4:	00000551 	0x551
    29d8:	0024041b 	0x24041b
    29dc:	00057300 	sll	t6,a1,0xc
    29e0:	23ff1b00 	addi	ra,ra,6912
    29e4:	05950000 	0x5950000
    29e8:	fa1b0000 	sdc2	$27,0(s0)
    29ec:	b7000023 	0xb7000023
    29f0:	1b000005 	blez	t8,2a08 <_mem_avail_start-0x7fffd5f8>
    29f4:	000023f5 	0x23f5
    29f8:	000005d9 	0x5d9
    29fc:	0023f01b 	0x23f01b
    2a00:	0005fb00 	sll	ra,a1,0xc
    2a04:	23eb1b00 	addi	t3,ra,6912
    2a08:	061d0000 	0x61d0000
    2a0c:	e61b0000 	swc1	$f27,0(s0)
    2a10:	3d000023 	0x3d000023
    2a14:	1b000006 	blez	t8,2a30 <_mem_avail_start-0x7fffd5d0>
    2a18:	000023e1 	0x23e1
    2a1c:	0000065d 	0x65d
    2a20:	0023dc1b 	0x23dc1b
    2a24:	00067d00 	sll	t7,a2,0x14
    2a28:	23d01b00 	addi	s0,s8,6912
    2a2c:	069d0000 	0x69d0000
    2a30:	631a0000 	0x631a0000
    2a34:	a8000021 	swl	zero,33(zero)
    2a38:	20bfc008 	addi	ra,a1,-16376
    2a3c:	01000003 	0x1000003
    2a40:	00374b6a 	0x374b6a
    2a44:	225a1b00 	addi	k0,s2,6912
    2a48:	06bd0000 	0x6bd0000
    2a4c:	551b0000 	bnel	t0,k1,2a50 <_mem_avail_start-0x7fffd5b0>
    2a50:	e8000022 	swc2	$0,34(zero)
    2a54:	1b000006 	blez	t8,2a70 <_mem_avail_start-0x7fffd590>
    2a58:	00002250 	0x2250
    2a5c:	00000715 	0x715
    2a60:	00224b1b 	0x224b1b
    2a64:	00074200 	sll	t0,a3,0x8
    2a68:	22461b00 	addi	a2,s2,6912
    2a6c:	076f0000 	0x76f0000
    2a70:	411b0000 	0x411b0000
    2a74:	9c000022 	0x9c000022
    2a78:	1b000007 	blez	t8,2a98 <_mem_avail_start-0x7fffd568>
    2a7c:	0000223c 	0x223c
    2a80:	000007c9 	0x7c9
    2a84:	0022371b 	0x22371b
    2a88:	0007f600 	sll	s8,a3,0x18
    2a8c:	22321b00 	addi	s2,s1,6912
    2a90:	08230000 	j	8c0000 <_mem_avail_start-0x7f740000>
    2a94:	2d1b0000 	sltiu	k1,t0,0
    2a98:	50000022 	beqzl	zero,2b24 <_mem_avail_start-0x7fffd4dc>
    2a9c:	1b000008 	blez	t8,2ac0 <_mem_avail_start-0x7fffd540>
    2aa0:	00002228 	0x2228
    2aa4:	00000872 	tlt	zero,zero,0x21
    2aa8:	0022231b 	0x22231b
    2aac:	00089400 	sll	s2,t0,0x10
    2ab0:	221e1b00 	addi	s8,s0,6912
    2ab4:	08b60000 	j	2d80000 <_mem_avail_start-0x7d280000>
    2ab8:	191b0000 	0x191b0000
    2abc:	d8000022 	ldc2	$0,34(zero)
    2ac0:	1b000008 	blez	t8,2ae4 <_mem_avail_start-0x7fffd51c>
    2ac4:	00002214 	0x2214
    2ac8:	000008fa 	0x8fa
    2acc:	00220f1b 	0x220f1b
    2ad0:	00091c00 	sll	v1,t1,0x10
    2ad4:	220a1b00 	addi	t2,s0,6912
    2ad8:	093e0000 	j	4f80000 <_mem_avail_start-0x7b080000>
    2adc:	051b0000 	0x51b0000
    2ae0:	60000022 	0x60000022
    2ae4:	1b000009 	blez	t8,2b0c <_mem_avail_start-0x7fffd4f4>
    2ae8:	00002200 	sll	a0,zero,0x8
    2aec:	00000982 	srl	at,zero,0x6
    2af0:	0021fb1b 	0x21fb1b
    2af4:	0009a400 	sll	s4,t1,0x10
    2af8:	21f61b00 	addi	s6,t7,6912
    2afc:	09c40000 	j	7100000 <_mem_avail_start-0x78f00000>
    2b00:	f11b0000 	0xf11b0000
    2b04:	e4000021 	swc1	$f0,33(zero)
    2b08:	1b000009 	blez	t8,2b30 <_mem_avail_start-0x7fffd4d0>
    2b0c:	000021e5 	0x21e5
    2b10:	00000a04 	0xa04
    2b14:	001fc71a 	0x1fc71a
    2b18:	c008b400 	ll	t0,-19456(zero)
    2b1c:	000340bf 	0x340bf
    2b20:	386a0100 	xori	t2,v1,0x100
    2b24:	1b000037 	blez	t8,2c04 <_mem_avail_start-0x7fffd3fc>
    2b28:	000020b4 	teq	zero,zero,0x82
    2b2c:	00000a24 	0xa24
    2b30:	0020af1b 	0x20af1b
    2b34:	000a4f00 	sll	t1,t2,0x1c
    2b38:	20aa1b00 	addi	t2,a1,6912
    2b3c:	0a7c0000 	j	9f00000 <_mem_avail_start-0x76100000>
    2b40:	a51b0000 	sh	k1,0(t0)
    2b44:	a9000020 	swl	zero,32(t0)
    2b48:	1b00000a 	blez	t8,2b74 <_mem_avail_start-0x7fffd48c>
    2b4c:	000020a0 	0x20a0
    2b50:	00000ad6 	0xad6
    2b54:	00209b1b 	0x209b1b
    2b58:	000b0300 	sll	zero,t3,0xc
    2b5c:	20961b00 	addi	s6,a0,6912
    2b60:	0b300000 	j	cc00000 <_mem_avail_start-0x73400000>
    2b64:	911b0000 	lbu	k1,0(t0)
    2b68:	5d000020 	bgtzl	t0,2bec <_mem_avail_start-0x7fffd414>
    2b6c:	1b00000b 	blez	t8,2b9c <_mem_avail_start-0x7fffd464>
    2b70:	0000208c 	syscall	0x82
    2b74:	00000b8a 	0xb8a
    2b78:	0020871b 	0x20871b
    2b7c:	000bb700 	sll	s6,t3,0x1c
    2b80:	20821b00 	addi	v0,a0,6912
    2b84:	0bd90000 	j	f640000 <_mem_avail_start-0x709c0000>
    2b88:	7d1b0000 	0x7d1b0000
    2b8c:	fb000020 	sdc2	$0,32(t8)
    2b90:	1b00000b 	blez	t8,2bc0 <_mem_avail_start-0x7fffd440>
    2b94:	00002078 	0x2078
    2b98:	00000c1d 	0xc1d
    2b9c:	0020731b 	0x20731b
    2ba0:	000c3f00 	sll	a3,t4,0x1c
    2ba4:	206e1b00 	addi	t6,v1,6912
    2ba8:	0c610000 	jal	1840000 <_mem_avail_start-0x7e7c0000>
    2bac:	691b0000 	0x691b0000
    2bb0:	83000020 	lb	zero,32(t8)
    2bb4:	1b00000c 	blez	t8,2be8 <_mem_avail_start-0x7fffd418>
    2bb8:	00002064 	0x2064
    2bbc:	00000ca5 	0xca5
    2bc0:	00205f1b 	0x205f1b
    2bc4:	000cc700 	sll	t8,t4,0x1c
    2bc8:	205a1b00 	addi	k0,v0,6912
    2bcc:	0ce90000 	jal	3a40000 <_mem_avail_start-0x7c5c0000>
    2bd0:	551b0000 	bnel	t0,k1,2bd4 <_mem_avail_start-0x7fffd42c>
    2bd4:	0b000020 	j	c000080 <_mem_avail_start-0x73ffff80>
    2bd8:	1b00000d 	blez	t8,2c10 <_mem_avail_start-0x7fffd3f0>
    2bdc:	00002050 	0x2050
    2be0:	00000d2b 	0xd2b
    2be4:	0020441b 	0x20441b
    2be8:	000d4b00 	sll	t1,t5,0xc
    2bec:	1e751a00 	0x1e751a00
    2bf0:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
    2bf4:	0360bfc0 	0x360bfc0
    2bf8:	6a010000 	0x6a010000
    2bfc:	00003725 	0x3725
    2c00:	001f581b 	0x1f581b
    2c04:	000d6b00 	sll	t5,t5,0xc
    2c08:	1f531b00 	0x1f531b00
    2c0c:	0d960000 	jal	6580000 <_mem_avail_start-0x79a80000>
    2c10:	4e1b0000 	c3	0x1b0000
    2c14:	c300001f 	ll	zero,31(t8)
    2c18:	1b00000d 	blez	t8,2c50 <_mem_avail_start-0x7fffd3b0>
    2c1c:	00001f49 	0x1f49
    2c20:	00000df0 	tge	zero,zero,0x37
    2c24:	001f441b 	0x1f441b
    2c28:	000e1d00 	sll	v1,t6,0x14
    2c2c:	1f3f1b00 	0x1f3f1b00
    2c30:	0e4a0000 	jal	9280000 <_mem_avail_start-0x76d80000>
    2c34:	3a1b0000 	xori	k1,s0,0x0
    2c38:	7700001f 	jalx	c00007c <_mem_avail_start-0x73ffff84>
    2c3c:	1b00000e 	blez	t8,2c78 <_mem_avail_start-0x7fffd388>
    2c40:	00001f35 	0x1f35
    2c44:	00000ea4 	0xea4
    2c48:	001f301b 	0x1f301b
    2c4c:	000ed100 	sll	k0,t6,0x4
    2c50:	1f2b1b00 	0x1f2b1b00
    2c54:	0efe0000 	jal	bf80000 <_mem_avail_start-0x74080000>
    2c58:	261b0000 	addiu	k1,s0,0
    2c5c:	2000001f 	addi	zero,zero,31
    2c60:	1b00000f 	blez	t8,2ca0 <_mem_avail_start-0x7fffd360>
    2c64:	00001f21 	0x1f21
    2c68:	00000f42 	srl	at,zero,0x1d
    2c6c:	001f1c1b 	0x1f1c1b
    2c70:	000f6400 	sll	t4,t7,0x10
    2c74:	1f171b00 	0x1f171b00
    2c78:	0f860000 	jal	e180000 <_mem_avail_start-0x71e80000>
    2c7c:	121b0000 	beq	s0,k1,2c80 <_mem_avail_start-0x7fffd380>
    2c80:	a800001f 	swl	zero,31(zero)
    2c84:	1b00000f 	blez	t8,2cc4 <_mem_avail_start-0x7fffd33c>
    2c88:	00001f0d 	break	0x0,0x7c
    2c8c:	00000fca 	0xfca
    2c90:	001f081b 	0x1f081b
    2c94:	000fec00 	sll	sp,t7,0x10
    2c98:	1f031b00 	0x1f031b00
    2c9c:	100e0000 	beq	zero,t6,2ca0 <_mem_avail_start-0x7fffd360>
    2ca0:	fe1b0000 	sdc3	$27,0(s0)
    2ca4:	3000001e 	andi	zero,zero,0x1e
    2ca8:	1b000010 	blez	t8,2cec <_mem_avail_start-0x7fffd314>
    2cac:	00001ef9 	0x1ef9
    2cb0:	00001052 	mflhxu	v0
    2cb4:	001eed1b 	0x1eed1b
    2cb8:	00107200 	sll	t6,s0,0x8
    2cbc:	1d371a00 	0x1d371a00
    2cc0:	08cc0000 	j	3300000 <_mem_avail_start-0x7cd00000>
    2cc4:	0380bfc0 	0x380bfc0
    2cc8:	6a010000 	0x6a010000
    2ccc:	00003712 	0x3712
    2cd0:	001e101b 	0x1e101b
    2cd4:	00109200 	sll	s2,s0,0x8
    2cd8:	1e0b1b00 	0x1e0b1b00
    2cdc:	10bd0000 	beq	a1,sp,2ce0 <_mem_avail_start-0x7fffd320>
    2ce0:	061b0000 	0x61b0000
    2ce4:	ea00001e 	swc2	$0,30(s0)
    2ce8:	1b000010 	blez	t8,2d2c <_mem_avail_start-0x7fffd2d4>
    2cec:	00001e01 	0x1e01
    2cf0:	00001117 	0x1117
    2cf4:	001dfc1b 	0x1dfc1b
    2cf8:	00114400 	sll	t0,s1,0x10
    2cfc:	1df71b00 	0x1df71b00
    2d00:	11710000 	beq	t3,s1,2d04 <_mem_avail_start-0x7fffd2fc>
    2d04:	f21b0000 	0xf21b0000
    2d08:	9e00001d 	0x9e00001d
    2d0c:	1b000011 	blez	t8,2d54 <_mem_avail_start-0x7fffd2ac>
    2d10:	00001ded 	0x1ded
    2d14:	000011cb 	0x11cb
    2d18:	001de81b 	0x1de81b
    2d1c:	0011f800 	sll	ra,s1,0x0
    2d20:	1de31b00 	0x1de31b00
    2d24:	12250000 	beq	s1,a1,2d28 <_mem_avail_start-0x7fffd2d8>
    2d28:	de1b0000 	ldc3	$27,0(s0)
    2d2c:	4700001d 	c1	0x100001d
    2d30:	1b000012 	blez	t8,2d7c <_mem_avail_start-0x7fffd284>
    2d34:	00001dd9 	0x1dd9
    2d38:	00001269 	0x1269
    2d3c:	001dd41b 	0x1dd41b
    2d40:	00128b00 	sll	s1,s2,0xc
    2d44:	1dcf1b00 	0x1dcf1b00
    2d48:	12ad0000 	beq	s5,t5,2d4c <_mem_avail_start-0x7fffd2b4>
    2d4c:	ca1b0000 	lwc2	$27,0(s0)
    2d50:	cf00001d 	pref	0x0,29(t8)
    2d54:	1b000012 	blez	t8,2da0 <_mem_avail_start-0x7fffd260>
    2d58:	00001dc5 	0x1dc5
    2d5c:	000012f1 	tgeu	zero,zero,0x4b
    2d60:	001dc01b 	0x1dc01b
    2d64:	00131300 	sll	v0,s3,0xc
    2d68:	1dbb1b00 	0x1dbb1b00
    2d6c:	13350000 	beq	t9,s5,2d70 <_mem_avail_start-0x7fffd290>
    2d70:	b61b0000 	0xb61b0000
    2d74:	5700001d 	bnezl	t8,2dec <_mem_avail_start-0x7fffd214>
    2d78:	1b000013 	blez	t8,2dc8 <_mem_avail_start-0x7fffd238>
    2d7c:	00001daa 	0x1daa
    2d80:	00001379 	0x1379
    2d84:	001c0d1a 	0x1c0d1a
    2d88:	c008d800 	ll	t0,-10240(zero)
    2d8c:	0003a0bf 	0x3a0bf
    2d90:	ff6a0100 	sdc3	$10,256(k1)
    2d94:	1b000036 	blez	t8,2e70 <_mem_avail_start-0x7fffd190>
    2d98:	00001cdc 	0x1cdc
    2d9c:	00001399 	0x1399
    2da0:	001cd71b 	0x1cd71b
    2da4:	0013c400 	sll	t8,s3,0x10
    2da8:	1cd21b00 	0x1cd21b00
    2dac:	13f10000 	beq	ra,s1,2db0 <_mem_avail_start-0x7fffd250>
    2db0:	cd1b0000 	pref	0x1b,0(t0)
    2db4:	1e00001c 	bgtz	s0,2e28 <_mem_avail_start-0x7fffd1d8>
    2db8:	1b000014 	blez	t8,2e0c <_mem_avail_start-0x7fffd1f4>
    2dbc:	00001cc8 	0x1cc8
    2dc0:	0000144b 	0x144b
    2dc4:	001cc31b 	0x1cc31b
    2dc8:	00147800 	sll	t7,s4,0x0
    2dcc:	1cbe1b00 	0x1cbe1b00
    2dd0:	14a50000 	bne	a1,a1,2dd4 <_mem_avail_start-0x7fffd22c>
    2dd4:	b91b0000 	swr	k1,0(t0)
    2dd8:	d200001c 	0xd200001c
    2ddc:	1b000014 	blez	t8,2e30 <_mem_avail_start-0x7fffd1d0>
    2de0:	00001cb4 	teq	zero,zero,0x72
    2de4:	000014ff 	0x14ff
    2de8:	001caf1b 	0x1caf1b
    2dec:	00152c00 	sll	a1,s5,0x10
    2df0:	1caa1b00 	0x1caa1b00
    2df4:	154e0000 	bne	t2,t6,2df8 <_mem_avail_start-0x7fffd208>
    2df8:	a51b0000 	sh	k1,0(t0)
    2dfc:	7000001c 	0x7000001c
    2e00:	1b000015 	blez	t8,2e58 <_mem_avail_start-0x7fffd1a8>
    2e04:	00001ca0 	0x1ca0
    2e08:	00001592 	0x1592
    2e0c:	001c9b1b 	0x1c9b1b
    2e10:	0015b400 	sll	s6,s5,0x10
    2e14:	1c961b00 	0x1c961b00
    2e18:	15d60000 	bne	t6,s6,2e1c <_mem_avail_start-0x7fffd1e4>
    2e1c:	911b0000 	lbu	k1,0(t0)
    2e20:	f800001c 	sdc2	$0,28(zero)
    2e24:	1b000015 	blez	t8,2e7c <_mem_avail_start-0x7fffd184>
    2e28:	00001c8c 	syscall	0x72
    2e2c:	0000161a 	0x161a
    2e30:	001c871b 	0x1c871b
    2e34:	00163c00 	sll	a3,s6,0x10
    2e38:	1c7b1b00 	0x1c7b1b00
    2e3c:	165e0000 	bne	s2,s8,2e40 <_mem_avail_start-0x7fffd1c0>
    2e40:	411a0000 	0x411a0000
    2e44:	e400001b 	swc1	$f0,27(zero)
    2e48:	c0bfc008 	ll	ra,-16376(a1)
    2e4c:	01000003 	0x1000003
    2e50:	0036eb6a 	0x36eb6a
    2e54:	1c061b00 	0x1c061b00
    2e58:	16800000 	bnez	s4,2e5c <_mem_avail_start-0x7fffd1a4>
    2e5c:	011b0000 	0x11b0000
    2e60:	ab00001c 	swl	zero,28(t8)
    2e64:	1b000016 	blez	t8,2ec0 <_mem_avail_start-0x7fffd140>
    2e68:	00001bfc 	0x1bfc
    2e6c:	000016d8 	0x16d8
    2e70:	001bf71b 	0x1bf71b
    2e74:	00170500 	sll	zero,s7,0x14
    2e78:	1bf21b00 	0x1bf21b00
    2e7c:	17320000 	bne	t9,s2,2e80 <_mem_avail_start-0x7fffd180>
    2e80:	ed1b0000 	swc3	$27,0(t0)
    2e84:	5f00001b 	bgtzl	t8,2ef4 <_mem_avail_start-0x7fffd10c>
    2e88:	1b000017 	blez	t8,2ee8 <_mem_avail_start-0x7fffd118>
    2e8c:	00001be8 	0x1be8
    2e90:	0000178c 	syscall	0x5e
    2e94:	001be31b 	0x1be31b
    2e98:	0017b900 	sll	s7,s7,0x4
    2e9c:	1bde1b00 	0x1bde1b00
    2ea0:	17e60000 	bne	ra,a2,2ea4 <_mem_avail_start-0x7fffd15c>
    2ea4:	d91b0000 	ldc2	$27,0(t0)
    2ea8:	1300001b 	beqz	t8,2f18 <_mem_avail_start-0x7fffd0e8>
    2eac:	1b000018 	blez	t8,2f10 <_mem_avail_start-0x7fffd0f0>
    2eb0:	00001bd4 	0x1bd4
    2eb4:	00001835 	0x1835
    2eb8:	001bcf1b 	0x1bcf1b
    2ebc:	00185700 	sll	t2,t8,0x1c
    2ec0:	1bca1b00 	0x1bca1b00
    2ec4:	18790000 	0x18790000
    2ec8:	c51b0000 	lwc1	$f27,0(t0)
    2ecc:	9b00001b 	lwr	zero,27(t8)
    2ed0:	1b000018 	blez	t8,2f34 <_mem_avail_start-0x7fffd0cc>
    2ed4:	00001bc0 	sll	v1,zero,0xf
    2ed8:	000018bd 	0x18bd
    2edc:	001bbb1b 	0x1bbb1b
    2ee0:	0018df00 	sll	k1,t8,0x1c
    2ee4:	1bb61b00 	0x1bb61b00
    2ee8:	19010000 	0x19010000
    2eec:	aa1b0000 	swl	k1,0(s0)
    2ef0:	2300001b 	addi	zero,t8,27
    2ef4:	1a000019 	blez	s0,2f5c <_mem_avail_start-0x7fffd0a4>
    2ef8:	00001a7f 	0x1a7f
    2efc:	bfc008f0 	cache	0x0,2288(s8)
    2f00:	000003e0 	0x3e0
    2f04:	36d76a01 	ori	s7,s6,0x6a01
    2f08:	3a1b0000 	xori	k1,s0,0x0
    2f0c:	4500001b 	bc1f	2f7c <_mem_avail_start-0x7fffd084>
    2f10:	1b000019 	blez	t8,2f78 <_mem_avail_start-0x7fffd088>
    2f14:	00001b35 	0x1b35
    2f18:	00001970 	tge	zero,zero,0x65
    2f1c:	001b301b 	0x1b301b
    2f20:	00199d00 	sll	s3,t9,0x14
    2f24:	1b2b1b00 	0x1b2b1b00
    2f28:	19ca0000 	0x19ca0000
    2f2c:	261b0000 	addiu	k1,s0,0
    2f30:	f700001b 	sdc1	$f0,27(t8)
    2f34:	1b000019 	blez	t8,2f9c <_mem_avail_start-0x7fffd064>
    2f38:	00001b21 	0x1b21
    2f3c:	00001a24 	0x1a24
    2f40:	001b1c1b 	0x1b1c1b
    2f44:	001a5100 	sll	t2,k0,0x4
    2f48:	1b171b00 	0x1b171b00
    2f4c:	1a7e0000 	0x1a7e0000
    2f50:	121b0000 	beq	s0,k1,2f54 <_mem_avail_start-0x7fffd0ac>
    2f54:	ab00001b 	swl	zero,27(t8)
    2f58:	1b00001a 	blez	t8,2fc4 <_mem_avail_start-0x7fffd03c>
    2f5c:	00001b0d 	break	0x0,0x6c
    2f60:	00001ad8 	0x1ad8
    2f64:	001b081b 	0x1b081b
    2f68:	001afa00 	sll	ra,k0,0x8
    2f6c:	1b031b00 	0x1b031b00
    2f70:	1b1c0000 	0x1b1c0000
    2f74:	fe1b0000 	sdc3	$27,0(s0)
    2f78:	3e00001a 	0x3e00001a
    2f7c:	1b00001b 	blez	t8,2fec <_mem_avail_start-0x7fffd014>
    2f80:	00001af9 	0x1af9
    2f84:	00001b60 	0x1b60
    2f88:	001af41b 	0x1af41b
    2f8c:	001b8200 	sll	s0,k1,0x8
    2f90:	1aef1b00 	0x1aef1b00
    2f94:	1ba40000 	0x1ba40000
    2f98:	e31b0000 	sc	k1,0(t8)
    2f9c:	c600001a 	lwc1	$f0,26(s0)
    2fa0:	1a00001b 	blez	s0,3010 <_mem_avail_start-0x7fffcff0>
    2fa4:	000019c7 	0x19c7
    2fa8:	bfc008fc 	cache	0x0,2300(s8)
    2fac:	00000400 	sll	zero,zero,0x10
    2fb0:	36c36a01 	ori	v1,s6,0x6a01
    2fb4:	781b0000 	0x781b0000
    2fb8:	e800001a 	swc2	$0,26(zero)
    2fbc:	1b00001b 	blez	t8,302c <_mem_avail_start-0x7fffcfd4>
    2fc0:	00001a73 	tltu	zero,zero,0x69
    2fc4:	00001c13 	0x1c13
    2fc8:	001a6e1b 	0x1a6e1b
    2fcc:	001c4000 	sll	t0,gp,0x0
    2fd0:	1a691b00 	0x1a691b00
    2fd4:	1c6d0000 	0x1c6d0000
    2fd8:	641b0000 	0x641b0000
    2fdc:	9a00001a 	lwr	zero,26(s0)
    2fe0:	1b00001c 	blez	t8,3054 <_mem_avail_start-0x7fffcfac>
    2fe4:	00001a5f 	0x1a5f
    2fe8:	00001cc7 	0x1cc7
    2fec:	001a5a1b 	0x1a5a1b
    2ff0:	001cf400 	sll	s8,gp,0x10
    2ff4:	1a551b00 	0x1a551b00
    2ff8:	1d210000 	0x1d210000
    2ffc:	501b0000 	beql	zero,k1,3000 <_mem_avail_start-0x7fffd000>
    3000:	4e00001a 	c3	0x1a
    3004:	1b00001d 	blez	t8,307c <_mem_avail_start-0x7fffcf84>
    3008:	00001a4b 	0x1a4b
    300c:	00001d7b 	0x1d7b
    3010:	001a461b 	0x1a461b
    3014:	001d9d00 	sll	s3,sp,0x14
    3018:	1a411b00 	0x1a411b00
    301c:	1dbf0000 	0x1dbf0000
    3020:	3c1b0000 	lui	k1,0x0
    3024:	e100001a 	sc	zero,26(t0)
    3028:	1b00001d 	blez	t8,30a0 <_mem_avail_start-0x7fffcf60>
    302c:	00001a37 	0x1a37
    3030:	00001e03 	sra	v1,zero,0x18
    3034:	001a321b 	0x1a321b
    3038:	001e2500 	sll	a0,s8,0x14
    303c:	1a261b00 	0x1a261b00
    3040:	1e470000 	0x1e470000
    3044:	191a0000 	0x191a0000
    3048:	08000019 	j	64 <_mem_avail_start-0x7fffff9c>
    304c:	20bfc009 	addi	ra,a1,-16375
    3050:	01000004 	sllv	zero,zero,t0
    3054:	0036af6a 	0x36af6a
    3058:	19c01b00 	blez	t6,9c5c <_mem_avail_start-0x7fff63a4>
    305c:	1e690000 	0x1e690000
    3060:	bb1b0000 	swr	k1,0(t8)
    3064:	94000019 	lhu	zero,25(zero)
    3068:	1b00001e 	blez	t8,30e4 <_mem_avail_start-0x7fffcf1c>
    306c:	000019b6 	tne	zero,zero,0x66
    3070:	00001ec1 	0x1ec1
    3074:	0019b11b 	0x19b11b
    3078:	001eee00 	sll	sp,s8,0x18
    307c:	19ac1b00 	0x19ac1b00
    3080:	1f1b0000 	0x1f1b0000
    3084:	a71b0000 	sh	k1,0(t8)
    3088:	48000019 	0x48000019
    308c:	1b00001f 	blez	t8,310c <_mem_avail_start-0x7fffcef4>
    3090:	000019a2 	0x19a2
    3094:	00001f75 	0x1f75
    3098:	00199d1b 	0x199d1b
    309c:	001fa200 	sll	s4,ra,0x8
    30a0:	19981b00 	0x19981b00
    30a4:	1fcf0000 	0x1fcf0000
    30a8:	931b0000 	lbu	k1,0(t8)
    30ac:	fc000019 	sdc3	$0,25(zero)
    30b0:	1b00001f 	blez	t8,3130 <_mem_avail_start-0x7fffced0>
    30b4:	0000198e 	0x198e
    30b8:	0000201e 	0x201e
    30bc:	0019891b 	0x19891b
    30c0:	00204000 	0x204000
    30c4:	19841b00 	0x19841b00
    30c8:	20620000 	addi	v0,v1,0
    30cc:	7f1b0000 	0x7f1b0000
    30d0:	84000019 	lh	zero,25(zero)
    30d4:	1b000020 	blez	t8,3158 <_mem_avail_start-0x7fffcea8>
    30d8:	00001973 	tltu	zero,zero,0x65
    30dc:	000020a6 	0x20a6
    30e0:	0018751a 	0x18751a
    30e4:	c0091400 	ll	t1,5120(zero)
    30e8:	000440bf 	0x440bf
    30ec:	9b6a0100 	lwr	t2,256(k1)
    30f0:	1b000036 	blez	t8,31cc <_mem_avail_start-0x7fffce34>
    30f4:	00001912 	0x1912
    30f8:	000020c8 	0x20c8
    30fc:	00190d1b 	0x190d1b
    3100:	0020f300 	0x20f300
    3104:	19081b00 	0x19081b00
    3108:	21200000 	addi	zero,t1,0
    310c:	031b0000 	0x31b0000
    3110:	4d000019 	bc3f	3178 <_mem_avail_start-0x7fffce88>
    3114:	1b000021 	blez	t8,319c <_mem_avail_start-0x7fffce64>
    3118:	000018fe 	0x18fe
    311c:	0000217a 	0x217a
    3120:	0018f91b 	0x18f91b
    3124:	0021a700 	0x21a700
    3128:	18f41b00 	0x18f41b00
    312c:	21d40000 	addi	s4,t6,0
    3130:	ef1b0000 	swc3	$27,0(t8)
    3134:	01000018 	mult	t0,zero
    3138:	1b000022 	blez	t8,31c4 <_mem_avail_start-0x7fffce3c>
    313c:	000018ea 	0x18ea
    3140:	0000222e 	0x222e
    3144:	0018e51b 	0x18e51b
    3148:	00225b00 	0x225b00
    314c:	18e01b00 	blez	a3,9d50 <_mem_avail_start-0x7fff62b0>
    3150:	227d0000 	addi	sp,s3,0
    3154:	db1b0000 	ldc2	$27,0(t8)
    3158:	9f000018 	0x9f000018
    315c:	1b000022 	blez	t8,31e8 <_mem_avail_start-0x7fffce18>
    3160:	000018d6 	0x18d6
    3164:	000022c1 	0x22c1
    3168:	0018ca1b 	0x18ca1b
    316c:	0022e300 	0x22e300
    3170:	17db1a00 	bne	s8,k1,9974 <_mem_avail_start-0x7fff668c>
    3174:	09200000 	j	4800000 <_mem_avail_start-0x7b800000>
    3178:	0460bfc0 	bltz	v1,ffff307c <_text_end+0x403f18e4>
    317c:	6a010000 	0x6a010000
    3180:	00003687 	0x3687
    3184:	00186e1b 	0x186e1b
    3188:	00230500 	0x230500
    318c:	18691b00 	0x18691b00
    3190:	23300000 	addi	s0,t9,0
    3194:	641b0000 	0x641b0000
    3198:	5d000018 	bgtzl	t0,31fc <_mem_avail_start-0x7fffce04>
    319c:	1b000023 	blez	t8,322c <_mem_avail_start-0x7fffcdd4>
    31a0:	0000185f 	0x185f
    31a4:	0000238a 	0x238a
    31a8:	00185a1b 	0x185a1b
    31ac:	0023b700 	0x23b700
    31b0:	18551b00 	0x18551b00
    31b4:	23e40000 	addi	a0,ra,0
    31b8:	501b0000 	beql	zero,k1,31bc <_mem_avail_start-0x7fffce44>
    31bc:	11000018 	beqz	t0,3220 <_mem_avail_start-0x7fffcde0>
    31c0:	1b000024 	blez	t8,3254 <_mem_avail_start-0x7fffcdac>
    31c4:	0000184b 	0x184b
    31c8:	0000243e 	0x243e
    31cc:	0018461b 	0x18461b
    31d0:	00246b00 	0x246b00
    31d4:	18411b00 	0x18411b00
    31d8:	24980000 	addiu	t8,a0,0
    31dc:	3c1b0000 	lui	k1,0x0
    31e0:	ba000018 	swr	zero,24(s0)
    31e4:	1b000024 	blez	t8,3278 <_mem_avail_start-0x7fffcd88>
    31e8:	00001837 	0x1837
    31ec:	000024dc 	0x24dc
    31f0:	00182b1b 	0x182b1b
    31f4:	0024fe00 	0x24fe00
    31f8:	174b1a00 	bne	k0,t3,99fc <_mem_avail_start-0x7fff6604>
    31fc:	092c0000 	j	4b00000 <_mem_avail_start-0x7b500000>
    3200:	0480bfc0 	bltz	a0,ffff3104 <_text_end+0x403f196c>
    3204:	6a010000 	0x6a010000
    3208:	00003673 	tltu	zero,zero,0xd9
    320c:	0017d41b 	0x17d41b
    3210:	00252000 	0x252000
    3214:	17cf1b00 	bne	s8,t7,9e18 <_mem_avail_start-0x7fff61e8>
    3218:	254b0000 	addiu	t3,t2,0
    321c:	ca1b0000 	lwc2	$27,0(s0)
    3220:	78000017 	0x78000017
    3224:	1b000025 	blez	t8,32bc <_mem_avail_start-0x7fffcd44>
    3228:	000017c5 	0x17c5
    322c:	000025a5 	0x25a5
    3230:	0017c01b 	0x17c01b
    3234:	0025d200 	0x25d200
    3238:	17bb1b00 	bne	sp,k1,9e3c <_mem_avail_start-0x7fff61c4>
    323c:	25ff0000 	addiu	ra,t7,0
    3240:	b61b0000 	0xb61b0000
    3244:	2c000017 	sltiu	zero,zero,23
    3248:	1b000026 	blez	t8,32e4 <_mem_avail_start-0x7fffcd1c>
    324c:	000017b1 	tgeu	zero,zero,0x5e
    3250:	00002659 	0x2659
    3254:	0017ac1b 	0x17ac1b
    3258:	00268600 	0x268600
    325c:	17a71b00 	bne	sp,a3,9e60 <_mem_avail_start-0x7fff61a0>
    3260:	26b30000 	addiu	s3,s5,0
    3264:	a21b0000 	sb	k1,0(s0)
    3268:	d5000017 	ldc1	$f0,23(t0)
    326c:	1b000026 	blez	t8,3308 <_mem_avail_start-0x7fffccf8>
    3270:	00001796 	0x1796
    3274:	000026f7 	0x26f7
    3278:	0016c51a 	0x16c51a
    327c:	c0093800 	ll	t1,14336(zero)
    3280:	0004a0bf 	0x4a0bf
    3284:	5f6a0100 	0x5f6a0100
    3288:	1b000036 	blez	t8,3364 <_mem_avail_start-0x7fffcc9c>
    328c:	00001744 	0x1744
    3290:	00002719 	0x2719
    3294:	00173f1b 	0x173f1b
    3298:	00274400 	0x274400
    329c:	173a1b00 	bne	t9,k0,9ea0 <_mem_avail_start-0x7fff6160>
    32a0:	27710000 	addiu	s1,k1,0
    32a4:	351b0000 	ori	k1,t0,0x0
    32a8:	9e000017 	0x9e000017
    32ac:	1b000027 	blez	t8,334c <_mem_avail_start-0x7fffccb4>
    32b0:	00001730 	tge	zero,zero,0x5c
    32b4:	000027cb 	0x27cb
    32b8:	00172b1b 	0x172b1b
    32bc:	0027f800 	0x27f800
    32c0:	17261b00 	bne	t9,a2,9ec4 <_mem_avail_start-0x7fff613c>
    32c4:	28250000 	slti	a1,at,0
    32c8:	211b0000 	addi	k1,t0,0
    32cc:	52000017 	beqzl	s0,332c <_mem_avail_start-0x7fffccd4>
    32d0:	1b000028 	blez	t8,3374 <_mem_avail_start-0x7fffcc8c>
    32d4:	0000171c 	0x171c
    32d8:	0000287f 	0x287f
    32dc:	0017171b 	0x17171b
    32e0:	0028ac00 	0x28ac00
    32e4:	170b1b00 	bne	t8,t3,9ee8 <_mem_avail_start-0x7fff6118>
    32e8:	28ce0000 	slti	t6,a2,0
    32ec:	cd1a0000 	pref	0x1a,0(t0)
    32f0:	44000022 	0x44000022
    32f4:	c0bfc009 	ll	ra,-16375(a1)
    32f8:	01000004 	sllv	zero,zero,t0
    32fc:	00364b6a 	0x364b6a
    3300:	23421b00 	addi	v0,k0,6912
    3304:	28f00000 	slti	s0,a3,0
    3308:	3d1b0000 	0x3d1b0000
    330c:	1b000023 	blez	t8,339c <_mem_avail_start-0x7fffcc64>
    3310:	1b000029 	blez	t8,33b8 <_mem_avail_start-0x7fffcc48>
    3314:	00002338 	0x2338
    3318:	00002948 	0x2948
    331c:	0023331b 	0x23331b
    3320:	00297500 	0x297500
    3324:	232e1b00 	addi	t6,t9,6912
    3328:	29a20000 	slti	v0,t5,0
    332c:	291b0000 	slti	k1,t0,0
    3330:	cf000023 	pref	0x0,35(t8)
    3334:	1b000029 	blez	t8,33dc <_mem_avail_start-0x7fffcc24>
    3338:	00002324 	0x2324
    333c:	000029fc 	0x29fc
    3340:	00231f1b 	0x231f1b
    3344:	002a2900 	0x2a2900
    3348:	231a1b00 	addi	k0,t8,6912
    334c:	2a560000 	slti	s6,s2,0
    3350:	0e1b0000 	jal	86c0000 <_mem_avail_start-0x77940000>
    3354:	83000023 	lb	zero,35(t8)
    3358:	1a00002a 	blez	s0,3404 <_mem_avail_start-0x7fffcbfc>
    335c:	000020f1 	tgeu	zero,zero,0x83
    3360:	bfc00950 	cache	0x0,2384(s8)
    3364:	000004e0 	0x4e0
    3368:	36376a01 	ori	s7,s1,0x6a01
    336c:	5c1b0000 	0x5c1b0000
    3370:	a5000021 	sh	zero,33(t0)
    3374:	1b00002a 	blez	t8,3420 <_mem_avail_start-0x7fffcbe0>
    3378:	00002157 	0x2157
    337c:	00002ad0 	0x2ad0
    3380:	0021521b 	0x21521b
    3384:	002afd00 	0x2afd00
    3388:	214d1b00 	addi	t5,t2,6912
    338c:	2b2a0000 	slti	t2,t9,0
    3390:	481b0000 	mfc2	k1,$0
    3394:	57000021 	bnezl	t8,341c <_mem_avail_start-0x7fffcbe4>
    3398:	1b00002b 	blez	t8,3448 <_mem_avail_start-0x7fffcbb8>
    339c:	00002143 	sra	a0,zero,0x5
    33a0:	00002b84 	0x2b84
    33a4:	00213e1b 	0x213e1b
    33a8:	002bb100 	0x2bb100
    33ac:	21391b00 	addi	t9,t1,6912
    33b0:	2bde0000 	slti	s8,s8,0
    33b4:	2d1b0000 	sltiu	k1,t0,0
    33b8:	0b000021 	j	c000084 <_mem_avail_start-0x73ffff7c>
    33bc:	1a00002c 	blez	s0,3470 <_mem_avail_start-0x7fffcb90>
    33c0:	00001f5f 	0x1f5f
    33c4:	bfc00958 	cache	0x0,2392(s8)
    33c8:	00000500 	sll	zero,zero,0x14
    33cc:	36266a01 	ori	a2,s1,0x6a01
    33d0:	c01b0000 	ll	k1,0(zero)
    33d4:	3800001f 	xori	zero,zero,0x1f
    33d8:	1b00002c 	blez	t8,348c <_mem_avail_start-0x7fffcb74>
    33dc:	00001fbb 	0x1fbb
    33e0:	00002c63 	0x2c63
    33e4:	001fb61b 	0x1fb61b
    33e8:	002c9000 	0x2c9000
    33ec:	1fb11b00 	0x1fb11b00
    33f0:	2cbd0000 	sltiu	sp,a1,0
    33f4:	ac1b0000 	sw	k1,0(zero)
    33f8:	ea00001f 	swc2	$0,31(s0)
    33fc:	1b00002c 	blez	t8,34b0 <_mem_avail_start-0x7fffcb50>
    3400:	00001fa7 	0x1fa7
    3404:	00002d17 	0x2d17
    3408:	001fa21b 	0x1fa21b
    340c:	002d4400 	0x2d4400
    3410:	1f961b00 	0x1f961b00
    3414:	2d710000 	sltiu	s1,t3,0
    3418:	171a0000 	bne	t8,k0,341c <_mem_avail_start-0x7fffcbe4>
    341c:	6000001e 	0x6000001e
    3420:	20bfc009 	addi	ra,a1,-16375
    3424:	01000005 	0x1000005
    3428:	0036156a 	0x36156a
    342c:	1e6e1b00 	0x1e6e1b00
    3430:	2d9e0000 	sltiu	s8,t4,0
    3434:	691b0000 	0x691b0000
    3438:	c900001e 	lwc2	$0,30(t0)
    343c:	1b00002d 	blez	t8,34f4 <_mem_avail_start-0x7fffcb0c>
    3440:	00001e64 	0x1e64
    3444:	00002df6 	tne	zero,zero,0xb7
    3448:	001e5f1b 	0x1e5f1b
    344c:	002e2300 	0x2e2300
    3450:	1e5a1b00 	0x1e5a1b00
    3454:	2e500000 	sltiu	s0,s2,0
    3458:	551b0000 	bnel	t0,k1,345c <_mem_avail_start-0x7fffcba4>
    345c:	7d00001e 	0x7d00001e
    3460:	1b00002e 	blez	t8,351c <_mem_avail_start-0x7fffcae4>
    3464:	00001e49 	0x1e49
    3468:	00002eaa 	0x2eaa
    346c:	001ce31a 	0x1ce31a
    3470:	c0096800 	ll	t1,26624(zero)
    3474:	000540bf 	0x540bf
    3478:	046a0100 	tlti	v1,256
    347c:	1b000036 	blez	t8,3558 <_mem_avail_start-0x7fffcaa8>
    3480:	00001d30 	tge	zero,zero,0x74
    3484:	00002ed7 	0x2ed7
    3488:	001d2b1b 	0x1d2b1b
    348c:	002f0200 	0x2f0200
    3490:	1d261b00 	0x1d261b00
    3494:	2f2f0000 	sltiu	t7,t9,0
    3498:	211b0000 	addi	k1,t0,0
    349c:	5c00001d 	bgtzl	zero,3514 <_mem_avail_start-0x7fffcaec>
    34a0:	1b00002f 	blez	t8,3560 <_mem_avail_start-0x7fffcaa0>
    34a4:	00001d1c 	0x1d1c
    34a8:	00002f89 	0x2f89
    34ac:	001d101b 	0x1d101b
    34b0:	002fb600 	0x2fb600
    34b4:	256d1a00 	addiu	t5,t3,6656
    34b8:	09700000 	j	5c00000 <_mem_avail_start-0x7a400000>
    34bc:	0560bfc0 	bltz	t3,ffff33c0 <_text_end+0x403f1c28>
    34c0:	6a010000 	0x6a010000
    34c4:	000035f3 	tltu	zero,zero,0xd7
    34c8:	0025b01b 	0x25b01b
    34cc:	002fe300 	0x2fe300
    34d0:	25ab1b00 	addiu	t3,t5,6912
    34d4:	300e0000 	andi	t6,zero,0x0
    34d8:	a61b0000 	sh	k1,0(s0)
    34dc:	3b000025 	xori	zero,t8,0x25
    34e0:	1b000030 	blez	t8,35a4 <_mem_avail_start-0x7fffca5c>
    34e4:	000025a1 	0x25a1
    34e8:	00003068 	0x3068
    34ec:	0025951b 	0x25951b
    34f0:	00309500 	0x309500
    34f4:	22611a00 	addi	at,s3,6656
    34f8:	09780000 	j	5e00000 <_mem_avail_start-0x7a200000>
    34fc:	0580bfc0 	bltz	t4,ffff3400 <_text_end+0x403f1c68>
    3500:	6a010000 	0x6a010000
    3504:	000035e2 	0x35e2
    3508:	00229a1b 	0x229a1b
    350c:	0030c200 	0x30c200
    3510:	22951b00 	addi	s5,s4,6912
    3514:	30ed0000 	andi	t5,a3,0x0
    3518:	901b0000 	lbu	k1,0(zero)
    351c:	1a000022 	blez	s0,35a8 <_mem_avail_start-0x7fffca58>
    3520:	1b000031 	blez	t8,35e8 <_mem_avail_start-0x7fffca18>
    3524:	00002284 	0x2284
    3528:	00003147 	0x3147
    352c:	0020bb1a 	0x20bb1a
    3530:	c0098000 	ll	t1,-32768(zero)
    3534:	0005a0bf 	0x5a0bf
    3538:	d16a0100 	0xd16a0100
    353c:	1b000035 	blez	t8,3614 <_mem_avail_start-0x7fffc9ec>
    3540:	000020ea 	0x20ea
    3544:	00003174 	teq	zero,zero,0xc5
    3548:	0020e51b 	0x20e51b
    354c:	00319f00 	0x319f00
    3550:	20d91b00 	addi	t9,a2,6912
    3554:	31cc0000 	andi	t4,t6,0x0
    3558:	a11a0000 	sb	k0,0(t0)
    355c:	88000022 	lwl	zero,34(zero)
    3560:	c0bfc009 	ll	ra,-16375(a1)
    3564:	01000005 	0x1000005
    3568:	0035c06a 	0x35c06a
    356c:	22c61b00 	addi	a2,s6,6912
    3570:	31f90000 	andi	t9,t7,0x0
    3574:	ba1b0000 	swr	k1,0(s0)
    3578:	24000022 	li	zero,34
    357c:	1a000032 	blez	s0,3648 <_mem_avail_start-0x7fffc9b8>
    3580:	00004358 	0x4358
    3584:	bfc009b4 	cache	0x0,2484(s8)
    3588:	000005e0 	0x5e0
    358c:	35af6a01 	ori	t7,t5,0x6a01
    3590:	621b0000 	0x621b0000
    3594:	51000043 	beqzl	t0,36a4 <_mem_avail_start-0x7fffc95c>
    3598:	1c000032 	bgtz	zero,3664 <_mem_avail_start-0x7fffc99c>
    359c:	bfc009c4 	cache	0x0,2500(s8)
    35a0:	000043f2 	tlt	zero,zero,0x10f
    35a4:	0554011d 	0x554011d
    35a8:	9400e08d 	lhu	zero,-8051(zero)
    35ac:	1e000001 	bgtz	s0,35b4 <_mem_avail_start-0x7fffca4c>
    35b0:	bfc00990 	cache	0x0,2448(s8)
    35b4:	000043f2 	tlt	zero,zero,0x10f
    35b8:	0254011d 	0x254011d
    35bc:	00000081 	0x81
    35c0:	c009881e 	ll	t1,-30690(zero)
    35c4:	0043f2bf 	0x43f2bf
    35c8:	54011d00 	bnel	zero,at,a9cc <_mem_avail_start-0x7fff5634>
    35cc:	00008202 	srl	s0,zero,0x8
    35d0:	09801e00 	j	6007800 <_mem_avail_start-0x79ff8800>
    35d4:	43f2bfc0 	c0	0x1f2bfc0
    35d8:	011d0000 	0x11d0000
    35dc:	00830254 	0x830254
    35e0:	781e0000 	0x781e0000
    35e4:	f2bfc009 	0xf2bfc009
    35e8:	1d000043 	bgtz	t0,36f8 <_mem_avail_start-0x7fffc908>
    35ec:	84025401 	lh	v0,21505(zero)
    35f0:	1e000000 	bgtz	s0,35f4 <_mem_avail_start-0x7fffca0c>
    35f4:	bfc00970 	cache	0x0,2416(s8)
    35f8:	000043f2 	tlt	zero,zero,0x10f
    35fc:	0254011d 	0x254011d
    3600:	00000085 	0x85
    3604:	c009681e 	ll	t1,26654(zero)
    3608:	0043f2bf 	0x43f2bf
    360c:	54011d00 	bnel	zero,at,aa10 <_mem_avail_start-0x7fff55f0>
    3610:	00008602 	srl	s0,zero,0x18
    3614:	09601e00 	j	5807800 <_mem_avail_start-0x7a7f8800>
    3618:	43f2bfc0 	c0	0x1f2bfc0
    361c:	011d0000 	0x11d0000
    3620:	00870254 	0x870254
    3624:	581e0000 	0x581e0000
    3628:	f2bfc009 	0xf2bfc009
    362c:	1d000043 	bgtz	t0,373c <_mem_avail_start-0x7fffc8c4>
    3630:	8e025401 	lw	v0,21505(s0)
    3634:	1e000000 	bgtz	s0,3638 <_mem_avail_start-0x7fffc9c8>
    3638:	bfc00950 	cache	0x0,2384(s8)
    363c:	000043f2 	tlt	zero,zero,0x10f
    3640:	0554011d 	0x554011d
    3644:	947f9891 	lhu	ra,-26479(v1)
    3648:	1e000001 	bgtz	s0,3650 <_mem_avail_start-0x7fffc9b0>
    364c:	bfc00944 	cache	0x0,2372(s8)
    3650:	000043f2 	tlt	zero,zero,0x10f
    3654:	0554011d 	0x554011d
    3658:	947f9c91 	lhu	ra,-25455(v1)
    365c:	1e000001 	bgtz	s0,3664 <_mem_avail_start-0x7fffc99c>
    3660:	bfc00938 	cache	0x0,2360(s8)
    3664:	000043f2 	tlt	zero,zero,0x10f
    3668:	0554011d 	0x554011d
    366c:	947fa091 	lhu	ra,-24431(v1)
    3670:	1e000001 	bgtz	s0,3678 <_mem_avail_start-0x7fffc988>
    3674:	bfc0092c 	cache	0x0,2348(s8)
    3678:	000043f2 	tlt	zero,zero,0x10f
    367c:	0554011d 	0x554011d
    3680:	947fa491 	lhu	ra,-23407(v1)
    3684:	1e000001 	bgtz	s0,368c <_mem_avail_start-0x7fffc974>
    3688:	bfc00920 	cache	0x0,2336(s8)
    368c:	000043f2 	tlt	zero,zero,0x10f
    3690:	0554011d 	0x554011d
    3694:	947fa891 	lhu	ra,-22383(v1)
    3698:	1e000001 	bgtz	s0,36a0 <_mem_avail_start-0x7fffc960>
    369c:	bfc00914 	cache	0x0,2324(s8)
    36a0:	000043f2 	tlt	zero,zero,0x10f
    36a4:	0554011d 	0x554011d
    36a8:	947fac91 	lhu	ra,-21359(v1)
    36ac:	1e000001 	bgtz	s0,36b4 <_mem_avail_start-0x7fffc94c>
    36b0:	bfc00908 	cache	0x0,2312(s8)
    36b4:	000043f2 	tlt	zero,zero,0x10f
    36b8:	0554011d 	0x554011d
    36bc:	947fb091 	lhu	ra,-20335(v1)
    36c0:	1e000001 	bgtz	s0,36c8 <_mem_avail_start-0x7fffc938>
    36c4:	bfc008fc 	cache	0x0,2300(s8)
    36c8:	000043f2 	tlt	zero,zero,0x10f
    36cc:	0554011d 	0x554011d
    36d0:	947fb491 	lhu	ra,-19311(v1)
    36d4:	1e000001 	bgtz	s0,36dc <_mem_avail_start-0x7fffc924>
    36d8:	bfc008f0 	cache	0x0,2288(s8)
    36dc:	000043f2 	tlt	zero,zero,0x10f
    36e0:	0554011d 	0x554011d
    36e4:	947fb891 	lhu	ra,-18287(v1)
    36e8:	1e000001 	bgtz	s0,36f0 <_mem_avail_start-0x7fffc910>
    36ec:	bfc008e4 	cache	0x0,2276(s8)
    36f0:	000043f2 	tlt	zero,zero,0x10f
    36f4:	0554011d 	0x554011d
    36f8:	947fbc91 	lhu	ra,-17263(v1)
    36fc:	1e000001 	bgtz	s0,3704 <_mem_avail_start-0x7fffc8fc>
    3700:	bfc008d8 	cache	0x0,2264(s8)
    3704:	000043f2 	tlt	zero,zero,0x10f
    3708:	0454011d 	0x454011d
    370c:	01944091 	0x1944091
    3710:	cc1e0000 	pref	0x1e,0(zero)
    3714:	f2bfc008 	0xf2bfc008
    3718:	1d000043 	bgtz	t0,3828 <_mem_avail_start-0x7fffc7d8>
    371c:	91045401 	lbu	a0,21505(t0)
    3720:	00019444 	0x19444
    3724:	08c01e00 	j	3007800 <_mem_avail_start-0x7cff8800>
    3728:	43f2bfc0 	c0	0x1f2bfc0
    372c:	011d0000 	0x11d0000
    3730:	48910454 	0x48910454
    3734:	00000194 	0x194
    3738:	c008b41e 	ll	t0,-19426(zero)
    373c:	0043f2bf 	0x43f2bf
    3740:	54011d00 	bnel	zero,at,ab44 <_mem_avail_start-0x7fff54bc>
    3744:	944c9104 	lhu	t4,-28412(v0)
    3748:	1e000001 	bgtz	s0,3750 <_mem_avail_start-0x7fffc8b0>
    374c:	bfc008a8 	cache	0x0,2216(s8)
    3750:	000043f2 	tlt	zero,zero,0x10f
    3754:	0454011d 	0x454011d
    3758:	01945091 	0x1945091
    375c:	9c1f0000 	0x9c1f0000
    3760:	f2bfc008 	0xf2bfc008
    3764:	00000043 	sra	zero,zero,0x1
    3768:	376e0413 	ori	t6,k1,0x413
    376c:	b4140000 	0xb4140000
    3770:	7e000016 	0x7e000016
    3774:	15000037 	bnez	t0,3854 <_mem_avail_start-0x7fffc7ac>
    3778:	00000025 	move	zero,zero
    377c:	db100019 	ldc2	$16,25(t8)
    3780:	03000013 	mtlo	t8
    3784:	000038b3 	tltu	zero,zero,0xe2
    3788:	25004e0c 	addiu	zero,t0,19980
    378c:	04000000 	bltz	zero,3790 <_mem_avail_start-0x7fffc870>
    3790:	0000001a 	div	zero,zero,zero
    3794:	0100490d 	break	0x100,0x124
    3798:	0038a273 	tltu	at,t8,0x289
    379c:	00250700 	0x250700
    37a0:	00040000 	sll	zero,a0,0x0
    37a4:	07000000 	bltz	t8,37a8 <_mem_avail_start-0x7fffc858>
    37a8:	00000025 	move	zero,zero
    37ac:	00000104 	0x104
    37b0:	00250700 	0x250700
    37b4:	02040000 	0x2040000
    37b8:	07000000 	bltz	t8,37bc <_mem_avail_start-0x7fffc844>
    37bc:	00000025 	move	zero,zero
    37c0:	00000304 	0x304
    37c4:	00250700 	0x250700
    37c8:	04040000 	0x4040000
    37cc:	07000000 	bltz	t8,37d0 <_mem_avail_start-0x7fffc830>
    37d0:	00000025 	move	zero,zero
    37d4:	00000504 	0x504
    37d8:	00250700 	0x250700
    37dc:	06040000 	0x6040000
    37e0:	07000000 	bltz	t8,37e4 <_mem_avail_start-0x7fffc81c>
    37e4:	00000025 	move	zero,zero
    37e8:	00000704 	0x704
    37ec:	00250700 	0x250700
    37f0:	08040000 	j	100000 <_mem_avail_start-0x7ff00000>
    37f4:	07000000 	bltz	t8,37f8 <_mem_avail_start-0x7fffc808>
    37f8:	00000025 	move	zero,zero
    37fc:	00000904 	0x904
    3800:	00250700 	0x250700
    3804:	0a040000 	j	8100000 <_mem_avail_start-0x77f00000>
    3808:	07000000 	bltz	t8,380c <_mem_avail_start-0x7fffc7f4>
    380c:	00000025 	move	zero,zero
    3810:	00000b04 	0xb04
    3814:	00250700 	0x250700
    3818:	0c040000 	jal	100000 <_mem_avail_start-0x7ff00000>
    381c:	07000000 	bltz	t8,3820 <_mem_avail_start-0x7fffc7e0>
    3820:	00000025 	move	zero,zero
    3824:	00000d04 	0xd04
    3828:	00250700 	0x250700
    382c:	0e040000 	jal	8100000 <_mem_avail_start-0x77f00000>
    3830:	07000000 	bltz	t8,3834 <_mem_avail_start-0x7fffc7cc>
    3834:	00000025 	move	zero,zero
    3838:	00000f04 	0xf04
    383c:	00250700 	0x250700
    3840:	10040000 	beq	zero,a0,3844 <_mem_avail_start-0x7fffc7bc>
    3844:	07000000 	bltz	t8,3848 <_mem_avail_start-0x7fffc7b8>
    3848:	00000025 	move	zero,zero
    384c:	00001104 	0x1104
    3850:	00250700 	0x250700
    3854:	12040000 	beq	s0,a0,3858 <_mem_avail_start-0x7fffc7a8>
    3858:	07000000 	bltz	t8,385c <_mem_avail_start-0x7fffc7a4>
    385c:	00000025 	move	zero,zero
    3860:	00001304 	0x1304
    3864:	00250700 	0x250700
    3868:	14040000 	bne	zero,a0,386c <_mem_avail_start-0x7fffc794>
    386c:	07000000 	bltz	t8,3870 <_mem_avail_start-0x7fffc790>
    3870:	00000025 	move	zero,zero
    3874:	00001504 	0x1504
    3878:	00250700 	0x250700
    387c:	16040000 	bne	s0,a0,3880 <_mem_avail_start-0x7fffc780>
    3880:	07000000 	bltz	t8,3884 <_mem_avail_start-0x7fffc77c>
    3884:	00000025 	move	zero,zero
    3888:	00001704 	0x1704
    388c:	00250700 	0x250700
    3890:	18040000 	0x18040000
    3894:	07000000 	bltz	t8,3898 <_mem_avail_start-0x7fffc768>
    3898:	00000025 	move	zero,zero
    389c:	00001904 	0x1904
    38a0:	73110000 	madd	t8,s1
    38a4:	01007274 	teq	t0,zero,0x1c9
    38a8:	00376874 	teq	at,s7,0x1a1
    38ac:	01950b00 	0x1950b00
    38b0:	13000000 	beqz	t8,38b4 <_mem_avail_start-0x7fffc74c>
    38b4:	0038b904 	0x38b904
    38b8:	16b41400 	bne	s5,s4,88bc <_mem_avail_start-0x7fff7744>
    38bc:	38c90000 	xori	t1,a2,0x0
    38c0:	25150000 	addiu	s5,t0,0
    38c4:	04000000 	bltz	zero,38c8 <_mem_avail_start-0x7fffc738>
    38c8:	150f1000 	bne	t0,t7,78cc <_mem_avail_start-0x7fff8734>
    38cc:	2c030000 	sltiu	v1,zero,0
    38d0:	0c000039 	jal	e4 <_mem_avail_start-0x7fffff1c>
    38d4:	0025004e 	0x25004e
    38d8:	05040000 	0x5040000
    38dc:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    38e0:	73010049 	0x73010049
    38e4:	0000391b 	0x391b
    38e8:	00002507 	0x2507
    38ec:	00000400 	sll	zero,zero,0x10
    38f0:	25070000 	addiu	a3,t0,0
    38f4:	04000000 	bltz	zero,38f8 <_mem_avail_start-0x7fffc708>
    38f8:	00000001 	movf	zero,zero,$fcc0
    38fc:	00002507 	0x2507
    3900:	00020400 	sll	zero,v0,0x10
    3904:	25070000 	addiu	a3,t0,0
    3908:	04000000 	bltz	zero,390c <_mem_avail_start-0x7fffc6f4>
    390c:	00000003 	sra	zero,zero,0x0
    3910:	00002507 	0x2507
    3914:	00040400 	sll	zero,a0,0x10
    3918:	11000000 	beqz	t0,391c <_mem_avail_start-0x7fffc6e4>
    391c:	00727473 	tltu	v1,s2,0x1d1
    3920:	38b37401 	xori	s3,a1,0x7401
    3924:	500b0000 	beql	zero,t3,3928 <_mem_avail_start-0x7fffc6d8>
    3928:	00000001 	movf	zero,zero,$fcc0
    392c:	000f2620 	0xf2620
    3930:	c47c0100 	lwc1	$f28,256(v1)
    3934:	03000000 	0x3000000
    3938:	00003954 	0x3954
    393c:	25004e0c 	addiu	zero,t0,19980
    3940:	04000000 	bltz	zero,3944 <_mem_avail_start-0x7fffc6bc>
    3944:	00000002 	srl	zero,zero,0x0
    3948:	72747311 	0x72747311
    394c:	b77c0100 	0xb77c0100
    3950:	00000025 	move	zero,zero
    3954:	000ee120 	0xee120
    3958:	6b7c0100 	0x6b7c0100
    395c:	0300000b 	movn	zero,t8,zero
    3960:	0000397c 	0x397c
    3964:	25004e0c 	addiu	zero,t0,19980
    3968:	04000000 	bltz	zero,396c <_mem_avail_start-0x7fffc694>
    396c:	0000000a 	movz	zero,zero,zero
    3970:	72747311 	0x72747311
    3974:	127c0100 	beq	s3,gp,3d78 <_mem_avail_start-0x7fffc288>
    3978:	00000026 	xor	zero,zero,zero
    397c:	39820413 	xori	v0,t4,0x413
    3980:	b4140000 	0xb4140000
    3984:	92000016 	lbu	zero,22(s0)
    3988:	15000039 	bnez	t0,3a70 <_mem_avail_start-0x7fffc590>
    398c:	00000025 	move	zero,zero
    3990:	71160018 	0x71160018
    3994:	c4000015 	lwc1	$f0,21(zero)
    3998:	d4bfc009 	ldc1	$f31,-16375(a1)
    399c:	01000000 	0x1000000
    39a0:	003ad59c 	0x3ad59c
    39a4:	004e0c00 	0x4e0c00
    39a8:	00000025 	move	zero,zero
    39ac:	00001904 	0x1904
    39b0:	00490d00 	0x490d00
    39b4:	3ab57301 	xori	s5,s5,0x7301
    39b8:	25070000 	addiu	a3,t0,0
    39bc:	04000000 	bltz	zero,39c0 <_mem_avail_start-0x7fffc640>
    39c0:	00000000 	nop
    39c4:	00002507 	0x2507
    39c8:	00010400 	sll	zero,at,0x10
    39cc:	25070000 	addiu	a3,t0,0
    39d0:	04000000 	bltz	zero,39d4 <_mem_avail_start-0x7fffc62c>
    39d4:	00000002 	srl	zero,zero,0x0
    39d8:	00002507 	0x2507
    39dc:	00030400 	sll	zero,v1,0x10
    39e0:	25070000 	addiu	a3,t0,0
    39e4:	04000000 	bltz	zero,39e8 <_mem_avail_start-0x7fffc618>
    39e8:	00000004 	sllv	zero,zero,zero
    39ec:	00002507 	0x2507
    39f0:	00050400 	sll	zero,a1,0x10
    39f4:	25070000 	addiu	a3,t0,0
    39f8:	04000000 	bltz	zero,39fc <_mem_avail_start-0x7fffc604>
    39fc:	00000006 	srlv	zero,zero,zero
    3a00:	00002507 	0x2507
    3a04:	00070400 	sll	zero,a3,0x10
    3a08:	25070000 	addiu	a3,t0,0
    3a0c:	04000000 	bltz	zero,3a10 <_mem_avail_start-0x7fffc5f0>
    3a10:	00000008 	jr	zero
    3a14:	00002507 	0x2507
    3a18:	00090400 	sll	zero,t1,0x10
    3a1c:	25070000 	addiu	a3,t0,0
    3a20:	04000000 	bltz	zero,3a24 <_mem_avail_start-0x7fffc5dc>
    3a24:	0000000a 	movz	zero,zero,zero
    3a28:	00002507 	0x2507
    3a2c:	000b0400 	sll	zero,t3,0x10
    3a30:	25070000 	addiu	a3,t0,0
    3a34:	04000000 	bltz	zero,3a38 <_mem_avail_start-0x7fffc5c8>
    3a38:	0000000c 	syscall
    3a3c:	00002507 	0x2507
    3a40:	000d0400 	sll	zero,t5,0x10
    3a44:	25070000 	addiu	a3,t0,0
    3a48:	04000000 	bltz	zero,3a4c <_mem_avail_start-0x7fffc5b4>
    3a4c:	0000000e 	0xe
    3a50:	00002507 	0x2507
    3a54:	000f0400 	sll	zero,t7,0x10
    3a58:	25070000 	addiu	a3,t0,0
    3a5c:	04000000 	bltz	zero,3a60 <_mem_avail_start-0x7fffc5a0>
    3a60:	00000010 	mfhi	zero
    3a64:	00002507 	0x2507
    3a68:	00110400 	sll	zero,s1,0x10
    3a6c:	25070000 	addiu	a3,t0,0
    3a70:	04000000 	bltz	zero,3a74 <_mem_avail_start-0x7fffc58c>
    3a74:	00000012 	mflo	zero
    3a78:	00002507 	0x2507
    3a7c:	00130400 	sll	zero,s3,0x10
    3a80:	25070000 	addiu	a3,t0,0
    3a84:	04000000 	bltz	zero,3a88 <_mem_avail_start-0x7fffc578>
    3a88:	00000014 	0x14
    3a8c:	00002507 	0x2507
    3a90:	00150400 	sll	zero,s5,0x10
    3a94:	25070000 	addiu	a3,t0,0
    3a98:	04000000 	bltz	zero,3a9c <_mem_avail_start-0x7fffc564>
    3a9c:	00000016 	0x16
    3aa0:	00002507 	0x2507
    3aa4:	00170400 	sll	zero,s7,0x10
    3aa8:	25070000 	addiu	a3,t0,0
    3aac:	04000000 	bltz	zero,3ab0 <_mem_avail_start-0x7fffc550>
    3ab0:	00000018 	mult	zero,zero
    3ab4:	74731700 	jalx	1cc5c00 <_mem_avail_start-0x7e33a400>
    3ab8:	74010072 	jalx	401c8 <_mem_avail_start-0x7ffbfe38>
    3abc:	0000397c 	0x397c
    3ac0:	0000327c 	0x327c
    3ac4:	00004321 	0x4321
    3ac8:	1f550100 	0x1f550100
    3acc:	bfc00a8c 	cache	0x0,2700(s8)
    3ad0:	000026bd 	0x26bd
    3ad4:	03352200 	0x3352200
    3ad8:	09020000 	j	4080000 <_mem_avail_start-0x7bf80000>
    3adc:	00000238 	0x238
    3ae0:	bfc00714 	cache	0x0,1812(s8)
    3ae4:	000000c8 	0xc8
    3ae8:	3c509c01 	0x3c509c01
    3aec:	c7230000 	lwc1	$f3,0(t9)
    3af0:	b9000004 	swr	zero,4(t0)
    3af4:	24000016 	li	zero,22
    3af8:	00001253 	0x1253
    3afc:	00250b02 	ror	at,a1,0xc
    3b00:	32a80000 	andi	t0,s5,0x0
    3b04:	6d250000 	0x6d250000
    3b08:	02006d65 	0x2006d65
    3b0c:	003c500d 	break	0x3c,0x140
    3b10:	80808000 	lb	zero,-32768(a0)
    3b14:	68267880 	0x68267880
    3b18:	46000002 	mul.s	$f0,$f0,$f0
    3b1c:	2700003b 	addiu	zero,t8,59
    3b20:	10020069 	beq	zero,v0,3cc8 <_mem_avail_start-0x7fffc338>
    3b24:	00003c56 	0x3c56
    3b28:	000032dd 	0x32dd
    3b2c:	00433228 	0x433228
    3b30:	c0071800 	ll	a3,6144(zero)
    3b34:	000280bf 	0x280bf
    3b38:	1b110200 	0x1b110200
    3b3c:	00004346 	0x4346
    3b40:	00003313 	0x3313
    3b44:	a0290000 	sb	t1,0(at)
    3b48:	27000002 	addiu	zero,t8,2
    3b4c:	14020069 	bne	zero,v0,3cf4 <_mem_avail_start-0x7fffc30c>
    3b50:	00003c56 	0x3c56
    3b54:	0000332b 	0x332b
    3b58:	0043321a 	0x43321a
    3b5c:	c0075c00 	ll	a3,23552(zero)
    3b60:	0002c0bf 	0x2c0bf
    3b64:	75150200 	jalx	4540800 <_mem_avail_start-0x7babf800>
    3b68:	1b00003b 	blez	t8,3c58 <_mem_avail_start-0x7fffc3a8>
    3b6c:	00004346 	0x4346
    3b70:	00003349 	0x3349
    3b74:	39542a00 	xori	s4,t2,0x2a00
    3b78:	079c0000 	0x79c0000
    3b7c:	0008bfc0 	sll	s7,t0,0x1f
    3b80:	17020000 	bne	t8,v0,3b84 <_mem_avail_start-0x7fffc47c>
    3b84:	00003ba5 	0x3ba5
    3b88:	0039701b 	0x39701b
    3b8c:	00336100 	0x336100
    3b90:	079c2b00 	0x79c2b00
    3b94:	0008bfc0 	sll	s7,t0,0x1f
    3b98:	a41f0000 	sh	ra,0(zero)
    3b9c:	4fbfc007 	c3	0x1bfc007
    3ba0:	00000045 	0x45
    3ba4:	392c1a00 	xori	t4,t1,0x1a00
    3ba8:	07ac0000 	teqi	sp,0
    3bac:	02e8bfc0 	0x2e8bfc0
    3bb0:	19020000 	0x19020000
    3bb4:	00003c3e 	0x3c3e
    3bb8:	0039481b 	0x39481b
    3bbc:	00337900 	0x337900
    3bc0:	02e82900 	0x2e82900
    3bc4:	cd280000 	pref	0x8,0(t1)
    3bc8:	ac000025 	sw	zero,37(zero)
    3bcc:	e8bfc007 	swc2	$31,-16377(a1)
    3bd0:	01000002 	0x1000002
    3bd4:	26011b7f 	addiu	at,s0,7039
    3bd8:	33790000 	andi	t9,k1,0x0
    3bdc:	a1280000 	sb	t0,0(t1)
    3be0:	ac000022 	sw	zero,34(zero)
    3be4:	e8bfc007 	swc2	$31,-16377(a1)
    3be8:	01000002 	0x1000002
    3bec:	22c61b76 	addi	a2,s6,7030
    3bf0:	33910000 	andi	s1,gp,0x0
    3bf4:	ba1b0000 	swr	k1,0(s0)
    3bf8:	a5000022 	sh	zero,34(t0)
    3bfc:	2a000033 	slti	zero,s0,51
    3c00:	00004358 	0x4358
    3c04:	bfc007bc 	cache	0x0,1980(s8)
    3c08:	0000000c 	syscall
    3c0c:	3c2b6a01 	0x3c2b6a01
    3c10:	621b0000 	0x621b0000
    3c14:	b9000043 	swr	zero,67(t0)
    3c18:	1c000033 	bgtz	zero,3ce8 <_mem_avail_start-0x7fffc318>
    3c1c:	bfc007c8 	cache	0x0,1992(s8)
    3c20:	000043f2 	tlt	zero,zero,0x10f
    3c24:	0154011d 	0x154011d
    3c28:	1e000030 	bgtz	s0,3cec <_mem_avail_start-0x7fffc314>
    3c2c:	bfc007b4 	cache	0x0,1972(s8)
    3c30:	000043f2 	tlt	zero,zero,0x10f
    3c34:	0154011d 	0x154011d
    3c38:	0000003a 	0x3a
    3c3c:	ac1e0000 	sw	s8,0(zero)
    3c40:	6cbfc007 	0x6cbfc007
    3c44:	1d000043 	bgtz	t0,3d54 <_mem_avail_start-0x7fffc2ac>
    3c48:	80025401 	lb	v0,21505(zero)
    3c4c:	00000000 	nop
    3c50:	16c0042c 	bnez	s6,4d04 <_mem_avail_start-0x7fffb2fc>
    3c54:	042d0000 	0x42d0000
    3c58:	746e6905 	jalx	1b9a414 <_mem_avail_start-0x7e465bec>
    3c5c:	07e52200 	0x7e52200
    3c60:	09020000 	j	4080000 <_mem_avail_start-0x7bf80000>
    3c64:	00001354 	0x1354
    3c68:	bfc00648 	cache	0x0,1608(s8)
    3c6c:	000000cc 	syscall	0x3
    3c70:	3dd89c01 	0x3dd89c01
    3c74:	c7230000 	lwc1	$f3,0(t9)
    3c78:	d8000004 	ldc2	$0,4(zero)
    3c7c:	2400003d 	li	zero,61
    3c80:	00001253 	0x1253
    3c84:	00250b02 	ror	at,a1,0xc
    3c88:	33cd0000 	andi	t5,s8,0x0
    3c8c:	6d250000 	0x6d250000
    3c90:	02006d65 	0x2006d65
    3c94:	003de40d 	break	0x3d,0x390
    3c98:	80808000 	lb	zero,-32768(a0)
    3c9c:	d0267880 	0xd0267880
    3ca0:	ce000001 	pref	0x0,1(s0)
    3ca4:	2700003c 	addiu	zero,t8,60
    3ca8:	10020069 	beq	zero,v0,3e50 <_mem_avail_start-0x7fffc1b0>
    3cac:	00003c56 	0x3c56
    3cb0:	00003402 	srl	a2,zero,0x10
    3cb4:	00433228 	0x433228
    3cb8:	c0064c00 	ll	a2,19456(zero)
    3cbc:	0001e8bf 	0x1e8bf
    3cc0:	1b110200 	0x1b110200
    3cc4:	00004346 	0x4346
    3cc8:	00003416 	0x3416
    3ccc:	08290000 	j	a40000 <_mem_avail_start-0x7f5c0000>
    3cd0:	27000002 	addiu	zero,t8,2
    3cd4:	14020069 	bne	zero,v0,3e7c <_mem_avail_start-0x7fffc184>
    3cd8:	00003c56 	0x3c56
    3cdc:	0000342e 	0x342e
    3ce0:	0043321a 	0x43321a
    3ce4:	c0069000 	ll	a2,-28672(zero)
    3ce8:	000228bf 	0x228bf
    3cec:	fd150200 	sdc3	$21,512(t0)
    3cf0:	1b00003c 	blez	t8,3de4 <_mem_avail_start-0x7fffc21c>
    3cf4:	00004346 	0x4346
    3cf8:	0000344c 	syscall	0xd1
    3cfc:	39542a00 	xori	s4,t2,0x2a00
    3d00:	06d40000 	0x6d40000
    3d04:	0008bfc0 	sll	s7,t0,0x1f
    3d08:	17020000 	bne	t8,v0,3d0c <_mem_avail_start-0x7fffc2f4>
    3d0c:	00003d2d 	0x3d2d
    3d10:	0039701b 	0x39701b
    3d14:	00346400 	0x346400
    3d18:	06d42b00 	0x6d42b00
    3d1c:	0008bfc0 	sll	s7,t0,0x1f
    3d20:	dc1f0000 	ldc3	$31,0(zero)
    3d24:	4fbfc006 	c3	0x1bfc006
    3d28:	00000045 	0x45
    3d2c:	392c1a00 	xori	t4,t1,0x1a00
    3d30:	06e40000 	0x6e40000
    3d34:	0250bfc0 	0x250bfc0
    3d38:	19020000 	0x19020000
    3d3c:	00003dc6 	0x3dc6
    3d40:	0039481b 	0x39481b
    3d44:	00347c00 	0x347c00
    3d48:	02502900 	0x2502900
    3d4c:	cd280000 	pref	0x8,0(t1)
    3d50:	e4000025 	swc1	$f0,37(zero)
    3d54:	50bfc006 	beql	a1,ra,ffff3d70 <_text_end+0x403f25d8>
    3d58:	01000002 	0x1000002
    3d5c:	26011b7f 	addiu	at,s0,7039
    3d60:	347c0000 	ori	gp,v1,0x0
    3d64:	a1280000 	sb	t0,0(t1)
    3d68:	e4000022 	swc1	$f0,34(zero)
    3d6c:	50bfc006 	beql	a1,ra,ffff3d88 <_text_end+0x403f25f0>
    3d70:	01000002 	0x1000002
    3d74:	22c61b76 	addi	a2,s6,7030
    3d78:	34940000 	ori	s4,a0,0x0
    3d7c:	ba1b0000 	swr	k1,0(s0)
    3d80:	a8000022 	swl	zero,34(zero)
    3d84:	2a000034 	slti	zero,s0,52
    3d88:	00004358 	0x4358
    3d8c:	bfc006f4 	cache	0x0,1780(s8)
    3d90:	0000000c 	syscall
    3d94:	3db36a01 	0x3db36a01
    3d98:	621b0000 	0x621b0000
    3d9c:	bc000043 	cache	0x0,67(zero)
    3da0:	1c000034 	bgtz	zero,3e74 <_mem_avail_start-0x7fffc18c>
    3da4:	bfc00700 	cache	0x0,1792(s8)
    3da8:	000043f2 	tlt	zero,zero,0x10f
    3dac:	0154011d 	0x154011d
    3db0:	1e000030 	bgtz	s0,3e74 <_mem_avail_start-0x7fffc18c>
    3db4:	bfc006ec 	cache	0x0,1772(s8)
    3db8:	000043f2 	tlt	zero,zero,0x10f
    3dbc:	0154011d 	0x154011d
    3dc0:	0000003a 	0x3a
    3dc4:	e41e0000 	swc1	$f30,0(zero)
    3dc8:	6cbfc006 	0x6cbfc006
    3dcc:	1d000043 	bgtz	t0,3edc <_mem_avail_start-0x7fffc124>
    3dd0:	80025401 	lb	v0,21505(zero)
    3dd4:	00000000 	nop
    3dd8:	29070202 	slti	a3,t0,514
    3ddc:	03000007 	srav	zero,zero,t8
    3de0:	00003dd8 	0x3dd8
    3de4:	3ddf042c 	0x3ddf042c
    3de8:	26200000 	addiu	zero,s1,0
    3dec:	01000004 	sllv	zero,zero,t0
    3df0:	0001ec7c 	0x1ec7c
    3df4:	3e120300 	0x3e120300
    3df8:	4e0c0000 	c3	0xc0000
    3dfc:	00002500 	sll	a0,zero,0x14
    3e00:	001a0400 	sll	zero,k0,0x10
    3e04:	73110000 	madd	t8,s1
    3e08:	01007274 	teq	t0,zero,0x1c9
    3e0c:	0037687c 	0x37687c
    3e10:	e6200000 	swc1	$f0,0(s1)
    3e14:	01000000 	0x1000000
    3e18:	0010627c 	0x10627c
    3e1c:	3e3a0300 	0x3e3a0300
    3e20:	4e0c0000 	c3	0xc0000
    3e24:	00002500 	sll	a0,zero,0x14
    3e28:	00050400 	sll	zero,a1,0x10
    3e2c:	73110000 	madd	t8,s1
    3e30:	01007274 	teq	t0,zero,0x1c9
    3e34:	0038b37c 	0x38b37c
    3e38:	33220000 	andi	v0,t9,0x0
    3e3c:	02000008 	jr	s0
    3e40:	00168809 	0x168809
    3e44:	c0058000 	ll	a1,-32768(zero)
    3e48:	0000c8bf 	0xc8bf
    3e4c:	b19c0100 	0xb19c0100
    3e50:	2300003f 	addi	zero,t8,63
    3e54:	000004c7 	0x4c7
    3e58:	00000025 	move	zero,zero
    3e5c:	00125324 	0x125324
    3e60:	250b0200 	addiu	t3,t0,512
    3e64:	d0000000 	0xd0000000
    3e68:	25000034 	addiu	zero,t0,52
    3e6c:	006d656d 	0x6d656d
    3e70:	3fb10d02 	0x3fb10d02
    3e74:	80800000 	lb	zero,0(a0)
    3e78:	26788080 	addiu	t8,s3,-32640
    3e7c:	00000138 	0x138
    3e80:	00003eab 	0x3eab
    3e84:	02006927 	0x2006927
    3e88:	003c5610 	0x3c5610
    3e8c:	00351000 	0x351000
    3e90:	43322800 	c0	0x1322800
    3e94:	05840000 	0x5840000
    3e98:	0150bfc0 	0x150bfc0
    3e9c:	11020000 	beq	t0,v0,3ea0 <_mem_avail_start-0x7fffc160>
    3ea0:	0043461b 	0x43461b
    3ea4:	00352400 	0x352400
    3ea8:	29000000 	slti	zero,t0,0
    3eac:	00000170 	tge	zero,zero,0x5
    3eb0:	02006927 	0x2006927
    3eb4:	003c5614 	0x3c5614
    3eb8:	00353c00 	0x353c00
    3ebc:	43321a00 	c0	0x1321a00
    3ec0:	05c40000 	0x5c40000
    3ec4:	0190bfc0 	0x190bfc0
    3ec8:	15020000 	bne	t0,v0,3ecc <_mem_avail_start-0x7fffc134>
    3ecc:	00003ed6 	0x3ed6
    3ed0:	0043462e 	0x43462e
    3ed4:	542a0000 	bnel	at,t2,3ed8 <_mem_avail_start-0x7fffc128>
    3ed8:	04000039 	bltz	zero,3fc0 <_mem_avail_start-0x7fffc040>
    3edc:	08bfc006 	j	2ff0018 <_mem_avail_start-0x7d00ffe8>
    3ee0:	02000000 	0x2000000
    3ee4:	003f0617 	0x3f0617
    3ee8:	39701b00 	xori	s0,t3,0x1b00
    3eec:	355a0000 	ori	k0,t2,0x0
    3ef0:	042b0000 	tltiu	at,0
    3ef4:	08bfc006 	j	2ff0018 <_mem_avail_start-0x7d00ffe8>
    3ef8:	1f000000 	bgtz	t8,3efc <_mem_avail_start-0x7fffc104>
    3efc:	bfc0060c 	cache	0x0,1548(s8)
    3f00:	0000454f 	0x454f
    3f04:	2c1a0000 	sltiu	k0,zero,0
    3f08:	14000039 	bnez	zero,3ff0 <_mem_avail_start-0x7fffc010>
    3f0c:	b8bfc006 	swr	ra,-16378(a1)
    3f10:	02000001 	movf	zero,s0,$fcc0
    3f14:	003f9f19 	0x3f9f19
    3f18:	39481b00 	xori	t0,t2,0x1b00
    3f1c:	35720000 	ori	s2,t3,0x0
    3f20:	b8290000 	swr	t1,0(at)
    3f24:	28000001 	slti	zero,zero,1
    3f28:	000025cd 	break	0x0,0x97
    3f2c:	bfc00614 	cache	0x0,1556(s8)
    3f30:	000001b8 	0x1b8
    3f34:	011b7f01 	0x11b7f01
    3f38:	72000026 	0x72000026
    3f3c:	28000035 	slti	zero,zero,53
    3f40:	000022a1 	0x22a1
    3f44:	bfc00614 	cache	0x0,1556(s8)
    3f48:	000001b8 	0x1b8
    3f4c:	c61b7601 	lwc1	$f27,30209(s0)
    3f50:	8a000022 	lwl	zero,34(s0)
    3f54:	1b000035 	blez	t8,402c <_mem_avail_start-0x7fffbfd4>
    3f58:	000022ba 	0x22ba
    3f5c:	0000359e 	0x359e
    3f60:	0043582a 	slt	t3,v0,v1
    3f64:	c0062400 	ll	a2,9216(zero)
    3f68:	00000cbf 	0xcbf
    3f6c:	8c6a0100 	lw	t2,256(v1)
    3f70:	1b00003f 	blez	t8,4070 <_mem_avail_start-0x7fffbf90>
    3f74:	00004362 	0x4362
    3f78:	000035b2 	tlt	zero,zero,0xd6
    3f7c:	c006301c 	ll	a2,12316(zero)
    3f80:	0043f2bf 	0x43f2bf
    3f84:	54011d00 	bnel	zero,at,b388 <_mem_avail_start-0x7fff4c78>
    3f88:	00003001 	movf	a2,zero,$fcc0
    3f8c:	c0061c1e 	ll	a2,7198(zero)
    3f90:	0043f2bf 	0x43f2bf
    3f94:	54011d00 	bnel	zero,at,b398 <_mem_avail_start-0x7fff4c68>
    3f98:	00003a01 	0x3a01
    3f9c:	1e000000 	bgtz	s0,3fa0 <_mem_avail_start-0x7fffc060>
    3fa0:	bfc00614 	cache	0x0,1556(s8)
    3fa4:	0000436c 	0x436c
    3fa8:	0254011d 	0x254011d
    3fac:	00000080 	sll	zero,zero,0x2
    3fb0:	2c042c00 	sltiu	a0,zero,11264
    3fb4:	0f000000 	jal	c000000 <_mem_avail_start-0x74000000>
    3fb8:	00003fb1 	tgeu	zero,zero,0xfe
    3fbc:	00024520 	0x24520
    3fc0:	867c0100 	lh	gp,256(s3)
    3fc4:	03000005 	0x3000005
    3fc8:	00003fe4 	0x3fe4
    3fcc:	25004e0c 	addiu	zero,t0,19980
    3fd0:	04000000 	bltz	zero,3fd4 <_mem_avail_start-0x7fffc02c>
    3fd4:	00000019 	multu	zero,zero
    3fd8:	72747311 	0x72747311
    3fdc:	7c7c0100 	0x7c7c0100
    3fe0:	00000039 	0x39
    3fe4:	00108a2f 	0x108a2f
    3fe8:	561e0200 	bnel	s0,s8,47ec <_mem_avail_start-0x7fffb814>
    3fec:	9800003c 	lwr	zero,60(zero)
    3ff0:	0cbfc00a 	jal	2ff0028 <_mem_avail_start-0x7d00ffd8>
    3ff4:	01000001 	movf	zero,t0,$fcc0
    3ff8:	0043329c 	0x43329c
    3ffc:	3fbc1a00 	0x3fbc1a00
    4000:	0a980000 	j	a600000 <_mem_avail_start-0x75a00000>
    4004:	05f8bfc0 	0x5f8bfc0
    4008:	20020000 	addi	v0,zero,0
    400c:	00004038 	0x4038
    4010:	003fd81b 	0x3fd81b
    4014:	0035c600 	0x35c600
    4018:	05f82900 	0x5f82900
    401c:	b01e0000 	0xb01e0000
    4020:	92bfc00a 	lbu	ra,-16374(s5)
    4024:	1d000039 	bgtz	t0,410c <_mem_avail_start-0x7fffbef4>
    4028:	03055401 	0x3055401
    402c:	bfc0127c 	cache	0x0,4732(s8)
    4030:	0155011d 	0x155011d
    4034:	00000030 	tge	zero,zero
    4038:	003e122a 	0x3e122a
    403c:	c00ab800 	ll	t2,-18432(zero)
    4040:	000008bf 	0x8bf
    4044:	68220200 	0x68220200
    4048:	1b000040 	blez	t8,414c <_mem_avail_start-0x7fffbeb4>
    404c:	00003e2e 	0x3e2e
    4050:	000035de 	0x35de
    4054:	c00ab82b 	ll	t2,-18389(zero)
    4058:	000008bf 	0x8bf
    405c:	0ac01f00 	j	b007c00 <_mem_avail_start-0x74ff8400>
    4060:	4427bfc0 	0x4427bfc0
    4064:	00000000 	nop
    4068:	003dea2a 	0x3dea2a
    406c:	c00ac000 	ll	t2,-16384(zero)
    4070:	0000a4bf 	0xa4bf
    4074:	77230200 	jalx	c8c0800 <_mem_avail_start-0x7373f800>
    4078:	1b000042 	blez	t8,4184 <_mem_avail_start-0x7fffbe7c>
    407c:	00003e06 	0x3e06
    4080:	000035f6 	tne	zero,zero,0xd7
    4084:	c00ac02b 	ll	t2,-16341(zero)
    4088:	0000a4bf 	0xa4bf
    408c:	377e3000 	ori	s8,k1,0x3000
    4090:	0ac00000 	j	b000000 <_mem_avail_start-0x75000000>
    4094:	00a4bfc0 	0xa4bfc0
    4098:	7f010000 	0x7f010000
    409c:	0038ad2e 	0x38ad2e
    40a0:	38a21b00 	xori	v0,a1,0x1b00
    40a4:	35f60000 	ori	s6,t7,0x0
    40a8:	51300000 	beql	t1,s0,40ac <_mem_avail_start-0x7fffbf54>
    40ac:	c0000024 	ll	zero,36(zero)
    40b0:	a4bfc00a 	sh	ra,-16374(a1)
    40b4:	01000000 	0x1000000
    40b8:	25661b76 	addiu	a2,t3,7030
    40bc:	360e0000 	ori	t6,s0,0x0
    40c0:	611b0000 	0x611b0000
    40c4:	22000025 	addi	zero,s0,37
    40c8:	1b000036 	blez	t8,41a4 <_mem_avail_start-0x7fffbe5c>
    40cc:	0000255c 	0x255c
    40d0:	00003636 	tne	zero,zero,0xd8
    40d4:	0025571b 	0x25571b
    40d8:	00364b00 	0x364b00
    40dc:	25521b00 	addiu	s2,t2,6912
    40e0:	36600000 	ori	zero,s3,0x0
    40e4:	4d1b0000 	0x4d1b0000
    40e8:	75000025 	jalx	4000094 <_mem_avail_start-0x7bffff6c>
    40ec:	1b000036 	blez	t8,41c8 <_mem_avail_start-0x7fffbe38>
    40f0:	00002548 	0x2548
    40f4:	0000368a 	0x368a
    40f8:	0025431b 	0x25431b
    40fc:	00369f00 	0x369f00
    4100:	253e1b00 	addiu	s8,t1,6912
    4104:	36b40000 	ori	s4,s5,0x0
    4108:	391b0000 	xori	k1,t0,0x0
    410c:	c9000025 	lwc2	$0,37(t0)
    4110:	1b000036 	blez	t8,41ec <_mem_avail_start-0x7fffbe14>
    4114:	00002534 	teq	zero,zero,0x94
    4118:	000036de 	0x36de
    411c:	00252f1b 	0x252f1b
    4120:	0036b400 	0x36b400
    4124:	252a1b00 	addiu	t2,t1,6912
    4128:	36c90000 	ori	t1,s6,0x0
    412c:	251b0000 	addiu	k1,t0,0
    4130:	60000025 	0x60000025
    4134:	1b000036 	blez	t8,4210 <_mem_avail_start-0x7fffbdf0>
    4138:	00002520 	0x2520
    413c:	00003675 	0x3675
    4140:	00251b1b 	0x251b1b
    4144:	0036f300 	0x36f300
    4148:	25161b00 	addiu	s6,t0,6912
    414c:	37080000 	ori	t0,t8,0x0
    4150:	111b0000 	beq	t0,k1,4154 <_mem_avail_start-0x7fffbeac>
    4154:	f3000025 	0xf3000025
    4158:	1b000036 	blez	t8,4234 <_mem_avail_start-0x7fffbdcc>
    415c:	0000250c 	syscall	0x94
    4160:	000036b4 	teq	zero,zero,0xda
    4164:	0025071b 	0x25071b
    4168:	00371d00 	0x371d00
    416c:	25021b00 	addiu	v0,t0,6912
    4170:	37320000 	ori	s2,t9,0x0
    4174:	fd1b0000 	sdc3	$27,0(t0)
    4178:	47000024 	c1	0x1000024
    417c:	1b000037 	blez	t8,425c <_mem_avail_start-0x7fffbda4>
    4180:	000024f8 	0x24f8
    4184:	0000364b 	0x364b
    4188:	0024f31b 	0x24f31b
    418c:	00369f00 	0x369f00
    4190:	24ee1b00 	addiu	t6,a3,6912
    4194:	37080000 	ori	t0,t8,0x0
    4198:	e21b0000 	sc	k1,0(s0)
    419c:	5c000024 	bgtzl	zero,4230 <_mem_avail_start-0x7fffbdd0>
    41a0:	31000037 	andi	zero,t0,0x37
    41a4:	bfc00ac8 	cache	0x0,2760(s8)
    41a8:	000043f2 	tlt	zero,zero,0x10f
    41ac:	000041b7 	0x41b7
    41b0:	0254011d 	0x254011d
    41b4:	1e005408 	bgtz	s0,191d8 <_mem_avail_start-0x7ffe6e28>
    41b8:	bfc00b64 	cache	0x0,2916(s8)
    41bc:	000026bd 	0x26bd
    41c0:	0254011d 	0x254011d
    41c4:	011d6508 	0x11d6508
    41c8:	73080255 	0x73080255
    41cc:	0256011d 	0x256011d
    41d0:	011d7408 	0x11d7408
    41d4:	69080257 	0x69080257
    41d8:	108d021d 	beq	a0,t5,4a50 <_mem_avail_start-0x7fffb5b0>
    41dc:	1d6e0802 	0x1d6e0802
    41e0:	02148d02 	0x2148d02
    41e4:	021d6708 	0x21d6708
    41e8:	0802188d 	j	86234 <_mem_avail_start-0x7ff79dcc>
    41ec:	8d021d20 	lw	v0,7456(t0)
    41f0:	6d08021c 	0x6d08021c
    41f4:	208d021d 	addi	t5,a0,541
    41f8:	1d650802 	0x1d650802
    41fc:	02248d02 	0x2248d02
    4200:	021d6d08 	0x21d6d08
    4204:	0802288d 	j	8a234 <_mem_avail_start-0x7ff75dcc>
    4208:	8d021d6f 	lw	v0,7535(t0)
    420c:	7208022c 	0x7208022c
    4210:	308d021d 	andi	t5,a0,0x21d
    4214:	1d790802 	0x1d790802
    4218:	02348d02 	0x2348d02
    421c:	021d2008 	0x21d2008
    4220:	0802388d 	j	8e234 <_mem_avail_start-0x7ff71dcc>
    4224:	8d021d62 	lw	v0,7522(t0)
    4228:	7908023c 	0x7908023c
    422c:	c08d031d 	ll	t5,797(a0)
    4230:	20080200 	addi	t0,zero,512
    4234:	c48d031d 	lwc1	$f13,797(a0)
    4238:	73080200 	0x73080200
    423c:	c88d031d 	lwc2	$13,797(a0)
    4240:	68080200 	0x68080200
    4244:	cc8d031d 	pref	0xd,797(a0)
    4248:	6f080200 	0x6f080200
    424c:	d08d031d 	0xd08d031d
    4250:	72080200 	0x72080200
    4254:	d48d031d 	ldc1	$f13,797(a0)
    4258:	74080200 	jalx	200800 <_mem_avail_start-0x7fdff800>
    425c:	d88d031d 	ldc2	$13,797(a0)
    4260:	21080200 	addi	t0,t0,512
    4264:	dc8d031d 	ldc3	$13,797(a0)
    4268:	1d3a0100 	0x1d3a0100
    426c:	00e08d03 	0xe08d03
    4270:	00003001 	movf	a2,zero,$fcc0
    4274:	2a000000 	slti	zero,s0,0
    4278:	00003e12 	0x3e12
    427c:	bfc00b6c 	cache	0x0,2924(s8)
    4280:	00000008 	jr	zero
    4284:	42a72502 	c0	0xa72502
    4288:	2e1b0000 	sltiu	k1,s0,0
    428c:	7100003e 	0x7100003e
    4290:	2b000037 	slti	zero,t8,55
    4294:	bfc00b6c 	cache	0x0,2924(s8)
    4298:	00000008 	jr	zero
    429c:	c00b741f 	ll	t3,29727(zero)
    42a0:	004427bf 	0x4427bf
    42a4:	2a000000 	slti	zero,s0,0
    42a8:	00003fbc 	0x3fbc
    42ac:	bfc00b74 	cache	0x0,2932(s8)
    42b0:	00000010 	mfhi	zero
    42b4:	42e62602 	c0	0xe62602
    42b8:	d81b0000 	ldc2	$27,0(zero)
    42bc:	8900003f 	lwl	zero,63(t0)
    42c0:	2b000037 	slti	zero,t8,55
    42c4:	bfc00b74 	cache	0x0,2932(s8)
    42c8:	00000010 	mfhi	zero
    42cc:	c00b841e 	ll	t3,-31714(zero)
    42d0:	003992bf 	0x3992bf
    42d4:	54011d00 	bnel	zero,at,b6d8 <_mem_avail_start-0x7fff4928>
    42d8:	12980305 	beq	s4,t8,4ef0 <_mem_avail_start-0x7fffb110>
    42dc:	011dbfc0 	0x11dbfc0
    42e0:	00300155 	0x300155
    42e4:	122a0000 	beq	s1,t2,42e8 <_mem_avail_start-0x7fffbd18>
    42e8:	8c00003e 	lw	zero,62(zero)
    42ec:	08bfc00b 	j	2ff002c <_mem_avail_start-0x7d00ffd4>
    42f0:	02000000 	0x2000000
    42f4:	00431628 	0x431628
    42f8:	3e2e1b00 	0x3e2e1b00
    42fc:	37a10000 	ori	at,sp,0x0
    4300:	8c2b0000 	lw	t3,0(at)
    4304:	08bfc00b 	j	2ff002c <_mem_avail_start-0x7d00ffd4>
    4308:	1f000000 	bgtz	t8,430c <_mem_avail_start-0x7fffbcf4>
    430c:	bfc00b94 	cache	0x0,2964(s8)
    4310:	00004427 	0x4427
    4314:	b81f0000 	swr	ra,0(zero)
    4318:	3abfc00a 	xori	ra,s5,0xc00a
    431c:	1f00003e 	bgtz	t8,4418 <_mem_avail_start-0x7fffbbe8>
    4320:	bfc00b6c 	cache	0x0,2924(s8)
    4324:	00003c5d 	0x3c5d
    4328:	c00b8c1f 	ll	t3,-29665(zero)
    432c:	003ad5bf 	0x3ad5bf
    4330:	e7320000 	swc1	$f18,0(t9)
    4334:	0200000a 	movz	zero,s0,zero
    4338:	00032b03 	sra	a1,v1,0xc
    433c:	00002500 	sll	a0,zero,0x14
    4340:	43520300 	c0	0x1520300
    4344:	53330000 	beql	t9,s3,4348 <_mem_avail_start-0x7fffbcb8>
    4348:	02000012 	0x2000012
    434c:	00435203 	0x435203
    4350:	04130000 	bgezall	zero,4354 <_mem_avail_start-0x7fffbcac>
    4354:	00000025 	move	zero,zero
    4358:	00169b10 	0x169b10
    435c:	436c0300 	c0	0x16c0300
    4360:	61110000 	0x61110000
    4364:	b96e0100 	swr	t6,256(t3)
    4368:	00000016 	0x16
    436c:	00048422 	0x48422
    4370:	22350100 	addi	s5,s1,256
    4374:	10000016 	b	43d0 <_mem_avail_start-0x7fffbc30>
    4378:	70bfc005 	0x70bfc005
    437c:	01000000 	0x1000000
    4380:	0043f29c 	0x43f29c
    4384:	00761700 	0x761700
    4388:	00253501 	0x253501
    438c:	37b90000 	ori	t9,sp,0x0
    4390:	3c340000 	0x3c340000
    4394:	2cbfc005 	sltiu	ra,a1,-16379
    4398:	cd000000 	pref	0x0,0(t0)
    439c:	27000043 	addiu	zero,t8,67
    43a0:	39010069 	xori	at,t0,0x69
    43a4:	00003c56 	0x3c56
    43a8:	000037e5 	0x37e5
    43ac:	c005402b 	ll	a1,16427(zero)
    43b0:	000020bf 	0x20bf
    43b4:	00632700 	0x632700
    43b8:	16b93b01 	bne	s5,t9,12fc0 <_mem_avail_start-0x7ffed040>
    43bc:	37f90000 	ori	t9,ra,0x0
    43c0:	601f0000 	0x601f0000
    43c4:	f2bfc005 	0xf2bfc005
    43c8:	00000043 	sra	zero,zero,0x1
    43cc:	05303100 	bltzal	t1,107d0 <_mem_avail_start-0x7ffef830>
    43d0:	43f2bfc0 	c0	0x1f2bfc0
    43d4:	43e10000 	c0	0x1e10000
    43d8:	011d0000 	0x11d0000
    43dc:	30080254 	andi	t0,zero,0x254
    43e0:	05381e00 	0x5381e00
    43e4:	43f2bfc0 	c0	0x1f2bfc0
    43e8:	011d0000 	0x11d0000
    43ec:	78080254 	0x78080254
    43f0:	cf220000 	pref	0x2,0(t9)
    43f4:	01000014 	0x1000014
    43f8:	000ba613 	0xba613
    43fc:	c0045000 	ll	a0,20480(zero)
    4400:	000028bf 	0x28bf
    4404:	279c0100 	addiu	gp,gp,256
    4408:	35000044 	ori	zero,t0,0x44
    440c:	13010063 	beq	t8,at,459c <_mem_avail_start-0x7fffba64>
    4410:	000016b9 	0x16b9
    4414:	84365401 	lh	s6,21505(at)
    4418:	01000010 	0x1000010
    441c:	003fb715 	0x3fb715
    4420:	80808000 	lb	zero,-32768(a0)
    4424:	37007a98 	ori	zero,t8,0x7a98
    4428:	000038c9 	0x38c9
    442c:	bfc00478 	cache	0x0,1144(s8)
    4430:	00000038 	0x38
    4434:	454f9c01 	0x454f9c01
    4438:	1b380000 	0x1b380000
    443c:	06000039 	bltz	s0,4524 <_mem_avail_start-0x7fffbadc>
    4440:	004830f2 	tlt	v0,t0,0xc3
    4444:	6d280000 	0x6d280000
    4448:	80000025 	lb	zero,37(zero)
    444c:	00bfc004 	sllv	t8,ra,a1
    4450:	01000000 	0x1000000
    4454:	25b03976 	addiu	s0,t5,14710
    4458:	39000000 	xori	zero,t0,0x0
    445c:	000025ab 	0x25ab
    4460:	25a6390a 	addiu	a2,t5,14602
    4464:	39210000 	xori	at,t1,0x0
    4468:	000025a1 	0x25a1
    446c:	2595394b 	addiu	s5,t4,14667
    4470:	1a4f0000 	0x1a4f0000
    4474:	00002261 	0x2261
    4478:	bfc00488 	cache	0x0,1160(s8)
    447c:	00000018 	mult	zero,zero
    4480:	453d6a01 	0x453d6a01
    4484:	9a390000 	lwr	t9,0(s1)
    4488:	00000022 	neg	zero,zero
    448c:	00229539 	0x229539
    4490:	90390a00 	lbu	t9,2560(at)
    4494:	21000022 	addi	zero,t0,34
    4498:	00228439 	0x228439
    449c:	bb1a4b00 	swr	k0,19200(t8)
    44a0:	90000020 	lbu	zero,32(zero)
    44a4:	30bfc004 	andi	ra,a1,0xc004
    44a8:	01000000 	0x1000000
    44ac:	00452c6a 	0x452c6a
    44b0:	20ea3900 	addi	t2,a3,14592
    44b4:	39000000 	xori	zero,t0,0x0
    44b8:	000020e5 	0x20e5
    44bc:	20d9390a 	addi	t9,a2,14602
    44c0:	1a210000 	0x1a210000
    44c4:	000022a1 	0x22a1
    44c8:	bfc00498 	cache	0x0,1176(s8)
    44cc:	00000048 	0x48
    44d0:	451b6a01 	bc1tl	$fcc6,1ecd8 <_mem_avail_start-0x7ffe1328>
    44d4:	c6390000 	lwc1	$f25,0(s1)
    44d8:	00000022 	neg	zero,zero
    44dc:	0022ba39 	0x22ba39
    44e0:	582a0a00 	0x582a0a00
    44e4:	a4000043 	sh	zero,67(zero)
    44e8:	0cbfc004 	jal	2ff0010 <_mem_avail_start-0x7d00fff0>
    44ec:	01000000 	0x1000000
    44f0:	00450b6a 	0x450b6a
    44f4:	43623900 	c0	0x1623900
    44f8:	1c000000 	bgtz	zero,44fc <_mem_avail_start-0x7fffbb04>
    44fc:	bfc004b0 	cache	0x0,1200(s8)
    4500:	000043f2 	tlt	zero,zero,0x10f
    4504:	0154011d 	0x154011d
    4508:	1e000030 	bgtz	s0,45cc <_mem_avail_start-0x7fffba34>
    450c:	bfc004a0 	cache	0x0,1184(s8)
    4510:	000043f2 	tlt	zero,zero,0x10f
    4514:	0154011d 	0x154011d
    4518:	1e00003a 	bgtz	s0,4604 <_mem_avail_start-0x7fffb9fc>
    451c:	bfc00498 	cache	0x0,1176(s8)
    4520:	000043f2 	tlt	zero,zero,0x10f
    4524:	0254011d 	0x254011d
    4528:	00002108 	0x2108
    452c:	c004901e 	ll	a0,-28642(zero)
    4530:	0043f2bf 	0x43f2bf
    4534:	54011d00 	bnel	zero,at,b938 <_mem_avail_start-0x7fff46c8>
    4538:	004b0802 	0x4b0802
    453c:	04881e00 	tgei	a0,7680
    4540:	43f2bfc0 	c0	0x1f2bfc0
    4544:	011d0000 	0x11d0000
    4548:	4f080254 	c3	0x1080254
    454c:	37000000 	ori	zero,t8,0x0
    4550:	00002628 	0x2628
    4554:	bfc004b0 	cache	0x0,1200(s8)
    4558:	00000060 	0x60
    455c:	481c9c01 	0x481c9c01
    4560:	ac380000 	sw	t8,0(at)
    4564:	06000026 	bltz	s0,4600 <_mem_avail_start-0x7fffba00>
    4568:	00481cf2 	tlt	v0,t0,0x73
    456c:	cd280000 	pref	0x8,0(t1)
    4570:	b8000022 	swr	zero,34(zero)
    4574:	60bfc004 	0x60bfc004
    4578:	01000000 	0x1000000
    457c:	23423976 	addi	v0,k0,14710
    4580:	39000000 	xori	zero,t0,0x0
    4584:	0000233d 	0x233d
    4588:	23383920 	addi	t8,t9,14624
    458c:	39740000 	xori	s4,t3,0x0
    4590:	00002333 	tltu	zero,zero,0x8c
    4594:	232e3961 	addi	t6,t9,14689
    4598:	39200000 	xori	zero,t1,0x0
    459c:	00002329 	0x2329
    45a0:	23243972 	addi	a0,t9,14706
    45a4:	396f0000 	xori	t7,t3,0x0
    45a8:	0000231f 	0x231f
    45ac:	231a3972 	addi	k0,t8,14706
    45b0:	39720000 	xori	s2,t3,0x0
    45b4:	0000230e 	0x230e
    45b8:	20f11a45 	addi	s1,a3,6725
    45bc:	04c00000 	bltz	a2,45c0 <_mem_avail_start-0x7fffba40>
    45c0:	0078bfc0 	0x78bfc0
    45c4:	6a010000 	0x6a010000
    45c8:	0000480a 	movz	t1,zero,zero
    45cc:	00215c39 	0x215c39
    45d0:	57390000 	bnel	t9,t9,45d4 <_mem_avail_start-0x7fffba2c>
    45d4:	20000021 	addi	zero,zero,33
    45d8:	00215239 	0x215239
    45dc:	4d397400 	0x4d397400
    45e0:	61000021 	0x61000021
    45e4:	00214839 	0x214839
    45e8:	43392000 	c0	0x1392000
    45ec:	72000021 	clo	zero,s0
    45f0:	00213e39 	0x213e39
    45f4:	39396f00 	xori	t9,t1,0x6f00
    45f8:	72000021 	clo	zero,s0
    45fc:	00212d39 	0x212d39
    4600:	5f1a7200 	0x5f1a7200
    4604:	c800001f 	lwc2	$0,31(zero)
    4608:	90bfc004 	lbu	ra,-16380(a1)
    460c:	01000000 	0x1000000
    4610:	0047f96a 	0x47f96a
    4614:	1fc03900 	bgtz	s8,12a18 <_mem_avail_start-0x7ffed5e8>
    4618:	39000000 	xori	zero,t0,0x0
    461c:	00001fbb 	0x1fbb
    4620:	1fb63920 	0x1fb63920
    4624:	39740000 	xori	s4,t3,0x0
    4628:	00001fb1 	tgeu	zero,zero,0x7e
    462c:	1fac3961 	0x1fac3961
    4630:	39200000 	xori	zero,t1,0x0
    4634:	00001fa7 	0x1fa7
    4638:	1fa23972 	0x1fa23972
    463c:	396f0000 	xori	t7,t3,0x0
    4640:	00001f96 	0x1f96
    4644:	1e171a72 	0x1e171a72
    4648:	04d00000 	bltzal	a2,464c <_mem_avail_start-0x7fffb9b4>
    464c:	00a8bfc0 	0xa8bfc0
    4650:	6a010000 	0x6a010000
    4654:	000047e8 	0x47e8
    4658:	001e6e39 	0x1e6e39
    465c:	69390000 	0x69390000
    4660:	2000001e 	addi	zero,zero,30
    4664:	001e6439 	0x1e6439
    4668:	5f397400 	0x5f397400
    466c:	6100001e 	0x6100001e
    4670:	001e5a39 	0x1e5a39
    4674:	55392000 	bnel	t1,t9,c678 <_mem_avail_start-0x7fff3988>
    4678:	7200001e 	0x7200001e
    467c:	001e4939 	0x1e4939
    4680:	e31a6f00 	sc	k0,28416(t8)
    4684:	d800001c 	ldc2	$0,28(zero)
    4688:	c0bfc004 	ll	ra,-16380(a1)
    468c:	01000000 	0x1000000
    4690:	0047d76a 	0x47d76a
    4694:	1d303900 	0x1d303900
    4698:	39000000 	xori	zero,t0,0x0
    469c:	00001d2b 	0x1d2b
    46a0:	1d263920 	0x1d263920
    46a4:	39740000 	xori	s4,t3,0x0
    46a8:	00001d21 	0x1d21
    46ac:	1d1c3961 	0x1d1c3961
    46b0:	39200000 	xori	zero,t1,0x0
    46b4:	00001d10 	0x1d10
    46b8:	256d1a72 	addiu	t5,t3,6770
    46bc:	04e00000 	bltz	a3,46c0 <_mem_avail_start-0x7fffb940>
    46c0:	00d8bfc0 	0xd8bfc0
    46c4:	6a010000 	0x6a010000
    46c8:	000047c6 	0x47c6
    46cc:	0025b039 	0x25b039
    46d0:	ab390000 	swl	t9,0(t9)
    46d4:	20000025 	addi	zero,zero,37
    46d8:	0025a639 	0x25a639
    46dc:	a1397400 	sb	t9,29696(t1)
    46e0:	61000025 	0x61000025
    46e4:	00259539 	0x259539
    46e8:	611a2000 	0x611a2000
    46ec:	e8000022 	swc2	$0,34(zero)
    46f0:	f0bfc004 	0xf0bfc004
    46f4:	01000000 	0x1000000
    46f8:	0047b56a 	0x47b56a
    46fc:	229a3900 	addi	k0,s4,14592
    4700:	39000000 	xori	zero,t0,0x0
    4704:	00002295 	0x2295
    4708:	22903920 	addi	s0,s4,14624
    470c:	39740000 	xori	s4,t3,0x0
    4710:	00002284 	0x2284
    4714:	20bb1a61 	addi	k1,a1,6753
    4718:	04f00000 	bltzal	a3,471c <_mem_avail_start-0x7fffb8e4>
    471c:	0108bfc0 	0x108bfc0
    4720:	6a010000 	0x6a010000
    4724:	000047a4 	0x47a4
    4728:	0020ea39 	0x20ea39
    472c:	e5390000 	swc1	$f25,0(t1)
    4730:	20000020 	addi	zero,zero,32
    4734:	0020d939 	0x20d939
    4738:	a11a7400 	sb	k0,29696(t0)
    473c:	f8000022 	sdc2	$0,34(zero)
    4740:	20bfc004 	addi	ra,a1,-16380
    4744:	01000001 	movf	zero,t0,$fcc0
    4748:	0047936a 	0x47936a
    474c:	22c63900 	addi	a2,s6,14592
    4750:	39000000 	xori	zero,t0,0x0
    4754:	000022ba 	0x22ba
    4758:	43582a20 	wait	0x560a8
    475c:	05040000 	0x5040000
    4760:	000cbfc0 	sll	s7,t4,0x1f
    4764:	6a010000 	0x6a010000
    4768:	00004782 	srl	t0,zero,0x1e
    476c:	00436239 	0x436239
    4770:	101c0000 	beq	zero,gp,4774 <_mem_avail_start-0x7fffb88c>
    4774:	f2bfc005 	0xf2bfc005
    4778:	1d000043 	bgtz	t0,4888 <_mem_avail_start-0x7fffb778>
    477c:	30015401 	andi	at,zero,0x5401
    4780:	001e0000 	sll	zero,s8,0x0
    4784:	f2bfc005 	0xf2bfc005
    4788:	1d000043 	bgtz	t0,4898 <_mem_avail_start-0x7fffb768>
    478c:	08025401 	j	95004 <_mem_avail_start-0x7ff6affc>
    4790:	1e000020 	bgtz	s0,4814 <_mem_avail_start-0x7fffb7ec>
    4794:	bfc004f8 	cache	0x0,1272(s8)
    4798:	000043f2 	tlt	zero,zero,0x10f
    479c:	0254011d 	0x254011d
    47a0:	00007408 	0x7408
    47a4:	c004f01e 	ll	a0,-4066(zero)
    47a8:	0043f2bf 	0x43f2bf
    47ac:	54011d00 	bnel	zero,at,bbb0 <_mem_avail_start-0x7fff4450>
    47b0:	00610802 	0x610802
    47b4:	04e81e00 	tgei	a3,7680
    47b8:	43f2bfc0 	c0	0x1f2bfc0
    47bc:	011d0000 	0x11d0000
    47c0:	20080254 	addi	t0,zero,596
    47c4:	e01e0000 	sc	s8,0(zero)
    47c8:	f2bfc004 	0xf2bfc004
    47cc:	1d000043 	bgtz	t0,48dc <_mem_avail_start-0x7fffb724>
    47d0:	08025401 	j	95004 <_mem_avail_start-0x7ff6affc>
    47d4:	1e000072 	bgtz	s0,49a0 <_mem_avail_start-0x7fffb660>
    47d8:	bfc004d8 	cache	0x0,1240(s8)
    47dc:	000043f2 	tlt	zero,zero,0x10f
    47e0:	0254011d 	0x254011d
    47e4:	00006f08 	0x6f08
    47e8:	c004d01e 	ll	a0,-12258(zero)
    47ec:	0043f2bf 	0x43f2bf
    47f0:	54011d00 	bnel	zero,at,bbf4 <_mem_avail_start-0x7fff440c>
    47f4:	00720802 	0x720802
    47f8:	04c81e00 	tgei	a2,7680
    47fc:	43f2bfc0 	c0	0x1f2bfc0
    4800:	011d0000 	0x11d0000
    4804:	72080254 	0x72080254
    4808:	c01e0000 	ll	s8,0(zero)
    480c:	f2bfc004 	0xf2bfc004
    4810:	1d000043 	bgtz	t0,4920 <_mem_avail_start-0x7fffb6e0>
    4814:	08025401 	j	95004 <_mem_avail_start-0x7ff6affc>
    4818:	00000045 	0x45
    481c:	0a9e0c3a 	j	a7830e8 <_mem_avail_start-0x7587cf18>
    4820:	6f727245 	0x6f727245
    4824:	74612072 	jalx	18481c8 <_mem_avail_start-0x7e7b7e38>
    4828:	043a0020 	0x43a0020
    482c:	000a029e 	0xa029e
    4830:	059e073a 	0x59e073a
    4834:	0a214b4f 	j	8852d3c <_mem_avail_start-0x777ad2c4>
    4838:	9e1c3a00 	0x9e1c3a00
    483c:	7365541a 	0x7365541a
    4840:	676e6974 	0x676e6974
    4844:	6d656d20 	0x6d656d20
    4848:	2079726f 	addi	t9,v1,29295
    484c:	73207962 	0x73207962
    4850:	74726f68 	jalx	1c9bda0 <_mem_avail_start-0x7e364260>
    4854:	00000a21 	0xa21
    4858:	00000022 	neg	zero,zero
    485c:	02e70002 	0x2e70002
    4860:	01040000 	0x1040000
    4864:	0000028a 	0x28a
    4868:	bfc00000 	cache	0x0,0(s8)
    486c:	bfc00450 	cache	0x0,1104(s8)
    4870:	00001987 	0x1987
    4874:	00001999 	0x1999
    4878:	000019d4 	0x19d4
    487c:	056c8001 	teqi	t3,-32767
    4880:	00040000 	sll	zero,a0,0x0
    4884:	000002fb 	0x2fb
    4888:	1ac70104 	0x1ac70104
    488c:	f40c0000 	sdc1	$f12,0(zero)
    4890:	df00001b 	ldc3	$0,27(t8)
    4894:	c0000011 	ll	zero,17(zero)
    4898:	00000006 	srlv	zero,zero,zero
    489c:	21000000 	addi	zero,t0,0
    48a0:	02000003 	0x2000003
    48a4:	06bc0704 	0x6bc0704
    48a8:	04020000 	bltzl	zero,48ac <_mem_avail_start-0x7fffb754>
    48ac:	0006b707 	0x6b707
    48b0:	1bd40300 	0x1bd40300
    48b4:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
    48b8:	00000025 	move	zero,zero
    48bc:	dc060102 	ldc3	$6,258(zero)
    48c0:	0400000e 	bltz	zero,48fc <_mem_avail_start-0x7fffb704>
    48c4:	0000003e 	0x3e
    48c8:	d5060102 	ldc1	$f6,258(t0)
    48cc:	0200000e 	0x200000e
    48d0:	1bb70502 	0x1bb70502
    48d4:	04050000 	0x4050000
    48d8:	746e6905 	jalx	1b9a414 <_mem_avail_start-0x7e465bec>
    48dc:	05040200 	0x5040200
    48e0:	00001bdd 	0x1bdd
    48e4:	001ab403 	sra	s6,k0,0x10
    48e8:	71090300 	0x71090300
    48ec:	02000000 	0x2000000
    48f0:	0ed30801 	jal	b4c2004 <_mem_avail_start-0x74b3dffc>
    48f4:	cb030000 	lwc2	$3,0(t8)
    48f8:	0300001b 	divu	zero,t8,zero
    48fc:	0000830a 	0x830a
    4900:	07020200 	bltzl	t8,5104 <_mem_avail_start-0x7fffaefc>
    4904:	00000729 	0x729
    4908:	001a4203 	sra	t0,k0,0x8
    490c:	660b0400 	0x660b0400
    4910:	03000000 	0x3000000
    4914:	00001e14 	0x1e14
    4918:	00330d04 	0x330d04
    491c:	b0060000 	0xb0060000
    4920:	b0000000 	0xb0000000
    4924:	07000000 	bltz	t8,4928 <_mem_avail_start-0x7fffb6d8>
    4928:	00000025 	move	zero,zero
    492c:	0408001f 	tgei	zero,31
    4930:	00000045 	0x45
    4934:	0019ed09 	0x19ed09
    4938:	a0070500 	sb	a3,1280(zero)
    493c:	05000000 	bltz	t0,4940 <_mem_avail_start-0x7fffb6c0>
    4940:	c0170003 	ll	s7,3(zero)
    4944:	05a40abf 	0x5a40abf
    4948:	0001242a 	0x1242a
    494c:	1aac0b00 	0x1aac0b00
    4950:	2b050000 	slti	a1,t8,0
    4954:	00000124 	0x124
    4958:	1a1a0b00 	0x1a1a0b00
    495c:	2c050000 	sltiu	a1,zero,0
    4960:	00000033 	tltu	zero,zero
    4964:	1a000b10 	blez	s0,75a8 <_mem_avail_start-0x7fff8a58>
    4968:	2d050000 	sltiu	a1,t0,0
    496c:	00000033 	tltu	zero,zero
    4970:	1a7e0b14 	0x1a7e0b14
    4974:	2e050000 	sltiu	a1,s0,0
    4978:	00000033 	tltu	zero,zero
    497c:	19e00b18 	blez	t7,75e0 <_mem_avail_start-0x7fff8a20>
    4980:	2f050000 	sltiu	a1,t8,0
    4984:	00000033 	tltu	zero,zero
    4988:	1bc10b1c 	0x1bc10b1c
    498c:	30050000 	andi	a1,zero,0x0
    4990:	00000033 	tltu	zero,zero
    4994:	70670c20 	0x70670c20
    4998:	31050072 	andi	a1,t0,0x72
    499c:	00000134 	teq	zero,zero,0x4
    49a0:	33060024 	andi	a2,t8,0x24
    49a4:	34000000 	li	zero,0x0
    49a8:	07000001 	bltz	t8,49b0 <_mem_avail_start-0x7fffb650>
    49ac:	00000025 	move	zero,zero
    49b0:	33060003 	andi	a2,t8,0x3
    49b4:	44000000 	mfc1	zero,$f0
    49b8:	07000001 	bltz	t8,49c0 <_mem_avail_start-0x7fffb640>
    49bc:	00000025 	move	zero,zero
    49c0:	1403001f 	bne	zero,v1,4a40 <_mem_avail_start-0x7fffb5c0>
    49c4:	0500001c 	bltz	t0,4a38 <_mem_avail_start-0x7fffb5c8>
    49c8:	0000c732 	tlt	zero,zero,0x31c
    49cc:	1a330d00 	0x1a330d00
    49d0:	06010000 	bgez	s0,49d4 <_mem_avail_start-0x7fffb62c>
    49d4:	0000008a 	0x8a
    49d8:	001a5e0d 	break	0x1a,0x178
    49dc:	8a060100 	lwl	a2,256(s0)
    49e0:	0e000000 	jal	8000000 <_mem_avail_start-0x78000000>
    49e4:	00001a99 	0x1a99
    49e8:	0d6c5501 	jal	5b15404 <_mem_avail_start-0x7a4eabfc>
    49ec:	00b4bfc0 	0xb4bfc0
    49f0:	9c010000 	0x9c010000
    49f4:	000002a9 	0x2a9
    49f8:	0066740f 	0x66740f
    49fc:	02a95501 	0x2a95501
    4a00:	38170000 	xori	s7,zero,0x0
    4a04:	0a100000 	j	8400000 <_mem_avail_start-0x77c00000>
    4a08:	0100001c 	0x100001c
    4a0c:	0002af55 	0x2af55
    4a10:	00384e00 	0x384e00
    4a14:	0ddc1100 	jal	7704400 <_mem_avail_start-0x788fbc00>
    4a18:	0044bfc0 	0x44bfc0
    4a1c:	02320000 	0x2320000
    4a20:	89120000 	lwl	s2,0(t0)
    4a24:	0100001a 	div	zero,t0,zero
    4a28:	0000955b 	0x955b
    4a2c:	00386f00 	0x386f00
    4a30:	70651300 	0x70651300
    4a34:	5c010063 	0x5c010063
    4a38:	00000058 	0x58
    4a3c:	00038c14 	0x38c14
    4a40:	c00ddc00 	ll	t5,-9216(zero)
    4a44:	000004bf 	0x4bf
    4a48:	e15b0100 	sc	k1,256(t2)
    4a4c:	15000001 	bnez	t0,4a54 <_mem_avail_start-0x7fffb5ac>
    4a50:	bfc00ddc 	cache	0x0,3548(s8)
    4a54:	00000004 	sllv	zero,zero,zero
    4a58:	00051a16 	0x51a16
    4a5c:	14000000 	bnez	zero,4a60 <_mem_avail_start-0x7fffb5a0>
    4a60:	000003a6 	0x3a6
    4a64:	bfc00e00 	cache	0x0,3584(s8)
    4a68:	00000004 	sllv	zero,zero,zero
    4a6c:	02045c01 	0x2045c01
    4a70:	00150000 	sll	zero,s5,0x0
    4a74:	04bfc00e 	0x4bfc00e
    4a78:	16000000 	bnez	s0,4a7c <_mem_avail_start-0x7fffb584>
    4a7c:	000004ff 	0x4ff
    4a80:	10170000 	beq	zero,s7,4a84 <_mem_avail_start-0x7fffb57c>
    4a84:	22bfc00e 	addi	ra,s5,-16370
    4a88:	21000005 	addi	zero,t0,5
    4a8c:	18000002 	blez	zero,4a98 <_mem_avail_start-0x7fffb568>
    4a90:	03055401 	0x3055401
    4a94:	bfc01438 	cache	0x0,5176(s8)
    4a98:	02550118 	0x2550118
    4a9c:	19000080 	blez	t0,4ca0 <_mem_avail_start-0x7fffb360>
    4aa0:	bfc00e18 	cache	0x0,3608(s8)
    4aa4:	0000052d 	0x52d
    4aa8:	02540118 	0x2540118
    4aac:	00000080 	sll	zero,zero,0x2
    4ab0:	c00d9017 	ll	t5,-28649(zero)
    4ab4:	000538bf 	0x538bf
    4ab8:	00024900 	sll	t1,v0,0x4
    4abc:	54011800 	bnel	zero,at,aac0 <_mem_avail_start-0x7fff5540>
    4ac0:	12b40305 	beq	s5,s4,56d8 <_mem_avail_start-0x7fffa928>
    4ac4:	1700bfc0 	bnez	t8,ffff49c8 <_text_end+0x403f3230>
    4ac8:	bfc00da4 	cache	0x0,3492(s8)
    4acc:	00000538 	0x538
    4ad0:	00000260 	0x260
    4ad4:	05540118 	0x5540118
    4ad8:	c0141003 	ll	s4,4099(zero)
    4adc:	b01700bf 	0xb01700bf
    4ae0:	43bfc00d 	c0	0x1bfc00d
    4ae4:	78000005 	0x78000005
    4ae8:	18000002 	blez	zero,4af4 <_mem_avail_start-0x7fffb50c>
    4aec:	11065401 	beq	t0,a2,19af4 <_mem_avail_start-0x7ffe650c>
    4af0:	f5b7bdad 	sdc1	$f23,-16979(t5)
    4af4:	b817007d 	swr	s7,125(zero)
    4af8:	28bfc00d 	slti	ra,a1,-16371
    4afc:	8c000003 	lw	zero,3(zero)
    4b00:	18000002 	blez	zero,4b0c <_mem_avail_start-0x7fffb4f4>
    4b04:	81025401 	lb	v0,21505(t0)
    4b08:	c01a0000 	ll	k0,0(zero)
    4b0c:	b6bfc00d 	0xb6bfc00d
    4b10:	1b000002 	blez	t8,4b1c <_mem_avail_start-0x7fffb4e4>
    4b14:	bfc00ddc 	cache	0x0,3548(s8)
    4b18:	00000538 	0x538
    4b1c:	05540118 	0x5540118
    4b20:	c0147403 	ll	s4,29699(zero)
    4b24:	080000bf 	j	2fc <_mem_avail_start-0x7ffffd04>
    4b28:	00014404 	0x14404
    4b2c:	02010200 	0x2010200
    4b30:	00001a14 	0x1a14
    4b34:	001a0a1c 	0x1a0a1c
    4b38:	04450100 	0x4450100
    4b3c:	68bfc00d 	0x68bfc00d
    4b40:	01000000 	0x1000000
    4b44:	0003289c 	0x3289c
    4b48:	06881d00 	tgei	s4,7424
    4b4c:	691e0000 	0x691e0000
    4b50:	66460100 	0x66460100
    4b54:	82000000 	lb	zero,0(s0)
    4b58:	1d000038 	bgtz	t0,4c3c <_mem_avail_start-0x7fffb3c4>
    4b5c:	000006a0 	0x6a0
    4b60:	001be612 	0x1be612
    4b64:	33470100 	andi	a3,k0,0x100
    4b68:	a1000000 	sb	zero,0(t0)
    4b6c:	12000038 	beqz	s0,4c50 <_mem_avail_start-0x7fffb3b0>
    4b70:	00001a8e 	0x1a8e
    4b74:	00334701 	0x334701
    4b78:	38b40000 	xori	s4,a1,0x0
    4b7c:	bc120000 	cache	0x12,0(zero)
    4b80:	0100001a 	div	zero,t0,zero
    4b84:	00003347 	0x3347
    4b88:	0038c700 	0x38c700
    4b8c:	0d501900 	jal	5406400 <_mem_avail_start-0x7abf9c00>
    4b90:	0522bfc0 	bltzl	t1,ffff4a94 <_text_end+0x403f32fc>
    4b94:	01180000 	0x1180000
    4b98:	00810254 	0x810254
    4b9c:	02550118 	0x2550118
    4ba0:	00007f80 	sll	t7,zero,0x1e
    4ba4:	6e0e0000 	0x6e0e0000
    4ba8:	0100001a 	div	zero,t0,zero
    4bac:	c00c6c3e 	ll	t4,27710(zero)
    4bb0:	000098bf 	0x98bf
    4bb4:	8c9c0100 	lw	gp,256(a0)
    4bb8:	0f000003 	jal	c00000c <_mem_avail_start-0x73fffff4>
    4bbc:	01006674 	teq	t0,zero,0x199
    4bc0:	0002a93e 	0x2a93e
    4bc4:	0038da00 	0x38da00
    4bc8:	06701f00 	bltzal	s3,c7cc <_mem_avail_start-0x7fff3834>
    4bcc:	03780000 	0x3780000
    4bd0:	691e0000 	0x691e0000
    4bd4:	583f0100 	0x583f0100
    4bd8:	06000000 	bltz	s0,4bdc <_mem_avail_start-0x7fffb424>
    4bdc:	19000039 	blez	t0,4cc4 <_mem_avail_start-0x7fffb33c>
    4be0:	bfc00cb4 	cache	0x0,3252(s8)
    4be4:	00000522 	0x522
    4be8:	02540118 	0x2540118
    4bec:	01180083 	0x1180083
    4bf0:	7f810255 	0x7f810255
    4bf4:	e4190000 	swc1	$f25,0(zero)
    4bf8:	22bfc00c 	addi	ra,s5,-16372
    4bfc:	18000005 	blez	zero,4c14 <_mem_avail_start-0x7fffb3ec>
    4c00:	03055401 	0x3055401
    4c04:	bfc0139c 	cache	0x0,5020(s8)
    4c08:	28200000 	slti	zero,at,0
    4c0c:	0100001a 	div	zero,t0,zero
    4c10:	00009535 	0x9535
    4c14:	03a60100 	0x3a60100
    4c18:	6e130000 	0x6e130000
    4c1c:	95360100 	lhu	s6,256(t1)
    4c20:	00000000 	nop
    4c24:	001a4920 	0x1a4920
    4c28:	952c0100 	lhu	t4,256(t1)
    4c2c:	01000000 	0x1000000
    4c30:	000003c0 	sll	zero,zero,0xf
    4c34:	01006e13 	0x1006e13
    4c38:	0000952d 	0x952d
    4c3c:	221c0000 	addi	gp,s0,0
    4c40:	0100001a 	div	zero,t0,zero
    4c44:	c00ba40b 	ll	t3,-23541(zero)
    4c48:	0000c8bf 	0xc8bf
    4c4c:	ec9c0100 	swc3	$28,256(a0)
    4c50:	12000004 	beqz	s0,4c64 <_mem_avail_start-0x7fffb39c>
    4c54:	00001b99 	0x1b99
    4c58:	00581801 	movf	v1,v0,$fcc6
    4c5c:	39480000 	xori	t0,t2,0x0
    4c60:	03120000 	0x3120000
    4c64:	0100001c 	0x100001c
    4c68:	00005821 	move	t3,zero
    4c6c:	00396600 	0x396600
    4c70:	0bb81a00 	j	ee06800 <_mem_avail_start-0x711f9800>
    4c74:	054ebfc0 	tnei	t2,-16448
    4c78:	c0170000 	ll	s7,0(zero)
    4c7c:	43bfc00b 	c0	0x1bfc00b
    4c80:	0f000005 	jal	c000014 <_mem_avail_start-0x73ffffec>
    4c84:	18000004 	blez	zero,4c98 <_mem_avail_start-0x7fffb368>
    4c88:	34015401 	li	at,0x5401
    4c8c:	0bcc1700 	j	f305c00 <_mem_avail_start-0x70cfa400>
    4c90:	0538bfc0 	0x538bfc0
    4c94:	04260000 	0x4260000
    4c98:	01180000 	0x1180000
    4c9c:	b4030554 	0xb4030554
    4ca0:	00bfc012 	0xbfc012
    4ca4:	c00be817 	ll	t3,-6121(zero)
    4ca8:	000538bf 	0x538bf
    4cac:	00043d00 	sll	a3,a0,0x14
    4cb0:	54011800 	bnel	zero,at,acb4 <_mem_avail_start-0x7fff534c>
    4cb4:	12dc0305 	beq	s6,gp,58cc <_mem_avail_start-0x7fffa734>
    4cb8:	1700bfc0 	bnez	t8,ffff4bbc <_text_end+0x403f3424>
    4cbc:	bfc00bf4 	cache	0x0,3060(s8)
    4cc0:	00000543 	sra	zero,zero,0x15
    4cc4:	00000450 	0x450
    4cc8:	01540118 	0x1540118
    4ccc:	0c170035 	jal	5c00d4 <_mem_avail_start-0x7fa3ff2c>
    4cd0:	22bfc00c 	addi	ra,s5,-16372
    4cd4:	73000005 	msubu	t8,zero
    4cd8:	18000004 	blez	zero,4cec <_mem_avail_start-0x7fffb314>
    4cdc:	03055401 	0x3055401
    4ce0:	bfc01304 	cache	0x0,4868(s8)
    4ce4:	02550118 	0x2550118
    4ce8:	01180081 	0x1180081
    4cec:	00800256 	0x800256
    4cf0:	0c1c1700 	jal	705c00 <_mem_avail_start-0x7f8fa400>
    4cf4:	0559bfc0 	0x559bfc0
    4cf8:	04920000 	bltzall	a0,4cfc <_mem_avail_start-0x7fffb304>
    4cfc:	01180000 	0x1180000
    4d00:	00810254 	0x810254
    4d04:	01550118 	0x1550118
    4d08:	56011830 	bnel	s0,at,adcc <_mem_avail_start-0x7fff5234>
    4d0c:	00008002 	srl	s0,zero,0x0
    4d10:	c00c2417 	ll	t4,9239(zero)
    4d14:	000543bf 	0x543bf
    4d18:	0004a500 	sll	s4,a0,0x14
    4d1c:	54011800 	bnel	zero,at,ad20 <_mem_avail_start-0x7fff52e0>
    4d20:	1a003601 	blez	s0,12528 <_mem_avail_start-0x7ffedad8>
    4d24:	bfc00c2c 	cache	0x0,3116(s8)
    4d28:	00000564 	0x564
    4d2c:	c00c4017 	ll	t4,16407(zero)
    4d30:	000538bf 	0x538bf
    4d34:	0004c500 	sll	t8,a0,0x14
    4d38:	54011800 	bnel	zero,at,ad3c <_mem_avail_start-0x7fff52c4>
    4d3c:	13400305 	beqz	k0,5954 <_mem_avail_start-0x7fffa6ac>
    4d40:	2100bfc0 	addi	zero,t0,-16448
    4d44:	bfc00c58 	cache	0x0,3160(s8)
    4d48:	00000543 	sra	zero,zero,0x15
    4d4c:	000004d8 	0x4d8
    4d50:	01540118 	0x1540118
    4d54:	64190037 	0x64190037
    4d58:	22bfc00c 	addi	ra,s5,-16372
    4d5c:	18000005 	blez	zero,4d74 <_mem_avail_start-0x7fffb28c>
    4d60:	03055401 	0x3055401
    4d64:	bfc0135c 	cache	0x0,4956(s8)
    4d68:	a6220000 	sh	v0,0(s1)
    4d6c:	00000003 	sra	zero,zero,0x0
    4d70:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    4d74:	01000000 	0x1000000
    4d78:	0005079c 	0x5079c
    4d7c:	03b62300 	0x3b62300
    4d80:	52010000 	beql	s0,at,4d84 <_mem_avail_start-0x7fffb27c>
    4d84:	038c2200 	0x38c2200
    4d88:	00000000 	nop
    4d8c:	000c0000 	sll	zero,t4,0x0
    4d90:	9c010000 	0x9c010000
    4d94:	00000522 	0x522
    4d98:	00039c23 	0x39c23
    4d9c:	00520100 	0x520100
    4da0:	001bb024 	and	s6,zero,k1
    4da4:	001bb000 	sll	s6,k1,0x0
    4da8:	240c0600 	li	t4,1536
    4dac:	00001a38 	0x1a38
    4db0:	00001a38 	0x1a38
    4db4:	ef244a04 	swc3	$4,18948(t9)
    4db8:	ef00001b 	swc3	$0,27(t8)
    4dbc:	0600001b 	bltz	s0,4e2c <_mem_avail_start-0x7fffb1d4>
    4dc0:	1ba2240a 	0x1ba2240a
    4dc4:	1ba20000 	0x1ba20000
    4dc8:	4c040000 	mfc3	a0,$0
    4dcc:	001a5224 	0x1a5224
    4dd0:	001a5200 	sll	t2,k0,0x8
    4dd4:	24420400 	addiu	v0,v0,1024
    4dd8:	00001a67 	0x1a67
    4ddc:	00001a67 	0x1a67
    4de0:	8a241507 	lwl	a0,5383(s1)
    4de4:	8a000010 	lwl	zero,16(s0)
    4de8:	08000010 	j	40 <_mem_avail_start-0x7fffffc0>
    4dec:	01c2000a 	movz	zero,t6,v0
    4df0:	00040000 	sll	zero,a0,0x0
    4df4:	000004e4 	0x4e4
    4df8:	1ac70104 	0x1ac70104
    4dfc:	320c0000 	andi	t4,s0,0x0
    4e00:	4100001c 	bc0f	4e74 <_mem_avail_start-0x7fffb18c>
    4e04:	6800001c 	0x6800001c
    4e08:	00000007 	srav	zero,zero,zero
    4e0c:	7e000000 	0x7e000000
    4e10:	02000004 	sllv	zero,zero,s0
    4e14:	07040304 	0x7040304
    4e18:	000006bc 	0x6bc
    4e1c:	b7070403 	0xb7070403
    4e20:	04000006 	bltz	zero,4e3c <_mem_avail_start-0x7fffb1c4>
    4e24:	00001bb0 	tge	zero,zero,0x6e
    4e28:	01850101 	0x1850101
    4e2c:	0e200000 	jal	8800000 <_mem_avail_start-0x77800000>
    4e30:	0224bfc0 	0x224bfc0
    4e34:	9c010000 	0x9c010000
    4e38:	00000185 	0x185
    4e3c:	746d6605 	jalx	1b59814 <_mem_avail_start-0x7e4a67ec>
    4e40:	8c010100 	lw	at,256(zero)
    4e44:	84000001 	lh	zero,1(zero)
    4e48:	06000039 	bltz	s0,4f30 <_mem_avail_start-0x7fffb0d0>
    4e4c:	01006907 	0x1006907
    4e50:	00018503 	sra	s0,at,0x14
    4e54:	0039bb00 	0x39bb00
    4e58:	00630700 	0x630700
    4e5c:	01920401 	0x1920401
    4e60:	3a230000 	xori	v1,s1,0x0
    4e64:	61070000 	0x61070000
    4e68:	01006772 	tlt	t0,zero,0x19d
    4e6c:	00019e05 	0x19e05
    4e70:	003a4100 	0x3a4100
    4e74:	70610800 	0x70610800
    4e78:	25060100 	addiu	a2,t0,256
    4e7c:	02000000 	0x2000000
    4e80:	77076091 	jalx	c1d8244 <_mem_avail_start-0x73e27dbc>
    4e84:	85070100 	lh	a3,256(t0)
    4e88:	5f000001 	bgtzl	t8,4e90 <_mem_avail_start-0x7fffb170>
    4e8c:	0900003a 	j	40000e8 <_mem_avail_start-0x7bffff18>
    4e90:	00001c3b 	0x1c3b
    4e94:	0ea41001 	jal	a904004 <_mem_avail_start-0x756fbffc>
    4e98:	180abfc0 	0x180abfc0
    4e9c:	36000007 	ori	zero,s0,0x7
    4ea0:	0b000001 	j	c000004 <_mem_avail_start-0x73fffffc>
    4ea4:	00001c80 	sll	v1,zero,0x12
    4ea8:	01851401 	0x1851401
    4eac:	00c60000 	0xc60000
    4eb0:	00060000 	sll	zero,a2,0x0
    4eb4:	001c200b 	movn	a0,zero,gp
    4eb8:	85190100 	lh	t9,256(t0)
    4ebc:	d7000001 	ldc1	$f0,1(t8)
    4ec0:	06000000 	bltz	s0,4ec4 <_mem_avail_start-0x7fffb13c>
    4ec4:	1c280b00 	0x1c280b00
    4ec8:	1e010000 	0x1e010000
    4ecc:	00000185 	0x185
    4ed0:	000000e8 	0xe8
    4ed4:	100c0006 	beq	zero,t4,4ef0 <_mem_avail_start-0x7fffb110>
    4ed8:	a4bfc00f 	sh	ra,-16369(a1)
    4edc:	0c000001 	jal	4 <_mem_avail_start-0x7ffffffc>
    4ee0:	bfc00f6c 	cache	0x0,3948(s8)
    4ee4:	000001af 	0x1af
    4ee8:	c00f900c 	ll	t7,-28660(zero)
    4eec:	0001babf 	0x1babf
    4ef0:	0fac0c00 	jal	eb03000 <_mem_avail_start-0x714fd000>
    4ef4:	01babfc0 	0x1babfc0
    4ef8:	c40d0000 	lwc1	$f13,0(zero)
    4efc:	babfc00f 	swr	ra,-16369(s5)
    4f00:	25000001 	addiu	zero,t0,1
    4f04:	0e000001 	jal	8000004 <_mem_avail_start-0x77fffffc>
    4f08:	83025601 	lb	v0,22017(t8)
    4f0c:	57010e00 	bnel	t8,at,8710 <_mem_avail_start-0x7fff78f0>
    4f10:	0f003001 	jal	c00c004 <_mem_avail_start-0x73ff3ffc>
    4f14:	bfc00ff0 	cache	0x0,4080(s8)
    4f18:	000001a4 	0x1a4
    4f1c:	0254010e 	0x254010e
    4f20:	00002508 	0x2508
    4f24:	0006f810 	0x6f810
    4f28:	1c200b00 	bgtz	at,7b2c <_mem_avail_start-0x7fff84d4>
    4f2c:	19010000 	0x19010000
    4f30:	00000185 	0x185
    4f34:	0000014c 	syscall	0x5
    4f38:	34110006 	li	s1,0x6
    4f3c:	08bfc010 	j	2ff0040 <_mem_avail_start-0x7d00ffc0>
    4f40:	7a000000 	0x7a000000
    4f44:	0b000001 	j	c000004 <_mem_avail_start-0x73fffffc>
    4f48:	00001c20 	0x1c20
    4f4c:	01851901 	0x1851901
    4f50:	016a0000 	0x16a0000
    4f54:	00060000 	sll	zero,a2,0x0
    4f58:	c0103c0f 	ll	s0,15375(zero)
    4f5c:	0001a4bf 	0x1a4bf
    4f60:	54010e00 	bnel	zero,at,8764 <_mem_avail_start-0x7fff789c>
    4f64:	00003d01 	0x3d01
    4f68:	c00ee80c 	ll	t6,-6132(zero)
    4f6c:	0001a4bf 	0x1a4bf
    4f70:	12000000 	beqz	s0,4f74 <_mem_avail_start-0x7fffb08c>
    4f74:	6e690504 	0x6e690504
    4f78:	04130074 	bgezall	zero,514c <_mem_avail_start-0x7fffaeb4>
    4f7c:	00000199 	0x199
    4f80:	dc060103 	ldc3	$6,259(zero)
    4f84:	1400000e 	bnez	zero,4fc0 <_mem_avail_start-0x7fffb040>
    4f88:	00000192 	0x192
    4f8c:	00250413 	0x250413
    4f90:	20150000 	addi	s5,zero,0
    4f94:	2000001c 	addi	zero,zero,28
    4f98:	0100001c 	0x100001c
    4f9c:	1c801519 	bgtz	a0,a404 <_mem_avail_start-0x7fff5bfc>
    4fa0:	1c800000 	bgtz	a0,4fa4 <_mem_avail_start-0x7fffb05c>
    4fa4:	14010000 	bne	zero,at,4fa8 <_mem_avail_start-0x7fffb058>
    4fa8:	001c2815 	0x1c2815
    4fac:	001c2800 	sll	a1,gp,0x0
    4fb0:	001e0100 	sll	zero,s8,0x4
    4fb4:	0000014a 	0x14a
    4fb8:	05ee0004 	tnei	t7,4
    4fbc:	01040000 	0x1040000
    4fc0:	00001ac7 	0x1ac7
    4fc4:	001c900c 	syscall	0x7240
    4fc8:	001c4100 	sll	t0,gp,0x4
    4fcc:	00077800 	sll	t7,a3,0x0
    4fd0:	00000000 	nop
    4fd4:	00052c00 	sll	a1,a1,0x10
    4fd8:	07040200 	0x7040200
    4fdc:	000006bc 	0x6bc
    4fe0:	b7070402 	0xb7070402
    4fe4:	03000006 	srlv	zero,zero,t8
    4fe8:	00001c28 	0x1c28
    4fec:	011d0101 	0x11d0101
    4ff0:	10440000 	beq	v0,a0,4ff4 <_mem_avail_start-0x7fffb00c>
    4ff4:	00d8bfc0 	0xd8bfc0
    4ff8:	9c010000 	0x9c010000
    4ffc:	0000011d 	0x11d
    5000:	01007604 	0x1007604
    5004:	00012401 	0x12401
    5008:	003aca00 	0x3aca00
    500c:	00770400 	0x770400
    5010:	011d0101 	0x11d0101
    5014:	3b120000 	xori	s2,t8,0x0
    5018:	c6050000 	lwc1	$f5,0(s0)
    501c:	0100001b 	divu	zero,t0,zero
    5020:	00011d01 	0x11d01
    5024:	003b6200 	0x3b6200
    5028:	1c9c0500 	0x1c9c0500
    502c:	01010000 	0x1010000
    5030:	0000011d 	0x11d
    5034:	00003ba4 	0x3ba4
    5038:	01006906 	0x1006906
    503c:	00011d03 	sra	v1,at,0x14
    5040:	003bde00 	0x3bde00
    5044:	006a0600 	0x6a0600
    5048:	011d0301 	0x11d0301
    504c:	3c070000 	lui	a3,0x0
    5050:	63060000 	0x63060000
    5054:	1d040100 	0x1d040100
    5058:	56000001 	bnezl	s0,5060 <_mem_avail_start-0x7fffafa0>
    505c:	0700003c 	bltz	t8,5150 <_mem_avail_start-0x7fffaeb0>
    5060:	00667562 	0x667562
    5064:	012b0501 	0x12b0501
    5068:	91030000 	lbu	v1,0(t0)
    506c:	8a087fa8 	lwl	t0,32680(s0)
    5070:	0100001c 	0x100001c
    5074:	00002c06 	0x2c06
    5078:	003c6900 	0x3c6900
    507c:	10740900 	beq	v1,s4,7480 <_mem_avail_start-0x7fff8b80>
    5080:	0010bfc0 	sll	s7,s0,0x1f
    5084:	00f80000 	0xf80000
    5088:	200a0000 	addi	t2,zero,0
    508c:	0100001c 	0x100001c
    5090:	00011d0a 	0x11d0a
    5094:	0000e700 	sll	gp,zero,0x1c
    5098:	0c000b00 	jal	2c00 <_mem_avail_start-0x7fffd400>
    509c:	bfc01080 	cache	0x0,4224(s8)
    50a0:	00000142 	srl	zero,zero,0x5
    50a4:	0254010d 	break	0x254,0x4
    50a8:	00002d08 	0x2d08
    50ac:	c010ec0e 	ll	s0,-5106(zero)
    50b0:	000030bf 	0x30bf
    50b4:	1c200a00 	bgtz	at,78b8 <_mem_avail_start-0x7fff8748>
    50b8:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    50bc:	0000011d 	0x11d
    50c0:	00000112 	0x112
    50c4:	140f000b 	bne	zero,t7,50f4 <_mem_avail_start-0x7fffaf0c>
    50c8:	42bfc011 	c0	0xbfc011
    50cc:	00000001 	movf	zero,zero,$fcc0
    50d0:	05041000 	0x5041000
    50d4:	00746e69 	0x746e69
    50d8:	dd050402 	ldc3	$5,1026(t0)
    50dc:	1100001b 	beqz	t0,514c <_mem_avail_start-0x7fffaeb4>
    50e0:	0000013b 	0x13b
    50e4:	0000013b 	0x13b
    50e8:	00002512 	0x2512
    50ec:	02003f00 	0x2003f00
    50f0:	0edc0601 	jal	b701804 <_mem_avail_start-0x748fe7fc>
    50f4:	20130000 	addi	s3,zero,0
    50f8:	2000001c 	addi	zero,zero,28
    50fc:	0100001c 	0x100001c
    5100:	0416000a 	0x416000a
    5104:	00040000 	sll	zero,a0,0x0
    5108:	000006f0 	tge	zero,zero,0x1b
    510c:	1ac70104 	0x1ac70104
    5110:	af0c0000 	sw	t4,0(t8)
    5114:	4100001c 	bc0f	5188 <_mem_avail_start-0x7fffae78>
    5118:	8800001c 	lwl	zero,28(zero)
    511c:	00000007 	srav	zero,zero,zero
    5120:	a6000000 	sh	zero,0(s0)
    5124:	02000005 	0x2000005
    5128:	07040304 	0x7040304
    512c:	000006bc 	0x6bc
    5130:	b7070403 	0xb7070403
    5134:	04000006 	bltz	zero,5150 <_mem_avail_start-0x7fffaeb0>
    5138:	00001cb8 	0x1cb8
    513c:	00271002 	ror	v0,a3,0x0
    5140:	a9050000 	swl	a1,0(t0)
    5144:	0100001c 	0x100001c
    5148:	00000172 	tlt	zero,zero,0x5
    514c:	000c0000 	sll	zero,t4,0x0
    5150:	9c010000 	0x9c010000
    5154:	0000008e 	0x8e
    5158:	01007306 	0x1007306
    515c:	00250172 	tlt	at,a1,0x5
    5160:	54010000 	bnel	zero,at,5164 <_mem_avail_start-0x7fffae9c>
    5164:	01006e07 	0x1006e07
    5168:	00350172 	tlt	at,s5,0x5
    516c:	3c9d0000 	0x3c9d0000
    5170:	00080000 	sll	zero,t0,0x0
    5174:	dd000000 	ldc3	$0,0(t0)
    5178:	09000001 	j	4000004 <_mem_avail_start-0x7bfffffc>
    517c:	74025401 	jalx	95004 <_mem_avail_start-0x7ff6affc>
    5180:	55010900 	bnel	t0,at,7584 <_mem_avail_start-0x7fff8a7c>
    5184:	09007502 	j	401d408 <_mem_avail_start-0x7bfe2bf8>
    5188:	f3035601 	0xf3035601
    518c:	00005501 	0x5501
    5190:	001cbf0a 	0x1cbf0a
    5194:	01660100 	0x1660100
    5198:	000000ef 	0xef
    519c:	00000000 	nop
    51a0:	00000040 	ssnop
    51a4:	00ef9c01 	0xef9c01
    51a8:	76070000 	jalx	81c0000 <_mem_avail_start-0x77e40000>
    51ac:	66010031 	0x66010031
    51b0:	0000f601 	0xf601
    51b4:	003cc900 	0x3cc900
    51b8:	32760700 	andi	s6,s3,0x700
    51bc:	01660100 	0x1660100
    51c0:	000000f6 	tne	zero,zero,0x3
    51c4:	00003cea 	0x3cea
    51c8:	01006e07 	0x1006e07
    51cc:	00350166 	0x350166
    51d0:	3d0b0000 	0x3d0b0000
    51d4:	730b0000 	madd	t8,t3
    51d8:	67010031 	0x67010031
    51dc:	0000fd01 	0xfd01
    51e0:	0b540100 	j	d500400 <_mem_avail_start-0x72affc00>
    51e4:	01003273 	tltu	t0,zero,0xc9
    51e8:	00fd0168 	0xfd0168
    51ec:	55010000 	bnel	t0,at,51f0 <_mem_avail_start-0x7fffae10>
    51f0:	05040c00 	0x5040c00
    51f4:	00746e69 	0x746e69
    51f8:	00fc040d 	break	0xfc,0x10
    51fc:	0d0e0000 	jal	4380000 <_mem_avail_start-0x7bc80000>
    5200:	00010a04 	0x10a04
    5204:	06010300 	bgez	s0,5e08 <_mem_avail_start-0x7fffa1f8>
    5208:	00000edc 	0xedc
    520c:	0001030f 	0x1030f
    5210:	1ca10a00 	0x1ca10a00
    5214:	43010000 	c0	0x1010000
    5218:	00002501 	0x2501
    521c:	00000000 	nop
    5220:	00007000 	sll	t6,zero,0x0
    5224:	749c0100 	jalx	2700400 <_mem_avail_start-0x7d8ffc00>
    5228:	07000001 	bltz	t8,5230 <_mem_avail_start-0x7fffadd0>
    522c:	00747364 	0x747364
    5230:	25014301 	addiu	at,t0,17153
    5234:	2e000000 	sltiu	zero,s0,0
    5238:	0700003d 	bltz	t8,5330 <_mem_avail_start-0x7fffacd0>
    523c:	00637273 	tltu	v1,v1,0x1c9
    5240:	f6014301 	sdc1	$f1,17153(s0)
    5244:	4c000000 	mfc3	zero,$0
    5248:	0700003d 	bltz	t8,5340 <_mem_avail_start-0x7fffacc0>
    524c:	4301006e 	c0	0x101006e
    5250:	00003501 	0x3501
    5254:	003d8600 	0x3d8600
    5258:	00731000 	0x731000
    525c:	fd014701 	sdc3	$1,18177(t0)
    5260:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    5264:	1000003e 	b	5360 <_mem_avail_start-0x7fffaca0>
    5268:	48010064 	0x48010064
    526c:	00017401 	0x17401
    5270:	003e3300 	0x3e3300
    5274:	040d0000 	0x40d0000
    5278:	00000103 	sra	zero,zero,0x4
    527c:	001ceb0a 	0x1ceb0a
    5280:	012c0100 	0x12c0100
    5284:	00000025 	move	zero,zero
    5288:	00000000 	nop
    528c:	0000002c 	0x2c
    5290:	01dd9c01 	0x1dd9c01
    5294:	64070000 	0x64070000
    5298:	01007473 	tltu	t0,zero,0x1d1
    529c:	0025012c 	0x25012c
    52a0:	3e880000 	0x3e880000
    52a4:	73070000 	madd	t8,a3
    52a8:	01006372 	tlt	t0,zero,0x18d
    52ac:	00f6012c 	0xf6012c
    52b0:	3ea60000 	0x3ea60000
    52b4:	6e070000 	0x6e070000
    52b8:	012c0100 	0x12c0100
    52bc:	00000035 	0x35
    52c0:	00003ec7 	0x3ec7
    52c4:	0100730b 	0x100730b
    52c8:	00fd0130 	tge	a3,sp,0x4
    52cc:	55010000 	bnel	t0,at,52d0 <_mem_avail_start-0x7fffad30>
    52d0:	01006410 	0x1006410
    52d4:	01740131 	tgeu	t3,s4,0x4
    52d8:	3f110000 	0x3f110000
    52dc:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    52e0:	00001a67 	0x1a67
    52e4:	25011101 	addiu	at,t0,4353
    52e8:	1c000000 	bgtz	zero,52ec <_mem_avail_start-0x7fffad14>
    52ec:	24bfc011 	addiu	ra,a1,-16367
    52f0:	01000000 	0x1000000
    52f4:	00022e9c 	0x22e9c
    52f8:	00730700 	0x730700
    52fc:	25011101 	addiu	at,t0,4353
    5300:	2f000000 	sltiu	zero,t8,0
    5304:	0600003f 	bltz	s0,5404 <_mem_avail_start-0x7fffabfc>
    5308:	11010063 	beq	t0,at,5498 <_mem_avail_start-0x7fffab68>
    530c:	00010301 	0x10301
    5310:	07550100 	0x7550100
    5314:	1101006e 	beq	t0,at,54d0 <_mem_avail_start-0x7fffab30>
    5318:	00003501 	0x3501
    531c:	003f4d00 	0x3f4d00
    5320:	00701000 	0x701000
    5324:	74011501 	jalx	45404 <_mem_avail_start-0x7ffbabfc>
    5328:	97000001 	lhu	zero,1(t8)
    532c:	0000003f 	0x3f
    5330:	001d0111 	0x1d0111
    5334:	74a30100 	jalx	28c0400 <_mem_avail_start-0x7d73fc00>
    5338:	00000001 	movf	zero,zero,$fcc0
    533c:	28000000 	slti	zero,zero,0
    5340:	01000000 	0x1000000
    5344:	0002609c 	0x2609c
    5348:	00731200 	0x731200
    534c:	00fda301 	0xfda301
    5350:	3fb50000 	0x3fb50000
    5354:	63130000 	0x63130000
    5358:	03a30100 	0x3a30100
    535c:	01000001 	movf	zero,t0,$fcc0
    5360:	d6110055 	ldc1	$f17,85(s0)
    5364:	0100001c 	0x100001c
    5368:	0001748f 	0x1748f
    536c:	00000000 	nop
    5370:	00002c00 	sll	a1,zero,0x10
    5374:	929c0100 	lbu	gp,256(s4)
    5378:	12000002 	beqz	s0,5384 <_mem_avail_start-0x7fffac7c>
    537c:	8f010073 	lw	at,115(t8)
    5380:	000000fd 	0xfd
    5384:	00003fd3 	0x3fd3
    5388:	01006313 	0x1006313
    538c:	0001038f 	0x1038f
    5390:	00550100 	0x550100
    5394:	001cf911 	0x1cf911
    5398:	ef7f0100 	swc3	$31,256(k1)
    539c:	00000000 	nop
    53a0:	44000000 	mfc1	zero,$f0
    53a4:	01000000 	0x1000000
    53a8:	0002d59c 	0x2d59c
    53ac:	31731200 	andi	s3,t3,0x1200
    53b0:	fd7f0100 	sdc3	$31,256(t3)
    53b4:	fc000000 	sdc3	$0,0(zero)
    53b8:	1200003f 	beqz	s0,54b8 <_mem_avail_start-0x7fffab48>
    53bc:	01003273 	tltu	t0,zero,0xc9
    53c0:	0000fd7f 	0xfd7f
    53c4:	00401a00 	0x401a00
    53c8:	006e1200 	0x6e1200
    53cc:	00357f01 	0x357f01
    53d0:	40380000 	0x40380000
    53d4:	11000000 	beqz	t0,53d8 <_mem_avail_start-0x7fffac28>
    53d8:	00001ce4 	0x1ce4
    53dc:	00ef6801 	0xef6801
    53e0:	00000000 	nop
    53e4:	00300000 	0x300000
    53e8:	9c010000 	0x9c010000
    53ec:	0000030b 	0x30b
    53f0:	00317312 	0x317312
    53f4:	00fd6801 	movt	t5,a3,$fcc7
    53f8:	40770000 	0x40770000
    53fc:	73120000 	madd	t8,s2
    5400:	68010032 	0x68010032
    5404:	000000fd 	0xfd
    5408:	00004095 	0x4095
    540c:	1cc61100 	0x1cc61100
    5410:	4d010000 	bc3t	5414 <_mem_avail_start-0x7fffabec>
    5414:	00000174 	teq	zero,zero,0x5
    5418:	00000000 	nop
    541c:	00000034 	teq	zero,zero
    5420:	035f9c01 	0x35f9c01
    5424:	64120000 	0x64120000
    5428:	01007473 	tltu	t0,zero,0x1d1
    542c:	0001744d 	break	0x1,0x1d1
    5430:	0040b300 	0x40b300
    5434:	72731200 	0x72731200
    5438:	4d010063 	bc3t	55c8 <_mem_avail_start-0x7fffaa38>
    543c:	000000fd 	0xfd
    5440:	000040d1 	0x40d1
    5444:	6e656c12 	0x6e656c12
    5448:	354d0100 	ori	t5,t2,0x100
    544c:	ef000000 	swc3	$0,0(t8)
    5450:	14000040 	bnez	zero,5554 <_mem_avail_start-0x7fffaaac>
    5454:	4e010070 	c3	0x10070
    5458:	00000174 	teq	zero,zero,0x5
    545c:	00004124 	0x4124
    5460:	1cdd1100 	0x1cdd1100
    5464:	37010000 	ori	at,t8,0x0
    5468:	00000174 	teq	zero,zero,0x5
    546c:	00000000 	nop
    5470:	00000024 	and	zero,zero,zero
    5474:	03a49c01 	0x3a49c01
    5478:	64120000 	0x64120000
    547c:	01007473 	tltu	t0,zero,0x1d1
    5480:	00017437 	0x17437
    5484:	00414200 	0x414200
    5488:	72731200 	0x72731200
    548c:	37010063 	ori	at,t8,0x63
    5490:	000000fd 	0xfd
    5494:	00004160 	0x4160
    5498:	01007014 	0x1007014
    549c:	0001743b 	0x1743b
    54a0:	00417e00 	0x417e00
    54a4:	ce110000 	pref	0x11,0(s0)
    54a8:	0100001c 	0x100001c
    54ac:	00003522 	0x3522
    54b0:	00000000 	nop
    54b4:	00002800 	sll	a1,zero,0x0
    54b8:	e79c0100 	swc1	$f28,256(gp)
    54bc:	12000003 	beqz	s0,54cc <_mem_avail_start-0x7fffab34>
    54c0:	22010073 	addi	at,s0,115
    54c4:	000000fd 	0xfd
    54c8:	0000419c 	0x419c
    54cc:	6e656c13 	0x6e656c13
    54d0:	35220100 	ori	v0,t1,0x100
    54d4:	01000000 	0x1000000
    54d8:	6e631455 	0x6e631455
    54dc:	23010074 	addi	at,t8,116
    54e0:	00000035 	0x35
    54e4:	000041e1 	0x41e1
    54e8:	1cf21500 	0x1cf21500
    54ec:	0c010000 	jal	40000 <_mem_avail_start-0x7ffc0000>
    54f0:	00000035 	0x35
    54f4:	00000000 	nop
    54f8:	00000020 	add	zero,zero,zero
    54fc:	73129c01 	0x73129c01
    5500:	fd0c0100 	sdc3	$12,256(t0)
    5504:	00000000 	nop
    5508:	14000042 	bnez	zero,5614 <_mem_avail_start-0x7fffa9ec>
    550c:	00746e63 	0x746e63
    5510:	00350d01 	0x350d01
    5514:	421e0000 	c0	0x1e0000
    5518:	00000000 	nop
    551c:	0000014c 	syscall	0x5
    5520:	08320004 	j	c80010 <_mem_avail_start-0x7f37fff0>
    5524:	01040000 	0x1040000
    5528:	00001ac7 	0x1ac7
    552c:	001d090c 	syscall	0x7424
    5530:	001c4100 	sll	t0,gp,0x4
    5534:	00081000 	sll	v0,t0,0x0
    5538:	00000000 	nop
    553c:	00072300 	sll	a0,a3,0xc
    5540:	07040200 	0x7040200
    5544:	000006bc 	0x6bc
    5548:	b7070402 	0xb7070402
    554c:	03000006 	srlv	zero,zero,t8
    5550:	00001bef 	0x1bef
    5554:	00a20e01 	0xa20e01
    5558:	11a00000 	beqz	t5,555c <_mem_avail_start-0x7fffaaa4>
    555c:	0030bfc0 	0x30bfc0
    5560:	9c010000 	0x9c010000
    5564:	000000a2 	0xa2
    5568:	01007304 	0x1007304
    556c:	0000a90e 	0xa90e
    5570:	00423d00 	0x423d00
    5574:	1c200500 	bgtz	at,6978 <_mem_avail_start-0x7fff9688>
    5578:	07010000 	bgez	t8,557c <_mem_avail_start-0x7fffaa84>
    557c:	000000a2 	0xa2
    5580:	0000006a 	0x6a
    5584:	b0070006 	0xb0070006
    5588:	bbbfc011 	swr	ra,-16367(sp)
    558c:	7f000000 	0x7f000000
    5590:	08000000 	j	0 <_mem_avail_start-0x80000000>
    5594:	f3035401 	0xf3035401
    5598:	07005401 	bltz	t8,1a5a0 <_mem_avail_start-0x7ffe5a60>
    559c:	bfc011b8 	cache	0x0,4536(s8)
    55a0:	00000144 	0x144
    55a4:	00000092 	0x92
    55a8:	01540108 	0x1540108
    55ac:	c009003d 	ll	t1,61(zero)
    55b0:	44bfc011 	0x44bfc011
    55b4:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    55b8:	3a015401 	xori	at,s0,0x5401
    55bc:	040a0000 	tlti	zero,0
    55c0:	746e6905 	jalx	1b9a414 <_mem_avail_start-0x7e465bec>
    55c4:	b6040b00 	0xb6040b00
    55c8:	02000000 	0x2000000
    55cc:	0edc0601 	jal	b701804 <_mem_avail_start-0x748fe7fc>
    55d0:	af0c0000 	sw	t4,0(t8)
    55d4:	03000000 	0x3000000
    55d8:	00001c80 	sll	v1,zero,0x12
    55dc:	00a20101 	0xa20101
    55e0:	11400000 	beqz	t2,55e4 <_mem_avail_start-0x7fffaa1c>
    55e4:	0060bfc0 	0x60bfc0
    55e8:	9c010000 	0x9c010000
    55ec:	00000144 	0x144
    55f0:	01007304 	0x1007304
    55f4:	0000a901 	0xa901
    55f8:	00425e00 	0x425e00
    55fc:	00630d00 	0x630d00
    5600:	00af0301 	0xaf0301
    5604:	42870000 	c0	0x870000
    5608:	f80e0000 	sdc2	$14,0(zero)
    560c:	05000007 	bltz	t0,562c <_mem_avail_start-0x7fffa9d4>
    5610:	00001c20 	0x1c20
    5614:	00a20701 	0xa20701
    5618:	01040000 	0x1040000
    561c:	00060000 	sll	zero,a2,0x0
    5620:	c011880f 	ll	s1,-30705(zero)
    5624:	000008bf 	0x8bf
    5628:	00013200 	sll	a2,at,0x8
    562c:	1c200500 	bgtz	at,6a30 <_mem_avail_start-0x7fff95d0>
    5630:	07010000 	bgez	t8,5634 <_mem_avail_start-0x7fffa9cc>
    5634:	000000a2 	0xa2
    5638:	00000122 	0x122
    563c:	90090006 	lbu	t1,6(zero)
    5640:	44bfc011 	0x44bfc011
    5644:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    5648:	3d015401 	0x3d015401
    564c:	98090000 	lwr	t1,0(zero)
    5650:	44bfc011 	0x44bfc011
    5654:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    5658:	80025401 	lb	v0,21505(zero)
    565c:	00000000 	nop
    5660:	001c2010 	0x1c2010
    5664:	001c2000 	sll	a0,gp,0x0
    5668:	00070100 	sll	zero,a3,0x4
    566c:	000000b2 	tlt	zero,zero,0x2
    5670:	09050004 	j	4140010 <_mem_avail_start-0x7bebfff0>
    5674:	01040000 	0x1040000
    5678:	00001ac7 	0x1ac7
    567c:	001d1d0c 	syscall	0x7474
    5680:	001c4100 	sll	t0,gp,0x4
    5684:	00082800 	sll	a1,t0,0x0
    5688:	00000000 	nop
    568c:	00077600 	sll	t6,a3,0x18
    5690:	07040200 	0x7040200
    5694:	000006bc 	0x6bc
    5698:	b7070402 	0xb7070402
    569c:	02000006 	srlv	zero,zero,s0
    56a0:	0ed50601 	jal	b541804 <_mem_avail_start-0x74abe7fc>
    56a4:	02020000 	0x2020000
    56a8:	001bb705 	0x1bb705
    56ac:	05040300 	0x5040300
    56b0:	00746e69 	0x746e69
    56b4:	dd050402 	ldc3	$5,1026(t0)
    56b8:	0400001b 	bltz	zero,5728 <_mem_avail_start-0x7fffa8d8>
    56bc:	00001ab4 	teq	zero,zero,0x6a
    56c0:	005a0902 	0x5a0902
    56c4:	01020000 	0x1020000
    56c8:	000ed308 	0xed308
    56cc:	07020200 	bltzl	t8,5ed0 <_mem_avail_start-0x7fffa130>
    56d0:	00000729 	0x729
    56d4:	001a4204 	0x1a4204
    56d8:	4f0b0300 	c3	0x10b0300
    56dc:	05000000 	bltz	t0,56e0 <_mem_avail_start-0x7fffa920>
    56e0:	00001c20 	0x1c20
    56e4:	00410301 	0x410301
    56e8:	11d00000 	beq	t6,s0,56ec <_mem_avail_start-0x7fffa914>
    56ec:	002cbfc0 	0x2cbfc0
    56f0:	9c010000 	0x9c010000
    56f4:	000000aa 	0xaa
    56f8:	01006306 	0x1006306
    56fc:	00004103 	sra	t0,zero,0x4
    5700:	0042a500 	0x42a500
    5704:	11e80700 	beq	t7,t0,7308 <_mem_avail_start-0x7fff8cf8>
    5708:	00aabfc0 	0xaabfc0
    570c:	01080000 	0x1080000
    5710:	00800254 	0x800254
    5714:	10090000 	beq	zero,t1,5718 <_mem_avail_start-0x7fffa8e8>
    5718:	1000001d 	b	5790 <_mem_avail_start-0x7fffa870>
    571c:	0300001d 	0x300001d
    5720:	0b3b0046 	j	cec0118 <_mem_avail_start-0x7313fee8>
    5724:	00040000 	sll	zero,a0,0x0
    5728:	0000098f 	0x98f
    572c:	13610104 	beq	k1,at,5b40 <_mem_avail_start-0x7fffa4c0>
    5730:	58040000 	0x58040000
    5734:	4100001e 	bc0f	57b0 <_mem_avail_start-0x7fffa850>
    5738:	5000001c 	beqzl	zero,57ac <_mem_avail_start-0x7fffa854>
    573c:	00000008 	jr	zero
    5740:	d3000000 	0xd3000000
    5744:	02000007 	srav	zero,zero,s0
    5748:	07040304 	0x7040304
    574c:	000006bc 	0x6bc
    5750:	00002704 	0x2704
    5754:	07040300 	0x7040300
    5758:	000006b7 	0x6b7
    575c:	00003304 	0x3304
    5760:	1bd40500 	0x1bd40500
    5764:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
    5768:	00000027 	nor	zero,zero,zero
    576c:	d5060103 	ldc1	$f6,259(t0)
    5770:	0300000e 	0x300000e
    5774:	1bb70502 	0x1bb70502
    5778:	04060000 	0x4060000
    577c:	746e6905 	jalx	1b9a414 <_mem_avail_start-0x7e465bec>
    5780:	05040300 	0x5040300
    5784:	00001bdd 	0x1bdd
    5788:	001ab405 	0x1ab405
    578c:	71090300 	0x71090300
    5790:	03000000 	0x3000000
    5794:	0ed30801 	jal	b4c2004 <_mem_avail_start-0x74b3dffc>
    5798:	71040000 	madd	t0,a0
    579c:	05000000 	bltz	t0,57a0 <_mem_avail_start-0x7fffa860>
    57a0:	00001bcb 	0x1bcb
    57a4:	00880a03 	0x880a03
    57a8:	02030000 	0x2030000
    57ac:	00072907 	0x72907
    57b0:	00880400 	0x880400
    57b4:	7c050000 	0x7c050000
    57b8:	0300001d 	0x300001d
    57bc:	0000330c 	syscall	0xcc
    57c0:	1a420500 	0x1a420500
    57c4:	0b040000 	j	c100000 <_mem_avail_start-0x73f00000>
    57c8:	00000066 	0x66
    57cc:	001ee205 	0x1ee205
    57d0:	7d0c0400 	0x7d0c0400
    57d4:	05000000 	bltz	t0,57d8 <_mem_avail_start-0x7fffa828>
    57d8:	00001e14 	0x1e14
    57dc:	003f0d04 	0x3f0d04
    57e0:	13050000 	beq	t8,a1,57e4 <_mem_avail_start-0x7fffa81c>
    57e4:	0400001e 	bltz	zero,5860 <_mem_avail_start-0x7fffa7a0>
    57e8:	0000940e 	0x940e
    57ec:	1dc50700 	0x1dc50700
    57f0:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    57f4:	00001da5 	0x1da5
    57f8:	00010401 	0x10401
    57fc:	00540800 	0x540800
    5800:	00000033 	tltu	zero,zero
    5804:	0019e809 	0x19e809
    5808:	250a0100 	addiu	t2,t0,256
    580c:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    5810:	00001d5d 	0x1d5d
    5814:	00330a01 	0x330a01
    5818:	700a0000 	madd	zero,t2
    581c:	01007274 	teq	t0,zero,0x1c9
    5820:	0001040b 	0x1040b
    5824:	040b0000 	tltiu	zero,0
    5828:	0000003a 	0x3a
    582c:	001ef407 	0x1ef407
    5830:	330a0100 	andi	t2,t8,0x100
    5834:	0100001d 	0x100001d
    5838:	00000143 	sra	zero,zero,0x5
    583c:	27005408 	addiu	zero,t8,21512
    5840:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    5844:	000019e8 	0x19e8
    5848:	00250a01 	0x250a01
    584c:	5d090000 	0x5d090000
    5850:	0100001d 	0x100001d
    5854:	0000270a 	0x270a
    5858:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    585c:	0b010072 	j	c0401c8 <_mem_avail_start-0x73fbfe38>
    5860:	00000143 	sra	zero,zero,0x5
    5864:	2e040b00 	sltiu	a0,s0,2816
    5868:	07000000 	bltz	t8,586c <_mem_avail_start-0x7fffa794>
    586c:	00001e2a 	0x1e2a
    5870:	1e930a01 	0x1e930a01
    5874:	82010000 	lb	at,0(s0)
    5878:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    587c:	00880054 	0x880054
    5880:	e8090000 	swc2	$9,0(zero)
    5884:	01000019 	multu	t0,zero
    5888:	0000250a 	0x250a
    588c:	1d5d0900 	0x1d5d0900
    5890:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    5894:	00000088 	0x88
    5898:	7274700a 	0x7274700a
    589c:	820b0100 	lb	t3,256(s0)
    58a0:	00000001 	movf	zero,zero,$fcc0
    58a4:	008f040b 	0x8f040b
    58a8:	85070000 	lh	a3,0(t0)
    58ac:	0100001d 	0x100001d
    58b0:	001e6f0a 	0x1e6f0a
    58b4:	01c10100 	0x1c10100
    58b8:	54080000 	bnel	zero,t0,58bc <_mem_avail_start-0x7fffa744>
    58bc:	00007100 	sll	t6,zero,0x4
    58c0:	19e80900 	0x19e80900
    58c4:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    58c8:	00000025 	move	zero,zero
    58cc:	001d5d09 	0x1d5d09
    58d0:	710a0100 	0x710a0100
    58d4:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    58d8:	00727470 	tge	v1,s2,0x1d1
    58dc:	01c10b01 	0x1c10b01
    58e0:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
    58e4:	00007804 	sllv	t7,zero,zero
    58e8:	1dea0c00 	0x1dea0c00
    58ec:	04010000 	b	58f0 <_mem_avail_start-0x7fffa710>
    58f0:	00001d6d 	0x1d6d
    58f4:	00000033 	tltu	zero,zero
    58f8:	0001f901 	0x1f901
    58fc:	00540800 	0x540800
    5900:	00000033 	tltu	zero,zero
    5904:	0019e809 	0x19e809
    5908:	25040100 	addiu	a0,t0,256
    590c:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    5910:	00727470 	tge	v1,s2,0x1d1
    5914:	01040501 	0x1040501
    5918:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    591c:	00001e80 	sll	v1,zero,0x1a
    5920:	1ea40401 	0x1ea40401
    5924:	00270000 	0x270000
    5928:	2b010000 	slti	at,t8,0
    592c:	08000002 	j	8 <_mem_avail_start-0x7ffffff8>
    5930:	00270054 	0x270054
    5934:	e8090000 	swc2	$9,0(zero)
    5938:	01000019 	multu	t0,zero
    593c:	00002504 	0x2504
    5940:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    5944:	05010072 	bgez	t0,5b10 <_mem_avail_start-0x7fffa4f0>
    5948:	00000143 	sra	zero,zero,0x5
    594c:	1ec90c00 	0x1ec90c00
    5950:	04010000 	b	5954 <_mem_avail_start-0x7fffa6ac>
    5954:	00001db6 	tne	zero,zero,0x76
    5958:	00000088 	0x88
    595c:	00025d01 	0x25d01
    5960:	00540800 	0x540800
    5964:	00000088 	0x88
    5968:	0019e809 	0x19e809
    596c:	25040100 	addiu	a0,t0,256
    5970:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    5974:	00727470 	tge	v1,s2,0x1d1
    5978:	01820501 	0x1820501
    597c:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    5980:	00001e44 	0x1e44
    5984:	1e1b0401 	0x1e1b0401
    5988:	00710000 	0x710000
    598c:	8f010000 	lw	at,0(t8)
    5990:	08000002 	j	8 <_mem_avail_start-0x7ffffff8>
    5994:	00710054 	0x710054
    5998:	e8090000 	swc2	$9,0(zero)
    599c:	01000019 	multu	t0,zero
    59a0:	00002504 	0x2504
    59a4:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    59a8:	05010072 	bgez	t0,5b74 <_mem_avail_start-0x7fffa48c>
    59ac:	000001c1 	0x1c1
    59b0:	1d440d00 	0x1d440d00
    59b4:	4a010000 	c2	0x10000
    59b8:	000000b5 	0xb5
    59bc:	00000000 	nop
    59c0:	00000014 	0x14
    59c4:	02ef9c01 	0x2ef9c01
    59c8:	380e0000 	xori	t6,zero,0x0
    59cc:	00000009 	jalr	zero,zero
    59d0:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    59d4:	01000000 	0x1000000
    59d8:	09480f4b 	j	5203d2c <_mem_avail_start-0x7adfc2d4>
    59dc:	42ce0000 	c0	0xce0000
    59e0:	f90e0000 	sdc2	$14,0(t0)
    59e4:	00000001 	movf	zero,zero,$fcc0
    59e8:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    59ec:	01000000 	0x1000000
    59f0:	02140f1c 	0x2140f1c
    59f4:	42ce0000 	c0	0xce0000
    59f8:	00100000 	sll	zero,s0,0x0
    59fc:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    5a00:	11000000 	beqz	t0,5a04 <_mem_avail_start-0x7fffa5fc>
    5a04:	0000021f 	0x21f
    5a08:	ffc3e0a0 	sdc3	$3,-8032(s8)
    5a0c:	0000007b 	0x7b
    5a10:	1ba21200 	0x1ba21200
    5a14:	46010000 	add.s	$f0,$f0,$f1
    5a18:	bfc01268 	cache	0x0,4712(s8)
    5a1c:	00000014 	0x14
    5a20:	036a9c01 	0x36a9c01
    5a24:	5d130000 	0x5d130000
    5a28:	0100001d 	0x100001d
    5a2c:	0000b546 	0xb546
    5a30:	0e540100 	jal	9500400 <_mem_avail_start-0x76affc00>
    5a34:	0000087e 	0x87e
    5a38:	bfc01268 	cache	0x0,4712(s8)
    5a3c:	0000000c 	syscall
    5a40:	950f4701 	lhu	t7,18177(t0)
    5a44:	e6000008 	swc1	$f0,8(s0)
    5a48:	0f000042 	jal	c000108 <_mem_avail_start-0x73fffef8>
    5a4c:	0000088a 	0x88a
    5a50:	000042f9 	0x42f9
    5a54:	00010a0e 	0x10a0e
    5a58:	c0126800 	ll	s2,26624(zero)
    5a5c:	00000cbf 	0xcbf
    5a60:	0f1d0100 	jal	c740400 <_mem_avail_start-0x738bfc00>
    5a64:	0000012c 	0x12c
    5a68:	000042e6 	0x42e6
    5a6c:	0001210f 	0x1210f
    5a70:	0042f900 	0x42f900
    5a74:	12681000 	beq	s3,t0,9a78 <_mem_avail_start-0x7fff6588>
    5a78:	000cbfc0 	sll	s7,t4,0x1f
    5a7c:	37110000 	ori	s1,t8,0x0
    5a80:	90000001 	lbu	zero,1(zero)
    5a84:	7bffc3e0 	0x7bffc3e0
    5a88:	00000000 	nop
    5a8c:	001a3812 	0x1a3812
    5a90:	54420100 	bnel	v0,v0,5e94 <_mem_avail_start-0x7fffa16c>
    5a94:	14bfc012 	bne	a1,ra,ffff5ae0 <_text_end+0x403f4348>
    5a98:	01000000 	0x1000000
    5a9c:	0003e59c 	0x3e59c
    5aa0:	1d5d1300 	0x1d5d1300
    5aa4:	42010000 	c0	0x10000
    5aa8:	000000aa 	0xaa
    5aac:	a10e5401 	sb	t6,21505(t0)
    5ab0:	54000008 	bnezl	zero,5ad4 <_mem_avail_start-0x7fffa52c>
    5ab4:	0cbfc012 	jal	2ff0048 <_mem_avail_start-0x7d00ffb8>
    5ab8:	01000000 	0x1000000
    5abc:	08b80f43 	j	2e03d0c <_mem_avail_start-0x7d1fc2f4>
    5ac0:	43110000 	c0	0x1110000
    5ac4:	ad0f0000 	sw	t7,0(t0)
    5ac8:	24000008 	li	zero,8
    5acc:	0e000043 	jal	800010c <_mem_avail_start-0x77fffef4>
    5ad0:	00000149 	0x149
    5ad4:	bfc01254 	cache	0x0,4692(s8)
    5ad8:	0000000c 	syscall
    5adc:	6b0f1d01 	0x6b0f1d01
    5ae0:	11000001 	beqz	t0,5ae8 <_mem_avail_start-0x7fffa518>
    5ae4:	0f000043 	jal	c00010c <_mem_avail_start-0x73fffef4>
    5ae8:	00000160 	0x160
    5aec:	00004324 	0x4324
    5af0:	c0125410 	ll	s2,21520(zero)
    5af4:	00000cbf 	0xcbf
    5af8:	01761100 	0x1761100
    5afc:	e0800000 	sc	zero,0(a0)
    5b00:	007bffc3 	0x7bffc3
    5b04:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    5b08:	00001e02 	srl	v1,zero,0x18
    5b0c:	00b53901 	0xb53901
    5b10:	00000000 	nop
    5b14:	00480000 	0x480000
    5b18:	9c010000 	0x9c010000
    5b1c:	00000432 	tlt	zero,zero,0x10
    5b20:	001ec414 	0x1ec414
    5b24:	b53a0100 	0xb53a0100
    5b28:	3c000000 	lui	zero,0x0
    5b2c:	15000043 	bnez	t0,5c3c <_mem_avail_start-0x7fffa3c4>
    5b30:	00000000 	nop
    5b34:	000004ef 	0x4ef
    5b38:	00000015 	0x15
    5b3c:	0004ef00 	sll	sp,a0,0x1c
    5b40:	00001500 	sll	v0,zero,0x14
    5b44:	04ef0000 	0x4ef0000
    5b48:	00150000 	sll	zero,s5,0x0
    5b4c:	ef000000 	swc3	$0,0(t8)
    5b50:	00000004 	sllv	zero,zero,zero
    5b54:	001d1012 	0x1d1012
    5b58:	34340100 	ori	s4,at,0x100
    5b5c:	20bfc012 	addi	ra,a1,-16366
    5b60:	01000000 	0x1000000
    5b64:	0004ef9c 	0x4ef9c
    5b68:	1d5d1300 	0x1d5d1300
    5b6c:	34010000 	li	at,0x0
    5b70:	0000009f 	0x9f
    5b74:	a1165401 	sb	s6,21505(t0)
    5b78:	34000009 	li	zero,0x9
    5b7c:	08bfc012 	j	2ff0048 <_mem_avail_start-0x7d00ffb8>
    5b80:	01000000 	0x1000000
    5b84:	00049635 	0x49635
    5b88:	09b11700 	j	6c45c00 <_mem_avail_start-0x793ba400>
    5b8c:	5d0e0000 	0x5d0e0000
    5b90:	34000002 	li	zero,0x2
    5b94:	08bfc012 	j	2ff0048 <_mem_avail_start-0x7d00ffb8>
    5b98:	01000000 	0x1000000
    5b9c:	0278171c 	0x278171c
    5ba0:	34100000 	li	s0,0x0
    5ba4:	08bfc012 	j	2ff0048 <_mem_avail_start-0x7d00ffb8>
    5ba8:	11000000 	beqz	t0,5bac <_mem_avail_start-0x7fffa454>
    5bac:	00000283 	sra	zero,zero,0xa
    5bb0:	fec0e094 	sdc3	$0,-8044(s6)
    5bb4:	0000007b 	0x7b
    5bb8:	0008c40e 	0x8c40e
    5bbc:	c0124800 	ll	s2,18432(zero)
    5bc0:	000004bf 	0x4bf
    5bc4:	0f360100 	jal	cd80400 <_mem_avail_start-0x7327fc00>
    5bc8:	000008db 	0x8db
    5bcc:	00004398 	0x4398
    5bd0:	0008d00f 	0x8d00f
    5bd4:	0043ab00 	0x43ab00
    5bd8:	01880e00 	0x1880e00
    5bdc:	12480000 	beq	s2,t0,5be0 <_mem_avail_start-0x7fffa420>
    5be0:	0004bfc0 	sll	s7,a0,0x1f
    5be4:	1d010000 	0x1d010000
    5be8:	0001aa0f 	0x1aa0f
    5bec:	00439800 	0x439800
    5bf0:	019f0f00 	0x19f0f00
    5bf4:	43ab0000 	c0	0x1ab0000
    5bf8:	48100000 	mfc2	s0,$0
    5bfc:	04bfc012 	0x4bfc012
    5c00:	11000000 	beqz	t0,5c04 <_mem_avail_start-0x7fffa3fc>
    5c04:	000001b5 	0x1b5
    5c08:	fec0e080 	sdc3	$0,-8064(s6)
    5c0c:	0000007b 	0x7b
    5c10:	1eb30d00 	0x1eb30d00
    5c14:	2f010000 	sltiu	at,t8,0
    5c18:	0000009f 	0x9f
    5c1c:	00000000 	nop
    5c20:	00000020 	add	zero,zero,zero
    5c24:	05899c01 	tgeiu	t4,-25599
    5c28:	a1160000 	sb	s6,0(t0)
    5c2c:	00000009 	jalr	zero,zero
    5c30:	08000000 	j	0 <_mem_avail_start-0x80000000>
    5c34:	01000000 	0x1000000
    5c38:	00054a30 	tge	zero,a1,0x128
    5c3c:	09b11700 	j	6c45c00 <_mem_avail_start-0x793ba400>
    5c40:	5d0e0000 	0x5d0e0000
    5c44:	00000002 	srl	zero,zero,0x0
    5c48:	08000000 	j	0 <_mem_avail_start-0x80000000>
    5c4c:	01000000 	0x1000000
    5c50:	0278171c 	0x278171c
    5c54:	00100000 	sll	zero,s0,0x0
    5c58:	08000000 	j	0 <_mem_avail_start-0x80000000>
    5c5c:	11000000 	beqz	t0,5c60 <_mem_avail_start-0x7fffa3a0>
    5c60:	00000283 	sra	zero,zero,0xa
    5c64:	fec0e094 	sdc3	$0,-8044(s6)
    5c68:	0000007b 	0x7b
    5c6c:	0009a10e 	0x9a10e
    5c70:	00000000 	nop
    5c74:	00000400 	sll	zero,zero,0x10
    5c78:	17310100 	bne	t9,s1,607c <_mem_avail_start-0x7fff9f84>
    5c7c:	000009b1 	tgeu	zero,zero,0x26
    5c80:	00025d0e 	0x25d0e
    5c84:	00000000 	nop
    5c88:	00000400 	sll	zero,zero,0x10
    5c8c:	171c0100 	bne	t8,gp,6090 <_mem_avail_start-0x7fff9f70>
    5c90:	00000278 	0x278
    5c94:	00000010 	mfhi	zero
    5c98:	00000400 	sll	zero,zero,0x10
    5c9c:	02831100 	0x2831100
    5ca0:	e0800000 	sc	zero,0(a0)
    5ca4:	007bfec0 	0x7bfec0
    5ca8:	12000000 	beqz	s0,5cac <_mem_avail_start-0x7fffa354>
    5cac:	00001a52 	0x1a52
    5cb0:	11fc1f01 	beq	t7,gp,d8b8 <_mem_avail_start-0x7fff2748>
    5cb4:	0038bfc0 	0x38bfc0
    5cb8:	9c010000 	0x9c010000
    5cbc:	0000081b 	0x81b
    5cc0:	0008c416 	0x8c416
    5cc4:	c011fc00 	ll	s1,-1024(zero)
    5cc8:	00000cbf 	0xcbf
    5ccc:	fa210100 	sdc2	$1,256(s1)
    5cd0:	0f000005 	jal	c000014 <_mem_avail_start-0x73ffffec>
    5cd4:	000008db 	0x8db
    5cd8:	000043c3 	sra	t0,zero,0xf
    5cdc:	0008d00f 	0x8d00f
    5ce0:	0043d800 	0x43d800
    5ce4:	01880e00 	0x1880e00
    5ce8:	11fc0000 	beq	t7,gp,5cec <_mem_avail_start-0x7fffa314>
    5cec:	000cbfc0 	sll	s7,t4,0x1f
    5cf0:	1d010000 	0x1d010000
    5cf4:	0001aa0f 	0x1aa0f
    5cf8:	0043c300 	0x43c300
    5cfc:	019f0f00 	0x19f0f00
    5d00:	43d80000 	c0	0x1d80000
    5d04:	fc100000 	sdc3	$16,0(zero)
    5d08:	0cbfc011 	jal	2ff0044 <_mem_avail_start-0x7d00ffbc>
    5d0c:	11000000 	beqz	t0,5d10 <_mem_avail_start-0x7fffa2f0>
    5d10:	000001b5 	0x1b5
    5d14:	fec0e088 	sdc3	$0,-8056(s6)
    5d18:	0000007b 	0x7b
    5d1c:	0008c416 	0x8c416
    5d20:	c0120800 	ll	s2,2048(zero)
    5d24:	000008bf 	0x8bf
    5d28:	56230100 	bnel	s1,v1,612c <_mem_avail_start-0x7fff9ed4>
    5d2c:	0f000006 	jal	c000018 <_mem_avail_start-0x73ffffe8>
    5d30:	000008db 	0x8db
    5d34:	000043f0 	tge	zero,zero,0x10f
    5d38:	0008d00f 	0x8d00f
    5d3c:	00440500 	0x440500
    5d40:	01880e00 	0x1880e00
    5d44:	12080000 	beq	s0,t0,5d48 <_mem_avail_start-0x7fffa2b8>
    5d48:	0008bfc0 	sll	s7,t0,0x1f
    5d4c:	1d010000 	0x1d010000
    5d50:	0001aa0f 	0x1aa0f
    5d54:	0043f000 	0x43f000
    5d58:	019f0f00 	0x19f0f00
    5d5c:	44050000 	mfc1	a1,$f0
    5d60:	08100000 	j	400000 <_mem_avail_start-0x7fc00000>
    5d64:	08bfc012 	j	2ff0048 <_mem_avail_start-0x7d00ffb8>
    5d68:	11000000 	beqz	t0,5d6c <_mem_avail_start-0x7fffa294>
    5d6c:	000001b5 	0x1b5
    5d70:	fec0e08c 	sdc3	$0,-8052(s6)
    5d74:	0000007b 	0x7b
    5d78:	0008c416 	0x8c416
    5d7c:	c0121000 	ll	s2,4096(zero)
    5d80:	000008bf 	0x8bf
    5d84:	b2250100 	0xb2250100
    5d88:	0f000006 	jal	c000018 <_mem_avail_start-0x73ffffe8>
    5d8c:	000008db 	0x8db
    5d90:	0000441d 	0x441d
    5d94:	0008d00f 	0x8d00f
    5d98:	00443200 	0x443200
    5d9c:	01880e00 	0x1880e00
    5da0:	12100000 	beq	s0,s0,5da4 <_mem_avail_start-0x7fffa25c>
    5da4:	0008bfc0 	sll	s7,t0,0x1f
    5da8:	1d010000 	0x1d010000
    5dac:	0001aa0f 	0x1aa0f
    5db0:	00441d00 	0x441d00
    5db4:	019f0f00 	0x19f0f00
    5db8:	44320000 	0x44320000
    5dbc:	10100000 	beq	zero,s0,5dc0 <_mem_avail_start-0x7fffa240>
    5dc0:	08bfc012 	j	2ff0048 <_mem_avail_start-0x7d00ffb8>
    5dc4:	11000000 	beqz	t0,5dc8 <_mem_avail_start-0x7fffa238>
    5dc8:	000001b5 	0x1b5
    5dcc:	fec0e080 	sdc3	$0,-8064(s6)
    5dd0:	0000007b 	0x7b
    5dd4:	0008c418 	0x8c418
    5dd8:	c0121800 	ll	s2,6144(zero)
    5ddc:	000838bf 	0x838bf
    5de0:	0a280100 	j	8a00400 <_mem_avail_start-0x775ffc00>
    5de4:	0f000007 	jal	c00001c <_mem_avail_start-0x73ffffe4>
    5de8:	000008db 	0x8db
    5dec:	0000444a 	0x444a
    5df0:	0008d00f 	0x8d00f
    5df4:	00445e00 	0x445e00
    5df8:	01881900 	0x1881900
    5dfc:	12180000 	beq	s0,t8,5e00 <_mem_avail_start-0x7fffa200>
    5e00:	0838bfc0 	j	e2ff00 <_mem_avail_start-0x7f1d0100>
    5e04:	1d010000 	0x1d010000
    5e08:	0001aa0f 	0x1aa0f
    5e0c:	00444a00 	0x444a00
    5e10:	019f0f00 	0x19f0f00
    5e14:	445e0000 	cfc1	s8,c1_fir
    5e18:	381a0000 	xori	k0,zero,0x0
    5e1c:	11000008 	beqz	t0,5e40 <_mem_avail_start-0x7fffa1c0>
    5e20:	000001b5 	0x1b5
    5e24:	fec0e08c 	sdc3	$0,-8052(s6)
    5e28:	0000007b 	0x7b
    5e2c:	0008c416 	0x8c416
    5e30:	c0121c00 	ll	s2,7168(zero)
    5e34:	000004bf 	0x4bf
    5e38:	66260100 	0x66260100
    5e3c:	0f000007 	jal	c00001c <_mem_avail_start-0x73ffffe4>
    5e40:	000008db 	0x8db
    5e44:	00004476 	tne	zero,zero,0x111
    5e48:	0008d00f 	0x8d00f
    5e4c:	00448a00 	0x448a00
    5e50:	01880e00 	0x1880e00
    5e54:	121c0000 	beq	s0,gp,5e58 <_mem_avail_start-0x7fffa1a8>
    5e58:	0004bfc0 	sll	s7,a0,0x1f
    5e5c:	1d010000 	0x1d010000
    5e60:	0001aa0f 	0x1aa0f
    5e64:	00447600 	0x447600
    5e68:	019f0f00 	0x19f0f00
    5e6c:	448a0000 	mtc1	t2,$f0
    5e70:	1c100000 	0x1c100000
    5e74:	04bfc012 	0x4bfc012
    5e78:	11000000 	beqz	t0,5e7c <_mem_avail_start-0x7fffa184>
    5e7c:	000001b5 	0x1b5
    5e80:	fec0e084 	sdc3	$0,-8060(s6)
    5e84:	0000007b 	0x7b
    5e88:	0008c416 	0x8c416
    5e8c:	c0122400 	ll	s2,9216(zero)
    5e90:	000004bf 	0x4bf
    5e94:	c22a0100 	ll	t2,256(s1)
    5e98:	0f000007 	jal	c00001c <_mem_avail_start-0x73ffffe4>
    5e9c:	000008db 	0x8db
    5ea0:	000044a2 	0x44a2
    5ea4:	0008d00f 	0x8d00f
    5ea8:	0044b600 	0x44b600
    5eac:	01880e00 	0x1880e00
    5eb0:	12240000 	beq	s1,a0,5eb4 <_mem_avail_start-0x7fffa14c>
    5eb4:	0004bfc0 	sll	s7,a0,0x1f
    5eb8:	1d010000 	0x1d010000
    5ebc:	0001aa0f 	0x1aa0f
    5ec0:	0044a200 	0x44a200
    5ec4:	019f0f00 	0x19f0f00
    5ec8:	44b60000 	0x44b60000
    5ecc:	24100000 	li	s0,0
    5ed0:	04bfc012 	0x4bfc012
    5ed4:	11000000 	beqz	t0,5ed8 <_mem_avail_start-0x7fffa128>
    5ed8:	000001b5 	0x1b5
    5edc:	fec0e090 	sdc3	$0,-8048(s6)
    5ee0:	0000007b 	0x7b
    5ee4:	0008c40e 	0x8c40e
    5ee8:	c0122800 	ll	s2,10240(zero)
    5eec:	000004bf 	0x4bf
    5ef0:	0f2c0100 	jal	cb00400 <_mem_avail_start-0x734ffc00>
    5ef4:	000008db 	0x8db
    5ef8:	000044ce 	0x44ce
    5efc:	0008d00f 	0x8d00f
    5f00:	0044e200 	0x44e200
    5f04:	01880e00 	0x1880e00
    5f08:	12280000 	beq	s1,t0,5f0c <_mem_avail_start-0x7fffa0f4>
    5f0c:	0004bfc0 	sll	s7,a0,0x1f
    5f10:	1d010000 	0x1d010000
    5f14:	0001aa0f 	0x1aa0f
    5f18:	0044ce00 	0x44ce00
    5f1c:	019f0f00 	0x19f0f00
    5f20:	44e20000 	0x44e20000
    5f24:	28100000 	slti	s0,zero,0
    5f28:	04bfc012 	0x4bfc012
    5f2c:	11000000 	beqz	t0,5f30 <_mem_avail_start-0x7fffa0d0>
    5f30:	000001b5 	0x1b5
    5f34:	fec0e084 	sdc3	$0,-8060(s6)
    5f38:	0000007b 	0x7b
    5f3c:	1dde1200 	0x1dde1200
    5f40:	1d010000 	0x1d010000
    5f44:	00000000 	nop
    5f48:	0000000c 	syscall
    5f4c:	087e9c01 	j	1fa7004 <_mem_avail_start-0x7e058ffc>
    5f50:	e8130000 	swc2	$19,0(zero)
    5f54:	01000019 	multu	t0,zero
    5f58:	0000251d 	0x251d
    5f5c:	13540100 	beq	k0,s4,6360 <_mem_avail_start-0x7fff9ca0>
    5f60:	00001d5d 	0x1d5d
    5f64:	00c01d01 	0xc01d01
    5f68:	55010000 	bnel	t0,at,5f6c <_mem_avail_start-0x7fffa094>
    5f6c:	0000cb0e 	0xcb0e
    5f70:	00000000 	nop
    5f74:	00000400 	sll	zero,zero,0x10
    5f78:	0f1d0100 	jal	c740400 <_mem_avail_start-0x738bfc00>
    5f7c:	000000ed 	0xed
    5f80:	000044fa 	0x44fa
    5f84:	0000e20f 	0xe20f
    5f88:	00450d00 	0x450d00
    5f8c:	00001000 	sll	v0,zero,0x0
    5f90:	00040000 	sll	zero,a0,0x0
    5f94:	f81b0000 	sdc2	$27,0(zero)
    5f98:	01000000 	0x1000000
    5f9c:	00000054 	0x54
    5fa0:	001d521c 	0x1d521c
    5fa4:	011d0100 	0x11d0100
    5fa8:	000008a1 	0x8a1
    5fac:	0019e809 	0x19e809
    5fb0:	251d0100 	addiu	sp,t0,256
    5fb4:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    5fb8:	00001d5d 	0x1d5d
    5fbc:	00b51d01 	0xb51d01
    5fc0:	1c000000 	bgtz	zero,5fc4 <_mem_avail_start-0x7fffa03c>
    5fc4:	00001d27 	0x1d27
    5fc8:	c4011d01 	lwc1	$f1,7425(zero)
    5fcc:	09000008 	j	4000020 <_mem_avail_start-0x7bffffe0>
    5fd0:	000019e8 	0x19e8
    5fd4:	00251d01 	0x251d01
    5fd8:	5d090000 	0x5d090000
    5fdc:	0100001d 	0x100001d
    5fe0:	0000aa1d 	0xaa1d
    5fe4:	621c0000 	0x621c0000
    5fe8:	0100001d 	0x100001d
    5fec:	08e7011d 	j	39c0474 <_mem_avail_start-0x7c63fb8c>
    5ff0:	e8090000 	swc2	$9,0(zero)
    5ff4:	01000019 	multu	t0,zero
    5ff8:	0000251d 	0x251d
    5ffc:	1d5d0900 	0x1d5d0900
    6000:	1d010000 	0x1d010000
    6004:	0000009f 	0x9f
    6008:	1e640d00 	0x1e640d00
    600c:	1c010000 	0x1c010000
    6010:	000000c0 	ehb
    6014:	00000000 	nop
    6018:	0000000c 	syscall
    601c:	09389c01 	j	4e27004 <_mem_avail_start-0x7b1d8ffc>
    6020:	e8130000 	swc2	$19,0(zero)
    6024:	01000019 	multu	t0,zero
    6028:	0000251c 	0x251c
    602c:	0e540100 	jal	9500400 <_mem_avail_start-0x76affc00>
    6030:	000001c7 	0x1c7
    6034:	00000000 	nop
    6038:	00000004 	sllv	zero,zero,zero
    603c:	e20f1c01 	sc	t7,7169(s0)
    6040:	20000001 	addi	zero,zero,1
    6044:	10000045 	b	615c <_mem_avail_start-0x7fff9ea4>
    6048:	00000000 	nop
    604c:	00000004 	sllv	zero,zero,zero
    6050:	0001ed1b 	0x1ed1b
    6054:	00540100 	0x540100
    6058:	bf1d0000 	cache	0x1d,0(t8)
    605c:	0100001e 	0x100001e
    6060:	0000b51c 	0xb51c
    6064:	09540100 	j	5500400 <_mem_avail_start-0x7aaffc00>
    6068:	e8090000 	swc2	$9,0(zero)
    606c:	01000019 	multu	t0,zero
    6070:	0000251c 	0x251c
    6074:	9a0d0000 	lwr	t5,0(s0)
    6078:	0100001d 	0x100001d
    607c:	0000aa1c 	0xaa1c
    6080:	00000000 	nop
    6084:	00000c00 	sll	at,zero,0x10
    6088:	a19c0100 	sb	gp,256(t4)
    608c:	13000009 	beqz	t8,60b4 <_mem_avail_start-0x7fff9f4c>
    6090:	000019e8 	0x19e8
    6094:	00251c01 	0x251c01
    6098:	54010000 	bnel	zero,at,609c <_mem_avail_start-0x7fff9f64>
    609c:	00022b0e 	0x22b0e
    60a0:	00000000 	nop
    60a4:	00000400 	sll	zero,zero,0x10
    60a8:	171c0100 	bne	t8,gp,64ac <_mem_avail_start-0x7fff9b54>
    60ac:	00000246 	0x246
    60b0:	00000010 	mfhi	zero
    60b4:	00000400 	sll	zero,zero,0x10
    60b8:	02511b00 	0x2511b00
    60bc:	54010000 	bnel	zero,at,60c0 <_mem_avail_start-0x7fff9f40>
    60c0:	1d000000 	bgtz	t0,60c4 <_mem_avail_start-0x7fff9f3c>
    60c4:	00001eea 	0x1eea
    60c8:	009f1c01 	0x9f1c01
    60cc:	bd010000 	cache	0x1,0(t0)
    60d0:	09000009 	j	4000024 <_mem_avail_start-0x7bffffdc>
    60d4:	000019e8 	0x19e8
    60d8:	00251c01 	0x251c01
    60dc:	1e000000 	bgtz	s0,60e0 <_mem_avail_start-0x7fff9f20>
    60e0:	000009a1 	0x9a1
    60e4:	00000000 	nop
    60e8:	0000000c 	syscall
    60ec:	09fe9c01 	j	7fa7004 <_mem_avail_start-0x78058ffc>
    60f0:	b11f0000 	0xb11f0000
    60f4:	01000009 	jalr	zero,t0
    60f8:	025d0e54 	0x25d0e54
    60fc:	00000000 	nop
    6100:	00040000 	sll	zero,a0,0x0
    6104:	1c010000 	0x1c010000
    6108:	00027817 	0x27817
    610c:	00001000 	sll	v0,zero,0x0
    6110:	00040000 	sll	zero,a0,0x0
    6114:	831b0000 	lb	k1,0(t8)
    6118:	01000002 	0x1000002
    611c:	00000054 	0x54
    6120:	0009381e 	0x9381e
    6124:	00000000 	nop
    6128:	00000c00 	sll	at,zero,0x10
    612c:	439c0100 	c0	0x19c0100
    6130:	1f00000a 	bgtz	t8,615c <_mem_avail_start-0x7fff9ea4>
    6134:	00000948 	0x948
    6138:	f90e5401 	sdc2	$14,21505(t0)
    613c:	00000001 	movf	zero,zero,$fcc0
    6140:	04000000 	bltz	zero,6144 <_mem_avail_start-0x7fff9ebc>
    6144:	01000000 	0x1000000
    6148:	02140f1c 	0x2140f1c
    614c:	45330000 	0x45330000
    6150:	00100000 	sll	zero,s0,0x0
    6154:	04000000 	bltz	zero,6158 <_mem_avail_start-0x7fff9ea8>
    6158:	1b000000 	blez	t8,615c <_mem_avail_start-0x7fff9ea4>
    615c:	0000021f 	0x21f
    6160:	00005401 	0x5401
    6164:	08c41e00 	j	3107800 <_mem_avail_start-0x7cef8800>
    6168:	00000000 	nop
    616c:	000c0000 	sll	zero,t4,0x0
    6170:	9c010000 	0x9c010000
    6174:	00000a98 	0xa98
    6178:	0008d01f 	0x8d01f
    617c:	1f540100 	0x1f540100
    6180:	000008db 	0x8db
    6184:	880e5501 	lwl	t6,21761(zero)
    6188:	00000001 	movf	zero,zero,$fcc0
    618c:	04000000 	bltz	zero,6190 <_mem_avail_start-0x7fff9e70>
    6190:	01000000 	0x1000000
    6194:	01aa0f1d 	0x1aa0f1d
    6198:	45460000 	0x45460000
    619c:	9f0f0000 	0x9f0f0000
    61a0:	59000001 	blezl	t0,61a8 <_mem_avail_start-0x7fff9e58>
    61a4:	10000045 	b	62bc <_mem_avail_start-0x7fff9d44>
    61a8:	00000000 	nop
    61ac:	00000004 	sllv	zero,zero,zero
    61b0:	0001b51b 	0x1b51b
    61b4:	00540100 	0x540100
    61b8:	a11e0000 	sb	s8,0(t0)
    61bc:	00000008 	jr	zero
    61c0:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    61c4:	01000000 	0x1000000
    61c8:	000aed9c 	0xaed9c
    61cc:	08ad1f00 	j	2b47c00 <_mem_avail_start-0x7d4b8400>
    61d0:	54010000 	bnel	zero,at,61d4 <_mem_avail_start-0x7fff9e2c>
    61d4:	0008b81f 	0x8b81f
    61d8:	0e550100 	jal	9540400 <_mem_avail_start-0x76abfc00>
    61dc:	00000149 	0x149
    61e0:	00000000 	nop
    61e4:	00000004 	sllv	zero,zero,zero
    61e8:	6b0f1d01 	0x6b0f1d01
    61ec:	6c000001 	0x6c000001
    61f0:	0f000045 	jal	c000114 <_mem_avail_start-0x73fffeec>
    61f4:	00000160 	0x160
    61f8:	0000457f 	0x457f
    61fc:	00000010 	mfhi	zero
    6200:	00000400 	sll	zero,zero,0x10
    6204:	01761b00 	0x1761b00
    6208:	54010000 	bnel	zero,at,620c <_mem_avail_start-0x7fff9df4>
    620c:	20000000 	addi	zero,zero,0
    6210:	0000087e 	0x87e
    6214:	00000000 	nop
    6218:	0000000c 	syscall
    621c:	8a1f9c01 	lwl	ra,-25599(s0)
    6220:	01000008 	jr	t0
    6224:	08951f54 	j	2547d50 <_mem_avail_start-0x7dab82b0>
    6228:	55010000 	bnel	t0,at,622c <_mem_avail_start-0x7fff9dd4>
    622c:	00010a0e 	0x10a0e
    6230:	00000000 	nop
    6234:	00000400 	sll	zero,zero,0x10
    6238:	0f1d0100 	jal	c740400 <_mem_avail_start-0x738bfc00>
    623c:	0000012c 	0x12c
    6240:	00004592 	0x4592
    6244:	0001210f 	0x1210f
    6248:	0045a500 	0x45a500
    624c:	00001000 	sll	v0,zero,0x0
    6250:	00040000 	sll	zero,a0,0x0
    6254:	371b0000 	ori	k1,t8,0x0
    6258:	01000001 	movf	zero,t0,$fcc0
    625c:	00000054 	0x54
	...

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
  24:	01390400 	0x1390400
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	13010b3b 	beq	t8,at,2d1c <_mem_avail_start-0x7fffd2e4>
  30:	13050000 	beq	t8,a1,34 <_mem_avail_start-0x7fffffcc>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	0b0e0301 	j	c380c04 <_mem_avail_start-0x73c7f3fc>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	3b0b3a0b 	xori	t3,t8,0x3a0b
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	0013010b 	0x13010b
  40:	82870600 	lb	a3,1536(s4)
  44:	08030101 	j	c0404 <_mem_avail_start-0x7ff3fbfc>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
  4c:	30070000 	andi	a3,zero,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	1c134900 	0x1c134900
  54:	0800000a 	j	28 <_mem_avail_start-0x7fffffd8>
  58:	193f012e 	0x193f012e
  5c:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	0e6e0b3b 	jal	9b82cec <_mem_avail_start-0x7647d314>
  64:	1301193c 	beq	t8,at,6558 <_mem_avail_start-0x7fff9aa8>
  68:	87090000 	lh	t1,0(t8)
  6c:	03010182 	0x3010182
  70:	0013010e 	0x13010e
  74:	002f0a00 	0x2f0a00
  78:	00001349 	0x1349
  7c:	4900050b 	bc2f	14ac <_mem_avail_start-0x7fffeb54>
  80:	0c000013 	jal	4c <_mem_avail_start-0x7fffffb4>
  84:	08030030 	j	c00c0 <_mem_avail_start-0x7ff3ff40>
  88:	0a1c1349 	j	8704d24 <_mem_avail_start-0x778fb2dc>
  8c:	870d0000 	lh	t5,0(t8)
  90:	03010182 	0x3010182
  94:	3b0b3a08 	xori	t3,t8,0x3a08
  98:	0013010b 	0x13010b
  9c:	012e0e00 	0x12e0e00
  a0:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
  a4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
  a8:	193c0e6e 	0x193c0e6e
  ac:	260f0000 	addiu	t7,s0,0
  b0:	00134900 	sll	t1,s3,0x4
  b4:	012e1000 	0x12e1000
  b8:	0b201347 	j	c804d1c <_mem_avail_start-0x737fb2e4>
  bc:	00001301 	0x1301
  c0:	03000511 	0x3000511
  c4:	3b0b3a08 	xori	t3,t8,0x3a08
  c8:	0013490b 	0x13490b
  cc:	82881200 	lb	t0,4608(s4)
  d0:	0b3a0101 	j	ce80404 <_mem_avail_start-0x7317fbfc>
  d4:	00000b3b 	0xb3b
  d8:	0b001013 	j	c00404c <_mem_avail_start-0x73ffbfb4>
  dc:	0013490b 	0x13490b
  e0:	01011400 	0x1011400
  e4:	13011349 	beq	t8,at,4e0c <_mem_avail_start-0x7fffb1f4>
  e8:	21150000 	addi	s5,t0,0
  ec:	2f134900 	sltiu	s3,t8,18688
  f0:	1600000b 	bnez	s0,120 <_mem_avail_start-0x7ffffee0>
  f4:	1347012e 	beq	k0,a3,5b0 <_mem_avail_start-0x7ffffa50>
  f8:	06120111 	bltzall	s0,540 <_mem_avail_start-0x7ffffac0>
  fc:	42971840 	c0	0x971840
 100:	00130119 	0x130119
 104:	00051700 	sll	v0,a1,0x1c
 108:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 10c:	13490b3b 	beq	k0,t1,2dfc <_mem_avail_start-0x7fffd204>
 110:	00001702 	srl	v0,zero,0x1c
 114:	01828818 	0x1828818
 118:	3b0b3a01 	xori	t3,t8,0x3a01
 11c:	0013010b 	0x13010b
 120:	00051900 	sll	v1,a1,0x4
 124:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 128:	13490b3b 	beq	k0,t1,2e18 <_mem_avail_start-0x7fffd1e8>
 12c:	00001702 	srl	v0,zero,0x1c
 130:	31011d1a 	andi	at,t0,0x1d1a
 134:	55015213 	bnel	t0,at,14984 <_mem_avail_start-0x7ffeb67c>
 138:	590b5817 	0x590b5817
 13c:	0013010b 	0x13010b
 140:	00051b00 	sll	v1,a1,0xc
 144:	17021331 	bne	t8,v0,4e0c <_mem_avail_start-0x7fffb1f4>
 148:	891c0000 	lwl	gp,0(t0)
 14c:	11010182 	beq	t0,at,758 <_mem_avail_start-0x7ffff8a8>
 150:	19429501 	0x19429501
 154:	00001331 	tgeu	zero,zero,0x4c
 158:	01828a1d 	0x1828a1d
 15c:	91180200 	lbu	t8,512(t0)
 160:	00001842 	srl	v1,zero,0x1
 164:	0182891e 	0x182891e
 168:	31011101 	andi	at,t0,0x1101
 16c:	1f000013 	bgtz	t8,1bc <_mem_avail_start-0x7ffffe44>
 170:	00018289 	0x18289
 174:	13310111 	beq	t9,s1,5bc <_mem_avail_start-0x7ffffa44>
 178:	2e200000 	sltiu	zero,s1,0
 17c:	03193f01 	0x3193f01
 180:	3b0b3a0e 	xori	t3,t8,0x3a0e
 184:	200e6e0b 	addi	t6,zero,28171
 188:	0013010b 	0x13010b
 18c:	00052100 	sll	a0,a1,0x4
 190:	18021349 	0x18021349
 194:	2e220000 	sltiu	v0,s1,0
 198:	03193f01 	0x3193f01
 19c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 1a0:	110e6e0b 	beq	t0,t6,1b9d0 <_mem_avail_start-0x7ffe4630>
 1a4:	40061201 	0x40061201
 1a8:	19429718 	0x19429718
 1ac:	00001301 	0x1301
 1b0:	03002f23 	0x3002f23
 1b4:	0013490e 	0x13490e
 1b8:	00342400 	0x342400
 1bc:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 1c0:	13490b3b 	beq	k0,t1,2eb0 <_mem_avail_start-0x7fffd150>
 1c4:	00001702 	srl	v0,zero,0x1c
 1c8:	03003425 	0x3003425
 1cc:	3b0b3a08 	xori	t3,t8,0x3a08
 1d0:	1c13490b 	0x1c13490b
 1d4:	2600000d 	addiu	zero,s0,13
 1d8:	1755010b 	bne	k0,s5,608 <_mem_avail_start-0x7ffff9f8>
 1dc:	00001301 	0x1301
 1e0:	03003427 	0x3003427
 1e4:	3b0b3a08 	xori	t3,t8,0x3a08
 1e8:	0213490b 	0x213490b
 1ec:	28000017 	slti	zero,zero,23
 1f0:	1331011d 	beq	t9,s1,668 <_mem_avail_start-0x7ffff998>
 1f4:	17550152 	bne	k0,s5,740 <_mem_avail_start-0x7ffff8c0>
 1f8:	0b590b58 	j	d642d60 <_mem_avail_start-0x729bd2a0>
 1fc:	0b290000 	j	ca40000 <_mem_avail_start-0x735c0000>
 200:	00175501 	0x175501
 204:	011d2a00 	0x11d2a00
 208:	01111331 	tgeu	t0,s1,0x4c
 20c:	0b580612 	j	d601848 <_mem_avail_start-0x729fe7b8>
 210:	13010b59 	beq	t8,at,2f78 <_mem_avail_start-0x7fffd088>
 214:	0b2b0000 	j	cac0000 <_mem_avail_start-0x73540000>
 218:	12011101 	beq	s0,at,4620 <_mem_avail_start-0x7fffb9e0>
 21c:	2c000006 	sltiu	zero,zero,6
 220:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
 224:	00001349 	0x1349
 228:	0b00242d 	j	c0090b4 <_mem_avail_start-0x73ff6f4c>
 22c:	030b3e0b 	0x30b3e0b
 230:	2e000008 	sltiu	zero,s0,8
 234:	13310005 	beq	t9,s1,24c <_mem_avail_start-0x7ffffdb4>
 238:	2e2f0000 	sltiu	t7,s1,0
 23c:	03193f01 	0x3193f01
 240:	3b0b3a0e 	xori	t3,t8,0x3a0e
 244:	1113490b 	beq	t0,s3,12674 <_mem_avail_start-0x7ffed98c>
 248:	40061201 	0x40061201
 24c:	19429718 	0x19429718
 250:	00001301 	0x1301
 254:	31011d30 	andi	at,t0,0x1d30
 258:	12011113 	beq	s0,at,46a8 <_mem_avail_start-0x7fffb958>
 25c:	590b5806 	0x590b5806
 260:	3100000b 	andi	zero,t0,0xb
 264:	01018289 	0x1018289
 268:	13310111 	beq	t9,s1,6b0 <_mem_avail_start-0x7ffff950>
 26c:	00001301 	0x1301
 270:	3f012e32 	0x3f012e32
 274:	3a0e0319 	xori	t6,s0,0x319
 278:	6e0b3b0b 	0x6e0b3b0b
 27c:	2013490e 	addi	s3,zero,18702
 280:	0013010b 	0x13010b
 284:	00053300 	sll	a2,a1,0xc
 288:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 28c:	13490b3b 	beq	k0,t1,2f7c <_mem_avail_start-0x7fffd084>
 290:	0b340000 	j	cd00000 <_mem_avail_start-0x73300000>
 294:	12011101 	beq	s0,at,469c <_mem_avail_start-0x7fffb964>
 298:	00130106 	0x130106
 29c:	00053500 	sll	a2,a1,0x14
 2a0:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 2a4:	13490b3b 	beq	k0,t1,2f94 <_mem_avail_start-0x7fffd06c>
 2a8:	00001802 	srl	v1,zero,0x0
 2ac:	03003436 	tne	t8,zero,0xd0
 2b0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 2b4:	1c13490b 	0x1c13490b
 2b8:	3700000d 	ori	zero,t8,0xd
 2bc:	1331012e 	beq	t9,s1,778 <_mem_avail_start-0x7ffff888>
 2c0:	06120111 	bltzall	s0,708 <_mem_avail_start-0x7ffff8f8>
 2c4:	42971840 	c0	0x971840
 2c8:	00130119 	0x130119
 2cc:	00053800 	sll	a3,a1,0x0
 2d0:	18021331 	0x18021331
 2d4:	05390000 	0x5390000
 2d8:	1c133100 	0x1c133100
 2dc:	3a00000b 	xori	zero,s0,0xb
 2e0:	18020036 	0x18020036
 2e4:	01000000 	0x1000000
 2e8:	06100011 	bltzal	s0,330 <_mem_avail_start-0x7ffffcd0>
 2ec:	01120111 	0x1120111
 2f0:	0e1b0e03 	jal	86c380c <_mem_avail_start-0x7793c7f4>
 2f4:	05130e25 	bgezall	t0,3b8c <_mem_avail_start-0x7fffc474>
 2f8:	01000000 	0x1000000
 2fc:	0e250111 	jal	8940444 <_mem_avail_start-0x776bfbbc>
 300:	0e030b13 	jal	80c2c4c <_mem_avail_start-0x77f3d3b4>
 304:	17550e1b 	bne	k0,s5,3b74 <_mem_avail_start-0x7fffc48c>
 308:	17100111 	bne	t8,s0,750 <_mem_avail_start-0x7ffff8b0>
 30c:	24020000 	li	v0,0
 310:	3e0b0b00 	0x3e0b0b00
 314:	000e030b 	0xe030b
 318:	00160300 	sll	zero,s6,0xc
 31c:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 320:	13490b3b 	beq	k0,t1,3010 <_mem_avail_start-0x7fffcff0>
 324:	26040000 	addiu	a0,s0,0
 328:	00134900 	sll	t1,s3,0x4
 32c:	00240500 	0x240500
 330:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 334:	00000803 	sra	at,zero,0x0
 338:	49010106 	bc2t	754 <_mem_avail_start-0x7ffff8ac>
 33c:	00130113 	0x130113
 340:	00210700 	0x210700
 344:	0b2f1349 	j	cbc4d24 <_mem_avail_start-0x7343b2dc>
 348:	0f080000 	jal	c200000 <_mem_avail_start-0x73e00000>
 34c:	490b0b00 	bc2tl	$cc2,2f50 <_mem_avail_start-0x7fffd0b0>
 350:	09000013 	j	400004c <_mem_avail_start-0x7bffffb4>
 354:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 358:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 35c:	193f1349 	0x193f1349
 360:	00001802 	srl	v1,zero,0x0
 364:	0b01130a 	j	c044c28 <_mem_avail_start-0x73fbb3d8>
 368:	3b0b3a0b 	xori	t3,t8,0x3a0b
 36c:	0013010b 	0x13010b
 370:	000d0b00 	sll	at,t5,0xc
 374:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 378:	13490b3b 	beq	k0,t1,3068 <_mem_avail_start-0x7fffcf98>
 37c:	00000b38 	0xb38
 380:	03000d0c 	syscall	0xc0034
 384:	3b0b3a08 	xori	t3,t8,0x3a08
 388:	3813490b 	xori	s3,zero,0x490b
 38c:	0d00000b 	jal	400002c <_mem_avail_start-0x7bffffd4>
 390:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 394:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 398:	193f1349 	0x193f1349
 39c:	0000193c 	0x193c
 3a0:	3f012e0e 	0x3f012e0e
 3a4:	3a0e0319 	xori	t6,s0,0x319
 3a8:	270b3b0b 	addiu	t3,t8,15115
 3ac:	12011119 	beq	s0,at,4814 <_mem_avail_start-0x7fffb7ec>
 3b0:	97184006 	lhu	t8,16390(t8)
 3b4:	13011942 	beq	t8,at,68c0 <_mem_avail_start-0x7fff9740>
 3b8:	050f0000 	0x50f0000
 3bc:	3a080300 	xori	t0,s0,0x300
 3c0:	490b3b0b 	bc2tl	$cc2,eff0 <_mem_avail_start-0x7fff1010>
 3c4:	00170213 	0x170213
 3c8:	00051000 	sll	v0,a1,0x0
 3cc:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 3d0:	13490b3b 	beq	k0,t1,30c0 <_mem_avail_start-0x7fffcf40>
 3d4:	00001702 	srl	v0,zero,0x1c
 3d8:	11010b11 	beq	t0,at,3020 <_mem_avail_start-0x7fffcfe0>
 3dc:	01061201 	0x1061201
 3e0:	12000013 	beqz	s0,430 <_mem_avail_start-0x7ffffbd0>
 3e4:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 3e8:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 3ec:	17021349 	bne	t8,v0,5114 <_mem_avail_start-0x7fffaeec>
 3f0:	34130000 	li	s3,0x0
 3f4:	3a080300 	xori	t0,s0,0x300
 3f8:	490b3b0b 	bc2tl	$cc2,f028 <_mem_avail_start-0x7fff0fd8>
 3fc:	14000013 	bnez	zero,44c <_mem_avail_start-0x7ffffbb4>
 400:	1331011d 	beq	t9,s1,878 <_mem_avail_start-0x7ffff788>
 404:	06120111 	bltzall	s0,84c <_mem_avail_start-0x7ffff7b4>
 408:	0b590b58 	j	d642d60 <_mem_avail_start-0x729bd2a0>
 40c:	00001301 	0x1301
 410:	11010b15 	beq	t0,at,3068 <_mem_avail_start-0x7fffcf98>
 414:	00061201 	0x61201
 418:	00341600 	0x341600
 41c:	00001331 	tgeu	zero,zero,0x4c
 420:	01828917 	0x1828917
 424:	31011101 	andi	at,t0,0x1101
 428:	00130113 	0x130113
 42c:	828a1800 	lb	t2,6144(s4)
 430:	18020001 	0x18020001
 434:	00184291 	0x184291
 438:	82891900 	lb	t1,6400(s4)
 43c:	01110101 	0x1110101
 440:	00001331 	tgeu	zero,zero,0x4c
 444:	0182891a 	0x182891a
 448:	31011100 	andi	at,t0,0x1100
 44c:	1b000013 	blez	t8,49c <_mem_avail_start-0x7ffffb64>
 450:	01018289 	0x1018289
 454:	42950111 	c0	0x950111
 458:	00133119 	0x133119
 45c:	012e1c00 	0x12e1c00
 460:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 464:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 468:	06120111 	bltzall	s0,8b0 <_mem_avail_start-0x7ffff750>
 46c:	42971840 	c0	0x971840
 470:	00130119 	0x130119
 474:	010b1d00 	0x10b1d00
 478:	00001755 	0x1755
 47c:	0300341e 	0x300341e
 480:	3b0b3a08 	xori	t3,t8,0x3a08
 484:	0213490b 	0x213490b
 488:	1f000017 	bgtz	t8,4e8 <_mem_avail_start-0x7ffffb18>
 48c:	1755010b 	bne	k0,s5,8bc <_mem_avail_start-0x7ffff744>
 490:	00001301 	0x1301
 494:	3f012e20 	0x3f012e20
 498:	3a0e0319 	xori	t6,s0,0x319
 49c:	490b3b0b 	bc2tl	$cc2,f0cc <_mem_avail_start-0x7fff0f34>
 4a0:	010b2013 	0x10b2013
 4a4:	21000013 	addi	zero,t0,19
 4a8:	01018289 	0x1018289
 4ac:	42950111 	c0	0x950111
 4b0:	01133119 	0x1133119
 4b4:	22000013 	addi	zero,s0,19
 4b8:	1331012e 	beq	t9,s1,974 <_mem_avail_start-0x7ffff68c>
 4bc:	06120111 	bltzall	s0,904 <_mem_avail_start-0x7ffff6fc>
 4c0:	42971840 	c0	0x971840
 4c4:	00130119 	0x130119
 4c8:	00342300 	0x342300
 4cc:	18021331 	0x18021331
 4d0:	2e240000 	sltiu	a0,s1,0
 4d4:	3c193f00 	lui	t9,0x3f00
 4d8:	030e6e19 	0x30e6e19
 4dc:	3b0b3a0e 	xori	t3,t8,0x3a0e
 4e0:	0000000b 	movn	zero,zero,zero
 4e4:	25011101 	addiu	at,t0,4353
 4e8:	030b130e 	0x30b130e
 4ec:	550e1b0e 	bnel	t0,t6,7128 <_mem_avail_start-0x7fff8ed8>
 4f0:	10011117 	beq	zero,at,4950 <_mem_avail_start-0x7fffb6b0>
 4f4:	02000017 	0x2000017
 4f8:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
 4fc:	24030000 	li	v1,0
 500:	3e0b0b00 	0x3e0b0b00
 504:	000e030b 	0xe030b
 508:	012e0400 	0x12e0400
 50c:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 510:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 514:	13491927 	beq	k0,t1,69b4 <_mem_avail_start-0x7fff964c>
 518:	06120111 	bltzall	s0,960 <_mem_avail_start-0x7ffff6a0>
 51c:	42971840 	c0	0x971840
 520:	00130119 	0x130119
 524:	00050500 	sll	zero,a1,0x14
 528:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 52c:	13490b3b 	beq	k0,t1,321c <_mem_avail_start-0x7fffcde4>
 530:	00001702 	srl	v0,zero,0x1c
 534:	00001806 	srlv	v1,zero,zero
 538:	00340700 	0x340700
 53c:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 540:	13490b3b 	beq	k0,t1,3230 <_mem_avail_start-0x7fffcdd0>
 544:	00001702 	srl	v0,zero,0x1c
 548:	03003408 	0x3003408
 54c:	3b0b3a08 	xori	t3,t8,0x3a08
 550:	0213490b 	0x213490b
 554:	09000018 	j	4000060 <_mem_avail_start-0x7bffffa0>
 558:	0e03000a 	jal	80c0028 <_mem_avail_start-0x77f3ffd8>
 55c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 560:	00000111 	0x111
 564:	55010b0a 	bnel	t0,at,3190 <_mem_avail_start-0x7fffce70>
 568:	00130117 	0x130117
 56c:	012e0b00 	0x12e0b00
 570:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 574:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 578:	193c1349 	0x193c1349
 57c:	00001301 	0x1301
 580:	0182890c 	syscall	0x60a24
 584:	31011100 	andi	at,t0,0x1100
 588:	0d000013 	jal	400004c <_mem_avail_start-0x7bffffb4>
 58c:	01018289 	0x1018289
 590:	13310111 	beq	t9,s1,9d8 <_mem_avail_start-0x7ffff628>
 594:	00001301 	0x1301
 598:	01828a0e 	0x1828a0e
 59c:	91180200 	lbu	t8,512(t0)
 5a0:	00001842 	srl	v1,zero,0x1
 5a4:	0182890f 	0x182890f
 5a8:	31011101 	andi	at,t0,0x1101
 5ac:	10000013 	b	5fc <_mem_avail_start-0x7ffffa04>
 5b0:	1755010b 	bne	k0,s5,9e0 <_mem_avail_start-0x7ffff620>
 5b4:	0b110000 	j	c440000 <_mem_avail_start-0x73bc0000>
 5b8:	12011101 	beq	s0,at,49c0 <_mem_avail_start-0x7fffb640>
 5bc:	00130106 	0x130106
 5c0:	00241200 	0x241200
 5c4:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 5c8:	00000803 	sra	at,zero,0x0
 5cc:	0b000f13 	j	c003c4c <_mem_avail_start-0x73ffc3b4>
 5d0:	0013490b 	0x13490b
 5d4:	00261400 	0x261400
 5d8:	00001349 	0x1349
 5dc:	3f002e15 	0x3f002e15
 5e0:	6e193c19 	0x6e193c19
 5e4:	3a0e030e 	xori	t6,s0,0x30e
 5e8:	000b3b0b 	0xb3b0b
 5ec:	11010000 	beq	t0,at,5f0 <_mem_avail_start-0x7ffffa10>
 5f0:	130e2501 	beq	t8,t6,99f8 <_mem_avail_start-0x7fff6608>
 5f4:	1b0e030b 	0x1b0e030b
 5f8:	1117550e 	beq	t0,s7,15a34 <_mem_avail_start-0x7ffea5cc>
 5fc:	00171001 	0x171001
 600:	00240200 	0x240200
 604:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 608:	00000e03 	sra	at,zero,0x18
 60c:	3f012e03 	0x3f012e03
 610:	3a0e0319 	xori	t6,s0,0x319
 614:	270b3b0b 	addiu	t3,t8,15115
 618:	11134919 	beq	t0,s3,12a80 <_mem_avail_start-0x7ffed580>
 61c:	40061201 	0x40061201
 620:	19429718 	0x19429718
 624:	00001301 	0x1301
 628:	03000504 	0x3000504
 62c:	3b0b3a08 	xori	t3,t8,0x3a08
 630:	0213490b 	0x213490b
 634:	05000017 	bltz	t0,694 <_mem_avail_start-0x7ffff96c>
 638:	0e030005 	jal	80c0014 <_mem_avail_start-0x77f3ffec>
 63c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 640:	17021349 	bne	t8,v0,5368 <_mem_avail_start-0x7fffac98>
 644:	34060000 	li	a2,0x0
 648:	3a080300 	xori	t0,s0,0x300
 64c:	490b3b0b 	bc2tl	$cc2,f27c <_mem_avail_start-0x7fff0d84>
 650:	00170213 	0x170213
 654:	00340700 	0x340700
 658:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 65c:	13490b3b 	beq	k0,t1,334c <_mem_avail_start-0x7fffccb4>
 660:	00001802 	srl	v1,zero,0x0
 664:	03003408 	0x3003408
 668:	3b0b3a0e 	xori	t3,t8,0x3a0e
 66c:	0213490b 	0x213490b
 670:	09000017 	j	400005c <_mem_avail_start-0x7bffffa4>
 674:	0111010b 	0x111010b
 678:	13010612 	beq	t8,at,1ec4 <_mem_avail_start-0x7fffe13c>
 67c:	2e0a0000 	sltiu	t2,s0,0
 680:	03193f01 	0x3193f01
 684:	3b0b3a0e 	xori	t3,t8,0x3a0e
 688:	3c13490b 	lui	s3,0x490b
 68c:	00130119 	0x130119
 690:	00180b00 	sll	at,t8,0xc
 694:	890c0000 	lwl	t4,0(t0)
 698:	11010182 	beq	t0,at,ca4 <_mem_avail_start-0x7ffff35c>
 69c:	00133101 	0x133101
 6a0:	828a0d00 	lb	t2,3328(s4)
 6a4:	18020001 	0x18020001
 6a8:	00184291 	0x184291
 6ac:	010b0e00 	0x10b0e00
 6b0:	06120111 	bltzall	s0,af8 <_mem_avail_start-0x7ffff508>
 6b4:	890f0000 	lwl	t7,0(t0)
 6b8:	11000182 	beqz	t0,cc4 <_mem_avail_start-0x7ffff33c>
 6bc:	00133101 	0x133101
 6c0:	00241000 	0x241000
 6c4:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 6c8:	00000803 	sra	at,zero,0x0
 6cc:	49010111 	bc2t	b14 <_mem_avail_start-0x7ffff4ec>
 6d0:	00130113 	0x130113
 6d4:	00211200 	0x211200
 6d8:	0b2f1349 	j	cbc4d24 <_mem_avail_start-0x7343b2dc>
 6dc:	2e130000 	sltiu	s3,s0,0
 6e0:	3c193f00 	lui	t9,0x3f00
 6e4:	030e6e19 	0x30e6e19
 6e8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 6ec:	0000000b 	movn	zero,zero,zero
 6f0:	25011101 	addiu	at,t0,4353
 6f4:	030b130e 	0x30b130e
 6f8:	550e1b0e 	bnel	t0,t6,7334 <_mem_avail_start-0x7fff8ccc>
 6fc:	10011117 	beq	zero,at,4b5c <_mem_avail_start-0x7fffb4a4>
 700:	02000017 	0x2000017
 704:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
 708:	24030000 	li	v1,0
 70c:	3e0b0b00 	0x3e0b0b00
 710:	000e030b 	0xe030b
 714:	00160400 	sll	zero,s6,0x10
 718:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 71c:	13490b3b 	beq	k0,t1,340c <_mem_avail_start-0x7fffcbf4>
 720:	2e050000 	sltiu	a1,s0,0
 724:	03193f01 	0x3193f01
 728:	3b0b3a0e 	xori	t3,t8,0x3a0e
 72c:	11192705 	beq	t0,t9,a344 <_mem_avail_start-0x7fff5cbc>
 730:	40061201 	0x40061201
 734:	19429718 	0x19429718
 738:	00001301 	0x1301
 73c:	03000506 	0x3000506
 740:	3b0b3a08 	xori	t3,t8,0x3a08
 744:	02134905 	0x2134905
 748:	07000018 	bltz	t8,7ac <_mem_avail_start-0x7ffff854>
 74c:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 750:	053b0b3a 	0x53b0b3a
 754:	17021349 	bne	t8,v0,547c <_mem_avail_start-0x7fffab84>
 758:	89080000 	lwl	t0,0(t0)
 75c:	11010182 	beq	t0,at,d68 <_mem_avail_start-0x7ffff298>
 760:	19429501 	0x19429501
 764:	00001331 	tgeu	zero,zero,0x4c
 768:	01828a09 	0x1828a09
 76c:	91180200 	lbu	t8,512(t0)
 770:	00001842 	srl	v1,zero,0x1
 774:	3f012e0a 	0x3f012e0a
 778:	3a0e0319 	xori	t6,s0,0x319
 77c:	27053b0b 	addiu	a1,t8,15115
 780:	11134919 	beq	t0,s3,12be8 <_mem_avail_start-0x7ffed418>
 784:	40061201 	0x40061201
 788:	19429718 	0x19429718
 78c:	00001301 	0x1301
 790:	0300340b 	0x300340b
 794:	3b0b3a08 	xori	t3,t8,0x3a08
 798:	02134905 	0x2134905
 79c:	0c000018 	jal	60 <_mem_avail_start-0x7fffffa0>
 7a0:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 7a4:	08030b3e 	j	c2cf8 <_mem_avail_start-0x7ff3d308>
 7a8:	0f0d0000 	jal	c340000 <_mem_avail_start-0x73cc0000>
 7ac:	490b0b00 	bc2tl	$cc2,33b0 <_mem_avail_start-0x7fffcc50>
 7b0:	0e000013 	jal	800004c <_mem_avail_start-0x77ffffb4>
 7b4:	00000026 	xor	zero,zero,zero
 7b8:	4900260f 	bc2f	9ff8 <_mem_avail_start-0x7fff6008>
 7bc:	10000013 	b	80c <_mem_avail_start-0x7ffff7f4>
 7c0:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 7c4:	053b0b3a 	0x53b0b3a
 7c8:	17021349 	bne	t8,v0,54f0 <_mem_avail_start-0x7fffab10>
 7cc:	2e110000 	sltiu	s1,s0,0
 7d0:	03193f01 	0x3193f01
 7d4:	3b0b3a0e 	xori	t3,t8,0x3a0e
 7d8:	4919270b 	bc2t	$cc6,a408 <_mem_avail_start-0x7fff5bf8>
 7dc:	12011113 	beq	s0,at,4c2c <_mem_avail_start-0x7fffb3d4>
 7e0:	97184006 	lhu	t8,16390(t8)
 7e4:	13011942 	beq	t8,at,6cf0 <_mem_avail_start-0x7fff9310>
 7e8:	05120000 	bltzall	t0,7ec <_mem_avail_start-0x7ffff814>
 7ec:	3a080300 	xori	t0,s0,0x300
 7f0:	490b3b0b 	bc2tl	$cc2,f420 <_mem_avail_start-0x7fff0be0>
 7f4:	00170213 	0x170213
 7f8:	00051300 	sll	v0,a1,0xc
 7fc:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 800:	13490b3b 	beq	k0,t1,34f0 <_mem_avail_start-0x7fffcb10>
 804:	00001802 	srl	v1,zero,0x0
 808:	03003414 	0x3003414
 80c:	3b0b3a08 	xori	t3,t8,0x3a08
 810:	0213490b 	0x213490b
 814:	15000017 	bnez	t0,874 <_mem_avail_start-0x7ffff78c>
 818:	193f012e 	0x193f012e
 81c:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 820:	19270b3b 	0x19270b3b
 824:	01111349 	0x1111349
 828:	18400612 	blez	v0,2074 <_mem_avail_start-0x7fffdf8c>
 82c:	00194297 	0x194297
 830:	11010000 	beq	t0,at,834 <_mem_avail_start-0x7ffff7cc>
 834:	130e2501 	beq	t8,t6,9c3c <_mem_avail_start-0x7fff63c4>
 838:	1b0e030b 	0x1b0e030b
 83c:	1117550e 	beq	t0,s7,15c78 <_mem_avail_start-0x7ffea388>
 840:	00171001 	0x171001
 844:	00240200 	0x240200
 848:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 84c:	00000e03 	sra	at,zero,0x18
 850:	3f012e03 	0x3f012e03
 854:	3a0e0319 	xori	t6,s0,0x319
 858:	270b3b0b 	addiu	t3,t8,15115
 85c:	11134919 	beq	t0,s3,12cc4 <_mem_avail_start-0x7ffed33c>
 860:	40061201 	0x40061201
 864:	19429718 	0x19429718
 868:	00001301 	0x1301
 86c:	03000504 	0x3000504
 870:	3b0b3a08 	xori	t3,t8,0x3a08
 874:	0213490b 	0x213490b
 878:	05000017 	bltz	t0,8d8 <_mem_avail_start-0x7ffff728>
 87c:	193f012e 	0x193f012e
 880:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 884:	13490b3b 	beq	k0,t1,3574 <_mem_avail_start-0x7fffca8c>
 888:	1301193c 	beq	t8,at,6d7c <_mem_avail_start-0x7fff9284>
 88c:	18060000 	0x18060000
 890:	07000000 	bltz	t8,894 <_mem_avail_start-0x7ffff76c>
 894:	01018289 	0x1018289
 898:	13310111 	beq	t9,s1,ce0 <_mem_avail_start-0x7ffff320>
 89c:	00001301 	0x1301
 8a0:	01828a08 	0x1828a08
 8a4:	91180200 	lbu	t8,512(t0)
 8a8:	00001842 	srl	v1,zero,0x1
 8ac:	01828909 	0x1828909
 8b0:	31011101 	andi	at,t0,0x1101
 8b4:	0a000013 	j	800004c <_mem_avail_start-0x77ffffb4>
 8b8:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 8bc:	08030b3e 	j	c2cf8 <_mem_avail_start-0x7ff3d308>
 8c0:	0f0b0000 	jal	c2c0000 <_mem_avail_start-0x73d40000>
 8c4:	490b0b00 	bc2tl	$cc2,34c8 <_mem_avail_start-0x7fffcb38>
 8c8:	0c000013 	jal	4c <_mem_avail_start-0x7fffffb4>
 8cc:	13490026 	beq	k0,t1,968 <_mem_avail_start-0x7ffff698>
 8d0:	340d0000 	li	t5,0x0
 8d4:	3a080300 	xori	t0,s0,0x300
 8d8:	490b3b0b 	bc2tl	$cc2,f508 <_mem_avail_start-0x7fff0af8>
 8dc:	00170213 	0x170213
 8e0:	010b0e00 	0x10b0e00
 8e4:	00001755 	0x1755
 8e8:	11010b0f 	beq	t0,at,3528 <_mem_avail_start-0x7fffcad8>
 8ec:	01061201 	0x1061201
 8f0:	10000013 	b	940 <_mem_avail_start-0x7ffff6c0>
 8f4:	193f002e 	0x193f002e
 8f8:	0e6e193c 	jal	9b864f0 <_mem_avail_start-0x76479b10>
 8fc:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 900:	00000b3b 	0xb3b
 904:	01110100 	0x1110100
 908:	0b130e25 	j	c4c3894 <_mem_avail_start-0x73b3c76c>
 90c:	0e1b0e03 	jal	86c380c <_mem_avail_start-0x7793c7f4>
 910:	01111755 	0x1111755
 914:	00001710 	0x1710
 918:	0b002402 	j	c009008 <_mem_avail_start-0x73ff6ff8>
 91c:	030b3e0b 	0x30b3e0b
 920:	0300000e 	0x300000e
 924:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 928:	08030b3e 	j	c2cf8 <_mem_avail_start-0x7ff3d308>
 92c:	16040000 	bne	s0,a0,930 <_mem_avail_start-0x7ffff6d0>
 930:	3a0e0300 	xori	t6,s0,0x300
 934:	490b3b0b 	bc2tl	$cc2,f564 <_mem_avail_start-0x7fff0a9c>
 938:	05000013 	bltz	t0,988 <_mem_avail_start-0x7ffff678>
 93c:	193f012e 	0x193f012e
 940:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 944:	19270b3b 	0x19270b3b
 948:	01111349 	0x1111349
 94c:	18400612 	blez	v0,2198 <_mem_avail_start-0x7fffde68>
 950:	01194297 	0x1194297
 954:	06000013 	bltz	s0,9a4 <_mem_avail_start-0x7ffff65c>
 958:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 95c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 960:	17021349 	bne	t8,v0,5688 <_mem_avail_start-0x7fffa978>
 964:	89070000 	lwl	a3,0(t0)
 968:	11010182 	beq	t0,at,f74 <_mem_avail_start-0x7ffff08c>
 96c:	00133101 	0x133101
 970:	828a0800 	lb	t2,2048(s4)
 974:	18020001 	0x18020001
 978:	00184291 	0x184291
 97c:	002e0900 	0x2e0900
 980:	193c193f 	0x193c193f
 984:	0e030e6e 	jal	80c39b8 <_mem_avail_start-0x77f3c648>
 988:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 98c:	01000000 	0x1000000
 990:	0e250111 	jal	8940444 <_mem_avail_start-0x776bfbbc>
 994:	0e030b13 	jal	80c2c4c <_mem_avail_start-0x77f3d3b4>
 998:	17550e1b 	bne	k0,s5,4208 <_mem_avail_start-0x7fffbdf8>
 99c:	17100111 	bne	t8,s0,de4 <_mem_avail_start-0x7ffff21c>
 9a0:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
 9a4:	000b0b00 	sll	at,t3,0xc
 9a8:	00240300 	0x240300
 9ac:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 9b0:	00000e03 	sra	at,zero,0x18
 9b4:	49003504 	bc2f	ddc8 <_mem_avail_start-0x7fff2238>
 9b8:	05000013 	bltz	t0,a08 <_mem_avail_start-0x7ffff5f8>
 9bc:	0e030016 	jal	80c0058 <_mem_avail_start-0x77f3ffa8>
 9c0:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 9c4:	00001349 	0x1349
 9c8:	0b002406 	j	c009018 <_mem_avail_start-0x73ff6fe8>
 9cc:	030b3e0b 	0x30b3e0b
 9d0:	07000008 	bltz	t8,9f4 <_mem_avail_start-0x7ffff60c>
 9d4:	193f012e 	0x193f012e
 9d8:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 9dc:	0e6e0b3b 	jal	9b82cec <_mem_avail_start-0x7647d314>
 9e0:	13010b20 	beq	t8,at,3664 <_mem_avail_start-0x7fffc99c>
 9e4:	2f080000 	sltiu	t0,t8,0
 9e8:	49080300 	bc2f	$cc2,15ec <_mem_avail_start-0x7fffea14>
 9ec:	09000013 	j	400004c <_mem_avail_start-0x7bffffb4>
 9f0:	0e030005 	jal	80c0014 <_mem_avail_start-0x77f3ffec>
 9f4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 9f8:	00001349 	0x1349
 9fc:	0300340a 	0x300340a
 a00:	3b0b3a08 	xori	t3,t8,0x3a08
 a04:	0013490b 	0x13490b
 a08:	000f0b00 	sll	at,t7,0xc
 a0c:	13490b0b 	beq	k0,t1,363c <_mem_avail_start-0x7fffc9c4>
 a10:	2e0c0000 	sltiu	t4,s0,0
 a14:	03193f01 	0x3193f01
 a18:	3b0b3a0e 	xori	t3,t8,0x3a0e
 a1c:	490e6e0b 	bc2fl	$cc3,1c24c <_mem_avail_start-0x7ffe3db4>
 a20:	010b2013 	0x10b2013
 a24:	0d000013 	jal	400004c <_mem_avail_start-0x7bffffb4>
 a28:	193f012e 	0x193f012e
 a2c:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 a30:	13490b3b 	beq	k0,t1,3720 <_mem_avail_start-0x7fffc8e0>
 a34:	06120111 	bltzall	s0,e7c <_mem_avail_start-0x7ffff184>
 a38:	42971840 	c0	0x971840
 a3c:	00130119 	0x130119
 a40:	011d0e00 	0x11d0e00
 a44:	01111331 	tgeu	t0,s1,0x4c
 a48:	0b580612 	j	d601848 <_mem_avail_start-0x729fe7b8>
 a4c:	00000b59 	0xb59
 a50:	3100050f 	andi	zero,t0,0x50f
 a54:	00170213 	0x170213
 a58:	010b1000 	0x10b1000
 a5c:	06120111 	bltzall	s0,ea4 <_mem_avail_start-0x7ffff15c>
 a60:	34110000 	li	s1,0x0
 a64:	1c133100 	0x1c133100
 a68:	1200000d 	beqz	s0,aa0 <_mem_avail_start-0x7ffff560>
 a6c:	193f012e 	0x193f012e
 a70:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 a74:	01110b3b 	0x1110b3b
 a78:	18400612 	blez	v0,22c4 <_mem_avail_start-0x7fffdd3c>
 a7c:	01194297 	0x1194297
 a80:	13000013 	beqz	t8,ad0 <_mem_avail_start-0x7ffff530>
 a84:	0e030005 	jal	80c0014 <_mem_avail_start-0x77f3ffec>
 a88:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 a8c:	18021349 	0x18021349
 a90:	34140000 	li	s4,0x0
 a94:	3a0e0300 	xori	t6,s0,0x300
 a98:	490b3b0b 	bc2tl	$cc2,f6c8 <_mem_avail_start-0x7fff0938>
 a9c:	00170213 	0x170213
 aa0:	82891500 	lb	t1,5376(s4)
 aa4:	01110001 	movt	zero,t0,$fcc4
 aa8:	00001331 	tgeu	zero,zero,0x4c
 aac:	31011d16 	andi	at,t0,0x1d16
 ab0:	12011113 	beq	s0,at,4f00 <_mem_avail_start-0x7fffb100>
 ab4:	590b5806 	0x590b5806
 ab8:	0013010b 	0x13010b
 abc:	00051700 	sll	v0,a1,0x1c
 ac0:	00001331 	tgeu	zero,zero,0x4c
 ac4:	31011d18 	andi	at,t0,0x1d18
 ac8:	55015213 	bnel	t0,at,15318 <_mem_avail_start-0x7ffeace8>
 acc:	590b5817 	0x590b5817
 ad0:	0013010b 	0x13010b
 ad4:	011d1900 	0x11d1900
 ad8:	01521331 	tgeu	t2,s2,0x4c
 adc:	0b581755 	j	d605d54 <_mem_avail_start-0x729fa2ac>
 ae0:	00000b59 	0xb59
 ae4:	55010b1a 	bnel	t0,at,3750 <_mem_avail_start-0x7fffc8b0>
 ae8:	1b000017 	blez	t8,b48 <_mem_avail_start-0x7ffff4b8>
 aec:	13310034 	beq	t9,s1,bc0 <_mem_avail_start-0x7ffff440>
 af0:	00001802 	srl	v1,zero,0x0
 af4:	3f012e1c 	0x3f012e1c
 af8:	3a0e0319 	xori	t6,s0,0x319
 afc:	200b3b0b 	addi	t3,zero,15115
 b00:	0013010b 	0x13010b
 b04:	012e1d00 	0x12e1d00
 b08:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 b0c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 b10:	0b201349 	j	c804d24 <_mem_avail_start-0x737fb2dc>
 b14:	00001301 	0x1301
 b18:	31012e1e 	andi	at,t0,0x2e1e
 b1c:	12011113 	beq	s0,at,4f6c <_mem_avail_start-0x7fffb094>
 b20:	97184006 	lhu	t8,16390(t8)
 b24:	13011942 	beq	t8,at,7030 <_mem_avail_start-0x7fff8fd0>
 b28:	051f0000 	0x51f0000
 b2c:	02133100 	0x2133100
 b30:	20000018 	addi	zero,zero,24
 b34:	1331012e 	beq	t9,s1,ff0 <_mem_avail_start-0x7ffff010>
 b38:	06120111 	bltzall	s0,f80 <_mem_avail_start-0x7ffff080>
 b3c:	42971840 	c0	0x971840
 b40:	00000019 	multu	zero,zero

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
       0:	bfc007dc 	cache	0x0,2012(s8)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	bfc0089b 	cache	0x0,2203(s8)
       8:	9b540001 	lwr	s4,1(k0)
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
       c:	c4bfc008 	lwc1	$f31,-16376(a1)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	04bfc009 	0x4bfc009
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	5401f300 	bnel	zero,at,ffffcc18 <_text_end+0x403fb480>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	0000009f 	0x9f
      1c:	00000000 	nop
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
      20:	c007dc00 	ll	a3,-9216(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	c0089bbf 	ll	t0,-25665(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	550001bf 	bnezl	t0,728 <_mem_avail_start-0x7ffff8d8>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	bfc0089b 	cache	0x0,2203(s8)
      30:	bfc009c4 	cache	0x0,2500(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	01f30004 	sllv	zero,s3,t7
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	00009f55 	0x9f55
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	00000000 	nop
      40:	07dc0000 	0x7dc0000
      44:	089bbfc0 	j	26eff00 <_mem_avail_start-0x7d910100>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
      48:	0001bfc0 	sll	s7,at,0x1f
      4c:	c0089b56 	ll	t0,-25770(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	c009c4bf 	ll	t1,-15169(zero)
      54:	f30004bf 	0xf30004bf
      58:	009f5601 	0x9f5601
      5c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
      60:	dc000000 	ldc3	$0,0(zero)
      64:	9bbfc007 	lwr	ra,-16377(sp)
      68:	01bfc008 	0x1bfc008
      6c:	089b5700 	j	26d5c00 <_mem_avail_start-0x7d92a400>
      70:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
      74:	0004bfc0 	sll	s7,a0,0x1f
      78:	9f5701f3 	0x9f5701f3
	...
      84:	bfc007dc 	cache	0x0,2012(s8)
      88:	bfc009bc 	cache	0x0,2492(s8)
      8c:	10910002 	beq	a0,s1,98 <_mem_avail_start-0x7fffff68>
      90:	bfc009bc 	cache	0x0,2492(s8)
      94:	bfc009c4 	cache	0x0,2500(s8)
      98:	108d0002 	beq	a0,t5,a4 <_mem_avail_start-0x7fffff5c>
      9c:	00000000 	nop
      a0:	00000000 	nop
      a4:	bfc007dc 	cache	0x0,2012(s8)
      a8:	bfc009bc 	cache	0x0,2492(s8)
      ac:	14910002 	bne	a0,s1,b8 <_mem_avail_start-0x7fffff48>
      b0:	bfc009bc 	cache	0x0,2492(s8)
      b4:	bfc009c4 	cache	0x0,2500(s8)
      b8:	148d0002 	bne	a0,t5,c4 <_mem_avail_start-0x7fffff3c>
      bc:	00000000 	nop
      c0:	00000000 	nop
      c4:	bfc007dc 	cache	0x0,2012(s8)
      c8:	bfc009bc 	cache	0x0,2492(s8)
      cc:	18910002 	0x18910002
      d0:	bfc009bc 	cache	0x0,2492(s8)
      d4:	bfc009c4 	cache	0x0,2500(s8)
      d8:	188d0002 	0x188d0002
	...
      e4:	bfc007dc 	cache	0x0,2012(s8)
      e8:	bfc009bc 	cache	0x0,2492(s8)
      ec:	1c910002 	0x1c910002
      f0:	bfc009bc 	cache	0x0,2492(s8)
      f4:	bfc009c4 	cache	0x0,2500(s8)
      f8:	1c8d0002 	0x1c8d0002
	...
     104:	bfc007dc 	cache	0x0,2012(s8)
     108:	bfc009bc 	cache	0x0,2492(s8)
     10c:	20910002 	addi	s1,a0,2
     110:	bfc009bc 	cache	0x0,2492(s8)
     114:	bfc009c4 	cache	0x0,2500(s8)
     118:	208d0002 	addi	t5,a0,2
	...
     124:	bfc007dc 	cache	0x0,2012(s8)
     128:	bfc009bc 	cache	0x0,2492(s8)
     12c:	24910002 	addiu	s1,a0,2
     130:	bfc009bc 	cache	0x0,2492(s8)
     134:	bfc009c4 	cache	0x0,2500(s8)
     138:	248d0002 	addiu	t5,a0,2
	...
     144:	bfc007dc 	cache	0x0,2012(s8)
     148:	bfc009bc 	cache	0x0,2492(s8)
     14c:	28910002 	slti	s1,a0,2
     150:	bfc009bc 	cache	0x0,2492(s8)
     154:	bfc009c4 	cache	0x0,2500(s8)
     158:	288d0002 	slti	t5,a0,2
	...
     164:	bfc007dc 	cache	0x0,2012(s8)
     168:	bfc009bc 	cache	0x0,2492(s8)
     16c:	2c910002 	sltiu	s1,a0,2
     170:	bfc009bc 	cache	0x0,2492(s8)
     174:	bfc009c4 	cache	0x0,2500(s8)
     178:	2c8d0002 	sltiu	t5,a0,2
	...
     184:	bfc007dc 	cache	0x0,2012(s8)
     188:	bfc009bc 	cache	0x0,2492(s8)
     18c:	30910002 	andi	s1,a0,0x2
     190:	bfc009bc 	cache	0x0,2492(s8)
     194:	bfc009c4 	cache	0x0,2500(s8)
     198:	308d0002 	andi	t5,a0,0x2
	...
     1a4:	bfc007dc 	cache	0x0,2012(s8)
     1a8:	bfc009bc 	cache	0x0,2492(s8)
     1ac:	34910002 	ori	s1,a0,0x2
     1b0:	bfc009bc 	cache	0x0,2492(s8)
     1b4:	bfc009c4 	cache	0x0,2500(s8)
     1b8:	348d0002 	ori	t5,a0,0x2
	...
     1c4:	bfc007dc 	cache	0x0,2012(s8)
     1c8:	bfc009bc 	cache	0x0,2492(s8)
     1cc:	38910002 	xori	s1,a0,0x2
     1d0:	bfc009bc 	cache	0x0,2492(s8)
     1d4:	bfc009c4 	cache	0x0,2500(s8)
     1d8:	388d0002 	xori	t5,a0,0x2
	...
     1e4:	bfc007dc 	cache	0x0,2012(s8)
     1e8:	bfc009bc 	cache	0x0,2492(s8)
     1ec:	3c910002 	0x3c910002
     1f0:	bfc009bc 	cache	0x0,2492(s8)
     1f4:	bfc009c4 	cache	0x0,2500(s8)
     1f8:	3c8d0002 	0x3c8d0002
	...
     204:	bfc007dc 	cache	0x0,2012(s8)
     208:	bfc009bc 	cache	0x0,2492(s8)
     20c:	c0910003 	ll	s1,3(a0)
     210:	c009bc00 	ll	t1,-17408(zero)
     214:	c009c4bf 	ll	t1,-15169(zero)
     218:	8d0003bf 	lw	zero,959(t0)
     21c:	000000c0 	ehb
     220:	00000000 	nop
     224:	07dc0000 	0x7dc0000
     228:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     22c:	0003bfc0 	sll	s7,v1,0x1f
     230:	bc00c491 	cache	0x0,-15215(zero)
     234:	c4bfc009 	lwc1	$f31,-16375(a1)
     238:	03bfc009 	0x3bfc009
     23c:	00c48d00 	0xc48d00
	...
     248:	bfc007dc 	cache	0x0,2012(s8)
     24c:	bfc009bc 	cache	0x0,2492(s8)
     250:	c8910003 	lwc2	$17,3(a0)
     254:	c009bc00 	ll	t1,-17408(zero)
     258:	c009c4bf 	ll	t1,-15169(zero)
     25c:	8d0003bf 	lw	zero,959(t0)
     260:	000000c8 	0xc8
     264:	00000000 	nop
     268:	07dc0000 	0x7dc0000
     26c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     270:	0003bfc0 	sll	s7,v1,0x1f
     274:	bc00cc91 	cache	0x0,-13167(zero)
     278:	c4bfc009 	lwc1	$f31,-16375(a1)
     27c:	03bfc009 	0x3bfc009
     280:	00cc8d00 	0xcc8d00
	...
     28c:	bfc007dc 	cache	0x0,2012(s8)
     290:	bfc009bc 	cache	0x0,2492(s8)
     294:	d0910003 	0xd0910003
     298:	c009bc00 	ll	t1,-17408(zero)
     29c:	c009c4bf 	ll	t1,-15169(zero)
     2a0:	8d0003bf 	lw	zero,959(t0)
     2a4:	000000d0 	0xd0
     2a8:	00000000 	nop
     2ac:	07dc0000 	0x7dc0000
     2b0:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     2b4:	0003bfc0 	sll	s7,v1,0x1f
     2b8:	bc00d491 	cache	0x0,-11119(zero)
     2bc:	c4bfc009 	lwc1	$f31,-16375(a1)
     2c0:	03bfc009 	0x3bfc009
     2c4:	00d48d00 	0xd48d00
	...
     2d0:	bfc007dc 	cache	0x0,2012(s8)
     2d4:	bfc009bc 	cache	0x0,2492(s8)
     2d8:	d8910003 	ldc2	$17,3(a0)
     2dc:	c009bc00 	ll	t1,-17408(zero)
     2e0:	c009c4bf 	ll	t1,-15169(zero)
     2e4:	8d0003bf 	lw	zero,959(t0)
     2e8:	000000d8 	0xd8
     2ec:	00000000 	nop
     2f0:	07dc0000 	0x7dc0000
     2f4:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     2f8:	0003bfc0 	sll	s7,v1,0x1f
     2fc:	bc00dc91 	cache	0x0,-9071(zero)
     300:	c4bfc009 	lwc1	$f31,-16375(a1)
     304:	03bfc009 	0x3bfc009
     308:	00dc8d00 	0xdc8d00
	...
     314:	bfc007dc 	cache	0x0,2012(s8)
     318:	bfc009bc 	cache	0x0,2492(s8)
     31c:	e0910003 	sc	s1,3(a0)
     320:	c009bc00 	ll	t1,-17408(zero)
     324:	c009c4bf 	ll	t1,-15169(zero)
     328:	8d0003bf 	lw	zero,959(t0)
     32c:	000000e0 	0xe0
     330:	00000000 	nop
     334:	089c0000 	j	2700000 <_mem_avail_start-0x7d900000>
     338:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     33c:	0001bfc0 	sll	s7,at,0x1f
     340:	c009bc60 	ll	t1,-17312(zero)
     344:	c009c3bf 	ll	t1,-15425(zero)
     348:	540001bf 	bnezl	zero,a48 <_mem_avail_start-0x7ffff5b8>
     34c:	bfc009c3 	cache	0x0,2499(s8)
     350:	bfc009c4 	cache	0x0,2500(s8)
     354:	e08d0003 	sc	t5,3(a0)
	...
     360:	c0089c00 	ll	t0,-25600(zero)
     364:	c009b4bf 	ll	t1,-19265(zero)
     368:	610001bf 	0x610001bf
     36c:	bfc009b4 	cache	0x0,2484(s8)
     370:	bfc009bc 	cache	0x0,2492(s8)
     374:	dc910003 	ldc3	$17,3(a0)
     378:	c009bc00 	ll	t1,-17408(zero)
     37c:	c009c4bf 	ll	t1,-15169(zero)
     380:	8d0003bf 	lw	zero,959(t0)
     384:	000000dc 	0xdc
     388:	00000000 	nop
     38c:	089c0000 	j	2700000 <_mem_avail_start-0x7d900000>
     390:	09b0bfc0 	j	6c2ff00 <_mem_avail_start-0x793d0100>
     394:	0001bfc0 	sll	s7,at,0x1f
     398:	c009b062 	ll	t1,-20382(zero)
     39c:	c009bcbf 	ll	t1,-17217(zero)
     3a0:	910003bf 	lbu	zero,959(t0)
     3a4:	09bc00d8 	j	6f00360 <_mem_avail_start-0x790ffca0>
     3a8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     3ac:	0003bfc0 	sll	s7,v1,0x1f
     3b0:	0000d88d 	break	0x0,0x362
     3b4:	00000000 	nop
     3b8:	9c000000 	0x9c000000
     3bc:	acbfc008 	sw	ra,-16376(a1)
     3c0:	01bfc009 	0x1bfc009
     3c4:	09ac6300 	j	6b18c00 <_mem_avail_start-0x794e7400>
     3c8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     3cc:	0003bfc0 	sll	s7,v1,0x1f
     3d0:	bc00d491 	cache	0x0,-11119(zero)
     3d4:	c4bfc009 	lwc1	$f31,-16375(a1)
     3d8:	03bfc009 	0x3bfc009
     3dc:	00d48d00 	0xd48d00
	...
     3e8:	bfc0089c 	cache	0x0,2204(s8)
     3ec:	bfc009a8 	cache	0x0,2472(s8)
     3f0:	a8640001 	swl	a0,1(v1)
     3f4:	bcbfc009 	cache	0x1f,-16375(a1)
     3f8:	03bfc009 	0x3bfc009
     3fc:	00d09100 	0xd09100
     400:	bfc009bc 	cache	0x0,2492(s8)
     404:	bfc009c4 	cache	0x0,2500(s8)
     408:	d08d0003 	0xd08d0003
	...
     414:	c0089c00 	ll	t0,-25600(zero)
     418:	c009a4bf 	ll	t1,-23361(zero)
     41c:	650001bf 	0x650001bf
     420:	bfc009a4 	cache	0x0,2468(s8)
     424:	bfc009bc 	cache	0x0,2492(s8)
     428:	cc910003 	pref	0x11,3(a0)
     42c:	c009bc00 	ll	t1,-17408(zero)
     430:	c009c4bf 	ll	t1,-15169(zero)
     434:	8d0003bf 	lw	zero,959(t0)
     438:	000000cc 	syscall	0x3
     43c:	00000000 	nop
     440:	089c0000 	j	2700000 <_mem_avail_start-0x7d900000>
     444:	09a0bfc0 	j	682ff00 <_mem_avail_start-0x797d0100>
     448:	0001bfc0 	sll	s7,at,0x1f
     44c:	c009a066 	ll	t1,-24474(zero)
     450:	c009bcbf 	ll	t1,-17217(zero)
     454:	910003bf 	lbu	zero,959(t0)
     458:	09bc00c8 	j	6f00320 <_mem_avail_start-0x790ffce0>
     45c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     460:	0003bfc0 	sll	s7,v1,0x1f
     464:	0000c88d 	break	0x0,0x322
     468:	00000000 	nop
     46c:	9c000000 	0x9c000000
     470:	9cbfc008 	0x9cbfc008
     474:	01bfc009 	0x1bfc009
     478:	099c6700 	j	6719c00 <_mem_avail_start-0x798e6400>
     47c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     480:	0003bfc0 	sll	s7,v1,0x1f
     484:	bc00c491 	cache	0x0,-15215(zero)
     488:	c4bfc009 	lwc1	$f31,-16375(a1)
     48c:	03bfc009 	0x3bfc009
     490:	00c48d00 	0xc48d00
	...
     49c:	bfc0089c 	cache	0x0,2204(s8)
     4a0:	bfc00998 	cache	0x0,2456(s8)
     4a4:	986e0001 	lwr	t6,1(v1)
     4a8:	bcbfc009 	cache	0x1f,-16375(a1)
     4ac:	03bfc009 	0x3bfc009
     4b0:	00c09100 	0xc09100
     4b4:	bfc009bc 	cache	0x0,2492(s8)
     4b8:	bfc009c4 	cache	0x0,2500(s8)
     4bc:	c08d0003 	ll	t5,3(a0)
	...
     4c8:	c0089c00 	ll	t0,-25600(zero)
     4cc:	c009bcbf 	ll	t1,-17217(zero)
     4d0:	910003bf 	lbu	zero,959(t0)
     4d4:	09bc7f98 	j	6f1fe60 <_mem_avail_start-0x790e01a0>
     4d8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     4dc:	0003bfc0 	sll	s7,v1,0x1f
     4e0:	007f988d 	break	0x7f,0x262
     4e4:	00000000 	nop
     4e8:	9c000000 	0x9c000000
     4ec:	bcbfc008 	cache	0x1f,-16376(a1)
     4f0:	03bfc009 	0x3bfc009
     4f4:	7f9c9100 	0x7f9c9100
     4f8:	bfc009bc 	cache	0x0,2492(s8)
     4fc:	bfc009c4 	cache	0x0,2500(s8)
     500:	9c8d0003 	0x9c8d0003
     504:	0000007f 	0x7f
     508:	00000000 	nop
     50c:	c0089c00 	ll	t0,-25600(zero)
     510:	c009bcbf 	ll	t1,-17217(zero)
     514:	910003bf 	lbu	zero,959(t0)
     518:	09bc7fa0 	j	6f1fe80 <_mem_avail_start-0x790e0180>
     51c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     520:	0003bfc0 	sll	s7,v1,0x1f
     524:	007fa08d 	break	0x7f,0x282
     528:	00000000 	nop
     52c:	9c000000 	0x9c000000
     530:	bcbfc008 	cache	0x1f,-16376(a1)
     534:	03bfc009 	0x3bfc009
     538:	7fa49100 	0x7fa49100
     53c:	bfc009bc 	cache	0x0,2492(s8)
     540:	bfc009c4 	cache	0x0,2500(s8)
     544:	a48d0003 	sh	t5,3(a0)
     548:	0000007f 	0x7f
     54c:	00000000 	nop
     550:	c0089c00 	ll	t0,-25600(zero)
     554:	c009bcbf 	ll	t1,-17217(zero)
     558:	910003bf 	lbu	zero,959(t0)
     55c:	09bc7fa8 	j	6f1fea0 <_mem_avail_start-0x790e0160>
     560:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     564:	0003bfc0 	sll	s7,v1,0x1f
     568:	007fa88d 	break	0x7f,0x2a2
     56c:	00000000 	nop
     570:	9c000000 	0x9c000000
     574:	bcbfc008 	cache	0x1f,-16376(a1)
     578:	03bfc009 	0x3bfc009
     57c:	7fac9100 	0x7fac9100
     580:	bfc009bc 	cache	0x0,2492(s8)
     584:	bfc009c4 	cache	0x0,2500(s8)
     588:	ac8d0003 	sw	t5,3(a0)
     58c:	0000007f 	0x7f
     590:	00000000 	nop
     594:	c0089c00 	ll	t0,-25600(zero)
     598:	c009bcbf 	ll	t1,-17217(zero)
     59c:	910003bf 	lbu	zero,959(t0)
     5a0:	09bc7fb0 	j	6f1fec0 <_mem_avail_start-0x790e0140>
     5a4:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     5a8:	0003bfc0 	sll	s7,v1,0x1f
     5ac:	007fb08d 	break	0x7f,0x2c2
     5b0:	00000000 	nop
     5b4:	9c000000 	0x9c000000
     5b8:	bcbfc008 	cache	0x1f,-16376(a1)
     5bc:	03bfc009 	0x3bfc009
     5c0:	7fb49100 	0x7fb49100
     5c4:	bfc009bc 	cache	0x0,2492(s8)
     5c8:	bfc009c4 	cache	0x0,2500(s8)
     5cc:	b48d0003 	0xb48d0003
     5d0:	0000007f 	0x7f
     5d4:	00000000 	nop
     5d8:	c0089c00 	ll	t0,-25600(zero)
     5dc:	c009bcbf 	ll	t1,-17217(zero)
     5e0:	910003bf 	lbu	zero,959(t0)
     5e4:	09bc7fb8 	j	6f1fee0 <_mem_avail_start-0x790e0120>
     5e8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     5ec:	0003bfc0 	sll	s7,v1,0x1f
     5f0:	007fb88d 	break	0x7f,0x2e2
     5f4:	00000000 	nop
     5f8:	9c000000 	0x9c000000
     5fc:	bcbfc008 	cache	0x1f,-16376(a1)
     600:	03bfc009 	0x3bfc009
     604:	7fbc9100 	0x7fbc9100
     608:	bfc009bc 	cache	0x0,2492(s8)
     60c:	bfc009c4 	cache	0x0,2500(s8)
     610:	bc8d0003 	cache	0xd,3(a0)
     614:	0000007f 	0x7f
     618:	00000000 	nop
     61c:	c0089c00 	ll	t0,-25600(zero)
     620:	c009bcbf 	ll	t1,-17217(zero)
     624:	910002bf 	lbu	zero,703(t0)
     628:	c009bc40 	ll	t1,-17344(zero)
     62c:	c009c4bf 	ll	t1,-15169(zero)
     630:	8d0002bf 	lw	zero,703(t0)
     634:	00000040 	ssnop
     638:	00000000 	nop
     63c:	c0089c00 	ll	t0,-25600(zero)
     640:	c009bcbf 	ll	t1,-17217(zero)
     644:	910002bf 	lbu	zero,703(t0)
     648:	c009bc44 	ll	t1,-17340(zero)
     64c:	c009c4bf 	ll	t1,-15169(zero)
     650:	8d0002bf 	lw	zero,703(t0)
     654:	00000044 	0x44
     658:	00000000 	nop
     65c:	c0089c00 	ll	t0,-25600(zero)
     660:	c009bcbf 	ll	t1,-17217(zero)
     664:	910002bf 	lbu	zero,703(t0)
     668:	c009bc48 	ll	t1,-17336(zero)
     66c:	c009c4bf 	ll	t1,-15169(zero)
     670:	8d0002bf 	lw	zero,703(t0)
     674:	00000048 	0x48
     678:	00000000 	nop
     67c:	c0089c00 	ll	t0,-25600(zero)
     680:	c009bcbf 	ll	t1,-17217(zero)
     684:	910002bf 	lbu	zero,703(t0)
     688:	c009bc4c 	ll	t1,-17332(zero)
     68c:	c009c4bf 	ll	t1,-15169(zero)
     690:	8d0002bf 	lw	zero,703(t0)
     694:	0000004c 	syscall	0x1
     698:	00000000 	nop
     69c:	c0089c00 	ll	t0,-25600(zero)
     6a0:	c009bcbf 	ll	t1,-17217(zero)
     6a4:	910002bf 	lbu	zero,703(t0)
     6a8:	c009bc50 	ll	t1,-17328(zero)
     6ac:	c009c4bf 	ll	t1,-15169(zero)
     6b0:	8d0002bf 	lw	zero,703(t0)
     6b4:	00000050 	0x50
     6b8:	00000000 	nop
     6bc:	c008a800 	ll	t0,-22528(zero)
     6c0:	c009bcbf 	ll	t1,-17217(zero)
     6c4:	600001bf 	0x600001bf
     6c8:	bfc009bc 	cache	0x0,2492(s8)
     6cc:	bfc009c3 	cache	0x0,2499(s8)
     6d0:	c3540001 	ll	s4,1(k0)
     6d4:	c4bfc009 	lwc1	$f31,-16375(a1)
     6d8:	03bfc009 	0x3bfc009
     6dc:	00e08d00 	0xe08d00
	...
     6e8:	bfc008a8 	cache	0x0,2216(s8)
     6ec:	bfc009b4 	cache	0x0,2484(s8)
     6f0:	b4610001 	0xb4610001
     6f4:	bcbfc009 	cache	0x1f,-16375(a1)
     6f8:	03bfc009 	0x3bfc009
     6fc:	00dc9100 	0xdc9100
     700:	bfc009bc 	cache	0x0,2492(s8)
     704:	bfc009c4 	cache	0x0,2500(s8)
     708:	dc8d0003 	ldc3	$13,3(a0)
	...
     714:	c008a800 	ll	t0,-22528(zero)
     718:	c009b0bf 	ll	t1,-20289(zero)
     71c:	620001bf 	0x620001bf
     720:	bfc009b0 	cache	0x0,2480(s8)
     724:	bfc009bc 	cache	0x0,2492(s8)
     728:	d8910003 	ldc2	$17,3(a0)
     72c:	c009bc00 	ll	t1,-17408(zero)
     730:	c009c4bf 	ll	t1,-15169(zero)
     734:	8d0003bf 	lw	zero,959(t0)
     738:	000000d8 	0xd8
     73c:	00000000 	nop
     740:	08a80000 	j	2a00000 <_mem_avail_start-0x7d600000>
     744:	09acbfc0 	j	6b2ff00 <_mem_avail_start-0x794d0100>
     748:	0001bfc0 	sll	s7,at,0x1f
     74c:	c009ac63 	ll	t1,-21405(zero)
     750:	c009bcbf 	ll	t1,-17217(zero)
     754:	910003bf 	lbu	zero,959(t0)
     758:	09bc00d4 	j	6f00350 <_mem_avail_start-0x790ffcb0>
     75c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     760:	0003bfc0 	sll	s7,v1,0x1f
     764:	0000d48d 	break	0x0,0x352
     768:	00000000 	nop
     76c:	a8000000 	swl	zero,0(zero)
     770:	a8bfc008 	swl	ra,-16376(a1)
     774:	01bfc009 	0x1bfc009
     778:	09a86400 	j	6a19000 <_mem_avail_start-0x795e7000>
     77c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     780:	0003bfc0 	sll	s7,v1,0x1f
     784:	bc00d091 	cache	0x0,-12143(zero)
     788:	c4bfc009 	lwc1	$f31,-16375(a1)
     78c:	03bfc009 	0x3bfc009
     790:	00d08d00 	0xd08d00
	...
     79c:	bfc008a8 	cache	0x0,2216(s8)
     7a0:	bfc009a4 	cache	0x0,2468(s8)
     7a4:	a4650001 	sh	a1,1(v1)
     7a8:	bcbfc009 	cache	0x1f,-16375(a1)
     7ac:	03bfc009 	0x3bfc009
     7b0:	00cc9100 	0xcc9100
     7b4:	bfc009bc 	cache	0x0,2492(s8)
     7b8:	bfc009c4 	cache	0x0,2500(s8)
     7bc:	cc8d0003 	pref	0xd,3(a0)
	...
     7c8:	c008a800 	ll	t0,-22528(zero)
     7cc:	c009a0bf 	ll	t1,-24385(zero)
     7d0:	660001bf 	0x660001bf
     7d4:	bfc009a0 	cache	0x0,2464(s8)
     7d8:	bfc009bc 	cache	0x0,2492(s8)
     7dc:	c8910003 	lwc2	$17,3(a0)
     7e0:	c009bc00 	ll	t1,-17408(zero)
     7e4:	c009c4bf 	ll	t1,-15169(zero)
     7e8:	8d0003bf 	lw	zero,959(t0)
     7ec:	000000c8 	0xc8
     7f0:	00000000 	nop
     7f4:	08a80000 	j	2a00000 <_mem_avail_start-0x7d600000>
     7f8:	099cbfc0 	j	672ff00 <_mem_avail_start-0x798d0100>
     7fc:	0001bfc0 	sll	s7,at,0x1f
     800:	c0099c67 	ll	t1,-25497(zero)
     804:	c009bcbf 	ll	t1,-17217(zero)
     808:	910003bf 	lbu	zero,959(t0)
     80c:	09bc00c4 	j	6f00310 <_mem_avail_start-0x790ffcf0>
     810:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     814:	0003bfc0 	sll	s7,v1,0x1f
     818:	0000c48d 	break	0x0,0x312
     81c:	00000000 	nop
     820:	a8000000 	swl	zero,0(zero)
     824:	98bfc008 	lwr	ra,-16376(a1)
     828:	01bfc009 	0x1bfc009
     82c:	09986e00 	j	661b800 <_mem_avail_start-0x799e4800>
     830:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     834:	0003bfc0 	sll	s7,v1,0x1f
     838:	bc00c091 	cache	0x0,-16239(zero)
     83c:	c4bfc009 	lwc1	$f31,-16375(a1)
     840:	03bfc009 	0x3bfc009
     844:	00c08d00 	0xc08d00
	...
     850:	bfc008a8 	cache	0x0,2216(s8)
     854:	bfc009bc 	cache	0x0,2492(s8)
     858:	98910003 	lwr	s1,3(a0)
     85c:	c009bc7f 	ll	t1,-17281(zero)
     860:	c009c4bf 	ll	t1,-15169(zero)
     864:	8d0003bf 	lw	zero,959(t0)
     868:	00007f98 	0x7f98
     86c:	00000000 	nop
     870:	08a80000 	j	2a00000 <_mem_avail_start-0x7d600000>
     874:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     878:	0003bfc0 	sll	s7,v1,0x1f
     87c:	bc7f9c91 	cache	0x1f,-25455(v1)
     880:	c4bfc009 	lwc1	$f31,-16375(a1)
     884:	03bfc009 	0x3bfc009
     888:	7f9c8d00 	0x7f9c8d00
	...
     894:	bfc008a8 	cache	0x0,2216(s8)
     898:	bfc009bc 	cache	0x0,2492(s8)
     89c:	a0910003 	sb	s1,3(a0)
     8a0:	c009bc7f 	ll	t1,-17281(zero)
     8a4:	c009c4bf 	ll	t1,-15169(zero)
     8a8:	8d0003bf 	lw	zero,959(t0)
     8ac:	00007fa0 	0x7fa0
     8b0:	00000000 	nop
     8b4:	08a80000 	j	2a00000 <_mem_avail_start-0x7d600000>
     8b8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     8bc:	0003bfc0 	sll	s7,v1,0x1f
     8c0:	bc7fa491 	cache	0x1f,-23407(v1)
     8c4:	c4bfc009 	lwc1	$f31,-16375(a1)
     8c8:	03bfc009 	0x3bfc009
     8cc:	7fa48d00 	0x7fa48d00
	...
     8d8:	bfc008a8 	cache	0x0,2216(s8)
     8dc:	bfc009bc 	cache	0x0,2492(s8)
     8e0:	a8910003 	swl	s1,3(a0)
     8e4:	c009bc7f 	ll	t1,-17281(zero)
     8e8:	c009c4bf 	ll	t1,-15169(zero)
     8ec:	8d0003bf 	lw	zero,959(t0)
     8f0:	00007fa8 	0x7fa8
     8f4:	00000000 	nop
     8f8:	08a80000 	j	2a00000 <_mem_avail_start-0x7d600000>
     8fc:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     900:	0003bfc0 	sll	s7,v1,0x1f
     904:	bc7fac91 	cache	0x1f,-21359(v1)
     908:	c4bfc009 	lwc1	$f31,-16375(a1)
     90c:	03bfc009 	0x3bfc009
     910:	7fac8d00 	0x7fac8d00
	...
     91c:	bfc008a8 	cache	0x0,2216(s8)
     920:	bfc009bc 	cache	0x0,2492(s8)
     924:	b0910003 	0xb0910003
     928:	c009bc7f 	ll	t1,-17281(zero)
     92c:	c009c4bf 	ll	t1,-15169(zero)
     930:	8d0003bf 	lw	zero,959(t0)
     934:	00007fb0 	tge	zero,zero,0x1fe
     938:	00000000 	nop
     93c:	08a80000 	j	2a00000 <_mem_avail_start-0x7d600000>
     940:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     944:	0003bfc0 	sll	s7,v1,0x1f
     948:	bc7fb491 	cache	0x1f,-19311(v1)
     94c:	c4bfc009 	lwc1	$f31,-16375(a1)
     950:	03bfc009 	0x3bfc009
     954:	7fb48d00 	0x7fb48d00
	...
     960:	bfc008a8 	cache	0x0,2216(s8)
     964:	bfc009bc 	cache	0x0,2492(s8)
     968:	b8910003 	swr	s1,3(a0)
     96c:	c009bc7f 	ll	t1,-17281(zero)
     970:	c009c4bf 	ll	t1,-15169(zero)
     974:	8d0003bf 	lw	zero,959(t0)
     978:	00007fb8 	0x7fb8
     97c:	00000000 	nop
     980:	08a80000 	j	2a00000 <_mem_avail_start-0x7d600000>
     984:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     988:	0003bfc0 	sll	s7,v1,0x1f
     98c:	bc7fbc91 	cache	0x1f,-17263(v1)
     990:	c4bfc009 	lwc1	$f31,-16375(a1)
     994:	03bfc009 	0x3bfc009
     998:	7fbc8d00 	0x7fbc8d00
	...
     9a4:	bfc008a8 	cache	0x0,2216(s8)
     9a8:	bfc009bc 	cache	0x0,2492(s8)
     9ac:	40910002 	mtc0	s1,$0,2
     9b0:	bfc009bc 	cache	0x0,2492(s8)
     9b4:	bfc009c4 	cache	0x0,2500(s8)
     9b8:	408d0002 	mtc0	t5,$0,2
	...
     9c4:	bfc008a8 	cache	0x0,2216(s8)
     9c8:	bfc009bc 	cache	0x0,2492(s8)
     9cc:	44910002 	0x44910002
     9d0:	bfc009bc 	cache	0x0,2492(s8)
     9d4:	bfc009c4 	cache	0x0,2500(s8)
     9d8:	448d0002 	0x448d0002
	...
     9e4:	bfc008a8 	cache	0x0,2216(s8)
     9e8:	bfc009bc 	cache	0x0,2492(s8)
     9ec:	48910002 	mtc2	s1,$0,2
     9f0:	bfc009bc 	cache	0x0,2492(s8)
     9f4:	bfc009c4 	cache	0x0,2500(s8)
     9f8:	488d0002 	mtc2	t5,$0,2
	...
     a04:	bfc008a8 	cache	0x0,2216(s8)
     a08:	bfc009bc 	cache	0x0,2492(s8)
     a0c:	4c910002 	mtc3	s1,$0,2
     a10:	bfc009bc 	cache	0x0,2492(s8)
     a14:	bfc009c4 	cache	0x0,2500(s8)
     a18:	4c8d0002 	mtc3	t5,$0,2
	...
     a24:	bfc008b4 	cache	0x0,2228(s8)
     a28:	bfc009bc 	cache	0x0,2492(s8)
     a2c:	bc600001 	cache	0x0,1(v1)
     a30:	c3bfc009 	ll	ra,-16375(sp)
     a34:	01bfc009 	0x1bfc009
     a38:	09c35400 	j	70d5000 <_mem_avail_start-0x78f2b000>
     a3c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     a40:	0003bfc0 	sll	s7,v1,0x1f
     a44:	0000e08d 	break	0x0,0x382
     a48:	00000000 	nop
     a4c:	b4000000 	0xb4000000
     a50:	b4bfc008 	0xb4bfc008
     a54:	01bfc009 	0x1bfc009
     a58:	09b46100 	j	6d18400 <_mem_avail_start-0x792e7c00>
     a5c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     a60:	0003bfc0 	sll	s7,v1,0x1f
     a64:	bc00dc91 	cache	0x0,-9071(zero)
     a68:	c4bfc009 	lwc1	$f31,-16375(a1)
     a6c:	03bfc009 	0x3bfc009
     a70:	00dc8d00 	0xdc8d00
	...
     a7c:	bfc008b4 	cache	0x0,2228(s8)
     a80:	bfc009b0 	cache	0x0,2480(s8)
     a84:	b0620001 	0xb0620001
     a88:	bcbfc009 	cache	0x1f,-16375(a1)
     a8c:	03bfc009 	0x3bfc009
     a90:	00d89100 	0xd89100
     a94:	bfc009bc 	cache	0x0,2492(s8)
     a98:	bfc009c4 	cache	0x0,2500(s8)
     a9c:	d88d0003 	ldc2	$13,3(a0)
	...
     aa8:	c008b400 	ll	t0,-19456(zero)
     aac:	c009acbf 	ll	t1,-21313(zero)
     ab0:	630001bf 	0x630001bf
     ab4:	bfc009ac 	cache	0x0,2476(s8)
     ab8:	bfc009bc 	cache	0x0,2492(s8)
     abc:	d4910003 	ldc1	$f17,3(a0)
     ac0:	c009bc00 	ll	t1,-17408(zero)
     ac4:	c009c4bf 	ll	t1,-15169(zero)
     ac8:	8d0003bf 	lw	zero,959(t0)
     acc:	000000d4 	0xd4
     ad0:	00000000 	nop
     ad4:	08b40000 	j	2d00000 <_mem_avail_start-0x7d300000>
     ad8:	09a8bfc0 	j	6a2ff00 <_mem_avail_start-0x795d0100>
     adc:	0001bfc0 	sll	s7,at,0x1f
     ae0:	c009a864 	ll	t1,-22428(zero)
     ae4:	c009bcbf 	ll	t1,-17217(zero)
     ae8:	910003bf 	lbu	zero,959(t0)
     aec:	09bc00d0 	j	6f00340 <_mem_avail_start-0x790ffcc0>
     af0:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     af4:	0003bfc0 	sll	s7,v1,0x1f
     af8:	0000d08d 	break	0x0,0x342
     afc:	00000000 	nop
     b00:	b4000000 	0xb4000000
     b04:	a4bfc008 	sh	ra,-16376(a1)
     b08:	01bfc009 	0x1bfc009
     b0c:	09a46500 	j	6919400 <_mem_avail_start-0x796e6c00>
     b10:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     b14:	0003bfc0 	sll	s7,v1,0x1f
     b18:	bc00cc91 	cache	0x0,-13167(zero)
     b1c:	c4bfc009 	lwc1	$f31,-16375(a1)
     b20:	03bfc009 	0x3bfc009
     b24:	00cc8d00 	0xcc8d00
	...
     b30:	bfc008b4 	cache	0x0,2228(s8)
     b34:	bfc009a0 	cache	0x0,2464(s8)
     b38:	a0660001 	sb	a2,1(v1)
     b3c:	bcbfc009 	cache	0x1f,-16375(a1)
     b40:	03bfc009 	0x3bfc009
     b44:	00c89100 	0xc89100
     b48:	bfc009bc 	cache	0x0,2492(s8)
     b4c:	bfc009c4 	cache	0x0,2500(s8)
     b50:	c88d0003 	lwc2	$13,3(a0)
	...
     b5c:	c008b400 	ll	t0,-19456(zero)
     b60:	c0099cbf 	ll	t1,-25409(zero)
     b64:	670001bf 	0x670001bf
     b68:	bfc0099c 	cache	0x0,2460(s8)
     b6c:	bfc009bc 	cache	0x0,2492(s8)
     b70:	c4910003 	lwc1	$f17,3(a0)
     b74:	c009bc00 	ll	t1,-17408(zero)
     b78:	c009c4bf 	ll	t1,-15169(zero)
     b7c:	8d0003bf 	lw	zero,959(t0)
     b80:	000000c4 	0xc4
     b84:	00000000 	nop
     b88:	08b40000 	j	2d00000 <_mem_avail_start-0x7d300000>
     b8c:	0998bfc0 	j	662ff00 <_mem_avail_start-0x799d0100>
     b90:	0001bfc0 	sll	s7,at,0x1f
     b94:	c009986e 	ll	t1,-26514(zero)
     b98:	c009bcbf 	ll	t1,-17217(zero)
     b9c:	910003bf 	lbu	zero,959(t0)
     ba0:	09bc00c0 	j	6f00300 <_mem_avail_start-0x790ffd00>
     ba4:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     ba8:	0003bfc0 	sll	s7,v1,0x1f
     bac:	0000c08d 	break	0x0,0x302
     bb0:	00000000 	nop
     bb4:	b4000000 	0xb4000000
     bb8:	bcbfc008 	cache	0x1f,-16376(a1)
     bbc:	03bfc009 	0x3bfc009
     bc0:	7f989100 	0x7f989100
     bc4:	bfc009bc 	cache	0x0,2492(s8)
     bc8:	bfc009c4 	cache	0x0,2500(s8)
     bcc:	988d0003 	lwr	t5,3(a0)
     bd0:	0000007f 	0x7f
     bd4:	00000000 	nop
     bd8:	c008b400 	ll	t0,-19456(zero)
     bdc:	c009bcbf 	ll	t1,-17217(zero)
     be0:	910003bf 	lbu	zero,959(t0)
     be4:	09bc7f9c 	j	6f1fe70 <_mem_avail_start-0x790e0190>
     be8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     bec:	0003bfc0 	sll	s7,v1,0x1f
     bf0:	007f9c8d 	break	0x7f,0x272
     bf4:	00000000 	nop
     bf8:	b4000000 	0xb4000000
     bfc:	bcbfc008 	cache	0x1f,-16376(a1)
     c00:	03bfc009 	0x3bfc009
     c04:	7fa09100 	0x7fa09100
     c08:	bfc009bc 	cache	0x0,2492(s8)
     c0c:	bfc009c4 	cache	0x0,2500(s8)
     c10:	a08d0003 	sb	t5,3(a0)
     c14:	0000007f 	0x7f
     c18:	00000000 	nop
     c1c:	c008b400 	ll	t0,-19456(zero)
     c20:	c009bcbf 	ll	t1,-17217(zero)
     c24:	910003bf 	lbu	zero,959(t0)
     c28:	09bc7fa4 	j	6f1fe90 <_mem_avail_start-0x790e0170>
     c2c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     c30:	0003bfc0 	sll	s7,v1,0x1f
     c34:	007fa48d 	break	0x7f,0x292
     c38:	00000000 	nop
     c3c:	b4000000 	0xb4000000
     c40:	bcbfc008 	cache	0x1f,-16376(a1)
     c44:	03bfc009 	0x3bfc009
     c48:	7fa89100 	0x7fa89100
     c4c:	bfc009bc 	cache	0x0,2492(s8)
     c50:	bfc009c4 	cache	0x0,2500(s8)
     c54:	a88d0003 	swl	t5,3(a0)
     c58:	0000007f 	0x7f
     c5c:	00000000 	nop
     c60:	c008b400 	ll	t0,-19456(zero)
     c64:	c009bcbf 	ll	t1,-17217(zero)
     c68:	910003bf 	lbu	zero,959(t0)
     c6c:	09bc7fac 	j	6f1feb0 <_mem_avail_start-0x790e0150>
     c70:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     c74:	0003bfc0 	sll	s7,v1,0x1f
     c78:	007fac8d 	break	0x7f,0x2b2
     c7c:	00000000 	nop
     c80:	b4000000 	0xb4000000
     c84:	bcbfc008 	cache	0x1f,-16376(a1)
     c88:	03bfc009 	0x3bfc009
     c8c:	7fb09100 	0x7fb09100
     c90:	bfc009bc 	cache	0x0,2492(s8)
     c94:	bfc009c4 	cache	0x0,2500(s8)
     c98:	b08d0003 	0xb08d0003
     c9c:	0000007f 	0x7f
     ca0:	00000000 	nop
     ca4:	c008b400 	ll	t0,-19456(zero)
     ca8:	c009bcbf 	ll	t1,-17217(zero)
     cac:	910003bf 	lbu	zero,959(t0)
     cb0:	09bc7fb4 	j	6f1fed0 <_mem_avail_start-0x790e0130>
     cb4:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     cb8:	0003bfc0 	sll	s7,v1,0x1f
     cbc:	007fb48d 	break	0x7f,0x2d2
     cc0:	00000000 	nop
     cc4:	b4000000 	0xb4000000
     cc8:	bcbfc008 	cache	0x1f,-16376(a1)
     ccc:	03bfc009 	0x3bfc009
     cd0:	7fb89100 	0x7fb89100
     cd4:	bfc009bc 	cache	0x0,2492(s8)
     cd8:	bfc009c4 	cache	0x0,2500(s8)
     cdc:	b88d0003 	swr	t5,3(a0)
     ce0:	0000007f 	0x7f
     ce4:	00000000 	nop
     ce8:	c008b400 	ll	t0,-19456(zero)
     cec:	c009bcbf 	ll	t1,-17217(zero)
     cf0:	910003bf 	lbu	zero,959(t0)
     cf4:	09bc7fbc 	j	6f1fef0 <_mem_avail_start-0x790e0110>
     cf8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     cfc:	0003bfc0 	sll	s7,v1,0x1f
     d00:	007fbc8d 	break	0x7f,0x2f2
     d04:	00000000 	nop
     d08:	b4000000 	0xb4000000
     d0c:	bcbfc008 	cache	0x1f,-16376(a1)
     d10:	02bfc009 	0x2bfc009
     d14:	bc409100 	cache	0x0,-28416(v0)
     d18:	c4bfc009 	lwc1	$f31,-16375(a1)
     d1c:	02bfc009 	0x2bfc009
     d20:	00408d00 	0x408d00
     d24:	00000000 	nop
     d28:	b4000000 	0xb4000000
     d2c:	bcbfc008 	cache	0x1f,-16376(a1)
     d30:	02bfc009 	0x2bfc009
     d34:	bc449100 	cache	0x4,-28416(v0)
     d38:	c4bfc009 	lwc1	$f31,-16375(a1)
     d3c:	02bfc009 	0x2bfc009
     d40:	00448d00 	0x448d00
     d44:	00000000 	nop
     d48:	b4000000 	0xb4000000
     d4c:	bcbfc008 	cache	0x1f,-16376(a1)
     d50:	02bfc009 	0x2bfc009
     d54:	bc489100 	cache	0x8,-28416(v0)
     d58:	c4bfc009 	lwc1	$f31,-16375(a1)
     d5c:	02bfc009 	0x2bfc009
     d60:	00488d00 	0x488d00
     d64:	00000000 	nop
     d68:	c0000000 	ll	zero,0(zero)
     d6c:	bcbfc008 	cache	0x1f,-16376(a1)
     d70:	01bfc009 	0x1bfc009
     d74:	09bc6000 	j	6f18000 <_mem_avail_start-0x790e8000>
     d78:	09c3bfc0 	j	70eff00 <_mem_avail_start-0x78f10100>
     d7c:	0001bfc0 	sll	s7,at,0x1f
     d80:	c009c354 	ll	t1,-15532(zero)
     d84:	c009c4bf 	ll	t1,-15169(zero)
     d88:	8d0003bf 	lw	zero,959(t0)
     d8c:	000000e0 	0xe0
     d90:	00000000 	nop
     d94:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
     d98:	09b4bfc0 	j	6d2ff00 <_mem_avail_start-0x792d0100>
     d9c:	0001bfc0 	sll	s7,at,0x1f
     da0:	c009b461 	ll	t1,-19359(zero)
     da4:	c009bcbf 	ll	t1,-17217(zero)
     da8:	910003bf 	lbu	zero,959(t0)
     dac:	09bc00dc 	j	6f00370 <_mem_avail_start-0x790ffc90>
     db0:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     db4:	0003bfc0 	sll	s7,v1,0x1f
     db8:	0000dc8d 	break	0x0,0x372
     dbc:	00000000 	nop
     dc0:	c0000000 	ll	zero,0(zero)
     dc4:	b0bfc008 	0xb0bfc008
     dc8:	01bfc009 	0x1bfc009
     dcc:	09b06200 	j	6c18800 <_mem_avail_start-0x793e7800>
     dd0:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     dd4:	0003bfc0 	sll	s7,v1,0x1f
     dd8:	bc00d891 	cache	0x0,-10095(zero)
     ddc:	c4bfc009 	lwc1	$f31,-16375(a1)
     de0:	03bfc009 	0x3bfc009
     de4:	00d88d00 	0xd88d00
	...
     df0:	bfc008c0 	cache	0x0,2240(s8)
     df4:	bfc009ac 	cache	0x0,2476(s8)
     df8:	ac630001 	sw	v1,1(v1)
     dfc:	bcbfc009 	cache	0x1f,-16375(a1)
     e00:	03bfc009 	0x3bfc009
     e04:	00d49100 	0xd49100
     e08:	bfc009bc 	cache	0x0,2492(s8)
     e0c:	bfc009c4 	cache	0x0,2500(s8)
     e10:	d48d0003 	ldc1	$f13,3(a0)
	...
     e1c:	c008c000 	ll	t0,-16384(zero)
     e20:	c009a8bf 	ll	t1,-22337(zero)
     e24:	640001bf 	0x640001bf
     e28:	bfc009a8 	cache	0x0,2472(s8)
     e2c:	bfc009bc 	cache	0x0,2492(s8)
     e30:	d0910003 	0xd0910003
     e34:	c009bc00 	ll	t1,-17408(zero)
     e38:	c009c4bf 	ll	t1,-15169(zero)
     e3c:	8d0003bf 	lw	zero,959(t0)
     e40:	000000d0 	0xd0
     e44:	00000000 	nop
     e48:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
     e4c:	09a4bfc0 	j	692ff00 <_mem_avail_start-0x796d0100>
     e50:	0001bfc0 	sll	s7,at,0x1f
     e54:	c009a465 	ll	t1,-23451(zero)
     e58:	c009bcbf 	ll	t1,-17217(zero)
     e5c:	910003bf 	lbu	zero,959(t0)
     e60:	09bc00cc 	j	6f00330 <_mem_avail_start-0x790ffcd0>
     e64:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
     e68:	0003bfc0 	sll	s7,v1,0x1f
     e6c:	0000cc8d 	break	0x0,0x332
     e70:	00000000 	nop
     e74:	c0000000 	ll	zero,0(zero)
     e78:	a0bfc008 	sb	ra,-16376(a1)
     e7c:	01bfc009 	0x1bfc009
     e80:	09a06600 	j	6819800 <_mem_avail_start-0x797e6800>
     e84:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     e88:	0003bfc0 	sll	s7,v1,0x1f
     e8c:	bc00c891 	cache	0x0,-14191(zero)
     e90:	c4bfc009 	lwc1	$f31,-16375(a1)
     e94:	03bfc009 	0x3bfc009
     e98:	00c88d00 	0xc88d00
	...
     ea4:	bfc008c0 	cache	0x0,2240(s8)
     ea8:	bfc0099c 	cache	0x0,2460(s8)
     eac:	9c670001 	0x9c670001
     eb0:	bcbfc009 	cache	0x1f,-16375(a1)
     eb4:	03bfc009 	0x3bfc009
     eb8:	00c49100 	0xc49100
     ebc:	bfc009bc 	cache	0x0,2492(s8)
     ec0:	bfc009c4 	cache	0x0,2500(s8)
     ec4:	c48d0003 	lwc1	$f13,3(a0)
	...
     ed0:	c008c000 	ll	t0,-16384(zero)
     ed4:	c00998bf 	ll	t1,-26433(zero)
     ed8:	6e0001bf 	0x6e0001bf
     edc:	bfc00998 	cache	0x0,2456(s8)
     ee0:	bfc009bc 	cache	0x0,2492(s8)
     ee4:	c0910003 	ll	s1,3(a0)
     ee8:	c009bc00 	ll	t1,-17408(zero)
     eec:	c009c4bf 	ll	t1,-15169(zero)
     ef0:	8d0003bf 	lw	zero,959(t0)
     ef4:	000000c0 	ehb
     ef8:	00000000 	nop
     efc:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
     f00:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     f04:	0003bfc0 	sll	s7,v1,0x1f
     f08:	bc7f9891 	cache	0x1f,-26479(v1)
     f0c:	c4bfc009 	lwc1	$f31,-16375(a1)
     f10:	03bfc009 	0x3bfc009
     f14:	7f988d00 	0x7f988d00
	...
     f20:	bfc008c0 	cache	0x0,2240(s8)
     f24:	bfc009bc 	cache	0x0,2492(s8)
     f28:	9c910003 	0x9c910003
     f2c:	c009bc7f 	ll	t1,-17281(zero)
     f30:	c009c4bf 	ll	t1,-15169(zero)
     f34:	8d0003bf 	lw	zero,959(t0)
     f38:	00007f9c 	0x7f9c
     f3c:	00000000 	nop
     f40:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
     f44:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     f48:	0003bfc0 	sll	s7,v1,0x1f
     f4c:	bc7fa091 	cache	0x1f,-24431(v1)
     f50:	c4bfc009 	lwc1	$f31,-16375(a1)
     f54:	03bfc009 	0x3bfc009
     f58:	7fa08d00 	0x7fa08d00
	...
     f64:	bfc008c0 	cache	0x0,2240(s8)
     f68:	bfc009bc 	cache	0x0,2492(s8)
     f6c:	a4910003 	sh	s1,3(a0)
     f70:	c009bc7f 	ll	t1,-17281(zero)
     f74:	c009c4bf 	ll	t1,-15169(zero)
     f78:	8d0003bf 	lw	zero,959(t0)
     f7c:	00007fa4 	0x7fa4
     f80:	00000000 	nop
     f84:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
     f88:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     f8c:	0003bfc0 	sll	s7,v1,0x1f
     f90:	bc7fa891 	cache	0x1f,-22383(v1)
     f94:	c4bfc009 	lwc1	$f31,-16375(a1)
     f98:	03bfc009 	0x3bfc009
     f9c:	7fa88d00 	0x7fa88d00
	...
     fa8:	bfc008c0 	cache	0x0,2240(s8)
     fac:	bfc009bc 	cache	0x0,2492(s8)
     fb0:	ac910003 	sw	s1,3(a0)
     fb4:	c009bc7f 	ll	t1,-17281(zero)
     fb8:	c009c4bf 	ll	t1,-15169(zero)
     fbc:	8d0003bf 	lw	zero,959(t0)
     fc0:	00007fac 	0x7fac
     fc4:	00000000 	nop
     fc8:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
     fcc:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
     fd0:	0003bfc0 	sll	s7,v1,0x1f
     fd4:	bc7fb091 	cache	0x1f,-20335(v1)
     fd8:	c4bfc009 	lwc1	$f31,-16375(a1)
     fdc:	03bfc009 	0x3bfc009
     fe0:	7fb08d00 	0x7fb08d00
	...
     fec:	bfc008c0 	cache	0x0,2240(s8)
     ff0:	bfc009bc 	cache	0x0,2492(s8)
     ff4:	b4910003 	0xb4910003
     ff8:	c009bc7f 	ll	t1,-17281(zero)
     ffc:	c009c4bf 	ll	t1,-15169(zero)
    1000:	8d0003bf 	lw	zero,959(t0)
    1004:	00007fb4 	teq	zero,zero,0x1fe
    1008:	00000000 	nop
    100c:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
    1010:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1014:	0003bfc0 	sll	s7,v1,0x1f
    1018:	bc7fb891 	cache	0x1f,-18287(v1)
    101c:	c4bfc009 	lwc1	$f31,-16375(a1)
    1020:	03bfc009 	0x3bfc009
    1024:	7fb88d00 	0x7fb88d00
	...
    1030:	bfc008c0 	cache	0x0,2240(s8)
    1034:	bfc009bc 	cache	0x0,2492(s8)
    1038:	bc910003 	cache	0x11,3(a0)
    103c:	c009bc7f 	ll	t1,-17281(zero)
    1040:	c009c4bf 	ll	t1,-15169(zero)
    1044:	8d0003bf 	lw	zero,959(t0)
    1048:	00007fbc 	0x7fbc
    104c:	00000000 	nop
    1050:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
    1054:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1058:	0002bfc0 	sll	s7,v0,0x1f
    105c:	09bc4091 	j	6f10244 <_mem_avail_start-0x790efdbc>
    1060:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1064:	0002bfc0 	sll	s7,v0,0x1f
    1068:	0000408d 	break	0x0,0x102
    106c:	00000000 	nop
    1070:	08c00000 	j	3000000 <_mem_avail_start-0x7d000000>
    1074:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1078:	0002bfc0 	sll	s7,v0,0x1f
    107c:	09bc4491 	j	6f11244 <_mem_avail_start-0x790eedbc>
    1080:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1084:	0002bfc0 	sll	s7,v0,0x1f
    1088:	0000448d 	break	0x0,0x112
    108c:	00000000 	nop
    1090:	08cc0000 	j	3300000 <_mem_avail_start-0x7cd00000>
    1094:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1098:	0001bfc0 	sll	s7,at,0x1f
    109c:	c009bc60 	ll	t1,-17312(zero)
    10a0:	c009c3bf 	ll	t1,-15425(zero)
    10a4:	540001bf 	bnezl	zero,17a4 <_mem_avail_start-0x7fffe85c>
    10a8:	bfc009c3 	cache	0x0,2499(s8)
    10ac:	bfc009c4 	cache	0x0,2500(s8)
    10b0:	e08d0003 	sc	t5,3(a0)
	...
    10bc:	c008cc00 	ll	t0,-13312(zero)
    10c0:	c009b4bf 	ll	t1,-19265(zero)
    10c4:	610001bf 	0x610001bf
    10c8:	bfc009b4 	cache	0x0,2484(s8)
    10cc:	bfc009bc 	cache	0x0,2492(s8)
    10d0:	dc910003 	ldc3	$17,3(a0)
    10d4:	c009bc00 	ll	t1,-17408(zero)
    10d8:	c009c4bf 	ll	t1,-15169(zero)
    10dc:	8d0003bf 	lw	zero,959(t0)
    10e0:	000000dc 	0xdc
    10e4:	00000000 	nop
    10e8:	08cc0000 	j	3300000 <_mem_avail_start-0x7cd00000>
    10ec:	09b0bfc0 	j	6c2ff00 <_mem_avail_start-0x793d0100>
    10f0:	0001bfc0 	sll	s7,at,0x1f
    10f4:	c009b062 	ll	t1,-20382(zero)
    10f8:	c009bcbf 	ll	t1,-17217(zero)
    10fc:	910003bf 	lbu	zero,959(t0)
    1100:	09bc00d8 	j	6f00360 <_mem_avail_start-0x790ffca0>
    1104:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1108:	0003bfc0 	sll	s7,v1,0x1f
    110c:	0000d88d 	break	0x0,0x362
    1110:	00000000 	nop
    1114:	cc000000 	pref	0x0,0(zero)
    1118:	acbfc008 	sw	ra,-16376(a1)
    111c:	01bfc009 	0x1bfc009
    1120:	09ac6300 	j	6b18c00 <_mem_avail_start-0x794e7400>
    1124:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1128:	0003bfc0 	sll	s7,v1,0x1f
    112c:	bc00d491 	cache	0x0,-11119(zero)
    1130:	c4bfc009 	lwc1	$f31,-16375(a1)
    1134:	03bfc009 	0x3bfc009
    1138:	00d48d00 	0xd48d00
	...
    1144:	bfc008cc 	cache	0x0,2252(s8)
    1148:	bfc009a8 	cache	0x0,2472(s8)
    114c:	a8640001 	swl	a0,1(v1)
    1150:	bcbfc009 	cache	0x1f,-16375(a1)
    1154:	03bfc009 	0x3bfc009
    1158:	00d09100 	0xd09100
    115c:	bfc009bc 	cache	0x0,2492(s8)
    1160:	bfc009c4 	cache	0x0,2500(s8)
    1164:	d08d0003 	0xd08d0003
	...
    1170:	c008cc00 	ll	t0,-13312(zero)
    1174:	c009a4bf 	ll	t1,-23361(zero)
    1178:	650001bf 	0x650001bf
    117c:	bfc009a4 	cache	0x0,2468(s8)
    1180:	bfc009bc 	cache	0x0,2492(s8)
    1184:	cc910003 	pref	0x11,3(a0)
    1188:	c009bc00 	ll	t1,-17408(zero)
    118c:	c009c4bf 	ll	t1,-15169(zero)
    1190:	8d0003bf 	lw	zero,959(t0)
    1194:	000000cc 	syscall	0x3
    1198:	00000000 	nop
    119c:	08cc0000 	j	3300000 <_mem_avail_start-0x7cd00000>
    11a0:	09a0bfc0 	j	682ff00 <_mem_avail_start-0x797d0100>
    11a4:	0001bfc0 	sll	s7,at,0x1f
    11a8:	c009a066 	ll	t1,-24474(zero)
    11ac:	c009bcbf 	ll	t1,-17217(zero)
    11b0:	910003bf 	lbu	zero,959(t0)
    11b4:	09bc00c8 	j	6f00320 <_mem_avail_start-0x790ffce0>
    11b8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    11bc:	0003bfc0 	sll	s7,v1,0x1f
    11c0:	0000c88d 	break	0x0,0x322
    11c4:	00000000 	nop
    11c8:	cc000000 	pref	0x0,0(zero)
    11cc:	9cbfc008 	0x9cbfc008
    11d0:	01bfc009 	0x1bfc009
    11d4:	099c6700 	j	6719c00 <_mem_avail_start-0x798e6400>
    11d8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    11dc:	0003bfc0 	sll	s7,v1,0x1f
    11e0:	bc00c491 	cache	0x0,-15215(zero)
    11e4:	c4bfc009 	lwc1	$f31,-16375(a1)
    11e8:	03bfc009 	0x3bfc009
    11ec:	00c48d00 	0xc48d00
	...
    11f8:	bfc008cc 	cache	0x0,2252(s8)
    11fc:	bfc00998 	cache	0x0,2456(s8)
    1200:	986e0001 	lwr	t6,1(v1)
    1204:	bcbfc009 	cache	0x1f,-16375(a1)
    1208:	03bfc009 	0x3bfc009
    120c:	00c09100 	0xc09100
    1210:	bfc009bc 	cache	0x0,2492(s8)
    1214:	bfc009c4 	cache	0x0,2500(s8)
    1218:	c08d0003 	ll	t5,3(a0)
	...
    1224:	c008cc00 	ll	t0,-13312(zero)
    1228:	c009bcbf 	ll	t1,-17217(zero)
    122c:	910003bf 	lbu	zero,959(t0)
    1230:	09bc7f98 	j	6f1fe60 <_mem_avail_start-0x790e01a0>
    1234:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1238:	0003bfc0 	sll	s7,v1,0x1f
    123c:	007f988d 	break	0x7f,0x262
    1240:	00000000 	nop
    1244:	cc000000 	pref	0x0,0(zero)
    1248:	bcbfc008 	cache	0x1f,-16376(a1)
    124c:	03bfc009 	0x3bfc009
    1250:	7f9c9100 	0x7f9c9100
    1254:	bfc009bc 	cache	0x0,2492(s8)
    1258:	bfc009c4 	cache	0x0,2500(s8)
    125c:	9c8d0003 	0x9c8d0003
    1260:	0000007f 	0x7f
    1264:	00000000 	nop
    1268:	c008cc00 	ll	t0,-13312(zero)
    126c:	c009bcbf 	ll	t1,-17217(zero)
    1270:	910003bf 	lbu	zero,959(t0)
    1274:	09bc7fa0 	j	6f1fe80 <_mem_avail_start-0x790e0180>
    1278:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    127c:	0003bfc0 	sll	s7,v1,0x1f
    1280:	007fa08d 	break	0x7f,0x282
    1284:	00000000 	nop
    1288:	cc000000 	pref	0x0,0(zero)
    128c:	bcbfc008 	cache	0x1f,-16376(a1)
    1290:	03bfc009 	0x3bfc009
    1294:	7fa49100 	0x7fa49100
    1298:	bfc009bc 	cache	0x0,2492(s8)
    129c:	bfc009c4 	cache	0x0,2500(s8)
    12a0:	a48d0003 	sh	t5,3(a0)
    12a4:	0000007f 	0x7f
    12a8:	00000000 	nop
    12ac:	c008cc00 	ll	t0,-13312(zero)
    12b0:	c009bcbf 	ll	t1,-17217(zero)
    12b4:	910003bf 	lbu	zero,959(t0)
    12b8:	09bc7fa8 	j	6f1fea0 <_mem_avail_start-0x790e0160>
    12bc:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    12c0:	0003bfc0 	sll	s7,v1,0x1f
    12c4:	007fa88d 	break	0x7f,0x2a2
    12c8:	00000000 	nop
    12cc:	cc000000 	pref	0x0,0(zero)
    12d0:	bcbfc008 	cache	0x1f,-16376(a1)
    12d4:	03bfc009 	0x3bfc009
    12d8:	7fac9100 	0x7fac9100
    12dc:	bfc009bc 	cache	0x0,2492(s8)
    12e0:	bfc009c4 	cache	0x0,2500(s8)
    12e4:	ac8d0003 	sw	t5,3(a0)
    12e8:	0000007f 	0x7f
    12ec:	00000000 	nop
    12f0:	c008cc00 	ll	t0,-13312(zero)
    12f4:	c009bcbf 	ll	t1,-17217(zero)
    12f8:	910003bf 	lbu	zero,959(t0)
    12fc:	09bc7fb0 	j	6f1fec0 <_mem_avail_start-0x790e0140>
    1300:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1304:	0003bfc0 	sll	s7,v1,0x1f
    1308:	007fb08d 	break	0x7f,0x2c2
    130c:	00000000 	nop
    1310:	cc000000 	pref	0x0,0(zero)
    1314:	bcbfc008 	cache	0x1f,-16376(a1)
    1318:	03bfc009 	0x3bfc009
    131c:	7fb49100 	0x7fb49100
    1320:	bfc009bc 	cache	0x0,2492(s8)
    1324:	bfc009c4 	cache	0x0,2500(s8)
    1328:	b48d0003 	0xb48d0003
    132c:	0000007f 	0x7f
    1330:	00000000 	nop
    1334:	c008cc00 	ll	t0,-13312(zero)
    1338:	c009bcbf 	ll	t1,-17217(zero)
    133c:	910003bf 	lbu	zero,959(t0)
    1340:	09bc7fb8 	j	6f1fee0 <_mem_avail_start-0x790e0120>
    1344:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1348:	0003bfc0 	sll	s7,v1,0x1f
    134c:	007fb88d 	break	0x7f,0x2e2
    1350:	00000000 	nop
    1354:	cc000000 	pref	0x0,0(zero)
    1358:	bcbfc008 	cache	0x1f,-16376(a1)
    135c:	03bfc009 	0x3bfc009
    1360:	7fbc9100 	0x7fbc9100
    1364:	bfc009bc 	cache	0x0,2492(s8)
    1368:	bfc009c4 	cache	0x0,2500(s8)
    136c:	bc8d0003 	cache	0xd,3(a0)
    1370:	0000007f 	0x7f
    1374:	00000000 	nop
    1378:	c008cc00 	ll	t0,-13312(zero)
    137c:	c009bcbf 	ll	t1,-17217(zero)
    1380:	910002bf 	lbu	zero,703(t0)
    1384:	c009bc40 	ll	t1,-17344(zero)
    1388:	c009c4bf 	ll	t1,-15169(zero)
    138c:	8d0002bf 	lw	zero,703(t0)
    1390:	00000040 	ssnop
    1394:	00000000 	nop
    1398:	c008d800 	ll	t0,-10240(zero)
    139c:	c009bcbf 	ll	t1,-17217(zero)
    13a0:	600001bf 	0x600001bf
    13a4:	bfc009bc 	cache	0x0,2492(s8)
    13a8:	bfc009c3 	cache	0x0,2499(s8)
    13ac:	c3540001 	ll	s4,1(k0)
    13b0:	c4bfc009 	lwc1	$f31,-16375(a1)
    13b4:	03bfc009 	0x3bfc009
    13b8:	00e08d00 	0xe08d00
	...
    13c4:	bfc008d8 	cache	0x0,2264(s8)
    13c8:	bfc009b4 	cache	0x0,2484(s8)
    13cc:	b4610001 	0xb4610001
    13d0:	bcbfc009 	cache	0x1f,-16375(a1)
    13d4:	03bfc009 	0x3bfc009
    13d8:	00dc9100 	0xdc9100
    13dc:	bfc009bc 	cache	0x0,2492(s8)
    13e0:	bfc009c4 	cache	0x0,2500(s8)
    13e4:	dc8d0003 	ldc3	$13,3(a0)
	...
    13f0:	c008d800 	ll	t0,-10240(zero)
    13f4:	c009b0bf 	ll	t1,-20289(zero)
    13f8:	620001bf 	0x620001bf
    13fc:	bfc009b0 	cache	0x0,2480(s8)
    1400:	bfc009bc 	cache	0x0,2492(s8)
    1404:	d8910003 	ldc2	$17,3(a0)
    1408:	c009bc00 	ll	t1,-17408(zero)
    140c:	c009c4bf 	ll	t1,-15169(zero)
    1410:	8d0003bf 	lw	zero,959(t0)
    1414:	000000d8 	0xd8
    1418:	00000000 	nop
    141c:	08d80000 	j	3600000 <_mem_avail_start-0x7ca00000>
    1420:	09acbfc0 	j	6b2ff00 <_mem_avail_start-0x794d0100>
    1424:	0001bfc0 	sll	s7,at,0x1f
    1428:	c009ac63 	ll	t1,-21405(zero)
    142c:	c009bcbf 	ll	t1,-17217(zero)
    1430:	910003bf 	lbu	zero,959(t0)
    1434:	09bc00d4 	j	6f00350 <_mem_avail_start-0x790ffcb0>
    1438:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    143c:	0003bfc0 	sll	s7,v1,0x1f
    1440:	0000d48d 	break	0x0,0x352
    1444:	00000000 	nop
    1448:	d8000000 	ldc2	$0,0(zero)
    144c:	a8bfc008 	swl	ra,-16376(a1)
    1450:	01bfc009 	0x1bfc009
    1454:	09a86400 	j	6a19000 <_mem_avail_start-0x795e7000>
    1458:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    145c:	0003bfc0 	sll	s7,v1,0x1f
    1460:	bc00d091 	cache	0x0,-12143(zero)
    1464:	c4bfc009 	lwc1	$f31,-16375(a1)
    1468:	03bfc009 	0x3bfc009
    146c:	00d08d00 	0xd08d00
	...
    1478:	bfc008d8 	cache	0x0,2264(s8)
    147c:	bfc009a4 	cache	0x0,2468(s8)
    1480:	a4650001 	sh	a1,1(v1)
    1484:	bcbfc009 	cache	0x1f,-16375(a1)
    1488:	03bfc009 	0x3bfc009
    148c:	00cc9100 	0xcc9100
    1490:	bfc009bc 	cache	0x0,2492(s8)
    1494:	bfc009c4 	cache	0x0,2500(s8)
    1498:	cc8d0003 	pref	0xd,3(a0)
	...
    14a4:	c008d800 	ll	t0,-10240(zero)
    14a8:	c009a0bf 	ll	t1,-24385(zero)
    14ac:	660001bf 	0x660001bf
    14b0:	bfc009a0 	cache	0x0,2464(s8)
    14b4:	bfc009bc 	cache	0x0,2492(s8)
    14b8:	c8910003 	lwc2	$17,3(a0)
    14bc:	c009bc00 	ll	t1,-17408(zero)
    14c0:	c009c4bf 	ll	t1,-15169(zero)
    14c4:	8d0003bf 	lw	zero,959(t0)
    14c8:	000000c8 	0xc8
    14cc:	00000000 	nop
    14d0:	08d80000 	j	3600000 <_mem_avail_start-0x7ca00000>
    14d4:	099cbfc0 	j	672ff00 <_mem_avail_start-0x798d0100>
    14d8:	0001bfc0 	sll	s7,at,0x1f
    14dc:	c0099c67 	ll	t1,-25497(zero)
    14e0:	c009bcbf 	ll	t1,-17217(zero)
    14e4:	910003bf 	lbu	zero,959(t0)
    14e8:	09bc00c4 	j	6f00310 <_mem_avail_start-0x790ffcf0>
    14ec:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    14f0:	0003bfc0 	sll	s7,v1,0x1f
    14f4:	0000c48d 	break	0x0,0x312
    14f8:	00000000 	nop
    14fc:	d8000000 	ldc2	$0,0(zero)
    1500:	98bfc008 	lwr	ra,-16376(a1)
    1504:	01bfc009 	0x1bfc009
    1508:	09986e00 	j	661b800 <_mem_avail_start-0x799e4800>
    150c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1510:	0003bfc0 	sll	s7,v1,0x1f
    1514:	bc00c091 	cache	0x0,-16239(zero)
    1518:	c4bfc009 	lwc1	$f31,-16375(a1)
    151c:	03bfc009 	0x3bfc009
    1520:	00c08d00 	0xc08d00
	...
    152c:	bfc008d8 	cache	0x0,2264(s8)
    1530:	bfc009bc 	cache	0x0,2492(s8)
    1534:	98910003 	lwr	s1,3(a0)
    1538:	c009bc7f 	ll	t1,-17281(zero)
    153c:	c009c4bf 	ll	t1,-15169(zero)
    1540:	8d0003bf 	lw	zero,959(t0)
    1544:	00007f98 	0x7f98
    1548:	00000000 	nop
    154c:	08d80000 	j	3600000 <_mem_avail_start-0x7ca00000>
    1550:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1554:	0003bfc0 	sll	s7,v1,0x1f
    1558:	bc7f9c91 	cache	0x1f,-25455(v1)
    155c:	c4bfc009 	lwc1	$f31,-16375(a1)
    1560:	03bfc009 	0x3bfc009
    1564:	7f9c8d00 	0x7f9c8d00
	...
    1570:	bfc008d8 	cache	0x0,2264(s8)
    1574:	bfc009bc 	cache	0x0,2492(s8)
    1578:	a0910003 	sb	s1,3(a0)
    157c:	c009bc7f 	ll	t1,-17281(zero)
    1580:	c009c4bf 	ll	t1,-15169(zero)
    1584:	8d0003bf 	lw	zero,959(t0)
    1588:	00007fa0 	0x7fa0
    158c:	00000000 	nop
    1590:	08d80000 	j	3600000 <_mem_avail_start-0x7ca00000>
    1594:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1598:	0003bfc0 	sll	s7,v1,0x1f
    159c:	bc7fa491 	cache	0x1f,-23407(v1)
    15a0:	c4bfc009 	lwc1	$f31,-16375(a1)
    15a4:	03bfc009 	0x3bfc009
    15a8:	7fa48d00 	0x7fa48d00
	...
    15b4:	bfc008d8 	cache	0x0,2264(s8)
    15b8:	bfc009bc 	cache	0x0,2492(s8)
    15bc:	a8910003 	swl	s1,3(a0)
    15c0:	c009bc7f 	ll	t1,-17281(zero)
    15c4:	c009c4bf 	ll	t1,-15169(zero)
    15c8:	8d0003bf 	lw	zero,959(t0)
    15cc:	00007fa8 	0x7fa8
    15d0:	00000000 	nop
    15d4:	08d80000 	j	3600000 <_mem_avail_start-0x7ca00000>
    15d8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    15dc:	0003bfc0 	sll	s7,v1,0x1f
    15e0:	bc7fac91 	cache	0x1f,-21359(v1)
    15e4:	c4bfc009 	lwc1	$f31,-16375(a1)
    15e8:	03bfc009 	0x3bfc009
    15ec:	7fac8d00 	0x7fac8d00
	...
    15f8:	bfc008d8 	cache	0x0,2264(s8)
    15fc:	bfc009bc 	cache	0x0,2492(s8)
    1600:	b0910003 	0xb0910003
    1604:	c009bc7f 	ll	t1,-17281(zero)
    1608:	c009c4bf 	ll	t1,-15169(zero)
    160c:	8d0003bf 	lw	zero,959(t0)
    1610:	00007fb0 	tge	zero,zero,0x1fe
    1614:	00000000 	nop
    1618:	08d80000 	j	3600000 <_mem_avail_start-0x7ca00000>
    161c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1620:	0003bfc0 	sll	s7,v1,0x1f
    1624:	bc7fb491 	cache	0x1f,-19311(v1)
    1628:	c4bfc009 	lwc1	$f31,-16375(a1)
    162c:	03bfc009 	0x3bfc009
    1630:	7fb48d00 	0x7fb48d00
	...
    163c:	bfc008d8 	cache	0x0,2264(s8)
    1640:	bfc009bc 	cache	0x0,2492(s8)
    1644:	b8910003 	swr	s1,3(a0)
    1648:	c009bc7f 	ll	t1,-17281(zero)
    164c:	c009c4bf 	ll	t1,-15169(zero)
    1650:	8d0003bf 	lw	zero,959(t0)
    1654:	00007fb8 	0x7fb8
    1658:	00000000 	nop
    165c:	08d80000 	j	3600000 <_mem_avail_start-0x7ca00000>
    1660:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1664:	0003bfc0 	sll	s7,v1,0x1f
    1668:	bc7fbc91 	cache	0x1f,-17263(v1)
    166c:	c4bfc009 	lwc1	$f31,-16375(a1)
    1670:	03bfc009 	0x3bfc009
    1674:	7fbc8d00 	0x7fbc8d00
	...
    1680:	bfc008e4 	cache	0x0,2276(s8)
    1684:	bfc009bc 	cache	0x0,2492(s8)
    1688:	bc600001 	cache	0x0,1(v1)
    168c:	c3bfc009 	ll	ra,-16375(sp)
    1690:	01bfc009 	0x1bfc009
    1694:	09c35400 	j	70d5000 <_mem_avail_start-0x78f2b000>
    1698:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    169c:	0003bfc0 	sll	s7,v1,0x1f
    16a0:	0000e08d 	break	0x0,0x382
    16a4:	00000000 	nop
    16a8:	e4000000 	swc1	$f0,0(zero)
    16ac:	b4bfc008 	0xb4bfc008
    16b0:	01bfc009 	0x1bfc009
    16b4:	09b46100 	j	6d18400 <_mem_avail_start-0x792e7c00>
    16b8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    16bc:	0003bfc0 	sll	s7,v1,0x1f
    16c0:	bc00dc91 	cache	0x0,-9071(zero)
    16c4:	c4bfc009 	lwc1	$f31,-16375(a1)
    16c8:	03bfc009 	0x3bfc009
    16cc:	00dc8d00 	0xdc8d00
	...
    16d8:	bfc008e4 	cache	0x0,2276(s8)
    16dc:	bfc009b0 	cache	0x0,2480(s8)
    16e0:	b0620001 	0xb0620001
    16e4:	bcbfc009 	cache	0x1f,-16375(a1)
    16e8:	03bfc009 	0x3bfc009
    16ec:	00d89100 	0xd89100
    16f0:	bfc009bc 	cache	0x0,2492(s8)
    16f4:	bfc009c4 	cache	0x0,2500(s8)
    16f8:	d88d0003 	ldc2	$13,3(a0)
	...
    1704:	c008e400 	ll	t0,-7168(zero)
    1708:	c009acbf 	ll	t1,-21313(zero)
    170c:	630001bf 	0x630001bf
    1710:	bfc009ac 	cache	0x0,2476(s8)
    1714:	bfc009bc 	cache	0x0,2492(s8)
    1718:	d4910003 	ldc1	$f17,3(a0)
    171c:	c009bc00 	ll	t1,-17408(zero)
    1720:	c009c4bf 	ll	t1,-15169(zero)
    1724:	8d0003bf 	lw	zero,959(t0)
    1728:	000000d4 	0xd4
    172c:	00000000 	nop
    1730:	08e40000 	j	3900000 <_mem_avail_start-0x7c700000>
    1734:	09a8bfc0 	j	6a2ff00 <_mem_avail_start-0x795d0100>
    1738:	0001bfc0 	sll	s7,at,0x1f
    173c:	c009a864 	ll	t1,-22428(zero)
    1740:	c009bcbf 	ll	t1,-17217(zero)
    1744:	910003bf 	lbu	zero,959(t0)
    1748:	09bc00d0 	j	6f00340 <_mem_avail_start-0x790ffcc0>
    174c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1750:	0003bfc0 	sll	s7,v1,0x1f
    1754:	0000d08d 	break	0x0,0x342
    1758:	00000000 	nop
    175c:	e4000000 	swc1	$f0,0(zero)
    1760:	a4bfc008 	sh	ra,-16376(a1)
    1764:	01bfc009 	0x1bfc009
    1768:	09a46500 	j	6919400 <_mem_avail_start-0x796e6c00>
    176c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1770:	0003bfc0 	sll	s7,v1,0x1f
    1774:	bc00cc91 	cache	0x0,-13167(zero)
    1778:	c4bfc009 	lwc1	$f31,-16375(a1)
    177c:	03bfc009 	0x3bfc009
    1780:	00cc8d00 	0xcc8d00
	...
    178c:	bfc008e4 	cache	0x0,2276(s8)
    1790:	bfc009a0 	cache	0x0,2464(s8)
    1794:	a0660001 	sb	a2,1(v1)
    1798:	bcbfc009 	cache	0x1f,-16375(a1)
    179c:	03bfc009 	0x3bfc009
    17a0:	00c89100 	0xc89100
    17a4:	bfc009bc 	cache	0x0,2492(s8)
    17a8:	bfc009c4 	cache	0x0,2500(s8)
    17ac:	c88d0003 	lwc2	$13,3(a0)
	...
    17b8:	c008e400 	ll	t0,-7168(zero)
    17bc:	c0099cbf 	ll	t1,-25409(zero)
    17c0:	670001bf 	0x670001bf
    17c4:	bfc0099c 	cache	0x0,2460(s8)
    17c8:	bfc009bc 	cache	0x0,2492(s8)
    17cc:	c4910003 	lwc1	$f17,3(a0)
    17d0:	c009bc00 	ll	t1,-17408(zero)
    17d4:	c009c4bf 	ll	t1,-15169(zero)
    17d8:	8d0003bf 	lw	zero,959(t0)
    17dc:	000000c4 	0xc4
    17e0:	00000000 	nop
    17e4:	08e40000 	j	3900000 <_mem_avail_start-0x7c700000>
    17e8:	0998bfc0 	j	662ff00 <_mem_avail_start-0x799d0100>
    17ec:	0001bfc0 	sll	s7,at,0x1f
    17f0:	c009986e 	ll	t1,-26514(zero)
    17f4:	c009bcbf 	ll	t1,-17217(zero)
    17f8:	910003bf 	lbu	zero,959(t0)
    17fc:	09bc00c0 	j	6f00300 <_mem_avail_start-0x790ffd00>
    1800:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1804:	0003bfc0 	sll	s7,v1,0x1f
    1808:	0000c08d 	break	0x0,0x302
    180c:	00000000 	nop
    1810:	e4000000 	swc1	$f0,0(zero)
    1814:	bcbfc008 	cache	0x1f,-16376(a1)
    1818:	03bfc009 	0x3bfc009
    181c:	7f989100 	0x7f989100
    1820:	bfc009bc 	cache	0x0,2492(s8)
    1824:	bfc009c4 	cache	0x0,2500(s8)
    1828:	988d0003 	lwr	t5,3(a0)
    182c:	0000007f 	0x7f
    1830:	00000000 	nop
    1834:	c008e400 	ll	t0,-7168(zero)
    1838:	c009bcbf 	ll	t1,-17217(zero)
    183c:	910003bf 	lbu	zero,959(t0)
    1840:	09bc7f9c 	j	6f1fe70 <_mem_avail_start-0x790e0190>
    1844:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1848:	0003bfc0 	sll	s7,v1,0x1f
    184c:	007f9c8d 	break	0x7f,0x272
    1850:	00000000 	nop
    1854:	e4000000 	swc1	$f0,0(zero)
    1858:	bcbfc008 	cache	0x1f,-16376(a1)
    185c:	03bfc009 	0x3bfc009
    1860:	7fa09100 	0x7fa09100
    1864:	bfc009bc 	cache	0x0,2492(s8)
    1868:	bfc009c4 	cache	0x0,2500(s8)
    186c:	a08d0003 	sb	t5,3(a0)
    1870:	0000007f 	0x7f
    1874:	00000000 	nop
    1878:	c008e400 	ll	t0,-7168(zero)
    187c:	c009bcbf 	ll	t1,-17217(zero)
    1880:	910003bf 	lbu	zero,959(t0)
    1884:	09bc7fa4 	j	6f1fe90 <_mem_avail_start-0x790e0170>
    1888:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    188c:	0003bfc0 	sll	s7,v1,0x1f
    1890:	007fa48d 	break	0x7f,0x292
    1894:	00000000 	nop
    1898:	e4000000 	swc1	$f0,0(zero)
    189c:	bcbfc008 	cache	0x1f,-16376(a1)
    18a0:	03bfc009 	0x3bfc009
    18a4:	7fa89100 	0x7fa89100
    18a8:	bfc009bc 	cache	0x0,2492(s8)
    18ac:	bfc009c4 	cache	0x0,2500(s8)
    18b0:	a88d0003 	swl	t5,3(a0)
    18b4:	0000007f 	0x7f
    18b8:	00000000 	nop
    18bc:	c008e400 	ll	t0,-7168(zero)
    18c0:	c009bcbf 	ll	t1,-17217(zero)
    18c4:	910003bf 	lbu	zero,959(t0)
    18c8:	09bc7fac 	j	6f1feb0 <_mem_avail_start-0x790e0150>
    18cc:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    18d0:	0003bfc0 	sll	s7,v1,0x1f
    18d4:	007fac8d 	break	0x7f,0x2b2
    18d8:	00000000 	nop
    18dc:	e4000000 	swc1	$f0,0(zero)
    18e0:	bcbfc008 	cache	0x1f,-16376(a1)
    18e4:	03bfc009 	0x3bfc009
    18e8:	7fb09100 	0x7fb09100
    18ec:	bfc009bc 	cache	0x0,2492(s8)
    18f0:	bfc009c4 	cache	0x0,2500(s8)
    18f4:	b08d0003 	0xb08d0003
    18f8:	0000007f 	0x7f
    18fc:	00000000 	nop
    1900:	c008e400 	ll	t0,-7168(zero)
    1904:	c009bcbf 	ll	t1,-17217(zero)
    1908:	910003bf 	lbu	zero,959(t0)
    190c:	09bc7fb4 	j	6f1fed0 <_mem_avail_start-0x790e0130>
    1910:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1914:	0003bfc0 	sll	s7,v1,0x1f
    1918:	007fb48d 	break	0x7f,0x2d2
    191c:	00000000 	nop
    1920:	e4000000 	swc1	$f0,0(zero)
    1924:	bcbfc008 	cache	0x1f,-16376(a1)
    1928:	03bfc009 	0x3bfc009
    192c:	7fb89100 	0x7fb89100
    1930:	bfc009bc 	cache	0x0,2492(s8)
    1934:	bfc009c4 	cache	0x0,2500(s8)
    1938:	b88d0003 	swr	t5,3(a0)
    193c:	0000007f 	0x7f
    1940:	00000000 	nop
    1944:	c008f000 	ll	t0,-4096(zero)
    1948:	c009bcbf 	ll	t1,-17217(zero)
    194c:	600001bf 	0x600001bf
    1950:	bfc009bc 	cache	0x0,2492(s8)
    1954:	bfc009c3 	cache	0x0,2499(s8)
    1958:	c3540001 	ll	s4,1(k0)
    195c:	c4bfc009 	lwc1	$f31,-16375(a1)
    1960:	03bfc009 	0x3bfc009
    1964:	00e08d00 	0xe08d00
	...
    1970:	bfc008f0 	cache	0x0,2288(s8)
    1974:	bfc009b4 	cache	0x0,2484(s8)
    1978:	b4610001 	0xb4610001
    197c:	bcbfc009 	cache	0x1f,-16375(a1)
    1980:	03bfc009 	0x3bfc009
    1984:	00dc9100 	0xdc9100
    1988:	bfc009bc 	cache	0x0,2492(s8)
    198c:	bfc009c4 	cache	0x0,2500(s8)
    1990:	dc8d0003 	ldc3	$13,3(a0)
	...
    199c:	c008f000 	ll	t0,-4096(zero)
    19a0:	c009b0bf 	ll	t1,-20289(zero)
    19a4:	620001bf 	0x620001bf
    19a8:	bfc009b0 	cache	0x0,2480(s8)
    19ac:	bfc009bc 	cache	0x0,2492(s8)
    19b0:	d8910003 	ldc2	$17,3(a0)
    19b4:	c009bc00 	ll	t1,-17408(zero)
    19b8:	c009c4bf 	ll	t1,-15169(zero)
    19bc:	8d0003bf 	lw	zero,959(t0)
    19c0:	000000d8 	0xd8
    19c4:	00000000 	nop
    19c8:	08f00000 	j	3c00000 <_mem_avail_start-0x7c400000>
    19cc:	09acbfc0 	j	6b2ff00 <_mem_avail_start-0x794d0100>
    19d0:	0001bfc0 	sll	s7,at,0x1f
    19d4:	c009ac63 	ll	t1,-21405(zero)
    19d8:	c009bcbf 	ll	t1,-17217(zero)
    19dc:	910003bf 	lbu	zero,959(t0)
    19e0:	09bc00d4 	j	6f00350 <_mem_avail_start-0x790ffcb0>
    19e4:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    19e8:	0003bfc0 	sll	s7,v1,0x1f
    19ec:	0000d48d 	break	0x0,0x352
    19f0:	00000000 	nop
    19f4:	f0000000 	0xf0000000
    19f8:	a8bfc008 	swl	ra,-16376(a1)
    19fc:	01bfc009 	0x1bfc009
    1a00:	09a86400 	j	6a19000 <_mem_avail_start-0x795e7000>
    1a04:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1a08:	0003bfc0 	sll	s7,v1,0x1f
    1a0c:	bc00d091 	cache	0x0,-12143(zero)
    1a10:	c4bfc009 	lwc1	$f31,-16375(a1)
    1a14:	03bfc009 	0x3bfc009
    1a18:	00d08d00 	0xd08d00
	...
    1a24:	bfc008f0 	cache	0x0,2288(s8)
    1a28:	bfc009a4 	cache	0x0,2468(s8)
    1a2c:	a4650001 	sh	a1,1(v1)
    1a30:	bcbfc009 	cache	0x1f,-16375(a1)
    1a34:	03bfc009 	0x3bfc009
    1a38:	00cc9100 	0xcc9100
    1a3c:	bfc009bc 	cache	0x0,2492(s8)
    1a40:	bfc009c4 	cache	0x0,2500(s8)
    1a44:	cc8d0003 	pref	0xd,3(a0)
	...
    1a50:	c008f000 	ll	t0,-4096(zero)
    1a54:	c009a0bf 	ll	t1,-24385(zero)
    1a58:	660001bf 	0x660001bf
    1a5c:	bfc009a0 	cache	0x0,2464(s8)
    1a60:	bfc009bc 	cache	0x0,2492(s8)
    1a64:	c8910003 	lwc2	$17,3(a0)
    1a68:	c009bc00 	ll	t1,-17408(zero)
    1a6c:	c009c4bf 	ll	t1,-15169(zero)
    1a70:	8d0003bf 	lw	zero,959(t0)
    1a74:	000000c8 	0xc8
    1a78:	00000000 	nop
    1a7c:	08f00000 	j	3c00000 <_mem_avail_start-0x7c400000>
    1a80:	099cbfc0 	j	672ff00 <_mem_avail_start-0x798d0100>
    1a84:	0001bfc0 	sll	s7,at,0x1f
    1a88:	c0099c67 	ll	t1,-25497(zero)
    1a8c:	c009bcbf 	ll	t1,-17217(zero)
    1a90:	910003bf 	lbu	zero,959(t0)
    1a94:	09bc00c4 	j	6f00310 <_mem_avail_start-0x790ffcf0>
    1a98:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1a9c:	0003bfc0 	sll	s7,v1,0x1f
    1aa0:	0000c48d 	break	0x0,0x312
    1aa4:	00000000 	nop
    1aa8:	f0000000 	0xf0000000
    1aac:	98bfc008 	lwr	ra,-16376(a1)
    1ab0:	01bfc009 	0x1bfc009
    1ab4:	09986e00 	j	661b800 <_mem_avail_start-0x799e4800>
    1ab8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1abc:	0003bfc0 	sll	s7,v1,0x1f
    1ac0:	bc00c091 	cache	0x0,-16239(zero)
    1ac4:	c4bfc009 	lwc1	$f31,-16375(a1)
    1ac8:	03bfc009 	0x3bfc009
    1acc:	00c08d00 	0xc08d00
	...
    1ad8:	bfc008f0 	cache	0x0,2288(s8)
    1adc:	bfc009bc 	cache	0x0,2492(s8)
    1ae0:	98910003 	lwr	s1,3(a0)
    1ae4:	c009bc7f 	ll	t1,-17281(zero)
    1ae8:	c009c4bf 	ll	t1,-15169(zero)
    1aec:	8d0003bf 	lw	zero,959(t0)
    1af0:	00007f98 	0x7f98
    1af4:	00000000 	nop
    1af8:	08f00000 	j	3c00000 <_mem_avail_start-0x7c400000>
    1afc:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1b00:	0003bfc0 	sll	s7,v1,0x1f
    1b04:	bc7f9c91 	cache	0x1f,-25455(v1)
    1b08:	c4bfc009 	lwc1	$f31,-16375(a1)
    1b0c:	03bfc009 	0x3bfc009
    1b10:	7f9c8d00 	0x7f9c8d00
	...
    1b1c:	bfc008f0 	cache	0x0,2288(s8)
    1b20:	bfc009bc 	cache	0x0,2492(s8)
    1b24:	a0910003 	sb	s1,3(a0)
    1b28:	c009bc7f 	ll	t1,-17281(zero)
    1b2c:	c009c4bf 	ll	t1,-15169(zero)
    1b30:	8d0003bf 	lw	zero,959(t0)
    1b34:	00007fa0 	0x7fa0
    1b38:	00000000 	nop
    1b3c:	08f00000 	j	3c00000 <_mem_avail_start-0x7c400000>
    1b40:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1b44:	0003bfc0 	sll	s7,v1,0x1f
    1b48:	bc7fa491 	cache	0x1f,-23407(v1)
    1b4c:	c4bfc009 	lwc1	$f31,-16375(a1)
    1b50:	03bfc009 	0x3bfc009
    1b54:	7fa48d00 	0x7fa48d00
	...
    1b60:	bfc008f0 	cache	0x0,2288(s8)
    1b64:	bfc009bc 	cache	0x0,2492(s8)
    1b68:	a8910003 	swl	s1,3(a0)
    1b6c:	c009bc7f 	ll	t1,-17281(zero)
    1b70:	c009c4bf 	ll	t1,-15169(zero)
    1b74:	8d0003bf 	lw	zero,959(t0)
    1b78:	00007fa8 	0x7fa8
    1b7c:	00000000 	nop
    1b80:	08f00000 	j	3c00000 <_mem_avail_start-0x7c400000>
    1b84:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1b88:	0003bfc0 	sll	s7,v1,0x1f
    1b8c:	bc7fac91 	cache	0x1f,-21359(v1)
    1b90:	c4bfc009 	lwc1	$f31,-16375(a1)
    1b94:	03bfc009 	0x3bfc009
    1b98:	7fac8d00 	0x7fac8d00
	...
    1ba4:	bfc008f0 	cache	0x0,2288(s8)
    1ba8:	bfc009bc 	cache	0x0,2492(s8)
    1bac:	b0910003 	0xb0910003
    1bb0:	c009bc7f 	ll	t1,-17281(zero)
    1bb4:	c009c4bf 	ll	t1,-15169(zero)
    1bb8:	8d0003bf 	lw	zero,959(t0)
    1bbc:	00007fb0 	tge	zero,zero,0x1fe
    1bc0:	00000000 	nop
    1bc4:	08f00000 	j	3c00000 <_mem_avail_start-0x7c400000>
    1bc8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1bcc:	0003bfc0 	sll	s7,v1,0x1f
    1bd0:	bc7fb491 	cache	0x1f,-19311(v1)
    1bd4:	c4bfc009 	lwc1	$f31,-16375(a1)
    1bd8:	03bfc009 	0x3bfc009
    1bdc:	7fb48d00 	0x7fb48d00
	...
    1be8:	bfc008fc 	cache	0x0,2300(s8)
    1bec:	bfc009bc 	cache	0x0,2492(s8)
    1bf0:	bc600001 	cache	0x0,1(v1)
    1bf4:	c3bfc009 	ll	ra,-16375(sp)
    1bf8:	01bfc009 	0x1bfc009
    1bfc:	09c35400 	j	70d5000 <_mem_avail_start-0x78f2b000>
    1c00:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1c04:	0003bfc0 	sll	s7,v1,0x1f
    1c08:	0000e08d 	break	0x0,0x382
    1c0c:	00000000 	nop
    1c10:	fc000000 	sdc3	$0,0(zero)
    1c14:	b4bfc008 	0xb4bfc008
    1c18:	01bfc009 	0x1bfc009
    1c1c:	09b46100 	j	6d18400 <_mem_avail_start-0x792e7c00>
    1c20:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1c24:	0003bfc0 	sll	s7,v1,0x1f
    1c28:	bc00dc91 	cache	0x0,-9071(zero)
    1c2c:	c4bfc009 	lwc1	$f31,-16375(a1)
    1c30:	03bfc009 	0x3bfc009
    1c34:	00dc8d00 	0xdc8d00
	...
    1c40:	bfc008fc 	cache	0x0,2300(s8)
    1c44:	bfc009b0 	cache	0x0,2480(s8)
    1c48:	b0620001 	0xb0620001
    1c4c:	bcbfc009 	cache	0x1f,-16375(a1)
    1c50:	03bfc009 	0x3bfc009
    1c54:	00d89100 	0xd89100
    1c58:	bfc009bc 	cache	0x0,2492(s8)
    1c5c:	bfc009c4 	cache	0x0,2500(s8)
    1c60:	d88d0003 	ldc2	$13,3(a0)
	...
    1c6c:	c008fc00 	ll	t0,-1024(zero)
    1c70:	c009acbf 	ll	t1,-21313(zero)
    1c74:	630001bf 	0x630001bf
    1c78:	bfc009ac 	cache	0x0,2476(s8)
    1c7c:	bfc009bc 	cache	0x0,2492(s8)
    1c80:	d4910003 	ldc1	$f17,3(a0)
    1c84:	c009bc00 	ll	t1,-17408(zero)
    1c88:	c009c4bf 	ll	t1,-15169(zero)
    1c8c:	8d0003bf 	lw	zero,959(t0)
    1c90:	000000d4 	0xd4
    1c94:	00000000 	nop
    1c98:	08fc0000 	j	3f00000 <_mem_avail_start-0x7c100000>
    1c9c:	09a8bfc0 	j	6a2ff00 <_mem_avail_start-0x795d0100>
    1ca0:	0001bfc0 	sll	s7,at,0x1f
    1ca4:	c009a864 	ll	t1,-22428(zero)
    1ca8:	c009bcbf 	ll	t1,-17217(zero)
    1cac:	910003bf 	lbu	zero,959(t0)
    1cb0:	09bc00d0 	j	6f00340 <_mem_avail_start-0x790ffcc0>
    1cb4:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1cb8:	0003bfc0 	sll	s7,v1,0x1f
    1cbc:	0000d08d 	break	0x0,0x342
    1cc0:	00000000 	nop
    1cc4:	fc000000 	sdc3	$0,0(zero)
    1cc8:	a4bfc008 	sh	ra,-16376(a1)
    1ccc:	01bfc009 	0x1bfc009
    1cd0:	09a46500 	j	6919400 <_mem_avail_start-0x796e6c00>
    1cd4:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1cd8:	0003bfc0 	sll	s7,v1,0x1f
    1cdc:	bc00cc91 	cache	0x0,-13167(zero)
    1ce0:	c4bfc009 	lwc1	$f31,-16375(a1)
    1ce4:	03bfc009 	0x3bfc009
    1ce8:	00cc8d00 	0xcc8d00
	...
    1cf4:	bfc008fc 	cache	0x0,2300(s8)
    1cf8:	bfc009a0 	cache	0x0,2464(s8)
    1cfc:	a0660001 	sb	a2,1(v1)
    1d00:	bcbfc009 	cache	0x1f,-16375(a1)
    1d04:	03bfc009 	0x3bfc009
    1d08:	00c89100 	0xc89100
    1d0c:	bfc009bc 	cache	0x0,2492(s8)
    1d10:	bfc009c4 	cache	0x0,2500(s8)
    1d14:	c88d0003 	lwc2	$13,3(a0)
	...
    1d20:	c008fc00 	ll	t0,-1024(zero)
    1d24:	c0099cbf 	ll	t1,-25409(zero)
    1d28:	670001bf 	0x670001bf
    1d2c:	bfc0099c 	cache	0x0,2460(s8)
    1d30:	bfc009bc 	cache	0x0,2492(s8)
    1d34:	c4910003 	lwc1	$f17,3(a0)
    1d38:	c009bc00 	ll	t1,-17408(zero)
    1d3c:	c009c4bf 	ll	t1,-15169(zero)
    1d40:	8d0003bf 	lw	zero,959(t0)
    1d44:	000000c4 	0xc4
    1d48:	00000000 	nop
    1d4c:	08fc0000 	j	3f00000 <_mem_avail_start-0x7c100000>
    1d50:	0998bfc0 	j	662ff00 <_mem_avail_start-0x799d0100>
    1d54:	0001bfc0 	sll	s7,at,0x1f
    1d58:	c009986e 	ll	t1,-26514(zero)
    1d5c:	c009bcbf 	ll	t1,-17217(zero)
    1d60:	910003bf 	lbu	zero,959(t0)
    1d64:	09bc00c0 	j	6f00300 <_mem_avail_start-0x790ffd00>
    1d68:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1d6c:	0003bfc0 	sll	s7,v1,0x1f
    1d70:	0000c08d 	break	0x0,0x302
    1d74:	00000000 	nop
    1d78:	fc000000 	sdc3	$0,0(zero)
    1d7c:	bcbfc008 	cache	0x1f,-16376(a1)
    1d80:	03bfc009 	0x3bfc009
    1d84:	7f989100 	0x7f989100
    1d88:	bfc009bc 	cache	0x0,2492(s8)
    1d8c:	bfc009c4 	cache	0x0,2500(s8)
    1d90:	988d0003 	lwr	t5,3(a0)
    1d94:	0000007f 	0x7f
    1d98:	00000000 	nop
    1d9c:	c008fc00 	ll	t0,-1024(zero)
    1da0:	c009bcbf 	ll	t1,-17217(zero)
    1da4:	910003bf 	lbu	zero,959(t0)
    1da8:	09bc7f9c 	j	6f1fe70 <_mem_avail_start-0x790e0190>
    1dac:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1db0:	0003bfc0 	sll	s7,v1,0x1f
    1db4:	007f9c8d 	break	0x7f,0x272
    1db8:	00000000 	nop
    1dbc:	fc000000 	sdc3	$0,0(zero)
    1dc0:	bcbfc008 	cache	0x1f,-16376(a1)
    1dc4:	03bfc009 	0x3bfc009
    1dc8:	7fa09100 	0x7fa09100
    1dcc:	bfc009bc 	cache	0x0,2492(s8)
    1dd0:	bfc009c4 	cache	0x0,2500(s8)
    1dd4:	a08d0003 	sb	t5,3(a0)
    1dd8:	0000007f 	0x7f
    1ddc:	00000000 	nop
    1de0:	c008fc00 	ll	t0,-1024(zero)
    1de4:	c009bcbf 	ll	t1,-17217(zero)
    1de8:	910003bf 	lbu	zero,959(t0)
    1dec:	09bc7fa4 	j	6f1fe90 <_mem_avail_start-0x790e0170>
    1df0:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1df4:	0003bfc0 	sll	s7,v1,0x1f
    1df8:	007fa48d 	break	0x7f,0x292
    1dfc:	00000000 	nop
    1e00:	fc000000 	sdc3	$0,0(zero)
    1e04:	bcbfc008 	cache	0x1f,-16376(a1)
    1e08:	03bfc009 	0x3bfc009
    1e0c:	7fa89100 	0x7fa89100
    1e10:	bfc009bc 	cache	0x0,2492(s8)
    1e14:	bfc009c4 	cache	0x0,2500(s8)
    1e18:	a88d0003 	swl	t5,3(a0)
    1e1c:	0000007f 	0x7f
    1e20:	00000000 	nop
    1e24:	c008fc00 	ll	t0,-1024(zero)
    1e28:	c009bcbf 	ll	t1,-17217(zero)
    1e2c:	910003bf 	lbu	zero,959(t0)
    1e30:	09bc7fac 	j	6f1feb0 <_mem_avail_start-0x790e0150>
    1e34:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1e38:	0003bfc0 	sll	s7,v1,0x1f
    1e3c:	007fac8d 	break	0x7f,0x2b2
    1e40:	00000000 	nop
    1e44:	fc000000 	sdc3	$0,0(zero)
    1e48:	bcbfc008 	cache	0x1f,-16376(a1)
    1e4c:	03bfc009 	0x3bfc009
    1e50:	7fb09100 	0x7fb09100
    1e54:	bfc009bc 	cache	0x0,2492(s8)
    1e58:	bfc009c4 	cache	0x0,2500(s8)
    1e5c:	b08d0003 	0xb08d0003
    1e60:	0000007f 	0x7f
    1e64:	00000000 	nop
    1e68:	c0090800 	ll	t1,2048(zero)
    1e6c:	c009bcbf 	ll	t1,-17217(zero)
    1e70:	600001bf 	0x600001bf
    1e74:	bfc009bc 	cache	0x0,2492(s8)
    1e78:	bfc009c3 	cache	0x0,2499(s8)
    1e7c:	c3540001 	ll	s4,1(k0)
    1e80:	c4bfc009 	lwc1	$f31,-16375(a1)
    1e84:	03bfc009 	0x3bfc009
    1e88:	00e08d00 	0xe08d00
	...
    1e94:	bfc00908 	cache	0x0,2312(s8)
    1e98:	bfc009b4 	cache	0x0,2484(s8)
    1e9c:	b4610001 	0xb4610001
    1ea0:	bcbfc009 	cache	0x1f,-16375(a1)
    1ea4:	03bfc009 	0x3bfc009
    1ea8:	00dc9100 	0xdc9100
    1eac:	bfc009bc 	cache	0x0,2492(s8)
    1eb0:	bfc009c4 	cache	0x0,2500(s8)
    1eb4:	dc8d0003 	ldc3	$13,3(a0)
	...
    1ec0:	c0090800 	ll	t1,2048(zero)
    1ec4:	c009b0bf 	ll	t1,-20289(zero)
    1ec8:	620001bf 	0x620001bf
    1ecc:	bfc009b0 	cache	0x0,2480(s8)
    1ed0:	bfc009bc 	cache	0x0,2492(s8)
    1ed4:	d8910003 	ldc2	$17,3(a0)
    1ed8:	c009bc00 	ll	t1,-17408(zero)
    1edc:	c009c4bf 	ll	t1,-15169(zero)
    1ee0:	8d0003bf 	lw	zero,959(t0)
    1ee4:	000000d8 	0xd8
    1ee8:	00000000 	nop
    1eec:	09080000 	j	4200000 <_mem_avail_start-0x7be00000>
    1ef0:	09acbfc0 	j	6b2ff00 <_mem_avail_start-0x794d0100>
    1ef4:	0001bfc0 	sll	s7,at,0x1f
    1ef8:	c009ac63 	ll	t1,-21405(zero)
    1efc:	c009bcbf 	ll	t1,-17217(zero)
    1f00:	910003bf 	lbu	zero,959(t0)
    1f04:	09bc00d4 	j	6f00350 <_mem_avail_start-0x790ffcb0>
    1f08:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1f0c:	0003bfc0 	sll	s7,v1,0x1f
    1f10:	0000d48d 	break	0x0,0x352
    1f14:	00000000 	nop
    1f18:	08000000 	j	0 <_mem_avail_start-0x80000000>
    1f1c:	a8bfc009 	swl	ra,-16375(a1)
    1f20:	01bfc009 	0x1bfc009
    1f24:	09a86400 	j	6a19000 <_mem_avail_start-0x795e7000>
    1f28:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1f2c:	0003bfc0 	sll	s7,v1,0x1f
    1f30:	bc00d091 	cache	0x0,-12143(zero)
    1f34:	c4bfc009 	lwc1	$f31,-16375(a1)
    1f38:	03bfc009 	0x3bfc009
    1f3c:	00d08d00 	0xd08d00
	...
    1f48:	bfc00908 	cache	0x0,2312(s8)
    1f4c:	bfc009a4 	cache	0x0,2468(s8)
    1f50:	a4650001 	sh	a1,1(v1)
    1f54:	bcbfc009 	cache	0x1f,-16375(a1)
    1f58:	03bfc009 	0x3bfc009
    1f5c:	00cc9100 	0xcc9100
    1f60:	bfc009bc 	cache	0x0,2492(s8)
    1f64:	bfc009c4 	cache	0x0,2500(s8)
    1f68:	cc8d0003 	pref	0xd,3(a0)
	...
    1f74:	c0090800 	ll	t1,2048(zero)
    1f78:	c009a0bf 	ll	t1,-24385(zero)
    1f7c:	660001bf 	0x660001bf
    1f80:	bfc009a0 	cache	0x0,2464(s8)
    1f84:	bfc009bc 	cache	0x0,2492(s8)
    1f88:	c8910003 	lwc2	$17,3(a0)
    1f8c:	c009bc00 	ll	t1,-17408(zero)
    1f90:	c009c4bf 	ll	t1,-15169(zero)
    1f94:	8d0003bf 	lw	zero,959(t0)
    1f98:	000000c8 	0xc8
    1f9c:	00000000 	nop
    1fa0:	09080000 	j	4200000 <_mem_avail_start-0x7be00000>
    1fa4:	099cbfc0 	j	672ff00 <_mem_avail_start-0x798d0100>
    1fa8:	0001bfc0 	sll	s7,at,0x1f
    1fac:	c0099c67 	ll	t1,-25497(zero)
    1fb0:	c009bcbf 	ll	t1,-17217(zero)
    1fb4:	910003bf 	lbu	zero,959(t0)
    1fb8:	09bc00c4 	j	6f00310 <_mem_avail_start-0x790ffcf0>
    1fbc:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    1fc0:	0003bfc0 	sll	s7,v1,0x1f
    1fc4:	0000c48d 	break	0x0,0x312
    1fc8:	00000000 	nop
    1fcc:	08000000 	j	0 <_mem_avail_start-0x80000000>
    1fd0:	98bfc009 	lwr	ra,-16375(a1)
    1fd4:	01bfc009 	0x1bfc009
    1fd8:	09986e00 	j	661b800 <_mem_avail_start-0x799e4800>
    1fdc:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    1fe0:	0003bfc0 	sll	s7,v1,0x1f
    1fe4:	bc00c091 	cache	0x0,-16239(zero)
    1fe8:	c4bfc009 	lwc1	$f31,-16375(a1)
    1fec:	03bfc009 	0x3bfc009
    1ff0:	00c08d00 	0xc08d00
	...
    1ffc:	bfc00908 	cache	0x0,2312(s8)
    2000:	bfc009bc 	cache	0x0,2492(s8)
    2004:	98910003 	lwr	s1,3(a0)
    2008:	c009bc7f 	ll	t1,-17281(zero)
    200c:	c009c4bf 	ll	t1,-15169(zero)
    2010:	8d0003bf 	lw	zero,959(t0)
    2014:	00007f98 	0x7f98
    2018:	00000000 	nop
    201c:	09080000 	j	4200000 <_mem_avail_start-0x7be00000>
    2020:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2024:	0003bfc0 	sll	s7,v1,0x1f
    2028:	bc7f9c91 	cache	0x1f,-25455(v1)
    202c:	c4bfc009 	lwc1	$f31,-16375(a1)
    2030:	03bfc009 	0x3bfc009
    2034:	7f9c8d00 	0x7f9c8d00
	...
    2040:	bfc00908 	cache	0x0,2312(s8)
    2044:	bfc009bc 	cache	0x0,2492(s8)
    2048:	a0910003 	sb	s1,3(a0)
    204c:	c009bc7f 	ll	t1,-17281(zero)
    2050:	c009c4bf 	ll	t1,-15169(zero)
    2054:	8d0003bf 	lw	zero,959(t0)
    2058:	00007fa0 	0x7fa0
    205c:	00000000 	nop
    2060:	09080000 	j	4200000 <_mem_avail_start-0x7be00000>
    2064:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2068:	0003bfc0 	sll	s7,v1,0x1f
    206c:	bc7fa491 	cache	0x1f,-23407(v1)
    2070:	c4bfc009 	lwc1	$f31,-16375(a1)
    2074:	03bfc009 	0x3bfc009
    2078:	7fa48d00 	0x7fa48d00
	...
    2084:	bfc00908 	cache	0x0,2312(s8)
    2088:	bfc009bc 	cache	0x0,2492(s8)
    208c:	a8910003 	swl	s1,3(a0)
    2090:	c009bc7f 	ll	t1,-17281(zero)
    2094:	c009c4bf 	ll	t1,-15169(zero)
    2098:	8d0003bf 	lw	zero,959(t0)
    209c:	00007fa8 	0x7fa8
    20a0:	00000000 	nop
    20a4:	09080000 	j	4200000 <_mem_avail_start-0x7be00000>
    20a8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    20ac:	0003bfc0 	sll	s7,v1,0x1f
    20b0:	bc7fac91 	cache	0x1f,-21359(v1)
    20b4:	c4bfc009 	lwc1	$f31,-16375(a1)
    20b8:	03bfc009 	0x3bfc009
    20bc:	7fac8d00 	0x7fac8d00
	...
    20c8:	bfc00914 	cache	0x0,2324(s8)
    20cc:	bfc009bc 	cache	0x0,2492(s8)
    20d0:	bc600001 	cache	0x0,1(v1)
    20d4:	c3bfc009 	ll	ra,-16375(sp)
    20d8:	01bfc009 	0x1bfc009
    20dc:	09c35400 	j	70d5000 <_mem_avail_start-0x78f2b000>
    20e0:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    20e4:	0003bfc0 	sll	s7,v1,0x1f
    20e8:	0000e08d 	break	0x0,0x382
    20ec:	00000000 	nop
    20f0:	14000000 	bnez	zero,20f4 <_mem_avail_start-0x7fffdf0c>
    20f4:	b4bfc009 	0xb4bfc009
    20f8:	01bfc009 	0x1bfc009
    20fc:	09b46100 	j	6d18400 <_mem_avail_start-0x792e7c00>
    2100:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2104:	0003bfc0 	sll	s7,v1,0x1f
    2108:	bc00dc91 	cache	0x0,-9071(zero)
    210c:	c4bfc009 	lwc1	$f31,-16375(a1)
    2110:	03bfc009 	0x3bfc009
    2114:	00dc8d00 	0xdc8d00
	...
    2120:	bfc00914 	cache	0x0,2324(s8)
    2124:	bfc009b0 	cache	0x0,2480(s8)
    2128:	b0620001 	0xb0620001
    212c:	bcbfc009 	cache	0x1f,-16375(a1)
    2130:	03bfc009 	0x3bfc009
    2134:	00d89100 	0xd89100
    2138:	bfc009bc 	cache	0x0,2492(s8)
    213c:	bfc009c4 	cache	0x0,2500(s8)
    2140:	d88d0003 	ldc2	$13,3(a0)
	...
    214c:	c0091400 	ll	t1,5120(zero)
    2150:	c009acbf 	ll	t1,-21313(zero)
    2154:	630001bf 	0x630001bf
    2158:	bfc009ac 	cache	0x0,2476(s8)
    215c:	bfc009bc 	cache	0x0,2492(s8)
    2160:	d4910003 	ldc1	$f17,3(a0)
    2164:	c009bc00 	ll	t1,-17408(zero)
    2168:	c009c4bf 	ll	t1,-15169(zero)
    216c:	8d0003bf 	lw	zero,959(t0)
    2170:	000000d4 	0xd4
    2174:	00000000 	nop
    2178:	09140000 	j	4500000 <_mem_avail_start-0x7bb00000>
    217c:	09a8bfc0 	j	6a2ff00 <_mem_avail_start-0x795d0100>
    2180:	0001bfc0 	sll	s7,at,0x1f
    2184:	c009a864 	ll	t1,-22428(zero)
    2188:	c009bcbf 	ll	t1,-17217(zero)
    218c:	910003bf 	lbu	zero,959(t0)
    2190:	09bc00d0 	j	6f00340 <_mem_avail_start-0x790ffcc0>
    2194:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2198:	0003bfc0 	sll	s7,v1,0x1f
    219c:	0000d08d 	break	0x0,0x342
    21a0:	00000000 	nop
    21a4:	14000000 	bnez	zero,21a8 <_mem_avail_start-0x7fffde58>
    21a8:	a4bfc009 	sh	ra,-16375(a1)
    21ac:	01bfc009 	0x1bfc009
    21b0:	09a46500 	j	6919400 <_mem_avail_start-0x796e6c00>
    21b4:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    21b8:	0003bfc0 	sll	s7,v1,0x1f
    21bc:	bc00cc91 	cache	0x0,-13167(zero)
    21c0:	c4bfc009 	lwc1	$f31,-16375(a1)
    21c4:	03bfc009 	0x3bfc009
    21c8:	00cc8d00 	0xcc8d00
	...
    21d4:	bfc00914 	cache	0x0,2324(s8)
    21d8:	bfc009a0 	cache	0x0,2464(s8)
    21dc:	a0660001 	sb	a2,1(v1)
    21e0:	bcbfc009 	cache	0x1f,-16375(a1)
    21e4:	03bfc009 	0x3bfc009
    21e8:	00c89100 	0xc89100
    21ec:	bfc009bc 	cache	0x0,2492(s8)
    21f0:	bfc009c4 	cache	0x0,2500(s8)
    21f4:	c88d0003 	lwc2	$13,3(a0)
	...
    2200:	c0091400 	ll	t1,5120(zero)
    2204:	c0099cbf 	ll	t1,-25409(zero)
    2208:	670001bf 	0x670001bf
    220c:	bfc0099c 	cache	0x0,2460(s8)
    2210:	bfc009bc 	cache	0x0,2492(s8)
    2214:	c4910003 	lwc1	$f17,3(a0)
    2218:	c009bc00 	ll	t1,-17408(zero)
    221c:	c009c4bf 	ll	t1,-15169(zero)
    2220:	8d0003bf 	lw	zero,959(t0)
    2224:	000000c4 	0xc4
    2228:	00000000 	nop
    222c:	09140000 	j	4500000 <_mem_avail_start-0x7bb00000>
    2230:	0998bfc0 	j	662ff00 <_mem_avail_start-0x799d0100>
    2234:	0001bfc0 	sll	s7,at,0x1f
    2238:	c009986e 	ll	t1,-26514(zero)
    223c:	c009bcbf 	ll	t1,-17217(zero)
    2240:	910003bf 	lbu	zero,959(t0)
    2244:	09bc00c0 	j	6f00300 <_mem_avail_start-0x790ffd00>
    2248:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    224c:	0003bfc0 	sll	s7,v1,0x1f
    2250:	0000c08d 	break	0x0,0x302
    2254:	00000000 	nop
    2258:	14000000 	bnez	zero,225c <_mem_avail_start-0x7fffdda4>
    225c:	bcbfc009 	cache	0x1f,-16375(a1)
    2260:	03bfc009 	0x3bfc009
    2264:	7f989100 	0x7f989100
    2268:	bfc009bc 	cache	0x0,2492(s8)
    226c:	bfc009c4 	cache	0x0,2500(s8)
    2270:	988d0003 	lwr	t5,3(a0)
    2274:	0000007f 	0x7f
    2278:	00000000 	nop
    227c:	c0091400 	ll	t1,5120(zero)
    2280:	c009bcbf 	ll	t1,-17217(zero)
    2284:	910003bf 	lbu	zero,959(t0)
    2288:	09bc7f9c 	j	6f1fe70 <_mem_avail_start-0x790e0190>
    228c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2290:	0003bfc0 	sll	s7,v1,0x1f
    2294:	007f9c8d 	break	0x7f,0x272
    2298:	00000000 	nop
    229c:	14000000 	bnez	zero,22a0 <_mem_avail_start-0x7fffdd60>
    22a0:	bcbfc009 	cache	0x1f,-16375(a1)
    22a4:	03bfc009 	0x3bfc009
    22a8:	7fa09100 	0x7fa09100
    22ac:	bfc009bc 	cache	0x0,2492(s8)
    22b0:	bfc009c4 	cache	0x0,2500(s8)
    22b4:	a08d0003 	sb	t5,3(a0)
    22b8:	0000007f 	0x7f
    22bc:	00000000 	nop
    22c0:	c0091400 	ll	t1,5120(zero)
    22c4:	c009bcbf 	ll	t1,-17217(zero)
    22c8:	910003bf 	lbu	zero,959(t0)
    22cc:	09bc7fa4 	j	6f1fe90 <_mem_avail_start-0x790e0170>
    22d0:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    22d4:	0003bfc0 	sll	s7,v1,0x1f
    22d8:	007fa48d 	break	0x7f,0x292
    22dc:	00000000 	nop
    22e0:	14000000 	bnez	zero,22e4 <_mem_avail_start-0x7fffdd1c>
    22e4:	bcbfc009 	cache	0x1f,-16375(a1)
    22e8:	03bfc009 	0x3bfc009
    22ec:	7fa89100 	0x7fa89100
    22f0:	bfc009bc 	cache	0x0,2492(s8)
    22f4:	bfc009c4 	cache	0x0,2500(s8)
    22f8:	a88d0003 	swl	t5,3(a0)
    22fc:	0000007f 	0x7f
    2300:	00000000 	nop
    2304:	c0092000 	ll	t1,8192(zero)
    2308:	c009bcbf 	ll	t1,-17217(zero)
    230c:	600001bf 	0x600001bf
    2310:	bfc009bc 	cache	0x0,2492(s8)
    2314:	bfc009c3 	cache	0x0,2499(s8)
    2318:	c3540001 	ll	s4,1(k0)
    231c:	c4bfc009 	lwc1	$f31,-16375(a1)
    2320:	03bfc009 	0x3bfc009
    2324:	00e08d00 	0xe08d00
	...
    2330:	bfc00920 	cache	0x0,2336(s8)
    2334:	bfc009b4 	cache	0x0,2484(s8)
    2338:	b4610001 	0xb4610001
    233c:	bcbfc009 	cache	0x1f,-16375(a1)
    2340:	03bfc009 	0x3bfc009
    2344:	00dc9100 	0xdc9100
    2348:	bfc009bc 	cache	0x0,2492(s8)
    234c:	bfc009c4 	cache	0x0,2500(s8)
    2350:	dc8d0003 	ldc3	$13,3(a0)
	...
    235c:	c0092000 	ll	t1,8192(zero)
    2360:	c009b0bf 	ll	t1,-20289(zero)
    2364:	620001bf 	0x620001bf
    2368:	bfc009b0 	cache	0x0,2480(s8)
    236c:	bfc009bc 	cache	0x0,2492(s8)
    2370:	d8910003 	ldc2	$17,3(a0)
    2374:	c009bc00 	ll	t1,-17408(zero)
    2378:	c009c4bf 	ll	t1,-15169(zero)
    237c:	8d0003bf 	lw	zero,959(t0)
    2380:	000000d8 	0xd8
    2384:	00000000 	nop
    2388:	09200000 	j	4800000 <_mem_avail_start-0x7b800000>
    238c:	09acbfc0 	j	6b2ff00 <_mem_avail_start-0x794d0100>
    2390:	0001bfc0 	sll	s7,at,0x1f
    2394:	c009ac63 	ll	t1,-21405(zero)
    2398:	c009bcbf 	ll	t1,-17217(zero)
    239c:	910003bf 	lbu	zero,959(t0)
    23a0:	09bc00d4 	j	6f00350 <_mem_avail_start-0x790ffcb0>
    23a4:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    23a8:	0003bfc0 	sll	s7,v1,0x1f
    23ac:	0000d48d 	break	0x0,0x352
    23b0:	00000000 	nop
    23b4:	20000000 	addi	zero,zero,0
    23b8:	a8bfc009 	swl	ra,-16375(a1)
    23bc:	01bfc009 	0x1bfc009
    23c0:	09a86400 	j	6a19000 <_mem_avail_start-0x795e7000>
    23c4:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    23c8:	0003bfc0 	sll	s7,v1,0x1f
    23cc:	bc00d091 	cache	0x0,-12143(zero)
    23d0:	c4bfc009 	lwc1	$f31,-16375(a1)
    23d4:	03bfc009 	0x3bfc009
    23d8:	00d08d00 	0xd08d00
	...
    23e4:	bfc00920 	cache	0x0,2336(s8)
    23e8:	bfc009a4 	cache	0x0,2468(s8)
    23ec:	a4650001 	sh	a1,1(v1)
    23f0:	bcbfc009 	cache	0x1f,-16375(a1)
    23f4:	03bfc009 	0x3bfc009
    23f8:	00cc9100 	0xcc9100
    23fc:	bfc009bc 	cache	0x0,2492(s8)
    2400:	bfc009c4 	cache	0x0,2500(s8)
    2404:	cc8d0003 	pref	0xd,3(a0)
	...
    2410:	c0092000 	ll	t1,8192(zero)
    2414:	c009a0bf 	ll	t1,-24385(zero)
    2418:	660001bf 	0x660001bf
    241c:	bfc009a0 	cache	0x0,2464(s8)
    2420:	bfc009bc 	cache	0x0,2492(s8)
    2424:	c8910003 	lwc2	$17,3(a0)
    2428:	c009bc00 	ll	t1,-17408(zero)
    242c:	c009c4bf 	ll	t1,-15169(zero)
    2430:	8d0003bf 	lw	zero,959(t0)
    2434:	000000c8 	0xc8
    2438:	00000000 	nop
    243c:	09200000 	j	4800000 <_mem_avail_start-0x7b800000>
    2440:	099cbfc0 	j	672ff00 <_mem_avail_start-0x798d0100>
    2444:	0001bfc0 	sll	s7,at,0x1f
    2448:	c0099c67 	ll	t1,-25497(zero)
    244c:	c009bcbf 	ll	t1,-17217(zero)
    2450:	910003bf 	lbu	zero,959(t0)
    2454:	09bc00c4 	j	6f00310 <_mem_avail_start-0x790ffcf0>
    2458:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    245c:	0003bfc0 	sll	s7,v1,0x1f
    2460:	0000c48d 	break	0x0,0x312
    2464:	00000000 	nop
    2468:	20000000 	addi	zero,zero,0
    246c:	98bfc009 	lwr	ra,-16375(a1)
    2470:	01bfc009 	0x1bfc009
    2474:	09986e00 	j	661b800 <_mem_avail_start-0x799e4800>
    2478:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    247c:	0003bfc0 	sll	s7,v1,0x1f
    2480:	bc00c091 	cache	0x0,-16239(zero)
    2484:	c4bfc009 	lwc1	$f31,-16375(a1)
    2488:	03bfc009 	0x3bfc009
    248c:	00c08d00 	0xc08d00
	...
    2498:	bfc00920 	cache	0x0,2336(s8)
    249c:	bfc009bc 	cache	0x0,2492(s8)
    24a0:	98910003 	lwr	s1,3(a0)
    24a4:	c009bc7f 	ll	t1,-17281(zero)
    24a8:	c009c4bf 	ll	t1,-15169(zero)
    24ac:	8d0003bf 	lw	zero,959(t0)
    24b0:	00007f98 	0x7f98
    24b4:	00000000 	nop
    24b8:	09200000 	j	4800000 <_mem_avail_start-0x7b800000>
    24bc:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    24c0:	0003bfc0 	sll	s7,v1,0x1f
    24c4:	bc7f9c91 	cache	0x1f,-25455(v1)
    24c8:	c4bfc009 	lwc1	$f31,-16375(a1)
    24cc:	03bfc009 	0x3bfc009
    24d0:	7f9c8d00 	0x7f9c8d00
	...
    24dc:	bfc00920 	cache	0x0,2336(s8)
    24e0:	bfc009bc 	cache	0x0,2492(s8)
    24e4:	a0910003 	sb	s1,3(a0)
    24e8:	c009bc7f 	ll	t1,-17281(zero)
    24ec:	c009c4bf 	ll	t1,-15169(zero)
    24f0:	8d0003bf 	lw	zero,959(t0)
    24f4:	00007fa0 	0x7fa0
    24f8:	00000000 	nop
    24fc:	09200000 	j	4800000 <_mem_avail_start-0x7b800000>
    2500:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2504:	0003bfc0 	sll	s7,v1,0x1f
    2508:	bc7fa491 	cache	0x1f,-23407(v1)
    250c:	c4bfc009 	lwc1	$f31,-16375(a1)
    2510:	03bfc009 	0x3bfc009
    2514:	7fa48d00 	0x7fa48d00
	...
    2520:	bfc0092c 	cache	0x0,2348(s8)
    2524:	bfc009bc 	cache	0x0,2492(s8)
    2528:	bc600001 	cache	0x0,1(v1)
    252c:	c3bfc009 	ll	ra,-16375(sp)
    2530:	01bfc009 	0x1bfc009
    2534:	09c35400 	j	70d5000 <_mem_avail_start-0x78f2b000>
    2538:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    253c:	0003bfc0 	sll	s7,v1,0x1f
    2540:	0000e08d 	break	0x0,0x382
    2544:	00000000 	nop
    2548:	2c000000 	sltiu	zero,zero,0
    254c:	b4bfc009 	0xb4bfc009
    2550:	01bfc009 	0x1bfc009
    2554:	09b46100 	j	6d18400 <_mem_avail_start-0x792e7c00>
    2558:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    255c:	0003bfc0 	sll	s7,v1,0x1f
    2560:	bc00dc91 	cache	0x0,-9071(zero)
    2564:	c4bfc009 	lwc1	$f31,-16375(a1)
    2568:	03bfc009 	0x3bfc009
    256c:	00dc8d00 	0xdc8d00
	...
    2578:	bfc0092c 	cache	0x0,2348(s8)
    257c:	bfc009b0 	cache	0x0,2480(s8)
    2580:	b0620001 	0xb0620001
    2584:	bcbfc009 	cache	0x1f,-16375(a1)
    2588:	03bfc009 	0x3bfc009
    258c:	00d89100 	0xd89100
    2590:	bfc009bc 	cache	0x0,2492(s8)
    2594:	bfc009c4 	cache	0x0,2500(s8)
    2598:	d88d0003 	ldc2	$13,3(a0)
	...
    25a4:	c0092c00 	ll	t1,11264(zero)
    25a8:	c009acbf 	ll	t1,-21313(zero)
    25ac:	630001bf 	0x630001bf
    25b0:	bfc009ac 	cache	0x0,2476(s8)
    25b4:	bfc009bc 	cache	0x0,2492(s8)
    25b8:	d4910003 	ldc1	$f17,3(a0)
    25bc:	c009bc00 	ll	t1,-17408(zero)
    25c0:	c009c4bf 	ll	t1,-15169(zero)
    25c4:	8d0003bf 	lw	zero,959(t0)
    25c8:	000000d4 	0xd4
    25cc:	00000000 	nop
    25d0:	092c0000 	j	4b00000 <_mem_avail_start-0x7b500000>
    25d4:	09a8bfc0 	j	6a2ff00 <_mem_avail_start-0x795d0100>
    25d8:	0001bfc0 	sll	s7,at,0x1f
    25dc:	c009a864 	ll	t1,-22428(zero)
    25e0:	c009bcbf 	ll	t1,-17217(zero)
    25e4:	910003bf 	lbu	zero,959(t0)
    25e8:	09bc00d0 	j	6f00340 <_mem_avail_start-0x790ffcc0>
    25ec:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    25f0:	0003bfc0 	sll	s7,v1,0x1f
    25f4:	0000d08d 	break	0x0,0x342
    25f8:	00000000 	nop
    25fc:	2c000000 	sltiu	zero,zero,0
    2600:	a4bfc009 	sh	ra,-16375(a1)
    2604:	01bfc009 	0x1bfc009
    2608:	09a46500 	j	6919400 <_mem_avail_start-0x796e6c00>
    260c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2610:	0003bfc0 	sll	s7,v1,0x1f
    2614:	bc00cc91 	cache	0x0,-13167(zero)
    2618:	c4bfc009 	lwc1	$f31,-16375(a1)
    261c:	03bfc009 	0x3bfc009
    2620:	00cc8d00 	0xcc8d00
	...
    262c:	bfc0092c 	cache	0x0,2348(s8)
    2630:	bfc009a0 	cache	0x0,2464(s8)
    2634:	a0660001 	sb	a2,1(v1)
    2638:	bcbfc009 	cache	0x1f,-16375(a1)
    263c:	03bfc009 	0x3bfc009
    2640:	00c89100 	0xc89100
    2644:	bfc009bc 	cache	0x0,2492(s8)
    2648:	bfc009c4 	cache	0x0,2500(s8)
    264c:	c88d0003 	lwc2	$13,3(a0)
	...
    2658:	c0092c00 	ll	t1,11264(zero)
    265c:	c0099cbf 	ll	t1,-25409(zero)
    2660:	670001bf 	0x670001bf
    2664:	bfc0099c 	cache	0x0,2460(s8)
    2668:	bfc009bc 	cache	0x0,2492(s8)
    266c:	c4910003 	lwc1	$f17,3(a0)
    2670:	c009bc00 	ll	t1,-17408(zero)
    2674:	c009c4bf 	ll	t1,-15169(zero)
    2678:	8d0003bf 	lw	zero,959(t0)
    267c:	000000c4 	0xc4
    2680:	00000000 	nop
    2684:	092c0000 	j	4b00000 <_mem_avail_start-0x7b500000>
    2688:	0998bfc0 	j	662ff00 <_mem_avail_start-0x799d0100>
    268c:	0001bfc0 	sll	s7,at,0x1f
    2690:	c009986e 	ll	t1,-26514(zero)
    2694:	c009bcbf 	ll	t1,-17217(zero)
    2698:	910003bf 	lbu	zero,959(t0)
    269c:	09bc00c0 	j	6f00300 <_mem_avail_start-0x790ffd00>
    26a0:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    26a4:	0003bfc0 	sll	s7,v1,0x1f
    26a8:	0000c08d 	break	0x0,0x302
    26ac:	00000000 	nop
    26b0:	2c000000 	sltiu	zero,zero,0
    26b4:	bcbfc009 	cache	0x1f,-16375(a1)
    26b8:	03bfc009 	0x3bfc009
    26bc:	7f989100 	0x7f989100
    26c0:	bfc009bc 	cache	0x0,2492(s8)
    26c4:	bfc009c4 	cache	0x0,2500(s8)
    26c8:	988d0003 	lwr	t5,3(a0)
    26cc:	0000007f 	0x7f
    26d0:	00000000 	nop
    26d4:	c0092c00 	ll	t1,11264(zero)
    26d8:	c009bcbf 	ll	t1,-17217(zero)
    26dc:	910003bf 	lbu	zero,959(t0)
    26e0:	09bc7f9c 	j	6f1fe70 <_mem_avail_start-0x790e0190>
    26e4:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    26e8:	0003bfc0 	sll	s7,v1,0x1f
    26ec:	007f9c8d 	break	0x7f,0x272
    26f0:	00000000 	nop
    26f4:	2c000000 	sltiu	zero,zero,0
    26f8:	bcbfc009 	cache	0x1f,-16375(a1)
    26fc:	03bfc009 	0x3bfc009
    2700:	7fa09100 	0x7fa09100
    2704:	bfc009bc 	cache	0x0,2492(s8)
    2708:	bfc009c4 	cache	0x0,2500(s8)
    270c:	a08d0003 	sb	t5,3(a0)
    2710:	0000007f 	0x7f
    2714:	00000000 	nop
    2718:	c0093800 	ll	t1,14336(zero)
    271c:	c009bcbf 	ll	t1,-17217(zero)
    2720:	600001bf 	0x600001bf
    2724:	bfc009bc 	cache	0x0,2492(s8)
    2728:	bfc009c3 	cache	0x0,2499(s8)
    272c:	c3540001 	ll	s4,1(k0)
    2730:	c4bfc009 	lwc1	$f31,-16375(a1)
    2734:	03bfc009 	0x3bfc009
    2738:	00e08d00 	0xe08d00
	...
    2744:	bfc00938 	cache	0x0,2360(s8)
    2748:	bfc009b4 	cache	0x0,2484(s8)
    274c:	b4610001 	0xb4610001
    2750:	bcbfc009 	cache	0x1f,-16375(a1)
    2754:	03bfc009 	0x3bfc009
    2758:	00dc9100 	0xdc9100
    275c:	bfc009bc 	cache	0x0,2492(s8)
    2760:	bfc009c4 	cache	0x0,2500(s8)
    2764:	dc8d0003 	ldc3	$13,3(a0)
	...
    2770:	c0093800 	ll	t1,14336(zero)
    2774:	c009b0bf 	ll	t1,-20289(zero)
    2778:	620001bf 	0x620001bf
    277c:	bfc009b0 	cache	0x0,2480(s8)
    2780:	bfc009bc 	cache	0x0,2492(s8)
    2784:	d8910003 	ldc2	$17,3(a0)
    2788:	c009bc00 	ll	t1,-17408(zero)
    278c:	c009c4bf 	ll	t1,-15169(zero)
    2790:	8d0003bf 	lw	zero,959(t0)
    2794:	000000d8 	0xd8
    2798:	00000000 	nop
    279c:	09380000 	j	4e00000 <_mem_avail_start-0x7b200000>
    27a0:	09acbfc0 	j	6b2ff00 <_mem_avail_start-0x794d0100>
    27a4:	0001bfc0 	sll	s7,at,0x1f
    27a8:	c009ac63 	ll	t1,-21405(zero)
    27ac:	c009bcbf 	ll	t1,-17217(zero)
    27b0:	910003bf 	lbu	zero,959(t0)
    27b4:	09bc00d4 	j	6f00350 <_mem_avail_start-0x790ffcb0>
    27b8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    27bc:	0003bfc0 	sll	s7,v1,0x1f
    27c0:	0000d48d 	break	0x0,0x352
    27c4:	00000000 	nop
    27c8:	38000000 	xori	zero,zero,0x0
    27cc:	a8bfc009 	swl	ra,-16375(a1)
    27d0:	01bfc009 	0x1bfc009
    27d4:	09a86400 	j	6a19000 <_mem_avail_start-0x795e7000>
    27d8:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    27dc:	0003bfc0 	sll	s7,v1,0x1f
    27e0:	bc00d091 	cache	0x0,-12143(zero)
    27e4:	c4bfc009 	lwc1	$f31,-16375(a1)
    27e8:	03bfc009 	0x3bfc009
    27ec:	00d08d00 	0xd08d00
	...
    27f8:	bfc00938 	cache	0x0,2360(s8)
    27fc:	bfc009a4 	cache	0x0,2468(s8)
    2800:	a4650001 	sh	a1,1(v1)
    2804:	bcbfc009 	cache	0x1f,-16375(a1)
    2808:	03bfc009 	0x3bfc009
    280c:	00cc9100 	0xcc9100
    2810:	bfc009bc 	cache	0x0,2492(s8)
    2814:	bfc009c4 	cache	0x0,2500(s8)
    2818:	cc8d0003 	pref	0xd,3(a0)
	...
    2824:	c0093800 	ll	t1,14336(zero)
    2828:	c009a0bf 	ll	t1,-24385(zero)
    282c:	660001bf 	0x660001bf
    2830:	bfc009a0 	cache	0x0,2464(s8)
    2834:	bfc009bc 	cache	0x0,2492(s8)
    2838:	c8910003 	lwc2	$17,3(a0)
    283c:	c009bc00 	ll	t1,-17408(zero)
    2840:	c009c4bf 	ll	t1,-15169(zero)
    2844:	8d0003bf 	lw	zero,959(t0)
    2848:	000000c8 	0xc8
    284c:	00000000 	nop
    2850:	09380000 	j	4e00000 <_mem_avail_start-0x7b200000>
    2854:	099cbfc0 	j	672ff00 <_mem_avail_start-0x798d0100>
    2858:	0001bfc0 	sll	s7,at,0x1f
    285c:	c0099c67 	ll	t1,-25497(zero)
    2860:	c009bcbf 	ll	t1,-17217(zero)
    2864:	910003bf 	lbu	zero,959(t0)
    2868:	09bc00c4 	j	6f00310 <_mem_avail_start-0x790ffcf0>
    286c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2870:	0003bfc0 	sll	s7,v1,0x1f
    2874:	0000c48d 	break	0x0,0x312
    2878:	00000000 	nop
    287c:	38000000 	xori	zero,zero,0x0
    2880:	98bfc009 	lwr	ra,-16375(a1)
    2884:	01bfc009 	0x1bfc009
    2888:	09986e00 	j	661b800 <_mem_avail_start-0x799e4800>
    288c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2890:	0003bfc0 	sll	s7,v1,0x1f
    2894:	bc00c091 	cache	0x0,-16239(zero)
    2898:	c4bfc009 	lwc1	$f31,-16375(a1)
    289c:	03bfc009 	0x3bfc009
    28a0:	00c08d00 	0xc08d00
	...
    28ac:	bfc00938 	cache	0x0,2360(s8)
    28b0:	bfc009bc 	cache	0x0,2492(s8)
    28b4:	98910003 	lwr	s1,3(a0)
    28b8:	c009bc7f 	ll	t1,-17281(zero)
    28bc:	c009c4bf 	ll	t1,-15169(zero)
    28c0:	8d0003bf 	lw	zero,959(t0)
    28c4:	00007f98 	0x7f98
    28c8:	00000000 	nop
    28cc:	09380000 	j	4e00000 <_mem_avail_start-0x7b200000>
    28d0:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    28d4:	0003bfc0 	sll	s7,v1,0x1f
    28d8:	bc7f9c91 	cache	0x1f,-25455(v1)
    28dc:	c4bfc009 	lwc1	$f31,-16375(a1)
    28e0:	03bfc009 	0x3bfc009
    28e4:	7f9c8d00 	0x7f9c8d00
	...
    28f0:	bfc00944 	cache	0x0,2372(s8)
    28f4:	bfc009bc 	cache	0x0,2492(s8)
    28f8:	bc600001 	cache	0x0,1(v1)
    28fc:	c3bfc009 	ll	ra,-16375(sp)
    2900:	01bfc009 	0x1bfc009
    2904:	09c35400 	j	70d5000 <_mem_avail_start-0x78f2b000>
    2908:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    290c:	0003bfc0 	sll	s7,v1,0x1f
    2910:	0000e08d 	break	0x0,0x382
    2914:	00000000 	nop
    2918:	44000000 	mfc1	zero,$f0
    291c:	b4bfc009 	0xb4bfc009
    2920:	01bfc009 	0x1bfc009
    2924:	09b46100 	j	6d18400 <_mem_avail_start-0x792e7c00>
    2928:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    292c:	0003bfc0 	sll	s7,v1,0x1f
    2930:	bc00dc91 	cache	0x0,-9071(zero)
    2934:	c4bfc009 	lwc1	$f31,-16375(a1)
    2938:	03bfc009 	0x3bfc009
    293c:	00dc8d00 	0xdc8d00
	...
    2948:	bfc00944 	cache	0x0,2372(s8)
    294c:	bfc009b0 	cache	0x0,2480(s8)
    2950:	b0620001 	0xb0620001
    2954:	bcbfc009 	cache	0x1f,-16375(a1)
    2958:	03bfc009 	0x3bfc009
    295c:	00d89100 	0xd89100
    2960:	bfc009bc 	cache	0x0,2492(s8)
    2964:	bfc009c4 	cache	0x0,2500(s8)
    2968:	d88d0003 	ldc2	$13,3(a0)
	...
    2974:	c0094400 	ll	t1,17408(zero)
    2978:	c009acbf 	ll	t1,-21313(zero)
    297c:	630001bf 	0x630001bf
    2980:	bfc009ac 	cache	0x0,2476(s8)
    2984:	bfc009bc 	cache	0x0,2492(s8)
    2988:	d4910003 	ldc1	$f17,3(a0)
    298c:	c009bc00 	ll	t1,-17408(zero)
    2990:	c009c4bf 	ll	t1,-15169(zero)
    2994:	8d0003bf 	lw	zero,959(t0)
    2998:	000000d4 	0xd4
    299c:	00000000 	nop
    29a0:	09440000 	j	5100000 <_mem_avail_start-0x7af00000>
    29a4:	09a8bfc0 	j	6a2ff00 <_mem_avail_start-0x795d0100>
    29a8:	0001bfc0 	sll	s7,at,0x1f
    29ac:	c009a864 	ll	t1,-22428(zero)
    29b0:	c009bcbf 	ll	t1,-17217(zero)
    29b4:	910003bf 	lbu	zero,959(t0)
    29b8:	09bc00d0 	j	6f00340 <_mem_avail_start-0x790ffcc0>
    29bc:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    29c0:	0003bfc0 	sll	s7,v1,0x1f
    29c4:	0000d08d 	break	0x0,0x342
    29c8:	00000000 	nop
    29cc:	44000000 	mfc1	zero,$f0
    29d0:	a4bfc009 	sh	ra,-16375(a1)
    29d4:	01bfc009 	0x1bfc009
    29d8:	09a46500 	j	6919400 <_mem_avail_start-0x796e6c00>
    29dc:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    29e0:	0003bfc0 	sll	s7,v1,0x1f
    29e4:	bc00cc91 	cache	0x0,-13167(zero)
    29e8:	c4bfc009 	lwc1	$f31,-16375(a1)
    29ec:	03bfc009 	0x3bfc009
    29f0:	00cc8d00 	0xcc8d00
	...
    29fc:	bfc00944 	cache	0x0,2372(s8)
    2a00:	bfc009a0 	cache	0x0,2464(s8)
    2a04:	a0660001 	sb	a2,1(v1)
    2a08:	bcbfc009 	cache	0x1f,-16375(a1)
    2a0c:	03bfc009 	0x3bfc009
    2a10:	00c89100 	0xc89100
    2a14:	bfc009bc 	cache	0x0,2492(s8)
    2a18:	bfc009c4 	cache	0x0,2500(s8)
    2a1c:	c88d0003 	lwc2	$13,3(a0)
	...
    2a28:	c0094400 	ll	t1,17408(zero)
    2a2c:	c0099cbf 	ll	t1,-25409(zero)
    2a30:	670001bf 	0x670001bf
    2a34:	bfc0099c 	cache	0x0,2460(s8)
    2a38:	bfc009bc 	cache	0x0,2492(s8)
    2a3c:	c4910003 	lwc1	$f17,3(a0)
    2a40:	c009bc00 	ll	t1,-17408(zero)
    2a44:	c009c4bf 	ll	t1,-15169(zero)
    2a48:	8d0003bf 	lw	zero,959(t0)
    2a4c:	000000c4 	0xc4
    2a50:	00000000 	nop
    2a54:	09440000 	j	5100000 <_mem_avail_start-0x7af00000>
    2a58:	0998bfc0 	j	662ff00 <_mem_avail_start-0x799d0100>
    2a5c:	0001bfc0 	sll	s7,at,0x1f
    2a60:	c009986e 	ll	t1,-26514(zero)
    2a64:	c009bcbf 	ll	t1,-17217(zero)
    2a68:	910003bf 	lbu	zero,959(t0)
    2a6c:	09bc00c0 	j	6f00300 <_mem_avail_start-0x790ffd00>
    2a70:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2a74:	0003bfc0 	sll	s7,v1,0x1f
    2a78:	0000c08d 	break	0x0,0x302
    2a7c:	00000000 	nop
    2a80:	44000000 	mfc1	zero,$f0
    2a84:	bcbfc009 	cache	0x1f,-16375(a1)
    2a88:	03bfc009 	0x3bfc009
    2a8c:	7f989100 	0x7f989100
    2a90:	bfc009bc 	cache	0x0,2492(s8)
    2a94:	bfc009c4 	cache	0x0,2500(s8)
    2a98:	988d0003 	lwr	t5,3(a0)
    2a9c:	0000007f 	0x7f
    2aa0:	00000000 	nop
    2aa4:	c0095000 	ll	t1,20480(zero)
    2aa8:	c009bcbf 	ll	t1,-17217(zero)
    2aac:	600001bf 	0x600001bf
    2ab0:	bfc009bc 	cache	0x0,2492(s8)
    2ab4:	bfc009c3 	cache	0x0,2499(s8)
    2ab8:	c3540001 	ll	s4,1(k0)
    2abc:	c4bfc009 	lwc1	$f31,-16375(a1)
    2ac0:	03bfc009 	0x3bfc009
    2ac4:	00e08d00 	0xe08d00
	...
    2ad0:	bfc00950 	cache	0x0,2384(s8)
    2ad4:	bfc009b4 	cache	0x0,2484(s8)
    2ad8:	b4610001 	0xb4610001
    2adc:	bcbfc009 	cache	0x1f,-16375(a1)
    2ae0:	03bfc009 	0x3bfc009
    2ae4:	00dc9100 	0xdc9100
    2ae8:	bfc009bc 	cache	0x0,2492(s8)
    2aec:	bfc009c4 	cache	0x0,2500(s8)
    2af0:	dc8d0003 	ldc3	$13,3(a0)
	...
    2afc:	c0095000 	ll	t1,20480(zero)
    2b00:	c009b0bf 	ll	t1,-20289(zero)
    2b04:	620001bf 	0x620001bf
    2b08:	bfc009b0 	cache	0x0,2480(s8)
    2b0c:	bfc009bc 	cache	0x0,2492(s8)
    2b10:	d8910003 	ldc2	$17,3(a0)
    2b14:	c009bc00 	ll	t1,-17408(zero)
    2b18:	c009c4bf 	ll	t1,-15169(zero)
    2b1c:	8d0003bf 	lw	zero,959(t0)
    2b20:	000000d8 	0xd8
    2b24:	00000000 	nop
    2b28:	09500000 	j	5400000 <_mem_avail_start-0x7ac00000>
    2b2c:	09acbfc0 	j	6b2ff00 <_mem_avail_start-0x794d0100>
    2b30:	0001bfc0 	sll	s7,at,0x1f
    2b34:	c009ac63 	ll	t1,-21405(zero)
    2b38:	c009bcbf 	ll	t1,-17217(zero)
    2b3c:	910003bf 	lbu	zero,959(t0)
    2b40:	09bc00d4 	j	6f00350 <_mem_avail_start-0x790ffcb0>
    2b44:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2b48:	0003bfc0 	sll	s7,v1,0x1f
    2b4c:	0000d48d 	break	0x0,0x352
    2b50:	00000000 	nop
    2b54:	50000000 	beqzl	zero,2b58 <_mem_avail_start-0x7fffd4a8>
    2b58:	a8bfc009 	swl	ra,-16375(a1)
    2b5c:	01bfc009 	0x1bfc009
    2b60:	09a86400 	j	6a19000 <_mem_avail_start-0x795e7000>
    2b64:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2b68:	0003bfc0 	sll	s7,v1,0x1f
    2b6c:	bc00d091 	cache	0x0,-12143(zero)
    2b70:	c4bfc009 	lwc1	$f31,-16375(a1)
    2b74:	03bfc009 	0x3bfc009
    2b78:	00d08d00 	0xd08d00
	...
    2b84:	bfc00950 	cache	0x0,2384(s8)
    2b88:	bfc009a4 	cache	0x0,2468(s8)
    2b8c:	a4650001 	sh	a1,1(v1)
    2b90:	bcbfc009 	cache	0x1f,-16375(a1)
    2b94:	03bfc009 	0x3bfc009
    2b98:	00cc9100 	0xcc9100
    2b9c:	bfc009bc 	cache	0x0,2492(s8)
    2ba0:	bfc009c4 	cache	0x0,2500(s8)
    2ba4:	cc8d0003 	pref	0xd,3(a0)
	...
    2bb0:	c0095000 	ll	t1,20480(zero)
    2bb4:	c009a0bf 	ll	t1,-24385(zero)
    2bb8:	660001bf 	0x660001bf
    2bbc:	bfc009a0 	cache	0x0,2464(s8)
    2bc0:	bfc009bc 	cache	0x0,2492(s8)
    2bc4:	c8910003 	lwc2	$17,3(a0)
    2bc8:	c009bc00 	ll	t1,-17408(zero)
    2bcc:	c009c4bf 	ll	t1,-15169(zero)
    2bd0:	8d0003bf 	lw	zero,959(t0)
    2bd4:	000000c8 	0xc8
    2bd8:	00000000 	nop
    2bdc:	09500000 	j	5400000 <_mem_avail_start-0x7ac00000>
    2be0:	099cbfc0 	j	672ff00 <_mem_avail_start-0x798d0100>
    2be4:	0001bfc0 	sll	s7,at,0x1f
    2be8:	c0099c67 	ll	t1,-25497(zero)
    2bec:	c009bcbf 	ll	t1,-17217(zero)
    2bf0:	910003bf 	lbu	zero,959(t0)
    2bf4:	09bc00c4 	j	6f00310 <_mem_avail_start-0x790ffcf0>
    2bf8:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2bfc:	0003bfc0 	sll	s7,v1,0x1f
    2c00:	0000c48d 	break	0x0,0x312
    2c04:	00000000 	nop
    2c08:	50000000 	beqzl	zero,2c0c <_mem_avail_start-0x7fffd3f4>
    2c0c:	98bfc009 	lwr	ra,-16375(a1)
    2c10:	01bfc009 	0x1bfc009
    2c14:	09986e00 	j	661b800 <_mem_avail_start-0x799e4800>
    2c18:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2c1c:	0003bfc0 	sll	s7,v1,0x1f
    2c20:	bc00c091 	cache	0x0,-16239(zero)
    2c24:	c4bfc009 	lwc1	$f31,-16375(a1)
    2c28:	03bfc009 	0x3bfc009
    2c2c:	00c08d00 	0xc08d00
	...
    2c38:	bfc00958 	cache	0x0,2392(s8)
    2c3c:	bfc009bc 	cache	0x0,2492(s8)
    2c40:	bc600001 	cache	0x0,1(v1)
    2c44:	c3bfc009 	ll	ra,-16375(sp)
    2c48:	01bfc009 	0x1bfc009
    2c4c:	09c35400 	j	70d5000 <_mem_avail_start-0x78f2b000>
    2c50:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2c54:	0003bfc0 	sll	s7,v1,0x1f
    2c58:	0000e08d 	break	0x0,0x382
    2c5c:	00000000 	nop
    2c60:	58000000 	blezl	zero,2c64 <_mem_avail_start-0x7fffd39c>
    2c64:	b4bfc009 	0xb4bfc009
    2c68:	01bfc009 	0x1bfc009
    2c6c:	09b46100 	j	6d18400 <_mem_avail_start-0x792e7c00>
    2c70:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2c74:	0003bfc0 	sll	s7,v1,0x1f
    2c78:	bc00dc91 	cache	0x0,-9071(zero)
    2c7c:	c4bfc009 	lwc1	$f31,-16375(a1)
    2c80:	03bfc009 	0x3bfc009
    2c84:	00dc8d00 	0xdc8d00
	...
    2c90:	bfc00958 	cache	0x0,2392(s8)
    2c94:	bfc009b0 	cache	0x0,2480(s8)
    2c98:	b0620001 	0xb0620001
    2c9c:	bcbfc009 	cache	0x1f,-16375(a1)
    2ca0:	03bfc009 	0x3bfc009
    2ca4:	00d89100 	0xd89100
    2ca8:	bfc009bc 	cache	0x0,2492(s8)
    2cac:	bfc009c4 	cache	0x0,2500(s8)
    2cb0:	d88d0003 	ldc2	$13,3(a0)
	...
    2cbc:	c0095800 	ll	t1,22528(zero)
    2cc0:	c009acbf 	ll	t1,-21313(zero)
    2cc4:	630001bf 	0x630001bf
    2cc8:	bfc009ac 	cache	0x0,2476(s8)
    2ccc:	bfc009bc 	cache	0x0,2492(s8)
    2cd0:	d4910003 	ldc1	$f17,3(a0)
    2cd4:	c009bc00 	ll	t1,-17408(zero)
    2cd8:	c009c4bf 	ll	t1,-15169(zero)
    2cdc:	8d0003bf 	lw	zero,959(t0)
    2ce0:	000000d4 	0xd4
    2ce4:	00000000 	nop
    2ce8:	09580000 	j	5600000 <_mem_avail_start-0x7aa00000>
    2cec:	09a8bfc0 	j	6a2ff00 <_mem_avail_start-0x795d0100>
    2cf0:	0001bfc0 	sll	s7,at,0x1f
    2cf4:	c009a864 	ll	t1,-22428(zero)
    2cf8:	c009bcbf 	ll	t1,-17217(zero)
    2cfc:	910003bf 	lbu	zero,959(t0)
    2d00:	09bc00d0 	j	6f00340 <_mem_avail_start-0x790ffcc0>
    2d04:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2d08:	0003bfc0 	sll	s7,v1,0x1f
    2d0c:	0000d08d 	break	0x0,0x342
    2d10:	00000000 	nop
    2d14:	58000000 	blezl	zero,2d18 <_mem_avail_start-0x7fffd2e8>
    2d18:	a4bfc009 	sh	ra,-16375(a1)
    2d1c:	01bfc009 	0x1bfc009
    2d20:	09a46500 	j	6919400 <_mem_avail_start-0x796e6c00>
    2d24:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2d28:	0003bfc0 	sll	s7,v1,0x1f
    2d2c:	bc00cc91 	cache	0x0,-13167(zero)
    2d30:	c4bfc009 	lwc1	$f31,-16375(a1)
    2d34:	03bfc009 	0x3bfc009
    2d38:	00cc8d00 	0xcc8d00
	...
    2d44:	bfc00958 	cache	0x0,2392(s8)
    2d48:	bfc009a0 	cache	0x0,2464(s8)
    2d4c:	a0660001 	sb	a2,1(v1)
    2d50:	bcbfc009 	cache	0x1f,-16375(a1)
    2d54:	03bfc009 	0x3bfc009
    2d58:	00c89100 	0xc89100
    2d5c:	bfc009bc 	cache	0x0,2492(s8)
    2d60:	bfc009c4 	cache	0x0,2500(s8)
    2d64:	c88d0003 	lwc2	$13,3(a0)
	...
    2d70:	c0095800 	ll	t1,22528(zero)
    2d74:	c0099cbf 	ll	t1,-25409(zero)
    2d78:	670001bf 	0x670001bf
    2d7c:	bfc0099c 	cache	0x0,2460(s8)
    2d80:	bfc009bc 	cache	0x0,2492(s8)
    2d84:	c4910003 	lwc1	$f17,3(a0)
    2d88:	c009bc00 	ll	t1,-17408(zero)
    2d8c:	c009c4bf 	ll	t1,-15169(zero)
    2d90:	8d0003bf 	lw	zero,959(t0)
    2d94:	000000c4 	0xc4
    2d98:	00000000 	nop
    2d9c:	09600000 	j	5800000 <_mem_avail_start-0x7a800000>
    2da0:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2da4:	0001bfc0 	sll	s7,at,0x1f
    2da8:	c009bc60 	ll	t1,-17312(zero)
    2dac:	c009c3bf 	ll	t1,-15425(zero)
    2db0:	540001bf 	bnezl	zero,34b0 <_mem_avail_start-0x7fffcb50>
    2db4:	bfc009c3 	cache	0x0,2499(s8)
    2db8:	bfc009c4 	cache	0x0,2500(s8)
    2dbc:	e08d0003 	sc	t5,3(a0)
	...
    2dc8:	c0096000 	ll	t1,24576(zero)
    2dcc:	c009b4bf 	ll	t1,-19265(zero)
    2dd0:	610001bf 	0x610001bf
    2dd4:	bfc009b4 	cache	0x0,2484(s8)
    2dd8:	bfc009bc 	cache	0x0,2492(s8)
    2ddc:	dc910003 	ldc3	$17,3(a0)
    2de0:	c009bc00 	ll	t1,-17408(zero)
    2de4:	c009c4bf 	ll	t1,-15169(zero)
    2de8:	8d0003bf 	lw	zero,959(t0)
    2dec:	000000dc 	0xdc
    2df0:	00000000 	nop
    2df4:	09600000 	j	5800000 <_mem_avail_start-0x7a800000>
    2df8:	09b0bfc0 	j	6c2ff00 <_mem_avail_start-0x793d0100>
    2dfc:	0001bfc0 	sll	s7,at,0x1f
    2e00:	c009b062 	ll	t1,-20382(zero)
    2e04:	c009bcbf 	ll	t1,-17217(zero)
    2e08:	910003bf 	lbu	zero,959(t0)
    2e0c:	09bc00d8 	j	6f00360 <_mem_avail_start-0x790ffca0>
    2e10:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2e14:	0003bfc0 	sll	s7,v1,0x1f
    2e18:	0000d88d 	break	0x0,0x362
    2e1c:	00000000 	nop
    2e20:	60000000 	0x60000000
    2e24:	acbfc009 	sw	ra,-16375(a1)
    2e28:	01bfc009 	0x1bfc009
    2e2c:	09ac6300 	j	6b18c00 <_mem_avail_start-0x794e7400>
    2e30:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2e34:	0003bfc0 	sll	s7,v1,0x1f
    2e38:	bc00d491 	cache	0x0,-11119(zero)
    2e3c:	c4bfc009 	lwc1	$f31,-16375(a1)
    2e40:	03bfc009 	0x3bfc009
    2e44:	00d48d00 	0xd48d00
	...
    2e50:	bfc00960 	cache	0x0,2400(s8)
    2e54:	bfc009a8 	cache	0x0,2472(s8)
    2e58:	a8640001 	swl	a0,1(v1)
    2e5c:	bcbfc009 	cache	0x1f,-16375(a1)
    2e60:	03bfc009 	0x3bfc009
    2e64:	00d09100 	0xd09100
    2e68:	bfc009bc 	cache	0x0,2492(s8)
    2e6c:	bfc009c4 	cache	0x0,2500(s8)
    2e70:	d08d0003 	0xd08d0003
	...
    2e7c:	c0096000 	ll	t1,24576(zero)
    2e80:	c009a4bf 	ll	t1,-23361(zero)
    2e84:	650001bf 	0x650001bf
    2e88:	bfc009a4 	cache	0x0,2468(s8)
    2e8c:	bfc009bc 	cache	0x0,2492(s8)
    2e90:	cc910003 	pref	0x11,3(a0)
    2e94:	c009bc00 	ll	t1,-17408(zero)
    2e98:	c009c4bf 	ll	t1,-15169(zero)
    2e9c:	8d0003bf 	lw	zero,959(t0)
    2ea0:	000000cc 	syscall	0x3
    2ea4:	00000000 	nop
    2ea8:	09600000 	j	5800000 <_mem_avail_start-0x7a800000>
    2eac:	09a0bfc0 	j	682ff00 <_mem_avail_start-0x797d0100>
    2eb0:	0001bfc0 	sll	s7,at,0x1f
    2eb4:	c009a066 	ll	t1,-24474(zero)
    2eb8:	c009bcbf 	ll	t1,-17217(zero)
    2ebc:	910003bf 	lbu	zero,959(t0)
    2ec0:	09bc00c8 	j	6f00320 <_mem_avail_start-0x790ffce0>
    2ec4:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2ec8:	0003bfc0 	sll	s7,v1,0x1f
    2ecc:	0000c88d 	break	0x0,0x322
    2ed0:	00000000 	nop
    2ed4:	68000000 	0x68000000
    2ed8:	bcbfc009 	cache	0x1f,-16375(a1)
    2edc:	01bfc009 	0x1bfc009
    2ee0:	09bc6000 	j	6f18000 <_mem_avail_start-0x790e8000>
    2ee4:	09c3bfc0 	j	70eff00 <_mem_avail_start-0x78f10100>
    2ee8:	0001bfc0 	sll	s7,at,0x1f
    2eec:	c009c354 	ll	t1,-15532(zero)
    2ef0:	c009c4bf 	ll	t1,-15169(zero)
    2ef4:	8d0003bf 	lw	zero,959(t0)
    2ef8:	000000e0 	0xe0
    2efc:	00000000 	nop
    2f00:	09680000 	j	5a00000 <_mem_avail_start-0x7a600000>
    2f04:	09b4bfc0 	j	6d2ff00 <_mem_avail_start-0x792d0100>
    2f08:	0001bfc0 	sll	s7,at,0x1f
    2f0c:	c009b461 	ll	t1,-19359(zero)
    2f10:	c009bcbf 	ll	t1,-17217(zero)
    2f14:	910003bf 	lbu	zero,959(t0)
    2f18:	09bc00dc 	j	6f00370 <_mem_avail_start-0x790ffc90>
    2f1c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2f20:	0003bfc0 	sll	s7,v1,0x1f
    2f24:	0000dc8d 	break	0x0,0x372
    2f28:	00000000 	nop
    2f2c:	68000000 	0x68000000
    2f30:	b0bfc009 	0xb0bfc009
    2f34:	01bfc009 	0x1bfc009
    2f38:	09b06200 	j	6c18800 <_mem_avail_start-0x793e7800>
    2f3c:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    2f40:	0003bfc0 	sll	s7,v1,0x1f
    2f44:	bc00d891 	cache	0x0,-10095(zero)
    2f48:	c4bfc009 	lwc1	$f31,-16375(a1)
    2f4c:	03bfc009 	0x3bfc009
    2f50:	00d88d00 	0xd88d00
	...
    2f5c:	bfc00968 	cache	0x0,2408(s8)
    2f60:	bfc009ac 	cache	0x0,2476(s8)
    2f64:	ac630001 	sw	v1,1(v1)
    2f68:	bcbfc009 	cache	0x1f,-16375(a1)
    2f6c:	03bfc009 	0x3bfc009
    2f70:	00d49100 	0xd49100
    2f74:	bfc009bc 	cache	0x0,2492(s8)
    2f78:	bfc009c4 	cache	0x0,2500(s8)
    2f7c:	d48d0003 	ldc1	$f13,3(a0)
	...
    2f88:	c0096800 	ll	t1,26624(zero)
    2f8c:	c009a8bf 	ll	t1,-22337(zero)
    2f90:	640001bf 	0x640001bf
    2f94:	bfc009a8 	cache	0x0,2472(s8)
    2f98:	bfc009bc 	cache	0x0,2492(s8)
    2f9c:	d0910003 	0xd0910003
    2fa0:	c009bc00 	ll	t1,-17408(zero)
    2fa4:	c009c4bf 	ll	t1,-15169(zero)
    2fa8:	8d0003bf 	lw	zero,959(t0)
    2fac:	000000d0 	0xd0
    2fb0:	00000000 	nop
    2fb4:	09680000 	j	5a00000 <_mem_avail_start-0x7a600000>
    2fb8:	09a4bfc0 	j	692ff00 <_mem_avail_start-0x796d0100>
    2fbc:	0001bfc0 	sll	s7,at,0x1f
    2fc0:	c009a465 	ll	t1,-23451(zero)
    2fc4:	c009bcbf 	ll	t1,-17217(zero)
    2fc8:	910003bf 	lbu	zero,959(t0)
    2fcc:	09bc00cc 	j	6f00330 <_mem_avail_start-0x790ffcd0>
    2fd0:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    2fd4:	0003bfc0 	sll	s7,v1,0x1f
    2fd8:	0000cc8d 	break	0x0,0x332
    2fdc:	00000000 	nop
    2fe0:	70000000 	madd	zero,zero
    2fe4:	bcbfc009 	cache	0x1f,-16375(a1)
    2fe8:	01bfc009 	0x1bfc009
    2fec:	09bc6000 	j	6f18000 <_mem_avail_start-0x790e8000>
    2ff0:	09c3bfc0 	j	70eff00 <_mem_avail_start-0x78f10100>
    2ff4:	0001bfc0 	sll	s7,at,0x1f
    2ff8:	c009c354 	ll	t1,-15532(zero)
    2ffc:	c009c4bf 	ll	t1,-15169(zero)
    3000:	8d0003bf 	lw	zero,959(t0)
    3004:	000000e0 	0xe0
    3008:	00000000 	nop
    300c:	09700000 	j	5c00000 <_mem_avail_start-0x7a400000>
    3010:	09b4bfc0 	j	6d2ff00 <_mem_avail_start-0x792d0100>
    3014:	0001bfc0 	sll	s7,at,0x1f
    3018:	c009b461 	ll	t1,-19359(zero)
    301c:	c009bcbf 	ll	t1,-17217(zero)
    3020:	910003bf 	lbu	zero,959(t0)
    3024:	09bc00dc 	j	6f00370 <_mem_avail_start-0x790ffc90>
    3028:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    302c:	0003bfc0 	sll	s7,v1,0x1f
    3030:	0000dc8d 	break	0x0,0x372
    3034:	00000000 	nop
    3038:	70000000 	madd	zero,zero
    303c:	b0bfc009 	0xb0bfc009
    3040:	01bfc009 	0x1bfc009
    3044:	09b06200 	j	6c18800 <_mem_avail_start-0x793e7800>
    3048:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    304c:	0003bfc0 	sll	s7,v1,0x1f
    3050:	bc00d891 	cache	0x0,-10095(zero)
    3054:	c4bfc009 	lwc1	$f31,-16375(a1)
    3058:	03bfc009 	0x3bfc009
    305c:	00d88d00 	0xd88d00
	...
    3068:	bfc00970 	cache	0x0,2416(s8)
    306c:	bfc009ac 	cache	0x0,2476(s8)
    3070:	ac630001 	sw	v1,1(v1)
    3074:	bcbfc009 	cache	0x1f,-16375(a1)
    3078:	03bfc009 	0x3bfc009
    307c:	00d49100 	0xd49100
    3080:	bfc009bc 	cache	0x0,2492(s8)
    3084:	bfc009c4 	cache	0x0,2500(s8)
    3088:	d48d0003 	ldc1	$f13,3(a0)
	...
    3094:	c0097000 	ll	t1,28672(zero)
    3098:	c009a8bf 	ll	t1,-22337(zero)
    309c:	640001bf 	0x640001bf
    30a0:	bfc009a8 	cache	0x0,2472(s8)
    30a4:	bfc009bc 	cache	0x0,2492(s8)
    30a8:	d0910003 	0xd0910003
    30ac:	c009bc00 	ll	t1,-17408(zero)
    30b0:	c009c4bf 	ll	t1,-15169(zero)
    30b4:	8d0003bf 	lw	zero,959(t0)
    30b8:	000000d0 	0xd0
    30bc:	00000000 	nop
    30c0:	09780000 	j	5e00000 <_mem_avail_start-0x7a200000>
    30c4:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    30c8:	0001bfc0 	sll	s7,at,0x1f
    30cc:	c009bc60 	ll	t1,-17312(zero)
    30d0:	c009c3bf 	ll	t1,-15425(zero)
    30d4:	540001bf 	bnezl	zero,37d4 <_mem_avail_start-0x7fffc82c>
    30d8:	bfc009c3 	cache	0x0,2499(s8)
    30dc:	bfc009c4 	cache	0x0,2500(s8)
    30e0:	e08d0003 	sc	t5,3(a0)
	...
    30ec:	c0097800 	ll	t1,30720(zero)
    30f0:	c009b4bf 	ll	t1,-19265(zero)
    30f4:	610001bf 	0x610001bf
    30f8:	bfc009b4 	cache	0x0,2484(s8)
    30fc:	bfc009bc 	cache	0x0,2492(s8)
    3100:	dc910003 	ldc3	$17,3(a0)
    3104:	c009bc00 	ll	t1,-17408(zero)
    3108:	c009c4bf 	ll	t1,-15169(zero)
    310c:	8d0003bf 	lw	zero,959(t0)
    3110:	000000dc 	0xdc
    3114:	00000000 	nop
    3118:	09780000 	j	5e00000 <_mem_avail_start-0x7a200000>
    311c:	09b0bfc0 	j	6c2ff00 <_mem_avail_start-0x793d0100>
    3120:	0001bfc0 	sll	s7,at,0x1f
    3124:	c009b062 	ll	t1,-20382(zero)
    3128:	c009bcbf 	ll	t1,-17217(zero)
    312c:	910003bf 	lbu	zero,959(t0)
    3130:	09bc00d8 	j	6f00360 <_mem_avail_start-0x790ffca0>
    3134:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    3138:	0003bfc0 	sll	s7,v1,0x1f
    313c:	0000d88d 	break	0x0,0x362
    3140:	00000000 	nop
    3144:	78000000 	0x78000000
    3148:	acbfc009 	sw	ra,-16375(a1)
    314c:	01bfc009 	0x1bfc009
    3150:	09ac6300 	j	6b18c00 <_mem_avail_start-0x794e7400>
    3154:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    3158:	0003bfc0 	sll	s7,v1,0x1f
    315c:	bc00d491 	cache	0x0,-11119(zero)
    3160:	c4bfc009 	lwc1	$f31,-16375(a1)
    3164:	03bfc009 	0x3bfc009
    3168:	00d48d00 	0xd48d00
	...
    3174:	bfc00980 	cache	0x0,2432(s8)
    3178:	bfc009bc 	cache	0x0,2492(s8)
    317c:	bc600001 	cache	0x0,1(v1)
    3180:	c3bfc009 	ll	ra,-16375(sp)
    3184:	01bfc009 	0x1bfc009
    3188:	09c35400 	j	70d5000 <_mem_avail_start-0x78f2b000>
    318c:	09c4bfc0 	j	712ff00 <_mem_avail_start-0x78ed0100>
    3190:	0003bfc0 	sll	s7,v1,0x1f
    3194:	0000e08d 	break	0x0,0x382
    3198:	00000000 	nop
    319c:	80000000 	lb	zero,0(zero)
    31a0:	b4bfc009 	0xb4bfc009
    31a4:	01bfc009 	0x1bfc009
    31a8:	09b46100 	j	6d18400 <_mem_avail_start-0x792e7c00>
    31ac:	09bcbfc0 	j	6f2ff00 <_mem_avail_start-0x790d0100>
    31b0:	0003bfc0 	sll	s7,v1,0x1f
    31b4:	bc00dc91 	cache	0x0,-9071(zero)
    31b8:	c4bfc009 	lwc1	$f31,-16375(a1)
    31bc:	03bfc009 	0x3bfc009
    31c0:	00dc8d00 	0xdc8d00
	...
    31cc:	bfc00980 	cache	0x0,2432(s8)
    31d0:	bfc009b0 	cache	0x0,2480(s8)
    31d4:	b0620001 	0xb0620001
    31d8:	bcbfc009 	cache	0x1f,-16375(a1)
    31dc:	03bfc009 	0x3bfc009
    31e0:	00d89100 	0xd89100
    31e4:	bfc009bc 	cache	0x0,2492(s8)
    31e8:	bfc009c4 	cache	0x0,2500(s8)
    31ec:	d88d0003 	ldc2	$13,3(a0)
	...
    31f8:	c0098800 	ll	t1,-30720(zero)
    31fc:	c009bcbf 	ll	t1,-17217(zero)
    3200:	600001bf 	0x600001bf
    3204:	bfc009bc 	cache	0x0,2492(s8)
    3208:	bfc009c3 	cache	0x0,2499(s8)
    320c:	c3540001 	ll	s4,1(k0)
    3210:	c4bfc009 	lwc1	$f31,-16375(a1)
    3214:	03bfc009 	0x3bfc009
    3218:	00e08d00 	0xe08d00
	...
    3224:	bfc00988 	cache	0x0,2440(s8)
    3228:	bfc009b4 	cache	0x0,2484(s8)
    322c:	b4610001 	0xb4610001
    3230:	bcbfc009 	cache	0x1f,-16375(a1)
    3234:	03bfc009 	0x3bfc009
    3238:	00dc9100 	0xdc9100
    323c:	bfc009bc 	cache	0x0,2492(s8)
    3240:	bfc009c4 	cache	0x0,2500(s8)
    3244:	dc8d0003 	ldc3	$13,3(a0)
	...
    3250:	c0099000 	ll	t1,-28672(zero)
    3254:	c009bcbf 	ll	t1,-17217(zero)
    3258:	600001bf 	0x600001bf
    325c:	bfc009bc 	cache	0x0,2492(s8)
    3260:	bfc009c3 	cache	0x0,2499(s8)
    3264:	c3540001 	ll	s4,1(k0)
    3268:	c4bfc009 	lwc1	$f31,-16375(a1)
    326c:	03bfc009 	0x3bfc009
    3270:	00e08d00 	0xe08d00
	...
    327c:	bfc009c4 	cache	0x0,2500(s8)
    3280:	bfc009e4 	cache	0x0,2532(s8)
    3284:	e4540001 	swc1	$f20,1(v0)
    3288:	84bfc009 	lh	ra,-16375(a1)
    328c:	01bfc00a 	movz	t8,t5,ra
    3290:	0a845200 	j	a114800 <_mem_avail_start-0x75eeb800>
    3294:	0a98bfc0 	j	a62ff00 <_mem_avail_start-0x759d0100>
    3298:	0004bfc0 	sll	s7,a0,0x1f
    329c:	9f5401f3 	0x9f5401f3
	...
    32a8:	bfc00714 	cache	0x0,1812(s8)
    32ac:	bfc00738 	cache	0x0,1848(s8)
    32b0:	9f470002 	0x9f470002
    32b4:	bfc00738 	cache	0x0,1848(s8)
    32b8:	bfc0073c 	cache	0x0,1852(s8)
    32bc:	4c520001 	0x4c520001
    32c0:	54bfc007 	bnel	a1,ra,ffff32e0 <_text_end+0x403f1b48>
    32c4:	01bfc007 	srav	t8,ra,t5
    32c8:	07785200 	0x7785200
    32cc:	077cbfc0 	0x77cbfc0
    32d0:	0001bfc0 	sll	s7,at,0x1f
    32d4:	00000052 	mflhxu	zero
    32d8:	00000000 	nop
    32dc:	c0071400 	ll	a3,5120(zero)
    32e0:	c00738bf 	ll	a3,14527(zero)
    32e4:	300002bf 	andi	zero,zero,0x2bf
    32e8:	c007389f 	ll	a3,14495(zero)
    32ec:	c00740bf 	ll	a3,16575(zero)
    32f0:	730007bf 	sdbbp	0xc001e
    32f4:	80808080 	lb	zero,-32640(a0)
    32f8:	07409f78 	bltz	k0,fffeb0dc <_text_end+0x403e9944>
    32fc:	0754bfc0 	0x754bfc0
    3300:	0007bfc0 	sll	s7,a3,0x1f
    3304:	ffffff73 	sdc3	$31,-141(ra)
    3308:	009f07ff 	0x9f07ff
    330c:	00000000 	nop
    3310:	38000000 	xori	zero,zero,0x0
    3314:	4cbfc007 	0x4cbfc007
    3318:	06bfc007 	0x6bfc007
    331c:	3af7f200 	xori	s7,s7,0xf200
	...
    3328:	78000000 	0x78000000
    332c:	a3bfc007 	sb	ra,-16377(sp)
    3330:	01bfc007 	srav	t8,ra,t5
    3334:	07c85300 	tgei	s8,21248
    3338:	07dcbfc0 	0x7dcbfc0
    333c:	0001bfc0 	sll	s7,at,0x1f
    3340:	00000053 	mtlhx	zero
    3344:	00000000 	nop
    3348:	c0077800 	ll	a3,30720(zero)
    334c:	c00790bf 	ll	a3,-28481(zero)
    3350:	f20006bf 	0xf20006bf
    3354:	00003af7 	0x3af7
	...
    3360:	c0079c00 	ll	a3,-25600(zero)
    3364:	c007a4bf 	ll	a3,-23361(zero)
    3368:	f20006bf 	0xf20006bf
    336c:	0000481c 	0x481c
	...
    3378:	c007ac00 	ll	a3,-21504(zero)
    337c:	c007c8bf 	ll	a3,-14145(zero)
    3380:	f20006bf 	0xf20006bf
    3384:	0000482a 	slt	t1,zero,zero
	...
    3390:	c007ac00 	ll	a3,-21504(zero)
    3394:	c007c8bf 	ll	a3,-14145(zero)
    3398:	300002bf 	andi	zero,zero,0x2bf
    339c:	0000009f 	0x9f
    33a0:	00000000 	nop
    33a4:	c007ac00 	ll	a3,-21504(zero)
    33a8:	c007c8bf 	ll	a3,-14145(zero)
    33ac:	3a0002bf 	xori	zero,s0,0x2bf
    33b0:	0000009f 	0x9f
    33b4:	00000000 	nop
    33b8:	c007b400 	ll	a3,-19456(zero)
    33bc:	c007c8bf 	ll	a3,-14145(zero)
    33c0:	300002bf 	andi	zero,zero,0x2bf
    33c4:	0000009f 	0x9f
    33c8:	00000000 	nop
    33cc:	c0064800 	ll	a2,18432(zero)
    33d0:	c0066cbf 	ll	a2,27839(zero)
    33d4:	470002bf 	c1	0x10002bf
    33d8:	c0066c9f 	ll	a2,27807(zero)
    33dc:	c00670bf 	ll	a2,28863(zero)
    33e0:	520001bf 	beqzl	s0,3ae0 <_mem_avail_start-0x7fffc520>
    33e4:	bfc00680 	cache	0x0,1664(s8)
    33e8:	bfc00688 	cache	0x0,1672(s8)
    33ec:	ac520001 	sw	s2,1(v0)
    33f0:	b0bfc006 	0xb0bfc006
    33f4:	01bfc006 	srlv	t8,ra,t5
    33f8:	00005200 	sll	t2,zero,0x8
    33fc:	00000000 	nop
    3400:	06480000 	tgei	s2,0
    3404:	066cbfc0 	teqi	s3,-16448
    3408:	0002bfc0 	sll	s7,v0,0x1f
    340c:	00009f30 	tge	zero,zero,0x27c
    3410:	00000000 	nop
    3414:	066c0000 	teqi	s3,0
    3418:	0680bfc0 	bltz	s4,ffff331c <_text_end+0x403f1b84>
    341c:	0006bfc0 	sll	s7,a2,0x1f
    3420:	003c7ff2 	tlt	at,gp,0x1ff
	...
    342c:	06ac0000 	teqi	s5,0
    3430:	06dbbfc0 	0x6dbbfc0
    3434:	0001bfc0 	sll	s7,at,0x1f
    3438:	c0070053 	ll	a3,83(zero)
    343c:	c00714bf 	ll	a3,5311(zero)
    3440:	530001bf 	beqzl	t8,3b40 <_mem_avail_start-0x7fffc4c0>
    3444:	00000000 	nop
    3448:	00000000 	nop
    344c:	bfc006ac 	cache	0x0,1708(s8)
    3450:	bfc006c8 	cache	0x0,1736(s8)
    3454:	7ff20006 	0x7ff20006
    3458:	0000003c 	0x3c
	...
    3464:	bfc006d4 	cache	0x0,1748(s8)
    3468:	bfc006dc 	cache	0x0,1756(s8)
    346c:	1cf20006 	0x1cf20006
    3470:	00000048 	0x48
	...
    347c:	bfc006e4 	cache	0x0,1764(s8)
    3480:	bfc00700 	cache	0x0,1792(s8)
    3484:	2af20006 	slti	s2,s7,6
    3488:	00000048 	0x48
	...
    3494:	bfc006e4 	cache	0x0,1764(s8)
    3498:	bfc00700 	cache	0x0,1792(s8)
    349c:	9f300002 	0x9f300002
	...
    34a8:	bfc006e4 	cache	0x0,1764(s8)
    34ac:	bfc00700 	cache	0x0,1792(s8)
    34b0:	9f3a0002 	0x9f3a0002
	...
    34bc:	bfc006ec 	cache	0x0,1772(s8)
    34c0:	bfc00700 	cache	0x0,1792(s8)
    34c4:	9f300002 	0x9f300002
	...
    34d0:	bfc00580 	cache	0x0,1408(s8)
    34d4:	bfc005a4 	cache	0x0,1444(s8)
    34d8:	9f470002 	0x9f470002
    34dc:	bfc005a4 	cache	0x0,1444(s8)
    34e0:	bfc005a8 	cache	0x0,1448(s8)
    34e4:	b8520001 	swr	s2,1(v0)
    34e8:	bcbfc005 	cache	0x1f,-16379(a1)
    34ec:	01bfc005 	0x1bfc005
    34f0:	05e05200 	bltz	t7,17cf4 <_mem_avail_start-0x7ffe830c>
    34f4:	05e4bfc0 	0x5e4bfc0
    34f8:	0001bfc0 	sll	s7,at,0x1f
    34fc:	c0063052 	ll	a2,12370(zero)
    3500:	c00648bf 	ll	a2,18623(zero)
    3504:	540001bf 	bnezl	zero,3c04 <_mem_avail_start-0x7fffc3fc>
    3508:	00000000 	nop
    350c:	00000000 	nop
    3510:	bfc00580 	cache	0x0,1408(s8)
    3514:	bfc005a4 	cache	0x0,1444(s8)
    3518:	9f300002 	0x9f300002
	...
    3524:	bfc005a4 	cache	0x0,1444(s8)
    3528:	bfc005b8 	cache	0x0,1464(s8)
    352c:	5cf20006 	0x5cf20006
    3530:	0000003e 	0x3e
	...
    353c:	bfc005e0 	cache	0x0,1504(s8)
    3540:	bfc0060b 	cache	0x0,1547(s8)
    3544:	30530001 	andi	s3,v0,0x1
    3548:	48bfc006 	0x48bfc006
    354c:	01bfc006 	srlv	t8,ra,t5
    3550:	00005300 	sll	t2,zero,0xc
    3554:	00000000 	nop
    3558:	06040000 	0x6040000
    355c:	060cbfc0 	teqi	s0,-16448
    3560:	0006bfc0 	sll	s7,a2,0x1f
    3564:	00481cf2 	tlt	v0,t0,0x73
	...
    3570:	06140000 	0x6140000
    3574:	0630bfc0 	bltzal	s1,ffff3478 <_text_end+0x403f1ce0>
    3578:	0006bfc0 	sll	s7,a2,0x1f
    357c:	00482af2 	tlt	v0,t0,0xab
	...
    3588:	06140000 	0x6140000
    358c:	0630bfc0 	bltzal	s1,ffff3490 <_text_end+0x403f1cf8>
    3590:	0002bfc0 	sll	s7,v0,0x1f
    3594:	00009f30 	tge	zero,zero,0x27c
    3598:	00000000 	nop
    359c:	06140000 	0x6140000
    35a0:	0630bfc0 	bltzal	s1,ffff34a4 <_text_end+0x403f1d0c>
    35a4:	0002bfc0 	sll	s7,v0,0x1f
    35a8:	00009f3a 	0x9f3a
    35ac:	00000000 	nop
    35b0:	061c0000 	0x61c0000
    35b4:	0630bfc0 	bltzal	s1,ffff34b8 <_text_end+0x403f1d20>
    35b8:	0002bfc0 	sll	s7,v0,0x1f
    35bc:	00009f30 	tge	zero,zero,0x27c
    35c0:	00000000 	nop
    35c4:	0a980000 	j	a600000 <_mem_avail_start-0x75a00000>
    35c8:	0ab0bfc0 	j	ac2ff00 <_mem_avail_start-0x753d0100>
    35cc:	0006bfc0 	sll	s7,a2,0x1f
    35d0:	c0127c03 	ll	s2,31747(zero)
    35d4:	00009fbf 	0x9fbf
    35d8:	00000000 	nop
    35dc:	0ab80000 	j	ae00000 <_mem_avail_start-0x75200000>
    35e0:	0ac0bfc0 	j	b02ff00 <_mem_avail_start-0x74fd0100>
    35e4:	0006bfc0 	sll	s7,a2,0x1f
    35e8:	004830f2 	tlt	v0,t0,0xc3
	...
    35f4:	0ac00000 	j	b000000 <_mem_avail_start-0x75000000>
    35f8:	0b64bfc0 	j	d92ff00 <_mem_avail_start-0x726d0100>
    35fc:	0006bfc0 	sll	s7,a2,0x1f
    3600:	004839f2 	tlt	v0,t0,0xe7
	...
    360c:	0ac00000 	j	b000000 <_mem_avail_start-0x75000000>
    3610:	0b64bfc0 	j	d92ff00 <_mem_avail_start-0x726d0100>
    3614:	0002bfc0 	sll	s7,v0,0x1f
    3618:	00009f30 	tge	zero,zero,0x27c
    361c:	00000000 	nop
    3620:	0ac00000 	j	b000000 <_mem_avail_start-0x75000000>
    3624:	0b64bfc0 	j	d92ff00 <_mem_avail_start-0x726d0100>
    3628:	0002bfc0 	sll	s7,v0,0x1f
    362c:	00009f3a 	0x9f3a
    3630:	00000000 	nop
    3634:	0ac00000 	j	b000000 <_mem_avail_start-0x75000000>
    3638:	0b64bfc0 	j	d92ff00 <_mem_avail_start-0x726d0100>
    363c:	0003bfc0 	sll	s7,v1,0x1f
    3640:	009f2108 	0x9f2108
    3644:	00000000 	nop
    3648:	c0000000 	ll	zero,0(zero)
    364c:	64bfc00a 	0x64bfc00a
    3650:	03bfc00b 	movn	t8,sp,ra
    3654:	9f740800 	0x9f740800
	...
    3660:	bfc00ac0 	cache	0x0,2752(s8)
    3664:	bfc00b64 	cache	0x0,2916(s8)
    3668:	72080003 	0x72080003
    366c:	0000009f 	0x9f
    3670:	00000000 	nop
    3674:	c00ac000 	ll	t2,-16384(zero)
    3678:	c00b64bf 	ll	t3,25791(zero)
    367c:	080003bf 	j	efc <_mem_avail_start-0x7ffff104>
    3680:	00009f6f 	0x9f6f
    3684:	00000000 	nop
    3688:	0ac00000 	j	b000000 <_mem_avail_start-0x75000000>
    368c:	0b64bfc0 	j	d92ff00 <_mem_avail_start-0x726d0100>
    3690:	0003bfc0 	sll	s7,v1,0x1f
    3694:	009f6808 	0x9f6808
    3698:	00000000 	nop
    369c:	c0000000 	ll	zero,0(zero)
    36a0:	64bfc00a 	0x64bfc00a
    36a4:	03bfc00b 	movn	t8,sp,ra
    36a8:	9f730800 	0x9f730800
	...
    36b4:	bfc00ac0 	cache	0x0,2752(s8)
    36b8:	bfc00b64 	cache	0x0,2916(s8)
    36bc:	20080003 	addi	t0,zero,3
    36c0:	0000009f 	0x9f
    36c4:	00000000 	nop
    36c8:	c00ac000 	ll	t2,-16384(zero)
    36cc:	c00b64bf 	ll	t3,25791(zero)
    36d0:	080003bf 	j	efc <_mem_avail_start-0x7ffff104>
    36d4:	00009f79 	0x9f79
    36d8:	00000000 	nop
    36dc:	0ac00000 	j	b000000 <_mem_avail_start-0x75000000>
    36e0:	0b64bfc0 	j	d92ff00 <_mem_avail_start-0x726d0100>
    36e4:	0003bfc0 	sll	s7,v1,0x1f
    36e8:	009f6208 	0x9f6208
    36ec:	00000000 	nop
    36f0:	c0000000 	ll	zero,0(zero)
    36f4:	64bfc00a 	0x64bfc00a
    36f8:	03bfc00b 	movn	t8,sp,ra
    36fc:	9f6d0800 	0x9f6d0800
	...
    3708:	bfc00ac0 	cache	0x0,2752(s8)
    370c:	bfc00b64 	cache	0x0,2916(s8)
    3710:	65080003 	0x65080003
    3714:	0000009f 	0x9f
    3718:	00000000 	nop
    371c:	c00ac000 	ll	t2,-16384(zero)
    3720:	c00b64bf 	ll	t3,25791(zero)
    3724:	080003bf 	j	efc <_mem_avail_start-0x7ffff104>
    3728:	00009f67 	0x9f67
    372c:	00000000 	nop
    3730:	0ac00000 	j	b000000 <_mem_avail_start-0x75000000>
    3734:	0b64bfc0 	j	d92ff00 <_mem_avail_start-0x726d0100>
    3738:	0003bfc0 	sll	s7,v1,0x1f
    373c:	009f6e08 	0x9f6e08
    3740:	00000000 	nop
    3744:	c0000000 	ll	zero,0(zero)
    3748:	64bfc00a 	0x64bfc00a
    374c:	03bfc00b 	movn	t8,sp,ra
    3750:	9f690800 	0x9f690800
	...
    375c:	bfc00ac0 	cache	0x0,2752(s8)
    3760:	bfc00b64 	cache	0x0,2916(s8)
    3764:	54080003 	bnel	zero,t0,3774 <_mem_avail_start-0x7fffc88c>
    3768:	0000009f 	0x9f
    376c:	00000000 	nop
    3770:	c00b6c00 	ll	t3,27648(zero)
    3774:	c00b74bf 	ll	t3,29887(zero)
    3778:	f20006bf 	0xf20006bf
    377c:	00004830 	tge	zero,zero,0x120
	...
    3788:	c00b7400 	ll	t3,29696(zero)
    378c:	c00b84bf 	ll	t3,-31553(zero)
    3790:	030006bf 	0x30006bf
    3794:	bfc01298 	cache	0x0,4760(s8)
    3798:	0000009f 	0x9f
    379c:	00000000 	nop
    37a0:	c00b8c00 	ll	t3,-29696(zero)
    37a4:	c00b94bf 	ll	t3,-27457(zero)
    37a8:	f20006bf 	0xf20006bf
    37ac:	00004830 	tge	zero,zero,0x120
	...
    37b8:	c0051000 	ll	a1,4096(zero)
    37bc:	c00520bf 	ll	a1,8383(zero)
    37c0:	540001bf 	bnezl	zero,3ec0 <_mem_avail_start-0x7fffc140>
    37c4:	bfc00520 	cache	0x0,1312(s8)
    37c8:	bfc00570 	cache	0x0,1392(s8)
    37cc:	70620001 	maddu	v1,v0
    37d0:	80bfc005 	lb	ra,-16379(a1)
    37d4:	04bfc005 	0x4bfc005
    37d8:	5401f300 	bnel	zero,at,3dc <_mem_avail_start-0x7ffffc24>
    37dc:	0000009f 	0x9f
    37e0:	00000000 	nop
    37e4:	c0053800 	ll	a1,14336(zero)
    37e8:	c00540bf 	ll	a1,16575(zero)
    37ec:	370002bf 	ori	zero,t8,0x2bf
    37f0:	0000009f 	0x9f
    37f4:	00000000 	nop
    37f8:	c0054800 	ll	a1,18432(zero)
    37fc:	c00558bf 	ll	a1,22719(zero)
    3800:	520001bf 	beqzl	s0,3f00 <_mem_avail_start-0x7fffc100>
    3804:	bfc00558 	cache	0x0,1368(s8)
    3808:	bfc0055f 	cache	0x0,1375(s8)
    380c:	00540001 	movf	zero,v0,$fcc5
    3810:	00000000 	nop
    3814:	6c000000 	0x6c000000
    3818:	7cbfc00d 	0x7cbfc00d
    381c:	01bfc00d 	break	0x1bf,0x300
    3820:	0d7c5400 	jal	5f15000 <_mem_avail_start-0x7a0eb000>
    3824:	0dc8bfc0 	jal	722ff00 <_mem_avail_start-0x78dd0100>
    3828:	0001bfc0 	sll	s7,at,0x1f
    382c:	c00dc861 	ll	t5,-14239(zero)
    3830:	c00ddcbf 	ll	t5,-9025(zero)
    3834:	f30004bf 	0xf30004bf
    3838:	dc9f5401 	ldc3	$31,21505(a0)
    383c:	20bfc00d 	addi	ra,a1,-16371
    3840:	01bfc00e 	0x1bfc00e
    3844:	00006100 	sll	t4,zero,0x4
    3848:	00000000 	nop
    384c:	0d6c0000 	jal	5b00000 <_mem_avail_start-0x7a500000>
    3850:	0d8fbfc0 	jal	63eff00 <_mem_avail_start-0x79c10100>
    3854:	0001bfc0 	sll	s7,at,0x1f
    3858:	c00d8f55 	ll	t5,-28843(zero)
    385c:	c00e20bf 	ll	t6,8383(zero)
    3860:	f30004bf 	0xf30004bf
    3864:	009f5501 	0x9f5501
    3868:	00000000 	nop
    386c:	e8000000 	swc2	$0,0(zero)
    3870:	0fbfc00d 	jal	eff0034 <_mem_avail_start-0x7100ffcc>
    3874:	01bfc00e 	0x1bfc00e
    3878:	00005600 	sll	t2,zero,0x18
    387c:	00000000 	nop
    3880:	0d040000 	jal	4100000 <_mem_avail_start-0x7bf00000>
    3884:	0d28bfc0 	jal	4a2ff00 <_mem_avail_start-0x7b5d0100>
    3888:	0002bfc0 	sll	s7,v0,0x1f
    388c:	0d289f30 	jal	4a27cc0 <_mem_avail_start-0x7b5d8340>
    3890:	0d48bfc0 	jal	522ff00 <_mem_avail_start-0x7add0100>
    3894:	0001bfc0 	sll	s7,at,0x1f
    3898:	00000060 	0x60
    389c:	00000000 	nop
    38a0:	c00d3c00 	ll	t5,15360(zero)
    38a4:	c00d4fbf 	ll	t5,20415(zero)
    38a8:	560001bf 	bnezl	s0,3fa8 <_mem_avail_start-0x7fffc058>
    38ac:	00000000 	nop
    38b0:	00000000 	nop
    38b4:	bfc00d3c 	cache	0x0,3388(s8)
    38b8:	bfc00d4f 	cache	0x0,3407(s8)
    38bc:	00570001 	0x570001
    38c0:	00000000 	nop
    38c4:	3c000000 	lui	zero,0x0
    38c8:	4fbfc00d 	c3	0x1bfc00d
    38cc:	01bfc00d 	break	0x1bf,0x300
    38d0:	00005200 	sll	t2,zero,0x8
    38d4:	00000000 	nop
    38d8:	0c6c0000 	jal	1b00000 <_mem_avail_start-0x7e500000>
    38dc:	0ca0bfc0 	jal	282ff00 <_mem_avail_start-0x7d7d0100>
    38e0:	0001bfc0 	sll	s7,at,0x1f
    38e4:	c00ca054 	ll	t4,-24492(zero)
    38e8:	c00cfcbf 	ll	t4,-833(zero)
    38ec:	600001bf 	0x600001bf
    38f0:	bfc00cfc 	cache	0x0,3324(s8)
    38f4:	bfc00d04 	cache	0x0,3332(s8)
    38f8:	01f30004 	sllv	zero,s3,t7
    38fc:	00009f54 	0x9f54
    3900:	00000000 	nop
    3904:	0c6c0000 	jal	1b00000 <_mem_avail_start-0x7e500000>
    3908:	0ca0bfc0 	jal	282ff00 <_mem_avail_start-0x7d7d0100>
    390c:	0002bfc0 	sll	s7,v0,0x1f
    3910:	0ca09f31 	jal	2827cc4 <_mem_avail_start-0x7d7d833c>
    3914:	0cacbfc0 	jal	2b2ff00 <_mem_avail_start-0x7d4d0100>
    3918:	0001bfc0 	sll	s7,at,0x1f
    391c:	c00cac61 	ll	t4,-21407(zero)
    3920:	c00cb3bf 	ll	t4,-19521(zero)
    3924:	550001bf 	bnezl	t0,4024 <_mem_avail_start-0x7fffbfdc>
    3928:	bfc00cb3 	cache	0x0,3251(s8)
    392c:	bfc00cb4 	cache	0x0,3252(s8)
    3930:	7f810003 	0x7f810003
    3934:	c00cb49f 	ll	t4,-19297(zero)
    3938:	c00cf8bf 	ll	t4,-1857(zero)
    393c:	610001bf 	0x610001bf
	...
    3948:	bfc00bf4 	cache	0x0,3060(s8)
    394c:	bfc00c4c 	cache	0x0,3148(s8)
    3950:	58600001 	blezl	v1,3958 <_mem_avail_start-0x7fffc6a8>
    3954:	6cbfc00c 	0x6cbfc00c
    3958:	01bfc00c 	syscall	0x6ff00
    395c:	00006000 	sll	t4,zero,0x0
    3960:	00000000 	nop
    3964:	0c2c0000 	jal	b00000 <_mem_avail_start-0x7f500000>
    3968:	0c3fbfc0 	jal	feff00 <_mem_avail_start-0x7f010100>
    396c:	0001bfc0 	sll	s7,at,0x1f
    3970:	c00c5852 	ll	t4,22610(zero)
    3974:	c00c63bf 	ll	t4,25535(zero)
    3978:	520001bf 	beqzl	s0,4078 <_mem_avail_start-0x7fffbf88>
    397c:	00000000 	nop
    3980:	00000000 	nop
    3984:	bfc00e20 	cache	0x0,3616(s8)
    3988:	bfc00e5c 	cache	0x0,3676(s8)
    398c:	5c540001 	0x5c540001
    3990:	7cbfc00e 	0x7cbfc00e
    3994:	01bfc00e 	0x1bfc00e
    3998:	0e7c6200 	jal	9f18800 <_mem_avail_start-0x760e7800>
    399c:	0e90bfc0 	jal	a42ff00 <_mem_avail_start-0x75bd0100>
    39a0:	0004bfc0 	sll	s7,a0,0x1f
    39a4:	9f5401f3 	0x9f5401f3
    39a8:	bfc00e90 	cache	0x0,3728(s8)
    39ac:	bfc01044 	cache	0x0,4164(s8)
    39b0:	00620001 	0x620001
    39b4:	00000000 	nop
    39b8:	54000000 	bnezl	zero,39bc <_mem_avail_start-0x7fffc644>
    39bc:	5cbfc00e 	0x5cbfc00e
    39c0:	02bfc00e 	0x2bfc00e
    39c4:	5c9f3000 	0x5c9f3000
    39c8:	80bfc00e 	lb	ra,-16370(a1)
    39cc:	01bfc00e 	0x1bfc00e
    39d0:	0e906100 	jal	a418400 <_mem_avail_start-0x75be7c00>
    39d4:	0fa4bfc0 	jal	e92ff00 <_mem_avail_start-0x716d0100>
    39d8:	0001bfc0 	sll	s7,at,0x1f
    39dc:	c00fa461 	ll	t7,-23455(zero)
    39e0:	c00facbf 	ll	t7,-21313(zero)
    39e4:	810003bf 	lb	zero,959(t0)
    39e8:	0fac9f7f 	jal	eb27dfc <_mem_avail_start-0x714d8204>
    39ec:	0ffcbfc0 	jal	ff2ff00 <_mem_avail_start-0x700d0100>
    39f0:	0001bfc0 	sll	s7,at,0x1f
    39f4:	c0100861 	ll	s0,2145(zero)
    39f8:	c01024bf 	ll	s0,9407(zero)
    39fc:	610001bf 	0x610001bf
    3a00:	bfc01024 	cache	0x0,4132(s8)
    3a04:	bfc0102c 	cache	0x0,4140(s8)
    3a08:	00740006 	srlv	zero,s4,v1
    3a0c:	9f1c0082 	0x9f1c0082
    3a10:	bfc0102c 	cache	0x0,4140(s8)
    3a14:	bfc01044 	cache	0x0,4164(s8)
    3a18:	00610001 	movt	zero,v1,$fcc0
    3a1c:	00000000 	nop
    3a20:	90000000 	lbu	zero,0(zero)
    3a24:	a4bfc00e 	sh	ra,-16370(a1)
    3a28:	01bfc00e 	0x1bfc00e
    3a2c:	102c6400 	beq	at,t4,1ca30 <_mem_avail_start-0x7ffe35d0>
    3a30:	1044bfc0 	beq	v0,a0,ffff3934 <_text_end+0x403f219c>
    3a34:	0001bfc0 	sll	s7,at,0x1f
    3a38:	00000064 	0x64
    3a3c:	00000000 	nop
    3a40:	c00e5400 	ll	t6,21504(zero)
    3a44:	c00e84bf 	ll	t6,-31553(zero)
    3a48:	600001bf 	0x600001bf
    3a4c:	bfc00e90 	cache	0x0,3728(s8)
    3a50:	bfc01044 	cache	0x0,4164(s8)
    3a54:	00600001 	movf	zero,v1,$fcc0
    3a58:	00000000 	nop
    3a5c:	a4000000 	sh	zero,0(zero)
    3a60:	e0bfc00e 	sc	ra,-16370(a1)
    3a64:	01bfc00e 	0x1bfc00e
    3a68:	0ef05500 	jal	bc15400 <_mem_avail_start-0x743eac00>
    3a6c:	0f0fbfc0 	jal	c3eff00 <_mem_avail_start-0x73c10100>
    3a70:	0001bfc0 	sll	s7,at,0x1f
    3a74:	c00f1855 	ll	t7,6229(zero)
    3a78:	c00f6bbf 	ll	t7,27583(zero)
    3a7c:	550001bf 	bnezl	t0,417c <_mem_avail_start-0x7fffbe84>
    3a80:	bfc00f80 	cache	0x0,3968(s8)
    3a84:	bfc00f8f 	cache	0x0,3983(s8)
    3a88:	98550001 	lwr	s5,1(v0)
    3a8c:	abbfc00f 	swl	ra,-16369(sp)
    3a90:	01bfc00f 	0x1bfc00f
    3a94:	0fb45500 	jal	ed15400 <_mem_avail_start-0x712eac00>
    3a98:	0fc3bfc0 	jal	f0eff00 <_mem_avail_start-0x70f10100>
    3a9c:	0001bfc0 	sll	s7,at,0x1f
    3aa0:	c00fd055 	ll	t7,-12203(zero)
    3aa4:	c00fefbf 	ll	t7,-4161(zero)
    3aa8:	550001bf 	bnezl	t0,41a8 <_mem_avail_start-0x7fffbe58>
    3aac:	bfc00ff8 	cache	0x0,4088(s8)
    3ab0:	bfc01000 	cache	0x0,4096(s8)
    3ab4:	08550001 	j	1540004 <_mem_avail_start-0x7eabfffc>
    3ab8:	2cbfc010 	sltiu	ra,a1,-16368
    3abc:	01bfc010 	0x1bfc010
    3ac0:	00005500 	sll	t2,zero,0x14
    3ac4:	00000000 	nop
    3ac8:	10440000 	beq	v0,a0,3acc <_mem_avail_start-0x7fffc534>
    3acc:	1078bfc0 	beq	v1,t8,ffff39d0 <_text_end+0x403f2238>
    3ad0:	0001bfc0 	sll	s7,at,0x1f
    3ad4:	c0107854 	ll	s0,30804(zero)
    3ad8:	c01080bf 	ll	s0,-32577(zero)
    3adc:	800004bf 	lb	zero,1215(zero)
    3ae0:	809f1f00 	lb	ra,7936(a0)
    3ae4:	c8bfc010 	lwc2	$31,-16368(a1)
    3ae8:	04bfc010 	0x4bfc010
    3aec:	5401f300 	bnel	zero,at,6f0 <_mem_avail_start-0x7ffff910>
    3af0:	c010c89f 	ll	s0,-14177(zero)
    3af4:	c010d0bf 	ll	s0,-12097(zero)
    3af8:	540001bf 	bnezl	zero,41f8 <_mem_avail_start-0x7fffbe08>
    3afc:	bfc010d0 	cache	0x0,4304(s8)
    3b00:	bfc0111c 	cache	0x0,4380(s8)
    3b04:	01f30004 	sllv	zero,s3,t7
    3b08:	00009f54 	0x9f54
    3b0c:	00000000 	nop
    3b10:	10440000 	beq	v0,a0,3b14 <_mem_avail_start-0x7fffc4ec>
    3b14:	107fbfc0 	beq	v1,ra,ffff3a18 <_text_end+0x403f2280>
    3b18:	0001bfc0 	sll	s7,at,0x1f
    3b1c:	c0107f55 	ll	s0,32597(zero)
    3b20:	c01098bf 	ll	s0,-26433(zero)
    3b24:	630001bf 	0x630001bf
    3b28:	bfc01098 	cache	0x0,4248(s8)
    3b2c:	bfc010c8 	cache	0x0,4296(s8)
    3b30:	01f30004 	sllv	zero,s3,t7
    3b34:	10c89f55 	beq	a2,t0,fffeb88c <_text_end+0x403ea0f4>
    3b38:	10d0bfc0 	beq	a2,s0,ffff3a3c <_text_end+0x403f22a4>
    3b3c:	0001bfc0 	sll	s7,at,0x1f
    3b40:	c010d055 	ll	s0,-12203(zero)
    3b44:	c010ecbf 	ll	s0,-4929(zero)
    3b48:	630001bf 	0x630001bf
    3b4c:	bfc010ec 	cache	0x0,4332(s8)
    3b50:	bfc0111c 	cache	0x0,4380(s8)
    3b54:	01f30004 	sllv	zero,s3,t7
    3b58:	00009f55 	0x9f55
    3b5c:	00000000 	nop
    3b60:	10440000 	beq	v0,a0,3b64 <_mem_avail_start-0x7fffc49c>
    3b64:	107fbfc0 	beq	v1,ra,ffff3a68 <_text_end+0x403f22d0>
    3b68:	0001bfc0 	sll	s7,at,0x1f
    3b6c:	c0107f56 	ll	s0,32598(zero)
    3b70:	c010acbf 	ll	s0,-21313(zero)
    3b74:	640001bf 	0x640001bf
    3b78:	bfc010ac 	cache	0x0,4268(s8)
    3b7c:	bfc010c8 	cache	0x0,4296(s8)
    3b80:	01f30004 	sllv	zero,s3,t7
    3b84:	10c89f56 	beq	a2,t0,fffeb8e0 <_text_end+0x403ea148>
    3b88:	10d0bfc0 	beq	a2,s0,ffff3a8c <_text_end+0x403f22f4>
    3b8c:	0001bfc0 	sll	s7,at,0x1f
    3b90:	c010d056 	ll	s0,-12202(zero)
    3b94:	c0111cbf 	ll	s1,7359(zero)
    3b98:	640001bf 	0x640001bf
	...
    3ba4:	bfc01044 	cache	0x0,4164(s8)
    3ba8:	bfc0107f 	cache	0x0,4223(s8)
    3bac:	7f570001 	0x7f570001
    3bb0:	c8bfc010 	lwc2	$31,-16368(a1)
    3bb4:	04bfc010 	0x4bfc010
    3bb8:	5701f300 	bnel	t8,at,7bc <_mem_avail_start-0x7ffff844>
    3bbc:	c010c89f 	ll	s0,-14177(zero)
    3bc0:	c010d0bf 	ll	s0,-12097(zero)
    3bc4:	570001bf 	bnezl	t8,42c4 <_mem_avail_start-0x7fffbd3c>
    3bc8:	bfc010d0 	cache	0x0,4304(s8)
    3bcc:	bfc0111c 	cache	0x0,4380(s8)
    3bd0:	01f30004 	sllv	zero,s3,t7
    3bd4:	00009f57 	0x9f57
    3bd8:	00000000 	nop
    3bdc:	10880000 	beq	a0,t0,3be0 <_mem_avail_start-0x7fffc420>
    3be0:	10b4bfc0 	beq	a1,s4,ffff3ae4 <_text_end+0x403f234c>
    3be4:	0001bfc0 	sll	s7,at,0x1f
    3be8:	c010d062 	ll	s0,-12190(zero)
    3bec:	c010e4bf 	ll	s0,-6977(zero)
    3bf0:	620001bf 	0x620001bf
    3bf4:	bfc010ec 	cache	0x0,4332(s8)
    3bf8:	bfc0111c 	cache	0x0,4380(s8)
    3bfc:	00620001 	0x620001
    3c00:	00000000 	nop
    3c04:	90000000 	lbu	zero,0(zero)
    3c08:	98bfc010 	lwr	ra,-16368(a1)
    3c0c:	0ebfc010 	jal	aff0040 <_mem_avail_start-0x7500ffc0>
    3c10:	12008300 	beqz	s0,fffe4814 <_text_end+0x403e307c>
    3c14:	14160082 	bne	zero,s6,3e20 <_mem_avail_start-0x7fffc1e0>
    3c18:	0001282b 	sltu	a1,zero,at
    3c1c:	989f1316 	lwr	ra,4886(a0)
    3c20:	9cbfc010 	0x9cbfc010
    3c24:	0fbfc010 	jal	eff0040 <_mem_avail_start-0x7100ffc0>
    3c28:	5501f300 	bnel	t0,at,82c <_mem_avail_start-0x7ffff7d4>
    3c2c:	16008212 	bnez	s0,fffe4478 <_text_end+0x403e2ce0>
    3c30:	01282b14 	0x1282b14
    3c34:	9f131600 	0x9f131600
    3c38:	bfc0109c 	cache	0x0,4252(s8)
    3c3c:	bfc010bc 	cache	0x0,4284(s8)
    3c40:	ec600001 	swc3	$0,1(v1)
    3c44:	1cbfc010 	0x1cbfc010
    3c48:	01bfc011 	0x1bfc011
    3c4c:	00006000 	sll	t4,zero,0x0
    3c50:	00000000 	nop
    3c54:	10fc0000 	beq	a3,gp,3c58 <_mem_avail_start-0x7fffc3a8>
    3c58:	1108bfc0 	beq	t0,t0,ffff3b5c <_text_end+0x403f23c4>
    3c5c:	0001bfc0 	sll	s7,at,0x1f
    3c60:	00000052 	mflhxu	zero
    3c64:	00000000 	nop
    3c68:	c0107800 	ll	s0,30720(zero)
    3c6c:	c01080bf 	ll	s0,-32577(zero)
    3c70:	600001bf 	0x600001bf
    3c74:	bfc01088 	cache	0x0,4232(s8)
    3c78:	bfc01094 	cache	0x0,4244(s8)
    3c7c:	c8600001 	lwc2	$0,1(v1)
    3c80:	d0bfc010 	0xd0bfc010
    3c84:	01bfc010 	0x1bfc010
    3c88:	10d05400 	beq	a2,s0,18c8c <_mem_avail_start-0x7ffe7374>
    3c8c:	10ecbfc0 	beq	a3,t4,ffff3b90 <_text_end+0x403f23f8>
    3c90:	0001bfc0 	sll	s7,at,0x1f
    3c94:	00000060 	0x60
	...
    3ca4:	55000100 	bnezl	t0,40a8 <_mem_avail_start-0x7fffbf58>
    3ca8:	00000000 	nop
    3cac:	00000000 	nop
    3cb0:	00560001 	0x560001
    3cb4:	00000000 	nop
    3cb8:	04000000 	bltz	zero,3cbc <_mem_avail_start-0x7fffc344>
    3cbc:	5501f300 	bnel	t0,at,8c0 <_mem_avail_start-0x7ffff740>
    3cc0:	0000009f 	0x9f
	...
    3cd0:	54000100 	bnezl	zero,40d4 <_mem_avail_start-0x7fffbf2c>
    3cd4:	00000000 	nop
    3cd8:	00000000 	nop
    3cdc:	01f30004 	sllv	zero,s3,t7
    3ce0:	00009f54 	0x9f54
	...
    3cf0:	00010000 	sll	zero,at,0x0
    3cf4:	00000055 	0x55
    3cf8:	00000000 	nop
    3cfc:	f3000400 	0xf3000400
    3d00:	009f5501 	0x9f5501
	...
    3d10:	01000000 	0x1000000
    3d14:	00005600 	sll	t2,zero,0x18
    3d18:	00000000 	nop
    3d1c:	00060000 	sll	zero,a2,0x0
    3d20:	315601f3 	andi	s6,t2,0x1f3
    3d24:	00009f1c 	0x9f1c
	...
    3d34:	00010000 	sll	zero,at,0x0
    3d38:	00000054 	0x54
    3d3c:	00000000 	nop
    3d40:	52000100 	beqzl	s0,4144 <_mem_avail_start-0x7fffbebc>
    3d44:	00000000 	nop
	...
    3d54:	00550001 	movt	zero,v0,$fcc5
    3d58:	00000000 	nop
    3d5c:	04000000 	bltz	zero,3d60 <_mem_avail_start-0x7fffc2a0>
    3d60:	5501f300 	bnel	t0,at,964 <_mem_avail_start-0x7ffff69c>
    3d64:	0000009f 	0x9f
    3d68:	00000000 	nop
    3d6c:	55000100 	bnezl	t0,4170 <_mem_avail_start-0x7fffbe90>
    3d70:	00000000 	nop
    3d74:	00000000 	nop
    3d78:	01f30004 	sllv	zero,s3,t7
    3d7c:	00009f55 	0x9f55
	...
    3d8c:	00010000 	sll	zero,at,0x0
    3d90:	00000056 	0x56
    3d94:	00000000 	nop
    3d98:	73000a00 	0x73000a00
    3d9c:	00722000 	0x722000
    3da0:	22007622 	addi	zero,s0,30242
    3da4:	0000009f 	0x9f
    3da8:	00000000 	nop
    3dac:	56000100 	bnezl	s0,41b0 <_mem_avail_start-0x7fffbe50>
    3db0:	00000000 	nop
    3db4:	00000000 	nop
    3db8:	01f30010 	0x1f30010
    3dbc:	00732056 	0x732056
    3dc0:	5501f322 	bnel	t0,at,a4c <_mem_avail_start-0x7ffff5b4>
    3dc4:	5601f31c 	bnel	s0,at,a38 <_mem_avail_start-0x7ffff5c8>
    3dc8:	00009f22 	0x9f22
    3dcc:	00000000 	nop
    3dd0:	00070000 	sll	zero,a3,0x0
    3dd4:	01f30073 	tltu	t7,s3,0x1
    3dd8:	009f1c55 	0x9f1c55
    3ddc:	00000000 	nop
    3de0:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    3de4:	20007300 	addi	zero,zero,29440
    3de8:	76220072 	jalx	88801c8 <_mem_avail_start-0x7777fe38>
    3dec:	009f2200 	0x9f2200
    3df0:	00000000 	nop
    3df4:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    3df8:	73007200 	0x73007200
    3dfc:	00761c00 	0x761c00
    3e00:	00009f22 	0x9f22
	...
    3e10:	00010000 	sll	zero,at,0x0
    3e14:	00000055 	0x55
    3e18:	00000000 	nop
    3e1c:	53000100 	beqzl	t8,4220 <_mem_avail_start-0x7fffbde0>
    3e20:	00000000 	nop
    3e24:	00000000 	nop
    3e28:	00550001 	movt	zero,v0,$fcc5
	...
    3e38:	01000000 	0x1000000
    3e3c:	00005400 	sll	t2,zero,0x10
    3e40:	00000000 	nop
    3e44:	00010000 	sll	zero,at,0x0
    3e48:	00000052 	mflhxu	zero
    3e4c:	00000000 	nop
    3e50:	53000100 	beqzl	t8,4254 <_mem_avail_start-0x7fffbdac>
    3e54:	00000000 	nop
    3e58:	00000000 	nop
    3e5c:	00520001 	0x520001
    3e60:	00000000 	nop
    3e64:	01000000 	0x1000000
    3e68:	00005700 	sll	t2,zero,0x1c
    3e6c:	00000000 	nop
    3e70:	00010000 	sll	zero,at,0x0
    3e74:	00000055 	0x55
    3e78:	00000000 	nop
    3e7c:	53000100 	beqzl	t8,4280 <_mem_avail_start-0x7fffbd80>
    3e80:	00000000 	nop
	...
    3e90:	00540001 	movf	zero,v0,$fcc5
    3e94:	00000000 	nop
    3e98:	01000000 	0x1000000
    3e9c:	00005200 	sll	t2,zero,0x8
	...
    3eac:	00010000 	sll	zero,at,0x0
    3eb0:	00000055 	0x55
    3eb4:	00000000 	nop
    3eb8:	f3000400 	0xf3000400
    3ebc:	009f5501 	0x9f5501
	...
    3ecc:	01000000 	0x1000000
    3ed0:	00005600 	sll	t2,zero,0x18
    3ed4:	00000000 	nop
    3ed8:	00040000 	sll	zero,a0,0x0
    3edc:	9f5601f3 	0x9f5601f3
	...
    3ee8:	0073000b 	movn	zero,v1,s3
    3eec:	22007220 	addi	zero,s0,29216
    3ef0:	225601f3 	addi	s6,s2,499
    3ef4:	0000009f 	0x9f
    3ef8:	00000000 	nop
    3efc:	72000a00 	0x72000a00
    3f00:	1c007300 	bgtz	zero,20b04 <_mem_avail_start-0x7ffdf4fc>
    3f04:	225601f3 	addi	s6,s2,499
    3f08:	0000009f 	0x9f
	...
    3f18:	54000100 	bnezl	zero,431c <_mem_avail_start-0x7fffbce4>
    3f1c:	00000000 	nop
    3f20:	00000000 	nop
    3f24:	00530001 	0x530001
    3f28:	00000000 	nop
    3f2c:	1c000000 	bgtz	zero,3f30 <_mem_avail_start-0x7fffc0d0>
    3f30:	28bfc011 	slti	ra,a1,-16367
    3f34:	01bfc011 	0x1bfc011
    3f38:	11285400 	beq	t1,t0,18f3c <_mem_avail_start-0x7ffe70c4>
    3f3c:	1140bfc0 	beqz	t2,ffff3e40 <_text_end+0x403f26a8>
    3f40:	0001bfc0 	sll	s7,at,0x1f
    3f44:	00000052 	mflhxu	zero
    3f48:	00000000 	nop
    3f4c:	c0111c00 	ll	s1,7168(zero)
    3f50:	c01124bf 	ll	s1,9407(zero)
    3f54:	560001bf 	bnezl	s0,4654 <_mem_avail_start-0x7fffb9ac>
    3f58:	bfc01124 	cache	0x0,4388(s8)
    3f5c:	bfc01128 	cache	0x0,4392(s8)
    3f60:	01f30004 	sllv	zero,s3,t7
    3f64:	11289f56 	beq	t1,t0,fffebcc0 <_text_end+0x403ea528>
    3f68:	1138bfc0 	beq	t1,t8,ffff3e6c <_text_end+0x403f26d4>
    3f6c:	000bbfc0 	sll	s7,t3,0x1f
    3f70:	72200073 	0x72200073
    3f74:	01f32200 	0x1f32200
    3f78:	389f2256 	xori	ra,a0,0x2256
    3f7c:	40bfc011 	0x40bfc011
    3f80:	0abfc011 	j	aff0044 <_mem_avail_start-0x7500ffbc>
    3f84:	73007200 	0x73007200
    3f88:	01f31c00 	0x1f31c00
    3f8c:	009f2256 	0x9f2256
    3f90:	00000000 	nop
    3f94:	20000000 	addi	zero,zero,0
    3f98:	28bfc011 	slti	ra,a1,-16367
    3f9c:	01bfc011 	0x1bfc011
    3fa0:	11285400 	beq	t1,t0,18fa4 <_mem_avail_start-0x7ffe705c>
    3fa4:	1140bfc0 	beqz	t2,ffff3ea8 <_text_end+0x403f2710>
    3fa8:	0001bfc0 	sll	s7,at,0x1f
    3fac:	00000053 	mtlhx	zero
	...
    3fbc:	54000100 	bnezl	zero,43c0 <_mem_avail_start-0x7fffbc40>
    3fc0:	00000000 	nop
    3fc4:	00000000 	nop
    3fc8:	00520001 	0x520001
	...
    3fd8:	01000000 	0x1000000
    3fdc:	00005400 	sll	t2,zero,0x10
    3fe0:	00000000 	nop
    3fe4:	00010000 	sll	zero,at,0x0
    3fe8:	00000052 	mflhxu	zero
    3fec:	00000000 	nop
    3ff0:	52000100 	beqzl	s0,43f4 <_mem_avail_start-0x7fffbc0c>
    3ff4:	00000000 	nop
	...
    4004:	00540001 	movf	zero,v0,$fcc5
    4008:	00000000 	nop
    400c:	01000000 	0x1000000
    4010:	00005400 	sll	t2,zero,0x10
	...
    4020:	00010000 	sll	zero,at,0x0
    4024:	00000055 	0x55
    4028:	00000000 	nop
    402c:	55000100 	bnezl	t0,4430 <_mem_avail_start-0x7fffbbd0>
    4030:	00000000 	nop
	...
    4040:	00560001 	0x560001
    4044:	00000000 	nop
    4048:	04000000 	bltz	zero,404c <_mem_avail_start-0x7fffbfb4>
    404c:	5601f300 	bnel	s0,at,c50 <_mem_avail_start-0x7ffff3b0>
    4050:	0000009f 	0x9f
    4054:	00000000 	nop
    4058:	f3000600 	0xf3000600
    405c:	1c315601 	0x1c315601
    4060:	0000009f 	0x9f
    4064:	00000000 	nop
    4068:	f3000400 	0xf3000400
    406c:	009f5601 	0x9f5601
	...
    407c:	01000000 	0x1000000
    4080:	00005400 	sll	t2,zero,0x10
    4084:	00000000 	nop
    4088:	00010000 	sll	zero,at,0x0
    408c:	00000054 	0x54
	...
    409c:	55000100 	bnezl	t0,44a0 <_mem_avail_start-0x7fffbb60>
    40a0:	00000000 	nop
    40a4:	00000000 	nop
    40a8:	00550001 	movt	zero,v0,$fcc5
	...
    40b8:	01000000 	0x1000000
    40bc:	00005400 	sll	t2,zero,0x10
    40c0:	00000000 	nop
    40c4:	00010000 	sll	zero,at,0x0
    40c8:	00000052 	mflhxu	zero
	...
    40d8:	55000100 	bnezl	t0,44dc <_mem_avail_start-0x7fffbb24>
    40dc:	00000000 	nop
    40e0:	00000000 	nop
    40e4:	00550001 	movt	zero,v0,$fcc5
	...
    40f4:	01000000 	0x1000000
    40f8:	00005600 	sll	t2,zero,0x18
    40fc:	00000000 	nop
    4100:	00040000 	sll	zero,a0,0x0
    4104:	9f5601f3 	0x9f5601f3
	...
    4110:	0072000a 	movz	zero,v1,s2
    4114:	f31c0073 	0xf31c0073
    4118:	9f225601 	0x9f225601
	...
    412c:	00540001 	movf	zero,v0,$fcc5
    4130:	00000000 	nop
    4134:	01000000 	0x1000000
    4138:	00005300 	sll	t2,zero,0xc
	...
    4148:	00010000 	sll	zero,at,0x0
    414c:	00000054 	0x54
    4150:	00000000 	nop
    4154:	52000100 	beqzl	s0,4558 <_mem_avail_start-0x7fffbaa8>
    4158:	00000000 	nop
	...
    4168:	00550001 	movt	zero,v0,$fcc5
    416c:	00000000 	nop
    4170:	01000000 	0x1000000
    4174:	00005500 	sll	t2,zero,0x14
	...
    4184:	00010000 	sll	zero,at,0x0
    4188:	00000054 	0x54
    418c:	00000000 	nop
    4190:	53000100 	beqzl	t8,4594 <_mem_avail_start-0x7fffba6c>
    4194:	00000000 	nop
	...
    41a4:	00540001 	movf	zero,v0,$fcc5
    41a8:	00000000 	nop
    41ac:	06000000 	bltz	s0,41b0 <_mem_avail_start-0x7fffbe50>
    41b0:	72007400 	0x72007400
    41b4:	009f2200 	0x9f2200
    41b8:	00000000 	nop
    41bc:	08000000 	j	0 <_mem_avail_start-0x80000000>
    41c0:	74007200 	jalx	1c800 <_mem_avail_start-0x7ffe3800>
    41c4:	01232200 	0x1232200
    41c8:	0000009f 	0x9f
    41cc:	00000000 	nop
    41d0:	72000600 	0x72000600
    41d4:	22007400 	addi	zero,s0,29696
    41d8:	0000009f 	0x9f
	...
    41e8:	30000200 	andi	zero,zero,0x200
    41ec:	0000009f 	0x9f
    41f0:	00000000 	nop
    41f4:	52000100 	beqzl	s0,45f8 <_mem_avail_start-0x7fffba08>
    41f8:	00000000 	nop
	...
    4208:	00540001 	movf	zero,v0,$fcc5
    420c:	00000000 	nop
    4210:	01000000 	0x1000000
    4214:	00005300 	sll	t2,zero,0xc
	...
    4224:	00020000 	sll	zero,v0,0x0
    4228:	00009f30 	tge	zero,zero,0x27c
    422c:	00000000 	nop
    4230:	00010000 	sll	zero,at,0x0
    4234:	00000052 	mflhxu	zero
    4238:	00000000 	nop
    423c:	c011a000 	ll	s1,-24576(zero)
    4240:	c011afbf 	ll	s1,-20545(zero)
    4244:	540001bf 	bnezl	zero,4944 <_mem_avail_start-0x7fffb6bc>
    4248:	bfc011af 	cache	0x0,4527(s8)
    424c:	bfc011d0 	cache	0x0,4560(s8)
    4250:	01f30004 	sllv	zero,s3,t7
    4254:	00009f54 	0x9f54
    4258:	00000000 	nop
    425c:	11400000 	beqz	t2,4260 <_mem_avail_start-0x7fffbda0>
    4260:	115cbfc0 	beq	t2,gp,ffff4164 <_text_end+0x403f29cc>
    4264:	0001bfc0 	sll	s7,at,0x1f
    4268:	c0115c54 	ll	s1,23636(zero)
    426c:	c01170bf 	ll	s1,28863(zero)
    4270:	610001bf 	0x610001bf
    4274:	bfc01180 	cache	0x0,4480(s8)
    4278:	bfc011a0 	cache	0x0,4512(s8)
    427c:	00610001 	movt	zero,v1,$fcc0
    4280:	00000000 	nop
    4284:	60000000 	0x60000000
    4288:	74bfc011 	jalx	2ff0044 <_mem_avail_start-0x7d00ffbc>
    428c:	01bfc011 	0x1bfc011
    4290:	11806000 	beqz	t4,1c294 <_mem_avail_start-0x7ffe3d6c>
    4294:	11a0bfc0 	beqz	t5,ffff4198 <_text_end+0x403f2a00>
    4298:	0001bfc0 	sll	s7,at,0x1f
    429c:	00000060 	0x60
    42a0:	00000000 	nop
    42a4:	c011d000 	ll	s1,-12288(zero)
    42a8:	c011dcbf 	ll	s1,-9025(zero)
    42ac:	540001bf 	bnezl	zero,49ac <_mem_avail_start-0x7fffb654>
    42b0:	bfc011dc 	cache	0x0,4572(s8)
    42b4:	bfc011f4 	cache	0x0,4596(s8)
    42b8:	f4600001 	sdc1	$f0,1(v1)
    42bc:	fcbfc011 	sdc3	$31,-16367(a1)
    42c0:	01bfc011 	0x1bfc011
    42c4:	00005200 	sll	t2,zero,0x8
	...
    42d4:	00060000 	sll	zero,a2,0x0
    42d8:	f020049e 	0xf020049e
    42dc:	0000bff0 	tge	zero,zero,0x2ff
    42e0:	00000000 	nop
    42e4:	12680000 	beq	s3,t0,42e8 <_mem_avail_start-0x7fffbd18>
    42e8:	1274bfc0 	beq	s3,s4,ffff41ec <_text_end+0x403f2a54>
    42ec:	0001bfc0 	sll	s7,at,0x1f
    42f0:	00000054 	0x54
    42f4:	00000000 	nop
    42f8:	c0126800 	ll	s2,26624(zero)
    42fc:	c01274bf 	ll	s2,29887(zero)
    4300:	9e0006bf 	0x9e0006bf
    4304:	f0f01004 	0xf0f01004
    4308:	000000bf 	0xbf
    430c:	00000000 	nop
    4310:	c0125400 	ll	s2,21504(zero)
    4314:	c01260bf 	ll	s2,24767(zero)
    4318:	540001bf 	bnezl	zero,4a18 <_mem_avail_start-0x7fffb5e8>
    431c:	00000000 	nop
    4320:	00000000 	nop
    4324:	bfc01254 	cache	0x0,4692(s8)
    4328:	bfc01260 	cache	0x0,4704(s8)
    432c:	049e0006 	0x49e0006
    4330:	bff0f000 	cache	0x10,-4096(ra)
	...
    4344:	9f300002 	0x9f300002
	...
    4350:	00740006 	srlv	zero,s4,v1
    4354:	9f1aff08 	0x9f1aff08
	...
    4360:	0075000e 	0x75000e
    4364:	381aff08 	xori	k0,zero,0xff08
    4368:	08007424 	j	1d090 <_mem_avail_start-0x7ffe2f70>
    436c:	9f211aff 	0x9f211aff
	...
    4378:	00540001 	movf	zero,v0,$fcc5
    437c:	00000000 	nop
    4380:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
    4384:	08007200 	j	1c800 <_mem_avail_start-0x7ffe3800>
    4388:	24481aff 	addiu	t0,v0,6911
    438c:	9f210074 	0x9f210074
	...
    4398:	bfc01248 	cache	0x0,4680(s8)
    439c:	bfc0124c 	cache	0x0,4684(s8)
    43a0:	00540001 	movf	zero,v0,$fcc5
    43a4:	00000000 	nop
    43a8:	48000000 	mfc2	zero,$0
    43ac:	4cbfc012 	0x4cbfc012
    43b0:	06bfc012 	0x6bfc012
    43b4:	00049e00 	sll	s3,a0,0x18
    43b8:	00bfd030 	tge	a1,ra,0x340
    43bc:	00000000 	nop
    43c0:	fc000000 	sdc3	$0,0(zero)
    43c4:	08bfc011 	j	2ff0044 <_mem_avail_start-0x7d00ffbc>
    43c8:	03bfc012 	0x3bfc012
    43cc:	9f810900 	0x9f810900
	...
    43d8:	bfc011fc 	cache	0x0,4604(s8)
    43dc:	bfc01208 	cache	0x0,4616(s8)
    43e0:	049e0006 	0x49e0006
    43e4:	bfd03008 	cache	0x10,12296(s8)
	...
    43f0:	bfc01208 	cache	0x0,4616(s8)
    43f4:	bfc01210 	cache	0x0,4624(s8)
    43f8:	80090003 	lb	t1,3(zero)
    43fc:	0000009f 	0x9f
    4400:	00000000 	nop
    4404:	c0120800 	ll	s2,2048(zero)
    4408:	c01210bf 	ll	s2,4287(zero)
    440c:	9e0006bf 	0x9e0006bf
    4410:	d0300c04 	0xd0300c04
    4414:	000000bf 	0xbf
    4418:	00000000 	nop
    441c:	c0121000 	ll	s2,4096(zero)
    4420:	c01218bf 	ll	s2,6335(zero)
    4424:	080003bf 	j	efc <_mem_avail_start-0x7ffff104>
    4428:	00009f36 	tne	zero,zero,0x27c
    442c:	00000000 	nop
    4430:	12100000 	beq	s0,s0,4434 <_mem_avail_start-0x7fffbbcc>
    4434:	1218bfc0 	beq	s0,t8,ffff4338 <_text_end+0x403f2ba0>
    4438:	0006bfc0 	sll	s7,a2,0x1f
    443c:	3000049e 	andi	zero,zero,0x49e
    4440:	0000bfd0 	0xbfd0
    4444:	00000000 	nop
    4448:	12200000 	beqz	s1,444c <_mem_avail_start-0x7fffbbb4>
    444c:	1224bfc0 	beq	s1,a0,ffff4350 <_text_end+0x403f2bb8>
    4450:	0002bfc0 	sll	s7,v0,0x1f
    4454:	00009f33 	tltu	zero,zero,0x27c
    4458:	00000000 	nop
    445c:	12200000 	beqz	s1,4460 <_mem_avail_start-0x7fffbba0>
    4460:	1224bfc0 	beq	s1,a0,ffff4364 <_text_end+0x403f2bcc>
    4464:	0006bfc0 	sll	s7,a2,0x1f
    4468:	300c049e 	andi	t4,zero,0x49e
    446c:	0000bfd0 	0xbfd0
    4470:	00000000 	nop
    4474:	12180000 	beq	s0,t8,4478 <_mem_avail_start-0x7fffbb88>
    4478:	1220bfc0 	beqz	s1,ffff437c <_text_end+0x403f2be4>
    447c:	0002bfc0 	sll	s7,v0,0x1f
    4480:	00009f30 	tge	zero,zero,0x27c
    4484:	00000000 	nop
    4488:	12180000 	beq	s0,t8,448c <_mem_avail_start-0x7fffbb74>
    448c:	1220bfc0 	beqz	s1,ffff4390 <_text_end+0x403f2bf8>
    4490:	0006bfc0 	sll	s7,a2,0x1f
    4494:	3004049e 	andi	a0,zero,0x49e
    4498:	0000bfd0 	0xbfd0
    449c:	00000000 	nop
    44a0:	12240000 	beq	s1,a0,44a4 <_mem_avail_start-0x7fffbb5c>
    44a4:	1228bfc0 	beq	s1,t0,ffff43a8 <_text_end+0x403f2c10>
    44a8:	0002bfc0 	sll	s7,v0,0x1f
    44ac:	00009f30 	tge	zero,zero,0x27c
    44b0:	00000000 	nop
    44b4:	12240000 	beq	s1,a0,44b8 <_mem_avail_start-0x7fffbb48>
    44b8:	1228bfc0 	beq	s1,t0,ffff43bc <_text_end+0x403f2c24>
    44bc:	0006bfc0 	sll	s7,a2,0x1f
    44c0:	3010049e 	andi	s0,zero,0x49e
    44c4:	0000bfd0 	0xbfd0
    44c8:	00000000 	nop
    44cc:	12280000 	beq	s1,t0,44d0 <_mem_avail_start-0x7fffbb30>
    44d0:	122cbfc0 	beq	s1,t4,ffff43d4 <_text_end+0x403f2c3c>
    44d4:	0002bfc0 	sll	s7,v0,0x1f
    44d8:	00009f30 	tge	zero,zero,0x27c
    44dc:	00000000 	nop
    44e0:	12280000 	beq	s1,t0,44e4 <_mem_avail_start-0x7fffbb1c>
    44e4:	122cbfc0 	beq	s1,t4,ffff43e8 <_text_end+0x403f2c50>
    44e8:	0006bfc0 	sll	s7,a2,0x1f
    44ec:	3004049e 	andi	a0,zero,0x49e
    44f0:	0000bfd0 	0xbfd0
	...
    4500:	00010000 	sll	zero,at,0x0
    4504:	00000055 	0x55
	...
    4514:	54000100 	bnezl	zero,4918 <_mem_avail_start-0x7fffb6e8>
    4518:	00000000 	nop
	...
    4528:	00540001 	movf	zero,v0,$fcc5
	...
    4538:	01000000 	0x1000000
    453c:	00005400 	sll	t2,zero,0x10
	...
    454c:	00010000 	sll	zero,at,0x0
    4550:	00000055 	0x55
	...
    4560:	54000100 	bnezl	zero,4964 <_mem_avail_start-0x7fffb69c>
    4564:	00000000 	nop
	...
    4574:	00550001 	movt	zero,v0,$fcc5
	...
    4584:	01000000 	0x1000000
    4588:	00005400 	sll	t2,zero,0x10
	...
    4598:	00010000 	sll	zero,at,0x0
    459c:	00000055 	0x55
	...
    45ac:	54000100 	bnezl	zero,49b0 <_mem_avail_start-0x7fffb650>
    45b0:	00000000 	nop
    45b4:	00000000 	nop

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	00000064 	0x64
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
  1c:	00000038 	0x38
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	bfc004b0 	cache	0x0,1200(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	00000060 	0x60
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	bfc00510 	cache	0x0,1296(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	00000070 	tge	zero,zero,0x1
  30:	bfc00580 	cache	0x0,1408(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	000000c8 	0xc8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	bfc00648 	cache	0x0,1608(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	000000cc 	syscall	0x3
  40:	bfc00714 	cache	0x0,1812(s8)
  44:	000000c8 	0xc8
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	bfc007dc 	cache	0x0,2012(s8)
  4c:	000001e8 	0x1e8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	bfc009c4 	cache	0x0,2500(s8)
  54:	000000d4 	0xd4
  58:	bfc00a98 	cache	0x0,2712(s8)
  5c:	0000010c 	syscall	0x4
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  68:	0000001c 	0x1c
  6c:	48580002 	0x48580002
  70:	00040000 	sll	zero,a0,0x0
  74:	00000000 	nop
  78:	bfc00000 	cache	0x0,0(s8)
  7c:	00000450 	0x450
	...
  88:	00000044 	0x44
  8c:	487e0002 	0x487e0002
  90:	00040000 	sll	zero,a0,0x0
  94:	00000000 	nop
  98:	bfc00ba4 	cache	0x0,2980(s8)
  9c:	000000c8 	0xc8
  a0:	00000000 	nop
  a4:	0000000c 	syscall
  a8:	00000000 	nop
  ac:	0000000c 	syscall
  b0:	bfc00c6c 	cache	0x0,3180(s8)
  b4:	00000098 	0x98
  b8:	bfc00d04 	cache	0x0,3332(s8)
  bc:	00000068 	0x68
  c0:	bfc00d6c 	cache	0x0,3436(s8)
  c4:	000000b4 	teq	zero,zero,0x2
	...
  d0:	0000001c 	0x1c
  d4:	4dee0002 	0x4dee0002
  d8:	00040000 	sll	zero,a0,0x0
  dc:	00000000 	nop
  e0:	bfc00e20 	cache	0x0,3616(s8)
  e4:	00000224 	0x224
	...
  f0:	0000001c 	0x1c
  f4:	4fb40002 	c3	0x1b40002
  f8:	00040000 	sll	zero,a0,0x0
  fc:	00000000 	nop
 100:	bfc01044 	cache	0x0,4164(s8)
 104:	000000d8 	0xd8
	...
 110:	0000007c 	0x7c
 114:	51020002 	beql	t0,v0,120 <_mem_avail_start-0x7ffffee0>
 118:	00040000 	sll	zero,a0,0x0
	...
 124:	00000020 	add	zero,zero,zero
 128:	00000000 	nop
 12c:	00000028 	0x28
 130:	00000000 	nop
 134:	00000024 	and	zero,zero,zero
 138:	00000000 	nop
 13c:	00000034 	teq	zero,zero
 140:	00000000 	nop
 144:	00000030 	tge	zero,zero
 148:	00000000 	nop
 14c:	00000044 	0x44
 150:	00000000 	nop
 154:	0000002c 	0x2c
 158:	00000000 	nop
 15c:	00000028 	0x28
 160:	bfc0111c 	cache	0x0,4380(s8)
 164:	00000024 	and	zero,zero,zero
 168:	00000000 	nop
 16c:	0000002c 	0x2c
 170:	00000000 	nop
 174:	00000070 	tge	zero,zero,0x1
 178:	00000000 	nop
 17c:	00000040 	ssnop
 180:	00000000 	nop
 184:	0000000c 	syscall
	...
 190:	00000024 	and	zero,zero,zero
 194:	551c0002 	bnel	t0,gp,1a0 <_mem_avail_start-0x7ffffe60>
 198:	00040000 	sll	zero,a0,0x0
 19c:	00000000 	nop
 1a0:	bfc01140 	cache	0x0,4416(s8)
 1a4:	00000060 	0x60
 1a8:	bfc011a0 	cache	0x0,4512(s8)
 1ac:	00000030 	tge	zero,zero
	...
 1b8:	0000001c 	0x1c
 1bc:	566c0002 	bnel	s3,t4,1c8 <_mem_avail_start-0x7ffffe38>
 1c0:	00040000 	sll	zero,a0,0x0
 1c4:	00000000 	nop
 1c8:	bfc011d0 	cache	0x0,4560(s8)
 1cc:	0000002c 	0x2c
	...
 1d8:	0000008c 	syscall	0x2
 1dc:	57220002 	bnel	t9,v0,1e8 <_mem_avail_start-0x7ffffe18>
 1e0:	00040000 	sll	zero,a0,0x0
	...
 1ec:	0000000c 	syscall
 1f0:	00000000 	nop
 1f4:	0000000c 	syscall
 1f8:	00000000 	nop
 1fc:	0000000c 	syscall
 200:	00000000 	nop
 204:	0000000c 	syscall
 208:	00000000 	nop
 20c:	0000000c 	syscall
 210:	00000000 	nop
 214:	0000000c 	syscall
 218:	00000000 	nop
 21c:	0000000c 	syscall
 220:	00000000 	nop
 224:	0000000c 	syscall
 228:	bfc011fc 	cache	0x0,4604(s8)
 22c:	00000038 	0x38
 230:	00000000 	nop
 234:	00000020 	add	zero,zero,zero
 238:	bfc01234 	cache	0x0,4660(s8)
 23c:	00000020 	add	zero,zero,zero
 240:	00000000 	nop
 244:	00000048 	0x48
 248:	bfc01254 	cache	0x0,4692(s8)
 24c:	00000014 	0x14
 250:	bfc01268 	cache	0x0,4712(s8)
 254:	00000014 	0x14
 258:	00000000 	nop
 25c:	00000014 	0x14
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	bfc00480 	cache	0x0,1152(s8)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	bfc004a0 	cache	0x0,1184(s8)
   8:	bfc004a4 	cache	0x0,1188(s8)
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	bfc004b0 	cache	0x0,1200(s8)
	...
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	bfc00488 	cache	0x0,1160(s8)
  1c:	bfc004a0 	cache	0x0,1184(s8)
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	bfc004a4 	cache	0x0,1188(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	bfc004b0 	cache	0x0,1200(s8)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  30:	bfc00490 	cache	0x0,1168(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	bfc004a0 	cache	0x0,1184(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	bfc004a4 	cache	0x0,1188(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	bfc004b0 	cache	0x0,1200(s8)
	...
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	bfc00498 	cache	0x0,1176(s8)
  4c:	bfc004a0 	cache	0x0,1184(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	bfc004a4 	cache	0x0,1188(s8)
  54:	bfc004b0 	cache	0x0,1200(s8)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	bfc004b8 	cache	0x0,1208(s8)
  64:	bfc00500 	cache	0x0,1280(s8)
  68:	bfc00504 	cache	0x0,1284(s8)
  6c:	bfc00510 	cache	0x0,1296(s8)
	...
  78:	bfc004c0 	cache	0x0,1216(s8)
  7c:	bfc00500 	cache	0x0,1280(s8)
  80:	bfc00504 	cache	0x0,1284(s8)
  84:	bfc00510 	cache	0x0,1296(s8)
	...
  90:	bfc004c8 	cache	0x0,1224(s8)
  94:	bfc00500 	cache	0x0,1280(s8)
  98:	bfc00504 	cache	0x0,1284(s8)
  9c:	bfc00510 	cache	0x0,1296(s8)
	...
  a8:	bfc004d0 	cache	0x0,1232(s8)
  ac:	bfc00500 	cache	0x0,1280(s8)
  b0:	bfc00504 	cache	0x0,1284(s8)
  b4:	bfc00510 	cache	0x0,1296(s8)
	...
  c0:	bfc004d8 	cache	0x0,1240(s8)
  c4:	bfc00500 	cache	0x0,1280(s8)
  c8:	bfc00504 	cache	0x0,1284(s8)
  cc:	bfc00510 	cache	0x0,1296(s8)
	...
  d8:	bfc004e0 	cache	0x0,1248(s8)
  dc:	bfc00500 	cache	0x0,1280(s8)
  e0:	bfc00504 	cache	0x0,1284(s8)
  e4:	bfc00510 	cache	0x0,1296(s8)
	...
  f0:	bfc004e8 	cache	0x0,1256(s8)
  f4:	bfc00500 	cache	0x0,1280(s8)
  f8:	bfc00504 	cache	0x0,1284(s8)
  fc:	bfc00510 	cache	0x0,1296(s8)
	...
 108:	bfc004f0 	cache	0x0,1264(s8)
 10c:	bfc00500 	cache	0x0,1280(s8)
 110:	bfc00504 	cache	0x0,1284(s8)
 114:	bfc00510 	cache	0x0,1296(s8)
	...
 120:	bfc004f8 	cache	0x0,1272(s8)
 124:	bfc00500 	cache	0x0,1280(s8)
 128:	bfc00504 	cache	0x0,1284(s8)
 12c:	bfc00510 	cache	0x0,1296(s8)
	...
 138:	bfc00584 	cache	0x0,1412(s8)
 13c:	bfc00588 	cache	0x0,1416(s8)
 140:	bfc00598 	cache	0x0,1432(s8)
 144:	bfc005c4 	cache	0x0,1476(s8)
	...
 150:	bfc00584 	cache	0x0,1412(s8)
 154:	bfc00588 	cache	0x0,1416(s8)
 158:	bfc00598 	cache	0x0,1432(s8)
 15c:	bfc005a0 	cache	0x0,1440(s8)
 160:	bfc005a4 	cache	0x0,1444(s8)
 164:	bfc005b8 	cache	0x0,1464(s8)
	...
 170:	bfc005c4 	cache	0x0,1476(s8)
 174:	bfc005c8 	cache	0x0,1480(s8)
 178:	bfc005cc 	cache	0x0,1484(s8)
 17c:	bfc0061c 	cache	0x0,1564(s8)
 180:	bfc00624 	cache	0x0,1572(s8)
 184:	bfc00638 	cache	0x0,1592(s8)
	...
 190:	bfc005c4 	cache	0x0,1476(s8)
 194:	bfc005c8 	cache	0x0,1480(s8)
 198:	bfc005d4 	cache	0x0,1492(s8)
 19c:	bfc005dc 	cache	0x0,1500(s8)
 1a0:	bfc005e0 	cache	0x0,1504(s8)
 1a4:	bfc005f4 	cache	0x0,1524(s8)
 1a8:	bfc005f8 	cache	0x0,1528(s8)
 1ac:	bfc005fc 	cache	0x0,1532(s8)
	...
 1b8:	bfc00614 	cache	0x0,1556(s8)
 1bc:	bfc0061c 	cache	0x0,1564(s8)
 1c0:	bfc00624 	cache	0x0,1572(s8)
 1c4:	bfc00630 	cache	0x0,1584(s8)
	...
 1d0:	bfc0064c 	cache	0x0,1612(s8)
 1d4:	bfc00650 	cache	0x0,1616(s8)
 1d8:	bfc00660 	cache	0x0,1632(s8)
 1dc:	bfc00690 	cache	0x0,1680(s8)
	...
 1e8:	bfc0064c 	cache	0x0,1612(s8)
 1ec:	bfc00650 	cache	0x0,1616(s8)
 1f0:	bfc00660 	cache	0x0,1632(s8)
 1f4:	bfc00668 	cache	0x0,1640(s8)
 1f8:	bfc0066c 	cache	0x0,1644(s8)
 1fc:	bfc00680 	cache	0x0,1664(s8)
	...
 208:	bfc00690 	cache	0x0,1680(s8)
 20c:	bfc00694 	cache	0x0,1684(s8)
 210:	bfc00698 	cache	0x0,1688(s8)
 214:	bfc006ec 	cache	0x0,1772(s8)
 218:	bfc006f4 	cache	0x0,1780(s8)
 21c:	bfc00708 	cache	0x0,1800(s8)
	...
 228:	bfc00690 	cache	0x0,1680(s8)
 22c:	bfc00694 	cache	0x0,1684(s8)
 230:	bfc006a0 	cache	0x0,1696(s8)
 234:	bfc006a8 	cache	0x0,1704(s8)
 238:	bfc006ac 	cache	0x0,1708(s8)
 23c:	bfc006c0 	cache	0x0,1728(s8)
 240:	bfc006c4 	cache	0x0,1732(s8)
 244:	bfc006c8 	cache	0x0,1736(s8)
	...
 250:	bfc006e4 	cache	0x0,1764(s8)
 254:	bfc006ec 	cache	0x0,1772(s8)
 258:	bfc006f4 	cache	0x0,1780(s8)
 25c:	bfc00700 	cache	0x0,1792(s8)
	...
 268:	bfc00718 	cache	0x0,1816(s8)
 26c:	bfc0071c 	cache	0x0,1820(s8)
 270:	bfc0072c 	cache	0x0,1836(s8)
 274:	bfc0075c 	cache	0x0,1884(s8)
	...
 280:	bfc00718 	cache	0x0,1816(s8)
 284:	bfc0071c 	cache	0x0,1820(s8)
 288:	bfc0072c 	cache	0x0,1836(s8)
 28c:	bfc00734 	cache	0x0,1844(s8)
 290:	bfc00738 	cache	0x0,1848(s8)
 294:	bfc0074c 	cache	0x0,1868(s8)
	...
 2a0:	bfc0075c 	cache	0x0,1884(s8)
 2a4:	bfc00760 	cache	0x0,1888(s8)
 2a8:	bfc00764 	cache	0x0,1892(s8)
 2ac:	bfc007b4 	cache	0x0,1972(s8)
 2b0:	bfc007bc 	cache	0x0,1980(s8)
 2b4:	bfc007d0 	cache	0x0,2000(s8)
	...
 2c0:	bfc0075c 	cache	0x0,1884(s8)
 2c4:	bfc00760 	cache	0x0,1888(s8)
 2c8:	bfc0076c 	cache	0x0,1900(s8)
 2cc:	bfc00774 	cache	0x0,1908(s8)
 2d0:	bfc00778 	cache	0x0,1912(s8)
 2d4:	bfc00788 	cache	0x0,1928(s8)
 2d8:	bfc0078c 	cache	0x0,1932(s8)
 2dc:	bfc00790 	cache	0x0,1936(s8)
	...
 2e8:	bfc007ac 	cache	0x0,1964(s8)
 2ec:	bfc007b4 	cache	0x0,1972(s8)
 2f0:	bfc007bc 	cache	0x0,1980(s8)
 2f4:	bfc007c8 	cache	0x0,1992(s8)
	...
 300:	bfc0089c 	cache	0x0,2204(s8)
 304:	bfc00990 	cache	0x0,2448(s8)
 308:	bfc009b4 	cache	0x0,2484(s8)
 30c:	bfc009b8 	cache	0x0,2488(s8)
 310:	bfc009bc 	cache	0x0,2492(s8)
 314:	bfc009c4 	cache	0x0,2500(s8)
	...
 320:	bfc008a8 	cache	0x0,2216(s8)
 324:	bfc00990 	cache	0x0,2448(s8)
 328:	bfc009b4 	cache	0x0,2484(s8)
 32c:	bfc009b8 	cache	0x0,2488(s8)
 330:	bfc009bc 	cache	0x0,2492(s8)
 334:	bfc009c4 	cache	0x0,2500(s8)
	...
 340:	bfc008b4 	cache	0x0,2228(s8)
 344:	bfc00990 	cache	0x0,2448(s8)
 348:	bfc009b4 	cache	0x0,2484(s8)
 34c:	bfc009b8 	cache	0x0,2488(s8)
 350:	bfc009bc 	cache	0x0,2492(s8)
 354:	bfc009c4 	cache	0x0,2500(s8)
	...
 360:	bfc008c0 	cache	0x0,2240(s8)
 364:	bfc00990 	cache	0x0,2448(s8)
 368:	bfc009b4 	cache	0x0,2484(s8)
 36c:	bfc009b8 	cache	0x0,2488(s8)
 370:	bfc009bc 	cache	0x0,2492(s8)
 374:	bfc009c4 	cache	0x0,2500(s8)
	...
 380:	bfc008cc 	cache	0x0,2252(s8)
 384:	bfc00990 	cache	0x0,2448(s8)
 388:	bfc009b4 	cache	0x0,2484(s8)
 38c:	bfc009b8 	cache	0x0,2488(s8)
 390:	bfc009bc 	cache	0x0,2492(s8)
 394:	bfc009c4 	cache	0x0,2500(s8)
	...
 3a0:	bfc008d8 	cache	0x0,2264(s8)
 3a4:	bfc00990 	cache	0x0,2448(s8)
 3a8:	bfc009b4 	cache	0x0,2484(s8)
 3ac:	bfc009b8 	cache	0x0,2488(s8)
 3b0:	bfc009bc 	cache	0x0,2492(s8)
 3b4:	bfc009c4 	cache	0x0,2500(s8)
	...
 3c0:	bfc008e4 	cache	0x0,2276(s8)
 3c4:	bfc00990 	cache	0x0,2448(s8)
 3c8:	bfc009b4 	cache	0x0,2484(s8)
 3cc:	bfc009b8 	cache	0x0,2488(s8)
 3d0:	bfc009bc 	cache	0x0,2492(s8)
 3d4:	bfc009c4 	cache	0x0,2500(s8)
	...
 3e0:	bfc008f0 	cache	0x0,2288(s8)
 3e4:	bfc00990 	cache	0x0,2448(s8)
 3e8:	bfc009b4 	cache	0x0,2484(s8)
 3ec:	bfc009b8 	cache	0x0,2488(s8)
 3f0:	bfc009bc 	cache	0x0,2492(s8)
 3f4:	bfc009c4 	cache	0x0,2500(s8)
	...
 400:	bfc008fc 	cache	0x0,2300(s8)
 404:	bfc00990 	cache	0x0,2448(s8)
 408:	bfc009b4 	cache	0x0,2484(s8)
 40c:	bfc009b8 	cache	0x0,2488(s8)
 410:	bfc009bc 	cache	0x0,2492(s8)
 414:	bfc009c4 	cache	0x0,2500(s8)
	...
 420:	bfc00908 	cache	0x0,2312(s8)
 424:	bfc00990 	cache	0x0,2448(s8)
 428:	bfc009b4 	cache	0x0,2484(s8)
 42c:	bfc009b8 	cache	0x0,2488(s8)
 430:	bfc009bc 	cache	0x0,2492(s8)
 434:	bfc009c4 	cache	0x0,2500(s8)
	...
 440:	bfc00914 	cache	0x0,2324(s8)
 444:	bfc00990 	cache	0x0,2448(s8)
 448:	bfc009b4 	cache	0x0,2484(s8)
 44c:	bfc009b8 	cache	0x0,2488(s8)
 450:	bfc009bc 	cache	0x0,2492(s8)
 454:	bfc009c4 	cache	0x0,2500(s8)
	...
 460:	bfc00920 	cache	0x0,2336(s8)
 464:	bfc00990 	cache	0x0,2448(s8)
 468:	bfc009b4 	cache	0x0,2484(s8)
 46c:	bfc009b8 	cache	0x0,2488(s8)
 470:	bfc009bc 	cache	0x0,2492(s8)
 474:	bfc009c4 	cache	0x0,2500(s8)
	...
 480:	bfc0092c 	cache	0x0,2348(s8)
 484:	bfc00990 	cache	0x0,2448(s8)
 488:	bfc009b4 	cache	0x0,2484(s8)
 48c:	bfc009b8 	cache	0x0,2488(s8)
 490:	bfc009bc 	cache	0x0,2492(s8)
 494:	bfc009c4 	cache	0x0,2500(s8)
	...
 4a0:	bfc00938 	cache	0x0,2360(s8)
 4a4:	bfc00990 	cache	0x0,2448(s8)
 4a8:	bfc009b4 	cache	0x0,2484(s8)
 4ac:	bfc009b8 	cache	0x0,2488(s8)
 4b0:	bfc009bc 	cache	0x0,2492(s8)
 4b4:	bfc009c4 	cache	0x0,2500(s8)
	...
 4c0:	bfc00944 	cache	0x0,2372(s8)
 4c4:	bfc00990 	cache	0x0,2448(s8)
 4c8:	bfc009b4 	cache	0x0,2484(s8)
 4cc:	bfc009b8 	cache	0x0,2488(s8)
 4d0:	bfc009bc 	cache	0x0,2492(s8)
 4d4:	bfc009c4 	cache	0x0,2500(s8)
	...
 4e0:	bfc00950 	cache	0x0,2384(s8)
 4e4:	bfc00990 	cache	0x0,2448(s8)
 4e8:	bfc009b4 	cache	0x0,2484(s8)
 4ec:	bfc009b8 	cache	0x0,2488(s8)
 4f0:	bfc009bc 	cache	0x0,2492(s8)
 4f4:	bfc009c4 	cache	0x0,2500(s8)
	...
 500:	bfc00958 	cache	0x0,2392(s8)
 504:	bfc00990 	cache	0x0,2448(s8)
 508:	bfc009b4 	cache	0x0,2484(s8)
 50c:	bfc009b8 	cache	0x0,2488(s8)
 510:	bfc009bc 	cache	0x0,2492(s8)
 514:	bfc009c4 	cache	0x0,2500(s8)
	...
 520:	bfc00960 	cache	0x0,2400(s8)
 524:	bfc00990 	cache	0x0,2448(s8)
 528:	bfc009b4 	cache	0x0,2484(s8)
 52c:	bfc009b8 	cache	0x0,2488(s8)
 530:	bfc009bc 	cache	0x0,2492(s8)
 534:	bfc009c4 	cache	0x0,2500(s8)
	...
 540:	bfc00968 	cache	0x0,2408(s8)
 544:	bfc00990 	cache	0x0,2448(s8)
 548:	bfc009b4 	cache	0x0,2484(s8)
 54c:	bfc009b8 	cache	0x0,2488(s8)
 550:	bfc009bc 	cache	0x0,2492(s8)
 554:	bfc009c4 	cache	0x0,2500(s8)
	...
 560:	bfc00970 	cache	0x0,2416(s8)
 564:	bfc00990 	cache	0x0,2448(s8)
 568:	bfc009b4 	cache	0x0,2484(s8)
 56c:	bfc009b8 	cache	0x0,2488(s8)
 570:	bfc009bc 	cache	0x0,2492(s8)
 574:	bfc009c4 	cache	0x0,2500(s8)
	...
 580:	bfc00978 	cache	0x0,2424(s8)
 584:	bfc00990 	cache	0x0,2448(s8)
 588:	bfc009b4 	cache	0x0,2484(s8)
 58c:	bfc009b8 	cache	0x0,2488(s8)
 590:	bfc009bc 	cache	0x0,2492(s8)
 594:	bfc009c4 	cache	0x0,2500(s8)
	...
 5a0:	bfc00980 	cache	0x0,2432(s8)
 5a4:	bfc00990 	cache	0x0,2448(s8)
 5a8:	bfc009b4 	cache	0x0,2484(s8)
 5ac:	bfc009b8 	cache	0x0,2488(s8)
 5b0:	bfc009bc 	cache	0x0,2492(s8)
 5b4:	bfc009c4 	cache	0x0,2500(s8)
	...
 5c0:	bfc00988 	cache	0x0,2440(s8)
 5c4:	bfc00990 	cache	0x0,2448(s8)
 5c8:	bfc009b4 	cache	0x0,2484(s8)
 5cc:	bfc009b8 	cache	0x0,2488(s8)
 5d0:	bfc009bc 	cache	0x0,2492(s8)
 5d4:	bfc009c4 	cache	0x0,2500(s8)
	...
 5e0:	bfc009b4 	cache	0x0,2484(s8)
 5e4:	bfc009b8 	cache	0x0,2488(s8)
 5e8:	bfc009bc 	cache	0x0,2492(s8)
 5ec:	bfc009c4 	cache	0x0,2500(s8)
	...
 5f8:	bfc00a98 	cache	0x0,2712(s8)
 5fc:	bfc00a9c 	cache	0x0,2716(s8)
 600:	bfc00aa0 	cache	0x0,2720(s8)
 604:	bfc00aa4 	cache	0x0,2724(s8)
 608:	bfc00aa8 	cache	0x0,2728(s8)
 60c:	bfc00ab0 	cache	0x0,2736(s8)
	...
 618:	bfc00450 	cache	0x0,1104(s8)
 61c:	bfc00478 	cache	0x0,1144(s8)
 620:	bfc00478 	cache	0x0,1144(s8)
 624:	bfc004b0 	cache	0x0,1200(s8)
 628:	bfc004b0 	cache	0x0,1200(s8)
 62c:	bfc00510 	cache	0x0,1296(s8)
 630:	bfc00510 	cache	0x0,1296(s8)
 634:	bfc00580 	cache	0x0,1408(s8)
 638:	bfc00580 	cache	0x0,1408(s8)
 63c:	bfc00648 	cache	0x0,1608(s8)
 640:	bfc00648 	cache	0x0,1608(s8)
 644:	bfc00714 	cache	0x0,1812(s8)
 648:	bfc00714 	cache	0x0,1812(s8)
 64c:	bfc007dc 	cache	0x0,2012(s8)
 650:	bfc007dc 	cache	0x0,2012(s8)
 654:	bfc009c4 	cache	0x0,2500(s8)
 658:	bfc009c4 	cache	0x0,2500(s8)
 65c:	bfc00a98 	cache	0x0,2712(s8)
 660:	bfc00a98 	cache	0x0,2712(s8)
 664:	bfc00ba4 	cache	0x0,2980(s8)
	...
 670:	bfc00c74 	cache	0x0,3188(s8)
 674:	bfc00c78 	cache	0x0,3192(s8)
 678:	bfc00c94 	cache	0x0,3220(s8)
 67c:	bfc00cbc 	cache	0x0,3260(s8)
	...
 688:	bfc00d0c 	cache	0x0,3340(s8)
 68c:	bfc00d10 	cache	0x0,3344(s8)
 690:	bfc00d20 	cache	0x0,3360(s8)
 694:	bfc00d58 	cache	0x0,3416(s8)
	...
 6a0:	bfc00d0c 	cache	0x0,3340(s8)
 6a4:	bfc00d10 	cache	0x0,3344(s8)
 6a8:	bfc00d20 	cache	0x0,3360(s8)
 6ac:	bfc00d24 	cache	0x0,3364(s8)
 6b0:	bfc00d28 	cache	0x0,3368(s8)
 6b4:	bfc00d50 	cache	0x0,3408(s8)
	...
 6c0:	bfc00ba4 	cache	0x0,2980(s8)
 6c4:	bfc00c6c 	cache	0x0,3180(s8)
 6c8:	00000001 	movf	zero,zero,$fcc0
 6cc:	00000001 	movf	zero,zero,$fcc0
 6d0:	00000001 	movf	zero,zero,$fcc0
 6d4:	00000001 	movf	zero,zero,$fcc0
 6d8:	bfc00c6c 	cache	0x0,3180(s8)
 6dc:	bfc00d04 	cache	0x0,3332(s8)
 6e0:	bfc00d04 	cache	0x0,3332(s8)
 6e4:	bfc00d6c 	cache	0x0,3436(s8)
 6e8:	bfc00d6c 	cache	0x0,3436(s8)
 6ec:	bfc00e20 	cache	0x0,3616(s8)
	...
 6f8:	bfc00e58 	cache	0x0,3672(s8)
 6fc:	bfc00e5c 	cache	0x0,3676(s8)
 700:	bfc00ee0 	cache	0x0,3808(s8)
 704:	bfc00ef0 	cache	0x0,3824(s8)
 708:	bfc0102c 	cache	0x0,4140(s8)
 70c:	bfc0103c 	cache	0x0,4156(s8)
	...
 718:	bfc00edc 	cache	0x0,3804(s8)
 71c:	bfc00ee0 	cache	0x0,3808(s8)
 720:	bfc00f08 	cache	0x0,3848(s8)
 724:	bfc00f10 	cache	0x0,3856(s8)
 728:	bfc00f64 	cache	0x0,3940(s8)
 72c:	bfc00f74 	cache	0x0,3956(s8)
 730:	bfc00f80 	cache	0x0,3968(s8)
 734:	bfc00f90 	cache	0x0,3984(s8)
 738:	bfc00f98 	cache	0x0,3992(s8)
 73c:	bfc00fd4 	cache	0x0,4052(s8)
 740:	bfc00fdc 	cache	0x0,4060(s8)
 744:	bfc00fe0 	cache	0x0,4064(s8)
 748:	bfc00fe8 	cache	0x0,4072(s8)
 74c:	bfc00ff0 	cache	0x0,4080(s8)
 750:	bfc00ff8 	cache	0x0,4088(s8)
 754:	bfc00ffc 	cache	0x0,4092(s8)
 758:	bfc01000 	cache	0x0,4096(s8)
 75c:	bfc01024 	cache	0x0,4132(s8)
	...
 768:	bfc00e20 	cache	0x0,3616(s8)
 76c:	bfc01044 	cache	0x0,4164(s8)
	...
 778:	bfc01044 	cache	0x0,4164(s8)
 77c:	bfc0111c 	cache	0x0,4380(s8)
	...
 788:	00000001 	movf	zero,zero,$fcc0
 78c:	00000001 	movf	zero,zero,$fcc0
 790:	00000001 	movf	zero,zero,$fcc0
 794:	00000001 	movf	zero,zero,$fcc0
 798:	00000001 	movf	zero,zero,$fcc0
 79c:	00000001 	movf	zero,zero,$fcc0
 7a0:	00000001 	movf	zero,zero,$fcc0
 7a4:	00000001 	movf	zero,zero,$fcc0
 7a8:	00000001 	movf	zero,zero,$fcc0
 7ac:	00000001 	movf	zero,zero,$fcc0
 7b0:	00000001 	movf	zero,zero,$fcc0
 7b4:	00000001 	movf	zero,zero,$fcc0
 7b8:	00000001 	movf	zero,zero,$fcc0
 7bc:	00000001 	movf	zero,zero,$fcc0
 7c0:	00000001 	movf	zero,zero,$fcc0
 7c4:	00000001 	movf	zero,zero,$fcc0
 7c8:	bfc0111c 	cache	0x0,4380(s8)
 7cc:	bfc01140 	cache	0x0,4416(s8)
 7d0:	00000001 	movf	zero,zero,$fcc0
 7d4:	00000001 	movf	zero,zero,$fcc0
 7d8:	00000001 	movf	zero,zero,$fcc0
 7dc:	00000001 	movf	zero,zero,$fcc0
 7e0:	00000001 	movf	zero,zero,$fcc0
 7e4:	00000001 	movf	zero,zero,$fcc0
 7e8:	00000001 	movf	zero,zero,$fcc0
 7ec:	00000001 	movf	zero,zero,$fcc0
	...
 7f8:	bfc01158 	cache	0x0,4440(s8)
 7fc:	bfc0115c 	cache	0x0,4444(s8)
 800:	bfc01180 	cache	0x0,4480(s8)
 804:	bfc01198 	cache	0x0,4504(s8)
	...
 810:	bfc01140 	cache	0x0,4416(s8)
 814:	bfc011a0 	cache	0x0,4512(s8)
 818:	bfc011a0 	cache	0x0,4512(s8)
 81c:	bfc011d0 	cache	0x0,4560(s8)
	...
 828:	bfc011d0 	cache	0x0,4560(s8)
 82c:	bfc011fc 	cache	0x0,4604(s8)
	...
 838:	bfc01218 	cache	0x0,4632(s8)
 83c:	bfc0121c 	cache	0x0,4636(s8)
 840:	bfc01220 	cache	0x0,4640(s8)
 844:	bfc01224 	cache	0x0,4644(s8)
	...
 850:	00000001 	movf	zero,zero,$fcc0
 854:	00000001 	movf	zero,zero,$fcc0
 858:	00000001 	movf	zero,zero,$fcc0
 85c:	00000001 	movf	zero,zero,$fcc0
 860:	00000001 	movf	zero,zero,$fcc0
 864:	00000001 	movf	zero,zero,$fcc0
 868:	00000001 	movf	zero,zero,$fcc0
 86c:	00000001 	movf	zero,zero,$fcc0
 870:	00000001 	movf	zero,zero,$fcc0
 874:	00000001 	movf	zero,zero,$fcc0
 878:	00000001 	movf	zero,zero,$fcc0
 87c:	00000001 	movf	zero,zero,$fcc0
 880:	00000001 	movf	zero,zero,$fcc0
 884:	00000001 	movf	zero,zero,$fcc0
 888:	00000001 	movf	zero,zero,$fcc0
 88c:	00000001 	movf	zero,zero,$fcc0
 890:	bfc011fc 	cache	0x0,4604(s8)
 894:	bfc01234 	cache	0x0,4660(s8)
 898:	00000001 	movf	zero,zero,$fcc0
 89c:	00000001 	movf	zero,zero,$fcc0
 8a0:	bfc01234 	cache	0x0,4660(s8)
 8a4:	bfc01254 	cache	0x0,4692(s8)
 8a8:	00000001 	movf	zero,zero,$fcc0
 8ac:	00000001 	movf	zero,zero,$fcc0
 8b0:	bfc01254 	cache	0x0,4692(s8)
 8b4:	bfc01268 	cache	0x0,4712(s8)
 8b8:	bfc01268 	cache	0x0,4712(s8)
 8bc:	bfc0127c 	cache	0x0,4732(s8)
 8c0:	00000001 	movf	zero,zero,$fcc0
 8c4:	00000001 	movf	zero,zero,$fcc0
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	00000286 	0x286
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	00400002 	0x400002
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
  34:	65740000 	0x65740000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	6d5f7473 	0x6d5f7473
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	726f6d65 	0x726f6d65
  40:	70632e79 	0x70632e79
  44:	00000070 	tge	zero,zero,0x1
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	05000000 	bltz	t0,4c <_mem_avail_start-0x7fffffb4>
  4c:	c0045002 	ll	a0,20482(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	011303bf 	0x11303bf
  54:	003d0814 	0x3d0814
  58:	06010402 	bgez	s0,1064 <_mem_avail_start-0x7fffef9c>
  5c:	024b0682 	0x24b0682
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	01010008 	0x1010008
  64:	78020500 	0x78020500
  68:	03bfc004 	sllv	t8,ra,sp
  6c:	030100f3 	tltu	t8,at,0x3
  70:	0e038275 	jal	80e09d4 <_mem_avail_start-0x77f1f62c>
  74:	7903e408 	0x7903e408
  78:	000c024a 	0xc024a
  7c:	05000101 	bltz	t0,484 <_mem_avail_start-0x7ffffb7c>
  80:	c004b002 	ll	a0,-20478(zero)
  84:	00f303bf 	0xf303bf
  88:	82750301 	lb	s5,769(s3)
  8c:	48020e03 	0x48020e03
  90:	4a790301 	c2	0x790301
  94:	01000c02 	0x1000c02
  98:	02050001 	movt	zero,s0,$fcc1
  9c:	bfc00510 	cache	0x0,1296(s8)
  a0:	bb013503 	swr	at,13571(t8)
  a4:	bb838349 	swr	v1,-31927(gp)
  a8:	0200834c 	syscall	0x8020d
  ac:	ba060104 	swr	a2,260(s0)
  b0:	04040200 	0x4040200
  b4:	02004b06 	0x2004b06
  b8:	887e0404 	lwl	s8,1028(v1)
  bc:	01001802 	0x1001802
  c0:	00020401 	0x20401
  c4:	05800205 	bltz	t4,8dc <_mem_avail_start-0x7ffff724>
  c8:	461abfc0 	add.s	$f31,$f23,$f26
  cc:	7603c04e 	jalx	80f0138 <_mem_avail_start-0x77f0fec8>
  d0:	820b034a 	lb	t3,842(s0)
  d4:	02040200 	0x2040200
  d8:	004a7503 	0x4a7503
  dc:	03020402 	0x3020402
  e0:	003c080c 	syscall	0xf020
  e4:	49020402 	bc2fl	10f0 <_mem_avail_start-0x7fffef10>
  e8:	03827503 	0x3827503
  ec:	034b4a0e 	0x34b4a0e
  f0:	0f038271 	jal	c0e09c4 <_mem_avail_start-0x73f1f63c>
  f4:	4a710382 	c2	0x710382
  f8:	3c081003 	lui	t0,0x1003
  fc:	034a7003 	0x34a7003
 100:	01044a10 	0x1044a10
 104:	8200ea03 	lb	zero,-5629(s0)
 108:	99030204 	lwr	v1,516(t0)
 10c:	0104827f 	0x104827f
 110:	8200d103 	lb	zero,-12029(s0)
 114:	b3030204 	0xb3030204
 118:	0104827f 	0x104827f
 11c:	8200d403 	lb	zero,-11261(s0)
 120:	02000204 	0x2000204
 124:	a4030204 	sh	v1,516(zero)
 128:	028aba7f 	0x28aba7f
 12c:	01010010 	0x1010010
 130:	05000204 	bltz	t0,944 <_mem_avail_start-0x7ffff6bc>
 134:	c0064802 	ll	a2,18434(zero)
 138:	4e461abf 	c3	0x461abf
 13c:	4a7603c0 	c2	0x7603c0
 140:	03820b03 	0x3820b03
 144:	0c034a75 	jal	d29d4 <_mem_avail_start-0x7ff2d62c>
 148:	03813c08 	0x3813c08
 14c:	0e038275 	jal	80e09d4 <_mem_avail_start-0x77f1f62c>
 150:	71034b4a 	0x71034b4a
 154:	820f0382 	lb	t7,898(s0)
 158:	034a7103 	0x34a7103
 15c:	033c0810 	0x33c0810
 160:	10034a70 	beq	zero,v1,12b24 <_mem_avail_start-0x7ffed4dc>
 164:	0301044a 	0x301044a
 168:	04ba00ea 	0x4ba00ea
 16c:	7f990302 	0x7f990302
 170:	03010482 	0x3010482
 174:	048200d1 	bltzl	a0,4bc <_mem_avail_start-0x7ffffb44>
 178:	7fb30302 	0x7fb30302
 17c:	03010482 	0x3010482
 180:	048200d4 	bltzl	a0,4d4 <_mem_avail_start-0x7ffffb2c>
 184:	04020002 	bltzl	zero,190 <_mem_avail_start-0x7ffffe70>
 188:	7fa40302 	0x7fa40302
 18c:	0c028aba 	jal	a2ae8 <_mem_avail_start-0x7ff5d518>
 190:	04010100 	b	594 <_mem_avail_start-0x7ffffa6c>
 194:	02050002 	0x2050002
 198:	bfc00714 	cache	0x0,1812(s8)
 19c:	c04e461a 	ll	t6,17946(v0)
 1a0:	034a7603 	0x34a7603
 1a4:	7503820b 	jalx	40e082c <_mem_avail_start-0x7bf1f7d4>
 1a8:	080c034a 	j	300d28 <_mem_avail_start-0x7fcff2d8>
 1ac:	7503813c 	jalx	40e04f0 <_mem_avail_start-0x7bf1fb10>
 1b0:	4a0e0382 	c2	0xe0382
 1b4:	8271034b 	lb	s1,843(s3)
 1b8:	03820f03 	0x3820f03
 1bc:	10034a71 	beq	zero,v1,12b84 <_mem_avail_start-0x7ffed47c>
 1c0:	4a7003f2 	c2	0x7003f2
 1c4:	044a1003 	tlti	v0,4099
 1c8:	00ea0301 	0xea0301
 1cc:	030204ba 	0x30204ba
 1d0:	04827f99 	bltzl	a0,20038 <_mem_avail_start-0x7ffdffc8>
 1d4:	00d10301 	0xd10301
 1d8:	03020482 	0x3020482
 1dc:	04827fb3 	bltzl	a0,200ac <_mem_avail_start-0x7ffdff54>
 1e0:	00d40301 	0xd40301
 1e4:	00020482 	srl	zero,v0,0x12
 1e8:	03020402 	0x3020402
 1ec:	8aba7fa4 	lwl	k0,32676(s5)
 1f0:	01000c02 	0x1000c02
 1f4:	02050001 	movt	zero,s0,$fcc1
 1f8:	bfc007dc 	cache	0x0,2012(s8)
 1fc:	0100e603 	0x100e603
 200:	02125402 	0x2125402
 204:	fc021464 	sdc3	$2,5220(zero)
 208:	24021401 	li	v0,5121
 20c:	024f4517 	0x24f4517
 210:	01010008 	0x1010008
 214:	c4020500 	lwc1	$f2,1280(zero)
 218:	03bfc009 	0x3bfc009
 21c:	bc0100f3 	cache	0x1,243(zero)
 220:	1301bc02 	beq	t8,at,fffef22c <_text_end+0x403eda94>
 224:	01000c02 	0x1000c02
 228:	00020401 	0x20401
 22c:	0a980205 	j	a600814 <_mem_avail_start-0x759ff7ec>
 230:	1e03bfc0 	0x1e03bfc0
 234:	03010401 	0x3010401
 238:	040100e0 	b	5bc <_mem_avail_start-0x7ffffa44>
 23c:	7fa00302 	0x7fa00302
 240:	0301044a 	0x301044a
 244:	044a00e0 	tlti	v0,224
 248:	7fa00302 	0x7fa00302
 24c:	0301044a 	0x301044a
 250:	044a00e0 	tlti	v0,224
 254:	7fa20302 	0x7fa20302
 258:	03010482 	0x3010482
 25c:	038200de 	0x38200de
 260:	0483826a 	bgezl	a0,fffe0c0c <_text_end+0x403df474>
 264:	7fba0302 	0x7fba0302
 268:	01019c02 	0x1019c02
 26c:	db030104 	ldc2	$3,260(t8)
 270:	02048200 	0x2048200
 274:	087fa803 	j	1fea00c <_mem_avail_start-0x7e015ff4>
 278:	03010474 	teq	t8,at,0x11
 27c:	048200d8 	bltzl	a0,5e0 <_mem_avail_start-0x7ffffa20>
 280:	7fac0302 	0x7fac0302
 284:	00100282 	srl	zero,s0,0xa
 288:	00930101 	0x930101
 28c:	00020000 	sll	zero,v0,0x0
 290:	00000028 	0x28
 294:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 298:	0101000d 	break	0x101
 29c:	00000101 	0x101
 2a0:	00000100 	sll	zero,zero,0x4
 2a4:	69747501 	0x69747501
 2a8:	7974696c 	0x7974696c
 2ac:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 2b0:	75747261 	jalx	5d1c984 <_mem_avail_start-0x7a2e367c>
 2b4:	00532e70 	tge	v0,s3,0xb9
 2b8:	00000001 	movf	zero,zero,$fcc0
 2bc:	00020500 	sll	zero,v0,0x14
 2c0:	19bfc000 	0x19bfc000
 2c4:	0a034b83 	j	80d2e0c <_mem_avail_start-0x77f2d1f4>
 2c8:	834d4b4a 	lb	t5,19274(k0)
 2cc:	4b4d4b85 	c2	0x14d4b85
 2d0:	4b834c4d 	c2	0x1834c4d
 2d4:	4b4b4d83 	c2	0x14b4d83
 2d8:	834d4b4b 	lb	t5,19275(k0)
 2dc:	024b4b4b 	0x24b4b4b
 2e0:	4b180284 	c2	0x1180284
 2e4:	fc020b03 	sdc3	$2,2819(zero)
 2e8:	4b4c0103 	c2	0x14c0103
 2ec:	4b4b4d83 	c2	0x14b4d83
 2f0:	4b4b4b4b 	c2	0x14b4b4b
 2f4:	4b4b4b4b 	c2	0x14b4b4b
 2f8:	4b4b4b4b 	c2	0x14b4b4b
 2fc:	4b4b4b4b 	c2	0x14b4b4b
 300:	4b4b4b4b 	c2	0x14b4b4b
 304:	4b4b4b4b 	c2	0x14b4b4b
 308:	4b4b4b4b 	c2	0x14b4b4b
 30c:	4b4b4b4c 	c2	0x14b4b4c
 310:	4b4b4b4b 	c2	0x14b4b4b
 314:	4b4c4b4b 	c2	0x14c4b4b
 318:	4b4b4b4c 	c2	0x14b4b4c
 31c:	01000402 	0x1000402
 320:	00015901 	0x15901
 324:	87000200 	lh	zero,512(t8)
 328:	01000000 	0x1000000
 32c:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 330:	01010100 	0x1010100
 334:	00000001 	movf	zero,zero,$fcc0
 338:	01000001 	movf	zero,t0,$fcc0
 33c:	6c697475 	0x6c697475
 340:	00797469 	0x797469
 344:	6c636e69 	0x6c636e69
 348:	00656475 	0x656475
 34c:	69616d00 	0x69616d00
 350:	00632e6e 	0x632e6e
 354:	63000001 	0x63000001
 358:	6f6d6d6f 	0x6f6d6d6f
 35c:	00682e6e 	0x682e6e
 360:	73000002 	mul	zero,t8,zero
 364:	6e696474 	0x6e696474
 368:	00682e74 	teq	v1,t0,0xb9
 36c:	6d000002 	0x6d000002
 370:	69686361 	0x69686361
 374:	682e656e 	0x682e656e
 378:	00000200 	sll	zero,zero,0x8
 37c:	65637865 	0x65637865
 380:	6f697470 	0x6f697470
 384:	00682e6e 	0x682e6e
 388:	73000002 	mul	zero,t8,zero
 38c:	6f696474 	0x6f696474
 390:	0200682e 	0x200682e
 394:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 398:	676e6972 	0x676e6972
 39c:	0200682e 	0x200682e
 3a0:	6f620000 	0x6f620000
 3a4:	7473746f 	jalx	1cdd1bc <_mem_avail_start-0x7e322e44>
 3a8:	2e706172 	sltiu	s0,s3,24946
 3ac:	00020068 	0x20068
 3b0:	05000000 	bltz	t0,3b4 <_mem_avail_start-0x7ffffc4c>
 3b4:	c00ba402 	ll	t3,-23550(zero)
 3b8:	010a03bf 	0x10a03bf
 3bc:	c18484bc 	ll	a0,-31556(t4)
 3c0:	4f454f45 	c3	0x1454f45
 3c4:	86478745 	lh	a3,-30907(s2)
 3c8:	85f5f383 	lh	s5,-3197(t7)
 3cc:	b8c18383 	swr	at,-31869(a2)
 3d0:	0802bfb7 	j	afedc <_mem_avail_start-0x7ff50124>
 3d4:	00010100 	sll	zero,at,0x4
 3d8:	00000205 	0x205
 3dc:	2b030000 	slti	v1,t8,0
 3e0:	024f1401 	0x24f1401
 3e4:	01010008 	0x1010008
 3e8:	00020500 	sll	zero,v0,0x14
 3ec:	03000000 	0x3000000
 3f0:	4f140134 	c3	0x1140134
 3f4:	01000802 	0x1000802
 3f8:	02050001 	movt	zero,s0,$fcc1
 3fc:	bfc00c6c 	cache	0x0,3180(s8)
 400:	84013d03 	lh	at,15619(zero)
 404:	833c0848 	lb	gp,2120(t9)
 408:	0200494b 	0x200494b
 40c:	004b0304 	0x4b0304
 410:	08030402 	j	c1008 <_mem_avail_start-0x7ff3eff8>
 414:	2802853b 	slti	v0,zero,-31429
 418:	00200213 	0x200213
 41c:	05000101 	bltz	t0,824 <_mem_avail_start-0x7ffff7dc>
 420:	c00d0402 	ll	t5,1026(zero)
 424:	00c403bf 	0xc403bf
 428:	820c0301 	lb	t4,769(s0)
 42c:	ba4a7403 	swr	t2,29699(s2)
 430:	034a0c03 	0x34a0c03
 434:	02004a75 	0x2004a75
 438:	004c0304 	0x4c0304
 43c:	03030402 	0x3030402
 440:	003c0809 	0x3c0809
 444:	03030402 	0x3030402
 448:	033c0875 	0x33c0875
 44c:	1402820d 	bne	zero,v0,fffe0c84 <_text_end+0x403df4ec>
 450:	00010100 	sll	zero,at,0x4
 454:	0d6c0205 	jal	5b00814 <_mem_avail_start-0x7a4ff7ec>
 458:	d403bfc0 	ldc1	$f3,-16448(zero)
 45c:	49bb0100 	0x49bb0100
 460:	834b494b 	lb	t3,18763(k0)
 464:	83c1bb83 	lb	at,-17533(s8)
 468:	5503b984 	bnel	t0,v1,fffeea7c <_text_end+0x403ed2e4>
 46c:	4a2403f2 	c2	0x2403f2
 470:	08510384 	j	1440e10 <_mem_avail_start-0x7ebbf1f0>
 474:	4a2f0374 	c2	0x2f0374
 478:	001002bb 	0x1002bb
 47c:	00aa0101 	0xaa0101
 480:	00020000 	sll	zero,v0,0x0
 484:	0000001f 	0x1f
 488:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 48c:	0101000d 	break	0x101
 490:	00000101 	0x101
 494:	00000100 	sll	zero,zero,0x4
 498:	72700001 	maddu	s3,s0
 49c:	66746e69 	0x66746e69
 4a0:	0000632e 	0x632e
 4a4:	00000000 	nop
 4a8:	0e200205 	jal	8800814 <_mem_avail_start-0x777ff7ec>
 4ac:	8813bfc0 	lwl	s3,-16448(zero)
 4b0:	084a7a03 	j	129e80c <_mem_avail_start-0x7ed617f4>
 4b4:	034cf83c 	0x34cf83c
 4b8:	004a00c5 	0x4a00c5
 4bc:	03010402 	0x3010402
 4c0:	034a7fbb 	0x34a7fbb
 4c4:	03f200cb 	0x3f200cb
 4c8:	24027fb8 	li	v0,32696
 4cc:	38038601 	xori	v1,zero,0x8601
 4d0:	52014402 	beql	s0,at,114dc <_mem_avail_start-0x7ffeeb24>
 4d4:	08f24003 	j	3c9000c <_mem_avail_start-0x7c36fff4>
 4d8:	7703837c 	jalx	c0e0df0 <_mem_avail_start-0x73f1f210>
 4dc:	021c0382 	0x21c0382
 4e0:	64030128 	0x64030128
 4e4:	88af0882 	lwl	t7,2178(a1)
 4e8:	0402004b 	bltzl	zero,618 <_mem_avail_start-0x7ffff9e8>
 4ec:	4a6f0302 	c2	0x6f0302
 4f0:	03ba1403 	0x3ba1403
 4f4:	68038214 	0x68038214
 4f8:	82090382 	lb	t1,898(s0)
 4fc:	bd821503 	cache	0x2,5379(t4)
 500:	f3826d03 	0xf3826d03
 504:	bfc0894c 	cache	0x0,-30388(s8)
 508:	03825e03 	0x3825e03
 50c:	02008226 	0x2008226
 510:	4e030104 	c3	0x30104
 514:	0402004a 	bltzl	zero,640 <_mem_avail_start-0x7ffff9c0>
 518:	4a340301 	c2	0x340301
 51c:	03040200 	0x3040200
 520:	0b03ad08 	j	c0eb420 <_mem_avail_start-0x73f14be0>
 524:	028383f2 	tlt	s4,v1,0x20f
 528:	01010008 	0x1010008
 52c:	00000076 	tne	zero,zero,0x1
 530:	00220002 	ror	zero,v0,0x0
 534:	01010000 	0x1010000
 538:	000d0efb 	0xd0efb
 53c:	01010101 	0x1010101
 540:	01000000 	0x1000000
 544:	00010000 	sll	zero,at,0x0
 548:	6e697270 	0x6e697270
 54c:	73616274 	0x73616274
 550:	00632e65 	0x632e65
 554:	00000000 	nop
 558:	44020500 	0x44020500
 55c:	13bfc010 	beq	sp,ra,ffff05a0 <_text_end+0x403eee08>
 560:	004fac08 	0x4fac08
 564:	06010402 	bgez	s0,1570 <_mem_avail_start-0x7fffea90>
 568:	4b840682 	c2	0x1840682
 56c:	01040200 	0x1040200
 570:	00ba7803 	0xba7803
 574:	03010402 	0x3010402
 578:	008a4a0c 	syscall	0x22928
 57c:	06020402 	bltzl	s0,1588 <_mem_avail_start-0x7fffea78>
 580:	038806ba 	0x38806ba
 584:	01240270 	tge	t1,a0,0x9
 588:	03040200 	0x3040200
 58c:	008ab008 	0x8ab008
 590:	06010402 	bgez	s0,159c <_mem_avail_start-0x7fffea64>
 594:	04020082 	bltzl	zero,7a0 <_mem_avail_start-0x7ffff860>
 598:	00830601 	0x830601
 59c:	06040402 	0x6040402
 5a0:	001002f2 	tlt	zero,s0,0xb
 5a4:	01790101 	0x1790101
 5a8:	00020000 	sll	zero,v0,0x0
 5ac:	00000036 	tne	zero,zero
 5b0:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 5b4:	0101000d 	break	0x101
 5b8:	00000101 	0x101
 5bc:	00000100 	sll	zero,zero,0x4
 5c0:	2f2e2e01 	sltiu	t6,t9,11777
 5c4:	6c636e69 	0x6c636e69
 5c8:	00656475 	0x656475
 5cc:	72747300 	0x72747300
 5d0:	2e676e69 	sltiu	a3,s3,28265
 5d4:	00000063 	0x63
 5d8:	6d6f6300 	0x6d6f6300
 5dc:	2e6e6f6d 	sltiu	t6,s3,28525
 5e0:	00010068 	0x10068
 5e4:	05000000 	bltz	t0,5e8 <_mem_avail_start-0x7ffffa18>
 5e8:	00000002 	srl	zero,zero,0x0
 5ec:	010b0300 	0x10b0300
 5f0:	02780814 	0x2780814
 5f4:	01010008 	0x1010008
 5f8:	00020500 	sll	zero,v0,0x14
 5fc:	03000000 	0x3000000
 600:	4b130121 	c2	0x1130121
 604:	01040200 	0x1040200
 608:	be068206 	cache	0x6,-32250(s0)
 60c:	0008027f 	0x8027f
 610:	05000101 	bltz	t0,a18 <_mem_avail_start-0x7ffff5e8>
 614:	00000002 	srl	zero,zero,0x0
 618:	01360300 	0x1360300
 61c:	02004e01 	0x2004e01
 620:	084b0104 	j	12c0410 <_mem_avail_start-0x7ed3fbf0>
 624:	00080240 	sll	zero,t0,0x9
 628:	05000101 	bltz	t0,a30 <_mem_avail_start-0x7ffff5d0>
 62c:	00000002 	srl	zero,zero,0x0
 630:	00cc0300 	0xcc0300
 634:	4b830101 	c2	0x1830101
 638:	827a0389 	lb	k0,905(s3)
 63c:	08024cbb 	j	932ec <_mem_avail_start-0x7ff6cd14>
 640:	00010100 	sll	zero,at,0x4
 644:	00000205 	0x205
 648:	e7030000 	swc1	$f3,0(t8)
 64c:	00160100 	sll	zero,s6,0x4
 650:	06010402 	bgez	s0,165c <_mem_avail_start-0x7fffe9a4>
 654:	84bd06ba 	lh	sp,1722(a1)
 658:	0008027e 	0x8027e
 65c:	05000101 	bltz	t0,a64 <_mem_avail_start-0x7ffff59c>
 660:	00000002 	srl	zero,zero,0x0
 664:	00fe0300 	0xfe0300
 668:	02004b01 	0x2004b01
 66c:	82060104 	lb	a2,260(s0)
 670:	02040200 	0x2040200
 674:	83bd06ba 	lb	sp,1722(sp)
 678:	0802847f 	j	a11fc <_mem_avail_start-0x7ff5ee04>
 67c:	00010100 	sll	zero,at,0x4
 680:	00000205 	0x205
 684:	8e030000 	lw	v1,0(s0)
 688:	f8130101 	sdc2	$19,257(zero)
 68c:	827a034b 	lb	k0,843(s3)
 690:	00080285 	0x80285
 694:	05000101 	bltz	t0,a9c <_mem_avail_start-0x7ffff564>
 698:	00000002 	srl	zero,zero,0x0
 69c:	01a20300 	0x1a20300
 6a0:	03f91301 	0x3f91301
 6a4:	0285827a 	0x285827a
 6a8:	01010008 	0x1010008
 6ac:	1c020500 	0x1c020500
 6b0:	03bfc011 	0x3bfc011
 6b4:	01010290 	0x1010290
 6b8:	7e874b86 	0x7e874b86
 6bc:	01000802 	0x1000802
 6c0:	02050001 	movt	zero,s0,$fcc1
 6c4:	00000000 	nop
 6c8:	0102ab03 	0x102ab03
 6cc:	874b8701 	lh	t3,-30975(k0)
 6d0:	0010027e 	0x10027e
 6d4:	05000101 	bltz	t0,adc <_mem_avail_start-0x7ffff524>
 6d8:	00000002 	srl	zero,zero,0x0
 6dc:	02c20300 	0x2c20300
 6e0:	7a031801 	0x7a031801
 6e4:	4e84504a 	c3	0x84504a
 6e8:	04020088 	bltzl	zero,90c <_mem_avail_start-0x7ffff6f4>
 6ec:	82740301 	lb	s4,769(s3)
 6f0:	3d0883f3 	0x3d0883f3
 6f4:	001002f6 	tne	zero,s0,0xb
 6f8:	05000101 	bltz	t0,b00 <_mem_avail_start-0x7ffff500>
 6fc:	00000002 	srl	zero,zero,0x0
 700:	02e50300 	0x2e50300
 704:	03894d01 	0x3894d01
 708:	3d08827a 	0x3d08827a
 70c:	000802f4 	teq	zero,t0,0xb
 710:	05000101 	bltz	t0,b18 <_mem_avail_start-0x7ffff4e8>
 714:	00000002 	srl	zero,zero,0x0
 718:	02f10300 	0x2f10300
 71c:	0c021301 	jal	84c04 <_mem_avail_start-0x7ff7b3fc>
 720:	4f010100 	c3	0x1010100
 724:	02000000 	0x2000000
 728:	00001d00 	sll	v1,zero,0x14
 72c:	fb010100 	sdc2	$1,256(t8)
 730:	01000d0e 	0x1000d0e
 734:	00010101 	0x10101
 738:	00010000 	sll	zero,at,0x0
 73c:	70000100 	0x70000100
 740:	2e737475 	sltiu	s3,s3,29813
 744:	00000063 	0x63
 748:	05000000 	bltz	t0,74c <_mem_avail_start-0x7ffff8b4>
 74c:	c0114002 	ll	s1,16386(zero)
 750:	3c0813bf 	lui	t0,0x13bf
 754:	03c2484e 	0x3c2484e
 758:	8374087a 	lb	s4,2170(k1)
 75c:	08028383 	j	a0e0c <_mem_avail_start-0x7ff5f1f4>
 760:	00010100 	sll	zero,at,0x4
 764:	11a00205 	beqz	t5,f7c <_mem_avail_start-0x7ffff084>
 768:	0e03bfc0 	jal	80eff00 <_mem_avail_start-0x77f10100>
 76c:	83838301 	lb	v1,-31999(gp)
 770:	00100284 	0x100284
 774:	00590101 	0x590101
 778:	00020000 	sll	zero,v0,0x0
 77c:	00000044 	0x44
 780:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 784:	0101000d 	break	0x101
 788:	00000101 	0x101
 78c:	00000100 	sll	zero,zero,0x4
 790:	2f2e2e01 	sltiu	t6,t9,11777
 794:	6c636e69 	0x6c636e69
 798:	00656475 	0x656475
 79c:	74757000 	jalx	1d5c000 <_mem_avail_start-0x7e2a4000>
 7a0:	72616863 	0x72616863
 7a4:	0000632e 	0x632e
 7a8:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 7ac:	746e6964 	jalx	1b9a590 <_mem_avail_start-0x7e465a70>
 7b0:	0100682e 	0x100682e
 7b4:	616d0000 	0x616d0000
 7b8:	6e696863 	0x6e696863
 7bc:	00682e65 	0x682e65
 7c0:	00000001 	movf	zero,zero,$fcc0
 7c4:	d0020500 	0xd0020500
 7c8:	15bfc011 	bne	t5,ra,ffff0810 <_text_end+0x403ef078>
 7cc:	140284f3 	bne	zero,v0,fffe1b9c <_text_end+0x403e0404>
 7d0:	a9010100 	swl	at,256(t0)
 7d4:	02000001 	movf	zero,s0,$fcc0
 7d8:	00005200 	sll	t2,zero,0x8
 7dc:	fb010100 	sdc2	$1,256(t8)
 7e0:	01000d0e 	0x1000d0e
 7e4:	00010101 	0x10101
 7e8:	00010000 	sll	zero,at,0x0
 7ec:	2e2e0100 	sltiu	t6,s1,256
 7f0:	636e692f 	0x636e692f
 7f4:	6564756c 	0x6564756c
 7f8:	616d0000 	0x616d0000
 7fc:	6e696863 	0x6e696863
 800:	70632e65 	0x70632e65
 804:	00000070 	tge	zero,zero,0x1
 808:	6d6f6300 	0x6d6f6300
 80c:	2e6e6f6d 	sltiu	t6,s3,28525
 810:	00010068 	0x10068
 814:	64747300 	0x64747300
 818:	2e746e69 	sltiu	s4,s3,28265
 81c:	00010068 	0x10068
 820:	63616d00 	0x63616d00
 824:	656e6968 	0x656e6968
 828:	0100682e 	0x100682e
 82c:	00000000 	nop
 830:	00000205 	0x205
 834:	1b030000 	0x1b030000
 838:	016a0301 	0x16a0301
 83c:	024a1603 	0x24a1603
 840:	01010008 	0x1010008
 844:	00020500 	sll	zero,v0,0x14
 848:	03000000 	0x3000000
 84c:	6a03011b 	0x6a03011b
 850:	4a160301 	c2	0x160301
 854:	01000802 	0x1000802
 858:	02050001 	movt	zero,s0,$fcc1
 85c:	00000000 	nop
 860:	03011b03 	0x3011b03
 864:	1603016a 	bne	s0,v1,e10 <_mem_avail_start-0x7ffff1f0>
 868:	0008024a 	0x8024a
 86c:	05000101 	bltz	t0,c74 <_mem_avail_start-0x7ffff38c>
 870:	00000002 	srl	zero,zero,0x0
 874:	011b0300 	0x11b0300
 878:	03016a03 	0x3016a03
 87c:	08024a16 	j	92858 <_mem_avail_start-0x7ff6d7a8>
 880:	00010100 	sll	zero,at,0x4
 884:	00000205 	0x205
 888:	1c030000 	0x1c030000
 88c:	016f0301 	0x16f0301
 890:	024a1103 	0x24a1103
 894:	01010008 	0x1010008
 898:	00020500 	sll	zero,v0,0x14
 89c:	03000000 	0x3000000
 8a0:	6f03011c 	0x6f03011c
 8a4:	4a110301 	c2	0x110301
 8a8:	01000802 	0x1000802
 8ac:	02050001 	movt	zero,s0,$fcc1
 8b0:	00000000 	nop
 8b4:	03011c03 	0x3011c03
 8b8:	1103016f 	beq	t0,v1,e78 <_mem_avail_start-0x7ffff188>
 8bc:	0008024a 	0x8024a
 8c0:	05000101 	bltz	t0,cc8 <_mem_avail_start-0x7ffff338>
 8c4:	00000002 	srl	zero,zero,0x0
 8c8:	011c0300 	0x11c0300
 8cc:	03016f03 	0x3016f03
 8d0:	08024a11 	j	92844 <_mem_avail_start-0x7ff6d7bc>
 8d4:	00010100 	sll	zero,at,0x4
 8d8:	11fc0205 	beq	t7,gp,10f0 <_mem_avail_start-0x7fffef10>
 8dc:	1e03bfc0 	0x1e03bfc0
 8e0:	016d0301 	0x16d0301
 8e4:	30022103 	andi	v0,zero,0x2103
 8e8:	00080201 	0x80201
 8ec:	05000101 	bltz	t0,cf4 <_mem_avail_start-0x7ffff30c>
 8f0:	00000002 	srl	zero,zero,0x0
 8f4:	012e0300 	0x12e0300
 8f8:	03015703 	0x3015703
 8fc:	5603822a 	bnel	s0,v1,fffe11a8 <_text_end+0x403dfa10>
 900:	4a2c03ba 	c2	0x2c03ba
 904:	01000802 	0x1000802
 908:	02050001 	movt	zero,s0,$fcc1
 90c:	bfc01234 	cache	0x0,4660(s8)
 910:	03013303 	0x3013303
 914:	2f030152 	sltiu	v1,t8,338
 918:	ba570382 	swr	s7,898(s2)
 91c:	024a2b03 	0x24a2b03
 920:	01010008 	0x1010008
 924:	00020500 	sll	zero,v0,0x14
 928:	03000000 	0x3000000
 92c:	83840138 	lb	a0,312(gp)
 930:	4b4bb983 	c2	0x14bb983
 934:	024c4884 	0x24c4884
 938:	0101000c 	syscall	0x40400
 93c:	54020500 	bnel	zero,v0,1d40 <_mem_avail_start-0x7fffe2c0>
 940:	03bfc012 	0x3bfc012
 944:	030100c1 	0x30100c1
 948:	3803014a 	xori	v1,zero,0x14a
 94c:	000802ba 	0x802ba
 950:	05000101 	bltz	t0,d58 <_mem_avail_start-0x7ffff2a8>
 954:	c0126802 	ll	s2,26626(zero)
 958:	00c503bf 	0xc503bf
 95c:	01460301 	0x1460301
 960:	02ba3c03 	0x2ba3c03
 964:	01010008 	0x1010008
 968:	00020500 	sll	zero,v0,0x14
 96c:	03000000 	0x3000000
 970:	030100c9 	0x30100c9
 974:	03017fbc 	0x3017fbc
 978:	02ba00c6 	0x2ba00c6
 97c:	01010008 	0x1010008

Disassembly of section .debug_str:

00000000 <.debug_str>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
       0:	364e5a5f 	ori	t6,s2,0x5a5f
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	6d695f5f 	0x6d695f5f
       8:	32326c70 	andi	s2,s1,0x6c70
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
       c:	646e6573 	0x646e6573
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	7265735f 	0x7265735f
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	5f6c6169 	0x5f6c6169
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	5f727473 	0x5f727473
      1c:	61706e75 	0x61706e75
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
      20:	4a496b63 	c2	0x496b63
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	63636363 	0x63636363
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	63636363 	0x63636363
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	76454545 	jalx	9151514 <_mem_avail_start-0x76eaeaec>
      30:	54704468 	bnel	v1,s0,111d4 <_mem_avail_start-0x7ffeee2c>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	5a5f005f 	0x5a5f005f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	5f5f364e 	0x5f5f364e
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	6c706d69 	0x6c706d69
      40:	65733232 	0x65733232
      44:	735f646e 	0x735f646e
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
      48:	61697265 	0x61697265
      4c:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	6e755f72 	0x6e755f72
      54:	6b636170 	0x6b636170
      58:	63634a49 	0x63634a49
      5c:	63636363 	0x63636363
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
      60:	63636363 	0x63636363
      64:	45636363 	0x45636363
      68:	68764545 	0x68764545
      6c:	5f547044 	0x5f547044
      70:	6e657300 	0x6e657300
      74:	65735f64 	0x65735f64
      78:	6c616972 	0x6c616972
      7c:	7274735f 	0x7274735f
      80:	706e755f 	0x706e755f
      84:	3c6b6361 	0x3c6b6361
      88:	72616863 	0x72616863
      8c:	6863202c 	0x6863202c
      90:	202c7261 	addi	t4,at,29281
      94:	72616863 	0x72616863
      98:	6863202c 	0x6863202c
      9c:	202c7261 	addi	t4,at,29281
      a0:	72616863 	0x72616863
      a4:	6863202c 	0x6863202c
      a8:	202c7261 	addi	t4,at,29281
      ac:	72616863 	0x72616863
      b0:	6863202c 	0x6863202c
      b4:	202c7261 	addi	t4,at,29281
      b8:	72616863 	0x72616863
      bc:	6863202c 	0x6863202c
      c0:	003e7261 	0x3e7261
      c4:	35315a5f 	ori	s1,t1,0x5a5f
      c8:	646e6573 	0x646e6573
      cc:	7265735f 	0x7265735f
      d0:	5f6c6169 	0x5f6c6169
      d4:	49727473 	0x49727473
      d8:	45326a4c 	0x45326a4c
      dc:	41527645 	0x41527645
      e0:	4b5f5f54 	c2	0x15f5f54
      e4:	65730063 	0x65730063
      e8:	735f646e 	0x735f646e
      ec:	61697265 	0x61697265
      f0:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
      f4:	3e353c72 	0x3e353c72
      f8:	6e657300 	0x6e657300
      fc:	65735f64 	0x65735f64
     100:	6c616972 	0x6c616972
     104:	7274735f 	0x7274735f
     108:	706e755f 	0x706e755f
     10c:	3c6b6361 	0x3c6b6361
     110:	72616863 	0x72616863
     114:	6863202c 	0x6863202c
     118:	202c7261 	addi	t4,at,29281
     11c:	72616863 	0x72616863
     120:	6863202c 	0x6863202c
     124:	003e7261 	0x3e7261
     128:	69736e75 	0x69736e75
     12c:	64656e67 	0x64656e67
     130:	7165735f 	0x7165735f
     134:	636e6575 	0x636e6575
     138:	2c303c65 	sltiu	s0,at,15461
     13c:	202c3120 	addi	t4,at,12576
     140:	33202c32 	andi	zero,t9,0x2c32
     144:	3e34202c 	0x3e34202c
     148:	6e657300 	0x6e657300
     14c:	65735f64 	0x65735f64
     150:	6c616972 	0x6c616972
     154:	7274735f 	0x7274735f
     158:	706e755f 	0x706e755f
     15c:	3c6b6361 	0x3c6b6361
     160:	72616863 	0x72616863
     164:	6863202c 	0x6863202c
     168:	202c7261 	addi	t4,at,29281
     16c:	72616863 	0x72616863
     170:	6863202c 	0x6863202c
     174:	202c7261 	addi	t4,at,29281
     178:	72616863 	0x72616863
     17c:	6863202c 	0x6863202c
     180:	202c7261 	addi	t4,at,29281
     184:	72616863 	0x72616863
     188:	6863202c 	0x6863202c
     18c:	202c7261 	addi	t4,at,29281
     190:	72616863 	0x72616863
     194:	6863202c 	0x6863202c
     198:	202c7261 	addi	t4,at,29281
     19c:	72616863 	0x72616863
     1a0:	6863202c 	0x6863202c
     1a4:	003e7261 	0x3e7261
     1a8:	364e5a5f 	ori	t6,s2,0x5a5f
     1ac:	6d695f5f 	0x6d695f5f
     1b0:	32326c70 	andi	s2,s1,0x6c70
     1b4:	646e6573 	0x646e6573
     1b8:	7265735f 	0x7265735f
     1bc:	5f6c6169 	0x5f6c6169
     1c0:	5f727473 	0x5f727473
     1c4:	61706e75 	0x61706e75
     1c8:	4a496b63 	c2	0x496b63
     1cc:	63636363 	0x63636363
     1d0:	63636363 	0x63636363
     1d4:	63636363 	0x63636363
     1d8:	45636363 	0x45636363
     1dc:	68764545 	0x68764545
     1e0:	5f547044 	0x5f547044
     1e4:	63617000 	0x63617000
     1e8:	0034236b 	0x34236b
     1ec:	35315a5f 	ori	s1,t1,0x5a5f
     1f0:	646e6573 	0x646e6573
     1f4:	7265735f 	0x7265735f
     1f8:	5f6c6169 	0x5f6c6169
     1fc:	49727473 	0x49727473
     200:	36326a4c 	ori	s2,s1,0x6a4c
     204:	52764545 	beql	s3,s6,1171c <_mem_avail_start-0x7ffee8e4>
     208:	5f5f5441 	0x5f5f5441
     20c:	7300634b 	0x7300634b
     210:	5f646e65 	0x5f646e65
     214:	69726573 	0x69726573
     218:	735f6c61 	0x735f6c61
     21c:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
     220:	6361706e 	0x6361706e
     224:	68633c6b 	0x68633c6b
     228:	202c7261 	addi	t4,at,29281
     22c:	72616863 	0x72616863
     230:	6863202c 	0x6863202c
     234:	003e7261 	0x3e7261
     238:	74345a5f 	jalx	d1697c <_mem_avail_start-0x7f2e9684>
     23c:	49747365 	0x49747365
     240:	76764568 	jalx	9d915a0 <_mem_avail_start-0x7626ea60>
     244:	6e657300 	0x6e657300
     248:	65735f64 	0x65735f64
     24c:	6c616972 	0x6c616972
     250:	7274735f 	0x7274735f
     254:	3e35323c 	0x3e35323c
     258:	63617000 	0x63617000
     25c:	3031236b 	andi	s1,at,0x236b
     260:	63617000 	0x63617000
     264:	3131236b 	andi	s1,t1,0x236b
     268:	63617000 	0x63617000
     26c:	3231236b 	andi	s1,s1,0x236b
     270:	63617000 	0x63617000
     274:	3331236b 	andi	s1,t9,0x236b
     278:	63617000 	0x63617000
     27c:	3431236b 	ori	s1,at,0x236b
     280:	63617000 	0x63617000
     284:	3531236b 	ori	s1,t1,0x236b
     288:	695f5f00 	0x695f5f00
     28c:	006c706d 	0x6c706d
     290:	6b636170 	0x6b636170
     294:	00373123 	0x373123
     298:	6b636170 	0x6b636170
     29c:	00383123 	0x383123
     2a0:	6b636170 	0x6b636170
     2a4:	00393123 	0x393123
     2a8:	646e6573 	0x646e6573
     2ac:	7265735f 	0x7265735f
     2b0:	5f6c6169 	0x5f6c6169
     2b4:	5f727473 	0x5f727473
     2b8:	61706e75 	0x61706e75
     2bc:	633c6b63 	0x633c6b63
     2c0:	2c726168 	sltiu	s2,v1,24936
     2c4:	61686320 	0x61686320
     2c8:	63202c72 	0x63202c72
     2cc:	2c726168 	sltiu	s2,v1,24936
     2d0:	61686320 	0x61686320
     2d4:	63202c72 	0x63202c72
     2d8:	2c726168 	sltiu	s2,v1,24936
     2dc:	61686320 	0x61686320
     2e0:	63202c72 	0x63202c72
     2e4:	3e726168 	0x3e726168
     2e8:	4e5a5f00 	c3	0x5a5f00
     2ec:	695f5f36 	0x695f5f36
     2f0:	326c706d 	andi	t4,s3,0x706d
     2f4:	6e657332 	0x6e657332
     2f8:	65735f64 	0x65735f64
     2fc:	6c616972 	0x6c616972
     300:	7274735f 	0x7274735f
     304:	706e755f 	0x706e755f
     308:	496b6361 	0x496b6361
     30c:	6363634a 	0x6363634a
     310:	63636363 	0x63636363
     314:	63636363 	0x63636363
     318:	63636363 	0x63636363
     31c:	63636363 	0x63636363
     320:	45454563 	0x45454563
     324:	70446876 	0x70446876
     328:	5f005f54 	bgtzl	t8,1807c <_mem_avail_start-0x7ffe7f84>
     32c:	6172345a 	0x6172345a
     330:	6a52646e 	0x6a52646e
     334:	73657400 	0x73657400
     338:	6e753c74 	0x6e753c74
     33c:	6e676973 	0x6e676973
     340:	63206465 	0x63206465
     344:	3e726168 	0x3e726168
     348:	4e5a5f00 	c3	0x5a5f00
     34c:	695f5f36 	0x695f5f36
     350:	326c706d 	andi	t4,s3,0x706d
     354:	6e657332 	0x6e657332
     358:	65735f64 	0x65735f64
     35c:	6c616972 	0x6c616972
     360:	7274735f 	0x7274735f
     364:	706e755f 	0x706e755f
     368:	496b6361 	0x496b6361
     36c:	6363634a 	0x6363634a
     370:	63636363 	0x63636363
     374:	63636363 	0x63636363
     378:	63636363 	0x63636363
     37c:	63636363 	0x63636363
     380:	63636363 	0x63636363
     384:	76454545 	jalx	9151514 <_mem_avail_start-0x76eaeaec>
     388:	54704468 	bnel	v1,s0,1152c <_mem_avail_start-0x7ffeead4>
     38c:	6170005f 	0x6170005f
     390:	31236b63 	andi	v1,t1,0x6b63
     394:	65730036 	0x65730036
     398:	735f646e 	0x735f646e
     39c:	61697265 	0x61697265
     3a0:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     3a4:	6e755f72 	0x6e755f72
     3a8:	6b636170 	0x6b636170
     3ac:	73003e3c 	0x73003e3c
     3b0:	5f646e65 	0x5f646e65
     3b4:	69726573 	0x69726573
     3b8:	735f6c61 	0x735f6c61
     3bc:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
     3c0:	6361706e 	0x6361706e
     3c4:	68633c6b 	0x68633c6b
     3c8:	202c7261 	addi	t4,at,29281
     3cc:	72616863 	0x72616863
     3d0:	6863202c 	0x6863202c
     3d4:	202c7261 	addi	t4,at,29281
     3d8:	72616863 	0x72616863
     3dc:	6863202c 	0x6863202c
     3e0:	202c7261 	addi	t4,at,29281
     3e4:	72616863 	0x72616863
     3e8:	6863202c 	0x6863202c
     3ec:	202c7261 	addi	t4,at,29281
     3f0:	72616863 	0x72616863
     3f4:	6863202c 	0x6863202c
     3f8:	202c7261 	addi	t4,at,29281
     3fc:	72616863 	0x72616863
     400:	6863202c 	0x6863202c
     404:	202c7261 	addi	t4,at,29281
     408:	72616863 	0x72616863
     40c:	6863202c 	0x6863202c
     410:	202c7261 	addi	t4,at,29281
     414:	72616863 	0x72616863
     418:	6863202c 	0x6863202c
     41c:	202c7261 	addi	t4,at,29281
     420:	72616863 	0x72616863
     424:	6573003e 	0x6573003e
     428:	735f646e 	0x735f646e
     42c:	61697265 	0x61697265
     430:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     434:	36323c72 	ori	s2,s1,0x3c72
     438:	6170003e 	0x6170003e
     43c:	32236b63 	andi	v1,s1,0x6b63
     440:	61700030 	0x61700030
     444:	32236b63 	andi	v1,s1,0x6b63
     448:	5a5f0031 	0x5a5f0031
     44c:	5f5f364e 	0x5f5f364e
     450:	6c706d69 	0x6c706d69
     454:	65733232 	0x65733232
     458:	735f646e 	0x735f646e
     45c:	61697265 	0x61697265
     460:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     464:	6e755f72 	0x6e755f72
     468:	6b636170 	0x6b636170
     46c:	63634a49 	0x63634a49
     470:	63636363 	0x63636363
     474:	63636363 	0x63636363
     478:	45456363 	0x45456363
     47c:	44687645 	0x44687645
     480:	005f5470 	tge	v0,ra,0x151
     484:	646e6573 	0x646e6573
     488:	7265735f 	0x7265735f
     48c:	5f6c6169 	0x5f6c6169
     490:	00786568 	0x786568
     494:	364e5a5f 	ori	t6,s2,0x5a5f
     498:	6d695f5f 	0x6d695f5f
     49c:	32326c70 	andi	s2,s1,0x6c70
     4a0:	646e6573 	0x646e6573
     4a4:	7265735f 	0x7265735f
     4a8:	5f6c6169 	0x5f6c6169
     4ac:	5f727473 	0x5f727473
     4b0:	61706e75 	0x61706e75
     4b4:	4a496b63 	c2	0x496b63
     4b8:	63636363 	0x63636363
     4bc:	45454563 	0x45454563
     4c0:	70446876 	0x70446876
     4c4:	54005f54 	bnezl	zero,18218 <_mem_avail_start-0x7ffe7de8>
     4c8:	00657079 	0x657079
     4cc:	364e5a5f 	ori	t6,s2,0x5a5f
     4d0:	6d695f5f 	0x6d695f5f
     4d4:	32326c70 	andi	s2,s1,0x6c70
     4d8:	646e6573 	0x646e6573
     4dc:	7265735f 	0x7265735f
     4e0:	5f6c6169 	0x5f6c6169
     4e4:	5f727473 	0x5f727473
     4e8:	61706e75 	0x61706e75
     4ec:	4a496b63 	c2	0x496b63
     4f0:	63636363 	0x63636363
     4f4:	63636363 	0x63636363
     4f8:	63636363 	0x63636363
     4fc:	63636363 	0x63636363
     500:	45456363 	0x45456363
     504:	44687645 	0x44687645
     508:	005f5470 	tge	v0,ra,0x151
     50c:	364e5a5f 	ori	t6,s2,0x5a5f
     510:	6d695f5f 	0x6d695f5f
     514:	32326c70 	andi	s2,s1,0x6c70
     518:	646e6573 	0x646e6573
     51c:	7265735f 	0x7265735f
     520:	5f6c6169 	0x5f6c6169
     524:	5f727473 	0x5f727473
     528:	61706e75 	0x61706e75
     52c:	4a496b63 	c2	0x496b63
     530:	63636363 	0x63636363
     534:	63636363 	0x63636363
     538:	63636363 	0x63636363
     53c:	63636363 	0x63636363
     540:	63636363 	0x63636363
     544:	45454563 	0x45454563
     548:	70446876 	0x70446876
     54c:	5f005f54 	bgtzl	t8,182a0 <_mem_avail_start-0x7ffe7d60>
     550:	5f364e5a 	0x5f364e5a
     554:	706d695f 	0x706d695f
     558:	7332326c 	0x7332326c
     55c:	5f646e65 	0x5f646e65
     560:	69726573 	0x69726573
     564:	735f6c61 	0x735f6c61
     568:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
     56c:	6361706e 	0x6361706e
     570:	634a496b 	0x634a496b
     574:	63636363 	0x63636363
     578:	63636363 	0x63636363
     57c:	76454545 	jalx	9151514 <_mem_avail_start-0x76eaeaec>
     580:	54704468 	bnel	v1,s0,11724 <_mem_avail_start-0x7ffee8dc>
     584:	5a5f005f 	0x5a5f005f
     588:	65733531 	0x65733531
     58c:	735f646e 	0x735f646e
     590:	61697265 	0x61697265
     594:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     598:	6a4c4972 	0x6a4c4972
     59c:	45453532 	0x45453532
     5a0:	54415276 	bnel	v0,at,14f7c <_mem_avail_start-0x7ffeb084>
     5a4:	634b5f5f 	0x634b5f5f
     5a8:	4e5a5f00 	c3	0x5a5f00
     5ac:	695f5f36 	0x695f5f36
     5b0:	316c706d 	andi	t4,t3,0x706d
     5b4:	6e657339 	0x6e657339
     5b8:	65735f64 	0x65735f64
     5bc:	6c616972 	0x6c616972
     5c0:	7274735f 	0x7274735f
     5c4:	7272615f 	0x7272615f
     5c8:	356a4c49 	ori	t2,t3,0x4c49
     5cc:	6a4c4a45 	0x6a4c4a45
     5d0:	6a4c4530 	0x6a4c4530
     5d4:	6a4c4531 	0x6a4c4531
     5d8:	6a4c4532 	0x6a4c4532
     5dc:	6a4c4533 	0x6a4c4533
     5e0:	45454534 	0x45454534
     5e4:	41527645 	0x41527645
     5e8:	4b5f5f54 	c2	0x15f5f54
     5ec:	5f534e63 	0x5f534e63
     5f0:	6e753731 	0x6e753731
     5f4:	6e676973 	0x6e676973
     5f8:	735f6465 	0x735f6465
     5fc:	65757165 	0x65757165
     600:	4965636e 	0x4965636e
     604:	7073584a 	0x7073584a
     608:	455f3054 	0x455f3054
     60c:	00454545 	0x454545
     610:	364e5a5f 	ori	t6,s2,0x5a5f
     614:	6d695f5f 	0x6d695f5f
     618:	32326c70 	andi	s2,s1,0x6c70
     61c:	646e6573 	0x646e6573
     620:	7265735f 	0x7265735f
     624:	5f6c6169 	0x5f6c6169
     628:	5f727473 	0x5f727473
     62c:	61706e75 	0x61706e75
     630:	4a496b63 	c2	0x496b63
     634:	63636363 	0x63636363
     638:	63636363 	0x63636363
     63c:	63636363 	0x63636363
     640:	45456363 	0x45456363
     644:	44687645 	0x44687645
     648:	005f5470 	tge	v0,ra,0x151
     64c:	646e6573 	0x646e6573
     650:	7265735f 	0x7265735f
     654:	5f6c6169 	0x5f6c6169
     658:	5f727473 	0x5f727473
     65c:	61706e75 	0x61706e75
     660:	633c6b63 	0x633c6b63
     664:	2c726168 	sltiu	s2,v1,24936
     668:	61686320 	0x61686320
     66c:	63202c72 	0x63202c72
     670:	2c726168 	sltiu	s2,v1,24936
     674:	61686320 	0x61686320
     678:	63202c72 	0x63202c72
     67c:	2c726168 	sltiu	s2,v1,24936
     680:	61686320 	0x61686320
     684:	63202c72 	0x63202c72
     688:	2c726168 	sltiu	s2,v1,24936
     68c:	61686320 	0x61686320
     690:	63202c72 	0x63202c72
     694:	2c726168 	sltiu	s2,v1,24936
     698:	61686320 	0x61686320
     69c:	63202c72 	0x63202c72
     6a0:	2c726168 	sltiu	s2,v1,24936
     6a4:	61686320 	0x61686320
     6a8:	63202c72 	0x63202c72
     6ac:	2c726168 	sltiu	s2,v1,24936
     6b0:	61686320 	0x61686320
     6b4:	6c003e72 	0x6c003e72
     6b8:	20676e6f 	addi	a3,v1,28271
     6bc:	69736e75 	0x69736e75
     6c0:	64656e67 	0x64656e67
     6c4:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
     6c8:	4e5a5f00 	c3	0x5a5f00
     6cc:	695f5f36 	0x695f5f36
     6d0:	316c706d 	andi	t4,t3,0x706d
     6d4:	6e657339 	0x6e657339
     6d8:	65735f64 	0x65735f64
     6dc:	6c616972 	0x6c616972
     6e0:	7274735f 	0x7274735f
     6e4:	7272615f 	0x7272615f
     6e8:	326a4c49 	andi	t2,s3,0x4c49
     6ec:	6a4c4a45 	0x6a4c4a45
     6f0:	6a4c4530 	0x6a4c4530
     6f4:	45454531 	0x45454531
     6f8:	41527645 	0x41527645
     6fc:	4b5f5f54 	c2	0x15f5f54
     700:	5f534e63 	0x5f534e63
     704:	6e753731 	0x6e753731
     708:	6e676973 	0x6e676973
     70c:	735f6465 	0x735f6465
     710:	65757165 	0x65757165
     714:	4965636e 	0x4965636e
     718:	7073584a 	0x7073584a
     71c:	455f3054 	0x455f3054
     720:	00454545 	0x454545
     724:	6b636150 	0x6b636150
     728:	6f687300 	0x6f687300
     72c:	75207472 	jalx	481d1c8 <_mem_avail_start-0x7b7e2e38>
     730:	6769736e 	0x6769736e
     734:	2064656e 	addi	a0,v1,25966
     738:	00746e69 	0x746e69
     73c:	364e5a5f 	ori	t6,s2,0x5a5f
     740:	6d695f5f 	0x6d695f5f
     744:	32326c70 	andi	s2,s1,0x6c70
     748:	646e6573 	0x646e6573
     74c:	7265735f 	0x7265735f
     750:	5f6c6169 	0x5f6c6169
     754:	5f727473 	0x5f727473
     758:	61706e75 	0x61706e75
     75c:	4a496b63 	c2	0x496b63
     760:	63636363 	0x63636363
     764:	63636363 	0x63636363
     768:	45456363 	0x45456363
     76c:	44687645 	0x44687645
     770:	005f5470 	tge	v0,ra,0x151
     774:	646e6573 	0x646e6573
     778:	7265735f 	0x7265735f
     77c:	5f6c6169 	0x5f6c6169
     780:	5f727473 	0x5f727473
     784:	61706e75 	0x61706e75
     788:	633c6b63 	0x633c6b63
     78c:	2c726168 	sltiu	s2,v1,24936
     790:	61686320 	0x61686320
     794:	63202c72 	0x63202c72
     798:	2c726168 	sltiu	s2,v1,24936
     79c:	61686320 	0x61686320
     7a0:	63202c72 	0x63202c72
     7a4:	2c726168 	sltiu	s2,v1,24936
     7a8:	61686320 	0x61686320
     7ac:	63202c72 	0x63202c72
     7b0:	2c726168 	sltiu	s2,v1,24936
     7b4:	61686320 	0x61686320
     7b8:	63202c72 	0x63202c72
     7bc:	2c726168 	sltiu	s2,v1,24936
     7c0:	61686320 	0x61686320
     7c4:	63202c72 	0x63202c72
     7c8:	2c726168 	sltiu	s2,v1,24936
     7cc:	61686320 	0x61686320
     7d0:	63202c72 	0x63202c72
     7d4:	2c726168 	sltiu	s2,v1,24936
     7d8:	61686320 	0x61686320
     7dc:	63202c72 	0x63202c72
     7e0:	3e726168 	0x3e726168
     7e4:	73657400 	0x73657400
     7e8:	68733c74 	0x68733c74
     7ec:	2074726f 	addi	s4,v1,29295
     7f0:	69736e75 	0x69736e75
     7f4:	64656e67 	0x64656e67
     7f8:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
     7fc:	5a5f003e 	0x5a5f003e
     800:	5f5f364e 	0x5f5f364e
     804:	6c706d69 	0x6c706d69
     808:	65733232 	0x65733232
     80c:	735f646e 	0x735f646e
     810:	61697265 	0x61697265
     814:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     818:	6e755f72 	0x6e755f72
     81c:	6b636170 	0x6b636170
     820:	63634a49 	0x63634a49
     824:	63636363 	0x63636363
     828:	45454563 	0x45454563
     82c:	70446876 	0x70446876
     830:	74005f54 	jalx	17d50 <_mem_avail_start-0x7ffe82b0>
     834:	3c747365 	0x3c747365
     838:	69736e75 	0x69736e75
     83c:	64656e67 	0x64656e67
     840:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
     844:	6573003e 	0x6573003e
     848:	735f646e 	0x735f646e
     84c:	61697265 	0x61697265
     850:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     854:	72615f72 	0x72615f72
     858:	2c353c72 	sltiu	s5,at,15474
     85c:	202c3020 	addi	t4,at,12320
     860:	32202c31 	andi	zero,s1,0x2c31
     864:	2c33202c 	sltiu	s3,at,8236
     868:	003e3420 	0x3e3420
     86c:	646e6573 	0x646e6573
     870:	7265735f 	0x7265735f
     874:	5f6c6169 	0x5f6c6169
     878:	5f727473 	0x5f727473
     87c:	61706e75 	0x61706e75
     880:	633c6b63 	0x633c6b63
     884:	2c726168 	sltiu	s2,v1,24936
     888:	61686320 	0x61686320
     88c:	63202c72 	0x63202c72
     890:	2c726168 	sltiu	s2,v1,24936
     894:	61686320 	0x61686320
     898:	63202c72 	0x63202c72
     89c:	2c726168 	sltiu	s2,v1,24936
     8a0:	61686320 	0x61686320
     8a4:	63202c72 	0x63202c72
     8a8:	2c726168 	sltiu	s2,v1,24936
     8ac:	61686320 	0x61686320
     8b0:	63202c72 	0x63202c72
     8b4:	2c726168 	sltiu	s2,v1,24936
     8b8:	61686320 	0x61686320
     8bc:	63202c72 	0x63202c72
     8c0:	2c726168 	sltiu	s2,v1,24936
     8c4:	61686320 	0x61686320
     8c8:	63202c72 	0x63202c72
     8cc:	2c726168 	sltiu	s2,v1,24936
     8d0:	61686320 	0x61686320
     8d4:	63202c72 	0x63202c72
     8d8:	2c726168 	sltiu	s2,v1,24936
     8dc:	61686320 	0x61686320
     8e0:	63202c72 	0x63202c72
     8e4:	2c726168 	sltiu	s2,v1,24936
     8e8:	61686320 	0x61686320
     8ec:	63202c72 	0x63202c72
     8f0:	2c726168 	sltiu	s2,v1,24936
     8f4:	61686320 	0x61686320
     8f8:	63202c72 	0x63202c72
     8fc:	2c726168 	sltiu	s2,v1,24936
     900:	61686320 	0x61686320
     904:	73003e72 	0x73003e72
     908:	5f646e65 	0x5f646e65
     90c:	69726573 	0x69726573
     910:	735f6c61 	0x735f6c61
     914:	615f7274 	0x615f7274
     918:	313c7272 	andi	gp,t1,0x7272
     91c:	30202c30 	andi	zero,at,0x2c30
     920:	2c31202c 	sltiu	s1,at,8236
     924:	202c3220 	addi	t4,at,12832
     928:	34202c33 	ori	zero,at,0x2c33
     92c:	2c35202c 	sltiu	s5,at,8236
     930:	202c3620 	addi	t4,at,13856
     934:	38202c37 	xori	zero,at,0x2c37
     938:	3e39202c 	0x3e39202c
     93c:	6e657300 	0x6e657300
     940:	65735f64 	0x65735f64
     944:	6c616972 	0x6c616972
     948:	7274735f 	0x7274735f
     94c:	706e755f 	0x706e755f
     950:	3c6b6361 	0x3c6b6361
     954:	72616863 	0x72616863
     958:	6863202c 	0x6863202c
     95c:	202c7261 	addi	t4,at,29281
     960:	72616863 	0x72616863
     964:	6863202c 	0x6863202c
     968:	202c7261 	addi	t4,at,29281
     96c:	72616863 	0x72616863
     970:	6863202c 	0x6863202c
     974:	202c7261 	addi	t4,at,29281
     978:	72616863 	0x72616863
     97c:	6863202c 	0x6863202c
     980:	202c7261 	addi	t4,at,29281
     984:	72616863 	0x72616863
     988:	6863202c 	0x6863202c
     98c:	202c7261 	addi	t4,at,29281
     990:	72616863 	0x72616863
     994:	6863202c 	0x6863202c
     998:	202c7261 	addi	t4,at,29281
     99c:	72616863 	0x72616863
     9a0:	6863202c 	0x6863202c
     9a4:	202c7261 	addi	t4,at,29281
     9a8:	72616863 	0x72616863
     9ac:	6863202c 	0x6863202c
     9b0:	202c7261 	addi	t4,at,29281
     9b4:	72616863 	0x72616863
     9b8:	6573003e 	0x6573003e
     9bc:	735f646e 	0x735f646e
     9c0:	61697265 	0x61697265
     9c4:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     9c8:	6e755f72 	0x6e755f72
     9cc:	6b636170 	0x6b636170
     9d0:	6168633c 	0x6168633c
     9d4:	63202c72 	0x63202c72
     9d8:	2c726168 	sltiu	s2,v1,24936
     9dc:	61686320 	0x61686320
     9e0:	63202c72 	0x63202c72
     9e4:	2c726168 	sltiu	s2,v1,24936
     9e8:	61686320 	0x61686320
     9ec:	63202c72 	0x63202c72
     9f0:	2c726168 	sltiu	s2,v1,24936
     9f4:	61686320 	0x61686320
     9f8:	63202c72 	0x63202c72
     9fc:	2c726168 	sltiu	s2,v1,24936
     a00:	61686320 	0x61686320
     a04:	63202c72 	0x63202c72
     a08:	2c726168 	sltiu	s2,v1,24936
     a0c:	61686320 	0x61686320
     a10:	63202c72 	0x63202c72
     a14:	2c726168 	sltiu	s2,v1,24936
     a18:	61686320 	0x61686320
     a1c:	63202c72 	0x63202c72
     a20:	2c726168 	sltiu	s2,v1,24936
     a24:	61686320 	0x61686320
     a28:	63202c72 	0x63202c72
     a2c:	2c726168 	sltiu	s2,v1,24936
     a30:	61686320 	0x61686320
     a34:	63202c72 	0x63202c72
     a38:	2c726168 	sltiu	s2,v1,24936
     a3c:	61686320 	0x61686320
     a40:	63202c72 	0x63202c72
     a44:	2c726168 	sltiu	s2,v1,24936
     a48:	61686320 	0x61686320
     a4c:	63202c72 	0x63202c72
     a50:	2c726168 	sltiu	s2,v1,24936
     a54:	61686320 	0x61686320
     a58:	63202c72 	0x63202c72
     a5c:	2c726168 	sltiu	s2,v1,24936
     a60:	61686320 	0x61686320
     a64:	75003e72 	jalx	400f9c8 <_mem_avail_start-0x7bff0638>
     a68:	6769736e 	0x6769736e
     a6c:	5f64656e 	0x5f64656e
     a70:	75716573 	jalx	5c595cc <_mem_avail_start-0x7a3a6a34>
     a74:	65636e65 	0x65636e65
     a78:	202c303c 	addi	t4,at,12348
     a7c:	32202c31 	andi	zero,s1,0x2c31
     a80:	2c33202c 	sltiu	s3,at,8236
     a84:	202c3420 	addi	t4,at,13344
     a88:	36202c35 	ori	zero,s1,0x2c35
     a8c:	2c37202c 	sltiu	s7,at,8236
     a90:	202c3820 	addi	t4,at,14368
     a94:	31202c39 	andi	zero,t1,0x2c39
     a98:	31202c30 	andi	zero,t1,0x2c30
     a9c:	31202c31 	andi	zero,t1,0x2c31
     aa0:	31202c32 	andi	zero,t1,0x2c32
     aa4:	31202c33 	andi	zero,t1,0x2c33
     aa8:	31202c34 	andi	zero,t1,0x2c34
     aac:	31202c35 	andi	zero,t1,0x2c35
     ab0:	31202c36 	andi	zero,t1,0x2c36
     ab4:	31202c37 	andi	zero,t1,0x2c37
     ab8:	31202c38 	andi	zero,t1,0x2c38
     abc:	32202c39 	andi	zero,s1,0x2c39
     ac0:	32202c30 	andi	zero,s1,0x2c30
     ac4:	32202c31 	andi	zero,s1,0x2c31
     ac8:	32202c32 	andi	zero,s1,0x2c32
     acc:	32202c33 	andi	zero,s1,0x2c33
     ad0:	32202c34 	andi	zero,s1,0x2c34
     ad4:	70003e35 	0x70003e35
     ad8:	236b6361 	addi	t3,k1,25441
     adc:	70003232 	0x70003232
     ae0:	236b6361 	addi	t3,k1,25441
     ae4:	72003332 	0x72003332
     ae8:	00646e61 	0x646e61
     aec:	646e6573 	0x646e6573
     af0:	7265735f 	0x7265735f
     af4:	5f6c6169 	0x5f6c6169
     af8:	5f727473 	0x5f727473
     afc:	61706e75 	0x61706e75
     b00:	633c6b63 	0x633c6b63
     b04:	2c726168 	sltiu	s2,v1,24936
     b08:	61686320 	0x61686320
     b0c:	63202c72 	0x63202c72
     b10:	2c726168 	sltiu	s2,v1,24936
     b14:	61686320 	0x61686320
     b18:	63202c72 	0x63202c72
     b1c:	2c726168 	sltiu	s2,v1,24936
     b20:	61686320 	0x61686320
     b24:	5f003e72 	bgtzl	t8,104f0 <_mem_avail_start-0x7ffefb10>
     b28:	5f364e5a 	0x5f364e5a
     b2c:	706d695f 	0x706d695f
     b30:	7332326c 	0x7332326c
     b34:	5f646e65 	0x5f646e65
     b38:	69726573 	0x69726573
     b3c:	735f6c61 	0x735f6c61
     b40:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
     b44:	6361706e 	0x6361706e
     b48:	634a496b 	0x634a496b
     b4c:	63636363 	0x63636363
     b50:	63636363 	0x63636363
     b54:	63636363 	0x63636363
     b58:	63636363 	0x63636363
     b5c:	63636363 	0x63636363
     b60:	45454563 	0x45454563
     b64:	70446876 	0x70446876
     b68:	5f005f54 	bgtzl	t8,188bc <_mem_avail_start-0x7ffe7744>
     b6c:	7335315a 	0x7335315a
     b70:	5f646e65 	0x5f646e65
     b74:	69726573 	0x69726573
     b78:	735f6c61 	0x735f6c61
     b7c:	4c497274 	0x4c497274
     b80:	4530316a 	0x4530316a
     b84:	41527645 	0x41527645
     b88:	4b5f5f54 	c2	0x15f5f54
     b8c:	6e750063 	0x6e750063
     b90:	6e676973 	0x6e676973
     b94:	735f6465 	0x735f6465
     b98:	65757165 	0x65757165
     b9c:	3c65636e 	0x3c65636e
     ba0:	31202c30 	andi	zero,t1,0x2c30
     ba4:	5a5f003e 	0x5a5f003e
     ba8:	65733631 	0x65733631
     bac:	735f646e 	0x735f646e
     bb0:	61697265 	0x61697265
     bb4:	68635f6c 	0x68635f6c
     bb8:	00687261 	0x687261
     bbc:	69736e75 	0x69736e75
     bc0:	64656e67 	0x64656e67
     bc4:	7165735f 	0x7165735f
     bc8:	636e6575 	0x636e6575
     bcc:	2c303c65 	sltiu	s0,at,15461
     bd0:	202c3120 	addi	t4,at,12576
     bd4:	33202c32 	andi	zero,t9,0x2c32
     bd8:	2c34202c 	sltiu	s4,at,8236
     bdc:	202c3520 	addi	t4,at,13600
     be0:	37202c36 	ori	zero,t9,0x2c36
     be4:	2c38202c 	sltiu	t8,at,8236
     be8:	003e3920 	0x3e3920
     bec:	6b636170 	0x6b636170
     bf0:	74003723 	jalx	dc8c <_mem_avail_start-0x7fff2374>
     bf4:	5f747365 	0x5f747365
     bf8:	6f6d656d 	0x6f6d656d
     bfc:	632e7972 	0x632e7972
     c00:	5f007070 	bgtzl	t8,1cdc4 <_mem_avail_start-0x7ffe323c>
     c04:	5f364e5a 	0x5f364e5a
     c08:	706d695f 	0x706d695f
     c0c:	7332326c 	0x7332326c
     c10:	5f646e65 	0x5f646e65
     c14:	69726573 	0x69726573
     c18:	735f6c61 	0x735f6c61
     c1c:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
     c20:	6361706e 	0x6361706e
     c24:	634a496b 	0x634a496b
     c28:	63636363 	0x63636363
     c2c:	63636363 	0x63636363
     c30:	63636363 	0x63636363
     c34:	63636363 	0x63636363
     c38:	63636363 	0x63636363
     c3c:	63636363 	0x63636363
     c40:	76454545 	jalx	9151514 <_mem_avail_start-0x76eaeaec>
     c44:	54704468 	bnel	v1,s0,11de8 <_mem_avail_start-0x7ffee218>
     c48:	5a5f005f 	0x5a5f005f
     c4c:	5f5f364e 	0x5f5f364e
     c50:	6c706d69 	0x6c706d69
     c54:	65733232 	0x65733232
     c58:	735f646e 	0x735f646e
     c5c:	61697265 	0x61697265
     c60:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     c64:	6e755f72 	0x6e755f72
     c68:	6b636170 	0x6b636170
     c6c:	63634a49 	0x63634a49
     c70:	63636363 	0x63636363
     c74:	63636363 	0x63636363
     c78:	63636363 	0x63636363
     c7c:	63636363 	0x63636363
     c80:	63636363 	0x63636363
     c84:	45456363 	0x45456363
     c88:	44687645 	0x44687645
     c8c:	005f5470 	tge	v0,ra,0x151
     c90:	646e6573 	0x646e6573
     c94:	7265735f 	0x7265735f
     c98:	5f6c6169 	0x5f6c6169
     c9c:	5f727473 	0x5f727473
     ca0:	61706e75 	0x61706e75
     ca4:	633c6b63 	0x633c6b63
     ca8:	2c726168 	sltiu	s2,v1,24936
     cac:	61686320 	0x61686320
     cb0:	73003e72 	0x73003e72
     cb4:	5f646e65 	0x5f646e65
     cb8:	69726573 	0x69726573
     cbc:	735f6c61 	0x735f6c61
     cc0:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
     cc4:	6361706e 	0x6361706e
     cc8:	68633c6b 	0x68633c6b
     ccc:	202c7261 	addi	t4,at,29281
     cd0:	72616863 	0x72616863
     cd4:	6863202c 	0x6863202c
     cd8:	202c7261 	addi	t4,at,29281
     cdc:	72616863 	0x72616863
     ce0:	6863202c 	0x6863202c
     ce4:	202c7261 	addi	t4,at,29281
     ce8:	72616863 	0x72616863
     cec:	6863202c 	0x6863202c
     cf0:	202c7261 	addi	t4,at,29281
     cf4:	72616863 	0x72616863
     cf8:	6863202c 	0x6863202c
     cfc:	202c7261 	addi	t4,at,29281
     d00:	72616863 	0x72616863
     d04:	6863202c 	0x6863202c
     d08:	202c7261 	addi	t4,at,29281
     d0c:	72616863 	0x72616863
     d10:	6863202c 	0x6863202c
     d14:	202c7261 	addi	t4,at,29281
     d18:	72616863 	0x72616863
     d1c:	6863202c 	0x6863202c
     d20:	202c7261 	addi	t4,at,29281
     d24:	72616863 	0x72616863
     d28:	6863202c 	0x6863202c
     d2c:	202c7261 	addi	t4,at,29281
     d30:	72616863 	0x72616863
     d34:	6573003e 	0x6573003e
     d38:	735f646e 	0x735f646e
     d3c:	61697265 	0x61697265
     d40:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     d44:	6e755f72 	0x6e755f72
     d48:	6b636170 	0x6b636170
     d4c:	6168633c 	0x6168633c
     d50:	63202c72 	0x63202c72
     d54:	2c726168 	sltiu	s2,v1,24936
     d58:	61686320 	0x61686320
     d5c:	63202c72 	0x63202c72
     d60:	2c726168 	sltiu	s2,v1,24936
     d64:	61686320 	0x61686320
     d68:	63202c72 	0x63202c72
     d6c:	2c726168 	sltiu	s2,v1,24936
     d70:	61686320 	0x61686320
     d74:	63202c72 	0x63202c72
     d78:	2c726168 	sltiu	s2,v1,24936
     d7c:	61686320 	0x61686320
     d80:	63202c72 	0x63202c72
     d84:	2c726168 	sltiu	s2,v1,24936
     d88:	61686320 	0x61686320
     d8c:	63202c72 	0x63202c72
     d90:	2c726168 	sltiu	s2,v1,24936
     d94:	61686320 	0x61686320
     d98:	63202c72 	0x63202c72
     d9c:	2c726168 	sltiu	s2,v1,24936
     da0:	61686320 	0x61686320
     da4:	63202c72 	0x63202c72
     da8:	2c726168 	sltiu	s2,v1,24936
     dac:	61686320 	0x61686320
     db0:	63202c72 	0x63202c72
     db4:	2c726168 	sltiu	s2,v1,24936
     db8:	61686320 	0x61686320
     dbc:	5f003e72 	bgtzl	t8,10788 <_mem_avail_start-0x7ffef878>
     dc0:	5f364e5a 	0x5f364e5a
     dc4:	706d695f 	0x706d695f
     dc8:	7332326c 	0x7332326c
     dcc:	5f646e65 	0x5f646e65
     dd0:	69726573 	0x69726573
     dd4:	735f6c61 	0x735f6c61
     dd8:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
     ddc:	6361706e 	0x6361706e
     de0:	634a496b 	0x634a496b
     de4:	63636363 	0x63636363
     de8:	63636363 	0x63636363
     dec:	63636363 	0x63636363
     df0:	45636363 	0x45636363
     df4:	68764545 	0x68764545
     df8:	5f547044 	0x5f547044
     dfc:	6e657300 	0x6e657300
     e00:	65735f64 	0x65735f64
     e04:	6c616972 	0x6c616972
     e08:	7274735f 	0x7274735f
     e0c:	706e755f 	0x706e755f
     e10:	3c6b6361 	0x3c6b6361
     e14:	72616863 	0x72616863
     e18:	6863202c 	0x6863202c
     e1c:	202c7261 	addi	t4,at,29281
     e20:	72616863 	0x72616863
     e24:	6863202c 	0x6863202c
     e28:	202c7261 	addi	t4,at,29281
     e2c:	72616863 	0x72616863
     e30:	6863202c 	0x6863202c
     e34:	202c7261 	addi	t4,at,29281
     e38:	72616863 	0x72616863
     e3c:	6863202c 	0x6863202c
     e40:	202c7261 	addi	t4,at,29281
     e44:	72616863 	0x72616863
     e48:	6863202c 	0x6863202c
     e4c:	202c7261 	addi	t4,at,29281
     e50:	72616863 	0x72616863
     e54:	6863202c 	0x6863202c
     e58:	202c7261 	addi	t4,at,29281
     e5c:	72616863 	0x72616863
     e60:	6863202c 	0x6863202c
     e64:	202c7261 	addi	t4,at,29281
     e68:	72616863 	0x72616863
     e6c:	6863202c 	0x6863202c
     e70:	202c7261 	addi	t4,at,29281
     e74:	72616863 	0x72616863
     e78:	6863202c 	0x6863202c
     e7c:	202c7261 	addi	t4,at,29281
     e80:	72616863 	0x72616863
     e84:	6863202c 	0x6863202c
     e88:	202c7261 	addi	t4,at,29281
     e8c:	72616863 	0x72616863
     e90:	5a5f003e 	0x5a5f003e
     e94:	5f5f364e 	0x5f5f364e
     e98:	6c706d69 	0x6c706d69
     e9c:	65733232 	0x65733232
     ea0:	735f646e 	0x735f646e
     ea4:	61697265 	0x61697265
     ea8:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     eac:	6e755f72 	0x6e755f72
     eb0:	6b636170 	0x6b636170
     eb4:	63634a49 	0x63634a49
     eb8:	63636363 	0x63636363
     ebc:	63636363 	0x63636363
     ec0:	63636363 	0x63636363
     ec4:	63636363 	0x63636363
     ec8:	45454563 	0x45454563
     ecc:	70446876 	0x70446876
     ed0:	75005f54 	jalx	4017d50 <_mem_avail_start-0x7bfe82b0>
     ed4:	6769736e 	0x6769736e
     ed8:	2064656e 	addi	a0,v1,25966
     edc:	72616863 	0x72616863
     ee0:	6e657300 	0x6e657300
     ee4:	65735f64 	0x65735f64
     ee8:	6c616972 	0x6c616972
     eec:	7274735f 	0x7274735f
     ef0:	3e30313c 	0x3e30313c
     ef4:	4e5a5f00 	c3	0x5a5f00
     ef8:	695f5f36 	0x695f5f36
     efc:	326c706d 	andi	t4,s3,0x706d
     f00:	6e657332 	0x6e657332
     f04:	65735f64 	0x65735f64
     f08:	6c616972 	0x6c616972
     f0c:	7274735f 	0x7274735f
     f10:	706e755f 	0x706e755f
     f14:	496b6361 	0x496b6361
     f18:	6363634a 	0x6363634a
     f1c:	76454545 	jalx	9151514 <_mem_avail_start-0x76eaeaec>
     f20:	54704468 	bnel	v1,s0,120c4 <_mem_avail_start-0x7ffedf3c>
     f24:	6573005f 	0x6573005f
     f28:	735f646e 	0x735f646e
     f2c:	61697265 	0x61697265
     f30:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
     f34:	3e323c72 	0x3e323c72
     f38:	4e5a5f00 	c3	0x5a5f00
     f3c:	695f5f36 	0x695f5f36
     f40:	316c706d 	andi	t4,t3,0x706d
     f44:	6e657339 	0x6e657339
     f48:	65735f64 	0x65735f64
     f4c:	6c616972 	0x6c616972
     f50:	7274735f 	0x7274735f
     f54:	7272615f 	0x7272615f
     f58:	326a4c49 	andi	t2,s3,0x4c49
     f5c:	4c4a4536 	0x4c4a4536
     f60:	4c45306a 	0x4c45306a
     f64:	4c45316a 	0x4c45316a
     f68:	4c45326a 	0x4c45326a
     f6c:	4c45336a 	0x4c45336a
     f70:	4c45346a 	0x4c45346a
     f74:	4c45356a 	0x4c45356a
     f78:	4c45366a 	0x4c45366a
     f7c:	4c45376a 	0x4c45376a
     f80:	4c45386a 	0x4c45386a
     f84:	4c45396a 	0x4c45396a
     f88:	4530316a 	0x4530316a
     f8c:	31316a4c 	andi	s1,t1,0x6a4c
     f90:	316a4c45 	andi	t2,t3,0x4c45
     f94:	6a4c4532 	0x6a4c4532
     f98:	4c453331 	0x4c453331
     f9c:	4534316a 	0x4534316a
     fa0:	35316a4c 	ori	s1,t1,0x6a4c
     fa4:	316a4c45 	andi	t2,t3,0x4c45
     fa8:	6a4c4536 	0x6a4c4536
     fac:	4c453731 	0x4c453731
     fb0:	4538316a 	0x4538316a
     fb4:	39316a4c 	xori	s1,t1,0x6a4c
     fb8:	326a4c45 	andi	t2,s3,0x4c45
     fbc:	6a4c4530 	0x6a4c4530
     fc0:	4c453132 	0x4c453132
     fc4:	4532326a 	0x4532326a
     fc8:	33326a4c 	andi	s2,t9,0x6a4c
     fcc:	326a4c45 	andi	t2,s3,0x4c45
     fd0:	6a4c4534 	0x6a4c4534
     fd4:	45453532 	0x45453532
     fd8:	52764545 	beql	s3,s6,124f0 <_mem_avail_start-0x7ffedb10>
     fdc:	5f5f5441 	0x5f5f5441
     fe0:	534e634b 	beql	k0,t6,19d10 <_mem_avail_start-0x7ffe62f0>
     fe4:	7537315f 	jalx	4dcc57c <_mem_avail_start-0x7b233a84>
     fe8:	6769736e 	0x6769736e
     fec:	5f64656e 	0x5f64656e
     ff0:	75716573 	jalx	5c595cc <_mem_avail_start-0x7a3a6a34>
     ff4:	65636e65 	0x65636e65
     ff8:	73584a49 	0x73584a49
     ffc:	5f305470 	0x5f305470
    1000:	45454545 	0x45454545
    1004:	4e5a5f00 	c3	0x5a5f00
    1008:	695f5f36 	0x695f5f36
    100c:	326c706d 	andi	t4,s3,0x706d
    1010:	6e657332 	0x6e657332
    1014:	65735f64 	0x65735f64
    1018:	6c616972 	0x6c616972
    101c:	7274735f 	0x7274735f
    1020:	706e755f 	0x706e755f
    1024:	496b6361 	0x496b6361
    1028:	4545634a 	0x4545634a
    102c:	44687645 	0x44687645
    1030:	005f5470 	tge	v0,ra,0x151
    1034:	364e5a5f 	ori	t6,s2,0x5a5f
    1038:	6d695f5f 	0x6d695f5f
    103c:	32326c70 	andi	s2,s1,0x6c70
    1040:	646e6573 	0x646e6573
    1044:	7265735f 	0x7265735f
    1048:	5f6c6169 	0x5f6c6169
    104c:	5f727473 	0x5f727473
    1050:	61706e75 	0x61706e75
    1054:	4a496b63 	c2	0x496b63
    1058:	76454545 	jalx	9151514 <_mem_avail_start-0x76eaeaec>
    105c:	54704468 	bnel	v1,s0,12200 <_mem_avail_start-0x7ffede00>
    1060:	5a5f005f 	0x5a5f005f
    1064:	65733531 	0x65733531
    1068:	735f646e 	0x735f646e
    106c:	61697265 	0x61697265
    1070:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
    1074:	6a4c4972 	0x6a4c4972
    1078:	76454535 	jalx	91514d4 <_mem_avail_start-0x76eaeb2c>
    107c:	5f544152 	0x5f544152
    1080:	00634b5f 	0x634b5f
    1084:	69726573 	0x69726573
    1088:	655f6c61 	0x655f6c61
    108c:	7972746e 	0x7972746e
    1090:	6e657300 	0x6e657300
    1094:	65735f64 	0x65735f64
    1098:	6c616972 	0x6c616972
    109c:	7274735f 	0x7274735f
    10a0:	706e755f 	0x706e755f
    10a4:	3c6b6361 	0x3c6b6361
    10a8:	72616863 	0x72616863
    10ac:	6863202c 	0x6863202c
    10b0:	202c7261 	addi	t4,at,29281
    10b4:	72616863 	0x72616863
    10b8:	6863202c 	0x6863202c
    10bc:	202c7261 	addi	t4,at,29281
    10c0:	72616863 	0x72616863
    10c4:	6863202c 	0x6863202c
    10c8:	202c7261 	addi	t4,at,29281
    10cc:	72616863 	0x72616863
    10d0:	6863202c 	0x6863202c
    10d4:	202c7261 	addi	t4,at,29281
    10d8:	72616863 	0x72616863
    10dc:	6863202c 	0x6863202c
    10e0:	202c7261 	addi	t4,at,29281
    10e4:	72616863 	0x72616863
    10e8:	6863202c 	0x6863202c
    10ec:	202c7261 	addi	t4,at,29281
    10f0:	72616863 	0x72616863
    10f4:	6573003e 	0x6573003e
    10f8:	735f646e 	0x735f646e
    10fc:	61697265 	0x61697265
    1100:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
    1104:	6e755f72 	0x6e755f72
    1108:	6b636170 	0x6b636170
    110c:	6168633c 	0x6168633c
    1110:	63202c72 	0x63202c72
    1114:	2c726168 	sltiu	s2,v1,24936
    1118:	61686320 	0x61686320
    111c:	63202c72 	0x63202c72
    1120:	2c726168 	sltiu	s2,v1,24936
    1124:	61686320 	0x61686320
    1128:	73003e72 	0x73003e72
    112c:	5f646e65 	0x5f646e65
    1130:	69726573 	0x69726573
    1134:	735f6c61 	0x735f6c61
    1138:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
    113c:	6361706e 	0x6361706e
    1140:	68633c6b 	0x68633c6b
    1144:	202c7261 	addi	t4,at,29281
    1148:	72616863 	0x72616863
    114c:	6863202c 	0x6863202c
    1150:	202c7261 	addi	t4,at,29281
    1154:	72616863 	0x72616863
    1158:	6863202c 	0x6863202c
    115c:	202c7261 	addi	t4,at,29281
    1160:	72616863 	0x72616863
    1164:	6863202c 	0x6863202c
    1168:	202c7261 	addi	t4,at,29281
    116c:	72616863 	0x72616863
    1170:	6863202c 	0x6863202c
    1174:	202c7261 	addi	t4,at,29281
    1178:	72616863 	0x72616863
    117c:	6863202c 	0x6863202c
    1180:	003e7261 	0x3e7261
    1184:	364e5a5f 	ori	t6,s2,0x5a5f
    1188:	6d695f5f 	0x6d695f5f
    118c:	32326c70 	andi	s2,s1,0x6c70
    1190:	646e6573 	0x646e6573
    1194:	7265735f 	0x7265735f
    1198:	5f6c6169 	0x5f6c6169
    119c:	5f727473 	0x5f727473
    11a0:	61706e75 	0x61706e75
    11a4:	4a496b63 	c2	0x496b63
    11a8:	63636363 	0x63636363
    11ac:	63636363 	0x63636363
    11b0:	63636363 	0x63636363
    11b4:	63636363 	0x63636363
    11b8:	45454563 	0x45454563
    11bc:	70446876 	0x70446876
    11c0:	70005f54 	0x70005f54
    11c4:	236b6361 	addi	t3,k1,25441
    11c8:	61700030 	0x61700030
    11cc:	31236b63 	andi	v1,t1,0x6b63
    11d0:	63617000 	0x63617000
    11d4:	0032236b 	0x32236b
    11d8:	6b636170 	0x6b636170
    11dc:	2f003323 	sltiu	zero,t8,13091
    11e0:	2f746e6d 	sltiu	s4,k1,28269
    11e4:	73552f63 	0x73552f63
    11e8:	2f737265 	sltiu	s3,k1,29285
    11ec:	74636146 	jalx	18d8518 <_mem_avail_start-0x7e727ae8>
    11f0:	6169726f 	0x6169726f
    11f4:	642f4e6c 	0x642f4e6c
    11f8:	6c6e776f 	0x6c6e776f
    11fc:	7364616f 	0x7364616f
    1200:	776f772f 	jalx	dbddcbc <_mem_avail_start-0x72422344>
    1204:	646f632f 	0x646f632f
    1208:	72673931 	0x72673931
    120c:	522f3170 	beql	s1,t7,d7d0 <_mem_avail_start-0x7fff2830>
    1210:	6574756f 	0x6574756f
    1214:	65522d72 	0x65522d72
    1218:	6c697562 	0x6c697562
    121c:	72542f64 	0x72542f64
    1220:	61697669 	0x61697669
    1224:	50494d6c 	beql	v0,t1,147d8 <_mem_avail_start-0x7ffeb828>
    1228:	6f535f53 	0x6f535f53
    122c:	61777466 	0x61777466
    1230:	632f6572 	0x632f6572
    1234:	70007070 	0x70007070
    1238:	236b6361 	addi	t3,k1,25441
    123c:	61700035 	0x61700035
    1240:	36236b63 	ori	v1,s1,0x6b63
    1244:	63617000 	0x63617000
    1248:	0038236b 	0x38236b
    124c:	6b636170 	0x6b636170
    1250:	72003923 	0x72003923
    1254:	5f646e61 	0x5f646e61
    1258:	64656573 	0x64656573
    125c:	4e5a5f00 	c3	0x5a5f00
    1260:	695f5f36 	0x695f5f36
    1264:	316c706d 	andi	t4,t3,0x706d
    1268:	6e657339 	0x6e657339
    126c:	65735f64 	0x65735f64
    1270:	6c616972 	0x6c616972
    1274:	7274735f 	0x7274735f
    1278:	7272615f 	0x7272615f
    127c:	326a4c49 	andi	t2,s3,0x4c49
    1280:	4c4a4535 	0x4c4a4535
    1284:	4c45306a 	0x4c45306a
    1288:	4c45316a 	0x4c45316a
    128c:	4c45326a 	0x4c45326a
    1290:	4c45336a 	0x4c45336a
    1294:	4c45346a 	0x4c45346a
    1298:	4c45356a 	0x4c45356a
    129c:	4c45366a 	0x4c45366a
    12a0:	4c45376a 	0x4c45376a
    12a4:	4c45386a 	0x4c45386a
    12a8:	4c45396a 	0x4c45396a
    12ac:	4530316a 	0x4530316a
    12b0:	31316a4c 	andi	s1,t1,0x6a4c
    12b4:	316a4c45 	andi	t2,t3,0x4c45
    12b8:	6a4c4532 	0x6a4c4532
    12bc:	4c453331 	0x4c453331
    12c0:	4534316a 	0x4534316a
    12c4:	35316a4c 	ori	s1,t1,0x6a4c
    12c8:	316a4c45 	andi	t2,t3,0x4c45
    12cc:	6a4c4536 	0x6a4c4536
    12d0:	4c453731 	0x4c453731
    12d4:	4538316a 	0x4538316a
    12d8:	39316a4c 	xori	s1,t1,0x6a4c
    12dc:	326a4c45 	andi	t2,s3,0x4c45
    12e0:	6a4c4530 	0x6a4c4530
    12e4:	4c453132 	0x4c453132
    12e8:	4532326a 	0x4532326a
    12ec:	33326a4c 	andi	s2,t9,0x6a4c
    12f0:	326a4c45 	andi	t2,s3,0x4c45
    12f4:	45454534 	0x45454534
    12f8:	41527645 	0x41527645
    12fc:	4b5f5f54 	c2	0x15f5f54
    1300:	5f534e63 	0x5f534e63
    1304:	6e753731 	0x6e753731
    1308:	6e676973 	0x6e676973
    130c:	735f6465 	0x735f6465
    1310:	65757165 	0x65757165
    1314:	4965636e 	0x4965636e
    1318:	7073584a 	0x7073584a
    131c:	455f3054 	0x455f3054
    1320:	00454545 	0x454545
    1324:	364e5a5f 	ori	t6,s2,0x5a5f
    1328:	6d695f5f 	0x6d695f5f
    132c:	32326c70 	andi	s2,s1,0x6c70
    1330:	646e6573 	0x646e6573
    1334:	7265735f 	0x7265735f
    1338:	5f6c6169 	0x5f6c6169
    133c:	5f727473 	0x5f727473
    1340:	61706e75 	0x61706e75
    1344:	4a496b63 	c2	0x496b63
    1348:	45456363 	0x45456363
    134c:	44687645 	0x44687645
    1350:	005f5470 	tge	v0,ra,0x151
    1354:	74345a5f 	jalx	d1697c <_mem_avail_start-0x7f2e9684>
    1358:	49747365 	0x49747365
    135c:	76764574 	jalx	9d915d0 <_mem_avail_start-0x7626ea30>
    1360:	554e4700 	bnel	t2,t6,12f64 <_mem_avail_start-0x7ffed09c>
    1364:	2b2b4320 	slti	t3,t9,17184
    1368:	37203131 	ori	zero,t9,0x3131
    136c:	302e342e 	andi	t6,at,0x342e
    1370:	656d2d20 	0x656d2d20
    1374:	6d2d206c 	0x6d2d206c
    1378:	676e6973 	0x676e6973
    137c:	662d656c 	0x662d656c
    1380:	74616f6c 	jalx	185bdb0 <_mem_avail_start-0x7e7a4250>
    1384:	786d2d20 	0x786d2d20
    1388:	20746f67 	addi	s4,v1,28519
    138c:	6f6e6d2d 	0x6f6e6d2d
    1390:	6962612d 	0x6962612d
    1394:	6c6c6163 	0x6c6c6163
    1398:	6d2d2073 	0x6d2d2073
    139c:	64726168 	0x64726168
    13a0:	6f6c662d 	0x6f6c662d
    13a4:	2d207461 	sltiu	zero,t1,29793
    13a8:	7370696d 	0x7370696d
    13ac:	2d203233 	sltiu	zero,t1,12851
    13b0:	736c6c6d 	0x736c6c6d
    13b4:	6d2d2063 	0x6d2d2063
    13b8:	6c2d6f6e 	0x6c2d6f6e
    13bc:	2d316378 	sltiu	s1,t1,25464
    13c0:	31637873 	andi	v1,t3,0x7873
    13c4:	6e6d2d20 	0x6e6d2d20
    13c8:	616d2d6f 	0x616d2d6f
    13cc:	20346464 	addi	s4,at,25700
    13d0:	6f6e6d2d 	0x6f6e6d2d
    13d4:	6168732d 	0x6168732d
    13d8:	20646572 	addi	a0,v1,25970
    13dc:	62616d2d 	0x62616d2d
    13e0:	32333d69 	andi	s3,s1,0x3d69
    13e4:	20672d20 	addi	a3,v1,11552
    13e8:	20734f2d 	addi	s3,v1,20269
    13ec:	6474732d 	0x6474732d
    13f0:	2b2b633d 	slti	t3,t9,25405
    13f4:	2d203131 	sltiu	zero,t1,12593
    13f8:	6e756666 	0x6e756666
    13fc:	6f697463 	0x6f697463
    1400:	65732d6e 	0x65732d6e
    1404:	6f697463 	0x6f697463
    1408:	2d20736e 	sltiu	zero,t1,29550
    140c:	74616466 	jalx	1859198 <_mem_avail_start-0x7e7a6e68>
    1410:	65732d61 	0x65732d61
    1414:	6f697463 	0x6f697463
    1418:	2d20736e 	sltiu	zero,t1,29550
    141c:	65726666 	0x65726666
    1420:	61747365 	0x61747365
    1424:	6e69646e 	0x6e69646e
    1428:	662d2067 	0x662d2067
    142c:	622d6f6e 	0x622d6f6e
    1430:	746c6975 	jalx	1b1a5d4 <_mem_avail_start-0x7e4e5a2c>
    1434:	2d206e69 	sltiu	zero,t1,28265
    1438:	2d6f6e66 	sltiu	t7,t3,28262
    143c:	00454950 	0x454950
    1440:	646e6573 	0x646e6573
    1444:	7265735f 	0x7265735f
    1448:	5f6c6169 	0x5f6c6169
    144c:	5f727473 	0x5f727473
    1450:	61706e75 	0x61706e75
    1454:	633c6b63 	0x633c6b63
    1458:	2c726168 	sltiu	s2,v1,24936
    145c:	61686320 	0x61686320
    1460:	63202c72 	0x63202c72
    1464:	2c726168 	sltiu	s2,v1,24936
    1468:	61686320 	0x61686320
    146c:	63202c72 	0x63202c72
    1470:	2c726168 	sltiu	s2,v1,24936
    1474:	61686320 	0x61686320
    1478:	63202c72 	0x63202c72
    147c:	2c726168 	sltiu	s2,v1,24936
    1480:	61686320 	0x61686320
    1484:	63202c72 	0x63202c72
    1488:	2c726168 	sltiu	s2,v1,24936
    148c:	61686320 	0x61686320
    1490:	63202c72 	0x63202c72
    1494:	2c726168 	sltiu	s2,v1,24936
    1498:	61686320 	0x61686320
    149c:	63202c72 	0x63202c72
    14a0:	2c726168 	sltiu	s2,v1,24936
    14a4:	61686320 	0x61686320
    14a8:	63202c72 	0x63202c72
    14ac:	2c726168 	sltiu	s2,v1,24936
    14b0:	61686320 	0x61686320
    14b4:	63202c72 	0x63202c72
    14b8:	2c726168 	sltiu	s2,v1,24936
    14bc:	61686320 	0x61686320
    14c0:	63202c72 	0x63202c72
    14c4:	2c726168 	sltiu	s2,v1,24936
    14c8:	61686320 	0x61686320
    14cc:	73003e72 	0x73003e72
    14d0:	5f646e65 	0x5f646e65
    14d4:	69726573 	0x69726573
    14d8:	635f6c61 	0x635f6c61
    14dc:	00726168 	0x726168
    14e0:	646e6573 	0x646e6573
    14e4:	7265735f 	0x7265735f
    14e8:	5f6c6169 	0x5f6c6169
    14ec:	5f727473 	0x5f727473
    14f0:	61706e75 	0x61706e75
    14f4:	633c6b63 	0x633c6b63
    14f8:	2c726168 	sltiu	s2,v1,24936
    14fc:	61686320 	0x61686320
    1500:	63202c72 	0x63202c72
    1504:	2c726168 	sltiu	s2,v1,24936
    1508:	61686320 	0x61686320
    150c:	63202c72 	0x63202c72
    1510:	2c726168 	sltiu	s2,v1,24936
    1514:	61686320 	0x61686320
    1518:	63202c72 	0x63202c72
    151c:	2c726168 	sltiu	s2,v1,24936
    1520:	61686320 	0x61686320
    1524:	63202c72 	0x63202c72
    1528:	3e726168 	0x3e726168
    152c:	4e5a5f00 	c3	0x5a5f00
    1530:	695f5f36 	0x695f5f36
    1534:	326c706d 	andi	t4,s3,0x706d
    1538:	6e657332 	0x6e657332
    153c:	65735f64 	0x65735f64
    1540:	6c616972 	0x6c616972
    1544:	7274735f 	0x7274735f
    1548:	706e755f 	0x706e755f
    154c:	496b6361 	0x496b6361
    1550:	6363634a 	0x6363634a
    1554:	45454563 	0x45454563
    1558:	70446876 	0x70446876
    155c:	73005f54 	0x73005f54
    1560:	5f646e65 	0x5f646e65
    1564:	69726573 	0x69726573
    1568:	735f6c61 	0x735f6c61
    156c:	755f7274 	jalx	57dc9d0 <_mem_avail_start-0x7a823630>
    1570:	6361706e 	0x6361706e
    1574:	68633c6b 	0x68633c6b
    1578:	202c7261 	addi	t4,at,29281
    157c:	72616863 	0x72616863
    1580:	6863202c 	0x6863202c
    1584:	202c7261 	addi	t4,at,29281
    1588:	72616863 	0x72616863
    158c:	6863202c 	0x6863202c
    1590:	202c7261 	addi	t4,at,29281
    1594:	72616863 	0x72616863
    1598:	6863202c 	0x6863202c
    159c:	202c7261 	addi	t4,at,29281
    15a0:	72616863 	0x72616863
    15a4:	5a5f003e 	0x5a5f003e
    15a8:	5f5f364e 	0x5f5f364e
    15ac:	6c706d69 	0x6c706d69
    15b0:	65733931 	0x65733931
    15b4:	735f646e 	0x735f646e
    15b8:	61697265 	0x61697265
    15bc:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
    15c0:	72615f72 	0x72615f72
    15c4:	6a4c4972 	0x6a4c4972
    15c8:	4a453031 	c2	0x453031
    15cc:	45306a4c 	0x45306a4c
    15d0:	45316a4c 	0x45316a4c
    15d4:	45326a4c 	0x45326a4c
    15d8:	45336a4c 	0x45336a4c
    15dc:	45346a4c 	0x45346a4c
    15e0:	45356a4c 	0x45356a4c
    15e4:	45366a4c 	0x45366a4c
    15e8:	45376a4c 	0x45376a4c
    15ec:	45386a4c 	0x45386a4c
    15f0:	45396a4c 	0x45396a4c
    15f4:	76454545 	jalx	9151514 <_mem_avail_start-0x76eaeaec>
    15f8:	5f544152 	0x5f544152
    15fc:	4e634b5f 	c3	0x634b5f
    1600:	37315f53 	ori	s1,t9,0x5f53
    1604:	69736e75 	0x69736e75
    1608:	64656e67 	0x64656e67
    160c:	7165735f 	0x7165735f
    1610:	636e6575 	0x636e6575
    1614:	584a4965 	0x584a4965
    1618:	30547073 	andi	s4,v0,0x7073
    161c:	4545455f 	0x4545455f
    1620:	5a5f0045 	0x5a5f0045
    1624:	65733531 	0x65733531
    1628:	735f646e 	0x735f646e
    162c:	61697265 	0x61697265
    1630:	65685f6c 	0x65685f6c
    1634:	73006a78 	0x73006a78
    1638:	5f646e65 	0x5f646e65
    163c:	69726573 	0x69726573
    1640:	735f6c61 	0x735f6c61
    1644:	615f7274 	0x615f7274
    1648:	323c7272 	andi	gp,s1,0x7272
    164c:	2c30202c 	sltiu	s0,at,8236
    1650:	003e3120 	0x3e3120
    1654:	364e5a5f 	ori	t6,s2,0x5a5f
    1658:	6d695f5f 	0x6d695f5f
    165c:	32326c70 	andi	s2,s1,0x6c70
    1660:	646e6573 	0x646e6573
    1664:	7265735f 	0x7265735f
    1668:	5f6c6169 	0x5f6c6169
    166c:	5f727473 	0x5f727473
    1670:	61706e75 	0x61706e75
    1674:	4a496b63 	c2	0x496b63
    1678:	63636363 	0x63636363
    167c:	45456363 	0x45456363
    1680:	44687645 	0x44687645
    1684:	005f5470 	tge	v0,ra,0x151
    1688:	74345a5f 	jalx	d1697c <_mem_avail_start-0x7f2e9684>
    168c:	49747365 	0x49747365
    1690:	7676456a 	jalx	9d915a8 <_mem_avail_start-0x7626ea58>
    1694:	736e7500 	0x736e7500
    1698:	656e6769 	0x656e6769
    169c:	65735f64 	0x65735f64
    16a0:	6e657571 	0x6e657571
    16a4:	303c6563 	andi	gp,at,0x6563
    16a8:	2c31202c 	sltiu	s1,at,8236
    16ac:	202c3220 	addi	t4,at,12832
    16b0:	34202c33 	ori	zero,at,0x2c33
    16b4:	2c35202c 	sltiu	s5,at,8236
    16b8:	202c3620 	addi	t4,at,13856
    16bc:	38202c37 	xori	zero,at,0x2c37
    16c0:	2c39202c 	sltiu	t9,at,8236
    16c4:	2c303120 	sltiu	s0,at,12576
    16c8:	2c313120 	sltiu	s1,at,12576
    16cc:	2c323120 	sltiu	s2,at,12576
    16d0:	2c333120 	sltiu	s3,at,12576
    16d4:	2c343120 	sltiu	s4,at,12576
    16d8:	2c353120 	sltiu	s5,at,12576
    16dc:	2c363120 	sltiu	s6,at,12576
    16e0:	2c373120 	sltiu	s7,at,12576
    16e4:	2c383120 	sltiu	t8,at,12576
    16e8:	2c393120 	sltiu	t9,at,12576
    16ec:	2c303220 	sltiu	s0,at,12832
    16f0:	2c313220 	sltiu	s1,at,12832
    16f4:	2c323220 	sltiu	s2,at,12832
    16f8:	2c333220 	sltiu	s3,at,12832
    16fc:	3e343220 	0x3e343220
    1700:	6e657300 	0x6e657300
    1704:	65735f64 	0x65735f64
    1708:	6c616972 	0x6c616972
    170c:	7274735f 	0x7274735f
    1710:	706e755f 	0x706e755f
    1714:	3c6b6361 	0x3c6b6361
    1718:	72616863 	0x72616863
    171c:	6863202c 	0x6863202c
    1720:	202c7261 	addi	t4,at,29281
    1724:	72616863 	0x72616863
    1728:	6863202c 	0x6863202c
    172c:	202c7261 	addi	t4,at,29281
    1730:	72616863 	0x72616863
    1734:	6863202c 	0x6863202c
    1738:	202c7261 	addi	t4,at,29281
    173c:	72616863 	0x72616863
    1740:	6863202c 	0x6863202c
    1744:	202c7261 	addi	t4,at,29281
    1748:	72616863 	0x72616863
    174c:	6863202c 	0x6863202c
    1750:	202c7261 	addi	t4,at,29281
    1754:	72616863 	0x72616863
    1758:	6863202c 	0x6863202c
    175c:	202c7261 	addi	t4,at,29281
    1760:	72616863 	0x72616863
    1764:	6863202c 	0x6863202c
    1768:	202c7261 	addi	t4,at,29281
    176c:	72616863 	0x72616863
    1770:	6863202c 	0x6863202c
    1774:	202c7261 	addi	t4,at,29281
    1778:	72616863 	0x72616863
    177c:	6863202c 	0x6863202c
    1780:	202c7261 	addi	t4,at,29281
    1784:	72616863 	0x72616863
    1788:	6863202c 	0x6863202c
    178c:	202c7261 	addi	t4,at,29281
    1790:	72616863 	0x72616863
    1794:	6863202c 	0x6863202c
    1798:	202c7261 	addi	t4,at,29281
    179c:	72616863 	0x72616863
    17a0:	6573003e 	0x6573003e
    17a4:	735f646e 	0x735f646e
    17a8:	61697265 	0x61697265
    17ac:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
    17b0:	6e755f72 	0x6e755f72
    17b4:	6b636170 	0x6b636170
    17b8:	6168633c 	0x6168633c
    17bc:	63202c72 	0x63202c72
    17c0:	2c726168 	sltiu	s2,v1,24936
    17c4:	61686320 	0x61686320
    17c8:	63202c72 	0x63202c72
    17cc:	2c726168 	sltiu	s2,v1,24936
    17d0:	61686320 	0x61686320
    17d4:	63202c72 	0x63202c72
    17d8:	2c726168 	sltiu	s2,v1,24936
    17dc:	61686320 	0x61686320
    17e0:	63202c72 	0x63202c72
    17e4:	2c726168 	sltiu	s2,v1,24936
    17e8:	61686320 	0x61686320
    17ec:	63202c72 	0x63202c72
    17f0:	2c726168 	sltiu	s2,v1,24936
    17f4:	61686320 	0x61686320
    17f8:	63202c72 	0x63202c72
    17fc:	2c726168 	sltiu	s2,v1,24936
    1800:	61686320 	0x61686320
    1804:	63202c72 	0x63202c72
    1808:	2c726168 	sltiu	s2,v1,24936
    180c:	61686320 	0x61686320
    1810:	63202c72 	0x63202c72
    1814:	2c726168 	sltiu	s2,v1,24936
    1818:	61686320 	0x61686320
    181c:	63202c72 	0x63202c72
    1820:	2c726168 	sltiu	s2,v1,24936
    1824:	61686320 	0x61686320
    1828:	63202c72 	0x63202c72
    182c:	2c726168 	sltiu	s2,v1,24936
    1830:	61686320 	0x61686320
    1834:	63202c72 	0x63202c72
    1838:	2c726168 	sltiu	s2,v1,24936
    183c:	61686320 	0x61686320
    1840:	63202c72 	0x63202c72
    1844:	3e726168 	0x3e726168
    1848:	4e5a5f00 	c3	0x5a5f00
    184c:	695f5f36 	0x695f5f36
    1850:	326c706d 	andi	t4,s3,0x706d
    1854:	6e657332 	0x6e657332
    1858:	65735f64 	0x65735f64
    185c:	6c616972 	0x6c616972
    1860:	7274735f 	0x7274735f
    1864:	706e755f 	0x706e755f
    1868:	496b6361 	0x496b6361
    186c:	6363634a 	0x6363634a
    1870:	63636363 	0x63636363
    1874:	63636363 	0x63636363
    1878:	76454545 	jalx	9151514 <_mem_avail_start-0x76eaeaec>
    187c:	54704468 	bnel	v1,s0,12a20 <_mem_avail_start-0x7ffed5e0>
    1880:	6573005f 	0x6573005f
    1884:	735f646e 	0x735f646e
    1888:	61697265 	0x61697265
    188c:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
    1890:	72615f72 	0x72615f72
    1894:	35323c72 	ori	s2,t1,0x3c72
    1898:	2c30202c 	sltiu	s0,at,8236
    189c:	202c3120 	addi	t4,at,12576
    18a0:	33202c32 	andi	zero,t9,0x2c32
    18a4:	2c34202c 	sltiu	s4,at,8236
    18a8:	202c3520 	addi	t4,at,13600
    18ac:	37202c36 	ori	zero,t9,0x2c36
    18b0:	2c38202c 	sltiu	t8,at,8236
    18b4:	202c3920 	addi	t4,at,14624
    18b8:	202c3031 	addi	t4,at,12337
    18bc:	202c3131 	addi	t4,at,12593
    18c0:	202c3231 	addi	t4,at,12849
    18c4:	202c3331 	addi	t4,at,13105
    18c8:	202c3431 	addi	t4,at,13361
    18cc:	202c3531 	addi	t4,at,13617
    18d0:	202c3631 	addi	t4,at,13873
    18d4:	202c3731 	addi	t4,at,14129
    18d8:	202c3831 	addi	t4,at,14385
    18dc:	202c3931 	addi	t4,at,14641
    18e0:	202c3032 	addi	t4,at,12338
    18e4:	202c3132 	addi	t4,at,12594
    18e8:	202c3232 	addi	t4,at,12850
    18ec:	202c3332 	addi	t4,at,13106
    18f0:	003e3432 	tlt	at,s8,0xd0
    18f4:	646e6573 	0x646e6573
    18f8:	7265735f 	0x7265735f
    18fc:	5f6c6169 	0x5f6c6169
    1900:	5f727473 	0x5f727473
    1904:	61706e75 	0x61706e75
    1908:	633c6b63 	0x633c6b63
    190c:	3e726168 	0x3e726168
    1910:	6e657300 	0x6e657300
    1914:	65735f64 	0x65735f64
    1918:	6c616972 	0x6c616972
    191c:	7274735f 	0x7274735f
    1920:	7272615f 	0x7272615f
    1924:	2c36323c 	sltiu	s6,at,12860
    1928:	202c3020 	addi	t4,at,12320
    192c:	32202c31 	andi	zero,s1,0x2c31
    1930:	2c33202c 	sltiu	s3,at,8236
    1934:	202c3420 	addi	t4,at,13344
    1938:	36202c35 	ori	zero,s1,0x2c35
    193c:	2c37202c 	sltiu	s7,at,8236
    1940:	202c3820 	addi	t4,at,14368
    1944:	31202c39 	andi	zero,t1,0x2c39
    1948:	31202c30 	andi	zero,t1,0x2c30
    194c:	31202c31 	andi	zero,t1,0x2c31
    1950:	31202c32 	andi	zero,t1,0x2c32
    1954:	31202c33 	andi	zero,t1,0x2c33
    1958:	31202c34 	andi	zero,t1,0x2c34
    195c:	31202c35 	andi	zero,t1,0x2c35
    1960:	31202c36 	andi	zero,t1,0x2c36
    1964:	31202c37 	andi	zero,t1,0x2c37
    1968:	31202c38 	andi	zero,t1,0x2c38
    196c:	32202c39 	andi	zero,s1,0x2c39
    1970:	32202c30 	andi	zero,s1,0x2c30
    1974:	32202c31 	andi	zero,s1,0x2c31
    1978:	32202c32 	andi	zero,s1,0x2c32
    197c:	32202c33 	andi	zero,s1,0x2c33
    1980:	32202c34 	andi	zero,s1,0x2c34
    1984:	75003e35 	jalx	400f8d4 <_mem_avail_start-0x7bff072c>
    1988:	696c6974 	0x696c6974
    198c:	732f7974 	0x732f7974
    1990:	74726174 	jalx	1c985d0 <_mem_avail_start-0x7e367a30>
    1994:	532e7075 	beql	t9,t6,1db6c <_mem_avail_start-0x7ffe2494>
    1998:	6e6d2f00 	0x6e6d2f00
    199c:	2f632f74 	sltiu	v1,k1,12148
    19a0:	72657355 	0x72657355
    19a4:	61462f73 	0x61462f73
    19a8:	726f7463 	0x726f7463
    19ac:	4e6c6169 	c3	0x6c6169
    19b0:	776f642f 	jalx	dbd90bc <_mem_avail_start-0x72426f44>
    19b4:	616f6c6e 	0x616f6c6e
    19b8:	542f7364 	bnel	at,t7,1e74c <_mem_avail_start-0x7ffe18b4>
    19bc:	69766972 	0x69766972
    19c0:	494d6c61 	0x494d6c61
    19c4:	535f5350 	beql	k0,ra,16708 <_mem_avail_start-0x7ffe98f8>
    19c8:	7774666f 	jalx	dd199bc <_mem_avail_start-0x722e6644>
    19cc:	2f657261 	sltiu	a1,k1,29281
    19d0:	00707063 	0x707063
    19d4:	20554e47 	addi	s5,v0,20039
    19d8:	32205341 	andi	zero,s1,0x5341
    19dc:	0030332e 	0x30332e
    19e0:	5f307063 	0x5f307063
    19e4:	76646162 	jalx	9918588 <_mem_avail_start-0x766e7a78>
    19e8:	72646461 	0x72646461
    19ec:	43584500 	c0	0x1584500
    19f0:	49545045 	0x49545045
    19f4:	4d5f4e4f 	0x4d5f4e4f
    19f8:	41535345 	0x41535345
    19fc:	00534547 	0x534547
    1a00:	5f307063 	0x5f307063
    1a04:	73756163 	0x73756163
    1a08:	72700065 	0x72700065
    1a0c:	5f746e69 	0x5f746e69
    1a10:	00626c74 	teq	v1,v0,0x1b1
    1a14:	6f6f425f 	0x6f6f425f
    1a18:	7063006c 	0x7063006c
    1a1c:	70655f30 	0x70655f30
    1a20:	6d5f0063 	0x6d5f0063
    1a24:	006e6961 	0x6e6961
    1a28:	7465675f 	jalx	1959d7c <_mem_avail_start-0x7e6a6284>
    1a2c:	7561635f 	jalx	5858d7c <_mem_avail_start-0x7a7a7284>
    1a30:	5f006573 	bgtzl	t8,1b000 <_mem_avail_start-0x7ffe5000>
    1a34:	00737362 	0x737362
    1a38:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
    1a3c:	656c5f65 	0x656c5f65
    1a40:	79620064 	0x79620064
    1a44:	745f6574 	jalx	17d95d0 <_mem_avail_start-0x7e826a30>
    1a48:	65675f00 	0x65675f00
    1a4c:	70655f74 	0x70655f74
    1a50:	6e690063 	0x6e690063
    1a54:	735f7469 	0x735f7469
    1a58:	61697265 	0x61697265
    1a5c:	625f006c 	0x625f006c
    1a60:	655f7373 	0x655f7373
    1a64:	6d00646e 	0x6d00646e
    1a68:	65736d65 	0x65736d65
    1a6c:	72700074 	0x72700074
    1a70:	5f746e69 	0x5f746e69
    1a74:	70617274 	0x70617274
    1a78:	6d617266 	0x6d617266
    1a7c:	70630065 	0x70630065
    1a80:	74735f30 	jalx	1cd7cc0 <_mem_avail_start-0x7e328340>
    1a84:	73757461 	0x73757461
    1a88:	646f6300 	0x646f6300
    1a8c:	6e650065 	0x6e650065
    1a90:	5f797274 	0x5f797274
    1a94:	315f6f6c 	andi	ra,t2,0x6f6c
    1a98:	78655f00 	0x78655f00
    1a9c:	74706563 	jalx	1c1958c <_mem_avail_start-0x7e3e6a74>
    1aa0:	5f6e6f69 	0x5f6e6f69
    1aa4:	646e6168 	0x646e6168
    1aa8:	0072656c 	0x72656c
    1aac:	64646170 	0x64646170
    1ab0:	00676e69 	0x676e69
    1ab4:	746e6975 	jalx	1b9a5d4 <_mem_avail_start-0x7e465a2c>
    1ab8:	00745f38 	0x745f38
    1abc:	72746e65 	0x72746e65
    1ac0:	6f6c5f79 	0x6f6c5f79
    1ac4:	4700325f 	c1	0x100325f
    1ac8:	4320554e 	c0	0x120554e
    1acc:	37203131 	ori	zero,t9,0x3131
    1ad0:	302e342e 	andi	t6,at,0x342e
    1ad4:	656d2d20 	0x656d2d20
    1ad8:	6d2d206c 	0x6d2d206c
    1adc:	676e6973 	0x676e6973
    1ae0:	662d656c 	0x662d656c
    1ae4:	74616f6c 	jalx	185bdb0 <_mem_avail_start-0x7e7a4250>
    1ae8:	786d2d20 	0x786d2d20
    1aec:	20746f67 	addi	s4,v1,28519
    1af0:	6f6e6d2d 	0x6f6e6d2d
    1af4:	6962612d 	0x6962612d
    1af8:	6c6c6163 	0x6c6c6163
    1afc:	6d2d2073 	0x6d2d2073
    1b00:	64726168 	0x64726168
    1b04:	6f6c662d 	0x6f6c662d
    1b08:	2d207461 	sltiu	zero,t1,29793
    1b0c:	7370696d 	0x7370696d
    1b10:	2d203233 	sltiu	zero,t1,12851
    1b14:	736c6c6d 	0x736c6c6d
    1b18:	6d2d2063 	0x6d2d2063
    1b1c:	6c2d6f6e 	0x6c2d6f6e
    1b20:	2d316378 	sltiu	s1,t1,25464
    1b24:	31637873 	andi	v1,t3,0x7873
    1b28:	6e6d2d20 	0x6e6d2d20
    1b2c:	616d2d6f 	0x616d2d6f
    1b30:	20346464 	addi	s4,at,25700
    1b34:	6f6e6d2d 	0x6f6e6d2d
    1b38:	6168732d 	0x6168732d
    1b3c:	20646572 	addi	a0,v1,25970
    1b40:	62616d2d 	0x62616d2d
    1b44:	32333d69 	andi	s3,s1,0x3d69
    1b48:	20672d20 	addi	a3,v1,11552
    1b4c:	20734f2d 	addi	s3,v1,20269
    1b50:	7566662d 	jalx	59998b4 <_mem_avail_start-0x7a66674c>
    1b54:	6974636e 	0x6974636e
    1b58:	732d6e6f 	0x732d6e6f
    1b5c:	69746365 	0x69746365
    1b60:	20736e6f 	addi	s3,v1,28271
    1b64:	6164662d 	0x6164662d
    1b68:	732d6174 	0x732d6174
    1b6c:	69746365 	0x69746365
    1b70:	20736e6f 	addi	s3,v1,28271
    1b74:	7266662d 	0x7266662d
    1b78:	74736565 	jalx	1cd9594 <_mem_avail_start-0x7e326a6c>
    1b7c:	69646e61 	0x69646e61
    1b80:	2d20676e 	sltiu	zero,t1,26478
    1b84:	2d6f6e66 	sltiu	t7,t3,28262
    1b88:	6c697562 	0x6c697562
    1b8c:	206e6974 	addi	t6,v1,26996
    1b90:	6f6e662d 	0x6f6e662d
    1b94:	4549502d 	0x4549502d
    1b98:	73736200 	0x73736200
    1b9c:	7a69735f 	0x7a69735f
    1ba0:	72770065 	0x72770065
    1ba4:	5f657469 	0x5f657469
    1ba8:	6d676573 	0x6d676573
    1bac:	00746e65 	0x746e65
    1bb0:	6e697270 	0x6e697270
    1bb4:	73006674 	0x73006674
    1bb8:	74726f68 	jalx	1c9bda0 <_mem_avail_start-0x7e364260>
    1bbc:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
    1bc0:	30706300 	andi	s0,v1,0x6300
    1bc4:	6162655f 	0x6162655f
    1bc8:	75006573 	jalx	40195cc <_mem_avail_start-0x7bfe6a34>
    1bcc:	31746e69 	andi	s4,t3,0x6e69
    1bd0:	00745f36 	tne	v1,s4,0x17c
    1bd4:	746e6975 	jalx	1b9a5d4 <_mem_avail_start-0x7e465a2c>
    1bd8:	745f3233 	jalx	17cc8cc <_mem_avail_start-0x7e833734>
    1bdc:	6e6f6c00 	0x6e6f6c00
    1be0:	6e692067 	0x6e692067
    1be4:	6e650074 	0x6e650074
    1be8:	5f797274 	0x5f797274
    1bec:	70006968 	0x70006968
    1bf0:	00737475 	0x737475
    1bf4:	6c697475 	0x6c697475
    1bf8:	2f797469 	sltiu	t9,k1,29801
    1bfc:	6e69616d 	0x6e69616d
    1c00:	7200632e 	0x7200632e
    1c04:	6c757365 	0x6c757365
    1c08:	73610074 	0x73610074
    1c0c:	74726573 	jalx	1c995cc <_mem_avail_start-0x7e366a34>
    1c10:	006e6f69 	0x6e6f69
    1c14:	70617274 	0x70617274
    1c18:	6d617266 	0x6d617266
    1c1c:	00745f65 	0x745f65
    1c20:	63747570 	0x63747570
    1c24:	00726168 	0x726168
    1c28:	6e697270 	0x6e697270
    1c2c:	73616274 	0x73616274
    1c30:	72700065 	0x72700065
    1c34:	66746e69 	0x66746e69
    1c38:	6100632e 	0x6100632e
    1c3c:	6e696167 	0x6e696167
    1c40:	6e6d2f00 	0x6e6d2f00
    1c44:	2f632f74 	sltiu	v1,k1,12148
    1c48:	72657355 	0x72657355
    1c4c:	61462f73 	0x61462f73
    1c50:	726f7463 	0x726f7463
    1c54:	4e6c6169 	c3	0x6c6169
    1c58:	776f642f 	jalx	dbd90bc <_mem_avail_start-0x72426f44>
    1c5c:	616f6c6e 	0x616f6c6e
    1c60:	542f7364 	bnel	at,t7,1e9f4 <_mem_avail_start-0x7ffe160c>
    1c64:	69766972 	0x69766972
    1c68:	494d6c61 	0x494d6c61
    1c6c:	535f5350 	beql	k0,ra,169b0 <_mem_avail_start-0x7ffe9650>
    1c70:	7774666f 	jalx	dd199bc <_mem_avail_start-0x722e6644>
    1c74:	2f657261 	sltiu	a1,k1,29281
    1c78:	2f707063 	sltiu	s0,k1,28771
    1c7c:	0062696c 	0x62696c
    1c80:	73747570 	0x73747570
    1c84:	6e697274 	0x6e697274
    1c88:	61760067 	0x61760067
    1c8c:	0065756c 	0x65756c
    1c90:	6e697270 	0x6e697270
    1c94:	73616274 	0x73616274
    1c98:	00632e65 	0x632e65
    1c9c:	6e676973 	0x6e676973
    1ca0:	6d656d00 	0x6d656d00
    1ca4:	65766f6d 	0x65766f6d
    1ca8:	657a6200 	0x657a6200
    1cac:	73006f72 	0x73006f72
    1cb0:	6e697274 	0x6e697274
    1cb4:	00632e67 	0x632e67
    1cb8:	657a6973 	0x657a6973
    1cbc:	6d00745f 	0x6d00745f
    1cc0:	6d636d65 	0x6d636d65
    1cc4:	74730070 	jalx	1cc01c0 <_mem_avail_start-0x7e33fe40>
    1cc8:	70636e72 	0x70636e72
    1ccc:	74730079 	jalx	1cc01e4 <_mem_avail_start-0x7e33fe1c>
    1cd0:	656c6e72 	0x656c6e72
    1cd4:	7473006e 	jalx	1cc01b8 <_mem_avail_start-0x7e33fe48>
    1cd8:	72686372 	0x72686372
    1cdc:	72747300 	0x72747300
    1ce0:	00797063 	0x797063
    1ce4:	63727473 	0x63727473
    1ce8:	6d00706d 	0x6d00706d
    1cec:	70636d65 	0x70636d65
    1cf0:	74730079 	jalx	1cc01e4 <_mem_avail_start-0x7e33fe1c>
    1cf4:	6e656c72 	0x6e656c72
    1cf8:	72747300 	0x72747300
    1cfc:	706d636e 	0x706d636e
    1d00:	72747300 	0x72747300
    1d04:	646e6966 	0x646e6966
    1d08:	74757000 	jalx	1d5c000 <_mem_avail_start-0x7e2a4000>
    1d0c:	00632e73 	tltu	v1,v1,0xb9
    1d10:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
    1d14:	65735f65 	0x65735f65
    1d18:	6c616972 	0x6c616972
    1d1c:	74757000 	jalx	1d5c000 <_mem_avail_start-0x7e2a4000>
    1d20:	72616863 	0x72616863
    1d24:	7700632e 	jalx	c018cb8 <_mem_avail_start-0x73fe7348>
    1d28:	65746972 	0x65746972
    1d2c:	6f77685f 	0x6f77685f
    1d30:	5f006472 	bgtzl	t8,1aefc <_mem_avail_start-0x7ffe5104>
    1d34:	7277355a 	0x7277355a
    1d38:	49657469 	0x49657469
    1d3c:	5076456a 	beql	v1,s6,132e8 <_mem_avail_start-0x7ffecd18>
    1d40:	005f5476 	tne	v0,ra,0x151
    1d44:	64616572 	0x64616572
    1d48:	6977735f 	0x6977735f
    1d4c:	65686374 	0x65686374
    1d50:	72770073 	0x72770073
    1d54:	5f657469 	0x5f657469
    1d58:	64726f77 	0x64726f77
    1d5c:	74616400 	jalx	1859000 <_mem_avail_start-0x7e7a7000>
    1d60:	72770061 	0x72770061
    1d64:	5f657469 	0x5f657469
    1d68:	65747962 	0x65747962
    1d6c:	345a5f00 	ori	k0,v0,0x5f00
    1d70:	64616572 	0x64616572
    1d74:	54456d49 	bnel	v0,a1,1d29c <_mem_avail_start-0x7ffe2d64>
    1d78:	0076505f 	0x76505f
    1d7c:	746e6975 	jalx	1b9a5d4 <_mem_avail_start-0x7e465a2c>
    1d80:	745f3436 	jalx	17cd0d8 <_mem_avail_start-0x7e832f28>
    1d84:	69727700 	0x69727700
    1d88:	753c6574 	jalx	4f195d0 <_mem_avail_start-0x7b0e6a30>
    1d8c:	6769736e 	0x6769736e
    1d90:	2064656e 	addi	a0,v1,25966
    1d94:	72616863 	0x72616863
    1d98:	6572003e 	0x6572003e
    1d9c:	685f6461 	0x685f6461
    1da0:	64726f77 	0x64726f77
    1da4:	355a5f00 	ori	k0,t2,0x5f00
    1da8:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
    1dac:	456d4965 	0x456d4965
    1db0:	54765076 	bnel	v1,s6,15f8c <_mem_avail_start-0x7ffea074>
    1db4:	5a5f005f 	0x5a5f005f
    1db8:	61657234 	0x61657234
    1dbc:	45744964 	0x45744964
    1dc0:	76505f54 	jalx	9417d50 <_mem_avail_start-0x76be82b0>
    1dc4:	69727700 	0x69727700
    1dc8:	6c3c6574 	0x6c3c6574
    1dcc:	20676e6f 	addi	a3,v1,28271
    1dd0:	69736e75 	0x69736e75
    1dd4:	64656e67 	0x64656e67
    1dd8:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
    1ddc:	7277003e 	0x7277003e
    1de0:	5f657469 	0x5f657469
    1de4:	726f7764 	0x726f7764
    1de8:	65720064 	0x65720064
    1dec:	6c3c6461 	0x6c3c6461
    1df0:	20676e6f 	addi	a3,v1,28271
    1df4:	69736e75 	0x69736e75
    1df8:	64656e67 	0x64656e67
    1dfc:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
    1e00:	6572003e 	0x6572003e
    1e04:	735f6461 	0x735f6461
    1e08:	61697265 	0x61697265
    1e0c:	6f775f6c 	0x6f775f6c
    1e10:	64006472 	0x64006472
    1e14:	64726f77 	0x64726f77
    1e18:	5f00745f 	bgtzl	t8,1ef98 <_mem_avail_start-0x7ffe1068>
    1e1c:	6572345a 	0x6572345a
    1e20:	68496461 	0x68496461
    1e24:	505f5445 	beql	v0,ra,16f3c <_mem_avail_start-0x7ffe90c4>
    1e28:	72770076 	0x72770076
    1e2c:	3c657469 	0x3c657469
    1e30:	726f6873 	0x726f6873
    1e34:	6e752074 	0x6e752074
    1e38:	6e676973 	0x6e676973
    1e3c:	69206465 	0x69206465
    1e40:	003e746e 	0x3e746e
    1e44:	64616572 	0x64616572
    1e48:	736e753c 	0x736e753c
    1e4c:	656e6769 	0x656e6769
    1e50:	68632064 	0x68632064
    1e54:	003e7261 	0x3e7261
    1e58:	6863616d 	0x6863616d
    1e5c:	2e656e69 	sltiu	a1,s3,28265
    1e60:	00707063 	0x707063
    1e64:	64616572 	0x64616572
    1e68:	6f77645f 	0x6f77645f
    1e6c:	5f006472 	bgtzl	t8,1b038 <_mem_avail_start-0x7ffe4fc8>
    1e70:	7277355a 	0x7277355a
    1e74:	49657469 	0x49657469
    1e78:	50764568 	beql	v1,s6,1341c <_mem_avail_start-0x7ffecbe4>
    1e7c:	005f5476 	tne	v0,ra,0x151
    1e80:	64616572 	0x64616572
    1e84:	736e753c 	0x736e753c
    1e88:	656e6769 	0x656e6769
    1e8c:	6e692064 	0x6e692064
    1e90:	5f003e74 	bgtzl	t8,11864 <_mem_avail_start-0x7ffee79c>
    1e94:	7277355a 	0x7277355a
    1e98:	49657469 	0x49657469
    1e9c:	50764574 	beql	v1,s6,13470 <_mem_avail_start-0x7ffecb90>
    1ea0:	005f5476 	tne	v0,ra,0x151
    1ea4:	72345a5f 	0x72345a5f
    1ea8:	49646165 	0x49646165
    1eac:	5f54456a 	0x5f54456a
    1eb0:	72007650 	0x72007650
    1eb4:	5f646165 	0x5f646165
    1eb8:	69726573 	0x69726573
    1ebc:	72006c61 	0x72006c61
    1ec0:	5f646165 	0x5f646165
    1ec4:	64726f77 	0x64726f77
    1ec8:	61657200 	0x61657200
    1ecc:	68733c64 	0x68733c64
    1ed0:	2074726f 	addi	s4,v1,29295
    1ed4:	69736e75 	0x69736e75
    1ed8:	64656e67 	0x64656e67
    1edc:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
    1ee0:	7768003e 	jalx	da000f8 <_mem_avail_start-0x725fff08>
    1ee4:	5f64726f 	0x5f64726f
    1ee8:	65720074 	0x65720074
    1eec:	625f6461 	0x625f6461
    1ef0:	00657479 	0x657479
    1ef4:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
    1ef8:	6e753c65 	0x6e753c65
    1efc:	6e676973 	0x6e676973
    1f00:	69206465 	0x69206465
    1f04:	003e746e 	0x3e746e

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
  18:	bfc00ba4 	cache	0x0,2980(s8)
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
  5c:	bfc00c6c 	cache	0x0,3180(s8)
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
  88:	bfc00d04 	cache	0x0,3332(s8)
  8c:	00000068 	0x68
  90:	44280e44 	0x44280e44
  94:	92500391 	lbu	s0,913(s2)
  98:	9f049002 	0x9f049002
  9c:	0e500201 	jal	9400804 <_mem_avail_start-0x76bff7fc>
  a0:	d2d1d000 	0xd2d1d000
  a4:	000000df 	0xdf
  a8:	00000024 	and	zero,zero,zero
  ac:	00000000 	nop
  b0:	bfc00d6c 	cache	0x0,3436(s8)
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
  e8:	bfc00e20 	cache	0x0,3616(s8)
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
 128:	bfc01044 	cache	0x0,4164(s8)
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
 1e4:	bfc0111c 	cache	0x0,4380(s8)
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
 244:	bfc01140 	cache	0x0,4416(s8)
 248:	00000060 	0x60
 24c:	50200e44 	beqzl	at,3b60 <_mem_avail_start-0x7fffc4a0>
 250:	03910292 	0x3910292
 254:	0490019f 	bltzal	a0,8d4 <_mem_avail_start-0x7ffff72c>
 258:	000e0a6c 	0xe0a6c
 25c:	dfd2d1d0 	ldc3	$18,-11824(s8)
 260:	0000000b 	movn	zero,zero,zero
 264:	00000018 	mult	zero,zero
 268:	0000022c 	0x22c
 26c:	bfc011a0 	cache	0x0,4512(s8)
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
 298:	bfc011d0 	cache	0x0,4560(s8)
 29c:	0000002c 	0x2c
 2a0:	44180e44 	0x44180e44
 2a4:	9f480290 	0x9f480290
 2a8:	000e5c01 	0xe5c01
 2ac:	0000dfd0 	0xdfd0
