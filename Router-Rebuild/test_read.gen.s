
test_read.o:     file format elf32-tradlittlemips


Disassembly of section .text:

bfc00000 <_Z12write_serialh>:
bfc00000:	27bdffe8 	addiu	$29,$29,-24
bfc00004:	afbe0014 	sw	$30,20($29)
bfc00008:	03a0f025 	or	$30,$29,$0
bfc0000c:	00801025 	or	$2,$4,$0
bfc00010:	a3c20018 	sb	$2,24($30)
bfc00014:	3c02bfd0 	lui	$2,0xbfd0
bfc00018:	344203f8 	ori	$2,$2,0x3f8
bfc0001c:	afc20008 	sw	$2,8($30)
bfc00020:	8fc20008 	lw	$2,8($30)
bfc00024:	93c30018 	lbu	$3,24($30)
bfc00028:	a0430000 	sb	$3,0($2)
bfc0002c:	00000000 	sll	$0,$0,0x0
bfc00030:	03c0e825 	or	$29,$30,$0
bfc00034:	8fbe0014 	lw	$30,20($29)
bfc00038:	27bd0018 	addiu	$29,$29,24
bfc0003c:	03e00008 	jr	$31
bfc00040:	00000000 	sll	$0,$0,0x0

bfc00044 <putchar>:
bfc00044:	27bdffe0 	addiu	$29,$29,-32
bfc00048:	afbf001c 	sw	$31,28($29)
bfc0004c:	afbe0018 	sw	$30,24($29)
bfc00050:	03a0f025 	or	$30,$29,$0
bfc00054:	afc40020 	sw	$4,32($30)
bfc00058:	8fc20020 	lw	$2,32($30)
bfc0005c:	304200ff 	andi	$2,$2,0xff
bfc00060:	00402025 	or	$4,$2,$0
bfc00064:	0ff00000 	jal	bfc00000 <_Z12write_serialh>
bfc00068:	00000000 	sll	$0,$0,0x0
bfc0006c:	8fc20020 	lw	$2,32($30)
bfc00070:	03c0e825 	or	$29,$30,$0
bfc00074:	8fbf001c 	lw	$31,28($29)
bfc00078:	8fbe0018 	lw	$30,24($29)
bfc0007c:	27bd0020 	addiu	$29,$29,32
bfc00080:	03e00008 	jr	$31
bfc00084:	00000000 	sll	$0,$0,0x0

bfc00088 <_Z9putstringPKc>:
bfc00088:	27bdffd8 	addiu	$29,$29,-40
bfc0008c:	afbf0024 	sw	$31,36($29)
bfc00090:	afbe0020 	sw	$30,32($29)
bfc00094:	03a0f025 	or	$30,$29,$0
bfc00098:	afc40028 	sw	$4,40($30)
bfc0009c:	8fc20028 	lw	$2,40($30)
bfc000a0:	90420000 	lbu	$2,0($2)
bfc000a4:	a3c20018 	sb	$2,24($30)
bfc000a8:	83c20018 	lb	$2,24($30)
bfc000ac:	0002102b 	sltu	$2,$0,$2
bfc000b0:	304200ff 	andi	$2,$2,0xff
bfc000b4:	10400011 	beqz	$2,bfc000fc <_Z9putstringPKc+0x74>
bfc000b8:	00000000 	sll	$0,$0,0x0
bfc000bc:	83c30018 	lb	$3,24($30)
bfc000c0:	2402000a 	addiu	$2,$0,10
bfc000c4:	14620004 	bne	$3,$2,bfc000d8 <_Z9putstringPKc+0x50>
bfc000c8:	00000000 	sll	$0,$0,0x0
bfc000cc:	2404000d 	addiu	$4,$0,13
bfc000d0:	0ff00011 	jal	bfc00044 <putchar>
bfc000d4:	00000000 	sll	$0,$0,0x0
bfc000d8:	83c20018 	lb	$2,24($30)
bfc000dc:	00402025 	or	$4,$2,$0
bfc000e0:	0ff00011 	jal	bfc00044 <putchar>
bfc000e4:	00000000 	sll	$0,$0,0x0
bfc000e8:	8fc20028 	lw	$2,40($30)
bfc000ec:	24420001 	addiu	$2,$2,1
bfc000f0:	afc20028 	sw	$2,40($30)
bfc000f4:	1000ffe9 	beqz	$0,bfc0009c <_Z9putstringPKc+0x14>
bfc000f8:	00000000 	sll	$0,$0,0x0
bfc000fc:	00001025 	or	$2,$0,$0
bfc00100:	03c0e825 	or	$29,$30,$0
bfc00104:	8fbf0024 	lw	$31,36($29)
bfc00108:	8fbe0020 	lw	$30,32($29)
bfc0010c:	27bd0028 	addiu	$29,$29,40
bfc00110:	03e00008 	jr	$31
bfc00114:	00000000 	sll	$0,$0,0x0

