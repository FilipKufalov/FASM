format ELF executable

segment readable executable

entry $
    mov eax, 3
    mov eax, 60
    syscall

segment readable writeable
