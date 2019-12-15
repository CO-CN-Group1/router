#include <stdio.h>
#include <memory_test.h>

word_t rand(word_t &rand_seed) {
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
}

template<typename Type>
bool do_test_memory(void* _start, void* _end) {
	word_t rand_seed;

	auto *start = reinterpret_cast<volatile Type *>(_start);
	auto *end = reinterpret_cast<volatile Type *>(_end);

	auto size = (uint32_t) _end - (uint32_t) _start;

	auto *mem = start;

	rand_seed = 23;

	while(mem < end) {
		*mem = rand(rand_seed);
		mem++;
	}

	mem = start;

	rand_seed = 23;

	while(mem < end) {
		// print progress every 1MB
		if ((uint32_t) mem % 0x100000 == 0) {
			write_segment((uint32_t) mem);
		}
		auto next = rand(rand_seed);
		auto read = *mem;
		if (read != static_cast<Type>(next)) {
			printf("Error at 0x%p: expect 0x%p, got 0x%p\n", mem, next, read);
			return false;
		}
		mem++;
	}

    return true;
}

bool test_memory(void* start, void* end){

	printf("Starting memory test from 0x%p to 0x%p.\n", start, end);

    putstring("Testing memory by word...");
    if (!do_test_memory<word_t>(start, end)) return false;
	puts("OK!");

	putstring("Testing memory by half word...");
    if (!do_test_memory<hword_t>(start, end)) return false;
	puts("OK!");

	putstring("Testing memory by byte...");
    if (!do_test_memory<byte_t>(start, end)) return false;
	puts("OK!");

    return true;
}