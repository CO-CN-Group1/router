#include <stdint.h>
#include <stdio.h>


void write_serial(uint8_t data){
    auto *ptr = reinterpret_cast<volatile uint8_t *>(((void*)0xBFD003f8));
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
int printf(const char *fmt, ...)
{
	/*int i;
	char c;
	void **arg;
	void *ap;
	int w;
	__builtin_va_start(ap, fmt);
	arg = ap;
	for (i = 0; fmt[i]; i++)
	{
		c = fmt[i];
		if (c == '%')
		{
			w = 1;
		again:
			switch (fmt[i + 1])
			{
			case 's':
				putstring(*arg);
				arg++;
				i++;
				break;
			case 'c':
				putchar((long)*arg);
				arg++;
				i++;
				break;
			case 'u':
				printbase((long)*arg, w, 10, 0);
				arg++;
				i++;
				break;
			case 'd':
				printbase((long)*arg, w, 10, 1);
				arg++;
				i++;
				break;
			case 'l':
				printbase((long)*arg, w, 10, 0);
				arg++;
				i = i + 2;
				break;
			case 'o':
				printbase((long)*arg, w, 8, 0);
				arg++;
				i++;
				break;
			case 'b':
				printbase((long)*arg, w, 2, 0);
				arg++;
				i++;
				break;
			case 'p':
			case 'x':
				printbase((long)*arg, w, 16, 0);
				arg++;
				i++;
				break;
			case '%':
				putchar('%');
				i++;
				break;
			case '0':
				i++;
			case '1' ... '9':
				for (w = 0; fmt[i + 1] > '0' && fmt[i + 1] <= '9'; i++)
					w = w * 10 + (fmt[i + 1] - '0');
				goto again;
				break;

			default:
				putchar('%');
				break;
			}
		}
		else
		{
			if (c == '\n')
				putchar('\r');
			putchar(c);
		}
	}
	return 0;*/
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

        (*hastoRead) = 0;
        putchar('c');
    }
    return 0;
}