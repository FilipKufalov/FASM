; open main.cpp from cpp folder to get the idea behind this assembly code
; debug lines main.out
;
;
; calc(int, int)(int64_t arg1, int64_t arg2);
; arg int64_t arg1 @ rdi
; arg int64_t arg2 @ rsi
; var int64_t var_10h @ stack - 0x10
; var int64_t var_ch @ stack - 0xc
; 0x00001149      push    rbp        ; calc(int, int)
; 0x0000114a      mov     rbp, rsp
; 0x0000114d      mov     dword [var_ch], edi ; arg1
; 0x00001150      mov     dword [var_10h], esi ; arg2
; 0x00001153      mov     edx, dword [var_ch]
; 0x00001156      mov     eax, dword [var_10h]
; 0x00001159      add     eax, edx
; 0x0000115b      pop     rbp
; 0x0000115c      ret
;
;
; main function that store 6 to esi and 2 to edi registers and call calc function
;
; int main(int argc, char **argv, char **envp);
; 0x0000115d      push    rbp
; 0x0000115e      mov     rbp, rsp
; 0x00001161      mov     esi, 6     ; int64_t arg2
; 0x00001166      mov     edi, 2     ; int64_t arg1
; 0x0000116b      call    calc(int, int) ; sym.calc_int__int
; 0x00001170      mov     edx, eax
; 0x00001172      lea     rax, [std::cout] ; loc.__bss_start
;                                   ; 0x4040
; 0x00001179      mov     esi, edx
; 0x0000117b      mov     rdi, rax
; 0x0000117e      call    imp.std::ostream::operator<<(int) ; method.std::ostream.operator___int ;  method.std::ostream.operator___int(void)
; 0x00001183      mov     rdx, qword [std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)] ; 0x3fc0
; 0x0000118a      mov     rsi, rdx
; 0x0000118d      mov     rdi, rax
; 0x00001190      call    imp.std::ostream::operator<<(std::ostream& (*)(std::ostream&)) ; method.std::ostream.operator___std::ostream______std::ostream ;  method.std::ostream.operator___std::ostream______std::ostream(void)
; 0x00001195      mov     eax, 0
; 0x0000119a      pop     rbp
; 0x0000119b      ret

format ELF64 executable

_start:
    ; Calculate 2 + 6
    mov rax, 2        ; First number
    mov rbx, 6        ; Second number
    add rax, rbx      ; Result in rax

    ; Exit
    mov rax, 60       ; sys_exit
    xor rdi, rdi      ; exit code 0
    syscall
