
// An example of application

#include "user.h"

void main(void) {
    __asm__ __volatile__(
        "li sp, 0xdeadbeef\n"     // Set an invalid address to sp
        "unimp"                   // Trigger an exception
    );
}