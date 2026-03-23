org  0x7C00
bits 16

main:
    bit

.halt
    jmp .halt

times 510-($-$$) db 0
dw 0xAA55