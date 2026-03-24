org  0x7C00
bits 16

main:

    ; setup segment registers
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; stack
    mov ss, ax
    mov sp, 0x7C00

    bit

.halt
    jmp .halt

times 510-($-$$) db 0
dw 0xAA55