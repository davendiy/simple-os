#include "stdint.h"

uint32_t value;

// reads from sepc and assigns it to the value variable
__asm__ __volatile__("csrr %0, sepc" : "=r"(value));


// writes 123 to the sscratch
__asm__ __volatile__("csrw sscratch, %0" : : "r"(123));

// in fact it does something like this:
/*
li    a0, 123        // Set 123 to a0 register
csrw  sscratch, a0   // Write the value of a0 register to sscratch register
*/

