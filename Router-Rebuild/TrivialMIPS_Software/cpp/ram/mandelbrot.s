
mandelbrot.ram.elf:     file format elf32-tradlittlemips
mandelbrot.ram.elf


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
88000038:	0e0000d2 	jal	88000348 <_main>
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
88000240:	0e000144 	jal	88000510 <_exception_handler>
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
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:21
	{
		for(x = 0; x < w; x++) 
		{
			// calculate the initial real and imaginary part of z, based on the pixel location and zoom and position values
			pr = 1.5f * (x - w / 2) / (0.5f * zoom * w) + moveX;
			pi = (y - h / 2) / (0.5f * zoom * h) + moveY;
88000250:	3c028800 	lui	v0,0x8800
88000254:	c4450a20 	lwc1	$f5,2592(v0)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:20
			pr = 1.5f * (x - w / 2) / (0.5f * zoom * w) + moveX;
88000258:	3c028800 	lui	v0,0x8800
8800025c:	c4470a24 	lwc1	$f7,2596(v0)
88000260:	3c028800 	lui	v0,0x8800
88000264:	c4480a28 	lwc1	$f8,2600(v0)
88000268:	3c028800 	lui	v0,0x8800
8800026c:	c4490a2c 	lwc1	$f9,2604(v0)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:35
				oldIm = newIm;
				//the actual iteration, the real and imaginary part are calculated
				newRe = oldRe * oldRe - oldIm * oldIm + pr;
				newIm = 2.0f * oldRe * oldIm + pi;
				//if the point is outside the circle with radius 2: stop
				if((newRe * newRe + newIm * newIm) > 4) break;
88000270:	3c028800 	lui	v0,0x8800
88000274:	c44a0a30 	lwc1	$f10,2608(v0)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:15
	for(y = 0; y < h; y++)
88000278:	3c060007 	lui	a2,0x7
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:21
			pi = (y - h / 2) / (0.5f * zoom * h) + moveY;
8800027c:	44803000 	mtc1	zero,$f6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:4
{
88000280:	00002825 	move	a1,zero
88000284:	2407fed4 	li	a3,-300
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:26
			for(i = 0; i < maxIterations; i++)
88000288:	240a00ff 	li	t2,255
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:40
			}

			int color = i * 255 / maxIterations;

			gmem[w * y + x] = (color << 5) | (color << 2) | (color >> 1);
8800028c:	3c08a200 	lui	t0,0xa200
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:17
		for(x = 0; x < w; x++) 
88000290:	24090190 	li	t1,400
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:15
	for(y = 0; y < h; y++)
88000294:	24c65300 	addiu	a2,a2,21248
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:21
			pi = (y - h / 2) / (0.5f * zoom * h) + moveY;
88000298:	44870000 	mtc1	a3,$f0
8800029c:	2403fe70 	li	v1,-400
880002a0:	46800120 	cvt.s.w	$f4,$f0
880002a4:	46052103 	div.s	$f4,$f4,$f5
880002a8:	46062100 	add.s	$f4,$f4,$f6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:20
			pr = 1.5f * (x - w / 2) / (0.5f * zoom * w) + moveX;
880002ac:	44830000 	mtc1	v1,$f0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:26
			for(i = 0; i < maxIterations; i++)
880002b0:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:20
			pr = 1.5f * (x - w / 2) / (0.5f * zoom * w) + moveX;
880002b4:	468000e0 	cvt.s.w	$f3,$f0
880002b8:	460718c2 	mul.s	$f3,$f3,$f7
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:22
			newRe = newIm = oldRe = oldIm = 0; //these should start at 0,0
880002bc:	44800000 	mtc1	zero,$f0
880002c0:	46000046 	mov.s	$f1,$f0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:20
			pr = 1.5f * (x - w / 2) / (0.5f * zoom * w) + moveX;
880002c4:	460818c3 	div.s	$f3,$f3,$f8
880002c8:	460918c1 	sub.s	$f3,$f3,$f9
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:32
				newRe = oldRe * oldRe - oldIm * oldIm + pr;
880002cc:	460002c2 	mul.s	$f11,$f0,$f0
880002d0:	46010882 	mul.s	$f2,$f1,$f1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:33
				newIm = 2.0f * oldRe * oldIm + pi;
880002d4:	46010840 	add.s	$f1,$f1,$f1
880002d8:	46000802 	mul.s	$f0,$f1,$f0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:32
				newRe = oldRe * oldRe - oldIm * oldIm + pr;
880002dc:	460b1081 	sub.s	$f2,$f2,$f11
880002e0:	46031080 	add.s	$f2,$f2,$f3
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:33
				newIm = 2.0f * oldRe * oldIm + pi;
880002e4:	46040000 	add.s	$f0,$f0,$f4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:35
				if((newRe * newRe + newIm * newIm) > 4) break;
880002e8:	46021042 	mul.s	$f1,$f2,$f2
880002ec:	460002c2 	mul.s	$f11,$f0,$f0
880002f0:	460b0840 	add.s	$f1,$f1,$f11
880002f4:	4601503c 	c.lt.s	$f10,$f1
880002f8:	45010005 	bc1t	88000310 <_entry+0xc0>
880002fc:	00022140 	sll	a0,v0,0x5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:26 (discriminator 2)
			for(i = 0; i < maxIterations; i++)
88000300:	24420001 	addiu	v0,v0,1
88000304:	144afff2 	bne	v0,t2,880002d0 <_entry+0x80>
88000308:	46001046 	mov.s	$f1,$f2
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:40 (discriminator 2)
			gmem[w * y + x] = (color << 5) | (color << 2) | (color >> 1);
8800030c:	00022140 	sll	a0,v0,0x5
88000310:	00026080 	sll	t4,v0,0x2
88000314:	00a35821 	addu	t3,a1,v1
88000318:	008c2025 	or	a0,a0,t4
8800031c:	00021043 	sra	v0,v0,0x1
88000320:	010b5821 	addu	t3,t0,t3
88000324:	00821025 	or	v0,a0,v0
88000328:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:17 (discriminator 2)
		for(x = 0; x < w; x++) 
8800032c:	1469ffdf 	bne	v1,t1,880002ac <_entry+0x5c>
88000330:	a1620190 	sb	v0,400(t3)
88000334:	24a50320 	addiu	a1,a1,800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:15 (discriminator 2)
	for(y = 0; y < h; y++)
88000338:	14a6ffd7 	bne	a1,a2,88000298 <_entry+0x48>
8800033c:	24e70001 	addiu	a3,a3,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/mandelbrot.cpp:45
		}
	}

	return 0;
}
88000340:	03e00008 	jr	ra
88000344:	00001025 	move	v0,zero

