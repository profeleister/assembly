extern printf

section .data
    hello_world db 'Hello World!', 10, 10, 0
    output_msg db 'The result is: %d', 10, 0

section .text

global main

main:
    ; Welcome message
    push hello_world
    call printf
    
    add esp, 4

    ; Perform add operation
    mov eax, 2
    mov ebx, 3
    add eax, ebx

    push eax
    push output_msg
    call printf

    add esp, 8

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
