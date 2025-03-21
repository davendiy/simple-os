
addi a0, a1, 123  // add 123 to a1 and store to a0


lw a0, (a1)  // Read a word (32-bits) from address in a1
             // and store it in a0. In C, this would be: a0 = *a1;



    bnez    a0, <label>   // Go to <label> if a0 is not zero
    // If a0 is zero, continue here

<label>:
    // If a0 is not zero, continue here



    li  a0, 123      // Load 123 to a0 register (function argument)
    jal ra, <label>  // Jump to <label> and store the return address
                     // in the ra register.

    // After the function call, continue here...

// int func(int a) {
//   a += 1;
//   return a;
// }
<label>:
    addi a0, a0, 1    // Increment a0 (first argument) by 1

    ret               // Return to the address stored in ra.
                      // a0 register has the return value



addi sp, sp, -4  // Move the stack pointer down by 4 bytes
// (i.e. stack allocation).

sw   a0, (sp)    // Store a0 to the stack