bfc00118 <_Z9printbaseliii>:
bfc00118:	27bdff90 	addiu	$29,$29,-112
bfc0011c:	afbf006c 	sw	$31,108($29)
bfc00120:	afbe0068 	sw	$30,104($29)
bfc00124:	03a0f025 	or	$30,$29,$0
bfc00128:	afc40070 	sw	$4,112($30)
bfc0012c:	afc50074 	sw	$5,116($30)
bfc00130:	afc60078 	sw	$6,120($30)
bfc00134:	afc7007c 	sw	$7,124($30)
bfc00138:	8fc2007c 	lw	$2,124($30)
bfc0013c:	1040000c 	beqz	$2,bfc00170 <_Z9printbaseliii+0x58>
bfc00140:	00000000 	sll	$0,$0,0x0
bfc00144:	8fc20070 	lw	$2,112($30)
bfc00148:	04410009 	bgez	$2,bfc00170 <_Z9printbaseliii+0x58>
bfc0014c:	00000000 	sll	$0,$0,0x0
bfc00150:	8fc20070 	lw	$2,112($30)
bfc00154:	00021023 	negu	$2,$2
bfc00158:	afc2001c 	sw	$2,28($30)
bfc0015c:	2404002d 	addiu	$4,$0,45
bfc00160:	0ff00011 	jal	bfc00044 <putchar>
bfc00164:	00000000 	sll	$0,$0,0x0
bfc00168:	10000003 	beqz	$0,bfc00178 <_Z9printbaseliii+0x60>
bfc0016c:	00000000 	sll	$0,$0,0x0
bfc00170:	8fc20070 	lw	$2,112($30)
bfc00174:	afc2001c 	sw	$2,28($30)
bfc00178:	afc00024 	sw	$0,36($30)
bfc0017c:	8fc2001c 	lw	$2,28($30)
bfc00180:	10400018 	beqz	$2,bfc001e4 <_Z9printbaseliii+0xcc>
bfc00184:	00000000 	sll	$0,$0,0x0
bfc00188:	8fc20078 	lw	$2,120($30)
bfc0018c:	8fc3001c 	lw	$3,28($30)
bfc00190:	004001f4 	teq	$2,$0,0x7
bfc00194:	0062001b 	divu	$0,$3,$2
bfc00198:	00001010 	mfhi	$2
bfc0019c:	00401825 	or	$3,$2,$0
bfc001a0:	8fc20024 	lw	$2,36($30)
bfc001a4:	7c031c20 	seb	$3,$3
bfc001a8:	27c40018 	addiu	$4,$30,24
bfc001ac:	00821021 	addu	$2,$4,$2
bfc001b0:	a0430010 	sb	$3,16($2)
bfc001b4:	8fc20078 	lw	$2,120($30)
bfc001b8:	8fc3001c 	lw	$3,28($30)
bfc001bc:	004001f4 	teq	$2,$0,0x7
bfc001c0:	0062001b 	divu	$0,$3,$2
bfc001c4:	00001010 	mfhi	$2
bfc001c8:	00001012 	mflo	$2
bfc001cc:	afc2001c 	sw	$2,28($30)
bfc001d0:	8fc20024 	lw	$2,36($30)
bfc001d4:	24420001 	addiu	$2,$2,1
bfc001d8:	afc20024 	sw	$2,36($30)
bfc001dc:	1000ffe7 	beqz	$0,bfc0017c <_Z9printbaseliii+0x64>
bfc001e0:	00000000 	sll	$0,$0,0x0
bfc001e4:	8fc30074 	lw	$3,116($30)
bfc001e8:	8fc20024 	lw	$2,36($30)
bfc001ec:	0043102a 	slt	$2,$2,$3
bfc001f0:	10400004 	beqz	$2,bfc00204 <_Z9printbaseliii+0xec>
bfc001f4:	00000000 	sll	$0,$0,0x0
bfc001f8:	8fc20074 	lw	$2,116($30)
bfc001fc:	10000002 	beqz	$0,bfc00208 <_Z9printbaseliii+0xf0>
bfc00200:	00000000 	sll	$0,$0,0x0
bfc00204:	8fc20024 	lw	$2,36($30)
bfc00208:	afc20018 	sw	$2,24($30)
bfc0020c:	8fc20018 	lw	$2,24($30)
bfc00210:	18400021 	blez	$2,bfc00298 <_Z9printbaseliii+0x180>
bfc00214:	00000000 	sll	$0,$0,0x0
bfc00218:	8fc20024 	lw	$2,36($30)
bfc0021c:	8fc30018 	lw	$3,24($30)
bfc00220:	0043102a 	slt	$2,$2,$3
bfc00224:	14400008 	bnez	$2,bfc00248 <_Z9printbaseliii+0x130>
bfc00228:	00000000 	sll	$0,$0,0x0
bfc0022c:	8fc20018 	lw	$2,24($30)
bfc00230:	2442ffff 	addiu	$2,$2,-1
bfc00234:	27c30018 	addiu	$3,$30,24
bfc00238:	00621021 	addu	$2,$3,$2
bfc0023c:	80420010 	lb	$2,16($2)
bfc00240:	10000002 	beqz	$0,bfc0024c <_Z9printbaseliii+0x134>
bfc00244:	00000000 	sll	$0,$0,0x0
bfc00248:	00001025 	or	$2,$0,$0
bfc0024c:	afc20020 	sw	$2,32($30)
bfc00250:	8fc20020 	lw	$2,32($30)
bfc00254:	2842000a 	slti	$2,$2,10
bfc00258:	10400005 	beqz	$2,bfc00270 <_Z9printbaseliii+0x158>
bfc0025c:	00000000 	sll	$0,$0,0x0
bfc00260:	8fc20020 	lw	$2,32($30)
bfc00264:	24420030 	addiu	$2,$2,48
bfc00268:	10000003 	beqz	$0,bfc00278 <_Z9printbaseliii+0x160>
bfc0026c:	00000000 	sll	$0,$0,0x0
bfc00270:	8fc20020 	lw	$2,32($30)
bfc00274:	24420057 	addiu	$2,$2,87
bfc00278:	00402025 	or	$4,$2,$0
bfc0027c:	0ff00011 	jal	bfc00044 <putchar>
bfc00280:	00000000 	sll	$0,$0,0x0
bfc00284:	8fc20018 	lw	$2,24($30)
bfc00288:	2442ffff 	addiu	$2,$2,-1
bfc0028c:	afc20018 	sw	$2,24($30)
bfc00290:	1000ffde 	beqz	$0,bfc0020c <_Z9printbaseliii+0xf4>
bfc00294:	00000000 	sll	$0,$0,0x0
bfc00298:	00001025 	or	$2,$0,$0
bfc0029c:	03c0e825 	or	$29,$30,$0
bfc002a0:	8fbf006c 	lw	$31,108($29)
bfc002a4:	8fbe0068 	lw	$30,104($29)
bfc002a8:	27bd0070 	addiu	$29,$29,112
bfc002ac:	03e00008 	jr	$31
bfc002b0:	00000000 	sll	$0,$0,0x0

