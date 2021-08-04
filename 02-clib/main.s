# Using the C library forces us to use the main function as start address.
.global main

.text
main:
  // Provide the start address of the message as first argument.
  mov $message, %rdi
  // Use 'puts' to print the given message to the screen.
  call puts

  // Set return value to zero to indicate success.
  mov $0, %rax
  // Return from the main function.
  ret

.data
message:
  # Zero-Terminated ASCII-encoded String
  .asciz "This line is printed by the C standard library."
