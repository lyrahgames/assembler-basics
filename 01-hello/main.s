# Start Address of the Program
.global _start

# Text Section Containing the Code
.text
_start:
  # Prepare system call to write message on stdout.
  mov $1, %rax
  # Write to stdout by setting first argument to 1.
  mov $1, %rdi
  # Set start pointer to message.
  mov $message, %rsi
  # Provide number of characters.
  mov $14, %rdx
  syscall

  # Correctly exit the program by calling exit system call.
  mov $60, %rax
  # Set return code.
  mov $0, %rdi
  syscall

# Data Section
.data
message:
  .ascii "Hello, World!\n"