bfc002b4 <printf>:
bfc002b4:	27bdfff8 	addiu	$29,$29,-8
bfc002b8:	afbe0004 	sw	$30,4($29)
bfc002bc:	03a0f025 	or	$30,$29,$0
bfc002c0:	afc40008 	sw	$4,8($30)
bfc002c4:	afc5000c 	sw	$5,12($30)
bfc002c8:	afc60010 	sw	$6,16($30)
bfc002cc:	afc70014 	sw	$7,20($30)
bfc002d0:	00000000 	sll	$0,$0,0x0
bfc002d4:	03c0e825 	or	$29,$30,$0
bfc002d8:	8fbe0004 	lw	$30,4($29)
bfc002dc:	27bd0008 	addiu	$29,$29,8
bfc002e0:	03e00008 	jr	$31
bfc002e4:	00000000 	sll	$0,$0,0x0

bfc002e8 <main>:
bfc002e8:	27bdffd0 	addiu	$29,$29,-48
bfc002ec:	afbf002c 	sw	$31,44($29)
bfc002f0:	afbe0028 	sw	$30,40($29)
bfc002f4:	03a0f025 	or	$30,$29,$0
bfc002f8:	3c02bb00 	lui	$2,0xbb00
bfc002fc:	344201ff 	ori	$2,$2,0x1ff
bfc00300:	afc20018 	sw	$2,24($30)
bfc00304:	8fc20018 	lw	$2,24($30)
bfc00308:	90420000 	lbu	$2,0($2)
bfc0030c:	304200ff 	andi	$2,$2,0xff
bfc00310:	2c420001 	sltiu	$2,$2,1
bfc00314:	304200ff 	andi	$2,$2,0xff
bfc00318:	10400003 	beqz	$2,bfc00328 <main+0x40>
bfc0031c:	00000000 	sll	$0,$0,0x0
bfc00320:	1000fff8 	beqz	$0,bfc00304 <main+0x1c>
bfc00324:	00000000 	sll	$0,$0,0x0
bfc00328:	3c02bb00 	lui	$2,0xbb00
bfc0032c:	344201fc 	ori	$2,$2,0x1fc
bfc00330:	afc2001c 	sw	$2,28($30)
bfc00334:	3c02bb00 	lui	$2,0xbb00
bfc00338:	344201fd 	ori	$2,$2,0x1fd
bfc0033c:	afc20020 	sw	$2,32($30)
bfc00340:	3c02bb00 	lui	$2,0xbb00
bfc00344:	344201fe 	ori	$2,$2,0x1fe
bfc00348:	afc20024 	sw	$2,36($30)
bfc0034c:	8fc20018 	lw	$2,24($30)
bfc00350:	a0400000 	sb	$0,0($2)
bfc00354:	24040063 	addiu	$4,$0,99
bfc00358:	0ff00011 	jal	bfc00044 <putchar>
bfc0035c:	00000000 	sll	$0,$0,0x0
bfc00360:	1000ffe8 	beqz	$0,bfc00304 <main+0x1c>
bfc00364:	00000000 	sll	$0,$0,0x0
	...

