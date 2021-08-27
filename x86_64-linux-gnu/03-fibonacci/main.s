.global main

.text
main:
  # We want to use RBX as temporary variable.
  # But due to the x86_64 API specification,
  # RBX needs to be preserved across function calls.
  push %rbx

  # Set count of Fibonacci numbers to print.
  mov $90, %ecx
  # Set first register to 0.
  xor %rax, %rax
  # Set second register to 1.
  xor %rbx, %rbx
  inc %rbx

  # Fibonacci Sequence Print Loop
  print:
    # According to x86_64 ABI specifications,
    # RAX and RCX may not be preserved when calling a function.
    push %rax
    push %rcx

    # Print the current number by calling 'printf'.
    # Set the format string as first argument.
    mov $format, %rdi
    # Provide Fibonacci number as second argument.
    mov %rax, %rsi
    # 'printf' uses variable number of arguments.
    # According to the x86_64 ABI specification,
    # the lowest byte of the RAX register
    # encodes the number of SIMD registers
    # holding floating-point data used.
    # Here, no floating-point variables in SIMD registers are used.
    # Hence, RAX is set to zero.
    xor %rax, %rax
    call printf

    # Get back values from RAX and RCX.
    pop %rcx
    pop %rax

    # Compute next Fibonacci number.
    # Register 'rdx' is used as a temporary variable.
    mov %rax, %rdx
    mov %rbx, %rax
    add %rdx, %rbx

    # Loop if not all all numbers have been printed.
    dec %ecx
    jnz print

  # Set old value of RBX.
  pop %rbx

  # Return value 0 from main function.
  mov $0, %rax
  ret

format:
  .asciz "%20ld\n"
