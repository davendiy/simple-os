typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef uint32_t size_t;


// values from kernel.ld
// __bss means 'the value at the 0th byte of the .bss section'
// instead we need 'the start address of the .bss section'
// that's why [] is added
extern char __bss[], __bss_end, __stack_top[];

void *memset(void *buf, char c, size_t n){
    uint8_t *p = (uint8_t *) buf;
    while (n--)
        *p++ = c;
    return buf;
}


void kernel_main(void){
    // initialize .bss section to zero
    memset(__bss, 0, (size_t) __bss_end - (size_t) __bss);

    for (;;);
}


// naked to ensure compiler doens't generate shit before and after
// the function

// section .text.boot is set to 0x80200000 because OpenSBI jumps to this
// address at the start without knowing the entry point.
__attribute__((section(".text.boot")))
__attribute__((naked))
void boot(void) {
    __asm__ __volatile__(
        "mv sp, %[stack_top]\n"     // Set the stack pointer
        "j kernel_main\n"           // Jump to the kernel main function
        :
        : [stack_top] "r" (__stack_top) // Pass the stack top address as %[stack_top]
    );
}