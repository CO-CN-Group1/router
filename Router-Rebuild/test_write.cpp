#include <stdint.h>
void write_serial(uint8_t data){
    while(1){
        uint8_t *pt = (uint8_t*)0xBFD003FC;
        if((*pt)&0x0001)break;
    }
    uint8_t *ptr = (uint8_t*)0xBFD003F8;
    *ptr = data;
}
int putchar(int c)
{
	write_serial((uint8_t) c);
	return c;
}
int putstring(const char *s)
{
    char c;
    while ((c = *s))
    {
        if (c == '\n')
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}
int printbase(long v,int w,int base,int sign)
{
	int i,j;
	int c;
	char buf[64];
	unsigned long value;
	if(sign && v<0)
	{
	value = -v;
	putchar('-');
	}
	else value=v;

	for(i=0;value;i++)
	{
	buf[i]=value%base;
	value=value/base;
	}
#define max(a,b) (((a)>(b))?(a):(b))

	for(j=max(w,i);j>0;j--)
	{
		c=j>i?0:buf[j-1];
		putchar((c<=9)?c+'0':c-0xa+'a');
	}
	return 0;
}

uint8_t packet[515], macpacket[20];

int main(){
    volatile uint8_t* hastoWrite;
    volatile uint8_t* hastoRead;
    volatile uint8_t *c,*d,*e,*f;
    putstring("test loopback started\n");
    hastoRead = (uint8_t*)0xbb0001ff;
    (*hastoRead) = 0x0;
    hastoWrite = (uint8_t*)0xbc0001ff;
    (*hastoWrite) = 0x0;
   
    while(1){
        putstring("waiting for a packet, hastoRead=");
        uint8_t x = *hastoRead;
        printbase(x, 1, 10, 0);
        putstring("\n");
        while(x==(uint8_t)0x0){
            x = *hastoRead;
        }
        putstring("got a packet, hastoRead=");
        x = *hastoRead;
        printbase(x, 1, 10, 0);
        putstring("\n");
        c = (uint8_t*)0xbb0001fc;
        d = (uint8_t*)0xbb0001fd;
        e = (uint8_t*)0xbb0001fe;
        uint32_t len = (*c)+(((uint32_t)*d)<<8)+(((uint32_t)*e)<<16);
        c = (uint8_t*)0xbb000000;
        for(int i = 0; i < (int)len; i++, c+=1){
            packet[i] = *c;
            printbase(packet[i], 2, 16, 0);
            putstring(" ");
        }
        putstring("\nreceived length ");
        printbase(len, 1, 10, 0);
        putchar('\n');
        *hastoRead = 0;
        int j;
        for(j = 0; j < 12; j++){
            macpacket[j] = packet[j];
        }
        printbase(j, 1, 10, 0);
        for(int i = 0; i < 6; i++){
            packet[i] = macpacket[i+6];
            packet[i+6] = macpacket[i];
        }
        putstring("\nWaiting to be able to write, hastoWrite=\n");
        x = *hastoWrite;
        printbase(x, 1, 10, 0);
        putstring("\n");
        while(x==(uint8_t)0xff){
            x = *hastoWrite;
        }
        
        c = (uint8_t*)0xbc0001fc;
        d = (uint8_t*)0xbc0001fd;
        e = (uint8_t*)0xbc0001fe;
        *c = (uint8_t)(len&0xff);
        *d = (uint8_t)((len>>8)&0xff);
        *e = (uint8_t)((len>>16)&0xff);
        f = (uint8_t*)0xbc000000;
        putstring("okay to a packet, length=");
        printbase(len, 1, 10, 0);
        putchar('\n');
        for(int i = 0;i < (int)len; i++, f+=1){
            x = packet[i];
            *f = (uint8_t)(((uint32_t)i)&0xff);
            printbase(*f, 2, 16, 0);
            putstring(" ");
        }
        printbase(*(hastoWrite-3), 2, 16, 0);
            printbase(*(hastoWrite-2), 2, 16, 0);
            printbase(*(hastoWrite-1), 2, 16, 0);
            printbase(*hastoWrite, 2, 16, 0);
            putchar('\n');
        (*hastoWrite) = 0xff;
        printbase(*(hastoWrite-3), 2, 16, 0);
            printbase(*(hastoWrite-2), 2, 16, 0);
            printbase(*(hastoWrite-1), 2, 16, 0);
            printbase(*hastoWrite, 2, 16, 0);
            putchar('\n');
        while(1){
            for(int i = 0; i<1000000;i++){}
            printbase(*(hastoWrite-3), 2, 16, 0);
            printbase(*(hastoWrite-2), 2, 16, 0);
            printbase(*(hastoWrite-1), 2, 16, 0);
            printbase(*hastoWrite, 2, 16, 0);
            putchar('\n');
        }
        putstring("\nhas sent an packet\n");
    }
    return 0;
}