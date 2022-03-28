format PE GUI 4.0 ;PE stands for Portable Executable and GUI for Graphic Interface

include 'win32ax.inc'

start:
    invoke MessageBox,HWND_DESKTOP,"Hello World!","First Program in Assembly",MB_OK
    invoke ExitProcess,0

.end start