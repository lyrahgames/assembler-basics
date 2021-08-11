.global main

.text
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
  mov %eax, %r13d
  // atoi(argv[1])
  mov 0x08(%r12), %rdi
  call atoi
  mov %eax, %r14d

  add %r14d, %r13d

  // printf()
  mov $result_format_string, %rdi
  mov %r13, %rsi
  xor %rax, %rax
  call printf

  pop %r14
  pop %r13
  pop %r12

  xor %rax, %rax
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
