// Text Section Containing the Code
.text

// Symbol '_start' marks start address of the Program.
// Has to be made globally accessible to be used by the linker.
.global _start
_start:
  // Prepare system call to write message on stdout.
  mov $1, %rax
  // Write to stdout by setting first argument to 1.
  mov $1, %rdi
  // Set start pointer to message.
  // mov $message, %rsi
  lea message(%rip), %rsi
  // Provide number of characters.
  mov $14, %rdx
  syscall

  // Correctly exit the program by calling exit system call.
  mov $60, %rax
  // Set return code.
  mov $0, %rdi
  syscall

// Data Section
.data
message:
  .ascii "Hello, World!\n"
