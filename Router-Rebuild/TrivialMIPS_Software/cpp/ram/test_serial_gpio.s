
test_serial_gpio.ram.elf:     file format elf32-tradlittlemips
test_serial_gpio.ram.elf


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
88000038:	0e000170 	jal	880005c0 <_main>
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
88000240:	0e0001e2 	jal	88000788 <_exception_handler>
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

88000278 <_Z15send_serial_hexj>:
_Z15send_serial_hexj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:54
	for(int i = 0; str[i]; ++i)
		send_serial_char(str[i]);
}

inline void send_serial_hex(unsigned v)
{
88000278:	27bdffe0 	addiu	sp,sp,-32
8800027c:	afb20018 	sw	s2,24(sp)
88000280:	00809025 	move	s2,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:55
	send_serial_char('0');
88000284:	24040030 	li	a0,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:54
{
88000288:	afbf001c 	sw	ra,28(sp)
8800028c:	afb10014 	sw	s1,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:55
	send_serial_char('0');
88000290:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000294:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:56
	send_serial_char('x');
88000298:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800029c:	24040078 	li	a0,120
880002a0:	2410001c 	li	s0,28
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:57
	for(int i = 7; i >= 0; --i)
880002a4:	2411fffc 	li	s1,-4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:59
	{
		unsigned char c = (v >> (i << 2)) & 0xf;
880002a8:	02121006 	srlv	v0,s2,s0
880002ac:	3042000f 	andi	v0,v0,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:60
		c = (c < 10) ? c + '0' : c + 'a' - 10;
880002b0:	2c43000a 	sltiu	v1,v0,10
880002b4:	10600002 	beqz	v1,880002c0 <_Z15send_serial_hexj+0x48>
880002b8:	24440057 	addiu	a0,v0,87
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:60 (discriminator 1)
880002bc:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:61 (discriminator 4)
		send_serial_char(c);
880002c0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880002c4:	2610fffc 	addiu	s0,s0,-4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:57 (discriminator 4)
	for(int i = 7; i >= 0; --i)
880002c8:	1611fff8 	bne	s0,s1,880002ac <_Z15send_serial_hexj+0x34>
880002cc:	02121006 	srlv	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:63
	}
}
880002d0:	8fbf001c 	lw	ra,28(sp)
880002d4:	8fb20018 	lw	s2,24(sp)
880002d8:	8fb10014 	lw	s1,20(sp)
880002dc:	8fb00010 	lw	s0,16(sp)
880002e0:	03e00008 	jr	ra
880002e4:	27bd0020 	addiu	sp,sp,32

880002e8 <_Z28send_serial_integer_unsignedj>:
_Z28send_serial_integer_unsignedj():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:68


inline void send_serial_integer_unsigned(unsigned v)
{
	if (v != 0){
880002e8:	1080000f 	beqz	a0,88000328 <_Z28send_serial_integer_unsignedj+0x40>
880002ec:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:67
{
880002f0:	27bdffe8 	addiu	sp,sp,-24
880002f4:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:69
		send_serial_integer_unsigned(v / 10);
880002f8:	2410000a 	li	s0,10
880002fc:	0090001b 	divu	zero,a0,s0
88000300:	020001f4 	teq	s0,zero,0x7
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:67
{
88000304:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:69
		send_serial_integer_unsigned(v / 10);
88000308:	00008010 	mfhi	s0
8800030c:	0e0000ba 	jal	880002e8 <_Z28send_serial_integer_unsignedj>
88000310:	00002012 	mflo	a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:72
		send_serial_char((v % 10) + '0');
	}
}
88000314:	8fbf0014 	lw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:70
		send_serial_char((v % 10) + '0');
88000318:	26040030 	addiu	a0,s0,48
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:72
}
8800031c:	8fb00010 	lw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:70
		send_serial_char((v % 10) + '0');
88000320:	0a000094 	j	88000250 <_Z16send_serial_charh>
88000324:	27bd0018 	addiu	sp,sp,24
88000328:	03e00008 	jr	ra
8800032c:	00000000 	nop

88000330 <_entry>:
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:4
#include "trivial_mips.h"

int _entry()
{
88000330:	27bdffd8 	addiu	sp,sp,-40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
	};

	template<typename... Pack>
	inline void send_serial_str_unpack(unsigned char a, Pack... pack)
	{
		send_serial_char(a);
88000334:	24040048 	li	a0,72
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:4
88000338:	afbf0024 	sw	ra,36(sp)
8800033c:	afb40020 	sw	s4,32(sp)
88000340:	afb3001c 	sw	s3,28(sp)
88000344:	afb20018 	sw	s2,24(sp)
88000348:	afb10014 	sw	s1,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
8800034c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000350:	afb00010 	sw	s0,16(sp)
88000354:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000358:	24040065 	li	a0,101
8800035c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000360:	2404006c 	li	a0,108
88000364:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000368:	2404006c 	li	a0,108
8800036c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000370:	2404006f 	li	a0,111
88000374:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000378:	24040020 	li	a0,32
8800037c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000380:	2404004d 	li	a0,77
88000384:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000388:	24040049 	li	a0,73
8800038c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000390:	24040050 	li	a0,80
88000394:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000398:	24040053 	li	a0,83
8800039c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880003a0:	24040021 	li	a0,33
880003a4:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880003a8:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
	}

	template<>
	inline void send_serial_str_unpack(unsigned char a)
	{
		send_serial_char(a);
880003ac:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880003b0:	00002025 	move	a0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:7
	send_serial_str("Hello MIPS!\n");
	//send_serial_str("This is a message sent by code compiled from C++!\n");
	register unsigned now_val = 0, count = 0;
880003b4:	00009025 	move	s2,zero
880003b8:	00001025 	move	v0,zero
_Z12get_switchesv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:133
}

inline unsigned get_switches()
{
	LOAD_GPIO_ENTRY(gpio_entry);
	return gpio_entry[0];
880003bc:	3c13a600 	lui	s3,0xa600
_Z20set_segment_displaysh():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:139
}

inline void set_segment_displays(unsigned char v)
{
	LOAD_GPIO_ENTRY(gpio_entry);
	gpio_entry[1] = static_cast<unsigned>(v) | 0x80000000u;
880003c0:	3c148000 	lui	s4,0x8000
_Z23is_serial_ready_to_readv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:29
	return serial_entry[0] & 2;
880003c4:	3c11a300 	lui	s1,0xa300
_Z12get_switchesv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:133
	return gpio_entry[0];
880003c8:	8e700000 	lw	s0,0(s3)
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:10
	while(1)
	{
		if(now_val != get_switches())
880003cc:	10500051 	beq	v0,s0,88000514 <_entry+0x1e4>
880003d0:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:12
		{
			set_segment_displays(++count);
880003d4:	26520001 	addiu	s2,s2,1
_Z20set_segment_displaysh():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:139
	gpio_entry[1] = static_cast<unsigned>(v) | 0x80000000u;
880003d8:	324200ff 	andi	v0,s2,0xff
880003dc:	00541025 	or	v0,v0,s4
880003e0:	ae620004 	sw	v0,4(s3)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
880003e4:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880003e8:	24040053 	li	a0,83
880003ec:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880003f0:	24040077 	li	a0,119
880003f4:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880003f8:	24040069 	li	a0,105
880003fc:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000400:	24040074 	li	a0,116
88000404:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000408:	24040063 	li	a0,99
8800040c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000410:	24040068 	li	a0,104
88000414:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000418:	24040020 	li	a0,32
8800041c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000420:	24040063 	li	a0,99
88000424:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000428:	24040068 	li	a0,104
8800042c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000430:	24040061 	li	a0,97
88000434:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000438:	2404006e 	li	a0,110
8800043c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000440:	24040067 	li	a0,103
88000444:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000448:	24040065 	li	a0,101
8800044c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000450:	24040064 	li	a0,100
88000454:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000458:	2404003a 	li	a0,58
8800045c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000460:	24040020 	li	a0,32
88000464:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000468:	2404005b 	li	a0,91
8800046c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000470:	24040048 	li	a0,72
88000474:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000478:	24040065 	li	a0,101
8800047c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000480:	24040078 	li	a0,120
88000484:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000488:	2404005d 	li	a0,93
8800048c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000490:	24040020 	li	a0,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
88000494:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000498:	00002025 	move	a0,zero
_Z12get_switchesv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:133
	return gpio_entry[0];
8800049c:	8e700000 	lw	s0,0(s3)
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:14
			send_serial_str("Switch changed: [Hex] ");
			send_serial_hex(now_val = get_switches());
880004a0:	0e00009e 	jal	88000278 <_Z15send_serial_hexj>
880004a4:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
880004a8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004ac:	2404002c 	li	a0,44
880004b0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004b4:	24040020 	li	a0,32
880004b8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004bc:	2404005b 	li	a0,91
880004c0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004c4:	24040044 	li	a0,68
880004c8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004cc:	24040065 	li	a0,101
880004d0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004d4:	24040063 	li	a0,99
880004d8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004dc:	2404005d 	li	a0,93
880004e0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004e4:	24040020 	li	a0,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
880004e8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004ec:	00002025 	move	a0,zero
_Z19send_serial_integeri():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:77
	if(v < 0) {
880004f0:	0601002d 	bgez	s0,880005a8 <_entry+0x278>
880004f4:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:78
		send_serial_char('-');
880004f8:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880004fc:	2404002d 	li	a0,45
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:79
		send_serial_integer_unsigned(-v);
88000500:	00102023 	negu	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:81
		send_serial_integer_unsigned(v);
88000504:	0e0000ba 	jal	880002e8 <_Z28send_serial_integer_unsignedj>
88000508:	00000000 	nop
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:17
			send_serial_str(", [Dec] ");
			send_serial_integer(now_val);
			send_serial_char('\n');
8800050c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000510:	2404000a 	li	a0,10
_Z23is_serial_ready_to_readv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:29
	return serial_entry[0] & 2;
88000514:	8e220000 	lw	v0,0(s1)
88000518:	30420002 	andi	v0,v0,0x2
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:20
		}

		if(is_serial_ready_to_read())
8800051c:	1040ffaa 	beqz	v0,880003c8 <_entry+0x98>
88000520:	02001025 	move	v0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:105
		send_serial_char(a);
88000524:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000528:	24040052 	li	a0,82
8800052c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000530:	24040065 	li	a0,101
88000534:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000538:	24040063 	li	a0,99
8800053c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000540:	24040065 	li	a0,101
88000544:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000548:	24040069 	li	a0,105
8800054c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000550:	24040076 	li	a0,118
88000554:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000558:	24040065 	li	a0,101
8800055c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000560:	24040064 	li	a0,100
88000564:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000568:	2404003a 	li	a0,58
8800056c:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000570:	24040020 	li	a0,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:112
		send_serial_char(a);
88000574:	0e000094 	jal	88000250 <_Z16send_serial_charh>
88000578:	00002025 	move	a0,zero
_Z23is_serial_ready_to_readv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:29
	return serial_entry[0] & 2;
8800057c:	8e220000 	lw	v0,0(s1)
88000580:	30420002 	andi	v0,v0,0x2
_Z16read_serial_charv():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:35
	while(!is_serial_ready_to_read());
88000584:	1040fffd 	beqz	v0,8800057c <_entry+0x24c>
88000588:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:36
	return serial_entry[1];
8800058c:	8e240004 	lw	a0,4(s1)
_entry():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:23
		{
			send_serial_str("Received: ");
			send_serial_hex(read_serial_char());
88000590:	0e00009e 	jal	88000278 <_Z15send_serial_hexj>
88000594:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:24
			send_serial_char('\n');
88000598:	0e000094 	jal	88000250 <_Z16send_serial_charh>
8800059c:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/test_serial_gpio.cpp:4
{
880005a0:	1000ff89 	b	880003c8 <_entry+0x98>
880005a4:	02001025 	move	v0,s0
_Z19send_serial_integeri():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:80
	} else if(v > 0) {
880005a8:	1600ffd6 	bnez	s0,88000504 <_entry+0x1d4>
880005ac:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/include/trivial_mips.h:83
		send_serial_char('0');
880005b0:	0e000094 	jal	88000250 <_Z16send_serial_charh>
880005b4:	24040030 	li	a0,48
880005b8:	1000ffd4 	b	8800050c <_entry+0x1dc>
880005bc:	00000000 	nop

880005c0 <_main>:
_main():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:11
extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {
880005c0:	27bdffe0 	addiu	sp,sp,-32
880005c4:	afbf001c 	sw	ra,28(sp)
880005c8:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:13

    init_serial();
880005cc:	0e000306 	jal	88000c18 <init_serial>
880005d0:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:15

    write_segment(0x04);
880005d4:	0e000321 	jal	88000c84 <write_segment>
880005d8:	24040004 	li	a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:17

    puts("*****TrivialMIPS Bare Metal System*****");
880005dc:	3c048800 	lui	a0,0x8800
880005e0:	0e0002ef 	jal	88000bbc <puts>
880005e4:	24840c98 	addiu	a0,a0,3224
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880005e8:	3c118000 	lui	s1,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880005ec:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880005f0:	3c108000 	lui	s0,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880005f4:	24840cc0 	addiu	a0,a0,3264
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
880005f8:	26310000 	addiu	s1,s1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
880005fc:	0e0002ef 	jal	88000bbc <puts>
88000600:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
88000604:	02118023 	subu	s0,s0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:21
    write_segment(0x05);
88000608:	0e000321 	jal	88000c84 <write_segment>
8800060c:	24040005 	li	a0,5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:25
    if (bss_size > 0) {
88000610:	1a000009 	blez	s0,88000638 <_main+0x78>
88000614:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:26
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
88000618:	02003025 	move	a2,s0
8800061c:	02202825 	move	a1,s1
88000620:	0e00020f 	jal	8800083c <printf>
88000624:	24840ce8 	addiu	a0,a0,3304
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:27
        memset(&_bss, 0, bss_size);
88000628:	02003025 	move	a2,s0
8800062c:	00002825 	move	a1,zero
88000630:	0e0002ce 	jal	88000b38 <memset>
88000634:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:30
    }

    write_segment(0x06);
88000638:	0e000321 	jal	88000c84 <write_segment>
8800063c:	24040006 	li	a0,6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:33

    // call the actual function
    int result = _entry();
88000640:	0e0000cc 	jal	88000330 <_entry>
88000644:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:34
    if (result == 0) {
88000648:	1440000a 	bnez	v0,88000674 <_main+0xb4>
8800064c:	00402825 	move	a1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:35
        puts("Program exited normally.");
88000650:	3c048800 	lui	a0,0x8800
88000654:	0e0002ef 	jal	88000bbc <puts>
88000658:	24840d24 	addiu	a0,a0,3364
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}
8800065c:	8fbf001c 	lw	ra,28(sp)
88000660:	8fb10018 	lw	s1,24(sp)
88000664:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:40
    write_segment(0x07);
88000668:	24040007 	li	a0,7
8800066c:	0a000321 	j	88000c84 <write_segment>
88000670:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:37
        printf("Program exited abnormally with code %d.\n", result);
88000674:	3c048800 	lui	a0,0x8800
88000678:	0e00020f 	jal	8800083c <printf>
8800067c:	24840d40 	addiu	a0,a0,3392
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
}
88000680:	1000fff7 	b	88000660 <_main+0xa0>
88000684:	8fbf001c 	lw	ra,28(sp)

88000688 <print_trapframe>:
print_trapframe():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
88000688:	27bdffd0 	addiu	sp,sp,-48
8800068c:	afb30024 	sw	s3,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
88000690:	3c138800 	lui	s3,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
void print_trapframe(trapframe_t *tf) {
88000694:	afb40028 	sw	s4,40(sp)
88000698:	afb20020 	sw	s2,32(sp)
8800069c:	afb1001c 	sw	s1,28(sp)
880006a0:	afb00018 	sw	s0,24(sp)
880006a4:	afbf002c 	sw	ra,44(sp)
880006a8:	00808025 	move	s0,a0
880006ac:	24920028 	addiu	s2,a0,40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
880006b0:	24110001 	li	s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
        printf("Register $%d: %p\n", i, tf->gpr[i]);
880006b4:	26730d6c 	addiu	s3,s3,3436
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
880006b8:	24140020 	li	s4,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64 (discriminator 3)
        printf("Register $%d: %p\n", i, tf->gpr[i]);
880006bc:	8e460000 	lw	a2,0(s2)
880006c0:	02202825 	move	a1,s1
880006c4:	02602025 	move	a0,s3
880006c8:	0e00020f 	jal	8800083c <printf>
880006cc:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63 (discriminator 3)
    for(int i = 1; i < 32; ++i) {
880006d0:	1634fffa 	bne	s1,s4,880006bc <print_trapframe+0x34>
880006d4:	26520004 	addiu	s2,s2,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:66
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
880006d8:	8e020020 	lw	v0,32(s0)
880006dc:	8e070018 	lw	a3,24(s0)
880006e0:	afa20014 	sw	v0,20(sp)
880006e4:	8e02001c 	lw	v0,28(s0)
880006e8:	8e060014 	lw	a2,20(s0)
880006ec:	8e050010 	lw	a1,16(s0)
880006f0:	3c048800 	lui	a0,0x8800
880006f4:	afa20010 	sw	v0,16(sp)
880006f8:	0e00020f 	jal	8800083c <printf>
880006fc:	24840d80 	addiu	a0,a0,3456
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:67
}
88000700:	8fbf002c 	lw	ra,44(sp)
88000704:	8fb40028 	lw	s4,40(sp)
88000708:	8fb30024 	lw	s3,36(sp)
8800070c:	8fb20020 	lw	s2,32(sp)
88000710:	8fb1001c 	lw	s1,28(sp)
88000714:	8fb00018 	lw	s0,24(sp)
88000718:	03e00008 	jr	ra
8800071c:	27bd0030 	addiu	sp,sp,48

88000720 <print_tlb>:
print_tlb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69

void print_tlb() {
88000720:	27bdffd8 	addiu	sp,sp,-40
88000724:	afb1001c 	sw	s1,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
88000728:	3c118800 	lui	s1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69
void print_tlb() {
8800072c:	afb20020 	sw	s2,32(sp)
88000730:	afb00018 	sw	s0,24(sp)
88000734:	afbf0024 	sw	ra,36(sp)
88000738:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
8800073c:	26310dbc 	addiu	s1,s1,3516
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
88000740:	24120010 	li	s2,16
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:72 (discriminator 3)
        asm volatile(
88000744:	40900000 	mtc0	s0,c0_index
88000748:	42000001 	tlbr
8800074c:	40065000 	mfc0	a2,c0_entryhi
88000750:	40071000 	mfc0	a3,c0_entrylo0
88000754:	40021800 	mfc0	v0,c0_entrylo1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81 (discriminator 3)
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
88000758:	02002825 	move	a1,s0
8800075c:	afa20010 	sw	v0,16(sp)
88000760:	02202025 	move	a0,s1
88000764:	0e00020f 	jal	8800083c <printf>
88000768:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70 (discriminator 3)
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
8800076c:	1612fff5 	bne	s0,s2,88000744 <print_tlb+0x24>
88000770:	8fbf0024 	lw	ra,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:83
    }
}
88000774:	8fb20020 	lw	s2,32(sp)
88000778:	8fb1001c 	lw	s1,28(sp)
8800077c:	8fb00018 	lw	s0,24(sp)
88000780:	03e00008 	jr	ra
88000784:	27bd0028 	addiu	sp,sp,40

88000788 <_exception_handler>:
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85

void _exception_handler(trapframe_t *tf, bool assertion) {
88000788:	27bdffe0 	addiu	sp,sp,-32
8800078c:	afb10018 	sw	s1,24(sp)
88000790:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
88000794:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
88000798:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
8800079c:	24840c98 	addiu	a0,a0,3224
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
880007a0:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
880007a4:	0e0002ef 	jal	88000bbc <puts>
880007a8:	00a08025 	move	s0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:87
    if (assertion) {
880007ac:	12000012 	beqz	s0,880007f8 <_exception_handler+0x70>
880007b0:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:88
        puts("CPU internal assertion failed, abort.");
880007b4:	3c048800 	lui	a0,0x8800
880007b8:	0e0002ef 	jal	88000bbc <puts>
880007bc:	24840df4 	addiu	a0,a0,3572
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:89
        write_segment(0xdeaddead);
880007c0:	3c04dead 	lui	a0,0xdead
880007c4:	0e000321 	jal	88000c84 <write_segment>
880007c8:	3484dead 	ori	a0,a0,0xdead
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:96
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
880007cc:	0e0001a2 	jal	88000688 <print_trapframe>
880007d0:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:97
    print_tlb();
880007d4:	0e0001c8 	jal	88000720 <print_tlb>
880007d8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:99
    puts("*****System HANG*****");
}
880007dc:	8fbf001c 	lw	ra,28(sp)
880007e0:	8fb10018 	lw	s1,24(sp)
880007e4:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:98
    puts("*****System HANG*****");
880007e8:	3c048800 	lui	a0,0x8800
880007ec:	24840e58 	addiu	a0,a0,3672
880007f0:	0a0002ef 	j	88000bbc <puts>
880007f4:	27bd0020 	addiu	sp,sp,32
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
880007f8:	40066800 	mfc0	a2,c0_cause
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:91
        word_t code = (_get_cause() >> 2) & 0xF;
880007fc:	00063082 	srl	a2,a2,0x2
88000800:	30c6000f 	andi	a2,a2,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
88000804:	3c038800 	lui	v1,0x8800
88000808:	00061080 	sll	v0,a2,0x2
8800080c:	246310e4 	addiu	v1,v1,4324
88000810:	00431021 	addu	v0,v0,v1
88000814:	8c470000 	lw	a3,0(v0)
88000818:	3c048800 	lui	a0,0x8800
_get_epc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:46
    asm(
8800081c:	40107000 	mfc0	s0,c0_epc
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
88000820:	24840e1c 	addiu	a0,a0,3612
88000824:	0e00020f 	jal	8800083c <printf>
88000828:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:94
        write_led((uint16_t) epc);
8800082c:	0e00031c 	jal	88000c70 <write_led>
88000830:	3204ffff 	andi	a0,s0,0xffff
88000834:	1000ffe5 	b	880007cc <_exception_handler+0x44>
88000838:	00000000 	nop

8800083c <printf>:
printf():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
int printf(const char *fmt, ...)
{
8800083c:	27bdffd0 	addiu	sp,sp,-48
88000840:	afb00018 	sw	s0,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
88000844:	27b00034 	addiu	s0,sp,52
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
{
88000848:	afb30024 	sw	s3,36(sp)
8800084c:	afb20020 	sw	s2,32(sp)
88000850:	afb1001c 	sw	s1,28(sp)
88000854:	afbf002c 	sw	ra,44(sp)
88000858:	afb40028 	sw	s4,40(sp)
8800085c:	00809025 	move	s2,a0
88000860:	afa50034 	sw	a1,52(sp)
88000864:	afa60038 	sw	a2,56(sp)
88000868:	afa7003c 	sw	a3,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	__builtin_va_start(ap, fmt);
8800086c:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10
	arg = ap;
	for (i = 0; fmt[i]; i++)
88000870:	00008825 	move	s1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
				break;
			}
		}
		else
		{
			if (c == '\n')
88000874:	2413000a 	li	s3,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 1)
	for (i = 0; fmt[i]; i++)
88000878:	02511021 	addu	v0,s2,s1
8800087c:	80540000 	lb	s4,0(v0)
88000880:	1680000a 	bnez	s4,880008ac <printf+0x70>
88000884:	24020025 	li	v0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:85
				putchar('\r');
			putchar(c);
		}
	}
	return 0;
}
88000888:	8fbf002c 	lw	ra,44(sp)
8800088c:	8fb40028 	lw	s4,40(sp)
88000890:	8fb30024 	lw	s3,36(sp)
88000894:	8fb20020 	lw	s2,32(sp)
88000898:	8fb1001c 	lw	s1,28(sp)
8800089c:	8fb00018 	lw	s0,24(sp)
880008a0:	00001025 	move	v0,zero
880008a4:	03e00008 	jr	ra
880008a8:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:13
		if (c == '%')
880008ac:	16820066 	bne	s4,v0,88000a48 <printf+0x20c>
880008b0:	24050001 	li	a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
880008b4:	24060064 	li	a2,100
880008b8:	24070025 	li	a3,37
880008bc:	24080030 	li	t0,48
880008c0:	02511021 	addu	v0,s2,s1
880008c4:	80420001 	lb	v0,1(v0)
880008c8:	1046003a 	beq	v0,a2,880009b4 <printf+0x178>
880008cc:	28430065 	slti	v1,v0,101
880008d0:	10600018 	beqz	v1,88000934 <printf+0xf8>
880008d4:	2843003a 	slti	v1,v0,58
880008d8:	1060000c 	beqz	v1,8800090c <printf+0xd0>
880008dc:	28430031 	slti	v1,v0,49
880008e0:	1060004d 	beqz	v1,88000a18 <printf+0x1dc>
880008e4:	02512021 	addu	a0,s2,s1
880008e8:	10470046 	beq	v0,a3,88000a04 <printf+0x1c8>
880008ec:	26340001 	addiu	s4,s1,1
880008f0:	10480048 	beq	v0,t0,88000a14 <printf+0x1d8>
880008f4:	02542021 	addu	a0,s2,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:73
				putchar('%');
880008f8:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
880008fc:	0e0002fb 	jal	88000bec <putchar>
88000900:	26310001 	addiu	s1,s1,1
88000904:	1000ffdd 	b	8800087c <printf+0x40>
88000908:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
8800090c:	24030062 	li	v1,98
88000910:	10430036 	beq	v0,v1,880009ec <printf+0x1b0>
88000914:	26340001 	addiu	s4,s1,1
88000918:	24030063 	li	v1,99
8800091c:	1443fff6 	bne	v0,v1,880008f8 <printf+0xbc>
88000920:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:25
				putchar((long)*arg);
88000924:	0e0002fb 	jal	88000bec <putchar>
88000928:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
8800092c:	10000017 	b	8800098c <printf+0x150>
88000930:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000934:	24030070 	li	v1,112
88000938:	1043002f 	beq	v0,v1,880009f8 <printf+0x1bc>
8800093c:	28430071 	slti	v1,v0,113
88000940:	10600008 	beqz	v1,88000964 <printf+0x128>
88000944:	24030075 	li	v1,117
88000948:	2403006c 	li	v1,108
8800094c:	10430020 	beq	v0,v1,880009d0 <printf+0x194>
88000950:	2403006f 	li	v1,111
88000954:	1443ffe8 	bne	v0,v1,880008f8 <printf+0xbc>
88000958:	00003825 	move	a3,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:45
				printbase((long)*arg, w, 8, 0);
8800095c:	10000017 	b	880009bc <printf+0x180>
88000960:	24060008 	li	a2,8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000964:	1043000d 	beq	v0,v1,8800099c <printf+0x160>
88000968:	26340001 	addiu	s4,s1,1
8800096c:	24030078 	li	v1,120
88000970:	10430021 	beq	v0,v1,880009f8 <printf+0x1bc>
88000974:	24030073 	li	v1,115
88000978:	1443ffe0 	bne	v0,v1,880008fc <printf+0xc0>
8800097c:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:20
				putstring(*arg);
88000980:	0e0002d7 	jal	88000b5c <putstring>
88000984:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
88000988:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
8800098c:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 2)
	for (i = 0; fmt[i]; i++)
88000990:	26310001 	addiu	s1,s1,1
88000994:	1000ffb9 	b	8800087c <printf+0x40>
88000998:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:30
				printbase((long)*arg, w, 10, 0);
8800099c:	00003825 	move	a3,zero
880009a0:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
880009a4:	0e000298 	jal	88000a60 <printbase>
880009a8:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
880009ac:	1000fff7 	b	8800098c <printf+0x150>
880009b0:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:35
				printbase((long)*arg, w, 10, 1);
880009b4:	24070001 	li	a3,1
880009b8:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
880009bc:	8e040000 	lw	a0,0(s0)
880009c0:	0e000298 	jal	88000a60 <printbase>
880009c4:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:59
				break;
880009c8:	1000fff1 	b	88000990 <printf+0x154>
880009cc:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:40
				printbase((long)*arg, w, 10, 0);
880009d0:	8e040000 	lw	a0,0(s0)
880009d4:	00003825 	move	a3,zero
880009d8:	0e000298 	jal	88000a60 <printbase>
880009dc:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:41
				arg++;
880009e0:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:43
				break;
880009e4:	1000ffea 	b	88000990 <printf+0x154>
880009e8:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
880009ec:	00003825 	move	a3,zero
880009f0:	1000ffec 	b	880009a4 <printf+0x168>
880009f4:	24060002 	li	a2,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
880009f8:	00003825 	move	a3,zero
880009fc:	1000ffef 	b	880009bc <printf+0x180>
88000a00:	24060010 	li	a2,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:61
				putchar('%');
88000a04:	0e0002fb 	jal	88000bec <putchar>
88000a08:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
88000a0c:	1000ffe0 	b	88000990 <printf+0x154>
88000a10:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:65
				i++;
88000a14:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:15 (discriminator 1)
			w = 1;
88000a18:	00002825 	move	a1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:67 (discriminator 1)
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
88000a1c:	80830001 	lb	v1,1(a0)
88000a20:	00928823 	subu	s1,a0,s2
88000a24:	2462ffcf 	addiu	v0,v1,-49
88000a28:	304200ff 	andi	v0,v0,0xff
88000a2c:	2c420009 	sltiu	v0,v0,9
88000a30:	1040ffa3 	beqz	v0,880008c0 <printf+0x84>
88000a34:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:68 (discriminator 3)
					w = w * 10 + (fmt[i + 1] - '0');
88000a38:	70b31002 	mul	v0,a1,s3
88000a3c:	2463ffd0 	addiu	v1,v1,-48
88000a40:	1000fff6 	b	88000a1c <printf+0x1e0>
88000a44:	00432821 	addu	a1,v0,v1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
			if (c == '\n')
88000a48:	16930003 	bne	s4,s3,88000a58 <printf+0x21c>
88000a4c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:80
				putchar('\r');
88000a50:	0e0002fb 	jal	88000bec <putchar>
88000a54:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
88000a58:	1000ffa8 	b	880008fc <printf+0xc0>
88000a5c:	02802025 	move	a0,s4

88000a60 <printbase>:
printbase():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2
int printbase(long v,int w,int base,int sign)
{
88000a60:	27bdff98 	addiu	sp,sp,-104
88000a64:	afb40060 	sw	s4,96(sp)
88000a68:	afb3005c 	sw	s3,92(sp)
88000a6c:	afbf0064 	sw	ra,100(sp)
88000a70:	afb20058 	sw	s2,88(sp)
88000a74:	afb10054 	sw	s1,84(sp)
88000a78:	afb00050 	sw	s0,80(sp)
88000a7c:	00a09825 	move	s3,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
88000a80:	10e00018 	beqz	a3,88000ae4 <printbase+0x84>
88000a84:	00c0a025 	move	s4,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7 (discriminator 1)
88000a88:	04810004 	bgez	a0,88000a9c <printbase+0x3c>
88000a8c:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:9
	{
	value = -v;
88000a90:	00048023 	negu	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:10
	putchar('-');
88000a94:	0e0002fb 	jal	88000bec <putchar>
88000a98:	2404002d 	li	a0,45
88000a9c:	27b10010 	addiu	s1,sp,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2 (discriminator 1)
{
88000aa0:	02201025 	move	v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:14 (discriminator 1)
	}
	else value=v;

	for(i=0;value;i++)
88000aa4:	16000011 	bnez	s0,88000aec <printbase+0x8c>
88000aa8:	00519023 	subu	s2,v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22
	value=value/base;
	}

#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
88000aac:	0272802a 	slt	s0,s3,s2
88000ab0:	0250980b 	movn	s3,s2,s0
88000ab4:	02608025 	move	s0,s3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22 (discriminator 2)
88000ab8:	16000013 	bnez	s0,88000b08 <printbase+0xa8>
88000abc:	0250102a 	slt	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:28
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}
88000ac0:	8fbf0064 	lw	ra,100(sp)
88000ac4:	8fb40060 	lw	s4,96(sp)
88000ac8:	8fb3005c 	lw	s3,92(sp)
88000acc:	8fb20058 	lw	s2,88(sp)
88000ad0:	8fb10054 	lw	s1,84(sp)
88000ad4:	8fb00050 	lw	s0,80(sp)
88000ad8:	00001025 	move	v0,zero
88000adc:	03e00008 	jr	ra
88000ae0:	27bd0068 	addiu	sp,sp,104
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:12
	else value=v;
88000ae4:	1000ffed 	b	88000a9c <printbase+0x3c>
88000ae8:	00808025 	move	s0,a0
88000aec:	0214001b 	divu	zero,s0,s4
88000af0:	028001f4 	teq	s4,zero,0x7
88000af4:	24420001 	addiu	v0,v0,1
88000af8:	00002010 	mfhi	a0
88000afc:	00008012 	mflo	s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:16 (discriminator 3)
	buf[i]=value%base;
88000b00:	1000ffe8 	b	88000aa4 <printbase+0x44>
88000b04:	a044ffff 	sb	a0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24
		c=j>i?0:buf[j-1];
88000b08:	14400006 	bnez	v0,88000b24 <printbase+0xc4>
88000b0c:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24 (discriminator 1)
88000b10:	02301021 	addu	v0,s1,s0
88000b14:	8042ffff 	lb	v0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 1)
		putchar((c<=9)?c+'0':c-0xa+'a');
88000b18:	2843000a 	slti	v1,v0,10
88000b1c:	10600002 	beqz	v1,88000b28 <printbase+0xc8>
88000b20:	24440057 	addiu	a0,v0,87
88000b24:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 4)
88000b28:	0e0002fb 	jal	88000bec <putchar>
88000b2c:	2610ffff 	addiu	s0,s0,-1
88000b30:	1000ffe1 	b	88000ab8 <printbase+0x58>
88000b34:	00000000 	nop

88000b38 <memset>:
memset():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:273
 * @n:      number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
88000b38:	00801025 	move	v0,a0
88000b3c:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:277
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memset(s, c, n);
#else
    char *p = s;
88000b40:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:278
    while (n -- > 0) {
88000b44:	14660003 	bne	v1,a2,88000b54 <memset+0x1c>
88000b48:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:283
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
88000b4c:	03e00008 	jr	ra
88000b50:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:279
        *p ++ = c;
88000b54:	1000fffb 	b	88000b44 <memset+0xc>
88000b58:	a065ffff 	sb	a1,-1(v1)

88000b5c <putstring>:
putstring():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:2
int putstring(const char *s)
{
88000b5c:	27bdffe0 	addiu	sp,sp,-32
88000b60:	afb20018 	sw	s2,24(sp)
88000b64:	afb10014 	sw	s1,20(sp)
88000b68:	afbf001c 	sw	ra,28(sp)
88000b6c:	afb00010 	sw	s0,16(sp)
88000b70:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
    char c;
    while ((c = *s))
    {
        if (c == '\n')
88000b74:	2412000a 	li	s2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:4
    while ((c = *s))
88000b78:	82300000 	lb	s0,0(s1)
88000b7c:	16000007 	bnez	s0,88000b9c <putstring+0x40>
88000b80:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:12
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
88000b84:	8fb20018 	lw	s2,24(sp)
88000b88:	8fb10014 	lw	s1,20(sp)
88000b8c:	8fb00010 	lw	s0,16(sp)
88000b90:	00001025 	move	v0,zero
88000b94:	03e00008 	jr	ra
88000b98:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
        if (c == '\n')
88000b9c:	16120003 	bne	s0,s2,88000bac <putstring+0x50>
88000ba0:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:7
            putchar('\r');
88000ba4:	0e0002fb 	jal	88000bec <putchar>
88000ba8:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:8
        putchar(c);
88000bac:	0e0002fb 	jal	88000bec <putchar>
88000bb0:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:9
        s++;
88000bb4:	1000fff0 	b	88000b78 <putstring+0x1c>
88000bb8:	26310001 	addiu	s1,s1,1

88000bbc <puts>:
puts():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:15

int puts(const char *s)
{
88000bbc:	27bdffe8 	addiu	sp,sp,-24
88000bc0:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:16
    putstring(s);
88000bc4:	0e0002d7 	jal	88000b5c <putstring>
88000bc8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:17
    putchar('\r');
88000bcc:	0e0002fb 	jal	88000bec <putchar>
88000bd0:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:18
    putchar('\n');
88000bd4:	0e0002fb 	jal	88000bec <putchar>
88000bd8:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:20
    return 0;
}
88000bdc:	8fbf0014 	lw	ra,20(sp)
88000be0:	00001025 	move	v0,zero
88000be4:	03e00008 	jr	ra
88000be8:	27bd0018 	addiu	sp,sp,24

88000bec <putchar>:
putchar():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:4
#include <machine.h>

int putchar(int c)
{
88000bec:	27bdffe8 	addiu	sp,sp,-24
88000bf0:	afb00010 	sw	s0,16(sp)
88000bf4:	00808025 	move	s0,a0
88000bf8:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:5
	write_serial((byte_t) c);
88000bfc:	0e000314 	jal	88000c50 <write_serial>
88000c00:	308400ff 	andi	a0,a0,0xff
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:7
	return c;
88000c04:	8fbf0014 	lw	ra,20(sp)
88000c08:	02001025 	move	v0,s0
88000c0c:	8fb00010 	lw	s0,16(sp)
88000c10:	03e00008 	jr	ra
88000c14:	27bd0018 	addiu	sp,sp,24

88000c18 <init_serial>:
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
}

template<typename T>
void write(void *addr, T data){
    auto *ptr = reinterpret_cast<volatile T *>(addr);
    *ptr = data;
88000c18:	3c02bfd0 	lui	v0,0xbfd0
88000c1c:	2403ff81 	li	v1,-127
88000c20:	a0433008 	sb	v1,12296(v0)
88000c24:	2403ff80 	li	v1,-128
88000c28:	a043300c 	sb	v1,12300(v0)
88000c2c:	24030036 	li	v1,54
88000c30:	a0433000 	sb	v1,12288(v0)
88000c34:	24030003 	li	v1,3
88000c38:	a0403004 	sb	zero,12292(v0)
88000c3c:	a043300c 	sb	v1,12300(v0)
88000c40:	a0403010 	sb	zero,12304(v0)
88000c44:	a0403004 	sb	zero,12292(v0)
init_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:45
	write_byte(UART_LCR_ADDR, ~0x80 & 0x03);
	// disable modem controls
	write_byte(UART_MCR_ADDR, 0);
	// disable interrupts
	write_byte(UART_IER_ADDR, 0);
}
88000c48:	03e00008 	jr	ra
88000c4c:	00000000 	nop

88000c50 <write_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
88000c50:	3c03bfd0 	lui	v1,0xbfd0
88000c54:	90623014 	lbu	v0,12308(v1)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:53
	while (!(read_byte(UART_LSR_ADDR) & 0x01));
	return read_byte(UART_DAT_ADDR);
}

void write_serial(byte_t data){
	while (!(read_byte(UART_LSR_ADDR) & 0x40));
88000c58:	30420040 	andi	v0,v0,0x40
88000c5c:	1040fffd 	beqz	v0,88000c54 <write_serial+0x4>
88000c60:	3c02bfd0 	lui	v0,0xbfd0
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88000c64:	a0443000 	sb	a0,12288(v0)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:55
	write_byte(UART_DAT_ADDR, data);
}
88000c68:	03e00008 	jr	ra
88000c6c:	00000000 	nop

88000c70 <write_led>:
_Z5writeItEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88000c70:	3c02bff0 	lui	v0,0xbff0
88000c74:	3442f000 	ori	v0,v0,0xf000
88000c78:	a4440000 	sh	a0,0(v0)
write_led():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:68
	return word;
}

void write_led(hword_t data){
	write_hword(LED_ADDR, data);
}
88000c7c:	03e00008 	jr	ra
88000c80:	00000000 	nop

88000c84 <write_segment>:
_Z5writeIjEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88000c84:	3c02bff0 	lui	v0,0xbff0
88000c88:	3442f010 	ori	v0,v0,0xf010
88000c8c:	ac440000 	sw	a0,0(v0)
write_segment():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:72

void write_segment(word_t data){
	write_word(NUM_ADDR, data);
}
88000c90:	03e00008 	jr	ra
88000c94:	00000000 	nop
88000c98:	2a2a2a2a 	slti	t2,s1,10794
88000c9c:	6972542a 	0x6972542a
88000ca0:	6c616976 	0x6c616976
88000ca4:	5350494d 	beql	k0,s0,880131dc <_text_end+0x1205c>
88000ca8:	72614220 	0x72614220
88000cac:	654d2065 	0x654d2065
88000cb0:	206c6174 	addi	t4,v1,24948
88000cb4:	74737953 	jalx	81cde54c <_bss_end+0x1cdd54c>
88000cb8:	2a2a6d65 	slti	t2,s1,28005
88000cbc:	002a2a2a 	0x2a2a2a
88000cc0:	706d6f43 	0x706d6f43
88000cc4:	74616c69 	jalx	8185b1a4 <_bss_end+0x185a1a4>
88000cc8:	206e6f69 	addi	t6,v1,28521
88000ccc:	656d6974 	0x656d6974
88000cd0:	3931203a 	xori	s1,t1,0x203a
88000cd4:	3a34313a 	xori	s4,s1,0x313a
88000cd8:	44203635 	0x44203635
88000cdc:	31206365 	andi	zero,t1,0x6365
88000ce0:	30322035 	andi	s2,at,0x2035
88000ce4:	00003931 	tgeu	zero,zero,0xe4
88000ce8:	6c6c6946 	0x6c6c6946
88000cec:	20676e69 	addi	a3,v1,28265
88000cf0:	7373622e 	0x7373622e
88000cf4:	63657320 	0x63657320
88000cf8:	6e6f6974 	0x6e6f6974
88000cfc:	74697720 	jalx	81a5dc80 <_bss_end+0x1a5cc80>
88000d00:	2c302068 	sltiu	s0,at,8296
88000d04:	66666f20 	0x66666f20
88000d08:	3a746573 	xori	s4,s3,0x6573
88000d0c:	25783020 	addiu	t8,t3,12320
88000d10:	73202c78 	0x73202c78
88000d14:	3a657a69 	xori	a1,s3,0x7a69
88000d18:	20642520 	addi	a0,v1,9504
88000d1c:	65747962 	0x65747962
88000d20:	000a2e73 	tltu	zero,t2,0xb9
88000d24:	676f7250 	0x676f7250
88000d28:	206d6172 	addi	t5,v1,24946
88000d2c:	74697865 	jalx	81a5e194 <_bss_end+0x1a5d194>
88000d30:	6e206465 	0x6e206465
88000d34:	616d726f 	0x616d726f
88000d38:	2e796c6c 	sltiu	t9,s3,27756
88000d3c:	00000000 	nop
88000d40:	676f7250 	0x676f7250
88000d44:	206d6172 	addi	t5,v1,24946
88000d48:	74697865 	jalx	81a5e194 <_bss_end+0x1a5d194>
88000d4c:	61206465 	0x61206465
88000d50:	726f6e62 	0x726f6e62
88000d54:	6c6c616d 	0x6c6c616d
88000d58:	69772079 	0x69772079
88000d5c:	63206874 	0x63206874
88000d60:	2065646f 	addi	a1,v1,25711
88000d64:	0a2e6425 	j	88b99094 <_text_end+0xb97f14>
88000d68:	00000000 	nop
88000d6c:	69676552 	0x69676552
88000d70:	72657473 	0x72657473
88000d74:	64252420 	0x64252420
88000d78:	7025203a 	0x7025203a
88000d7c:	0000000a 	movz	zero,zero,zero
88000d80:	3a435045 	xori	v1,s2,0x5045
88000d84:	2c702520 	sltiu	s0,v1,9504
88000d88:	75614320 	jalx	85850c80 <_bss_end+0x584fc80>
88000d8c:	203a6573 	addi	k0,at,25971
88000d90:	202c7025 	addi	t4,at,28709
88000d94:	74617453 	jalx	8185d14c <_bss_end+0x185c14c>
88000d98:	203a7375 	addi	k0,at,29557
88000d9c:	202c7025 	addi	t4,at,28709
88000da0:	56646142 	bnel	s3,a0,880192ac <_text_end+0x1812c>
88000da4:	72646441 	0x72646441
88000da8:	7025203a 	0x7025203a
88000dac:	4245202c 	c0	0x45202c
88000db0:	3a657361 	xori	a1,s3,0x7361
88000db4:	0a702520 	j	89c09480 <_text_end+0x1c08300>
88000db8:	00000000 	nop
88000dbc:	20424c54 	addi	v0,v0,19540
88000dc0:	6d657469 	0x6d657469
88000dc4:	3a642520 	xori	a0,s3,0x2520
88000dc8:	746e4520 	jalx	81b91480 <_bss_end+0x1b90480>
88000dcc:	69487972 	0x69487972
88000dd0:	2c702520 	sltiu	s0,v1,9504
88000dd4:	746e4520 	jalx	81b91480 <_bss_end+0x1b90480>
88000dd8:	6f4c7972 	0x6f4c7972
88000ddc:	25203a31 	addiu	zero,t1,14897
88000de0:	45202c70 	0x45202c70
88000de4:	7972746e 	0x7972746e
88000de8:	3a326f4c 	xori	s2,s1,0x6f4c
88000dec:	0a702520 	j	89c09480 <_text_end+0x1c08300>
88000df0:	00000000 	nop
88000df4:	20555043 	addi	s5,v0,20547
88000df8:	65746e69 	0x65746e69
88000dfc:	6c616e72 	0x6c616e72
88000e00:	73736120 	0x73736120
88000e04:	69747265 	0x69747265
88000e08:	66206e6f 	0x66206e6f
88000e0c:	656c6961 	0x656c6961
88000e10:	61202c64 	0x61202c64
88000e14:	74726f62 	jalx	81c9bd88 <_bss_end+0x1c9ad88>
88000e18:	0000002e 	0x2e
88000e1c:	65206e41 	0x65206e41
88000e20:	70656378 	0x70656378
88000e24:	6e6f6974 	0x6e6f6974
88000e28:	63636f20 	0x63636f20
88000e2c:	65727275 	0x65727275
88000e30:	77202c64 	jalx	8c80b190 <_text_end+0x480a010>
88000e34:	20687469 	addi	t0,v1,29801
88000e38:	20435045 	addi	v1,v0,20549
88000e3c:	78257830 	0x78257830
88000e40:	646e6120 	0x646e6120
88000e44:	75614320 	jalx	85850c80 <_bss_end+0x584fc80>
88000e48:	25206573 	addiu	zero,t1,25971
88000e4c:	25282064 	addiu	t0,t1,8292
88000e50:	0a2e2973 	j	88b8a5cc <_text_end+0xb8944c>
88000e54:	00000000 	nop
88000e58:	2a2a2a2a 	slti	t2,s1,10794
88000e5c:	7379532a 	0x7379532a
88000e60:	206d6574 	addi	t5,v1,25972
88000e64:	474e4148 	c1	0x14e4148
88000e68:	2a2a2a2a 	slti	t2,s1,10794
88000e6c:	0000002a 	slt	zero,zero,zero
88000e70:	65746e49 	0x65746e49
88000e74:	70757272 	0x70757272
88000e78:	00000074 	teq	zero,zero,0x1
88000e7c:	20424c54 	addi	v0,v0,19540
88000e80:	69646f6d 	0x69646f6d
88000e84:	61636966 	0x61636966
88000e88:	6e6f6974 	0x6e6f6974
88000e8c:	63786520 	0x63786520
88000e90:	69747065 	0x69747065
88000e94:	00006e6f 	0x6e6f
88000e98:	20424c54 	addi	v0,v0,19540
88000e9c:	65637865 	0x65637865
88000ea0:	6f697470 	0x6f697470
88000ea4:	6c28206e 	0x6c28206e
88000ea8:	2064616f 	addi	a0,v1,24943
88000eac:	6920726f 	0x6920726f
88000eb0:	7274736e 	0x7274736e
88000eb4:	69746375 	0x69746375
88000eb8:	66206e6f 	0x66206e6f
88000ebc:	68637465 	0x68637465
88000ec0:	00000029 	0x29
88000ec4:	20424c54 	addi	v0,v0,19540
88000ec8:	65637865 	0x65637865
88000ecc:	6f697470 	0x6f697470
88000ed0:	7328206e 	0x7328206e
88000ed4:	65726f74 	0x65726f74
88000ed8:	00000029 	0x29
88000edc:	72646441 	0x72646441
88000ee0:	20737365 	addi	s3,v1,29541
88000ee4:	6f727265 	0x6f727265
88000ee8:	78652072 	0x78652072
88000eec:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000ef0:	206e6f69 	addi	t6,v1,28521
88000ef4:	616f6c28 	0x616f6c28
88000ef8:	726f2064 	0x726f2064
88000efc:	736e6920 	0x736e6920
88000f00:	63757274 	0x63757274
88000f04:	6e6f6974 	0x6e6f6974
88000f08:	74656620 	jalx	81959880 <_bss_end+0x1958880>
88000f0c:	00296863 	0x296863
88000f10:	72646441 	0x72646441
88000f14:	20737365 	addi	s3,v1,29541
88000f18:	6f727265 	0x6f727265
88000f1c:	78652072 	0x78652072
88000f20:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000f24:	206e6f69 	addi	t6,v1,28521
88000f28:	6f747328 	0x6f747328
88000f2c:	00296572 	tlt	at,t1,0x195
88000f30:	20737542 	addi	s3,v1,30018
88000f34:	6f727265 	0x6f727265
88000f38:	78652072 	0x78652072
88000f3c:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000f40:	206e6f69 	addi	t6,v1,28521
88000f44:	736e6928 	0x736e6928
88000f48:	63757274 	0x63757274
88000f4c:	6e6f6974 	0x6e6f6974
88000f50:	74656620 	jalx	81959880 <_bss_end+0x1958880>
88000f54:	00296863 	0x296863
88000f58:	20737542 	addi	s3,v1,30018
88000f5c:	6f727265 	0x6f727265
88000f60:	78652072 	0x78652072
88000f64:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000f68:	206e6f69 	addi	t6,v1,28521
88000f6c:	74616428 	jalx	818590a0 <_bss_end+0x18580a0>
88000f70:	65722061 	0x65722061
88000f74:	65726566 	0x65726566
88000f78:	3a65636e 	xori	a1,s3,0x636e
88000f7c:	616f6c20 	0x616f6c20
88000f80:	726f2064 	0x726f2064
88000f84:	6f747320 	0x6f747320
88000f88:	00296572 	tlt	at,t1,0x195
88000f8c:	63737953 	0x63737953
88000f90:	206c6c61 	addi	t4,v1,27745
88000f94:	65637865 	0x65637865
88000f98:	6f697470 	0x6f697470
88000f9c:	0000006e 	0x6e
88000fa0:	61657242 	0x61657242
88000fa4:	696f706b 	0x696f706b
88000fa8:	6520746e 	0x6520746e
88000fac:	70656378 	0x70656378
88000fb0:	6e6f6974 	0x6e6f6974
88000fb4:	00000000 	nop
88000fb8:	65736552 	0x65736552
88000fbc:	64657672 	0x64657672
88000fc0:	736e6920 	0x736e6920
88000fc4:	63757274 	0x63757274
88000fc8:	6e6f6974 	0x6e6f6974
88000fcc:	63786520 	0x63786520
88000fd0:	69747065 	0x69747065
88000fd4:	00006e6f 	0x6e6f
88000fd8:	72706f43 	0x72706f43
88000fdc:	7365636f 	0x7365636f
88000fe0:	20726f73 	addi	s2,v1,28531
88000fe4:	73756e55 	0x73756e55
88000fe8:	656c6261 	0x656c6261
88000fec:	63786520 	0x63786520
88000ff0:	69747065 	0x69747065
88000ff4:	00006e6f 	0x6e6f
88000ff8:	74697241 	jalx	81a5c904 <_bss_end+0x1a5b904>
88000ffc:	74656d68 	jalx	8195b5a0 <_bss_end+0x195a5a0>
88001000:	4f206369 	c3	0x1206369
88001004:	66726576 	0x66726576
88001008:	20776f6c 	addi	s7,v1,28524
8800100c:	65637865 	0x65637865
88001010:	6f697470 	0x6f697470
88001014:	0000006e 	0x6e
88001018:	70617254 	0x70617254
8800101c:	63786520 	0x63786520
88001020:	69747065 	0x69747065
88001024:	00006e6f 	0x6e6f
88001028:	2041534d 	addi	at,v0,21325
8800102c:	616f6c46 	0x616f6c46
88001030:	676e6974 	0x676e6974
88001034:	696f502d 	0x696f502d
88001038:	6520746e 	0x6520746e
8800103c:	70656378 	0x70656378
88001040:	6e6f6974 	0x6e6f6974
88001044:	00000000 	nop
88001048:	20424c54 	addi	v0,v0,19540
8800104c:	64616552 	0x64616552
88001050:	686e492d 	0x686e492d
88001054:	74696269 	jalx	81a589a4 <_bss_end+0x1a579a4>
88001058:	63786520 	0x63786520
8800105c:	69747065 	0x69747065
88001060:	00006e6f 	0x6e6f
88001064:	20424c54 	addi	v0,v0,19540
88001068:	63657845 	0x63657845
8800106c:	6f697475 	0x6f697475
88001070:	6e492d6e 	0x6e492d6e
88001074:	69626968 	0x69626968
88001078:	78652074 	0x78652074
8800107c:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88001080:	006e6f69 	0x6e6f69
88001084:	43544157 	c0	0x1544157
88001088:	00000048 	0x48
8800108c:	6863614d 	0x6863614d
88001090:	20656e69 	addi	a1,v1,28265
88001094:	63656863 	0x63656863
88001098:	0000006b 	0x6b
8800109c:	65726854 	0x65726854
880010a0:	41206461 	0x41206461
880010a4:	636f6c6c 	0x636f6c6c
880010a8:	6f697461 	0x6f697461
880010ac:	44202c6e 	0x44202c6e
880010b0:	6c6c6165 	0x6c6c6165
880010b4:	7461636f 	jalx	81858dbc <_bss_end+0x1857dbc>
880010b8:	2c6e6f69 	sltiu	t6,v1,28521
880010bc:	20726f20 	addi	s2,v1,28448
880010c0:	65686353 	0x65686353
880010c4:	696c7564 	0x696c7564
880010c8:	4520676e 	0x4520676e
880010cc:	70656378 	0x70656378
880010d0:	6e6f6974 	0x6e6f6974
880010d4:	00000073 	tltu	zero,zero,0x1
880010d8:	68636143 	0x68636143
880010dc:	72652065 	0x72652065
880010e0:	00726f72 	tlt	v1,s2,0x1bd

880010e4 <EXCEPTION_MESSAGES>:
880010e4:	88000e70 	lwl	zero,3696(zero)
880010e8:	88000e7c 	lwl	zero,3708(zero)
880010ec:	88000e98 	lwl	zero,3736(zero)
880010f0:	88000ec4 	lwl	zero,3780(zero)
880010f4:	88000edc 	lwl	zero,3804(zero)
880010f8:	88000f10 	lwl	zero,3856(zero)
880010fc:	88000f30 	lwl	zero,3888(zero)
88001100:	88000f58 	lwl	zero,3928(zero)
88001104:	88000f8c 	lwl	zero,3980(zero)
88001108:	88000fa0 	lwl	zero,4000(zero)
8800110c:	88000fb8 	lwl	zero,4024(zero)
88001110:	88000fd8 	lwl	zero,4056(zero)
88001114:	88000ff8 	lwl	zero,4088(zero)
88001118:	88001018 	lwl	zero,4120(zero)
8800111c:	88001028 	lwl	zero,4136(zero)
88001120:	8800102c 	lwl	zero,4140(zero)
88001124:	88000e54 	lwl	zero,3668(zero)
88001128:	88000e54 	lwl	zero,3668(zero)
8800112c:	88000e54 	lwl	zero,3668(zero)
88001130:	88001048 	lwl	zero,4168(zero)
88001134:	88001064 	lwl	zero,4196(zero)
88001138:	88000e54 	lwl	zero,3668(zero)
8800113c:	88000e54 	lwl	zero,3668(zero)
88001140:	88001084 	lwl	zero,4228(zero)
88001144:	8800108c 	lwl	zero,4236(zero)
88001148:	8800109c 	lwl	zero,4252(zero)
8800114c:	88000e54 	lwl	zero,3668(zero)
88001150:	88000e54 	lwl	zero,3668(zero)
88001154:	88000e54 	lwl	zero,3668(zero)
88001158:	88000e54 	lwl	zero,3668(zero)
8800115c:	880010d8 	lwl	zero,4312(zero)
88001160:	88000e54 	lwl	zero,3668(zero)
88001164:	00000000 	nop
88001168:	01200000 	0x1200000
8800116c:	02000101 	0x2000101
	...
88001178:	00000001 	movf	zero,zero,$fcc0
8800117c:	00000000 	nop

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
       0:	00003f50 	0x3f50
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	00000004 	sllv	zero,zero,zero
       8:	01040000 	0x1040000
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
       c:	00000caa 	0xcaa
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	0012d304 	0x12d304
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	000c5200 	sll	t2,t4,0x8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	00007800 	sll	t7,zero,0x0
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	07040200 	0x7040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	0000104f 	0x104f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	00002503 	sra	a0,zero,0x14
      30:	07040200 	0x7040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	0000104a 	0x104a
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	00140c04 	0x140c04
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	4d580100 	0x4d580100
      40:	05000012 	bltz	t0,8c <_data-0x7fffff74>
      44:	0000060f 	sync	0x18
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
#else
    const char *s = src;
    char *d = dst;
    if (s < d && s + n > d) {
        s += n, d += n;
        while (n -- > 0) {
      48:	d85a0101 	ldc2	$26,257(v0)
      4c:	06000000 	bltz	s0,50 <_data-0x7fffffb0>
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
      d4:	00000000 	nop
      d8:	000a8505 	0xa8505
      dc:	5a010100 	0x5a010100
      e0:	000001d1 	0x1d1
      e4:	01004906 	0x1004906
      e8:	0025075a 	0x25075a
      ec:	00040000 	sll	zero,a0,0x0
      f0:	07000000 	bltz	t8,f4 <_data-0x7fffff0c>
      f4:	00000025 	move	zero,zero
      f8:	00000104 	0x104
      fc:	00250700 	0x250700
     100:	02040000 	0x2040000
     104:	07000000 	bltz	t8,108 <_data-0x7ffffef8>
     108:	00000025 	move	zero,zero
     10c:	00000304 	0x304
     110:	00250700 	0x250700
     114:	04040000 	0x4040000
     118:	07000000 	bltz	t8,11c <_data-0x7ffffee4>
     11c:	00000025 	move	zero,zero
     120:	00000504 	0x504
     124:	00250700 	0x250700
     128:	06040000 	0x6040000
     12c:	07000000 	bltz	t8,130 <_data-0x7ffffed0>
     130:	00000025 	move	zero,zero
     134:	00000704 	0x704
     138:	00250700 	0x250700
     13c:	08040000 	j	100000 <_data-0x7ff00000>
     140:	07000000 	bltz	t8,144 <_data-0x7ffffebc>
     144:	00000025 	move	zero,zero
     148:	00000904 	0x904
     14c:	00250700 	0x250700
     150:	0a040000 	j	8100000 <_data-0x77f00000>
     154:	07000000 	bltz	t8,158 <_data-0x7ffffea8>
     158:	00000025 	move	zero,zero
     15c:	00000b04 	0xb04
     160:	00250700 	0x250700
     164:	0c040000 	jal	100000 <_data-0x7ff00000>
     168:	07000000 	bltz	t8,16c <_data-0x7ffffe94>
     16c:	00000025 	move	zero,zero
     170:	00000d04 	0xd04
     174:	00250700 	0x250700
     178:	0e040000 	jal	8100000 <_data-0x77f00000>
     17c:	07000000 	bltz	t8,180 <_data-0x7ffffe80>
     180:	00000025 	move	zero,zero
     184:	00000f04 	0xf04
     188:	00250700 	0x250700
     18c:	10040000 	beq	zero,a0,190 <_data-0x7ffffe70>
     190:	07000000 	bltz	t8,194 <_data-0x7ffffe6c>
     194:	00000025 	move	zero,zero
     198:	00001104 	0x1104
     19c:	00250700 	0x250700
     1a0:	12040000 	beq	s0,a0,1a4 <_data-0x7ffffe5c>
     1a4:	07000000 	bltz	t8,1a8 <_data-0x7ffffe58>
     1a8:	00000025 	move	zero,zero
     1ac:	00001304 	0x1304
     1b0:	00250700 	0x250700
     1b4:	14040000 	bne	zero,a0,1b8 <_data-0x7ffffe48>
     1b8:	07000000 	bltz	t8,1bc <_data-0x7ffffe44>
     1bc:	00000025 	move	zero,zero
     1c0:	00001504 	0x1504
     1c4:	00250700 	0x250700
     1c8:	16040000 	bne	s0,a0,1cc <_data-0x7ffffe34>
     1cc:	00000000 	nop
     1d0:	026f0500 	0x26f0500
     1d4:	01010000 	0x1010000
     1d8:	00023e5a 	0x23e5a
     1dc:	00490600 	0x490600
     1e0:	25075a01 	addiu	a3,t0,23041
     1e4:	04000000 	bltz	zero,1e8 <_data-0x7ffffe18>
     1e8:	00000000 	nop
     1ec:	00002507 	0x2507
     1f0:	00010400 	sll	zero,at,0x10
     1f4:	25070000 	addiu	a3,t0,0
     1f8:	04000000 	bltz	zero,1fc <_data-0x7ffffe04>
     1fc:	00000002 	srl	zero,zero,0x0
     200:	00002507 	0x2507
     204:	00030400 	sll	zero,v1,0x10
     208:	25070000 	addiu	a3,t0,0
     20c:	04000000 	bltz	zero,210 <_data-0x7ffffdf0>
     210:	00000004 	sllv	zero,zero,zero
     214:	00002507 	0x2507
     218:	00050400 	sll	zero,a1,0x10
     21c:	25070000 	addiu	a3,t0,0
     220:	04000000 	bltz	zero,224 <_data-0x7ffffddc>
     224:	00000006 	srlv	zero,zero,zero
     228:	00002507 	0x2507
     22c:	00070400 	sll	zero,a3,0x10
     230:	25070000 	addiu	a3,t0,0
     234:	04000000 	bltz	zero,238 <_data-0x7ffffdc8>
     238:	00000008 	jr	zero
     23c:	35050000 	ori	a1,t0,0x0
     240:	01000002 	0x1000002
     244:	02bf5a01 	0x2bf5a01
     248:	49060000 	bc2fl	$cc1,24c <_data-0x7ffffdb4>
     24c:	075a0100 	0x75a0100
     250:	00000025 	move	zero,zero
     254:	00000004 	sllv	zero,zero,zero
     258:	00250700 	0x250700
     25c:	01040000 	0x1040000
     260:	07000000 	bltz	t8,264 <_data-0x7ffffd9c>
     264:	00000025 	move	zero,zero
     268:	00000204 	0x204
     26c:	00250700 	0x250700
     270:	03040000 	0x3040000
     274:	07000000 	bltz	t8,278 <_data-0x7ffffd88>
     278:	00000025 	move	zero,zero
     27c:	00000404 	0x404
     280:	00250700 	0x250700
     284:	05040000 	0x5040000
     288:	07000000 	bltz	t8,28c <_data-0x7ffffd74>
     28c:	00000025 	move	zero,zero
     290:	00000604 	0x604
     294:	00250700 	0x250700
     298:	07040000 	0x7040000
     29c:	07000000 	bltz	t8,2a0 <_data-0x7ffffd60>
     2a0:	00000025 	move	zero,zero
     2a4:	00000804 	sllv	at,zero,zero
     2a8:	00250700 	0x250700
     2ac:	09040000 	j	4100000 <_data-0x7bf00000>
     2b0:	07000000 	bltz	t8,2b4 <_data-0x7ffffd4c>
     2b4:	00000025 	move	zero,zero
     2b8:	00000a04 	0xa04
     2bc:	08000000 	j	0 <_data-0x80000000>
     2c0:	000004d2 	0x4d2
     2c4:	11086701 	beq	t0,t0,19ecc <_data-0x7ffe6134>
     2c8:	03600000 	0x3600000
     2cc:	53090000 	beql	t8,t1,2d0 <_data-0x7ffffd30>
     2d0:	19000001 	blez	t0,2d8 <_data-0x7ffffd28>
     2d4:	0a000003 	j	800000c <_data-0x77fffff4>
     2d8:	0000124d 	break	0x0,0x49
     2dc:	00124d0a 	0x124d0a
     2e0:	124d0a00 	beq	s2,t5,2ae4 <_data-0x7fffd51c>
     2e4:	4d0a0000 	0x4d0a0000
     2e8:	0a000012 	j	8000048 <_data-0x77ffffb8>
     2ec:	0000124d 	break	0x0,0x49
     2f0:	00124d0a 	0x124d0a
     2f4:	124d0a00 	beq	s2,t5,2af8 <_data-0x7fffd508>
     2f8:	4d0a0000 	0x4d0a0000
     2fc:	0a000012 	j	8000048 <_data-0x77ffffb8>
     300:	0000124d 	break	0x0,0x49
     304:	00124d0a 	0x124d0a
     308:	124d0a00 	beq	s2,t5,2b0c <_data-0x7fffd4f4>
     30c:	4d0a0000 	0x4d0a0000
     310:	0a000012 	j	8000048 <_data-0x77ffffb8>
     314:	0000124d 	break	0x0,0x49
     318:	12590b00 	beq	s2,t9,2f1c <_data-0x7fffd0e4>
     31c:	4d0b0000 	0x4d0b0000
     320:	0b000012 	j	c000048 <_data-0x73ffffb8>
     324:	0000124d 	break	0x0,0x49
     328:	00124d0b 	0x124d0b
     32c:	124d0b00 	beq	s2,t5,2f30 <_data-0x7fffd0d0>
     330:	4d0b0000 	0x4d0b0000
     334:	0b000012 	j	c000048 <_data-0x73ffffb8>
     338:	0000124d 	break	0x0,0x49
     33c:	00124d0b 	0x124d0b
     340:	124d0b00 	beq	s2,t5,2f44 <_data-0x7fffd0bc>
     344:	4d0b0000 	0x4d0b0000
     348:	0b000012 	j	c000048 <_data-0x73ffffb8>
     34c:	0000124d 	break	0x0,0x49
     350:	00124d0b 	0x124d0b
     354:	124d0b00 	beq	s2,t5,2f58 <_data-0x7fffd0a8>
     358:	4d0b0000 	0x4d0b0000
     35c:	00000012 	mflo	zero
     360:	00045608 	0x45608
     364:	13670100 	beq	k1,a3,768 <_data-0x7ffff898>
     368:	0b000014 	j	c000050 <_data-0x73ffffb0>
     36c:	09000004 	j	4000010 <_data-0x7bfffff0>
     370:	00000153 	0x153
     374:	000003bf 	0x3bf
     378:	00124d0a 	0x124d0a
     37c:	124d0a00 	beq	s2,t5,2b80 <_data-0x7fffd480>
     380:	4d0a0000 	0x4d0a0000
     384:	0a000012 	j	8000048 <_data-0x77ffffb8>
     388:	0000124d 	break	0x0,0x49
     38c:	00124d0a 	0x124d0a
     390:	124d0a00 	beq	s2,t5,2b94 <_data-0x7fffd46c>
     394:	4d0a0000 	0x4d0a0000
     398:	0a000012 	j	8000048 <_data-0x77ffffb8>
     39c:	0000124d 	break	0x0,0x49
     3a0:	00124d0a 	0x124d0a
     3a4:	124d0a00 	beq	s2,t5,2ba8 <_data-0x7fffd458>
     3a8:	4d0a0000 	0x4d0a0000
     3ac:	0a000012 	j	8000048 <_data-0x77ffffb8>
     3b0:	0000124d 	break	0x0,0x49
     3b4:	00124d0a 	0x124d0a
     3b8:	124d0a00 	beq	s2,t5,2bbc <_data-0x7fffd444>
     3bc:	0b000000 	j	c000000 <_data-0x74000000>
     3c0:	00001259 	0x1259
     3c4:	00124d0b 	0x124d0b
     3c8:	124d0b00 	beq	s2,t5,2fcc <_data-0x7fffd034>
     3cc:	4d0b0000 	0x4d0b0000
     3d0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     3d4:	0000124d 	break	0x0,0x49
     3d8:	00124d0b 	0x124d0b
     3dc:	124d0b00 	beq	s2,t5,2fe0 <_data-0x7fffd020>
     3e0:	4d0b0000 	0x4d0b0000
     3e4:	0b000012 	j	c000048 <_data-0x73ffffb8>
     3e8:	0000124d 	break	0x0,0x49
     3ec:	00124d0b 	0x124d0b
     3f0:	124d0b00 	beq	s2,t5,2ff4 <_data-0x7fffd00c>
     3f4:	4d0b0000 	0x4d0b0000
     3f8:	0b000012 	j	c000048 <_data-0x73ffffb8>
     3fc:	0000124d 	break	0x0,0x49
     400:	00124d0b 	0x124d0b
     404:	124d0b00 	beq	s2,t5,3008 <_data-0x7fffcff8>
     408:	08000000 	j	0 <_data-0x80000000>
     40c:	0000102d 	0x102d
     410:	11436701 	beq	t2,v1,1a018 <_data-0x7ffe5fe8>
     414:	04340000 	0x4340000
     418:	53090000 	beql	t8,t1,41c <_data-0x7ffffbe4>
     41c:	29000001 	slti	zero,t0,1
     420:	0a000004 	j	8000010 <_data-0x77fffff0>
     424:	0000124d 	break	0x0,0x49
     428:	12590b00 	beq	s2,t9,302c <_data-0x7fffcfd4>
     42c:	4d0b0000 	0x4d0b0000
     430:	00000012 	mflo	zero
     434:	00005308 	0x5308
     438:	be670100 	cache	0x7,256(s3)
     43c:	e9000001 	swc2	$0,1(t0)
     440:	09000004 	j	4000010 <_data-0x7bfffff0>
     444:	00000153 	0x153
     448:	00000498 	0x498
     44c:	00124d0a 	0x124d0a
     450:	124d0a00 	beq	s2,t5,2c54 <_data-0x7fffd3ac>
     454:	4d0a0000 	0x4d0a0000
     458:	0a000012 	j	8000048 <_data-0x77ffffb8>
     45c:	0000124d 	break	0x0,0x49
     460:	00124d0a 	0x124d0a
     464:	124d0a00 	beq	s2,t5,2c68 <_data-0x7fffd398>
     468:	4d0a0000 	0x4d0a0000
     46c:	0a000012 	j	8000048 <_data-0x77ffffb8>
     470:	0000124d 	break	0x0,0x49
     474:	00124d0a 	0x124d0a
     478:	124d0a00 	beq	s2,t5,2c7c <_data-0x7fffd384>
     47c:	4d0a0000 	0x4d0a0000
     480:	0a000012 	j	8000048 <_data-0x77ffffb8>
     484:	0000124d 	break	0x0,0x49
     488:	00124d0a 	0x124d0a
     48c:	124d0a00 	beq	s2,t5,2c90 <_data-0x7fffd370>
     490:	4d0a0000 	0x4d0a0000
     494:	00000012 	mflo	zero
     498:	0012590b 	0x12590b
     49c:	124d0b00 	beq	s2,t5,30a0 <_data-0x7fffcf60>
     4a0:	4d0b0000 	0x4d0b0000
     4a4:	0b000012 	j	c000048 <_data-0x73ffffb8>
     4a8:	0000124d 	break	0x0,0x49
     4ac:	00124d0b 	0x124d0b
     4b0:	124d0b00 	beq	s2,t5,30b4 <_data-0x7fffcf4c>
     4b4:	4d0b0000 	0x4d0b0000
     4b8:	0b000012 	j	c000048 <_data-0x73ffffb8>
     4bc:	0000124d 	break	0x0,0x49
     4c0:	00124d0b 	0x124d0b
     4c4:	124d0b00 	beq	s2,t5,30c8 <_data-0x7fffcf38>
     4c8:	4d0b0000 	0x4d0b0000
     4cc:	0b000012 	j	c000048 <_data-0x73ffffb8>
     4d0:	0000124d 	break	0x0,0x49
     4d4:	00124d0b 	0x124d0b
     4d8:	124d0b00 	beq	s2,t5,30dc <_data-0x7fffcf24>
     4dc:	4d0b0000 	0x4d0b0000
     4e0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     4e4:	0000124d 	break	0x0,0x49
     4e8:	07600800 	bltz	k1,24ec <_data-0x7fffdb14>
     4ec:	67010000 	0x67010000
     4f0:	000006f0 	tge	zero,zero,0x1b
     4f4:	0000051c 	0x51c
     4f8:	00015309 	0x15309
     4fc:	00050c00 	sll	at,a1,0x10
     500:	124d0a00 	beq	s2,t5,2d04 <_data-0x7fffd2fc>
     504:	4d0a0000 	0x4d0a0000
     508:	00000012 	mflo	zero
     50c:	0012590b 	0x12590b
     510:	124d0b00 	beq	s2,t5,3114 <_data-0x7fffceec>
     514:	4d0b0000 	0x4d0b0000
     518:	00000012 	mflo	zero
     51c:	000b7f08 	0xb7f08
     520:	6b670100 	0x6b670100
     524:	db000001 	ldc2	$0,1(t8)
     528:	09000005 	j	4000014 <_data-0x7bffffec>
     52c:	00000153 	0x153
     530:	00000585 	0x585
     534:	00124d0a 	0x124d0a
     538:	124d0a00 	beq	s2,t5,2d3c <_data-0x7fffd2c4>
     53c:	4d0a0000 	0x4d0a0000
     540:	0a000012 	j	8000048 <_data-0x77ffffb8>
     544:	0000124d 	break	0x0,0x49
     548:	00124d0a 	0x124d0a
     54c:	124d0a00 	beq	s2,t5,2d50 <_data-0x7fffd2b0>
     550:	4d0a0000 	0x4d0a0000
     554:	0a000012 	j	8000048 <_data-0x77ffffb8>
     558:	0000124d 	break	0x0,0x49
     55c:	00124d0a 	0x124d0a
     560:	124d0a00 	beq	s2,t5,2d64 <_data-0x7fffd29c>
     564:	4d0a0000 	0x4d0a0000
     568:	0a000012 	j	8000048 <_data-0x77ffffb8>
     56c:	0000124d 	break	0x0,0x49
     570:	00124d0a 	0x124d0a
     574:	124d0a00 	beq	s2,t5,2d78 <_data-0x7fffd288>
     578:	4d0a0000 	0x4d0a0000
     57c:	0a000012 	j	8000048 <_data-0x77ffffb8>
     580:	0000124d 	break	0x0,0x49
     584:	12590b00 	beq	s2,t9,3188 <_data-0x7fffce78>
     588:	4d0b0000 	0x4d0b0000
     58c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     590:	0000124d 	break	0x0,0x49
     594:	00124d0b 	0x124d0b
     598:	124d0b00 	beq	s2,t5,319c <_data-0x7fffce64>
     59c:	4d0b0000 	0x4d0b0000
     5a0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     5a4:	0000124d 	break	0x0,0x49
     5a8:	00124d0b 	0x124d0b
     5ac:	124d0b00 	beq	s2,t5,31b0 <_data-0x7fffce50>
     5b0:	4d0b0000 	0x4d0b0000
     5b4:	0b000012 	j	c000048 <_data-0x73ffffb8>
     5b8:	0000124d 	break	0x0,0x49
     5bc:	00124d0b 	0x124d0b
     5c0:	124d0b00 	beq	s2,t5,31c4 <_data-0x7fffce3c>
     5c4:	4d0b0000 	0x4d0b0000
     5c8:	0b000012 	j	c000048 <_data-0x73ffffb8>
     5cc:	0000124d 	break	0x0,0x49
     5d0:	00124d0b 	0x124d0b
     5d4:	124d0b00 	beq	s2,t5,31d8 <_data-0x7fffce28>
     5d8:	08000000 	j	0 <_data-0x80000000>
     5dc:	000010b5 	0x10b5
     5e0:	0af76701 	j	bdd9c04 <_data-0x742263fc>
     5e4:	06180000 	0x6180000
     5e8:	53090000 	beql	t8,t1,5ec <_data-0x7ffffa14>
     5ec:	03000001 	movf	zero,t8,$fcc0
     5f0:	0a000006 	j	8000018 <_data-0x77ffffe8>
     5f4:	0000124d 	break	0x0,0x49
     5f8:	00124d0a 	0x124d0a
     5fc:	124d0a00 	beq	s2,t5,2e00 <_data-0x7fffd200>
     600:	0b000000 	j	c000000 <_data-0x74000000>
     604:	00001259 	0x1259
     608:	00124d0b 	0x124d0b
     60c:	124d0b00 	beq	s2,t5,3210 <_data-0x7fffcdf0>
     610:	4d0b0000 	0x4d0b0000
     614:	00000012 	mflo	zero
     618:	000ebe08 	0xebe08
     61c:	19670100 	0x19670100
     620:	e1000015 	sc	zero,21(t0)
     624:	09000006 	j	4000018 <_data-0x7bffffe8>
     628:	00000153 	0x153
     62c:	00000686 	0x686
     630:	00124d0a 	0x124d0a
     634:	124d0a00 	beq	s2,t5,2e38 <_data-0x7fffd1c8>
     638:	4d0a0000 	0x4d0a0000
     63c:	0a000012 	j	8000048 <_data-0x77ffffb8>
     640:	0000124d 	break	0x0,0x49
     644:	00124d0a 	0x124d0a
     648:	124d0a00 	beq	s2,t5,2e4c <_data-0x7fffd1b4>
     64c:	4d0a0000 	0x4d0a0000
     650:	0a000012 	j	8000048 <_data-0x77ffffb8>
     654:	0000124d 	break	0x0,0x49
     658:	00124d0a 	0x124d0a
     65c:	124d0a00 	beq	s2,t5,2e60 <_data-0x7fffd1a0>
     660:	4d0a0000 	0x4d0a0000
     664:	0a000012 	j	8000048 <_data-0x77ffffb8>
     668:	0000124d 	break	0x0,0x49
     66c:	00124d0a 	0x124d0a
     670:	124d0a00 	beq	s2,t5,2e74 <_data-0x7fffd18c>
     674:	4d0a0000 	0x4d0a0000
     678:	0a000012 	j	8000048 <_data-0x77ffffb8>
     67c:	0000124d 	break	0x0,0x49
     680:	00124d0a 	0x124d0a
     684:	590b0000 	0x590b0000
     688:	0b000012 	j	c000048 <_data-0x73ffffb8>
     68c:	0000124d 	break	0x0,0x49
     690:	00124d0b 	0x124d0b
     694:	124d0b00 	beq	s2,t5,3298 <_data-0x7fffcd68>
     698:	4d0b0000 	0x4d0b0000
     69c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     6a0:	0000124d 	break	0x0,0x49
     6a4:	00124d0b 	0x124d0b
     6a8:	124d0b00 	beq	s2,t5,32ac <_data-0x7fffcd54>
     6ac:	4d0b0000 	0x4d0b0000
     6b0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     6b4:	0000124d 	break	0x0,0x49
     6b8:	00124d0b 	0x124d0b
     6bc:	124d0b00 	beq	s2,t5,32c0 <_data-0x7fffcd40>
     6c0:	4d0b0000 	0x4d0b0000
     6c4:	0b000012 	j	c000048 <_data-0x73ffffb8>
     6c8:	0000124d 	break	0x0,0x49
     6cc:	00124d0b 	0x124d0b
     6d0:	124d0b00 	beq	s2,t5,32d4 <_data-0x7fffcd2c>
     6d4:	4d0b0000 	0x4d0b0000
     6d8:	0b000012 	j	c000048 <_data-0x73ffffb8>
     6dc:	0000124d 	break	0x0,0x49
     6e0:	02d10800 	0x2d10800
     6e4:	67010000 	0x67010000
     6e8:	0000093a 	0x93a
     6ec:	00000728 	0x728
     6f0:	00015309 	0x15309
     6f4:	00070e00 	sll	at,a3,0x18
     6f8:	124d0a00 	beq	s2,t5,2efc <_data-0x7fffd104>
     6fc:	4d0a0000 	0x4d0a0000
     700:	0a000012 	j	8000048 <_data-0x77ffffb8>
     704:	0000124d 	break	0x0,0x49
     708:	00124d0a 	0x124d0a
     70c:	590b0000 	0x590b0000
     710:	0b000012 	j	c000048 <_data-0x73ffffb8>
     714:	0000124d 	break	0x0,0x49
     718:	00124d0b 	0x124d0b
     71c:	124d0b00 	beq	s2,t5,3320 <_data-0x7fffcce0>
     720:	4d0b0000 	0x4d0b0000
     724:	00000012 	mflo	zero
     728:	00066d08 	0x66d08
     72c:	d9670100 	ldc2	$7,256(t3)
     730:	fb000014 	sdc2	$0,20(t8)
     734:	09000007 	j	400001c <_data-0x7bffffe4>
     738:	00000153 	0x153
     73c:	0000079b 	0x79b
     740:	00124d0a 	0x124d0a
     744:	124d0a00 	beq	s2,t5,2f48 <_data-0x7fffd0b8>
     748:	4d0a0000 	0x4d0a0000
     74c:	0a000012 	j	8000048 <_data-0x77ffffb8>
     750:	0000124d 	break	0x0,0x49
     754:	00124d0a 	0x124d0a
     758:	124d0a00 	beq	s2,t5,2f5c <_data-0x7fffd0a4>
     75c:	4d0a0000 	0x4d0a0000
     760:	0a000012 	j	8000048 <_data-0x77ffffb8>
     764:	0000124d 	break	0x0,0x49
     768:	00124d0a 	0x124d0a
     76c:	124d0a00 	beq	s2,t5,2f70 <_data-0x7fffd090>
     770:	4d0a0000 	0x4d0a0000
     774:	0a000012 	j	8000048 <_data-0x77ffffb8>
     778:	0000124d 	break	0x0,0x49
     77c:	00124d0a 	0x124d0a
     780:	124d0a00 	beq	s2,t5,2f84 <_data-0x7fffd07c>
     784:	4d0a0000 	0x4d0a0000
     788:	0a000012 	j	8000048 <_data-0x77ffffb8>
     78c:	0000124d 	break	0x0,0x49
     790:	00124d0a 	0x124d0a
     794:	124d0a00 	beq	s2,t5,2f98 <_data-0x7fffd068>
     798:	0b000000 	j	c000000 <_data-0x74000000>
     79c:	00001259 	0x1259
     7a0:	00124d0b 	0x124d0b
     7a4:	124d0b00 	beq	s2,t5,33a8 <_data-0x7fffcc58>
     7a8:	4d0b0000 	0x4d0b0000
     7ac:	0b000012 	j	c000048 <_data-0x73ffffb8>
     7b0:	0000124d 	break	0x0,0x49
     7b4:	00124d0b 	0x124d0b
     7b8:	124d0b00 	beq	s2,t5,33bc <_data-0x7fffcc44>
     7bc:	4d0b0000 	0x4d0b0000
     7c0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     7c4:	0000124d 	break	0x0,0x49
     7c8:	00124d0b 	0x124d0b
     7cc:	124d0b00 	beq	s2,t5,33d0 <_data-0x7fffcc30>
     7d0:	4d0b0000 	0x4d0b0000
     7d4:	0b000012 	j	c000048 <_data-0x73ffffb8>
     7d8:	0000124d 	break	0x0,0x49
     7dc:	00124d0b 	0x124d0b
     7e0:	124d0b00 	beq	s2,t5,33e4 <_data-0x7fffcc1c>
     7e4:	4d0b0000 	0x4d0b0000
     7e8:	0b000012 	j	c000048 <_data-0x73ffffb8>
     7ec:	0000124d 	break	0x0,0x49
     7f0:	00124d0b 	0x124d0b
     7f4:	124d0b00 	beq	s2,t5,33f8 <_data-0x7fffcc08>
     7f8:	08000000 	j	0 <_data-0x80000000>
     7fc:	0000029c 	0x29c
     800:	0f3b6701 	jal	ced9c04 <_data-0x731263fc>
     804:	084c0000 	j	1300000 <_data-0x7ed00000>
     808:	53090000 	beql	t8,t1,80c <_data-0x7ffff7f4>
     80c:	2d000001 	sltiu	zero,t0,1
     810:	0a000008 	j	8000020 <_data-0x77ffffe0>
     814:	0000124d 	break	0x0,0x49
     818:	00124d0a 	0x124d0a
     81c:	124d0a00 	beq	s2,t5,3020 <_data-0x7fffcfe0>
     820:	4d0a0000 	0x4d0a0000
     824:	0a000012 	j	8000048 <_data-0x77ffffb8>
     828:	0000124d 	break	0x0,0x49
     82c:	12590b00 	beq	s2,t9,3430 <_data-0x7fffcbd0>
     830:	4d0b0000 	0x4d0b0000
     834:	0b000012 	j	c000048 <_data-0x73ffffb8>
     838:	0000124d 	break	0x0,0x49
     83c:	00124d0b 	0x124d0b
     840:	124d0b00 	beq	s2,t5,3444 <_data-0x7fffcbbc>
     844:	4d0b0000 	0x4d0b0000
     848:	00000012 	mflo	zero
     84c:	00058108 	0x58108
     850:	db670100 	ldc2	$7,256(k1)
     854:	2900000d 	slti	zero,t0,13
     858:	09000009 	j	4000024 <_data-0x7bffffdc>
     85c:	00000153 	0x153
     860:	000008c4 	0x8c4
     864:	00124d0a 	0x124d0a
     868:	124d0a00 	beq	s2,t5,306c <_data-0x7fffcf94>
     86c:	4d0a0000 	0x4d0a0000
     870:	0a000012 	j	8000048 <_data-0x77ffffb8>
     874:	0000124d 	break	0x0,0x49
     878:	00124d0a 	0x124d0a
     87c:	124d0a00 	beq	s2,t5,3080 <_data-0x7fffcf80>
     880:	4d0a0000 	0x4d0a0000
     884:	0a000012 	j	8000048 <_data-0x77ffffb8>
     888:	0000124d 	break	0x0,0x49
     88c:	00124d0a 	0x124d0a
     890:	124d0a00 	beq	s2,t5,3094 <_data-0x7fffcf6c>
     894:	4d0a0000 	0x4d0a0000
     898:	0a000012 	j	8000048 <_data-0x77ffffb8>
     89c:	0000124d 	break	0x0,0x49
     8a0:	00124d0a 	0x124d0a
     8a4:	124d0a00 	beq	s2,t5,30a8 <_data-0x7fffcf58>
     8a8:	4d0a0000 	0x4d0a0000
     8ac:	0a000012 	j	8000048 <_data-0x77ffffb8>
     8b0:	0000124d 	break	0x0,0x49
     8b4:	00124d0a 	0x124d0a
     8b8:	124d0a00 	beq	s2,t5,30bc <_data-0x7fffcf44>
     8bc:	4d0a0000 	0x4d0a0000
     8c0:	00000012 	mflo	zero
     8c4:	0012590b 	0x12590b
     8c8:	124d0b00 	beq	s2,t5,34cc <_data-0x7fffcb34>
     8cc:	4d0b0000 	0x4d0b0000
     8d0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     8d4:	0000124d 	break	0x0,0x49
     8d8:	00124d0b 	0x124d0b
     8dc:	124d0b00 	beq	s2,t5,34e0 <_data-0x7fffcb20>
     8e0:	4d0b0000 	0x4d0b0000
     8e4:	0b000012 	j	c000048 <_data-0x73ffffb8>
     8e8:	0000124d 	break	0x0,0x49
     8ec:	00124d0b 	0x124d0b
     8f0:	124d0b00 	beq	s2,t5,34f4 <_data-0x7fffcb0c>
     8f4:	4d0b0000 	0x4d0b0000
     8f8:	0b000012 	j	c000048 <_data-0x73ffffb8>
     8fc:	0000124d 	break	0x0,0x49
     900:	00124d0b 	0x124d0b
     904:	124d0b00 	beq	s2,t5,3508 <_data-0x7fffcaf8>
     908:	4d0b0000 	0x4d0b0000
     90c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     910:	0000124d 	break	0x0,0x49
     914:	00124d0b 	0x124d0b
     918:	124d0b00 	beq	s2,t5,351c <_data-0x7fffcae4>
     91c:	4d0b0000 	0x4d0b0000
     920:	0b000012 	j	c000048 <_data-0x73ffffb8>
     924:	0000124d 	break	0x0,0x49
     928:	13d10800 	beq	s8,s1,292c <_data-0x7fffd6d4>
     92c:	67010000 	0x67010000
     930:	000003a6 	0x3a6
     934:	00000984 	0x984
     938:	00015309 	0x15309
     93c:	00096000 	sll	t4,t1,0x0
     940:	124d0a00 	beq	s2,t5,3144 <_data-0x7fffcebc>
     944:	4d0a0000 	0x4d0a0000
     948:	0a000012 	j	8000048 <_data-0x77ffffb8>
     94c:	0000124d 	break	0x0,0x49
     950:	00124d0a 	0x124d0a
     954:	124d0a00 	beq	s2,t5,3158 <_data-0x7fffcea8>
     958:	4d0a0000 	0x4d0a0000
     95c:	00000012 	mflo	zero
     960:	0012590b 	0x12590b
     964:	124d0b00 	beq	s2,t5,3568 <_data-0x7fffca98>
     968:	4d0b0000 	0x4d0b0000
     96c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     970:	0000124d 	break	0x0,0x49
     974:	00124d0b 	0x124d0b
     978:	124d0b00 	beq	s2,t5,357c <_data-0x7fffca84>
     97c:	4d0b0000 	0x4d0b0000
     980:	00000012 	mflo	zero
     984:	0000c408 	0xc408
     988:	35670100 	ori	a3,t3,0x100
     98c:	6b000003 	0x6b000003
     990:	0900000a 	j	4000028 <_data-0x7bffffd8>
     994:	00000153 	0x153
     998:	00000a01 	0xa01
     99c:	00124d0a 	0x124d0a
     9a0:	124d0a00 	beq	s2,t5,31a4 <_data-0x7fffce5c>
     9a4:	4d0a0000 	0x4d0a0000
     9a8:	0a000012 	j	8000048 <_data-0x77ffffb8>
     9ac:	0000124d 	break	0x0,0x49
     9b0:	00124d0a 	0x124d0a
     9b4:	124d0a00 	beq	s2,t5,31b8 <_data-0x7fffce48>
     9b8:	4d0a0000 	0x4d0a0000
     9bc:	0a000012 	j	8000048 <_data-0x77ffffb8>
     9c0:	0000124d 	break	0x0,0x49
     9c4:	00124d0a 	0x124d0a
     9c8:	124d0a00 	beq	s2,t5,31cc <_data-0x7fffce34>
     9cc:	4d0a0000 	0x4d0a0000
     9d0:	0a000012 	j	8000048 <_data-0x77ffffb8>
     9d4:	0000124d 	break	0x0,0x49
     9d8:	00124d0a 	0x124d0a
     9dc:	124d0a00 	beq	s2,t5,31e0 <_data-0x7fffce20>
     9e0:	4d0a0000 	0x4d0a0000
     9e4:	0a000012 	j	8000048 <_data-0x77ffffb8>
     9e8:	0000124d 	break	0x0,0x49
     9ec:	00124d0a 	0x124d0a
     9f0:	124d0a00 	beq	s2,t5,31f4 <_data-0x7fffce0c>
     9f4:	4d0a0000 	0x4d0a0000
     9f8:	0a000012 	j	8000048 <_data-0x77ffffb8>
     9fc:	0000124d 	break	0x0,0x49
     a00:	12590b00 	beq	s2,t9,3604 <_data-0x7fffc9fc>
     a04:	4d0b0000 	0x4d0b0000
     a08:	0b000012 	j	c000048 <_data-0x73ffffb8>
     a0c:	0000124d 	break	0x0,0x49
     a10:	00124d0b 	0x124d0b
     a14:	124d0b00 	beq	s2,t5,3618 <_data-0x7fffc9e8>
     a18:	4d0b0000 	0x4d0b0000
     a1c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     a20:	0000124d 	break	0x0,0x49
     a24:	00124d0b 	0x124d0b
     a28:	124d0b00 	beq	s2,t5,362c <_data-0x7fffc9d4>
     a2c:	4d0b0000 	0x4d0b0000
     a30:	0b000012 	j	c000048 <_data-0x73ffffb8>
     a34:	0000124d 	break	0x0,0x49
     a38:	00124d0b 	0x124d0b
     a3c:	124d0b00 	beq	s2,t5,3640 <_data-0x7fffc9c0>
     a40:	4d0b0000 	0x4d0b0000
     a44:	0b000012 	j	c000048 <_data-0x73ffffb8>
     a48:	0000124d 	break	0x0,0x49
     a4c:	00124d0b 	0x124d0b
     a50:	124d0b00 	beq	s2,t5,3654 <_data-0x7fffc9ac>
     a54:	4d0b0000 	0x4d0b0000
     a58:	0b000012 	j	c000048 <_data-0x73ffffb8>
     a5c:	0000124d 	break	0x0,0x49
     a60:	00124d0b 	0x124d0b
     a64:	124d0b00 	beq	s2,t5,3668 <_data-0x7fffc998>
     a68:	08000000 	j	0 <_data-0x80000000>
     a6c:	00000e71 	tgeu	zero,zero,0x39
     a70:	096c6701 	j	5b19c04 <_data-0x7a4e63fc>
     a74:	0ae40000 	j	b900000 <_data-0x74700000>
     a78:	53090000 	beql	t8,t1,a7c <_data-0x7ffff584>
     a7c:	b1000001 	0xb1000001
     a80:	0a00000a 	j	8000028 <_data-0x77ffffd8>
     a84:	0000124d 	break	0x0,0x49
     a88:	00124d0a 	0x124d0a
     a8c:	124d0a00 	beq	s2,t5,3290 <_data-0x7fffcd70>
     a90:	4d0a0000 	0x4d0a0000
     a94:	0a000012 	j	8000048 <_data-0x77ffffb8>
     a98:	0000124d 	break	0x0,0x49
     a9c:	00124d0a 	0x124d0a
     aa0:	124d0a00 	beq	s2,t5,32a4 <_data-0x7fffcd5c>
     aa4:	4d0a0000 	0x4d0a0000
     aa8:	0a000012 	j	8000048 <_data-0x77ffffb8>
     aac:	0000124d 	break	0x0,0x49
     ab0:	12590b00 	beq	s2,t9,36b4 <_data-0x7fffc94c>
     ab4:	4d0b0000 	0x4d0b0000
     ab8:	0b000012 	j	c000048 <_data-0x73ffffb8>
     abc:	0000124d 	break	0x0,0x49
     ac0:	00124d0b 	0x124d0b
     ac4:	124d0b00 	beq	s2,t5,36c8 <_data-0x7fffc938>
     ac8:	4d0b0000 	0x4d0b0000
     acc:	0b000012 	j	c000048 <_data-0x73ffffb8>
     ad0:	0000124d 	break	0x0,0x49
     ad4:	00124d0b 	0x124d0b
     ad8:	124d0b00 	beq	s2,t5,36dc <_data-0x7fffc924>
     adc:	4d0b0000 	0x4d0b0000
     ae0:	00000012 	mflo	zero
     ae4:	000e3008 	0xe3008
     ae8:	00670100 	0x670100
     aec:	49000003 	bc2f	afc <_data-0x7ffff504>
     af0:	0900000b 	j	400002c <_data-0x7bffffd4>
     af4:	00000153 	0x153
     af8:	00000b20 	0xb20
     afc:	00124d0a 	0x124d0a
     b00:	124d0a00 	beq	s2,t5,3304 <_data-0x7fffccfc>
     b04:	4d0a0000 	0x4d0a0000
     b08:	0a000012 	j	8000048 <_data-0x77ffffb8>
     b0c:	0000124d 	break	0x0,0x49
     b10:	00124d0a 	0x124d0a
     b14:	124d0a00 	beq	s2,t5,3318 <_data-0x7fffcce8>
     b18:	4d0a0000 	0x4d0a0000
     b1c:	00000012 	mflo	zero
     b20:	0012590b 	0x12590b
     b24:	124d0b00 	beq	s2,t5,3728 <_data-0x7fffc8d8>
     b28:	4d0b0000 	0x4d0b0000
     b2c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     b30:	0000124d 	break	0x0,0x49
     b34:	00124d0b 	0x124d0b
     b38:	124d0b00 	beq	s2,t5,373c <_data-0x7fffc8c4>
     b3c:	4d0b0000 	0x4d0b0000
     b40:	0b000012 	j	c000048 <_data-0x73ffffb8>
     b44:	0000124d 	break	0x0,0x49
     b48:	12e80800 	beq	s7,t0,2b4c <_data-0x7fffd4b4>
     b4c:	67010000 	0x67010000
     b50:	00001496 	0x1496
     b54:	00000c3a 	0xc3a
     b58:	00015309 	0x15309
     b5c:	000bcb00 	sll	t9,t3,0xc
     b60:	124d0a00 	beq	s2,t5,3364 <_data-0x7fffcc9c>
     b64:	4d0a0000 	0x4d0a0000
     b68:	0a000012 	j	8000048 <_data-0x77ffffb8>
     b6c:	0000124d 	break	0x0,0x49
     b70:	00124d0a 	0x124d0a
     b74:	124d0a00 	beq	s2,t5,3378 <_data-0x7fffcc88>
     b78:	4d0a0000 	0x4d0a0000
     b7c:	0a000012 	j	8000048 <_data-0x77ffffb8>
     b80:	0000124d 	break	0x0,0x49
     b84:	00124d0a 	0x124d0a
     b88:	124d0a00 	beq	s2,t5,338c <_data-0x7fffcc74>
     b8c:	4d0a0000 	0x4d0a0000
     b90:	0a000012 	j	8000048 <_data-0x77ffffb8>
     b94:	0000124d 	break	0x0,0x49
     b98:	00124d0a 	0x124d0a
     b9c:	124d0a00 	beq	s2,t5,33a0 <_data-0x7fffcc60>
     ba0:	4d0a0000 	0x4d0a0000
     ba4:	0a000012 	j	8000048 <_data-0x77ffffb8>
     ba8:	0000124d 	break	0x0,0x49
     bac:	00124d0a 	0x124d0a
     bb0:	124d0a00 	beq	s2,t5,33b4 <_data-0x7fffcc4c>
     bb4:	4d0a0000 	0x4d0a0000
     bb8:	0a000012 	j	8000048 <_data-0x77ffffb8>
     bbc:	0000124d 	break	0x0,0x49
     bc0:	00124d0a 	0x124d0a
     bc4:	124d0a00 	beq	s2,t5,33c8 <_data-0x7fffcc38>
     bc8:	0b000000 	j	c000000 <_data-0x74000000>
     bcc:	00001259 	0x1259
     bd0:	00124d0b 	0x124d0b
     bd4:	124d0b00 	beq	s2,t5,37d8 <_data-0x7fffc828>
     bd8:	4d0b0000 	0x4d0b0000
     bdc:	0b000012 	j	c000048 <_data-0x73ffffb8>
     be0:	0000124d 	break	0x0,0x49
     be4:	00124d0b 	0x124d0b
     be8:	124d0b00 	beq	s2,t5,37ec <_data-0x7fffc814>
     bec:	4d0b0000 	0x4d0b0000
     bf0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     bf4:	0000124d 	break	0x0,0x49
     bf8:	00124d0b 	0x124d0b
     bfc:	124d0b00 	beq	s2,t5,3800 <_data-0x7fffc800>
     c00:	4d0b0000 	0x4d0b0000
     c04:	0b000012 	j	c000048 <_data-0x73ffffb8>
     c08:	0000124d 	break	0x0,0x49
     c0c:	00124d0b 	0x124d0b
     c10:	124d0b00 	beq	s2,t5,3814 <_data-0x7fffc7ec>
     c14:	4d0b0000 	0x4d0b0000
     c18:	0b000012 	j	c000048 <_data-0x73ffffb8>
     c1c:	0000124d 	break	0x0,0x49
     c20:	00124d0b 	0x124d0b
     c24:	124d0b00 	beq	s2,t5,3828 <_data-0x7fffc7d8>
     c28:	4d0b0000 	0x4d0b0000
     c2c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     c30:	0000124d 	break	0x0,0x49
     c34:	00124d0b 	0x124d0b
     c38:	5c080000 	0x5c080000
     c3c:	01000010 	0x1000010
     c40:	000bf667 	0xbf667
     c44:	000cc700 	sll	t8,t4,0x1c
     c48:	01530900 	0x1530900
     c4c:	0c8a0000 	jal	2280000 <_data-0x7dd80000>
     c50:	4d0a0000 	0x4d0a0000
     c54:	0a000012 	j	8000048 <_data-0x77ffffb8>
     c58:	0000124d 	break	0x0,0x49
     c5c:	00124d0a 	0x124d0a
     c60:	124d0a00 	beq	s2,t5,3464 <_data-0x7fffcb9c>
     c64:	4d0a0000 	0x4d0a0000
     c68:	0a000012 	j	8000048 <_data-0x77ffffb8>
     c6c:	0000124d 	break	0x0,0x49
     c70:	00124d0a 	0x124d0a
     c74:	124d0a00 	beq	s2,t5,3478 <_data-0x7fffcb88>
     c78:	4d0a0000 	0x4d0a0000
     c7c:	0a000012 	j	8000048 <_data-0x77ffffb8>
     c80:	0000124d 	break	0x0,0x49
     c84:	00124d0a 	0x124d0a
     c88:	590b0000 	0x590b0000
     c8c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     c90:	0000124d 	break	0x0,0x49
     c94:	00124d0b 	0x124d0b
     c98:	124d0b00 	beq	s2,t5,389c <_data-0x7fffc764>
     c9c:	4d0b0000 	0x4d0b0000
     ca0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     ca4:	0000124d 	break	0x0,0x49
     ca8:	00124d0b 	0x124d0b
     cac:	124d0b00 	beq	s2,t5,38b0 <_data-0x7fffc750>
     cb0:	4d0b0000 	0x4d0b0000
     cb4:	0b000012 	j	c000048 <_data-0x73ffffb8>
     cb8:	0000124d 	break	0x0,0x49
     cbc:	00124d0b 	0x124d0b
     cc0:	124d0b00 	beq	s2,t5,38c4 <_data-0x7fffc73c>
     cc4:	08000000 	j	0 <_data-0x80000000>
     cc8:	00000000 	nop
     ccc:	03da6701 	0x3da6701
     cd0:	0d4a0000 	jal	5280000 <_data-0x7ad80000>
     cd4:	53090000 	beql	t8,t1,cd8 <_data-0x7ffff328>
     cd8:	12000001 	beqz	s0,ce0 <_data-0x7ffff320>
     cdc:	0a00000d 	j	8000034 <_data-0x77ffffcc>
     ce0:	0000124d 	break	0x0,0x49
     ce4:	00124d0a 	0x124d0a
     ce8:	124d0a00 	beq	s2,t5,34ec <_data-0x7fffcb14>
     cec:	4d0a0000 	0x4d0a0000
     cf0:	0a000012 	j	8000048 <_data-0x77ffffb8>
     cf4:	0000124d 	break	0x0,0x49
     cf8:	00124d0a 	0x124d0a
     cfc:	124d0a00 	beq	s2,t5,3500 <_data-0x7fffcb00>
     d00:	4d0a0000 	0x4d0a0000
     d04:	0a000012 	j	8000048 <_data-0x77ffffb8>
     d08:	0000124d 	break	0x0,0x49
     d0c:	00124d0a 	0x124d0a
     d10:	590b0000 	0x590b0000
     d14:	0b000012 	j	c000048 <_data-0x73ffffb8>
     d18:	0000124d 	break	0x0,0x49
     d1c:	00124d0b 	0x124d0b
     d20:	124d0b00 	beq	s2,t5,3924 <_data-0x7fffc6dc>
     d24:	4d0b0000 	0x4d0b0000
     d28:	0b000012 	j	c000048 <_data-0x73ffffb8>
     d2c:	0000124d 	break	0x0,0x49
     d30:	00124d0b 	0x124d0b
     d34:	124d0b00 	beq	s2,t5,3938 <_data-0x7fffc6c8>
     d38:	4d0b0000 	0x4d0b0000
     d3c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     d40:	0000124d 	break	0x0,0x49
     d44:	00124d0b 	0x124d0b
     d48:	4f080000 	c3	0x1080000
     d4c:	01000014 	0x1000014
     d50:	00054b67 	0x54b67
     d54:	000db900 	sll	s7,t5,0x4
     d58:	01530900 	0x1530900
     d5c:	0d8b0000 	jal	62c0000 <_data-0x79d40000>
     d60:	4d0a0000 	0x4d0a0000
     d64:	0a000012 	j	8000048 <_data-0x77ffffb8>
     d68:	0000124d 	break	0x0,0x49
     d6c:	00124d0a 	0x124d0a
     d70:	124d0a00 	beq	s2,t5,3574 <_data-0x7fffca8c>
     d74:	4d0a0000 	0x4d0a0000
     d78:	0a000012 	j	8000048 <_data-0x77ffffb8>
     d7c:	0000124d 	break	0x0,0x49
     d80:	00124d0a 	0x124d0a
     d84:	124d0a00 	beq	s2,t5,3588 <_data-0x7fffca78>
     d88:	0b000000 	j	c000000 <_data-0x74000000>
     d8c:	00001259 	0x1259
     d90:	00124d0b 	0x124d0b
     d94:	124d0b00 	beq	s2,t5,3998 <_data-0x7fffc668>
     d98:	4d0b0000 	0x4d0b0000
     d9c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     da0:	0000124d 	break	0x0,0x49
     da4:	00124d0b 	0x124d0b
     da8:	124d0b00 	beq	s2,t5,39ac <_data-0x7fffc654>
     dac:	4d0b0000 	0x4d0b0000
     db0:	0b000012 	j	c000048 <_data-0x73ffffb8>
     db4:	0000124d 	break	0x0,0x49
     db8:	080e0800 	j	382000 <_data-0x7fc7e000>
     dbc:	67010000 	0x67010000
     dc0:	00000412 	0x412
     dc4:	00000eb4 	teq	zero,zero,0x3a
     dc8:	00015309 	0x15309
     dcc:	000e4000 	sll	t0,t6,0x0
     dd0:	124d0a00 	beq	s2,t5,35d4 <_data-0x7fffca2c>
     dd4:	4d0a0000 	0x4d0a0000
     dd8:	0a000012 	j	8000048 <_data-0x77ffffb8>
     ddc:	0000124d 	break	0x0,0x49
     de0:	00124d0a 	0x124d0a
     de4:	124d0a00 	beq	s2,t5,35e8 <_data-0x7fffca18>
     de8:	4d0a0000 	0x4d0a0000
     dec:	0a000012 	j	8000048 <_data-0x77ffffb8>
     df0:	0000124d 	break	0x0,0x49
     df4:	00124d0a 	0x124d0a
     df8:	124d0a00 	beq	s2,t5,35fc <_data-0x7fffca04>
     dfc:	4d0a0000 	0x4d0a0000
     e00:	0a000012 	j	8000048 <_data-0x77ffffb8>
     e04:	0000124d 	break	0x0,0x49
     e08:	00124d0a 	0x124d0a
     e0c:	124d0a00 	beq	s2,t5,3610 <_data-0x7fffc9f0>
     e10:	4d0a0000 	0x4d0a0000
     e14:	0a000012 	j	8000048 <_data-0x77ffffb8>
     e18:	0000124d 	break	0x0,0x49
     e1c:	00124d0a 	0x124d0a
     e20:	124d0a00 	beq	s2,t5,3624 <_data-0x7fffc9dc>
     e24:	4d0a0000 	0x4d0a0000
     e28:	0a000012 	j	8000048 <_data-0x77ffffb8>
     e2c:	0000124d 	break	0x0,0x49
     e30:	00124d0a 	0x124d0a
     e34:	124d0a00 	beq	s2,t5,3638 <_data-0x7fffc9c8>
     e38:	4d0a0000 	0x4d0a0000
     e3c:	00000012 	mflo	zero
     e40:	0012590b 	0x12590b
     e44:	124d0b00 	beq	s2,t5,3a48 <_data-0x7fffc5b8>
     e48:	4d0b0000 	0x4d0b0000
     e4c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     e50:	0000124d 	break	0x0,0x49
     e54:	00124d0b 	0x124d0b
     e58:	124d0b00 	beq	s2,t5,3a5c <_data-0x7fffc5a4>
     e5c:	4d0b0000 	0x4d0b0000
     e60:	0b000012 	j	c000048 <_data-0x73ffffb8>
     e64:	0000124d 	break	0x0,0x49
     e68:	00124d0b 	0x124d0b
     e6c:	124d0b00 	beq	s2,t5,3a70 <_data-0x7fffc590>
     e70:	4d0b0000 	0x4d0b0000
     e74:	0b000012 	j	c000048 <_data-0x73ffffb8>
     e78:	0000124d 	break	0x0,0x49
     e7c:	00124d0b 	0x124d0b
     e80:	124d0b00 	beq	s2,t5,3a84 <_data-0x7fffc57c>
     e84:	4d0b0000 	0x4d0b0000
     e88:	0b000012 	j	c000048 <_data-0x73ffffb8>
     e8c:	0000124d 	break	0x0,0x49
     e90:	00124d0b 	0x124d0b
     e94:	124d0b00 	beq	s2,t5,3a98 <_data-0x7fffc568>
     e98:	4d0b0000 	0x4d0b0000
     e9c:	0b000012 	j	c000048 <_data-0x73ffffb8>
     ea0:	0000124d 	break	0x0,0x49
     ea4:	00124d0b 	0x124d0b
     ea8:	124d0b00 	beq	s2,t5,3aac <_data-0x7fffc554>
     eac:	4d0b0000 	0x4d0b0000
     eb0:	00000012 	mflo	zero
     eb4:	0008a908 	0x8a908
     eb8:	97670100 	lhu	a3,256(k1)
     ebc:	4b000013 	c2	0x1000013
     ec0:	0900000f 	j	400003c <_data-0x7bffffc4>
     ec4:	00000153 	0x153
     ec8:	00000f09 	0xf09
     ecc:	00124d0a 	0x124d0a
     ed0:	124d0a00 	beq	s2,t5,36d4 <_data-0x7fffc92c>
     ed4:	4d0a0000 	0x4d0a0000
     ed8:	0a000012 	j	8000048 <_data-0x77ffffb8>
     edc:	0000124d 	break	0x0,0x49
     ee0:	00124d0a 	0x124d0a
     ee4:	124d0a00 	beq	s2,t5,36e8 <_data-0x7fffc918>
     ee8:	4d0a0000 	0x4d0a0000
     eec:	0a000012 	j	8000048 <_data-0x77ffffb8>
     ef0:	0000124d 	break	0x0,0x49
     ef4:	00124d0a 	0x124d0a
     ef8:	124d0a00 	beq	s2,t5,36fc <_data-0x7fffc904>
     efc:	4d0a0000 	0x4d0a0000
     f00:	0a000012 	j	8000048 <_data-0x77ffffb8>
     f04:	0000124d 	break	0x0,0x49
     f08:	12590b00 	beq	s2,t9,3b0c <_data-0x7fffc4f4>
     f0c:	4d0b0000 	0x4d0b0000
     f10:	0b000012 	j	c000048 <_data-0x73ffffb8>
     f14:	0000124d 	break	0x0,0x49
     f18:	00124d0b 	0x124d0b
     f1c:	124d0b00 	beq	s2,t5,3b20 <_data-0x7fffc4e0>
     f20:	4d0b0000 	0x4d0b0000
     f24:	0b000012 	j	c000048 <_data-0x73ffffb8>
     f28:	0000124d 	break	0x0,0x49
     f2c:	00124d0b 	0x124d0b
     f30:	124d0b00 	beq	s2,t5,3b34 <_data-0x7fffc4cc>
     f34:	4d0b0000 	0x4d0b0000
     f38:	0b000012 	j	c000048 <_data-0x73ffffb8>
     f3c:	0000124d 	break	0x0,0x49
     f40:	00124d0b 	0x124d0b
     f44:	124d0b00 	beq	s2,t5,3b48 <_data-0x7fffc4b8>
     f48:	08000000 	j	0 <_data-0x80000000>
     f4c:	000001fb 	0x1fb
     f50:	0f877401 	jal	e1dd004 <_data-0x71e22ffc>
     f54:	0fe90000 	jal	fa40000 <_data-0x705c0000>
     f58:	4e0c0000 	c3	0xc0000
     f5c:	00002500 	sll	a0,zero,0x14
     f60:	000b0400 	sll	zero,t3,0x10
     f64:	490d0000 	bc2t	$cc3,f68 <_data-0x7ffff098>
     f68:	de730100 	ldc3	$19,256(s3)
     f6c:	0700000f 	bltz	t8,fac <_data-0x7ffff054>
     f70:	00000025 	move	zero,zero
     f74:	00000004 	sllv	zero,zero,zero
     f78:	00250700 	0x250700
     f7c:	01040000 	0x1040000
     f80:	07000000 	bltz	t8,f84 <_data-0x7ffff07c>
     f84:	00000025 	move	zero,zero
     f88:	00000204 	0x204
     f8c:	00250700 	0x250700
     f90:	03040000 	0x3040000
     f94:	07000000 	bltz	t8,f98 <_data-0x7ffff068>
     f98:	00000025 	move	zero,zero
     f9c:	00000404 	0x404
     fa0:	00250700 	0x250700
     fa4:	05040000 	0x5040000
     fa8:	07000000 	bltz	t8,fac <_data-0x7ffff054>
     fac:	00000025 	move	zero,zero
     fb0:	00000604 	0x604
     fb4:	00250700 	0x250700
     fb8:	07040000 	0x7040000
     fbc:	07000000 	bltz	t8,fc0 <_data-0x7ffff040>
     fc0:	00000025 	move	zero,zero
     fc4:	00000804 	sllv	at,zero,zero
     fc8:	00250700 	0x250700
     fcc:	09040000 	j	4100000 <_data-0x7bf00000>
     fd0:	07000000 	bltz	t8,fd4 <_data-0x7ffff02c>
     fd4:	00000025 	move	zero,zero
     fd8:	00000a04 	0xa04
     fdc:	2e0b0000 	sltiu	t3,s0,0
     fe0:	0b00001f 	j	c00007c <_data-0x73ffff84>
     fe4:	0000023e 	0x23e
     fe8:	09080800 	j	4202000 <_data-0x7bdfe000>
     fec:	74010000 	jalx	40000 <_data-0x7ffc0000>
     ff0:	000011bf 	0x11bf
     ff4:	00001073 	tltu	zero,zero,0x41
     ff8:	25004e0c 	addiu	zero,t0,19980
     ffc:	04000000 	bltz	zero,1000 <_data-0x7ffff000>
    1000:	00000009 	jalr	zero,zero
    1004:	0100490d 	break	0x100,0x124
    1008:	00106873 	tltu	zero,s0,0x1a1
    100c:	00250700 	0x250700
    1010:	00040000 	sll	zero,a0,0x0
    1014:	07000000 	bltz	t8,1018 <_data-0x7fffefe8>
    1018:	00000025 	move	zero,zero
    101c:	00000104 	0x104
    1020:	00250700 	0x250700
    1024:	02040000 	0x2040000
    1028:	07000000 	bltz	t8,102c <_data-0x7fffefd4>
    102c:	00000025 	move	zero,zero
    1030:	00000304 	0x304
    1034:	00250700 	0x250700
    1038:	04040000 	0x4040000
    103c:	07000000 	bltz	t8,1040 <_data-0x7fffefc0>
    1040:	00000025 	move	zero,zero
    1044:	00000504 	0x504
    1048:	00250700 	0x250700
    104c:	06040000 	0x6040000
    1050:	07000000 	bltz	t8,1054 <_data-0x7fffefac>
    1054:	00000025 	move	zero,zero
    1058:	00000704 	0x704
    105c:	00250700 	0x250700
    1060:	08040000 	j	100000 <_data-0x7ff00000>
    1064:	00000000 	nop
    1068:	001fe30b 	0x1fe30b
    106c:	01d10b00 	0x1d10b00
    1070:	08000000 	j	0 <_data-0x80000000>
    1074:	0000124c 	syscall	0x49
    1078:	09ab7401 	j	6add004 <_data-0x79522ffc>
    107c:	11890000 	beq	t4,t1,1080 <_data-0x7fffef80>
    1080:	4e0c0000 	c3	0xc0000
    1084:	00002500 	sll	a0,zero,0x14
    1088:	00170400 	sll	zero,s7,0x10
    108c:	490d0000 	bc2t	$cc3,1090 <_data-0x7fffef70>
    1090:	7e730100 	0x7e730100
    1094:	07000011 	bltz	t8,10dc <_data-0x7fffef24>
    1098:	00000025 	move	zero,zero
    109c:	00000004 	sllv	zero,zero,zero
    10a0:	00250700 	0x250700
    10a4:	01040000 	0x1040000
    10a8:	07000000 	bltz	t8,10ac <_data-0x7fffef54>
    10ac:	00000025 	move	zero,zero
    10b0:	00000204 	0x204
    10b4:	00250700 	0x250700
    10b8:	03040000 	0x3040000
    10bc:	07000000 	bltz	t8,10c0 <_data-0x7fffef40>
    10c0:	00000025 	move	zero,zero
    10c4:	00000404 	0x404
    10c8:	00250700 	0x250700
    10cc:	05040000 	0x5040000
    10d0:	07000000 	bltz	t8,10d4 <_data-0x7fffef2c>
    10d4:	00000025 	move	zero,zero
    10d8:	00000604 	0x604
    10dc:	00250700 	0x250700
    10e0:	07040000 	0x7040000
    10e4:	07000000 	bltz	t8,10e8 <_data-0x7fffef18>
    10e8:	00000025 	move	zero,zero
    10ec:	00000804 	sllv	at,zero,zero
    10f0:	00250700 	0x250700
    10f4:	09040000 	j	4100000 <_data-0x7bf00000>
    10f8:	07000000 	bltz	t8,10fc <_data-0x7fffef04>
    10fc:	00000025 	move	zero,zero
    1100:	00000a04 	0xa04
    1104:	00250700 	0x250700
    1108:	0b040000 	j	c100000 <_data-0x73f00000>
    110c:	07000000 	bltz	t8,1110 <_data-0x7fffeef0>
    1110:	00000025 	move	zero,zero
    1114:	00000c04 	0xc04
    1118:	00250700 	0x250700
    111c:	0d040000 	jal	4100000 <_data-0x7bf00000>
    1120:	07000000 	bltz	t8,1124 <_data-0x7fffeedc>
    1124:	00000025 	move	zero,zero
    1128:	00000e04 	0xe04
    112c:	00250700 	0x250700
    1130:	0f040000 	jal	c100000 <_data-0x73f00000>
    1134:	07000000 	bltz	t8,1138 <_data-0x7fffeec8>
    1138:	00000025 	move	zero,zero
    113c:	00001004 	sllv	v0,zero,zero
    1140:	00250700 	0x250700
    1144:	11040000 	beq	t0,a0,1148 <_data-0x7fffeeb8>
    1148:	07000000 	bltz	t8,114c <_data-0x7fffeeb4>
    114c:	00000025 	move	zero,zero
    1150:	00001204 	0x1204
    1154:	00250700 	0x250700
    1158:	13040000 	beq	t8,a0,115c <_data-0x7fffeea4>
    115c:	07000000 	bltz	t8,1160 <_data-0x7fffeea0>
    1160:	00000025 	move	zero,zero
    1164:	00001404 	0x1404
    1168:	00250700 	0x250700
    116c:	15040000 	bne	t0,a0,1170 <_data-0x7fffee90>
    1170:	07000000 	bltz	t8,1174 <_data-0x7fffee8c>
    1174:	00000025 	move	zero,zero
    1178:	00001604 	0x1604
    117c:	840b0000 	lh	t3,0(zero)
    1180:	0b000020 	j	c000080 <_data-0x73ffff80>
    1184:	000000d8 	0xd8
    1188:	0b280800 	j	ca02000 <_data-0x735fe000>
    118c:	74010000 	jalx	40000 <_data-0x7ffc0000>
    1190:	00000783 	sra	zero,zero,0x1e
    1194:	0000123b 	0x123b
    1198:	25004e0c 	addiu	zero,t0,19980
    119c:	04000000 	bltz	zero,11a0 <_data-0x7fffee60>
    11a0:	0000000d 	break
    11a4:	0100490d 	break	0x100,0x124
    11a8:	00123073 	tltu	zero,s2,0xc1
    11ac:	00250700 	0x250700
    11b0:	00040000 	sll	zero,a0,0x0
    11b4:	07000000 	bltz	t8,11b8 <_data-0x7fffee48>
    11b8:	00000025 	move	zero,zero
    11bc:	00000104 	0x104
    11c0:	00250700 	0x250700
    11c4:	02040000 	0x2040000
    11c8:	07000000 	bltz	t8,11cc <_data-0x7fffee34>
    11cc:	00000025 	move	zero,zero
    11d0:	00000304 	0x304
    11d4:	00250700 	0x250700
    11d8:	04040000 	0x4040000
    11dc:	07000000 	bltz	t8,11e0 <_data-0x7fffee20>
    11e0:	00000025 	move	zero,zero
    11e4:	00000504 	0x504
    11e8:	00250700 	0x250700
    11ec:	06040000 	0x6040000
    11f0:	07000000 	bltz	t8,11f4 <_data-0x7fffee0c>
    11f4:	00000025 	move	zero,zero
    11f8:	00000704 	0x704
    11fc:	00250700 	0x250700
    1200:	08040000 	j	100000 <_data-0x7ff00000>
    1204:	07000000 	bltz	t8,1208 <_data-0x7fffedf8>
    1208:	00000025 	move	zero,zero
    120c:	00000904 	0x904
    1210:	00250700 	0x250700
    1214:	0a040000 	j	8100000 <_data-0x77f00000>
    1218:	07000000 	bltz	t8,121c <_data-0x7fffede4>
    121c:	00000025 	move	zero,zero
    1220:	00000b04 	0xb04
    1224:	00250700 	0x250700
    1228:	0c040000 	jal	100000 <_data-0x7ff00000>
    122c:	00000000 	nop
    1230:	0021b10b 	0x21b10b
    1234:	00430b00 	0x430b00
    1238:	0e000000 	jal	8000000 <_data-0x78000000>
    123c:	00000f6e 	0xf6e
    1240:	07206e01 	bltz	t9,1ca48 <_data-0x7ffe35b8>
    1244:	590b0000 	0x590b0000
    1248:	00000012 	mflo	zero
    124c:	06010200 	bgez	s0,1a50 <_data-0x7fffe5b0>
    1250:	00000af2 	tlt	zero,zero,0x2b
    1254:	00124d0f 	0x124d0f
    1258:	08010200 	j	40800 <_data-0x7ffbf800>
    125c:	00000ae9 	0xae9
    1260:	0002bf10 	0x2bf10
    1264:	13040300 	beq	t8,a0,1e68 <_data-0x7fffe198>
    1268:	53090000 	beql	t8,t1,126c <_data-0x7fffed94>
    126c:	b5000001 	0xb5000001
    1270:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1274:	0000124d 	break	0x0,0x49
    1278:	00124d0a 	0x124d0a
    127c:	124d0a00 	beq	s2,t5,3a80 <_data-0x7fffc580>
    1280:	4d0a0000 	0x4d0a0000
    1284:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1288:	0000124d 	break	0x0,0x49
    128c:	00124d0a 	0x124d0a
    1290:	124d0a00 	beq	s2,t5,3a94 <_data-0x7fffc56c>
    1294:	4d0a0000 	0x4d0a0000
    1298:	0a000012 	j	8000048 <_data-0x77ffffb8>
    129c:	0000124d 	break	0x0,0x49
    12a0:	00124d0a 	0x124d0a
    12a4:	124d0a00 	beq	s2,t5,3aa8 <_data-0x7fffc558>
    12a8:	4d0a0000 	0x4d0a0000
    12ac:	0a000012 	j	8000048 <_data-0x77ffffb8>
    12b0:	0000124d 	break	0x0,0x49
    12b4:	00611100 	0x611100
    12b8:	12596701 	beq	s2,t9,1aec0 <_data-0x7ffe5140>
    12bc:	01120000 	0x1120000
    12c0:	124d0b67 	beq	s2,t5,4060 <_data-0x7fffbfa0>
    12c4:	4d0b0000 	0x4d0b0000
    12c8:	0b000012 	j	c000048 <_data-0x73ffffb8>
    12cc:	0000124d 	break	0x0,0x49
    12d0:	00124d0b 	0x124d0b
    12d4:	124d0b00 	beq	s2,t5,3ed8 <_data-0x7fffc128>
    12d8:	4d0b0000 	0x4d0b0000
    12dc:	0b000012 	j	c000048 <_data-0x73ffffb8>
    12e0:	0000124d 	break	0x0,0x49
    12e4:	00124d0b 	0x124d0b
    12e8:	124d0b00 	beq	s2,t5,3eec <_data-0x7fffc114>
    12ec:	4d0b0000 	0x4d0b0000
    12f0:	0b000012 	j	c000048 <_data-0x73ffffb8>
    12f4:	0000124d 	break	0x0,0x49
    12f8:	00124d0b 	0x124d0b
    12fc:	124d0b00 	beq	s2,t5,3f00 <_data-0x7fffc100>
    1300:	00000000 	nop
    1304:	00036010 	0x36010
    1308:	13b20300 	beq	sp,s2,1f0c <_data-0x7fffe0f4>
    130c:	53090000 	beql	t8,t1,1310 <_data-0x7fffecf0>
    1310:	5e000001 	bgtzl	s0,1318 <_data-0x7fffece8>
    1314:	0a000013 	j	800004c <_data-0x77ffffb4>
    1318:	0000124d 	break	0x0,0x49
    131c:	00124d0a 	0x124d0a
    1320:	124d0a00 	beq	s2,t5,3b24 <_data-0x7fffc4dc>
    1324:	4d0a0000 	0x4d0a0000
    1328:	0a000012 	j	8000048 <_data-0x77ffffb8>
    132c:	0000124d 	break	0x0,0x49
    1330:	00124d0a 	0x124d0a
    1334:	124d0a00 	beq	s2,t5,3b38 <_data-0x7fffc4c8>
    1338:	4d0a0000 	0x4d0a0000
    133c:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1340:	0000124d 	break	0x0,0x49
    1344:	00124d0a 	0x124d0a
    1348:	124d0a00 	beq	s2,t5,3b4c <_data-0x7fffc4b4>
    134c:	4d0a0000 	0x4d0a0000
    1350:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1354:	0000124d 	break	0x0,0x49
    1358:	00124d0a 	0x124d0a
    135c:	61110000 	0x61110000
    1360:	59670100 	0x59670100
    1364:	12000012 	beqz	s0,13b0 <_data-0x7fffec50>
    1368:	4d0b6701 	0x4d0b6701
    136c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1370:	0000124d 	break	0x0,0x49
    1374:	00124d0b 	0x124d0b
    1378:	124d0b00 	beq	s2,t5,3f7c <_data-0x7fffc084>
    137c:	4d0b0000 	0x4d0b0000
    1380:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1384:	0000124d 	break	0x0,0x49
    1388:	00124d0b 	0x124d0b
    138c:	124d0b00 	beq	s2,t5,3f90 <_data-0x7fffc070>
    1390:	4d0b0000 	0x4d0b0000
    1394:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1398:	0000124d 	break	0x0,0x49
    139c:	00124d0b 	0x124d0b
    13a0:	124d0b00 	beq	s2,t5,3fa4 <_data-0x7fffc05c>
    13a4:	4d0b0000 	0x4d0b0000
    13a8:	0b000012 	j	c000048 <_data-0x73ffffb8>
    13ac:	0000124d 	break	0x0,0x49
    13b0:	0b100000 	j	c400000 <_data-0x73c00000>
    13b4:	03000004 	sllv	zero,zero,t8
    13b8:	000013de 	0x13de
    13bc:	00015309 	0x15309
    13c0:	0013cb00 	sll	t9,s3,0xc
    13c4:	124d0a00 	beq	s2,t5,3bc8 <_data-0x7fffc438>
    13c8:	11000000 	beqz	t0,13cc <_data-0x7fffec34>
    13cc:	67010061 	0x67010061
    13d0:	00001259 	0x1259
    13d4:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    13d8:	0000124d 	break	0x0,0x49
    13dc:	34100000 	li	s0,0x0
    13e0:	03000004 	sllv	zero,zero,t8
    13e4:	00001496 	0x1496
    13e8:	00015309 	0x15309
    13ec:	00143d00 	sll	a3,s4,0x14
    13f0:	124d0a00 	beq	s2,t5,3bf4 <_data-0x7fffc40c>
    13f4:	4d0a0000 	0x4d0a0000
    13f8:	0a000012 	j	8000048 <_data-0x77ffffb8>
    13fc:	0000124d 	break	0x0,0x49
    1400:	00124d0a 	0x124d0a
    1404:	124d0a00 	beq	s2,t5,3c08 <_data-0x7fffc3f8>
    1408:	4d0a0000 	0x4d0a0000
    140c:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1410:	0000124d 	break	0x0,0x49
    1414:	00124d0a 	0x124d0a
    1418:	124d0a00 	beq	s2,t5,3c1c <_data-0x7fffc3e4>
    141c:	4d0a0000 	0x4d0a0000
    1420:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1424:	0000124d 	break	0x0,0x49
    1428:	00124d0a 	0x124d0a
    142c:	124d0a00 	beq	s2,t5,3c30 <_data-0x7fffc3d0>
    1430:	4d0a0000 	0x4d0a0000
    1434:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1438:	0000124d 	break	0x0,0x49
    143c:	00611100 	0x611100
    1440:	12596701 	beq	s2,t9,1b048 <_data-0x7ffe4fb8>
    1444:	01120000 	0x1120000
    1448:	124d0b67 	beq	s2,t5,41e8 <_data-0x7fffbe18>
    144c:	4d0b0000 	0x4d0b0000
    1450:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1454:	0000124d 	break	0x0,0x49
    1458:	00124d0b 	0x124d0b
    145c:	124d0b00 	beq	s2,t5,4060 <_data-0x7fffbfa0>
    1460:	4d0b0000 	0x4d0b0000
    1464:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1468:	0000124d 	break	0x0,0x49
    146c:	00124d0b 	0x124d0b
    1470:	124d0b00 	beq	s2,t5,4074 <_data-0x7fffbf8c>
    1474:	4d0b0000 	0x4d0b0000
    1478:	0b000012 	j	c000048 <_data-0x73ffffb8>
    147c:	0000124d 	break	0x0,0x49
    1480:	00124d0b 	0x124d0b
    1484:	124d0b00 	beq	s2,t5,4088 <_data-0x7fffbf78>
    1488:	4d0b0000 	0x4d0b0000
    148c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1490:	0000124d 	break	0x0,0x49
    1494:	e9100000 	swc2	$16,0(t0)
    1498:	03000004 	sllv	zero,zero,t8
    149c:	000014cc 	syscall	0x53
    14a0:	00015309 	0x15309
    14a4:	0014b400 	sll	s6,s4,0x10
    14a8:	124d0a00 	beq	s2,t5,3cac <_data-0x7fffc354>
    14ac:	4d0a0000 	0x4d0a0000
    14b0:	00000012 	mflo	zero
    14b4:	01006111 	0x1006111
    14b8:	00125967 	0x125967
    14bc:	67011200 	0x67011200
    14c0:	00124d0b 	0x124d0b
    14c4:	124d0b00 	beq	s2,t5,40c8 <_data-0x7fffbf38>
    14c8:	00000000 	nop
    14cc:	00051c10 	0x51c10
    14d0:	158e0300 	bne	t4,t6,20d4 <_data-0x7fffdf2c>
    14d4:	53090000 	beql	t8,t1,14d8 <_data-0x7fffeb28>
    14d8:	30000001 	andi	zero,zero,0x1
    14dc:	0a000015 	j	8000054 <_data-0x77ffffac>
    14e0:	0000124d 	break	0x0,0x49
    14e4:	00124d0a 	0x124d0a
    14e8:	124d0a00 	beq	s2,t5,3cec <_data-0x7fffc314>
    14ec:	4d0a0000 	0x4d0a0000
    14f0:	0a000012 	j	8000048 <_data-0x77ffffb8>
    14f4:	0000124d 	break	0x0,0x49
    14f8:	00124d0a 	0x124d0a
    14fc:	124d0a00 	beq	s2,t5,3d00 <_data-0x7fffc300>
    1500:	4d0a0000 	0x4d0a0000
    1504:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1508:	0000124d 	break	0x0,0x49
    150c:	00124d0a 	0x124d0a
    1510:	124d0a00 	beq	s2,t5,3d14 <_data-0x7fffc2ec>
    1514:	4d0a0000 	0x4d0a0000
    1518:	0a000012 	j	8000048 <_data-0x77ffffb8>
    151c:	0000124d 	break	0x0,0x49
    1520:	00124d0a 	0x124d0a
    1524:	124d0a00 	beq	s2,t5,3d28 <_data-0x7fffc2d8>
    1528:	4d0a0000 	0x4d0a0000
    152c:	00000012 	mflo	zero
    1530:	01006111 	0x1006111
    1534:	00125967 	0x125967
    1538:	67011200 	0x67011200
    153c:	00124d0b 	0x124d0b
    1540:	124d0b00 	beq	s2,t5,4144 <_data-0x7fffbebc>
    1544:	4d0b0000 	0x4d0b0000
    1548:	0b000012 	j	c000048 <_data-0x73ffffb8>
    154c:	0000124d 	break	0x0,0x49
    1550:	00124d0b 	0x124d0b
    1554:	124d0b00 	beq	s2,t5,4158 <_data-0x7fffbea8>
    1558:	4d0b0000 	0x4d0b0000
    155c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1560:	0000124d 	break	0x0,0x49
    1564:	00124d0b 	0x124d0b
    1568:	124d0b00 	beq	s2,t5,416c <_data-0x7fffbe94>
    156c:	4d0b0000 	0x4d0b0000
    1570:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1574:	0000124d 	break	0x0,0x49
    1578:	00124d0b 	0x124d0b
    157c:	124d0b00 	beq	s2,t5,4180 <_data-0x7fffbe80>
    1580:	4d0b0000 	0x4d0b0000
    1584:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1588:	0000124d 	break	0x0,0x49
    158c:	db100000 	ldc2	$16,0(t8)
    1590:	03000005 	0x3000005
    1594:	000015ce 	0x15ce
    1598:	00015309 	0x15309
    159c:	0015b100 	sll	s6,s5,0x4
    15a0:	124d0a00 	beq	s2,t5,3da4 <_data-0x7fffc25c>
    15a4:	4d0a0000 	0x4d0a0000
    15a8:	0a000012 	j	8000048 <_data-0x77ffffb8>
    15ac:	0000124d 	break	0x0,0x49
    15b0:	00611100 	0x611100
    15b4:	12596701 	beq	s2,t9,1b1bc <_data-0x7ffe4e44>
    15b8:	01120000 	0x1120000
    15bc:	124d0b67 	beq	s2,t5,435c <_data-0x7fffbca4>
    15c0:	4d0b0000 	0x4d0b0000
    15c4:	0b000012 	j	c000048 <_data-0x73ffffb8>
    15c8:	0000124d 	break	0x0,0x49
    15cc:	18100000 	0x18100000
    15d0:	03000006 	srlv	zero,zero,t8
    15d4:	0000169a 	0x169a
    15d8:	00015309 	0x15309
    15dc:	00163700 	sll	a2,s6,0x1c
    15e0:	124d0a00 	beq	s2,t5,3de4 <_data-0x7fffc21c>
    15e4:	4d0a0000 	0x4d0a0000
    15e8:	0a000012 	j	8000048 <_data-0x77ffffb8>
    15ec:	0000124d 	break	0x0,0x49
    15f0:	00124d0a 	0x124d0a
    15f4:	124d0a00 	beq	s2,t5,3df8 <_data-0x7fffc208>
    15f8:	4d0a0000 	0x4d0a0000
    15fc:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1600:	0000124d 	break	0x0,0x49
    1604:	00124d0a 	0x124d0a
    1608:	124d0a00 	beq	s2,t5,3e0c <_data-0x7fffc1f4>
    160c:	4d0a0000 	0x4d0a0000
    1610:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1614:	0000124d 	break	0x0,0x49
    1618:	00124d0a 	0x124d0a
    161c:	124d0a00 	beq	s2,t5,3e20 <_data-0x7fffc1e0>
    1620:	4d0a0000 	0x4d0a0000
    1624:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1628:	0000124d 	break	0x0,0x49
    162c:	00124d0a 	0x124d0a
    1630:	124d0a00 	beq	s2,t5,3e34 <_data-0x7fffc1cc>
    1634:	11000000 	beqz	t0,1638 <_data-0x7fffe9c8>
    1638:	67010061 	0x67010061
    163c:	00001259 	0x1259
    1640:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    1644:	0000124d 	break	0x0,0x49
    1648:	00124d0b 	0x124d0b
    164c:	124d0b00 	beq	s2,t5,4250 <_data-0x7fffbdb0>
    1650:	4d0b0000 	0x4d0b0000
    1654:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1658:	0000124d 	break	0x0,0x49
    165c:	00124d0b 	0x124d0b
    1660:	124d0b00 	beq	s2,t5,4264 <_data-0x7fffbd9c>
    1664:	4d0b0000 	0x4d0b0000
    1668:	0b000012 	j	c000048 <_data-0x73ffffb8>
    166c:	0000124d 	break	0x0,0x49
    1670:	00124d0b 	0x124d0b
    1674:	124d0b00 	beq	s2,t5,4278 <_data-0x7fffbd88>
    1678:	4d0b0000 	0x4d0b0000
    167c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1680:	0000124d 	break	0x0,0x49
    1684:	00124d0b 	0x124d0b
    1688:	124d0b00 	beq	s2,t5,428c <_data-0x7fffbd74>
    168c:	4d0b0000 	0x4d0b0000
    1690:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1694:	0000124d 	break	0x0,0x49
    1698:	e1100000 	sc	s0,0(t0)
    169c:	03000006 	srlv	zero,zero,t8
    16a0:	000016e4 	0x16e4
    16a4:	00015309 	0x15309
    16a8:	0016c200 	sll	t8,s6,0x8
    16ac:	124d0a00 	beq	s2,t5,3eb0 <_data-0x7fffc150>
    16b0:	4d0a0000 	0x4d0a0000
    16b4:	0a000012 	j	8000048 <_data-0x77ffffb8>
    16b8:	0000124d 	break	0x0,0x49
    16bc:	00124d0a 	0x124d0a
    16c0:	61110000 	0x61110000
    16c4:	59670100 	0x59670100
    16c8:	12000012 	beqz	s0,1714 <_data-0x7fffe8ec>
    16cc:	4d0b6701 	0x4d0b6701
    16d0:	0b000012 	j	c000048 <_data-0x73ffffb8>
    16d4:	0000124d 	break	0x0,0x49
    16d8:	00124d0b 	0x124d0b
    16dc:	124d0b00 	beq	s2,t5,42e0 <_data-0x7fffbd20>
    16e0:	00000000 	nop
    16e4:	00072810 	0x72810
    16e8:	17ba0300 	bne	sp,k0,22ec <_data-0x7fffdd14>
    16ec:	53090000 	beql	t8,t1,16f0 <_data-0x7fffe910>
    16f0:	52000001 	beqzl	s0,16f8 <_data-0x7fffe908>
    16f4:	0a000017 	j	800005c <_data-0x77ffffa4>
    16f8:	0000124d 	break	0x0,0x49
    16fc:	00124d0a 	0x124d0a
    1700:	124d0a00 	beq	s2,t5,3f04 <_data-0x7fffc0fc>
    1704:	4d0a0000 	0x4d0a0000
    1708:	0a000012 	j	8000048 <_data-0x77ffffb8>
    170c:	0000124d 	break	0x0,0x49
    1710:	00124d0a 	0x124d0a
    1714:	124d0a00 	beq	s2,t5,3f18 <_data-0x7fffc0e8>
    1718:	4d0a0000 	0x4d0a0000
    171c:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1720:	0000124d 	break	0x0,0x49
    1724:	00124d0a 	0x124d0a
    1728:	124d0a00 	beq	s2,t5,3f2c <_data-0x7fffc0d4>
    172c:	4d0a0000 	0x4d0a0000
    1730:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1734:	0000124d 	break	0x0,0x49
    1738:	00124d0a 	0x124d0a
    173c:	124d0a00 	beq	s2,t5,3f40 <_data-0x7fffc0c0>
    1740:	4d0a0000 	0x4d0a0000
    1744:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1748:	0000124d 	break	0x0,0x49
    174c:	00124d0a 	0x124d0a
    1750:	61110000 	0x61110000
    1754:	59670100 	0x59670100
    1758:	12000012 	beqz	s0,17a4 <_data-0x7fffe85c>
    175c:	4d0b6701 	0x4d0b6701
    1760:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1764:	0000124d 	break	0x0,0x49
    1768:	00124d0b 	0x124d0b
    176c:	124d0b00 	beq	s2,t5,4370 <_data-0x7fffbc90>
    1770:	4d0b0000 	0x4d0b0000
    1774:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1778:	0000124d 	break	0x0,0x49
    177c:	00124d0b 	0x124d0b
    1780:	124d0b00 	beq	s2,t5,4384 <_data-0x7fffbc7c>
    1784:	4d0b0000 	0x4d0b0000
    1788:	0b000012 	j	c000048 <_data-0x73ffffb8>
    178c:	0000124d 	break	0x0,0x49
    1790:	00124d0b 	0x124d0b
    1794:	124d0b00 	beq	s2,t5,4398 <_data-0x7fffbc68>
    1798:	4d0b0000 	0x4d0b0000
    179c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    17a0:	0000124d 	break	0x0,0x49
    17a4:	00124d0b 	0x124d0b
    17a8:	124d0b00 	beq	s2,t5,43ac <_data-0x7fffbc54>
    17ac:	4d0b0000 	0x4d0b0000
    17b0:	0b000012 	j	c000048 <_data-0x73ffffb8>
    17b4:	0000124d 	break	0x0,0x49
    17b8:	fb100000 	sdc2	$16,0(t8)
    17bc:	03000007 	srav	zero,zero,t8
    17c0:	0000180e 	0x180e
    17c4:	00015309 	0x15309
    17c8:	0017e700 	sll	gp,s7,0x1c
    17cc:	124d0a00 	beq	s2,t5,3fd0 <_data-0x7fffc030>
    17d0:	4d0a0000 	0x4d0a0000
    17d4:	0a000012 	j	8000048 <_data-0x77ffffb8>
    17d8:	0000124d 	break	0x0,0x49
    17dc:	00124d0a 	0x124d0a
    17e0:	124d0a00 	beq	s2,t5,3fe4 <_data-0x7fffc01c>
    17e4:	11000000 	beqz	t0,17e8 <_data-0x7fffe818>
    17e8:	67010061 	0x67010061
    17ec:	00001259 	0x1259
    17f0:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    17f4:	0000124d 	break	0x0,0x49
    17f8:	00124d0b 	0x124d0b
    17fc:	124d0b00 	beq	s2,t5,4400 <_data-0x7fffbc00>
    1800:	4d0b0000 	0x4d0b0000
    1804:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1808:	0000124d 	break	0x0,0x49
    180c:	4c100000 	mfc3	s0,$0
    1810:	03000008 	jr	t8
    1814:	000018ee 	0x18ee
    1818:	00015309 	0x15309
    181c:	00188100 	sll	s0,t8,0x4
    1820:	124d0a00 	beq	s2,t5,4024 <_data-0x7fffbfdc>
    1824:	4d0a0000 	0x4d0a0000
    1828:	0a000012 	j	8000048 <_data-0x77ffffb8>
    182c:	0000124d 	break	0x0,0x49
    1830:	00124d0a 	0x124d0a
    1834:	124d0a00 	beq	s2,t5,4038 <_data-0x7fffbfc8>
    1838:	4d0a0000 	0x4d0a0000
    183c:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1840:	0000124d 	break	0x0,0x49
    1844:	00124d0a 	0x124d0a
    1848:	124d0a00 	beq	s2,t5,404c <_data-0x7fffbfb4>
    184c:	4d0a0000 	0x4d0a0000
    1850:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1854:	0000124d 	break	0x0,0x49
    1858:	00124d0a 	0x124d0a
    185c:	124d0a00 	beq	s2,t5,4060 <_data-0x7fffbfa0>
    1860:	4d0a0000 	0x4d0a0000
    1864:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1868:	0000124d 	break	0x0,0x49
    186c:	00124d0a 	0x124d0a
    1870:	124d0a00 	beq	s2,t5,4074 <_data-0x7fffbf8c>
    1874:	4d0a0000 	0x4d0a0000
    1878:	0a000012 	j	8000048 <_data-0x77ffffb8>
    187c:	0000124d 	break	0x0,0x49
    1880:	00611100 	0x611100
    1884:	12596701 	beq	s2,t9,1b48c <_data-0x7ffe4b74>
    1888:	01120000 	0x1120000
    188c:	124d0b67 	beq	s2,t5,462c <_data-0x7fffb9d4>
    1890:	4d0b0000 	0x4d0b0000
    1894:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1898:	0000124d 	break	0x0,0x49
    189c:	00124d0b 	0x124d0b
    18a0:	124d0b00 	beq	s2,t5,44a4 <_data-0x7fffbb5c>
    18a4:	4d0b0000 	0x4d0b0000
    18a8:	0b000012 	j	c000048 <_data-0x73ffffb8>
    18ac:	0000124d 	break	0x0,0x49
    18b0:	00124d0b 	0x124d0b
    18b4:	124d0b00 	beq	s2,t5,44b8 <_data-0x7fffbb48>
    18b8:	4d0b0000 	0x4d0b0000
    18bc:	0b000012 	j	c000048 <_data-0x73ffffb8>
    18c0:	0000124d 	break	0x0,0x49
    18c4:	00124d0b 	0x124d0b
    18c8:	124d0b00 	beq	s2,t5,44cc <_data-0x7fffbb34>
    18cc:	4d0b0000 	0x4d0b0000
    18d0:	0b000012 	j	c000048 <_data-0x73ffffb8>
    18d4:	0000124d 	break	0x0,0x49
    18d8:	00124d0b 	0x124d0b
    18dc:	124d0b00 	beq	s2,t5,44e0 <_data-0x7fffbb20>
    18e0:	4d0b0000 	0x4d0b0000
    18e4:	0b000012 	j	c000048 <_data-0x73ffffb8>
    18e8:	0000124d 	break	0x0,0x49
    18ec:	29100000 	slti	s0,t0,0
    18f0:	03000009 	jalr	zero,t8
    18f4:	0000194c 	syscall	0x65
    18f8:	00015309 	0x15309
    18fc:	00192000 	sll	a0,t9,0x0
    1900:	124d0a00 	beq	s2,t5,4104 <_data-0x7fffbefc>
    1904:	4d0a0000 	0x4d0a0000
    1908:	0a000012 	j	8000048 <_data-0x77ffffb8>
    190c:	0000124d 	break	0x0,0x49
    1910:	00124d0a 	0x124d0a
    1914:	124d0a00 	beq	s2,t5,4118 <_data-0x7fffbee8>
    1918:	4d0a0000 	0x4d0a0000
    191c:	00000012 	mflo	zero
    1920:	01006111 	0x1006111
    1924:	00125967 	0x125967
    1928:	67011200 	0x67011200
    192c:	00124d0b 	0x124d0b
    1930:	124d0b00 	beq	s2,t5,4534 <_data-0x7fffbacc>
    1934:	4d0b0000 	0x4d0b0000
    1938:	0b000012 	j	c000048 <_data-0x73ffffb8>
    193c:	0000124d 	break	0x0,0x49
    1940:	00124d0b 	0x124d0b
    1944:	124d0b00 	beq	s2,t5,4548 <_data-0x7fffbab8>
    1948:	00000000 	nop
    194c:	00098410 	0x98410
    1950:	1a360300 	0x1a360300
    1954:	53090000 	beql	t8,t1,1958 <_data-0x7fffe6a8>
    1958:	c4000001 	lwc1	$f0,1(zero)
    195c:	0a000019 	j	8000064 <_data-0x77ffff9c>
    1960:	0000124d 	break	0x0,0x49
    1964:	00124d0a 	0x124d0a
    1968:	124d0a00 	beq	s2,t5,416c <_data-0x7fffbe94>
    196c:	4d0a0000 	0x4d0a0000
    1970:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1974:	0000124d 	break	0x0,0x49
    1978:	00124d0a 	0x124d0a
    197c:	124d0a00 	beq	s2,t5,4180 <_data-0x7fffbe80>
    1980:	4d0a0000 	0x4d0a0000
    1984:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1988:	0000124d 	break	0x0,0x49
    198c:	00124d0a 	0x124d0a
    1990:	124d0a00 	beq	s2,t5,4194 <_data-0x7fffbe6c>
    1994:	4d0a0000 	0x4d0a0000
    1998:	0a000012 	j	8000048 <_data-0x77ffffb8>
    199c:	0000124d 	break	0x0,0x49
    19a0:	00124d0a 	0x124d0a
    19a4:	124d0a00 	beq	s2,t5,41a8 <_data-0x7fffbe58>
    19a8:	4d0a0000 	0x4d0a0000
    19ac:	0a000012 	j	8000048 <_data-0x77ffffb8>
    19b0:	0000124d 	break	0x0,0x49
    19b4:	00124d0a 	0x124d0a
    19b8:	124d0a00 	beq	s2,t5,41bc <_data-0x7fffbe44>
    19bc:	4d0a0000 	0x4d0a0000
    19c0:	00000012 	mflo	zero
    19c4:	01006111 	0x1006111
    19c8:	00125967 	0x125967
    19cc:	67011200 	0x67011200
    19d0:	00124d0b 	0x124d0b
    19d4:	124d0b00 	beq	s2,t5,45d8 <_data-0x7fffba28>
    19d8:	4d0b0000 	0x4d0b0000
    19dc:	0b000012 	j	c000048 <_data-0x73ffffb8>
    19e0:	0000124d 	break	0x0,0x49
    19e4:	00124d0b 	0x124d0b
    19e8:	124d0b00 	beq	s2,t5,45ec <_data-0x7fffba14>
    19ec:	4d0b0000 	0x4d0b0000
    19f0:	0b000012 	j	c000048 <_data-0x73ffffb8>
    19f4:	0000124d 	break	0x0,0x49
    19f8:	00124d0b 	0x124d0b
    19fc:	124d0b00 	beq	s2,t5,4600 <_data-0x7fffba00>
    1a00:	4d0b0000 	0x4d0b0000
    1a04:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1a08:	0000124d 	break	0x0,0x49
    1a0c:	00124d0b 	0x124d0b
    1a10:	124d0b00 	beq	s2,t5,4614 <_data-0x7fffb9ec>
    1a14:	4d0b0000 	0x4d0b0000
    1a18:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1a1c:	0000124d 	break	0x0,0x49
    1a20:	00124d0b 	0x124d0b
    1a24:	124d0b00 	beq	s2,t5,4628 <_data-0x7fffb9d8>
    1a28:	4d0b0000 	0x4d0b0000
    1a2c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1a30:	0000124d 	break	0x0,0x49
    1a34:	6b100000 	0x6b100000
    1a38:	0300000a 	movz	zero,t8,zero
    1a3c:	00001ab2 	tlt	zero,zero,0x6a
    1a40:	00015309 	0x15309
    1a44:	001a7700 	sll	t6,k0,0x1c
    1a48:	124d0a00 	beq	s2,t5,424c <_data-0x7fffbdb4>
    1a4c:	4d0a0000 	0x4d0a0000
    1a50:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1a54:	0000124d 	break	0x0,0x49
    1a58:	00124d0a 	0x124d0a
    1a5c:	124d0a00 	beq	s2,t5,4260 <_data-0x7fffbda0>
    1a60:	4d0a0000 	0x4d0a0000
    1a64:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1a68:	0000124d 	break	0x0,0x49
    1a6c:	00124d0a 	0x124d0a
    1a70:	124d0a00 	beq	s2,t5,4274 <_data-0x7fffbd8c>
    1a74:	11000000 	beqz	t0,1a78 <_data-0x7fffe588>
    1a78:	67010061 	0x67010061
    1a7c:	00001259 	0x1259
    1a80:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    1a84:	0000124d 	break	0x0,0x49
    1a88:	00124d0b 	0x124d0b
    1a8c:	124d0b00 	beq	s2,t5,4690 <_data-0x7fffb970>
    1a90:	4d0b0000 	0x4d0b0000
    1a94:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1a98:	0000124d 	break	0x0,0x49
    1a9c:	00124d0b 	0x124d0b
    1aa0:	124d0b00 	beq	s2,t5,46a4 <_data-0x7fffb95c>
    1aa4:	4d0b0000 	0x4d0b0000
    1aa8:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1aac:	0000124d 	break	0x0,0x49
    1ab0:	e4100000 	swc1	$f16,0(zero)
    1ab4:	0300000a 	movz	zero,t8,zero
    1ab8:	00001b1a 	0x1b1a
    1abc:	00015309 	0x15309
    1ac0:	001ae900 	sll	sp,k0,0x4
    1ac4:	124d0a00 	beq	s2,t5,42c8 <_data-0x7fffbd38>
    1ac8:	4d0a0000 	0x4d0a0000
    1acc:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1ad0:	0000124d 	break	0x0,0x49
    1ad4:	00124d0a 	0x124d0a
    1ad8:	124d0a00 	beq	s2,t5,42dc <_data-0x7fffbd24>
    1adc:	4d0a0000 	0x4d0a0000
    1ae0:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1ae4:	0000124d 	break	0x0,0x49
    1ae8:	00611100 	0x611100
    1aec:	12596701 	beq	s2,t9,1b6f4 <_data-0x7ffe490c>
    1af0:	01120000 	0x1120000
    1af4:	124d0b67 	beq	s2,t5,4894 <_data-0x7fffb76c>
    1af8:	4d0b0000 	0x4d0b0000
    1afc:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1b00:	0000124d 	break	0x0,0x49
    1b04:	00124d0b 	0x124d0b
    1b08:	124d0b00 	beq	s2,t5,470c <_data-0x7fffb8f4>
    1b0c:	4d0b0000 	0x4d0b0000
    1b10:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1b14:	0000124d 	break	0x0,0x49
    1b18:	49100000 	bc2f	$cc4,1b1c <_data-0x7fffe4e4>
    1b1c:	0300000b 	movn	zero,t8,zero
    1b20:	00001c0e 	0x1c0e
    1b24:	00015309 	0x15309
    1b28:	001b9700 	sll	s2,k1,0x1c
    1b2c:	124d0a00 	beq	s2,t5,4330 <_data-0x7fffbcd0>
    1b30:	4d0a0000 	0x4d0a0000
    1b34:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1b38:	0000124d 	break	0x0,0x49
    1b3c:	00124d0a 	0x124d0a
    1b40:	124d0a00 	beq	s2,t5,4344 <_data-0x7fffbcbc>
    1b44:	4d0a0000 	0x4d0a0000
    1b48:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1b4c:	0000124d 	break	0x0,0x49
    1b50:	00124d0a 	0x124d0a
    1b54:	124d0a00 	beq	s2,t5,4358 <_data-0x7fffbca8>
    1b58:	4d0a0000 	0x4d0a0000
    1b5c:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1b60:	0000124d 	break	0x0,0x49
    1b64:	00124d0a 	0x124d0a
    1b68:	124d0a00 	beq	s2,t5,436c <_data-0x7fffbc94>
    1b6c:	4d0a0000 	0x4d0a0000
    1b70:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1b74:	0000124d 	break	0x0,0x49
    1b78:	00124d0a 	0x124d0a
    1b7c:	124d0a00 	beq	s2,t5,4380 <_data-0x7fffbc80>
    1b80:	4d0a0000 	0x4d0a0000
    1b84:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1b88:	0000124d 	break	0x0,0x49
    1b8c:	00124d0a 	0x124d0a
    1b90:	124d0a00 	beq	s2,t5,4394 <_data-0x7fffbc6c>
    1b94:	11000000 	beqz	t0,1b98 <_data-0x7fffe468>
    1b98:	67010061 	0x67010061
    1b9c:	00001259 	0x1259
    1ba0:	0b670112 	j	d9c0448 <_data-0x7263fbb8>
    1ba4:	0000124d 	break	0x0,0x49
    1ba8:	00124d0b 	0x124d0b
    1bac:	124d0b00 	beq	s2,t5,47b0 <_data-0x7fffb850>
    1bb0:	4d0b0000 	0x4d0b0000
    1bb4:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1bb8:	0000124d 	break	0x0,0x49
    1bbc:	00124d0b 	0x124d0b
    1bc0:	124d0b00 	beq	s2,t5,47c4 <_data-0x7fffb83c>
    1bc4:	4d0b0000 	0x4d0b0000
    1bc8:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1bcc:	0000124d 	break	0x0,0x49
    1bd0:	00124d0b 	0x124d0b
    1bd4:	124d0b00 	beq	s2,t5,47d8 <_data-0x7fffb828>
    1bd8:	4d0b0000 	0x4d0b0000
    1bdc:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1be0:	0000124d 	break	0x0,0x49
    1be4:	00124d0b 	0x124d0b
    1be8:	124d0b00 	beq	s2,t5,47ec <_data-0x7fffb814>
    1bec:	4d0b0000 	0x4d0b0000
    1bf0:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1bf4:	0000124d 	break	0x0,0x49
    1bf8:	00124d0b 	0x124d0b
    1bfc:	124d0b00 	beq	s2,t5,4800 <_data-0x7fffb800>
    1c00:	4d0b0000 	0x4d0b0000
    1c04:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1c08:	0000124d 	break	0x0,0x49
    1c0c:	3a100000 	xori	s0,s0,0x0
    1c10:	0300000c 	syscall	0xc0000
    1c14:	00001c9e 	0x1c9e
    1c18:	00015309 	0x15309
    1c1c:	001c5900 	sll	t3,gp,0x4
    1c20:	124d0a00 	beq	s2,t5,4424 <_data-0x7fffbbdc>
    1c24:	4d0a0000 	0x4d0a0000
    1c28:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1c2c:	0000124d 	break	0x0,0x49
    1c30:	00124d0a 	0x124d0a
    1c34:	124d0a00 	beq	s2,t5,4438 <_data-0x7fffbbc8>
    1c38:	4d0a0000 	0x4d0a0000
    1c3c:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1c40:	0000124d 	break	0x0,0x49
    1c44:	00124d0a 	0x124d0a
    1c48:	124d0a00 	beq	s2,t5,444c <_data-0x7fffbbb4>
    1c4c:	4d0a0000 	0x4d0a0000
    1c50:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1c54:	0000124d 	break	0x0,0x49
    1c58:	00611100 	0x611100
    1c5c:	12596701 	beq	s2,t9,1b864 <_data-0x7ffe479c>
    1c60:	01120000 	0x1120000
    1c64:	124d0b67 	beq	s2,t5,4a04 <_data-0x7fffb5fc>
    1c68:	4d0b0000 	0x4d0b0000
    1c6c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1c70:	0000124d 	break	0x0,0x49
    1c74:	00124d0b 	0x124d0b
    1c78:	124d0b00 	beq	s2,t5,487c <_data-0x7fffb784>
    1c7c:	4d0b0000 	0x4d0b0000
    1c80:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1c84:	0000124d 	break	0x0,0x49
    1c88:	00124d0b 	0x124d0b
    1c8c:	124d0b00 	beq	s2,t5,4890 <_data-0x7fffb770>
    1c90:	4d0b0000 	0x4d0b0000
    1c94:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1c98:	0000124d 	break	0x0,0x49
    1c9c:	c7100000 	lwc1	$f16,0(t8)
    1ca0:	0300000c 	syscall	0xc0000
    1ca4:	00001d24 	0x1d24
    1ca8:	00015309 	0x15309
    1cac:	001ce400 	sll	gp,gp,0x10
    1cb0:	124d0a00 	beq	s2,t5,44b4 <_data-0x7fffbb4c>
    1cb4:	4d0a0000 	0x4d0a0000
    1cb8:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1cbc:	0000124d 	break	0x0,0x49
    1cc0:	00124d0a 	0x124d0a
    1cc4:	124d0a00 	beq	s2,t5,44c8 <_data-0x7fffbb38>
    1cc8:	4d0a0000 	0x4d0a0000
    1ccc:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1cd0:	0000124d 	break	0x0,0x49
    1cd4:	00124d0a 	0x124d0a
    1cd8:	124d0a00 	beq	s2,t5,44dc <_data-0x7fffbb24>
    1cdc:	4d0a0000 	0x4d0a0000
    1ce0:	00000012 	mflo	zero
    1ce4:	01006111 	0x1006111
    1ce8:	00125967 	0x125967
    1cec:	67011200 	0x67011200
    1cf0:	00124d0b 	0x124d0b
    1cf4:	124d0b00 	beq	s2,t5,48f8 <_data-0x7fffb708>
    1cf8:	4d0b0000 	0x4d0b0000
    1cfc:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1d00:	0000124d 	break	0x0,0x49
    1d04:	00124d0b 	0x124d0b
    1d08:	124d0b00 	beq	s2,t5,490c <_data-0x7fffb6f4>
    1d0c:	4d0b0000 	0x4d0b0000
    1d10:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1d14:	0000124d 	break	0x0,0x49
    1d18:	00124d0b 	0x124d0b
    1d1c:	124d0b00 	beq	s2,t5,4920 <_data-0x7fffb6e0>
    1d20:	00000000 	nop
    1d24:	000d4a10 	0xd4a10
    1d28:	1d960300 	0x1d960300
    1d2c:	53090000 	beql	t8,t1,1d30 <_data-0x7fffe2d0>
    1d30:	60000001 	0x60000001
    1d34:	0a00001d 	j	8000074 <_data-0x77ffff8c>
    1d38:	0000124d 	break	0x0,0x49
    1d3c:	00124d0a 	0x124d0a
    1d40:	124d0a00 	beq	s2,t5,4544 <_data-0x7fffbabc>
    1d44:	4d0a0000 	0x4d0a0000
    1d48:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1d4c:	0000124d 	break	0x0,0x49
    1d50:	00124d0a 	0x124d0a
    1d54:	124d0a00 	beq	s2,t5,4558 <_data-0x7fffbaa8>
    1d58:	4d0a0000 	0x4d0a0000
    1d5c:	00000012 	mflo	zero
    1d60:	01006111 	0x1006111
    1d64:	00125967 	0x125967
    1d68:	67011200 	0x67011200
    1d6c:	00124d0b 	0x124d0b
    1d70:	124d0b00 	beq	s2,t5,4974 <_data-0x7fffb68c>
    1d74:	4d0b0000 	0x4d0b0000
    1d78:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1d7c:	0000124d 	break	0x0,0x49
    1d80:	00124d0b 	0x124d0b
    1d84:	124d0b00 	beq	s2,t5,4988 <_data-0x7fffb678>
    1d88:	4d0b0000 	0x4d0b0000
    1d8c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1d90:	0000124d 	break	0x0,0x49
    1d94:	b9100000 	swr	s0,0(t0)
    1d98:	0300000d 	break	0x300
    1d9c:	00001e94 	0x1e94
    1da0:	00015309 	0x15309
    1da4:	001e1800 	sll	v1,s8,0x0
    1da8:	124d0a00 	beq	s2,t5,45ac <_data-0x7fffba54>
    1dac:	4d0a0000 	0x4d0a0000
    1db0:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1db4:	0000124d 	break	0x0,0x49
    1db8:	00124d0a 	0x124d0a
    1dbc:	124d0a00 	beq	s2,t5,45c0 <_data-0x7fffba40>
    1dc0:	4d0a0000 	0x4d0a0000
    1dc4:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1dc8:	0000124d 	break	0x0,0x49
    1dcc:	00124d0a 	0x124d0a
    1dd0:	124d0a00 	beq	s2,t5,45d4 <_data-0x7fffba2c>
    1dd4:	4d0a0000 	0x4d0a0000
    1dd8:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1ddc:	0000124d 	break	0x0,0x49
    1de0:	00124d0a 	0x124d0a
    1de4:	124d0a00 	beq	s2,t5,45e8 <_data-0x7fffba18>
    1de8:	4d0a0000 	0x4d0a0000
    1dec:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1df0:	0000124d 	break	0x0,0x49
    1df4:	00124d0a 	0x124d0a
    1df8:	124d0a00 	beq	s2,t5,45fc <_data-0x7fffba04>
    1dfc:	4d0a0000 	0x4d0a0000
    1e00:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1e04:	0000124d 	break	0x0,0x49
    1e08:	00124d0a 	0x124d0a
    1e0c:	124d0a00 	beq	s2,t5,4610 <_data-0x7fffb9f0>
    1e10:	4d0a0000 	0x4d0a0000
    1e14:	00000012 	mflo	zero
    1e18:	01006111 	0x1006111
    1e1c:	00125967 	0x125967
    1e20:	67011200 	0x67011200
    1e24:	00124d0b 	0x124d0b
    1e28:	124d0b00 	beq	s2,t5,4a2c <_data-0x7fffb5d4>
    1e2c:	4d0b0000 	0x4d0b0000
    1e30:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1e34:	0000124d 	break	0x0,0x49
    1e38:	00124d0b 	0x124d0b
    1e3c:	124d0b00 	beq	s2,t5,4a40 <_data-0x7fffb5c0>
    1e40:	4d0b0000 	0x4d0b0000
    1e44:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1e48:	0000124d 	break	0x0,0x49
    1e4c:	00124d0b 	0x124d0b
    1e50:	124d0b00 	beq	s2,t5,4a54 <_data-0x7fffb5ac>
    1e54:	4d0b0000 	0x4d0b0000
    1e58:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1e5c:	0000124d 	break	0x0,0x49
    1e60:	00124d0b 	0x124d0b
    1e64:	124d0b00 	beq	s2,t5,4a68 <_data-0x7fffb598>
    1e68:	4d0b0000 	0x4d0b0000
    1e6c:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1e70:	0000124d 	break	0x0,0x49
    1e74:	00124d0b 	0x124d0b
    1e78:	124d0b00 	beq	s2,t5,4a7c <_data-0x7fffb584>
    1e7c:	4d0b0000 	0x4d0b0000
    1e80:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1e84:	0000124d 	break	0x0,0x49
    1e88:	00124d0b 	0x124d0b
    1e8c:	124d0b00 	beq	s2,t5,4a90 <_data-0x7fffb570>
    1e90:	00000000 	nop
    1e94:	000eb410 	0xeb410
    1e98:	1f2e0300 	0x1f2e0300
    1e9c:	53090000 	beql	t8,t1,1ea0 <_data-0x7fffe160>
    1ea0:	e4000001 	swc1	$f0,1(zero)
    1ea4:	0a00001e 	j	8000078 <_data-0x77ffff88>
    1ea8:	0000124d 	break	0x0,0x49
    1eac:	00124d0a 	0x124d0a
    1eb0:	124d0a00 	beq	s2,t5,46b4 <_data-0x7fffb94c>
    1eb4:	4d0a0000 	0x4d0a0000
    1eb8:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1ebc:	0000124d 	break	0x0,0x49
    1ec0:	00124d0a 	0x124d0a
    1ec4:	124d0a00 	beq	s2,t5,46c8 <_data-0x7fffb938>
    1ec8:	4d0a0000 	0x4d0a0000
    1ecc:	0a000012 	j	8000048 <_data-0x77ffffb8>
    1ed0:	0000124d 	break	0x0,0x49
    1ed4:	00124d0a 	0x124d0a
    1ed8:	124d0a00 	beq	s2,t5,46dc <_data-0x7fffb924>
    1edc:	4d0a0000 	0x4d0a0000
    1ee0:	00000012 	mflo	zero
    1ee4:	01006111 	0x1006111
    1ee8:	00125967 	0x125967
    1eec:	67011200 	0x67011200
    1ef0:	00124d0b 	0x124d0b
    1ef4:	124d0b00 	beq	s2,t5,4af8 <_data-0x7fffb508>
    1ef8:	4d0b0000 	0x4d0b0000
    1efc:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1f00:	0000124d 	break	0x0,0x49
    1f04:	00124d0b 	0x124d0b
    1f08:	124d0b00 	beq	s2,t5,4b0c <_data-0x7fffb4f4>
    1f0c:	4d0b0000 	0x4d0b0000
    1f10:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1f14:	0000124d 	break	0x0,0x49
    1f18:	00124d0b 	0x124d0b
    1f1c:	124d0b00 	beq	s2,t5,4b20 <_data-0x7fffb4e0>
    1f20:	4d0b0000 	0x4d0b0000
    1f24:	0b000012 	j	c000048 <_data-0x73ffffb8>
    1f28:	0000124d 	break	0x0,0x49
    1f2c:	04130000 	bgezall	zero,1f30 <_data-0x7fffe0d0>
    1f30:	00001f34 	teq	zero,zero,0x7c
    1f34:	00125414 	0x125414
    1f38:	001f4400 	sll	t0,ra,0x10
    1f3c:	00251500 	0x251500
    1f40:	000a0000 	sll	zero,t2,0x0
    1f44:	000f4b10 	0xf4b10
    1f48:	1fe30300 	0x1fe30300
    1f4c:	4e0c0000 	c3	0xc0000
    1f50:	00002500 	sll	a0,zero,0x14
    1f54:	000b0400 	sll	zero,t3,0x10
    1f58:	490d0000 	bc2t	$cc3,1f5c <_data-0x7fffe0a4>
    1f5c:	d2730100 	0xd2730100
    1f60:	0700001f 	bltz	t8,1fe0 <_data-0x7fffe020>
    1f64:	00000025 	move	zero,zero
    1f68:	00000004 	sllv	zero,zero,zero
    1f6c:	00250700 	0x250700
    1f70:	01040000 	0x1040000
    1f74:	07000000 	bltz	t8,1f78 <_data-0x7fffe088>
    1f78:	00000025 	move	zero,zero
    1f7c:	00000204 	0x204
    1f80:	00250700 	0x250700
    1f84:	03040000 	0x3040000
    1f88:	07000000 	bltz	t8,1f8c <_data-0x7fffe074>
    1f8c:	00000025 	move	zero,zero
    1f90:	00000404 	0x404
    1f94:	00250700 	0x250700
    1f98:	05040000 	0x5040000
    1f9c:	07000000 	bltz	t8,1fa0 <_data-0x7fffe060>
    1fa0:	00000025 	move	zero,zero
    1fa4:	00000604 	0x604
    1fa8:	00250700 	0x250700
    1fac:	07040000 	0x7040000
    1fb0:	07000000 	bltz	t8,1fb4 <_data-0x7fffe04c>
    1fb4:	00000025 	move	zero,zero
    1fb8:	00000804 	sllv	at,zero,zero
    1fbc:	00250700 	0x250700
    1fc0:	09040000 	j	4100000 <_data-0x7bf00000>
    1fc4:	07000000 	bltz	t8,1fc8 <_data-0x7fffe038>
    1fc8:	00000025 	move	zero,zero
    1fcc:	00000a04 	0xa04
    1fd0:	73110000 	madd	t8,s1
    1fd4:	01007274 	teq	t0,zero,0x1c9
    1fd8:	001f2e74 	teq	zero,ra,0xb9
    1fdc:	023e0b00 	0x23e0b00
    1fe0:	13000000 	beqz	t8,1fe4 <_data-0x7fffe01c>
    1fe4:	001fe904 	0x1fe904
    1fe8:	12541400 	beq	s2,s4,6fec <_data-0x7fff9014>
    1fec:	1ff90000 	0x1ff90000
    1ff0:	25150000 	addiu	s5,t0,0
    1ff4:	08000000 	j	0 <_data-0x80000000>
    1ff8:	0fe91000 	jal	fa44000 <_data-0x705bc000>
    1ffc:	84030000 	lh	v1,0(zero)
    2000:	0c000020 	jal	80 <_data-0x7fffff80>
    2004:	0025004e 	0x25004e
    2008:	09040000 	j	4100000 <_data-0x7bf00000>
    200c:	0d000000 	jal	4000000 <_data-0x7c000000>
    2010:	73010049 	0x73010049
    2014:	00002073 	tltu	zero,zero,0x81
    2018:	00002507 	0x2507
    201c:	00000400 	sll	zero,zero,0x10
    2020:	25070000 	addiu	a3,t0,0
    2024:	04000000 	bltz	zero,2028 <_data-0x7fffdfd8>
    2028:	00000001 	movf	zero,zero,$fcc0
    202c:	00002507 	0x2507
    2030:	00020400 	sll	zero,v0,0x10
    2034:	25070000 	addiu	a3,t0,0
    2038:	04000000 	bltz	zero,203c <_data-0x7fffdfc4>
    203c:	00000003 	sra	zero,zero,0x0
    2040:	00002507 	0x2507
    2044:	00040400 	sll	zero,a0,0x10
    2048:	25070000 	addiu	a3,t0,0
    204c:	04000000 	bltz	zero,2050 <_data-0x7fffdfb0>
    2050:	00000005 	0x5
    2054:	00002507 	0x2507
    2058:	00060400 	sll	zero,a2,0x10
    205c:	25070000 	addiu	a3,t0,0
    2060:	04000000 	bltz	zero,2064 <_data-0x7fffdf9c>
    2064:	00000007 	srav	zero,zero,zero
    2068:	00002507 	0x2507
    206c:	00080400 	sll	zero,t0,0x10
    2070:	11000000 	beqz	t0,2074 <_data-0x7fffdf8c>
    2074:	00727473 	tltu	v1,s2,0x1d1
    2078:	1fe37401 	0x1fe37401
    207c:	d10b0000 	0xd10b0000
    2080:	00000001 	movf	zero,zero,$fcc0
    2084:	208a0413 	addi	t2,a0,1043
    2088:	54140000 	bnel	zero,s4,208c <_data-0x7fffdf74>
    208c:	9a000012 	lwr	zero,18(s0)
    2090:	15000020 	bnez	t0,2114 <_data-0x7fffdeec>
    2094:	00000025 	move	zero,zero
    2098:	73100016 	0x73100016
    209c:	03000010 	0x3000010
    20a0:	000021b1 	tgeu	zero,zero,0x86
    20a4:	25004e0c 	addiu	zero,t0,19980
    20a8:	04000000 	bltz	zero,20ac <_data-0x7fffdf54>
    20ac:	00000017 	0x17
    20b0:	0100490d 	break	0x100,0x124
    20b4:	0021a073 	tltu	at,at,0x281
    20b8:	00250700 	0x250700
    20bc:	00040000 	sll	zero,a0,0x0
    20c0:	07000000 	bltz	t8,20c4 <_data-0x7fffdf3c>
    20c4:	00000025 	move	zero,zero
    20c8:	00000104 	0x104
    20cc:	00250700 	0x250700
    20d0:	02040000 	0x2040000
    20d4:	07000000 	bltz	t8,20d8 <_data-0x7fffdf28>
    20d8:	00000025 	move	zero,zero
    20dc:	00000304 	0x304
    20e0:	00250700 	0x250700
    20e4:	04040000 	0x4040000
    20e8:	07000000 	bltz	t8,20ec <_data-0x7fffdf14>
    20ec:	00000025 	move	zero,zero
    20f0:	00000504 	0x504
    20f4:	00250700 	0x250700
    20f8:	06040000 	0x6040000
    20fc:	07000000 	bltz	t8,2100 <_data-0x7fffdf00>
    2100:	00000025 	move	zero,zero
    2104:	00000704 	0x704
    2108:	00250700 	0x250700
    210c:	08040000 	j	100000 <_data-0x7ff00000>
    2110:	07000000 	bltz	t8,2114 <_data-0x7fffdeec>
    2114:	00000025 	move	zero,zero
    2118:	00000904 	0x904
    211c:	00250700 	0x250700
    2120:	0a040000 	j	8100000 <_data-0x77f00000>
    2124:	07000000 	bltz	t8,2128 <_data-0x7fffded8>
    2128:	00000025 	move	zero,zero
    212c:	00000b04 	0xb04
    2130:	00250700 	0x250700
    2134:	0c040000 	jal	100000 <_data-0x7ff00000>
    2138:	07000000 	bltz	t8,213c <_data-0x7fffdec4>
    213c:	00000025 	move	zero,zero
    2140:	00000d04 	0xd04
    2144:	00250700 	0x250700
    2148:	0e040000 	jal	8100000 <_data-0x77f00000>
    214c:	07000000 	bltz	t8,2150 <_data-0x7fffdeb0>
    2150:	00000025 	move	zero,zero
    2154:	00000f04 	0xf04
    2158:	00250700 	0x250700
    215c:	10040000 	beq	zero,a0,2160 <_data-0x7fffdea0>
    2160:	07000000 	bltz	t8,2164 <_data-0x7fffde9c>
    2164:	00000025 	move	zero,zero
    2168:	00001104 	0x1104
    216c:	00250700 	0x250700
    2170:	12040000 	beq	s0,a0,2174 <_data-0x7fffde8c>
    2174:	07000000 	bltz	t8,2178 <_data-0x7fffde88>
    2178:	00000025 	move	zero,zero
    217c:	00001304 	0x1304
    2180:	00250700 	0x250700
    2184:	14040000 	bne	zero,a0,2188 <_data-0x7fffde78>
    2188:	07000000 	bltz	t8,218c <_data-0x7fffde74>
    218c:	00000025 	move	zero,zero
    2190:	00001504 	0x1504
    2194:	00250700 	0x250700
    2198:	16040000 	bne	s0,a0,219c <_data-0x7fffde64>
    219c:	00000000 	nop
    21a0:	72747311 	0x72747311
    21a4:	84740100 	lh	s4,256(v1)
    21a8:	0b000020 	j	c000080 <_data-0x73ffff80>
    21ac:	000000d8 	0xd8
    21b0:	b7041300 	0xb7041300
    21b4:	14000021 	bnez	zero,223c <_data-0x7fffddc4>
    21b8:	00001254 	0x1254
    21bc:	000021c7 	0x21c7
    21c0:	00002515 	0x2515
    21c4:	10000c00 	b	51c8 <_data-0x7fffae38>
    21c8:	00001189 	0x1189
    21cc:	00227a03 	0x227a03
    21d0:	004e0c00 	0x4e0c00
    21d4:	00000025 	move	zero,zero
    21d8:	00000d04 	0xd04
    21dc:	00490d00 	0x490d00
    21e0:	22697301 	addi	t1,s3,29441
    21e4:	25070000 	addiu	a3,t0,0
    21e8:	04000000 	bltz	zero,21ec <_data-0x7fffde14>
    21ec:	00000000 	nop
    21f0:	00002507 	0x2507
    21f4:	00010400 	sll	zero,at,0x10
    21f8:	25070000 	addiu	a3,t0,0
    21fc:	04000000 	bltz	zero,2200 <_data-0x7fffde00>
    2200:	00000002 	srl	zero,zero,0x0
    2204:	00002507 	0x2507
    2208:	00030400 	sll	zero,v1,0x10
    220c:	25070000 	addiu	a3,t0,0
    2210:	04000000 	bltz	zero,2214 <_data-0x7fffddec>
    2214:	00000004 	sllv	zero,zero,zero
    2218:	00002507 	0x2507
    221c:	00050400 	sll	zero,a1,0x10
    2220:	25070000 	addiu	a3,t0,0
    2224:	04000000 	bltz	zero,2228 <_data-0x7fffddd8>
    2228:	00000006 	srlv	zero,zero,zero
    222c:	00002507 	0x2507
    2230:	00070400 	sll	zero,a3,0x10
    2234:	25070000 	addiu	a3,t0,0
    2238:	04000000 	bltz	zero,223c <_data-0x7fffddc4>
    223c:	00000008 	jr	zero
    2240:	00002507 	0x2507
    2244:	00090400 	sll	zero,t1,0x10
    2248:	25070000 	addiu	a3,t0,0
    224c:	04000000 	bltz	zero,2250 <_data-0x7fffddb0>
    2250:	0000000a 	movz	zero,zero,zero
    2254:	00002507 	0x2507
    2258:	000b0400 	sll	zero,t3,0x10
    225c:	25070000 	addiu	a3,t0,0
    2260:	04000000 	bltz	zero,2264 <_data-0x7fffdd9c>
    2264:	0000000c 	syscall
    2268:	74731100 	jalx	1cc4400 <_data-0x7e33bc00>
    226c:	74010072 	jalx	401c8 <_data-0x7ffbfe38>
    2270:	000021b1 	tgeu	zero,zero,0x86
    2274:	0000430b 	0x430b
    2278:	37160000 	ori	s6,t8,0x0
    227c:	01000005 	0x1000005
    2280:	00118b7c 	0x118b7c
    2284:	22a20300 	addi	v0,s5,768
    2288:	4e0c0000 	c3	0xc0000
    228c:	00002500 	sll	a0,zero,0x14
    2290:	000b0400 	sll	zero,t3,0x10
    2294:	73110000 	madd	t8,s1
    2298:	01007274 	teq	t0,zero,0x1c9
    229c:	001f2e7c 	0x1f2e7c
    22a0:	58160000 	0x58160000
    22a4:	01000001 	movf	zero,t0,$fcc0
    22a8:	000d897c 	0xd897c
    22ac:	22ca0300 	addi	t2,s6,768
    22b0:	4e0c0000 	c3	0xc0000
    22b4:	00002500 	sll	a0,zero,0x14
    22b8:	00090400 	sll	zero,t1,0x10
    22bc:	73110000 	madd	t8,s1
    22c0:	01007274 	teq	t0,zero,0x1c9
    22c4:	001fe37c 	0x1fe37c
    22c8:	1c160000 	0x1c160000
    22cc:	0100000e 	0x100000e
    22d0:	000dab7c 	0xdab7c
    22d4:	22f20300 	addi	s2,s7,768
    22d8:	4e0c0000 	c3	0xc0000
    22dc:	00002500 	sll	a0,zero,0x14
    22e0:	00170400 	sll	zero,s7,0x10
    22e4:	73110000 	madd	t8,s1
    22e8:	01007274 	teq	t0,zero,0x1c9
    22ec:	0020847c 	0x20847c
    22f0:	f4160000 	sdc1	$f22,0(zero)
    22f4:	01000010 	0x1000010
    22f8:	000c2f7c 	0xc2f7c
    22fc:	231a0300 	addi	k0,t8,768
    2300:	4e0c0000 	c3	0xc0000
    2304:	00002500 	sll	a0,zero,0x14
    2308:	000d0400 	sll	zero,t5,0x10
    230c:	73110000 	madd	t8,s1
    2310:	01007274 	teq	t0,zero,0x1c9
    2314:	0021b17c 	0x21b17c
    2318:	0e170000 	jal	85c0000 <_data-0x77a40000>
    231c:	02000010 	0x2000010
    2320:	003d4b03 	0x3d4b03
    2324:	00033000 	sll	a2,v1,0x0
    2328:	00029088 	0x29088
    232c:	4b9c0100 	c2	0x19c0100
    2330:	1800003d 	blez	zero,2428 <_data-0x7fffdbd8>
    2334:	000009a3 	0x9a3
    2338:	00250702 	ror	zero,a1,0x1c
    233c:	00000000 	nop
    2340:	69190000 	0x69190000
    2344:	02000002 	0x2000002
    2348:	00002507 	0x2507
    234c:	1a620100 	0x1a620100
    2350:	000022f2 	tlt	zero,zero,0x8b
    2354:	88000334 	lwl	zero,820(zero)
    2358:	00000000 	nop
    235c:	27840502 	addiu	a0,gp,1282
    2360:	0e1b0000 	jal	86c0000 <_data-0x77940000>
    2364:	06000023 	bltz	s0,23f4 <_data-0x7fffdc0c>
    2368:	003f0bf2 	tlt	at,ra,0x2f
    236c:	001c0000 	sll	zero,gp,0x0
    2370:	1d000000 	bgtz	t0,2374 <_data-0x7fffdc8c>
    2374:	000021c7 	0x21c7
    2378:	88000334 	lwl	zero,820(zero)
    237c:	00000000 	nop
    2380:	691b7f01 	0x691b7f01
    2384:	06000022 	bltz	s0,2410 <_data-0x7fffdbf0>
    2388:	003f0bf2 	tlt	at,ra,0x2f
    238c:	941d0000 	lhu	sp,0(zero)
    2390:	3400001e 	li	zero,0x1e
    2394:	00880003 	0x880003
    2398:	01000000 	0x1000000
    239c:	1f271e76 	0x1f271e76
    23a0:	1e000000 	bgtz	s0,23a4 <_data-0x7fffdc5c>
    23a4:	00001f22 	0x1f22
    23a8:	1f1d1e0a 	0x1f1d1e0a
    23ac:	1e210000 	0x1e210000
    23b0:	00001f18 	0x1f18
    23b4:	1f131e53 	0x1f131e53
    23b8:	1e500000 	0x1e500000
    23bc:	00001f0e 	0x1f0e
    23c0:	1f091e49 	0x1f091e49
    23c4:	1e4d0000 	0x1e4d0000
    23c8:	00001f04 	0x1f04
    23cc:	1eff1e20 	0x1eff1e20
    23d0:	1e6f0000 	0x1e6f0000
    23d4:	00001efa 	0x1efa
    23d8:	1ef51e6c 	0x1ef51e6c
    23dc:	1e6c0000 	0x1e6c0000
    23e0:	00001ef0 	tge	zero,zero,0x7b
    23e4:	1ee41e65 	0x1ee41e65
    23e8:	1f480000 	0x1f480000
    23ec:	00001c0e 	0x1c0e
    23f0:	88000354 	lwl	zero,852(zero)
    23f4:	00000060 	0x60
    23f8:	27706a01 	addiu	s0,k1,27137
    23fc:	971e0000 	lhu	s8,0(t8)
    2400:	0000001c 	0x1c
    2404:	001c921e 	0x1c921e
    2408:	8d1e0a00 	lw	s8,2560(t0)
    240c:	2100001c 	addi	zero,t0,28
    2410:	001c881e 	0x1c881e
    2414:	831e5300 	lb	s8,21248(t8)
    2418:	5000001c 	beqzl	zero,248c <_data-0x7fffdb74>
    241c:	001c7e1e 	0x1c7e1e
    2420:	791e4900 	0x791e4900
    2424:	4d00001c 	bc3f	2498 <_data-0x7fffdb68>
    2428:	001c741e 	0x1c741e
    242c:	6f1e2000 	0x6f1e2000
    2430:	6f00001c 	0x6f00001c
    2434:	001c6a1e 	0x1c6a1e
    2438:	651e6c00 	0x651e6c00
    243c:	6c00001c 	0x6c00001c
    2440:	001c591e 	0x1c591e
    2444:	9e1f6500 	0x9e1f6500
    2448:	5c00001c 	bgtzl	zero,24bc <_data-0x7fffdb44>
    244c:	58880003 	0x58880003
    2450:	01000000 	0x1000000
    2454:	00275f6a 	0x275f6a
    2458:	1d1d1e00 	0x1d1d1e00
    245c:	1e000000 	bgtz	s0,2460 <_data-0x7fffdba0>
    2460:	00001d18 	0x1d18
    2464:	1d131e0a 	0x1d131e0a
    2468:	1e210000 	0x1e210000
    246c:	00001d0e 	0x1d0e
    2470:	1d091e53 	0x1d091e53
    2474:	1e500000 	0x1e500000
    2478:	00001d04 	0x1d04
    247c:	1cff1e49 	0x1cff1e49
    2480:	1e4d0000 	0x1e4d0000
    2484:	00001cfa 	0x1cfa
    2488:	1cf51e20 	0x1cf51e20
    248c:	1e6f0000 	0x1e6f0000
    2490:	00001cf0 	tge	zero,zero,0x73
    2494:	1ce41e6c 	0x1ce41e6c
    2498:	1f6c0000 	0x1f6c0000
    249c:	00001a36 	tne	zero,zero,0x68
    24a0:	88000364 	lwl	zero,868(zero)
    24a4:	00000050 	0x50
    24a8:	274e6a01 	addiu	t6,k0,27137
    24ac:	ab1e0000 	swl	s8,0(t8)
    24b0:	0000001a 	div	zero,zero,zero
    24b4:	001aa61e 	0x1aa61e
    24b8:	a11e0a00 	sb	s8,2560(t0)
    24bc:	2100001a 	addi	zero,t0,26
    24c0:	001a9c1e 	0x1a9c1e
    24c4:	971e5300 	lhu	s8,21248(t8)
    24c8:	5000001a 	beqzl	zero,2534 <_data-0x7fffdacc>
    24cc:	001a921e 	0x1a921e
    24d0:	8d1e4900 	lw	s8,18688(t0)
    24d4:	4d00001a 	bc3f	2540 <_data-0x7fffdac0>
    24d8:	001a881e 	0x1a881e
    24dc:	831e2000 	lb	s8,8192(t8)
    24e0:	6f00001a 	0x6f00001a
    24e4:	001a771e 	0x1a771e
    24e8:	241f6c00 	li	ra,27648
    24ec:	6c00001d 	0x6c00001d
    24f0:	48880003 	mtc2	t0,$0,3
    24f4:	01000000 	0x1000000
    24f8:	00273d6a 	0x273d6a
    24fc:	1d8f1e00 	0x1d8f1e00
    2500:	1e000000 	bgtz	s0,2504 <_data-0x7fffdafc>
    2504:	00001d8a 	0x1d8a
    2508:	1d851e0a 	0x1d851e0a
    250c:	1e210000 	0x1e210000
    2510:	00001d80 	sll	v1,zero,0x16
    2514:	1d7b1e53 	0x1d7b1e53
    2518:	1e500000 	0x1e500000
    251c:	00001d76 	tne	zero,zero,0x75
    2520:	1d711e49 	0x1d711e49
    2524:	1e4d0000 	0x1e4d0000
    2528:	00001d6c 	0x1d6c
    252c:	1d601e20 	bgtz	t3,9db0 <_data-0x7fff6250>
    2530:	1f6f0000 	0x1f6f0000
    2534:	00001ab2 	tlt	zero,zero,0x6a
    2538:	88000374 	lwl	zero,884(zero)
    253c:	00000040 	ssnop
    2540:	272c6a01 	addiu	t4,t9,27137
    2544:	131e0000 	beq	t8,s8,2548 <_data-0x7fffdab8>
    2548:	0000001b 	divu	zero,zero,zero
    254c:	001b0e1e 	0x1b0e1e
    2550:	091e0a00 	j	4782800 <_data-0x7b87d800>
    2554:	2100001b 	addi	zero,t0,27
    2558:	001b041e 	0x1b041e
    255c:	ff1e5300 	sdc3	$30,21248(t8)
    2560:	5000001a 	beqzl	zero,25cc <_data-0x7fffda34>
    2564:	001afa1e 	0x1afa1e
    2568:	f51e4900 	sdc1	$f30,18688(t0)
    256c:	4d00001a 	bc3f	25d8 <_data-0x7fffda28>
    2570:	001ae91e 	0x1ae91e
    2574:	ee1f2000 	swc3	$31,8192(s0)
    2578:	7c000018 	0x7c000018
    257c:	38880003 	xori	t0,a0,0x3
    2580:	01000000 	0x1000000
    2584:	00271b6a 	0x271b6a
    2588:	19451e00 	0x19451e00
    258c:	1e000000 	bgtz	s0,2590 <_data-0x7fffda70>
    2590:	00001940 	sll	v1,zero,0x5
    2594:	193b1e0a 	0x193b1e0a
    2598:	1e210000 	0x1e210000
    259c:	00001936 	tne	zero,zero,0x64
    25a0:	19311e53 	0x19311e53
    25a4:	1e500000 	0x1e500000
    25a8:	0000192c 	0x192c
    25ac:	19201e49 	blez	t1,9ed4 <_data-0x7fff612c>
    25b0:	1f4d0000 	0x1f4d0000
    25b4:	000017ba 	0x17ba
    25b8:	88000384 	lwl	zero,900(zero)
    25bc:	00000030 	tge	zero,zero
    25c0:	270a6a01 	addiu	t2,t8,27137
    25c4:	071e0000 	0x71e0000
    25c8:	00000018 	mult	zero,zero
    25cc:	0018021e 	0x18021e
    25d0:	fd1e0a00 	sdc3	$30,2560(t0)
    25d4:	21000017 	addi	zero,t0,23
    25d8:	0017f81e 	0x17f81e
    25dc:	f31e5300 	0xf31e5300
    25e0:	50000017 	beqzl	zero,2640 <_data-0x7fffd9c0>
    25e4:	0017e71e 	0x17e71e
    25e8:	9a1f4900 	lwr	ra,18688(s0)
    25ec:	8c000016 	lw	zero,22(zero)
    25f0:	28880003 	slti	t0,a0,3
    25f4:	01000000 	0x1000000
    25f8:	0026f96a 	0x26f96a
    25fc:	16dd1e00 	bne	s6,sp,9e00 <_data-0x7fff6200>
    2600:	1e000000 	bgtz	s0,2604 <_data-0x7fffd9fc>
    2604:	000016d8 	0x16d8
    2608:	16d31e0a 	bne	s6,s3,9e34 <_data-0x7fff61cc>
    260c:	1e210000 	0x1e210000
    2610:	000016ce 	0x16ce
    2614:	16c21e53 	bne	s6,v0,9f64 <_data-0x7fff609c>
    2618:	1f500000 	0x1f500000
    261c:	0000158e 	0x158e
    2620:	88000394 	lwl	zero,916(zero)
    2624:	00000020 	add	zero,zero,zero
    2628:	26e86a01 	addiu	t0,s7,27137
    262c:	c71e0000 	lwc1	$f30,0(t8)
    2630:	00000015 	0x15
    2634:	0015c21e 	0x15c21e
    2638:	bd1e0a00 	cache	0x1e,2560(t0)
    263c:	21000015 	addi	zero,t0,21
    2640:	0015b11e 	0x15b11e
    2644:	961f5300 	lhu	ra,21248(s0)
    2648:	9c000014 	0x9c000014
    264c:	18880003 	0x18880003
    2650:	01000000 	0x1000000
    2654:	0026d76a 	0x26d76a
    2658:	14c51e00 	bne	a2,a1,9e5c <_data-0x7fff61a4>
    265c:	1e000000 	bgtz	s0,2660 <_data-0x7fffd9a0>
    2660:	000014c0 	sll	v0,zero,0x13
    2664:	14b41e0a 	bne	a1,s4,9e90 <_data-0x7fff6170>
    2668:	1f210000 	0x1f210000
    266c:	000013b2 	tlt	zero,zero,0x4e
    2670:	880003a4 	lwl	zero,932(zero)
    2674:	00000010 	mfhi	zero
    2678:	26c66a01 	addiu	a2,s6,27137
    267c:	d71e0000 	ldc1	$f30,0(t8)
    2680:	00000013 	mtlo	zero
    2684:	0013cb1e 	0x13cb1e
    2688:	a21f0a00 	sb	ra,2560(s0)
    268c:	ac00003d 	sw	zero,61(zero)
    2690:	08880003 	j	220000c <_data-0x7ddffff4>
    2694:	01000000 	0x1000000
    2698:	0026b66a 	0x26b66a
    269c:	3dac2000 	0x3dac2000
    26a0:	001e0000 	sll	zero,s8,0x0
    26a4:	b4210000 	0xb4210000
    26a8:	d6880003 	ldc1	$f8,3(s4)
    26ac:	2200003e 	addi	zero,s0,62
    26b0:	30015401 	andi	at,zero,0x5401
    26b4:	ac210000 	sw	at,0(at)
    26b8:	d6880003 	ldc1	$f8,3(s4)
    26bc:	2200003e 	addi	zero,s0,62
    26c0:	3a015401 	xori	at,s0,0x5401
    26c4:	a4210000 	sh	at,0(at)
    26c8:	d6880003 	ldc1	$f8,3(s4)
    26cc:	2200003e 	addi	zero,s0,62
    26d0:	08025401 	j	95004 <_data-0x7ff6affc>
    26d4:	21000021 	addi	zero,t0,33
    26d8:	8800039c 	lwl	zero,924(zero)
    26dc:	00003ed6 	0x3ed6
    26e0:	02540122 	0x2540122
    26e4:	00005308 	0x5308
    26e8:	00039421 	0x39421
    26ec:	003ed688 	0x3ed688
    26f0:	54012200 	bnel	zero,at,aef4 <_data-0x7fff510c>
    26f4:	00500802 	0x500802
    26f8:	038c2100 	0x38c2100
    26fc:	3ed68800 	0x3ed68800
    2700:	01220000 	0x1220000
    2704:	49080254 	bc2f	$cc2,3058 <_data-0x7fffcfa8>
    2708:	84210000 	lh	at,0(at)
    270c:	d6880003 	ldc1	$f8,3(s4)
    2710:	2200003e 	addi	zero,s0,62
    2714:	08025401 	j	95004 <_data-0x7ff6affc>
    2718:	2100004d 	addi	zero,t0,77
    271c:	8800037c 	lwl	zero,892(zero)
    2720:	00003ed6 	0x3ed6
    2724:	02540122 	0x2540122
    2728:	00002008 	0x2008
    272c:	00037421 	0x37421
    2730:	003ed688 	0x3ed688
    2734:	54012200 	bnel	zero,at,af38 <_data-0x7fff50c8>
    2738:	006f0802 	0x6f0802
    273c:	036c2100 	0x36c2100
    2740:	3ed68800 	0x3ed68800
    2744:	01220000 	0x1220000
    2748:	6c080254 	0x6c080254
    274c:	64210000 	0x64210000
    2750:	d6880003 	ldc1	$f8,3(s4)
    2754:	2200003e 	addi	zero,s0,62
    2758:	08025401 	j	95004 <_data-0x7ff6affc>
    275c:	2100006c 	addi	zero,t0,108
    2760:	8800035c 	lwl	zero,860(zero)
    2764:	00003ed6 	0x3ed6
    2768:	02540122 	0x2540122
    276c:	00006508 	0x6508
    2770:	00035421 	0x35421
    2774:	003ed688 	0x3ed688
    2778:	54012200 	bnel	zero,at,af7c <_data-0x7fff5084>
    277c:	00480802 	0x480802
    2780:	00000000 	nop
    2784:	003d821a 	0x3d821a
    2788:	0003bc00 	sll	s7,v1,0x10
    278c:	00001888 	0x1888
    2790:	a80a0200 	swl	t2,512(zero)
    2794:	1c000027 	bgtz	zero,2834 <_data-0x7fffd7cc>
    2798:	00000018 	mult	zero,zero
    279c:	003d9623 	0x3d9623
    27a0:	80808000 	lb	zero,-32768(a0)
    27a4:	00007ab0 	tge	zero,zero,0x1ea
    27a8:	003d521a 	0x3d521a
    27ac:	0003c000 	sll	t8,v1,0x0
    27b0:	00003088 	0x3088
    27b4:	d40c0200 	ldc1	$f12,512(zero)
    27b8:	20000027 	addi	zero,zero,39
    27bc:	00003d62 	0x3d62
    27c0:	00000032 	tlt	zero,zero
    27c4:	0000301c 	0x301c
    27c8:	3d6b2400 	0x3d6b2400
    27cc:	00450000 	0x450000
    27d0:	00000000 	nop
    27d4:	003eaf1a 	0x3eaf1a
    27d8:	0003c400 	sll	t8,v1,0x10
    27dc:	00004888 	0x4888
    27e0:	f7140200 	sdc1	$f20,512(t8)
    27e4:	1c000027 	bgtz	zero,2884 <_data-0x7fffd77c>
    27e8:	00000048 	0x48
    27ec:	003ec324 	0x3ec324
    27f0:	00006d00 	sll	t5,zero,0x14
    27f4:	1f000000 	bgtz	t8,27f8 <_data-0x7fffd808>
    27f8:	000022ca 	0x22ca
    27fc:	880003e4 	lwl	zero,996(zero)
    2800:	000000b8 	0xb8
    2804:	35270d02 	ori	a3,t1,0xd02
    2808:	e6200000 	swc1	$f0,0(s1)
    280c:	85000022 	lh	zero,34(t0)
    2810:	25000000 	addiu	zero,t0,0
    2814:	880003e4 	lwl	zero,996(zero)
    2818:	000000b8 	0xb8
    281c:	00209a26 	0x209a26
    2820:	0003e400 	sll	gp,v1,0x10
    2824:	0000b888 	0xb888
    2828:	277f0100 	addiu	ra,k1,256
    282c:	000021ab 	0x21ab
    2830:	0021a020 	add	s4,at,at
    2834:	00008500 	sll	s0,zero,0x14
    2838:	1d962600 	0x1d962600
    283c:	03e40000 	0x3e40000
    2840:	00b88800 	0xb88800
    2844:	76010000 	jalx	8040000 <_data-0x77fc0000>
    2848:	001e8d20 	0x1e8d20
    284c:	00009d00 	sll	s3,zero,0x14
    2850:	1e882000 	0x1e882000
    2854:	00b10000 	0xb10000
    2858:	83200000 	lb	zero,0(t9)
    285c:	c600001e 	lwc1	$f0,30(s0)
    2860:	20000000 	addi	zero,zero,0
    2864:	00001e7e 	0x1e7e
    2868:	000000db 	0xdb
    286c:	001e7920 	0x1e7920
    2870:	0000f000 	sll	s8,zero,0x0
    2874:	1e742000 	0x1e742000
    2878:	01050000 	0x1050000
    287c:	6f200000 	0x6f200000
    2880:	1a00001e 	blez	s0,28fc <_data-0x7fffd704>
    2884:	20000001 	addi	zero,zero,1
    2888:	00001e6a 	0x1e6a
    288c:	000000b1 	tgeu	zero,zero,0x2
    2890:	001e6520 	0x1e6520
    2894:	00012f00 	sll	a1,at,0x1c
    2898:	1e602000 	bgtz	s3,a89c <_data-0x7fff5764>
    289c:	01440000 	0x1440000
    28a0:	5b200000 	blezl	t9,28a4 <_data-0x7fffd75c>
    28a4:	f000001e 	0xf000001e
    28a8:	20000000 	addi	zero,zero,0
    28ac:	00001e56 	0x1e56
    28b0:	00000159 	0x159
    28b4:	001e5120 	0x1e5120
    28b8:	00016e00 	sll	t5,at,0x18
    28bc:	1e4c2000 	0x1e4c2000
    28c0:	01830000 	0x1830000
    28c4:	47200000 	c1	0x1200000
    28c8:	9800001e 	lwr	zero,30(zero)
    28cc:	20000001 	addi	zero,zero,1
    28d0:	00001e42 	srl	v1,zero,0x19
    28d4:	000001ad 	0x1ad
    28d8:	001e3d20 	0x1e3d20
    28dc:	0000b100 	sll	s6,zero,0x4
    28e0:	1e382000 	0x1e382000
    28e4:	01980000 	0x1980000
    28e8:	33200000 	andi	zero,t9,0x0
    28ec:	ad00001e 	sw	zero,30(t0)
    28f0:	20000001 	addi	zero,zero,1
    28f4:	00001e2e 	0x1e2e
    28f8:	000001c2 	srl	zero,zero,0x7
    28fc:	001e2920 	0x1e2920
    2900:	0001d700 	sll	k0,at,0x1c
    2904:	1e242000 	0x1e242000
    2908:	01ec0000 	0x1ec0000
    290c:	18200000 	blez	at,2910 <_data-0x7fffd6f0>
    2910:	0100001e 	0x100001e
    2914:	1f000002 	bgtz	t8,2920 <_data-0x7fffd6e0>
    2918:	00001b1a 	0x1b1a
    291c:	880003ec 	lwl	zero,1004(zero)
    2920:	000000b0 	tge	zero,zero,0x2
    2924:	35136a01 	ori	s3,t0,0x6a01
    2928:	07200000 	bltz	t9,292c <_data-0x7fffd6d4>
    292c:	1600001c 	bnez	s0,29a0 <_data-0x7fffd660>
    2930:	20000002 	addi	zero,zero,2
    2934:	00001c02 	srl	v1,zero,0x10
    2938:	0000022a 	0x22a
    293c:	001bfd20 	0x1bfd20
    2940:	00023f00 	sll	a3,v0,0x1c
    2944:	1bf82000 	0x1bf82000
    2948:	02540000 	0x2540000
    294c:	f3200000 	0xf3200000
    2950:	6900001b 	0x6900001b
    2954:	20000002 	addi	zero,zero,2
    2958:	00001bee 	0x1bee
    295c:	0000027e 	0x27e
    2960:	001be920 	0x1be920
    2964:	00029300 	sll	s2,v0,0xc
    2968:	1be42000 	0x1be42000
    296c:	022a0000 	0x22a0000
    2970:	df200000 	ldc3	$0,0(t9)
    2974:	a800001b 	swl	zero,27(zero)
    2978:	20000002 	addi	zero,zero,2
    297c:	00001bda 	0x1bda
    2980:	000002bd 	0x2bd
    2984:	001bd520 	0x1bd520
    2988:	00026900 	sll	t5,v0,0x4
    298c:	1bd02000 	0x1bd02000
    2990:	02d20000 	0x2d20000
    2994:	cb200000 	lwc2	$0,0(t9)
    2998:	e700001b 	swc1	$f0,27(t8)
    299c:	20000002 	addi	zero,zero,2
    29a0:	00001bc6 	0x1bc6
    29a4:	000002fc 	0x2fc
    29a8:	001bc120 	0x1bc120
    29ac:	00031100 	sll	v0,v1,0x4
    29b0:	1bbc2000 	0x1bbc2000
    29b4:	03260000 	0x3260000
    29b8:	b7200000 	0xb7200000
    29bc:	2a00001b 	slti	zero,s0,27
    29c0:	20000002 	addi	zero,zero,2
    29c4:	00001bb2 	tlt	zero,zero,0x6e
    29c8:	00000311 	0x311
    29cc:	001bad20 	0x1bad20
    29d0:	00032600 	sll	a0,v1,0x18
    29d4:	1ba82000 	0x1ba82000
    29d8:	033b0000 	0x33b0000
    29dc:	a3200000 	sb	zero,0(t9)
    29e0:	5000001b 	beqzl	zero,2a50 <_data-0x7fffd5b0>
    29e4:	20000003 	addi	zero,zero,3
    29e8:	00001b97 	0x1b97
    29ec:	00000365 	0x365
    29f0:	00194c1f 	0x194c1f
    29f4:	0003f400 	sll	s8,v1,0x10
    29f8:	0000a888 	0xa888
    29fc:	026a0100 	0x26a0100
    2a00:	20000035 	addi	zero,zero,53
    2a04:	00001a2f 	0x1a2f
    2a08:	0000037a 	0x37a
    2a0c:	001a2a20 	0x1a2a20
    2a10:	00038e00 	sll	s1,v1,0x18
    2a14:	1a252000 	0x1a252000
    2a18:	03a30000 	0x3a30000
    2a1c:	20200000 	addi	zero,at,0
    2a20:	b800001a 	swr	zero,26(zero)
    2a24:	20000003 	addi	zero,zero,3
    2a28:	00001a1b 	0x1a1b
    2a2c:	000003cd 	break	0x0,0xf
    2a30:	001a1620 	0x1a1620
    2a34:	0003e200 	sll	gp,v1,0x8
    2a38:	1a112000 	0x1a112000
    2a3c:	03f70000 	0x3f70000
    2a40:	0c200000 	jal	800000 <_data-0x7f800000>
    2a44:	8e00001a 	lw	zero,26(s0)
    2a48:	20000003 	addi	zero,zero,3
    2a4c:	00001a07 	0x1a07
    2a50:	0000040c 	syscall	0x10
    2a54:	001a0220 	0x1a0220
    2a58:	00042100 	sll	a0,a0,0x4
    2a5c:	19fd2000 	0x19fd2000
    2a60:	03cd0000 	0x3cd0000
    2a64:	f8200000 	sdc2	$0,0(at)
    2a68:	36000019 	ori	zero,s0,0x19
    2a6c:	20000004 	addi	zero,zero,4
    2a70:	000019f3 	tltu	zero,zero,0x67
    2a74:	0000044b 	0x44b
    2a78:	0019ee20 	0x19ee20
    2a7c:	00046000 	sll	t4,a0,0x0
    2a80:	19e92000 	0x19e92000
    2a84:	04750000 	0x4750000
    2a88:	e4200000 	swc1	$f0,0(at)
    2a8c:	8a000019 	lwl	zero,25(s0)
    2a90:	20000004 	addi	zero,zero,4
    2a94:	000019df 	0x19df
    2a98:	0000038e 	0x38e
    2a9c:	0019da20 	0x19da20
    2aa0:	00047500 	sll	t6,a0,0x14
    2aa4:	19d52000 	0x19d52000
    2aa8:	048a0000 	tlti	a0,0
    2aac:	d0200000 	0xd0200000
    2ab0:	9f000019 	0x9f000019
    2ab4:	20000004 	addi	zero,zero,4
    2ab8:	000019c4 	0x19c4
    2abc:	000004b4 	teq	zero,zero,0x12
    2ac0:	00180e1f 	0x180e1f
    2ac4:	0003fc00 	sll	ra,v1,0x10
    2ac8:	0000a088 	0xa088
    2acc:	f16a0100 	0xf16a0100
    2ad0:	20000034 	addi	zero,zero,52
    2ad4:	000018e7 	0x18e7
    2ad8:	000004c9 	0x4c9
    2adc:	0018e220 	0x18e220
    2ae0:	0004dd00 	sll	k1,a0,0x14
    2ae4:	18dd2000 	0x18dd2000
    2ae8:	04f20000 	bltzall	a3,2aec <_data-0x7fffd514>
    2aec:	d8200000 	ldc2	$0,0(at)
    2af0:	07000018 	bltz	t8,2b54 <_data-0x7fffd4ac>
    2af4:	20000005 	addi	zero,zero,5
    2af8:	000018d3 	0x18d3
    2afc:	0000051c 	0x51c
    2b00:	0018ce20 	0x18ce20
    2b04:	00053100 	sll	a2,a1,0x4
    2b08:	18c92000 	0x18c92000
    2b0c:	05460000 	0x5460000
    2b10:	c4200000 	lwc1	$f0,0(at)
    2b14:	dd000018 	ldc3	$0,24(t0)
    2b18:	20000004 	addi	zero,zero,4
    2b1c:	000018bf 	0x18bf
    2b20:	0000055b 	0x55b
    2b24:	0018ba20 	0x18ba20
    2b28:	00057000 	sll	t6,a1,0x0
    2b2c:	18b52000 	0x18b52000
    2b30:	051c0000 	0x51c0000
    2b34:	b0200000 	0xb0200000
    2b38:	85000018 	lh	zero,24(t0)
    2b3c:	20000005 	addi	zero,zero,5
    2b40:	000018ab 	0x18ab
    2b44:	0000059a 	0x59a
    2b48:	0018a620 	0x18a620
    2b4c:	0005af00 	sll	s5,a1,0x1c
    2b50:	18a12000 	0x18a12000
    2b54:	05c40000 	0x5c40000
    2b58:	9c200000 	0x9c200000
    2b5c:	d9000018 	ldc2	$0,24(t0)
    2b60:	20000005 	addi	zero,zero,5
    2b64:	00001897 	0x1897
    2b68:	000004dd 	0x4dd
    2b6c:	00189220 	0x189220
    2b70:	0005c400 	sll	t8,a1,0x10
    2b74:	188d2000 	0x188d2000
    2b78:	05d90000 	0x5d90000
    2b7c:	81200000 	lb	zero,0(t1)
    2b80:	ee000018 	swc3	$0,24(s0)
    2b84:	1f000005 	bgtz	t8,2b9c <_data-0x7fffd464>
    2b88:	000016e4 	0x16e4
    2b8c:	88000404 	lwl	zero,1028(zero)
    2b90:	00000098 	0x98
    2b94:	34e06a01 	ori	zero,a3,0x6a01
    2b98:	b3200000 	0xb3200000
    2b9c:	03000017 	0x3000017
    2ba0:	20000006 	addi	zero,zero,6
    2ba4:	000017ae 	0x17ae
    2ba8:	00000617 	0x617
    2bac:	0017a920 	0x17a920
    2bb0:	00062c00 	sll	a1,a2,0x10
    2bb4:	17a42000 	bne	sp,a0,abb8 <_data-0x7fff5448>
    2bb8:	06410000 	bgez	s2,2bbc <_data-0x7fffd444>
    2bbc:	9f200000 	0x9f200000
    2bc0:	56000017 	bnezl	s0,2c20 <_data-0x7fffd3e0>
    2bc4:	20000006 	addi	zero,zero,6
    2bc8:	0000179a 	0x179a
    2bcc:	0000066b 	0x66b
    2bd0:	00179520 	0x179520
    2bd4:	00068000 	sll	s0,a2,0x0
    2bd8:	17902000 	bne	gp,s0,abdc <_data-0x7fff5424>
    2bdc:	06170000 	0x6170000
    2be0:	8b200000 	lwl	zero,0(t9)
    2be4:	95000017 	lhu	zero,23(t0)
    2be8:	20000006 	addi	zero,zero,6
    2bec:	00001786 	0x1786
    2bf0:	000006aa 	0x6aa
    2bf4:	00178120 	0x178120
    2bf8:	00065600 	sll	t2,a2,0x18
    2bfc:	177c2000 	bne	k1,gp,ac00 <_data-0x7fff5400>
    2c00:	06bf0000 	0x6bf0000
    2c04:	77200000 	jalx	c800000 <_data-0x73800000>
    2c08:	d4000017 	ldc1	$f0,23(zero)
    2c0c:	20000006 	addi	zero,zero,6
    2c10:	00001772 	tlt	zero,zero,0x5d
    2c14:	000006e9 	0x6e9
    2c18:	00176d20 	0x176d20
    2c1c:	0006fe00 	sll	ra,a2,0x18
    2c20:	17682000 	bne	k1,t0,ac24 <_data-0x7fff53dc>
    2c24:	07130000 	bgezall	t8,2c28 <_data-0x7fffd3d8>
    2c28:	63200000 	0x63200000
    2c2c:	17000017 	bnez	t8,2c8c <_data-0x7fffd374>
    2c30:	20000006 	addi	zero,zero,6
    2c34:	0000175e 	0x175e
    2c38:	000006fe 	0x6fe
    2c3c:	00175220 	0x175220
    2c40:	00071300 	sll	v0,a3,0xc
    2c44:	15ce1f00 	bne	t6,t6,a848 <_data-0x7fff57b8>
    2c48:	040c0000 	teqi	zero,0
    2c4c:	00908800 	0x908800
    2c50:	6a010000 	0x6a010000
    2c54:	000034cf 	0x34cf
    2c58:	00169320 	0x169320
    2c5c:	00072800 	sll	a1,a3,0x0
    2c60:	168e2000 	bne	s4,t6,ac64 <_data-0x7fff539c>
    2c64:	073c0000 	0x73c0000
    2c68:	89200000 	lwl	zero,0(t1)
    2c6c:	51000016 	beqzl	t0,2cc8 <_data-0x7fffd338>
    2c70:	20000007 	addi	zero,zero,7
    2c74:	00001684 	0x1684
    2c78:	00000766 	0x766
    2c7c:	00167f20 	0x167f20
    2c80:	00077b00 	sll	t7,a3,0xc
    2c84:	167a2000 	bne	s3,k0,ac88 <_data-0x7fff5378>
    2c88:	07900000 	bltzal	gp,2c8c <_data-0x7fffd374>
    2c8c:	75200000 	jalx	4800000 <_data-0x7b800000>
    2c90:	a5000016 	sh	zero,22(t0)
    2c94:	20000007 	addi	zero,zero,7
    2c98:	00001670 	tge	zero,zero,0x59
    2c9c:	0000073c 	0x73c
    2ca0:	00166b20 	0x166b20
    2ca4:	0007ba00 	sll	s7,a3,0x8
    2ca8:	16662000 	bne	s3,a2,acac <_data-0x7fff5354>
    2cac:	07cf0000 	0x7cf0000
    2cb0:	61200000 	0x61200000
    2cb4:	7b000016 	0x7b000016
    2cb8:	20000007 	addi	zero,zero,7
    2cbc:	0000165c 	0x165c
    2cc0:	000007e4 	0x7e4
    2cc4:	00165720 	0x165720
    2cc8:	0007f900 	sll	ra,a3,0x4
    2ccc:	16522000 	bne	s2,s2,acd0 <_data-0x7fff5330>
    2cd0:	080e0000 	j	380000 <_data-0x7fc80000>
    2cd4:	4d200000 	0x4d200000
    2cd8:	23000016 	addi	zero,t8,22
    2cdc:	20000008 	addi	zero,zero,8
    2ce0:	00001648 	0x1648
    2ce4:	00000838 	0x838
    2ce8:	00164320 	0x164320
    2cec:	00073c00 	sll	a3,a3,0x10
    2cf0:	16372000 	bne	s1,s7,acf4 <_data-0x7fff530c>
    2cf4:	08230000 	j	8c0000 <_data-0x7f740000>
    2cf8:	cc1f0000 	pref	0x1f,0(zero)
    2cfc:	14000014 	bnez	zero,2d50 <_data-0x7fffd2b0>
    2d00:	88880004 	lwl	t0,4(a0)
    2d04:	01000000 	0x1000000
    2d08:	0034be6a 	0x34be6a
    2d0c:	15872000 	bne	t4,a3,ad10 <_data-0x7fff52f0>
    2d10:	084d0000 	j	1340000 <_data-0x7ecc0000>
    2d14:	82200000 	lb	zero,0(s1)
    2d18:	61000015 	0x61000015
    2d1c:	20000008 	addi	zero,zero,8
    2d20:	0000157d 	0x157d
    2d24:	00000876 	tne	zero,zero,0x21
    2d28:	00157820 	add	t7,zero,s5
    2d2c:	00088b00 	sll	s1,t0,0xc
    2d30:	15732000 	bne	t3,s3,ad34 <_data-0x7fff52cc>
    2d34:	08a00000 	j	2800000 <_data-0x7d800000>
    2d38:	6e200000 	0x6e200000
    2d3c:	b5000015 	0xb5000015
    2d40:	20000008 	addi	zero,zero,8
    2d44:	00001569 	0x1569
    2d48:	000008ca 	0x8ca
    2d4c:	00156420 	0x156420
    2d50:	00086100 	sll	t4,t0,0x4
    2d54:	155f2000 	bne	t2,ra,ad58 <_data-0x7fff52a8>
    2d58:	08df0000 	j	37c0000 <_data-0x7c840000>
    2d5c:	5a200000 	blezl	s1,2d60 <_data-0x7fffd2a0>
    2d60:	f4000015 	sdc1	$f0,21(zero)
    2d64:	20000008 	addi	zero,zero,8
    2d68:	00001555 	0x1555
    2d6c:	000008a0 	0x8a0
    2d70:	00155020 	add	t2,zero,s5
    2d74:	00090900 	sll	at,t1,0x4
    2d78:	154b2000 	bne	t2,t3,ad7c <_data-0x7fff5284>
    2d7c:	091e0000 	j	4780000 <_data-0x7b880000>
    2d80:	46200000 	add.d	$f0,$f0,$f0
    2d84:	33000015 	andi	zero,t8,0x15
    2d88:	20000009 	addi	zero,zero,9
    2d8c:	00001541 	0x1541
    2d90:	00000948 	0x948
    2d94:	00153c20 	0x153c20
    2d98:	00095d00 	sll	t3,t1,0x14
    2d9c:	15302000 	bne	t1,s0,ada0 <_data-0x7fff5260>
    2da0:	08610000 	j	1840000 <_data-0x7e7c0000>
    2da4:	de1f0000 	ldc3	$31,0(s0)
    2da8:	1c000013 	bgtz	zero,2df8 <_data-0x7fffd208>
    2dac:	80880004 	lb	t0,4(a0)
    2db0:	01000000 	0x1000000
    2db4:	0034ad6a 	0x34ad6a
    2db8:	148f2000 	bne	a0,t7,adbc <_data-0x7fff5244>
    2dbc:	09720000 	j	5c80000 <_data-0x7a380000>
    2dc0:	8a200000 	lwl	zero,0(s1)
    2dc4:	86000014 	lh	zero,20(s0)
    2dc8:	20000009 	addi	zero,zero,9
    2dcc:	00001485 	0x1485
    2dd0:	0000099b 	0x99b
    2dd4:	00148020 	add	s0,zero,s4
    2dd8:	0009b000 	sll	s6,t1,0x0
    2ddc:	147b2000 	bne	v1,k1,ade0 <_data-0x7fff5220>
    2de0:	09c50000 	j	7140000 <_data-0x78ec0000>
    2de4:	76200000 	jalx	8800000 <_data-0x77800000>
    2de8:	da000014 	ldc2	$0,20(s0)
    2dec:	20000009 	addi	zero,zero,9
    2df0:	00001471 	tgeu	zero,zero,0x51
    2df4:	000009ef 	0x9ef
    2df8:	00146c20 	0x146c20
    2dfc:	00098600 	sll	s0,t1,0x18
    2e00:	14672000 	bne	v1,a3,ae04 <_data-0x7fff51fc>
    2e04:	0a040000 	j	8100000 <_data-0x77f00000>
    2e08:	62200000 	0x62200000
    2e0c:	19000014 	blez	t0,2e60 <_data-0x7fffd1a0>
    2e10:	2000000a 	addi	zero,zero,10
    2e14:	0000145d 	0x145d
    2e18:	000009c5 	0x9c5
    2e1c:	00145820 	add	t3,zero,s4
    2e20:	000a2e00 	sll	a1,t2,0x18
    2e24:	14532000 	bne	v0,s3,ae28 <_data-0x7fff51d8>
    2e28:	0a430000 	j	90c0000 <_data-0x76f40000>
    2e2c:	4e200000 	c3	0x200000
    2e30:	58000014 	blezl	zero,2e84 <_data-0x7fffd17c>
    2e34:	2000000a 	addi	zero,zero,10
    2e38:	00001449 	0x1449
    2e3c:	00000a6d 	0xa6d
    2e40:	00143d20 	0x143d20
    2e44:	000a8200 	sll	s0,t2,0x8
    2e48:	13041f00 	beq	t8,a0,aa4c <_data-0x7fff55b4>
    2e4c:	04240000 	0x4240000
    2e50:	00788800 	0x788800
    2e54:	6a010000 	0x6a010000
    2e58:	0000349c 	0x349c
    2e5c:	0013ab20 	0x13ab20
    2e60:	000a9700 	sll	s2,t2,0x1c
    2e64:	13a62000 	beq	sp,a2,ae68 <_data-0x7fff5198>
    2e68:	0aab0000 	j	aac0000 <_data-0x75540000>
    2e6c:	a1200000 	sb	zero,0(t1)
    2e70:	c0000013 	ll	zero,19(zero)
    2e74:	2000000a 	addi	zero,zero,10
    2e78:	0000139c 	0x139c
    2e7c:	00000ad5 	0xad5
    2e80:	00139720 	0x139720
    2e84:	000aea00 	sll	sp,t2,0x8
    2e88:	13922000 	beq	gp,s2,ae8c <_data-0x7fff5174>
    2e8c:	0aff0000 	j	bfc0000 <_data-0x74040000>
    2e90:	8d200000 	lw	zero,0(t1)
    2e94:	14000013 	bnez	zero,2ee4 <_data-0x7fffd11c>
    2e98:	2000000b 	addi	zero,zero,11
    2e9c:	00001388 	0x1388
    2ea0:	00000aab 	0xaab
    2ea4:	00138320 	0x138320
    2ea8:	000b2900 	sll	a1,t3,0x4
    2eac:	137e2000 	beq	k1,s8,aeb0 <_data-0x7fff5150>
    2eb0:	0b3e0000 	j	cf80000 <_data-0x73080000>
    2eb4:	79200000 	0x79200000
    2eb8:	ea000013 	swc2	$0,19(s0)
    2ebc:	2000000a 	addi	zero,zero,10
    2ec0:	00001374 	teq	zero,zero,0x4d
    2ec4:	00000b53 	0xb53
    2ec8:	00136f20 	0x136f20
    2ecc:	000b6800 	sll	t5,t3,0x0
    2ed0:	136a2000 	beq	k1,t2,aed4 <_data-0x7fff512c>
    2ed4:	0b7d0000 	j	df40000 <_data-0x720c0000>
    2ed8:	5e200000 	bgtzl	s1,2edc <_data-0x7fffd124>
    2edc:	92000013 	lbu	zero,19(s0)
    2ee0:	1f00000b 	bgtz	t8,2f10 <_data-0x7fffd0f0>
    2ee4:	00001260 	0x1260
    2ee8:	8800042c 	lwl	zero,1068(zero)
    2eec:	00000070 	tge	zero,zero,0x1
    2ef0:	348b6a01 	ori	t3,a0,0x6a01
    2ef4:	fd200000 	sdc3	$0,0(t1)
    2ef8:	a7000012 	sh	zero,18(t8)
    2efc:	2000000b 	addi	zero,zero,11
    2f00:	000012f8 	0x12f8
    2f04:	00000bbb 	0xbbb
    2f08:	0012f320 	0x12f320
    2f0c:	000bd000 	sll	k0,t3,0x0
    2f10:	12ee2000 	beq	s7,t6,af14 <_data-0x7fff50ec>
    2f14:	0be50000 	j	f940000 <_data-0x706c0000>
    2f18:	e9200000 	swc2	$0,0(t1)
    2f1c:	fa000012 	sdc2	$0,18(s0)
    2f20:	2000000b 	addi	zero,zero,11
    2f24:	000012e4 	0x12e4
    2f28:	00000c0f 	0xc0f
    2f2c:	0012df20 	0x12df20
    2f30:	000c2400 	sll	a0,t4,0x10
    2f34:	12da2000 	beq	s6,k0,af38 <_data-0x7fff50c8>
    2f38:	0bbb0000 	j	eec0000 <_data-0x71140000>
    2f3c:	d5200000 	ldc1	$f0,0(t1)
    2f40:	39000012 	xori	zero,t0,0x12
    2f44:	2000000c 	addi	zero,zero,12
    2f48:	000012d0 	0x12d0
    2f4c:	00000c4e 	0xc4e
    2f50:	0012cb20 	0x12cb20
    2f54:	000bfa00 	sll	ra,t3,0x8
    2f58:	12c62000 	beq	s6,a2,af5c <_data-0x7fff50a4>
    2f5c:	0c630000 	jal	18c0000 <_data-0x7e740000>
    2f60:	c1200000 	ll	zero,0(t1)
    2f64:	78000012 	0x78000012
    2f68:	2000000c 	addi	zero,zero,12
    2f6c:	000012b5 	0x12b5
    2f70:	00000c8d 	break	0x0,0x32
    2f74:	001e941f 	0x1e941f
    2f78:	00043400 	sll	a2,a0,0x10
    2f7c:	00006888 	0x6888
    2f80:	7a6a0100 	0x7a6a0100
    2f84:	20000034 	addi	zero,zero,52
    2f88:	00001f27 	0x1f27
    2f8c:	00000ca2 	0xca2
    2f90:	001f2220 	0x1f2220
    2f94:	000cb600 	sll	s6,t4,0x18
    2f98:	1f1d2000 	0x1f1d2000
    2f9c:	0ccb0000 	jal	32c0000 <_data-0x7cd40000>
    2fa0:	18200000 	blez	at,2fa4 <_data-0x7fffd05c>
    2fa4:	e000001f 	sc	zero,31(zero)
    2fa8:	2000000c 	addi	zero,zero,12
    2fac:	00001f13 	0x1f13
    2fb0:	00000cf5 	0xcf5
    2fb4:	001f0e20 	0x1f0e20
    2fb8:	000d0a00 	sll	at,t5,0x8
    2fbc:	1f092000 	0x1f092000
    2fc0:	0d1f0000 	jal	47c0000 <_data-0x7b840000>
    2fc4:	04200000 	bltz	at,2fc8 <_data-0x7fffd038>
    2fc8:	b600001f 	0xb600001f
    2fcc:	2000000c 	addi	zero,zero,12
    2fd0:	00001eff 	0x1eff
    2fd4:	00000d34 	teq	zero,zero,0x34
    2fd8:	001efa20 	0x1efa20
    2fdc:	000d4900 	sll	t1,t5,0x4
    2fe0:	1ef52000 	0x1ef52000
    2fe4:	0cf50000 	jal	3d40000 <_data-0x7c2c0000>
    2fe8:	f0200000 	0xf0200000
    2fec:	5e00001e 	bgtzl	s0,3068 <_data-0x7fffcf98>
    2ff0:	2000000d 	addi	zero,zero,13
    2ff4:	00001ee4 	0x1ee4
    2ff8:	00000d73 	tltu	zero,zero,0x35
    2ffc:	001c0e1f 	0x1c0e1f
    3000:	00043c00 	sll	a3,a0,0x10
    3004:	00006088 	0x6088
    3008:	696a0100 	0x696a0100
    300c:	20000034 	addi	zero,zero,52
    3010:	00001c97 	0x1c97
    3014:	00000d88 	0xd88
    3018:	001c9220 	0x1c9220
    301c:	000d9c00 	sll	s3,t5,0x10
    3020:	1c8d2000 	0x1c8d2000
    3024:	0db10000 	jal	6c40000 <_data-0x793c0000>
    3028:	88200000 	lwl	zero,0(at)
    302c:	c600001c 	lwc1	$f0,28(s0)
    3030:	2000000d 	addi	zero,zero,13
    3034:	00001c83 	sra	v1,zero,0x12
    3038:	00000ddb 	0xddb
    303c:	001c7e20 	0x1c7e20
    3040:	000df000 	sll	s8,t5,0x0
    3044:	1c792000 	0x1c792000
    3048:	0e050000 	jal	8140000 <_data-0x77ec0000>
    304c:	74200000 	jalx	800000 <_data-0x7f800000>
    3050:	9c00001c 	0x9c00001c
    3054:	2000000d 	addi	zero,zero,13
    3058:	00001c6f 	0x1c6f
    305c:	00000e1a 	0xe1a
    3060:	001c6a20 	0x1c6a20
    3064:	000e2f00 	sll	a1,t6,0x1c
    3068:	1c652000 	0x1c652000
    306c:	0ddb0000 	jal	76c0000 <_data-0x78940000>
    3070:	59200000 	blezl	t1,3074 <_data-0x7fffcf8c>
    3074:	4400001c 	0x4400001c
    3078:	1f00000e 	bgtz	t8,30b4 <_data-0x7fffcf4c>
    307c:	00001c9e 	0x1c9e
    3080:	88000444 	lwl	zero,1092(zero)
    3084:	00000058 	0x58
    3088:	34586a01 	ori	t8,v0,0x6a01
    308c:	1d200000 	bgtz	t1,3090 <_data-0x7fffcf70>
    3090:	5900001d 	blezl	t0,3108 <_data-0x7fffcef8>
    3094:	2000000e 	addi	zero,zero,14
    3098:	00001d18 	0x1d18
    309c:	00000e6d 	0xe6d
    30a0:	001d1320 	0x1d1320
    30a4:	000e8200 	sll	s0,t6,0x8
    30a8:	1d0e2000 	0x1d0e2000
    30ac:	0e970000 	jal	a5c0000 <_data-0x75a40000>
    30b0:	09200000 	j	4800000 <_data-0x7b800000>
    30b4:	ac00001d 	sw	zero,29(zero)
    30b8:	2000000e 	addi	zero,zero,14
    30bc:	00001d04 	0x1d04
    30c0:	00000ec1 	0xec1
    30c4:	001cff20 	0x1cff20
    30c8:	000ed600 	sll	k0,t6,0x18
    30cc:	1cfa2000 	0x1cfa2000
    30d0:	0e6d0000 	jal	9b40000 <_data-0x764c0000>
    30d4:	f5200000 	sdc1	$f0,0(t1)
    30d8:	eb00001c 	swc2	$0,28(t8)
    30dc:	2000000e 	addi	zero,zero,14
    30e0:	00001cf0 	tge	zero,zero,0x73
    30e4:	00000f00 	sll	at,zero,0x1c
    30e8:	001ce420 	0x1ce420
    30ec:	000eac00 	sll	s5,t6,0x10
    30f0:	1a361f00 	0x1a361f00
    30f4:	044c0000 	teqi	v0,0
    30f8:	00508800 	0x508800
    30fc:	6a010000 	0x6a010000
    3100:	00003447 	0x3447
    3104:	001aab20 	0x1aab20
    3108:	000f1500 	sll	v0,t7,0x14
    310c:	1aa62000 	0x1aa62000
    3110:	0f290000 	jal	ca40000 <_data-0x735c0000>
    3114:	a1200000 	sb	zero,0(t1)
    3118:	3e00001a 	0x3e00001a
    311c:	2000000f 	addi	zero,zero,15
    3120:	00001a9c 	0x1a9c
    3124:	00000f53 	0xf53
    3128:	001a9720 	0x1a9720
    312c:	000f6800 	sll	t5,t7,0x0
    3130:	1a922000 	0x1a922000
    3134:	0f7d0000 	jal	df40000 <_data-0x720c0000>
    3138:	8d200000 	lw	zero,0(t1)
    313c:	9200001a 	lbu	zero,26(s0)
    3140:	2000000f 	addi	zero,zero,15
    3144:	00001a88 	0x1a88
    3148:	00000f29 	0xf29
    314c:	001a8320 	0x1a8320
    3150:	000fa700 	sll	s4,t7,0x1c
    3154:	1a772000 	0x1a772000
    3158:	0fbc0000 	jal	ef00000 <_data-0x71100000>
    315c:	241f0000 	li	ra,0
    3160:	5400001d 	bnezl	zero,31d8 <_data-0x7fffce28>
    3164:	48880004 	mtc2	t0,$0,4
    3168:	01000000 	0x1000000
    316c:	0034366a 	0x34366a
    3170:	1d8f2000 	0x1d8f2000
    3174:	0fd10000 	jal	f440000 <_data-0x70bc0000>
    3178:	8a200000 	lwl	zero,0(s1)
    317c:	e500001d 	swc1	$f0,29(t0)
    3180:	2000000f 	addi	zero,zero,15
    3184:	00001d85 	0x1d85
    3188:	00000ffa 	0xffa
    318c:	001d8020 	add	s0,zero,sp
    3190:	00100f00 	sll	at,s0,0x1c
    3194:	1d7b2000 	0x1d7b2000
    3198:	10240000 	beq	at,a0,319c <_data-0x7fffce64>
    319c:	76200000 	jalx	8800000 <_data-0x77800000>
    31a0:	3900001d 	xori	zero,t0,0x1d
    31a4:	20000010 	addi	zero,zero,16
    31a8:	00001d71 	tgeu	zero,zero,0x75
    31ac:	0000104e 	0x104e
    31b0:	001d6c20 	0x1d6c20
    31b4:	000fe500 	sll	gp,t7,0x14
    31b8:	1d602000 	bgtz	t3,b1bc <_data-0x7fff4e44>
    31bc:	10630000 	beq	v1,v1,31c0 <_data-0x7fffce40>
    31c0:	b21f0000 	0xb21f0000
    31c4:	5c00001a 	bgtzl	zero,3230 <_data-0x7fffcdd0>
    31c8:	40880004 	mtc0	t0,$0,4
    31cc:	01000000 	0x1000000
    31d0:	0034256a 	0x34256a
    31d4:	1b132000 	0x1b132000
    31d8:	10780000 	beq	v1,t8,31dc <_data-0x7fffce24>
    31dc:	0e200000 	jal	8800000 <_data-0x77800000>
    31e0:	8c00001b 	lw	zero,27(zero)
    31e4:	20000010 	addi	zero,zero,16
    31e8:	00001b09 	0x1b09
    31ec:	000010a1 	0x10a1
    31f0:	001b0420 	0x1b0420
    31f4:	0010b600 	sll	s6,s0,0x18
    31f8:	1aff2000 	0x1aff2000
    31fc:	10cb0000 	beq	a2,t3,3200 <_data-0x7fffce00>
    3200:	fa200000 	sdc2	$0,0(s1)
    3204:	e000001a 	sc	zero,26(zero)
    3208:	20000010 	addi	zero,zero,16
    320c:	00001af5 	0x1af5
    3210:	000010f5 	0x10f5
    3214:	001ae920 	0x1ae920
    3218:	00108c00 	sll	s1,s0,0x10
    321c:	18ee1f00 	0x18ee1f00
    3220:	04640000 	0x4640000
    3224:	00388800 	0x388800
    3228:	6a010000 	0x6a010000
    322c:	00003414 	0x3414
    3230:	00194520 	0x194520
    3234:	00110a00 	sll	at,s1,0x8
    3238:	19402000 	blez	t2,b23c <_data-0x7fff4dc4>
    323c:	111e0000 	beq	t0,s8,3240 <_data-0x7fffcdc0>
    3240:	3b200000 	xori	zero,t9,0x0
    3244:	33000019 	andi	zero,t8,0x19
    3248:	20000011 	addi	zero,zero,17
    324c:	00001936 	tne	zero,zero,0x64
    3250:	00001148 	0x1148
    3254:	00193120 	0x193120
    3258:	00115d00 	sll	t3,s1,0x14
    325c:	192c2000 	0x192c2000
    3260:	11720000 	beq	t3,s2,3264 <_data-0x7fffcd9c>
    3264:	20200000 	addi	zero,at,0
    3268:	87000019 	lh	zero,25(t8)
    326c:	1f000011 	bgtz	t8,32b4 <_data-0x7fffcd4c>
    3270:	000017ba 	0x17ba
    3274:	8800046c 	lwl	zero,1132(zero)
    3278:	00000030 	tge	zero,zero
    327c:	34036a01 	li	v1,0x6a01
    3280:	07200000 	bltz	t9,3284 <_data-0x7fffcd7c>
    3284:	9c000018 	0x9c000018
    3288:	20000011 	addi	zero,zero,17
    328c:	00001802 	srl	v1,zero,0x0
    3290:	000011b0 	tge	zero,zero,0x46
    3294:	0017fd20 	0x17fd20
    3298:	0011c500 	sll	t8,s1,0x14
    329c:	17f82000 	bne	ra,t8,b2a0 <_data-0x7fff4d60>
    32a0:	11da0000 	beq	t6,k0,32a4 <_data-0x7fffcd5c>
    32a4:	f3200000 	0xf3200000
    32a8:	ef000017 	swc3	$0,23(t8)
    32ac:	20000011 	addi	zero,zero,17
    32b0:	000017e7 	0x17e7
    32b4:	00001204 	0x1204
    32b8:	00169a1f 	0x169a1f
    32bc:	00047400 	sll	t6,a0,0x10
    32c0:	00002888 	0x2888
    32c4:	f26a0100 	0xf26a0100
    32c8:	20000033 	addi	zero,zero,51
    32cc:	000016dd 	0x16dd
    32d0:	00001219 	0x1219
    32d4:	0016d820 	add	k1,zero,s6
    32d8:	00122d00 	sll	a1,s2,0x14
    32dc:	16d32000 	bne	s6,s3,b2e0 <_data-0x7fff4d20>
    32e0:	12420000 	beq	s2,v0,32e4 <_data-0x7fffcd1c>
    32e4:	ce200000 	pref	0x0,0(s1)
    32e8:	57000016 	bnezl	t8,3344 <_data-0x7fffccbc>
    32ec:	20000012 	addi	zero,zero,18
    32f0:	000016c2 	srl	v0,zero,0x1b
    32f4:	0000126c 	0x126c
    32f8:	00158e1f 	0x158e1f
    32fc:	00047c00 	sll	t7,a0,0x10
    3300:	00002088 	0x2088
    3304:	e16a0100 	sc	t2,256(t3)
    3308:	20000033 	addi	zero,zero,51
    330c:	000015c7 	0x15c7
    3310:	00001281 	0x1281
    3314:	0015c220 	0x15c220
    3318:	00129500 	sll	s2,s2,0x14
    331c:	15bd2000 	bne	t5,sp,b320 <_data-0x7fff4ce0>
    3320:	12aa0000 	beq	s5,t2,3324 <_data-0x7fffccdc>
    3324:	b1200000 	0xb1200000
    3328:	bf000015 	cache	0x0,21(t8)
    332c:	1f000012 	bgtz	t8,3378 <_data-0x7fffcc88>
    3330:	00001496 	0x1496
    3334:	88000484 	lwl	zero,1156(zero)
    3338:	00000018 	mult	zero,zero
    333c:	33d06a01 	andi	s0,s8,0x6a01
    3340:	c5200000 	lwc1	$f0,0(t1)
    3344:	d4000014 	ldc1	$f0,20(zero)
    3348:	20000012 	addi	zero,zero,18
    334c:	000014c0 	sll	v0,zero,0x13
    3350:	000012e8 	0x12e8
    3354:	0014b420 	0x14b420
    3358:	0012fd00 	sll	ra,s2,0x14
    335c:	13b21f00 	beq	sp,s2,af60 <_data-0x7fff50a0>
    3360:	048c0000 	teqi	a0,0
    3364:	00108800 	sll	s1,s0,0x0
    3368:	6a010000 	0x6a010000
    336c:	000033bf 	0x33bf
    3370:	0013d720 	0x13d720
    3374:	00131200 	sll	v0,s3,0x8
    3378:	13cb2000 	beq	s8,t3,b37c <_data-0x7fff4c84>
    337c:	13260000 	beq	t9,a2,3380 <_data-0x7fffcc80>
    3380:	a21f0000 	sb	ra,0(s0)
    3384:	9400003d 	lhu	zero,61(zero)
    3388:	08880004 	j	2200010 <_data-0x7ddffff0>
    338c:	01000000 	0x1000000
    3390:	0033ae6a 	0x33ae6a
    3394:	3dac2000 	0x3dac2000
    3398:	133b0000 	beq	t9,k1,339c <_data-0x7fffcc64>
    339c:	9c210000 	0x9c210000
    33a0:	d6880004 	ldc1	$f8,4(s4)
    33a4:	2200003e 	addi	zero,s0,62
    33a8:	30015401 	andi	at,zero,0x5401
    33ac:	94210000 	lhu	at,0(at)
    33b0:	d6880004 	ldc1	$f8,4(s4)
    33b4:	2200003e 	addi	zero,s0,62
    33b8:	08025401 	j	95004 <_data-0x7ff6affc>
    33bc:	21000020 	addi	zero,t0,32
    33c0:	8800048c 	lwl	zero,1164(zero)
    33c4:	00003ed6 	0x3ed6
    33c8:	02540122 	0x2540122
    33cc:	00005d08 	0x5d08
    33d0:	00048421 	0x48421
    33d4:	003ed688 	0x3ed688
    33d8:	54012200 	bnel	zero,at,bbdc <_data-0x7fff4424>
    33dc:	00780802 	0x780802
    33e0:	047c2100 	0x47c2100
    33e4:	3ed68800 	0x3ed68800
    33e8:	01220000 	0x1220000
    33ec:	65080254 	0x65080254
    33f0:	74210000 	jalx	840000 <_data-0x7f7c0000>
    33f4:	d6880004 	ldc1	$f8,4(s4)
    33f8:	2200003e 	addi	zero,s0,62
    33fc:	08025401 	j	95004 <_data-0x7ff6affc>
    3400:	21000048 	addi	zero,t0,72
    3404:	8800046c 	lwl	zero,1132(zero)
    3408:	00003ed6 	0x3ed6
    340c:	02540122 	0x2540122
    3410:	00005b08 	0x5b08
    3414:	00046421 	0x46421
    3418:	003ed688 	0x3ed688
    341c:	54012200 	bnel	zero,at,bc20 <_data-0x7fff43e0>
    3420:	00200802 	ror	at,zero,0x0
    3424:	045c2100 	0x45c2100
    3428:	3ed68800 	0x3ed68800
    342c:	01220000 	0x1220000
    3430:	3a080254 	xori	t0,s0,0x254
    3434:	54210000 	bnel	at,at,3438 <_data-0x7fffcbc8>
    3438:	d6880004 	ldc1	$f8,4(s4)
    343c:	2200003e 	addi	zero,s0,62
    3440:	08025401 	j	95004 <_data-0x7ff6affc>
    3444:	21000064 	addi	zero,t0,100
    3448:	8800044c 	lwl	zero,1100(zero)
    344c:	00003ed6 	0x3ed6
    3450:	02540122 	0x2540122
    3454:	00006508 	0x6508
    3458:	00044421 	0x44421
    345c:	003ed688 	0x3ed688
    3460:	54012200 	bnel	zero,at,bc64 <_data-0x7fff439c>
    3464:	00670802 	0x670802
    3468:	043c2100 	0x43c2100
    346c:	3ed68800 	0x3ed68800
    3470:	01220000 	0x1220000
    3474:	6e080254 	0x6e080254
    3478:	34210000 	ori	at,at,0x0
    347c:	d6880004 	ldc1	$f8,4(s4)
    3480:	2200003e 	addi	zero,s0,62
    3484:	08025401 	j	95004 <_data-0x7ff6affc>
    3488:	21000061 	addi	zero,t0,97
    348c:	8800042c 	lwl	zero,1068(zero)
    3490:	00003ed6 	0x3ed6
    3494:	02540122 	0x2540122
    3498:	00006808 	0x6808
    349c:	00042421 	0x42421
    34a0:	003ed688 	0x3ed688
    34a4:	54012200 	bnel	zero,at,bca8 <_data-0x7fff4358>
    34a8:	00630802 	0x630802
    34ac:	041c2100 	0x41c2100
    34b0:	3ed68800 	0x3ed68800
    34b4:	01220000 	0x1220000
    34b8:	20080254 	addi	t0,zero,596
    34bc:	14210000 	bne	at,at,34c0 <_data-0x7fffcb40>
    34c0:	d6880004 	ldc1	$f8,4(s4)
    34c4:	2200003e 	addi	zero,s0,62
    34c8:	08025401 	j	95004 <_data-0x7ff6affc>
    34cc:	21000068 	addi	zero,t0,104
    34d0:	8800040c 	lwl	zero,1036(zero)
    34d4:	00003ed6 	0x3ed6
    34d8:	02540122 	0x2540122
    34dc:	00006308 	0x6308
    34e0:	00040421 	0x40421
    34e4:	003ed688 	0x3ed688
    34e8:	54012200 	bnel	zero,at,bcec <_data-0x7fff4314>
    34ec:	00740802 	0x740802
    34f0:	03fc2100 	0x3fc2100
    34f4:	3ed68800 	0x3ed68800
    34f8:	01220000 	0x1220000
    34fc:	69080254 	0x69080254
    3500:	f4210000 	sdc1	$f1,0(at)
    3504:	d6880003 	ldc1	$f8,3(s4)
    3508:	2200003e 	addi	zero,s0,62
    350c:	08025401 	j	95004 <_data-0x7ff6affc>
    3510:	21000077 	addi	zero,t0,119
    3514:	880003ec 	lwl	zero,1004(zero)
    3518:	00003ed6 	0x3ed6
    351c:	02540122 	0x2540122
    3520:	00005308 	0x5308
    3524:	1f000000 	bgtz	t8,3528 <_data-0x7fffcad8>
    3528:	00003d82 	srl	a3,zero,0x16
    352c:	8800049c 	lwl	zero,1180(zero)
    3530:	00000004 	sllv	zero,zero,zero
    3534:	354e0e02 	ori	t6,t2,0xe02
    3538:	9c250000 	0x9c250000
    353c:	04880004 	tgei	a0,4
    3540:	24000000 	li	zero,0
    3544:	00003d96 	0x3d96
    3548:	0000134f 	0x134f
    354c:	a21f0000 	sb	ra,0(s0)
    3550:	a8000022 	swl	zero,34(zero)
    3554:	48880004 	mtc2	t0,$0,4
    3558:	02000000 	0x2000000
    355c:	0038620f 	0x38620f
    3560:	22be2000 	addi	s8,s5,8192
    3564:	13770000 	beq	k1,s7,3568 <_data-0x7fffca98>
    3568:	a8250000 	swl	a1,0(at)
    356c:	48880004 	mtc2	t0,$0,4
    3570:	26000000 	addiu	zero,s0,0
    3574:	00001ff9 	0x1ff9
    3578:	880004a8 	lwl	zero,1192(zero)
    357c:	00000048 	0x48
    3580:	73207f01 	0x73207f01
    3584:	77000020 	jalx	c000080 <_data-0x73ffff80>
    3588:	26000013 	addiu	zero,s0,19
    358c:	00001d24 	0x1d24
    3590:	880004a8 	lwl	zero,1192(zero)
    3594:	00000048 	0x48
    3598:	8f207601 	lw	zero,30209(t9)
    359c:	8f00001d 	lw	zero,29(t8)
    35a0:	20000013 	addi	zero,zero,19
    35a4:	00001d8a 	0x1d8a
    35a8:	000013a3 	0x13a3
    35ac:	001d8520 	0x1d8520
    35b0:	0013b800 	sll	s7,s3,0x0
    35b4:	1d802000 	bgtz	t4,b5b8 <_data-0x7fff4a48>
    35b8:	13cd0000 	beq	s8,t5,35bc <_data-0x7fffca44>
    35bc:	7b200000 	0x7b200000
    35c0:	e200001d 	sc	zero,29(s0)
    35c4:	20000013 	addi	zero,zero,19
    35c8:	00001d76 	tne	zero,zero,0x75
    35cc:	000013f7 	0x13f7
    35d0:	001d7120 	0x1d7120
    35d4:	00140c00 	sll	at,s4,0x10
    35d8:	1d6c2000 	0x1d6c2000
    35dc:	13a30000 	beq	sp,v1,35e0 <_data-0x7fffca20>
    35e0:	60200000 	0x60200000
    35e4:	2100001d 	addi	zero,t0,29
    35e8:	1f000014 	bgtz	t8,363c <_data-0x7fffc9c4>
    35ec:	00001ab2 	tlt	zero,zero,0x6a
    35f0:	880004b0 	lwl	zero,1200(zero)
    35f4:	00000040 	ssnop
    35f8:	384e6a01 	xori	t6,v0,0x6a01
    35fc:	13200000 	beqz	t9,3600 <_data-0x7fffca00>
    3600:	3600001b 	ori	zero,s0,0x1b
    3604:	20000014 	addi	zero,zero,20
    3608:	00001b0e 	0x1b0e
    360c:	0000144a 	0x144a
    3610:	001b0920 	0x1b0920
    3614:	00145f00 	sll	t3,s4,0x1c
    3618:	1b042000 	0x1b042000
    361c:	14740000 	bne	v1,s4,3620 <_data-0x7fffc9e0>
    3620:	ff200000 	sdc3	$0,0(t9)
    3624:	8900001a 	lwl	zero,26(t0)
    3628:	20000014 	addi	zero,zero,20
    362c:	00001afa 	0x1afa
    3630:	0000149e 	0x149e
    3634:	001af520 	0x1af520
    3638:	0014b300 	sll	s6,s4,0xc
    363c:	1ae92000 	0x1ae92000
    3640:	144a0000 	bne	v0,t2,3644 <_data-0x7fffc9bc>
    3644:	ee1f0000 	swc3	$31,0(s0)
    3648:	b8000018 	swr	zero,24(zero)
    364c:	38880004 	xori	t0,a0,0x4
    3650:	01000000 	0x1000000
    3654:	00383d6a 	0x383d6a
    3658:	19452000 	0x19452000
    365c:	14c80000 	bne	a2,t0,3660 <_data-0x7fffc9a0>
    3660:	40200000 	0x40200000
    3664:	dc000019 	ldc3	$0,25(zero)
    3668:	20000014 	addi	zero,zero,20
    366c:	0000193b 	0x193b
    3670:	000014f1 	tgeu	zero,zero,0x53
    3674:	00193620 	0x193620
    3678:	00150600 	sll	zero,s5,0x18
    367c:	19312000 	0x19312000
    3680:	151b0000 	bne	t0,k1,3684 <_data-0x7fffc97c>
    3684:	2c200000 	sltiu	zero,at,0
    3688:	30000019 	andi	zero,zero,0x19
    368c:	20000015 	addi	zero,zero,21
    3690:	00001920 	0x1920
    3694:	00001545 	0x1545
    3698:	0017ba1f 	0x17ba1f
    369c:	0004c000 	sll	t8,a0,0x0
    36a0:	00003088 	0x3088
    36a4:	2c6a0100 	sltiu	t2,v1,256
    36a8:	20000038 	addi	zero,zero,56
    36ac:	00001807 	srav	v1,zero,zero
    36b0:	0000155a 	0x155a
    36b4:	00180220 	0x180220
    36b8:	00156e00 	sll	t5,s5,0x18
    36bc:	17fd2000 	bne	ra,sp,b6c0 <_data-0x7fff4940>
    36c0:	15830000 	bne	t4,v1,36c4 <_data-0x7fffc93c>
    36c4:	f8200000 	sdc2	$0,0(at)
    36c8:	98000017 	lwr	zero,23(zero)
    36cc:	20000015 	addi	zero,zero,21
    36d0:	000017f3 	tltu	zero,zero,0x5f
    36d4:	000015ad 	0x15ad
    36d8:	0017e720 	0x17e720
    36dc:	0015c200 	sll	t8,s5,0x8
    36e0:	169a1f00 	bne	s4,k0,b2e4 <_data-0x7fff4d1c>
    36e4:	04c80000 	tgei	a2,0
    36e8:	00288800 	0x288800
    36ec:	6a010000 	0x6a010000
    36f0:	0000381b 	0x381b
    36f4:	0016dd20 	0x16dd20
    36f8:	0015d700 	sll	k0,s5,0x1c
    36fc:	16d82000 	bne	s6,t8,b700 <_data-0x7fff4900>
    3700:	15eb0000 	bne	t7,t3,3704 <_data-0x7fffc8fc>
    3704:	d3200000 	0xd3200000
    3708:	00000016 	0x16
    370c:	20000016 	addi	zero,zero,22
    3710:	000016ce 	0x16ce
    3714:	00001615 	0x1615
    3718:	0016c220 	0x16c220
    371c:	00162a00 	sll	a1,s6,0x8
    3720:	158e1f00 	bne	t4,t6,b324 <_data-0x7fff4cdc>
    3724:	04d00000 	bltzal	a2,3728 <_data-0x7fffc8d8>
    3728:	00208800 	0x208800
    372c:	6a010000 	0x6a010000
    3730:	0000380a 	movz	a3,zero,zero
    3734:	0015c720 	0x15c720
    3738:	00163f00 	sll	a3,s6,0x1c
    373c:	15c22000 	bne	t6,v0,b740 <_data-0x7fff48c0>
    3740:	16530000 	bne	s2,s3,3744 <_data-0x7fffc8bc>
    3744:	bd200000 	cache	0x0,0(t1)
    3748:	68000015 	0x68000015
    374c:	20000016 	addi	zero,zero,22
    3750:	000015b1 	tgeu	zero,zero,0x56
    3754:	0000167d 	0x167d
    3758:	0014961f 	0x14961f
    375c:	0004d800 	sll	k1,a0,0x0
    3760:	00001888 	0x1888
    3764:	f96a0100 	sdc2	$10,256(t3)
    3768:	20000037 	addi	zero,zero,55
    376c:	000014c5 	0x14c5
    3770:	00001692 	0x1692
    3774:	0014c020 	add	t8,zero,s4
    3778:	0016a600 	sll	s4,s6,0x18
    377c:	14b42000 	bne	a1,s4,b780 <_data-0x7fff4880>
    3780:	16bb0000 	bne	s5,k1,3784 <_data-0x7fffc87c>
    3784:	b21f0000 	0xb21f0000
    3788:	e0000013 	sc	zero,19(zero)
    378c:	10880004 	beq	a0,t0,37a0 <_data-0x7fffc860>
    3790:	01000000 	0x1000000
    3794:	0037e86a 	0x37e86a
    3798:	13d72000 	beq	s8,s7,b79c <_data-0x7fff4864>
    379c:	16d00000 	bne	s6,s0,37a0 <_data-0x7fffc860>
    37a0:	cb200000 	lwc2	$0,0(t9)
    37a4:	e4000013 	swc1	$f0,19(zero)
    37a8:	1f000016 	bgtz	t8,3804 <_data-0x7fffc7fc>
    37ac:	00003da2 	0x3da2
    37b0:	880004e8 	lwl	zero,1256(zero)
    37b4:	00000008 	jr	zero
    37b8:	37d76a01 	ori	s7,s8,0x6a01
    37bc:	ac200000 	sw	zero,0(at)
    37c0:	f900003d 	sdc2	$0,61(t0)
    37c4:	21000016 	addi	zero,t0,22
    37c8:	880004f0 	lwl	zero,1264(zero)
    37cc:	00003ed6 	0x3ed6
    37d0:	01540122 	0x1540122
    37d4:	21000030 	addi	zero,t0,48
    37d8:	880004e8 	lwl	zero,1256(zero)
    37dc:	00003ed6 	0x3ed6
    37e0:	02540122 	0x2540122
    37e4:	00002008 	0x2008
    37e8:	0004e021 	addu	gp,zero,a0
    37ec:	003ed688 	0x3ed688
    37f0:	54012200 	bnel	zero,at,bff4 <_data-0x7fff400c>
    37f4:	005d0802 	0x5d0802
    37f8:	04d82100 	0x4d82100
    37fc:	3ed68800 	0x3ed68800
    3800:	01220000 	0x1220000
    3804:	63080254 	0x63080254
    3808:	d0210000 	0xd0210000
    380c:	d6880004 	ldc1	$f8,4(s4)
    3810:	2200003e 	addi	zero,s0,62
    3814:	08025401 	j	95004 <_data-0x7ff6affc>
    3818:	21000065 	addi	zero,t0,101
    381c:	880004c8 	lwl	zero,1224(zero)
    3820:	00003ed6 	0x3ed6
    3824:	02540122 	0x2540122
    3828:	00004408 	0x4408
    382c:	0004c021 	addu	t8,zero,a0
    3830:	003ed688 	0x3ed688
    3834:	54012200 	bnel	zero,at,c038 <_data-0x7fff3fc8>
    3838:	005b0802 	0x5b0802
    383c:	04b82100 	0x4b82100
    3840:	3ed68800 	0x3ed68800
    3844:	01220000 	0x1220000
    3848:	20080254 	addi	t0,zero,596
    384c:	b0210000 	0xb0210000
    3850:	d6880004 	ldc1	$f8,4(s4)
    3854:	2200003e 	addi	zero,s0,62
    3858:	08025401 	j	95004 <_data-0x7ff6affc>
    385c:	0000002c 	0x2c
    3860:	b61a0000 	0xb61a0000
    3864:	f000003d 	0xf000003d
    3868:	60880004 	0x60880004
    386c:	02000000 	0x2000000
    3870:	0038ac10 	0x38ac10
    3874:	3dc62000 	0x3dc62000
    3878:	170d0000 	bne	t8,t5,387c <_data-0x7fffc784>
    387c:	00280000 	0x280000
    3880:	d6880005 	ldc1	$f8,5(s4)
    3884:	9200003e 	lbu	zero,62(s0)
    3888:	22000038 	addi	zero,s0,56
    388c:	08025401 	j	95004 <_data-0x7ff6affc>
    3890:	0c29002d 	jal	a400b4 <_data-0x7f5bff4c>
    3894:	d0880005 	0xd0880005
    3898:	2100003d 	addi	zero,t0,61
    389c:	880005b8 	lwl	zero,1464(zero)
    38a0:	00003ed6 	0x3ed6
    38a4:	02540122 	0x2540122
    38a8:	00003008 	0x3008
    38ac:	00227a1f 	0x227a1f
    38b0:	00052400 	sll	a0,a1,0x10
    38b4:	00005888 	0x5888
    38b8:	c5160200 	lwc1	$f22,512(t0)
    38bc:	2000003c 	addi	zero,zero,60
    38c0:	00002296 	0x2296
    38c4:	0000172b 	0x172b
    38c8:	00052425 	0x52425
    38cc:	00005888 	0x5888
    38d0:	1f442600 	0x1f442600
    38d4:	05240000 	0x5240000
    38d8:	00588800 	0x588800
    38dc:	7f010000 	0x7f010000
    38e0:	001fd220 	0x1fd220
    38e4:	00172b00 	sll	a1,s7,0xc
    38e8:	1c9e2600 	0x1c9e2600
    38ec:	05240000 	0x5240000
    38f0:	00588800 	0x588800
    38f4:	76010000 	jalx	8040000 <_data-0x77fc0000>
    38f8:	001d1d20 	0x1d1d20
    38fc:	00174300 	sll	t0,s7,0xc
    3900:	1d182000 	0x1d182000
    3904:	17570000 	bne	k0,s7,3908 <_data-0x7fffc6f8>
    3908:	13200000 	beqz	t9,390c <_data-0x7fffc6f4>
    390c:	6c00001d 	0x6c00001d
    3910:	20000017 	addi	zero,zero,23
    3914:	00001d0e 	0x1d0e
    3918:	00001781 	0x1781
    391c:	001d0920 	0x1d0920
    3920:	00179600 	sll	s2,s7,0x18
    3924:	1d042000 	0x1d042000
    3928:	17ab0000 	bne	sp,t3,392c <_data-0x7fffc6d4>
    392c:	ff200000 	sdc3	$0,0(t9)
    3930:	c000001c 	ll	zero,28(zero)
    3934:	20000017 	addi	zero,zero,23
    3938:	00001cfa 	0x1cfa
    393c:	00001796 	0x1796
    3940:	001cf520 	0x1cf520
    3944:	0017d500 	sll	k0,s7,0x14
    3948:	1cf02000 	0x1cf02000
    394c:	17960000 	bne	gp,s6,3950 <_data-0x7fffc6b0>
    3950:	e4200000 	swc1	$f0,0(at)
    3954:	ea00001c 	swc2	$0,28(s0)
    3958:	1f000017 	bgtz	t8,39b8 <_data-0x7fffc648>
    395c:	00001a36 	tne	zero,zero,0x68
    3960:	8800052c 	lwl	zero,1324(zero)
    3964:	00000050 	0x50
    3968:	3cb16a01 	0x3cb16a01
    396c:	ab200000 	swl	zero,0(t9)
    3970:	ff00001a 	sdc3	$0,26(t8)
    3974:	20000017 	addi	zero,zero,23
    3978:	00001aa6 	0x1aa6
    397c:	00001813 	0x1813
    3980:	001aa120 	0x1aa120
    3984:	00182800 	sll	a1,t8,0x0
    3988:	1a9c2000 	0x1a9c2000
    398c:	183d0000 	0x183d0000
    3990:	97200000 	lhu	zero,0(t9)
    3994:	5200001a 	beqzl	s0,3a00 <_data-0x7fffc600>
    3998:	20000018 	addi	zero,zero,24
    399c:	00001a92 	0x1a92
    39a0:	00001867 	0x1867
    39a4:	001a8d20 	0x1a8d20
    39a8:	00187c00 	sll	t7,t8,0x10
    39ac:	1a882000 	0x1a882000
    39b0:	18520000 	0x18520000
    39b4:	83200000 	lb	zero,0(t9)
    39b8:	9100001a 	lbu	zero,26(t0)
    39bc:	20000018 	addi	zero,zero,24
    39c0:	00001a77 	0x1a77
    39c4:	00001852 	mflhxu	v1
    39c8:	001d241f 	0x1d241f
    39cc:	00053400 	sll	a2,a1,0x10
    39d0:	00004888 	0x4888
    39d4:	a06a0100 	sb	t2,256(v1)
    39d8:	2000003c 	addi	zero,zero,60
    39dc:	00001d8f 	0x1d8f
    39e0:	000018a6 	0x18a6
    39e4:	001d8a20 	0x1d8a20
    39e8:	0018ba00 	sll	s7,t8,0x8
    39ec:	1d852000 	0x1d852000
    39f0:	18cf0000 	0x18cf0000
    39f4:	80200000 	lb	zero,0(at)
    39f8:	e400001d 	swc1	$f0,29(zero)
    39fc:	20000018 	addi	zero,zero,24
    3a00:	00001d7b 	0x1d7b
    3a04:	000018f9 	0x18f9
    3a08:	001d7620 	0x1d7620
    3a0c:	00190e00 	sll	at,t9,0x18
    3a10:	1d712000 	0x1d712000
    3a14:	19230000 	0x19230000
    3a18:	6c200000 	0x6c200000
    3a1c:	f900001d 	sdc2	$0,29(t0)
    3a20:	20000018 	addi	zero,zero,24
    3a24:	00001d60 	0x1d60
    3a28:	00001938 	0x1938
    3a2c:	001ab21f 	0x1ab21f
    3a30:	00053c00 	sll	a3,a1,0x10
    3a34:	00004088 	0x4088
    3a38:	8f6a0100 	lw	t2,256(k1)
    3a3c:	2000003c 	addi	zero,zero,60
    3a40:	00001b13 	0x1b13
    3a44:	0000194d 	break	0x0,0x65
    3a48:	001b0e20 	0x1b0e20
    3a4c:	00196100 	sll	t4,t9,0x4
    3a50:	1b092000 	0x1b092000
    3a54:	19760000 	0x19760000
    3a58:	04200000 	bltz	at,3a5c <_data-0x7fffc5a4>
    3a5c:	8b00001b 	lwl	zero,27(t8)
    3a60:	20000019 	addi	zero,zero,25
    3a64:	00001aff 	0x1aff
    3a68:	000019a0 	0x19a0
    3a6c:	001afa20 	0x1afa20
    3a70:	0019b500 	sll	s6,t9,0x14
    3a74:	1af52000 	0x1af52000
    3a78:	19ca0000 	0x19ca0000
    3a7c:	e9200000 	swc2	$0,0(t1)
    3a80:	a000001a 	sb	zero,26(zero)
    3a84:	1f000019 	bgtz	t8,3aec <_data-0x7fffc514>
    3a88:	000018ee 	0x18ee
    3a8c:	88000544 	lwl	zero,1348(zero)
    3a90:	00000038 	0x38
    3a94:	3c7e6a01 	0x3c7e6a01
    3a98:	45200000 	0x45200000
    3a9c:	df000019 	ldc3	$0,25(t8)
    3aa0:	20000019 	addi	zero,zero,25
    3aa4:	00001940 	sll	v1,zero,0x5
    3aa8:	000019f3 	tltu	zero,zero,0x67
    3aac:	00193b20 	0x193b20
    3ab0:	001a0800 	sll	at,k0,0x0
    3ab4:	19362000 	0x19362000
    3ab8:	1a1d0000 	0x1a1d0000
    3abc:	31200000 	andi	zero,t1,0x0
    3ac0:	32000019 	andi	zero,s0,0x19
    3ac4:	2000001a 	addi	zero,zero,26
    3ac8:	0000192c 	0x192c
    3acc:	00001a47 	0x1a47
    3ad0:	00192020 	add	a0,zero,t9
    3ad4:	001a5c00 	sll	t3,k0,0x10
    3ad8:	17ba1f00 	bne	sp,k0,b6dc <_data-0x7fff4924>
    3adc:	054c0000 	teqi	t2,0
    3ae0:	00308800 	0x308800
    3ae4:	6a010000 	0x6a010000
    3ae8:	00003c6d 	0x3c6d
    3aec:	00180720 	0x180720
    3af0:	001a7100 	sll	t6,k0,0x4
    3af4:	18022000 	0x18022000
    3af8:	1a850000 	0x1a850000
    3afc:	fd200000 	sdc3	$0,0(t1)
    3b00:	9a000017 	lwr	zero,23(s0)
    3b04:	2000001a 	addi	zero,zero,26
    3b08:	000017f8 	0x17f8
    3b0c:	00001aaf 	0x1aaf
    3b10:	0017f320 	0x17f320
    3b14:	001ac400 	sll	t8,k0,0x10
    3b18:	17e72000 	bne	ra,a3,bb1c <_data-0x7fff44e4>
    3b1c:	1ad90000 	0x1ad90000
    3b20:	9a1f0000 	lwr	ra,0(s0)
    3b24:	54000016 	bnezl	zero,3b80 <_data-0x7fffc480>
    3b28:	28880005 	slti	t0,a0,5
    3b2c:	01000000 	0x1000000
    3b30:	003c5c6a 	0x3c5c6a
    3b34:	16dd2000 	bne	s6,sp,bb38 <_data-0x7fff44c8>
    3b38:	1aee0000 	0x1aee0000
    3b3c:	d8200000 	ldc2	$0,0(at)
    3b40:	02000016 	0x2000016
    3b44:	2000001b 	addi	zero,zero,27
    3b48:	000016d3 	0x16d3
    3b4c:	00001b17 	0x1b17
    3b50:	0016ce20 	0x16ce20
    3b54:	001b2c00 	sll	a1,k1,0x10
    3b58:	16c22000 	bne	s6,v0,bb5c <_data-0x7fff44a4>
    3b5c:	1b410000 	0x1b410000
    3b60:	8e1f0000 	lw	ra,0(s0)
    3b64:	5c000015 	bgtzl	zero,3bbc <_data-0x7fffc444>
    3b68:	20880005 	addi	t0,a0,5
    3b6c:	01000000 	0x1000000
    3b70:	003c4b6a 	0x3c4b6a
    3b74:	15c72000 	bne	t6,a3,bb78 <_data-0x7fff4488>
    3b78:	1b560000 	0x1b560000
    3b7c:	c2200000 	ll	zero,0(s1)
    3b80:	6a000015 	0x6a000015
    3b84:	2000001b 	addi	zero,zero,27
    3b88:	000015bd 	0x15bd
    3b8c:	00001b7f 	0x1b7f
    3b90:	0015b120 	0x15b120
    3b94:	001b9400 	sll	s2,k1,0x10
    3b98:	14961f00 	bne	a0,s6,b79c <_data-0x7fff4864>
    3b9c:	05640000 	0x5640000
    3ba0:	00188800 	sll	s1,t8,0x0
    3ba4:	6a010000 	0x6a010000
    3ba8:	00003c3a 	0x3c3a
    3bac:	0014c520 	0x14c520
    3bb0:	001ba900 	sll	s5,k1,0x4
    3bb4:	14c02000 	bnez	a2,bbb8 <_data-0x7fff4448>
    3bb8:	1bbd0000 	0x1bbd0000
    3bbc:	b4200000 	0xb4200000
    3bc0:	d2000014 	0xd2000014
    3bc4:	1f00001b 	bgtz	t8,3c34 <_data-0x7fffc3cc>
    3bc8:	000013b2 	tlt	zero,zero,0x4e
    3bcc:	8800056c 	lwl	zero,1388(zero)
    3bd0:	00000010 	mfhi	zero
    3bd4:	3c296a01 	0x3c296a01
    3bd8:	d7200000 	ldc1	$f0,0(t9)
    3bdc:	e7000013 	swc1	$f0,19(t8)
    3be0:	2000001b 	addi	zero,zero,27
    3be4:	000013cb 	0x13cb
    3be8:	00001bfb 	0x1bfb
    3bec:	003da21f 	0x3da21f
    3bf0:	00057400 	sll	t6,a1,0x10
    3bf4:	00000888 	0x888
    3bf8:	186a0100 	0x186a0100
    3bfc:	2000003c 	addi	zero,zero,60
    3c00:	00003dac 	0x3dac
    3c04:	00001c10 	0x1c10
    3c08:	00057c21 	0x57c21
    3c0c:	003ed688 	0x3ed688
    3c10:	54012200 	bnel	zero,at,c414 <_data-0x7fff3bec>
    3c14:	00003001 	movf	a2,zero,$fcc0
    3c18:	00057421 	0x57421
    3c1c:	003ed688 	0x3ed688
    3c20:	54012200 	bnel	zero,at,c424 <_data-0x7fff3bdc>
    3c24:	00200802 	ror	at,zero,0x0
    3c28:	056c2100 	teqi	t3,8448
    3c2c:	3ed68800 	0x3ed68800
    3c30:	01220000 	0x1220000
    3c34:	3a080254 	xori	t0,s0,0x254
    3c38:	64210000 	0x64210000
    3c3c:	d6880005 	ldc1	$f8,5(s4)
    3c40:	2200003e 	addi	zero,s0,62
    3c44:	08025401 	j	95004 <_data-0x7ff6affc>
    3c48:	21000064 	addi	zero,t0,100
    3c4c:	8800055c 	lwl	zero,1372(zero)
    3c50:	00003ed6 	0x3ed6
    3c54:	02540122 	0x2540122
    3c58:	00006508 	0x6508
    3c5c:	00055421 	0x55421
    3c60:	003ed688 	0x3ed688
    3c64:	54012200 	bnel	zero,at,c468 <_data-0x7fff3b98>
    3c68:	00760802 	0x760802
    3c6c:	054c2100 	teqi	t2,8448
    3c70:	3ed68800 	0x3ed68800
    3c74:	01220000 	0x1220000
    3c78:	69080254 	0x69080254
    3c7c:	44210000 	0x44210000
    3c80:	d6880005 	ldc1	$f8,5(s4)
    3c84:	2200003e 	addi	zero,s0,62
    3c88:	08025401 	j	95004 <_data-0x7ff6affc>
    3c8c:	21000065 	addi	zero,t0,101
    3c90:	8800053c 	lwl	zero,1340(zero)
    3c94:	00003ed6 	0x3ed6
    3c98:	02540122 	0x2540122
    3c9c:	00006308 	0x6308
    3ca0:	00053421 	0x53421
    3ca4:	003ed688 	0x3ed688
    3ca8:	54012200 	bnel	zero,at,c4ac <_data-0x7fff3b54>
    3cac:	00650802 	0x650802
    3cb0:	052c2100 	teqi	t1,8448
    3cb4:	3ed68800 	0x3ed68800
    3cb8:	01220000 	0x1220000
    3cbc:	52080254 	beql	s0,t0,4610 <_data-0x7fffb9f0>
    3cc0:	00000000 	nop
    3cc4:	3e8f1f00 	0x3e8f1f00
    3cc8:	057c0000 	0x57c0000
    3ccc:	00148800 	sll	s1,s4,0x0
    3cd0:	17020000 	bne	t8,v0,3cd4 <_data-0x7fffc32c>
    3cd4:	00003d0b 	0x3d0b
    3cd8:	00057c25 	0x57c25
    3cdc:	00001488 	0x1488
    3ce0:	3ea32a00 	0x3ea32a00
    3ce4:	af260000 	sw	a2,0(t9)
    3ce8:	7c00003e 	0x7c00003e
    3cec:	08880005 	j	2200014 <_data-0x7ddfffec>
    3cf0:	01000000 	0x1000000
    3cf4:	057c2523 	0x57c2523
    3cf8:	00088800 	sll	s1,t0,0x0
    3cfc:	c3240000 	ll	a0,0(t9)
    3d00:	2400003e 	li	zero,62
    3d04:	0000001c 	0x1c
    3d08:	28000000 	slti	zero,zero,0
    3d0c:	880004a8 	lwl	zero,1192(zero)
    3d10:	00003e09 	0x3e09
    3d14:	00003d1f 	0x3d1f
    3d18:	02540122 	0x2540122
    3d1c:	28000080 	slti	zero,zero,128
    3d20:	88000514 	lwl	zero,1300(zero)
    3d24:	00003ed6 	0x3ed6
    3d28:	00003d32 	tlt	zero,zero,0xf4
    3d2c:	01540122 	0x1540122
    3d30:	9829003a 	lwr	t1,58(at)
    3d34:	09880005 	j	6200014 <_data-0x79dfffec>
    3d38:	2100003e 	addi	zero,t0,62
    3d3c:	880005a0 	lwl	zero,1440(zero)
    3d40:	00003ed6 	0x3ed6
    3d44:	01540122 	0x1540122
    3d48:	2b00003a 	slti	zero,t8,58
    3d4c:	6e690504 	0x6e690504
    3d50:	6a160074 	0x6a160074
    3d54:	0100000b 	movn	zero,t0,zero
    3d58:	00137d88 	0x137d88
    3d5c:	3d770300 	0x3d770300
    3d60:	76110000 	jalx	8440000 <_data-0x77bc0000>
    3d64:	59880100 	0x59880100
    3d68:	2c000012 	sltiu	zero,zero,18
    3d6c:	0000039b 	0x39b
    3d70:	3d7d8a01 	0x3d7d8a01
    3d74:	2d000000 	sltiu	zero,t0,0
    3d78:	00002c04 	0x2c04
    3d7c:	3d770f00 	0x3d770f00
    3d80:	ce2e0000 	pref	0xe,0(s1)
    3d84:	0100000d 	break	0x100
    3d88:	00074e82 	srl	t1,a3,0x1a
    3d8c:	00002500 	sll	a0,zero,0x14
    3d90:	3da20300 	0x3da20300
    3d94:	9b2c0000 	lwr	t4,0(t9)
    3d98:	01000003 	0x1000003
    3d9c:	003d7d84 	0x3d7d84
    3da0:	3b100000 	xori	s0,t8,0x0
    3da4:	03000012 	0x3000012
    3da8:	00003db6 	tne	zero,zero,0xf6
    3dac:	01006111 	0x1006111
    3db0:	0012596e 	0x12596e
    3db4:	77160000 	jalx	c580000 <_data-0x73a80000>
    3db8:	01000003 	0x1000003
    3dbc:	0011724b 	0x11724b
    3dc0:	3dd00300 	0x3dd00300
    3dc4:	76110000 	jalx	8440000 <_data-0x77bc0000>
    3dc8:	4b4b0100 	c2	0x14b0100
    3dcc:	0000003d 	0x3d
    3dd0:	000a682f 	0xa682f
    3dd4:	4b420100 	c2	0x1420100
    3dd8:	e8000006 	swc2	$0,6(zero)
    3ddc:	48880002 	mtc2	t0,$0,2
    3de0:	01000000 	0x1000000
    3de4:	003e099c 	0x3e099c
    3de8:	00763000 	0x763000
    3dec:	00254201 	0x254201
    3df0:	1c3c0000 	0x1c3c0000
    3df4:	14290000 	bne	at,t1,3df8 <_data-0x7fffc208>
    3df8:	d0880003 	0xd0880003
    3dfc:	3100003d 	andi	zero,t0,0x3d
    3e00:	88000328 	lwl	zero,808(zero)
    3e04:	00003ed6 	0x3ed6
    3e08:	038b2f00 	0x38b2f00
    3e0c:	35010000 	ori	at,t0,0x0
    3e10:	000001a9 	0x1a9
    3e14:	88000278 	lwl	zero,632(zero)
    3e18:	00000070 	tge	zero,zero,0x1
    3e1c:	3e8f9c01 	0x3e8f9c01
    3e20:	76300000 	jalx	8c00000 <_data-0x77400000>
    3e24:	25350100 	addiu	s5,t1,256
    3e28:	68000000 	0x68000000
    3e2c:	3200001c 	andi	zero,s0,0x1c
    3e30:	880002a4 	lwl	zero,676(zero)
    3e34:	0000002c 	0x2c
    3e38:	00003e6a 	0x3e6a
    3e3c:	01006933 	tltu	t0,zero,0x1a4
    3e40:	003d4b39 	0x3d4b39
    3e44:	001c9400 	sll	s2,gp,0x10
    3e48:	02a82500 	0x2a82500
    3e4c:	00208800 	0x208800
    3e50:	63330000 	0x63330000
    3e54:	593b0100 	0x593b0100
    3e58:	a8000012 	swl	zero,18(zero)
    3e5c:	2900001c 	slti	zero,t0,28
    3e60:	880002c8 	lwl	zero,712(zero)
    3e64:	00003ed6 	0x3ed6
    3e68:	98280000 	lwr	t0,0(at)
    3e6c:	d6880002 	ldc1	$f8,2(s4)
    3e70:	7e00003e 	0x7e00003e
    3e74:	2200003e 	addi	zero,s0,62
    3e78:	08025401 	j	95004 <_data-0x7ff6affc>
    3e7c:	a0210030 	sb	at,48(at)
    3e80:	d6880002 	ldc1	$f8,2(s4)
    3e84:	2200003e 	addi	zero,s0,62
    3e88:	08025401 	j	95004 <_data-0x7ff6affc>
    3e8c:	2e000078 	sltiu	zero,s0,120
    3e90:	000004c1 	0x4c1
    3e94:	10de2001 	beq	a2,s8,be9c <_data-0x7fff4164>
    3e98:	00250000 	0x250000
    3e9c:	af030000 	sw	v1,0(t8)
    3ea0:	2c00003e 	sltiu	zero,zero,62
    3ea4:	00001008 	0x1008
    3ea8:	3d7d2201 	0x3d7d2201
    3eac:	2e000000 	sltiu	zero,s0,0
    3eb0:	00001015 	0x1015
    3eb4:	12b61a01 	beq	s5,s6,a6bc <_data-0x7fff5944>
    3eb8:	3ecf0000 	0x3ecf0000
    3ebc:	cf030000 	pref	0x3,0(t8)
    3ec0:	2c00003e 	sltiu	zero,zero,62
    3ec4:	00001008 	0x1008
    3ec8:	3d7d1c01 	0x3d7d1c01
    3ecc:	02000000 	0x2000000
    3ed0:	060a0201 	tlti	s0,513
    3ed4:	ae2f0000 	sw	t7,0(s1)
    3ed8:	01000011 	mthi	t0
    3edc:	00123613 	0x123613
    3ee0:	00025000 	sll	t2,v0,0x0
    3ee4:	00002888 	0x2888
    3ee8:	0b9c0100 	j	e700400 <_data-0x718ffc00>
    3eec:	3400003f 	li	zero,0x3f
    3ef0:	13010063 	beq	t8,at,4080 <_data-0x7fffbf80>
    3ef4:	00001259 	0x1259
    3ef8:	08355401 	j	d55004 <_data-0x7f2aaffc>
    3efc:	01000010 	0x1000010
    3f00:	003d7d15 	0x3d7d15
    3f04:	80808000 	lb	zero,-32768(a0)
    3f08:	36007a98 	ori	zero,s0,0x7a98
    3f0c:	480d9e0f 	0x480d9e0f
    3f10:	6f6c6c65 	0x6f6c6c65
    3f14:	50494d20 	beql	v0,t1,17398 <_data-0x7ffe8c68>
    3f18:	000a2153 	0xa2153
    3f1c:	179e1936 	bne	gp,s8,a3f8 <_data-0x7fff5c08>
    3f20:	74697753 	jalx	1a5dd4c <_data-0x7e5a22b4>
    3f24:	63206863 	0x63206863
    3f28:	676e6168 	0x676e6168
    3f2c:	203a6465 	addi	k0,at,25701
    3f30:	7865485b 	0x7865485b
    3f34:	3600205d 	ori	zero,s0,0x205d
    3f38:	2c099e0b 	sltiu	t1,zero,-25077
    3f3c:	65445b20 	0x65445b20
    3f40:	00205d63 	0x205d63
    3f44:	0b9e0d36 	j	e7834d8 <_data-0x7187cb28>
    3f48:	65636552 	0x65636552
    3f4c:	64657669 	0x64657669
    3f50:	0000203a 	0x203a
    3f54:	00000022 	neg	zero,zero
    3f58:	02a50002 	0x2a50002
    3f5c:	01040000 	0x1040000
    3f60:	0000013e 	0x13e
    3f64:	88000000 	lwl	zero,0(zero)
    3f68:	88000250 	lwl	zero,592(zero)
    3f6c:	00001558 	0x1558
    3f70:	0000156a 	0x156a
    3f74:	000015a5 	0x15a5
    3f78:	056c8001 	teqi	t3,-32767
    3f7c:	00040000 	sll	zero,a0,0x0
    3f80:	000002b9 	0x2b9
    3f84:	16ab0104 	bne	s5,t3,4398 <_data-0x7fffbc68>
    3f88:	d80c0000 	ldc2	$12,0(zero)
    3f8c:	52000017 	beqzl	s0,3fec <_data-0x7fffc014>
    3f90:	f000000c 	0xf000000c
    3f94:	00000000 	nop
    3f98:	d0000000 	0xd0000000
    3f9c:	02000001 	movf	zero,s0,$fcc0
    3fa0:	104f0704 	beq	v0,t7,5bb4 <_data-0x7fffa44c>
    3fa4:	04020000 	bltzl	zero,3fa8 <_data-0x7fffc058>
    3fa8:	00104a07 	0x104a07
    3fac:	17b80300 	bne	sp,t8,4bb0 <_data-0x7fffb450>
    3fb0:	0f020000 	jal	c080000 <_data-0x73f80000>
    3fb4:	00000025 	move	zero,zero
    3fb8:	f2060102 	0xf2060102
    3fbc:	0400000a 	bltz	zero,3fe8 <_data-0x7fffc018>
    3fc0:	0000003e 	0x3e
    3fc4:	eb060102 	swc2	$6,258(t8)
    3fc8:	0200000a 	movz	zero,s0,zero
    3fcc:	179b0502 	bne	gp,k1,53d8 <_data-0x7fffac28>
    3fd0:	04050000 	0x4050000
    3fd4:	746e6905 	jalx	1b9a414 <_data-0x7e465bec>
    3fd8:	05040200 	0x5040200
    3fdc:	000017c1 	0x17c1
    3fe0:	00169803 	sra	s3,s6,0x0
    3fe4:	71090300 	0x71090300
    3fe8:	02000000 	0x2000000
    3fec:	0ae90801 	j	ba42004 <_data-0x745bdffc>
    3ff0:	af030000 	sw	v1,0(t8)
    3ff4:	03000017 	0x3000017
    3ff8:	0000830a 	0x830a
    3ffc:	07020200 	bltzl	t8,4800 <_data-0x7fffb800>
    4000:	00001623 	0x1623
    4004:	00161303 	sra	v0,s6,0xc
    4008:	660b0400 	0x660b0400
    400c:	03000000 	0x3000000
    4010:	000019f8 	0x19f8
    4014:	00330d04 	0x330d04
    4018:	b0060000 	0xb0060000
    401c:	b0000000 	0xb0000000
    4020:	07000000 	bltz	t8,4024 <_data-0x7fffbfdc>
    4024:	00000025 	move	zero,zero
    4028:	0408001f 	tgei	zero,31
    402c:	00000045 	0x45
    4030:	0015be09 	0x15be09
    4034:	a0070500 	sb	a3,1280(zero)
    4038:	05000000 	bltz	t0,403c <_data-0x7fffbfc4>
    403c:	0010e403 	sra	gp,s0,0x10
    4040:	05a40a88 	0x5a40a88
    4044:	0001242a 	0x1242a
    4048:	16900b00 	bne	s4,s0,6c4c <_data-0x7fff93b4>
    404c:	2b050000 	slti	a1,t8,0
    4050:	00000124 	0x124
    4054:	15eb0b00 	bne	t7,t3,6c58 <_data-0x7fff93a8>
    4058:	2c050000 	sltiu	a1,zero,0
    405c:	00000033 	tltu	zero,zero
    4060:	15d10b10 	bne	t6,s1,6ca4 <_data-0x7fff935c>
    4064:	2d050000 	sltiu	a1,t0,0
    4068:	00000033 	tltu	zero,zero
    406c:	16620b14 	bne	s3,v0,6cc0 <_data-0x7fff9340>
    4070:	2e050000 	sltiu	a1,s0,0
    4074:	00000033 	tltu	zero,zero
    4078:	15b10b18 	bne	t5,s1,6cdc <_data-0x7fff9324>
    407c:	2f050000 	sltiu	a1,t8,0
    4080:	00000033 	tltu	zero,zero
    4084:	17a50b1c 	bne	sp,a1,6cf8 <_data-0x7fff9308>
    4088:	30050000 	andi	a1,zero,0x0
    408c:	00000033 	tltu	zero,zero
    4090:	70670c20 	0x70670c20
    4094:	31050072 	andi	a1,t0,0x72
    4098:	00000134 	teq	zero,zero,0x4
    409c:	33060024 	andi	a2,t8,0x24
    40a0:	34000000 	li	zero,0x0
    40a4:	07000001 	bltz	t8,40ac <_data-0x7fffbf54>
    40a8:	00000025 	move	zero,zero
    40ac:	33060003 	andi	a2,t8,0x3
    40b0:	44000000 	mfc1	zero,$f0
    40b4:	07000001 	bltz	t8,40bc <_data-0x7fffbf44>
    40b8:	00000025 	move	zero,zero
    40bc:	f803001f 	sdc2	$3,31(zero)
    40c0:	05000017 	bltz	t0,4120 <_data-0x7fffbee0>
    40c4:	0000c732 	tlt	zero,zero,0x31c
    40c8:	16040d00 	bne	s0,a0,74cc <_data-0x7fff8b34>
    40cc:	06010000 	bgez	s0,40d0 <_data-0x7fffbf30>
    40d0:	0000008a 	0x8a
    40d4:	0016420d 	break	0x16,0x108
    40d8:	8a060100 	lwl	a2,256(s0)
    40dc:	0e000000 	jal	8000000 <_data-0x78000000>
    40e0:	0000167d 	0x167d
    40e4:	07885501 	tgei	gp,21761
    40e8:	00b48800 	0xb48800
    40ec:	9c010000 	0x9c010000
    40f0:	000002a9 	0x2a9
    40f4:	0066740f 	0x66740f
    40f8:	02a95501 	0x2a95501
    40fc:	1cc60000 	0x1cc60000
    4100:	ee100000 	swc3	$16,0(s0)
    4104:	01000017 	0x1000017
    4108:	0002af55 	0x2af55
    410c:	001cfd00 	sll	ra,gp,0x14
    4110:	07f81100 	0x7f81100
    4114:	00448800 	0x448800
    4118:	02320000 	0x2320000
    411c:	6d120000 	0x6d120000
    4120:	01000016 	0x1000016
    4124:	0000955b 	0x955b
    4128:	001d1e00 	sll	v1,sp,0x18
    412c:	70651300 	0x70651300
    4130:	5c010063 	0x5c010063
    4134:	00000058 	0x58
    4138:	00038c14 	0x38c14
    413c:	0007f800 	sll	ra,a3,0x0
    4140:	00000488 	0x488
    4144:	e15b0100 	sc	k1,256(t2)
    4148:	15000001 	bnez	t0,4150 <_data-0x7fffbeb0>
    414c:	880007f8 	lwl	zero,2040(zero)
    4150:	00000004 	sllv	zero,zero,zero
    4154:	00051a16 	0x51a16
    4158:	14000000 	bnez	zero,415c <_data-0x7fffbea4>
    415c:	000003a6 	0x3a6
    4160:	8800081c 	lwl	zero,2076(zero)
    4164:	00000004 	sllv	zero,zero,zero
    4168:	02045c01 	0x2045c01
    416c:	1c150000 	0x1c150000
    4170:	04880008 	tgei	a0,8
    4174:	16000000 	bnez	s0,4178 <_data-0x7fffbe88>
    4178:	000004ff 	0x4ff
    417c:	2c170000 	sltiu	s7,zero,0
    4180:	22880008 	addi	t0,s4,8
    4184:	21000005 	addi	zero,t0,5
    4188:	18000002 	blez	zero,4194 <_data-0x7fffbe6c>
    418c:	03055401 	0x3055401
    4190:	88000e1c 	lwl	zero,3612(zero)
    4194:	02550118 	0x2550118
    4198:	19000080 	blez	t0,439c <_data-0x7fffbc64>
    419c:	88000834 	lwl	zero,2100(zero)
    41a0:	0000052d 	0x52d
    41a4:	02540118 	0x2540118
    41a8:	00000080 	sll	zero,zero,0x2
    41ac:	0007ac17 	0x7ac17
    41b0:	00053888 	0x53888
    41b4:	00024900 	sll	t1,v0,0x4
    41b8:	54011800 	bnel	zero,at,a1bc <_data-0x7fff5e44>
    41bc:	0c980305 	jal	2600c14 <_data-0x7d9ff3ec>
    41c0:	17008800 	bnez	t8,fffe61c4 <_text_end+0x77fe5044>
    41c4:	880007c0 	lwl	zero,1984(zero)
    41c8:	00000538 	0x538
    41cc:	00000260 	0x260
    41d0:	05540118 	0x5540118
    41d4:	000df403 	sra	s8,t5,0x10
    41d8:	cc170088 	pref	0x17,136(zero)
    41dc:	43880007 	c0	0x1880007
    41e0:	78000005 	0x78000005
    41e4:	18000002 	blez	zero,41f0 <_data-0x7fffbe10>
    41e8:	11065401 	beq	t0,a2,191f0 <_data-0x7ffe6e10>
    41ec:	f5b7bdad 	sdc1	$f23,-16979(t5)
    41f0:	d417007d 	ldc1	$f23,125(zero)
    41f4:	28880007 	slti	t0,a0,7
    41f8:	8c000003 	lw	zero,3(zero)
    41fc:	18000002 	blez	zero,4208 <_data-0x7fffbdf8>
    4200:	81025401 	lb	v0,21505(t0)
    4204:	dc1a0000 	ldc3	$26,0(zero)
    4208:	b6880007 	0xb6880007
    420c:	1b000002 	blez	t8,4218 <_data-0x7fffbde8>
    4210:	880007f8 	lwl	zero,2040(zero)
    4214:	00000538 	0x538
    4218:	05540118 	0x5540118
    421c:	000e5803 	sra	t3,t6,0x0
    4220:	08000088 	j	220 <_data-0x7ffffde0>
    4224:	00014404 	0x14404
    4228:	02010200 	0x2010200
    422c:	000015e5 	0x15e5
    4230:	0015db1c 	0x15db1c
    4234:	20450100 	addi	a1,v0,256
    4238:	68880007 	0x68880007
    423c:	01000000 	0x1000000
    4240:	0003289c 	0x3289c
    4244:	00b81d00 	0xb81d00
    4248:	691e0000 	0x691e0000
    424c:	66460100 	0x66460100
    4250:	31000000 	andi	zero,t0,0x0
    4254:	1d00001d 	bgtz	t0,42cc <_data-0x7fffbd34>
    4258:	000000d0 	0xd0
    425c:	0017ca12 	0x17ca12
    4260:	33470100 	andi	a3,k0,0x100
    4264:	50000000 	beqzl	zero,4268 <_data-0x7fffbd98>
    4268:	1200001d 	beqz	s0,42e0 <_data-0x7fffbd20>
    426c:	00001672 	tlt	zero,zero,0x59
    4270:	00334701 	0x334701
    4274:	1d630000 	0x1d630000
    4278:	a0120000 	sb	s2,0(zero)
    427c:	01000016 	0x1000016
    4280:	00003347 	0x3347
    4284:	001d7600 	sll	t6,sp,0x18
    4288:	076c1900 	teqi	k1,6400
    428c:	05228800 	bltzl	t1,fffe6290 <_text_end+0x77fe5110>
    4290:	01180000 	0x1180000
    4294:	00810254 	0x810254
    4298:	02550118 	0x2550118
    429c:	00007f80 	sll	t7,zero,0x1e
    42a0:	520e0000 	beql	s0,t6,42a4 <_data-0x7fffbd5c>
    42a4:	01000016 	0x1000016
    42a8:	0006883e 	0x6883e
    42ac:	00009888 	0x9888
    42b0:	8c9c0100 	lw	gp,256(a0)
    42b4:	0f000003 	jal	c00000c <_data-0x73fffff4>
    42b8:	01006674 	teq	t0,zero,0x199
    42bc:	0002a93e 	0x2a93e
    42c0:	001d8900 	sll	s1,sp,0x4
    42c4:	00a01f00 	0xa01f00
    42c8:	03780000 	0x3780000
    42cc:	691e0000 	0x691e0000
    42d0:	583f0100 	0x583f0100
    42d4:	b5000000 	0xb5000000
    42d8:	1900001d 	blez	t0,4350 <_data-0x7fffbcb0>
    42dc:	880006d0 	lwl	zero,1744(zero)
    42e0:	00000522 	0x522
    42e4:	02540118 	0x2540118
    42e8:	01180083 	0x1180083
    42ec:	7f810255 	0x7f810255
    42f0:	00190000 	sll	zero,t9,0x0
    42f4:	22880007 	addi	t0,s4,7
    42f8:	18000005 	blez	zero,4310 <_data-0x7fffbcf0>
    42fc:	03055401 	0x3055401
    4300:	88000d80 	lwl	zero,3456(zero)
    4304:	f9200000 	sdc2	$0,0(t1)
    4308:	01000015 	0x1000015
    430c:	00009535 	0x9535
    4310:	03a60100 	0x3a60100
    4314:	6e130000 	0x6e130000
    4318:	95360100 	lhu	s6,256(t1)
    431c:	00000000 	nop
    4320:	00161a20 	0x161a20
    4324:	952c0100 	lhu	t4,256(t1)
    4328:	01000000 	0x1000000
    432c:	000003c0 	sll	zero,zero,0xf
    4330:	01006e13 	0x1006e13
    4334:	0000952d 	0x952d
    4338:	f31c0000 	0xf31c0000
    433c:	01000015 	0x1000015
    4340:	0005c00b 	movn	t8,zero,a1
    4344:	0000c888 	0xc888
    4348:	ec9c0100 	swc3	$28,256(a0)
    434c:	12000004 	beqz	s0,4360 <_data-0x7fffbca0>
    4350:	0000177d 	0x177d
    4354:	00581801 	movf	v1,v0,$fcc6
    4358:	1df70000 	0x1df70000
    435c:	e7120000 	swc1	$f18,0(t8)
    4360:	01000017 	0x1000017
    4364:	00005821 	move	t3,zero
    4368:	001e1500 	sll	v0,s8,0x14
    436c:	05d41a00 	0x5d41a00
    4370:	054e8800 	tnei	t2,-30720
    4374:	dc170000 	ldc3	$23,0(zero)
    4378:	43880005 	c0	0x1880005
    437c:	0f000005 	jal	c000014 <_data-0x73ffffec>
    4380:	18000004 	blez	zero,4394 <_data-0x7fffbc6c>
    4384:	34015401 	li	at,0x5401
    4388:	05e81700 	tgei	t7,5888
    438c:	05388800 	0x5388800
    4390:	04260000 	0x4260000
    4394:	01180000 	0x1180000
    4398:	98030554 	lwr	v1,1364(zero)
    439c:	0088000c 	syscall	0x22000
    43a0:	00060417 	0x60417
    43a4:	00053888 	0x53888
    43a8:	00043d00 	sll	a3,a0,0x14
    43ac:	54011800 	bnel	zero,at,a3b0 <_data-0x7fff5c50>
    43b0:	0cc00305 	jal	3000c14 <_data-0x7cfff3ec>
    43b4:	17008800 	bnez	t8,fffe63b8 <_text_end+0x77fe5238>
    43b8:	88000610 	lwl	zero,1552(zero)
    43bc:	00000543 	sra	zero,zero,0x15
    43c0:	00000450 	0x450
    43c4:	01540118 	0x1540118
    43c8:	28170035 	slti	s7,zero,53
    43cc:	22880006 	addi	t0,s4,6
    43d0:	73000005 	msubu	t8,zero
    43d4:	18000004 	blez	zero,43e8 <_data-0x7fffbc18>
    43d8:	03055401 	0x3055401
    43dc:	88000ce8 	lwl	zero,3304(zero)
    43e0:	02550118 	0x2550118
    43e4:	01180081 	0x1180081
    43e8:	00800256 	0x800256
    43ec:	06381700 	0x6381700
    43f0:	05598800 	0x5598800
    43f4:	04920000 	bltzall	a0,43f8 <_data-0x7fffbc08>
    43f8:	01180000 	0x1180000
    43fc:	00810254 	0x810254
    4400:	01550118 	0x1550118
    4404:	56011830 	bnel	s0,at,a4c8 <_data-0x7fff5b38>
    4408:	00008002 	srl	s0,zero,0x0
    440c:	00064017 	0x64017
    4410:	00054388 	0x54388
    4414:	0004a500 	sll	s4,a0,0x14
    4418:	54011800 	bnel	zero,at,a41c <_data-0x7fff5be4>
    441c:	1a003601 	blez	s0,11c24 <_data-0x7ffee3dc>
    4420:	88000648 	lwl	zero,1608(zero)
    4424:	00000564 	0x564
    4428:	00065c17 	0x65c17
    442c:	00053888 	0x53888
    4430:	0004c500 	sll	t8,a0,0x14
    4434:	54011800 	bnel	zero,at,a438 <_data-0x7fff5bc8>
    4438:	0d240305 	jal	4900c14 <_data-0x7b6ff3ec>
    443c:	21008800 	addi	zero,t0,-30720
    4440:	88000674 	lwl	zero,1652(zero)
    4444:	00000543 	sra	zero,zero,0x15
    4448:	000004d8 	0x4d8
    444c:	01540118 	0x1540118
    4450:	80190037 	lb	t9,55(zero)
    4454:	22880006 	addi	t0,s4,6
    4458:	18000005 	blez	zero,4470 <_data-0x7fffbb90>
    445c:	03055401 	0x3055401
    4460:	88000d40 	lwl	zero,3392(zero)
    4464:	a6220000 	sh	v0,0(s1)
    4468:	00000003 	sra	zero,zero,0x0
    446c:	0c000000 	jal	0 <_data-0x80000000>
    4470:	01000000 	0x1000000
    4474:	0005079c 	0x5079c
    4478:	03b62300 	0x3b62300
    447c:	52010000 	beql	s0,at,4480 <_data-0x7fffbb80>
    4480:	038c2200 	0x38c2200
    4484:	00000000 	nop
    4488:	000c0000 	sll	zero,t4,0x0
    448c:	9c010000 	0x9c010000
    4490:	00000522 	0x522
    4494:	00039c23 	0x39c23
    4498:	00520100 	0x520100
    449c:	00179424 	0x179424
    44a0:	00179400 	sll	s2,s7,0x10
    44a4:	240c0600 	li	t4,1536
    44a8:	00001609 	0x1609
    44ac:	00001609 	0x1609
    44b0:	d3244a04 	0xd3244a04
    44b4:	d3000017 	0xd3000017
    44b8:	06000017 	bltz	s0,4518 <_data-0x7fffbae8>
    44bc:	1786240a 	bne	gp,a2,d4e8 <_data-0x7fff2b18>
    44c0:	17860000 	bne	gp,a2,44c4 <_data-0x7fffbb3c>
    44c4:	4c040000 	mfc3	a0,$0
    44c8:	00163624 	0x163624
    44cc:	00163600 	sll	a2,s6,0x18
    44d0:	24420400 	addiu	v0,v0,1024
    44d4:	0000164b 	0x164b
    44d8:	0000164b 	0x164b
    44dc:	0e241507 	jal	890541c <_data-0x776fabe4>
    44e0:	0e000010 	jal	8000040 <_data-0x77ffffc0>
    44e4:	08000010 	j	40 <_data-0x7fffffc0>
    44e8:	01c2000a 	movz	zero,t6,v0
    44ec:	00040000 	sll	zero,a0,0x0
    44f0:	000004a2 	0x4a2
    44f4:	16ab0104 	bne	s5,t3,4908 <_data-0x7fffb6f8>
    44f8:	160c0000 	bne	s0,t4,44fc <_data-0x7fffbb04>
    44fc:	25000018 	addiu	zero,t0,24
    4500:	98000018 	lwr	zero,24(zero)
    4504:	00000001 	movf	zero,zero,$fcc0
    4508:	2d000000 	sltiu	zero,t0,0
    450c:	02000003 	0x2000003
    4510:	07040304 	0x7040304
    4514:	0000104f 	0x104f
    4518:	4a070403 	c2	0x70403
    451c:	04000010 	bltz	zero,4560 <_data-0x7fffbaa0>
    4520:	00001794 	0x1794
    4524:	01850101 	0x1850101
    4528:	083c0000 	j	f00000 <_data-0x7f100000>
    452c:	02248800 	0x2248800
    4530:	9c010000 	0x9c010000
    4534:	00000185 	0x185
    4538:	746d6605 	jalx	1b59814 <_data-0x7e4a67ec>
    453c:	8c010100 	lw	at,256(zero)
    4540:	33000001 	andi	zero,t8,0x1
    4544:	0600001e 	bltz	s0,45c0 <_data-0x7fffba40>
    4548:	01006907 	0x1006907
    454c:	00018503 	sra	s0,at,0x14
    4550:	001e6a00 	sll	t5,s8,0x8
    4554:	00630700 	0x630700
    4558:	01920401 	0x1920401
    455c:	1ed20000 	0x1ed20000
    4560:	61070000 	0x61070000
    4564:	01006772 	tlt	t0,zero,0x19d
    4568:	00019e05 	0x19e05
    456c:	001ef000 	sll	s8,s8,0x0
    4570:	70610800 	0x70610800
    4574:	25060100 	addiu	a2,t0,256
    4578:	02000000 	0x2000000
    457c:	77076091 	jalx	c1d8244 <_data-0x73e27dbc>
    4580:	85070100 	lh	a3,256(t0)
    4584:	0e000001 	jal	8000004 <_data-0x77fffffc>
    4588:	0900001f 	j	400007c <_data-0x7bffff84>
    458c:	0000181f 	0x181f
    4590:	08c01001 	j	3004004 <_data-0x7cffbffc>
    4594:	480a8800 	mfc2	t2,$17
    4598:	36000001 	ori	zero,s0,0x1
    459c:	0b000001 	j	c000004 <_data-0x73fffffc>
    45a0:	00001864 	0x1864
    45a4:	01851401 	0x1851401
    45a8:	00c60000 	0xc60000
    45ac:	00060000 	sll	zero,a2,0x0
    45b0:	0018040b 	0x18040b
    45b4:	85190100 	lh	t9,256(t0)
    45b8:	d7000001 	ldc1	$f0,1(t8)
    45bc:	06000000 	bltz	s0,45c0 <_data-0x7fffba40>
    45c0:	180c0b00 	0x180c0b00
    45c4:	1e010000 	0x1e010000
    45c8:	00000185 	0x185
    45cc:	000000e8 	0xe8
    45d0:	2c0c0006 	sltiu	t4,zero,6
    45d4:	a4880009 	sh	t0,9(a0)
    45d8:	0c000001 	jal	4 <_data-0x7ffffffc>
    45dc:	88000988 	lwl	zero,2440(zero)
    45e0:	000001af 	0x1af
    45e4:	0009ac0c 	syscall	0x26b0
    45e8:	0001ba88 	0x1ba88
    45ec:	09c80c00 	j	7203000 <_data-0x78dfd000>
    45f0:	01ba8800 	0x1ba8800
    45f4:	e00d0000 	sc	t5,0(zero)
    45f8:	ba880009 	swr	t0,9(s4)
    45fc:	25000001 	addiu	zero,t0,1
    4600:	0e000001 	jal	8000004 <_data-0x77fffffc>
    4604:	83025601 	lb	v0,22017(t8)
    4608:	57010e00 	bnel	t8,at,7e0c <_data-0x7fff81f4>
    460c:	0f003001 	jal	c00c004 <_data-0x73ff3ffc>
    4610:	88000a0c 	lwl	zero,2572(zero)
    4614:	000001a4 	0x1a4
    4618:	0254010e 	0x254010e
    461c:	00002508 	0x2508
    4620:	00012810 	0x12810
    4624:	18040b00 	0x18040b00
    4628:	19010000 	0x19010000
    462c:	00000185 	0x185
    4630:	0000014c 	syscall	0x5
    4634:	50110006 	beql	zero,s1,4650 <_data-0x7fffb9b0>
    4638:	0888000a 	j	2200028 <_data-0x7ddfffd8>
    463c:	7a000000 	0x7a000000
    4640:	0b000001 	j	c000004 <_data-0x73fffffc>
    4644:	00001804 	sllv	v1,zero,zero
    4648:	01851901 	0x1851901
    464c:	016a0000 	0x16a0000
    4650:	00060000 	sll	zero,a2,0x0
    4654:	000a580f 	0xa580f
    4658:	0001a488 	0x1a488
    465c:	54010e00 	bnel	zero,at,7e60 <_data-0x7fff81a0>
    4660:	00003d01 	0x3d01
    4664:	0009040c 	syscall	0x2410
    4668:	0001a488 	0x1a488
    466c:	12000000 	beqz	s0,4670 <_data-0x7fffb990>
    4670:	6e690504 	0x6e690504
    4674:	04130074 	bgezall	zero,4848 <_data-0x7fffb7b8>
    4678:	00000199 	0x199
    467c:	f2060103 	0xf2060103
    4680:	1400000a 	bnez	zero,46ac <_data-0x7fffb954>
    4684:	00000192 	0x192
    4688:	00250413 	0x250413
    468c:	04150000 	0x4150000
    4690:	04000018 	bltz	zero,46f4 <_data-0x7fffb90c>
    4694:	01000018 	mult	t0,zero
    4698:	18641519 	0x18641519
    469c:	18640000 	0x18640000
    46a0:	14010000 	bne	zero,at,46a4 <_data-0x7fffb95c>
    46a4:	00180c15 	0x180c15
    46a8:	00180c00 	sll	at,t8,0x10
    46ac:	001e0100 	sll	zero,s8,0x4
    46b0:	0000014a 	0x14a
    46b4:	05ac0004 	teqi	t5,4
    46b8:	01040000 	0x1040000
    46bc:	000016ab 	0x16ab
    46c0:	0018740c 	syscall	0x61d0
    46c4:	00182500 	sll	a0,t8,0x14
    46c8:	0001a800 	sll	s5,at,0x0
    46cc:	00000000 	nop
    46d0:	0003db00 	sll	k1,v1,0xc
    46d4:	07040200 	0x7040200
    46d8:	0000104f 	0x104f
    46dc:	4a070402 	c2	0x70402
    46e0:	03000010 	0x3000010
    46e4:	0000180c 	syscall	0x60
    46e8:	011d0101 	0x11d0101
    46ec:	0a600000 	j	9800000 <_data-0x76800000>
    46f0:	00d88800 	0xd88800
    46f4:	9c010000 	0x9c010000
    46f8:	0000011d 	0x11d
    46fc:	01007604 	0x1007604
    4700:	00012401 	0x12401
    4704:	001f7900 	sll	t7,ra,0x4
    4708:	00770400 	0x770400
    470c:	011d0101 	0x11d0101
    4710:	1fc10000 	0x1fc10000
    4714:	aa050000 	swl	a1,0(s0)
    4718:	01000017 	0x1000017
    471c:	00011d01 	0x11d01
    4720:	00201100 	0x201100
    4724:	18800500 	blez	a0,5b28 <_data-0x7fffa4d8>
    4728:	01010000 	0x1010000
    472c:	0000011d 	0x11d
    4730:	00002053 	0x2053
    4734:	01006906 	0x1006906
    4738:	00011d03 	sra	v1,at,0x14
    473c:	00208d00 	0x208d00
    4740:	006a0600 	0x6a0600
    4744:	011d0301 	0x11d0301
    4748:	20b60000 	addi	s6,a1,0
    474c:	63060000 	0x63060000
    4750:	1d040100 	0x1d040100
    4754:	05000001 	bltz	t0,475c <_data-0x7fffb8a4>
    4758:	07000021 	bltz	t8,47e0 <_data-0x7fffb820>
    475c:	00667562 	0x667562
    4760:	012b0501 	0x12b0501
    4764:	91030000 	lbu	v1,0(t0)
    4768:	6e087fa8 	0x6e087fa8
    476c:	01000018 	mult	t0,zero
    4770:	00002c06 	0x2c06
    4774:	00211800 	0x211800
    4778:	0a900900 	j	a402400 <_data-0x75bfdc00>
    477c:	00108800 	sll	s1,s0,0x0
    4780:	00f80000 	0xf80000
    4784:	040a0000 	tlti	zero,0
    4788:	01000018 	mult	t0,zero
    478c:	00011d0a 	0x11d0a
    4790:	0000e700 	sll	gp,zero,0x1c
    4794:	0c000b00 	jal	2c00 <_data-0x7fffd400>
    4798:	88000a9c 	lwl	zero,2716(zero)
    479c:	00000142 	srl	zero,zero,0x5
    47a0:	0254010d 	break	0x254,0x4
    47a4:	00002d08 	0x2d08
    47a8:	000b080e 	0xb080e
    47ac:	00003088 	0x3088
    47b0:	18040a00 	0x18040a00
    47b4:	0a010000 	j	8040000 <_data-0x77fc0000>
    47b8:	0000011d 	0x11d
    47bc:	00000112 	0x112
    47c0:	300f000b 	andi	t7,zero,0xb
    47c4:	4288000b 	c0	0x88000b
    47c8:	00000001 	movf	zero,zero,$fcc0
    47cc:	05041000 	0x5041000
    47d0:	00746e69 	0x746e69
    47d4:	c1050402 	ll	a1,1026(t0)
    47d8:	11000017 	beqz	t0,4838 <_data-0x7fffb7c8>
    47dc:	0000013b 	0x13b
    47e0:	0000013b 	0x13b
    47e4:	00002512 	0x2512
    47e8:	02003f00 	0x2003f00
    47ec:	0af20601 	j	bc81804 <_data-0x7437e7fc>
    47f0:	04130000 	bgezall	zero,47f4 <_data-0x7fffb80c>
    47f4:	04000018 	bltz	zero,4858 <_data-0x7fffb7a8>
    47f8:	01000018 	mult	t0,zero
    47fc:	0416000a 	0x416000a
    4800:	00040000 	sll	zero,a0,0x0
    4804:	000006ae 	0x6ae
    4808:	16ab0104 	bne	s5,t3,4c1c <_data-0x7fffb3e4>
    480c:	930c0000 	lbu	t4,0(t8)
    4810:	25000018 	addiu	zero,t0,24
    4814:	b8000018 	swr	zero,24(zero)
    4818:	00000001 	movf	zero,zero,$fcc0
    481c:	55000000 	bnezl	t0,4820 <_data-0x7fffb7e0>
    4820:	02000004 	sllv	zero,zero,s0
    4824:	07040304 	0x7040304
    4828:	0000104f 	0x104f
    482c:	4a070403 	c2	0x70403
    4830:	04000010 	bltz	zero,4874 <_data-0x7fffb78c>
    4834:	0000189c 	0x189c
    4838:	00271002 	ror	v0,a3,0x0
    483c:	8d050000 	lw	a1,0(t0)
    4840:	01000018 	mult	t0,zero
    4844:	00000172 	tlt	zero,zero,0x5
    4848:	000c0000 	sll	zero,t4,0x0
    484c:	9c010000 	0x9c010000
    4850:	0000008e 	0x8e
    4854:	01007306 	0x1007306
    4858:	00250172 	tlt	at,a1,0x5
    485c:	54010000 	bnel	zero,at,4860 <_data-0x7fffb7a0>
    4860:	01006e07 	0x1006e07
    4864:	00350172 	tlt	at,s5,0x5
    4868:	214c0000 	addi	t4,t2,0
    486c:	00080000 	sll	zero,t0,0x0
    4870:	dd000000 	ldc3	$0,0(t0)
    4874:	09000001 	j	4000004 <_data-0x7bfffffc>
    4878:	74025401 	jalx	95004 <_data-0x7ff6affc>
    487c:	55010900 	bnel	t0,at,6c80 <_data-0x7fff9380>
    4880:	09007502 	j	401d408 <_data-0x7bfe2bf8>
    4884:	f3035601 	0xf3035601
    4888:	00005501 	0x5501
    488c:	0018a30a 	0x18a30a
    4890:	01660100 	0x1660100
    4894:	000000ef 	0xef
    4898:	00000000 	nop
    489c:	00000040 	ssnop
    48a0:	00ef9c01 	0xef9c01
    48a4:	76070000 	jalx	81c0000 <_data-0x77e40000>
    48a8:	66010031 	0x66010031
    48ac:	0000f601 	0xf601
    48b0:	00217800 	0x217800
    48b4:	32760700 	andi	s6,s3,0x700
    48b8:	01660100 	0x1660100
    48bc:	000000f6 	tne	zero,zero,0x3
    48c0:	00002199 	0x2199
    48c4:	01006e07 	0x1006e07
    48c8:	00350166 	0x350166
    48cc:	21ba0000 	addi	k0,t5,0
    48d0:	730b0000 	madd	t8,t3
    48d4:	67010031 	0x67010031
    48d8:	0000fd01 	0xfd01
    48dc:	0b540100 	j	d500400 <_data-0x72affc00>
    48e0:	01003273 	tltu	t0,zero,0xc9
    48e4:	00fd0168 	0xfd0168
    48e8:	55010000 	bnel	t0,at,48ec <_data-0x7fffb714>
    48ec:	05040c00 	0x5040c00
    48f0:	00746e69 	0x746e69
    48f4:	00fc040d 	break	0xfc,0x10
    48f8:	0d0e0000 	jal	4380000 <_data-0x7bc80000>
    48fc:	00010a04 	0x10a04
    4900:	06010300 	bgez	s0,5504 <_data-0x7fffaafc>
    4904:	00000af2 	tlt	zero,zero,0x2b
    4908:	0001030f 	0x1030f
    490c:	18850a00 	0x18850a00
    4910:	43010000 	c0	0x1010000
    4914:	00002501 	0x2501
    4918:	00000000 	nop
    491c:	00007000 	sll	t6,zero,0x0
    4920:	749c0100 	jalx	2700400 <_data-0x7d8ffc00>
    4924:	07000001 	bltz	t8,492c <_data-0x7fffb6d4>
    4928:	00747364 	0x747364
    492c:	25014301 	addiu	at,t0,17153
    4930:	dd000000 	ldc3	$0,0(t0)
    4934:	07000021 	bltz	t8,49bc <_data-0x7fffb644>
    4938:	00637273 	tltu	v1,v1,0x1c9
    493c:	f6014301 	sdc1	$f1,17153(s0)
    4940:	fb000000 	sdc2	$0,0(t8)
    4944:	07000021 	bltz	t8,49cc <_data-0x7fffb634>
    4948:	4301006e 	c0	0x101006e
    494c:	00003501 	0x3501
    4950:	00223500 	0x223500
    4954:	00731000 	0x731000
    4958:	fd014701 	sdc3	$1,18177(t0)
    495c:	b9000000 	swr	zero,0(t0)
    4960:	10000022 	b	49ec <_data-0x7fffb614>
    4964:	48010064 	0x48010064
    4968:	00017401 	0x17401
    496c:	0022e200 	0x22e200
    4970:	040d0000 	0x40d0000
    4974:	00000103 	sra	zero,zero,0x4
    4978:	0018cf0a 	0x18cf0a
    497c:	012c0100 	0x12c0100
    4980:	00000025 	move	zero,zero
    4984:	00000000 	nop
    4988:	0000002c 	0x2c
    498c:	01dd9c01 	0x1dd9c01
    4990:	64070000 	0x64070000
    4994:	01007473 	tltu	t0,zero,0x1d1
    4998:	0025012c 	0x25012c
    499c:	23370000 	addi	s7,t9,0
    49a0:	73070000 	madd	t8,a3
    49a4:	01006372 	tlt	t0,zero,0x18d
    49a8:	00f6012c 	0xf6012c
    49ac:	23550000 	addi	s5,k0,0
    49b0:	6e070000 	0x6e070000
    49b4:	012c0100 	0x12c0100
    49b8:	00000035 	0x35
    49bc:	00002376 	tne	zero,zero,0x8d
    49c0:	0100730b 	0x100730b
    49c4:	00fd0130 	tge	a3,sp,0x4
    49c8:	55010000 	bnel	t0,at,49cc <_data-0x7fffb634>
    49cc:	01006410 	0x1006410
    49d0:	01740131 	tgeu	t3,s4,0x4
    49d4:	23c00000 	addi	zero,s8,0
    49d8:	0a000000 	j	8000000 <_data-0x78000000>
    49dc:	0000164b 	0x164b
    49e0:	25011101 	addiu	at,t0,4353
    49e4:	38000000 	xori	zero,zero,0x0
    49e8:	2488000b 	addiu	t0,a0,11
    49ec:	01000000 	0x1000000
    49f0:	00022e9c 	0x22e9c
    49f4:	00730700 	0x730700
    49f8:	25011101 	addiu	at,t0,4353
    49fc:	de000000 	ldc3	$0,0(s0)
    4a00:	06000023 	bltz	s0,4a90 <_data-0x7fffb570>
    4a04:	11010063 	beq	t0,at,4b94 <_data-0x7fffb46c>
    4a08:	00010301 	0x10301
    4a0c:	07550100 	0x7550100
    4a10:	1101006e 	beq	t0,at,4bcc <_data-0x7fffb434>
    4a14:	00003501 	0x3501
    4a18:	0023fc00 	0x23fc00
    4a1c:	00701000 	0x701000
    4a20:	74011501 	jalx	45404 <_data-0x7ffbabfc>
    4a24:	46000001 	sub.s	$f0,$f0,$f0
    4a28:	00000024 	and	zero,zero,zero
    4a2c:	0018e511 	0x18e511
    4a30:	74a30100 	jalx	28c0400 <_data-0x7d73fc00>
    4a34:	00000001 	movf	zero,zero,$fcc0
    4a38:	28000000 	slti	zero,zero,0
    4a3c:	01000000 	0x1000000
    4a40:	0002609c 	0x2609c
    4a44:	00731200 	0x731200
    4a48:	00fda301 	0xfda301
    4a4c:	24640000 	addiu	a0,v1,0
    4a50:	63130000 	0x63130000
    4a54:	03a30100 	0x3a30100
    4a58:	01000001 	movf	zero,t0,$fcc0
    4a5c:	ba110055 	swr	s1,85(s0)
    4a60:	01000018 	mult	t0,zero
    4a64:	0001748f 	0x1748f
    4a68:	00000000 	nop
    4a6c:	00002c00 	sll	a1,zero,0x10
    4a70:	929c0100 	lbu	gp,256(s4)
    4a74:	12000002 	beqz	s0,4a80 <_data-0x7fffb580>
    4a78:	8f010073 	lw	at,115(t8)
    4a7c:	000000fd 	0xfd
    4a80:	00002482 	srl	a0,zero,0x12
    4a84:	01006313 	0x1006313
    4a88:	0001038f 	0x1038f
    4a8c:	00550100 	0x550100
    4a90:	0018dd11 	0x18dd11
    4a94:	ef7f0100 	swc3	$31,256(k1)
    4a98:	00000000 	nop
    4a9c:	44000000 	mfc1	zero,$f0
    4aa0:	01000000 	0x1000000
    4aa4:	0002d59c 	0x2d59c
    4aa8:	31731200 	andi	s3,t3,0x1200
    4aac:	fd7f0100 	sdc3	$31,256(t3)
    4ab0:	ab000000 	swl	zero,0(t8)
    4ab4:	12000024 	beqz	s0,4b48 <_data-0x7fffb4b8>
    4ab8:	01003273 	tltu	t0,zero,0xc9
    4abc:	0000fd7f 	0xfd7f
    4ac0:	0024c900 	0x24c900
    4ac4:	006e1200 	0x6e1200
    4ac8:	00357f01 	0x357f01
    4acc:	24e70000 	addiu	a3,a3,0
    4ad0:	11000000 	beqz	t0,4ad4 <_data-0x7fffb52c>
    4ad4:	000018c8 	0x18c8
    4ad8:	00ef6801 	0xef6801
    4adc:	00000000 	nop
    4ae0:	00300000 	0x300000
    4ae4:	9c010000 	0x9c010000
    4ae8:	0000030b 	0x30b
    4aec:	00317312 	0x317312
    4af0:	00fd6801 	movt	t5,a3,$fcc7
    4af4:	25260000 	addiu	a2,t1,0
    4af8:	73120000 	madd	t8,s2
    4afc:	68010032 	0x68010032
    4b00:	000000fd 	0xfd
    4b04:	00002544 	0x2544
    4b08:	18aa1100 	0x18aa1100
    4b0c:	4d010000 	bc3t	4b10 <_data-0x7fffb4f0>
    4b10:	00000174 	teq	zero,zero,0x5
    4b14:	00000000 	nop
    4b18:	00000034 	teq	zero,zero
    4b1c:	035f9c01 	0x35f9c01
    4b20:	64120000 	0x64120000
    4b24:	01007473 	tltu	t0,zero,0x1d1
    4b28:	0001744d 	break	0x1,0x1d1
    4b2c:	00256200 	0x256200
    4b30:	72731200 	0x72731200
    4b34:	4d010063 	bc3t	4cc4 <_data-0x7fffb33c>
    4b38:	000000fd 	0xfd
    4b3c:	00002580 	sll	a0,zero,0x16
    4b40:	6e656c12 	0x6e656c12
    4b44:	354d0100 	ori	t5,t2,0x100
    4b48:	9e000000 	0x9e000000
    4b4c:	14000025 	bnez	zero,4be4 <_data-0x7fffb41c>
    4b50:	4e010070 	c3	0x10070
    4b54:	00000174 	teq	zero,zero,0x5
    4b58:	000025d3 	0x25d3
    4b5c:	18c11100 	0x18c11100
    4b60:	37010000 	ori	at,t8,0x0
    4b64:	00000174 	teq	zero,zero,0x5
    4b68:	00000000 	nop
    4b6c:	00000024 	and	zero,zero,zero
    4b70:	03a49c01 	0x3a49c01
    4b74:	64120000 	0x64120000
    4b78:	01007473 	tltu	t0,zero,0x1d1
    4b7c:	00017437 	0x17437
    4b80:	0025f100 	0x25f100
    4b84:	72731200 	0x72731200
    4b88:	37010063 	ori	at,t8,0x63
    4b8c:	000000fd 	0xfd
    4b90:	0000260f 	0x260f
    4b94:	01007014 	0x1007014
    4b98:	0001743b 	0x1743b
    4b9c:	00262d00 	0x262d00
    4ba0:	b2110000 	0xb2110000
    4ba4:	01000018 	mult	t0,zero
    4ba8:	00003522 	0x3522
    4bac:	00000000 	nop
    4bb0:	00002800 	sll	a1,zero,0x0
    4bb4:	e79c0100 	swc1	$f28,256(gp)
    4bb8:	12000003 	beqz	s0,4bc8 <_data-0x7fffb438>
    4bbc:	22010073 	addi	at,s0,115
    4bc0:	000000fd 	0xfd
    4bc4:	0000264b 	0x264b
    4bc8:	6e656c13 	0x6e656c13
    4bcc:	35220100 	ori	v0,t1,0x100
    4bd0:	01000000 	0x1000000
    4bd4:	6e631455 	0x6e631455
    4bd8:	23010074 	addi	at,t8,116
    4bdc:	00000035 	0x35
    4be0:	00002690 	0x2690
    4be4:	18d61500 	0x18d61500
    4be8:	0c010000 	jal	40000 <_data-0x7ffc0000>
    4bec:	00000035 	0x35
    4bf0:	00000000 	nop
    4bf4:	00000020 	add	zero,zero,zero
    4bf8:	73129c01 	0x73129c01
    4bfc:	fd0c0100 	sdc3	$12,256(t0)
    4c00:	af000000 	sw	zero,0(t8)
    4c04:	14000026 	bnez	zero,4ca0 <_data-0x7fffb360>
    4c08:	00746e63 	0x746e63
    4c0c:	00350d01 	0x350d01
    4c10:	26cd0000 	addiu	t5,s6,0
    4c14:	00000000 	nop
    4c18:	0000014c 	syscall	0x5
    4c1c:	07f00004 	bltzal	ra,4c30 <_data-0x7fffb3d0>
    4c20:	01040000 	0x1040000
    4c24:	000016ab 	0x16ab
    4c28:	0018ed0c 	syscall	0x63b4
    4c2c:	00182500 	sll	a0,t8,0x14
    4c30:	00024000 	sll	t0,v0,0x0
    4c34:	00000000 	nop
    4c38:	0005d200 	sll	k0,a1,0x8
    4c3c:	07040200 	0x7040200
    4c40:	0000104f 	0x104f
    4c44:	4a070402 	c2	0x70402
    4c48:	03000010 	0x3000010
    4c4c:	000017d3 	0x17d3
    4c50:	00a20e01 	0xa20e01
    4c54:	0bbc0000 	j	ef00000 <_data-0x71100000>
    4c58:	00308800 	0x308800
    4c5c:	9c010000 	0x9c010000
    4c60:	000000a2 	0xa2
    4c64:	01007304 	0x1007304
    4c68:	0000a90e 	0xa90e
    4c6c:	0026ec00 	0x26ec00
    4c70:	18040500 	0x18040500
    4c74:	07010000 	bgez	t8,4c78 <_data-0x7fffb388>
    4c78:	000000a2 	0xa2
    4c7c:	0000006a 	0x6a
    4c80:	cc070006 	pref	0x7,6(zero)
    4c84:	bb88000b 	swr	t0,11(gp)
    4c88:	7f000000 	0x7f000000
    4c8c:	08000000 	j	0 <_data-0x80000000>
    4c90:	f3035401 	0xf3035401
    4c94:	07005401 	bltz	t8,19c9c <_data-0x7ffe6364>
    4c98:	88000bd4 	lwl	zero,3028(zero)
    4c9c:	00000144 	0x144
    4ca0:	00000092 	0x92
    4ca4:	01540108 	0x1540108
    4ca8:	dc09003d 	ldc3	$9,61(zero)
    4cac:	4488000b 	0x4488000b
    4cb0:	08000001 	j	4 <_data-0x7ffffffc>
    4cb4:	3a015401 	xori	at,s0,0x5401
    4cb8:	040a0000 	tlti	zero,0
    4cbc:	746e6905 	jalx	1b9a414 <_data-0x7e465bec>
    4cc0:	b6040b00 	0xb6040b00
    4cc4:	02000000 	0x2000000
    4cc8:	0af20601 	j	bc81804 <_data-0x7437e7fc>
    4ccc:	af0c0000 	sw	t4,0(t8)
    4cd0:	03000000 	0x3000000
    4cd4:	00001864 	0x1864
    4cd8:	00a20101 	0xa20101
    4cdc:	0b5c0000 	j	d700000 <_data-0x72900000>
    4ce0:	00608800 	0x608800
    4ce4:	9c010000 	0x9c010000
    4ce8:	00000144 	0x144
    4cec:	01007304 	0x1007304
    4cf0:	0000a901 	0xa901
    4cf4:	00270d00 	0x270d00
    4cf8:	00630d00 	0x630d00
    4cfc:	00af0301 	0xaf0301
    4d00:	27360000 	addiu	s6,t9,0
    4d04:	280e0000 	slti	t6,zero,0
    4d08:	05000002 	bltz	t0,4d14 <_data-0x7fffb2ec>
    4d0c:	00001804 	sllv	v1,zero,zero
    4d10:	00a20701 	0xa20701
    4d14:	01040000 	0x1040000
    4d18:	00060000 	sll	zero,a2,0x0
    4d1c:	000ba40f 	0xba40f
    4d20:	00000888 	0x888
    4d24:	00013200 	sll	a2,at,0x8
    4d28:	18040500 	0x18040500
    4d2c:	07010000 	bgez	t8,4d30 <_data-0x7fffb2d0>
    4d30:	000000a2 	0xa2
    4d34:	00000122 	0x122
    4d38:	ac090006 	sw	t1,6(zero)
    4d3c:	4488000b 	0x4488000b
    4d40:	08000001 	j	4 <_data-0x7ffffffc>
    4d44:	3d015401 	0x3d015401
    4d48:	b4090000 	0xb4090000
    4d4c:	4488000b 	0x4488000b
    4d50:	08000001 	j	4 <_data-0x7ffffffc>
    4d54:	80025401 	lb	v0,21505(zero)
    4d58:	00000000 	nop
    4d5c:	00180410 	0x180410
    4d60:	00180400 	sll	zero,t8,0x10
    4d64:	00070100 	sll	zero,a3,0x4
    4d68:	000000b2 	tlt	zero,zero,0x2
    4d6c:	08c30004 	j	30c0010 <_data-0x7cf3fff0>
    4d70:	01040000 	0x1040000
    4d74:	000016ab 	0x16ab
    4d78:	0019010c 	syscall	0x6404
    4d7c:	00182500 	sll	a0,t8,0x14
    4d80:	00025800 	sll	t3,v0,0x0
    4d84:	00000000 	nop
    4d88:	00062500 	sll	a0,a2,0x14
    4d8c:	07040200 	0x7040200
    4d90:	0000104f 	0x104f
    4d94:	4a070402 	c2	0x70402
    4d98:	02000010 	0x2000010
    4d9c:	0aeb0601 	j	bac1804 <_data-0x7453e7fc>
    4da0:	02020000 	0x2020000
    4da4:	00179b05 	0x179b05
    4da8:	05040300 	0x5040300
    4dac:	00746e69 	0x746e69
    4db0:	c1050402 	ll	a1,1026(t0)
    4db4:	04000017 	bltz	zero,4e14 <_data-0x7fffb1ec>
    4db8:	00001698 	0x1698
    4dbc:	005a0902 	0x5a0902
    4dc0:	01020000 	0x1020000
    4dc4:	000ae908 	0xae908
    4dc8:	07020200 	bltzl	t8,55cc <_data-0x7fffaa34>
    4dcc:	00001623 	0x1623
    4dd0:	00161304 	0x161304
    4dd4:	4f0b0300 	c3	0x10b0300
    4dd8:	05000000 	bltz	t0,4ddc <_data-0x7fffb224>
    4ddc:	00001804 	sllv	v1,zero,zero
    4de0:	00410301 	0x410301
    4de4:	0bec0000 	j	fb00000 <_data-0x70500000>
    4de8:	002c8800 	0x2c8800
    4dec:	9c010000 	0x9c010000
    4df0:	000000aa 	0xaa
    4df4:	01006306 	0x1006306
    4df8:	00004103 	sra	t0,zero,0x4
    4dfc:	00275400 	0x275400
    4e00:	0c040700 	jal	101c00 <_data-0x7fefe400>
    4e04:	00aa8800 	0xaa8800
    4e08:	01080000 	0x1080000
    4e0c:	00800254 	0x800254
    4e10:	f4090000 	sdc1	$f9,0(zero)
    4e14:	f4000018 	sdc1	$f0,24(zero)
    4e18:	03000018 	mult	t8,zero
    4e1c:	0b3b0046 	j	cec0118 <_data-0x7313fee8>
    4e20:	00040000 	sll	zero,a0,0x0
    4e24:	0000094d 	break	0x0,0x25
    4e28:	0caa0104 	jal	2a80410 <_data-0x7d57fbf0>
    4e2c:	3c040000 	lui	a0,0x0
    4e30:	2500001a 	addiu	zero,t0,26
    4e34:	80000018 	lb	zero,24(zero)
    4e38:	00000002 	srl	zero,zero,0x0
    4e3c:	82000000 	lb	zero,0(s0)
    4e40:	02000006 	srlv	zero,zero,s0
    4e44:	07040304 	0x7040304
    4e48:	0000104f 	0x104f
    4e4c:	00002704 	0x2704
    4e50:	07040300 	0x7040300
    4e54:	0000104a 	0x104a
    4e58:	00003304 	0x3304
    4e5c:	17b80500 	bne	sp,t8,6260 <_data-0x7fff9da0>
    4e60:	0f020000 	jal	c080000 <_data-0x73f80000>
    4e64:	00000027 	nor	zero,zero,zero
    4e68:	eb060103 	swc2	$6,259(t8)
    4e6c:	0300000a 	movz	zero,t8,zero
    4e70:	179b0502 	bne	gp,k1,627c <_data-0x7fff9d84>
    4e74:	04060000 	0x4060000
    4e78:	746e6905 	jalx	1b9a414 <_data-0x7e465bec>
    4e7c:	05040300 	0x5040300
    4e80:	000017c1 	0x17c1
    4e84:	00169805 	0x169805
    4e88:	71090300 	0x71090300
    4e8c:	03000000 	0x3000000
    4e90:	0ae90801 	j	ba42004 <_data-0x745bdffc>
    4e94:	71040000 	madd	t0,a0
    4e98:	05000000 	bltz	t0,4e9c <_data-0x7fffb164>
    4e9c:	000017af 	0x17af
    4ea0:	00880a03 	0x880a03
    4ea4:	02030000 	0x2030000
    4ea8:	00162307 	0x162307
    4eac:	00880400 	0x880400
    4eb0:	60050000 	0x60050000
    4eb4:	03000019 	multu	t8,zero
    4eb8:	0000330c 	syscall	0xcc
    4ebc:	16130500 	bne	s0,s3,62c0 <_data-0x7fff9d40>
    4ec0:	0b040000 	j	c100000 <_data-0x73f00000>
    4ec4:	00000066 	0x66
    4ec8:	001ac605 	0x1ac605
    4ecc:	7d0c0400 	0x7d0c0400
    4ed0:	05000000 	bltz	t0,4ed4 <_data-0x7fffb12c>
    4ed4:	000019f8 	0x19f8
    4ed8:	003f0d04 	0x3f0d04
    4edc:	f7050000 	sdc1	$f5,0(t8)
    4ee0:	04000019 	bltz	zero,4f48 <_data-0x7fffb0b8>
    4ee4:	0000940e 	0x940e
    4ee8:	19a90700 	0x19a90700
    4eec:	0a010000 	j	8040000 <_data-0x77fc0000>
    4ef0:	00001989 	0x1989
    4ef4:	00010401 	0x10401
    4ef8:	00540800 	0x540800
    4efc:	00000033 	tltu	zero,zero
    4f00:	0015b909 	0x15b909
    4f04:	250a0100 	addiu	t2,t0,256
    4f08:	09000000 	j	4000000 <_data-0x7c000000>
    4f0c:	00001941 	0x1941
    4f10:	00330a01 	0x330a01
    4f14:	700a0000 	madd	zero,t2
    4f18:	01007274 	teq	t0,zero,0x1c9
    4f1c:	0001040b 	0x1040b
    4f20:	040b0000 	tltiu	zero,0
    4f24:	0000003a 	0x3a
    4f28:	001ad807 	srav	k1,k0,zero
    4f2c:	170a0100 	bne	t8,t2,5330 <_data-0x7fffacd0>
    4f30:	01000019 	multu	t0,zero
    4f34:	00000143 	sra	zero,zero,0x5
    4f38:	27005408 	addiu	zero,t8,21512
    4f3c:	09000000 	j	4000000 <_data-0x7c000000>
    4f40:	000015b9 	0x15b9
    4f44:	00250a01 	0x250a01
    4f48:	41090000 	0x41090000
    4f4c:	01000019 	multu	t0,zero
    4f50:	0000270a 	0x270a
    4f54:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    4f58:	0b010072 	j	c0401c8 <_data-0x73fbfe38>
    4f5c:	00000143 	sra	zero,zero,0x5
    4f60:	2e040b00 	sltiu	a0,s0,2816
    4f64:	07000000 	bltz	t8,4f68 <_data-0x7fffb098>
    4f68:	00001a0e 	0x1a0e
    4f6c:	1a770a01 	0x1a770a01
    4f70:	82010000 	lb	at,0(s0)
    4f74:	08000001 	j	4 <_data-0x7ffffffc>
    4f78:	00880054 	0x880054
    4f7c:	b9090000 	swr	t1,0(t0)
    4f80:	01000015 	0x1000015
    4f84:	0000250a 	0x250a
    4f88:	19410900 	0x19410900
    4f8c:	0a010000 	j	8040000 <_data-0x77fc0000>
    4f90:	00000088 	0x88
    4f94:	7274700a 	0x7274700a
    4f98:	820b0100 	lb	t3,256(s0)
    4f9c:	00000001 	movf	zero,zero,$fcc0
    4fa0:	008f040b 	0x8f040b
    4fa4:	69070000 	0x69070000
    4fa8:	01000019 	multu	t0,zero
    4fac:	001a530a 	0x1a530a
    4fb0:	01c10100 	0x1c10100
    4fb4:	54080000 	bnel	zero,t0,4fb8 <_data-0x7fffb048>
    4fb8:	00007100 	sll	t6,zero,0x4
    4fbc:	15b90900 	bne	t5,t9,73c0 <_data-0x7fff8c40>
    4fc0:	0a010000 	j	8040000 <_data-0x77fc0000>
    4fc4:	00000025 	move	zero,zero
    4fc8:	00194109 	0x194109
    4fcc:	710a0100 	0x710a0100
    4fd0:	0a000000 	j	8000000 <_data-0x78000000>
    4fd4:	00727470 	tge	v1,s2,0x1d1
    4fd8:	01c10b01 	0x1c10b01
    4fdc:	0b000000 	j	c000000 <_data-0x74000000>
    4fe0:	00007804 	sllv	t7,zero,zero
    4fe4:	19ce0c00 	0x19ce0c00
    4fe8:	04010000 	b	4fec <_data-0x7fffb014>
    4fec:	00001951 	0x1951
    4ff0:	00000033 	tltu	zero,zero
    4ff4:	0001f901 	0x1f901
    4ff8:	00540800 	0x540800
    4ffc:	00000033 	tltu	zero,zero
    5000:	0015b909 	0x15b909
    5004:	25040100 	addiu	a0,t0,256
    5008:	0a000000 	j	8000000 <_data-0x78000000>
    500c:	00727470 	tge	v1,s2,0x1d1
    5010:	01040501 	0x1040501
    5014:	0c000000 	jal	0 <_data-0x80000000>
    5018:	00001a64 	0x1a64
    501c:	1a880401 	0x1a880401
    5020:	00270000 	0x270000
    5024:	2b010000 	slti	at,t8,0
    5028:	08000002 	j	8 <_data-0x7ffffff8>
    502c:	00270054 	0x270054
    5030:	b9090000 	swr	t1,0(t0)
    5034:	01000015 	0x1000015
    5038:	00002504 	0x2504
    503c:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    5040:	05010072 	bgez	t0,520c <_data-0x7fffadf4>
    5044:	00000143 	sra	zero,zero,0x5
    5048:	1aad0c00 	0x1aad0c00
    504c:	04010000 	b	5050 <_data-0x7fffafb0>
    5050:	0000199a 	0x199a
    5054:	00000088 	0x88
    5058:	00025d01 	0x25d01
    505c:	00540800 	0x540800
    5060:	00000088 	0x88
    5064:	0015b909 	0x15b909
    5068:	25040100 	addiu	a0,t0,256
    506c:	0a000000 	j	8000000 <_data-0x78000000>
    5070:	00727470 	tge	v1,s2,0x1d1
    5074:	01820501 	0x1820501
    5078:	0c000000 	jal	0 <_data-0x80000000>
    507c:	00001a28 	0x1a28
    5080:	19ff0401 	0x19ff0401
    5084:	00710000 	0x710000
    5088:	8f010000 	lw	at,0(t8)
    508c:	08000002 	j	8 <_data-0x7ffffff8>
    5090:	00710054 	0x710054
    5094:	b9090000 	swr	t1,0(t0)
    5098:	01000015 	0x1000015
    509c:	00002504 	0x2504
    50a0:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    50a4:	05010072 	bgez	t0,5270 <_data-0x7fffad90>
    50a8:	000001c1 	0x1c1
    50ac:	19280d00 	0x19280d00
    50b0:	4a010000 	c2	0x10000
    50b4:	000000b5 	0xb5
    50b8:	00000000 	nop
    50bc:	00000014 	0x14
    50c0:	02ef9c01 	0x2ef9c01
    50c4:	380e0000 	xori	t6,zero,0x0
    50c8:	00000009 	jalr	zero,zero
    50cc:	0c000000 	jal	0 <_data-0x80000000>
    50d0:	01000000 	0x1000000
    50d4:	09480f4b 	j	5203d2c <_data-0x7adfc2d4>
    50d8:	277d0000 	addiu	sp,k1,0
    50dc:	f90e0000 	sdc2	$14,0(t0)
    50e0:	00000001 	movf	zero,zero,$fcc0
    50e4:	0c000000 	jal	0 <_data-0x80000000>
    50e8:	01000000 	0x1000000
    50ec:	02140f1c 	0x2140f1c
    50f0:	277d0000 	addiu	sp,k1,0
    50f4:	00100000 	sll	zero,s0,0x0
    50f8:	0c000000 	jal	0 <_data-0x80000000>
    50fc:	11000000 	beqz	t0,5100 <_data-0x7fffaf00>
    5100:	0000021f 	0x21f
    5104:	ffc3e0a0 	sdc3	$3,-8032(s8)
    5108:	0000007b 	0x7b
    510c:	17861200 	bne	gp,a2,9910 <_data-0x7fff66f0>
    5110:	46010000 	add.s	$f0,$f0,$f1
    5114:	88000c84 	lwl	zero,3204(zero)
    5118:	00000014 	0x14
    511c:	036a9c01 	0x36a9c01
    5120:	41130000 	0x41130000
    5124:	01000019 	multu	t0,zero
    5128:	0000b546 	0xb546
    512c:	0e540100 	jal	9500400 <_data-0x76affc00>
    5130:	0000087e 	0x87e
    5134:	88000c84 	lwl	zero,3204(zero)
    5138:	0000000c 	syscall
    513c:	950f4701 	lhu	t7,18177(t0)
    5140:	95000008 	lhu	zero,8(t0)
    5144:	0f000027 	jal	c00009c <_data-0x73ffff64>
    5148:	0000088a 	0x88a
    514c:	000027a8 	0x27a8
    5150:	00010a0e 	0x10a0e
    5154:	000c8400 	sll	s0,t4,0x10
    5158:	00000c88 	0xc88
    515c:	0f1d0100 	jal	c740400 <_data-0x738bfc00>
    5160:	0000012c 	0x12c
    5164:	00002795 	0x2795
    5168:	0001210f 	0x1210f
    516c:	0027a800 	0x27a800
    5170:	0c841000 	jal	2104000 <_data-0x7defc000>
    5174:	000c8800 	sll	s1,t4,0x0
    5178:	37110000 	ori	s1,t8,0x0
    517c:	90000001 	lbu	zero,1(zero)
    5180:	7bffc3e0 	0x7bffc3e0
    5184:	00000000 	nop
    5188:	00160912 	0x160912
    518c:	70420100 	0x70420100
    5190:	1488000c 	bne	a0,t0,51c4 <_data-0x7fffae3c>
    5194:	01000000 	0x1000000
    5198:	0003e59c 	0x3e59c
    519c:	19411300 	0x19411300
    51a0:	42010000 	c0	0x10000
    51a4:	000000aa 	0xaa
    51a8:	a10e5401 	sb	t6,21505(t0)
    51ac:	70000008 	0x70000008
    51b0:	0c88000c 	jal	2200030 <_data-0x7ddfffd0>
    51b4:	01000000 	0x1000000
    51b8:	08b80f43 	j	2e03d0c <_data-0x7d1fc2f4>
    51bc:	27c00000 	addiu	zero,s8,0
    51c0:	ad0f0000 	sw	t7,0(t0)
    51c4:	d3000008 	0xd3000008
    51c8:	0e000027 	jal	800009c <_data-0x77ffff64>
    51cc:	00000149 	0x149
    51d0:	88000c70 	lwl	zero,3184(zero)
    51d4:	0000000c 	syscall
    51d8:	6b0f1d01 	0x6b0f1d01
    51dc:	c0000001 	ll	zero,1(zero)
    51e0:	0f000027 	jal	c00009c <_data-0x73ffff64>
    51e4:	00000160 	0x160
    51e8:	000027d3 	0x27d3
    51ec:	000c7010 	0xc7010
    51f0:	00000c88 	0xc88
    51f4:	01761100 	0x1761100
    51f8:	e0800000 	sc	zero,0(a0)
    51fc:	007bffc3 	0x7bffc3
    5200:	0d000000 	jal	4000000 <_data-0x7c000000>
    5204:	000019e6 	0x19e6
    5208:	00b53901 	0xb53901
    520c:	00000000 	nop
    5210:	00480000 	0x480000
    5214:	9c010000 	0x9c010000
    5218:	00000432 	tlt	zero,zero,0x10
    521c:	001aa814 	0x1aa814
    5220:	b53a0100 	0xb53a0100
    5224:	eb000000 	swc2	$0,0(t8)
    5228:	15000027 	bnez	t0,52c8 <_data-0x7fffad38>
    522c:	00000000 	nop
    5230:	000004ef 	0x4ef
    5234:	00000015 	0x15
    5238:	0004ef00 	sll	sp,a0,0x1c
    523c:	00001500 	sll	v0,zero,0x14
    5240:	04ef0000 	0x4ef0000
    5244:	00150000 	sll	zero,s5,0x0
    5248:	ef000000 	swc3	$0,0(t8)
    524c:	00000004 	sllv	zero,zero,zero
    5250:	0018f412 	0x18f412
    5254:	50340100 	beql	at,s4,5658 <_data-0x7fffa9a8>
    5258:	2088000c 	addi	t0,a0,12
    525c:	01000000 	0x1000000
    5260:	0004ef9c 	0x4ef9c
    5264:	19411300 	0x19411300
    5268:	34010000 	li	at,0x0
    526c:	0000009f 	0x9f
    5270:	a1165401 	sb	s6,21505(t0)
    5274:	50000009 	beqzl	zero,529c <_data-0x7fffad64>
    5278:	0888000c 	j	2200030 <_data-0x7ddfffd0>
    527c:	01000000 	0x1000000
    5280:	00049635 	0x49635
    5284:	09b11700 	j	6c45c00 <_data-0x793ba400>
    5288:	5d0e0000 	0x5d0e0000
    528c:	50000002 	beqzl	zero,5298 <_data-0x7fffad68>
    5290:	0888000c 	j	2200030 <_data-0x7ddfffd0>
    5294:	01000000 	0x1000000
    5298:	0278171c 	0x278171c
    529c:	50100000 	beql	zero,s0,52a0 <_data-0x7fffad60>
    52a0:	0888000c 	j	2200030 <_data-0x7ddfffd0>
    52a4:	11000000 	beqz	t0,52a8 <_data-0x7fffad58>
    52a8:	00000283 	sra	zero,zero,0xa
    52ac:	fec0e094 	sdc3	$0,-8044(s6)
    52b0:	0000007b 	0x7b
    52b4:	0008c40e 	0x8c40e
    52b8:	000c6400 	sll	t4,t4,0x10
    52bc:	00000488 	0x488
    52c0:	0f360100 	jal	cd80400 <_data-0x7327fc00>
    52c4:	000008db 	0x8db
    52c8:	00002847 	0x2847
    52cc:	0008d00f 	0x8d00f
    52d0:	00285a00 	0x285a00
    52d4:	01880e00 	0x1880e00
    52d8:	0c640000 	jal	1900000 <_data-0x7e700000>
    52dc:	00048800 	sll	s1,a0,0x0
    52e0:	1d010000 	0x1d010000
    52e4:	0001aa0f 	0x1aa0f
    52e8:	00284700 	0x284700
    52ec:	019f0f00 	0x19f0f00
    52f0:	285a0000 	slti	k0,v0,0
    52f4:	64100000 	0x64100000
    52f8:	0488000c 	tgei	a0,12
    52fc:	11000000 	beqz	t0,5300 <_data-0x7fffad00>
    5300:	000001b5 	0x1b5
    5304:	fec0e080 	sdc3	$0,-8064(s6)
    5308:	0000007b 	0x7b
    530c:	1a970d00 	0x1a970d00
    5310:	2f010000 	sltiu	at,t8,0
    5314:	0000009f 	0x9f
    5318:	00000000 	nop
    531c:	00000020 	add	zero,zero,zero
    5320:	05899c01 	tgeiu	t4,-25599
    5324:	a1160000 	sb	s6,0(t0)
    5328:	00000009 	jalr	zero,zero
    532c:	08000000 	j	0 <_data-0x80000000>
    5330:	01000000 	0x1000000
    5334:	00054a30 	tge	zero,a1,0x128
    5338:	09b11700 	j	6c45c00 <_data-0x793ba400>
    533c:	5d0e0000 	0x5d0e0000
    5340:	00000002 	srl	zero,zero,0x0
    5344:	08000000 	j	0 <_data-0x80000000>
    5348:	01000000 	0x1000000
    534c:	0278171c 	0x278171c
    5350:	00100000 	sll	zero,s0,0x0
    5354:	08000000 	j	0 <_data-0x80000000>
    5358:	11000000 	beqz	t0,535c <_data-0x7fffaca4>
    535c:	00000283 	sra	zero,zero,0xa
    5360:	fec0e094 	sdc3	$0,-8044(s6)
    5364:	0000007b 	0x7b
    5368:	0009a10e 	0x9a10e
    536c:	00000000 	nop
    5370:	00000400 	sll	zero,zero,0x10
    5374:	17310100 	bne	t9,s1,5778 <_data-0x7fffa888>
    5378:	000009b1 	tgeu	zero,zero,0x26
    537c:	00025d0e 	0x25d0e
    5380:	00000000 	nop
    5384:	00000400 	sll	zero,zero,0x10
    5388:	171c0100 	bne	t8,gp,578c <_data-0x7fffa874>
    538c:	00000278 	0x278
    5390:	00000010 	mfhi	zero
    5394:	00000400 	sll	zero,zero,0x10
    5398:	02831100 	0x2831100
    539c:	e0800000 	sc	zero,0(a0)
    53a0:	007bfec0 	0x7bfec0
    53a4:	12000000 	beqz	s0,53a8 <_data-0x7fffac58>
    53a8:	00001636 	tne	zero,zero,0x58
    53ac:	0c181f01 	jal	607c04 <_data-0x7f9f83fc>
    53b0:	00388800 	0x388800
    53b4:	9c010000 	0x9c010000
    53b8:	0000081b 	0x81b
    53bc:	0008c416 	0x8c416
    53c0:	000c1800 	sll	v1,t4,0x0
    53c4:	00000c88 	0xc88
    53c8:	fa210100 	sdc2	$1,256(s1)
    53cc:	0f000005 	jal	c000014 <_data-0x73ffffec>
    53d0:	000008db 	0x8db
    53d4:	00002872 	tlt	zero,zero,0xa1
    53d8:	0008d00f 	0x8d00f
    53dc:	00288700 	0x288700
    53e0:	01880e00 	0x1880e00
    53e4:	0c180000 	jal	600000 <_data-0x7fa00000>
    53e8:	000c8800 	sll	s1,t4,0x0
    53ec:	1d010000 	0x1d010000
    53f0:	0001aa0f 	0x1aa0f
    53f4:	00287200 	0x287200
    53f8:	019f0f00 	0x19f0f00
    53fc:	28870000 	slti	a3,a0,0
    5400:	18100000 	0x18100000
    5404:	0c88000c 	jal	2200030 <_data-0x7ddfffd0>
    5408:	11000000 	beqz	t0,540c <_data-0x7fffabf4>
    540c:	000001b5 	0x1b5
    5410:	fec0e088 	sdc3	$0,-8056(s6)
    5414:	0000007b 	0x7b
    5418:	0008c416 	0x8c416
    541c:	000c2400 	sll	a0,t4,0x10
    5420:	00000888 	0x888
    5424:	56230100 	bnel	s1,v1,5828 <_data-0x7fffa7d8>
    5428:	0f000006 	jal	c000018 <_data-0x73ffffe8>
    542c:	000008db 	0x8db
    5430:	0000289f 	0x289f
    5434:	0008d00f 	0x8d00f
    5438:	0028b400 	0x28b400
    543c:	01880e00 	0x1880e00
    5440:	0c240000 	jal	900000 <_data-0x7f700000>
    5444:	00088800 	sll	s1,t0,0x0
    5448:	1d010000 	0x1d010000
    544c:	0001aa0f 	0x1aa0f
    5450:	00289f00 	0x289f00
    5454:	019f0f00 	0x19f0f00
    5458:	28b40000 	slti	s4,a1,0
    545c:	24100000 	li	s0,0
    5460:	0888000c 	j	2200030 <_data-0x7ddfffd0>
    5464:	11000000 	beqz	t0,5468 <_data-0x7fffab98>
    5468:	000001b5 	0x1b5
    546c:	fec0e08c 	sdc3	$0,-8052(s6)
    5470:	0000007b 	0x7b
    5474:	0008c416 	0x8c416
    5478:	000c2c00 	sll	a1,t4,0x10
    547c:	00000888 	0x888
    5480:	b2250100 	0xb2250100
    5484:	0f000006 	jal	c000018 <_data-0x73ffffe8>
    5488:	000008db 	0x8db
    548c:	000028cc 	syscall	0xa3
    5490:	0008d00f 	0x8d00f
    5494:	0028e100 	0x28e100
    5498:	01880e00 	0x1880e00
    549c:	0c2c0000 	jal	b00000 <_data-0x7f500000>
    54a0:	00088800 	sll	s1,t0,0x0
    54a4:	1d010000 	0x1d010000
    54a8:	0001aa0f 	0x1aa0f
    54ac:	0028cc00 	0x28cc00
    54b0:	019f0f00 	0x19f0f00
    54b4:	28e10000 	slti	at,a3,0
    54b8:	2c100000 	sltiu	s0,zero,0
    54bc:	0888000c 	j	2200030 <_data-0x7ddfffd0>
    54c0:	11000000 	beqz	t0,54c4 <_data-0x7fffab3c>
    54c4:	000001b5 	0x1b5
    54c8:	fec0e080 	sdc3	$0,-8064(s6)
    54cc:	0000007b 	0x7b
    54d0:	0008c418 	0x8c418
    54d4:	000c3400 	sll	a2,t4,0x10
    54d8:	00026888 	0x26888
    54dc:	0a280100 	j	8a00400 <_data-0x775ffc00>
    54e0:	0f000007 	jal	c00001c <_data-0x73ffffe4>
    54e4:	000008db 	0x8db
    54e8:	000028f9 	0x28f9
    54ec:	0008d00f 	0x8d00f
    54f0:	00290d00 	0x290d00
    54f4:	01881900 	0x1881900
    54f8:	0c340000 	jal	d00000 <_data-0x7f300000>
    54fc:	02688800 	0x2688800
    5500:	1d010000 	0x1d010000
    5504:	0001aa0f 	0x1aa0f
    5508:	0028f900 	0x28f900
    550c:	019f0f00 	0x19f0f00
    5510:	290d0000 	slti	t5,t0,0
    5514:	681a0000 	0x681a0000
    5518:	11000002 	beqz	t0,5524 <_data-0x7fffaadc>
    551c:	000001b5 	0x1b5
    5520:	fec0e08c 	sdc3	$0,-8052(s6)
    5524:	0000007b 	0x7b
    5528:	0008c416 	0x8c416
    552c:	000c3800 	sll	a3,t4,0x0
    5530:	00000488 	0x488
    5534:	66260100 	0x66260100
    5538:	0f000007 	jal	c00001c <_data-0x73ffffe4>
    553c:	000008db 	0x8db
    5540:	00002925 	0x2925
    5544:	0008d00f 	0x8d00f
    5548:	00293900 	0x293900
    554c:	01880e00 	0x1880e00
    5550:	0c380000 	jal	e00000 <_data-0x7f200000>
    5554:	00048800 	sll	s1,a0,0x0
    5558:	1d010000 	0x1d010000
    555c:	0001aa0f 	0x1aa0f
    5560:	00292500 	0x292500
    5564:	019f0f00 	0x19f0f00
    5568:	29390000 	slti	t9,t1,0
    556c:	38100000 	xori	s0,zero,0x0
    5570:	0488000c 	tgei	a0,12
    5574:	11000000 	beqz	t0,5578 <_data-0x7fffaa88>
    5578:	000001b5 	0x1b5
    557c:	fec0e084 	sdc3	$0,-8060(s6)
    5580:	0000007b 	0x7b
    5584:	0008c416 	0x8c416
    5588:	000c4000 	sll	t0,t4,0x0
    558c:	00000488 	0x488
    5590:	c22a0100 	ll	t2,256(s1)
    5594:	0f000007 	jal	c00001c <_data-0x73ffffe4>
    5598:	000008db 	0x8db
    559c:	00002951 	0x2951
    55a0:	0008d00f 	0x8d00f
    55a4:	00296500 	0x296500
    55a8:	01880e00 	0x1880e00
    55ac:	0c400000 	jal	1000000 <_data-0x7f000000>
    55b0:	00048800 	sll	s1,a0,0x0
    55b4:	1d010000 	0x1d010000
    55b8:	0001aa0f 	0x1aa0f
    55bc:	00295100 	0x295100
    55c0:	019f0f00 	0x19f0f00
    55c4:	29650000 	slti	a1,t3,0
    55c8:	40100000 	mfc0	s0,c0_index
    55cc:	0488000c 	tgei	a0,12
    55d0:	11000000 	beqz	t0,55d4 <_data-0x7fffaa2c>
    55d4:	000001b5 	0x1b5
    55d8:	fec0e090 	sdc3	$0,-8048(s6)
    55dc:	0000007b 	0x7b
    55e0:	0008c40e 	0x8c40e
    55e4:	000c4400 	sll	t0,t4,0x10
    55e8:	00000488 	0x488
    55ec:	0f2c0100 	jal	cb00400 <_data-0x734ffc00>
    55f0:	000008db 	0x8db
    55f4:	0000297d 	0x297d
    55f8:	0008d00f 	0x8d00f
    55fc:	00299100 	0x299100
    5600:	01880e00 	0x1880e00
    5604:	0c440000 	jal	1100000 <_data-0x7ef00000>
    5608:	00048800 	sll	s1,a0,0x0
    560c:	1d010000 	0x1d010000
    5610:	0001aa0f 	0x1aa0f
    5614:	00297d00 	0x297d00
    5618:	019f0f00 	0x19f0f00
    561c:	29910000 	slti	s1,t4,0
    5620:	44100000 	mfc1	s0,$f0
    5624:	0488000c 	tgei	a0,12
    5628:	11000000 	beqz	t0,562c <_data-0x7fffa9d4>
    562c:	000001b5 	0x1b5
    5630:	fec0e084 	sdc3	$0,-8060(s6)
    5634:	0000007b 	0x7b
    5638:	19c21200 	0x19c21200
    563c:	1d010000 	0x1d010000
    5640:	00000000 	nop
    5644:	0000000c 	syscall
    5648:	087e9c01 	j	1fa7004 <_data-0x7e058ffc>
    564c:	b9130000 	swr	s3,0(t0)
    5650:	01000015 	0x1000015
    5654:	0000251d 	0x251d
    5658:	13540100 	beq	k0,s4,5a5c <_data-0x7fffa5a4>
    565c:	00001941 	0x1941
    5660:	00c01d01 	0xc01d01
    5664:	55010000 	bnel	t0,at,5668 <_data-0x7fffa998>
    5668:	0000cb0e 	0xcb0e
    566c:	00000000 	nop
    5670:	00000400 	sll	zero,zero,0x10
    5674:	0f1d0100 	jal	c740400 <_data-0x738bfc00>
    5678:	000000ed 	0xed
    567c:	000029a9 	0x29a9
    5680:	0000e20f 	0xe20f
    5684:	0029bc00 	0x29bc00
    5688:	00001000 	sll	v0,zero,0x0
    568c:	00040000 	sll	zero,a0,0x0
    5690:	f81b0000 	sdc2	$27,0(zero)
    5694:	01000000 	0x1000000
    5698:	00000054 	0x54
    569c:	0019361c 	0x19361c
    56a0:	011d0100 	0x11d0100
    56a4:	000008a1 	0x8a1
    56a8:	0015b909 	0x15b909
    56ac:	251d0100 	addiu	sp,t0,256
    56b0:	09000000 	j	4000000 <_data-0x7c000000>
    56b4:	00001941 	0x1941
    56b8:	00b51d01 	0xb51d01
    56bc:	1c000000 	bgtz	zero,56c0 <_data-0x7fffa940>
    56c0:	0000190b 	0x190b
    56c4:	c4011d01 	lwc1	$f1,7425(zero)
    56c8:	09000008 	j	4000020 <_data-0x7bffffe0>
    56cc:	000015b9 	0x15b9
    56d0:	00251d01 	0x251d01
    56d4:	41090000 	0x41090000
    56d8:	01000019 	multu	t0,zero
    56dc:	0000aa1d 	0xaa1d
    56e0:	461c0000 	add.s	$f0,$f0,$f28
    56e4:	01000019 	multu	t0,zero
    56e8:	08e7011d 	j	39c0474 <_data-0x7c63fb8c>
    56ec:	b9090000 	swr	t1,0(t0)
    56f0:	01000015 	0x1000015
    56f4:	0000251d 	0x251d
    56f8:	19410900 	0x19410900
    56fc:	1d010000 	0x1d010000
    5700:	0000009f 	0x9f
    5704:	1a480d00 	0x1a480d00
    5708:	1c010000 	0x1c010000
    570c:	000000c0 	ehb
    5710:	00000000 	nop
    5714:	0000000c 	syscall
    5718:	09389c01 	j	4e27004 <_data-0x7b1d8ffc>
    571c:	b9130000 	swr	s3,0(t0)
    5720:	01000015 	0x1000015
    5724:	0000251c 	0x251c
    5728:	0e540100 	jal	9500400 <_data-0x76affc00>
    572c:	000001c7 	0x1c7
    5730:	00000000 	nop
    5734:	00000004 	sllv	zero,zero,zero
    5738:	e20f1c01 	sc	t7,7169(s0)
    573c:	cf000001 	pref	0x0,1(t8)
    5740:	10000029 	b	57e8 <_data-0x7fffa818>
    5744:	00000000 	nop
    5748:	00000004 	sllv	zero,zero,zero
    574c:	0001ed1b 	0x1ed1b
    5750:	00540100 	0x540100
    5754:	a31d0000 	sb	sp,0(t8)
    5758:	0100001a 	div	zero,t0,zero
    575c:	0000b51c 	0xb51c
    5760:	09540100 	j	5500400 <_data-0x7aaffc00>
    5764:	b9090000 	swr	t1,0(t0)
    5768:	01000015 	0x1000015
    576c:	0000251c 	0x251c
    5770:	7e0d0000 	0x7e0d0000
    5774:	01000019 	multu	t0,zero
    5778:	0000aa1c 	0xaa1c
    577c:	00000000 	nop
    5780:	00000c00 	sll	at,zero,0x10
    5784:	a19c0100 	sb	gp,256(t4)
    5788:	13000009 	beqz	t8,57b0 <_data-0x7fffa850>
    578c:	000015b9 	0x15b9
    5790:	00251c01 	0x251c01
    5794:	54010000 	bnel	zero,at,5798 <_data-0x7fffa868>
    5798:	00022b0e 	0x22b0e
    579c:	00000000 	nop
    57a0:	00000400 	sll	zero,zero,0x10
    57a4:	171c0100 	bne	t8,gp,5ba8 <_data-0x7fffa458>
    57a8:	00000246 	0x246
    57ac:	00000010 	mfhi	zero
    57b0:	00000400 	sll	zero,zero,0x10
    57b4:	02511b00 	0x2511b00
    57b8:	54010000 	bnel	zero,at,57bc <_data-0x7fffa844>
    57bc:	1d000000 	bgtz	t0,57c0 <_data-0x7fffa840>
    57c0:	00001ace 	0x1ace
    57c4:	009f1c01 	0x9f1c01
    57c8:	bd010000 	cache	0x1,0(t0)
    57cc:	09000009 	j	4000024 <_data-0x7bffffdc>
    57d0:	000015b9 	0x15b9
    57d4:	00251c01 	0x251c01
    57d8:	1e000000 	bgtz	s0,57dc <_data-0x7fffa824>
    57dc:	000009a1 	0x9a1
    57e0:	00000000 	nop
    57e4:	0000000c 	syscall
    57e8:	09fe9c01 	j	7fa7004 <_data-0x78058ffc>
    57ec:	b11f0000 	0xb11f0000
    57f0:	01000009 	jalr	zero,t0
    57f4:	025d0e54 	0x25d0e54
    57f8:	00000000 	nop
    57fc:	00040000 	sll	zero,a0,0x0
    5800:	1c010000 	0x1c010000
    5804:	00027817 	0x27817
    5808:	00001000 	sll	v0,zero,0x0
    580c:	00040000 	sll	zero,a0,0x0
    5810:	831b0000 	lb	k1,0(t8)
    5814:	01000002 	0x1000002
    5818:	00000054 	0x54
    581c:	0009381e 	0x9381e
    5820:	00000000 	nop
    5824:	00000c00 	sll	at,zero,0x10
    5828:	439c0100 	c0	0x19c0100
    582c:	1f00000a 	bgtz	t8,5858 <_data-0x7fffa7a8>
    5830:	00000948 	0x948
    5834:	f90e5401 	sdc2	$14,21505(t0)
    5838:	00000001 	movf	zero,zero,$fcc0
    583c:	04000000 	bltz	zero,5840 <_data-0x7fffa7c0>
    5840:	01000000 	0x1000000
    5844:	02140f1c 	0x2140f1c
    5848:	29e20000 	slti	v0,t7,0
    584c:	00100000 	sll	zero,s0,0x0
    5850:	04000000 	bltz	zero,5854 <_data-0x7fffa7ac>
    5854:	1b000000 	blez	t8,5858 <_data-0x7fffa7a8>
    5858:	0000021f 	0x21f
    585c:	00005401 	0x5401
    5860:	08c41e00 	j	3107800 <_data-0x7cef8800>
    5864:	00000000 	nop
    5868:	000c0000 	sll	zero,t4,0x0
    586c:	9c010000 	0x9c010000
    5870:	00000a98 	0xa98
    5874:	0008d01f 	0x8d01f
    5878:	1f540100 	0x1f540100
    587c:	000008db 	0x8db
    5880:	880e5501 	lwl	t6,21761(zero)
    5884:	00000001 	movf	zero,zero,$fcc0
    5888:	04000000 	bltz	zero,588c <_data-0x7fffa774>
    588c:	01000000 	0x1000000
    5890:	01aa0f1d 	0x1aa0f1d
    5894:	29f50000 	slti	s5,t7,0
    5898:	9f0f0000 	0x9f0f0000
    589c:	08000001 	j	4 <_data-0x7ffffffc>
    58a0:	1000002a 	b	594c <_data-0x7fffa6b4>
    58a4:	00000000 	nop
    58a8:	00000004 	sllv	zero,zero,zero
    58ac:	0001b51b 	0x1b51b
    58b0:	00540100 	0x540100
    58b4:	a11e0000 	sb	s8,0(t0)
    58b8:	00000008 	jr	zero
    58bc:	0c000000 	jal	0 <_data-0x80000000>
    58c0:	01000000 	0x1000000
    58c4:	000aed9c 	0xaed9c
    58c8:	08ad1f00 	j	2b47c00 <_data-0x7d4b8400>
    58cc:	54010000 	bnel	zero,at,58d0 <_data-0x7fffa730>
    58d0:	0008b81f 	0x8b81f
    58d4:	0e550100 	jal	9540400 <_data-0x76abfc00>
    58d8:	00000149 	0x149
    58dc:	00000000 	nop
    58e0:	00000004 	sllv	zero,zero,zero
    58e4:	6b0f1d01 	0x6b0f1d01
    58e8:	1b000001 	blez	t8,58f0 <_data-0x7fffa710>
    58ec:	0f00002a 	jal	c0000a8 <_data-0x73ffff58>
    58f0:	00000160 	0x160
    58f4:	00002a2e 	0x2a2e
    58f8:	00000010 	mfhi	zero
    58fc:	00000400 	sll	zero,zero,0x10
    5900:	01761b00 	0x1761b00
    5904:	54010000 	bnel	zero,at,5908 <_data-0x7fffa6f8>
    5908:	20000000 	addi	zero,zero,0
    590c:	0000087e 	0x87e
    5910:	00000000 	nop
    5914:	0000000c 	syscall
    5918:	8a1f9c01 	lwl	ra,-25599(s0)
    591c:	01000008 	jr	t0
    5920:	08951f54 	j	2547d50 <_data-0x7dab82b0>
    5924:	55010000 	bnel	t0,at,5928 <_data-0x7fffa6d8>
    5928:	00010a0e 	0x10a0e
    592c:	00000000 	nop
    5930:	00000400 	sll	zero,zero,0x10
    5934:	0f1d0100 	jal	c740400 <_data-0x738bfc00>
    5938:	0000012c 	0x12c
    593c:	00002a41 	0x2a41
    5940:	0001210f 	0x1210f
    5944:	002a5400 	0x2a5400
    5948:	00001000 	sll	v0,zero,0x0
    594c:	00040000 	sll	zero,a0,0x0
    5950:	371b0000 	ori	k1,t8,0x0
    5954:	01000001 	movf	zero,t0,$fcc0
    5958:	00000054 	0x54
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
  f4:	193f012e 	0x193f012e
  f8:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
  fc:	0e6e0b3b 	jal	9b82cec <_data-0x7647d314>
 100:	13010b20 	beq	t8,at,2d84 <_data-0x7fffd27c>
 104:	2e170000 	sltiu	s7,s0,0
 108:	03193f01 	0x3193f01
 10c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 110:	1113490b 	beq	t0,s3,12540 <_data-0x7ffedac0>
 114:	40061201 	0x40061201
 118:	19429718 	0x19429718
 11c:	00001301 	0x1301
 120:	03003418 	0x3003418
 124:	3b0b3a0e 	xori	t3,t8,0x3a0e
 128:	0213490b 	0x213490b
 12c:	19000017 	blez	t0,18c <_data-0x7ffffe74>
 130:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
 134:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 138:	18021349 	0x18021349
 13c:	1d1a0000 	0x1d1a0000
 140:	52133101 	beql	s0,s3,c548 <_data-0x7fff3ab8>
 144:	58175501 	0x58175501
 148:	010b590b 	0x10b590b
 14c:	1b000013 	blez	t8,19c <_data-0x7ffffe64>
 150:	13310005 	beq	t9,s1,168 <_data-0x7ffffe98>
 154:	00001802 	srl	v1,zero,0x0
 158:	55010b1c 	bnel	t0,at,2dcc <_data-0x7fffd234>
 15c:	1d000017 	bgtz	t0,1bc <_data-0x7ffffe44>
 160:	1331011d 	beq	t9,s1,5d8 <_data-0x7ffffa28>
 164:	17550152 	bne	k0,s5,6b0 <_data-0x7ffff950>
 168:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 16c:	051e0000 	0x51e0000
 170:	1c133100 	0x1c133100
 174:	1f00000b 	bgtz	t8,1a4 <_data-0x7ffffe5c>
 178:	1331011d 	beq	t9,s1,5f0 <_data-0x7ffffa10>
 17c:	06120111 	bltzall	s0,5c4 <_data-0x7ffffa3c>
 180:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 184:	00001301 	0x1301
 188:	31000520 	andi	zero,t0,0x520
 18c:	00170213 	0x170213
 190:	82892100 	lb	t1,8448(s4)
 194:	01110101 	0x1110101
 198:	00001331 	tgeu	zero,zero,0x4c
 19c:	01828a22 	0x1828a22
 1a0:	91180200 	lbu	t8,512(t0)
 1a4:	00001842 	srl	v1,zero,0x1
 1a8:	31003423 	andi	zero,t0,0x3423
 1ac:	000d1c13 	0xd1c13
 1b0:	00342400 	0x342400
 1b4:	17021331 	bne	t8,v0,4e7c <_data-0x7fffb184>
 1b8:	0b250000 	j	c940000 <_data-0x736c0000>
 1bc:	12011101 	beq	s0,at,45c4 <_data-0x7fffba3c>
 1c0:	26000006 	addiu	zero,s0,6
 1c4:	1331011d 	beq	t9,s1,63c <_data-0x7ffff9c4>
 1c8:	06120111 	bltzall	s0,610 <_data-0x7ffff9f0>
 1cc:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 1d0:	05270000 	0x5270000
 1d4:	00133100 	sll	a2,s3,0x4
 1d8:	82892800 	lb	t1,10240(s4)
 1dc:	01110101 	0x1110101
 1e0:	13011331 	beq	t8,at,4ea8 <_data-0x7fffb158>
 1e4:	89290000 	lwl	t1,0(t1)
 1e8:	11000182 	beqz	t0,7f4 <_data-0x7ffff80c>
 1ec:	00133101 	0x133101
 1f0:	00342a00 	0x342a00
 1f4:	00001331 	tgeu	zero,zero,0x4c
 1f8:	0b00242b 	j	c0090ac <_data-0x73ff6f54>
 1fc:	030b3e0b 	0x30b3e0b
 200:	2c000008 	sltiu	zero,zero,8
 204:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
 208:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 20c:	00001349 	0x1349
 210:	0b000f2d 	j	c003cb4 <_data-0x73ffc34c>
 214:	0013490b 	0x13490b
 218:	012e2e00 	0x12e2e00
 21c:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 220:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 224:	13490e6e 	beq	k0,t1,3be0 <_data-0x7fffc420>
 228:	13010b20 	beq	t8,at,2eac <_data-0x7fffd154>
 22c:	2e2f0000 	sltiu	t7,s1,0
 230:	03193f01 	0x3193f01
 234:	3b0b3a0e 	xori	t3,t8,0x3a0e
 238:	110e6e0b 	beq	t0,t6,1ba68 <_data-0x7ffe4598>
 23c:	40061201 	0x40061201
 240:	19429718 	0x19429718
 244:	00001301 	0x1301
 248:	03000530 	tge	t8,zero,0x14
 24c:	3b0b3a08 	xori	t3,t8,0x3a08
 250:	0213490b 	0x213490b
 254:	31000017 	andi	zero,t0,0x17
 258:	00018289 	0x18289
 25c:	42950111 	c0	0x950111
 260:	00133119 	0x133119
 264:	010b3200 	0x10b3200
 268:	06120111 	bltzall	s0,6b0 <_data-0x7ffff950>
 26c:	00001301 	0x1301
 270:	03003433 	tltu	t8,zero,0xd0
 274:	3b0b3a08 	xori	t3,t8,0x3a08
 278:	0213490b 	0x213490b
 27c:	34000017 	li	zero,0x17
 280:	08030005 	j	c0014 <_data-0x7ff3ffec>
 284:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 288:	18021349 	0x18021349
 28c:	34350000 	ori	s5,at,0x0
 290:	3a0e0300 	xori	t6,s0,0x300
 294:	490b3b0b 	bc2tl	$cc2,eec4 <_data-0x7fff113c>
 298:	000d1c13 	0xd1c13
 29c:	00363600 	0x363600
 2a0:	00001802 	srl	v1,zero,0x0
 2a4:	00110100 	sll	zero,s1,0x4
 2a8:	01110610 	0x1110610
 2ac:	0e030112 	jal	80c0448 <_data-0x77f3fbb8>
 2b0:	0e250e1b 	jal	894386c <_data-0x776bc794>
 2b4:	00000513 	0x513
 2b8:	01110100 	0x1110100
 2bc:	0b130e25 	j	c4c3894 <_data-0x73b3c76c>
 2c0:	0e1b0e03 	jal	86c380c <_data-0x7793c7f4>
 2c4:	01111755 	0x1111755
 2c8:	00001710 	0x1710
 2cc:	0b002402 	j	c009008 <_data-0x73ff6ff8>
 2d0:	030b3e0b 	0x30b3e0b
 2d4:	0300000e 	0x300000e
 2d8:	0e030016 	jal	80c0058 <_data-0x77f3ffa8>
 2dc:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 2e0:	00001349 	0x1349
 2e4:	49002604 	bc2f	9af8 <_data-0x7fff6508>
 2e8:	05000013 	bltz	t0,338 <_data-0x7ffffcc8>
 2ec:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 2f0:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 2f4:	01060000 	0x1060000
 2f8:	01134901 	0x1134901
 2fc:	07000013 	bltz	t8,34c <_data-0x7ffffcb4>
 300:	13490021 	beq	k0,t1,388 <_data-0x7ffffc78>
 304:	00000b2f 	0xb2f
 308:	0b000f08 	j	c003c20 <_data-0x73ffc3e0>
 30c:	0013490b 	0x13490b
 310:	00340900 	0x340900
 314:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 318:	13490b3b 	beq	k0,t1,3008 <_data-0x7fffcff8>
 31c:	1802193f 	0x1802193f
 320:	130a0000 	beq	t8,t2,324 <_data-0x7ffffcdc>
 324:	3a0b0b01 	xori	t3,s0,0xb01
 328:	010b3b0b 	0x10b3b0b
 32c:	0b000013 	j	c00004c <_data-0x73ffffb4>
 330:	0e03000d 	jal	80c0034 <_data-0x77f3ffcc>
 334:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 338:	0b381349 	j	ce04d24 <_data-0x731fb2dc>
 33c:	0d0c0000 	jal	4300000 <_data-0x7bd00000>
 340:	3a080300 	xori	t0,s0,0x300
 344:	490b3b0b 	bc2tl	$cc2,ef74 <_data-0x7fff108c>
 348:	000b3813 	0xb3813
 34c:	00340d00 	0x340d00
 350:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 354:	13490b3b 	beq	k0,t1,3044 <_data-0x7fffcfbc>
 358:	193c193f 	0x193c193f
 35c:	2e0e0000 	sltiu	t6,s0,0
 360:	03193f01 	0x3193f01
 364:	3b0b3a0e 	xori	t3,t8,0x3a0e
 368:	1119270b 	beq	t0,t9,9f98 <_data-0x7fff6068>
 36c:	40061201 	0x40061201
 370:	19429718 	0x19429718
 374:	00001301 	0x1301
 378:	0300050f 	0x300050f
 37c:	3b0b3a08 	xori	t3,t8,0x3a08
 380:	0213490b 	0x213490b
 384:	10000017 	b	3e4 <_data-0x7ffffc1c>
 388:	0e030005 	jal	80c0014 <_data-0x77f3ffec>
 38c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 390:	17021349 	bne	t8,v0,50b8 <_data-0x7fffaf48>
 394:	0b110000 	j	c440000 <_data-0x73bc0000>
 398:	12011101 	beq	s0,at,47a0 <_data-0x7fffb860>
 39c:	00130106 	0x130106
 3a0:	00341200 	0x341200
 3a4:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 3a8:	13490b3b 	beq	k0,t1,3098 <_data-0x7fffcf68>
 3ac:	00001702 	srl	v0,zero,0x1c
 3b0:	03003413 	0x3003413
 3b4:	3b0b3a08 	xori	t3,t8,0x3a08
 3b8:	0013490b 	0x13490b
 3bc:	011d1400 	0x11d1400
 3c0:	01111331 	tgeu	t0,s1,0x4c
 3c4:	0b580612 	j	d601848 <_data-0x729fe7b8>
 3c8:	13010b59 	beq	t8,at,3130 <_data-0x7fffced0>
 3cc:	0b150000 	j	c540000 <_data-0x73ac0000>
 3d0:	12011101 	beq	s0,at,47d8 <_data-0x7fffb828>
 3d4:	16000006 	bnez	s0,3f0 <_data-0x7ffffc10>
 3d8:	13310034 	beq	t9,s1,4ac <_data-0x7ffffb54>
 3dc:	89170000 	lwl	s7,0(t0)
 3e0:	11010182 	beq	t0,at,9ec <_data-0x7ffff614>
 3e4:	01133101 	0x1133101
 3e8:	18000013 	blez	zero,438 <_data-0x7ffffbc8>
 3ec:	0001828a 	0x1828a
 3f0:	42911802 	c0	0x911802
 3f4:	19000018 	blez	t0,458 <_data-0x7ffffba8>
 3f8:	01018289 	0x1018289
 3fc:	13310111 	beq	t9,s1,844 <_data-0x7ffff7bc>
 400:	891a0000 	lwl	k0,0(t0)
 404:	11000182 	beqz	t0,a10 <_data-0x7ffff5f0>
 408:	00133101 	0x133101
 40c:	82891b00 	lb	t1,6912(s4)
 410:	01110101 	0x1110101
 414:	31194295 	andi	t9,t0,0x4295
 418:	1c000013 	bgtz	zero,468 <_data-0x7ffffb98>
 41c:	193f012e 	0x193f012e
 420:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 424:	01110b3b 	0x1110b3b
 428:	18400612 	blez	v0,1c74 <_data-0x7fffe38c>
 42c:	01194297 	0x1194297
 430:	1d000013 	bgtz	t0,480 <_data-0x7ffffb80>
 434:	1755010b 	bne	k0,s5,864 <_data-0x7ffff79c>
 438:	341e0000 	li	s8,0x0
 43c:	3a080300 	xori	t0,s0,0x300
 440:	490b3b0b 	bc2tl	$cc2,f070 <_data-0x7fff0f90>
 444:	00170213 	0x170213
 448:	010b1f00 	0x10b1f00
 44c:	13011755 	beq	t8,at,61a4 <_data-0x7fff9e5c>
 450:	2e200000 	sltiu	zero,s1,0
 454:	03193f01 	0x3193f01
 458:	3b0b3a0e 	xori	t3,t8,0x3a0e
 45c:	2013490b 	addi	s3,zero,18699
 460:	0013010b 	0x13010b
 464:	82892100 	lb	t1,8448(s4)
 468:	01110101 	0x1110101
 46c:	31194295 	andi	t9,t0,0x4295
 470:	00130113 	0x130113
 474:	012e2200 	0x12e2200
 478:	01111331 	tgeu	t0,s1,0x4c
 47c:	18400612 	blez	v0,1cc8 <_data-0x7fffe338>
 480:	01194297 	0x1194297
 484:	23000013 	addi	zero,t8,19
 488:	13310034 	beq	t9,s1,55c <_data-0x7ffffaa4>
 48c:	00001802 	srl	v1,zero,0x0
 490:	3f002e24 	0x3f002e24
 494:	6e193c19 	0x6e193c19
 498:	3a0e030e 	xori	t6,s0,0x30e
 49c:	000b3b0b 	0xb3b0b
 4a0:	11010000 	beq	t0,at,4a4 <_data-0x7ffffb5c>
 4a4:	130e2501 	beq	t8,t6,98ac <_data-0x7fff6754>
 4a8:	1b0e030b 	0x1b0e030b
 4ac:	1117550e 	beq	t0,s7,158e8 <_data-0x7ffea718>
 4b0:	00171001 	0x171001
 4b4:	000f0200 	sll	zero,t7,0x8
 4b8:	00000b0b 	0xb0b
 4bc:	0b002403 	j	c00900c <_data-0x73ff6ff4>
 4c0:	030b3e0b 	0x30b3e0b
 4c4:	0400000e 	bltz	zero,500 <_data-0x7ffffb00>
 4c8:	193f012e 	0x193f012e
 4cc:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 4d0:	19270b3b 	0x19270b3b
 4d4:	01111349 	0x1111349
 4d8:	18400612 	blez	v0,1d24 <_data-0x7fffe2dc>
 4dc:	01194297 	0x1194297
 4e0:	05000013 	bltz	t0,530 <_data-0x7ffffad0>
 4e4:	08030005 	j	c0014 <_data-0x7ff3ffec>
 4e8:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 4ec:	17021349 	bne	t8,v0,5214 <_data-0x7fffadec>
 4f0:	18060000 	0x18060000
 4f4:	07000000 	bltz	t8,4f8 <_data-0x7ffffb08>
 4f8:	08030034 	j	c00d0 <_data-0x7ff3ff30>
 4fc:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 500:	17021349 	bne	t8,v0,5228 <_data-0x7fffadd8>
 504:	34080000 	li	t0,0x0
 508:	3a080300 	xori	t0,s0,0x300
 50c:	490b3b0b 	bc2tl	$cc2,f13c <_data-0x7fff0ec4>
 510:	00180213 	0x180213
 514:	000a0900 	sll	at,t2,0x4
 518:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 51c:	01110b3b 	0x1110b3b
 520:	0b0a0000 	j	c280000 <_data-0x73d80000>
 524:	01175501 	0x1175501
 528:	0b000013 	j	c00004c <_data-0x73ffffb4>
 52c:	193f012e 	0x193f012e
 530:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 534:	13490b3b 	beq	k0,t1,3224 <_data-0x7fffcddc>
 538:	1301193c 	beq	t8,at,6a2c <_data-0x7fff95d4>
 53c:	890c0000 	lwl	t4,0(t0)
 540:	11000182 	beqz	t0,b4c <_data-0x7ffff4b4>
 544:	00133101 	0x133101
 548:	82890d00 	lb	t1,3328(s4)
 54c:	01110101 	0x1110101
 550:	13011331 	beq	t8,at,5218 <_data-0x7fffade8>
 554:	8a0e0000 	lwl	t6,0(s0)
 558:	02000182 	0x2000182
 55c:	18429118 	0x18429118
 560:	890f0000 	lwl	t7,0(t0)
 564:	11010182 	beq	t0,at,b70 <_data-0x7ffff490>
 568:	00133101 	0x133101
 56c:	010b1000 	0x10b1000
 570:	00001755 	0x1755
 574:	11010b11 	beq	t0,at,31bc <_data-0x7fffce44>
 578:	01061201 	0x1061201
 57c:	12000013 	beqz	s0,5cc <_data-0x7ffffa34>
 580:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 584:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 588:	0f130000 	jal	c4c0000 <_data-0x73b40000>
 58c:	490b0b00 	bc2tl	$cc2,3190 <_data-0x7fffce70>
 590:	14000013 	bnez	zero,5e0 <_data-0x7ffffa20>
 594:	13490026 	beq	k0,t1,630 <_data-0x7ffff9d0>
 598:	2e150000 	sltiu	s5,s0,0
 59c:	3c193f00 	lui	t9,0x3f00
 5a0:	030e6e19 	0x30e6e19
 5a4:	3b0b3a0e 	xori	t3,t8,0x3a0e
 5a8:	0000000b 	movn	zero,zero,zero
 5ac:	25011101 	addiu	at,t0,4353
 5b0:	030b130e 	0x30b130e
 5b4:	550e1b0e 	bnel	t0,t6,71f0 <_data-0x7fff8e10>
 5b8:	10011117 	beq	zero,at,4a18 <_data-0x7fffb5e8>
 5bc:	02000017 	0x2000017
 5c0:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 5c4:	0e030b3e 	jal	80c2cf8 <_data-0x77f3d308>
 5c8:	2e030000 	sltiu	v1,s0,0
 5cc:	03193f01 	0x3193f01
 5d0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 5d4:	4919270b 	bc2t	$cc6,a204 <_data-0x7fff5dfc>
 5d8:	12011113 	beq	s0,at,4a28 <_data-0x7fffb5d8>
 5dc:	97184006 	lhu	t8,16390(t8)
 5e0:	13011942 	beq	t8,at,6aec <_data-0x7fff9514>
 5e4:	05040000 	0x5040000
 5e8:	3a080300 	xori	t0,s0,0x300
 5ec:	490b3b0b 	bc2tl	$cc2,f21c <_data-0x7fff0de4>
 5f0:	00170213 	0x170213
 5f4:	00050500 	sll	zero,a1,0x14
 5f8:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 5fc:	13490b3b 	beq	k0,t1,32ec <_data-0x7fffcd14>
 600:	00001702 	srl	v0,zero,0x1c
 604:	03003406 	0x3003406
 608:	3b0b3a08 	xori	t3,t8,0x3a08
 60c:	0213490b 	0x213490b
 610:	07000017 	bltz	t8,670 <_data-0x7ffff990>
 614:	08030034 	j	c00d0 <_data-0x7ff3ff30>
 618:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 61c:	18021349 	0x18021349
 620:	34080000 	li	t0,0x0
 624:	3a0e0300 	xori	t6,s0,0x300
 628:	490b3b0b 	bc2tl	$cc2,f258 <_data-0x7fff0da8>
 62c:	00170213 	0x170213
 630:	010b0900 	0x10b0900
 634:	06120111 	bltzall	s0,a7c <_data-0x7ffff584>
 638:	00001301 	0x1301
 63c:	3f012e0a 	0x3f012e0a
 640:	3a0e0319 	xori	t6,s0,0x319
 644:	490b3b0b 	bc2tl	$cc2,f274 <_data-0x7fff0d8c>
 648:	01193c13 	0x1193c13
 64c:	0b000013 	j	c00004c <_data-0x73ffffb4>
 650:	00000018 	mult	zero,zero
 654:	0182890c 	syscall	0x60a24
 658:	31011101 	andi	at,t0,0x1101
 65c:	0d000013 	jal	400004c <_data-0x7bffffb4>
 660:	0001828a 	0x1828a
 664:	42911802 	c0	0x911802
 668:	0e000018 	jal	8000060 <_data-0x77ffffa0>
 66c:	0111010b 	0x111010b
 670:	00000612 	0x612
 674:	0182890f 	0x182890f
 678:	31011100 	andi	at,t0,0x1100
 67c:	10000013 	b	6cc <_data-0x7ffff934>
 680:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 684:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 688:	01110000 	0x1110000
 68c:	01134901 	0x1134901
 690:	12000013 	beqz	s0,6e0 <_data-0x7ffff920>
 694:	13490021 	beq	k0,t1,71c <_data-0x7ffff8e4>
 698:	00000b2f 	0xb2f
 69c:	3f002e13 	0x3f002e13
 6a0:	6e193c19 	0x6e193c19
 6a4:	3a0e030e 	xori	t6,s0,0x30e
 6a8:	000b3b0b 	0xb3b0b
 6ac:	11010000 	beq	t0,at,6b0 <_data-0x7ffff950>
 6b0:	130e2501 	beq	t8,t6,9ab8 <_data-0x7fff6548>
 6b4:	1b0e030b 	0x1b0e030b
 6b8:	1117550e 	beq	t0,s7,15af4 <_data-0x7ffea50c>
 6bc:	00171001 	0x171001
 6c0:	000f0200 	sll	zero,t7,0x8
 6c4:	00000b0b 	0xb0b
 6c8:	0b002403 	j	c00900c <_data-0x73ff6ff4>
 6cc:	030b3e0b 	0x30b3e0b
 6d0:	0400000e 	bltz	zero,70c <_data-0x7ffff8f4>
 6d4:	0e030016 	jal	80c0058 <_data-0x77f3ffa8>
 6d8:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 6dc:	00001349 	0x1349
 6e0:	3f012e05 	0x3f012e05
 6e4:	3a0e0319 	xori	t6,s0,0x319
 6e8:	27053b0b 	addiu	a1,t8,15115
 6ec:	12011119 	beq	s0,at,4b54 <_data-0x7fffb4ac>
 6f0:	97184006 	lhu	t8,16390(t8)
 6f4:	13011942 	beq	t8,at,6c00 <_data-0x7fff9400>
 6f8:	05060000 	0x5060000
 6fc:	3a080300 	xori	t0,s0,0x300
 700:	49053b0b 	bc2t	$cc1,f330 <_data-0x7fff0cd0>
 704:	00180213 	0x180213
 708:	00050700 	sll	zero,a1,0x1c
 70c:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 710:	1349053b 	beq	k0,t1,1c00 <_data-0x7fffe400>
 714:	00001702 	srl	v0,zero,0x1c
 718:	01828908 	0x1828908
 71c:	95011101 	lhu	at,4353(t0)
 720:	13311942 	beq	t9,s1,6c2c <_data-0x7fff93d4>
 724:	8a090000 	lwl	t1,0(s0)
 728:	02000182 	0x2000182
 72c:	18429118 	0x18429118
 730:	2e0a0000 	sltiu	t2,s0,0
 734:	03193f01 	0x3193f01
 738:	3b0b3a0e 	xori	t3,t8,0x3a0e
 73c:	49192705 	bc2t	$cc6,a354 <_data-0x7fff5cac>
 740:	12011113 	beq	s0,at,4b90 <_data-0x7fffb470>
 744:	97184006 	lhu	t8,16390(t8)
 748:	13011942 	beq	t8,at,6c54 <_data-0x7fff93ac>
 74c:	340b0000 	li	t3,0x0
 750:	3a080300 	xori	t0,s0,0x300
 754:	49053b0b 	bc2t	$cc1,f384 <_data-0x7fff0c7c>
 758:	00180213 	0x180213
 75c:	00240c00 	0x240c00
 760:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 764:	00000803 	sra	at,zero,0x0
 768:	0b000f0d 	j	c003c34 <_data-0x73ffc3cc>
 76c:	0013490b 	0x13490b
 770:	00260e00 	0x260e00
 774:	260f0000 	addiu	t7,s0,0
 778:	00134900 	sll	t1,s3,0x4
 77c:	00341000 	0x341000
 780:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 784:	1349053b 	beq	k0,t1,1c74 <_data-0x7fffe38c>
 788:	00001702 	srl	v0,zero,0x1c
 78c:	3f012e11 	0x3f012e11
 790:	3a0e0319 	xori	t6,s0,0x319
 794:	270b3b0b 	addiu	t3,t8,15115
 798:	11134919 	beq	t0,s3,12c00 <_data-0x7ffed400>
 79c:	40061201 	0x40061201
 7a0:	19429718 	0x19429718
 7a4:	00001301 	0x1301
 7a8:	03000512 	0x3000512
 7ac:	3b0b3a08 	xori	t3,t8,0x3a08
 7b0:	0213490b 	0x213490b
 7b4:	13000017 	beqz	t8,814 <_data-0x7ffff7ec>
 7b8:	08030005 	j	c0014 <_data-0x7ff3ffec>
 7bc:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 7c0:	18021349 	0x18021349
 7c4:	34140000 	li	s4,0x0
 7c8:	3a080300 	xori	t0,s0,0x300
 7cc:	490b3b0b 	bc2tl	$cc2,f3fc <_data-0x7fff0c04>
 7d0:	00170213 	0x170213
 7d4:	012e1500 	0x12e1500
 7d8:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 7dc:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 7e0:	13491927 	beq	k0,t1,6c80 <_data-0x7fff9380>
 7e4:	06120111 	bltzall	s0,c2c <_data-0x7ffff3d4>
 7e8:	42971840 	c0	0x971840
 7ec:	00000019 	multu	zero,zero
 7f0:	25011101 	addiu	at,t0,4353
 7f4:	030b130e 	0x30b130e
 7f8:	550e1b0e 	bnel	t0,t6,7434 <_data-0x7fff8bcc>
 7fc:	10011117 	beq	zero,at,4c5c <_data-0x7fffb3a4>
 800:	02000017 	0x2000017
 804:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 808:	0e030b3e 	jal	80c2cf8 <_data-0x77f3d308>
 80c:	2e030000 	sltiu	v1,s0,0
 810:	03193f01 	0x3193f01
 814:	3b0b3a0e 	xori	t3,t8,0x3a0e
 818:	4919270b 	bc2t	$cc6,a448 <_data-0x7fff5bb8>
 81c:	12011113 	beq	s0,at,4c6c <_data-0x7fffb394>
 820:	97184006 	lhu	t8,16390(t8)
 824:	13011942 	beq	t8,at,6d30 <_data-0x7fff92d0>
 828:	05040000 	0x5040000
 82c:	3a080300 	xori	t0,s0,0x300
 830:	490b3b0b 	bc2tl	$cc2,f460 <_data-0x7fff0ba0>
 834:	00170213 	0x170213
 838:	012e0500 	0x12e0500
 83c:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 840:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 844:	193c1349 	0x193c1349
 848:	00001301 	0x1301
 84c:	00001806 	srlv	v1,zero,zero
 850:	82890700 	lb	t1,1792(s4)
 854:	01110101 	0x1110101
 858:	13011331 	beq	t8,at,5520 <_data-0x7fffaae0>
 85c:	8a080000 	lwl	t0,0(s0)
 860:	02000182 	0x2000182
 864:	18429118 	0x18429118
 868:	89090000 	lwl	t1,0(t0)
 86c:	11010182 	beq	t0,at,e78 <_data-0x7ffff188>
 870:	00133101 	0x133101
 874:	00240a00 	0x240a00
 878:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 87c:	00000803 	sra	at,zero,0x0
 880:	0b000f0b 	j	c003c2c <_data-0x73ffc3d4>
 884:	0013490b 	0x13490b
 888:	00260c00 	0x260c00
 88c:	00001349 	0x1349
 890:	0300340d 	break	0x300,0xd0
 894:	3b0b3a08 	xori	t3,t8,0x3a08
 898:	0213490b 	0x213490b
 89c:	0e000017 	jal	800005c <_data-0x77ffffa4>
 8a0:	1755010b 	bne	k0,s5,cd0 <_data-0x7ffff330>
 8a4:	0b0f0000 	j	c3c0000 <_data-0x73c40000>
 8a8:	12011101 	beq	s0,at,4cb0 <_data-0x7fffb350>
 8ac:	00130106 	0x130106
 8b0:	002e1000 	0x2e1000
 8b4:	193c193f 	0x193c193f
 8b8:	0e030e6e 	jal	80c39b8 <_data-0x77f3c648>
 8bc:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 8c0:	01000000 	0x1000000
 8c4:	0e250111 	jal	8940444 <_data-0x776bfbbc>
 8c8:	0e030b13 	jal	80c2c4c <_data-0x77f3d3b4>
 8cc:	17550e1b 	bne	k0,s5,413c <_data-0x7fffbec4>
 8d0:	17100111 	bne	t8,s0,d18 <_data-0x7ffff2e8>
 8d4:	24020000 	li	v0,0
 8d8:	3e0b0b00 	0x3e0b0b00
 8dc:	000e030b 	0xe030b
 8e0:	00240300 	0x240300
 8e4:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 8e8:	00000803 	sra	at,zero,0x0
 8ec:	03001604 	0x3001604
 8f0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 8f4:	0013490b 	0x13490b
 8f8:	012e0500 	0x12e0500
 8fc:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 900:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 904:	13491927 	beq	k0,t1,6da4 <_data-0x7fff925c>
 908:	06120111 	bltzall	s0,d50 <_data-0x7ffff2b0>
 90c:	42971840 	c0	0x971840
 910:	00130119 	0x130119
 914:	00050600 	sll	zero,a1,0x18
 918:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 91c:	13490b3b 	beq	k0,t1,360c <_data-0x7fffc9f4>
 920:	00001702 	srl	v0,zero,0x1c
 924:	01828907 	0x1828907
 928:	31011101 	andi	at,t0,0x1101
 92c:	08000013 	j	4c <_data-0x7fffffb4>
 930:	0001828a 	0x1828a
 934:	42911802 	c0	0x911802
 938:	09000018 	j	4000060 <_data-0x7bffffa0>
 93c:	193f002e 	0x193f002e
 940:	0e6e193c 	jal	9b864f0 <_data-0x76479b10>
 944:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 948:	00000b3b 	0xb3b
 94c:	01110100 	0x1110100
 950:	0b130e25 	j	c4c3894 <_data-0x73b3c76c>
 954:	0e1b0e03 	jal	86c380c <_data-0x7793c7f4>
 958:	01111755 	0x1111755
 95c:	00001710 	0x1710
 960:	0b000f02 	j	c003c08 <_data-0x73ffc3f8>
 964:	0300000b 	movn	zero,t8,zero
 968:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 96c:	0e030b3e 	jal	80c2cf8 <_data-0x77f3d308>
 970:	35040000 	ori	a0,t0,0x0
 974:	00134900 	sll	t1,s3,0x4
 978:	00160500 	sll	zero,s6,0x14
 97c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 980:	13490b3b 	beq	k0,t1,3670 <_data-0x7fffc990>
 984:	24060000 	li	a2,0
 988:	3e0b0b00 	0x3e0b0b00
 98c:	0008030b 	0x8030b
 990:	012e0700 	0x12e0700
 994:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 998:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 99c:	0b200e6e 	j	c8039b8 <_data-0x737fc648>
 9a0:	00001301 	0x1301
 9a4:	03002f08 	0x3002f08
 9a8:	00134908 	0x134908
 9ac:	00050900 	sll	at,a1,0x4
 9b0:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 9b4:	13490b3b 	beq	k0,t1,36a4 <_data-0x7fffc95c>
 9b8:	340a0000 	li	t2,0x0
 9bc:	3a080300 	xori	t0,s0,0x300
 9c0:	490b3b0b 	bc2tl	$cc2,f5f0 <_data-0x7fff0a10>
 9c4:	0b000013 	j	c00004c <_data-0x73ffffb4>
 9c8:	0b0b000f 	j	c2c003c <_data-0x73d3ffc4>
 9cc:	00001349 	0x1349
 9d0:	3f012e0c 	0x3f012e0c
 9d4:	3a0e0319 	xori	t6,s0,0x319
 9d8:	6e0b3b0b 	0x6e0b3b0b
 9dc:	2013490e 	addi	s3,zero,18702
 9e0:	0013010b 	0x13010b
 9e4:	012e0d00 	0x12e0d00
 9e8:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 9ec:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 9f0:	01111349 	0x1111349
 9f4:	18400612 	blez	v0,2240 <_data-0x7fffddc0>
 9f8:	01194297 	0x1194297
 9fc:	0e000013 	jal	800004c <_data-0x77ffffb4>
 a00:	1331011d 	beq	t9,s1,e78 <_data-0x7ffff188>
 a04:	06120111 	bltzall	s0,e4c <_data-0x7ffff1b4>
 a08:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 a0c:	050f0000 	0x50f0000
 a10:	02133100 	0x2133100
 a14:	10000017 	b	a74 <_data-0x7ffff58c>
 a18:	0111010b 	0x111010b
 a1c:	00000612 	0x612
 a20:	31003411 	andi	zero,t0,0x3411
 a24:	000d1c13 	0xd1c13
 a28:	012e1200 	0x12e1200
 a2c:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 a30:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 a34:	06120111 	bltzall	s0,e7c <_data-0x7ffff184>
 a38:	42971840 	c0	0x971840
 a3c:	00130119 	0x130119
 a40:	00051300 	sll	v0,a1,0xc
 a44:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 a48:	13490b3b 	beq	k0,t1,3738 <_data-0x7fffc8c8>
 a4c:	00001802 	srl	v1,zero,0x0
 a50:	03003414 	0x3003414
 a54:	3b0b3a0e 	xori	t3,t8,0x3a0e
 a58:	0213490b 	0x213490b
 a5c:	15000017 	bnez	t0,abc <_data-0x7ffff544>
 a60:	00018289 	0x18289
 a64:	13310111 	beq	t9,s1,eac <_data-0x7ffff154>
 a68:	1d160000 	0x1d160000
 a6c:	11133101 	beq	t0,s3,ce74 <_data-0x7fff318c>
 a70:	58061201 	0x58061201
 a74:	010b590b 	0x10b590b
 a78:	17000013 	bnez	t8,ac8 <_data-0x7ffff538>
 a7c:	13310005 	beq	t9,s1,a94 <_data-0x7ffff56c>
 a80:	1d180000 	0x1d180000
 a84:	52133101 	beql	s0,s3,ce8c <_data-0x7fff3174>
 a88:	58175501 	0x58175501
 a8c:	010b590b 	0x10b590b
 a90:	19000013 	blez	t0,ae0 <_data-0x7ffff520>
 a94:	1331011d 	beq	t9,s1,f0c <_data-0x7ffff0f4>
 a98:	17550152 	bne	k0,s5,fe4 <_data-0x7ffff01c>
 a9c:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 aa0:	0b1a0000 	j	c680000 <_data-0x73980000>
 aa4:	00175501 	0x175501
 aa8:	00341b00 	0x341b00
 aac:	18021331 	0x18021331
 ab0:	2e1c0000 	sltiu	gp,s0,0
 ab4:	03193f01 	0x3193f01
 ab8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 abc:	010b200b 	movn	a0,t0,t3
 ac0:	1d000013 	bgtz	t0,b10 <_data-0x7ffff4f0>
 ac4:	193f012e 	0x193f012e
 ac8:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 acc:	13490b3b 	beq	k0,t1,37bc <_data-0x7fffc844>
 ad0:	13010b20 	beq	t8,at,3754 <_data-0x7fffc8ac>
 ad4:	2e1e0000 	sltiu	s8,s0,0
 ad8:	11133101 	beq	t0,s3,cee0 <_data-0x7fff3120>
 adc:	40061201 	0x40061201
 ae0:	19429718 	0x19429718
 ae4:	00001301 	0x1301
 ae8:	3100051f 	andi	zero,t0,0x51f
 aec:	00180213 	0x180213
 af0:	012e2000 	0x12e2000
 af4:	01111331 	tgeu	t0,s1,0x4c
 af8:	18400612 	blez	v0,2344 <_data-0x7fffdcbc>
 afc:	00194297 	0x194297
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
       0:	880003c8 	lwl	zero,968(zero)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	880003cc 	lwl	zero,972(zero)
       8:	14520001 	bne	v0,s2,10 <_data-0x7ffffff0>
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
       c:	a8880005 	swl	t0,5(a0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	01880005 	0x1880005
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	00006000 	sll	t4,zero,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	00000000 	nop
      1c:	03ac0000 	0x3ac0000
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
      20:	03b48800 	0x3b48800
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	00028800 	sll	s1,v0,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	00009f30 	tge	zero,zero,0x27c
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	00000000 	nop
      30:	03d80000 	0x3d80000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	03e48800 	0x3e48800
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	00018800 	sll	s1,at,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	00000062 	0x62
      40:	00000000 	nop
      44:	0003d800 	sll	k1,v1,0x0
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
      48:	00051488 	0x51488
      4c:	08000688 	j	1a20 <_data-0x7fffe5e0>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	1f2447b4 	0x1f2447b4
      54:	0005a89f 	0x5a89f
      58:	0005c088 	0x5c088
      5c:	08000688 	j	1a20 <_data-0x7fffe5e0>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
      60:	1f2447b4 	0x1f2447b4
      64:	0000009f 	0x9f
      68:	00000000 	nop
      6c:	00051400 	sll	v0,a1,0x10
      70:	0005a888 	0x5a888
      74:	08000688 	j	1a20 <_data-0x7fffe5e0>
      78:	1f2447ba 	0x1f2447ba
      7c:	0000009f 	0x9f
      80:	00000000 	nop
      84:	0003e400 	sll	gp,v1,0x10
      88:	00049c88 	0x49c88
      8c:	f2000688 	0xf2000688
      90:	00003f1c 	0x3f1c
	...
      9c:	0003e400 	sll	gp,v1,0x10
      a0:	00049c88 	0x49c88
      a4:	30000288 	andi	zero,zero,0x288
      a8:	0000009f 	0x9f
      ac:	00000000 	nop
      b0:	0003e400 	sll	gp,v1,0x10
      b4:	00049c88 	0x49c88
      b8:	08000388 	j	e20 <_data-0x7ffff1e0>
      bc:	00009f20 	0x9f20
      c0:	00000000 	nop
      c4:	03e40000 	0x3e40000
      c8:	049c8800 	0x49c8800
      cc:	00038800 	sll	s1,v1,0x0
      d0:	009f5d08 	0x9f5d08
      d4:	00000000 	nop
      d8:	e4000000 	swc1	$f0,0(zero)
      dc:	9c880003 	0x9c880003
      e0:	03880004 	sllv	zero,t0,gp
      e4:	9f780800 	0x9f780800
	...
      f0:	880003e4 	lwl	zero,996(zero)
      f4:	8800049c 	lwl	zero,1180(zero)
      f8:	65080003 	0x65080003
      fc:	0000009f 	0x9f
     100:	00000000 	nop
     104:	0003e400 	sll	gp,v1,0x10
     108:	00049c88 	0x49c88
     10c:	08000388 	j	e20 <_data-0x7ffff1e0>
     110:	00009f48 	0x9f48
     114:	00000000 	nop
     118:	03e40000 	0x3e40000
     11c:	049c8800 	0x49c8800
     120:	00038800 	sll	s1,v1,0x0
     124:	009f5b08 	0x9f5b08
     128:	00000000 	nop
     12c:	e4000000 	swc1	$f0,0(zero)
     130:	9c880003 	0x9c880003
     134:	03880004 	sllv	zero,t0,gp
     138:	9f3a0800 	0x9f3a0800
	...
     144:	880003e4 	lwl	zero,996(zero)
     148:	8800049c 	lwl	zero,1180(zero)
     14c:	64080003 	0x64080003
     150:	0000009f 	0x9f
     154:	00000000 	nop
     158:	0003e400 	sll	gp,v1,0x10
     15c:	00049c88 	0x49c88
     160:	08000388 	j	e20 <_data-0x7ffff1e0>
     164:	00009f67 	0x9f67
     168:	00000000 	nop
     16c:	03e40000 	0x3e40000
     170:	049c8800 	0x49c8800
     174:	00038800 	sll	s1,v1,0x0
     178:	009f6e08 	0x9f6e08
     17c:	00000000 	nop
     180:	e4000000 	swc1	$f0,0(zero)
     184:	9c880003 	0x9c880003
     188:	03880004 	sllv	zero,t0,gp
     18c:	9f610800 	0x9f610800
	...
     198:	880003e4 	lwl	zero,996(zero)
     19c:	8800049c 	lwl	zero,1180(zero)
     1a0:	68080003 	0x68080003
     1a4:	0000009f 	0x9f
     1a8:	00000000 	nop
     1ac:	0003e400 	sll	gp,v1,0x10
     1b0:	00049c88 	0x49c88
     1b4:	08000388 	j	e20 <_data-0x7ffff1e0>
     1b8:	00009f63 	0x9f63
     1bc:	00000000 	nop
     1c0:	03e40000 	0x3e40000
     1c4:	049c8800 	0x49c8800
     1c8:	00038800 	sll	s1,v1,0x0
     1cc:	009f7408 	0x9f7408
     1d0:	00000000 	nop
     1d4:	e4000000 	swc1	$f0,0(zero)
     1d8:	9c880003 	0x9c880003
     1dc:	03880004 	sllv	zero,t0,gp
     1e0:	9f690800 	0x9f690800
	...
     1ec:	880003e4 	lwl	zero,996(zero)
     1f0:	8800049c 	lwl	zero,1180(zero)
     1f4:	77080003 	jalx	c20000c <_data-0x73dffff4>
     1f8:	0000009f 	0x9f
     1fc:	00000000 	nop
     200:	0003e400 	sll	gp,v1,0x10
     204:	00049c88 	0x49c88
     208:	08000388 	j	e20 <_data-0x7ffff1e0>
     20c:	00009f53 	0x9f53
     210:	00000000 	nop
     214:	03ec0000 	0x3ec0000
     218:	049c8800 	0x49c8800
     21c:	00028800 	sll	s1,v0,0x0
     220:	00009f30 	tge	zero,zero,0x27c
     224:	00000000 	nop
     228:	03ec0000 	0x3ec0000
     22c:	049c8800 	0x49c8800
     230:	00038800 	sll	s1,v1,0x0
     234:	009f2008 	0x9f2008
     238:	00000000 	nop
     23c:	ec000000 	swc3	$0,0(zero)
     240:	9c880003 	0x9c880003
     244:	03880004 	sllv	zero,t0,gp
     248:	9f5d0800 	0x9f5d0800
	...
     254:	880003ec 	lwl	zero,1004(zero)
     258:	8800049c 	lwl	zero,1180(zero)
     25c:	78080003 	0x78080003
     260:	0000009f 	0x9f
     264:	00000000 	nop
     268:	0003ec00 	sll	sp,v1,0x10
     26c:	00049c88 	0x49c88
     270:	08000388 	j	e20 <_data-0x7ffff1e0>
     274:	00009f65 	0x9f65
     278:	00000000 	nop
     27c:	03ec0000 	0x3ec0000
     280:	049c8800 	0x49c8800
     284:	00038800 	sll	s1,v1,0x0
     288:	009f4808 	0x9f4808
     28c:	00000000 	nop
     290:	ec000000 	swc3	$0,0(zero)
     294:	9c880003 	0x9c880003
     298:	03880004 	sllv	zero,t0,gp
     29c:	9f5b0800 	0x9f5b0800
	...
     2a8:	880003ec 	lwl	zero,1004(zero)
     2ac:	8800049c 	lwl	zero,1180(zero)
     2b0:	3a080003 	xori	t0,s0,0x3
     2b4:	0000009f 	0x9f
     2b8:	00000000 	nop
     2bc:	0003ec00 	sll	sp,v1,0x10
     2c0:	00049c88 	0x49c88
     2c4:	08000388 	j	e20 <_data-0x7ffff1e0>
     2c8:	00009f64 	0x9f64
     2cc:	00000000 	nop
     2d0:	03ec0000 	0x3ec0000
     2d4:	049c8800 	0x49c8800
     2d8:	00038800 	sll	s1,v1,0x0
     2dc:	009f6708 	0x9f6708
     2e0:	00000000 	nop
     2e4:	ec000000 	swc3	$0,0(zero)
     2e8:	9c880003 	0x9c880003
     2ec:	03880004 	sllv	zero,t0,gp
     2f0:	9f6e0800 	0x9f6e0800
	...
     2fc:	880003ec 	lwl	zero,1004(zero)
     300:	8800049c 	lwl	zero,1180(zero)
     304:	61080003 	0x61080003
     308:	0000009f 	0x9f
     30c:	00000000 	nop
     310:	0003ec00 	sll	sp,v1,0x10
     314:	00049c88 	0x49c88
     318:	08000388 	j	e20 <_data-0x7ffff1e0>
     31c:	00009f68 	0x9f68
     320:	00000000 	nop
     324:	03ec0000 	0x3ec0000
     328:	049c8800 	0x49c8800
     32c:	00038800 	sll	s1,v1,0x0
     330:	009f6308 	0x9f6308
     334:	00000000 	nop
     338:	ec000000 	swc3	$0,0(zero)
     33c:	9c880003 	0x9c880003
     340:	03880004 	sllv	zero,t0,gp
     344:	9f740800 	0x9f740800
	...
     350:	880003ec 	lwl	zero,1004(zero)
     354:	8800049c 	lwl	zero,1180(zero)
     358:	69080003 	0x69080003
     35c:	0000009f 	0x9f
     360:	00000000 	nop
     364:	0003ec00 	sll	sp,v1,0x10
     368:	00049c88 	0x49c88
     36c:	08000388 	j	e20 <_data-0x7ffff1e0>
     370:	00009f77 	0x9f77
     374:	00000000 	nop
     378:	03f40000 	0x3f40000
     37c:	049c8800 	0x49c8800
     380:	00028800 	sll	s1,v0,0x0
     384:	00009f30 	tge	zero,zero,0x27c
     388:	00000000 	nop
     38c:	03f40000 	0x3f40000
     390:	049c8800 	0x49c8800
     394:	00038800 	sll	s1,v1,0x0
     398:	009f2008 	0x9f2008
     39c:	00000000 	nop
     3a0:	f4000000 	sdc1	$f0,0(zero)
     3a4:	9c880003 	0x9c880003
     3a8:	03880004 	sllv	zero,t0,gp
     3ac:	9f5d0800 	0x9f5d0800
	...
     3b8:	880003f4 	lwl	zero,1012(zero)
     3bc:	8800049c 	lwl	zero,1180(zero)
     3c0:	78080003 	0x78080003
     3c4:	0000009f 	0x9f
     3c8:	00000000 	nop
     3cc:	0003f400 	sll	s8,v1,0x10
     3d0:	00049c88 	0x49c88
     3d4:	08000388 	j	e20 <_data-0x7ffff1e0>
     3d8:	00009f65 	0x9f65
     3dc:	00000000 	nop
     3e0:	03f40000 	0x3f40000
     3e4:	049c8800 	0x49c8800
     3e8:	00038800 	sll	s1,v1,0x0
     3ec:	009f4808 	0x9f4808
     3f0:	00000000 	nop
     3f4:	f4000000 	sdc1	$f0,0(zero)
     3f8:	9c880003 	0x9c880003
     3fc:	03880004 	sllv	zero,t0,gp
     400:	9f5b0800 	0x9f5b0800
	...
     40c:	880003f4 	lwl	zero,1012(zero)
     410:	8800049c 	lwl	zero,1180(zero)
     414:	3a080003 	xori	t0,s0,0x3
     418:	0000009f 	0x9f
     41c:	00000000 	nop
     420:	0003f400 	sll	s8,v1,0x10
     424:	00049c88 	0x49c88
     428:	08000388 	j	e20 <_data-0x7ffff1e0>
     42c:	00009f64 	0x9f64
     430:	00000000 	nop
     434:	03f40000 	0x3f40000
     438:	049c8800 	0x49c8800
     43c:	00038800 	sll	s1,v1,0x0
     440:	009f6708 	0x9f6708
     444:	00000000 	nop
     448:	f4000000 	sdc1	$f0,0(zero)
     44c:	9c880003 	0x9c880003
     450:	03880004 	sllv	zero,t0,gp
     454:	9f6e0800 	0x9f6e0800
	...
     460:	880003f4 	lwl	zero,1012(zero)
     464:	8800049c 	lwl	zero,1180(zero)
     468:	61080003 	0x61080003
     46c:	0000009f 	0x9f
     470:	00000000 	nop
     474:	0003f400 	sll	s8,v1,0x10
     478:	00049c88 	0x49c88
     47c:	08000388 	j	e20 <_data-0x7ffff1e0>
     480:	00009f68 	0x9f68
     484:	00000000 	nop
     488:	03f40000 	0x3f40000
     48c:	049c8800 	0x49c8800
     490:	00038800 	sll	s1,v1,0x0
     494:	009f6308 	0x9f6308
     498:	00000000 	nop
     49c:	f4000000 	sdc1	$f0,0(zero)
     4a0:	9c880003 	0x9c880003
     4a4:	03880004 	sllv	zero,t0,gp
     4a8:	9f740800 	0x9f740800
	...
     4b4:	880003f4 	lwl	zero,1012(zero)
     4b8:	8800049c 	lwl	zero,1180(zero)
     4bc:	69080003 	0x69080003
     4c0:	0000009f 	0x9f
     4c4:	00000000 	nop
     4c8:	0003fc00 	sll	ra,v1,0x10
     4cc:	00049c88 	0x49c88
     4d0:	30000288 	andi	zero,zero,0x288
     4d4:	0000009f 	0x9f
     4d8:	00000000 	nop
     4dc:	0003fc00 	sll	ra,v1,0x10
     4e0:	00049c88 	0x49c88
     4e4:	08000388 	j	e20 <_data-0x7ffff1e0>
     4e8:	00009f20 	0x9f20
     4ec:	00000000 	nop
     4f0:	03fc0000 	0x3fc0000
     4f4:	049c8800 	0x49c8800
     4f8:	00038800 	sll	s1,v1,0x0
     4fc:	009f5d08 	0x9f5d08
     500:	00000000 	nop
     504:	fc000000 	sdc3	$0,0(zero)
     508:	9c880003 	0x9c880003
     50c:	03880004 	sllv	zero,t0,gp
     510:	9f780800 	0x9f780800
	...
     51c:	880003fc 	lwl	zero,1020(zero)
     520:	8800049c 	lwl	zero,1180(zero)
     524:	65080003 	0x65080003
     528:	0000009f 	0x9f
     52c:	00000000 	nop
     530:	0003fc00 	sll	ra,v1,0x10
     534:	00049c88 	0x49c88
     538:	08000388 	j	e20 <_data-0x7ffff1e0>
     53c:	00009f48 	0x9f48
     540:	00000000 	nop
     544:	03fc0000 	0x3fc0000
     548:	049c8800 	0x49c8800
     54c:	00038800 	sll	s1,v1,0x0
     550:	009f5b08 	0x9f5b08
     554:	00000000 	nop
     558:	fc000000 	sdc3	$0,0(zero)
     55c:	9c880003 	0x9c880003
     560:	03880004 	sllv	zero,t0,gp
     564:	9f3a0800 	0x9f3a0800
	...
     570:	880003fc 	lwl	zero,1020(zero)
     574:	8800049c 	lwl	zero,1180(zero)
     578:	64080003 	0x64080003
     57c:	0000009f 	0x9f
     580:	00000000 	nop
     584:	0003fc00 	sll	ra,v1,0x10
     588:	00049c88 	0x49c88
     58c:	08000388 	j	e20 <_data-0x7ffff1e0>
     590:	00009f67 	0x9f67
     594:	00000000 	nop
     598:	03fc0000 	0x3fc0000
     59c:	049c8800 	0x49c8800
     5a0:	00038800 	sll	s1,v1,0x0
     5a4:	009f6e08 	0x9f6e08
     5a8:	00000000 	nop
     5ac:	fc000000 	sdc3	$0,0(zero)
     5b0:	9c880003 	0x9c880003
     5b4:	03880004 	sllv	zero,t0,gp
     5b8:	9f610800 	0x9f610800
	...
     5c4:	880003fc 	lwl	zero,1020(zero)
     5c8:	8800049c 	lwl	zero,1180(zero)
     5cc:	68080003 	0x68080003
     5d0:	0000009f 	0x9f
     5d4:	00000000 	nop
     5d8:	0003fc00 	sll	ra,v1,0x10
     5dc:	00049c88 	0x49c88
     5e0:	08000388 	j	e20 <_data-0x7ffff1e0>
     5e4:	00009f63 	0x9f63
     5e8:	00000000 	nop
     5ec:	03fc0000 	0x3fc0000
     5f0:	049c8800 	0x49c8800
     5f4:	00038800 	sll	s1,v1,0x0
     5f8:	009f7408 	0x9f7408
     5fc:	00000000 	nop
     600:	04000000 	bltz	zero,604 <_data-0x7ffff9fc>
     604:	9c880004 	0x9c880004
     608:	02880004 	sllv	zero,t0,s4
     60c:	009f3000 	0x9f3000
     610:	00000000 	nop
     614:	04000000 	bltz	zero,618 <_data-0x7ffff9e8>
     618:	9c880004 	0x9c880004
     61c:	03880004 	sllv	zero,t0,gp
     620:	9f200800 	0x9f200800
	...
     62c:	88000404 	lwl	zero,1028(zero)
     630:	8800049c 	lwl	zero,1180(zero)
     634:	5d080003 	0x5d080003
     638:	0000009f 	0x9f
     63c:	00000000 	nop
     640:	00040400 	sll	zero,a0,0x10
     644:	00049c88 	0x49c88
     648:	08000388 	j	e20 <_data-0x7ffff1e0>
     64c:	00009f78 	0x9f78
     650:	00000000 	nop
     654:	04040000 	0x4040000
     658:	049c8800 	0x49c8800
     65c:	00038800 	sll	s1,v1,0x0
     660:	009f6508 	0x9f6508
     664:	00000000 	nop
     668:	04000000 	bltz	zero,66c <_data-0x7ffff994>
     66c:	9c880004 	0x9c880004
     670:	03880004 	sllv	zero,t0,gp
     674:	9f480800 	0x9f480800
	...
     680:	88000404 	lwl	zero,1028(zero)
     684:	8800049c 	lwl	zero,1180(zero)
     688:	5b080003 	0x5b080003
     68c:	0000009f 	0x9f
     690:	00000000 	nop
     694:	00040400 	sll	zero,a0,0x10
     698:	00049c88 	0x49c88
     69c:	08000388 	j	e20 <_data-0x7ffff1e0>
     6a0:	00009f3a 	0x9f3a
     6a4:	00000000 	nop
     6a8:	04040000 	0x4040000
     6ac:	049c8800 	0x49c8800
     6b0:	00038800 	sll	s1,v1,0x0
     6b4:	009f6408 	0x9f6408
     6b8:	00000000 	nop
     6bc:	04000000 	bltz	zero,6c0 <_data-0x7ffff940>
     6c0:	9c880004 	0x9c880004
     6c4:	03880004 	sllv	zero,t0,gp
     6c8:	9f670800 	0x9f670800
	...
     6d4:	88000404 	lwl	zero,1028(zero)
     6d8:	8800049c 	lwl	zero,1180(zero)
     6dc:	6e080003 	0x6e080003
     6e0:	0000009f 	0x9f
     6e4:	00000000 	nop
     6e8:	00040400 	sll	zero,a0,0x10
     6ec:	00049c88 	0x49c88
     6f0:	08000388 	j	e20 <_data-0x7ffff1e0>
     6f4:	00009f61 	0x9f61
     6f8:	00000000 	nop
     6fc:	04040000 	0x4040000
     700:	049c8800 	0x49c8800
     704:	00038800 	sll	s1,v1,0x0
     708:	009f6808 	0x9f6808
     70c:	00000000 	nop
     710:	04000000 	bltz	zero,714 <_data-0x7ffff8ec>
     714:	9c880004 	0x9c880004
     718:	03880004 	sllv	zero,t0,gp
     71c:	9f630800 	0x9f630800
	...
     728:	8800040c 	lwl	zero,1036(zero)
     72c:	8800049c 	lwl	zero,1180(zero)
     730:	9f300002 	0x9f300002
	...
     73c:	8800040c 	lwl	zero,1036(zero)
     740:	8800049c 	lwl	zero,1180(zero)
     744:	20080003 	addi	t0,zero,3
     748:	0000009f 	0x9f
     74c:	00000000 	nop
     750:	00040c00 	sll	at,a0,0x10
     754:	00049c88 	0x49c88
     758:	08000388 	j	e20 <_data-0x7ffff1e0>
     75c:	00009f5d 	0x9f5d
     760:	00000000 	nop
     764:	040c0000 	teqi	zero,0
     768:	049c8800 	0x49c8800
     76c:	00038800 	sll	s1,v1,0x0
     770:	009f7808 	0x9f7808
     774:	00000000 	nop
     778:	0c000000 	jal	0 <_data-0x80000000>
     77c:	9c880004 	0x9c880004
     780:	03880004 	sllv	zero,t0,gp
     784:	9f650800 	0x9f650800
	...
     790:	8800040c 	lwl	zero,1036(zero)
     794:	8800049c 	lwl	zero,1180(zero)
     798:	48080003 	mfc2	t0,$0,3
     79c:	0000009f 	0x9f
     7a0:	00000000 	nop
     7a4:	00040c00 	sll	at,a0,0x10
     7a8:	00049c88 	0x49c88
     7ac:	08000388 	j	e20 <_data-0x7ffff1e0>
     7b0:	00009f5b 	0x9f5b
     7b4:	00000000 	nop
     7b8:	040c0000 	teqi	zero,0
     7bc:	049c8800 	0x49c8800
     7c0:	00038800 	sll	s1,v1,0x0
     7c4:	009f3a08 	0x9f3a08
     7c8:	00000000 	nop
     7cc:	0c000000 	jal	0 <_data-0x80000000>
     7d0:	9c880004 	0x9c880004
     7d4:	03880004 	sllv	zero,t0,gp
     7d8:	9f640800 	0x9f640800
	...
     7e4:	8800040c 	lwl	zero,1036(zero)
     7e8:	8800049c 	lwl	zero,1180(zero)
     7ec:	67080003 	0x67080003
     7f0:	0000009f 	0x9f
     7f4:	00000000 	nop
     7f8:	00040c00 	sll	at,a0,0x10
     7fc:	00049c88 	0x49c88
     800:	08000388 	j	e20 <_data-0x7ffff1e0>
     804:	00009f6e 	0x9f6e
     808:	00000000 	nop
     80c:	040c0000 	teqi	zero,0
     810:	049c8800 	0x49c8800
     814:	00038800 	sll	s1,v1,0x0
     818:	009f6108 	0x9f6108
     81c:	00000000 	nop
     820:	0c000000 	jal	0 <_data-0x80000000>
     824:	9c880004 	0x9c880004
     828:	03880004 	sllv	zero,t0,gp
     82c:	9f680800 	0x9f680800
	...
     838:	8800040c 	lwl	zero,1036(zero)
     83c:	8800049c 	lwl	zero,1180(zero)
     840:	63080003 	0x63080003
     844:	0000009f 	0x9f
     848:	00000000 	nop
     84c:	00041400 	sll	v0,a0,0x10
     850:	00049c88 	0x49c88
     854:	30000288 	andi	zero,zero,0x288
     858:	0000009f 	0x9f
     85c:	00000000 	nop
     860:	00041400 	sll	v0,a0,0x10
     864:	00049c88 	0x49c88
     868:	08000388 	j	e20 <_data-0x7ffff1e0>
     86c:	00009f20 	0x9f20
     870:	00000000 	nop
     874:	04140000 	0x4140000
     878:	049c8800 	0x49c8800
     87c:	00038800 	sll	s1,v1,0x0
     880:	009f5d08 	0x9f5d08
     884:	00000000 	nop
     888:	14000000 	bnez	zero,88c <_data-0x7ffff774>
     88c:	9c880004 	0x9c880004
     890:	03880004 	sllv	zero,t0,gp
     894:	9f780800 	0x9f780800
	...
     8a0:	88000414 	lwl	zero,1044(zero)
     8a4:	8800049c 	lwl	zero,1180(zero)
     8a8:	65080003 	0x65080003
     8ac:	0000009f 	0x9f
     8b0:	00000000 	nop
     8b4:	00041400 	sll	v0,a0,0x10
     8b8:	00049c88 	0x49c88
     8bc:	08000388 	j	e20 <_data-0x7ffff1e0>
     8c0:	00009f48 	0x9f48
     8c4:	00000000 	nop
     8c8:	04140000 	0x4140000
     8cc:	049c8800 	0x49c8800
     8d0:	00038800 	sll	s1,v1,0x0
     8d4:	009f5b08 	0x9f5b08
     8d8:	00000000 	nop
     8dc:	14000000 	bnez	zero,8e0 <_data-0x7ffff720>
     8e0:	9c880004 	0x9c880004
     8e4:	03880004 	sllv	zero,t0,gp
     8e8:	9f3a0800 	0x9f3a0800
	...
     8f4:	88000414 	lwl	zero,1044(zero)
     8f8:	8800049c 	lwl	zero,1180(zero)
     8fc:	64080003 	0x64080003
     900:	0000009f 	0x9f
     904:	00000000 	nop
     908:	00041400 	sll	v0,a0,0x10
     90c:	00049c88 	0x49c88
     910:	08000388 	j	e20 <_data-0x7ffff1e0>
     914:	00009f67 	0x9f67
     918:	00000000 	nop
     91c:	04140000 	0x4140000
     920:	049c8800 	0x49c8800
     924:	00038800 	sll	s1,v1,0x0
     928:	009f6e08 	0x9f6e08
     92c:	00000000 	nop
     930:	14000000 	bnez	zero,934 <_data-0x7ffff6cc>
     934:	9c880004 	0x9c880004
     938:	03880004 	sllv	zero,t0,gp
     93c:	9f610800 	0x9f610800
	...
     948:	88000414 	lwl	zero,1044(zero)
     94c:	8800049c 	lwl	zero,1180(zero)
     950:	68080003 	0x68080003
     954:	0000009f 	0x9f
     958:	00000000 	nop
     95c:	00041400 	sll	v0,a0,0x10
     960:	00049c88 	0x49c88
     964:	08000388 	j	e20 <_data-0x7ffff1e0>
     968:	00009f63 	0x9f63
     96c:	00000000 	nop
     970:	041c0000 	0x41c0000
     974:	049c8800 	0x49c8800
     978:	00028800 	sll	s1,v0,0x0
     97c:	00009f30 	tge	zero,zero,0x27c
     980:	00000000 	nop
     984:	041c0000 	0x41c0000
     988:	049c8800 	0x49c8800
     98c:	00038800 	sll	s1,v1,0x0
     990:	009f2008 	0x9f2008
     994:	00000000 	nop
     998:	1c000000 	bgtz	zero,99c <_data-0x7ffff664>
     99c:	9c880004 	0x9c880004
     9a0:	03880004 	sllv	zero,t0,gp
     9a4:	9f5d0800 	0x9f5d0800
	...
     9b0:	8800041c 	lwl	zero,1052(zero)
     9b4:	8800049c 	lwl	zero,1180(zero)
     9b8:	78080003 	0x78080003
     9bc:	0000009f 	0x9f
     9c0:	00000000 	nop
     9c4:	00041c00 	sll	v1,a0,0x10
     9c8:	00049c88 	0x49c88
     9cc:	08000388 	j	e20 <_data-0x7ffff1e0>
     9d0:	00009f65 	0x9f65
     9d4:	00000000 	nop
     9d8:	041c0000 	0x41c0000
     9dc:	049c8800 	0x49c8800
     9e0:	00038800 	sll	s1,v1,0x0
     9e4:	009f4808 	0x9f4808
     9e8:	00000000 	nop
     9ec:	1c000000 	bgtz	zero,9f0 <_data-0x7ffff610>
     9f0:	9c880004 	0x9c880004
     9f4:	03880004 	sllv	zero,t0,gp
     9f8:	9f5b0800 	0x9f5b0800
	...
     a04:	8800041c 	lwl	zero,1052(zero)
     a08:	8800049c 	lwl	zero,1180(zero)
     a0c:	3a080003 	xori	t0,s0,0x3
     a10:	0000009f 	0x9f
     a14:	00000000 	nop
     a18:	00041c00 	sll	v1,a0,0x10
     a1c:	00049c88 	0x49c88
     a20:	08000388 	j	e20 <_data-0x7ffff1e0>
     a24:	00009f64 	0x9f64
     a28:	00000000 	nop
     a2c:	041c0000 	0x41c0000
     a30:	049c8800 	0x49c8800
     a34:	00038800 	sll	s1,v1,0x0
     a38:	009f6708 	0x9f6708
     a3c:	00000000 	nop
     a40:	1c000000 	bgtz	zero,a44 <_data-0x7ffff5bc>
     a44:	9c880004 	0x9c880004
     a48:	03880004 	sllv	zero,t0,gp
     a4c:	9f6e0800 	0x9f6e0800
	...
     a58:	8800041c 	lwl	zero,1052(zero)
     a5c:	8800049c 	lwl	zero,1180(zero)
     a60:	61080003 	0x61080003
     a64:	0000009f 	0x9f
     a68:	00000000 	nop
     a6c:	00041c00 	sll	v1,a0,0x10
     a70:	00049c88 	0x49c88
     a74:	08000388 	j	e20 <_data-0x7ffff1e0>
     a78:	00009f68 	0x9f68
     a7c:	00000000 	nop
     a80:	041c0000 	0x41c0000
     a84:	049c8800 	0x49c8800
     a88:	00038800 	sll	s1,v1,0x0
     a8c:	009f6308 	0x9f6308
     a90:	00000000 	nop
     a94:	24000000 	li	zero,0
     a98:	9c880004 	0x9c880004
     a9c:	02880004 	sllv	zero,t0,s4
     aa0:	009f3000 	0x9f3000
     aa4:	00000000 	nop
     aa8:	24000000 	li	zero,0
     aac:	9c880004 	0x9c880004
     ab0:	03880004 	sllv	zero,t0,gp
     ab4:	9f200800 	0x9f200800
	...
     ac0:	88000424 	lwl	zero,1060(zero)
     ac4:	8800049c 	lwl	zero,1180(zero)
     ac8:	5d080003 	0x5d080003
     acc:	0000009f 	0x9f
     ad0:	00000000 	nop
     ad4:	00042400 	sll	a0,a0,0x10
     ad8:	00049c88 	0x49c88
     adc:	08000388 	j	e20 <_data-0x7ffff1e0>
     ae0:	00009f78 	0x9f78
     ae4:	00000000 	nop
     ae8:	04240000 	0x4240000
     aec:	049c8800 	0x49c8800
     af0:	00038800 	sll	s1,v1,0x0
     af4:	009f6508 	0x9f6508
     af8:	00000000 	nop
     afc:	24000000 	li	zero,0
     b00:	9c880004 	0x9c880004
     b04:	03880004 	sllv	zero,t0,gp
     b08:	9f480800 	0x9f480800
	...
     b14:	88000424 	lwl	zero,1060(zero)
     b18:	8800049c 	lwl	zero,1180(zero)
     b1c:	5b080003 	0x5b080003
     b20:	0000009f 	0x9f
     b24:	00000000 	nop
     b28:	00042400 	sll	a0,a0,0x10
     b2c:	00049c88 	0x49c88
     b30:	08000388 	j	e20 <_data-0x7ffff1e0>
     b34:	00009f3a 	0x9f3a
     b38:	00000000 	nop
     b3c:	04240000 	0x4240000
     b40:	049c8800 	0x49c8800
     b44:	00038800 	sll	s1,v1,0x0
     b48:	009f6408 	0x9f6408
     b4c:	00000000 	nop
     b50:	24000000 	li	zero,0
     b54:	9c880004 	0x9c880004
     b58:	03880004 	sllv	zero,t0,gp
     b5c:	9f670800 	0x9f670800
	...
     b68:	88000424 	lwl	zero,1060(zero)
     b6c:	8800049c 	lwl	zero,1180(zero)
     b70:	6e080003 	0x6e080003
     b74:	0000009f 	0x9f
     b78:	00000000 	nop
     b7c:	00042400 	sll	a0,a0,0x10
     b80:	00049c88 	0x49c88
     b84:	08000388 	j	e20 <_data-0x7ffff1e0>
     b88:	00009f61 	0x9f61
     b8c:	00000000 	nop
     b90:	04240000 	0x4240000
     b94:	049c8800 	0x49c8800
     b98:	00038800 	sll	s1,v1,0x0
     b9c:	009f6808 	0x9f6808
     ba0:	00000000 	nop
     ba4:	2c000000 	sltiu	zero,zero,0
     ba8:	9c880004 	0x9c880004
     bac:	02880004 	sllv	zero,t0,s4
     bb0:	009f3000 	0x9f3000
     bb4:	00000000 	nop
     bb8:	2c000000 	sltiu	zero,zero,0
     bbc:	9c880004 	0x9c880004
     bc0:	03880004 	sllv	zero,t0,gp
     bc4:	9f200800 	0x9f200800
	...
     bd0:	8800042c 	lwl	zero,1068(zero)
     bd4:	8800049c 	lwl	zero,1180(zero)
     bd8:	5d080003 	0x5d080003
     bdc:	0000009f 	0x9f
     be0:	00000000 	nop
     be4:	00042c00 	sll	a1,a0,0x10
     be8:	00049c88 	0x49c88
     bec:	08000388 	j	e20 <_data-0x7ffff1e0>
     bf0:	00009f78 	0x9f78
     bf4:	00000000 	nop
     bf8:	042c0000 	teqi	at,0
     bfc:	049c8800 	0x49c8800
     c00:	00038800 	sll	s1,v1,0x0
     c04:	009f6508 	0x9f6508
     c08:	00000000 	nop
     c0c:	2c000000 	sltiu	zero,zero,0
     c10:	9c880004 	0x9c880004
     c14:	03880004 	sllv	zero,t0,gp
     c18:	9f480800 	0x9f480800
	...
     c24:	8800042c 	lwl	zero,1068(zero)
     c28:	8800049c 	lwl	zero,1180(zero)
     c2c:	5b080003 	0x5b080003
     c30:	0000009f 	0x9f
     c34:	00000000 	nop
     c38:	00042c00 	sll	a1,a0,0x10
     c3c:	00049c88 	0x49c88
     c40:	08000388 	j	e20 <_data-0x7ffff1e0>
     c44:	00009f3a 	0x9f3a
     c48:	00000000 	nop
     c4c:	042c0000 	teqi	at,0
     c50:	049c8800 	0x49c8800
     c54:	00038800 	sll	s1,v1,0x0
     c58:	009f6408 	0x9f6408
     c5c:	00000000 	nop
     c60:	2c000000 	sltiu	zero,zero,0
     c64:	9c880004 	0x9c880004
     c68:	03880004 	sllv	zero,t0,gp
     c6c:	9f670800 	0x9f670800
	...
     c78:	8800042c 	lwl	zero,1068(zero)
     c7c:	8800049c 	lwl	zero,1180(zero)
     c80:	6e080003 	0x6e080003
     c84:	0000009f 	0x9f
     c88:	00000000 	nop
     c8c:	00042c00 	sll	a1,a0,0x10
     c90:	00049c88 	0x49c88
     c94:	08000388 	j	e20 <_data-0x7ffff1e0>
     c98:	00009f61 	0x9f61
     c9c:	00000000 	nop
     ca0:	04340000 	0x4340000
     ca4:	049c8800 	0x49c8800
     ca8:	00028800 	sll	s1,v0,0x0
     cac:	00009f30 	tge	zero,zero,0x27c
     cb0:	00000000 	nop
     cb4:	04340000 	0x4340000
     cb8:	049c8800 	0x49c8800
     cbc:	00038800 	sll	s1,v1,0x0
     cc0:	009f2008 	0x9f2008
     cc4:	00000000 	nop
     cc8:	34000000 	li	zero,0x0
     ccc:	9c880004 	0x9c880004
     cd0:	03880004 	sllv	zero,t0,gp
     cd4:	9f5d0800 	0x9f5d0800
	...
     ce0:	88000434 	lwl	zero,1076(zero)
     ce4:	8800049c 	lwl	zero,1180(zero)
     ce8:	78080003 	0x78080003
     cec:	0000009f 	0x9f
     cf0:	00000000 	nop
     cf4:	00043400 	sll	a2,a0,0x10
     cf8:	00049c88 	0x49c88
     cfc:	08000388 	j	e20 <_data-0x7ffff1e0>
     d00:	00009f65 	0x9f65
     d04:	00000000 	nop
     d08:	04340000 	0x4340000
     d0c:	049c8800 	0x49c8800
     d10:	00038800 	sll	s1,v1,0x0
     d14:	009f4808 	0x9f4808
     d18:	00000000 	nop
     d1c:	34000000 	li	zero,0x0
     d20:	9c880004 	0x9c880004
     d24:	03880004 	sllv	zero,t0,gp
     d28:	9f5b0800 	0x9f5b0800
	...
     d34:	88000434 	lwl	zero,1076(zero)
     d38:	8800049c 	lwl	zero,1180(zero)
     d3c:	3a080003 	xori	t0,s0,0x3
     d40:	0000009f 	0x9f
     d44:	00000000 	nop
     d48:	00043400 	sll	a2,a0,0x10
     d4c:	00049c88 	0x49c88
     d50:	08000388 	j	e20 <_data-0x7ffff1e0>
     d54:	00009f64 	0x9f64
     d58:	00000000 	nop
     d5c:	04340000 	0x4340000
     d60:	049c8800 	0x49c8800
     d64:	00038800 	sll	s1,v1,0x0
     d68:	009f6708 	0x9f6708
     d6c:	00000000 	nop
     d70:	34000000 	li	zero,0x0
     d74:	9c880004 	0x9c880004
     d78:	03880004 	sllv	zero,t0,gp
     d7c:	9f6e0800 	0x9f6e0800
	...
     d88:	8800043c 	lwl	zero,1084(zero)
     d8c:	8800049c 	lwl	zero,1180(zero)
     d90:	9f300002 	0x9f300002
	...
     d9c:	8800043c 	lwl	zero,1084(zero)
     da0:	8800049c 	lwl	zero,1180(zero)
     da4:	20080003 	addi	t0,zero,3
     da8:	0000009f 	0x9f
     dac:	00000000 	nop
     db0:	00043c00 	sll	a3,a0,0x10
     db4:	00049c88 	0x49c88
     db8:	08000388 	j	e20 <_data-0x7ffff1e0>
     dbc:	00009f5d 	0x9f5d
     dc0:	00000000 	nop
     dc4:	043c0000 	0x43c0000
     dc8:	049c8800 	0x49c8800
     dcc:	00038800 	sll	s1,v1,0x0
     dd0:	009f7808 	0x9f7808
     dd4:	00000000 	nop
     dd8:	3c000000 	lui	zero,0x0
     ddc:	9c880004 	0x9c880004
     de0:	03880004 	sllv	zero,t0,gp
     de4:	9f650800 	0x9f650800
	...
     df0:	8800043c 	lwl	zero,1084(zero)
     df4:	8800049c 	lwl	zero,1180(zero)
     df8:	48080003 	mfc2	t0,$0,3
     dfc:	0000009f 	0x9f
     e00:	00000000 	nop
     e04:	00043c00 	sll	a3,a0,0x10
     e08:	00049c88 	0x49c88
     e0c:	08000388 	j	e20 <_data-0x7ffff1e0>
     e10:	00009f5b 	0x9f5b
     e14:	00000000 	nop
     e18:	043c0000 	0x43c0000
     e1c:	049c8800 	0x49c8800
     e20:	00038800 	sll	s1,v1,0x0
     e24:	009f3a08 	0x9f3a08
     e28:	00000000 	nop
     e2c:	3c000000 	lui	zero,0x0
     e30:	9c880004 	0x9c880004
     e34:	03880004 	sllv	zero,t0,gp
     e38:	9f640800 	0x9f640800
	...
     e44:	8800043c 	lwl	zero,1084(zero)
     e48:	8800049c 	lwl	zero,1180(zero)
     e4c:	67080003 	0x67080003
     e50:	0000009f 	0x9f
     e54:	00000000 	nop
     e58:	00044400 	sll	t0,a0,0x10
     e5c:	00049c88 	0x49c88
     e60:	30000288 	andi	zero,zero,0x288
     e64:	0000009f 	0x9f
     e68:	00000000 	nop
     e6c:	00044400 	sll	t0,a0,0x10
     e70:	00049c88 	0x49c88
     e74:	08000388 	j	e20 <_data-0x7ffff1e0>
     e78:	00009f20 	0x9f20
     e7c:	00000000 	nop
     e80:	04440000 	0x4440000
     e84:	049c8800 	0x49c8800
     e88:	00038800 	sll	s1,v1,0x0
     e8c:	009f5d08 	0x9f5d08
     e90:	00000000 	nop
     e94:	44000000 	mfc1	zero,$f0
     e98:	9c880004 	0x9c880004
     e9c:	03880004 	sllv	zero,t0,gp
     ea0:	9f780800 	0x9f780800
	...
     eac:	88000444 	lwl	zero,1092(zero)
     eb0:	8800049c 	lwl	zero,1180(zero)
     eb4:	65080003 	0x65080003
     eb8:	0000009f 	0x9f
     ebc:	00000000 	nop
     ec0:	00044400 	sll	t0,a0,0x10
     ec4:	00049c88 	0x49c88
     ec8:	08000388 	j	e20 <_data-0x7ffff1e0>
     ecc:	00009f48 	0x9f48
     ed0:	00000000 	nop
     ed4:	04440000 	0x4440000
     ed8:	049c8800 	0x49c8800
     edc:	00038800 	sll	s1,v1,0x0
     ee0:	009f5b08 	0x9f5b08
     ee4:	00000000 	nop
     ee8:	44000000 	mfc1	zero,$f0
     eec:	9c880004 	0x9c880004
     ef0:	03880004 	sllv	zero,t0,gp
     ef4:	9f3a0800 	0x9f3a0800
	...
     f00:	88000444 	lwl	zero,1092(zero)
     f04:	8800049c 	lwl	zero,1180(zero)
     f08:	64080003 	0x64080003
     f0c:	0000009f 	0x9f
     f10:	00000000 	nop
     f14:	00044c00 	sll	t1,a0,0x10
     f18:	00049c88 	0x49c88
     f1c:	30000288 	andi	zero,zero,0x288
     f20:	0000009f 	0x9f
     f24:	00000000 	nop
     f28:	00044c00 	sll	t1,a0,0x10
     f2c:	00049c88 	0x49c88
     f30:	08000388 	j	e20 <_data-0x7ffff1e0>
     f34:	00009f20 	0x9f20
     f38:	00000000 	nop
     f3c:	044c0000 	teqi	v0,0
     f40:	049c8800 	0x49c8800
     f44:	00038800 	sll	s1,v1,0x0
     f48:	009f5d08 	0x9f5d08
     f4c:	00000000 	nop
     f50:	4c000000 	mfc3	zero,$0
     f54:	9c880004 	0x9c880004
     f58:	03880004 	sllv	zero,t0,gp
     f5c:	9f780800 	0x9f780800
	...
     f68:	8800044c 	lwl	zero,1100(zero)
     f6c:	8800049c 	lwl	zero,1180(zero)
     f70:	65080003 	0x65080003
     f74:	0000009f 	0x9f
     f78:	00000000 	nop
     f7c:	00044c00 	sll	t1,a0,0x10
     f80:	00049c88 	0x49c88
     f84:	08000388 	j	e20 <_data-0x7ffff1e0>
     f88:	00009f48 	0x9f48
     f8c:	00000000 	nop
     f90:	044c0000 	teqi	v0,0
     f94:	049c8800 	0x49c8800
     f98:	00038800 	sll	s1,v1,0x0
     f9c:	009f5b08 	0x9f5b08
     fa0:	00000000 	nop
     fa4:	4c000000 	mfc3	zero,$0
     fa8:	9c880004 	0x9c880004
     fac:	03880004 	sllv	zero,t0,gp
     fb0:	9f3a0800 	0x9f3a0800
	...
     fbc:	8800044c 	lwl	zero,1100(zero)
     fc0:	8800049c 	lwl	zero,1180(zero)
     fc4:	64080003 	0x64080003
     fc8:	0000009f 	0x9f
     fcc:	00000000 	nop
     fd0:	00045400 	sll	t2,a0,0x10
     fd4:	00049c88 	0x49c88
     fd8:	30000288 	andi	zero,zero,0x288
     fdc:	0000009f 	0x9f
     fe0:	00000000 	nop
     fe4:	00045400 	sll	t2,a0,0x10
     fe8:	00049c88 	0x49c88
     fec:	08000388 	j	e20 <_data-0x7ffff1e0>
     ff0:	00009f20 	0x9f20
     ff4:	00000000 	nop
     ff8:	04540000 	0x4540000
     ffc:	049c8800 	0x49c8800
    1000:	00038800 	sll	s1,v1,0x0
    1004:	009f5d08 	0x9f5d08
    1008:	00000000 	nop
    100c:	54000000 	bnezl	zero,1010 <_data-0x7fffeff0>
    1010:	9c880004 	0x9c880004
    1014:	03880004 	sllv	zero,t0,gp
    1018:	9f780800 	0x9f780800
	...
    1024:	88000454 	lwl	zero,1108(zero)
    1028:	8800049c 	lwl	zero,1180(zero)
    102c:	65080003 	0x65080003
    1030:	0000009f 	0x9f
    1034:	00000000 	nop
    1038:	00045400 	sll	t2,a0,0x10
    103c:	00049c88 	0x49c88
    1040:	08000388 	j	e20 <_data-0x7ffff1e0>
    1044:	00009f48 	0x9f48
    1048:	00000000 	nop
    104c:	04540000 	0x4540000
    1050:	049c8800 	0x49c8800
    1054:	00038800 	sll	s1,v1,0x0
    1058:	009f5b08 	0x9f5b08
    105c:	00000000 	nop
    1060:	54000000 	bnezl	zero,1064 <_data-0x7fffef9c>
    1064:	9c880004 	0x9c880004
    1068:	03880004 	sllv	zero,t0,gp
    106c:	9f3a0800 	0x9f3a0800
	...
    1078:	8800045c 	lwl	zero,1116(zero)
    107c:	8800049c 	lwl	zero,1180(zero)
    1080:	9f300002 	0x9f300002
	...
    108c:	8800045c 	lwl	zero,1116(zero)
    1090:	8800049c 	lwl	zero,1180(zero)
    1094:	20080003 	addi	t0,zero,3
    1098:	0000009f 	0x9f
    109c:	00000000 	nop
    10a0:	00045c00 	sll	t3,a0,0x10
    10a4:	00049c88 	0x49c88
    10a8:	08000388 	j	e20 <_data-0x7ffff1e0>
    10ac:	00009f5d 	0x9f5d
    10b0:	00000000 	nop
    10b4:	045c0000 	0x45c0000
    10b8:	049c8800 	0x49c8800
    10bc:	00038800 	sll	s1,v1,0x0
    10c0:	009f7808 	0x9f7808
    10c4:	00000000 	nop
    10c8:	5c000000 	bgtzl	zero,10cc <_data-0x7fffef34>
    10cc:	9c880004 	0x9c880004
    10d0:	03880004 	sllv	zero,t0,gp
    10d4:	9f650800 	0x9f650800
	...
    10e0:	8800045c 	lwl	zero,1116(zero)
    10e4:	8800049c 	lwl	zero,1180(zero)
    10e8:	48080003 	mfc2	t0,$0,3
    10ec:	0000009f 	0x9f
    10f0:	00000000 	nop
    10f4:	00045c00 	sll	t3,a0,0x10
    10f8:	00049c88 	0x49c88
    10fc:	08000388 	j	e20 <_data-0x7ffff1e0>
    1100:	00009f5b 	0x9f5b
    1104:	00000000 	nop
    1108:	04640000 	0x4640000
    110c:	049c8800 	0x49c8800
    1110:	00028800 	sll	s1,v0,0x0
    1114:	00009f30 	tge	zero,zero,0x27c
    1118:	00000000 	nop
    111c:	04640000 	0x4640000
    1120:	049c8800 	0x49c8800
    1124:	00038800 	sll	s1,v1,0x0
    1128:	009f2008 	0x9f2008
    112c:	00000000 	nop
    1130:	64000000 	0x64000000
    1134:	9c880004 	0x9c880004
    1138:	03880004 	sllv	zero,t0,gp
    113c:	9f5d0800 	0x9f5d0800
	...
    1148:	88000464 	lwl	zero,1124(zero)
    114c:	8800049c 	lwl	zero,1180(zero)
    1150:	78080003 	0x78080003
    1154:	0000009f 	0x9f
    1158:	00000000 	nop
    115c:	00046400 	sll	t4,a0,0x10
    1160:	00049c88 	0x49c88
    1164:	08000388 	j	e20 <_data-0x7ffff1e0>
    1168:	00009f65 	0x9f65
    116c:	00000000 	nop
    1170:	04640000 	0x4640000
    1174:	049c8800 	0x49c8800
    1178:	00038800 	sll	s1,v1,0x0
    117c:	009f4808 	0x9f4808
    1180:	00000000 	nop
    1184:	64000000 	0x64000000
    1188:	9c880004 	0x9c880004
    118c:	03880004 	sllv	zero,t0,gp
    1190:	9f5b0800 	0x9f5b0800
	...
    119c:	8800046c 	lwl	zero,1132(zero)
    11a0:	8800049c 	lwl	zero,1180(zero)
    11a4:	9f300002 	0x9f300002
	...
    11b0:	8800046c 	lwl	zero,1132(zero)
    11b4:	8800049c 	lwl	zero,1180(zero)
    11b8:	20080003 	addi	t0,zero,3
    11bc:	0000009f 	0x9f
    11c0:	00000000 	nop
    11c4:	00046c00 	sll	t5,a0,0x10
    11c8:	00049c88 	0x49c88
    11cc:	08000388 	j	e20 <_data-0x7ffff1e0>
    11d0:	00009f5d 	0x9f5d
    11d4:	00000000 	nop
    11d8:	046c0000 	teqi	v1,0
    11dc:	049c8800 	0x49c8800
    11e0:	00038800 	sll	s1,v1,0x0
    11e4:	009f7808 	0x9f7808
    11e8:	00000000 	nop
    11ec:	6c000000 	0x6c000000
    11f0:	9c880004 	0x9c880004
    11f4:	03880004 	sllv	zero,t0,gp
    11f8:	9f650800 	0x9f650800
	...
    1204:	8800046c 	lwl	zero,1132(zero)
    1208:	8800049c 	lwl	zero,1180(zero)
    120c:	48080003 	mfc2	t0,$0,3
    1210:	0000009f 	0x9f
    1214:	00000000 	nop
    1218:	00047400 	sll	t6,a0,0x10
    121c:	00049c88 	0x49c88
    1220:	30000288 	andi	zero,zero,0x288
    1224:	0000009f 	0x9f
    1228:	00000000 	nop
    122c:	00047400 	sll	t6,a0,0x10
    1230:	00049c88 	0x49c88
    1234:	08000388 	j	e20 <_data-0x7ffff1e0>
    1238:	00009f20 	0x9f20
    123c:	00000000 	nop
    1240:	04740000 	0x4740000
    1244:	049c8800 	0x49c8800
    1248:	00038800 	sll	s1,v1,0x0
    124c:	009f5d08 	0x9f5d08
    1250:	00000000 	nop
    1254:	74000000 	jalx	0 <_data-0x80000000>
    1258:	9c880004 	0x9c880004
    125c:	03880004 	sllv	zero,t0,gp
    1260:	9f780800 	0x9f780800
	...
    126c:	88000474 	lwl	zero,1140(zero)
    1270:	8800049c 	lwl	zero,1180(zero)
    1274:	65080003 	0x65080003
    1278:	0000009f 	0x9f
    127c:	00000000 	nop
    1280:	00047c00 	sll	t7,a0,0x10
    1284:	00049c88 	0x49c88
    1288:	30000288 	andi	zero,zero,0x288
    128c:	0000009f 	0x9f
    1290:	00000000 	nop
    1294:	00047c00 	sll	t7,a0,0x10
    1298:	00049c88 	0x49c88
    129c:	08000388 	j	e20 <_data-0x7ffff1e0>
    12a0:	00009f20 	0x9f20
    12a4:	00000000 	nop
    12a8:	047c0000 	0x47c0000
    12ac:	049c8800 	0x49c8800
    12b0:	00038800 	sll	s1,v1,0x0
    12b4:	009f5d08 	0x9f5d08
    12b8:	00000000 	nop
    12bc:	7c000000 	0x7c000000
    12c0:	9c880004 	0x9c880004
    12c4:	03880004 	sllv	zero,t0,gp
    12c8:	9f780800 	0x9f780800
	...
    12d4:	88000484 	lwl	zero,1156(zero)
    12d8:	8800049c 	lwl	zero,1180(zero)
    12dc:	9f300002 	0x9f300002
	...
    12e8:	88000484 	lwl	zero,1156(zero)
    12ec:	8800049c 	lwl	zero,1180(zero)
    12f0:	20080003 	addi	t0,zero,3
    12f4:	0000009f 	0x9f
    12f8:	00000000 	nop
    12fc:	00048400 	sll	s0,a0,0x10
    1300:	00049c88 	0x49c88
    1304:	08000388 	j	e20 <_data-0x7ffff1e0>
    1308:	00009f5d 	0x9f5d
    130c:	00000000 	nop
    1310:	048c0000 	teqi	a0,0
    1314:	049c8800 	0x49c8800
    1318:	00028800 	sll	s1,v0,0x0
    131c:	00009f30 	tge	zero,zero,0x27c
    1320:	00000000 	nop
    1324:	048c0000 	teqi	a0,0
    1328:	049c8800 	0x49c8800
    132c:	00038800 	sll	s1,v1,0x0
    1330:	009f2008 	0x9f2008
    1334:	00000000 	nop
    1338:	94000000 	lhu	zero,0(zero)
    133c:	9c880004 	0x9c880004
    1340:	02880004 	sllv	zero,t0,s4
    1344:	009f3000 	0x9f3000
    1348:	00000000 	nop
    134c:	9c000000 	0x9c000000
    1350:	14880004 	bne	a0,t0,1364 <_data-0x7fffec9c>
    1354:	06880005 	tgei	s4,5
    1358:	47b40800 	c1	0x1b40800
    135c:	a89f1f24 	swl	ra,7972(a0)
    1360:	c0880005 	ll	t0,5(a0)
    1364:	06880005 	tgei	s4,5
    1368:	47b40800 	c1	0x1b40800
    136c:	009f1f24 	0x9f1f24
    1370:	00000000 	nop
    1374:	a8000000 	swl	zero,0(zero)
    1378:	f0880004 	0xf0880004
    137c:	06880004 	tgei	s4,4
    1380:	3f37f200 	0x3f37f200
	...
    138c:	a8000000 	swl	zero,0(zero)
    1390:	f0880004 	0xf0880004
    1394:	02880004 	sllv	zero,t0,s4
    1398:	009f3000 	0x9f3000
    139c:	00000000 	nop
    13a0:	a8000000 	swl	zero,0(zero)
    13a4:	f0880004 	0xf0880004
    13a8:	03880004 	sllv	zero,t0,gp
    13ac:	9f200800 	0x9f200800
	...
    13b8:	880004a8 	lwl	zero,1192(zero)
    13bc:	880004f0 	lwl	zero,1264(zero)
    13c0:	5d080003 	0x5d080003
    13c4:	0000009f 	0x9f
    13c8:	00000000 	nop
    13cc:	0004a800 	sll	s5,a0,0x0
    13d0:	0004f088 	0x4f088
    13d4:	08000388 	j	e20 <_data-0x7ffff1e0>
    13d8:	00009f63 	0x9f63
    13dc:	00000000 	nop
    13e0:	04a80000 	tgei	a1,0
    13e4:	04f08800 	bltzal	a3,fffe33e8 <_text_end+0x77fe2268>
    13e8:	00038800 	sll	s1,v1,0x0
    13ec:	009f6508 	0x9f6508
    13f0:	00000000 	nop
    13f4:	a8000000 	swl	zero,0(zero)
    13f8:	f0880004 	0xf0880004
    13fc:	03880004 	sllv	zero,t0,gp
    1400:	9f440800 	0x9f440800
	...
    140c:	880004a8 	lwl	zero,1192(zero)
    1410:	880004f0 	lwl	zero,1264(zero)
    1414:	5b080003 	0x5b080003
    1418:	0000009f 	0x9f
    141c:	00000000 	nop
    1420:	0004a800 	sll	s5,a0,0x0
    1424:	0004f088 	0x4f088
    1428:	08000388 	j	e20 <_data-0x7ffff1e0>
    142c:	00009f2c 	0x9f2c
    1430:	00000000 	nop
    1434:	04b00000 	bltzal	a1,1438 <_data-0x7fffebc8>
    1438:	04f08800 	bltzal	a3,fffe343c <_text_end+0x77fe22bc>
    143c:	00028800 	sll	s1,v0,0x0
    1440:	00009f30 	tge	zero,zero,0x27c
    1444:	00000000 	nop
    1448:	04b00000 	bltzal	a1,144c <_data-0x7fffebb4>
    144c:	04f08800 	bltzal	a3,fffe3450 <_text_end+0x77fe22d0>
    1450:	00038800 	sll	s1,v1,0x0
    1454:	009f2008 	0x9f2008
    1458:	00000000 	nop
    145c:	b0000000 	0xb0000000
    1460:	f0880004 	0xf0880004
    1464:	03880004 	sllv	zero,t0,gp
    1468:	9f5d0800 	0x9f5d0800
	...
    1474:	880004b0 	lwl	zero,1200(zero)
    1478:	880004f0 	lwl	zero,1264(zero)
    147c:	63080003 	0x63080003
    1480:	0000009f 	0x9f
    1484:	00000000 	nop
    1488:	0004b000 	sll	s6,a0,0x0
    148c:	0004f088 	0x4f088
    1490:	08000388 	j	e20 <_data-0x7ffff1e0>
    1494:	00009f65 	0x9f65
    1498:	00000000 	nop
    149c:	04b00000 	bltzal	a1,14a0 <_data-0x7fffeb60>
    14a0:	04f08800 	bltzal	a3,fffe34a4 <_text_end+0x77fe2324>
    14a4:	00038800 	sll	s1,v1,0x0
    14a8:	009f4408 	0x9f4408
    14ac:	00000000 	nop
    14b0:	b0000000 	0xb0000000
    14b4:	f0880004 	0xf0880004
    14b8:	03880004 	sllv	zero,t0,gp
    14bc:	9f5b0800 	0x9f5b0800
	...
    14c8:	880004b8 	lwl	zero,1208(zero)
    14cc:	880004f0 	lwl	zero,1264(zero)
    14d0:	9f300002 	0x9f300002
	...
    14dc:	880004b8 	lwl	zero,1208(zero)
    14e0:	880004f0 	lwl	zero,1264(zero)
    14e4:	20080003 	addi	t0,zero,3
    14e8:	0000009f 	0x9f
    14ec:	00000000 	nop
    14f0:	0004b800 	sll	s7,a0,0x0
    14f4:	0004f088 	0x4f088
    14f8:	08000388 	j	e20 <_data-0x7ffff1e0>
    14fc:	00009f5d 	0x9f5d
    1500:	00000000 	nop
    1504:	04b80000 	0x4b80000
    1508:	04f08800 	bltzal	a3,fffe350c <_text_end+0x77fe238c>
    150c:	00038800 	sll	s1,v1,0x0
    1510:	009f6308 	0x9f6308
    1514:	00000000 	nop
    1518:	b8000000 	swr	zero,0(zero)
    151c:	f0880004 	0xf0880004
    1520:	03880004 	sllv	zero,t0,gp
    1524:	9f650800 	0x9f650800
	...
    1530:	880004b8 	lwl	zero,1208(zero)
    1534:	880004f0 	lwl	zero,1264(zero)
    1538:	44080003 	0x44080003
    153c:	0000009f 	0x9f
    1540:	00000000 	nop
    1544:	0004b800 	sll	s7,a0,0x0
    1548:	0004f088 	0x4f088
    154c:	08000388 	j	e20 <_data-0x7ffff1e0>
    1550:	00009f5b 	0x9f5b
    1554:	00000000 	nop
    1558:	04c00000 	bltz	a2,155c <_data-0x7fffeaa4>
    155c:	04f08800 	bltzal	a3,fffe3560 <_text_end+0x77fe23e0>
    1560:	00028800 	sll	s1,v0,0x0
    1564:	00009f30 	tge	zero,zero,0x27c
    1568:	00000000 	nop
    156c:	04c00000 	bltz	a2,1570 <_data-0x7fffea90>
    1570:	04f08800 	bltzal	a3,fffe3574 <_text_end+0x77fe23f4>
    1574:	00038800 	sll	s1,v1,0x0
    1578:	009f2008 	0x9f2008
    157c:	00000000 	nop
    1580:	c0000000 	ll	zero,0(zero)
    1584:	f0880004 	0xf0880004
    1588:	03880004 	sllv	zero,t0,gp
    158c:	9f5d0800 	0x9f5d0800
	...
    1598:	880004c0 	lwl	zero,1216(zero)
    159c:	880004f0 	lwl	zero,1264(zero)
    15a0:	63080003 	0x63080003
    15a4:	0000009f 	0x9f
    15a8:	00000000 	nop
    15ac:	0004c000 	sll	t8,a0,0x0
    15b0:	0004f088 	0x4f088
    15b4:	08000388 	j	e20 <_data-0x7ffff1e0>
    15b8:	00009f65 	0x9f65
    15bc:	00000000 	nop
    15c0:	04c00000 	bltz	a2,15c4 <_data-0x7fffea3c>
    15c4:	04f08800 	bltzal	a3,fffe35c8 <_text_end+0x77fe2448>
    15c8:	00038800 	sll	s1,v1,0x0
    15cc:	009f4408 	0x9f4408
    15d0:	00000000 	nop
    15d4:	c8000000 	lwc2	$0,0(zero)
    15d8:	f0880004 	0xf0880004
    15dc:	02880004 	sllv	zero,t0,s4
    15e0:	009f3000 	0x9f3000
    15e4:	00000000 	nop
    15e8:	c8000000 	lwc2	$0,0(zero)
    15ec:	f0880004 	0xf0880004
    15f0:	03880004 	sllv	zero,t0,gp
    15f4:	9f200800 	0x9f200800
	...
    1600:	880004c8 	lwl	zero,1224(zero)
    1604:	880004f0 	lwl	zero,1264(zero)
    1608:	5d080003 	0x5d080003
    160c:	0000009f 	0x9f
    1610:	00000000 	nop
    1614:	0004c800 	sll	t9,a0,0x0
    1618:	0004f088 	0x4f088
    161c:	08000388 	j	e20 <_data-0x7ffff1e0>
    1620:	00009f63 	0x9f63
    1624:	00000000 	nop
    1628:	04c80000 	tgei	a2,0
    162c:	04f08800 	bltzal	a3,fffe3630 <_text_end+0x77fe24b0>
    1630:	00038800 	sll	s1,v1,0x0
    1634:	009f6508 	0x9f6508
    1638:	00000000 	nop
    163c:	d0000000 	0xd0000000
    1640:	f0880004 	0xf0880004
    1644:	02880004 	sllv	zero,t0,s4
    1648:	009f3000 	0x9f3000
    164c:	00000000 	nop
    1650:	d0000000 	0xd0000000
    1654:	f0880004 	0xf0880004
    1658:	03880004 	sllv	zero,t0,gp
    165c:	9f200800 	0x9f200800
	...
    1668:	880004d0 	lwl	zero,1232(zero)
    166c:	880004f0 	lwl	zero,1264(zero)
    1670:	5d080003 	0x5d080003
    1674:	0000009f 	0x9f
    1678:	00000000 	nop
    167c:	0004d000 	sll	k0,a0,0x0
    1680:	0004f088 	0x4f088
    1684:	08000388 	j	e20 <_data-0x7ffff1e0>
    1688:	00009f63 	0x9f63
    168c:	00000000 	nop
    1690:	04d80000 	0x4d80000
    1694:	04f08800 	bltzal	a3,fffe3698 <_text_end+0x77fe2518>
    1698:	00028800 	sll	s1,v0,0x0
    169c:	00009f30 	tge	zero,zero,0x27c
    16a0:	00000000 	nop
    16a4:	04d80000 	0x4d80000
    16a8:	04f08800 	bltzal	a3,fffe36ac <_text_end+0x77fe252c>
    16ac:	00038800 	sll	s1,v1,0x0
    16b0:	009f2008 	0x9f2008
    16b4:	00000000 	nop
    16b8:	d8000000 	ldc2	$0,0(zero)
    16bc:	f0880004 	0xf0880004
    16c0:	03880004 	sllv	zero,t0,gp
    16c4:	9f5d0800 	0x9f5d0800
	...
    16d0:	880004e0 	lwl	zero,1248(zero)
    16d4:	880004f0 	lwl	zero,1264(zero)
    16d8:	9f300002 	0x9f300002
	...
    16e4:	880004e0 	lwl	zero,1248(zero)
    16e8:	880004f0 	lwl	zero,1264(zero)
    16ec:	20080003 	addi	t0,zero,3
    16f0:	0000009f 	0x9f
    16f4:	00000000 	nop
    16f8:	0004e800 	sll	sp,a0,0x0
    16fc:	0004f088 	0x4f088
    1700:	30000288 	andi	zero,zero,0x288
    1704:	0000009f 	0x9f
    1708:	00000000 	nop
    170c:	0004f000 	sll	s8,a0,0x0
    1710:	00050c88 	0x50c88
    1714:	60000188 	0x60000188
    1718:	880005a8 	lwl	zero,1448(zero)
    171c:	880005c0 	lwl	zero,1472(zero)
    1720:	00600001 	movf	zero,v1,$fcc0
    1724:	00000000 	nop
    1728:	24000000 	li	zero,0
    172c:	a0880005 	sb	t0,5(a0)
    1730:	06880005 	tgei	s4,5
    1734:	3f44f200 	0x3f44f200
	...
    1740:	24000000 	li	zero,0
    1744:	a0880005 	sb	t0,5(a0)
    1748:	02880005 	0x2880005
    174c:	009f3000 	0x9f3000
    1750:	00000000 	nop
    1754:	24000000 	li	zero,0
    1758:	a0880005 	sb	t0,5(a0)
    175c:	03880005 	0x3880005
    1760:	9f200800 	0x9f200800
	...
    176c:	88000524 	lwl	zero,1316(zero)
    1770:	880005a0 	lwl	zero,1440(zero)
    1774:	3a080003 	xori	t0,s0,0x3
    1778:	0000009f 	0x9f
    177c:	00000000 	nop
    1780:	00052400 	sll	a0,a1,0x10
    1784:	0005a088 	0x5a088
    1788:	08000388 	j	e20 <_data-0x7ffff1e0>
    178c:	00009f64 	0x9f64
    1790:	00000000 	nop
    1794:	05240000 	0x5240000
    1798:	05a08800 	bltz	t5,fffe379c <_text_end+0x77fe261c>
    179c:	00038800 	sll	s1,v1,0x0
    17a0:	009f6508 	0x9f6508
    17a4:	00000000 	nop
    17a8:	24000000 	li	zero,0
    17ac:	a0880005 	sb	t0,5(a0)
    17b0:	03880005 	0x3880005
    17b4:	9f760800 	0x9f760800
	...
    17c0:	88000524 	lwl	zero,1316(zero)
    17c4:	880005a0 	lwl	zero,1440(zero)
    17c8:	69080003 	0x69080003
    17cc:	0000009f 	0x9f
    17d0:	00000000 	nop
    17d4:	00052400 	sll	a0,a1,0x10
    17d8:	0005a088 	0x5a088
    17dc:	08000388 	j	e20 <_data-0x7ffff1e0>
    17e0:	00009f63 	0x9f63
    17e4:	00000000 	nop
    17e8:	05240000 	0x5240000
    17ec:	05a08800 	bltz	t5,fffe37f0 <_text_end+0x77fe2670>
    17f0:	00038800 	sll	s1,v1,0x0
    17f4:	009f5208 	0x9f5208
    17f8:	00000000 	nop
    17fc:	2c000000 	sltiu	zero,zero,0
    1800:	a0880005 	sb	t0,5(a0)
    1804:	02880005 	0x2880005
    1808:	009f3000 	0x9f3000
    180c:	00000000 	nop
    1810:	2c000000 	sltiu	zero,zero,0
    1814:	a0880005 	sb	t0,5(a0)
    1818:	03880005 	0x3880005
    181c:	9f200800 	0x9f200800
	...
    1828:	8800052c 	lwl	zero,1324(zero)
    182c:	880005a0 	lwl	zero,1440(zero)
    1830:	3a080003 	xori	t0,s0,0x3
    1834:	0000009f 	0x9f
    1838:	00000000 	nop
    183c:	00052c00 	sll	a1,a1,0x10
    1840:	0005a088 	0x5a088
    1844:	08000388 	j	e20 <_data-0x7ffff1e0>
    1848:	00009f64 	0x9f64
    184c:	00000000 	nop
    1850:	052c0000 	teqi	t1,0
    1854:	05a08800 	bltz	t5,fffe3858 <_text_end+0x77fe26d8>
    1858:	00038800 	sll	s1,v1,0x0
    185c:	009f6508 	0x9f6508
    1860:	00000000 	nop
    1864:	2c000000 	sltiu	zero,zero,0
    1868:	a0880005 	sb	t0,5(a0)
    186c:	03880005 	0x3880005
    1870:	9f760800 	0x9f760800
	...
    187c:	8800052c 	lwl	zero,1324(zero)
    1880:	880005a0 	lwl	zero,1440(zero)
    1884:	69080003 	0x69080003
    1888:	0000009f 	0x9f
    188c:	00000000 	nop
    1890:	00052c00 	sll	a1,a1,0x10
    1894:	0005a088 	0x5a088
    1898:	08000388 	j	e20 <_data-0x7ffff1e0>
    189c:	00009f63 	0x9f63
    18a0:	00000000 	nop
    18a4:	05340000 	0x5340000
    18a8:	05a08800 	bltz	t5,fffe38ac <_text_end+0x77fe272c>
    18ac:	00028800 	sll	s1,v0,0x0
    18b0:	00009f30 	tge	zero,zero,0x27c
    18b4:	00000000 	nop
    18b8:	05340000 	0x5340000
    18bc:	05a08800 	bltz	t5,fffe38c0 <_text_end+0x77fe2740>
    18c0:	00038800 	sll	s1,v1,0x0
    18c4:	009f2008 	0x9f2008
    18c8:	00000000 	nop
    18cc:	34000000 	li	zero,0x0
    18d0:	a0880005 	sb	t0,5(a0)
    18d4:	03880005 	0x3880005
    18d8:	9f3a0800 	0x9f3a0800
	...
    18e4:	88000534 	lwl	zero,1332(zero)
    18e8:	880005a0 	lwl	zero,1440(zero)
    18ec:	64080003 	0x64080003
    18f0:	0000009f 	0x9f
    18f4:	00000000 	nop
    18f8:	00053400 	sll	a2,a1,0x10
    18fc:	0005a088 	0x5a088
    1900:	08000388 	j	e20 <_data-0x7ffff1e0>
    1904:	00009f65 	0x9f65
    1908:	00000000 	nop
    190c:	05340000 	0x5340000
    1910:	05a08800 	bltz	t5,fffe3914 <_text_end+0x77fe2794>
    1914:	00038800 	sll	s1,v1,0x0
    1918:	009f7608 	0x9f7608
    191c:	00000000 	nop
    1920:	34000000 	li	zero,0x0
    1924:	a0880005 	sb	t0,5(a0)
    1928:	03880005 	0x3880005
    192c:	9f690800 	0x9f690800
	...
    1938:	88000534 	lwl	zero,1332(zero)
    193c:	880005a0 	lwl	zero,1440(zero)
    1940:	63080003 	0x63080003
    1944:	0000009f 	0x9f
    1948:	00000000 	nop
    194c:	00053c00 	sll	a3,a1,0x10
    1950:	0005a088 	0x5a088
    1954:	30000288 	andi	zero,zero,0x288
    1958:	0000009f 	0x9f
    195c:	00000000 	nop
    1960:	00053c00 	sll	a3,a1,0x10
    1964:	0005a088 	0x5a088
    1968:	08000388 	j	e20 <_data-0x7ffff1e0>
    196c:	00009f20 	0x9f20
    1970:	00000000 	nop
    1974:	053c0000 	0x53c0000
    1978:	05a08800 	bltz	t5,fffe397c <_text_end+0x77fe27fc>
    197c:	00038800 	sll	s1,v1,0x0
    1980:	009f3a08 	0x9f3a08
    1984:	00000000 	nop
    1988:	3c000000 	lui	zero,0x0
    198c:	a0880005 	sb	t0,5(a0)
    1990:	03880005 	0x3880005
    1994:	9f640800 	0x9f640800
	...
    19a0:	8800053c 	lwl	zero,1340(zero)
    19a4:	880005a0 	lwl	zero,1440(zero)
    19a8:	65080003 	0x65080003
    19ac:	0000009f 	0x9f
    19b0:	00000000 	nop
    19b4:	00053c00 	sll	a3,a1,0x10
    19b8:	0005a088 	0x5a088
    19bc:	08000388 	j	e20 <_data-0x7ffff1e0>
    19c0:	00009f76 	tne	zero,zero,0x27d
    19c4:	00000000 	nop
    19c8:	053c0000 	0x53c0000
    19cc:	05a08800 	bltz	t5,fffe39d0 <_text_end+0x77fe2850>
    19d0:	00038800 	sll	s1,v1,0x0
    19d4:	009f6908 	0x9f6908
    19d8:	00000000 	nop
    19dc:	44000000 	mfc1	zero,$f0
    19e0:	a0880005 	sb	t0,5(a0)
    19e4:	02880005 	0x2880005
    19e8:	009f3000 	0x9f3000
    19ec:	00000000 	nop
    19f0:	44000000 	mfc1	zero,$f0
    19f4:	a0880005 	sb	t0,5(a0)
    19f8:	03880005 	0x3880005
    19fc:	9f200800 	0x9f200800
	...
    1a08:	88000544 	lwl	zero,1348(zero)
    1a0c:	880005a0 	lwl	zero,1440(zero)
    1a10:	3a080003 	xori	t0,s0,0x3
    1a14:	0000009f 	0x9f
    1a18:	00000000 	nop
    1a1c:	00054400 	sll	t0,a1,0x10
    1a20:	0005a088 	0x5a088
    1a24:	08000388 	j	e20 <_data-0x7ffff1e0>
    1a28:	00009f64 	0x9f64
    1a2c:	00000000 	nop
    1a30:	05440000 	0x5440000
    1a34:	05a08800 	bltz	t5,fffe3a38 <_text_end+0x77fe28b8>
    1a38:	00038800 	sll	s1,v1,0x0
    1a3c:	009f6508 	0x9f6508
    1a40:	00000000 	nop
    1a44:	44000000 	mfc1	zero,$f0
    1a48:	a0880005 	sb	t0,5(a0)
    1a4c:	03880005 	0x3880005
    1a50:	9f760800 	0x9f760800
	...
    1a5c:	88000544 	lwl	zero,1348(zero)
    1a60:	880005a0 	lwl	zero,1440(zero)
    1a64:	69080003 	0x69080003
    1a68:	0000009f 	0x9f
    1a6c:	00000000 	nop
    1a70:	00054c00 	sll	t1,a1,0x10
    1a74:	0005a088 	0x5a088
    1a78:	30000288 	andi	zero,zero,0x288
    1a7c:	0000009f 	0x9f
    1a80:	00000000 	nop
    1a84:	00054c00 	sll	t1,a1,0x10
    1a88:	0005a088 	0x5a088
    1a8c:	08000388 	j	e20 <_data-0x7ffff1e0>
    1a90:	00009f20 	0x9f20
    1a94:	00000000 	nop
    1a98:	054c0000 	teqi	t2,0
    1a9c:	05a08800 	bltz	t5,fffe3aa0 <_text_end+0x77fe2920>
    1aa0:	00038800 	sll	s1,v1,0x0
    1aa4:	009f3a08 	0x9f3a08
    1aa8:	00000000 	nop
    1aac:	4c000000 	mfc3	zero,$0
    1ab0:	a0880005 	sb	t0,5(a0)
    1ab4:	03880005 	0x3880005
    1ab8:	9f640800 	0x9f640800
	...
    1ac4:	8800054c 	lwl	zero,1356(zero)
    1ac8:	880005a0 	lwl	zero,1440(zero)
    1acc:	65080003 	0x65080003
    1ad0:	0000009f 	0x9f
    1ad4:	00000000 	nop
    1ad8:	00054c00 	sll	t1,a1,0x10
    1adc:	0005a088 	0x5a088
    1ae0:	08000388 	j	e20 <_data-0x7ffff1e0>
    1ae4:	00009f76 	tne	zero,zero,0x27d
    1ae8:	00000000 	nop
    1aec:	05540000 	0x5540000
    1af0:	05a08800 	bltz	t5,fffe3af4 <_text_end+0x77fe2974>
    1af4:	00028800 	sll	s1,v0,0x0
    1af8:	00009f30 	tge	zero,zero,0x27c
    1afc:	00000000 	nop
    1b00:	05540000 	0x5540000
    1b04:	05a08800 	bltz	t5,fffe3b08 <_text_end+0x77fe2988>
    1b08:	00038800 	sll	s1,v1,0x0
    1b0c:	009f2008 	0x9f2008
    1b10:	00000000 	nop
    1b14:	54000000 	bnezl	zero,1b18 <_data-0x7fffe4e8>
    1b18:	a0880005 	sb	t0,5(a0)
    1b1c:	03880005 	0x3880005
    1b20:	9f3a0800 	0x9f3a0800
	...
    1b2c:	88000554 	lwl	zero,1364(zero)
    1b30:	880005a0 	lwl	zero,1440(zero)
    1b34:	64080003 	0x64080003
    1b38:	0000009f 	0x9f
    1b3c:	00000000 	nop
    1b40:	00055400 	sll	t2,a1,0x10
    1b44:	0005a088 	0x5a088
    1b48:	08000388 	j	e20 <_data-0x7ffff1e0>
    1b4c:	00009f65 	0x9f65
    1b50:	00000000 	nop
    1b54:	055c0000 	0x55c0000
    1b58:	05a08800 	bltz	t5,fffe3b5c <_text_end+0x77fe29dc>
    1b5c:	00028800 	sll	s1,v0,0x0
    1b60:	00009f30 	tge	zero,zero,0x27c
    1b64:	00000000 	nop
    1b68:	055c0000 	0x55c0000
    1b6c:	05a08800 	bltz	t5,fffe3b70 <_text_end+0x77fe29f0>
    1b70:	00038800 	sll	s1,v1,0x0
    1b74:	009f2008 	0x9f2008
    1b78:	00000000 	nop
    1b7c:	5c000000 	bgtzl	zero,1b80 <_data-0x7fffe480>
    1b80:	a0880005 	sb	t0,5(a0)
    1b84:	03880005 	0x3880005
    1b88:	9f3a0800 	0x9f3a0800
	...
    1b94:	8800055c 	lwl	zero,1372(zero)
    1b98:	880005a0 	lwl	zero,1440(zero)
    1b9c:	64080003 	0x64080003
    1ba0:	0000009f 	0x9f
    1ba4:	00000000 	nop
    1ba8:	00056400 	sll	t4,a1,0x10
    1bac:	0005a088 	0x5a088
    1bb0:	30000288 	andi	zero,zero,0x288
    1bb4:	0000009f 	0x9f
    1bb8:	00000000 	nop
    1bbc:	00056400 	sll	t4,a1,0x10
    1bc0:	0005a088 	0x5a088
    1bc4:	08000388 	j	e20 <_data-0x7ffff1e0>
    1bc8:	00009f20 	0x9f20
    1bcc:	00000000 	nop
    1bd0:	05640000 	0x5640000
    1bd4:	05a08800 	bltz	t5,fffe3bd8 <_text_end+0x77fe2a58>
    1bd8:	00038800 	sll	s1,v1,0x0
    1bdc:	009f3a08 	0x9f3a08
    1be0:	00000000 	nop
    1be4:	6c000000 	0x6c000000
    1be8:	a0880005 	sb	t0,5(a0)
    1bec:	02880005 	0x2880005
    1bf0:	009f3000 	0x9f3000
    1bf4:	00000000 	nop
    1bf8:	6c000000 	0x6c000000
    1bfc:	a0880005 	sb	t0,5(a0)
    1c00:	03880005 	0x3880005
    1c04:	9f200800 	0x9f200800
	...
    1c10:	88000574 	lwl	zero,1396(zero)
    1c14:	8800057c 	lwl	zero,1404(zero)
    1c18:	9f300002 	0x9f300002
	...
    1c24:	8800057c 	lwl	zero,1404(zero)
    1c28:	880005a0 	lwl	zero,1440(zero)
    1c2c:	ba080006 	swr	t0,6(s0)
    1c30:	9f1f2447 	0x9f1f2447
	...
    1c3c:	880002e8 	lwl	zero,744(zero)
    1c40:	8800030c 	lwl	zero,780(zero)
    1c44:	0c540001 	jal	1500004 <_data-0x7eaffffc>
    1c48:	28880003 	slti	t0,a0,3
    1c4c:	04880003 	tgei	a0,3
    1c50:	5401f300 	bnel	zero,at,ffffe854 <_text_end+0x77ffd6d4>
    1c54:	0003289f 	0x3289f
    1c58:	00033088 	0x33088
    1c5c:	54000188 	bnezl	zero,2280 <_data-0x7fffdd80>
    1c60:	00000000 	nop
    1c64:	00000000 	nop
    1c68:	88000278 	lwl	zero,632(zero)
    1c6c:	88000288 	lwl	zero,648(zero)
    1c70:	88540001 	lwl	s4,1(v0)
    1c74:	d8880002 	ldc2	$8,2(a0)
    1c78:	01880002 	0x1880002
    1c7c:	02d86200 	0x2d86200
    1c80:	02e88800 	0x2e88800
    1c84:	00048800 	sll	s1,a0,0x0
    1c88:	9f5401f3 	0x9f5401f3
	...
    1c94:	880002a0 	lwl	zero,672(zero)
    1c98:	880002a8 	lwl	zero,680(zero)
    1c9c:	9f370002 	0x9f370002
	...
    1ca8:	880002b0 	lwl	zero,688(zero)
    1cac:	880002c0 	lwl	zero,704(zero)
    1cb0:	c0520001 	ll	s2,1(v0)
    1cb4:	c7880002 	lwc1	$f8,2(gp)
    1cb8:	01880002 	0x1880002
    1cbc:	00005400 	sll	t2,zero,0x10
    1cc0:	00000000 	nop
    1cc4:	07880000 	tgei	gp,0
    1cc8:	07988800 	0x7988800
    1ccc:	00018800 	sll	s1,at,0x0
    1cd0:	00079854 	0x79854
    1cd4:	0007e488 	0x7e488
    1cd8:	61000188 	0x61000188
    1cdc:	880007e4 	lwl	zero,2020(zero)
    1ce0:	880007f8 	lwl	zero,2040(zero)
    1ce4:	01f30004 	sllv	zero,s3,t7
    1ce8:	07f89f54 	0x7f89f54
    1cec:	083c8800 	j	f22000 <_data-0x7f0de000>
    1cf0:	00018800 	sll	s1,at,0x0
    1cf4:	00000061 	0x61
    1cf8:	00000000 	nop
    1cfc:	00078800 	sll	s1,a3,0x0
    1d00:	0007ab88 	0x7ab88
    1d04:	55000188 	bnezl	t0,2328 <_data-0x7fffdcd8>
    1d08:	880007ab 	lwl	zero,1963(zero)
    1d0c:	8800083c 	lwl	zero,2108(zero)
    1d10:	01f30004 	sllv	zero,s3,t7
    1d14:	00009f55 	0x9f55
    1d18:	00000000 	nop
    1d1c:	08040000 	j	100000 <_data-0x7ff00000>
    1d20:	082b8800 	j	ae2000 <_data-0x7f51e000>
    1d24:	00018800 	sll	s1,at,0x0
    1d28:	00000056 	0x56
    1d2c:	00000000 	nop
    1d30:	00072000 	sll	a0,a3,0x0
    1d34:	00074488 	0x74488
    1d38:	30000288 	andi	zero,zero,0x288
    1d3c:	0007449f 	0x7449f
    1d40:	00076488 	0x76488
    1d44:	60000188 	0x60000188
	...
    1d50:	88000758 	lwl	zero,1880(zero)
    1d54:	8800076b 	lwl	zero,1899(zero)
    1d58:	00560001 	0x560001
    1d5c:	00000000 	nop
    1d60:	58000000 	blezl	zero,1d64 <_data-0x7fffe29c>
    1d64:	6b880007 	0x6b880007
    1d68:	01880007 	srav	zero,t0,t4
    1d6c:	00005700 	sll	t2,zero,0x1c
    1d70:	00000000 	nop
    1d74:	07580000 	0x7580000
    1d78:	076b8800 	tltiu	k1,-30720
    1d7c:	00018800 	sll	s1,at,0x0
    1d80:	00000052 	mflhxu	zero
    1d84:	00000000 	nop
    1d88:	00068800 	sll	s1,a2,0x0
    1d8c:	0006bc88 	0x6bc88
    1d90:	54000188 	bnezl	zero,23b4 <_data-0x7fffdc4c>
    1d94:	880006bc 	lwl	zero,1724(zero)
    1d98:	88000718 	lwl	zero,1816(zero)
    1d9c:	18600001 	blez	v1,1da4 <_data-0x7fffe25c>
    1da0:	20880007 	addi	t0,a0,7
    1da4:	04880007 	tgei	a0,7
    1da8:	5401f300 	bnel	zero,at,ffffe9ac <_text_end+0x77ffd82c>
    1dac:	0000009f 	0x9f
    1db0:	00000000 	nop
    1db4:	00068800 	sll	s1,a2,0x0
    1db8:	0006bc88 	0x6bc88
    1dbc:	31000288 	andi	zero,t0,0x288
    1dc0:	0006bc9f 	0x6bc9f
    1dc4:	0006c888 	0x6c888
    1dc8:	61000188 	0x61000188
    1dcc:	880006c8 	lwl	zero,1736(zero)
    1dd0:	880006cf 	lwl	zero,1743(zero)
    1dd4:	cf550001 	pref	0x15,1(k0)
    1dd8:	d0880006 	0xd0880006
    1ddc:	03880006 	srlv	zero,t0,gp
    1de0:	9f7f8100 	0x9f7f8100
    1de4:	880006d0 	lwl	zero,1744(zero)
    1de8:	88000714 	lwl	zero,1812(zero)
    1dec:	00610001 	movt	zero,v1,$fcc0
    1df0:	00000000 	nop
    1df4:	10000000 	b	1df8 <_data-0x7fffe208>
    1df8:	68880006 	0x68880006
    1dfc:	01880006 	srlv	zero,t0,t4
    1e00:	06746000 	0x6746000
    1e04:	06888800 	tgei	s4,-30720
    1e08:	00018800 	sll	s1,at,0x0
    1e0c:	00000060 	0x60
    1e10:	00000000 	nop
    1e14:	00064800 	sll	t1,a2,0x0
    1e18:	00065b88 	0x65b88
    1e1c:	52000188 	beqzl	s0,2440 <_data-0x7fffdbc0>
    1e20:	88000674 	lwl	zero,1652(zero)
    1e24:	8800067f 	lwl	zero,1663(zero)
    1e28:	00520001 	0x520001
    1e2c:	00000000 	nop
    1e30:	3c000000 	lui	zero,0x0
    1e34:	78880008 	0x78880008
    1e38:	01880008 	0x1880008
    1e3c:	08785400 	j	1e15000 <_data-0x7e1eb000>
    1e40:	08988800 	j	2622000 <_data-0x7d9de000>
    1e44:	00018800 	sll	s1,at,0x0
    1e48:	00089862 	0x89862
    1e4c:	0008ac88 	0x8ac88
    1e50:	f3000488 	0xf3000488
    1e54:	ac9f5401 	sw	ra,21505(a0)
    1e58:	60880008 	0x60880008
    1e5c:	0188000a 	movz	zero,t4,t0
    1e60:	00006200 	sll	t4,zero,0x8
    1e64:	00000000 	nop
    1e68:	08700000 	j	1c00000 <_data-0x7e400000>
    1e6c:	08788800 	j	1e22000 <_data-0x7e1de000>
    1e70:	00028800 	sll	s1,v0,0x0
    1e74:	08789f30 	j	1e27cc0 <_data-0x7e1d8340>
    1e78:	089c8800 	j	2722000 <_data-0x7d8de000>
    1e7c:	00018800 	sll	s1,at,0x0
    1e80:	0008ac61 	0x8ac61
    1e84:	0009c088 	0x9c088
    1e88:	61000188 	0x61000188
    1e8c:	880009c0 	lwl	zero,2496(zero)
    1e90:	880009c8 	lwl	zero,2504(zero)
    1e94:	7f810003 	0x7f810003
    1e98:	0009c89f 	0x9c89f
    1e9c:	000a1888 	0xa1888
    1ea0:	61000188 	0x61000188
    1ea4:	88000a24 	lwl	zero,2596(zero)
    1ea8:	88000a40 	lwl	zero,2624(zero)
    1eac:	40610001 	0x40610001
    1eb0:	4888000a 	0x4888000a
    1eb4:	0688000a 	tgei	s4,10
    1eb8:	82007400 	lb	zero,29696(s0)
    1ebc:	489f1c00 	0x489f1c00
    1ec0:	6088000a 	0x6088000a
    1ec4:	0188000a 	movz	zero,t4,t0
    1ec8:	00006100 	sll	t4,zero,0x4
    1ecc:	00000000 	nop
    1ed0:	08ac0000 	j	2b00000 <_data-0x7d500000>
    1ed4:	08c08800 	j	3022000 <_data-0x7cfde000>
    1ed8:	00018800 	sll	s1,at,0x0
    1edc:	000a4864 	0xa4864
    1ee0:	000a6088 	0xa6088
    1ee4:	64000188 	0x64000188
	...
    1ef0:	88000870 	lwl	zero,2160(zero)
    1ef4:	880008a0 	lwl	zero,2208(zero)
    1ef8:	ac600001 	sw	zero,1(v1)
    1efc:	60880008 	0x60880008
    1f00:	0188000a 	movz	zero,t4,t0
    1f04:	00006000 	sll	t4,zero,0x0
    1f08:	00000000 	nop
    1f0c:	08c00000 	j	3000000 <_data-0x7d000000>
    1f10:	08fc8800 	j	3f22000 <_data-0x7c0de000>
    1f14:	00018800 	sll	s1,at,0x0
    1f18:	00090c55 	0x90c55
    1f1c:	00092b88 	0x92b88
    1f20:	55000188 	bnezl	t0,2544 <_data-0x7fffdabc>
    1f24:	88000934 	lwl	zero,2356(zero)
    1f28:	88000987 	lwl	zero,2439(zero)
    1f2c:	9c550001 	0x9c550001
    1f30:	ab880009 	swl	t0,9(gp)
    1f34:	01880009 	0x1880009
    1f38:	09b45500 	j	6d15400 <_data-0x792eac00>
    1f3c:	09c78800 	j	71e2000 <_data-0x78e1e000>
    1f40:	00018800 	sll	s1,at,0x0
    1f44:	0009d055 	0x9d055
    1f48:	0009df88 	0x9df88
    1f4c:	55000188 	bnezl	t0,2570 <_data-0x7fffda90>
    1f50:	880009ec 	lwl	zero,2540(zero)
    1f54:	88000a0b 	lwl	zero,2571(zero)
    1f58:	14550001 	bne	v0,s5,1f60 <_data-0x7fffe0a0>
    1f5c:	1c88000a 	0x1c88000a
    1f60:	0188000a 	movz	zero,t4,t0
    1f64:	0a245500 	j	8915400 <_data-0x776eac00>
    1f68:	0a488800 	j	9222000 <_data-0x76dde000>
    1f6c:	00018800 	sll	s1,at,0x0
    1f70:	00000055 	0x55
    1f74:	00000000 	nop
    1f78:	000a6000 	sll	t4,t2,0x0
    1f7c:	000a9488 	0xa9488
    1f80:	54000188 	bnezl	zero,25a4 <_data-0x7fffda5c>
    1f84:	88000a94 	lwl	zero,2708(zero)
    1f88:	88000a9c 	lwl	zero,2716(zero)
    1f8c:	00800004 	sllv	zero,zero,a0
    1f90:	0a9c9f1f 	j	a727c7c <_data-0x758d8384>
    1f94:	0ae48800 	j	b922000 <_data-0x746de000>
    1f98:	00048800 	sll	s1,a0,0x0
    1f9c:	9f5401f3 	0x9f5401f3
    1fa0:	88000ae4 	lwl	zero,2788(zero)
    1fa4:	88000aec 	lwl	zero,2796(zero)
    1fa8:	ec540001 	swc3	$20,1(v0)
    1fac:	3888000a 	xori	t0,a0,0xa
    1fb0:	0488000b 	tgei	a0,11
    1fb4:	5401f300 	bnel	zero,at,ffffebb8 <_text_end+0x77ffda38>
    1fb8:	0000009f 	0x9f
    1fbc:	00000000 	nop
    1fc0:	000a6000 	sll	t4,t2,0x0
    1fc4:	000a9b88 	0xa9b88
    1fc8:	55000188 	bnezl	t0,25ec <_data-0x7fffda14>
    1fcc:	88000a9b 	lwl	zero,2715(zero)
    1fd0:	88000ab4 	lwl	zero,2740(zero)
    1fd4:	b4630001 	0xb4630001
    1fd8:	e488000a 	swc1	$f8,10(a0)
    1fdc:	0488000a 	tgei	a0,10
    1fe0:	5501f300 	bnel	t0,at,ffffebe4 <_text_end+0x77ffda64>
    1fe4:	000ae49f 	0xae49f
    1fe8:	000aec88 	0xaec88
    1fec:	55000188 	bnezl	t0,2610 <_data-0x7fffd9f0>
    1ff0:	88000aec 	lwl	zero,2796(zero)
    1ff4:	88000b08 	lwl	zero,2824(zero)
    1ff8:	08630001 	j	18c0004 <_data-0x7e73fffc>
    1ffc:	3888000b 	xori	t0,a0,0xb
    2000:	0488000b 	tgei	a0,11
    2004:	5501f300 	bnel	t0,at,ffffec08 <_text_end+0x77ffda88>
    2008:	0000009f 	0x9f
    200c:	00000000 	nop
    2010:	000a6000 	sll	t4,t2,0x0
    2014:	000a9b88 	0xa9b88
    2018:	56000188 	bnezl	s0,263c <_data-0x7fffd9c4>
    201c:	88000a9b 	lwl	zero,2715(zero)
    2020:	88000ac8 	lwl	zero,2760(zero)
    2024:	c8640001 	lwc2	$4,1(v1)
    2028:	e488000a 	swc1	$f8,10(a0)
    202c:	0488000a 	tgei	a0,10
    2030:	5601f300 	bnel	s0,at,ffffec34 <_text_end+0x77ffdab4>
    2034:	000ae49f 	0xae49f
    2038:	000aec88 	0xaec88
    203c:	56000188 	bnezl	s0,2660 <_data-0x7fffd9a0>
    2040:	88000aec 	lwl	zero,2796(zero)
    2044:	88000b38 	lwl	zero,2872(zero)
    2048:	00640001 	movf	zero,v1,$fcc1
    204c:	00000000 	nop
    2050:	60000000 	0x60000000
    2054:	9b88000a 	lwr	t0,10(gp)
    2058:	0188000a 	movz	zero,t4,t0
    205c:	0a9b5700 	j	a6d5c00 <_data-0x7592a400>
    2060:	0ae48800 	j	b922000 <_data-0x746de000>
    2064:	00048800 	sll	s1,a0,0x0
    2068:	9f5701f3 	0x9f5701f3
    206c:	88000ae4 	lwl	zero,2788(zero)
    2070:	88000aec 	lwl	zero,2796(zero)
    2074:	ec570001 	swc3	$23,1(v0)
    2078:	3888000a 	xori	t0,a0,0xa
    207c:	0488000b 	tgei	a0,11
    2080:	5701f300 	bnel	t8,at,ffffec84 <_text_end+0x77ffdb04>
    2084:	0000009f 	0x9f
    2088:	00000000 	nop
    208c:	000aa400 	sll	s4,t2,0x10
    2090:	000ad088 	0xad088
    2094:	62000188 	0x62000188
    2098:	88000aec 	lwl	zero,2796(zero)
    209c:	88000b00 	lwl	zero,2816(zero)
    20a0:	08620001 	j	1880004 <_data-0x7e77fffc>
    20a4:	3888000b 	xori	t0,a0,0xb
    20a8:	0188000b 	movn	zero,t4,t0
    20ac:	00006200 	sll	t4,zero,0x8
    20b0:	00000000 	nop
    20b4:	0aac0000 	j	ab00000 <_data-0x75500000>
    20b8:	0ab48800 	j	ad22000 <_data-0x752de000>
    20bc:	000e8800 	sll	s1,t6,0x0
    20c0:	82120083 	lb	s2,131(s0)
    20c4:	2b141600 	slti	s4,t8,5632
    20c8:	16000128 	bnez	s0,256c <_data-0x7fffda94>
    20cc:	0ab49f13 	j	ad27c4c <_data-0x752d83b4>
    20d0:	0ab88800 	j	ae22000 <_data-0x751de000>
    20d4:	000f8800 	sll	s1,t7,0x0
    20d8:	125501f3 	beq	s2,s5,28a8 <_data-0x7fffd758>
    20dc:	14160082 	bne	zero,s6,22e8 <_data-0x7fffdd18>
    20e0:	0001282b 	sltu	a1,zero,at
    20e4:	b89f1316 	swr	ra,4886(a0)
    20e8:	d888000a 	ldc2	$8,10(a0)
    20ec:	0188000a 	movz	zero,t4,t0
    20f0:	0b086000 	j	c218000 <_data-0x73de8000>
    20f4:	0b388800 	j	ce22000 <_data-0x731de000>
    20f8:	00018800 	sll	s1,at,0x0
    20fc:	00000060 	0x60
    2100:	00000000 	nop
    2104:	000b1800 	sll	v1,t3,0x0
    2108:	000b2488 	0xb2488
    210c:	52000188 	beqzl	s0,2730 <_data-0x7fffd8d0>
    2110:	00000000 	nop
    2114:	00000000 	nop
    2118:	88000a94 	lwl	zero,2708(zero)
    211c:	88000a9c 	lwl	zero,2716(zero)
    2120:	a4600001 	sh	zero,1(v1)
    2124:	b088000a 	0xb088000a
    2128:	0188000a 	movz	zero,t4,t0
    212c:	0ae46000 	j	b918000 <_data-0x746e8000>
    2130:	0aec8800 	j	bb22000 <_data-0x744de000>
    2134:	00018800 	sll	s1,at,0x0
    2138:	000aec54 	0xaec54
    213c:	000b0888 	0xb0888
    2140:	60000188 	0x60000188
	...
    2154:	00550001 	movt	zero,v0,$fcc5
    2158:	00000000 	nop
    215c:	01000000 	0x1000000
    2160:	00005600 	sll	t2,zero,0x18
    2164:	00000000 	nop
    2168:	00040000 	sll	zero,a0,0x0
    216c:	9f5501f3 	0x9f5501f3
	...
    2180:	00540001 	movf	zero,v0,$fcc5
    2184:	00000000 	nop
    2188:	04000000 	bltz	zero,218c <_data-0x7fffde74>
    218c:	5401f300 	bnel	zero,at,ffffed90 <_text_end+0x77ffdc10>
    2190:	0000009f 	0x9f
	...
    21a0:	55000100 	bnezl	t0,25a4 <_data-0x7fffda5c>
    21a4:	00000000 	nop
    21a8:	00000000 	nop
    21ac:	01f30004 	sllv	zero,s3,t7
    21b0:	00009f55 	0x9f55
	...
    21c0:	00010000 	sll	zero,at,0x0
    21c4:	00000056 	0x56
    21c8:	00000000 	nop
    21cc:	f3000600 	0xf3000600
    21d0:	1c315601 	0x1c315601
    21d4:	0000009f 	0x9f
	...
    21e4:	54000100 	bnezl	zero,25e8 <_data-0x7fffda18>
    21e8:	00000000 	nop
    21ec:	00000000 	nop
    21f0:	00520001 	0x520001
	...
    2200:	01000000 	0x1000000
    2204:	00005500 	sll	t2,zero,0x14
    2208:	00000000 	nop
    220c:	00040000 	sll	zero,a0,0x0
    2210:	9f5501f3 	0x9f5501f3
	...
    221c:	00550001 	movt	zero,v0,$fcc5
    2220:	00000000 	nop
    2224:	04000000 	bltz	zero,2228 <_data-0x7fffddd8>
    2228:	5501f300 	bnel	t0,at,ffffee2c <_text_end+0x77ffdcac>
    222c:	0000009f 	0x9f
	...
    223c:	56000100 	bnezl	s0,2640 <_data-0x7fffd9c0>
    2240:	00000000 	nop
    2244:	00000000 	nop
    2248:	0073000a 	movz	zero,v1,s3
    224c:	22007220 	addi	zero,s0,29216
    2250:	9f220076 	0x9f220076
	...
    225c:	00560001 	0x560001
    2260:	00000000 	nop
    2264:	10000000 	b	2268 <_data-0x7fffdd98>
    2268:	5601f300 	bnel	s0,at,ffffee6c <_text_end+0x77ffdcec>
    226c:	22007320 	addi	zero,s0,29472
    2270:	1c5501f3 	0x1c5501f3
    2274:	225601f3 	addi	s6,s2,499
    2278:	0000009f 	0x9f
    227c:	00000000 	nop
    2280:	73000700 	0x73000700
    2284:	5501f300 	bnel	t0,at,ffffee88 <_text_end+0x77ffdd08>
    2288:	00009f1c 	0x9f1c
    228c:	00000000 	nop
    2290:	000a0000 	sll	zero,t2,0x0
    2294:	72200073 	0x72200073
    2298:	00762200 	0x762200
    229c:	00009f22 	0x9f22
    22a0:	00000000 	nop
    22a4:	00090000 	sll	zero,t1,0x0
    22a8:	00730072 	tlt	v1,s3,0x1
    22ac:	2200761c 	addi	zero,s0,30236
    22b0:	0000009f 	0x9f
	...
    22c0:	55000100 	bnezl	t0,26c4 <_data-0x7fffd93c>
    22c4:	00000000 	nop
    22c8:	00000000 	nop
    22cc:	00530001 	0x530001
    22d0:	00000000 	nop
    22d4:	01000000 	0x1000000
    22d8:	00005500 	sll	t2,zero,0x14
	...
    22e8:	00010000 	sll	zero,at,0x0
    22ec:	00000054 	0x54
    22f0:	00000000 	nop
    22f4:	52000100 	beqzl	s0,26f8 <_data-0x7fffd908>
    22f8:	00000000 	nop
    22fc:	00000000 	nop
    2300:	00530001 	0x530001
    2304:	00000000 	nop
    2308:	01000000 	0x1000000
    230c:	00005200 	sll	t2,zero,0x8
    2310:	00000000 	nop
    2314:	00010000 	sll	zero,at,0x0
    2318:	00000057 	0x57
    231c:	00000000 	nop
    2320:	55000100 	bnezl	t0,2724 <_data-0x7fffd8dc>
    2324:	00000000 	nop
    2328:	00000000 	nop
    232c:	00530001 	0x530001
	...
    233c:	01000000 	0x1000000
    2340:	00005400 	sll	t2,zero,0x10
    2344:	00000000 	nop
    2348:	00010000 	sll	zero,at,0x0
    234c:	00000052 	mflhxu	zero
	...
    235c:	55000100 	bnezl	t0,2760 <_data-0x7fffd8a0>
    2360:	00000000 	nop
    2364:	00000000 	nop
    2368:	01f30004 	sllv	zero,s3,t7
    236c:	00009f55 	0x9f55
	...
    237c:	00010000 	sll	zero,at,0x0
    2380:	00000056 	0x56
    2384:	00000000 	nop
    2388:	f3000400 	0xf3000400
    238c:	009f5601 	0x9f5601
    2390:	00000000 	nop
    2394:	0b000000 	j	c000000 <_data-0x74000000>
    2398:	20007300 	addi	zero,zero,29440
    239c:	f3220072 	0xf3220072
    23a0:	9f225601 	0x9f225601
	...
    23ac:	0072000a 	movz	zero,v1,s2
    23b0:	f31c0073 	0xf31c0073
    23b4:	9f225601 	0x9f225601
	...
    23c8:	00540001 	movf	zero,v0,$fcc5
    23cc:	00000000 	nop
    23d0:	01000000 	0x1000000
    23d4:	00005300 	sll	t2,zero,0xc
    23d8:	00000000 	nop
    23dc:	0b380000 	j	ce00000 <_data-0x73200000>
    23e0:	0b448800 	j	d122000 <_data-0x72ede000>
    23e4:	00018800 	sll	s1,at,0x0
    23e8:	000b4454 	0xb4454
    23ec:	000b5c88 	0xb5c88
    23f0:	52000188 	beqzl	s0,2a14 <_data-0x7fffd5ec>
    23f4:	00000000 	nop
    23f8:	00000000 	nop
    23fc:	88000b38 	lwl	zero,2872(zero)
    2400:	88000b40 	lwl	zero,2880(zero)
    2404:	40560001 	0x40560001
    2408:	4488000b 	0x4488000b
    240c:	0488000b 	tgei	a0,11
    2410:	5601f300 	bnel	s0,at,fffff014 <_text_end+0x77ffde94>
    2414:	000b449f 	0xb449f
    2418:	000b5488 	0xb5488
    241c:	73000b88 	0x73000b88
    2420:	00722000 	0x722000
    2424:	5601f322 	bnel	s0,at,fffff0b0 <_text_end+0x77ffdf30>
    2428:	0b549f22 	j	d527c88 <_data-0x72ad8378>
    242c:	0b5c8800 	j	d722000 <_data-0x728de000>
    2430:	000a8800 	sll	s1,t2,0x0
    2434:	00730072 	tlt	v1,s3,0x1
    2438:	5601f31c 	bnel	s0,at,fffff0ac <_text_end+0x77ffdf2c>
    243c:	00009f22 	0x9f22
    2440:	00000000 	nop
    2444:	0b3c0000 	j	cf00000 <_data-0x73100000>
    2448:	0b448800 	j	d122000 <_data-0x72ede000>
    244c:	00018800 	sll	s1,at,0x0
    2450:	000b4454 	0xb4454
    2454:	000b5c88 	0xb5c88
    2458:	53000188 	beqzl	t8,2a7c <_data-0x7fffd584>
    245c:	00000000 	nop
	...
    246c:	00540001 	movf	zero,v0,$fcc5
    2470:	00000000 	nop
    2474:	01000000 	0x1000000
    2478:	00005200 	sll	t2,zero,0x8
	...
    2488:	00010000 	sll	zero,at,0x0
    248c:	00000054 	0x54
    2490:	00000000 	nop
    2494:	52000100 	beqzl	s0,2898 <_data-0x7fffd768>
    2498:	00000000 	nop
    249c:	00000000 	nop
    24a0:	00520001 	0x520001
	...
    24b0:	01000000 	0x1000000
    24b4:	00005400 	sll	t2,zero,0x10
    24b8:	00000000 	nop
    24bc:	00010000 	sll	zero,at,0x0
    24c0:	00000054 	0x54
	...
    24d0:	55000100 	bnezl	t0,28d4 <_data-0x7fffd72c>
    24d4:	00000000 	nop
    24d8:	00000000 	nop
    24dc:	00550001 	movt	zero,v0,$fcc5
	...
    24ec:	01000000 	0x1000000
    24f0:	00005600 	sll	t2,zero,0x18
    24f4:	00000000 	nop
    24f8:	00040000 	sll	zero,a0,0x0
    24fc:	9f5601f3 	0x9f5601f3
	...
    2508:	01f30006 	srlv	zero,s3,t7
    250c:	9f1c3156 	0x9f1c3156
	...
    2518:	01f30004 	sllv	zero,s3,t7
    251c:	00009f56 	0x9f56
	...
    252c:	00010000 	sll	zero,at,0x0
    2530:	00000054 	0x54
    2534:	00000000 	nop
    2538:	54000100 	bnezl	zero,293c <_data-0x7fffd6c4>
    253c:	00000000 	nop
	...
    254c:	00550001 	movt	zero,v0,$fcc5
    2550:	00000000 	nop
    2554:	01000000 	0x1000000
    2558:	00005500 	sll	t2,zero,0x14
	...
    2568:	00010000 	sll	zero,at,0x0
    256c:	00000054 	0x54
    2570:	00000000 	nop
    2574:	52000100 	beqzl	s0,2978 <_data-0x7fffd688>
    2578:	00000000 	nop
	...
    2588:	00550001 	movt	zero,v0,$fcc5
    258c:	00000000 	nop
    2590:	01000000 	0x1000000
    2594:	00005500 	sll	t2,zero,0x14
	...
    25a4:	00010000 	sll	zero,at,0x0
    25a8:	00000056 	0x56
    25ac:	00000000 	nop
    25b0:	f3000400 	0xf3000400
    25b4:	009f5601 	0x9f5601
    25b8:	00000000 	nop
    25bc:	0a000000 	j	8000000 <_data-0x78000000>
    25c0:	73007200 	0x73007200
    25c4:	01f31c00 	0x1f31c00
    25c8:	009f2256 	0x9f2256
	...
    25d8:	01000000 	0x1000000
    25dc:	00005400 	sll	t2,zero,0x10
    25e0:	00000000 	nop
    25e4:	00010000 	sll	zero,at,0x0
    25e8:	00000053 	mtlhx	zero
	...
    25f8:	54000100 	bnezl	zero,29fc <_data-0x7fffd604>
    25fc:	00000000 	nop
    2600:	00000000 	nop
    2604:	00520001 	0x520001
	...
    2614:	01000000 	0x1000000
    2618:	00005500 	sll	t2,zero,0x14
    261c:	00000000 	nop
    2620:	00010000 	sll	zero,at,0x0
    2624:	00000055 	0x55
	...
    2634:	54000100 	bnezl	zero,2a38 <_data-0x7fffd5c8>
    2638:	00000000 	nop
    263c:	00000000 	nop
    2640:	00530001 	0x530001
	...
    2650:	01000000 	0x1000000
    2654:	00005400 	sll	t2,zero,0x10
    2658:	00000000 	nop
    265c:	00060000 	sll	zero,a2,0x0
    2660:	00720074 	teq	v1,s2,0x1
    2664:	00009f22 	0x9f22
    2668:	00000000 	nop
    266c:	00080000 	sll	zero,t0,0x0
    2670:	00740072 	tlt	v1,s4,0x1
    2674:	9f012322 	0x9f012322
	...
    2680:	00720006 	srlv	zero,s2,v1
    2684:	9f220074 	0x9f220074
	...
    2698:	9f300002 	0x9f300002
	...
    26a4:	00520001 	0x520001
	...
    26b4:	01000000 	0x1000000
    26b8:	00005400 	sll	t2,zero,0x10
    26bc:	00000000 	nop
    26c0:	00010000 	sll	zero,at,0x0
    26c4:	00000053 	mtlhx	zero
	...
    26d4:	30000200 	andi	zero,zero,0x200
    26d8:	0000009f 	0x9f
    26dc:	00000000 	nop
    26e0:	52000100 	beqzl	s0,2ae4 <_data-0x7fffd51c>
    26e4:	00000000 	nop
    26e8:	00000000 	nop
    26ec:	88000bbc 	lwl	zero,3004(zero)
    26f0:	88000bcb 	lwl	zero,3019(zero)
    26f4:	cb540001 	lwc2	$20,1(k0)
    26f8:	ec88000b 	swc3	$8,11(a0)
    26fc:	0488000b 	tgei	a0,11
    2700:	5401f300 	bnel	zero,at,fffff304 <_text_end+0x77ffe184>
    2704:	0000009f 	0x9f
    2708:	00000000 	nop
    270c:	000b5c00 	sll	t3,t3,0x10
    2710:	000b7888 	0xb7888
    2714:	54000188 	bnezl	zero,2d38 <_data-0x7fffd2c8>
    2718:	88000b78 	lwl	zero,2936(zero)
    271c:	88000b8c 	lwl	zero,2956(zero)
    2720:	9c610001 	0x9c610001
    2724:	bc88000b 	cache	0x8,11(a0)
    2728:	0188000b 	movn	zero,t4,t0
    272c:	00006100 	sll	t4,zero,0x4
    2730:	00000000 	nop
    2734:	0b7c0000 	j	df00000 <_data-0x72100000>
    2738:	0b908800 	j	e422000 <_data-0x71bde000>
    273c:	00018800 	sll	s1,at,0x0
    2740:	000b9c60 	0xb9c60
    2744:	000bbc88 	0xbbc88
    2748:	60000188 	0x60000188
	...
    2754:	88000bec 	lwl	zero,3052(zero)
    2758:	88000bf8 	lwl	zero,3064(zero)
    275c:	f8540001 	sdc2	$20,1(v0)
    2760:	1088000b 	beq	a0,t0,2790 <_data-0x7fffd870>
    2764:	0188000c 	syscall	0x62000
    2768:	0c106000 	jal	418000 <_data-0x7fbe8000>
    276c:	0c188800 	jal	622000 <_data-0x7f9de000>
    2770:	00018800 	sll	s1,at,0x0
    2774:	00000052 	mflhxu	zero
	...
    2784:	9e000600 	0x9e000600
    2788:	f0f02004 	0xf0f02004
    278c:	000000bf 	0xbf
    2790:	00000000 	nop
    2794:	000c8400 	sll	s0,t4,0x10
    2798:	000c9088 	0xc9088
    279c:	54000188 	bnezl	zero,2dc0 <_data-0x7fffd240>
    27a0:	00000000 	nop
    27a4:	00000000 	nop
    27a8:	88000c84 	lwl	zero,3204(zero)
    27ac:	88000c90 	lwl	zero,3216(zero)
    27b0:	049e0006 	0x49e0006
    27b4:	bff0f010 	cache	0x10,-4080(ra)
	...
    27c0:	88000c70 	lwl	zero,3184(zero)
    27c4:	88000c7c 	lwl	zero,3196(zero)
    27c8:	00540001 	movf	zero,v0,$fcc5
    27cc:	00000000 	nop
    27d0:	70000000 	madd	zero,zero
    27d4:	7c88000c 	0x7c88000c
    27d8:	0688000c 	tgei	s4,12
    27dc:	00049e00 	sll	s3,a0,0x18
    27e0:	00bff0f0 	tge	a1,ra,0x3c3
	...
    27f0:	02000000 	0x2000000
    27f4:	009f3000 	0x9f3000
    27f8:	00000000 	nop
    27fc:	06000000 	bltz	s0,2800 <_data-0x7fffd800>
    2800:	08007400 	j	1d000 <_data-0x7ffe3000>
    2804:	009f1aff 	0x9f1aff
    2808:	00000000 	nop
    280c:	0e000000 	jal	8000000 <_data-0x78000000>
    2810:	08007500 	j	1d400 <_data-0x7ffe2c00>
    2814:	24381aff 	addiu	t8,at,6911
    2818:	ff080074 	sdc3	$8,116(t8)
    281c:	009f211a 	0x9f211a
    2820:	00000000 	nop
    2824:	01000000 	0x1000000
    2828:	00005400 	sll	t2,zero,0x10
    282c:	00000000 	nop
    2830:	000b0000 	sll	zero,t3,0x0
    2834:	ff080072 	sdc3	$8,114(t8)
    2838:	7424481a 	jalx	912068 <_data-0x7f6edf98>
    283c:	009f2100 	0x9f2100
    2840:	00000000 	nop
    2844:	64000000 	0x64000000
    2848:	6888000c 	0x6888000c
    284c:	0188000c 	syscall	0x62000
    2850:	00005400 	sll	t2,zero,0x10
    2854:	00000000 	nop
    2858:	0c640000 	jal	1900000 <_data-0x7e700000>
    285c:	0c688800 	jal	1a22000 <_data-0x7e5de000>
    2860:	00068800 	sll	s1,a2,0x0
    2864:	3000049e 	andi	zero,zero,0x49e
    2868:	0000bfd0 	0xbfd0
    286c:	00000000 	nop
    2870:	0c180000 	jal	600000 <_data-0x7fa00000>
    2874:	0c248800 	jal	922000 <_data-0x7f6de000>
    2878:	00038800 	sll	s1,v1,0x0
    287c:	009f8109 	0x9f8109
    2880:	00000000 	nop
    2884:	18000000 	blez	zero,2888 <_data-0x7fffd778>
    2888:	2488000c 	addiu	t0,a0,12
    288c:	0688000c 	tgei	s4,12
    2890:	08049e00 	j	127800 <_data-0x7fed8800>
    2894:	00bfd030 	tge	a1,ra,0x340
    2898:	00000000 	nop
    289c:	24000000 	li	zero,0
    28a0:	2c88000c 	sltiu	t0,a0,12
    28a4:	0388000c 	syscall	0xe2000
    28a8:	9f800900 	0x9f800900
	...
    28b4:	88000c24 	lwl	zero,3108(zero)
    28b8:	88000c2c 	lwl	zero,3116(zero)
    28bc:	049e0006 	0x49e0006
    28c0:	bfd0300c 	cache	0x10,12300(s8)
	...
    28cc:	88000c2c 	lwl	zero,3116(zero)
    28d0:	88000c34 	lwl	zero,3124(zero)
    28d4:	36080003 	ori	t0,s0,0x3
    28d8:	0000009f 	0x9f
    28dc:	00000000 	nop
    28e0:	000c2c00 	sll	a1,t4,0x10
    28e4:	000c3488 	0xc3488
    28e8:	9e000688 	0x9e000688
    28ec:	d0300004 	0xd0300004
    28f0:	000000bf 	0xbf
    28f4:	00000000 	nop
    28f8:	000c3c00 	sll	a3,t4,0x10
    28fc:	000c4088 	0xc4088
    2900:	33000288 	andi	zero,t8,0x288
    2904:	0000009f 	0x9f
    2908:	00000000 	nop
    290c:	000c3c00 	sll	a3,t4,0x10
    2910:	000c4088 	0xc4088
    2914:	9e000688 	0x9e000688
    2918:	d0300c04 	0xd0300c04
    291c:	000000bf 	0xbf
    2920:	00000000 	nop
    2924:	000c3400 	sll	a2,t4,0x10
    2928:	000c3c88 	0xc3c88
    292c:	30000288 	andi	zero,zero,0x288
    2930:	0000009f 	0x9f
    2934:	00000000 	nop
    2938:	000c3400 	sll	a2,t4,0x10
    293c:	000c3c88 	0xc3c88
    2940:	9e000688 	0x9e000688
    2944:	d0300404 	0xd0300404
    2948:	000000bf 	0xbf
    294c:	00000000 	nop
    2950:	000c4000 	sll	t0,t4,0x0
    2954:	000c4488 	0xc4488
    2958:	30000288 	andi	zero,zero,0x288
    295c:	0000009f 	0x9f
    2960:	00000000 	nop
    2964:	000c4000 	sll	t0,t4,0x0
    2968:	000c4488 	0xc4488
    296c:	9e000688 	0x9e000688
    2970:	d0301004 	0xd0301004
    2974:	000000bf 	0xbf
    2978:	00000000 	nop
    297c:	000c4400 	sll	t0,t4,0x10
    2980:	000c4888 	0xc4888
    2984:	30000288 	andi	zero,zero,0x288
    2988:	0000009f 	0x9f
    298c:	00000000 	nop
    2990:	000c4400 	sll	t0,t4,0x10
    2994:	000c4888 	0xc4888
    2998:	9e000688 	0x9e000688
    299c:	d0300404 	0xd0300404
    29a0:	000000bf 	0xbf
	...
    29b0:	55000100 	bnezl	t0,2db4 <_data-0x7fffd24c>
    29b4:	00000000 	nop
	...
    29c4:	00540001 	movf	zero,v0,$fcc5
	...
    29d4:	01000000 	0x1000000
    29d8:	00005400 	sll	t2,zero,0x10
	...
    29e8:	00010000 	sll	zero,at,0x0
    29ec:	00000054 	0x54
	...
    29fc:	55000100 	bnezl	t0,2e00 <_data-0x7fffd200>
    2a00:	00000000 	nop
	...
    2a10:	00540001 	movf	zero,v0,$fcc5
	...
    2a20:	01000000 	0x1000000
    2a24:	00005500 	sll	t2,zero,0x14
	...
    2a34:	00010000 	sll	zero,at,0x0
    2a38:	00000054 	0x54
	...
    2a48:	55000100 	bnezl	t0,2e4c <_data-0x7fffd1b4>
    2a4c:	00000000 	nop
	...
    2a5c:	00540001 	movf	zero,v0,$fcc5
    2a60:	00000000 	nop
    2a64:	Address 0x0000000000002a64 is out of bounds.


Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	00000034 	teq	zero,zero
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
  1c:	00000070 	tge	zero,zero,0x1
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	880002e8 	lwl	zero,744(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	00000048 	0x48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	88000330 	lwl	zero,816(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	00000290 	0x290
	...
  38:	0000001c 	0x1c
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	3f540002 	0x3f540002
  40:	00040000 	sll	zero,a0,0x0
  44:	00000000 	nop
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	88000000 	lwl	zero,0(zero)
  4c:	00000250 	0x250
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  58:	00000044 	0x44
  5c:	3f7a0002 	0x3f7a0002
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00040000 	sll	zero,a0,0x0
  64:	00000000 	nop
  68:	880005c0 	lwl	zero,1472(zero)
  6c:	000000c8 	0xc8
  70:	00000000 	nop
  74:	0000000c 	syscall
  78:	00000000 	nop
  7c:	0000000c 	syscall
  80:	88000688 	lwl	zero,1672(zero)
  84:	00000098 	0x98
  88:	88000720 	lwl	zero,1824(zero)
  8c:	00000068 	0x68
  90:	88000788 	lwl	zero,1928(zero)
  94:	000000b4 	teq	zero,zero,0x2
	...
  a0:	0000001c 	0x1c
  a4:	44ea0002 	0x44ea0002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	8800083c 	lwl	zero,2108(zero)
  b4:	00000224 	0x224
	...
  c0:	0000001c 	0x1c
  c4:	46b00002 	c1	0xb00002
  c8:	00040000 	sll	zero,a0,0x0
  cc:	00000000 	nop
  d0:	88000a60 	lwl	zero,2656(zero)
  d4:	000000d8 	0xd8
	...
  e0:	0000007c 	0x7c
  e4:	47fe0002 	c1	0x1fe0002
  e8:	00040000 	sll	zero,a0,0x0
	...
  f4:	00000020 	add	zero,zero,zero
  f8:	00000000 	nop
  fc:	00000028 	0x28
 100:	00000000 	nop
 104:	00000024 	and	zero,zero,zero
 108:	00000000 	nop
 10c:	00000034 	teq	zero,zero
 110:	00000000 	nop
 114:	00000030 	tge	zero,zero
 118:	00000000 	nop
 11c:	00000044 	0x44
 120:	00000000 	nop
 124:	0000002c 	0x2c
 128:	00000000 	nop
 12c:	00000028 	0x28
 130:	88000b38 	lwl	zero,2872(zero)
 134:	00000024 	and	zero,zero,zero
 138:	00000000 	nop
 13c:	0000002c 	0x2c
 140:	00000000 	nop
 144:	00000070 	tge	zero,zero,0x1
 148:	00000000 	nop
 14c:	00000040 	ssnop
 150:	00000000 	nop
 154:	0000000c 	syscall
	...
 160:	00000024 	and	zero,zero,zero
 164:	4c180002 	mfc3	t8,$0,2
 168:	00040000 	sll	zero,a0,0x0
 16c:	00000000 	nop
 170:	88000b5c 	lwl	zero,2908(zero)
 174:	00000060 	0x60
 178:	88000bbc 	lwl	zero,3004(zero)
 17c:	00000030 	tge	zero,zero
	...
 188:	0000001c 	0x1c
 18c:	4d680002 	0x4d680002
 190:	00040000 	sll	zero,a0,0x0
 194:	00000000 	nop
 198:	88000bec 	lwl	zero,3052(zero)
 19c:	0000002c 	0x2c
	...
 1a8:	0000008c 	syscall	0x2
 1ac:	4e1e0002 	c3	0x1e0002
 1b0:	00040000 	sll	zero,a0,0x0
	...
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
 1f0:	00000000 	nop
 1f4:	0000000c 	syscall
 1f8:	88000c18 	lwl	zero,3096(zero)
 1fc:	00000038 	0x38
 200:	00000000 	nop
 204:	00000020 	add	zero,zero,zero
 208:	88000c50 	lwl	zero,3152(zero)
 20c:	00000020 	add	zero,zero,zero
 210:	00000000 	nop
 214:	00000048 	0x48
 218:	88000c70 	lwl	zero,3184(zero)
 21c:	00000014 	0x14
 220:	88000c84 	lwl	zero,3204(zero)
 224:	00000014 	0x14
 228:	00000000 	nop
 22c:	00000014 	0x14
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	88000334 	lwl	zero,820(zero)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	88000338 	lwl	zero,824(zero)
   8:	8800034c 	lwl	zero,844(zero)
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	880003b4 	lwl	zero,948(zero)
	...
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	880003bc 	lwl	zero,956(zero)
  1c:	880003c0 	lwl	zero,960(zero)
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	880003c8 	lwl	zero,968(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	880003cc 	lwl	zero,972(zero)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  30:	880003c0 	lwl	zero,960(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	880003c4 	lwl	zero,964(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	880003d8 	lwl	zero,984(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	880003e4 	lwl	zero,996(zero)
	...
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	880003c4 	lwl	zero,964(zero)
  4c:	880003c8 	lwl	zero,968(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	88000514 	lwl	zero,1300(zero)
  54:	8800051c 	lwl	zero,1308(zero)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	880004f0 	lwl	zero,1264(zero)
  64:	8800050c 	lwl	zero,1292(zero)
  68:	880005a8 	lwl	zero,1448(zero)
  6c:	880005c0 	lwl	zero,1472(zero)
	...
  78:	88000250 	lwl	zero,592(zero)
  7c:	88000278 	lwl	zero,632(zero)
  80:	88000278 	lwl	zero,632(zero)
  84:	880002e8 	lwl	zero,744(zero)
  88:	880002e8 	lwl	zero,744(zero)
  8c:	88000330 	lwl	zero,816(zero)
  90:	88000330 	lwl	zero,816(zero)
  94:	880005c0 	lwl	zero,1472(zero)
	...
  a0:	88000690 	lwl	zero,1680(zero)
  a4:	88000694 	lwl	zero,1684(zero)
  a8:	880006b0 	lwl	zero,1712(zero)
  ac:	880006d8 	lwl	zero,1752(zero)
	...
  b8:	88000728 	lwl	zero,1832(zero)
  bc:	8800072c 	lwl	zero,1836(zero)
  c0:	8800073c 	lwl	zero,1852(zero)
  c4:	88000774 	lwl	zero,1908(zero)
	...
  d0:	88000728 	lwl	zero,1832(zero)
  d4:	8800072c 	lwl	zero,1836(zero)
  d8:	8800073c 	lwl	zero,1852(zero)
  dc:	88000740 	lwl	zero,1856(zero)
  e0:	88000744 	lwl	zero,1860(zero)
  e4:	8800076c 	lwl	zero,1900(zero)
	...
  f0:	880005c0 	lwl	zero,1472(zero)
  f4:	88000688 	lwl	zero,1672(zero)
  f8:	00000001 	movf	zero,zero,$fcc0
  fc:	00000001 	movf	zero,zero,$fcc0
 100:	00000001 	movf	zero,zero,$fcc0
 104:	00000001 	movf	zero,zero,$fcc0
 108:	88000688 	lwl	zero,1672(zero)
 10c:	88000720 	lwl	zero,1824(zero)
 110:	88000720 	lwl	zero,1824(zero)
 114:	88000788 	lwl	zero,1928(zero)
 118:	88000788 	lwl	zero,1928(zero)
 11c:	8800083c 	lwl	zero,2108(zero)
	...
 128:	88000874 	lwl	zero,2164(zero)
 12c:	88000878 	lwl	zero,2168(zero)
 130:	880008fc 	lwl	zero,2300(zero)
 134:	8800090c 	lwl	zero,2316(zero)
 138:	88000a48 	lwl	zero,2632(zero)
 13c:	88000a58 	lwl	zero,2648(zero)
	...
 148:	880008f8 	lwl	zero,2296(zero)
 14c:	880008fc 	lwl	zero,2300(zero)
 150:	88000924 	lwl	zero,2340(zero)
 154:	8800092c 	lwl	zero,2348(zero)
 158:	88000980 	lwl	zero,2432(zero)
 15c:	88000990 	lwl	zero,2448(zero)
 160:	8800099c 	lwl	zero,2460(zero)
 164:	880009ac 	lwl	zero,2476(zero)
 168:	880009b4 	lwl	zero,2484(zero)
 16c:	880009f0 	lwl	zero,2544(zero)
 170:	880009f8 	lwl	zero,2552(zero)
 174:	880009fc 	lwl	zero,2556(zero)
 178:	88000a04 	lwl	zero,2564(zero)
 17c:	88000a0c 	lwl	zero,2572(zero)
 180:	88000a14 	lwl	zero,2580(zero)
 184:	88000a18 	lwl	zero,2584(zero)
 188:	88000a1c 	lwl	zero,2588(zero)
 18c:	88000a40 	lwl	zero,2624(zero)
	...
 198:	8800083c 	lwl	zero,2108(zero)
 19c:	88000a60 	lwl	zero,2656(zero)
	...
 1a8:	88000a60 	lwl	zero,2656(zero)
 1ac:	88000b38 	lwl	zero,2872(zero)
	...
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
 1e8:	00000001 	movf	zero,zero,$fcc0
 1ec:	00000001 	movf	zero,zero,$fcc0
 1f0:	00000001 	movf	zero,zero,$fcc0
 1f4:	00000001 	movf	zero,zero,$fcc0
 1f8:	88000b38 	lwl	zero,2872(zero)
 1fc:	88000b5c 	lwl	zero,2908(zero)
 200:	00000001 	movf	zero,zero,$fcc0
 204:	00000001 	movf	zero,zero,$fcc0
 208:	00000001 	movf	zero,zero,$fcc0
 20c:	00000001 	movf	zero,zero,$fcc0
 210:	00000001 	movf	zero,zero,$fcc0
 214:	00000001 	movf	zero,zero,$fcc0
 218:	00000001 	movf	zero,zero,$fcc0
 21c:	00000001 	movf	zero,zero,$fcc0
	...
 228:	88000b74 	lwl	zero,2932(zero)
 22c:	88000b78 	lwl	zero,2936(zero)
 230:	88000b9c 	lwl	zero,2972(zero)
 234:	88000bb4 	lwl	zero,2996(zero)
	...
 240:	88000b5c 	lwl	zero,2908(zero)
 244:	88000bbc 	lwl	zero,3004(zero)
 248:	88000bbc 	lwl	zero,3004(zero)
 24c:	88000bec 	lwl	zero,3052(zero)
	...
 258:	88000bec 	lwl	zero,3052(zero)
 25c:	88000c18 	lwl	zero,3096(zero)
	...
 268:	88000c34 	lwl	zero,3124(zero)
 26c:	88000c38 	lwl	zero,3128(zero)
 270:	88000c3c 	lwl	zero,3132(zero)
 274:	88000c40 	lwl	zero,3136(zero)
	...
 280:	00000001 	movf	zero,zero,$fcc0
 284:	00000001 	movf	zero,zero,$fcc0
 288:	00000001 	movf	zero,zero,$fcc0
 28c:	00000001 	movf	zero,zero,$fcc0
 290:	00000001 	movf	zero,zero,$fcc0
 294:	00000001 	movf	zero,zero,$fcc0
 298:	00000001 	movf	zero,zero,$fcc0
 29c:	00000001 	movf	zero,zero,$fcc0
 2a0:	00000001 	movf	zero,zero,$fcc0
 2a4:	00000001 	movf	zero,zero,$fcc0
 2a8:	00000001 	movf	zero,zero,$fcc0
 2ac:	00000001 	movf	zero,zero,$fcc0
 2b0:	00000001 	movf	zero,zero,$fcc0
 2b4:	00000001 	movf	zero,zero,$fcc0
 2b8:	00000001 	movf	zero,zero,$fcc0
 2bc:	00000001 	movf	zero,zero,$fcc0
 2c0:	88000c18 	lwl	zero,3096(zero)
 2c4:	88000c50 	lwl	zero,3152(zero)
 2c8:	00000001 	movf	zero,zero,$fcc0
 2cc:	00000001 	movf	zero,zero,$fcc0
 2d0:	88000c50 	lwl	zero,3152(zero)
 2d4:	88000c70 	lwl	zero,3184(zero)
 2d8:	00000001 	movf	zero,zero,$fcc0
 2dc:	00000001 	movf	zero,zero,$fcc0
 2e0:	88000c70 	lwl	zero,3184(zero)
 2e4:	88000c84 	lwl	zero,3204(zero)
 2e8:	88000c84 	lwl	zero,3204(zero)
 2ec:	88000c98 	lwl	zero,3224(zero)
 2f0:	00000001 	movf	zero,zero,$fcc0
 2f4:	00000001 	movf	zero,zero,$fcc0
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	0000013a 	0x13a
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	00450002 	0x450002
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
  38:	735f7473 	0x735f7473
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	61697265 	0x61697265
  40:	70675f6c 	0x70675f6c
  44:	632e6f69 	0x632e6f69
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	00007070 	tge	zero,zero,0x1c1
  4c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	02500205 	0x2500205
  54:	13038800 	beq	t8,v1,fffe2058 <_text_end+0x77fe0ed8>
  58:	3d081401 	0x3d081401
  5c:	01040200 	0x1040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	4b068206 	c2	0x1068206
  64:	01000802 	0x1000802
  68:	02050001 	movt	zero,s0,$fcc1
  6c:	88000278 	lwl	zero,632(zero)
  70:	bb013503 	swr	at,13571(t8)
  74:	bb838349 	swr	v1,-31927(gp)
  78:	0200834c 	syscall	0x8020d
  7c:	ba060104 	swr	a2,260(s0)
  80:	04040200 	0x4040200
  84:	02004b06 	0x2004b06
  88:	887e0404 	lwl	s8,1028(v1)
  8c:	01001802 	0x1001802
  90:	02050001 	movt	zero,s0,$fcc1
  94:	880002e8 	lwl	zero,744(zero)
  98:	0100c203 	0x100c203
  9c:	b8848113 	swr	a0,-32493(a0)
  a0:	4c48bd4c 	0x4c48bd4c
  a4:	00100248 	0x100248
  a8:	02040101 	0x2040101
  ac:	30020500 	andi	v0,zero,0x500
  b0:	15880003 	bne	t4,t0,c0 <_data-0x7fffff40>
  b4:	e5030104 	swc1	$f3,260(t0)
  b8:	02044a00 	0x2044a00
  bc:	4a7f9b03 	c2	0x7f9b03
  c0:	e5030104 	swc1	$f3,260(t0)
  c4:	023c0800 	0x23c0800
  c8:	02041960 	0x2041960
  cc:	827f9703 	lb	ra,-26877(s3)
  d0:	fe030104 	sdc3	$3,260(s0)
  d4:	03508200 	0x3508200
  d8:	034a7f92 	0x34a7f92
  dc:	044a00e8 	tlti	v0,232
  e0:	7f850302 	0x7f850302
  e4:	0104844a 	0x104844a
  e8:	4a00ff03 	c2	0xff03
  ec:	02ba5e03 	0x2ba5e03
  f0:	031901b0 	tge	t8,t9,0x6
  f4:	02048215 	0x2048215
  f8:	4a7f8903 	c2	0x7f8903
  fc:	db030104 	ldc2	$3,260(t8)
 100:	40028200 	0x40028200
 104:	825d0319 	lb	sp,793(s2)
 108:	044c8383 	teqi	v0,-31869
 10c:	82400302 	lb	zero,770(s2)
 110:	0c030104 	jal	c0410 <_data-0x7ff3fbf0>
 114:	03020482 	0x3020482
 118:	01048277 	0x1048277
 11c:	8200d503 	lb	zero,-11005(s0)
 120:	03195002 	0x3195002
 124:	88827fad 	lwl	v0,32685(a0)
 128:	03020483 	0x3020483
 12c:	03834a73 	tltu	gp,v1,0x129
 130:	0104826c 	0x104826c
 134:	8200cc03 	lb	zero,-13309(s0)
 138:	00100285 	0x100285
 13c:	008e0101 	0x8e0101
 140:	00020000 	sll	zero,v0,0x0
 144:	00000028 	0x28
 148:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 14c:	0101000d 	break	0x101
 150:	00000101 	0x101
 154:	00000100 	sll	zero,zero,0x4
 158:	69747501 	0x69747501
 15c:	7974696c 	0x7974696c
 160:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 164:	75747261 	jalx	5d1c984 <_data-0x7a2e367c>
 168:	00532e70 	tge	v0,s3,0xb9
 16c:	00000001 	movf	zero,zero,$fcc0
 170:	00020500 	sll	zero,v0,0x14
 174:	19880000 	0x19880000
 178:	4b4f4b83 	c2	0x14f4b83
 17c:	834d4b4e 	lb	t5,19278(k0)
 180:	4b4d4b85 	c2	0x14d4b85
 184:	4b834c4d 	c2	0x1834c4d
 188:	4b4b4d83 	c2	0x14b4d83
 18c:	834d4b4b 	lb	t5,19275(k0)
 190:	034b4b4b 	0x34b4b4b
 194:	01fc0212 	0x1fc0212
 198:	834b4c01 	lb	t3,19457(k0)
 19c:	4b4b4b4d 	c2	0x14b4b4d
 1a0:	4b4b4b4b 	c2	0x14b4b4b
 1a4:	4b4b4b4b 	c2	0x14b4b4b
 1a8:	4b4b4b4b 	c2	0x14b4b4b
 1ac:	4b4b4b4b 	c2	0x14b4b4b
 1b0:	4b4b4b4b 	c2	0x14b4b4b
 1b4:	4b4b4b4b 	c2	0x14b4b4b
 1b8:	4c4b4b4b 	0x4c4b4b4b
 1bc:	4b4b4b4b 	c2	0x14b4b4b
 1c0:	4b4b4b4b 	c2	0x14b4b4b
 1c4:	4c4b4c4b 	0x4c4b4c4b
 1c8:	024b4b4b 	0x24b4b4b
 1cc:	01010004 	sllv	zero,at,t0
 1d0:	00000159 	0x159
 1d4:	00870002 	0x870002
 1d8:	01010000 	0x1010000
 1dc:	000d0efb 	0xd0efb
 1e0:	01010101 	0x1010101
 1e4:	01000000 	0x1000000
 1e8:	75010000 	jalx	4040000 <_data-0x7bfc0000>
 1ec:	696c6974 	0x696c6974
 1f0:	69007974 	0x69007974
 1f4:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 1f8:	00006564 	0x6564
 1fc:	6e69616d 	0x6e69616d
 200:	0100632e 	0x100632e
 204:	6f630000 	0x6f630000
 208:	6e6f6d6d 	0x6e6f6d6d
 20c:	0200682e 	0x200682e
 210:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 214:	746e6964 	jalx	1b9a590 <_data-0x7e465a70>
 218:	0200682e 	0x200682e
 21c:	616d0000 	0x616d0000
 220:	6e696863 	0x6e696863
 224:	00682e65 	0x682e65
 228:	65000002 	0x65000002
 22c:	70656378 	0x70656378
 230:	6e6f6974 	0x6e6f6974
 234:	0200682e 	0x200682e
 238:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 23c:	2e6f6964 	sltiu	t7,s3,26980
 240:	00020068 	0x20068
 244:	72747300 	0x72747300
 248:	2e676e69 	sltiu	a3,s3,28265
 24c:	00020068 	0x20068
 250:	6f6f6200 	0x6f6f6200
 254:	72747374 	0x72747374
 258:	682e7061 	0x682e7061
 25c:	00000200 	sll	zero,zero,0x8
 260:	02050000 	0x2050000
 264:	880005c0 	lwl	zero,1472(zero)
 268:	bc010a03 	cache	0x1,2563(zero)
 26c:	45c18484 	0x45c18484
 270:	454f454f 	0x454f454f
 274:	83864787 	lb	a2,18311(gp)
 278:	8385f5f3 	lb	a1,-2573(gp)
 27c:	b7b8c183 	0xb7b8c183
 280:	000802bf 	0x802bf
 284:	05000101 	bltz	t0,68c <_data-0x7ffff974>
 288:	00000002 	srl	zero,zero,0x0
 28c:	012b0300 	0x12b0300
 290:	08024f14 	j	93c50 <_data-0x7ff6c3b0>
 294:	00010100 	sll	zero,at,0x4
 298:	00000205 	0x205
 29c:	34030000 	li	v1,0x0
 2a0:	024f1401 	0x24f1401
 2a4:	01010008 	0x1010008
 2a8:	88020500 	lwl	v0,1280(zero)
 2ac:	03880006 	srlv	zero,t0,gp
 2b0:	4884013d 	0x4884013d
 2b4:	4b833c08 	c2	0x1833c08
 2b8:	04020049 	bltzl	zero,3e0 <_data-0x7ffffc20>
 2bc:	02004b03 	0x2004b03
 2c0:	3b080304 	xori	t0,t8,0x304
 2c4:	13280285 	beq	t9,t0,cdc <_data-0x7ffff324>
 2c8:	01002002 	0x1002002
 2cc:	02050001 	movt	zero,s0,$fcc1
 2d0:	88000720 	lwl	zero,1824(zero)
 2d4:	0100c403 	0x100c403
 2d8:	03820c03 	0x3820c03
 2dc:	03ba4a74 	teq	sp,k0,0x129
 2e0:	75034a0c 	jalx	40d2830 <_data-0x7bf2d7d0>
 2e4:	0402004a 	bltzl	zero,410 <_data-0x7ffffbf0>
 2e8:	02004c03 	0x2004c03
 2ec:	09030304 	j	40c0c10 <_data-0x7bf3f3f0>
 2f0:	02003c08 	0x2003c08
 2f4:	75030304 	jalx	40c0c10 <_data-0x7bf3f3f0>
 2f8:	0d033c08 	jal	40cf020 <_data-0x7bf30fe0>
 2fc:	00140282 	srl	zero,s4,0xa
 300:	05000101 	bltz	t0,708 <_data-0x7ffff8f8>
 304:	00078802 	srl	s1,a3,0x0
 308:	00d40388 	0xd40388
 30c:	4b49bb01 	c2	0x149bb01
 310:	83834b49 	lb	v1,19273(gp)
 314:	8483c1bb 	lh	v1,-15941(a0)
 318:	f25503b9 	0xf25503b9
 31c:	844a2403 	lh	t2,9219(v0)
 320:	74085103 	jalx	21440c <_data-0x7fdebbf4>
 324:	bb4a2f03 	swr	t2,12035(k0)
 328:	01001002 	0x1001002
 32c:	0000aa01 	0xaa01
 330:	1f000200 	bgtz	t8,b34 <_data-0x7ffff4cc>
 334:	01000000 	0x1000000
 338:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 33c:	01010100 	0x1010100
 340:	00000001 	movf	zero,zero,$fcc0
 344:	01000001 	movf	zero,t0,$fcc0
 348:	69727000 	0x69727000
 34c:	2e66746e 	sltiu	a2,s3,29806
 350:	00000063 	0x63
 354:	05000000 	bltz	t0,358 <_data-0x7ffffca8>
 358:	00083c02 	srl	a3,t0,0x10
 35c:	03881388 	0x3881388
 360:	3c084a7a 	lui	t0,0x4a7a
 364:	c5034cf8 	lwc1	$f3,19704(t0)
 368:	02004a00 	0x2004a00
 36c:	bb030104 	swr	v1,260(t8)
 370:	cb034a7f 	lwc2	$3,19071(t8)
 374:	b803f200 	swr	v1,-3584(zero)
 378:	0124027f 	0x124027f
 37c:	02380386 	0x2380386
 380:	03520144 	0x3520144
 384:	7c08f240 	0x7c08f240
 388:	82770383 	lb	s7,899(s3)
 38c:	28021c03 	slti	v0,zero,7171
 390:	82640301 	lb	a0,769(s3)
 394:	4b88af08 	c2	0x188af08
 398:	02040200 	0x2040200
 39c:	034a6f03 	0x34a6f03
 3a0:	1403ba14 	bne	zero,v1,fffeebf4 <_text_end+0x77feda74>
 3a4:	82680382 	lb	t0,898(s3)
 3a8:	03820903 	0x3820903
 3ac:	03bd8215 	0x3bd8215
 3b0:	4cf3826d 	0x4cf3826d
 3b4:	03bfc089 	0x3bfc089
 3b8:	2603825e 	addiu	v1,s0,-32162
 3bc:	04020082 	bltzl	zero,5c8 <_data-0x7ffffa38>
 3c0:	4a4e0301 	c2	0x4e0301
 3c4:	01040200 	0x1040200
 3c8:	004a3403 	0x4a3403
 3cc:	08030402 	j	c1008 <_data-0x7ff3eff8>
 3d0:	f20b03ad 	0xf20b03ad
 3d4:	08028383 	j	a0e0c <_data-0x7ff5f1f4>
 3d8:	76010100 	jalx	8040400 <_data-0x77fbfc00>
 3dc:	02000000 	0x2000000
 3e0:	00002200 	sll	a0,zero,0x8
 3e4:	fb010100 	sdc2	$1,256(t8)
 3e8:	01000d0e 	0x1000d0e
 3ec:	00010101 	0x10101
 3f0:	00010000 	sll	zero,at,0x0
 3f4:	70000100 	0x70000100
 3f8:	746e6972 	jalx	1b9a5c8 <_data-0x7e465a38>
 3fc:	65736162 	0x65736162
 400:	0000632e 	0x632e
 404:	00000000 	nop
 408:	0a600205 	j	9800814 <_data-0x767ff7ec>
 40c:	08138800 	j	4e2000 <_data-0x7fb1e000>
 410:	02004fac 	0x2004fac
 414:	82060104 	lb	a2,260(s0)
 418:	004b8406 	0x4b8406
 41c:	03010402 	0x3010402
 420:	0200ba78 	0x200ba78
 424:	0c030104 	jal	c0410 <_data-0x7ff3fbf0>
 428:	02008a4a 	0x2008a4a
 42c:	ba060204 	swr	a2,516(s0)
 430:	70038806 	0x70038806
 434:	00012402 	srl	a0,at,0x10
 438:	08030402 	j	c1008 <_data-0x7ff3eff8>
 43c:	02008ab0 	tge	s0,zero,0x22a
 440:	82060104 	lb	a2,260(s0)
 444:	01040200 	0x1040200
 448:	02008306 	0x2008306
 44c:	f2060404 	0xf2060404
 450:	01001002 	0x1001002
 454:	00017901 	0x17901
 458:	36000200 	ori	zero,s0,0x200
 45c:	01000000 	0x1000000
 460:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 464:	01010100 	0x1010100
 468:	00000001 	movf	zero,zero,$fcc0
 46c:	01000001 	movf	zero,t0,$fcc0
 470:	692f2e2e 	0x692f2e2e
 474:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 478:	00006564 	0x6564
 47c:	69727473 	0x69727473
 480:	632e676e 	0x632e676e
 484:	00000000 	nop
 488:	6d6d6f63 	0x6d6d6f63
 48c:	682e6e6f 	0x682e6e6f
 490:	00000100 	sll	zero,zero,0x4
 494:	02050000 	0x2050000
 498:	00000000 	nop
 49c:	14010b03 	bne	zero,at,30ac <_data-0x7fffcf54>
 4a0:	08027808 	j	9e020 <_data-0x7ff61fe0>
 4a4:	00010100 	sll	zero,at,0x4
 4a8:	00000205 	0x205
 4ac:	21030000 	addi	v1,t0,0
 4b0:	004b1301 	0x4b1301
 4b4:	06010402 	bgez	s0,14c0 <_data-0x7fffeb40>
 4b8:	7fbe0682 	0x7fbe0682
 4bc:	01000802 	0x1000802
 4c0:	02050001 	movt	zero,s0,$fcc1
 4c4:	00000000 	nop
 4c8:	01013603 	0x1013603
 4cc:	0402004e 	bltzl	zero,608 <_data-0x7ffff9f8>
 4d0:	40084b01 	0x40084b01
 4d4:	01000802 	0x1000802
 4d8:	02050001 	movt	zero,s0,$fcc1
 4dc:	00000000 	nop
 4e0:	0100cc03 	0x100cc03
 4e4:	894b8301 	lwl	t3,-31999(t2)
 4e8:	bb827a03 	swr	v0,31235(gp)
 4ec:	0008024c 	syscall	0x2009
 4f0:	05000101 	bltz	t0,8f8 <_data-0x7ffff708>
 4f4:	00000002 	srl	zero,zero,0x0
 4f8:	00e70300 	0xe70300
 4fc:	02001601 	0x2001601
 500:	ba060104 	swr	a2,260(s0)
 504:	7e84bd06 	0x7e84bd06
 508:	01000802 	0x1000802
 50c:	02050001 	movt	zero,s0,$fcc1
 510:	00000000 	nop
 514:	0100fe03 	0x100fe03
 518:	0402004b 	bltzl	zero,648 <_data-0x7ffff9b8>
 51c:	00820601 	0x820601
 520:	ba020402 	swr	v0,1026(s0)
 524:	7f83bd06 	0x7f83bd06
 528:	00080284 	0x80284
 52c:	05000101 	bltz	t0,934 <_data-0x7ffff6cc>
 530:	00000002 	srl	zero,zero,0x0
 534:	018e0300 	0x18e0300
 538:	4bf81301 	c2	0x1f81301
 53c:	85827a03 	lh	v0,31235(t4)
 540:	01000802 	0x1000802
 544:	02050001 	movt	zero,s0,$fcc1
 548:	00000000 	nop
 54c:	0101a203 	0x101a203
 550:	7a03f913 	0x7a03f913
 554:	08028582 	j	a1608 <_data-0x7ff5e9f8>
 558:	00010100 	sll	zero,at,0x4
 55c:	0b380205 	j	ce00814 <_data-0x731ff7ec>
 560:	90038800 	lbu	v1,-30720(zero)
 564:	86010102 	lh	at,258(s0)
 568:	027e874b 	0x27e874b
 56c:	01010008 	0x1010008
 570:	00020500 	sll	zero,v0,0x14
 574:	03000000 	0x3000000
 578:	010102ab 	0x10102ab
 57c:	7e874b87 	0x7e874b87
 580:	01001002 	0x1001002
 584:	02050001 	movt	zero,s0,$fcc1
 588:	00000000 	nop
 58c:	0102c203 	0x102c203
 590:	4a7a0318 	c2	0x7a0318
 594:	884e8450 	lwl	t6,-31664(v0)
 598:	01040200 	0x1040200
 59c:	f3827403 	0xf3827403
 5a0:	f63d0883 	sdc1	$f29,2179(s1)
 5a4:	01001002 	0x1001002
 5a8:	02050001 	movt	zero,s0,$fcc1
 5ac:	00000000 	nop
 5b0:	0102e503 	0x102e503
 5b4:	7a03894d 	0x7a03894d
 5b8:	f43d0882 	sdc1	$f29,2178(at)
 5bc:	01000802 	0x1000802
 5c0:	02050001 	movt	zero,s0,$fcc1
 5c4:	00000000 	nop
 5c8:	0102f103 	0x102f103
 5cc:	000c0213 	0xc0213
 5d0:	004f0101 	0x4f0101
 5d4:	00020000 	sll	zero,v0,0x0
 5d8:	0000001d 	0x1d
 5dc:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 5e0:	0101000d 	break	0x101
 5e4:	00000101 	0x101
 5e8:	00000100 	sll	zero,zero,0x4
 5ec:	75700001 	jalx	5c00004 <_data-0x7a3ffffc>
 5f0:	632e7374 	0x632e7374
 5f4:	00000000 	nop
 5f8:	02050000 	0x2050000
 5fc:	88000b5c 	lwl	zero,2908(zero)
 600:	4e3c0813 	c3	0x3c0813
 604:	7a03c248 	0x7a03c248
 608:	83837408 	lb	v1,29704(gp)
 60c:	00080283 	sra	zero,t0,0xa
 610:	05000101 	bltz	t0,a18 <_data-0x7ffff5e8>
 614:	000bbc02 	srl	s7,t3,0x10
 618:	010e0388 	0x10e0388
 61c:	84838383 	lh	v1,-31869(a0)
 620:	01001002 	0x1001002
 624:	00005901 	0x5901
 628:	44000200 	0x44000200
 62c:	01000000 	0x1000000
 630:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 634:	01010100 	0x1010100
 638:	00000001 	movf	zero,zero,$fcc0
 63c:	01000001 	movf	zero,t0,$fcc0
 640:	692f2e2e 	0x692f2e2e
 644:	756c636e 	jalx	5b18db8 <_data-0x7a4e7248>
 648:	00006564 	0x6564
 64c:	63747570 	0x63747570
 650:	2e726168 	sltiu	s2,s3,24936
 654:	00000063 	0x63
 658:	64747300 	0x64747300
 65c:	2e746e69 	sltiu	s4,s3,28265
 660:	00010068 	0x10068
 664:	63616d00 	0x63616d00
 668:	656e6968 	0x656e6968
 66c:	0100682e 	0x100682e
 670:	00000000 	nop
 674:	0bec0205 	j	fb00814 <_data-0x704ff7ec>
 678:	f3158800 	0xf3158800
 67c:	00140284 	0x140284
 680:	01a90101 	0x1a90101
 684:	00020000 	sll	zero,v0,0x0
 688:	00000052 	mflhxu	zero
 68c:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 690:	0101000d 	break	0x101
 694:	00000101 	0x101
 698:	00000100 	sll	zero,zero,0x4
 69c:	2f2e2e01 	sltiu	t6,t9,11777
 6a0:	6c636e69 	0x6c636e69
 6a4:	00656475 	0x656475
 6a8:	63616d00 	0x63616d00
 6ac:	656e6968 	0x656e6968
 6b0:	7070632e 	0x7070632e
 6b4:	00000000 	nop
 6b8:	6d6d6f63 	0x6d6d6f63
 6bc:	682e6e6f 	0x682e6e6f
 6c0:	00000100 	sll	zero,zero,0x4
 6c4:	69647473 	0x69647473
 6c8:	682e746e 	0x682e746e
 6cc:	00000100 	sll	zero,zero,0x4
 6d0:	6863616d 	0x6863616d
 6d4:	2e656e69 	sltiu	a1,s3,28265
 6d8:	00010068 	0x10068
 6dc:	05000000 	bltz	t0,6e0 <_data-0x7ffff920>
 6e0:	00000002 	srl	zero,zero,0x0
 6e4:	011b0300 	0x11b0300
 6e8:	03016a03 	0x3016a03
 6ec:	08024a16 	j	92858 <_data-0x7ff6d7a8>
 6f0:	00010100 	sll	zero,at,0x4
 6f4:	00000205 	0x205
 6f8:	1b030000 	0x1b030000
 6fc:	016a0301 	0x16a0301
 700:	024a1603 	0x24a1603
 704:	01010008 	0x1010008
 708:	00020500 	sll	zero,v0,0x14
 70c:	03000000 	0x3000000
 710:	6a03011b 	0x6a03011b
 714:	4a160301 	c2	0x160301
 718:	01000802 	0x1000802
 71c:	02050001 	movt	zero,s0,$fcc1
 720:	00000000 	nop
 724:	03011b03 	0x3011b03
 728:	1603016a 	bne	s0,v1,cd4 <_data-0x7ffff32c>
 72c:	0008024a 	0x8024a
 730:	05000101 	bltz	t0,b38 <_data-0x7ffff4c8>
 734:	00000002 	srl	zero,zero,0x0
 738:	011c0300 	0x11c0300
 73c:	03016f03 	0x3016f03
 740:	08024a11 	j	92844 <_data-0x7ff6d7bc>
 744:	00010100 	sll	zero,at,0x4
 748:	00000205 	0x205
 74c:	1c030000 	0x1c030000
 750:	016f0301 	0x16f0301
 754:	024a1103 	0x24a1103
 758:	01010008 	0x1010008
 75c:	00020500 	sll	zero,v0,0x14
 760:	03000000 	0x3000000
 764:	6f03011c 	0x6f03011c
 768:	4a110301 	c2	0x110301
 76c:	01000802 	0x1000802
 770:	02050001 	movt	zero,s0,$fcc1
 774:	00000000 	nop
 778:	03011c03 	0x3011c03
 77c:	1103016f 	beq	t0,v1,d3c <_data-0x7ffff2c4>
 780:	0008024a 	0x8024a
 784:	05000101 	bltz	t0,b8c <_data-0x7ffff474>
 788:	000c1802 	srl	v1,t4,0x0
 78c:	011e0388 	0x11e0388
 790:	03016d03 	0x3016d03
 794:	01300221 	0x1300221
 798:	01000802 	0x1000802
 79c:	02050001 	movt	zero,s0,$fcc1
 7a0:	00000000 	nop
 7a4:	03012e03 	0x3012e03
 7a8:	2a030157 	slti	v1,s0,343
 7ac:	ba560382 	swr	s6,898(s2)
 7b0:	024a2c03 	0x24a2c03
 7b4:	01010008 	0x1010008
 7b8:	50020500 	beql	zero,v0,1bbc <_data-0x7fffe444>
 7bc:	0388000c 	syscall	0xe2000
 7c0:	52030133 	beql	s0,v1,c90 <_data-0x7ffff370>
 7c4:	822f0301 	lb	t7,769(s1)
 7c8:	03ba5703 	0x3ba5703
 7cc:	08024a2b 	j	928ac <_data-0x7ff6d754>
 7d0:	00010100 	sll	zero,at,0x4
 7d4:	00000205 	0x205
 7d8:	38030000 	xori	v1,zero,0x0
 7dc:	83838401 	lb	v1,-31743(gp)
 7e0:	844b4bb9 	lh	t3,19385(v0)
 7e4:	0c024c48 	jal	93120 <_data-0x7ff6cee0>
 7e8:	00010100 	sll	zero,at,0x4
 7ec:	0c700205 	jal	1c00814 <_data-0x7e3ff7ec>
 7f0:	c1038800 	ll	v1,-30720(t0)
 7f4:	4a030100 	c2	0x30100
 7f8:	ba380301 	swr	t8,769(s1)
 7fc:	01000802 	0x1000802
 800:	02050001 	movt	zero,s0,$fcc1
 804:	88000c84 	lwl	zero,3204(zero)
 808:	0100c503 	0x100c503
 80c:	03014603 	0x3014603
 810:	0802ba3c 	j	ae8f0 <_data-0x7ff51710>
 814:	00010100 	sll	zero,at,0x4
 818:	00000205 	0x205
 81c:	c9030000 	lwc2	$3,0(t0)
 820:	bc030100 	cache	0x3,256(zero)
 824:	c603017f 	lwc1	$f3,383(s0)
 828:	0802ba00 	j	ae800 <_data-0x7ff51800>
 82c:	Address 0x000000000000082c is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
       0:	646e6573 	0x646e6573
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	7265735f 	0x7265735f
       8:	5f6c6169 	0x5f6c6169
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
       c:	5f727473 	0x5f727473
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	61706e75 	0x61706e75
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	633c6b63 	0x633c6b63
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	2c726168 	sltiu	s2,v1,24936
      1c:	61686320 	0x61686320
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
      20:	63202c72 	0x63202c72
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	2c726168 	sltiu	s2,v1,24936
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	61686320 	0x61686320
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	63202c72 	0x63202c72
      30:	2c726168 	sltiu	s2,v1,24936
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	61686320 	0x61686320
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	63202c72 	0x63202c72
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	2c726168 	sltiu	s2,v1,24936
      40:	61686320 	0x61686320
      44:	63202c72 	0x63202c72
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
      48:	2c726168 	sltiu	s2,v1,24936
      4c:	61686320 	0x61686320
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	73003e72 	0x73003e72
      54:	5f646e65 	0x5f646e65
      58:	69726573 	0x69726573
      5c:	735f6c61 	0x735f6c61
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
      60:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
      64:	6361706e 	0x6361706e
      68:	68633c6b 	0x68633c6b
      6c:	202c7261 	addi	t4,at,29281
      70:	72616863 	0x72616863
      74:	6863202c 	0x6863202c
      78:	202c7261 	addi	t4,at,29281
      7c:	72616863 	0x72616863
      80:	6863202c 	0x6863202c
      84:	202c7261 	addi	t4,at,29281
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
      c4:	646e6573 	0x646e6573
      c8:	7265735f 	0x7265735f
      cc:	5f6c6169 	0x5f6c6169
      d0:	5f727473 	0x5f727473
      d4:	61706e75 	0x61706e75
      d8:	633c6b63 	0x633c6b63
      dc:	2c726168 	sltiu	s2,v1,24936
      e0:	61686320 	0x61686320
      e4:	63202c72 	0x63202c72
      e8:	2c726168 	sltiu	s2,v1,24936
      ec:	61686320 	0x61686320
      f0:	63202c72 	0x63202c72
      f4:	2c726168 	sltiu	s2,v1,24936
      f8:	61686320 	0x61686320
      fc:	63202c72 	0x63202c72
     100:	2c726168 	sltiu	s2,v1,24936
     104:	61686320 	0x61686320
     108:	63202c72 	0x63202c72
     10c:	2c726168 	sltiu	s2,v1,24936
     110:	61686320 	0x61686320
     114:	63202c72 	0x63202c72
     118:	2c726168 	sltiu	s2,v1,24936
     11c:	61686320 	0x61686320
     120:	63202c72 	0x63202c72
     124:	2c726168 	sltiu	s2,v1,24936
     128:	61686320 	0x61686320
     12c:	63202c72 	0x63202c72
     130:	2c726168 	sltiu	s2,v1,24936
     134:	61686320 	0x61686320
     138:	63202c72 	0x63202c72
     13c:	2c726168 	sltiu	s2,v1,24936
     140:	61686320 	0x61686320
     144:	63202c72 	0x63202c72
     148:	2c726168 	sltiu	s2,v1,24936
     14c:	61686320 	0x61686320
     150:	50003e72 	beqzl	zero,fb1c <_data-0x7fff04e4>
     154:	006b6361 	0x6b6361
     158:	646e6573 	0x646e6573
     15c:	7265735f 	0x7265735f
     160:	5f6c6169 	0x5f6c6169
     164:	3c727473 	0x3c727473
     168:	5f003e39 	bgtzl	t8,fa50 <_data-0x7fff05b0>
     16c:	5f364e5a 	0x5f364e5a
     170:	706d695f 	0x706d695f
     174:	7332326c 	0x7332326c
     178:	5f646e65 	0x5f646e65
     17c:	69726573 	0x69726573
     180:	735f6c61 	0x735f6c61
     184:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     188:	6361706e 	0x6361706e
     18c:	634a496b 	0x634a496b
     190:	63636363 	0x63636363
     194:	63636363 	0x63636363
     198:	63636363 	0x63636363
     19c:	45636363 	0x45636363
     1a0:	68764545 	0x68764545
     1a4:	5f547044 	0x5f547044
     1a8:	315a5f00 	andi	k0,t2,0x5f00
     1ac:	6e657335 	0x6e657335
     1b0:	65735f64 	0x65735f64
     1b4:	6c616972 	0x6c616972
     1b8:	7865685f 	0x7865685f
     1bc:	5a5f006a 	0x5a5f006a
     1c0:	5f5f364e 	0x5f5f364e
     1c4:	6c706d69 	0x6c706d69
     1c8:	65733232 	0x65733232
     1cc:	735f646e 	0x735f646e
     1d0:	61697265 	0x61697265
     1d4:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     1d8:	6e755f72 	0x6e755f72
     1dc:	6b636170 	0x6b636170
     1e0:	63634a49 	0x63634a49
     1e4:	63636363 	0x63636363
     1e8:	63636363 	0x63636363
     1ec:	63636363 	0x63636363
     1f0:	45454563 	0x45454563
     1f4:	70446876 	0x70446876
     1f8:	73005f54 	0x73005f54
     1fc:	5f646e65 	0x5f646e65
     200:	69726573 	0x69726573
     204:	735f6c61 	0x735f6c61
     208:	615f7274 	0x615f7274
     20c:	313c7272 	andi	gp,t1,0x7272
     210:	30202c31 	andi	zero,at,0x2c31
     214:	2c31202c 	sltiu	s1,at,8236
     218:	202c3220 	addi	t4,at,12832
     21c:	34202c33 	ori	zero,at,0x2c33
     220:	2c35202c 	sltiu	s5,at,8236
     224:	202c3620 	addi	t4,at,13856
     228:	38202c37 	xori	zero,at,0x2c37
     22c:	2c39202c 	sltiu	t9,at,8236
     230:	3e303120 	0x3e303120
     234:	736e7500 	0x736e7500
     238:	656e6769 	0x656e6769
     23c:	65735f64 	0x65735f64
     240:	6e657571 	0x6e657571
     244:	303c6563 	andi	gp,at,0x6563
     248:	2c31202c 	sltiu	s1,at,8236
     24c:	202c3220 	addi	t4,at,12832
     250:	34202c33 	ori	zero,at,0x2c33
     254:	2c35202c 	sltiu	s5,at,8236
     258:	202c3620 	addi	t4,at,13856
     25c:	38202c37 	xori	zero,at,0x2c37
     260:	2c39202c 	sltiu	t9,at,8236
     264:	3e303120 	0x3e303120
     268:	756f6300 	jalx	5bd8c00 <_data-0x7a427400>
     26c:	7500746e 	jalx	401d1b8 <_data-0x7bfe2e48>
     270:	6769736e 	0x6769736e
     274:	5f64656e 	0x5f64656e
     278:	75716573 	jalx	5c595cc <_data-0x7a3a6a34>
     27c:	65636e65 	0x65636e65
     280:	202c303c 	addi	t4,at,12348
     284:	32202c31 	andi	zero,s1,0x2c31
     288:	2c33202c 	sltiu	s3,at,8236
     28c:	202c3420 	addi	t4,at,13344
     290:	36202c35 	ori	zero,s1,0x2c35
     294:	2c37202c 	sltiu	s7,at,8236
     298:	003e3820 	add	a3,at,s8
     29c:	646e6573 	0x646e6573
     2a0:	7265735f 	0x7265735f
     2a4:	5f6c6169 	0x5f6c6169
     2a8:	5f727473 	0x5f727473
     2ac:	61706e75 	0x61706e75
     2b0:	633c6b63 	0x633c6b63
     2b4:	2c726168 	sltiu	s2,v1,24936
     2b8:	61686320 	0x61686320
     2bc:	63202c72 	0x63202c72
     2c0:	2c726168 	sltiu	s2,v1,24936
     2c4:	61686320 	0x61686320
     2c8:	63202c72 	0x63202c72
     2cc:	3e726168 	0x3e726168
     2d0:	6e657300 	0x6e657300
     2d4:	65735f64 	0x65735f64
     2d8:	6c616972 	0x6c616972
     2dc:	7274735f 	0x7274735f
     2e0:	706e755f 	0x706e755f
     2e4:	3c6b6361 	0x3c6b6361
     2e8:	72616863 	0x72616863
     2ec:	6863202c 	0x6863202c
     2f0:	202c7261 	addi	t4,at,29281
     2f4:	72616863 	0x72616863
     2f8:	6863202c 	0x6863202c
     2fc:	003e7261 	0x3e7261
     300:	364e5a5f 	ori	t6,s2,0x5a5f
     304:	6d695f5f 	0x6d695f5f
     308:	32326c70 	andi	s2,s1,0x6c70
     30c:	646e6573 	0x646e6573
     310:	7265735f 	0x7265735f
     314:	5f6c6169 	0x5f6c6169
     318:	5f727473 	0x5f727473
     31c:	61706e75 	0x61706e75
     320:	4a496b63 	c2	0x496b63
     324:	63636363 	0x63636363
     328:	45636363 	0x45636363
     32c:	68764545 	0x68764545
     330:	5f547044 	0x5f547044
     334:	4e5a5f00 	c3	0x5a5f00
     338:	695f5f36 	0x695f5f36
     33c:	326c706d 	andi	t4,s3,0x706d
     340:	6e657332 	0x6e657332
     344:	65735f64 	0x65735f64
     348:	6c616972 	0x6c616972
     34c:	7274735f 	0x7274735f
     350:	706e755f 	0x706e755f
     354:	496b6361 	0x496b6361
     358:	6363634a 	0x6363634a
     35c:	63636363 	0x63636363
     360:	63636363 	0x63636363
     364:	63636363 	0x63636363
     368:	63636363 	0x63636363
     36c:	45454563 	0x45454563
     370:	70446876 	0x70446876
     374:	73005f54 	0x73005f54
     378:	5f646e65 	0x5f646e65
     37c:	69726573 	0x69726573
     380:	695f6c61 	0x695f6c61
     384:	6765746e 	0x6765746e
     388:	73007265 	0x73007265
     38c:	5f646e65 	0x5f646e65
     390:	69726573 	0x69726573
     394:	685f6c61 	0x685f6c61
     398:	67007865 	0x67007865
     39c:	5f6f6970 	0x5f6f6970
     3a0:	72746e65 	0x72746e65
     3a4:	5a5f0079 	0x5a5f0079
     3a8:	5f5f364e 	0x5f5f364e
     3ac:	6c706d69 	0x6c706d69
     3b0:	65733232 	0x65733232
     3b4:	735f646e 	0x735f646e
     3b8:	61697265 	0x61697265
     3bc:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     3c0:	6e755f72 	0x6e755f72
     3c4:	6b636170 	0x6b636170
     3c8:	63634a49 	0x63634a49
     3cc:	63636363 	0x63636363
     3d0:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     3d4:	54704468 	bnel	v1,s0,11578 <_data-0x7ffeea88>
     3d8:	5a5f005f 	0x5a5f005f
     3dc:	5f5f364e 	0x5f5f364e
     3e0:	6c706d69 	0x6c706d69
     3e4:	65733232 	0x65733232
     3e8:	735f646e 	0x735f646e
     3ec:	61697265 	0x61697265
     3f0:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     3f4:	6e755f72 	0x6e755f72
     3f8:	6b636170 	0x6b636170
     3fc:	63634a49 	0x63634a49
     400:	63636363 	0x63636363
     404:	63636363 	0x63636363
     408:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     40c:	54704468 	bnel	v1,s0,115b0 <_data-0x7ffeea50>
     410:	5a5f005f 	0x5a5f005f
     414:	5f5f364e 	0x5f5f364e
     418:	6c706d69 	0x6c706d69
     41c:	65733232 	0x65733232
     420:	735f646e 	0x735f646e
     424:	61697265 	0x61697265
     428:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     42c:	6e755f72 	0x6e755f72
     430:	6b636170 	0x6b636170
     434:	63634a49 	0x63634a49
     438:	63636363 	0x63636363
     43c:	63636363 	0x63636363
     440:	63636363 	0x63636363
     444:	63636363 	0x63636363
     448:	63636363 	0x63636363
     44c:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     450:	54704468 	bnel	v1,s0,115f4 <_data-0x7ffeea0c>
     454:	6573005f 	0x6573005f
     458:	735f646e 	0x735f646e
     45c:	61697265 	0x61697265
     460:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     464:	6e755f72 	0x6e755f72
     468:	6b636170 	0x6b636170
     46c:	6168633c 	0x6168633c
     470:	63202c72 	0x63202c72
     474:	2c726168 	sltiu	s2,v1,24936
     478:	61686320 	0x61686320
     47c:	63202c72 	0x63202c72
     480:	2c726168 	sltiu	s2,v1,24936
     484:	61686320 	0x61686320
     488:	63202c72 	0x63202c72
     48c:	2c726168 	sltiu	s2,v1,24936
     490:	61686320 	0x61686320
     494:	63202c72 	0x63202c72
     498:	2c726168 	sltiu	s2,v1,24936
     49c:	61686320 	0x61686320
     4a0:	63202c72 	0x63202c72
     4a4:	2c726168 	sltiu	s2,v1,24936
     4a8:	61686320 	0x61686320
     4ac:	63202c72 	0x63202c72
     4b0:	2c726168 	sltiu	s2,v1,24936
     4b4:	61686320 	0x61686320
     4b8:	63202c72 	0x63202c72
     4bc:	3e726168 	0x3e726168
     4c0:	61657200 	0x61657200
     4c4:	65735f64 	0x65735f64
     4c8:	6c616972 	0x6c616972
     4cc:	6168635f 	0x6168635f
     4d0:	65730072 	0x65730072
     4d4:	735f646e 	0x735f646e
     4d8:	61697265 	0x61697265
     4dc:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     4e0:	6e755f72 	0x6e755f72
     4e4:	6b636170 	0x6b636170
     4e8:	6168633c 	0x6168633c
     4ec:	63202c72 	0x63202c72
     4f0:	2c726168 	sltiu	s2,v1,24936
     4f4:	61686320 	0x61686320
     4f8:	63202c72 	0x63202c72
     4fc:	2c726168 	sltiu	s2,v1,24936
     500:	61686320 	0x61686320
     504:	63202c72 	0x63202c72
     508:	2c726168 	sltiu	s2,v1,24936
     50c:	61686320 	0x61686320
     510:	63202c72 	0x63202c72
     514:	2c726168 	sltiu	s2,v1,24936
     518:	61686320 	0x61686320
     51c:	63202c72 	0x63202c72
     520:	2c726168 	sltiu	s2,v1,24936
     524:	61686320 	0x61686320
     528:	63202c72 	0x63202c72
     52c:	2c726168 	sltiu	s2,v1,24936
     530:	61686320 	0x61686320
     534:	73003e72 	0x73003e72
     538:	5f646e65 	0x5f646e65
     53c:	69726573 	0x69726573
     540:	735f6c61 	0x735f6c61
     544:	313c7274 	andi	gp,t1,0x7274
     548:	5f003e31 	bgtzl	t8,fe10 <_data-0x7fff01f0>
     54c:	5f364e5a 	0x5f364e5a
     550:	706d695f 	0x706d695f
     554:	7332326c 	0x7332326c
     558:	5f646e65 	0x5f646e65
     55c:	69726573 	0x69726573
     560:	735f6c61 	0x735f6c61
     564:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     568:	6361706e 	0x6361706e
     56c:	634a496b 	0x634a496b
     570:	63636363 	0x63636363
     574:	45636363 	0x45636363
     578:	68764545 	0x68764545
     57c:	5f547044 	0x5f547044
     580:	6e657300 	0x6e657300
     584:	65735f64 	0x65735f64
     588:	6c616972 	0x6c616972
     58c:	7274735f 	0x7274735f
     590:	706e755f 	0x706e755f
     594:	3c6b6361 	0x3c6b6361
     598:	72616863 	0x72616863
     59c:	6863202c 	0x6863202c
     5a0:	202c7261 	addi	t4,at,29281
     5a4:	72616863 	0x72616863
     5a8:	6863202c 	0x6863202c
     5ac:	202c7261 	addi	t4,at,29281
     5b0:	72616863 	0x72616863
     5b4:	6863202c 	0x6863202c
     5b8:	202c7261 	addi	t4,at,29281
     5bc:	72616863 	0x72616863
     5c0:	6863202c 	0x6863202c
     5c4:	202c7261 	addi	t4,at,29281
     5c8:	72616863 	0x72616863
     5cc:	6863202c 	0x6863202c
     5d0:	202c7261 	addi	t4,at,29281
     5d4:	72616863 	0x72616863
     5d8:	6863202c 	0x6863202c
     5dc:	202c7261 	addi	t4,at,29281
     5e0:	72616863 	0x72616863
     5e4:	6863202c 	0x6863202c
     5e8:	202c7261 	addi	t4,at,29281
     5ec:	72616863 	0x72616863
     5f0:	6863202c 	0x6863202c
     5f4:	202c7261 	addi	t4,at,29281
     5f8:	72616863 	0x72616863
     5fc:	6863202c 	0x6863202c
     600:	202c7261 	addi	t4,at,29281
     604:	72616863 	0x72616863
     608:	6f62003e 	0x6f62003e
     60c:	75006c6f 	jalx	401b1bc <_data-0x7bfe4e44>
     610:	6769736e 	0x6769736e
     614:	5f64656e 	0x5f64656e
     618:	75716573 	jalx	5c595cc <_data-0x7a3a6a34>
     61c:	65636e65 	0x65636e65
     620:	202c303c 	addi	t4,at,12348
     624:	32202c31 	andi	zero,s1,0x2c31
     628:	2c33202c 	sltiu	s3,at,8236
     62c:	202c3420 	addi	t4,at,13344
     630:	36202c35 	ori	zero,s1,0x2c35
     634:	2c37202c 	sltiu	s7,at,8236
     638:	202c3820 	addi	t4,at,14368
     63c:	31202c39 	andi	zero,t1,0x2c39
     640:	31202c30 	andi	zero,t1,0x2c30
     644:	31202c31 	andi	zero,t1,0x2c31
     648:	5f003e32 	bgtzl	t8,ff14 <_data-0x7fff00ec>
     64c:	7338325a 	0x7338325a
     650:	5f646e65 	0x5f646e65
     654:	69726573 	0x69726573
     658:	695f6c61 	0x695f6c61
     65c:	6765746e 	0x6765746e
     660:	755f7265 	jalx	57dc994 <_data-0x7a82366c>
     664:	6769736e 	0x6769736e
     668:	6a64656e 	0x6a64656e
     66c:	6e657300 	0x6e657300
     670:	65735f64 	0x65735f64
     674:	6c616972 	0x6c616972
     678:	7274735f 	0x7274735f
     67c:	706e755f 	0x706e755f
     680:	3c6b6361 	0x3c6b6361
     684:	72616863 	0x72616863
     688:	6863202c 	0x6863202c
     68c:	202c7261 	addi	t4,at,29281
     690:	72616863 	0x72616863
     694:	6863202c 	0x6863202c
     698:	202c7261 	addi	t4,at,29281
     69c:	72616863 	0x72616863
     6a0:	6863202c 	0x6863202c
     6a4:	202c7261 	addi	t4,at,29281
     6a8:	72616863 	0x72616863
     6ac:	6863202c 	0x6863202c
     6b0:	202c7261 	addi	t4,at,29281
     6b4:	72616863 	0x72616863
     6b8:	6863202c 	0x6863202c
     6bc:	202c7261 	addi	t4,at,29281
     6c0:	72616863 	0x72616863
     6c4:	6863202c 	0x6863202c
     6c8:	202c7261 	addi	t4,at,29281
     6cc:	72616863 	0x72616863
     6d0:	6863202c 	0x6863202c
     6d4:	202c7261 	addi	t4,at,29281
     6d8:	72616863 	0x72616863
     6dc:	6863202c 	0x6863202c
     6e0:	202c7261 	addi	t4,at,29281
     6e4:	72616863 	0x72616863
     6e8:	6863202c 	0x6863202c
     6ec:	003e7261 	0x3e7261
     6f0:	364e5a5f 	ori	t6,s2,0x5a5f
     6f4:	6d695f5f 	0x6d695f5f
     6f8:	32326c70 	andi	s2,s1,0x6c70
     6fc:	646e6573 	0x646e6573
     700:	7265735f 	0x7265735f
     704:	5f6c6169 	0x5f6c6169
     708:	5f727473 	0x5f727473
     70c:	61706e75 	0x61706e75
     710:	4a496b63 	c2	0x496b63
     714:	45456363 	0x45456363
     718:	44687645 	0x44687645
     71c:	005f5470 	tge	v0,ra,0x151
     720:	364e5a5f 	ori	t6,s2,0x5a5f
     724:	6d695f5f 	0x6d695f5f
     728:	32326c70 	andi	s2,s1,0x6c70
     72c:	646e6573 	0x646e6573
     730:	7265735f 	0x7265735f
     734:	5f6c6169 	0x5f6c6169
     738:	5f727473 	0x5f727473
     73c:	61706e75 	0x61706e75
     740:	4a496b63 	c2	0x496b63
     744:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     748:	54704468 	bnel	v1,s0,118ec <_data-0x7ffee714>
     74c:	5a5f005f 	0x5a5f005f
     750:	65673231 	0x65673231
     754:	77735f74 	jalx	dcd7dd0 <_data-0x72328230>
     758:	68637469 	0x68637469
     75c:	00767365 	0x767365
     760:	646e6573 	0x646e6573
     764:	7265735f 	0x7265735f
     768:	5f6c6169 	0x5f6c6169
     76c:	5f727473 	0x5f727473
     770:	61706e75 	0x61706e75
     774:	633c6b63 	0x633c6b63
     778:	2c726168 	sltiu	s2,v1,24936
     77c:	61686320 	0x61686320
     780:	5f003e72 	bgtzl	t8,1014c <_data-0x7ffefeb4>
     784:	5f364e5a 	0x5f364e5a
     788:	706d695f 	0x706d695f
     78c:	7339316c 	0x7339316c
     790:	5f646e65 	0x5f646e65
     794:	69726573 	0x69726573
     798:	735f6c61 	0x735f6c61
     79c:	615f7274 	0x615f7274
     7a0:	4c497272 	0x4c497272
     7a4:	4533316a 	0x4533316a
     7a8:	306a4c4a 	andi	t2,v1,0x4c4a
     7ac:	316a4c45 	andi	t2,t3,0x4c45
     7b0:	326a4c45 	andi	t2,s3,0x4c45
     7b4:	336a4c45 	andi	t2,k1,0x4c45
     7b8:	346a4c45 	ori	t2,v1,0x4c45
     7bc:	356a4c45 	ori	t2,t3,0x4c45
     7c0:	366a4c45 	ori	t2,s3,0x4c45
     7c4:	376a4c45 	ori	t2,k1,0x4c45
     7c8:	386a4c45 	xori	t2,v1,0x4c45
     7cc:	396a4c45 	xori	t2,t3,0x4c45
     7d0:	316a4c45 	andi	t2,t3,0x4c45
     7d4:	6a4c4530 	0x6a4c4530
     7d8:	4c453131 	0x4c453131
     7dc:	4532316a 	0x4532316a
     7e0:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     7e4:	5f544152 	0x5f544152
     7e8:	4e634b5f 	c3	0x634b5f
     7ec:	37315f53 	ori	s1,t9,0x5f53
     7f0:	69736e75 	0x69736e75
     7f4:	64656e67 	0x64656e67
     7f8:	7165735f 	0x7165735f
     7fc:	636e6575 	0x636e6575
     800:	584a4965 	0x584a4965
     804:	30547073 	andi	s4,v0,0x7073
     808:	4545455f 	0x4545455f
     80c:	65730045 	0x65730045
     810:	735f646e 	0x735f646e
     814:	61697265 	0x61697265
     818:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     81c:	6e755f72 	0x6e755f72
     820:	6b636170 	0x6b636170
     824:	6168633c 	0x6168633c
     828:	63202c72 	0x63202c72
     82c:	2c726168 	sltiu	s2,v1,24936
     830:	61686320 	0x61686320
     834:	63202c72 	0x63202c72
     838:	2c726168 	sltiu	s2,v1,24936
     83c:	61686320 	0x61686320
     840:	63202c72 	0x63202c72
     844:	2c726168 	sltiu	s2,v1,24936
     848:	61686320 	0x61686320
     84c:	63202c72 	0x63202c72
     850:	2c726168 	sltiu	s2,v1,24936
     854:	61686320 	0x61686320
     858:	63202c72 	0x63202c72
     85c:	2c726168 	sltiu	s2,v1,24936
     860:	61686320 	0x61686320
     864:	63202c72 	0x63202c72
     868:	2c726168 	sltiu	s2,v1,24936
     86c:	61686320 	0x61686320
     870:	63202c72 	0x63202c72
     874:	2c726168 	sltiu	s2,v1,24936
     878:	61686320 	0x61686320
     87c:	63202c72 	0x63202c72
     880:	2c726168 	sltiu	s2,v1,24936
     884:	61686320 	0x61686320
     888:	63202c72 	0x63202c72
     88c:	2c726168 	sltiu	s2,v1,24936
     890:	61686320 	0x61686320
     894:	63202c72 	0x63202c72
     898:	2c726168 	sltiu	s2,v1,24936
     89c:	61686320 	0x61686320
     8a0:	63202c72 	0x63202c72
     8a4:	3e726168 	0x3e726168
     8a8:	6e657300 	0x6e657300
     8ac:	65735f64 	0x65735f64
     8b0:	6c616972 	0x6c616972
     8b4:	7274735f 	0x7274735f
     8b8:	706e755f 	0x706e755f
     8bc:	3c6b6361 	0x3c6b6361
     8c0:	72616863 	0x72616863
     8c4:	6863202c 	0x6863202c
     8c8:	202c7261 	addi	t4,at,29281
     8cc:	72616863 	0x72616863
     8d0:	6863202c 	0x6863202c
     8d4:	202c7261 	addi	t4,at,29281
     8d8:	72616863 	0x72616863
     8dc:	6863202c 	0x6863202c
     8e0:	202c7261 	addi	t4,at,29281
     8e4:	72616863 	0x72616863
     8e8:	6863202c 	0x6863202c
     8ec:	202c7261 	addi	t4,at,29281
     8f0:	72616863 	0x72616863
     8f4:	6863202c 	0x6863202c
     8f8:	202c7261 	addi	t4,at,29281
     8fc:	72616863 	0x72616863
     900:	6863202c 	0x6863202c
     904:	003e7261 	0x3e7261
     908:	646e6573 	0x646e6573
     90c:	7265735f 	0x7265735f
     910:	5f6c6169 	0x5f6c6169
     914:	5f727473 	0x5f727473
     918:	3c727261 	0x3c727261
     91c:	30202c39 	andi	zero,at,0x2c39
     920:	2c31202c 	sltiu	s1,at,8236
     924:	202c3220 	addi	t4,at,12832
     928:	34202c33 	ori	zero,at,0x2c33
     92c:	2c35202c 	sltiu	s5,at,8236
     930:	202c3620 	addi	t4,at,13856
     934:	38202c37 	xori	zero,at,0x2c37
     938:	5a5f003e 	0x5a5f003e
     93c:	5f5f364e 	0x5f5f364e
     940:	6c706d69 	0x6c706d69
     944:	65733232 	0x65733232
     948:	735f646e 	0x735f646e
     94c:	61697265 	0x61697265
     950:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     954:	6e755f72 	0x6e755f72
     958:	6b636170 	0x6b636170
     95c:	63634a49 	0x63634a49
     960:	45456363 	0x45456363
     964:	44687645 	0x44687645
     968:	005f5470 	tge	v0,ra,0x151
     96c:	364e5a5f 	ori	t6,s2,0x5a5f
     970:	6d695f5f 	0x6d695f5f
     974:	32326c70 	andi	s2,s1,0x6c70
     978:	646e6573 	0x646e6573
     97c:	7265735f 	0x7265735f
     980:	5f6c6169 	0x5f6c6169
     984:	5f727473 	0x5f727473
     988:	61706e75 	0x61706e75
     98c:	4a496b63 	c2	0x496b63
     990:	63636363 	0x63636363
     994:	63636363 	0x63636363
     998:	45454563 	0x45454563
     99c:	70446876 	0x70446876
     9a0:	6e005f54 	0x6e005f54
     9a4:	765f776f 	jalx	97dddbc <_data-0x76822244>
     9a8:	5f006c61 	bgtzl	t8,1bb30 <_data-0x7ffe44d0>
     9ac:	5f364e5a 	0x5f364e5a
     9b0:	706d695f 	0x706d695f
     9b4:	7339316c 	0x7339316c
     9b8:	5f646e65 	0x5f646e65
     9bc:	69726573 	0x69726573
     9c0:	735f6c61 	0x735f6c61
     9c4:	615f7274 	0x615f7274
     9c8:	4c497272 	0x4c497272
     9cc:	4533326a 	0x4533326a
     9d0:	306a4c4a 	andi	t2,v1,0x4c4a
     9d4:	316a4c45 	andi	t2,t3,0x4c45
     9d8:	326a4c45 	andi	t2,s3,0x4c45
     9dc:	336a4c45 	andi	t2,k1,0x4c45
     9e0:	346a4c45 	ori	t2,v1,0x4c45
     9e4:	356a4c45 	ori	t2,t3,0x4c45
     9e8:	366a4c45 	ori	t2,s3,0x4c45
     9ec:	376a4c45 	ori	t2,k1,0x4c45
     9f0:	386a4c45 	xori	t2,v1,0x4c45
     9f4:	396a4c45 	xori	t2,t3,0x4c45
     9f8:	316a4c45 	andi	t2,t3,0x4c45
     9fc:	6a4c4530 	0x6a4c4530
     a00:	4c453131 	0x4c453131
     a04:	4532316a 	0x4532316a
     a08:	33316a4c 	andi	s1,t9,0x6a4c
     a0c:	316a4c45 	andi	t2,t3,0x4c45
     a10:	6a4c4534 	0x6a4c4534
     a14:	4c453531 	0x4c453531
     a18:	4536316a 	0x4536316a
     a1c:	37316a4c 	ori	s1,t9,0x6a4c
     a20:	316a4c45 	andi	t2,t3,0x4c45
     a24:	6a4c4538 	0x6a4c4538
     a28:	4c453931 	0x4c453931
     a2c:	4530326a 	0x4530326a
     a30:	31326a4c 	andi	s2,t1,0x6a4c
     a34:	326a4c45 	andi	t2,s3,0x4c45
     a38:	45454532 	0x45454532
     a3c:	41527645 	0x41527645
     a40:	4b5f5f54 	c2	0x15f5f54
     a44:	5f534e63 	0x5f534e63
     a48:	6e753731 	0x6e753731
     a4c:	6e676973 	0x6e676973
     a50:	735f6465 	0x735f6465
     a54:	65757165 	0x65757165
     a58:	4965636e 	0x4965636e
     a5c:	7073584a 	0x7073584a
     a60:	455f3054 	0x455f3054
     a64:	00454545 	0x454545
     a68:	646e6573 	0x646e6573
     a6c:	7265735f 	0x7265735f
     a70:	5f6c6169 	0x5f6c6169
     a74:	65746e69 	0x65746e69
     a78:	5f726567 	0x5f726567
     a7c:	69736e75 	0x69736e75
     a80:	64656e67 	0x64656e67
     a84:	736e7500 	0x736e7500
     a88:	656e6769 	0x656e6769
     a8c:	65735f64 	0x65735f64
     a90:	6e657571 	0x6e657571
     a94:	303c6563 	andi	gp,at,0x6563
     a98:	2c31202c 	sltiu	s1,at,8236
     a9c:	202c3220 	addi	t4,at,12832
     aa0:	34202c33 	ori	zero,at,0x2c33
     aa4:	2c35202c 	sltiu	s5,at,8236
     aa8:	202c3620 	addi	t4,at,13856
     aac:	38202c37 	xori	zero,at,0x2c37
     ab0:	2c39202c 	sltiu	t9,at,8236
     ab4:	2c303120 	sltiu	s0,at,12576
     ab8:	2c313120 	sltiu	s1,at,12576
     abc:	2c323120 	sltiu	s2,at,12576
     ac0:	2c333120 	sltiu	s3,at,12576
     ac4:	2c343120 	sltiu	s4,at,12576
     ac8:	2c353120 	sltiu	s5,at,12576
     acc:	2c363120 	sltiu	s6,at,12576
     ad0:	2c373120 	sltiu	s7,at,12576
     ad4:	2c383120 	sltiu	t8,at,12576
     ad8:	2c393120 	sltiu	t9,at,12576
     adc:	2c303220 	sltiu	s0,at,12832
     ae0:	2c313220 	sltiu	s1,at,12832
     ae4:	3e323220 	0x3e323220
     ae8:	736e7500 	0x736e7500
     aec:	656e6769 	0x656e6769
     af0:	68632064 	0x68632064
     af4:	5f007261 	bgtzl	t8,1d47c <_data-0x7ffe2b84>
     af8:	5f364e5a 	0x5f364e5a
     afc:	706d695f 	0x706d695f
     b00:	7332326c 	0x7332326c
     b04:	5f646e65 	0x5f646e65
     b08:	69726573 	0x69726573
     b0c:	735f6c61 	0x735f6c61
     b10:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     b14:	6361706e 	0x6361706e
     b18:	634a496b 	0x634a496b
     b1c:	45456363 	0x45456363
     b20:	44687645 	0x44687645
     b24:	005f5470 	tge	v0,ra,0x151
     b28:	646e6573 	0x646e6573
     b2c:	7265735f 	0x7265735f
     b30:	5f6c6169 	0x5f6c6169
     b34:	5f727473 	0x5f727473
     b38:	3c727261 	0x3c727261
     b3c:	202c3331 	addi	t4,at,13105
     b40:	31202c30 	andi	zero,t1,0x2c30
     b44:	2c32202c 	sltiu	s2,at,8236
     b48:	202c3320 	addi	t4,at,13088
     b4c:	35202c34 	ori	zero,t1,0x2c34
     b50:	2c36202c 	sltiu	s6,at,8236
     b54:	202c3720 	addi	t4,at,14112
     b58:	39202c38 	xori	zero,t1,0x2c38
     b5c:	3031202c 	andi	s1,at,0x202c
     b60:	3131202c 	andi	s1,t1,0x202c
     b64:	3231202c 	andi	s1,s1,0x202c
     b68:	6573003e 	0x6573003e
     b6c:	65735f74 	0x65735f74
     b70:	6e656d67 	0x6e656d67
     b74:	69645f74 	0x69645f74
     b78:	616c7073 	0x616c7073
     b7c:	73007379 	0x73007379
     b80:	5f646e65 	0x5f646e65
     b84:	69726573 	0x69726573
     b88:	735f6c61 	0x735f6c61
     b8c:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     b90:	6361706e 	0x6361706e
     b94:	68633c6b 	0x68633c6b
     b98:	202c7261 	addi	t4,at,29281
     b9c:	72616863 	0x72616863
     ba0:	6863202c 	0x6863202c
     ba4:	202c7261 	addi	t4,at,29281
     ba8:	72616863 	0x72616863
     bac:	6863202c 	0x6863202c
     bb0:	202c7261 	addi	t4,at,29281
     bb4:	72616863 	0x72616863
     bb8:	6863202c 	0x6863202c
     bbc:	202c7261 	addi	t4,at,29281
     bc0:	72616863 	0x72616863
     bc4:	6863202c 	0x6863202c
     bc8:	202c7261 	addi	t4,at,29281
     bcc:	72616863 	0x72616863
     bd0:	6863202c 	0x6863202c
     bd4:	202c7261 	addi	t4,at,29281
     bd8:	72616863 	0x72616863
     bdc:	6863202c 	0x6863202c
     be0:	202c7261 	addi	t4,at,29281
     be4:	72616863 	0x72616863
     be8:	6863202c 	0x6863202c
     bec:	202c7261 	addi	t4,at,29281
     bf0:	72616863 	0x72616863
     bf4:	5a5f003e 	0x5a5f003e
     bf8:	5f5f364e 	0x5f5f364e
     bfc:	6c706d69 	0x6c706d69
     c00:	65733232 	0x65733232
     c04:	735f646e 	0x735f646e
     c08:	61697265 	0x61697265
     c0c:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     c10:	6e755f72 	0x6e755f72
     c14:	6b636170 	0x6b636170
     c18:	63634a49 	0x63634a49
     c1c:	63636363 	0x63636363
     c20:	63636363 	0x63636363
     c24:	45454563 	0x45454563
     c28:	70446876 	0x70446876
     c2c:	5f005f54 	bgtzl	t8,18980 <_data-0x7ffe7680>
     c30:	7335315a 	0x7335315a
     c34:	5f646e65 	0x5f646e65
     c38:	69726573 	0x69726573
     c3c:	735f6c61 	0x735f6c61
     c40:	4c497274 	0x4c497274
     c44:	4533316a 	0x4533316a
     c48:	41527645 	0x41527645
     c4c:	4b5f5f54 	c2	0x15f5f54
     c50:	6d2f0063 	0x6d2f0063
     c54:	632f746e 	0x632f746e
     c58:	6573552f 	0x6573552f
     c5c:	462f7372 	c1	0x2f7372
     c60:	6f746361 	0x6f746361
     c64:	6c616972 	0x6c616972
     c68:	6f642f4e 	0x6f642f4e
     c6c:	6f6c6e77 	0x6f6c6e77
     c70:	2f736461 	sltiu	s3,k1,25697
     c74:	2f776f77 	sltiu	s7,k1,28535
     c78:	31646f63 	andi	a0,t3,0x6f63
     c7c:	70726739 	0x70726739
     c80:	6f522f31 	0x6f522f31
     c84:	72657475 	0x72657475
     c88:	6265522d 	0x6265522d
     c8c:	646c6975 	0x646c6975
     c90:	6972542f 	0x6972542f
     c94:	6c616976 	0x6c616976
     c98:	5350494d 	beql	k0,s0,131d0 <_data-0x7ffece30>
     c9c:	666f535f 	0x666f535f
     ca0:	72617774 	0x72617774
     ca4:	70632f65 	0x70632f65
     ca8:	4e470070 	c3	0x470070
     cac:	2b432055 	slti	v1,k0,8277
     cb0:	2031312b 	addi	s1,at,12587
     cb4:	2e342e37 	sltiu	s4,s1,11831
     cb8:	6d2d2030 	0x6d2d2030
     cbc:	2d206c65 	sltiu	zero,t1,27749
     cc0:	6e69736d 	0x6e69736d
     cc4:	2d656c67 	sltiu	a1,t3,27751
     cc8:	616f6c66 	0x616f6c66
     ccc:	6d2d2074 	0x6d2d2074
     cd0:	746f6778 	jalx	1bd9de0 <_data-0x7e426220>
     cd4:	6e6d2d20 	0x6e6d2d20
     cd8:	62612d6f 	0x62612d6f
     cdc:	6c616369 	0x6c616369
     ce0:	2d20736c 	sltiu	zero,t1,29548
     ce4:	7261686d 	0x7261686d
     ce8:	6c662d64 	0x6c662d64
     cec:	2074616f 	addi	s4,v1,24943
     cf0:	70696d2d 	0x70696d2d
     cf4:	20323373 	addi	s2,at,13171
     cf8:	6c6c6d2d 	0x6c6c6d2d
     cfc:	2d206373 	sltiu	zero,t1,25459
     d00:	2d6f6e6d 	sltiu	t7,t3,28269
     d04:	3163786c 	andi	v1,t3,0x786c
     d08:	6378732d 	0x6378732d
     d0c:	6d2d2031 	0x6d2d2031
     d10:	6d2d6f6e 	0x6d2d6f6e
     d14:	34646461 	ori	a0,v1,0x6461
     d18:	6e6d2d20 	0x6e6d2d20
     d1c:	68732d6f 	0x68732d6f
     d20:	64657261 	0x64657261
     d24:	616d2d20 	0x616d2d20
     d28:	333d6962 	andi	sp,t9,0x6962
     d2c:	672d2032 	0x672d2032
     d30:	734f2d20 	0x734f2d20
     d34:	74732d20 	jalx	1ccb480 <_data-0x7e334b80>
     d38:	2b633d64 	slti	v1,k1,15716
     d3c:	2031312b 	addi	s1,at,12587
     d40:	7566662d 	jalx	59998b4 <_data-0x7a66674c>
     d44:	6974636e 	0x6974636e
     d48:	732d6e6f 	0x732d6e6f
     d4c:	69746365 	0x69746365
     d50:	20736e6f 	addi	s3,v1,28271
     d54:	6164662d 	0x6164662d
     d58:	732d6174 	0x732d6174
     d5c:	69746365 	0x69746365
     d60:	20736e6f 	addi	s3,v1,28271
     d64:	7266662d 	0x7266662d
     d68:	74736565 	jalx	1cd9594 <_data-0x7e326a6c>
     d6c:	69646e61 	0x69646e61
     d70:	2d20676e 	sltiu	zero,t1,26478
     d74:	2d6f6e66 	sltiu	t7,t3,28262
     d78:	6c697562 	0x6c697562
     d7c:	206e6974 	addi	t6,v1,26996
     d80:	6f6e662d 	0x6f6e662d
     d84:	4549502d 	0x4549502d
     d88:	315a5f00 	andi	k0,t2,0x5f00
     d8c:	6e657335 	0x6e657335
     d90:	65735f64 	0x65735f64
     d94:	6c616972 	0x6c616972
     d98:	7274735f 	0x7274735f
     d9c:	396a4c49 	xori	t2,t3,0x4c49
     da0:	52764545 	beql	s3,s6,122b8 <_data-0x7ffedd48>
     da4:	5f5f5441 	0x5f5f5441
     da8:	5f00634b 	bgtzl	t8,19ad8 <_data-0x7ffe6528>
     dac:	7335315a 	0x7335315a
     db0:	5f646e65 	0x5f646e65
     db4:	69726573 	0x69726573
     db8:	735f6c61 	0x735f6c61
     dbc:	4c497274 	0x4c497274
     dc0:	4533326a 	0x4533326a
     dc4:	41527645 	0x41527645
     dc8:	4b5f5f54 	c2	0x15f5f54
     dcc:	65670063 	0x65670063
     dd0:	77735f74 	jalx	dcd7dd0 <_data-0x72328230>
     dd4:	68637469 	0x68637469
     dd8:	5f007365 	bgtzl	t8,1db70 <_data-0x7ffe2490>
     ddc:	5f364e5a 	0x5f364e5a
     de0:	706d695f 	0x706d695f
     de4:	7332326c 	0x7332326c
     de8:	5f646e65 	0x5f646e65
     dec:	69726573 	0x69726573
     df0:	735f6c61 	0x735f6c61
     df4:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     df8:	6361706e 	0x6361706e
     dfc:	634a496b 	0x634a496b
     e00:	63636363 	0x63636363
     e04:	63636363 	0x63636363
     e08:	63636363 	0x63636363
     e0c:	63636363 	0x63636363
     e10:	45456363 	0x45456363
     e14:	44687645 	0x44687645
     e18:	005f5470 	tge	v0,ra,0x151
     e1c:	646e6573 	0x646e6573
     e20:	7265735f 	0x7265735f
     e24:	5f6c6169 	0x5f6c6169
     e28:	3c727473 	0x3c727473
     e2c:	003e3332 	tlt	at,s8,0xcc
     e30:	646e6573 	0x646e6573
     e34:	7265735f 	0x7265735f
     e38:	5f6c6169 	0x5f6c6169
     e3c:	5f727473 	0x5f727473
     e40:	61706e75 	0x61706e75
     e44:	633c6b63 	0x633c6b63
     e48:	2c726168 	sltiu	s2,v1,24936
     e4c:	61686320 	0x61686320
     e50:	63202c72 	0x63202c72
     e54:	2c726168 	sltiu	s2,v1,24936
     e58:	61686320 	0x61686320
     e5c:	63202c72 	0x63202c72
     e60:	2c726168 	sltiu	s2,v1,24936
     e64:	61686320 	0x61686320
     e68:	63202c72 	0x63202c72
     e6c:	3e726168 	0x3e726168
     e70:	6e657300 	0x6e657300
     e74:	65735f64 	0x65735f64
     e78:	6c616972 	0x6c616972
     e7c:	7274735f 	0x7274735f
     e80:	706e755f 	0x706e755f
     e84:	3c6b6361 	0x3c6b6361
     e88:	72616863 	0x72616863
     e8c:	6863202c 	0x6863202c
     e90:	202c7261 	addi	t4,at,29281
     e94:	72616863 	0x72616863
     e98:	6863202c 	0x6863202c
     e9c:	202c7261 	addi	t4,at,29281
     ea0:	72616863 	0x72616863
     ea4:	6863202c 	0x6863202c
     ea8:	202c7261 	addi	t4,at,29281
     eac:	72616863 	0x72616863
     eb0:	6863202c 	0x6863202c
     eb4:	202c7261 	addi	t4,at,29281
     eb8:	72616863 	0x72616863
     ebc:	6573003e 	0x6573003e
     ec0:	735f646e 	0x735f646e
     ec4:	61697265 	0x61697265
     ec8:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     ecc:	6e755f72 	0x6e755f72
     ed0:	6b636170 	0x6b636170
     ed4:	6168633c 	0x6168633c
     ed8:	63202c72 	0x63202c72
     edc:	2c726168 	sltiu	s2,v1,24936
     ee0:	61686320 	0x61686320
     ee4:	63202c72 	0x63202c72
     ee8:	2c726168 	sltiu	s2,v1,24936
     eec:	61686320 	0x61686320
     ef0:	63202c72 	0x63202c72
     ef4:	2c726168 	sltiu	s2,v1,24936
     ef8:	61686320 	0x61686320
     efc:	63202c72 	0x63202c72
     f00:	2c726168 	sltiu	s2,v1,24936
     f04:	61686320 	0x61686320
     f08:	63202c72 	0x63202c72
     f0c:	2c726168 	sltiu	s2,v1,24936
     f10:	61686320 	0x61686320
     f14:	63202c72 	0x63202c72
     f18:	2c726168 	sltiu	s2,v1,24936
     f1c:	61686320 	0x61686320
     f20:	63202c72 	0x63202c72
     f24:	2c726168 	sltiu	s2,v1,24936
     f28:	61686320 	0x61686320
     f2c:	63202c72 	0x63202c72
     f30:	2c726168 	sltiu	s2,v1,24936
     f34:	61686320 	0x61686320
     f38:	5f003e72 	bgtzl	t8,10904 <_data-0x7ffef6fc>
     f3c:	5f364e5a 	0x5f364e5a
     f40:	706d695f 	0x706d695f
     f44:	7332326c 	0x7332326c
     f48:	5f646e65 	0x5f646e65
     f4c:	69726573 	0x69726573
     f50:	735f6c61 	0x735f6c61
     f54:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
     f58:	6361706e 	0x6361706e
     f5c:	634a496b 	0x634a496b
     f60:	63636363 	0x63636363
     f64:	76454545 	jalx	9151514 <_data-0x76eaeaec>
     f68:	54704468 	bnel	v1,s0,1210c <_data-0x7ffedef4>
     f6c:	6573005f 	0x6573005f
     f70:	735f646e 	0x735f646e
     f74:	61697265 	0x61697265
     f78:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
     f7c:	6e755f72 	0x6e755f72
     f80:	6b636170 	0x6b636170
     f84:	5f003e3c 	bgtzl	t8,10878 <_data-0x7ffef788>
     f88:	5f364e5a 	0x5f364e5a
     f8c:	706d695f 	0x706d695f
     f90:	7339316c 	0x7339316c
     f94:	5f646e65 	0x5f646e65
     f98:	69726573 	0x69726573
     f9c:	735f6c61 	0x735f6c61
     fa0:	615f7274 	0x615f7274
     fa4:	4c497272 	0x4c497272
     fa8:	4531316a 	0x4531316a
     fac:	306a4c4a 	andi	t2,v1,0x4c4a
     fb0:	316a4c45 	andi	t2,t3,0x4c45
     fb4:	326a4c45 	andi	t2,s3,0x4c45
     fb8:	336a4c45 	andi	t2,k1,0x4c45
     fbc:	346a4c45 	ori	t2,v1,0x4c45
     fc0:	356a4c45 	ori	t2,t3,0x4c45
     fc4:	366a4c45 	ori	t2,s3,0x4c45
     fc8:	376a4c45 	ori	t2,k1,0x4c45
     fcc:	386a4c45 	xori	t2,v1,0x4c45
     fd0:	396a4c45 	xori	t2,t3,0x4c45
     fd4:	316a4c45 	andi	t2,t3,0x4c45
     fd8:	45454530 	0x45454530
     fdc:	41527645 	0x41527645
     fe0:	4b5f5f54 	c2	0x15f5f54
     fe4:	5f534e63 	0x5f534e63
     fe8:	6e753731 	0x6e753731
     fec:	6e676973 	0x6e676973
     ff0:	735f6465 	0x735f6465
     ff4:	65757165 	0x65757165
     ff8:	4965636e 	0x4965636e
     ffc:	7073584a 	0x7073584a
    1000:	455f3054 	0x455f3054
    1004:	00454545 	0x454545
    1008:	69726573 	0x69726573
    100c:	655f6c61 	0x655f6c61
    1010:	7972746e 	0x7972746e
    1014:	5f736900 	0x5f736900
    1018:	69726573 	0x69726573
    101c:	725f6c61 	0x725f6c61
    1020:	79646165 	0x79646165
    1024:	5f6f745f 	0x5f6f745f
    1028:	64616572 	0x64616572
    102c:	6e657300 	0x6e657300
    1030:	65735f64 	0x65735f64
    1034:	6c616972 	0x6c616972
    1038:	7274735f 	0x7274735f
    103c:	706e755f 	0x706e755f
    1040:	3c6b6361 	0x3c6b6361
    1044:	72616863 	0x72616863
    1048:	6f6c003e 	0x6f6c003e
    104c:	7520676e 	jalx	4819db8 <_data-0x7b7e6248>
    1050:	6769736e 	0x6769736e
    1054:	2064656e 	addi	a0,v1,25966
    1058:	00746e69 	0x746e69
    105c:	646e6573 	0x646e6573
    1060:	7265735f 	0x7265735f
    1064:	5f6c6169 	0x5f6c6169
    1068:	5f727473 	0x5f727473
    106c:	61706e75 	0x61706e75
    1070:	633c6b63 	0x633c6b63
    1074:	2c726168 	sltiu	s2,v1,24936
    1078:	61686320 	0x61686320
    107c:	63202c72 	0x63202c72
    1080:	2c726168 	sltiu	s2,v1,24936
    1084:	61686320 	0x61686320
    1088:	63202c72 	0x63202c72
    108c:	2c726168 	sltiu	s2,v1,24936
    1090:	61686320 	0x61686320
    1094:	63202c72 	0x63202c72
    1098:	2c726168 	sltiu	s2,v1,24936
    109c:	61686320 	0x61686320
    10a0:	63202c72 	0x63202c72
    10a4:	2c726168 	sltiu	s2,v1,24936
    10a8:	61686320 	0x61686320
    10ac:	63202c72 	0x63202c72
    10b0:	3e726168 	0x3e726168
    10b4:	6e657300 	0x6e657300
    10b8:	65735f64 	0x65735f64
    10bc:	6c616972 	0x6c616972
    10c0:	7274735f 	0x7274735f
    10c4:	706e755f 	0x706e755f
    10c8:	3c6b6361 	0x3c6b6361
    10cc:	72616863 	0x72616863
    10d0:	6863202c 	0x6863202c
    10d4:	202c7261 	addi	t4,at,29281
    10d8:	72616863 	0x72616863
    10dc:	5a5f003e 	0x5a5f003e
    10e0:	65723631 	0x65723631
    10e4:	735f6461 	0x735f6461
    10e8:	61697265 	0x61697265
    10ec:	68635f6c 	0x68635f6c
    10f0:	00767261 	0x767261
    10f4:	646e6573 	0x646e6573
    10f8:	7265735f 	0x7265735f
    10fc:	5f6c6169 	0x5f6c6169
    1100:	3c727473 	0x3c727473
    1104:	003e3331 	tgeu	at,s8,0xcc
    1108:	364e5a5f 	ori	t6,s2,0x5a5f
    110c:	6d695f5f 	0x6d695f5f
    1110:	32326c70 	andi	s2,s1,0x6c70
    1114:	646e6573 	0x646e6573
    1118:	7265735f 	0x7265735f
    111c:	5f6c6169 	0x5f6c6169
    1120:	5f727473 	0x5f727473
    1124:	61706e75 	0x61706e75
    1128:	4a496b63 	c2	0x496b63
    112c:	63636363 	0x63636363
    1130:	63636363 	0x63636363
    1134:	63636363 	0x63636363
    1138:	45454563 	0x45454563
    113c:	70446876 	0x70446876
    1140:	5f005f54 	bgtzl	t8,18e94 <_data-0x7ffe716c>
    1144:	5f364e5a 	0x5f364e5a
    1148:	706d695f 	0x706d695f
    114c:	7332326c 	0x7332326c
    1150:	5f646e65 	0x5f646e65
    1154:	69726573 	0x69726573
    1158:	735f6c61 	0x735f6c61
    115c:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
    1160:	6361706e 	0x6361706e
    1164:	634a496b 	0x634a496b
    1168:	76454545 	jalx	9151514 <_data-0x76eaeaec>
    116c:	54704468 	bnel	v1,s0,12310 <_data-0x7ffedcf0>
    1170:	5a5f005f 	0x5a5f005f
    1174:	65733931 	0x65733931
    1178:	735f646e 	0x735f646e
    117c:	61697265 	0x61697265
    1180:	6e695f6c 	0x6e695f6c
    1184:	65676574 	0x65676574
    1188:	5f006972 	bgtzl	t8,1b754 <_data-0x7ffe48ac>
    118c:	7335315a 	0x7335315a
    1190:	5f646e65 	0x5f646e65
    1194:	69726573 	0x69726573
    1198:	735f6c61 	0x735f6c61
    119c:	4c497274 	0x4c497274
    11a0:	4531316a 	0x4531316a
    11a4:	41527645 	0x41527645
    11a8:	4b5f5f54 	c2	0x15f5f54
    11ac:	65730063 	0x65730063
    11b0:	735f646e 	0x735f646e
    11b4:	61697265 	0x61697265
    11b8:	68635f6c 	0x68635f6c
    11bc:	5f007261 	bgtzl	t8,1db44 <_data-0x7ffe24bc>
    11c0:	5f364e5a 	0x5f364e5a
    11c4:	706d695f 	0x706d695f
    11c8:	7339316c 	0x7339316c
    11cc:	5f646e65 	0x5f646e65
    11d0:	69726573 	0x69726573
    11d4:	735f6c61 	0x735f6c61
    11d8:	615f7274 	0x615f7274
    11dc:	4c497272 	0x4c497272
    11e0:	4a45396a 	c2	0x45396a
    11e4:	45306a4c 	0x45306a4c
    11e8:	45316a4c 	0x45316a4c
    11ec:	45326a4c 	0x45326a4c
    11f0:	45336a4c 	0x45336a4c
    11f4:	45346a4c 	0x45346a4c
    11f8:	45356a4c 	0x45356a4c
    11fc:	45366a4c 	0x45366a4c
    1200:	45376a4c 	0x45376a4c
    1204:	45386a4c 	0x45386a4c
    1208:	76454545 	jalx	9151514 <_data-0x76eaeaec>
    120c:	5f544152 	0x5f544152
    1210:	4e634b5f 	c3	0x634b5f
    1214:	37315f53 	ori	s1,t9,0x5f53
    1218:	69736e75 	0x69736e75
    121c:	64656e67 	0x64656e67
    1220:	7165735f 	0x7165735f
    1224:	636e6575 	0x636e6575
    1228:	584a4965 	0x584a4965
    122c:	30547073 	andi	s4,v0,0x7073
    1230:	4545455f 	0x4545455f
    1234:	5a5f0045 	0x5a5f0045
    1238:	65733631 	0x65733631
    123c:	735f646e 	0x735f646e
    1240:	61697265 	0x61697265
    1244:	68635f6c 	0x68635f6c
    1248:	00687261 	0x687261
    124c:	646e6573 	0x646e6573
    1250:	7265735f 	0x7265735f
    1254:	5f6c6169 	0x5f6c6169
    1258:	5f727473 	0x5f727473
    125c:	3c727261 	0x3c727261
    1260:	202c3332 	addi	t4,at,13106
    1264:	31202c30 	andi	zero,t1,0x2c30
    1268:	2c32202c 	sltiu	s2,at,8236
    126c:	202c3320 	addi	t4,at,13088
    1270:	35202c34 	ori	zero,t1,0x2c34
    1274:	2c36202c 	sltiu	s6,at,8236
    1278:	202c3720 	addi	t4,at,14112
    127c:	39202c38 	xori	zero,t1,0x2c38
    1280:	3031202c 	andi	s1,at,0x202c
    1284:	3131202c 	andi	s1,t1,0x202c
    1288:	3231202c 	andi	s1,s1,0x202c
    128c:	3331202c 	andi	s1,t9,0x202c
    1290:	3431202c 	ori	s1,at,0x202c
    1294:	3531202c 	ori	s1,t1,0x202c
    1298:	3631202c 	ori	s1,s1,0x202c
    129c:	3731202c 	ori	s1,t9,0x202c
    12a0:	3831202c 	xori	s1,at,0x202c
    12a4:	3931202c 	xori	s1,t1,0x202c
    12a8:	3032202c 	andi	s2,at,0x202c
    12ac:	3132202c 	andi	s2,t1,0x202c
    12b0:	3232202c 	andi	s2,s1,0x202c
    12b4:	5a5f003e 	0x5a5f003e
    12b8:	73693332 	0x73693332
    12bc:	7265735f 	0x7265735f
    12c0:	5f6c6169 	0x5f6c6169
    12c4:	64616572 	0x64616572
    12c8:	6f745f79 	0x6f745f79
    12cc:	6165725f 	0x6165725f
    12d0:	74007664 	jalx	1d990 <_data-0x7ffe2670>
    12d4:	5f747365 	0x5f747365
    12d8:	69726573 	0x69726573
    12dc:	675f6c61 	0x675f6c61
    12e0:	2e6f6970 	sltiu	t7,s3,26992
    12e4:	00707063 	0x707063
    12e8:	646e6573 	0x646e6573
    12ec:	7265735f 	0x7265735f
    12f0:	5f6c6169 	0x5f6c6169
    12f4:	5f727473 	0x5f727473
    12f8:	61706e75 	0x61706e75
    12fc:	633c6b63 	0x633c6b63
    1300:	2c726168 	sltiu	s2,v1,24936
    1304:	61686320 	0x61686320
    1308:	63202c72 	0x63202c72
    130c:	2c726168 	sltiu	s2,v1,24936
    1310:	61686320 	0x61686320
    1314:	63202c72 	0x63202c72
    1318:	2c726168 	sltiu	s2,v1,24936
    131c:	61686320 	0x61686320
    1320:	63202c72 	0x63202c72
    1324:	2c726168 	sltiu	s2,v1,24936
    1328:	61686320 	0x61686320
    132c:	63202c72 	0x63202c72
    1330:	2c726168 	sltiu	s2,v1,24936
    1334:	61686320 	0x61686320
    1338:	63202c72 	0x63202c72
    133c:	2c726168 	sltiu	s2,v1,24936
    1340:	61686320 	0x61686320
    1344:	63202c72 	0x63202c72
    1348:	2c726168 	sltiu	s2,v1,24936
    134c:	61686320 	0x61686320
    1350:	63202c72 	0x63202c72
    1354:	2c726168 	sltiu	s2,v1,24936
    1358:	61686320 	0x61686320
    135c:	63202c72 	0x63202c72
    1360:	2c726168 	sltiu	s2,v1,24936
    1364:	61686320 	0x61686320
    1368:	63202c72 	0x63202c72
    136c:	2c726168 	sltiu	s2,v1,24936
    1370:	61686320 	0x61686320
    1374:	63202c72 	0x63202c72
    1378:	3e726168 	0x3e726168
    137c:	325a5f00 	andi	k0,s2,0x5f00
    1380:	74657330 	jalx	195ccc0 <_data-0x7e6a3340>
    1384:	6765735f 	0x6765735f
    1388:	746e656d 	jalx	1b995b4 <_data-0x7e466a4c>
    138c:	7369645f 	0x7369645f
    1390:	79616c70 	0x79616c70
    1394:	5f006873 	bgtzl	t8,1b564 <_data-0x7ffe4a9c>
    1398:	5f364e5a 	0x5f364e5a
    139c:	706d695f 	0x706d695f
    13a0:	7332326c 	0x7332326c
    13a4:	5f646e65 	0x5f646e65
    13a8:	69726573 	0x69726573
    13ac:	735f6c61 	0x735f6c61
    13b0:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
    13b4:	6361706e 	0x6361706e
    13b8:	634a496b 	0x634a496b
    13bc:	63636363 	0x63636363
    13c0:	63636363 	0x63636363
    13c4:	45636363 	0x45636363
    13c8:	68764545 	0x68764545
    13cc:	5f547044 	0x5f547044
    13d0:	6e657300 	0x6e657300
    13d4:	65735f64 	0x65735f64
    13d8:	6c616972 	0x6c616972
    13dc:	7274735f 	0x7274735f
    13e0:	706e755f 	0x706e755f
    13e4:	3c6b6361 	0x3c6b6361
    13e8:	72616863 	0x72616863
    13ec:	6863202c 	0x6863202c
    13f0:	202c7261 	addi	t4,at,29281
    13f4:	72616863 	0x72616863
    13f8:	6863202c 	0x6863202c
    13fc:	202c7261 	addi	t4,at,29281
    1400:	72616863 	0x72616863
    1404:	6863202c 	0x6863202c
    1408:	003e7261 	0x3e7261
    140c:	6d695f5f 	0x6d695f5f
    1410:	5f006c70 	bgtzl	t8,1c5d4 <_data-0x7ffe3a2c>
    1414:	5f364e5a 	0x5f364e5a
    1418:	706d695f 	0x706d695f
    141c:	7332326c 	0x7332326c
    1420:	5f646e65 	0x5f646e65
    1424:	69726573 	0x69726573
    1428:	735f6c61 	0x735f6c61
    142c:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
    1430:	6361706e 	0x6361706e
    1434:	634a496b 	0x634a496b
    1438:	63636363 	0x63636363
    143c:	63636363 	0x63636363
    1440:	63636363 	0x63636363
    1444:	45454563 	0x45454563
    1448:	70446876 	0x70446876
    144c:	73005f54 	0x73005f54
    1450:	5f646e65 	0x5f646e65
    1454:	69726573 	0x69726573
    1458:	735f6c61 	0x735f6c61
    145c:	755f7274 	jalx	57dc9d0 <_data-0x7a823630>
    1460:	6361706e 	0x6361706e
    1464:	68633c6b 	0x68633c6b
    1468:	202c7261 	addi	t4,at,29281
    146c:	72616863 	0x72616863
    1470:	6863202c 	0x6863202c
    1474:	202c7261 	addi	t4,at,29281
    1478:	72616863 	0x72616863
    147c:	6863202c 	0x6863202c
    1480:	202c7261 	addi	t4,at,29281
    1484:	72616863 	0x72616863
    1488:	6863202c 	0x6863202c
    148c:	202c7261 	addi	t4,at,29281
    1490:	72616863 	0x72616863
    1494:	5a5f003e 	0x5a5f003e
    1498:	5f5f364e 	0x5f5f364e
    149c:	6c706d69 	0x6c706d69
    14a0:	65733232 	0x65733232
    14a4:	735f646e 	0x735f646e
    14a8:	61697265 	0x61697265
    14ac:	74735f6c 	jalx	1cd7db0 <_data-0x7e328250>
    14b0:	6e755f72 	0x6e755f72
    14b4:	6b636170 	0x6b636170
    14b8:	63634a49 	0x63634a49
    14bc:	63636363 	0x63636363
    14c0:	63636363 	0x63636363
    14c4:	63636363 	0x63636363
    14c8:	63636363 	0x63636363
    14cc:	45636363 	0x45636363
    14d0:	68764545 	0x68764545
    14d4:	5f547044 	0x5f547044
    14d8:	4e5a5f00 	c3	0x5a5f00
    14dc:	695f5f36 	0x695f5f36
    14e0:	326c706d 	andi	t4,s3,0x706d
    14e4:	6e657332 	0x6e657332
    14e8:	65735f64 	0x65735f64
    14ec:	6c616972 	0x6c616972
    14f0:	7274735f 	0x7274735f
    14f4:	706e755f 	0x706e755f
    14f8:	496b6361 	0x496b6361
    14fc:	6363634a 	0x6363634a
    1500:	63636363 	0x63636363
    1504:	63636363 	0x63636363
    1508:	63636363 	0x63636363
    150c:	45636363 	0x45636363
    1510:	68764545 	0x68764545
    1514:	5f547044 	0x5f547044
    1518:	4e5a5f00 	c3	0x5a5f00
    151c:	695f5f36 	0x695f5f36
    1520:	326c706d 	andi	t4,s3,0x706d
    1524:	6e657332 	0x6e657332
    1528:	65735f64 	0x65735f64
    152c:	6c616972 	0x6c616972
    1530:	7274735f 	0x7274735f
    1534:	706e755f 	0x706e755f
    1538:	496b6361 	0x496b6361
    153c:	6363634a 	0x6363634a
    1540:	63636363 	0x63636363
    1544:	63636363 	0x63636363
    1548:	63636363 	0x63636363
    154c:	45456363 	0x45456363
    1550:	44687645 	0x44687645
    1554:	005f5470 	tge	v0,ra,0x151
    1558:	6c697475 	0x6c697475
    155c:	2f797469 	sltiu	t9,k1,29801
    1560:	72617473 	0x72617473
    1564:	2e707574 	sltiu	s0,s3,30068
    1568:	6d2f0053 	0x6d2f0053
    156c:	632f746e 	0x632f746e
    1570:	6573552f 	0x6573552f
    1574:	462f7372 	c1	0x2f7372
    1578:	6f746361 	0x6f746361
    157c:	6c616972 	0x6c616972
    1580:	6f642f4e 	0x6f642f4e
    1584:	6f6c6e77 	0x6f6c6e77
    1588:	2f736461 	sltiu	s3,k1,25697
    158c:	76697254 	jalx	9a5c950 <_data-0x765a36b0>
    1590:	4d6c6169 	0x4d6c6169
    1594:	5f535049 	0x5f535049
    1598:	74666f53 	jalx	199bd4c <_data-0x7e6642b4>
    159c:	65726177 	0x65726177
    15a0:	7070632f 	0x7070632f
    15a4:	554e4700 	bnel	t2,t6,131a8 <_data-0x7ffece58>
    15a8:	20534120 	addi	s3,v0,16672
    15ac:	30332e32 	andi	s3,at,0x2e32
    15b0:	30706300 	andi	s0,v1,0x6300
    15b4:	6461625f 	0x6461625f
    15b8:	64646176 	0x64646176
    15bc:	58450072 	0x58450072
    15c0:	54504543 	bnel	v0,s0,12ad0 <_data-0x7ffed530>
    15c4:	5f4e4f49 	0x5f4e4f49
    15c8:	5353454d 	beql	k0,s3,12b00 <_data-0x7ffed500>
    15cc:	53454741 	beql	k0,a1,132d4 <_data-0x7ffecd2c>
    15d0:	30706300 	andi	s0,v1,0x6300
    15d4:	7561635f 	jalx	5858d7c <_data-0x7a7a7284>
    15d8:	70006573 	0x70006573
    15dc:	746e6972 	jalx	1b9a5c8 <_data-0x7e465a38>
    15e0:	626c745f 	0x626c745f
    15e4:	6f425f00 	0x6f425f00
    15e8:	63006c6f 	0x63006c6f
    15ec:	655f3070 	0x655f3070
    15f0:	5f006370 	bgtzl	t8,1a3b4 <_data-0x7ffe5c4c>
    15f4:	6e69616d 	0x6e69616d
    15f8:	65675f00 	0x65675f00
    15fc:	61635f74 	0x61635f74
    1600:	00657375 	0x657375
    1604:	7373625f 	0x7373625f
    1608:	69727700 	0x69727700
    160c:	6c5f6574 	0x6c5f6574
    1610:	62006465 	0x62006465
    1614:	5f657479 	0x5f657479
    1618:	675f0074 	0x675f0074
    161c:	655f7465 	0x655f7465
    1620:	73006370 	0x73006370
    1624:	74726f68 	jalx	1c9bda0 <_data-0x7e364260>
    1628:	736e7520 	0x736e7520
    162c:	656e6769 	0x656e6769
    1630:	6e692064 	0x6e692064
    1634:	6e690074 	0x6e690074
    1638:	735f7469 	0x735f7469
    163c:	61697265 	0x61697265
    1640:	625f006c 	0x625f006c
    1644:	655f7373 	0x655f7373
    1648:	6d00646e 	0x6d00646e
    164c:	65736d65 	0x65736d65
    1650:	72700074 	0x72700074
    1654:	5f746e69 	0x5f746e69
    1658:	70617274 	0x70617274
    165c:	6d617266 	0x6d617266
    1660:	70630065 	0x70630065
    1664:	74735f30 	jalx	1cd7cc0 <_data-0x7e328340>
    1668:	73757461 	0x73757461
    166c:	646f6300 	0x646f6300
    1670:	6e650065 	0x6e650065
    1674:	5f797274 	0x5f797274
    1678:	315f6f6c 	andi	ra,t2,0x6f6c
    167c:	78655f00 	0x78655f00
    1680:	74706563 	jalx	1c1958c <_data-0x7e3e6a74>
    1684:	5f6e6f69 	0x5f6e6f69
    1688:	646e6168 	0x646e6168
    168c:	0072656c 	0x72656c
    1690:	64646170 	0x64646170
    1694:	00676e69 	0x676e69
    1698:	746e6975 	jalx	1b9a5d4 <_data-0x7e465a2c>
    169c:	00745f38 	0x745f38
    16a0:	72746e65 	0x72746e65
    16a4:	6f6c5f79 	0x6f6c5f79
    16a8:	4700325f 	c1	0x100325f
    16ac:	4320554e 	c0	0x120554e
    16b0:	37203131 	ori	zero,t9,0x3131
    16b4:	302e342e 	andi	t6,at,0x342e
    16b8:	656d2d20 	0x656d2d20
    16bc:	6d2d206c 	0x6d2d206c
    16c0:	676e6973 	0x676e6973
    16c4:	662d656c 	0x662d656c
    16c8:	74616f6c 	jalx	185bdb0 <_data-0x7e7a4250>
    16cc:	786d2d20 	0x786d2d20
    16d0:	20746f67 	addi	s4,v1,28519
    16d4:	6f6e6d2d 	0x6f6e6d2d
    16d8:	6962612d 	0x6962612d
    16dc:	6c6c6163 	0x6c6c6163
    16e0:	6d2d2073 	0x6d2d2073
    16e4:	64726168 	0x64726168
    16e8:	6f6c662d 	0x6f6c662d
    16ec:	2d207461 	sltiu	zero,t1,29793
    16f0:	7370696d 	0x7370696d
    16f4:	2d203233 	sltiu	zero,t1,12851
    16f8:	736c6c6d 	0x736c6c6d
    16fc:	6d2d2063 	0x6d2d2063
    1700:	6c2d6f6e 	0x6c2d6f6e
    1704:	2d316378 	sltiu	s1,t1,25464
    1708:	31637873 	andi	v1,t3,0x7873
    170c:	6e6d2d20 	0x6e6d2d20
    1710:	616d2d6f 	0x616d2d6f
    1714:	20346464 	addi	s4,at,25700
    1718:	6f6e6d2d 	0x6f6e6d2d
    171c:	6168732d 	0x6168732d
    1720:	20646572 	addi	a0,v1,25970
    1724:	62616d2d 	0x62616d2d
    1728:	32333d69 	andi	s3,s1,0x3d69
    172c:	20672d20 	addi	a3,v1,11552
    1730:	20734f2d 	addi	s3,v1,20269
    1734:	7566662d 	jalx	59998b4 <_data-0x7a66674c>
    1738:	6974636e 	0x6974636e
    173c:	732d6e6f 	0x732d6e6f
    1740:	69746365 	0x69746365
    1744:	20736e6f 	addi	s3,v1,28271
    1748:	6164662d 	0x6164662d
    174c:	732d6174 	0x732d6174
    1750:	69746365 	0x69746365
    1754:	20736e6f 	addi	s3,v1,28271
    1758:	7266662d 	0x7266662d
    175c:	74736565 	jalx	1cd9594 <_data-0x7e326a6c>
    1760:	69646e61 	0x69646e61
    1764:	2d20676e 	sltiu	zero,t1,26478
    1768:	2d6f6e66 	sltiu	t7,t3,28262
    176c:	6c697562 	0x6c697562
    1770:	206e6974 	addi	t6,v1,26996
    1774:	6f6e662d 	0x6f6e662d
    1778:	4549502d 	0x4549502d
    177c:	73736200 	0x73736200
    1780:	7a69735f 	0x7a69735f
    1784:	72770065 	0x72770065
    1788:	5f657469 	0x5f657469
    178c:	6d676573 	0x6d676573
    1790:	00746e65 	0x746e65
    1794:	6e697270 	0x6e697270
    1798:	73006674 	0x73006674
    179c:	74726f68 	jalx	1c9bda0 <_data-0x7e364260>
    17a0:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
    17a4:	30706300 	andi	s0,v1,0x6300
    17a8:	6162655f 	0x6162655f
    17ac:	75006573 	jalx	40195cc <_data-0x7bfe6a34>
    17b0:	31746e69 	andi	s4,t3,0x6e69
    17b4:	00745f36 	tne	v1,s4,0x17c
    17b8:	746e6975 	jalx	1b9a5d4 <_data-0x7e465a2c>
    17bc:	745f3233 	jalx	17cc8cc <_data-0x7e833734>
    17c0:	6e6f6c00 	0x6e6f6c00
    17c4:	6e692067 	0x6e692067
    17c8:	6e650074 	0x6e650074
    17cc:	5f797274 	0x5f797274
    17d0:	70006968 	0x70006968
    17d4:	00737475 	0x737475
    17d8:	6c697475 	0x6c697475
    17dc:	2f797469 	sltiu	t9,k1,29801
    17e0:	6e69616d 	0x6e69616d
    17e4:	7200632e 	0x7200632e
    17e8:	6c757365 	0x6c757365
    17ec:	73610074 	0x73610074
    17f0:	74726573 	jalx	1c995cc <_data-0x7e366a34>
    17f4:	006e6f69 	0x6e6f69
    17f8:	70617274 	0x70617274
    17fc:	6d617266 	0x6d617266
    1800:	00745f65 	0x745f65
    1804:	63747570 	0x63747570
    1808:	00726168 	0x726168
    180c:	6e697270 	0x6e697270
    1810:	73616274 	0x73616274
    1814:	72700065 	0x72700065
    1818:	66746e69 	0x66746e69
    181c:	6100632e 	0x6100632e
    1820:	6e696167 	0x6e696167
    1824:	6e6d2f00 	0x6e6d2f00
    1828:	2f632f74 	sltiu	v1,k1,12148
    182c:	72657355 	0x72657355
    1830:	61462f73 	0x61462f73
    1834:	726f7463 	0x726f7463
    1838:	4e6c6169 	c3	0x6c6169
    183c:	776f642f 	jalx	dbd90bc <_data-0x72426f44>
    1840:	616f6c6e 	0x616f6c6e
    1844:	542f7364 	bnel	at,t7,1e5d8 <_data-0x7ffe1a28>
    1848:	69766972 	0x69766972
    184c:	494d6c61 	0x494d6c61
    1850:	535f5350 	beql	k0,ra,16594 <_data-0x7ffe9a6c>
    1854:	7774666f 	jalx	dd199bc <_data-0x722e6644>
    1858:	2f657261 	sltiu	a1,k1,29281
    185c:	2f707063 	sltiu	s0,k1,28771
    1860:	0062696c 	0x62696c
    1864:	73747570 	0x73747570
    1868:	6e697274 	0x6e697274
    186c:	61760067 	0x61760067
    1870:	0065756c 	0x65756c
    1874:	6e697270 	0x6e697270
    1878:	73616274 	0x73616274
    187c:	00632e65 	0x632e65
    1880:	6e676973 	0x6e676973
    1884:	6d656d00 	0x6d656d00
    1888:	65766f6d 	0x65766f6d
    188c:	657a6200 	0x657a6200
    1890:	73006f72 	0x73006f72
    1894:	6e697274 	0x6e697274
    1898:	00632e67 	0x632e67
    189c:	657a6973 	0x657a6973
    18a0:	6d00745f 	0x6d00745f
    18a4:	6d636d65 	0x6d636d65
    18a8:	74730070 	jalx	1cc01c0 <_data-0x7e33fe40>
    18ac:	70636e72 	0x70636e72
    18b0:	74730079 	jalx	1cc01e4 <_data-0x7e33fe1c>
    18b4:	656c6e72 	0x656c6e72
    18b8:	7473006e 	jalx	1cc01b8 <_data-0x7e33fe48>
    18bc:	72686372 	0x72686372
    18c0:	72747300 	0x72747300
    18c4:	00797063 	0x797063
    18c8:	63727473 	0x63727473
    18cc:	6d00706d 	0x6d00706d
    18d0:	70636d65 	0x70636d65
    18d4:	74730079 	jalx	1cc01e4 <_data-0x7e33fe1c>
    18d8:	6e656c72 	0x6e656c72
    18dc:	72747300 	0x72747300
    18e0:	706d636e 	0x706d636e
    18e4:	72747300 	0x72747300
    18e8:	646e6966 	0x646e6966
    18ec:	74757000 	jalx	1d5c000 <_data-0x7e2a4000>
    18f0:	00632e73 	tltu	v1,v1,0xb9
    18f4:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
    18f8:	65735f65 	0x65735f65
    18fc:	6c616972 	0x6c616972
    1900:	74757000 	jalx	1d5c000 <_data-0x7e2a4000>
    1904:	72616863 	0x72616863
    1908:	7700632e 	jalx	c018cb8 <_data-0x73fe7348>
    190c:	65746972 	0x65746972
    1910:	6f77685f 	0x6f77685f
    1914:	5f006472 	bgtzl	t8,1aae0 <_data-0x7ffe5520>
    1918:	7277355a 	0x7277355a
    191c:	49657469 	0x49657469
    1920:	5076456a 	beql	v1,s6,12ecc <_data-0x7ffed134>
    1924:	005f5476 	tne	v0,ra,0x151
    1928:	64616572 	0x64616572
    192c:	6977735f 	0x6977735f
    1930:	65686374 	0x65686374
    1934:	72770073 	0x72770073
    1938:	5f657469 	0x5f657469
    193c:	64726f77 	0x64726f77
    1940:	74616400 	jalx	1859000 <_data-0x7e7a7000>
    1944:	72770061 	0x72770061
    1948:	5f657469 	0x5f657469
    194c:	65747962 	0x65747962
    1950:	345a5f00 	ori	k0,v0,0x5f00
    1954:	64616572 	0x64616572
    1958:	54456d49 	bnel	v0,a1,1ce80 <_data-0x7ffe3180>
    195c:	0076505f 	0x76505f
    1960:	746e6975 	jalx	1b9a5d4 <_data-0x7e465a2c>
    1964:	745f3436 	jalx	17cd0d8 <_data-0x7e832f28>
    1968:	69727700 	0x69727700
    196c:	753c6574 	jalx	4f195d0 <_data-0x7b0e6a30>
    1970:	6769736e 	0x6769736e
    1974:	2064656e 	addi	a0,v1,25966
    1978:	72616863 	0x72616863
    197c:	6572003e 	0x6572003e
    1980:	685f6461 	0x685f6461
    1984:	64726f77 	0x64726f77
    1988:	355a5f00 	ori	k0,t2,0x5f00
    198c:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
    1990:	456d4965 	0x456d4965
    1994:	54765076 	bnel	v1,s6,15b70 <_data-0x7ffea490>
    1998:	5a5f005f 	0x5a5f005f
    199c:	61657234 	0x61657234
    19a0:	45744964 	0x45744964
    19a4:	76505f54 	jalx	9417d50 <_data-0x76be82b0>
    19a8:	69727700 	0x69727700
    19ac:	6c3c6574 	0x6c3c6574
    19b0:	20676e6f 	addi	a3,v1,28271
    19b4:	69736e75 	0x69736e75
    19b8:	64656e67 	0x64656e67
    19bc:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
    19c0:	7277003e 	0x7277003e
    19c4:	5f657469 	0x5f657469
    19c8:	726f7764 	0x726f7764
    19cc:	65720064 	0x65720064
    19d0:	6c3c6461 	0x6c3c6461
    19d4:	20676e6f 	addi	a3,v1,28271
    19d8:	69736e75 	0x69736e75
    19dc:	64656e67 	0x64656e67
    19e0:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
    19e4:	6572003e 	0x6572003e
    19e8:	735f6461 	0x735f6461
    19ec:	61697265 	0x61697265
    19f0:	6f775f6c 	0x6f775f6c
    19f4:	64006472 	0x64006472
    19f8:	64726f77 	0x64726f77
    19fc:	5f00745f 	bgtzl	t8,1eb7c <_data-0x7ffe1484>
    1a00:	6572345a 	0x6572345a
    1a04:	68496461 	0x68496461
    1a08:	505f5445 	beql	v0,ra,16b20 <_data-0x7ffe94e0>
    1a0c:	72770076 	0x72770076
    1a10:	3c657469 	0x3c657469
    1a14:	726f6873 	0x726f6873
    1a18:	6e752074 	0x6e752074
    1a1c:	6e676973 	0x6e676973
    1a20:	69206465 	0x69206465
    1a24:	003e746e 	0x3e746e
    1a28:	64616572 	0x64616572
    1a2c:	736e753c 	0x736e753c
    1a30:	656e6769 	0x656e6769
    1a34:	68632064 	0x68632064
    1a38:	003e7261 	0x3e7261
    1a3c:	6863616d 	0x6863616d
    1a40:	2e656e69 	sltiu	a1,s3,28265
    1a44:	00707063 	0x707063
    1a48:	64616572 	0x64616572
    1a4c:	6f77645f 	0x6f77645f
    1a50:	5f006472 	bgtzl	t8,1ac1c <_data-0x7ffe53e4>
    1a54:	7277355a 	0x7277355a
    1a58:	49657469 	0x49657469
    1a5c:	50764568 	beql	v1,s6,13000 <_data-0x7ffed000>
    1a60:	005f5476 	tne	v0,ra,0x151
    1a64:	64616572 	0x64616572
    1a68:	736e753c 	0x736e753c
    1a6c:	656e6769 	0x656e6769
    1a70:	6e692064 	0x6e692064
    1a74:	5f003e74 	bgtzl	t8,11448 <_data-0x7ffeebb8>
    1a78:	7277355a 	0x7277355a
    1a7c:	49657469 	0x49657469
    1a80:	50764574 	beql	v1,s6,13054 <_data-0x7ffecfac>
    1a84:	005f5476 	tne	v0,ra,0x151
    1a88:	72345a5f 	0x72345a5f
    1a8c:	49646165 	0x49646165
    1a90:	5f54456a 	0x5f54456a
    1a94:	72007650 	0x72007650
    1a98:	5f646165 	0x5f646165
    1a9c:	69726573 	0x69726573
    1aa0:	72006c61 	0x72006c61
    1aa4:	5f646165 	0x5f646165
    1aa8:	64726f77 	0x64726f77
    1aac:	61657200 	0x61657200
    1ab0:	68733c64 	0x68733c64
    1ab4:	2074726f 	addi	s4,v1,29295
    1ab8:	69736e75 	0x69736e75
    1abc:	64656e67 	0x64656e67
    1ac0:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
    1ac4:	7768003e 	jalx	da000f8 <_data-0x725fff08>
    1ac8:	5f64726f 	0x5f64726f
    1acc:	65720074 	0x65720074
    1ad0:	625f6461 	0x625f6461
    1ad4:	00657479 	0x657479
    1ad8:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
    1adc:	6e753c65 	0x6e753c65
    1ae0:	6e676973 	0x6e676973
    1ae4:	69206465 	0x69206465
    1ae8:	003e746e 	0x3e746e

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
  18:	880005c0 	lwl	zero,1472(zero)
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
  5c:	88000688 	lwl	zero,1672(zero)
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
  88:	88000720 	lwl	zero,1824(zero)
  8c:	00000068 	0x68
  90:	44280e44 	0x44280e44
  94:	92500391 	lbu	s0,913(s2)
  98:	9f049002 	0x9f049002
  9c:	0e500201 	jal	9400804 <_data-0x76bff7fc>
  a0:	d2d1d000 	0xd2d1d000
  a4:	000000df 	0xdf
  a8:	00000024 	and	zero,zero,zero
  ac:	00000000 	nop
  b0:	88000788 	lwl	zero,1928(zero)
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
  e8:	8800083c 	lwl	zero,2108(zero)
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
 128:	88000a60 	lwl	zero,2656(zero)
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
 1e4:	88000b38 	lwl	zero,2872(zero)
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
 244:	88000b5c 	lwl	zero,2908(zero)
 248:	00000060 	0x60
 24c:	50200e44 	beqzl	at,3b60 <_data-0x7fffc4a0>
 250:	03910292 	0x3910292
 254:	0490019f 	bltzal	a0,8d4 <_data-0x7ffff72c>
 258:	000e0a6c 	0xe0a6c
 25c:	dfd2d1d0 	ldc3	$18,-11824(s8)
 260:	0000000b 	movn	zero,zero,zero
 264:	00000018 	mult	zero,zero
 268:	0000022c 	0x22c
 26c:	88000bbc 	lwl	zero,3004(zero)
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
 298:	88000bec 	lwl	zero,3052(zero)
 29c:	0000002c 	0x2c
 2a0:	44180e44 	0x44180e44
 2a4:	9f480290 	0x9f480290
 2a8:	000e5c01 	0xe5c01
 2ac:	0000dfd0 	0xdfd0
