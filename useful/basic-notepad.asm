include emu8086.inc
ORG 100h
CLEAR MACRO
        push    ax 
        push    ds      
        push    bx      
        push    cx      
        push    di 
        mov     ax, 40h
        mov     ds, ax
        mov     ah, 06h 
        mov     al, 0 
        mov     bh, 0000_0111b
        mov     ch, 0
        mov     cl, 0
        mov     di, 84h
        mov     dh, [di] 
        mov     di, 4ah 
        mov     dl, [di]
        dec     dl      
        int     10h
        pop     di      
        pop     cx      
        pop     bx      
        pop     ds      
        pop     ax      
ENDM
WKEY MACRO 
    MOV ah, 7
    INT 21h
ENDM
PUTS_DB MACRO string
    PUSH SI
    LEA SI,string               
    CALL PRINT_STRING
    POP SI
ENDM
ENDL MACRO
    PUSH ax
    PUSH bx
    PUSH dx 
    MOV ah,03h
    MOV bh,0
    INT 10h
        PUSH ax
        PUSH bx
        PUSH dx
        MOV ah,2
        MOV dl,0
        ADD dh,1
        INT 10h
        POP ax
        POP bx
        POP cx      
    POP ax
    POP bx
    POP dx
ENDM
UP MACRO
    PUSH ax
    PUSH bx
    PUSH dx 
    MOV ah,03h
    MOV bh,0
    INT 10h
        PUSH ax
        PUSH bx
        PUSH dx
        MOV ah,2
        SUB dh,1
        CMP dh,-1
        JZ skip_up
        INT 10h   
        skip_up:
        POP ax
        POP bx
        POP cx      
    POP ax
    POP bx
    POP dx
ENDM  
LEFT MACRO
    PUSH ax
    PUSH bx
    PUSH dx 
    MOV ah,03h
    MOV bh,0
    INT 10h
        PUSH ax
        PUSH bx
        PUSH dx
        MOV ah,2
        SUB dl,1
        CMP dl,-1
        JZ skip_left
        INT 10h     
        skip_left:
        POP ax
        POP bx
        POP cx      
    POP ax
    POP bx
    POP dx
ENDM
RIGHT MACRO
    PUSH ax
    PUSH bx
    PUSH dx 
    MOV ah,03h
    MOV bh,0
    INT 10h
        PUSH ax
        PUSH bx
        PUSH dx
        MOV ah,2
        ADD dl,1
        INT 10h
        POP ax
        POP bx
        POP cx      
    POP ax
    POP bx
    POP dx
ENDM
DOWN MACRO
    PUSH ax
    PUSH bx
    PUSH dx 
    MOV ah,03h
    MOV bh,0
    INT 10h
        PUSH ax
        PUSH bx
        PUSH dx
        MOV ah,2
        ADD dh,1
        INT 10h
        POP ax
        POP bx
        POP cx      
    POP ax
    POP bx
    POP dx
ENDM

;user input 
JMP while
while:
    mov ah,0
    int 16h
    CMP ah,48h
    JZ uppy
    CMP ah,4Bh
    JZ lefty
    CMP ah,50h
    JZ downy
    CMP ah,4Dh
    JZ righty
    PUTC al 
    CMP al,0Dh 
    JZ NEXTLINE
    CMP al,08h
    JZ BACKSPACE
    CMP al,11h
    JZ QUIT
JMP while
BACKSPACE:
        PUTC ' '
        PUTC 08h
        JMP while 
NEXTLINE:
        ENDL
        JMP while
uppy: 
        UP
        JMP while
lefty:
        LEFT 
        JMP while
downy:  
        DOWN
        JMP while
righty:
        RIGHT
        JMP while
;Variales
bye DB 'Come back and see us soon!',0
key DB '{press any key to quit}',0

;Defines
DEFINE_PRINT_STRING

;Return controll 
QUIT:
CLEAR
GOTOXY 0,0
PUTS_DB bye
ENDL
ENDL
PUTS_DB key
WKEY       
RET
