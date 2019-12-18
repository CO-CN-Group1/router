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

uint8_t packet[]={
    0x80,0x00,0x27,0x3f,0x73,0x9f,0x00,0xcd,0xef,0xab,0xcd,0xef,0x80,0x00,0x00,0x01,
    0x45,0x00,0x54,0x19,0x61,0x40,0x00,0x40,0x01,0x0a,0x45,0x0a,0x00,0x01,0x02,0x0a,
    0x00,0x02,0x02,0x08,0x00,0xca,0x9d,0x06,0x83,0x00,0x07};

int main(){
    register uint8_t* hastoWrite;
    //volatile uint8_t *c,*d,*e,*f;
    putstring("loaded write\n");
    hastoWrite = (uint8_t*)0xbc0001ff;
    printbase(*hastoWrite, 8, 16, 0);
    (*hastoWrite) = 0x02;
    printbase(*hastoWrite, 8, 16, 0);
   
    while(1){
        putstring("In recursion\n");
        while((*hastoWrite)==0x00){
            //putchar('c');
        }
        putstring("Out recursion\n");
        /*c = (uint8_t*)0xbc0001fc;
        d = (uint8_t*)0xbc0001fd;
        e = (uint8_t*)0xbc0001fe;
        *c = 42;
        *d = 0;
        *e = 0;
        f = (uint8_t*)0xbc000000;
        for(uint8_t i=0;i<42;i++,f+=1)*f=packet[i];
        (*hastoWrite) = 0xff;
        putstring("has packet\n");*/
    }
    return 0;
}