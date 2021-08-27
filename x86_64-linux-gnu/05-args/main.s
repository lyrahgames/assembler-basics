.global main

.text
// When calling main, RDI contains argc and RSI contains argv.
main:
  // Use RBX as incremental loop counter by initializing with zero.
  // RBX is preserved when calling other functions.
  // Hence, we have to push it first.
  push %rbx
  xor %rbx, %rbx

  loop:
    // We want to call 'printf'.
    // Push used unpreserved registers onto the call stack.
    push %rdi
    push %rsi

    // The stack pointer needs to be 16-byte aligned.
    // Calling a function pushes the return address on the call stack.
    // Hence, when calling 'printf', four 8-byte variables will have been pushed.
    // No adjusting is needed and RBX is preserved.

    // Provide the format string.
    mov $format, %rdi
    // Dereference pointer in argv and set it as second output argument.
    mov (%rsi), %rdx
    // Use loop counter as first output argument.
    mov %rbx, %rsi
    // RAX is not preserved accross function calls.
    // It has to be set to zero every time.
    xor %rax, %rax
    call printf

    // Pop used unpreserved registers of the call stack
    // after the call to printf.
    pop %rsi
    pop %rdi

    // Move to next argument string in argv.
    add $8, %rsi

    // Update the loop counter and jump to loop begin if needed.
    inc %rbx
    cmp %rdi, %rbx
    jl loop

  // Print newline character at end.
  // Push 16 bytes of zeroes on the stack
  // and provide stack pointer as argument to 'puts'.
  xor %rsi, %rsi
  push %rsi
  push %rsi
  mov %rsp, %rdi
  call puts
  add $16, %rsp

  pop %rbx
  xor %rax, %rax
  ret

format:
  .asciz "%i: %s\n"
