
test_write.o:     file format elf32-tradlittlemips


Disassembly of section .text:

bfc00000 <main>:
bfc00000:	27bdffd8 	addiu	$29,$29,-40
bfc00004:	afbe0024 	sw	$30,36($29)
bfc00008:	03a0f025 	or	$30,$29,$0
bfc0000c:	3c02bc00 	lui	$2,0xbc00
bfc00010:	344201ff 	ori	$2,$2,0x1ff
bfc00014:	afc20010 	sw	$2,16($30)
bfc00018:	8fc20010 	lw	$2,16($30)
bfc0001c:	90420000 	lbu	$2,0($2)
bfc00020:	304200ff 	andi	$2,$2,0xff
bfc00024:	384200ff 	xori	$2,$2,0xff
bfc00028:	2c420001 	sltiu	$2,$2,1
bfc0002c:	304200ff 	andi	$2,$2,0xff
bfc00030:	10400003 	beqz	$2,bfc00040 <main+0x40>
bfc00034:	00000000 	sll	$0,$0,0x0
bfc00038:	1000fff7 	beqz	$0,bfc00018 <main+0x18>
bfc0003c:	00000000 	sll	$0,$0,0x0
bfc00040:	3c02bc00 	lui	$2,0xbc00
bfc00044:	344201fc 	ori	$2,$2,0x1fc
bfc00048:	afc20014 	sw	$2,20($30)
bfc0004c:	3c02bc00 	lui	$2,0xbc00
bfc00050:	344201fd 	ori	$2,$2,0x1fd
bfc00054:	afc20018 	sw	$2,24($30)
bfc00058:	3c02bc00 	lui	$2,0xbc00
bfc0005c:	344201fe 	ori	$2,$2,0x1fe
bfc00060:	afc2001c 	sw	$2,28($30)
bfc00064:	8fc20014 	lw	$2,20($30)
bfc00068:	2403002a 	addiu	$3,$0,42
bfc0006c:	a0430000 	sb	$3,0($2)
bfc00070:	8fc20018 	lw	$2,24($30)
bfc00074:	a0400000 	sb	$0,0($2)
bfc00078:	8fc2001c 	lw	$2,28($30)
bfc0007c:	a0400000 	sb	$0,0($2)
bfc00080:	3c02bc00 	lui	$2,0xbc00
bfc00084:	afc20008 	sw	$2,8($30)
bfc00088:	a3c0000c 	sb	$0,12($30)
bfc0008c:	93c2000c 	lbu	$2,12($30)
bfc00090:	2c42002a 	sltiu	$2,$2,42
bfc00094:	10400010 	beqz	$2,bfc000d8 <main+0xd8>
bfc00098:	00000000 	sll	$0,$0,0x0
bfc0009c:	93c3000c 	lbu	$3,12($30)
bfc000a0:	3c02bfc0 	lui	$2,0xbfc0
bfc000a4:	24420150 	addiu	$2,$2,336
bfc000a8:	00621021 	addu	$2,$3,$2
bfc000ac:	90430000 	lbu	$3,0($2)
bfc000b0:	8fc20008 	lw	$2,8($30)
bfc000b4:	a0430000 	sb	$3,0($2)
bfc000b8:	93c2000c 	lbu	$2,12($30)
bfc000bc:	24420001 	addiu	$2,$2,1
bfc000c0:	a3c2000c 	sb	$2,12($30)
bfc000c4:	8fc20008 	lw	$2,8($30)
bfc000c8:	24420001 	addiu	$2,$2,1
bfc000cc:	afc20008 	sw	$2,8($30)
bfc000d0:	1000ffee 	beqz	$0,bfc0008c <main+0x8c>
bfc000d4:	00000000 	sll	$0,$0,0x0
bfc000d8:	8fc20010 	lw	$2,16($30)
bfc000dc:	2403ffff 	addiu	$3,$0,-1
bfc000e0:	a0430000 	sb	$3,0($2)
bfc000e4:	1000ffcc 	beqz	$0,bfc00018 <main+0x18>
bfc000e8:	00000000 	sll	$0,$0,0x0
bfc000ec:	00000000 	sll	$0,$0,0x0

Disassembly of section .reginfo:

bfc000f0 <.reginfo>:
bfc000f0:	6000000c 	0x6000000c
	...

Disassembly of section .MIPS.abiflags:

bfc00108 <.MIPS.abiflags>:
bfc00108:	02200000 	0x2200000
bfc0010c:	05000101 	bltz	$8,bfc00514 <packet+0x3c4>
bfc00110:	00000000 	sll	$0,$0,0x0
	...

Disassembly of section .eh_frame:

bfc00120 <.eh_frame>:
bfc00120:	00000010 	mfhi	$0
bfc00124:	00000000 	sll	$0,$0,0x0
bfc00128:	00527a01 	0x527a01
bfc0012c:	011f7c01 	0x11f7c01
bfc00130:	001d0d0b 	0x1d0d0b
bfc00134:	00000018 	mult	$0,$0
bfc00138:	00000018 	mult	$0,$0
bfc0013c:	bfc00000 	cache	0x0,0($30)
bfc00140:	000000ec 	0xec
bfc00144:	280e4400 	slti	$14,$0,17408
bfc00148:	44019e44 	0x44019e44
bfc0014c:	00001e0d 	break	0x0,0x78

Disassembly of section .data:

bfc00150 <packet>:
bfc00150:	3f270080 	0x3f270080
bfc00154:	cd009f73 	pref	0x0,-24717($8)
bfc00158:	efcdabef 	swc3	$13,-21521($30)
bfc0015c:	01000080 	0x1000080
bfc00160:	19540045 	0x19540045
bfc00164:	40004061 	0x40004061
bfc00168:	0a450a01 	j	b9142804 <main-0x6abd7fc>
bfc0016c:	0a020100 	j	b8080400 <main-0x7b7fc00>
bfc00170:	08020200 	j	b0080800 <main-0xfb7f800>
bfc00174:	069dca00 	0x69dca00
bfc00178:	00070083 	sra	$0,$7,0x2
bfc0017c:	00000000 	sll	$0,$0,0x0

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00000 	cache	0x0,0($30)
   4:	40000000 	mfc0	$0,c0_index
   8:	fffffffc 	sdc3	$31,-4($31)
	...
  14:	00000028 	0x28
  18:	0000001e 	0x1e
  1c:	0000001f 	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	$3,$18,0x4347
   4:	62552820 	0x62552820
   8:	75746e75 	jalx	5d1b9d4 <main-0xb9ee462c>
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
   4:	756e6700 	jalx	5b99c00 <main-0xba066400>
   8:	00070100 	sll	$0,$7,0x4
   c:	05040000 	0x5040000
