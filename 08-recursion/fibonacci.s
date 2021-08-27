.text

// uint64_t fibonacci(uint64_t n)
.global fibonacci
fibonacci:
  // Check return condition.
  cmp $1, %rdi
  jle 1f

  // fibonacci(n - 1)
  dec %rdi
  // Store (n-1) for the second fibonacci call.
  push %rdi
  call fibonacci
  pop %rdi

  // fibonacci(n - 2)
  dec %rdi
  // Store result of first call. We can forget about 'n'.
  push %rax
  call fibonacci

  // return fibonacci(n - 1) + fibonacci(n - 2)
  add 0(%rsp), %rax
  add $8, %rsp
  ret

1:
  // return n
  mov %rdi, %rax
  ret
