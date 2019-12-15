#include <stdio.h>
#include <string.h>
#include <machine.h>
#include <exception.h>

extern byte_t _bss, _bss_end;

#define DO_CONCAT(A, B) A#B
#define CONCAT(A, B) DO_CONCAT(A, B)

void _main() {

    init_serial();

    write_segment(0x04);

    puts("*****TrivialMIPS Bare Metal System*****");

    puts("Compilation time: " __TIME__ " " __DATE__);

    write_segment(0x05);

    // clear bss section if needed
    auto bss_size = (uint32_t) &_bss_end - (uint32_t) &_bss;
    if (bss_size > 0) {
        printf("Filling .bss section with 0, offset: 0x%x, size: %d bytes.\n", &_bss, bss_size);
        memset(&_bss, 0, bss_size);
    }

    write_segment(0x06);

    // call the actual function
    int result = _entry();
    if (result == 0) {
        puts("Program exited normally.");
    } else {
        printf("Program exited abnormally with code %d.\n", result);
    }

    write_segment(0x07);

}

word_t _get_epc() {
    word_t n;
    asm(
        "mfc0 %0, $14\n\t"
        :"=r"(n)
        );
    return n;
}

word_t _get_cause() {
    word_t n;
    asm(
        "mfc0 %0, $13\n\t"
        :"=r"(n)
        );
    return n;
}

void print_trapframe(trapframe_t *tf) {
    for(int i = 1; i < 32; ++i) {
        printf("Register $%d: %p\n", i, tf->gpr[i]);
    }
    printf("EPC: %p, Cause: %p, Status: %p, BadVAddr: %p, EBase: %p\n", tf->cp0_epc, tf->cp0_cause, tf->cp0_status, tf->cp0_badvaddr, tf->cp0_ebase);
}

void print_tlb() {
    for (uint8_t i = 0; i < TLB_COUNT; ++i) {
        uint32_t entry_hi, entry_lo_1, entry_lo_2;
        asm volatile(
            "mtc0 %3, $0, 0\n"
            "tlbr\n"
            "mfc0 %0, $10, 0\n"
            "mfc0 %1, $2, 0\n"
            "mfc0 %2, $3, 0\n"
            :"=r"(entry_hi), "=r"(entry_lo_1), "=r"(entry_lo_2)
            :"r"(i)
        );
        printf("TLB item %d: EntryHi %p, EntryLo1: %p, EntryLo2: %p\n", i, entry_hi, entry_lo_1, entry_lo_2);
    }
}

void _exception_handler(trapframe_t *tf, bool assertion) {
    puts("*****TrivialMIPS Bare Metal System*****");
    if (assertion) {
        puts("CPU internal assertion failed, abort.");
        write_segment(0xdeaddead);
    } else {
        word_t code = (_get_cause() >> 2) & 0xF;
        auto epc = _get_epc();
        printf("An exception occurred, with EPC 0x%x and Cause %d (%s).\n", epc, code, EXCEPTION_MESSAGES[code]);
        write_led((uint16_t) epc);
    }
    print_trapframe(tf);
    print_tlb();
    puts("*****System HANG*****");
}