88000348 <_main>:
_main():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:11
extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {
88000348:	27bdffe0 	addiu	sp,sp,-32
8800034c:	afbf001c 	sw	ra,28(sp)
88000350:	afb10018 	sw	s1,24(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:13

    init_serial();
88000354:	0e000268 	jal	880009a0 <init_serial>
88000358:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:15

    write_segment(0x04);
8800035c:	0e000283 	jal	88000a0c <write_segment>
88000360:	24040004 	li	a0,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:17

    puts("*****TrivialMIPS Bare Metal System*****");
88000364:	3c048800 	lui	a0,0x8800
88000368:	0e000251 	jal	88000944 <puts>
8800036c:	24840a34 	addiu	a0,a0,2612
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
88000370:	3c118000 	lui	s1,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
88000374:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
88000378:	3c108000 	lui	s0,0x8000
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
8800037c:	24840a5c 	addiu	a0,a0,2652
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
88000380:	26310000 	addiu	s1,s1,0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:19
    puts("Compilation time: " __TIME__ " " __DATE__);
88000384:	0e000251 	jal	88000944 <puts>
88000388:	26101000 	addiu	s0,s0,4096
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:24
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
8800038c:	02118023 	subu	s0,s0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:21
    write_segment(0x05);
88000390:	0e000283 	jal	88000a0c <write_segment>
88000394:	24040005 	li	a0,5
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:25
    if (bss_size > 0) {
88000398:	1a000009 	blez	s0,880003c0 <_main+0x78>
8800039c:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:26
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
880003a0:	02003025 	move	a2,s0
880003a4:	02202825 	move	a1,s1
880003a8:	0e000171 	jal	880005c4 <printf>
880003ac:	24840a84 	addiu	a0,a0,2692
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:27
        memset(&_bss, 0, bss_size);
880003b0:	02003025 	move	a2,s0
880003b4:	00002825 	move	a1,zero
880003b8:	0e000230 	jal	880008c0 <memset>
880003bc:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:30
    }

    write_segment(0x06);
880003c0:	0e000283 	jal	88000a0c <write_segment>
880003c4:	24040006 	li	a0,6
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:33

    // call the actual function
    int result = _entry();
880003c8:	0e000094 	jal	88000250 <_entry>
880003cc:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:34
    if (result == 0) {
880003d0:	1440000a 	bnez	v0,880003fc <_main+0xb4>
880003d4:	00402825 	move	a1,v0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:35
        puts("Program exited normally.");
880003d8:	3c048800 	lui	a0,0x8800
880003dc:	0e000251 	jal	88000944 <puts>
880003e0:	24840ac0 	addiu	a0,a0,2752
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}
880003e4:	8fbf001c 	lw	ra,28(sp)
880003e8:	8fb10018 	lw	s1,24(sp)
880003ec:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:40
    write_segment(0x07);
880003f0:	24040007 	li	a0,7
880003f4:	0a000283 	j	88000a0c <write_segment>
880003f8:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:37
        printf("Program exited abnormally with code %d.\n", result);
880003fc:	3c048800 	lui	a0,0x8800
88000400:	0e000171 	jal	880005c4 <printf>
88000404:	24840adc 	addiu	a0,a0,2780
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:42
}
88000408:	1000fff7 	b	880003e8 <_main+0xa0>
8800040c:	8fbf001c 	lw	ra,28(sp)

88000410 <print_trapframe>:
print_trapframe():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
88000410:	27bdffd0 	addiu	sp,sp,-48
88000414:	afb30024 	sw	s3,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
88000418:	3c138800 	lui	s3,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:62
void print_trapframe(trapframe_t *tf) {
8800041c:	afb40028 	sw	s4,40(sp)
88000420:	afb20020 	sw	s2,32(sp)
88000424:	afb1001c 	sw	s1,28(sp)
88000428:	afb00018 	sw	s0,24(sp)
8800042c:	afbf002c 	sw	ra,44(sp)
88000430:	00808025 	move	s0,a0
88000434:	24920028 	addiu	s2,a0,40
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
88000438:	24110001 	li	s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64
        printf("Register $%d: %p\n", i, tf->gpr[i]);
8800043c:	26730b08 	addiu	s3,s3,2824
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63
    for(int i = 1; i < 32; ++i) {
88000440:	24140020 	li	s4,32
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:64 (discriminator 3)
        printf("Register $%d: %p\n", i, tf->gpr[i]);
88000444:	8e460000 	lw	a2,0(s2)
88000448:	02202825 	move	a1,s1
8800044c:	02602025 	move	a0,s3
88000450:	0e000171 	jal	880005c4 <printf>
88000454:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:63 (discriminator 3)
    for(int i = 1; i < 32; ++i) {
88000458:	1634fffa 	bne	s1,s4,88000444 <print_trapframe+0x34>
8800045c:	26520004 	addiu	s2,s2,4
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:66
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
88000460:	8e020020 	lw	v0,32(s0)
88000464:	8e070018 	lw	a3,24(s0)
88000468:	afa20014 	sw	v0,20(sp)
8800046c:	8e02001c 	lw	v0,28(s0)
88000470:	8e060014 	lw	a2,20(s0)
88000474:	8e050010 	lw	a1,16(s0)
88000478:	3c048800 	lui	a0,0x8800
8800047c:	afa20010 	sw	v0,16(sp)
88000480:	0e000171 	jal	880005c4 <printf>
88000484:	24840b1c 	addiu	a0,a0,2844
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:67
}
88000488:	8fbf002c 	lw	ra,44(sp)
8800048c:	8fb40028 	lw	s4,40(sp)
88000490:	8fb30024 	lw	s3,36(sp)
88000494:	8fb20020 	lw	s2,32(sp)
88000498:	8fb1001c 	lw	s1,28(sp)
8800049c:	8fb00018 	lw	s0,24(sp)
880004a0:	03e00008 	jr	ra
880004a4:	27bd0030 	addiu	sp,sp,48

880004a8 <print_tlb>:
print_tlb():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69

void print_tlb() {
880004a8:	27bdffd8 	addiu	sp,sp,-40
880004ac:	afb1001c 	sw	s1,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
880004b0:	3c118800 	lui	s1,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:69
void print_tlb() {
880004b4:	afb20020 	sw	s2,32(sp)
880004b8:	afb00018 	sw	s0,24(sp)
880004bc:	afbf0024 	sw	ra,36(sp)
880004c0:	00008025 	move	s0,zero
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
880004c4:	26310b58 	addiu	s1,s1,2904
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
880004c8:	24120010 	li	s2,16
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:72 (discriminator 3)
        asm volatile(
880004cc:	40900000 	mtc0	s0,c0_index
880004d0:	42000001 	tlbr
880004d4:	40065000 	mfc0	a2,c0_entryhi
880004d8:	40071000 	mfc0	a3,c0_entrylo0
880004dc:	40021800 	mfc0	v0,c0_entrylo1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:81 (discriminator 3)
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
880004e0:	02002825 	move	a1,s0
880004e4:	afa20010 	sw	v0,16(sp)
880004e8:	02202025 	move	a0,s1
880004ec:	0e000171 	jal	880005c4 <printf>
880004f0:	26100001 	addiu	s0,s0,1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:70 (discriminator 3)
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
880004f4:	1612fff5 	bne	s0,s2,880004cc <print_tlb+0x24>
880004f8:	8fbf0024 	lw	ra,36(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:83
    }
}
880004fc:	8fb20020 	lw	s2,32(sp)
88000500:	8fb1001c 	lw	s1,28(sp)
88000504:	8fb00018 	lw	s0,24(sp)
88000508:	03e00008 	jr	ra
8800050c:	27bd0028 	addiu	sp,sp,40

88000510 <_exception_handler>:
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85

void _exception_handler(trapframe_t *tf, bool assertion) {
88000510:	27bdffe0 	addiu	sp,sp,-32
88000514:	afb10018 	sw	s1,24(sp)
88000518:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
8800051c:	3c048800 	lui	a0,0x8800
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
88000520:	afb00014 	sw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
88000524:	24840a34 	addiu	a0,a0,2612
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:85
void _exception_handler(trapframe_t *tf, bool assertion) {
88000528:	afbf001c 	sw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:86
    puts("*****TrivialMIPS Bare Metal System*****");
8800052c:	0e000251 	jal	88000944 <puts>
88000530:	00a08025 	move	s0,a1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:87
    if (assertion) {
88000534:	12000012 	beqz	s0,88000580 <_exception_handler+0x70>
88000538:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:88
        puts("CPU internal assertion failed, abort.");
8800053c:	3c048800 	lui	a0,0x8800
88000540:	0e000251 	jal	88000944 <puts>
88000544:	24840b90 	addiu	a0,a0,2960
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:89
        write_segment(0xdeaddead);
88000548:	3c04dead 	lui	a0,0xdead
8800054c:	0e000283 	jal	88000a0c <write_segment>
88000550:	3484dead 	ori	a0,a0,0xdead
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:96
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
88000554:	0e000104 	jal	88000410 <print_trapframe>
88000558:	02202025 	move	a0,s1
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:97
    print_tlb();
8800055c:	0e00012a 	jal	880004a8 <print_tlb>
88000560:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:99
    puts("*****System HANG*****");
}
88000564:	8fbf001c 	lw	ra,28(sp)
88000568:	8fb10018 	lw	s1,24(sp)
8800056c:	8fb00014 	lw	s0,20(sp)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:98
    puts("*****System HANG*****");
88000570:	3c048800 	lui	a0,0x8800
88000574:	24840bf4 	addiu	a0,a0,3060
88000578:	0a000251 	j	88000944 <puts>
8800057c:	27bd0020 	addiu	sp,sp,32
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
88000580:	40066800 	mfc0	a2,c0_cause
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:91
        word_t code = (_get_cause() >> 2) & 0xF;
88000584:	00063082 	srl	a2,a2,0x2
88000588:	30c6000f 	andi	a2,a2,0xf
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
8800058c:	3c038800 	lui	v1,0x8800
88000590:	00061080 	sll	v0,a2,0x2
88000594:	24630e80 	addiu	v1,v1,3712
88000598:	00431021 	addu	v0,v0,v1
8800059c:	8c470000 	lw	a3,0(v0)
880005a0:	3c048800 	lui	a0,0x8800
_get_epc():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:46
    asm(
880005a4:	40107000 	mfc0	s0,c0_epc
_exception_handler():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:93
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
880005a8:	24840bb8 	addiu	a0,a0,3000
880005ac:	0e000171 	jal	880005c4 <printf>
880005b0:	02002825 	move	a1,s0
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:94
        write_led((uint16_t) epc);
880005b4:	0e00027e 	jal	880009f8 <write_led>
880005b8:	3204ffff 	andi	a0,s0,0xffff
880005bc:	1000ffe5 	b	88000554 <_exception_handler+0x44>
880005c0:	00000000 	nop

880005c4 <printf>:
printf():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
int printf(const char *fmt, ...)
{
880005c4:	27bdffd0 	addiu	sp,sp,-48
880005c8:	afb00018 	sw	s0,24(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
880005cc:	27b00034 	addiu	s0,sp,52
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:2
{
880005d0:	afb30024 	sw	s3,36(sp)
880005d4:	afb20020 	sw	s2,32(sp)
880005d8:	afb1001c 	sw	s1,28(sp)
880005dc:	afbf002c 	sw	ra,44(sp)
880005e0:	afb40028 	sw	s4,40(sp)
880005e4:	00809025 	move	s2,a0
880005e8:	afa50034 	sw	a1,52(sp)
880005ec:	afa60038 	sw	a2,56(sp)
880005f0:	afa7003c 	sw	a3,60(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:8
	__builtin_va_start(ap, fmt);
880005f4:	afb00010 	sw	s0,16(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10
	arg = ap;
	for (i = 0; fmt[i]; i++)
880005f8:	00008825 	move	s1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
				break;
			}
		}
		else
		{
			if (c == '\n')
880005fc:	2413000a 	li	s3,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 1)
	for (i = 0; fmt[i]; i++)
88000600:	02511021 	addu	v0,s2,s1
88000604:	80540000 	lb	s4,0(v0)
88000608:	1680000a 	bnez	s4,88000634 <printf+0x70>
8800060c:	24020025 	li	v0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:85
				putchar('\r');
			putchar(c);
		}
	}
	return 0;
}
88000610:	8fbf002c 	lw	ra,44(sp)
88000614:	8fb40028 	lw	s4,40(sp)
88000618:	8fb30024 	lw	s3,36(sp)
8800061c:	8fb20020 	lw	s2,32(sp)
88000620:	8fb1001c 	lw	s1,28(sp)
88000624:	8fb00018 	lw	s0,24(sp)
88000628:	00001025 	move	v0,zero
8800062c:	03e00008 	jr	ra
88000630:	27bd0030 	addiu	sp,sp,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:13
		if (c == '%')
88000634:	16820066 	bne	s4,v0,880007d0 <printf+0x20c>
88000638:	24050001 	li	a1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
8800063c:	24060064 	li	a2,100
88000640:	24070025 	li	a3,37
88000644:	24080030 	li	t0,48
88000648:	02511021 	addu	v0,s2,s1
8800064c:	80420001 	lb	v0,1(v0)
88000650:	1046003a 	beq	v0,a2,8800073c <printf+0x178>
88000654:	28430065 	slti	v1,v0,101
88000658:	10600018 	beqz	v1,880006bc <printf+0xf8>
8800065c:	2843003a 	slti	v1,v0,58
88000660:	1060000c 	beqz	v1,88000694 <printf+0xd0>
88000664:	28430031 	slti	v1,v0,49
88000668:	1060004d 	beqz	v1,880007a0 <printf+0x1dc>
8800066c:	02512021 	addu	a0,s2,s1
88000670:	10470046 	beq	v0,a3,8800078c <printf+0x1c8>
88000674:	26340001 	addiu	s4,s1,1
88000678:	10480048 	beq	v0,t0,8800079c <printf+0x1d8>
8800067c:	02542021 	addu	a0,s2,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:73
				putchar('%');
88000680:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
88000684:	0e00025d 	jal	88000974 <putchar>
88000688:	26310001 	addiu	s1,s1,1
8800068c:	1000ffdd 	b	88000604 <printf+0x40>
88000690:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
88000694:	24030062 	li	v1,98
88000698:	10430036 	beq	v0,v1,88000774 <printf+0x1b0>
8800069c:	26340001 	addiu	s4,s1,1
880006a0:	24030063 	li	v1,99
880006a4:	1443fff6 	bne	v0,v1,88000680 <printf+0xbc>
880006a8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:25
				putchar((long)*arg);
880006ac:	0e00025d 	jal	88000974 <putchar>
880006b0:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
880006b4:	10000017 	b	88000714 <printf+0x150>
880006b8:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
880006bc:	24030070 	li	v1,112
880006c0:	1043002f 	beq	v0,v1,88000780 <printf+0x1bc>
880006c4:	28430071 	slti	v1,v0,113
880006c8:	10600008 	beqz	v1,880006ec <printf+0x128>
880006cc:	24030075 	li	v1,117
880006d0:	2403006c 	li	v1,108
880006d4:	10430020 	beq	v0,v1,88000758 <printf+0x194>
880006d8:	2403006f 	li	v1,111
880006dc:	1443ffe8 	bne	v0,v1,88000680 <printf+0xbc>
880006e0:	00003825 	move	a3,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:45
				printbase((long)*arg, w, 8, 0);
880006e4:	10000017 	b	88000744 <printf+0x180>
880006e8:	24060008 	li	a2,8
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:17
			switch (fmt[i + 1])
880006ec:	1043000d 	beq	v0,v1,88000724 <printf+0x160>
880006f0:	26340001 	addiu	s4,s1,1
880006f4:	24030078 	li	v1,120
880006f8:	10430021 	beq	v0,v1,88000780 <printf+0x1bc>
880006fc:	24030073 	li	v1,115
88000700:	1443ffe0 	bne	v0,v1,88000684 <printf+0xc0>
88000704:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:20
				putstring(*arg);
88000708:	0e000239 	jal	880008e4 <putstring>
8800070c:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
88000710:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
88000714:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:10 (discriminator 2)
	for (i = 0; fmt[i]; i++)
88000718:	26310001 	addiu	s1,s1,1
8800071c:	1000ffb9 	b	88000604 <printf+0x40>
88000720:	02511021 	addu	v0,s2,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:30
				printbase((long)*arg, w, 10, 0);
88000724:	00003825 	move	a3,zero
88000728:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
8800072c:	0e0001fa 	jal	880007e8 <printbase>
88000730:	8e040000 	lw	a0,0(s0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:26
				arg++;
88000734:	1000fff7 	b	88000714 <printf+0x150>
88000738:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:35
				printbase((long)*arg, w, 10, 1);
8800073c:	24070001 	li	a3,1
88000740:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
88000744:	8e040000 	lw	a0,0(s0)
88000748:	0e0001fa 	jal	880007e8 <printbase>
8800074c:	26310001 	addiu	s1,s1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:59
				break;
88000750:	1000fff1 	b	88000718 <printf+0x154>
88000754:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:40
				printbase((long)*arg, w, 10, 0);
88000758:	8e040000 	lw	a0,0(s0)
8800075c:	00003825 	move	a3,zero
88000760:	0e0001fa 	jal	880007e8 <printbase>
88000764:	2406000a 	li	a2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:41
				arg++;
88000768:	26100004 	addiu	s0,s0,4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:43
				break;
8800076c:	1000ffea 	b	88000718 <printf+0x154>
88000770:	26310002 	addiu	s1,s1,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:50
				printbase((long)*arg, w, 2, 0);
88000774:	00003825 	move	a3,zero
88000778:	1000ffec 	b	8800072c <printf+0x168>
8800077c:	24060002 	li	a2,2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:56
				printbase((long)*arg, w, 16, 0);
88000780:	00003825 	move	a3,zero
88000784:	1000ffef 	b	88000744 <printf+0x180>
88000788:	24060010 	li	a2,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:61
				putchar('%');
8800078c:	0e00025d 	jal	88000974 <putchar>
88000790:	24040025 	li	a0,37
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:27
				i++;
88000794:	1000ffe0 	b	88000718 <printf+0x154>
88000798:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:65
				i++;
8800079c:	02808825 	move	s1,s4
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:15 (discriminator 1)
			w = 1;
880007a0:	00002825 	move	a1,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:67 (discriminator 1)
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
880007a4:	80830001 	lb	v1,1(a0)
880007a8:	00928823 	subu	s1,a0,s2
880007ac:	2462ffcf 	addiu	v0,v1,-49
880007b0:	304200ff 	andi	v0,v0,0xff
880007b4:	2c420009 	sltiu	v0,v0,9
880007b8:	1040ffa3 	beqz	v0,88000648 <printf+0x84>
880007bc:	24840001 	addiu	a0,a0,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:68 (discriminator 3)
					w = w * 10 + (fmt[i + 1] - '0');
880007c0:	70b31002 	mul	v0,a1,s3
880007c4:	2463ffd0 	addiu	v1,v1,-48
880007c8:	1000fff6 	b	880007a4 <printf+0x1e0>
880007cc:	00432821 	addu	a1,v0,v1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:79
			if (c == '\n')
880007d0:	16930003 	bne	s4,s3,880007e0 <printf+0x21c>
880007d4:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:80
				putchar('\r');
880007d8:	0e00025d 	jal	88000974 <putchar>
880007dc:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printf.c:81
			putchar(c);
880007e0:	1000ffa8 	b	88000684 <printf+0xc0>
880007e4:	02802025 	move	a0,s4

880007e8 <printbase>:
printbase():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2
int printbase(long v,int w,int base,int sign)
{
880007e8:	27bdff98 	addiu	sp,sp,-104
880007ec:	afb40060 	sw	s4,96(sp)
880007f0:	afb3005c 	sw	s3,92(sp)
880007f4:	afbf0064 	sw	ra,100(sp)
880007f8:	afb20058 	sw	s2,88(sp)
880007fc:	afb10054 	sw	s1,84(sp)
88000800:	afb00050 	sw	s0,80(sp)
88000804:	00a09825 	move	s3,a1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
88000808:	10e00018 	beqz	a3,8800086c <printbase+0x84>
8800080c:	00c0a025 	move	s4,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:7 (discriminator 1)
88000810:	04810004 	bgez	a0,88000824 <printbase+0x3c>
88000814:	00808025 	move	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:9
	{
	value = -v;
88000818:	00048023 	negu	s0,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:10
	putchar('-');
8800081c:	0e00025d 	jal	88000974 <putchar>
88000820:	2404002d 	li	a0,45
88000824:	27b10010 	addiu	s1,sp,16
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:2 (discriminator 1)
{
88000828:	02201025 	move	v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:14 (discriminator 1)
	}
	else value=v;

	for(i=0;value;i++)
8800082c:	16000011 	bnez	s0,88000874 <printbase+0x8c>
88000830:	00519023 	subu	s2,v0,s1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22
	value=value/base;
	}

#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
88000834:	0272802a 	slt	s0,s3,s2
88000838:	0250980b 	movn	s3,s2,s0
8800083c:	02608025 	move	s0,s3
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:22 (discriminator 2)
88000840:	16000013 	bnez	s0,88000890 <printbase+0xa8>
88000844:	0250102a 	slt	v0,s2,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:28
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}
88000848:	8fbf0064 	lw	ra,100(sp)
8800084c:	8fb40060 	lw	s4,96(sp)
88000850:	8fb3005c 	lw	s3,92(sp)
88000854:	8fb20058 	lw	s2,88(sp)
88000858:	8fb10054 	lw	s1,84(sp)
8800085c:	8fb00050 	lw	s0,80(sp)
88000860:	00001025 	move	v0,zero
88000864:	03e00008 	jr	ra
88000868:	27bd0068 	addiu	sp,sp,104
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:12
	else value=v;
8800086c:	1000ffed 	b	88000824 <printbase+0x3c>
88000870:	00808025 	move	s0,a0
88000874:	0214001b 	divu	zero,s0,s4
88000878:	028001f4 	teq	s4,zero,0x7
8800087c:	24420001 	addiu	v0,v0,1
88000880:	00002010 	mfhi	a0
88000884:	00008012 	mflo	s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:16 (discriminator 3)
	buf[i]=value%base;
88000888:	1000ffe8 	b	8800082c <printbase+0x44>
8800088c:	a044ffff 	sb	a0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24
		c=j>i?0:buf[j-1];
88000890:	14400006 	bnez	v0,880008ac <printbase+0xc4>
88000894:	00001025 	move	v0,zero
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:24 (discriminator 1)
88000898:	02301021 	addu	v0,s1,s0
8800089c:	8042ffff 	lb	v0,-1(v0)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 1)
		putchar((c<=9)?c+'0':c-0xa+'a');
880008a0:	2843000a 	slti	v1,v0,10
880008a4:	10600002 	beqz	v1,880008b0 <printbase+0xc8>
880008a8:	24440057 	addiu	a0,v0,87
880008ac:	24440030 	addiu	a0,v0,48
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/printbase.c:25 (discriminator 4)
880008b0:	0e00025d 	jal	88000974 <putchar>
880008b4:	2610ffff 	addiu	s0,s0,-1
880008b8:	1000ffe1 	b	88000840 <printbase+0x58>
880008bc:	00000000 	nop

880008c0 <memset>:
memset():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:273
 * @n:      number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
880008c0:	00801025 	move	v0,a0
880008c4:	00863021 	addu	a2,a0,a2
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:277
#ifdef __HAVE_ARCH_MEM_OPTS
    return __memset(s, c, n);
#else
    char *p = s;
880008c8:	00801825 	move	v1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:278
    while (n -- > 0) {
880008cc:	14660003 	bne	v1,a2,880008dc <memset+0x1c>
880008d0:	24630001 	addiu	v1,v1,1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:283
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEM_OPTS */
}
880008d4:	03e00008 	jr	ra
880008d8:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:279
        *p ++ = c;
880008dc:	1000fffb 	b	880008cc <memset+0xc>
880008e0:	a065ffff 	sb	a1,-1(v1)

880008e4 <putstring>:
putstring():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:2
int putstring(const char *s)
{
880008e4:	27bdffe0 	addiu	sp,sp,-32
880008e8:	afb20018 	sw	s2,24(sp)
880008ec:	afb10014 	sw	s1,20(sp)
880008f0:	afbf001c 	sw	ra,28(sp)
880008f4:	afb00010 	sw	s0,16(sp)
880008f8:	00808825 	move	s1,a0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
    char c;
    while ((c = *s))
    {
        if (c == '\n')
880008fc:	2412000a 	li	s2,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:4
    while ((c = *s))
88000900:	82300000 	lb	s0,0(s1)
88000904:	16000007 	bnez	s0,88000924 <putstring+0x40>
88000908:	8fbf001c 	lw	ra,28(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:12
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
8800090c:	8fb20018 	lw	s2,24(sp)
88000910:	8fb10014 	lw	s1,20(sp)
88000914:	8fb00010 	lw	s0,16(sp)
88000918:	00001025 	move	v0,zero
8800091c:	03e00008 	jr	ra
88000920:	27bd0020 	addiu	sp,sp,32
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:6
        if (c == '\n')
88000924:	16120003 	bne	s0,s2,88000934 <putstring+0x50>
88000928:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:7
            putchar('\r');
8800092c:	0e00025d 	jal	88000974 <putchar>
88000930:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:8
        putchar(c);
88000934:	0e00025d 	jal	88000974 <putchar>
88000938:	02002025 	move	a0,s0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:9
        s++;
8800093c:	1000fff0 	b	88000900 <putstring+0x1c>
88000940:	26310001 	addiu	s1,s1,1

88000944 <puts>:
puts():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:15

int puts(const char *s)
{
88000944:	27bdffe8 	addiu	sp,sp,-24
88000948:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:16
    putstring(s);
8800094c:	0e000239 	jal	880008e4 <putstring>
88000950:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:17
    putchar('\r');
88000954:	0e00025d 	jal	88000974 <putchar>
88000958:	2404000d 	li	a0,13
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:18
    putchar('\n');
8800095c:	0e00025d 	jal	88000974 <putchar>
88000960:	2404000a 	li	a0,10
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/puts.c:20
    return 0;
}
88000964:	8fbf0014 	lw	ra,20(sp)
88000968:	00001025 	move	v0,zero
8800096c:	03e00008 	jr	ra
88000970:	27bd0018 	addiu	sp,sp,24

88000974 <putchar>:
putchar():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:4
#include <machine.h>

int putchar(int c)
{
88000974:	27bdffe8 	addiu	sp,sp,-24
88000978:	afb00010 	sw	s0,16(sp)
8800097c:	00808025 	move	s0,a0
88000980:	afbf0014 	sw	ra,20(sp)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:5
	write_serial((byte_t) c);
88000984:	0e000276 	jal	880009d8 <write_serial>
88000988:	308400ff 	andi	a0,a0,0xff
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/putchar.c:7
	return c;
8800098c:	8fbf0014 	lw	ra,20(sp)
88000990:	02001025 	move	v0,s0
88000994:	8fb00010 	lw	s0,16(sp)
88000998:	03e00008 	jr	ra
8800099c:	27bd0018 	addiu	sp,sp,24

880009a0 <init_serial>:
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
}

template<typename T>
void write(void *addr, T data){
    auto *ptr = reinterpret_cast<volatile T *>(addr);
    *ptr = data;
880009a0:	3c02bfd0 	lui	v0,0xbfd0
880009a4:	2403ff81 	li	v1,-127
880009a8:	a0433008 	sb	v1,12296(v0)
880009ac:	2403ff80 	li	v1,-128
880009b0:	a043300c 	sb	v1,12300(v0)
880009b4:	24030036 	li	v1,54
880009b8:	a0433000 	sb	v1,12288(v0)
880009bc:	24030003 	li	v1,3
880009c0:	a0403004 	sb	zero,12292(v0)
880009c4:	a043300c 	sb	v1,12300(v0)
880009c8:	a0403010 	sb	zero,12304(v0)
880009cc:	a0403004 	sb	zero,12292(v0)
init_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:45
	write_byte(UART_LCR_ADDR, ~0x80 & 0x03);
	// disable modem controls
	write_byte(UART_MCR_ADDR, 0);
	// disable interrupts
	write_byte(UART_IER_ADDR, 0);
}
880009d0:	03e00008 	jr	ra
880009d4:	00000000 	nop

880009d8 <write_serial>:
_Z4readIhET_Pv():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:6
    return *ptr;
880009d8:	3c03bfd0 	lui	v1,0xbfd0
880009dc:	90623014 	lbu	v0,12308(v1)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:53
	while (!(read_byte(UART_LSR_ADDR) & 0x01));
	return read_byte(UART_DAT_ADDR);
}

void write_serial(byte_t data){
	while (!(read_byte(UART_LSR_ADDR) & 0x40));
880009e0:	30420040 	andi	v0,v0,0x40
880009e4:	1040fffd 	beqz	v0,880009dc <write_serial+0x4>
880009e8:	3c02bfd0 	lui	v0,0xbfd0
_Z5writeIhEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
880009ec:	a0443000 	sb	a0,12288(v0)
write_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:55
	write_byte(UART_DAT_ADDR, data);
}
880009f0:	03e00008 	jr	ra
880009f4:	00000000 	nop

880009f8 <write_led>:
_Z5writeItEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
880009f8:	3c02bff0 	lui	v0,0xbff0
880009fc:	3442f000 	ori	v0,v0,0xf000
88000a00:	a4440000 	sh	a0,0(v0)
write_led():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:68
	return word;
}

void write_led(hword_t data){
	write_hword(LED_ADDR, data);
}
88000a04:	03e00008 	jr	ra
88000a08:	00000000 	nop

88000a0c <write_segment>:
_Z5writeIjEvPvT_():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:12
    *ptr = data;
88000a0c:	3c02bff0 	lui	v0,0xbff0
88000a10:	3442f010 	ori	v0,v0,0xf010
88000a14:	ac440000 	sw	a0,0(v0)
write_segment():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:72

void write_segment(word_t data){
	write_word(NUM_ADDR, data);
}
88000a18:	03e00008 	jr	ra
88000a1c:	00000000 	nop
88000a20:	43960000 	c0	0x1960000
88000a24:	3fc00000 	0x3fc00000
88000a28:	43c80000 	c0	0x1c80000
88000a2c:	3f000000 	0x3f000000
88000a30:	40800000 	mtc0	zero,c0_index
88000a34:	2a2a2a2a 	slti	t2,s1,10794
88000a38:	6972542a 	0x6972542a
88000a3c:	6c616976 	0x6c616976
88000a40:	5350494d 	beql	k0,s0,88012f78 <_text_end+0x12060>
88000a44:	72614220 	0x72614220
88000a48:	654d2065 	0x654d2065
88000a4c:	206c6174 	addi	t4,v1,24948
88000a50:	74737953 	jalx	81cde54c <_bss_end+0x1cdd54c>
88000a54:	2a2a6d65 	slti	t2,s1,28005
88000a58:	002a2a2a 	0x2a2a2a
88000a5c:	706d6f43 	0x706d6f43
88000a60:	74616c69 	jalx	8185b1a4 <_bss_end+0x185a1a4>
88000a64:	206e6f69 	addi	t6,v1,28521
88000a68:	656d6974 	0x656d6974
88000a6c:	3931203a 	xori	s1,t1,0x203a
88000a70:	3a34313a 	xori	s4,s1,0x313a
88000a74:	44203635 	0x44203635
88000a78:	31206365 	andi	zero,t1,0x6365
88000a7c:	30322035 	andi	s2,at,0x2035
88000a80:	00003931 	tgeu	zero,zero,0xe4
88000a84:	6c6c6946 	0x6c6c6946
88000a88:	20676e69 	addi	a3,v1,28265
88000a8c:	7373622e 	0x7373622e
88000a90:	63657320 	0x63657320
88000a94:	6e6f6974 	0x6e6f6974
88000a98:	74697720 	jalx	81a5dc80 <_bss_end+0x1a5cc80>
88000a9c:	2c302068 	sltiu	s0,at,8296
88000aa0:	66666f20 	0x66666f20
88000aa4:	3a746573 	xori	s4,s3,0x6573
88000aa8:	25783020 	addiu	t8,t3,12320
88000aac:	73202c78 	0x73202c78
88000ab0:	3a657a69 	xori	a1,s3,0x7a69
88000ab4:	20642520 	addi	a0,v1,9504
88000ab8:	65747962 	0x65747962
88000abc:	000a2e73 	tltu	zero,t2,0xb9
88000ac0:	676f7250 	0x676f7250
88000ac4:	206d6172 	addi	t5,v1,24946
88000ac8:	74697865 	jalx	81a5e194 <_bss_end+0x1a5d194>
88000acc:	6e206465 	0x6e206465
88000ad0:	616d726f 	0x616d726f
88000ad4:	2e796c6c 	sltiu	t9,s3,27756
88000ad8:	00000000 	nop
88000adc:	676f7250 	0x676f7250
88000ae0:	206d6172 	addi	t5,v1,24946
88000ae4:	74697865 	jalx	81a5e194 <_bss_end+0x1a5d194>
88000ae8:	61206465 	0x61206465
88000aec:	726f6e62 	0x726f6e62
88000af0:	6c6c616d 	0x6c6c616d
88000af4:	69772079 	0x69772079
88000af8:	63206874 	0x63206874
88000afc:	2065646f 	addi	a1,v1,25711
88000b00:	0a2e6425 	j	88b99094 <_text_end+0xb9817c>
88000b04:	00000000 	nop
88000b08:	69676552 	0x69676552
88000b0c:	72657473 	0x72657473
88000b10:	64252420 	0x64252420
88000b14:	7025203a 	0x7025203a
88000b18:	0000000a 	movz	zero,zero,zero
88000b1c:	3a435045 	xori	v1,s2,0x5045
88000b20:	2c702520 	sltiu	s0,v1,9504
88000b24:	75614320 	jalx	85850c80 <_bss_end+0x584fc80>
88000b28:	203a6573 	addi	k0,at,25971
88000b2c:	202c7025 	addi	t4,at,28709
88000b30:	74617453 	jalx	8185d14c <_bss_end+0x185c14c>
88000b34:	203a7375 	addi	k0,at,29557
88000b38:	202c7025 	addi	t4,at,28709
88000b3c:	56646142 	bnel	s3,a0,88019048 <_text_end+0x18130>
88000b40:	72646441 	0x72646441
88000b44:	7025203a 	0x7025203a
88000b48:	4245202c 	c0	0x45202c
88000b4c:	3a657361 	xori	a1,s3,0x7361
88000b50:	0a702520 	j	89c09480 <_text_end+0x1c08568>
88000b54:	00000000 	nop
88000b58:	20424c54 	addi	v0,v0,19540
88000b5c:	6d657469 	0x6d657469
88000b60:	3a642520 	xori	a0,s3,0x2520
88000b64:	746e4520 	jalx	81b91480 <_bss_end+0x1b90480>
88000b68:	69487972 	0x69487972
88000b6c:	2c702520 	sltiu	s0,v1,9504
88000b70:	746e4520 	jalx	81b91480 <_bss_end+0x1b90480>
88000b74:	6f4c7972 	0x6f4c7972
88000b78:	25203a31 	addiu	zero,t1,14897
88000b7c:	45202c70 	0x45202c70
88000b80:	7972746e 	0x7972746e
88000b84:	3a326f4c 	xori	s2,s1,0x6f4c
88000b88:	0a702520 	j	89c09480 <_text_end+0x1c08568>
88000b8c:	00000000 	nop
88000b90:	20555043 	addi	s5,v0,20547
88000b94:	65746e69 	0x65746e69
88000b98:	6c616e72 	0x6c616e72
88000b9c:	73736120 	0x73736120
88000ba0:	69747265 	0x69747265
88000ba4:	66206e6f 	0x66206e6f
88000ba8:	656c6961 	0x656c6961
88000bac:	61202c64 	0x61202c64
88000bb0:	74726f62 	jalx	81c9bd88 <_bss_end+0x1c9ad88>
88000bb4:	0000002e 	0x2e
88000bb8:	65206e41 	0x65206e41
88000bbc:	70656378 	0x70656378
88000bc0:	6e6f6974 	0x6e6f6974
88000bc4:	63636f20 	0x63636f20
88000bc8:	65727275 	0x65727275
88000bcc:	77202c64 	jalx	8c80b190 <_text_end+0x480a278>
88000bd0:	20687469 	addi	t0,v1,29801
88000bd4:	20435045 	addi	v1,v0,20549
88000bd8:	78257830 	0x78257830
88000bdc:	646e6120 	0x646e6120
88000be0:	75614320 	jalx	85850c80 <_bss_end+0x584fc80>
88000be4:	25206573 	addiu	zero,t1,25971
88000be8:	25282064 	addiu	t0,t1,8292
88000bec:	0a2e2973 	j	88b8a5cc <_text_end+0xb896b4>
88000bf0:	00000000 	nop
88000bf4:	2a2a2a2a 	slti	t2,s1,10794
88000bf8:	7379532a 	0x7379532a
88000bfc:	206d6574 	addi	t5,v1,25972
88000c00:	474e4148 	c1	0x14e4148
88000c04:	2a2a2a2a 	slti	t2,s1,10794
88000c08:	0000002a 	slt	zero,zero,zero
88000c0c:	65746e49 	0x65746e49
88000c10:	70757272 	0x70757272
88000c14:	00000074 	teq	zero,zero,0x1
88000c18:	20424c54 	addi	v0,v0,19540
88000c1c:	69646f6d 	0x69646f6d
88000c20:	61636966 	0x61636966
88000c24:	6e6f6974 	0x6e6f6974
88000c28:	63786520 	0x63786520
88000c2c:	69747065 	0x69747065
88000c30:	00006e6f 	0x6e6f
88000c34:	20424c54 	addi	v0,v0,19540
88000c38:	65637865 	0x65637865
88000c3c:	6f697470 	0x6f697470
88000c40:	6c28206e 	0x6c28206e
88000c44:	2064616f 	addi	a0,v1,24943
88000c48:	6920726f 	0x6920726f
88000c4c:	7274736e 	0x7274736e
88000c50:	69746375 	0x69746375
88000c54:	66206e6f 	0x66206e6f
88000c58:	68637465 	0x68637465
88000c5c:	00000029 	0x29
88000c60:	20424c54 	addi	v0,v0,19540
88000c64:	65637865 	0x65637865
88000c68:	6f697470 	0x6f697470
88000c6c:	7328206e 	0x7328206e
88000c70:	65726f74 	0x65726f74
88000c74:	00000029 	0x29
88000c78:	72646441 	0x72646441
88000c7c:	20737365 	addi	s3,v1,29541
88000c80:	6f727265 	0x6f727265
88000c84:	78652072 	0x78652072
88000c88:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000c8c:	206e6f69 	addi	t6,v1,28521
88000c90:	616f6c28 	0x616f6c28
88000c94:	726f2064 	0x726f2064
88000c98:	736e6920 	0x736e6920
88000c9c:	63757274 	0x63757274
88000ca0:	6e6f6974 	0x6e6f6974
88000ca4:	74656620 	jalx	81959880 <_bss_end+0x1958880>
88000ca8:	00296863 	0x296863
88000cac:	72646441 	0x72646441
88000cb0:	20737365 	addi	s3,v1,29541
88000cb4:	6f727265 	0x6f727265
88000cb8:	78652072 	0x78652072
88000cbc:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000cc0:	206e6f69 	addi	t6,v1,28521
88000cc4:	6f747328 	0x6f747328
88000cc8:	00296572 	tlt	at,t1,0x195
88000ccc:	20737542 	addi	s3,v1,30018
88000cd0:	6f727265 	0x6f727265
88000cd4:	78652072 	0x78652072
88000cd8:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000cdc:	206e6f69 	addi	t6,v1,28521
88000ce0:	736e6928 	0x736e6928
88000ce4:	63757274 	0x63757274
88000ce8:	6e6f6974 	0x6e6f6974
88000cec:	74656620 	jalx	81959880 <_bss_end+0x1958880>
88000cf0:	00296863 	0x296863
88000cf4:	20737542 	addi	s3,v1,30018
88000cf8:	6f727265 	0x6f727265
88000cfc:	78652072 	0x78652072
88000d00:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000d04:	206e6f69 	addi	t6,v1,28521
88000d08:	74616428 	jalx	818590a0 <_bss_end+0x18580a0>
88000d0c:	65722061 	0x65722061
88000d10:	65726566 	0x65726566
88000d14:	3a65636e 	xori	a1,s3,0x636e
88000d18:	616f6c20 	0x616f6c20
88000d1c:	726f2064 	0x726f2064
88000d20:	6f747320 	0x6f747320
88000d24:	00296572 	tlt	at,t1,0x195
88000d28:	63737953 	0x63737953
88000d2c:	206c6c61 	addi	t4,v1,27745
88000d30:	65637865 	0x65637865
88000d34:	6f697470 	0x6f697470
88000d38:	0000006e 	0x6e
88000d3c:	61657242 	0x61657242
88000d40:	696f706b 	0x696f706b
88000d44:	6520746e 	0x6520746e
88000d48:	70656378 	0x70656378
88000d4c:	6e6f6974 	0x6e6f6974
88000d50:	00000000 	nop
88000d54:	65736552 	0x65736552
88000d58:	64657672 	0x64657672
88000d5c:	736e6920 	0x736e6920
88000d60:	63757274 	0x63757274
88000d64:	6e6f6974 	0x6e6f6974
88000d68:	63786520 	0x63786520
88000d6c:	69747065 	0x69747065
88000d70:	00006e6f 	0x6e6f
88000d74:	72706f43 	0x72706f43
88000d78:	7365636f 	0x7365636f
88000d7c:	20726f73 	addi	s2,v1,28531
88000d80:	73756e55 	0x73756e55
88000d84:	656c6261 	0x656c6261
88000d88:	63786520 	0x63786520
88000d8c:	69747065 	0x69747065
88000d90:	00006e6f 	0x6e6f
88000d94:	74697241 	jalx	81a5c904 <_bss_end+0x1a5b904>
88000d98:	74656d68 	jalx	8195b5a0 <_bss_end+0x195a5a0>
88000d9c:	4f206369 	c3	0x1206369
88000da0:	66726576 	0x66726576
88000da4:	20776f6c 	addi	s7,v1,28524
88000da8:	65637865 	0x65637865
88000dac:	6f697470 	0x6f697470
88000db0:	0000006e 	0x6e
88000db4:	70617254 	0x70617254
88000db8:	63786520 	0x63786520
88000dbc:	69747065 	0x69747065
88000dc0:	00006e6f 	0x6e6f
88000dc4:	2041534d 	addi	at,v0,21325
88000dc8:	616f6c46 	0x616f6c46
88000dcc:	676e6974 	0x676e6974
88000dd0:	696f502d 	0x696f502d
88000dd4:	6520746e 	0x6520746e
88000dd8:	70656378 	0x70656378
88000ddc:	6e6f6974 	0x6e6f6974
88000de0:	00000000 	nop
88000de4:	20424c54 	addi	v0,v0,19540
88000de8:	64616552 	0x64616552
88000dec:	686e492d 	0x686e492d
88000df0:	74696269 	jalx	81a589a4 <_bss_end+0x1a579a4>
88000df4:	63786520 	0x63786520
88000df8:	69747065 	0x69747065
88000dfc:	00006e6f 	0x6e6f
88000e00:	20424c54 	addi	v0,v0,19540
88000e04:	63657845 	0x63657845
88000e08:	6f697475 	0x6f697475
88000e0c:	6e492d6e 	0x6e492d6e
88000e10:	69626968 	0x69626968
88000e14:	78652074 	0x78652074
88000e18:	74706563 	jalx	81c1958c <_bss_end+0x1c1858c>
88000e1c:	006e6f69 	0x6e6f69
88000e20:	43544157 	c0	0x1544157
88000e24:	00000048 	0x48
88000e28:	6863614d 	0x6863614d
88000e2c:	20656e69 	addi	a1,v1,28265
88000e30:	63656863 	0x63656863
88000e34:	0000006b 	0x6b
88000e38:	65726854 	0x65726854
88000e3c:	41206461 	0x41206461
88000e40:	636f6c6c 	0x636f6c6c
88000e44:	6f697461 	0x6f697461
88000e48:	44202c6e 	0x44202c6e
88000e4c:	6c6c6165 	0x6c6c6165
88000e50:	7461636f 	jalx	81858dbc <_bss_end+0x1857dbc>
88000e54:	2c6e6f69 	sltiu	t6,v1,28521
88000e58:	20726f20 	addi	s2,v1,28448
88000e5c:	65686353 	0x65686353
88000e60:	696c7564 	0x696c7564
88000e64:	4520676e 	0x4520676e
88000e68:	70656378 	0x70656378
88000e6c:	6e6f6974 	0x6e6f6974
88000e70:	00000073 	tltu	zero,zero,0x1
88000e74:	68636143 	0x68636143
88000e78:	72652065 	0x72652065
88000e7c:	00726f72 	tlt	v1,s2,0x1bd

88000e80 <EXCEPTION_MESSAGES>:
88000e80:	88000c0c 	lwl	zero,3084(zero)
88000e84:	88000c18 	lwl	zero,3096(zero)
88000e88:	88000c34 	lwl	zero,3124(zero)
88000e8c:	88000c60 	lwl	zero,3168(zero)
88000e90:	88000c78 	lwl	zero,3192(zero)
88000e94:	88000cac 	lwl	zero,3244(zero)
88000e98:	88000ccc 	lwl	zero,3276(zero)
88000e9c:	88000cf4 	lwl	zero,3316(zero)
88000ea0:	88000d28 	lwl	zero,3368(zero)
88000ea4:	88000d3c 	lwl	zero,3388(zero)
88000ea8:	88000d54 	lwl	zero,3412(zero)
88000eac:	88000d74 	lwl	zero,3444(zero)
88000eb0:	88000d94 	lwl	zero,3476(zero)
88000eb4:	88000db4 	lwl	zero,3508(zero)
88000eb8:	88000dc4 	lwl	zero,3524(zero)
88000ebc:	88000dc8 	lwl	zero,3528(zero)
88000ec0:	88000bf0 	lwl	zero,3056(zero)
88000ec4:	88000bf0 	lwl	zero,3056(zero)
88000ec8:	88000bf0 	lwl	zero,3056(zero)
88000ecc:	88000de4 	lwl	zero,3556(zero)
88000ed0:	88000e00 	lwl	zero,3584(zero)
88000ed4:	88000bf0 	lwl	zero,3056(zero)
88000ed8:	88000bf0 	lwl	zero,3056(zero)
88000edc:	88000e20 	lwl	zero,3616(zero)
88000ee0:	88000e28 	lwl	zero,3624(zero)
88000ee4:	88000e38 	lwl	zero,3640(zero)
88000ee8:	88000bf0 	lwl	zero,3056(zero)
88000eec:	88000bf0 	lwl	zero,3056(zero)
88000ef0:	88000bf0 	lwl	zero,3056(zero)
88000ef4:	88000bf0 	lwl	zero,3056(zero)
88000ef8:	88000e74 	lwl	zero,3700(zero)
88000efc:	88000bf0 	lwl	zero,3056(zero)
88000f00:	01200000 	0x1200000
88000f04:	02000101 	0x2000101
	...
88000f10:	00000001 	movf	zero,zero,$fcc0
88000f14:	00000000 	nop

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
       0:	0000015a 	0x15a
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
       4:	00000004 	sllv	zero,zero,zero
       8:	01040000 	0x1040000
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
       c:	000000bd 	0xbd
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      10:	00000604 	0x604
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
      14:	00001b00 	sll	v1,zero,0xc
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      18:	00002800 	sll	a1,zero,0x0
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
      24:	04040200 	0x4040200
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
      28:	00000097 	0x97
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      2c:	69050403 	0x69050403
      30:	0200746e 	0x200746e
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      34:	00840704 	0x840704
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
      38:	04020000 	bltzl	zero,3c <_data-0x7fffffc4>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
      3c:	00007f07 	0x7f07
      40:	00a80400 	0xa80400
      44:	03010000 	0x3010000
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
#else
    const char *s = src;
    char *d = dst;
    if (s < d && s + n > d) {
        s += n, d += n;
        while (n -- > 0) {
      48:	0000002c 	0x2c
      4c:	88000250 	lwl	zero,592(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
      50:	000000f8 	0xf8
      54:	01509c01 	0x1509c01
      58:	77050000 	jalx	c140000 <_data-0x73ec0000>
      5c:	2c050100 	sltiu	a1,zero,256
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
        }
    } else {
        while (n -- > 0) {
            *d ++ = *s ++;
      60:	20000000 	addi	zero,zero,0
      64:	00680503 	0x680503
      68:	002c0501 	0x2c0501
      6c:	02580000 	0x2580000
      70:	01007806 	srlv	t7,zero,t0
      74:	00002c05 	0x2c05
      78:	00000000 	nop
      7c:	00790600 	0x790600
      80:	002c0501 	0x2c0501
      84:	00220000 	0x220000
      88:	70070000 	madd	zero,a3
      8c:	07010072 	bgez	t8,258 <_data-0x7ffffda8>
      90:	00000025 	move	zero,zero
      94:	06239002 	bgezl	s1,fffe40a0 <_text_end+0x77fe3188>
      98:	01006970 	tge	t0,zero,0x1a5
      9c:	00002507 	0x2507
      a0:	00006000 	sll	t4,zero,0x0
      a4:	00000800 	sll	at,zero,0x0
      a8:	08010000 	j	40000 <_data-0x7ffc0000>
      ac:	00000025 	move	zero,zero
      b0:	000000aa 	0xaa
      b4:	00007908 	0x7908
      b8:	25080100 	addiu	t0,t0,256
      bc:	ca000000 	lwc2	$0,0(s0)
      c0:	08000000 	j	0 <_data-0x80000000>
      c4:	0000019c 	0x19c
      c8:	00250801 	movt	at,at,$fcc1
      cc:	00ea0000 	0xea0000
      d0:	15080000 	bne	t0,t0,d4 <_data-0x7fffff2c>
      d4:	01000000 	0x1000000
      d8:	00002508 	0x2508
      dc:	0000fe00 	sll	ra,zero,0x18
      e0:	009d0900 	0x9d0900
      e4:	09010000 	j	4040000 <_data-0x7bfc0000>
      e8:	00000025 	move	zero,zero
      ec:	80000004 	lb	zero,4(zero)
      f0:	0073093f 	0x73093f
      f4:	09010000 	j	4040000 <_data-0x7bfc0000>
      f8:	00000025 	move	zero,zero
      fc:	00000004 	sllv	zero,zero,zero
     100:	00a209bf 	0xa209bf
     104:	09010000 	j	4040000 <_data-0x7bfc0000>
     108:	00000025 	move	zero,zero
     10c:	00000004 	sllv	zero,zero,zero
     110:	00af0a00 	0xaf0a00
     114:	0a010000 	j	8040000 <_data-0x77fc0000>
     118:	0000002c 	0x2c
     11c:	01a20bff 	0x1a20bff
     120:	0c010000 	jal	40000 <_data-0x7ffc0000>
     124:	00000150 	0x150
     128:	90808080 	lbu	zero,-32640(a0)
     12c:	00000c7a 	0xc7a
     130:	69060000 	0x69060000
     134:	2c180100 	sltiu	t8,zero,256
     138:	12000000 	beqz	s0,13c <_data-0x7ffffec4>
     13c:	08000001 	j	4 <_data-0x7ffffffc>
     140:	00000091 	0x91
     144:	002c2601 	0x2c2601
     148:	01250000 	0x1250000
     14c:	00000000 	nop
     150:	0156040d 	break	0x156,0x10
     154:	01020000 	0x1020000
     158:	00027b06 	0x27b06
     15c:	00220000 	0x220000
     160:	00020000 	sll	zero,v0,0x0
     164:	000000bd 	0xbd
     168:	00840104 	0x840104
     16c:	00000000 	nop
     170:	02508800 	0x2508800
     174:	01a78800 	0x1a78800
     178:	01b90000 	0x1b90000
     17c:	01f40000 	0x1f40000
     180:	80010000 	lb	at,0(zero)
     184:	0000056c 	0x56c
     188:	00d10004 	sllv	zero,s1,a2
     18c:	01040000 	0x1040000
     190:	00000308 	0x308
     194:	0004350c 	syscall	0x10d4
     198:	00001b00 	sll	v1,zero,0xc
     19c:	00008800 	sll	s1,zero,0x0
     1a0:	00000000 	nop
     1a4:	00011600 	sll	v0,at,0x18
     1a8:	07040200 	0x7040200
     1ac:	00000084 	0x84
     1b0:	7f070402 	0x7f070402
     1b4:	03000000 	0x3000000
     1b8:	00000415 	0x415
     1bc:	00250f02 	ror	at,a1,0x1c
     1c0:	01020000 	0x1020000
     1c4:	00027b06 	0x27b06
     1c8:	003e0400 	0x3e0400
     1cc:	01020000 	0x1020000
     1d0:	00027406 	0x27406
     1d4:	05020200 	bltzl	t0,9d8 <_data-0x7ffff628>
     1d8:	000003f8 	0x3f8
     1dc:	69050405 	0x69050405
     1e0:	0200746e 	0x200746e
     1e4:	041e0504 	0x41e0504
     1e8:	f5030000 	sdc1	$f3,0(t0)
     1ec:	03000002 	0x3000002
     1f0:	00007109 	0x7109
     1f4:	08010200 	j	40800 <_data-0x7ffbf800>
     1f8:	00000272 	tlt	zero,zero,0x9
     1fc:	00040c03 	sra	at,a0,0x10
     200:	830a0300 	lb	t2,768(t8)
     204:	02000000 	0x2000000
     208:	02800702 	0x2800702
     20c:	62030000 	0x62030000
     210:	04000002 	bltz	zero,21c <_data-0x7ffffde4>
     214:	0000660b 	0x660b
     218:	06550300 	0x6550300
     21c:	0d040000 	jal	4100000 <_data-0x7bf00000>
     220:	00000033 	tltu	zero,zero
     224:	0000b006 	srlv	s6,zero,zero
     228:	0000b000 	sll	s6,zero,0x0
     22c:	00250700 	0x250700
     230:	001f0000 	sll	zero,ra,0x0
     234:	00450408 	0x450408
     238:	0d090000 	jal	4240000 <_data-0x7bdc0000>
     23c:	05000002 	bltz	t0,248 <_data-0x7ffffdb8>
     240:	0000a007 	srav	s4,zero,zero
     244:	80030500 	lb	v1,1280(zero)
     248:	0a88000e 	j	a200038 <_data-0x75dfffc8>
     24c:	242a05a4 	addiu	t2,at,1444
     250:	0b000001 	j	c000004 <_data-0x73fffffc>
     254:	000002ed 	0x2ed
     258:	01242b05 	0x1242b05
     25c:	0b000000 	j	c000000 <_data-0x74000000>
     260:	0000023a 	0x23a
     264:	00332c05 	0x332c05
     268:	0b100000 	j	c400000 <_data-0x73c00000>
     26c:	00000220 	0x220
     270:	00332d05 	0x332d05
     274:	0b140000 	j	c500000 <_data-0x73b00000>
     278:	000002bf 	0x2bf
     27c:	00332e05 	0x332e05
     280:	0b180000 	j	c600000 <_data-0x73a00000>
     284:	00000200 	sll	zero,zero,0x8
     288:	00332f05 	0x332f05
     28c:	0b1c0000 	j	c700000 <_data-0x73900000>
     290:	00000402 	srl	zero,zero,0x10
     294:	00333005 	0x333005
     298:	0c200000 	jal	800000 <_data-0x7f800000>
     29c:	00727067 	0x727067
     2a0:	01343105 	0x1343105
     2a4:	00240000 	0x240000
     2a8:	00003306 	0x3306
     2ac:	00013400 	sll	a2,at,0x10
     2b0:	00250700 	0x250700
     2b4:	00030000 	sll	zero,v1,0x0
     2b8:	00003306 	0x3306
     2bc:	00014400 	sll	t0,at,0x10
     2c0:	00250700 	0x250700
     2c4:	001f0000 	sll	zero,ra,0x0
     2c8:	00045503 	sra	t2,a0,0x14
     2cc:	c7320500 	lwc1	$f18,1280(t9)
     2d0:	0d000000 	jal	4000000 <_data-0x7c000000>
     2d4:	00000253 	0x253
     2d8:	008a0601 	0x8a0601
     2dc:	9f0d0000 	0x9f0d0000
     2e0:	01000002 	0x1000002
     2e4:	00008a06 	0x8a06
     2e8:	02da0e00 	0x2da0e00
     2ec:	55010000 	bnel	t0,at,2f0 <_data-0x7ffffd10>
     2f0:	88000510 	lwl	zero,1296(zero)
     2f4:	000000b4 	teq	zero,zero,0x2
     2f8:	02a99c01 	0x2a99c01
     2fc:	740f0000 	jalx	3c0000 <_data-0x7fc40000>
     300:	55010066 	bnel	t0,at,49c <_data-0x7ffffb64>
     304:	000002a9 	0x2a9
     308:	00000138 	0x138
     30c:	00044b10 	0x44b10
     310:	af550100 	sw	s5,256(k0)
     314:	6f000002 	0x6f000002
     318:	11000001 	beqz	t0,320 <_data-0x7ffffce0>
     31c:	88000580 	lwl	zero,1408(zero)
     320:	00000044 	0x44
     324:	00000232 	tlt	zero,zero,0x8
     328:	0002ca12 	0x2ca12
     32c:	955b0100 	lhu	k1,256(t2)
     330:	90000000 	lbu	zero,0(zero)
     334:	13000001 	beqz	t8,33c <_data-0x7ffffcc4>
     338:	00637065 	0x637065
     33c:	00585c01 	0x585c01
     340:	8c140000 	lw	s4,0(zero)
     344:	80000003 	lb	zero,3(zero)
     348:	04880005 	tgei	a0,5
     34c:	01000000 	0x1000000
     350:	0001e15b 	0x1e15b
     354:	05801500 	bltz	t4,5758 <_data-0x7fffa8a8>
     358:	00048800 	sll	s1,a0,0x0
     35c:	1a160000 	0x1a160000
     360:	00000005 	0x5
     364:	03a61400 	0x3a61400
     368:	05a40000 	0x5a40000
     36c:	00048800 	sll	s1,a0,0x0
     370:	5c010000 	0x5c010000
     374:	00000204 	0x204
     378:	0005a415 	0x5a415
     37c:	00000488 	0x488
     380:	04ff1600 	0x4ff1600
     384:	00000000 	nop
     388:	0005b417 	0x5b417
     38c:	00052288 	0x52288
     390:	00022100 	sll	a0,v0,0x4
     394:	54011800 	bnel	zero,at,6398 <_data-0x7fff9c68>
     398:	0bb80305 	j	ee00c14 <_data-0x711ff3ec>
     39c:	01188800 	0x1188800
     3a0:	00800255 	0x800255
     3a4:	05bc1900 	0x5bc1900
     3a8:	052d8800 	0x52d8800
     3ac:	01180000 	0x1180000
     3b0:	00800254 	0x800254
     3b4:	34170000 	li	s7,0x0
     3b8:	38880005 	xori	t0,a0,0x5
     3bc:	49000005 	bc2f	3d4 <_data-0x7ffffc2c>
     3c0:	18000002 	blez	zero,3cc <_data-0x7ffffc34>
     3c4:	03055401 	0x3055401
     3c8:	88000a34 	lwl	zero,2612(zero)
     3cc:	05481700 	tgei	t2,5888
     3d0:	05388800 	0x5388800
     3d4:	02600000 	0x2600000
     3d8:	01180000 	0x1180000
     3dc:	90030554 	lbu	v1,1364(zero)
     3e0:	0088000b 	movn	zero,a0,t0
     3e4:	00055417 	0x55417
     3e8:	00054388 	0x54388
     3ec:	00027800 	sll	t7,v0,0x0
     3f0:	54011800 	bnel	zero,at,63f4 <_data-0x7fff9c0c>
     3f4:	bdad1106 	cache	0xd,4358(t5)
     3f8:	007df5b7 	0x7df5b7
     3fc:	00055c17 	0x55c17
     400:	00032888 	0x32888
     404:	00028c00 	sll	s1,v0,0x10
     408:	54011800 	bnel	zero,at,640c <_data-0x7fff9bf4>
     40c:	00008102 	srl	s0,zero,0x4
     410:	0005641a 	0x5641a
     414:	0002b688 	0x2b688
     418:	05801b00 	bltz	t4,701c <_data-0x7fff8fe4>
     41c:	05388800 	0x5388800
     420:	01180000 	0x1180000
     424:	f4030554 	sdc1	$f3,1364(zero)
     428:	0088000b 	movn	zero,a0,t0
     42c:	44040800 	mfc1	a0,$f1
     430:	02000001 	movf	zero,s0,$fcc0
     434:	02340201 	0x2340201
     438:	2a1c0000 	slti	gp,s0,0
     43c:	01000002 	0x1000002
     440:	0004a845 	0x4a845
     444:	00006888 	0x6888
     448:	289c0100 	slti	gp,a0,256
     44c:	1d000003 	bgtz	t0,45c <_data-0x7ffffba4>
     450:	00000050 	0x50
     454:	0100691e 	0x100691e
     458:	00006646 	0x6646
     45c:	0001a300 	sll	s4,at,0xc
     460:	00681d00 	0x681d00
     464:	27120000 	addiu	s2,t8,0
     468:	01000004 	sllv	zero,zero,t0
     46c:	00003347 	0x3347
     470:	0001c200 	sll	t8,at,0x8
     474:	02cf1200 	0x2cf1200
     478:	47010000 	c1	0x1010000
     47c:	00000033 	tltu	zero,zero
     480:	000001d5 	0x1d5
     484:	0002fd12 	0x2fd12
     488:	33470100 	andi	a3,k0,0x100
     48c:	e8000000 	swc2	$0,0(zero)
     490:	19000001 	blez	t0,498 <_data-0x7ffffb68>
     494:	880004f4 	lwl	zero,1268(zero)
     498:	00000522 	0x522
     49c:	02540118 	0x2540118
     4a0:	01180081 	0x1180081
     4a4:	7f800255 	0x7f800255
     4a8:	00000000 	nop
     4ac:	0002af0e 	0x2af0e
     4b0:	103e0100 	beq	at,s8,8b4 <_data-0x7ffff74c>
     4b4:	98880004 	lwr	t0,4(a0)
     4b8:	01000000 	0x1000000
     4bc:	00038c9c 	0x38c9c
     4c0:	66740f00 	0x66740f00
     4c4:	a93e0100 	swl	s8,256(t1)
     4c8:	fb000002 	sdc2	$0,2(t8)
     4cc:	1f000001 	bgtz	t8,4d4 <_data-0x7ffffb2c>
     4d0:	00000038 	0x38
     4d4:	00000378 	0x378
     4d8:	0100691e 	0x100691e
     4dc:	0000583f 	0x583f
     4e0:	00022700 	sll	a0,v0,0x1c
     4e4:	04581900 	0x4581900
     4e8:	05228800 	bltzl	t1,fffe24ec <_text_end+0x77fe15d4>
     4ec:	01180000 	0x1180000
     4f0:	00830254 	0x830254
     4f4:	02550118 	0x2550118
     4f8:	00007f81 	0x7f81
     4fc:	00048819 	0x48819
     500:	00052288 	0x52288
     504:	54011800 	bnel	zero,at,6508 <_data-0x7fff9af8>
     508:	0b1c0305 	j	c700c14 <_data-0x738ff3ec>
     50c:	00008800 	sll	s1,zero,0x0
     510:	00024820 	add	t1,zero,v0
     514:	95350100 	lhu	s5,256(t1)
     518:	01000000 	0x1000000
     51c:	000003a6 	0x3a6
     520:	01006e13 	0x1006e13
     524:	00009536 	tne	zero,zero,0x254
     528:	69200000 	0x69200000
     52c:	01000002 	0x1000002
     530:	0000952c 	0x952c
     534:	03c00100 	0x3c00100
     538:	6e130000 	0x6e130000
     53c:	952d0100 	lhu	t5,256(t1)
     540:	00000000 	nop
     544:	0002421c 	0x2421c
     548:	480b0100 	0x480b0100
     54c:	c8880003 	lwc2	$8,3(a0)
     550:	01000000 	0x1000000
     554:	0004ec9c 	0x4ec9c
     558:	03da1200 	0x3da1200
     55c:	18010000 	0x18010000
     560:	00000058 	0x58
     564:	00000269 	0x269
     568:	00044412 	0x44412
     56c:	58210100 	0x58210100
     570:	87000000 	lh	zero,0(t8)
     574:	1a000002 	blez	s0,580 <_data-0x7ffffa80>
     578:	8800035c 	lwl	zero,860(zero)
     57c:	0000054e 	0x54e
     580:	00036417 	0x36417
     584:	00054388 	0x54388
     588:	00040f00 	sll	at,a0,0x1c
     58c:	54011800 	bnel	zero,at,6590 <_data-0x7fff9a70>
     590:	17003401 	bnez	t8,d598 <_data-0x7fff2a68>
     594:	88000370 	lwl	zero,880(zero)
     598:	00000538 	0x538
     59c:	00000426 	0x426
     5a0:	05540118 	0x5540118
     5a4:	000a3403 	sra	a2,t2,0x10
     5a8:	8c170088 	lw	s7,136(zero)
     5ac:	38880003 	xori	t0,a0,0x3
     5b0:	3d000005 	0x3d000005
     5b4:	18000004 	blez	zero,5c8 <_data-0x7ffffa38>
     5b8:	03055401 	0x3055401
     5bc:	88000a5c 	lwl	zero,2652(zero)
     5c0:	03981700 	0x3981700
     5c4:	05438800 	bgezl	t2,fffe25c8 <_text_end+0x77fe16b0>
     5c8:	04500000 	bltzal	v0,5cc <_data-0x7ffffa34>
     5cc:	01180000 	0x1180000
     5d0:	00350154 	0x350154
     5d4:	0003b017 	0x3b017
     5d8:	00052288 	0x52288
     5dc:	00047300 	sll	t6,a0,0xc
     5e0:	54011800 	bnel	zero,at,65e4 <_data-0x7fff9a1c>
     5e4:	0a840305 	j	a100c14 <_data-0x75eff3ec>
     5e8:	01188800 	0x1188800
     5ec:	00810255 	0x810255
     5f0:	02560118 	0x2560118
     5f4:	17000080 	bnez	t8,7f8 <_data-0x7ffff808>
     5f8:	880003c0 	lwl	zero,960(zero)
     5fc:	00000559 	0x559
     600:	00000492 	0x492
     604:	02540118 	0x2540118
     608:	01180081 	0x1180081
     60c:	18300155 	0x18300155
     610:	80025601 	lb	v0,22017(zero)
     614:	c8170000 	lwc2	$23,0(zero)
     618:	43880003 	c0	0x1880003
     61c:	a5000005 	sh	zero,5(t0)
     620:	18000004 	blez	zero,634 <_data-0x7ffff9cc>
     624:	36015401 	ori	at,s0,0x5401
     628:	03d01a00 	0x3d01a00
     62c:	05648800 	0x5648800
     630:	e4170000 	swc1	$f23,0(zero)
     634:	38880003 	xori	t0,a0,0x3
     638:	c5000005 	lwc1	$f0,5(t0)
     63c:	18000004 	blez	zero,650 <_data-0x7ffff9b0>
     640:	03055401 	0x3055401
     644:	88000ac0 	lwl	zero,2752(zero)
     648:	03fc2100 	0x3fc2100
     64c:	05438800 	bgezl	t2,fffe2650 <_text_end+0x77fe1738>
     650:	04d80000 	0x4d80000
     654:	01180000 	0x1180000
     658:	00370154 	0x370154
     65c:	00040819 	0x40819
     660:	00052288 	0x52288
     664:	54011800 	bnel	zero,at,6668 <_data-0x7fff9998>
     668:	0adc0305 	j	b700c14 <_data-0x748ff3ec>
     66c:	00008800 	sll	s1,zero,0x0
     670:	0003a622 	0x3a622
     674:	00000000 	nop
     678:	00000c00 	sll	at,zero,0x10
     67c:	079c0100 	0x79c0100
     680:	23000005 	addi	zero,t8,5
     684:	000003b6 	tne	zero,zero,0xe
     688:	22005201 	addi	zero,s0,20993
     68c:	0000038c 	syscall	0xe
     690:	00000000 	nop
     694:	0000000c 	syscall
     698:	05229c01 	bltzl	t1,fffe76a0 <_text_end+0x77fe6788>
     69c:	9c230000 	0x9c230000
     6a0:	01000003 	0x1000003
     6a4:	f1240052 	0xf1240052
     6a8:	f1000003 	0xf1000003
     6ac:	06000003 	bltz	s0,6bc <_data-0x7ffff944>
     6b0:	0258240c 	syscall	0x96090
     6b4:	02580000 	0x2580000
     6b8:	4a040000 	c2	0x40000
     6bc:	00043024 	and	a2,zero,a0
     6c0:	00043000 	sll	a2,a0,0x0
     6c4:	240a0600 	li	t2,1536
     6c8:	000003e3 	0x3e3
     6cc:	000003e3 	0x3e3
     6d0:	93244c04 	lbu	a0,19460(t9)
     6d4:	93000002 	lbu	zero,2(t8)
     6d8:	04000002 	bltz	zero,6e4 <_data-0x7ffff91c>
     6dc:	02a82442 	0x2a82442
     6e0:	02a80000 	0x2a80000
     6e4:	15070000 	bne	t0,a3,6e8 <_data-0x7ffff918>
     6e8:	0000a824 	and	s5,zero,zero
     6ec:	0000a800 	sll	s5,zero,0x0
     6f0:	000a0800 	sll	at,t2,0x0
     6f4:	000001c2 	srl	zero,zero,0x7
     6f8:	02ba0004 	sllv	zero,k0,s5
     6fc:	01040000 	0x1040000
     700:	00000308 	0x308
     704:	0004730c 	syscall	0x11cc
     708:	00048200 	sll	s0,a0,0x8
     70c:	00013000 	sll	a2,at,0x0
     710:	00000000 	nop
     714:	00027300 	sll	t6,v0,0xc
     718:	03040200 	0x3040200
     71c:	00840704 	0x840704
     720:	04030000 	bgezl	zero,724 <_data-0x7ffff8dc>
     724:	00007f07 	0x7f07
     728:	03f10400 	0x3f10400
     72c:	01010000 	0x1010000
     730:	00000185 	0x185
     734:	880005c4 	lwl	zero,1476(zero)
     738:	00000224 	0x224
     73c:	01859c01 	0x1859c01
     740:	66050000 	0x66050000
     744:	0100746d 	0x100746d
     748:	00018c01 	0x18c01
     74c:	0002a500 	sll	s4,v0,0x14
     750:	69070600 	0x69070600
     754:	85030100 	lh	v1,256(t0)
     758:	dc000001 	ldc3	$0,1(zero)
     75c:	07000002 	bltz	t8,768 <_data-0x7ffff898>
     760:	04010063 	b	8f0 <_data-0x7ffff710>
     764:	00000192 	0x192
     768:	00000344 	0x344
     76c:	67726107 	0x67726107
     770:	9e050100 	0x9e050100
     774:	62000001 	0x62000001
     778:	08000003 	j	c <_data-0x7ffffff4>
     77c:	01007061 	0x1007061
     780:	00002506 	0x2506
     784:	60910200 	0x60910200
     788:	01007707 	0x1007707
     78c:	00018507 	0x18507
     790:	00038000 	sll	s0,v1,0x0
     794:	047c0900 	0x47c0900
     798:	10010000 	beq	zero,at,79c <_data-0x7ffff864>
     79c:	88000648 	lwl	zero,1608(zero)
     7a0:	0000e00a 	movz	gp,zero,zero
     7a4:	00013600 	sll	a2,at,0x18
     7a8:	04c10b00 	bgez	a2,33ac <_data-0x7fffcc54>
     7ac:	14010000 	bne	zero,at,7b0 <_data-0x7ffff850>
     7b0:	00000185 	0x185
     7b4:	000000c6 	0xc6
     7b8:	610b0006 	0x610b0006
     7bc:	01000004 	sllv	zero,zero,t0
     7c0:	00018519 	0x18519
     7c4:	0000d700 	sll	k0,zero,0x1c
     7c8:	0b000600 	j	c001800 <_data-0x73ffe800>
     7cc:	00000469 	0x469
     7d0:	01851e01 	0x1851e01
     7d4:	00e80000 	0xe80000
     7d8:	00060000 	sll	zero,a2,0x0
     7dc:	0006b40c 	syscall	0x1ad0
     7e0:	0001a488 	0x1a488
     7e4:	07100c00 	bltzal	t8,37e8 <_data-0x7fffc818>
     7e8:	01af8800 	0x1af8800
     7ec:	340c0000 	li	t4,0x0
     7f0:	ba880007 	swr	t0,7(s4)
     7f4:	0c000001 	jal	4 <_data-0x7ffffffc>
     7f8:	88000750 	lwl	zero,1872(zero)
     7fc:	000001ba 	0x1ba
     800:	0007680d 	break	0x7,0x1a0
     804:	0001ba88 	0x1ba88
     808:	00012500 	sll	a0,at,0x14
     80c:	56010e00 	bnel	s0,at,4010 <_data-0x7fffbff0>
     810:	0e008302 	jal	8020c08 <_data-0x77fdf3f8>
     814:	30015701 	andi	at,zero,0x5701
     818:	07940f00 	0x7940f00
     81c:	01a48800 	0x1a48800
     820:	010e0000 	0x10e0000
     824:	25080254 	addiu	t0,t0,596
     828:	c0100000 	ll	s0,0(zero)
     82c:	0b000000 	j	c000000 <_data-0x74000000>
     830:	00000461 	0x461
     834:	01851901 	0x1851901
     838:	014c0000 	0x14c0000
     83c:	00060000 	sll	zero,a2,0x0
     840:	0007d811 	0x7d811
     844:	00000888 	0x888
     848:	00017a00 	sll	t7,at,0x8
     84c:	04610b00 	bgez	v1,3450 <_data-0x7fffcbb0>
     850:	19010000 	0x19010000
     854:	00000185 	0x185
     858:	0000016a 	0x16a
     85c:	e00f0006 	sc	t7,6(zero)
     860:	a4880007 	sh	t0,7(a0)
     864:	0e000001 	jal	8000004 <_data-0x77fffffc>
     868:	3d015401 	0x3d015401
     86c:	8c0c0000 	lw	t4,0(zero)
     870:	a4880006 	sh	t0,6(a0)
     874:	00000001 	movf	zero,zero,$fcc0
     878:	05041200 	0x5041200
     87c:	00746e69 	0x746e69
     880:	01990413 	0x1990413
     884:	01030000 	0x1030000
     888:	00027b06 	0x27b06
     88c:	01921400 	0x1921400
     890:	04130000 	bgezall	zero,894 <_data-0x7ffff76c>
     894:	00000025 	move	zero,zero
     898:	00046115 	0x46115
     89c:	00046100 	sll	t4,a0,0x4
     8a0:	15190100 	bne	t0,t9,ca4 <_data-0x7ffff35c>
     8a4:	000004c1 	0x4c1
     8a8:	000004c1 	0x4c1
     8ac:	69151401 	0x69151401
     8b0:	69000004 	0x69000004
     8b4:	01000004 	sllv	zero,zero,t0
     8b8:	014a001e 	0x14a001e
     8bc:	00040000 	sll	zero,a0,0x0
     8c0:	000003c4 	0x3c4
     8c4:	03080104 	0x3080104
     8c8:	d10c0000 	0xd10c0000
     8cc:	82000004 	lb	zero,4(s0)
     8d0:	40000004 	mfc0	zero,$0,4
     8d4:	00000001 	movf	zero,zero,$fcc0
     8d8:	21000000 	addi	zero,t0,0
     8dc:	02000003 	0x2000003
     8e0:	00840704 	0x840704
     8e4:	04020000 	bltzl	zero,8e8 <_data-0x7ffff718>
     8e8:	00007f07 	0x7f07
     8ec:	04690300 	tgeiu	v1,768
     8f0:	01010000 	0x1010000
     8f4:	0000011d 	0x11d
     8f8:	880007e8 	lwl	zero,2024(zero)
     8fc:	000000d8 	0xd8
     900:	011d9c01 	0x11d9c01
     904:	76040000 	jalx	8100000 <_data-0x77f00000>
     908:	24010100 	li	at,256
     90c:	eb000001 	swc2	$0,1(t8)
     910:	04000003 	bltz	zero,920 <_data-0x7ffff6e0>
     914:	01010077 	0x1010077
     918:	0000011d 	0x11d
     91c:	00000433 	tltu	zero,zero,0x10
     920:	00040705 	0x40705
     924:	1d010100 	0x1d010100
     928:	83000001 	lb	zero,1(t8)
     92c:	05000004 	bltz	t0,940 <_data-0x7ffff6c0>
     930:	000004dd 	0x4dd
     934:	011d0101 	0x11d0101
     938:	04c50000 	0x4c50000
     93c:	69060000 	0x69060000
     940:	1d030100 	0x1d030100
     944:	ff000001 	sdc3	$0,1(t8)
     948:	06000004 	bltz	s0,95c <_data-0x7ffff6a4>
     94c:	0301006a 	0x301006a
     950:	0000011d 	0x11d
     954:	00000528 	0x528
     958:	01006306 	0x1006306
     95c:	00011d04 	0x11d04
     960:	00057700 	sll	t6,a1,0x1c
     964:	75620700 	jalx	5881c00 <_data-0x7a77e400>
     968:	05010066 	bgez	t0,b04 <_data-0x7ffff4fc>
     96c:	0000012b 	0x12b
     970:	7fa89103 	0x7fa89103
     974:	0004cb08 	0x4cb08
     978:	2c060100 	sltiu	a2,zero,256
     97c:	8a000000 	lwl	zero,0(s0)
     980:	09000005 	j	4000014 <_data-0x7bffffec>
     984:	88000818 	lwl	zero,2072(zero)
     988:	00000010 	mfhi	zero
     98c:	000000f8 	0xf8
     990:	0004610a 	0x4610a
     994:	1d0a0100 	0x1d0a0100
     998:	e7000001 	swc1	$f0,1(t8)
     99c:	0b000000 	j	c000000 <_data-0x74000000>
     9a0:	08240c00 	j	903000 <_data-0x7f6fd000>
     9a4:	01428800 	0x1428800
     9a8:	010d0000 	0x10d0000
     9ac:	2d080254 	sltiu	t0,t0,596
     9b0:	900e0000 	lbu	t6,0(zero)
     9b4:	30880008 	andi	t0,a0,0x8
     9b8:	0a000000 	j	8000000 <_data-0x78000000>
     9bc:	00000461 	0x461
     9c0:	011d0a01 	0x11d0a01
     9c4:	01120000 	0x1120000
     9c8:	000b0000 	sll	zero,t3,0x0
     9cc:	0008b80f 	0x8b80f
     9d0:	00014288 	0x14288
     9d4:	10000000 	b	9d8 <_data-0x7ffff628>
     9d8:	6e690504 	0x6e690504
     9dc:	04020074 	bltzl	zero,bb0 <_data-0x7ffff450>
     9e0:	00041e05 	0x41e05
     9e4:	013b1100 	0x13b1100
     9e8:	013b0000 	0x13b0000
     9ec:	25120000 	addiu	s2,t0,0
     9f0:	3f000000 	0x3f000000
     9f4:	06010200 	bgez	s0,11f8 <_data-0x7fffee08>
     9f8:	0000027b 	0x27b
     9fc:	00046113 	0x46113
     a00:	00046100 	sll	t4,a0,0x4
     a04:	000a0100 	sll	zero,t2,0x4
     a08:	00000416 	0x416
     a0c:	04c60004 	0x4c60004
     a10:	01040000 	0x1040000
     a14:	00000308 	0x308
     a18:	0004f00c 	syscall	0x13c0
     a1c:	00048200 	sll	s0,a0,0x8
     a20:	00015000 	sll	t2,at,0x0
     a24:	00000000 	nop
     a28:	00039b00 	sll	s3,v1,0xc
     a2c:	03040200 	0x3040200
     a30:	00840704 	0x840704
     a34:	04030000 	bgezl	zero,a38 <_data-0x7ffff5c8>
     a38:	00007f07 	0x7f07
     a3c:	04f90400 	0x4f90400
     a40:	10020000 	beq	zero,v0,a44 <_data-0x7ffff5bc>
     a44:	00000027 	nor	zero,zero,zero
     a48:	0004ea05 	0x4ea05
     a4c:	01720100 	0x1720100
     a50:	00000000 	nop
     a54:	0000000c 	syscall
     a58:	008e9c01 	0x8e9c01
     a5c:	73060000 	madd	t8,a2
     a60:	01720100 	0x1720100
     a64:	00000025 	move	zero,zero
     a68:	6e075401 	0x6e075401
     a6c:	01720100 	0x1720100
     a70:	00000035 	0x35
     a74:	000005be 	0x5be
     a78:	00000008 	jr	zero
     a7c:	0001dd00 	sll	k1,at,0x14
     a80:	54010900 	bnel	zero,at,2e84 <_data-0x7fffd17c>
     a84:	09007402 	j	401d008 <_data-0x7bfe2ff8>
     a88:	75025501 	jalx	4095404 <_data-0x7bf6abfc>
     a8c:	56010900 	bnel	s0,at,2e90 <_data-0x7fffd170>
     a90:	5501f303 	bnel	t0,at,ffffd6a0 <_text_end+0x77ffc788>
     a94:	000a0000 	sll	zero,t2,0x0
     a98:	01000005 	0x1000005
     a9c:	00ef0166 	0xef0166
     aa0:	00000000 	nop
     aa4:	00400000 	0x400000
     aa8:	9c010000 	0x9c010000
     aac:	000000ef 	0xef
     ab0:	00317607 	0x317607
     ab4:	f6016601 	sdc1	$f1,26113(s0)
     ab8:	ea000000 	swc2	$0,0(s0)
     abc:	07000005 	bltz	t8,ad4 <_data-0x7ffff52c>
     ac0:	01003276 	tne	t0,zero,0xc9
     ac4:	00f60166 	0xf60166
     ac8:	060b0000 	tltiu	s0,0
     acc:	6e070000 	0x6e070000
     ad0:	01660100 	0x1660100
     ad4:	00000035 	0x35
     ad8:	0000062c 	0x62c
     adc:	0031730b 	0x31730b
     ae0:	fd016701 	sdc3	$1,26369(t0)
     ae4:	01000000 	0x1000000
     ae8:	32730b54 	andi	s3,s3,0xb54
     aec:	01680100 	0x1680100
     af0:	000000fd 	0xfd
     af4:	0c005501 	jal	15404 <_data-0x7ffeabfc>
     af8:	6e690504 	0x6e690504
     afc:	040d0074 	0x40d0074
     b00:	000000fc 	0xfc
     b04:	0a040d0e 	j	8103438 <_data-0x77efcbc8>
     b08:	03000001 	movf	zero,t8,$fcc0
     b0c:	027b0601 	0x27b0601
     b10:	030f0000 	0x30f0000
     b14:	0a000001 	j	8000004 <_data-0x77fffffc>
     b18:	000004e2 	0x4e2
     b1c:	25014301 	addiu	at,t0,17153
     b20:	00000000 	nop
     b24:	70000000 	madd	zero,zero
     b28:	01000000 	0x1000000
     b2c:	0001749c 	0x1749c
     b30:	73640700 	0x73640700
     b34:	43010074 	c0	0x1010074
     b38:	00002501 	0x2501
     b3c:	00064f00 	sll	t1,a2,0x1c
     b40:	72730700 	0x72730700
     b44:	43010063 	c0	0x1010063
     b48:	0000f601 	0xf601
     b4c:	00066d00 	sll	t5,a2,0x14
     b50:	006e0700 	0x6e0700
     b54:	35014301 	ori	at,t0,0x4301
     b58:	a7000000 	sh	zero,0(t8)
     b5c:	10000006 	b	b78 <_data-0x7ffff488>
     b60:	47010073 	c1	0x1010073
     b64:	0000fd01 	0xfd01
     b68:	00072b00 	sll	a1,a3,0xc
     b6c:	00641000 	0x641000
     b70:	74014801 	jalx	52004 <_data-0x7ffadffc>
     b74:	54000001 	bnezl	zero,b7c <_data-0x7ffff484>
     b78:	00000007 	srav	zero,zero,zero
     b7c:	0103040d 	break	0x103,0x10
     b80:	2c0a0000 	sltiu	t2,zero,0
     b84:	01000005 	0x1000005
     b88:	0025012c 	0x25012c
     b8c:	00000000 	nop
     b90:	002c0000 	0x2c0000
     b94:	9c010000 	0x9c010000
     b98:	000001dd 	0x1dd
     b9c:	74736407 	jalx	1cd901c <_data-0x7e326fe4>
     ba0:	012c0100 	0x12c0100
     ba4:	00000025 	move	zero,zero
     ba8:	000007a9 	0x7a9
     bac:	63727307 	0x63727307
     bb0:	012c0100 	0x12c0100
     bb4:	000000f6 	tne	zero,zero,0x3
     bb8:	000007c7 	0x7c7
     bbc:	01006e07 	0x1006e07
     bc0:	0035012c 	0x35012c
     bc4:	07e80000 	tgei	ra,0
     bc8:	730b0000 	madd	t8,t3
     bcc:	01300100 	0x1300100
     bd0:	000000fd 	0xfd
     bd4:	64105501 	0x64105501
     bd8:	01310100 	0x1310100
     bdc:	00000174 	teq	zero,zero,0x5
     be0:	00000832 	tlt	zero,zero,0x20
     be4:	02a80a00 	0x2a80a00
     be8:	11010000 	beq	t0,at,bec <_data-0x7ffff414>
     bec:	00002501 	0x2501
     bf0:	0008c000 	sll	t8,t0,0x0
     bf4:	00002488 	0x2488
     bf8:	2e9c0100 	sltiu	gp,s4,256
     bfc:	07000002 	bltz	t8,c08 <_data-0x7ffff3f8>
     c00:	11010073 	beq	t0,at,dd0 <_data-0x7ffff230>
     c04:	00002501 	0x2501
     c08:	00085000 	sll	t2,t0,0x0
     c0c:	00630600 	0x630600
     c10:	03011101 	0x3011101
     c14:	01000001 	movf	zero,t0,$fcc0
     c18:	006e0755 	0x6e0755
     c1c:	35011101 	ori	at,t0,0x1101
     c20:	6e000000 	0x6e000000
     c24:	10000008 	b	c48 <_data-0x7ffff3b8>
     c28:	15010070 	bne	t0,at,dec <_data-0x7ffff214>
     c2c:	00017401 	0x17401
     c30:	0008b800 	sll	s7,t0,0x0
     c34:	42110000 	c0	0x110000
     c38:	01000005 	0x1000005
     c3c:	000174a3 	0x174a3
     c40:	00000000 	nop
     c44:	00002800 	sll	a1,zero,0x0
     c48:	609c0100 	0x609c0100
     c4c:	12000002 	beqz	s0,c58 <_data-0x7ffff3a8>
     c50:	a3010073 	sb	at,115(t8)
     c54:	000000fd 	0xfd
     c58:	000008d6 	0x8d6
     c5c:	01006313 	0x1006313
     c60:	000103a3 	0x103a3
     c64:	00550100 	0x550100
     c68:	00051711 	0x51711
     c6c:	748f0100 	jalx	23c0400 <_data-0x7dc3fc00>
     c70:	00000001 	movf	zero,zero,$fcc0
     c74:	2c000000 	sltiu	zero,zero,0
     c78:	01000000 	0x1000000
     c7c:	0002929c 	0x2929c
     c80:	00731200 	0x731200
     c84:	00fd8f01 	0xfd8f01
     c88:	08f40000 	j	3d00000 <_data-0x7c300000>
     c8c:	63130000 	0x63130000
     c90:	038f0100 	0x38f0100
     c94:	01000001 	movf	zero,t0,$fcc0
     c98:	3a110055 	xori	s1,s0,0x55
     c9c:	01000005 	0x1000005
     ca0:	0000ef7f 	0xef7f
     ca4:	00000000 	nop
     ca8:	00004400 	sll	t0,zero,0x10
     cac:	d59c0100 	ldc1	$f28,256(t4)
     cb0:	12000002 	beqz	s0,cbc <_data-0x7ffff344>
     cb4:	01003173 	tltu	t0,zero,0xc5
     cb8:	0000fd7f 	0xfd7f
     cbc:	00091d00 	sll	v1,t1,0x14
     cc0:	32731200 	andi	s3,s3,0x1200
     cc4:	fd7f0100 	sdc3	$31,256(t3)
     cc8:	3b000000 	xori	zero,t8,0x0
     ccc:	12000009 	beqz	s0,cf4 <_data-0x7ffff30c>
     cd0:	7f01006e 	0x7f01006e
     cd4:	00000035 	0x35
     cd8:	00000959 	0x959
     cdc:	05251100 	0x5251100
     ce0:	68010000 	0x68010000
     ce4:	000000ef 	0xef
     ce8:	00000000 	nop
     cec:	00000030 	tge	zero,zero
     cf0:	030b9c01 	0x30b9c01
     cf4:	73120000 	madd	t8,s2
     cf8:	68010031 	0x68010031
     cfc:	000000fd 	0xfd
     d00:	00000998 	0x998
     d04:	00327312 	0x327312
     d08:	00fd6801 	movt	t5,a3,$fcc7
     d0c:	09b60000 	j	6d80000 <_data-0x79280000>
     d10:	11000000 	beqz	t0,d14 <_data-0x7ffff2ec>
     d14:	00000507 	0x507
     d18:	01744d01 	0x1744d01
     d1c:	00000000 	nop
     d20:	00340000 	0x340000
     d24:	9c010000 	0x9c010000
     d28:	0000035f 	0x35f
     d2c:	74736412 	jalx	1cd9048 <_data-0x7e326fb8>
     d30:	744d0100 	jalx	1340400 <_data-0x7ecbfc00>
     d34:	d4000001 	ldc1	$f0,1(zero)
     d38:	12000009 	beqz	s0,d60 <_data-0x7ffff2a0>
     d3c:	00637273 	tltu	v1,v1,0x1c9
     d40:	00fd4d01 	0xfd4d01
     d44:	09f20000 	j	7c80000 <_data-0x78380000>
     d48:	6c120000 	0x6c120000
     d4c:	01006e65 	0x1006e65
     d50:	0000354d 	break	0x0,0xd5
     d54:	000a1000 	sll	v0,t2,0x0
     d58:	00701400 	0x701400
     d5c:	01744e01 	0x1744e01
     d60:	0a450000 	j	9140000 <_data-0x76ec0000>
     d64:	11000000 	beqz	t0,d68 <_data-0x7ffff298>
     d68:	0000051e 	0x51e
     d6c:	01743701 	0x1743701
     d70:	00000000 	nop
     d74:	00240000 	0x240000
     d78:	9c010000 	0x9c010000
     d7c:	000003a4 	0x3a4
     d80:	74736412 	jalx	1cd9048 <_data-0x7e326fb8>
     d84:	74370100 	jalx	dc0400 <_data-0x7f23fc00>
     d88:	63000001 	0x63000001
     d8c:	1200000a 	beqz	s0,db8 <_data-0x7ffff248>
     d90:	00637273 	tltu	v1,v1,0x1c9
     d94:	00fd3701 	0xfd3701
     d98:	0a810000 	j	a040000 <_data-0x75fc0000>
     d9c:	70140000 	madd	zero,s4
     da0:	743b0100 	jalx	ec0400 <_data-0x7f13fc00>
     da4:	9f000001 	0x9f000001
     da8:	0000000a 	movz	zero,zero,zero
     dac:	00050f11 	0x50f11
     db0:	35220100 	ori	v0,t1,0x100
     db4:	00000000 	nop
     db8:	28000000 	slti	zero,zero,0
     dbc:	01000000 	0x1000000
     dc0:	0003e79c 	0x3e79c
     dc4:	00731200 	0x731200
     dc8:	00fd2201 	0xfd2201
     dcc:	0abd0000 	j	af40000 <_data-0x750c0000>
     dd0:	6c130000 	0x6c130000
     dd4:	01006e65 	0x1006e65
     dd8:	00003522 	0x3522
     ddc:	14550100 	bne	v0,s5,11e0 <_data-0x7fffee20>
     de0:	00746e63 	0x746e63
     de4:	00352301 	0x352301
     de8:	0b020000 	j	c080000 <_data-0x73f80000>
     dec:	15000000 	bnez	t0,df0 <_data-0x7ffff210>
     df0:	00000533 	tltu	zero,zero,0x14
     df4:	00350c01 	0x350c01
     df8:	00000000 	nop
     dfc:	00200000 	0x200000
     e00:	9c010000 	0x9c010000
     e04:	01007312 	0x1007312
     e08:	0000fd0c 	syscall	0x3f4
     e0c:	000b2100 	sll	a0,t3,0x4
     e10:	6e631400 	0x6e631400
     e14:	0d010074 	jal	40401d0 <_data-0x7bfbfe30>
     e18:	00000035 	0x35
     e1c:	00000b3f 	0xb3f
     e20:	014c0000 	0x14c0000
     e24:	00040000 	sll	zero,a0,0x0
     e28:	00000608 	0x608
     e2c:	03080104 	0x3080104
     e30:	4a0c0000 	c2	0xc0000
     e34:	82000005 	lb	zero,5(s0)
     e38:	d8000004 	ldc2	$0,4(zero)
     e3c:	00000001 	movf	zero,zero,$fcc0
     e40:	18000000 	blez	zero,e44 <_data-0x7ffff1bc>
     e44:	02000005 	0x2000005
     e48:	00840704 	0x840704
     e4c:	04020000 	bltzl	zero,e50 <_data-0x7ffff1b0>
     e50:	00007f07 	0x7f07
     e54:	04300300 	bltzal	at,1a58 <_data-0x7fffe5a8>
     e58:	0e010000 	jal	8040000 <_data-0x77fc0000>
     e5c:	000000a2 	0xa2
     e60:	88000944 	lwl	zero,2372(zero)
     e64:	00000030 	tge	zero,zero
     e68:	00a29c01 	0xa29c01
     e6c:	73040000 	madd	t8,a0
     e70:	a90e0100 	swl	t6,256(t0)
     e74:	5e000000 	bgtzl	s0,e78 <_data-0x7ffff188>
     e78:	0500000b 	bltz	t0,ea8 <_data-0x7ffff158>
     e7c:	00000461 	0x461
     e80:	00a20701 	0xa20701
     e84:	006a0000 	0x6a0000
     e88:	00060000 	sll	zero,a2,0x0
     e8c:	00095407 	0x95407
     e90:	0000bb88 	0xbb88
     e94:	00007f00 	sll	t7,zero,0x1c
     e98:	54010800 	bnel	zero,at,2e9c <_data-0x7fffd164>
     e9c:	5401f303 	bnel	zero,at,ffffdaac <_text_end+0x77ffcb94>
     ea0:	095c0700 	j	5701c00 <_data-0x7a8fe400>
     ea4:	01448800 	0x1448800
     ea8:	00920000 	0x920000
     eac:	01080000 	0x1080000
     eb0:	003d0154 	0x3d0154
     eb4:	00096409 	0x96409
     eb8:	00014488 	0x14488
     ebc:	54010800 	bnel	zero,at,2ec0 <_data-0x7fffd140>
     ec0:	00003a01 	0x3a01
     ec4:	6905040a 	0x6905040a
     ec8:	0b00746e 	j	c01d1b8 <_data-0x73fe2e48>
     ecc:	0000b604 	0xb604
     ed0:	06010200 	bgez	s0,16d4 <_data-0x7fffe92c>
     ed4:	0000027b 	0x27b
     ed8:	0000af0c 	syscall	0x2bc
     edc:	04c10300 	bgez	a2,1ae0 <_data-0x7fffe520>
     ee0:	01010000 	0x1010000
     ee4:	000000a2 	0xa2
     ee8:	880008e4 	lwl	zero,2276(zero)
     eec:	00000060 	0x60
     ef0:	01449c01 	0x1449c01
     ef4:	73040000 	madd	t8,a0
     ef8:	a9010100 	swl	at,256(t0)
     efc:	7f000000 	0x7f000000
     f00:	0d00000b 	jal	400002c <_data-0x7bffffd4>
     f04:	03010063 	0x3010063
     f08:	000000af 	0xaf
     f0c:	00000ba8 	0xba8
     f10:	0001c00e 	0x1c00e
     f14:	04610500 	bgez	v1,2318 <_data-0x7fffdce8>
     f18:	07010000 	bgez	t8,f1c <_data-0x7ffff0e4>
     f1c:	000000a2 	0xa2
     f20:	00000104 	0x104
     f24:	2c0f0006 	sltiu	t7,zero,6
     f28:	08880009 	j	2200024 <_data-0x7ddfffdc>
     f2c:	32000000 	andi	zero,s0,0x0
     f30:	05000001 	bltz	t0,f38 <_data-0x7ffff0c8>
     f34:	00000461 	0x461
     f38:	00a20701 	0xa20701
     f3c:	01220000 	0x1220000
     f40:	00060000 	sll	zero,a2,0x0
     f44:	00093409 	0x93409
     f48:	00014488 	0x14488
     f4c:	54010800 	bnel	zero,at,2f50 <_data-0x7fffd0b0>
     f50:	00003d01 	0x3d01
     f54:	00093c09 	0x93c09
     f58:	00014488 	0x14488
     f5c:	54010800 	bnel	zero,at,2f60 <_data-0x7fffd0a0>
     f60:	00008002 	srl	s0,zero,0x0
     f64:	61100000 	0x61100000
     f68:	61000004 	0x61000004
     f6c:	01000004 	sllv	zero,zero,t0
     f70:	00b20007 	srav	zero,s2,a1
     f74:	00040000 	sll	zero,a0,0x0
     f78:	000006db 	0x6db
     f7c:	03080104 	0x3080104
     f80:	5e0c0000 	0x5e0c0000
     f84:	82000005 	lb	zero,5(s0)
     f88:	f0000004 	0xf0000004
     f8c:	00000001 	movf	zero,zero,$fcc0
     f90:	6b000000 	0x6b000000
     f94:	02000005 	0x2000005
     f98:	00840704 	0x840704
     f9c:	04020000 	bltzl	zero,fa0 <_data-0x7ffff060>
     fa0:	00007f07 	0x7f07
     fa4:	06010200 	bgez	s0,17a8 <_data-0x7fffe858>
     fa8:	00000274 	teq	zero,zero,0x9
     fac:	f8050202 	sdc2	$5,514(zero)
     fb0:	03000003 	0x3000003
     fb4:	6e690504 	0x6e690504
     fb8:	04020074 	bltzl	zero,118c <_data-0x7fffee74>
     fbc:	00041e05 	0x41e05
     fc0:	02f50400 	0x2f50400
     fc4:	09020000 	j	4080000 <_data-0x7bf80000>
     fc8:	0000005a 	0x5a
     fcc:	72080102 	0x72080102
     fd0:	02000002 	0x2000002
     fd4:	02800702 	0x2800702
     fd8:	62040000 	0x62040000
     fdc:	03000002 	0x3000002
     fe0:	00004f0b 	0x4f0b
     fe4:	04610500 	bgez	v1,23e8 <_data-0x7fffdc18>
     fe8:	03010000 	0x3010000
     fec:	00000041 	0x41
     ff0:	88000974 	lwl	zero,2420(zero)
     ff4:	0000002c 	0x2c
     ff8:	00aa9c01 	0xaa9c01
     ffc:	63060000 	0x63060000
    1000:	41030100 	bc0tl	1404 <_data-0x7fffebfc>
    1004:	c6000000 	lwc1	$f0,0(s0)
    1008:	0700000b 	bltz	t8,1038 <_data-0x7fffefc8>
    100c:	8800098c 	lwl	zero,2444(zero)
    1010:	000000aa 	0xaa
    1014:	02540108 	0x2540108
    1018:	00000080 	sll	zero,zero,0x2
    101c:	00055109 	0x55109
    1020:	00055100 	sll	t2,a1,0x4
    1024:	00460300 	0x460300
    1028:	00000b3b 	0xb3b
    102c:	07650004 	0x7650004
    1030:	01040000 	0x1040000
    1034:	000000bd 	0xbd
    1038:	00069904 	0x69904
    103c:	00048200 	sll	s0,a0,0x8
    1040:	00021800 	sll	v1,v0,0x0
    1044:	00000000 	nop
    1048:	0005c800 	sll	t9,a1,0x0
    104c:	03040200 	0x3040200
    1050:	00840704 	0x840704
    1054:	27040000 	addiu	a0,t8,0
    1058:	03000000 	0x3000000
    105c:	007f0704 	0x7f0704
    1060:	33040000 	andi	a0,t8,0x0
    1064:	05000000 	bltz	t0,1068 <_data-0x7fffef98>
    1068:	00000415 	0x415
    106c:	00270f02 	ror	at,a3,0x1c
    1070:	01030000 	0x1030000
    1074:	00027406 	0x27406
    1078:	05020300 	bltzl	t0,1c7c <_data-0x7fffe384>
    107c:	000003f8 	0x3f8
    1080:	69050406 	0x69050406
    1084:	0300746e 	0x300746e
    1088:	041e0504 	0x41e0504
    108c:	f5050000 	sdc1	$f5,0(t0)
    1090:	03000002 	0x3000002
    1094:	00007109 	0x7109
    1098:	08010300 	j	40c00 <_data-0x7ffbf400>
    109c:	00000272 	tlt	zero,zero,0x9
    10a0:	00007104 	0x7104
    10a4:	040c0500 	teqi	zero,1280
    10a8:	0a030000 	j	80c0000 <_data-0x77f40000>
    10ac:	00000088 	0x88
    10b0:	80070203 	lb	a3,515(zero)
    10b4:	04000002 	bltz	zero,10c0 <_data-0x7fffef40>
    10b8:	00000088 	0x88
    10bc:	0005bd05 	0x5bd05
    10c0:	330c0300 	andi	t4,t8,0x300
    10c4:	05000000 	bltz	t0,10c8 <_data-0x7fffef38>
    10c8:	00000262 	0x262
    10cc:	00660b04 	0x660b04
    10d0:	23050000 	addi	a1,t8,0
    10d4:	04000007 	bltz	zero,10f4 <_data-0x7fffef0c>
    10d8:	00007d0c 	syscall	0x1f4
    10dc:	06550500 	0x6550500
    10e0:	0d040000 	jal	4100000 <_data-0x7bf00000>
    10e4:	0000003f 	0x3f
    10e8:	00065405 	0x65405
    10ec:	940e0400 	lhu	t6,1024(zero)
    10f0:	07000000 	bltz	t8,10f4 <_data-0x7fffef0c>
    10f4:	00000606 	0x606
    10f8:	05e60a01 	0x5e60a01
    10fc:	04010000 	b	1100 <_data-0x7fffef00>
    1100:	08000001 	j	4 <_data-0x7ffffffc>
    1104:	00330054 	0x330054
    1108:	08090000 	j	240000 <_data-0x7fdc0000>
    110c:	01000002 	0x1000002
    1110:	0000250a 	0x250a
    1114:	059e0900 	0x59e0900
    1118:	0a010000 	j	8040000 <_data-0x77fc0000>
    111c:	00000033 	tltu	zero,zero
    1120:	7274700a 	0x7274700a
    1124:	040b0100 	tltiu	zero,256
    1128:	00000001 	movf	zero,zero,$fcc0
    112c:	003a040b 	0x3a040b
    1130:	35070000 	ori	a3,t0,0x0
    1134:	01000007 	srav	zero,zero,t0
    1138:	0005740a 	0x5740a
    113c:	01430100 	0x1430100
    1140:	54080000 	bnel	zero,t0,1144 <_data-0x7fffeebc>
    1144:	00002700 	sll	a0,zero,0x1c
    1148:	02080900 	0x2080900
    114c:	0a010000 	j	8040000 <_data-0x77fc0000>
    1150:	00000025 	move	zero,zero
    1154:	00059e09 	0x59e09
    1158:	270a0100 	addiu	t2,t8,256
    115c:	0a000000 	j	8000000 <_data-0x78000000>
    1160:	00727470 	tge	v1,s2,0x1d1
    1164:	01430b01 	0x1430b01
    1168:	0b000000 	j	c000000 <_data-0x74000000>
    116c:	00002e04 	0x2e04
    1170:	066b0700 	tltiu	s3,1792
    1174:	0a010000 	j	8040000 <_data-0x77fc0000>
    1178:	000006d4 	0x6d4
    117c:	00018201 	0x18201
    1180:	00540800 	0x540800
    1184:	00000088 	0x88
    1188:	00020809 	0x20809
    118c:	250a0100 	addiu	t2,t0,256
    1190:	09000000 	j	4000000 <_data-0x7c000000>
    1194:	0000059e 	0x59e
    1198:	00880a01 	0x880a01
    119c:	700a0000 	madd	zero,t2
    11a0:	01007274 	teq	t0,zero,0x1c9
    11a4:	0001820b 	0x1820b
    11a8:	040b0000 	tltiu	zero,0
    11ac:	0000008f 	sync	0x2
    11b0:	0005c607 	0x5c607
    11b4:	b00a0100 	0xb00a0100
    11b8:	01000006 	srlv	zero,zero,t0
    11bc:	000001c1 	0x1c1
    11c0:	71005408 	0x71005408
    11c4:	09000000 	j	4000000 <_data-0x7c000000>
    11c8:	00000208 	0x208
    11cc:	00250a01 	0x250a01
    11d0:	9e090000 	0x9e090000
    11d4:	01000005 	0x1000005
    11d8:	0000710a 	0x710a
    11dc:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    11e0:	0b010072 	j	c0401c8 <_data-0x73fbfe38>
    11e4:	000001c1 	0x1c1
    11e8:	78040b00 	0x78040b00
    11ec:	0c000000 	jal	0 <_data-0x80000000>
    11f0:	0000062b 	0x62b
    11f4:	05ae0401 	tnei	t5,1025
    11f8:	00330000 	0x330000
    11fc:	f9010000 	sdc2	$1,0(t0)
    1200:	08000001 	j	4 <_data-0x7ffffffc>
    1204:	00330054 	0x330054
    1208:	08090000 	j	240000 <_data-0x7fdc0000>
    120c:	01000002 	0x1000002
    1210:	00002504 	0x2504
    1214:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    1218:	05010072 	bgez	t0,13e4 <_data-0x7fffec1c>
    121c:	00000104 	0x104
    1220:	06c10c00 	bgez	s6,4224 <_data-0x7fffbddc>
    1224:	04010000 	b	1228 <_data-0x7fffedd8>
    1228:	000006e5 	0x6e5
    122c:	00000027 	nor	zero,zero,zero
    1230:	00022b01 	0x22b01
    1234:	00540800 	0x540800
    1238:	00000027 	nor	zero,zero,zero
    123c:	00020809 	0x20809
    1240:	25040100 	addiu	a0,t0,256
    1244:	0a000000 	j	8000000 <_data-0x78000000>
    1248:	00727470 	tge	v1,s2,0x1d1
    124c:	01430501 	0x1430501
    1250:	0c000000 	jal	0 <_data-0x80000000>
    1254:	0000070a 	0x70a
    1258:	05f70401 	0x5f70401
    125c:	00880000 	0x880000
    1260:	5d010000 	0x5d010000
    1264:	08000002 	j	8 <_data-0x7ffffff8>
    1268:	00880054 	0x880054
    126c:	08090000 	j	240000 <_data-0x7fdc0000>
    1270:	01000002 	0x1000002
    1274:	00002504 	0x2504
    1278:	74700a00 	jalx	1c02800 <_data-0x7e3fd800>
    127c:	05010072 	bgez	t0,1448 <_data-0x7fffebb8>
    1280:	00000182 	srl	zero,zero,0x6
    1284:	06850c00 	0x6850c00
    1288:	04010000 	b	128c <_data-0x7fffed74>
    128c:	0000065c 	0x65c
    1290:	00000071 	tgeu	zero,zero,0x1
    1294:	00028f01 	0x28f01
    1298:	00540800 	0x540800
    129c:	00000071 	tgeu	zero,zero,0x1
    12a0:	00020809 	0x20809
    12a4:	25040100 	addiu	a0,t0,256
    12a8:	0a000000 	j	8000000 <_data-0x78000000>
    12ac:	00727470 	tge	v1,s2,0x1d1
    12b0:	01c10501 	0x1c10501
    12b4:	0d000000 	jal	4000000 <_data-0x7c000000>
    12b8:	00000585 	0x585
    12bc:	00b54a01 	0xb54a01
    12c0:	00000000 	nop
    12c4:	00140000 	sll	zero,s4,0x0
    12c8:	9c010000 	0x9c010000
    12cc:	000002ef 	0x2ef
    12d0:	0009380e 	0x9380e
    12d4:	00000000 	nop
    12d8:	00000c00 	sll	at,zero,0x10
    12dc:	0f4b0100 	jal	d2c0400 <_data-0x72d3fc00>
    12e0:	00000948 	0x948
    12e4:	00000bef 	0xbef
    12e8:	0001f90e 	0x1f90e
    12ec:	00000000 	nop
    12f0:	00000c00 	sll	at,zero,0x10
    12f4:	0f1c0100 	jal	c700400 <_data-0x738ffc00>
    12f8:	00000214 	0x214
    12fc:	00000bef 	0xbef
    1300:	00000010 	mfhi	zero
    1304:	00000c00 	sll	at,zero,0x10
    1308:	021f1100 	0x21f1100
    130c:	e0a00000 	sc	zero,0(a1)
    1310:	007bffc3 	0x7bffc3
    1314:	12000000 	beqz	s0,1318 <_data-0x7fffece8>
    1318:	000003e3 	0x3e3
    131c:	0a0c4601 	j	8311804 <_data-0x77cee7fc>
    1320:	00148800 	sll	s1,s4,0x0
    1324:	9c010000 	0x9c010000
    1328:	0000036a 	0x36a
    132c:	00059e13 	0x59e13
    1330:	b5460100 	0xb5460100
    1334:	01000000 	0x1000000
    1338:	087e0e54 	j	1f83950 <_data-0x7e07c6b0>
    133c:	0a0c0000 	j	8300000 <_data-0x77d00000>
    1340:	000c8800 	sll	s1,t4,0x0
    1344:	47010000 	c1	0x1010000
    1348:	0008950f 	0x8950f
    134c:	000c0700 	sll	zero,t4,0x1c
    1350:	088a0f00 	j	2283c00 <_data-0x7dd7c400>
    1354:	0c1a0000 	jal	680000 <_data-0x7f980000>
    1358:	0a0e0000 	j	8380000 <_data-0x77c80000>
    135c:	0c000001 	jal	4 <_data-0x7ffffffc>
    1360:	0c88000a 	jal	2200028 <_data-0x7ddfffd8>
    1364:	01000000 	0x1000000
    1368:	012c0f1d 	0x12c0f1d
    136c:	0c070000 	jal	1c0000 <_data-0x7fe40000>
    1370:	210f0000 	addi	t7,t0,0
    1374:	1a000001 	blez	s0,137c <_data-0x7fffec84>
    1378:	1000000c 	b	13ac <_data-0x7fffec54>
    137c:	88000a0c 	lwl	zero,2572(zero)
    1380:	0000000c 	syscall
    1384:	00013711 	0x13711
    1388:	c3e09000 	ll	zero,-28672(ra)
    138c:	00007bff 	0x7bff
    1390:	58120000 	0x58120000
    1394:	01000002 	0x1000002
    1398:	0009f842 	srl	ra,t1,0x1
    139c:	00001488 	0x1488
    13a0:	e59c0100 	swc1	$f28,256(t4)
    13a4:	13000003 	beqz	t8,13b4 <_data-0x7fffec4c>
    13a8:	0000059e 	0x59e
    13ac:	00aa4201 	0xaa4201
    13b0:	54010000 	bnel	zero,at,13b4 <_data-0x7fffec4c>
    13b4:	0008a10e 	0x8a10e
    13b8:	0009f800 	sll	ra,t1,0x0
    13bc:	00000c88 	0xc88
    13c0:	0f430100 	jal	d0c0400 <_data-0x72f3fc00>
    13c4:	000008b8 	0x8b8
    13c8:	00000c32 	tlt	zero,zero,0x30
    13cc:	0008ad0f 	0x8ad0f
    13d0:	000c4500 	sll	t0,t4,0x14
    13d4:	01490e00 	0x1490e00
    13d8:	09f80000 	j	7e00000 <_data-0x78200000>
    13dc:	000c8800 	sll	s1,t4,0x0
    13e0:	1d010000 	0x1d010000
    13e4:	00016b0f 	0x16b0f
    13e8:	000c3200 	sll	a2,t4,0x8
    13ec:	01600f00 	0x1600f00
    13f0:	0c450000 	jal	1140000 <_data-0x7eec0000>
    13f4:	f8100000 	sdc2	$16,0(zero)
    13f8:	0c880009 	jal	2200024 <_data-0x7ddfffdc>
    13fc:	11000000 	beqz	t0,1400 <_data-0x7fffec00>
    1400:	00000176 	tne	zero,zero,0x5
    1404:	ffc3e080 	sdc3	$3,-8064(s8)
    1408:	0000007b 	0x7b
    140c:	06430d00 	bgezl	s2,4810 <_data-0x7fffb7f0>
    1410:	39010000 	xori	at,t0,0x0
    1414:	000000b5 	0xb5
    1418:	00000000 	nop
    141c:	00000048 	0x48
    1420:	04329c01 	bltzall	at,fffe8428 <_text_end+0x77fe7510>
    1424:	05140000 	0x5140000
    1428:	01000007 	srav	zero,zero,t0
    142c:	0000b53a 	0xb53a
    1430:	000c5d00 	sll	t3,t4,0x14
    1434:	00001500 	sll	v0,zero,0x14
    1438:	04ef0000 	0x4ef0000
    143c:	00150000 	sll	zero,s5,0x0
    1440:	ef000000 	swc3	$0,0(t8)
    1444:	15000004 	bnez	t0,1458 <_data-0x7fffeba8>
    1448:	00000000 	nop
    144c:	000004ef 	0x4ef
    1450:	00000015 	0x15
    1454:	0004ef00 	sll	sp,a0,0x1c
    1458:	51120000 	beql	t0,s2,145c <_data-0x7fffeba4>
    145c:	01000005 	0x1000005
    1460:	0009d834 	teq	zero,t1,0x360
    1464:	00002088 	0x2088
    1468:	ef9c0100 	swc3	$28,256(gp)
    146c:	13000004 	beqz	t8,1480 <_data-0x7fffeb80>
    1470:	0000059e 	0x59e
    1474:	009f3401 	0x9f3401
    1478:	54010000 	bnel	zero,at,147c <_data-0x7fffeb84>
    147c:	0009a116 	0x9a116
    1480:	0009d800 	sll	k1,t1,0x0
    1484:	00000888 	0x888
    1488:	96350100 	lhu	s5,256(s1)
    148c:	17000004 	bnez	t8,14a0 <_data-0x7fffeb60>
    1490:	000009b1 	tgeu	zero,zero,0x26
    1494:	00025d0e 	0x25d0e
    1498:	0009d800 	sll	k1,t1,0x0
    149c:	00000888 	0x888
    14a0:	171c0100 	bne	t8,gp,18a4 <_data-0x7fffe75c>
    14a4:	00000278 	0x278
    14a8:	0009d810 	0x9d810
    14ac:	00000888 	0x888
    14b0:	02831100 	0x2831100
    14b4:	e0940000 	sc	s4,0(a0)
    14b8:	007bfec0 	0x7bfec0
    14bc:	c40e0000 	lwc1	$f14,0(zero)
    14c0:	ec000008 	swc3	$0,8(zero)
    14c4:	04880009 	tgei	a0,9
    14c8:	01000000 	0x1000000
    14cc:	08db0f36 	j	36c3cd8 <_data-0x7c93c328>
    14d0:	0cb90000 	jal	2e40000 <_data-0x7d1c0000>
    14d4:	d00f0000 	0xd00f0000
    14d8:	cc000008 	pref	0x0,8(zero)
    14dc:	0e00000c 	jal	8000030 <_data-0x77ffffd0>
    14e0:	00000188 	0x188
    14e4:	880009ec 	lwl	zero,2540(zero)
    14e8:	00000004 	sllv	zero,zero,zero
    14ec:	aa0f1d01 	swl	t7,7425(s0)
    14f0:	b9000001 	swr	zero,1(t0)
    14f4:	0f00000c 	jal	c000030 <_data-0x73ffffd0>
    14f8:	0000019f 	0x19f
    14fc:	00000ccc 	syscall	0x33
    1500:	0009ec10 	0x9ec10
    1504:	00000488 	0x488
    1508:	01b51100 	0x1b51100
    150c:	e0800000 	sc	zero,0(a0)
    1510:	007bfec0 	0x7bfec0
    1514:	0d000000 	jal	4000000 <_data-0x7c000000>
    1518:	000006f4 	teq	zero,zero,0x1b
    151c:	009f2f01 	0x9f2f01
    1520:	00000000 	nop
    1524:	00200000 	0x200000
    1528:	9c010000 	0x9c010000
    152c:	00000589 	0x589
    1530:	0009a116 	0x9a116
    1534:	00000000 	nop
    1538:	00000800 	sll	at,zero,0x0
    153c:	4a300100 	c2	0x300100
    1540:	17000005 	bnez	t8,1558 <_data-0x7fffeaa8>
    1544:	000009b1 	tgeu	zero,zero,0x26
    1548:	00025d0e 	0x25d0e
    154c:	00000000 	nop
    1550:	00000800 	sll	at,zero,0x0
    1554:	171c0100 	bne	t8,gp,1958 <_data-0x7fffe6a8>
    1558:	00000278 	0x278
    155c:	00000010 	mfhi	zero
    1560:	00000800 	sll	at,zero,0x0
    1564:	02831100 	0x2831100
    1568:	e0940000 	sc	s4,0(a0)
    156c:	007bfec0 	0x7bfec0
    1570:	a10e0000 	sb	t6,0(t0)
    1574:	00000009 	jalr	zero,zero
    1578:	04000000 	bltz	zero,157c <_data-0x7fffea84>
    157c:	01000000 	0x1000000
    1580:	09b11731 	j	6c45cc4 <_data-0x793ba33c>
    1584:	5d0e0000 	0x5d0e0000
    1588:	00000002 	srl	zero,zero,0x0
    158c:	04000000 	bltz	zero,1590 <_data-0x7fffea70>
    1590:	01000000 	0x1000000
    1594:	0278171c 	0x278171c
    1598:	00100000 	sll	zero,s0,0x0
    159c:	04000000 	bltz	zero,15a0 <_data-0x7fffea60>
    15a0:	11000000 	beqz	t0,15a4 <_data-0x7fffea5c>
    15a4:	00000283 	sra	zero,zero,0xa
    15a8:	fec0e080 	sdc3	$0,-8064(s6)
    15ac:	0000007b 	0x7b
    15b0:	02931200 	0x2931200
    15b4:	1f010000 	0x1f010000
    15b8:	880009a0 	lwl	zero,2464(zero)
    15bc:	00000038 	0x38
    15c0:	081b9c01 	j	6e7004 <_data-0x7f918ffc>
    15c4:	c4160000 	lwc1	$f22,0(zero)
    15c8:	a0000008 	sb	zero,8(zero)
    15cc:	0c880009 	jal	2200024 <_data-0x7ddfffdc>
    15d0:	01000000 	0x1000000
    15d4:	0005fa21 	0x5fa21
    15d8:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    15dc:	0ce40000 	jal	3900000 <_data-0x7c700000>
    15e0:	d00f0000 	0xd00f0000
    15e4:	f9000008 	sdc2	$0,8(t0)
    15e8:	0e00000c 	jal	8000030 <_data-0x77ffffd0>
    15ec:	00000188 	0x188
    15f0:	880009a0 	lwl	zero,2464(zero)
    15f4:	0000000c 	syscall
    15f8:	aa0f1d01 	swl	t7,7425(s0)
    15fc:	e4000001 	swc1	$f0,1(zero)
    1600:	0f00000c 	jal	c000030 <_data-0x73ffffd0>
    1604:	0000019f 	0x19f
    1608:	00000cf9 	0xcf9
    160c:	0009a010 	0x9a010
    1610:	00000c88 	0xc88
    1614:	01b51100 	0x1b51100
    1618:	e0880000 	sc	t0,0(a0)
    161c:	007bfec0 	0x7bfec0
    1620:	c4160000 	lwc1	$f22,0(zero)
    1624:	ac000008 	sw	zero,8(zero)
    1628:	08880009 	j	2200024 <_data-0x7ddfffdc>
    162c:	01000000 	0x1000000
    1630:	00065623 	0x65623
    1634:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    1638:	0d110000 	jal	4440000 <_data-0x7bbc0000>
    163c:	d00f0000 	0xd00f0000
    1640:	26000008 	addiu	zero,s0,8
    1644:	0e00000d 	jal	8000034 <_data-0x77ffffcc>
    1648:	00000188 	0x188
    164c:	880009ac 	lwl	zero,2476(zero)
    1650:	00000008 	jr	zero
    1654:	aa0f1d01 	swl	t7,7425(s0)
    1658:	11000001 	beqz	t0,1660 <_data-0x7fffe9a0>
    165c:	0f00000d 	jal	c000034 <_data-0x73ffffcc>
    1660:	0000019f 	0x19f
    1664:	00000d26 	0xd26
    1668:	0009ac10 	0x9ac10
    166c:	00000888 	0x888
    1670:	01b51100 	0x1b51100
    1674:	e08c0000 	sc	t4,0(a0)
    1678:	007bfec0 	0x7bfec0
    167c:	c4160000 	lwc1	$f22,0(zero)
    1680:	b4000008 	0xb4000008
    1684:	08880009 	j	2200024 <_data-0x7ddfffdc>
    1688:	01000000 	0x1000000
    168c:	0006b225 	0x6b225
    1690:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    1694:	0d3e0000 	jal	4f80000 <_data-0x7b080000>
    1698:	d00f0000 	0xd00f0000
    169c:	53000008 	beqzl	t8,16c0 <_data-0x7fffe940>
    16a0:	0e00000d 	jal	8000034 <_data-0x77ffffcc>
    16a4:	00000188 	0x188
    16a8:	880009b4 	lwl	zero,2484(zero)
    16ac:	00000008 	jr	zero
    16b0:	aa0f1d01 	swl	t7,7425(s0)
    16b4:	3e000001 	0x3e000001
    16b8:	0f00000d 	jal	c000034 <_data-0x73ffffcc>
    16bc:	0000019f 	0x19f
    16c0:	00000d53 	0xd53
    16c4:	0009b410 	0x9b410
    16c8:	00000888 	0x888
    16cc:	01b51100 	0x1b51100
    16d0:	e0800000 	sc	zero,0(a0)
    16d4:	007bfec0 	0x7bfec0
    16d8:	c4180000 	lwc1	$f24,0(zero)
    16dc:	bc000008 	cache	0x0,8(zero)
    16e0:	00880009 	0x880009
    16e4:	01000002 	0x1000002
    16e8:	00070a28 	0x70a28
    16ec:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    16f0:	0d6b0000 	jal	5ac0000 <_data-0x7a540000>
    16f4:	d00f0000 	0xd00f0000
    16f8:	7f000008 	0x7f000008
    16fc:	1900000d 	blez	t0,1734 <_data-0x7fffe8cc>
    1700:	00000188 	0x188
    1704:	880009bc 	lwl	zero,2492(zero)
    1708:	00000200 	sll	zero,zero,0x8
    170c:	aa0f1d01 	swl	t7,7425(s0)
    1710:	6b000001 	0x6b000001
    1714:	0f00000d 	jal	c000034 <_data-0x73ffffcc>
    1718:	0000019f 	0x19f
    171c:	00000d7f 	0xd7f
    1720:	0002001a 	div	zero,zero,v0
    1724:	01b51100 	0x1b51100
    1728:	e08c0000 	sc	t4,0(a0)
    172c:	007bfec0 	0x7bfec0
    1730:	c4160000 	lwc1	$f22,0(zero)
    1734:	c0000008 	ll	zero,8(zero)
    1738:	04880009 	tgei	a0,9
    173c:	01000000 	0x1000000
    1740:	00076626 	0x76626
    1744:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    1748:	0d970000 	jal	65c0000 <_data-0x79a40000>
    174c:	d00f0000 	0xd00f0000
    1750:	ab000008 	swl	zero,8(t8)
    1754:	0e00000d 	jal	8000034 <_data-0x77ffffcc>
    1758:	00000188 	0x188
    175c:	880009c0 	lwl	zero,2496(zero)
    1760:	00000004 	sllv	zero,zero,zero
    1764:	aa0f1d01 	swl	t7,7425(s0)
    1768:	97000001 	lhu	zero,1(t8)
    176c:	0f00000d 	jal	c000034 <_data-0x73ffffcc>
    1770:	0000019f 	0x19f
    1774:	00000dab 	0xdab
    1778:	0009c010 	0x9c010
    177c:	00000488 	0x488
    1780:	01b51100 	0x1b51100
    1784:	e0840000 	sc	a0,0(a0)
    1788:	007bfec0 	0x7bfec0
    178c:	c4160000 	lwc1	$f22,0(zero)
    1790:	c8000008 	lwc2	$0,8(zero)
    1794:	04880009 	tgei	a0,9
    1798:	01000000 	0x1000000
    179c:	0007c22a 	0x7c22a
    17a0:	08db0f00 	j	36c3c00 <_data-0x7c93c400>
    17a4:	0dc30000 	jal	70c0000 <_data-0x78f40000>
    17a8:	d00f0000 	0xd00f0000
    17ac:	d7000008 	ldc1	$f0,8(t8)
    17b0:	0e00000d 	jal	8000034 <_data-0x77ffffcc>
    17b4:	00000188 	0x188
    17b8:	880009c8 	lwl	zero,2504(zero)
    17bc:	00000004 	sllv	zero,zero,zero
    17c0:	aa0f1d01 	swl	t7,7425(s0)
    17c4:	c3000001 	ll	zero,1(t8)
    17c8:	0f00000d 	jal	c000034 <_data-0x73ffffcc>
    17cc:	0000019f 	0x19f
    17d0:	00000dd7 	0xdd7
    17d4:	0009c810 	0x9c810
    17d8:	00000488 	0x488
    17dc:	01b51100 	0x1b51100
    17e0:	e0900000 	sc	s0,0(a0)
    17e4:	007bfec0 	0x7bfec0
    17e8:	c40e0000 	lwc1	$f14,0(zero)
    17ec:	cc000008 	pref	0x0,8(zero)
    17f0:	04880009 	tgei	a0,9
    17f4:	01000000 	0x1000000
    17f8:	08db0f2c 	j	36c3cb0 <_data-0x7c93c350>
    17fc:	0def0000 	jal	7bc0000 <_data-0x78440000>
    1800:	d00f0000 	0xd00f0000
    1804:	03000008 	jr	t8
    1808:	0e00000e 	jal	8000038 <_data-0x77ffffc8>
    180c:	00000188 	0x188
    1810:	880009cc 	lwl	zero,2508(zero)
    1814:	00000004 	sllv	zero,zero,zero
    1818:	aa0f1d01 	swl	t7,7425(s0)
    181c:	ef000001 	swc3	$0,1(t8)
    1820:	0f00000d 	jal	c000034 <_data-0x73ffffcc>
    1824:	0000019f 	0x19f
    1828:	00000e03 	sra	at,zero,0x18
    182c:	0009cc10 	0x9cc10
    1830:	00000488 	0x488
    1834:	01b51100 	0x1b51100
    1838:	e0840000 	sc	a0,0(a0)
    183c:	007bfec0 	0x7bfec0
    1840:	12000000 	beqz	s0,1844 <_data-0x7fffe7bc>
    1844:	0000061f 	0x61f
    1848:	00001d01 	0x1d01
    184c:	000c0000 	sll	zero,t4,0x0
    1850:	9c010000 	0x9c010000
    1854:	0000087e 	0x87e
    1858:	00020813 	0x20813
    185c:	251d0100 	addiu	sp,t0,256
    1860:	01000000 	0x1000000
    1864:	059e1354 	0x59e1354
    1868:	1d010000 	0x1d010000
    186c:	000000c0 	ehb
    1870:	cb0e5501 	lwc2	$14,21761(t8)
    1874:	00000000 	nop
    1878:	04000000 	bltz	zero,187c <_data-0x7fffe784>
    187c:	01000000 	0x1000000
    1880:	00ed0f1d 	0xed0f1d
    1884:	0e1b0000 	jal	86c0000 <_data-0x77940000>
    1888:	e20f0000 	sc	t7,0(s0)
    188c:	2e000000 	sltiu	zero,s0,0
    1890:	1000000e 	b	18cc <_data-0x7fffe734>
    1894:	00000000 	nop
    1898:	00000004 	sllv	zero,zero,zero
    189c:	0000f81b 	0xf81b
    18a0:	00540100 	0x540100
    18a4:	931c0000 	lbu	gp,0(t8)
    18a8:	01000005 	0x1000005
    18ac:	08a1011d 	j	2840474 <_data-0x7d7bfb8c>
    18b0:	08090000 	j	240000 <_data-0x7fdc0000>
    18b4:	01000002 	0x1000002
    18b8:	0000251d 	0x251d
    18bc:	059e0900 	0x59e0900
    18c0:	1d010000 	0x1d010000
    18c4:	000000b5 	0xb5
    18c8:	05681c00 	tgei	t3,7168
    18cc:	1d010000 	0x1d010000
    18d0:	0008c401 	0x8c401
    18d4:	02080900 	0x2080900
    18d8:	1d010000 	0x1d010000
    18dc:	00000025 	move	zero,zero
    18e0:	00059e09 	0x59e09
    18e4:	aa1d0100 	swl	sp,256(s0)
    18e8:	00000000 	nop
    18ec:	0005a31c 	0x5a31c
    18f0:	011d0100 	0x11d0100
    18f4:	000008e7 	0x8e7
    18f8:	00020809 	0x20809
    18fc:	251d0100 	addiu	sp,t0,256
    1900:	09000000 	j	4000000 <_data-0x7c000000>
    1904:	0000059e 	0x59e
    1908:	009f1d01 	0x9f1d01
    190c:	0d000000 	jal	4000000 <_data-0x7c000000>
    1910:	000006a5 	0x6a5
    1914:	00c01c01 	0xc01c01
    1918:	00000000 	nop
    191c:	000c0000 	sll	zero,t4,0x0
    1920:	9c010000 	0x9c010000
    1924:	00000938 	0x938
    1928:	00020813 	0x20813
    192c:	251c0100 	addiu	gp,t0,256
    1930:	01000000 	0x1000000
    1934:	01c70e54 	0x1c70e54
    1938:	00000000 	nop
    193c:	00040000 	sll	zero,a0,0x0
    1940:	1c010000 	0x1c010000
    1944:	0001e20f 	0x1e20f
    1948:	000e4100 	sll	t0,t6,0x4
    194c:	00001000 	sll	v0,zero,0x0
    1950:	00040000 	sll	zero,a0,0x0
    1954:	ed1b0000 	swc3	$27,0(t0)
    1958:	01000001 	movf	zero,t0,$fcc0
    195c:	00000054 	0x54
    1960:	0007001d 	0x7001d
    1964:	b51c0100 	0xb51c0100
    1968:	01000000 	0x1000000
    196c:	00000954 	0x954
    1970:	00020809 	0x20809
    1974:	251c0100 	addiu	gp,t0,256
    1978:	00000000 	nop
    197c:	0005db0d 	break	0x5,0x36c
    1980:	aa1c0100 	swl	gp,256(s0)
    1984:	00000000 	nop
    1988:	0c000000 	jal	0 <_data-0x80000000>
    198c:	01000000 	0x1000000
    1990:	0009a19c 	0x9a19c
    1994:	02081300 	0x2081300
    1998:	1c010000 	0x1c010000
    199c:	00000025 	move	zero,zero
    19a0:	2b0e5401 	slti	t6,t8,21505
    19a4:	00000002 	srl	zero,zero,0x0
    19a8:	04000000 	bltz	zero,19ac <_data-0x7fffe654>
    19ac:	01000000 	0x1000000
    19b0:	0246171c 	0x246171c
    19b4:	00100000 	sll	zero,s0,0x0
    19b8:	04000000 	bltz	zero,19bc <_data-0x7fffe644>
    19bc:	1b000000 	blez	t8,19c0 <_data-0x7fffe640>
    19c0:	00000251 	0x251
    19c4:	00005401 	0x5401
    19c8:	072b1d00 	tltiu	t9,7424
    19cc:	1c010000 	0x1c010000
    19d0:	0000009f 	0x9f
    19d4:	0009bd01 	0x9bd01
    19d8:	02080900 	0x2080900
    19dc:	1c010000 	0x1c010000
    19e0:	00000025 	move	zero,zero
    19e4:	09a11e00 	j	6847800 <_data-0x797b8800>
    19e8:	00000000 	nop
    19ec:	000c0000 	sll	zero,t4,0x0
    19f0:	9c010000 	0x9c010000
    19f4:	000009fe 	0x9fe
    19f8:	0009b11f 	0x9b11f
    19fc:	0e540100 	jal	9500400 <_data-0x76affc00>
    1a00:	0000025d 	0x25d
    1a04:	00000000 	nop
    1a08:	00000004 	sllv	zero,zero,zero
    1a0c:	78171c01 	0x78171c01
    1a10:	10000002 	b	1a1c <_data-0x7fffe5e4>
    1a14:	00000000 	nop
    1a18:	00000004 	sllv	zero,zero,zero
    1a1c:	0002831b 	0x2831b
    1a20:	00540100 	0x540100
    1a24:	381e0000 	xori	s8,zero,0x0
    1a28:	00000009 	jalr	zero,zero
    1a2c:	0c000000 	jal	0 <_data-0x80000000>
    1a30:	01000000 	0x1000000
    1a34:	000a439c 	0xa439c
    1a38:	09481f00 	j	5207c00 <_data-0x7adf8400>
    1a3c:	54010000 	bnel	zero,at,1a40 <_data-0x7fffe5c0>
    1a40:	0001f90e 	0x1f90e
    1a44:	00000000 	nop
    1a48:	00000400 	sll	zero,zero,0x10
    1a4c:	0f1c0100 	jal	c700400 <_data-0x738ffc00>
    1a50:	00000214 	0x214
    1a54:	00000e54 	0xe54
    1a58:	00000010 	mfhi	zero
    1a5c:	00000400 	sll	zero,zero,0x10
    1a60:	021f1b00 	0x21f1b00
    1a64:	54010000 	bnel	zero,at,1a68 <_data-0x7fffe598>
    1a68:	1e000000 	bgtz	s0,1a6c <_data-0x7fffe594>
    1a6c:	000008c4 	0x8c4
    1a70:	00000000 	nop
    1a74:	0000000c 	syscall
    1a78:	0a989c01 	j	a627004 <_data-0x759d8ffc>
    1a7c:	d01f0000 	0xd01f0000
    1a80:	01000008 	jr	t0
    1a84:	08db1f54 	j	36c7d50 <_data-0x7c9382b0>
    1a88:	55010000 	bnel	t0,at,1a8c <_data-0x7fffe574>
    1a8c:	0001880e 	0x1880e
    1a90:	00000000 	nop
    1a94:	00000400 	sll	zero,zero,0x10
    1a98:	0f1d0100 	jal	c740400 <_data-0x738bfc00>
    1a9c:	000001aa 	0x1aa
    1aa0:	00000e67 	0xe67
    1aa4:	00019f0f 	0x19f0f
    1aa8:	000e7a00 	sll	t7,t6,0x8
    1aac:	00001000 	sll	v0,zero,0x0
    1ab0:	00040000 	sll	zero,a0,0x0
    1ab4:	b51b0000 	0xb51b0000
    1ab8:	01000001 	movf	zero,t0,$fcc0
    1abc:	00000054 	0x54
    1ac0:	0008a11e 	0x8a11e
    1ac4:	00000000 	nop
    1ac8:	00000c00 	sll	at,zero,0x10
    1acc:	ed9c0100 	swc3	$28,256(t4)
    1ad0:	1f00000a 	bgtz	t8,1afc <_data-0x7fffe504>
    1ad4:	000008ad 	0x8ad
    1ad8:	b81f5401 	swr	ra,21505(zero)
    1adc:	01000008 	jr	t0
    1ae0:	01490e55 	0x1490e55
    1ae4:	00000000 	nop
    1ae8:	00040000 	sll	zero,a0,0x0
    1aec:	1d010000 	0x1d010000
    1af0:	00016b0f 	0x16b0f
    1af4:	000e8d00 	sll	s1,t6,0x14
    1af8:	01600f00 	0x1600f00
    1afc:	0ea00000 	jal	a800000 <_data-0x75800000>
    1b00:	00100000 	sll	zero,s0,0x0
    1b04:	04000000 	bltz	zero,1b08 <_data-0x7fffe4f8>
    1b08:	1b000000 	blez	t8,1b0c <_data-0x7fffe4f4>
    1b0c:	00000176 	tne	zero,zero,0x5
    1b10:	00005401 	0x5401
    1b14:	087e2000 	j	1f88000 <_data-0x7e078000>
    1b18:	00000000 	nop
    1b1c:	000c0000 	sll	zero,t4,0x0
    1b20:	9c010000 	0x9c010000
    1b24:	00088a1f 	0x88a1f
    1b28:	1f540100 	0x1f540100
    1b2c:	00000895 	0x895
    1b30:	0a0e5501 	j	8395404 <_data-0x77c6abfc>
    1b34:	00000001 	movf	zero,zero,$fcc0
    1b38:	04000000 	bltz	zero,1b3c <_data-0x7fffe4c4>
    1b3c:	01000000 	0x1000000
    1b40:	012c0f1d 	0x12c0f1d
    1b44:	0eb30000 	jal	acc0000 <_data-0x75340000>
    1b48:	210f0000 	addi	t7,t0,0
    1b4c:	c6000001 	lwc1	$f0,1(s0)
    1b50:	1000000e 	b	1b8c <_data-0x7fffe474>
    1b54:	00000000 	nop
    1b58:	00000004 	sllv	zero,zero,zero
    1b5c:	0001371b 	0x1371b
    1b60:	00540100 	0x540100
    1b64:	Address 0x0000000000001b64 is out of bounds.


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
  28:	012e0400 	0x12e0400
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
  30:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	01111349 	0x1111349
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	18400612 	blez	v0,1884 <_data-0x7fffe77c>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	01194297 	0x1194297
  40:	05000013 	bltz	t0,90 <_data-0x7fffff70>
  44:	08030034 	j	c00d0 <_data-0x7ff3ff30>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
  4c:	051c1349 	0x51c1349
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	34060000 	li	a2,0x0
  54:	3a080300 	xori	t0,s0,0x300
  58:	490b3b0b 	bc2tl	$cc2,ec88 <_data-0x7fff1378>
  5c:	00170213 	0x170213
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00340700 	0x340700
  64:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
  68:	13490b3b 	beq	k0,t1,2d58 <_data-0x7fffd2a8>
  6c:	00001802 	srl	v1,zero,0x0
  70:	03003408 	0x3003408
  74:	3b0b3a0e 	xori	t3,t8,0x3a0e
  78:	0213490b 	0x213490b
  7c:	09000017 	j	400005c <_data-0x7bffffa4>
  80:	0e030034 	jal	80c00d0 <_data-0x77f3ff30>
  84:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
  88:	0a1c1349 	j	8704d24 <_data-0x778fb2dc>
  8c:	340a0000 	li	t2,0x0
  90:	3a0e0300 	xori	t6,s0,0x300
  94:	490b3b0b 	bc2tl	$cc2,ecc4 <_data-0x7fff133c>
  98:	000b1c13 	0xb1c13
  9c:	00340b00 	0x340b00
  a0:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
  a4:	13490b3b 	beq	k0,t1,2d94 <_data-0x7fffd26c>
  a8:	00000d1c 	0xd1c
  ac:	55010b0c 	bnel	t0,at,2ce0 <_data-0x7fffd320>
  b0:	0d000017 	jal	400005c <_data-0x7bffffa4>
  b4:	0b0b000f 	j	c2c003c <_data-0x73d3ffc4>
  b8:	00001349 	0x1349
  bc:	00110100 	sll	zero,s1,0x4
  c0:	01110610 	0x1110610
  c4:	0e030112 	jal	80c0448 <_data-0x77f3fbb8>
  c8:	0e250e1b 	jal	894386c <_data-0x776bc794>
  cc:	00000513 	0x513
  d0:	01110100 	0x1110100
  d4:	0b130e25 	j	c4c3894 <_data-0x73b3c76c>
  d8:	0e1b0e03 	jal	86c380c <_data-0x7793c7f4>
  dc:	01111755 	0x1111755
  e0:	00001710 	0x1710
  e4:	0b002402 	j	c009008 <_data-0x73ff6ff8>
  e8:	030b3e0b 	0x30b3e0b
  ec:	0300000e 	0x300000e
  f0:	0e030016 	jal	80c0058 <_data-0x77f3ffa8>
  f4:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
  f8:	00001349 	0x1349
  fc:	49002604 	bc2f	9910 <_data-0x7fff66f0>
 100:	05000013 	bltz	t0,150 <_data-0x7ffffeb0>
 104:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 108:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 10c:	01060000 	0x1060000
 110:	01134901 	0x1134901
 114:	07000013 	bltz	t8,164 <_data-0x7ffffe9c>
 118:	13490021 	beq	k0,t1,1a0 <_data-0x7ffffe60>
 11c:	00000b2f 	0xb2f
 120:	0b000f08 	j	c003c20 <_data-0x73ffc3e0>
 124:	0013490b 	0x13490b
 128:	00340900 	0x340900
 12c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 130:	13490b3b 	beq	k0,t1,2e20 <_data-0x7fffd1e0>
 134:	1802193f 	0x1802193f
 138:	130a0000 	beq	t8,t2,13c <_data-0x7ffffec4>
 13c:	3a0b0b01 	xori	t3,s0,0xb01
 140:	010b3b0b 	0x10b3b0b
 144:	0b000013 	j	c00004c <_data-0x73ffffb4>
 148:	0e03000d 	jal	80c0034 <_data-0x77f3ffcc>
 14c:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 150:	0b381349 	j	ce04d24 <_data-0x731fb2dc>
 154:	0d0c0000 	jal	4300000 <_data-0x7bd00000>
 158:	3a080300 	xori	t0,s0,0x300
 15c:	490b3b0b 	bc2tl	$cc2,ed8c <_data-0x7fff1274>
 160:	000b3813 	0xb3813
 164:	00340d00 	0x340d00
 168:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 16c:	13490b3b 	beq	k0,t1,2e5c <_data-0x7fffd1a4>
 170:	193c193f 	0x193c193f
 174:	2e0e0000 	sltiu	t6,s0,0
 178:	03193f01 	0x3193f01
 17c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 180:	1119270b 	beq	t0,t9,9db0 <_data-0x7fff6250>
 184:	40061201 	0x40061201
 188:	19429718 	0x19429718
 18c:	00001301 	0x1301
 190:	0300050f 	0x300050f
 194:	3b0b3a08 	xori	t3,t8,0x3a08
 198:	0213490b 	0x213490b
 19c:	10000017 	b	1fc <_data-0x7ffffe04>
 1a0:	0e030005 	jal	80c0014 <_data-0x77f3ffec>
 1a4:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 1a8:	17021349 	bne	t8,v0,4ed0 <_data-0x7fffb130>
 1ac:	0b110000 	j	c440000 <_data-0x73bc0000>
 1b0:	12011101 	beq	s0,at,45b8 <_data-0x7fffba48>
 1b4:	00130106 	0x130106
 1b8:	00341200 	0x341200
 1bc:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 1c0:	13490b3b 	beq	k0,t1,2eb0 <_data-0x7fffd150>
 1c4:	00001702 	srl	v0,zero,0x1c
 1c8:	03003413 	0x3003413
 1cc:	3b0b3a08 	xori	t3,t8,0x3a08
 1d0:	0013490b 	0x13490b
 1d4:	011d1400 	0x11d1400
 1d8:	01111331 	tgeu	t0,s1,0x4c
 1dc:	0b580612 	j	d601848 <_data-0x729fe7b8>
 1e0:	13010b59 	beq	t8,at,2f48 <_data-0x7fffd0b8>
 1e4:	0b150000 	j	c540000 <_data-0x73ac0000>
 1e8:	12011101 	beq	s0,at,45f0 <_data-0x7fffba10>
 1ec:	16000006 	bnez	s0,208 <_data-0x7ffffdf8>
 1f0:	13310034 	beq	t9,s1,2c4 <_data-0x7ffffd3c>
 1f4:	89170000 	lwl	s7,0(t0)
 1f8:	11010182 	beq	t0,at,804 <_data-0x7ffff7fc>
 1fc:	01133101 	0x1133101
 200:	18000013 	blez	zero,250 <_data-0x7ffffdb0>
 204:	0001828a 	0x1828a
 208:	42911802 	c0	0x911802
 20c:	19000018 	blez	t0,270 <_data-0x7ffffd90>
 210:	01018289 	0x1018289
 214:	13310111 	beq	t9,s1,65c <_data-0x7ffff9a4>
 218:	891a0000 	lwl	k0,0(t0)
 21c:	11000182 	beqz	t0,828 <_data-0x7ffff7d8>
 220:	00133101 	0x133101
 224:	82891b00 	lb	t1,6912(s4)
 228:	01110101 	0x1110101
 22c:	31194295 	andi	t9,t0,0x4295
 230:	1c000013 	bgtz	zero,280 <_data-0x7ffffd80>
 234:	193f012e 	0x193f012e
 238:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 23c:	01110b3b 	0x1110b3b
 240:	18400612 	blez	v0,1a8c <_data-0x7fffe574>
 244:	01194297 	0x1194297
 248:	1d000013 	bgtz	t0,298 <_data-0x7ffffd68>
 24c:	1755010b 	bne	k0,s5,67c <_data-0x7ffff984>
 250:	341e0000 	li	s8,0x0
 254:	3a080300 	xori	t0,s0,0x300
 258:	490b3b0b 	bc2tl	$cc2,ee88 <_data-0x7fff1178>
 25c:	00170213 	0x170213
 260:	010b1f00 	0x10b1f00
 264:	13011755 	beq	t8,at,5fbc <_data-0x7fffa044>
 268:	2e200000 	sltiu	zero,s1,0
 26c:	03193f01 	0x3193f01
 270:	3b0b3a0e 	xori	t3,t8,0x3a0e
 274:	2013490b 	addi	s3,zero,18699
 278:	0013010b 	0x13010b
 27c:	82892100 	lb	t1,8448(s4)
 280:	01110101 	0x1110101
 284:	31194295 	andi	t9,t0,0x4295
 288:	00130113 	0x130113
 28c:	012e2200 	0x12e2200
 290:	01111331 	tgeu	t0,s1,0x4c
 294:	18400612 	blez	v0,1ae0 <_data-0x7fffe520>
 298:	01194297 	0x1194297
 29c:	23000013 	addi	zero,t8,19
 2a0:	13310034 	beq	t9,s1,374 <_data-0x7ffffc8c>
 2a4:	00001802 	srl	v1,zero,0x0
 2a8:	3f002e24 	0x3f002e24
 2ac:	6e193c19 	0x6e193c19
 2b0:	3a0e030e 	xori	t6,s0,0x30e
 2b4:	000b3b0b 	0xb3b0b
 2b8:	11010000 	beq	t0,at,2bc <_data-0x7ffffd44>
 2bc:	130e2501 	beq	t8,t6,96c4 <_data-0x7fff693c>
 2c0:	1b0e030b 	0x1b0e030b
 2c4:	1117550e 	beq	t0,s7,15700 <_data-0x7ffea900>
 2c8:	00171001 	0x171001
 2cc:	000f0200 	sll	zero,t7,0x8
 2d0:	00000b0b 	0xb0b
 2d4:	0b002403 	j	c00900c <_data-0x73ff6ff4>
 2d8:	030b3e0b 	0x30b3e0b
 2dc:	0400000e 	bltz	zero,318 <_data-0x7ffffce8>
 2e0:	193f012e 	0x193f012e
 2e4:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 2e8:	19270b3b 	0x19270b3b
 2ec:	01111349 	0x1111349
 2f0:	18400612 	blez	v0,1b3c <_data-0x7fffe4c4>
 2f4:	01194297 	0x1194297
 2f8:	05000013 	bltz	t0,348 <_data-0x7ffffcb8>
 2fc:	08030005 	j	c0014 <_data-0x7ff3ffec>
 300:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 304:	17021349 	bne	t8,v0,502c <_data-0x7fffafd4>
 308:	18060000 	0x18060000
 30c:	07000000 	bltz	t8,310 <_data-0x7ffffcf0>
 310:	08030034 	j	c00d0 <_data-0x7ff3ff30>
 314:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 318:	17021349 	bne	t8,v0,5040 <_data-0x7fffafc0>
 31c:	34080000 	li	t0,0x0
 320:	3a080300 	xori	t0,s0,0x300
 324:	490b3b0b 	bc2tl	$cc2,ef54 <_data-0x7fff10ac>
 328:	00180213 	0x180213
 32c:	000a0900 	sll	at,t2,0x4
 330:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 334:	01110b3b 	0x1110b3b
 338:	0b0a0000 	j	c280000 <_data-0x73d80000>
 33c:	01175501 	0x1175501
 340:	0b000013 	j	c00004c <_data-0x73ffffb4>
 344:	193f012e 	0x193f012e
 348:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 34c:	13490b3b 	beq	k0,t1,303c <_data-0x7fffcfc4>
 350:	1301193c 	beq	t8,at,6844 <_data-0x7fff97bc>
 354:	890c0000 	lwl	t4,0(t0)
 358:	11000182 	beqz	t0,964 <_data-0x7ffff69c>
 35c:	00133101 	0x133101
 360:	82890d00 	lb	t1,3328(s4)
 364:	01110101 	0x1110101
 368:	13011331 	beq	t8,at,5030 <_data-0x7fffafd0>
 36c:	8a0e0000 	lwl	t6,0(s0)
 370:	02000182 	0x2000182
 374:	18429118 	0x18429118
 378:	890f0000 	lwl	t7,0(t0)
 37c:	11010182 	beq	t0,at,988 <_data-0x7ffff678>
 380:	00133101 	0x133101
 384:	010b1000 	0x10b1000
 388:	00001755 	0x1755
 38c:	11010b11 	beq	t0,at,2fd4 <_data-0x7fffd02c>
 390:	01061201 	0x1061201
 394:	12000013 	beqz	s0,3e4 <_data-0x7ffffc1c>
 398:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 39c:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 3a0:	0f130000 	jal	c4c0000 <_data-0x73b40000>
 3a4:	490b0b00 	bc2tl	$cc2,2fa8 <_data-0x7fffd058>
 3a8:	14000013 	bnez	zero,3f8 <_data-0x7ffffc08>
 3ac:	13490026 	beq	k0,t1,448 <_data-0x7ffffbb8>
 3b0:	2e150000 	sltiu	s5,s0,0
 3b4:	3c193f00 	lui	t9,0x3f00
 3b8:	030e6e19 	0x30e6e19
 3bc:	3b0b3a0e 	xori	t3,t8,0x3a0e
 3c0:	0000000b 	movn	zero,zero,zero
 3c4:	25011101 	addiu	at,t0,4353
 3c8:	030b130e 	0x30b130e
 3cc:	550e1b0e 	bnel	t0,t6,7008 <_data-0x7fff8ff8>
 3d0:	10011117 	beq	zero,at,4830 <_data-0x7fffb7d0>
 3d4:	02000017 	0x2000017
 3d8:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 3dc:	0e030b3e 	jal	80c2cf8 <_data-0x77f3d308>
 3e0:	2e030000 	sltiu	v1,s0,0
 3e4:	03193f01 	0x3193f01
 3e8:	3b0b3a0e 	xori	t3,t8,0x3a0e
 3ec:	4919270b 	bc2t	$cc6,a01c <_data-0x7fff5fe4>
 3f0:	12011113 	beq	s0,at,4840 <_data-0x7fffb7c0>
 3f4:	97184006 	lhu	t8,16390(t8)
 3f8:	13011942 	beq	t8,at,6904 <_data-0x7fff96fc>
 3fc:	05040000 	0x5040000
 400:	3a080300 	xori	t0,s0,0x300
 404:	490b3b0b 	bc2tl	$cc2,f034 <_data-0x7fff0fcc>
 408:	00170213 	0x170213
 40c:	00050500 	sll	zero,a1,0x14
 410:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 414:	13490b3b 	beq	k0,t1,3104 <_data-0x7fffcefc>
 418:	00001702 	srl	v0,zero,0x1c
 41c:	03003406 	0x3003406
 420:	3b0b3a08 	xori	t3,t8,0x3a08
 424:	0213490b 	0x213490b
 428:	07000017 	bltz	t8,488 <_data-0x7ffffb78>
 42c:	08030034 	j	c00d0 <_data-0x7ff3ff30>
 430:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 434:	18021349 	0x18021349
 438:	34080000 	li	t0,0x0
 43c:	3a0e0300 	xori	t6,s0,0x300
 440:	490b3b0b 	bc2tl	$cc2,f070 <_data-0x7fff0f90>
 444:	00170213 	0x170213
 448:	010b0900 	0x10b0900
 44c:	06120111 	bltzall	s0,894 <_data-0x7ffff76c>
 450:	00001301 	0x1301
 454:	3f012e0a 	0x3f012e0a
 458:	3a0e0319 	xori	t6,s0,0x319
 45c:	490b3b0b 	bc2tl	$cc2,f08c <_data-0x7fff0f74>
 460:	01193c13 	0x1193c13
 464:	0b000013 	j	c00004c <_data-0x73ffffb4>
 468:	00000018 	mult	zero,zero
 46c:	0182890c 	syscall	0x60a24
 470:	31011101 	andi	at,t0,0x1101
 474:	0d000013 	jal	400004c <_data-0x7bffffb4>
 478:	0001828a 	0x1828a
 47c:	42911802 	c0	0x911802
 480:	0e000018 	jal	8000060 <_data-0x77ffffa0>
 484:	0111010b 	0x111010b
 488:	00000612 	0x612
 48c:	0182890f 	0x182890f
 490:	31011100 	andi	at,t0,0x1100
 494:	10000013 	b	4e4 <_data-0x7ffffb1c>
 498:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 49c:	08030b3e 	j	c2cf8 <_data-0x7ff3d308>
 4a0:	01110000 	0x1110000
 4a4:	01134901 	0x1134901
 4a8:	12000013 	beqz	s0,4f8 <_data-0x7ffffb08>
 4ac:	13490021 	beq	k0,t1,534 <_data-0x7ffffacc>
 4b0:	00000b2f 	0xb2f
 4b4:	3f002e13 	0x3f002e13
 4b8:	6e193c19 	0x6e193c19
 4bc:	3a0e030e 	xori	t6,s0,0x30e
 4c0:	000b3b0b 	0xb3b0b
 4c4:	11010000 	beq	t0,at,4c8 <_data-0x7ffffb38>
 4c8:	130e2501 	beq	t8,t6,98d0 <_data-0x7fff6730>
 4cc:	1b0e030b 	0x1b0e030b
 4d0:	1117550e 	beq	t0,s7,1590c <_data-0x7ffea6f4>
 4d4:	00171001 	0x171001
 4d8:	000f0200 	sll	zero,t7,0x8
 4dc:	00000b0b 	0xb0b
 4e0:	0b002403 	j	c00900c <_data-0x73ff6ff4>
 4e4:	030b3e0b 	0x30b3e0b
 4e8:	0400000e 	bltz	zero,524 <_data-0x7ffffadc>
 4ec:	0e030016 	jal	80c0058 <_data-0x77f3ffa8>
 4f0:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 4f4:	00001349 	0x1349
 4f8:	3f012e05 	0x3f012e05
 4fc:	3a0e0319 	xori	t6,s0,0x319
 500:	27053b0b 	addiu	a1,t8,15115
 504:	12011119 	beq	s0,at,496c <_data-0x7fffb694>
 508:	97184006 	lhu	t8,16390(t8)
 50c:	13011942 	beq	t8,at,6a18 <_data-0x7fff95e8>
 510:	05060000 	0x5060000
 514:	3a080300 	xori	t0,s0,0x300
 518:	49053b0b 	bc2t	$cc1,f148 <_data-0x7fff0eb8>
 51c:	00180213 	0x180213
 520:	00050700 	sll	zero,a1,0x1c
 524:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 528:	1349053b 	beq	k0,t1,1a18 <_data-0x7fffe5e8>
 52c:	00001702 	srl	v0,zero,0x1c
 530:	01828908 	0x1828908
 534:	95011101 	lhu	at,4353(t0)
 538:	13311942 	beq	t9,s1,6a44 <_data-0x7fff95bc>
 53c:	8a090000 	lwl	t1,0(s0)
 540:	02000182 	0x2000182
 544:	18429118 	0x18429118
 548:	2e0a0000 	sltiu	t2,s0,0
 54c:	03193f01 	0x3193f01
 550:	3b0b3a0e 	xori	t3,t8,0x3a0e
 554:	49192705 	bc2t	$cc6,a16c <_data-0x7fff5e94>
 558:	12011113 	beq	s0,at,49a8 <_data-0x7fffb658>
 55c:	97184006 	lhu	t8,16390(t8)
 560:	13011942 	beq	t8,at,6a6c <_data-0x7fff9594>
 564:	340b0000 	li	t3,0x0
 568:	3a080300 	xori	t0,s0,0x300
 56c:	49053b0b 	bc2t	$cc1,f19c <_data-0x7fff0e64>
 570:	00180213 	0x180213
 574:	00240c00 	0x240c00
 578:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 57c:	00000803 	sra	at,zero,0x0
 580:	0b000f0d 	j	c003c34 <_data-0x73ffc3cc>
 584:	0013490b 	0x13490b
 588:	00260e00 	0x260e00
 58c:	260f0000 	addiu	t7,s0,0
 590:	00134900 	sll	t1,s3,0x4
 594:	00341000 	0x341000
 598:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 59c:	1349053b 	beq	k0,t1,1a8c <_data-0x7fffe574>
 5a0:	00001702 	srl	v0,zero,0x1c
 5a4:	3f012e11 	0x3f012e11
 5a8:	3a0e0319 	xori	t6,s0,0x319
 5ac:	270b3b0b 	addiu	t3,t8,15115
 5b0:	11134919 	beq	t0,s3,12a18 <_data-0x7ffed5e8>
 5b4:	40061201 	0x40061201
 5b8:	19429718 	0x19429718
 5bc:	00001301 	0x1301
 5c0:	03000512 	0x3000512
 5c4:	3b0b3a08 	xori	t3,t8,0x3a08
 5c8:	0213490b 	0x213490b
 5cc:	13000017 	beqz	t8,62c <_data-0x7ffff9d4>
 5d0:	08030005 	j	c0014 <_data-0x7ff3ffec>
 5d4:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 5d8:	18021349 	0x18021349
 5dc:	34140000 	li	s4,0x0
 5e0:	3a080300 	xori	t0,s0,0x300
 5e4:	490b3b0b 	bc2tl	$cc2,f214 <_data-0x7fff0dec>
 5e8:	00170213 	0x170213
 5ec:	012e1500 	0x12e1500
 5f0:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 5f4:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 5f8:	13491927 	beq	k0,t1,6a98 <_data-0x7fff9568>
 5fc:	06120111 	bltzall	s0,a44 <_data-0x7ffff5bc>
 600:	42971840 	c0	0x971840
 604:	00000019 	multu	zero,zero
 608:	25011101 	addiu	at,t0,4353
 60c:	030b130e 	0x30b130e
 610:	550e1b0e 	bnel	t0,t6,724c <_data-0x7fff8db4>
 614:	10011117 	beq	zero,at,4a74 <_data-0x7fffb58c>
 618:	02000017 	0x2000017
 61c:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 620:	0e030b3e 	jal	80c2cf8 <_data-0x77f3d308>
 624:	2e030000 	sltiu	v1,s0,0
 628:	03193f01 	0x3193f01
 62c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 630:	4919270b 	bc2t	$cc6,a260 <_data-0x7fff5da0>
 634:	12011113 	beq	s0,at,4a84 <_data-0x7fffb57c>
 638:	97184006 	lhu	t8,16390(t8)
 63c:	13011942 	beq	t8,at,6b48 <_data-0x7fff94b8>
 640:	05040000 	0x5040000
 644:	3a080300 	xori	t0,s0,0x300
 648:	490b3b0b 	bc2tl	$cc2,f278 <_data-0x7fff0d88>
 64c:	00170213 	0x170213
 650:	012e0500 	0x12e0500
 654:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 658:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 65c:	193c1349 	0x193c1349
 660:	00001301 	0x1301
 664:	00001806 	srlv	v1,zero,zero
 668:	82890700 	lb	t1,1792(s4)
 66c:	01110101 	0x1110101
 670:	13011331 	beq	t8,at,5338 <_data-0x7fffacc8>
 674:	8a080000 	lwl	t0,0(s0)
 678:	02000182 	0x2000182
 67c:	18429118 	0x18429118
 680:	89090000 	lwl	t1,0(t0)
 684:	11010182 	beq	t0,at,c90 <_data-0x7ffff370>
 688:	00133101 	0x133101
 68c:	00240a00 	0x240a00
 690:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 694:	00000803 	sra	at,zero,0x0
 698:	0b000f0b 	j	c003c2c <_data-0x73ffc3d4>
 69c:	0013490b 	0x13490b
 6a0:	00260c00 	0x260c00
 6a4:	00001349 	0x1349
 6a8:	0300340d 	break	0x300,0xd0
 6ac:	3b0b3a08 	xori	t3,t8,0x3a08
 6b0:	0213490b 	0x213490b
 6b4:	0e000017 	jal	800005c <_data-0x77ffffa4>
 6b8:	1755010b 	bne	k0,s5,ae8 <_data-0x7ffff518>
 6bc:	0b0f0000 	j	c3c0000 <_data-0x73c40000>
 6c0:	12011101 	beq	s0,at,4ac8 <_data-0x7fffb538>
 6c4:	00130106 	0x130106
 6c8:	002e1000 	0x2e1000
 6cc:	193c193f 	0x193c193f
 6d0:	0e030e6e 	jal	80c39b8 <_data-0x77f3c648>
 6d4:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 6d8:	01000000 	0x1000000
 6dc:	0e250111 	jal	8940444 <_data-0x776bfbbc>
 6e0:	0e030b13 	jal	80c2c4c <_data-0x77f3d3b4>
 6e4:	17550e1b 	bne	k0,s5,3f54 <_data-0x7fffc0ac>
 6e8:	17100111 	bne	t8,s0,b30 <_data-0x7ffff4d0>
 6ec:	24020000 	li	v0,0
 6f0:	3e0b0b00 	0x3e0b0b00
 6f4:	000e030b 	0xe030b
 6f8:	00240300 	0x240300
 6fc:	0b3e0b0b 	j	cf82c2c <_data-0x7307d3d4>
 700:	00000803 	sra	at,zero,0x0
 704:	03001604 	0x3001604
 708:	3b0b3a0e 	xori	t3,t8,0x3a0e
 70c:	0013490b 	0x13490b
 710:	012e0500 	0x12e0500
 714:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 718:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 71c:	13491927 	beq	k0,t1,6bbc <_data-0x7fff9444>
 720:	06120111 	bltzall	s0,b68 <_data-0x7ffff498>
 724:	42971840 	c0	0x971840
 728:	00130119 	0x130119
 72c:	00050600 	sll	zero,a1,0x18
 730:	0b3a0803 	j	ce8200c <_data-0x7317dff4>
 734:	13490b3b 	beq	k0,t1,3424 <_data-0x7fffcbdc>
 738:	00001702 	srl	v0,zero,0x1c
 73c:	01828907 	0x1828907
 740:	31011101 	andi	at,t0,0x1101
 744:	08000013 	j	4c <_data-0x7fffffb4>
 748:	0001828a 	0x1828a
 74c:	42911802 	c0	0x911802
 750:	09000018 	j	4000060 <_data-0x7bffffa0>
 754:	193f002e 	0x193f002e
 758:	0e6e193c 	jal	9b864f0 <_data-0x76479b10>
 75c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 760:	00000b3b 	0xb3b
 764:	01110100 	0x1110100
 768:	0b130e25 	j	c4c3894 <_data-0x73b3c76c>
 76c:	0e1b0e03 	jal	86c380c <_data-0x7793c7f4>
 770:	01111755 	0x1111755
 774:	00001710 	0x1710
 778:	0b000f02 	j	c003c08 <_data-0x73ffc3f8>
 77c:	0300000b 	movn	zero,t8,zero
 780:	0b0b0024 	j	c2c0090 <_data-0x73d3ff70>
 784:	0e030b3e 	jal	80c2cf8 <_data-0x77f3d308>
 788:	35040000 	ori	a0,t0,0x0
 78c:	00134900 	sll	t1,s3,0x4
 790:	00160500 	sll	zero,s6,0x14
 794:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 798:	13490b3b 	beq	k0,t1,3488 <_data-0x7fffcb78>
 79c:	24060000 	li	a2,0
 7a0:	3e0b0b00 	0x3e0b0b00
 7a4:	0008030b 	0x8030b
 7a8:	012e0700 	0x12e0700
 7ac:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 7b0:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 7b4:	0b200e6e 	j	c8039b8 <_data-0x737fc648>
 7b8:	00001301 	0x1301
 7bc:	03002f08 	0x3002f08
 7c0:	00134908 	0x134908
 7c4:	00050900 	sll	at,a1,0x4
 7c8:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 7cc:	13490b3b 	beq	k0,t1,34bc <_data-0x7fffcb44>
 7d0:	340a0000 	li	t2,0x0
 7d4:	3a080300 	xori	t0,s0,0x300
 7d8:	490b3b0b 	bc2tl	$cc2,f408 <_data-0x7fff0bf8>
 7dc:	0b000013 	j	c00004c <_data-0x73ffffb4>
 7e0:	0b0b000f 	j	c2c003c <_data-0x73d3ffc4>
 7e4:	00001349 	0x1349
 7e8:	3f012e0c 	0x3f012e0c
 7ec:	3a0e0319 	xori	t6,s0,0x319
 7f0:	6e0b3b0b 	0x6e0b3b0b
 7f4:	2013490e 	addi	s3,zero,18702
 7f8:	0013010b 	0x13010b
 7fc:	012e0d00 	0x12e0d00
 800:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 804:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 808:	01111349 	0x1111349
 80c:	18400612 	blez	v0,2058 <_data-0x7fffdfa8>
 810:	01194297 	0x1194297
 814:	0e000013 	jal	800004c <_data-0x77ffffb4>
 818:	1331011d 	beq	t9,s1,c90 <_data-0x7ffff370>
 81c:	06120111 	bltzall	s0,c64 <_data-0x7ffff39c>
 820:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 824:	050f0000 	0x50f0000
 828:	02133100 	0x2133100
 82c:	10000017 	b	88c <_data-0x7ffff774>
 830:	0111010b 	0x111010b
 834:	00000612 	0x612
 838:	31003411 	andi	zero,t0,0x3411
 83c:	000d1c13 	0xd1c13
 840:	012e1200 	0x12e1200
 844:	0e03193f 	jal	80c64fc <_data-0x77f39b04>
 848:	0b3b0b3a 	j	cec2ce8 <_data-0x7313d318>
 84c:	06120111 	bltzall	s0,c94 <_data-0x7ffff36c>
 850:	42971840 	c0	0x971840
 854:	00130119 	0x130119
 858:	00051300 	sll	v0,a1,0xc
 85c:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 860:	13490b3b 	beq	k0,t1,3550 <_data-0x7fffcab0>
 864:	00001802 	srl	v1,zero,0x0
 868:	03003414 	0x3003414
 86c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 870:	0213490b 	0x213490b
 874:	15000017 	bnez	t0,8d4 <_data-0x7ffff72c>
 878:	00018289 	0x18289
 87c:	13310111 	beq	t9,s1,cc4 <_data-0x7ffff33c>
 880:	1d160000 	0x1d160000
 884:	11133101 	beq	t0,s3,cc8c <_data-0x7fff3374>
 888:	58061201 	0x58061201
 88c:	010b590b 	0x10b590b
 890:	17000013 	bnez	t8,8e0 <_data-0x7ffff720>
 894:	13310005 	beq	t9,s1,8ac <_data-0x7ffff754>
 898:	1d180000 	0x1d180000
 89c:	52133101 	beql	s0,s3,cca4 <_data-0x7fff335c>
 8a0:	58175501 	0x58175501
 8a4:	010b590b 	0x10b590b
 8a8:	19000013 	blez	t0,8f8 <_data-0x7ffff708>
 8ac:	1331011d 	beq	t9,s1,d24 <_data-0x7ffff2dc>
 8b0:	17550152 	bne	k0,s5,dfc <_data-0x7ffff204>
 8b4:	0b590b58 	j	d642d60 <_data-0x729bd2a0>
 8b8:	0b1a0000 	j	c680000 <_data-0x73980000>
 8bc:	00175501 	0x175501
 8c0:	00341b00 	0x341b00
 8c4:	18021331 	0x18021331
 8c8:	2e1c0000 	sltiu	gp,s0,0
 8cc:	03193f01 	0x3193f01
 8d0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 8d4:	010b200b 	movn	a0,t0,t3
 8d8:	1d000013 	bgtz	t0,928 <_data-0x7ffff6d8>
 8dc:	193f012e 	0x193f012e
 8e0:	0b3a0e03 	j	ce8380c <_data-0x7317c7f4>
 8e4:	13490b3b 	beq	k0,t1,35d4 <_data-0x7fffca2c>
 8e8:	13010b20 	beq	t8,at,356c <_data-0x7fffca94>
 8ec:	2e1e0000 	sltiu	s8,s0,0
 8f0:	11133101 	beq	t0,s3,ccf8 <_data-0x7fff3308>
 8f4:	40061201 	0x40061201
 8f8:	19429718 	0x19429718
 8fc:	00001301 	0x1301
 900:	3100051f 	andi	zero,t0,0x51f
 904:	00180213 	0x180213
 908:	012e2000 	0x12e2000
 90c:	01111331 	tgeu	t0,s1,0x4c
 910:	18400612 	blez	v0,215c <_data-0x7fffdea4>
 914:	00194297 	0x194297
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	88000298 	lwl	zero,664(zero)
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	880002ac 	lwl	zero,684(zero)
   8:	9f300002 	0x9f300002
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	880002ac 	lwl	zero,684(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	8800032c 	lwl	zero,812(zero)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	90730004 	lbu	s3,4(v1)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	00009f03 	sra	s3,zero,0x1c
  1c:	00000000 	nop
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	02500000 	0x2500000
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	02988800 	0x2988800
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	00028800 	sll	s1,v0,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	02989f30 	tge	s4,t8,0x27c
  30:	03348800 	0x3348800
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	00048800 	sll	s1,a0,0x0
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	9f02ac77 	0x9f02ac77
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	88000334 	lwl	zero,820(zero)
  40:	88000338 	lwl	zero,824(zero)
  44:	ad770004 	sw	s7,4(t3)
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	03389f02 	0x3389f02
  4c:	03488800 	0x3488800
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	00048800 	sll	s1,a0,0x0
  54:	9f02ac77 	0x9f02ac77
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	880002cc 	lwl	zero,716(zero)
  64:	88000338 	lwl	zero,824(zero)
  68:	00770017 	0x770017
  6c:	25f72cf7 	addiu	s7,t7,11511
  70:	000425f4 	teq	zero,a0,0x97
  74:	1b439600 	0x1b439600
  78:	000425f4 	teq	zero,a0,0x97
  7c:	22000000 	addi	zero,s0,0
  80:	0003389f 	0x3389f
  84:	00034888 	0x34888
  88:	77001788 	jalx	c005e20 <_data-0x73ffa1e0>
  8c:	f72cf77f 	sdc1	$f12,-2177(t9)
  90:	0425f425 	0x425f425
  94:	43960000 	c0	0x1960000
  98:	0425f41b 	0x425f41b
  9c:	00000000 	nop
  a0:	00009f22 	0x9f22
  a4:	00000000 	nop
  a8:	02cc0000 	0x2cc0000
  ac:	02d88800 	0x2d88800
  b0:	00028800 	sll	s1,v0,0x0
  b4:	02e42190 	0x2e42190
  b8:	03488800 	0x3488800
  bc:	00028800 	sll	s1,v0,0x0
  c0:	00002290 	0x2290
  c4:	00000000 	nop
  c8:	02cc0000 	0x2cc0000
  cc:	02dc8800 	0x2dc8800
  d0:	00028800 	sll	s1,v0,0x0
  d4:	02e82090 	0x2e82090
  d8:	03488800 	0x3488800
  dc:	00028800 	sll	s1,v0,0x0
  e0:	00002090 	0x2090
  e4:	00000000 	nop
  e8:	02cc0000 	0x2cc0000
  ec:	02d88800 	0x2d88800
  f0:	00028800 	sll	s1,v0,0x0
  f4:	00002190 	0x2190
  f8:	00000000 	nop
  fc:	02cc0000 	0x2cc0000
 100:	02dc8800 	0x2dc8800
 104:	00028800 	sll	s1,v0,0x0
 108:	00002090 	0x2090
 10c:	00000000 	nop
 110:	02cc0000 	0x2cc0000
 114:	03208800 	0x3208800
 118:	00018800 	sll	s1,at,0x0
 11c:	00000052 	mflhxu	zero
 120:	00000000 	nop
 124:	00030c00 	sll	at,v1,0x10
 128:	00032088 	0x32088
 12c:	52000188 	beqzl	s0,750 <_data-0x7ffff8b0>
 130:	00000000 	nop
 134:	00000000 	nop
 138:	88000510 	lwl	zero,1296(zero)
 13c:	88000520 	lwl	zero,1312(zero)
 140:	20540001 	addi	s4,v0,1
 144:	6c880005 	0x6c880005
 148:	01880005 	0x1880005
 14c:	056c6100 	teqi	t3,24832
 150:	05808800 	bltz	t4,fffe2154 <_text_end+0x77fe123c>
 154:	00048800 	sll	s1,a0,0x0
 158:	9f5401f3 	0x9f5401f3
 15c:	88000580 	lwl	zero,1408(zero)
 160:	880005c4 	lwl	zero,1476(zero)
 164:	00610001 	movt	zero,v1,$fcc0
 168:	00000000 	nop
 16c:	10000000 	b	170 <_data-0x7ffffe90>
 170:	33880005 	andi	t0,gp,0x5
 174:	01880005 	0x1880005
 178:	05335500 	bgezall	t1,1557c <_data-0x7ffeaa84>
 17c:	05c48800 	0x5c48800
 180:	00048800 	sll	s1,a0,0x0
 184:	9f5501f3 	0x9f5501f3
	...
 190:	8800058c 	lwl	zero,1420(zero)
 194:	880005b3 	lwl	zero,1459(zero)
 198:	00560001 	0x560001
 19c:	00000000 	nop
 1a0:	a8000000 	swl	zero,0(zero)
 1a4:	cc880004 	pref	0x8,4(a0)
 1a8:	02880004 	sllv	zero,t0,s4
 1ac:	cc9f3000 	pref	0x1f,12288(a0)
 1b0:	ec880004 	swc3	$8,4(a0)
 1b4:	01880004 	sllv	zero,t0,t4
 1b8:	00006000 	sll	t4,zero,0x0
 1bc:	00000000 	nop
 1c0:	04e00000 	bltz	a3,1c4 <_data-0x7ffffe3c>
 1c4:	04f38800 	bgezall	a3,fffe21c8 <_text_end+0x77fe12b0>
 1c8:	00018800 	sll	s1,at,0x0
 1cc:	00000056 	0x56
 1d0:	00000000 	nop
 1d4:	0004e000 	sll	gp,a0,0x0
 1d8:	0004f388 	0x4f388
 1dc:	57000188 	bnezl	t8,800 <_data-0x7ffff800>
 1e0:	00000000 	nop
 1e4:	00000000 	nop
 1e8:	880004e0 	lwl	zero,1248(zero)
 1ec:	880004f3 	lwl	zero,1267(zero)
 1f0:	00520001 	0x520001
 1f4:	00000000 	nop
 1f8:	10000000 	b	1fc <_data-0x7ffffe04>
 1fc:	44880004 	0x44880004
 200:	01880004 	sllv	zero,t0,t4
 204:	04445400 	0x4445400
 208:	04a08800 	bltz	a1,fffe220c <_text_end+0x77fe12f4>
 20c:	00018800 	sll	s1,at,0x0
 210:	0004a060 	0x4a060
 214:	0004a888 	0x4a888
 218:	f3000488 	0xf3000488
 21c:	009f5401 	0x9f5401
 220:	00000000 	nop
 224:	10000000 	b	228 <_data-0x7ffffdd8>
 228:	44880004 	0x44880004
 22c:	02880004 	sllv	zero,t0,s4
 230:	449f3100 	0x449f3100
 234:	50880004 	beql	a0,t0,248 <_data-0x7ffffdb8>
 238:	01880004 	sllv	zero,t0,t4
 23c:	04506100 	bltzal	v0,18640 <_data-0x7ffe79c0>
 240:	04578800 	0x4578800
 244:	00018800 	sll	s1,at,0x0
 248:	00045755 	0x45755
 24c:	00045888 	0x45888
 250:	81000388 	lb	zero,904(t0)
 254:	04589f7f 	0x4589f7f
 258:	049c8800 	0x49c8800
 25c:	00018800 	sll	s1,at,0x0
 260:	00000061 	0x61
 264:	00000000 	nop
 268:	00039800 	sll	s3,v1,0x0
 26c:	0003f088 	0x3f088
 270:	60000188 	0x60000188
 274:	880003fc 	lwl	zero,1020(zero)
 278:	88000410 	lwl	zero,1040(zero)
 27c:	00600001 	movf	zero,v1,$fcc0
 280:	00000000 	nop
 284:	d0000000 	0xd0000000
 288:	e3880003 	sc	t0,3(gp)
 28c:	01880003 	0x1880003
 290:	03fc5200 	0x3fc5200
 294:	04078800 	0x4078800
 298:	00018800 	sll	s1,at,0x0
 29c:	00000052 	mflhxu	zero
 2a0:	00000000 	nop
 2a4:	0005c400 	sll	t8,a1,0x10
 2a8:	00060088 	0x60088
 2ac:	54000188 	bnezl	zero,8d0 <_data-0x7ffff730>
 2b0:	88000600 	lwl	zero,1536(zero)
 2b4:	88000620 	lwl	zero,1568(zero)
 2b8:	20620001 	addi	v0,v1,1
 2bc:	34880006 	ori	t0,a0,0x6
 2c0:	04880006 	tgei	a0,6
 2c4:	5401f300 	bnel	zero,at,ffffcec8 <_text_end+0x77ffbfb0>
 2c8:	0006349f 	0x6349f
 2cc:	0007e888 	0x7e888
 2d0:	62000188 	0x62000188
	...
 2dc:	880005f8 	lwl	zero,1528(zero)
 2e0:	88000600 	lwl	zero,1536(zero)
 2e4:	9f300002 	0x9f300002
 2e8:	88000600 	lwl	zero,1536(zero)
 2ec:	88000624 	lwl	zero,1572(zero)
 2f0:	34610001 	ori	at,v1,0x1
 2f4:	48880006 	mtc2	t0,$0,6
 2f8:	01880007 	srav	zero,t0,t4
 2fc:	07486100 	tgei	k0,24832
 300:	07508800 	bltzal	k0,fffe2304 <_text_end+0x77fe13ec>
 304:	00038800 	sll	s1,v1,0x0
 308:	509f7f81 	beql	a0,ra,20110 <_data-0x7ffdfef0>
 30c:	a0880007 	sb	t0,7(a0)
 310:	01880007 	srav	zero,t0,t4
 314:	07ac6100 	teqi	sp,24832
 318:	07c88800 	tgei	s8,-30720
 31c:	00018800 	sll	s1,at,0x0
 320:	0007c861 	0x7c861
 324:	0007d088 	0x7d088
 328:	74000688 	jalx	1a20 <_data-0x7fffe5e0>
 32c:	1c008200 	bgtz	zero,fffe0b30 <_text_end+0x77fdfc18>
 330:	0007d09f 	0x7d09f
 334:	0007e888 	0x7e888
 338:	61000188 	0x61000188
	...
 344:	88000634 	lwl	zero,1588(zero)
 348:	88000648 	lwl	zero,1608(zero)
 34c:	d0640001 	0xd0640001
 350:	e8880007 	swc2	$8,7(a0)
 354:	01880007 	srav	zero,t0,t4
 358:	00006400 	sll	t4,zero,0x10
 35c:	00000000 	nop
 360:	05f80000 	0x5f80000
 364:	06288800 	tgei	s1,-30720
 368:	00018800 	sll	s1,at,0x0
 36c:	00063460 	0x63460
 370:	0007e888 	0x7e888
 374:	60000188 	0x60000188
	...
 380:	88000648 	lwl	zero,1608(zero)
 384:	88000684 	lwl	zero,1668(zero)
 388:	94550001 	lhu	s5,1(v0)
 38c:	b3880006 	0xb3880006
 390:	01880006 	srlv	zero,t0,t4
 394:	06bc5500 	0x6bc5500
 398:	070f8800 	0x70f8800
 39c:	00018800 	sll	s1,at,0x0
 3a0:	00072455 	0x72455
 3a4:	00073388 	0x73388
 3a8:	55000188 	bnezl	t0,9cc <_data-0x7ffff634>
 3ac:	8800073c 	lwl	zero,1852(zero)
 3b0:	8800074f 	lwl	zero,1871(zero)
 3b4:	58550001 	0x58550001
 3b8:	67880007 	0x67880007
 3bc:	01880007 	srav	zero,t0,t4
 3c0:	07745500 	0x7745500
 3c4:	07938800 	bgezall	gp,fffe23c8 <_text_end+0x77fe14b0>
 3c8:	00018800 	sll	s1,at,0x0
 3cc:	00079c55 	0x79c55
 3d0:	0007a488 	0x7a488
 3d4:	55000188 	bnezl	t0,9f8 <_data-0x7ffff608>
 3d8:	880007ac 	lwl	zero,1964(zero)
 3dc:	880007d0 	lwl	zero,2000(zero)
 3e0:	00550001 	movt	zero,v0,$fcc5
 3e4:	00000000 	nop
 3e8:	e8000000 	swc2	$0,0(zero)
 3ec:	1c880007 	0x1c880007
 3f0:	01880008 	0x1880008
 3f4:	081c5400 	j	715000 <_data-0x7f8eb000>
 3f8:	08248800 	j	922000 <_data-0x7f6de000>
 3fc:	00048800 	sll	s1,a0,0x0
 400:	9f1f0080 	0x9f1f0080
 404:	88000824 	lwl	zero,2084(zero)
 408:	8800086c 	lwl	zero,2156(zero)
 40c:	01f30004 	sllv	zero,s3,t7
 410:	086c9f54 	j	1b27d50 <_data-0x7e4d82b0>
 414:	08748800 	j	1d22000 <_data-0x7e2de000>
 418:	00018800 	sll	s1,at,0x0
 41c:	00087454 	0x87454
 420:	0008c088 	0x8c088
 424:	f3000488 	0xf3000488
 428:	009f5401 	0x9f5401
 42c:	00000000 	nop
 430:	e8000000 	swc2	$0,0(zero)
 434:	23880007 	addi	t0,gp,7
 438:	01880008 	0x1880008
 43c:	08235500 	j	8d5400 <_data-0x7f72ac00>
 440:	083c8800 	j	f22000 <_data-0x7f0de000>
 444:	00018800 	sll	s1,at,0x0
 448:	00083c63 	0x83c63
 44c:	00086c88 	0x86c88
 450:	f3000488 	0xf3000488
 454:	6c9f5501 	0x6c9f5501
 458:	74880008 	jalx	2200020 <_data-0x7ddfffe0>
 45c:	01880008 	0x1880008
 460:	08745500 	j	1d15400 <_data-0x7e2eac00>
 464:	08908800 	j	2422000 <_data-0x7dbde000>
 468:	00018800 	sll	s1,at,0x0
 46c:	00089063 	0x89063
 470:	0008c088 	0x8c088
 474:	f3000488 	0xf3000488
 478:	009f5501 	0x9f5501
 47c:	00000000 	nop
 480:	e8000000 	swc2	$0,0(zero)
 484:	23880007 	addi	t0,gp,7
 488:	01880008 	0x1880008
 48c:	08235600 	j	8d5800 <_data-0x7f72a800>
 490:	08508800 	j	1422000 <_data-0x7ebde000>
 494:	00018800 	sll	s1,at,0x0
 498:	00085064 	0x85064
 49c:	00086c88 	0x86c88
 4a0:	f3000488 	0xf3000488
 4a4:	6c9f5601 	0x6c9f5601
 4a8:	74880008 	jalx	2200020 <_data-0x7ddfffe0>
 4ac:	01880008 	0x1880008
 4b0:	08745600 	j	1d15800 <_data-0x7e2ea800>
 4b4:	08c08800 	j	3022000 <_data-0x7cfde000>
 4b8:	00018800 	sll	s1,at,0x0
 4bc:	00000064 	0x64
 4c0:	00000000 	nop
 4c4:	0007e800 	sll	sp,a3,0x0
 4c8:	00082388 	0x82388
 4cc:	57000188 	bnezl	t8,af0 <_data-0x7ffff510>
 4d0:	88000823 	lwl	zero,2083(zero)
 4d4:	8800086c 	lwl	zero,2156(zero)
 4d8:	01f30004 	sllv	zero,s3,t7
 4dc:	086c9f57 	j	1b27d5c <_data-0x7e4d82a4>
 4e0:	08748800 	j	1d22000 <_data-0x7e2de000>
 4e4:	00018800 	sll	s1,at,0x0
 4e8:	00087457 	0x87457
 4ec:	0008c088 	0x8c088
 4f0:	f3000488 	0xf3000488
 4f4:	009f5701 	0x9f5701
 4f8:	00000000 	nop
 4fc:	2c000000 	sltiu	zero,zero,0
 500:	58880008 	0x58880008
 504:	01880008 	0x1880008
 508:	08746200 	j	1d18800 <_data-0x7e2e7800>
 50c:	08888800 	j	2222000 <_data-0x7ddde000>
 510:	00018800 	sll	s1,at,0x0
 514:	00089062 	0x89062
 518:	0008c088 	0x8c088
 51c:	62000188 	0x62000188
	...
 528:	88000834 	lwl	zero,2100(zero)
 52c:	8800083c 	lwl	zero,2108(zero)
 530:	0083000e 	0x83000e
 534:	16008212 	bnez	s0,fffe0d80 <_text_end+0x77fdfe68>
 538:	01282b14 	0x1282b14
 53c:	9f131600 	0x9f131600
 540:	8800083c 	lwl	zero,2108(zero)
 544:	88000840 	lwl	zero,2112(zero)
 548:	01f3000f 	0x1f3000f
 54c:	00821255 	0x821255
 550:	282b1416 	slti	t3,at,5142
 554:	13160001 	beq	t8,s6,55c <_data-0x7ffffaa4>
 558:	0008409f 	0x8409f
 55c:	00086088 	0x86088
 560:	60000188 	0x60000188
 564:	88000890 	lwl	zero,2192(zero)
 568:	880008c0 	lwl	zero,2240(zero)
 56c:	00600001 	movf	zero,v1,$fcc0
 570:	00000000 	nop
 574:	a0000000 	sb	zero,0(zero)
 578:	ac880008 	sw	t0,8(a0)
 57c:	01880008 	0x1880008
 580:	00005200 	sll	t2,zero,0x8
 584:	00000000 	nop
 588:	081c0000 	j	700000 <_data-0x7f900000>
 58c:	08248800 	j	922000 <_data-0x7f6de000>
 590:	00018800 	sll	s1,at,0x0
 594:	00082c60 	0x82c60
 598:	00083888 	0x83888
 59c:	60000188 	0x60000188
 5a0:	8800086c 	lwl	zero,2156(zero)
 5a4:	88000874 	lwl	zero,2164(zero)
 5a8:	74540001 	jalx	1500004 <_data-0x7eaffffc>
 5ac:	90880008 	lbu	t0,8(a0)
 5b0:	01880008 	0x1880008
 5b4:	00006000 	sll	t4,zero,0x0
	...
 5c4:	00010000 	sll	zero,at,0x0
 5c8:	00000055 	0x55
 5cc:	00000000 	nop
 5d0:	56000100 	bnezl	s0,9d4 <_data-0x7ffff62c>
 5d4:	00000000 	nop
 5d8:	00000000 	nop
 5dc:	01f30004 	sllv	zero,s3,t7
 5e0:	00009f55 	0x9f55
	...
 5f0:	00010000 	sll	zero,at,0x0
 5f4:	00000054 	0x54
 5f8:	00000000 	nop
 5fc:	f3000400 	0xf3000400
 600:	009f5401 	0x9f5401
	...
 610:	01000000 	0x1000000
 614:	00005500 	sll	t2,zero,0x14
 618:	00000000 	nop
 61c:	00040000 	sll	zero,a0,0x0
 620:	9f5501f3 	0x9f5501f3
	...
 634:	00560001 	0x560001
 638:	00000000 	nop
 63c:	06000000 	bltz	s0,640 <_data-0x7ffff9c0>
 640:	5601f300 	bnel	s0,at,ffffd244 <_text_end+0x77ffc32c>
 644:	009f1c31 	tgeu	a0,ra,0x70
	...
 654:	01000000 	0x1000000
 658:	00005400 	sll	t2,zero,0x10
 65c:	00000000 	nop
 660:	00010000 	sll	zero,at,0x0
 664:	00000052 	mflhxu	zero
	...
 674:	55000100 	bnezl	t0,a78 <_data-0x7ffff588>
 678:	00000000 	nop
 67c:	00000000 	nop
 680:	01f30004 	sllv	zero,s3,t7
 684:	00009f55 	0x9f55
 688:	00000000 	nop
 68c:	00010000 	sll	zero,at,0x0
 690:	00000055 	0x55
 694:	00000000 	nop
 698:	f3000400 	0xf3000400
 69c:	009f5501 	0x9f5501
	...
 6ac:	01000000 	0x1000000
 6b0:	00005600 	sll	t2,zero,0x18
 6b4:	00000000 	nop
 6b8:	000a0000 	sll	zero,t2,0x0
 6bc:	72200073 	0x72200073
 6c0:	00762200 	0x762200
 6c4:	00009f22 	0x9f22
 6c8:	00000000 	nop
 6cc:	00010000 	sll	zero,at,0x0
 6d0:	00000056 	0x56
 6d4:	00000000 	nop
 6d8:	f3001000 	0xf3001000
 6dc:	73205601 	0x73205601
 6e0:	01f32200 	0x1f32200
 6e4:	01f31c55 	0x1f31c55
 6e8:	009f2256 	0x9f2256
 6ec:	00000000 	nop
 6f0:	07000000 	bltz	t8,6f4 <_data-0x7ffff90c>
 6f4:	f3007300 	0xf3007300
 6f8:	9f1c5501 	0x9f1c5501
	...
 704:	0073000a 	movz	zero,v1,s3
 708:	22007220 	addi	zero,s0,29216
 70c:	9f220076 	0x9f220076
	...
 718:	00720009 	0x720009
 71c:	761c0073 	jalx	87001cc <_data-0x778ffe34>
 720:	009f2200 	0x9f2200
	...
 730:	01000000 	0x1000000
 734:	00005500 	sll	t2,zero,0x14
 738:	00000000 	nop
 73c:	00010000 	sll	zero,at,0x0
 740:	00000053 	mtlhx	zero
 744:	00000000 	nop
 748:	55000100 	bnezl	t0,b4c <_data-0x7ffff4b4>
 74c:	00000000 	nop
	...
 75c:	00540001 	movf	zero,v0,$fcc5
 760:	00000000 	nop
 764:	01000000 	0x1000000
 768:	00005200 	sll	t2,zero,0x8
 76c:	00000000 	nop
 770:	00010000 	sll	zero,at,0x0
 774:	00000053 	mtlhx	zero
 778:	00000000 	nop
 77c:	52000100 	beqzl	s0,b80 <_data-0x7ffff480>
 780:	00000000 	nop
 784:	00000000 	nop
 788:	00570001 	0x570001
 78c:	00000000 	nop
 790:	01000000 	0x1000000
 794:	00005500 	sll	t2,zero,0x14
 798:	00000000 	nop
 79c:	00010000 	sll	zero,at,0x0
 7a0:	00000053 	mtlhx	zero
	...
 7b0:	54000100 	bnezl	zero,bb4 <_data-0x7ffff44c>
 7b4:	00000000 	nop
 7b8:	00000000 	nop
 7bc:	00520001 	0x520001
	...
 7cc:	01000000 	0x1000000
 7d0:	00005500 	sll	t2,zero,0x14
 7d4:	00000000 	nop
 7d8:	00040000 	sll	zero,a0,0x0
 7dc:	9f5501f3 	0x9f5501f3
	...
 7f0:	00560001 	0x560001
 7f4:	00000000 	nop
 7f8:	04000000 	bltz	zero,7fc <_data-0x7ffff804>
 7fc:	5601f300 	bnel	s0,at,ffffd400 <_text_end+0x77ffc4e8>
 800:	0000009f 	0x9f
 804:	00000000 	nop
 808:	73000b00 	0x73000b00
 80c:	00722000 	0x722000
 810:	5601f322 	bnel	s0,at,ffffd49c <_text_end+0x77ffc584>
 814:	00009f22 	0x9f22
 818:	00000000 	nop
 81c:	000a0000 	sll	zero,t2,0x0
 820:	00730072 	tlt	v1,s3,0x1
 824:	5601f31c 	bnel	s0,at,ffffd498 <_text_end+0x77ffc580>
 828:	00009f22 	0x9f22
	...
 838:	00010000 	sll	zero,at,0x0
 83c:	00000054 	0x54
 840:	00000000 	nop
 844:	53000100 	beqzl	t8,c48 <_data-0x7ffff3b8>
 848:	00000000 	nop
 84c:	00000000 	nop
 850:	880008c0 	lwl	zero,2240(zero)
 854:	880008cc 	lwl	zero,2252(zero)
 858:	cc540001 	pref	0x14,1(v0)
 85c:	e4880008 	swc1	$f8,8(a0)
 860:	01880008 	0x1880008
 864:	00005200 	sll	t2,zero,0x8
 868:	00000000 	nop
 86c:	08c00000 	j	3000000 <_data-0x7d000000>
 870:	08c88800 	j	3222000 <_data-0x7cdde000>
 874:	00018800 	sll	s1,at,0x0
 878:	0008c856 	0x8c856
 87c:	0008cc88 	0x8cc88
 880:	f3000488 	0xf3000488
 884:	cc9f5601 	pref	0x1f,22017(a0)
 888:	dc880008 	ldc3	$8,8(a0)
 88c:	0b880008 	j	e200020 <_data-0x71dfffe0>
 890:	20007300 	addi	zero,zero,29440
 894:	f3220072 	0xf3220072
 898:	9f225601 	0x9f225601
 89c:	880008dc 	lwl	zero,2268(zero)
 8a0:	880008e4 	lwl	zero,2276(zero)
 8a4:	0072000a 	movz	zero,v1,s2
 8a8:	f31c0073 	0xf31c0073
 8ac:	9f225601 	0x9f225601
	...
 8b8:	880008c4 	lwl	zero,2244(zero)
 8bc:	880008cc 	lwl	zero,2252(zero)
 8c0:	cc540001 	pref	0x14,1(v0)
 8c4:	e4880008 	swc1	$f8,8(a0)
 8c8:	01880008 	0x1880008
 8cc:	00005300 	sll	t2,zero,0xc
	...
 8dc:	00010000 	sll	zero,at,0x0
 8e0:	00000054 	0x54
 8e4:	00000000 	nop
 8e8:	52000100 	beqzl	s0,cec <_data-0x7ffff314>
 8ec:	00000000 	nop
	...
 8fc:	00540001 	movf	zero,v0,$fcc5
 900:	00000000 	nop
 904:	01000000 	0x1000000
 908:	00005200 	sll	t2,zero,0x8
 90c:	00000000 	nop
 910:	00010000 	sll	zero,at,0x0
 914:	00000052 	mflhxu	zero
	...
 924:	54000100 	bnezl	zero,d28 <_data-0x7ffff2d8>
 928:	00000000 	nop
 92c:	00000000 	nop
 930:	00540001 	movf	zero,v0,$fcc5
	...
 940:	01000000 	0x1000000
 944:	00005500 	sll	t2,zero,0x14
 948:	00000000 	nop
 94c:	00010000 	sll	zero,at,0x0
 950:	00000055 	0x55
	...
 960:	56000100 	bnezl	s0,d64 <_data-0x7ffff29c>
 964:	00000000 	nop
 968:	00000000 	nop
 96c:	01f30004 	sllv	zero,s3,t7
 970:	00009f56 	0x9f56
 974:	00000000 	nop
 978:	00060000 	sll	zero,a2,0x0
 97c:	315601f3 	andi	s6,t2,0x1f3
 980:	00009f1c 	0x9f1c
 984:	00000000 	nop
 988:	00040000 	sll	zero,a0,0x0
 98c:	9f5601f3 	0x9f5601f3
	...
 9a0:	00540001 	movf	zero,v0,$fcc5
 9a4:	00000000 	nop
 9a8:	01000000 	0x1000000
 9ac:	00005400 	sll	t2,zero,0x10
	...
 9bc:	00010000 	sll	zero,at,0x0
 9c0:	00000055 	0x55
 9c4:	00000000 	nop
 9c8:	55000100 	bnezl	t0,dcc <_data-0x7ffff234>
 9cc:	00000000 	nop
	...
 9dc:	00540001 	movf	zero,v0,$fcc5
 9e0:	00000000 	nop
 9e4:	01000000 	0x1000000
 9e8:	00005200 	sll	t2,zero,0x8
	...
 9f8:	00010000 	sll	zero,at,0x0
 9fc:	00000055 	0x55
 a00:	00000000 	nop
 a04:	55000100 	bnezl	t0,e08 <_data-0x7ffff1f8>
 a08:	00000000 	nop
	...
 a18:	00560001 	0x560001
 a1c:	00000000 	nop
 a20:	04000000 	bltz	zero,a24 <_data-0x7ffff5dc>
 a24:	5601f300 	bnel	s0,at,ffffd628 <_text_end+0x77ffc710>
 a28:	0000009f 	0x9f
 a2c:	00000000 	nop
 a30:	72000a00 	0x72000a00
 a34:	1c007300 	bgtz	zero,1d638 <_data-0x7ffe29c8>
 a38:	225601f3 	addi	s6,s2,499
 a3c:	0000009f 	0x9f
	...
 a4c:	54000100 	bnezl	zero,e50 <_data-0x7ffff1b0>
 a50:	00000000 	nop
 a54:	00000000 	nop
 a58:	00530001 	0x530001
	...
 a68:	01000000 	0x1000000
 a6c:	00005400 	sll	t2,zero,0x10
 a70:	00000000 	nop
 a74:	00010000 	sll	zero,at,0x0
 a78:	00000052 	mflhxu	zero
	...
 a88:	55000100 	bnezl	t0,e8c <_data-0x7ffff174>
 a8c:	00000000 	nop
 a90:	00000000 	nop
 a94:	00550001 	movt	zero,v0,$fcc5
	...
 aa4:	01000000 	0x1000000
 aa8:	00005400 	sll	t2,zero,0x10
 aac:	00000000 	nop
 ab0:	00010000 	sll	zero,at,0x0
 ab4:	00000053 	mtlhx	zero
	...
 ac4:	54000100 	bnezl	zero,ec8 <_data-0x7ffff138>
 ac8:	00000000 	nop
 acc:	00000000 	nop
 ad0:	00740006 	srlv	zero,s4,v1
 ad4:	9f220072 	0x9f220072
	...
 ae0:	00720008 	0x720008
 ae4:	23220074 	addi	v0,t9,116
 ae8:	00009f01 	0x9f01
 aec:	00000000 	nop
 af0:	00060000 	sll	zero,a2,0x0
 af4:	00740072 	tlt	v1,s4,0x1
 af8:	00009f22 	0x9f22
	...
 b08:	00020000 	sll	zero,v0,0x0
 b0c:	00009f30 	tge	zero,zero,0x27c
 b10:	00000000 	nop
 b14:	00010000 	sll	zero,at,0x0
 b18:	00000052 	mflhxu	zero
	...
 b28:	54000100 	bnezl	zero,f2c <_data-0x7ffff0d4>
 b2c:	00000000 	nop
 b30:	00000000 	nop
 b34:	00530001 	0x530001
	...
 b44:	02000000 	0x2000000
 b48:	009f3000 	0x9f3000
 b4c:	00000000 	nop
 b50:	01000000 	0x1000000
 b54:	00005200 	sll	t2,zero,0x8
 b58:	00000000 	nop
 b5c:	09440000 	j	5100000 <_data-0x7af00000>
 b60:	09538800 	j	54e2000 <_data-0x7ab1e000>
 b64:	00018800 	sll	s1,at,0x0
 b68:	00095354 	0x95354
 b6c:	00097488 	0x97488
 b70:	f3000488 	0xf3000488
 b74:	009f5401 	0x9f5401
 b78:	00000000 	nop
 b7c:	e4000000 	swc1	$f0,0(zero)
 b80:	00880008 	0x880008
 b84:	01880009 	0x1880009
 b88:	09005400 	j	4015000 <_data-0x7bfeb000>
 b8c:	09148800 	j	4522000 <_data-0x7bade000>
 b90:	00018800 	sll	s1,at,0x0
 b94:	00092461 	0x92461
 b98:	00094488 	0x94488
 b9c:	61000188 	0x61000188
	...
 ba8:	88000904 	lwl	zero,2308(zero)
 bac:	88000918 	lwl	zero,2328(zero)
 bb0:	24600001 	addiu	zero,v1,1
 bb4:	44880009 	0x44880009
 bb8:	01880009 	0x1880009
 bbc:	00006000 	sll	t4,zero,0x0
 bc0:	00000000 	nop
 bc4:	09740000 	j	5d00000 <_data-0x7a300000>
 bc8:	09808800 	j	6022000 <_data-0x79fde000>
 bcc:	00018800 	sll	s1,at,0x0
 bd0:	00098054 	0x98054
 bd4:	00099888 	0x99888
 bd8:	60000188 	0x60000188
 bdc:	88000998 	lwl	zero,2456(zero)
 be0:	880009a0 	lwl	zero,2464(zero)
 be4:	00520001 	0x520001
	...
 bf4:	06000000 	bltz	s0,bf8 <_data-0x7ffff408>
 bf8:	20049e00 	addi	a0,zero,-25088
 bfc:	00bff0f0 	tge	a1,ra,0x3c3
 c00:	00000000 	nop
 c04:	0c000000 	jal	0 <_data-0x80000000>
 c08:	1888000a 	0x1888000a
 c0c:	0188000a 	movz	zero,t4,t0
 c10:	00005400 	sll	t2,zero,0x10
 c14:	00000000 	nop
 c18:	0a0c0000 	j	8300000 <_data-0x77d00000>
 c1c:	0a188800 	j	8622000 <_data-0x779de000>
 c20:	00068800 	sll	s1,a2,0x0
 c24:	f010049e 	0xf010049e
 c28:	0000bff0 	tge	zero,zero,0x2ff
 c2c:	00000000 	nop
 c30:	09f80000 	j	7e00000 <_data-0x78200000>
 c34:	0a048800 	j	8122000 <_data-0x77ede000>
 c38:	00018800 	sll	s1,at,0x0
 c3c:	00000054 	0x54
 c40:	00000000 	nop
 c44:	0009f800 	sll	ra,t1,0x0
 c48:	000a0488 	0xa0488
 c4c:	9e000688 	0x9e000688
 c50:	f0f00004 	0xf0f00004
 c54:	000000bf 	0xbf
	...
 c64:	30000200 	andi	zero,zero,0x200
 c68:	0000009f 	0x9f
 c6c:	00000000 	nop
 c70:	74000600 	jalx	1800 <_data-0x7fffe800>
 c74:	1aff0800 	0x1aff0800
 c78:	0000009f 	0x9f
 c7c:	00000000 	nop
 c80:	75000e00 	jalx	4003800 <_data-0x7bffc800>
 c84:	1aff0800 	0x1aff0800
 c88:	00742438 	0x742438
 c8c:	211aff08 	addi	k0,t0,-248
 c90:	0000009f 	0x9f
 c94:	00000000 	nop
 c98:	54000100 	bnezl	zero,109c <_data-0x7fffef64>
 c9c:	00000000 	nop
 ca0:	00000000 	nop
 ca4:	0072000b 	movn	zero,v1,s2
 ca8:	481aff08 	0x481aff08
 cac:	21007424 	addi	zero,t0,29732
 cb0:	0000009f 	0x9f
 cb4:	00000000 	nop
 cb8:	0009ec00 	sll	sp,t1,0x10
 cbc:	0009f088 	0x9f088
 cc0:	54000188 	bnezl	zero,12e4 <_data-0x7fffed1c>
 cc4:	00000000 	nop
 cc8:	00000000 	nop
 ccc:	880009ec 	lwl	zero,2540(zero)
 cd0:	880009f0 	lwl	zero,2544(zero)
 cd4:	049e0006 	0x49e0006
 cd8:	bfd03000 	cache	0x10,12288(s8)
	...
 ce4:	880009a0 	lwl	zero,2464(zero)
 ce8:	880009ac 	lwl	zero,2476(zero)
 cec:	81090003 	lb	t1,3(t0)
 cf0:	0000009f 	0x9f
 cf4:	00000000 	nop
 cf8:	0009a000 	sll	s4,t1,0x0
 cfc:	0009ac88 	0x9ac88
 d00:	9e000688 	0x9e000688
 d04:	d0300804 	0xd0300804
 d08:	000000bf 	0xbf
 d0c:	00000000 	nop
 d10:	0009ac00 	sll	s5,t1,0x10
 d14:	0009b488 	0x9b488
 d18:	09000388 	j	4000e20 <_data-0x7bfff1e0>
 d1c:	00009f80 	sll	s3,zero,0x1e
 d20:	00000000 	nop
 d24:	09ac0000 	j	6b00000 <_data-0x79500000>
 d28:	09b48800 	j	6d22000 <_data-0x792de000>
 d2c:	00068800 	sll	s1,a2,0x0
 d30:	300c049e 	andi	t4,zero,0x49e
 d34:	0000bfd0 	0xbfd0
 d38:	00000000 	nop
 d3c:	09b40000 	j	6d00000 <_data-0x79300000>
 d40:	09bc8800 	j	6f22000 <_data-0x790de000>
 d44:	00038800 	sll	s1,v1,0x0
 d48:	009f3608 	0x9f3608
 d4c:	00000000 	nop
 d50:	b4000000 	0xb4000000
 d54:	bc880009 	cache	0x8,9(a0)
 d58:	06880009 	tgei	s4,9
 d5c:	00049e00 	sll	s3,a0,0x18
 d60:	00bfd030 	tge	a1,ra,0x340
 d64:	00000000 	nop
 d68:	c4000000 	lwc1	$f0,0(zero)
 d6c:	c8880009 	lwc2	$8,9(a0)
 d70:	02880009 	0x2880009
 d74:	009f3300 	0x9f3300
 d78:	00000000 	nop
 d7c:	c4000000 	lwc1	$f0,0(zero)
 d80:	c8880009 	lwc2	$8,9(a0)
 d84:	06880009 	tgei	s4,9
 d88:	0c049e00 	jal	127800 <_data-0x7fed8800>
 d8c:	00bfd030 	tge	a1,ra,0x340
 d90:	00000000 	nop
 d94:	bc000000 	cache	0x0,0(zero)
 d98:	c4880009 	lwc1	$f8,9(a0)
 d9c:	02880009 	0x2880009
 da0:	009f3000 	0x9f3000
 da4:	00000000 	nop
 da8:	bc000000 	cache	0x0,0(zero)
 dac:	c4880009 	lwc1	$f8,9(a0)
 db0:	06880009 	tgei	s4,9
 db4:	04049e00 	0x4049e00
 db8:	00bfd030 	tge	a1,ra,0x340
 dbc:	00000000 	nop
 dc0:	c8000000 	lwc2	$0,0(zero)
 dc4:	cc880009 	pref	0x8,9(a0)
 dc8:	02880009 	0x2880009
 dcc:	009f3000 	0x9f3000
 dd0:	00000000 	nop
 dd4:	c8000000 	lwc2	$0,0(zero)
 dd8:	cc880009 	pref	0x8,9(a0)
 ddc:	06880009 	tgei	s4,9
 de0:	10049e00 	beq	zero,a0,fffe85e4 <_text_end+0x77fe76cc>
 de4:	00bfd030 	tge	a1,ra,0x340
 de8:	00000000 	nop
 dec:	cc000000 	pref	0x0,0(zero)
 df0:	d0880009 	0xd0880009
 df4:	02880009 	0x2880009
 df8:	009f3000 	0x9f3000
 dfc:	00000000 	nop
 e00:	cc000000 	pref	0x0,0(zero)
 e04:	d0880009 	0xd0880009
 e08:	06880009 	tgei	s4,9
 e0c:	04049e00 	0x4049e00
 e10:	00bfd030 	tge	a1,ra,0x340
	...
 e20:	01000000 	0x1000000
 e24:	00005500 	sll	t2,zero,0x14
	...
 e34:	00010000 	sll	zero,at,0x0
 e38:	00000054 	0x54
	...
 e48:	54000100 	bnezl	zero,124c <_data-0x7fffedb4>
 e4c:	00000000 	nop
	...
 e5c:	00540001 	movf	zero,v0,$fcc5
	...
 e6c:	01000000 	0x1000000
 e70:	00005500 	sll	t2,zero,0x14
	...
 e80:	00010000 	sll	zero,at,0x0
 e84:	00000054 	0x54
	...
 e94:	55000100 	bnezl	t0,1298 <_data-0x7fffed68>
 e98:	00000000 	nop
	...
 ea8:	00540001 	movf	zero,v0,$fcc5
	...
 eb8:	01000000 	0x1000000
 ebc:	00005500 	sll	t2,zero,0x14
	...
 ecc:	00010000 	sll	zero,at,0x0
 ed0:	00000054 	0x54
 ed4:	00000000 	nop
	...

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
  14:	000000f8 	0xf8
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  20:	0000001c 	0x1c
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	015e0002 	0x15e0002
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
  44:	01840002 	0x1840002
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	88000348 	lwl	zero,840(zero)
  54:	000000c8 	0xc8
  58:	00000000 	nop
  5c:	0000000c 	syscall
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	00000000 	nop
  64:	0000000c 	syscall
  68:	88000410 	lwl	zero,1040(zero)
  6c:	00000098 	0x98
  70:	880004a8 	lwl	zero,1192(zero)
  74:	00000068 	0x68
  78:	88000510 	lwl	zero,1296(zero)
  7c:	000000b4 	teq	zero,zero,0x2
	...
  88:	0000001c 	0x1c
  8c:	06f40002 	0x6f40002
  90:	00040000 	sll	zero,a0,0x0
  94:	00000000 	nop
  98:	880005c4 	lwl	zero,1476(zero)
  9c:	00000224 	0x224
	...
  a8:	0000001c 	0x1c
  ac:	08ba0002 	j	2e80008 <_data-0x7d17fff8>
  b0:	00040000 	sll	zero,a0,0x0
  b4:	00000000 	nop
  b8:	880007e8 	lwl	zero,2024(zero)
  bc:	000000d8 	0xd8
	...
  c8:	0000007c 	0x7c
  cc:	0a080002 	j	8200008 <_data-0x77dffff8>
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
 118:	880008c0 	lwl	zero,2240(zero)
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
 14c:	0e220002 	jal	8880008 <_data-0x7777fff8>
 150:	00040000 	sll	zero,a0,0x0
 154:	00000000 	nop
 158:	880008e4 	lwl	zero,2276(zero)
 15c:	00000060 	0x60
 160:	88000944 	lwl	zero,2372(zero)
 164:	00000030 	tge	zero,zero
	...
 170:	0000001c 	0x1c
 174:	0f720002 	jal	dc80008 <_data-0x7237fff8>
 178:	00040000 	sll	zero,a0,0x0
 17c:	00000000 	nop
 180:	88000974 	lwl	zero,2420(zero)
 184:	0000002c 	0x2c
	...
 190:	0000008c 	syscall	0x2
 194:	10280002 	beq	at,t0,1a0 <_data-0x7ffffe60>
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
 1e0:	880009a0 	lwl	zero,2464(zero)
 1e4:	00000038 	0x38
 1e8:	00000000 	nop
 1ec:	00000020 	add	zero,zero,zero
 1f0:	880009d8 	lwl	zero,2520(zero)
 1f4:	00000020 	add	zero,zero,zero
 1f8:	00000000 	nop
 1fc:	00000048 	0x48
 200:	880009f8 	lwl	zero,2552(zero)
 204:	00000014 	0x14
 208:	88000a0c 	lwl	zero,2572(zero)
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
   4:	88000278 	lwl	zero,632(zero)
   8:	8800027c 	lwl	zero,636(zero)
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	88000280 	lwl	zero,640(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	88000288 	lwl	zero,648(zero)
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	88000290 	lwl	zero,656(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	88000298 	lwl	zero,664(zero)
  1c:	8800032c 	lwl	zero,812(zero)
	...
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  28:	88000250 	lwl	zero,592(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	88000348 	lwl	zero,840(zero)
	...
  38:	88000418 	lwl	zero,1048(zero)
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	8800041c 	lwl	zero,1052(zero)
  40:	88000438 	lwl	zero,1080(zero)
  44:	88000460 	lwl	zero,1120(zero)
	...
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	880004b0 	lwl	zero,1200(zero)
  54:	880004b4 	lwl	zero,1204(zero)
  58:	880004c4 	lwl	zero,1220(zero)
  5c:	880004fc 	lwl	zero,1276(zero)
	...
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  68:	880004b0 	lwl	zero,1200(zero)
  6c:	880004b4 	lwl	zero,1204(zero)
  70:	880004c4 	lwl	zero,1220(zero)
  74:	880004c8 	lwl	zero,1224(zero)
  78:	880004cc 	lwl	zero,1228(zero)
  7c:	880004f4 	lwl	zero,1268(zero)
	...
  88:	88000348 	lwl	zero,840(zero)
  8c:	88000410 	lwl	zero,1040(zero)
  90:	00000001 	movf	zero,zero,$fcc0
  94:	00000001 	movf	zero,zero,$fcc0
  98:	00000001 	movf	zero,zero,$fcc0
  9c:	00000001 	movf	zero,zero,$fcc0
  a0:	88000410 	lwl	zero,1040(zero)
  a4:	880004a8 	lwl	zero,1192(zero)
  a8:	880004a8 	lwl	zero,1192(zero)
  ac:	88000510 	lwl	zero,1296(zero)
  b0:	88000510 	lwl	zero,1296(zero)
  b4:	880005c4 	lwl	zero,1476(zero)
	...
  c0:	880005fc 	lwl	zero,1532(zero)
  c4:	88000600 	lwl	zero,1536(zero)
  c8:	88000684 	lwl	zero,1668(zero)
  cc:	88000694 	lwl	zero,1684(zero)
  d0:	880007d0 	lwl	zero,2000(zero)
  d4:	880007e0 	lwl	zero,2016(zero)
	...
  e0:	88000680 	lwl	zero,1664(zero)
  e4:	88000684 	lwl	zero,1668(zero)
  e8:	880006ac 	lwl	zero,1708(zero)
  ec:	880006b4 	lwl	zero,1716(zero)
  f0:	88000708 	lwl	zero,1800(zero)
  f4:	88000718 	lwl	zero,1816(zero)
  f8:	88000724 	lwl	zero,1828(zero)
  fc:	88000734 	lwl	zero,1844(zero)
 100:	8800073c 	lwl	zero,1852(zero)
 104:	88000778 	lwl	zero,1912(zero)
 108:	88000780 	lwl	zero,1920(zero)
 10c:	88000784 	lwl	zero,1924(zero)
 110:	8800078c 	lwl	zero,1932(zero)
 114:	88000794 	lwl	zero,1940(zero)
 118:	8800079c 	lwl	zero,1948(zero)
 11c:	880007a0 	lwl	zero,1952(zero)
 120:	880007a4 	lwl	zero,1956(zero)
 124:	880007c8 	lwl	zero,1992(zero)
	...
 130:	880005c4 	lwl	zero,1476(zero)
 134:	880007e8 	lwl	zero,2024(zero)
	...
 140:	880007e8 	lwl	zero,2024(zero)
 144:	880008c0 	lwl	zero,2240(zero)
	...
 150:	00000001 	movf	zero,zero,$fcc0
 154:	00000001 	movf	zero,zero,$fcc0
 158:	00000001 	movf	zero,zero,$fcc0
 15c:	00000001 	movf	zero,zero,$fcc0
 160:	00000001 	movf	zero,zero,$fcc0
 164:	00000001 	movf	zero,zero,$fcc0
 168:	00000001 	movf	zero,zero,$fcc0
 16c:	00000001 	movf	zero,zero,$fcc0
 170:	00000001 	movf	zero,zero,$fcc0
 174:	00000001 	movf	zero,zero,$fcc0
 178:	00000001 	movf	zero,zero,$fcc0
 17c:	00000001 	movf	zero,zero,$fcc0
 180:	00000001 	movf	zero,zero,$fcc0
 184:	00000001 	movf	zero,zero,$fcc0
 188:	00000001 	movf	zero,zero,$fcc0
 18c:	00000001 	movf	zero,zero,$fcc0
 190:	880008c0 	lwl	zero,2240(zero)
 194:	880008e4 	lwl	zero,2276(zero)
 198:	00000001 	movf	zero,zero,$fcc0
 19c:	00000001 	movf	zero,zero,$fcc0
 1a0:	00000001 	movf	zero,zero,$fcc0
 1a4:	00000001 	movf	zero,zero,$fcc0
 1a8:	00000001 	movf	zero,zero,$fcc0
 1ac:	00000001 	movf	zero,zero,$fcc0
 1b0:	00000001 	movf	zero,zero,$fcc0
 1b4:	00000001 	movf	zero,zero,$fcc0
	...
 1c0:	880008fc 	lwl	zero,2300(zero)
 1c4:	88000900 	lwl	zero,2304(zero)
 1c8:	88000924 	lwl	zero,2340(zero)
 1cc:	8800093c 	lwl	zero,2364(zero)
	...
 1d8:	880008e4 	lwl	zero,2276(zero)
 1dc:	88000944 	lwl	zero,2372(zero)
 1e0:	88000944 	lwl	zero,2372(zero)
 1e4:	88000974 	lwl	zero,2420(zero)
	...
 1f0:	88000974 	lwl	zero,2420(zero)
 1f4:	880009a0 	lwl	zero,2464(zero)
	...
 200:	880009bc 	lwl	zero,2492(zero)
 204:	880009c0 	lwl	zero,2496(zero)
 208:	880009c4 	lwl	zero,2500(zero)
 20c:	880009c8 	lwl	zero,2504(zero)
	...
 218:	00000001 	movf	zero,zero,$fcc0
 21c:	00000001 	movf	zero,zero,$fcc0
 220:	00000001 	movf	zero,zero,$fcc0
 224:	00000001 	movf	zero,zero,$fcc0
 228:	00000001 	movf	zero,zero,$fcc0
 22c:	00000001 	movf	zero,zero,$fcc0
 230:	00000001 	movf	zero,zero,$fcc0
 234:	00000001 	movf	zero,zero,$fcc0
 238:	00000001 	movf	zero,zero,$fcc0
 23c:	00000001 	movf	zero,zero,$fcc0
 240:	00000001 	movf	zero,zero,$fcc0
 244:	00000001 	movf	zero,zero,$fcc0
 248:	00000001 	movf	zero,zero,$fcc0
 24c:	00000001 	movf	zero,zero,$fcc0
 250:	00000001 	movf	zero,zero,$fcc0
 254:	00000001 	movf	zero,zero,$fcc0
 258:	880009a0 	lwl	zero,2464(zero)
 25c:	880009d8 	lwl	zero,2520(zero)
 260:	00000001 	movf	zero,zero,$fcc0
 264:	00000001 	movf	zero,zero,$fcc0
 268:	880009d8 	lwl	zero,2520(zero)
 26c:	880009f8 	lwl	zero,2552(zero)
 270:	00000001 	movf	zero,zero,$fcc0
 274:	00000001 	movf	zero,zero,$fcc0
 278:	880009f8 	lwl	zero,2552(zero)
 27c:	88000a0c 	lwl	zero,2572(zero)
 280:	88000a0c 	lwl	zero,2572(zero)
 284:	88000a20 	lwl	zero,2592(zero)
 288:	00000001 	movf	zero,zero,$fcc0
 28c:	00000001 	movf	zero,zero,$fcc0
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	00000080 	sll	zero,zero,0x2
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	00250002 	ror	zero,a1,0x0
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
  18:	00010000 	sll	zero,at,0x0
  1c:	646e616d 	0x646e616d
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	72626c65 	0x72626c65
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	632e746f 	0x632e746f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	00007070 	tge	zero,zero,0x1c1
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	00000000 	nop
  30:	02500205 	0x2500205
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	03158800 	0x3158800
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	03810111 	0x3810111
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	0374080f 	0x374080f
  40:	0350826c 	0x350826c
  44:	16034a6f 	bne	s0,v1,12a04 <_data-0x7ffed5fc>
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	4a0e0382 	c2	0xe0382
  4c:	484a6903 	0x484a6903
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	503b0850 	beql	at,k1,2194 <_data-0x7fffde6c>
  54:	844a7a03 	lh	t2,31235(v0)
  58:	820c0380 	lb	t4,896(s0)
  5c:	4c838183 	0x4c838183
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	02040200 	0x2040200
  64:	74087703 	jalx	21dc0c <_data-0x7fde23f4>
  68:	02040200 	0x2040200
  6c:	00ba0e03 	0xba0e03
  70:	03020402 	0x3020402
  74:	00e40869 	0xe40869
  78:	b8020402 	swr	v0,1026(zero)
  7c:	02821e03 	0x2821e03
  80:	01010008 	0x1010008
  84:	0000008e 	0x8e
  88:	00280002 	ror	zero,t0,0x0
  8c:	01010000 	0x1010000
  90:	000d0efb 	0xd0efb
  94:	01010101 	0x1010101
  98:	01000000 	0x1000000
  9c:	75010000 	jalx	4040000 <_data-0x7bfc0000>
  a0:	696c6974 	0x696c6974
  a4:	00007974 	teq	zero,zero,0x1e5
  a8:	72617473 	0x72617473
  ac:	2e707574 	sltiu	s0,s3,30068
  b0:	00010053 	0x10053
  b4:	05000000 	bltz	t0,b8 <_data-0x7fffff48>
  b8:	00000002 	srl	zero,zero,0x0
  bc:	4b831988 	c2	0x1831988
  c0:	4b4e4b4f 	c2	0x14e4b4f
  c4:	4b85834d 	c2	0x185834d
  c8:	4c4d4b4d 	0x4c4d4b4d
  cc:	4d834b83 	0x4d834b83
  d0:	4b4b4b4b 	c2	0x14b4b4b
  d4:	4b4b834d 	c2	0x14b834d
  d8:	0212034b 	0x212034b
  dc:	4c0101fc 	0x4c0101fc
  e0:	4b4d834b 	c2	0x14d834b
  e4:	4b4b4b4b 	c2	0x14b4b4b
  e8:	4b4b4b4b 	c2	0x14b4b4b
  ec:	4b4b4b4b 	c2	0x14b4b4b
  f0:	4b4b4b4b 	c2	0x14b4b4b
  f4:	4b4b4b4b 	c2	0x14b4b4b
  f8:	4b4b4b4b 	c2	0x14b4b4b
  fc:	4b4b4b4b 	c2	0x14b4b4b
 100:	4b4b4c4b 	c2	0x14b4c4b
 104:	4b4b4b4b 	c2	0x14b4b4b
 108:	4c4b4b4b 	0x4c4b4b4b
 10c:	4b4b4c4b 	c2	0x14b4c4b
 110:	0004024b 	0x4024b
 114:	01590101 	0x1590101
 118:	00020000 	sll	zero,v0,0x0
 11c:	00000087 	0x87
 120:	0efb0101 	jal	bec0404 <_data-0x7413fbfc>
 124:	0101000d 	break	0x101
 128:	00000101 	0x101
 12c:	00000100 	sll	zero,zero,0x4
 130:	69747501 	0x69747501
 134:	7974696c 	0x7974696c
 138:	636e6900 	0x636e6900
 13c:	6564756c 	0x6564756c
 140:	616d0000 	0x616d0000
 144:	632e6e69 	0x632e6e69
 148:	00000100 	sll	zero,zero,0x4
 14c:	6d6d6f63 	0x6d6d6f63
 150:	682e6e6f 	0x682e6e6f
 154:	00000200 	sll	zero,zero,0x8
 158:	69647473 	0x69647473
 15c:	682e746e 	0x682e746e
 160:	00000200 	sll	zero,zero,0x8
 164:	6863616d 	0x6863616d
 168:	2e656e69 	sltiu	a1,s3,28265
 16c:	00020068 	0x20068
 170:	63786500 	0x63786500
 174:	69747065 	0x69747065
 178:	682e6e6f 	0x682e6e6f
 17c:	00000200 	sll	zero,zero,0x8
 180:	69647473 	0x69647473
 184:	00682e6f 	0x682e6f
 188:	73000002 	mul	zero,t8,zero
 18c:	6e697274 	0x6e697274
 190:	00682e67 	0x682e67
 194:	62000002 	0x62000002
 198:	73746f6f 	0x73746f6f
 19c:	70617274 	0x70617274
 1a0:	0200682e 	0x200682e
 1a4:	00000000 	nop
 1a8:	03480205 	0x3480205
 1ac:	0a038800 	j	80e2000 <_data-0x77f1e000>
 1b0:	8484bc01 	lh	a0,-17407(a0)
 1b4:	454f45c1 	0x454f45c1
 1b8:	4787454f 	c1	0x187454f
 1bc:	f5f38386 	sdc1	$f19,-31866(t7)
 1c0:	c1838385 	ll	v1,-31867(t4)
 1c4:	02bfb7b8 	0x2bfb7b8
 1c8:	01010008 	0x1010008
 1cc:	00020500 	sll	zero,v0,0x14
 1d0:	03000000 	0x3000000
 1d4:	4f14012b 	c3	0x114012b
 1d8:	01000802 	0x1000802
 1dc:	02050001 	movt	zero,s0,$fcc1
 1e0:	00000000 	nop
 1e4:	14013403 	bne	zero,at,d1f4 <_data-0x7fff2e0c>
 1e8:	0008024f 	0x8024f
 1ec:	05000101 	bltz	t0,5f4 <_data-0x7ffffa0c>
 1f0:	00041002 	srl	v0,a0,0x0
 1f4:	013d0388 	0x13d0388
 1f8:	3c084884 	lui	t0,0x4884
 1fc:	00494b83 	0x494b83
 200:	4b030402 	c2	0x1030402
 204:	03040200 	0x3040200
 208:	02853b08 	0x2853b08
 20c:	20021328 	addi	v0,zero,4904
 210:	00010100 	sll	zero,at,0x4
 214:	04a80205 	tgei	a1,517
 218:	c4038800 	lwc1	$f3,-30720(zero)
 21c:	0c030100 	jal	c0400 <_data-0x7ff3fc00>
 220:	4a740382 	c2	0x740382
 224:	4a0c03ba 	c2	0xc03ba
 228:	004a7503 	0x4a7503
 22c:	4c030402 	0x4c030402
 230:	03040200 	0x3040200
 234:	3c080903 	lui	t0,0x903
 238:	03040200 	0x3040200
 23c:	3c087503 	lui	t0,0x7503
 240:	02820d03 	0x2820d03
 244:	01010014 	0x1010014
 248:	10020500 	beq	zero,v0,164c <_data-0x7fffe9b4>
 24c:	03880005 	0x3880005
 250:	bb0100d4 	swr	at,212(t8)
 254:	4b494b49 	c2	0x1494b49
 258:	c1bb8383 	ll	k1,-31869(t5)
 25c:	03b98483 	0x3b98483
 260:	2403f255 	li	v1,-3499
 264:	5103844a 	beql	t0,v1,fffe1390 <_text_end+0x77fe0478>
 268:	2f037408 	sltiu	v1,t8,29704
 26c:	1002bb4a 	beq	zero,v0,fffeef98 <_text_end+0x77fee080>
 270:	aa010100 	swl	at,256(s0)
 274:	02000000 	0x2000000
 278:	00001f00 	sll	v1,zero,0x1c
 27c:	fb010100 	sdc2	$1,256(t8)
 280:	01000d0e 	0x1000d0e
 284:	00010101 	0x10101
 288:	00010000 	sll	zero,at,0x0
 28c:	70000100 	0x70000100
 290:	746e6972 	jalx	1b9a5c8 <_data-0x7e465a38>
 294:	00632e66 	0x632e66
 298:	00000000 	nop
 29c:	c4020500 	lwc1	$f2,1280(zero)
 2a0:	13880005 	beq	gp,t0,2b8 <_data-0x7ffffd48>
 2a4:	4a7a0388 	c2	0x7a0388
 2a8:	4cf83c08 	0x4cf83c08
 2ac:	4a00c503 	c2	0xc503
 2b0:	01040200 	0x1040200
 2b4:	4a7fbb03 	c2	0x7fbb03
 2b8:	f200cb03 	0xf200cb03
 2bc:	027fb803 	0x27fb803
 2c0:	03860124 	0x3860124
 2c4:	01440238 	0x1440238
 2c8:	f2400352 	0xf2400352
 2cc:	03837c08 	0x3837c08
 2d0:	1c038277 	0x1c038277
 2d4:	03012802 	0x3012802
 2d8:	af088264 	sw	t0,-32156(t8)
 2dc:	02004b88 	0x2004b88
 2e0:	6f030204 	0x6f030204
 2e4:	ba14034a 	swr	s4,842(s0)
 2e8:	03821403 	0x3821403
 2ec:	09038268 	j	40e09a0 <_data-0x7bf1f660>
 2f0:	82150382 	lb	s5,898(s0)
 2f4:	826d03bd 	lb	t5,957(s3)
 2f8:	c0894cf3 	ll	t1,19699(a0)
 2fc:	825e03bf 	lb	s8,959(s2)
 300:	00822603 	0x822603
 304:	03010402 	0x3010402
 308:	02004a4e 	0x2004a4e
 30c:	34030104 	li	v1,0x104
 310:	0402004a 	bltzl	zero,43c <_data-0x7ffffbc4>
 314:	03ad0803 	0x3ad0803
 318:	8383f20b 	lb	v1,-3573(gp)
 31c:	01000802 	0x1000802
 320:	00007601 	0x7601
 324:	22000200 	addi	zero,s0,512
 328:	01000000 	0x1000000
 32c:	0d0efb01 	jal	43bec04 <_data-0x7bc413fc>
 330:	01010100 	0x1010100
 334:	00000001 	movf	zero,zero,$fcc0
 338:	01000001 	movf	zero,t0,$fcc0
 33c:	69727000 	0x69727000
 340:	6162746e 	0x6162746e
 344:	632e6573 	0x632e6573
 348:	00000000 	nop
 34c:	02050000 	0x2050000
 350:	880007e8 	lwl	zero,2024(zero)
 354:	4fac0813 	c3	0x1ac0813
 358:	01040200 	0x1040200
 35c:	84068206 	lh	a2,-32250(zero)
 360:	0402004b 	bltzl	zero,490 <_data-0x7ffffb70>
 364:	ba780301 	swr	t8,769(s3)
 368:	01040200 	0x1040200
 36c:	8a4a0c03 	lwl	t2,3075(s2)
 370:	02040200 	0x2040200
 374:	8806ba06 	lwl	a2,-17914(zero)
 378:	24027003 	li	v0,28675
 37c:	04020001 	bltzl	zero,384 <_data-0x7ffffc7c>
 380:	8ab00803 	lwl	s0,2051(s5)
 384:	01040200 	0x1040200
 388:	02008206 	0x2008206
 38c:	83060104 	lb	a2,260(t8)
 390:	04040200 	0x4040200
 394:	1002f206 	beq	zero,v0,ffffcbb0 <_text_end+0x77ffbc98>
 398:	79010100 	0x79010100
 39c:	02000001 	movf	zero,s0,$fcc0
 3a0:	00003600 	sll	a2,zero,0x18
 3a4:	fb010100 	sdc2	$1,256(t8)
 3a8:	01000d0e 	0x1000d0e
 3ac:	00010101 	0x10101
 3b0:	00010000 	sll	zero,at,0x0
 3b4:	2e2e0100 	sltiu	t6,s1,256
 3b8:	636e692f 	0x636e692f
 3bc:	6564756c 	0x6564756c
 3c0:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 3c4:	676e6972 	0x676e6972
 3c8:	0000632e 	0x632e
 3cc:	6f630000 	0x6f630000
 3d0:	6e6f6d6d 	0x6e6f6d6d
 3d4:	0100682e 	0x100682e
 3d8:	00000000 	nop
 3dc:	00000205 	0x205
 3e0:	0b030000 	j	c0c0000 <_data-0x73f40000>
 3e4:	78081401 	0x78081401
 3e8:	01000802 	0x1000802
 3ec:	02050001 	movt	zero,s0,$fcc1
 3f0:	00000000 	nop
 3f4:	13012103 	beq	t8,at,8804 <_data-0x7fff77fc>
 3f8:	0402004b 	bltzl	zero,528 <_data-0x7ffffad8>
 3fc:	06820601 	bltzl	s4,1c04 <_data-0x7fffe3fc>
 400:	08027fbe 	j	9fef8 <_data-0x7ff60108>
 404:	00010100 	sll	zero,at,0x4
 408:	00000205 	0x205
 40c:	36030000 	ori	v1,s0,0x0
 410:	004e0101 	0x4e0101
 414:	4b010402 	c2	0x1010402
 418:	08024008 	j	90020 <_data-0x7ff6ffe0>
 41c:	00010100 	sll	zero,at,0x4
 420:	00000205 	0x205
 424:	cc030000 	pref	0x3,0(zero)
 428:	83010100 	lb	at,256(t8)
 42c:	7a03894b 	0x7a03894b
 430:	024cbb82 	0x24cbb82
 434:	01010008 	0x1010008
 438:	00020500 	sll	zero,v0,0x14
 43c:	03000000 	0x3000000
 440:	160100e7 	bne	s0,at,7e0 <_data-0x7ffff820>
 444:	01040200 	0x1040200
 448:	bd06ba06 	cache	0x6,-17914(t0)
 44c:	08027e84 	j	9fa10 <_data-0x7ff605f0>
 450:	00010100 	sll	zero,at,0x4
 454:	00000205 	0x205
 458:	fe030000 	sdc3	$3,0(s0)
 45c:	004b0100 	0x4b0100
 460:	06010402 	bgez	s0,146c <_data-0x7fffeb94>
 464:	04020082 	bltzl	zero,670 <_data-0x7ffff990>
 468:	bd06ba02 	cache	0x6,-17918(t0)
 46c:	02847f83 	0x2847f83
 470:	01010008 	0x1010008
 474:	00020500 	sll	zero,v0,0x14
 478:	03000000 	0x3000000
 47c:	1301018e 	beq	t8,at,ab8 <_data-0x7ffff548>
 480:	7a034bf8 	0x7a034bf8
 484:	08028582 	j	a1608 <_data-0x7ff5e9f8>
 488:	00010100 	sll	zero,at,0x4
 48c:	00000205 	0x205
 490:	a2030000 	sb	v1,0(s0)
 494:	f9130101 	sdc2	$19,257(t0)
 498:	85827a03 	lh	v0,31235(t4)
 49c:	01000802 	0x1000802
 4a0:	02050001 	movt	zero,s0,$fcc1
 4a4:	880008c0 	lwl	zero,2240(zero)
 4a8:	01029003 	0x1029003
 4ac:	874b8601 	lh	t3,-31231(k0)
 4b0:	0008027e 	0x8027e
 4b4:	05000101 	bltz	t0,8bc <_data-0x7ffff744>
 4b8:	00000002 	srl	zero,zero,0x0
 4bc:	02ab0300 	0x2ab0300
 4c0:	4b870101 	c2	0x1870101
 4c4:	10027e87 	beq	zero,v0,1fee4 <_data-0x7ffe011c>
 4c8:	00010100 	sll	zero,at,0x4
 4cc:	00000205 	0x205
 4d0:	c2030000 	ll	v1,0(s0)
 4d4:	03180102 	0x3180102
 4d8:	84504a7a 	lh	s0,19066(v0)
 4dc:	0200884e 	0x200884e
 4e0:	74030104 	jalx	c0410 <_data-0x7ff3fbf0>
 4e4:	0883f382 	j	20fce08 <_data-0x7df031f8>
 4e8:	1002f63d 	beq	zero,v0,ffffdde0 <_text_end+0x77ffcec8>
 4ec:	00010100 	sll	zero,at,0x4
 4f0:	00000205 	0x205
 4f4:	e5030000 	swc1	$f3,0(t0)
 4f8:	894d0102 	lwl	t5,258(t2)
 4fc:	08827a03 	j	209e80c <_data-0x7df617f4>
 500:	0802f43d 	j	bd0f4 <_data-0x7ff42f0c>
 504:	00010100 	sll	zero,at,0x4
 508:	00000205 	0x205
 50c:	f1030000 	0xf1030000
 510:	02130102 	0x2130102
 514:	0101000c 	syscall	0x40400
 518:	0000004f 	sync	0x1
 51c:	001d0002 	srl	zero,sp,0x0
 520:	01010000 	0x1010000
 524:	000d0efb 	0xd0efb
 528:	01010101 	0x1010101
 52c:	01000000 	0x1000000
 530:	00010000 	sll	zero,at,0x0
 534:	73747570 	0x73747570
 538:	0000632e 	0x632e
 53c:	00000000 	nop
 540:	08e40205 	j	3900814 <_data-0x7c6ff7ec>
 544:	08138800 	j	4e2000 <_data-0x7fb1e000>
 548:	c2484e3c 	ll	t0,20028(s2)
 54c:	74087a03 	jalx	21e80c <_data-0x7fde17f4>
 550:	02838383 	0x2838383
 554:	01010008 	0x1010008
 558:	44020500 	0x44020500
 55c:	03880009 	0x3880009
 560:	8383010e 	lb	v1,270(gp)
 564:	10028483 	beq	zero,v0,fffe1774 <_text_end+0x77fe085c>
 568:	59010100 	0x59010100
 56c:	02000000 	0x2000000
 570:	00004400 	sll	t0,zero,0x10
 574:	fb010100 	sdc2	$1,256(t8)
 578:	01000d0e 	0x1000d0e
 57c:	00010101 	0x10101
 580:	00010000 	sll	zero,at,0x0
 584:	2e2e0100 	sltiu	t6,s1,256
 588:	636e692f 	0x636e692f
 58c:	6564756c 	0x6564756c
 590:	75700000 	jalx	5c00000 <_data-0x7a400000>
 594:	61686374 	0x61686374
 598:	00632e72 	tlt	v1,v1,0xb9
 59c:	73000000 	madd	t8,zero
 5a0:	6e696474 	0x6e696474
 5a4:	00682e74 	teq	v1,t0,0xb9
 5a8:	6d000001 	0x6d000001
 5ac:	69686361 	0x69686361
 5b0:	682e656e 	0x682e656e
 5b4:	00000100 	sll	zero,zero,0x4
 5b8:	02050000 	0x2050000
 5bc:	88000974 	lwl	zero,2420(zero)
 5c0:	0284f315 	0x284f315
 5c4:	01010014 	0x1010014
 5c8:	000001a9 	0x1a9
 5cc:	00520002 	0x520002
 5d0:	01010000 	0x1010000
 5d4:	000d0efb 	0xd0efb
 5d8:	01010101 	0x1010101
 5dc:	01000000 	0x1000000
 5e0:	2e010000 	sltiu	at,s0,0
 5e4:	6e692f2e 	0x6e692f2e
 5e8:	64756c63 	0x64756c63
 5ec:	6d000065 	0x6d000065
 5f0:	69686361 	0x69686361
 5f4:	632e656e 	0x632e656e
 5f8:	00007070 	tge	zero,zero,0x1c1
 5fc:	6f630000 	0x6f630000
 600:	6e6f6d6d 	0x6e6f6d6d
 604:	0100682e 	0x100682e
 608:	74730000 	jalx	1cc0000 <_data-0x7e340000>
 60c:	746e6964 	jalx	1b9a590 <_data-0x7e465a70>
 610:	0100682e 	0x100682e
 614:	616d0000 	0x616d0000
 618:	6e696863 	0x6e696863
 61c:	00682e65 	0x682e65
 620:	00000001 	movf	zero,zero,$fcc0
 624:	00020500 	sll	zero,v0,0x14
 628:	03000000 	0x3000000
 62c:	6a03011b 	0x6a03011b
 630:	4a160301 	c2	0x160301
 634:	01000802 	0x1000802
 638:	02050001 	movt	zero,s0,$fcc1
 63c:	00000000 	nop
 640:	03011b03 	0x3011b03
 644:	1603016a 	bne	s0,v1,bf0 <_data-0x7ffff410>
 648:	0008024a 	0x8024a
 64c:	05000101 	bltz	t0,a54 <_data-0x7ffff5ac>
 650:	00000002 	srl	zero,zero,0x0
 654:	011b0300 	0x11b0300
 658:	03016a03 	0x3016a03
 65c:	08024a16 	j	92858 <_data-0x7ff6d7a8>
 660:	00010100 	sll	zero,at,0x4
 664:	00000205 	0x205
 668:	1b030000 	0x1b030000
 66c:	016a0301 	0x16a0301
 670:	024a1603 	0x24a1603
 674:	01010008 	0x1010008
 678:	00020500 	sll	zero,v0,0x14
 67c:	03000000 	0x3000000
 680:	6f03011c 	0x6f03011c
 684:	4a110301 	c2	0x110301
 688:	01000802 	0x1000802
 68c:	02050001 	movt	zero,s0,$fcc1
 690:	00000000 	nop
 694:	03011c03 	0x3011c03
 698:	1103016f 	beq	t0,v1,c58 <_data-0x7ffff3a8>
 69c:	0008024a 	0x8024a
 6a0:	05000101 	bltz	t0,aa8 <_data-0x7ffff558>
 6a4:	00000002 	srl	zero,zero,0x0
 6a8:	011c0300 	0x11c0300
 6ac:	03016f03 	0x3016f03
 6b0:	08024a11 	j	92844 <_data-0x7ff6d7bc>
 6b4:	00010100 	sll	zero,at,0x4
 6b8:	00000205 	0x205
 6bc:	1c030000 	0x1c030000
 6c0:	016f0301 	0x16f0301
 6c4:	024a1103 	0x24a1103
 6c8:	01010008 	0x1010008
 6cc:	a0020500 	sb	v0,1280(zero)
 6d0:	03880009 	0x3880009
 6d4:	6d03011e 	0x6d03011e
 6d8:	02210301 	0x2210301
 6dc:	08020130 	j	804c0 <_data-0x7ff7fb40>
 6e0:	00010100 	sll	zero,at,0x4
 6e4:	00000205 	0x205
 6e8:	2e030000 	sltiu	v1,s0,0
 6ec:	01570301 	0x1570301
 6f0:	03822a03 	0x3822a03
 6f4:	2c03ba56 	sltiu	v1,zero,-17834
 6f8:	0008024a 	0x8024a
 6fc:	05000101 	bltz	t0,b04 <_data-0x7ffff4fc>
 700:	0009d802 	srl	k1,t1,0x0
 704:	01330388 	0x1330388
 708:	03015203 	0x3015203
 70c:	5703822f 	bnel	t8,v1,fffe0fcc <_text_end+0x77fe00b4>
 710:	4a2b03ba 	c2	0x2b03ba
 714:	01000802 	0x1000802
 718:	02050001 	movt	zero,s0,$fcc1
 71c:	00000000 	nop
 720:	84013803 	lh	at,14339(zero)
 724:	4bb98383 	c2	0x1b98383
 728:	4c48844b 	0x4c48844b
 72c:	01000c02 	0x1000c02
 730:	02050001 	movt	zero,s0,$fcc1
 734:	880009f8 	lwl	zero,2552(zero)
 738:	0100c103 	0x100c103
 73c:	03014a03 	0x3014a03
 740:	0802ba38 	j	ae8e0 <_data-0x7ff51720>
 744:	00010100 	sll	zero,at,0x4
 748:	0a0c0205 	j	8300814 <_data-0x77cff7ec>
 74c:	c5038800 	lwc1	$f3,-30720(t0)
 750:	46030100 	add.s	$f4,$f0,$f3
 754:	ba3c0301 	swr	gp,769(s1)
 758:	01000802 	0x1000802
 75c:	02050001 	movt	zero,s0,$fcc1
 760:	00000000 	nop
 764:	0100c903 	0x100c903
 768:	017fbc03 	0x17fbc03
 76c:	ba00c603 	swr	zero,-14845(s0)
 770:	01000802 	0x1000802
 774:	Address 0x0000000000000774 is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
_get_cause():
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:55
    asm(
   0:	5277656e 	beql	s3,s7,195bc <_data-0x7ffe6a44>
/mnt/c/Users/FactorialN/downloads/wow/cod19grp1/Router-Rebuild/TrivialMIPS_Software/cpp/utility/main.c:60
}
   4:	616d0065 	0x616d0065
   8:	6c65646e 	0x6c65646e
read_switches():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:59
	word |= read_serial();
   c:	746f7262 	jalx	1bdc988 <_data-0x7e423678>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  10:	7070632e 	0x7070632e
read_serial():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
  14:	646c6f00 	0x646c6f00
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  18:	2f006d49 	sltiu	zero,t8,27977
  1c:	2f746e6d 	sltiu	s4,k1,28269
read_serial_word():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
  20:	73552f63 	0x73552f63
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:60
	word |= read_serial() << 8;
  24:	2f737265 	sltiu	s3,k1,29285
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:61
	word |= read_serial() << 16;
  28:	74636146 	jalx	18d8518 <_data-0x7e727ae8>
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  2c:	6169726f 	0x6169726f
  30:	642f4e6c 	0x642f4e6c
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  34:	6c6e776f 	0x6c6e776f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:62
	word |= read_serial() << 24;
  38:	7364616f 	0x7364616f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/machine.cpp:64
}
  3c:	776f772f 	jalx	dbddcbc <_data-0x72422344>
  40:	646f632f 	0x646f632f
  44:	72673931 	0x72673931
memmove():
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:331
        while (n -- > 0) {
  48:	522f3170 	beql	s1,t7,c60c <_data-0x7fff39f4>
  4c:	6574756f 	0x6574756f
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:332
            *-- d = *-- s;
  50:	65522d72 	0x65522d72
  54:	6c697562 	0x6c697562
  58:	72542f64 	0x72542f64
  5c:	61697669 	0x61697669
/mnt/c/Users/FactorialN/downloads/TrivialMIPS_Software/cpp/lib/string.c:336
            *d ++ = *s ++;
  60:	50494d6c 	beql	v0,t1,13614 <_data-0x7ffec9ec>
  64:	6f535f53 	0x6f535f53
  68:	61777466 	0x61777466
  6c:	632f6572 	0x632f6572
  70:	6d007070 	0x6d007070
  74:	5865766f 	0x5865766f
  78:	77656e00 	jalx	d95b800 <_data-0x726a4800>
  7c:	6c006d49 	0x6c006d49
  80:	20676e6f 	addi	a3,v1,28271
  84:	69736e75 	0x69736e75
  88:	64656e67 	0x64656e67
  8c:	746e6920 	jalx	1b9a480 <_data-0x7e465b80>
  90:	6c6f6300 	0x6c6f6300
  94:	6600726f 	0x6600726f
  98:	74616f6c 	jalx	185bdb0 <_data-0x7e7a4250>
  9c:	6f6f7a00 	0x6f6f7a00
  a0:	6f6d006d 	0x6f6d006d
  a4:	00596576 	tne	v0,t9,0x195
  a8:	746e655f 	jalx	1b9957c <_data-0x7e466a84>
  ac:	6d007972 	0x6d007972
  b0:	74497861 	jalx	125e184 <_data-0x7eda1e7c>
  b4:	74617265 	jalx	185c994 <_data-0x7e7a366c>
  b8:	736e6f69 	0x736e6f69
  bc:	554e4700 	bnel	t2,t6,11cc0 <_data-0x7ffee340>
  c0:	2b2b4320 	slti	t3,t9,17184
  c4:	37203131 	ori	zero,t9,0x3131
  c8:	302e342e 	andi	t6,at,0x342e
  cc:	656d2d20 	0x656d2d20
  d0:	6d2d206c 	0x6d2d206c
  d4:	676e6973 	0x676e6973
  d8:	662d656c 	0x662d656c
  dc:	74616f6c 	jalx	185bdb0 <_data-0x7e7a4250>
  e0:	786d2d20 	0x786d2d20
  e4:	20746f67 	addi	s4,v1,28519
  e8:	6f6e6d2d 	0x6f6e6d2d
  ec:	6962612d 	0x6962612d
  f0:	6c6c6163 	0x6c6c6163
  f4:	6d2d2073 	0x6d2d2073
  f8:	64726168 	0x64726168
  fc:	6f6c662d 	0x6f6c662d
 100:	2d207461 	sltiu	zero,t1,29793
 104:	7370696d 	0x7370696d
 108:	2d203233 	sltiu	zero,t1,12851
 10c:	736c6c6d 	0x736c6c6d
 110:	6d2d2063 	0x6d2d2063
 114:	6c2d6f6e 	0x6c2d6f6e
 118:	2d316378 	sltiu	s1,t1,25464
 11c:	31637873 	andi	v1,t3,0x7873
 120:	6e6d2d20 	0x6e6d2d20
 124:	616d2d6f 	0x616d2d6f
 128:	20346464 	addi	s4,at,25700
 12c:	6f6e6d2d 	0x6f6e6d2d
 130:	6168732d 	0x6168732d
 134:	20646572 	addi	a0,v1,25970
 138:	62616d2d 	0x62616d2d
 13c:	32333d69 	andi	s3,s1,0x3d69
 140:	20672d20 	addi	a3,v1,11552
 144:	20734f2d 	addi	s3,v1,20269
 148:	6474732d 	0x6474732d
 14c:	2b2b633d 	slti	t3,t9,25405
 150:	2d203131 	sltiu	zero,t1,12593
 154:	6e756666 	0x6e756666
 158:	6f697463 	0x6f697463
 15c:	65732d6e 	0x65732d6e
 160:	6f697463 	0x6f697463
 164:	2d20736e 	sltiu	zero,t1,29550
 168:	74616466 	jalx	1859198 <_data-0x7e7a6e68>
 16c:	65732d61 	0x65732d61
 170:	6f697463 	0x6f697463
 174:	2d20736e 	sltiu	zero,t1,29550
 178:	65726666 	0x65726666
 17c:	61747365 	0x61747365
 180:	6e69646e 	0x6e69646e
 184:	662d2067 	0x662d2067
 188:	622d6f6e 	0x622d6f6e
 18c:	746c6975 	jalx	1b1a5d4 <_data-0x7e4e5a2c>
 190:	2d206e69 	sltiu	zero,t1,28265
 194:	2d6f6e66 	sltiu	t7,t3,28262
 198:	00454950 	0x454950
 19c:	52646c6f 	beql	s3,a0,1b35c <_data-0x7ffe4ca4>
 1a0:	6d670065 	0x6d670065
 1a4:	75006d65 	jalx	401b594 <_data-0x7bfe4a6c>
 1a8:	696c6974 	0x696c6974
 1ac:	732f7974 	0x732f7974
 1b0:	74726174 	jalx	1c985d0 <_data-0x7e367a30>
 1b4:	532e7075 	beql	t9,t6,1c38c <_data-0x7ffe3c74>
 1b8:	6e6d2f00 	0x6e6d2f00
 1bc:	2f632f74 	sltiu	v1,k1,12148
 1c0:	72657355 	0x72657355
 1c4:	61462f73 	0x61462f73
 1c8:	726f7463 	0x726f7463
 1cc:	4e6c6169 	c3	0x6c6169
 1d0:	776f642f 	jalx	dbd90bc <_data-0x72426f44>
 1d4:	616f6c6e 	0x616f6c6e
 1d8:	542f7364 	bnel	at,t7,1cf6c <_data-0x7ffe3094>
 1dc:	69766972 	0x69766972
 1e0:	494d6c61 	0x494d6c61
 1e4:	535f5350 	beql	k0,ra,14f28 <_data-0x7ffeb0d8>
 1e8:	7774666f 	jalx	dd199bc <_data-0x722e6644>
 1ec:	2f657261 	sltiu	a1,k1,29281
 1f0:	00707063 	0x707063
 1f4:	20554e47 	addi	s5,v0,20039
 1f8:	32205341 	andi	zero,s1,0x5341
 1fc:	0030332e 	0x30332e
 200:	5f307063 	0x5f307063
 204:	76646162 	jalx	9918588 <_data-0x766e7a78>
 208:	72646461 	0x72646461
 20c:	43584500 	c0	0x1584500
 210:	49545045 	0x49545045
 214:	4d5f4e4f 	0x4d5f4e4f
 218:	41535345 	0x41535345
 21c:	00534547 	0x534547
 220:	5f307063 	0x5f307063
 224:	73756163 	0x73756163
 228:	72700065 	0x72700065
 22c:	5f746e69 	0x5f746e69
 230:	00626c74 	teq	v1,v0,0x1b1
 234:	6f6f425f 	0x6f6f425f
 238:	7063006c 	0x7063006c
 23c:	70655f30 	0x70655f30
 240:	6d5f0063 	0x6d5f0063
 244:	006e6961 	0x6e6961
 248:	7465675f 	jalx	1959d7c <_data-0x7e6a6284>
 24c:	7561635f 	jalx	5858d7c <_data-0x7a7a7284>
 250:	5f006573 	bgtzl	t8,19820 <_data-0x7ffe67e0>
 254:	00737362 	0x737362
 258:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 25c:	656c5f65 	0x656c5f65
 260:	79620064 	0x79620064
 264:	745f6574 	jalx	17d95d0 <_data-0x7e826a30>
 268:	65675f00 	0x65675f00
 26c:	70655f74 	0x70655f74
 270:	6e750063 	0x6e750063
 274:	6e676973 	0x6e676973
 278:	63206465 	0x63206465
 27c:	00726168 	0x726168
 280:	726f6873 	0x726f6873
 284:	6e752074 	0x6e752074
 288:	6e676973 	0x6e676973
 28c:	69206465 	0x69206465
 290:	6900746e 	0x6900746e
 294:	5f74696e 	0x5f74696e
 298:	69726573 	0x69726573
 29c:	5f006c61 	bgtzl	t8,1b424 <_data-0x7ffe4bdc>
 2a0:	5f737362 	0x5f737362
 2a4:	00646e65 	0x646e65
 2a8:	736d656d 	0x736d656d
 2ac:	70007465 	0x70007465
 2b0:	746e6972 	jalx	1b9a5c8 <_data-0x7e465a38>
 2b4:	6172745f 	0x6172745f
 2b8:	61726670 	0x61726670
 2bc:	6300656d 	0x6300656d
 2c0:	735f3070 	0x735f3070
 2c4:	75746174 	jalx	5d185d0 <_data-0x7a2e7a30>
 2c8:	6f630073 	0x6f630073
 2cc:	65006564 	0x65006564
 2d0:	7972746e 	0x7972746e
 2d4:	5f6f6c5f 	0x5f6f6c5f
 2d8:	655f0031 	0x655f0031
 2dc:	70656378 	0x70656378
 2e0:	6e6f6974 	0x6e6f6974
 2e4:	6e61685f 	0x6e61685f
 2e8:	72656c64 	0x72656c64
 2ec:	64617000 	0x64617000
 2f0:	676e6964 	0x676e6964
 2f4:	6e697500 	0x6e697500
 2f8:	745f3874 	jalx	17ce1d0 <_data-0x7e831e30>
 2fc:	746e6500 	jalx	1b99400 <_data-0x7e466c00>
 300:	6c5f7972 	0x6c5f7972
 304:	00325f6f 	0x325f6f
 308:	20554e47 	addi	s5,v0,20039
 30c:	20313143 	addi	s1,at,12611
 310:	2e342e37 	sltiu	s4,s1,11831
 314:	6d2d2030 	0x6d2d2030
 318:	2d206c65 	sltiu	zero,t1,27749
 31c:	6e69736d 	0x6e69736d
 320:	2d656c67 	sltiu	a1,t3,27751
 324:	616f6c66 	0x616f6c66
 328:	6d2d2074 	0x6d2d2074
 32c:	746f6778 	jalx	1bd9de0 <_data-0x7e426220>
 330:	6e6d2d20 	0x6e6d2d20
 334:	62612d6f 	0x62612d6f
 338:	6c616369 	0x6c616369
 33c:	2d20736c 	sltiu	zero,t1,29548
 340:	7261686d 	0x7261686d
 344:	6c662d64 	0x6c662d64
 348:	2074616f 	addi	s4,v1,24943
 34c:	70696d2d 	0x70696d2d
 350:	20323373 	addi	s2,at,13171
 354:	6c6c6d2d 	0x6c6c6d2d
 358:	2d206373 	sltiu	zero,t1,25459
 35c:	2d6f6e6d 	sltiu	t7,t3,28269
 360:	3163786c 	andi	v1,t3,0x786c
 364:	6378732d 	0x6378732d
 368:	6d2d2031 	0x6d2d2031
 36c:	6d2d6f6e 	0x6d2d6f6e
 370:	34646461 	ori	a0,v1,0x6461
 374:	6e6d2d20 	0x6e6d2d20
 378:	68732d6f 	0x68732d6f
 37c:	64657261 	0x64657261
 380:	616d2d20 	0x616d2d20
 384:	333d6962 	andi	sp,t9,0x6962
 388:	672d2032 	0x672d2032
 38c:	734f2d20 	0x734f2d20
 390:	66662d20 	0x66662d20
 394:	74636e75 	jalx	18db9d4 <_data-0x7e72462c>
 398:	2d6e6f69 	sltiu	t6,t3,28521
 39c:	74636573 	jalx	18d95cc <_data-0x7e726a34>
 3a0:	736e6f69 	0x736e6f69
 3a4:	64662d20 	0x64662d20
 3a8:	2d617461 	sltiu	at,t3,29793
 3ac:	74636573 	jalx	18d95cc <_data-0x7e726a34>
 3b0:	736e6f69 	0x736e6f69
 3b4:	66662d20 	0x66662d20
 3b8:	73656572 	0x73656572
 3bc:	646e6174 	0x646e6174
 3c0:	20676e69 	addi	a3,v1,28265
 3c4:	6f6e662d 	0x6f6e662d
 3c8:	6975622d 	0x6975622d
 3cc:	6e69746c 	0x6e69746c
 3d0:	6e662d20 	0x6e662d20
 3d4:	49502d6f 	0x49502d6f
 3d8:	73620045 	0x73620045
 3dc:	69735f73 	0x69735f73
 3e0:	7700657a 	jalx	c0195e8 <_data-0x73fe6a18>
 3e4:	65746972 	0x65746972
 3e8:	6765735f 	0x6765735f
 3ec:	746e656d 	jalx	1b995b4 <_data-0x7e466a4c>
 3f0:	69727000 	0x69727000
 3f4:	0066746e 	0x66746e
 3f8:	726f6873 	0x726f6873
 3fc:	6e692074 	0x6e692074
 400:	70630074 	0x70630074
 404:	62655f30 	0x62655f30
 408:	00657361 	0x657361
 40c:	746e6975 	jalx	1b9a5d4 <_data-0x7e465a2c>
 410:	745f3631 	jalx	17cd8c4 <_data-0x7e83273c>
 414:	6e697500 	0x6e697500
 418:	5f323374 	0x5f323374
 41c:	6f6c0074 	0x6f6c0074
 420:	6920676e 	0x6920676e
 424:	6500746e 	0x6500746e
 428:	7972746e 	0x7972746e
 42c:	0069685f 	0x69685f
 430:	73747570 	0x73747570
 434:	69747500 	0x69747500
 438:	7974696c 	0x7974696c
 43c:	69616d2f 	0x69616d2f
 440:	00632e6e 	0x632e6e
 444:	75736572 	jalx	5cd95c8 <_data-0x7a326a38>
 448:	6100746c 	0x6100746c
 44c:	72657373 	0x72657373
 450:	6e6f6974 	0x6e6f6974
 454:	61727400 	0x61727400
 458:	61726670 	0x61726670
 45c:	745f656d 	jalx	17d95b4 <_data-0x7e826a4c>
 460:	74757000 	jalx	1d5c000 <_data-0x7e2a4000>
 464:	72616863 	0x72616863
 468:	69727000 	0x69727000
 46c:	6162746e 	0x6162746e
 470:	70006573 	0x70006573
 474:	746e6972 	jalx	1b9a5c8 <_data-0x7e465a38>
 478:	00632e66 	0x632e66
 47c:	69616761 	0x69616761
 480:	6d2f006e 	0x6d2f006e
 484:	632f746e 	0x632f746e
 488:	6573552f 	0x6573552f
 48c:	462f7372 	c1	0x2f7372
 490:	6f746361 	0x6f746361
 494:	6c616972 	0x6c616972
 498:	6f642f4e 	0x6f642f4e
 49c:	6f6c6e77 	0x6f6c6e77
 4a0:	2f736461 	sltiu	s3,k1,25697
 4a4:	76697254 	jalx	9a5c950 <_data-0x765a36b0>
 4a8:	4d6c6169 	0x4d6c6169
 4ac:	5f535049 	0x5f535049
 4b0:	74666f53 	jalx	199bd4c <_data-0x7e6642b4>
 4b4:	65726177 	0x65726177
 4b8:	7070632f 	0x7070632f
 4bc:	62696c2f 	0x62696c2f
 4c0:	74757000 	jalx	1d5c000 <_data-0x7e2a4000>
 4c4:	69727473 	0x69727473
 4c8:	7600676e 	jalx	8019db8 <_data-0x77fe6248>
 4cc:	65756c61 	0x65756c61
 4d0:	69727000 	0x69727000
 4d4:	6162746e 	0x6162746e
 4d8:	632e6573 	0x632e6573
 4dc:	67697300 	0x67697300
 4e0:	656d006e 	0x656d006e
 4e4:	766f6d6d 	jalx	9bdb5b4 <_data-0x76424a4c>
 4e8:	7a620065 	0x7a620065
 4ec:	006f7265 	0x6f7265
 4f0:	69727473 	0x69727473
 4f4:	632e676e 	0x632e676e
 4f8:	7a697300 	0x7a697300
 4fc:	00745f65 	0x745f65
 500:	636d656d 	0x636d656d
 504:	7300706d 	0x7300706d
 508:	636e7274 	0x636e7274
 50c:	73007970 	0x73007970
 510:	6c6e7274 	0x6c6e7274
 514:	73006e65 	0x73006e65
 518:	68637274 	0x68637274
 51c:	74730072 	jalx	1cc01c8 <_data-0x7e33fe38>
 520:	79706372 	0x79706372
 524:	72747300 	0x72747300
 528:	00706d63 	0x706d63
 52c:	636d656d 	0x636d656d
 530:	73007970 	0x73007970
 534:	656c7274 	0x656c7274
 538:	7473006e 	jalx	1cc01b8 <_data-0x7e33fe48>
 53c:	6d636e72 	0x6d636e72
 540:	74730070 	jalx	1cc01c0 <_data-0x7e33fe40>
 544:	6e696672 	0x6e696672
 548:	75700064 	jalx	5c00190 <_data-0x7a3ffe70>
 54c:	632e7374 	0x632e7374
 550:	69727700 	0x69727700
 554:	735f6574 	0x735f6574
 558:	61697265 	0x61697265
 55c:	7570006c 	jalx	5c001b0 <_data-0x7a3ffe50>
 560:	61686374 	0x61686374
 564:	00632e72 	tlt	v1,v1,0xb9
 568:	74697277 	jalx	1a5c9dc <_data-0x7e5a3624>
 56c:	77685f65 	jalx	da17d94 <_data-0x725e826c>
 570:	0064726f 	0x64726f
 574:	77355a5f 	jalx	cd5697c <_data-0x732a9684>
 578:	65746972 	0x65746972
 57c:	76456a49 	jalx	915a924 <_data-0x76ea56dc>
 580:	5f547650 	0x5f547650
 584:	61657200 	0x61657200
 588:	77735f64 	jalx	dcd7d90 <_data-0x72328270>
 58c:	68637469 	0x68637469
 590:	77007365 	jalx	c01cd94 <_data-0x73fe326c>
 594:	65746972 	0x65746972
 598:	726f775f 	0x726f775f
 59c:	61640064 	0x61640064
 5a0:	77006174 	jalx	c0185d0 <_data-0x73fe7a30>
 5a4:	65746972 	0x65746972
 5a8:	7479625f 	jalx	1e5897c <_data-0x7e1a7684>
 5ac:	5a5f0065 	0x5a5f0065
 5b0:	61657234 	0x61657234
 5b4:	456d4964 	0x456d4964
 5b8:	76505f54 	jalx	9417d50 <_data-0x76be82b0>
 5bc:	6e697500 	0x6e697500
 5c0:	5f343674 	0x5f343674
 5c4:	72770074 	0x72770074
 5c8:	3c657469 	0x3c657469
 5cc:	69736e75 	0x69736e75
 5d0:	64656e67 	0x64656e67
 5d4:	61686320 	0x61686320
 5d8:	72003e72 	0x72003e72
 5dc:	5f646165 	0x5f646165
 5e0:	726f7768 	0x726f7768
 5e4:	5a5f0064 	0x5a5f0064
 5e8:	69727735 	0x69727735
 5ec:	6d496574 	0x6d496574
 5f0:	76507645 	jalx	941d914 <_data-0x76be26ec>
 5f4:	5f005f54 	bgtzl	t8,18348 <_data-0x7ffe7cb8>
 5f8:	6572345a 	0x6572345a
 5fc:	74496461 	jalx	1259184 <_data-0x7eda6e7c>
 600:	505f5445 	beql	v0,ra,15718 <_data-0x7ffea8e8>
 604:	72770076 	0x72770076
 608:	3c657469 	0x3c657469
 60c:	676e6f6c 	0x676e6f6c
 610:	736e7520 	0x736e7520
 614:	656e6769 	0x656e6769
 618:	6e692064 	0x6e692064
 61c:	77003e74 	jalx	c00f9d0 <_data-0x73ff0630>
 620:	65746972 	0x65746972
 624:	6f77645f 	0x6f77645f
 628:	72006472 	0x72006472
 62c:	3c646165 	0x3c646165
 630:	676e6f6c 	0x676e6f6c
 634:	736e7520 	0x736e7520
 638:	656e6769 	0x656e6769
 63c:	6e692064 	0x6e692064
 640:	72003e74 	0x72003e74
 644:	5f646165 	0x5f646165
 648:	69726573 	0x69726573
 64c:	775f6c61 	jalx	d7db184 <_data-0x72824e7c>
 650:	0064726f 	0x64726f
 654:	726f7764 	0x726f7764
 658:	00745f64 	0x745f64
 65c:	72345a5f 	0x72345a5f
 660:	49646165 	0x49646165
 664:	5f544568 	0x5f544568
 668:	77007650 	jalx	c01d940 <_data-0x73fe26c0>
 66c:	65746972 	0x65746972
 670:	6f68733c 	0x6f68733c
 674:	75207472 	jalx	481d1c8 <_data-0x7b7e2e38>
 678:	6769736e 	0x6769736e
 67c:	2064656e 	addi	a0,v1,25966
 680:	3e746e69 	0x3e746e69
 684:	61657200 	0x61657200
 688:	6e753c64 	0x6e753c64
 68c:	6e676973 	0x6e676973
 690:	63206465 	0x63206465
 694:	3e726168 	0x3e726168
 698:	63616d00 	0x63616d00
 69c:	656e6968 	0x656e6968
 6a0:	7070632e 	0x7070632e
 6a4:	61657200 	0x61657200
 6a8:	77645f64 	jalx	d917d90 <_data-0x726e8270>
 6ac:	0064726f 	0x64726f
 6b0:	77355a5f 	jalx	cd5697c <_data-0x732a9684>
 6b4:	65746972 	0x65746972
 6b8:	76456849 	jalx	915a124 <_data-0x76ea5edc>
 6bc:	5f547650 	0x5f547650
 6c0:	61657200 	0x61657200
 6c4:	6e753c64 	0x6e753c64
 6c8:	6e676973 	0x6e676973
 6cc:	69206465 	0x69206465
 6d0:	003e746e 	0x3e746e
 6d4:	77355a5f 	jalx	cd5697c <_data-0x732a9684>
 6d8:	65746972 	0x65746972
 6dc:	76457449 	jalx	915d124 <_data-0x76ea2edc>
 6e0:	5f547650 	0x5f547650
 6e4:	345a5f00 	ori	k0,v0,0x5f00
 6e8:	64616572 	0x64616572
 6ec:	54456a49 	bnel	v0,a1,1b014 <_data-0x7ffe4fec>
 6f0:	0076505f 	0x76505f
 6f4:	64616572 	0x64616572
 6f8:	7265735f 	0x7265735f
 6fc:	006c6169 	0x6c6169
 700:	64616572 	0x64616572
 704:	726f775f 	0x726f775f
 708:	65720064 	0x65720064
 70c:	733c6461 	0x733c6461
 710:	74726f68 	jalx	1c9bda0 <_data-0x7e364260>
 714:	736e7520 	0x736e7520
 718:	656e6769 	0x656e6769
 71c:	6e692064 	0x6e692064
 720:	68003e74 	0x68003e74
 724:	64726f77 	0x64726f77
 728:	7200745f 	0x7200745f
 72c:	5f646165 	0x5f646165
 730:	65747962 	0x65747962
 734:	69727700 	0x69727700
 738:	753c6574 	jalx	4f195d0 <_data-0x7b0e6a30>
 73c:	6769736e 	0x6769736e
 740:	2064656e 	addi	a0,v1,25966
 744:	3e746e69 	0x3e746e69
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
  18:	88000348 	lwl	zero,840(zero)
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
  5c:	88000410 	lwl	zero,1040(zero)
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
  88:	880004a8 	lwl	zero,1192(zero)
  8c:	00000068 	0x68
  90:	44280e44 	0x44280e44
  94:	92500391 	lbu	s0,913(s2)
  98:	9f049002 	0x9f049002
  9c:	0e500201 	jal	9400804 <_data-0x76bff7fc>
  a0:	d2d1d000 	0xd2d1d000
  a4:	000000df 	0xdf
  a8:	00000024 	and	zero,zero,zero
  ac:	00000000 	nop
  b0:	88000510 	lwl	zero,1296(zero)
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
  e8:	880005c4 	lwl	zero,1476(zero)
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
 128:	880007e8 	lwl	zero,2024(zero)
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
 1e4:	880008c0 	lwl	zero,2240(zero)
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
 244:	880008e4 	lwl	zero,2276(zero)
 248:	00000060 	0x60
 24c:	50200e44 	beqzl	at,3b60 <_data-0x7fffc4a0>
 250:	03910292 	0x3910292
 254:	0490019f 	bltzal	a0,8d4 <_data-0x7ffff72c>
 258:	000e0a6c 	0xe0a6c
 25c:	dfd2d1d0 	ldc3	$18,-11824(s8)
 260:	0000000b 	movn	zero,zero,zero
 264:	00000018 	mult	zero,zero
 268:	0000022c 	0x22c
 26c:	88000944 	lwl	zero,2372(zero)
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
 298:	88000974 	lwl	zero,2420(zero)
 29c:	0000002c 	0x2c
 2a0:	44180e44 	0x44180e44
 2a4:	9f480290 	0x9f480290
 2a8:	000e5c01 	0xe5c01
 2ac:	0000dfd0 	0xdfd0
