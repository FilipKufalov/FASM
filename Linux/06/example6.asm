; example from https://github.com/hnwfs/lin-Fasm/blob/master/samples/04/fasm4.asm
format ELF64 executable 3

segment readable executable

entry main

include 'io.inc'
include 'unistd64.inc'

main:
    lea  rdi, [prompt]
    call print
    lea  rsi, [buf]
    mov  rdi, 64                                  ; size of buffer
    call read
    mov  rdi, rsi                                 ; move address of buf to rdi
    call print
    xor  rdi, rdi                                 ; exit code 0
    mov  rax, sys_exit                            ; instead of call exit from io.inc, the author here want to present usage of unistd64.inc
    syscall                                       ; thats why we have here mov eax, sys_exit in line before

segment readable writable

prompt db 'Please type your name: ', 0
buf    rb 64
