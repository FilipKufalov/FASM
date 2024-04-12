# FASM
<h3>Assembly Language</h3>

<p>GitHub Dark Theme for Flat Assembler Created by Me <br> https://github.com/FilipKufalov/FASM-Github-Dark-Theme</p>

<p>Download for Flat Assembler - http://flatassembler.net/ & GitHub: <a href="https://github.com/tgrysztar">Flat Assembler by Tomasz Grysztar</a></p>

```
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
```