#include <stdint.h>
#include <stdio.h>
#include "trivial_mips.h"

int _entry(){
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
        printf("has packet");
    }
    return 0;
}