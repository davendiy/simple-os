#!/bin/bash 

set -xue 

# QEMU file path 
QEMU=/opt/homebrew/bin/qemu-system-riscv32 

# Path to clang and compiler flags
CC=/opt/homebrew/opt/llvm/bin/clang  # Ubuntu users: use CC=clang

# g3 : maximum amount of debug info 
# -Wall : major warnings 
# -Wextra : additional warnings 
# -ffreestanding : don't use stdlib of the host 
# -nostdlib : don't link stdlib 
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv32-unknown-elf -fno-stack-protector -ffreestanding -nostdlib"

# -Wl,-Tkernel.ld : specify linker script 
# -Wl : pass options to the linker instead of C compiler 
# Build the kernel
$CC $CFLAGS -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf \
    kernel.c

# Start QEMU 
$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot \
    -kernel kernel.elf
