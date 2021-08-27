.text
# void exit(uint64_t error_code)
# .global exit
# exit:
#   li a7, 93
#   ecall

# auto size_of_zstring(czstring) -> uint64_t;
.global size_of_zstring
size_of_zstring:
  mv t0, a0
  1:
    lbu t1, 0(t0)
    beqz t1, 2f
    addi t0, t0, 1
    j 1b
  2:
  sub a0, t0, a0
  ret

# void print_zstring(czstring);
.global print_zstring
print_zstring:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd a0, 0(sp)

  # a2 = size_of_zstring(message)
  jal ra, size_of_zstring
  mv a2, a0

  # system: write(stdout, message, sizeof(message))
  li a7, 64
  li a0, 1
  ld a1, 0(sp)
  ecall

  ld ra, 8(sp)
  addi sp, sp, 16
  ret
