; int main(int argc, char **argv, char **envp);
; var int64_t var_ch @ stack - 0xc
; 0x00001139      push    rbp
; 0x0000113a      mov     rbp, rsp
; 0x0000113d      sub     rsp, 0x10
; 0x00001141      mov     dword [var_ch], 0
; 0x00001148      jmp     0x1167
; 0x0000114a      mov     eax, dword [var_ch]
; 0x0000114d      lea     rdx, [data.00002004] ; 0x2004

;-- data.00002004:
;0x00002004      and     eax, 0x1000069

; 0x00001154      mov     esi, eax
; 0x00001156      mov     rdi, rdx   ; const char *format
; 0x00001159      mov     eax, 0
; 0x0000115e      call    printf     ; sym.imp.printf ; int printf(const char *format)
; 0x00001163      add     dword [var_ch], 1
; 0x00001167      cmp     dword [var_ch], 9
; 0x0000116b      jle     0x114a
; 0x0000116d      mov     eax, 0
; 0x00001172      leave
; 0x00001173      ret


; compile as object
; then compile the object in order to import extern linux functions, idk why is like that
; format ELF64 executable won't work with extrn
; use public for object, [entry main]
; use entry for executable [entry _start]
format ELF64

include 'io.inc'

section '.text' executable
public main
extrn printf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16               ; reserve space for local variables

    mov dword [rbp - 4], 0    ; int i = 0

.loop:
    cmp dword [rbp - 4], 10   ; while i < 10
    jge .done

    mov eax, dword [rbp - 4]  ; eax = i
    mov esi, eax              ; 2nd argument (int i)
    lea rdi, [fmt]            ; 1st argument (format string)
    xor eax, eax
    call printf

    add dword [rbp - 4], 1    ; i++
    jmp .loop

.done:
    call exit

section ".data" writable
fmt db "%d", 10, 0            ; "%d\n"
