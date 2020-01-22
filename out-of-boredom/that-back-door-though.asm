;com file
#MAKE_COM#

;offset for DOS COM file
org     100h

;clear Registers
PUSH    ax
PUSH    bx
PUSH    cx
PUSH    dx

;Macro functions
PUTC MACRO char
        PUSH    ax
        MOV     ah,09h
        MOV     al,char
        INT     10h
        POP     ax
ENDM
PUTP MACRO end_char
        while:
                POP     bl
                CMP     bl,end_char
                JZ      wend
                PUTC    bl
                JMP     while
        wend:
ENDM
jamie MACRO
        PUTC '-'
        PUTC 'G'
        PUTC 'o'
        PUTC 'o'
        PUTC 'd'
        PUTC 'b'
        PUTC 'y'
        PUTC 'e'
ENDM
POPN MACRO num,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p
        MOV     dx,num
        CMP     p,0
        JZ      SKIP_P
        PUSH    p
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_P: CMP     o,0
        JZ      SKIP_O
        PUSH    o
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_O: CMP     n,0
        JZ      SKIP_N
        PUSH    n
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_N: CMP     m,0
        JZ      SKIP_M
        PUSH    m
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_M: CMP     l,0
        JZ      SKIP_L
        PUSH    l
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_L: CMP     k,0
        JZ      SKIP_K
        PUSH    k
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_K: CMP     j,0
        JZ      SKIP_J
        PUSH    j
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_J: CMP     i,0
        JZ      SKIP_I
        PUSH    i
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_I: CMP     h,0
        JZ      SKIP_H
        PUSH    h
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_H: CMP     g,0
        JZ      SKIP_G
        PUSH    g
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_G: CMP     f,0
        JZ      SKIP_f
        PUSH    f
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_F: CMP     e,0
        JZ      SKIP_E
        PUSH    e
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_E: CMP     d,0
        JZ      SKIP_D
        PUSH    d
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_D: CMP     c,0
        JZ      SKIP_C
        PUSH    c
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_C: CMP     b,0
        JZ      SKIP_B
        PUSH    b
        SUB     dx,1
        CMP     dx,0
        JZ      pdone
SKIP_B: CMP     a,0
        JZ      SKIP_A
        PUSH    a
SKIP_A: pdone:
ENDM


;Stacking the deck
POPN    7,'I',' ','w','i','n','!','$'

;Dealing out the cards
jamie
PUTP    '$'

;    Back-Door <3
;+-----------------+
;|      +---+      |
;|      |   |      |
;|      |  o|      |
;|      |   |      |
;+------+---+------+


;Cleanup
POP     ax
POP     bx
POP     cx
POP     dx

;Return Controll to the OS
RET
