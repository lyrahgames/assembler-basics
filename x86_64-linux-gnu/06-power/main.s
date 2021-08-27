.text

.global main
main:
  cmp $3, %rdi
  jne error

  push %r12
  push %r13
  push %r14

  mov %rsi, %r12

  // atoi(argv[2])
  mov 0x10(%r12), %rdi
  call atoi
  // Negative exponents are not allowed.
  cmp $0, %eax
  jl negative_exponent_error
  mov %eax, %r13d

  // atoi(argv[1])
  mov 0x08(%r12), %rdi
  call atoi
  mov %eax, %r14d

  mov %r14, %rdi
  mov %r13, %rsi
  call power

  // printf()
  mov %rax, %rsi
  mov $result_format_string, %rdi
  // movslq %eax, %rsi
  xor %rax, %rax
  call printf

  xor %rax, %rax
  jmp done

  negative_exponent_error:
    mov $exception_negative_exponent, %rdi
    call puts
    mov $-1, %rax

  done:
  pop %r14
  pop %r13
  pop %r12

  ret

  error:
    mov $-1, %rax
    call print_usage
    ret

print_usage:
  push %rdi
  push %rsi
  sub $0x10, %rsp

  mov $usage_format_string, %rdi
  mov (%rsi), %rsi
  xor %rax, %rax
  call printf

  add $0x10, %rsp
  pop %rsi
  pop %rdi

  ret

usage_format_string:
  .asciz "usage:\n%s <base> <exponent>\n\n"

result_format_string:
  .asciz "%i\n"

exception_negative_exponent:
  .asciz "No negative exponent allowed."
