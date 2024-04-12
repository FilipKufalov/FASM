format PE console
entry start

include 'includes/win32a.inc'

section '.data' data readable writeable
    message db 'Hello, world!',0

section '.code' code readable executable
start:
    cinvoke printf, message

section '.idata' import data readable writeable
    library msvcrt, 'msvcrt.dll'
    import msvcrt, \
           printf, 'printf'