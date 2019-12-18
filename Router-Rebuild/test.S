

WRITESERIAL:                        
#ifdef MACH_FPGA
    lui t1, %hi(0xBFD003FC)
.TESTW:
    lb t0, %lo(0xBFD003FC)(t1)      
    andi t0, t0, 0x0001            
    bne t0, zero, .WSERIAL          
    nop
    j .TESTW                        
    nop
.WSERIAL:
    lui t1, %hi(SerialData)
    sb a0, %lo(SerialData)(t1)      
    jr ra
    nop
#else
    lui t1, %hi(COM1)
    sb a0, %lo(COM1)(t1)
    jr ra
    nop
#endif