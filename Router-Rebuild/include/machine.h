#ifndef __MACHINE_H_
#define __MACHINE_H_

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef uint8_t     byte_t;
typedef uint16_t    hword_t;
typedef uint32_t    word_t;
typedef uint64_t    dword_t;

#define TLB_COUNT               16

#define CPU_COUNT_PER_US        1000 // tentative

#define ADDR(addr)              ((void*)addr)

#define SWITCHES_ADDR           ADDR(0xBFF0F020)
#define LED_ADDR                ADDR(0xBFF0F000)
#define NUM_ADDR                ADDR(0xBFF0F010)

#define UART_DAT_ADDR           ADDR(0xBFD03000)
#define UART_FCR_ADDR           ADDR(0xBFD03008)
#define UART_LCR_ADDR           ADDR(0xBFD0300C)
#define UART_LSR_ADDR           ADDR(0xBFD03014)
#define UART_DLL_ADDR           ADDR(0xBFD03000)
#define UART_DLM_ADDR           ADDR(0xBFD03004)
#define UART_MCR_ADDR           ADDR(0xBFD03010)
#define UART_IER_ADDR           ADDR(0xBFD03004)

#define MEM_START_ADDR          ADDR(0x80000000)
#define MEM_END_ADDR            ADDR(0x807FFFFF)
#define FLASH_START_ADDR        ADDR(0xBA800000)
#define FLASH_END_ADDR          ADDR(0xBAFFFFFF)
#define OCM_START_ADDR          ADDR(0x88000000)
#define OCM_END_ADDR            ADDR(0x8800FFFF)

#define TIMER_CYCLE_ADDR		ADDR(0xBFF0E000)
#define TIMER_MICROSEC_ADDR		ADDR(0xBFF0E000)

#define UART_DATA_READY         2
#define UART_CLEAR_TO_SEND      1

#define panic()                 asm volatile("teq $zero, $zero")

byte_t read_byte(void* addr);

hword_t read_hword(void* addr);

word_t read_word(void* addr);

dword_t read_dword(void* addr);

void write_byte(void* addr, byte_t data);

void write_hword(void* addr, hword_t data);

void write_word(void* addr, word_t data);

void write_dword(void* addr, dword_t data);

void init_serial();

byte_t read_serial();

void write_serial(byte_t data);

word_t read_serial_word();

void write_led(hword_t data);

void write_segment(word_t data);

word_t read_switches();

#ifdef __cplusplus
}
#endif

#endif
