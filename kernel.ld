
/* the first function of the el is boot, i.e.
boot will be at 0x80200000 */

ENTRY(boot)

SECTIONS {
    /* we know that OpenBSI jumps on this address to boot */
    . = 0x80200000;
    /* kernel memory should be right where elf starts*/
    __kernel_base = .;

    .text :{
        /* keep boot function at the beginning*/
        KEEP(*(.text.boot));
        *(.text .text.*);
    }

    .rodata : ALIGN(4) {
        *(.rodata .rodata.*);
    }

    .data : ALIGN(4) {
        *(.data .data.*);
    }

    .bss : ALIGN(4) {
        __bss = .;
        *(.bss .bss.* .sbss .sbss.*);
        __bss_end = .;
    }

    . = ALIGN(4);
    . += 128 * 1024; /* 128KB */
    __stack_top = .;

    . = ALIGN(4096);
    __free_ram = .;
    . += 64 * 1024 * 1024; /* 64MB */
    __free_ram_end = .;
}