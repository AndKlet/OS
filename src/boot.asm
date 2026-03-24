org  0x7C00
bits 16

%define ENDLINE 0x0D, 0x0A

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

    mov si, msg_welcome
    call puts
    jmp .halt
;
; Prints string
; Parameters:
;   - si: pointer to the string to print
;   - ds: segment of the string
puts:
    push si ; save si on the stack
    push ax ; save ax on the stack

.loop:
    lodsb              ; load next character
    or al, al          ; check if it's null terminator
    jz .done

    mov ah, 0x0E       ; BIOS teletype function
    int 0x10           ; print character
    jmp .loop

.done:
    pop ax
    pop si
    ret

.halt
    jmp .halt

msg_welcome db 'Welcome to MyOS!' , ENDLINE, 0

times 510-($-$$) db 0
dw 0xAA55