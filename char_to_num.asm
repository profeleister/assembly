    extern printf
    extern scanf

    section .data
    prompt db "Enter a character: ", 0
    input_format db "%c", 0
    output_format db "ASCII value: %d", 10, 0
    invalid_input_msg db "Input: %c is invalid", 10, 0

    section .bss
    input_char resb 1

    section .text
    global main

main:
    push ebp
    mov ebp, esp

    ; Prompt user for input
    push prompt
    call printf
    add esp, 4

    ; Read character input
    push input_char
    push input_format
    call scanf
    add esp, 8

    ; Convert character to number (ASCII value)
    mov eax, dword [input_char]

    ; ; Print the ASCII value
    ; push eax
    ; push output_format
    ; call printf
    ; add esp, 8

    mov eax, dword [input_char]
    sub eax, 48

    cmp eax, 0
    jl invalid_input
    cmp eax, 8
    jg invalid_input

    jmp exit
    
    
    ; ; Print the ASCII value
    ; push eax
    ; push output_format
    ; call printf
    ; add esp, 8

invalid_input:
    push eax
    push invalid_input_msg
    call printf
    jmp exit
    
exit:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
