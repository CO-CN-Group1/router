
test_memory.ram.elf:     file format elf32-tradlittlemips
test_memory.ram.elf


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
88000038:	0e000269 	jal	880009a4 <_main>
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
88000240:	0e0002db 	jal	88000b6c <_exception_handler>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:127
    nop
88000244:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:128
    j _loop
88000248:	0a000010 	j	88000040 <_loop>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/utility/startup.S:129
    nop
8800024c:	00000000 	nop

88000250 <_Z16send_serial_charh>:
_Z16send_serial_charh():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:22
	unsigned char *const var = reinterpret_cast<unsigned char *const>(MEM_ADDR)

inline void send_serial_char(unsigned char c)
{
	LOAD_SERIAL_ENTRY(serial_entry);
	while(!(serial_entry[0] & 1));
88000250:	3c03a300 	lui	v1,0xa300
88000254:	8c620000 	lw	v0,0(v1)
88000258:	30420001 	andi	v0,v0,0x1
8800025c:	1040fffd 	beqz	v0,88000254 <_Z16send_serial_charh+0x4>
88000260:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:23
	if(c) serial_entry[1] = c;
88000264:	10800002 	beqz	a0,88000270 <_Z16send_serial_charh+0x20>
88000268:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:23 (discriminator 1)
8800026c:	ac640004 	sw	a0,4(v1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:24
}
88000270:	03e00008 	jr	ra
88000274:	00000000 	nop

88000278 <_ZN6__impl19send_serial_str_arrILj5EJLj0ELj1ELj2ELj3ELj4EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.1.constprop.5>:
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:116
	{
		send_serial_char(a);
	}

	template<unsigned N, unsigned... I>
	inline void send_serial_str_arr(const char (&str)[N], unsigned_sequence<I...>)
88000278:	27bdffe8 	addiu	sp,sp,-24
8800027c:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
88000280:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000284:	2404004f 	li	a0,79
88000288:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800028c:	2404004b 	li	a0,75
88000290:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000294:	24040021 	li	a0,33
88000298:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800029c:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:119
	{
		send_serial_str_unpack(str[I]...);
	}
880002a0:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
880002a4:	00002025 	move	a0,zero
880002a8:	0a000094 	j	88000250 <_Z16send_serial_charh>
880002ac:	27bd0018 	addiu	sp,sp,24

880002b0 <_ZN6__impl19send_serial_str_arrILj10EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.2.constprop.4>:
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:116
	inline void send_serial_str_arr(const char (&str)[N], unsigned_sequence<I...>)
880002b0:	27bdffe8 	addiu	sp,sp,-24
880002b4:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
880002b8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002bc:	24040045 	li	a0,69
880002c0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002c4:	24040072 	li	a0,114
880002c8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002cc:	24040072 	li	a0,114
880002d0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002d4:	2404006f 	li	a0,111
880002d8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002dc:	24040072 	li	a0,114
880002e0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002e4:	24040020 	li	a0,32
880002e8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002ec:	24040061 	li	a0,97
880002f0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002f4:	24040074 	li	a0,116
880002f8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002fc:	24040020 	li	a0,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:119
	}
88000300:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
88000304:	00002025 	move	a0,zero
88000308:	0a000094 	j	88000250 <_Z16send_serial_charh>
8800030c:	27bd0018 	addiu	sp,sp,24

88000310 <_Z15send_serial_hexj>:
_Z15send_serial_hexj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:54
{
88000310:	27bdffe0 	addiu	sp,sp,-32
88000314:	afb20018 	sw	s2,24(sp)
88000318:	00809025 	move	s2,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:55
	send_serial_char('0');
8800031c:	24040030 	li	a0,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:54
{
88000320:	afbf001c 	sw	ra,28(sp)
88000324:	afb10014 	sw	s1,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:55
	send_serial_char('0');
88000328:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800032c:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:56
	send_serial_char('x');
88000330:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000334:	24040078 	li	a0,120
88000338:	2410001c 	li	s0,28
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:57
	for(int i = 7; i >= 0; --i)
8800033c:	2411fffc 	li	s1,-4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:59
		unsigned char c = (v >> (i << 2)) & 0xf;
88000340:	02121006 	srlv	v0,s2,s0
88000344:	3042000f 	andi	v0,v0,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:60
		c = (c < 10) ? c + '0' : c + 'a' - 10;
88000348:	2c43000a 	sltiu	v1,v0,10
8800034c:	10600002 	beqz	v1,88000358 <_Z15send_serial_hexj+0x48>
88000350:	24440057 	addiu	a0,v0,87
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:60 (discriminator 1)
88000354:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:61 (discriminator 4)
		send_serial_char(c);
88000358:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800035c:	2610fffc 	addiu	s0,s0,-4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:57 (discriminator 4)
	for(int i = 7; i >= 0; --i)
88000360:	1611fff8 	bne	s0,s1,88000344 <_Z15send_serial_hexj+0x34>
88000364:	02121006 	srlv	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:63
}
88000368:	8fbf001c 	lw	ra,28(sp)
8800036c:	8fb20018 	lw	s2,24(sp)
88000370:	8fb10014 	lw	s1,20(sp)
88000374:	8fb00010 	lw	s0,16(sp)
88000378:	03e00008 	jr	ra
8800037c:	27bd0020 	addiu	sp,sp,32

88000380 <_Z4testIjEvv>:
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
{
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
}

template<typename Type>
inline void test()
88000380:	27bdffe8 	addiu	sp,sp,-24
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
88000384:	3c047fff 	lui	a0,0x7fff
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
88000388:	3c038000 	lui	v1,0x8000
8800038c:	afbf0014 	sw	ra,20(sp)
88000390:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:15
{
	unsigned rand_seed;

	volatile Type* mem = reinterpret_cast<volatile Type *>(MEM_ADDR);

	rand_seed = 23;
88000394:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
88000398:	240641a7 	li	a2,16807
8800039c:	3484ffff 	ori	a0,a0,0xffff
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
880003a0:	3c058080 	lui	a1,0x8080
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5 (discriminator 2)
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
880003a4:	70461002 	mul	v0,v0,a2
880003a8:	24630004 	addiu	v1,v1,4
880003ac:	0044001b 	divu	zero,v0,a0
880003b0:	008001f4 	teq	a0,zero,0x7
880003b4:	00001010 	mfhi	v0
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:17 (discriminator 2)
		mem[i] = rand(rand_seed);
880003b8:	ac62fffc 	sw	v0,-4(v1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16 (discriminator 2)
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
880003bc:	1465fffa 	bne	v1,a1,880003a8 <_Z4testIjEvv+0x28>
880003c0:	70461002 	mul	v0,v0,a2
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
880003c4:	3c057fff 	lui	a1,0x7fff
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:19

	rand_seed = 23;
880003c8:	24020017 	li	v0,23
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
880003cc:	00001825 	move	v1,zero
880003d0:	3c072000 	lui	a3,0x2000
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
880003d4:	240841a7 	li	t0,16807
880003d8:	34a5ffff 	ori	a1,a1,0xffff
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
880003dc:	3c060020 	lui	a2,0x20
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
880003e0:	70481002 	mul	v0,v0,t0
880003e4:	00678021 	addu	s0,v1,a3
880003e8:	0045001b 	divu	zero,v0,a1
880003ec:	00a001f4 	teq	a1,zero,0x7
880003f0:	00108080 	sll	s0,s0,0x2
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
880003f4:	8e040000 	lw	a0,0(s0)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
880003f8:	00001010 	mfhi	v0
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
880003fc:	1082000c 	beq	a0,v0,88000430 <_Z4testIjEvv+0xb0>
88000400:	24630001 	addiu	v1,v1,1
_Z15send_serial_strILj10EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
/* send a literal string without using memory to store it */
template<unsigned N>
inline void send_serial_str(const char (&str)[N])
{
	typedef typename __impl::maker<N>::type type;
	__impl::send_serial_str_arr(str, type{});
88000404:	0e0000ac 	jal	880002b0 <_ZN6__impl19send_serial_str_arrILj10EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.2.constprop.4>
88000408:	00000000 	nop
_Z4testIjEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:24
		{
			send_serial_str("Error at ");
			send_serial_hex(MEM_ADDR + i * sizeof(Type));
8800040c:	0e0000c4 	jal	88000310 <_Z15send_serial_hexj>
88000410:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
88000414:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000418:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
			send_serial_str("\n");
			break;
		}
}
8800041c:	8fbf0014 	lw	ra,20(sp)
88000420:	8fb00010 	lw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
88000424:	00002025 	move	a0,zero
88000428:	0a000094 	j	88000250 <_Z16send_serial_charh>
8800042c:	27bd0018 	addiu	sp,sp,24
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20 (discriminator 2)
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000430:	1466ffeb 	bne	v1,a2,880003e0 <_Z4testIjEvv+0x60>
88000434:	00801025 	move	v0,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
88000438:	8fbf0014 	lw	ra,20(sp)
8800043c:	8fb00010 	lw	s0,16(sp)
88000440:	03e00008 	jr	ra
88000444:	27bd0018 	addiu	sp,sp,24

88000448 <_Z4testItEvv>:
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
88000448:	27bdffe8 	addiu	sp,sp,-24
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
8800044c:	3c047fff 	lui	a0,0x7fff
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
88000450:	3c038000 	lui	v1,0x8000
88000454:	afbf0014 	sw	ra,20(sp)
88000458:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:15
	rand_seed = 23;
8800045c:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
88000460:	240741a7 	li	a3,16807
88000464:	3484ffff 	ori	a0,a0,0xffff
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000468:	3c058080 	lui	a1,0x8080
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
8800046c:	70471002 	mul	v0,v0,a3
88000470:	24630002 	addiu	v1,v1,2
88000474:	0044001b 	divu	zero,v0,a0
88000478:	008001f4 	teq	a0,zero,0x7
8800047c:	00001010 	mfhi	v0
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:17
		mem[i] = rand(rand_seed);
88000480:	3046ffff 	andi	a2,v0,0xffff
88000484:	a466fffe 	sh	a2,-2(v1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000488:	1465fff9 	bne	v1,a1,88000470 <_Z4testItEvv+0x28>
8800048c:	70471002 	mul	v0,v0,a3
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
88000490:	3c057fff 	lui	a1,0x7fff
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:19
	rand_seed = 23;
88000494:	24020017 	li	v0,23
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000498:	00001825 	move	v1,zero
8800049c:	3c064000 	lui	a2,0x4000
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
880004a0:	240741a7 	li	a3,16807
880004a4:	34a5ffff 	ori	a1,a1,0xffff
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
880004a8:	3c040040 	lui	a0,0x40
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
880004ac:	70471002 	mul	v0,v0,a3
880004b0:	00668021 	addu	s0,v1,a2
880004b4:	0045001b 	divu	zero,v0,a1
880004b8:	00a001f4 	teq	a1,zero,0x7
880004bc:	00108040 	sll	s0,s0,0x1
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
880004c0:	96080000 	lhu	t0,0(s0)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
880004c4:	00001010 	mfhi	v0
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
880004c8:	3049ffff 	andi	t1,v0,0xffff
880004cc:	1128000c 	beq	t1,t0,88000500 <_Z4testItEvv+0xb8>
880004d0:	24630001 	addiu	v1,v1,1
_Z15send_serial_strILj10EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
	__impl::send_serial_str_arr(str, type{});
880004d4:	0e0000ac 	jal	880002b0 <_ZN6__impl19send_serial_str_arrILj10EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.2.constprop.4>
880004d8:	00000000 	nop
_Z4testItEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:24
			send_serial_hex(MEM_ADDR + i * sizeof(Type));
880004dc:	0e0000c4 	jal	88000310 <_Z15send_serial_hexj>
880004e0:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
880004e4:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004e8:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
880004ec:	8fbf0014 	lw	ra,20(sp)
880004f0:	8fb00010 	lw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
880004f4:	00002025 	move	a0,zero
880004f8:	0a000094 	j	88000250 <_Z16send_serial_charh>
880004fc:	27bd0018 	addiu	sp,sp,24
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20 (discriminator 2)
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000500:	1464ffea 	bne	v1,a0,880004ac <_Z4testItEvv+0x64>
88000504:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
88000508:	8fb00010 	lw	s0,16(sp)
8800050c:	03e00008 	jr	ra
88000510:	27bd0018 	addiu	sp,sp,24

88000514 <_Z4testIhEvv>:
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
88000514:	27bdffe8 	addiu	sp,sp,-24
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
88000518:	3c047fff 	lui	a0,0x7fff
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:9
inline void test()
8800051c:	3c038000 	lui	v1,0x8000
88000520:	afbf0014 	sw	ra,20(sp)
88000524:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:15
	rand_seed = 23;
88000528:	24020017 	li	v0,23
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
8800052c:	240741a7 	li	a3,16807
88000530:	3484ffff 	ori	a0,a0,0xffff
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000534:	3c058080 	lui	a1,0x8080
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
88000538:	70471002 	mul	v0,v0,a3
8800053c:	24630001 	addiu	v1,v1,1
88000540:	0044001b 	divu	zero,v0,a0
88000544:	008001f4 	teq	a0,zero,0x7
88000548:	00001010 	mfhi	v0
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:17
		mem[i] = rand(rand_seed);
8800054c:	304600ff 	andi	a2,v0,0xff
88000550:	a066ffff 	sb	a2,-1(v1)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:16
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000554:	1465fff9 	bne	v1,a1,8800053c <_Z4testIhEvv+0x28>
88000558:	70471002 	mul	v0,v0,a3
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
8800055c:	3c057fff 	lui	a1,0x7fff
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:19
	rand_seed = 23;
88000560:	24020017 	li	v0,23
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000564:	00001825 	move	v1,zero
88000568:	3c068000 	lui	a2,0x8000
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
8800056c:	240741a7 	li	a3,16807
88000570:	34a5ffff 	ori	a1,a1,0xffff
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
88000574:	3c040080 	lui	a0,0x80
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
88000578:	70471002 	mul	v0,v0,a3
8800057c:	00668021 	addu	s0,v1,a2
88000580:	0045001b 	divu	zero,v0,a1
88000584:	00a001f4 	teq	a1,zero,0x7
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
88000588:	92080000 	lbu	t0,0(s0)
_Z4randRj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:5
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
8800058c:	00001010 	mfhi	v0
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:21
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
88000590:	304900ff 	andi	t1,v0,0xff
88000594:	1128000c 	beq	t1,t0,880005c8 <_Z4testIhEvv+0xb4>
88000598:	24630001 	addiu	v1,v1,1
_Z15send_serial_strILj10EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
	__impl::send_serial_str_arr(str, type{});
8800059c:	0e0000ac 	jal	880002b0 <_ZN6__impl19send_serial_str_arrILj10EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.2.constprop.4>
880005a0:	00000000 	nop
_Z4testIhEvv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:24
			send_serial_hex(MEM_ADDR + i * sizeof(Type));
880005a4:	0e0000c4 	jal	88000310 <_Z15send_serial_hexj>
880005a8:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
880005ac:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880005b0:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
880005b4:	8fbf0014 	lw	ra,20(sp)
880005b8:	8fb00010 	lw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
880005bc:	00002025 	move	a0,zero
880005c0:	0a000094 	j	88000250 <_Z16send_serial_charh>
880005c4:	27bd0018 	addiu	sp,sp,24
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:20 (discriminator 2)
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
880005c8:	1464ffeb 	bne	v1,a0,88000578 <_Z4testIhEvv+0x64>
880005cc:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:28
}
880005d0:	8fb00010 	lw	s0,16(sp)
880005d4:	03e00008 	jr	ra
880005d8:	27bd0018 	addiu	sp,sp,24

880005dc <_ZN6__impl22send_serial_str_unpackIJccccccccccccccccccccccccEEEvhDpT_>:
_ZN6__impl22send_serial_str_unpackIJccccccccccccccccccccccccEEEvhDpT_():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:103
	inline void send_serial_str_unpack(unsigned char a, Pack... pack)
880005dc:	27bdff88 	addiu	sp,sp,-120
880005e0:	83a900a8 	lb	t1,168(sp)
880005e4:	83aa00a4 	lb	t2,164(sp)
880005e8:	83ab00a0 	lb	t3,160(sp)
880005ec:	83ac009c 	lb	t4,156(sp)
880005f0:	83ad0098 	lb	t5,152(sp)
880005f4:	83ae0094 	lb	t6,148(sp)
880005f8:	83af0090 	lb	t7,144(sp)
880005fc:	83b8008c 	lb	t8,140(sp)
88000600:	83b90088 	lb	t9,136(sp)
88000604:	afbf0074 	sw	ra,116(sp)
88000608:	afa9001c 	sw	t1,28(sp)
8800060c:	afbe0070 	sw	s8,112(sp)
88000610:	afb7006c 	sw	s7,108(sp)
88000614:	afb60068 	sw	s6,104(sp)
88000618:	afb50064 	sw	s5,100(sp)
8800061c:	afb40060 	sw	s4,96(sp)
88000620:	afb3005c 	sw	s3,92(sp)
88000624:	afb20058 	sw	s2,88(sp)
88000628:	afb10054 	sw	s1,84(sp)
8800062c:	afb00050 	sw	s0,80(sp)
88000630:	afaa0020 	sw	t2,32(sp)
88000634:	afab0024 	sw	t3,36(sp)
88000638:	afac0028 	sw	t4,40(sp)
8800063c:	afad002c 	sw	t5,44(sp)
88000640:	afae0030 	sw	t6,48(sp)
88000644:	afaf0034 	sw	t7,52(sp)
88000648:	afb80038 	sw	t8,56(sp)
8800064c:	afb9003c 	sw	t9,60(sp)
88000650:	afa70040 	sw	a3,64(sp)
88000654:	afa60044 	sw	a2,68(sp)
88000658:	afa50048 	sw	a1,72(sp)
8800065c:	83a800ac 	lb	t0,172(sp)
88000660:	83a200b4 	lb	v0,180(sp)
88000664:	83a300b0 	lb	v1,176(sp)
88000668:	afa20010 	sw	v0,16(sp)
8800066c:	afa30014 	sw	v1,20(sp)
88000670:	afa80018 	sw	t0,24(sp)
88000674:	83be00b8 	lb	s8,184(sp)
88000678:	83b700bc 	lb	s7,188(sp)
8800067c:	83b600c0 	lb	s6,192(sp)
88000680:	83b500c4 	lb	s5,196(sp)
88000684:	83b400c8 	lb	s4,200(sp)
88000688:	83b300cc 	lb	s3,204(sp)
8800068c:	83b200d0 	lb	s2,208(sp)
88000690:	83b100d4 	lb	s1,212(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
88000694:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000698:	83b000d8 	lb	s0,216(sp)
8800069c:	8fa50048 	lw	a1,72(sp)
880006a0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880006a4:	30a400ff 	andi	a0,a1,0xff
880006a8:	8fa60044 	lw	a2,68(sp)
880006ac:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880006b0:	30c400ff 	andi	a0,a2,0xff
880006b4:	8fa70040 	lw	a3,64(sp)
880006b8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880006bc:	30e400ff 	andi	a0,a3,0xff
880006c0:	8fb9003c 	lw	t9,60(sp)
880006c4:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880006c8:	332400ff 	andi	a0,t9,0xff
880006cc:	8fb80038 	lw	t8,56(sp)
880006d0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880006d4:	330400ff 	andi	a0,t8,0xff
880006d8:	8faf0034 	lw	t7,52(sp)
880006dc:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880006e0:	31e400ff 	andi	a0,t7,0xff
880006e4:	8fae0030 	lw	t6,48(sp)
880006e8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880006ec:	31c400ff 	andi	a0,t6,0xff
880006f0:	8fad002c 	lw	t5,44(sp)
880006f4:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880006f8:	31a400ff 	andi	a0,t5,0xff
880006fc:	8fac0028 	lw	t4,40(sp)
88000700:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000704:	318400ff 	andi	a0,t4,0xff
88000708:	8fab0024 	lw	t3,36(sp)
8800070c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000710:	316400ff 	andi	a0,t3,0xff
88000714:	8faa0020 	lw	t2,32(sp)
88000718:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800071c:	314400ff 	andi	a0,t2,0xff
88000720:	8fa9001c 	lw	t1,28(sp)
88000724:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000728:	312400ff 	andi	a0,t1,0xff
8800072c:	8fa80018 	lw	t0,24(sp)
88000730:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000734:	310400ff 	andi	a0,t0,0xff
88000738:	8fa30014 	lw	v1,20(sp)
8800073c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000740:	306400ff 	andi	a0,v1,0xff
88000744:	8fa20010 	lw	v0,16(sp)
88000748:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800074c:	304400ff 	andi	a0,v0,0xff
88000750:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000754:	33c400ff 	andi	a0,s8,0xff
88000758:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800075c:	32e400ff 	andi	a0,s7,0xff
88000760:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000764:	32c400ff 	andi	a0,s6,0xff
88000768:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800076c:	32a400ff 	andi	a0,s5,0xff
88000770:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000774:	328400ff 	andi	a0,s4,0xff
88000778:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800077c:	326400ff 	andi	a0,s3,0xff
88000780:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000784:	324400ff 	andi	a0,s2,0xff
88000788:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800078c:	322400ff 	andi	a0,s1,0xff
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:107
	}
88000790:	8fbf0074 	lw	ra,116(sp)
88000794:	8fbe0070 	lw	s8,112(sp)
88000798:	8fb7006c 	lw	s7,108(sp)
8800079c:	8fb60068 	lw	s6,104(sp)
880007a0:	8fb50064 	lw	s5,100(sp)
880007a4:	8fb40060 	lw	s4,96(sp)
880007a8:	8fb3005c 	lw	s3,92(sp)
880007ac:	8fb20058 	lw	s2,88(sp)
880007b0:	8fb10054 	lw	s1,84(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
880007b4:	320400ff 	andi	a0,s0,0xff
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:107
	}
880007b8:	8fb00050 	lw	s0,80(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
880007bc:	0a000094 	j	88000250 <_Z16send_serial_charh>
880007c0:	27bd0078 	addiu	sp,sp,120

880007c4 <_ZN6__impl19send_serial_str_arrILj25EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9ELj10ELj11ELj12ELj13ELj14ELj15ELj16ELj17ELj18ELj19ELj20ELj21ELj22ELj23ELj24EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE>:
_ZN6__impl19send_serial_str_arrILj25EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9ELj10ELj11ELj12ELj13ELj14ELj15ELj16ELj17ELj18ELj19ELj20ELj21ELj22ELj23ELj24EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:116
	inline void send_serial_str_arr(const char (&str)[N], unsigned_sequence<I...>)
880007c4:	27bdff90 	addiu	sp,sp,-112
880007c8:	00801025 	move	v0,a0
880007cc:	afbf006c 	sw	ra,108(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:118
		send_serial_str_unpack(str[I]...);
880007d0:	80430018 	lb	v1,24(v0)
880007d4:	80870003 	lb	a3,3(a0)
880007d8:	80860002 	lb	a2,2(a0)
880007dc:	80850001 	lb	a1,1(a0)
880007e0:	90840000 	lbu	a0,0(a0)
880007e4:	afa30060 	sw	v1,96(sp)
880007e8:	80430017 	lb	v1,23(v0)
880007ec:	afa3005c 	sw	v1,92(sp)
880007f0:	80430016 	lb	v1,22(v0)
880007f4:	afa30058 	sw	v1,88(sp)
880007f8:	80430015 	lb	v1,21(v0)
880007fc:	afa30054 	sw	v1,84(sp)
88000800:	80430014 	lb	v1,20(v0)
88000804:	afa30050 	sw	v1,80(sp)
88000808:	80430013 	lb	v1,19(v0)
8800080c:	afa3004c 	sw	v1,76(sp)
88000810:	80430012 	lb	v1,18(v0)
88000814:	afa30048 	sw	v1,72(sp)
88000818:	80430011 	lb	v1,17(v0)
8800081c:	afa30044 	sw	v1,68(sp)
88000820:	80430010 	lb	v1,16(v0)
88000824:	afa30040 	sw	v1,64(sp)
88000828:	8043000f 	lb	v1,15(v0)
8800082c:	afa3003c 	sw	v1,60(sp)
88000830:	8043000e 	lb	v1,14(v0)
88000834:	afa30038 	sw	v1,56(sp)
88000838:	8043000d 	lb	v1,13(v0)
8800083c:	afa30034 	sw	v1,52(sp)
88000840:	8043000c 	lb	v1,12(v0)
88000844:	afa30030 	sw	v1,48(sp)
88000848:	8043000b 	lb	v1,11(v0)
8800084c:	afa3002c 	sw	v1,44(sp)
88000850:	8043000a 	lb	v1,10(v0)
88000854:	afa30028 	sw	v1,40(sp)
88000858:	80430009 	lb	v1,9(v0)
8800085c:	afa30024 	sw	v1,36(sp)
88000860:	80430008 	lb	v1,8(v0)
88000864:	afa30020 	sw	v1,32(sp)
88000868:	80430007 	lb	v1,7(v0)
8800086c:	afa3001c 	sw	v1,28(sp)
88000870:	80430006 	lb	v1,6(v0)
88000874:	afa30018 	sw	v1,24(sp)
88000878:	80430005 	lb	v1,5(v0)
8800087c:	afa30014 	sw	v1,20(sp)
88000880:	80420004 	lb	v0,4(v0)
88000884:	0e000177 	jal	880005dc <_ZN6__impl22send_serial_str_unpackIJccccccccccccccccccccccccEEEvhDpT_>
88000888:	afa20010 	sw	v0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:119
	}
8800088c:	8fbf006c 	lw	ra,108(sp)
88000890:	03e00008 	jr	ra
88000894:	27bd0070 	addiu	sp,sp,112

88000898 <_entry>:
_Z15send_serial_strILj25EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
	__impl::send_serial_str_arr(str, type{});
88000898:	3c048800 	lui	a0,0x8800
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:31

int _entry()
{
8800089c:	27bdff90 	addiu	sp,sp,-112
_Z15send_serial_strILj25EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
880008a0:	00002825 	move	a1,zero
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:31
880008a4:	afbf006c 	sw	ra,108(sp)
_Z15send_serial_strILj25EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
880008a8:	0e0001f1 	jal	880007c4 <_ZN6__impl19send_serial_str_arrILj25EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9ELj10ELj11ELj12ELj13ELj14ELj15ELj16ELj17ELj18ELj19ELj20ELj21ELj22ELj23ELj24EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE>
880008ac:	2484107c 	addiu	a0,a0,4220
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:33
	send_serial_str("Testing memory by word!\n");
	test<unsigned>();
880008b0:	0e0000e0 	jal	88000380 <_Z4testIjEvv>
880008b4:	00000000 	nop
_Z15send_serial_strILj5EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
880008b8:	0e00009e 	jal	88000278 <_ZN6__impl19send_serial_str_arrILj5EJLj0ELj1ELj2ELj3ELj4EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.1.constprop.5>
880008bc:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
880008c0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880008c4:	24040054 	li	a0,84
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:106
		send_serial_str_unpack(pack...);
880008c8:	2402000a 	li	v0,10
880008cc:	afa2005c 	sw	v0,92(sp)
880008d0:	24020021 	li	v0,33
880008d4:	afa20058 	sw	v0,88(sp)
880008d8:	24020074 	li	v0,116
880008dc:	afa20054 	sw	v0,84(sp)
880008e0:	24020068 	li	v0,104
880008e4:	afa20048 	sw	v0,72(sp)
880008e8:	24020073 	li	v0,115
880008ec:	afa20044 	sw	v0,68(sp)
880008f0:	24020020 	li	v0,32
880008f4:	24040072 	li	a0,114
880008f8:	2403006f 	li	v1,111
880008fc:	afa20040 	sw	v0,64(sp)
88000900:	afa20034 	sw	v0,52(sp)
88000904:	afa20018 	sw	v0,24(sp)
88000908:	24020067 	li	v0,103
8800090c:	afa40050 	sw	a0,80(sp)
88000910:	afa3004c 	sw	v1,76(sp)
88000914:	24050079 	li	a1,121
88000918:	afa4002c 	sw	a0,44(sp)
8800091c:	afa30028 	sw	v1,40(sp)
88000920:	24040065 	li	a0,101
88000924:	2403006d 	li	v1,109
88000928:	afa20014 	sw	v0,20(sp)
8800092c:	24060062 	li	a2,98
88000930:	2402006e 	li	v0,110
88000934:	afa20010 	sw	v0,16(sp)
88000938:	afa30024 	sw	v1,36(sp)
8800093c:	afa3001c 	sw	v1,28(sp)
88000940:	24070069 	li	a3,105
88000944:	afa40020 	sw	a0,32(sp)
88000948:	afa5003c 	sw	a1,60(sp)
8800094c:	afa60038 	sw	a2,56(sp)
88000950:	afa50030 	sw	a1,48(sp)
88000954:	24060074 	li	a2,116
88000958:	24050073 	li	a1,115
8800095c:	0e000177 	jal	880005dc <_ZN6__impl22send_serial_str_unpackIJccccccccccccccccccccccccEEEvhDpT_>
88000960:	afa00060 	sw	zero,96(sp)
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:36
	send_serial_str("OK!\n");
	send_serial_str("Testing memory by short!\n");
	test<unsigned short>();
88000964:	0e000112 	jal	88000448 <_Z4testItEvv>
88000968:	00000000 	nop
_Z15send_serial_strILj5EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
	__impl::send_serial_str_arr(str, type{});
8800096c:	0e00009e 	jal	88000278 <_ZN6__impl19send_serial_str_arrILj5EJLj0ELj1ELj2ELj3ELj4EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.1.constprop.5>
88000970:	00000000 	nop
_Z15send_serial_strILj25EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
88000974:	3c048800 	lui	a0,0x8800
88000978:	00002825 	move	a1,zero
8800097c:	0e0001f1 	jal	880007c4 <_ZN6__impl19send_serial_str_arrILj25EJLj0ELj1ELj2ELj3ELj4ELj5ELj6ELj7ELj8ELj9ELj10ELj11ELj12ELj13ELj14ELj15ELj16ELj17ELj18ELj19ELj20ELj21ELj22ELj23ELj24EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE>
88000980:	24841098 	addiu	a0,a0,4248
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:39
	send_serial_str("OK!\n");
	send_serial_str("Testing memory by byte!\n");
	test<unsigned char>();
88000984:	0e000145 	jal	88000514 <_Z4testIhEvv>
88000988:	00000000 	nop
_Z15send_serial_strILj5EEvRAT__Kc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:127
8800098c:	0e00009e 	jal	88000278 <_ZN6__impl19send_serial_str_arrILj5EJLj0ELj1ELj2ELj3ELj4EEEEvRAT__KcNS_17unsigned_sequenceIJXspT0_EEEE.isra.1.constprop.5>
88000990:	00000000 	nop
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_memory.cpp:43
	send_serial_str("OK!\n");

	return 0;
}
88000994:	8fbf006c 	lw	ra,108(sp)
88000998:	00001025 	move	v0,zero
8800099c:	03e00008 	jr	ra
880009a0:	27bd0070 	addiu	sp,sp,112

880009a4 <_main>:
_main():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:11
extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {
880009a4:	27bdffe0 	addiu	sp,sp,-32
880009a8:	afbf001c 	sw	ra,28(sp)
880009ac:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:13

    init_serial();
880009b0:	0e0003ff 	jal	88000ffc <init_serial>
880009b4:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:15

    write_segment(0x04);
880009b8:	0e00041a 	jal	88001068 <write_segment>
880009bc:	24040004 	li	a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:17

    puts("*****TrivialMIPS Bare Metal System*****");
880009c0:	3c048800 	lui	a0,0x8800
880009c4:	0e0003e8 	jal	88000fa0 <puts>
880009c8:	248410b4 	addiu	a0,a0,4276
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880009cc:	3c118000 	lui	s1,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880009d0:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880009d4:	3c108000 	lui	s0,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880009d8:	248410dc 	addiu	a0,a0,4316
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880009dc:	26310000 	addiu	s1,s1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880009e0:	0e0003e8 	jal	88000fa0 <puts>
880009e4:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880009e8:	02118023 	subu	s0,s0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:21
    write_segment(0x05);
880009ec:	0e00041a 	jal	88001068 <write_segment>
880009f0:	24040005 	li	a0,5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:25
    if (bss_size > 0) {
880009f4:	1a000009 	blez	s0,88000a1c <_main+0x78>
880009f8:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:26
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
880009fc:	02003025 	move	a2,s0
88000a00:	02202825 	move	a1,s1
88000a04:	0e000308 	jal	88000c20 <printf>
88000a08:	24841104 	addiu	a0,a0,4356
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:27
        memset(&_bss, 0, bss_size);
88000a0c:	02003025 	move	a2,s0
88000a10:	00002825 	move	a1,zero
88000a14:	0e0003c7 	jal	88000f1c <memset>
88000a18:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:30
    }

    write_segment(0x06);
88000a1c:	0e00041a 	jal	88001068 <write_segment>
88000a20:	24040006 	li	a0,6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:33

    // call the actual function
    int result = _entry();
88000a24:	0e000226 	jal	88000898 <_entry>
88000a28:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:34
    if (result == 0) {
88000a2c:	1440000a 	bnez	v0,88000a58 <_main+0xb4>
88000a30:	00402825 	move	a1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:35
        puts("Program exited normally.");
88000a34:	3c048800 	lui	a0,0x8800
88000a38:	0e0003e8 	jal	88000fa0 <puts>
88000a3c:	24841140 	addiu	a0,a0,4416
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}
88000a40:	8fbf001c 	lw	ra,28(sp)
88000a44:	8fb10018 	lw	s1,24(sp)
88000a48:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:40
    write_segment(0x07);
88000a4c:	24040007 	li	a0,7
88000a50:	0a00041a 	j	88001068 <write_segment>
88000a54:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:37
        printf("Program exited abnormally with code %d.\n", result);
88000a58:	3c048800 	lui	a0,0x8800
88000a5c:	0e000308 	jal	88000c20 <printf>
88000a60:	2484115c 	addiu	a0,a0,4444
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
}
88000a64:	1000fff7 	b	88000a44 <_main+0xa0>
88000a68:	8fbf001c 	lw	ra,28(sp)

88000a6c <print_trapframe>:
print_trapframe():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
88000a6c:	27bdffd0 	addiu	sp,sp,-48
88000a70:	afb30024 	sw	s3,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
88000a74:	3c138800 	lui	s3,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
void print_trapframe(trapframe_t *tf) {
88000a78:	afb40028 	sw	s4,40(sp)
88000a7c:	afb20020 	sw	s2,32(sp)
88000a80:	afb1001c 	sw	s1,28(sp)
88000a84:	afb00018 	sw	s0,24(sp)
88000a88:	afbf002c 	sw	ra,44(sp)
88000a8c:	00808025 	move	s0,a0
88000a90:	24920028 	addiu	s2,a0,40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
88000a94:	24110001 	li	s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
        printf("Register $%d: %p\n", i, tf->gpr[i]);
88000a98:	26731188 	addiu	s3,s3,4488
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
88000a9c:	24140020 	li	s4,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64 (discriminator 3)
        printf("Register $%d: %p\n", i, tf->gpr[i]);
88000aa0:	8e460000 	lw	a2,0(s2)
88000aa4:	02202825 	move	a1,s1
88000aa8:	02602025 	move	a0,s3
88000aac:	0e000308 	jal	88000c20 <printf>
88000ab0:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63 (discriminator 3)
    for(int i = 1; i < 32; ++i) {
88000ab4:	1634fffa 	bne	s1,s4,88000aa0 <print_trapframe+0x34>
88000ab8:	26520004 	addiu	s2,s2,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:66
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
88000abc:	8e020020 	lw	v0,32(s0)
88000ac0:	8e070018 	lw	a3,24(s0)
88000ac4:	afa20014 	sw	v0,20(sp)
88000ac8:	8e02001c 	lw	v0,28(s0)
88000acc:	8e060014 	lw	a2,20(s0)
88000ad0:	8e050010 	lw	a1,16(s0)
88000ad4:	3c048800 	lui	a0,0x8800
88000ad8:	afa20010 	sw	v0,16(sp)
88000adc:	0e000308 	jal	88000c20 <printf>
88000ae0:	2484119c 	addiu	a0,a0,4508
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:67
}
88000ae4:	8fbf002c 	lw	ra,44(sp)
88000ae8:	8fb40028 	lw	s4,40(sp)
88000aec:	8fb30024 	lw	s3,36(sp)
88000af0:	8fb20020 	lw	s2,32(sp)
88000af4:	8fb1001c 	lw	s1,28(sp)
88000af8:	8fb00018 	lw	s0,24(sp)
88000afc:	03e00008 	jr	ra
88000b00:	27bd0030 	addiu	sp,sp,48

88000b04 <print_tlb>:
print_tlb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69

void print_tlb() {
88000b04:	27bdffd8 	addiu	sp,sp,-40
88000b08:	afb1001c 	sw	s1,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
88000b0c:	3c118800 	lui	s1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69
void print_tlb() {
88000b10:	afb20020 	sw	s2,32(sp)
88000b14:	afb00018 	sw	s0,24(sp)
88000b18:	afbf0024 	sw	ra,36(sp)
88000b1c:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
88000b20:	263111d8 	addiu	s1,s1,4568
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
88000b24:	24120010 	li	s2,16
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:72 (discriminator 3)
        asm volatile(
88000b28:	40900000 	mtc0	s0,c0_index
88000b2c:	42000001 	tlbr
88000b30:	40065000 	mfc0	a2,c0_entryhi
88000b34:	40071000 	mfc0	a3,c0_entrylo0
88000b38:	40021800 	mfc0	v0,c0_entrylo1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81 (discriminator 3)
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
88000b3c:	02002825 	move	a1,s0
88000b40:	afa20010 	sw	v0,16(sp)
88000b44:	02202025 	move	a0,s1
88000b48:	0e000308 	jal	88000c20 <printf>
88000b4c:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70 (discriminator 3)
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
88000b50:	1612fff5 	bne	s0,s2,88000b28 <print_tlb+0x24>
88000b54:	8fbf0024 	lw	ra,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:83
    }
}
88000b58:	8fb20020 	lw	s2,32(sp)
88000b5c:	8fb1001c 	lw	s1,28(sp)
88000b60:	8fb00018 	lw	s0,24(sp)
88000b64:	03e00008 	jr	ra
88000b68:	27bd0028 	addiu	sp,sp,40

88000b6c <_exception_handler>:
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85

void _exception_handler(trapframe_t *tf, bool assertion) {
88000b6c:	27bdffe0 	addiu	sp,sp,-32
88000b70:	afb10018 	sw	s1,24(sp)
88000b74:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
88000b78:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
88000b7c:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
88000b80:	248410b4 	addiu	a0,a0,4276
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
88000b84:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
88000b88:	0e0003e8 	jal	88000fa0 <puts>
88000b8c:	00a08025 	move	s0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:87
    if (assertion) {
88000b90:	12000012 	beqz	s0,88000bdc <_exception_handler+0x70>
88000b94:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:88
        puts("CPU internal assertion failed, abort.");
88000b98:	3c048800 	lui	a0,0x8800
88000b9c:	0e0003e8 	jal	88000fa0 <puts>
88000ba0:	24841210 	addiu	a0,a0,4624
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:89
        write_segment(0xdeaddead);
88000ba4:	3c04dead 	lui	a0,0xdead
88000ba8:	0e00041a 	jal	88001068 <write_segment>
88000bac:	3484dead 	ori	a0,a0,0xdead
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:96
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
88000bb0:	0e00029b 	jal	88000a6c <print_trapframe>
88000bb4:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:97
    print_tlb();
88000bb8:	0e0002c1 	jal	88000b04 <print_tlb>
88000bbc:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:99
    puts("*****System HANG*****");
}
88000bc0:	8fbf001c 	lw	ra,28(sp)
88000bc4:	8fb10018 	lw	s1,24(sp)
88000bc8:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:98
    puts("*****System HANG*****");
88000bcc:	3c048800 	lui	a0,0x8800
88000bd0:	24841274 	addiu	a0,a0,4724
88000bd4:	0a0003e8 	j	88000fa0 <puts>
88000bd8:	27bd0020 	addiu	sp,sp,32
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
88000bdc:	40066800 	mfc0	a2,c0_cause
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:91
        word_t code = (_get_cause() >> 2) & 0xF;
88000be0:	00063082 	srl	a2,a2,0x2
88000be4:	30c6000f 	andi	a2,a2,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
88000be8:	3c038800 	lui	v1,0x8800
88000bec:	00061080 	sll	v0,a2,0x2
88000bf0:	24631500 	addiu	v1,v1,5376
88000bf4:	00431021 	addu	v0,v0,v1
88000bf8:	8c470000 	lw	a3,0(v0)
88000bfc:	3c048800 	lui	a0,0x8800
_get_epc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:46
    asm(
88000c00:	40107000 	mfc0	s0,c0_epc
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
88000c04:	24841238 	addiu	a0,a0,4664
88000c08:	0e000308 	jal	88000c20 <printf>
88000c0c:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:94
        write_led((uint16_t) epc);
88000c10:	0e000415 	jal	88001054 <write_led>
88000c14:	3204ffff 	andi	a0,s0,0xffff
88000c18:	1000ffe5 	b	88000bb0 <_exception_handler+0x44>
88000c1c:	00000000 	nop

88000c20 <printf>:
printf():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
int printf(const char *fmt, ...)
{
88000c20:	27bdffd0 	addiu	sp,sp,-48
88000c24:	afb00018 	sw	s0,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
88000c28:	27b00034 	addiu	s0,sp,52
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
{
88000c2c:	afb30024 	sw	s3,36(sp)
88000c30:	afb20020 	sw	s2,32(sp)
88000c34:	afb1001c 	sw	s1,28(sp)
88000c38:	afbf002c 	sw	ra,44(sp)
88000c3c:	afb40028 	sw	s4,40(sp)
88000c40:	00809025 	move	s2,a0
88000c44:	afa50034 	sw	a1,52(sp)
88000c48:	afa60038 	sw	a2,56(sp)
88000c4c:	afa7003c 	sw	a3,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	__builtin_va_start(ap, fmt);
88000c50:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10
	arg = ap;
	for (i = 0; fmt[i]; i++)
88000c54:	00008825 	move	s1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
				break;
			}
		}
		else
		{
			if (c == '\n')
88000c58:	2413000a 	li	s3,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 1)
	for (i = 0; fmt[i]; i++)
88000c5c:	02511021 	addu	v0,s2,s1
88000c60:	80540000 	lb	s4,0(v0)
88000c64:	1680000a 	bnez	s4,88000c90 <printf+0x70>
88000c68:	24020025 	li	v0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:85
				putchar('\r');
			putchar(c);
		}
	}
	return 0;
}
88000c6c:	8fbf002c 	lw	ra,44(sp)
88000c70:	8fb40028 	lw	s4,40(sp)
88000c74:	8fb30024 	lw	s3,36(sp)
88000c78:	8fb20020 	lw	s2,32(sp)
88000c7c:	8fb1001c 	lw	s1,28(sp)
88000c80:	8fb00018 	lw	s0,24(sp)
88000c84:	00001025 	move	v0,zero
88000c88:	03e00008 	jr	ra
88000c8c:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:13
		if (c == '%')
88000c90:	16820066 	bne	s4,v0,88000e2c <printf+0x20c>
88000c94:	24050001 	li	a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000c98:	24060064 	li	a2,100
88000c9c:	24070025 	li	a3,37
88000ca0:	24080030 	li	t0,48
88000ca4:	02511021 	addu	v0,s2,s1
88000ca8:	80420001 	lb	v0,1(v0)
88000cac:	1046003a 	beq	v0,a2,88000d98 <printf+0x178>
88000cb0:	28430065 	slti	v1,v0,101
88000cb4:	10600018 	beqz	v1,88000d18 <printf+0xf8>
88000cb8:	2843003a 	slti	v1,v0,58
88000cbc:	1060000c 	beqz	v1,88000cf0 <printf+0xd0>
88000cc0:	28430031 	slti	v1,v0,49
88000cc4:	1060004d 	beqz	v1,88000dfc <printf+0x1dc>
88000cc8:	02512021 	addu	a0,s2,s1
88000ccc:	10470046 	beq	v0,a3,88000de8 <printf+0x1c8>
88000cd0:	26340001 	addiu	s4,s1,1
88000cd4:	10480048 	beq	v0,t0,88000df8 <printf+0x1d8>
88000cd8:	02542021 	addu	a0,s2,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:73
				putchar('%');
88000cdc:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
88000ce0:	0e0003f4 	jal	88000fd0 <putchar>
88000ce4:	26310001 	addiu	s1,s1,1
88000ce8:	1000ffdd 	b	88000c60 <printf+0x40>
88000cec:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000cf0:	24030062 	li	v1,98
88000cf4:	10430036 	beq	v0,v1,88000dd0 <printf+0x1b0>
88000cf8:	26340001 	addiu	s4,s1,1
88000cfc:	24030063 	li	v1,99
88000d00:	1443fff6 	bne	v0,v1,88000cdc <printf+0xbc>
88000d04:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:25
				putchar((long)*arg);
88000d08:	0e0003f4 	jal	88000fd0 <putchar>
88000d0c:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
88000d10:	10000017 	b	88000d70 <printf+0x150>
88000d14:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000d18:	24030070 	li	v1,112
88000d1c:	1043002f 	beq	v0,v1,88000ddc <printf+0x1bc>
88000d20:	28430071 	slti	v1,v0,113
88000d24:	10600008 	beqz	v1,88000d48 <printf+0x128>
88000d28:	24030075 	li	v1,117
88000d2c:	2403006c 	li	v1,108
88000d30:	10430020 	beq	v0,v1,88000db4 <printf+0x194>
88000d34:	2403006f 	li	v1,111
88000d38:	1443ffe8 	bne	v0,v1,88000cdc <printf+0xbc>
88000d3c:	00003825 	move	a3,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:45
				printbase((long)*arg, w, 8, 0);
88000d40:	10000017 	b	88000da0 <printf+0x180>
88000d44:	24060008 	li	a2,8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000d48:	1043000d 	beq	v0,v1,88000d80 <printf+0x160>
88000d4c:	26340001 	addiu	s4,s1,1
88000d50:	24030078 	li	v1,120
88000d54:	10430021 	beq	v0,v1,88000ddc <printf+0x1bc>
88000d58:	24030073 	li	v1,115
88000d5c:	1443ffe0 	bne	v0,v1,88000ce0 <printf+0xc0>
88000d60:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:20
				putstring(*arg);
88000d64:	0e0003d0 	jal	88000f40 <putstring>
88000d68:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
88000d6c:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
88000d70:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 2)
	for (i = 0; fmt[i]; i++)
88000d74:	26310001 	addiu	s1,s1,1
88000d78:	1000ffb9 	b	88000c60 <printf+0x40>
88000d7c:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:30
				printbase((long)*arg, w, 10, 0);
88000d80:	00003825 	move	a3,zero
88000d84:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
88000d88:	0e000391 	jal	88000e44 <printbase>
88000d8c:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
88000d90:	1000fff7 	b	88000d70 <printf+0x150>
88000d94:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:35
				printbase((long)*arg, w, 10, 1);
88000d98:	24070001 	li	a3,1
88000d9c:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
88000da0:	8e040000 	lw	a0,0(s0)
88000da4:	0e000391 	jal	88000e44 <printbase>
88000da8:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:59
				break;
88000dac:	1000fff1 	b	88000d74 <printf+0x154>
88000db0:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:40
				printbase((long)*arg, w, 10, 0);
88000db4:	8e040000 	lw	a0,0(s0)
88000db8:	00003825 	move	a3,zero
88000dbc:	0e000391 	jal	88000e44 <printbase>
88000dc0:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:41
				arg++;
88000dc4:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:43
				break;
88000dc8:	1000ffea 	b	88000d74 <printf+0x154>
88000dcc:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
88000dd0:	00003825 	move	a3,zero
88000dd4:	1000ffec 	b	88000d88 <printf+0x168>
88000dd8:	24060002 	li	a2,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
88000ddc:	00003825 	move	a3,zero
88000de0:	1000ffef 	b	88000da0 <printf+0x180>
88000de4:	24060010 	li	a2,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:61
				putchar('%');
88000de8:	0e0003f4 	jal	88000fd0 <putchar>
88000dec:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
88000df0:	1000ffe0 	b	88000d74 <printf+0x154>
88000df4:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:65
				i++;
88000df8:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:15 (discriminator 1)
			w = 1;
88000dfc:	00002825 	move	a1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:67 (discriminator 1)
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
88000e00:	80830001 	lb	v1,1(a0)
88000e04:	00928823 	subu	s1,a0,s2
88000e08:	2462ffcf 	addiu	v0,v1,-49
88000e0c:	304200ff 	andi	v0,v0,0xff
88000e10:	2c420009 	sltiu	v0,v0,9
88000e14:	1040ffa3 	beqz	v0,88000ca4 <printf+0x84>
88000e18:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:68 (discriminator 3)
					w = w * 10 + (fmt[i + 1] - '0');
88000e1c:	70b31002 	mul	v0,a1,s3
88000e20:	2463ffd0 	addiu	v1,v1,-48
88000e24:	1000fff6 	b	88000e00 <printf+0x1e0>
88000e28:	00432821 	addu	a1,v0,v1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
			if (c == '\n')
88000e2c:	16930003 	bne	s4,s3,88000e3c <printf+0x21c>
88000e30:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:80
				putchar('\r');
88000e34:	0e0003f4 	jal	88000fd0 <putchar>
88000e38:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
88000e3c:	1000ffa8 	b	88000ce0 <printf+0xc0>
88000e40:	02802025 	move	a0,s4

88000e44 <printbase>:
printbase():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2
int printbase(long v,int w,int base,int sign)
{
88000e44:	27bdff98 	addiu	sp,sp,-104
88000e48:	afb40060 	sw	s4,96(sp)
88000e4c:	afb3005c 	sw	s3,92(sp)
88000e50:	afbf0064 	sw	ra,100(sp)
88000e54:	afb20058 	sw	s2,88(sp)
88000e58:	afb10054 	sw	s1,84(sp)
88000e5c:	afb00050 	sw	s0,80(sp)
88000e60:	00a09825 	move	s3,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
88000e64:	10e00018 	beqz	a3,88000ec8 <printbase+0x84>
88000e68:	00c0a025 	move	s4,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7 (discriminator 1)
88000e6c:	04810004 	bgez	a0,88000e80 <printbase+0x3c>
88000e70:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:9
	{
	value = -v;
88000e74:	00048023 	negu	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:10
	putchar('-');
88000e78:	0e0003f4 	jal	88000fd0 <putchar>
88000e7c:	2404002d 	li	a0,45
88000e80:	27b10010 	addiu	s1,sp,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2 (discriminator 1)
{
88000e84:	02201025 	move	v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:14 (discriminator 1)
	}
	else value=v;

	for(i=0;value;i++)
88000e88:	16000011 	bnez	s0,88000ed0 <printbase+0x8c>
88000e8c:	00519023 	subu	s2,v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22
	value=value/base;
	}

#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
88000e90:	0272802a 	slt	s0,s3,s2
88000e94:	0250980b 	movn	s3,s2,s0
88000e98:	02608025 	move	s0,s3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22 (discriminator 2)
88000e9c:	16000013 	bnez	s0,88000eec <printbase+0xa8>
88000ea0:	0250102a 	slt	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:28
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}
88000ea4:	8fbf0064 	lw	ra,100(sp)
88000ea8:	8fb40060 	lw	s4,96(sp)
88000eac:	8fb3005c 	lw	s3,92(sp)
88000eb0:	8fb20058 	lw	s2,88(sp)
88000eb4:	8fb10054 	lw	s1,84(sp)
88000eb8:	8fb00050 	lw	s0,80(sp)
88000ebc:	00001025 	move	v0,zero
88000ec0:	03e00008 	jr	ra
88000ec4:	27bd0068 	addiu	sp,sp,104
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:12
	else value=v;
88000ec8:	1000ffed 	b	88000e80 <printbase+0x3c>
88000ecc:	00808025 	move	s0,a0
88000ed0:	0214001b 	divu	zero,s0,s4
88000ed4:	028001f4 	teq	s4,zero,0x7
88000ed8:	24420001 	addiu	v0,v0,1
88000edc:	00002010 	mfhi	a0
88000ee0:	00008012 	mflo	s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:16 (discriminator 3)
	buf[i]=value%base;
88000ee4:	1000ffe8 	b	88000e88 <printbase+0x44>
88000ee8:	a044ffff 	sb	a0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24
		c=j>i?0:buf[j-1];
88000eec:	14400006 	bnez	v0,88000f08 <printbase+0xc4>
88000ef0:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24 (discriminator 1)
88000ef4:	02301021 	addu	v0,s1,s0
88000ef8:	8042ffff 	lb	v0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 1)
		putchar((c<=9)?c+'0':c-0xa+'a');
88000efc:	2843000a 	slti	v1,v0,10
88000f00:	10600002 	beqz	v1,88000f0c <printbase+0xc8>
88000f04:	24440057 	addiu	a0,v0,87
88000f08:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 4)
88000f0c:	0e0003f4 	jal	88000fd0 <putchar>
88000f10:	2610ffff 	addiu	s0,s0,-1
88000f14:	1000ffe1 	b	88000e9c <printbase+0x58>
88000f18:	00000000 	nop

88000f1c <memset>:
memset():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:273
 * @n:      number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
88000f1c:	00801025 	move	v0,a0
88000f20:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:277
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memset(s, c, n);
#else
    char *p = s;
88000f24:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:278
    while (n -- > 0) {
88000f28:	14660003 	bne	v1,a2,88000f38 <memset+0x1c>
88000f2c:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:283
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
88000f30:	03e00008 	jr	ra
88000f34:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:279
        *p ++ = c;
88000f38:	1000fffb 	b	88000f28 <memset+0xc>
88000f3c:	a065ffff 	sb	a1,-1(v1)

88000f40 <putstring>:
putstring():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:2
int putstring(const char *s)
{
88000f40:	27bdffe0 	addiu	sp,sp,-32
88000f44:	afb20018 	sw	s2,24(sp)
88000f48:	afb10014 	sw	s1,20(sp)
88000f4c:	afbf001c 	sw	ra,28(sp)
88000f50:	afb00010 	sw	s0,16(sp)
88000f54:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
    char c;
    while ((c = *s))
    {
        if (c == '\n')
88000f58:	2412000a 	li	s2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:4
    while ((c = *s))
88000f5c:	82300000 	lb	s0,0(s1)
88000f60:	16000007 	bnez	s0,88000f80 <putstring+0x40>
88000f64:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:12
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
88000f68:	8fb20018 	lw	s2,24(sp)
88000f6c:	8fb10014 	lw	s1,20(sp)
88000f70:	8fb00010 	lw	s0,16(sp)
88000f74:	00001025 	move	v0,zero
88000f78:	03e00008 	jr	ra
88000f7c:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
        if (c == '\n')
88000f80:	16120003 	bne	s0,s2,88000f90 <putstring+0x50>
88000f84:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:7
            putchar('\r');
88000f88:	0e0003f4 	jal	88000fd0 <putchar>
88000f8c:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:8
        putchar(c);
88000f90:	0e0003f4 	jal	88000fd0 <putchar>
88000f94:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:9
        s++;
88000f98:	1000fff0 	b	88000f5c <putstring+0x1c>
88000f9c:	26310001 	addiu	s1,s1,1

88000fa0 <puts>:
puts():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:15

int puts(const char *s)
{
88000fa0:	27bdffe8 	addiu	sp,sp,-24
88000fa4:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:16
    putstring(s);
88000fa8:	0e0003d0 	jal	88000f40 <putstring>
88000fac:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:17
    putchar('\r');
88000fb0:	0e0003f4 	jal	88000fd0 <putchar>
88000fb4:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:18
    putchar('\n');
88000fb8:	0e0003f4 	jal	88000fd0 <putchar>
88000fbc:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:20
    return 0;
}
88000fc0:	8fbf0014 	lw	ra,20(sp)
88000fc4:	00001025 	move	v0,zero
88000fc8:	03e00008 	jr	ra
88000fcc:	27bd0018 	addiu	sp,sp,24

88000fd0 <putchar>:
putchar():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:4
#include <machine.h>

int putchar(int c)
{
88000fd0:	27bdffe8 	addiu	sp,sp,-24
88000fd4:	afb00010 	sw	s0,16(sp)
88000fd8:	00808025 	move	s0,a0
88000fdc:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:5
	write_serial((byte_t) c);
88000fe0:	0e00040d 	jal	88001034 <write_serial>
88000fe4:	308400ff 	andi	a0,a0,0xff
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:7
	return c;
88000fe8:	8fbf0014 	lw	ra,20(sp)
88000fec:	02001025 	move	v0,s0
88000ff0:	8fb00010 	lw	s0,16(sp)
88000ff4:	03e00008 	jr	ra
88000ff8:	27bd0018 	addiu	sp,sp,24

88000ffc <init_serial>:
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
}

template<typename T>
void write(void *addr, T data){
    auto *ptr = reinterpret_cast<volatile T *>(addr);
    *ptr = data;
88000ffc:	3c02bfd0 	lui	v0,0xbfd0
88001000:	2403ff81 	li	v1,-127
88001004:	a0433008 	sb	v1,12296(v0)
88001008:	2403ff80 	li	v1,-128
8800100c:	a043300c 	sb	v1,12300(v0)
88001010:	24030036 	li	v1,54
88001014:	a0433000 	sb	v1,12288(v0)
88001018:	24030003 	li	v1,3
8800101c:	a0403004 	sb	zero,12292(v0)
88001020:	a043300c 	sb	v1,12300(v0)
88001024:	a0403010 	sb	zero,12304(v0)
88001028:	a0403004 	sb	zero,12292(v0)
init_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:45
	write_byte(UART_LCR_ADDR, ~0x80 & 0x03);
	// disable modem controls
	write_byte(UART_MCR_ADDR, 0);
	// disable interrupts
	write_byte(UART_IER_ADDR, 0);
}
8800102c:	03e00008 	jr	ra
88001030:	00000000 	nop

88001034 <write_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
88001034:	3c03bfd0 	lui	v1,0xbfd0
88001038:	90623014 	lbu	v0,12308(v1)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:53
	while (!(read_byte(UART_LSR_ADDR) & 0x01));
	return read_byte(UART_DAT_ADDR);
}

void write_serial(byte_t data){
	while (!(read_byte(UART_LSR_ADDR) & 0x40));
8800103c:	30420040 	andi	v0,v0,0x40
88001040:	1040fffd 	beqz	v0,88001038 <write_serial+0x4>
88001044:	3c02bfd0 	lui	v0,0xbfd0
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88001048:	a0443000 	sb	a0,12288(v0)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:55
	write_byte(UART_DAT_ADDR, data);
}
8800104c:	03e00008 	jr	ra
88001050:	00000000 	nop

88001054 <write_led>:
_Z5writeItEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88001054:	3c02bff0 	lui	v0,0xbff0
88001058:	3442f000 	ori	v0,v0,0xf000
8800105c:	a4440000 	sh	a0,0(v0)
write_led():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:68
	return word;
}

void write_led(hword_t data){
	write_hword(LED_ADDR, data);
}
88001060:	03e00008 	jr	ra
88001064:	00000000 	nop

88001068 <write_segment>:
_Z5writeIjEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88001068:	3c02bff0 	lui	v0,0xbff0
8800106c:	3442f010 	ori	v0,v0,0xf010
88001070:	ac440000 	sw	a0,0(v0)
write_segment():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:72

void write_segment(word_t data){
	write_word(NUM_ADDR, data);
}
88001074:	03e00008 	jr	ra
88001078:	00000000 	nop
8800107c:	74736554 	jalx	81cd9550 <_bss_end+0x1cd8550>
88001080:	20676e69 	addi	a3,v1,28265
88001084:	6f6d656d 	0x6f6d656d
88001088:	62207972 	0x62207972
8800108c:	6f772079 	0x6f772079
88001090:	0a216472 	j	888591c8 <_text_end+0x857c30>
88001094:	00000000 	nop
88001098:	74736554 	jalx	81cd9550 <_bss_end+0x1cd8550>
8800109c:	20676e69 	addi	a3,v1,28265
880010a0:	6f6d656d 	0x6f6d656d
880010a4:	62207972 	0x62207972
880010a8:	79622079 	0x79622079
880010ac:	0a216574 	j	888595d0 <_text_end+0x858038>
880010b0:	00000000 	nop
880010b4:	2a2a2a2a 	slti	t2,s1,10794
880010b8:	6972542a 	0x6972542a
880010bc:	6c616976 	0x6c616976
880010c0:	5350494d 	beql	k0,s0,880135f8 <_text_end+0x12060>
880010c4:	72614220 	0x72614220
880010c8:	654d2065 	0x654d2065
880010cc:	206c6174 	addi	t4,v1,24948
880010d0:	74737953 	jalx	81cde54c <_bss_end+0x1cdd54c>
880010d4:	2a2a6d65 	slti	t2,s1,28005
880010d8:	002a2a2a 	0x2a2a2a
880010dc:	706d6f43 	0x706d6f43
880010e0:	74616c69 	jalx	8185b1a4 <_bss_end+0x185a1a4>
880010e4:	206e6f69 	addi	t6,v1,28521
880010e8:	656d6974 	0x656d6974
880010ec:	3931203a 	xori	s1,t1,0x203a
880010f0:	3a34313a 	xori	s4,s1,0x313a
880010f4:	44203635 	0x44203635
880010f8:	31206365 	andi	zero,t1,0x6365
880010fc:	30322035 	andi	s2,at,0x2035
88001100:	00003931 	tgeu	zero,zero,0xe4
88001104:	6c6c6946 	0x6c6c6946
88001108:	20676e69 	addi	a3,v1,28265
8800110c:	7373622e 	0x7373622e
88001110:	63657320 	0x63657320
88001114:	6e6f6974 	0x6e6f6974
88001118:	74697720 	jalx	81a5dc80 <_bss_end+0x1a5cc80>
8800111c:	2c302068 	sltiu	s0,at,8296
88001120:	66666f20 	0x66666f20
88001124:	3a746573 	xori	s4,s3,0x6573
88001128:	25783020 	addiu	t8,t3,12320
8800112c:	73202c78 	0x73202c78
88001130:	3a657a69 	xori	a1,s3,0x7a69
88001134:	20642520 	addi	a0,v1,9504
88001138:	65747962 	0x65747962
8800113c:	000a2e73 	tltu	zero,t2,0xb9
88001140:	676f7250 	0x676f7250
88001144:	206d6172 	addi	t5,v1,24946
88001148:	74697865 	jalx	81a5e194 <_bss_end+0x1a5d194>
8800114c:	6e206465 	0x6e206465
88001150:	616d726f 	0x616d726f
88001154:	2e796c6c 	sltiu	t9,s3,27756
88001158:	00000000 	nop
8800115c:	676f7250 	0x676f7250
88001160:	206d6172 	addi	t5,v1,24946
88001164:	74697865 	jalx	81a5e194 <_bss_end+0x1a5d194>
88001168:	61206465 	0x61206465
8800116c:	726f6e62 	0x726f6e62
88001170:	6c6c616d 	0x6c6c616d
88001174:	69772079 	0x69772079
88001178:	63206874 	0x63206874
8800117c:	2065646f 	addi	a1,v1,25711
88001180:	0a2e6425 	j	88b99094 <_text_end+0xb97afc>
88001184:	00000000 	nop
88001188:	69676552 	0x69676552
8800118c:	72657473 	0x72657473
88001190:	64252420 	0x64252420
88001194:	7025203a 	0x7025203a
88001198:	0000000a 	movz	zero,zero,zero
8800119c:	3a435045 	xori	v1,s2,0x5045
880011a0:	2c702520 	sltiu	s0,v1,9504
880011a4:	75614320 	jalx	85850c80 <_bss_end+0x584fc80>
880011a8:	203a6573 	addi	k0,at,25971
880011ac:	202c7025 	addi	t4,at,28709
880011b0:	74617453 	jalx	8185d14c <_bss_end+0x185c14c>
880011b4:	203a7375 	addi	k0,at,29557
880011b8:	202c7025 	addi	t4,at,28709
880011bc:	56646142 	bnel	s3,a0,880196c8 <_text_end+0x18130>
880011c0:	72646441 	0x72646441
880011c4:	7025203a 	0x7025203a
880011c8:	4245202c 	c0	0x45202c
880011cc:	3a657361 	xori	a1,s3,0x7361
880011d0:	0a702520 	j	89c09480 <_text_end+0x1c07ee8>
880011d4:	00000000 	nop
880011d8:	20424c54 	addi	v0,v0,19540
880011dc:	6d657469 	0x6d657469
880011e0:	3a642520 	xori	a0,s3,0x2520
880011e4:	746e4520 	jalx	81b91480 <_bss_end+0x1b90480>
880011e8:	69487972 	0x69487972
880011ec:	2c702520 	sltiu	s0,v1,9504
880011f0:	746e4520 	jalx	81b91480 <_bss_end+0x1b90480>
880011f4:	6f4c7972 	0x6f4c7972
880011f8:	25203a31 	addiu	zero,t1,14897
880011fc:	45202c70 	0x45202c70
88001200:	7972746e 	0x7972746e
88001204:	3a326f4c 	xori	s2,s1,0x6f4c
88001208:	0a702520 	j	89c09480 <_text_end+0x1c07ee8>
8800120c:	00000000 	nop
88001210:	20555043 	addi	s5,v0,20547
88001214:	65746e69 	0x65746e69
88001218:	6c616e72 	0x6c616e72
8800121c:	73736120 	0x73736120
88001220:	69747265 	0x69747265
88001224:	66206e6f 	0x66206e6f
88001228:	656c6961 	0x656c6961
8800122c:	61202c64 	0x61202c64
88001230:	74726f62 	jalx	81c9bd88 <_bss_end+0x1c9ad88>
88001234:	0000002e 	0x2e
88001238:	65206e41 	0x65206e41
8800123c:	70656378 	0x70656378
88001240:	6e6f6974 	0x6e6f6974
88001244:	63636f20 	0x63636f20
88001248:	65727275 	0x65727275
8800124c:	77202c64 	jalx	8c80b190 <_text_end+0x4809bf8>
88001250:	20687469 	addi	t0,v1,29801
88001254:	20435045 	addi	v1,v0,20549
88001258:	78257830 	0x78257830
8800125c:	646e6120 	0x646e6120
88001260:	75614320 	jalx	85850c80 <_bss_end+0x584fc80>
88001264:	25206573 	addiu	zero,t1,25971
88001268:	25282064 	addiu	t0,t1,8292
8800126c:	0a2e2973 	j	88b8a5cc <_text_end+0xb89034>
88001270:	00000000 	nop
88001274:	2a2a2a2a 	slti	t2,s1,10794
88001278:	7379532a 	0x7379532a
8800127c:	206d6574 	addi	t5,v1,25972
88001280:	474e4148 	c1	0x14e4148
88001284:	2a2a2a2a 	slti	t2,s1,10794
88001288:	0000002a 	slt	zero,zero,zero
8800128c:	65746e49 	0x65746e49
88001290:	70757272 	0x70757272
88001294:	00000074 	teq	zero,zero,0x1
88001298:	20424c54 	addi	v0,v0,19540
8800129c:	69646f6d 	0x69646f6d
880012a0:	61636966 	0x61636966
880012a4:	6e6f6974 	0x6e6f6974
880012a8:	63786520 	0x63786520
880012ac:	69747065 	0x69747065
880012b0:	00006e6f 	0x6e6f
880012b4:	20424c54 	addi	v0,v0,19540
880012b8:	65637865 	0x65637865
880012bc:	6f697470 	0x6f697470
880012c0:	6c28206e 	0x6c28206e
880012c4:	2064616f 	addi	a0,v1,24943
880012c8:	6920726f 	0x6920726f
880012cc:	7274736e 	0x7274736e
880012d0:	69746375 	0x69746375
880012d4:	66206e6f 	0x66206e6f
880012d8:	68637465 	0x68637465
880012dc:	00000029 	0x29
880012e0:	20424c54 	addi	v0,v0,19540
880012e4:	65637865 	0x65637865
880012e8:	6f697470 	0x6f697470
880012ec:	7328206e 	0x7328206e
880012f0:	65726f74 	0x65726f74
880012f4:	00000029 	0x29
880012f8:	72646441 	0x72646441
880012fc:	20737365 	addi	s3,v1,29541
88001300:	6f727265 	0x6f727265
88001304:	78652072 	0x78652072
88001308:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
8800130c:	206e6f69 	addi	t6,v1,28521
88001310:	616f6c28 	0x616f6c28
88001314:	726f2064 	0x726f2064
88001318:	736e6920 	0x736e6920
8800131c:	63757274 	0x63757274
88001320:	6e6f6974 	0x6e6f6974
88001324:	74656620 	jalx	81959880 <_bss_end+0x1958880>
88001328:	00296863 	0x296863
8800132c:	72646441 	0x72646441
88001330:	20737365 	addi	s3,v1,29541
88001334:	6f727265 	0x6f727265
88001338:	78652072 	0x78652072
8800133c:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88001340:	206e6f69 	addi	t6,v1,28521
88001344:	6f747328 	0x6f747328
88001348:	00296572 	tlt	at,t1,0x195
8800134c:	20737542 	addi	s3,v1,30018
88001350:	6f727265 	0x6f727265
88001354:	78652072 	0x78652072
88001358:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
8800135c:	206e6f69 	addi	t6,v1,28521
88001360:	736e6928 	0x736e6928
88001364:	63757274 	0x63757274
88001368:	6e6f6974 	0x6e6f6974
8800136c:	74656620 	jalx	81959880 <_bss_end+0x1958880>
88001370:	00296863 	0x296863
88001374:	20737542 	addi	s3,v1,30018
88001378:	6f727265 	0x6f727265
8800137c:	78652072 	0x78652072
88001380:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88001384:	206e6f69 	addi	t6,v1,28521
88001388:	74616428 	jalx	818590a0 <_bss_end+0x18580a0>
8800138c:	65722061 	0x65722061
88001390:	65726566 	0x65726566
88001394:	3a65636e 	xori	a1,s3,0x636e
88001398:	616f6c20 	0x616f6c20
8800139c:	726f2064 	0x726f2064
880013a0:	6f747320 	0x6f747320
880013a4:	00296572 	tlt	at,t1,0x195
880013a8:	63737953 	0x63737953
880013ac:	206c6c61 	addi	t4,v1,27745
880013b0:	65637865 	0x65637865
880013b4:	6f697470 	0x6f697470
880013b8:	0000006e 	0x6e
880013bc:	61657242 	0x61657242
880013c0:	696f706b 	0x696f706b
880013c4:	6520746e 	0x6520746e
880013c8:	70656378 	0x70656378
880013cc:	6e6f6974 	0x6e6f6974
880013d0:	00000000 	nop
880013d4:	65736552 	0x65736552
880013d8:	64657672 	0x64657672
880013dc:	736e6920 	0x736e6920
880013e0:	63757274 	0x63757274
880013e4:	6e6f6974 	0x6e6f6974
880013e8:	63786520 	0x63786520
880013ec:	69747065 	0x69747065
880013f0:	00006e6f 	0x6e6f
880013f4:	72706f43 	0x72706f43
880013f8:	7365636f 	0x7365636f
880013fc:	20726f73 	addi	s2,v1,28531
88001400:	73756e55 	0x73756e55
88001404:	656c6261 	0x656c6261
88001408:	63786520 	0x63786520
8800140c:	69747065 	0x69747065
88001410:	00006e6f 	0x6e6f
88001414:	74697241 	jalx	81a5c904 <_bss_end+0x1a5b904>
88001418:	74656d68 	jalx	8195b5a0 <_bss_end+0x195a5a0>
8800141c:	4f206369 	c3	0x1206369
88001420:	66726576 	0x66726576
88001424:	20776f6c 	addi	s7,v1,28524
88001428:	65637865 	0x65637865
8800142c:	6f697470 	0x6f697470
88001430:	0000006e 	0x6e
88001434:	70617254 	0x70617254
88001438:	63786520 	0x63786520
8800143c:	69747065 	0x69747065
88001440:	00006e6f 	0x6e6f
88001444:	2041534d 	addi	at,v0,21325
88001448:	616f6c46 	0x616f6c46
8800144c:	676e6974 	0x676e6974
88001450:	696f502d 	0x696f502d
88001454:	6520746e 	0x6520746e
88001458:	70656378 	0x70656378
8800145c:	6e6f6974 	0x6e6f6974
88001460:	00000000 	nop
88001464:	20424c54 	addi	v0,v0,19540
88001468:	64616552 	0x64616552
8800146c:	686e492d 	0x686e492d
88001470:	74696269 	jalx	81a589a4 <_bss_end+0x1a579a4>
88001474:	63786520 	0x63786520
88001478:	69747065 	0x69747065
8800147c:	00006e6f 	0x6e6f
88001480:	20424c54 	addi	v0,v0,19540
88001484:	63657845 	0x63657845
88001488:	6f697475 	0x6f697475
8800148c:	6e492d6e 	0x6e492d6e
88001490:	69626968 	0x69626968
88001494:	78652074 	0x78652074
88001498:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
8800149c:	006e6f69 	0x6e6f69
880014a0:	43544157 	c0	0x1544157
880014a4:	00000048 	0x48
880014a8:	6863614d 	0x6863614d
880014ac:	20656e69 	addi	a1,v1,28265
880014b0:	63656863 	0x63656863
880014b4:	0000006b 	0x6b
880014b8:	65726854 	0x65726854
880014bc:	41206461 	0x41206461
880014c0:	636f6c6c 	0x636f6c6c
880014c4:	6f697461 	0x6f697461
880014c8:	44202c6e 	0x44202c6e
880014cc:	6c6c6165 	0x6c6c6165
880014d0:	7461636f 	jalx	81858dbc <_bss_end+0x1857dbc>
880014d4:	2c6e6f69 	sltiu	t6,v1,28521
880014d8:	20726f20 	addi	s2,v1,28448
880014dc:	65686353 	0x65686353
880014e0:	696c7564 	0x696c7564
880014e4:	4520676e 	0x4520676e
880014e8:	70656378 	0x70656378
880014ec:	6e6f6974 	0x6e6f6974
880014f0:	00000073 	tltu	zero,zero,0x1
880014f4:	68636143 	0x68636143
880014f8:	72652065 	0x72652065
880014fc:	00726f72 	tlt	v1,s2,0x1bd

88001500 <EXCEPTION_MESSAGES>:
88001500:	8800128c 	lwl	zero,4748(zero)
88001504:	88001298 	lwl	zero,4760(zero)
88001508:	880012b4 	lwl	zero,4788(zero)
8800150c:	880012e0 	lwl	zero,4832(zero)
88001510:	880012f8 	lwl	zero,4856(zero)
88001514:	8800132c 	lwl	zero,4908(zero)
88001518:	8800134c 	lwl	zero,4940(zero)
8800151c:	88001374 	lwl	zero,4980(zero)
88001520:	880013a8 	lwl	zero,5032(zero)
88001524:	880013bc 	lwl	zero,5052(zero)
88001528:	880013d4 	lwl	zero,5076(zero)
8800152c:	880013f4 	lwl	zero,5108(zero)
88001530:	88001414 	lwl	zero,5140(zero)
88001534:	88001434 	lwl	zero,5172(zero)
88001538:	88001444 	lwl	zero,5188(zero)
8800153c:	88001448 	lwl	zero,5192(zero)
88001540:	88001094 	lwl	zero,4244(zero)
88001544:	88001094 	lwl	zero,4244(zero)
88001548:	88001094 	lwl	zero,4244(zero)
8800154c:	88001464 	lwl	zero,5220(zero)
88001550:	88001480 	lwl	zero,5248(zero)
88001554:	88001094 	lwl	zero,4244(zero)
88001558:	88001094 	lwl	zero,4244(zero)
8800155c:	880014a0 	lwl	zero,5280(zero)
88001560:	880014a8 	lwl	zero,5288(zero)
88001564:	880014b8 	lwl	zero,5304(zero)
88001568:	88001094 	lwl	zero,4244(zero)
8800156c:	88001094 	lwl	zero,4244(zero)
88001570:	88001094 	lwl	zero,4244(zero)
88001574:	88001094 	lwl	zero,4244(zero)
88001578:	880014f4 	lwl	zero,5364(zero)
8800157c:	88001094 	lwl	zero,4244(zero)
88001580:	01200000 	0x1200000
88001584:	02000101 	0x2000101
	...
88001590:	00000001 	movf	zero,zero,$fcc0
88001594:	00000000 	nop

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
      40:	05000016 	bltz	t0,9c <_data-0x7fffff64>
      44:	00001695 	0x1695
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
#else
    const char *s = src;
    char *d = dst;
    if (s < d && s + n > d) {
        s += n, d += n;
        while (n -- > 0) {
      48:	505a0101 	beql	v0,k0,450 <_data-0x7ffffbb0>
      4c:	06000001 	bltz	s0,54 <_data-0x7fffffac>
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
      60:	04000000 	bltz	zero,64 <_data-0x7fffff9c>
      64:	00000001 	movf	zero,zero,$fcc0
      68:	00002507 	0x2507
      6c:	00020400 	sll	zero,v0,0x10
      70:	25070000 	addiu	a3,t0,0
      74:	04000000 	bltz	zero,78 <_data-0x7fffff88>
      78:	00000003 	sra	zero,zero,0x0
      7c:	00002507 	0x2507
      80:	00040400 	sll	zero,a0,0x10
      84:	25070000 	addiu	a3,t0,0
      88:	04000000 	bltz	zero,8c <_data-0x7fffff74>
      8c:	00000005 	0x5
      90:	00002507 	0x2507
      94:	00060400 	sll	zero,a2,0x10
      98:	25070000 	addiu	a3,t0,0
      9c:	04000000 	bltz	zero,a0 <_data-0x7fffff60>
      a0:	00000007 	srav	zero,zero,zero
      a4:	00002507 	0x2507
      a8:	00080400 	sll	zero,t0,0x10
      ac:	25070000 	addiu	a3,t0,0
      b0:	04000000 	bltz	zero,b4 <_data-0x7fffff4c>
      b4:	00000009 	jalr	zero,zero
      b8:	00002507 	0x2507
      bc:	000a0400 	sll	zero,t2,0x10
      c0:	25070000 	addiu	a3,t0,0
      c4:	04000000 	bltz	zero,c8 <_data-0x7fffff38>
      c8:	0000000b 	movn	zero,zero,zero
      cc:	00002507 	0x2507
      d0:	000c0400 	sll	zero,t4,0x10
      d4:	25070000 	addiu	a3,t0,0
      d8:	04000000 	bltz	zero,dc <_data-0x7fffff24>
      dc:	0000000d 	break
      e0:	00002507 	0x2507
      e4:	000e0400 	sll	zero,t6,0x10
      e8:	25070000 	addiu	a3,t0,0
      ec:	04000000 	bltz	zero,f0 <_data-0x7fffff10>
      f0:	0000000f 	sync
      f4:	00002507 	0x2507
      f8:	00100400 	sll	zero,s0,0x10
      fc:	25070000 	addiu	a3,t0,0
     100:	04000000 	bltz	zero,104 <_data-0x7ffffefc>
     104:	00000011 	mthi	zero
     108:	00002507 	0x2507
     10c:	00120400 	sll	zero,s2,0x10
     110:	25070000 	addiu	a3,t0,0
     114:	04000000 	bltz	zero,118 <_data-0x7ffffee8>
     118:	00000013 	mtlo	zero
     11c:	00002507 	0x2507
     120:	00140400 	sll	zero,s4,0x10
     124:	25070000 	addiu	a3,t0,0
     128:	04000000 	bltz	zero,12c <_data-0x7ffffed4>
     12c:	00000015 	0x15
     130:	00002507 	0x2507
     134:	00160400 	sll	zero,s6,0x10
     138:	25070000 	addiu	a3,t0,0
     13c:	04000000 	bltz	zero,140 <_data-0x7ffffec0>
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
     168:	07000000 	bltz	t8,16c <_data-0x7ffffe94>
     16c:	00000025 	move	zero,zero
     170:	00000104 	0x104
     174:	00250700 	0x250700
     178:	02040000 	0x2040000
     17c:	07000000 	bltz	t8,180 <_data-0x7ffffe80>
     180:	00000025 	move	zero,zero
     184:	00000304 	0x304
     188:	00250700 	0x250700
     18c:	04040000 	0x4040000
     190:	00000000 	nop
     194:	0a670500 	j	99c1400 <_data-0x7663ec00>
     198:	01010000 	0x1010000
     19c:	0002ac5a 	0x2ac5a
     1a0:	00490600 	0x490600
     1a4:	25075a01 	addiu	a3,t0,23041
     1a8:	04000000 	bltz	zero,1ac <_data-0x7ffffe54>
     1ac:	00000000 	nop
     1b0:	00002507 	0x2507
     1b4:	00010400 	sll	zero,at,0x10
     1b8:	25070000 	addiu	a3,t0,0
     1bc:	04000000 	bltz	zero,1c0 <_data-0x7ffffe40>
     1c0:	00000002 	srl	zero,zero,0x0
     1c4:	00002507 	0x2507
     1c8:	00030400 	sll	zero,v1,0x10
     1cc:	25070000 	addiu	a3,t0,0
     1d0:	04000000 	bltz	zero,1d4 <_data-0x7ffffe2c>
     1d4:	00000004 	sllv	zero,zero,zero
     1d8:	00002507 	0x2507
     1dc:	00050400 	sll	zero,a1,0x10
     1e0:	25070000 	addiu	a3,t0,0
     1e4:	04000000 	bltz	zero,1e8 <_data-0x7ffffe18>
     1e8:	00000006 	srlv	zero,zero,zero
     1ec:	00002507 	0x2507
     1f0:	00070400 	sll	zero,a3,0x10
     1f4:	25070000 	addiu	a3,t0,0
     1f8:	04000000 	bltz	zero,1fc <_data-0x7ffffe04>
     1fc:	00000008 	jr	zero
     200:	00002507 	0x2507
     204:	00090400 	sll	zero,t1,0x10
     208:	25070000 	addiu	a3,t0,0
     20c:	04000000 	bltz	zero,210 <_data-0x7ffffdf0>
     210:	0000000a 	movz	zero,zero,zero
     214:	00002507 	0x2507
     218:	000b0400 	sll	zero,t3,0x10
     21c:	25070000 	addiu	a3,t0,0
     220:	04000000 	bltz	zero,224 <_data-0x7ffffddc>
     224:	0000000c 	syscall
     228:	00002507 	0x2507
     22c:	000d0400 	sll	zero,t5,0x10
     230:	25070000 	addiu	a3,t0,0
     234:	04000000 	bltz	zero,238 <_data-0x7ffffdc8>
     238:	0000000e 	0xe
     23c:	00002507 	0x2507
     240:	000f0400 	sll	zero,t7,0x10
     244:	25070000 	addiu	a3,t0,0
     248:	04000000 	bltz	zero,24c <_data-0x7ffffdb4>
     24c:	00000010 	mfhi	zero
     250:	00002507 	0x2507
     254:	00110400 	sll	zero,s1,0x10
     258:	25070000 	addiu	a3,t0,0
     25c:	04000000 	bltz	zero,260 <_data-0x7ffffda0>
     260:	00000012 	mflo	zero
     264:	00002507 	0x2507
     268:	00130400 	sll	zero,s3,0x10
     26c:	25070000 	addiu	a3,t0,0
     270:	04000000 	bltz	zero,274 <_data-0x7ffffd8c>
     274:	00000014 	0x14
     278:	00002507 	0x2507
     27c:	00150400 	sll	zero,s5,0x10
     280:	25070000 	addiu	a3,t0,0
     284:	04000000 	bltz	zero,288 <_data-0x7ffffd78>
     288:	00000016 	0x16
     28c:	00002507 	0x2507
     290:	00170400 	sll	zero,s7,0x10
     294:	25070000 	addiu	a3,t0,0
     298:	04000000 	bltz	zero,29c <_data-0x7ffffd64>
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
     2c4:	07000000 	bltz	t8,2c8 <_data-0x7ffffd38>
     2c8:	00000025 	move	zero,zero
     2cc:	00000104 	0x104
     2d0:	00250700 	0x250700
     2d4:	02040000 	0x2040000
     2d8:	07000000 	bltz	t8,2dc <_data-0x7ffffd24>
     2dc:	00000025 	move	zero,zero
     2e0:	00000304 	0x304
     2e4:	00250700 	0x250700
     2e8:	04040000 	0x4040000
     2ec:	07000000 	bltz	t8,2f0 <_data-0x7ffffd10>
     2f0:	00000025 	move	zero,zero
     2f4:	00000504 	0x504
     2f8:	00250700 	0x250700
     2fc:	06040000 	0x6040000
     300:	07000000 	bltz	t8,304 <_data-0x7ffffcfc>
     304:	00000025 	move	zero,zero
     308:	00000704 	0x704
     30c:	00250700 	0x250700
     310:	08040000 	j	100000 <_data-0x7ff00000>
     314:	07000000 	bltz	t8,318 <_data-0x7ffffce8>
     318:	00000025 	move	zero,zero
     31c:	00000904 	0x904
     320:	05000000 	bltz	t0,324 <_data-0x7ffffcdc>
     324:	00000b8e 	0xb8e
     328:	4a5a0101 	c2	0x5a0101
     32c:	06000003 	bltz	s0,33c <_data-0x7ffffcc4>
     330:	5a010049 	0x5a010049
     334:	00002507 	0x2507
     338:	00000400 	sll	zero,zero,0x10
     33c:	25070000 	addiu	a3,t0,0
     340:	04000000 	bltz	zero,344 <_data-0x7ffffcbc>
     344:	00000001 	movf	zero,zero,$fcc0
     348:	71080000 	madd	t0,t0
     34c:	01000000 	0x1000000
     350:	00073c67 	0x73c67
     354:	0003cd00 	sll	t9,v1,0x14
     358:	07240900 	0x7240900
     35c:	03950000 	0x3950000
     360:	ad0a0000 	sw	t2,0(t0)
     364:	0a000016 	j	8000058 <_data-0x77ffffa8>
     368:	000016ad 	0x16ad
     36c:	0016ad0a 	0x16ad0a
     370:	16ad0a00 	bne	s5,t5,2b74 <_data-0x7fffd48c>
     374:	ad0a0000 	sw	t2,0(t0)
     378:	0a000016 	j	8000058 <_data-0x77ffffa8>
     37c:	000016ad 	0x16ad
     380:	0016ad0a 	0x16ad0a
     384:	16ad0a00 	bne	s5,t5,2b88 <_data-0x7fffd478>
     388:	ad0a0000 	sw	t2,0(t0)
     38c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     390:	000016ad 	0x16ad
     394:	16b90b00 	bne	s5,t9,2f98 <_data-0x7fffd068>
     398:	ad0b0000 	sw	t3,0(t0)
     39c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     3a0:	000016ad 	0x16ad
     3a4:	0016ad0b 	0x16ad0b
     3a8:	16ad0b00 	bne	s5,t5,2fac <_data-0x7fffd054>
     3ac:	ad0b0000 	sw	t3,0(t0)
     3b0:	0b000016 	j	c000058 <_data-0x73ffffa8>
     3b4:	000016ad 	0x16ad
     3b8:	0016ad0b 	0x16ad0b
     3bc:	16ad0b00 	bne	s5,t5,2fc0 <_data-0x7fffd040>
     3c0:	ad0b0000 	sw	t3,0(t0)
     3c4:	0b000016 	j	c000058 <_data-0x73ffffa8>
     3c8:	000016ad 	0x16ad
     3cc:	112b0800 	beq	t1,t3,23d0 <_data-0x7fffdc30>
     3d0:	67010000 	0x67010000
     3d4:	00001849 	0x1849
     3d8:	0000045a 	0x45a
     3dc:	00072409 	0x72409
     3e0:	00041d00 	sll	v1,a0,0x14
     3e4:	16ad0a00 	bne	s5,t5,2be8 <_data-0x7fffd418>
     3e8:	ad0a0000 	sw	t2,0(t0)
     3ec:	0a000016 	j	8000058 <_data-0x77ffffa8>
     3f0:	000016ad 	0x16ad
     3f4:	0016ad0a 	0x16ad0a
     3f8:	16ad0a00 	bne	s5,t5,2bfc <_data-0x7fffd404>
     3fc:	ad0a0000 	sw	t2,0(t0)
     400:	0a000016 	j	8000058 <_data-0x77ffffa8>
     404:	000016ad 	0x16ad
     408:	0016ad0a 	0x16ad0a
     40c:	16ad0a00 	bne	s5,t5,2c10 <_data-0x7fffd3f0>
     410:	ad0a0000 	sw	t2,0(t0)
     414:	0a000016 	j	8000058 <_data-0x77ffffa8>
     418:	000016ad 	0x16ad
     41c:	16b90b00 	bne	s5,t9,3020 <_data-0x7fffcfe0>
     420:	ad0b0000 	sw	t3,0(t0)
     424:	0b000016 	j	c000058 <_data-0x73ffffa8>
     428:	000016ad 	0x16ad
     42c:	0016ad0b 	0x16ad0b
     430:	16ad0b00 	bne	s5,t5,3034 <_data-0x7fffcfcc>
     434:	ad0b0000 	sw	t3,0(t0)
     438:	0b000016 	j	c000058 <_data-0x73ffffa8>
     43c:	000016ad 	0x16ad
     440:	0016ad0b 	0x16ad0b
     444:	16ad0b00 	bne	s5,t5,3048 <_data-0x7fffcfb8>
     448:	ad0b0000 	sw	t3,0(t0)
     44c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     450:	000016ad 	0x16ad
     454:	0016ad0b 	0x16ad0b
     458:	49080000 	bc2f	$cc2,45c <_data-0x7ffffba4>
     45c:	01000001 	movf	zero,t0,$fcc0
     460:	00044a67 	0x44a67
     464:	0004f100 	sll	s8,a0,0x4
     468:	07240900 	0x7240900
     46c:	04af0000 	0x4af0000
     470:	ad0a0000 	sw	t2,0(t0)
     474:	0a000016 	j	8000058 <_data-0x77ffffa8>
     478:	000016ad 	0x16ad
     47c:	0016ad0a 	0x16ad0a
     480:	16ad0a00 	bne	s5,t5,2c84 <_data-0x7fffd37c>
     484:	ad0a0000 	sw	t2,0(t0)
     488:	0a000016 	j	8000058 <_data-0x77ffffa8>
     48c:	000016ad 	0x16ad
     490:	0016ad0a 	0x16ad0a
     494:	16ad0a00 	bne	s5,t5,2c98 <_data-0x7fffd368>
     498:	ad0a0000 	sw	t2,0(t0)
     49c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     4a0:	000016ad 	0x16ad
     4a4:	0016ad0a 	0x16ad0a
     4a8:	16ad0a00 	bne	s5,t5,2cac <_data-0x7fffd354>
     4ac:	0b000000 	j	c000000 <_data-0x74000000>
     4b0:	000016b9 	0x16b9
     4b4:	0016ad0b 	0x16ad0b
     4b8:	16ad0b00 	bne	s5,t5,30bc <_data-0x7fffcf44>
     4bc:	ad0b0000 	sw	t3,0(t0)
     4c0:	0b000016 	j	c000058 <_data-0x73ffffa8>
     4c4:	000016ad 	0x16ad
     4c8:	0016ad0b 	0x16ad0b
     4cc:	16ad0b00 	bne	s5,t5,30d0 <_data-0x7fffcf30>
     4d0:	ad0b0000 	sw	t3,0(t0)
     4d4:	0b000016 	j	c000058 <_data-0x73ffffa8>
     4d8:	000016ad 	0x16ad
     4dc:	0016ad0b 	0x16ad0b
     4e0:	16ad0b00 	bne	s5,t5,30e4 <_data-0x7fffcf1c>
     4e4:	ad0b0000 	sw	t3,0(t0)
     4e8:	0b000016 	j	c000058 <_data-0x73ffffa8>
     4ec:	000016ad 	0x16ad
     4f0:	10910800 	beq	a0,s1,24f4 <_data-0x7fffdb0c>
     4f4:	67010000 	0x67010000
     4f8:	00000036 	tne	zero,zero
     4fc:	00000592 	0x592
     500:	00072409 	0x72409
     504:	00054b00 	sll	t1,a1,0xc
     508:	16ad0a00 	bne	s5,t5,2d0c <_data-0x7fffd2f4>
     50c:	ad0a0000 	sw	t2,0(t0)
     510:	0a000016 	j	8000058 <_data-0x77ffffa8>
     514:	000016ad 	0x16ad
     518:	0016ad0a 	0x16ad0a
     51c:	16ad0a00 	bne	s5,t5,2d20 <_data-0x7fffd2e0>
     520:	ad0a0000 	sw	t2,0(t0)
     524:	0a000016 	j	8000058 <_data-0x77ffffa8>
     528:	000016ad 	0x16ad
     52c:	0016ad0a 	0x16ad0a
     530:	16ad0a00 	bne	s5,t5,2d34 <_data-0x7fffd2cc>
     534:	ad0a0000 	sw	t2,0(t0)
     538:	0a000016 	j	8000058 <_data-0x77ffffa8>
     53c:	000016ad 	0x16ad
     540:	0016ad0a 	0x16ad0a
     544:	16ad0a00 	bne	s5,t5,2d48 <_data-0x7fffd2b8>
     548:	0b000000 	j	c000000 <_data-0x74000000>
     54c:	000016b9 	0x16b9
     550:	0016ad0b 	0x16ad0b
     554:	16ad0b00 	bne	s5,t5,3158 <_data-0x7fffcea8>
     558:	ad0b0000 	sw	t3,0(t0)
     55c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     560:	000016ad 	0x16ad
     564:	0016ad0b 	0x16ad0b
     568:	16ad0b00 	bne	s5,t5,316c <_data-0x7fffce94>
     56c:	ad0b0000 	sw	t3,0(t0)
     570:	0b000016 	j	c000058 <_data-0x73ffffa8>
     574:	000016ad 	0x16ad
     578:	0016ad0b 	0x16ad0b
     57c:	16ad0b00 	bne	s5,t5,3180 <_data-0x7fffce80>
     580:	ad0b0000 	sw	t3,0(t0)
     584:	0b000016 	j	c000058 <_data-0x73ffffa8>
     588:	000016ad 	0x16ad
     58c:	0016ad0b 	0x16ad0b
     590:	4c080000 	mfc3	t0,$0
     594:	01000006 	srlv	zero,zero,t0
     598:	00061067 	0x61067
     59c:	00063d00 	sll	a3,a2,0x14
     5a0:	07240900 	0x7240900
     5a4:	05f10000 	bgezal	t7,5a8 <_data-0x7ffffa58>
     5a8:	ad0a0000 	sw	t2,0(t0)
     5ac:	0a000016 	j	8000058 <_data-0x77ffffa8>
     5b0:	000016ad 	0x16ad
     5b4:	0016ad0a 	0x16ad0a
     5b8:	16ad0a00 	bne	s5,t5,2dbc <_data-0x7fffd244>
     5bc:	ad0a0000 	sw	t2,0(t0)
     5c0:	0a000016 	j	8000058 <_data-0x77ffffa8>
     5c4:	000016ad 	0x16ad
     5c8:	0016ad0a 	0x16ad0a
     5cc:	16ad0a00 	bne	s5,t5,2dd0 <_data-0x7fffd230>
     5d0:	ad0a0000 	sw	t2,0(t0)
     5d4:	0a000016 	j	8000058 <_data-0x77ffffa8>
     5d8:	000016ad 	0x16ad
     5dc:	0016ad0a 	0x16ad0a
     5e0:	16ad0a00 	bne	s5,t5,2de4 <_data-0x7fffd21c>
     5e4:	ad0a0000 	sw	t2,0(t0)
     5e8:	0a000016 	j	8000058 <_data-0x77ffffa8>
     5ec:	000016ad 	0x16ad
     5f0:	16b90b00 	bne	s5,t9,31f4 <_data-0x7fffce0c>
     5f4:	ad0b0000 	sw	t3,0(t0)
     5f8:	0b000016 	j	c000058 <_data-0x73ffffa8>
     5fc:	000016ad 	0x16ad
     600:	0016ad0b 	0x16ad0b
     604:	16ad0b00 	bne	s5,t5,3208 <_data-0x7fffcdf8>
     608:	ad0b0000 	sw	t3,0(t0)
     60c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     610:	000016ad 	0x16ad
     614:	0016ad0b 	0x16ad0b
     618:	16ad0b00 	bne	s5,t5,321c <_data-0x7fffcde4>
     61c:	ad0b0000 	sw	t3,0(t0)
     620:	0b000016 	j	c000058 <_data-0x73ffffa8>
     624:	000016ad 	0x16ad
     628:	0016ad0b 	0x16ad0b
     62c:	16ad0b00 	bne	s5,t5,3230 <_data-0x7fffcdd0>
     630:	ad0b0000 	sw	t3,0(t0)
     634:	0b000016 	j	c000058 <_data-0x73ffffa8>
     638:	000016ad 	0x16ad
     63c:	07740800 	0x7740800
     640:	67010000 	0x67010000
     644:	000001a8 	0x1a8
     648:	000006f2 	tlt	zero,zero,0x1b
     64c:	00072409 	0x72409
     650:	0006a100 	sll	s4,a2,0x4
     654:	16ad0a00 	bne	s5,t5,2e58 <_data-0x7fffd1a8>
     658:	ad0a0000 	sw	t2,0(t0)
     65c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     660:	000016ad 	0x16ad
     664:	0016ad0a 	0x16ad0a
     668:	16ad0a00 	bne	s5,t5,2e6c <_data-0x7fffd194>
     66c:	ad0a0000 	sw	t2,0(t0)
     670:	0a000016 	j	8000058 <_data-0x77ffffa8>
     674:	000016ad 	0x16ad
     678:	0016ad0a 	0x16ad0a
     67c:	16ad0a00 	bne	s5,t5,2e80 <_data-0x7fffd180>
     680:	ad0a0000 	sw	t2,0(t0)
     684:	0a000016 	j	8000058 <_data-0x77ffffa8>
     688:	000016ad 	0x16ad
     68c:	0016ad0a 	0x16ad0a
     690:	16ad0a00 	bne	s5,t5,2e94 <_data-0x7fffd16c>
     694:	ad0a0000 	sw	t2,0(t0)
     698:	0a000016 	j	8000058 <_data-0x77ffffa8>
     69c:	000016ad 	0x16ad
     6a0:	16b90b00 	bne	s5,t9,32a4 <_data-0x7fffcd5c>
     6a4:	ad0b0000 	sw	t3,0(t0)
     6a8:	0b000016 	j	c000058 <_data-0x73ffffa8>
     6ac:	000016ad 	0x16ad
     6b0:	0016ad0b 	0x16ad0b
     6b4:	16ad0b00 	bne	s5,t5,32b8 <_data-0x7fffcd48>
     6b8:	ad0b0000 	sw	t3,0(t0)
     6bc:	0b000016 	j	c000058 <_data-0x73ffffa8>
     6c0:	000016ad 	0x16ad
     6c4:	0016ad0b 	0x16ad0b
     6c8:	16ad0b00 	bne	s5,t5,32cc <_data-0x7fffcd34>
     6cc:	ad0b0000 	sw	t3,0(t0)
     6d0:	0b000016 	j	c000058 <_data-0x73ffffa8>
     6d4:	000016ad 	0x16ad
     6d8:	0016ad0b 	0x16ad0b
     6dc:	16ad0b00 	bne	s5,t5,32e0 <_data-0x7fffcd20>
     6e0:	ad0b0000 	sw	t3,0(t0)
     6e4:	0b000016 	j	c000058 <_data-0x73ffffa8>
     6e8:	000016ad 	0x16ad
     6ec:	0016ad0b 	0x16ad0b
     6f0:	af080000 	sw	t0,0(t8)
     6f4:	01000003 	0x1000003
     6f8:	000dbf67 	0xdbf67
     6fc:	0007b100 	sll	s6,a3,0x4
     700:	07240900 	0x7240900
     704:	075b0000 	0x75b0000
     708:	ad0a0000 	sw	t2,0(t0)
     70c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     710:	000016ad 	0x16ad
     714:	0016ad0a 	0x16ad0a
     718:	16ad0a00 	bne	s5,t5,2f1c <_data-0x7fffd0e4>
     71c:	ad0a0000 	sw	t2,0(t0)
     720:	0a000016 	j	8000058 <_data-0x77ffffa8>
     724:	000016ad 	0x16ad
     728:	0016ad0a 	0x16ad0a
     72c:	16ad0a00 	bne	s5,t5,2f30 <_data-0x7fffd0d0>
     730:	ad0a0000 	sw	t2,0(t0)
     734:	0a000016 	j	8000058 <_data-0x77ffffa8>
     738:	000016ad 	0x16ad
     73c:	0016ad0a 	0x16ad0a
     740:	16ad0a00 	bne	s5,t5,2f44 <_data-0x7fffd0bc>
     744:	ad0a0000 	sw	t2,0(t0)
     748:	0a000016 	j	8000058 <_data-0x77ffffa8>
     74c:	000016ad 	0x16ad
     750:	0016ad0a 	0x16ad0a
     754:	16ad0a00 	bne	s5,t5,2f58 <_data-0x7fffd0a8>
     758:	0b000000 	j	c000000 <_data-0x74000000>
     75c:	000016b9 	0x16b9
     760:	0016ad0b 	0x16ad0b
     764:	16ad0b00 	bne	s5,t5,3368 <_data-0x7fffcc98>
     768:	ad0b0000 	sw	t3,0(t0)
     76c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     770:	000016ad 	0x16ad
     774:	0016ad0b 	0x16ad0b
     778:	16ad0b00 	bne	s5,t5,337c <_data-0x7fffcc84>
     77c:	ad0b0000 	sw	t3,0(t0)
     780:	0b000016 	j	c000058 <_data-0x73ffffa8>
     784:	000016ad 	0x16ad
     788:	0016ad0b 	0x16ad0b
     78c:	16ad0b00 	bne	s5,t5,3390 <_data-0x7fffcc70>
     790:	ad0b0000 	sw	t3,0(t0)
     794:	0b000016 	j	c000058 <_data-0x73ffffa8>
     798:	000016ad 	0x16ad
     79c:	0016ad0b 	0x16ad0b
     7a0:	16ad0b00 	bne	s5,t5,33a4 <_data-0x7fffcc5c>
     7a4:	ad0b0000 	sw	t3,0(t0)
     7a8:	0b000016 	j	c000058 <_data-0x73ffffa8>
     7ac:	000016ad 	0x16ad
     7b0:	093d0800 	j	4f42000 <_data-0x7b0be000>
     7b4:	67010000 	0x67010000
     7b8:	00001184 	0x1184
     7bc:	0000087a 	0x87a
     7c0:	00072409 	0x72409
     7c4:	00081f00 	sll	v1,t0,0x1c
     7c8:	16ad0a00 	bne	s5,t5,2fcc <_data-0x7fffd034>
     7cc:	ad0a0000 	sw	t2,0(t0)
     7d0:	0a000016 	j	8000058 <_data-0x77ffffa8>
     7d4:	000016ad 	0x16ad
     7d8:	0016ad0a 	0x16ad0a
     7dc:	16ad0a00 	bne	s5,t5,2fe0 <_data-0x7fffd020>
     7e0:	ad0a0000 	sw	t2,0(t0)
     7e4:	0a000016 	j	8000058 <_data-0x77ffffa8>
     7e8:	000016ad 	0x16ad
     7ec:	0016ad0a 	0x16ad0a
     7f0:	16ad0a00 	bne	s5,t5,2ff4 <_data-0x7fffd00c>
     7f4:	ad0a0000 	sw	t2,0(t0)
     7f8:	0a000016 	j	8000058 <_data-0x77ffffa8>
     7fc:	000016ad 	0x16ad
     800:	0016ad0a 	0x16ad0a
     804:	16ad0a00 	bne	s5,t5,3008 <_data-0x7fffcff8>
     808:	ad0a0000 	sw	t2,0(t0)
     80c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     810:	000016ad 	0x16ad
     814:	0016ad0a 	0x16ad0a
     818:	16ad0a00 	bne	s5,t5,301c <_data-0x7fffcfe4>
     81c:	0b000000 	j	c000000 <_data-0x74000000>
     820:	000016b9 	0x16b9
     824:	0016ad0b 	0x16ad0b
     828:	16ad0b00 	bne	s5,t5,342c <_data-0x7fffcbd4>
     82c:	ad0b0000 	sw	t3,0(t0)
     830:	0b000016 	j	c000058 <_data-0x73ffffa8>
     834:	000016ad 	0x16ad
     838:	0016ad0b 	0x16ad0b
     83c:	16ad0b00 	bne	s5,t5,3440 <_data-0x7fffcbc0>
     840:	ad0b0000 	sw	t3,0(t0)
     844:	0b000016 	j	c000058 <_data-0x73ffffa8>
     848:	000016ad 	0x16ad
     84c:	0016ad0b 	0x16ad0b
     850:	16ad0b00 	bne	s5,t5,3454 <_data-0x7fffcbac>
     854:	ad0b0000 	sw	t3,0(t0)
     858:	0b000016 	j	c000058 <_data-0x73ffffa8>
     85c:	000016ad 	0x16ad
     860:	0016ad0b 	0x16ad0b
     864:	16ad0b00 	bne	s5,t5,3468 <_data-0x7fffcb98>
     868:	ad0b0000 	sw	t3,0(t0)
     86c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     870:	000016ad 	0x16ad
     874:	0016ad0b 	0x16ad0b
     878:	b3080000 	0xb3080000
     87c:	0100000c 	syscall	0x40000
     880:	0004cc67 	0x4cc67
     884:	00094d00 	sll	t1,t1,0x14
     888:	07240900 	0x7240900
     88c:	08ed0000 	j	3b40000 <_data-0x7c4c0000>
     890:	ad0a0000 	sw	t2,0(t0)
     894:	0a000016 	j	8000058 <_data-0x77ffffa8>
     898:	000016ad 	0x16ad
     89c:	0016ad0a 	0x16ad0a
     8a0:	16ad0a00 	bne	s5,t5,30a4 <_data-0x7fffcf5c>
     8a4:	ad0a0000 	sw	t2,0(t0)
     8a8:	0a000016 	j	8000058 <_data-0x77ffffa8>
     8ac:	000016ad 	0x16ad
     8b0:	0016ad0a 	0x16ad0a
     8b4:	16ad0a00 	bne	s5,t5,30b8 <_data-0x7fffcf48>
     8b8:	ad0a0000 	sw	t2,0(t0)
     8bc:	0a000016 	j	8000058 <_data-0x77ffffa8>
     8c0:	000016ad 	0x16ad
     8c4:	0016ad0a 	0x16ad0a
     8c8:	16ad0a00 	bne	s5,t5,30cc <_data-0x7fffcf34>
     8cc:	ad0a0000 	sw	t2,0(t0)
     8d0:	0a000016 	j	8000058 <_data-0x77ffffa8>
     8d4:	000016ad 	0x16ad
     8d8:	0016ad0a 	0x16ad0a
     8dc:	16ad0a00 	bne	s5,t5,30e0 <_data-0x7fffcf20>
     8e0:	ad0a0000 	sw	t2,0(t0)
     8e4:	0a000016 	j	8000058 <_data-0x77ffffa8>
     8e8:	000016ad 	0x16ad
     8ec:	16b90b00 	bne	s5,t9,34f0 <_data-0x7fffcb10>
     8f0:	ad0b0000 	sw	t3,0(t0)
     8f4:	0b000016 	j	c000058 <_data-0x73ffffa8>
     8f8:	000016ad 	0x16ad
     8fc:	0016ad0b 	0x16ad0b
     900:	16ad0b00 	bne	s5,t5,3504 <_data-0x7fffcafc>
     904:	ad0b0000 	sw	t3,0(t0)
     908:	0b000016 	j	c000058 <_data-0x73ffffa8>
     90c:	000016ad 	0x16ad
     910:	0016ad0b 	0x16ad0b
     914:	16ad0b00 	bne	s5,t5,3518 <_data-0x7fffcae8>
     918:	ad0b0000 	sw	t3,0(t0)
     91c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     920:	000016ad 	0x16ad
     924:	0016ad0b 	0x16ad0b
     928:	16ad0b00 	bne	s5,t5,352c <_data-0x7fffcad4>
     92c:	ad0b0000 	sw	t3,0(t0)
     930:	0b000016 	j	c000058 <_data-0x73ffffa8>
     934:	000016ad 	0x16ad
     938:	0016ad0b 	0x16ad0b
     93c:	16ad0b00 	bne	s5,t5,3540 <_data-0x7fffcac0>
     940:	ad0b0000 	sw	t3,0(t0)
     944:	0b000016 	j	c000058 <_data-0x73ffffa8>
     948:	000016ad 	0x16ad
     94c:	10f60800 	beq	a3,s6,2950 <_data-0x7fffd6b0>
     950:	67010000 	0x67010000
     954:	00000494 	0x494
     958:	0000099e 	0x99e
     95c:	00072409 	0x72409
     960:	00097f00 	sll	t7,t1,0x1c
     964:	16ad0a00 	bne	s5,t5,3168 <_data-0x7fffce98>
     968:	ad0a0000 	sw	t2,0(t0)
     96c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     970:	000016ad 	0x16ad
     974:	0016ad0a 	0x16ad0a
     978:	16ad0a00 	bne	s5,t5,317c <_data-0x7fffce84>
     97c:	0b000000 	j	c000000 <_data-0x74000000>
     980:	000016b9 	0x16b9
     984:	0016ad0b 	0x16ad0b
     988:	16ad0b00 	bne	s5,t5,358c <_data-0x7fffca74>
     98c:	ad0b0000 	sw	t3,0(t0)
     990:	0b000016 	j	c000058 <_data-0x73ffffa8>
     994:	000016ad 	0x16ad
     998:	0016ad0b 	0x16ad0b
     99c:	36080000 	ori	t0,s0,0x0
     9a0:	0100000d 	break	0x100
     9a4:	000e9267 	0xe9267
     9a8:	000a7b00 	sll	t7,t2,0xc
     9ac:	07240900 	0x7240900
     9b0:	0a160000 	j	8580000 <_data-0x77a80000>
     9b4:	ad0a0000 	sw	t2,0(t0)
     9b8:	0a000016 	j	8000058 <_data-0x77ffffa8>
     9bc:	000016ad 	0x16ad
     9c0:	0016ad0a 	0x16ad0a
     9c4:	16ad0a00 	bne	s5,t5,31c8 <_data-0x7fffce38>
     9c8:	ad0a0000 	sw	t2,0(t0)
     9cc:	0a000016 	j	8000058 <_data-0x77ffffa8>
     9d0:	000016ad 	0x16ad
     9d4:	0016ad0a 	0x16ad0a
     9d8:	16ad0a00 	bne	s5,t5,31dc <_data-0x7fffce24>
     9dc:	ad0a0000 	sw	t2,0(t0)
     9e0:	0a000016 	j	8000058 <_data-0x77ffffa8>
     9e4:	000016ad 	0x16ad
     9e8:	0016ad0a 	0x16ad0a
     9ec:	16ad0a00 	bne	s5,t5,31f0 <_data-0x7fffce10>
     9f0:	ad0a0000 	sw	t2,0(t0)
     9f4:	0a000016 	j	8000058 <_data-0x77ffffa8>
     9f8:	000016ad 	0x16ad
     9fc:	0016ad0a 	0x16ad0a
     a00:	16ad0a00 	bne	s5,t5,3204 <_data-0x7fffcdfc>
     a04:	ad0a0000 	sw	t2,0(t0)
     a08:	0a000016 	j	8000058 <_data-0x77ffffa8>
     a0c:	000016ad 	0x16ad
     a10:	0016ad0a 	0x16ad0a
     a14:	b90b0000 	swr	t3,0(t0)
     a18:	0b000016 	j	c000058 <_data-0x73ffffa8>
     a1c:	000016ad 	0x16ad
     a20:	0016ad0b 	0x16ad0b
     a24:	16ad0b00 	bne	s5,t5,3628 <_data-0x7fffc9d8>
     a28:	ad0b0000 	sw	t3,0(t0)
     a2c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     a30:	000016ad 	0x16ad
     a34:	0016ad0b 	0x16ad0b
     a38:	16ad0b00 	bne	s5,t5,363c <_data-0x7fffc9c4>
     a3c:	ad0b0000 	sw	t3,0(t0)
     a40:	0b000016 	j	c000058 <_data-0x73ffffa8>
     a44:	000016ad 	0x16ad
     a48:	0016ad0b 	0x16ad0b
     a4c:	16ad0b00 	bne	s5,t5,3650 <_data-0x7fffc9b0>
     a50:	ad0b0000 	sw	t3,0(t0)
     a54:	0b000016 	j	c000058 <_data-0x73ffffa8>
     a58:	000016ad 	0x16ad
     a5c:	0016ad0b 	0x16ad0b
     a60:	16ad0b00 	bne	s5,t5,3664 <_data-0x7fffc99c>
     a64:	ad0b0000 	sw	t3,0(t0)
     a68:	0b000016 	j	c000058 <_data-0x73ffffa8>
     a6c:	000016ad 	0x16ad
     a70:	0016ad0b 	0x16ad0b
     a74:	16ad0b00 	bne	s5,t5,3678 <_data-0x7fffc988>
     a78:	08000000 	j	0 <_data-0x80000000>
     a7c:	00000aec 	0xaec
     a80:	16546701 	bne	s2,s4,1a688 <_data-0x7ffe5978>
     a84:	0ad60000 	j	b580000 <_data-0x74a80000>
     a88:	24090000 	li	t1,0
     a8c:	b2000007 	0xb2000007
     a90:	0a00000a 	j	8000028 <_data-0x77ffffd8>
     a94:	000016ad 	0x16ad
     a98:	0016ad0a 	0x16ad0a
     a9c:	16ad0a00 	bne	s5,t5,32a0 <_data-0x7fffcd60>
     aa0:	ad0a0000 	sw	t2,0(t0)
     aa4:	0a000016 	j	8000058 <_data-0x77ffffa8>
     aa8:	000016ad 	0x16ad
     aac:	0016ad0a 	0x16ad0a
     ab0:	b90b0000 	swr	t3,0(t0)
     ab4:	0b000016 	j	c000058 <_data-0x73ffffa8>
     ab8:	000016ad 	0x16ad
     abc:	0016ad0b 	0x16ad0b
     ac0:	16ad0b00 	bne	s5,t5,36c4 <_data-0x7fffc93c>
     ac4:	ad0b0000 	sw	t3,0(t0)
     ac8:	0b000016 	j	c000058 <_data-0x73ffffa8>
     acc:	000016ad 	0x16ad
     ad0:	0016ad0b 	0x16ad0b
     ad4:	40080000 	mfc0	t0,c0_index
     ad8:	01000014 	0x1000014
     adc:	0002e967 	0x2e967
     ae0:	000bbd00 	sll	s7,t3,0x14
     ae4:	07240900 	0x7240900
     ae8:	0b530000 	j	d4c0000 <_data-0x72b40000>
     aec:	ad0a0000 	sw	t2,0(t0)
     af0:	0a000016 	j	8000058 <_data-0x77ffffa8>
     af4:	000016ad 	0x16ad
     af8:	0016ad0a 	0x16ad0a
     afc:	16ad0a00 	bne	s5,t5,3300 <_data-0x7fffcd00>
     b00:	ad0a0000 	sw	t2,0(t0)
     b04:	0a000016 	j	8000058 <_data-0x77ffffa8>
     b08:	000016ad 	0x16ad
     b0c:	0016ad0a 	0x16ad0a
     b10:	16ad0a00 	bne	s5,t5,3314 <_data-0x7fffccec>
     b14:	ad0a0000 	sw	t2,0(t0)
     b18:	0a000016 	j	8000058 <_data-0x77ffffa8>
     b1c:	000016ad 	0x16ad
     b20:	0016ad0a 	0x16ad0a
     b24:	16ad0a00 	bne	s5,t5,3328 <_data-0x7fffccd8>
     b28:	ad0a0000 	sw	t2,0(t0)
     b2c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     b30:	000016ad 	0x16ad
     b34:	0016ad0a 	0x16ad0a
     b38:	16ad0a00 	bne	s5,t5,333c <_data-0x7fffccc4>
     b3c:	ad0a0000 	sw	t2,0(t0)
     b40:	0a000016 	j	8000058 <_data-0x77ffffa8>
     b44:	000016ad 	0x16ad
     b48:	0016ad0a 	0x16ad0a
     b4c:	16ad0a00 	bne	s5,t5,3350 <_data-0x7fffccb0>
     b50:	0b000000 	j	c000000 <_data-0x74000000>
     b54:	000016b9 	0x16b9
     b58:	0016ad0b 	0x16ad0b
     b5c:	16ad0b00 	bne	s5,t5,3760 <_data-0x7fffc8a0>
     b60:	ad0b0000 	sw	t3,0(t0)
     b64:	0b000016 	j	c000058 <_data-0x73ffffa8>
     b68:	000016ad 	0x16ad
     b6c:	0016ad0b 	0x16ad0b
     b70:	16ad0b00 	bne	s5,t5,3774 <_data-0x7fffc88c>
     b74:	ad0b0000 	sw	t3,0(t0)
     b78:	0b000016 	j	c000058 <_data-0x73ffffa8>
     b7c:	000016ad 	0x16ad
     b80:	0016ad0b 	0x16ad0b
     b84:	16ad0b00 	bne	s5,t5,3788 <_data-0x7fffc878>
     b88:	ad0b0000 	sw	t3,0(t0)
     b8c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     b90:	000016ad 	0x16ad
     b94:	0016ad0b 	0x16ad0b
     b98:	16ad0b00 	bne	s5,t5,379c <_data-0x7fffc864>
     b9c:	ad0b0000 	sw	t3,0(t0)
     ba0:	0b000016 	j	c000058 <_data-0x73ffffa8>
     ba4:	000016ad 	0x16ad
     ba8:	0016ad0b 	0x16ad0b
     bac:	16ad0b00 	bne	s5,t5,37b0 <_data-0x7fffc850>
     bb0:	ad0b0000 	sw	t3,0(t0)
     bb4:	0b000016 	j	c000058 <_data-0x73ffffa8>
     bb8:	000016ad 	0x16ad
     bbc:	02a80800 	0x2a80800
     bc0:	67010000 	0x67010000
     bc4:	000007fe 	0x7fe
     bc8:	00000c22 	0xc22
     bcc:	00072409 	0x72409
     bd0:	000bf900 	sll	ra,t3,0x4
     bd4:	16ad0a00 	bne	s5,t5,33d8 <_data-0x7fffcc28>
     bd8:	ad0a0000 	sw	t2,0(t0)
     bdc:	0a000016 	j	8000058 <_data-0x77ffffa8>
     be0:	000016ad 	0x16ad
     be4:	0016ad0a 	0x16ad0a
     be8:	16ad0a00 	bne	s5,t5,33ec <_data-0x7fffcc14>
     bec:	ad0a0000 	sw	t2,0(t0)
     bf0:	0a000016 	j	8000058 <_data-0x77ffffa8>
     bf4:	000016ad 	0x16ad
     bf8:	16b90b00 	bne	s5,t9,37fc <_data-0x7fffc804>
     bfc:	ad0b0000 	sw	t3,0(t0)
     c00:	0b000016 	j	c000058 <_data-0x73ffffa8>
     c04:	000016ad 	0x16ad
     c08:	0016ad0b 	0x16ad0b
     c0c:	16ad0b00 	bne	s5,t5,3810 <_data-0x7fffc7f0>
     c10:	ad0b0000 	sw	t3,0(t0)
     c14:	0b000016 	j	c000058 <_data-0x73ffffa8>
     c18:	000016ad 	0x16ad
     c1c:	0016ad0b 	0x16ad0b
     c20:	fd080000 	sdc3	$8,0(t0)
     c24:	0100000d 	break	0x100
     c28:	00050c67 	0x50c67
     c2c:	000d1300 	sll	v0,t5,0xc
     c30:	07240900 	0x7240900
     c34:	0ca40000 	jal	2900000 <_data-0x7d700000>
     c38:	ad0a0000 	sw	t2,0(t0)
     c3c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     c40:	000016ad 	0x16ad
     c44:	0016ad0a 	0x16ad0a
     c48:	16ad0a00 	bne	s5,t5,344c <_data-0x7fffcbb4>
     c4c:	ad0a0000 	sw	t2,0(t0)
     c50:	0a000016 	j	8000058 <_data-0x77ffffa8>
     c54:	000016ad 	0x16ad
     c58:	0016ad0a 	0x16ad0a
     c5c:	16ad0a00 	bne	s5,t5,3460 <_data-0x7fffcba0>
     c60:	ad0a0000 	sw	t2,0(t0)
     c64:	0a000016 	j	8000058 <_data-0x77ffffa8>
     c68:	000016ad 	0x16ad
     c6c:	0016ad0a 	0x16ad0a
     c70:	16ad0a00 	bne	s5,t5,3474 <_data-0x7fffcb8c>
     c74:	ad0a0000 	sw	t2,0(t0)
     c78:	0a000016 	j	8000058 <_data-0x77ffffa8>
     c7c:	000016ad 	0x16ad
     c80:	0016ad0a 	0x16ad0a
     c84:	16ad0a00 	bne	s5,t5,3488 <_data-0x7fffcb78>
     c88:	ad0a0000 	sw	t2,0(t0)
     c8c:	0a000016 	j	8000058 <_data-0x77ffffa8>
     c90:	000016ad 	0x16ad
     c94:	0016ad0a 	0x16ad0a
     c98:	16ad0a00 	bne	s5,t5,349c <_data-0x7fffcb64>
     c9c:	ad0a0000 	sw	t2,0(t0)
     ca0:	00000016 	0x16
     ca4:	0016b90b 	0x16b90b
     ca8:	16ad0b00 	bne	s5,t5,38ac <_data-0x7fffc754>
     cac:	ad0b0000 	sw	t3,0(t0)
     cb0:	0b000016 	j	c000058 <_data-0x73ffffa8>
     cb4:	000016ad 	0x16ad
     cb8:	0016ad0b 	0x16ad0b
     cbc:	16ad0b00 	bne	s5,t5,38c0 <_data-0x7fffc740>
     cc0:	ad0b0000 	sw	t3,0(t0)
     cc4:	0b000016 	j	c000058 <_data-0x73ffffa8>
     cc8:	000016ad 	0x16ad
     ccc:	0016ad0b 	0x16ad0b
     cd0:	16ad0b00 	bne	s5,t5,38d4 <_data-0x7fffc72c>
     cd4:	ad0b0000 	sw	t3,0(t0)
     cd8:	0b000016 	j	c000058 <_data-0x73ffffa8>
     cdc:	000016ad 	0x16ad
     ce0:	0016ad0b 	0x16ad0b
     ce4:	16ad0b00 	bne	s5,t5,38e8 <_data-0x7fffc718>
     ce8:	ad0b0000 	sw	t3,0(t0)
     cec:	0b000016 	j	c000058 <_data-0x73ffffa8>
     cf0:	000016ad 	0x16ad
     cf4:	0016ad0b 	0x16ad0b
     cf8:	16ad0b00 	bne	s5,t5,38fc <_data-0x7fffc704>
     cfc:	ad0b0000 	sw	t3,0(t0)
     d00:	0b000016 	j	c000058 <_data-0x73ffffa8>
     d04:	000016ad 	0x16ad
     d08:	0016ad0b 	0x16ad0b
     d0c:	16ad0b00 	bne	s5,t5,3910 <_data-0x7fffc6f0>
     d10:	08000000 	j	0 <_data-0x80000000>
     d14:	00000c90 	0xc90
     d18:	13246701 	beq	t9,a0,1a920 <_data-0x7ffe56e0>
     d1c:	0d460000 	jal	5180000 <_data-0x7ae80000>
     d20:	24090000 	li	t1,0
     d24:	36000007 	ori	zero,s0,0x7
     d28:	0a00000d 	j	8000034 <_data-0x77ffffcc>
     d2c:	000016ad 	0x16ad
     d30:	0016ad0a 	0x16ad0a
     d34:	b90b0000 	swr	t3,0(t0)
     d38:	0b000016 	j	c000058 <_data-0x73ffffa8>
     d3c:	000016ad 	0x16ad
     d40:	0016ad0b 	0x16ad0b
     d44:	5f080000 	0x5f080000
     d48:	01000015 	0x1000015
     d4c:	00000067 	0x67
     d50:	000db500 	sll	s6,t5,0x14
     d54:	07240900 	0x7240900
     d58:	0d870000 	jal	61c0000 <_data-0x79e40000>
     d5c:	ad0a0000 	sw	t2,0(t0)
     d60:	0a000016 	j	8000058 <_data-0x77ffffa8>
     d64:	000016ad 	0x16ad
     d68:	0016ad0a 	0x16ad0a
     d6c:	16ad0a00 	bne	s5,t5,3570 <_data-0x7fffca90>
     d70:	ad0a0000 	sw	t2,0(t0)
     d74:	0a000016 	j	8000058 <_data-0x77ffffa8>
     d78:	000016ad 	0x16ad
     d7c:	0016ad0a 	0x16ad0a
     d80:	16ad0a00 	bne	s5,t5,3584 <_data-0x7fffca7c>
     d84:	0b000000 	j	c000000 <_data-0x74000000>
     d88:	000016b9 	0x16b9
     d8c:	0016ad0b 	0x16ad0b
     d90:	16ad0b00 	bne	s5,t5,3994 <_data-0x7fffc66c>
     d94:	ad0b0000 	sw	t3,0(t0)
     d98:	0b000016 	j	c000058 <_data-0x73ffffa8>
     d9c:	000016ad 	0x16ad
     da0:	0016ad0b 	0x16ad0b
     da4:	16ad0b00 	bne	s5,t5,39a8 <_data-0x7fffc658>
     da8:	ad0b0000 	sw	t3,0(t0)
     dac:	0b000016 	j	c000058 <_data-0x73ffffa8>
     db0:	000016ad 	0x16ad
     db4:	086c0800 	j	1b02000 <_data-0x7e4fe000>
     db8:	67010000 	0x67010000
     dbc:	00000b27 	0xb27
     dc0:	00000eb0 	tge	zero,zero,0x3a
     dc4:	00072409 	0x72409
     dc8:	000e3c00 	sll	a3,t6,0x10
     dcc:	16ad0a00 	bne	s5,t5,35d0 <_data-0x7fffca30>
     dd0:	ad0a0000 	sw	t2,0(t0)
     dd4:	0a000016 	j	8000058 <_data-0x77ffffa8>
     dd8:	000016ad 	0x16ad
     ddc:	0016ad0a 	0x16ad0a
     de0:	16ad0a00 	bne	s5,t5,35e4 <_data-0x7fffca1c>
     de4:	ad0a0000 	sw	t2,0(t0)
     de8:	0a000016 	j	8000058 <_data-0x77ffffa8>
     dec:	000016ad 	0x16ad
     df0:	0016ad0a 	0x16ad0a
     df4:	16ad0a00 	bne	s5,t5,35f8 <_data-0x7fffca08>
     df8:	ad0a0000 	sw	t2,0(t0)
     dfc:	0a000016 	j	8000058 <_data-0x77ffffa8>
     e00:	000016ad 	0x16ad
     e04:	0016ad0a 	0x16ad0a
     e08:	16ad0a00 	bne	s5,t5,360c <_data-0x7fffc9f4>
     e0c:	ad0a0000 	sw	t2,0(t0)
     e10:	0a000016 	j	8000058 <_data-0x77ffffa8>
     e14:	000016ad 	0x16ad
     e18:	0016ad0a 	0x16ad0a
     e1c:	16ad0a00 	bne	s5,t5,3620 <_data-0x7fffc9e0>
     e20:	ad0a0000 	sw	t2,0(t0)
     e24:	0a000016 	j	8000058 <_data-0x77ffffa8>
     e28:	000016ad 	0x16ad
     e2c:	0016ad0a 	0x16ad0a
     e30:	16ad0a00 	bne	s5,t5,3634 <_data-0x7fffc9cc>
     e34:	ad0a0000 	sw	t2,0(t0)
     e38:	00000016 	0x16
     e3c:	0016b90b 	0x16b90b
     e40:	16ad0b00 	bne	s5,t5,3a44 <_data-0x7fffc5bc>
     e44:	ad0b0000 	sw	t3,0(t0)
     e48:	0b000016 	j	c000058 <_data-0x73ffffa8>
     e4c:	000016ad 	0x16ad
     e50:	0016ad0b 	0x16ad0b
     e54:	16ad0b00 	bne	s5,t5,3a58 <_data-0x7fffc5a8>
     e58:	ad0b0000 	sw	t3,0(t0)
     e5c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     e60:	000016ad 	0x16ad
     e64:	0016ad0b 	0x16ad0b
     e68:	16ad0b00 	bne	s5,t5,3a6c <_data-0x7fffc594>
     e6c:	ad0b0000 	sw	t3,0(t0)
     e70:	0b000016 	j	c000058 <_data-0x73ffffa8>
     e74:	000016ad 	0x16ad
     e78:	0016ad0b 	0x16ad0b
     e7c:	16ad0b00 	bne	s5,t5,3a80 <_data-0x7fffc580>
     e80:	ad0b0000 	sw	t3,0(t0)
     e84:	0b000016 	j	c000058 <_data-0x73ffffa8>
     e88:	000016ad 	0x16ad
     e8c:	0016ad0b 	0x16ad0b
     e90:	16ad0b00 	bne	s5,t5,3a94 <_data-0x7fffc56c>
     e94:	ad0b0000 	sw	t3,0(t0)
     e98:	0b000016 	j	c000058 <_data-0x73ffffa8>
     e9c:	000016ad 	0x16ad
     ea0:	0016ad0b 	0x16ad0b
     ea4:	16ad0b00 	bne	s5,t5,3aa8 <_data-0x7fffc558>
     ea8:	ad0b0000 	sw	t3,0(t0)
     eac:	00000016 	0x16
     eb0:	00020f08 	0x20f08
     eb4:	f5670100 	sdc1	$f7,256(t3)
     eb8:	ed00000e 	swc3	$0,14(t0)
     ebc:	0900000e 	j	4000038 <_data-0x7bffffc8>
     ec0:	00000724 	0x724
     ec4:	00000ed8 	0xed8
     ec8:	0016ad0a 	0x16ad0a
     ecc:	16ad0a00 	bne	s5,t5,36d0 <_data-0x7fffc930>
     ed0:	ad0a0000 	sw	t2,0(t0)
     ed4:	00000016 	0x16
     ed8:	0016b90b 	0x16b90b
     edc:	16ad0b00 	bne	s5,t5,3ae0 <_data-0x7fffc520>
     ee0:	ad0b0000 	sw	t3,0(t0)
     ee4:	0b000016 	j	c000058 <_data-0x73ffffa8>
     ee8:	000016ad 	0x16ad
     eec:	18f40800 	0x18f40800
     ef0:	67010000 	0x67010000
     ef4:	00001005 	0x1005
     ef8:	00000f16 	0xf16
     efc:	00072409 	0x72409
     f00:	000f0b00 	sll	at,t7,0xc
     f04:	16ad0a00 	bne	s5,t5,3708 <_data-0x7fffc8f8>
     f08:	0b000000 	j	c000000 <_data-0x74000000>
     f0c:	000016b9 	0x16b9
     f10:	0016ad0b 	0x16ad0b
     f14:	e0080000 	sc	t0,0(zero)
     f18:	01000014 	0x1000014
     f1c:	00054f67 	0x54f67
     f20:	000f8f00 	sll	s1,t7,0x1c
     f24:	07240900 	0x7240900
     f28:	0f5c0000 	jal	d700000 <_data-0x72900000>
     f2c:	ad0a0000 	sw	t2,0(t0)
     f30:	0a000016 	j	8000058 <_data-0x77ffffa8>
     f34:	000016ad 	0x16ad
     f38:	0016ad0a 	0x16ad0a
     f3c:	16ad0a00 	bne	s5,t5,3740 <_data-0x7fffc8c0>
     f40:	ad0a0000 	sw	t2,0(t0)
     f44:	0a000016 	j	8000058 <_data-0x77ffffa8>
     f48:	000016ad 	0x16ad
     f4c:	0016ad0a 	0x16ad0a
     f50:	16ad0a00 	bne	s5,t5,3754 <_data-0x7fffc8ac>
     f54:	ad0a0000 	sw	t2,0(t0)
     f58:	00000016 	0x16
     f5c:	0016b90b 	0x16b90b
     f60:	16ad0b00 	bne	s5,t5,3b64 <_data-0x7fffc49c>
     f64:	ad0b0000 	sw	t3,0(t0)
     f68:	0b000016 	j	c000058 <_data-0x73ffffa8>
     f6c:	000016ad 	0x16ad
     f70:	0016ad0b 	0x16ad0b
     f74:	16ad0b00 	bne	s5,t5,3b78 <_data-0x7fffc488>
     f78:	ad0b0000 	sw	t3,0(t0)
     f7c:	0b000016 	j	c000058 <_data-0x73ffffa8>
     f80:	000016ad 	0x16ad
     f84:	0016ad0b 	0x16ad0b
     f88:	16ad0b00 	bne	s5,t5,3b8c <_data-0x7fffc474>
     f8c:	08000000 	j	0 <_data-0x80000000>
     f90:	00001701 	0x1701
     f94:	03496701 	0x3496701
     f98:	10940000 	beq	a0,s4,f9c <_data-0x7ffff064>
     f9c:	24090000 	li	t1,0
     fa0:	1b000007 	blez	t8,fc0 <_data-0x7ffff040>
     fa4:	0a000010 	j	8000040 <_data-0x77ffffc0>
     fa8:	000016ad 	0x16ad
     fac:	0016ad0a 	0x16ad0a
     fb0:	16ad0a00 	bne	s5,t5,37b4 <_data-0x7fffc84c>
     fb4:	ad0a0000 	sw	t2,0(t0)
     fb8:	0a000016 	j	8000058 <_data-0x77ffffa8>
     fbc:	000016ad 	0x16ad
     fc0:	0016ad0a 	0x16ad0a
     fc4:	16ad0a00 	bne	s5,t5,37c8 <_data-0x7fffc838>
     fc8:	ad0a0000 	sw	t2,0(t0)
     fcc:	0a000016 	j	8000058 <_data-0x77ffffa8>
     fd0:	000016ad 	0x16ad
     fd4:	0016ad0a 	0x16ad0a
     fd8:	16ad0a00 	bne	s5,t5,37dc <_data-0x7fffc824>
     fdc:	ad0a0000 	sw	t2,0(t0)
     fe0:	0a000016 	j	8000058 <_data-0x77ffffa8>
     fe4:	000016ad 	0x16ad
     fe8:	0016ad0a 	0x16ad0a
     fec:	16ad0a00 	bne	s5,t5,37f0 <_data-0x7fffc810>
     ff0:	ad0a0000 	sw	t2,0(t0)
     ff4:	0a000016 	j	8000058 <_data-0x77ffffa8>
     ff8:	000016ad 	0x16ad
     ffc:	0016ad0a 	0x16ad0a
    1000:	16ad0a00 	bne	s5,t5,3804 <_data-0x7fffc7fc>
    1004:	ad0a0000 	sw	t2,0(t0)
    1008:	0a000016 	j	8000058 <_data-0x77ffffa8>
    100c:	000016ad 	0x16ad
    1010:	0016ad0a 	0x16ad0a
    1014:	16ad0a00 	bne	s5,t5,3818 <_data-0x7fffc7e8>
    1018:	0b000000 	j	c000000 <_data-0x74000000>
    101c:	000016b9 	0x16b9
    1020:	0016ad0b 	0x16ad0b
    1024:	16ad0b00 	bne	s5,t5,3c28 <_data-0x7fffc3d8>
    1028:	ad0b0000 	sw	t3,0(t0)
    102c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1030:	000016ad 	0x16ad
    1034:	0016ad0b 	0x16ad0b
    1038:	16ad0b00 	bne	s5,t5,3c3c <_data-0x7fffc3c4>
    103c:	ad0b0000 	sw	t3,0(t0)
    1040:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1044:	000016ad 	0x16ad
    1048:	0016ad0b 	0x16ad0b
    104c:	16ad0b00 	bne	s5,t5,3c50 <_data-0x7fffc3b0>
    1050:	ad0b0000 	sw	t3,0(t0)
    1054:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1058:	000016ad 	0x16ad
    105c:	0016ad0b 	0x16ad0b
    1060:	16ad0b00 	bne	s5,t5,3c64 <_data-0x7fffc39c>
    1064:	ad0b0000 	sw	t3,0(t0)
    1068:	0b000016 	j	c000058 <_data-0x73ffffa8>
    106c:	000016ad 	0x16ad
    1070:	0016ad0b 	0x16ad0b
    1074:	16ad0b00 	bne	s5,t5,3c78 <_data-0x7fffc388>
    1078:	ad0b0000 	sw	t3,0(t0)
    107c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1080:	000016ad 	0x16ad
    1084:	0016ad0b 	0x16ad0b
    1088:	16ad0b00 	bne	s5,t5,3c8c <_data-0x7fffc374>
    108c:	ad0b0000 	sw	t3,0(t0)
    1090:	00000016 	0x16
    1094:	0009ba08 	0x9ba08
    1098:	03670100 	0x3670100
    109c:	ad00000c 	sw	zero,12(t0)
    10a0:	09000011 	j	4000044 <_data-0x7bffffbc>
    10a4:	00000724 	0x724
    10a8:	0000112a 	0x112a
    10ac:	0016ad0a 	0x16ad0a
    10b0:	16ad0a00 	bne	s5,t5,38b4 <_data-0x7fffc74c>
    10b4:	ad0a0000 	sw	t2,0(t0)
    10b8:	0a000016 	j	8000058 <_data-0x77ffffa8>
    10bc:	000016ad 	0x16ad
    10c0:	0016ad0a 	0x16ad0a
    10c4:	16ad0a00 	bne	s5,t5,38c8 <_data-0x7fffc738>
    10c8:	ad0a0000 	sw	t2,0(t0)
    10cc:	0a000016 	j	8000058 <_data-0x77ffffa8>
    10d0:	000016ad 	0x16ad
    10d4:	0016ad0a 	0x16ad0a
    10d8:	16ad0a00 	bne	s5,t5,38dc <_data-0x7fffc724>
    10dc:	ad0a0000 	sw	t2,0(t0)
    10e0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    10e4:	000016ad 	0x16ad
    10e8:	0016ad0a 	0x16ad0a
    10ec:	16ad0a00 	bne	s5,t5,38f0 <_data-0x7fffc710>
    10f0:	ad0a0000 	sw	t2,0(t0)
    10f4:	0a000016 	j	8000058 <_data-0x77ffffa8>
    10f8:	000016ad 	0x16ad
    10fc:	0016ad0a 	0x16ad0a
    1100:	16ad0a00 	bne	s5,t5,3904 <_data-0x7fffc6fc>
    1104:	ad0a0000 	sw	t2,0(t0)
    1108:	0a000016 	j	8000058 <_data-0x77ffffa8>
    110c:	000016ad 	0x16ad
    1110:	0016ad0a 	0x16ad0a
    1114:	16ad0a00 	bne	s5,t5,3918 <_data-0x7fffc6e8>
    1118:	ad0a0000 	sw	t2,0(t0)
    111c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1120:	000016ad 	0x16ad
    1124:	0016ad0a 	0x16ad0a
    1128:	b90b0000 	swr	t3,0(t0)
    112c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1130:	000016ad 	0x16ad
    1134:	0016ad0b 	0x16ad0b
    1138:	16ad0b00 	bne	s5,t5,3d3c <_data-0x7fffc2c4>
    113c:	ad0b0000 	sw	t3,0(t0)
    1140:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1144:	000016ad 	0x16ad
    1148:	0016ad0b 	0x16ad0b
    114c:	16ad0b00 	bne	s5,t5,3d50 <_data-0x7fffc2b0>
    1150:	ad0b0000 	sw	t3,0(t0)
    1154:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1158:	000016ad 	0x16ad
    115c:	0016ad0b 	0x16ad0b
    1160:	16ad0b00 	bne	s5,t5,3d64 <_data-0x7fffc29c>
    1164:	ad0b0000 	sw	t3,0(t0)
    1168:	0b000016 	j	c000058 <_data-0x73ffffa8>
    116c:	000016ad 	0x16ad
    1170:	0016ad0b 	0x16ad0b
    1174:	16ad0b00 	bne	s5,t5,3d78 <_data-0x7fffc288>
    1178:	ad0b0000 	sw	t3,0(t0)
    117c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1180:	000016ad 	0x16ad
    1184:	0016ad0b 	0x16ad0b
    1188:	16ad0b00 	bne	s5,t5,3d8c <_data-0x7fffc274>
    118c:	ad0b0000 	sw	t3,0(t0)
    1190:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1194:	000016ad 	0x16ad
    1198:	0016ad0b 	0x16ad0b
    119c:	16ad0b00 	bne	s5,t5,3da0 <_data-0x7fffc260>
    11a0:	ad0b0000 	sw	t3,0(t0)
    11a4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    11a8:	000016ad 	0x16ad
    11ac:	00f90800 	0xf90800
    11b0:	67010000 	0x67010000
    11b4:	0000152d 	0x152d
    11b8:	000011f4 	teq	zero,zero,0x47
    11bc:	00072409 	0x72409
    11c0:	0011da00 	sll	k1,s1,0x8
    11c4:	16ad0a00 	bne	s5,t5,39c8 <_data-0x7fffc638>
    11c8:	ad0a0000 	sw	t2,0(t0)
    11cc:	0a000016 	j	8000058 <_data-0x77ffffa8>
    11d0:	000016ad 	0x16ad
    11d4:	0016ad0a 	0x16ad0a
    11d8:	b90b0000 	swr	t3,0(t0)
    11dc:	0b000016 	j	c000058 <_data-0x73ffffa8>
    11e0:	000016ad 	0x16ad
    11e4:	0016ad0b 	0x16ad0b
    11e8:	16ad0b00 	bne	s5,t5,3dec <_data-0x7fffc214>
    11ec:	ad0b0000 	sw	t3,0(t0)
    11f0:	00000016 	0x16
    11f4:	00163708 	0x163708
    11f8:	c9740100 	lwc2	$20,256(t3)
    11fc:	38000006 	xori	zero,zero,0x6
    1200:	0c000012 	jal	48 <_data-0x7fffffb8>
    1204:	0025004e 	0x25004e
    1208:	02040000 	0x2040000
    120c:	0d000000 	jal	4000000 <_data-0x7c000000>
    1210:	73010049 	0x73010049
    1214:	0000122d 	0x122d
    1218:	00002507 	0x2507
    121c:	00000400 	sll	zero,zero,0x10
    1220:	25070000 	addiu	a3,t0,0
    1224:	04000000 	bltz	zero,1228 <_data-0x7fffedd8>
    1228:	00000001 	movf	zero,zero,$fcc0
    122c:	25b70b00 	addiu	s7,t5,2816
    1230:	230b0000 	addi	t3,t8,0
    1234:	00000003 	sra	zero,zero,0x0
    1238:	00090708 	0x90708
    123c:	a6740100 	sh	s4,256(s3)
    1240:	cc000015 	pref	0x0,21(zero)
    1244:	0c000012 	jal	48 <_data-0x7fffffb8>
    1248:	0025004e 	0x25004e
    124c:	0a040000 	j	8100000 <_data-0x77f00000>
    1250:	0d000000 	jal	4000000 <_data-0x7c000000>
    1254:	73010049 	0x73010049
    1258:	000012c1 	0x12c1
    125c:	00002507 	0x2507
    1260:	00000400 	sll	zero,zero,0x10
    1264:	25070000 	addiu	a3,t0,0
    1268:	04000000 	bltz	zero,126c <_data-0x7fffed94>
    126c:	00000001 	movf	zero,zero,$fcc0
    1270:	00002507 	0x2507
    1274:	00020400 	sll	zero,v0,0x10
    1278:	25070000 	addiu	a3,t0,0
    127c:	04000000 	bltz	zero,1280 <_data-0x7fffed80>
    1280:	00000003 	sra	zero,zero,0x0
    1284:	00002507 	0x2507
    1288:	00040400 	sll	zero,a0,0x10
    128c:	25070000 	addiu	a3,t0,0
    1290:	04000000 	bltz	zero,1294 <_data-0x7fffed6c>
    1294:	00000005 	0x5
    1298:	00002507 	0x2507
    129c:	00060400 	sll	zero,a2,0x10
    12a0:	25070000 	addiu	a3,t0,0
    12a4:	04000000 	bltz	zero,12a8 <_data-0x7fffed58>
    12a8:	00000007 	srav	zero,zero,zero
    12ac:	00002507 	0x2507
    12b0:	00080400 	sll	zero,t0,0x10
    12b4:	25070000 	addiu	a3,t0,0
    12b8:	04000000 	bltz	zero,12bc <_data-0x7fffed44>
    12bc:	00000009 	jalr	zero,zero
    12c0:	26120b00 	addiu	s2,s0,2816
    12c4:	ac0b0000 	sw	t3,0(zero)
    12c8:	00000002 	srl	zero,zero,0x0
    12cc:	0017a208 	0x17a208
    12d0:	4a670100 	c2	0x670100
    12d4:	db00000c 	ldc2	$0,12(t8)
    12d8:	09000013 	j	400004c <_data-0x7bffffb4>
    12dc:	00000724 	0x724
    12e0:	0000135d 	0x135d
    12e4:	0016ad0a 	0x16ad0a
    12e8:	16ad0a00 	bne	s5,t5,3aec <_data-0x7fffc514>
    12ec:	ad0a0000 	sw	t2,0(t0)
    12f0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    12f4:	000016ad 	0x16ad
    12f8:	0016ad0a 	0x16ad0a
    12fc:	16ad0a00 	bne	s5,t5,3b00 <_data-0x7fffc500>
    1300:	ad0a0000 	sw	t2,0(t0)
    1304:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1308:	000016ad 	0x16ad
    130c:	0016ad0a 	0x16ad0a
    1310:	16ad0a00 	bne	s5,t5,3b14 <_data-0x7fffc4ec>
    1314:	ad0a0000 	sw	t2,0(t0)
    1318:	0a000016 	j	8000058 <_data-0x77ffffa8>
    131c:	000016ad 	0x16ad
    1320:	0016ad0a 	0x16ad0a
    1324:	16ad0a00 	bne	s5,t5,3b28 <_data-0x7fffc4d8>
    1328:	ad0a0000 	sw	t2,0(t0)
    132c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1330:	000016ad 	0x16ad
    1334:	0016ad0a 	0x16ad0a
    1338:	16ad0a00 	bne	s5,t5,3b3c <_data-0x7fffc4c4>
    133c:	ad0a0000 	sw	t2,0(t0)
    1340:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1344:	000016ad 	0x16ad
    1348:	0016ad0a 	0x16ad0a
    134c:	16ad0a00 	bne	s5,t5,3b50 <_data-0x7fffc4b0>
    1350:	ad0a0000 	sw	t2,0(t0)
    1354:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1358:	000016ad 	0x16ad
    135c:	16b90b00 	bne	s5,t9,3f60 <_data-0x7fffc0a0>
    1360:	ad0b0000 	sw	t3,0(t0)
    1364:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1368:	000016ad 	0x16ad
    136c:	0016ad0b 	0x16ad0b
    1370:	16ad0b00 	bne	s5,t5,3f74 <_data-0x7fffc08c>
    1374:	ad0b0000 	sw	t3,0(t0)
    1378:	0b000016 	j	c000058 <_data-0x73ffffa8>
    137c:	000016ad 	0x16ad
    1380:	0016ad0b 	0x16ad0b
    1384:	16ad0b00 	bne	s5,t5,3f88 <_data-0x7fffc078>
    1388:	ad0b0000 	sw	t3,0(t0)
    138c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1390:	000016ad 	0x16ad
    1394:	0016ad0b 	0x16ad0b
    1398:	16ad0b00 	bne	s5,t5,3f9c <_data-0x7fffc064>
    139c:	ad0b0000 	sw	t3,0(t0)
    13a0:	0b000016 	j	c000058 <_data-0x73ffffa8>
    13a4:	000016ad 	0x16ad
    13a8:	0016ad0b 	0x16ad0b
    13ac:	16ad0b00 	bne	s5,t5,3fb0 <_data-0x7fffc050>
    13b0:	ad0b0000 	sw	t3,0(t0)
    13b4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    13b8:	000016ad 	0x16ad
    13bc:	0016ad0b 	0x16ad0b
    13c0:	16ad0b00 	bne	s5,t5,3fc4 <_data-0x7fffc03c>
    13c4:	ad0b0000 	sw	t3,0(t0)
    13c8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    13cc:	000016ad 	0x16ad
    13d0:	0016ad0b 	0x16ad0b
    13d4:	16ad0b00 	bne	s5,t5,3fd8 <_data-0x7fffc028>
    13d8:	08000000 	j	0 <_data-0x80000000>
    13dc:	00001911 	0x1911
    13e0:	0f397401 	jal	ce5d004 <_data-0x731a2ffc>
    13e4:	150f0000 	bne	t0,t7,13e8 <_data-0x7fffec18>
    13e8:	4e0c0000 	c3	0xc0000
    13ec:	00002500 	sll	a0,zero,0x14
    13f0:	001a0400 	sll	zero,k0,0x10
    13f4:	490d0000 	bc2t	$cc3,13f8 <_data-0x7fffec08>
    13f8:	04730100 	bgezall	v1,17fc <_data-0x7fffe804>
    13fc:	07000015 	bltz	t8,1454 <_data-0x7fffebac>
    1400:	00000025 	move	zero,zero
    1404:	00000004 	sllv	zero,zero,zero
    1408:	00250700 	0x250700
    140c:	01040000 	0x1040000
    1410:	07000000 	bltz	t8,1414 <_data-0x7fffebec>
    1414:	00000025 	move	zero,zero
    1418:	00000204 	0x204
    141c:	00250700 	0x250700
    1420:	03040000 	0x3040000
    1424:	07000000 	bltz	t8,1428 <_data-0x7fffebd8>
    1428:	00000025 	move	zero,zero
    142c:	00000404 	0x404
    1430:	00250700 	0x250700
    1434:	05040000 	0x5040000
    1438:	07000000 	bltz	t8,143c <_data-0x7fffebc4>
    143c:	00000025 	move	zero,zero
    1440:	00000604 	0x604
    1444:	00250700 	0x250700
    1448:	07040000 	0x7040000
    144c:	07000000 	bltz	t8,1450 <_data-0x7fffebb0>
    1450:	00000025 	move	zero,zero
    1454:	00000804 	sllv	at,zero,zero
    1458:	00250700 	0x250700
    145c:	09040000 	j	4100000 <_data-0x7bf00000>
    1460:	07000000 	bltz	t8,1464 <_data-0x7fffeb9c>
    1464:	00000025 	move	zero,zero
    1468:	00000a04 	0xa04
    146c:	00250700 	0x250700
    1470:	0b040000 	j	c100000 <_data-0x73f00000>
    1474:	07000000 	bltz	t8,1478 <_data-0x7fffeb88>
    1478:	00000025 	move	zero,zero
    147c:	00000c04 	0xc04
    1480:	00250700 	0x250700
    1484:	0d040000 	jal	4100000 <_data-0x7bf00000>
    1488:	07000000 	bltz	t8,148c <_data-0x7fffeb74>
    148c:	00000025 	move	zero,zero
    1490:	00000e04 	0xe04
    1494:	00250700 	0x250700
    1498:	0f040000 	jal	c100000 <_data-0x73f00000>
    149c:	07000000 	bltz	t8,14a0 <_data-0x7fffeb60>
    14a0:	00000025 	move	zero,zero
    14a4:	00001004 	sllv	v0,zero,zero
    14a8:	00250700 	0x250700
    14ac:	11040000 	beq	t0,a0,14b0 <_data-0x7fffeb50>
    14b0:	07000000 	bltz	t8,14b4 <_data-0x7fffeb4c>
    14b4:	00000025 	move	zero,zero
    14b8:	00001204 	0x1204
    14bc:	00250700 	0x250700
    14c0:	13040000 	beq	t8,a0,14c4 <_data-0x7fffeb3c>
    14c4:	07000000 	bltz	t8,14c8 <_data-0x7fffeb38>
    14c8:	00000025 	move	zero,zero
    14cc:	00001404 	0x1404
    14d0:	00250700 	0x250700
    14d4:	15040000 	bne	t0,a0,14d8 <_data-0x7fffeb28>
    14d8:	07000000 	bltz	t8,14dc <_data-0x7fffeb24>
    14dc:	00000025 	move	zero,zero
    14e0:	00001604 	0x1604
    14e4:	00250700 	0x250700
    14e8:	17040000 	bne	t8,a0,14ec <_data-0x7fffeb14>
    14ec:	07000000 	bltz	t8,14f0 <_data-0x7fffeb10>
    14f0:	00000025 	move	zero,zero
    14f4:	00001804 	sllv	v1,zero,zero
    14f8:	00250700 	0x250700
    14fc:	19040000 	0x19040000
    1500:	00000000 	nop
    1504:	0037680b 	movn	t5,at,s7
    1508:	01950b00 	0x1950b00
    150c:	08000000 	j	0 <_data-0x80000000>
    1510:	00000846 	rorv	at,zero,zero
    1514:	05a97401 	tgeiu	t5,29697
    1518:	15710000 	bne	t3,s1,151c <_data-0x7fffeae4>
    151c:	4e0c0000 	c3	0xc0000
    1520:	00002500 	sll	a0,zero,0x14
    1524:	00050400 	sll	zero,a1,0x10
    1528:	490d0000 	bc2t	$cc3,152c <_data-0x7fffead4>
    152c:	66730100 	0x66730100
    1530:	07000015 	bltz	t8,1588 <_data-0x7fffea78>
    1534:	00000025 	move	zero,zero
    1538:	00000004 	sllv	zero,zero,zero
    153c:	00250700 	0x250700
    1540:	01040000 	0x1040000
    1544:	07000000 	bltz	t8,1548 <_data-0x7fffeab8>
    1548:	00000025 	move	zero,zero
    154c:	00000204 	0x204
    1550:	00250700 	0x250700
    1554:	03040000 	0x3040000
    1558:	07000000 	bltz	t8,155c <_data-0x7fffeaa4>
    155c:	00000025 	move	zero,zero
    1560:	00000404 	0x404
    1564:	b30b0000 	0xb30b0000
    1568:	0b000038 	j	c0000e0 <_data-0x73ffff20>
    156c:	00000150 	0x150
    1570:	18820800 	0x18820800
    1574:	74010000 	jalx	40000 <_data-0x7ffc0000>
    1578:	0000125d 	0x125d
    157c:	0000169b 	0x169b
    1580:	25004e0c 	addiu	zero,t0,19980
    1584:	04000000 	bltz	zero,1588 <_data-0x7fffea78>
    1588:	00000019 	multu	zero,zero
    158c:	0100490d 	break	0x100,0x124
    1590:	00169073 	tltu	zero,s6,0x241
    1594:	00250700 	0x250700
    1598:	00040000 	sll	zero,a0,0x0
    159c:	07000000 	bltz	t8,15a0 <_data-0x7fffea60>
    15a0:	00000025 	move	zero,zero
    15a4:	00000104 	0x104
    15a8:	00250700 	0x250700
    15ac:	02040000 	0x2040000
    15b0:	07000000 	bltz	t8,15b4 <_data-0x7fffea4c>
    15b4:	00000025 	move	zero,zero
    15b8:	00000304 	0x304
    15bc:	00250700 	0x250700
    15c0:	04040000 	0x4040000
    15c4:	07000000 	bltz	t8,15c8 <_data-0x7fffea38>
    15c8:	00000025 	move	zero,zero
    15cc:	00000504 	0x504
    15d0:	00250700 	0x250700
    15d4:	06040000 	0x6040000
    15d8:	07000000 	bltz	t8,15dc <_data-0x7fffea24>
    15dc:	00000025 	move	zero,zero
    15e0:	00000704 	0x704
    15e4:	00250700 	0x250700
    15e8:	08040000 	j	100000 <_data-0x7ff00000>
    15ec:	07000000 	bltz	t8,15f0 <_data-0x7fffea10>
    15f0:	00000025 	move	zero,zero
    15f4:	00000904 	0x904
    15f8:	00250700 	0x250700
    15fc:	0a040000 	j	8100000 <_data-0x77f00000>
    1600:	07000000 	bltz	t8,1604 <_data-0x7fffe9fc>
    1604:	00000025 	move	zero,zero
    1608:	00000b04 	0xb04
    160c:	00250700 	0x250700
    1610:	0c040000 	jal	100000 <_data-0x7ff00000>
    1614:	07000000 	bltz	t8,1618 <_data-0x7fffe9e8>
    1618:	00000025 	move	zero,zero
    161c:	00000d04 	0xd04
    1620:	00250700 	0x250700
    1624:	0e040000 	jal	8100000 <_data-0x77f00000>
    1628:	07000000 	bltz	t8,162c <_data-0x7fffe9d4>
    162c:	00000025 	move	zero,zero
    1630:	00000f04 	0xf04
    1634:	00250700 	0x250700
    1638:	10040000 	beq	zero,a0,163c <_data-0x7fffe9c4>
    163c:	07000000 	bltz	t8,1640 <_data-0x7fffe9c0>
    1640:	00000025 	move	zero,zero
    1644:	00001104 	0x1104
    1648:	00250700 	0x250700
    164c:	12040000 	beq	s0,a0,1650 <_data-0x7fffe9b0>
    1650:	07000000 	bltz	t8,1654 <_data-0x7fffe9ac>
    1654:	00000025 	move	zero,zero
    1658:	00001304 	0x1304
    165c:	00250700 	0x250700
    1660:	14040000 	bne	zero,a0,1664 <_data-0x7fffe99c>
    1664:	07000000 	bltz	t8,1668 <_data-0x7fffe998>
    1668:	00000025 	move	zero,zero
    166c:	00001504 	0x1504
    1670:	00250700 	0x250700
    1674:	16040000 	bne	s0,a0,1678 <_data-0x7fffe988>
    1678:	07000000 	bltz	t8,167c <_data-0x7fffe984>
    167c:	00000025 	move	zero,zero
    1680:	00001704 	0x1704
    1684:	00250700 	0x250700
    1688:	18040000 	0x18040000
    168c:	00000000 	nop
    1690:	00397c0b 	0x397c0b
    1694:	00430b00 	0x430b00
    1698:	0e000000 	jal	8000000 <_data-0x78000000>
    169c:	00000396 	0x396
    16a0:	10346e01 	beq	at,s4,1cea8 <_data-0x7ffe3158>
    16a4:	b90b0000 	swr	t3,0(t0)
    16a8:	00000016 	0x16
    16ac:	06010200 	bgez	s0,1eb0 <_data-0x7fffe150>
    16b0:	00000edc 	0xedc
    16b4:	0016ad0f 	0x16ad0f
    16b8:	08010200 	j	40800 <_data-0x7ffbf800>
    16bc:	00000ed3 	0xed3
    16c0:	0016b903 	sra	s7,s6,0x4
    16c4:	034a1000 	0x34a1000
    16c8:	4b030000 	c2	0x1030000
    16cc:	09000017 	j	400005c <_data-0x7bffffa4>
    16d0:	00000724 	0x724
    16d4:	0000170b 	0x170b
    16d8:	0016ad0a 	0x16ad0a
    16dc:	16ad0a00 	bne	s5,t5,3ee0 <_data-0x7fffc120>
    16e0:	ad0a0000 	sw	t2,0(t0)
    16e4:	0a000016 	j	8000058 <_data-0x77ffffa8>
    16e8:	000016ad 	0x16ad
    16ec:	0016ad0a 	0x16ad0a
    16f0:	16ad0a00 	bne	s5,t5,3ef4 <_data-0x7fffc10c>
    16f4:	ad0a0000 	sw	t2,0(t0)
    16f8:	0a000016 	j	8000058 <_data-0x77ffffa8>
    16fc:	000016ad 	0x16ad
    1700:	0016ad0a 	0x16ad0a
    1704:	16ad0a00 	bne	s5,t5,3f08 <_data-0x7fffc0f8>
    1708:	11000000 	beqz	t0,170c <_data-0x7fffe8f4>
    170c:	67010061 	0x67010061
    1710:	000016b9 	0x16b9
    1714:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    1718:	000016ad 	0x16ad
    171c:	0016ad0b 	0x16ad0b
    1720:	16ad0b00 	bne	s5,t5,4324 <_data-0x7fffbcdc>
    1724:	ad0b0000 	sw	t3,0(t0)
    1728:	0b000016 	j	c000058 <_data-0x73ffffa8>
    172c:	000016ad 	0x16ad
    1730:	0016ad0b 	0x16ad0b
    1734:	16ad0b00 	bne	s5,t5,4338 <_data-0x7fffbcc8>
    1738:	ad0b0000 	sw	t3,0(t0)
    173c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1740:	000016ad 	0x16ad
    1744:	0016ad0b 	0x16ad0b
    1748:	10000000 	b	174c <_data-0x7fffe8b4>
    174c:	000003cd 	break	0x0,0xf
    1750:	0017db03 	sra	k1,s7,0xc
    1754:	07240900 	0x7240900
    1758:	17960000 	bne	gp,s6,175c <_data-0x7fffe8a4>
    175c:	ad0a0000 	sw	t2,0(t0)
    1760:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1764:	000016ad 	0x16ad
    1768:	0016ad0a 	0x16ad0a
    176c:	16ad0a00 	bne	s5,t5,3f70 <_data-0x7fffc090>
    1770:	ad0a0000 	sw	t2,0(t0)
    1774:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1778:	000016ad 	0x16ad
    177c:	0016ad0a 	0x16ad0a
    1780:	16ad0a00 	bne	s5,t5,3f84 <_data-0x7fffc07c>
    1784:	ad0a0000 	sw	t2,0(t0)
    1788:	0a000016 	j	8000058 <_data-0x77ffffa8>
    178c:	000016ad 	0x16ad
    1790:	0016ad0a 	0x16ad0a
    1794:	61110000 	0x61110000
    1798:	b9670100 	swr	a3,256(t3)
    179c:	12000016 	beqz	s0,17f8 <_data-0x7fffe808>
    17a0:	ad0b6701 	sw	t3,26369(t0)
    17a4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    17a8:	000016ad 	0x16ad
    17ac:	0016ad0b 	0x16ad0b
    17b0:	16ad0b00 	bne	s5,t5,43b4 <_data-0x7fffbc4c>
    17b4:	ad0b0000 	sw	t3,0(t0)
    17b8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    17bc:	000016ad 	0x16ad
    17c0:	0016ad0b 	0x16ad0b
    17c4:	16ad0b00 	bne	s5,t5,43c8 <_data-0x7fffbc38>
    17c8:	ad0b0000 	sw	t3,0(t0)
    17cc:	0b000016 	j	c000058 <_data-0x73ffffa8>
    17d0:	000016ad 	0x16ad
    17d4:	0016ad0b 	0x16ad0b
    17d8:	10000000 	b	17dc <_data-0x7fffe824>
    17dc:	0000045a 	0x45a
    17e0:	00187503 	sra	t6,t8,0x14
    17e4:	07240900 	0x7240900
    17e8:	182b0000 	0x182b0000
    17ec:	ad0a0000 	sw	t2,0(t0)
    17f0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    17f4:	000016ad 	0x16ad
    17f8:	0016ad0a 	0x16ad0a
    17fc:	16ad0a00 	bne	s5,t5,4000 <_data-0x7fffc000>
    1800:	ad0a0000 	sw	t2,0(t0)
    1804:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1808:	000016ad 	0x16ad
    180c:	0016ad0a 	0x16ad0a
    1810:	16ad0a00 	bne	s5,t5,4014 <_data-0x7fffbfec>
    1814:	ad0a0000 	sw	t2,0(t0)
    1818:	0a000016 	j	8000058 <_data-0x77ffffa8>
    181c:	000016ad 	0x16ad
    1820:	0016ad0a 	0x16ad0a
    1824:	16ad0a00 	bne	s5,t5,4028 <_data-0x7fffbfd8>
    1828:	11000000 	beqz	t0,182c <_data-0x7fffe7d4>
    182c:	67010061 	0x67010061
    1830:	000016b9 	0x16b9
    1834:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    1838:	000016ad 	0x16ad
    183c:	0016ad0b 	0x16ad0b
    1840:	16ad0b00 	bne	s5,t5,4444 <_data-0x7fffbbbc>
    1844:	ad0b0000 	sw	t3,0(t0)
    1848:	0b000016 	j	c000058 <_data-0x73ffffa8>
    184c:	000016ad 	0x16ad
    1850:	0016ad0b 	0x16ad0b
    1854:	16ad0b00 	bne	s5,t5,4458 <_data-0x7fffbba8>
    1858:	ad0b0000 	sw	t3,0(t0)
    185c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1860:	000016ad 	0x16ad
    1864:	0016ad0b 	0x16ad0b
    1868:	16ad0b00 	bne	s5,t5,446c <_data-0x7fffbb94>
    186c:	ad0b0000 	sw	t3,0(t0)
    1870:	00000016 	0x16
    1874:	04f11000 	bgezal	a3,5878 <_data-0x7fffa788>
    1878:	19030000 	0x19030000
    187c:	09000019 	j	4000064 <_data-0x7bffff9c>
    1880:	00000724 	0x724
    1884:	000018ca 	0x18ca
    1888:	0016ad0a 	0x16ad0a
    188c:	16ad0a00 	bne	s5,t5,4090 <_data-0x7fffbf70>
    1890:	ad0a0000 	sw	t2,0(t0)
    1894:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1898:	000016ad 	0x16ad
    189c:	0016ad0a 	0x16ad0a
    18a0:	16ad0a00 	bne	s5,t5,40a4 <_data-0x7fffbf5c>
    18a4:	ad0a0000 	sw	t2,0(t0)
    18a8:	0a000016 	j	8000058 <_data-0x77ffffa8>
    18ac:	000016ad 	0x16ad
    18b0:	0016ad0a 	0x16ad0a
    18b4:	16ad0a00 	bne	s5,t5,40b8 <_data-0x7fffbf48>
    18b8:	ad0a0000 	sw	t2,0(t0)
    18bc:	0a000016 	j	8000058 <_data-0x77ffffa8>
    18c0:	000016ad 	0x16ad
    18c4:	0016ad0a 	0x16ad0a
    18c8:	61110000 	0x61110000
    18cc:	b9670100 	swr	a3,256(t3)
    18d0:	12000016 	beqz	s0,192c <_data-0x7fffe6d4>
    18d4:	ad0b6701 	sw	t3,26369(t0)
    18d8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    18dc:	000016ad 	0x16ad
    18e0:	0016ad0b 	0x16ad0b
    18e4:	16ad0b00 	bne	s5,t5,44e8 <_data-0x7fffbb18>
    18e8:	ad0b0000 	sw	t3,0(t0)
    18ec:	0b000016 	j	c000058 <_data-0x73ffffa8>
    18f0:	000016ad 	0x16ad
    18f4:	0016ad0b 	0x16ad0b
    18f8:	16ad0b00 	bne	s5,t5,44fc <_data-0x7fffbb04>
    18fc:	ad0b0000 	sw	t3,0(t0)
    1900:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1904:	000016ad 	0x16ad
    1908:	0016ad0b 	0x16ad0b
    190c:	16ad0b00 	bne	s5,t5,4510 <_data-0x7fffbaf0>
    1910:	ad0b0000 	sw	t3,0(t0)
    1914:	00000016 	0x16
    1918:	05921000 	bltzall	t4,591c <_data-0x7fffa6e4>
    191c:	c7030000 	lwc1	$f3,0(t8)
    1920:	09000019 	j	4000064 <_data-0x7bffff9c>
    1924:	00000724 	0x724
    1928:	00001973 	tltu	zero,zero,0x65
    192c:	0016ad0a 	0x16ad0a
    1930:	16ad0a00 	bne	s5,t5,4134 <_data-0x7fffbecc>
    1934:	ad0a0000 	sw	t2,0(t0)
    1938:	0a000016 	j	8000058 <_data-0x77ffffa8>
    193c:	000016ad 	0x16ad
    1940:	0016ad0a 	0x16ad0a
    1944:	16ad0a00 	bne	s5,t5,4148 <_data-0x7fffbeb8>
    1948:	ad0a0000 	sw	t2,0(t0)
    194c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1950:	000016ad 	0x16ad
    1954:	0016ad0a 	0x16ad0a
    1958:	16ad0a00 	bne	s5,t5,415c <_data-0x7fffbea4>
    195c:	ad0a0000 	sw	t2,0(t0)
    1960:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1964:	000016ad 	0x16ad
    1968:	0016ad0a 	0x16ad0a
    196c:	16ad0a00 	bne	s5,t5,4170 <_data-0x7fffbe90>
    1970:	11000000 	beqz	t0,1974 <_data-0x7fffe68c>
    1974:	67010061 	0x67010061
    1978:	000016b9 	0x16b9
    197c:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    1980:	000016ad 	0x16ad
    1984:	0016ad0b 	0x16ad0b
    1988:	16ad0b00 	bne	s5,t5,458c <_data-0x7fffba74>
    198c:	ad0b0000 	sw	t3,0(t0)
    1990:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1994:	000016ad 	0x16ad
    1998:	0016ad0b 	0x16ad0b
    199c:	16ad0b00 	bne	s5,t5,45a0 <_data-0x7fffba60>
    19a0:	ad0b0000 	sw	t3,0(t0)
    19a4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    19a8:	000016ad 	0x16ad
    19ac:	0016ad0b 	0x16ad0b
    19b0:	16ad0b00 	bne	s5,t5,45b4 <_data-0x7fffba4c>
    19b4:	ad0b0000 	sw	t3,0(t0)
    19b8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    19bc:	000016ad 	0x16ad
    19c0:	0016ad0b 	0x16ad0b
    19c4:	10000000 	b	19c8 <_data-0x7fffe638>
    19c8:	0000063d 	0x63d
    19cc:	001a7f03 	sra	t7,k0,0x1c
    19d0:	07240900 	0x7240900
    19d4:	1a260000 	0x1a260000
    19d8:	ad0a0000 	sw	t2,0(t0)
    19dc:	0a000016 	j	8000058 <_data-0x77ffffa8>
    19e0:	000016ad 	0x16ad
    19e4:	0016ad0a 	0x16ad0a
    19e8:	16ad0a00 	bne	s5,t5,41ec <_data-0x7fffbe14>
    19ec:	ad0a0000 	sw	t2,0(t0)
    19f0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    19f4:	000016ad 	0x16ad
    19f8:	0016ad0a 	0x16ad0a
    19fc:	16ad0a00 	bne	s5,t5,4200 <_data-0x7fffbe00>
    1a00:	ad0a0000 	sw	t2,0(t0)
    1a04:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1a08:	000016ad 	0x16ad
    1a0c:	0016ad0a 	0x16ad0a
    1a10:	16ad0a00 	bne	s5,t5,4214 <_data-0x7fffbdec>
    1a14:	ad0a0000 	sw	t2,0(t0)
    1a18:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1a1c:	000016ad 	0x16ad
    1a20:	0016ad0a 	0x16ad0a
    1a24:	61110000 	0x61110000
    1a28:	b9670100 	swr	a3,256(t3)
    1a2c:	12000016 	beqz	s0,1a88 <_data-0x7fffe578>
    1a30:	ad0b6701 	sw	t3,26369(t0)
    1a34:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1a38:	000016ad 	0x16ad
    1a3c:	0016ad0b 	0x16ad0b
    1a40:	16ad0b00 	bne	s5,t5,4644 <_data-0x7fffb9bc>
    1a44:	ad0b0000 	sw	t3,0(t0)
    1a48:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1a4c:	000016ad 	0x16ad
    1a50:	0016ad0b 	0x16ad0b
    1a54:	16ad0b00 	bne	s5,t5,4658 <_data-0x7fffb9a8>
    1a58:	ad0b0000 	sw	t3,0(t0)
    1a5c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1a60:	000016ad 	0x16ad
    1a64:	0016ad0b 	0x16ad0b
    1a68:	16ad0b00 	bne	s5,t5,466c <_data-0x7fffb994>
    1a6c:	ad0b0000 	sw	t3,0(t0)
    1a70:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1a74:	000016ad 	0x16ad
    1a78:	0016ad0b 	0x16ad0b
    1a7c:	10000000 	b	1a80 <_data-0x7fffe580>
    1a80:	000006f2 	tlt	zero,zero,0x1b
    1a84:	001b4103 	sra	t0,k1,0x4
    1a88:	07240900 	0x7240900
    1a8c:	1ae30000 	0x1ae30000
    1a90:	ad0a0000 	sw	t2,0(t0)
    1a94:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1a98:	000016ad 	0x16ad
    1a9c:	0016ad0a 	0x16ad0a
    1aa0:	16ad0a00 	bne	s5,t5,42a4 <_data-0x7fffbd5c>
    1aa4:	ad0a0000 	sw	t2,0(t0)
    1aa8:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1aac:	000016ad 	0x16ad
    1ab0:	0016ad0a 	0x16ad0a
    1ab4:	16ad0a00 	bne	s5,t5,42b8 <_data-0x7fffbd48>
    1ab8:	ad0a0000 	sw	t2,0(t0)
    1abc:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1ac0:	000016ad 	0x16ad
    1ac4:	0016ad0a 	0x16ad0a
    1ac8:	16ad0a00 	bne	s5,t5,42cc <_data-0x7fffbd34>
    1acc:	ad0a0000 	sw	t2,0(t0)
    1ad0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1ad4:	000016ad 	0x16ad
    1ad8:	0016ad0a 	0x16ad0a
    1adc:	16ad0a00 	bne	s5,t5,42e0 <_data-0x7fffbd20>
    1ae0:	11000000 	beqz	t0,1ae4 <_data-0x7fffe51c>
    1ae4:	67010061 	0x67010061
    1ae8:	000016b9 	0x16b9
    1aec:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    1af0:	000016ad 	0x16ad
    1af4:	0016ad0b 	0x16ad0b
    1af8:	16ad0b00 	bne	s5,t5,46fc <_data-0x7fffb904>
    1afc:	ad0b0000 	sw	t3,0(t0)
    1b00:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1b04:	000016ad 	0x16ad
    1b08:	0016ad0b 	0x16ad0b
    1b0c:	16ad0b00 	bne	s5,t5,4710 <_data-0x7fffb8f0>
    1b10:	ad0b0000 	sw	t3,0(t0)
    1b14:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1b18:	000016ad 	0x16ad
    1b1c:	0016ad0b 	0x16ad0b
    1b20:	16ad0b00 	bne	s5,t5,4724 <_data-0x7fffb8dc>
    1b24:	ad0b0000 	sw	t3,0(t0)
    1b28:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1b2c:	000016ad 	0x16ad
    1b30:	0016ad0b 	0x16ad0b
    1b34:	16ad0b00 	bne	s5,t5,4738 <_data-0x7fffb8c8>
    1b38:	ad0b0000 	sw	t3,0(t0)
    1b3c:	00000016 	0x16
    1b40:	07b11000 	bgezal	sp,5b44 <_data-0x7fffa4bc>
    1b44:	0d030000 	jal	40c0000 <_data-0x7bf40000>
    1b48:	0900001c 	j	4000070 <_data-0x7bffff90>
    1b4c:	00000724 	0x724
    1b50:	00001baa 	0x1baa
    1b54:	0016ad0a 	0x16ad0a
    1b58:	16ad0a00 	bne	s5,t5,435c <_data-0x7fffbca4>
    1b5c:	ad0a0000 	sw	t2,0(t0)
    1b60:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1b64:	000016ad 	0x16ad
    1b68:	0016ad0a 	0x16ad0a
    1b6c:	16ad0a00 	bne	s5,t5,4370 <_data-0x7fffbc90>
    1b70:	ad0a0000 	sw	t2,0(t0)
    1b74:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1b78:	000016ad 	0x16ad
    1b7c:	0016ad0a 	0x16ad0a
    1b80:	16ad0a00 	bne	s5,t5,4384 <_data-0x7fffbc7c>
    1b84:	ad0a0000 	sw	t2,0(t0)
    1b88:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1b8c:	000016ad 	0x16ad
    1b90:	0016ad0a 	0x16ad0a
    1b94:	16ad0a00 	bne	s5,t5,4398 <_data-0x7fffbc68>
    1b98:	ad0a0000 	sw	t2,0(t0)
    1b9c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1ba0:	000016ad 	0x16ad
    1ba4:	0016ad0a 	0x16ad0a
    1ba8:	61110000 	0x61110000
    1bac:	b9670100 	swr	a3,256(t3)
    1bb0:	12000016 	beqz	s0,1c0c <_data-0x7fffe3f4>
    1bb4:	ad0b6701 	sw	t3,26369(t0)
    1bb8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1bbc:	000016ad 	0x16ad
    1bc0:	0016ad0b 	0x16ad0b
    1bc4:	16ad0b00 	bne	s5,t5,47c8 <_data-0x7fffb838>
    1bc8:	ad0b0000 	sw	t3,0(t0)
    1bcc:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1bd0:	000016ad 	0x16ad
    1bd4:	0016ad0b 	0x16ad0b
    1bd8:	16ad0b00 	bne	s5,t5,47dc <_data-0x7fffb824>
    1bdc:	ad0b0000 	sw	t3,0(t0)
    1be0:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1be4:	000016ad 	0x16ad
    1be8:	0016ad0b 	0x16ad0b
    1bec:	16ad0b00 	bne	s5,t5,47f0 <_data-0x7fffb810>
    1bf0:	ad0b0000 	sw	t3,0(t0)
    1bf4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1bf8:	000016ad 	0x16ad
    1bfc:	0016ad0b 	0x16ad0b
    1c00:	16ad0b00 	bne	s5,t5,4804 <_data-0x7fffb7fc>
    1c04:	ad0b0000 	sw	t3,0(t0)
    1c08:	00000016 	0x16
    1c0c:	087a1000 	j	1e84000 <_data-0x7e17c000>
    1c10:	e3030000 	sc	v1,0(t8)
    1c14:	0900001c 	j	4000070 <_data-0x7bffff90>
    1c18:	00000724 	0x724
    1c1c:	00001c7b 	0x1c7b
    1c20:	0016ad0a 	0x16ad0a
    1c24:	16ad0a00 	bne	s5,t5,4428 <_data-0x7fffbbd8>
    1c28:	ad0a0000 	sw	t2,0(t0)
    1c2c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1c30:	000016ad 	0x16ad
    1c34:	0016ad0a 	0x16ad0a
    1c38:	16ad0a00 	bne	s5,t5,443c <_data-0x7fffbbc4>
    1c3c:	ad0a0000 	sw	t2,0(t0)
    1c40:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1c44:	000016ad 	0x16ad
    1c48:	0016ad0a 	0x16ad0a
    1c4c:	16ad0a00 	bne	s5,t5,4450 <_data-0x7fffbbb0>
    1c50:	ad0a0000 	sw	t2,0(t0)
    1c54:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1c58:	000016ad 	0x16ad
    1c5c:	0016ad0a 	0x16ad0a
    1c60:	16ad0a00 	bne	s5,t5,4464 <_data-0x7fffbb9c>
    1c64:	ad0a0000 	sw	t2,0(t0)
    1c68:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1c6c:	000016ad 	0x16ad
    1c70:	0016ad0a 	0x16ad0a
    1c74:	16ad0a00 	bne	s5,t5,4478 <_data-0x7fffbb88>
    1c78:	11000000 	beqz	t0,1c7c <_data-0x7fffe384>
    1c7c:	67010061 	0x67010061
    1c80:	000016b9 	0x16b9
    1c84:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    1c88:	000016ad 	0x16ad
    1c8c:	0016ad0b 	0x16ad0b
    1c90:	16ad0b00 	bne	s5,t5,4894 <_data-0x7fffb76c>
    1c94:	ad0b0000 	sw	t3,0(t0)
    1c98:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1c9c:	000016ad 	0x16ad
    1ca0:	0016ad0b 	0x16ad0b
    1ca4:	16ad0b00 	bne	s5,t5,48a8 <_data-0x7fffb758>
    1ca8:	ad0b0000 	sw	t3,0(t0)
    1cac:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1cb0:	000016ad 	0x16ad
    1cb4:	0016ad0b 	0x16ad0b
    1cb8:	16ad0b00 	bne	s5,t5,48bc <_data-0x7fffb744>
    1cbc:	ad0b0000 	sw	t3,0(t0)
    1cc0:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1cc4:	000016ad 	0x16ad
    1cc8:	0016ad0b 	0x16ad0b
    1ccc:	16ad0b00 	bne	s5,t5,48d0 <_data-0x7fffb730>
    1cd0:	ad0b0000 	sw	t3,0(t0)
    1cd4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1cd8:	000016ad 	0x16ad
    1cdc:	0016ad0b 	0x16ad0b
    1ce0:	10000000 	b	1ce4 <_data-0x7fffe31c>
    1ce4:	0000094d 	break	0x0,0x25
    1ce8:	001d3703 	sra	a2,sp,0x1c
    1cec:	07240900 	0x7240900
    1cf0:	1d100000 	0x1d100000
    1cf4:	ad0a0000 	sw	t2,0(t0)
    1cf8:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1cfc:	000016ad 	0x16ad
    1d00:	0016ad0a 	0x16ad0a
    1d04:	16ad0a00 	bne	s5,t5,4508 <_data-0x7fffbaf8>
    1d08:	ad0a0000 	sw	t2,0(t0)
    1d0c:	00000016 	0x16
    1d10:	01006111 	0x1006111
    1d14:	0016b967 	0x16b967
    1d18:	67011200 	0x67011200
    1d1c:	0016ad0b 	0x16ad0b
    1d20:	16ad0b00 	bne	s5,t5,4924 <_data-0x7fffb6dc>
    1d24:	ad0b0000 	sw	t3,0(t0)
    1d28:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1d2c:	000016ad 	0x16ad
    1d30:	0016ad0b 	0x16ad0b
    1d34:	10000000 	b	1d38 <_data-0x7fffe2c8>
    1d38:	0000099e 	0x99e
    1d3c:	001e1703 	sra	v0,s8,0x1c
    1d40:	07240900 	0x7240900
    1d44:	1daa0000 	0x1daa0000
    1d48:	ad0a0000 	sw	t2,0(t0)
    1d4c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1d50:	000016ad 	0x16ad
    1d54:	0016ad0a 	0x16ad0a
    1d58:	16ad0a00 	bne	s5,t5,455c <_data-0x7fffbaa4>
    1d5c:	ad0a0000 	sw	t2,0(t0)
    1d60:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1d64:	000016ad 	0x16ad
    1d68:	0016ad0a 	0x16ad0a
    1d6c:	16ad0a00 	bne	s5,t5,4570 <_data-0x7fffba90>
    1d70:	ad0a0000 	sw	t2,0(t0)
    1d74:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1d78:	000016ad 	0x16ad
    1d7c:	0016ad0a 	0x16ad0a
    1d80:	16ad0a00 	bne	s5,t5,4584 <_data-0x7fffba7c>
    1d84:	ad0a0000 	sw	t2,0(t0)
    1d88:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1d8c:	000016ad 	0x16ad
    1d90:	0016ad0a 	0x16ad0a
    1d94:	16ad0a00 	bne	s5,t5,4598 <_data-0x7fffba68>
    1d98:	ad0a0000 	sw	t2,0(t0)
    1d9c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1da0:	000016ad 	0x16ad
    1da4:	0016ad0a 	0x16ad0a
    1da8:	61110000 	0x61110000
    1dac:	b9670100 	swr	a3,256(t3)
    1db0:	12000016 	beqz	s0,1e0c <_data-0x7fffe1f4>
    1db4:	ad0b6701 	sw	t3,26369(t0)
    1db8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1dbc:	000016ad 	0x16ad
    1dc0:	0016ad0b 	0x16ad0b
    1dc4:	16ad0b00 	bne	s5,t5,49c8 <_data-0x7fffb638>
    1dc8:	ad0b0000 	sw	t3,0(t0)
    1dcc:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1dd0:	000016ad 	0x16ad
    1dd4:	0016ad0b 	0x16ad0b
    1dd8:	16ad0b00 	bne	s5,t5,49dc <_data-0x7fffb624>
    1ddc:	ad0b0000 	sw	t3,0(t0)
    1de0:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1de4:	000016ad 	0x16ad
    1de8:	0016ad0b 	0x16ad0b
    1dec:	16ad0b00 	bne	s5,t5,49f0 <_data-0x7fffb610>
    1df0:	ad0b0000 	sw	t3,0(t0)
    1df4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1df8:	000016ad 	0x16ad
    1dfc:	0016ad0b 	0x16ad0b
    1e00:	16ad0b00 	bne	s5,t5,4a04 <_data-0x7fffb5fc>
    1e04:	ad0b0000 	sw	t3,0(t0)
    1e08:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1e0c:	000016ad 	0x16ad
    1e10:	0016ad0b 	0x16ad0b
    1e14:	10000000 	b	1e18 <_data-0x7fffe1e8>
    1e18:	00000a7b 	0xa7b
    1e1c:	001e7503 	sra	t6,s8,0x14
    1e20:	07240900 	0x7240900
    1e24:	1e490000 	0x1e490000
    1e28:	ad0a0000 	sw	t2,0(t0)
    1e2c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1e30:	000016ad 	0x16ad
    1e34:	0016ad0a 	0x16ad0a
    1e38:	16ad0a00 	bne	s5,t5,463c <_data-0x7fffb9c4>
    1e3c:	ad0a0000 	sw	t2,0(t0)
    1e40:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1e44:	000016ad 	0x16ad
    1e48:	00611100 	0x611100
    1e4c:	16b96701 	bne	s5,t9,1ba54 <_data-0x7ffe45ac>
    1e50:	01120000 	0x1120000
    1e54:	16ad0b67 	bne	s5,t5,4bf4 <_data-0x7fffb40c>
    1e58:	ad0b0000 	sw	t3,0(t0)
    1e5c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1e60:	000016ad 	0x16ad
    1e64:	0016ad0b 	0x16ad0b
    1e68:	16ad0b00 	bne	s5,t5,4a6c <_data-0x7fffb594>
    1e6c:	ad0b0000 	sw	t3,0(t0)
    1e70:	00000016 	0x16
    1e74:	0ad61000 	j	b584000 <_data-0x74a7c000>
    1e78:	5f030000 	0x5f030000
    1e7c:	0900001f 	j	400007c <_data-0x7bffff84>
    1e80:	00000724 	0x724
    1e84:	00001eed 	0x1eed
    1e88:	0016ad0a 	0x16ad0a
    1e8c:	16ad0a00 	bne	s5,t5,4690 <_data-0x7fffb970>
    1e90:	ad0a0000 	sw	t2,0(t0)
    1e94:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1e98:	000016ad 	0x16ad
    1e9c:	0016ad0a 	0x16ad0a
    1ea0:	16ad0a00 	bne	s5,t5,46a4 <_data-0x7fffb95c>
    1ea4:	ad0a0000 	sw	t2,0(t0)
    1ea8:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1eac:	000016ad 	0x16ad
    1eb0:	0016ad0a 	0x16ad0a
    1eb4:	16ad0a00 	bne	s5,t5,46b8 <_data-0x7fffb948>
    1eb8:	ad0a0000 	sw	t2,0(t0)
    1ebc:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1ec0:	000016ad 	0x16ad
    1ec4:	0016ad0a 	0x16ad0a
    1ec8:	16ad0a00 	bne	s5,t5,46cc <_data-0x7fffb934>
    1ecc:	ad0a0000 	sw	t2,0(t0)
    1ed0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1ed4:	000016ad 	0x16ad
    1ed8:	0016ad0a 	0x16ad0a
    1edc:	16ad0a00 	bne	s5,t5,46e0 <_data-0x7fffb920>
    1ee0:	ad0a0000 	sw	t2,0(t0)
    1ee4:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1ee8:	000016ad 	0x16ad
    1eec:	00611100 	0x611100
    1ef0:	16b96701 	bne	s5,t9,1baf8 <_data-0x7ffe4508>
    1ef4:	01120000 	0x1120000
    1ef8:	16ad0b67 	bne	s5,t5,4c98 <_data-0x7fffb368>
    1efc:	ad0b0000 	sw	t3,0(t0)
    1f00:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1f04:	000016ad 	0x16ad
    1f08:	0016ad0b 	0x16ad0b
    1f0c:	16ad0b00 	bne	s5,t5,4b10 <_data-0x7fffb4f0>
    1f10:	ad0b0000 	sw	t3,0(t0)
    1f14:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1f18:	000016ad 	0x16ad
    1f1c:	0016ad0b 	0x16ad0b
    1f20:	16ad0b00 	bne	s5,t5,4b24 <_data-0x7fffb4dc>
    1f24:	ad0b0000 	sw	t3,0(t0)
    1f28:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1f2c:	000016ad 	0x16ad
    1f30:	0016ad0b 	0x16ad0b
    1f34:	16ad0b00 	bne	s5,t5,4b38 <_data-0x7fffb4c8>
    1f38:	ad0b0000 	sw	t3,0(t0)
    1f3c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1f40:	000016ad 	0x16ad
    1f44:	0016ad0b 	0x16ad0b
    1f48:	16ad0b00 	bne	s5,t5,4b4c <_data-0x7fffb4b4>
    1f4c:	ad0b0000 	sw	t3,0(t0)
    1f50:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1f54:	000016ad 	0x16ad
    1f58:	0016ad0b 	0x16ad0b
    1f5c:	10000000 	b	1f60 <_data-0x7fffe0a0>
    1f60:	00000bbd 	0xbbd
    1f64:	001fc703 	sra	t8,ra,0x1c
    1f68:	07240900 	0x7240900
    1f6c:	1f960000 	0x1f960000
    1f70:	ad0a0000 	sw	t2,0(t0)
    1f74:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1f78:	000016ad 	0x16ad
    1f7c:	0016ad0a 	0x16ad0a
    1f80:	16ad0a00 	bne	s5,t5,4784 <_data-0x7fffb87c>
    1f84:	ad0a0000 	sw	t2,0(t0)
    1f88:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1f8c:	000016ad 	0x16ad
    1f90:	0016ad0a 	0x16ad0a
    1f94:	61110000 	0x61110000
    1f98:	b9670100 	swr	a3,256(t3)
    1f9c:	12000016 	beqz	s0,1ff8 <_data-0x7fffe008>
    1fa0:	ad0b6701 	sw	t3,26369(t0)
    1fa4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1fa8:	000016ad 	0x16ad
    1fac:	0016ad0b 	0x16ad0b
    1fb0:	16ad0b00 	bne	s5,t5,4bb4 <_data-0x7fffb44c>
    1fb4:	ad0b0000 	sw	t3,0(t0)
    1fb8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    1fbc:	000016ad 	0x16ad
    1fc0:	0016ad0b 	0x16ad0b
    1fc4:	10000000 	b	1fc8 <_data-0x7fffe038>
    1fc8:	00000c22 	0xc22
    1fcc:	0020bb03 	0x20bb03
    1fd0:	07240900 	0x7240900
    1fd4:	20440000 	addi	a0,v0,0
    1fd8:	ad0a0000 	sw	t2,0(t0)
    1fdc:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1fe0:	000016ad 	0x16ad
    1fe4:	0016ad0a 	0x16ad0a
    1fe8:	16ad0a00 	bne	s5,t5,47ec <_data-0x7fffb814>
    1fec:	ad0a0000 	sw	t2,0(t0)
    1ff0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    1ff4:	000016ad 	0x16ad
    1ff8:	0016ad0a 	0x16ad0a
    1ffc:	16ad0a00 	bne	s5,t5,4800 <_data-0x7fffb800>
    2000:	ad0a0000 	sw	t2,0(t0)
    2004:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2008:	000016ad 	0x16ad
    200c:	0016ad0a 	0x16ad0a
    2010:	16ad0a00 	bne	s5,t5,4814 <_data-0x7fffb7ec>
    2014:	ad0a0000 	sw	t2,0(t0)
    2018:	0a000016 	j	8000058 <_data-0x77ffffa8>
    201c:	000016ad 	0x16ad
    2020:	0016ad0a 	0x16ad0a
    2024:	16ad0a00 	bne	s5,t5,4828 <_data-0x7fffb7d8>
    2028:	ad0a0000 	sw	t2,0(t0)
    202c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2030:	000016ad 	0x16ad
    2034:	0016ad0a 	0x16ad0a
    2038:	16ad0a00 	bne	s5,t5,483c <_data-0x7fffb7c4>
    203c:	ad0a0000 	sw	t2,0(t0)
    2040:	00000016 	0x16
    2044:	01006111 	0x1006111
    2048:	0016b967 	0x16b967
    204c:	67011200 	0x67011200
    2050:	0016ad0b 	0x16ad0b
    2054:	16ad0b00 	bne	s5,t5,4c58 <_data-0x7fffb3a8>
    2058:	ad0b0000 	sw	t3,0(t0)
    205c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2060:	000016ad 	0x16ad
    2064:	0016ad0b 	0x16ad0b
    2068:	16ad0b00 	bne	s5,t5,4c6c <_data-0x7fffb394>
    206c:	ad0b0000 	sw	t3,0(t0)
    2070:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2074:	000016ad 	0x16ad
    2078:	0016ad0b 	0x16ad0b
    207c:	16ad0b00 	bne	s5,t5,4c80 <_data-0x7fffb380>
    2080:	ad0b0000 	sw	t3,0(t0)
    2084:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2088:	000016ad 	0x16ad
    208c:	0016ad0b 	0x16ad0b
    2090:	16ad0b00 	bne	s5,t5,4c94 <_data-0x7fffb36c>
    2094:	ad0b0000 	sw	t3,0(t0)
    2098:	0b000016 	j	c000058 <_data-0x73ffffa8>
    209c:	000016ad 	0x16ad
    20a0:	0016ad0b 	0x16ad0b
    20a4:	16ad0b00 	bne	s5,t5,4ca8 <_data-0x7fffb358>
    20a8:	ad0b0000 	sw	t3,0(t0)
    20ac:	0b000016 	j	c000058 <_data-0x73ffffa8>
    20b0:	000016ad 	0x16ad
    20b4:	0016ad0b 	0x16ad0b
    20b8:	10000000 	b	20bc <_data-0x7fffdf44>
    20bc:	00000d13 	0xd13
    20c0:	0020f103 	0x20f103
    20c4:	07240900 	0x7240900
    20c8:	20d90000 	addi	t9,a2,0
    20cc:	ad0a0000 	sw	t2,0(t0)
    20d0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    20d4:	000016ad 	0x16ad
    20d8:	00611100 	0x611100
    20dc:	16b96701 	bne	s5,t9,1bce4 <_data-0x7ffe431c>
    20e0:	01120000 	0x1120000
    20e4:	16ad0b67 	bne	s5,t5,4e84 <_data-0x7fffb17c>
    20e8:	ad0b0000 	sw	t3,0(t0)
    20ec:	00000016 	0x16
    20f0:	0d461000 	jal	5184000 <_data-0x7ae7c000>
    20f4:	63030000 	0x63030000
    20f8:	09000021 	j	4000084 <_data-0x7bffff7c>
    20fc:	00000724 	0x724
    2100:	0000212d 	0x212d
    2104:	0016ad0a 	0x16ad0a
    2108:	16ad0a00 	bne	s5,t5,490c <_data-0x7fffb6f4>
    210c:	ad0a0000 	sw	t2,0(t0)
    2110:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2114:	000016ad 	0x16ad
    2118:	0016ad0a 	0x16ad0a
    211c:	16ad0a00 	bne	s5,t5,4920 <_data-0x7fffb6e0>
    2120:	ad0a0000 	sw	t2,0(t0)
    2124:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2128:	000016ad 	0x16ad
    212c:	00611100 	0x611100
    2130:	16b96701 	bne	s5,t9,1bd38 <_data-0x7ffe42c8>
    2134:	01120000 	0x1120000
    2138:	16ad0b67 	bne	s5,t5,4ed8 <_data-0x7fffb128>
    213c:	ad0b0000 	sw	t3,0(t0)
    2140:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2144:	000016ad 	0x16ad
    2148:	0016ad0b 	0x16ad0b
    214c:	16ad0b00 	bne	s5,t5,4d50 <_data-0x7fffb2b0>
    2150:	ad0b0000 	sw	t3,0(t0)
    2154:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2158:	000016ad 	0x16ad
    215c:	0016ad0b 	0x16ad0b
    2160:	10000000 	b	2164 <_data-0x7fffde9c>
    2164:	00000db5 	0xdb5
    2168:	00226103 	0x226103
    216c:	07240900 	0x7240900
    2170:	21e50000 	addi	a1,t7,0
    2174:	ad0a0000 	sw	t2,0(t0)
    2178:	0a000016 	j	8000058 <_data-0x77ffffa8>
    217c:	000016ad 	0x16ad
    2180:	0016ad0a 	0x16ad0a
    2184:	16ad0a00 	bne	s5,t5,4988 <_data-0x7fffb678>
    2188:	ad0a0000 	sw	t2,0(t0)
    218c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2190:	000016ad 	0x16ad
    2194:	0016ad0a 	0x16ad0a
    2198:	16ad0a00 	bne	s5,t5,499c <_data-0x7fffb664>
    219c:	ad0a0000 	sw	t2,0(t0)
    21a0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    21a4:	000016ad 	0x16ad
    21a8:	0016ad0a 	0x16ad0a
    21ac:	16ad0a00 	bne	s5,t5,49b0 <_data-0x7fffb650>
    21b0:	ad0a0000 	sw	t2,0(t0)
    21b4:	0a000016 	j	8000058 <_data-0x77ffffa8>
    21b8:	000016ad 	0x16ad
    21bc:	0016ad0a 	0x16ad0a
    21c0:	16ad0a00 	bne	s5,t5,49c4 <_data-0x7fffb63c>
    21c4:	ad0a0000 	sw	t2,0(t0)
    21c8:	0a000016 	j	8000058 <_data-0x77ffffa8>
    21cc:	000016ad 	0x16ad
    21d0:	0016ad0a 	0x16ad0a
    21d4:	16ad0a00 	bne	s5,t5,49d8 <_data-0x7fffb628>
    21d8:	ad0a0000 	sw	t2,0(t0)
    21dc:	0a000016 	j	8000058 <_data-0x77ffffa8>
    21e0:	000016ad 	0x16ad
    21e4:	00611100 	0x611100
    21e8:	16b96701 	bne	s5,t9,1bdf0 <_data-0x7ffe4210>
    21ec:	01120000 	0x1120000
    21f0:	16ad0b67 	bne	s5,t5,4f90 <_data-0x7fffb070>
    21f4:	ad0b0000 	sw	t3,0(t0)
    21f8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    21fc:	000016ad 	0x16ad
    2200:	0016ad0b 	0x16ad0b
    2204:	16ad0b00 	bne	s5,t5,4e08 <_data-0x7fffb1f8>
    2208:	ad0b0000 	sw	t3,0(t0)
    220c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2210:	000016ad 	0x16ad
    2214:	0016ad0b 	0x16ad0b
    2218:	16ad0b00 	bne	s5,t5,4e1c <_data-0x7fffb1e4>
    221c:	ad0b0000 	sw	t3,0(t0)
    2220:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2224:	000016ad 	0x16ad
    2228:	0016ad0b 	0x16ad0b
    222c:	16ad0b00 	bne	s5,t5,4e30 <_data-0x7fffb1d0>
    2230:	ad0b0000 	sw	t3,0(t0)
    2234:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2238:	000016ad 	0x16ad
    223c:	0016ad0b 	0x16ad0b
    2240:	16ad0b00 	bne	s5,t5,4e44 <_data-0x7fffb1bc>
    2244:	ad0b0000 	sw	t3,0(t0)
    2248:	0b000016 	j	c000058 <_data-0x73ffffa8>
    224c:	000016ad 	0x16ad
    2250:	0016ad0b 	0x16ad0b
    2254:	16ad0b00 	bne	s5,t5,4e58 <_data-0x7fffb1a8>
    2258:	ad0b0000 	sw	t3,0(t0)
    225c:	00000016 	0x16
    2260:	0eb01000 	jal	ac04000 <_data-0x753fc000>
    2264:	a1030000 	sb	v1,0(t0)
    2268:	09000022 	j	4000088 <_data-0x7bffff78>
    226c:	00000724 	0x724
    2270:	00002284 	0x2284
    2274:	0016ad0a 	0x16ad0a
    2278:	16ad0a00 	bne	s5,t5,4a7c <_data-0x7fffb584>
    227c:	ad0a0000 	sw	t2,0(t0)
    2280:	00000016 	0x16
    2284:	01006111 	0x1006111
    2288:	0016b967 	0x16b967
    228c:	67011200 	0x67011200
    2290:	0016ad0b 	0x16ad0b
    2294:	16ad0b00 	bne	s5,t5,4e98 <_data-0x7fffb168>
    2298:	ad0b0000 	sw	t3,0(t0)
    229c:	00000016 	0x16
    22a0:	0eed1000 	jal	bb44000 <_data-0x744bc000>
    22a4:	cd030000 	pref	0x3,0(t0)
    22a8:	09000022 	j	4000088 <_data-0x7bffff78>
    22ac:	00000724 	0x724
    22b0:	000022ba 	0x22ba
    22b4:	0016ad0a 	0x16ad0a
    22b8:	61110000 	0x61110000
    22bc:	b9670100 	swr	a3,256(t3)
    22c0:	12000016 	beqz	s0,231c <_data-0x7fffdce4>
    22c4:	ad0b6701 	sw	t3,26369(t0)
    22c8:	00000016 	0x16
    22cc:	0f161000 	jal	c584000 <_data-0x73a7c000>
    22d0:	49030000 	bc2tl	22d4 <_data-0x7fffdd2c>
    22d4:	09000023 	j	400008c <_data-0x7bffff74>
    22d8:	00000724 	0x724
    22dc:	0000230e 	0x230e
    22e0:	0016ad0a 	0x16ad0a
    22e4:	16ad0a00 	bne	s5,t5,4ae8 <_data-0x7fffb518>
    22e8:	ad0a0000 	sw	t2,0(t0)
    22ec:	0a000016 	j	8000058 <_data-0x77ffffa8>
    22f0:	000016ad 	0x16ad
    22f4:	0016ad0a 	0x16ad0a
    22f8:	16ad0a00 	bne	s5,t5,4afc <_data-0x7fffb504>
    22fc:	ad0a0000 	sw	t2,0(t0)
    2300:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2304:	000016ad 	0x16ad
    2308:	0016ad0a 	0x16ad0a
    230c:	61110000 	0x61110000
    2310:	b9670100 	swr	a3,256(t3)
    2314:	12000016 	beqz	s0,2370 <_data-0x7fffdc90>
    2318:	ad0b6701 	sw	t3,26369(t0)
    231c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2320:	000016ad 	0x16ad
    2324:	0016ad0b 	0x16ad0b
    2328:	16ad0b00 	bne	s5,t5,4f2c <_data-0x7fffb0d4>
    232c:	ad0b0000 	sw	t3,0(t0)
    2330:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2334:	000016ad 	0x16ad
    2338:	0016ad0b 	0x16ad0b
    233c:	16ad0b00 	bne	s5,t5,4f40 <_data-0x7fffb0c0>
    2340:	ad0b0000 	sw	t3,0(t0)
    2344:	00000016 	0x16
    2348:	0f8f1000 	jal	e3c4000 <_data-0x71c3c000>
    234c:	51030000 	beql	t0,v1,2350 <_data-0x7fffdcb0>
    2350:	09000024 	j	4000090 <_data-0x7bffff70>
    2354:	00000724 	0x724
    2358:	000023d0 	0x23d0
    235c:	0016ad0a 	0x16ad0a
    2360:	16ad0a00 	bne	s5,t5,4b64 <_data-0x7fffb49c>
    2364:	ad0a0000 	sw	t2,0(t0)
    2368:	0a000016 	j	8000058 <_data-0x77ffffa8>
    236c:	000016ad 	0x16ad
    2370:	0016ad0a 	0x16ad0a
    2374:	16ad0a00 	bne	s5,t5,4b78 <_data-0x7fffb488>
    2378:	ad0a0000 	sw	t2,0(t0)
    237c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2380:	000016ad 	0x16ad
    2384:	0016ad0a 	0x16ad0a
    2388:	16ad0a00 	bne	s5,t5,4b8c <_data-0x7fffb474>
    238c:	ad0a0000 	sw	t2,0(t0)
    2390:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2394:	000016ad 	0x16ad
    2398:	0016ad0a 	0x16ad0a
    239c:	16ad0a00 	bne	s5,t5,4ba0 <_data-0x7fffb460>
    23a0:	ad0a0000 	sw	t2,0(t0)
    23a4:	0a000016 	j	8000058 <_data-0x77ffffa8>
    23a8:	000016ad 	0x16ad
    23ac:	0016ad0a 	0x16ad0a
    23b0:	16ad0a00 	bne	s5,t5,4bb4 <_data-0x7fffb44c>
    23b4:	ad0a0000 	sw	t2,0(t0)
    23b8:	0a000016 	j	8000058 <_data-0x77ffffa8>
    23bc:	000016ad 	0x16ad
    23c0:	0016ad0a 	0x16ad0a
    23c4:	16ad0a00 	bne	s5,t5,4bc8 <_data-0x7fffb438>
    23c8:	ad0a0000 	sw	t2,0(t0)
    23cc:	00000016 	0x16
    23d0:	01006111 	0x1006111
    23d4:	0016b967 	0x16b967
    23d8:	67011200 	0x67011200
    23dc:	0016ad0b 	0x16ad0b
    23e0:	16ad0b00 	bne	s5,t5,4fe4 <_data-0x7fffb01c>
    23e4:	ad0b0000 	sw	t3,0(t0)
    23e8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    23ec:	000016ad 	0x16ad
    23f0:	0016ad0b 	0x16ad0b
    23f4:	16ad0b00 	bne	s5,t5,4ff8 <_data-0x7fffb008>
    23f8:	ad0b0000 	sw	t3,0(t0)
    23fc:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2400:	000016ad 	0x16ad
    2404:	0016ad0b 	0x16ad0b
    2408:	16ad0b00 	bne	s5,t5,500c <_data-0x7fffaff4>
    240c:	ad0b0000 	sw	t3,0(t0)
    2410:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2414:	000016ad 	0x16ad
    2418:	0016ad0b 	0x16ad0b
    241c:	16ad0b00 	bne	s5,t5,5020 <_data-0x7fffafe0>
    2420:	ad0b0000 	sw	t3,0(t0)
    2424:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2428:	000016ad 	0x16ad
    242c:	0016ad0b 	0x16ad0b
    2430:	16ad0b00 	bne	s5,t5,5034 <_data-0x7fffafcc>
    2434:	ad0b0000 	sw	t3,0(t0)
    2438:	0b000016 	j	c000058 <_data-0x73ffffa8>
    243c:	000016ad 	0x16ad
    2440:	0016ad0b 	0x16ad0b
    2444:	16ad0b00 	bne	s5,t5,5048 <_data-0x7fffafb8>
    2448:	ad0b0000 	sw	t3,0(t0)
    244c:	00000016 	0x16
    2450:	10941000 	beq	a0,s4,6454 <_data-0x7fff9bac>
    2454:	6d030000 	0x6d030000
    2458:	09000025 	j	4000094 <_data-0x7bffff6c>
    245c:	00000724 	0x724
    2460:	000024e2 	0x24e2
    2464:	0016ad0a 	0x16ad0a
    2468:	16ad0a00 	bne	s5,t5,4c6c <_data-0x7fffb394>
    246c:	ad0a0000 	sw	t2,0(t0)
    2470:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2474:	000016ad 	0x16ad
    2478:	0016ad0a 	0x16ad0a
    247c:	16ad0a00 	bne	s5,t5,4c80 <_data-0x7fffb380>
    2480:	ad0a0000 	sw	t2,0(t0)
    2484:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2488:	000016ad 	0x16ad
    248c:	0016ad0a 	0x16ad0a
    2490:	16ad0a00 	bne	s5,t5,4c94 <_data-0x7fffb36c>
    2494:	ad0a0000 	sw	t2,0(t0)
    2498:	0a000016 	j	8000058 <_data-0x77ffffa8>
    249c:	000016ad 	0x16ad
    24a0:	0016ad0a 	0x16ad0a
    24a4:	16ad0a00 	bne	s5,t5,4ca8 <_data-0x7fffb358>
    24a8:	ad0a0000 	sw	t2,0(t0)
    24ac:	0a000016 	j	8000058 <_data-0x77ffffa8>
    24b0:	000016ad 	0x16ad
    24b4:	0016ad0a 	0x16ad0a
    24b8:	16ad0a00 	bne	s5,t5,4cbc <_data-0x7fffb344>
    24bc:	ad0a0000 	sw	t2,0(t0)
    24c0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    24c4:	000016ad 	0x16ad
    24c8:	0016ad0a 	0x16ad0a
    24cc:	16ad0a00 	bne	s5,t5,4cd0 <_data-0x7fffb330>
    24d0:	ad0a0000 	sw	t2,0(t0)
    24d4:	0a000016 	j	8000058 <_data-0x77ffffa8>
    24d8:	000016ad 	0x16ad
    24dc:	0016ad0a 	0x16ad0a
    24e0:	61110000 	0x61110000
    24e4:	b9670100 	swr	a3,256(t3)
    24e8:	12000016 	beqz	s0,2544 <_data-0x7fffdabc>
    24ec:	ad0b6701 	sw	t3,26369(t0)
    24f0:	0b000016 	j	c000058 <_data-0x73ffffa8>
    24f4:	000016ad 	0x16ad
    24f8:	0016ad0b 	0x16ad0b
    24fc:	16ad0b00 	bne	s5,t5,5100 <_data-0x7fffaf00>
    2500:	ad0b0000 	sw	t3,0(t0)
    2504:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2508:	000016ad 	0x16ad
    250c:	0016ad0b 	0x16ad0b
    2510:	16ad0b00 	bne	s5,t5,5114 <_data-0x7fffaeec>
    2514:	ad0b0000 	sw	t3,0(t0)
    2518:	0b000016 	j	c000058 <_data-0x73ffffa8>
    251c:	000016ad 	0x16ad
    2520:	0016ad0b 	0x16ad0b
    2524:	16ad0b00 	bne	s5,t5,5128 <_data-0x7fffaed8>
    2528:	ad0b0000 	sw	t3,0(t0)
    252c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2530:	000016ad 	0x16ad
    2534:	0016ad0b 	0x16ad0b
    2538:	16ad0b00 	bne	s5,t5,513c <_data-0x7fffaec4>
    253c:	ad0b0000 	sw	t3,0(t0)
    2540:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2544:	000016ad 	0x16ad
    2548:	0016ad0b 	0x16ad0b
    254c:	16ad0b00 	bne	s5,t5,5150 <_data-0x7fffaeb0>
    2550:	ad0b0000 	sw	t3,0(t0)
    2554:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2558:	000016ad 	0x16ad
    255c:	0016ad0b 	0x16ad0b
    2560:	16ad0b00 	bne	s5,t5,5164 <_data-0x7fffae9c>
    2564:	ad0b0000 	sw	t3,0(t0)
    2568:	00000016 	0x16
    256c:	11ad1000 	beq	t5,t5,6570 <_data-0x7fff9a90>
    2570:	b7030000 	0xb7030000
    2574:	09000025 	j	4000094 <_data-0x7bffff6c>
    2578:	00000724 	0x724
    257c:	00002595 	0x2595
    2580:	0016ad0a 	0x16ad0a
    2584:	16ad0a00 	bne	s5,t5,4d88 <_data-0x7fffb278>
    2588:	ad0a0000 	sw	t2,0(t0)
    258c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2590:	000016ad 	0x16ad
    2594:	00611100 	0x611100
    2598:	16b96701 	bne	s5,t9,1c1a0 <_data-0x7ffe3e60>
    259c:	01120000 	0x1120000
    25a0:	16ad0b67 	bne	s5,t5,5340 <_data-0x7fffacc0>
    25a4:	ad0b0000 	sw	t3,0(t0)
    25a8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    25ac:	000016ad 	0x16ad
    25b0:	0016ad0b 	0x16ad0b
    25b4:	13000000 	beqz	t8,25b8 <_data-0x7fffda48>
    25b8:	0025bd04 	0x25bd04
    25bc:	16b41400 	bne	s5,s4,75c0 <_data-0x7fff8a40>
    25c0:	25cd0000 	addiu	t5,t6,0
    25c4:	25150000 	addiu	s5,t0,0
    25c8:	01000000 	0x1000000
    25cc:	11f41000 	beq	t7,s4,65d0 <_data-0x7fff9a30>
    25d0:	12030000 	beq	s0,v1,25d4 <_data-0x7fffda2c>
    25d4:	0c000026 	jal	98 <_data-0x7fffff68>
    25d8:	0025004e 	0x25004e
    25dc:	02040000 	0x2040000
    25e0:	0d000000 	jal	4000000 <_data-0x7c000000>
    25e4:	73010049 	0x73010049
    25e8:	00002601 	0x2601
    25ec:	00002507 	0x2507
    25f0:	00000400 	sll	zero,zero,0x10
    25f4:	25070000 	addiu	a3,t0,0
    25f8:	04000000 	bltz	zero,25fc <_data-0x7fffda04>
    25fc:	00000001 	movf	zero,zero,$fcc0
    2600:	74731100 	jalx	1cc4400 <_data-0x7e33bc00>
    2604:	74010072 	jalx	401c8 <_data-0x7ffbfe38>
    2608:	000025b7 	0x25b7
    260c:	0003230b 	0x3230b
    2610:	04130000 	bgezall	zero,2614 <_data-0x7fffd9ec>
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
    263c:	490d0000 	bc2t	$cc3,2640 <_data-0x7fffd9c0>
    2640:	ac730100 	sw	s3,256(v1)
    2644:	07000026 	bltz	t8,26e0 <_data-0x7fffd920>
    2648:	00000025 	move	zero,zero
    264c:	00000004 	sllv	zero,zero,zero
    2650:	00250700 	0x250700
    2654:	01040000 	0x1040000
    2658:	07000000 	bltz	t8,265c <_data-0x7fffd9a4>
    265c:	00000025 	move	zero,zero
    2660:	00000204 	0x204
    2664:	00250700 	0x250700
    2668:	03040000 	0x3040000
    266c:	07000000 	bltz	t8,2670 <_data-0x7fffd990>
    2670:	00000025 	move	zero,zero
    2674:	00000404 	0x404
    2678:	00250700 	0x250700
    267c:	05040000 	0x5040000
    2680:	07000000 	bltz	t8,2684 <_data-0x7fffd97c>
    2684:	00000025 	move	zero,zero
    2688:	00000604 	0x604
    268c:	00250700 	0x250700
    2690:	07040000 	0x7040000
    2694:	07000000 	bltz	t8,2698 <_data-0x7fffd968>
    2698:	00000025 	move	zero,zero
    269c:	00000804 	sllv	at,zero,zero
    26a0:	00250700 	0x250700
    26a4:	09040000 	j	4100000 <_data-0x7bf00000>
    26a8:	00000000 	nop
    26ac:	72747311 	0x72747311
    26b0:	12740100 	beq	s3,s4,2ab4 <_data-0x7fffd54c>
    26b4:	0b000026 	j	c000098 <_data-0x73ffff68>
    26b8:	000002ac 	0x2ac
    26bc:	12cc1600 	beq	s6,t4,7ec0 <_data-0x7fff8140>
    26c0:	05dc0000 	0x5dc0000
    26c4:	01e88800 	0x1e88800
    26c8:	9c010000 	0x9c010000
    26cc:	00003768 	0x3768
    26d0:	00072409 	0x72409
    26d4:	00275200 	0x275200
    26d8:	16ad0a00 	bne	s5,t5,4edc <_data-0x7fffb124>
    26dc:	ad0a0000 	sw	t2,0(t0)
    26e0:	0a000016 	j	8000058 <_data-0x77ffffa8>
    26e4:	000016ad 	0x16ad
    26e8:	0016ad0a 	0x16ad0a
    26ec:	16ad0a00 	bne	s5,t5,4ef0 <_data-0x7fffb110>
    26f0:	ad0a0000 	sw	t2,0(t0)
    26f4:	0a000016 	j	8000058 <_data-0x77ffffa8>
    26f8:	000016ad 	0x16ad
    26fc:	0016ad0a 	0x16ad0a
    2700:	16ad0a00 	bne	s5,t5,4f04 <_data-0x7fffb0fc>
    2704:	ad0a0000 	sw	t2,0(t0)
    2708:	0a000016 	j	8000058 <_data-0x77ffffa8>
    270c:	000016ad 	0x16ad
    2710:	0016ad0a 	0x16ad0a
    2714:	16ad0a00 	bne	s5,t5,4f18 <_data-0x7fffb0e8>
    2718:	ad0a0000 	sw	t2,0(t0)
    271c:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2720:	000016ad 	0x16ad
    2724:	0016ad0a 	0x16ad0a
    2728:	16ad0a00 	bne	s5,t5,4f2c <_data-0x7fffb0d4>
    272c:	ad0a0000 	sw	t2,0(t0)
    2730:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2734:	000016ad 	0x16ad
    2738:	0016ad0a 	0x16ad0a
    273c:	16ad0a00 	bne	s5,t5,4f40 <_data-0x7fffb0c0>
    2740:	ad0a0000 	sw	t2,0(t0)
    2744:	0a000016 	j	8000058 <_data-0x77ffffa8>
    2748:	000016ad 	0x16ad
    274c:	0016ad0a 	0x16ad0a
    2750:	61170000 	0x61170000
    2754:	b9670100 	swr	a3,256(t3)
    2758:	00000016 	0x16
    275c:	18000000 	blez	zero,2760 <_data-0x7fffd8a0>
    2760:	27df6701 	addiu	ra,s8,26369
    2764:	ad0b0000 	sw	t3,0(t0)
    2768:	0b000016 	j	c000058 <_data-0x73ffffa8>
    276c:	000016ad 	0x16ad
    2770:	0016ad0b 	0x16ad0b
    2774:	16ad0b00 	bne	s5,t5,5378 <_data-0x7fffac88>
    2778:	ad0b0000 	sw	t3,0(t0)
    277c:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2780:	000016ad 	0x16ad
    2784:	0016ad0b 	0x16ad0b
    2788:	16ad0b00 	bne	s5,t5,538c <_data-0x7fffac74>
    278c:	ad0b0000 	sw	t3,0(t0)
    2790:	0b000016 	j	c000058 <_data-0x73ffffa8>
    2794:	000016ad 	0x16ad
    2798:	0016ad0b 	0x16ad0b
    279c:	16ad0b00 	bne	s5,t5,53a0 <_data-0x7fffac60>
    27a0:	ad0b0000 	sw	t3,0(t0)
    27a4:	0b000016 	j	c000058 <_data-0x73ffffa8>
    27a8:	000016ad 	0x16ad
    27ac:	0016ad0b 	0x16ad0b
    27b0:	16ad0b00 	bne	s5,t5,53b4 <_data-0x7fffac4c>
    27b4:	ad0b0000 	sw	t3,0(t0)
    27b8:	0b000016 	j	c000058 <_data-0x73ffffa8>
    27bc:	000016ad 	0x16ad
    27c0:	0016ad0b 	0x16ad0b
    27c4:	16ad0b00 	bne	s5,t5,53c8 <_data-0x7fffac38>
    27c8:	ad0b0000 	sw	t3,0(t0)
    27cc:	0b000016 	j	c000058 <_data-0x73ffffa8>
    27d0:	000016ad 	0x16ad
    27d4:	0016ad0b 	0x16ad0b
    27d8:	16ad0b00 	bne	s5,t5,53dc <_data-0x7fffac24>
    27dc:	19000000 	blez	t0,27e0 <_data-0x7fffd820>
    27e0:	000011c3 	sra	v0,zero,0x7
    27e4:	16ad6701 	bne	s5,t5,1c3ec <_data-0x7ffe3c14>
    27e8:	00210000 	0x210000
    27ec:	ca190000 	lwc2	$25,0(s0)
    27f0:	01000011 	mthi	t0
    27f4:	0016ad67 	0x16ad67
    27f8:	00004200 	sll	t0,zero,0x8
    27fc:	11d11900 	beq	t6,s1,8c00 <_data-0x7fff7400>
    2800:	67010000 	0x67010000
    2804:	000016ad 	0x16ad
    2808:	00000063 	0x63
    280c:	0011d819 	0x11d819
    2810:	ad670100 	sw	a3,256(t3)
    2814:	84000016 	lh	zero,22(zero)
    2818:	19000000 	blez	t0,281c <_data-0x7fffd7e4>
    281c:	000001e5 	0x1e5
    2820:	16ad6701 	bne	s5,t5,1c428 <_data-0x7ffe3bd8>
    2824:	00a40000 	0xa40000
    2828:	37190000 	ori	t9,t8,0x0
    282c:	01000012 	0x1000012
    2830:	0016ad67 	0x16ad67
    2834:	0000c400 	sll	t8,zero,0x10
    2838:	123e1900 	beq	s1,s8,8c3c <_data-0x7fff73c4>
    283c:	67010000 	0x67010000
    2840:	000016ad 	0x16ad
    2844:	000000e4 	0xe4
    2848:	000bec19 	0xbec19
    284c:	ad670100 	sw	a3,256(t3)
    2850:	04000016 	bltz	zero,28ac <_data-0x7fffd754>
    2854:	19000001 	blez	t0,285c <_data-0x7fffd7a4>
    2858:	00001245 	0x1245
    285c:	16ad6701 	bne	s5,t5,1c464 <_data-0x7ffe3b9c>
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
    2890:	19000001 	blez	t0,2898 <_data-0x7fffd768>
    2894:	00000269 	0x269
    2898:	16ad6701 	bne	s5,t5,1c4a0 <_data-0x7ffe3b60>
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
    28c8:	04000016 	bltz	zero,2924 <_data-0x7fffd6dc>
    28cc:	19000002 	blez	t0,28d8 <_data-0x7fffd728>
    28d0:	0000038e 	0x38e
    28d4:	16ad6701 	bne	s5,t5,1c4dc <_data-0x7ffe3b24>
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
    2908:	19000002 	blez	t0,2914 <_data-0x7fffd6ec>
    290c:	0000043a 	0x43a
    2910:	16ad6701 	bne	s5,t5,1c518 <_data-0x7ffe3ae8>
    2914:	02ae0000 	0x2ae0000
    2918:	42190000 	c0	0x190000
    291c:	01000004 	sllv	zero,zero,t0
    2920:	0016ad67 	0x16ad67
    2924:	0002d000 	sll	k0,v0,0x0
    2928:	0ad71900 	j	b5c6400 <_data-0x74a39c00>
    292c:	67010000 	0x67010000
    2930:	000016ad 	0x16ad
    2934:	000002f2 	tlt	zero,zero,0xb
    2938:	000adf19 	0xadf19
    293c:	ad670100 	sw	a3,256(t3)
    2940:	14000016 	bnez	zero,299c <_data-0x7fffd664>
    2944:	1a000003 	blez	s0,2954 <_data-0x7fffd6ac>
    2948:	00002349 	0x2349
    294c:	8800069c 	lwl	zero,1692(zero)
    2950:	00000300 	sll	zero,zero,0xc
    2954:	375e6a01 	ori	s8,k0,0x6a01
    2958:	4a1b0000 	c2	0x1b0000
    295c:	36000024 	ori	zero,s0,0x24
    2960:	1b000003 	blez	t8,2970 <_data-0x7fffd690>
    2964:	00002445 	0x2445
    2968:	00000361 	0x361
    296c:	0024401b 	0x24401b
    2970:	00038e00 	sll	s1,v1,0x18
    2974:	243b1b00 	addiu	k1,at,6912
    2978:	03bb0000 	0x3bb0000
    297c:	361b0000 	ori	k1,s0,0x0
    2980:	e8000024 	swc2	$0,36(zero)
    2984:	1b000003 	blez	t8,2994 <_data-0x7fffd66c>
    2988:	00002431 	tgeu	zero,zero,0x90
    298c:	00000415 	0x415
    2990:	00242c1b 	0x242c1b
    2994:	00044200 	sll	t0,a0,0x8
    2998:	24271b00 	addiu	a3,at,6912
    299c:	046f0000 	0x46f0000
    29a0:	221b0000 	addi	k1,s0,0
    29a4:	9c000024 	0x9c000024
    29a8:	1b000004 	blez	t8,29bc <_data-0x7fffd644>
    29ac:	0000241d 	0x241d
    29b0:	000004c9 	0x4c9
    29b4:	0024181b 	0x24181b
    29b8:	0004eb00 	sll	sp,a0,0xc
    29bc:	24131b00 	li	s3,6912
    29c0:	050d0000 	0x50d0000
    29c4:	0e1b0000 	jal	86c0000 <_data-0x77940000>
    29c8:	2f000024 	sltiu	zero,t8,36
    29cc:	1b000005 	blez	t8,29e4 <_data-0x7fffd61c>
    29d0:	00002409 	jalr.hb	a0,zero
    29d4:	00000551 	0x551
    29d8:	0024041b 	0x24041b
    29dc:	00057300 	sll	t6,a1,0xc
    29e0:	23ff1b00 	addi	ra,ra,6912
    29e4:	05950000 	0x5950000
    29e8:	fa1b0000 	sdc2	$27,0(s0)
    29ec:	b7000023 	0xb7000023
    29f0:	1b000005 	blez	t8,2a08 <_data-0x7fffd5f8>
    29f4:	000023f5 	0x23f5
    29f8:	000005d9 	0x5d9
    29fc:	0023f01b 	0x23f01b
    2a00:	0005fb00 	sll	ra,a1,0xc
    2a04:	23eb1b00 	addi	t3,ra,6912
    2a08:	061d0000 	0x61d0000
    2a0c:	e61b0000 	swc1	$f27,0(s0)
    2a10:	3d000023 	0x3d000023
    2a14:	1b000006 	blez	t8,2a30 <_data-0x7fffd5d0>
    2a18:	000023e1 	0x23e1
    2a1c:	0000065d 	0x65d
    2a20:	0023dc1b 	0x23dc1b
    2a24:	00067d00 	sll	t7,a2,0x14
    2a28:	23d01b00 	addi	s0,s8,6912
    2a2c:	069d0000 	0x69d0000
    2a30:	631a0000 	0x631a0000
    2a34:	a8000021 	swl	zero,33(zero)
    2a38:	20880006 	addi	t0,a0,6
    2a3c:	01000003 	0x1000003
    2a40:	00374b6a 	0x374b6a
    2a44:	225a1b00 	addi	k0,s2,6912
    2a48:	06bd0000 	0x6bd0000
    2a4c:	551b0000 	bnel	t0,k1,2a50 <_data-0x7fffd5b0>
    2a50:	e8000022 	swc2	$0,34(zero)
    2a54:	1b000006 	blez	t8,2a70 <_data-0x7fffd590>
    2a58:	00002250 	0x2250
    2a5c:	00000715 	0x715
    2a60:	00224b1b 	0x224b1b
    2a64:	00074200 	sll	t0,a3,0x8
    2a68:	22461b00 	addi	a2,s2,6912
    2a6c:	076f0000 	0x76f0000
    2a70:	411b0000 	0x411b0000
    2a74:	9c000022 	0x9c000022
    2a78:	1b000007 	blez	t8,2a98 <_data-0x7fffd568>
    2a7c:	0000223c 	0x223c
    2a80:	000007c9 	0x7c9
    2a84:	0022371b 	0x22371b
    2a88:	0007f600 	sll	s8,a3,0x18
    2a8c:	22321b00 	addi	s2,s1,6912
    2a90:	08230000 	j	8c0000 <_data-0x7f740000>
    2a94:	2d1b0000 	sltiu	k1,t0,0
    2a98:	50000022 	beqzl	zero,2b24 <_data-0x7fffd4dc>
    2a9c:	1b000008 	blez	t8,2ac0 <_data-0x7fffd540>
    2aa0:	00002228 	0x2228
    2aa4:	00000872 	tlt	zero,zero,0x21
    2aa8:	0022231b 	0x22231b
    2aac:	00089400 	sll	s2,t0,0x10
    2ab0:	221e1b00 	addi	s8,s0,6912
    2ab4:	08b60000 	j	2d80000 <_data-0x7d280000>
    2ab8:	191b0000 	0x191b0000
    2abc:	d8000022 	ldc2	$0,34(zero)
    2ac0:	1b000008 	blez	t8,2ae4 <_data-0x7fffd51c>
    2ac4:	00002214 	0x2214
    2ac8:	000008fa 	0x8fa
    2acc:	00220f1b 	0x220f1b
    2ad0:	00091c00 	sll	v1,t1,0x10
    2ad4:	220a1b00 	addi	t2,s0,6912
    2ad8:	093e0000 	j	4f80000 <_data-0x7b080000>
    2adc:	051b0000 	0x51b0000
    2ae0:	60000022 	0x60000022
    2ae4:	1b000009 	blez	t8,2b0c <_data-0x7fffd4f4>
    2ae8:	00002200 	sll	a0,zero,0x8
    2aec:	00000982 	srl	at,zero,0x6
    2af0:	0021fb1b 	0x21fb1b
    2af4:	0009a400 	sll	s4,t1,0x10
    2af8:	21f61b00 	addi	s6,t7,6912
    2afc:	09c40000 	j	7100000 <_data-0x78f00000>
    2b00:	f11b0000 	0xf11b0000
    2b04:	e4000021 	swc1	$f0,33(zero)
    2b08:	1b000009 	blez	t8,2b30 <_data-0x7fffd4d0>
    2b0c:	000021e5 	0x21e5
    2b10:	00000a04 	0xa04
    2b14:	001fc71a 	0x1fc71a
    2b18:	0006b400 	sll	s6,a2,0x10
    2b1c:	00034088 	0x34088
    2b20:	386a0100 	xori	t2,v1,0x100
    2b24:	1b000037 	blez	t8,2c04 <_data-0x7fffd3fc>
    2b28:	000020b4 	teq	zero,zero,0x82
    2b2c:	00000a24 	0xa24
    2b30:	0020af1b 	0x20af1b
    2b34:	000a4f00 	sll	t1,t2,0x1c
    2b38:	20aa1b00 	addi	t2,a1,6912
    2b3c:	0a7c0000 	j	9f00000 <_data-0x76100000>
    2b40:	a51b0000 	sh	k1,0(t0)
    2b44:	a9000020 	swl	zero,32(t0)
    2b48:	1b00000a 	blez	t8,2b74 <_data-0x7fffd48c>
    2b4c:	000020a0 	0x20a0
    2b50:	00000ad6 	0xad6
    2b54:	00209b1b 	0x209b1b
    2b58:	000b0300 	sll	zero,t3,0xc
    2b5c:	20961b00 	addi	s6,a0,6912
    2b60:	0b300000 	j	cc00000 <_data-0x73400000>
    2b64:	911b0000 	lbu	k1,0(t0)
    2b68:	5d000020 	bgtzl	t0,2bec <_data-0x7fffd414>
    2b6c:	1b00000b 	blez	t8,2b9c <_data-0x7fffd464>
    2b70:	0000208c 	syscall	0x82
    2b74:	00000b8a 	0xb8a
    2b78:	0020871b 	0x20871b
    2b7c:	000bb700 	sll	s6,t3,0x1c
    2b80:	20821b00 	addi	v0,a0,6912
    2b84:	0bd90000 	j	f640000 <_data-0x709c0000>
    2b88:	7d1b0000 	0x7d1b0000
    2b8c:	fb000020 	sdc2	$0,32(t8)
    2b90:	1b00000b 	blez	t8,2bc0 <_data-0x7fffd440>
    2b94:	00002078 	0x2078
    2b98:	00000c1d 	0xc1d
    2b9c:	0020731b 	0x20731b
    2ba0:	000c3f00 	sll	a3,t4,0x1c
    2ba4:	206e1b00 	addi	t6,v1,6912
    2ba8:	0c610000 	jal	1840000 <_data-0x7e7c0000>
    2bac:	691b0000 	0x691b0000
    2bb0:	83000020 	lb	zero,32(t8)
    2bb4:	1b00000c 	blez	t8,2be8 <_data-0x7fffd418>
    2bb8:	00002064 	0x2064
    2bbc:	00000ca5 	0xca5
    2bc0:	00205f1b 	0x205f1b
    2bc4:	000cc700 	sll	t8,t4,0x1c
    2bc8:	205a1b00 	addi	k0,v0,6912
    2bcc:	0ce90000 	jal	3a40000 <_data-0x7c5c0000>
    2bd0:	551b0000 	bnel	t0,k1,2bd4 <_data-0x7fffd42c>
    2bd4:	0b000020 	j	c000080 <_data-0x73ffff80>
    2bd8:	1b00000d 	blez	t8,2c10 <_data-0x7fffd3f0>
    2bdc:	00002050 	0x2050
    2be0:	00000d2b 	0xd2b
    2be4:	0020441b 	0x20441b
    2be8:	000d4b00 	sll	t1,t5,0xc
    2bec:	1e751a00 	0x1e751a00
    2bf0:	06c00000 	bltz	s6,2bf4 <_data-0x7fffd40c>
    2bf4:	03608800 	0x3608800
    2bf8:	6a010000 	0x6a010000
    2bfc:	00003725 	0x3725
    2c00:	001f581b 	0x1f581b
    2c04:	000d6b00 	sll	t5,t5,0xc
    2c08:	1f531b00 	0x1f531b00
    2c0c:	0d960000 	jal	6580000 <_data-0x79a80000>
    2c10:	4e1b0000 	c3	0x1b0000
    2c14:	c300001f 	ll	zero,31(t8)
    2c18:	1b00000d 	blez	t8,2c50 <_data-0x7fffd3b0>
    2c1c:	00001f49 	0x1f49
    2c20:	00000df0 	tge	zero,zero,0x37
    2c24:	001f441b 	0x1f441b
    2c28:	000e1d00 	sll	v1,t6,0x14
    2c2c:	1f3f1b00 	0x1f3f1b00
    2c30:	0e4a0000 	jal	9280000 <_data-0x76d80000>
    2c34:	3a1b0000 	xori	k1,s0,0x0
    2c38:	7700001f 	jalx	c00007c <_data-0x73ffff84>
    2c3c:	1b00000e 	blez	t8,2c78 <_data-0x7fffd388>
    2c40:	00001f35 	0x1f35
    2c44:	00000ea4 	0xea4
    2c48:	001f301b 	0x1f301b
    2c4c:	000ed100 	sll	k0,t6,0x4
    2c50:	1f2b1b00 	0x1f2b1b00
    2c54:	0efe0000 	jal	bf80000 <_data-0x74080000>
    2c58:	261b0000 	addiu	k1,s0,0
    2c5c:	2000001f 	addi	zero,zero,31
    2c60:	1b00000f 	blez	t8,2ca0 <_data-0x7fffd360>
    2c64:	00001f21 	0x1f21
    2c68:	00000f42 	srl	at,zero,0x1d
    2c6c:	001f1c1b 	0x1f1c1b
    2c70:	000f6400 	sll	t4,t7,0x10
    2c74:	1f171b00 	0x1f171b00
    2c78:	0f860000 	jal	e180000 <_data-0x71e80000>
    2c7c:	121b0000 	beq	s0,k1,2c80 <_data-0x7fffd380>
    2c80:	a800001f 	swl	zero,31(zero)
    2c84:	1b00000f 	blez	t8,2cc4 <_data-0x7fffd33c>
    2c88:	00001f0d 	break	0x0,0x7c
    2c8c:	00000fca 	0xfca
    2c90:	001f081b 	0x1f081b
    2c94:	000fec00 	sll	sp,t7,0x10
    2c98:	1f031b00 	0x1f031b00
    2c9c:	100e0000 	beq	zero,t6,2ca0 <_data-0x7fffd360>
    2ca0:	fe1b0000 	sdc3	$27,0(s0)
    2ca4:	3000001e 	andi	zero,zero,0x1e
    2ca8:	1b000010 	blez	t8,2cec <_data-0x7fffd314>
    2cac:	00001ef9 	0x1ef9
    2cb0:	00001052 	mflhxu	v0
    2cb4:	001eed1b 	0x1eed1b
    2cb8:	00107200 	sll	t6,s0,0x8
    2cbc:	1d371a00 	0x1d371a00
    2cc0:	06cc0000 	teqi	s6,0
    2cc4:	03808800 	0x3808800
    2cc8:	6a010000 	0x6a010000
    2ccc:	00003712 	0x3712
    2cd0:	001e101b 	0x1e101b
    2cd4:	00109200 	sll	s2,s0,0x8
    2cd8:	1e0b1b00 	0x1e0b1b00
    2cdc:	10bd0000 	beq	a1,sp,2ce0 <_data-0x7fffd320>
    2ce0:	061b0000 	0x61b0000
    2ce4:	ea00001e 	swc2	$0,30(s0)
    2ce8:	1b000010 	blez	t8,2d2c <_data-0x7fffd2d4>
    2cec:	00001e01 	0x1e01
    2cf0:	00001117 	0x1117
    2cf4:	001dfc1b 	0x1dfc1b
    2cf8:	00114400 	sll	t0,s1,0x10
    2cfc:	1df71b00 	0x1df71b00
    2d00:	11710000 	beq	t3,s1,2d04 <_data-0x7fffd2fc>
    2d04:	f21b0000 	0xf21b0000
    2d08:	9e00001d 	0x9e00001d
    2d0c:	1b000011 	blez	t8,2d54 <_data-0x7fffd2ac>
    2d10:	00001ded 	0x1ded
    2d14:	000011cb 	0x11cb
    2d18:	001de81b 	0x1de81b
    2d1c:	0011f800 	sll	ra,s1,0x0
    2d20:	1de31b00 	0x1de31b00
    2d24:	12250000 	beq	s1,a1,2d28 <_data-0x7fffd2d8>
    2d28:	de1b0000 	ldc3	$27,0(s0)
    2d2c:	4700001d 	c1	0x100001d
    2d30:	1b000012 	blez	t8,2d7c <_data-0x7fffd284>
    2d34:	00001dd9 	0x1dd9
    2d38:	00001269 	0x1269
    2d3c:	001dd41b 	0x1dd41b
    2d40:	00128b00 	sll	s1,s2,0xc
    2d44:	1dcf1b00 	0x1dcf1b00
    2d48:	12ad0000 	beq	s5,t5,2d4c <_data-0x7fffd2b4>
    2d4c:	ca1b0000 	lwc2	$27,0(s0)
    2d50:	cf00001d 	pref	0x0,29(t8)
    2d54:	1b000012 	blez	t8,2da0 <_data-0x7fffd260>
    2d58:	00001dc5 	0x1dc5
    2d5c:	000012f1 	tgeu	zero,zero,0x4b
    2d60:	001dc01b 	0x1dc01b
    2d64:	00131300 	sll	v0,s3,0xc
    2d68:	1dbb1b00 	0x1dbb1b00
    2d6c:	13350000 	beq	t9,s5,2d70 <_data-0x7fffd290>
    2d70:	b61b0000 	0xb61b0000
    2d74:	5700001d 	bnezl	t8,2dec <_data-0x7fffd214>
    2d78:	1b000013 	blez	t8,2dc8 <_data-0x7fffd238>
    2d7c:	00001daa 	0x1daa
    2d80:	00001379 	0x1379
    2d84:	001c0d1a 	0x1c0d1a
    2d88:	0006d800 	sll	k1,a2,0x0
    2d8c:	0003a088 	0x3a088
    2d90:	ff6a0100 	sdc3	$10,256(k1)
    2d94:	1b000036 	blez	t8,2e70 <_data-0x7fffd190>
    2d98:	00001cdc 	0x1cdc
    2d9c:	00001399 	0x1399
    2da0:	001cd71b 	0x1cd71b
    2da4:	0013c400 	sll	t8,s3,0x10
    2da8:	1cd21b00 	0x1cd21b00
    2dac:	13f10000 	beq	ra,s1,2db0 <_data-0x7fffd250>
    2db0:	cd1b0000 	pref	0x1b,0(t0)
    2db4:	1e00001c 	bgtz	s0,2e28 <_data-0x7fffd1d8>
    2db8:	1b000014 	blez	t8,2e0c <_data-0x7fffd1f4>
    2dbc:	00001cc8 	0x1cc8
    2dc0:	0000144b 	0x144b
    2dc4:	001cc31b 	0x1cc31b
    2dc8:	00147800 	sll	t7,s4,0x0
    2dcc:	1cbe1b00 	0x1cbe1b00
    2dd0:	14a50000 	bne	a1,a1,2dd4 <_data-0x7fffd22c>
    2dd4:	b91b0000 	swr	k1,0(t0)
    2dd8:	d200001c 	0xd200001c
    2ddc:	1b000014 	blez	t8,2e30 <_data-0x7fffd1d0>
    2de0:	00001cb4 	teq	zero,zero,0x72
    2de4:	000014ff 	0x14ff
    2de8:	001caf1b 	0x1caf1b
    2dec:	00152c00 	sll	a1,s5,0x10
    2df0:	1caa1b00 	0x1caa1b00
    2df4:	154e0000 	bne	t2,t6,2df8 <_data-0x7fffd208>
    2df8:	a51b0000 	sh	k1,0(t0)
    2dfc:	7000001c 	0x7000001c
    2e00:	1b000015 	blez	t8,2e58 <_data-0x7fffd1a8>
    2e04:	00001ca0 	0x1ca0
    2e08:	00001592 	0x1592
    2e0c:	001c9b1b 	0x1c9b1b
    2e10:	0015b400 	sll	s6,s5,0x10
    2e14:	1c961b00 	0x1c961b00
    2e18:	15d60000 	bne	t6,s6,2e1c <_data-0x7fffd1e4>
    2e1c:	911b0000 	lbu	k1,0(t0)
    2e20:	f800001c 	sdc2	$0,28(zero)
    2e24:	1b000015 	blez	t8,2e7c <_data-0x7fffd184>
    2e28:	00001c8c 	syscall	0x72
    2e2c:	0000161a 	0x161a
    2e30:	001c871b 	0x1c871b
    2e34:	00163c00 	sll	a3,s6,0x10
    2e38:	1c7b1b00 	0x1c7b1b00
    2e3c:	165e0000 	bne	s2,s8,2e40 <_data-0x7fffd1c0>
    2e40:	411a0000 	0x411a0000
    2e44:	e400001b 	swc1	$f0,27(zero)
    2e48:	c0880006 	ll	t0,6(a0)
    2e4c:	01000003 	0x1000003
    2e50:	0036eb6a 	0x36eb6a
    2e54:	1c061b00 	0x1c061b00
    2e58:	16800000 	bnez	s4,2e5c <_data-0x7fffd1a4>
    2e5c:	011b0000 	0x11b0000
    2e60:	ab00001c 	swl	zero,28(t8)
    2e64:	1b000016 	blez	t8,2ec0 <_data-0x7fffd140>
    2e68:	00001bfc 	0x1bfc
    2e6c:	000016d8 	0x16d8
    2e70:	001bf71b 	0x1bf71b
    2e74:	00170500 	sll	zero,s7,0x14
    2e78:	1bf21b00 	0x1bf21b00
    2e7c:	17320000 	bne	t9,s2,2e80 <_data-0x7fffd180>
    2e80:	ed1b0000 	swc3	$27,0(t0)
    2e84:	5f00001b 	bgtzl	t8,2ef4 <_data-0x7fffd10c>
    2e88:	1b000017 	blez	t8,2ee8 <_data-0x7fffd118>
    2e8c:	00001be8 	0x1be8
    2e90:	0000178c 	syscall	0x5e
    2e94:	001be31b 	0x1be31b
    2e98:	0017b900 	sll	s7,s7,0x4
    2e9c:	1bde1b00 	0x1bde1b00
    2ea0:	17e60000 	bne	ra,a2,2ea4 <_data-0x7fffd15c>
    2ea4:	d91b0000 	ldc2	$27,0(t0)
    2ea8:	1300001b 	beqz	t8,2f18 <_data-0x7fffd0e8>
    2eac:	1b000018 	blez	t8,2f10 <_data-0x7fffd0f0>
    2eb0:	00001bd4 	0x1bd4
    2eb4:	00001835 	0x1835
    2eb8:	001bcf1b 	0x1bcf1b
    2ebc:	00185700 	sll	t2,t8,0x1c
    2ec0:	1bca1b00 	0x1bca1b00
    2ec4:	18790000 	0x18790000
    2ec8:	c51b0000 	lwc1	$f27,0(t0)
    2ecc:	9b00001b 	lwr	zero,27(t8)
    2ed0:	1b000018 	blez	t8,2f34 <_data-0x7fffd0cc>
    2ed4:	00001bc0 	sll	v1,zero,0xf
    2ed8:	000018bd 	0x18bd
    2edc:	001bbb1b 	0x1bbb1b
    2ee0:	0018df00 	sll	k1,t8,0x1c
    2ee4:	1bb61b00 	0x1bb61b00
    2ee8:	19010000 	0x19010000
    2eec:	aa1b0000 	swl	k1,0(s0)
    2ef0:	2300001b 	addi	zero,t8,27
    2ef4:	1a000019 	blez	s0,2f5c <_data-0x7fffd0a4>
    2ef8:	00001a7f 	0x1a7f
    2efc:	880006f0 	lwl	zero,1776(zero)
    2f00:	000003e0 	0x3e0
    2f04:	36d76a01 	ori	s7,s6,0x6a01
    2f08:	3a1b0000 	xori	k1,s0,0x0
    2f0c:	4500001b 	bc1f	2f7c <_data-0x7fffd084>
    2f10:	1b000019 	blez	t8,2f78 <_data-0x7fffd088>
    2f14:	00001b35 	0x1b35
    2f18:	00001970 	tge	zero,zero,0x65
    2f1c:	001b301b 	0x1b301b
    2f20:	00199d00 	sll	s3,t9,0x14
    2f24:	1b2b1b00 	0x1b2b1b00
    2f28:	19ca0000 	0x19ca0000
    2f2c:	261b0000 	addiu	k1,s0,0
    2f30:	f700001b 	sdc1	$f0,27(t8)
    2f34:	1b000019 	blez	t8,2f9c <_data-0x7fffd064>
    2f38:	00001b21 	0x1b21
    2f3c:	00001a24 	0x1a24
    2f40:	001b1c1b 	0x1b1c1b
    2f44:	001a5100 	sll	t2,k0,0x4
    2f48:	1b171b00 	0x1b171b00
    2f4c:	1a7e0000 	0x1a7e0000
    2f50:	121b0000 	beq	s0,k1,2f54 <_data-0x7fffd0ac>
    2f54:	ab00001b 	swl	zero,27(t8)
    2f58:	1b00001a 	blez	t8,2fc4 <_data-0x7fffd03c>
    2f5c:	00001b0d 	break	0x0,0x6c
    2f60:	00001ad8 	0x1ad8
    2f64:	001b081b 	0x1b081b
    2f68:	001afa00 	sll	ra,k0,0x8
    2f6c:	1b031b00 	0x1b031b00
    2f70:	1b1c0000 	0x1b1c0000
    2f74:	fe1b0000 	sdc3	$27,0(s0)
    2f78:	3e00001a 	0x3e00001a
    2f7c:	1b00001b 	blez	t8,2fec <_data-0x7fffd014>
    2f80:	00001af9 	0x1af9
    2f84:	00001b60 	0x1b60
    2f88:	001af41b 	0x1af41b
    2f8c:	001b8200 	sll	s0,k1,0x8
    2f90:	1aef1b00 	0x1aef1b00
    2f94:	1ba40000 	0x1ba40000
    2f98:	e31b0000 	sc	k1,0(t8)
    2f9c:	c600001a 	lwc1	$f0,26(s0)
    2fa0:	1a00001b 	blez	s0,3010 <_data-0x7fffcff0>
    2fa4:	000019c7 	0x19c7
    2fa8:	880006fc 	lwl	zero,1788(zero)
    2fac:	00000400 	sll	zero,zero,0x10
    2fb0:	36c36a01 	ori	v1,s6,0x6a01
    2fb4:	781b0000 	0x781b0000
    2fb8:	e800001a 	swc2	$0,26(zero)
    2fbc:	1b00001b 	blez	t8,302c <_data-0x7fffcfd4>
    2fc0:	00001a73 	tltu	zero,zero,0x69
    2fc4:	00001c13 	0x1c13
    2fc8:	001a6e1b 	0x1a6e1b
    2fcc:	001c4000 	sll	t0,gp,0x0
    2fd0:	1a691b00 	0x1a691b00
    2fd4:	1c6d0000 	0x1c6d0000
    2fd8:	641b0000 	0x641b0000
    2fdc:	9a00001a 	lwr	zero,26(s0)
    2fe0:	1b00001c 	blez	t8,3054 <_data-0x7fffcfac>
    2fe4:	00001a5f 	0x1a5f
    2fe8:	00001cc7 	0x1cc7
    2fec:	001a5a1b 	0x1a5a1b
    2ff0:	001cf400 	sll	s8,gp,0x10
    2ff4:	1a551b00 	0x1a551b00
    2ff8:	1d210000 	0x1d210000
    2ffc:	501b0000 	beql	zero,k1,3000 <_data-0x7fffd000>
    3000:	4e00001a 	c3	0x1a
    3004:	1b00001d 	blez	t8,307c <_data-0x7fffcf84>
    3008:	00001a4b 	0x1a4b
    300c:	00001d7b 	0x1d7b
    3010:	001a461b 	0x1a461b
    3014:	001d9d00 	sll	s3,sp,0x14
    3018:	1a411b00 	0x1a411b00
    301c:	1dbf0000 	0x1dbf0000
    3020:	3c1b0000 	lui	k1,0x0
    3024:	e100001a 	sc	zero,26(t0)
    3028:	1b00001d 	blez	t8,30a0 <_data-0x7fffcf60>
    302c:	00001a37 	0x1a37
    3030:	00001e03 	sra	v1,zero,0x18
    3034:	001a321b 	0x1a321b
    3038:	001e2500 	sll	a0,s8,0x14
    303c:	1a261b00 	0x1a261b00
    3040:	1e470000 	0x1e470000
    3044:	191a0000 	0x191a0000
    3048:	08000019 	j	64 <_data-0x7fffff9c>
    304c:	20880007 	addi	t0,a0,7
    3050:	01000004 	sllv	zero,zero,t0
    3054:	0036af6a 	0x36af6a
    3058:	19c01b00 	blez	t6,9c5c <_data-0x7fff63a4>
    305c:	1e690000 	0x1e690000
    3060:	bb1b0000 	swr	k1,0(t8)
    3064:	94000019 	lhu	zero,25(zero)
    3068:	1b00001e 	blez	t8,30e4 <_data-0x7fffcf1c>
    306c:	000019b6 	tne	zero,zero,0x66
    3070:	00001ec1 	0x1ec1
    3074:	0019b11b 	0x19b11b
    3078:	001eee00 	sll	sp,s8,0x18
    307c:	19ac1b00 	0x19ac1b00
    3080:	1f1b0000 	0x1f1b0000
    3084:	a71b0000 	sh	k1,0(t8)
    3088:	48000019 	0x48000019
    308c:	1b00001f 	blez	t8,310c <_data-0x7fffcef4>
    3090:	000019a2 	0x19a2
    3094:	00001f75 	0x1f75
    3098:	00199d1b 	0x199d1b
    309c:	001fa200 	sll	s4,ra,0x8
    30a0:	19981b00 	0x19981b00
    30a4:	1fcf0000 	0x1fcf0000
    30a8:	931b0000 	lbu	k1,0(t8)
    30ac:	fc000019 	sdc3	$0,25(zero)
    30b0:	1b00001f 	blez	t8,3130 <_data-0x7fffced0>
    30b4:	0000198e 	0x198e
    30b8:	0000201e 	0x201e
    30bc:	0019891b 	0x19891b
    30c0:	00204000 	0x204000
    30c4:	19841b00 	0x19841b00
    30c8:	20620000 	addi	v0,v1,0
    30cc:	7f1b0000 	0x7f1b0000
    30d0:	84000019 	lh	zero,25(zero)
    30d4:	1b000020 	blez	t8,3158 <_data-0x7fffcea8>
    30d8:	00001973 	tltu	zero,zero,0x65
    30dc:	000020a6 	0x20a6
    30e0:	0018751a 	0x18751a
    30e4:	00071400 	sll	v0,a3,0x10
    30e8:	00044088 	0x44088
    30ec:	9b6a0100 	lwr	t2,256(k1)
    30f0:	1b000036 	blez	t8,31cc <_data-0x7fffce34>
    30f4:	00001912 	0x1912
    30f8:	000020c8 	0x20c8
    30fc:	00190d1b 	0x190d1b
    3100:	0020f300 	0x20f300
    3104:	19081b00 	0x19081b00
    3108:	21200000 	addi	zero,t1,0
    310c:	031b0000 	0x31b0000
    3110:	4d000019 	bc3f	3178 <_data-0x7fffce88>
    3114:	1b000021 	blez	t8,319c <_data-0x7fffce64>
    3118:	000018fe 	0x18fe
    311c:	0000217a 	0x217a
    3120:	0018f91b 	0x18f91b
    3124:	0021a700 	0x21a700
    3128:	18f41b00 	0x18f41b00
    312c:	21d40000 	addi	s4,t6,0
    3130:	ef1b0000 	swc3	$27,0(t8)
    3134:	01000018 	mult	t0,zero
    3138:	1b000022 	blez	t8,31c4 <_data-0x7fffce3c>
    313c:	000018ea 	0x18ea
    3140:	0000222e 	0x222e
    3144:	0018e51b 	0x18e51b
    3148:	00225b00 	0x225b00
    314c:	18e01b00 	blez	a3,9d50 <_data-0x7fff62b0>
    3150:	227d0000 	addi	sp,s3,0
    3154:	db1b0000 	ldc2	$27,0(t8)
    3158:	9f000018 	0x9f000018
    315c:	1b000022 	blez	t8,31e8 <_data-0x7fffce18>
    3160:	000018d6 	0x18d6
    3164:	000022c1 	0x22c1
    3168:	0018ca1b 	0x18ca1b
    316c:	0022e300 	0x22e300
    3170:	17db1a00 	bne	s8,k1,9974 <_data-0x7fff668c>
    3174:	07200000 	bltz	t9,3178 <_data-0x7fffce88>
    3178:	04608800 	bltz	v1,fffe517c <_text_end+0x77fe3be4>
    317c:	6a010000 	0x6a010000
    3180:	00003687 	0x3687
    3184:	00186e1b 	0x186e1b
    3188:	00230500 	0x230500
    318c:	18691b00 	0x18691b00
    3190:	23300000 	addi	s0,t9,0
    3194:	641b0000 	0x641b0000
    3198:	5d000018 	bgtzl	t0,31fc <_data-0x7fffce04>
    319c:	1b000023 	blez	t8,322c <_data-0x7fffcdd4>
    31a0:	0000185f 	0x185f
    31a4:	0000238a 	0x238a
    31a8:	00185a1b 	0x185a1b
    31ac:	0023b700 	0x23b700
    31b0:	18551b00 	0x18551b00
    31b4:	23e40000 	addi	a0,ra,0
    31b8:	501b0000 	beql	zero,k1,31bc <_data-0x7fffce44>
    31bc:	11000018 	beqz	t0,3220 <_data-0x7fffcde0>
    31c0:	1b000024 	blez	t8,3254 <_data-0x7fffcdac>
    31c4:	0000184b 	0x184b
    31c8:	0000243e 	0x243e
    31cc:	0018461b 	0x18461b
    31d0:	00246b00 	0x246b00
    31d4:	18411b00 	0x18411b00
    31d8:	24980000 	addiu	t8,a0,0
    31dc:	3c1b0000 	lui	k1,0x0
    31e0:	ba000018 	swr	zero,24(s0)
    31e4:	1b000024 	blez	t8,3278 <_data-0x7fffcd88>
    31e8:	00001837 	0x1837
    31ec:	000024dc 	0x24dc
    31f0:	00182b1b 	0x182b1b
    31f4:	0024fe00 	0x24fe00
    31f8:	174b1a00 	bne	k0,t3,99fc <_data-0x7fff6604>
    31fc:	072c0000 	teqi	t9,0
    3200:	04808800 	bltz	a0,fffe5204 <_text_end+0x77fe3c6c>
    3204:	6a010000 	0x6a010000
    3208:	00003673 	tltu	zero,zero,0xd9
    320c:	0017d41b 	0x17d41b
    3210:	00252000 	0x252000
    3214:	17cf1b00 	bne	s8,t7,9e18 <_data-0x7fff61e8>
    3218:	254b0000 	addiu	t3,t2,0
    321c:	ca1b0000 	lwc2	$27,0(s0)
    3220:	78000017 	0x78000017
    3224:	1b000025 	blez	t8,32bc <_data-0x7fffcd44>
    3228:	000017c5 	0x17c5
    322c:	000025a5 	0x25a5
    3230:	0017c01b 	0x17c01b
    3234:	0025d200 	0x25d200
    3238:	17bb1b00 	bne	sp,k1,9e3c <_data-0x7fff61c4>
    323c:	25ff0000 	addiu	ra,t7,0
    3240:	b61b0000 	0xb61b0000
    3244:	2c000017 	sltiu	zero,zero,23
    3248:	1b000026 	blez	t8,32e4 <_data-0x7fffcd1c>
    324c:	000017b1 	tgeu	zero,zero,0x5e
    3250:	00002659 	0x2659
    3254:	0017ac1b 	0x17ac1b
    3258:	00268600 	0x268600
    325c:	17a71b00 	bne	sp,a3,9e60 <_data-0x7fff61a0>
    3260:	26b30000 	addiu	s3,s5,0
    3264:	a21b0000 	sb	k1,0(s0)
    3268:	d5000017 	ldc1	$f0,23(t0)
    326c:	1b000026 	blez	t8,3308 <_data-0x7fffccf8>
    3270:	00001796 	0x1796
    3274:	000026f7 	0x26f7
    3278:	0016c51a 	0x16c51a
    327c:	00073800 	sll	a3,a3,0x0
    3280:	0004a088 	0x4a088
    3284:	5f6a0100 	0x5f6a0100
    3288:	1b000036 	blez	t8,3364 <_data-0x7fffcc9c>
    328c:	00001744 	0x1744
    3290:	00002719 	0x2719
    3294:	00173f1b 	0x173f1b
    3298:	00274400 	0x274400
    329c:	173a1b00 	bne	t9,k0,9ea0 <_data-0x7fff6160>
    32a0:	27710000 	addiu	s1,k1,0
    32a4:	351b0000 	ori	k1,t0,0x0
    32a8:	9e000017 	0x9e000017
    32ac:	1b000027 	blez	t8,334c <_data-0x7fffccb4>
    32b0:	00001730 	tge	zero,zero,0x5c
    32b4:	000027cb 	0x27cb
    32b8:	00172b1b 	0x172b1b
    32bc:	0027f800 	0x27f800
    32c0:	17261b00 	bne	t9,a2,9ec4 <_data-0x7fff613c>
    32c4:	28250000 	slti	a1,at,0
    32c8:	211b0000 	addi	k1,t0,0
    32cc:	52000017 	beqzl	s0,332c <_data-0x7fffccd4>
    32d0:	1b000028 	blez	t8,3374 <_data-0x7fffcc8c>
    32d4:	0000171c 	0x171c
    32d8:	0000287f 	0x287f
    32dc:	0017171b 	0x17171b
    32e0:	0028ac00 	0x28ac00
    32e4:	170b1b00 	bne	t8,t3,9ee8 <_data-0x7fff6118>
    32e8:	28ce0000 	slti	t6,a2,0
    32ec:	cd1a0000 	pref	0x1a,0(t0)
    32f0:	44000022 	0x44000022
    32f4:	c0880007 	ll	t0,7(a0)
    32f8:	01000004 	sllv	zero,zero,t0
    32fc:	00364b6a 	0x364b6a
    3300:	23421b00 	addi	v0,k0,6912
    3304:	28f00000 	slti	s0,a3,0
    3308:	3d1b0000 	0x3d1b0000
    330c:	1b000023 	blez	t8,339c <_data-0x7fffcc64>
    3310:	1b000029 	blez	t8,33b8 <_data-0x7fffcc48>
    3314:	00002338 	0x2338
    3318:	00002948 	0x2948
    331c:	0023331b 	0x23331b
    3320:	00297500 	0x297500
    3324:	232e1b00 	addi	t6,t9,6912
    3328:	29a20000 	slti	v0,t5,0
    332c:	291b0000 	slti	k1,t0,0
    3330:	cf000023 	pref	0x0,35(t8)
    3334:	1b000029 	blez	t8,33dc <_data-0x7fffcc24>
    3338:	00002324 	0x2324
    333c:	000029fc 	0x29fc
    3340:	00231f1b 	0x231f1b
    3344:	002a2900 	0x2a2900
    3348:	231a1b00 	addi	k0,t8,6912
    334c:	2a560000 	slti	s6,s2,0
    3350:	0e1b0000 	jal	86c0000 <_data-0x77940000>
    3354:	83000023 	lb	zero,35(t8)
    3358:	1a00002a 	blez	s0,3404 <_data-0x7fffcbfc>
    335c:	000020f1 	tgeu	zero,zero,0x83
    3360:	88000750 	lwl	zero,1872(zero)
    3364:	000004e0 	0x4e0
    3368:	36376a01 	ori	s7,s1,0x6a01
    336c:	5c1b0000 	0x5c1b0000
    3370:	a5000021 	sh	zero,33(t0)
    3374:	1b00002a 	blez	t8,3420 <_data-0x7fffcbe0>
    3378:	00002157 	0x2157
    337c:	00002ad0 	0x2ad0
    3380:	0021521b 	0x21521b
    3384:	002afd00 	0x2afd00
    3388:	214d1b00 	addi	t5,t2,6912
    338c:	2b2a0000 	slti	t2,t9,0
    3390:	481b0000 	mfc2	k1,$0
    3394:	57000021 	bnezl	t8,341c <_data-0x7fffcbe4>
    3398:	1b00002b 	blez	t8,3448 <_data-0x7fffcbb8>
    339c:	00002143 	sra	a0,zero,0x5
    33a0:	00002b84 	0x2b84
    33a4:	00213e1b 	0x213e1b
    33a8:	002bb100 	0x2bb100
    33ac:	21391b00 	addi	t9,t1,6912
    33b0:	2bde0000 	slti	s8,s8,0
    33b4:	2d1b0000 	sltiu	k1,t0,0
    33b8:	0b000021 	j	c000084 <_data-0x73ffff7c>
    33bc:	1a00002c 	blez	s0,3470 <_data-0x7fffcb90>
    33c0:	00001f5f 	0x1f5f
    33c4:	88000758 	lwl	zero,1880(zero)
    33c8:	00000500 	sll	zero,zero,0x14
    33cc:	36266a01 	ori	a2,s1,0x6a01
    33d0:	c01b0000 	ll	k1,0(zero)
    33d4:	3800001f 	xori	zero,zero,0x1f
    33d8:	1b00002c 	blez	t8,348c <_data-0x7fffcb74>
    33dc:	00001fbb 	0x1fbb
    33e0:	00002c63 	0x2c63
    33e4:	001fb61b 	0x1fb61b
    33e8:	002c9000 	0x2c9000
    33ec:	1fb11b00 	0x1fb11b00
    33f0:	2cbd0000 	sltiu	sp,a1,0
    33f4:	ac1b0000 	sw	k1,0(zero)
    33f8:	ea00001f 	swc2	$0,31(s0)
    33fc:	1b00002c 	blez	t8,34b0 <_data-0x7fffcb50>
    3400:	00001fa7 	0x1fa7
    3404:	00002d17 	0x2d17
    3408:	001fa21b 	0x1fa21b
    340c:	002d4400 	0x2d4400
    3410:	1f961b00 	0x1f961b00
    3414:	2d710000 	sltiu	s1,t3,0
    3418:	171a0000 	bne	t8,k0,341c <_data-0x7fffcbe4>
    341c:	6000001e 	0x6000001e
    3420:	20880007 	addi	t0,a0,7
    3424:	01000005 	0x1000005
    3428:	0036156a 	0x36156a
    342c:	1e6e1b00 	0x1e6e1b00
    3430:	2d9e0000 	sltiu	s8,t4,0
    3434:	691b0000 	0x691b0000
    3438:	c900001e 	lwc2	$0,30(t0)
    343c:	1b00002d 	blez	t8,34f4 <_data-0x7fffcb0c>
    3440:	00001e64 	0x1e64
    3444:	00002df6 	tne	zero,zero,0xb7
    3448:	001e5f1b 	0x1e5f1b
    344c:	002e2300 	0x2e2300
    3450:	1e5a1b00 	0x1e5a1b00
    3454:	2e500000 	sltiu	s0,s2,0
    3458:	551b0000 	bnel	t0,k1,345c <_data-0x7fffcba4>
    345c:	7d00001e 	0x7d00001e
    3460:	1b00002e 	blez	t8,351c <_data-0x7fffcae4>
    3464:	00001e49 	0x1e49
    3468:	00002eaa 	0x2eaa
    346c:	001ce31a 	0x1ce31a
    3470:	00076800 	sll	t5,a3,0x0
    3474:	00054088 	0x54088
    3478:	046a0100 	tlti	v1,256
    347c:	1b000036 	blez	t8,3558 <_data-0x7fffcaa8>
    3480:	00001d30 	tge	zero,zero,0x74
    3484:	00002ed7 	0x2ed7
    3488:	001d2b1b 	0x1d2b1b
    348c:	002f0200 	0x2f0200
    3490:	1d261b00 	0x1d261b00
    3494:	2f2f0000 	sltiu	t7,t9,0
    3498:	211b0000 	addi	k1,t0,0
    349c:	5c00001d 	bgtzl	zero,3514 <_data-0x7fffcaec>
    34a0:	1b00002f 	blez	t8,3560 <_data-0x7fffcaa0>
    34a4:	00001d1c 	0x1d1c
    34a8:	00002f89 	0x2f89
    34ac:	001d101b 	0x1d101b
    34b0:	002fb600 	0x2fb600
    34b4:	256d1a00 	addiu	t5,t3,6656
    34b8:	07700000 	bltzal	k1,34bc <_data-0x7fffcb44>
    34bc:	05608800 	bltz	t3,fffe54c0 <_text_end+0x77fe3f28>
    34c0:	6a010000 	0x6a010000
    34c4:	000035f3 	tltu	zero,zero,0xd7
    34c8:	0025b01b 	0x25b01b
    34cc:	002fe300 	0x2fe300
    34d0:	25ab1b00 	addiu	t3,t5,6912
    34d4:	300e0000 	andi	t6,zero,0x0
    34d8:	a61b0000 	sh	k1,0(s0)
    34dc:	3b000025 	xori	zero,t8,0x25
    34e0:	1b000030 	blez	t8,35a4 <_data-0x7fffca5c>
    34e4:	000025a1 	0x25a1
    34e8:	00003068 	0x3068
    34ec:	0025951b 	0x25951b
    34f0:	00309500 	0x309500
    34f4:	22611a00 	addi	at,s3,6656
    34f8:	07780000 	0x7780000
    34fc:	05808800 	bltz	t4,fffe5500 <_text_end+0x77fe3f68>
    3500:	6a010000 	0x6a010000
    3504:	000035e2 	0x35e2
    3508:	00229a1b 	0x229a1b
    350c:	0030c200 	0x30c200
    3510:	22951b00 	addi	s5,s4,6912
    3514:	30ed0000 	andi	t5,a3,0x0
    3518:	901b0000 	lbu	k1,0(zero)
    351c:	1a000022 	blez	s0,35a8 <_data-0x7fffca58>
    3520:	1b000031 	blez	t8,35e8 <_data-0x7fffca18>
    3524:	00002284 	0x2284
    3528:	00003147 	0x3147
    352c:	0020bb1a 	0x20bb1a
    3530:	00078000 	sll	s0,a3,0x0
    3534:	0005a088 	0x5a088
    3538:	d16a0100 	0xd16a0100
    353c:	1b000035 	blez	t8,3614 <_data-0x7fffc9ec>
    3540:	000020ea 	0x20ea
    3544:	00003174 	teq	zero,zero,0xc5
    3548:	0020e51b 	0x20e51b
    354c:	00319f00 	0x319f00
    3550:	20d91b00 	addi	t9,a2,6912
    3554:	31cc0000 	andi	t4,t6,0x0
    3558:	a11a0000 	sb	k0,0(t0)
    355c:	88000022 	lwl	zero,34(zero)
    3560:	c0880007 	ll	t0,7(a0)
    3564:	01000005 	0x1000005
    3568:	0035c06a 	0x35c06a
    356c:	22c61b00 	addi	a2,s6,6912
    3570:	31f90000 	andi	t9,t7,0x0
    3574:	ba1b0000 	swr	k1,0(s0)
    3578:	24000022 	li	zero,34
    357c:	1a000032 	blez	s0,3648 <_data-0x7fffc9b8>
    3580:	00004358 	0x4358
    3584:	880007b4 	lwl	zero,1972(zero)
    3588:	000005e0 	0x5e0
    358c:	35af6a01 	ori	t7,t5,0x6a01
    3590:	621b0000 	0x621b0000
    3594:	51000043 	beqzl	t0,36a4 <_data-0x7fffc95c>
    3598:	1c000032 	bgtz	zero,3664 <_data-0x7fffc99c>
    359c:	880007c4 	lwl	zero,1988(zero)
    35a0:	000043f2 	tlt	zero,zero,0x10f
    35a4:	0554011d 	0x554011d
    35a8:	9400e08d 	lhu	zero,-8051(zero)
    35ac:	1e000001 	bgtz	s0,35b4 <_data-0x7fffca4c>
    35b0:	88000790 	lwl	zero,1936(zero)
    35b4:	000043f2 	tlt	zero,zero,0x10f
    35b8:	0254011d 	0x254011d
    35bc:	00000081 	0x81
    35c0:	0007881e 	0x7881e
    35c4:	0043f288 	0x43f288
    35c8:	54011d00 	bnel	zero,at,a9cc <_data-0x7fff5634>
    35cc:	00008202 	srl	s0,zero,0x8
    35d0:	07801e00 	bltz	gp,add4 <_data-0x7fff522c>
    35d4:	43f28800 	c0	0x1f28800
    35d8:	011d0000 	0x11d0000
    35dc:	00830254 	0x830254
    35e0:	781e0000 	0x781e0000
    35e4:	f2880007 	0xf2880007
    35e8:	1d000043 	bgtz	t0,36f8 <_data-0x7fffc908>
    35ec:	84025401 	lh	v0,21505(zero)
    35f0:	1e000000 	bgtz	s0,35f4 <_data-0x7fffca0c>
    35f4:	88000770 	lwl	zero,1904(zero)
    35f8:	000043f2 	tlt	zero,zero,0x10f
    35fc:	0254011d 	0x254011d
    3600:	00000085 	0x85
    3604:	0007681e 	0x7681e
    3608:	0043f288 	0x43f288
    360c:	54011d00 	bnel	zero,at,aa10 <_data-0x7fff55f0>
    3610:	00008602 	srl	s0,zero,0x18
    3614:	07601e00 	bltz	k1,ae18 <_data-0x7fff51e8>
    3618:	43f28800 	c0	0x1f28800
    361c:	011d0000 	0x11d0000
    3620:	00870254 	0x870254
    3624:	581e0000 	0x581e0000
    3628:	f2880007 	0xf2880007
    362c:	1d000043 	bgtz	t0,373c <_data-0x7fffc8c4>
    3630:	8e025401 	lw	v0,21505(s0)
    3634:	1e000000 	bgtz	s0,3638 <_data-0x7fffc9c8>
    3638:	88000750 	lwl	zero,1872(zero)
    363c:	000043f2 	tlt	zero,zero,0x10f
    3640:	0554011d 	0x554011d
    3644:	947f9891 	lhu	ra,-26479(v1)
    3648:	1e000001 	bgtz	s0,3650 <_data-0x7fffc9b0>
    364c:	88000744 	lwl	zero,1860(zero)
    3650:	000043f2 	tlt	zero,zero,0x10f
    3654:	0554011d 	0x554011d
    3658:	947f9c91 	lhu	ra,-25455(v1)
    365c:	1e000001 	bgtz	s0,3664 <_data-0x7fffc99c>
    3660:	88000738 	lwl	zero,1848(zero)
    3664:	000043f2 	tlt	zero,zero,0x10f
    3668:	0554011d 	0x554011d
    366c:	947fa091 	lhu	ra,-24431(v1)
    3670:	1e000001 	bgtz	s0,3678 <_data-0x7fffc988>
    3674:	8800072c 	lwl	zero,1836(zero)
    3678:	000043f2 	tlt	zero,zero,0x10f
    367c:	0554011d 	0x554011d
    3680:	947fa491 	lhu	ra,-23407(v1)
    3684:	1e000001 	bgtz	s0,368c <_data-0x7fffc974>
    3688:	88000720 	lwl	zero,1824(zero)
    368c:	000043f2 	tlt	zero,zero,0x10f
    3690:	0554011d 	0x554011d
    3694:	947fa891 	lhu	ra,-22383(v1)
    3698:	1e000001 	bgtz	s0,36a0 <_data-0x7fffc960>
    369c:	88000714 	lwl	zero,1812(zero)
    36a0:	000043f2 	tlt	zero,zero,0x10f
    36a4:	0554011d 	0x554011d
    36a8:	947fac91 	lhu	ra,-21359(v1)
    36ac:	1e000001 	bgtz	s0,36b4 <_data-0x7fffc94c>
    36b0:	88000708 	lwl	zero,1800(zero)
    36b4:	000043f2 	tlt	zero,zero,0x10f
    36b8:	0554011d 	0x554011d
    36bc:	947fb091 	lhu	ra,-20335(v1)
    36c0:	1e000001 	bgtz	s0,36c8 <_data-0x7fffc938>
    36c4:	880006fc 	lwl	zero,1788(zero)
    36c8:	000043f2 	tlt	zero,zero,0x10f
    36cc:	0554011d 	0x554011d
    36d0:	947fb491 	lhu	ra,-19311(v1)
    36d4:	1e000001 	bgtz	s0,36dc <_data-0x7fffc924>
    36d8:	880006f0 	lwl	zero,1776(zero)
    36dc:	000043f2 	tlt	zero,zero,0x10f
    36e0:	0554011d 	0x554011d
    36e4:	947fb891 	lhu	ra,-18287(v1)
    36e8:	1e000001 	bgtz	s0,36f0 <_data-0x7fffc910>
    36ec:	880006e4 	lwl	zero,1764(zero)
    36f0:	000043f2 	tlt	zero,zero,0x10f
    36f4:	0554011d 	0x554011d
    36f8:	947fbc91 	lhu	ra,-17263(v1)
    36fc:	1e000001 	bgtz	s0,3704 <_data-0x7fffc8fc>
    3700:	880006d8 	lwl	zero,1752(zero)
    3704:	000043f2 	tlt	zero,zero,0x10f
    3708:	0454011d 	0x454011d
    370c:	01944091 	0x1944091
    3710:	cc1e0000 	pref	0x1e,0(zero)
    3714:	f2880006 	0xf2880006
    3718:	1d000043 	bgtz	t0,3828 <_data-0x7fffc7d8>
    371c:	91045401 	lbu	a0,21505(t0)
    3720:	00019444 	0x19444
    3724:	06c01e00 	bltz	s6,af28 <_data-0x7fff50d8>
    3728:	43f28800 	c0	0x1f28800
    372c:	011d0000 	0x11d0000
    3730:	48910454 	0x48910454
    3734:	00000194 	0x194
    3738:	0006b41e 	0x6b41e
    373c:	0043f288 	0x43f288
    3740:	54011d00 	bnel	zero,at,ab44 <_data-0x7fff54bc>
    3744:	944c9104 	lhu	t4,-28412(v0)
    3748:	1e000001 	bgtz	s0,3750 <_data-0x7fffc8b0>
    374c:	880006a8 	lwl	zero,1704(zero)
    3750:	000043f2 	tlt	zero,zero,0x10f
    3754:	0454011d 	0x454011d
    3758:	01945091 	0x1945091
    375c:	9c1f0000 	0x9c1f0000
    3760:	f2880006 	0xf2880006
    3764:	00000043 	sra	zero,zero,0x1
    3768:	376e0413 	ori	t6,k1,0x413
    376c:	b4140000 	0xb4140000
    3770:	7e000016 	0x7e000016
    3774:	15000037 	bnez	t0,3854 <_data-0x7fffc7ac>
    3778:	00000025 	move	zero,zero
    377c:	db100019 	ldc2	$16,25(t8)
    3780:	03000013 	mtlo	t8
    3784:	000038b3 	tltu	zero,zero,0xe2
    3788:	25004e0c 	addiu	zero,t0,19980
    378c:	04000000 	bltz	zero,3790 <_data-0x7fffc870>
    3790:	0000001a 	div	zero,zero,zero
    3794:	0100490d 	break	0x100,0x124
    3798:	0038a273 	tltu	at,t8,0x289
    379c:	00250700 	0x250700
    37a0:	00040000 	sll	zero,a0,0x0
    37a4:	07000000 	bltz	t8,37a8 <_data-0x7fffc858>
    37a8:	00000025 	move	zero,zero
    37ac:	00000104 	0x104
    37b0:	00250700 	0x250700
    37b4:	02040000 	0x2040000
    37b8:	07000000 	bltz	t8,37bc <_data-0x7fffc844>
    37bc:	00000025 	move	zero,zero
    37c0:	00000304 	0x304
    37c4:	00250700 	0x250700
    37c8:	04040000 	0x4040000
    37cc:	07000000 	bltz	t8,37d0 <_data-0x7fffc830>
    37d0:	00000025 	move	zero,zero
    37d4:	00000504 	0x504
    37d8:	00250700 	0x250700
    37dc:	06040000 	0x6040000
    37e0:	07000000 	bltz	t8,37e4 <_data-0x7fffc81c>
    37e4:	00000025 	move	zero,zero
    37e8:	00000704 	0x704
    37ec:	00250700 	0x250700
    37f0:	08040000 	j	100000 <_data-0x7ff00000>
    37f4:	07000000 	bltz	t8,37f8 <_data-0x7fffc808>
    37f8:	00000025 	move	zero,zero
    37fc:	00000904 	0x904
    3800:	00250700 	0x250700
    3804:	0a040000 	j	8100000 <_data-0x77f00000>
    3808:	07000000 	bltz	t8,380c <_data-0x7fffc7f4>
    380c:	00000025 	move	zero,zero
    3810:	00000b04 	0xb04
    3814:	00250700 	0x250700
    3818:	0c040000 	jal	100000 <_data-0x7ff00000>
    381c:	07000000 	bltz	t8,3820 <_data-0x7fffc7e0>
    3820:	00000025 	move	zero,zero
    3824:	00000d04 	0xd04
    3828:	00250700 	0x250700
    382c:	0e040000 	jal	8100000 <_data-0x77f00000>
    3830:	07000000 	bltz	t8,3834 <_data-0x7fffc7cc>
    3834:	00000025 	move	zero,zero
    3838:	00000f04 	0xf04
    383c:	00250700 	0x250700
    3840:	10040000 	beq	zero,a0,3844 <_data-0x7fffc7bc>
    3844:	07000000 	bltz	t8,3848 <_data-0x7fffc7b8>
    3848:	00000025 	move	zero,zero
    384c:	00001104 	0x1104
    3850:	00250700 	0x250700
    3854:	12040000 	beq	s0,a0,3858 <_data-0x7fffc7a8>
    3858:	07000000 	bltz	t8,385c <_data-0x7fffc7a4>
    385c:	00000025 	move	zero,zero
    3860:	00001304 	0x1304
    3864:	00250700 	0x250700
    3868:	14040000 	bne	zero,a0,386c <_data-0x7fffc794>
    386c:	07000000 	bltz	t8,3870 <_data-0x7fffc790>
    3870:	00000025 	move	zero,zero
    3874:	00001504 	0x1504
    3878:	00250700 	0x250700
    387c:	16040000 	bne	s0,a0,3880 <_data-0x7fffc780>
    3880:	07000000 	bltz	t8,3884 <_data-0x7fffc77c>
    3884:	00000025 	move	zero,zero
    3888:	00001704 	0x1704
    388c:	00250700 	0x250700
    3890:	18040000 	0x18040000
    3894:	07000000 	bltz	t8,3898 <_data-0x7fffc768>
    3898:	00000025 	move	zero,zero
    389c:	00001904 	0x1904
    38a0:	73110000 	madd	t8,s1
    38a4:	01007274 	teq	t0,zero,0x1c9
    38a8:	00376874 	teq	at,s7,0x1a1
    38ac:	01950b00 	0x1950b00
    38b0:	13000000 	beqz	t8,38b4 <_data-0x7fffc74c>
    38b4:	0038b904 	0x38b904
    38b8:	16b41400 	bne	s5,s4,88bc <_data-0x7fff7744>
    38bc:	38c90000 	xori	t1,a2,0x0
    38c0:	25150000 	addiu	s5,t0,0
    38c4:	04000000 	bltz	zero,38c8 <_data-0x7fffc738>
    38c8:	150f1000 	bne	t0,t7,78cc <_data-0x7fff8734>
    38cc:	2c030000 	sltiu	v1,zero,0
    38d0:	0c000039 	jal	e4 <_data-0x7fffff1c>
    38d4:	0025004e 	0x25004e
    38d8:	05040000 	0x5040000
    38dc:	0d000000 	jal	4000000 <_data-0x7c000000>
    38e0:	73010049 	0x73010049
    38e4:	0000391b 	0x391b
    38e8:	00002507 	0x2507
    38ec:	00000400 	sll	zero,zero,0x10
    38f0:	25070000 	addiu	a3,t0,0
    38f4:	04000000 	bltz	zero,38f8 <_data-0x7fffc708>
    38f8:	00000001 	movf	zero,zero,$fcc0
    38fc:	00002507 	0x2507
    3900:	00020400 	sll	zero,v0,0x10
    3904:	25070000 	addiu	a3,t0,0
    3908:	04000000 	bltz	zero,390c <_data-0x7fffc6f4>
    390c:	00000003 	sra	zero,zero,0x0
    3910:	00002507 	0x2507
    3914:	00040400 	sll	zero,a0,0x10
    3918:	11000000 	beqz	t0,391c <_data-0x7fffc6e4>
    391c:	00727473 	tltu	v1,s2,0x1d1
    3920:	38b37401 	xori	s3,a1,0x7401
    3924:	500b0000 	beql	zero,t3,3928 <_data-0x7fffc6d8>
    3928:	00000001 	movf	zero,zero,$fcc0
    392c:	000f2620 	0xf2620
    3930:	c47c0100 	lwc1	$f28,256(v1)
    3934:	03000000 	0x3000000
    3938:	00003954 	0x3954
    393c:	25004e0c 	addiu	zero,t0,19980
    3940:	04000000 	bltz	zero,3944 <_data-0x7fffc6bc>
    3944:	00000002 	srl	zero,zero,0x0
    3948:	72747311 	0x72747311
    394c:	b77c0100 	0xb77c0100
    3950:	00000025 	move	zero,zero
    3954:	000ee120 	0xee120
    3958:	6b7c0100 	0x6b7c0100
    395c:	0300000b 	movn	zero,t8,zero
    3960:	0000397c 	0x397c
    3964:	25004e0c 	addiu	zero,t0,19980
    3968:	04000000 	bltz	zero,396c <_data-0x7fffc694>
    396c:	0000000a 	movz	zero,zero,zero
    3970:	72747311 	0x72747311
    3974:	127c0100 	beq	s3,gp,3d78 <_data-0x7fffc288>
    3978:	00000026 	xor	zero,zero,zero
    397c:	39820413 	xori	v0,t4,0x413
    3980:	b4140000 	0xb4140000
    3984:	92000016 	lbu	zero,22(s0)
    3988:	15000039 	bnez	t0,3a70 <_data-0x7fffc590>
    398c:	00000025 	move	zero,zero
    3990:	71160018 	0x71160018
    3994:	c4000015 	lwc1	$f0,21(zero)
    3998:	d4880007 	ldc1	$f8,7(a0)
    399c:	01000000 	0x1000000
    39a0:	003ad59c 	0x3ad59c
    39a4:	004e0c00 	0x4e0c00
    39a8:	00000025 	move	zero,zero
    39ac:	00001904 	0x1904
    39b0:	00490d00 	0x490d00
    39b4:	3ab57301 	xori	s5,s5,0x7301
    39b8:	25070000 	addiu	a3,t0,0
    39bc:	04000000 	bltz	zero,39c0 <_data-0x7fffc640>
    39c0:	00000000 	nop
    39c4:	00002507 	0x2507
    39c8:	00010400 	sll	zero,at,0x10
    39cc:	25070000 	addiu	a3,t0,0
    39d0:	04000000 	bltz	zero,39d4 <_data-0x7fffc62c>
    39d4:	00000002 	srl	zero,zero,0x0
    39d8:	00002507 	0x2507
    39dc:	00030400 	sll	zero,v1,0x10
    39e0:	25070000 	addiu	a3,t0,0
    39e4:	04000000 	bltz	zero,39e8 <_data-0x7fffc618>
    39e8:	00000004 	sllv	zero,zero,zero
    39ec:	00002507 	0x2507
    39f0:	00050400 	sll	zero,a1,0x10
    39f4:	25070000 	addiu	a3,t0,0
    39f8:	04000000 	bltz	zero,39fc <_data-0x7fffc604>
    39fc:	00000006 	srlv	zero,zero,zero
    3a00:	00002507 	0x2507
    3a04:	00070400 	sll	zero,a3,0x10
    3a08:	25070000 	addiu	a3,t0,0
    3a0c:	04000000 	bltz	zero,3a10 <_data-0x7fffc5f0>
    3a10:	00000008 	jr	zero
    3a14:	00002507 	0x2507
    3a18:	00090400 	sll	zero,t1,0x10
    3a1c:	25070000 	addiu	a3,t0,0
    3a20:	04000000 	bltz	zero,3a24 <_data-0x7fffc5dc>
    3a24:	0000000a 	movz	zero,zero,zero
    3a28:	00002507 	0x2507
    3a2c:	000b0400 	sll	zero,t3,0x10
    3a30:	25070000 	addiu	a3,t0,0
    3a34:	04000000 	bltz	zero,3a38 <_data-0x7fffc5c8>
    3a38:	0000000c 	syscall
    3a3c:	00002507 	0x2507
    3a40:	000d0400 	sll	zero,t5,0x10
    3a44:	25070000 	addiu	a3,t0,0
    3a48:	04000000 	bltz	zero,3a4c <_data-0x7fffc5b4>
    3a4c:	0000000e 	0xe
    3a50:	00002507 	0x2507
    3a54:	000f0400 	sll	zero,t7,0x10
    3a58:	25070000 	addiu	a3,t0,0
    3a5c:	04000000 	bltz	zero,3a60 <_data-0x7fffc5a0>
    3a60:	00000010 	mfhi	zero
    3a64:	00002507 	0x2507
    3a68:	00110400 	sll	zero,s1,0x10
    3a6c:	25070000 	addiu	a3,t0,0
    3a70:	04000000 	bltz	zero,3a74 <_data-0x7fffc58c>
    3a74:	00000012 	mflo	zero
    3a78:	00002507 	0x2507
    3a7c:	00130400 	sll	zero,s3,0x10
    3a80:	25070000 	addiu	a3,t0,0
    3a84:	04000000 	bltz	zero,3a88 <_data-0x7fffc578>
    3a88:	00000014 	0x14
    3a8c:	00002507 	0x2507
    3a90:	00150400 	sll	zero,s5,0x10
    3a94:	25070000 	addiu	a3,t0,0
    3a98:	04000000 	bltz	zero,3a9c <_data-0x7fffc564>
    3a9c:	00000016 	0x16
    3aa0:	00002507 	0x2507
    3aa4:	00170400 	sll	zero,s7,0x10
    3aa8:	25070000 	addiu	a3,t0,0
    3aac:	04000000 	bltz	zero,3ab0 <_data-0x7fffc550>
    3ab0:	00000018 	mult	zero,zero
    3ab4:	74731700 	jalx	1cc5c00 <_data-0x7e33a400>
    3ab8:	74010072 	jalx	401c8 <_data-0x7ffbfe38>
    3abc:	0000397c 	0x397c
    3ac0:	0000327c 	0x327c
    3ac4:	00004321 	0x4321
    3ac8:	1f550100 	0x1f550100
    3acc:	8800088c 	lwl	zero,2188(zero)
    3ad0:	000026bd 	0x26bd
    3ad4:	03352200 	0x3352200
    3ad8:	09020000 	j	4080000 <_data-0x7bf80000>
    3adc:	00000238 	0x238
    3ae0:	88000514 	lwl	zero,1300(zero)
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
    3b20:	10020069 	beq	zero,v0,3cc8 <_data-0x7fffc338>
    3b24:	00003c56 	0x3c56
    3b28:	000032dd 	0x32dd
    3b2c:	00433228 	0x433228
    3b30:	00051800 	sll	v1,a1,0x0
    3b34:	00028088 	0x28088
    3b38:	1b110200 	0x1b110200
    3b3c:	00004346 	0x4346
    3b40:	00003313 	0x3313
    3b44:	a0290000 	sb	t1,0(at)
    3b48:	27000002 	addiu	zero,t8,2
    3b4c:	14020069 	bne	zero,v0,3cf4 <_data-0x7fffc30c>
    3b50:	00003c56 	0x3c56
    3b54:	0000332b 	0x332b
    3b58:	0043321a 	0x43321a
    3b5c:	00055c00 	sll	t3,a1,0x10
    3b60:	0002c088 	0x2c088
    3b64:	75150200 	jalx	4540800 <_data-0x7babf800>
    3b68:	1b00003b 	blez	t8,3c58 <_data-0x7fffc3a8>
    3b6c:	00004346 	0x4346
    3b70:	00003349 	0x3349
    3b74:	39542a00 	xori	s4,t2,0x2a00
    3b78:	059c0000 	0x59c0000
    3b7c:	00088800 	sll	s1,t0,0x0
    3b80:	17020000 	bne	t8,v0,3b84 <_data-0x7fffc47c>
    3b84:	00003ba5 	0x3ba5
    3b88:	0039701b 	0x39701b
    3b8c:	00336100 	0x336100
    3b90:	059c2b00 	0x59c2b00
    3b94:	00088800 	sll	s1,t0,0x0
    3b98:	a41f0000 	sh	ra,0(zero)
    3b9c:	4f880005 	c3	0x1880005
    3ba0:	00000045 	0x45
    3ba4:	392c1a00 	xori	t4,t1,0x1a00
    3ba8:	05ac0000 	teqi	t5,0
    3bac:	02e88800 	0x2e88800
    3bb0:	19020000 	0x19020000
    3bb4:	00003c3e 	0x3c3e
    3bb8:	0039481b 	0x39481b
    3bbc:	00337900 	0x337900
    3bc0:	02e82900 	0x2e82900
    3bc4:	cd280000 	pref	0x8,0(t1)
    3bc8:	ac000025 	sw	zero,37(zero)
    3bcc:	e8880005 	swc2	$8,5(a0)
    3bd0:	01000002 	0x1000002
    3bd4:	26011b7f 	addiu	at,s0,7039
    3bd8:	33790000 	andi	t9,k1,0x0
    3bdc:	a1280000 	sb	t0,0(t1)
    3be0:	ac000022 	sw	zero,34(zero)
    3be4:	e8880005 	swc2	$8,5(a0)
    3be8:	01000002 	0x1000002
    3bec:	22c61b76 	addi	a2,s6,7030
    3bf0:	33910000 	andi	s1,gp,0x0
    3bf4:	ba1b0000 	swr	k1,0(s0)
    3bf8:	a5000022 	sh	zero,34(t0)
    3bfc:	2a000033 	slti	zero,s0,51
    3c00:	00004358 	0x4358
    3c04:	880005bc 	lwl	zero,1468(zero)
    3c08:	0000000c 	syscall
    3c0c:	3c2b6a01 	0x3c2b6a01
    3c10:	621b0000 	0x621b0000
    3c14:	b9000043 	swr	zero,67(t0)
    3c18:	1c000033 	bgtz	zero,3ce8 <_data-0x7fffc318>
    3c1c:	880005c8 	lwl	zero,1480(zero)
    3c20:	000043f2 	tlt	zero,zero,0x10f
    3c24:	0154011d 	0x154011d
    3c28:	1e000030 	bgtz	s0,3cec <_data-0x7fffc314>
    3c2c:	880005b4 	lwl	zero,1460(zero)
    3c30:	000043f2 	tlt	zero,zero,0x10f
    3c34:	0154011d 	0x154011d
    3c38:	0000003a 	0x3a
    3c3c:	ac1e0000 	sw	s8,0(zero)
    3c40:	6c880005 	0x6c880005
    3c44:	1d000043 	bgtz	t0,3d54 <_data-0x7fffc2ac>
    3c48:	80025401 	lb	v0,21505(zero)
    3c4c:	00000000 	nop
    3c50:	16c0042c 	bnez	s6,4d04 <_data-0x7fffb2fc>
    3c54:	042d0000 	0x42d0000
    3c58:	746e6905 	jalx	1b9a414 <_data-0x7e465bec>
    3c5c:	07e52200 	0x7e52200
    3c60:	09020000 	j	4080000 <_data-0x7bf80000>
    3c64:	00001354 	0x1354
    3c68:	88000448 	lwl	zero,1096(zero)
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
    3ca8:	10020069 	beq	zero,v0,3e50 <_data-0x7fffc1b0>
    3cac:	00003c56 	0x3c56
    3cb0:	00003402 	srl	a2,zero,0x10
    3cb4:	00433228 	0x433228
    3cb8:	00044c00 	sll	t1,a0,0x10
    3cbc:	0001e888 	0x1e888
    3cc0:	1b110200 	0x1b110200
    3cc4:	00004346 	0x4346
    3cc8:	00003416 	0x3416
    3ccc:	08290000 	j	a40000 <_data-0x7f5c0000>
    3cd0:	27000002 	addiu	zero,t8,2
    3cd4:	14020069 	bne	zero,v0,3e7c <_data-0x7fffc184>
    3cd8:	00003c56 	0x3c56
    3cdc:	0000342e 	0x342e
    3ce0:	0043321a 	0x43321a
    3ce4:	00049000 	sll	s2,a0,0x0
    3ce8:	00022888 	0x22888
    3cec:	fd150200 	sdc3	$21,512(t0)
    3cf0:	1b00003c 	blez	t8,3de4 <_data-0x7fffc21c>
    3cf4:	00004346 	0x4346
    3cf8:	0000344c 	syscall	0xd1
    3cfc:	39542a00 	xori	s4,t2,0x2a00
    3d00:	04d40000 	0x4d40000
    3d04:	00088800 	sll	s1,t0,0x0
    3d08:	17020000 	bne	t8,v0,3d0c <_data-0x7fffc2f4>
    3d0c:	00003d2d 	0x3d2d
    3d10:	0039701b 	0x39701b
    3d14:	00346400 	0x346400
    3d18:	04d42b00 	0x4d42b00
    3d1c:	00088800 	sll	s1,t0,0x0
    3d20:	dc1f0000 	ldc3	$31,0(zero)
    3d24:	4f880004 	c3	0x1880004
    3d28:	00000045 	0x45
    3d2c:	392c1a00 	xori	t4,t1,0x1a00
    3d30:	04e40000 	0x4e40000
    3d34:	02508800 	0x2508800
    3d38:	19020000 	0x19020000
    3d3c:	00003dc6 	0x3dc6
    3d40:	0039481b 	0x39481b
    3d44:	00347c00 	0x347c00
    3d48:	02502900 	0x2502900
    3d4c:	cd280000 	pref	0x8,0(t1)
    3d50:	e4000025 	swc1	$f0,37(zero)
    3d54:	50880004 	beql	a0,t0,3d68 <_data-0x7fffc298>
    3d58:	01000002 	0x1000002
    3d5c:	26011b7f 	addiu	at,s0,7039
    3d60:	347c0000 	ori	gp,v1,0x0
    3d64:	a1280000 	sb	t0,0(t1)
    3d68:	e4000022 	swc1	$f0,34(zero)
    3d6c:	50880004 	beql	a0,t0,3d80 <_data-0x7fffc280>
    3d70:	01000002 	0x1000002
    3d74:	22c61b76 	addi	a2,s6,7030
    3d78:	34940000 	ori	s4,a0,0x0
    3d7c:	ba1b0000 	swr	k1,0(s0)
    3d80:	a8000022 	swl	zero,34(zero)
    3d84:	2a000034 	slti	zero,s0,52
    3d88:	00004358 	0x4358
    3d8c:	880004f4 	lwl	zero,1268(zero)
    3d90:	0000000c 	syscall
    3d94:	3db36a01 	0x3db36a01
    3d98:	621b0000 	0x621b0000
    3d9c:	bc000043 	cache	0x0,67(zero)
    3da0:	1c000034 	bgtz	zero,3e74 <_data-0x7fffc18c>
    3da4:	88000500 	lwl	zero,1280(zero)
    3da8:	000043f2 	tlt	zero,zero,0x10f
    3dac:	0154011d 	0x154011d
    3db0:	1e000030 	bgtz	s0,3e74 <_data-0x7fffc18c>
    3db4:	880004ec 	lwl	zero,1260(zero)
    3db8:	000043f2 	tlt	zero,zero,0x10f
    3dbc:	0154011d 	0x154011d
    3dc0:	0000003a 	0x3a
    3dc4:	e41e0000 	swc1	$f30,0(zero)
    3dc8:	6c880004 	0x6c880004
    3dcc:	1d000043 	bgtz	t0,3edc <_data-0x7fffc124>
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
    3e44:	00038000 	sll	s0,v1,0x0
    3e48:	0000c888 	0xc888
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
    3e94:	03840000 	0x3840000
    3e98:	01508800 	0x1508800
    3e9c:	11020000 	beq	t0,v0,3ea0 <_data-0x7fffc160>
    3ea0:	0043461b 	0x43461b
    3ea4:	00352400 	0x352400
    3ea8:	29000000 	slti	zero,t0,0
    3eac:	00000170 	tge	zero,zero,0x5
    3eb0:	02006927 	0x2006927
    3eb4:	003c5614 	0x3c5614
    3eb8:	00353c00 	0x353c00
    3ebc:	43321a00 	c0	0x1321a00
    3ec0:	03c40000 	0x3c40000
    3ec4:	01908800 	0x1908800
    3ec8:	15020000 	bne	t0,v0,3ecc <_data-0x7fffc134>
    3ecc:	00003ed6 	0x3ed6
    3ed0:	0043462e 	0x43462e
    3ed4:	542a0000 	bnel	at,t2,3ed8 <_data-0x7fffc128>
    3ed8:	04000039 	bltz	zero,3fc0 <_data-0x7fffc040>
    3edc:	08880004 	j	2200010 <_data-0x7ddffff0>
    3ee0:	02000000 	0x2000000
    3ee4:	003f0617 	0x3f0617
    3ee8:	39701b00 	xori	s0,t3,0x1b00
    3eec:	355a0000 	ori	k0,t2,0x0
    3ef0:	042b0000 	tltiu	at,0
    3ef4:	08880004 	j	2200010 <_data-0x7ddffff0>
    3ef8:	1f000000 	bgtz	t8,3efc <_data-0x7fffc104>
    3efc:	8800040c 	lwl	zero,1036(zero)
    3f00:	0000454f 	0x454f
    3f04:	2c1a0000 	sltiu	k0,zero,0
    3f08:	14000039 	bnez	zero,3ff0 <_data-0x7fffc010>
    3f0c:	b8880004 	swr	t0,4(a0)
    3f10:	02000001 	movf	zero,s0,$fcc0
    3f14:	003f9f19 	0x3f9f19
    3f18:	39481b00 	xori	t0,t2,0x1b00
    3f1c:	35720000 	ori	s2,t3,0x0
    3f20:	b8290000 	swr	t1,0(at)
    3f24:	28000001 	slti	zero,zero,1
    3f28:	000025cd 	break	0x0,0x97
    3f2c:	88000414 	lwl	zero,1044(zero)
    3f30:	000001b8 	0x1b8
    3f34:	011b7f01 	0x11b7f01
    3f38:	72000026 	0x72000026
    3f3c:	28000035 	slti	zero,zero,53
    3f40:	000022a1 	0x22a1
    3f44:	88000414 	lwl	zero,1044(zero)
    3f48:	000001b8 	0x1b8
    3f4c:	c61b7601 	lwc1	$f27,30209(s0)
    3f50:	8a000022 	lwl	zero,34(s0)
    3f54:	1b000035 	blez	t8,402c <_data-0x7fffbfd4>
    3f58:	000022ba 	0x22ba
    3f5c:	0000359e 	0x359e
    3f60:	0043582a 	slt	t3,v0,v1
    3f64:	00042400 	sll	a0,a0,0x10
    3f68:	00000c88 	0xc88
    3f6c:	8c6a0100 	lw	t2,256(v1)
    3f70:	1b00003f 	blez	t8,4070 <_data-0x7fffbf90>
    3f74:	00004362 	0x4362
    3f78:	000035b2 	tlt	zero,zero,0xd6
    3f7c:	0004301c 	0x4301c
    3f80:	0043f288 	0x43f288
    3f84:	54011d00 	bnel	zero,at,b388 <_data-0x7fff4c78>
    3f88:	00003001 	movf	a2,zero,$fcc0
    3f8c:	00041c1e 	0x41c1e
    3f90:	0043f288 	0x43f288
    3f94:	54011d00 	bnel	zero,at,b398 <_data-0x7fff4c68>
    3f98:	00003a01 	0x3a01
    3f9c:	1e000000 	bgtz	s0,3fa0 <_data-0x7fffc060>
    3fa0:	88000414 	lwl	zero,1044(zero)
    3fa4:	0000436c 	0x436c
    3fa8:	0254011d 	0x254011d
    3fac:	00000080 	sll	zero,zero,0x2
    3fb0:	2c042c00 	sltiu	a0,zero,11264
    3fb4:	0f000000 	jal	c000000 <_data-0x74000000>
    3fb8:	00003fb1 	tgeu	zero,zero,0xfe
    3fbc:	00024520 	0x24520
    3fc0:	867c0100 	lh	gp,256(s3)
    3fc4:	03000005 	0x3000005
    3fc8:	00003fe4 	0x3fe4
    3fcc:	25004e0c 	addiu	zero,t0,19980
    3fd0:	04000000 	bltz	zero,3fd4 <_data-0x7fffc02c>
    3fd4:	00000019 	multu	zero,zero
    3fd8:	72747311 	0x72747311
    3fdc:	7c7c0100 	0x7c7c0100
    3fe0:	00000039 	0x39
    3fe4:	00108a2f 	0x108a2f
    3fe8:	561e0200 	bnel	s0,s8,47ec <_data-0x7fffb814>
    3fec:	9800003c 	lwr	zero,60(zero)
    3ff0:	0c880008 	jal	2200020 <_data-0x7ddfffe0>
    3ff4:	01000001 	movf	zero,t0,$fcc0
    3ff8:	0043329c 	0x43329c
    3ffc:	3fbc1a00 	0x3fbc1a00
    4000:	08980000 	j	2600000 <_data-0x7da00000>
    4004:	05f88800 	0x5f88800
    4008:	20020000 	addi	v0,zero,0
    400c:	00004038 	0x4038
    4010:	003fd81b 	0x3fd81b
    4014:	0035c600 	0x35c600
    4018:	05f82900 	0x5f82900
    401c:	b01e0000 	0xb01e0000
    4020:	92880008 	lbu	t0,8(s4)
    4024:	1d000039 	bgtz	t0,410c <_data-0x7fffbef4>
    4028:	03055401 	0x3055401
    402c:	8800107c 	lwl	zero,4220(zero)
    4030:	0155011d 	0x155011d
    4034:	00000030 	tge	zero,zero
    4038:	003e122a 	0x3e122a
    403c:	0008b800 	sll	s7,t0,0x0
    4040:	00000888 	0x888
    4044:	68220200 	0x68220200
    4048:	1b000040 	blez	t8,414c <_data-0x7fffbeb4>
    404c:	00003e2e 	0x3e2e
    4050:	000035de 	0x35de
    4054:	0008b82b 	sltu	s7,zero,t0
    4058:	00000888 	0x888
    405c:	08c01f00 	j	3007c00 <_data-0x7cff8400>
    4060:	44278800 	0x44278800
    4064:	00000000 	nop
    4068:	003dea2a 	0x3dea2a
    406c:	0008c000 	sll	t8,t0,0x0
    4070:	0000a488 	0xa488
    4074:	77230200 	jalx	c8c0800 <_data-0x7373f800>
    4078:	1b000042 	blez	t8,4184 <_data-0x7fffbe7c>
    407c:	00003e06 	0x3e06
    4080:	000035f6 	tne	zero,zero,0xd7
    4084:	0008c02b 	sltu	t8,zero,t0
    4088:	0000a488 	0xa488
    408c:	377e3000 	ori	s8,k1,0x3000
    4090:	08c00000 	j	3000000 <_data-0x7d000000>
    4094:	00a48800 	0xa48800
    4098:	7f010000 	0x7f010000
    409c:	0038ad2e 	0x38ad2e
    40a0:	38a21b00 	xori	v0,a1,0x1b00
    40a4:	35f60000 	ori	s6,t7,0x0
    40a8:	51300000 	beql	t1,s0,40ac <_data-0x7fffbf54>
    40ac:	c0000024 	ll	zero,36(zero)
    40b0:	a4880008 	sh	t0,8(a0)
    40b4:	01000000 	0x1000000
    40b8:	25661b76 	addiu	a2,t3,7030
    40bc:	360e0000 	ori	t6,s0,0x0
    40c0:	611b0000 	0x611b0000
    40c4:	22000025 	addi	zero,s0,37
    40c8:	1b000036 	blez	t8,41a4 <_data-0x7fffbe5c>
    40cc:	0000255c 	0x255c
    40d0:	00003636 	tne	zero,zero,0xd8
    40d4:	0025571b 	0x25571b
    40d8:	00364b00 	0x364b00
    40dc:	25521b00 	addiu	s2,t2,6912
    40e0:	36600000 	ori	zero,s3,0x0
    40e4:	4d1b0000 	0x4d1b0000
    40e8:	75000025 	jalx	4000094 <_data-0x7bffff6c>
    40ec:	1b000036 	blez	t8,41c8 <_data-0x7fffbe38>
    40f0:	00002548 	0x2548
    40f4:	0000368a 	0x368a
    40f8:	0025431b 	0x25431b
    40fc:	00369f00 	0x369f00
    4100:	253e1b00 	addiu	s8,t1,6912
    4104:	36b40000 	ori	s4,s5,0x0
    4108:	391b0000 	xori	k1,t0,0x0
    410c:	c9000025 	lwc2	$0,37(t0)
    4110:	1b000036 	blez	t8,41ec <_data-0x7fffbe14>
    4114:	00002534 	teq	zero,zero,0x94
    4118:	000036de 	0x36de
    411c:	00252f1b 	0x252f1b
    4120:	0036b400 	0x36b400
    4124:	252a1b00 	addiu	t2,t1,6912
    4128:	36c90000 	ori	t1,s6,0x0
    412c:	251b0000 	addiu	k1,t0,0
    4130:	60000025 	0x60000025
    4134:	1b000036 	blez	t8,4210 <_data-0x7fffbdf0>
    4138:	00002520 	0x2520
    413c:	00003675 	0x3675
    4140:	00251b1b 	0x251b1b
    4144:	0036f300 	0x36f300
    4148:	25161b00 	addiu	s6,t0,6912
    414c:	37080000 	ori	t0,t8,0x0
    4150:	111b0000 	beq	t0,k1,4154 <_data-0x7fffbeac>
    4154:	f3000025 	0xf3000025
    4158:	1b000036 	blez	t8,4234 <_data-0x7fffbdcc>
    415c:	0000250c 	syscall	0x94
    4160:	000036b4 	teq	zero,zero,0xda
    4164:	0025071b 	0x25071b
    4168:	00371d00 	0x371d00
    416c:	25021b00 	addiu	v0,t0,6912
    4170:	37320000 	ori	s2,t9,0x0
    4174:	fd1b0000 	sdc3	$27,0(t0)
    4178:	47000024 	c1	0x1000024
    417c:	1b000037 	blez	t8,425c <_data-0x7fffbda4>
    4180:	000024f8 	0x24f8
    4184:	0000364b 	0x364b
    4188:	0024f31b 	0x24f31b
    418c:	00369f00 	0x369f00
    4190:	24ee1b00 	addiu	t6,a3,6912
    4194:	37080000 	ori	t0,t8,0x0
    4198:	e21b0000 	sc	k1,0(s0)
    419c:	5c000024 	bgtzl	zero,4230 <_data-0x7fffbdd0>
    41a0:	31000037 	andi	zero,t0,0x37
    41a4:	880008c8 	lwl	zero,2248(zero)
    41a8:	000043f2 	tlt	zero,zero,0x10f
    41ac:	000041b7 	0x41b7
    41b0:	0254011d 	0x254011d
    41b4:	1e005408 	bgtz	s0,191d8 <_data-0x7ffe6e28>
    41b8:	88000964 	lwl	zero,2404(zero)
    41bc:	000026bd 	0x26bd
    41c0:	0254011d 	0x254011d
    41c4:	011d6508 	0x11d6508
    41c8:	73080255 	0x73080255
    41cc:	0256011d 	0x256011d
    41d0:	011d7408 	0x11d7408
    41d4:	69080257 	0x69080257
    41d8:	108d021d 	beq	a0,t5,4a50 <_data-0x7fffb5b0>
    41dc:	1d6e0802 	0x1d6e0802
    41e0:	02148d02 	0x2148d02
    41e4:	021d6708 	0x21d6708
    41e8:	0802188d 	j	86234 <_data-0x7ff79dcc>
    41ec:	8d021d20 	lw	v0,7456(t0)
    41f0:	6d08021c 	0x6d08021c
    41f4:	208d021d 	addi	t5,a0,541
    41f8:	1d650802 	0x1d650802
    41fc:	02248d02 	0x2248d02
    4200:	021d6d08 	0x21d6d08
    4204:	0802288d 	j	8a234 <_data-0x7ff75dcc>
    4208:	8d021d6f 	lw	v0,7535(t0)
    420c:	7208022c 	0x7208022c
    4210:	308d021d 	andi	t5,a0,0x21d
    4214:	1d790802 	0x1d790802
    4218:	02348d02 	0x2348d02
    421c:	021d2008 	0x21d2008
    4220:	0802388d 	j	8e234 <_data-0x7ff71dcc>
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
    4258:	74080200 	jalx	200800 <_data-0x7fdff800>
    425c:	d88d031d 	ldc2	$13,797(a0)
    4260:	21080200 	addi	t0,t0,512
    4264:	dc8d031d 	ldc3	$13,797(a0)
    4268:	1d3a0100 	0x1d3a0100
    426c:	00e08d03 	0xe08d03
    4270:	00003001 	movf	a2,zero,$fcc0
    4274:	2a000000 	slti	zero,s0,0
    4278:	00003e12 	0x3e12
    427c:	8800096c 	lwl	zero,2412(zero)
    4280:	00000008 	jr	zero
    4284:	42a72502 	c0	0xa72502
    4288:	2e1b0000 	sltiu	k1,s0,0
    428c:	7100003e 	0x7100003e
    4290:	2b000037 	slti	zero,t8,55
    4294:	8800096c 	lwl	zero,2412(zero)
    4298:	00000008 	jr	zero
    429c:	0009741f 	0x9741f
    42a0:	00442788 	0x442788
    42a4:	2a000000 	slti	zero,s0,0
    42a8:	00003fbc 	0x3fbc
    42ac:	88000974 	lwl	zero,2420(zero)
    42b0:	00000010 	mfhi	zero
    42b4:	42e62602 	c0	0xe62602
    42b8:	d81b0000 	ldc2	$27,0(zero)
    42bc:	8900003f 	lwl	zero,63(t0)
    42c0:	2b000037 	slti	zero,t8,55
    42c4:	88000974 	lwl	zero,2420(zero)
    42c8:	00000010 	mfhi	zero
    42cc:	0009841e 	0x9841e
    42d0:	00399288 	0x399288
    42d4:	54011d00 	bnel	zero,at,b6d8 <_data-0x7fff4928>
    42d8:	10980305 	beq	a0,t8,4ef0 <_data-0x7fffb110>
    42dc:	011d8800 	0x11d8800
    42e0:	00300155 	0x300155
    42e4:	122a0000 	beq	s1,t2,42e8 <_data-0x7fffbd18>
    42e8:	8c00003e 	lw	zero,62(zero)
    42ec:	08880009 	j	2200024 <_data-0x7ddfffdc>
    42f0:	02000000 	0x2000000
    42f4:	00431628 	0x431628
    42f8:	3e2e1b00 	0x3e2e1b00
    42fc:	37a10000 	ori	at,sp,0x0
    4300:	8c2b0000 	lw	t3,0(at)
    4304:	08880009 	j	2200024 <_data-0x7ddfffdc>
    4308:	1f000000 	bgtz	t8,430c <_data-0x7fffbcf4>
    430c:	88000994 	lwl	zero,2452(zero)
    4310:	00004427 	0x4427
    4314:	b81f0000 	swr	ra,0(zero)
    4318:	3a880008 	xori	t0,s4,0x8
    431c:	1f00003e 	bgtz	t8,4418 <_data-0x7fffbbe8>
    4320:	8800096c 	lwl	zero,2412(zero)
    4324:	00003c5d 	0x3c5d
    4328:	00098c1f 	0x98c1f
    432c:	003ad588 	0x3ad588
    4330:	e7320000 	swc1	$f18,0(t9)
    4334:	0200000a 	movz	zero,s0,zero
    4338:	00032b03 	sra	a1,v1,0xc
    433c:	00002500 	sll	a0,zero,0x14
    4340:	43520300 	c0	0x1520300
    4344:	53330000 	beql	t9,s3,4348 <_data-0x7fffbcb8>
    4348:	02000012 	0x2000012
    434c:	00435203 	0x435203
    4350:	04130000 	bgezall	zero,4354 <_data-0x7fffbcac>
    4354:	00000025 	move	zero,zero
    4358:	00169b10 	0x169b10
    435c:	436c0300 	c0	0x16c0300
    4360:	61110000 	0x61110000
    4364:	b96e0100 	swr	t6,256(t3)
    4368:	00000016 	0x16
    436c:	00048422 	0x48422
    4370:	22350100 	addi	s5,s1,256
    4374:	10000016 	b	43d0 <_data-0x7fffbc30>
    4378:	70880003 	0x70880003
    437c:	01000000 	0x1000000
    4380:	0043f29c 	0x43f29c
    4384:	00761700 	0x761700
    4388:	00253501 	0x253501
    438c:	37b90000 	ori	t9,sp,0x0
    4390:	3c340000 	0x3c340000
    4394:	2c880003 	sltiu	t0,a0,3
    4398:	cd000000 	pref	0x0,0(t0)
    439c:	27000043 	addiu	zero,t8,67
    43a0:	39010069 	xori	at,t0,0x69
    43a4:	00003c56 	0x3c56
    43a8:	000037e5 	0x37e5
    43ac:	0003402b 	sltu	t0,zero,v1
    43b0:	00002088 	0x2088
    43b4:	00632700 	0x632700
    43b8:	16b93b01 	bne	s5,t9,12fc0 <_data-0x7ffed040>
    43bc:	37f90000 	ori	t9,ra,0x0
    43c0:	601f0000 	0x601f0000
    43c4:	f2880003 	0xf2880003
    43c8:	00000043 	sra	zero,zero,0x1
    43cc:	03303100 	0x3303100
    43d0:	43f28800 	c0	0x1f28800
    43d4:	43e10000 	c0	0x1e10000
    43d8:	011d0000 	0x11d0000
    43dc:	30080254 	andi	t0,zero,0x254
    43e0:	03381e00 	0x3381e00
    43e4:	43f28800 	c0	0x1f28800
    43e8:	011d0000 	0x11d0000
    43ec:	78080254 	0x78080254
    43f0:	cf220000 	pref	0x2,0(t9)
    43f4:	01000014 	0x1000014
    43f8:	000ba613 	0xba613
    43fc:	00025000 	sll	t2,v0,0x0
    4400:	00002888 	0x2888
    4404:	279c0100 	addiu	gp,gp,256
    4408:	35000044 	ori	zero,t0,0x44
    440c:	13010063 	beq	t8,at,459c <_data-0x7fffba64>
    4410:	000016b9 	0x16b9
    4414:	84365401 	lh	s6,21505(at)
    4418:	01000010 	0x1000010
    441c:	003fb715 	0x3fb715
    4420:	80808000 	lb	zero,-32768(a0)
    4424:	37007a98 	ori	zero,t8,0x7a98
    4428:	000038c9 	0x38c9
    442c:	88000278 	lwl	zero,632(zero)
    4430:	00000038 	0x38
    4434:	454f9c01 	0x454f9c01
    4438:	1b380000 	0x1b380000
    443c:	06000039 	bltz	s0,4524 <_data-0x7fffbadc>
    4440:	004830f2 	tlt	v0,t0,0xc3
    4444:	6d280000 	0x6d280000
    4448:	80000025 	lb	zero,37(zero)
    444c:	00880002 	0x880002
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
    4478:	88000288 	lwl	zero,648(zero)
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
    44a4:	30880002 	andi	t0,a0,0x2
    44a8:	01000000 	0x1000000
    44ac:	00452c6a 	0x452c6a
    44b0:	20ea3900 	addi	t2,a3,14592
    44b4:	39000000 	xori	zero,t0,0x0
    44b8:	000020e5 	0x20e5
    44bc:	20d9390a 	addi	t9,a2,14602
    44c0:	1a210000 	0x1a210000
    44c4:	000022a1 	0x22a1
    44c8:	88000298 	lwl	zero,664(zero)
    44cc:	00000048 	0x48
    44d0:	451b6a01 	bc1tl	$fcc6,1ecd8 <_data-0x7ffe1328>
    44d4:	c6390000 	lwc1	$f25,0(s1)
    44d8:	00000022 	neg	zero,zero
    44dc:	0022ba39 	0x22ba39
    44e0:	582a0a00 	0x582a0a00
    44e4:	a4000043 	sh	zero,67(zero)
    44e8:	0c880002 	jal	2200008 <_data-0x7ddffff8>
    44ec:	01000000 	0x1000000
    44f0:	00450b6a 	0x450b6a
    44f4:	43623900 	c0	0x1623900
    44f8:	1c000000 	bgtz	zero,44fc <_data-0x7fffbb04>
    44fc:	880002b0 	lwl	zero,688(zero)
    4500:	000043f2 	tlt	zero,zero,0x10f
    4504:	0154011d 	0x154011d
    4508:	1e000030 	bgtz	s0,45cc <_data-0x7fffba34>
    450c:	880002a0 	lwl	zero,672(zero)
    4510:	000043f2 	tlt	zero,zero,0x10f
    4514:	0154011d 	0x154011d
    4518:	1e00003a 	bgtz	s0,4604 <_data-0x7fffb9fc>
    451c:	88000298 	lwl	zero,664(zero)
    4520:	000043f2 	tlt	zero,zero,0x10f
    4524:	0254011d 	0x254011d
    4528:	00002108 	0x2108
    452c:	0002901e 	0x2901e
    4530:	0043f288 	0x43f288
    4534:	54011d00 	bnel	zero,at,b938 <_data-0x7fff46c8>
    4538:	004b0802 	0x4b0802
    453c:	02881e00 	0x2881e00
    4540:	43f28800 	c0	0x1f28800
    4544:	011d0000 	0x11d0000
    4548:	4f080254 	c3	0x1080254
    454c:	37000000 	ori	zero,t8,0x0
    4550:	00002628 	0x2628
    4554:	880002b0 	lwl	zero,688(zero)
    4558:	00000060 	0x60
    455c:	481c9c01 	0x481c9c01
    4560:	ac380000 	sw	t8,0(at)
    4564:	06000026 	bltz	s0,4600 <_data-0x7fffba00>
    4568:	00481cf2 	tlt	v0,t0,0x73
    456c:	cd280000 	pref	0x8,0(t1)
    4570:	b8000022 	swr	zero,34(zero)
    4574:	60880002 	0x60880002
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
    45bc:	02c00000 	0x2c00000
    45c0:	00788800 	0x788800
    45c4:	6a010000 	0x6a010000
    45c8:	0000480a 	movz	t1,zero,zero
    45cc:	00215c39 	0x215c39
    45d0:	57390000 	bnel	t9,t9,45d4 <_data-0x7fffba2c>
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
    4608:	90880002 	lbu	t0,2(a0)
    460c:	01000000 	0x1000000
    4610:	0047f96a 	0x47f96a
    4614:	1fc03900 	bgtz	s8,12a18 <_data-0x7ffed5e8>
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
    4648:	02d00000 	0x2d00000
    464c:	00a88800 	0xa88800
    4650:	6a010000 	0x6a010000
    4654:	000047e8 	0x47e8
    4658:	001e6e39 	0x1e6e39
    465c:	69390000 	0x69390000
    4660:	2000001e 	addi	zero,zero,30
    4664:	001e6439 	0x1e6439
    4668:	5f397400 	0x5f397400
    466c:	6100001e 	0x6100001e
    4670:	001e5a39 	0x1e5a39
    4674:	55392000 	bnel	t1,t9,c678 <_data-0x7fff3988>
    4678:	7200001e 	0x7200001e
    467c:	001e4939 	0x1e4939
    4680:	e31a6f00 	sc	k0,28416(t8)
    4684:	d800001c 	ldc2	$0,28(zero)
    4688:	c0880002 	ll	t0,2(a0)
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
    46bc:	02e00000 	0x2e00000
    46c0:	00d88800 	0xd88800
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
    46f0:	f0880002 	0xf0880002
    46f4:	01000000 	0x1000000
    46f8:	0047b56a 	0x47b56a
    46fc:	229a3900 	addi	k0,s4,14592
    4700:	39000000 	xori	zero,t0,0x0
    4704:	00002295 	0x2295
    4708:	22903920 	addi	s0,s4,14624
    470c:	39740000 	xori	s4,t3,0x0
    4710:	00002284 	0x2284
    4714:	20bb1a61 	addi	k1,a1,6753
    4718:	02f00000 	0x2f00000
    471c:	01088800 	0x1088800
    4720:	6a010000 	0x6a010000
    4724:	000047a4 	0x47a4
    4728:	0020ea39 	0x20ea39
    472c:	e5390000 	swc1	$f25,0(t1)
    4730:	20000020 	addi	zero,zero,32
    4734:	0020d939 	0x20d939
    4738:	a11a7400 	sb	k0,29696(t0)
    473c:	f8000022 	sdc2	$0,34(zero)
    4740:	20880002 	addi	t0,a0,2
    4744:	01000001 	movf	zero,t0,$fcc0
    4748:	0047936a 	0x47936a
    474c:	22c63900 	addi	a2,s6,14592
    4750:	39000000 	xori	zero,t0,0x0
    4754:	000022ba 	0x22ba
    4758:	43582a20 	wait	0x560a8
    475c:	03040000 	0x3040000
    4760:	000c8800 	sll	s1,t4,0x0
    4764:	6a010000 	0x6a010000
    4768:	00004782 	srl	t0,zero,0x1e
    476c:	00436239 	0x436239
    4770:	101c0000 	beq	zero,gp,4774 <_data-0x7fffb88c>
    4774:	f2880003 	0xf2880003
    4778:	1d000043 	bgtz	t0,4888 <_data-0x7fffb778>
    477c:	30015401 	andi	at,zero,0x5401
    4780:	001e0000 	sll	zero,s8,0x0
    4784:	f2880003 	0xf2880003
    4788:	1d000043 	bgtz	t0,4898 <_data-0x7fffb768>
    478c:	08025401 	j	95004 <_data-0x7ff6affc>
    4790:	1e000020 	bgtz	s0,4814 <_data-0x7fffb7ec>
    4794:	880002f8 	lwl	zero,760(zero)
    4798:	000043f2 	tlt	zero,zero,0x10f
    479c:	0254011d 	0x254011d
    47a0:	00007408 	0x7408
    47a4:	0002f01e 	0x2f01e
    47a8:	0043f288 	0x43f288
    47ac:	54011d00 	bnel	zero,at,bbb0 <_data-0x7fff4450>
    47b0:	00610802 	0x610802
    47b4:	02e81e00 	0x2e81e00
    47b8:	43f28800 	c0	0x1f28800
    47bc:	011d0000 	0x11d0000
    47c0:	20080254 	addi	t0,zero,596
    47c4:	e01e0000 	sc	s8,0(zero)
    47c8:	f2880002 	0xf2880002
    47cc:	1d000043 	bgtz	t0,48dc <_data-0x7fffb724>
    47d0:	08025401 	j	95004 <_data-0x7ff6affc>
    47d4:	1e000072 	bgtz	s0,49a0 <_data-0x7fffb660>
    47d8:	880002d8 	lwl	zero,728(zero)
    47dc:	000043f2 	tlt	zero,zero,0x10f
    47e0:	0254011d 	0x254011d
    47e4:	00006f08 	0x6f08
    47e8:	0002d01e 	0x2d01e
    47ec:	0043f288 	0x43f288
    47f0:	54011d00 	bnel	zero,at,bbf4 <_data-0x7fff440c>
    47f4:	00720802 	0x720802
    47f8:	02c81e00 	0x2c81e00
    47fc:	43f28800 	c0	0x1f28800
    4800:	011d0000 	0x11d0000
    4804:	72080254 	0x72080254
    4808:	c01e0000 	ll	s8,0(zero)
    480c:	f2880002 	0xf2880002
    4810:	1d000043 	bgtz	t0,4920 <_data-0x7fffb6e0>
    4814:	08025401 	j	95004 <_data-0x7ff6affc>
    4818:	00000045 	0x45
    481c:	0a9e0c3a 	j	a7830e8 <_data-0x7587cf18>
    4820:	6f727245 	0x6f727245
    4824:	74612072 	jalx	18481c8 <_data-0x7e7b7e38>
    4828:	043a0020 	0x43a0020
    482c:	000a029e 	0xa029e
    4830:	059e073a 	0x59e073a
    4834:	0a214b4f 	j	8852d3c <_data-0x777ad2c4>
    4838:	9e1c3a00 	0x9e1c3a00
    483c:	7365541a 	0x7365541a
    4840:	676e6974 	0x676e6974
    4844:	6d656d20 	0x6d656d20
    4848:	2079726f 	addi	t9,v1,29295
    484c:	73207962 	0x73207962
    4850:	74726f68 	jalx	1c9bda0 <_data-0x7e364260>
    4854:	00000a21 	0xa21
    4858:	00000022 	neg	zero,zero
    485c:	02e70002 	0x2e70002
    4860:	01040000 	0x1040000
    4864:	0000028a 	0x28a
    4868:	88000000 	lwl	zero,0(zero)
    486c:	88000250 	lwl	zero,592(zero)
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
    489c:	1c000000 	bgtz	zero,48a0 <_data-0x7fffb760>
    48a0:	02000003 	0x2000003
    48a4:	06bc0704 	0x6bc0704
    48a8:	04020000 	bltzl	zero,48ac <_data-0x7fffb754>
    48ac:	0006b707 	0x6b707
    48b0:	1bd40300 	0x1bd40300
    48b4:	0f020000 	jal	c080000 <_data-0x73f80000>
    48b8:	00000025 	move	zero,zero
    48bc:	dc060102 	ldc3	$6,258(zero)
    48c0:	0400000e 	bltz	zero,48fc <_data-0x7fffb704>
    48c4:	0000003e 	0x3e
    48c8:	d5060102 	ldc1	$f6,258(t0)
    48cc:	0200000e 	0x200000e
    48d0:	1bb70502 	0x1bb70502
    48d4:	04050000 	0x4050000
    48d8:	746e6905 	jalx	1b9a414 <_data-0x7e465bec>
    48dc:	05040200 	0x5040200
    48e0:	00001bdd 	0x1bdd
    48e4:	001ab403 	sra	s6,k0,0x10
    48e8:	71090300 	0x71090300
    48ec:	02000000 	0x2000000
    48f0:	0ed30801 	jal	b4c2004 <_data-0x74b3dffc>
    48f4:	cb030000 	lwc2	$3,0(t8)
    48f8:	0300001b 	divu	zero,t8,zero
    48fc:	0000830a 	0x830a
    4900:	07020200 	bltzl	t8,5104 <_data-0x7fffaefc>
    4904:	00000729 	0x729
    4908:	001a4203 	sra	t0,k0,0x8
    490c:	660b0400 	0x660b0400
    4910:	03000000 	0x3000000
    4914:	00001e14 	0x1e14
    4918:	00330d04 	0x330d04
    491c:	b0060000 	0xb0060000
    4920:	b0000000 	0xb0000000
    4924:	07000000 	bltz	t8,4928 <_data-0x7fffb6d8>
    4928:	00000025 	move	zero,zero
    492c:	0408001f 	tgei	zero,31
    4930:	00000045 	0x45
    4934:	0019ed09 	0x19ed09
    4938:	a0070500 	sb	a3,1280(zero)
    493c:	05000000 	bltz	t0,4940 <_data-0x7fffb6c0>
    4940:	00150003 	sra	zero,s5,0x0
    4944:	05a40a88 	0x5a40a88
    4948:	0001242a 	0x1242a
    494c:	1aac0b00 	0x1aac0b00
    4950:	2b050000 	slti	a1,t8,0
    4954:	00000124 	0x124
    4958:	1a1a0b00 	0x1a1a0b00
    495c:	2c050000 	sltiu	a1,zero,0
    4960:	00000033 	tltu	zero,zero
    4964:	1a000b10 	blez	s0,75a8 <_data-0x7fff8a58>
    4968:	2d050000 	sltiu	a1,t0,0
    496c:	00000033 	tltu	zero,zero
    4970:	1a7e0b14 	0x1a7e0b14
    4974:	2e050000 	sltiu	a1,s0,0
    4978:	00000033 	tltu	zero,zero
    497c:	19e00b18 	blez	t7,75e0 <_data-0x7fff8a20>
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
    49a8:	07000001 	bltz	t8,49b0 <_data-0x7fffb650>
    49ac:	00000025 	move	zero,zero
    49b0:	33060003 	andi	a2,t8,0x3
    49b4:	44000000 	mfc1	zero,$f0
    49b8:	07000001 	bltz	t8,49c0 <_data-0x7fffb640>
    49bc:	00000025 	move	zero,zero
    49c0:	1403001f 	bne	zero,v1,4a40 <_data-0x7fffb5c0>
    49c4:	0500001c 	bltz	t0,4a38 <_data-0x7fffb5c8>
    49c8:	0000c732 	tlt	zero,zero,0x31c
    49cc:	1a330d00 	0x1a330d00
    49d0:	06010000 	bgez	s0,49d4 <_data-0x7fffb62c>
    49d4:	0000008a 	0x8a
    49d8:	001a5e0d 	break	0x1a,0x178
    49dc:	8a060100 	lwl	a2,256(s0)
    49e0:	0e000000 	jal	8000000 <_data-0x78000000>
    49e4:	00001a99 	0x1a99
    49e8:	0b6c5501 	j	db15404 <_data-0x724eabfc>
    49ec:	00b48800 	0xb48800
    49f0:	9c010000 	0x9c010000
    49f4:	000002a9 	0x2a9
    49f8:	0066740f 	0x66740f
    49fc:	02a95501 	0x2a95501
    4a00:	38170000 	xori	s7,zero,0x0
    4a04:	0a100000 	j	8400000 <_data-0x77c00000>
    4a08:	0100001c 	0x100001c
    4a0c:	0002af55 	0x2af55
    4a10:	00384e00 	0x384e00
    4a14:	0bdc1100 	j	f704400 <_data-0x708fbc00>
    4a18:	00448800 	0x448800
    4a1c:	02320000 	0x2320000
    4a20:	89120000 	lwl	s2,0(t0)
    4a24:	0100001a 	div	zero,t0,zero
    4a28:	0000955b 	0x955b
    4a2c:	00386f00 	0x386f00
    4a30:	70651300 	0x70651300
    4a34:	5c010063 	0x5c010063
    4a38:	00000058 	0x58
    4a3c:	00038c14 	0x38c14
    4a40:	000bdc00 	sll	k1,t3,0x10
    4a44:	00000488 	0x488
    4a48:	e15b0100 	sc	k1,256(t2)
    4a4c:	15000001 	bnez	t0,4a54 <_data-0x7fffb5ac>
    4a50:	88000bdc 	lwl	zero,3036(zero)
    4a54:	00000004 	sllv	zero,zero,zero
    4a58:	00051a16 	0x51a16
    4a5c:	14000000 	bnez	zero,4a60 <_data-0x7fffb5a0>
    4a60:	000003a6 	0x3a6
    4a64:	88000c00 	lwl	zero,3072(zero)
    4a68:	00000004 	sllv	zero,zero,zero
    4a6c:	02045c01 	0x2045c01
    4a70:	00150000 	sll	zero,s5,0x0
    4a74:	0488000c 	tgei	a0,12
    4a78:	16000000 	bnez	s0,4a7c <_data-0x7fffb584>
    4a7c:	000004ff 	0x4ff
    4a80:	10170000 	beq	zero,s7,4a84 <_data-0x7fffb57c>
    4a84:	2288000c 	addi	t0,s4,12
    4a88:	21000005 	addi	zero,t0,5
    4a8c:	18000002 	blez	zero,4a98 <_data-0x7fffb568>
    4a90:	03055401 	0x3055401
    4a94:	88001238 	lwl	zero,4664(zero)
    4a98:	02550118 	0x2550118
    4a9c:	19000080 	blez	t0,4ca0 <_data-0x7fffb360>
    4aa0:	88000c18 	lwl	zero,3096(zero)
    4aa4:	0000052d 	0x52d
    4aa8:	02540118 	0x2540118
    4aac:	00000080 	sll	zero,zero,0x2
    4ab0:	000b9017 	0xb9017
    4ab4:	00053888 	0x53888
    4ab8:	00024900 	sll	t1,v0,0x4
    4abc:	54011800 	bnel	zero,at,aac0 <_data-0x7fff5540>
    4ac0:	10b40305 	beq	a1,s4,56d8 <_data-0x7fffa928>
    4ac4:	17008800 	bnez	t8,fffe6ac8 <_text_end+0x77fe5530>
    4ac8:	88000ba4 	lwl	zero,2980(zero)
    4acc:	00000538 	0x538
    4ad0:	00000260 	0x260
    4ad4:	05540118 	0x5540118
    4ad8:	00121003 	sra	v0,s2,0x0
    4adc:	b0170088 	0xb0170088
    4ae0:	4388000b 	c0	0x188000b
    4ae4:	78000005 	0x78000005
    4ae8:	18000002 	blez	zero,4af4 <_data-0x7fffb50c>
    4aec:	11065401 	beq	t0,a2,19af4 <_data-0x7ffe650c>
    4af0:	f5b7bdad 	sdc1	$f23,-16979(t5)
    4af4:	b817007d 	swr	s7,125(zero)
    4af8:	2888000b 	slti	t0,a0,11
    4afc:	8c000003 	lw	zero,3(zero)
    4b00:	18000002 	blez	zero,4b0c <_data-0x7fffb4f4>
    4b04:	81025401 	lb	v0,21505(t0)
    4b08:	c01a0000 	ll	k0,0(zero)
    4b0c:	b688000b 	0xb688000b
    4b10:	1b000002 	blez	t8,4b1c <_data-0x7fffb4e4>
    4b14:	88000bdc 	lwl	zero,3036(zero)
    4b18:	00000538 	0x538
    4b1c:	05540118 	0x5540118
    4b20:	00127403 	sra	t6,s2,0x10
    4b24:	08000088 	j	220 <_data-0x7ffffde0>
    4b28:	00014404 	0x14404
    4b2c:	02010200 	0x2010200
    4b30:	00001a14 	0x1a14
    4b34:	001a0a1c 	0x1a0a1c
    4b38:	04450100 	0x4450100
    4b3c:	6888000b 	0x6888000b
    4b40:	01000000 	0x1000000
    4b44:	0003289c 	0x3289c
    4b48:	06881d00 	tgei	s4,7424
    4b4c:	691e0000 	0x691e0000
    4b50:	66460100 	0x66460100
    4b54:	82000000 	lb	zero,0(s0)
    4b58:	1d000038 	bgtz	t0,4c3c <_data-0x7fffb3c4>
    4b5c:	000006a0 	0x6a0
    4b60:	001be612 	0x1be612
    4b64:	33470100 	andi	a3,k0,0x100
    4b68:	a1000000 	sb	zero,0(t0)
    4b6c:	12000038 	beqz	s0,4c50 <_data-0x7fffb3b0>
    4b70:	00001a8e 	0x1a8e
    4b74:	00334701 	0x334701
    4b78:	38b40000 	xori	s4,a1,0x0
    4b7c:	bc120000 	cache	0x12,0(zero)
    4b80:	0100001a 	div	zero,t0,zero
    4b84:	00003347 	0x3347
    4b88:	0038c700 	0x38c700
    4b8c:	0b501900 	j	d406400 <_data-0x72bf9c00>
    4b90:	05228800 	bltzl	t1,fffe6b94 <_text_end+0x77fe55fc>
    4b94:	01180000 	0x1180000
    4b98:	00810254 	0x810254
    4b9c:	02550118 	0x2550118
    4ba0:	00007f80 	sll	t7,zero,0x1e
    4ba4:	6e0e0000 	0x6e0e0000
    4ba8:	0100001a 	div	zero,t0,zero
    4bac:	000a6c3e 	0xa6c3e
    4bb0:	00009888 	0x9888
    4bb4:	8c9c0100 	lw	gp,256(a0)
    4bb8:	0f000003 	jal	c00000c <_data-0x73fffff4>
    4bbc:	01006674 	teq	t0,zero,0x199
    4bc0:	0002a93e 	0x2a93e
    4bc4:	0038da00 	0x38da00
    4bc8:	06701f00 	bltzal	s3,c7cc <_data-0x7fff3834>
    4bcc:	03780000 	0x3780000
    4bd0:	691e0000 	0x691e0000
    4bd4:	583f0100 	0x583f0100
    4bd8:	06000000 	bltz	s0,4bdc <_data-0x7fffb424>
    4bdc:	19000039 	blez	t0,4cc4 <_data-0x7fffb33c>
    4be0:	88000ab4 	lwl	zero,2740(zero)
    4be4:	00000522 	0x522
    4be8:	02540118 	0x2540118
    4bec:	01180083 	0x1180083
    4bf0:	7f810255 	0x7f810255
    4bf4:	e4190000 	swc1	$f25,0(zero)
    4bf8:	2288000a 	addi	t0,s4,10
    4bfc:	18000005 	blez	zero,4c14 <_data-0x7fffb3ec>
    4c00:	03055401 	0x3055401
    4c04:	8800119c 	lwl	zero,4508(zero)
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
    4c44:	0009a40b 	0x9a40b
    4c48:	0000c888 	0xc888
    4c4c:	ec9c0100 	swc3	$28,256(a0)
    4c50:	12000004 	beqz	s0,4c64 <_data-0x7fffb39c>
    4c54:	00001b99 	0x1b99
    4c58:	00581801 	movf	v1,v0,$fcc6
    4c5c:	39480000 	xori	t0,t2,0x0
    4c60:	03120000 	0x3120000
    4c64:	0100001c 	0x100001c
    4c68:	00005821 	move	t3,zero
    4c6c:	00396600 	0x396600
    4c70:	09b81a00 	j	6e06800 <_data-0x791f9800>
    4c74:	054e8800 	tnei	t2,-30720
    4c78:	c0170000 	ll	s7,0(zero)
    4c7c:	43880009 	c0	0x1880009
    4c80:	0f000005 	jal	c000014 <_data-0x73ffffec>
    4c84:	18000004 	blez	zero,4c98 <_data-0x7fffb368>
    4c88:	34015401 	li	at,0x5401
    4c8c:	09cc1700 	j	7305c00 <_data-0x78cfa400>
    4c90:	05388800 	0x5388800
    4c94:	04260000 	0x4260000
    4c98:	01180000 	0x1180000
    4c9c:	b4030554 	0xb4030554
    4ca0:	00880010 	0x880010
    4ca4:	0009e817 	0x9e817
    4ca8:	00053888 	0x53888
    4cac:	00043d00 	sll	a3,a0,0x14
    4cb0:	54011800 	bnel	zero,at,acb4 <_data-0x7fff534c>
    4cb4:	10dc0305 	beq	a2,gp,58cc <_data-0x7fffa734>
    4cb8:	17008800 	bnez	t8,fffe6cbc <_text_end+0x77fe5724>
    4cbc:	880009f4 	lwl	zero,2548(zero)
    4cc0:	00000543 	sra	zero,zero,0x15
    4cc4:	00000450 	0x450
    4cc8:	01540118 	0x1540118
    4ccc:	0c170035 	jal	5c00d4 <_data-0x7fa3ff2c>
    4cd0:	2288000a 	addi	t0,s4,10
    4cd4:	73000005 	msubu	t8,zero
    4cd8:	18000004 	blez	zero,4cec <_data-0x7fffb314>
    4cdc:	03055401 	0x3055401
    4ce0:	88001104 	lwl	zero,4356(zero)
    4ce4:	02550118 	0x2550118
    4ce8:	01180081 	0x1180081
    4cec:	00800256 	0x800256
    4cf0:	0a1c1700 	j	8705c00 <_data-0x778fa400>
    4cf4:	05598800 	0x5598800
    4cf8:	04920000 	bltzall	a0,4cfc <_data-0x7fffb304>
    4cfc:	01180000 	0x1180000
    4d00:	00810254 	0x810254
    4d04:	01550118 	0x1550118
    4d08:	56011830 	bnel	s0,at,adcc <_data-0x7fff5234>
    4d0c:	00008002 	srl	s0,zero,0x0
    4d10:	000a2417 	0xa2417
    4d14:	00054388 	0x54388
    4d18:	0004a500 	sll	s4,a0,0x14
    4d1c:	54011800 	bnel	zero,at,ad20 <_data-0x7fff52e0>
    4d20:	1a003601 	blez	s0,12528 <_data-0x7ffedad8>
    4d24:	88000a2c 	lwl	zero,2604(zero)
    4d28:	00000564 	0x564
    4d2c:	000a4017 	0xa4017
    4d30:	00053888 	0x53888
    4d34:	0004c500 	sll	t8,a0,0x14
    4d38:	54011800 	bnel	zero,at,ad3c <_data-0x7fff52c4>
    4d3c:	11400305 	beqz	t2,5954 <_data-0x7fffa6ac>
    4d40:	21008800 	addi	zero,t0,-30720
    4d44:	88000a58 	lwl	zero,2648(zero)
    4d48:	00000543 	sra	zero,zero,0x15
    4d4c:	000004d8 	0x4d8
    4d50:	01540118 	0x1540118
    4d54:	64190037 	0x64190037
    4d58:	2288000a 	addi	t0,s4,10
    4d5c:	18000005 	blez	zero,4d74 <_data-0x7fffb28c>
    4d60:	03055401 	0x3055401
    4d64:	8800115c 	lwl	zero,4444(zero)
    4d68:	a6220000 	sh	v0,0(s1)
    4d6c:	00000003 	sra	zero,zero,0x0
    4d70:	0c000000 	jal	0 <_data-0x80000000>
    4d74:	01000000 	0x1000000
    4d78:	0005079c 	0x5079c
    4d7c:	03b62300 	0x3b62300
    4d80:	52010000 	beql	s0,at,4d84 <_data-0x7fffb27c>
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
    4dbc:	0600001b 	bltz	s0,4e2c <_data-0x7fffb1d4>
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
    4de8:	08000010 	j	40 <_data-0x7fffffc0>
    4dec:	01c2000a 	movz	zero,t6,v0
    4df0:	00040000 	sll	zero,a0,0x0
    4df4:	000004e4 	0x4e4
    4df8:	1ac70104 	0x1ac70104
    4dfc:	320c0000 	andi	t4,s0,0x0
    4e00:	4100001c 	bc0f	4e74 <_data-0x7fffb18c>
    4e04:	6800001c 	0x6800001c
    4e08:	00000007 	srav	zero,zero,zero
    4e0c:	79000000 	0x79000000
    4e10:	02000004 	sllv	zero,zero,s0
    4e14:	07040304 	0x7040304
    4e18:	000006bc 	0x6bc
    4e1c:	b7070403 	0xb7070403
    4e20:	04000006 	bltz	zero,4e3c <_data-0x7fffb1c4>
    4e24:	00001bb0 	tge	zero,zero,0x6e
    4e28:	01850101 	0x1850101
    4e2c:	0c200000 	jal	800000 <_data-0x7f800000>
    4e30:	02248800 	0x2248800
    4e34:	9c010000 	0x9c010000
    4e38:	00000185 	0x185
    4e3c:	746d6605 	jalx	1b59814 <_data-0x7e4a67ec>
    4e40:	8c010100 	lw	at,256(zero)
    4e44:	84000001 	lh	zero,1(zero)
    4e48:	06000039 	bltz	s0,4f30 <_data-0x7fffb0d0>
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
    4e80:	77076091 	jalx	c1d8244 <_data-0x73e27dbc>
    4e84:	85070100 	lh	a3,256(t0)
    4e88:	5f000001 	bgtzl	t8,4e90 <_data-0x7fffb170>
    4e8c:	0900003a 	j	40000e8 <_data-0x7bffff18>
    4e90:	00001c3b 	0x1c3b
    4e94:	0ca41001 	jal	2904004 <_data-0x7d6fbffc>
    4e98:	180a8800 	0x180a8800
    4e9c:	36000007 	ori	zero,s0,0x7
    4ea0:	0b000001 	j	c000004 <_data-0x73fffffc>
    4ea4:	00001c80 	sll	v1,zero,0x12
    4ea8:	01851401 	0x1851401
    4eac:	00c60000 	0xc60000
    4eb0:	00060000 	sll	zero,a2,0x0
    4eb4:	001c200b 	movn	a0,zero,gp
    4eb8:	85190100 	lh	t9,256(t0)
    4ebc:	d7000001 	ldc1	$f0,1(t8)
    4ec0:	06000000 	bltz	s0,4ec4 <_data-0x7fffb13c>
    4ec4:	1c280b00 	0x1c280b00
    4ec8:	1e010000 	0x1e010000
    4ecc:	00000185 	0x185
    4ed0:	000000e8 	0xe8
    4ed4:	100c0006 	beq	zero,t4,4ef0 <_data-0x7fffb110>
    4ed8:	a488000d 	sh	t0,13(a0)
    4edc:	0c000001 	jal	4 <_data-0x7ffffffc>
    4ee0:	88000d6c 	lwl	zero,3436(zero)
    4ee4:	000001af 	0x1af
    4ee8:	000d900c 	syscall	0x3640
    4eec:	0001ba88 	0x1ba88
    4ef0:	0dac0c00 	jal	6b03000 <_data-0x794fd000>
    4ef4:	01ba8800 	0x1ba8800
    4ef8:	c40d0000 	lwc1	$f13,0(zero)
    4efc:	ba88000d 	swr	t0,13(s4)
    4f00:	25000001 	addiu	zero,t0,1
    4f04:	0e000001 	jal	8000004 <_data-0x77fffffc>
    4f08:	83025601 	lb	v0,22017(t8)
    4f0c:	57010e00 	bnel	t8,at,8710 <_data-0x7fff78f0>
    4f10:	0f003001 	jal	c00c004 <_data-0x73ff3ffc>
    4f14:	88000df0 	lwl	zero,3568(zero)
    4f18:	000001a4 	0x1a4
    4f1c:	0254010e 	0x254010e
    4f20:	00002508 	0x2508
    4f24:	0006f810 	0x6f810
    4f28:	1c200b00 	bgtz	at,7b2c <_data-0x7fff84d4>
    4f2c:	19010000 	0x19010000
    4f30:	00000185 	0x185
    4f34:	0000014c 	syscall	0x5
    4f38:	34110006 	li	s1,0x6
    4f3c:	0888000e 	j	2200038 <_data-0x7ddfffc8>
    4f40:	7a000000 	0x7a000000
    4f44:	0b000001 	j	c000004 <_data-0x73fffffc>
    4f48:	00001c20 	0x1c20
    4f4c:	01851901 	0x1851901
    4f50:	016a0000 	0x16a0000
    4f54:	00060000 	sll	zero,a2,0x0
    4f58:	000e3c0f 	0xe3c0f
    4f5c:	0001a488 	0x1a488
    4f60:	54010e00 	bnel	zero,at,8764 <_data-0x7fff789c>
    4f64:	00003d01 	0x3d01
    4f68:	000ce80c 	syscall	0x33a0
    4f6c:	0001a488 	0x1a488
    4f70:	12000000 	beqz	s0,4f74 <_data-0x7fffb08c>
    4f74:	6e690504 	0x6e690504
    4f78:	04130074 	bgezall	zero,514c <_data-0x7fffaeb4>
    4f7c:	00000199 	0x199
    4f80:	dc060103 	ldc3	$6,259(zero)
    4f84:	1400000e 	bnez	zero,4fc0 <_data-0x7fffb040>
    4f88:	00000192 	0x192
    4f8c:	00250413 	0x250413
    4f90:	20150000 	addi	s5,zero,0
    4f94:	2000001c 	addi	zero,zero,28
    4f98:	0100001c 	0x100001c
    4f9c:	1c801519 	bgtz	a0,a404 <_data-0x7fff5bfc>
    4fa0:	1c800000 	bgtz	a0,4fa4 <_data-0x7fffb05c>
    4fa4:	14010000 	bne	zero,at,4fa8 <_data-0x7fffb058>
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
    4fd4:	00052700 	sll	a0,a1,0x1c
    4fd8:	07040200 	0x7040200
    4fdc:	000006bc 	0x6bc
    4fe0:	b7070402 	0xb7070402
    4fe4:	03000006 	srlv	zero,zero,t8
    4fe8:	00001c28 	0x1c28
    4fec:	011d0101 	0x11d0101
    4ff0:	0e440000 	jal	9100000 <_data-0x76f00000>
    4ff4:	00d88800 	0xd88800
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
    5058:	56000001 	bnezl	s0,5060 <_data-0x7fffafa0>
    505c:	0700003c 	bltz	t8,5150 <_data-0x7fffaeb0>
    5060:	00667562 	0x667562
    5064:	012b0501 	0x12b0501
    5068:	91030000 	lbu	v1,0(t0)
    506c:	8a087fa8 	lwl	t0,32680(s0)
    5070:	0100001c 	0x100001c
    5074:	00002c06 	0x2c06
    5078:	003c6900 	0x3c6900
    507c:	0e740900 	jal	9d02400 <_data-0x762fdc00>
    5080:	00108800 	sll	s1,s0,0x0
    5084:	00f80000 	0xf80000
    5088:	200a0000 	addi	t2,zero,0
    508c:	0100001c 	0x100001c
    5090:	00011d0a 	0x11d0a
    5094:	0000e700 	sll	gp,zero,0x1c
    5098:	0c000b00 	jal	2c00 <_data-0x7fffd400>
    509c:	88000e80 	lwl	zero,3712(zero)
    50a0:	00000142 	srl	zero,zero,0x5
    50a4:	0254010d 	break	0x254,0x4
    50a8:	00002d08 	0x2d08
    50ac:	000eec0e 	0xeec0e
    50b0:	00003088 	0x3088
    50b4:	1c200a00 	bgtz	at,78b8 <_data-0x7fff8748>
    50b8:	0a010000 	j	8040000 <_data-0x77fc0000>
    50bc:	0000011d 	0x11d
    50c0:	00000112 	0x112
    50c4:	140f000b 	bne	zero,t7,50f4 <_data-0x7fffaf0c>
    50c8:	4288000f 	c0	0x88000f
    50cc:	00000001 	movf	zero,zero,$fcc0
    50d0:	05041000 	0x5041000
    50d4:	00746e69 	0x746e69
    50d8:	dd050402 	ldc3	$5,1026(t0)
    50dc:	1100001b 	beqz	t0,514c <_data-0x7fffaeb4>
    50e0:	0000013b 	0x13b
    50e4:	0000013b 	0x13b
    50e8:	00002512 	0x2512
    50ec:	02003f00 	0x2003f00
    50f0:	0edc0601 	jal	b701804 <_data-0x748fe7fc>
    50f4:	20130000 	addi	s3,zero,0
    50f8:	2000001c 	addi	zero,zero,28
    50fc:	0100001c 	0x100001c
    5100:	0416000a 	0x416000a
    5104:	00040000 	sll	zero,a0,0x0
    5108:	000006f0 	tge	zero,zero,0x1b
    510c:	1ac70104 	0x1ac70104
    5110:	af0c0000 	sw	t4,0(t8)
    5114:	4100001c 	bc0f	5188 <_data-0x7fffae78>
    5118:	8800001c 	lwl	zero,28(zero)
    511c:	00000007 	srav	zero,zero,zero
    5120:	a1000000 	sb	zero,0(t0)
    5124:	02000005 	0x2000005
    5128:	07040304 	0x7040304
    512c:	000006bc 	0x6bc
    5130:	b7070403 	0xb7070403
    5134:	04000006 	bltz	zero,5150 <_data-0x7fffaeb0>
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
    5160:	54010000 	bnel	zero,at,5164 <_data-0x7fffae9c>
    5164:	01006e07 	0x1006e07
    5168:	00350172 	tlt	at,s5,0x5
    516c:	3c9d0000 	0x3c9d0000
    5170:	00080000 	sll	zero,t0,0x0
    5174:	dd000000 	ldc3	$0,0(t0)
    5178:	09000001 	j	4000004 <_data-0x7bfffffc>
    517c:	74025401 	jalx	95004 <_data-0x7ff6affc>
    5180:	55010900 	bnel	t0,at,7584 <_data-0x7fff8a7c>
    5184:	09007502 	j	401d408 <_data-0x7bfe2bf8>
    5188:	f3035601 	0xf3035601
    518c:	00005501 	0x5501
    5190:	001cbf0a 	0x1cbf0a
    5194:	01660100 	0x1660100
    5198:	000000ef 	0xef
    519c:	00000000 	nop
    51a0:	00000040 	ssnop
    51a4:	00ef9c01 	0xef9c01
    51a8:	76070000 	jalx	81c0000 <_data-0x77e40000>
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
    51e0:	0b540100 	j	d500400 <_data-0x72affc00>
    51e4:	01003273 	tltu	t0,zero,0xc9
    51e8:	00fd0168 	0xfd0168
    51ec:	55010000 	bnel	t0,at,51f0 <_data-0x7fffae10>
    51f0:	05040c00 	0x5040c00
    51f4:	00746e69 	0x746e69
    51f8:	00fc040d 	break	0xfc,0x10
    51fc:	0d0e0000 	jal	4380000 <_data-0x7bc80000>
    5200:	00010a04 	0x10a04
    5204:	06010300 	bgez	s0,5e08 <_data-0x7fffa1f8>
    5208:	00000edc 	0xedc
    520c:	0001030f 	0x1030f
    5210:	1ca10a00 	0x1ca10a00
    5214:	43010000 	c0	0x1010000
    5218:	00002501 	0x2501
    521c:	00000000 	nop
    5220:	00007000 	sll	t6,zero,0x0
    5224:	749c0100 	jalx	2700400 <_data-0x7d8ffc00>
    5228:	07000001 	bltz	t8,5230 <_data-0x7fffadd0>
    522c:	00747364 	0x747364
    5230:	25014301 	addiu	at,t0,17153
    5234:	2e000000 	sltiu	zero,s0,0
    5238:	0700003d 	bltz	t8,5330 <_data-0x7fffacd0>
    523c:	00637273 	tltu	v1,v1,0x1c9
    5240:	f6014301 	sdc1	$f1,17153(s0)
    5244:	4c000000 	mfc3	zero,$0
    5248:	0700003d 	bltz	t8,5340 <_data-0x7fffacc0>
    524c:	4301006e 	c0	0x101006e
    5250:	00003501 	0x3501
    5254:	003d8600 	0x3d8600
    5258:	00731000 	0x731000
    525c:	fd014701 	sdc3	$1,18177(t0)
    5260:	0a000000 	j	8000000 <_data-0x78000000>
    5264:	1000003e 	b	5360 <_data-0x7fffaca0>
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
    52cc:	55010000 	bnel	t0,at,52d0 <_data-0x7fffad30>
    52d0:	01006410 	0x1006410
    52d4:	01740131 	tgeu	t3,s4,0x4
    52d8:	3f110000 	0x3f110000
    52dc:	0a000000 	j	8000000 <_data-0x78000000>
    52e0:	00001a67 	0x1a67
    52e4:	25011101 	addiu	at,t0,4353
    52e8:	1c000000 	bgtz	zero,52ec <_data-0x7fffad14>
    52ec:	2488000f 	addiu	t0,a0,15
    52f0:	01000000 	0x1000000
    52f4:	00022e9c 	0x22e9c
    52f8:	00730700 	0x730700
    52fc:	25011101 	addiu	at,t0,4353
    5300:	2f000000 	sltiu	zero,t8,0
    5304:	0600003f 	bltz	s0,5404 <_data-0x7fffabfc>
    5308:	11010063 	beq	t0,at,5498 <_data-0x7fffab68>
    530c:	00010301 	0x10301
    5310:	07550100 	0x7550100
    5314:	1101006e 	beq	t0,at,54d0 <_data-0x7fffab30>
    5318:	00003501 	0x3501
    531c:	003f4d00 	0x3f4d00
    5320:	00701000 	0x701000
    5324:	74011501 	jalx	45404 <_data-0x7ffbabfc>
    5328:	97000001 	lhu	zero,1(t8)
    532c:	0000003f 	0x3f
    5330:	001d0111 	0x1d0111
    5334:	74a30100 	jalx	28c0400 <_data-0x7d73fc00>
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
    5378:	12000002 	beqz	s0,5384 <_data-0x7fffac7c>
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
    53b8:	1200003f 	beqz	s0,54b8 <_data-0x7fffab48>
    53bc:	01003273 	tltu	t0,zero,0xc9
    53c0:	0000fd7f 	0xfd7f
    53c4:	00401a00 	0x401a00
    53c8:	006e1200 	0x6e1200
    53cc:	00357f01 	0x357f01
    53d0:	40380000 	0x40380000
    53d4:	11000000 	beqz	t0,53d8 <_data-0x7fffac28>
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
    5410:	4d010000 	bc3t	5414 <_data-0x7fffabec>
    5414:	00000174 	teq	zero,zero,0x5
    5418:	00000000 	nop
    541c:	00000034 	teq	zero,zero
    5420:	035f9c01 	0x35f9c01
    5424:	64120000 	0x64120000
    5428:	01007473 	tltu	t0,zero,0x1d1
    542c:	0001744d 	break	0x1,0x1d1
    5430:	0040b300 	0x40b300
    5434:	72731200 	0x72731200
    5438:	4d010063 	bc3t	55c8 <_data-0x7fffaa38>
    543c:	000000fd 	0xfd
    5440:	000040d1 	0x40d1
    5444:	6e656c12 	0x6e656c12
    5448:	354d0100 	ori	t5,t2,0x100
    544c:	ef000000 	swc3	$0,0(t8)
    5450:	14000040 	bnez	zero,5554 <_data-0x7fffaaac>
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
    54bc:	12000003 	beqz	s0,54cc <_data-0x7fffab34>
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
    54ec:	0c010000 	jal	40000 <_data-0x7ffc0000>
    54f0:	00000035 	0x35
    54f4:	00000000 	nop
    54f8:	00000020 	add	zero,zero,zero
    54fc:	73129c01 	0x73129c01
    5500:	fd0c0100 	sdc3	$12,256(t0)
    5504:	00000000 	nop
    5508:	14000042 	bnez	zero,5614 <_data-0x7fffa9ec>
    550c:	00746e63 	0x746e63
    5510:	00350d01 	0x350d01
    5514:	421e0000 	c0	0x1e0000
    5518:	00000000 	nop
    551c:	0000014c 	syscall	0x5
    5520:	08320004 	j	c80010 <_data-0x7f37fff0>
    5524:	01040000 	0x1040000
    5528:	00001ac7 	0x1ac7
    552c:	001d090c 	syscall	0x7424
    5530:	001c4100 	sll	t0,gp,0x4
    5534:	00081000 	sll	v0,t0,0x0
    5538:	00000000 	nop
    553c:	00071e00 	sll	v1,a3,0x18
    5540:	07040200 	0x7040200
    5544:	000006bc 	0x6bc
    5548:	b7070402 	0xb7070402
    554c:	03000006 	srlv	zero,zero,t8
    5550:	00001bef 	0x1bef
    5554:	00a20e01 	0xa20e01
    5558:	0fa00000 	jal	e800000 <_data-0x71800000>
    555c:	00308800 	0x308800
    5560:	9c010000 	0x9c010000
    5564:	000000a2 	0xa2
    5568:	01007304 	0x1007304
    556c:	0000a90e 	0xa90e
    5570:	00423d00 	0x423d00
    5574:	1c200500 	bgtz	at,6978 <_data-0x7fff9688>
    5578:	07010000 	bgez	t8,557c <_data-0x7fffaa84>
    557c:	000000a2 	0xa2
    5580:	0000006a 	0x6a
    5584:	b0070006 	0xb0070006
    5588:	bb88000f 	swr	t0,15(gp)
    558c:	7f000000 	0x7f000000
    5590:	08000000 	j	0 <_data-0x80000000>
    5594:	f3035401 	0xf3035401
    5598:	07005401 	bltz	t8,1a5a0 <_data-0x7ffe5a60>
    559c:	88000fb8 	lwl	zero,4024(zero)
    55a0:	00000144 	0x144
    55a4:	00000092 	0x92
    55a8:	01540108 	0x1540108
    55ac:	c009003d 	ll	t1,61(zero)
    55b0:	4488000f 	0x4488000f
    55b4:	08000001 	j	4 <_data-0x7ffffffc>
    55b8:	3a015401 	xori	at,s0,0x5401
    55bc:	040a0000 	tlti	zero,0
    55c0:	746e6905 	jalx	1b9a414 <_data-0x7e465bec>
    55c4:	b6040b00 	0xb6040b00
    55c8:	02000000 	0x2000000
    55cc:	0edc0601 	jal	b701804 <_data-0x748fe7fc>
    55d0:	af0c0000 	sw	t4,0(t8)
    55d4:	03000000 	0x3000000
    55d8:	00001c80 	sll	v1,zero,0x12
    55dc:	00a20101 	0xa20101
    55e0:	0f400000 	jal	d000000 <_data-0x73000000>
    55e4:	00608800 	0x608800
    55e8:	9c010000 	0x9c010000
    55ec:	00000144 	0x144
    55f0:	01007304 	0x1007304
    55f4:	0000a901 	0xa901
    55f8:	00425e00 	0x425e00
    55fc:	00630d00 	0x630d00
    5600:	00af0301 	0xaf0301
    5604:	42870000 	c0	0x870000
    5608:	f80e0000 	sdc2	$14,0(zero)
    560c:	05000007 	bltz	t0,562c <_data-0x7fffa9d4>
    5610:	00001c20 	0x1c20
    5614:	00a20701 	0xa20701
    5618:	01040000 	0x1040000
    561c:	00060000 	sll	zero,a2,0x0
    5620:	000f880f 	0xf880f
    5624:	00000888 	0x888
    5628:	00013200 	sll	a2,at,0x8
    562c:	1c200500 	bgtz	at,6a30 <_data-0x7fff95d0>
    5630:	07010000 	bgez	t8,5634 <_data-0x7fffa9cc>
    5634:	000000a2 	0xa2
    5638:	00000122 	0x122
    563c:	90090006 	lbu	t1,6(zero)
    5640:	4488000f 	0x4488000f
    5644:	08000001 	j	4 <_data-0x7ffffffc>
    5648:	3d015401 	0x3d015401
    564c:	98090000 	lwr	t1,0(zero)
    5650:	4488000f 	0x4488000f
    5654:	08000001 	j	4 <_data-0x7ffffffc>
    5658:	80025401 	lb	v0,21505(zero)
    565c:	00000000 	nop
    5660:	001c2010 	0x1c2010
    5664:	001c2000 	sll	a0,gp,0x0
    5668:	00070100 	sll	zero,a3,0x4
    566c:	000000b2 	tlt	zero,zero,0x2
    5670:	09050004 	j	4140010 <_data-0x7bebfff0>
    5674:	01040000 	0x1040000
    5678:	00001ac7 	0x1ac7
    567c:	001d1d0c 	syscall	0x7474
    5680:	001c4100 	sll	t0,gp,0x4
    5684:	00082800 	sll	a1,t0,0x0
    5688:	00000000 	nop
    568c:	00077100 	sll	t6,a3,0x4
    5690:	07040200 	0x7040200
    5694:	000006bc 	0x6bc
    5698:	b7070402 	0xb7070402
    569c:	02000006 	srlv	zero,zero,s0
    56a0:	0ed50601 	jal	b541804 <_data-0x74abe7fc>
    56a4:	02020000 	0x2020000
    56a8:	001bb705 	0x1bb705
    56ac:	05040300 	0x5040300
    56b0:	00746e69 	0x746e69
    56b4:	dd050402 	ldc3	$5,1026(t0)
    56b8:	0400001b 	bltz	zero,5728 <_data-0x7fffa8d8>
    56bc:	00001ab4 	teq	zero,zero,0x6a
    56c0:	005a0902 	0x5a0902
    56c4:	01020000 	0x1020000
    56c8:	000ed308 	0xed308
    56cc:	07020200 	bltzl	t8,5ed0 <_data-0x7fffa130>
    56d0:	00000729 	0x729
    56d4:	001a4204 	0x1a4204
    56d8:	4f0b0300 	c3	0x10b0300
    56dc:	05000000 	bltz	t0,56e0 <_data-0x7fffa920>
    56e0:	00001c20 	0x1c20
    56e4:	00410301 	0x410301
    56e8:	0fd00000 	jal	f400000 <_data-0x70c00000>
    56ec:	002c8800 	0x2c8800
    56f0:	9c010000 	0x9c010000
    56f4:	000000aa 	0xaa
    56f8:	01006306 	0x1006306
    56fc:	00004103 	sra	t0,zero,0x4
    5700:	0042a500 	0x42a500
    5704:	0fe80700 	jal	fa01c00 <_data-0x705fe400>
    5708:	00aa8800 	0xaa8800
    570c:	01080000 	0x1080000
    5710:	00800254 	0x800254
    5714:	10090000 	beq	zero,t1,5718 <_data-0x7fffa8e8>
    5718:	1000001d 	b	5790 <_data-0x7fffa870>
    571c:	0300001d 	0x300001d
    5720:	0b3b0046 	j	cec0118 <_data-0x7313fee8>
    5724:	00040000 	sll	zero,a0,0x0
    5728:	0000098f 	0x98f
    572c:	13610104 	beq	k1,at,5b40 <_data-0x7fffa4c0>
    5730:	58040000 	0x58040000
    5734:	4100001e 	bc0f	57b0 <_data-0x7fffa850>
    5738:	5000001c 	beqzl	zero,57ac <_data-0x7fffa854>
    573c:	00000008 	jr	zero
    5740:	ce000000 	pref	0x0,0(s0)
    5744:	02000007 	srav	zero,zero,s0
    5748:	07040304 	0x7040304
    574c:	000006bc 	0x6bc
    5750:	00002704 	0x2704
    5754:	07040300 	0x7040300
    5758:	000006b7 	0x6b7
    575c:	00003304 	0x3304
    5760:	1bd40500 	0x1bd40500
    5764:	0f020000 	jal	c080000 <_data-0x73f80000>
    5768:	00000027 	nor	zero,zero,zero
    576c:	d5060103 	ldc1	$f6,259(t0)
    5770:	0300000e 	0x300000e
    5774:	1bb70502 	0x1bb70502
    5778:	04060000 	0x4060000
    577c:	746e6905 	jalx	1b9a414 <_data-0x7e465bec>
    5780:	05040300 	0x5040300
    5784:	00001bdd 	0x1bdd
    5788:	001ab405 	0x1ab405
    578c:	71090300 	0x71090300
    5790:	03000000 	0x3000000
    5794:	0ed30801 	jal	b4c2004 <_data-0x74b3dffc>
    5798:	71040000 	madd	t0,a0
    579c:	05000000 	bltz	t0,57a0 <_data-0x7fffa860>
    57a0:	00001bcb 	0x1bcb
    57a4:	00880a03 	0x880a03
    57a8:	02030000 	0x2030000
    57ac:	00072907 	0x72907
    57b0:	00880400 	0x880400
    57b4:	7c050000 	0x7c050000
    57b8:	0300001d 	0x300001d
    57bc:	0000330c 	syscall	0xcc
    57c0:	1a420500 	0x1a420500
    57c4:	0b040000 	j	c100000 <_data-0x73f00000>
    57c8:	00000066 	0x66
    57cc:	001ee205 	0x1ee205
    57d0:	7d0c0400 	0x7d0c0400
    57d4:	05000000 	bltz	t0,57d8 <_data-0x7fffa828>
    57d8:	00001e14 	0x1e14
    57dc:	003f0d04 	0x3f0d04
    57e0:	13050000 	beq	t8,a1,57e4 <_data-0x7fffa81c>
    57e4:	0400001e 	bltz	zero,5860 <_data-0x7fffa7a0>
    57e8:	0000940e 	0x940e
    57ec:	1dc50700 	0x1dc50700
    57f0:	0a010000 	j	8040000 <_data-0x77fc0000>
    57f4:	00001da5 	0x1da5
    57f8:	00010401 	0x10401
    57fc:	00540800 	0x540800
    5800:	00000033 	tltu	zero,zero
    5804:	0019e809 	0x19e809
    5808:	250a0100 	addiu	t2,t0,256
    580c:	09000000 	j	4000000 <_data-0x7c000000>
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
    5840:	09000000 	j	4000000 <_data-0x7c000000>
    5844:	000019e8 	0x19e8
    5848:	00250a01 	0x250a01
    584c:	5d090000 	0x5d090000
    5850:	0100001d 	0x100001d
    5854:	0000270a 	0x270a
    5858:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    585c:	0b010072 	j	c0401c8 <_data-0x73fbfe38>
    5860:	00000143 	sra	zero,zero,0x5
    5864:	2e040b00 	sltiu	a0,s0,2816
    5868:	07000000 	bltz	t8,586c <_data-0x7fffa794>
    586c:	00001e2a 	0x1e2a
    5870:	1e930a01 	0x1e930a01
    5874:	82010000 	lb	at,0(s0)
    5878:	08000001 	j	4 <_data-0x7ffffffc>
    587c:	00880054 	0x880054
    5880:	e8090000 	swc2	$9,0(zero)
    5884:	01000019 	multu	t0,zero
    5888:	0000250a 	0x250a
    588c:	1d5d0900 	0x1d5d0900
    5890:	0a010000 	j	8040000 <_data-0x77fc0000>
    5894:	00000088 	0x88
    5898:	7274700a 	0x7274700a
    589c:	820b0100 	lb	t3,256(s0)
    58a0:	00000001 	movf	zero,zero,$fcc0
    58a4:	008f040b 	0x8f040b
    58a8:	85070000 	lh	a3,0(t0)
    58ac:	0100001d 	0x100001d
    58b0:	001e6f0a 	0x1e6f0a
    58b4:	01c10100 	0x1c10100
    58b8:	54080000 	bnel	zero,t0,58bc <_data-0x7fffa744>
    58bc:	00007100 	sll	t6,zero,0x4
    58c0:	19e80900 	0x19e80900
    58c4:	0a010000 	j	8040000 <_data-0x77fc0000>
    58c8:	00000025 	move	zero,zero
    58cc:	001d5d09 	0x1d5d09
    58d0:	710a0100 	0x710a0100
    58d4:	0a000000 	j	8000000 <_data-0x78000000>
    58d8:	00727470 	tge	v1,s2,0x1d1
    58dc:	01c10b01 	0x1c10b01
    58e0:	0b000000 	j	c000000 <_data-0x74000000>
    58e4:	00007804 	sllv	t7,zero,zero
    58e8:	1dea0c00 	0x1dea0c00
    58ec:	04010000 	b	58f0 <_data-0x7fffa710>
    58f0:	00001d6d 	0x1d6d
    58f4:	00000033 	tltu	zero,zero
    58f8:	0001f901 	0x1f901
    58fc:	00540800 	0x540800
    5900:	00000033 	tltu	zero,zero
    5904:	0019e809 	0x19e809
    5908:	25040100 	addiu	a0,t0,256
    590c:	0a000000 	j	8000000 <_data-0x78000000>
    5910:	00727470 	tge	v1,s2,0x1d1
    5914:	01040501 	0x1040501
    5918:	0c000000 	jal	0 <_data-0x80000000>
    591c:	00001e80 	sll	v1,zero,0x1a
    5920:	1ea40401 	0x1ea40401
    5924:	00270000 	0x270000
    5928:	2b010000 	slti	at,t8,0
    592c:	08000002 	j	8 <_data-0x7ffffff8>
    5930:	00270054 	0x270054
    5934:	e8090000 	swc2	$9,0(zero)
    5938:	01000019 	multu	t0,zero
    593c:	00002504 	0x2504
    5940:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    5944:	05010072 	bgez	t0,5b10 <_data-0x7fffa4f0>
    5948:	00000143 	sra	zero,zero,0x5
    594c:	1ec90c00 	0x1ec90c00
    5950:	04010000 	b	5954 <_data-0x7fffa6ac>
    5954:	00001db6 	tne	zero,zero,0x76
    5958:	00000088 	0x88
    595c:	00025d01 	0x25d01
    5960:	00540800 	0x540800
    5964:	00000088 	0x88
    5968:	0019e809 	0x19e809
    596c:	25040100 	addiu	a0,t0,256
    5970:	0a000000 	j	8000000 <_data-0x78000000>
    5974:	00727470 	tge	v1,s2,0x1d1
    5978:	01820501 	0x1820501
    597c:	0c000000 	jal	0 <_data-0x80000000>
    5980:	00001e44 	0x1e44
    5984:	1e1b0401 	0x1e1b0401
    5988:	00710000 	0x710000
    598c:	8f010000 	lw	at,0(t8)
    5990:	08000002 	j	8 <_data-0x7ffffff8>
    5994:	00710054 	0x710054
    5998:	e8090000 	swc2	$9,0(zero)
    599c:	01000019 	multu	t0,zero
    59a0:	00002504 	0x2504
    59a4:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    59a8:	05010072 	bgez	t0,5b74 <_data-0x7fffa48c>
    59ac:	000001c1 	0x1c1
    59b0:	1d440d00 	0x1d440d00
    59b4:	4a010000 	c2	0x10000
    59b8:	000000b5 	0xb5
    59bc:	00000000 	nop
    59c0:	00000014 	0x14
    59c4:	02ef9c01 	0x2ef9c01
    59c8:	380e0000 	xori	t6,zero,0x0
    59cc:	00000009 	jalr	zero,zero
    59d0:	0c000000 	jal	0 <_data-0x80000000>
    59d4:	01000000 	0x1000000
    59d8:	09480f4b 	j	5203d2c <_data-0x7adfc2d4>
    59dc:	42ce0000 	c0	0xce0000
    59e0:	f90e0000 	sdc2	$14,0(t0)
    59e4:	00000001 	movf	zero,zero,$fcc0
    59e8:	0c000000 	jal	0 <_data-0x80000000>
    59ec:	01000000 	0x1000000
    59f0:	02140f1c 	0x2140f1c
    59f4:	42ce0000 	c0	0xce0000
    59f8:	00100000 	sll	zero,s0,0x0
    59fc:	0c000000 	jal	0 <_data-0x80000000>
    5a00:	11000000 	beqz	t0,5a04 <_data-0x7fffa5fc>
    5a04:	0000021f 	0x21f
    5a08:	ffc3e0a0 	sdc3	$3,-8032(s8)
    5a0c:	0000007b 	0x7b
    5a10:	1ba21200 	0x1ba21200
    5a14:	46010000 	add.s	$f0,$f0,$f1
    5a18:	88001068 	lwl	zero,4200(zero)
    5a1c:	00000014 	0x14
    5a20:	036a9c01 	0x36a9c01
    5a24:	5d130000 	0x5d130000
    5a28:	0100001d 	0x100001d
    5a2c:	0000b546 	0xb546
    5a30:	0e540100 	jal	9500400 <_data-0x76affc00>
    5a34:	0000087e 	0x87e
    5a38:	88001068 	lwl	zero,4200(zero)
    5a3c:	0000000c 	syscall
    5a40:	950f4701 	lhu	t7,18177(t0)
    5a44:	e6000008 	swc1	$f0,8(s0)
    5a48:	0f000042 	jal	c000108 <_data-0x73fffef8>
    5a4c:	0000088a 	0x88a
    5a50:	000042f9 	0x42f9
    5a54:	00010a0e 	0x10a0e
    5a58:	00106800 	sll	t5,s0,0x0
    5a5c:	00000c88 	0xc88
    5a60:	0f1d0100 	jal	c740400 <_data-0x738bfc00>
    5a64:	0000012c 	0x12c
    5a68:	000042e6 	0x42e6
    5a6c:	0001210f 	0x1210f
    5a70:	0042f900 	0x42f900
    5a74:	10681000 	beq	v1,t0,9a78 <_data-0x7fff6588>
    5a78:	000c8800 	sll	s1,t4,0x0
    5a7c:	37110000 	ori	s1,t8,0x0
    5a80:	90000001 	lbu	zero,1(zero)
    5a84:	7bffc3e0 	0x7bffc3e0
    5a88:	00000000 	nop
    5a8c:	001a3812 	0x1a3812
    5a90:	54420100 	bnel	v0,v0,5e94 <_data-0x7fffa16c>
    5a94:	14880010 	bne	a0,t0,5ad8 <_data-0x7fffa528>
    5a98:	01000000 	0x1000000
    5a9c:	0003e59c 	0x3e59c
    5aa0:	1d5d1300 	0x1d5d1300
    5aa4:	42010000 	c0	0x10000
    5aa8:	000000aa 	0xaa
    5aac:	a10e5401 	sb	t6,21505(t0)
    5ab0:	54000008 	bnezl	zero,5ad4 <_data-0x7fffa52c>
    5ab4:	0c880010 	jal	2200040 <_data-0x7ddfffc0>
    5ab8:	01000000 	0x1000000
    5abc:	08b80f43 	j	2e03d0c <_data-0x7d1fc2f4>
    5ac0:	43110000 	c0	0x1110000
    5ac4:	ad0f0000 	sw	t7,0(t0)
    5ac8:	24000008 	li	zero,8
    5acc:	0e000043 	jal	800010c <_data-0x77fffef4>
    5ad0:	00000149 	0x149
    5ad4:	88001054 	lwl	zero,4180(zero)
    5ad8:	0000000c 	syscall
    5adc:	6b0f1d01 	0x6b0f1d01
    5ae0:	11000001 	beqz	t0,5ae8 <_data-0x7fffa518>
    5ae4:	0f000043 	jal	c00010c <_data-0x73fffef4>
    5ae8:	00000160 	0x160
    5aec:	00004324 	0x4324
    5af0:	00105410 	0x105410
    5af4:	00000c88 	0xc88
    5af8:	01761100 	0x1761100
    5afc:	e0800000 	sc	zero,0(a0)
    5b00:	007bffc3 	0x7bffc3
    5b04:	0d000000 	jal	4000000 <_data-0x7c000000>
    5b08:	00001e02 	srl	v1,zero,0x18
    5b0c:	00b53901 	0xb53901
    5b10:	00000000 	nop
    5b14:	00480000 	0x480000
    5b18:	9c010000 	0x9c010000
    5b1c:	00000432 	tlt	zero,zero,0x10
    5b20:	001ec414 	0x1ec414
    5b24:	b53a0100 	0xb53a0100
    5b28:	3c000000 	lui	zero,0x0
    5b2c:	15000043 	bnez	t0,5c3c <_data-0x7fffa3c4>
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
    5b5c:	20880010 	addi	t0,a0,16
    5b60:	01000000 	0x1000000
    5b64:	0004ef9c 	0x4ef9c
    5b68:	1d5d1300 	0x1d5d1300
    5b6c:	34010000 	li	at,0x0
    5b70:	0000009f 	0x9f
    5b74:	a1165401 	sb	s6,21505(t0)
    5b78:	34000009 	li	zero,0x9
    5b7c:	08880010 	j	2200040 <_data-0x7ddfffc0>
    5b80:	01000000 	0x1000000
    5b84:	00049635 	0x49635
    5b88:	09b11700 	j	6c45c00 <_data-0x793ba400>
    5b8c:	5d0e0000 	0x5d0e0000
    5b90:	34000002 	li	zero,0x2
    5b94:	08880010 	j	2200040 <_data-0x7ddfffc0>
    5b98:	01000000 	0x1000000
    5b9c:	0278171c 	0x278171c
    5ba0:	34100000 	li	s0,0x0
    5ba4:	08880010 	j	2200040 <_data-0x7ddfffc0>
    5ba8:	11000000 	beqz	t0,5bac <_data-0x7fffa454>
    5bac:	00000283 	sra	zero,zero,0xa
    5bb0:	fec0e094 	sdc3	$0,-8044(s6)
    5bb4:	0000007b 	0x7b
    5bb8:	0008c40e 	0x8c40e
    5bbc:	00104800 	sll	t1,s0,0x0
    5bc0:	00000488 	0x488
    5bc4:	0f360100 	jal	cd80400 <_data-0x7327fc00>
    5bc8:	000008db 	0x8db
    5bcc:	00004398 	0x4398
    5bd0:	0008d00f 	0x8d00f
    5bd4:	0043ab00 	0x43ab00
    5bd8:	01880e00 	0x1880e00
    5bdc:	10480000 	beq	v0,t0,5be0 <_data-0x7fffa420>
    5be0:	00048800 	sll	s1,a0,0x0
    5be4:	1d010000 	0x1d010000
    5be8:	0001aa0f 	0x1aa0f
    5bec:	00439800 	0x439800
    5bf0:	019f0f00 	0x19f0f00
    5bf4:	43ab0000 	c0	0x1ab0000
    5bf8:	48100000 	mfc2	s0,$0
    5bfc:	04880010 	tgei	a0,16
    5c00:	11000000 	beqz	t0,5c04 <_data-0x7fffa3fc>
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
    5c30:	08000000 	j	0 <_data-0x80000000>
    5c34:	01000000 	0x1000000
    5c38:	00054a30 	tge	zero,a1,0x128
    5c3c:	09b11700 	j	6c45c00 <_data-0x793ba400>
    5c40:	5d0e0000 	0x5d0e0000
    5c44:	00000002 	srl	zero,zero,0x0
    5c48:	08000000 	j	0 <_data-0x80000000>
    5c4c:	01000000 	0x1000000
    5c50:	0278171c 	0x278171c
    5c54:	00100000 	sll	zero,s0,0x0
    5c58:	08000000 	j	0 <_data-0x80000000>
    5c5c:	11000000 	beqz	t0,5c60 <_data-0x7fffa3a0>
    5c60:	00000283 	sra	zero,zero,0xa
    5c64:	fec0e094 	sdc3	$0,-8044(s6)
    5c68:	0000007b 	0x7b
    5c6c:	0009a10e 	0x9a10e
    5c70:	00000000 	nop
    5c74:	00000400 	sll	zero,zero,0x10
    5c78:	17310100 	bne	t9,s1,607c <_data-0x7fff9f84>
    5c7c:	000009b1 	tgeu	zero,zero,0x26
    5c80:	00025d0e 	0x25d0e
    5c84:	00000000 	nop
    5c88:	00000400 	sll	zero,zero,0x10
    5c8c:	171c0100 	bne	t8,gp,6090 <_data-0x7fff9f70>
    5c90:	00000278 	0x278
    5c94:	00000010 	mfhi	zero
    5c98:	00000400 	sll	zero,zero,0x10
    5c9c:	02831100 	0x2831100
    5ca0:	e0800000 	sc	zero,0(a0)
    5ca4:	007bfec0 	0x7bfec0
    5ca8:	12000000 	beqz	s0,5cac <_data-0x7fffa354>
    5cac:	00001a52 	0x1a52
    5cb0:	0ffc1f01 	jal	ff07c04 <_data-0x700f83fc>
    5cb4:	00388800 	0x388800
    5cb8:	9c010000 	0x9c010000
    5cbc:	0000081b 	0x81b
    5cc0:	0008c416 	0x8c416
    5cc4:	000ffc00 	sll	ra,t7,0x10
    5cc8:	00000c88 	0xc88
    5ccc:	fa210100 	sdc2	$1,256(s1)
    5cd0:	0f000005 	jal	c000014 <_data-0x73ffffec>
    5cd4:	000008db 	0x8db
    5cd8:	000043c3 	sra	t0,zero,0xf
    5cdc:	0008d00f 	0x8d00f
    5ce0:	0043d800 	0x43d800
    5ce4:	01880e00 	0x1880e00
    5ce8:	0ffc0000 	jal	ff00000 <_data-0x70100000>
    5cec:	000c8800 	sll	s1,t4,0x0
    5cf0:	1d010000 	0x1d010000
    5cf4:	0001aa0f 	0x1aa0f
    5cf8:	0043c300 	0x43c300
    5cfc:	019f0f00 	0x19f0f00
    5d00:	43d80000 	c0	0x1d80000
    5d04:	fc100000 	sdc3	$16,0(zero)
    5d08:	0c88000f 	jal	220003c <_data-0x7ddfffc4>
    5d0c:	11000000 	beqz	t0,5d10 <_data-0x7fffa2f0>
    5d10:	000001b5 	0x1b5
    5d14:	fec0e088 	sdc3	$0,-8056(s6)
    5d18:	0000007b 	0x7b
    5d1c:	0008c416 	0x8c416
    5d20:	00100800 	sll	at,s0,0x0
    5d24:	00000888 	0x888
    5d28:	56230100 	bnel	s1,v1,612c <_data-0x7fff9ed4>
    5d2c:	0f000006 	jal	c000018 <_data-0x73ffffe8>
    5d30:	000008db 	0x8db
    5d34:	000043f0 	tge	zero,zero,0x10f
    5d38:	0008d00f 	0x8d00f
    5d3c:	00440500 	0x440500
    5d40:	01880e00 	0x1880e00
    5d44:	10080000 	beq	zero,t0,5d48 <_data-0x7fffa2b8>
    5d48:	00088800 	sll	s1,t0,0x0
    5d4c:	1d010000 	0x1d010000
    5d50:	0001aa0f 	0x1aa0f
    5d54:	0043f000 	0x43f000
    5d58:	019f0f00 	0x19f0f00
    5d5c:	44050000 	mfc1	a1,$f0
    5d60:	08100000 	j	400000 <_data-0x7fc00000>
    5d64:	08880010 	j	2200040 <_data-0x7ddfffc0>
    5d68:	11000000 	beqz	t0,5d6c <_data-0x7fffa294>
    5d6c:	000001b5 	0x1b5
    5d70:	fec0e08c 	sdc3	$0,-8052(s6)
    5d74:	0000007b 	0x7b
    5d78:	0008c416 	0x8c416
    5d7c:	00101000 	sll	v0,s0,0x0
    5d80:	00000888 	0x888
    5d84:	b2250100 	0xb2250100
    5d88:	0f000006 	jal	c000018 <_data-0x73ffffe8>
    5d8c:	000008db 	0x8db
    5d90:	0000441d 	0x441d
    5d94:	0008d00f 	0x8d00f
    5d98:	00443200 	0x443200
    5d9c:	01880e00 	0x1880e00
    5da0:	10100000 	beq	zero,s0,5da4 <_data-0x7fffa25c>
    5da4:	00088800 	sll	s1,t0,0x0
    5da8:	1d010000 	0x1d010000
    5dac:	0001aa0f 	0x1aa0f
    5db0:	00441d00 	0x441d00
    5db4:	019f0f00 	0x19f0f00
    5db8:	44320000 	0x44320000
    5dbc:	10100000 	beq	zero,s0,5dc0 <_data-0x7fffa240>
    5dc0:	08880010 	j	2200040 <_data-0x7ddfffc0>
    5dc4:	11000000 	beqz	t0,5dc8 <_data-0x7fffa238>
    5dc8:	000001b5 	0x1b5
    5dcc:	fec0e080 	sdc3	$0,-8064(s6)
    5dd0:	0000007b 	0x7b
    5dd4:	0008c418 	0x8c418
    5dd8:	00101800 	sll	v1,s0,0x0
    5ddc:	00083888 	0x83888
    5de0:	0a280100 	j	8a00400 <_data-0x775ffc00>
    5de4:	0f000007 	jal	c00001c <_data-0x73ffffe4>
    5de8:	000008db 	0x8db
    5dec:	0000444a 	0x444a
    5df0:	0008d00f 	0x8d00f
    5df4:	00445e00 	0x445e00
    5df8:	01881900 	0x1881900
    5dfc:	10180000 	beq	zero,t8,5e00 <_data-0x7fffa200>
    5e00:	08388800 	j	e22000 <_data-0x7f1de000>
    5e04:	1d010000 	0x1d010000
    5e08:	0001aa0f 	0x1aa0f
    5e0c:	00444a00 	0x444a00
    5e10:	019f0f00 	0x19f0f00
    5e14:	445e0000 	cfc1	s8,c1_fir
    5e18:	381a0000 	xori	k0,zero,0x0
    5e1c:	11000008 	beqz	t0,5e40 <_data-0x7fffa1c0>
    5e20:	000001b5 	0x1b5
    5e24:	fec0e08c 	sdc3	$0,-8052(s6)
    5e28:	0000007b 	0x7b
    5e2c:	0008c416 	0x8c416
    5e30:	00101c00 	sll	v1,s0,0x10
    5e34:	00000488 	0x488
    5e38:	66260100 	0x66260100
    5e3c:	0f000007 	jal	c00001c <_data-0x73ffffe4>
    5e40:	000008db 	0x8db
    5e44:	00004476 	tne	zero,zero,0x111
    5e48:	0008d00f 	0x8d00f
    5e4c:	00448a00 	0x448a00
    5e50:	01880e00 	0x1880e00
    5e54:	101c0000 	beq	zero,gp,5e58 <_data-0x7fffa1a8>
    5e58:	00048800 	sll	s1,a0,0x0
    5e5c:	1d010000 	0x1d010000
    5e60:	0001aa0f 	0x1aa0f
    5e64:	00447600 	0x447600
    5e68:	019f0f00 	0x19f0f00
    5e6c:	448a0000 	mtc1	t2,$f0
    5e70:	1c100000 	0x1c100000
    5e74:	04880010 	tgei	a0,16
    5e78:	11000000 	beqz	t0,5e7c <_data-0x7fffa184>
    5e7c:	000001b5 	0x1b5
    5e80:	fec0e084 	sdc3	$0,-8060(s6)
    5e84:	0000007b 	0x7b
    5e88:	0008c416 	0x8c416
    5e8c:	00102400 	sll	a0,s0,0x10
    5e90:	00000488 	0x488
    5e94:	c22a0100 	ll	t2,256(s1)
    5e98:	0f000007 	jal	c00001c <_data-0x73ffffe4>
    5e9c:	000008db 	0x8db
    5ea0:	000044a2 	0x44a2
    5ea4:	0008d00f 	0x8d00f
    5ea8:	0044b600 	0x44b600
    5eac:	01880e00 	0x1880e00
    5eb0:	10240000 	beq	at,a0,5eb4 <_data-0x7fffa14c>
    5eb4:	00048800 	sll	s1,a0,0x0
    5eb8:	1d010000 	0x1d010000
    5ebc:	0001aa0f 	0x1aa0f
    5ec0:	0044a200 	0x44a200
    5ec4:	019f0f00 	0x19f0f00
    5ec8:	44b60000 	0x44b60000
    5ecc:	24100000 	li	s0,0
    5ed0:	04880010 	tgei	a0,16
    5ed4:	11000000 	beqz	t0,5ed8 <_data-0x7fffa128>
    5ed8:	000001b5 	0x1b5
    5edc:	fec0e090 	sdc3	$0,-8048(s6)
    5ee0:	0000007b 	0x7b
    5ee4:	0008c40e 	0x8c40e
    5ee8:	00102800 	sll	a1,s0,0x0
    5eec:	00000488 	0x488
    5ef0:	0f2c0100 	jal	cb00400 <_data-0x734ffc00>
    5ef4:	000008db 	0x8db
    5ef8:	000044ce 	0x44ce
    5efc:	0008d00f 	0x8d00f
    5f00:	0044e200 	0x44e200
    5f04:	01880e00 	0x1880e00
    5f08:	10280000 	beq	at,t0,5f0c <_data-0x7fffa0f4>
    5f0c:	00048800 	sll	s1,a0,0x0
    5f10:	1d010000 	0x1d010000
    5f14:	0001aa0f 	0x1aa0f
    5f18:	0044ce00 	0x44ce00
    5f1c:	019f0f00 	0x19f0f00
    5f20:	44e20000 	0x44e20000
    5f24:	28100000 	slti	s0,zero,0
    5f28:	04880010 	tgei	a0,16
    5f2c:	11000000 	beqz	t0,5f30 <_data-0x7fffa0d0>
    5f30:	000001b5 	0x1b5
    5f34:	fec0e084 	sdc3	$0,-8060(s6)
    5f38:	0000007b 	0x7b
    5f3c:	1dde1200 	0x1dde1200
    5f40:	1d010000 	0x1d010000
    5f44:	00000000 	nop
    5f48:	0000000c 	syscall
    5f4c:	087e9c01 	j	1fa7004 <_data-0x7e058ffc>
    5f50:	e8130000 	swc2	$19,0(zero)
    5f54:	01000019 	multu	t0,zero
    5f58:	0000251d 	0x251d
    5f5c:	13540100 	beq	k0,s4,6360 <_data-0x7fff9ca0>
    5f60:	00001d5d 	0x1d5d
    5f64:	00c01d01 	0xc01d01
    5f68:	55010000 	bnel	t0,at,5f6c <_data-0x7fffa094>
    5f6c:	0000cb0e 	0xcb0e
    5f70:	00000000 	nop
    5f74:	00000400 	sll	zero,zero,0x10
    5f78:	0f1d0100 	jal	c740400 <_data-0x738bfc00>
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
    5fb4:	09000000 	j	4000000 <_data-0x7c000000>
    5fb8:	00001d5d 	0x1d5d
    5fbc:	00b51d01 	0xb51d01
    5fc0:	1c000000 	bgtz	zero,5fc4 <_data-0x7fffa03c>
    5fc4:	00001d27 	0x1d27
    5fc8:	c4011d01 	lwc1	$f1,7425(zero)
    5fcc:	09000008 	j	4000020 <_data-0x7bffffe0>
    5fd0:	000019e8 	0x19e8
    5fd4:	00251d01 	0x251d01
    5fd8:	5d090000 	0x5d090000
    5fdc:	0100001d 	0x100001d
    5fe0:	0000aa1d 	0xaa1d
    5fe4:	621c0000 	0x621c0000
    5fe8:	0100001d 	0x100001d
    5fec:	08e7011d 	j	39c0474 <_data-0x7c63fb8c>
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
    601c:	09389c01 	j	4e27004 <_data-0x7b1d8ffc>
    6020:	e8130000 	swc2	$19,0(zero)
    6024:	01000019 	multu	t0,zero
    6028:	0000251c 	0x251c
    602c:	0e540100 	jal	9500400 <_data-0x76affc00>
    6030:	000001c7 	0x1c7
    6034:	00000000 	nop
    6038:	00000004 	sllv	zero,zero,zero
    603c:	e20f1c01 	sc	t7,7169(s0)
    6040:	20000001 	addi	zero,zero,1
    6044:	10000045 	b	615c <_data-0x7fff9ea4>
    6048:	00000000 	nop
    604c:	00000004 	sllv	zero,zero,zero
    6050:	0001ed1b 	0x1ed1b
    6054:	00540100 	0x540100
    6058:	bf1d0000 	cache	0x1d,0(t8)
    605c:	0100001e 	0x100001e
    6060:	0000b51c 	0xb51c
    6064:	09540100 	j	5500400 <_data-0x7aaffc00>
    6068:	e8090000 	swc2	$9,0(zero)
    606c:	01000019 	multu	t0,zero
    6070:	0000251c 	0x251c
    6074:	9a0d0000 	lwr	t5,0(s0)
    6078:	0100001d 	0x100001d
    607c:	0000aa1c 	0xaa1c
    6080:	00000000 	nop
    6084:	00000c00 	sll	at,zero,0x10
    6088:	a19c0100 	sb	gp,256(t4)
    608c:	13000009 	beqz	t8,60b4 <_data-0x7fff9f4c>
    6090:	000019e8 	0x19e8
    6094:	00251c01 	0x251c01
    6098:	54010000 	bnel	zero,at,609c <_data-0x7fff9f64>
    609c:	00022b0e 	0x22b0e
    60a0:	00000000 	nop
    60a4:	00000400 	sll	zero,zero,0x10
    60a8:	171c0100 	bne	t8,gp,64ac <_data-0x7fff9b54>
    60ac:	00000246 	0x246
    60b0:	00000010 	mfhi	zero
    60b4:	00000400 	sll	zero,zero,0x10
    60b8:	02511b00 	0x2511b00
    60bc:	54010000 	bnel	zero,at,60c0 <_data-0x7fff9f40>
    60c0:	1d000000 	bgtz	t0,60c4 <_data-0x7fff9f3c>
    60c4:	00001eea 	0x1eea
    60c8:	009f1c01 	0x9f1c01
    60cc:	bd010000 	cache	0x1,0(t0)
    60d0:	09000009 	j	4000024 <_data-0x7bffffdc>
    60d4:	000019e8 	0x19e8
    60d8:	00251c01 	0x251c01
    60dc:	1e000000 	bgtz	s0,60e0 <_data-0x7fff9f20>
    60e0:	000009a1 	0x9a1
    60e4:	00000000 	nop
    60e8:	0000000c 	syscall
    60ec:	09fe9c01 	j	7fa7004 <_data-0x78058ffc>
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
    6130:	1f00000a 	bgtz	t8,615c <_data-0x7fff9ea4>
    6134:	00000948 	0x948
    6138:	f90e5401 	sdc2	$14,21505(t0)
    613c:	00000001 	movf	zero,zero,$fcc0
    6140:	04000000 	bltz	zero,6144 <_data-0x7fff9ebc>
    6144:	01000000 	0x1000000
    6148:	02140f1c 	0x2140f1c
    614c:	45330000 	0x45330000
    6150:	00100000 	sll	zero,s0,0x0
    6154:	04000000 	bltz	zero,6158 <_data-0x7fff9ea8>
    6158:	1b000000 	blez	t8,615c <_data-0x7fff9ea4>
    615c:	0000021f 	0x21f
    6160:	00005401 	0x5401
    6164:	08c41e00 	j	3107800 <_data-0x7cef8800>
    6168:	00000000 	nop
    616c:	000c0000 	sll	zero,t4,0x0
    6170:	9c010000 	0x9c010000
    6174:	00000a98 	0xa98
    6178:	0008d01f 	0x8d01f
    617c:	1f540100 	0x1f540100
    6180:	000008db 	0x8db
    6184:	880e5501 	lwl	t6,21761(zero)
    6188:	00000001 	movf	zero,zero,$fcc0
    618c:	04000000 	bltz	zero,6190 <_data-0x7fff9e70>
    6190:	01000000 	0x1000000
    6194:	01aa0f1d 	0x1aa0f1d
    6198:	45460000 	0x45460000
    619c:	9f0f0000 	0x9f0f0000
    61a0:	59000001 	blezl	t0,61a8 <_data-0x7fff9e58>
    61a4:	10000045 	b	62bc <_data-0x7fff9d44>
    61a8:	00000000 	nop
    61ac:	00000004 	sllv	zero,zero,zero
    61b0:	0001b51b 	0x1b51b
    61b4:	00540100 	0x540100
    61b8:	a11e0000 	sb	s8,0(t0)
    61bc:	00000008 	jr	zero
    61c0:	0c000000 	jal	0 <_data-0x80000000>
    61c4:	01000000 	0x1000000
    61c8:	000aed9c 	0xaed9c
    61cc:	08ad1f00 	j	2b47c00 <_data-0x7d4b8400>
    61d0:	54010000 	bnel	zero,at,61d4 <_data-0x7fff9e2c>
    61d4:	0008b81f 	0x8b81f
    61d8:	0e550100 	jal	9540400 <_data-0x76abfc00>
    61dc:	00000149 	0x149
    61e0:	00000000 	nop
    61e4:	00000004 	sllv	zero,zero,zero
    61e8:	6b0f1d01 	0x6b0f1d01
    61ec:	6c000001 	0x6c000001
    61f0:	0f000045 	jal	c000114 <_data-0x73fffeec>
    61f4:	00000160 	0x160
    61f8:	0000457f 	0x457f
    61fc:	00000010 	mfhi	zero
    6200:	00000400 	sll	zero,zero,0x10
    6204:	01761b00 	0x1761b00
    6208:	54010000 	bnel	zero,at,620c <_data-0x7fff9df4>
    620c:	20000000 	addi	zero,zero,0
    6210:	0000087e 	0x87e
    6214:	00000000 	nop
    6218:	0000000c 	syscall
    621c:	8a1f9c01 	lwl	ra,-25599(s0)
    6220:	01000008 	jr	t0
    6224:	08951f54 	j	2547d50 <_data-0x7dab82b0>
    6228:	55010000 	bnel	t0,at,622c <_data-0x7fff9dd4>
    622c:	00010a0e 	0x10a0e
    6230:	00000000 	nop
    6234:	00000400 	sll	zero,zero,0x10
    6238:	0f1d0100 	jal	c740400 <_data-0x738bfc00>
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
  1c:	35030000 	ori	v1,t0,0x0
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	00134900 	sll	t1,s3,0x4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	01390400 	0x1390400
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	13010b3b 	beq	t8,at,2d1c <_data-0x7fffd2e4>
  30:	13050000 	beq	t8,a1,34 <_data-0x7fffffcc>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	0b0e0301 	j	c380c04 <_data-0x73c7f3fc>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	3b0b3a0b 	xori	t3,t8,0x3a0b
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	0013010b 	0x13010b
  40:	82870600 	lb	a3,1536(s4)
  44:	08030101 	j	c0404 <_data-0x7ff3fbfc>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
  4c:	30070000 	andi	a3,zero,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	1c134900 	0x1c134900
  54:	0800000a 	j	28 <_data-0x7fffffd8>
  58:	193f012e 	0x193f012e
  5c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	0e6e0b3b 	jal	9b82cec <_data-0x7647d314>
  64:	1301193c 	beq	t8,at,6558 <_data-0x7fff9aa8>
  68:	87090000 	lh	t1,0(t8)
  6c:	03010182 	0x3010182
  70:	0013010e 	0x13010e
  74:	002f0a00 	0x2f0a00
  78:	00001349 	0x1349
  7c:	4900050b 	bc2f	14ac <_data-0x7fffeb54>
  80:	0c000013 	jal	4c <_data-0x7fffffb4>
  84:	08030030 	j	c00c0 <_data-0x7ff3ff40>
  88:	0a1c1349 	j	8704d24 <_data-0x778fb2dc>
  8c:	870d0000 	lh	t5,0(t8)
  90:	03010182 	0x3010182
  94:	3b0b3a08 	xori	t3,t8,0x3a08
  98:	0013010b 	0x13010b
  9c:	012e0e00 	0x12e0e00
  a0:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
  a4:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
  a8:	193c0e6e 	0x193c0e6e
  ac:	260f0000 	addiu	t7,s0,0
  b0:	00134900 	sll	t1,s3,0x4
  b4:	012e1000 	0x12e1000
  b8:	0b201347 	j	c804d1c <_data-0x737fb2e4>
  bc:	00001301 	0x1301
  c0:	03000511 	0x3000511
  c4:	3b0b3a08 	xori	t3,t8,0x3a08
  c8:	0013490b 	0x13490b
  cc:	82881200 	lb	t0,4608(s4)
  d0:	0b3a0101 	j	ce80404 <_data-0x7317fbfc>
  d4:	00000b3b 	0xb3b
  d8:	0b001013 	j	c00404c <_data-0x73ffbfb4>
  dc:	0013490b 	0x13490b
  e0:	01011400 	0x1011400
  e4:	13011349 	beq	t8,at,4e0c <_data-0x7fffb1f4>
  e8:	21150000 	addi	s5,t0,0
  ec:	2f134900 	sltiu	s3,t8,18688
  f0:	1600000b 	bnez	s0,120 <_data-0x7ffffee0>
  f4:	1347012e 	beq	k0,a3,5b0 <_data-0x7ffffa50>
  f8:	06120111 	bltzall	s0,540 <_data-0x7ffffac0>
  fc:	42971840 	c0	0x971840
 100:	00130119 	0x130119
 104:	00051700 	sll	v0,a1,0x1c
 108:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 10c:	13490b3b 	beq	k0,t1,2dfc <_data-0x7fffd204>
 110:	00001702 	srl	v0,zero,0x1c
 114:	01828818 	0x1828818
 118:	3b0b3a01 	xori	t3,t8,0x3a01
 11c:	0013010b 	0x13010b
 120:	00051900 	sll	v1,a1,0x4
 124:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 128:	13490b3b 	beq	k0,t1,2e18 <_data-0x7fffd1e8>
 12c:	00001702 	srl	v0,zero,0x1c
 130:	31011d1a 	andi	at,t0,0x1d1a
 134:	55015213 	bnel	t0,at,14984 <_data-0x7ffeb67c>
 138:	590b5817 	0x590b5817
 13c:	0013010b 	0x13010b
 140:	00051b00 	sll	v1,a1,0xc
 144:	17021331 	bne	t8,v0,4e0c <_data-0x7fffb1f4>
 148:	891c0000 	lwl	gp,0(t0)
 14c:	11010182 	beq	t0,at,758 <_data-0x7ffff8a8>
 150:	19429501 	0x19429501
 154:	00001331 	tgeu	zero,zero,0x4c
 158:	01828a1d 	0x1828a1d
 15c:	91180200 	lbu	t8,512(t0)
 160:	00001842 	srl	v1,zero,0x1
 164:	0182891e 	0x182891e
 168:	31011101 	andi	at,t0,0x1101
 16c:	1f000013 	bgtz	t8,1bc <_data-0x7ffffe44>
 170:	00018289 	0x18289
 174:	13310111 	beq	t9,s1,5bc <_data-0x7ffffa44>
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
 1a0:	110e6e0b 	beq	t0,t6,1b9d0 <_data-0x7ffe4630>
 1a4:	40061201 	0x40061201
 1a8:	19429718 	0x19429718
 1ac:	00001301 	0x1301
 1b0:	03002f23 	0x3002f23
 1b4:	0013490e 	0x13490e
 1b8:	00342400 	0x342400
 1bc:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 1c0:	13490b3b 	beq	k0,t1,2eb0 <_data-0x7fffd150>
 1c4:	00001702 	srl	v0,zero,0x1c
 1c8:	03003425 	0x3003425
 1cc:	3b0b3a08 	xori	t3,t8,0x3a08
 1d0:	1c13490b 	0x1c13490b
 1d4:	2600000d 	addiu	zero,s0,13
 1d8:	1755010b 	bne	k0,s5,608 <_data-0x7ffff9f8>
 1dc:	00001301 	0x1301
 1e0:	03003427 	0x3003427
 1e4:	3b0b3a08 	xori	t3,t8,0x3a08
 1e8:	0213490b 	0x213490b
 1ec:	28000017 	slti	zero,zero,23
 1f0:	1331011d 	beq	t9,s1,668 <_data-0x7ffff998>
 1f4:	17550152 	bne	k0,s5,740 <_data-0x7ffff8c0>
 1f8:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 1fc:	0b290000 	j	ca40000 <_data-0x735c0000>
 200:	00175501 	0x175501
 204:	011d2a00 	0x11d2a00
 208:	01111331 	tgeu	t0,s1,0x4c
 20c:	0b580612 	j	d601848 <_data-0x729fe7b8>
 210:	13010b59 	beq	t8,at,2f78 <_data-0x7fffd088>
 214:	0b2b0000 	j	cac0000 <_data-0x73540000>
 218:	12011101 	beq	s0,at,4620 <_data-0x7fffb9e0>
 21c:	2c000006 	sltiu	zero,zero,6
 220:	0b0b000f 	j	c2c003c <_data-0x73d3ffc4>
 224:	00001349 	0x1349
 228:	0b00242d 	j	c0090b4 <_data-0x73ff6f4c>
 22c:	030b3e0b 	0x30b3e0b
 230:	2e000008 	sltiu	zero,s0,8
 234:	13310005 	beq	t9,s1,24c <_data-0x7ffffdb4>
 238:	2e2f0000 	sltiu	t7,s1,0
 23c:	03193f01 	0x3193f01
 240:	3b0b3a0e 	xori	t3,t8,0x3a0e
 244:	1113490b 	beq	t0,s3,12674 <_data-0x7ffed98c>
 248:	40061201 	0x40061201
 24c:	19429718 	0x19429718
 250:	00001301 	0x1301
 254:	31011d30 	andi	at,t0,0x1d30
 258:	12011113 	beq	s0,at,46a8 <_data-0x7fffb958>
 25c:	590b5806 	0x590b5806
 260:	3100000b 	andi	zero,t0,0xb
 264:	01018289 	0x1018289
 268:	13310111 	beq	t9,s1,6b0 <_data-0x7ffff950>
 26c:	00001301 	0x1301
 270:	3f012e32 	0x3f012e32
 274:	3a0e0319 	xori	t6,s0,0x319
 278:	6e0b3b0b 	0x6e0b3b0b
 27c:	2013490e 	addi	s3,zero,18702
 280:	0013010b 	0x13010b
 284:	00053300 	sll	a2,a1,0xc
 288:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 28c:	13490b3b 	beq	k0,t1,2f7c <_data-0x7fffd084>
 290:	0b340000 	j	cd00000 <_data-0x73300000>
 294:	12011101 	beq	s0,at,469c <_data-0x7fffb964>
 298:	00130106 	0x130106
 29c:	00053500 	sll	a2,a1,0x14
 2a0:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 2a4:	13490b3b 	beq	k0,t1,2f94 <_data-0x7fffd06c>
 2a8:	00001802 	srl	v1,zero,0x0
 2ac:	03003436 	tne	t8,zero,0xd0
 2b0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 2b4:	1c13490b 	0x1c13490b
 2b8:	3700000d 	ori	zero,t8,0xd
 2bc:	1331012e 	beq	t9,s1,778 <_data-0x7ffff888>
 2c0:	06120111 	bltzall	s0,708 <_data-0x7ffff8f8>
 2c4:	42971840 	c0	0x971840
 2c8:	00130119 	0x130119
 2cc:	00053800 	sll	a3,a1,0x0
 2d0:	18021331 	0x18021331
 2d4:	05390000 	0x5390000
 2d8:	1c133100 	0x1c133100
 2dc:	3a00000b 	xori	zero,s0,0xb
 2e0:	18020036 	0x18020036
 2e4:	01000000 	0x1000000
 2e8:	06100011 	bltzal	s0,330 <_data-0x7ffffcd0>
 2ec:	01120111 	0x1120111
 2f0:	0e1b0e03 	jal	86c380c <_data-0x7793c7f4>
 2f4:	05130e25 	bgezall	t0,3b8c <_data-0x7fffc474>
 2f8:	01000000 	0x1000000
 2fc:	0e250111 	jal	8940444 <_data-0x776bfbbc>
 300:	0e030b13 	jal	80c2c4c <_data-0x77f3d3b4>
 304:	17550e1b 	bne	k0,s5,3b74 <_data-0x7fffc48c>
 308:	17100111 	bne	t8,s0,750 <_data-0x7ffff8b0>
 30c:	24020000 	li	v0,0
 310:	3e0b0b00 	0x3e0b0b00
 314:	000e030b 	0xe030b
 318:	00160300 	sll	zero,s6,0xc
 31c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 320:	13490b3b 	beq	k0,t1,3010 <_data-0x7fffcff0>
 324:	26040000 	addiu	a0,s0,0
 328:	00134900 	sll	t1,s3,0x4
 32c:	00240500 	0x240500
 330:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 334:	00000803 	sra	at,zero,0x0
 338:	49010106 	bc2t	754 <_data-0x7ffff8ac>
 33c:	00130113 	0x130113
 340:	00210700 	0x210700
 344:	0b2f1349 	j	cbc4d24 <_data-0x7343b2dc>
 348:	0f080000 	jal	c200000 <_data-0x73e00000>
 34c:	490b0b00 	bc2tl	$cc2,2f50 <_data-0x7fffd0b0>
 350:	09000013 	j	400004c <_data-0x7bffffb4>
 354:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
 358:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 35c:	193f1349 	0x193f1349
 360:	00001802 	srl	v1,zero,0x0
 364:	0b01130a 	j	c044c28 <_data-0x73fbb3d8>
 368:	3b0b3a0b 	xori	t3,t8,0x3a0b
 36c:	0013010b 	0x13010b
 370:	000d0b00 	sll	at,t5,0xc
 374:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 378:	13490b3b 	beq	k0,t1,3068 <_data-0x7fffcf98>
 37c:	00000b38 	0xb38
 380:	03000d0c 	syscall	0xc0034
 384:	3b0b3a08 	xori	t3,t8,0x3a08
 388:	3813490b 	xori	s3,zero,0x490b
 38c:	0d00000b 	jal	400002c <_data-0x7bffffd4>
 390:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
 394:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 398:	193f1349 	0x193f1349
 39c:	0000193c 	0x193c
 3a0:	3f012e0e 	0x3f012e0e
 3a4:	3a0e0319 	xori	t6,s0,0x319
 3a8:	270b3b0b 	addiu	t3,t8,15115
 3ac:	12011119 	beq	s0,at,4814 <_data-0x7fffb7ec>
 3b0:	97184006 	lhu	t8,16390(t8)
 3b4:	13011942 	beq	t8,at,68c0 <_data-0x7fff9740>
 3b8:	050f0000 	0x50f0000
 3bc:	3a080300 	xori	t0,s0,0x300
 3c0:	490b3b0b 	bc2tl	$cc2,eff0 <_data-0x7fff1010>
 3c4:	00170213 	0x170213
 3c8:	00051000 	sll	v0,a1,0x0
 3cc:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 3d0:	13490b3b 	beq	k0,t1,30c0 <_data-0x7fffcf40>
 3d4:	00001702 	srl	v0,zero,0x1c
 3d8:	11010b11 	beq	t0,at,3020 <_data-0x7fffcfe0>
 3dc:	01061201 	0x1061201
 3e0:	12000013 	beqz	s0,430 <_data-0x7ffffbd0>
 3e4:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
 3e8:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 3ec:	17021349 	bne	t8,v0,5114 <_data-0x7fffaeec>
 3f0:	34130000 	li	s3,0x0
 3f4:	3a080300 	xori	t0,s0,0x300
 3f8:	490b3b0b 	bc2tl	$cc2,f028 <_data-0x7fff0fd8>
 3fc:	14000013 	bnez	zero,44c <_data-0x7ffffbb4>
 400:	1331011d 	beq	t9,s1,878 <_data-0x7ffff788>
 404:	06120111 	bltzall	s0,84c <_data-0x7ffff7b4>
 408:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 40c:	00001301 	0x1301
 410:	11010b15 	beq	t0,at,3068 <_data-0x7fffcf98>
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
 44c:	1b000013 	blez	t8,49c <_data-0x7ffffb64>
 450:	01018289 	0x1018289
 454:	42950111 	c0	0x950111
 458:	00133119 	0x133119
 45c:	012e1c00 	0x12e1c00
 460:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 464:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 468:	06120111 	bltzall	s0,8b0 <_data-0x7ffff750>
 46c:	42971840 	c0	0x971840
 470:	00130119 	0x130119
 474:	010b1d00 	0x10b1d00
 478:	00001755 	0x1755
 47c:	0300341e 	0x300341e
 480:	3b0b3a08 	xori	t3,t8,0x3a08
 484:	0213490b 	0x213490b
 488:	1f000017 	bgtz	t8,4e8 <_data-0x7ffffb18>
 48c:	1755010b 	bne	k0,s5,8bc <_data-0x7ffff744>
 490:	00001301 	0x1301
 494:	3f012e20 	0x3f012e20
 498:	3a0e0319 	xori	t6,s0,0x319
 49c:	490b3b0b 	bc2tl	$cc2,f0cc <_data-0x7fff0f34>
 4a0:	010b2013 	0x10b2013
 4a4:	21000013 	addi	zero,t0,19
 4a8:	01018289 	0x1018289
 4ac:	42950111 	c0	0x950111
 4b0:	01133119 	0x1133119
 4b4:	22000013 	addi	zero,s0,19
 4b8:	1331012e 	beq	t9,s1,974 <_data-0x7ffff68c>
 4bc:	06120111 	bltzall	s0,904 <_data-0x7ffff6fc>
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
 4ec:	550e1b0e 	bnel	t0,t6,7128 <_data-0x7fff8ed8>
 4f0:	10011117 	beq	zero,at,4950 <_data-0x7fffb6b0>
 4f4:	02000017 	0x2000017
 4f8:	0b0b000f 	j	c2c003c <_data-0x73d3ffc4>
 4fc:	24030000 	li	v1,0
 500:	3e0b0b00 	0x3e0b0b00
 504:	000e030b 	0xe030b
 508:	012e0400 	0x12e0400
 50c:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 510:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 514:	13491927 	beq	k0,t1,69b4 <_data-0x7fff964c>
 518:	06120111 	bltzall	s0,960 <_data-0x7ffff6a0>
 51c:	42971840 	c0	0x971840
 520:	00130119 	0x130119
 524:	00050500 	sll	zero,a1,0x14
 528:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 52c:	13490b3b 	beq	k0,t1,321c <_data-0x7fffcde4>
 530:	00001702 	srl	v0,zero,0x1c
 534:	00001806 	srlv	v1,zero,zero
 538:	00340700 	0x340700
 53c:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 540:	13490b3b 	beq	k0,t1,3230 <_data-0x7fffcdd0>
 544:	00001702 	srl	v0,zero,0x1c
 548:	03003408 	0x3003408
 54c:	3b0b3a08 	xori	t3,t8,0x3a08
 550:	0213490b 	0x213490b
 554:	09000018 	j	4000060 <_data-0x7bffffa0>
 558:	0e03000a 	jal	80c0028 <_data-0x77f3ffd8>
 55c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 560:	00000111 	0x111
 564:	55010b0a 	bnel	t0,at,3190 <_data-0x7fffce70>
 568:	00130117 	0x130117
 56c:	012e0b00 	0x12e0b00
 570:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 574:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 578:	193c1349 	0x193c1349
 57c:	00001301 	0x1301
 580:	0182890c 	syscall	0x60a24
 584:	31011100 	andi	at,t0,0x1100
 588:	0d000013 	jal	400004c <_data-0x7bffffb4>
 58c:	01018289 	0x1018289
 590:	13310111 	beq	t9,s1,9d8 <_data-0x7ffff628>
 594:	00001301 	0x1301
 598:	01828a0e 	0x1828a0e
 59c:	91180200 	lbu	t8,512(t0)
 5a0:	00001842 	srl	v1,zero,0x1
 5a4:	0182890f 	0x182890f
 5a8:	31011101 	andi	at,t0,0x1101
 5ac:	10000013 	b	5fc <_data-0x7ffffa04>
 5b0:	1755010b 	bne	k0,s5,9e0 <_data-0x7ffff620>
 5b4:	0b110000 	j	c440000 <_data-0x73bc0000>
 5b8:	12011101 	beq	s0,at,49c0 <_data-0x7fffb640>
 5bc:	00130106 	0x130106
 5c0:	00241200 	0x241200
 5c4:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 5c8:	00000803 	sra	at,zero,0x0
 5cc:	0b000f13 	j	c003c4c <_data-0x73ffc3b4>
 5d0:	0013490b 	0x13490b
 5d4:	00261400 	0x261400
 5d8:	00001349 	0x1349
 5dc:	3f002e15 	0x3f002e15
 5e0:	6e193c19 	0x6e193c19
 5e4:	3a0e030e 	xori	t6,s0,0x30e
 5e8:	000b3b0b 	0xb3b0b
 5ec:	11010000 	beq	t0,at,5f0 <_data-0x7ffffa10>
 5f0:	130e2501 	beq	t8,t6,99f8 <_data-0x7fff6608>
 5f4:	1b0e030b 	0x1b0e030b
 5f8:	1117550e 	beq	t0,s7,15a34 <_data-0x7ffea5cc>
 5fc:	00171001 	0x171001
 600:	00240200 	0x240200
 604:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 608:	00000e03 	sra	at,zero,0x18
 60c:	3f012e03 	0x3f012e03
 610:	3a0e0319 	xori	t6,s0,0x319
 614:	270b3b0b 	addiu	t3,t8,15115
 618:	11134919 	beq	t0,s3,12a80 <_data-0x7ffed580>
 61c:	40061201 	0x40061201
 620:	19429718 	0x19429718
 624:	00001301 	0x1301
 628:	03000504 	0x3000504
 62c:	3b0b3a08 	xori	t3,t8,0x3a08
 630:	0213490b 	0x213490b
 634:	05000017 	bltz	t0,694 <_data-0x7ffff96c>
 638:	0e030005 	jal	80c0014 <_data-0x77f3ffec>
 63c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 640:	17021349 	bne	t8,v0,5368 <_data-0x7fffac98>
 644:	34060000 	li	a2,0x0
 648:	3a080300 	xori	t0,s0,0x300
 64c:	490b3b0b 	bc2tl	$cc2,f27c <_data-0x7fff0d84>
 650:	00170213 	0x170213
 654:	00340700 	0x340700
 658:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 65c:	13490b3b 	beq	k0,t1,334c <_data-0x7fffccb4>
 660:	00001802 	srl	v1,zero,0x0
 664:	03003408 	0x3003408
 668:	3b0b3a0e 	xori	t3,t8,0x3a0e
 66c:	0213490b 	0x213490b
 670:	09000017 	j	400005c <_data-0x7bffffa4>
 674:	0111010b 	0x111010b
 678:	13010612 	beq	t8,at,1ec4 <_data-0x7fffe13c>
 67c:	2e0a0000 	sltiu	t2,s0,0
 680:	03193f01 	0x3193f01
 684:	3b0b3a0e 	xori	t3,t8,0x3a0e
 688:	3c13490b 	lui	s3,0x490b
 68c:	00130119 	0x130119
 690:	00180b00 	sll	at,t8,0xc
 694:	890c0000 	lwl	t4,0(t0)
 698:	11010182 	beq	t0,at,ca4 <_data-0x7ffff35c>
 69c:	00133101 	0x133101
 6a0:	828a0d00 	lb	t2,3328(s4)
 6a4:	18020001 	0x18020001
 6a8:	00184291 	0x184291
 6ac:	010b0e00 	0x10b0e00
 6b0:	06120111 	bltzall	s0,af8 <_data-0x7ffff508>
 6b4:	890f0000 	lwl	t7,0(t0)
 6b8:	11000182 	beqz	t0,cc4 <_data-0x7ffff33c>
 6bc:	00133101 	0x133101
 6c0:	00241000 	0x241000
 6c4:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 6c8:	00000803 	sra	at,zero,0x0
 6cc:	49010111 	bc2t	b14 <_data-0x7ffff4ec>
 6d0:	00130113 	0x130113
 6d4:	00211200 	0x211200
 6d8:	0b2f1349 	j	cbc4d24 <_data-0x7343b2dc>
 6dc:	2e130000 	sltiu	s3,s0,0
 6e0:	3c193f00 	lui	t9,0x3f00
 6e4:	030e6e19 	0x30e6e19
 6e8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 6ec:	0000000b 	movn	zero,zero,zero
 6f0:	25011101 	addiu	at,t0,4353
 6f4:	030b130e 	0x30b130e
 6f8:	550e1b0e 	bnel	t0,t6,7334 <_data-0x7fff8ccc>
 6fc:	10011117 	beq	zero,at,4b5c <_data-0x7fffb4a4>
 700:	02000017 	0x2000017
 704:	0b0b000f 	j	c2c003c <_data-0x73d3ffc4>
 708:	24030000 	li	v1,0
 70c:	3e0b0b00 	0x3e0b0b00
 710:	000e030b 	0xe030b
 714:	00160400 	sll	zero,s6,0x10
 718:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 71c:	13490b3b 	beq	k0,t1,340c <_data-0x7fffcbf4>
 720:	2e050000 	sltiu	a1,s0,0
 724:	03193f01 	0x3193f01
 728:	3b0b3a0e 	xori	t3,t8,0x3a0e
 72c:	11192705 	beq	t0,t9,a344 <_data-0x7fff5cbc>
 730:	40061201 	0x40061201
 734:	19429718 	0x19429718
 738:	00001301 	0x1301
 73c:	03000506 	0x3000506
 740:	3b0b3a08 	xori	t3,t8,0x3a08
 744:	02134905 	0x2134905
 748:	07000018 	bltz	t8,7ac <_data-0x7ffff854>
 74c:	08030005 	j	c0014 <_data-0x7ff3ffec>
 750:	053b0b3a 	0x53b0b3a
 754:	17021349 	bne	t8,v0,547c <_data-0x7fffab84>
 758:	89080000 	lwl	t0,0(t0)
 75c:	11010182 	beq	t0,at,d68 <_data-0x7ffff298>
 760:	19429501 	0x19429501
 764:	00001331 	tgeu	zero,zero,0x4c
 768:	01828a09 	0x1828a09
 76c:	91180200 	lbu	t8,512(t0)
 770:	00001842 	srl	v1,zero,0x1
 774:	3f012e0a 	0x3f012e0a
 778:	3a0e0319 	xori	t6,s0,0x319
 77c:	27053b0b 	addiu	a1,t8,15115
 780:	11134919 	beq	t0,s3,12be8 <_data-0x7ffed418>
 784:	40061201 	0x40061201
 788:	19429718 	0x19429718
 78c:	00001301 	0x1301
 790:	0300340b 	0x300340b
 794:	3b0b3a08 	xori	t3,t8,0x3a08
 798:	02134905 	0x2134905
 79c:	0c000018 	jal	60 <_data-0x7fffffa0>
 7a0:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 7a4:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 7a8:	0f0d0000 	jal	c340000 <_data-0x73cc0000>
 7ac:	490b0b00 	bc2tl	$cc2,33b0 <_data-0x7fffcc50>
 7b0:	0e000013 	jal	800004c <_data-0x77ffffb4>
 7b4:	00000026 	xor	zero,zero,zero
 7b8:	4900260f 	bc2f	9ff8 <_data-0x7fff6008>
 7bc:	10000013 	b	80c <_data-0x7ffff7f4>
 7c0:	08030034 	j	c00d0 <_data-0x7ff3ff30>
 7c4:	053b0b3a 	0x53b0b3a
 7c8:	17021349 	bne	t8,v0,54f0 <_data-0x7fffab10>
 7cc:	2e110000 	sltiu	s1,s0,0
 7d0:	03193f01 	0x3193f01
 7d4:	3b0b3a0e 	xori	t3,t8,0x3a0e
 7d8:	4919270b 	bc2t	$cc6,a408 <_data-0x7fff5bf8>
 7dc:	12011113 	beq	s0,at,4c2c <_data-0x7fffb3d4>
 7e0:	97184006 	lhu	t8,16390(t8)
 7e4:	13011942 	beq	t8,at,6cf0 <_data-0x7fff9310>
 7e8:	05120000 	bltzall	t0,7ec <_data-0x7ffff814>
 7ec:	3a080300 	xori	t0,s0,0x300
 7f0:	490b3b0b 	bc2tl	$cc2,f420 <_data-0x7fff0be0>
 7f4:	00170213 	0x170213
 7f8:	00051300 	sll	v0,a1,0xc
 7fc:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 800:	13490b3b 	beq	k0,t1,34f0 <_data-0x7fffcb10>
 804:	00001802 	srl	v1,zero,0x0
 808:	03003414 	0x3003414
 80c:	3b0b3a08 	xori	t3,t8,0x3a08
 810:	0213490b 	0x213490b
 814:	15000017 	bnez	t0,874 <_data-0x7ffff78c>
 818:	193f012e 	0x193f012e
 81c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 820:	19270b3b 	0x19270b3b
 824:	01111349 	0x1111349
 828:	18400612 	blez	v0,2074 <_data-0x7fffdf8c>
 82c:	00194297 	0x194297
 830:	11010000 	beq	t0,at,834 <_data-0x7ffff7cc>
 834:	130e2501 	beq	t8,t6,9c3c <_data-0x7fff63c4>
 838:	1b0e030b 	0x1b0e030b
 83c:	1117550e 	beq	t0,s7,15c78 <_data-0x7ffea388>
 840:	00171001 	0x171001
 844:	00240200 	0x240200
 848:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 84c:	00000e03 	sra	at,zero,0x18
 850:	3f012e03 	0x3f012e03
 854:	3a0e0319 	xori	t6,s0,0x319
 858:	270b3b0b 	addiu	t3,t8,15115
 85c:	11134919 	beq	t0,s3,12cc4 <_data-0x7ffed33c>
 860:	40061201 	0x40061201
 864:	19429718 	0x19429718
 868:	00001301 	0x1301
 86c:	03000504 	0x3000504
 870:	3b0b3a08 	xori	t3,t8,0x3a08
 874:	0213490b 	0x213490b
 878:	05000017 	bltz	t0,8d8 <_data-0x7ffff728>
 87c:	193f012e 	0x193f012e
 880:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 884:	13490b3b 	beq	k0,t1,3574 <_data-0x7fffca8c>
 888:	1301193c 	beq	t8,at,6d7c <_data-0x7fff9284>
 88c:	18060000 	0x18060000
 890:	07000000 	bltz	t8,894 <_data-0x7ffff76c>
 894:	01018289 	0x1018289
 898:	13310111 	beq	t9,s1,ce0 <_data-0x7ffff320>
 89c:	00001301 	0x1301
 8a0:	01828a08 	0x1828a08
 8a4:	91180200 	lbu	t8,512(t0)
 8a8:	00001842 	srl	v1,zero,0x1
 8ac:	01828909 	0x1828909
 8b0:	31011101 	andi	at,t0,0x1101
 8b4:	0a000013 	j	800004c <_data-0x77ffffb4>
 8b8:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 8bc:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 8c0:	0f0b0000 	jal	c2c0000 <_data-0x73d40000>
 8c4:	490b0b00 	bc2tl	$cc2,34c8 <_data-0x7fffcb38>
 8c8:	0c000013 	jal	4c <_data-0x7fffffb4>
 8cc:	13490026 	beq	k0,t1,968 <_data-0x7ffff698>
 8d0:	340d0000 	li	t5,0x0
 8d4:	3a080300 	xori	t0,s0,0x300
 8d8:	490b3b0b 	bc2tl	$cc2,f508 <_data-0x7fff0af8>
 8dc:	00170213 	0x170213
 8e0:	010b0e00 	0x10b0e00
 8e4:	00001755 	0x1755
 8e8:	11010b0f 	beq	t0,at,3528 <_data-0x7fffcad8>
 8ec:	01061201 	0x1061201
 8f0:	10000013 	b	940 <_data-0x7ffff6c0>
 8f4:	193f002e 	0x193f002e
 8f8:	0e6e193c 	jal	9b864f0 <_data-0x76479b10>
 8fc:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 900:	00000b3b 	0xb3b
 904:	01110100 	0x1110100
 908:	0b130e25 	j	c4c3894 <_data-0x73b3c76c>
 90c:	0e1b0e03 	jal	86c380c <_data-0x7793c7f4>
 910:	01111755 	0x1111755
 914:	00001710 	0x1710
 918:	0b002402 	j	c009008 <_data-0x73ff6ff8>
 91c:	030b3e0b 	0x30b3e0b
 920:	0300000e 	0x300000e
 924:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 928:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 92c:	16040000 	bne	s0,a0,930 <_data-0x7ffff6d0>
 930:	3a0e0300 	xori	t6,s0,0x300
 934:	490b3b0b 	bc2tl	$cc2,f564 <_data-0x7fff0a9c>
 938:	05000013 	bltz	t0,988 <_data-0x7ffff678>
 93c:	193f012e 	0x193f012e
 940:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 944:	19270b3b 	0x19270b3b
 948:	01111349 	0x1111349
 94c:	18400612 	blez	v0,2198 <_data-0x7fffde68>
 950:	01194297 	0x1194297
 954:	06000013 	bltz	s0,9a4 <_data-0x7ffff65c>
 958:	08030005 	j	c0014 <_data-0x7ff3ffec>
 95c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 960:	17021349 	bne	t8,v0,5688 <_data-0x7fffa978>
 964:	89070000 	lwl	a3,0(t0)
 968:	11010182 	beq	t0,at,f74 <_data-0x7ffff08c>
 96c:	00133101 	0x133101
 970:	828a0800 	lb	t2,2048(s4)
 974:	18020001 	0x18020001
 978:	00184291 	0x184291
 97c:	002e0900 	0x2e0900
 980:	193c193f 	0x193c193f
 984:	0e030e6e 	jal	80c39b8 <_data-0x77f3c648>
 988:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 98c:	01000000 	0x1000000
 990:	0e250111 	jal	8940444 <_data-0x776bfbbc>
 994:	0e030b13 	jal	80c2c4c <_data-0x77f3d3b4>
 998:	17550e1b 	bne	k0,s5,4208 <_data-0x7fffbdf8>
 99c:	17100111 	bne	t8,s0,de4 <_data-0x7ffff21c>
 9a0:	0f020000 	jal	c080000 <_data-0x73f80000>
 9a4:	000b0b00 	sll	at,t3,0xc
 9a8:	00240300 	0x240300
 9ac:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 9b0:	00000e03 	sra	at,zero,0x18
 9b4:	49003504 	bc2f	ddc8 <_data-0x7fff2238>
 9b8:	05000013 	bltz	t0,a08 <_data-0x7ffff5f8>
 9bc:	0e030016 	jal	80c0058 <_data-0x77f3ffa8>
 9c0:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 9c4:	00001349 	0x1349
 9c8:	0b002406 	j	c009018 <_data-0x73ff6fe8>
 9cc:	030b3e0b 	0x30b3e0b
 9d0:	07000008 	bltz	t8,9f4 <_data-0x7ffff60c>
 9d4:	193f012e 	0x193f012e
 9d8:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 9dc:	0e6e0b3b 	jal	9b82cec <_data-0x7647d314>
 9e0:	13010b20 	beq	t8,at,3664 <_data-0x7fffc99c>
 9e4:	2f080000 	sltiu	t0,t8,0
 9e8:	49080300 	bc2f	$cc2,15ec <_data-0x7fffea14>
 9ec:	09000013 	j	400004c <_data-0x7bffffb4>
 9f0:	0e030005 	jal	80c0014 <_data-0x77f3ffec>
 9f4:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 9f8:	00001349 	0x1349
 9fc:	0300340a 	0x300340a
 a00:	3b0b3a08 	xori	t3,t8,0x3a08
 a04:	0013490b 	0x13490b
 a08:	000f0b00 	sll	at,t7,0xc
 a0c:	13490b0b 	beq	k0,t1,363c <_data-0x7fffc9c4>
 a10:	2e0c0000 	sltiu	t4,s0,0
 a14:	03193f01 	0x3193f01
 a18:	3b0b3a0e 	xori	t3,t8,0x3a0e
 a1c:	490e6e0b 	bc2fl	$cc3,1c24c <_data-0x7ffe3db4>
 a20:	010b2013 	0x10b2013
 a24:	0d000013 	jal	400004c <_data-0x7bffffb4>
 a28:	193f012e 	0x193f012e
 a2c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 a30:	13490b3b 	beq	k0,t1,3720 <_data-0x7fffc8e0>
 a34:	06120111 	bltzall	s0,e7c <_data-0x7ffff184>
 a38:	42971840 	c0	0x971840
 a3c:	00130119 	0x130119
 a40:	011d0e00 	0x11d0e00
 a44:	01111331 	tgeu	t0,s1,0x4c
 a48:	0b580612 	j	d601848 <_data-0x729fe7b8>
 a4c:	00000b59 	0xb59
 a50:	3100050f 	andi	zero,t0,0x50f
 a54:	00170213 	0x170213
 a58:	010b1000 	0x10b1000
 a5c:	06120111 	bltzall	s0,ea4 <_data-0x7ffff15c>
 a60:	34110000 	li	s1,0x0
 a64:	1c133100 	0x1c133100
 a68:	1200000d 	beqz	s0,aa0 <_data-0x7ffff560>
 a6c:	193f012e 	0x193f012e
 a70:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 a74:	01110b3b 	0x1110b3b
 a78:	18400612 	blez	v0,22c4 <_data-0x7fffdd3c>
 a7c:	01194297 	0x1194297
 a80:	13000013 	beqz	t8,ad0 <_data-0x7ffff530>
 a84:	0e030005 	jal	80c0014 <_data-0x77f3ffec>
 a88:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 a8c:	18021349 	0x18021349
 a90:	34140000 	li	s4,0x0
 a94:	3a0e0300 	xori	t6,s0,0x300
 a98:	490b3b0b 	bc2tl	$cc2,f6c8 <_data-0x7fff0938>
 a9c:	00170213 	0x170213
 aa0:	82891500 	lb	t1,5376(s4)
 aa4:	01110001 	movt	zero,t0,$fcc4
 aa8:	00001331 	tgeu	zero,zero,0x4c
 aac:	31011d16 	andi	at,t0,0x1d16
 ab0:	12011113 	beq	s0,at,4f00 <_data-0x7fffb100>
 ab4:	590b5806 	0x590b5806
 ab8:	0013010b 	0x13010b
 abc:	00051700 	sll	v0,a1,0x1c
 ac0:	00001331 	tgeu	zero,zero,0x4c
 ac4:	31011d18 	andi	at,t0,0x1d18
 ac8:	55015213 	bnel	t0,at,15318 <_data-0x7ffeace8>
 acc:	590b5817 	0x590b5817
 ad0:	0013010b 	0x13010b
 ad4:	011d1900 	0x11d1900
 ad8:	01521331 	tgeu	t2,s2,0x4c
 adc:	0b581755 	j	d605d54 <_data-0x729fa2ac>
 ae0:	00000b59 	0xb59
 ae4:	55010b1a 	bnel	t0,at,3750 <_data-0x7fffc8b0>
 ae8:	1b000017 	blez	t8,b48 <_data-0x7ffff4b8>
 aec:	13310034 	beq	t9,s1,bc0 <_data-0x7ffff440>
 af0:	00001802 	srl	v1,zero,0x0
 af4:	3f012e1c 	0x3f012e1c
 af8:	3a0e0319 	xori	t6,s0,0x319
 afc:	200b3b0b 	addi	t3,zero,15115
 b00:	0013010b 	0x13010b
 b04:	012e1d00 	0x12e1d00
 b08:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 b0c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 b10:	0b201349 	j	c804d24 <_data-0x737fb2dc>
 b14:	00001301 	0x1301
 b18:	31012e1e 	andi	at,t0,0x2e1e
 b1c:	12011113 	beq	s0,at,4f6c <_data-0x7fffb094>
 b20:	97184006 	lhu	t8,16390(t8)
 b24:	13011942 	beq	t8,at,7030 <_data-0x7fff8fd0>
 b28:	051f0000 	0x51f0000
 b2c:	02133100 	0x2133100
 b30:	20000018 	addi	zero,zero,24
 b34:	1331012e 	beq	t9,s1,ff0 <_data-0x7ffff010>
 b38:	06120111 	bltzall	s0,f80 <_data-0x7ffff080>
 b3c:	42971840 	c0	0x971840
 b40:	00000019 	multu	zero,zero

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
       0:	880005dc 	lwl	zero,1500(zero)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	8800069b 	lwl	zero,1691(zero)
       8:	9b540001 	lwr	s4,1(k0)
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
       c:	c4880006 	lwc1	$f8,6(a0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	04880007 	tgei	a0,7
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	5401f300 	bnel	zero,at,ffffcc18 <_text_end+0x77ffb680>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	0000009f 	0x9f
      1c:	00000000 	nop
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
      20:	0005dc00 	sll	k1,a1,0x10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	00069b88 	0x69b88
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	55000188 	bnezl	t0,64c <_data-0x7ffff9b4>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	8800069b 	lwl	zero,1691(zero)
      30:	880007c4 	lwl	zero,1988(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	01f30004 	sllv	zero,s3,t7
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	00009f55 	0x9f55
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	00000000 	nop
      40:	05dc0000 	0x5dc0000
      44:	069b8800 	0x69b8800
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
      48:	00018800 	sll	s1,at,0x0
      4c:	00069b56 	0x69b56
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	0007c488 	0x7c488
      54:	f3000488 	0xf3000488
      58:	009f5601 	0x9f5601
      5c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
      60:	dc000000 	ldc3	$0,0(zero)
      64:	9b880005 	lwr	t0,5(gp)
      68:	01880006 	srlv	zero,t0,t4
      6c:	069b5700 	0x69b5700
      70:	07c48800 	0x7c48800
      74:	00048800 	sll	s1,a0,0x0
      78:	9f5701f3 	0x9f5701f3
	...
      84:	880005dc 	lwl	zero,1500(zero)
      88:	880007bc 	lwl	zero,1980(zero)
      8c:	10910002 	beq	a0,s1,98 <_data-0x7fffff68>
      90:	880007bc 	lwl	zero,1980(zero)
      94:	880007c4 	lwl	zero,1988(zero)
      98:	108d0002 	beq	a0,t5,a4 <_data-0x7fffff5c>
      9c:	00000000 	nop
      a0:	00000000 	nop
      a4:	880005dc 	lwl	zero,1500(zero)
      a8:	880007bc 	lwl	zero,1980(zero)
      ac:	14910002 	bne	a0,s1,b8 <_data-0x7fffff48>
      b0:	880007bc 	lwl	zero,1980(zero)
      b4:	880007c4 	lwl	zero,1988(zero)
      b8:	148d0002 	bne	a0,t5,c4 <_data-0x7fffff3c>
      bc:	00000000 	nop
      c0:	00000000 	nop
      c4:	880005dc 	lwl	zero,1500(zero)
      c8:	880007bc 	lwl	zero,1980(zero)
      cc:	18910002 	0x18910002
      d0:	880007bc 	lwl	zero,1980(zero)
      d4:	880007c4 	lwl	zero,1988(zero)
      d8:	188d0002 	0x188d0002
	...
      e4:	880005dc 	lwl	zero,1500(zero)
      e8:	880007bc 	lwl	zero,1980(zero)
      ec:	1c910002 	0x1c910002
      f0:	880007bc 	lwl	zero,1980(zero)
      f4:	880007c4 	lwl	zero,1988(zero)
      f8:	1c8d0002 	0x1c8d0002
	...
     104:	880005dc 	lwl	zero,1500(zero)
     108:	880007bc 	lwl	zero,1980(zero)
     10c:	20910002 	addi	s1,a0,2
     110:	880007bc 	lwl	zero,1980(zero)
     114:	880007c4 	lwl	zero,1988(zero)
     118:	208d0002 	addi	t5,a0,2
	...
     124:	880005dc 	lwl	zero,1500(zero)
     128:	880007bc 	lwl	zero,1980(zero)
     12c:	24910002 	addiu	s1,a0,2
     130:	880007bc 	lwl	zero,1980(zero)
     134:	880007c4 	lwl	zero,1988(zero)
     138:	248d0002 	addiu	t5,a0,2
	...
     144:	880005dc 	lwl	zero,1500(zero)
     148:	880007bc 	lwl	zero,1980(zero)
     14c:	28910002 	slti	s1,a0,2
     150:	880007bc 	lwl	zero,1980(zero)
     154:	880007c4 	lwl	zero,1988(zero)
     158:	288d0002 	slti	t5,a0,2
	...
     164:	880005dc 	lwl	zero,1500(zero)
     168:	880007bc 	lwl	zero,1980(zero)
     16c:	2c910002 	sltiu	s1,a0,2
     170:	880007bc 	lwl	zero,1980(zero)
     174:	880007c4 	lwl	zero,1988(zero)
     178:	2c8d0002 	sltiu	t5,a0,2
	...
     184:	880005dc 	lwl	zero,1500(zero)
     188:	880007bc 	lwl	zero,1980(zero)
     18c:	30910002 	andi	s1,a0,0x2
     190:	880007bc 	lwl	zero,1980(zero)
     194:	880007c4 	lwl	zero,1988(zero)
     198:	308d0002 	andi	t5,a0,0x2
	...
     1a4:	880005dc 	lwl	zero,1500(zero)
     1a8:	880007bc 	lwl	zero,1980(zero)
     1ac:	34910002 	ori	s1,a0,0x2
     1b0:	880007bc 	lwl	zero,1980(zero)
     1b4:	880007c4 	lwl	zero,1988(zero)
     1b8:	348d0002 	ori	t5,a0,0x2
	...
     1c4:	880005dc 	lwl	zero,1500(zero)
     1c8:	880007bc 	lwl	zero,1980(zero)
     1cc:	38910002 	xori	s1,a0,0x2
     1d0:	880007bc 	lwl	zero,1980(zero)
     1d4:	880007c4 	lwl	zero,1988(zero)
     1d8:	388d0002 	xori	t5,a0,0x2
	...
     1e4:	880005dc 	lwl	zero,1500(zero)
     1e8:	880007bc 	lwl	zero,1980(zero)
     1ec:	3c910002 	0x3c910002
     1f0:	880007bc 	lwl	zero,1980(zero)
     1f4:	880007c4 	lwl	zero,1988(zero)
     1f8:	3c8d0002 	0x3c8d0002
	...
     204:	880005dc 	lwl	zero,1500(zero)
     208:	880007bc 	lwl	zero,1980(zero)
     20c:	c0910003 	ll	s1,3(a0)
     210:	0007bc00 	sll	s7,a3,0x10
     214:	0007c488 	0x7c488
     218:	8d000388 	lw	zero,904(t0)
     21c:	000000c0 	ehb
     220:	00000000 	nop
     224:	05dc0000 	0x5dc0000
     228:	07bc8800 	0x7bc8800
     22c:	00038800 	sll	s1,v1,0x0
     230:	bc00c491 	cache	0x0,-15215(zero)
     234:	c4880007 	lwc1	$f8,7(a0)
     238:	03880007 	srav	zero,t0,gp
     23c:	00c48d00 	0xc48d00
	...
     248:	880005dc 	lwl	zero,1500(zero)
     24c:	880007bc 	lwl	zero,1980(zero)
     250:	c8910003 	lwc2	$17,3(a0)
     254:	0007bc00 	sll	s7,a3,0x10
     258:	0007c488 	0x7c488
     25c:	8d000388 	lw	zero,904(t0)
     260:	000000c8 	0xc8
     264:	00000000 	nop
     268:	05dc0000 	0x5dc0000
     26c:	07bc8800 	0x7bc8800
     270:	00038800 	sll	s1,v1,0x0
     274:	bc00cc91 	cache	0x0,-13167(zero)
     278:	c4880007 	lwc1	$f8,7(a0)
     27c:	03880007 	srav	zero,t0,gp
     280:	00cc8d00 	0xcc8d00
	...
     28c:	880005dc 	lwl	zero,1500(zero)
     290:	880007bc 	lwl	zero,1980(zero)
     294:	d0910003 	0xd0910003
     298:	0007bc00 	sll	s7,a3,0x10
     29c:	0007c488 	0x7c488
     2a0:	8d000388 	lw	zero,904(t0)
     2a4:	000000d0 	0xd0
     2a8:	00000000 	nop
     2ac:	05dc0000 	0x5dc0000
     2b0:	07bc8800 	0x7bc8800
     2b4:	00038800 	sll	s1,v1,0x0
     2b8:	bc00d491 	cache	0x0,-11119(zero)
     2bc:	c4880007 	lwc1	$f8,7(a0)
     2c0:	03880007 	srav	zero,t0,gp
     2c4:	00d48d00 	0xd48d00
	...
     2d0:	880005dc 	lwl	zero,1500(zero)
     2d4:	880007bc 	lwl	zero,1980(zero)
     2d8:	d8910003 	ldc2	$17,3(a0)
     2dc:	0007bc00 	sll	s7,a3,0x10
     2e0:	0007c488 	0x7c488
     2e4:	8d000388 	lw	zero,904(t0)
     2e8:	000000d8 	0xd8
     2ec:	00000000 	nop
     2f0:	05dc0000 	0x5dc0000
     2f4:	07bc8800 	0x7bc8800
     2f8:	00038800 	sll	s1,v1,0x0
     2fc:	bc00dc91 	cache	0x0,-9071(zero)
     300:	c4880007 	lwc1	$f8,7(a0)
     304:	03880007 	srav	zero,t0,gp
     308:	00dc8d00 	0xdc8d00
	...
     314:	880005dc 	lwl	zero,1500(zero)
     318:	880007bc 	lwl	zero,1980(zero)
     31c:	e0910003 	sc	s1,3(a0)
     320:	0007bc00 	sll	s7,a3,0x10
     324:	0007c488 	0x7c488
     328:	8d000388 	lw	zero,904(t0)
     32c:	000000e0 	0xe0
     330:	00000000 	nop
     334:	069c0000 	0x69c0000
     338:	07bc8800 	0x7bc8800
     33c:	00018800 	sll	s1,at,0x0
     340:	0007bc60 	0x7bc60
     344:	0007c388 	0x7c388
     348:	54000188 	bnezl	zero,96c <_data-0x7ffff694>
     34c:	880007c3 	lwl	zero,1987(zero)
     350:	880007c4 	lwl	zero,1988(zero)
     354:	e08d0003 	sc	t5,3(a0)
	...
     360:	00069c00 	sll	s3,a2,0x10
     364:	0007b488 	0x7b488
     368:	61000188 	0x61000188
     36c:	880007b4 	lwl	zero,1972(zero)
     370:	880007bc 	lwl	zero,1980(zero)
     374:	dc910003 	ldc3	$17,3(a0)
     378:	0007bc00 	sll	s7,a3,0x10
     37c:	0007c488 	0x7c488
     380:	8d000388 	lw	zero,904(t0)
     384:	000000dc 	0xdc
     388:	00000000 	nop
     38c:	069c0000 	0x69c0000
     390:	07b08800 	bltzal	sp,fffe2394 <_text_end+0x77fe0dfc>
     394:	00018800 	sll	s1,at,0x0
     398:	0007b062 	0x7b062
     39c:	0007bc88 	0x7bc88
     3a0:	91000388 	lbu	zero,904(t0)
     3a4:	07bc00d8 	0x7bc00d8
     3a8:	07c48800 	0x7c48800
     3ac:	00038800 	sll	s1,v1,0x0
     3b0:	0000d88d 	break	0x0,0x362
     3b4:	00000000 	nop
     3b8:	9c000000 	0x9c000000
     3bc:	ac880006 	sw	t0,6(a0)
     3c0:	01880007 	srav	zero,t0,t4
     3c4:	07ac6300 	teqi	sp,25344
     3c8:	07bc8800 	0x7bc8800
     3cc:	00038800 	sll	s1,v1,0x0
     3d0:	bc00d491 	cache	0x0,-11119(zero)
     3d4:	c4880007 	lwc1	$f8,7(a0)
     3d8:	03880007 	srav	zero,t0,gp
     3dc:	00d48d00 	0xd48d00
	...
     3e8:	8800069c 	lwl	zero,1692(zero)
     3ec:	880007a8 	lwl	zero,1960(zero)
     3f0:	a8640001 	swl	a0,1(v1)
     3f4:	bc880007 	cache	0x8,7(a0)
     3f8:	03880007 	srav	zero,t0,gp
     3fc:	00d09100 	0xd09100
     400:	880007bc 	lwl	zero,1980(zero)
     404:	880007c4 	lwl	zero,1988(zero)
     408:	d08d0003 	0xd08d0003
	...
     414:	00069c00 	sll	s3,a2,0x10
     418:	0007a488 	0x7a488
     41c:	65000188 	0x65000188
     420:	880007a4 	lwl	zero,1956(zero)
     424:	880007bc 	lwl	zero,1980(zero)
     428:	cc910003 	pref	0x11,3(a0)
     42c:	0007bc00 	sll	s7,a3,0x10
     430:	0007c488 	0x7c488
     434:	8d000388 	lw	zero,904(t0)
     438:	000000cc 	syscall	0x3
     43c:	00000000 	nop
     440:	069c0000 	0x69c0000
     444:	07a08800 	bltz	sp,fffe2448 <_text_end+0x77fe0eb0>
     448:	00018800 	sll	s1,at,0x0
     44c:	0007a066 	0x7a066
     450:	0007bc88 	0x7bc88
     454:	91000388 	lbu	zero,904(t0)
     458:	07bc00c8 	0x7bc00c8
     45c:	07c48800 	0x7c48800
     460:	00038800 	sll	s1,v1,0x0
     464:	0000c88d 	break	0x0,0x322
     468:	00000000 	nop
     46c:	9c000000 	0x9c000000
     470:	9c880006 	0x9c880006
     474:	01880007 	srav	zero,t0,t4
     478:	079c6700 	0x79c6700
     47c:	07bc8800 	0x7bc8800
     480:	00038800 	sll	s1,v1,0x0
     484:	bc00c491 	cache	0x0,-15215(zero)
     488:	c4880007 	lwc1	$f8,7(a0)
     48c:	03880007 	srav	zero,t0,gp
     490:	00c48d00 	0xc48d00
	...
     49c:	8800069c 	lwl	zero,1692(zero)
     4a0:	88000798 	lwl	zero,1944(zero)
     4a4:	986e0001 	lwr	t6,1(v1)
     4a8:	bc880007 	cache	0x8,7(a0)
     4ac:	03880007 	srav	zero,t0,gp
     4b0:	00c09100 	0xc09100
     4b4:	880007bc 	lwl	zero,1980(zero)
     4b8:	880007c4 	lwl	zero,1988(zero)
     4bc:	c08d0003 	ll	t5,3(a0)
	...
     4c8:	00069c00 	sll	s3,a2,0x10
     4cc:	0007bc88 	0x7bc88
     4d0:	91000388 	lbu	zero,904(t0)
     4d4:	07bc7f98 	0x7bc7f98
     4d8:	07c48800 	0x7c48800
     4dc:	00038800 	sll	s1,v1,0x0
     4e0:	007f988d 	break	0x7f,0x262
     4e4:	00000000 	nop
     4e8:	9c000000 	0x9c000000
     4ec:	bc880006 	cache	0x8,6(a0)
     4f0:	03880007 	srav	zero,t0,gp
     4f4:	7f9c9100 	0x7f9c9100
     4f8:	880007bc 	lwl	zero,1980(zero)
     4fc:	880007c4 	lwl	zero,1988(zero)
     500:	9c8d0003 	0x9c8d0003
     504:	0000007f 	0x7f
     508:	00000000 	nop
     50c:	00069c00 	sll	s3,a2,0x10
     510:	0007bc88 	0x7bc88
     514:	91000388 	lbu	zero,904(t0)
     518:	07bc7fa0 	0x7bc7fa0
     51c:	07c48800 	0x7c48800
     520:	00038800 	sll	s1,v1,0x0
     524:	007fa08d 	break	0x7f,0x282
     528:	00000000 	nop
     52c:	9c000000 	0x9c000000
     530:	bc880006 	cache	0x8,6(a0)
     534:	03880007 	srav	zero,t0,gp
     538:	7fa49100 	0x7fa49100
     53c:	880007bc 	lwl	zero,1980(zero)
     540:	880007c4 	lwl	zero,1988(zero)
     544:	a48d0003 	sh	t5,3(a0)
     548:	0000007f 	0x7f
     54c:	00000000 	nop
     550:	00069c00 	sll	s3,a2,0x10
     554:	0007bc88 	0x7bc88
     558:	91000388 	lbu	zero,904(t0)
     55c:	07bc7fa8 	0x7bc7fa8
     560:	07c48800 	0x7c48800
     564:	00038800 	sll	s1,v1,0x0
     568:	007fa88d 	break	0x7f,0x2a2
     56c:	00000000 	nop
     570:	9c000000 	0x9c000000
     574:	bc880006 	cache	0x8,6(a0)
     578:	03880007 	srav	zero,t0,gp
     57c:	7fac9100 	0x7fac9100
     580:	880007bc 	lwl	zero,1980(zero)
     584:	880007c4 	lwl	zero,1988(zero)
     588:	ac8d0003 	sw	t5,3(a0)
     58c:	0000007f 	0x7f
     590:	00000000 	nop
     594:	00069c00 	sll	s3,a2,0x10
     598:	0007bc88 	0x7bc88
     59c:	91000388 	lbu	zero,904(t0)
     5a0:	07bc7fb0 	0x7bc7fb0
     5a4:	07c48800 	0x7c48800
     5a8:	00038800 	sll	s1,v1,0x0
     5ac:	007fb08d 	break	0x7f,0x2c2
     5b0:	00000000 	nop
     5b4:	9c000000 	0x9c000000
     5b8:	bc880006 	cache	0x8,6(a0)
     5bc:	03880007 	srav	zero,t0,gp
     5c0:	7fb49100 	0x7fb49100
     5c4:	880007bc 	lwl	zero,1980(zero)
     5c8:	880007c4 	lwl	zero,1988(zero)
     5cc:	b48d0003 	0xb48d0003
     5d0:	0000007f 	0x7f
     5d4:	00000000 	nop
     5d8:	00069c00 	sll	s3,a2,0x10
     5dc:	0007bc88 	0x7bc88
     5e0:	91000388 	lbu	zero,904(t0)
     5e4:	07bc7fb8 	0x7bc7fb8
     5e8:	07c48800 	0x7c48800
     5ec:	00038800 	sll	s1,v1,0x0
     5f0:	007fb88d 	break	0x7f,0x2e2
     5f4:	00000000 	nop
     5f8:	9c000000 	0x9c000000
     5fc:	bc880006 	cache	0x8,6(a0)
     600:	03880007 	srav	zero,t0,gp
     604:	7fbc9100 	0x7fbc9100
     608:	880007bc 	lwl	zero,1980(zero)
     60c:	880007c4 	lwl	zero,1988(zero)
     610:	bc8d0003 	cache	0xd,3(a0)
     614:	0000007f 	0x7f
     618:	00000000 	nop
     61c:	00069c00 	sll	s3,a2,0x10
     620:	0007bc88 	0x7bc88
     624:	91000288 	lbu	zero,648(t0)
     628:	0007bc40 	sll	s7,a3,0x11
     62c:	0007c488 	0x7c488
     630:	8d000288 	lw	zero,648(t0)
     634:	00000040 	ssnop
     638:	00000000 	nop
     63c:	00069c00 	sll	s3,a2,0x10
     640:	0007bc88 	0x7bc88
     644:	91000288 	lbu	zero,648(t0)
     648:	0007bc44 	0x7bc44
     64c:	0007c488 	0x7c488
     650:	8d000288 	lw	zero,648(t0)
     654:	00000044 	0x44
     658:	00000000 	nop
     65c:	00069c00 	sll	s3,a2,0x10
     660:	0007bc88 	0x7bc88
     664:	91000288 	lbu	zero,648(t0)
     668:	0007bc48 	0x7bc48
     66c:	0007c488 	0x7c488
     670:	8d000288 	lw	zero,648(t0)
     674:	00000048 	0x48
     678:	00000000 	nop
     67c:	00069c00 	sll	s3,a2,0x10
     680:	0007bc88 	0x7bc88
     684:	91000288 	lbu	zero,648(t0)
     688:	0007bc4c 	syscall	0x1ef1
     68c:	0007c488 	0x7c488
     690:	8d000288 	lw	zero,648(t0)
     694:	0000004c 	syscall	0x1
     698:	00000000 	nop
     69c:	00069c00 	sll	s3,a2,0x10
     6a0:	0007bc88 	0x7bc88
     6a4:	91000288 	lbu	zero,648(t0)
     6a8:	0007bc50 	0x7bc50
     6ac:	0007c488 	0x7c488
     6b0:	8d000288 	lw	zero,648(t0)
     6b4:	00000050 	0x50
     6b8:	00000000 	nop
     6bc:	0006a800 	sll	s5,a2,0x0
     6c0:	0007bc88 	0x7bc88
     6c4:	60000188 	0x60000188
     6c8:	880007bc 	lwl	zero,1980(zero)
     6cc:	880007c3 	lwl	zero,1987(zero)
     6d0:	c3540001 	ll	s4,1(k0)
     6d4:	c4880007 	lwc1	$f8,7(a0)
     6d8:	03880007 	srav	zero,t0,gp
     6dc:	00e08d00 	0xe08d00
	...
     6e8:	880006a8 	lwl	zero,1704(zero)
     6ec:	880007b4 	lwl	zero,1972(zero)
     6f0:	b4610001 	0xb4610001
     6f4:	bc880007 	cache	0x8,7(a0)
     6f8:	03880007 	srav	zero,t0,gp
     6fc:	00dc9100 	0xdc9100
     700:	880007bc 	lwl	zero,1980(zero)
     704:	880007c4 	lwl	zero,1988(zero)
     708:	dc8d0003 	ldc3	$13,3(a0)
	...
     714:	0006a800 	sll	s5,a2,0x0
     718:	0007b088 	0x7b088
     71c:	62000188 	0x62000188
     720:	880007b0 	lwl	zero,1968(zero)
     724:	880007bc 	lwl	zero,1980(zero)
     728:	d8910003 	ldc2	$17,3(a0)
     72c:	0007bc00 	sll	s7,a3,0x10
     730:	0007c488 	0x7c488
     734:	8d000388 	lw	zero,904(t0)
     738:	000000d8 	0xd8
     73c:	00000000 	nop
     740:	06a80000 	tgei	s5,0
     744:	07ac8800 	teqi	sp,-30720
     748:	00018800 	sll	s1,at,0x0
     74c:	0007ac63 	0x7ac63
     750:	0007bc88 	0x7bc88
     754:	91000388 	lbu	zero,904(t0)
     758:	07bc00d4 	0x7bc00d4
     75c:	07c48800 	0x7c48800
     760:	00038800 	sll	s1,v1,0x0
     764:	0000d48d 	break	0x0,0x352
     768:	00000000 	nop
     76c:	a8000000 	swl	zero,0(zero)
     770:	a8880006 	swl	t0,6(a0)
     774:	01880007 	srav	zero,t0,t4
     778:	07a86400 	tgei	sp,25600
     77c:	07bc8800 	0x7bc8800
     780:	00038800 	sll	s1,v1,0x0
     784:	bc00d091 	cache	0x0,-12143(zero)
     788:	c4880007 	lwc1	$f8,7(a0)
     78c:	03880007 	srav	zero,t0,gp
     790:	00d08d00 	0xd08d00
	...
     79c:	880006a8 	lwl	zero,1704(zero)
     7a0:	880007a4 	lwl	zero,1956(zero)
     7a4:	a4650001 	sh	a1,1(v1)
     7a8:	bc880007 	cache	0x8,7(a0)
     7ac:	03880007 	srav	zero,t0,gp
     7b0:	00cc9100 	0xcc9100
     7b4:	880007bc 	lwl	zero,1980(zero)
     7b8:	880007c4 	lwl	zero,1988(zero)
     7bc:	cc8d0003 	pref	0xd,3(a0)
	...
     7c8:	0006a800 	sll	s5,a2,0x0
     7cc:	0007a088 	0x7a088
     7d0:	66000188 	0x66000188
     7d4:	880007a0 	lwl	zero,1952(zero)
     7d8:	880007bc 	lwl	zero,1980(zero)
     7dc:	c8910003 	lwc2	$17,3(a0)
     7e0:	0007bc00 	sll	s7,a3,0x10
     7e4:	0007c488 	0x7c488
     7e8:	8d000388 	lw	zero,904(t0)
     7ec:	000000c8 	0xc8
     7f0:	00000000 	nop
     7f4:	06a80000 	tgei	s5,0
     7f8:	079c8800 	0x79c8800
     7fc:	00018800 	sll	s1,at,0x0
     800:	00079c67 	0x79c67
     804:	0007bc88 	0x7bc88
     808:	91000388 	lbu	zero,904(t0)
     80c:	07bc00c4 	0x7bc00c4
     810:	07c48800 	0x7c48800
     814:	00038800 	sll	s1,v1,0x0
     818:	0000c48d 	break	0x0,0x312
     81c:	00000000 	nop
     820:	a8000000 	swl	zero,0(zero)
     824:	98880006 	lwr	t0,6(a0)
     828:	01880007 	srav	zero,t0,t4
     82c:	07986e00 	0x7986e00
     830:	07bc8800 	0x7bc8800
     834:	00038800 	sll	s1,v1,0x0
     838:	bc00c091 	cache	0x0,-16239(zero)
     83c:	c4880007 	lwc1	$f8,7(a0)
     840:	03880007 	srav	zero,t0,gp
     844:	00c08d00 	0xc08d00
	...
     850:	880006a8 	lwl	zero,1704(zero)
     854:	880007bc 	lwl	zero,1980(zero)
     858:	98910003 	lwr	s1,3(a0)
     85c:	0007bc7f 	0x7bc7f
     860:	0007c488 	0x7c488
     864:	8d000388 	lw	zero,904(t0)
     868:	00007f98 	0x7f98
     86c:	00000000 	nop
     870:	06a80000 	tgei	s5,0
     874:	07bc8800 	0x7bc8800
     878:	00038800 	sll	s1,v1,0x0
     87c:	bc7f9c91 	cache	0x1f,-25455(v1)
     880:	c4880007 	lwc1	$f8,7(a0)
     884:	03880007 	srav	zero,t0,gp
     888:	7f9c8d00 	0x7f9c8d00
	...
     894:	880006a8 	lwl	zero,1704(zero)
     898:	880007bc 	lwl	zero,1980(zero)
     89c:	a0910003 	sb	s1,3(a0)
     8a0:	0007bc7f 	0x7bc7f
     8a4:	0007c488 	0x7c488
     8a8:	8d000388 	lw	zero,904(t0)
     8ac:	00007fa0 	0x7fa0
     8b0:	00000000 	nop
     8b4:	06a80000 	tgei	s5,0
     8b8:	07bc8800 	0x7bc8800
     8bc:	00038800 	sll	s1,v1,0x0
     8c0:	bc7fa491 	cache	0x1f,-23407(v1)
     8c4:	c4880007 	lwc1	$f8,7(a0)
     8c8:	03880007 	srav	zero,t0,gp
     8cc:	7fa48d00 	0x7fa48d00
	...
     8d8:	880006a8 	lwl	zero,1704(zero)
     8dc:	880007bc 	lwl	zero,1980(zero)
     8e0:	a8910003 	swl	s1,3(a0)
     8e4:	0007bc7f 	0x7bc7f
     8e8:	0007c488 	0x7c488
     8ec:	8d000388 	lw	zero,904(t0)
     8f0:	00007fa8 	0x7fa8
     8f4:	00000000 	nop
     8f8:	06a80000 	tgei	s5,0
     8fc:	07bc8800 	0x7bc8800
     900:	00038800 	sll	s1,v1,0x0
     904:	bc7fac91 	cache	0x1f,-21359(v1)
     908:	c4880007 	lwc1	$f8,7(a0)
     90c:	03880007 	srav	zero,t0,gp
     910:	7fac8d00 	0x7fac8d00
	...
     91c:	880006a8 	lwl	zero,1704(zero)
     920:	880007bc 	lwl	zero,1980(zero)
     924:	b0910003 	0xb0910003
     928:	0007bc7f 	0x7bc7f
     92c:	0007c488 	0x7c488
     930:	8d000388 	lw	zero,904(t0)
     934:	00007fb0 	tge	zero,zero,0x1fe
     938:	00000000 	nop
     93c:	06a80000 	tgei	s5,0
     940:	07bc8800 	0x7bc8800
     944:	00038800 	sll	s1,v1,0x0
     948:	bc7fb491 	cache	0x1f,-19311(v1)
     94c:	c4880007 	lwc1	$f8,7(a0)
     950:	03880007 	srav	zero,t0,gp
     954:	7fb48d00 	0x7fb48d00
	...
     960:	880006a8 	lwl	zero,1704(zero)
     964:	880007bc 	lwl	zero,1980(zero)
     968:	b8910003 	swr	s1,3(a0)
     96c:	0007bc7f 	0x7bc7f
     970:	0007c488 	0x7c488
     974:	8d000388 	lw	zero,904(t0)
     978:	00007fb8 	0x7fb8
     97c:	00000000 	nop
     980:	06a80000 	tgei	s5,0
     984:	07bc8800 	0x7bc8800
     988:	00038800 	sll	s1,v1,0x0
     98c:	bc7fbc91 	cache	0x1f,-17263(v1)
     990:	c4880007 	lwc1	$f8,7(a0)
     994:	03880007 	srav	zero,t0,gp
     998:	7fbc8d00 	0x7fbc8d00
	...
     9a4:	880006a8 	lwl	zero,1704(zero)
     9a8:	880007bc 	lwl	zero,1980(zero)
     9ac:	40910002 	mtc0	s1,$0,2
     9b0:	880007bc 	lwl	zero,1980(zero)
     9b4:	880007c4 	lwl	zero,1988(zero)
     9b8:	408d0002 	mtc0	t5,$0,2
	...
     9c4:	880006a8 	lwl	zero,1704(zero)
     9c8:	880007bc 	lwl	zero,1980(zero)
     9cc:	44910002 	0x44910002
     9d0:	880007bc 	lwl	zero,1980(zero)
     9d4:	880007c4 	lwl	zero,1988(zero)
     9d8:	448d0002 	0x448d0002
	...
     9e4:	880006a8 	lwl	zero,1704(zero)
     9e8:	880007bc 	lwl	zero,1980(zero)
     9ec:	48910002 	mtc2	s1,$0,2
     9f0:	880007bc 	lwl	zero,1980(zero)
     9f4:	880007c4 	lwl	zero,1988(zero)
     9f8:	488d0002 	mtc2	t5,$0,2
	...
     a04:	880006a8 	lwl	zero,1704(zero)
     a08:	880007bc 	lwl	zero,1980(zero)
     a0c:	4c910002 	mtc3	s1,$0,2
     a10:	880007bc 	lwl	zero,1980(zero)
     a14:	880007c4 	lwl	zero,1988(zero)
     a18:	4c8d0002 	mtc3	t5,$0,2
	...
     a24:	880006b4 	lwl	zero,1716(zero)
     a28:	880007bc 	lwl	zero,1980(zero)
     a2c:	bc600001 	cache	0x0,1(v1)
     a30:	c3880007 	ll	t0,7(gp)
     a34:	01880007 	srav	zero,t0,t4
     a38:	07c35400 	bgezl	s8,15a3c <_data-0x7ffea5c4>
     a3c:	07c48800 	0x7c48800
     a40:	00038800 	sll	s1,v1,0x0
     a44:	0000e08d 	break	0x0,0x382
     a48:	00000000 	nop
     a4c:	b4000000 	0xb4000000
     a50:	b4880006 	0xb4880006
     a54:	01880007 	srav	zero,t0,t4
     a58:	07b46100 	0x7b46100
     a5c:	07bc8800 	0x7bc8800
     a60:	00038800 	sll	s1,v1,0x0
     a64:	bc00dc91 	cache	0x0,-9071(zero)
     a68:	c4880007 	lwc1	$f8,7(a0)
     a6c:	03880007 	srav	zero,t0,gp
     a70:	00dc8d00 	0xdc8d00
	...
     a7c:	880006b4 	lwl	zero,1716(zero)
     a80:	880007b0 	lwl	zero,1968(zero)
     a84:	b0620001 	0xb0620001
     a88:	bc880007 	cache	0x8,7(a0)
     a8c:	03880007 	srav	zero,t0,gp
     a90:	00d89100 	0xd89100
     a94:	880007bc 	lwl	zero,1980(zero)
     a98:	880007c4 	lwl	zero,1988(zero)
     a9c:	d88d0003 	ldc2	$13,3(a0)
	...
     aa8:	0006b400 	sll	s6,a2,0x10
     aac:	0007ac88 	0x7ac88
     ab0:	63000188 	0x63000188
     ab4:	880007ac 	lwl	zero,1964(zero)
     ab8:	880007bc 	lwl	zero,1980(zero)
     abc:	d4910003 	ldc1	$f17,3(a0)
     ac0:	0007bc00 	sll	s7,a3,0x10
     ac4:	0007c488 	0x7c488
     ac8:	8d000388 	lw	zero,904(t0)
     acc:	000000d4 	0xd4
     ad0:	00000000 	nop
     ad4:	06b40000 	0x6b40000
     ad8:	07a88800 	tgei	sp,-30720
     adc:	00018800 	sll	s1,at,0x0
     ae0:	0007a864 	0x7a864
     ae4:	0007bc88 	0x7bc88
     ae8:	91000388 	lbu	zero,904(t0)
     aec:	07bc00d0 	0x7bc00d0
     af0:	07c48800 	0x7c48800
     af4:	00038800 	sll	s1,v1,0x0
     af8:	0000d08d 	break	0x0,0x342
     afc:	00000000 	nop
     b00:	b4000000 	0xb4000000
     b04:	a4880006 	sh	t0,6(a0)
     b08:	01880007 	srav	zero,t0,t4
     b0c:	07a46500 	0x7a46500
     b10:	07bc8800 	0x7bc8800
     b14:	00038800 	sll	s1,v1,0x0
     b18:	bc00cc91 	cache	0x0,-13167(zero)
     b1c:	c4880007 	lwc1	$f8,7(a0)
     b20:	03880007 	srav	zero,t0,gp
     b24:	00cc8d00 	0xcc8d00
	...
     b30:	880006b4 	lwl	zero,1716(zero)
     b34:	880007a0 	lwl	zero,1952(zero)
     b38:	a0660001 	sb	a2,1(v1)
     b3c:	bc880007 	cache	0x8,7(a0)
     b40:	03880007 	srav	zero,t0,gp
     b44:	00c89100 	0xc89100
     b48:	880007bc 	lwl	zero,1980(zero)
     b4c:	880007c4 	lwl	zero,1988(zero)
     b50:	c88d0003 	lwc2	$13,3(a0)
	...
     b5c:	0006b400 	sll	s6,a2,0x10
     b60:	00079c88 	0x79c88
     b64:	67000188 	0x67000188
     b68:	8800079c 	lwl	zero,1948(zero)
     b6c:	880007bc 	lwl	zero,1980(zero)
     b70:	c4910003 	lwc1	$f17,3(a0)
     b74:	0007bc00 	sll	s7,a3,0x10
     b78:	0007c488 	0x7c488
     b7c:	8d000388 	lw	zero,904(t0)
     b80:	000000c4 	0xc4
     b84:	00000000 	nop
     b88:	06b40000 	0x6b40000
     b8c:	07988800 	0x7988800
     b90:	00018800 	sll	s1,at,0x0
     b94:	0007986e 	0x7986e
     b98:	0007bc88 	0x7bc88
     b9c:	91000388 	lbu	zero,904(t0)
     ba0:	07bc00c0 	0x7bc00c0
     ba4:	07c48800 	0x7c48800
     ba8:	00038800 	sll	s1,v1,0x0
     bac:	0000c08d 	break	0x0,0x302
     bb0:	00000000 	nop
     bb4:	b4000000 	0xb4000000
     bb8:	bc880006 	cache	0x8,6(a0)
     bbc:	03880007 	srav	zero,t0,gp
     bc0:	7f989100 	0x7f989100
     bc4:	880007bc 	lwl	zero,1980(zero)
     bc8:	880007c4 	lwl	zero,1988(zero)
     bcc:	988d0003 	lwr	t5,3(a0)
     bd0:	0000007f 	0x7f
     bd4:	00000000 	nop
     bd8:	0006b400 	sll	s6,a2,0x10
     bdc:	0007bc88 	0x7bc88
     be0:	91000388 	lbu	zero,904(t0)
     be4:	07bc7f9c 	0x7bc7f9c
     be8:	07c48800 	0x7c48800
     bec:	00038800 	sll	s1,v1,0x0
     bf0:	007f9c8d 	break	0x7f,0x272
     bf4:	00000000 	nop
     bf8:	b4000000 	0xb4000000
     bfc:	bc880006 	cache	0x8,6(a0)
     c00:	03880007 	srav	zero,t0,gp
     c04:	7fa09100 	0x7fa09100
     c08:	880007bc 	lwl	zero,1980(zero)
     c0c:	880007c4 	lwl	zero,1988(zero)
     c10:	a08d0003 	sb	t5,3(a0)
     c14:	0000007f 	0x7f
     c18:	00000000 	nop
     c1c:	0006b400 	sll	s6,a2,0x10
     c20:	0007bc88 	0x7bc88
     c24:	91000388 	lbu	zero,904(t0)
     c28:	07bc7fa4 	0x7bc7fa4
     c2c:	07c48800 	0x7c48800
     c30:	00038800 	sll	s1,v1,0x0
     c34:	007fa48d 	break	0x7f,0x292
     c38:	00000000 	nop
     c3c:	b4000000 	0xb4000000
     c40:	bc880006 	cache	0x8,6(a0)
     c44:	03880007 	srav	zero,t0,gp
     c48:	7fa89100 	0x7fa89100
     c4c:	880007bc 	lwl	zero,1980(zero)
     c50:	880007c4 	lwl	zero,1988(zero)
     c54:	a88d0003 	swl	t5,3(a0)
     c58:	0000007f 	0x7f
     c5c:	00000000 	nop
     c60:	0006b400 	sll	s6,a2,0x10
     c64:	0007bc88 	0x7bc88
     c68:	91000388 	lbu	zero,904(t0)
     c6c:	07bc7fac 	0x7bc7fac
     c70:	07c48800 	0x7c48800
     c74:	00038800 	sll	s1,v1,0x0
     c78:	007fac8d 	break	0x7f,0x2b2
     c7c:	00000000 	nop
     c80:	b4000000 	0xb4000000
     c84:	bc880006 	cache	0x8,6(a0)
     c88:	03880007 	srav	zero,t0,gp
     c8c:	7fb09100 	0x7fb09100
     c90:	880007bc 	lwl	zero,1980(zero)
     c94:	880007c4 	lwl	zero,1988(zero)
     c98:	b08d0003 	0xb08d0003
     c9c:	0000007f 	0x7f
     ca0:	00000000 	nop
     ca4:	0006b400 	sll	s6,a2,0x10
     ca8:	0007bc88 	0x7bc88
     cac:	91000388 	lbu	zero,904(t0)
     cb0:	07bc7fb4 	0x7bc7fb4
     cb4:	07c48800 	0x7c48800
     cb8:	00038800 	sll	s1,v1,0x0
     cbc:	007fb48d 	break	0x7f,0x2d2
     cc0:	00000000 	nop
     cc4:	b4000000 	0xb4000000
     cc8:	bc880006 	cache	0x8,6(a0)
     ccc:	03880007 	srav	zero,t0,gp
     cd0:	7fb89100 	0x7fb89100
     cd4:	880007bc 	lwl	zero,1980(zero)
     cd8:	880007c4 	lwl	zero,1988(zero)
     cdc:	b88d0003 	swr	t5,3(a0)
     ce0:	0000007f 	0x7f
     ce4:	00000000 	nop
     ce8:	0006b400 	sll	s6,a2,0x10
     cec:	0007bc88 	0x7bc88
     cf0:	91000388 	lbu	zero,904(t0)
     cf4:	07bc7fbc 	0x7bc7fbc
     cf8:	07c48800 	0x7c48800
     cfc:	00038800 	sll	s1,v1,0x0
     d00:	007fbc8d 	break	0x7f,0x2f2
     d04:	00000000 	nop
     d08:	b4000000 	0xb4000000
     d0c:	bc880006 	cache	0x8,6(a0)
     d10:	02880007 	srav	zero,t0,s4
     d14:	bc409100 	cache	0x0,-28416(v0)
     d18:	c4880007 	lwc1	$f8,7(a0)
     d1c:	02880007 	srav	zero,t0,s4
     d20:	00408d00 	0x408d00
     d24:	00000000 	nop
     d28:	b4000000 	0xb4000000
     d2c:	bc880006 	cache	0x8,6(a0)
     d30:	02880007 	srav	zero,t0,s4
     d34:	bc449100 	cache	0x4,-28416(v0)
     d38:	c4880007 	lwc1	$f8,7(a0)
     d3c:	02880007 	srav	zero,t0,s4
     d40:	00448d00 	0x448d00
     d44:	00000000 	nop
     d48:	b4000000 	0xb4000000
     d4c:	bc880006 	cache	0x8,6(a0)
     d50:	02880007 	srav	zero,t0,s4
     d54:	bc489100 	cache	0x8,-28416(v0)
     d58:	c4880007 	lwc1	$f8,7(a0)
     d5c:	02880007 	srav	zero,t0,s4
     d60:	00488d00 	0x488d00
     d64:	00000000 	nop
     d68:	c0000000 	ll	zero,0(zero)
     d6c:	bc880006 	cache	0x8,6(a0)
     d70:	01880007 	srav	zero,t0,t4
     d74:	07bc6000 	0x7bc6000
     d78:	07c38800 	bgezl	s8,fffe2d7c <_text_end+0x77fe17e4>
     d7c:	00018800 	sll	s1,at,0x0
     d80:	0007c354 	0x7c354
     d84:	0007c488 	0x7c488
     d88:	8d000388 	lw	zero,904(t0)
     d8c:	000000e0 	0xe0
     d90:	00000000 	nop
     d94:	06c00000 	bltz	s6,d98 <_data-0x7ffff268>
     d98:	07b48800 	0x7b48800
     d9c:	00018800 	sll	s1,at,0x0
     da0:	0007b461 	0x7b461
     da4:	0007bc88 	0x7bc88
     da8:	91000388 	lbu	zero,904(t0)
     dac:	07bc00dc 	0x7bc00dc
     db0:	07c48800 	0x7c48800
     db4:	00038800 	sll	s1,v1,0x0
     db8:	0000dc8d 	break	0x0,0x372
     dbc:	00000000 	nop
     dc0:	c0000000 	ll	zero,0(zero)
     dc4:	b0880006 	0xb0880006
     dc8:	01880007 	srav	zero,t0,t4
     dcc:	07b06200 	bltzal	sp,195d0 <_data-0x7ffe6a30>
     dd0:	07bc8800 	0x7bc8800
     dd4:	00038800 	sll	s1,v1,0x0
     dd8:	bc00d891 	cache	0x0,-10095(zero)
     ddc:	c4880007 	lwc1	$f8,7(a0)
     de0:	03880007 	srav	zero,t0,gp
     de4:	00d88d00 	0xd88d00
	...
     df0:	880006c0 	lwl	zero,1728(zero)
     df4:	880007ac 	lwl	zero,1964(zero)
     df8:	ac630001 	sw	v1,1(v1)
     dfc:	bc880007 	cache	0x8,7(a0)
     e00:	03880007 	srav	zero,t0,gp
     e04:	00d49100 	0xd49100
     e08:	880007bc 	lwl	zero,1980(zero)
     e0c:	880007c4 	lwl	zero,1988(zero)
     e10:	d48d0003 	ldc1	$f13,3(a0)
	...
     e1c:	0006c000 	sll	t8,a2,0x0
     e20:	0007a888 	0x7a888
     e24:	64000188 	0x64000188
     e28:	880007a8 	lwl	zero,1960(zero)
     e2c:	880007bc 	lwl	zero,1980(zero)
     e30:	d0910003 	0xd0910003
     e34:	0007bc00 	sll	s7,a3,0x10
     e38:	0007c488 	0x7c488
     e3c:	8d000388 	lw	zero,904(t0)
     e40:	000000d0 	0xd0
     e44:	00000000 	nop
     e48:	06c00000 	bltz	s6,e4c <_data-0x7ffff1b4>
     e4c:	07a48800 	0x7a48800
     e50:	00018800 	sll	s1,at,0x0
     e54:	0007a465 	0x7a465
     e58:	0007bc88 	0x7bc88
     e5c:	91000388 	lbu	zero,904(t0)
     e60:	07bc00cc 	0x7bc00cc
     e64:	07c48800 	0x7c48800
     e68:	00038800 	sll	s1,v1,0x0
     e6c:	0000cc8d 	break	0x0,0x332
     e70:	00000000 	nop
     e74:	c0000000 	ll	zero,0(zero)
     e78:	a0880006 	sb	t0,6(a0)
     e7c:	01880007 	srav	zero,t0,t4
     e80:	07a06600 	bltz	sp,1a684 <_data-0x7ffe597c>
     e84:	07bc8800 	0x7bc8800
     e88:	00038800 	sll	s1,v1,0x0
     e8c:	bc00c891 	cache	0x0,-14191(zero)
     e90:	c4880007 	lwc1	$f8,7(a0)
     e94:	03880007 	srav	zero,t0,gp
     e98:	00c88d00 	0xc88d00
	...
     ea4:	880006c0 	lwl	zero,1728(zero)
     ea8:	8800079c 	lwl	zero,1948(zero)
     eac:	9c670001 	0x9c670001
     eb0:	bc880007 	cache	0x8,7(a0)
     eb4:	03880007 	srav	zero,t0,gp
     eb8:	00c49100 	0xc49100
     ebc:	880007bc 	lwl	zero,1980(zero)
     ec0:	880007c4 	lwl	zero,1988(zero)
     ec4:	c48d0003 	lwc1	$f13,3(a0)
	...
     ed0:	0006c000 	sll	t8,a2,0x0
     ed4:	00079888 	0x79888
     ed8:	6e000188 	0x6e000188
     edc:	88000798 	lwl	zero,1944(zero)
     ee0:	880007bc 	lwl	zero,1980(zero)
     ee4:	c0910003 	ll	s1,3(a0)
     ee8:	0007bc00 	sll	s7,a3,0x10
     eec:	0007c488 	0x7c488
     ef0:	8d000388 	lw	zero,904(t0)
     ef4:	000000c0 	ehb
     ef8:	00000000 	nop
     efc:	06c00000 	bltz	s6,f00 <_data-0x7ffff100>
     f00:	07bc8800 	0x7bc8800
     f04:	00038800 	sll	s1,v1,0x0
     f08:	bc7f9891 	cache	0x1f,-26479(v1)
     f0c:	c4880007 	lwc1	$f8,7(a0)
     f10:	03880007 	srav	zero,t0,gp
     f14:	7f988d00 	0x7f988d00
	...
     f20:	880006c0 	lwl	zero,1728(zero)
     f24:	880007bc 	lwl	zero,1980(zero)
     f28:	9c910003 	0x9c910003
     f2c:	0007bc7f 	0x7bc7f
     f30:	0007c488 	0x7c488
     f34:	8d000388 	lw	zero,904(t0)
     f38:	00007f9c 	0x7f9c
     f3c:	00000000 	nop
     f40:	06c00000 	bltz	s6,f44 <_data-0x7ffff0bc>
     f44:	07bc8800 	0x7bc8800
     f48:	00038800 	sll	s1,v1,0x0
     f4c:	bc7fa091 	cache	0x1f,-24431(v1)
     f50:	c4880007 	lwc1	$f8,7(a0)
     f54:	03880007 	srav	zero,t0,gp
     f58:	7fa08d00 	0x7fa08d00
	...
     f64:	880006c0 	lwl	zero,1728(zero)
     f68:	880007bc 	lwl	zero,1980(zero)
     f6c:	a4910003 	sh	s1,3(a0)
     f70:	0007bc7f 	0x7bc7f
     f74:	0007c488 	0x7c488
     f78:	8d000388 	lw	zero,904(t0)
     f7c:	00007fa4 	0x7fa4
     f80:	00000000 	nop
     f84:	06c00000 	bltz	s6,f88 <_data-0x7ffff078>
     f88:	07bc8800 	0x7bc8800
     f8c:	00038800 	sll	s1,v1,0x0
     f90:	bc7fa891 	cache	0x1f,-22383(v1)
     f94:	c4880007 	lwc1	$f8,7(a0)
     f98:	03880007 	srav	zero,t0,gp
     f9c:	7fa88d00 	0x7fa88d00
	...
     fa8:	880006c0 	lwl	zero,1728(zero)
     fac:	880007bc 	lwl	zero,1980(zero)
     fb0:	ac910003 	sw	s1,3(a0)
     fb4:	0007bc7f 	0x7bc7f
     fb8:	0007c488 	0x7c488
     fbc:	8d000388 	lw	zero,904(t0)
     fc0:	00007fac 	0x7fac
     fc4:	00000000 	nop
     fc8:	06c00000 	bltz	s6,fcc <_data-0x7ffff034>
     fcc:	07bc8800 	0x7bc8800
     fd0:	00038800 	sll	s1,v1,0x0
     fd4:	bc7fb091 	cache	0x1f,-20335(v1)
     fd8:	c4880007 	lwc1	$f8,7(a0)
     fdc:	03880007 	srav	zero,t0,gp
     fe0:	7fb08d00 	0x7fb08d00
	...
     fec:	880006c0 	lwl	zero,1728(zero)
     ff0:	880007bc 	lwl	zero,1980(zero)
     ff4:	b4910003 	0xb4910003
     ff8:	0007bc7f 	0x7bc7f
     ffc:	0007c488 	0x7c488
    1000:	8d000388 	lw	zero,904(t0)
    1004:	00007fb4 	teq	zero,zero,0x1fe
    1008:	00000000 	nop
    100c:	06c00000 	bltz	s6,1010 <_data-0x7fffeff0>
    1010:	07bc8800 	0x7bc8800
    1014:	00038800 	sll	s1,v1,0x0
    1018:	bc7fb891 	cache	0x1f,-18287(v1)
    101c:	c4880007 	lwc1	$f8,7(a0)
    1020:	03880007 	srav	zero,t0,gp
    1024:	7fb88d00 	0x7fb88d00
	...
    1030:	880006c0 	lwl	zero,1728(zero)
    1034:	880007bc 	lwl	zero,1980(zero)
    1038:	bc910003 	cache	0x11,3(a0)
    103c:	0007bc7f 	0x7bc7f
    1040:	0007c488 	0x7c488
    1044:	8d000388 	lw	zero,904(t0)
    1048:	00007fbc 	0x7fbc
    104c:	00000000 	nop
    1050:	06c00000 	bltz	s6,1054 <_data-0x7fffefac>
    1054:	07bc8800 	0x7bc8800
    1058:	00028800 	sll	s1,v0,0x0
    105c:	07bc4091 	0x7bc4091
    1060:	07c48800 	0x7c48800
    1064:	00028800 	sll	s1,v0,0x0
    1068:	0000408d 	break	0x0,0x102
    106c:	00000000 	nop
    1070:	06c00000 	bltz	s6,1074 <_data-0x7fffef8c>
    1074:	07bc8800 	0x7bc8800
    1078:	00028800 	sll	s1,v0,0x0
    107c:	07bc4491 	0x7bc4491
    1080:	07c48800 	0x7c48800
    1084:	00028800 	sll	s1,v0,0x0
    1088:	0000448d 	break	0x0,0x112
    108c:	00000000 	nop
    1090:	06cc0000 	teqi	s6,0
    1094:	07bc8800 	0x7bc8800
    1098:	00018800 	sll	s1,at,0x0
    109c:	0007bc60 	0x7bc60
    10a0:	0007c388 	0x7c388
    10a4:	54000188 	bnezl	zero,16c8 <_data-0x7fffe938>
    10a8:	880007c3 	lwl	zero,1987(zero)
    10ac:	880007c4 	lwl	zero,1988(zero)
    10b0:	e08d0003 	sc	t5,3(a0)
	...
    10bc:	0006cc00 	sll	t9,a2,0x10
    10c0:	0007b488 	0x7b488
    10c4:	61000188 	0x61000188
    10c8:	880007b4 	lwl	zero,1972(zero)
    10cc:	880007bc 	lwl	zero,1980(zero)
    10d0:	dc910003 	ldc3	$17,3(a0)
    10d4:	0007bc00 	sll	s7,a3,0x10
    10d8:	0007c488 	0x7c488
    10dc:	8d000388 	lw	zero,904(t0)
    10e0:	000000dc 	0xdc
    10e4:	00000000 	nop
    10e8:	06cc0000 	teqi	s6,0
    10ec:	07b08800 	bltzal	sp,fffe30f0 <_text_end+0x77fe1b58>
    10f0:	00018800 	sll	s1,at,0x0
    10f4:	0007b062 	0x7b062
    10f8:	0007bc88 	0x7bc88
    10fc:	91000388 	lbu	zero,904(t0)
    1100:	07bc00d8 	0x7bc00d8
    1104:	07c48800 	0x7c48800
    1108:	00038800 	sll	s1,v1,0x0
    110c:	0000d88d 	break	0x0,0x362
    1110:	00000000 	nop
    1114:	cc000000 	pref	0x0,0(zero)
    1118:	ac880006 	sw	t0,6(a0)
    111c:	01880007 	srav	zero,t0,t4
    1120:	07ac6300 	teqi	sp,25344
    1124:	07bc8800 	0x7bc8800
    1128:	00038800 	sll	s1,v1,0x0
    112c:	bc00d491 	cache	0x0,-11119(zero)
    1130:	c4880007 	lwc1	$f8,7(a0)
    1134:	03880007 	srav	zero,t0,gp
    1138:	00d48d00 	0xd48d00
	...
    1144:	880006cc 	lwl	zero,1740(zero)
    1148:	880007a8 	lwl	zero,1960(zero)
    114c:	a8640001 	swl	a0,1(v1)
    1150:	bc880007 	cache	0x8,7(a0)
    1154:	03880007 	srav	zero,t0,gp
    1158:	00d09100 	0xd09100
    115c:	880007bc 	lwl	zero,1980(zero)
    1160:	880007c4 	lwl	zero,1988(zero)
    1164:	d08d0003 	0xd08d0003
	...
    1170:	0006cc00 	sll	t9,a2,0x10
    1174:	0007a488 	0x7a488
    1178:	65000188 	0x65000188
    117c:	880007a4 	lwl	zero,1956(zero)
    1180:	880007bc 	lwl	zero,1980(zero)
    1184:	cc910003 	pref	0x11,3(a0)
    1188:	0007bc00 	sll	s7,a3,0x10
    118c:	0007c488 	0x7c488
    1190:	8d000388 	lw	zero,904(t0)
    1194:	000000cc 	syscall	0x3
    1198:	00000000 	nop
    119c:	06cc0000 	teqi	s6,0
    11a0:	07a08800 	bltz	sp,fffe31a4 <_text_end+0x77fe1c0c>
    11a4:	00018800 	sll	s1,at,0x0
    11a8:	0007a066 	0x7a066
    11ac:	0007bc88 	0x7bc88
    11b0:	91000388 	lbu	zero,904(t0)
    11b4:	07bc00c8 	0x7bc00c8
    11b8:	07c48800 	0x7c48800
    11bc:	00038800 	sll	s1,v1,0x0
    11c0:	0000c88d 	break	0x0,0x322
    11c4:	00000000 	nop
    11c8:	cc000000 	pref	0x0,0(zero)
    11cc:	9c880006 	0x9c880006
    11d0:	01880007 	srav	zero,t0,t4
    11d4:	079c6700 	0x79c6700
    11d8:	07bc8800 	0x7bc8800
    11dc:	00038800 	sll	s1,v1,0x0
    11e0:	bc00c491 	cache	0x0,-15215(zero)
    11e4:	c4880007 	lwc1	$f8,7(a0)
    11e8:	03880007 	srav	zero,t0,gp
    11ec:	00c48d00 	0xc48d00
	...
    11f8:	880006cc 	lwl	zero,1740(zero)
    11fc:	88000798 	lwl	zero,1944(zero)
    1200:	986e0001 	lwr	t6,1(v1)
    1204:	bc880007 	cache	0x8,7(a0)
    1208:	03880007 	srav	zero,t0,gp
    120c:	00c09100 	0xc09100
    1210:	880007bc 	lwl	zero,1980(zero)
    1214:	880007c4 	lwl	zero,1988(zero)
    1218:	c08d0003 	ll	t5,3(a0)
	...
    1224:	0006cc00 	sll	t9,a2,0x10
    1228:	0007bc88 	0x7bc88
    122c:	91000388 	lbu	zero,904(t0)
    1230:	07bc7f98 	0x7bc7f98
    1234:	07c48800 	0x7c48800
    1238:	00038800 	sll	s1,v1,0x0
    123c:	007f988d 	break	0x7f,0x262
    1240:	00000000 	nop
    1244:	cc000000 	pref	0x0,0(zero)
    1248:	bc880006 	cache	0x8,6(a0)
    124c:	03880007 	srav	zero,t0,gp
    1250:	7f9c9100 	0x7f9c9100
    1254:	880007bc 	lwl	zero,1980(zero)
    1258:	880007c4 	lwl	zero,1988(zero)
    125c:	9c8d0003 	0x9c8d0003
    1260:	0000007f 	0x7f
    1264:	00000000 	nop
    1268:	0006cc00 	sll	t9,a2,0x10
    126c:	0007bc88 	0x7bc88
    1270:	91000388 	lbu	zero,904(t0)
    1274:	07bc7fa0 	0x7bc7fa0
    1278:	07c48800 	0x7c48800
    127c:	00038800 	sll	s1,v1,0x0
    1280:	007fa08d 	break	0x7f,0x282
    1284:	00000000 	nop
    1288:	cc000000 	pref	0x0,0(zero)
    128c:	bc880006 	cache	0x8,6(a0)
    1290:	03880007 	srav	zero,t0,gp
    1294:	7fa49100 	0x7fa49100
    1298:	880007bc 	lwl	zero,1980(zero)
    129c:	880007c4 	lwl	zero,1988(zero)
    12a0:	a48d0003 	sh	t5,3(a0)
    12a4:	0000007f 	0x7f
    12a8:	00000000 	nop
    12ac:	0006cc00 	sll	t9,a2,0x10
    12b0:	0007bc88 	0x7bc88
    12b4:	91000388 	lbu	zero,904(t0)
    12b8:	07bc7fa8 	0x7bc7fa8
    12bc:	07c48800 	0x7c48800
    12c0:	00038800 	sll	s1,v1,0x0
    12c4:	007fa88d 	break	0x7f,0x2a2
    12c8:	00000000 	nop
    12cc:	cc000000 	pref	0x0,0(zero)
    12d0:	bc880006 	cache	0x8,6(a0)
    12d4:	03880007 	srav	zero,t0,gp
    12d8:	7fac9100 	0x7fac9100
    12dc:	880007bc 	lwl	zero,1980(zero)
    12e0:	880007c4 	lwl	zero,1988(zero)
    12e4:	ac8d0003 	sw	t5,3(a0)
    12e8:	0000007f 	0x7f
    12ec:	00000000 	nop
    12f0:	0006cc00 	sll	t9,a2,0x10
    12f4:	0007bc88 	0x7bc88
    12f8:	91000388 	lbu	zero,904(t0)
    12fc:	07bc7fb0 	0x7bc7fb0
    1300:	07c48800 	0x7c48800
    1304:	00038800 	sll	s1,v1,0x0
    1308:	007fb08d 	break	0x7f,0x2c2
    130c:	00000000 	nop
    1310:	cc000000 	pref	0x0,0(zero)
    1314:	bc880006 	cache	0x8,6(a0)
    1318:	03880007 	srav	zero,t0,gp
    131c:	7fb49100 	0x7fb49100
    1320:	880007bc 	lwl	zero,1980(zero)
    1324:	880007c4 	lwl	zero,1988(zero)
    1328:	b48d0003 	0xb48d0003
    132c:	0000007f 	0x7f
    1330:	00000000 	nop
    1334:	0006cc00 	sll	t9,a2,0x10
    1338:	0007bc88 	0x7bc88
    133c:	91000388 	lbu	zero,904(t0)
    1340:	07bc7fb8 	0x7bc7fb8
    1344:	07c48800 	0x7c48800
    1348:	00038800 	sll	s1,v1,0x0
    134c:	007fb88d 	break	0x7f,0x2e2
    1350:	00000000 	nop
    1354:	cc000000 	pref	0x0,0(zero)
    1358:	bc880006 	cache	0x8,6(a0)
    135c:	03880007 	srav	zero,t0,gp
    1360:	7fbc9100 	0x7fbc9100
    1364:	880007bc 	lwl	zero,1980(zero)
    1368:	880007c4 	lwl	zero,1988(zero)
    136c:	bc8d0003 	cache	0xd,3(a0)
    1370:	0000007f 	0x7f
    1374:	00000000 	nop
    1378:	0006cc00 	sll	t9,a2,0x10
    137c:	0007bc88 	0x7bc88
    1380:	91000288 	lbu	zero,648(t0)
    1384:	0007bc40 	sll	s7,a3,0x11
    1388:	0007c488 	0x7c488
    138c:	8d000288 	lw	zero,648(t0)
    1390:	00000040 	ssnop
    1394:	00000000 	nop
    1398:	0006d800 	sll	k1,a2,0x0
    139c:	0007bc88 	0x7bc88
    13a0:	60000188 	0x60000188
    13a4:	880007bc 	lwl	zero,1980(zero)
    13a8:	880007c3 	lwl	zero,1987(zero)
    13ac:	c3540001 	ll	s4,1(k0)
    13b0:	c4880007 	lwc1	$f8,7(a0)
    13b4:	03880007 	srav	zero,t0,gp
    13b8:	00e08d00 	0xe08d00
	...
    13c4:	880006d8 	lwl	zero,1752(zero)
    13c8:	880007b4 	lwl	zero,1972(zero)
    13cc:	b4610001 	0xb4610001
    13d0:	bc880007 	cache	0x8,7(a0)
    13d4:	03880007 	srav	zero,t0,gp
    13d8:	00dc9100 	0xdc9100
    13dc:	880007bc 	lwl	zero,1980(zero)
    13e0:	880007c4 	lwl	zero,1988(zero)
    13e4:	dc8d0003 	ldc3	$13,3(a0)
	...
    13f0:	0006d800 	sll	k1,a2,0x0
    13f4:	0007b088 	0x7b088
    13f8:	62000188 	0x62000188
    13fc:	880007b0 	lwl	zero,1968(zero)
    1400:	880007bc 	lwl	zero,1980(zero)
    1404:	d8910003 	ldc2	$17,3(a0)
    1408:	0007bc00 	sll	s7,a3,0x10
    140c:	0007c488 	0x7c488
    1410:	8d000388 	lw	zero,904(t0)
    1414:	000000d8 	0xd8
    1418:	00000000 	nop
    141c:	06d80000 	0x6d80000
    1420:	07ac8800 	teqi	sp,-30720
    1424:	00018800 	sll	s1,at,0x0
    1428:	0007ac63 	0x7ac63
    142c:	0007bc88 	0x7bc88
    1430:	91000388 	lbu	zero,904(t0)
    1434:	07bc00d4 	0x7bc00d4
    1438:	07c48800 	0x7c48800
    143c:	00038800 	sll	s1,v1,0x0
    1440:	0000d48d 	break	0x0,0x352
    1444:	00000000 	nop
    1448:	d8000000 	ldc2	$0,0(zero)
    144c:	a8880006 	swl	t0,6(a0)
    1450:	01880007 	srav	zero,t0,t4
    1454:	07a86400 	tgei	sp,25600
    1458:	07bc8800 	0x7bc8800
    145c:	00038800 	sll	s1,v1,0x0
    1460:	bc00d091 	cache	0x0,-12143(zero)
    1464:	c4880007 	lwc1	$f8,7(a0)
    1468:	03880007 	srav	zero,t0,gp
    146c:	00d08d00 	0xd08d00
	...
    1478:	880006d8 	lwl	zero,1752(zero)
    147c:	880007a4 	lwl	zero,1956(zero)
    1480:	a4650001 	sh	a1,1(v1)
    1484:	bc880007 	cache	0x8,7(a0)
    1488:	03880007 	srav	zero,t0,gp
    148c:	00cc9100 	0xcc9100
    1490:	880007bc 	lwl	zero,1980(zero)
    1494:	880007c4 	lwl	zero,1988(zero)
    1498:	cc8d0003 	pref	0xd,3(a0)
	...
    14a4:	0006d800 	sll	k1,a2,0x0
    14a8:	0007a088 	0x7a088
    14ac:	66000188 	0x66000188
    14b0:	880007a0 	lwl	zero,1952(zero)
    14b4:	880007bc 	lwl	zero,1980(zero)
    14b8:	c8910003 	lwc2	$17,3(a0)
    14bc:	0007bc00 	sll	s7,a3,0x10
    14c0:	0007c488 	0x7c488
    14c4:	8d000388 	lw	zero,904(t0)
    14c8:	000000c8 	0xc8
    14cc:	00000000 	nop
    14d0:	06d80000 	0x6d80000
    14d4:	079c8800 	0x79c8800
    14d8:	00018800 	sll	s1,at,0x0
    14dc:	00079c67 	0x79c67
    14e0:	0007bc88 	0x7bc88
    14e4:	91000388 	lbu	zero,904(t0)
    14e8:	07bc00c4 	0x7bc00c4
    14ec:	07c48800 	0x7c48800
    14f0:	00038800 	sll	s1,v1,0x0
    14f4:	0000c48d 	break	0x0,0x312
    14f8:	00000000 	nop
    14fc:	d8000000 	ldc2	$0,0(zero)
    1500:	98880006 	lwr	t0,6(a0)
    1504:	01880007 	srav	zero,t0,t4
    1508:	07986e00 	0x7986e00
    150c:	07bc8800 	0x7bc8800
    1510:	00038800 	sll	s1,v1,0x0
    1514:	bc00c091 	cache	0x0,-16239(zero)
    1518:	c4880007 	lwc1	$f8,7(a0)
    151c:	03880007 	srav	zero,t0,gp
    1520:	00c08d00 	0xc08d00
	...
    152c:	880006d8 	lwl	zero,1752(zero)
    1530:	880007bc 	lwl	zero,1980(zero)
    1534:	98910003 	lwr	s1,3(a0)
    1538:	0007bc7f 	0x7bc7f
    153c:	0007c488 	0x7c488
    1540:	8d000388 	lw	zero,904(t0)
    1544:	00007f98 	0x7f98
    1548:	00000000 	nop
    154c:	06d80000 	0x6d80000
    1550:	07bc8800 	0x7bc8800
    1554:	00038800 	sll	s1,v1,0x0
    1558:	bc7f9c91 	cache	0x1f,-25455(v1)
    155c:	c4880007 	lwc1	$f8,7(a0)
    1560:	03880007 	srav	zero,t0,gp
    1564:	7f9c8d00 	0x7f9c8d00
	...
    1570:	880006d8 	lwl	zero,1752(zero)
    1574:	880007bc 	lwl	zero,1980(zero)
    1578:	a0910003 	sb	s1,3(a0)
    157c:	0007bc7f 	0x7bc7f
    1580:	0007c488 	0x7c488
    1584:	8d000388 	lw	zero,904(t0)
    1588:	00007fa0 	0x7fa0
    158c:	00000000 	nop
    1590:	06d80000 	0x6d80000
    1594:	07bc8800 	0x7bc8800
    1598:	00038800 	sll	s1,v1,0x0
    159c:	bc7fa491 	cache	0x1f,-23407(v1)
    15a0:	c4880007 	lwc1	$f8,7(a0)
    15a4:	03880007 	srav	zero,t0,gp
    15a8:	7fa48d00 	0x7fa48d00
	...
    15b4:	880006d8 	lwl	zero,1752(zero)
    15b8:	880007bc 	lwl	zero,1980(zero)
    15bc:	a8910003 	swl	s1,3(a0)
    15c0:	0007bc7f 	0x7bc7f
    15c4:	0007c488 	0x7c488
    15c8:	8d000388 	lw	zero,904(t0)
    15cc:	00007fa8 	0x7fa8
    15d0:	00000000 	nop
    15d4:	06d80000 	0x6d80000
    15d8:	07bc8800 	0x7bc8800
    15dc:	00038800 	sll	s1,v1,0x0
    15e0:	bc7fac91 	cache	0x1f,-21359(v1)
    15e4:	c4880007 	lwc1	$f8,7(a0)
    15e8:	03880007 	srav	zero,t0,gp
    15ec:	7fac8d00 	0x7fac8d00
	...
    15f8:	880006d8 	lwl	zero,1752(zero)
    15fc:	880007bc 	lwl	zero,1980(zero)
    1600:	b0910003 	0xb0910003
    1604:	0007bc7f 	0x7bc7f
    1608:	0007c488 	0x7c488
    160c:	8d000388 	lw	zero,904(t0)
    1610:	00007fb0 	tge	zero,zero,0x1fe
    1614:	00000000 	nop
    1618:	06d80000 	0x6d80000
    161c:	07bc8800 	0x7bc8800
    1620:	00038800 	sll	s1,v1,0x0
    1624:	bc7fb491 	cache	0x1f,-19311(v1)
    1628:	c4880007 	lwc1	$f8,7(a0)
    162c:	03880007 	srav	zero,t0,gp
    1630:	7fb48d00 	0x7fb48d00
	...
    163c:	880006d8 	lwl	zero,1752(zero)
    1640:	880007bc 	lwl	zero,1980(zero)
    1644:	b8910003 	swr	s1,3(a0)
    1648:	0007bc7f 	0x7bc7f
    164c:	0007c488 	0x7c488
    1650:	8d000388 	lw	zero,904(t0)
    1654:	00007fb8 	0x7fb8
    1658:	00000000 	nop
    165c:	06d80000 	0x6d80000
    1660:	07bc8800 	0x7bc8800
    1664:	00038800 	sll	s1,v1,0x0
    1668:	bc7fbc91 	cache	0x1f,-17263(v1)
    166c:	c4880007 	lwc1	$f8,7(a0)
    1670:	03880007 	srav	zero,t0,gp
    1674:	7fbc8d00 	0x7fbc8d00
	...
    1680:	880006e4 	lwl	zero,1764(zero)
    1684:	880007bc 	lwl	zero,1980(zero)
    1688:	bc600001 	cache	0x0,1(v1)
    168c:	c3880007 	ll	t0,7(gp)
    1690:	01880007 	srav	zero,t0,t4
    1694:	07c35400 	bgezl	s8,16698 <_data-0x7ffe9968>
    1698:	07c48800 	0x7c48800
    169c:	00038800 	sll	s1,v1,0x0
    16a0:	0000e08d 	break	0x0,0x382
    16a4:	00000000 	nop
    16a8:	e4000000 	swc1	$f0,0(zero)
    16ac:	b4880006 	0xb4880006
    16b0:	01880007 	srav	zero,t0,t4
    16b4:	07b46100 	0x7b46100
    16b8:	07bc8800 	0x7bc8800
    16bc:	00038800 	sll	s1,v1,0x0
    16c0:	bc00dc91 	cache	0x0,-9071(zero)
    16c4:	c4880007 	lwc1	$f8,7(a0)
    16c8:	03880007 	srav	zero,t0,gp
    16cc:	00dc8d00 	0xdc8d00
	...
    16d8:	880006e4 	lwl	zero,1764(zero)
    16dc:	880007b0 	lwl	zero,1968(zero)
    16e0:	b0620001 	0xb0620001
    16e4:	bc880007 	cache	0x8,7(a0)
    16e8:	03880007 	srav	zero,t0,gp
    16ec:	00d89100 	0xd89100
    16f0:	880007bc 	lwl	zero,1980(zero)
    16f4:	880007c4 	lwl	zero,1988(zero)
    16f8:	d88d0003 	ldc2	$13,3(a0)
	...
    1704:	0006e400 	sll	gp,a2,0x10
    1708:	0007ac88 	0x7ac88
    170c:	63000188 	0x63000188
    1710:	880007ac 	lwl	zero,1964(zero)
    1714:	880007bc 	lwl	zero,1980(zero)
    1718:	d4910003 	ldc1	$f17,3(a0)
    171c:	0007bc00 	sll	s7,a3,0x10
    1720:	0007c488 	0x7c488
    1724:	8d000388 	lw	zero,904(t0)
    1728:	000000d4 	0xd4
    172c:	00000000 	nop
    1730:	06e40000 	0x6e40000
    1734:	07a88800 	tgei	sp,-30720
    1738:	00018800 	sll	s1,at,0x0
    173c:	0007a864 	0x7a864
    1740:	0007bc88 	0x7bc88
    1744:	91000388 	lbu	zero,904(t0)
    1748:	07bc00d0 	0x7bc00d0
    174c:	07c48800 	0x7c48800
    1750:	00038800 	sll	s1,v1,0x0
    1754:	0000d08d 	break	0x0,0x342
    1758:	00000000 	nop
    175c:	e4000000 	swc1	$f0,0(zero)
    1760:	a4880006 	sh	t0,6(a0)
    1764:	01880007 	srav	zero,t0,t4
    1768:	07a46500 	0x7a46500
    176c:	07bc8800 	0x7bc8800
    1770:	00038800 	sll	s1,v1,0x0
    1774:	bc00cc91 	cache	0x0,-13167(zero)
    1778:	c4880007 	lwc1	$f8,7(a0)
    177c:	03880007 	srav	zero,t0,gp
    1780:	00cc8d00 	0xcc8d00
	...
    178c:	880006e4 	lwl	zero,1764(zero)
    1790:	880007a0 	lwl	zero,1952(zero)
    1794:	a0660001 	sb	a2,1(v1)
    1798:	bc880007 	cache	0x8,7(a0)
    179c:	03880007 	srav	zero,t0,gp
    17a0:	00c89100 	0xc89100
    17a4:	880007bc 	lwl	zero,1980(zero)
    17a8:	880007c4 	lwl	zero,1988(zero)
    17ac:	c88d0003 	lwc2	$13,3(a0)
	...
    17b8:	0006e400 	sll	gp,a2,0x10
    17bc:	00079c88 	0x79c88
    17c0:	67000188 	0x67000188
    17c4:	8800079c 	lwl	zero,1948(zero)
    17c8:	880007bc 	lwl	zero,1980(zero)
    17cc:	c4910003 	lwc1	$f17,3(a0)
    17d0:	0007bc00 	sll	s7,a3,0x10
    17d4:	0007c488 	0x7c488
    17d8:	8d000388 	lw	zero,904(t0)
    17dc:	000000c4 	0xc4
    17e0:	00000000 	nop
    17e4:	06e40000 	0x6e40000
    17e8:	07988800 	0x7988800
    17ec:	00018800 	sll	s1,at,0x0
    17f0:	0007986e 	0x7986e
    17f4:	0007bc88 	0x7bc88
    17f8:	91000388 	lbu	zero,904(t0)
    17fc:	07bc00c0 	0x7bc00c0
    1800:	07c48800 	0x7c48800
    1804:	00038800 	sll	s1,v1,0x0
    1808:	0000c08d 	break	0x0,0x302
    180c:	00000000 	nop
    1810:	e4000000 	swc1	$f0,0(zero)
    1814:	bc880006 	cache	0x8,6(a0)
    1818:	03880007 	srav	zero,t0,gp
    181c:	7f989100 	0x7f989100
    1820:	880007bc 	lwl	zero,1980(zero)
    1824:	880007c4 	lwl	zero,1988(zero)
    1828:	988d0003 	lwr	t5,3(a0)
    182c:	0000007f 	0x7f
    1830:	00000000 	nop
    1834:	0006e400 	sll	gp,a2,0x10
    1838:	0007bc88 	0x7bc88
    183c:	91000388 	lbu	zero,904(t0)
    1840:	07bc7f9c 	0x7bc7f9c
    1844:	07c48800 	0x7c48800
    1848:	00038800 	sll	s1,v1,0x0
    184c:	007f9c8d 	break	0x7f,0x272
    1850:	00000000 	nop
    1854:	e4000000 	swc1	$f0,0(zero)
    1858:	bc880006 	cache	0x8,6(a0)
    185c:	03880007 	srav	zero,t0,gp
    1860:	7fa09100 	0x7fa09100
    1864:	880007bc 	lwl	zero,1980(zero)
    1868:	880007c4 	lwl	zero,1988(zero)
    186c:	a08d0003 	sb	t5,3(a0)
    1870:	0000007f 	0x7f
    1874:	00000000 	nop
    1878:	0006e400 	sll	gp,a2,0x10
    187c:	0007bc88 	0x7bc88
    1880:	91000388 	lbu	zero,904(t0)
    1884:	07bc7fa4 	0x7bc7fa4
    1888:	07c48800 	0x7c48800
    188c:	00038800 	sll	s1,v1,0x0
    1890:	007fa48d 	break	0x7f,0x292
    1894:	00000000 	nop
    1898:	e4000000 	swc1	$f0,0(zero)
    189c:	bc880006 	cache	0x8,6(a0)
    18a0:	03880007 	srav	zero,t0,gp
    18a4:	7fa89100 	0x7fa89100
    18a8:	880007bc 	lwl	zero,1980(zero)
    18ac:	880007c4 	lwl	zero,1988(zero)
    18b0:	a88d0003 	swl	t5,3(a0)
    18b4:	0000007f 	0x7f
    18b8:	00000000 	nop
    18bc:	0006e400 	sll	gp,a2,0x10
    18c0:	0007bc88 	0x7bc88
    18c4:	91000388 	lbu	zero,904(t0)
    18c8:	07bc7fac 	0x7bc7fac
    18cc:	07c48800 	0x7c48800
    18d0:	00038800 	sll	s1,v1,0x0
    18d4:	007fac8d 	break	0x7f,0x2b2
    18d8:	00000000 	nop
    18dc:	e4000000 	swc1	$f0,0(zero)
    18e0:	bc880006 	cache	0x8,6(a0)
    18e4:	03880007 	srav	zero,t0,gp
    18e8:	7fb09100 	0x7fb09100
    18ec:	880007bc 	lwl	zero,1980(zero)
    18f0:	880007c4 	lwl	zero,1988(zero)
    18f4:	b08d0003 	0xb08d0003
    18f8:	0000007f 	0x7f
    18fc:	00000000 	nop
    1900:	0006e400 	sll	gp,a2,0x10
    1904:	0007bc88 	0x7bc88
    1908:	91000388 	lbu	zero,904(t0)
    190c:	07bc7fb4 	0x7bc7fb4
    1910:	07c48800 	0x7c48800
    1914:	00038800 	sll	s1,v1,0x0
    1918:	007fb48d 	break	0x7f,0x2d2
    191c:	00000000 	nop
    1920:	e4000000 	swc1	$f0,0(zero)
    1924:	bc880006 	cache	0x8,6(a0)
    1928:	03880007 	srav	zero,t0,gp
    192c:	7fb89100 	0x7fb89100
    1930:	880007bc 	lwl	zero,1980(zero)
    1934:	880007c4 	lwl	zero,1988(zero)
    1938:	b88d0003 	swr	t5,3(a0)
    193c:	0000007f 	0x7f
    1940:	00000000 	nop
    1944:	0006f000 	sll	s8,a2,0x0
    1948:	0007bc88 	0x7bc88
    194c:	60000188 	0x60000188
    1950:	880007bc 	lwl	zero,1980(zero)
    1954:	880007c3 	lwl	zero,1987(zero)
    1958:	c3540001 	ll	s4,1(k0)
    195c:	c4880007 	lwc1	$f8,7(a0)
    1960:	03880007 	srav	zero,t0,gp
    1964:	00e08d00 	0xe08d00
	...
    1970:	880006f0 	lwl	zero,1776(zero)
    1974:	880007b4 	lwl	zero,1972(zero)
    1978:	b4610001 	0xb4610001
    197c:	bc880007 	cache	0x8,7(a0)
    1980:	03880007 	srav	zero,t0,gp
    1984:	00dc9100 	0xdc9100
    1988:	880007bc 	lwl	zero,1980(zero)
    198c:	880007c4 	lwl	zero,1988(zero)
    1990:	dc8d0003 	ldc3	$13,3(a0)
	...
    199c:	0006f000 	sll	s8,a2,0x0
    19a0:	0007b088 	0x7b088
    19a4:	62000188 	0x62000188
    19a8:	880007b0 	lwl	zero,1968(zero)
    19ac:	880007bc 	lwl	zero,1980(zero)
    19b0:	d8910003 	ldc2	$17,3(a0)
    19b4:	0007bc00 	sll	s7,a3,0x10
    19b8:	0007c488 	0x7c488
    19bc:	8d000388 	lw	zero,904(t0)
    19c0:	000000d8 	0xd8
    19c4:	00000000 	nop
    19c8:	06f00000 	bltzal	s7,19cc <_data-0x7fffe634>
    19cc:	07ac8800 	teqi	sp,-30720
    19d0:	00018800 	sll	s1,at,0x0
    19d4:	0007ac63 	0x7ac63
    19d8:	0007bc88 	0x7bc88
    19dc:	91000388 	lbu	zero,904(t0)
    19e0:	07bc00d4 	0x7bc00d4
    19e4:	07c48800 	0x7c48800
    19e8:	00038800 	sll	s1,v1,0x0
    19ec:	0000d48d 	break	0x0,0x352
    19f0:	00000000 	nop
    19f4:	f0000000 	0xf0000000
    19f8:	a8880006 	swl	t0,6(a0)
    19fc:	01880007 	srav	zero,t0,t4
    1a00:	07a86400 	tgei	sp,25600
    1a04:	07bc8800 	0x7bc8800
    1a08:	00038800 	sll	s1,v1,0x0
    1a0c:	bc00d091 	cache	0x0,-12143(zero)
    1a10:	c4880007 	lwc1	$f8,7(a0)
    1a14:	03880007 	srav	zero,t0,gp
    1a18:	00d08d00 	0xd08d00
	...
    1a24:	880006f0 	lwl	zero,1776(zero)
    1a28:	880007a4 	lwl	zero,1956(zero)
    1a2c:	a4650001 	sh	a1,1(v1)
    1a30:	bc880007 	cache	0x8,7(a0)
    1a34:	03880007 	srav	zero,t0,gp
    1a38:	00cc9100 	0xcc9100
    1a3c:	880007bc 	lwl	zero,1980(zero)
    1a40:	880007c4 	lwl	zero,1988(zero)
    1a44:	cc8d0003 	pref	0xd,3(a0)
	...
    1a50:	0006f000 	sll	s8,a2,0x0
    1a54:	0007a088 	0x7a088
    1a58:	66000188 	0x66000188
    1a5c:	880007a0 	lwl	zero,1952(zero)
    1a60:	880007bc 	lwl	zero,1980(zero)
    1a64:	c8910003 	lwc2	$17,3(a0)
    1a68:	0007bc00 	sll	s7,a3,0x10
    1a6c:	0007c488 	0x7c488
    1a70:	8d000388 	lw	zero,904(t0)
    1a74:	000000c8 	0xc8
    1a78:	00000000 	nop
    1a7c:	06f00000 	bltzal	s7,1a80 <_data-0x7fffe580>
    1a80:	079c8800 	0x79c8800
    1a84:	00018800 	sll	s1,at,0x0
    1a88:	00079c67 	0x79c67
    1a8c:	0007bc88 	0x7bc88
    1a90:	91000388 	lbu	zero,904(t0)
    1a94:	07bc00c4 	0x7bc00c4
    1a98:	07c48800 	0x7c48800
    1a9c:	00038800 	sll	s1,v1,0x0
    1aa0:	0000c48d 	break	0x0,0x312
    1aa4:	00000000 	nop
    1aa8:	f0000000 	0xf0000000
    1aac:	98880006 	lwr	t0,6(a0)
    1ab0:	01880007 	srav	zero,t0,t4
    1ab4:	07986e00 	0x7986e00
    1ab8:	07bc8800 	0x7bc8800
    1abc:	00038800 	sll	s1,v1,0x0
    1ac0:	bc00c091 	cache	0x0,-16239(zero)
    1ac4:	c4880007 	lwc1	$f8,7(a0)
    1ac8:	03880007 	srav	zero,t0,gp
    1acc:	00c08d00 	0xc08d00
	...
    1ad8:	880006f0 	lwl	zero,1776(zero)
    1adc:	880007bc 	lwl	zero,1980(zero)
    1ae0:	98910003 	lwr	s1,3(a0)
    1ae4:	0007bc7f 	0x7bc7f
    1ae8:	0007c488 	0x7c488
    1aec:	8d000388 	lw	zero,904(t0)
    1af0:	00007f98 	0x7f98
    1af4:	00000000 	nop
    1af8:	06f00000 	bltzal	s7,1afc <_data-0x7fffe504>
    1afc:	07bc8800 	0x7bc8800
    1b00:	00038800 	sll	s1,v1,0x0
    1b04:	bc7f9c91 	cache	0x1f,-25455(v1)
    1b08:	c4880007 	lwc1	$f8,7(a0)
    1b0c:	03880007 	srav	zero,t0,gp
    1b10:	7f9c8d00 	0x7f9c8d00
	...
    1b1c:	880006f0 	lwl	zero,1776(zero)
    1b20:	880007bc 	lwl	zero,1980(zero)
    1b24:	a0910003 	sb	s1,3(a0)
    1b28:	0007bc7f 	0x7bc7f
    1b2c:	0007c488 	0x7c488
    1b30:	8d000388 	lw	zero,904(t0)
    1b34:	00007fa0 	0x7fa0
    1b38:	00000000 	nop
    1b3c:	06f00000 	bltzal	s7,1b40 <_data-0x7fffe4c0>
    1b40:	07bc8800 	0x7bc8800
    1b44:	00038800 	sll	s1,v1,0x0
    1b48:	bc7fa491 	cache	0x1f,-23407(v1)
    1b4c:	c4880007 	lwc1	$f8,7(a0)
    1b50:	03880007 	srav	zero,t0,gp
    1b54:	7fa48d00 	0x7fa48d00
	...
    1b60:	880006f0 	lwl	zero,1776(zero)
    1b64:	880007bc 	lwl	zero,1980(zero)
    1b68:	a8910003 	swl	s1,3(a0)
    1b6c:	0007bc7f 	0x7bc7f
    1b70:	0007c488 	0x7c488
    1b74:	8d000388 	lw	zero,904(t0)
    1b78:	00007fa8 	0x7fa8
    1b7c:	00000000 	nop
    1b80:	06f00000 	bltzal	s7,1b84 <_data-0x7fffe47c>
    1b84:	07bc8800 	0x7bc8800
    1b88:	00038800 	sll	s1,v1,0x0
    1b8c:	bc7fac91 	cache	0x1f,-21359(v1)
    1b90:	c4880007 	lwc1	$f8,7(a0)
    1b94:	03880007 	srav	zero,t0,gp
    1b98:	7fac8d00 	0x7fac8d00
	...
    1ba4:	880006f0 	lwl	zero,1776(zero)
    1ba8:	880007bc 	lwl	zero,1980(zero)
    1bac:	b0910003 	0xb0910003
    1bb0:	0007bc7f 	0x7bc7f
    1bb4:	0007c488 	0x7c488
    1bb8:	8d000388 	lw	zero,904(t0)
    1bbc:	00007fb0 	tge	zero,zero,0x1fe
    1bc0:	00000000 	nop
    1bc4:	06f00000 	bltzal	s7,1bc8 <_data-0x7fffe438>
    1bc8:	07bc8800 	0x7bc8800
    1bcc:	00038800 	sll	s1,v1,0x0
    1bd0:	bc7fb491 	cache	0x1f,-19311(v1)
    1bd4:	c4880007 	lwc1	$f8,7(a0)
    1bd8:	03880007 	srav	zero,t0,gp
    1bdc:	7fb48d00 	0x7fb48d00
	...
    1be8:	880006fc 	lwl	zero,1788(zero)
    1bec:	880007bc 	lwl	zero,1980(zero)
    1bf0:	bc600001 	cache	0x0,1(v1)
    1bf4:	c3880007 	ll	t0,7(gp)
    1bf8:	01880007 	srav	zero,t0,t4
    1bfc:	07c35400 	bgezl	s8,16c00 <_data-0x7ffe9400>
    1c00:	07c48800 	0x7c48800
    1c04:	00038800 	sll	s1,v1,0x0
    1c08:	0000e08d 	break	0x0,0x382
    1c0c:	00000000 	nop
    1c10:	fc000000 	sdc3	$0,0(zero)
    1c14:	b4880006 	0xb4880006
    1c18:	01880007 	srav	zero,t0,t4
    1c1c:	07b46100 	0x7b46100
    1c20:	07bc8800 	0x7bc8800
    1c24:	00038800 	sll	s1,v1,0x0
    1c28:	bc00dc91 	cache	0x0,-9071(zero)
    1c2c:	c4880007 	lwc1	$f8,7(a0)
    1c30:	03880007 	srav	zero,t0,gp
    1c34:	00dc8d00 	0xdc8d00
	...
    1c40:	880006fc 	lwl	zero,1788(zero)
    1c44:	880007b0 	lwl	zero,1968(zero)
    1c48:	b0620001 	0xb0620001
    1c4c:	bc880007 	cache	0x8,7(a0)
    1c50:	03880007 	srav	zero,t0,gp
    1c54:	00d89100 	0xd89100
    1c58:	880007bc 	lwl	zero,1980(zero)
    1c5c:	880007c4 	lwl	zero,1988(zero)
    1c60:	d88d0003 	ldc2	$13,3(a0)
	...
    1c6c:	0006fc00 	sll	ra,a2,0x10
    1c70:	0007ac88 	0x7ac88
    1c74:	63000188 	0x63000188
    1c78:	880007ac 	lwl	zero,1964(zero)
    1c7c:	880007bc 	lwl	zero,1980(zero)
    1c80:	d4910003 	ldc1	$f17,3(a0)
    1c84:	0007bc00 	sll	s7,a3,0x10
    1c88:	0007c488 	0x7c488
    1c8c:	8d000388 	lw	zero,904(t0)
    1c90:	000000d4 	0xd4
    1c94:	00000000 	nop
    1c98:	06fc0000 	0x6fc0000
    1c9c:	07a88800 	tgei	sp,-30720
    1ca0:	00018800 	sll	s1,at,0x0
    1ca4:	0007a864 	0x7a864
    1ca8:	0007bc88 	0x7bc88
    1cac:	91000388 	lbu	zero,904(t0)
    1cb0:	07bc00d0 	0x7bc00d0
    1cb4:	07c48800 	0x7c48800
    1cb8:	00038800 	sll	s1,v1,0x0
    1cbc:	0000d08d 	break	0x0,0x342
    1cc0:	00000000 	nop
    1cc4:	fc000000 	sdc3	$0,0(zero)
    1cc8:	a4880006 	sh	t0,6(a0)
    1ccc:	01880007 	srav	zero,t0,t4
    1cd0:	07a46500 	0x7a46500
    1cd4:	07bc8800 	0x7bc8800
    1cd8:	00038800 	sll	s1,v1,0x0
    1cdc:	bc00cc91 	cache	0x0,-13167(zero)
    1ce0:	c4880007 	lwc1	$f8,7(a0)
    1ce4:	03880007 	srav	zero,t0,gp
    1ce8:	00cc8d00 	0xcc8d00
	...
    1cf4:	880006fc 	lwl	zero,1788(zero)
    1cf8:	880007a0 	lwl	zero,1952(zero)
    1cfc:	a0660001 	sb	a2,1(v1)
    1d00:	bc880007 	cache	0x8,7(a0)
    1d04:	03880007 	srav	zero,t0,gp
    1d08:	00c89100 	0xc89100
    1d0c:	880007bc 	lwl	zero,1980(zero)
    1d10:	880007c4 	lwl	zero,1988(zero)
    1d14:	c88d0003 	lwc2	$13,3(a0)
	...
    1d20:	0006fc00 	sll	ra,a2,0x10
    1d24:	00079c88 	0x79c88
    1d28:	67000188 	0x67000188
    1d2c:	8800079c 	lwl	zero,1948(zero)
    1d30:	880007bc 	lwl	zero,1980(zero)
    1d34:	c4910003 	lwc1	$f17,3(a0)
    1d38:	0007bc00 	sll	s7,a3,0x10
    1d3c:	0007c488 	0x7c488
    1d40:	8d000388 	lw	zero,904(t0)
    1d44:	000000c4 	0xc4
    1d48:	00000000 	nop
    1d4c:	06fc0000 	0x6fc0000
    1d50:	07988800 	0x7988800
    1d54:	00018800 	sll	s1,at,0x0
    1d58:	0007986e 	0x7986e
    1d5c:	0007bc88 	0x7bc88
    1d60:	91000388 	lbu	zero,904(t0)
    1d64:	07bc00c0 	0x7bc00c0
    1d68:	07c48800 	0x7c48800
    1d6c:	00038800 	sll	s1,v1,0x0
    1d70:	0000c08d 	break	0x0,0x302
    1d74:	00000000 	nop
    1d78:	fc000000 	sdc3	$0,0(zero)
    1d7c:	bc880006 	cache	0x8,6(a0)
    1d80:	03880007 	srav	zero,t0,gp
    1d84:	7f989100 	0x7f989100
    1d88:	880007bc 	lwl	zero,1980(zero)
    1d8c:	880007c4 	lwl	zero,1988(zero)
    1d90:	988d0003 	lwr	t5,3(a0)
    1d94:	0000007f 	0x7f
    1d98:	00000000 	nop
    1d9c:	0006fc00 	sll	ra,a2,0x10
    1da0:	0007bc88 	0x7bc88
    1da4:	91000388 	lbu	zero,904(t0)
    1da8:	07bc7f9c 	0x7bc7f9c
    1dac:	07c48800 	0x7c48800
    1db0:	00038800 	sll	s1,v1,0x0
    1db4:	007f9c8d 	break	0x7f,0x272
    1db8:	00000000 	nop
    1dbc:	fc000000 	sdc3	$0,0(zero)
    1dc0:	bc880006 	cache	0x8,6(a0)
    1dc4:	03880007 	srav	zero,t0,gp
    1dc8:	7fa09100 	0x7fa09100
    1dcc:	880007bc 	lwl	zero,1980(zero)
    1dd0:	880007c4 	lwl	zero,1988(zero)
    1dd4:	a08d0003 	sb	t5,3(a0)
    1dd8:	0000007f 	0x7f
    1ddc:	00000000 	nop
    1de0:	0006fc00 	sll	ra,a2,0x10
    1de4:	0007bc88 	0x7bc88
    1de8:	91000388 	lbu	zero,904(t0)
    1dec:	07bc7fa4 	0x7bc7fa4
    1df0:	07c48800 	0x7c48800
    1df4:	00038800 	sll	s1,v1,0x0
    1df8:	007fa48d 	break	0x7f,0x292
    1dfc:	00000000 	nop
    1e00:	fc000000 	sdc3	$0,0(zero)
    1e04:	bc880006 	cache	0x8,6(a0)
    1e08:	03880007 	srav	zero,t0,gp
    1e0c:	7fa89100 	0x7fa89100
    1e10:	880007bc 	lwl	zero,1980(zero)
    1e14:	880007c4 	lwl	zero,1988(zero)
    1e18:	a88d0003 	swl	t5,3(a0)
    1e1c:	0000007f 	0x7f
    1e20:	00000000 	nop
    1e24:	0006fc00 	sll	ra,a2,0x10
    1e28:	0007bc88 	0x7bc88
    1e2c:	91000388 	lbu	zero,904(t0)
    1e30:	07bc7fac 	0x7bc7fac
    1e34:	07c48800 	0x7c48800
    1e38:	00038800 	sll	s1,v1,0x0
    1e3c:	007fac8d 	break	0x7f,0x2b2
    1e40:	00000000 	nop
    1e44:	fc000000 	sdc3	$0,0(zero)
    1e48:	bc880006 	cache	0x8,6(a0)
    1e4c:	03880007 	srav	zero,t0,gp
    1e50:	7fb09100 	0x7fb09100
    1e54:	880007bc 	lwl	zero,1980(zero)
    1e58:	880007c4 	lwl	zero,1988(zero)
    1e5c:	b08d0003 	0xb08d0003
    1e60:	0000007f 	0x7f
    1e64:	00000000 	nop
    1e68:	00070800 	sll	at,a3,0x0
    1e6c:	0007bc88 	0x7bc88
    1e70:	60000188 	0x60000188
    1e74:	880007bc 	lwl	zero,1980(zero)
    1e78:	880007c3 	lwl	zero,1987(zero)
    1e7c:	c3540001 	ll	s4,1(k0)
    1e80:	c4880007 	lwc1	$f8,7(a0)
    1e84:	03880007 	srav	zero,t0,gp
    1e88:	00e08d00 	0xe08d00
	...
    1e94:	88000708 	lwl	zero,1800(zero)
    1e98:	880007b4 	lwl	zero,1972(zero)
    1e9c:	b4610001 	0xb4610001
    1ea0:	bc880007 	cache	0x8,7(a0)
    1ea4:	03880007 	srav	zero,t0,gp
    1ea8:	00dc9100 	0xdc9100
    1eac:	880007bc 	lwl	zero,1980(zero)
    1eb0:	880007c4 	lwl	zero,1988(zero)
    1eb4:	dc8d0003 	ldc3	$13,3(a0)
	...
    1ec0:	00070800 	sll	at,a3,0x0
    1ec4:	0007b088 	0x7b088
    1ec8:	62000188 	0x62000188
    1ecc:	880007b0 	lwl	zero,1968(zero)
    1ed0:	880007bc 	lwl	zero,1980(zero)
    1ed4:	d8910003 	ldc2	$17,3(a0)
    1ed8:	0007bc00 	sll	s7,a3,0x10
    1edc:	0007c488 	0x7c488
    1ee0:	8d000388 	lw	zero,904(t0)
    1ee4:	000000d8 	0xd8
    1ee8:	00000000 	nop
    1eec:	07080000 	tgei	t8,0
    1ef0:	07ac8800 	teqi	sp,-30720
    1ef4:	00018800 	sll	s1,at,0x0
    1ef8:	0007ac63 	0x7ac63
    1efc:	0007bc88 	0x7bc88
    1f00:	91000388 	lbu	zero,904(t0)
    1f04:	07bc00d4 	0x7bc00d4
    1f08:	07c48800 	0x7c48800
    1f0c:	00038800 	sll	s1,v1,0x0
    1f10:	0000d48d 	break	0x0,0x352
    1f14:	00000000 	nop
    1f18:	08000000 	j	0 <_data-0x80000000>
    1f1c:	a8880007 	swl	t0,7(a0)
    1f20:	01880007 	srav	zero,t0,t4
    1f24:	07a86400 	tgei	sp,25600
    1f28:	07bc8800 	0x7bc8800
    1f2c:	00038800 	sll	s1,v1,0x0
    1f30:	bc00d091 	cache	0x0,-12143(zero)
    1f34:	c4880007 	lwc1	$f8,7(a0)
    1f38:	03880007 	srav	zero,t0,gp
    1f3c:	00d08d00 	0xd08d00
	...
    1f48:	88000708 	lwl	zero,1800(zero)
    1f4c:	880007a4 	lwl	zero,1956(zero)
    1f50:	a4650001 	sh	a1,1(v1)
    1f54:	bc880007 	cache	0x8,7(a0)
    1f58:	03880007 	srav	zero,t0,gp
    1f5c:	00cc9100 	0xcc9100
    1f60:	880007bc 	lwl	zero,1980(zero)
    1f64:	880007c4 	lwl	zero,1988(zero)
    1f68:	cc8d0003 	pref	0xd,3(a0)
	...
    1f74:	00070800 	sll	at,a3,0x0
    1f78:	0007a088 	0x7a088
    1f7c:	66000188 	0x66000188
    1f80:	880007a0 	lwl	zero,1952(zero)
    1f84:	880007bc 	lwl	zero,1980(zero)
    1f88:	c8910003 	lwc2	$17,3(a0)
    1f8c:	0007bc00 	sll	s7,a3,0x10
    1f90:	0007c488 	0x7c488
    1f94:	8d000388 	lw	zero,904(t0)
    1f98:	000000c8 	0xc8
    1f9c:	00000000 	nop
    1fa0:	07080000 	tgei	t8,0
    1fa4:	079c8800 	0x79c8800
    1fa8:	00018800 	sll	s1,at,0x0
    1fac:	00079c67 	0x79c67
    1fb0:	0007bc88 	0x7bc88
    1fb4:	91000388 	lbu	zero,904(t0)
    1fb8:	07bc00c4 	0x7bc00c4
    1fbc:	07c48800 	0x7c48800
    1fc0:	00038800 	sll	s1,v1,0x0
    1fc4:	0000c48d 	break	0x0,0x312
    1fc8:	00000000 	nop
    1fcc:	08000000 	j	0 <_data-0x80000000>
    1fd0:	98880007 	lwr	t0,7(a0)
    1fd4:	01880007 	srav	zero,t0,t4
    1fd8:	07986e00 	0x7986e00
    1fdc:	07bc8800 	0x7bc8800
    1fe0:	00038800 	sll	s1,v1,0x0
    1fe4:	bc00c091 	cache	0x0,-16239(zero)
    1fe8:	c4880007 	lwc1	$f8,7(a0)
    1fec:	03880007 	srav	zero,t0,gp
    1ff0:	00c08d00 	0xc08d00
	...
    1ffc:	88000708 	lwl	zero,1800(zero)
    2000:	880007bc 	lwl	zero,1980(zero)
    2004:	98910003 	lwr	s1,3(a0)
    2008:	0007bc7f 	0x7bc7f
    200c:	0007c488 	0x7c488
    2010:	8d000388 	lw	zero,904(t0)
    2014:	00007f98 	0x7f98
    2018:	00000000 	nop
    201c:	07080000 	tgei	t8,0
    2020:	07bc8800 	0x7bc8800
    2024:	00038800 	sll	s1,v1,0x0
    2028:	bc7f9c91 	cache	0x1f,-25455(v1)
    202c:	c4880007 	lwc1	$f8,7(a0)
    2030:	03880007 	srav	zero,t0,gp
    2034:	7f9c8d00 	0x7f9c8d00
	...
    2040:	88000708 	lwl	zero,1800(zero)
    2044:	880007bc 	lwl	zero,1980(zero)
    2048:	a0910003 	sb	s1,3(a0)
    204c:	0007bc7f 	0x7bc7f
    2050:	0007c488 	0x7c488
    2054:	8d000388 	lw	zero,904(t0)
    2058:	00007fa0 	0x7fa0
    205c:	00000000 	nop
    2060:	07080000 	tgei	t8,0
    2064:	07bc8800 	0x7bc8800
    2068:	00038800 	sll	s1,v1,0x0
    206c:	bc7fa491 	cache	0x1f,-23407(v1)
    2070:	c4880007 	lwc1	$f8,7(a0)
    2074:	03880007 	srav	zero,t0,gp
    2078:	7fa48d00 	0x7fa48d00
	...
    2084:	88000708 	lwl	zero,1800(zero)
    2088:	880007bc 	lwl	zero,1980(zero)
    208c:	a8910003 	swl	s1,3(a0)
    2090:	0007bc7f 	0x7bc7f
    2094:	0007c488 	0x7c488
    2098:	8d000388 	lw	zero,904(t0)
    209c:	00007fa8 	0x7fa8
    20a0:	00000000 	nop
    20a4:	07080000 	tgei	t8,0
    20a8:	07bc8800 	0x7bc8800
    20ac:	00038800 	sll	s1,v1,0x0
    20b0:	bc7fac91 	cache	0x1f,-21359(v1)
    20b4:	c4880007 	lwc1	$f8,7(a0)
    20b8:	03880007 	srav	zero,t0,gp
    20bc:	7fac8d00 	0x7fac8d00
	...
    20c8:	88000714 	lwl	zero,1812(zero)
    20cc:	880007bc 	lwl	zero,1980(zero)
    20d0:	bc600001 	cache	0x0,1(v1)
    20d4:	c3880007 	ll	t0,7(gp)
    20d8:	01880007 	srav	zero,t0,t4
    20dc:	07c35400 	bgezl	s8,170e0 <_data-0x7ffe8f20>
    20e0:	07c48800 	0x7c48800
    20e4:	00038800 	sll	s1,v1,0x0
    20e8:	0000e08d 	break	0x0,0x382
    20ec:	00000000 	nop
    20f0:	14000000 	bnez	zero,20f4 <_data-0x7fffdf0c>
    20f4:	b4880007 	0xb4880007
    20f8:	01880007 	srav	zero,t0,t4
    20fc:	07b46100 	0x7b46100
    2100:	07bc8800 	0x7bc8800
    2104:	00038800 	sll	s1,v1,0x0
    2108:	bc00dc91 	cache	0x0,-9071(zero)
    210c:	c4880007 	lwc1	$f8,7(a0)
    2110:	03880007 	srav	zero,t0,gp
    2114:	00dc8d00 	0xdc8d00
	...
    2120:	88000714 	lwl	zero,1812(zero)
    2124:	880007b0 	lwl	zero,1968(zero)
    2128:	b0620001 	0xb0620001
    212c:	bc880007 	cache	0x8,7(a0)
    2130:	03880007 	srav	zero,t0,gp
    2134:	00d89100 	0xd89100
    2138:	880007bc 	lwl	zero,1980(zero)
    213c:	880007c4 	lwl	zero,1988(zero)
    2140:	d88d0003 	ldc2	$13,3(a0)
	...
    214c:	00071400 	sll	v0,a3,0x10
    2150:	0007ac88 	0x7ac88
    2154:	63000188 	0x63000188
    2158:	880007ac 	lwl	zero,1964(zero)
    215c:	880007bc 	lwl	zero,1980(zero)
    2160:	d4910003 	ldc1	$f17,3(a0)
    2164:	0007bc00 	sll	s7,a3,0x10
    2168:	0007c488 	0x7c488
    216c:	8d000388 	lw	zero,904(t0)
    2170:	000000d4 	0xd4
    2174:	00000000 	nop
    2178:	07140000 	0x7140000
    217c:	07a88800 	tgei	sp,-30720
    2180:	00018800 	sll	s1,at,0x0
    2184:	0007a864 	0x7a864
    2188:	0007bc88 	0x7bc88
    218c:	91000388 	lbu	zero,904(t0)
    2190:	07bc00d0 	0x7bc00d0
    2194:	07c48800 	0x7c48800
    2198:	00038800 	sll	s1,v1,0x0
    219c:	0000d08d 	break	0x0,0x342
    21a0:	00000000 	nop
    21a4:	14000000 	bnez	zero,21a8 <_data-0x7fffde58>
    21a8:	a4880007 	sh	t0,7(a0)
    21ac:	01880007 	srav	zero,t0,t4
    21b0:	07a46500 	0x7a46500
    21b4:	07bc8800 	0x7bc8800
    21b8:	00038800 	sll	s1,v1,0x0
    21bc:	bc00cc91 	cache	0x0,-13167(zero)
    21c0:	c4880007 	lwc1	$f8,7(a0)
    21c4:	03880007 	srav	zero,t0,gp
    21c8:	00cc8d00 	0xcc8d00
	...
    21d4:	88000714 	lwl	zero,1812(zero)
    21d8:	880007a0 	lwl	zero,1952(zero)
    21dc:	a0660001 	sb	a2,1(v1)
    21e0:	bc880007 	cache	0x8,7(a0)
    21e4:	03880007 	srav	zero,t0,gp
    21e8:	00c89100 	0xc89100
    21ec:	880007bc 	lwl	zero,1980(zero)
    21f0:	880007c4 	lwl	zero,1988(zero)
    21f4:	c88d0003 	lwc2	$13,3(a0)
	...
    2200:	00071400 	sll	v0,a3,0x10
    2204:	00079c88 	0x79c88
    2208:	67000188 	0x67000188
    220c:	8800079c 	lwl	zero,1948(zero)
    2210:	880007bc 	lwl	zero,1980(zero)
    2214:	c4910003 	lwc1	$f17,3(a0)
    2218:	0007bc00 	sll	s7,a3,0x10
    221c:	0007c488 	0x7c488
    2220:	8d000388 	lw	zero,904(t0)
    2224:	000000c4 	0xc4
    2228:	00000000 	nop
    222c:	07140000 	0x7140000
    2230:	07988800 	0x7988800
    2234:	00018800 	sll	s1,at,0x0
    2238:	0007986e 	0x7986e
    223c:	0007bc88 	0x7bc88
    2240:	91000388 	lbu	zero,904(t0)
    2244:	07bc00c0 	0x7bc00c0
    2248:	07c48800 	0x7c48800
    224c:	00038800 	sll	s1,v1,0x0
    2250:	0000c08d 	break	0x0,0x302
    2254:	00000000 	nop
    2258:	14000000 	bnez	zero,225c <_data-0x7fffdda4>
    225c:	bc880007 	cache	0x8,7(a0)
    2260:	03880007 	srav	zero,t0,gp
    2264:	7f989100 	0x7f989100
    2268:	880007bc 	lwl	zero,1980(zero)
    226c:	880007c4 	lwl	zero,1988(zero)
    2270:	988d0003 	lwr	t5,3(a0)
    2274:	0000007f 	0x7f
    2278:	00000000 	nop
    227c:	00071400 	sll	v0,a3,0x10
    2280:	0007bc88 	0x7bc88
    2284:	91000388 	lbu	zero,904(t0)
    2288:	07bc7f9c 	0x7bc7f9c
    228c:	07c48800 	0x7c48800
    2290:	00038800 	sll	s1,v1,0x0
    2294:	007f9c8d 	break	0x7f,0x272
    2298:	00000000 	nop
    229c:	14000000 	bnez	zero,22a0 <_data-0x7fffdd60>
    22a0:	bc880007 	cache	0x8,7(a0)
    22a4:	03880007 	srav	zero,t0,gp
    22a8:	7fa09100 	0x7fa09100
    22ac:	880007bc 	lwl	zero,1980(zero)
    22b0:	880007c4 	lwl	zero,1988(zero)
    22b4:	a08d0003 	sb	t5,3(a0)
    22b8:	0000007f 	0x7f
    22bc:	00000000 	nop
    22c0:	00071400 	sll	v0,a3,0x10
    22c4:	0007bc88 	0x7bc88
    22c8:	91000388 	lbu	zero,904(t0)
    22cc:	07bc7fa4 	0x7bc7fa4
    22d0:	07c48800 	0x7c48800
    22d4:	00038800 	sll	s1,v1,0x0
    22d8:	007fa48d 	break	0x7f,0x292
    22dc:	00000000 	nop
    22e0:	14000000 	bnez	zero,22e4 <_data-0x7fffdd1c>
    22e4:	bc880007 	cache	0x8,7(a0)
    22e8:	03880007 	srav	zero,t0,gp
    22ec:	7fa89100 	0x7fa89100
    22f0:	880007bc 	lwl	zero,1980(zero)
    22f4:	880007c4 	lwl	zero,1988(zero)
    22f8:	a88d0003 	swl	t5,3(a0)
    22fc:	0000007f 	0x7f
    2300:	00000000 	nop
    2304:	00072000 	sll	a0,a3,0x0
    2308:	0007bc88 	0x7bc88
    230c:	60000188 	0x60000188
    2310:	880007bc 	lwl	zero,1980(zero)
    2314:	880007c3 	lwl	zero,1987(zero)
    2318:	c3540001 	ll	s4,1(k0)
    231c:	c4880007 	lwc1	$f8,7(a0)
    2320:	03880007 	srav	zero,t0,gp
    2324:	00e08d00 	0xe08d00
	...
    2330:	88000720 	lwl	zero,1824(zero)
    2334:	880007b4 	lwl	zero,1972(zero)
    2338:	b4610001 	0xb4610001
    233c:	bc880007 	cache	0x8,7(a0)
    2340:	03880007 	srav	zero,t0,gp
    2344:	00dc9100 	0xdc9100
    2348:	880007bc 	lwl	zero,1980(zero)
    234c:	880007c4 	lwl	zero,1988(zero)
    2350:	dc8d0003 	ldc3	$13,3(a0)
	...
    235c:	00072000 	sll	a0,a3,0x0
    2360:	0007b088 	0x7b088
    2364:	62000188 	0x62000188
    2368:	880007b0 	lwl	zero,1968(zero)
    236c:	880007bc 	lwl	zero,1980(zero)
    2370:	d8910003 	ldc2	$17,3(a0)
    2374:	0007bc00 	sll	s7,a3,0x10
    2378:	0007c488 	0x7c488
    237c:	8d000388 	lw	zero,904(t0)
    2380:	000000d8 	0xd8
    2384:	00000000 	nop
    2388:	07200000 	bltz	t9,238c <_data-0x7fffdc74>
    238c:	07ac8800 	teqi	sp,-30720
    2390:	00018800 	sll	s1,at,0x0
    2394:	0007ac63 	0x7ac63
    2398:	0007bc88 	0x7bc88
    239c:	91000388 	lbu	zero,904(t0)
    23a0:	07bc00d4 	0x7bc00d4
    23a4:	07c48800 	0x7c48800
    23a8:	00038800 	sll	s1,v1,0x0
    23ac:	0000d48d 	break	0x0,0x352
    23b0:	00000000 	nop
    23b4:	20000000 	addi	zero,zero,0
    23b8:	a8880007 	swl	t0,7(a0)
    23bc:	01880007 	srav	zero,t0,t4
    23c0:	07a86400 	tgei	sp,25600
    23c4:	07bc8800 	0x7bc8800
    23c8:	00038800 	sll	s1,v1,0x0
    23cc:	bc00d091 	cache	0x0,-12143(zero)
    23d0:	c4880007 	lwc1	$f8,7(a0)
    23d4:	03880007 	srav	zero,t0,gp
    23d8:	00d08d00 	0xd08d00
	...
    23e4:	88000720 	lwl	zero,1824(zero)
    23e8:	880007a4 	lwl	zero,1956(zero)
    23ec:	a4650001 	sh	a1,1(v1)
    23f0:	bc880007 	cache	0x8,7(a0)
    23f4:	03880007 	srav	zero,t0,gp
    23f8:	00cc9100 	0xcc9100
    23fc:	880007bc 	lwl	zero,1980(zero)
    2400:	880007c4 	lwl	zero,1988(zero)
    2404:	cc8d0003 	pref	0xd,3(a0)
	...
    2410:	00072000 	sll	a0,a3,0x0
    2414:	0007a088 	0x7a088
    2418:	66000188 	0x66000188
    241c:	880007a0 	lwl	zero,1952(zero)
    2420:	880007bc 	lwl	zero,1980(zero)
    2424:	c8910003 	lwc2	$17,3(a0)
    2428:	0007bc00 	sll	s7,a3,0x10
    242c:	0007c488 	0x7c488
    2430:	8d000388 	lw	zero,904(t0)
    2434:	000000c8 	0xc8
    2438:	00000000 	nop
    243c:	07200000 	bltz	t9,2440 <_data-0x7fffdbc0>
    2440:	079c8800 	0x79c8800
    2444:	00018800 	sll	s1,at,0x0
    2448:	00079c67 	0x79c67
    244c:	0007bc88 	0x7bc88
    2450:	91000388 	lbu	zero,904(t0)
    2454:	07bc00c4 	0x7bc00c4
    2458:	07c48800 	0x7c48800
    245c:	00038800 	sll	s1,v1,0x0
    2460:	0000c48d 	break	0x0,0x312
    2464:	00000000 	nop
    2468:	20000000 	addi	zero,zero,0
    246c:	98880007 	lwr	t0,7(a0)
    2470:	01880007 	srav	zero,t0,t4
    2474:	07986e00 	0x7986e00
    2478:	07bc8800 	0x7bc8800
    247c:	00038800 	sll	s1,v1,0x0
    2480:	bc00c091 	cache	0x0,-16239(zero)
    2484:	c4880007 	lwc1	$f8,7(a0)
    2488:	03880007 	srav	zero,t0,gp
    248c:	00c08d00 	0xc08d00
	...
    2498:	88000720 	lwl	zero,1824(zero)
    249c:	880007bc 	lwl	zero,1980(zero)
    24a0:	98910003 	lwr	s1,3(a0)
    24a4:	0007bc7f 	0x7bc7f
    24a8:	0007c488 	0x7c488
    24ac:	8d000388 	lw	zero,904(t0)
    24b0:	00007f98 	0x7f98
    24b4:	00000000 	nop
    24b8:	07200000 	bltz	t9,24bc <_data-0x7fffdb44>
    24bc:	07bc8800 	0x7bc8800
    24c0:	00038800 	sll	s1,v1,0x0
    24c4:	bc7f9c91 	cache	0x1f,-25455(v1)
    24c8:	c4880007 	lwc1	$f8,7(a0)
    24cc:	03880007 	srav	zero,t0,gp
    24d0:	7f9c8d00 	0x7f9c8d00
	...
    24dc:	88000720 	lwl	zero,1824(zero)
    24e0:	880007bc 	lwl	zero,1980(zero)
    24e4:	a0910003 	sb	s1,3(a0)
    24e8:	0007bc7f 	0x7bc7f
    24ec:	0007c488 	0x7c488
    24f0:	8d000388 	lw	zero,904(t0)
    24f4:	00007fa0 	0x7fa0
    24f8:	00000000 	nop
    24fc:	07200000 	bltz	t9,2500 <_data-0x7fffdb00>
    2500:	07bc8800 	0x7bc8800
    2504:	00038800 	sll	s1,v1,0x0
    2508:	bc7fa491 	cache	0x1f,-23407(v1)
    250c:	c4880007 	lwc1	$f8,7(a0)
    2510:	03880007 	srav	zero,t0,gp
    2514:	7fa48d00 	0x7fa48d00
	...
    2520:	8800072c 	lwl	zero,1836(zero)
    2524:	880007bc 	lwl	zero,1980(zero)
    2528:	bc600001 	cache	0x0,1(v1)
    252c:	c3880007 	ll	t0,7(gp)
    2530:	01880007 	srav	zero,t0,t4
    2534:	07c35400 	bgezl	s8,17538 <_data-0x7ffe8ac8>
    2538:	07c48800 	0x7c48800
    253c:	00038800 	sll	s1,v1,0x0
    2540:	0000e08d 	break	0x0,0x382
    2544:	00000000 	nop
    2548:	2c000000 	sltiu	zero,zero,0
    254c:	b4880007 	0xb4880007
    2550:	01880007 	srav	zero,t0,t4
    2554:	07b46100 	0x7b46100
    2558:	07bc8800 	0x7bc8800
    255c:	00038800 	sll	s1,v1,0x0
    2560:	bc00dc91 	cache	0x0,-9071(zero)
    2564:	c4880007 	lwc1	$f8,7(a0)
    2568:	03880007 	srav	zero,t0,gp
    256c:	00dc8d00 	0xdc8d00
	...
    2578:	8800072c 	lwl	zero,1836(zero)
    257c:	880007b0 	lwl	zero,1968(zero)
    2580:	b0620001 	0xb0620001
    2584:	bc880007 	cache	0x8,7(a0)
    2588:	03880007 	srav	zero,t0,gp
    258c:	00d89100 	0xd89100
    2590:	880007bc 	lwl	zero,1980(zero)
    2594:	880007c4 	lwl	zero,1988(zero)
    2598:	d88d0003 	ldc2	$13,3(a0)
	...
    25a4:	00072c00 	sll	a1,a3,0x10
    25a8:	0007ac88 	0x7ac88
    25ac:	63000188 	0x63000188
    25b0:	880007ac 	lwl	zero,1964(zero)
    25b4:	880007bc 	lwl	zero,1980(zero)
    25b8:	d4910003 	ldc1	$f17,3(a0)
    25bc:	0007bc00 	sll	s7,a3,0x10
    25c0:	0007c488 	0x7c488
    25c4:	8d000388 	lw	zero,904(t0)
    25c8:	000000d4 	0xd4
    25cc:	00000000 	nop
    25d0:	072c0000 	teqi	t9,0
    25d4:	07a88800 	tgei	sp,-30720
    25d8:	00018800 	sll	s1,at,0x0
    25dc:	0007a864 	0x7a864
    25e0:	0007bc88 	0x7bc88
    25e4:	91000388 	lbu	zero,904(t0)
    25e8:	07bc00d0 	0x7bc00d0
    25ec:	07c48800 	0x7c48800
    25f0:	00038800 	sll	s1,v1,0x0
    25f4:	0000d08d 	break	0x0,0x342
    25f8:	00000000 	nop
    25fc:	2c000000 	sltiu	zero,zero,0
    2600:	a4880007 	sh	t0,7(a0)
    2604:	01880007 	srav	zero,t0,t4
    2608:	07a46500 	0x7a46500
    260c:	07bc8800 	0x7bc8800
    2610:	00038800 	sll	s1,v1,0x0
    2614:	bc00cc91 	cache	0x0,-13167(zero)
    2618:	c4880007 	lwc1	$f8,7(a0)
    261c:	03880007 	srav	zero,t0,gp
    2620:	00cc8d00 	0xcc8d00
	...
    262c:	8800072c 	lwl	zero,1836(zero)
    2630:	880007a0 	lwl	zero,1952(zero)
    2634:	a0660001 	sb	a2,1(v1)
    2638:	bc880007 	cache	0x8,7(a0)
    263c:	03880007 	srav	zero,t0,gp
    2640:	00c89100 	0xc89100
    2644:	880007bc 	lwl	zero,1980(zero)
    2648:	880007c4 	lwl	zero,1988(zero)
    264c:	c88d0003 	lwc2	$13,3(a0)
	...
    2658:	00072c00 	sll	a1,a3,0x10
    265c:	00079c88 	0x79c88
    2660:	67000188 	0x67000188
    2664:	8800079c 	lwl	zero,1948(zero)
    2668:	880007bc 	lwl	zero,1980(zero)
    266c:	c4910003 	lwc1	$f17,3(a0)
    2670:	0007bc00 	sll	s7,a3,0x10
    2674:	0007c488 	0x7c488
    2678:	8d000388 	lw	zero,904(t0)
    267c:	000000c4 	0xc4
    2680:	00000000 	nop
    2684:	072c0000 	teqi	t9,0
    2688:	07988800 	0x7988800
    268c:	00018800 	sll	s1,at,0x0
    2690:	0007986e 	0x7986e
    2694:	0007bc88 	0x7bc88
    2698:	91000388 	lbu	zero,904(t0)
    269c:	07bc00c0 	0x7bc00c0
    26a0:	07c48800 	0x7c48800
    26a4:	00038800 	sll	s1,v1,0x0
    26a8:	0000c08d 	break	0x0,0x302
    26ac:	00000000 	nop
    26b0:	2c000000 	sltiu	zero,zero,0
    26b4:	bc880007 	cache	0x8,7(a0)
    26b8:	03880007 	srav	zero,t0,gp
    26bc:	7f989100 	0x7f989100
    26c0:	880007bc 	lwl	zero,1980(zero)
    26c4:	880007c4 	lwl	zero,1988(zero)
    26c8:	988d0003 	lwr	t5,3(a0)
    26cc:	0000007f 	0x7f
    26d0:	00000000 	nop
    26d4:	00072c00 	sll	a1,a3,0x10
    26d8:	0007bc88 	0x7bc88
    26dc:	91000388 	lbu	zero,904(t0)
    26e0:	07bc7f9c 	0x7bc7f9c
    26e4:	07c48800 	0x7c48800
    26e8:	00038800 	sll	s1,v1,0x0
    26ec:	007f9c8d 	break	0x7f,0x272
    26f0:	00000000 	nop
    26f4:	2c000000 	sltiu	zero,zero,0
    26f8:	bc880007 	cache	0x8,7(a0)
    26fc:	03880007 	srav	zero,t0,gp
    2700:	7fa09100 	0x7fa09100
    2704:	880007bc 	lwl	zero,1980(zero)
    2708:	880007c4 	lwl	zero,1988(zero)
    270c:	a08d0003 	sb	t5,3(a0)
    2710:	0000007f 	0x7f
    2714:	00000000 	nop
    2718:	00073800 	sll	a3,a3,0x0
    271c:	0007bc88 	0x7bc88
    2720:	60000188 	0x60000188
    2724:	880007bc 	lwl	zero,1980(zero)
    2728:	880007c3 	lwl	zero,1987(zero)
    272c:	c3540001 	ll	s4,1(k0)
    2730:	c4880007 	lwc1	$f8,7(a0)
    2734:	03880007 	srav	zero,t0,gp
    2738:	00e08d00 	0xe08d00
	...
    2744:	88000738 	lwl	zero,1848(zero)
    2748:	880007b4 	lwl	zero,1972(zero)
    274c:	b4610001 	0xb4610001
    2750:	bc880007 	cache	0x8,7(a0)
    2754:	03880007 	srav	zero,t0,gp
    2758:	00dc9100 	0xdc9100
    275c:	880007bc 	lwl	zero,1980(zero)
    2760:	880007c4 	lwl	zero,1988(zero)
    2764:	dc8d0003 	ldc3	$13,3(a0)
	...
    2770:	00073800 	sll	a3,a3,0x0
    2774:	0007b088 	0x7b088
    2778:	62000188 	0x62000188
    277c:	880007b0 	lwl	zero,1968(zero)
    2780:	880007bc 	lwl	zero,1980(zero)
    2784:	d8910003 	ldc2	$17,3(a0)
    2788:	0007bc00 	sll	s7,a3,0x10
    278c:	0007c488 	0x7c488
    2790:	8d000388 	lw	zero,904(t0)
    2794:	000000d8 	0xd8
    2798:	00000000 	nop
    279c:	07380000 	0x7380000
    27a0:	07ac8800 	teqi	sp,-30720
    27a4:	00018800 	sll	s1,at,0x0
    27a8:	0007ac63 	0x7ac63
    27ac:	0007bc88 	0x7bc88
    27b0:	91000388 	lbu	zero,904(t0)
    27b4:	07bc00d4 	0x7bc00d4
    27b8:	07c48800 	0x7c48800
    27bc:	00038800 	sll	s1,v1,0x0
    27c0:	0000d48d 	break	0x0,0x352
    27c4:	00000000 	nop
    27c8:	38000000 	xori	zero,zero,0x0
    27cc:	a8880007 	swl	t0,7(a0)
    27d0:	01880007 	srav	zero,t0,t4
    27d4:	07a86400 	tgei	sp,25600
    27d8:	07bc8800 	0x7bc8800
    27dc:	00038800 	sll	s1,v1,0x0
    27e0:	bc00d091 	cache	0x0,-12143(zero)
    27e4:	c4880007 	lwc1	$f8,7(a0)
    27e8:	03880007 	srav	zero,t0,gp
    27ec:	00d08d00 	0xd08d00
	...
    27f8:	88000738 	lwl	zero,1848(zero)
    27fc:	880007a4 	lwl	zero,1956(zero)
    2800:	a4650001 	sh	a1,1(v1)
    2804:	bc880007 	cache	0x8,7(a0)
    2808:	03880007 	srav	zero,t0,gp
    280c:	00cc9100 	0xcc9100
    2810:	880007bc 	lwl	zero,1980(zero)
    2814:	880007c4 	lwl	zero,1988(zero)
    2818:	cc8d0003 	pref	0xd,3(a0)
	...
    2824:	00073800 	sll	a3,a3,0x0
    2828:	0007a088 	0x7a088
    282c:	66000188 	0x66000188
    2830:	880007a0 	lwl	zero,1952(zero)
    2834:	880007bc 	lwl	zero,1980(zero)
    2838:	c8910003 	lwc2	$17,3(a0)
    283c:	0007bc00 	sll	s7,a3,0x10
    2840:	0007c488 	0x7c488
    2844:	8d000388 	lw	zero,904(t0)
    2848:	000000c8 	0xc8
    284c:	00000000 	nop
    2850:	07380000 	0x7380000
    2854:	079c8800 	0x79c8800
    2858:	00018800 	sll	s1,at,0x0
    285c:	00079c67 	0x79c67
    2860:	0007bc88 	0x7bc88
    2864:	91000388 	lbu	zero,904(t0)
    2868:	07bc00c4 	0x7bc00c4
    286c:	07c48800 	0x7c48800
    2870:	00038800 	sll	s1,v1,0x0
    2874:	0000c48d 	break	0x0,0x312
    2878:	00000000 	nop
    287c:	38000000 	xori	zero,zero,0x0
    2880:	98880007 	lwr	t0,7(a0)
    2884:	01880007 	srav	zero,t0,t4
    2888:	07986e00 	0x7986e00
    288c:	07bc8800 	0x7bc8800
    2890:	00038800 	sll	s1,v1,0x0
    2894:	bc00c091 	cache	0x0,-16239(zero)
    2898:	c4880007 	lwc1	$f8,7(a0)
    289c:	03880007 	srav	zero,t0,gp
    28a0:	00c08d00 	0xc08d00
	...
    28ac:	88000738 	lwl	zero,1848(zero)
    28b0:	880007bc 	lwl	zero,1980(zero)
    28b4:	98910003 	lwr	s1,3(a0)
    28b8:	0007bc7f 	0x7bc7f
    28bc:	0007c488 	0x7c488
    28c0:	8d000388 	lw	zero,904(t0)
    28c4:	00007f98 	0x7f98
    28c8:	00000000 	nop
    28cc:	07380000 	0x7380000
    28d0:	07bc8800 	0x7bc8800
    28d4:	00038800 	sll	s1,v1,0x0
    28d8:	bc7f9c91 	cache	0x1f,-25455(v1)
    28dc:	c4880007 	lwc1	$f8,7(a0)
    28e0:	03880007 	srav	zero,t0,gp
    28e4:	7f9c8d00 	0x7f9c8d00
	...
    28f0:	88000744 	lwl	zero,1860(zero)
    28f4:	880007bc 	lwl	zero,1980(zero)
    28f8:	bc600001 	cache	0x0,1(v1)
    28fc:	c3880007 	ll	t0,7(gp)
    2900:	01880007 	srav	zero,t0,t4
    2904:	07c35400 	bgezl	s8,17908 <_data-0x7ffe86f8>
    2908:	07c48800 	0x7c48800
    290c:	00038800 	sll	s1,v1,0x0
    2910:	0000e08d 	break	0x0,0x382
    2914:	00000000 	nop
    2918:	44000000 	mfc1	zero,$f0
    291c:	b4880007 	0xb4880007
    2920:	01880007 	srav	zero,t0,t4
    2924:	07b46100 	0x7b46100
    2928:	07bc8800 	0x7bc8800
    292c:	00038800 	sll	s1,v1,0x0
    2930:	bc00dc91 	cache	0x0,-9071(zero)
    2934:	c4880007 	lwc1	$f8,7(a0)
    2938:	03880007 	srav	zero,t0,gp
    293c:	00dc8d00 	0xdc8d00
	...
    2948:	88000744 	lwl	zero,1860(zero)
    294c:	880007b0 	lwl	zero,1968(zero)
    2950:	b0620001 	0xb0620001
    2954:	bc880007 	cache	0x8,7(a0)
    2958:	03880007 	srav	zero,t0,gp
    295c:	00d89100 	0xd89100
    2960:	880007bc 	lwl	zero,1980(zero)
    2964:	880007c4 	lwl	zero,1988(zero)
    2968:	d88d0003 	ldc2	$13,3(a0)
	...
    2974:	00074400 	sll	t0,a3,0x10
    2978:	0007ac88 	0x7ac88
    297c:	63000188 	0x63000188
    2980:	880007ac 	lwl	zero,1964(zero)
    2984:	880007bc 	lwl	zero,1980(zero)
    2988:	d4910003 	ldc1	$f17,3(a0)
    298c:	0007bc00 	sll	s7,a3,0x10
    2990:	0007c488 	0x7c488
    2994:	8d000388 	lw	zero,904(t0)
    2998:	000000d4 	0xd4
    299c:	00000000 	nop
    29a0:	07440000 	0x7440000
    29a4:	07a88800 	tgei	sp,-30720
    29a8:	00018800 	sll	s1,at,0x0
    29ac:	0007a864 	0x7a864
    29b0:	0007bc88 	0x7bc88
    29b4:	91000388 	lbu	zero,904(t0)
    29b8:	07bc00d0 	0x7bc00d0
    29bc:	07c48800 	0x7c48800
    29c0:	00038800 	sll	s1,v1,0x0
    29c4:	0000d08d 	break	0x0,0x342
    29c8:	00000000 	nop
    29cc:	44000000 	mfc1	zero,$f0
    29d0:	a4880007 	sh	t0,7(a0)
    29d4:	01880007 	srav	zero,t0,t4
    29d8:	07a46500 	0x7a46500
    29dc:	07bc8800 	0x7bc8800
    29e0:	00038800 	sll	s1,v1,0x0
    29e4:	bc00cc91 	cache	0x0,-13167(zero)
    29e8:	c4880007 	lwc1	$f8,7(a0)
    29ec:	03880007 	srav	zero,t0,gp
    29f0:	00cc8d00 	0xcc8d00
	...
    29fc:	88000744 	lwl	zero,1860(zero)
    2a00:	880007a0 	lwl	zero,1952(zero)
    2a04:	a0660001 	sb	a2,1(v1)
    2a08:	bc880007 	cache	0x8,7(a0)
    2a0c:	03880007 	srav	zero,t0,gp
    2a10:	00c89100 	0xc89100
    2a14:	880007bc 	lwl	zero,1980(zero)
    2a18:	880007c4 	lwl	zero,1988(zero)
    2a1c:	c88d0003 	lwc2	$13,3(a0)
	...
    2a28:	00074400 	sll	t0,a3,0x10
    2a2c:	00079c88 	0x79c88
    2a30:	67000188 	0x67000188
    2a34:	8800079c 	lwl	zero,1948(zero)
    2a38:	880007bc 	lwl	zero,1980(zero)
    2a3c:	c4910003 	lwc1	$f17,3(a0)
    2a40:	0007bc00 	sll	s7,a3,0x10
    2a44:	0007c488 	0x7c488
    2a48:	8d000388 	lw	zero,904(t0)
    2a4c:	000000c4 	0xc4
    2a50:	00000000 	nop
    2a54:	07440000 	0x7440000
    2a58:	07988800 	0x7988800
    2a5c:	00018800 	sll	s1,at,0x0
    2a60:	0007986e 	0x7986e
    2a64:	0007bc88 	0x7bc88
    2a68:	91000388 	lbu	zero,904(t0)
    2a6c:	07bc00c0 	0x7bc00c0
    2a70:	07c48800 	0x7c48800
    2a74:	00038800 	sll	s1,v1,0x0
    2a78:	0000c08d 	break	0x0,0x302
    2a7c:	00000000 	nop
    2a80:	44000000 	mfc1	zero,$f0
    2a84:	bc880007 	cache	0x8,7(a0)
    2a88:	03880007 	srav	zero,t0,gp
    2a8c:	7f989100 	0x7f989100
    2a90:	880007bc 	lwl	zero,1980(zero)
    2a94:	880007c4 	lwl	zero,1988(zero)
    2a98:	988d0003 	lwr	t5,3(a0)
    2a9c:	0000007f 	0x7f
    2aa0:	00000000 	nop
    2aa4:	00075000 	sll	t2,a3,0x0
    2aa8:	0007bc88 	0x7bc88
    2aac:	60000188 	0x60000188
    2ab0:	880007bc 	lwl	zero,1980(zero)
    2ab4:	880007c3 	lwl	zero,1987(zero)
    2ab8:	c3540001 	ll	s4,1(k0)
    2abc:	c4880007 	lwc1	$f8,7(a0)
    2ac0:	03880007 	srav	zero,t0,gp
    2ac4:	00e08d00 	0xe08d00
	...
    2ad0:	88000750 	lwl	zero,1872(zero)
    2ad4:	880007b4 	lwl	zero,1972(zero)
    2ad8:	b4610001 	0xb4610001
    2adc:	bc880007 	cache	0x8,7(a0)
    2ae0:	03880007 	srav	zero,t0,gp
    2ae4:	00dc9100 	0xdc9100
    2ae8:	880007bc 	lwl	zero,1980(zero)
    2aec:	880007c4 	lwl	zero,1988(zero)
    2af0:	dc8d0003 	ldc3	$13,3(a0)
	...
    2afc:	00075000 	sll	t2,a3,0x0
    2b00:	0007b088 	0x7b088
    2b04:	62000188 	0x62000188
    2b08:	880007b0 	lwl	zero,1968(zero)
    2b0c:	880007bc 	lwl	zero,1980(zero)
    2b10:	d8910003 	ldc2	$17,3(a0)
    2b14:	0007bc00 	sll	s7,a3,0x10
    2b18:	0007c488 	0x7c488
    2b1c:	8d000388 	lw	zero,904(t0)
    2b20:	000000d8 	0xd8
    2b24:	00000000 	nop
    2b28:	07500000 	bltzal	k0,2b2c <_data-0x7fffd4d4>
    2b2c:	07ac8800 	teqi	sp,-30720
    2b30:	00018800 	sll	s1,at,0x0
    2b34:	0007ac63 	0x7ac63
    2b38:	0007bc88 	0x7bc88
    2b3c:	91000388 	lbu	zero,904(t0)
    2b40:	07bc00d4 	0x7bc00d4
    2b44:	07c48800 	0x7c48800
    2b48:	00038800 	sll	s1,v1,0x0
    2b4c:	0000d48d 	break	0x0,0x352
    2b50:	00000000 	nop
    2b54:	50000000 	beqzl	zero,2b58 <_data-0x7fffd4a8>
    2b58:	a8880007 	swl	t0,7(a0)
    2b5c:	01880007 	srav	zero,t0,t4
    2b60:	07a86400 	tgei	sp,25600
    2b64:	07bc8800 	0x7bc8800
    2b68:	00038800 	sll	s1,v1,0x0
    2b6c:	bc00d091 	cache	0x0,-12143(zero)
    2b70:	c4880007 	lwc1	$f8,7(a0)
    2b74:	03880007 	srav	zero,t0,gp
    2b78:	00d08d00 	0xd08d00
	...
    2b84:	88000750 	lwl	zero,1872(zero)
    2b88:	880007a4 	lwl	zero,1956(zero)
    2b8c:	a4650001 	sh	a1,1(v1)
    2b90:	bc880007 	cache	0x8,7(a0)
    2b94:	03880007 	srav	zero,t0,gp
    2b98:	00cc9100 	0xcc9100
    2b9c:	880007bc 	lwl	zero,1980(zero)
    2ba0:	880007c4 	lwl	zero,1988(zero)
    2ba4:	cc8d0003 	pref	0xd,3(a0)
	...
    2bb0:	00075000 	sll	t2,a3,0x0
    2bb4:	0007a088 	0x7a088
    2bb8:	66000188 	0x66000188
    2bbc:	880007a0 	lwl	zero,1952(zero)
    2bc0:	880007bc 	lwl	zero,1980(zero)
    2bc4:	c8910003 	lwc2	$17,3(a0)
    2bc8:	0007bc00 	sll	s7,a3,0x10
    2bcc:	0007c488 	0x7c488
    2bd0:	8d000388 	lw	zero,904(t0)
    2bd4:	000000c8 	0xc8
    2bd8:	00000000 	nop
    2bdc:	07500000 	bltzal	k0,2be0 <_data-0x7fffd420>
    2be0:	079c8800 	0x79c8800
    2be4:	00018800 	sll	s1,at,0x0
    2be8:	00079c67 	0x79c67
    2bec:	0007bc88 	0x7bc88
    2bf0:	91000388 	lbu	zero,904(t0)
    2bf4:	07bc00c4 	0x7bc00c4
    2bf8:	07c48800 	0x7c48800
    2bfc:	00038800 	sll	s1,v1,0x0
    2c00:	0000c48d 	break	0x0,0x312
    2c04:	00000000 	nop
    2c08:	50000000 	beqzl	zero,2c0c <_data-0x7fffd3f4>
    2c0c:	98880007 	lwr	t0,7(a0)
    2c10:	01880007 	srav	zero,t0,t4
    2c14:	07986e00 	0x7986e00
    2c18:	07bc8800 	0x7bc8800
    2c1c:	00038800 	sll	s1,v1,0x0
    2c20:	bc00c091 	cache	0x0,-16239(zero)
    2c24:	c4880007 	lwc1	$f8,7(a0)
    2c28:	03880007 	srav	zero,t0,gp
    2c2c:	00c08d00 	0xc08d00
	...
    2c38:	88000758 	lwl	zero,1880(zero)
    2c3c:	880007bc 	lwl	zero,1980(zero)
    2c40:	bc600001 	cache	0x0,1(v1)
    2c44:	c3880007 	ll	t0,7(gp)
    2c48:	01880007 	srav	zero,t0,t4
    2c4c:	07c35400 	bgezl	s8,17c50 <_data-0x7ffe83b0>
    2c50:	07c48800 	0x7c48800
    2c54:	00038800 	sll	s1,v1,0x0
    2c58:	0000e08d 	break	0x0,0x382
    2c5c:	00000000 	nop
    2c60:	58000000 	blezl	zero,2c64 <_data-0x7fffd39c>
    2c64:	b4880007 	0xb4880007
    2c68:	01880007 	srav	zero,t0,t4
    2c6c:	07b46100 	0x7b46100
    2c70:	07bc8800 	0x7bc8800
    2c74:	00038800 	sll	s1,v1,0x0
    2c78:	bc00dc91 	cache	0x0,-9071(zero)
    2c7c:	c4880007 	lwc1	$f8,7(a0)
    2c80:	03880007 	srav	zero,t0,gp
    2c84:	00dc8d00 	0xdc8d00
	...
    2c90:	88000758 	lwl	zero,1880(zero)
    2c94:	880007b0 	lwl	zero,1968(zero)
    2c98:	b0620001 	0xb0620001
    2c9c:	bc880007 	cache	0x8,7(a0)
    2ca0:	03880007 	srav	zero,t0,gp
    2ca4:	00d89100 	0xd89100
    2ca8:	880007bc 	lwl	zero,1980(zero)
    2cac:	880007c4 	lwl	zero,1988(zero)
    2cb0:	d88d0003 	ldc2	$13,3(a0)
	...
    2cbc:	00075800 	sll	t3,a3,0x0
    2cc0:	0007ac88 	0x7ac88
    2cc4:	63000188 	0x63000188
    2cc8:	880007ac 	lwl	zero,1964(zero)
    2ccc:	880007bc 	lwl	zero,1980(zero)
    2cd0:	d4910003 	ldc1	$f17,3(a0)
    2cd4:	0007bc00 	sll	s7,a3,0x10
    2cd8:	0007c488 	0x7c488
    2cdc:	8d000388 	lw	zero,904(t0)
    2ce0:	000000d4 	0xd4
    2ce4:	00000000 	nop
    2ce8:	07580000 	0x7580000
    2cec:	07a88800 	tgei	sp,-30720
    2cf0:	00018800 	sll	s1,at,0x0
    2cf4:	0007a864 	0x7a864
    2cf8:	0007bc88 	0x7bc88
    2cfc:	91000388 	lbu	zero,904(t0)
    2d00:	07bc00d0 	0x7bc00d0
    2d04:	07c48800 	0x7c48800
    2d08:	00038800 	sll	s1,v1,0x0
    2d0c:	0000d08d 	break	0x0,0x342
    2d10:	00000000 	nop
    2d14:	58000000 	blezl	zero,2d18 <_data-0x7fffd2e8>
    2d18:	a4880007 	sh	t0,7(a0)
    2d1c:	01880007 	srav	zero,t0,t4
    2d20:	07a46500 	0x7a46500
    2d24:	07bc8800 	0x7bc8800
    2d28:	00038800 	sll	s1,v1,0x0
    2d2c:	bc00cc91 	cache	0x0,-13167(zero)
    2d30:	c4880007 	lwc1	$f8,7(a0)
    2d34:	03880007 	srav	zero,t0,gp
    2d38:	00cc8d00 	0xcc8d00
	...
    2d44:	88000758 	lwl	zero,1880(zero)
    2d48:	880007a0 	lwl	zero,1952(zero)
    2d4c:	a0660001 	sb	a2,1(v1)
    2d50:	bc880007 	cache	0x8,7(a0)
    2d54:	03880007 	srav	zero,t0,gp
    2d58:	00c89100 	0xc89100
    2d5c:	880007bc 	lwl	zero,1980(zero)
    2d60:	880007c4 	lwl	zero,1988(zero)
    2d64:	c88d0003 	lwc2	$13,3(a0)
	...
    2d70:	00075800 	sll	t3,a3,0x0
    2d74:	00079c88 	0x79c88
    2d78:	67000188 	0x67000188
    2d7c:	8800079c 	lwl	zero,1948(zero)
    2d80:	880007bc 	lwl	zero,1980(zero)
    2d84:	c4910003 	lwc1	$f17,3(a0)
    2d88:	0007bc00 	sll	s7,a3,0x10
    2d8c:	0007c488 	0x7c488
    2d90:	8d000388 	lw	zero,904(t0)
    2d94:	000000c4 	0xc4
    2d98:	00000000 	nop
    2d9c:	07600000 	bltz	k1,2da0 <_data-0x7fffd260>
    2da0:	07bc8800 	0x7bc8800
    2da4:	00018800 	sll	s1,at,0x0
    2da8:	0007bc60 	0x7bc60
    2dac:	0007c388 	0x7c388
    2db0:	54000188 	bnezl	zero,33d4 <_data-0x7fffcc2c>
    2db4:	880007c3 	lwl	zero,1987(zero)
    2db8:	880007c4 	lwl	zero,1988(zero)
    2dbc:	e08d0003 	sc	t5,3(a0)
	...
    2dc8:	00076000 	sll	t4,a3,0x0
    2dcc:	0007b488 	0x7b488
    2dd0:	61000188 	0x61000188
    2dd4:	880007b4 	lwl	zero,1972(zero)
    2dd8:	880007bc 	lwl	zero,1980(zero)
    2ddc:	dc910003 	ldc3	$17,3(a0)
    2de0:	0007bc00 	sll	s7,a3,0x10
    2de4:	0007c488 	0x7c488
    2de8:	8d000388 	lw	zero,904(t0)
    2dec:	000000dc 	0xdc
    2df0:	00000000 	nop
    2df4:	07600000 	bltz	k1,2df8 <_data-0x7fffd208>
    2df8:	07b08800 	bltzal	sp,fffe4dfc <_text_end+0x77fe3864>
    2dfc:	00018800 	sll	s1,at,0x0
    2e00:	0007b062 	0x7b062
    2e04:	0007bc88 	0x7bc88
    2e08:	91000388 	lbu	zero,904(t0)
    2e0c:	07bc00d8 	0x7bc00d8
    2e10:	07c48800 	0x7c48800
    2e14:	00038800 	sll	s1,v1,0x0
    2e18:	0000d88d 	break	0x0,0x362
    2e1c:	00000000 	nop
    2e20:	60000000 	0x60000000
    2e24:	ac880007 	sw	t0,7(a0)
    2e28:	01880007 	srav	zero,t0,t4
    2e2c:	07ac6300 	teqi	sp,25344
    2e30:	07bc8800 	0x7bc8800
    2e34:	00038800 	sll	s1,v1,0x0
    2e38:	bc00d491 	cache	0x0,-11119(zero)
    2e3c:	c4880007 	lwc1	$f8,7(a0)
    2e40:	03880007 	srav	zero,t0,gp
    2e44:	00d48d00 	0xd48d00
	...
    2e50:	88000760 	lwl	zero,1888(zero)
    2e54:	880007a8 	lwl	zero,1960(zero)
    2e58:	a8640001 	swl	a0,1(v1)
    2e5c:	bc880007 	cache	0x8,7(a0)
    2e60:	03880007 	srav	zero,t0,gp
    2e64:	00d09100 	0xd09100
    2e68:	880007bc 	lwl	zero,1980(zero)
    2e6c:	880007c4 	lwl	zero,1988(zero)
    2e70:	d08d0003 	0xd08d0003
	...
    2e7c:	00076000 	sll	t4,a3,0x0
    2e80:	0007a488 	0x7a488
    2e84:	65000188 	0x65000188
    2e88:	880007a4 	lwl	zero,1956(zero)
    2e8c:	880007bc 	lwl	zero,1980(zero)
    2e90:	cc910003 	pref	0x11,3(a0)
    2e94:	0007bc00 	sll	s7,a3,0x10
    2e98:	0007c488 	0x7c488
    2e9c:	8d000388 	lw	zero,904(t0)
    2ea0:	000000cc 	syscall	0x3
    2ea4:	00000000 	nop
    2ea8:	07600000 	bltz	k1,2eac <_data-0x7fffd154>
    2eac:	07a08800 	bltz	sp,fffe4eb0 <_text_end+0x77fe3918>
    2eb0:	00018800 	sll	s1,at,0x0
    2eb4:	0007a066 	0x7a066
    2eb8:	0007bc88 	0x7bc88
    2ebc:	91000388 	lbu	zero,904(t0)
    2ec0:	07bc00c8 	0x7bc00c8
    2ec4:	07c48800 	0x7c48800
    2ec8:	00038800 	sll	s1,v1,0x0
    2ecc:	0000c88d 	break	0x0,0x322
    2ed0:	00000000 	nop
    2ed4:	68000000 	0x68000000
    2ed8:	bc880007 	cache	0x8,7(a0)
    2edc:	01880007 	srav	zero,t0,t4
    2ee0:	07bc6000 	0x7bc6000
    2ee4:	07c38800 	bgezl	s8,fffe4ee8 <_text_end+0x77fe3950>
    2ee8:	00018800 	sll	s1,at,0x0
    2eec:	0007c354 	0x7c354
    2ef0:	0007c488 	0x7c488
    2ef4:	8d000388 	lw	zero,904(t0)
    2ef8:	000000e0 	0xe0
    2efc:	00000000 	nop
    2f00:	07680000 	tgei	k1,0
    2f04:	07b48800 	0x7b48800
    2f08:	00018800 	sll	s1,at,0x0
    2f0c:	0007b461 	0x7b461
    2f10:	0007bc88 	0x7bc88
    2f14:	91000388 	lbu	zero,904(t0)
    2f18:	07bc00dc 	0x7bc00dc
    2f1c:	07c48800 	0x7c48800
    2f20:	00038800 	sll	s1,v1,0x0
    2f24:	0000dc8d 	break	0x0,0x372
    2f28:	00000000 	nop
    2f2c:	68000000 	0x68000000
    2f30:	b0880007 	0xb0880007
    2f34:	01880007 	srav	zero,t0,t4
    2f38:	07b06200 	bltzal	sp,1b73c <_data-0x7ffe48c4>
    2f3c:	07bc8800 	0x7bc8800
    2f40:	00038800 	sll	s1,v1,0x0
    2f44:	bc00d891 	cache	0x0,-10095(zero)
    2f48:	c4880007 	lwc1	$f8,7(a0)
    2f4c:	03880007 	srav	zero,t0,gp
    2f50:	00d88d00 	0xd88d00
	...
    2f5c:	88000768 	lwl	zero,1896(zero)
    2f60:	880007ac 	lwl	zero,1964(zero)
    2f64:	ac630001 	sw	v1,1(v1)
    2f68:	bc880007 	cache	0x8,7(a0)
    2f6c:	03880007 	srav	zero,t0,gp
    2f70:	00d49100 	0xd49100
    2f74:	880007bc 	lwl	zero,1980(zero)
    2f78:	880007c4 	lwl	zero,1988(zero)
    2f7c:	d48d0003 	ldc1	$f13,3(a0)
	...
    2f88:	00076800 	sll	t5,a3,0x0
    2f8c:	0007a888 	0x7a888
    2f90:	64000188 	0x64000188
    2f94:	880007a8 	lwl	zero,1960(zero)
    2f98:	880007bc 	lwl	zero,1980(zero)
    2f9c:	d0910003 	0xd0910003
    2fa0:	0007bc00 	sll	s7,a3,0x10
    2fa4:	0007c488 	0x7c488
    2fa8:	8d000388 	lw	zero,904(t0)
    2fac:	000000d0 	0xd0
    2fb0:	00000000 	nop
    2fb4:	07680000 	tgei	k1,0
    2fb8:	07a48800 	0x7a48800
    2fbc:	00018800 	sll	s1,at,0x0
    2fc0:	0007a465 	0x7a465
    2fc4:	0007bc88 	0x7bc88
    2fc8:	91000388 	lbu	zero,904(t0)
    2fcc:	07bc00cc 	0x7bc00cc
    2fd0:	07c48800 	0x7c48800
    2fd4:	00038800 	sll	s1,v1,0x0
    2fd8:	0000cc8d 	break	0x0,0x332
    2fdc:	00000000 	nop
    2fe0:	70000000 	madd	zero,zero
    2fe4:	bc880007 	cache	0x8,7(a0)
    2fe8:	01880007 	srav	zero,t0,t4
    2fec:	07bc6000 	0x7bc6000
    2ff0:	07c38800 	bgezl	s8,fffe4ff4 <_text_end+0x77fe3a5c>
    2ff4:	00018800 	sll	s1,at,0x0
    2ff8:	0007c354 	0x7c354
    2ffc:	0007c488 	0x7c488
    3000:	8d000388 	lw	zero,904(t0)
    3004:	000000e0 	0xe0
    3008:	00000000 	nop
    300c:	07700000 	bltzal	k1,3010 <_data-0x7fffcff0>
    3010:	07b48800 	0x7b48800
    3014:	00018800 	sll	s1,at,0x0
    3018:	0007b461 	0x7b461
    301c:	0007bc88 	0x7bc88
    3020:	91000388 	lbu	zero,904(t0)
    3024:	07bc00dc 	0x7bc00dc
    3028:	07c48800 	0x7c48800
    302c:	00038800 	sll	s1,v1,0x0
    3030:	0000dc8d 	break	0x0,0x372
    3034:	00000000 	nop
    3038:	70000000 	madd	zero,zero
    303c:	b0880007 	0xb0880007
    3040:	01880007 	srav	zero,t0,t4
    3044:	07b06200 	bltzal	sp,1b848 <_data-0x7ffe47b8>
    3048:	07bc8800 	0x7bc8800
    304c:	00038800 	sll	s1,v1,0x0
    3050:	bc00d891 	cache	0x0,-10095(zero)
    3054:	c4880007 	lwc1	$f8,7(a0)
    3058:	03880007 	srav	zero,t0,gp
    305c:	00d88d00 	0xd88d00
	...
    3068:	88000770 	lwl	zero,1904(zero)
    306c:	880007ac 	lwl	zero,1964(zero)
    3070:	ac630001 	sw	v1,1(v1)
    3074:	bc880007 	cache	0x8,7(a0)
    3078:	03880007 	srav	zero,t0,gp
    307c:	00d49100 	0xd49100
    3080:	880007bc 	lwl	zero,1980(zero)
    3084:	880007c4 	lwl	zero,1988(zero)
    3088:	d48d0003 	ldc1	$f13,3(a0)
	...
    3094:	00077000 	sll	t6,a3,0x0
    3098:	0007a888 	0x7a888
    309c:	64000188 	0x64000188
    30a0:	880007a8 	lwl	zero,1960(zero)
    30a4:	880007bc 	lwl	zero,1980(zero)
    30a8:	d0910003 	0xd0910003
    30ac:	0007bc00 	sll	s7,a3,0x10
    30b0:	0007c488 	0x7c488
    30b4:	8d000388 	lw	zero,904(t0)
    30b8:	000000d0 	0xd0
    30bc:	00000000 	nop
    30c0:	07780000 	0x7780000
    30c4:	07bc8800 	0x7bc8800
    30c8:	00018800 	sll	s1,at,0x0
    30cc:	0007bc60 	0x7bc60
    30d0:	0007c388 	0x7c388
    30d4:	54000188 	bnezl	zero,36f8 <_data-0x7fffc908>
    30d8:	880007c3 	lwl	zero,1987(zero)
    30dc:	880007c4 	lwl	zero,1988(zero)
    30e0:	e08d0003 	sc	t5,3(a0)
	...
    30ec:	00077800 	sll	t7,a3,0x0
    30f0:	0007b488 	0x7b488
    30f4:	61000188 	0x61000188
    30f8:	880007b4 	lwl	zero,1972(zero)
    30fc:	880007bc 	lwl	zero,1980(zero)
    3100:	dc910003 	ldc3	$17,3(a0)
    3104:	0007bc00 	sll	s7,a3,0x10
    3108:	0007c488 	0x7c488
    310c:	8d000388 	lw	zero,904(t0)
    3110:	000000dc 	0xdc
    3114:	00000000 	nop
    3118:	07780000 	0x7780000
    311c:	07b08800 	bltzal	sp,fffe5120 <_text_end+0x77fe3b88>
    3120:	00018800 	sll	s1,at,0x0
    3124:	0007b062 	0x7b062
    3128:	0007bc88 	0x7bc88
    312c:	91000388 	lbu	zero,904(t0)
    3130:	07bc00d8 	0x7bc00d8
    3134:	07c48800 	0x7c48800
    3138:	00038800 	sll	s1,v1,0x0
    313c:	0000d88d 	break	0x0,0x362
    3140:	00000000 	nop
    3144:	78000000 	0x78000000
    3148:	ac880007 	sw	t0,7(a0)
    314c:	01880007 	srav	zero,t0,t4
    3150:	07ac6300 	teqi	sp,25344
    3154:	07bc8800 	0x7bc8800
    3158:	00038800 	sll	s1,v1,0x0
    315c:	bc00d491 	cache	0x0,-11119(zero)
    3160:	c4880007 	lwc1	$f8,7(a0)
    3164:	03880007 	srav	zero,t0,gp
    3168:	00d48d00 	0xd48d00
	...
    3174:	88000780 	lwl	zero,1920(zero)
    3178:	880007bc 	lwl	zero,1980(zero)
    317c:	bc600001 	cache	0x0,1(v1)
    3180:	c3880007 	ll	t0,7(gp)
    3184:	01880007 	srav	zero,t0,t4
    3188:	07c35400 	bgezl	s8,1818c <_data-0x7ffe7e74>
    318c:	07c48800 	0x7c48800
    3190:	00038800 	sll	s1,v1,0x0
    3194:	0000e08d 	break	0x0,0x382
    3198:	00000000 	nop
    319c:	80000000 	lb	zero,0(zero)
    31a0:	b4880007 	0xb4880007
    31a4:	01880007 	srav	zero,t0,t4
    31a8:	07b46100 	0x7b46100
    31ac:	07bc8800 	0x7bc8800
    31b0:	00038800 	sll	s1,v1,0x0
    31b4:	bc00dc91 	cache	0x0,-9071(zero)
    31b8:	c4880007 	lwc1	$f8,7(a0)
    31bc:	03880007 	srav	zero,t0,gp
    31c0:	00dc8d00 	0xdc8d00
	...
    31cc:	88000780 	lwl	zero,1920(zero)
    31d0:	880007b0 	lwl	zero,1968(zero)
    31d4:	b0620001 	0xb0620001
    31d8:	bc880007 	cache	0x8,7(a0)
    31dc:	03880007 	srav	zero,t0,gp
    31e0:	00d89100 	0xd89100
    31e4:	880007bc 	lwl	zero,1980(zero)
    31e8:	880007c4 	lwl	zero,1988(zero)
    31ec:	d88d0003 	ldc2	$13,3(a0)
	...
    31f8:	00078800 	sll	s1,a3,0x0
    31fc:	0007bc88 	0x7bc88
    3200:	60000188 	0x60000188
    3204:	880007bc 	lwl	zero,1980(zero)
    3208:	880007c3 	lwl	zero,1987(zero)
    320c:	c3540001 	ll	s4,1(k0)
    3210:	c4880007 	lwc1	$f8,7(a0)
    3214:	03880007 	srav	zero,t0,gp
    3218:	00e08d00 	0xe08d00
	...
    3224:	88000788 	lwl	zero,1928(zero)
    3228:	880007b4 	lwl	zero,1972(zero)
    322c:	b4610001 	0xb4610001
    3230:	bc880007 	cache	0x8,7(a0)
    3234:	03880007 	srav	zero,t0,gp
    3238:	00dc9100 	0xdc9100
    323c:	880007bc 	lwl	zero,1980(zero)
    3240:	880007c4 	lwl	zero,1988(zero)
    3244:	dc8d0003 	ldc3	$13,3(a0)
	...
    3250:	00079000 	sll	s2,a3,0x0
    3254:	0007bc88 	0x7bc88
    3258:	60000188 	0x60000188
    325c:	880007bc 	lwl	zero,1980(zero)
    3260:	880007c3 	lwl	zero,1987(zero)
    3264:	c3540001 	ll	s4,1(k0)
    3268:	c4880007 	lwc1	$f8,7(a0)
    326c:	03880007 	srav	zero,t0,gp
    3270:	00e08d00 	0xe08d00
	...
    327c:	880007c4 	lwl	zero,1988(zero)
    3280:	880007e4 	lwl	zero,2020(zero)
    3284:	e4540001 	swc1	$f20,1(v0)
    3288:	84880007 	lh	t0,7(a0)
    328c:	01880008 	0x1880008
    3290:	08845200 	j	2114800 <_data-0x7deeb800>
    3294:	08988800 	j	2622000 <_data-0x7d9de000>
    3298:	00048800 	sll	s1,a0,0x0
    329c:	9f5401f3 	0x9f5401f3
	...
    32a8:	88000514 	lwl	zero,1300(zero)
    32ac:	88000538 	lwl	zero,1336(zero)
    32b0:	9f470002 	0x9f470002
    32b4:	88000538 	lwl	zero,1336(zero)
    32b8:	8800053c 	lwl	zero,1340(zero)
    32bc:	4c520001 	0x4c520001
    32c0:	54880005 	bnel	a0,t0,32d8 <_data-0x7fffcd28>
    32c4:	01880005 	0x1880005
    32c8:	05785200 	0x5785200
    32cc:	057c8800 	0x57c8800
    32d0:	00018800 	sll	s1,at,0x0
    32d4:	00000052 	mflhxu	zero
    32d8:	00000000 	nop
    32dc:	00051400 	sll	v0,a1,0x10
    32e0:	00053888 	0x53888
    32e4:	30000288 	andi	zero,zero,0x288
    32e8:	0005389f 	0x5389f
    32ec:	00054088 	0x54088
    32f0:	73000788 	0x73000788
    32f4:	80808080 	lb	zero,-32640(a0)
    32f8:	05409f78 	bltz	t2,fffeb0dc <_text_end+0x77fe9b44>
    32fc:	05548800 	0x5548800
    3300:	00078800 	sll	s1,a3,0x0
    3304:	ffffff73 	sdc3	$31,-141(ra)
    3308:	009f07ff 	0x9f07ff
    330c:	00000000 	nop
    3310:	38000000 	xori	zero,zero,0x0
    3314:	4c880005 	mtc3	t0,$0,5
    3318:	06880005 	tgei	s4,5
    331c:	3af7f200 	xori	s7,s7,0xf200
	...
    3328:	78000000 	0x78000000
    332c:	a3880005 	sb	t0,5(gp)
    3330:	01880005 	0x1880005
    3334:	05c85300 	tgei	t6,21248
    3338:	05dc8800 	0x5dc8800
    333c:	00018800 	sll	s1,at,0x0
    3340:	00000053 	mtlhx	zero
    3344:	00000000 	nop
    3348:	00057800 	sll	t7,a1,0x0
    334c:	00059088 	0x59088
    3350:	f2000688 	0xf2000688
    3354:	00003af7 	0x3af7
	...
    3360:	00059c00 	sll	s3,a1,0x10
    3364:	0005a488 	0x5a488
    3368:	f2000688 	0xf2000688
    336c:	0000481c 	0x481c
	...
    3378:	0005ac00 	sll	s5,a1,0x10
    337c:	0005c888 	0x5c888
    3380:	f2000688 	0xf2000688
    3384:	0000482a 	slt	t1,zero,zero
	...
    3390:	0005ac00 	sll	s5,a1,0x10
    3394:	0005c888 	0x5c888
    3398:	30000288 	andi	zero,zero,0x288
    339c:	0000009f 	0x9f
    33a0:	00000000 	nop
    33a4:	0005ac00 	sll	s5,a1,0x10
    33a8:	0005c888 	0x5c888
    33ac:	3a000288 	xori	zero,s0,0x288
    33b0:	0000009f 	0x9f
    33b4:	00000000 	nop
    33b8:	0005b400 	sll	s6,a1,0x10
    33bc:	0005c888 	0x5c888
    33c0:	30000288 	andi	zero,zero,0x288
    33c4:	0000009f 	0x9f
    33c8:	00000000 	nop
    33cc:	00044800 	sll	t1,a0,0x0
    33d0:	00046c88 	0x46c88
    33d4:	47000288 	c1	0x1000288
    33d8:	00046c9f 	0x46c9f
    33dc:	00047088 	0x47088
    33e0:	52000188 	beqzl	s0,3a04 <_data-0x7fffc5fc>
    33e4:	88000480 	lwl	zero,1152(zero)
    33e8:	88000488 	lwl	zero,1160(zero)
    33ec:	ac520001 	sw	s2,1(v0)
    33f0:	b0880004 	0xb0880004
    33f4:	01880004 	sllv	zero,t0,t4
    33f8:	00005200 	sll	t2,zero,0x8
    33fc:	00000000 	nop
    3400:	04480000 	tgei	v0,0
    3404:	046c8800 	teqi	v1,-30720
    3408:	00028800 	sll	s1,v0,0x0
    340c:	00009f30 	tge	zero,zero,0x27c
    3410:	00000000 	nop
    3414:	046c0000 	teqi	v1,0
    3418:	04808800 	bltz	a0,fffe541c <_text_end+0x77fe3e84>
    341c:	00068800 	sll	s1,a2,0x0
    3420:	003c7ff2 	tlt	at,gp,0x1ff
	...
    342c:	04ac0000 	teqi	a1,0
    3430:	04db8800 	0x4db8800
    3434:	00018800 	sll	s1,at,0x0
    3438:	00050053 	0x50053
    343c:	00051488 	0x51488
    3440:	53000188 	beqzl	t8,3a64 <_data-0x7fffc59c>
    3444:	00000000 	nop
    3448:	00000000 	nop
    344c:	880004ac 	lwl	zero,1196(zero)
    3450:	880004c8 	lwl	zero,1224(zero)
    3454:	7ff20006 	0x7ff20006
    3458:	0000003c 	0x3c
	...
    3464:	880004d4 	lwl	zero,1236(zero)
    3468:	880004dc 	lwl	zero,1244(zero)
    346c:	1cf20006 	0x1cf20006
    3470:	00000048 	0x48
	...
    347c:	880004e4 	lwl	zero,1252(zero)
    3480:	88000500 	lwl	zero,1280(zero)
    3484:	2af20006 	slti	s2,s7,6
    3488:	00000048 	0x48
	...
    3494:	880004e4 	lwl	zero,1252(zero)
    3498:	88000500 	lwl	zero,1280(zero)
    349c:	9f300002 	0x9f300002
	...
    34a8:	880004e4 	lwl	zero,1252(zero)
    34ac:	88000500 	lwl	zero,1280(zero)
    34b0:	9f3a0002 	0x9f3a0002
	...
    34bc:	880004ec 	lwl	zero,1260(zero)
    34c0:	88000500 	lwl	zero,1280(zero)
    34c4:	9f300002 	0x9f300002
	...
    34d0:	88000380 	lwl	zero,896(zero)
    34d4:	880003a4 	lwl	zero,932(zero)
    34d8:	9f470002 	0x9f470002
    34dc:	880003a4 	lwl	zero,932(zero)
    34e0:	880003a8 	lwl	zero,936(zero)
    34e4:	b8520001 	swr	s2,1(v0)
    34e8:	bc880003 	cache	0x8,3(a0)
    34ec:	01880003 	0x1880003
    34f0:	03e05200 	0x3e05200
    34f4:	03e48800 	0x3e48800
    34f8:	00018800 	sll	s1,at,0x0
    34fc:	00043052 	0x43052
    3500:	00044888 	0x44888
    3504:	54000188 	bnezl	zero,3b28 <_data-0x7fffc4d8>
    3508:	00000000 	nop
    350c:	00000000 	nop
    3510:	88000380 	lwl	zero,896(zero)
    3514:	880003a4 	lwl	zero,932(zero)
    3518:	9f300002 	0x9f300002
	...
    3524:	880003a4 	lwl	zero,932(zero)
    3528:	880003b8 	lwl	zero,952(zero)
    352c:	5cf20006 	0x5cf20006
    3530:	0000003e 	0x3e
	...
    353c:	880003e0 	lwl	zero,992(zero)
    3540:	8800040b 	lwl	zero,1035(zero)
    3544:	30530001 	andi	s3,v0,0x1
    3548:	48880004 	mtc2	t0,$0,4
    354c:	01880004 	sllv	zero,t0,t4
    3550:	00005300 	sll	t2,zero,0xc
    3554:	00000000 	nop
    3558:	04040000 	0x4040000
    355c:	040c8800 	teqi	zero,-30720
    3560:	00068800 	sll	s1,a2,0x0
    3564:	00481cf2 	tlt	v0,t0,0x73
	...
    3570:	04140000 	0x4140000
    3574:	04308800 	bltzal	at,fffe5578 <_text_end+0x77fe3fe0>
    3578:	00068800 	sll	s1,a2,0x0
    357c:	00482af2 	tlt	v0,t0,0xab
	...
    3588:	04140000 	0x4140000
    358c:	04308800 	bltzal	at,fffe5590 <_text_end+0x77fe3ff8>
    3590:	00028800 	sll	s1,v0,0x0
    3594:	00009f30 	tge	zero,zero,0x27c
    3598:	00000000 	nop
    359c:	04140000 	0x4140000
    35a0:	04308800 	bltzal	at,fffe55a4 <_text_end+0x77fe400c>
    35a4:	00028800 	sll	s1,v0,0x0
    35a8:	00009f3a 	0x9f3a
    35ac:	00000000 	nop
    35b0:	041c0000 	0x41c0000
    35b4:	04308800 	bltzal	at,fffe55b8 <_text_end+0x77fe4020>
    35b8:	00028800 	sll	s1,v0,0x0
    35bc:	00009f30 	tge	zero,zero,0x27c
    35c0:	00000000 	nop
    35c4:	08980000 	j	2600000 <_data-0x7da00000>
    35c8:	08b08800 	j	2c22000 <_data-0x7d3de000>
    35cc:	00068800 	sll	s1,a2,0x0
    35d0:	00107c03 	sra	t7,s0,0x10
    35d4:	00009f88 	0x9f88
    35d8:	00000000 	nop
    35dc:	08b80000 	j	2e00000 <_data-0x7d200000>
    35e0:	08c08800 	j	3022000 <_data-0x7cfde000>
    35e4:	00068800 	sll	s1,a2,0x0
    35e8:	004830f2 	tlt	v0,t0,0xc3
	...
    35f4:	08c00000 	j	3000000 <_data-0x7d000000>
    35f8:	09648800 	j	5922000 <_data-0x7a6de000>
    35fc:	00068800 	sll	s1,a2,0x0
    3600:	004839f2 	tlt	v0,t0,0xe7
	...
    360c:	08c00000 	j	3000000 <_data-0x7d000000>
    3610:	09648800 	j	5922000 <_data-0x7a6de000>
    3614:	00028800 	sll	s1,v0,0x0
    3618:	00009f30 	tge	zero,zero,0x27c
    361c:	00000000 	nop
    3620:	08c00000 	j	3000000 <_data-0x7d000000>
    3624:	09648800 	j	5922000 <_data-0x7a6de000>
    3628:	00028800 	sll	s1,v0,0x0
    362c:	00009f3a 	0x9f3a
    3630:	00000000 	nop
    3634:	08c00000 	j	3000000 <_data-0x7d000000>
    3638:	09648800 	j	5922000 <_data-0x7a6de000>
    363c:	00038800 	sll	s1,v1,0x0
    3640:	009f2108 	0x9f2108
    3644:	00000000 	nop
    3648:	c0000000 	ll	zero,0(zero)
    364c:	64880008 	0x64880008
    3650:	03880009 	0x3880009
    3654:	9f740800 	0x9f740800
	...
    3660:	880008c0 	lwl	zero,2240(zero)
    3664:	88000964 	lwl	zero,2404(zero)
    3668:	72080003 	0x72080003
    366c:	0000009f 	0x9f
    3670:	00000000 	nop
    3674:	0008c000 	sll	t8,t0,0x0
    3678:	00096488 	0x96488
    367c:	08000388 	j	e20 <_data-0x7ffff1e0>
    3680:	00009f6f 	0x9f6f
    3684:	00000000 	nop
    3688:	08c00000 	j	3000000 <_data-0x7d000000>
    368c:	09648800 	j	5922000 <_data-0x7a6de000>
    3690:	00038800 	sll	s1,v1,0x0
    3694:	009f6808 	0x9f6808
    3698:	00000000 	nop
    369c:	c0000000 	ll	zero,0(zero)
    36a0:	64880008 	0x64880008
    36a4:	03880009 	0x3880009
    36a8:	9f730800 	0x9f730800
	...
    36b4:	880008c0 	lwl	zero,2240(zero)
    36b8:	88000964 	lwl	zero,2404(zero)
    36bc:	20080003 	addi	t0,zero,3
    36c0:	0000009f 	0x9f
    36c4:	00000000 	nop
    36c8:	0008c000 	sll	t8,t0,0x0
    36cc:	00096488 	0x96488
    36d0:	08000388 	j	e20 <_data-0x7ffff1e0>
    36d4:	00009f79 	0x9f79
    36d8:	00000000 	nop
    36dc:	08c00000 	j	3000000 <_data-0x7d000000>
    36e0:	09648800 	j	5922000 <_data-0x7a6de000>
    36e4:	00038800 	sll	s1,v1,0x0
    36e8:	009f6208 	0x9f6208
    36ec:	00000000 	nop
    36f0:	c0000000 	ll	zero,0(zero)
    36f4:	64880008 	0x64880008
    36f8:	03880009 	0x3880009
    36fc:	9f6d0800 	0x9f6d0800
	...
    3708:	880008c0 	lwl	zero,2240(zero)
    370c:	88000964 	lwl	zero,2404(zero)
    3710:	65080003 	0x65080003
    3714:	0000009f 	0x9f
    3718:	00000000 	nop
    371c:	0008c000 	sll	t8,t0,0x0
    3720:	00096488 	0x96488
    3724:	08000388 	j	e20 <_data-0x7ffff1e0>
    3728:	00009f67 	0x9f67
    372c:	00000000 	nop
    3730:	08c00000 	j	3000000 <_data-0x7d000000>
    3734:	09648800 	j	5922000 <_data-0x7a6de000>
    3738:	00038800 	sll	s1,v1,0x0
    373c:	009f6e08 	0x9f6e08
    3740:	00000000 	nop
    3744:	c0000000 	ll	zero,0(zero)
    3748:	64880008 	0x64880008
    374c:	03880009 	0x3880009
    3750:	9f690800 	0x9f690800
	...
    375c:	880008c0 	lwl	zero,2240(zero)
    3760:	88000964 	lwl	zero,2404(zero)
    3764:	54080003 	bnel	zero,t0,3774 <_data-0x7fffc88c>
    3768:	0000009f 	0x9f
    376c:	00000000 	nop
    3770:	00096c00 	sll	t5,t1,0x10
    3774:	00097488 	0x97488
    3778:	f2000688 	0xf2000688
    377c:	00004830 	tge	zero,zero,0x120
	...
    3788:	00097400 	sll	t6,t1,0x10
    378c:	00098488 	0x98488
    3790:	03000688 	0x3000688
    3794:	88001098 	lwl	zero,4248(zero)
    3798:	0000009f 	0x9f
    379c:	00000000 	nop
    37a0:	00098c00 	sll	s1,t1,0x10
    37a4:	00099488 	0x99488
    37a8:	f2000688 	0xf2000688
    37ac:	00004830 	tge	zero,zero,0x120
	...
    37b8:	00031000 	sll	v0,v1,0x0
    37bc:	00032088 	0x32088
    37c0:	54000188 	bnezl	zero,3de4 <_data-0x7fffc21c>
    37c4:	88000320 	lwl	zero,800(zero)
    37c8:	88000370 	lwl	zero,880(zero)
    37cc:	70620001 	maddu	v1,v0
    37d0:	80880003 	lb	t0,3(a0)
    37d4:	04880003 	tgei	a0,3
    37d8:	5401f300 	bnel	zero,at,3dc <_data-0x7ffffc24>
    37dc:	0000009f 	0x9f
    37e0:	00000000 	nop
    37e4:	00033800 	sll	a3,v1,0x0
    37e8:	00034088 	0x34088
    37ec:	37000288 	ori	zero,t8,0x288
    37f0:	0000009f 	0x9f
    37f4:	00000000 	nop
    37f8:	00034800 	sll	t1,v1,0x0
    37fc:	00035888 	0x35888
    3800:	52000188 	beqzl	s0,3e24 <_data-0x7fffc1dc>
    3804:	88000358 	lwl	zero,856(zero)
    3808:	8800035f 	lwl	zero,863(zero)
    380c:	00540001 	movf	zero,v0,$fcc5
    3810:	00000000 	nop
    3814:	6c000000 	0x6c000000
    3818:	7c88000b 	0x7c88000b
    381c:	0188000b 	movn	zero,t4,t0
    3820:	0b7c5400 	j	df15000 <_data-0x720eb000>
    3824:	0bc88800 	j	f222000 <_data-0x70dde000>
    3828:	00018800 	sll	s1,at,0x0
    382c:	000bc861 	0xbc861
    3830:	000bdc88 	0xbdc88
    3834:	f3000488 	0xf3000488
    3838:	dc9f5401 	ldc3	$31,21505(a0)
    383c:	2088000b 	addi	t0,a0,11
    3840:	0188000c 	syscall	0x62000
    3844:	00006100 	sll	t4,zero,0x4
    3848:	00000000 	nop
    384c:	0b6c0000 	j	db00000 <_data-0x72500000>
    3850:	0b8f8800 	j	e3e2000 <_data-0x71c1e000>
    3854:	00018800 	sll	s1,at,0x0
    3858:	000b8f55 	0xb8f55
    385c:	000c2088 	0xc2088
    3860:	f3000488 	0xf3000488
    3864:	009f5501 	0x9f5501
    3868:	00000000 	nop
    386c:	e8000000 	swc2	$0,0(zero)
    3870:	0f88000b 	jal	e20002c <_data-0x71dfffd4>
    3874:	0188000c 	syscall	0x62000
    3878:	00005600 	sll	t2,zero,0x18
    387c:	00000000 	nop
    3880:	0b040000 	j	c100000 <_data-0x73f00000>
    3884:	0b288800 	j	ca22000 <_data-0x735de000>
    3888:	00028800 	sll	s1,v0,0x0
    388c:	0b289f30 	j	ca27cc0 <_data-0x735d8340>
    3890:	0b488800 	j	d222000 <_data-0x72dde000>
    3894:	00018800 	sll	s1,at,0x0
    3898:	00000060 	0x60
    389c:	00000000 	nop
    38a0:	000b3c00 	sll	a3,t3,0x10
    38a4:	000b4f88 	0xb4f88
    38a8:	56000188 	bnezl	s0,3ecc <_data-0x7fffc134>
    38ac:	00000000 	nop
    38b0:	00000000 	nop
    38b4:	88000b3c 	lwl	zero,2876(zero)
    38b8:	88000b4f 	lwl	zero,2895(zero)
    38bc:	00570001 	0x570001
    38c0:	00000000 	nop
    38c4:	3c000000 	lui	zero,0x0
    38c8:	4f88000b 	c3	0x188000b
    38cc:	0188000b 	movn	zero,t4,t0
    38d0:	00005200 	sll	t2,zero,0x8
    38d4:	00000000 	nop
    38d8:	0a6c0000 	j	9b00000 <_data-0x76500000>
    38dc:	0aa08800 	j	a822000 <_data-0x757de000>
    38e0:	00018800 	sll	s1,at,0x0
    38e4:	000aa054 	0xaa054
    38e8:	000afc88 	0xafc88
    38ec:	60000188 	0x60000188
    38f0:	88000afc 	lwl	zero,2812(zero)
    38f4:	88000b04 	lwl	zero,2820(zero)
    38f8:	01f30004 	sllv	zero,s3,t7
    38fc:	00009f54 	0x9f54
    3900:	00000000 	nop
    3904:	0a6c0000 	j	9b00000 <_data-0x76500000>
    3908:	0aa08800 	j	a822000 <_data-0x757de000>
    390c:	00028800 	sll	s1,v0,0x0
    3910:	0aa09f31 	j	a827cc4 <_data-0x757d833c>
    3914:	0aac8800 	j	ab22000 <_data-0x754de000>
    3918:	00018800 	sll	s1,at,0x0
    391c:	000aac61 	0xaac61
    3920:	000ab388 	0xab388
    3924:	55000188 	bnezl	t0,3f48 <_data-0x7fffc0b8>
    3928:	88000ab3 	lwl	zero,2739(zero)
    392c:	88000ab4 	lwl	zero,2740(zero)
    3930:	7f810003 	0x7f810003
    3934:	000ab49f 	0xab49f
    3938:	000af888 	0xaf888
    393c:	61000188 	0x61000188
	...
    3948:	880009f4 	lwl	zero,2548(zero)
    394c:	88000a4c 	lwl	zero,2636(zero)
    3950:	58600001 	blezl	v1,3958 <_data-0x7fffc6a8>
    3954:	6c88000a 	0x6c88000a
    3958:	0188000a 	movz	zero,t4,t0
    395c:	00006000 	sll	t4,zero,0x0
    3960:	00000000 	nop
    3964:	0a2c0000 	j	8b00000 <_data-0x77500000>
    3968:	0a3f8800 	j	8fe2000 <_data-0x7701e000>
    396c:	00018800 	sll	s1,at,0x0
    3970:	000a5852 	0xa5852
    3974:	000a6388 	0xa6388
    3978:	52000188 	beqzl	s0,3f9c <_data-0x7fffc064>
    397c:	00000000 	nop
    3980:	00000000 	nop
    3984:	88000c20 	lwl	zero,3104(zero)
    3988:	88000c5c 	lwl	zero,3164(zero)
    398c:	5c540001 	0x5c540001
    3990:	7c88000c 	0x7c88000c
    3994:	0188000c 	syscall	0x62000
    3998:	0c7c6200 	jal	1f18800 <_data-0x7e0e7800>
    399c:	0c908800 	jal	2422000 <_data-0x7dbde000>
    39a0:	00048800 	sll	s1,a0,0x0
    39a4:	9f5401f3 	0x9f5401f3
    39a8:	88000c90 	lwl	zero,3216(zero)
    39ac:	88000e44 	lwl	zero,3652(zero)
    39b0:	00620001 	0x620001
    39b4:	00000000 	nop
    39b8:	54000000 	bnezl	zero,39bc <_data-0x7fffc644>
    39bc:	5c88000c 	0x5c88000c
    39c0:	0288000c 	syscall	0xa2000
    39c4:	5c9f3000 	0x5c9f3000
    39c8:	8088000c 	lb	t0,12(a0)
    39cc:	0188000c 	syscall	0x62000
    39d0:	0c906100 	jal	2418400 <_data-0x7dbe7c00>
    39d4:	0da48800 	jal	6922000 <_data-0x796de000>
    39d8:	00018800 	sll	s1,at,0x0
    39dc:	000da461 	0xda461
    39e0:	000dac88 	0xdac88
    39e4:	81000388 	lb	zero,904(t0)
    39e8:	0dac9f7f 	jal	6b27dfc <_data-0x794d8204>
    39ec:	0dfc8800 	jal	7f22000 <_data-0x780de000>
    39f0:	00018800 	sll	s1,at,0x0
    39f4:	000e0861 	0xe0861
    39f8:	000e2488 	0xe2488
    39fc:	61000188 	0x61000188
    3a00:	88000e24 	lwl	zero,3620(zero)
    3a04:	88000e2c 	lwl	zero,3628(zero)
    3a08:	00740006 	srlv	zero,s4,v1
    3a0c:	9f1c0082 	0x9f1c0082
    3a10:	88000e2c 	lwl	zero,3628(zero)
    3a14:	88000e44 	lwl	zero,3652(zero)
    3a18:	00610001 	movt	zero,v1,$fcc0
    3a1c:	00000000 	nop
    3a20:	90000000 	lbu	zero,0(zero)
    3a24:	a488000c 	sh	t0,12(a0)
    3a28:	0188000c 	syscall	0x62000
    3a2c:	0e2c6400 	jal	8b19000 <_data-0x774e7000>
    3a30:	0e448800 	jal	9122000 <_data-0x76ede000>
    3a34:	00018800 	sll	s1,at,0x0
    3a38:	00000064 	0x64
    3a3c:	00000000 	nop
    3a40:	000c5400 	sll	t2,t4,0x10
    3a44:	000c8488 	0xc8488
    3a48:	60000188 	0x60000188
    3a4c:	88000c90 	lwl	zero,3216(zero)
    3a50:	88000e44 	lwl	zero,3652(zero)
    3a54:	00600001 	movf	zero,v1,$fcc0
    3a58:	00000000 	nop
    3a5c:	a4000000 	sh	zero,0(zero)
    3a60:	e088000c 	sc	t0,12(a0)
    3a64:	0188000c 	syscall	0x62000
    3a68:	0cf05500 	jal	3c15400 <_data-0x7c3eac00>
    3a6c:	0d0f8800 	jal	43e2000 <_data-0x7bc1e000>
    3a70:	00018800 	sll	s1,at,0x0
    3a74:	000d1855 	0xd1855
    3a78:	000d6b88 	0xd6b88
    3a7c:	55000188 	bnezl	t0,40a0 <_data-0x7fffbf60>
    3a80:	88000d80 	lwl	zero,3456(zero)
    3a84:	88000d8f 	lwl	zero,3471(zero)
    3a88:	98550001 	lwr	s5,1(v0)
    3a8c:	ab88000d 	swl	t0,13(gp)
    3a90:	0188000d 	break	0x188
    3a94:	0db45500 	jal	6d15400 <_data-0x792eac00>
    3a98:	0dc38800 	jal	70e2000 <_data-0x78f1e000>
    3a9c:	00018800 	sll	s1,at,0x0
    3aa0:	000dd055 	0xdd055
    3aa4:	000def88 	0xdef88
    3aa8:	55000188 	bnezl	t0,40cc <_data-0x7fffbf34>
    3aac:	88000df8 	lwl	zero,3576(zero)
    3ab0:	88000e00 	lwl	zero,3584(zero)
    3ab4:	08550001 	j	1540004 <_data-0x7eabfffc>
    3ab8:	2c88000e 	sltiu	t0,a0,14
    3abc:	0188000e 	0x188000e
    3ac0:	00005500 	sll	t2,zero,0x14
    3ac4:	00000000 	nop
    3ac8:	0e440000 	jal	9100000 <_data-0x76f00000>
    3acc:	0e788800 	jal	9e22000 <_data-0x761de000>
    3ad0:	00018800 	sll	s1,at,0x0
    3ad4:	000e7854 	0xe7854
    3ad8:	000e8088 	0xe8088
    3adc:	80000488 	lb	zero,1160(zero)
    3ae0:	809f1f00 	lb	ra,7936(a0)
    3ae4:	c888000e 	lwc2	$8,14(a0)
    3ae8:	0488000e 	tgei	a0,14
    3aec:	5401f300 	bnel	zero,at,6f0 <_data-0x7ffff910>
    3af0:	000ec89f 	0xec89f
    3af4:	000ed088 	0xed088
    3af8:	54000188 	bnezl	zero,411c <_data-0x7fffbee4>
    3afc:	88000ed0 	lwl	zero,3792(zero)
    3b00:	88000f1c 	lwl	zero,3868(zero)
    3b04:	01f30004 	sllv	zero,s3,t7
    3b08:	00009f54 	0x9f54
    3b0c:	00000000 	nop
    3b10:	0e440000 	jal	9100000 <_data-0x76f00000>
    3b14:	0e7f8800 	jal	9fe2000 <_data-0x7601e000>
    3b18:	00018800 	sll	s1,at,0x0
    3b1c:	000e7f55 	0xe7f55
    3b20:	000e9888 	0xe9888
    3b24:	63000188 	0x63000188
    3b28:	88000e98 	lwl	zero,3736(zero)
    3b2c:	88000ec8 	lwl	zero,3784(zero)
    3b30:	01f30004 	sllv	zero,s3,t7
    3b34:	0ec89f55 	jal	b227d54 <_data-0x74dd82ac>
    3b38:	0ed08800 	jal	b422000 <_data-0x74bde000>
    3b3c:	00018800 	sll	s1,at,0x0
    3b40:	000ed055 	0xed055
    3b44:	000eec88 	0xeec88
    3b48:	63000188 	0x63000188
    3b4c:	88000eec 	lwl	zero,3820(zero)
    3b50:	88000f1c 	lwl	zero,3868(zero)
    3b54:	01f30004 	sllv	zero,s3,t7
    3b58:	00009f55 	0x9f55
    3b5c:	00000000 	nop
    3b60:	0e440000 	jal	9100000 <_data-0x76f00000>
    3b64:	0e7f8800 	jal	9fe2000 <_data-0x7601e000>
    3b68:	00018800 	sll	s1,at,0x0
    3b6c:	000e7f56 	0xe7f56
    3b70:	000eac88 	0xeac88
    3b74:	64000188 	0x64000188
    3b78:	88000eac 	lwl	zero,3756(zero)
    3b7c:	88000ec8 	lwl	zero,3784(zero)
    3b80:	01f30004 	sllv	zero,s3,t7
    3b84:	0ec89f56 	jal	b227d58 <_data-0x74dd82a8>
    3b88:	0ed08800 	jal	b422000 <_data-0x74bde000>
    3b8c:	00018800 	sll	s1,at,0x0
    3b90:	000ed056 	0xed056
    3b94:	000f1c88 	0xf1c88
    3b98:	64000188 	0x64000188
	...
    3ba4:	88000e44 	lwl	zero,3652(zero)
    3ba8:	88000e7f 	lwl	zero,3711(zero)
    3bac:	7f570001 	0x7f570001
    3bb0:	c888000e 	lwc2	$8,14(a0)
    3bb4:	0488000e 	tgei	a0,14
    3bb8:	5701f300 	bnel	t8,at,7bc <_data-0x7ffff844>
    3bbc:	000ec89f 	0xec89f
    3bc0:	000ed088 	0xed088
    3bc4:	57000188 	bnezl	t8,41e8 <_data-0x7fffbe18>
    3bc8:	88000ed0 	lwl	zero,3792(zero)
    3bcc:	88000f1c 	lwl	zero,3868(zero)
    3bd0:	01f30004 	sllv	zero,s3,t7
    3bd4:	00009f57 	0x9f57
    3bd8:	00000000 	nop
    3bdc:	0e880000 	jal	a200000 <_data-0x75e00000>
    3be0:	0eb48800 	jal	ad22000 <_data-0x752de000>
    3be4:	00018800 	sll	s1,at,0x0
    3be8:	000ed062 	0xed062
    3bec:	000ee488 	0xee488
    3bf0:	62000188 	0x62000188
    3bf4:	88000eec 	lwl	zero,3820(zero)
    3bf8:	88000f1c 	lwl	zero,3868(zero)
    3bfc:	00620001 	0x620001
    3c00:	00000000 	nop
    3c04:	90000000 	lbu	zero,0(zero)
    3c08:	9888000e 	lwr	t0,14(a0)
    3c0c:	0e88000e 	jal	a200038 <_data-0x75dfffc8>
    3c10:	12008300 	beqz	s0,fffe4814 <_text_end+0x77fe327c>
    3c14:	14160082 	bne	zero,s6,3e20 <_data-0x7fffc1e0>
    3c18:	0001282b 	sltu	a1,zero,at
    3c1c:	989f1316 	lwr	ra,4886(a0)
    3c20:	9c88000e 	0x9c88000e
    3c24:	0f88000e 	jal	e200038 <_data-0x71dfffc8>
    3c28:	5501f300 	bnel	t0,at,82c <_data-0x7ffff7d4>
    3c2c:	16008212 	bnez	s0,fffe4478 <_text_end+0x77fe2ee0>
    3c30:	01282b14 	0x1282b14
    3c34:	9f131600 	0x9f131600
    3c38:	88000e9c 	lwl	zero,3740(zero)
    3c3c:	88000ebc 	lwl	zero,3772(zero)
    3c40:	ec600001 	swc3	$0,1(v1)
    3c44:	1c88000e 	0x1c88000e
    3c48:	0188000f 	0x188000f
    3c4c:	00006000 	sll	t4,zero,0x0
    3c50:	00000000 	nop
    3c54:	0efc0000 	jal	bf00000 <_data-0x74100000>
    3c58:	0f088800 	jal	c222000 <_data-0x73dde000>
    3c5c:	00018800 	sll	s1,at,0x0
    3c60:	00000052 	mflhxu	zero
    3c64:	00000000 	nop
    3c68:	000e7800 	sll	t7,t6,0x0
    3c6c:	000e8088 	0xe8088
    3c70:	60000188 	0x60000188
    3c74:	88000e88 	lwl	zero,3720(zero)
    3c78:	88000e94 	lwl	zero,3732(zero)
    3c7c:	c8600001 	lwc2	$0,1(v1)
    3c80:	d088000e 	0xd088000e
    3c84:	0188000e 	0x188000e
    3c88:	0ed05400 	jal	b415000 <_data-0x74beb000>
    3c8c:	0eec8800 	jal	bb22000 <_data-0x744de000>
    3c90:	00018800 	sll	s1,at,0x0
    3c94:	00000060 	0x60
	...
    3ca4:	55000100 	bnezl	t0,40a8 <_data-0x7fffbf58>
    3ca8:	00000000 	nop
    3cac:	00000000 	nop
    3cb0:	00560001 	0x560001
    3cb4:	00000000 	nop
    3cb8:	04000000 	bltz	zero,3cbc <_data-0x7fffc344>
    3cbc:	5501f300 	bnel	t0,at,8c0 <_data-0x7ffff740>
    3cc0:	0000009f 	0x9f
	...
    3cd0:	54000100 	bnezl	zero,40d4 <_data-0x7fffbf2c>
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
    3d40:	52000100 	beqzl	s0,4144 <_data-0x7fffbebc>
    3d44:	00000000 	nop
	...
    3d54:	00550001 	movt	zero,v0,$fcc5
    3d58:	00000000 	nop
    3d5c:	04000000 	bltz	zero,3d60 <_data-0x7fffc2a0>
    3d60:	5501f300 	bnel	t0,at,964 <_data-0x7ffff69c>
    3d64:	0000009f 	0x9f
    3d68:	00000000 	nop
    3d6c:	55000100 	bnezl	t0,4170 <_data-0x7fffbe90>
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
    3dac:	56000100 	bnezl	s0,41b0 <_data-0x7fffbe50>
    3db0:	00000000 	nop
    3db4:	00000000 	nop
    3db8:	01f30010 	0x1f30010
    3dbc:	00732056 	0x732056
    3dc0:	5501f322 	bnel	t0,at,a4c <_data-0x7ffff5b4>
    3dc4:	5601f31c 	bnel	s0,at,a38 <_data-0x7ffff5c8>
    3dc8:	00009f22 	0x9f22
    3dcc:	00000000 	nop
    3dd0:	00070000 	sll	zero,a3,0x0
    3dd4:	01f30073 	tltu	t7,s3,0x1
    3dd8:	009f1c55 	0x9f1c55
    3ddc:	00000000 	nop
    3de0:	0a000000 	j	8000000 <_data-0x78000000>
    3de4:	20007300 	addi	zero,zero,29440
    3de8:	76220072 	jalx	88801c8 <_data-0x7777fe38>
    3dec:	009f2200 	0x9f2200
    3df0:	00000000 	nop
    3df4:	09000000 	j	4000000 <_data-0x7c000000>
    3df8:	73007200 	0x73007200
    3dfc:	00761c00 	0x761c00
    3e00:	00009f22 	0x9f22
	...
    3e10:	00010000 	sll	zero,at,0x0
    3e14:	00000055 	0x55
    3e18:	00000000 	nop
    3e1c:	53000100 	beqzl	t8,4220 <_data-0x7fffbde0>
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
    3e50:	53000100 	beqzl	t8,4254 <_data-0x7fffbdac>
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
    3e7c:	53000100 	beqzl	t8,4280 <_data-0x7fffbd80>
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
    3f00:	1c007300 	bgtz	zero,20b04 <_data-0x7ffdf4fc>
    3f04:	225601f3 	addi	s6,s2,499
    3f08:	0000009f 	0x9f
	...
    3f18:	54000100 	bnezl	zero,431c <_data-0x7fffbce4>
    3f1c:	00000000 	nop
    3f20:	00000000 	nop
    3f24:	00530001 	0x530001
    3f28:	00000000 	nop
    3f2c:	1c000000 	bgtz	zero,3f30 <_data-0x7fffc0d0>
    3f30:	2888000f 	slti	t0,a0,15
    3f34:	0188000f 	0x188000f
    3f38:	0f285400 	jal	ca15000 <_data-0x735eb000>
    3f3c:	0f408800 	jal	d022000 <_data-0x72fde000>
    3f40:	00018800 	sll	s1,at,0x0
    3f44:	00000052 	mflhxu	zero
    3f48:	00000000 	nop
    3f4c:	000f1c00 	sll	v1,t7,0x10
    3f50:	000f2488 	0xf2488
    3f54:	56000188 	bnezl	s0,4578 <_data-0x7fffba88>
    3f58:	88000f24 	lwl	zero,3876(zero)
    3f5c:	88000f28 	lwl	zero,3880(zero)
    3f60:	01f30004 	sllv	zero,s3,t7
    3f64:	0f289f56 	jal	ca27d58 <_data-0x735d82a8>
    3f68:	0f388800 	jal	ce22000 <_data-0x731de000>
    3f6c:	000b8800 	sll	s1,t3,0x0
    3f70:	72200073 	0x72200073
    3f74:	01f32200 	0x1f32200
    3f78:	389f2256 	xori	ra,a0,0x2256
    3f7c:	4088000f 	0x4088000f
    3f80:	0a88000f 	j	a20003c <_data-0x75dfffc4>
    3f84:	73007200 	0x73007200
    3f88:	01f31c00 	0x1f31c00
    3f8c:	009f2256 	0x9f2256
    3f90:	00000000 	nop
    3f94:	20000000 	addi	zero,zero,0
    3f98:	2888000f 	slti	t0,a0,15
    3f9c:	0188000f 	0x188000f
    3fa0:	0f285400 	jal	ca15000 <_data-0x735eb000>
    3fa4:	0f408800 	jal	d022000 <_data-0x72fde000>
    3fa8:	00018800 	sll	s1,at,0x0
    3fac:	00000053 	mtlhx	zero
	...
    3fbc:	54000100 	bnezl	zero,43c0 <_data-0x7fffbc40>
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
    3ff0:	52000100 	beqzl	s0,43f4 <_data-0x7fffbc0c>
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
    402c:	55000100 	bnezl	t0,4430 <_data-0x7fffbbd0>
    4030:	00000000 	nop
	...
    4040:	00560001 	0x560001
    4044:	00000000 	nop
    4048:	04000000 	bltz	zero,404c <_data-0x7fffbfb4>
    404c:	5601f300 	bnel	s0,at,c50 <_data-0x7ffff3b0>
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
    409c:	55000100 	bnezl	t0,44a0 <_data-0x7fffbb60>
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
    40d8:	55000100 	bnezl	t0,44dc <_data-0x7fffbb24>
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
    4154:	52000100 	beqzl	s0,4558 <_data-0x7fffbaa8>
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
    4190:	53000100 	beqzl	t8,4594 <_data-0x7fffba6c>
    4194:	00000000 	nop
	...
    41a4:	00540001 	movf	zero,v0,$fcc5
    41a8:	00000000 	nop
    41ac:	06000000 	bltz	s0,41b0 <_data-0x7fffbe50>
    41b0:	72007400 	0x72007400
    41b4:	009f2200 	0x9f2200
    41b8:	00000000 	nop
    41bc:	08000000 	j	0 <_data-0x80000000>
    41c0:	74007200 	jalx	1c800 <_data-0x7ffe3800>
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
    41f4:	52000100 	beqzl	s0,45f8 <_data-0x7fffba08>
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
    423c:	000fa000 	sll	s4,t7,0x0
    4240:	000faf88 	0xfaf88
    4244:	54000188 	bnezl	zero,4868 <_data-0x7fffb798>
    4248:	88000faf 	lwl	zero,4015(zero)
    424c:	88000fd0 	lwl	zero,4048(zero)
    4250:	01f30004 	sllv	zero,s3,t7
    4254:	00009f54 	0x9f54
    4258:	00000000 	nop
    425c:	0f400000 	jal	d000000 <_data-0x73000000>
    4260:	0f5c8800 	jal	d722000 <_data-0x728de000>
    4264:	00018800 	sll	s1,at,0x0
    4268:	000f5c54 	0xf5c54
    426c:	000f7088 	0xf7088
    4270:	61000188 	0x61000188
    4274:	88000f80 	lwl	zero,3968(zero)
    4278:	88000fa0 	lwl	zero,4000(zero)
    427c:	00610001 	movt	zero,v1,$fcc0
    4280:	00000000 	nop
    4284:	60000000 	0x60000000
    4288:	7488000f 	jalx	220003c <_data-0x7ddfffc4>
    428c:	0188000f 	0x188000f
    4290:	0f806000 	jal	e018000 <_data-0x71fe8000>
    4294:	0fa08800 	jal	e822000 <_data-0x717de000>
    4298:	00018800 	sll	s1,at,0x0
    429c:	00000060 	0x60
    42a0:	00000000 	nop
    42a4:	000fd000 	sll	k0,t7,0x0
    42a8:	000fdc88 	0xfdc88
    42ac:	54000188 	bnezl	zero,48d0 <_data-0x7fffb730>
    42b0:	88000fdc 	lwl	zero,4060(zero)
    42b4:	88000ff4 	lwl	zero,4084(zero)
    42b8:	f4600001 	sdc1	$f0,1(v1)
    42bc:	fc88000f 	sdc3	$8,15(a0)
    42c0:	0188000f 	0x188000f
    42c4:	00005200 	sll	t2,zero,0x8
	...
    42d4:	00060000 	sll	zero,a2,0x0
    42d8:	f020049e 	0xf020049e
    42dc:	0000bff0 	tge	zero,zero,0x2ff
    42e0:	00000000 	nop
    42e4:	10680000 	beq	v1,t0,42e8 <_data-0x7fffbd18>
    42e8:	10748800 	beq	v1,s4,fffe62ec <_text_end+0x77fe4d54>
    42ec:	00018800 	sll	s1,at,0x0
    42f0:	00000054 	0x54
    42f4:	00000000 	nop
    42f8:	00106800 	sll	t5,s0,0x0
    42fc:	00107488 	0x107488
    4300:	9e000688 	0x9e000688
    4304:	f0f01004 	0xf0f01004
    4308:	000000bf 	0xbf
    430c:	00000000 	nop
    4310:	00105400 	sll	t2,s0,0x10
    4314:	00106088 	0x106088
    4318:	54000188 	bnezl	zero,493c <_data-0x7fffb6c4>
    431c:	00000000 	nop
    4320:	00000000 	nop
    4324:	88001054 	lwl	zero,4180(zero)
    4328:	88001060 	lwl	zero,4192(zero)
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
    4368:	08007424 	j	1d090 <_data-0x7ffe2f70>
    436c:	9f211aff 	0x9f211aff
	...
    4378:	00540001 	movf	zero,v0,$fcc5
    437c:	00000000 	nop
    4380:	0b000000 	j	c000000 <_data-0x74000000>
    4384:	08007200 	j	1c800 <_data-0x7ffe3800>
    4388:	24481aff 	addiu	t0,v0,6911
    438c:	9f210074 	0x9f210074
	...
    4398:	88001048 	lwl	zero,4168(zero)
    439c:	8800104c 	lwl	zero,4172(zero)
    43a0:	00540001 	movf	zero,v0,$fcc5
    43a4:	00000000 	nop
    43a8:	48000000 	mfc2	zero,$0
    43ac:	4c880010 	0x4c880010
    43b0:	06880010 	tgei	s4,16
    43b4:	00049e00 	sll	s3,a0,0x18
    43b8:	00bfd030 	tge	a1,ra,0x340
    43bc:	00000000 	nop
    43c0:	fc000000 	sdc3	$0,0(zero)
    43c4:	0888000f 	j	220003c <_data-0x7ddfffc4>
    43c8:	03880010 	0x3880010
    43cc:	9f810900 	0x9f810900
	...
    43d8:	88000ffc 	lwl	zero,4092(zero)
    43dc:	88001008 	lwl	zero,4104(zero)
    43e0:	049e0006 	0x49e0006
    43e4:	bfd03008 	cache	0x10,12296(s8)
	...
    43f0:	88001008 	lwl	zero,4104(zero)
    43f4:	88001010 	lwl	zero,4112(zero)
    43f8:	80090003 	lb	t1,3(zero)
    43fc:	0000009f 	0x9f
    4400:	00000000 	nop
    4404:	00100800 	sll	at,s0,0x0
    4408:	00101088 	0x101088
    440c:	9e000688 	0x9e000688
    4410:	d0300c04 	0xd0300c04
    4414:	000000bf 	0xbf
    4418:	00000000 	nop
    441c:	00101000 	sll	v0,s0,0x0
    4420:	00101888 	0x101888
    4424:	08000388 	j	e20 <_data-0x7ffff1e0>
    4428:	00009f36 	tne	zero,zero,0x27c
    442c:	00000000 	nop
    4430:	10100000 	beq	zero,s0,4434 <_data-0x7fffbbcc>
    4434:	10188800 	beq	zero,t8,fffe6438 <_text_end+0x77fe4ea0>
    4438:	00068800 	sll	s1,a2,0x0
    443c:	3000049e 	andi	zero,zero,0x49e
    4440:	0000bfd0 	0xbfd0
    4444:	00000000 	nop
    4448:	10200000 	beqz	at,444c <_data-0x7fffbbb4>
    444c:	10248800 	beq	at,a0,fffe6450 <_text_end+0x77fe4eb8>
    4450:	00028800 	sll	s1,v0,0x0
    4454:	00009f33 	tltu	zero,zero,0x27c
    4458:	00000000 	nop
    445c:	10200000 	beqz	at,4460 <_data-0x7fffbba0>
    4460:	10248800 	beq	at,a0,fffe6464 <_text_end+0x77fe4ecc>
    4464:	00068800 	sll	s1,a2,0x0
    4468:	300c049e 	andi	t4,zero,0x49e
    446c:	0000bfd0 	0xbfd0
    4470:	00000000 	nop
    4474:	10180000 	beq	zero,t8,4478 <_data-0x7fffbb88>
    4478:	10208800 	beqz	at,fffe647c <_text_end+0x77fe4ee4>
    447c:	00028800 	sll	s1,v0,0x0
    4480:	00009f30 	tge	zero,zero,0x27c
    4484:	00000000 	nop
    4488:	10180000 	beq	zero,t8,448c <_data-0x7fffbb74>
    448c:	10208800 	beqz	at,fffe6490 <_text_end+0x77fe4ef8>
    4490:	00068800 	sll	s1,a2,0x0
    4494:	3004049e 	andi	a0,zero,0x49e
    4498:	0000bfd0 	0xbfd0
    449c:	00000000 	nop
    44a0:	10240000 	beq	at,a0,44a4 <_data-0x7fffbb5c>
    44a4:	10288800 	beq	at,t0,fffe64a8 <_text_end+0x77fe4f10>
    44a8:	00028800 	sll	s1,v0,0x0
    44ac:	00009f30 	tge	zero,zero,0x27c
    44b0:	00000000 	nop
    44b4:	10240000 	beq	at,a0,44b8 <_data-0x7fffbb48>
    44b8:	10288800 	beq	at,t0,fffe64bc <_text_end+0x77fe4f24>
    44bc:	00068800 	sll	s1,a2,0x0
    44c0:	3010049e 	andi	s0,zero,0x49e
    44c4:	0000bfd0 	0xbfd0
    44c8:	00000000 	nop
    44cc:	10280000 	beq	at,t0,44d0 <_data-0x7fffbb30>
    44d0:	102c8800 	beq	at,t4,fffe64d4 <_text_end+0x77fe4f3c>
    44d4:	00028800 	sll	s1,v0,0x0
    44d8:	00009f30 	tge	zero,zero,0x27c
    44dc:	00000000 	nop
    44e0:	10280000 	beq	at,t0,44e4 <_data-0x7fffbb1c>
    44e4:	102c8800 	beq	at,t4,fffe64e8 <_text_end+0x77fe4f50>
    44e8:	00068800 	sll	s1,a2,0x0
    44ec:	3004049e 	andi	a0,zero,0x49e
    44f0:	0000bfd0 	0xbfd0
	...
    4500:	00010000 	sll	zero,at,0x0
    4504:	00000055 	0x55
	...
    4514:	54000100 	bnezl	zero,4918 <_data-0x7fffb6e8>
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
    4560:	54000100 	bnezl	zero,4964 <_data-0x7fffb69c>
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
    45ac:	54000100 	bnezl	zero,49b0 <_data-0x7fffb650>
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
  10:	88000250 	lwl	zero,592(zero)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	00000028 	0x28
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	88000278 	lwl	zero,632(zero)
  1c:	00000038 	0x38
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	880002b0 	lwl	zero,688(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	00000060 	0x60
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	88000310 	lwl	zero,784(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	00000070 	tge	zero,zero,0x1
  30:	88000380 	lwl	zero,896(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	000000c8 	0xc8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	88000448 	lwl	zero,1096(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	000000cc 	syscall	0x3
  40:	88000514 	lwl	zero,1300(zero)
  44:	000000c8 	0xc8
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	880005dc 	lwl	zero,1500(zero)
  4c:	000001e8 	0x1e8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	880007c4 	lwl	zero,1988(zero)
  54:	000000d4 	0xd4
  58:	88000898 	lwl	zero,2200(zero)
  5c:	0000010c 	syscall	0x4
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  68:	0000001c 	0x1c
  6c:	48580002 	0x48580002
  70:	00040000 	sll	zero,a0,0x0
  74:	00000000 	nop
  78:	88000000 	lwl	zero,0(zero)
  7c:	00000250 	0x250
	...
  88:	00000044 	0x44
  8c:	487e0002 	0x487e0002
  90:	00040000 	sll	zero,a0,0x0
  94:	00000000 	nop
  98:	880009a4 	lwl	zero,2468(zero)
  9c:	000000c8 	0xc8
  a0:	00000000 	nop
  a4:	0000000c 	syscall
  a8:	00000000 	nop
  ac:	0000000c 	syscall
  b0:	88000a6c 	lwl	zero,2668(zero)
  b4:	00000098 	0x98
  b8:	88000b04 	lwl	zero,2820(zero)
  bc:	00000068 	0x68
  c0:	88000b6c 	lwl	zero,2924(zero)
  c4:	000000b4 	teq	zero,zero,0x2
	...
  d0:	0000001c 	0x1c
  d4:	4dee0002 	0x4dee0002
  d8:	00040000 	sll	zero,a0,0x0
  dc:	00000000 	nop
  e0:	88000c20 	lwl	zero,3104(zero)
  e4:	00000224 	0x224
	...
  f0:	0000001c 	0x1c
  f4:	4fb40002 	c3	0x1b40002
  f8:	00040000 	sll	zero,a0,0x0
  fc:	00000000 	nop
 100:	88000e44 	lwl	zero,3652(zero)
 104:	000000d8 	0xd8
	...
 110:	0000007c 	0x7c
 114:	51020002 	beql	t0,v0,120 <_data-0x7ffffee0>
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
 160:	88000f1c 	lwl	zero,3868(zero)
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
 194:	551c0002 	bnel	t0,gp,1a0 <_data-0x7ffffe60>
 198:	00040000 	sll	zero,a0,0x0
 19c:	00000000 	nop
 1a0:	88000f40 	lwl	zero,3904(zero)
 1a4:	00000060 	0x60
 1a8:	88000fa0 	lwl	zero,4000(zero)
 1ac:	00000030 	tge	zero,zero
	...
 1b8:	0000001c 	0x1c
 1bc:	566c0002 	bnel	s3,t4,1c8 <_data-0x7ffffe38>
 1c0:	00040000 	sll	zero,a0,0x0
 1c4:	00000000 	nop
 1c8:	88000fd0 	lwl	zero,4048(zero)
 1cc:	0000002c 	0x2c
	...
 1d8:	0000008c 	syscall	0x2
 1dc:	57220002 	bnel	t9,v0,1e8 <_data-0x7ffffe18>
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
 228:	88000ffc 	lwl	zero,4092(zero)
 22c:	00000038 	0x38
 230:	00000000 	nop
 234:	00000020 	add	zero,zero,zero
 238:	88001034 	lwl	zero,4148(zero)
 23c:	00000020 	add	zero,zero,zero
 240:	00000000 	nop
 244:	00000048 	0x48
 248:	88001054 	lwl	zero,4180(zero)
 24c:	00000014 	0x14
 250:	88001068 	lwl	zero,4200(zero)
 254:	00000014 	0x14
 258:	00000000 	nop
 25c:	00000014 	0x14
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	88000280 	lwl	zero,640(zero)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	880002a0 	lwl	zero,672(zero)
   8:	880002a4 	lwl	zero,676(zero)
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	880002b0 	lwl	zero,688(zero)
	...
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	88000288 	lwl	zero,648(zero)
  1c:	880002a0 	lwl	zero,672(zero)
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	880002a4 	lwl	zero,676(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	880002b0 	lwl	zero,688(zero)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  30:	88000290 	lwl	zero,656(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	880002a0 	lwl	zero,672(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	880002a4 	lwl	zero,676(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	880002b0 	lwl	zero,688(zero)
	...
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	88000298 	lwl	zero,664(zero)
  4c:	880002a0 	lwl	zero,672(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	880002a4 	lwl	zero,676(zero)
  54:	880002b0 	lwl	zero,688(zero)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	880002b8 	lwl	zero,696(zero)
  64:	88000300 	lwl	zero,768(zero)
  68:	88000304 	lwl	zero,772(zero)
  6c:	88000310 	lwl	zero,784(zero)
	...
  78:	880002c0 	lwl	zero,704(zero)
  7c:	88000300 	lwl	zero,768(zero)
  80:	88000304 	lwl	zero,772(zero)
  84:	88000310 	lwl	zero,784(zero)
	...
  90:	880002c8 	lwl	zero,712(zero)
  94:	88000300 	lwl	zero,768(zero)
  98:	88000304 	lwl	zero,772(zero)
  9c:	88000310 	lwl	zero,784(zero)
	...
  a8:	880002d0 	lwl	zero,720(zero)
  ac:	88000300 	lwl	zero,768(zero)
  b0:	88000304 	lwl	zero,772(zero)
  b4:	88000310 	lwl	zero,784(zero)
	...
  c0:	880002d8 	lwl	zero,728(zero)
  c4:	88000300 	lwl	zero,768(zero)
  c8:	88000304 	lwl	zero,772(zero)
  cc:	88000310 	lwl	zero,784(zero)
	...
  d8:	880002e0 	lwl	zero,736(zero)
  dc:	88000300 	lwl	zero,768(zero)
  e0:	88000304 	lwl	zero,772(zero)
  e4:	88000310 	lwl	zero,784(zero)
	...
  f0:	880002e8 	lwl	zero,744(zero)
  f4:	88000300 	lwl	zero,768(zero)
  f8:	88000304 	lwl	zero,772(zero)
  fc:	88000310 	lwl	zero,784(zero)
	...
 108:	880002f0 	lwl	zero,752(zero)
 10c:	88000300 	lwl	zero,768(zero)
 110:	88000304 	lwl	zero,772(zero)
 114:	88000310 	lwl	zero,784(zero)
	...
 120:	880002f8 	lwl	zero,760(zero)
 124:	88000300 	lwl	zero,768(zero)
 128:	88000304 	lwl	zero,772(zero)
 12c:	88000310 	lwl	zero,784(zero)
	...
 138:	88000384 	lwl	zero,900(zero)
 13c:	88000388 	lwl	zero,904(zero)
 140:	88000398 	lwl	zero,920(zero)
 144:	880003c4 	lwl	zero,964(zero)
	...
 150:	88000384 	lwl	zero,900(zero)
 154:	88000388 	lwl	zero,904(zero)
 158:	88000398 	lwl	zero,920(zero)
 15c:	880003a0 	lwl	zero,928(zero)
 160:	880003a4 	lwl	zero,932(zero)
 164:	880003b8 	lwl	zero,952(zero)
	...
 170:	880003c4 	lwl	zero,964(zero)
 174:	880003c8 	lwl	zero,968(zero)
 178:	880003cc 	lwl	zero,972(zero)
 17c:	8800041c 	lwl	zero,1052(zero)
 180:	88000424 	lwl	zero,1060(zero)
 184:	88000438 	lwl	zero,1080(zero)
	...
 190:	880003c4 	lwl	zero,964(zero)
 194:	880003c8 	lwl	zero,968(zero)
 198:	880003d4 	lwl	zero,980(zero)
 19c:	880003dc 	lwl	zero,988(zero)
 1a0:	880003e0 	lwl	zero,992(zero)
 1a4:	880003f4 	lwl	zero,1012(zero)
 1a8:	880003f8 	lwl	zero,1016(zero)
 1ac:	880003fc 	lwl	zero,1020(zero)
	...
 1b8:	88000414 	lwl	zero,1044(zero)
 1bc:	8800041c 	lwl	zero,1052(zero)
 1c0:	88000424 	lwl	zero,1060(zero)
 1c4:	88000430 	lwl	zero,1072(zero)
	...
 1d0:	8800044c 	lwl	zero,1100(zero)
 1d4:	88000450 	lwl	zero,1104(zero)
 1d8:	88000460 	lwl	zero,1120(zero)
 1dc:	88000490 	lwl	zero,1168(zero)
	...
 1e8:	8800044c 	lwl	zero,1100(zero)
 1ec:	88000450 	lwl	zero,1104(zero)
 1f0:	88000460 	lwl	zero,1120(zero)
 1f4:	88000468 	lwl	zero,1128(zero)
 1f8:	8800046c 	lwl	zero,1132(zero)
 1fc:	88000480 	lwl	zero,1152(zero)
	...
 208:	88000490 	lwl	zero,1168(zero)
 20c:	88000494 	lwl	zero,1172(zero)
 210:	88000498 	lwl	zero,1176(zero)
 214:	880004ec 	lwl	zero,1260(zero)
 218:	880004f4 	lwl	zero,1268(zero)
 21c:	88000508 	lwl	zero,1288(zero)
	...
 228:	88000490 	lwl	zero,1168(zero)
 22c:	88000494 	lwl	zero,1172(zero)
 230:	880004a0 	lwl	zero,1184(zero)
 234:	880004a8 	lwl	zero,1192(zero)
 238:	880004ac 	lwl	zero,1196(zero)
 23c:	880004c0 	lwl	zero,1216(zero)
 240:	880004c4 	lwl	zero,1220(zero)
 244:	880004c8 	lwl	zero,1224(zero)
	...
 250:	880004e4 	lwl	zero,1252(zero)
 254:	880004ec 	lwl	zero,1260(zero)
 258:	880004f4 	lwl	zero,1268(zero)
 25c:	88000500 	lwl	zero,1280(zero)
	...
 268:	88000518 	lwl	zero,1304(zero)
 26c:	8800051c 	lwl	zero,1308(zero)
 270:	8800052c 	lwl	zero,1324(zero)
 274:	8800055c 	lwl	zero,1372(zero)
	...
 280:	88000518 	lwl	zero,1304(zero)
 284:	8800051c 	lwl	zero,1308(zero)
 288:	8800052c 	lwl	zero,1324(zero)
 28c:	88000534 	lwl	zero,1332(zero)
 290:	88000538 	lwl	zero,1336(zero)
 294:	8800054c 	lwl	zero,1356(zero)
	...
 2a0:	8800055c 	lwl	zero,1372(zero)
 2a4:	88000560 	lwl	zero,1376(zero)
 2a8:	88000564 	lwl	zero,1380(zero)
 2ac:	880005b4 	lwl	zero,1460(zero)
 2b0:	880005bc 	lwl	zero,1468(zero)
 2b4:	880005d0 	lwl	zero,1488(zero)
	...
 2c0:	8800055c 	lwl	zero,1372(zero)
 2c4:	88000560 	lwl	zero,1376(zero)
 2c8:	8800056c 	lwl	zero,1388(zero)
 2cc:	88000574 	lwl	zero,1396(zero)
 2d0:	88000578 	lwl	zero,1400(zero)
 2d4:	88000588 	lwl	zero,1416(zero)
 2d8:	8800058c 	lwl	zero,1420(zero)
 2dc:	88000590 	lwl	zero,1424(zero)
	...
 2e8:	880005ac 	lwl	zero,1452(zero)
 2ec:	880005b4 	lwl	zero,1460(zero)
 2f0:	880005bc 	lwl	zero,1468(zero)
 2f4:	880005c8 	lwl	zero,1480(zero)
	...
 300:	8800069c 	lwl	zero,1692(zero)
 304:	88000790 	lwl	zero,1936(zero)
 308:	880007b4 	lwl	zero,1972(zero)
 30c:	880007b8 	lwl	zero,1976(zero)
 310:	880007bc 	lwl	zero,1980(zero)
 314:	880007c4 	lwl	zero,1988(zero)
	...
 320:	880006a8 	lwl	zero,1704(zero)
 324:	88000790 	lwl	zero,1936(zero)
 328:	880007b4 	lwl	zero,1972(zero)
 32c:	880007b8 	lwl	zero,1976(zero)
 330:	880007bc 	lwl	zero,1980(zero)
 334:	880007c4 	lwl	zero,1988(zero)
	...
 340:	880006b4 	lwl	zero,1716(zero)
 344:	88000790 	lwl	zero,1936(zero)
 348:	880007b4 	lwl	zero,1972(zero)
 34c:	880007b8 	lwl	zero,1976(zero)
 350:	880007bc 	lwl	zero,1980(zero)
 354:	880007c4 	lwl	zero,1988(zero)
	...
 360:	880006c0 	lwl	zero,1728(zero)
 364:	88000790 	lwl	zero,1936(zero)
 368:	880007b4 	lwl	zero,1972(zero)
 36c:	880007b8 	lwl	zero,1976(zero)
 370:	880007bc 	lwl	zero,1980(zero)
 374:	880007c4 	lwl	zero,1988(zero)
	...
 380:	880006cc 	lwl	zero,1740(zero)
 384:	88000790 	lwl	zero,1936(zero)
 388:	880007b4 	lwl	zero,1972(zero)
 38c:	880007b8 	lwl	zero,1976(zero)
 390:	880007bc 	lwl	zero,1980(zero)
 394:	880007c4 	lwl	zero,1988(zero)
	...
 3a0:	880006d8 	lwl	zero,1752(zero)
 3a4:	88000790 	lwl	zero,1936(zero)
 3a8:	880007b4 	lwl	zero,1972(zero)
 3ac:	880007b8 	lwl	zero,1976(zero)
 3b0:	880007bc 	lwl	zero,1980(zero)
 3b4:	880007c4 	lwl	zero,1988(zero)
	...
 3c0:	880006e4 	lwl	zero,1764(zero)
 3c4:	88000790 	lwl	zero,1936(zero)
 3c8:	880007b4 	lwl	zero,1972(zero)
 3cc:	880007b8 	lwl	zero,1976(zero)
 3d0:	880007bc 	lwl	zero,1980(zero)
 3d4:	880007c4 	lwl	zero,1988(zero)
	...
 3e0:	880006f0 	lwl	zero,1776(zero)
 3e4:	88000790 	lwl	zero,1936(zero)
 3e8:	880007b4 	lwl	zero,1972(zero)
 3ec:	880007b8 	lwl	zero,1976(zero)
 3f0:	880007bc 	lwl	zero,1980(zero)
 3f4:	880007c4 	lwl	zero,1988(zero)
	...
 400:	880006fc 	lwl	zero,1788(zero)
 404:	88000790 	lwl	zero,1936(zero)
 408:	880007b4 	lwl	zero,1972(zero)
 40c:	880007b8 	lwl	zero,1976(zero)
 410:	880007bc 	lwl	zero,1980(zero)
 414:	880007c4 	lwl	zero,1988(zero)
	...
 420:	88000708 	lwl	zero,1800(zero)
 424:	88000790 	lwl	zero,1936(zero)
 428:	880007b4 	lwl	zero,1972(zero)
 42c:	880007b8 	lwl	zero,1976(zero)
 430:	880007bc 	lwl	zero,1980(zero)
 434:	880007c4 	lwl	zero,1988(zero)
	...
 440:	88000714 	lwl	zero,1812(zero)
 444:	88000790 	lwl	zero,1936(zero)
 448:	880007b4 	lwl	zero,1972(zero)
 44c:	880007b8 	lwl	zero,1976(zero)
 450:	880007bc 	lwl	zero,1980(zero)
 454:	880007c4 	lwl	zero,1988(zero)
	...
 460:	88000720 	lwl	zero,1824(zero)
 464:	88000790 	lwl	zero,1936(zero)
 468:	880007b4 	lwl	zero,1972(zero)
 46c:	880007b8 	lwl	zero,1976(zero)
 470:	880007bc 	lwl	zero,1980(zero)
 474:	880007c4 	lwl	zero,1988(zero)
	...
 480:	8800072c 	lwl	zero,1836(zero)
 484:	88000790 	lwl	zero,1936(zero)
 488:	880007b4 	lwl	zero,1972(zero)
 48c:	880007b8 	lwl	zero,1976(zero)
 490:	880007bc 	lwl	zero,1980(zero)
 494:	880007c4 	lwl	zero,1988(zero)
	...
 4a0:	88000738 	lwl	zero,1848(zero)
 4a4:	88000790 	lwl	zero,1936(zero)
 4a8:	880007b4 	lwl	zero,1972(zero)
 4ac:	880007b8 	lwl	zero,1976(zero)
 4b0:	880007bc 	lwl	zero,1980(zero)
 4b4:	880007c4 	lwl	zero,1988(zero)
	...
 4c0:	88000744 	lwl	zero,1860(zero)
 4c4:	88000790 	lwl	zero,1936(zero)
 4c8:	880007b4 	lwl	zero,1972(zero)
 4cc:	880007b8 	lwl	zero,1976(zero)
 4d0:	880007bc 	lwl	zero,1980(zero)
 4d4:	880007c4 	lwl	zero,1988(zero)
	...
 4e0:	88000750 	lwl	zero,1872(zero)
 4e4:	88000790 	lwl	zero,1936(zero)
 4e8:	880007b4 	lwl	zero,1972(zero)
 4ec:	880007b8 	lwl	zero,1976(zero)
 4f0:	880007bc 	lwl	zero,1980(zero)
 4f4:	880007c4 	lwl	zero,1988(zero)
	...
 500:	88000758 	lwl	zero,1880(zero)
 504:	88000790 	lwl	zero,1936(zero)
 508:	880007b4 	lwl	zero,1972(zero)
 50c:	880007b8 	lwl	zero,1976(zero)
 510:	880007bc 	lwl	zero,1980(zero)
 514:	880007c4 	lwl	zero,1988(zero)
	...
 520:	88000760 	lwl	zero,1888(zero)
 524:	88000790 	lwl	zero,1936(zero)
 528:	880007b4 	lwl	zero,1972(zero)
 52c:	880007b8 	lwl	zero,1976(zero)
 530:	880007bc 	lwl	zero,1980(zero)
 534:	880007c4 	lwl	zero,1988(zero)
	...
 540:	88000768 	lwl	zero,1896(zero)
 544:	88000790 	lwl	zero,1936(zero)
 548:	880007b4 	lwl	zero,1972(zero)
 54c:	880007b8 	lwl	zero,1976(zero)
 550:	880007bc 	lwl	zero,1980(zero)
 554:	880007c4 	lwl	zero,1988(zero)
	...
 560:	88000770 	lwl	zero,1904(zero)
 564:	88000790 	lwl	zero,1936(zero)
 568:	880007b4 	lwl	zero,1972(zero)
 56c:	880007b8 	lwl	zero,1976(zero)
 570:	880007bc 	lwl	zero,1980(zero)
 574:	880007c4 	lwl	zero,1988(zero)
	...
 580:	88000778 	lwl	zero,1912(zero)
 584:	88000790 	lwl	zero,1936(zero)
 588:	880007b4 	lwl	zero,1972(zero)
 58c:	880007b8 	lwl	zero,1976(zero)
 590:	880007bc 	lwl	zero,1980(zero)
 594:	880007c4 	lwl	zero,1988(zero)
	...
 5a0:	88000780 	lwl	zero,1920(zero)
 5a4:	88000790 	lwl	zero,1936(zero)
 5a8:	880007b4 	lwl	zero,1972(zero)
 5ac:	880007b8 	lwl	zero,1976(zero)
 5b0:	880007bc 	lwl	zero,1980(zero)
 5b4:	880007c4 	lwl	zero,1988(zero)
	...
 5c0:	88000788 	lwl	zero,1928(zero)
 5c4:	88000790 	lwl	zero,1936(zero)
 5c8:	880007b4 	lwl	zero,1972(zero)
 5cc:	880007b8 	lwl	zero,1976(zero)
 5d0:	880007bc 	lwl	zero,1980(zero)
 5d4:	880007c4 	lwl	zero,1988(zero)
	...
 5e0:	880007b4 	lwl	zero,1972(zero)
 5e4:	880007b8 	lwl	zero,1976(zero)
 5e8:	880007bc 	lwl	zero,1980(zero)
 5ec:	880007c4 	lwl	zero,1988(zero)
	...
 5f8:	88000898 	lwl	zero,2200(zero)
 5fc:	8800089c 	lwl	zero,2204(zero)
 600:	880008a0 	lwl	zero,2208(zero)
 604:	880008a4 	lwl	zero,2212(zero)
 608:	880008a8 	lwl	zero,2216(zero)
 60c:	880008b0 	lwl	zero,2224(zero)
	...
 618:	88000250 	lwl	zero,592(zero)
 61c:	88000278 	lwl	zero,632(zero)
 620:	88000278 	lwl	zero,632(zero)
 624:	880002b0 	lwl	zero,688(zero)
 628:	880002b0 	lwl	zero,688(zero)
 62c:	88000310 	lwl	zero,784(zero)
 630:	88000310 	lwl	zero,784(zero)
 634:	88000380 	lwl	zero,896(zero)
 638:	88000380 	lwl	zero,896(zero)
 63c:	88000448 	lwl	zero,1096(zero)
 640:	88000448 	lwl	zero,1096(zero)
 644:	88000514 	lwl	zero,1300(zero)
 648:	88000514 	lwl	zero,1300(zero)
 64c:	880005dc 	lwl	zero,1500(zero)
 650:	880005dc 	lwl	zero,1500(zero)
 654:	880007c4 	lwl	zero,1988(zero)
 658:	880007c4 	lwl	zero,1988(zero)
 65c:	88000898 	lwl	zero,2200(zero)
 660:	88000898 	lwl	zero,2200(zero)
 664:	880009a4 	lwl	zero,2468(zero)
	...
 670:	88000a74 	lwl	zero,2676(zero)
 674:	88000a78 	lwl	zero,2680(zero)
 678:	88000a94 	lwl	zero,2708(zero)
 67c:	88000abc 	lwl	zero,2748(zero)
	...
 688:	88000b0c 	lwl	zero,2828(zero)
 68c:	88000b10 	lwl	zero,2832(zero)
 690:	88000b20 	lwl	zero,2848(zero)
 694:	88000b58 	lwl	zero,2904(zero)
	...
 6a0:	88000b0c 	lwl	zero,2828(zero)
 6a4:	88000b10 	lwl	zero,2832(zero)
 6a8:	88000b20 	lwl	zero,2848(zero)
 6ac:	88000b24 	lwl	zero,2852(zero)
 6b0:	88000b28 	lwl	zero,2856(zero)
 6b4:	88000b50 	lwl	zero,2896(zero)
	...
 6c0:	880009a4 	lwl	zero,2468(zero)
 6c4:	88000a6c 	lwl	zero,2668(zero)
 6c8:	00000001 	movf	zero,zero,$fcc0
 6cc:	00000001 	movf	zero,zero,$fcc0
 6d0:	00000001 	movf	zero,zero,$fcc0
 6d4:	00000001 	movf	zero,zero,$fcc0
 6d8:	88000a6c 	lwl	zero,2668(zero)
 6dc:	88000b04 	lwl	zero,2820(zero)
 6e0:	88000b04 	lwl	zero,2820(zero)
 6e4:	88000b6c 	lwl	zero,2924(zero)
 6e8:	88000b6c 	lwl	zero,2924(zero)
 6ec:	88000c20 	lwl	zero,3104(zero)
	...
 6f8:	88000c58 	lwl	zero,3160(zero)
 6fc:	88000c5c 	lwl	zero,3164(zero)
 700:	88000ce0 	lwl	zero,3296(zero)
 704:	88000cf0 	lwl	zero,3312(zero)
 708:	88000e2c 	lwl	zero,3628(zero)
 70c:	88000e3c 	lwl	zero,3644(zero)
	...
 718:	88000cdc 	lwl	zero,3292(zero)
 71c:	88000ce0 	lwl	zero,3296(zero)
 720:	88000d08 	lwl	zero,3336(zero)
 724:	88000d10 	lwl	zero,3344(zero)
 728:	88000d64 	lwl	zero,3428(zero)
 72c:	88000d74 	lwl	zero,3444(zero)
 730:	88000d80 	lwl	zero,3456(zero)
 734:	88000d90 	lwl	zero,3472(zero)
 738:	88000d98 	lwl	zero,3480(zero)
 73c:	88000dd4 	lwl	zero,3540(zero)
 740:	88000ddc 	lwl	zero,3548(zero)
 744:	88000de0 	lwl	zero,3552(zero)
 748:	88000de8 	lwl	zero,3560(zero)
 74c:	88000df0 	lwl	zero,3568(zero)
 750:	88000df8 	lwl	zero,3576(zero)
 754:	88000dfc 	lwl	zero,3580(zero)
 758:	88000e00 	lwl	zero,3584(zero)
 75c:	88000e24 	lwl	zero,3620(zero)
	...
 768:	88000c20 	lwl	zero,3104(zero)
 76c:	88000e44 	lwl	zero,3652(zero)
	...
 778:	88000e44 	lwl	zero,3652(zero)
 77c:	88000f1c 	lwl	zero,3868(zero)
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
 7c8:	88000f1c 	lwl	zero,3868(zero)
 7cc:	88000f40 	lwl	zero,3904(zero)
 7d0:	00000001 	movf	zero,zero,$fcc0
 7d4:	00000001 	movf	zero,zero,$fcc0
 7d8:	00000001 	movf	zero,zero,$fcc0
 7dc:	00000001 	movf	zero,zero,$fcc0
 7e0:	00000001 	movf	zero,zero,$fcc0
 7e4:	00000001 	movf	zero,zero,$fcc0
 7e8:	00000001 	movf	zero,zero,$fcc0
 7ec:	00000001 	movf	zero,zero,$fcc0
	...
 7f8:	88000f58 	lwl	zero,3928(zero)
 7fc:	88000f5c 	lwl	zero,3932(zero)
 800:	88000f80 	lwl	zero,3968(zero)
 804:	88000f98 	lwl	zero,3992(zero)
	...
 810:	88000f40 	lwl	zero,3904(zero)
 814:	88000fa0 	lwl	zero,4000(zero)
 818:	88000fa0 	lwl	zero,4000(zero)
 81c:	88000fd0 	lwl	zero,4048(zero)
	...
 828:	88000fd0 	lwl	zero,4048(zero)
 82c:	88000ffc 	lwl	zero,4092(zero)
	...
 838:	88001018 	lwl	zero,4120(zero)
 83c:	8800101c 	lwl	zero,4124(zero)
 840:	88001020 	lwl	zero,4128(zero)
 844:	88001024 	lwl	zero,4132(zero)
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
 890:	88000ffc 	lwl	zero,4092(zero)
 894:	88001034 	lwl	zero,4148(zero)
 898:	00000001 	movf	zero,zero,$fcc0
 89c:	00000001 	movf	zero,zero,$fcc0
 8a0:	88001034 	lwl	zero,4148(zero)
 8a4:	88001054 	lwl	zero,4180(zero)
 8a8:	00000001 	movf	zero,zero,$fcc0
 8ac:	00000001 	movf	zero,zero,$fcc0
 8b0:	88001054 	lwl	zero,4180(zero)
 8b4:	88001068 	lwl	zero,4200(zero)
 8b8:	88001068 	lwl	zero,4200(zero)
 8bc:	8800107c 	lwl	zero,4220(zero)
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
  1c:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	00006564 	0x6564
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	76697274 	jalx	9a5c9d0 <_data-0x765a3630>
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
  48:	05000000 	bltz	t0,4c <_data-0x7fffffb4>
  4c:	00025002 	srl	t2,v0,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	01130388 	0x1130388
  54:	003d0814 	0x3d0814
  58:	06010402 	bgez	s0,1064 <_data-0x7fffef9c>
  5c:	024b0682 	0x24b0682
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	01010008 	0x1010008
  64:	78020500 	0x78020500
  68:	03880002 	0x3880002
  6c:	030100f3 	tltu	t8,at,0x3
  70:	0e038275 	jal	80e09d4 <_data-0x77f1f62c>
  74:	7903e408 	0x7903e408
  78:	000c024a 	0xc024a
  7c:	05000101 	bltz	t0,484 <_data-0x7ffffb7c>
  80:	0002b002 	srl	s6,v0,0x0
  84:	00f30388 	0xf30388
  88:	82750301 	lb	s5,769(s3)
  8c:	48020e03 	0x48020e03
  90:	4a790301 	c2	0x790301
  94:	01000c02 	0x1000c02
  98:	02050001 	movt	zero,s0,$fcc1
  9c:	88000310 	lwl	zero,784(zero)
  a0:	bb013503 	swr	at,13571(t8)
  a4:	bb838349 	swr	v1,-31927(gp)
  a8:	0200834c 	syscall	0x8020d
  ac:	ba060104 	swr	a2,260(s0)
  b0:	04040200 	0x4040200
  b4:	02004b06 	0x2004b06
  b8:	887e0404 	lwl	s8,1028(v1)
  bc:	01001802 	0x1001802
  c0:	00020401 	0x20401
  c4:	03800205 	0x3800205
  c8:	461a8800 	add.s	$f0,$f17,$f26
  cc:	7603c04e 	jalx	80f0138 <_data-0x77f0fec8>
  d0:	820b034a 	lb	t3,842(s0)
  d4:	02040200 	0x2040200
  d8:	004a7503 	0x4a7503
  dc:	03020402 	0x3020402
  e0:	003c080c 	syscall	0xf020
  e4:	49020402 	bc2fl	10f0 <_data-0x7fffef10>
  e8:	03827503 	0x3827503
  ec:	034b4a0e 	0x34b4a0e
  f0:	0f038271 	jal	c0e09c4 <_data-0x73f1f63c>
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
 130:	05000204 	bltz	t0,944 <_data-0x7ffff6bc>
 134:	00044802 	srl	t1,a0,0x0
 138:	4e461a88 	c3	0x461a88
 13c:	4a7603c0 	c2	0x7603c0
 140:	03820b03 	0x3820b03
 144:	0c034a75 	jal	d29d4 <_data-0x7ff2d62c>
 148:	03813c08 	0x3813c08
 14c:	0e038275 	jal	80e09d4 <_data-0x77f1f62c>
 150:	71034b4a 	0x71034b4a
 154:	820f0382 	lb	t7,898(s0)
 158:	034a7103 	0x34a7103
 15c:	033c0810 	0x33c0810
 160:	10034a70 	beq	zero,v1,12b24 <_data-0x7ffed4dc>
 164:	0301044a 	0x301044a
 168:	04ba00ea 	0x4ba00ea
 16c:	7f990302 	0x7f990302
 170:	03010482 	0x3010482
 174:	048200d1 	bltzl	a0,4bc <_data-0x7ffffb44>
 178:	7fb30302 	0x7fb30302
 17c:	03010482 	0x3010482
 180:	048200d4 	bltzl	a0,4d4 <_data-0x7ffffb2c>
 184:	04020002 	bltzl	zero,190 <_data-0x7ffffe70>
 188:	7fa40302 	0x7fa40302
 18c:	0c028aba 	jal	a2ae8 <_data-0x7ff5d518>
 190:	04010100 	b	594 <_data-0x7ffffa6c>
 194:	02050002 	0x2050002
 198:	88000514 	lwl	zero,1300(zero)
 19c:	c04e461a 	ll	t6,17946(v0)
 1a0:	034a7603 	0x34a7603
 1a4:	7503820b 	jalx	40e082c <_data-0x7bf1f7d4>
 1a8:	080c034a 	j	300d28 <_data-0x7fcff2d8>
 1ac:	7503813c 	jalx	40e04f0 <_data-0x7bf1fb10>
 1b0:	4a0e0382 	c2	0xe0382
 1b4:	8271034b 	lb	s1,843(s3)
 1b8:	03820f03 	0x3820f03
 1bc:	10034a71 	beq	zero,v1,12b84 <_data-0x7ffed47c>
 1c0:	4a7003f2 	c2	0x7003f2
 1c4:	044a1003 	tlti	v0,4099
 1c8:	00ea0301 	0xea0301
 1cc:	030204ba 	0x30204ba
 1d0:	04827f99 	bltzl	a0,20038 <_data-0x7ffdffc8>
 1d4:	00d10301 	0xd10301
 1d8:	03020482 	0x3020482
 1dc:	04827fb3 	bltzl	a0,200ac <_data-0x7ffdff54>
 1e0:	00d40301 	0xd40301
 1e4:	00020482 	srl	zero,v0,0x12
 1e8:	03020402 	0x3020402
 1ec:	8aba7fa4 	lwl	k0,32676(s5)
 1f0:	01000c02 	0x1000c02
 1f4:	02050001 	movt	zero,s0,$fcc1
 1f8:	880005dc 	lwl	zero,1500(zero)
 1fc:	0100e603 	0x100e603
 200:	02125402 	0x2125402
 204:	fc021464 	sdc3	$2,5220(zero)
 208:	24021401 	li	v0,5121
 20c:	024f4517 	0x24f4517
 210:	01010008 	0x1010008
 214:	c4020500 	lwc1	$f2,1280(zero)
 218:	03880007 	srav	zero,t0,gp
 21c:	bc0100f3 	cache	0x1,243(zero)
 220:	1301bc02 	beq	t8,at,fffef22c <_text_end+0x77fedc94>
 224:	01000c02 	0x1000c02
 228:	00020401 	0x20401
 22c:	08980205 	j	2600814 <_data-0x7d9ff7ec>
 230:	1e038800 	0x1e038800
 234:	03010401 	0x3010401
 238:	040100e0 	b	5bc <_data-0x7ffffa44>
 23c:	7fa00302 	0x7fa00302
 240:	0301044a 	0x301044a
 244:	044a00e0 	tlti	v0,224
 248:	7fa00302 	0x7fa00302
 24c:	0301044a 	0x301044a
 250:	044a00e0 	tlti	v0,224
 254:	7fa20302 	0x7fa20302
 258:	03010482 	0x3010482
 25c:	038200de 	0x38200de
 260:	0483826a 	bgezl	a0,fffe0c0c <_text_end+0x77fdf674>
 264:	7fba0302 	0x7fba0302
 268:	01019c02 	0x1019c02
 26c:	db030104 	ldc2	$3,260(t8)
 270:	02048200 	0x2048200
 274:	087fa803 	j	1fea00c <_data-0x7e015ff4>
 278:	03010474 	teq	t8,at,0x11
 27c:	048200d8 	bltzl	a0,5e0 <_data-0x7ffffa20>
 280:	7fac0302 	0x7fac0302
 284:	00100282 	srl	zero,s0,0xa
 288:	008e0101 	0x8e0101
 28c:	00020000 	sll	zero,v0,0x0
 290:	00000028 	0x28
 294:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 298:	0101000d 	break	0x101
 29c:	00000101 	0x101
 2a0:	00000100 	sll	zero,zero,0x4
 2a4:	69747501 	0x69747501
 2a8:	7974696c 	0x7974696c
 2ac:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 2b0:	75747261 	jalx	5d1c984 <_data-0x7a2e367c>
 2b4:	00532e70 	tge	v0,s3,0xb9
 2b8:	00000001 	movf	zero,zero,$fcc0
 2bc:	00020500 	sll	zero,v0,0x14
 2c0:	19880000 	0x19880000
 2c4:	4b4f4b83 	c2	0x14f4b83
 2c8:	834d4b4e 	lb	t5,19278(k0)
 2cc:	4b4d4b85 	c2	0x14d4b85
 2d0:	4b834c4d 	c2	0x1834c4d
 2d4:	4b4b4d83 	c2	0x14b4d83
 2d8:	834d4b4b 	lb	t5,19275(k0)
 2dc:	034b4b4b 	0x34b4b4b
 2e0:	01fc0212 	0x1fc0212
 2e4:	834b4c01 	lb	t3,19457(k0)
 2e8:	4b4b4b4d 	c2	0x14b4b4d
 2ec:	4b4b4b4b 	c2	0x14b4b4b
 2f0:	4b4b4b4b 	c2	0x14b4b4b
 2f4:	4b4b4b4b 	c2	0x14b4b4b
 2f8:	4b4b4b4b 	c2	0x14b4b4b
 2fc:	4b4b4b4b 	c2	0x14b4b4b
 300:	4b4b4b4b 	c2	0x14b4b4b
 304:	4c4b4b4b 	0x4c4b4b4b
 308:	4b4b4b4b 	c2	0x14b4b4b
 30c:	4b4b4b4b 	c2	0x14b4b4b
 310:	4c4b4c4b 	0x4c4b4c4b
 314:	024b4b4b 	0x24b4b4b
 318:	01010004 	sllv	zero,at,t0
 31c:	00000159 	0x159
 320:	00870002 	0x870002
 324:	01010000 	0x1010000
 328:	000d0efb 	0xd0efb
 32c:	01010101 	0x1010101
 330:	01000000 	0x1000000
 334:	75010000 	jalx	4040000 <_data-0x7bfc0000>
 338:	696c6974 	0x696c6974
 33c:	69007974 	0x69007974
 340:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 344:	00006564 	0x6564
 348:	6e69616d 	0x6e69616d
 34c:	0100632e 	0x100632e
 350:	6f630000 	0x6f630000
 354:	6e6f6d6d 	0x6e6f6d6d
 358:	0200682e 	0x200682e
 35c:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 360:	746e6964 	jalx	1b9a590 <_data-0x7e465a70>
 364:	0200682e 	0x200682e
 368:	616d0000 	0x616d0000
 36c:	6e696863 	0x6e696863
 370:	00682e65 	0x682e65
 374:	65000002 	0x65000002
 378:	70656378 	0x70656378
 37c:	6e6f6974 	0x6e6f6974
 380:	0200682e 	0x200682e
 384:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 388:	2e6f6964 	sltiu	t7,s3,26980
 38c:	00020068 	0x20068
 390:	72747300 	0x72747300
 394:	2e676e69 	sltiu	a3,s3,28265
 398:	00020068 	0x20068
 39c:	6f6f6200 	0x6f6f6200
 3a0:	72747374 	0x72747374
 3a4:	682e7061 	0x682e7061
 3a8:	00000200 	sll	zero,zero,0x8
 3ac:	02050000 	0x2050000
 3b0:	880009a4 	lwl	zero,2468(zero)
 3b4:	bc010a03 	cache	0x1,2563(zero)
 3b8:	45c18484 	0x45c18484
 3bc:	454f454f 	0x454f454f
 3c0:	83864787 	lb	a2,18311(gp)
 3c4:	8385f5f3 	lb	a1,-2573(gp)
 3c8:	b7b8c183 	0xb7b8c183
 3cc:	000802bf 	0x802bf
 3d0:	05000101 	bltz	t0,7d8 <_data-0x7ffff828>
 3d4:	00000002 	srl	zero,zero,0x0
 3d8:	012b0300 	0x12b0300
 3dc:	08024f14 	j	93c50 <_data-0x7ff6c3b0>
 3e0:	00010100 	sll	zero,at,0x4
 3e4:	00000205 	0x205
 3e8:	34030000 	li	v1,0x0
 3ec:	024f1401 	0x24f1401
 3f0:	01010008 	0x1010008
 3f4:	6c020500 	0x6c020500
 3f8:	0388000a 	movz	zero,gp,t0
 3fc:	4884013d 	0x4884013d
 400:	4b833c08 	c2	0x1833c08
 404:	04020049 	bltzl	zero,52c <_data-0x7ffffad4>
 408:	02004b03 	0x2004b03
 40c:	3b080304 	xori	t0,t8,0x304
 410:	13280285 	beq	t9,t0,e28 <_data-0x7ffff1d8>
 414:	01002002 	0x1002002
 418:	02050001 	movt	zero,s0,$fcc1
 41c:	88000b04 	lwl	zero,2820(zero)
 420:	0100c403 	0x100c403
 424:	03820c03 	0x3820c03
 428:	03ba4a74 	teq	sp,k0,0x129
 42c:	75034a0c 	jalx	40d2830 <_data-0x7bf2d7d0>
 430:	0402004a 	bltzl	zero,55c <_data-0x7ffffaa4>
 434:	02004c03 	0x2004c03
 438:	09030304 	j	40c0c10 <_data-0x7bf3f3f0>
 43c:	02003c08 	0x2003c08
 440:	75030304 	jalx	40c0c10 <_data-0x7bf3f3f0>
 444:	0d033c08 	jal	40cf020 <_data-0x7bf30fe0>
 448:	00140282 	srl	zero,s4,0xa
 44c:	05000101 	bltz	t0,854 <_data-0x7ffff7ac>
 450:	000b6c02 	srl	t5,t3,0x10
 454:	00d40388 	0xd40388
 458:	4b49bb01 	c2	0x149bb01
 45c:	83834b49 	lb	v1,19273(gp)
 460:	8483c1bb 	lh	v1,-15941(a0)
 464:	f25503b9 	0xf25503b9
 468:	844a2403 	lh	t2,9219(v0)
 46c:	74085103 	jalx	21440c <_data-0x7fdebbf4>
 470:	bb4a2f03 	swr	t2,12035(k0)
 474:	01001002 	0x1001002
 478:	0000aa01 	0xaa01
 47c:	1f000200 	bgtz	t8,c80 <_data-0x7ffff380>
 480:	01000000 	0x1000000
 484:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 488:	01010100 	0x1010100
 48c:	00000001 	movf	zero,zero,$fcc0
 490:	01000001 	movf	zero,t0,$fcc0
 494:	69727000 	0x69727000
 498:	2e66746e 	sltiu	a2,s3,29806
 49c:	00000063 	0x63
 4a0:	05000000 	bltz	t0,4a4 <_data-0x7ffffb5c>
 4a4:	000c2002 	srl	a0,t4,0x0
 4a8:	03881388 	0x3881388
 4ac:	3c084a7a 	lui	t0,0x4a7a
 4b0:	c5034cf8 	lwc1	$f3,19704(t0)
 4b4:	02004a00 	0x2004a00
 4b8:	bb030104 	swr	v1,260(t8)
 4bc:	cb034a7f 	lwc2	$3,19071(t8)
 4c0:	b803f200 	swr	v1,-3584(zero)
 4c4:	0124027f 	0x124027f
 4c8:	02380386 	0x2380386
 4cc:	03520144 	0x3520144
 4d0:	7c08f240 	0x7c08f240
 4d4:	82770383 	lb	s7,899(s3)
 4d8:	28021c03 	slti	v0,zero,7171
 4dc:	82640301 	lb	a0,769(s3)
 4e0:	4b88af08 	c2	0x188af08
 4e4:	02040200 	0x2040200
 4e8:	034a6f03 	0x34a6f03
 4ec:	1403ba14 	bne	zero,v1,fffeed40 <_text_end+0x77fed7a8>
 4f0:	82680382 	lb	t0,898(s3)
 4f4:	03820903 	0x3820903
 4f8:	03bd8215 	0x3bd8215
 4fc:	4cf3826d 	0x4cf3826d
 500:	03bfc089 	0x3bfc089
 504:	2603825e 	addiu	v1,s0,-32162
 508:	04020082 	bltzl	zero,714 <_data-0x7ffff8ec>
 50c:	4a4e0301 	c2	0x4e0301
 510:	01040200 	0x1040200
 514:	004a3403 	0x4a3403
 518:	08030402 	j	c1008 <_data-0x7ff3eff8>
 51c:	f20b03ad 	0xf20b03ad
 520:	08028383 	j	a0e0c <_data-0x7ff5f1f4>
 524:	76010100 	jalx	8040400 <_data-0x77fbfc00>
 528:	02000000 	0x2000000
 52c:	00002200 	sll	a0,zero,0x8
 530:	fb010100 	sdc2	$1,256(t8)
 534:	01000d0e 	0x1000d0e
 538:	00010101 	0x10101
 53c:	00010000 	sll	zero,at,0x0
 540:	70000100 	0x70000100
 544:	746e6972 	jalx	1b9a5c8 <_data-0x7e465a38>
 548:	65736162 	0x65736162
 54c:	0000632e 	0x632e
 550:	00000000 	nop
 554:	0e440205 	jal	9100814 <_data-0x76eff7ec>
 558:	08138800 	j	4e2000 <_data-0x7fb1e000>
 55c:	02004fac 	0x2004fac
 560:	82060104 	lb	a2,260(s0)
 564:	004b8406 	0x4b8406
 568:	03010402 	0x3010402
 56c:	0200ba78 	0x200ba78
 570:	0c030104 	jal	c0410 <_data-0x7ff3fbf0>
 574:	02008a4a 	0x2008a4a
 578:	ba060204 	swr	a2,516(s0)
 57c:	70038806 	0x70038806
 580:	00012402 	srl	a0,at,0x10
 584:	08030402 	j	c1008 <_data-0x7ff3eff8>
 588:	02008ab0 	tge	s0,zero,0x22a
 58c:	82060104 	lb	a2,260(s0)
 590:	01040200 	0x1040200
 594:	02008306 	0x2008306
 598:	f2060404 	0xf2060404
 59c:	01001002 	0x1001002
 5a0:	00017901 	0x17901
 5a4:	36000200 	ori	zero,s0,0x200
 5a8:	01000000 	0x1000000
 5ac:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 5b0:	01010100 	0x1010100
 5b4:	00000001 	movf	zero,zero,$fcc0
 5b8:	01000001 	movf	zero,t0,$fcc0
 5bc:	692f2e2e 	0x692f2e2e
 5c0:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 5c4:	00006564 	0x6564
 5c8:	69727473 	0x69727473
 5cc:	632e676e 	0x632e676e
 5d0:	00000000 	nop
 5d4:	6d6d6f63 	0x6d6d6f63
 5d8:	682e6e6f 	0x682e6e6f
 5dc:	00000100 	sll	zero,zero,0x4
 5e0:	02050000 	0x2050000
 5e4:	00000000 	nop
 5e8:	14010b03 	bne	zero,at,31f8 <_data-0x7fffce08>
 5ec:	08027808 	j	9e020 <_data-0x7ff61fe0>
 5f0:	00010100 	sll	zero,at,0x4
 5f4:	00000205 	0x205
 5f8:	21030000 	addi	v1,t0,0
 5fc:	004b1301 	0x4b1301
 600:	06010402 	bgez	s0,160c <_data-0x7fffe9f4>
 604:	7fbe0682 	0x7fbe0682
 608:	01000802 	0x1000802
 60c:	02050001 	movt	zero,s0,$fcc1
 610:	00000000 	nop
 614:	01013603 	0x1013603
 618:	0402004e 	bltzl	zero,754 <_data-0x7ffff8ac>
 61c:	40084b01 	0x40084b01
 620:	01000802 	0x1000802
 624:	02050001 	movt	zero,s0,$fcc1
 628:	00000000 	nop
 62c:	0100cc03 	0x100cc03
 630:	894b8301 	lwl	t3,-31999(t2)
 634:	bb827a03 	swr	v0,31235(gp)
 638:	0008024c 	syscall	0x2009
 63c:	05000101 	bltz	t0,a44 <_data-0x7ffff5bc>
 640:	00000002 	srl	zero,zero,0x0
 644:	00e70300 	0xe70300
 648:	02001601 	0x2001601
 64c:	ba060104 	swr	a2,260(s0)
 650:	7e84bd06 	0x7e84bd06
 654:	01000802 	0x1000802
 658:	02050001 	movt	zero,s0,$fcc1
 65c:	00000000 	nop
 660:	0100fe03 	0x100fe03
 664:	0402004b 	bltzl	zero,794 <_data-0x7ffff86c>
 668:	00820601 	0x820601
 66c:	ba020402 	swr	v0,1026(s0)
 670:	7f83bd06 	0x7f83bd06
 674:	00080284 	0x80284
 678:	05000101 	bltz	t0,a80 <_data-0x7ffff580>
 67c:	00000002 	srl	zero,zero,0x0
 680:	018e0300 	0x18e0300
 684:	4bf81301 	c2	0x1f81301
 688:	85827a03 	lh	v0,31235(t4)
 68c:	01000802 	0x1000802
 690:	02050001 	movt	zero,s0,$fcc1
 694:	00000000 	nop
 698:	0101a203 	0x101a203
 69c:	7a03f913 	0x7a03f913
 6a0:	08028582 	j	a1608 <_data-0x7ff5e9f8>
 6a4:	00010100 	sll	zero,at,0x4
 6a8:	0f1c0205 	jal	c700814 <_data-0x738ff7ec>
 6ac:	90038800 	lbu	v1,-30720(zero)
 6b0:	86010102 	lh	at,258(s0)
 6b4:	027e874b 	0x27e874b
 6b8:	01010008 	0x1010008
 6bc:	00020500 	sll	zero,v0,0x14
 6c0:	03000000 	0x3000000
 6c4:	010102ab 	0x10102ab
 6c8:	7e874b87 	0x7e874b87
 6cc:	01001002 	0x1001002
 6d0:	02050001 	movt	zero,s0,$fcc1
 6d4:	00000000 	nop
 6d8:	0102c203 	0x102c203
 6dc:	4a7a0318 	c2	0x7a0318
 6e0:	884e8450 	lwl	t6,-31664(v0)
 6e4:	01040200 	0x1040200
 6e8:	f3827403 	0xf3827403
 6ec:	f63d0883 	sdc1	$f29,2179(s1)
 6f0:	01001002 	0x1001002
 6f4:	02050001 	movt	zero,s0,$fcc1
 6f8:	00000000 	nop
 6fc:	0102e503 	0x102e503
 700:	7a03894d 	0x7a03894d
 704:	f43d0882 	sdc1	$f29,2178(at)
 708:	01000802 	0x1000802
 70c:	02050001 	movt	zero,s0,$fcc1
 710:	00000000 	nop
 714:	0102f103 	0x102f103
 718:	000c0213 	0xc0213
 71c:	004f0101 	0x4f0101
 720:	00020000 	sll	zero,v0,0x0
 724:	0000001d 	0x1d
 728:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 72c:	0101000d 	break	0x101
 730:	00000101 	0x101
 734:	00000100 	sll	zero,zero,0x4
 738:	75700001 	jalx	5c00004 <_data-0x7a3ffffc>
 73c:	632e7374 	0x632e7374
 740:	00000000 	nop
 744:	02050000 	0x2050000
 748:	88000f40 	lwl	zero,3904(zero)
 74c:	4e3c0813 	c3	0x3c0813
 750:	7a03c248 	0x7a03c248
 754:	83837408 	lb	v1,29704(gp)
 758:	00080283 	sra	zero,t0,0xa
 75c:	05000101 	bltz	t0,b64 <_data-0x7ffff49c>
 760:	000fa002 	srl	s4,t7,0x0
 764:	010e0388 	0x10e0388
 768:	84838383 	lh	v1,-31869(a0)
 76c:	01001002 	0x1001002
 770:	00005901 	0x5901
 774:	44000200 	0x44000200
 778:	01000000 	0x1000000
 77c:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 780:	01010100 	0x1010100
 784:	00000001 	movf	zero,zero,$fcc0
 788:	01000001 	movf	zero,t0,$fcc0
 78c:	692f2e2e 	0x692f2e2e
 790:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 794:	00006564 	0x6564
 798:	63747570 	0x63747570
 79c:	2e726168 	sltiu	s2,s3,24936
 7a0:	00000063 	0x63
 7a4:	64747300 	0x64747300
 7a8:	2e746e69 	sltiu	s4,s3,28265
 7ac:	00010068 	0x10068
 7b0:	63616d00 	0x63616d00
 7b4:	656e6968 	0x656e6968
 7b8:	0100682e 	0x100682e
 7bc:	00000000 	nop
 7c0:	0fd00205 	jal	f400814 <_data-0x70bff7ec>
 7c4:	f3158800 	0xf3158800
 7c8:	00140284 	0x140284
 7cc:	01a90101 	0x1a90101
 7d0:	00020000 	sll	zero,v0,0x0
 7d4:	00000052 	mflhxu	zero
 7d8:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 7dc:	0101000d 	break	0x101
 7e0:	00000101 	0x101
 7e4:	00000100 	sll	zero,zero,0x4
 7e8:	2f2e2e01 	sltiu	t6,t9,11777
 7ec:	6c636e69 	0x6c636e69
 7f0:	00656475 	0x656475
 7f4:	63616d00 	0x63616d00
 7f8:	656e6968 	0x656e6968
 7fc:	7070632e 	0x7070632e
 800:	00000000 	nop
 804:	6d6d6f63 	0x6d6d6f63
 808:	682e6e6f 	0x682e6e6f
 80c:	00000100 	sll	zero,zero,0x4
 810:	69647473 	0x69647473
 814:	682e746e 	0x682e746e
 818:	00000100 	sll	zero,zero,0x4
 81c:	6863616d 	0x6863616d
 820:	2e656e69 	sltiu	a1,s3,28265
 824:	00010068 	0x10068
 828:	05000000 	bltz	t0,82c <_data-0x7ffff7d4>
 82c:	00000002 	srl	zero,zero,0x0
 830:	011b0300 	0x11b0300
 834:	03016a03 	0x3016a03
 838:	08024a16 	j	92858 <_data-0x7ff6d7a8>
 83c:	00010100 	sll	zero,at,0x4
 840:	00000205 	0x205
 844:	1b030000 	0x1b030000
 848:	016a0301 	0x16a0301
 84c:	024a1603 	0x24a1603
 850:	01010008 	0x1010008
 854:	00020500 	sll	zero,v0,0x14
 858:	03000000 	0x3000000
 85c:	6a03011b 	0x6a03011b
 860:	4a160301 	c2	0x160301
 864:	01000802 	0x1000802
 868:	02050001 	movt	zero,s0,$fcc1
 86c:	00000000 	nop
 870:	03011b03 	0x3011b03
 874:	1603016a 	bne	s0,v1,e20 <_data-0x7ffff1e0>
 878:	0008024a 	0x8024a
 87c:	05000101 	bltz	t0,c84 <_data-0x7ffff37c>
 880:	00000002 	srl	zero,zero,0x0
 884:	011c0300 	0x11c0300
 888:	03016f03 	0x3016f03
 88c:	08024a11 	j	92844 <_data-0x7ff6d7bc>
 890:	00010100 	sll	zero,at,0x4
 894:	00000205 	0x205
 898:	1c030000 	0x1c030000
 89c:	016f0301 	0x16f0301
 8a0:	024a1103 	0x24a1103
 8a4:	01010008 	0x1010008
 8a8:	00020500 	sll	zero,v0,0x14
 8ac:	03000000 	0x3000000
 8b0:	6f03011c 	0x6f03011c
 8b4:	4a110301 	c2	0x110301
 8b8:	01000802 	0x1000802
 8bc:	02050001 	movt	zero,s0,$fcc1
 8c0:	00000000 	nop
 8c4:	03011c03 	0x3011c03
 8c8:	1103016f 	beq	t0,v1,e88 <_data-0x7ffff178>
 8cc:	0008024a 	0x8024a
 8d0:	05000101 	bltz	t0,cd8 <_data-0x7ffff328>
 8d4:	000ffc02 	srl	ra,t7,0x10
 8d8:	011e0388 	0x11e0388
 8dc:	03016d03 	0x3016d03
 8e0:	01300221 	0x1300221
 8e4:	01000802 	0x1000802
 8e8:	02050001 	movt	zero,s0,$fcc1
 8ec:	00000000 	nop
 8f0:	03012e03 	0x3012e03
 8f4:	2a030157 	slti	v1,s0,343
 8f8:	ba560382 	swr	s6,898(s2)
 8fc:	024a2c03 	0x24a2c03
 900:	01010008 	0x1010008
 904:	34020500 	li	v0,0x500
 908:	03880010 	0x3880010
 90c:	52030133 	beql	s0,v1,ddc <_data-0x7ffff224>
 910:	822f0301 	lb	t7,769(s1)
 914:	03ba5703 	0x3ba5703
 918:	08024a2b 	j	928ac <_data-0x7ff6d754>
 91c:	00010100 	sll	zero,at,0x4
 920:	00000205 	0x205
 924:	38030000 	xori	v1,zero,0x0
 928:	83838401 	lb	v1,-31743(gp)
 92c:	844b4bb9 	lh	t3,19385(v0)
 930:	0c024c48 	jal	93120 <_data-0x7ff6cee0>
 934:	00010100 	sll	zero,at,0x4
 938:	10540205 	beq	v0,s4,1150 <_data-0x7fffeeb0>
 93c:	c1038800 	ll	v1,-30720(t0)
 940:	4a030100 	c2	0x30100
 944:	ba380301 	swr	t8,769(s1)
 948:	01000802 	0x1000802
 94c:	02050001 	movt	zero,s0,$fcc1
 950:	88001068 	lwl	zero,4200(zero)
 954:	0100c503 	0x100c503
 958:	03014603 	0x3014603
 95c:	0802ba3c 	j	ae8f0 <_data-0x7ff51710>
 960:	00010100 	sll	zero,at,0x4
 964:	00000205 	0x205
 968:	c9030000 	lwc2	$3,0(t0)
 96c:	bc030100 	cache	0x3,256(zero)
 970:	c603017f 	lwc1	$f3,383(s0)
 974:	0802ba00 	j	ae800 <_data-0x7ff51800>
 978:	Address 0x0000000000000978 is out of bounds.


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
      2c:	76454545 	jalx	9151514 <_data-0x76eaeaec>
      30:	54704468 	bnel	v1,s0,111d4 <_data-0x7ffeee2c>
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
      4c:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
      f0:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
     204:	52764545 	beql	s3,s6,1171c <_data-0x7ffee8e4>
     208:	5f5f5441 	0x5f5f5441
     20c:	7300634b 	0x7300634b
     210:	5f646e65 	0x5f646e65
     214:	69726573 	0x69726573
     218:	735f6c61 	0x735f6c61
     21c:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     220:	6361706e 	0x6361706e
     224:	68633c6b 	0x68633c6b
     228:	202c7261 	addi	t4,at,29281
     22c:	72616863 	0x72616863
     230:	6863202c 	0x6863202c
     234:	003e7261 	0x3e7261
     238:	74345a5f 	jalx	d1697c <_data-0x7f2e9684>
     23c:	49747365 	0x49747365
     240:	76764568 	jalx	9d915a0 <_data-0x7626ea60>
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
     328:	5f005f54 	bgtzl	t8,1807c <_data-0x7ffe7f84>
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
     384:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     388:	54704468 	bnel	v1,s0,1152c <_data-0x7ffeead4>
     38c:	6170005f 	0x6170005f
     390:	31236b63 	andi	v1,t1,0x6b63
     394:	65730036 	0x65730036
     398:	735f646e 	0x735f646e
     39c:	61697265 	0x61697265
     3a0:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     3a4:	6e755f72 	0x6e755f72
     3a8:	6b636170 	0x6b636170
     3ac:	73003e3c 	0x73003e3c
     3b0:	5f646e65 	0x5f646e65
     3b4:	69726573 	0x69726573
     3b8:	735f6c61 	0x735f6c61
     3bc:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
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
     430:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
     460:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
     4c4:	54005f54 	bnezl	zero,18218 <_data-0x7ffe7de8>
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
     54c:	5f005f54 	bgtzl	t8,182a0 <_data-0x7ffe7d60>
     550:	5f364e5a 	0x5f364e5a
     554:	706d695f 	0x706d695f
     558:	7332326c 	0x7332326c
     55c:	5f646e65 	0x5f646e65
     560:	69726573 	0x69726573
     564:	735f6c61 	0x735f6c61
     568:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     56c:	6361706e 	0x6361706e
     570:	634a496b 	0x634a496b
     574:	63636363 	0x63636363
     578:	63636363 	0x63636363
     57c:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     580:	54704468 	bnel	v1,s0,11724 <_data-0x7ffee8dc>
     584:	5a5f005f 	0x5a5f005f
     588:	65733531 	0x65733531
     58c:	735f646e 	0x735f646e
     590:	61697265 	0x61697265
     594:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     598:	6a4c4972 	0x6a4c4972
     59c:	45453532 	0x45453532
     5a0:	54415276 	bnel	v0,at,14f7c <_data-0x7ffeb084>
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
     6c4:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
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
     72c:	75207472 	jalx	481d1c8 <_data-0x7b7e2e38>
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
     7f8:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
     7fc:	5a5f003e 	0x5a5f003e
     800:	5f5f364e 	0x5f5f364e
     804:	6c706d69 	0x6c706d69
     808:	65733232 	0x65733232
     80c:	735f646e 	0x735f646e
     810:	61697265 	0x61697265
     814:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     818:	6e755f72 	0x6e755f72
     81c:	6b636170 	0x6b636170
     820:	63634a49 	0x63634a49
     824:	63636363 	0x63636363
     828:	45454563 	0x45454563
     82c:	70446876 	0x70446876
     830:	74005f54 	jalx	17d50 <_data-0x7ffe82b0>
     834:	3c747365 	0x3c747365
     838:	69736e75 	0x69736e75
     83c:	64656e67 	0x64656e67
     840:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
     844:	6573003e 	0x6573003e
     848:	735f646e 	0x735f646e
     84c:	61697265 	0x61697265
     850:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
     9c4:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
     a64:	75003e72 	jalx	400f9c8 <_data-0x7bff0638>
     a68:	6769736e 	0x6769736e
     a6c:	5f64656e 	0x5f64656e
     a70:	75716573 	jalx	5c595cc <_data-0x7a3a6a34>
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
     b24:	5f003e72 	bgtzl	t8,104f0 <_data-0x7ffefb10>
     b28:	5f364e5a 	0x5f364e5a
     b2c:	706d695f 	0x706d695f
     b30:	7332326c 	0x7332326c
     b34:	5f646e65 	0x5f646e65
     b38:	69726573 	0x69726573
     b3c:	735f6c61 	0x735f6c61
     b40:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     b44:	6361706e 	0x6361706e
     b48:	634a496b 	0x634a496b
     b4c:	63636363 	0x63636363
     b50:	63636363 	0x63636363
     b54:	63636363 	0x63636363
     b58:	63636363 	0x63636363
     b5c:	63636363 	0x63636363
     b60:	45454563 	0x45454563
     b64:	70446876 	0x70446876
     b68:	5f005f54 	bgtzl	t8,188bc <_data-0x7ffe7744>
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
     bf0:	74003723 	jalx	dc8c <_data-0x7fff2374>
     bf4:	5f747365 	0x5f747365
     bf8:	6f6d656d 	0x6f6d656d
     bfc:	632e7972 	0x632e7972
     c00:	5f007070 	bgtzl	t8,1cdc4 <_data-0x7ffe323c>
     c04:	5f364e5a 	0x5f364e5a
     c08:	706d695f 	0x706d695f
     c0c:	7332326c 	0x7332326c
     c10:	5f646e65 	0x5f646e65
     c14:	69726573 	0x69726573
     c18:	735f6c61 	0x735f6c61
     c1c:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     c20:	6361706e 	0x6361706e
     c24:	634a496b 	0x634a496b
     c28:	63636363 	0x63636363
     c2c:	63636363 	0x63636363
     c30:	63636363 	0x63636363
     c34:	63636363 	0x63636363
     c38:	63636363 	0x63636363
     c3c:	63636363 	0x63636363
     c40:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     c44:	54704468 	bnel	v1,s0,11de8 <_data-0x7ffee218>
     c48:	5a5f005f 	0x5a5f005f
     c4c:	5f5f364e 	0x5f5f364e
     c50:	6c706d69 	0x6c706d69
     c54:	65733232 	0x65733232
     c58:	735f646e 	0x735f646e
     c5c:	61697265 	0x61697265
     c60:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
     cc0:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
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
     d40:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
     dbc:	5f003e72 	bgtzl	t8,10788 <_data-0x7ffef878>
     dc0:	5f364e5a 	0x5f364e5a
     dc4:	706d695f 	0x706d695f
     dc8:	7332326c 	0x7332326c
     dcc:	5f646e65 	0x5f646e65
     dd0:	69726573 	0x69726573
     dd4:	735f6c61 	0x735f6c61
     dd8:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
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
     ea8:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     eac:	6e755f72 	0x6e755f72
     eb0:	6b636170 	0x6b636170
     eb4:	63634a49 	0x63634a49
     eb8:	63636363 	0x63636363
     ebc:	63636363 	0x63636363
     ec0:	63636363 	0x63636363
     ec4:	63636363 	0x63636363
     ec8:	45454563 	0x45454563
     ecc:	70446876 	0x70446876
     ed0:	75005f54 	jalx	4017d50 <_data-0x7bfe82b0>
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
     f1c:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     f20:	54704468 	bnel	v1,s0,120c4 <_data-0x7ffedf3c>
     f24:	6573005f 	0x6573005f
     f28:	735f646e 	0x735f646e
     f2c:	61697265 	0x61697265
     f30:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
     fd8:	52764545 	beql	s3,s6,124f0 <_data-0x7ffedb10>
     fdc:	5f5f5441 	0x5f5f5441
     fe0:	534e634b 	beql	k0,t6,19d10 <_data-0x7ffe62f0>
     fe4:	7537315f 	jalx	4dcc57c <_data-0x7b233a84>
     fe8:	6769736e 	0x6769736e
     fec:	5f64656e 	0x5f64656e
     ff0:	75716573 	jalx	5c595cc <_data-0x7a3a6a34>
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
    1058:	76454545 	jalx	9151514 <_data-0x76eaeaec>
    105c:	54704468 	bnel	v1,s0,12200 <_data-0x7ffede00>
    1060:	5a5f005f 	0x5a5f005f
    1064:	65733531 	0x65733531
    1068:	735f646e 	0x735f646e
    106c:	61697265 	0x61697265
    1070:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
    1074:	6a4c4972 	0x6a4c4972
    1078:	76454535 	jalx	91514d4 <_data-0x76eaeb2c>
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
    1100:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
    1138:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
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
    11ec:	74636146 	jalx	18d8518 <_data-0x7e727ae8>
    11f0:	6169726f 	0x6169726f
    11f4:	642f4e6c 	0x642f4e6c
    11f8:	6c6e776f 	0x6c6e776f
    11fc:	7364616f 	0x7364616f
    1200:	776f772f 	jalx	dbddcbc <_data-0x72422344>
    1204:	646f632f 	0x646f632f
    1208:	72673931 	0x72673931
    120c:	522f3170 	beql	s1,t7,d7d0 <_data-0x7fff2830>
    1210:	6574756f 	0x6574756f
    1214:	65522d72 	0x65522d72
    1218:	6c697562 	0x6c697562
    121c:	72542f64 	0x72542f64
    1220:	61697669 	0x61697669
    1224:	50494d6c 	beql	v0,t1,147d8 <_data-0x7ffeb828>
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
    1354:	74345a5f 	jalx	d1697c <_data-0x7f2e9684>
    1358:	49747365 	0x49747365
    135c:	76764574 	jalx	9d915d0 <_data-0x7626ea30>
    1360:	554e4700 	bnel	t2,t6,12f64 <_data-0x7ffed09c>
    1364:	2b2b4320 	slti	t3,t9,17184
    1368:	37203131 	ori	zero,t9,0x3131
    136c:	302e342e 	andi	t6,at,0x342e
    1370:	656d2d20 	0x656d2d20
    1374:	6d2d206c 	0x6d2d206c
    1378:	676e6973 	0x676e6973
    137c:	662d656c 	0x662d656c
    1380:	74616f6c 	jalx	185bdb0 <_data-0x7e7a4250>
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
    140c:	74616466 	jalx	1859198 <_data-0x7e7a6e68>
    1410:	65732d61 	0x65732d61
    1414:	6f697463 	0x6f697463
    1418:	2d20736e 	sltiu	zero,t1,29550
    141c:	65726666 	0x65726666
    1420:	61747365 	0x61747365
    1424:	6e69646e 	0x6e69646e
    1428:	662d2067 	0x662d2067
    142c:	622d6f6e 	0x622d6f6e
    1430:	746c6975 	jalx	1b1a5d4 <_data-0x7e4e5a2c>
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
    156c:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
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
    15bc:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
    15f4:	76454545 	jalx	9151514 <_data-0x76eaeaec>
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
    1688:	74345a5f 	jalx	d1697c <_data-0x7f2e9684>
    168c:	49747365 	0x49747365
    1690:	7676456a 	jalx	9d915a8 <_data-0x7626ea58>
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
    17ac:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
    1878:	76454545 	jalx	9151514 <_data-0x76eaeaec>
    187c:	54704468 	bnel	v1,s0,12a20 <_data-0x7ffed5e0>
    1880:	6573005f 	0x6573005f
    1884:	735f646e 	0x735f646e
    1888:	61697265 	0x61697265
    188c:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
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
    1984:	75003e35 	jalx	400f8d4 <_data-0x7bff072c>
    1988:	696c6974 	0x696c6974
    198c:	732f7974 	0x732f7974
    1990:	74726174 	jalx	1c985d0 <_data-0x7e367a30>
    1994:	532e7075 	beql	t9,t6,1db6c <_data-0x7ffe2494>
    1998:	6e6d2f00 	0x6e6d2f00
    199c:	2f632f74 	sltiu	v1,k1,12148
    19a0:	72657355 	0x72657355
    19a4:	61462f73 	0x61462f73
    19a8:	726f7463 	0x726f7463
    19ac:	4e6c6169 	c3	0x6c6169
    19b0:	776f642f 	jalx	dbd90bc <_data-0x72426f44>
    19b4:	616f6c6e 	0x616f6c6e
    19b8:	542f7364 	bnel	at,t7,1e74c <_data-0x7ffe18b4>
    19bc:	69766972 	0x69766972
    19c0:	494d6c61 	0x494d6c61
    19c4:	535f5350 	beql	k0,ra,16708 <_data-0x7ffe98f8>
    19c8:	7774666f 	jalx	dd199bc <_data-0x722e6644>
    19cc:	2f657261 	sltiu	a1,k1,29281
    19d0:	00707063 	0x707063
    19d4:	20554e47 	addi	s5,v0,20039
    19d8:	32205341 	andi	zero,s1,0x5341
    19dc:	0030332e 	0x30332e
    19e0:	5f307063 	0x5f307063
    19e4:	76646162 	jalx	9918588 <_data-0x766e7a78>
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
    1a28:	7465675f 	jalx	1959d7c <_data-0x7e6a6284>
    1a2c:	7561635f 	jalx	5858d7c <_data-0x7a7a7284>
    1a30:	5f006573 	bgtzl	t8,1b000 <_data-0x7ffe5000>
    1a34:	00737362 	0x737362
    1a38:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
    1a3c:	656c5f65 	0x656c5f65
    1a40:	79620064 	0x79620064
    1a44:	745f6574 	jalx	17d95d0 <_data-0x7e826a30>
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
    1a80:	74735f30 	jalx	1cd7cc0 <_data-0x7e328340>
    1a84:	73757461 	0x73757461
    1a88:	646f6300 	0x646f6300
    1a8c:	6e650065 	0x6e650065
    1a90:	5f797274 	0x5f797274
    1a94:	315f6f6c 	andi	ra,t2,0x6f6c
    1a98:	78655f00 	0x78655f00
    1a9c:	74706563 	jalx	1c1958c <_data-0x7e3e6a74>
    1aa0:	5f6e6f69 	0x5f6e6f69
    1aa4:	646e6168 	0x646e6168
    1aa8:	0072656c 	0x72656c
    1aac:	64646170 	0x64646170
    1ab0:	00676e69 	0x676e69
    1ab4:	746e6975 	jalx	1b9a5d4 <_data-0x7e465a2c>
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
    1ae4:	74616f6c 	jalx	185bdb0 <_data-0x7e7a4250>
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
    1b50:	7566662d 	jalx	59998b4 <_data-0x7a66674c>
    1b54:	6974636e 	0x6974636e
    1b58:	732d6e6f 	0x732d6e6f
    1b5c:	69746365 	0x69746365
    1b60:	20736e6f 	addi	s3,v1,28271
    1b64:	6164662d 	0x6164662d
    1b68:	732d6174 	0x732d6174
    1b6c:	69746365 	0x69746365
    1b70:	20736e6f 	addi	s3,v1,28271
    1b74:	7266662d 	0x7266662d
    1b78:	74736565 	jalx	1cd9594 <_data-0x7e326a6c>
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
    1bb8:	74726f68 	jalx	1c9bda0 <_data-0x7e364260>
    1bbc:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
    1bc0:	30706300 	andi	s0,v1,0x6300
    1bc4:	6162655f 	0x6162655f
    1bc8:	75006573 	jalx	40195cc <_data-0x7bfe6a34>
    1bcc:	31746e69 	andi	s4,t3,0x6e69
    1bd0:	00745f36 	tne	v1,s4,0x17c
    1bd4:	746e6975 	jalx	1b9a5d4 <_data-0x7e465a2c>
    1bd8:	745f3233 	jalx	17cc8cc <_data-0x7e833734>
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
    1c0c:	74726573 	jalx	1c995cc <_data-0x7e366a34>
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
    1c58:	776f642f 	jalx	dbd90bc <_data-0x72426f44>
    1c5c:	616f6c6e 	0x616f6c6e
    1c60:	542f7364 	bnel	at,t7,1e9f4 <_data-0x7ffe160c>
    1c64:	69766972 	0x69766972
    1c68:	494d6c61 	0x494d6c61
    1c6c:	535f5350 	beql	k0,ra,169b0 <_data-0x7ffe9650>
    1c70:	7774666f 	jalx	dd199bc <_data-0x722e6644>
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
    1cc4:	74730070 	jalx	1cc01c0 <_data-0x7e33fe40>
    1cc8:	70636e72 	0x70636e72
    1ccc:	74730079 	jalx	1cc01e4 <_data-0x7e33fe1c>
    1cd0:	656c6e72 	0x656c6e72
    1cd4:	7473006e 	jalx	1cc01b8 <_data-0x7e33fe48>
    1cd8:	72686372 	0x72686372
    1cdc:	72747300 	0x72747300
    1ce0:	00797063 	0x797063
    1ce4:	63727473 	0x63727473
    1ce8:	6d00706d 	0x6d00706d
    1cec:	70636d65 	0x70636d65
    1cf0:	74730079 	jalx	1cc01e4 <_data-0x7e33fe1c>
    1cf4:	6e656c72 	0x6e656c72
    1cf8:	72747300 	0x72747300
    1cfc:	706d636e 	0x706d636e
    1d00:	72747300 	0x72747300
    1d04:	646e6966 	0x646e6966
    1d08:	74757000 	jalx	1d5c000 <_data-0x7e2a4000>
    1d0c:	00632e73 	tltu	v1,v1,0xb9
    1d10:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
    1d14:	65735f65 	0x65735f65
    1d18:	6c616972 	0x6c616972
    1d1c:	74757000 	jalx	1d5c000 <_data-0x7e2a4000>
    1d20:	72616863 	0x72616863
    1d24:	7700632e 	jalx	c018cb8 <_data-0x73fe7348>
    1d28:	65746972 	0x65746972
    1d2c:	6f77685f 	0x6f77685f
    1d30:	5f006472 	bgtzl	t8,1aefc <_data-0x7ffe5104>
    1d34:	7277355a 	0x7277355a
    1d38:	49657469 	0x49657469
    1d3c:	5076456a 	beql	v1,s6,132e8 <_data-0x7ffecd18>
    1d40:	005f5476 	tne	v0,ra,0x151
    1d44:	64616572 	0x64616572
    1d48:	6977735f 	0x6977735f
    1d4c:	65686374 	0x65686374
    1d50:	72770073 	0x72770073
    1d54:	5f657469 	0x5f657469
    1d58:	64726f77 	0x64726f77
    1d5c:	74616400 	jalx	1859000 <_data-0x7e7a7000>
    1d60:	72770061 	0x72770061
    1d64:	5f657469 	0x5f657469
    1d68:	65747962 	0x65747962
    1d6c:	345a5f00 	ori	k0,v0,0x5f00
    1d70:	64616572 	0x64616572
    1d74:	54456d49 	bnel	v0,a1,1d29c <_data-0x7ffe2d64>
    1d78:	0076505f 	0x76505f
    1d7c:	746e6975 	jalx	1b9a5d4 <_data-0x7e465a2c>
    1d80:	745f3436 	jalx	17cd0d8 <_data-0x7e832f28>
    1d84:	69727700 	0x69727700
    1d88:	753c6574 	jalx	4f195d0 <_data-0x7b0e6a30>
    1d8c:	6769736e 	0x6769736e
    1d90:	2064656e 	addi	a0,v1,25966
    1d94:	72616863 	0x72616863
    1d98:	6572003e 	0x6572003e
    1d9c:	685f6461 	0x685f6461
    1da0:	64726f77 	0x64726f77
    1da4:	355a5f00 	ori	k0,t2,0x5f00
    1da8:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
    1dac:	456d4965 	0x456d4965
    1db0:	54765076 	bnel	v1,s6,15f8c <_data-0x7ffea074>
    1db4:	5a5f005f 	0x5a5f005f
    1db8:	61657234 	0x61657234
    1dbc:	45744964 	0x45744964
    1dc0:	76505f54 	jalx	9417d50 <_data-0x76be82b0>
    1dc4:	69727700 	0x69727700
    1dc8:	6c3c6574 	0x6c3c6574
    1dcc:	20676e6f 	addi	a3,v1,28271
    1dd0:	69736e75 	0x69736e75
    1dd4:	64656e67 	0x64656e67
    1dd8:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
    1ddc:	7277003e 	0x7277003e
    1de0:	5f657469 	0x5f657469
    1de4:	726f7764 	0x726f7764
    1de8:	65720064 	0x65720064
    1dec:	6c3c6461 	0x6c3c6461
    1df0:	20676e6f 	addi	a3,v1,28271
    1df4:	69736e75 	0x69736e75
    1df8:	64656e67 	0x64656e67
    1dfc:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
    1e00:	6572003e 	0x6572003e
    1e04:	735f6461 	0x735f6461
    1e08:	61697265 	0x61697265
    1e0c:	6f775f6c 	0x6f775f6c
    1e10:	64006472 	0x64006472
    1e14:	64726f77 	0x64726f77
    1e18:	5f00745f 	bgtzl	t8,1ef98 <_data-0x7ffe1068>
    1e1c:	6572345a 	0x6572345a
    1e20:	68496461 	0x68496461
    1e24:	505f5445 	beql	v0,ra,16f3c <_data-0x7ffe90c4>
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
    1e6c:	5f006472 	bgtzl	t8,1b038 <_data-0x7ffe4fc8>
    1e70:	7277355a 	0x7277355a
    1e74:	49657469 	0x49657469
    1e78:	50764568 	beql	v1,s6,1341c <_data-0x7ffecbe4>
    1e7c:	005f5476 	tne	v0,ra,0x151
    1e80:	64616572 	0x64616572
    1e84:	736e753c 	0x736e753c
    1e88:	656e6769 	0x656e6769
    1e8c:	6e692064 	0x6e692064
    1e90:	5f003e74 	bgtzl	t8,11864 <_data-0x7ffee79c>
    1e94:	7277355a 	0x7277355a
    1e98:	49657469 	0x49657469
    1e9c:	50764574 	beql	v1,s6,13470 <_data-0x7ffecb90>
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
    1edc:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
    1ee0:	7768003e 	jalx	da000f8 <_data-0x725fff08>
    1ee4:	5f64726f 	0x5f64726f
    1ee8:	65720074 	0x65720074
    1eec:	625f6461 	0x625f6461
    1ef0:	00657479 	0x657479
    1ef4:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
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
  18:	880009a4 	lwl	zero,2468(zero)
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
  5c:	88000a6c 	lwl	zero,2668(zero)
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
  88:	88000b04 	lwl	zero,2820(zero)
  8c:	00000068 	0x68
  90:	44280e44 	0x44280e44
  94:	92500391 	lbu	s0,913(s2)
  98:	9f049002 	0x9f049002
  9c:	0e500201 	jal	9400804 <_data-0x76bff7fc>
  a0:	d2d1d000 	0xd2d1d000
  a4:	000000df 	0xdf
  a8:	00000024 	and	zero,zero,zero
  ac:	00000000 	nop
  b0:	88000b6c 	lwl	zero,2924(zero)
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
  e8:	88000c20 	lwl	zero,3104(zero)
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
 128:	88000e44 	lwl	zero,3652(zero)
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
 1e4:	88000f1c 	lwl	zero,3868(zero)
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
 244:	88000f40 	lwl	zero,3904(zero)
 248:	00000060 	0x60
 24c:	50200e44 	beqzl	at,3b60 <_data-0x7fffc4a0>
 250:	03910292 	0x3910292
 254:	0490019f 	bltzal	a0,8d4 <_data-0x7ffff72c>
 258:	000e0a6c 	0xe0a6c
 25c:	dfd2d1d0 	ldc3	$18,-11824(s8)
 260:	0000000b 	movn	zero,zero,zero
 264:	00000018 	mult	zero,zero
 268:	0000022c 	0x22c
 26c:	88000fa0 	lwl	zero,4000(zero)
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
 298:	88000fd0 	lwl	zero,4048(zero)
 29c:	0000002c 	0x2c
 2a0:	44180e44 	0x44180e44
 2a4:	9f480290 	0x9f480290
 2a8:	000e5c01 	0xe5c01
 2ac:	0000dfd0 	0xdfd0
