format PE CONSOLE
entry start

include 'includes/win32a.inc'

section '.data' data readable writeable
    msg db 'This is a for loop example',0 ; unused
    index dd 30 ; set own index
    startLoop dd 0 ; don't change
    ;increment db 2 ; increment logic is not implemented
    format1 db '%s',0 ; unused
    format2 db '%d',0

section '.code' code readable executable
    start:
        call loopLogic
  
    loopLogic:
        mov eax,[startLoop]
        cmp eax,[index]
        jge endLoop
        call incrementLoop
        jmp start

    incrementLoop:
        add dword [startLoop],1
		cinvoke printf,format2,[startLoop]
        ret

    endLoop:
        ;cinvoke printf,format1,msg
        call ExitProcess

section '.idata' import data readable writeable
    library kernel32,'kernel32.dll',\
            crtdll,'crtdll.dll'

    import kernel32,\
            ExitProcess,'ExitProcess'

    import crtdll,\
            printf,'printf'
