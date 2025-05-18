format PE GUI 5.0 DLL
entry DllEntryPoint

include 'C:\FASM\INCLUDE\win32a.inc'

section '.data' readable
	text_test db 'test', 0
	
section '.code' readable

proc DllEntryPoint uses ebx esi edi, hinstDLL, fdwReason, lpvReserved
	cmp [fdwReason], DLL_PROCESS_ATTACH
	jne .done
	push 0
	push text_test
	push text_test
	push 0
	call [MessageBox]
	.done:
	ret
endp	


section ".idata" import data readable writeable
library user,'user32.dll'
import user,\
		MessageBox, 'MessageBoxA'
		
section '.reloc' fixups data readable discardable

  if $=$$
    dd 0,8		; if there are no fixups, generate dummy entry
  end if