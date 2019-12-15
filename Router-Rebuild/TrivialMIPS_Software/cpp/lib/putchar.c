#include <machine.h>

int putchar(int c)
{
	write_serial((byte_t) c);
	return c;
}