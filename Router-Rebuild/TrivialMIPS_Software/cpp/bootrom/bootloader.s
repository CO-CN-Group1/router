
bootloader.bootrom.elf:     file format elf32-tradlittlemips
bootloader.bootrom.elf


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
bfc00030:	0ff00292 	jal	bfc00a48 <_main>
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
bfc00440:	0ff00304 	jal	bfc00c10 <_exception_handler>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:127
    nop
bfc00444:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:128
    j _loop
bfc00448:	0bf0000e 	j	bfc00038 <_loop>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:129
    nop
bfc0044c:	00000000 	nop

bfc00450 <_Z25toggle_kseg0_cacheabilityb>:
_Z25toggle_kseg0_cacheabilityb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:22
extern byte_t _mem_start, _mem_end;
extern byte_t _mem_avail_start, _mem_avail_end;

void toggle_kseg0_cacheability(bool cacheable) {
    uint32_t cp0_config0;
    asm volatile("mfc0 %0, $16, 0;" :"=r"(cp0_config0));
bfc00450:	40028000 	mfc0	v0,c0_config
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:23
    cp0_config0 &= ~0x7; // remove last 3 bits (K0)
bfc00454:	2403fff8 	li	v1,-8
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:24
    cp0_config0 |= cacheable ? 0x3 : 0x2; // set last 3 bits (K0)
bfc00458:	0004202b 	sltu	a0,zero,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:23
    cp0_config0 &= ~0x7; // remove last 3 bits (K0)
bfc0045c:	00431024 	and	v0,v0,v1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:24
    cp0_config0 |= cacheable ? 0x3 : 0x2; // set last 3 bits (K0)
bfc00460:	24840002 	addiu	a0,a0,2
bfc00464:	00822025 	or	a0,a0,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:26
    asm volatile("mtc0 %0, $16, 0;" ::"r"(cp0_config0));
}
bfc00468:	03e00008 	jr	ra
bfc0046c:	40848000 	mtc0	a0,c0_config

bfc00470 <_Z9boot_addrPv>:
_Z9boot_addrPv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:28

void boot_addr(void *addr) {
bfc00470:	27bdffe8 	addiu	sp,sp,-24
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:29
    printf("Booting from address 0x%p...\n", addr);
bfc00474:	00802825 	move	a1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:28
void boot_addr(void *addr) {
bfc00478:	afb00010 	sw	s0,16(sp)
bfc0047c:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:29
    printf("Booting from address 0x%p...\n", addr);
bfc00480:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:28
void boot_addr(void *addr) {
bfc00484:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:29
    printf("Booting from address 0x%p...\n", addr);
bfc00488:	0ff00331 	jal	bfc00cc4 <printf>
bfc0048c:	24841488 	addiu	a0,a0,5256
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:30
    puts("=====Exiting TrivialBootloader=====");
bfc00490:	3c04bfc0 	lui	a0,0xbfc0
bfc00494:	0ff0041c 	jal	bfc01070 <puts>
bfc00498:	248414a8 	addiu	a0,a0,5288
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:31
    toggle_kseg0_cacheability(true);
bfc0049c:	0ff00114 	jal	bfc00450 <_Z25toggle_kseg0_cacheabilityb>
bfc004a0:	24040001 	li	a0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:32
    asm volatile("jr %0;" ::"r"(addr));
bfc004a4:	02000008 	jr	s0
bfc004a8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:33
}
bfc004ac:	8fbf0014 	lw	ra,20(sp)
bfc004b0:	8fb00010 	lw	s0,16(sp)
bfc004b4:	03e00008 	jr	ra
bfc004b8:	27bd0018 	addiu	sp,sp,24

bfc004bc <_Z13check_overlapPvj>:
_Z13check_overlapPvj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:39


void check_overlap(void *addr, uint32_t length) {
    auto start_addr = reinterpret_cast<byte_t* const>(addr);
    auto end_addr = start_addr + length;
    if ((start_addr >= &_mem_start && start_addr < &_mem_end) ||
bfc004bc:	3c028800 	lui	v0,0x8800
bfc004c0:	24420000 	addiu	v0,v0,0
bfc004c4:	0082182b 	sltu	v1,a0,v0
bfc004c8:	14600006 	bnez	v1,bfc004e4 <_Z13check_overlapPvj+0x28>
bfc004cc:	00852821 	addu	a1,a0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:39 (discriminator 1)
bfc004d0:	3c038801 	lui	v1,0x8801
bfc004d4:	24630000 	addiu	v1,v1,0
bfc004d8:	0083202b 	sltu	a0,a0,v1
bfc004dc:	14800008 	bnez	a0,bfc00500 <_Z13check_overlapPvj+0x44>
bfc004e0:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:39 (discriminator 3)
bfc004e4:	00a2102b 	sltu	v0,a1,v0
bfc004e8:	1440000d 	bnez	v0,bfc00520 <_Z13check_overlapPvj+0x64>
bfc004ec:	3c028801 	lui	v0,0x8801
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:40
        (end_addr >= &_mem_start && end_addr < &_mem_end)) {
bfc004f0:	24420000 	addiu	v0,v0,0
bfc004f4:	00a2282b 	sltu	a1,a1,v0
bfc004f8:	10a00009 	beqz	a1,bfc00520 <_Z13check_overlapPvj+0x64>
bfc004fc:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:36
void check_overlap(void *addr, uint32_t length) {
bfc00500:	27bdffe8 	addiu	sp,sp,-24
bfc00504:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:41
        puts("ERROR: Program and bootloader memory overlap.");
bfc00508:	0ff0041c 	jal	bfc01070 <puts>
bfc0050c:	248414cc 	addiu	a0,a0,5324
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:42
        panic();
bfc00510:	00000034 	teq	zero,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:44
    }
}
bfc00514:	8fbf0014 	lw	ra,20(sp)
bfc00518:	03e00008 	jr	ra
bfc0051c:	27bd0018 	addiu	sp,sp,24
bfc00520:	03e00008 	jr	ra
bfc00524:	00000000 	nop

bfc00528 <_Z14wait_for_magicv>:
_Z14wait_for_magicv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:47


void wait_for_magic() {
bfc00528:	27bdffe0 	addiu	sp,sp,-32
bfc0052c:	afb20018 	sw	s2,24(sp)
bfc00530:	afb10014 	sw	s1,20(sp)
bfc00534:	afb00010 	sw	s0,16(sp)
bfc00538:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:48
    uint32_t count = 0;
bfc0053c:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:50
    while (count < 4) {
        if (read_serial() == 0x23)
bfc00540:	24120023 	li	s2,35
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:49
    while (count < 4) {
bfc00544:	24110004 	li	s1,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:50
        if (read_serial() == 0x23)
bfc00548:	0ff004f1 	jal	bfc013c4 <read_serial>
bfc0054c:	00000000 	nop
bfc00550:	14520009 	bne	v0,s2,bfc00578 <_Z14wait_for_magicv+0x50>
bfc00554:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:51
            ++count;
bfc00558:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:49
    while (count < 4) {
bfc0055c:	1611fffa 	bne	s0,s1,bfc00548 <_Z14wait_for_magicv+0x20>
bfc00560:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:55
        else
            count = 0;
    }
}
bfc00564:	8fb20018 	lw	s2,24(sp)
bfc00568:	8fb10014 	lw	s1,20(sp)
bfc0056c:	8fb00010 	lw	s0,16(sp)
bfc00570:	03e00008 	jr	ra
bfc00574:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:53
            count = 0;
bfc00578:	1000fff3 	b	bfc00548 <_Z14wait_for_magicv+0x20>
bfc0057c:	00008025 	move	s0,zero

bfc00580 <_Z15copy_from_flashPv>:
_Z15copy_from_flashPv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:61


void *copy_from_flash(void *addr) {
    auto *ehdr = reinterpret_cast<elf32_ehdr *>(addr);

    if (ehdr->e_ident[0] != ELF_MAGIC) {
bfc00580:	3c02464c 	lui	v0,0x464c
bfc00584:	8c830000 	lw	v1,0(a0)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:58
void *copy_from_flash(void *addr) {
bfc00588:	27bdffd0 	addiu	sp,sp,-48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:61
    if (ehdr->e_ident[0] != ELF_MAGIC) {
bfc0058c:	2442457f 	addiu	v0,v0,17791
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:58
void *copy_from_flash(void *addr) {
bfc00590:	afb10014 	sw	s1,20(sp)
bfc00594:	afbf002c 	sw	ra,44(sp)
bfc00598:	afb60028 	sw	s6,40(sp)
bfc0059c:	afb50024 	sw	s5,36(sp)
bfc005a0:	afb40020 	sw	s4,32(sp)
bfc005a4:	afb3001c 	sw	s3,28(sp)
bfc005a8:	afb20018 	sw	s2,24(sp)
bfc005ac:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:61
    if (ehdr->e_ident[0] != ELF_MAGIC) {
bfc005b0:	10620006 	beq	v1,v0,bfc005cc <_Z15copy_from_flashPv+0x4c>
bfc005b4:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:62
        printf("ERROR: No valid ELF magic found in address 0x%p.\n",
bfc005b8:	00802825 	move	a1,a0
bfc005bc:	3c04bfc0 	lui	a0,0xbfc0
bfc005c0:	0ff00331 	jal	bfc00cc4 <printf>
bfc005c4:	248414fc 	addiu	a0,a0,5372
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:64
               ehdr->e_ident);
        panic();
bfc005c8:	00000034 	teq	zero,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:67
    }

    if (ehdr->e_machine != EM_MIPS) {
bfc005cc:	96250012 	lhu	a1,18(s1)
bfc005d0:	24020008 	li	v0,8
bfc005d4:	10a20005 	beq	a1,v0,bfc005ec <_Z15copy_from_flashPv+0x6c>
bfc005d8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:68
        printf("ERROR: Machine type %d of ELF file does not match the CPU.\n",
bfc005dc:	3c04bfc0 	lui	a0,0xbfc0
bfc005e0:	0ff00331 	jal	bfc00cc4 <printf>
bfc005e4:	24841530 	addiu	a0,a0,5424
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:70
               ehdr->e_machine);
        panic();
bfc005e8:	00000034 	teq	zero,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:73
    }

    puts("Valid ELF file found, will now copy to RAM.");
bfc005ec:	3c04bfc0 	lui	a0,0xbfc0
bfc005f0:	0ff0041c 	jal	bfc01070 <puts>
bfc005f4:	2484156c 	addiu	a0,a0,5484
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:77

    auto *phdr = reinterpret_cast<elf32_phdr *>((uint32_t)addr + ehdr->e_phoff);
    auto *last_phdr = reinterpret_cast<elf32_phdr *>(
        (uint32_t)phdr + (ehdr->e_phentsize * ehdr->e_phnum));
bfc005f8:	9635002a 	lhu	s5,42(s1)
bfc005fc:	9622002c 	lhu	v0,44(s1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:75
    auto *phdr = reinterpret_cast<elf32_phdr *>((uint32_t)addr + ehdr->e_phoff);
bfc00600:	8e30001c 	lw	s0,28(s1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:77
        (uint32_t)phdr + (ehdr->e_phentsize * ehdr->e_phnum));
bfc00604:	72a21802 	mul	v1,s5,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:75
    auto *phdr = reinterpret_cast<elf32_phdr *>((uint32_t)addr + ehdr->e_phoff);
bfc00608:	02308021 	addu	s0,s1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:79

    auto off = (phdr->p_vaddr - phdr->p_paddr);
bfc0060c:	8e120008 	lw	s2,8(s0)
bfc00610:	8e02000c 	lw	v0,12(s0)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:82

    while (phdr < last_phdr) {
        printf("Copying %d bytes from offset 0x%p to address 0x%p\n",
bfc00614:	3c14bfc0 	lui	s4,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:77
        (uint32_t)phdr + (ehdr->e_phentsize * ehdr->e_phnum));
bfc00618:	0070a821 	addu	s5,v1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:79
    auto off = (phdr->p_vaddr - phdr->p_paddr);
bfc0061c:	02429023 	subu	s2,s2,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:82
        printf("Copying %d bytes from offset 0x%p to address 0x%p\n",
bfc00620:	26941598 	addiu	s4,s4,5528
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:81
    while (phdr < last_phdr) {
bfc00624:	0215102b 	sltu	v0,s0,s5
bfc00628:	10400012 	beqz	v0,bfc00674 <_Z15copy_from_flashPv+0xf4>
bfc0062c:	8fbf002c 	lw	ra,44(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:82
        printf("Copying %d bytes from offset 0x%p to address 0x%p\n",
bfc00630:	8e07000c 	lw	a3,12(s0)
bfc00634:	8e060004 	lw	a2,4(s0)
bfc00638:	8e050010 	lw	a1,16(s0)
bfc0063c:	0ff00331 	jal	bfc00cc4 <printf>
bfc00640:	02802025 	move	a0,s4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:84
               phdr->p_filesz, phdr->p_offset, phdr->p_paddr);
        auto *dest = reinterpret_cast<byte_t *>(phdr->p_paddr);
bfc00644:	8e16000c 	lw	s6,12(s0)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:86
        auto *source =
            reinterpret_cast<byte_t *>((uint32_t)addr + phdr->p_offset);
bfc00648:	8e130004 	lw	s3,4(s0)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:87
        check_overlap(dest, phdr->p_filesz);
bfc0064c:	8e050010 	lw	a1,16(s0)
bfc00650:	0ff0012f 	jal	bfc004bc <_Z13check_overlapPvj>
bfc00654:	02c02025 	move	a0,s6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:86
            reinterpret_cast<byte_t *>((uint32_t)addr + phdr->p_offset);
bfc00658:	02339821 	addu	s3,s1,s3
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:88
        memcpy(dest, source, phdr->p_filesz);
bfc0065c:	8e060010 	lw	a2,16(s0)
bfc00660:	02602825 	move	a1,s3
bfc00664:	0ff003f9 	jal	bfc00fe4 <memcpy>
bfc00668:	02c02025 	move	a0,s6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:81
    while (phdr < last_phdr) {
bfc0066c:	1000ffed 	b	bfc00624 <_Z15copy_from_flashPv+0xa4>
bfc00670:	26100020 	addiu	s0,s0,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:92
        ++phdr;
    }

    return reinterpret_cast<void *>(ehdr->e_entry - off);
bfc00674:	8e220018 	lw	v0,24(s1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:93
}
bfc00678:	00521023 	subu	v0,v0,s2
bfc0067c:	8fb60028 	lw	s6,40(sp)
bfc00680:	8fb50024 	lw	s5,36(sp)
bfc00684:	8fb40020 	lw	s4,32(sp)
bfc00688:	8fb3001c 	lw	s3,28(sp)
bfc0068c:	8fb20018 	lw	s2,24(sp)
bfc00690:	8fb10014 	lw	s1,20(sp)
bfc00694:	8fb00010 	lw	s0,16(sp)
bfc00698:	03e00008 	jr	ra
bfc0069c:	27bd0030 	addiu	sp,sp,48

bfc006a0 <_Z14load_from_uartv>:
_Z14load_from_uartv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:97


void *load_from_uart() {
    putstring("Send uint32 sequence: 0x23232323 OFFSET LENGTH");
bfc006a0:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:96
void *load_from_uart() {
bfc006a4:	27bdffd8 	addiu	sp,sp,-40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:97
    putstring("Send uint32 sequence: 0x23232323 OFFSET LENGTH");
bfc006a8:	248415cc 	addiu	a0,a0,5580
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:96
void *load_from_uart() {
bfc006ac:	afbf0024 	sw	ra,36(sp)
bfc006b0:	afb3001c 	sw	s3,28(sp)
bfc006b4:	afb20018 	sw	s2,24(sp)
bfc006b8:	afb10014 	sw	s1,20(sp)
bfc006bc:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:97
    putstring("Send uint32 sequence: 0x23232323 OFFSET LENGTH");
bfc006c0:	0ff00404 	jal	bfc01010 <putstring>
bfc006c4:	afb40020 	sw	s4,32(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:98
    puts(" ENTRY DATA...");
bfc006c8:	3c04bfc0 	lui	a0,0xbfc0
bfc006cc:	0ff0041c 	jal	bfc01070 <puts>
bfc006d0:	248415fc 	addiu	a0,a0,5628
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:100

    wait_for_magic();
bfc006d4:	0ff0014a 	jal	bfc00528 <_Z14wait_for_magicv>
bfc006d8:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:102

    auto *offset = reinterpret_cast<volatile byte_t *>(read_serial_word());
bfc006dc:	0ff00501 	jal	bfc01404 <read_serial_word>
bfc006e0:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:103
    word_t length = read_serial_word();
bfc006e4:	0ff00501 	jal	bfc01404 <read_serial_word>
bfc006e8:	00408825 	move	s1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:104
    auto *entry = reinterpret_cast<byte_t *>(read_serial_word());
bfc006ec:	0ff00501 	jal	bfc01404 <read_serial_word>
bfc006f0:	00409025 	move	s2,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:106

    printf("Offset: 0x%p, length: %d bytes, entry: 0x%p. Start receiving data...\n",
bfc006f4:	3c04bfc0 	lui	a0,0xbfc0
bfc006f8:	00403825 	move	a3,v0
bfc006fc:	02403025 	move	a2,s2
bfc00700:	02202825 	move	a1,s1
bfc00704:	2484160c 	addiu	a0,a0,5644
bfc00708:	0ff00331 	jal	bfc00cc4 <printf>
bfc0070c:	00409825 	move	s3,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:109
           offset, length, entry);

    check_overlap((void*)offset, length);
bfc00710:	02402825 	move	a1,s2
bfc00714:	0ff0012f 	jal	bfc004bc <_Z13check_overlapPvj>
bfc00718:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:111 (discriminator 3)

    for (size_t i = 0; i < length; ++i) {
bfc0071c:	12120006 	beq	s0,s2,bfc00738 <_Z14load_from_uartv+0x98>
bfc00720:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:112 (discriminator 2)
        offset[i] = read_serial();
bfc00724:	0ff004f1 	jal	bfc013c4 <read_serial>
bfc00728:	0211a021 	addu	s4,s0,s1
bfc0072c:	a2820000 	sb	v0,0(s4)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:111 (discriminator 2)
    for (size_t i = 0; i < length; ++i) {
bfc00730:	1000fffa 	b	bfc0071c <_Z14load_from_uartv+0x7c>
bfc00734:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:115
    }

    puts("Done receiving data.");
bfc00738:	3c04bfc0 	lui	a0,0xbfc0
bfc0073c:	0ff0041c 	jal	bfc01070 <puts>
bfc00740:	24841654 	addiu	a0,a0,5716
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:118

    return entry;
}
bfc00744:	8fbf0024 	lw	ra,36(sp)
bfc00748:	02601025 	move	v0,s3
bfc0074c:	8fb40020 	lw	s4,32(sp)
bfc00750:	8fb3001c 	lw	s3,28(sp)
bfc00754:	8fb20018 	lw	s2,24(sp)
bfc00758:	8fb10014 	lw	s1,20(sp)
bfc0075c:	8fb00010 	lw	s0,16(sp)
bfc00760:	03e00008 	jr	ra
bfc00764:	27bd0028 	addiu	sp,sp,40

bfc00768 <_entry>:
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:121


int _entry() {
bfc00768:	27bdffd0 	addiu	sp,sp,-48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:123

    toggle_kseg0_cacheability(false);
bfc0076c:	00002025 	move	a0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:121
int _entry() {
bfc00770:	afbf002c 	sw	ra,44(sp)
bfc00774:	afb50028 	sw	s5,40(sp)
bfc00778:	afb40024 	sw	s4,36(sp)
bfc0077c:	afb30020 	sw	s3,32(sp)
bfc00780:	afb2001c 	sw	s2,28(sp)
bfc00784:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:123
    toggle_kseg0_cacheability(false);
bfc00788:	0ff00114 	jal	bfc00450 <_Z25toggle_kseg0_cacheabilityb>
bfc0078c:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:125

    write_segment(0x11000001);
bfc00790:	3c041100 	lui	a0,0x1100
bfc00794:	0ff00518 	jal	bfc01460 <write_segment>
bfc00798:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:127

    auto switches = (byte_t) read_switches();
bfc0079c:	0ff0051d 	jal	bfc01474 <read_switches>
bfc007a0:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:129

    if (switches & WAIT_BOOT) {
bfc007a4:	30420020 	andi	v0,v0,0x20
bfc007a8:	10400011 	beqz	v0,bfc007f0 <_entry+0x88>
bfc007ac:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:130
        puts("Waiting for 2 seconds...");
bfc007b0:	3c04bfc0 	lui	a0,0xbfc0
bfc007b4:	2484166c 	addiu	a0,a0,5740
bfc007b8:	0ff0041c 	jal	bfc01070 <puts>
bfc007bc:	3c10bff0 	lui	s0,0xbff0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:131
        auto now = read_word(TIMER_CYCLE_ADDR);
bfc007c0:	0ff004e0 	jal	bfc01380 <read_word>
bfc007c4:	3604e000 	ori	a0,s0,0xe000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:132
        while (read_word(TIMER_CYCLE_ADDR) - now < 200000000);
bfc007c8:	3c110beb 	lui	s1,0xbeb
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:131
        auto now = read_word(TIMER_CYCLE_ADDR);
bfc007cc:	00409025 	move	s2,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:132
        while (read_word(TIMER_CYCLE_ADDR) - now < 200000000);
bfc007d0:	3610e000 	ori	s0,s0,0xe000
bfc007d4:	3631c200 	ori	s1,s1,0xc200
bfc007d8:	0ff004e0 	jal	bfc01380 <read_word>
bfc007dc:	02002025 	move	a0,s0
bfc007e0:	00521023 	subu	v0,v0,s2
bfc007e4:	0051102b 	sltu	v0,v0,s1
bfc007e8:	1440fffb 	bnez	v0,bfc007d8 <_entry+0x70>
bfc007ec:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:135
    }

    puts("=====Entering TrivialBootloader=====");
bfc007f0:	3c04bfc0 	lui	a0,0xbfc0
bfc007f4:	0ff0041c 	jal	bfc01070 <puts>
bfc007f8:	24841688 	addiu	a0,a0,5768
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:137

    printf("Bootloader used memory: from 0x%x to 0x%x\n", &_mem_start, &_mem_end);
bfc007fc:	3c068801 	lui	a2,0x8801
bfc00800:	3c058800 	lui	a1,0x8800
bfc00804:	3c04bfc0 	lui	a0,0xbfc0
bfc00808:	24c60000 	addiu	a2,a2,0
bfc0080c:	24a50000 	addiu	a1,a1,0
bfc00810:	0ff00331 	jal	bfc00cc4 <printf>
bfc00814:	248416b0 	addiu	a0,a0,5808
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:139

    write_segment(0x11000002);
bfc00818:	3c041100 	lui	a0,0x1100
bfc0081c:	0ff00518 	jal	bfc01460 <write_segment>
bfc00820:	24840002 	addiu	a0,a0,2
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:141

    switches = (byte_t) read_switches();
bfc00824:	0ff0051d 	jal	bfc01474 <read_switches>
bfc00828:	00000000 	nop
bfc0082c:	00408025 	move	s0,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:143

    if (switches & CHECK_SRAM) {
bfc00830:	00021600 	sll	v0,v0,0x18
bfc00834:	00021603 	sra	v0,v0,0x18
bfc00838:	0441000b 	bgez	v0,bfc00868 <_entry+0x100>
bfc0083c:	3c058800 	lui	a1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:144
        if (!test_memory(&_mem_avail_start, &_mem_avail_end)) {
bfc00840:	3c048000 	lui	a0,0x8000
bfc00844:	24a50000 	addiu	a1,a1,0
bfc00848:	0ff00433 	jal	bfc010cc <_Z11test_memoryPvS_>
bfc0084c:	24840000 	addiu	a0,a0,0
bfc00850:	14400015 	bnez	v0,bfc008a8 <_entry+0x140>
bfc00854:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:145
            puts("Memory test failed. Abort.");
bfc00858:	3c04bfc0 	lui	a0,0xbfc0
bfc0085c:	0ff0041c 	jal	bfc01070 <puts>
bfc00860:	248416dc 	addiu	a0,a0,5852
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:146
            panic();
bfc00864:	00000034 	teq	zero,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:152
        } else {
            puts("Memory test succeeded.");
        }
    }

    write_segment(0x11000003);
bfc00868:	3c041100 	lui	a0,0x1100
bfc0086c:	24840003 	addiu	a0,a0,3
bfc00870:	0ff00518 	jal	bfc01460 <write_segment>
bfc00874:	32100040 	andi	s0,s0,0x40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:154

    if (switches & BZERO_MEM) {
bfc00878:	12000013 	beqz	s0,bfc008c8 <_entry+0x160>
bfc0087c:	3c041100 	lui	a0,0x1100
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:155
        for (auto start = (volatile uint32_t*)&_mem_avail_start; start < (uint32_t*)&_mem_avail_end; ++start) {
bfc00880:	3c028000 	lui	v0,0x8000
bfc00884:	3c038800 	lui	v1,0x8800
bfc00888:	24420000 	addiu	v0,v0,0
bfc0088c:	24630000 	addiu	v1,v1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:155 (discriminator 3)
bfc00890:	0043202b 	sltu	a0,v0,v1
bfc00894:	10800009 	beqz	a0,bfc008bc <_entry+0x154>
bfc00898:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:156 (discriminator 2)
                *start = 0;
bfc0089c:	ac400000 	sw	zero,0(v0)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:155 (discriminator 2)
        for (auto start = (volatile uint32_t*)&_mem_avail_start; start < (uint32_t*)&_mem_avail_end; ++start) {
bfc008a0:	1000fffb 	b	bfc00890 <_entry+0x128>
bfc008a4:	24420004 	addiu	v0,v0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:148
            puts("Memory test succeeded.");
bfc008a8:	3c04bfc0 	lui	a0,0xbfc0
bfc008ac:	0ff0041c 	jal	bfc01070 <puts>
bfc008b0:	248416f8 	addiu	a0,a0,5880
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:152
    write_segment(0x11000003);
bfc008b4:	1000ffed 	b	bfc0086c <_entry+0x104>
bfc008b8:	3c041100 	lui	a0,0x1100
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:158
        }
        puts("Available memory filled with zero.");
bfc008bc:	0ff0041c 	jal	bfc01070 <puts>
bfc008c0:	24841710 	addiu	a0,a0,5904
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:161
    }

    write_segment(0x11000004);
bfc008c4:	3c041100 	lui	a0,0x1100
bfc008c8:	0ff00518 	jal	bfc01460 <write_segment>
bfc008cc:	24840004 	addiu	a0,a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:163

    switches = read_switches();
bfc008d0:	0ff0051d 	jal	bfc01474 <read_switches>
bfc008d4:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:165

    putstring("Mode: ");
bfc008d8:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:163
    switches = read_switches();
bfc008dc:	00408025 	move	s0,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:165
    putstring("Mode: ");
bfc008e0:	0ff00404 	jal	bfc01010 <putstring>
bfc008e4:	24841734 	addiu	a0,a0,5940
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:167

    if (!(switches & DUMP_MODE)) { // boot mode
bfc008e8:	32020010 	andi	v0,s0,0x10
bfc008ec:	14400036 	bnez	v0,bfc009c8 <_entry+0x260>
bfc008f0:	3c12bfc0 	lui	s2,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:168
        putstring("Boot\nDevice: ");
bfc008f4:	3c04bfc0 	lui	a0,0xbfc0
bfc008f8:	0ff00404 	jal	bfc01010 <putstring>
bfc008fc:	2484173c 	addiu	a0,a0,5948
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:169
        if (switches & DEVICE_FLASH) {
bfc00900:	32020001 	andi	v0,s0,0x1
bfc00904:	10400013 	beqz	v0,bfc00954 <_entry+0x1ec>
bfc00908:	32020008 	andi	v0,s0,0x8
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:170
            puts("SPI Flash");
bfc0090c:	3c04bfc0 	lui	a0,0xbfc0
bfc00910:	0ff0041c 	jal	bfc01070 <puts>
bfc00914:	2484174c 	addiu	a0,a0,5964
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:172
            // copy executable segment from flash to ram
            auto entry_addr = copy_from_flash(FLASH_START_ADDR);
bfc00918:	0ff00160 	jal	bfc00580 <_Z15copy_from_flashPv>
bfc0091c:	3c04ba80 	lui	a0,0xba80
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:178
            boot_addr(entry_addr);
        } else if (switches & DEVICE_UART) {
            puts("UART Receiver");
            // receive binary program fron uart to ram
            auto entry_addr = load_from_uart();
            boot_addr(entry_addr);
bfc00920:	00402025 	move	a0,v0
bfc00924:	0ff0011c 	jal	bfc00470 <_Z9boot_addrPv>
bfc00928:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:212
            puts("Done sending data");
        }
    }

    return 0; // make the compiler happy
bfc0092c:	8fbf002c 	lw	ra,44(sp)
bfc00930:	8fb50028 	lw	s5,40(sp)
bfc00934:	8fb40024 	lw	s4,36(sp)
bfc00938:	8fb30020 	lw	s3,32(sp)
bfc0093c:	8fb2001c 	lw	s2,28(sp)
bfc00940:	8fb10018 	lw	s1,24(sp)
bfc00944:	8fb00014 	lw	s0,20(sp)
bfc00948:	00001025 	move	v0,zero
bfc0094c:	03e00008 	jr	ra
bfc00950:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:174
        } else if (switches & DEVICE_UART) {
bfc00954:	10400008 	beqz	v0,bfc00978 <_entry+0x210>
bfc00958:	32020002 	andi	v0,s0,0x2
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:175
            puts("UART Receiver");
bfc0095c:	3c04bfc0 	lui	a0,0xbfc0
bfc00960:	0ff0041c 	jal	bfc01070 <puts>
bfc00964:	24841758 	addiu	a0,a0,5976
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:177
            auto entry_addr = load_from_uart();
bfc00968:	0ff001a8 	jal	bfc006a0 <_Z14load_from_uartv>
bfc0096c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:178
            boot_addr(entry_addr);
bfc00970:	1000ffec 	b	bfc00924 <_entry+0x1bc>
bfc00974:	00402025 	move	a0,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:179
        } else if (switches & DEVICE_RAM) {
bfc00978:	10400006 	beqz	v0,bfc00994 <_entry+0x22c>
bfc0097c:	32100004 	andi	s0,s0,0x4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:180
            puts("RAM");
bfc00980:	3c04bfc0 	lui	a0,0xbfc0
bfc00984:	0ff0041c 	jal	bfc01070 <puts>
bfc00988:	24841768 	addiu	a0,a0,5992
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:182
            boot_addr(MEM_START_ADDR);
bfc0098c:	1000ffe5 	b	bfc00924 <_entry+0x1bc>
bfc00990:	3c048000 	lui	a0,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:183
        } else if (switches & DEVICE_OCM) {
bfc00994:	12000006 	beqz	s0,bfc009b0 <_entry+0x248>
bfc00998:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:184
            puts("On-Chip-Memory");
bfc0099c:	3c04bfc0 	lui	a0,0xbfc0
bfc009a0:	0ff0041c 	jal	bfc01070 <puts>
bfc009a4:	2484176c 	addiu	a0,a0,5996
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:186
            boot_addr(OCM_START_ADDR);
bfc009a8:	1000ffde 	b	bfc00924 <_entry+0x1bc>
bfc009ac:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:188
            puts("Not Selected");
bfc009b0:	3c04bfc0 	lui	a0,0xbfc0
bfc009b4:	0ff0041c 	jal	bfc01070 <puts>
bfc009b8:	2484177c 	addiu	a0,a0,6012
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:189
            panic();
bfc009bc:	00000034 	teq	zero,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:212
bfc009c0:	1000ffdb 	b	bfc00930 <_entry+0x1c8>
bfc009c4:	8fbf002c 	lw	ra,44(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:192
        puts("Dump");
bfc009c8:	3c04bfc0 	lui	a0,0xbfc0
bfc009cc:	2484178c 	addiu	a0,a0,6028
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:200
            printf("Offset: 0x%p, length: %d bytes. Start sending data...",
bfc009d0:	3c13bfc0 	lui	s3,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:192
        puts("Dump");
bfc009d4:	0ff0041c 	jal	bfc01070 <puts>
bfc009d8:	3c11bfc0 	lui	s1,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:194
            puts("Send uint32 sequence: 0x23232323 OFFSET LENGTH");
bfc009dc:	265215cc 	addiu	s2,s2,5580
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:200
            printf("Offset: 0x%p, length: %d bytes. Start sending data...",
bfc009e0:	26731794 	addiu	s3,s3,6036
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:207
            puts("Done sending data");
bfc009e4:	263117cc 	addiu	s1,s1,6092
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:194
            puts("Send uint32 sequence: 0x23232323 OFFSET LENGTH");
bfc009e8:	0ff0041c 	jal	bfc01070 <puts>
bfc009ec:	02402025 	move	a0,s2
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:195
            wait_for_magic();
bfc009f0:	0ff0014a 	jal	bfc00528 <_Z14wait_for_magicv>
bfc009f4:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:197
                reinterpret_cast<volatile byte_t *>(read_serial_word());
bfc009f8:	0ff00501 	jal	bfc01404 <read_serial_word>
bfc009fc:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:198
            word_t length = read_serial_word();
bfc00a00:	0ff00501 	jal	bfc01404 <read_serial_word>
bfc00a04:	0040a025 	move	s4,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:200
            printf("Offset: 0x%p, length: %d bytes. Start sending data...",
bfc00a08:	00403025 	move	a2,v0
bfc00a0c:	02802825 	move	a1,s4
bfc00a10:	02602025 	move	a0,s3
bfc00a14:	0ff00331 	jal	bfc00cc4 <printf>
bfc00a18:	0040a825 	move	s5,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:203 (discriminator 3)
            for (size_t i = 0; i < length; ++i) {
bfc00a1c:	12150006 	beq	s0,s5,bfc00a38 <_entry+0x2d0>
bfc00a20:	02141021 	addu	v0,s0,s4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:204 (discriminator 2)
                write_serial(offset[i]);
bfc00a24:	90440000 	lbu	a0,0(v0)
bfc00a28:	0ff004f9 	jal	bfc013e4 <write_serial>
bfc00a2c:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:203 (discriminator 2)
            for (size_t i = 0; i < length; ++i) {
bfc00a30:	1000fffa 	b	bfc00a1c <_entry+0x2b4>
bfc00a34:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:207
            puts("Done sending data");
bfc00a38:	0ff0041c 	jal	bfc01070 <puts>
bfc00a3c:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/bootloader.cpp:208
        }
bfc00a40:	1000ffe9 	b	bfc009e8 <_entry+0x280>
bfc00a44:	00000000 	nop

bfc00a48 <_main>:
_main():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:11
extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {
bfc00a48:	27bdffe0 	addiu	sp,sp,-32
bfc00a4c:	afbf001c 	sw	ra,28(sp)
bfc00a50:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:13

    init_serial();
bfc00a54:	0ff004e3 	jal	bfc0138c <init_serial>
bfc00a58:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:15

    write_segment(0x04);
bfc00a5c:	0ff00518 	jal	bfc01460 <write_segment>
bfc00a60:	24040004 	li	a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:17

    puts("*****TrivialMIPS Bare Metal System*****");
bfc00a64:	3c04bfc0 	lui	a0,0xbfc0
bfc00a68:	0ff0041c 	jal	bfc01070 <puts>
bfc00a6c:	248417e0 	addiu	a0,a0,6112
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00a70:	3c118800 	lui	s1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00a74:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00a78:	3c108800 	lui	s0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00a7c:	24841808 	addiu	a0,a0,6152
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00a80:	26310000 	addiu	s1,s1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
bfc00a84:	0ff0041c 	jal	bfc01070 <puts>
bfc00a88:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
bfc00a8c:	02118023 	subu	s0,s0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:21
    write_segment(0x05);
bfc00a90:	0ff00518 	jal	bfc01460 <write_segment>
bfc00a94:	24040005 	li	a0,5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:25
    if (bss_size > 0) {
bfc00a98:	1a000009 	blez	s0,bfc00ac0 <_main+0x78>
bfc00a9c:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:26
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
bfc00aa0:	02003025 	move	a2,s0
bfc00aa4:	02202825 	move	a1,s1
bfc00aa8:	0ff00331 	jal	bfc00cc4 <printf>
bfc00aac:	24841830 	addiu	a0,a0,6192
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:27
        memset(&_bss, 0, bss_size);
bfc00ab0:	02003025 	move	a2,s0
bfc00ab4:	00002825 	move	a1,zero
bfc00ab8:	0ff003f0 	jal	bfc00fc0 <memset>
bfc00abc:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:30
    }

    write_segment(0x06);
bfc00ac0:	0ff00518 	jal	bfc01460 <write_segment>
bfc00ac4:	24040006 	li	a0,6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:33

    // call the actual function
    int result = _entry();
bfc00ac8:	0ff001da 	jal	bfc00768 <_entry>
bfc00acc:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:34
    if (result == 0) {
bfc00ad0:	1440000a 	bnez	v0,bfc00afc <_main+0xb4>
bfc00ad4:	00402825 	move	a1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:35
        puts("Program exited normally.");
bfc00ad8:	3c04bfc0 	lui	a0,0xbfc0
bfc00adc:	0ff0041c 	jal	bfc01070 <puts>
bfc00ae0:	2484186c 	addiu	a0,a0,6252
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}
bfc00ae4:	8fbf001c 	lw	ra,28(sp)
bfc00ae8:	8fb10018 	lw	s1,24(sp)
bfc00aec:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:40
    write_segment(0x07);
bfc00af0:	24040007 	li	a0,7
bfc00af4:	0bf00518 	j	bfc01460 <write_segment>
bfc00af8:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:37
        printf("Program exited abnormally with code %d.\n", result);
bfc00afc:	3c04bfc0 	lui	a0,0xbfc0
bfc00b00:	0ff00331 	jal	bfc00cc4 <printf>
bfc00b04:	24841888 	addiu	a0,a0,6280
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
}
bfc00b08:	1000fff7 	b	bfc00ae8 <_main+0xa0>
bfc00b0c:	8fbf001c 	lw	ra,28(sp)

bfc00b10 <print_trapframe>:
print_trapframe():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
bfc00b10:	27bdffd0 	addiu	sp,sp,-48
bfc00b14:	afb30024 	sw	s3,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00b18:	3c13bfc0 	lui	s3,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
void print_trapframe(trapframe_t *tf) {
bfc00b1c:	afb40028 	sw	s4,40(sp)
bfc00b20:	afb20020 	sw	s2,32(sp)
bfc00b24:	afb1001c 	sw	s1,28(sp)
bfc00b28:	afb00018 	sw	s0,24(sp)
bfc00b2c:	afbf002c 	sw	ra,44(sp)
bfc00b30:	00808025 	move	s0,a0
bfc00b34:	24920028 	addiu	s2,a0,40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
bfc00b38:	24110001 	li	s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00b3c:	267318b4 	addiu	s3,s3,6324
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
bfc00b40:	24140020 	li	s4,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64 (discriminator 3)
        printf("Register $%d: %p\n", i, tf->gpr[i]);
bfc00b44:	8e460000 	lw	a2,0(s2)
bfc00b48:	02202825 	move	a1,s1
bfc00b4c:	02602025 	move	a0,s3
bfc00b50:	0ff00331 	jal	bfc00cc4 <printf>
bfc00b54:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63 (discriminator 3)
    for(int i = 1; i < 32; ++i) {
bfc00b58:	1634fffa 	bne	s1,s4,bfc00b44 <print_trapframe+0x34>
bfc00b5c:	26520004 	addiu	s2,s2,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:66
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
bfc00b60:	8e020020 	lw	v0,32(s0)
bfc00b64:	8e070018 	lw	a3,24(s0)
bfc00b68:	afa20014 	sw	v0,20(sp)
bfc00b6c:	8e02001c 	lw	v0,28(s0)
bfc00b70:	8e060014 	lw	a2,20(s0)
bfc00b74:	8e050010 	lw	a1,16(s0)
bfc00b78:	3c04bfc0 	lui	a0,0xbfc0
bfc00b7c:	afa20010 	sw	v0,16(sp)
bfc00b80:	0ff00331 	jal	bfc00cc4 <printf>
bfc00b84:	248418c8 	addiu	a0,a0,6344
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:67
}
bfc00b88:	8fbf002c 	lw	ra,44(sp)
bfc00b8c:	8fb40028 	lw	s4,40(sp)
bfc00b90:	8fb30024 	lw	s3,36(sp)
bfc00b94:	8fb20020 	lw	s2,32(sp)
bfc00b98:	8fb1001c 	lw	s1,28(sp)
bfc00b9c:	8fb00018 	lw	s0,24(sp)
bfc00ba0:	03e00008 	jr	ra
bfc00ba4:	27bd0030 	addiu	sp,sp,48

bfc00ba8 <print_tlb>:
print_tlb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69

void print_tlb() {
bfc00ba8:	27bdffd8 	addiu	sp,sp,-40
bfc00bac:	afb1001c 	sw	s1,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc00bb0:	3c11bfc0 	lui	s1,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69
void print_tlb() {
bfc00bb4:	afb20020 	sw	s2,32(sp)
bfc00bb8:	afb00018 	sw	s0,24(sp)
bfc00bbc:	afbf0024 	sw	ra,36(sp)
bfc00bc0:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc00bc4:	26311904 	addiu	s1,s1,6404
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
bfc00bc8:	24120010 	li	s2,16
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:72 (discriminator 3)
        asm volatile(
bfc00bcc:	40900000 	mtc0	s0,c0_index
bfc00bd0:	42000001 	tlbr
bfc00bd4:	40065000 	mfc0	a2,c0_entryhi
bfc00bd8:	40071000 	mfc0	a3,c0_entrylo0
bfc00bdc:	40021800 	mfc0	v0,c0_entrylo1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81 (discriminator 3)
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
bfc00be0:	02002825 	move	a1,s0
bfc00be4:	afa20010 	sw	v0,16(sp)
bfc00be8:	02202025 	move	a0,s1
bfc00bec:	0ff00331 	jal	bfc00cc4 <printf>
bfc00bf0:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70 (discriminator 3)
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
bfc00bf4:	1612fff5 	bne	s0,s2,bfc00bcc <print_tlb+0x24>
bfc00bf8:	8fbf0024 	lw	ra,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:83
    }
}
bfc00bfc:	8fb20020 	lw	s2,32(sp)
bfc00c00:	8fb1001c 	lw	s1,28(sp)
bfc00c04:	8fb00018 	lw	s0,24(sp)
bfc00c08:	03e00008 	jr	ra
bfc00c0c:	27bd0028 	addiu	sp,sp,40

bfc00c10 <_exception_handler>:
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85

void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00c10:	27bdffe0 	addiu	sp,sp,-32
bfc00c14:	afb10018 	sw	s1,24(sp)
bfc00c18:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00c1c:	3c04bfc0 	lui	a0,0xbfc0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00c20:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00c24:	248417e0 	addiu	a0,a0,6112
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
bfc00c28:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
bfc00c2c:	0ff0041c 	jal	bfc01070 <puts>
bfc00c30:	00a08025 	move	s0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:87
    if (assertion) {
bfc00c34:	12000012 	beqz	s0,bfc00c80 <_exception_handler+0x70>
bfc00c38:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:88
        puts("CPU internal assertion failed, abort.");
bfc00c3c:	3c04bfc0 	lui	a0,0xbfc0
bfc00c40:	0ff0041c 	jal	bfc01070 <puts>
bfc00c44:	2484193c 	addiu	a0,a0,6460
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:89
        write_segment(0xdeaddead);
bfc00c48:	3c04dead 	lui	a0,0xdead
bfc00c4c:	0ff00518 	jal	bfc01460 <write_segment>
bfc00c50:	3484dead 	ori	a0,a0,0xdead
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:96
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
bfc00c54:	0ff002c4 	jal	bfc00b10 <print_trapframe>
bfc00c58:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:97
    print_tlb();
bfc00c5c:	0ff002ea 	jal	bfc00ba8 <print_tlb>
bfc00c60:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:99
    puts("*****System HANG*****");
}
bfc00c64:	8fbf001c 	lw	ra,28(sp)
bfc00c68:	8fb10018 	lw	s1,24(sp)
bfc00c6c:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:98
    puts("*****System HANG*****");
bfc00c70:	3c04bfc0 	lui	a0,0xbfc0
bfc00c74:	248419a0 	addiu	a0,a0,6560
bfc00c78:	0bf0041c 	j	bfc01070 <puts>
bfc00c7c:	27bd0020 	addiu	sp,sp,32
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
bfc00c80:	40066800 	mfc0	a2,c0_cause
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:91
        word_t code = (_get_cause() >> 2) & 0xF;
bfc00c84:	00063082 	srl	a2,a2,0x2
bfc00c88:	30c6000f 	andi	a2,a2,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
bfc00c8c:	3c03bfc0 	lui	v1,0xbfc0
bfc00c90:	00061080 	sll	v0,a2,0x2
bfc00c94:	24631c2c 	addiu	v1,v1,7212
bfc00c98:	00431021 	addu	v0,v0,v1
bfc00c9c:	8c470000 	lw	a3,0(v0)
bfc00ca0:	3c04bfc0 	lui	a0,0xbfc0
_get_epc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:46
    asm(
bfc00ca4:	40107000 	mfc0	s0,c0_epc
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
bfc00ca8:	24841964 	addiu	a0,a0,6500
bfc00cac:	0ff00331 	jal	bfc00cc4 <printf>
bfc00cb0:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:94
        write_led((uint16_t) epc);
bfc00cb4:	0ff00513 	jal	bfc0144c <write_led>
bfc00cb8:	3204ffff 	andi	a0,s0,0xffff
bfc00cbc:	1000ffe5 	b	bfc00c54 <_exception_handler+0x44>
bfc00cc0:	00000000 	nop

bfc00cc4 <printf>:
printf():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
int printf(const char *fmt, ...)
{
bfc00cc4:	27bdffd0 	addiu	sp,sp,-48
bfc00cc8:	afb00018 	sw	s0,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
bfc00ccc:	27b00034 	addiu	s0,sp,52
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
{
bfc00cd0:	afb30024 	sw	s3,36(sp)
bfc00cd4:	afb20020 	sw	s2,32(sp)
bfc00cd8:	afb1001c 	sw	s1,28(sp)
bfc00cdc:	afbf002c 	sw	ra,44(sp)
bfc00ce0:	afb40028 	sw	s4,40(sp)
bfc00ce4:	00809025 	move	s2,a0
bfc00ce8:	afa50034 	sw	a1,52(sp)
bfc00cec:	afa60038 	sw	a2,56(sp)
bfc00cf0:	afa7003c 	sw	a3,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	__builtin_va_start(ap, fmt);
bfc00cf4:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10
	arg = ap;
	for (i = 0; fmt[i]; i++)
bfc00cf8:	00008825 	move	s1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
				break;
			}
		}
		else
		{
			if (c == '\n')
bfc00cfc:	2413000a 	li	s3,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 1)
	for (i = 0; fmt[i]; i++)
bfc00d00:	02511021 	addu	v0,s2,s1
bfc00d04:	80540000 	lb	s4,0(v0)
bfc00d08:	1680000a 	bnez	s4,bfc00d34 <printf+0x70>
bfc00d0c:	24020025 	li	v0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:85
				putchar('\r');
			putchar(c);
		}
	}
	return 0;
}
bfc00d10:	8fbf002c 	lw	ra,44(sp)
bfc00d14:	8fb40028 	lw	s4,40(sp)
bfc00d18:	8fb30024 	lw	s3,36(sp)
bfc00d1c:	8fb20020 	lw	s2,32(sp)
bfc00d20:	8fb1001c 	lw	s1,28(sp)
bfc00d24:	8fb00018 	lw	s0,24(sp)
bfc00d28:	00001025 	move	v0,zero
bfc00d2c:	03e00008 	jr	ra
bfc00d30:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:13
		if (c == '%')
bfc00d34:	16820066 	bne	s4,v0,bfc00ed0 <printf+0x20c>
bfc00d38:	24050001 	li	a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00d3c:	24060064 	li	a2,100
bfc00d40:	24070025 	li	a3,37
bfc00d44:	24080030 	li	t0,48
bfc00d48:	02511021 	addu	v0,s2,s1
bfc00d4c:	80420001 	lb	v0,1(v0)
bfc00d50:	1046003a 	beq	v0,a2,bfc00e3c <printf+0x178>
bfc00d54:	28430065 	slti	v1,v0,101
bfc00d58:	10600018 	beqz	v1,bfc00dbc <printf+0xf8>
bfc00d5c:	2843003a 	slti	v1,v0,58
bfc00d60:	1060000c 	beqz	v1,bfc00d94 <printf+0xd0>
bfc00d64:	28430031 	slti	v1,v0,49
bfc00d68:	1060004d 	beqz	v1,bfc00ea0 <printf+0x1dc>
bfc00d6c:	02512021 	addu	a0,s2,s1
bfc00d70:	10470046 	beq	v0,a3,bfc00e8c <printf+0x1c8>
bfc00d74:	26340001 	addiu	s4,s1,1
bfc00d78:	10480048 	beq	v0,t0,bfc00e9c <printf+0x1d8>
bfc00d7c:	02542021 	addu	a0,s2,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:73
				putchar('%');
bfc00d80:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
bfc00d84:	0ff00428 	jal	bfc010a0 <putchar>
bfc00d88:	26310001 	addiu	s1,s1,1
bfc00d8c:	1000ffdd 	b	bfc00d04 <printf+0x40>
bfc00d90:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00d94:	24030062 	li	v1,98
bfc00d98:	10430036 	beq	v0,v1,bfc00e74 <printf+0x1b0>
bfc00d9c:	26340001 	addiu	s4,s1,1
bfc00da0:	24030063 	li	v1,99
bfc00da4:	1443fff6 	bne	v0,v1,bfc00d80 <printf+0xbc>
bfc00da8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:25
				putchar((long)*arg);
bfc00dac:	0ff00428 	jal	bfc010a0 <putchar>
bfc00db0:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc00db4:	10000017 	b	bfc00e14 <printf+0x150>
bfc00db8:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00dbc:	24030070 	li	v1,112
bfc00dc0:	1043002f 	beq	v0,v1,bfc00e80 <printf+0x1bc>
bfc00dc4:	28430071 	slti	v1,v0,113
bfc00dc8:	10600008 	beqz	v1,bfc00dec <printf+0x128>
bfc00dcc:	24030075 	li	v1,117
bfc00dd0:	2403006c 	li	v1,108
bfc00dd4:	10430020 	beq	v0,v1,bfc00e58 <printf+0x194>
bfc00dd8:	2403006f 	li	v1,111
bfc00ddc:	1443ffe8 	bne	v0,v1,bfc00d80 <printf+0xbc>
bfc00de0:	00003825 	move	a3,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:45
				printbase((long)*arg, w, 8, 0);
bfc00de4:	10000017 	b	bfc00e44 <printf+0x180>
bfc00de8:	24060008 	li	a2,8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
bfc00dec:	1043000d 	beq	v0,v1,bfc00e24 <printf+0x160>
bfc00df0:	26340001 	addiu	s4,s1,1
bfc00df4:	24030078 	li	v1,120
bfc00df8:	10430021 	beq	v0,v1,bfc00e80 <printf+0x1bc>
bfc00dfc:	24030073 	li	v1,115
bfc00e00:	1443ffe0 	bne	v0,v1,bfc00d84 <printf+0xc0>
bfc00e04:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:20
				putstring(*arg);
bfc00e08:	0ff00404 	jal	bfc01010 <putstring>
bfc00e0c:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc00e10:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
bfc00e14:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 2)
	for (i = 0; fmt[i]; i++)
bfc00e18:	26310001 	addiu	s1,s1,1
bfc00e1c:	1000ffb9 	b	bfc00d04 <printf+0x40>
bfc00e20:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:30
				printbase((long)*arg, w, 10, 0);
bfc00e24:	00003825 	move	a3,zero
bfc00e28:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
bfc00e2c:	0ff003ba 	jal	bfc00ee8 <printbase>
bfc00e30:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
bfc00e34:	1000fff7 	b	bfc00e14 <printf+0x150>
bfc00e38:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:35
				printbase((long)*arg, w, 10, 1);
bfc00e3c:	24070001 	li	a3,1
bfc00e40:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
bfc00e44:	8e040000 	lw	a0,0(s0)
bfc00e48:	0ff003ba 	jal	bfc00ee8 <printbase>
bfc00e4c:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:59
				break;
bfc00e50:	1000fff1 	b	bfc00e18 <printf+0x154>
bfc00e54:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:40
				printbase((long)*arg, w, 10, 0);
bfc00e58:	8e040000 	lw	a0,0(s0)
bfc00e5c:	00003825 	move	a3,zero
bfc00e60:	0ff003ba 	jal	bfc00ee8 <printbase>
bfc00e64:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:41
				arg++;
bfc00e68:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:43
				break;
bfc00e6c:	1000ffea 	b	bfc00e18 <printf+0x154>
bfc00e70:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
bfc00e74:	00003825 	move	a3,zero
bfc00e78:	1000ffec 	b	bfc00e2c <printf+0x168>
bfc00e7c:	24060002 	li	a2,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
bfc00e80:	00003825 	move	a3,zero
bfc00e84:	1000ffef 	b	bfc00e44 <printf+0x180>
bfc00e88:	24060010 	li	a2,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:61
				putchar('%');
bfc00e8c:	0ff00428 	jal	bfc010a0 <putchar>
bfc00e90:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
bfc00e94:	1000ffe0 	b	bfc00e18 <printf+0x154>
bfc00e98:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:65
				i++;
bfc00e9c:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:15 (discriminator 1)
			w = 1;
bfc00ea0:	00002825 	move	a1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:67 (discriminator 1)
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
bfc00ea4:	80830001 	lb	v1,1(a0)
bfc00ea8:	00928823 	subu	s1,a0,s2
bfc00eac:	2462ffcf 	addiu	v0,v1,-49
bfc00eb0:	304200ff 	andi	v0,v0,0xff
bfc00eb4:	2c420009 	sltiu	v0,v0,9
bfc00eb8:	1040ffa3 	beqz	v0,bfc00d48 <printf+0x84>
bfc00ebc:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:68 (discriminator 3)
					w = w * 10 + (fmt[i + 1] - '0');
bfc00ec0:	70b31002 	mul	v0,a1,s3
bfc00ec4:	2463ffd0 	addiu	v1,v1,-48
bfc00ec8:	1000fff6 	b	bfc00ea4 <printf+0x1e0>
bfc00ecc:	00432821 	addu	a1,v0,v1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
			if (c == '\n')
bfc00ed0:	16930003 	bne	s4,s3,bfc00ee0 <printf+0x21c>
bfc00ed4:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:80
				putchar('\r');
bfc00ed8:	0ff00428 	jal	bfc010a0 <putchar>
bfc00edc:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
bfc00ee0:	1000ffa8 	b	bfc00d84 <printf+0xc0>
bfc00ee4:	02802025 	move	a0,s4

bfc00ee8 <printbase>:
printbase():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2
int printbase(long v,int w,int base,int sign)
{
bfc00ee8:	27bdff98 	addiu	sp,sp,-104
bfc00eec:	afb40060 	sw	s4,96(sp)
bfc00ef0:	afb3005c 	sw	s3,92(sp)
bfc00ef4:	afbf0064 	sw	ra,100(sp)
bfc00ef8:	afb20058 	sw	s2,88(sp)
bfc00efc:	afb10054 	sw	s1,84(sp)
bfc00f00:	afb00050 	sw	s0,80(sp)
bfc00f04:	00a09825 	move	s3,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
bfc00f08:	10e00018 	beqz	a3,bfc00f6c <printbase+0x84>
bfc00f0c:	00c0a025 	move	s4,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7 (discriminator 1)
bfc00f10:	04810004 	bgez	a0,bfc00f24 <printbase+0x3c>
bfc00f14:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:9
	{
	value = -v;
bfc00f18:	00048023 	negu	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:10
	putchar('-');
bfc00f1c:	0ff00428 	jal	bfc010a0 <putchar>
bfc00f20:	2404002d 	li	a0,45
bfc00f24:	27b10010 	addiu	s1,sp,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2 (discriminator 1)
{
bfc00f28:	02201025 	move	v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:14 (discriminator 1)
	}
	else value=v;

	for(i=0;value;i++)
bfc00f2c:	16000011 	bnez	s0,bfc00f74 <printbase+0x8c>
bfc00f30:	00519023 	subu	s2,v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22
	value=value/base;
	}

#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
bfc00f34:	0272802a 	slt	s0,s3,s2
bfc00f38:	0250980b 	movn	s3,s2,s0
bfc00f3c:	02608025 	move	s0,s3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22 (discriminator 2)
bfc00f40:	16000013 	bnez	s0,bfc00f90 <printbase+0xa8>
bfc00f44:	0250102a 	slt	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:28
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}
bfc00f48:	8fbf0064 	lw	ra,100(sp)
bfc00f4c:	8fb40060 	lw	s4,96(sp)
bfc00f50:	8fb3005c 	lw	s3,92(sp)
bfc00f54:	8fb20058 	lw	s2,88(sp)
bfc00f58:	8fb10054 	lw	s1,84(sp)
bfc00f5c:	8fb00050 	lw	s0,80(sp)
bfc00f60:	00001025 	move	v0,zero
bfc00f64:	03e00008 	jr	ra
bfc00f68:	27bd0068 	addiu	sp,sp,104
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:12
	else value=v;
bfc00f6c:	1000ffed 	b	bfc00f24 <printbase+0x3c>
bfc00f70:	00808025 	move	s0,a0
bfc00f74:	0214001b 	divu	zero,s0,s4
bfc00f78:	028001f4 	teq	s4,zero,0x7
bfc00f7c:	24420001 	addiu	v0,v0,1
bfc00f80:	00002010 	mfhi	a0
bfc00f84:	00008012 	mflo	s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:16 (discriminator 3)
	buf[i]=value%base;
bfc00f88:	1000ffe8 	b	bfc00f2c <printbase+0x44>
bfc00f8c:	a044ffff 	sb	a0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24
		c=j>i?0:buf[j-1];
bfc00f90:	14400006 	bnez	v0,bfc00fac <printbase+0xc4>
bfc00f94:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24 (discriminator 1)
bfc00f98:	02301021 	addu	v0,s1,s0
bfc00f9c:	8042ffff 	lb	v0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 1)
		putchar((c<=9)?c+'0':c-0xa+'a');
bfc00fa0:	2843000a 	slti	v1,v0,10
bfc00fa4:	10600002 	beqz	v1,bfc00fb0 <printbase+0xc8>
bfc00fa8:	24440057 	addiu	a0,v0,87
bfc00fac:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 4)
bfc00fb0:	0ff00428 	jal	bfc010a0 <putchar>
bfc00fb4:	2610ffff 	addiu	s0,s0,-1
bfc00fb8:	1000ffe1 	b	bfc00f40 <printbase+0x58>
bfc00fbc:	00000000 	nop

bfc00fc0 <memset>:
memset():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:273
 * @n:      number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
bfc00fc0:	00801025 	move	v0,a0
bfc00fc4:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:277
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memset(s, c, n);
#else
    char *p = s;
bfc00fc8:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:278
    while (n -- > 0) {
bfc00fcc:	14660003 	bne	v1,a2,bfc00fdc <memset+0x1c>
bfc00fd0:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:283
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
bfc00fd4:	03e00008 	jr	ra
bfc00fd8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:279
        *p ++ = c;
bfc00fdc:	1000fffb 	b	bfc00fcc <memset+0xc>
bfc00fe0:	a065ffff 	sb	a1,-1(v1)

bfc00fe4 <memcpy>:
memcpy():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:300
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
bfc00fe4:	00801025 	move	v0,a0
bfc00fe8:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:305
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memcpy(dst, src, n);
#else
    const char *s = src;
    char *d = dst;
bfc00fec:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:306
    while (n -- > 0) {
bfc00ff0:	14660003 	bne	v1,a2,bfc01000 <memcpy+0x1c>
bfc00ff4:	24a50001 	addiu	a1,a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:311
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
bfc00ff8:	03e00008 	jr	ra
bfc00ffc:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:307
        *d ++ = *s ++;
bfc01000:	80a4ffff 	lb	a0,-1(a1)
bfc01004:	24630001 	addiu	v1,v1,1
bfc01008:	1000fff9 	b	bfc00ff0 <memcpy+0xc>
bfc0100c:	a064ffff 	sb	a0,-1(v1)

bfc01010 <putstring>:
putstring():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:2
int putstring(const char *s)
{
bfc01010:	27bdffe0 	addiu	sp,sp,-32
bfc01014:	afb20018 	sw	s2,24(sp)
bfc01018:	afb10014 	sw	s1,20(sp)
bfc0101c:	afbf001c 	sw	ra,28(sp)
bfc01020:	afb00010 	sw	s0,16(sp)
bfc01024:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
    char c;
    while ((c = *s))
    {
        if (c == '\n')
bfc01028:	2412000a 	li	s2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:4
    while ((c = *s))
bfc0102c:	82300000 	lb	s0,0(s1)
bfc01030:	16000007 	bnez	s0,bfc01050 <putstring+0x40>
bfc01034:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:12
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
bfc01038:	8fb20018 	lw	s2,24(sp)
bfc0103c:	8fb10014 	lw	s1,20(sp)
bfc01040:	8fb00010 	lw	s0,16(sp)
bfc01044:	00001025 	move	v0,zero
bfc01048:	03e00008 	jr	ra
bfc0104c:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
        if (c == '\n')
bfc01050:	16120003 	bne	s0,s2,bfc01060 <putstring+0x50>
bfc01054:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:7
            putchar('\r');
bfc01058:	0ff00428 	jal	bfc010a0 <putchar>
bfc0105c:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:8
        putchar(c);
bfc01060:	0ff00428 	jal	bfc010a0 <putchar>
bfc01064:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:9
        s++;
bfc01068:	1000fff0 	b	bfc0102c <putstring+0x1c>
bfc0106c:	26310001 	addiu	s1,s1,1

bfc01070 <puts>:
puts():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:15

int puts(const char *s)
{
bfc01070:	27bdffe8 	addiu	sp,sp,-24
bfc01074:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:16
    putstring(s);
bfc01078:	0ff00404 	jal	bfc01010 <putstring>
bfc0107c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:17
    putchar('\r');
bfc01080:	0ff00428 	jal	bfc010a0 <putchar>
bfc01084:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:18
    putchar('\n');
bfc01088:	0ff00428 	jal	bfc010a0 <putchar>
bfc0108c:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:20
    return 0;
}
bfc01090:	8fbf0014 	lw	ra,20(sp)
bfc01094:	00001025 	move	v0,zero
bfc01098:	03e00008 	jr	ra
bfc0109c:	27bd0018 	addiu	sp,sp,24

bfc010a0 <putchar>:
putchar():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:4
#include <machine.h>

int putchar(int c)
{
bfc010a0:	27bdffe8 	addiu	sp,sp,-24
bfc010a4:	afb00010 	sw	s0,16(sp)
bfc010a8:	00808025 	move	s0,a0
bfc010ac:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:5
	write_serial((byte_t) c);
bfc010b0:	0ff004f9 	jal	bfc013e4 <write_serial>
bfc010b4:	308400ff 	andi	a0,a0,0xff
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:7
	return c;
bfc010b8:	8fbf0014 	lw	ra,20(sp)
bfc010bc:	02001025 	move	v0,s0
bfc010c0:	8fb00010 	lw	s0,16(sp)
bfc010c4:	03e00008 	jr	ra
bfc010c8:	27bd0018 	addiu	sp,sp,24

bfc010cc <_Z11test_memoryPvS_>:
_Z11test_memoryPvS_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:47
	}

    return true;
}

bool test_memory(void* start, void* end){
bfc010cc:	27bdffc8 	addiu	sp,sp,-56
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:49

	printf("Starting memory test from 0x%p to 0x%p.\n", start, end);
bfc010d0:	00a03025 	move	a2,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:47
bool test_memory(void* start, void* end){
bfc010d4:	afb2001c 	sw	s2,28(sp)
bfc010d8:	afb00014 	sw	s0,20(sp)
bfc010dc:	00a09025 	move	s2,a1
bfc010e0:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:49
	printf("Starting memory test from 0x%p to 0x%p.\n", start, end);
bfc010e4:	00802825 	move	a1,a0
bfc010e8:	3c04bfc0 	lui	a0,0xbfc0
bfc010ec:	24841cac 	addiu	a0,a0,7340
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:47
bool test_memory(void* start, void* end){
bfc010f0:	afbf0034 	sw	ra,52(sp)
bfc010f4:	afb70030 	sw	s7,48(sp)
bfc010f8:	afb6002c 	sw	s6,44(sp)
bfc010fc:	afb50028 	sw	s5,40(sp)
bfc01100:	afb40024 	sw	s4,36(sp)
bfc01104:	afb30020 	sw	s3,32(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:49
	printf("Starting memory test from 0x%p to 0x%p.\n", start, end);
bfc01108:	0ff00331 	jal	bfc00cc4 <printf>
bfc0110c:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:51

    putstring("Testing memory by word...");
bfc01110:	3c04bfc0 	lui	a0,0xbfc0
bfc01114:	0ff00404 	jal	bfc01010 <putstring>
bfc01118:	24841cd8 	addiu	a0,a0,7384
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0111c:	3c047fff 	lui	a0,0x7fff
_Z14do_test_memoryIjEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:17
	auto *mem = start;
bfc01120:	02001825 	move	v1,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:19
	rand_seed = 23;
bfc01124:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01128:	240541a7 	li	a1,16807
bfc0112c:	3484ffff 	ori	a0,a0,0xffff
_Z14do_test_memoryIjEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:21
	while(mem < end) {
bfc01130:	0072302b 	sltu	a2,v1,s2
bfc01134:	10c00008 	beqz	a2,bfc01158 <_Z11test_memoryPvS_+0x8c>
bfc01138:	70451002 	mul	v0,v0,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:23
		mem++;
bfc0113c:	24630004 	addiu	v1,v1,4
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01140:	0044001b 	divu	zero,v0,a0
bfc01144:	008001f4 	teq	a0,zero,0x7
bfc01148:	00001010 	mfhi	v0
_Z14do_test_memoryIjEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:22
		*mem = rand(rand_seed);
bfc0114c:	ac62fffc 	sw	v0,-4(v1)
_Z11test_memoryPvS_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:21
	while(mem < end) {
bfc01150:	1000fff8 	b	bfc01134 <_Z11test_memoryPvS_+0x68>
bfc01154:	0072302b 	sltu	a2,v1,s2
_Z14do_test_memoryIjEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc01158:	3c15000f 	lui	s5,0xf
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0115c:	3c147fff 	lui	s4,0x7fff
_Z14do_test_memoryIjEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:26
	mem = start;
bfc01160:	02008825 	move	s1,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:28
	rand_seed = 23;
bfc01164:	24130017 	li	s3,23
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc01168:	36b5ffff 	ori	s5,s5,0xffff
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0116c:	241641a7 	li	s6,16807
bfc01170:	3694ffff 	ori	s4,s4,0xffff
_Z14do_test_memoryIjEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:30
	while(mem < end) {
bfc01174:	0232102b 	sltu	v0,s1,s2
bfc01178:	1040001e 	beqz	v0,bfc011f4 <_Z11test_memoryPvS_+0x128>
bfc0117c:	02351024 	and	v0,s1,s5
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc01180:	14400003 	bnez	v0,bfc01190 <_Z11test_memoryPvS_+0xc4>
bfc01184:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:33
			write_segment((uint32_t) mem);
bfc01188:	0ff00518 	jal	bfc01460 <write_segment>
bfc0118c:	02202025 	move	a0,s1
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01190:	72769802 	mul	s3,s3,s6
_Z14do_test_memoryIjEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:36
		auto read = *mem;
bfc01194:	8e270000 	lw	a3,0(s1)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01198:	0274001b 	divu	zero,s3,s4
bfc0119c:	028001f4 	teq	s4,zero,0x7
bfc011a0:	00009810 	mfhi	s3
_Z14do_test_memoryIjEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:37
		if (read != static_cast<Type>(next)) {
bfc011a4:	12670011 	beq	s3,a3,bfc011ec <_Z11test_memoryPvS_+0x120>
bfc011a8:	02603025 	move	a2,s3
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:38
			printf("Error at 0x%p: expect 0x%p, got 0x%p\n", mem, next, read);
bfc011ac:	02202825 	move	a1,s1
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:38
bfc011b0:	3c04bfc0 	lui	a0,0xbfc0
bfc011b4:	0ff00331 	jal	bfc00cc4 <printf>
bfc011b8:	24841cf4 	addiu	a0,a0,7412
_Z11test_memoryPvS_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:60
	putstring("Testing memory by half word...");
    if (!do_test_memory<hword_t>(start, end)) return false;
	puts("OK!");

	putstring("Testing memory by byte...");
    if (!do_test_memory<byte_t>(start, end)) return false;
bfc011bc:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:64
	puts("OK!");

    return true;
bfc011c0:	8fbf0034 	lw	ra,52(sp)
bfc011c4:	8fb70030 	lw	s7,48(sp)
bfc011c8:	8fb6002c 	lw	s6,44(sp)
bfc011cc:	8fb50028 	lw	s5,40(sp)
bfc011d0:	8fb40024 	lw	s4,36(sp)
bfc011d4:	8fb30020 	lw	s3,32(sp)
bfc011d8:	8fb2001c 	lw	s2,28(sp)
bfc011dc:	8fb10018 	lw	s1,24(sp)
bfc011e0:	8fb00014 	lw	s0,20(sp)
bfc011e4:	03e00008 	jr	ra
bfc011e8:	27bd0038 	addiu	sp,sp,56
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:41
		mem++;
bfc011ec:	1000ffe1 	b	bfc01174 <_Z11test_memoryPvS_+0xa8>
bfc011f0:	26310004 	addiu	s1,s1,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:53
	puts("OK!");
bfc011f4:	3c14bfc0 	lui	s4,0xbfc0
bfc011f8:	0ff0041c 	jal	bfc01070 <puts>
bfc011fc:	26841d1c 	addiu	a0,s4,7452
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:55
	putstring("Testing memory by half word...");
bfc01200:	3c04bfc0 	lui	a0,0xbfc0
bfc01204:	0ff00404 	jal	bfc01010 <putstring>
bfc01208:	24841d20 	addiu	a0,a0,7456
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0120c:	3c047fff 	lui	a0,0x7fff
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:17
	auto *mem = start;
bfc01210:	02001825 	move	v1,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:19
	rand_seed = 23;
bfc01214:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01218:	240641a7 	li	a2,16807
bfc0121c:	3484ffff 	ori	a0,a0,0xffff
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:21
	while(mem < end) {
bfc01220:	0072282b 	sltu	a1,v1,s2
bfc01224:	10a00009 	beqz	a1,bfc0124c <_Z11test_memoryPvS_+0x180>
bfc01228:	70461002 	mul	v0,v0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:23
		mem++;
bfc0122c:	24630002 	addiu	v1,v1,2
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01230:	0044001b 	divu	zero,v0,a0
bfc01234:	008001f4 	teq	a0,zero,0x7
bfc01238:	00001010 	mfhi	v0
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:22
		*mem = rand(rand_seed);
bfc0123c:	3045ffff 	andi	a1,v0,0xffff
bfc01240:	a465fffe 	sh	a1,-2(v1)
_Z11test_memoryPvS_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:21
	while(mem < end) {
bfc01244:	1000fff7 	b	bfc01224 <_Z11test_memoryPvS_+0x158>
bfc01248:	0072282b 	sltu	a1,v1,s2
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc0124c:	3c16000f 	lui	s6,0xf
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01250:	3c157fff 	lui	s5,0x7fff
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:26
	mem = start;
bfc01254:	02008825 	move	s1,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:28
	rand_seed = 23;
bfc01258:	24130017 	li	s3,23
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc0125c:	36d6ffff 	ori	s6,s6,0xffff
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01260:	241741a7 	li	s7,16807
bfc01264:	36b5ffff 	ori	s5,s5,0xffff
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:30
	while(mem < end) {
bfc01268:	0232102b 	sltu	v0,s1,s2
bfc0126c:	10400010 	beqz	v0,bfc012b0 <_Z11test_memoryPvS_+0x1e4>
bfc01270:	02361024 	and	v0,s1,s6
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc01274:	14400003 	bnez	v0,bfc01284 <_Z11test_memoryPvS_+0x1b8>
bfc01278:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:33
			write_segment((uint32_t) mem);
bfc0127c:	0ff00518 	jal	bfc01460 <write_segment>
bfc01280:	02202025 	move	a0,s1
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01284:	72779802 	mul	s3,s3,s7
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:36
		auto read = *mem;
bfc01288:	96270000 	lhu	a3,0(s1)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0128c:	0275001b 	divu	zero,s3,s5
bfc01290:	02a001f4 	teq	s5,zero,0x7
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:36
		auto read = *mem;
bfc01294:	30e7ffff 	andi	a3,a3,0xffff
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01298:	00009810 	mfhi	s3
_Z14do_test_memoryItEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:37
		if (read != static_cast<Type>(next)) {
bfc0129c:	3262ffff 	andi	v0,s3,0xffff
bfc012a0:	14e2ffc2 	bne	a3,v0,bfc011ac <_Z11test_memoryPvS_+0xe0>
bfc012a4:	02603025 	move	a2,s3
_Z11test_memoryPvS_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:41
		mem++;
bfc012a8:	1000ffef 	b	bfc01268 <_Z11test_memoryPvS_+0x19c>
bfc012ac:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:57
	puts("OK!");
bfc012b0:	0ff0041c 	jal	bfc01070 <puts>
bfc012b4:	26841d1c 	addiu	a0,s4,7452
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:59
	putstring("Testing memory by byte...");
bfc012b8:	3c04bfc0 	lui	a0,0xbfc0
bfc012bc:	0ff00404 	jal	bfc01010 <putstring>
bfc012c0:	24841d40 	addiu	a0,a0,7488
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc012c4:	3c047fff 	lui	a0,0x7fff
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:17
	auto *mem = start;
bfc012c8:	02001825 	move	v1,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:19
	rand_seed = 23;
bfc012cc:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc012d0:	240641a7 	li	a2,16807
bfc012d4:	3484ffff 	ori	a0,a0,0xffff
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:21
	while(mem < end) {
bfc012d8:	0072282b 	sltu	a1,v1,s2
bfc012dc:	10a00009 	beqz	a1,bfc01304 <_Z11test_memoryPvS_+0x238>
bfc012e0:	70461002 	mul	v0,v0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:23
		mem++;
bfc012e4:	24630001 	addiu	v1,v1,1
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc012e8:	0044001b 	divu	zero,v0,a0
bfc012ec:	008001f4 	teq	a0,zero,0x7
bfc012f0:	00001010 	mfhi	v0
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:22
		*mem = rand(rand_seed);
bfc012f4:	304500ff 	andi	a1,v0,0xff
bfc012f8:	a065ffff 	sb	a1,-1(v1)
_Z11test_memoryPvS_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:21
	while(mem < end) {
bfc012fc:	1000fff7 	b	bfc012dc <_Z11test_memoryPvS_+0x210>
bfc01300:	0072282b 	sltu	a1,v1,s2
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc01304:	3c15000f 	lui	s5,0xf
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01308:	3c137fff 	lui	s3,0x7fff
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:28
	rand_seed = 23;
bfc0130c:	24110017 	li	s1,23
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc01310:	36b5ffff 	ori	s5,s5,0xffff
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01314:	241641a7 	li	s6,16807
bfc01318:	3673ffff 	ori	s3,s3,0xffff
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:30
	while(mem < end) {
bfc0131c:	0212102b 	sltu	v0,s0,s2
bfc01320:	10400013 	beqz	v0,bfc01370 <_Z11test_memoryPvS_+0x2a4>
bfc01324:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:32
		if ((uint32_t) mem % 0x100000 == 0) {
bfc01328:	02151024 	and	v0,s0,s5
bfc0132c:	14400003 	bnez	v0,bfc0133c <_Z11test_memoryPvS_+0x270>
bfc01330:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:33
			write_segment((uint32_t) mem);
bfc01334:	0ff00518 	jal	bfc01460 <write_segment>
bfc01338:	02002025 	move	a0,s0
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc0133c:	72368802 	mul	s1,s1,s6
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:36
		auto read = *mem;
bfc01340:	92070000 	lbu	a3,0(s0)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01344:	0233001b 	divu	zero,s1,s3
bfc01348:	026001f4 	teq	s3,zero,0x7
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:36
		auto read = *mem;
bfc0134c:	30e700ff 	andi	a3,a3,0xff
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
bfc01350:	00008810 	mfhi	s1
_Z14do_test_memoryIhEbPvS0_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:37
		if (read != static_cast<Type>(next)) {
bfc01354:	322200ff 	andi	v0,s1,0xff
bfc01358:	10e20003 	beq	a3,v0,bfc01368 <_Z11test_memoryPvS_+0x29c>
bfc0135c:	02203025 	move	a2,s1
_Z11test_memoryPvS_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:38
			printf("Error at 0x%p: expect 0x%p, got 0x%p\n", mem, next, read);
bfc01360:	1000ff93 	b	bfc011b0 <_Z11test_memoryPvS_+0xe4>
bfc01364:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:41
		mem++;
bfc01368:	1000ffec 	b	bfc0131c <_Z11test_memoryPvS_+0x250>
bfc0136c:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:61
	puts("OK!");
bfc01370:	0ff0041c 	jal	bfc01070 <puts>
bfc01374:	26841d1c 	addiu	a0,s4,7452
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:63
    return true;
bfc01378:	1000ff91 	b	bfc011c0 <_Z11test_memoryPvS_+0xf4>
bfc0137c:	24020001 	li	v0,1

bfc01380 <read_word>:
_Z4readIjET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
#include <machine.h>

template<typename T>
T read(void *addr){
    auto *ptr = reinterpret_cast<volatile T *const>(addr);
    return *ptr;
bfc01380:	8c820000 	lw	v0,0(a0)
read_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:28
#define RUN_FOR_ALL_TYPE(FUNC) FUNC(byte) \
    FUNC(hword) \
    FUNC(word) \
    FUNC(dword)

RUN_FOR_ALL_TYPE(GENERATE_READ_FUNC)
bfc01384:	03e00008 	jr	ra
bfc01388:	00000000 	nop

bfc0138c <init_serial>:
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc0138c:	3c02bfd0 	lui	v0,0xbfd0
bfc01390:	2403ff81 	li	v1,-127
bfc01394:	a0433008 	sb	v1,12296(v0)
bfc01398:	2403ff80 	li	v1,-128
bfc0139c:	a043300c 	sb	v1,12300(v0)
bfc013a0:	24030036 	li	v1,54
bfc013a4:	a0433000 	sb	v1,12288(v0)
bfc013a8:	24030003 	li	v1,3
bfc013ac:	a0403004 	sb	zero,12292(v0)
bfc013b0:	a043300c 	sb	v1,12300(v0)
bfc013b4:	a0403010 	sb	zero,12304(v0)
bfc013b8:	a0403004 	sb	zero,12292(v0)
init_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:45
	write_byte(UART_LCR_ADDR, ~0x80 & 0x03);
	// disable modem controls
	write_byte(UART_MCR_ADDR, 0);
	// disable interrupts
	write_byte(UART_IER_ADDR, 0);
}
bfc013bc:	03e00008 	jr	ra
bfc013c0:	00000000 	nop

bfc013c4 <read_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
bfc013c4:	3c03bfd0 	lui	v1,0xbfd0
bfc013c8:	90623014 	lbu	v0,12308(v1)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:48

byte_t read_serial(){
	while (!(read_byte(UART_LSR_ADDR) & 0x01));
bfc013cc:	30420001 	andi	v0,v0,0x1
bfc013d0:	1040fffd 	beqz	v0,bfc013c8 <read_serial+0x4>
bfc013d4:	3c02bfd0 	lui	v0,0xbfd0
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
bfc013d8:	90423000 	lbu	v0,12288(v0)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:50
	return read_byte(UART_DAT_ADDR);
}
bfc013dc:	03e00008 	jr	ra
bfc013e0:	00000000 	nop

bfc013e4 <write_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
bfc013e4:	3c03bfd0 	lui	v1,0xbfd0
bfc013e8:	90623014 	lbu	v0,12308(v1)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:53

void write_serial(byte_t data){
	while (!(read_byte(UART_LSR_ADDR) & 0x40));
bfc013ec:	30420040 	andi	v0,v0,0x40
bfc013f0:	1040fffd 	beqz	v0,bfc013e8 <write_serial+0x4>
bfc013f4:	3c02bfd0 	lui	v0,0xbfd0
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc013f8:	a0443000 	sb	a0,12288(v0)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:55
	write_byte(UART_DAT_ADDR, data);
}
bfc013fc:	03e00008 	jr	ra
bfc01400:	00000000 	nop

bfc01404 <read_serial_word>:
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:57

word_t read_serial_word(){
bfc01404:	27bdffe8 	addiu	sp,sp,-24
bfc01408:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word_t word = 0;
	word |= read_serial();
bfc0140c:	0ff004f1 	jal	bfc013c4 <read_serial>
bfc01410:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
bfc01414:	0ff004f1 	jal	bfc013c4 <read_serial>
bfc01418:	00402025 	move	a0,v0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
bfc0141c:	0ff004f1 	jal	bfc013c4 <read_serial>
bfc01420:	00402825 	move	a1,v0
bfc01424:	00021400 	sll	v0,v0,0x10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
bfc01428:	00052a00 	sll	a1,a1,0x8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
bfc0142c:	00a22825 	or	a1,a1,v0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
bfc01430:	0ff004f1 	jal	bfc013c4 <read_serial>
bfc01434:	00a42025 	or	a0,a1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
	return word;
}
bfc01438:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
bfc0143c:	00021600 	sll	v0,v0,0x18
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
bfc01440:	00441025 	or	v0,v0,a0
bfc01444:	03e00008 	jr	ra
bfc01448:	27bd0018 	addiu	sp,sp,24

bfc0144c <write_led>:
_Z5writeItEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc0144c:	3c02bff0 	lui	v0,0xbff0
bfc01450:	3442f000 	ori	v0,v0,0xf000
bfc01454:	a4440000 	sh	a0,0(v0)
write_led():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:68

void write_led(hword_t data){
	write_hword(LED_ADDR, data);
}
bfc01458:	03e00008 	jr	ra
bfc0145c:	00000000 	nop

bfc01460 <write_segment>:
_Z5writeIjEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
bfc01460:	3c02bff0 	lui	v0,0xbff0
bfc01464:	3442f010 	ori	v0,v0,0xf010
bfc01468:	ac440000 	sw	a0,0(v0)
write_segment():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:72

void write_segment(word_t data){
	write_word(NUM_ADDR, data);
}
bfc0146c:	03e00008 	jr	ra
bfc01470:	00000000 	nop

bfc01474 <read_switches>:
_Z4readIjET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
bfc01474:	3c02bff0 	lui	v0,0xbff0
bfc01478:	3442f020 	ori	v0,v0,0xf020
bfc0147c:	8c420000 	lw	v0,0(v0)
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:76

word_t read_switches(){
	return read_word(SWITCHES_ADDR);
}
bfc01480:	03e00008 	jr	ra
bfc01484:	00000000 	nop
bfc01488:	746f6f42 	jalx	b1bdbd08 <_mem_end+0x29bcbd08>
bfc0148c:	20676e69 	addi	a3,v1,28265
bfc01490:	6d6f7266 	0x6d6f7266
bfc01494:	64646120 	0x64646120
bfc01498:	73736572 	0x73736572
bfc0149c:	25783020 	addiu	t8,t3,12320
bfc014a0:	2e2e2e70 	sltiu	t6,s1,11888
bfc014a4:	0000000a 	movz	zero,zero,zero
bfc014a8:	3d3d3d3d 	0x3d3d3d3d
bfc014ac:	6978453d 	0x6978453d
bfc014b0:	676e6974 	0x676e6974
bfc014b4:	69725420 	0x69725420
bfc014b8:	6c616976 	0x6c616976
bfc014bc:	746f6f42 	jalx	b1bdbd08 <_mem_end+0x29bcbd08>
bfc014c0:	64616f6c 	0x64616f6c
bfc014c4:	3d3d7265 	0x3d3d7265
bfc014c8:	003d3d3d 	0x3d3d3d
bfc014cc:	4f525245 	c3	0x1525245
bfc014d0:	50203a52 	beqzl	at,bfc0fe1c <_text_end+0xe0a4>
bfc014d4:	72676f72 	0x72676f72
bfc014d8:	61206d61 	0x61206d61
bfc014dc:	6220646e 	0x6220646e
bfc014e0:	6c746f6f 	0x6c746f6f
bfc014e4:	6564616f 	0x6564616f
bfc014e8:	656d2072 	0x656d2072
bfc014ec:	79726f6d 	0x79726f6d
bfc014f0:	65766f20 	0x65766f20
bfc014f4:	70616c72 	0x70616c72
bfc014f8:	0000002e 	0x2e
bfc014fc:	4f525245 	c3	0x1525245
bfc01500:	4e203a52 	c3	0x203a52
bfc01504:	6176206f 	0x6176206f
bfc01508:	2064696c 	addi	a0,v1,26988
bfc0150c:	20464c45 	addi	a2,v0,19525
bfc01510:	6967616d 	0x6967616d
bfc01514:	6f662063 	0x6f662063
bfc01518:	20646e75 	addi	a0,v1,28277
bfc0151c:	61206e69 	0x61206e69
bfc01520:	65726464 	0x65726464
bfc01524:	30207373 	andi	zero,at,0x7373
bfc01528:	2e702578 	sltiu	s0,s3,9592
bfc0152c:	0000000a 	movz	zero,zero,zero
bfc01530:	4f525245 	c3	0x1525245
bfc01534:	4d203a52 	0x4d203a52
bfc01538:	69686361 	0x69686361
bfc0153c:	7420656e 	jalx	b08195b8 <_mem_end+0x288095b8>
bfc01540:	20657079 	addi	a1,v1,28793
bfc01544:	6f206425 	0x6f206425
bfc01548:	4c452066 	0x4c452066
bfc0154c:	69662046 	0x69662046
bfc01550:	6420656c 	0x6420656c
bfc01554:	2073656f 	addi	s3,v1,25967
bfc01558:	20746f6e 	addi	s4,v1,28526
bfc0155c:	6374616d 	0x6374616d
bfc01560:	68742068 	0x68742068
bfc01564:	50432065 	beql	v0,v1,bfc096fc <_text_end+0x7984>
bfc01568:	000a2e55 	0xa2e55
bfc0156c:	696c6156 	0x696c6156
bfc01570:	4c452064 	0x4c452064
bfc01574:	69662046 	0x69662046
bfc01578:	6620656c 	0x6620656c
bfc0157c:	646e756f 	0x646e756f
bfc01580:	6977202c 	0x6977202c
bfc01584:	6e206c6c 	0x6e206c6c
bfc01588:	6320776f 	0x6320776f
bfc0158c:	2079706f 	addi	t9,v1,28783
bfc01590:	52206f74 	beqzl	s1,bfc1d364 <_text_end+0x1b5ec>
bfc01594:	002e4d41 	0x2e4d41
bfc01598:	79706f43 	0x79706f43
bfc0159c:	20676e69 	addi	a3,v1,28265
bfc015a0:	62206425 	0x62206425
bfc015a4:	73657479 	0x73657479
bfc015a8:	6f726620 	0x6f726620
bfc015ac:	666f206d 	0x666f206d
bfc015b0:	74657366 	jalx	b195cd98 <_mem_end+0x2994cd98>
bfc015b4:	25783020 	addiu	t8,t3,12320
bfc015b8:	6f742070 	0x6f742070
bfc015bc:	64646120 	0x64646120
bfc015c0:	73736572 	0x73736572
bfc015c4:	25783020 	addiu	t8,t3,12320
bfc015c8:	00000a70 	tge	zero,zero,0x29
bfc015cc:	646e6553 	0x646e6553
bfc015d0:	6e697520 	0x6e697520
bfc015d4:	20323374 	addi	s2,at,13172
bfc015d8:	75716573 	jalx	b5c595cc <_mem_end+0x2dc495cc>
bfc015dc:	65636e65 	0x65636e65
bfc015e0:	7830203a 	0x7830203a
bfc015e4:	33323332 	andi	s2,t9,0x3332
bfc015e8:	33323332 	andi	s2,t9,0x3332
bfc015ec:	46464f20 	c1	0x464f20
bfc015f0:	20544553 	addi	s4,v0,17747
bfc015f4:	474e454c 	c1	0x14e454c
bfc015f8:	00004854 	0x4854
bfc015fc:	544e4520 	bnel	v0,t6,bfc12a80 <_text_end+0x10d08>
bfc01600:	44205952 	0x44205952
bfc01604:	2e415441 	sltiu	at,s2,21569
bfc01608:	00002e2e 	0x2e2e
bfc0160c:	7366664f 	0x7366664f
bfc01610:	203a7465 	addi	k0,at,29797
bfc01614:	70257830 	0x70257830
bfc01618:	656c202c 	0x656c202c
bfc0161c:	6874676e 	0x6874676e
bfc01620:	6425203a 	0x6425203a
bfc01624:	74796220 	jalx	b1e58880 <_mem_end+0x29e48880>
bfc01628:	202c7365 	addi	t4,at,29541
bfc0162c:	72746e65 	0x72746e65
bfc01630:	30203a79 	andi	zero,at,0x3a79
bfc01634:	2e702578 	sltiu	s0,s3,9592
bfc01638:	61745320 	0x61745320
bfc0163c:	72207472 	0x72207472
bfc01640:	69656365 	0x69656365
bfc01644:	676e6976 	0x676e6976
bfc01648:	74616420 	jalx	b1859080 <_mem_end+0x29849080>
bfc0164c:	2e2e2e61 	sltiu	t6,s1,11873
bfc01650:	0000000a 	movz	zero,zero,zero
bfc01654:	656e6f44 	0x656e6f44
bfc01658:	63657220 	0x63657220
bfc0165c:	69766965 	0x69766965
bfc01660:	6420676e 	0x6420676e
bfc01664:	2e617461 	sltiu	at,s3,29793
bfc01668:	00000000 	nop
bfc0166c:	74696157 	jalx	b1a5855c <_mem_end+0x29a4855c>
bfc01670:	20676e69 	addi	a3,v1,28265
bfc01674:	20726f66 	addi	s2,v1,28518
bfc01678:	65732032 	0x65732032
bfc0167c:	646e6f63 	0x646e6f63
bfc01680:	2e2e2e73 	sltiu	t6,s1,11891
bfc01684:	00000000 	nop
bfc01688:	3d3d3d3d 	0x3d3d3d3d
bfc0168c:	746e453d 	jalx	b1b914f4 <_mem_end+0x29b814f4>
bfc01690:	6e697265 	0x6e697265
bfc01694:	72542067 	0x72542067
bfc01698:	61697669 	0x61697669
bfc0169c:	6f6f426c 	0x6f6f426c
bfc016a0:	616f6c74 	0x616f6c74
bfc016a4:	3d726564 	0x3d726564
bfc016a8:	3d3d3d3d 	0x3d3d3d3d
bfc016ac:	00000000 	nop
bfc016b0:	746f6f42 	jalx	b1bdbd08 <_mem_end+0x29bcbd08>
bfc016b4:	64616f6c 	0x64616f6c
bfc016b8:	75207265 	jalx	b481c994 <_mem_end+0x2c80c994>
bfc016bc:	20646573 	addi	a0,v1,25971
bfc016c0:	6f6d656d 	0x6f6d656d
bfc016c4:	203a7972 	addi	k0,at,31090
bfc016c8:	6d6f7266 	0x6d6f7266
bfc016cc:	25783020 	addiu	t8,t3,12320
bfc016d0:	6f742078 	0x6f742078
bfc016d4:	25783020 	addiu	t8,t3,12320
bfc016d8:	00000a78 	0xa78
bfc016dc:	6f6d654d 	0x6f6d654d
bfc016e0:	74207972 	jalx	b081e5c8 <_mem_end+0x2880e5c8>
bfc016e4:	20747365 	addi	s4,v1,29541
bfc016e8:	6c696166 	0x6c696166
bfc016ec:	202e6465 	addi	t6,at,25701
bfc016f0:	726f6241 	0x726f6241
bfc016f4:	00002e74 	teq	zero,zero,0xb9
bfc016f8:	6f6d654d 	0x6f6d654d
bfc016fc:	74207972 	jalx	b081e5c8 <_mem_end+0x2880e5c8>
bfc01700:	20747365 	addi	s4,v1,29541
bfc01704:	63637573 	0x63637573
bfc01708:	65646565 	0x65646565
bfc0170c:	00002e64 	0x2e64
bfc01710:	69617641 	0x69617641
bfc01714:	6c62616c 	0x6c62616c
bfc01718:	656d2065 	0x656d2065
bfc0171c:	79726f6d 	0x79726f6d
bfc01720:	6c696620 	0x6c696620
bfc01724:	2064656c 	addi	a0,v1,25964
bfc01728:	68746977 	0x68746977
bfc0172c:	72657a20 	0x72657a20
bfc01730:	00002e6f 	0x2e6f
bfc01734:	65646f4d 	0x65646f4d
bfc01738:	0000203a 	0x203a
bfc0173c:	746f6f42 	jalx	b1bdbd08 <_mem_end+0x29bcbd08>
bfc01740:	7665440a 	jalx	b9951028 <_mem_end+0x31941028>
bfc01744:	3a656369 	xori	a1,s3,0x6369
bfc01748:	00000020 	add	zero,zero,zero
bfc0174c:	20495053 	addi	t1,v0,20563
bfc01750:	73616c46 	0x73616c46
bfc01754:	00000068 	0x68
bfc01758:	54524155 	bnel	v0,s2,bfc11cb0 <_text_end+0xff38>
bfc0175c:	63655220 	0x63655220
bfc01760:	65766965 	0x65766965
bfc01764:	00000072 	tlt	zero,zero,0x1
bfc01768:	004d4152 	0x4d4152
bfc0176c:	432d6e4f 	c0	0x12d6e4f
bfc01770:	2d706968 	sltiu	s0,t3,26984
bfc01774:	6f6d654d 	0x6f6d654d
bfc01778:	00007972 	tlt	zero,zero,0x1e5
bfc0177c:	20746f4e 	addi	s4,v1,28494
bfc01780:	656c6553 	0x656c6553
bfc01784:	64657463 	0x64657463
bfc01788:	00000000 	nop
bfc0178c:	706d7544 	0x706d7544
bfc01790:	00000000 	nop
bfc01794:	7366664f 	0x7366664f
bfc01798:	203a7465 	addi	k0,at,29797
bfc0179c:	70257830 	0x70257830
bfc017a0:	656c202c 	0x656c202c
bfc017a4:	6874676e 	0x6874676e
bfc017a8:	6425203a 	0x6425203a
bfc017ac:	74796220 	jalx	b1e58880 <_mem_end+0x29e48880>
bfc017b0:	202e7365 	addi	t6,at,29541
bfc017b4:	72617453 	0x72617453
bfc017b8:	65732074 	0x65732074
bfc017bc:	6e69646e 	0x6e69646e
bfc017c0:	61642067 	0x61642067
bfc017c4:	2e2e6174 	sltiu	t6,s1,24948
bfc017c8:	0000002e 	0x2e
bfc017cc:	656e6f44 	0x656e6f44
bfc017d0:	6e657320 	0x6e657320
bfc017d4:	676e6964 	0x676e6964
bfc017d8:	74616420 	jalx	b1859080 <_mem_end+0x29849080>
bfc017dc:	00000061 	0x61
bfc017e0:	2a2a2a2a 	slti	t2,s1,10794
bfc017e4:	6972542a 	0x6972542a
bfc017e8:	6c616976 	0x6c616976
bfc017ec:	5350494d 	beql	k0,s0,bfc13d24 <_text_end+0x11fac>
bfc017f0:	72614220 	0x72614220
bfc017f4:	654d2065 	0x654d2065
bfc017f8:	206c6174 	addi	t4,v1,24948
bfc017fc:	74737953 	jalx	b1cde54c <_mem_end+0x29cce54c>
bfc01800:	2a2a6d65 	slti	t2,s1,28005
bfc01804:	002a2a2a 	0x2a2a2a
bfc01808:	706d6f43 	0x706d6f43
bfc0180c:	74616c69 	jalx	b185b1a4 <_mem_end+0x2984b1a4>
bfc01810:	206e6f69 	addi	t6,v1,28521
bfc01814:	656d6974 	0x656d6974
bfc01818:	3931203a 	xori	s1,t1,0x203a
bfc0181c:	3a37313a 	xori	s7,s1,0x313a
bfc01820:	44203234 	0x44203234
bfc01824:	31206365 	andi	zero,t1,0x6365
bfc01828:	30322035 	andi	s2,at,0x2035
bfc0182c:	00003931 	tgeu	zero,zero,0xe4
bfc01830:	6c6c6946 	0x6c6c6946
bfc01834:	20676e69 	addi	a3,v1,28265
bfc01838:	7373622e 	0x7373622e
bfc0183c:	63657320 	0x63657320
bfc01840:	6e6f6974 	0x6e6f6974
bfc01844:	74697720 	jalx	b1a5dc80 <_mem_end+0x29a4dc80>
bfc01848:	2c302068 	sltiu	s0,at,8296
bfc0184c:	66666f20 	0x66666f20
bfc01850:	3a746573 	xori	s4,s3,0x6573
bfc01854:	25783020 	addiu	t8,t3,12320
bfc01858:	73202c78 	0x73202c78
bfc0185c:	3a657a69 	xori	a1,s3,0x7a69
bfc01860:	20642520 	addi	a0,v1,9504
bfc01864:	65747962 	0x65747962
bfc01868:	000a2e73 	tltu	zero,t2,0xb9
bfc0186c:	676f7250 	0x676f7250
bfc01870:	206d6172 	addi	t5,v1,24946
bfc01874:	74697865 	jalx	b1a5e194 <_mem_end+0x29a4e194>
bfc01878:	6e206465 	0x6e206465
bfc0187c:	616d726f 	0x616d726f
bfc01880:	2e796c6c 	sltiu	t9,s3,27756
bfc01884:	00000000 	nop
bfc01888:	676f7250 	0x676f7250
bfc0188c:	206d6172 	addi	t5,v1,24946
bfc01890:	74697865 	jalx	b1a5e194 <_mem_end+0x29a4e194>
bfc01894:	61206465 	0x61206465
bfc01898:	726f6e62 	0x726f6e62
bfc0189c:	6c6c616d 	0x6c6c616d
bfc018a0:	69772079 	0x69772079
bfc018a4:	63206874 	0x63206874
bfc018a8:	2065646f 	addi	a1,v1,25711
bfc018ac:	0a2e6425 	j	b8b99094 <_mem_end+0x30b89094>
bfc018b0:	00000000 	nop
bfc018b4:	69676552 	0x69676552
bfc018b8:	72657473 	0x72657473
bfc018bc:	64252420 	0x64252420
bfc018c0:	7025203a 	0x7025203a
bfc018c4:	0000000a 	movz	zero,zero,zero
bfc018c8:	3a435045 	xori	v1,s2,0x5045
bfc018cc:	2c702520 	sltiu	s0,v1,9504
bfc018d0:	75614320 	jalx	b5850c80 <_mem_end+0x2d840c80>
bfc018d4:	203a6573 	addi	k0,at,25971
bfc018d8:	202c7025 	addi	t4,at,28709
bfc018dc:	74617453 	jalx	b185d14c <_mem_end+0x2984d14c>
bfc018e0:	203a7375 	addi	k0,at,29557
bfc018e4:	202c7025 	addi	t4,at,28709
bfc018e8:	56646142 	bnel	s3,a0,bfc19df4 <_text_end+0x1807c>
bfc018ec:	72646441 	0x72646441
bfc018f0:	7025203a 	0x7025203a
bfc018f4:	4245202c 	c0	0x45202c
bfc018f8:	3a657361 	xori	a1,s3,0x7361
bfc018fc:	0a702520 	j	b9c09480 <_mem_end+0x31bf9480>
bfc01900:	00000000 	nop
bfc01904:	20424c54 	addi	v0,v0,19540
bfc01908:	6d657469 	0x6d657469
bfc0190c:	3a642520 	xori	a0,s3,0x2520
bfc01910:	746e4520 	jalx	b1b91480 <_mem_end+0x29b81480>
bfc01914:	69487972 	0x69487972
bfc01918:	2c702520 	sltiu	s0,v1,9504
bfc0191c:	746e4520 	jalx	b1b91480 <_mem_end+0x29b81480>
bfc01920:	6f4c7972 	0x6f4c7972
bfc01924:	25203a31 	addiu	zero,t1,14897
bfc01928:	45202c70 	0x45202c70
bfc0192c:	7972746e 	0x7972746e
bfc01930:	3a326f4c 	xori	s2,s1,0x6f4c
bfc01934:	0a702520 	j	b9c09480 <_mem_end+0x31bf9480>
bfc01938:	00000000 	nop
bfc0193c:	20555043 	addi	s5,v0,20547
bfc01940:	65746e69 	0x65746e69
bfc01944:	6c616e72 	0x6c616e72
bfc01948:	73736120 	0x73736120
bfc0194c:	69747265 	0x69747265
bfc01950:	66206e6f 	0x66206e6f
bfc01954:	656c6961 	0x656c6961
bfc01958:	61202c64 	0x61202c64
bfc0195c:	74726f62 	jalx	b1c9bd88 <_mem_end+0x29c8bd88>
bfc01960:	0000002e 	0x2e
bfc01964:	65206e41 	0x65206e41
bfc01968:	70656378 	0x70656378
bfc0196c:	6e6f6974 	0x6e6f6974
bfc01970:	63636f20 	0x63636f20
bfc01974:	65727275 	0x65727275
bfc01978:	77202c64 	jalx	bc80b190 <_mem_end+0x347fb190>
bfc0197c:	20687469 	addi	t0,v1,29801
bfc01980:	20435045 	addi	v1,v0,20549
bfc01984:	78257830 	0x78257830
bfc01988:	646e6120 	0x646e6120
bfc0198c:	75614320 	jalx	b5850c80 <_mem_end+0x2d840c80>
bfc01990:	25206573 	addiu	zero,t1,25971
bfc01994:	25282064 	addiu	t0,t1,8292
bfc01998:	0a2e2973 	j	b8b8a5cc <_mem_end+0x30b7a5cc>
bfc0199c:	00000000 	nop
bfc019a0:	2a2a2a2a 	slti	t2,s1,10794
bfc019a4:	7379532a 	0x7379532a
bfc019a8:	206d6574 	addi	t5,v1,25972
bfc019ac:	474e4148 	c1	0x14e4148
bfc019b0:	2a2a2a2a 	slti	t2,s1,10794
bfc019b4:	0000002a 	slt	zero,zero,zero
bfc019b8:	65746e49 	0x65746e49
bfc019bc:	70757272 	0x70757272
bfc019c0:	00000074 	teq	zero,zero,0x1
bfc019c4:	20424c54 	addi	v0,v0,19540
bfc019c8:	69646f6d 	0x69646f6d
bfc019cc:	61636966 	0x61636966
bfc019d0:	6e6f6974 	0x6e6f6974
bfc019d4:	63786520 	0x63786520
bfc019d8:	69747065 	0x69747065
bfc019dc:	00006e6f 	0x6e6f
bfc019e0:	20424c54 	addi	v0,v0,19540
bfc019e4:	65637865 	0x65637865
bfc019e8:	6f697470 	0x6f697470
bfc019ec:	6c28206e 	0x6c28206e
bfc019f0:	2064616f 	addi	a0,v1,24943
bfc019f4:	6920726f 	0x6920726f
bfc019f8:	7274736e 	0x7274736e
bfc019fc:	69746375 	0x69746375
bfc01a00:	66206e6f 	0x66206e6f
bfc01a04:	68637465 	0x68637465
bfc01a08:	00000029 	0x29
bfc01a0c:	20424c54 	addi	v0,v0,19540
bfc01a10:	65637865 	0x65637865
bfc01a14:	6f697470 	0x6f697470
bfc01a18:	7328206e 	0x7328206e
bfc01a1c:	65726f74 	0x65726f74
bfc01a20:	00000029 	0x29
bfc01a24:	72646441 	0x72646441
bfc01a28:	20737365 	addi	s3,v1,29541
bfc01a2c:	6f727265 	0x6f727265
bfc01a30:	78652072 	0x78652072
bfc01a34:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc01a38:	206e6f69 	addi	t6,v1,28521
bfc01a3c:	616f6c28 	0x616f6c28
bfc01a40:	726f2064 	0x726f2064
bfc01a44:	736e6920 	0x736e6920
bfc01a48:	63757274 	0x63757274
bfc01a4c:	6e6f6974 	0x6e6f6974
bfc01a50:	74656620 	jalx	b1959880 <_mem_end+0x29949880>
bfc01a54:	00296863 	0x296863
bfc01a58:	72646441 	0x72646441
bfc01a5c:	20737365 	addi	s3,v1,29541
bfc01a60:	6f727265 	0x6f727265
bfc01a64:	78652072 	0x78652072
bfc01a68:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc01a6c:	206e6f69 	addi	t6,v1,28521
bfc01a70:	6f747328 	0x6f747328
bfc01a74:	00296572 	tlt	at,t1,0x195
bfc01a78:	20737542 	addi	s3,v1,30018
bfc01a7c:	6f727265 	0x6f727265
bfc01a80:	78652072 	0x78652072
bfc01a84:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc01a88:	206e6f69 	addi	t6,v1,28521
bfc01a8c:	736e6928 	0x736e6928
bfc01a90:	63757274 	0x63757274
bfc01a94:	6e6f6974 	0x6e6f6974
bfc01a98:	74656620 	jalx	b1959880 <_mem_end+0x29949880>
bfc01a9c:	00296863 	0x296863
bfc01aa0:	20737542 	addi	s3,v1,30018
bfc01aa4:	6f727265 	0x6f727265
bfc01aa8:	78652072 	0x78652072
bfc01aac:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc01ab0:	206e6f69 	addi	t6,v1,28521
bfc01ab4:	74616428 	jalx	b18590a0 <_mem_end+0x298490a0>
bfc01ab8:	65722061 	0x65722061
bfc01abc:	65726566 	0x65726566
bfc01ac0:	3a65636e 	xori	a1,s3,0x636e
bfc01ac4:	616f6c20 	0x616f6c20
bfc01ac8:	726f2064 	0x726f2064
bfc01acc:	6f747320 	0x6f747320
bfc01ad0:	00296572 	tlt	at,t1,0x195
bfc01ad4:	63737953 	0x63737953
bfc01ad8:	206c6c61 	addi	t4,v1,27745
bfc01adc:	65637865 	0x65637865
bfc01ae0:	6f697470 	0x6f697470
bfc01ae4:	0000006e 	0x6e
bfc01ae8:	61657242 	0x61657242
bfc01aec:	696f706b 	0x696f706b
bfc01af0:	6520746e 	0x6520746e
bfc01af4:	70656378 	0x70656378
bfc01af8:	6e6f6974 	0x6e6f6974
bfc01afc:	00000000 	nop
bfc01b00:	65736552 	0x65736552
bfc01b04:	64657672 	0x64657672
bfc01b08:	736e6920 	0x736e6920
bfc01b0c:	63757274 	0x63757274
bfc01b10:	6e6f6974 	0x6e6f6974
bfc01b14:	63786520 	0x63786520
bfc01b18:	69747065 	0x69747065
bfc01b1c:	00006e6f 	0x6e6f
bfc01b20:	72706f43 	0x72706f43
bfc01b24:	7365636f 	0x7365636f
bfc01b28:	20726f73 	addi	s2,v1,28531
bfc01b2c:	73756e55 	0x73756e55
bfc01b30:	656c6261 	0x656c6261
bfc01b34:	63786520 	0x63786520
bfc01b38:	69747065 	0x69747065
bfc01b3c:	00006e6f 	0x6e6f
bfc01b40:	74697241 	jalx	b1a5c904 <_mem_end+0x29a4c904>
bfc01b44:	74656d68 	jalx	b195b5a0 <_mem_end+0x2994b5a0>
bfc01b48:	4f206369 	c3	0x1206369
bfc01b4c:	66726576 	0x66726576
bfc01b50:	20776f6c 	addi	s7,v1,28524
bfc01b54:	65637865 	0x65637865
bfc01b58:	6f697470 	0x6f697470
bfc01b5c:	0000006e 	0x6e
bfc01b60:	70617254 	0x70617254
bfc01b64:	63786520 	0x63786520
bfc01b68:	69747065 	0x69747065
bfc01b6c:	00006e6f 	0x6e6f
bfc01b70:	2041534d 	addi	at,v0,21325
bfc01b74:	616f6c46 	0x616f6c46
bfc01b78:	676e6974 	0x676e6974
bfc01b7c:	696f502d 	0x696f502d
bfc01b80:	6520746e 	0x6520746e
bfc01b84:	70656378 	0x70656378
bfc01b88:	6e6f6974 	0x6e6f6974
bfc01b8c:	00000000 	nop
bfc01b90:	20424c54 	addi	v0,v0,19540
bfc01b94:	64616552 	0x64616552
bfc01b98:	686e492d 	0x686e492d
bfc01b9c:	74696269 	jalx	b1a589a4 <_mem_end+0x29a489a4>
bfc01ba0:	63786520 	0x63786520
bfc01ba4:	69747065 	0x69747065
bfc01ba8:	00006e6f 	0x6e6f
bfc01bac:	20424c54 	addi	v0,v0,19540
bfc01bb0:	63657845 	0x63657845
bfc01bb4:	6f697475 	0x6f697475
bfc01bb8:	6e492d6e 	0x6e492d6e
bfc01bbc:	69626968 	0x69626968
bfc01bc0:	78652074 	0x78652074
bfc01bc4:	74706563 	jalx	b1c1958c <_mem_end+0x29c0958c>
bfc01bc8:	006e6f69 	0x6e6f69
bfc01bcc:	43544157 	c0	0x1544157
bfc01bd0:	00000048 	0x48
bfc01bd4:	6863614d 	0x6863614d
bfc01bd8:	20656e69 	addi	a1,v1,28265
bfc01bdc:	63656863 	0x63656863
bfc01be0:	0000006b 	0x6b
bfc01be4:	65726854 	0x65726854
bfc01be8:	41206461 	0x41206461
bfc01bec:	636f6c6c 	0x636f6c6c
bfc01bf0:	6f697461 	0x6f697461
bfc01bf4:	44202c6e 	0x44202c6e
bfc01bf8:	6c6c6165 	0x6c6c6165
bfc01bfc:	7461636f 	jalx	b1858dbc <_mem_end+0x29848dbc>
bfc01c00:	2c6e6f69 	sltiu	t6,v1,28521
bfc01c04:	20726f20 	addi	s2,v1,28448
bfc01c08:	65686353 	0x65686353
bfc01c0c:	696c7564 	0x696c7564
bfc01c10:	4520676e 	0x4520676e
bfc01c14:	70656378 	0x70656378
bfc01c18:	6e6f6974 	0x6e6f6974
bfc01c1c:	00000073 	tltu	zero,zero,0x1
bfc01c20:	68636143 	0x68636143
bfc01c24:	72652065 	0x72652065
bfc01c28:	00726f72 	tlt	v1,s2,0x1bd

bfc01c2c <EXCEPTION_MESSAGES>:
bfc01c2c:	bfc019b8 	cache	0x0,6584(s8)
bfc01c30:	bfc019c4 	cache	0x0,6596(s8)
bfc01c34:	bfc019e0 	cache	0x0,6624(s8)
bfc01c38:	bfc01a0c 	cache	0x0,6668(s8)
bfc01c3c:	bfc01a24 	cache	0x0,6692(s8)
bfc01c40:	bfc01a58 	cache	0x0,6744(s8)
bfc01c44:	bfc01a78 	cache	0x0,6776(s8)
bfc01c48:	bfc01aa0 	cache	0x0,6816(s8)
bfc01c4c:	bfc01ad4 	cache	0x0,6868(s8)
bfc01c50:	bfc01ae8 	cache	0x0,6888(s8)
bfc01c54:	bfc01b00 	cache	0x0,6912(s8)
bfc01c58:	bfc01b20 	cache	0x0,6944(s8)
bfc01c5c:	bfc01b40 	cache	0x0,6976(s8)
bfc01c60:	bfc01b60 	cache	0x0,7008(s8)
bfc01c64:	bfc01b70 	cache	0x0,7024(s8)
bfc01c68:	bfc01b74 	cache	0x0,7028(s8)
bfc01c6c:	bfc0199c 	cache	0x0,6556(s8)
bfc01c70:	bfc0199c 	cache	0x0,6556(s8)
bfc01c74:	bfc0199c 	cache	0x0,6556(s8)
bfc01c78:	bfc01b90 	cache	0x0,7056(s8)
bfc01c7c:	bfc01bac 	cache	0x0,7084(s8)
bfc01c80:	bfc0199c 	cache	0x0,6556(s8)
bfc01c84:	bfc0199c 	cache	0x0,6556(s8)
bfc01c88:	bfc01bcc 	cache	0x0,7116(s8)
bfc01c8c:	bfc01bd4 	cache	0x0,7124(s8)
bfc01c90:	bfc01be4 	cache	0x0,7140(s8)
bfc01c94:	bfc0199c 	cache	0x0,6556(s8)
bfc01c98:	bfc0199c 	cache	0x0,6556(s8)
bfc01c9c:	bfc0199c 	cache	0x0,6556(s8)
bfc01ca0:	bfc0199c 	cache	0x0,6556(s8)
bfc01ca4:	bfc01c20 	cache	0x0,7200(s8)
bfc01ca8:	bfc0199c 	cache	0x0,6556(s8)
bfc01cac:	72617453 	0x72617453
bfc01cb0:	676e6974 	0x676e6974
bfc01cb4:	6d656d20 	0x6d656d20
bfc01cb8:	2079726f 	addi	t9,v1,29295
bfc01cbc:	74736574 	jalx	b1cd95d0 <_mem_end+0x29cc95d0>
bfc01cc0:	6f726620 	0x6f726620
bfc01cc4:	7830206d 	0x7830206d
bfc01cc8:	74207025 	jalx	b081c094 <_mem_end+0x2880c094>
bfc01ccc:	7830206f 	0x7830206f
bfc01cd0:	0a2e7025 	j	b8b9c094 <_mem_end+0x30b8c094>
bfc01cd4:	00000000 	nop
bfc01cd8:	74736554 	jalx	b1cd9550 <_mem_end+0x29cc9550>
bfc01cdc:	20676e69 	addi	a3,v1,28265
bfc01ce0:	6f6d656d 	0x6f6d656d
bfc01ce4:	62207972 	0x62207972
bfc01ce8:	6f772079 	0x6f772079
bfc01cec:	2e2e6472 	sltiu	t6,s1,25714
bfc01cf0:	0000002e 	0x2e
bfc01cf4:	6f727245 	0x6f727245
bfc01cf8:	74612072 	jalx	b18481c8 <_mem_end+0x298381c8>
bfc01cfc:	25783020 	addiu	t8,t3,12320
bfc01d00:	65203a70 	0x65203a70
bfc01d04:	63657078 	0x63657078
bfc01d08:	78302074 	0x78302074
bfc01d0c:	202c7025 	addi	t4,at,28709
bfc01d10:	20746f67 	addi	s4,v1,28519
bfc01d14:	70257830 	0x70257830
bfc01d18:	0000000a 	movz	zero,zero,zero
bfc01d1c:	00214b4f 	0x214b4f
bfc01d20:	74736554 	jalx	b1cd9550 <_mem_end+0x29cc9550>
bfc01d24:	20676e69 	addi	a3,v1,28265
bfc01d28:	6f6d656d 	0x6f6d656d
bfc01d2c:	62207972 	0x62207972
bfc01d30:	61682079 	0x61682079
bfc01d34:	7720666c 	jalx	bc8199b0 <_mem_end+0x348099b0>
bfc01d38:	2e64726f 	sltiu	a0,s3,29295
bfc01d3c:	00002e2e 	0x2e2e
bfc01d40:	74736554 	jalx	b1cd9550 <_mem_end+0x29cc9550>
bfc01d44:	20676e69 	addi	a3,v1,28265
bfc01d48:	6f6d656d 	0x6f6d656d
bfc01d4c:	62207972 	0x62207972
bfc01d50:	79622079 	0x79622079
bfc01d54:	2e2e6574 	sltiu	t6,s1,25972
bfc01d58:	0000002e 	0x2e
bfc01d5c:	00000000 	nop
bfc01d60:	01200000 	0x1200000
bfc01d64:	02000101 	0x2000101
	...
bfc01d70:	00000001 	movf	zero,zero,$fcc0
bfc01d74:	00000000 	nop

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
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
   c:	02040000 	0x2040000

Disassembly of section .debug_info:

00000000 <.debug_info>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
       0:	00000a4c 	syscall	0x29
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	00000004 	sllv	zero,zero,zero
       8:	01040000 	0x1040000
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
       c:	000002ad 	0x2ad
      10:	00023304 	0x23304
      14:	00024d00 	sll	t1,v0,0x14
      18:	00005000 	sll	t2,zero,0x0
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:6
}
      24:	03040200 	0x3040200
strchr():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memmove(dst, src, n);
#else
    const char *s = src;
    char *d = dst;
    if (s < d && s + n > d) {
      28:	03f80704 	0x3f80704
strcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
      2c:	27040000 	addiu	a0,t8,0
strncpy():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
      30:	03000000 	0x3000000
memcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:330
        s += n, d += n;
      34:	03f30704 	0x3f30704
      38:	0d050000 	jal	4140000 <_mem_avail_start-0x7bec0000>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
      3c:	02000002 	0x2000002
strncmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
      40:	0000270f 	0x270f
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
      44:	00b40500 	0xb40500
      48:	10020000 	beq	zero,v0,4c <_mem_avail_start-0x7fffffb4>
      4c:	00000027 	nor	zero,zero,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	eb060103 	swc2	$6,259(t8)
      54:	03000001 	movf	zero,t8,$fcc0
      58:	00aa0502 	0xaa0502
      5c:	04060000 	0x4060000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
        }
    } else {
        while (n -- > 0) {
            *d ++ = *s ++;
      60:	746e6905 	jalx	1b9a414 <_mem_avail_start-0x7e465bec>
      64:	05040300 	0x5040300
      68:	000001b2 	tlt	zero,zero,0x6
      6c:	00011905 	0x11905
      70:	77090300 	jalx	c240c00 <_mem_avail_start-0x73dbf400>
      74:	03000000 	0x3000000
      78:	01e90801 	movt	at,t7,$fcc2
      7c:	77040000 	jalx	c100000 <_mem_avail_start-0x73f00000>
      80:	05000000 	bltz	t0,84 <_mem_avail_start-0x7fffff7c>
      84:	00000216 	0x216
      88:	008e0a03 	0x8e0a03
      8c:	02030000 	0x2030000
      90:	0003a407 	0x3a407
      94:	04340700 	0x4340700
      98:	00041a2a 	0x41a2a
      9c:	00014a00 	sll	t1,at,0x8
      a0:	02050800 	0x2050800
      a4:	2b040000 	slti	a0,t8,0
      a8:	0000014a 	0x14a
      ac:	01780800 	0x1780800
      b0:	2c040000 	sltiu	a0,zero,0
      b4:	00000083 	sra	zero,zero,0x2
      b8:	00cb0810 	0xcb0810
      bc:	2d040000 	sltiu	a0,t0,0
      c0:	00000083 	sra	zero,zero,0x2
      c4:	01cc0812 	0x1cc0812
      c8:	2e040000 	sltiu	a0,s0,0
      cc:	0000003a 	0x3a
      d0:	00860814 	0x860814
      d4:	2f040000 	sltiu	a0,t8,0
      d8:	0000003a 	0x3a
      dc:	03b70818 	0x3b70818
      e0:	30040000 	andi	a0,zero,0x0
      e4:	0000003a 	0x3a
      e8:	03d7081c 	0x3d7081c
      ec:	31040000 	andi	a0,t0,0x0
      f0:	0000003a 	0x3a
      f4:	00c30820 	add	at,a2,v1
      f8:	32040000 	andi	a0,s0,0x0
      fc:	0000003a 	0x3a
     100:	018a0824 	and	at,t4,t2
     104:	33040000 	andi	a0,t8,0x0
     108:	00000083 	sra	zero,zero,0x2
     10c:	00d50828 	0xd50828
     110:	34040000 	li	a0,0x0
     114:	00000083 	sra	zero,zero,0x2
     118:	046c082a 	teqi	v1,2090
     11c:	35040000 	ori	a0,t0,0x0
     120:	00000083 	sra	zero,zero,0x2
     124:	014a082c 	0x14a082c
     128:	36040000 	ori	a0,s0,0x0
     12c:	00000083 	sra	zero,zero,0x2
     130:	047e082e 	0x47e082e
     134:	37040000 	ori	a0,t8,0x0
     138:	00000083 	sra	zero,zero,0x2
     13c:	004d0830 	tge	v0,t5,0x20
     140:	38040000 	xori	a0,zero,0x0
     144:	00000083 	sra	zero,zero,0x2
     148:	3a090032 	xori	t1,s0,0x32
     14c:	5a000000 	blezl	s0,150 <_mem_avail_start-0x7ffffeb0>
     150:	0a000001 	j	8000004 <_mem_avail_start-0x77fffffc>
     154:	00000027 	nor	zero,zero,zero
     158:	1c050003 	0x1c050003
     15c:	04000004 	bltz	zero,170 <_mem_avail_start-0x7ffffe90>
     160:	00009539 	0x9539
     164:	04200700 	bltz	at,1d68 <_mem_avail_start-0x7fffe298>
     168:	0000e859 	0xe859
     16c:	0001d200 	sll	k0,at,0x8
     170:	01120800 	0x1120800
     174:	5a040000 	0x5a040000
     178:	0000003a 	0x3a
     17c:	04270800 	0x4270800
     180:	5b040000 	0x5b040000
     184:	0000003a 	0x3a
     188:	010a0804 	sllv	at,t2,t0
     18c:	5c040000 	0x5c040000
     190:	0000003a 	0x3a
     194:	00bb0808 	0xbb0808
     198:	5d040000 	0x5d040000
     19c:	0000003a 	0x3a
     1a0:	0463080c 	bgezl	v1,21d4 <_mem_avail_start-0x7fffde2c>
     1a4:	5e040000 	0x5e040000
     1a8:	0000003a 	0x3a
     1ac:	045b0810 	0x45b0810
     1b0:	5f040000 	0x5f040000
     1b4:	0000003a 	0x3a
     1b8:	02a50814 	0x2a50814
     1bc:	60040000 	0x60040000
     1c0:	0000003a 	0x3a
     1c4:	04a90818 	tgeiu	a1,2072
     1c8:	61040000 	0x61040000
     1cc:	0000003a 	0x3a
     1d0:	ea05001c 	swc2	$5,28(s0)
     1d4:	04000000 	bltz	zero,1d8 <_mem_avail_start-0x7ffffe28>
     1d8:	00016562 	0x16562
     1dc:	01560500 	0x1560500
     1e0:	0b050000 	j	c140000 <_mem_avail_start-0x73ec0000>
     1e4:	0000006c 	0x6c
     1e8:	0001dd0b 	0x1dd0b
     1ec:	09ca0500 	j	7281400 <_mem_avail_start-0x78d7ec00>
     1f0:	0d050000 	jal	4140000 <_mem_avail_start-0x7bec0000>
     1f4:	0000003a 	0x3a
     1f8:	f2060103 	0xf2060103
     1fc:	0c000001 	jal	4 <_mem_avail_start-0x7ffffffc>
     200:	000004d8 	0x4d8
     204:	01e80801 	movf	at,t7,$fcc2
     208:	0c010000 	jal	40000 <_mem_avail_start-0x7ffc0000>
     20c:	0000008e 	0x8e
     210:	01e80901 	0x1e80901
     214:	0c020000 	jal	80000 <_mem_avail_start-0x7ff80000>
     218:	00000242 	srl	zero,zero,0x9
     21c:	01e80a01 	0x1e80a01
     220:	0c040000 	jal	100000 <_mem_avail_start-0x7ff00000>
     224:	00000494 	0x494
     228:	01e80b01 	0x1e80b01
     22c:	0c080000 	jal	200000 <_mem_avail_start-0x7fe00000>
     230:	0000007c 	0x7c
     234:	01e80c01 	0x1e80c01
     238:	0c100000 	jal	400000 <_mem_avail_start-0x7fc00000>
     23c:	00000451 	0x451
     240:	01e80d01 	0x1e80d01
     244:	0c200000 	jal	800000 <_mem_avail_start-0x7f800000>
     248:	000004b1 	tgeu	zero,zero,0x12
     24c:	01e80e01 	0x1e80e01
     250:	0d400000 	jal	5000000 <_mem_avail_start-0x7b000000>
     254:	000000ff 	0xff
     258:	01e80f01 	0x1e80f01
     25c:	7f800000 	0x7f800000
     260:	0000710e 	0x710e
     264:	dd110100 	ldc3	$17,256(t0)
     268:	0e000001 	jal	8000004 <_mem_avail_start-0x77fffffc>
     26c:	000003bf 	0x3bf
     270:	01dd1101 	0x1dd1101
     274:	930e0000 	lbu	t6,0(t8)
     278:	01000003 	0x1000003
     27c:	0001dd12 	0x1dd12
     280:	04bb0e00 	0x4bb0e00
     284:	12010000 	beq	s0,at,288 <_mem_avail_start-0x7ffffd78>
     288:	000001dd 	0x1dd
     28c:	0000870f 	0x870f
     290:	5e790100 	0x5e790100
     294:	68000000 	0x68000000
     298:	e0bfc007 	sc	ra,-16377(a1)
     29c:	01000002 	0x1000002
     2a0:	0005ea9c 	0x5ea9c
     2a4:	048b1000 	tltiu	a0,4096
     2a8:	7f010000 	0x7f010000
     2ac:	00000077 	0x77
     2b0:	00000000 	nop
     2b4:	c007b011 	ll	a3,-20463(zero)
     2b8:	000040bf 	0x40bf
     2bc:	00031000 	sll	v0,v1,0x0
     2c0:	6f6e1200 	0x6f6e1200
     2c4:	83010077 	lb	at,119(t8)
     2c8:	00000027 	nor	zero,zero,zero
     2cc:	0000003f 	0x3f
     2d0:	c007c013 	ll	a3,-16365(zero)
     2d4:	0009d2bf 	0x9d2bf
     2d8:	0002e700 	sll	gp,v0,0x1c
     2dc:	54011400 	bnel	zero,at,52e0 <_mem_avail_start-0x7fffad20>
     2e0:	166c0305 	bne	s3,t4,ef8 <_mem_avail_start-0x7ffff108>
     2e4:	1300bfc0 	beqz	t8,ffff01e8 <_text_end+0x403ee470>
     2e8:	bfc007c8 	cache	0x0,1992(s8)
     2ec:	000009dd 	0x9dd
     2f0:	000002ff 	0x2ff
     2f4:	06540114 	0x6540114
     2f8:	000a0080 	sll	zero,t2,0x2
     2fc:	150021e0 	bnez	t0,8a80 <_mem_avail_start-0x7fff7580>
     300:	bfc007e0 	cache	0x0,2016(s8)
     304:	000009dd 	0x9dd
     308:	02540114 	0x2540114
     30c:	00000080 	sll	zero,zero,0x2
     310:	c0088011 	ll	t0,-32751(zero)
     314:	000028bf 	0x28bf
     318:	00032d00 	sll	a1,v1,0x14
     31c:	039e1000 	0x39e1000
     320:	9b010000 	lwr	at,0(t8)
     324:	000005ea 	0x5ea
     328:	0000005d 	0x5d
     32c:	090c1100 	j	4304400 <_mem_avail_start-0x7bcfbc00>
     330:	0014bfc0 	sll	s7,s4,0x1f
     334:	03700000 	0x3700000
     338:	7f160000 	0x7f160000
     33c:	01000001 	movf	zero,t0,$fcc0
     340:	000025ac 	0x25ac
     344:	09181300 	j	4604c00 <_mem_avail_start-0x7b9fb400>
     348:	09d2bfc0 	j	74aff00 <_mem_avail_start-0x78b50100>
     34c:	035c0000 	0x35c0000
     350:	01140000 	0x1140000
     354:	4c030554 	0x4c030554
     358:	00bfc017 	0xbfc017
     35c:	c0092015 	ll	t1,8213(zero)
     360:	000713bf 	0x713bf
     364:	54011400 	bnel	zero,at,5368 <_mem_avail_start-0x7fffac98>
     368:	478b0805 	c1	0x18b0805
     36c:	00001f24 	0x1f24
     370:	00002017 	0x2017
     374:	0003b200 	sll	s6,v1,0x8
     378:	017f1000 	0x17f1000
     37c:	b1010000 	0xb1010000
     380:	00000025 	move	zero,zero
     384:	0000007b 	0x7b
     388:	c0092c18 	ll	t1,11288(zero)
     38c:	0008a4bf 	0x8a4bf
     390:	09681300 	j	5a04c00 <_mem_avail_start-0x7a5fb400>
     394:	09d2bfc0 	j	74aff00 <_mem_avail_start-0x78b50100>
     398:	03a80000 	0x3a80000
     39c:	01140000 	0x1140000
     3a0:	58030554 	0x58030554
     3a4:	00bfc017 	0xbfc017
     3a8:	c0097018 	ll	t1,28696(zero)
     3ac:	0005f6bf 	0x5f6bf
     3b0:	38170000 	xori	s7,zero,0x0
     3b4:	5d000000 	bgtzl	t0,3b8 <_mem_avail_start-0x7ffffc48>
     3b8:	10000004 	b	3cc <_mem_avail_start-0x7ffffc34>
     3bc:	00000429 	0x429
     3c0:	05f0c401 	bltzal	t7,ffff13c8 <_text_end+0x403ef650>
     3c4:	008e0000 	0x8e0000
     3c8:	e2100000 	sc	s0,0(s0)
     3cc:	01000001 	movf	zero,t0,$fcc0
     3d0:	0001edc6 	0x1edc6
     3d4:	0000ac00 	sll	s5,zero,0x10
     3d8:	0a1c1100 	j	8704400 <_mem_avail_start-0x778fbc00>
     3dc:	001cbfc0 	sll	s7,gp,0x1f
     3e0:	03fd0000 	0x3fd0000
     3e4:	69120000 	0x69120000
     3e8:	45cb0100 	0x45cb0100
     3ec:	ca000000 	lwc2	$0,0(s0)
     3f0:	18000000 	blez	zero,3f4 <_mem_avail_start-0x7ffffc0c>
     3f4:	bfc00a30 	cache	0x0,2608(s8)
     3f8:	000009e8 	0x9e8
     3fc:	09f01300 	j	7c04c00 <_mem_avail_start-0x783fb400>
     400:	09d2bfc0 	j	74aff00 <_mem_avail_start-0x78b50100>
     404:	04110000 	bal	408 <_mem_avail_start-0x7ffffbf8>
     408:	01140000 	0x1140000
     40c:	00820254 	0x820254
     410:	09f81800 	j	7e06000 <_mem_avail_start-0x781fa000>
     414:	0835bfc0 	j	d6ff00 <_mem_avail_start-0x7f290100>
     418:	00180000 	sll	zero,t8,0x0
     41c:	f3bfc00a 	0xf3bfc00a
     420:	18000009 	blez	zero,448 <_mem_avail_start-0x7ffffbb8>
     424:	bfc00a08 	cache	0x0,2568(s8)
     428:	000009f3 	tltu	zero,zero,0x27
     42c:	c00a1c13 	ll	t2,7187(zero)
     430:	0009febf 	0x9febf
     434:	00044c00 	sll	t1,a0,0x10
     438:	54011400 	bnel	zero,at,543c <_mem_avail_start-0x7fffabc4>
     43c:	14008302 	bnez	zero,fffe1048 <_text_end+0x403df2d0>
     440:	84025501 	lh	v0,21761(zero)
     444:	56011400 	bnel	s0,at,5448 <_mem_avail_start-0x7fffabb8>
     448:	00008502 	srl	s0,zero,0x14
     44c:	c00a4015 	ll	t2,16405(zero)
     450:	0009d2bf 	0x9d2bf
     454:	54011400 	bnel	zero,at,5458 <_mem_avail_start-0x7fffaba8>
     458:	00008102 	srl	s0,zero,0x4
     45c:	07901300 	bltzal	gp,5060 <_mem_avail_start-0x7fffafa0>
     460:	0910bfc0 	j	442ff00 <_mem_avail_start-0x7bbd0100>
     464:	04700000 	bltzal	v1,468 <_mem_avail_start-0x7ffffb98>
     468:	01140000 	0x1140000
     46c:	00300154 	0x300154
     470:	c0079c13 	ll	a3,-25581(zero)
     474:	000a09bf 	0xa09bf
     478:	00048700 	sll	s0,a0,0x1c
     47c:	54011400 	bnel	zero,at,5480 <_mem_avail_start-0x7fffab80>
     480:	00010c05 	0x10c05
     484:	18001100 	blez	zero,4888 <_mem_avail_start-0x7fffb778>
     488:	bfc007a4 	cache	0x0,1956(s8)
     48c:	00000a14 	0xa14
     490:	c007fc13 	ll	a3,-1005(zero)
     494:	0009d2bf 	0x9d2bf
     498:	0004a700 	sll	s4,a0,0x1c
     49c:	54011400 	bnel	zero,at,54a0 <_mem_avail_start-0x7fffab60>
     4a0:	16880305 	bne	s4,t0,10b8 <_mem_avail_start-0x7fffef48>
     4a4:	1300bfc0 	beqz	t8,ffff03a8 <_text_end+0x403ee630>
     4a8:	bfc00818 	cache	0x0,2072(s8)
     4ac:	000009fe 	0x9fe
     4b0:	000004be 	0x4be
     4b4:	05540114 	0x5540114
     4b8:	c016b003 	ll	s6,-20477(zero)
     4bc:	241300bf 	li	s3,191
     4c0:	09bfc008 	j	6ff0020 <_mem_avail_start-0x7900ffe0>
     4c4:	d500000a 	ldc1	$f0,10(t0)
     4c8:	14000004 	bnez	zero,4dc <_mem_avail_start-0x7ffffb24>
     4cc:	0c055401 	jal	155004 <_mem_avail_start-0x7feaaffc>
     4d0:	11000002 	beqz	t0,4dc <_mem_avail_start-0x7ffffb24>
     4d4:	082c1800 	j	b06000 <_mem_avail_start-0x7f4fa000>
     4d8:	0a14bfc0 	j	852ff00 <_mem_avail_start-0x77ad0100>
     4dc:	50180000 	beql	zero,t8,4e0 <_mem_avail_start-0x7ffffb20>
     4e0:	1fbfc008 	0x1fbfc008
     4e4:	1300000a 	beqz	t8,510 <_mem_avail_start-0x7ffffaf0>
     4e8:	bfc00864 	cache	0x0,2148(s8)
     4ec:	000009d2 	0x9d2
     4f0:	000004fe 	0x4fe
     4f4:	05540114 	0x5540114
     4f8:	c016dc03 	ll	s6,-9213(zero)
     4fc:	781300bf 	0x781300bf
     500:	09bfc008 	j	6ff0020 <_mem_avail_start-0x7900ffe0>
     504:	1500000a 	bnez	t0,530 <_mem_avail_start-0x7ffffad0>
     508:	14000005 	bnez	zero,520 <_mem_avail_start-0x7ffffae0>
     50c:	0c055401 	jal	155004 <_mem_avail_start-0x7feaaffc>
     510:	11000003 	beqz	t0,520 <_mem_avail_start-0x7ffffae0>
     514:	08b41300 	j	2d04c00 <_mem_avail_start-0x7d2fb400>
     518:	09d2bfc0 	j	74aff00 <_mem_avail_start-0x78b50100>
     51c:	052c0000 	teqi	t1,0
     520:	01140000 	0x1140000
     524:	f8030554 	sdc2	$3,1364(zero)
     528:	00bfc016 	0xbfc016
     52c:	c008c413 	ll	t0,-15341(zero)
     530:	0009d2bf 	0x9d2bf
     534:	00054300 	sll	t0,a1,0xc
     538:	54011400 	bnel	zero,at,553c <_mem_avail_start-0x7fffaac4>
     53c:	17100305 	bne	t8,s0,1154 <_mem_avail_start-0x7fffeeac>
     540:	1300bfc0 	beqz	t8,ffff0444 <_text_end+0x403ee6cc>
     544:	bfc008d0 	cache	0x0,2256(s8)
     548:	00000a09 	0xa09
     54c:	0000055a 	0x55a
     550:	05540114 	0x5540114
     554:	0000040c 	syscall	0x10
     558:	d8180011 	ldc2	$24,17(zero)
     55c:	14bfc008 	bne	a1,ra,ffff0580 <_text_end+0x403ee808>
     560:	1300000a 	beqz	t8,58c <_mem_avail_start-0x7ffffa74>
     564:	bfc008e8 	cache	0x0,2280(s8)
     568:	00000a2e 	0xa2e
     56c:	0000057a 	0x57a
     570:	05540114 	0x5540114
     574:	c0173403 	ll	s7,13315(zero)
     578:	001300bf 	0x1300bf
     57c:	2ebfc009 	sltiu	ra,s5,-16375
     580:	9100000a 	lbu	zero,10(t0)
     584:	14000005 	bnez	zero,59c <_mem_avail_start-0x7ffffa64>
     588:	03055401 	0x3055401
     58c:	bfc0173c 	cache	0x0,5948(s8)
     590:	098c1300 	j	6304c00 <_mem_avail_start-0x79cfb400>
     594:	09d2bfc0 	j	74aff00 <_mem_avail_start-0x78b50100>
     598:	05a80000 	tgei	t5,0
     59c:	01140000 	0x1140000
     5a0:	68030554 	0x68030554
     5a4:	00bfc017 	0xbfc017
     5a8:	c009a813 	ll	t1,-22509(zero)
     5ac:	0009d2bf 	0x9d2bf
     5b0:	0005bf00 	sll	s7,a1,0x1c
     5b4:	54011400 	bnel	zero,at,55b8 <_mem_avail_start-0x7fffaa48>
     5b8:	176c0305 	bne	k1,t4,11d0 <_mem_avail_start-0x7fffee30>
     5bc:	1300bfc0 	beqz	t8,ffff04c0 <_text_end+0x403ee748>
     5c0:	bfc009bc 	cache	0x0,2492(s8)
     5c4:	000009d2 	0x9d2
     5c8:	000005d6 	0x5d6
     5cc:	05540114 	0x5540114
     5d0:	c0177c03 	ll	s7,31747(zero)
     5d4:	dc1500bf 	ldc3	$21,191(zero)
     5d8:	d2bfc009 	0xd2bfc009
     5dc:	14000009 	bnez	zero,604 <_mem_avail_start-0x7ffff9fc>
     5e0:	03055401 	0x3055401
     5e4:	bfc0178c 	cache	0x0,6028(s8)
     5e8:	04190000 	0x4190000
     5ec:	0000002e 	0x2e
     5f0:	007e0419 	0x7e0419
     5f4:	3b1a0000 	xori	k0,t8,0x0
     5f8:	01000001 	movf	zero,t0,$fcc0
     5fc:	00012160 	0x12160
     600:	00002500 	sll	a0,zero,0x14
     604:	c006a000 	ll	a2,-24576(zero)
     608:	0000c8bf 	0xc8bf
     60c:	0d9c0100 	jal	6700400 <_mem_avail_start-0x798ffc00>
     610:	10000007 	b	630 <_mem_avail_start-0x7ffff9d0>
     614:	00000429 	0x429
     618:	05f06601 	bltzal	t7,19e20 <_mem_avail_start-0x7ffe61e0>
     61c:	00f50000 	0xf50000
     620:	e2100000 	sc	s0,0(s0)
     624:	01000001 	movf	zero,t0,$fcc0
     628:	0001ed67 	0x1ed67
     62c:	00011300 	sll	v0,at,0xc
     630:	00881000 	0x881000
     634:	68010000 	0x68010000
     638:	0000070d 	break	0x0,0x1c
     63c:	00000131 	tgeu	zero,zero,0x4
     640:	c0071c11 	ll	a3,7185(zero)
     644:	00001cbf 	0x1cbf
     648:	00066400 	sll	t4,a2,0x10
     64c:	00691200 	0x691200
     650:	00456f01 	0x456f01
     654:	015a0000 	0x15a0000
     658:	2c180000 	sltiu	t8,zero,0
     65c:	39bfc007 	xori	ra,t5,0xc007
     660:	0000000a 	movz	zero,zero,zero
     664:	c006c813 	ll	a2,-14317(zero)
     668:	000a2ebf 	0xa2ebf
     66c:	00067b00 	sll	t7,a2,0xc
     670:	54011400 	bnel	zero,at,5674 <_mem_avail_start-0x7fffa98c>
     674:	15cc0305 	bne	t6,t4,128c <_mem_avail_start-0x7fffed74>
     678:	1300bfc0 	beqz	t8,ffff057c <_text_end+0x403ee804>
     67c:	bfc006d4 	cache	0x0,1748(s8)
     680:	000009d2 	0x9d2
     684:	00000692 	0x692
     688:	05540114 	0x5540114
     68c:	c015fc03 	ll	s5,-1021(zero)
     690:	dc1800bf 	ldc3	$24,191(zero)
     694:	35bfc006 	ori	ra,t5,0xc006
     698:	18000008 	blez	zero,6bc <_mem_avail_start-0x7ffff944>
     69c:	bfc006e4 	cache	0x0,1764(s8)
     6a0:	000009f3 	tltu	zero,zero,0x27
     6a4:	c006ec18 	ll	a2,-5096(zero)
     6a8:	0009f3bf 	0x9f3bf
     6ac:	06f41800 	0x6f41800
     6b0:	09f3bfc0 	j	7ceff00 <_mem_avail_start-0x78310100>
     6b4:	10130000 	beq	zero,s3,6b8 <_mem_avail_start-0x7ffff948>
     6b8:	febfc007 	sdc3	$31,-16377(s5)
     6bc:	df000009 	ldc3	$0,9(t8)
     6c0:	14000006 	bnez	zero,6dc <_mem_avail_start-0x7ffff924>
     6c4:	03055401 	0x3055401
     6c8:	bfc0160c 	cache	0x0,5644(s8)
     6cc:	02550114 	0x2550114
     6d0:	01140081 	0x1140081
     6d4:	00820256 	0x820256
     6d8:	02570114 	0x2570114
     6dc:	13000083 	beqz	t8,8ec <_mem_avail_start-0x7ffff714>
     6e0:	bfc0071c 	cache	0x0,1820(s8)
     6e4:	00000867 	0x867
     6e8:	000006f9 	0x6f9
     6ec:	02540114 	0x2540114
     6f0:	01140081 	0x1140081
     6f4:	00820255 	0x820255
     6f8:	07441500 	0x7441500
     6fc:	09d2bfc0 	j	74aff00 <_mem_avail_start-0x78b50100>
     700:	01140000 	0x1140000
     704:	54030554 	bnel	zero,v1,1c58 <_mem_avail_start-0x7fffe3a8>
     708:	00bfc016 	0xbfc016
     70c:	77041900 	jalx	c106400 <_mem_avail_start-0x73ef9c00>
     710:	1a000000 	blez	s0,714 <_mem_avail_start-0x7ffff8ec>
     714:	00000031 	tgeu	zero,zero
     718:	01623a01 	0x1623a01
     71c:	00250000 	0x250000
     720:	05800000 	bltz	t4,724 <_mem_avail_start-0x7ffff8dc>
     724:	0120bfc0 	0x120bfc0
     728:	9c010000 	0x9c010000
     72c:	00000829 	0x829
     730:	0004a41b 	0x4a41b
     734:	253a0100 	addiu	k0,t1,256
     738:	6d000000 	0x6d000000
     73c:	10000001 	b	744 <_mem_avail_start-0x7ffff8bc>
     740:	00000422 	0x422
     744:	08293b01 	j	a4ec04 <_mem_avail_start-0x7f5b13fc>
     748:	01a40000 	0x1a40000
     74c:	f0100000 	0xf0100000
     750:	01000000 	0x1000000
     754:	00082f4b 	0x82f4b
     758:	0001db00 	sll	k1,at,0xc
     75c:	01bb1000 	0x1bb1000
     760:	4c010000 	mfc3	at,$0
     764:	0000082f 	0x82f
     768:	000001ee 	0x1ee
     76c:	66666f12 	0x66666f12
     770:	274f0100 	addiu	t7,k0,256
     774:	01000000 	0x1000000
     778:	17000002 	bnez	t8,784 <_mem_avail_start-0x7ffff87c>
     77c:	00000000 	nop
     780:	000007e1 	0x7e1
     784:	00006c10 	0x6c10
     788:	0d540100 	jal	5500400 <_mem_avail_start-0x7aaffc00>
     78c:	14000007 	bnez	zero,7ac <_mem_avail_start-0x7ffff854>
     790:	10000002 	b	79c <_mem_avail_start-0x7ffff864>
     794:	000001c5 	0x1c5
     798:	070d5501 	0x70d5501
     79c:	02270000 	0x2270000
     7a0:	44130000 	mfc1	s3,$f0
     7a4:	febfc006 	sdc3	$31,-16378(s5)
     7a8:	b6000009 	0xb6000009
     7ac:	14000007 	bnez	zero,7cc <_mem_avail_start-0x7ffff834>
     7b0:	84025401 	lh	v0,21505(zero)
     7b4:	58130000 	0x58130000
     7b8:	67bfc006 	0x67bfc006
     7bc:	ca000008 	lwc2	$0,8(s0)
     7c0:	14000007 	bnez	zero,7e0 <_mem_avail_start-0x7ffff820>
     7c4:	86025401 	lh	v0,21505(s0)
     7c8:	6c150000 	0x6c150000
     7cc:	44bfc006 	0x44bfc006
     7d0:	1400000a 	bnez	zero,7fc <_mem_avail_start-0x7ffff804>
     7d4:	86025401 	lh	v0,21505(s0)
     7d8:	55011400 	bnel	t0,at,57dc <_mem_avail_start-0x7fffa824>
     7dc:	00008302 	srl	s0,zero,0xc
     7e0:	05c81300 	tgei	t6,4864
     7e4:	09febfc0 	j	7faff00 <_mem_avail_start-0x78050100>
     7e8:	07fe0000 	0x7fe0000
     7ec:	01140000 	0x1140000
     7f0:	fc030554 	sdc3	$3,1364(zero)
     7f4:	14bfc014 	bne	a1,ra,ffff0848 <_text_end+0x403eead0>
     7f8:	81025501 	lb	v0,21761(t0)
     7fc:	e8130000 	swc2	$19,0(zero)
     800:	febfc005 	sdc3	$31,-16379(s5)
     804:	15000009 	bnez	t0,82c <_mem_avail_start-0x7ffff7d4>
     808:	14000008 	bnez	zero,82c <_mem_avail_start-0x7ffff7d4>
     80c:	03055401 	0x3055401
     810:	bfc01530 	cache	0x0,5424(s8)
     814:	05f81500 	0x5f81500
     818:	09d2bfc0 	j	74aff00 <_mem_avail_start-0x78b50100>
     81c:	01140000 	0x1140000
     820:	6c030554 	0x6c030554
     824:	00bfc015 	0xbfc015
     828:	5a041900 	0x5a041900
     82c:	19000001 	blez	t0,834 <_mem_avail_start-0x7ffff7cc>
     830:	0001d204 	0x1d204
     834:	021f1c00 	0x21f1c00
     838:	2f010000 	sltiu	at,t8,0
     83c:	0000043d 	0x43d
     840:	bfc00528 	cache	0x0,1320(s8)
     844:	00000058 	0x58
     848:	08679c01 	j	19e7004 <_mem_avail_start-0x7e618ffc>
     84c:	35100000 	ori	s0,t0,0x0
     850:	01000001 	movf	zero,t0,$fcc0
     854:	00003a30 	tge	zero,zero,0xe8
     858:	00023a00 	sll	a3,v0,0x8
     85c:	05501800 	bltzal	t2,6860 <_mem_avail_start-0x7fff97a0>
     860:	0a39bfc0 	j	8e6ff00 <_mem_avail_start-0x77190100>
     864:	1d000000 	bgtz	t0,868 <_mem_avail_start-0x7ffff798>
     868:	000004ca 	0x4ca
     86c:	04052401 	0x4052401
     870:	a4010000 	sh	at,0(zero)
     874:	1e000008 	bgtz	s0,898 <_mem_avail_start-0x7ffff768>
     878:	000004a4 	0x4a4
     87c:	00252401 	0x252401
     880:	e21e0000 	sc	s8,0(s0)
     884:	01000001 	movf	zero,t0,$fcc0
     888:	00003a24 	0x3a24
     88c:	001a1600 	sll	v0,k0,0x18
     890:	25010000 	addiu	at,t0,0
     894:	0000070d 	break	0x0,0x1c
     898:	0004a016 	0x4a016
     89c:	0d260100 	jal	4980400 <_mem_avail_start-0x7b67fc00>
     8a0:	00000007 	srav	zero,zero,zero
     8a4:	0003df1c 	0x3df1c
     8a8:	c81c0100 	lwc2	$28,256(zero)
     8ac:	70000003 	0x70000003
     8b0:	4cbfc004 	0x4cbfc004
     8b4:	01000000 	0x1000000
     8b8:	0009109c 	0x9109c
     8bc:	04a41b00 	0x4a41b00
     8c0:	1c010000 	0x1c010000
     8c4:	00000025 	move	zero,zero
     8c8:	00000259 	0x259
     8cc:	c0049013 	ll	a0,-28653(zero)
     8d0:	0009febf 	0x9febf
     8d4:	0008e900 	sll	sp,t0,0x4
     8d8:	54011400 	bnel	zero,at,58dc <_mem_avail_start-0x7fffa724>
     8dc:	14880305 	bne	a0,t0,14f4 <_mem_avail_start-0x7fffeb0c>
     8e0:	0114bfc0 	0x114bfc0
     8e4:	00800255 	0x800255
     8e8:	049c1300 	0x49c1300
     8ec:	09d2bfc0 	j	74aff00 <_mem_avail_start-0x78b50100>
     8f0:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
     8f4:	01140000 	0x1140000
     8f8:	a8030554 	swl	v1,1364(zero)
     8fc:	00bfc014 	0xbfc014
     900:	c004a415 	ll	a0,-23531(zero)
     904:	000910bf 	0x910bf
     908:	54011400 	bnel	zero,at,590c <_mem_avail_start-0x7fffa6f4>
     90c:	00003101 	0x3101
     910:	0000001c 	0x1c
     914:	93140100 	lbu	s4,256(t8)
     918:	50000001 	beqzl	zero,920 <_mem_avail_start-0x7ffff6e0>
     91c:	20bfc004 	addi	ra,a1,-16380
     920:	01000000 	0x1000000
     924:	0009489c 	0x9489c
     928:	03e91b00 	0x3e91b00
     92c:	14010000 	bne	zero,at,930 <_mem_avail_start-0x7ffff6d0>
     930:	00000948 	0x948
     934:	00000290 	0x290
     938:	00002510 	0x2510
     93c:	3a150100 	xori	s5,s0,0x100
     940:	b1000000 	0xb1000000
     944:	00000002 	srl	zero,zero,0x0
     948:	5d020103 	0x5d020103
     94c:	1f000001 	bgtz	t8,954 <_mem_avail_start-0x7ffff6ac>
     950:	00000867 	0x867
     954:	00000405 	0x405
     958:	bfc004bc 	cache	0x0,1212(s8)
     95c:	0000006c 	0x6c
     960:	09d29c01 	j	74a7004 <_mem_avail_start-0x78b58ffc>
     964:	77200000 	jalx	c800000 <_mem_avail_start-0x73800000>
     968:	df000008 	ldc3	$0,8(t8)
     96c:	20000002 	addi	zero,zero,2
     970:	00000882 	srl	at,zero,0x2
     974:	00000300 	sll	zero,zero,0xc
     978:	00088d21 	0x88d21
     97c:	00032100 	sll	a0,v1,0x4
     980:	08982100 	j	2608400 <_mem_avail_start-0x7d9f7c00>
     984:	03420000 	0x3420000
     988:	67220000 	0x67220000
     98c:	08000008 	j	20 <_mem_avail_start-0x7fffffe0>
     990:	0cbfc005 	jal	2ff0014 <_mem_avail_start-0x7d00ffec>
     994:	20000000 	addi	zero,zero,0
     998:	00000877 	0x877
     99c:	00000367 	0x367
     9a0:	00088220 	0x88220
     9a4:	00037d00 	sll	t7,v1,0x14
     9a8:	05082300 	tgei	t0,8960
     9ac:	000cbfc0 	sll	s7,t4,0x1f
     9b0:	78240000 	0x78240000
     9b4:	24000009 	li	zero,9
     9b8:	00000981 	0x981
     9bc:	c0051015 	ll	a1,4117(zero)
     9c0:	0009d2bf 	0x9d2bf
     9c4:	54011400 	bnel	zero,at,59c8 <_mem_avail_start-0x7fffa638>
     9c8:	14cc0305 	bne	a2,t4,15e0 <_mem_avail_start-0x7fffea20>
     9cc:	0000bfc0 	sll	s7,zero,0x1f
     9d0:	2e250000 	sltiu	a1,s1,0
     9d4:	2e000002 	sltiu	zero,s0,2
     9d8:	06000002 	bltz	s0,9e4 <_mem_avail_start-0x7ffff61c>
     9dc:	00f5250a 	0xf5250a
     9e0:	00f50000 	0xf50000
     9e4:	36050000 	ori	a1,s0,0x0
     9e8:	00043025 	or	a2,zero,a0
     9ec:	00043000 	sll	a2,a0,0x0
     9f0:	25460500 	addiu	a2,t2,1280
     9f4:	00000099 	0x99
     9f8:	00000099 	0x99
     9fc:	8c254805 	lw	a1,18437(at)
     a00:	8c000003 	lw	zero,3(zero)
     a04:	06000003 	bltz	s0,a14 <_mem_avail_start-0x7ffff5ec>
     a08:	01f7250c 	syscall	0x7dc94
     a0c:	01f70000 	0x1f70000
     a10:	4c050000 	mfc3	a1,$0
     a14:	00048625 	0x48625
     a18:	00048600 	sll	s0,a0,0x18
     a1c:	264e0500 	addiu	t6,s2,1280
     a20:	00000058 	0x58
     a24:	00000041 	0x41
     a28:	00580808 	0x580808
     a2c:	74250000 	jalx	940000 <_mem_avail_start-0x7f6c0000>
     a30:	74000004 	jalx	10 <_mem_avail_start-0x7ffffff0>
     a34:	06000004 	bltz	s0,a48 <_mem_avail_start-0x7ffff5b8>
     a38:	01d6250b 	0x1d6250b
     a3c:	01d60000 	0x1d60000
     a40:	44050000 	mfc1	a1,$f0
     a44:	0000e125 	0xe125
     a48:	0000e100 	sll	gp,zero,0x4
     a4c:	00170700 	sll	zero,s7,0x1c
     a50:	00000022 	neg	zero,zero
     a54:	02060002 	0x2060002
     a58:	01040000 	0x1040000
     a5c:	000001dd 	0x1dd
     a60:	bfc00000 	cache	0x0,0(s8)
     a64:	bfc00450 	cache	0x0,1104(s8)
     a68:	000004e5 	0x4e5
     a6c:	000004f7 	0x4f7
     a70:	00000532 	tlt	zero,zero,0x14
     a74:	056c8001 	teqi	t3,-32767
     a78:	00040000 	sll	zero,a0,0x0
     a7c:	0000021a 	0x21a
     a80:	06160104 	0x6160104
     a84:	040c0000 	teqi	zero,0
     a88:	4d000007 	bc3f	aa8 <_mem_avail_start-0x7ffff558>
     a8c:	e0000002 	sc	zero,2(zero)
     a90:	00000000 	nop
     a94:	74000000 	jalx	0 <_mem_avail_start-0x80000000>
     a98:	02000002 	0x2000002
     a9c:	03f80704 	0x3f80704
     aa0:	04020000 	bltzl	zero,aa4 <_mem_avail_start-0x7ffff55c>
     aa4:	0003f307 	0x3f307
     aa8:	020d0300 	0x20d0300
     aac:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
     ab0:	00000025 	move	zero,zero
     ab4:	f2060102 	0xf2060102
     ab8:	04000001 	bltz	zero,ac0 <_mem_avail_start-0x7ffff540>
     abc:	0000003e 	0x3e
     ac0:	eb060102 	swc2	$6,258(t8)
     ac4:	02000001 	movf	zero,s0,$fcc0
     ac8:	00aa0502 	0xaa0502
     acc:	04050000 	0x4050000
     ad0:	746e6905 	jalx	1b9a414 <_mem_avail_start-0x7e465bec>
     ad4:	05040200 	0x5040200
     ad8:	000001b2 	tlt	zero,zero,0x6
     adc:	00011903 	sra	v1,at,0x4
     ae0:	71090300 	0x71090300
     ae4:	02000000 	0x2000000
     ae8:	01e90801 	movt	at,t7,$fcc2
     aec:	16030000 	bne	s0,v1,af0 <_mem_avail_start-0x7ffff510>
     af0:	03000002 	0x3000002
     af4:	0000830a 	0x830a
     af8:	07020200 	bltzl	t8,12fc <_mem_avail_start-0x7fffed04>
     afc:	000003a4 	0x3a4
     b00:	00015603 	sra	t2,at,0x18
     b04:	660b0400 	0x660b0400
     b08:	03000000 	0x3000000
     b0c:	000009ca 	0x9ca
     b10:	00330d04 	0x330d04
     b14:	b0060000 	0xb0060000
     b18:	b0000000 	0xb0000000
     b1c:	07000000 	bltz	t8,b20 <_mem_avail_start-0x7ffff4e0>
     b20:	00000025 	move	zero,zero
     b24:	0408001f 	tgei	zero,31
     b28:	00000045 	0x45
     b2c:	00054b09 	0x54b09
     b30:	a0070500 	sb	a3,1280(zero)
     b34:	05000000 	bltz	t0,b38 <_mem_avail_start-0x7ffff4c8>
     b38:	c01c2c03 	ll	gp,11267(zero)
     b3c:	05a40abf 	0x5a40abf
     b40:	0001242a 	0x1242a
     b44:	06030b00 	bgezl	s0,3748 <_mem_avail_start-0x7fffc8b8>
     b48:	2b050000 	slti	a1,t8,0
     b4c:	00000124 	0x124
     b50:	05780b00 	0x5780b00
     b54:	2c050000 	sltiu	a1,zero,0
     b58:	00000033 	tltu	zero,zero
     b5c:	055e0b10 	0x55e0b10
     b60:	2d050000 	sltiu	a1,t0,0
     b64:	00000033 	tltu	zero,zero
     b68:	05d50b14 	0x5d50b14
     b6c:	2e050000 	sltiu	a1,s0,0
     b70:	00000033 	tltu	zero,zero
     b74:	053e0b18 	0x53e0b18
     b78:	2f050000 	sltiu	a1,t8,0
     b7c:	00000033 	tltu	zero,zero
     b80:	06f10b1c 	bgezal	s7,37f4 <_mem_avail_start-0x7fffc80c>
     b84:	30050000 	andi	a1,zero,0x0
     b88:	00000033 	tltu	zero,zero
     b8c:	70670c20 	0x70670c20
     b90:	31050072 	andi	a1,t0,0x72
     b94:	00000134 	teq	zero,zero,0x4
     b98:	33060024 	andi	a2,t8,0x24
     b9c:	34000000 	li	zero,0x0
     ba0:	07000001 	bltz	t8,ba8 <_mem_avail_start-0x7ffff458>
     ba4:	00000025 	move	zero,zero
     ba8:	33060003 	andi	a2,t8,0x3
     bac:	44000000 	mfc1	zero,$f0
     bb0:	07000001 	bltz	t8,bb8 <_mem_avail_start-0x7ffff448>
     bb4:	00000025 	move	zero,zero
     bb8:	2403001f 	li	v1,31
     bbc:	05000007 	bltz	t0,bdc <_mem_avail_start-0x7ffff424>
     bc0:	0000c732 	tlt	zero,zero,0x31c
     bc4:	05910d00 	bgezal	t4,3fc8 <_mem_avail_start-0x7fffc038>
     bc8:	06010000 	bgez	s0,bcc <_mem_avail_start-0x7ffff434>
     bcc:	0000008a 	0x8a
     bd0:	0005b50d 	break	0x5,0x2d4
     bd4:	8a060100 	lwl	a2,256(s0)
     bd8:	0e000000 	jal	8000000 <_mem_avail_start-0x78000000>
     bdc:	000005f0 	tge	zero,zero,0x17
     be0:	0c105501 	jal	415404 <_mem_avail_start-0x7fbeabfc>
     be4:	00b4bfc0 	0xb4bfc0
     be8:	9c010000 	0x9c010000
     bec:	000002a9 	0x2a9
     bf0:	0066740f 	0x66740f
     bf4:	02a95501 	0x2a95501
     bf8:	03930000 	0x3930000
     bfc:	1a100000 	0x1a100000
     c00:	01000007 	srav	zero,zero,t0
     c04:	0002af55 	0x2af55
     c08:	0003ca00 	sll	t9,v1,0x8
     c0c:	0c801100 	jal	2004400 <_mem_avail_start-0x7dffbc00>
     c10:	0044bfc0 	0x44bfc0
     c14:	02320000 	0x2320000
     c18:	e0120000 	sc	s2,0(zero)
     c1c:	01000005 	0x1000005
     c20:	0000955b 	0x955b
     c24:	0003eb00 	sll	sp,v1,0xc
     c28:	70651300 	0x70651300
     c2c:	5c010063 	0x5c010063
     c30:	00000058 	0x58
     c34:	00038c14 	0x38c14
     c38:	c00c8000 	ll	t4,-32768(zero)
     c3c:	000004bf 	0x4bf
     c40:	e15b0100 	sc	k1,256(t2)
     c44:	15000001 	bnez	t0,c4c <_mem_avail_start-0x7ffff3b4>
     c48:	bfc00c80 	cache	0x0,3200(s8)
     c4c:	00000004 	sllv	zero,zero,zero
     c50:	00051a16 	0x51a16
     c54:	14000000 	bnez	zero,c58 <_mem_avail_start-0x7ffff3a8>
     c58:	000003a6 	0x3a6
     c5c:	bfc00ca4 	cache	0x0,3236(s8)
     c60:	00000004 	sllv	zero,zero,zero
     c64:	02045c01 	0x2045c01
     c68:	a4150000 	sh	s5,0(zero)
     c6c:	04bfc00c 	0x4bfc00c
     c70:	16000000 	bnez	s0,c74 <_mem_avail_start-0x7ffff38c>
     c74:	000004ff 	0x4ff
     c78:	b4170000 	0xb4170000
     c7c:	22bfc00c 	addi	ra,s5,-16372
     c80:	21000005 	addi	zero,t0,5
     c84:	18000002 	blez	zero,c90 <_mem_avail_start-0x7ffff370>
     c88:	03055401 	0x3055401
     c8c:	bfc01964 	cache	0x0,6500(s8)
     c90:	02550118 	0x2550118
     c94:	19000080 	blez	t0,e98 <_mem_avail_start-0x7ffff168>
     c98:	bfc00cbc 	cache	0x0,3260(s8)
     c9c:	0000052d 	0x52d
     ca0:	02540118 	0x2540118
     ca4:	00000080 	sll	zero,zero,0x2
     ca8:	c00c3417 	ll	t4,13335(zero)
     cac:	000538bf 	0x538bf
     cb0:	00024900 	sll	t1,v0,0x4
     cb4:	54011800 	bnel	zero,at,6cb8 <_mem_avail_start-0x7fff9348>
     cb8:	17e00305 	bnez	ra,18d0 <_mem_avail_start-0x7fffe730>
     cbc:	1700bfc0 	bnez	t8,ffff0bc0 <_text_end+0x403eee48>
     cc0:	bfc00c48 	cache	0x0,3144(s8)
     cc4:	00000538 	0x538
     cc8:	00000260 	0x260
     ccc:	05540118 	0x5540118
     cd0:	c0193c03 	ll	t9,15363(zero)
     cd4:	541700bf 	bnel	zero,s7,fd4 <_mem_avail_start-0x7ffff02c>
     cd8:	43bfc00c 	c0	0x1bfc00c
     cdc:	78000005 	0x78000005
     ce0:	18000002 	blez	zero,cec <_mem_avail_start-0x7ffff314>
     ce4:	11065401 	beq	t0,a2,15cec <_mem_avail_start-0x7ffea314>
     ce8:	f5b7bdad 	sdc1	$f23,-16979(t5)
     cec:	5c17007d 	0x5c17007d
     cf0:	28bfc00c 	slti	ra,a1,-16372
     cf4:	8c000003 	lw	zero,3(zero)
     cf8:	18000002 	blez	zero,d04 <_mem_avail_start-0x7ffff2fc>
     cfc:	81025401 	lb	v0,21505(t0)
     d00:	641a0000 	0x641a0000
     d04:	b6bfc00c 	0xb6bfc00c
     d08:	1b000002 	blez	t8,d14 <_mem_avail_start-0x7ffff2ec>
     d0c:	bfc00c80 	cache	0x0,3200(s8)
     d10:	00000538 	0x538
     d14:	05540118 	0x5540118
     d18:	c019a003 	ll	t9,-24573(zero)
     d1c:	080000bf 	j	2fc <_mem_avail_start-0x7ffffd04>
     d20:	00014404 	0x14404
     d24:	02010200 	0x2010200
     d28:	00000572 	tlt	zero,zero,0x15
     d2c:	0005681c 	0x5681c
     d30:	a8450100 	swl	a1,256(v0)
     d34:	68bfc00b 	0x68bfc00b
     d38:	01000000 	0x1000000
     d3c:	0003289c 	0x3289c
     d40:	00a81d00 	0xa81d00
     d44:	691e0000 	0x691e0000
     d48:	66460100 	0x66460100
     d4c:	fe000000 	sdc3	$0,0(s0)
     d50:	1d000003 	bgtz	t0,d60 <_mem_avail_start-0x7ffff2a0>
     d54:	000000c0 	ehb
     d58:	0006fb12 	0x6fb12
     d5c:	33470100 	andi	a3,k0,0x100
     d60:	1d000000 	bgtz	t0,d64 <_mem_avail_start-0x7ffff29c>
     d64:	12000004 	beqz	s0,d78 <_mem_avail_start-0x7ffff288>
     d68:	000005e5 	0x5e5
     d6c:	00334701 	0x334701
     d70:	04300000 	bltzal	at,d74 <_mem_avail_start-0x7ffff28c>
     d74:	0b120000 	j	c480000 <_mem_avail_start-0x73b80000>
     d78:	01000006 	srlv	zero,zero,t0
     d7c:	00003347 	0x3347
     d80:	00044300 	sll	t0,a0,0xc
     d84:	0bf41900 	j	fd06400 <_mem_avail_start-0x702f9c00>
     d88:	0522bfc0 	bltzl	t1,ffff0c8c <_text_end+0x403eef14>
     d8c:	01180000 	0x1180000
     d90:	00810254 	0x810254
     d94:	02550118 	0x2550118
     d98:	00007f80 	sll	t7,zero,0x1e
     d9c:	c50e0000 	lwc1	$f14,0(t0)
     da0:	01000005 	0x1000005
     da4:	c00b103e 	ll	t3,4158(zero)
     da8:	000098bf 	0x98bf
     dac:	8c9c0100 	lw	gp,256(a0)
     db0:	0f000003 	jal	c00000c <_mem_avail_start-0x73fffff4>
     db4:	01006674 	teq	t0,zero,0x199
     db8:	0002a93e 	0x2a93e
     dbc:	00045600 	sll	t2,a0,0x18
     dc0:	00901f00 	0x901f00
     dc4:	03780000 	0x3780000
     dc8:	691e0000 	0x691e0000
     dcc:	583f0100 	0x583f0100
     dd0:	82000000 	lb	zero,0(s0)
     dd4:	19000004 	blez	t0,de8 <_mem_avail_start-0x7ffff218>
     dd8:	bfc00b58 	cache	0x0,2904(s8)
     ddc:	00000522 	0x522
     de0:	02540118 	0x2540118
     de4:	01180083 	0x1180083
     de8:	7f810255 	0x7f810255
     dec:	88190000 	lwl	t9,0(zero)
     df0:	22bfc00b 	addi	ra,s5,-16373
     df4:	18000005 	blez	zero,e0c <_mem_avail_start-0x7ffff1f4>
     df8:	03055401 	0x3055401
     dfc:	bfc018c8 	cache	0x0,6344(s8)
     e00:	86200000 	lh	zero,0(s1)
     e04:	01000005 	0x1000005
     e08:	00009535 	0x9535
     e0c:	03a60100 	0x3a60100
     e10:	6e130000 	0x6e130000
     e14:	95360100 	lhu	s6,256(t1)
     e18:	00000000 	nop
     e1c:	0005a020 	add	s4,zero,a1
     e20:	952c0100 	lhu	t4,256(t1)
     e24:	01000000 	0x1000000
     e28:	000003c0 	sll	zero,zero,0xf
     e2c:	01006e13 	0x1006e13
     e30:	0000952d 	0x952d
     e34:	801c0000 	lb	gp,0(zero)
     e38:	01000005 	0x1000005
     e3c:	c00a480b 	ll	t2,18443(zero)
     e40:	0000c8bf 	0xc8bf
     e44:	ec9c0100 	swc3	$28,256(a0)
     e48:	12000004 	beqz	s0,e5c <_mem_avail_start-0x7ffff1a4>
     e4c:	000006e8 	0x6e8
     e50:	00581801 	movf	v1,v0,$fcc6
     e54:	04c40000 	0x4c40000
     e58:	13120000 	beq	t8,s2,e5c <_mem_avail_start-0x7ffff1a4>
     e5c:	01000007 	srav	zero,zero,t0
     e60:	00005821 	move	t3,zero
     e64:	0004e200 	sll	gp,a0,0x8
     e68:	0a5c1a00 	j	9706800 <_mem_avail_start-0x768f9800>
     e6c:	054ebfc0 	tnei	t2,-16448
     e70:	64170000 	0x64170000
     e74:	43bfc00a 	c0	0x1bfc00a
     e78:	0f000005 	jal	c000014 <_mem_avail_start-0x73ffffec>
     e7c:	18000004 	blez	zero,e90 <_mem_avail_start-0x7ffff170>
     e80:	34015401 	li	at,0x5401
     e84:	0a701700 	j	9c05c00 <_mem_avail_start-0x763fa400>
     e88:	0538bfc0 	0x538bfc0
     e8c:	04260000 	0x4260000
     e90:	01180000 	0x1180000
     e94:	e0030554 	sc	v1,1364(zero)
     e98:	00bfc017 	0xbfc017
     e9c:	c00a8c17 	ll	t2,-29673(zero)
     ea0:	000538bf 	0x538bf
     ea4:	00043d00 	sll	a3,a0,0x14
     ea8:	54011800 	bnel	zero,at,6eac <_mem_avail_start-0x7fff9154>
     eac:	18080305 	0x18080305
     eb0:	1700bfc0 	bnez	t8,ffff0db4 <_text_end+0x403ef03c>
     eb4:	bfc00a98 	cache	0x0,2712(s8)
     eb8:	00000543 	sra	zero,zero,0x15
     ebc:	00000450 	0x450
     ec0:	01540118 	0x1540118
     ec4:	b0170035 	0xb0170035
     ec8:	22bfc00a 	addi	ra,s5,-16374
     ecc:	73000005 	msubu	t8,zero
     ed0:	18000004 	blez	zero,ee4 <_mem_avail_start-0x7ffff11c>
     ed4:	03055401 	0x3055401
     ed8:	bfc01830 	cache	0x0,6192(s8)
     edc:	02550118 	0x2550118
     ee0:	01180081 	0x1180081
     ee4:	00800256 	0x800256
     ee8:	0ac01700 	j	b005c00 <_mem_avail_start-0x74ffa400>
     eec:	0559bfc0 	0x559bfc0
     ef0:	04920000 	bltzall	a0,ef4 <_mem_avail_start-0x7ffff10c>
     ef4:	01180000 	0x1180000
     ef8:	00810254 	0x810254
     efc:	01550118 	0x1550118
     f00:	56011830 	bnel	s0,at,6fc4 <_mem_avail_start-0x7fff903c>
     f04:	00008002 	srl	s0,zero,0x0
     f08:	c00ac817 	ll	t2,-14313(zero)
     f0c:	000543bf 	0x543bf
     f10:	0004a500 	sll	s4,a0,0x14
     f14:	54011800 	bnel	zero,at,6f18 <_mem_avail_start-0x7fff90e8>
     f18:	1a003601 	blez	s0,e720 <_mem_avail_start-0x7fff18e0>
     f1c:	bfc00ad0 	cache	0x0,2768(s8)
     f20:	00000564 	0x564
     f24:	c00ae417 	ll	t2,-7145(zero)
     f28:	000538bf 	0x538bf
     f2c:	0004c500 	sll	t8,a0,0x14
     f30:	54011800 	bnel	zero,at,6f34 <_mem_avail_start-0x7fff90cc>
     f34:	186c0305 	0x186c0305
     f38:	2100bfc0 	addi	zero,t0,-16448
     f3c:	bfc00afc 	cache	0x0,2812(s8)
     f40:	00000543 	sra	zero,zero,0x15
     f44:	000004d8 	0x4d8
     f48:	01540118 	0x1540118
     f4c:	08190037 	j	6400dc <_mem_avail_start-0x7f9bff24>
     f50:	22bfc00b 	addi	ra,s5,-16373
     f54:	18000005 	blez	zero,f6c <_mem_avail_start-0x7ffff094>
     f58:	03055401 	0x3055401
     f5c:	bfc01888 	cache	0x0,6280(s8)
     f60:	a6220000 	sh	v0,0(s1)
     f64:	00000003 	sra	zero,zero,0x0
     f68:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
     f6c:	01000000 	0x1000000
     f70:	0005079c 	0x5079c
     f74:	03b62300 	0x3b62300
     f78:	52010000 	beql	s0,at,f7c <_mem_avail_start-0x7ffff084>
     f7c:	038c2200 	0x38c2200
     f80:	00000000 	nop
     f84:	000c0000 	sll	zero,t4,0x0
     f88:	9c010000 	0x9c010000
     f8c:	00000522 	0x522
     f90:	00039c23 	0x39c23
     f94:	00520100 	0x520100
     f98:	00038c24 	0x38c24
     f9c:	00038c00 	sll	s1,v1,0x10
     fa0:	240c0600 	li	t4,1536
     fa4:	00000596 	0x596
     fa8:	00000596 	0x596
     fac:	2e244a04 	sltiu	a0,s1,18948
     fb0:	2e000002 	sltiu	zero,s0,2
     fb4:	06000002 	bltz	s0,fc0 <_mem_avail_start-0x7ffff040>
     fb8:	01f7240a 	0x1f7240a
     fbc:	01f70000 	0x1f70000
     fc0:	4c040000 	mfc3	a0,$0
     fc4:	0005a924 	0x5a924
     fc8:	0005a900 	sll	s5,a1,0x4
     fcc:	24420400 	addiu	v0,v0,1024
     fd0:	000005be 	0x5be
     fd4:	000005be 	0x5be
     fd8:	87241507 	lh	a0,5383(t9)
     fdc:	87000000 	lh	zero,0(t8)
     fe0:	08000000 	j	0 <_mem_avail_start-0x80000000>
     fe4:	01c2000a 	movz	zero,t6,v0
     fe8:	00040000 	sll	zero,a0,0x0
     fec:	00000403 	sra	zero,zero,0x10
     ff0:	06160104 	0x6160104
     ff4:	420c0000 	c0	0xc0000
     ff8:	51000007 	beqzl	t0,1018 <_mem_avail_start-0x7fffefe8>
     ffc:	88000007 	lwl	zero,7(zero)
    1000:	00000001 	movf	zero,zero,$fcc0
    1004:	d1000000 	0xd1000000
    1008:	02000003 	0x2000003
    100c:	07040304 	0x7040304
    1010:	000003f8 	0x3f8
    1014:	f3070403 	0xf3070403
    1018:	04000003 	bltz	zero,1028 <_mem_avail_start-0x7fffefd8>
    101c:	0000038c 	syscall	0xe
    1020:	01850101 	0x1850101
    1024:	0cc40000 	jal	3100000 <_mem_avail_start-0x7cf00000>
    1028:	0224bfc0 	0x224bfc0
    102c:	9c010000 	0x9c010000
    1030:	00000185 	0x185
    1034:	746d6605 	jalx	1b59814 <_mem_avail_start-0x7e4a67ec>
    1038:	8c010100 	lw	at,256(zero)
    103c:	00000001 	movf	zero,zero,$fcc0
    1040:	06000005 	bltz	s0,1058 <_mem_avail_start-0x7fffefa8>
    1044:	01006907 	0x1006907
    1048:	00018503 	sra	s0,at,0x14
    104c:	00053700 	sll	a2,a1,0x1c
    1050:	00630700 	0x630700
    1054:	01920401 	0x1920401
    1058:	059f0000 	0x59f0000
    105c:	61070000 	0x61070000
    1060:	01006772 	tlt	t0,zero,0x19d
    1064:	00019e05 	0x19e05
    1068:	0005bd00 	sll	s7,a1,0x14
    106c:	70610800 	0x70610800
    1070:	25060100 	addiu	a2,t0,256
    1074:	02000000 	0x2000000
    1078:	77076091 	jalx	c1d8244 <_mem_avail_start-0x73e27dbc>
    107c:	85070100 	lh	a3,256(t0)
    1080:	db000001 	ldc2	$0,1(t8)
    1084:	09000005 	j	4000014 <_mem_avail_start-0x7bffffec>
    1088:	0000074b 	0x74b
    108c:	0d481001 	jal	5204004 <_mem_avail_start-0x7adfbffc>
    1090:	380abfc0 	xori	t2,zero,0xbfc0
    1094:	36000001 	ori	zero,s0,0x1
    1098:	0b000001 	j	c000004 <_mem_avail_start-0x73fffffc>
    109c:	00000474 	teq	zero,zero,0x11
    10a0:	01851401 	0x1851401
    10a4:	00c60000 	0xc60000
    10a8:	00060000 	sll	zero,a2,0x0
    10ac:	0007300b 	movn	a2,zero,a3
    10b0:	85190100 	lh	t9,256(t0)
    10b4:	d7000001 	ldc1	$f0,1(t8)
    10b8:	06000000 	bltz	s0,10bc <_mem_avail_start-0x7fffef44>
    10bc:	07380b00 	0x7380b00
    10c0:	1e010000 	0x1e010000
    10c4:	00000185 	0x185
    10c8:	000000e8 	0xe8
    10cc:	b40c0006 	0xb40c0006
    10d0:	a4bfc00d 	sh	ra,-16371(a1)
    10d4:	0c000001 	jal	4 <_mem_avail_start-0x7ffffffc>
    10d8:	bfc00e10 	cache	0x0,3600(s8)
    10dc:	000001af 	0x1af
    10e0:	c00e340c 	ll	t6,13324(zero)
    10e4:	0001babf 	0x1babf
    10e8:	0e500c00 	jal	9403000 <_mem_avail_start-0x76bfd000>
    10ec:	01babfc0 	0x1babfc0
    10f0:	680d0000 	0x680d0000
    10f4:	babfc00e 	swr	ra,-16370(s5)
    10f8:	25000001 	addiu	zero,t0,1
    10fc:	0e000001 	jal	8000004 <_mem_avail_start-0x77fffffc>
    1100:	83025601 	lb	v0,22017(t8)
    1104:	57010e00 	bnel	t8,at,4908 <_mem_avail_start-0x7fffb6f8>
    1108:	0f003001 	jal	c00c004 <_mem_avail_start-0x73ff3ffc>
    110c:	bfc00e94 	cache	0x0,3732(s8)
    1110:	000001a4 	0x1a4
    1114:	0254010e 	0x254010e
    1118:	00002508 	0x2508
    111c:	00011810 	0x11810
    1120:	07300b00 	bltzal	t9,3d24 <_mem_avail_start-0x7fffc2dc>
    1124:	19010000 	0x19010000
    1128:	00000185 	0x185
    112c:	0000014c 	syscall	0x5
    1130:	d8110006 	ldc2	$17,6(zero)
    1134:	08bfc00e 	j	2ff0038 <_mem_avail_start-0x7d00ffc8>
    1138:	7a000000 	0x7a000000
    113c:	0b000001 	j	c000004 <_mem_avail_start-0x73fffffc>
    1140:	00000730 	tge	zero,zero,0x1c
    1144:	01851901 	0x1851901
    1148:	016a0000 	0x16a0000
    114c:	00060000 	sll	zero,a2,0x0
    1150:	c00ee00f 	ll	t6,-8177(zero)
    1154:	0001a4bf 	0x1a4bf
    1158:	54010e00 	bnel	zero,at,495c <_mem_avail_start-0x7fffb6a4>
    115c:	00003d01 	0x3d01
    1160:	c00d8c0c 	ll	t5,-29684(zero)
    1164:	0001a4bf 	0x1a4bf
    1168:	12000000 	beqz	s0,116c <_mem_avail_start-0x7fffee94>
    116c:	6e690504 	0x6e690504
    1170:	04130074 	bgezall	zero,1344 <_mem_avail_start-0x7fffecbc>
    1174:	00000199 	0x199
    1178:	f2060103 	0xf2060103
    117c:	14000001 	bnez	zero,1184 <_mem_avail_start-0x7fffee7c>
    1180:	00000192 	0x192
    1184:	00250413 	0x250413
    1188:	30150000 	andi	s5,zero,0x0
    118c:	30000007 	andi	zero,zero,0x7
    1190:	01000007 	srav	zero,zero,t0
    1194:	04741519 	0x4741519
    1198:	04740000 	0x4740000
    119c:	14010000 	bne	zero,at,11a0 <_mem_avail_start-0x7fffee60>
    11a0:	00073815 	0x73815
    11a4:	00073800 	sll	a3,a3,0x0
    11a8:	001e0100 	sll	zero,s8,0x4
    11ac:	0000014a 	0x14a
    11b0:	050d0004 	0x50d0004
    11b4:	01040000 	0x1040000
    11b8:	00000616 	0x616
    11bc:	0007960c 	syscall	0x1e58
    11c0:	00075100 	sll	t2,a3,0x4
    11c4:	00019800 	sll	s3,at,0x0
    11c8:	00000000 	nop
    11cc:	00047f00 	sll	t7,a0,0x1c
    11d0:	07040200 	0x7040200
    11d4:	000003f8 	0x3f8
    11d8:	f3070402 	0xf3070402
    11dc:	03000003 	0x3000003
    11e0:	00000738 	0x738
    11e4:	011d0101 	0x11d0101
    11e8:	0ee80000 	jal	ba00000 <_mem_avail_start-0x74600000>
    11ec:	00d8bfc0 	0xd8bfc0
    11f0:	9c010000 	0x9c010000
    11f4:	0000011d 	0x11d
    11f8:	01007604 	0x1007604
    11fc:	00012401 	0x12401
    1200:	00064600 	sll	t0,a2,0x18
    1204:	00770400 	0x770400
    1208:	011d0101 	0x11d0101
    120c:	068e0000 	tnei	s4,0
    1210:	f6050000 	sdc1	$f5,0(s0)
    1214:	01000006 	srlv	zero,zero,t0
    1218:	00011d01 	0x11d01
    121c:	0006de00 	sll	k1,a2,0x18
    1220:	07a20500 	bltzl	sp,2624 <_mem_avail_start-0x7fffd9dc>
    1224:	01010000 	0x1010000
    1228:	0000011d 	0x11d
    122c:	00000720 	0x720
    1230:	01006906 	0x1006906
    1234:	00011d03 	sra	v1,at,0x14
    1238:	00075a00 	sll	t3,a3,0x8
    123c:	006a0600 	0x6a0600
    1240:	011d0301 	0x11d0301
    1244:	07830000 	bgezl	gp,1248 <_mem_avail_start-0x7fffedb8>
    1248:	63060000 	0x63060000
    124c:	1d040100 	0x1d040100
    1250:	d2000001 	0xd2000001
    1254:	07000007 	bltz	t8,1274 <_mem_avail_start-0x7fffed8c>
    1258:	00667562 	0x667562
    125c:	012b0501 	0x12b0501
    1260:	91030000 	lbu	v1,0(t0)
    1264:	90087fa8 	lbu	t0,32680(zero)
    1268:	01000007 	srav	zero,zero,t0
    126c:	00002c06 	0x2c06
    1270:	0007e500 	sll	gp,a3,0x14
    1274:	0f180900 	jal	c602400 <_mem_avail_start-0x739fdc00>
    1278:	0010bfc0 	sll	s7,s0,0x1f
    127c:	00f80000 	0xf80000
    1280:	300a0000 	andi	t2,zero,0x0
    1284:	01000007 	srav	zero,zero,t0
    1288:	00011d0a 	0x11d0a
    128c:	0000e700 	sll	gp,zero,0x1c
    1290:	0c000b00 	jal	2c00 <_mem_avail_start-0x7fffd400>
    1294:	bfc00f24 	cache	0x0,3876(s8)
    1298:	00000142 	srl	zero,zero,0x5
    129c:	0254010d 	break	0x254,0x4
    12a0:	00002d08 	0x2d08
    12a4:	c00f900e 	ll	t7,-28658(zero)
    12a8:	000030bf 	0x30bf
    12ac:	07300a00 	bltzal	t9,3ab0 <_mem_avail_start-0x7fffc550>
    12b0:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    12b4:	0000011d 	0x11d
    12b8:	00000112 	0x112
    12bc:	b80f000b 	swr	t7,11(zero)
    12c0:	42bfc00f 	c0	0xbfc00f
    12c4:	00000001 	movf	zero,zero,$fcc0
    12c8:	05041000 	0x5041000
    12cc:	00746e69 	0x746e69
    12d0:	b2050402 	0xb2050402
    12d4:	11000001 	beqz	t0,12dc <_mem_avail_start-0x7fffed24>
    12d8:	0000013b 	0x13b
    12dc:	0000013b 	0x13b
    12e0:	00002512 	0x2512
    12e4:	02003f00 	0x2003f00
    12e8:	01f20601 	0x1f20601
    12ec:	30130000 	andi	s3,zero,0x0
    12f0:	30000007 	andi	zero,zero,0x7
    12f4:	01000007 	srav	zero,zero,t0
    12f8:	0416000a 	0x416000a
    12fc:	00040000 	sll	zero,a0,0x0
    1300:	0000060f 	sync	0x18
    1304:	06160104 	0x6160104
    1308:	b50c0000 	0xb50c0000
    130c:	51000007 	beqzl	t0,132c <_mem_avail_start-0x7fffecd4>
    1310:	a8000007 	swl	zero,7(zero)
    1314:	00000001 	movf	zero,zero,$fcc0
    1318:	f9000000 	sdc2	$0,0(t0)
    131c:	02000004 	sllv	zero,zero,s0
    1320:	07040304 	0x7040304
    1324:	000003f8 	0x3f8
    1328:	f3070403 	0xf3070403
    132c:	04000003 	bltz	zero,133c <_mem_avail_start-0x7fffecc4>
    1330:	000000b4 	teq	zero,zero,0x2
    1334:	00271002 	ror	v0,a3,0x0
    1338:	af050000 	sw	a1,0(t8)
    133c:	01000007 	srav	zero,zero,t0
    1340:	00000172 	tlt	zero,zero,0x5
    1344:	000c0000 	sll	zero,t4,0x0
    1348:	9c010000 	0x9c010000
    134c:	0000008e 	0x8e
    1350:	01007306 	0x1007306
    1354:	00250172 	tlt	at,a1,0x5
    1358:	54010000 	bnel	zero,at,135c <_mem_avail_start-0x7fffeca4>
    135c:	01006e07 	0x1006e07
    1360:	00350172 	tlt	at,s5,0x5
    1364:	08190000 	j	640000 <_mem_avail_start-0x7f9c0000>
    1368:	00080000 	sll	zero,t0,0x0
    136c:	dd000000 	ldc3	$0,0(t0)
    1370:	09000001 	j	4000004 <_mem_avail_start-0x7bfffffc>
    1374:	74025401 	jalx	95004 <_mem_avail_start-0x7ff6affc>
    1378:	55010900 	bnel	t0,at,377c <_mem_avail_start-0x7fffc884>
    137c:	09007502 	j	401d408 <_mem_avail_start-0x7bfe2bf8>
    1380:	f3035601 	0xf3035601
    1384:	00005501 	0x5501
    1388:	0007be0a 	0x7be0a
    138c:	01660100 	0x1660100
    1390:	000000ef 	0xef
    1394:	00000000 	nop
    1398:	00000040 	ssnop
    139c:	00ef9c01 	0xef9c01
    13a0:	76070000 	jalx	81c0000 <_mem_avail_start-0x77e40000>
    13a4:	66010031 	0x66010031
    13a8:	0000f601 	0xf601
    13ac:	00084500 	sll	t0,t0,0x14
    13b0:	32760700 	andi	s6,s3,0x700
    13b4:	01660100 	0x1660100
    13b8:	000000f6 	tne	zero,zero,0x3
    13bc:	00000866 	0x866
    13c0:	01006e07 	0x1006e07
    13c4:	00350166 	0x350166
    13c8:	08870000 	j	21c0000 <_mem_avail_start-0x7de40000>
    13cc:	730b0000 	madd	t8,t3
    13d0:	67010031 	0x67010031
    13d4:	0000fd01 	0xfd01
    13d8:	0b540100 	j	d500400 <_mem_avail_start-0x72affc00>
    13dc:	01003273 	tltu	t0,zero,0xc9
    13e0:	00fd0168 	0xfd0168
    13e4:	55010000 	bnel	t0,at,13e8 <_mem_avail_start-0x7fffec18>
    13e8:	05040c00 	0x5040c00
    13ec:	00746e69 	0x746e69
    13f0:	00fc040d 	break	0xfc,0x10
    13f4:	0d0e0000 	jal	4380000 <_mem_avail_start-0x7bc80000>
    13f8:	00010a04 	0x10a04
    13fc:	06010300 	bgez	s0,2000 <_mem_avail_start-0x7fffe000>
    1400:	000001f2 	tlt	zero,zero,0x7
    1404:	0001030f 	0x1030f
    1408:	07a70a00 	0x7a70a00
    140c:	43010000 	c0	0x1010000
    1410:	00002501 	0x2501
    1414:	00000000 	nop
    1418:	00007000 	sll	t6,zero,0x0
    141c:	749c0100 	jalx	2700400 <_mem_avail_start-0x7d8ffc00>
    1420:	07000001 	bltz	t8,1428 <_mem_avail_start-0x7fffebd8>
    1424:	00747364 	0x747364
    1428:	25014301 	addiu	at,t0,17153
    142c:	aa000000 	swl	zero,0(s0)
    1430:	07000008 	bltz	t8,1454 <_mem_avail_start-0x7fffebac>
    1434:	00637273 	tltu	v1,v1,0x1c9
    1438:	f6014301 	sdc1	$f1,17153(s0)
    143c:	c8000000 	lwc2	$0,0(zero)
    1440:	07000008 	bltz	t8,1464 <_mem_avail_start-0x7fffeb9c>
    1444:	4301006e 	c0	0x101006e
    1448:	00003501 	0x3501
    144c:	00090200 	sll	zero,t1,0x8
    1450:	00731000 	0x731000
    1454:	fd014701 	sdc3	$1,18177(t0)
    1458:	86000000 	lh	zero,0(s0)
    145c:	10000009 	b	1484 <_mem_avail_start-0x7fffeb7c>
    1460:	48010064 	0x48010064
    1464:	00017401 	0x17401
    1468:	0009af00 	sll	s5,t1,0x1c
    146c:	040d0000 	0x40d0000
    1470:	00000103 	sra	zero,zero,0x4
    1474:	0000e10a 	0xe10a
    1478:	012c0100 	0x12c0100
    147c:	00000025 	move	zero,zero
    1480:	bfc00fe4 	cache	0x0,4068(s8)
    1484:	0000002c 	0x2c
    1488:	01dd9c01 	0x1dd9c01
    148c:	64070000 	0x64070000
    1490:	01007473 	tltu	t0,zero,0x1d1
    1494:	0025012c 	0x25012c
    1498:	0a040000 	j	8100000 <_mem_avail_start-0x77f00000>
    149c:	73070000 	madd	t8,a3
    14a0:	01006372 	tlt	t0,zero,0x18d
    14a4:	00f6012c 	0xf6012c
    14a8:	0a220000 	j	8880000 <_mem_avail_start-0x77780000>
    14ac:	6e070000 	0x6e070000
    14b0:	012c0100 	0x12c0100
    14b4:	00000035 	0x35
    14b8:	00000a43 	sra	at,zero,0x9
    14bc:	0100730b 	0x100730b
    14c0:	00fd0130 	tge	a3,sp,0x4
    14c4:	55010000 	bnel	t0,at,14c8 <_mem_avail_start-0x7fffeb38>
    14c8:	01006410 	0x1006410
    14cc:	01740131 	tgeu	t3,s4,0x4
    14d0:	0a8d0000 	j	a340000 <_mem_avail_start-0x75cc0000>
    14d4:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    14d8:	000005be 	0x5be
    14dc:	25011101 	addiu	at,t0,4353
    14e0:	c0000000 	ll	zero,0(zero)
    14e4:	24bfc00f 	addiu	ra,a1,-16369
    14e8:	01000000 	0x1000000
    14ec:	00022e9c 	0x22e9c
    14f0:	00730700 	0x730700
    14f4:	25011101 	addiu	at,t0,4353
    14f8:	ab000000 	swl	zero,0(t8)
    14fc:	0600000a 	bltz	s0,1528 <_mem_avail_start-0x7fffead8>
    1500:	11010063 	beq	t0,at,1690 <_mem_avail_start-0x7fffe970>
    1504:	00010301 	0x10301
    1508:	07550100 	0x7550100
    150c:	1101006e 	beq	t0,at,16c8 <_mem_avail_start-0x7fffe938>
    1510:	00003501 	0x3501
    1514:	000ac900 	sll	t9,t2,0x4
    1518:	00701000 	0x701000
    151c:	74011501 	jalx	45404 <_mem_avail_start-0x7ffbabfc>
    1520:	13000001 	beqz	t8,1528 <_mem_avail_start-0x7fffead8>
    1524:	0000000b 	movn	zero,zero,zero
    1528:	0007f911 	0x7f911
    152c:	74a30100 	jalx	28c0400 <_mem_avail_start-0x7d73fc00>
    1530:	00000001 	movf	zero,zero,$fcc0
    1534:	28000000 	slti	zero,zero,0
    1538:	01000000 	0x1000000
    153c:	0002609c 	0x2609c
    1540:	00731200 	0x731200
    1544:	00fda301 	0xfda301
    1548:	0b310000 	j	cc40000 <_mem_avail_start-0x733c0000>
    154c:	63130000 	0x63130000
    1550:	03a30100 	0x3a30100
    1554:	01000001 	movf	zero,t0,$fcc0
    1558:	d5110055 	ldc1	$f17,85(t0)
    155c:	01000007 	srav	zero,zero,t0
    1560:	0001748f 	0x1748f
    1564:	00000000 	nop
    1568:	00002c00 	sll	a1,zero,0x10
    156c:	929c0100 	lbu	gp,256(s4)
    1570:	12000002 	beqz	s0,157c <_mem_avail_start-0x7fffea84>
    1574:	8f010073 	lw	at,115(t8)
    1578:	000000fd 	0xfd
    157c:	00000b4f 	0xb4f
    1580:	01006313 	0x1006313
    1584:	0001038f 	0x1038f
    1588:	00550100 	0x550100
    158c:	0007f111 	0x7f111
    1590:	ef7f0100 	swc3	$31,256(k1)
    1594:	00000000 	nop
    1598:	44000000 	mfc1	zero,$f0
    159c:	01000000 	0x1000000
    15a0:	0002d59c 	0x2d59c
    15a4:	31731200 	andi	s3,t3,0x1200
    15a8:	fd7f0100 	sdc3	$31,256(t3)
    15ac:	78000000 	0x78000000
    15b0:	1200000b 	beqz	s0,15e0 <_mem_avail_start-0x7fffea20>
    15b4:	01003273 	tltu	t0,zero,0xc9
    15b8:	0000fd7f 	0xfd7f
    15bc:	000b9600 	sll	s2,t3,0x18
    15c0:	006e1200 	0x6e1200
    15c4:	00357f01 	0x357f01
    15c8:	0bb40000 	j	ed00000 <_mem_avail_start-0x71300000>
    15cc:	11000000 	beqz	t0,15d0 <_mem_avail_start-0x7fffea30>
    15d0:	000007e3 	0x7e3
    15d4:	00ef6801 	0xef6801
    15d8:	00000000 	nop
    15dc:	00300000 	0x300000
    15e0:	9c010000 	0x9c010000
    15e4:	0000030b 	0x30b
    15e8:	00317312 	0x317312
    15ec:	00fd6801 	movt	t5,a3,$fcc7
    15f0:	0bf30000 	j	fcc0000 <_mem_avail_start-0x70340000>
    15f4:	73120000 	madd	t8,s2
    15f8:	68010032 	0x68010032
    15fc:	000000fd 	0xfd
    1600:	00000c11 	0xc11
    1604:	07c51100 	0x7c51100
    1608:	4d010000 	bc3t	160c <_mem_avail_start-0x7fffe9f4>
    160c:	00000174 	teq	zero,zero,0x5
    1610:	00000000 	nop
    1614:	00000034 	teq	zero,zero
    1618:	035f9c01 	0x35f9c01
    161c:	64120000 	0x64120000
    1620:	01007473 	tltu	t0,zero,0x1d1
    1624:	0001744d 	break	0x1,0x1d1
    1628:	000c2f00 	sll	a1,t4,0x1c
    162c:	72731200 	0x72731200
    1630:	4d010063 	bc3t	17c0 <_mem_avail_start-0x7fffe840>
    1634:	000000fd 	0xfd
    1638:	00000c4d 	break	0x0,0x31
    163c:	6e656c12 	0x6e656c12
    1640:	354d0100 	ori	t5,t2,0x100
    1644:	6b000000 	0x6b000000
    1648:	1400000c 	bnez	zero,167c <_mem_avail_start-0x7fffe984>
    164c:	4e010070 	c3	0x10070
    1650:	00000174 	teq	zero,zero,0x5
    1654:	00000ca0 	0xca0
    1658:	07dc1100 	0x7dc1100
    165c:	37010000 	ori	at,t8,0x0
    1660:	00000174 	teq	zero,zero,0x5
    1664:	00000000 	nop
    1668:	00000024 	and	zero,zero,zero
    166c:	03a49c01 	0x3a49c01
    1670:	64120000 	0x64120000
    1674:	01007473 	tltu	t0,zero,0x1d1
    1678:	00017437 	0x17437
    167c:	000cbe00 	sll	s7,t4,0x18
    1680:	72731200 	0x72731200
    1684:	37010063 	ori	at,t8,0x63
    1688:	000000fd 	0xfd
    168c:	00000cdc 	0xcdc
    1690:	01007014 	0x1007014
    1694:	0001743b 	0x1743b
    1698:	000cfa00 	sll	ra,t4,0x8
    169c:	cd110000 	pref	0x11,0(t0)
    16a0:	01000007 	srav	zero,zero,t0
    16a4:	00003522 	0x3522
    16a8:	00000000 	nop
    16ac:	00002800 	sll	a1,zero,0x0
    16b0:	e79c0100 	swc1	$f28,256(gp)
    16b4:	12000003 	beqz	s0,16c4 <_mem_avail_start-0x7fffe93c>
    16b8:	22010073 	addi	at,s0,115
    16bc:	000000fd 	0xfd
    16c0:	00000d18 	0xd18
    16c4:	6e656c13 	0x6e656c13
    16c8:	35220100 	ori	v0,t1,0x100
    16cc:	01000000 	0x1000000
    16d0:	6e631455 	0x6e631455
    16d4:	23010074 	addi	at,t8,116
    16d8:	00000035 	0x35
    16dc:	00000d5d 	0xd5d
    16e0:	07ea1500 	tlti	ra,5376
    16e4:	0c010000 	jal	40000 <_mem_avail_start-0x7ffc0000>
    16e8:	00000035 	0x35
    16ec:	00000000 	nop
    16f0:	00000020 	add	zero,zero,zero
    16f4:	73129c01 	0x73129c01
    16f8:	fd0c0100 	sdc3	$12,256(t0)
    16fc:	7c000000 	0x7c000000
    1700:	1400000d 	bnez	zero,1738 <_mem_avail_start-0x7fffe8c8>
    1704:	00746e63 	0x746e63
    1708:	00350d01 	0x350d01
    170c:	0d9a0000 	jal	6680000 <_mem_avail_start-0x79980000>
    1710:	00000000 	nop
    1714:	0000014c 	syscall	0x5
    1718:	07510004 	bgezal	k0,172c <_mem_avail_start-0x7fffe8d4>
    171c:	01040000 	0x1040000
    1720:	00000616 	0x616
    1724:	0008010c 	syscall	0x2004
    1728:	00075100 	sll	t2,a3,0x4
    172c:	00023000 	sll	a2,v0,0x0
    1730:	00000000 	nop
    1734:	00067600 	sll	t6,a2,0x18
    1738:	07040200 	0x7040200
    173c:	000003f8 	0x3f8
    1740:	f3070402 	0xf3070402
    1744:	03000003 	0x3000003
    1748:	0000022e 	0x22e
    174c:	00a20e01 	0xa20e01
    1750:	10700000 	beq	v1,s0,1754 <_mem_avail_start-0x7fffe8ac>
    1754:	0030bfc0 	0x30bfc0
    1758:	9c010000 	0x9c010000
    175c:	000000a2 	0xa2
    1760:	01007304 	0x1007304
    1764:	0000a90e 	0xa90e
    1768:	000db900 	sll	s7,t5,0x4
    176c:	07300500 	bltzal	t9,2b70 <_mem_avail_start-0x7fffd490>
    1770:	07010000 	bgez	t8,1774 <_mem_avail_start-0x7fffe88c>
    1774:	000000a2 	0xa2
    1778:	0000006a 	0x6a
    177c:	80070006 	lb	a3,6(zero)
    1780:	bbbfc010 	swr	ra,-16368(sp)
    1784:	7f000000 	0x7f000000
    1788:	08000000 	j	0 <_mem_avail_start-0x80000000>
    178c:	f3035401 	0xf3035401
    1790:	07005401 	bltz	t8,16798 <_mem_avail_start-0x7ffe9868>
    1794:	bfc01088 	cache	0x0,4232(s8)
    1798:	00000144 	0x144
    179c:	00000092 	0x92
    17a0:	01540108 	0x1540108
    17a4:	9009003d 	lbu	t1,61(zero)
    17a8:	44bfc010 	0x44bfc010
    17ac:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    17b0:	3a015401 	xori	at,s0,0x5401
    17b4:	040a0000 	tlti	zero,0
    17b8:	746e6905 	jalx	1b9a414 <_mem_avail_start-0x7e465bec>
    17bc:	b6040b00 	0xb6040b00
    17c0:	02000000 	0x2000000
    17c4:	01f20601 	0x1f20601
    17c8:	af0c0000 	sw	t4,0(t8)
    17cc:	03000000 	0x3000000
    17d0:	00000474 	teq	zero,zero,0x11
    17d4:	00a20101 	0xa20101
    17d8:	10100000 	beq	zero,s0,17dc <_mem_avail_start-0x7fffe824>
    17dc:	0060bfc0 	0x60bfc0
    17e0:	9c010000 	0x9c010000
    17e4:	00000144 	0x144
    17e8:	01007304 	0x1007304
    17ec:	0000a901 	0xa901
    17f0:	000dda00 	sll	k1,t5,0x8
    17f4:	00630d00 	0x630d00
    17f8:	00af0301 	0xaf0301
    17fc:	0e030000 	jal	80c0000 <_mem_avail_start-0x77f40000>
    1800:	180e0000 	0x180e0000
    1804:	05000002 	bltz	t0,1810 <_mem_avail_start-0x7fffe7f0>
    1808:	00000730 	tge	zero,zero,0x1c
    180c:	00a20701 	0xa20701
    1810:	01040000 	0x1040000
    1814:	00060000 	sll	zero,a2,0x0
    1818:	c010580f 	ll	s0,22543(zero)
    181c:	000008bf 	0x8bf
    1820:	00013200 	sll	a2,at,0x8
    1824:	07300500 	bltzal	t9,2c28 <_mem_avail_start-0x7fffd3d8>
    1828:	07010000 	bgez	t8,182c <_mem_avail_start-0x7fffe7d4>
    182c:	000000a2 	0xa2
    1830:	00000122 	0x122
    1834:	60090006 	0x60090006
    1838:	44bfc010 	0x44bfc010
    183c:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    1840:	3d015401 	0x3d015401
    1844:	68090000 	0x68090000
    1848:	44bfc010 	0x44bfc010
    184c:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    1850:	80025401 	lb	v0,21505(zero)
    1854:	00000000 	nop
    1858:	00073010 	0x73010
    185c:	00073000 	sll	a2,a3,0x0
    1860:	00070100 	sll	zero,a3,0x4
    1864:	000000b2 	tlt	zero,zero,0x2
    1868:	08240004 	j	900010 <_mem_avail_start-0x7f6ffff0>
    186c:	01040000 	0x1040000
    1870:	00000616 	0x616
    1874:	0008080c 	syscall	0x2020
    1878:	00075100 	sll	t2,a3,0x4
    187c:	00024800 	sll	t1,v0,0x0
    1880:	00000000 	nop
    1884:	0006c900 	sll	t9,a2,0x4
    1888:	07040200 	0x7040200
    188c:	000003f8 	0x3f8
    1890:	f3070402 	0xf3070402
    1894:	02000003 	0x2000003
    1898:	01eb0601 	0x1eb0601
    189c:	02020000 	0x2020000
    18a0:	0000aa05 	0xaa05
    18a4:	05040300 	0x5040300
    18a8:	00746e69 	0x746e69
    18ac:	b2050402 	0xb2050402
    18b0:	04000001 	bltz	zero,18b8 <_mem_avail_start-0x7fffe748>
    18b4:	00000119 	0x119
    18b8:	005a0902 	0x5a0902
    18bc:	01020000 	0x1020000
    18c0:	0001e908 	0x1e908
    18c4:	07020200 	bltzl	t8,20c8 <_mem_avail_start-0x7fffdf38>
    18c8:	000003a4 	0x3a4
    18cc:	00015604 	0x15604
    18d0:	4f0b0300 	c3	0x10b0300
    18d4:	05000000 	bltz	t0,18d8 <_mem_avail_start-0x7fffe728>
    18d8:	00000730 	tge	zero,zero,0x1c
    18dc:	00410301 	0x410301
    18e0:	10a00000 	beqz	a1,18e4 <_mem_avail_start-0x7fffe71c>
    18e4:	002cbfc0 	0x2cbfc0
    18e8:	9c010000 	0x9c010000
    18ec:	000000aa 	0xaa
    18f0:	01006306 	0x1006306
    18f4:	00004103 	sra	t0,zero,0x4
    18f8:	000e2100 	sll	a0,t6,0x4
    18fc:	10b80700 	beq	a1,t8,3500 <_mem_avail_start-0x7fffcb00>
    1900:	00aabfc0 	0xaabfc0
    1904:	01080000 	0x1080000
    1908:	00800254 	0x800254
    190c:	30090000 	andi	t1,zero,0x0
    1910:	30000004 	andi	zero,zero,0x4
    1914:	03000004 	sllv	zero,zero,t8
    1918:	05c40046 	0x5c40046
    191c:	00040000 	sll	zero,a0,0x0
    1920:	000008ae 	0x8ae
    1924:	02ad0104 	0x2ad0104
    1928:	c6040000 	lwc1	$f4,0(s0)
    192c:	51000008 	beqzl	t0,1950 <_mem_avail_start-0x7fffe6b0>
    1930:	08000007 	j	1c <_mem_avail_start-0x7fffffe4>
    1934:	00000004 	sllv	zero,zero,zero
    1938:	26000000 	addiu	zero,s0,0
    193c:	02000007 	srav	zero,zero,s0
    1940:	07040304 	0x7040304
    1944:	000003f8 	0x3f8
    1948:	00002704 	0x2704
    194c:	07040300 	0x7040300
    1950:	000003f3 	tltu	zero,zero,0xf
    1954:	00020d05 	0x20d05
    1958:	270f0200 	addiu	t7,t8,512
    195c:	03000000 	0x3000000
    1960:	01f20601 	0x1f20601
    1964:	01030000 	0x1030000
    1968:	0001eb06 	0x1eb06
    196c:	05020300 	bltzl	t0,2570 <_mem_avail_start-0x7fffda90>
    1970:	000000aa 	0xaa
    1974:	69050406 	0x69050406
    1978:	0300746e 	0x300746e
    197c:	01b20504 	0x1b20504
    1980:	01030000 	0x1030000
    1984:	0001e908 	0x1e908
    1988:	00680400 	0x680400
    198c:	02030000 	0x2030000
    1990:	0003a407 	0x3a407
    1994:	00740400 	0x740400
    1998:	ca050000 	lwc2	$5,0(s0)
    199c:	03000009 	jalr	zero,t8
    19a0:	00003a0d 	break	0x0,0xe8
    19a4:	089e0700 	j	2781c00 <_mem_avail_start-0x7d87e400>
    19a8:	09010000 	j	4040000 <_mem_avail_start-0x7bfc0000>
    19ac:	00000821 	move	at,zero
    19b0:	0000010e 	0x10e
    19b4:	00010e01 	0x10e01
    19b8:	08590800 	j	1642000 <_mem_avail_start-0x7e9be000>
    19bc:	00680000 	0x680000
    19c0:	9d090000 	0x9d090000
    19c4:	01000003 	0x1000003
    19c8:	00002509 	0x2509
    19cc:	04c50900 	0x4c50900
    19d0:	09010000 	j	4040000 <_mem_avail_start-0x7bfc0000>
    19d4:	00000025 	move	zero,zero
    19d8:	0008bc0a 	0x8bc0a
    19dc:	800a0100 	lb	t2,256(zero)
    19e0:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    19e4:	0000039e 	0x39e
    19e8:	01150c01 	0x1150c01
    19ec:	650b0000 	0x650b0000
    19f0:	0100646e 	0x100646e
    19f4:	0001150d 	break	0x1,0x54
    19f8:	06ec0a00 	teqi	s7,2560
    19fc:	0f010000 	jal	c040000 <_mem_avail_start-0x73fc0000>
    1a00:	00000027 	nor	zero,zero,zero
    1a04:	6d656d0b 	0x6d656d0b
    1a08:	15110100 	bne	t0,s1,1e0c <_mem_avail_start-0x7fffe1f4>
    1a0c:	0c000001 	jal	4 <_mem_avail_start-0x7ffffffc>
    1a10:	0008120a 	0x8120a
    1a14:	27230100 	addiu	v1,t9,256
    1a18:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    1a1c:	000008f7 	0x8f7
    1a20:	00682401 	0x682401
    1a24:	00000000 	nop
    1a28:	5d020103 	0x5d020103
    1a2c:	0d000001 	jal	4000004 <_mem_avail_start-0x7bfffffc>
    1a30:	00006f04 	0x6f04
    1a34:	085e0700 	j	1781c00 <_mem_avail_start-0x7e87e400>
    1a38:	09010000 	j	4040000 <_mem_avail_start-0x7bfc0000>
    1a3c:	0000083d 	0x83d
    1a40:	0000010e 	0x10e
    1a44:	00019e01 	0x19e01
    1a48:	08590800 	j	1642000 <_mem_avail_start-0x7e9be000>
    1a4c:	00740000 	0x740000
    1a50:	9d090000 	0x9d090000
    1a54:	01000003 	0x1000003
    1a58:	00002509 	0x2509
    1a5c:	04c50900 	0x4c50900
    1a60:	09010000 	j	4040000 <_mem_avail_start-0x7bfc0000>
    1a64:	00000025 	move	zero,zero
    1a68:	0008bc0a 	0x8bc0a
    1a6c:	800a0100 	lb	t2,256(zero)
    1a70:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    1a74:	0000039e 	0x39e
    1a78:	019e0c01 	0x19e0c01
    1a7c:	650b0000 	0x650b0000
    1a80:	0100646e 	0x100646e
    1a84:	00019e0d 	break	0x1,0x278
    1a88:	06ec0a00 	teqi	s7,2560
    1a8c:	0f010000 	jal	c040000 <_mem_avail_start-0x73fc0000>
    1a90:	00000027 	nor	zero,zero,zero
    1a94:	6d656d0b 	0x6d656d0b
    1a98:	9e110100 	0x9e110100
    1a9c:	0c000001 	jal	4 <_mem_avail_start-0x7ffffffc>
    1aa0:	0008120a 	0x8120a
    1aa4:	27230100 	addiu	v1,t9,256
    1aa8:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    1aac:	000008f7 	0x8f7
    1ab0:	00742401 	0x742401
    1ab4:	00000000 	nop
    1ab8:	007b040d 	break	0x7b,0x10
    1abc:	81070000 	lb	a3,0(t0)
    1ac0:	01000008 	jr	t0
    1ac4:	0008d609 	0x8d609
    1ac8:	00010e00 	sll	at,at,0x18
    1acc:	02270100 	0x2270100
    1ad0:	59080000 	0x59080000
    1ad4:	27000008 	addiu	zero,t8,8
    1ad8:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    1adc:	0000039d 	0x39d
    1ae0:	00250901 	0x250901
    1ae4:	c5090000 	lwc1	$f9,0(t0)
    1ae8:	01000004 	sllv	zero,zero,t0
    1aec:	00002509 	0x2509
    1af0:	08bc0a00 	j	2f02800 <_mem_avail_start-0x7d0fd800>
    1af4:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    1af8:	00000080 	sll	zero,zero,0x2
    1afc:	00039e0a 	0x39e0a
    1b00:	270c0100 	addiu	t4,t8,256
    1b04:	0b000002 	j	c000008 <_mem_avail_start-0x73fffff8>
    1b08:	00646e65 	0x646e65
    1b0c:	02270d01 	0x2270d01
    1b10:	ec0a0000 	swc3	$10,0(zero)
    1b14:	01000006 	srlv	zero,zero,t0
    1b18:	0000270f 	0x270f
    1b1c:	656d0b00 	0x656d0b00
    1b20:	1101006d 	beq	t0,at,1cd8 <_mem_avail_start-0x7fffe328>
    1b24:	00000227 	0x227
    1b28:	08120a0c 	j	482830 <_mem_avail_start-0x7fb7d7d0>
    1b2c:	23010000 	addi	at,t8,0
    1b30:	00000027 	nor	zero,zero,zero
    1b34:	0008f70a 	0x8f70a
    1b38:	27240100 	addiu	a0,t9,256
    1b3c:	00000000 	nop
    1b40:	2e040d00 	sltiu	a0,s0,3328
    1b44:	0e000000 	jal	8000000 <_mem_avail_start-0x78000000>
    1b48:	00000041 	0x41
    1b4c:	00582f01 	0x582f01
    1b50:	010e0000 	0x10e0000
    1b54:	10cc0000 	beq	a2,t4,1b58 <_mem_avail_start-0x7fffe4a8>
    1b58:	02b4bfc0 	0x2b4bfc0
    1b5c:	9c010000 	0x9c010000
    1b60:	00000556 	0x556
    1b64:	00039e0f 	0x39e0f
    1b68:	252f0100 	addiu	t7,t1,256
    1b6c:	4a000000 	c2	0x0
    1b70:	1000000e 	b	1bac <_mem_avail_start-0x7fffe454>
    1b74:	00646e65 	0x646e65
    1b78:	00252f01 	0x252f01
    1b7c:	0e9a0000 	jal	a680000 <_mem_avail_start-0x75980000>
    1b80:	a4110000 	sh	s1,0(zero)
    1b84:	1c000001 	bgtz	zero,1b8c <_mem_avail_start-0x7fffe474>
    1b88:	58bfc011 	0x58bfc011
    1b8c:	01000002 	0x1000002
    1b90:	00032334 	teq	zero,v1,0x8c
    1b94:	01cc1200 	0x1cc1200
    1b98:	0edc0000 	jal	b700000 <_mem_avail_start-0x74900000>
    1b9c:	c1120000 	ll	s2,0(t0)
    1ba0:	fa000001 	sdc2	$0,1(s0)
    1ba4:	1300000e 	beqz	t8,1be0 <_mem_avail_start-0x7fffe420>
    1ba8:	00000258 	0x258
    1bac:	0001d714 	0x1d714
    1bb0:	000f1800 	sll	v1,t7,0x0
    1bb4:	01e21400 	0x1e21400
    1bb8:	0f4d0000 	jal	d340000 <_mem_avail_start-0x72cc0000>
    1bbc:	ed140000 	swc3	$20,0(t0)
    1bc0:	87000001 	lh	zero,1(t8)
    1bc4:	1400000f 	bnez	zero,1c04 <_mem_avail_start-0x7fffe3fc>
    1bc8:	000001f8 	0x1f8
    1bcc:	00000fb3 	tltu	zero,zero,0x3e
    1bd0:	00020314 	0x20314
    1bd4:	00100f00 	sll	at,s0,0x1c
    1bd8:	05561100 	0x5561100
    1bdc:	111c0000 	beq	t0,gp,1be0 <_mem_avail_start-0x7fffe420>
    1be0:	0270bfc0 	0x270bfc0
    1be4:	16010000 	bne	s0,at,1be8 <_mem_avail_start-0x7fffe418>
    1be8:	000002dc 	0x2dc
    1bec:	00056a12 	0x56a12
    1bf0:	00105b00 	sll	t3,s0,0xc
    1bf4:	0e150000 	jal	8540000 <_mem_avail_start-0x77ac0000>
    1bf8:	90000002 	lbu	zero,2(zero)
    1bfc:	16000002 	bnez	s0,1c08 <_mem_avail_start-0x7fffe3f8>
    1c00:	0000020f 	sync	0x8
    1c04:	00021a14 	0x21a14
    1c08:	00107300 	sll	t6,s0,0xc
    1c0c:	05561100 	0x5561100
    1c10:	115c0000 	beq	t2,gp,1c14 <_mem_avail_start-0x7fffe3ec>
    1c14:	02b0bfc0 	0x2b0bfc0
    1c18:	23010000 	addi	at,t8,0
    1c1c:	00000310 	0x310
    1c20:	00056a12 	0x56a12
    1c24:	00109100 	sll	s2,s0,0x4
    1c28:	90170000 	lbu	s7,0(zero)
    1c2c:	9bbfc011 	lwr	ra,-16367(sp)
    1c30:	18000005 	blez	zero,1c48 <_mem_avail_start-0x7fffe3b8>
    1c34:	81025401 	lb	v0,21505(t0)
    1c38:	00000000 	nop
    1c3c:	011b1100 	0x11b1100
    1c40:	11ac0000 	beq	t5,t4,1c44 <_mem_avail_start-0x7fffe3bc>
    1c44:	02d8bfc0 	0x2d8bfc0
    1c48:	38010000 	xori	at,zero,0x0
    1c4c:	000003dc 	0x3dc
    1c50:	00014312 	0x14312
    1c54:	0010a900 	sll	s5,s0,0x4
    1c58:	01381200 	0x1381200
    1c5c:	10bc0000 	beq	a1,gp,1c60 <_mem_avail_start-0x7fffe3a0>
    1c60:	d8130000 	ldc2	$19,0(zero)
    1c64:	14000002 	bnez	zero,1c70 <_mem_avail_start-0x7fffe390>
    1c68:	0000014e 	0x14e
    1c6c:	000010cf 	0x10cf
    1c70:	00015914 	0x15914
    1c74:	00110f00 	sll	at,s1,0x1c
    1c78:	01641900 	0x1641900
    1c7c:	62010000 	0x62010000
    1c80:	00016f14 	0x16f14
    1c84:	00113000 	sll	a2,s1,0x0
    1c88:	017a1400 	0x17a1400
    1c8c:	11590000 	beq	t2,t9,1c90 <_mem_avail_start-0x7fffe370>
    1c90:	851a0000 	lh	k0,0(t0)
    1c94:	f8000001 	sdc2	$0,1(zero)
    1c98:	c1000002 	ll	zero,2(t0)
    1c9c:	16000003 	bnez	s0,1cac <_mem_avail_start-0x7fffe354>
    1ca0:	00000186 	0x186
    1ca4:	00019114 	0x19114
    1ca8:	00119a00 	sll	s3,s1,0x8
    1cac:	05561100 	0x5561100
    1cb0:	12500000 	beq	s2,s0,1cb4 <_mem_avail_start-0x7fffe34c>
    1cb4:	0320bfc0 	0x320bfc0
    1cb8:	23010000 	addi	at,t8,0
    1cbc:	000003b0 	tge	zero,zero,0xe
    1cc0:	00056a12 	0x56a12
    1cc4:	0011ad00 	sll	s5,s1,0x14
    1cc8:	84170000 	lh	s7,0(zero)
    1ccc:	9bbfc012 	lwr	ra,-16366(sp)
    1cd0:	18000005 	blez	zero,1ce8 <_mem_avail_start-0x7fffe318>
    1cd4:	81025401 	lb	v0,21505(t0)
    1cd8:	1b000000 	blez	t8,1cdc <_mem_avail_start-0x7fffe324>
    1cdc:	00000556 	0x556
    1ce0:	bfc0120c 	cache	0x0,4620(s8)
    1ce4:	00000350 	0x350
    1ce8:	6a121601 	0x6a121601
    1cec:	c5000005 	lwc1	$f0,5(t0)
    1cf0:	00000011 	mthi	zero
    1cf4:	8b110000 	lwl	s1,0(t8)
    1cf8:	b0000000 	0xb0000000
    1cfc:	70bfc011 	0x70bfc011
    1d00:	01000003 	0x1000003
    1d04:	0004ac3c 	0x4ac3c
    1d08:	00b31200 	0xb31200
    1d0c:	11dd0000 	beq	t6,sp,1d10 <_mem_avail_start-0x7fffe2f0>
    1d10:	a8120000 	swl	s2,0(zero)
    1d14:	f0000000 	0xf0000000
    1d18:	13000011 	beqz	t8,1d60 <_mem_avail_start-0x7fffe2a0>
    1d1c:	00000370 	tge	zero,zero,0xd
    1d20:	0000be14 	0xbe14
    1d24:	00121100 	sll	v0,s2,0x4
    1d28:	00c91400 	0xc91400
    1d2c:	12510000 	beq	s2,s1,1d30 <_mem_avail_start-0x7fffe2d0>
    1d30:	d4190000 	ldc1	$f25,0(zero)
    1d34:	01000000 	0x1000000
    1d38:	00df1462 	0xdf1462
    1d3c:	12720000 	beq	s3,s2,1d40 <_mem_avail_start-0x7fffe2c0>
    1d40:	ea140000 	swc2	$20,0(s0)
    1d44:	9b000000 	lwr	zero,0(t8)
    1d48:	1a000012 	blez	s0,1d94 <_mem_avail_start-0x7fffe26c>
    1d4c:	000000f5 	0xf5
    1d50:	00000390 	0x390
    1d54:	00000491 	0x491
    1d58:	0000f616 	0xf616
    1d5c:	01011400 	0x1011400
    1d60:	12dc0000 	beq	s6,gp,1d64 <_mem_avail_start-0x7fffe29c>
    1d64:	56110000 	bnel	s0,s1,1d68 <_mem_avail_start-0x7fffe298>
    1d68:	08000005 	j	14 <_mem_avail_start-0x7fffffec>
    1d6c:	b8bfc013 	swr	ra,-16365(a1)
    1d70:	01000003 	0x1000003
    1d74:	00046923 	0x46923
    1d78:	056a1200 	tlti	t3,4608
    1d7c:	12ef0000 	beq	s7,t7,1d80 <_mem_avail_start-0x7fffe280>
    1d80:	1c000000 	bgtz	zero,1d84 <_mem_avail_start-0x7fffe27c>
    1d84:	bfc011bc 	cache	0x0,4540(s8)
    1d88:	000005a6 	0x5a6
    1d8c:	00000480 	sll	zero,zero,0x12
    1d90:	05540118 	0x5540118
    1d94:	c01cf403 	ll	gp,-3069(zero)
    1d98:	3c1700bf 	lui	s7,0xbf
    1d9c:	9bbfc013 	lwr	ra,-16365(sp)
    1da0:	18000005 	blez	zero,1db8 <_mem_avail_start-0x7fffe248>
    1da4:	80025401 	lb	v0,21505(zero)
    1da8:	1b000000 	blez	t8,1dac <_mem_avail_start-0x7fffe254>
    1dac:	00000556 	0x556
    1db0:	bfc012c4 	cache	0x0,4804(s8)
    1db4:	000003e8 	0x3e8
    1db8:	6a121601 	0x6a121601
    1dbc:	07000005 	bltz	t8,1dd4 <_mem_avail_start-0x7fffe22c>
    1dc0:	00000013 	mtlo	zero
    1dc4:	101c0000 	beq	zero,gp,1dc8 <_mem_avail_start-0x7fffe238>
    1dc8:	a6bfc011 	sh	ra,-16367(s5)
    1dcc:	cf000005 	pref	0x0,5(t8)
    1dd0:	18000004 	blez	zero,1de4 <_mem_avail_start-0x7fffe21c>
    1dd4:	03055401 	0x3055401
    1dd8:	bfc01cac 	cache	0x0,7340(s8)
    1ddc:	02550118 	0x2550118
    1de0:	01180080 	0x1180080
    1de4:	00820256 	0x820256
    1de8:	111c1c00 	beq	t0,gp,8dec <_mem_avail_start-0x7fff7214>
    1dec:	05b1bfc0 	bgezal	t5,ffff1cf0 <_text_end+0x403eff78>
    1df0:	04e60000 	0x4e60000
    1df4:	01180000 	0x1180000
    1df8:	d8030554 	ldc2	$3,1364(zero)
    1dfc:	00bfc01c 	0xbfc01c
    1e00:	c012001c 	ll	s2,28(zero)
    1e04:	0005bcbf 	0x5bcbf
    1e08:	0004fd00 	sll	ra,a0,0x14
    1e0c:	54011800 	bnel	zero,at,7e10 <_mem_avail_start-0x7fff81f0>
    1e10:	1d1c0305 	0x1d1c0305
    1e14:	1c00bfc0 	bgtz	zero,ffff1d18 <_text_end+0x403effa0>
    1e18:	bfc0120c 	cache	0x0,4620(s8)
    1e1c:	000005b1 	tgeu	zero,zero,0x16
    1e20:	00000514 	0x514
    1e24:	05540118 	0x5540118
    1e28:	c01d2003 	ll	sp,8195(zero)
    1e2c:	b81c00bf 	swr	gp,191(zero)
    1e30:	bcbfc012 	cache	0x1f,-16366(a1)
    1e34:	2b000005 	slti	zero,t8,5
    1e38:	18000005 	blez	zero,1e50 <_mem_avail_start-0x7fffe1b0>
    1e3c:	03055401 	0x3055401
    1e40:	bfc01d1c 	cache	0x0,7452(s8)
    1e44:	12c41c00 	beq	s6,a0,8e48 <_mem_avail_start-0x7fff71b8>
    1e48:	05b1bfc0 	bgezal	t5,ffff1d4c <_text_end+0x403effd4>
    1e4c:	05420000 	bltzl	t2,1e50 <_mem_avail_start-0x7fffe1b0>
    1e50:	01180000 	0x1180000
    1e54:	40030554 	0x40030554
    1e58:	00bfc01d 	0xbfc01d
    1e5c:	c0137817 	ll	s3,30743(zero)
    1e60:	0005bcbf 	0x5bcbf
    1e64:	54011800 	bnel	zero,at,7e68 <_mem_avail_start-0x7fff8198>
    1e68:	1d1c0305 	0x1d1c0305
    1e6c:	0000bfc0 	sll	s7,zero,0x1f
    1e70:	0008f207 	0x8f207
    1e74:	17040100 	bne	t8,a0,2278 <_mem_avail_start-0x7fffdd88>
    1e78:	80000008 	lb	zero,8(zero)
    1e7c:	01000000 	0x1000000
    1e80:	00000576 	tne	zero,zero,0x15
    1e84:	0008bc09 	0x8bc09
    1e88:	76040100 	jalx	8100400 <_mem_avail_start-0x77effc00>
    1e8c:	00000005 	0x5
    1e90:	0080041d 	0x80041d
    1e94:	561e0000 	bnel	s0,s8,1e98 <_mem_avail_start-0x7fffe168>
    1e98:	17000005 	bnez	t8,1eb0 <_mem_avail_start-0x7fffe150>
    1e9c:	00000008 	jr	zero
    1ea0:	28000000 	slti	zero,zero,0
    1ea4:	01000000 	0x1000000
    1ea8:	00059b9c 	0x59b9c
    1eac:	056a1f00 	tlti	t3,7936
    1eb0:	54010000 	bnel	zero,at,1eb4 <_mem_avail_start-0x7fffe14c>
    1eb4:	01f72000 	0x1f72000
    1eb8:	01f70000 	0x1f70000
    1ebc:	4c030000 	mfc3	v1,$0
    1ec0:	00038c20 	0x38c20
    1ec4:	00038c00 	sll	s1,v1,0x10
    1ec8:	200c0400 	addi	t4,zero,1024
    1ecc:	00000474 	teq	zero,zero,0x11
    1ed0:	00000474 	teq	zero,zero,0x11
    1ed4:	2e200b04 	sltiu	zero,s1,2820
    1ed8:	2e000002 	sltiu	zero,s0,2
    1edc:	04000002 	bltz	zero,1ee8 <_mem_avail_start-0x7fffe118>
    1ee0:	0b3b000a 	j	cec0028 <_mem_avail_start-0x7313ffd8>
    1ee4:	00040000 	sll	zero,a0,0x0
    1ee8:	00000a38 	0xa38
    1eec:	02ad0104 	0x2ad0104
    1ef0:	0e040000 	jal	8100000 <_mem_avail_start-0x77f00000>
    1ef4:	5100000a 	beqzl	t0,1f20 <_mem_avail_start-0x7fffe0e0>
    1ef8:	38000007 	xori	zero,zero,0x7
    1efc:	00000004 	sllv	zero,zero,zero
    1f00:	6b000000 	0x6b000000
    1f04:	02000008 	jr	s0
    1f08:	07040304 	0x7040304
    1f0c:	000003f8 	0x3f8
    1f10:	00002704 	0x2704
    1f14:	07040300 	0x7040300
    1f18:	000003f3 	tltu	zero,zero,0xf
    1f1c:	00003304 	0x3304
    1f20:	020d0500 	0x20d0500
    1f24:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
    1f28:	00000027 	nor	zero,zero,zero
    1f2c:	eb060103 	swc2	$6,259(t8)
    1f30:	03000001 	movf	zero,t8,$fcc0
    1f34:	00aa0502 	0xaa0502
    1f38:	04060000 	0x4060000
    1f3c:	746e6905 	jalx	1b9a414 <_mem_avail_start-0x7e465bec>
    1f40:	05040300 	0x5040300
    1f44:	000001b2 	tlt	zero,zero,0x6
    1f48:	00011905 	0x11905
    1f4c:	71090300 	0x71090300
    1f50:	03000000 	0x3000000
    1f54:	01e90801 	movt	at,t7,$fcc2
    1f58:	71040000 	madd	t0,a0
    1f5c:	05000000 	bltz	t0,1f60 <_mem_avail_start-0x7fffe0a0>
    1f60:	00000216 	0x216
    1f64:	00880a03 	0x880a03
    1f68:	02030000 	0x2030000
    1f6c:	0003a407 	0x3a407
    1f70:	00880400 	0x880400
    1f74:	43050000 	c0	0x1050000
    1f78:	03000009 	jalr	zero,t8
    1f7c:	0000330c 	syscall	0xcc
    1f80:	01560500 	0x1560500
    1f84:	0b040000 	j	c100000 <_mem_avail_start-0x73f00000>
    1f88:	00000066 	0x66
    1f8c:	000a8205 	0xa8205
    1f90:	7d0c0400 	0x7d0c0400
    1f94:	05000000 	bltz	t0,1f98 <_mem_avail_start-0x7fffe068>
    1f98:	000009ca 	0x9ca
    1f9c:	003f0d04 	0x3f0d04
    1fa0:	c9050000 	lwc2	$5,0(t0)
    1fa4:	04000009 	bltz	zero,1fcc <_mem_avail_start-0x7fffe034>
    1fa8:	0000940e 	0x940e
    1fac:	098c0700 	j	6301c00 <_mem_avail_start-0x79cfe400>
    1fb0:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    1fb4:	0000096c 	0x96c
    1fb8:	00010401 	0x10401
    1fbc:	00540800 	0x540800
    1fc0:	00000033 	tltu	zero,zero
    1fc4:	0004a409 	0x4a409
    1fc8:	250a0100 	addiu	t2,t0,256
    1fcc:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    1fd0:	00000924 	0x924
    1fd4:	00330a01 	0x330a01
    1fd8:	700a0000 	madd	zero,t2
    1fdc:	01007274 	teq	t0,zero,0x1c9
    1fe0:	0001040b 	0x1040b
    1fe4:	040b0000 	tltiu	zero,0
    1fe8:	0000003a 	0x3a
    1fec:	000a9407 	0xa9407
    1ff0:	080a0100 	j	280400 <_mem_avail_start-0x7fd7fc00>
    1ff4:	01000009 	jalr	zero,t0
    1ff8:	00000143 	sra	zero,zero,0x5
    1ffc:	27005408 	addiu	zero,t8,21512
    2000:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    2004:	000004a4 	0x4a4
    2008:	00250a01 	0x250a01
    200c:	24090000 	li	t1,0
    2010:	01000009 	jalr	zero,t0
    2014:	0000270a 	0x270a
    2018:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    201c:	0b010072 	j	c0401c8 <_mem_avail_start-0x73fbfe38>
    2020:	00000143 	sra	zero,zero,0x5
    2024:	2e040b00 	sltiu	a0,s0,2816
    2028:	07000000 	bltz	t8,202c <_mem_avail_start-0x7fffdfd4>
    202c:	000009e0 	0x9e0
    2030:	0a490a01 	j	9242804 <_mem_avail_start-0x76dbd7fc>
    2034:	82010000 	lb	at,0(s0)
    2038:	08000001 	j	4 <_mem_avail_start-0x7ffffffc>
    203c:	00880054 	0x880054
    2040:	a4090000 	sh	t1,0(zero)
    2044:	01000004 	sllv	zero,zero,t0
    2048:	0000250a 	0x250a
    204c:	09240900 	j	4902400 <_mem_avail_start-0x7b6fdc00>
    2050:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    2054:	00000088 	0x88
    2058:	7274700a 	0x7274700a
    205c:	820b0100 	lb	t3,256(s0)
    2060:	00000001 	movf	zero,zero,$fcc0
    2064:	008f040b 	0x8f040b
    2068:	4c070000 	mfc3	a3,$0
    206c:	01000009 	jalr	zero,t0
    2070:	000a250a 	0xa250a
    2074:	01c10100 	0x1c10100
    2078:	54080000 	bnel	zero,t0,207c <_mem_avail_start-0x7fffdf84>
    207c:	00007100 	sll	t6,zero,0x4
    2080:	04a40900 	0x4a40900
    2084:	0a010000 	j	8040000 <_mem_avail_start-0x77fc0000>
    2088:	00000025 	move	zero,zero
    208c:	00092409 	0x92409
    2090:	710a0100 	0x710a0100
    2094:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    2098:	00727470 	tge	v1,s2,0x1d1
    209c:	01c10b01 	0x1c10b01
    20a0:	0b000000 	j	c000000 <_mem_avail_start-0x74000000>
    20a4:	00007804 	sllv	t7,zero,zero
    20a8:	09b10c00 	j	6c43000 <_mem_avail_start-0x793bd000>
    20ac:	04010000 	b	20b0 <_mem_avail_start-0x7fffdf50>
    20b0:	00000934 	teq	zero,zero,0x24
    20b4:	00000033 	tltu	zero,zero
    20b8:	0001f901 	0x1f901
    20bc:	00540800 	0x540800
    20c0:	00000033 	tltu	zero,zero
    20c4:	0004a409 	0x4a409
    20c8:	25040100 	addiu	a0,t0,256
    20cc:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    20d0:	00727470 	tge	v1,s2,0x1d1
    20d4:	01040501 	0x1040501
    20d8:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    20dc:	00000a36 	tne	zero,zero,0x28
    20e0:	0a5a0401 	j	9681004 <_mem_avail_start-0x7697effc>
    20e4:	00270000 	0x270000
    20e8:	2b010000 	slti	at,t8,0
    20ec:	08000002 	j	8 <_mem_avail_start-0x7ffffff8>
    20f0:	00270054 	0x270054
    20f4:	a4090000 	sh	t1,0(zero)
    20f8:	01000004 	sllv	zero,zero,t0
    20fc:	00002504 	0x2504
    2100:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    2104:	05010072 	bgez	t0,22d0 <_mem_avail_start-0x7fffdd30>
    2108:	00000143 	sra	zero,zero,0x5
    210c:	0a690c00 	j	9a43000 <_mem_avail_start-0x765bd000>
    2110:	04010000 	b	2114 <_mem_avail_start-0x7fffdeec>
    2114:	0000097d 	0x97d
    2118:	00000088 	0x88
    211c:	00025d01 	0x25d01
    2120:	00540800 	0x540800
    2124:	00000088 	0x88
    2128:	0004a409 	0x4a409
    212c:	25040100 	addiu	a0,t0,256
    2130:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
    2134:	00727470 	tge	v1,s2,0x1d1
    2138:	01820501 	0x1820501
    213c:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    2140:	000009fa 	0x9fa
    2144:	09d10401 	j	7441004 <_mem_avail_start-0x78bbeffc>
    2148:	00710000 	0x710000
    214c:	8f010000 	lw	at,0(t8)
    2150:	08000002 	j	8 <_mem_avail_start-0x7ffffff8>
    2154:	00710054 	0x710054
    2158:	a4090000 	sh	t1,0(zero)
    215c:	01000004 	sllv	zero,zero,t0
    2160:	00002504 	0x2504
    2164:	74700a00 	jalx	1c02800 <_mem_avail_start-0x7e3fd800>
    2168:	05010072 	bgez	t0,2334 <_mem_avail_start-0x7fffdccc>
    216c:	000001c1 	0x1c1
    2170:	04860d00 	0x4860d00
    2174:	4a010000 	c2	0x10000
    2178:	000000b5 	0xb5
    217c:	bfc01474 	cache	0x0,5236(s8)
    2180:	00000014 	0x14
    2184:	02ef9c01 	0x2ef9c01
    2188:	380e0000 	xori	t6,zero,0x0
    218c:	74000009 	jalx	24 <_mem_avail_start-0x7fffffdc>
    2190:	0cbfc014 	jal	2ff0050 <_mem_avail_start-0x7d00ffb0>
    2194:	01000000 	0x1000000
    2198:	09480f4b 	j	5203d2c <_mem_avail_start-0x7adfc2d4>
    219c:	131f0000 	beq	t8,ra,21a0 <_mem_avail_start-0x7fffde60>
    21a0:	f90e0000 	sdc2	$14,0(t0)
    21a4:	74000001 	jalx	4 <_mem_avail_start-0x7ffffffc>
    21a8:	0cbfc014 	jal	2ff0050 <_mem_avail_start-0x7d00ffb0>
    21ac:	01000000 	0x1000000
    21b0:	02140f1c 	0x2140f1c
    21b4:	131f0000 	beq	t8,ra,21b8 <_mem_avail_start-0x7fffde48>
    21b8:	74100000 	jalx	400000 <_mem_avail_start-0x7fc00000>
    21bc:	0cbfc014 	jal	2ff0050 <_mem_avail_start-0x7d00ffb0>
    21c0:	11000000 	beqz	t0,21c4 <_mem_avail_start-0x7fffde3c>
    21c4:	0000021f 	0x21f
    21c8:	ffc3e0a0 	sdc3	$3,-8032(s8)
    21cc:	0000007b 	0x7b
    21d0:	01f71200 	0x1f71200
    21d4:	46010000 	add.s	$f0,$f0,$f1
    21d8:	bfc01460 	cache	0x0,5216(s8)
    21dc:	00000014 	0x14
    21e0:	036a9c01 	0x36a9c01
    21e4:	24130000 	li	s3,0
    21e8:	01000009 	jalr	zero,t0
    21ec:	0000b546 	0xb546
    21f0:	0e540100 	jal	9500400 <_mem_avail_start-0x76affc00>
    21f4:	0000087e 	0x87e
    21f8:	bfc01460 	cache	0x0,5216(s8)
    21fc:	0000000c 	syscall
    2200:	950f4701 	lhu	t7,18177(t0)
    2204:	37000008 	ori	zero,t8,0x8
    2208:	0f000013 	jal	c00004c <_mem_avail_start-0x73ffffb4>
    220c:	0000088a 	0x88a
    2210:	0000134a 	0x134a
    2214:	00010a0e 	0x10a0e
    2218:	c0146000 	ll	s4,24576(zero)
    221c:	00000cbf 	0xcbf
    2220:	0f1d0100 	jal	c740400 <_mem_avail_start-0x738bfc00>
    2224:	0000012c 	0x12c
    2228:	00001337 	0x1337
    222c:	0001210f 	0x1210f
    2230:	00134a00 	sll	t1,s3,0x8
    2234:	14601000 	bnez	v1,6238 <_mem_avail_start-0x7fff9dc8>
    2238:	000cbfc0 	sll	s7,t4,0x1f
    223c:	37110000 	ori	s1,t8,0x0
    2240:	90000001 	lbu	zero,1(zero)
    2244:	7bffc3e0 	0x7bffc3e0
    2248:	00000000 	nop
    224c:	00059612 	0x59612
    2250:	4c420100 	0x4c420100
    2254:	14bfc014 	bne	a1,ra,ffff22a8 <_text_end+0x403f0530>
    2258:	01000000 	0x1000000
    225c:	0003e59c 	0x3e59c
    2260:	09241300 	j	4904c00 <_mem_avail_start-0x7b6fb400>
    2264:	42010000 	c0	0x10000
    2268:	000000aa 	0xaa
    226c:	a10e5401 	sb	t6,21505(t0)
    2270:	4c000008 	0x4c000008
    2274:	0cbfc014 	jal	2ff0050 <_mem_avail_start-0x7d00ffb0>
    2278:	01000000 	0x1000000
    227c:	08b80f43 	j	2e03d0c <_mem_avail_start-0x7d1fc2f4>
    2280:	13620000 	beq	k1,v0,2284 <_mem_avail_start-0x7fffdd7c>
    2284:	ad0f0000 	sw	t7,0(t0)
    2288:	75000008 	jalx	4000020 <_mem_avail_start-0x7bffffe0>
    228c:	0e000013 	jal	800004c <_mem_avail_start-0x77ffffb4>
    2290:	00000149 	0x149
    2294:	bfc0144c 	cache	0x0,5196(s8)
    2298:	0000000c 	syscall
    229c:	6b0f1d01 	0x6b0f1d01
    22a0:	62000001 	0x62000001
    22a4:	0f000013 	jal	c00004c <_mem_avail_start-0x73ffffb4>
    22a8:	00000160 	0x160
    22ac:	00001375 	0x1375
    22b0:	c0144c10 	ll	s4,19472(zero)
    22b4:	00000cbf 	0xcbf
    22b8:	01761100 	0x1761100
    22bc:	e0800000 	sc	zero,0(a0)
    22c0:	007bffc3 	0x7bffc3
    22c4:	0d000000 	jal	4000000 <_mem_avail_start-0x7c000000>
    22c8:	00000099 	0x99
    22cc:	00b53901 	0xb53901
    22d0:	14040000 	bne	zero,a0,22d4 <_mem_avail_start-0x7fffdd2c>
    22d4:	0048bfc0 	0x48bfc0
    22d8:	9c010000 	0x9c010000
    22dc:	00000432 	tlt	zero,zero,0x10
    22e0:	0000fa14 	0xfa14
    22e4:	b53a0100 	0xb53a0100
    22e8:	8d000000 	lw	zero,0(t0)
    22ec:	15000013 	bnez	t0,233c <_mem_avail_start-0x7fffdcc4>
    22f0:	bfc01414 	cache	0x0,5140(s8)
    22f4:	000004ef 	0x4ef
    22f8:	c0141c15 	ll	s4,7189(zero)
    22fc:	0004efbf 	0x4efbf
    2300:	14241500 	bne	at,a0,7704 <_mem_avail_start-0x7fff88fc>
    2304:	04efbfc0 	0x4efbfc0
    2308:	38150000 	xori	s5,zero,0x0
    230c:	efbfc014 	swc3	$31,-16364(sp)
    2310:	00000004 	sllv	zero,zero,zero
    2314:	00043012 	0x43012
    2318:	e4340100 	swc1	$f20,256(at)
    231c:	20bfc013 	addi	ra,a1,-16365
    2320:	01000000 	0x1000000
    2324:	0004ef9c 	0x4ef9c
    2328:	09241300 	j	4904c00 <_mem_avail_start-0x7b6fb400>
    232c:	34010000 	li	at,0x0
    2330:	0000009f 	0x9f
    2334:	a1165401 	sb	s6,21505(t0)
    2338:	e4000009 	swc1	$f0,9(zero)
    233c:	08bfc013 	j	2ff004c <_mem_avail_start-0x7d00ffb4>
    2340:	01000000 	0x1000000
    2344:	00049635 	0x49635
    2348:	09b11700 	j	6c45c00 <_mem_avail_start-0x793ba400>
    234c:	5d0e0000 	0x5d0e0000
    2350:	e4000002 	swc1	$f0,2(zero)
    2354:	08bfc013 	j	2ff004c <_mem_avail_start-0x7d00ffb4>
    2358:	01000000 	0x1000000
    235c:	0278171c 	0x278171c
    2360:	e4100000 	swc1	$f16,0(zero)
    2364:	08bfc013 	j	2ff004c <_mem_avail_start-0x7d00ffb4>
    2368:	11000000 	beqz	t0,236c <_mem_avail_start-0x7fffdc94>
    236c:	00000283 	sra	zero,zero,0xa
    2370:	fec0e094 	sdc3	$0,-8044(s6)
    2374:	0000007b 	0x7b
    2378:	0008c40e 	0x8c40e
    237c:	c013f800 	ll	s3,-2048(zero)
    2380:	000004bf 	0x4bf
    2384:	0f360100 	jal	cd80400 <_mem_avail_start-0x7327fc00>
    2388:	000008db 	0x8db
    238c:	000013e9 	0x13e9
    2390:	0008d00f 	0x8d00f
    2394:	0013fc00 	sll	ra,s3,0x10
    2398:	01880e00 	0x1880e00
    239c:	13f80000 	beq	ra,t8,23a0 <_mem_avail_start-0x7fffdc60>
    23a0:	0004bfc0 	sll	s7,a0,0x1f
    23a4:	1d010000 	0x1d010000
    23a8:	0001aa0f 	0x1aa0f
    23ac:	0013e900 	sll	sp,s3,0x4
    23b0:	019f0f00 	0x19f0f00
    23b4:	13fc0000 	beq	ra,gp,23b8 <_mem_avail_start-0x7fffdc48>
    23b8:	f8100000 	sdc2	$16,0(zero)
    23bc:	04bfc013 	0x4bfc013
    23c0:	11000000 	beqz	t0,23c4 <_mem_avail_start-0x7fffdc3c>
    23c4:	000001b5 	0x1b5
    23c8:	fec0e080 	sdc3	$0,-8064(s6)
    23cc:	0000007b 	0x7b
    23d0:	01d60d00 	0x1d60d00
    23d4:	2f010000 	sltiu	at,t8,0
    23d8:	0000009f 	0x9f
    23dc:	bfc013c4 	cache	0x0,5060(s8)
    23e0:	00000020 	add	zero,zero,zero
    23e4:	05899c01 	tgeiu	t4,-25599
    23e8:	a1160000 	sb	s6,0(t0)
    23ec:	c4000009 	lwc1	$f0,9(zero)
    23f0:	08bfc013 	j	2ff004c <_mem_avail_start-0x7d00ffb4>
    23f4:	01000000 	0x1000000
    23f8:	00054a30 	tge	zero,a1,0x128
    23fc:	09b11700 	j	6c45c00 <_mem_avail_start-0x793ba400>
    2400:	5d0e0000 	0x5d0e0000
    2404:	c4000002 	lwc1	$f0,2(zero)
    2408:	08bfc013 	j	2ff004c <_mem_avail_start-0x7d00ffb4>
    240c:	01000000 	0x1000000
    2410:	0278171c 	0x278171c
    2414:	c4100000 	lwc1	$f16,0(zero)
    2418:	08bfc013 	j	2ff004c <_mem_avail_start-0x7d00ffb4>
    241c:	11000000 	beqz	t0,2420 <_mem_avail_start-0x7fffdbe0>
    2420:	00000283 	sra	zero,zero,0xa
    2424:	fec0e094 	sdc3	$0,-8044(s6)
    2428:	0000007b 	0x7b
    242c:	0009a10e 	0x9a10e
    2430:	c013d800 	ll	s3,-10240(zero)
    2434:	000004bf 	0x4bf
    2438:	17310100 	bne	t9,s1,283c <_mem_avail_start-0x7fffd7c4>
    243c:	000009b1 	tgeu	zero,zero,0x26
    2440:	00025d0e 	0x25d0e
    2444:	c013d800 	ll	s3,-10240(zero)
    2448:	000004bf 	0x4bf
    244c:	171c0100 	bne	t8,gp,2850 <_mem_avail_start-0x7fffd7b0>
    2450:	00000278 	0x278
    2454:	c013d810 	ll	s3,-10224(zero)
    2458:	000004bf 	0x4bf
    245c:	02831100 	0x2831100
    2460:	e0800000 	sc	zero,0(a0)
    2464:	007bfec0 	0x7bfec0
    2468:	12000000 	beqz	s0,246c <_mem_avail_start-0x7fffdb94>
    246c:	000005a9 	0x5a9
    2470:	138c1f01 	beq	gp,t4,a078 <_mem_avail_start-0x7fff5f88>
    2474:	0038bfc0 	0x38bfc0
    2478:	9c010000 	0x9c010000
    247c:	0000081b 	0x81b
    2480:	0008c416 	0x8c416
    2484:	c0138c00 	ll	s3,-29696(zero)
    2488:	00000cbf 	0xcbf
    248c:	fa210100 	sdc2	$1,256(s1)
    2490:	0f000005 	jal	c000014 <_mem_avail_start-0x73ffffec>
    2494:	000008db 	0x8db
    2498:	00001414 	0x1414
    249c:	0008d00f 	0x8d00f
    24a0:	00142900 	sll	a1,s4,0x4
    24a4:	01880e00 	0x1880e00
    24a8:	138c0000 	beq	gp,t4,24ac <_mem_avail_start-0x7fffdb54>
    24ac:	000cbfc0 	sll	s7,t4,0x1f
    24b0:	1d010000 	0x1d010000
    24b4:	0001aa0f 	0x1aa0f
    24b8:	00141400 	sll	v0,s4,0x10
    24bc:	019f0f00 	0x19f0f00
    24c0:	14290000 	bne	at,t1,24c4 <_mem_avail_start-0x7fffdb3c>
    24c4:	8c100000 	lw	s0,0(zero)
    24c8:	0cbfc013 	jal	2ff004c <_mem_avail_start-0x7d00ffb4>
    24cc:	11000000 	beqz	t0,24d0 <_mem_avail_start-0x7fffdb30>
    24d0:	000001b5 	0x1b5
    24d4:	fec0e088 	sdc3	$0,-8056(s6)
    24d8:	0000007b 	0x7b
    24dc:	0008c416 	0x8c416
    24e0:	c0139800 	ll	s3,-26624(zero)
    24e4:	000008bf 	0x8bf
    24e8:	56230100 	bnel	s1,v1,28ec <_mem_avail_start-0x7fffd714>
    24ec:	0f000006 	jal	c000018 <_mem_avail_start-0x73ffffe8>
    24f0:	000008db 	0x8db
    24f4:	00001441 	0x1441
    24f8:	0008d00f 	0x8d00f
    24fc:	00145600 	sll	t2,s4,0x18
    2500:	01880e00 	0x1880e00
    2504:	13980000 	beq	gp,t8,2508 <_mem_avail_start-0x7fffdaf8>
    2508:	0008bfc0 	sll	s7,t0,0x1f
    250c:	1d010000 	0x1d010000
    2510:	0001aa0f 	0x1aa0f
    2514:	00144100 	sll	t0,s4,0x4
    2518:	019f0f00 	0x19f0f00
    251c:	14560000 	bne	v0,s6,2520 <_mem_avail_start-0x7fffdae0>
    2520:	98100000 	lwr	s0,0(zero)
    2524:	08bfc013 	j	2ff004c <_mem_avail_start-0x7d00ffb4>
    2528:	11000000 	beqz	t0,252c <_mem_avail_start-0x7fffdad4>
    252c:	000001b5 	0x1b5
    2530:	fec0e08c 	sdc3	$0,-8052(s6)
    2534:	0000007b 	0x7b
    2538:	0008c416 	0x8c416
    253c:	c013a000 	ll	s3,-24576(zero)
    2540:	000008bf 	0x8bf
    2544:	b2250100 	0xb2250100
    2548:	0f000006 	jal	c000018 <_mem_avail_start-0x73ffffe8>
    254c:	000008db 	0x8db
    2550:	0000146e 	0x146e
    2554:	0008d00f 	0x8d00f
    2558:	00148300 	sll	s0,s4,0xc
    255c:	01880e00 	0x1880e00
    2560:	13a00000 	beqz	sp,2564 <_mem_avail_start-0x7fffda9c>
    2564:	0008bfc0 	sll	s7,t0,0x1f
    2568:	1d010000 	0x1d010000
    256c:	0001aa0f 	0x1aa0f
    2570:	00146e00 	sll	t5,s4,0x18
    2574:	019f0f00 	0x19f0f00
    2578:	14830000 	bne	a0,v1,257c <_mem_avail_start-0x7fffda84>
    257c:	a0100000 	sb	s0,0(zero)
    2580:	08bfc013 	j	2ff004c <_mem_avail_start-0x7d00ffb4>
    2584:	11000000 	beqz	t0,2588 <_mem_avail_start-0x7fffda78>
    2588:	000001b5 	0x1b5
    258c:	fec0e080 	sdc3	$0,-8064(s6)
    2590:	0000007b 	0x7b
    2594:	0008c418 	0x8c418
    2598:	c013a800 	ll	s3,-22528(zero)
    259c:	000420bf 	0x420bf
    25a0:	0a280100 	j	8a00400 <_mem_avail_start-0x775ffc00>
    25a4:	0f000007 	jal	c00001c <_mem_avail_start-0x73ffffe4>
    25a8:	000008db 	0x8db
    25ac:	0000149b 	0x149b
    25b0:	0008d00f 	0x8d00f
    25b4:	0014af00 	sll	s5,s4,0x1c
    25b8:	01881900 	0x1881900
    25bc:	13a80000 	beq	sp,t0,25c0 <_mem_avail_start-0x7fffda40>
    25c0:	0420bfc0 	bltz	at,ffff24c4 <_text_end+0x403f074c>
    25c4:	1d010000 	0x1d010000
    25c8:	0001aa0f 	0x1aa0f
    25cc:	00149b00 	sll	s3,s4,0xc
    25d0:	019f0f00 	0x19f0f00
    25d4:	14af0000 	bne	a1,t7,25d8 <_mem_avail_start-0x7fffda28>
    25d8:	201a0000 	addi	k0,zero,0
    25dc:	11000004 	beqz	t0,25f0 <_mem_avail_start-0x7fffda10>
    25e0:	000001b5 	0x1b5
    25e4:	fec0e08c 	sdc3	$0,-8052(s6)
    25e8:	0000007b 	0x7b
    25ec:	0008c416 	0x8c416
    25f0:	c013ac00 	ll	s3,-21504(zero)
    25f4:	000004bf 	0x4bf
    25f8:	66260100 	0x66260100
    25fc:	0f000007 	jal	c00001c <_mem_avail_start-0x73ffffe4>
    2600:	000008db 	0x8db
    2604:	000014c7 	0x14c7
    2608:	0008d00f 	0x8d00f
    260c:	0014db00 	sll	k1,s4,0xc
    2610:	01880e00 	0x1880e00
    2614:	13ac0000 	beq	sp,t4,2618 <_mem_avail_start-0x7fffd9e8>
    2618:	0004bfc0 	sll	s7,a0,0x1f
    261c:	1d010000 	0x1d010000
    2620:	0001aa0f 	0x1aa0f
    2624:	0014c700 	sll	t8,s4,0x1c
    2628:	019f0f00 	0x19f0f00
    262c:	14db0000 	bne	a2,k1,2630 <_mem_avail_start-0x7fffd9d0>
    2630:	ac100000 	sw	s0,0(zero)
    2634:	04bfc013 	0x4bfc013
    2638:	11000000 	beqz	t0,263c <_mem_avail_start-0x7fffd9c4>
    263c:	000001b5 	0x1b5
    2640:	fec0e084 	sdc3	$0,-8060(s6)
    2644:	0000007b 	0x7b
    2648:	0008c416 	0x8c416
    264c:	c013b400 	ll	s3,-19456(zero)
    2650:	000004bf 	0x4bf
    2654:	c22a0100 	ll	t2,256(s1)
    2658:	0f000007 	jal	c00001c <_mem_avail_start-0x73ffffe4>
    265c:	000008db 	0x8db
    2660:	000014f3 	tltu	zero,zero,0x53
    2664:	0008d00f 	0x8d00f
    2668:	00150700 	sll	zero,s5,0x1c
    266c:	01880e00 	0x1880e00
    2670:	13b40000 	beq	sp,s4,2674 <_mem_avail_start-0x7fffd98c>
    2674:	0004bfc0 	sll	s7,a0,0x1f
    2678:	1d010000 	0x1d010000
    267c:	0001aa0f 	0x1aa0f
    2680:	0014f300 	sll	s8,s4,0xc
    2684:	019f0f00 	0x19f0f00
    2688:	15070000 	bne	t0,a3,268c <_mem_avail_start-0x7fffd974>
    268c:	b4100000 	0xb4100000
    2690:	04bfc013 	0x4bfc013
    2694:	11000000 	beqz	t0,2698 <_mem_avail_start-0x7fffd968>
    2698:	000001b5 	0x1b5
    269c:	fec0e090 	sdc3	$0,-8048(s6)
    26a0:	0000007b 	0x7b
    26a4:	0008c40e 	0x8c40e
    26a8:	c013b800 	ll	s3,-18432(zero)
    26ac:	000004bf 	0x4bf
    26b0:	0f2c0100 	jal	cb00400 <_mem_avail_start-0x734ffc00>
    26b4:	000008db 	0x8db
    26b8:	0000151f 	0x151f
    26bc:	0008d00f 	0x8d00f
    26c0:	00153300 	sll	a2,s5,0xc
    26c4:	01880e00 	0x1880e00
    26c8:	13b80000 	beq	sp,t8,26cc <_mem_avail_start-0x7fffd934>
    26cc:	0004bfc0 	sll	s7,a0,0x1f
    26d0:	1d010000 	0x1d010000
    26d4:	0001aa0f 	0x1aa0f
    26d8:	00151f00 	sll	v1,s5,0x1c
    26dc:	019f0f00 	0x19f0f00
    26e0:	15330000 	bne	t1,s3,26e4 <_mem_avail_start-0x7fffd91c>
    26e4:	b8100000 	swr	s0,0(zero)
    26e8:	04bfc013 	0x4bfc013
    26ec:	11000000 	beqz	t0,26f0 <_mem_avail_start-0x7fffd910>
    26f0:	000001b5 	0x1b5
    26f4:	fec0e084 	sdc3	$0,-8060(s6)
    26f8:	0000007b 	0x7b
    26fc:	09a51200 	j	6944800 <_mem_avail_start-0x796bb800>
    2700:	1d010000 	0x1d010000
    2704:	00000000 	nop
    2708:	0000000c 	syscall
    270c:	087e9c01 	j	1fa7004 <_mem_avail_start-0x7e058ffc>
    2710:	a4130000 	sh	s3,0(zero)
    2714:	01000004 	sllv	zero,zero,t0
    2718:	0000251d 	0x251d
    271c:	13540100 	beq	k0,s4,2b20 <_mem_avail_start-0x7fffd4e0>
    2720:	00000924 	0x924
    2724:	00c01d01 	0xc01d01
    2728:	55010000 	bnel	t0,at,272c <_mem_avail_start-0x7fffd8d4>
    272c:	0000cb0e 	0xcb0e
    2730:	00000000 	nop
    2734:	00000400 	sll	zero,zero,0x10
    2738:	0f1d0100 	jal	c740400 <_mem_avail_start-0x738bfc00>
    273c:	000000ed 	0xed
    2740:	0000154b 	0x154b
    2744:	0000e20f 	0xe20f
    2748:	00155e00 	sll	t3,s5,0x18
    274c:	00001000 	sll	v0,zero,0x0
    2750:	00040000 	sll	zero,a0,0x0
    2754:	f81b0000 	sdc2	$27,0(zero)
    2758:	01000000 	0x1000000
    275c:	00000054 	0x54
    2760:	0009191c 	0x9191c
    2764:	011d0100 	0x11d0100
    2768:	000008a1 	0x8a1
    276c:	0004a409 	0x4a409
    2770:	251d0100 	addiu	sp,t0,256
    2774:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
    2778:	00000924 	0x924
    277c:	00b51d01 	0xb51d01
    2780:	1c000000 	bgtz	zero,2784 <_mem_avail_start-0x7fffd87c>
    2784:	000008fc 	0x8fc
    2788:	c4011d01 	lwc1	$f1,7425(zero)
    278c:	09000008 	j	4000020 <_mem_avail_start-0x7bffffe0>
    2790:	000004a4 	0x4a4
    2794:	00251d01 	0x251d01
    2798:	24090000 	li	t1,0
    279c:	01000009 	jalr	zero,t0
    27a0:	0000aa1d 	0xaa1d
    27a4:	291c0000 	slti	gp,t0,0
    27a8:	01000009 	jalr	zero,t0
    27ac:	08e7011d 	j	39c0474 <_mem_avail_start-0x7c63fb8c>
    27b0:	a4090000 	sh	t1,0(zero)
    27b4:	01000004 	sllv	zero,zero,t0
    27b8:	0000251d 	0x251d
    27bc:	09240900 	j	4902400 <_mem_avail_start-0x7b6fdc00>
    27c0:	1d010000 	0x1d010000
    27c4:	0000009f 	0x9f
    27c8:	0a1a0d00 	j	8683400 <_mem_avail_start-0x7797cc00>
    27cc:	1c010000 	0x1c010000
    27d0:	000000c0 	ehb
    27d4:	00000000 	nop
    27d8:	0000000c 	syscall
    27dc:	09389c01 	j	4e27004 <_mem_avail_start-0x7b1d8ffc>
    27e0:	a4130000 	sh	s3,0(zero)
    27e4:	01000004 	sllv	zero,zero,t0
    27e8:	0000251c 	0x251c
    27ec:	0e540100 	jal	9500400 <_mem_avail_start-0x76affc00>
    27f0:	000001c7 	0x1c7
    27f4:	00000000 	nop
    27f8:	00000004 	sllv	zero,zero,zero
    27fc:	e20f1c01 	sc	t7,7169(s0)
    2800:	71000001 	maddu	t0,zero
    2804:	10000015 	b	285c <_mem_avail_start-0x7fffd7a4>
    2808:	00000000 	nop
    280c:	00000004 	sllv	zero,zero,zero
    2810:	0001ed1b 	0x1ed1b
    2814:	00540100 	0x540100
    2818:	f51d0000 	sdc1	$f29,0(t0)
    281c:	01000000 	0x1000000
    2820:	0000b51c 	0xb51c
    2824:	09540100 	j	5500400 <_mem_avail_start-0x7aaffc00>
    2828:	a4090000 	sh	t1,0(zero)
    282c:	01000004 	sllv	zero,zero,t0
    2830:	0000251c 	0x251c
    2834:	610d0000 	0x610d0000
    2838:	01000009 	jalr	zero,t0
    283c:	0000aa1c 	0xaa1c
    2840:	00000000 	nop
    2844:	00000c00 	sll	at,zero,0x10
    2848:	a19c0100 	sb	gp,256(t4)
    284c:	13000009 	beqz	t8,2874 <_mem_avail_start-0x7fffd78c>
    2850:	000004a4 	0x4a4
    2854:	00251c01 	0x251c01
    2858:	54010000 	bnel	zero,at,285c <_mem_avail_start-0x7fffd7a4>
    285c:	00022b0e 	0x22b0e
    2860:	00000000 	nop
    2864:	00000400 	sll	zero,zero,0x10
    2868:	171c0100 	bne	t8,gp,2c6c <_mem_avail_start-0x7fffd394>
    286c:	00000246 	0x246
    2870:	00000010 	mfhi	zero
    2874:	00000400 	sll	zero,zero,0x10
    2878:	02511b00 	0x2511b00
    287c:	54010000 	bnel	zero,at,2880 <_mem_avail_start-0x7fffd780>
    2880:	1d000000 	bgtz	t0,2884 <_mem_avail_start-0x7fffd77c>
    2884:	00000a8a 	0xa8a
    2888:	009f1c01 	0x9f1c01
    288c:	bd010000 	cache	0x1,0(t0)
    2890:	09000009 	j	4000024 <_mem_avail_start-0x7bffffdc>
    2894:	000004a4 	0x4a4
    2898:	00251c01 	0x251c01
    289c:	1e000000 	bgtz	s0,28a0 <_mem_avail_start-0x7fffd760>
    28a0:	000009a1 	0x9a1
    28a4:	00000000 	nop
    28a8:	0000000c 	syscall
    28ac:	09fe9c01 	j	7fa7004 <_mem_avail_start-0x78058ffc>
    28b0:	b11f0000 	0xb11f0000
    28b4:	01000009 	jalr	zero,t0
    28b8:	025d0e54 	0x25d0e54
    28bc:	00000000 	nop
    28c0:	00040000 	sll	zero,a0,0x0
    28c4:	1c010000 	0x1c010000
    28c8:	00027817 	0x27817
    28cc:	00001000 	sll	v0,zero,0x0
    28d0:	00040000 	sll	zero,a0,0x0
    28d4:	831b0000 	lb	k1,0(t8)
    28d8:	01000002 	0x1000002
    28dc:	00000054 	0x54
    28e0:	0009381e 	0x9381e
    28e4:	c0138000 	ll	s3,-32768(zero)
    28e8:	00000cbf 	0xcbf
    28ec:	439c0100 	c0	0x19c0100
    28f0:	1f00000a 	bgtz	t8,291c <_mem_avail_start-0x7fffd6e4>
    28f4:	00000948 	0x948
    28f8:	f90e5401 	sdc2	$14,21505(t0)
    28fc:	80000001 	lb	zero,1(zero)
    2900:	04bfc013 	0x4bfc013
    2904:	01000000 	0x1000000
    2908:	02140f1c 	0x2140f1c
    290c:	15840000 	bne	t4,a0,2910 <_mem_avail_start-0x7fffd6f0>
    2910:	80100000 	lb	s0,0(zero)
    2914:	04bfc013 	0x4bfc013
    2918:	1b000000 	blez	t8,291c <_mem_avail_start-0x7fffd6e4>
    291c:	0000021f 	0x21f
    2920:	00005401 	0x5401
    2924:	08c41e00 	j	3107800 <_mem_avail_start-0x7cef8800>
    2928:	00000000 	nop
    292c:	000c0000 	sll	zero,t4,0x0
    2930:	9c010000 	0x9c010000
    2934:	00000a98 	0xa98
    2938:	0008d01f 	0x8d01f
    293c:	1f540100 	0x1f540100
    2940:	000008db 	0x8db
    2944:	880e5501 	lwl	t6,21761(zero)
    2948:	00000001 	movf	zero,zero,$fcc0
    294c:	04000000 	bltz	zero,2950 <_mem_avail_start-0x7fffd6b0>
    2950:	01000000 	0x1000000
    2954:	01aa0f1d 	0x1aa0f1d
    2958:	15970000 	bne	t4,s7,295c <_mem_avail_start-0x7fffd6a4>
    295c:	9f0f0000 	0x9f0f0000
    2960:	aa000001 	swl	zero,1(s0)
    2964:	10000015 	b	29bc <_mem_avail_start-0x7fffd644>
    2968:	00000000 	nop
    296c:	00000004 	sllv	zero,zero,zero
    2970:	0001b51b 	0x1b51b
    2974:	00540100 	0x540100
    2978:	a11e0000 	sb	s8,0(t0)
    297c:	00000008 	jr	zero
    2980:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    2984:	01000000 	0x1000000
    2988:	000aed9c 	0xaed9c
    298c:	08ad1f00 	j	2b47c00 <_mem_avail_start-0x7d4b8400>
    2990:	54010000 	bnel	zero,at,2994 <_mem_avail_start-0x7fffd66c>
    2994:	0008b81f 	0x8b81f
    2998:	0e550100 	jal	9540400 <_mem_avail_start-0x76abfc00>
    299c:	00000149 	0x149
    29a0:	00000000 	nop
    29a4:	00000004 	sllv	zero,zero,zero
    29a8:	6b0f1d01 	0x6b0f1d01
    29ac:	bd000001 	cache	0x0,1(t0)
    29b0:	0f000015 	jal	c000054 <_mem_avail_start-0x73ffffac>
    29b4:	00000160 	0x160
    29b8:	000015d0 	0x15d0
    29bc:	00000010 	mfhi	zero
    29c0:	00000400 	sll	zero,zero,0x10
    29c4:	01761b00 	0x1761b00
    29c8:	54010000 	bnel	zero,at,29cc <_mem_avail_start-0x7fffd634>
    29cc:	20000000 	addi	zero,zero,0
    29d0:	0000087e 	0x87e
    29d4:	00000000 	nop
    29d8:	0000000c 	syscall
    29dc:	8a1f9c01 	lwl	ra,-25599(s0)
    29e0:	01000008 	jr	t0
    29e4:	08951f54 	j	2547d50 <_mem_avail_start-0x7dab82b0>
    29e8:	55010000 	bnel	t0,at,29ec <_mem_avail_start-0x7fffd614>
    29ec:	00010a0e 	0x10a0e
    29f0:	00000000 	nop
    29f4:	00000400 	sll	zero,zero,0x10
    29f8:	0f1d0100 	jal	c740400 <_mem_avail_start-0x738bfc00>
    29fc:	0000012c 	0x12c
    2a00:	000015e3 	0x15e3
    2a04:	0001210f 	0x1210f
    2a08:	0015f600 	sll	s8,s5,0x18
    2a0c:	00001000 	sll	v0,zero,0x0
    2a10:	00040000 	sll	zero,a0,0x0
    2a14:	371b0000 	ori	k1,t8,0x0
    2a18:	01000001 	movf	zero,t0,$fcc0
    2a1c:	00000054 	0x54
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
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
   c:	10011117 	beq	zero,at,446c <_mem_avail_start-0x7fffbb94>
  10:	02000017 	0x2000017
  14:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
  18:	24030000 	li	v1,0
  1c:	3e0b0b00 	0x3e0b0b00
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:6
}
  20:	000e030b 	0xe030b
  24:	00350400 	0x350400
strchr():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
    if (s < d && s + n > d) {
  28:	00001349 	0x1349
strcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  2c:	03001605 	0x3001605
strncpy():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  30:	3b0b3a0e 	xori	t3,t8,0x3a0e
memcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:330
        s += n, d += n;
  34:	0013490b 	0x13490b
  38:	00240600 	0x240600
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  3c:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
strncmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  40:	00000803 	sra	at,zero,0x0
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  44:	0b011307 	j	c044c1c <_mem_avail_start-0x73fbb3e4>
  48:	3b0b3a0b 	xori	t3,t8,0x3a0b
  4c:	010e6e0b 	0x10e6e0b
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	08000013 	j	4c <_mem_avail_start-0x7fffffb4>
  54:	0e03000d 	jal	80c0034 <_mem_avail_start-0x77f3ffcc>
  58:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
  5c:	0b381349 	j	ce04d24 <_mem_avail_start-0x731fb2dc>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	01090000 	0x1090000
  64:	01134901 	0x1134901
  68:	0a000013 	j	800004c <_mem_avail_start-0x77ffffb4>
  6c:	13490021 	beq	k0,t1,f4 <_mem_avail_start-0x7fffff0c>
  70:	00000b2f 	0xb2f
  74:	4900260b 	bc2f	98a4 <_mem_avail_start-0x7fff675c>
  78:	0c000013 	jal	4c <_mem_avail_start-0x7fffffb4>
  7c:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
  80:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
  84:	0b1c1349 	j	c704d24 <_mem_avail_start-0x738fb2dc>
  88:	340d0000 	li	t5,0x0
  8c:	3a0e0300 	xori	t6,s0,0x300
  90:	490b3b0b 	bc2tl	$cc2,ecc0 <_mem_avail_start-0x7fff1340>
  94:	000d1c13 	0xd1c13
  98:	00340e00 	0x340e00
  9c:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
  a0:	13490b3b 	beq	k0,t1,2d90 <_mem_avail_start-0x7fffd270>
  a4:	193c193f 	0x193c193f
  a8:	2e0f0000 	sltiu	t7,s0,0
  ac:	03193f01 	0x3193f01
  b0:	3b0b3a0e 	xori	t3,t8,0x3a0e
  b4:	1113490b 	beq	t0,s3,124e4 <_mem_avail_start-0x7ffedb1c>
  b8:	40061201 	0x40061201
  bc:	19429718 	0x19429718
  c0:	00001301 	0x1301
  c4:	03003410 	0x3003410
  c8:	3b0b3a0e 	xori	t3,t8,0x3a0e
  cc:	0213490b 	0x213490b
  d0:	11000017 	beqz	t0,130 <_mem_avail_start-0x7ffffed0>
  d4:	0111010b 	0x111010b
  d8:	13010612 	beq	t8,at,1924 <_mem_avail_start-0x7fffe6dc>
  dc:	34120000 	li	s2,0x0
  e0:	3a080300 	xori	t0,s0,0x300
  e4:	490b3b0b 	bc2tl	$cc2,ed14 <_mem_avail_start-0x7fff12ec>
  e8:	00170213 	0x170213
  ec:	82891300 	lb	t1,4864(s4)
  f0:	01110101 	0x1110101
  f4:	13011331 	beq	t8,at,4dbc <_mem_avail_start-0x7fffb244>
  f8:	8a140000 	lwl	s4,0(s0)
  fc:	02000182 	0x2000182
 100:	18429118 	0x18429118
 104:	89150000 	lwl	s5,0(t0)
 108:	11010182 	beq	t0,at,714 <_mem_avail_start-0x7ffff8ec>
 10c:	00133101 	0x133101
 110:	00341600 	0x341600
 114:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 118:	13490b3b 	beq	k0,t1,2e08 <_mem_avail_start-0x7fffd1f8>
 11c:	0b170000 	j	c5c0000 <_mem_avail_start-0x73a40000>
 120:	01175501 	0x1175501
 124:	18000013 	blez	zero,174 <_mem_avail_start-0x7ffffe8c>
 128:	00018289 	0x18289
 12c:	13310111 	beq	t9,s1,574 <_mem_avail_start-0x7ffffa8c>
 130:	0f190000 	jal	c640000 <_mem_avail_start-0x739c0000>
 134:	490b0b00 	bc2tl	$cc2,2d38 <_mem_avail_start-0x7fffd2c8>
 138:	1a000013 	blez	s0,188 <_mem_avail_start-0x7ffffe78>
 13c:	193f012e 	0x193f012e
 140:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 144:	0e6e0b3b 	jal	9b82cec <_mem_avail_start-0x7647d314>
 148:	01111349 	0x1111349
 14c:	18400612 	blez	v0,1998 <_mem_avail_start-0x7fffe668>
 150:	01194297 	0x1194297
 154:	1b000013 	blez	t8,1a4 <_mem_avail_start-0x7ffffe5c>
 158:	0e030005 	jal	80c0014 <_mem_avail_start-0x77f3ffec>
 15c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 160:	17021349 	bne	t8,v0,4e88 <_mem_avail_start-0x7fffb178>
 164:	2e1c0000 	sltiu	gp,s0,0
 168:	03193f01 	0x3193f01
 16c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 170:	110e6e0b 	beq	t0,t6,1b9a0 <_mem_avail_start-0x7ffe4660>
 174:	40061201 	0x40061201
 178:	19429718 	0x19429718
 17c:	00001301 	0x1301
 180:	3f012e1d 	0x3f012e1d
 184:	3a0e0319 	xori	t6,s0,0x319
 188:	6e0b3b0b 	0x6e0b3b0b
 18c:	010b200e 	0x10b200e
 190:	1e000013 	bgtz	s0,1e0 <_mem_avail_start-0x7ffffe20>
 194:	0e030005 	jal	80c0014 <_mem_avail_start-0x77f3ffec>
 198:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 19c:	00001349 	0x1349
 1a0:	31012e1f 	andi	at,t0,0x2e1f
 1a4:	110e6e13 	beq	t0,t6,1b9f4 <_mem_avail_start-0x7ffe460c>
 1a8:	40061201 	0x40061201
 1ac:	19429718 	0x19429718
 1b0:	00001301 	0x1301
 1b4:	31000520 	andi	zero,t0,0x520
 1b8:	00170213 	0x170213
 1bc:	00342100 	0x342100
 1c0:	17021331 	bne	t8,v0,4e88 <_mem_avail_start-0x7fffb178>
 1c4:	0b220000 	j	c880000 <_mem_avail_start-0x73780000>
 1c8:	11133101 	beq	t0,s3,c5d0 <_mem_avail_start-0x7fff3a30>
 1cc:	00061201 	0x61201
 1d0:	010b2300 	0x10b2300
 1d4:	06120111 	bltzall	s0,61c <_mem_avail_start-0x7ffff9e4>
 1d8:	34240000 	ori	a0,at,0x0
 1dc:	00133100 	sll	a2,s3,0x4
 1e0:	002e2500 	0x2e2500
 1e4:	193c193f 	0x193c193f
 1e8:	0e030e6e 	jal	80c39b8 <_mem_avail_start-0x77f3c648>
 1ec:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 1f0:	2e260000 	sltiu	a2,s1,0
 1f4:	3c193f00 	lui	t9,0x3f00
 1f8:	030e6e19 	0x30e6e19
 1fc:	3b0b3a0e 	xori	t3,t8,0x3a0e
 200:	000e6e0b 	0xe6e0b
 204:	11010000 	beq	t0,at,208 <_mem_avail_start-0x7ffffdf8>
 208:	11061000 	beq	t0,a2,420c <_mem_avail_start-0x7fffbdf4>
 20c:	03011201 	0x3011201
 210:	250e1b0e 	addiu	t6,t0,6926
 214:	0005130e 	0x5130e
 218:	11010000 	beq	t0,at,21c <_mem_avail_start-0x7ffffde4>
 21c:	130e2501 	beq	t8,t6,9624 <_mem_avail_start-0x7fff69dc>
 220:	1b0e030b 	0x1b0e030b
 224:	1117550e 	beq	t0,s7,15660 <_mem_avail_start-0x7ffea9a0>
 228:	00171001 	0x171001
 22c:	00240200 	0x240200
 230:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 234:	00000e03 	sra	at,zero,0x18
 238:	03001603 	0x3001603
 23c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 240:	0013490b 	0x13490b
 244:	00260400 	0x260400
 248:	00001349 	0x1349
 24c:	0b002405 	j	c009014 <_mem_avail_start-0x73ff6fec>
 250:	030b3e0b 	0x30b3e0b
 254:	06000008 	bltz	s0,278 <_mem_avail_start-0x7ffffd88>
 258:	13490101 	beq	k0,t1,660 <_mem_avail_start-0x7ffff9a0>
 25c:	00001301 	0x1301
 260:	49002107 	bc2f	8680 <_mem_avail_start-0x7fff7980>
 264:	000b2f13 	0xb2f13
 268:	000f0800 	sll	at,t7,0x0
 26c:	13490b0b 	beq	k0,t1,2e9c <_mem_avail_start-0x7fffd164>
 270:	34090000 	li	t1,0x0
 274:	3a0e0300 	xori	t6,s0,0x300
 278:	490b3b0b 	bc2tl	$cc2,eea8 <_mem_avail_start-0x7fff1158>
 27c:	02193f13 	0x2193f13
 280:	0a000018 	j	8000060 <_mem_avail_start-0x77ffffa0>
 284:	0b0b0113 	j	c2c044c <_mem_avail_start-0x73d3fbb4>
 288:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 28c:	00001301 	0x1301
 290:	03000d0b 	0x3000d0b
 294:	3b0b3a0e 	xori	t3,t8,0x3a0e
 298:	3813490b 	xori	s3,zero,0x490b
 29c:	0c00000b 	jal	2c <_mem_avail_start-0x7fffffd4>
 2a0:	0803000d 	j	c0034 <_mem_avail_start-0x7ff3ffcc>
 2a4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 2a8:	0b381349 	j	ce04d24 <_mem_avail_start-0x731fb2dc>
 2ac:	340d0000 	li	t5,0x0
 2b0:	3a0e0300 	xori	t6,s0,0x300
 2b4:	490b3b0b 	bc2tl	$cc2,eee4 <_mem_avail_start-0x7fff111c>
 2b8:	3c193f13 	lui	t9,0x3f13
 2bc:	0e000019 	jal	8000064 <_mem_avail_start-0x77ffff9c>
 2c0:	193f012e 	0x193f012e
 2c4:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 2c8:	19270b3b 	0x19270b3b
 2cc:	06120111 	bltzall	s0,714 <_mem_avail_start-0x7ffff8ec>
 2d0:	42971840 	c0	0x971840
 2d4:	00130119 	0x130119
 2d8:	00050f00 	sll	at,a1,0x1c
 2dc:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 2e0:	13490b3b 	beq	k0,t1,2fd0 <_mem_avail_start-0x7fffd030>
 2e4:	00001702 	srl	v0,zero,0x1c
 2e8:	03000510 	0x3000510
 2ec:	3b0b3a0e 	xori	t3,t8,0x3a0e
 2f0:	0213490b 	0x213490b
 2f4:	11000017 	beqz	t0,354 <_mem_avail_start-0x7ffffcac>
 2f8:	0111010b 	0x111010b
 2fc:	13010612 	beq	t8,at,1b48 <_mem_avail_start-0x7fffe4b8>
 300:	34120000 	li	s2,0x0
 304:	3a0e0300 	xori	t6,s0,0x300
 308:	490b3b0b 	bc2tl	$cc2,ef38 <_mem_avail_start-0x7fff10c8>
 30c:	00170213 	0x170213
 310:	00341300 	0x341300
 314:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 318:	13490b3b 	beq	k0,t1,3008 <_mem_avail_start-0x7fffcff8>
 31c:	1d140000 	0x1d140000
 320:	11133101 	beq	t0,s3,c728 <_mem_avail_start-0x7fff38d8>
 324:	58061201 	0x58061201
 328:	010b590b 	0x10b590b
 32c:	15000013 	bnez	t0,37c <_mem_avail_start-0x7ffffc84>
 330:	0111010b 	0x111010b
 334:	00000612 	0x612
 338:	31003416 	andi	zero,t0,0x3416
 33c:	17000013 	bnez	t8,38c <_mem_avail_start-0x7ffffc74>
 340:	01018289 	0x1018289
 344:	13310111 	beq	t9,s1,78c <_mem_avail_start-0x7ffff874>
 348:	00001301 	0x1301
 34c:	01828a18 	0x1828a18
 350:	91180200 	lbu	t8,512(t0)
 354:	00001842 	srl	v1,zero,0x1
 358:	01828919 	0x1828919
 35c:	31011101 	andi	at,t0,0x1101
 360:	1a000013 	blez	s0,3b0 <_mem_avail_start-0x7ffffc50>
 364:	00018289 	0x18289
 368:	13310111 	beq	t9,s1,7b0 <_mem_avail_start-0x7ffff850>
 36c:	891b0000 	lwl	k1,0(t0)
 370:	11010182 	beq	t0,at,97c <_mem_avail_start-0x7ffff684>
 374:	19429501 	0x19429501
 378:	00001331 	tgeu	zero,zero,0x4c
 37c:	3f012e1c 	0x3f012e1c
 380:	3a0e0319 	xori	t6,s0,0x319
 384:	110b3b0b 	beq	t0,t3,efb4 <_mem_avail_start-0x7fff104c>
 388:	40061201 	0x40061201
 38c:	19429718 	0x19429718
 390:	00001301 	0x1301
 394:	55010b1d 	bnel	t0,at,300c <_mem_avail_start-0x7fffcff4>
 398:	1e000017 	bgtz	s0,3f8 <_mem_avail_start-0x7ffffc08>
 39c:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 3a0:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 3a4:	17021349 	bne	t8,v0,50cc <_mem_avail_start-0x7fffaf34>
 3a8:	0b1f0000 	j	c7c0000 <_mem_avail_start-0x73840000>
 3ac:	01175501 	0x1175501
 3b0:	20000013 	addi	zero,zero,19
 3b4:	193f012e 	0x193f012e
 3b8:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 3bc:	13490b3b 	beq	k0,t1,30ac <_mem_avail_start-0x7fffcf54>
 3c0:	13010b20 	beq	t8,at,3044 <_mem_avail_start-0x7fffcfbc>
 3c4:	89210000 	lwl	at,0(t1)
 3c8:	11010182 	beq	t0,at,9d4 <_mem_avail_start-0x7ffff62c>
 3cc:	19429501 	0x19429501
 3d0:	13011331 	beq	t8,at,5098 <_mem_avail_start-0x7fffaf68>
 3d4:	2e220000 	sltiu	v0,s1,0
 3d8:	11133101 	beq	t0,s3,c7e0 <_mem_avail_start-0x7fff3820>
 3dc:	40061201 	0x40061201
 3e0:	19429718 	0x19429718
 3e4:	00001301 	0x1301
 3e8:	31003423 	andi	zero,t0,0x3423
 3ec:	00180213 	0x180213
 3f0:	002e2400 	0x2e2400
 3f4:	193c193f 	0x193c193f
 3f8:	0e030e6e 	jal	80c39b8 <_mem_avail_start-0x77f3c648>
 3fc:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 400:	01000000 	0x1000000
 404:	0e250111 	jal	8940444 <_mem_avail_start-0x776bfbbc>
 408:	0e030b13 	jal	80c2c4c <_mem_avail_start-0x77f3d3b4>
 40c:	17550e1b 	bne	k0,s5,3c7c <_mem_avail_start-0x7fffc384>
 410:	17100111 	bne	t8,s0,858 <_mem_avail_start-0x7ffff7a8>
 414:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
 418:	000b0b00 	sll	at,t3,0xc
 41c:	00240300 	0x240300
 420:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 424:	00000e03 	sra	at,zero,0x18
 428:	3f012e04 	0x3f012e04
 42c:	3a0e0319 	xori	t6,s0,0x319
 430:	270b3b0b 	addiu	t3,t8,15115
 434:	11134919 	beq	t0,s3,1289c <_mem_avail_start-0x7ffed764>
 438:	40061201 	0x40061201
 43c:	19429718 	0x19429718
 440:	00001301 	0x1301
 444:	03000505 	0x3000505
 448:	3b0b3a08 	xori	t3,t8,0x3a08
 44c:	0213490b 	0x213490b
 450:	06000017 	bltz	s0,4b0 <_mem_avail_start-0x7ffffb50>
 454:	00000018 	mult	zero,zero
 458:	03003407 	0x3003407
 45c:	3b0b3a08 	xori	t3,t8,0x3a08
 460:	0213490b 	0x213490b
 464:	08000017 	j	5c <_mem_avail_start-0x7fffffa4>
 468:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 46c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 470:	18021349 	0x18021349
 474:	0a090000 	j	8240000 <_mem_avail_start-0x77dc0000>
 478:	3a0e0300 	xori	t6,s0,0x300
 47c:	110b3b0b 	beq	t0,t3,f0ac <_mem_avail_start-0x7fff0f54>
 480:	0a000001 	j	8000004 <_mem_avail_start-0x77fffffc>
 484:	1755010b 	bne	k0,s5,8b4 <_mem_avail_start-0x7ffff74c>
 488:	00001301 	0x1301
 48c:	3f012e0b 	0x3f012e0b
 490:	3a0e0319 	xori	t6,s0,0x319
 494:	490b3b0b 	bc2tl	$cc2,f0c4 <_mem_avail_start-0x7fff0f3c>
 498:	01193c13 	0x1193c13
 49c:	0c000013 	jal	4c <_mem_avail_start-0x7fffffb4>
 4a0:	00018289 	0x18289
 4a4:	13310111 	beq	t9,s1,8ec <_mem_avail_start-0x7ffff714>
 4a8:	890d0000 	lwl	t5,0(t0)
 4ac:	11010182 	beq	t0,at,ab8 <_mem_avail_start-0x7ffff548>
 4b0:	01133101 	0x1133101
 4b4:	0e000013 	jal	800004c <_mem_avail_start-0x77ffffb4>
 4b8:	0001828a 	0x1828a
 4bc:	42911802 	c0	0x911802
 4c0:	0f000018 	jal	c000060 <_mem_avail_start-0x73ffffa0>
 4c4:	01018289 	0x1018289
 4c8:	13310111 	beq	t9,s1,910 <_mem_avail_start-0x7ffff6f0>
 4cc:	0b100000 	j	c400000 <_mem_avail_start-0x73c00000>
 4d0:	00175501 	0x175501
 4d4:	010b1100 	0x10b1100
 4d8:	06120111 	bltzall	s0,920 <_mem_avail_start-0x7ffff6e0>
 4dc:	00001301 	0x1301
 4e0:	0b002412 	j	c009048 <_mem_avail_start-0x73ff6fb8>
 4e4:	030b3e0b 	0x30b3e0b
 4e8:	13000008 	beqz	t8,50c <_mem_avail_start-0x7ffffaf4>
 4ec:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
 4f0:	00001349 	0x1349
 4f4:	49002614 	bc2f	9d48 <_mem_avail_start-0x7fff62b8>
 4f8:	15000013 	bnez	t0,548 <_mem_avail_start-0x7ffffab8>
 4fc:	193f002e 	0x193f002e
 500:	0e6e193c 	jal	9b864f0 <_mem_avail_start-0x76479b10>
 504:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 508:	00000b3b 	0xb3b
 50c:	01110100 	0x1110100
 510:	0b130e25 	j	c4c3894 <_mem_avail_start-0x73b3c76c>
 514:	0e1b0e03 	jal	86c380c <_mem_avail_start-0x7793c7f4>
 518:	01111755 	0x1111755
 51c:	00001710 	0x1710
 520:	0b002402 	j	c009008 <_mem_avail_start-0x73ff6ff8>
 524:	030b3e0b 	0x30b3e0b
 528:	0300000e 	0x300000e
 52c:	193f012e 	0x193f012e
 530:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 534:	19270b3b 	0x19270b3b
 538:	01111349 	0x1111349
 53c:	18400612 	blez	v0,1d88 <_mem_avail_start-0x7fffe278>
 540:	01194297 	0x1194297
 544:	04000013 	bltz	zero,594 <_mem_avail_start-0x7ffffa6c>
 548:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 54c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 550:	17021349 	bne	t8,v0,5278 <_mem_avail_start-0x7fffad88>
 554:	05050000 	0x5050000
 558:	3a0e0300 	xori	t6,s0,0x300
 55c:	490b3b0b 	bc2tl	$cc2,f18c <_mem_avail_start-0x7fff0e74>
 560:	00170213 	0x170213
 564:	00340600 	0x340600
 568:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 56c:	13490b3b 	beq	k0,t1,325c <_mem_avail_start-0x7fffcda4>
 570:	00001702 	srl	v0,zero,0x1c
 574:	03003407 	0x3003407
 578:	3b0b3a08 	xori	t3,t8,0x3a08
 57c:	0213490b 	0x213490b
 580:	08000018 	j	60 <_mem_avail_start-0x7fffffa0>
 584:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 588:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 58c:	17021349 	bne	t8,v0,52b4 <_mem_avail_start-0x7fffad4c>
 590:	0b090000 	j	c240000 <_mem_avail_start-0x73dc0000>
 594:	12011101 	beq	s0,at,499c <_mem_avail_start-0x7fffb664>
 598:	00130106 	0x130106
 59c:	012e0a00 	0x12e0a00
 5a0:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 5a4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 5a8:	193c1349 	0x193c1349
 5ac:	00001301 	0x1301
 5b0:	0000180b 	movn	v1,zero,zero
 5b4:	82890c00 	lb	t1,3072(s4)
 5b8:	01110101 	0x1110101
 5bc:	00001331 	tgeu	zero,zero,0x4c
 5c0:	01828a0d 	break	0x182,0x228
 5c4:	91180200 	lbu	t8,512(t0)
 5c8:	00001842 	srl	v1,zero,0x1
 5cc:	11010b0e 	beq	t0,at,3208 <_mem_avail_start-0x7fffcdf8>
 5d0:	00061201 	0x61201
 5d4:	82890f00 	lb	t1,3840(s4)
 5d8:	01110001 	movt	zero,t0,$fcc4
 5dc:	00001331 	tgeu	zero,zero,0x4c
 5e0:	0b002410 	j	c009040 <_mem_avail_start-0x73ff6fc0>
 5e4:	030b3e0b 	0x30b3e0b
 5e8:	11000008 	beqz	t0,60c <_mem_avail_start-0x7ffff9f4>
 5ec:	13490101 	beq	k0,t1,9f4 <_mem_avail_start-0x7ffff60c>
 5f0:	00001301 	0x1301
 5f4:	49002112 	bc2f	8a40 <_mem_avail_start-0x7fff75c0>
 5f8:	000b2f13 	0xb2f13
 5fc:	002e1300 	0x2e1300
 600:	193c193f 	0x193c193f
 604:	0e030e6e 	jal	80c39b8 <_mem_avail_start-0x77f3c648>
 608:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 60c:	01000000 	0x1000000
 610:	0e250111 	jal	8940444 <_mem_avail_start-0x776bfbbc>
 614:	0e030b13 	jal	80c2c4c <_mem_avail_start-0x77f3d3b4>
 618:	17550e1b 	bne	k0,s5,3e88 <_mem_avail_start-0x7fffc178>
 61c:	17100111 	bne	t8,s0,a64 <_mem_avail_start-0x7ffff59c>
 620:	0f020000 	jal	c080000 <_mem_avail_start-0x73f80000>
 624:	000b0b00 	sll	at,t3,0xc
 628:	00240300 	0x240300
 62c:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 630:	00000e03 	sra	at,zero,0x18
 634:	03001604 	0x3001604
 638:	3b0b3a0e 	xori	t3,t8,0x3a0e
 63c:	0013490b 	0x13490b
 640:	012e0500 	0x12e0500
 644:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 648:	053b0b3a 	0x53b0b3a
 64c:	01111927 	0x1111927
 650:	18400612 	blez	v0,1e9c <_mem_avail_start-0x7fffe164>
 654:	01194297 	0x1194297
 658:	06000013 	bltz	s0,6a8 <_mem_avail_start-0x7ffff958>
 65c:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 660:	053b0b3a 	0x53b0b3a
 664:	18021349 	0x18021349
 668:	05070000 	0x5070000
 66c:	3a080300 	xori	t0,s0,0x300
 670:	49053b0b 	bc2t	$cc1,f2a0 <_mem_avail_start-0x7fff0d60>
 674:	00170213 	0x170213
 678:	82890800 	lb	t1,2048(s4)
 67c:	01110101 	0x1110101
 680:	31194295 	andi	t9,t0,0x4295
 684:	09000013 	j	400004c <_mem_avail_start-0x7bffffb4>
 688:	0001828a 	0x1828a
 68c:	42911802 	c0	0x911802
 690:	0a000018 	j	8000060 <_mem_avail_start-0x77ffffa0>
 694:	193f012e 	0x193f012e
 698:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 69c:	1927053b 	0x1927053b
 6a0:	01111349 	0x1111349
 6a4:	18400612 	blez	v0,1ef0 <_mem_avail_start-0x7fffe110>
 6a8:	01194297 	0x1194297
 6ac:	0b000013 	j	c00004c <_mem_avail_start-0x73ffffb4>
 6b0:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 6b4:	053b0b3a 	0x53b0b3a
 6b8:	18021349 	0x18021349
 6bc:	240c0000 	li	t4,0
 6c0:	3e0b0b00 	0x3e0b0b00
 6c4:	0008030b 	0x8030b
 6c8:	000f0d00 	sll	at,t7,0x14
 6cc:	13490b0b 	beq	k0,t1,32fc <_mem_avail_start-0x7fffcd04>
 6d0:	260e0000 	addiu	t6,s0,0
 6d4:	0f000000 	jal	c000000 <_mem_avail_start-0x74000000>
 6d8:	13490026 	beq	k0,t1,774 <_mem_avail_start-0x7ffff88c>
 6dc:	34100000 	li	s0,0x0
 6e0:	3a080300 	xori	t0,s0,0x300
 6e4:	49053b0b 	bc2t	$cc1,f314 <_mem_avail_start-0x7fff0cec>
 6e8:	00170213 	0x170213
 6ec:	012e1100 	0x12e1100
 6f0:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 6f4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 6f8:	13491927 	beq	k0,t1,6b98 <_mem_avail_start-0x7fff9468>
 6fc:	06120111 	bltzall	s0,b44 <_mem_avail_start-0x7ffff4bc>
 700:	42971840 	c0	0x971840
 704:	00130119 	0x130119
 708:	00051200 	sll	v0,a1,0x8
 70c:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 710:	13490b3b 	beq	k0,t1,3400 <_mem_avail_start-0x7fffcc00>
 714:	00001702 	srl	v0,zero,0x1c
 718:	03000513 	0x3000513
 71c:	3b0b3a08 	xori	t3,t8,0x3a08
 720:	0213490b 	0x213490b
 724:	14000018 	bnez	zero,788 <_mem_avail_start-0x7ffff878>
 728:	08030034 	j	c00d0 <_mem_avail_start-0x7ff3ff30>
 72c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 730:	17021349 	bne	t8,v0,5458 <_mem_avail_start-0x7fffaba8>
 734:	2e150000 	sltiu	s5,s0,0
 738:	03193f01 	0x3193f01
 73c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 740:	4919270b 	bc2t	$cc6,a370 <_mem_avail_start-0x7fff5c90>
 744:	12011113 	beq	s0,at,4b94 <_mem_avail_start-0x7fffb46c>
 748:	97184006 	lhu	t8,16390(t8)
 74c:	00001942 	srl	v1,zero,0x5
 750:	01110100 	0x1110100
 754:	0b130e25 	j	c4c3894 <_mem_avail_start-0x73b3c76c>
 758:	0e1b0e03 	jal	86c380c <_mem_avail_start-0x7793c7f4>
 75c:	01111755 	0x1111755
 760:	00001710 	0x1710
 764:	0b002402 	j	c009008 <_mem_avail_start-0x73ff6ff8>
 768:	030b3e0b 	0x30b3e0b
 76c:	0300000e 	0x300000e
 770:	193f012e 	0x193f012e
 774:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 778:	19270b3b 	0x19270b3b
 77c:	01111349 	0x1111349
 780:	18400612 	blez	v0,1fcc <_mem_avail_start-0x7fffe034>
 784:	01194297 	0x1194297
 788:	04000013 	bltz	zero,7d8 <_mem_avail_start-0x7ffff828>
 78c:	08030005 	j	c0014 <_mem_avail_start-0x7ff3ffec>
 790:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 794:	17021349 	bne	t8,v0,54bc <_mem_avail_start-0x7fffab44>
 798:	2e050000 	sltiu	a1,s0,0
 79c:	03193f01 	0x3193f01
 7a0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 7a4:	3c13490b 	lui	s3,0x490b
 7a8:	00130119 	0x130119
 7ac:	00180600 	sll	zero,t8,0x18
 7b0:	89070000 	lwl	a3,0(t0)
 7b4:	11010182 	beq	t0,at,dc0 <_mem_avail_start-0x7ffff240>
 7b8:	01133101 	0x1133101
 7bc:	08000013 	j	4c <_mem_avail_start-0x7fffffb4>
 7c0:	0001828a 	0x1828a
 7c4:	42911802 	c0	0x911802
 7c8:	09000018 	j	4000060 <_mem_avail_start-0x7bffffa0>
 7cc:	01018289 	0x1018289
 7d0:	13310111 	beq	t9,s1,c18 <_mem_avail_start-0x7ffff3e8>
 7d4:	240a0000 	li	t2,0
 7d8:	3e0b0b00 	0x3e0b0b00
 7dc:	0008030b 	0x8030b
 7e0:	000f0b00 	sll	at,t7,0xc
 7e4:	13490b0b 	beq	k0,t1,3414 <_mem_avail_start-0x7fffcbec>
 7e8:	260c0000 	addiu	t4,s0,0
 7ec:	00134900 	sll	t1,s3,0x4
 7f0:	00340d00 	0x340d00
 7f4:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 7f8:	13490b3b 	beq	k0,t1,34e8 <_mem_avail_start-0x7fffcb18>
 7fc:	00001702 	srl	v0,zero,0x1c
 800:	55010b0e 	bnel	t0,at,343c <_mem_avail_start-0x7fffcbc4>
 804:	0f000017 	jal	c00005c <_mem_avail_start-0x73ffffa4>
 808:	0111010b 	0x111010b
 80c:	13010612 	beq	t8,at,2058 <_mem_avail_start-0x7fffdfa8>
 810:	2e100000 	sltiu	s0,s0,0
 814:	3c193f00 	lui	t9,0x3f00
 818:	030e6e19 	0x30e6e19
 81c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 820:	0000000b 	movn	zero,zero,zero
 824:	25011101 	addiu	at,t0,4353
 828:	030b130e 	0x30b130e
 82c:	550e1b0e 	bnel	t0,t6,7468 <_mem_avail_start-0x7fff8b98>
 830:	10011117 	beq	zero,at,4c90 <_mem_avail_start-0x7fffb370>
 834:	02000017 	0x2000017
 838:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 83c:	0e030b3e 	jal	80c2cf8 <_mem_avail_start-0x77f3d308>
 840:	24030000 	li	v1,0
 844:	3e0b0b00 	0x3e0b0b00
 848:	0008030b 	0x8030b
 84c:	00160400 	sll	zero,s6,0x10
 850:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 854:	13490b3b 	beq	k0,t1,3544 <_mem_avail_start-0x7fffcabc>
 858:	2e050000 	sltiu	a1,s0,0
 85c:	03193f01 	0x3193f01
 860:	3b0b3a0e 	xori	t3,t8,0x3a0e
 864:	4919270b 	bc2t	$cc6,a494 <_mem_avail_start-0x7fff5b6c>
 868:	12011113 	beq	s0,at,4cb8 <_mem_avail_start-0x7fffb348>
 86c:	97184006 	lhu	t8,16390(t8)
 870:	13011942 	beq	t8,at,6d7c <_mem_avail_start-0x7fff9284>
 874:	05060000 	0x5060000
 878:	3a080300 	xori	t0,s0,0x300
 87c:	490b3b0b 	bc2tl	$cc2,f4ac <_mem_avail_start-0x7fff0b54>
 880:	00170213 	0x170213
 884:	82890700 	lb	t1,1792(s4)
 888:	01110101 	0x1110101
 88c:	00001331 	tgeu	zero,zero,0x4c
 890:	01828a08 	0x1828a08
 894:	91180200 	lbu	t8,512(t0)
 898:	00001842 	srl	v1,zero,0x1
 89c:	3f002e09 	0x3f002e09
 8a0:	6e193c19 	0x6e193c19
 8a4:	3a0e030e 	xori	t6,s0,0x30e
 8a8:	000b3b0b 	0xb3b0b
 8ac:	11010000 	beq	t0,at,8b0 <_mem_avail_start-0x7ffff750>
 8b0:	130e2501 	beq	t8,t6,9cb8 <_mem_avail_start-0x7fff6348>
 8b4:	1b0e030b 	0x1b0e030b
 8b8:	1117550e 	beq	t0,s7,15cf4 <_mem_avail_start-0x7ffea30c>
 8bc:	00171001 	0x171001
 8c0:	000f0200 	sll	zero,t7,0x8
 8c4:	00000b0b 	0xb0b
 8c8:	0b002403 	j	c00900c <_mem_avail_start-0x73ff6ff4>
 8cc:	030b3e0b 	0x30b3e0b
 8d0:	0400000e 	bltz	zero,90c <_mem_avail_start-0x7ffff6f4>
 8d4:	13490035 	beq	k0,t1,9ac <_mem_avail_start-0x7ffff654>
 8d8:	16050000 	bne	s0,a1,8dc <_mem_avail_start-0x7ffff724>
 8dc:	3a0e0300 	xori	t6,s0,0x300
 8e0:	490b3b0b 	bc2tl	$cc2,f510 <_mem_avail_start-0x7fff0af0>
 8e4:	06000013 	bltz	s0,934 <_mem_avail_start-0x7ffff6cc>
 8e8:	0b0b0024 	j	c2c0090 <_mem_avail_start-0x73d3ff70>
 8ec:	08030b3e 	j	c2cf8 <_mem_avail_start-0x7ff3d308>
 8f0:	2e070000 	sltiu	a3,s0,0
 8f4:	03193f01 	0x3193f01
 8f8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 8fc:	490e6e0b 	bc2fl	$cc3,1c12c <_mem_avail_start-0x7ffe3ed4>
 900:	010b2013 	0x10b2013
 904:	08000013 	j	4c <_mem_avail_start-0x7fffffb4>
 908:	0e03002f 	jal	80c00bc <_mem_avail_start-0x77f3ff44>
 90c:	00001349 	0x1349
 910:	03000509 	0x3000509
 914:	3b0b3a0e 	xori	t3,t8,0x3a0e
 918:	0013490b 	0x13490b
 91c:	00340a00 	0x340a00
 920:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 924:	13490b3b 	beq	k0,t1,3614 <_mem_avail_start-0x7fffc9ec>
 928:	340b0000 	li	t3,0x0
 92c:	3a080300 	xori	t0,s0,0x300
 930:	490b3b0b 	bc2tl	$cc2,f560 <_mem_avail_start-0x7fff0aa0>
 934:	0c000013 	jal	4c <_mem_avail_start-0x7fffffb4>
 938:	0000010b 	0x10b
 93c:	0b000f0d 	j	c003c34 <_mem_avail_start-0x73ffc3cc>
 940:	0013490b 	0x13490b
 944:	012e0e00 	0x12e0e00
 948:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 94c:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 950:	13490e6e 	beq	k0,t1,430c <_mem_avail_start-0x7fffbcf4>
 954:	06120111 	bltzall	s0,d9c <_mem_avail_start-0x7ffff264>
 958:	42971840 	c0	0x971840
 95c:	00130119 	0x130119
 960:	00050f00 	sll	at,a1,0x1c
 964:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 968:	13490b3b 	beq	k0,t1,3658 <_mem_avail_start-0x7fffc9a8>
 96c:	00001702 	srl	v0,zero,0x1c
 970:	03000510 	0x3000510
 974:	3b0b3a08 	xori	t3,t8,0x3a08
 978:	0213490b 	0x213490b
 97c:	11000017 	beqz	t0,9dc <_mem_avail_start-0x7ffff624>
 980:	1331011d 	beq	t9,s1,df8 <_mem_avail_start-0x7ffff208>
 984:	17550152 	bne	k0,s5,ed0 <_mem_avail_start-0x7ffff130>
 988:	0b590b58 	j	d642d60 <_mem_avail_start-0x729bd2a0>
 98c:	00001301 	0x1301
 990:	31000512 	andi	zero,t0,0x512
 994:	00170213 	0x170213
 998:	010b1300 	0x10b1300
 99c:	00001755 	0x1755
 9a0:	31003414 	andi	zero,t0,0x3414
 9a4:	00170213 	0x170213
 9a8:	010b1500 	0x10b1500
 9ac:	17551331 	bne	k0,s5,5674 <_mem_avail_start-0x7fffa98c>
 9b0:	34160000 	li	s6,0x0
 9b4:	00133100 	sll	a2,s3,0x4
 9b8:	82891700 	lb	t1,5888(s4)
 9bc:	01110101 	0x1110101
 9c0:	00001331 	tgeu	zero,zero,0x4c
 9c4:	01828a18 	0x1828a18
 9c8:	91180200 	lbu	t8,512(t0)
 9cc:	00001842 	srl	v1,zero,0x1
 9d0:	31003419 	andi	zero,t0,0x3419
 9d4:	00180213 	0x180213
 9d8:	010b1a00 	0x10b1a00
 9dc:	17551331 	bne	k0,s5,56a4 <_mem_avail_start-0x7fffa95c>
 9e0:	00001301 	0x1301
 9e4:	31011d1b 	andi	at,t0,0x1d1b
 9e8:	55015213 	bnel	t0,at,15238 <_mem_avail_start-0x7ffeadc8>
 9ec:	590b5817 	0x590b5817
 9f0:	1c00000b 	bgtz	zero,a20 <_mem_avail_start-0x7ffff5e0>
 9f4:	01018289 	0x1018289
 9f8:	13310111 	beq	t9,s1,e40 <_mem_avail_start-0x7ffff1c0>
 9fc:	00001301 	0x1301
 a00:	0b00101d 	j	c004074 <_mem_avail_start-0x73ffbf8c>
 a04:	0013490b 	0x13490b
 a08:	012e1e00 	0x12e1e00
 a0c:	0e6e1331 	jal	9b84cc4 <_mem_avail_start-0x7647b33c>
 a10:	06120111 	bltzall	s0,e58 <_mem_avail_start-0x7ffff1a8>
 a14:	42971840 	c0	0x971840
 a18:	00130119 	0x130119
 a1c:	00051f00 	sll	v1,a1,0x1c
 a20:	18021331 	0x18021331
 a24:	2e200000 	sltiu	zero,s1,0
 a28:	3c193f00 	lui	t9,0x3f00
 a2c:	030e6e19 	0x30e6e19
 a30:	3b0b3a0e 	xori	t3,t8,0x3a0e
 a34:	0000000b 	movn	zero,zero,zero
 a38:	25011101 	addiu	at,t0,4353
 a3c:	030b130e 	0x30b130e
 a40:	550e1b0e 	bnel	t0,t6,767c <_mem_avail_start-0x7fff8984>
 a44:	10011117 	beq	zero,at,4ea4 <_mem_avail_start-0x7fffb15c>
 a48:	02000017 	0x2000017
 a4c:	0b0b000f 	j	c2c003c <_mem_avail_start-0x73d3ffc4>
 a50:	24030000 	li	v1,0
 a54:	3e0b0b00 	0x3e0b0b00
 a58:	000e030b 	0xe030b
 a5c:	00350400 	0x350400
 a60:	00001349 	0x1349
 a64:	03001605 	0x3001605
 a68:	3b0b3a0e 	xori	t3,t8,0x3a0e
 a6c:	0013490b 	0x13490b
 a70:	00240600 	0x240600
 a74:	0b3e0b0b 	j	cf82c2c <_mem_avail_start-0x7307d3d4>
 a78:	00000803 	sra	at,zero,0x0
 a7c:	3f012e07 	0x3f012e07
 a80:	3a0e0319 	xori	t6,s0,0x319
 a84:	6e0b3b0b 	0x6e0b3b0b
 a88:	010b200e 	0x10b200e
 a8c:	08000013 	j	4c <_mem_avail_start-0x7fffffb4>
 a90:	0803002f 	j	c00bc <_mem_avail_start-0x7ff3ff44>
 a94:	00001349 	0x1349
 a98:	03000509 	0x3000509
 a9c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 aa0:	0013490b 	0x13490b
 aa4:	00340a00 	0x340a00
 aa8:	0b3a0803 	j	ce8200c <_mem_avail_start-0x7317dff4>
 aac:	13490b3b 	beq	k0,t1,379c <_mem_avail_start-0x7fffc864>
 ab0:	0f0b0000 	jal	c2c0000 <_mem_avail_start-0x73d40000>
 ab4:	490b0b00 	bc2tl	$cc2,36b8 <_mem_avail_start-0x7fffc948>
 ab8:	0c000013 	jal	4c <_mem_avail_start-0x7fffffb4>
 abc:	193f012e 	0x193f012e
 ac0:	0b3a0e03 	j	ce8380c <_mem_avail_start-0x7317c7f4>
 ac4:	0e6e0b3b 	jal	9b82cec <_mem_avail_start-0x7647d314>
 ac8:	0b201349 	j	c804d24 <_mem_avail_start-0x737fb2dc>
 acc:	00001301 	0x1301
 ad0:	3f012e0d 	0x3f012e0d
 ad4:	3a0e0319 	xori	t6,s0,0x319
 ad8:	490b3b0b 	bc2tl	$cc2,f708 <_mem_avail_start-0x7fff08f8>
 adc:	12011113 	beq	s0,at,4f2c <_mem_avail_start-0x7fffb0d4>
 ae0:	97184006 	lhu	t8,16390(t8)
 ae4:	13011942 	beq	t8,at,6ff0 <_mem_avail_start-0x7fff9010>
 ae8:	1d0e0000 	0x1d0e0000
 aec:	11133101 	beq	t0,s3,cef4 <_mem_avail_start-0x7fff310c>
 af0:	58061201 	0x58061201
 af4:	000b590b 	0xb590b
 af8:	00050f00 	sll	at,a1,0x1c
 afc:	17021331 	bne	t8,v0,57c4 <_mem_avail_start-0x7fffa83c>
 b00:	0b100000 	j	c400000 <_mem_avail_start-0x73c00000>
 b04:	12011101 	beq	s0,at,4f0c <_mem_avail_start-0x7fffb0f4>
 b08:	11000006 	beqz	t0,b24 <_mem_avail_start-0x7ffff4dc>
 b0c:	13310034 	beq	t9,s1,be0 <_mem_avail_start-0x7ffff420>
 b10:	00000d1c 	0xd1c
 b14:	3f012e12 	0x3f012e12
 b18:	3a0e0319 	xori	t6,s0,0x319
 b1c:	110b3b0b 	beq	t0,t3,f74c <_mem_avail_start-0x7fff08b4>
 b20:	40061201 	0x40061201
 b24:	19429718 	0x19429718
 b28:	00001301 	0x1301
 b2c:	03000513 	0x3000513
 b30:	3b0b3a0e 	xori	t3,t8,0x3a0e
 b34:	0213490b 	0x213490b
 b38:	14000018 	bnez	zero,b9c <_mem_avail_start-0x7ffff464>
 b3c:	0e030034 	jal	80c00d0 <_mem_avail_start-0x77f3ff30>
 b40:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 b44:	17021349 	bne	t8,v0,586c <_mem_avail_start-0x7fffa794>
 b48:	89150000 	lwl	s5,0(t0)
 b4c:	11000182 	beqz	t0,1158 <_mem_avail_start-0x7fffeea8>
 b50:	00133101 	0x133101
 b54:	011d1600 	0x11d1600
 b58:	01111331 	tgeu	t0,s1,0x4c
 b5c:	0b580612 	j	d601848 <_mem_avail_start-0x729fe7b8>
 b60:	13010b59 	beq	t8,at,38c8 <_mem_avail_start-0x7fffc738>
 b64:	05170000 	0x5170000
 b68:	00133100 	sll	a2,s3,0x4
 b6c:	011d1800 	0x11d1800
 b70:	01521331 	tgeu	t2,s2,0x4c
 b74:	0b581755 	j	d605d54 <_mem_avail_start-0x729fa2ac>
 b78:	13010b59 	beq	t8,at,38e0 <_mem_avail_start-0x7fffc720>
 b7c:	1d190000 	0x1d190000
 b80:	52133101 	beql	s0,s3,cf88 <_mem_avail_start-0x7fff3078>
 b84:	58175501 	0x58175501
 b88:	000b590b 	0xb590b
 b8c:	010b1a00 	0x10b1a00
 b90:	00001755 	0x1755
 b94:	3100341b 	andi	zero,t0,0x341b
 b98:	00180213 	0x180213
 b9c:	012e1c00 	0x12e1c00
 ba0:	0e03193f 	jal	80c64fc <_mem_avail_start-0x77f39b04>
 ba4:	0b3b0b3a 	j	cec2ce8 <_mem_avail_start-0x7313d318>
 ba8:	13010b20 	beq	t8,at,382c <_mem_avail_start-0x7fffc7d4>
 bac:	2e1d0000 	sltiu	sp,s0,0
 bb0:	03193f01 	0x3193f01
 bb4:	3b0b3a0e 	xori	t3,t8,0x3a0e
 bb8:	2013490b 	addi	s3,zero,18699
 bbc:	0013010b 	0x13010b
 bc0:	012e1e00 	0x12e1e00
 bc4:	01111331 	tgeu	t0,s1,0x4c
 bc8:	18400612 	blez	v0,2414 <_mem_avail_start-0x7fffdbec>
 bcc:	01194297 	0x1194297
 bd0:	1f000013 	bgtz	t8,c20 <_mem_avail_start-0x7ffff3e0>
 bd4:	13310005 	beq	t9,s1,bec <_mem_avail_start-0x7ffff414>
 bd8:	00001802 	srl	v1,zero,0x0
 bdc:	31012e20 	andi	at,t0,0x2e20
 be0:	12011113 	beq	s0,at,5030 <_mem_avail_start-0x7fffafd0>
 be4:	97184006 	lhu	t8,16390(t8)
 be8:	00001942 	srl	v1,zero,0x5
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
       0:	bfc007a4 	cache	0x0,1956(s8)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	bfc007a8 	cache	0x0,1960(s8)
       8:	30520001 	andi	s2,v0,0x1
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
       c:	34bfc008 	ori	ra,a1,0xc008
      10:	01bfc008 	0x1bfc008
      14:	08e05200 	j	3814800 <_mem_avail_start-0x7c7eb800>
      18:	0924bfc0 	j	492ff00 <_mem_avail_start-0x7b6d0100>
      1c:	0001bfc0 	sll	s7,at,0x1f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:6
}
      20:	c0095460 	ll	t1,21600(zero)
      24:	c00994bf 	ll	t1,-27457(zero)
strchr():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
    if (s < d && s + n > d) {
      28:	600001bf 	0x600001bf
strcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
      2c:	bfc009c8 	cache	0x0,2504(s8)
strncpy():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
      30:	bfc009e8 	cache	0x0,2536(s8)
memcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:330
        s += n, d += n;
      34:	00600001 	movf	zero,v1,$fcc0
      38:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
      3c:	d0000000 	0xd0000000
strncmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
      40:	d8bfc007 	ldc2	$31,-16377(a1)
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
      44:	01bfc007 	srav	t8,ra,t5
      48:	07d85200 	0x7d85200
      4c:	07f0bfc0 	bltzal	ra,fffeff50 <_text_end+0x403ee1d8>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	0001bfc0 	sll	s7,at,0x1f
      54:	00000062 	0x62
      58:	00000000 	nop
      5c:	c0089000 	ll	t0,-28672(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
      60:	c008a8bf 	ll	t0,-22337(zero)
      64:	520001bf 	beqzl	s0,764 <_mem_avail_start-0x7ffff89c>
      68:	bfc008bc 	cache	0x0,2236(s8)
      6c:	bfc008c3 	cache	0x0,2243(s8)
      70:	00520001 	0x520001
      74:	00000000 	nop
      78:	20000000 	addi	zero,zero,0
      7c:	24bfc009 	addiu	ra,a1,-16375
      80:	01bfc009 	0x1bfc009
      84:	00005200 	sll	t2,zero,0x8
      88:	00000000 	nop
      8c:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
      90:	0a07bfc0 	j	81eff00 <_mem_avail_start-0x77e10100>
      94:	0001bfc0 	sll	s7,at,0x1f
      98:	c00a0752 	ll	t2,1874(zero)
      9c:	c00a48bf 	ll	t2,18623(zero)
      a0:	640001bf 	0x640001bf
	...
      ac:	bfc00a14 	cache	0x0,2580(s8)
      b0:	bfc00a1b 	cache	0x0,2587(s8)
      b4:	1b520001 	0x1b520001
      b8:	48bfc00a 	0x48bfc00a
      bc:	01bfc00a 	movz	t8,t5,ra
      c0:	00006500 	sll	t4,zero,0x14
      c4:	00000000 	nop
      c8:	0a1c0000 	j	8700000 <_mem_avail_start-0x77900000>
      cc:	0a28bfc0 	j	8a2ff00 <_mem_avail_start-0x775d0100>
      d0:	0001bfc0 	sll	s7,at,0x1f
      d4:	c00a2860 	ll	t2,10336(zero)
      d8:	c00a30bf 	ll	t2,12479(zero)
      dc:	800003bf 	lb	zero,959(zero)
      e0:	0a309f7f 	j	8c27dfc <_mem_avail_start-0x773d8204>
      e4:	0a48bfc0 	j	922ff00 <_mem_avail_start-0x76dd0100>
      e8:	0001bfc0 	sll	s7,at,0x1f
      ec:	00000060 	0x60
      f0:	00000000 	nop
      f4:	c006e400 	ll	a2,-7168(zero)
      f8:	c006ebbf 	ll	a2,-5185(zero)
      fc:	520001bf 	beqzl	s0,7fc <_mem_avail_start-0x7ffff804>
     100:	bfc006eb 	cache	0x0,1771(s8)
     104:	bfc0075c 	cache	0x0,1884(s8)
     108:	00610001 	movt	zero,v1,$fcc0
     10c:	00000000 	nop
     110:	ec000000 	swc3	$0,0(zero)
     114:	f3bfc006 	0xf3bfc006
     118:	01bfc006 	srlv	t8,ra,t5
     11c:	06f35200 	bgezall	s7,14920 <_mem_avail_start-0x7ffeb6e0>
     120:	0758bfc0 	0x758bfc0
     124:	0001bfc0 	sll	s7,at,0x1f
     128:	00000062 	0x62
     12c:	00000000 	nop
     130:	c0070800 	ll	a3,2048(zero)
     134:	c0070fbf 	ll	a3,4031(zero)
     138:	520001bf 	beqzl	s0,838 <_mem_avail_start-0x7ffff7c8>
     13c:	bfc0070f 	cache	0x0,1807(s8)
     140:	bfc00754 	cache	0x0,1876(s8)
     144:	54630001 	bnel	v1,v1,14c <_mem_avail_start-0x7ffffeb4>
     148:	68bfc007 	0x68bfc007
     14c:	01bfc007 	srav	t8,ra,t5
     150:	00005200 	sll	t2,zero,0x8
     154:	00000000 	nop
     158:	071c0000 	0x71c0000
     15c:	0760bfc0 	bltz	k1,ffff0060 <_text_end+0x403ee2e8>
     160:	0001bfc0 	sll	s7,at,0x1f
     164:	00000060 	0x60
     168:	00000000 	nop
     16c:	c0058000 	ll	a1,-32768(zero)
     170:	c005c0bf 	ll	a1,-16193(zero)
     174:	540001bf 	bnezl	zero,874 <_mem_avail_start-0x7ffff78c>
     178:	bfc005c0 	cache	0x0,1472(s8)
     17c:	bfc005c7 	cache	0x0,1479(s8)
     180:	c7550001 	lwc1	$f21,1(k0)
     184:	94bfc005 	lhu	ra,-16379(a1)
     188:	01bfc006 	srlv	t8,ra,t5
     18c:	06946100 	0x6946100
     190:	06a0bfc0 	bltz	s5,ffff0094 <_text_end+0x403ee31c>
     194:	0004bfc0 	sll	s7,a0,0x1f
     198:	9f5401f3 	0x9f5401f3
	...
     1a4:	bfc00580 	cache	0x0,1408(s8)
     1a8:	bfc005c0 	cache	0x0,1472(s8)
     1ac:	c0540001 	ll	s4,1(v0)
     1b0:	c7bfc005 	lwc1	$f31,-16379(sp)
     1b4:	01bfc005 	0x1bfc005
     1b8:	05c75500 	0x5c75500
     1bc:	0694bfc0 	0x694bfc0
     1c0:	0001bfc0 	sll	s7,at,0x1f
     1c4:	c0069461 	ll	a2,-27551(zero)
     1c8:	c006a0bf 	ll	a2,-24385(zero)
     1cc:	f30004bf 	0xf30004bf
     1d0:	009f5401 	0x9f5401
     1d4:	00000000 	nop
     1d8:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
     1dc:	98bfc006 	lwr	ra,-16378(a1)
     1e0:	01bfc006 	srlv	t8,ra,t5
     1e4:	00006000 	sll	t4,zero,0x0
     1e8:	00000000 	nop
     1ec:	061c0000 	0x61c0000
     1f0:	0684bfc0 	0x684bfc0
     1f4:	0001bfc0 	sll	s7,at,0x1f
     1f8:	00000065 	0x65
     1fc:	00000000 	nop
     200:	c0062000 	ll	a2,8192(zero)
     204:	c00690bf 	ll	a2,-28481(zero)
     208:	620001bf 	0x620001bf
	...
     214:	bfc00648 	cache	0x0,1608(s8)
     218:	bfc00674 	cache	0x0,1652(s8)
     21c:	00660001 	0x660001
     220:	00000000 	nop
     224:	5c000000 	bgtzl	zero,228 <_mem_avail_start-0x7ffffdd8>
     228:	74bfc006 	jalx	2ff0018 <_mem_avail_start-0x7d00ffe8>
     22c:	01bfc006 	srlv	t8,ra,t5
     230:	00006300 	sll	t4,zero,0xc
     234:	00000000 	nop
     238:	05280000 	tgei	t1,0
     23c:	0548bfc0 	tgei	t2,-16448
     240:	0002bfc0 	sll	s7,v0,0x1f
     244:	055c9f30 	0x55c9f30
     248:	0570bfc0 	bltzal	t3,ffff014c <_text_end+0x403ee3d4>
     24c:	0001bfc0 	sll	s7,at,0x1f
     250:	00000060 	0x60
     254:	00000000 	nop
     258:	c0047000 	ll	a0,28672(zero)
     25c:	c00484bf 	ll	a0,-31553(zero)
     260:	540001bf 	bnezl	zero,960 <_mem_avail_start-0x7ffff6a0>
     264:	bfc00484 	cache	0x0,1156(s8)
     268:	bfc0048f 	cache	0x0,1167(s8)
     26c:	8f550001 	lw	s5,1(k0)
     270:	b4bfc004 	0xb4bfc004
     274:	01bfc004 	sllv	t8,ra,t5
     278:	04b46000 	0x4b46000
     27c:	04bcbfc0 	0x4bcbfc0
     280:	0004bfc0 	sll	s7,a0,0x1f
     284:	9f5401f3 	0x9f5401f3
	...
     290:	bfc00450 	cache	0x0,1104(s8)
     294:	bfc0045c 	cache	0x0,1116(s8)
     298:	5c540001 	0x5c540001
     29c:	70bfc004 	0x70bfc004
     2a0:	04bfc004 	0x4bfc004
     2a4:	5401f300 	bnel	zero,at,ffffcea8 <_text_end+0x403fb130>
     2a8:	0000009f 	0x9f
     2ac:	00000000 	nop
     2b0:	c0045400 	ll	a0,21504(zero)
     2b4:	c00464bf 	ll	a0,25791(zero)
     2b8:	520001bf 	beqzl	s0,9b8 <_mem_avail_start-0x7ffff648>
     2bc:	bfc00464 	cache	0x0,1124(s8)
     2c0:	bfc00468 	cache	0x0,1128(s8)
     2c4:	00740006 	srlv	zero,s4,v1
     2c8:	9f210072 	0x9f210072
     2cc:	bfc00468 	cache	0x0,1128(s8)
     2d0:	bfc00470 	cache	0x0,1136(s8)
     2d4:	00540001 	movf	zero,v0,$fcc5
     2d8:	00000000 	nop
     2dc:	bc000000 	cache	0x0,0(zero)
     2e0:	dcbfc004 	ldc3	$31,-16380(a1)
     2e4:	01bfc004 	sllv	t8,ra,t5
     2e8:	04dc5400 	0x4dc5400
     2ec:	0528bfc0 	tgei	t1,-16448
     2f0:	0004bfc0 	sll	s7,a0,0x1f
     2f4:	9f5401f3 	0x9f5401f3
	...
     300:	bfc004bc 	cache	0x0,1212(s8)
     304:	bfc004c8 	cache	0x0,1224(s8)
     308:	c8550001 	lwc2	$21,1(v0)
     30c:	28bfc004 	slti	ra,a1,-16380
     310:	04bfc005 	0x4bfc005
     314:	5501f300 	bnel	t0,at,ffffcf18 <_text_end+0x403fb1a0>
     318:	0000009f 	0x9f
     31c:	00000000 	nop
     320:	c004bc00 	ll	a0,-17408(zero)
     324:	c004dcbf 	ll	a0,-9025(zero)
     328:	540001bf 	bnezl	zero,a28 <_mem_avail_start-0x7ffff5d8>
     32c:	bfc004dc 	cache	0x0,1244(s8)
     330:	bfc00528 	cache	0x0,1320(s8)
     334:	01f30004 	sllv	zero,s3,t7
     338:	00009f54 	0x9f54
     33c:	00000000 	nop
     340:	04c80000 	tgei	a2,0
     344:	04f8bfc0 	0x4f8bfc0
     348:	0001bfc0 	sll	s7,at,0x1f
     34c:	c004f855 	ll	a0,-1963(zero)
     350:	c00528bf 	ll	a1,10431(zero)
     354:	f30008bf 	0xf30008bf
     358:	01f35401 	0x1f35401
     35c:	009f2255 	0x9f2255
	...
     368:	20bfc005 	addi	ra,a1,-16379
     36c:	04bfc005 	0x4bfc005
     370:	5401f300 	bnel	zero,at,ffffcf74 <_text_end+0x403fb1fc>
     374:	0000009f 	0x9f
     378:	00000000 	nop
     37c:	c0050000 	ll	a1,0(zero)
     380:	c00520bf 	ll	a1,8383(zero)
     384:	f30004bf 	0xf30004bf
     388:	009f5501 	0x9f5501
     38c:	00000000 	nop
     390:	10000000 	b	394 <_mem_avail_start-0x7ffffc6c>
     394:	20bfc00c 	addi	ra,a1,-16372
     398:	01bfc00c 	syscall	0x6ff00
     39c:	0c205400 	jal	815000 <_mem_avail_start-0x7f7eb000>
     3a0:	0c6cbfc0 	jal	1b2ff00 <_mem_avail_start-0x7e4d0100>
     3a4:	0001bfc0 	sll	s7,at,0x1f
     3a8:	c00c6c61 	ll	t4,27745(zero)
     3ac:	c00c80bf 	ll	t4,-32577(zero)
     3b0:	f30004bf 	0xf30004bf
     3b4:	809f5401 	lb	ra,21505(a0)
     3b8:	c4bfc00c 	lwc1	$f31,-16372(a1)
     3bc:	01bfc00c 	syscall	0x6ff00
     3c0:	00006100 	sll	t4,zero,0x4
     3c4:	00000000 	nop
     3c8:	0c100000 	jal	400000 <_mem_avail_start-0x7fc00000>
     3cc:	0c33bfc0 	jal	ceff00 <_mem_avail_start-0x7f310100>
     3d0:	0001bfc0 	sll	s7,at,0x1f
     3d4:	c00c3355 	ll	t4,13141(zero)
     3d8:	c00cc4bf 	ll	t4,-15169(zero)
     3dc:	f30004bf 	0xf30004bf
     3e0:	009f5501 	0x9f5501
     3e4:	00000000 	nop
     3e8:	8c000000 	lw	zero,0(zero)
     3ec:	b3bfc00c 	0xb3bfc00c
     3f0:	01bfc00c 	syscall	0x6ff00
     3f4:	00005600 	sll	t2,zero,0x18
     3f8:	00000000 	nop
     3fc:	0ba80000 	j	ea00000 <_mem_avail_start-0x71600000>
     400:	0bccbfc0 	j	f32ff00 <_mem_avail_start-0x70cd0100>
     404:	0002bfc0 	sll	s7,v0,0x1f
     408:	0bcc9f30 	j	f327cc0 <_mem_avail_start-0x70cd8340>
     40c:	0becbfc0 	j	fb2ff00 <_mem_avail_start-0x704d0100>
     410:	0001bfc0 	sll	s7,at,0x1f
     414:	00000060 	0x60
     418:	00000000 	nop
     41c:	c00be000 	ll	t3,-8192(zero)
     420:	c00bf3bf 	ll	t3,-3137(zero)
     424:	560001bf 	bnezl	s0,b24 <_mem_avail_start-0x7ffff4dc>
     428:	00000000 	nop
     42c:	00000000 	nop
     430:	bfc00be0 	cache	0x0,3040(s8)
     434:	bfc00bf3 	cache	0x0,3059(s8)
     438:	00570001 	0x570001
     43c:	00000000 	nop
     440:	e0000000 	sc	zero,0(zero)
     444:	f3bfc00b 	0xf3bfc00b
     448:	01bfc00b 	movn	t8,t5,ra
     44c:	00005200 	sll	t2,zero,0x8
     450:	00000000 	nop
     454:	0b100000 	j	c400000 <_mem_avail_start-0x73c00000>
     458:	0b44bfc0 	j	d12ff00 <_mem_avail_start-0x72ed0100>
     45c:	0001bfc0 	sll	s7,at,0x1f
     460:	c00b4454 	ll	t3,17492(zero)
     464:	c00ba0bf 	ll	t3,-24385(zero)
     468:	600001bf 	0x600001bf
     46c:	bfc00ba0 	cache	0x0,2976(s8)
     470:	bfc00ba8 	cache	0x0,2984(s8)
     474:	01f30004 	sllv	zero,s3,t7
     478:	00009f54 	0x9f54
     47c:	00000000 	nop
     480:	0b100000 	j	c400000 <_mem_avail_start-0x73c00000>
     484:	0b44bfc0 	j	d12ff00 <_mem_avail_start-0x72ed0100>
     488:	0002bfc0 	sll	s7,v0,0x1f
     48c:	0b449f31 	j	d127cc4 <_mem_avail_start-0x72ed833c>
     490:	0b50bfc0 	j	d42ff00 <_mem_avail_start-0x72bd0100>
     494:	0001bfc0 	sll	s7,at,0x1f
     498:	c00b5061 	ll	t3,20577(zero)
     49c:	c00b57bf 	ll	t3,22463(zero)
     4a0:	550001bf 	bnezl	t0,ba0 <_mem_avail_start-0x7ffff460>
     4a4:	bfc00b57 	cache	0x0,2903(s8)
     4a8:	bfc00b58 	cache	0x0,2904(s8)
     4ac:	7f810003 	0x7f810003
     4b0:	c00b589f 	ll	t3,22687(zero)
     4b4:	c00b9cbf 	ll	t3,-25409(zero)
     4b8:	610001bf 	0x610001bf
	...
     4c4:	bfc00a98 	cache	0x0,2712(s8)
     4c8:	bfc00af0 	cache	0x0,2800(s8)
     4cc:	fc600001 	sdc3	$0,1(v1)
     4d0:	10bfc00a 	beq	a1,ra,ffff04fc <_text_end+0x403ee784>
     4d4:	01bfc00b 	movn	t8,t5,ra
     4d8:	00006000 	sll	t4,zero,0x0
     4dc:	00000000 	nop
     4e0:	0ad00000 	j	b400000 <_mem_avail_start-0x74c00000>
     4e4:	0ae3bfc0 	j	b8eff00 <_mem_avail_start-0x74710100>
     4e8:	0001bfc0 	sll	s7,at,0x1f
     4ec:	c00afc52 	ll	t2,-942(zero)
     4f0:	c00b07bf 	ll	t3,1983(zero)
     4f4:	520001bf 	beqzl	s0,bf4 <_mem_avail_start-0x7ffff40c>
     4f8:	00000000 	nop
     4fc:	00000000 	nop
     500:	bfc00cc4 	cache	0x0,3268(s8)
     504:	bfc00d00 	cache	0x0,3328(s8)
     508:	00540001 	movf	zero,v0,$fcc5
     50c:	20bfc00d 	addi	ra,a1,-16371
     510:	01bfc00d 	break	0x1bf,0x300
     514:	0d206200 	jal	4818800 <_mem_avail_start-0x7b7e7800>
     518:	0d34bfc0 	jal	4d2ff00 <_mem_avail_start-0x7b2d0100>
     51c:	0004bfc0 	sll	s7,a0,0x1f
     520:	9f5401f3 	0x9f5401f3
     524:	bfc00d34 	cache	0x0,3380(s8)
     528:	bfc00ee8 	cache	0x0,3816(s8)
     52c:	00620001 	0x620001
     530:	00000000 	nop
     534:	f8000000 	sdc2	$0,0(zero)
     538:	00bfc00c 	syscall	0x2ff00
     53c:	02bfc00d 	break	0x2bf,0x300
     540:	009f3000 	0x9f3000
     544:	24bfc00d 	addiu	ra,a1,-16371
     548:	01bfc00d 	break	0x1bf,0x300
     54c:	0d346100 	jal	4d18400 <_mem_avail_start-0x7b2e7c00>
     550:	0e48bfc0 	jal	922ff00 <_mem_avail_start-0x76dd0100>
     554:	0001bfc0 	sll	s7,at,0x1f
     558:	c00e4861 	ll	t6,18529(zero)
     55c:	c00e50bf 	ll	t6,20671(zero)
     560:	810003bf 	lb	zero,959(t0)
     564:	0e509f7f 	jal	9427dfc <_mem_avail_start-0x76bd8204>
     568:	0ea0bfc0 	jal	a82ff00 <_mem_avail_start-0x757d0100>
     56c:	0001bfc0 	sll	s7,at,0x1f
     570:	c00eac61 	ll	t6,-21407(zero)
     574:	c00ec8bf 	ll	t6,-14145(zero)
     578:	610001bf 	0x610001bf
     57c:	bfc00ec8 	cache	0x0,3784(s8)
     580:	bfc00ed0 	cache	0x0,3792(s8)
     584:	00740006 	srlv	zero,s4,v1
     588:	9f1c0082 	0x9f1c0082
     58c:	bfc00ed0 	cache	0x0,3792(s8)
     590:	bfc00ee8 	cache	0x0,3816(s8)
     594:	00610001 	movt	zero,v1,$fcc0
     598:	00000000 	nop
     59c:	34000000 	li	zero,0x0
     5a0:	48bfc00d 	0x48bfc00d
     5a4:	01bfc00d 	break	0x1bf,0x300
     5a8:	0ed06400 	jal	b419000 <_mem_avail_start-0x74be7000>
     5ac:	0ee8bfc0 	jal	ba2ff00 <_mem_avail_start-0x745d0100>
     5b0:	0001bfc0 	sll	s7,at,0x1f
     5b4:	00000064 	0x64
     5b8:	00000000 	nop
     5bc:	c00cf800 	ll	t4,-2048(zero)
     5c0:	c00d28bf 	ll	t5,10431(zero)
     5c4:	600001bf 	0x600001bf
     5c8:	bfc00d34 	cache	0x0,3380(s8)
     5cc:	bfc00ee8 	cache	0x0,3816(s8)
     5d0:	00600001 	movf	zero,v1,$fcc0
     5d4:	00000000 	nop
     5d8:	48000000 	mfc2	zero,$0
     5dc:	84bfc00d 	lh	ra,-16371(a1)
     5e0:	01bfc00d 	break	0x1bf,0x300
     5e4:	0d945500 	jal	6515400 <_mem_avail_start-0x79aeac00>
     5e8:	0db3bfc0 	jal	6ceff00 <_mem_avail_start-0x79310100>
     5ec:	0001bfc0 	sll	s7,at,0x1f
     5f0:	c00dbc55 	ll	t5,-17323(zero)
     5f4:	c00e0fbf 	ll	t6,4031(zero)
     5f8:	550001bf 	bnezl	t0,cf8 <_mem_avail_start-0x7ffff308>
     5fc:	bfc00e24 	cache	0x0,3620(s8)
     600:	bfc00e33 	cache	0x0,3635(s8)
     604:	3c550001 	0x3c550001
     608:	4fbfc00e 	c3	0x1bfc00e
     60c:	01bfc00e 	0x1bfc00e
     610:	0e585500 	jal	9615400 <_mem_avail_start-0x769eac00>
     614:	0e67bfc0 	jal	99eff00 <_mem_avail_start-0x76610100>
     618:	0001bfc0 	sll	s7,at,0x1f
     61c:	c00e7455 	ll	t6,29781(zero)
     620:	c00e93bf 	ll	t6,-27713(zero)
     624:	550001bf 	bnezl	t0,d24 <_mem_avail_start-0x7ffff2dc>
     628:	bfc00e9c 	cache	0x0,3740(s8)
     62c:	bfc00ea4 	cache	0x0,3748(s8)
     630:	ac550001 	sw	s5,1(v0)
     634:	d0bfc00e 	0xd0bfc00e
     638:	01bfc00e 	0x1bfc00e
     63c:	00005500 	sll	t2,zero,0x14
     640:	00000000 	nop
     644:	0ee80000 	jal	ba00000 <_mem_avail_start-0x74600000>
     648:	0f1cbfc0 	jal	c72ff00 <_mem_avail_start-0x738d0100>
     64c:	0001bfc0 	sll	s7,at,0x1f
     650:	c00f1c54 	ll	t7,7252(zero)
     654:	c00f24bf 	ll	t7,9407(zero)
     658:	800004bf 	lb	zero,1215(zero)
     65c:	249f1f00 	addiu	ra,a0,7936
     660:	6cbfc00f 	0x6cbfc00f
     664:	04bfc00f 	0x4bfc00f
     668:	5401f300 	bnel	zero,at,ffffd26c <_text_end+0x403fb4f4>
     66c:	c00f6c9f 	ll	t7,27807(zero)
     670:	c00f74bf 	ll	t7,29887(zero)
     674:	540001bf 	bnezl	zero,d74 <_mem_avail_start-0x7ffff28c>
     678:	bfc00f74 	cache	0x0,3956(s8)
     67c:	bfc00fc0 	cache	0x0,4032(s8)
     680:	01f30004 	sllv	zero,s3,t7
     684:	00009f54 	0x9f54
     688:	00000000 	nop
     68c:	0ee80000 	jal	ba00000 <_mem_avail_start-0x74600000>
     690:	0f23bfc0 	jal	c8eff00 <_mem_avail_start-0x73710100>
     694:	0001bfc0 	sll	s7,at,0x1f
     698:	c00f2355 	ll	t7,9045(zero)
     69c:	c00f3cbf 	ll	t7,15551(zero)
     6a0:	630001bf 	0x630001bf
     6a4:	bfc00f3c 	cache	0x0,3900(s8)
     6a8:	bfc00f6c 	cache	0x0,3948(s8)
     6ac:	01f30004 	sllv	zero,s3,t7
     6b0:	0f6c9f55 	jal	db27d54 <_mem_avail_start-0x724d82ac>
     6b4:	0f74bfc0 	jal	dd2ff00 <_mem_avail_start-0x722d0100>
     6b8:	0001bfc0 	sll	s7,at,0x1f
     6bc:	c00f7455 	ll	t7,29781(zero)
     6c0:	c00f90bf 	ll	t7,-28481(zero)
     6c4:	630001bf 	0x630001bf
     6c8:	bfc00f90 	cache	0x0,3984(s8)
     6cc:	bfc00fc0 	cache	0x0,4032(s8)
     6d0:	01f30004 	sllv	zero,s3,t7
     6d4:	00009f55 	0x9f55
     6d8:	00000000 	nop
     6dc:	0ee80000 	jal	ba00000 <_mem_avail_start-0x74600000>
     6e0:	0f23bfc0 	jal	c8eff00 <_mem_avail_start-0x73710100>
     6e4:	0001bfc0 	sll	s7,at,0x1f
     6e8:	c00f2356 	ll	t7,9046(zero)
     6ec:	c00f50bf 	ll	t7,20671(zero)
     6f0:	640001bf 	0x640001bf
     6f4:	bfc00f50 	cache	0x0,3920(s8)
     6f8:	bfc00f6c 	cache	0x0,3948(s8)
     6fc:	01f30004 	sllv	zero,s3,t7
     700:	0f6c9f56 	jal	db27d58 <_mem_avail_start-0x724d82a8>
     704:	0f74bfc0 	jal	dd2ff00 <_mem_avail_start-0x722d0100>
     708:	0001bfc0 	sll	s7,at,0x1f
     70c:	c00f7456 	ll	t7,29782(zero)
     710:	c00fc0bf 	ll	t7,-16193(zero)
     714:	640001bf 	0x640001bf
	...
     720:	bfc00ee8 	cache	0x0,3816(s8)
     724:	bfc00f23 	cache	0x0,3875(s8)
     728:	23570001 	addi	s7,k0,1
     72c:	6cbfc00f 	0x6cbfc00f
     730:	04bfc00f 	0x4bfc00f
     734:	5701f300 	bnel	t8,at,ffffd338 <_text_end+0x403fb5c0>
     738:	c00f6c9f 	ll	t7,27807(zero)
     73c:	c00f74bf 	ll	t7,29887(zero)
     740:	570001bf 	bnezl	t8,e40 <_mem_avail_start-0x7ffff1c0>
     744:	bfc00f74 	cache	0x0,3956(s8)
     748:	bfc00fc0 	cache	0x0,4032(s8)
     74c:	01f30004 	sllv	zero,s3,t7
     750:	00009f57 	0x9f57
     754:	00000000 	nop
     758:	0f2c0000 	jal	cb00000 <_mem_avail_start-0x73500000>
     75c:	0f58bfc0 	jal	d62ff00 <_mem_avail_start-0x729d0100>
     760:	0001bfc0 	sll	s7,at,0x1f
     764:	c00f7462 	ll	t7,29794(zero)
     768:	c00f88bf 	ll	t7,-30529(zero)
     76c:	620001bf 	0x620001bf
     770:	bfc00f90 	cache	0x0,3984(s8)
     774:	bfc00fc0 	cache	0x0,4032(s8)
     778:	00620001 	0x620001
     77c:	00000000 	nop
     780:	34000000 	li	zero,0x0
     784:	3cbfc00f 	0x3cbfc00f
     788:	0ebfc00f 	jal	aff003c <_mem_avail_start-0x7500ffc4>
     78c:	12008300 	beqz	s0,fffe1390 <_text_end+0x403df618>
     790:	14160082 	bne	zero,s6,99c <_mem_avail_start-0x7ffff664>
     794:	0001282b 	sltu	a1,zero,at
     798:	3c9f1316 	0x3c9f1316
     79c:	40bfc00f 	0x40bfc00f
     7a0:	0fbfc00f 	jal	eff003c <_mem_avail_start-0x7100ffc4>
     7a4:	5501f300 	bnel	t0,at,ffffd3a8 <_text_end+0x403fb630>
     7a8:	16008212 	bnez	s0,fffe0ff4 <_text_end+0x403df27c>
     7ac:	01282b14 	0x1282b14
     7b0:	9f131600 	0x9f131600
     7b4:	bfc00f40 	cache	0x0,3904(s8)
     7b8:	bfc00f60 	cache	0x0,3936(s8)
     7bc:	90600001 	lbu	zero,1(v1)
     7c0:	c0bfc00f 	ll	ra,-16369(a1)
     7c4:	01bfc00f 	0x1bfc00f
     7c8:	00006000 	sll	t4,zero,0x0
     7cc:	00000000 	nop
     7d0:	0fa00000 	jal	e800000 <_mem_avail_start-0x71800000>
     7d4:	0facbfc0 	jal	eb2ff00 <_mem_avail_start-0x714d0100>
     7d8:	0001bfc0 	sll	s7,at,0x1f
     7dc:	00000052 	mflhxu	zero
     7e0:	00000000 	nop
     7e4:	c00f1c00 	ll	t7,7168(zero)
     7e8:	c00f24bf 	ll	t7,9407(zero)
     7ec:	600001bf 	0x600001bf
     7f0:	bfc00f2c 	cache	0x0,3884(s8)
     7f4:	bfc00f38 	cache	0x0,3896(s8)
     7f8:	6c600001 	0x6c600001
     7fc:	74bfc00f 	jalx	2ff003c <_mem_avail_start-0x7d00ffc4>
     800:	01bfc00f 	0x1bfc00f
     804:	0f745400 	jal	dd15000 <_mem_avail_start-0x722eb000>
     808:	0f90bfc0 	jal	e42ff00 <_mem_avail_start-0x71bd0100>
     80c:	0001bfc0 	sll	s7,at,0x1f
     810:	00000060 	0x60
	...
     820:	55000100 	bnezl	t0,c24 <_mem_avail_start-0x7ffff3dc>
     824:	00000000 	nop
     828:	00000000 	nop
     82c:	00560001 	0x560001
     830:	00000000 	nop
     834:	04000000 	bltz	zero,838 <_mem_avail_start-0x7ffff7c8>
     838:	5501f300 	bnel	t0,at,ffffd43c <_text_end+0x403fb6c4>
     83c:	0000009f 	0x9f
	...
     84c:	54000100 	bnezl	zero,c50 <_mem_avail_start-0x7ffff3b0>
     850:	00000000 	nop
     854:	00000000 	nop
     858:	01f30004 	sllv	zero,s3,t7
     85c:	00009f54 	0x9f54
	...
     86c:	00010000 	sll	zero,at,0x0
     870:	00000055 	0x55
     874:	00000000 	nop
     878:	f3000400 	0xf3000400
     87c:	009f5501 	0x9f5501
	...
     88c:	01000000 	0x1000000
     890:	00005600 	sll	t2,zero,0x18
     894:	00000000 	nop
     898:	00060000 	sll	zero,a2,0x0
     89c:	315601f3 	andi	s6,t2,0x1f3
     8a0:	00009f1c 	0x9f1c
	...
     8b0:	00010000 	sll	zero,at,0x0
     8b4:	00000054 	0x54
     8b8:	00000000 	nop
     8bc:	52000100 	beqzl	s0,cc0 <_mem_avail_start-0x7ffff340>
     8c0:	00000000 	nop
	...
     8d0:	00550001 	movt	zero,v0,$fcc5
     8d4:	00000000 	nop
     8d8:	04000000 	bltz	zero,8dc <_mem_avail_start-0x7ffff724>
     8dc:	5501f300 	bnel	t0,at,ffffd4e0 <_text_end+0x403fb768>
     8e0:	0000009f 	0x9f
     8e4:	00000000 	nop
     8e8:	55000100 	bnezl	t0,cec <_mem_avail_start-0x7ffff314>
     8ec:	00000000 	nop
     8f0:	00000000 	nop
     8f4:	01f30004 	sllv	zero,s3,t7
     8f8:	00009f55 	0x9f55
	...
     908:	00010000 	sll	zero,at,0x0
     90c:	00000056 	0x56
     910:	00000000 	nop
     914:	73000a00 	0x73000a00
     918:	00722000 	0x722000
     91c:	22007622 	addi	zero,s0,30242
     920:	0000009f 	0x9f
     924:	00000000 	nop
     928:	56000100 	bnezl	s0,d2c <_mem_avail_start-0x7ffff2d4>
     92c:	00000000 	nop
     930:	00000000 	nop
     934:	01f30010 	0x1f30010
     938:	00732056 	0x732056
     93c:	5501f322 	bnel	t0,at,ffffd5c8 <_text_end+0x403fb850>
     940:	5601f31c 	bnel	s0,at,ffffd5b4 <_text_end+0x403fb83c>
     944:	00009f22 	0x9f22
     948:	00000000 	nop
     94c:	00070000 	sll	zero,a3,0x0
     950:	01f30073 	tltu	t7,s3,0x1
     954:	009f1c55 	0x9f1c55
     958:	00000000 	nop
     95c:	0a000000 	j	8000000 <_mem_avail_start-0x78000000>
     960:	20007300 	addi	zero,zero,29440
     964:	76220072 	jalx	88801c8 <_mem_avail_start-0x7777fe38>
     968:	009f2200 	0x9f2200
     96c:	00000000 	nop
     970:	09000000 	j	4000000 <_mem_avail_start-0x7c000000>
     974:	73007200 	0x73007200
     978:	00761c00 	0x761c00
     97c:	00009f22 	0x9f22
	...
     98c:	00010000 	sll	zero,at,0x0
     990:	00000055 	0x55
     994:	00000000 	nop
     998:	53000100 	beqzl	t8,d9c <_mem_avail_start-0x7ffff264>
     99c:	00000000 	nop
     9a0:	00000000 	nop
     9a4:	00550001 	movt	zero,v0,$fcc5
	...
     9b4:	01000000 	0x1000000
     9b8:	00005400 	sll	t2,zero,0x10
     9bc:	00000000 	nop
     9c0:	00010000 	sll	zero,at,0x0
     9c4:	00000052 	mflhxu	zero
     9c8:	00000000 	nop
     9cc:	53000100 	beqzl	t8,dd0 <_mem_avail_start-0x7ffff230>
     9d0:	00000000 	nop
     9d4:	00000000 	nop
     9d8:	00520001 	0x520001
     9dc:	00000000 	nop
     9e0:	01000000 	0x1000000
     9e4:	00005700 	sll	t2,zero,0x1c
     9e8:	00000000 	nop
     9ec:	00010000 	sll	zero,at,0x0
     9f0:	00000055 	0x55
     9f4:	00000000 	nop
     9f8:	53000100 	beqzl	t8,dfc <_mem_avail_start-0x7ffff204>
     9fc:	00000000 	nop
     a00:	00000000 	nop
     a04:	bfc00fe4 	cache	0x0,4068(s8)
     a08:	bfc00ff0 	cache	0x0,4080(s8)
     a0c:	f0540001 	0xf0540001
     a10:	10bfc00f 	beq	a1,ra,ffff0a50 <_text_end+0x403eecd8>
     a14:	01bfc010 	0x1bfc010
     a18:	00005200 	sll	t2,zero,0x8
     a1c:	00000000 	nop
     a20:	0fe40000 	jal	f900000 <_mem_avail_start-0x70700000>
     a24:	0ff0bfc0 	jal	fc2ff00 <_mem_avail_start-0x703d0100>
     a28:	0001bfc0 	sll	s7,at,0x1f
     a2c:	c00ff055 	ll	t7,-4011(zero)
     a30:	c01010bf 	ll	s0,4287(zero)
     a34:	f30004bf 	0xf30004bf
     a38:	009f5501 	0x9f5501
     a3c:	00000000 	nop
     a40:	e4000000 	swc1	$f0,0(zero)
     a44:	ecbfc00f 	swc3	$31,-16369(a1)
     a48:	01bfc00f 	0x1bfc00f
     a4c:	0fec5600 	jal	fb15800 <_mem_avail_start-0x704ea800>
     a50:	0ff0bfc0 	jal	fc2ff00 <_mem_avail_start-0x703d0100>
     a54:	0004bfc0 	sll	s7,a0,0x1f
     a58:	9f5601f3 	0x9f5601f3
     a5c:	bfc00ff0 	cache	0x0,4080(s8)
     a60:	bfc01008 	cache	0x0,4104(s8)
     a64:	0073000b 	movn	zero,v1,s3
     a68:	22007220 	addi	zero,s0,29216
     a6c:	225601f3 	addi	s6,s2,499
     a70:	c010089f 	ll	s0,2207(zero)
     a74:	c01010bf 	ll	s0,4287(zero)
     a78:	72000abf 	sdbbp	0x8002a
     a7c:	1c007300 	bgtz	zero,1d680 <_mem_avail_start-0x7ffe2980>
     a80:	225601f3 	addi	s6,s2,499
     a84:	0000009f 	0x9f
     a88:	00000000 	nop
     a8c:	c00fe800 	ll	t7,-6144(zero)
     a90:	c00ff0bf 	ll	t7,-3905(zero)
     a94:	540001bf 	bnezl	zero,1194 <_mem_avail_start-0x7fffee6c>
     a98:	bfc00ff0 	cache	0x0,4080(s8)
     a9c:	bfc01010 	cache	0x0,4112(s8)
     aa0:	00530001 	0x530001
     aa4:	00000000 	nop
     aa8:	c0000000 	ll	zero,0(zero)
     aac:	ccbfc00f 	pref	0x1f,-16369(a1)
     ab0:	01bfc00f 	0x1bfc00f
     ab4:	0fcc5400 	jal	f315000 <_mem_avail_start-0x70ceb000>
     ab8:	0fe4bfc0 	jal	f92ff00 <_mem_avail_start-0x706d0100>
     abc:	0001bfc0 	sll	s7,at,0x1f
     ac0:	00000052 	mflhxu	zero
     ac4:	00000000 	nop
     ac8:	c00fc000 	ll	t7,-16384(zero)
     acc:	c00fc8bf 	ll	t7,-14145(zero)
     ad0:	560001bf 	bnezl	s0,11d0 <_mem_avail_start-0x7fffee30>
     ad4:	bfc00fc8 	cache	0x0,4040(s8)
     ad8:	bfc00fcc 	cache	0x0,4044(s8)
     adc:	01f30004 	sllv	zero,s3,t7
     ae0:	0fcc9f56 	jal	f327d58 <_mem_avail_start-0x70cd82a8>
     ae4:	0fdcbfc0 	jal	f72ff00 <_mem_avail_start-0x708d0100>
     ae8:	000bbfc0 	sll	s7,t3,0x1f
     aec:	72200073 	0x72200073
     af0:	01f32200 	0x1f32200
     af4:	dc9f2256 	ldc3	$31,8790(a0)
     af8:	e4bfc00f 	swc1	$f31,-16369(a1)
     afc:	0abfc00f 	j	aff003c <_mem_avail_start-0x7500ffc4>
     b00:	73007200 	0x73007200
     b04:	01f31c00 	0x1f31c00
     b08:	009f2256 	0x9f2256
     b0c:	00000000 	nop
     b10:	c4000000 	lwc1	$f0,0(zero)
     b14:	ccbfc00f 	pref	0x1f,-16369(a1)
     b18:	01bfc00f 	0x1bfc00f
     b1c:	0fcc5400 	jal	f315000 <_mem_avail_start-0x70ceb000>
     b20:	0fe4bfc0 	jal	f92ff00 <_mem_avail_start-0x706d0100>
     b24:	0001bfc0 	sll	s7,at,0x1f
     b28:	00000053 	mtlhx	zero
	...
     b38:	54000100 	bnezl	zero,f3c <_mem_avail_start-0x7ffff0c4>
     b3c:	00000000 	nop
     b40:	00000000 	nop
     b44:	00520001 	0x520001
	...
     b54:	01000000 	0x1000000
     b58:	00005400 	sll	t2,zero,0x10
     b5c:	00000000 	nop
     b60:	00010000 	sll	zero,at,0x0
     b64:	00000052 	mflhxu	zero
     b68:	00000000 	nop
     b6c:	52000100 	beqzl	s0,f70 <_mem_avail_start-0x7ffff090>
     b70:	00000000 	nop
	...
     b80:	00540001 	movf	zero,v0,$fcc5
     b84:	00000000 	nop
     b88:	01000000 	0x1000000
     b8c:	00005400 	sll	t2,zero,0x10
	...
     b9c:	00010000 	sll	zero,at,0x0
     ba0:	00000055 	0x55
     ba4:	00000000 	nop
     ba8:	55000100 	bnezl	t0,fac <_mem_avail_start-0x7ffff054>
     bac:	00000000 	nop
	...
     bbc:	00560001 	0x560001
     bc0:	00000000 	nop
     bc4:	04000000 	bltz	zero,bc8 <_mem_avail_start-0x7ffff438>
     bc8:	5601f300 	bnel	s0,at,ffffd7cc <_text_end+0x403fba54>
     bcc:	0000009f 	0x9f
     bd0:	00000000 	nop
     bd4:	f3000600 	0xf3000600
     bd8:	1c315601 	0x1c315601
     bdc:	0000009f 	0x9f
     be0:	00000000 	nop
     be4:	f3000400 	0xf3000400
     be8:	009f5601 	0x9f5601
	...
     bf8:	01000000 	0x1000000
     bfc:	00005400 	sll	t2,zero,0x10
     c00:	00000000 	nop
     c04:	00010000 	sll	zero,at,0x0
     c08:	00000054 	0x54
	...
     c18:	55000100 	bnezl	t0,101c <_mem_avail_start-0x7fffefe4>
     c1c:	00000000 	nop
     c20:	00000000 	nop
     c24:	00550001 	movt	zero,v0,$fcc5
	...
     c34:	01000000 	0x1000000
     c38:	00005400 	sll	t2,zero,0x10
     c3c:	00000000 	nop
     c40:	00010000 	sll	zero,at,0x0
     c44:	00000052 	mflhxu	zero
	...
     c54:	55000100 	bnezl	t0,1058 <_mem_avail_start-0x7fffefa8>
     c58:	00000000 	nop
     c5c:	00000000 	nop
     c60:	00550001 	movt	zero,v0,$fcc5
	...
     c70:	01000000 	0x1000000
     c74:	00005600 	sll	t2,zero,0x18
     c78:	00000000 	nop
     c7c:	00040000 	sll	zero,a0,0x0
     c80:	9f5601f3 	0x9f5601f3
	...
     c8c:	0072000a 	movz	zero,v1,s2
     c90:	f31c0073 	0xf31c0073
     c94:	9f225601 	0x9f225601
	...
     ca8:	00540001 	movf	zero,v0,$fcc5
     cac:	00000000 	nop
     cb0:	01000000 	0x1000000
     cb4:	00005300 	sll	t2,zero,0xc
	...
     cc4:	00010000 	sll	zero,at,0x0
     cc8:	00000054 	0x54
     ccc:	00000000 	nop
     cd0:	52000100 	beqzl	s0,10d4 <_mem_avail_start-0x7fffef2c>
     cd4:	00000000 	nop
	...
     ce4:	00550001 	movt	zero,v0,$fcc5
     ce8:	00000000 	nop
     cec:	01000000 	0x1000000
     cf0:	00005500 	sll	t2,zero,0x14
	...
     d00:	00010000 	sll	zero,at,0x0
     d04:	00000054 	0x54
     d08:	00000000 	nop
     d0c:	53000100 	beqzl	t8,1110 <_mem_avail_start-0x7fffeef0>
     d10:	00000000 	nop
	...
     d20:	00540001 	movf	zero,v0,$fcc5
     d24:	00000000 	nop
     d28:	06000000 	bltz	s0,d2c <_mem_avail_start-0x7ffff2d4>
     d2c:	72007400 	0x72007400
     d30:	009f2200 	0x9f2200
     d34:	00000000 	nop
     d38:	08000000 	j	0 <_mem_avail_start-0x80000000>
     d3c:	74007200 	jalx	1c800 <_mem_avail_start-0x7ffe3800>
     d40:	01232200 	0x1232200
     d44:	0000009f 	0x9f
     d48:	00000000 	nop
     d4c:	72000600 	0x72000600
     d50:	22007400 	addi	zero,s0,29696
     d54:	0000009f 	0x9f
	...
     d64:	30000200 	andi	zero,zero,0x200
     d68:	0000009f 	0x9f
     d6c:	00000000 	nop
     d70:	52000100 	beqzl	s0,1174 <_mem_avail_start-0x7fffee8c>
     d74:	00000000 	nop
	...
     d84:	00540001 	movf	zero,v0,$fcc5
     d88:	00000000 	nop
     d8c:	01000000 	0x1000000
     d90:	00005300 	sll	t2,zero,0xc
	...
     da0:	00020000 	sll	zero,v0,0x0
     da4:	00009f30 	tge	zero,zero,0x27c
     da8:	00000000 	nop
     dac:	00010000 	sll	zero,at,0x0
     db0:	00000052 	mflhxu	zero
     db4:	00000000 	nop
     db8:	c0107000 	ll	s0,28672(zero)
     dbc:	c0107fbf 	ll	s0,32703(zero)
     dc0:	540001bf 	bnezl	zero,14c0 <_mem_avail_start-0x7fffeb40>
     dc4:	bfc0107f 	cache	0x0,4223(s8)
     dc8:	bfc010a0 	cache	0x0,4256(s8)
     dcc:	01f30004 	sllv	zero,s3,t7
     dd0:	00009f54 	0x9f54
     dd4:	00000000 	nop
     dd8:	10100000 	beq	zero,s0,ddc <_mem_avail_start-0x7ffff224>
     ddc:	102cbfc0 	beq	at,t4,ffff0ce0 <_text_end+0x403eef68>
     de0:	0001bfc0 	sll	s7,at,0x1f
     de4:	c0102c54 	ll	s0,11348(zero)
     de8:	c01040bf 	ll	s0,16575(zero)
     dec:	610001bf 	0x610001bf
     df0:	bfc01050 	cache	0x0,4176(s8)
     df4:	bfc01070 	cache	0x0,4208(s8)
     df8:	00610001 	movt	zero,v1,$fcc0
     dfc:	00000000 	nop
     e00:	30000000 	andi	zero,zero,0x0
     e04:	44bfc010 	0x44bfc010
     e08:	01bfc010 	0x1bfc010
     e0c:	10506000 	beq	v0,s0,18e10 <_mem_avail_start-0x7ffe71f0>
     e10:	1070bfc0 	beq	v1,s0,ffff0d14 <_text_end+0x403eef9c>
     e14:	0001bfc0 	sll	s7,at,0x1f
     e18:	00000060 	0x60
     e1c:	00000000 	nop
     e20:	c010a000 	ll	s0,-24576(zero)
     e24:	c010acbf 	ll	s0,-21313(zero)
     e28:	540001bf 	bnezl	zero,1528 <_mem_avail_start-0x7fffead8>
     e2c:	bfc010ac 	cache	0x0,4268(s8)
     e30:	bfc010c4 	cache	0x0,4292(s8)
     e34:	c4600001 	lwc1	$f0,1(v1)
     e38:	ccbfc010 	pref	0x1f,-16368(a1)
     e3c:	01bfc010 	0x1bfc010
     e40:	00005200 	sll	t2,zero,0x8
     e44:	00000000 	nop
     e48:	10cc0000 	beq	a2,t4,e4c <_mem_avail_start-0x7ffff1b4>
     e4c:	10ecbfc0 	beq	a3,t4,ffff0d50 <_text_end+0x403eefd8>
     e50:	0001bfc0 	sll	s7,at,0x1f
     e54:	c010ec54 	ll	s0,-5036(zero)
     e58:	c0110fbf 	ll	s1,4031(zero)
     e5c:	550001bf 	bnezl	t0,155c <_mem_avail_start-0x7fffeaa4>
     e60:	bfc0110f 	cache	0x0,4367(s8)
     e64:	bfc011b0 	cache	0x0,4528(s8)
     e68:	b0600001 	0xb0600001
     e6c:	ecbfc011 	swc3	$31,-16367(a1)
     e70:	04bfc011 	0x4bfc011
     e74:	5401f300 	bnel	zero,at,ffffda78 <_text_end+0x403fbd00>
     e78:	c011ec9f 	ll	s1,-4961(zero)
     e7c:	c0131cbf 	ll	s3,7359(zero)
     e80:	600001bf 	0x600001bf
     e84:	bfc0131c 	cache	0x0,4892(s8)
     e88:	bfc01380 	cache	0x0,4992(s8)
     e8c:	01f30004 	sllv	zero,s3,t7
     e90:	00009f54 	0x9f54
     e94:	00000000 	nop
     e98:	10cc0000 	beq	a2,t4,e9c <_mem_avail_start-0x7ffff164>
     e9c:	10e8bfc0 	beq	a3,t0,ffff0da0 <_text_end+0x403ef028>
     ea0:	0001bfc0 	sll	s7,at,0x1f
     ea4:	c010e855 	ll	s0,-6059(zero)
     ea8:	c0110fbf 	ll	s1,4031(zero)
     eac:	560001bf 	bnezl	s0,15ac <_mem_avail_start-0x7fffea54>
     eb0:	bfc0110f 	cache	0x0,4367(s8)
     eb4:	bfc011dc 	cache	0x0,4572(s8)
     eb8:	dc620001 	ldc3	$2,1(v1)
     ebc:	ecbfc011 	swc3	$31,-16367(a1)
     ec0:	04bfc011 	0x4bfc011
     ec4:	5501f300 	bnel	t0,at,ffffdac8 <_text_end+0x403fbd50>
     ec8:	c011ec9f 	ll	s1,-4961(zero)
     ecc:	c01380bf 	ll	s3,-32577(zero)
     ed0:	620001bf 	0x620001bf
	...
     edc:	bfc0111c 	cache	0x0,4380(s8)
     ee0:	bfc011ac 	cache	0x0,4524(s8)
     ee4:	ec620001 	swc3	$2,1(v1)
     ee8:	f4bfc011 	sdc1	$f31,-16367(a1)
     eec:	01bfc011 	0x1bfc011
     ef0:	00006200 	sll	t4,zero,0x8
     ef4:	00000000 	nop
     ef8:	111c0000 	beq	t0,gp,efc <_mem_avail_start-0x7ffff104>
     efc:	11acbfc0 	beq	t5,t4,ffff0e00 <_text_end+0x403ef088>
     f00:	0001bfc0 	sll	s7,at,0x1f
     f04:	c011ec60 	ll	s1,-5024(zero)
     f08:	c011f4bf 	ll	s1,-2881(zero)
     f0c:	600001bf 	0x600001bf
	...
     f18:	bfc0111c 	cache	0x0,4380(s8)
     f1c:	bfc01130 	cache	0x0,4400(s8)
     f20:	9f470002 	0x9f470002
     f24:	bfc01130 	cache	0x0,4400(s8)
     f28:	bfc0113c 	cache	0x0,4412(s8)
     f2c:	4c520001 	0x4c520001
     f30:	74bfc011 	jalx	2ff0044 <_mem_avail_start-0x7d00ffbc>
     f34:	01bfc011 	0x1bfc011
     f38:	11745200 	beq	t3,s4,1573c <_mem_avail_start-0x7ffea8c4>
     f3c:	1194bfc0 	beq	t4,s4,ffff0e40 <_text_end+0x403ef0c8>
     f40:	0001bfc0 	sll	s7,at,0x1f
     f44:	00000063 	0x63
     f48:	00000000 	nop
     f4c:	c0111c00 	ll	s1,7168(zero)
     f50:	c011b0bf 	ll	s1,-20289(zero)
     f54:	600001bf 	0x600001bf
     f58:	bfc011b0 	cache	0x0,4528(s8)
     f5c:	bfc011ec 	cache	0x0,4588(s8)
     f60:	01f30004 	sllv	zero,s3,t7
     f64:	11ec9f54 	beq	t7,t4,fffe8cb8 <_text_end+0x403e6f40>
     f68:	131cbfc0 	beq	t8,gp,ffff0e6c <_text_end+0x403ef0f4>
     f6c:	0001bfc0 	sll	s7,at,0x1f
     f70:	c0131c60 	ll	s3,7264(zero)
     f74:	c01380bf 	ll	s3,-32577(zero)
     f78:	f30004bf 	0xf30004bf
     f7c:	009f5401 	0x9f5401
     f80:	00000000 	nop
     f84:	1c000000 	bgtz	zero,f88 <_mem_avail_start-0x7ffff078>
     f88:	dcbfc011 	ldc3	$31,-16367(a1)
     f8c:	01bfc011 	0x1bfc011
     f90:	11dc6200 	beq	t6,gp,19794 <_mem_avail_start-0x7ffe686c>
     f94:	11ecbfc0 	beq	t7,t4,ffff0e98 <_text_end+0x403ef120>
     f98:	0004bfc0 	sll	s7,a0,0x1f
     f9c:	9f5501f3 	0x9f5501f3
     fa0:	bfc011ec 	cache	0x0,4588(s8)
     fa4:	bfc01380 	cache	0x0,4992(s8)
     fa8:	00620001 	0x620001
     fac:	00000000 	nop
     fb0:	1c000000 	bgtz	zero,fb4 <_mem_avail_start-0x7ffff04c>
     fb4:	b0bfc011 	0xb0bfc011
     fb8:	06bfc011 	0x6bfc011
     fbc:	80008200 	lb	zero,-32256(zero)
     fc0:	b09f1c00 	0xb09f1c00
     fc4:	dcbfc011 	ldc3	$31,-16367(a1)
     fc8:	07bfc011 	0x7bfc011
     fcc:	f3008200 	0xf3008200
     fd0:	9f1c5401 	0x9f1c5401
     fd4:	bfc011dc 	cache	0x0,4572(s8)
     fd8:	bfc011ec 	cache	0x0,4588(s8)
     fdc:	01f30008 	0x1f30008
     fe0:	5401f355 	bnel	zero,at,ffffdd38 <_text_end+0x403fbfc0>
     fe4:	11ec9f1c 	beq	t7,t4,fffe8c58 <_text_end+0x403e6ee0>
     fe8:	131cbfc0 	beq	t8,gp,ffff0eec <_text_end+0x403ef174>
     fec:	0006bfc0 	sll	s7,a2,0x1f
     ff0:	00800082 	0x800082
     ff4:	131c9f1c 	beq	t8,gp,fffe8c68 <_text_end+0x403e6ef0>
     ff8:	1380bfc0 	beqz	gp,ffff0efc <_text_end+0x403ef184>
     ffc:	0007bfc0 	sll	s7,a3,0x1f
    1000:	01f30082 	0x1f30082
    1004:	009f1c54 	0x9f1c54
    1008:	00000000 	nop
    100c:	1c000000 	bgtz	zero,1010 <_mem_avail_start-0x7fffeff0>
    1010:	30bfc011 	andi	ra,a1,0xc011
    1014:	01bfc011 	0x1bfc011
    1018:	11306000 	beq	t1,s0,1901c <_mem_avail_start-0x7ffe6fe4>
    101c:	1140bfc0 	beqz	t2,ffff0f20 <_text_end+0x403ef1a8>
    1020:	0001bfc0 	sll	s7,at,0x1f
    1024:	c0114053 	ll	s1,16467(zero)
    1028:	c01150bf 	ll	s1,20671(zero)
    102c:	730003bf 	sdbbp	0xc000e
    1030:	11509f7c 	beq	t2,s0,fffe8e24 <_text_end+0x403e70ac>
    1034:	1174bfc0 	beq	t3,s4,ffff0f38 <_text_end+0x403ef1c0>
    1038:	0001bfc0 	sll	s7,at,0x1f
    103c:	c0117453 	ll	s1,29779(zero)
    1040:	c011acbf 	ll	s1,-21313(zero)
    1044:	610001bf 	0x610001bf
    1048:	bfc011ec 	cache	0x0,4588(s8)
    104c:	bfc011f4 	cache	0x0,4596(s8)
    1050:	00610001 	movt	zero,v1,$fcc0
    1054:	00000000 	nop
    1058:	3c000000 	lui	zero,0x0
    105c:	4cbfc011 	0x4cbfc011
    1060:	06bfc011 	0x6bfc011
    1064:	1bacf200 	0x1bacf200
	...
    1070:	a4000000 	sh	zero,0(zero)
    1074:	acbfc011 	sw	ra,-16367(a1)
    1078:	01bfc011 	0x1bfc011
    107c:	11ec5700 	beq	t7,t4,16c80 <_mem_avail_start-0x7ffe9380>
    1080:	11f4bfc0 	beq	t7,s4,ffff0f84 <_text_end+0x403ef20c>
    1084:	0001bfc0 	sll	s7,at,0x1f
    1088:	00000057 	0x57
    108c:	00000000 	nop
    1090:	c0119000 	ll	s1,-28672(zero)
    1094:	c011a4bf 	ll	s1,-23361(zero)
    1098:	f20006bf 	0xf20006bf
    109c:	00001bac 	0x1bac
	...
    10a8:	c0120c00 	ll	s2,3072(zero)
    10ac:	c012b0bf 	ll	s2,-20289(zero)
    10b0:	620001bf 	0x620001bf
	...
    10bc:	bfc0120c 	cache	0x0,4620(s8)
    10c0:	bfc012b0 	cache	0x0,4784(s8)
    10c4:	00600001 	movf	zero,v1,$fcc0
    10c8:	00000000 	nop
    10cc:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    10d0:	20bfc012 	addi	ra,a1,-16366
    10d4:	02bfc012 	0x2bfc012
    10d8:	209f4700 	addi	ra,a0,18176
    10dc:	2cbfc012 	sltiu	ra,a1,-16366
    10e0:	01bfc012 	0x1bfc012
    10e4:	123c5200 	beq	s1,gp,158e8 <_mem_avail_start-0x7ffea718>
    10e8:	1268bfc0 	beq	s3,t0,ffff0fec <_text_end+0x403ef274>
    10ec:	0001bfc0 	sll	s7,at,0x1f
    10f0:	c0126852 	ll	s2,26706(zero)
    10f4:	c01288bf 	ll	s2,-30529(zero)
    10f8:	630001bf 	0x630001bf
    10fc:	bfc0129c 	cache	0x0,4764(s8)
    1100:	bfc012b0 	cache	0x0,4784(s8)
    1104:	00630001 	0x630001
    1108:	00000000 	nop
    110c:	0c000000 	jal	0 <_mem_avail_start-0x80000000>
    1110:	1cbfc012 	0x1cbfc012
    1114:	01bfc013 	0x1bfc013
    1118:	131c6000 	beq	t8,gp,1911c <_mem_avail_start-0x7ffe6ee4>
    111c:	1380bfc0 	beqz	gp,ffff1020 <_text_end+0x403ef2a8>
    1120:	0004bfc0 	sll	s7,a0,0x1f
    1124:	9f5401f3 	0x9f5401f3
	...
    1130:	bfc0120c 	cache	0x0,4620(s8)
    1134:	bfc0131c 	cache	0x0,4892(s8)
    1138:	00820006 	srlv	zero,v0,a0
    113c:	9f1c0080 	0x9f1c0080
    1140:	bfc0131c 	cache	0x0,4892(s8)
    1144:	bfc01380 	cache	0x0,4992(s8)
    1148:	00820007 	srav	zero,v0,a0
    114c:	1c5401f3 	0x1c5401f3
    1150:	0000009f 	0x9f
    1154:	00000000 	nop
    1158:	c0120c00 	ll	s2,3072(zero)
    115c:	c01220bf 	ll	s2,8383(zero)
    1160:	600001bf 	0x600001bf
    1164:	bfc01220 	cache	0x0,4640(s8)
    1168:	bfc01230 	cache	0x0,4656(s8)
    116c:	30530001 	andi	s3,v0,0x1
    1170:	44bfc012 	0x44bfc012
    1174:	03bfc012 	0x3bfc012
    1178:	9f7e7300 	0x9f7e7300
    117c:	bfc01244 	cache	0x0,4676(s8)
    1180:	bfc01268 	cache	0x0,4712(s8)
    1184:	68530001 	0x68530001
    1188:	b0bfc012 	0xb0bfc012
    118c:	01bfc012 	0x1bfc012
    1190:	00006100 	sll	t4,zero,0x4
    1194:	00000000 	nop
    1198:	129c0000 	beq	s4,gp,119c <_mem_avail_start-0x7fffee64>
    119c:	12b0bfc0 	beq	s5,s0,ffff10a0 <_text_end+0x403ef328>
    11a0:	0001bfc0 	sll	s7,at,0x1f
    11a4:	00000057 	0x57
    11a8:	00000000 	nop
    11ac:	c0128400 	ll	s2,-31744(zero)
    11b0:	c0129cbf 	ll	s2,-25409(zero)
    11b4:	f20006bf 	0xf20006bf
    11b8:	00001c67 	0x1c67
	...
    11c4:	c0122c00 	ll	s2,11264(zero)
    11c8:	c0123cbf 	ll	s2,15551(zero)
    11cc:	f20006bf 	0xf20006bf
    11d0:	00001c67 	0x1c67
	...
    11dc:	c012c400 	ll	s2,-15360(zero)
    11e0:	c01370bf 	ll	s3,28863(zero)
    11e4:	620001bf 	0x620001bf
	...
    11f0:	bfc012c4 	cache	0x0,4804(s8)
    11f4:	bfc0131c 	cache	0x0,4892(s8)
    11f8:	1c600001 	bgtz	v1,1200 <_mem_avail_start-0x7fffee00>
    11fc:	70bfc013 	0x70bfc013
    1200:	04bfc013 	0x4bfc013
    1204:	5401f300 	bnel	zero,at,ffffde08 <_text_end+0x403fc090>
    1208:	0000009f 	0x9f
    120c:	00000000 	nop
    1210:	c012c400 	ll	s2,-15360(zero)
    1214:	c012d8bf 	ll	s2,-10049(zero)
    1218:	470002bf 	c1	0x10002bf
    121c:	c012d89f 	ll	s2,-10081(zero)
    1220:	c012e4bf 	ll	s2,-6977(zero)
    1224:	520001bf 	beqzl	s0,1924 <_mem_avail_start-0x7fffe6dc>
    1228:	bfc012f4 	cache	0x0,4852(s8)
    122c:	bfc0131c 	cache	0x0,4892(s8)
    1230:	1c520001 	0x1c520001
    1234:	40bfc013 	0x40bfc013
    1238:	01bfc013 	0x1bfc013
    123c:	13546100 	beq	k0,s4,19640 <_mem_avail_start-0x7ffe69c0>
    1240:	1370bfc0 	beq	k1,s0,ffff1144 <_text_end+0x403ef3cc>
    1244:	0001bfc0 	sll	s7,at,0x1f
    1248:	00000061 	0x61
    124c:	00000000 	nop
    1250:	c012c400 	ll	s2,-15360(zero)
    1254:	c0131cbf 	ll	s3,7359(zero)
    1258:	600001bf 	0x600001bf
    125c:	bfc0131c 	cache	0x0,4892(s8)
    1260:	bfc01380 	cache	0x0,4992(s8)
    1264:	01f30004 	sllv	zero,s3,t7
    1268:	00009f54 	0x9f54
    126c:	00000000 	nop
    1270:	12c40000 	beq	s6,a0,1274 <_mem_avail_start-0x7fffed8c>
    1274:	131cbfc0 	beq	t8,gp,ffff1178 <_text_end+0x403ef400>
    1278:	0006bfc0 	sll	s7,a2,0x1f
    127c:	00800082 	0x800082
    1280:	131c9f1c 	beq	t8,gp,fffe8ef4 <_text_end+0x403e717c>
    1284:	1380bfc0 	beqz	gp,ffff1188 <_text_end+0x403ef410>
    1288:	0007bfc0 	sll	s7,a3,0x1f
    128c:	01f30082 	0x1f30082
    1290:	009f1c54 	0x9f1c54
    1294:	00000000 	nop
    1298:	c4000000 	lwc1	$f0,0(zero)
    129c:	d8bfc012 	ldc2	$31,-16366(a1)
    12a0:	01bfc012 	0x1bfc012
    12a4:	12d86000 	beq	s6,t8,192a8 <_mem_avail_start-0x7ffe6d58>
    12a8:	12e8bfc0 	beq	s7,t0,ffff11ac <_text_end+0x403ef434>
    12ac:	0001bfc0 	sll	s7,at,0x1f
    12b0:	c012e853 	ll	s2,-6061(zero)
    12b4:	c012fcbf 	ll	s2,-833(zero)
    12b8:	730003bf 	sdbbp	0xc000e
    12bc:	12fc9f7f 	beq	s7,gp,fffe90bc <_text_end+0x403e7344>
    12c0:	131cbfc0 	beq	t8,gp,ffff11c4 <_text_end+0x403ef44c>
    12c4:	0001bfc0 	sll	s7,at,0x1f
    12c8:	c0131c53 	ll	s3,7251(zero)
    12cc:	c01370bf 	ll	s3,28863(zero)
    12d0:	600001bf 	0x600001bf
	...
    12dc:	bfc01354 	cache	0x0,4948(s8)
    12e0:	bfc01370 	cache	0x0,4976(s8)
    12e4:	00570001 	0x570001
    12e8:	00000000 	nop
    12ec:	3c000000 	lui	zero,0x0
    12f0:	54bfc013 	bnel	a1,ra,ffff1340 <_text_end+0x403ef5c8>
    12f4:	06bfc013 	0x6bfc013
    12f8:	1d20f200 	bgtz	t1,ffffdafc <_text_end+0x403fbd84>
    12fc:	00000000 	nop
    1300:	00000000 	nop
    1304:	e4000000 	swc1	$f0,0(zero)
    1308:	f4bfc012 	sdc1	$f31,-16366(a1)
    130c:	06bfc012 	0x6bfc012
    1310:	1d20f200 	bgtz	t1,ffffdb14 <_text_end+0x403fbd9c>
    1314:	00000000 	nop
    1318:	00000000 	nop
    131c:	74000000 	jalx	0 <_mem_avail_start-0x80000000>
    1320:	80bfc014 	lb	ra,-16364(a1)
    1324:	06bfc014 	0x6bfc014
    1328:	20049e00 	addi	a0,zero,-25088
    132c:	00bff0f0 	tge	a1,ra,0x3c3
    1330:	00000000 	nop
    1334:	60000000 	0x60000000
    1338:	6cbfc014 	0x6cbfc014
    133c:	01bfc014 	0x1bfc014
    1340:	00005400 	sll	t2,zero,0x10
    1344:	00000000 	nop
    1348:	14600000 	bnez	v1,134c <_mem_avail_start-0x7fffecb4>
    134c:	146cbfc0 	bne	v1,t4,ffff1250 <_text_end+0x403ef4d8>
    1350:	0006bfc0 	sll	s7,a2,0x1f
    1354:	f010049e 	0xf010049e
    1358:	0000bff0 	tge	zero,zero,0x2ff
    135c:	00000000 	nop
    1360:	144c0000 	bne	v0,t4,1364 <_mem_avail_start-0x7fffec9c>
    1364:	1458bfc0 	bne	v0,t8,ffff1268 <_text_end+0x403ef4f0>
    1368:	0001bfc0 	sll	s7,at,0x1f
    136c:	00000054 	0x54
    1370:	00000000 	nop
    1374:	c0144c00 	ll	s4,19456(zero)
    1378:	c01458bf 	ll	s4,22719(zero)
    137c:	9e0006bf 	0x9e0006bf
    1380:	f0f00004 	0xf0f00004
    1384:	000000bf 	0xbf
    1388:	00000000 	nop
    138c:	c0140400 	ll	s4,1024(zero)
    1390:	c01414bf 	ll	s4,5311(zero)
    1394:	300002bf 	andi	zero,zero,0x2bf
    1398:	c014149f 	ll	s4,5279(zero)
    139c:	c0141cbf 	ll	s4,7359(zero)
    13a0:	740006bf 	jalx	1afc <_mem_avail_start-0x7fffe504>
    13a4:	1aff0800 	0x1aff0800
    13a8:	c0141c9f 	ll	s4,7327(zero)
    13ac:	c0142cbf 	ll	s4,11455(zero)
    13b0:	75000ebf 	jalx	4003afc <_mem_avail_start-0x7bffc504>
    13b4:	1aff0800 	0x1aff0800
    13b8:	00742438 	0x742438
    13bc:	211aff08 	addi	k0,t0,-248
    13c0:	c014309f 	ll	s4,12447(zero)
    13c4:	c01438bf 	ll	s4,14527(zero)
    13c8:	540001bf 	bnezl	zero,1ac8 <_mem_avail_start-0x7fffe538>
    13cc:	bfc01438 	cache	0x0,5176(s8)
    13d0:	bfc01440 	cache	0x0,5184(s8)
    13d4:	0072000b 	movn	zero,v1,s2
    13d8:	481aff08 	0x481aff08
    13dc:	21007424 	addi	zero,t0,29732
    13e0:	0000009f 	0x9f
    13e4:	00000000 	nop
    13e8:	c013f800 	ll	s3,-2048(zero)
    13ec:	c013fcbf 	ll	s3,-833(zero)
    13f0:	540001bf 	bnezl	zero,1af0 <_mem_avail_start-0x7fffe510>
    13f4:	00000000 	nop
    13f8:	00000000 	nop
    13fc:	bfc013f8 	cache	0x0,5112(s8)
    1400:	bfc013fc 	cache	0x0,5116(s8)
    1404:	049e0006 	0x49e0006
    1408:	bfd03000 	cache	0x10,12288(s8)
	...
    1414:	bfc0138c 	cache	0x0,5004(s8)
    1418:	bfc01398 	cache	0x0,5016(s8)
    141c:	81090003 	lb	t1,3(t0)
    1420:	0000009f 	0x9f
    1424:	00000000 	nop
    1428:	c0138c00 	ll	s3,-29696(zero)
    142c:	c01398bf 	ll	s3,-26433(zero)
    1430:	9e0006bf 	0x9e0006bf
    1434:	d0300804 	0xd0300804
    1438:	000000bf 	0xbf
    143c:	00000000 	nop
    1440:	c0139800 	ll	s3,-26624(zero)
    1444:	c013a0bf 	ll	s3,-24385(zero)
    1448:	090003bf 	j	4000efc <_mem_avail_start-0x7bfff104>
    144c:	00009f80 	sll	s3,zero,0x1e
    1450:	00000000 	nop
    1454:	13980000 	beq	gp,t8,1458 <_mem_avail_start-0x7fffeba8>
    1458:	13a0bfc0 	beqz	sp,ffff135c <_text_end+0x403ef5e4>
    145c:	0006bfc0 	sll	s7,a2,0x1f
    1460:	300c049e 	andi	t4,zero,0x49e
    1464:	0000bfd0 	0xbfd0
    1468:	00000000 	nop
    146c:	13a00000 	beqz	sp,1470 <_mem_avail_start-0x7fffeb90>
    1470:	13a8bfc0 	beq	sp,t0,ffff1374 <_text_end+0x403ef5fc>
    1474:	0003bfc0 	sll	s7,v1,0x1f
    1478:	009f3608 	0x9f3608
    147c:	00000000 	nop
    1480:	a0000000 	sb	zero,0(zero)
    1484:	a8bfc013 	swl	ra,-16365(a1)
    1488:	06bfc013 	0x6bfc013
    148c:	00049e00 	sll	s3,a0,0x18
    1490:	00bfd030 	tge	a1,ra,0x340
    1494:	00000000 	nop
    1498:	b0000000 	0xb0000000
    149c:	b4bfc013 	0xb4bfc013
    14a0:	02bfc013 	0x2bfc013
    14a4:	009f3300 	0x9f3300
    14a8:	00000000 	nop
    14ac:	b0000000 	0xb0000000
    14b0:	b4bfc013 	0xb4bfc013
    14b4:	06bfc013 	0x6bfc013
    14b8:	0c049e00 	jal	127800 <_mem_avail_start-0x7fed8800>
    14bc:	00bfd030 	tge	a1,ra,0x340
    14c0:	00000000 	nop
    14c4:	a8000000 	swl	zero,0(zero)
    14c8:	b0bfc013 	0xb0bfc013
    14cc:	02bfc013 	0x2bfc013
    14d0:	009f3000 	0x9f3000
    14d4:	00000000 	nop
    14d8:	a8000000 	swl	zero,0(zero)
    14dc:	b0bfc013 	0xb0bfc013
    14e0:	06bfc013 	0x6bfc013
    14e4:	04049e00 	0x4049e00
    14e8:	00bfd030 	tge	a1,ra,0x340
    14ec:	00000000 	nop
    14f0:	b4000000 	0xb4000000
    14f4:	b8bfc013 	swr	ra,-16365(a1)
    14f8:	02bfc013 	0x2bfc013
    14fc:	009f3000 	0x9f3000
    1500:	00000000 	nop
    1504:	b4000000 	0xb4000000
    1508:	b8bfc013 	swr	ra,-16365(a1)
    150c:	06bfc013 	0x6bfc013
    1510:	10049e00 	beq	zero,a0,fffe8d14 <_text_end+0x403e6f9c>
    1514:	00bfd030 	tge	a1,ra,0x340
    1518:	00000000 	nop
    151c:	b8000000 	swr	zero,0(zero)
    1520:	bcbfc013 	cache	0x1f,-16365(a1)
    1524:	02bfc013 	0x2bfc013
    1528:	009f3000 	0x9f3000
    152c:	00000000 	nop
    1530:	b8000000 	swr	zero,0(zero)
    1534:	bcbfc013 	cache	0x1f,-16365(a1)
    1538:	06bfc013 	0x6bfc013
    153c:	04049e00 	0x4049e00
    1540:	00bfd030 	tge	a1,ra,0x340
	...
    1550:	01000000 	0x1000000
    1554:	00005500 	sll	t2,zero,0x14
	...
    1564:	00010000 	sll	zero,at,0x0
    1568:	00000054 	0x54
	...
    1578:	54000100 	bnezl	zero,197c <_mem_avail_start-0x7fffe684>
    157c:	00000000 	nop
    1580:	00000000 	nop
    1584:	bfc01380 	cache	0x0,4992(s8)
    1588:	bfc01384 	cache	0x0,4996(s8)
    158c:	00540001 	movf	zero,v0,$fcc5
	...
    159c:	01000000 	0x1000000
    15a0:	00005500 	sll	t2,zero,0x14
	...
    15b0:	00010000 	sll	zero,at,0x0
    15b4:	00000054 	0x54
	...
    15c4:	55000100 	bnezl	t0,19c8 <_mem_avail_start-0x7fffe638>
    15c8:	00000000 	nop
	...
    15d8:	00540001 	movf	zero,v0,$fcc5
	...
    15e8:	01000000 	0x1000000
    15ec:	00005500 	sll	t2,zero,0x14
	...
    15fc:	00010000 	sll	zero,at,0x0
    1600:	00000054 	0x54
    1604:	00000000 	nop
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	0000004c 	syscall	0x1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	00000002 	srl	zero,zero,0x0
   8:	00040000 	sll	zero,a0,0x0
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
   c:	00000000 	nop
  10:	bfc00450 	cache	0x0,1104(s8)
  14:	00000020 	add	zero,zero,zero
  18:	bfc00470 	cache	0x0,1136(s8)
  1c:	0000004c 	syscall	0x1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:6
}
  20:	bfc004bc 	cache	0x0,1212(s8)
  24:	0000006c 	0x6c
strchr():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
    if (s < d && s + n > d) {
  28:	bfc00528 	cache	0x0,1320(s8)
strcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  2c:	00000058 	0x58
strncpy():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  30:	bfc00580 	cache	0x0,1408(s8)
memcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:330
        s += n, d += n;
  34:	00000120 	0x120
  38:	bfc006a0 	cache	0x0,1696(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  3c:	000000c8 	0xc8
strncmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  40:	bfc00768 	cache	0x0,1896(s8)
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  44:	000002e0 	0x2e0
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	0000001c 	0x1c
  54:	0a500002 	j	9400008 <_mem_avail_start-0x76bffff8>
  58:	00040000 	sll	zero,a0,0x0
  5c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	bfc00000 	cache	0x0,0(s8)
  64:	00000450 	0x450
	...
  70:	00000044 	0x44
  74:	0a760002 	j	9d80008 <_mem_avail_start-0x7627fff8>
  78:	00040000 	sll	zero,a0,0x0
  7c:	00000000 	nop
  80:	bfc00a48 	cache	0x0,2632(s8)
  84:	000000c8 	0xc8
  88:	00000000 	nop
  8c:	0000000c 	syscall
  90:	00000000 	nop
  94:	0000000c 	syscall
  98:	bfc00b10 	cache	0x0,2832(s8)
  9c:	00000098 	0x98
  a0:	bfc00ba8 	cache	0x0,2984(s8)
  a4:	00000068 	0x68
  a8:	bfc00c10 	cache	0x0,3088(s8)
  ac:	000000b4 	teq	zero,zero,0x2
	...
  b8:	0000001c 	0x1c
  bc:	0fe60002 	jal	f980008 <_mem_avail_start-0x7067fff8>
  c0:	00040000 	sll	zero,a0,0x0
  c4:	00000000 	nop
  c8:	bfc00cc4 	cache	0x0,3268(s8)
  cc:	00000224 	0x224
	...
  d8:	0000001c 	0x1c
  dc:	11ac0002 	beq	t5,t4,e8 <_mem_avail_start-0x7fffff18>
  e0:	00040000 	sll	zero,a0,0x0
  e4:	00000000 	nop
  e8:	bfc00ee8 	cache	0x0,3816(s8)
  ec:	000000d8 	0xd8
	...
  f8:	0000007c 	0x7c
  fc:	12fa0002 	beq	s7,k0,108 <_mem_avail_start-0x7ffffef8>
 100:	00040000 	sll	zero,a0,0x0
	...
 10c:	00000020 	add	zero,zero,zero
 110:	00000000 	nop
 114:	00000028 	0x28
 118:	00000000 	nop
 11c:	00000024 	and	zero,zero,zero
 120:	00000000 	nop
 124:	00000034 	teq	zero,zero
 128:	00000000 	nop
 12c:	00000030 	tge	zero,zero
 130:	00000000 	nop
 134:	00000044 	0x44
 138:	00000000 	nop
 13c:	0000002c 	0x2c
 140:	00000000 	nop
 144:	00000028 	0x28
 148:	bfc00fc0 	cache	0x0,4032(s8)
 14c:	00000024 	and	zero,zero,zero
 150:	bfc00fe4 	cache	0x0,4068(s8)
 154:	0000002c 	0x2c
 158:	00000000 	nop
 15c:	00000070 	tge	zero,zero,0x1
 160:	00000000 	nop
 164:	00000040 	ssnop
 168:	00000000 	nop
 16c:	0000000c 	syscall
	...
 178:	00000024 	and	zero,zero,zero
 17c:	17140002 	bne	t8,s4,188 <_mem_avail_start-0x7ffffe78>
 180:	00040000 	sll	zero,a0,0x0
 184:	00000000 	nop
 188:	bfc01010 	cache	0x0,4112(s8)
 18c:	00000060 	0x60
 190:	bfc01070 	cache	0x0,4208(s8)
 194:	00000030 	tge	zero,zero
	...
 1a0:	0000001c 	0x1c
 1a4:	18640002 	0x18640002
 1a8:	00040000 	sll	zero,a0,0x0
 1ac:	00000000 	nop
 1b0:	bfc010a0 	cache	0x0,4256(s8)
 1b4:	0000002c 	0x2c
	...
 1c0:	00000024 	and	zero,zero,zero
 1c4:	191a0002 	0x191a0002
 1c8:	00040000 	sll	zero,a0,0x0
	...
 1d4:	00000028 	0x28
 1d8:	bfc010cc 	cache	0x0,4300(s8)
 1dc:	000002b4 	teq	zero,zero,0xa
	...
 1e8:	0000008c 	syscall	0x2
 1ec:	1ee20002 	0x1ee20002
 1f0:	00040000 	sll	zero,a0,0x0
	...
 1fc:	0000000c 	syscall
 200:	00000000 	nop
 204:	0000000c 	syscall
 208:	bfc01380 	cache	0x0,4992(s8)
 20c:	0000000c 	syscall
 210:	00000000 	nop
 214:	0000000c 	syscall
 218:	00000000 	nop
 21c:	0000000c 	syscall
 220:	00000000 	nop
 224:	0000000c 	syscall
 228:	00000000 	nop
 22c:	0000000c 	syscall
 230:	00000000 	nop
 234:	0000000c 	syscall
 238:	bfc0138c 	cache	0x0,5004(s8)
 23c:	00000038 	0x38
 240:	bfc013c4 	cache	0x0,5060(s8)
 244:	00000020 	add	zero,zero,zero
 248:	bfc013e4 	cache	0x0,5092(s8)
 24c:	00000020 	add	zero,zero,zero
 250:	bfc01404 	cache	0x0,5124(s8)
 254:	00000048 	0x48
 258:	bfc0144c 	cache	0x0,5196(s8)
 25c:	00000014 	0x14
 260:	bfc01460 	cache	0x0,5216(s8)
 264:	00000014 	0x14
 268:	bfc01474 	cache	0x0,5236(s8)
 26c:	00000014 	0x14
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	bfc00614 	cache	0x0,1556(s8)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	bfc00618 	cache	0x0,1560(s8)
   8:	bfc00620 	cache	0x0,1568(s8)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
   c:	bfc00624 	cache	0x0,1572(s8)
  10:	bfc00630 	cache	0x0,1584(s8)
  14:	bfc0066c 	cache	0x0,1644(s8)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:6
}
  20:	bfc00920 	cache	0x0,2336(s8)
  24:	bfc0092c 	cache	0x0,2348(s8)
strchr():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
    if (s < d && s + n > d) {
  28:	bfc0095c 	cache	0x0,2396(s8)
strcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  2c:	bfc00970 	cache	0x0,2416(s8)
	...
memcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:330
        s += n, d += n;
  38:	bfc009d0 	cache	0x0,2512(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  3c:	bfc009d4 	cache	0x0,2516(s8)
strncmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  40:	bfc009dc 	cache	0x0,2524(s8)
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  44:	bfc00a40 	cache	0x0,2624(s8)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	bfc00450 	cache	0x0,1104(s8)
  54:	bfc00470 	cache	0x0,1136(s8)
  58:	bfc00470 	cache	0x0,1136(s8)
  5c:	bfc004bc 	cache	0x0,1212(s8)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	bfc004bc 	cache	0x0,1212(s8)
  64:	bfc00528 	cache	0x0,1320(s8)
  68:	bfc00528 	cache	0x0,1320(s8)
  6c:	bfc00580 	cache	0x0,1408(s8)
  70:	bfc00580 	cache	0x0,1408(s8)
  74:	bfc006a0 	cache	0x0,1696(s8)
  78:	bfc006a0 	cache	0x0,1696(s8)
  7c:	bfc00768 	cache	0x0,1896(s8)
  80:	bfc00768 	cache	0x0,1896(s8)
  84:	bfc00a48 	cache	0x0,2632(s8)
	...
  90:	bfc00b18 	cache	0x0,2840(s8)
  94:	bfc00b1c 	cache	0x0,2844(s8)
  98:	bfc00b38 	cache	0x0,2872(s8)
  9c:	bfc00b60 	cache	0x0,2912(s8)
	...
  a8:	bfc00bb0 	cache	0x0,2992(s8)
  ac:	bfc00bb4 	cache	0x0,2996(s8)
  b0:	bfc00bc4 	cache	0x0,3012(s8)
  b4:	bfc00bfc 	cache	0x0,3068(s8)
	...
  c0:	bfc00bb0 	cache	0x0,2992(s8)
  c4:	bfc00bb4 	cache	0x0,2996(s8)
  c8:	bfc00bc4 	cache	0x0,3012(s8)
  cc:	bfc00bc8 	cache	0x0,3016(s8)
  d0:	bfc00bcc 	cache	0x0,3020(s8)
  d4:	bfc00bf4 	cache	0x0,3060(s8)
	...
  e0:	bfc00a48 	cache	0x0,2632(s8)
  e4:	bfc00b10 	cache	0x0,2832(s8)
  e8:	00000001 	movf	zero,zero,$fcc0
  ec:	00000001 	movf	zero,zero,$fcc0
  f0:	00000001 	movf	zero,zero,$fcc0
  f4:	00000001 	movf	zero,zero,$fcc0
  f8:	bfc00b10 	cache	0x0,2832(s8)
  fc:	bfc00ba8 	cache	0x0,2984(s8)
 100:	bfc00ba8 	cache	0x0,2984(s8)
 104:	bfc00c10 	cache	0x0,3088(s8)
 108:	bfc00c10 	cache	0x0,3088(s8)
 10c:	bfc00cc4 	cache	0x0,3268(s8)
	...
 118:	bfc00cfc 	cache	0x0,3324(s8)
 11c:	bfc00d00 	cache	0x0,3328(s8)
 120:	bfc00d84 	cache	0x0,3460(s8)
 124:	bfc00d94 	cache	0x0,3476(s8)
 128:	bfc00ed0 	cache	0x0,3792(s8)
 12c:	bfc00ee0 	cache	0x0,3808(s8)
	...
 138:	bfc00d80 	cache	0x0,3456(s8)
 13c:	bfc00d84 	cache	0x0,3460(s8)
 140:	bfc00dac 	cache	0x0,3500(s8)
 144:	bfc00db4 	cache	0x0,3508(s8)
 148:	bfc00e08 	cache	0x0,3592(s8)
 14c:	bfc00e18 	cache	0x0,3608(s8)
 150:	bfc00e24 	cache	0x0,3620(s8)
 154:	bfc00e34 	cache	0x0,3636(s8)
 158:	bfc00e3c 	cache	0x0,3644(s8)
 15c:	bfc00e78 	cache	0x0,3704(s8)
 160:	bfc00e80 	cache	0x0,3712(s8)
 164:	bfc00e84 	cache	0x0,3716(s8)
 168:	bfc00e8c 	cache	0x0,3724(s8)
 16c:	bfc00e94 	cache	0x0,3732(s8)
 170:	bfc00e9c 	cache	0x0,3740(s8)
 174:	bfc00ea0 	cache	0x0,3744(s8)
 178:	bfc00ea4 	cache	0x0,3748(s8)
 17c:	bfc00ec8 	cache	0x0,3784(s8)
	...
 188:	bfc00cc4 	cache	0x0,3268(s8)
 18c:	bfc00ee8 	cache	0x0,3816(s8)
	...
 198:	bfc00ee8 	cache	0x0,3816(s8)
 19c:	bfc00fc0 	cache	0x0,4032(s8)
	...
 1a8:	00000001 	movf	zero,zero,$fcc0
 1ac:	00000001 	movf	zero,zero,$fcc0
 1b0:	00000001 	movf	zero,zero,$fcc0
 1b4:	00000001 	movf	zero,zero,$fcc0
 1b8:	00000001 	movf	zero,zero,$fcc0
 1bc:	00000001 	movf	zero,zero,$fcc0
 1c0:	00000001 	movf	zero,zero,$fcc0
 1c4:	00000001 	movf	zero,zero,$fcc0
 1c8:	00000001 	movf	zero,zero,$fcc0
 1cc:	00000001 	movf	zero,zero,$fcc0
 1d0:	00000001 	movf	zero,zero,$fcc0
 1d4:	00000001 	movf	zero,zero,$fcc0
 1d8:	00000001 	movf	zero,zero,$fcc0
 1dc:	00000001 	movf	zero,zero,$fcc0
 1e0:	00000001 	movf	zero,zero,$fcc0
 1e4:	00000001 	movf	zero,zero,$fcc0
 1e8:	bfc00fc0 	cache	0x0,4032(s8)
 1ec:	bfc00fe4 	cache	0x0,4068(s8)
 1f0:	bfc00fe4 	cache	0x0,4068(s8)
 1f4:	bfc01010 	cache	0x0,4112(s8)
 1f8:	00000001 	movf	zero,zero,$fcc0
 1fc:	00000001 	movf	zero,zero,$fcc0
 200:	00000001 	movf	zero,zero,$fcc0
 204:	00000001 	movf	zero,zero,$fcc0
 208:	00000001 	movf	zero,zero,$fcc0
 20c:	00000001 	movf	zero,zero,$fcc0
	...
 218:	bfc01028 	cache	0x0,4136(s8)
 21c:	bfc0102c 	cache	0x0,4140(s8)
 220:	bfc01050 	cache	0x0,4176(s8)
 224:	bfc01068 	cache	0x0,4200(s8)
	...
 230:	bfc01010 	cache	0x0,4112(s8)
 234:	bfc01070 	cache	0x0,4208(s8)
 238:	bfc01070 	cache	0x0,4208(s8)
 23c:	bfc010a0 	cache	0x0,4256(s8)
	...
 248:	bfc010a0 	cache	0x0,4256(s8)
 24c:	bfc010cc 	cache	0x0,4300(s8)
	...
 258:	bfc0111c 	cache	0x0,4380(s8)
 25c:	bfc01150 	cache	0x0,4432(s8)
 260:	bfc01158 	cache	0x0,4440(s8)
 264:	bfc011ac 	cache	0x0,4524(s8)
	...
 270:	bfc0111c 	cache	0x0,4380(s8)
 274:	bfc01120 	cache	0x0,4384(s8)
 278:	bfc01128 	cache	0x0,4392(s8)
 27c:	bfc01130 	cache	0x0,4400(s8)
 280:	bfc01140 	cache	0x0,4416(s8)
 284:	bfc0114c 	cache	0x0,4428(s8)
	...
 290:	bfc01158 	cache	0x0,4440(s8)
 294:	bfc01160 	cache	0x0,4448(s8)
 298:	bfc01168 	cache	0x0,4456(s8)
 29c:	bfc01174 	cache	0x0,4468(s8)
 2a0:	bfc01180 	cache	0x0,4480(s8)
 2a4:	bfc011ac 	cache	0x0,4524(s8)
	...
 2b0:	bfc0115c 	cache	0x0,4444(s8)
 2b4:	bfc01160 	cache	0x0,4448(s8)
 2b8:	bfc0116c 	cache	0x0,4460(s8)
 2bc:	bfc01174 	cache	0x0,4468(s8)
 2c0:	bfc01190 	cache	0x0,4496(s8)
 2c4:	bfc01194 	cache	0x0,4500(s8)
 2c8:	bfc01198 	cache	0x0,4504(s8)
 2cc:	bfc011a4 	cache	0x0,4516(s8)
	...
 2d8:	bfc011ac 	cache	0x0,4524(s8)
 2dc:	bfc011b0 	cache	0x0,4528(s8)
 2e0:	bfc0120c 	cache	0x0,4620(s8)
 2e4:	bfc01244 	cache	0x0,4676(s8)
 2e8:	bfc0124c 	cache	0x0,4684(s8)
 2ec:	bfc012a8 	cache	0x0,4776(s8)
	...
 2f8:	bfc011ac 	cache	0x0,4524(s8)
 2fc:	bfc011b0 	cache	0x0,4528(s8)
 300:	bfc0124c 	cache	0x0,4684(s8)
 304:	bfc01254 	cache	0x0,4692(s8)
 308:	bfc0125c 	cache	0x0,4700(s8)
 30c:	bfc01268 	cache	0x0,4712(s8)
 310:	bfc01274 	cache	0x0,4724(s8)
 314:	bfc012a8 	cache	0x0,4776(s8)
	...
 320:	bfc01250 	cache	0x0,4688(s8)
 324:	bfc01254 	cache	0x0,4692(s8)
 328:	bfc01260 	cache	0x0,4704(s8)
 32c:	bfc01268 	cache	0x0,4712(s8)
 330:	bfc01284 	cache	0x0,4740(s8)
 334:	bfc01288 	cache	0x0,4744(s8)
 338:	bfc0128c 	cache	0x0,4748(s8)
 33c:	bfc01294 	cache	0x0,4756(s8)
 340:	bfc01298 	cache	0x0,4760(s8)
 344:	bfc0129c 	cache	0x0,4764(s8)
	...
 350:	bfc0120c 	cache	0x0,4620(s8)
 354:	bfc01210 	cache	0x0,4624(s8)
 358:	bfc01218 	cache	0x0,4632(s8)
 35c:	bfc01220 	cache	0x0,4640(s8)
 360:	bfc01230 	cache	0x0,4656(s8)
 364:	bfc0123c 	cache	0x0,4668(s8)
	...
 370:	bfc011b0 	cache	0x0,4528(s8)
 374:	bfc011bc 	cache	0x0,4540(s8)
 378:	bfc012c4 	cache	0x0,4804(s8)
 37c:	bfc012fc 	cache	0x0,4860(s8)
 380:	bfc01304 	cache	0x0,4868(s8)
 384:	bfc01360 	cache	0x0,4960(s8)
	...
 390:	bfc011b0 	cache	0x0,4528(s8)
 394:	bfc011bc 	cache	0x0,4540(s8)
 398:	bfc01304 	cache	0x0,4868(s8)
 39c:	bfc0130c 	cache	0x0,4876(s8)
 3a0:	bfc01310 	cache	0x0,4880(s8)
 3a4:	bfc0131c 	cache	0x0,4892(s8)
 3a8:	bfc01328 	cache	0x0,4904(s8)
 3ac:	bfc01360 	cache	0x0,4960(s8)
	...
 3b8:	bfc01308 	cache	0x0,4872(s8)
 3bc:	bfc0130c 	cache	0x0,4876(s8)
 3c0:	bfc01314 	cache	0x0,4884(s8)
 3c4:	bfc0131c 	cache	0x0,4892(s8)
 3c8:	bfc0133c 	cache	0x0,4924(s8)
 3cc:	bfc01340 	cache	0x0,4928(s8)
 3d0:	bfc01344 	cache	0x0,4932(s8)
 3d4:	bfc0134c 	cache	0x0,4940(s8)
 3d8:	bfc01350 	cache	0x0,4944(s8)
 3dc:	bfc01354 	cache	0x0,4948(s8)
	...
 3e8:	bfc012c4 	cache	0x0,4804(s8)
 3ec:	bfc012c8 	cache	0x0,4808(s8)
 3f0:	bfc012d0 	cache	0x0,4816(s8)
 3f4:	bfc012d8 	cache	0x0,4824(s8)
 3f8:	bfc012e8 	cache	0x0,4840(s8)
 3fc:	bfc012f4 	cache	0x0,4852(s8)
	...
 408:	00000001 	movf	zero,zero,$fcc0
 40c:	00000001 	movf	zero,zero,$fcc0
 410:	bfc010cc 	cache	0x0,4300(s8)
 414:	bfc01380 	cache	0x0,4992(s8)
	...
 420:	bfc013a8 	cache	0x0,5032(s8)
 424:	bfc013ac 	cache	0x0,5036(s8)
 428:	bfc013b0 	cache	0x0,5040(s8)
 42c:	bfc013b4 	cache	0x0,5044(s8)
	...
 438:	00000001 	movf	zero,zero,$fcc0
 43c:	00000001 	movf	zero,zero,$fcc0
 440:	00000001 	movf	zero,zero,$fcc0
 444:	00000001 	movf	zero,zero,$fcc0
 448:	bfc01380 	cache	0x0,4992(s8)
 44c:	bfc0138c 	cache	0x0,5004(s8)
 450:	00000001 	movf	zero,zero,$fcc0
 454:	00000001 	movf	zero,zero,$fcc0
 458:	00000001 	movf	zero,zero,$fcc0
 45c:	00000001 	movf	zero,zero,$fcc0
 460:	00000001 	movf	zero,zero,$fcc0
 464:	00000001 	movf	zero,zero,$fcc0
 468:	00000001 	movf	zero,zero,$fcc0
 46c:	00000001 	movf	zero,zero,$fcc0
 470:	00000001 	movf	zero,zero,$fcc0
 474:	00000001 	movf	zero,zero,$fcc0
 478:	bfc0138c 	cache	0x0,5004(s8)
 47c:	bfc013c4 	cache	0x0,5060(s8)
 480:	bfc013c4 	cache	0x0,5060(s8)
 484:	bfc013e4 	cache	0x0,5092(s8)
 488:	bfc013e4 	cache	0x0,5092(s8)
 48c:	bfc01404 	cache	0x0,5124(s8)
 490:	bfc01404 	cache	0x0,5124(s8)
 494:	bfc0144c 	cache	0x0,5196(s8)
 498:	bfc0144c 	cache	0x0,5196(s8)
 49c:	bfc01460 	cache	0x0,5216(s8)
 4a0:	bfc01460 	cache	0x0,5216(s8)
 4a4:	bfc01474 	cache	0x0,5236(s8)
 4a8:	bfc01474 	cache	0x0,5236(s8)
 4ac:	bfc01488 	cache	0x0,5256(s8)
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	000001d9 	0x1d9
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	00830002 	0x830002
   8:	01010000 	0x1010000
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
   c:	000d0efb 	0xd0efb
  10:	01010101 	0x1010101
  14:	01000000 	0x1000000
  18:	69010000 	0x69010000
  1c:	756c636e 	jalx	5b18db8 <_mem_avail_start-0x7a4e7248>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:6
}
  20:	00006564 	0x6564
  24:	746f6f62 	jalx	1bdbd88 <_mem_avail_start-0x7e424278>
strchr():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
    if (s < d && s + n > d) {
  28:	64616f6c 	0x64616f6c
strcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  2c:	632e7265 	0x632e7265
strncpy():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  30:	00007070 	tge	zero,zero,0x1c1
memcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:330
        s += n, d += n;
  34:	6f630000 	0x6f630000
  38:	6e6f6d6d 	0x6e6f6d6d
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  3c:	0100682e 	0x100682e
strncmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  40:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  44:	746e6964 	jalx	1b9a590 <_mem_avail_start-0x7e465a70>
  48:	0100682e 	0x100682e
  4c:	6c650000 	0x6c650000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	00682e66 	0x682e66
  54:	6d000001 	0x6d000001
  58:	69686361 	0x69686361
  5c:	682e656e 	0x682e656e
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00000100 	sll	zero,zero,0x4
  64:	69647473 	0x69647473
  68:	00682e6f 	0x682e6f
  6c:	73000001 	maddu	t8,zero
  70:	6e697274 	0x6e697274
  74:	00682e67 	0x682e67
  78:	6d000001 	0x6d000001
  7c:	726f6d65 	0x726f6d65
  80:	65745f79 	0x65745f79
  84:	682e7473 	0x682e7473
  88:	00000100 	sll	zero,zero,0x4
  8c:	02050000 	0x2050000
  90:	bfc00450 	cache	0x0,1104(s8)
  94:	14011303 	bne	zero,at,4ca4 <_mem_avail_start-0x7fffb35c>
  98:	4b494b4b 	c2	0x1494b4b
  9c:	08021383 	j	84e0c <_mem_avail_start-0x7ff7b1f4>
  a0:	00010100 	sll	zero,at,0x4
  a4:	04700205 	bltzal	v1,8bc <_mem_avail_start-0x7ffff744>
  a8:	1b03bfc0 	0x1b03bfc0
  ac:	83494b01 	lb	t1,19201(k0)
  b0:	bb834b49 	swr	v1,19273(gp)
  b4:	10028383 	beq	zero,v0,fffe0ec4 <_text_end+0x403df14c>
  b8:	00010100 	sll	zero,at,0x4
  bc:	04bc0205 	0x4bc0205
  c0:	2303bfc0 	addi	v1,t8,-16448
  c4:	02001501 	0x2001501
  c8:	08060104 	j	180410 <_mem_avail_start-0x7fe7fbf0>
  cc:	0402003c 	bltzl	zero,1c0 <_mem_avail_start-0x7ffffe40>
  d0:	063c0803 	0x63c0803
  d4:	8387eebb 	lb	a3,-4421(gp)
  d8:	0014024c 	syscall	0x5009
  dc:	05000101 	bltz	t0,4e4 <_mem_avail_start-0x7ffffb1c>
  e0:	c0052802 	ll	a1,10242(zero)
  e4:	012e03bf 	0x12e03bf
  e8:	494c3d08 	0x494c3d08
  ec:	8848f34b 	lwl	t0,-3253(v0)
  f0:	08023a08 	j	8e820 <_mem_avail_start-0x7ff717e0>
  f4:	00010100 	sll	zero,at,0x4
  f8:	05800205 	bltz	t4,910 <_mem_avail_start-0x7ffff6f0>
  fc:	3903bfc0 	xori	v1,t0,0xbfc0
 100:	4d7f1501 	0x4d7f1501
 104:	83e70847 	lb	a3,2119(ra)
 108:	bcf34df4 	cache	0x13,19956(a3)
 10c:	4c80be4d 	0x4c80be4d
 110:	45854e48 	0x45854e48
 114:	bb494d4c 	swr	t1,19788(k0)
 118:	4b4c3e08 	c2	0x14c3e08
 11c:	79034cb9 	0x79034cb9
 120:	820b03f2 	lb	t3,1010(s0)
 124:	0028024b 	0x28024b
 128:	05000101 	bltz	t0,530 <_mem_avail_start-0x7ffffad0>
 12c:	c006a002 	ll	a2,-24574(zero)
 130:	00df03bf 	0xdf03bf
 134:	4b491301 	c2	0x1491301
 138:	833d0849 	lb	sp,2121(t9)
 13c:	838384bc 	lb	v1,-31556(gp)
 140:	00af0884 	0xaf0884
 144:	bc030402 	cache	0x3,1026(zero)
 148:	02040200 	0x2040200
 14c:	04020083 	bltzl	zero,35c <_mem_avail_start-0x7ffffca4>
 150:	bd86b902 	cache	0x6,-18174(t4)
 154:	01002402 	0x1002402
 158:	02050001 	movt	zero,s0,$fcc1
 15c:	bfc00768 	cache	0x0,1896(s8)
 160:	0100f803 	0x100f803
 164:	7608484c 	jalx	8212130 <_mem_avail_start-0x77deded0>
 168:	bb84bc84 	swr	a0,-17276(gp)
 16c:	4b4983f3 	c2	0x14983f3
 170:	08bce708 	j	2f39c20 <_mem_avail_start-0x7d0c63e0>
 174:	f3bcbcae 	0xf3bcbcae
 178:	50bb7508 	beql	a1,k1,1d59c <_mem_avail_start-0x7ffe2a64>
 17c:	020083f4 	teq	s0,zero,0x20f
 180:	f2060304 	0xf2060304
 184:	02040200 	0x2040200
 188:	0200bb06 	0x200bb06
 18c:	03490204 	0x3490204
 190:	88be8279 	lwl	s8,-32135(a1)
 194:	4884bc85 	0x4884bc85
 198:	bbbb844c 	swr	k1,-31668(sp)
 19c:	0388bcbb 	0x388bcbb
 1a0:	5a03ba22 	0x5a03ba22
 1a4:	83012802 	lb	at,10242(t8)
 1a8:	838383bc 	lb	v1,-31812(gp)
 1ac:	bc8383bc 	cache	0x3,-31812(a0)
 1b0:	1703bb84 	bne	t8,v1,fffeefc4 <_text_end+0x403ed24c>
 1b4:	826c034a 	lb	t4,842(s3)
 1b8:	4a78038a 	c2	0x78038a
 1bc:	03515084 	0x3515084
 1c0:	84834a73 	lh	v1,19059(a0)
 1c4:	02008483 	0x2008483
 1c8:	3f080304 	0x3f080304
 1cc:	02040200 	0x2040200
 1d0:	04020083 	bltzl	zero,3e0 <_mem_avail_start-0x7ffffc20>
 1d4:	8386b902 	lb	a2,-18174(gp)
 1d8:	01000802 	0x1000802
 1dc:	00009301 	0x9301
 1e0:	28000200 	slti	zero,zero,512
 1e4:	01000000 	0x1000000
 1e8:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 1ec:	01010100 	0x1010100
 1f0:	00000001 	movf	zero,zero,$fcc0
 1f4:	01000001 	movf	zero,t0,$fcc0
 1f8:	6c697475 	0x6c697475
 1fc:	00797469 	0x797469
 200:	61747300 	0x61747300
 204:	70757472 	0x70757472
 208:	0100532e 	0x100532e
 20c:	00000000 	nop
 210:	00000205 	0x205
 214:	8319bfc0 	lb	t9,-16448(t8)
 218:	4a0a034b 	c2	0xa034b
 21c:	85834d4b 	lh	v1,19787(t4)
 220:	4d4b4d4b 	0x4d4b4d4b
 224:	834b834c 	lb	t3,-31924(k0)
 228:	4b4b4b4d 	c2	0x14b4b4d
 22c:	4b834d4b 	c2	0x1834d4b
 230:	84024b4b 	lh	v0,19275(zero)
 234:	034b1802 	0x34b1802
 238:	03fc020b 	0x3fc020b
 23c:	834b4c01 	lb	t3,19457(k0)
 240:	4b4b4b4d 	c2	0x14b4b4d
 244:	4b4b4b4b 	c2	0x14b4b4b
 248:	4b4b4b4b 	c2	0x14b4b4b
 24c:	4b4b4b4b 	c2	0x14b4b4b
 250:	4b4b4b4b 	c2	0x14b4b4b
 254:	4b4b4b4b 	c2	0x14b4b4b
 258:	4b4b4b4b 	c2	0x14b4b4b
 25c:	4c4b4b4b 	0x4c4b4b4b
 260:	4b4b4b4b 	c2	0x14b4b4b
 264:	4b4b4b4b 	c2	0x14b4b4b
 268:	4c4b4c4b 	0x4c4b4c4b
 26c:	024b4b4b 	0x24b4b4b
 270:	01010004 	sllv	zero,at,t0
 274:	00000159 	0x159
 278:	00870002 	0x870002
 27c:	01010000 	0x1010000
 280:	000d0efb 	0xd0efb
 284:	01010101 	0x1010101
 288:	01000000 	0x1000000
 28c:	75010000 	jalx	4040000 <_mem_avail_start-0x7bfc0000>
 290:	696c6974 	0x696c6974
 294:	69007974 	0x69007974
 298:	756c636e 	jalx	5b18db8 <_mem_avail_start-0x7a4e7248>
 29c:	00006564 	0x6564
 2a0:	6e69616d 	0x6e69616d
 2a4:	0100632e 	0x100632e
 2a8:	6f630000 	0x6f630000
 2ac:	6e6f6d6d 	0x6e6f6d6d
 2b0:	0200682e 	0x200682e
 2b4:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 2b8:	746e6964 	jalx	1b9a590 <_mem_avail_start-0x7e465a70>
 2bc:	0200682e 	0x200682e
 2c0:	616d0000 	0x616d0000
 2c4:	6e696863 	0x6e696863
 2c8:	00682e65 	0x682e65
 2cc:	65000002 	0x65000002
 2d0:	70656378 	0x70656378
 2d4:	6e6f6974 	0x6e6f6974
 2d8:	0200682e 	0x200682e
 2dc:	74730000 	jalx	1cc0000 <_mem_avail_start-0x7e340000>
 2e0:	2e6f6964 	sltiu	t7,s3,26980
 2e4:	00020068 	0x20068
 2e8:	72747300 	0x72747300
 2ec:	2e676e69 	sltiu	a3,s3,28265
 2f0:	00020068 	0x20068
 2f4:	6f6f6200 	0x6f6f6200
 2f8:	72747374 	0x72747374
 2fc:	682e7061 	0x682e7061
 300:	00000200 	sll	zero,zero,0x8
 304:	02050000 	0x2050000
 308:	bfc00a48 	cache	0x0,2632(s8)
 30c:	bc010a03 	cache	0x1,2563(zero)
 310:	45c18484 	0x45c18484
 314:	454f454f 	0x454f454f
 318:	83864787 	lb	a2,18311(gp)
 31c:	8385f5f3 	lb	a1,-2573(gp)
 320:	b7b8c183 	0xb7b8c183
 324:	000802bf 	0x802bf
 328:	05000101 	bltz	t0,730 <_mem_avail_start-0x7ffff8d0>
 32c:	00000002 	srl	zero,zero,0x0
 330:	012b0300 	0x12b0300
 334:	08024f14 	j	93c50 <_mem_avail_start-0x7ff6c3b0>
 338:	00010100 	sll	zero,at,0x4
 33c:	00000205 	0x205
 340:	34030000 	li	v1,0x0
 344:	024f1401 	0x24f1401
 348:	01010008 	0x1010008
 34c:	10020500 	beq	zero,v0,1750 <_mem_avail_start-0x7fffe8b0>
 350:	03bfc00b 	movn	t8,sp,ra
 354:	4884013d 	0x4884013d
 358:	4b833c08 	c2	0x1833c08
 35c:	04020049 	bltzl	zero,484 <_mem_avail_start-0x7ffffb7c>
 360:	02004b03 	0x2004b03
 364:	3b080304 	xori	t0,t8,0x304
 368:	13280285 	beq	t9,t0,d80 <_mem_avail_start-0x7ffff280>
 36c:	01002002 	0x1002002
 370:	02050001 	movt	zero,s0,$fcc1
 374:	bfc00ba8 	cache	0x0,2984(s8)
 378:	0100c403 	0x100c403
 37c:	03820c03 	0x3820c03
 380:	03ba4a74 	teq	sp,k0,0x129
 384:	75034a0c 	jalx	40d2830 <_mem_avail_start-0x7bf2d7d0>
 388:	0402004a 	bltzl	zero,4b4 <_mem_avail_start-0x7ffffb4c>
 38c:	02004c03 	0x2004c03
 390:	09030304 	j	40c0c10 <_mem_avail_start-0x7bf3f3f0>
 394:	02003c08 	0x2003c08
 398:	75030304 	jalx	40c0c10 <_mem_avail_start-0x7bf3f3f0>
 39c:	0d033c08 	jal	40cf020 <_mem_avail_start-0x7bf30fe0>
 3a0:	00140282 	srl	zero,s4,0xa
 3a4:	05000101 	bltz	t0,7ac <_mem_avail_start-0x7ffff854>
 3a8:	c00c1002 	ll	t4,4098(zero)
 3ac:	00d403bf 	0xd403bf
 3b0:	4b49bb01 	c2	0x149bb01
 3b4:	83834b49 	lb	v1,19273(gp)
 3b8:	8483c1bb 	lh	v1,-15941(a0)
 3bc:	f25503b9 	0xf25503b9
 3c0:	844a2403 	lh	t2,9219(v0)
 3c4:	74085103 	jalx	21440c <_mem_avail_start-0x7fdebbf4>
 3c8:	bb4a2f03 	swr	t2,12035(k0)
 3cc:	01001002 	0x1001002
 3d0:	0000aa01 	0xaa01
 3d4:	1f000200 	bgtz	t8,bd8 <_mem_avail_start-0x7ffff428>
 3d8:	01000000 	0x1000000
 3dc:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 3e0:	01010100 	0x1010100
 3e4:	00000001 	movf	zero,zero,$fcc0
 3e8:	01000001 	movf	zero,t0,$fcc0
 3ec:	69727000 	0x69727000
 3f0:	2e66746e 	sltiu	a2,s3,29806
 3f4:	00000063 	0x63
 3f8:	05000000 	bltz	t0,3fc <_mem_avail_start-0x7ffffc04>
 3fc:	c00cc402 	ll	t4,-15358(zero)
 400:	038813bf 	0x38813bf
 404:	3c084a7a 	lui	t0,0x4a7a
 408:	c5034cf8 	lwc1	$f3,19704(t0)
 40c:	02004a00 	0x2004a00
 410:	bb030104 	swr	v1,260(t8)
 414:	cb034a7f 	lwc2	$3,19071(t8)
 418:	b803f200 	swr	v1,-3584(zero)
 41c:	0124027f 	0x124027f
 420:	02380386 	0x2380386
 424:	03520144 	0x3520144
 428:	7c08f240 	0x7c08f240
 42c:	82770383 	lb	s7,899(s3)
 430:	28021c03 	slti	v0,zero,7171
 434:	82640301 	lb	a0,769(s3)
 438:	4b88af08 	c2	0x188af08
 43c:	02040200 	0x2040200
 440:	034a6f03 	0x34a6f03
 444:	1403ba14 	bne	zero,v1,fffeec98 <_text_end+0x403ecf20>
 448:	82680382 	lb	t0,898(s3)
 44c:	03820903 	0x3820903
 450:	03bd8215 	0x3bd8215
 454:	4cf3826d 	0x4cf3826d
 458:	03bfc089 	0x3bfc089
 45c:	2603825e 	addiu	v1,s0,-32162
 460:	04020082 	bltzl	zero,66c <_mem_avail_start-0x7ffff994>
 464:	4a4e0301 	c2	0x4e0301
 468:	01040200 	0x1040200
 46c:	004a3403 	0x4a3403
 470:	08030402 	j	c1008 <_mem_avail_start-0x7ff3eff8>
 474:	f20b03ad 	0xf20b03ad
 478:	08028383 	j	a0e0c <_mem_avail_start-0x7ff5f1f4>
 47c:	76010100 	jalx	8040400 <_mem_avail_start-0x77fbfc00>
 480:	02000000 	0x2000000
 484:	00002200 	sll	a0,zero,0x8
 488:	fb010100 	sdc2	$1,256(t8)
 48c:	01000d0e 	0x1000d0e
 490:	00010101 	0x10101
 494:	00010000 	sll	zero,at,0x0
 498:	70000100 	0x70000100
 49c:	746e6972 	jalx	1b9a5c8 <_mem_avail_start-0x7e465a38>
 4a0:	65736162 	0x65736162
 4a4:	0000632e 	0x632e
 4a8:	00000000 	nop
 4ac:	0ee80205 	jal	ba00814 <_mem_avail_start-0x745ff7ec>
 4b0:	0813bfc0 	j	4eff00 <_mem_avail_start-0x7fb10100>
 4b4:	02004fac 	0x2004fac
 4b8:	82060104 	lb	a2,260(s0)
 4bc:	004b8406 	0x4b8406
 4c0:	03010402 	0x3010402
 4c4:	0200ba78 	0x200ba78
 4c8:	0c030104 	jal	c0410 <_mem_avail_start-0x7ff3fbf0>
 4cc:	02008a4a 	0x2008a4a
 4d0:	ba060204 	swr	a2,516(s0)
 4d4:	70038806 	0x70038806
 4d8:	00012402 	srl	a0,at,0x10
 4dc:	08030402 	j	c1008 <_mem_avail_start-0x7ff3eff8>
 4e0:	02008ab0 	tge	s0,zero,0x22a
 4e4:	82060104 	lb	a2,260(s0)
 4e8:	01040200 	0x1040200
 4ec:	02008306 	0x2008306
 4f0:	f2060404 	0xf2060404
 4f4:	01001002 	0x1001002
 4f8:	00017901 	0x17901
 4fc:	36000200 	ori	zero,s0,0x200
 500:	01000000 	0x1000000
 504:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 508:	01010100 	0x1010100
 50c:	00000001 	movf	zero,zero,$fcc0
 510:	01000001 	movf	zero,t0,$fcc0
 514:	692f2e2e 	0x692f2e2e
 518:	756c636e 	jalx	5b18db8 <_mem_avail_start-0x7a4e7248>
 51c:	00006564 	0x6564
 520:	69727473 	0x69727473
 524:	632e676e 	0x632e676e
 528:	00000000 	nop
 52c:	6d6d6f63 	0x6d6d6f63
 530:	682e6e6f 	0x682e6e6f
 534:	00000100 	sll	zero,zero,0x4
 538:	02050000 	0x2050000
 53c:	00000000 	nop
 540:	14010b03 	bne	zero,at,3150 <_mem_avail_start-0x7fffceb0>
 544:	08027808 	j	9e020 <_mem_avail_start-0x7ff61fe0>
 548:	00010100 	sll	zero,at,0x4
 54c:	00000205 	0x205
 550:	21030000 	addi	v1,t0,0
 554:	004b1301 	0x4b1301
 558:	06010402 	bgez	s0,1564 <_mem_avail_start-0x7fffea9c>
 55c:	7fbe0682 	0x7fbe0682
 560:	01000802 	0x1000802
 564:	02050001 	movt	zero,s0,$fcc1
 568:	00000000 	nop
 56c:	01013603 	0x1013603
 570:	0402004e 	bltzl	zero,6ac <_mem_avail_start-0x7ffff954>
 574:	40084b01 	0x40084b01
 578:	01000802 	0x1000802
 57c:	02050001 	movt	zero,s0,$fcc1
 580:	00000000 	nop
 584:	0100cc03 	0x100cc03
 588:	894b8301 	lwl	t3,-31999(t2)
 58c:	bb827a03 	swr	v0,31235(gp)
 590:	0008024c 	syscall	0x2009
 594:	05000101 	bltz	t0,99c <_mem_avail_start-0x7ffff664>
 598:	00000002 	srl	zero,zero,0x0
 59c:	00e70300 	0xe70300
 5a0:	02001601 	0x2001601
 5a4:	ba060104 	swr	a2,260(s0)
 5a8:	7e84bd06 	0x7e84bd06
 5ac:	01000802 	0x1000802
 5b0:	02050001 	movt	zero,s0,$fcc1
 5b4:	00000000 	nop
 5b8:	0100fe03 	0x100fe03
 5bc:	0402004b 	bltzl	zero,6ec <_mem_avail_start-0x7ffff914>
 5c0:	00820601 	0x820601
 5c4:	ba020402 	swr	v0,1026(s0)
 5c8:	7f83bd06 	0x7f83bd06
 5cc:	00080284 	0x80284
 5d0:	05000101 	bltz	t0,9d8 <_mem_avail_start-0x7ffff628>
 5d4:	00000002 	srl	zero,zero,0x0
 5d8:	018e0300 	0x18e0300
 5dc:	4bf81301 	c2	0x1f81301
 5e0:	85827a03 	lh	v0,31235(t4)
 5e4:	01000802 	0x1000802
 5e8:	02050001 	movt	zero,s0,$fcc1
 5ec:	00000000 	nop
 5f0:	0101a203 	0x101a203
 5f4:	7a03f913 	0x7a03f913
 5f8:	08028582 	j	a1608 <_mem_avail_start-0x7ff5e9f8>
 5fc:	00010100 	sll	zero,at,0x4
 600:	0fc00205 	jal	f000814 <_mem_avail_start-0x70fff7ec>
 604:	9003bfc0 	lbu	v1,-16448(zero)
 608:	86010102 	lh	at,258(s0)
 60c:	027e874b 	0x27e874b
 610:	01010008 	0x1010008
 614:	e4020500 	swc1	$f2,1280(zero)
 618:	03bfc00f 	0x3bfc00f
 61c:	010102ab 	0x10102ab
 620:	7e874b87 	0x7e874b87
 624:	01001002 	0x1001002
 628:	02050001 	movt	zero,s0,$fcc1
 62c:	00000000 	nop
 630:	0102c203 	0x102c203
 634:	4a7a0318 	c2	0x7a0318
 638:	884e8450 	lwl	t6,-31664(v0)
 63c:	01040200 	0x1040200
 640:	f3827403 	0xf3827403
 644:	f63d0883 	sdc1	$f29,2179(s1)
 648:	01001002 	0x1001002
 64c:	02050001 	movt	zero,s0,$fcc1
 650:	00000000 	nop
 654:	0102e503 	0x102e503
 658:	7a03894d 	0x7a03894d
 65c:	f43d0882 	sdc1	$f29,2178(at)
 660:	01000802 	0x1000802
 664:	02050001 	movt	zero,s0,$fcc1
 668:	00000000 	nop
 66c:	0102f103 	0x102f103
 670:	000c0213 	0xc0213
 674:	004f0101 	0x4f0101
 678:	00020000 	sll	zero,v0,0x0
 67c:	0000001d 	0x1d
 680:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 684:	0101000d 	break	0x101
 688:	00000101 	0x101
 68c:	00000100 	sll	zero,zero,0x4
 690:	75700001 	jalx	5c00004 <_mem_avail_start-0x7a3ffffc>
 694:	632e7374 	0x632e7374
 698:	00000000 	nop
 69c:	02050000 	0x2050000
 6a0:	bfc01010 	cache	0x0,4112(s8)
 6a4:	4e3c0813 	c3	0x3c0813
 6a8:	7a03c248 	0x7a03c248
 6ac:	83837408 	lb	v1,29704(gp)
 6b0:	00080283 	sra	zero,t0,0xa
 6b4:	05000101 	bltz	t0,abc <_mem_avail_start-0x7ffff544>
 6b8:	c0107002 	ll	s0,28674(zero)
 6bc:	010e03bf 	0x10e03bf
 6c0:	84838383 	lh	v1,-31869(a0)
 6c4:	01001002 	0x1001002
 6c8:	00005901 	0x5901
 6cc:	44000200 	0x44000200
 6d0:	01000000 	0x1000000
 6d4:	0d0efb01 	jal	43bec04 <_mem_avail_start-0x7bc413fc>
 6d8:	01010100 	0x1010100
 6dc:	00000001 	movf	zero,zero,$fcc0
 6e0:	01000001 	movf	zero,t0,$fcc0
 6e4:	692f2e2e 	0x692f2e2e
 6e8:	756c636e 	jalx	5b18db8 <_mem_avail_start-0x7a4e7248>
 6ec:	00006564 	0x6564
 6f0:	63747570 	0x63747570
 6f4:	2e726168 	sltiu	s2,s3,24936
 6f8:	00000063 	0x63
 6fc:	64747300 	0x64747300
 700:	2e746e69 	sltiu	s4,s3,28265
 704:	00010068 	0x10068
 708:	63616d00 	0x63616d00
 70c:	656e6968 	0x656e6968
 710:	0100682e 	0x100682e
 714:	00000000 	nop
 718:	10a00205 	beqz	a1,f30 <_mem_avail_start-0x7ffff0d0>
 71c:	f315bfc0 	0xf315bfc0
 720:	00140284 	0x140284
 724:	01410101 	0x1410101
 728:	00020000 	sll	zero,v0,0x0
 72c:	00000055 	0x55
 730:	0efb0101 	jal	bec0404 <_mem_avail_start-0x7413fbfc>
 734:	0101000d 	break	0x101
 738:	00000101 	0x101
 73c:	00000100 	sll	zero,zero,0x4
 740:	2f2e2e01 	sltiu	t6,t9,11777
 744:	6c636e69 	0x6c636e69
 748:	00656475 	0x656475
 74c:	6d656d00 	0x6d656d00
 750:	5f79726f 	0x5f79726f
 754:	74736574 	jalx	1cd95d0 <_mem_avail_start-0x7e326a30>
 758:	7070632e 	0x7070632e
 75c:	00000000 	nop
 760:	6d6d6f63 	0x6d6d6f63
 764:	682e6e6f 	0x682e6e6f
 768:	00000100 	sll	zero,zero,0x4
 76c:	6863616d 	0x6863616d
 770:	2e656e69 	sltiu	a1,s3,28265
 774:	00010068 	0x10068
 778:	64747300 	0x64747300
 77c:	682e6f69 	0x682e6f69
 780:	00000100 	sll	zero,zero,0x4
 784:	02050000 	0x2050000
 788:	00000000 	nop
 78c:	e5081315 	swc1	$f8,4885(t0)
 790:	01000802 	0x1000802
 794:	02050001 	movt	zero,s0,$fcc1
 798:	bfc010cc 	cache	0x0,4300(s8)
 79c:	4c012e03 	0x4c012e03
 7a0:	08b8f448 	j	2e3d120 <_mem_avail_start-0x7d1c2ee0>
 7a4:	52038476 	beql	s0,v1,fffe1980 <_text_end+0x403dfc08>
 7a8:	4a0c03ba 	c2	0xc03ba
 7ac:	4a72034c 	c2	0x72034c
 7b0:	bc821003 	cache	0x2,4099(a0)
 7b4:	034a6e03 	0x34a6e03
 7b8:	0349ba11 	0x349ba11
 7bc:	6503820b 	0x6503820b
 7c0:	4a15034a 	c2	0x15034a
 7c4:	65034e4c 	0x65034e4c
 7c8:	8219034a 	lb	t9,842(s0)
 7cc:	640383bc 	0x640383bc
 7d0:	4a1f0382 	c2	0x1f0382
 7d4:	034a6103 	0x34a6103
 7d8:	0383ba20 	0x383ba20
 7dc:	034ef216 	0x34ef216
 7e0:	012c0269 	0x12c0269
 7e4:	bc820c03 	cache	0x2,3075(a0)
 7e8:	03ba4e03 	0x3ba4e03
 7ec:	034c4a0c 	syscall	0xd3128
 7f0:	10034a72 	beq	zero,v1,131bc <_mem_avail_start-0x7ffece44>
 7f4:	6e03bc82 	0x6e03bc82
 7f8:	ba11034a 	swr	s1,842(s0)
 7fc:	820b0381 	lb	t3,897(s0)
 800:	034a6503 	0x34a6503
 804:	4e4c4a15 	c3	0x4c4a15
 808:	034a6503 	0x34a6503
 80c:	83bc8219 	lb	gp,-32231(sp)
 810:	03826403 	0x3826403
 814:	61034a1f 	0x61034a1f
 818:	821f034a 	lb	ra,842(s0)
 81c:	034a6103 	0x34a6103
 820:	03be4a20 	0x3be4a20
 824:	03848210 	0x3848210
 828:	0c03ba4a 	jal	ee928 <_mem_avail_start-0x7ff116d8>
 82c:	72034c4a 	0x72034c4a
 830:	8210034a 	lb	s0,842(s0)
 834:	4a6e03bc 	c2	0x6e03bc
 838:	81ba1103 	lb	k0,4355(t5)
 83c:	03820b03 	0x3820b03
 840:	17034a65 	bne	t8,v1,131d8 <_mem_avail_start-0x7ffece28>
 844:	65034e4a 	0x65034e4a
 848:	8219034a 	lb	t9,842(s0)
 84c:	6403bbbc 	0x6403bbbc
 850:	4a1f0382 	c2	0x1f0382
 854:	034a6103 	0x34a6103
 858:	6103821f 	0x6103821f
 85c:	4a20034a 	c2	0x20034a
 860:	140385bb 	bne	zero,v1,fffe1f50 <_text_end+0x403e01d8>
 864:	08028482 	j	a1208 <_mem_avail_start-0x7ff5edf8>
 868:	a9010100 	swl	at,256(t0)
 86c:	02000001 	movf	zero,s0,$fcc0
 870:	00005200 	sll	t2,zero,0x8
 874:	fb010100 	sdc2	$1,256(t8)
 878:	01000d0e 	0x1000d0e
 87c:	00010101 	0x10101
 880:	00010000 	sll	zero,at,0x0
 884:	2e2e0100 	sltiu	t6,s1,256
 888:	636e692f 	0x636e692f
 88c:	6564756c 	0x6564756c
 890:	616d0000 	0x616d0000
 894:	6e696863 	0x6e696863
 898:	70632e65 	0x70632e65
 89c:	00000070 	tge	zero,zero,0x1
 8a0:	6d6f6300 	0x6d6f6300
 8a4:	2e6e6f6d 	sltiu	t6,s3,28525
 8a8:	00010068 	0x10068
 8ac:	64747300 	0x64747300
 8b0:	2e746e69 	sltiu	s4,s3,28265
 8b4:	00010068 	0x10068
 8b8:	63616d00 	0x63616d00
 8bc:	656e6968 	0x656e6968
 8c0:	0100682e 	0x100682e
 8c4:	00000000 	nop
 8c8:	00000205 	0x205
 8cc:	1b030000 	0x1b030000
 8d0:	016a0301 	0x16a0301
 8d4:	024a1603 	0x24a1603
 8d8:	01010008 	0x1010008
 8dc:	00020500 	sll	zero,v0,0x14
 8e0:	03000000 	0x3000000
 8e4:	6a03011b 	0x6a03011b
 8e8:	4a160301 	c2	0x160301
 8ec:	01000802 	0x1000802
 8f0:	02050001 	movt	zero,s0,$fcc1
 8f4:	bfc01380 	cache	0x0,4992(s8)
 8f8:	03011b03 	0x3011b03
 8fc:	1603016a 	bne	s0,v1,ea8 <_mem_avail_start-0x7ffff158>
 900:	0008024a 	0x8024a
 904:	05000101 	bltz	t0,d0c <_mem_avail_start-0x7ffff2f4>
 908:	00000002 	srl	zero,zero,0x0
 90c:	011b0300 	0x11b0300
 910:	03016a03 	0x3016a03
 914:	08024a16 	j	92858 <_mem_avail_start-0x7ff6d7a8>
 918:	00010100 	sll	zero,at,0x4
 91c:	00000205 	0x205
 920:	1c030000 	0x1c030000
 924:	016f0301 	0x16f0301
 928:	024a1103 	0x24a1103
 92c:	01010008 	0x1010008
 930:	00020500 	sll	zero,v0,0x14
 934:	03000000 	0x3000000
 938:	6f03011c 	0x6f03011c
 93c:	4a110301 	c2	0x110301
 940:	01000802 	0x1000802
 944:	02050001 	movt	zero,s0,$fcc1
 948:	00000000 	nop
 94c:	03011c03 	0x3011c03
 950:	1103016f 	beq	t0,v1,f10 <_mem_avail_start-0x7ffff0f0>
 954:	0008024a 	0x8024a
 958:	05000101 	bltz	t0,d60 <_mem_avail_start-0x7ffff2a0>
 95c:	00000002 	srl	zero,zero,0x0
 960:	011c0300 	0x11c0300
 964:	03016f03 	0x3016f03
 968:	08024a11 	j	92844 <_mem_avail_start-0x7ff6d7bc>
 96c:	00010100 	sll	zero,at,0x4
 970:	138c0205 	beq	gp,t4,1188 <_mem_avail_start-0x7fffee78>
 974:	1e03bfc0 	0x1e03bfc0
 978:	016d0301 	0x16d0301
 97c:	30022103 	andi	v0,zero,0x2103
 980:	00080201 	0x80201
 984:	05000101 	bltz	t0,d8c <_mem_avail_start-0x7ffff274>
 988:	c013c402 	ll	s3,-15358(zero)
 98c:	012e03bf 	0x12e03bf
 990:	03015703 	0x3015703
 994:	5603822a 	bnel	s0,v1,fffe1240 <_text_end+0x403df4c8>
 998:	4a2c03ba 	c2	0x2c03ba
 99c:	01000802 	0x1000802
 9a0:	02050001 	movt	zero,s0,$fcc1
 9a4:	bfc013e4 	cache	0x0,5092(s8)
 9a8:	03013303 	0x3013303
 9ac:	2f030152 	sltiu	v1,t8,338
 9b0:	ba570382 	swr	s7,898(s2)
 9b4:	024a2b03 	0x24a2b03
 9b8:	01010008 	0x1010008
 9bc:	04020500 	bltzl	zero,1dc0 <_mem_avail_start-0x7fffe240>
 9c0:	03bfc014 	0x3bfc014
 9c4:	83840138 	lb	a0,312(gp)
 9c8:	4b4bb983 	c2	0x14bb983
 9cc:	024c4884 	0x24c4884
 9d0:	0101000c 	syscall	0x40400
 9d4:	4c020500 	0x4c020500
 9d8:	03bfc014 	0x3bfc014
 9dc:	030100c1 	0x30100c1
 9e0:	3803014a 	xori	v1,zero,0x14a
 9e4:	000802ba 	0x802ba
 9e8:	05000101 	bltz	t0,df0 <_mem_avail_start-0x7ffff210>
 9ec:	c0146002 	ll	s4,24578(zero)
 9f0:	00c503bf 	0xc503bf
 9f4:	01460301 	0x1460301
 9f8:	02ba3c03 	0x2ba3c03
 9fc:	01010008 	0x1010008
 a00:	74020500 	jalx	81400 <_mem_avail_start-0x7ff7ec00>
 a04:	03bfc014 	0x3bfc014
 a08:	030100c9 	0x30100c9
 a0c:	03017fbc 	0x3017fbc
 a10:	02ba00c6 	0x2ba00c6
 a14:	01010008 	0x1010008

Disassembly of section .debug_str:

00000000 <.debug_str>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	67676f74 	0x67676f74
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	6b5f656c 	0x6b5f656c
   8:	30676573 	andi	a3,v1,0x6573
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
   c:	6361635f 	0x6361635f
  10:	62616568 	0x62616568
  14:	74696c69 	jalx	1a5b1a4 <_mem_avail_start-0x7e5a4e5c>
  18:	74730079 	jalx	1cc01e4 <_mem_avail_start-0x7e33fe1c>
  1c:	5f747261 	0x5f747261
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:6
}
  20:	72646461 	0x72646461
  24:	30706300 	andi	s0,v1,0x6300
strchr():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
    if (s < d && s + n > d) {
  28:	6e6f635f 	0x6e6f635f
strcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  2c:	30676966 	andi	a3,v1,0x6966
strncpy():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  30:	706f6300 	0x706f6300
memcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:330
        s += n, d += n;
  34:	72665f79 	0x72665f79
  38:	665f6d6f 	0x665f6d6f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  3c:	6873616c 	0x6873616c
strncmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  40:	73657400 	0x73657400
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  44:	656d5f74 	0x656d5f74
  48:	79726f6d 	0x79726f6d
  4c:	735f6500 	0x735f6500
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	72747368 	0x72747368
  54:	0078646e 	0x78646e
  58:	31315a5f 	andi	s1,t1,0x5a5f
  5c:	74736574 	jalx	1cd95d0 <_mem_avail_start-0x7e326a30>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	6d656d5f 	0x6d656d5f
  64:	5079726f 	beql	v1,t9,1ca24 <_mem_avail_start-0x7ffe35dc>
  68:	005f5376 	tne	v0,ra,0x14d
  6c:	74736564 	jalx	1cd9590 <_mem_avail_start-0x7e326a70>
  70:	656d5f00 	0x656d5f00
  74:	74735f6d 	jalx	1cd7db4 <_mem_avail_start-0x7e32824c>
  78:	00747261 	0x747261
  7c:	504d5544 	beql	v0,t5,15590 <_mem_avail_start-0x7ffeaa70>
  80:	444f4d5f 	0x444f4d5f
  84:	5f650045 	0x5f650045
  88:	72746e65 	0x72746e65
  8c:	45440079 	0x45440079
  90:	45434956 	0x45434956
  94:	4d41525f 	0x4d41525f
  98:	61657200 	0x61657200
  9c:	65735f64 	0x65735f64
  a0:	6c616972 	0x6c616972
  a4:	726f775f 	0x726f775f
  a8:	68730064 	0x68730064
  ac:	2074726f 	addi	s4,v1,29295
  b0:	00746e69 	0x746e69
  b4:	657a6973 	0x657a6973
  b8:	7000745f 	0x7000745f
  bc:	6461705f 	0x6461705f
  c0:	65007264 	0x65007264
  c4:	616c665f 	0x616c665f
  c8:	65007367 	0x65007367
  cc:	63616d5f 	0x63616d5f
  d0:	656e6968 	0x656e6968
  d4:	705f6500 	0x705f6500
  d8:	746e6568 	jalx	1b995a0 <_mem_avail_start-0x7e466a60>
  dc:	657a6973 	0x657a6973
  e0:	6d656d00 	0x6d656d00
  e4:	00797063 	0x797063
  e8:	6c653031 	0x6c653031
  ec:	5f323366 	0x5f323366
  f0:	72646870 	0x72646870
  f4:	61657200 	0x61657200
  f8:	6f775f64 	0x6f775f64
  fc:	43006472 	c0	0x1006472
 100:	4b434548 	c2	0x1434548
 104:	4152535f 	0x4152535f
 108:	5f70004d 	0x5f70004d
 10c:	64646176 	0x64646176
 110:	5f700072 	0x5f700072
 114:	65707974 	0x65707974
 118:	6e697500 	0x6e697500
 11c:	745f3874 	jalx	17ce1d0 <_mem_avail_start-0x7e831e30>
 120:	315a5f00 	andi	k0,t2,0x5f00
 124:	616f6c34 	0x616f6c34
 128:	72665f64 	0x72665f64
 12c:	755f6d6f 	jalx	57db5bc <_mem_avail_start-0x7a824a44>
 130:	76747261 	jalx	9d1c984 <_mem_avail_start-0x762e367c>
 134:	756f6300 	jalx	5bd8c00 <_mem_avail_start-0x7a427400>
 138:	6c00746e 	0x6c00746e
 13c:	5f64616f 	0x5f64616f
 140:	6d6f7266 	0x6d6f7266
 144:	7261755f 	0x7261755f
 148:	5f650074 	0x5f650074
 14c:	6e656873 	0x6e656873
 150:	7a697374 	0x7a697374
 154:	79620065 	0x79620065
 158:	745f6574 	jalx	17d95d0 <_mem_avail_start-0x7e826a30>
 15c:	6f6f6200 	0x6f6f6200
 160:	5a5f006c 	0x5a5f006c
 164:	6f633531 	0x6f633531
 168:	665f7970 	0x665f7970
 16c:	5f6d6f72 	0x5f6d6f72
 170:	73616c66 	0x73616c66
 174:	00765068 	0x765068
 178:	79745f65 	0x79745f65
 17c:	65006570 	0x65006570
 180:	7972746e 	0x7972746e
 184:	6464615f 	0x6464615f
 188:	5f650072 	0x5f650072
 18c:	69736865 	0x69736865
 190:	5f00657a 	bgtzl	t8,1977c <_mem_avail_start-0x7ffe6884>
 194:	7435325a 	jalx	d4c968 <_mem_avail_start-0x7f2b3698>
 198:	6c67676f 	0x6c67676f
 19c:	736b5f65 	0x736b5f65
 1a0:	5f306765 	0x5f306765
 1a4:	68636163 	0x68636163
 1a8:	69626165 	0x69626165
 1ac:	7974696c 	0x7974696c
 1b0:	6f6c0062 	0x6f6c0062
 1b4:	6920676e 	0x6920676e
 1b8:	6c00746e 	0x6c00746e
 1bc:	5f747361 	0x5f747361
 1c0:	72646870 	0x72646870
 1c4:	756f7300 	jalx	5bdcc00 <_mem_avail_start-0x7a423400>
 1c8:	00656372 	tlt	v1,a1,0x18d
 1cc:	65765f65 	0x65765f65
 1d0:	6f697372 	0x6f697372
 1d4:	6572006e 	0x6572006e
 1d8:	735f6461 	0x735f6461
 1dc:	61697265 	0x61697265
 1e0:	656c006c 	0x656c006c
 1e4:	6874676e 	0x6874676e
 1e8:	736e7500 	0x736e7500
 1ec:	656e6769 	0x656e6769
 1f0:	68632064 	0x68632064
 1f4:	77007261 	jalx	c01c984 <_mem_avail_start-0x73fe367c>
 1f8:	65746972 	0x65746972
 1fc:	6765735f 	0x6765735f
 200:	746e656d 	jalx	1b995b4 <_mem_avail_start-0x7e466a4c>
 204:	695f6500 	0x695f6500
 208:	746e6564 	jalx	1b99590 <_mem_avail_start-0x7e466a70>
 20c:	6e697500 	0x6e697500
 210:	5f323374 	0x5f323374
 214:	69750074 	0x69750074
 218:	3631746e 	ori	s1,s1,0x746e
 21c:	7700745f 	jalx	c01d17c <_mem_avail_start-0x73fe2e84>
 220:	5f746961 	0x5f746961
 224:	5f726f66 	0x5f726f66
 228:	6967616d 	0x6967616d
 22c:	75700063 	jalx	5c0018c <_mem_avail_start-0x7a3ffe74>
 230:	62007374 	0x62007374
 234:	6c746f6f 	0x6c746f6f
 238:	6564616f 	0x6564616f
 23c:	70632e72 	0x70632e72
 240:	45440070 	0x45440070
 244:	45434956 	0x45434956
 248:	4d434f5f 	0x4d434f5f
 24c:	6e6d2f00 	0x6e6d2f00
 250:	2f632f74 	sltiu	v1,k1,12148
 254:	72657355 	0x72657355
 258:	61462f73 	0x61462f73
 25c:	726f7463 	0x726f7463
 260:	4e6c6169 	c3	0x6c6169
 264:	776f642f 	jalx	dbd90bc <_mem_avail_start-0x72426f44>
 268:	616f6c6e 	0x616f6c6e
 26c:	772f7364 	jalx	cbdcd90 <_mem_avail_start-0x73423270>
 270:	632f776f 	0x632f776f
 274:	3931646f 	xori	s1,t1,0x646f
 278:	31707267 	andi	s0,t3,0x7267
 27c:	756f522f 	jalx	5bd48bc <_mem_avail_start-0x7a42b744>
 280:	2d726574 	sltiu	s2,t3,25972
 284:	75626552 	jalx	5899548 <_mem_avail_start-0x7a766ab8>
 288:	2f646c69 	sltiu	a0,k1,27753
 28c:	76697254 	jalx	9a5c950 <_mem_avail_start-0x765a36b0>
 290:	4d6c6169 	0x4d6c6169
 294:	5f535049 	0x5f535049
 298:	74666f53 	jalx	199bd4c <_mem_avail_start-0x7e6642b4>
 29c:	65726177 	0x65726177
 2a0:	7070632f 	0x7070632f
 2a4:	665f7000 	0x665f7000
 2a8:	7367616c 	0x7367616c
 2ac:	554e4700 	bnel	t2,t6,11eb0 <_mem_avail_start-0x7ffee150>
 2b0:	2b2b4320 	slti	t3,t9,17184
 2b4:	37203131 	ori	zero,t9,0x3131
 2b8:	302e342e 	andi	t6,at,0x342e
 2bc:	656d2d20 	0x656d2d20
 2c0:	6d2d206c 	0x6d2d206c
 2c4:	676e6973 	0x676e6973
 2c8:	662d656c 	0x662d656c
 2cc:	74616f6c 	jalx	185bdb0 <_mem_avail_start-0x7e7a4250>
 2d0:	786d2d20 	0x786d2d20
 2d4:	20746f67 	addi	s4,v1,28519
 2d8:	6f6e6d2d 	0x6f6e6d2d
 2dc:	6962612d 	0x6962612d
 2e0:	6c6c6163 	0x6c6c6163
 2e4:	6d2d2073 	0x6d2d2073
 2e8:	64726168 	0x64726168
 2ec:	6f6c662d 	0x6f6c662d
 2f0:	2d207461 	sltiu	zero,t1,29793
 2f4:	7370696d 	0x7370696d
 2f8:	2d203233 	sltiu	zero,t1,12851
 2fc:	736c6c6d 	0x736c6c6d
 300:	6d2d2063 	0x6d2d2063
 304:	6c2d6f6e 	0x6c2d6f6e
 308:	2d316378 	sltiu	s1,t1,25464
 30c:	31637873 	andi	v1,t3,0x7873
 310:	6e6d2d20 	0x6e6d2d20
 314:	616d2d6f 	0x616d2d6f
 318:	20346464 	addi	s4,at,25700
 31c:	6f6e6d2d 	0x6f6e6d2d
 320:	6168732d 	0x6168732d
 324:	20646572 	addi	a0,v1,25970
 328:	62616d2d 	0x62616d2d
 32c:	32333d69 	andi	s3,s1,0x3d69
 330:	20672d20 	addi	a3,v1,11552
 334:	20734f2d 	addi	s3,v1,20269
 338:	6474732d 	0x6474732d
 33c:	2b2b633d 	slti	t3,t9,25405
 340:	2d203131 	sltiu	zero,t1,12593
 344:	6e756666 	0x6e756666
 348:	6f697463 	0x6f697463
 34c:	65732d6e 	0x65732d6e
 350:	6f697463 	0x6f697463
 354:	2d20736e 	sltiu	zero,t1,29550
 358:	74616466 	jalx	1859198 <_mem_avail_start-0x7e7a6e68>
 35c:	65732d61 	0x65732d61
 360:	6f697463 	0x6f697463
 364:	2d20736e 	sltiu	zero,t1,29550
 368:	65726666 	0x65726666
 36c:	61747365 	0x61747365
 370:	6e69646e 	0x6e69646e
 374:	662d2067 	0x662d2067
 378:	622d6f6e 	0x622d6f6e
 37c:	746c6975 	jalx	1b1a5d4 <_mem_avail_start-0x7e4e5a2c>
 380:	2d206e69 	sltiu	zero,t1,28265
 384:	2d6f6e66 	sltiu	t7,t3,28262
 388:	00454950 	0x454950
 38c:	6e697270 	0x6e697270
 390:	5f006674 	bgtzl	t8,19d64 <_mem_avail_start-0x7ffe629c>
 394:	5f6d656d 	0x5f6d656d
 398:	69617661 	0x69617661
 39c:	74735f6c 	jalx	1cd7db0 <_mem_avail_start-0x7e328250>
 3a0:	00747261 	0x747261
 3a4:	726f6873 	0x726f6873
 3a8:	6e752074 	0x6e752074
 3ac:	6e676973 	0x6e676973
 3b0:	69206465 	0x69206465
 3b4:	6500746e 	0x6500746e
 3b8:	6f68705f 	0x6f68705f
 3bc:	5f006666 	bgtzl	t8,19d58 <_mem_avail_start-0x7ffe62a8>
 3c0:	5f6d656d 	0x5f6d656d
 3c4:	00646e65 	0x646e65
 3c8:	62395a5f 	0x62395a5f
 3cc:	5f746f6f 	0x5f746f6f
 3d0:	72646461 	0x72646461
 3d4:	65007650 	0x65007650
 3d8:	6f68735f 	0x6f68735f
 3dc:	62006666 	0x62006666
 3e0:	5f746f6f 	0x5f746f6f
 3e4:	72646461 	0x72646461
 3e8:	63616300 	0x63616300
 3ec:	62616568 	0x62616568
 3f0:	6c00656c 	0x6c00656c
 3f4:	20676e6f 	addi	a3,v1,28271
 3f8:	69736e75 	0x69736e75
 3fc:	64656e67 	0x64656e67
 400:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 404:	315a5f00 	andi	k0,t2,0x5f00
 408:	65686333 	0x65686333
 40c:	6f5f6b63 	0x6f5f6b63
 410:	6c726576 	0x6c726576
 414:	76507061 	jalx	941c184 <_mem_avail_start-0x76be3e7c>
 418:	3031006a 	andi	s1,at,0x6a
 41c:	33666c65 	andi	a2,k1,0x6c65
 420:	68655f32 	0x68655f32
 424:	70007264 	0x70007264
 428:	66666f5f 	0x66666f5f
 42c:	00746573 	tltu	v1,s4,0x195
 430:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 434:	65735f65 	0x65735f65
 438:	6c616972 	0x6c616972
 43c:	315a5f00 	andi	k0,t2,0x5f00
 440:	69617734 	0x69617734
 444:	6f665f74 	0x6f665f74
 448:	616d5f72 	0x616d5f72
 44c:	76636967 	jalx	98da59c <_mem_avail_start-0x76725a64>
 450:	49415700 	0x49415700
 454:	4f425f54 	c3	0x1425f54
 458:	7000544f 	0x7000544f
 45c:	6d656d5f 	0x6d656d5f
 460:	70007a73 	0x70007a73
 464:	6c69665f 	0x6c69665f
 468:	007a7365 	0x7a7365
 46c:	68705f65 	0x68705f65
 470:	006d756e 	0x6d756e
 474:	73747570 	0x73747570
 478:	6e697274 	0x6e697274
 47c:	5f650067 	0x5f650067
 480:	756e6873 	jalx	5b9a1cc <_mem_avail_start-0x7a465e34>
 484:	6572006d 	0x6572006d
 488:	735f6461 	0x735f6461
 48c:	63746977 	0x63746977
 490:	00736568 	0x736568
 494:	49564544 	0x49564544
 498:	555f4543 	bnel	t2,ra,119a8 <_mem_avail_start-0x7ffee658>
 49c:	00545241 	0x545241
 4a0:	5f646e65 	0x5f646e65
 4a4:	72646461 	0x72646461
 4a8:	615f7000 	0x615f7000
 4ac:	6e67696c 	0x6e67696c
 4b0:	455a4200 	0x455a4200
 4b4:	4d5f4f52 	0x4d5f4f52
 4b8:	5f004d45 	bgtzl	t8,139d0 <_mem_avail_start-0x7ffec630>
 4bc:	5f6d656d 	0x5f6d656d
 4c0:	69617661 	0x69617661
 4c4:	6e655f6c 	0x6e655f6c
 4c8:	68630064 	0x68630064
 4cc:	5f6b6365 	0x5f6b6365
 4d0:	7265766f 	0x7265766f
 4d4:	0070616c 	0x70616c
 4d8:	49564544 	0x49564544
 4dc:	465f4543 	c1	0x5f4543
 4e0:	4853414c 	0x4853414c
 4e4:	69747500 	0x69747500
 4e8:	7974696c 	0x7974696c
 4ec:	6174732f 	0x6174732f
 4f0:	70757472 	0x70757472
 4f4:	2f00532e 	sltiu	zero,t8,21294
 4f8:	2f746e6d 	sltiu	s4,k1,28269
 4fc:	73552f63 	0x73552f63
 500:	2f737265 	sltiu	s3,k1,29285
 504:	74636146 	jalx	18d8518 <_mem_avail_start-0x7e727ae8>
 508:	6169726f 	0x6169726f
 50c:	642f4e6c 	0x642f4e6c
 510:	6c6e776f 	0x6c6e776f
 514:	7364616f 	0x7364616f
 518:	6972542f 	0x6972542f
 51c:	6c616976 	0x6c616976
 520:	5350494d 	beql	k0,s0,12a58 <_mem_avail_start-0x7ffed5a8>
 524:	666f535f 	0x666f535f
 528:	72617774 	0x72617774
 52c:	70632f65 	0x70632f65
 530:	4e470070 	c3	0x470070
 534:	53412055 	beql	k0,at,868c <_mem_avail_start-0x7fff7974>
 538:	332e3220 	andi	t6,t9,0x3220
 53c:	70630030 	0x70630030
 540:	61625f30 	0x61625f30
 544:	64617664 	0x64617664
 548:	45007264 	bc1f	1cedc <_mem_avail_start-0x7ffe3124>
 54c:	50454358 	beql	v0,a1,112b0 <_mem_avail_start-0x7ffeed50>
 550:	4e4f4954 	c3	0x4f4954
 554:	53454d5f 	beql	k0,a1,13ad4 <_mem_avail_start-0x7ffec52c>
 558:	45474153 	0x45474153
 55c:	70630053 	0x70630053
 560:	61635f30 	0x61635f30
 564:	00657375 	0x657375
 568:	6e697270 	0x6e697270
 56c:	6c745f74 	0x6c745f74
 570:	425f0062 	c0	0x5f0062
 574:	006c6f6f 	0x6c6f6f
 578:	5f307063 	0x5f307063
 57c:	00637065 	0x637065
 580:	69616d5f 	0x69616d5f
 584:	675f006e 	0x675f006e
 588:	635f7465 	0x635f7465
 58c:	65737561 	0x65737561
 590:	73625f00 	0x73625f00
 594:	72770073 	0x72770073
 598:	5f657469 	0x5f657469
 59c:	0064656c 	0x64656c
 5a0:	7465675f 	jalx	1959d7c <_mem_avail_start-0x7e6a6284>
 5a4:	6370655f 	0x6370655f
 5a8:	696e6900 	0x696e6900
 5ac:	65735f74 	0x65735f74
 5b0:	6c616972 	0x6c616972
 5b4:	73625f00 	0x73625f00
 5b8:	6e655f73 	0x6e655f73
 5bc:	656d0064 	0x656d0064
 5c0:	7465736d 	jalx	195cdb4 <_mem_avail_start-0x7e6a324c>
 5c4:	69727000 	0x69727000
 5c8:	745f746e 	jalx	17dd1b8 <_mem_avail_start-0x7e822e48>
 5cc:	66706172 	0x66706172
 5d0:	656d6172 	0x656d6172
 5d4:	30706300 	andi	s0,v1,0x6300
 5d8:	6174735f 	0x6174735f
 5dc:	00737574 	teq	v1,s3,0x1d5
 5e0:	65646f63 	0x65646f63
 5e4:	746e6500 	jalx	1b99400 <_mem_avail_start-0x7e466c00>
 5e8:	6c5f7972 	0x6c5f7972
 5ec:	00315f6f 	0x315f6f
 5f0:	6378655f 	0x6378655f
 5f4:	69747065 	0x69747065
 5f8:	685f6e6f 	0x685f6e6f
 5fc:	6c646e61 	0x6c646e61
 600:	70007265 	0x70007265
 604:	69646461 	0x69646461
 608:	6500676e 	0x6500676e
 60c:	7972746e 	0x7972746e
 610:	5f6f6c5f 	0x5f6f6c5f
 614:	4e470032 	c3	0x470032
 618:	31432055 	andi	v1,t2,0x2055
 61c:	2e372031 	sltiu	s7,s1,8241
 620:	20302e34 	addi	s0,at,11828
 624:	6c656d2d 	0x6c656d2d
 628:	736d2d20 	0x736d2d20
 62c:	6c676e69 	0x6c676e69
 630:	6c662d65 	0x6c662d65
 634:	2074616f 	addi	s4,v1,24943
 638:	67786d2d 	0x67786d2d
 63c:	2d20746f 	sltiu	zero,t1,29807
 640:	2d6f6e6d 	sltiu	t7,t3,28269
 644:	63696261 	0x63696261
 648:	736c6c61 	0x736c6c61
 64c:	686d2d20 	0x686d2d20
 650:	2d647261 	sltiu	a0,t3,29281
 654:	616f6c66 	0x616f6c66
 658:	6d2d2074 	0x6d2d2074
 65c:	33737069 	andi	s3,k1,0x7069
 660:	6d2d2032 	0x6d2d2032
 664:	63736c6c 	0x63736c6c
 668:	6e6d2d20 	0x6e6d2d20
 66c:	786c2d6f 	0x786c2d6f
 670:	732d3163 	0x732d3163
 674:	20316378 	addi	s1,at,25464
 678:	6f6e6d2d 	0x6f6e6d2d
 67c:	64616d2d 	0x64616d2d
 680:	2d203464 	sltiu	zero,t1,13412
 684:	2d6f6e6d 	sltiu	t7,t3,28269
 688:	72616873 	0x72616873
 68c:	2d206465 	sltiu	zero,t1,25701
 690:	6962616d 	0x6962616d
 694:	2032333d 	addi	s2,at,13117
 698:	2d20672d 	sltiu	zero,t1,26413
 69c:	2d20734f 	sltiu	zero,t1,29519
 6a0:	6e756666 	0x6e756666
 6a4:	6f697463 	0x6f697463
 6a8:	65732d6e 	0x65732d6e
 6ac:	6f697463 	0x6f697463
 6b0:	2d20736e 	sltiu	zero,t1,29550
 6b4:	74616466 	jalx	1859198 <_mem_avail_start-0x7e7a6e68>
 6b8:	65732d61 	0x65732d61
 6bc:	6f697463 	0x6f697463
 6c0:	2d20736e 	sltiu	zero,t1,29550
 6c4:	65726666 	0x65726666
 6c8:	61747365 	0x61747365
 6cc:	6e69646e 	0x6e69646e
 6d0:	662d2067 	0x662d2067
 6d4:	622d6f6e 	0x622d6f6e
 6d8:	746c6975 	jalx	1b1a5d4 <_mem_avail_start-0x7e4e5a2c>
 6dc:	2d206e69 	sltiu	zero,t1,28265
 6e0:	2d6f6e66 	sltiu	t7,t3,28262
 6e4:	00454950 	0x454950
 6e8:	5f737362 	0x5f737362
 6ec:	657a6973 	0x657a6973
 6f0:	30706300 	andi	s0,v1,0x6300
 6f4:	6162655f 	0x6162655f
 6f8:	65006573 	0x65006573
 6fc:	7972746e 	0x7972746e
 700:	0069685f 	0x69685f
 704:	6c697475 	0x6c697475
 708:	2f797469 	sltiu	t9,k1,29801
 70c:	6e69616d 	0x6e69616d
 710:	7200632e 	0x7200632e
 714:	6c757365 	0x6c757365
 718:	73610074 	0x73610074
 71c:	74726573 	jalx	1c995cc <_mem_avail_start-0x7e366a34>
 720:	006e6f69 	0x6e6f69
 724:	70617274 	0x70617274
 728:	6d617266 	0x6d617266
 72c:	00745f65 	0x745f65
 730:	63747570 	0x63747570
 734:	00726168 	0x726168
 738:	6e697270 	0x6e697270
 73c:	73616274 	0x73616274
 740:	72700065 	0x72700065
 744:	66746e69 	0x66746e69
 748:	6100632e 	0x6100632e
 74c:	6e696167 	0x6e696167
 750:	6e6d2f00 	0x6e6d2f00
 754:	2f632f74 	sltiu	v1,k1,12148
 758:	72657355 	0x72657355
 75c:	61462f73 	0x61462f73
 760:	726f7463 	0x726f7463
 764:	4e6c6169 	c3	0x6c6169
 768:	776f642f 	jalx	dbd90bc <_mem_avail_start-0x72426f44>
 76c:	616f6c6e 	0x616f6c6e
 770:	542f7364 	bnel	at,t7,1d504 <_mem_avail_start-0x7ffe2afc>
 774:	69766972 	0x69766972
 778:	494d6c61 	0x494d6c61
 77c:	535f5350 	beql	k0,ra,154c0 <_mem_avail_start-0x7ffeab40>
 780:	7774666f 	jalx	dd199bc <_mem_avail_start-0x722e6644>
 784:	2f657261 	sltiu	a1,k1,29281
 788:	2f707063 	sltiu	s0,k1,28771
 78c:	0062696c 	0x62696c
 790:	756c6176 	jalx	5b185d8 <_mem_avail_start-0x7a4e7a28>
 794:	72700065 	0x72700065
 798:	62746e69 	0x62746e69
 79c:	2e657361 	sltiu	a1,s3,29537
 7a0:	69730063 	0x69730063
 7a4:	6d006e67 	0x6d006e67
 7a8:	6f6d6d65 	0x6f6d6d65
 7ac:	62006576 	0x62006576
 7b0:	6f72657a 	0x6f72657a
 7b4:	72747300 	0x72747300
 7b8:	2e676e69 	sltiu	a3,s3,28265
 7bc:	656d0063 	0x656d0063
 7c0:	706d636d 	0x706d636d
 7c4:	72747300 	0x72747300
 7c8:	7970636e 	0x7970636e
 7cc:	72747300 	0x72747300
 7d0:	6e656c6e 	0x6e656c6e
 7d4:	72747300 	0x72747300
 7d8:	00726863 	0x726863
 7dc:	63727473 	0x63727473
 7e0:	73007970 	0x73007970
 7e4:	6d637274 	0x6d637274
 7e8:	74730070 	jalx	1cc01c0 <_mem_avail_start-0x7e33fe40>
 7ec:	6e656c72 	0x6e656c72
 7f0:	72747300 	0x72747300
 7f4:	706d636e 	0x706d636e
 7f8:	72747300 	0x72747300
 7fc:	646e6966 	0x646e6966
 800:	74757000 	jalx	1d5c000 <_mem_avail_start-0x7e2a4000>
 804:	00632e73 	tltu	v1,v1,0xb9
 808:	63747570 	0x63747570
 80c:	2e726168 	sltiu	s2,s3,24936
 810:	656e0063 	0x656e0063
 814:	5f007478 	bgtzl	t8,1d9f8 <_mem_avail_start-0x7ffe2608>
 818:	6172345a 	0x6172345a
 81c:	6a52646e 	0x6a52646e
 820:	315a5f00 	andi	k0,t2,0x5f00
 824:	5f6f6434 	0x5f6f6434
 828:	74736574 	jalx	1cd95d0 <_mem_avail_start-0x7e326a30>
 82c:	6d656d5f 	0x6d656d5f
 830:	4979726f 	0x4979726f
 834:	50624568 	beql	v1,v0,11dd8 <_mem_avail_start-0x7ffee228>
 838:	5f305376 	0x5f305376
 83c:	315a5f00 	andi	k0,t2,0x5f00
 840:	5f6f6434 	0x5f6f6434
 844:	74736574 	jalx	1cd95d0 <_mem_avail_start-0x7e326a30>
 848:	6d656d5f 	0x6d656d5f
 84c:	4979726f 	0x4979726f
 850:	50624574 	beql	v1,v0,11e24 <_mem_avail_start-0x7ffee1dc>
 854:	5f305376 	0x5f305376
 858:	70795400 	0x70795400
 85c:	6f640065 	0x6f640065
 860:	7365745f 	0x7365745f
 864:	656d5f74 	0x656d5f74
 868:	79726f6d 	0x79726f6d
 86c:	6f68733c 	0x6f68733c
 870:	75207472 	jalx	481d1c8 <_mem_avail_start-0x7b7e2e38>
 874:	6769736e 	0x6769736e
 878:	2064656e 	addi	a0,v1,25966
 87c:	3e746e69 	0x3e746e69
 880:	5f6f6400 	0x5f6f6400
 884:	74736574 	jalx	1cd95d0 <_mem_avail_start-0x7e326a30>
 888:	6d656d5f 	0x6d656d5f
 88c:	3c79726f 	0x3c79726f
 890:	69736e75 	0x69736e75
 894:	64656e67 	0x64656e67
 898:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 89c:	6f64003e 	0x6f64003e
 8a0:	7365745f 	0x7365745f
 8a4:	656d5f74 	0x656d5f74
 8a8:	79726f6d 	0x79726f6d
 8ac:	736e753c 	0x736e753c
 8b0:	656e6769 	0x656e6769
 8b4:	68632064 	0x68632064
 8b8:	003e7261 	0x3e7261
 8bc:	646e6172 	0x646e6172
 8c0:	6565735f 	0x6565735f
 8c4:	656d0064 	0x656d0064
 8c8:	79726f6d 	0x79726f6d
 8cc:	7365745f 	0x7365745f
 8d0:	70632e74 	0x70632e74
 8d4:	5a5f0070 	0x5a5f0070
 8d8:	6f643431 	0x6f643431
 8dc:	7365745f 	0x7365745f
 8e0:	656d5f74 	0x656d5f74
 8e4:	79726f6d 	0x79726f6d
 8e8:	62456a49 	0x62456a49
 8ec:	30537650 	andi	s3,v0,0x7650
 8f0:	6172005f 	0x6172005f
 8f4:	7200646e 	0x7200646e
 8f8:	00646165 	0x646165
 8fc:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 900:	77685f65 	jalx	da17d94 <_mem_avail_start-0x725e826c>
 904:	0064726f 	0x64726f
 908:	77355a5f 	jalx	cd5697c <_mem_avail_start-0x732a9684>
 90c:	65746972 	0x65746972
 910:	76456a49 	jalx	915a924 <_mem_avail_start-0x76ea56dc>
 914:	5f547650 	0x5f547650
 918:	69727700 	0x69727700
 91c:	775f6574 	jalx	d7d95d0 <_mem_avail_start-0x72826a30>
 920:	0064726f 	0x64726f
 924:	61746164 	0x61746164
 928:	69727700 	0x69727700
 92c:	625f6574 	0x625f6574
 930:	00657479 	0x657479
 934:	72345a5f 	0x72345a5f
 938:	49646165 	0x49646165
 93c:	5f54456d 	0x5f54456d
 940:	75007650 	jalx	401d940 <_mem_avail_start-0x7bfe26c0>
 944:	36746e69 	ori	s4,s3,0x6e69
 948:	00745f34 	teq	v1,s4,0x17c
 94c:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 950:	6e753c65 	0x6e753c65
 954:	6e676973 	0x6e676973
 958:	63206465 	0x63206465
 95c:	3e726168 	0x3e726168
 960:	61657200 	0x61657200
 964:	77685f64 	jalx	da17d90 <_mem_avail_start-0x725e8270>
 968:	0064726f 	0x64726f
 96c:	77355a5f 	jalx	cd5697c <_mem_avail_start-0x732a9684>
 970:	65746972 	0x65746972
 974:	76456d49 	jalx	915b524 <_mem_avail_start-0x76ea4adc>
 978:	5f547650 	0x5f547650
 97c:	345a5f00 	ori	k0,v0,0x5f00
 980:	64616572 	0x64616572
 984:	54457449 	bnel	v0,a1,1daac <_mem_avail_start-0x7ffe2554>
 988:	0076505f 	0x76505f
 98c:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 990:	6f6c3c65 	0x6f6c3c65
 994:	7520676e 	jalx	4819db8 <_mem_avail_start-0x7b7e6248>
 998:	6769736e 	0x6769736e
 99c:	2064656e 	addi	a0,v1,25966
 9a0:	3e746e69 	0x3e746e69
 9a4:	69727700 	0x69727700
 9a8:	645f6574 	0x645f6574
 9ac:	64726f77 	0x64726f77
 9b0:	61657200 	0x61657200
 9b4:	6f6c3c64 	0x6f6c3c64
 9b8:	7520676e 	jalx	4819db8 <_mem_avail_start-0x7b7e6248>
 9bc:	6769736e 	0x6769736e
 9c0:	2064656e 	addi	a0,v1,25966
 9c4:	3e746e69 	0x3e746e69
 9c8:	6f776400 	0x6f776400
 9cc:	745f6472 	jalx	17d91c8 <_mem_avail_start-0x7e826e38>
 9d0:	345a5f00 	ori	k0,v0,0x5f00
 9d4:	64616572 	0x64616572
 9d8:	54456849 	bnel	v0,a1,1ab00 <_mem_avail_start-0x7ffe5500>
 9dc:	0076505f 	0x76505f
 9e0:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 9e4:	68733c65 	0x68733c65
 9e8:	2074726f 	addi	s4,v1,29295
 9ec:	69736e75 	0x69736e75
 9f0:	64656e67 	0x64656e67
 9f4:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 9f8:	6572003e 	0x6572003e
 9fc:	753c6461 	jalx	4f19184 <_mem_avail_start-0x7b0e6e7c>
 a00:	6769736e 	0x6769736e
 a04:	2064656e 	addi	a0,v1,25966
 a08:	72616863 	0x72616863
 a0c:	616d003e 	0x616d003e
 a10:	6e696863 	0x6e696863
 a14:	70632e65 	0x70632e65
 a18:	65720070 	0x65720070
 a1c:	645f6461 	0x645f6461
 a20:	64726f77 	0x64726f77
 a24:	355a5f00 	ori	k0,t2,0x5f00
 a28:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 a2c:	45684965 	0x45684965
 a30:	54765076 	bnel	v1,s6,14c0c <_mem_avail_start-0x7ffeb3f4>
 a34:	6572005f 	0x6572005f
 a38:	753c6461 	jalx	4f19184 <_mem_avail_start-0x7b0e6e7c>
 a3c:	6769736e 	0x6769736e
 a40:	2064656e 	addi	a0,v1,25966
 a44:	3e746e69 	0x3e746e69
 a48:	355a5f00 	ori	k0,t2,0x5f00
 a4c:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 a50:	45744965 	0x45744965
 a54:	54765076 	bnel	v1,s6,14c30 <_mem_avail_start-0x7ffeb3d0>
 a58:	5a5f005f 	0x5a5f005f
 a5c:	61657234 	0x61657234
 a60:	456a4964 	0x456a4964
 a64:	76505f54 	jalx	9417d50 <_mem_avail_start-0x76be82b0>
 a68:	61657200 	0x61657200
 a6c:	68733c64 	0x68733c64
 a70:	2074726f 	addi	s4,v1,29295
 a74:	69736e75 	0x69736e75
 a78:	64656e67 	0x64656e67
 a7c:	746e6920 	jalx	1b9a480 <_mem_avail_start-0x7e465b80>
 a80:	7768003e 	jalx	da000f8 <_mem_avail_start-0x725fff08>
 a84:	5f64726f 	0x5f64726f
 a88:	65720074 	0x65720074
 a8c:	625f6461 	0x625f6461
 a90:	00657479 	0x657479
 a94:	74697277 	jalx	1a5c9dc <_mem_avail_start-0x7e5a3624>
 a98:	6e753c65 	0x6e753c65
 a9c:	6e676973 	0x6e676973
 aa0:	69206465 	0x69206465
 aa4:	003e746e 	0x3e746e

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
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
   c:	001d0d1f 	0x1d0d1f
  10:	00000020 	add	zero,zero,zero
  14:	00000000 	nop
  18:	bfc00a48 	cache	0x0,2632(s8)
  1c:	000000c8 	0xc8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/memory_test.cpp:6
}
  20:	48200e44 	0x48200e44
  24:	0291019f 	0x291019f
strchr():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
    if (s < d && s + n > d) {
  28:	a0020390 	sb	v0,912(zero)
strcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  2c:	dfd1d00a 	ldc3	$17,-12278(s8)
strncpy():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:329 (discriminator 1)
  30:	0b000e48 	j	c003920 <_mem_avail_start-0x73ffc6e0>
memcmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:330
        s += n, d += n;
  34:	0000000c 	syscall
	...
strncmp():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  40:	0000000c 	syscall
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
  44:	0000000c 	syscall
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	0000000c 	syscall
  54:	00000028 	0x28
  58:	00000000 	nop
  5c:	bfc00b10 	cache	0x0,2832(s8)
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
  88:	bfc00ba8 	cache	0x0,2984(s8)
  8c:	00000068 	0x68
  90:	44280e44 	0x44280e44
  94:	92500391 	lbu	s0,913(s2)
  98:	9f049002 	0x9f049002
  9c:	0e500201 	jal	9400804 <_mem_avail_start-0x76bff7fc>
  a0:	d2d1d000 	0xd2d1d000
  a4:	000000df 	0xdf
  a8:	00000024 	and	zero,zero,zero
  ac:	00000000 	nop
  b0:	bfc00c10 	cache	0x0,3088(s8)
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
  e8:	bfc00cc4 	cache	0x0,3268(s8)
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
 128:	bfc00ee8 	cache	0x0,3816(s8)
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
 1e4:	bfc00fc0 	cache	0x0,4032(s8)
 1e8:	00000024 	and	zero,zero,zero
 1ec:	0000000c 	syscall
 1f0:	0000014c 	syscall	0x5
 1f4:	bfc00fe4 	cache	0x0,4068(s8)
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
 244:	bfc01010 	cache	0x0,4112(s8)
 248:	00000060 	0x60
 24c:	50200e44 	beqzl	at,3b60 <_mem_avail_start-0x7fffc4a0>
 250:	03910292 	0x3910292
 254:	0490019f 	bltzal	a0,8d4 <_mem_avail_start-0x7ffff72c>
 258:	000e0a6c 	0xe0a6c
 25c:	dfd2d1d0 	ldc3	$18,-11824(s8)
 260:	0000000b 	movn	zero,zero,zero
 264:	00000018 	mult	zero,zero
 268:	0000022c 	0x22c
 26c:	bfc01070 	cache	0x0,4208(s8)
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
 298:	bfc010a0 	cache	0x0,4256(s8)
 29c:	0000002c 	0x2c
 2a0:	44180e44 	0x44180e44
 2a4:	9f480290 	0x9f480290
 2a8:	000e5c01 	0xe5c01
 2ac:	0000dfd0 	0xdfd0
