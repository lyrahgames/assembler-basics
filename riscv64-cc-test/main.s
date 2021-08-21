.text

.global main
main:
  la a0, hello_message
  call print_zstring

  la a0, bye_message
  call print_zstring

  la a0, new_message
  call print_zstring

  li a0, 0
  call exit

.data
hello_message:
  .asciz "Hello, World! And even more than that.\nAnd, of course, a next line.\n"
bye_message:
  .asciz "Goodbye, World!\n"
new_message:
  .asciz "Next\n"
