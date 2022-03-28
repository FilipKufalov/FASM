format PE console

include 'win32wxp.inc'

.code
  start:
        invoke  AllocConsole
        invoke  SetConsoleTitle,"Hello World in Assembly Console"
        ; Whole Explanation for WriteConsole can be found on Microsoft page https://docs.microsoft.com/en-us/windows/console/writeconsole
        invoke  WriteConsole,<invoke GetStdHandle,STD_OUTPUT_HANDLE>,"Hello World!",12,0,0
        invoke  Sleep,-1
.end start