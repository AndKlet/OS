org  0x7C00
bits 16

start:
    jmp main

main:
    ; setup segment registers
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; stack
    mov ss, ax
    mov sp, 0x7C00 ; We set the stack pointer to the end of the bootloader, since it grows downwards

.halt
    jmp .halt

times 510-($-$$) db 0
dw 0xAA55