Disassembly of section .reginfo:

bfc00370 <.reginfo>:
bfc00370:	e00000fc 	sc	$0,252($0)
	...

Disassembly of section .MIPS.abiflags:

bfc00388 <.MIPS.abiflags>:
bfc00388:	02200000 	0x2200000
bfc0038c:	05000101 	bltz	$8,bfc00794 <main+0x4ac>
bfc00390:	00000000 	sll	$0,$0,0x0
	...

Disassembly of section .eh_frame:

bfc003a0 <.eh_frame>:
bfc003a0:	00000010 	mfhi	$0
bfc003a4:	00000000 	sll	$0,$0,0x0
bfc003a8:	00527a01 	0x527a01
bfc003ac:	011f7c01 	0x11f7c01
bfc003b0:	001d0d0b 	0x1d0d0b
bfc003b4:	00000020 	add	$0,$0,$0
bfc003b8:	00000018 	mult	$0,$0
bfc003bc:	bfc00000 	cache	0x0,0($30)
bfc003c0:	00000044 	0x44
bfc003c4:	180e4400 	0x180e4400
bfc003c8:	44019e44 	0x44019e44
bfc003cc:	0d681e0d 	jal	b5a07834 <_Z12write_serialh-0xa1f87cc>
bfc003d0:	0ede481d 	jal	bb792074 <_Z12write_serialh-0x446df8c>
bfc003d4:	00000000 	sll	$0,$0,0x0
bfc003d8:	00000020 	add	$0,$0,$0
bfc003dc:	0000003c 	0x3c
bfc003e0:	bfc00044 	cache	0x0,68($30)
bfc003e4:	00000044 	0x44
bfc003e8:	200e4400 	addi	$14,$0,17408
bfc003ec:	9e019f48 	0x9e019f48
bfc003f0:	1e0d4402 	0x1e0d4402
bfc003f4:	4c1d0d60 	madd.s	$f21,$f0,$f1,$f29
bfc003f8:	000edfde 	0xedfde
bfc003fc:	00000024 	and	$0,$0,$0
bfc00400:	00000060 	0x60
bfc00404:	bfc00088 	cache	0x0,136($30)
bfc00408:	00000090 	0x90
bfc0040c:	280e4400 	slti	$14,$0,17408
bfc00410:	9e019f48 	0x9e019f48
bfc00414:	1e0d4402 	0x1e0d4402
bfc00418:	1d0d6c02 	0x1d0d6c02
bfc0041c:	0edfde4c 	jal	bb7f7930 <_Z12write_serialh-0x44086d0>
bfc00420:	00000000 	sll	$0,$0,0x0
bfc00424:	00000024 	and	$0,$0,$0
bfc00428:	00000088 	0x88
bfc0042c:	bfc00118 	cache	0x0,280($30)
bfc00430:	0000019c 	0x19c
bfc00434:	700e4400 	0x700e4400
bfc00438:	9e019f48 	0x9e019f48
bfc0043c:	1e0d4402 	0x1e0d4402
bfc00440:	0d017803 	jal	b405e00c <_Z12write_serialh-0xbba1ff4>
bfc00444:	dfde4c1d 	ldc3	$30,19485($30)
bfc00448:	0000000e 	0xe
bfc0044c:	00000020 	add	$0,$0,$0
bfc00450:	000000b0 	tge	$0,$0,0x2
bfc00454:	bfc002b4 	cache	0x0,692($30)
bfc00458:	00000034 	teq	$0,$0
bfc0045c:	080e4400 	j	b0391000 <_Z12write_serialh-0xf86f000>
bfc00460:	44019e44 	0x44019e44
bfc00464:	0d581e0d 	jal	b5607834 <_Z12write_serialh-0xa5f87cc>
bfc00468:	0ede481d 	jal	bb792074 <_Z12write_serialh-0x446df8c>
bfc0046c:	00000000 	sll	$0,$0,0x0
bfc00470:	00000018 	mult	$0,$0
bfc00474:	000000d4 	0xd4
bfc00478:	bfc002e8 	cache	0x0,744($30)
bfc0047c:	00000080 	sll	$0,$0,0x2
bfc00480:	300e4400 	andi	$14,$0,0x4400
bfc00484:	9e019f48 	0x9e019f48
bfc00488:	1e0d4402 	0x1e0d4402

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00000 	cache	0x0,0($30)
   4:	40000000 	mfc0	$0,c0_index
   8:	fffffffc 	sdc3	$31,-4($31)
	...
  14:	00000018 	mult	$0,$0
  18:	0000001e 	0x1e
  1c:	0000001f 	0x1f
  20:	bfc00044 	cache	0x0,68($30)
  24:	c0000000 	ll	$0,0($0)
  28:	fffffffc 	sdc3	$31,-4($31)
	...
  34:	00000020 	add	$0,$0,$0
  38:	0000001e 	0x1e
  3c:	0000001f 	0x1f
  40:	bfc00088 	cache	0x0,136($30)
  44:	c0000000 	ll	$0,0($0)
  48:	fffffffc 	sdc3	$31,-4($31)
	...
  54:	00000028 	0x28
  58:	0000001e 	0x1e
  5c:	0000001f 	0x1f
  60:	bfc00118 	cache	0x0,280($30)
  64:	c0000000 	ll	$0,0($0)
  68:	fffffffc 	sdc3	$31,-4($31)
	...
  74:	00000070 	tge	$0,$0,0x1
  78:	0000001e 	0x1e
  7c:	0000001f 	0x1f
  80:	bfc002b4 	cache	0x0,692($30)
  84:	40000000 	mfc0	$0,c0_index
  88:	fffffffc 	sdc3	$31,-4($31)
	...
  94:	00000008 	jr	$0
  98:	0000001e 	0x1e
  9c:	0000001f 	0x1f
  a0:	bfc002e8 	cache	0x0,744($30)
  a4:	c0000000 	ll	$0,0($0)
  a8:	fffffffc 	sdc3	$31,-4($31)
	...
  b4:	00000030 	tge	$0,$0
  b8:	0000001e 	0x1e
  bc:	0000001f 	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	$3,$18,0x4347
   4:	62552820 	0x62552820
   8:	75746e75 	jalx	5d1b9d4 <_Z12write_serialh-0xb9ee462c>
   c:	342e3720 	ori	$14,$1,0x3720
  10:	312d302e 	andi	$13,$9,0x302e
  14:	6e756275 	0x6e756275
  18:	7e317574 	0x7e317574
  1c:	302e3831 	andi	$14,$1,0x3831
  20:	29312e34 	slti	$17,$9,11828
  24:	342e3720 	ori	$14,$1,0x3720
  28:	Address 0x0000000000000028 is out of bounds.


Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <_Z12write_serialh-0xba066400>
   8:	00070100 	sll	$0,$7,0x4
   c:	05040000 	0x5040000
