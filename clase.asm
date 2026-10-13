extern printf
extern scanf
extern system

; valores conocidos
section .data
  input_message_msg db 'Ingrese un valor: ', 0
  intput_format_msg db '%d', 0
  entrada_invalida_msg db 27, '[31m', 'La entrada es invalida', 27, '[0m', 10, 0

  estudiantes_tec_msg db 27, '[32m', 'Los estudiantes del TEC son %dx mejores que los demas', 27, '[0m', 10, 0

  clear_cmd db 'clear', 0

section .bss
  user_input resd 1

section .text

global main


main:
  ; limpiar consola
  push clear_cmd
  call system
  add esp, 4

  ; imprimir mensaje de entrada de valor
  push input_message_msg
  call printf
  add esp, 4

  ; solicitar el valor al usuario
  push user_input
  push intput_format_msg
  call scanf
  add esp, 8

  cmp eax, 1
  jne entrada_invalida

  ; 1. Verificar si hay error
  ; 2. Si hay error, indicarle al usuario que hubo un error
  ; 3. Finalizar el programa
  ; 4. Create el manejo de error

  push dword [user_input]
  push estudiantes_tec_msg
  call printf

  add esp, 4

  push 20
  push estudiantes_tec_msg
  call printf

  add esp, 4

  push 30
  push estudiantes_tec_msg
  call printf

  add esp, 4

  jmp exit




entrada_invalida:
  push entrada_invalida_msg
  call printf
  add esp, 4

  jmp exit



exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
