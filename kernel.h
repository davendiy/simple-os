
#pragma once

// use as macros to correctly represent __FILE__ and __LINE__ parameters
// do {} while (0) is a convenient way to define multi-line macros
// ##__VA_ARGS__ is compiler extension to use multiple arguments in macros
// ## means that comma will be excluded if __VA_ARGS__ is empty
#define PANIC(fmt, ...)                                                         \
    do {                                                                        \
        printf("PANIC: %s:%d: " fmt "\n", __FILE__, __LINE__, ##__VA_ARGS__);   \
        while (1) {}                                                            \
    } while (0)


struct sbiret
{
    long error;
    long value;
};
