.text

.global sum
sum:
  xorpd %xmm0, %xmm0
  cmp $0, %rsi
  je 2f
1:
  addsd (%rdi), %xmm0
  add $8, %rdi
  dec %rsi
  jnz 1b
2:
  ret
