#include <machine.h>
#include <time.h>

void udelay(int us)
{
    unsigned start = get_us();
    unsigned end;
    do
    {
        end = get_us();
    } while (end - start < us);
}
