#ifndef __MEMORY_TEST_H__
#define __MEMORY_TEST_H__

#include <machine.h>

word_t rand(word_t &rand_seed);

bool test_memory(void* start, void* end);

#endif