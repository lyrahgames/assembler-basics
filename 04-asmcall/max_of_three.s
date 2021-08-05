.global max_of_three

.text
max_of_three:
  # According to calling conventions,
  # arguments are provided in RDI, RSI, and RDX.
  # The return value will be provided in RAX.
  mov %rdi, %rax
  # The CMP instruction computes the difference
  # and sets ZF flag if operands are equal
  # and sets CF flag if the first operand
  # is smaller than the second.
  cmp %rsi, %rax
  # Conditions are evaluated with respect to
  # the first operand of CMP,
  # also known as the destination operand.
  # Hence, CMOVL moves the first operand to the second operand if
  # the SF (sign) flag is not the same as OF (overflow) flag.
  # When conditionally moving, we have to decide
  # between signed and unsigned integers.
  cmovl %rsi, %rax
  # The same is done for the third argument of our function.
  cmp %rdx, %rax
  cmovl %rdx, %rax
  ret
