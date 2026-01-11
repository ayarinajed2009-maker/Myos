; boot.asm
[org 0x7c00]
bits 16

start:
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    call load_kernel
    jmp 0x1000:0x0000

load_kernel:
    mov bx, 0x1000
    mov dh, 4
    mov dl, 0
    mov ch, 0
    mov cl, 2
    mov ah, 0x02
    mov al, dh
    int 0x13
    ret

times 510-($-$$) db 0
dw 0xaa55
