#include <stdint.h>
#include <stdio.h>

int main(){
    volatile uint8_t* hastoWrite;
    volatile uint8_t *c,*d,*e;
    hastoWrite = (uint8_t*)0xbc0001ff;
    while(1){
        while((*hastoWrite)==0xff){
        }
        c = (uint8_t*)0xbc0001fc;
        d = (uint8_t*)0xbc0001fd;
        e = (uint8_t*)0xbc0001fe;
        (*hastoWrite) = 0xff;
        printf("has packet");
    }
    return 0;
}