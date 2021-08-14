.text
.global power
power:
  mov $1, %rax
  1:
    test %rsi, %rsi
    jz 2f
    imul %rdi, %rax
    dec %rsi
    jmp 1b
  2:
  ret
