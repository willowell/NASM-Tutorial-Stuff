; To run: $ nasm -f macho64 hello_world.asm && ld -macosx_version_min 10.15.0 -lSystem -o hello_world hello_world.o && ./hello_world

        default rel

        global  _main

        section .text

_main:  mov     rax, 0x2000004 ; write
        mov     rdi, 1 ; stdout
        lea     rsi, [rel msg]
        mov     rdx, msg.len
        syscall

        mov     rax, 0x2000001 ; exit
        mov     rdi, 0
        syscall

        section .data
msg:    db      "Hello, world!", 0x0a
        .len:   equ $ - msg