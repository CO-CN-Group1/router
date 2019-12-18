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

int main(){
    volatile uint8_t* hastoRead;
    volatile uint8_t *c,*d,*e;
    hastoRead = (uint8_t*)0xbb0001ff;
    while(1){
        while((*hastoRead)==0){
        }
        c = (uint8_t*)0xbb0001fc;
        d = (uint8_t*)0xbb0001fd;
        e = (uint8_t*)0xbb0001fe;

        *hastoRead = 0;
        putchar('c');
    }
    return 0;
}