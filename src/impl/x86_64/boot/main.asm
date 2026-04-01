global start

section .text
bits 32
start:
  ; print OK
  mov dword [0xb8000], 0x2f4b2f4f ; 0xb8000 is the standard physical memory address for the VGA text mode buffer ; 0x2f4b2f4f is "OK"
  hlt ; halt program after instruction
