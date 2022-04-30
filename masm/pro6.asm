	    EXTRN p1ax :word
		EXTRN p1bx :word
		EXTRN p1cx :word
		EXTRN p1dx :word
		EXTRN p1si :word
		EXTRN p1di :word
		EXTRN p1sp :word
		EXTRN p1bp :word
		EXTRN p1ah :BYTE
		EXTRN p1bh :BYTE
		EXTRN p1al :BYTE
		EXTRN p1bl :BYTE
		EXTRN p1ch :BYTE
		EXTRN p1cl :BYTE
        EXTRN p1dh :BYTE
		EXTRN p1dl :BYTE
		EXTRN p1sil :BYTE
		EXTRN p1sih :BYTE
		EXTRN p1dih  :BYTE
		EXTRN p1dil  :BYTE
		EXTRN p1sph :BYTE
		EXTRN p1spl :BYTE
		EXTRN p1bpl :BYTE
		EXTRN p1bph :BYTE
		EXTRN p10  :BYTE
		EXTRN p11 :BYTE
		 EXTRN p12  :BYTE
		 EXTRN p13 :BYTE
		 EXTRN p14  :BYTE
		 EXTRN p15  :BYTE
		 EXTRN p16  :BYTE
		 EXTRN p17 :BYTE
		 EXTRN p18 :BYTE
		 EXTRN p19 :BYTE
		 EXTRN p1a :BYTE
		 EXTRN p1b :BYTE
		 EXTRN p1c :BYTE
		 EXTRN p1d  :BYTE
		 EXTRN p1e :BYTE
		 EXTRN p1f :BYTE
          
        EXTRN p1stacksize :BYTE
		EXTRN p1stackindex :word
		EXTRN p1stack  :BYTE
           EXTRN pgpoint :BYTE
		 EXTRN command1 :BYTE
         EXTRN comand1 :BYTE
         EXTRN s :BYTE

        PUBLIC pro6
.MODEL SMALL
.386
.data


.CODE
pro6 proc far
    mov ax,@data
    mov ds, ax 
    
   call subp
                ret
    
pro6 ENDP

subp    proc  near
   
    lea si, s
    mov bx,[si]
    cmp bl,'s'
    je Sstate
    mov  dl, 1
    jmp exitSUB
    
    
    
   Sstate: 
   inc si 
   inc si
   mov bx,[si]
   cmp bl, 'b' 
   je SUBSTATEVALIDATION
   mov  dl, 1
   jmp exitSUB
           
   SUBSTATEVALIDATION:
   inc si
   inc si
  mov bx,[si]
  cmp bl,'s'
  je RSUBEVALIDATION
  cmp bl, 'd'
  je RSUBEVALIDATION
  cmp bl, 'b'
  je RSUBEVALIDATION
  cmp bl , '['
  je OFFSUBVAlIDATION
  inc si  
   
   mov bx,[si]
   cmp bl, 'x'
   je XSUBVALIDATION
   cmp bl, 'h'
   je HSUBVALIDATION
           
   cmp bl, 'l'
   je HSUBVALIDATION
   
   jmp SUBERORR
   
OFFSUBVAlIDATION:
inc si 
mov bx,[si]
cmp bl,'b'
je OFFSUBVAlIDATIONB
cmp bl, 'd'
je OFFSUBVAlIDATIOND
cmp bl,'s'
je OFFSUBVAlIDATIOND
inc si
inc si
mov bx,[si]
cmp bl,']'
je SUBSTATE
jmp SUBERORR

OFFSUBVAlIDATIONB:
inc si
mov bx,[si]
cmp bl,'x'
jne SUBERORR
inc si 
mov bx,[si]
cmp bl ,']'
je SUBSTATE
jmp SUBERORR

OFFSUBVAlIDATIOND:
inc si
mov bx,[si]
cmp bl,'i'
jne SUBERORR
inc si 
mov bx,[si]
cmp bl,']'
je SUBSTATE
jmp SUBERORR

   
   HSUBVALIDATION:
   mov cl,03h
   inc si
   inc si
   mov bx,[si]
   cmp bl , 'v'
   je VHSUBVALID  
   cmp bl,'['
   je OFFSUBVALIDATIONG

   inc si
   mov bx,[si]
   cmp bl , 'x'
   je SUBERORR
   
   cmp bl , 'l'
   je ENDVSUB
    
   cmp bl , 'h'
   je ENDVSUB
   OFFSUBVALIDATIONG:
   inc si
    mov bx,[si]
    cmp bl,'b'
   je OFFSUBVAlIDATIONB
   cmp bl,'s'
   je OFFSUBVAlIDATIOND
   cmp bl,'d'
   je OFFSUBVAlIDATIOND
    inc si
    inc si
    mov bx,[si]
    cmp bl,']'
    je SUBSTATE
    jmp SUBERORR
   XSUBVALIDATION:
   inc si
   inc si
   mov bx,[si]
   cmp bl, 'v'
   je VSUBVALID
   cmp bl, 's'
   je SUBSTATE
   inc si
   mov bx,[si]
   cmp bl, 'x'
   je ENDVSUB 
   cmp bl, 'x'
   jmp SUBERORR
   
   VHSUBVALID:
   mov cl,04h
   inc si 
   inc si
   inc si
   mov bx,[si]
   cmp bl,'$'
   je SUBSTATE
   cmp bl, '$'
   jne SUBERORR
   
   VSUBVALID:
   add si,6h
   mov bx,[si]
   cmp bl, '$'
   je SUBSTATE
   cmp bl, '$'
   jne SUBERORR
   
   
  RSUBEVALIDATION:
  inc si 
  mov bx, [si]
  cmp bl, 'l'
  je HSUBVALIDATION
  cmp bl, "h"
  je HSUBVALIDATION
  cmp bl, 'x'
  je XSUBVALIDATION
   add si ,3
   mov bx, [si]
   cmp bl,'x'
   je SUBSTATE
   jmp SUBERORR

   ENDVSUB:
   inc si 
   mov bx,[si]
   cmp bl,'$'
   je  SUBSTATE





   SUBERORR:
   ;mov dl,5
   dec pgpoint
   jmp exitSUB
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
   SUBSTATE:
   lea si ,s +4
   mov bx,[si] 
   ;--
   cmp bl ,'['
   je SUBSTATEOFF
   cmp bl, 'a'
   je SUBSTATEA 
   ;--
   cmp bl ,'s'
   je SUBSTATES
   ;==
   cmp bl, 'b'
   je SUBSTATEB
   ;===
   cmp bl, 'c'
   je SUBSTATEC
   cmp bl, 'd'
   je SUBSTATED
   jmp SUBERORR
   ;============
   SUBSTATEAX:
   inc si
   inc si
   
   mov bx,[si]
   cmp bl, 'b' 
   je SUBSTATEAXTOB
   cmp bl, 'c' 
   je SUBSTATEAXTOCX
    cmp bl, 'd' 
   je SUBSTATEAXTOD
   cmp bl,'v'
   je SUBSTATEAXV
   cmp bl , 's'
   je  SUBSTATEAXTOS
   jmp SUBERORR

  SUBSTATEAXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je SUBSTATEAXTOSI
  cmp bl, 'p'
  je SUBSTATEAXTOSP
jmp SUBERORR
SUBSTATEAXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je SUBSTATEAXTODX

cmp bl, 'i'
je SUBSTATEAXTODI

jmp SUBERORR
  SUBSTATEAXTOB:
  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je SUBSTATEAXTOBX
  cmp bl, 'p'
  je SUBSTATEAXTOBP
  jmp SUBERORR
   ;========


   SUBSTATEBX:
   inc si
   inc si
   
   mov bx,[si]
   cmp bl, 'a' 
   je SUBSTATEBXTOAX
   cmp bl, 'c' 
   je SUBSTATEBXTOCX
    cmp bl, 'd' 
   je SUBSTATEBXTOD
   cmp bl ,'v'
   je SUBSTATEBXV
   cmp bl,'b'
   je SUBSTATEBXTOBP

    cmp bl , 's'
   je  SUBSTATEBXTOS

jmp SUBERORR
  SUBSTATEBXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je SUBSTATEBXTOSI
  cmp bl, 'p'
  je SUBSTATEBXTOSP

jmp SUBERORR
SUBSTATEBXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je SUBSTATEBXTODX
cmp bl, 'i'
je SUBSTATEBXTODI

jmp SUBERORR
   ;================
   SUBSTATECX:
   inc si
   inc si
 
   mov bx, [si]
   cmp bl, 'a' 
   je SUBSTATECXTOAX
   cmp bl, 'b' 
   je SUBSTATECXTOBX
    cmp bl, 'd' 
   je SUBSTATECXTOD
    cmp bl ,'v'
   je SUBSTATECXV

    cmp bl , 's'
   je  SUBSTATECXTOS

jmp SUBERORR

  SUBSTATECXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je SUBSTATECXTOSI
  cmp bl, 'p'
  je SUBSTATECXTOSP

jmp SUBERORR
  SUBSTATECXTOB:
  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je SUBSTATECXTOBX
  cmp bl, 'p'
  je SUBSTATECXTOBP

jmp SUBERORR
SUBSTATECXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je SUBSTATECXTODX
cmp bl, 'i'
je SUBSTATECXTODI

   ;============
   jmp SUBERORR
    SUBSTATEDX:
   inc si
   inc si
 
   mov bx,[ si]
   cmp bl, 'a' 
   je SUBSTATEDXTOAX
   cmp bl, 'b' 
   je SUBSTATEDXTOB
    cmp bl, 'c' 
   je SUBSTATEDXTOCX
   cmp bl ,'v'
   je SUBSTATEDXV
    cmp bl ,'d'
    je SUBSTATEDXTODI
  cmp bl , 's'
  je  SUBSTATEDXTOS


jmp SUBERORR
  SUBSTATEDXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je SUBSTATEDXTOSI
  cmp bl, 'p'
  je SUBSTATEDXTOSP
jmp SUBERORR
  SUBSTATEDXTOB:

  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je SUBSTATEDXTOBX
  cmp bl, 'p'
  je SUBSTATEDXTOBP
jmp SUBERORR
   ;============================================
   
    SUBSTATEOFF:
    inc si
    mov bx,[si]
    cmp bl,'b'
    je SUBSTATEOFFBX
    cmp bl,'s'
    je SUBSTATEOFFSI
    cmp bl,'d' 
    je SUBSTATEOFFDI
    inc si
    mov bx,[si]
    cmp bl,'0'
    je SUBSTATEOFF0
    cmp bl,'1'
    je SUBSTATEOFF1
    cmp bl,'2'
    je SUBSTATEOFF2
    cmp bl,'3'
    je SUBSTATEOFF3   
    cmp bl,'4'
    je SUBSTATEOFF4
    cmp bl,'5'
    je SUBSTATEOFF5
    cmp bl,'6'
    je SUBSTATEOFF6
    cmp bl,'8'
    je SUBSTATEOFF8
    cmp bl,'9'
    je SUBSTATEOFF9
    cmp bl,'A'
    je SUBSTATEOFFA
    cmp bl,'B'
    je SUBSTATEOFFB
    cmp bl,'C'
    je SUBSTATEOFFC
    cmp bl,'D'
    je SUBSTATEOFFD
    cmp bl,'E'
    je SUBSTATEOFFE
    cmp bl,'F'
    je SUBSTATEOFFF
jmp SUBERORR
    SUBSTATEOFFBX:
    inc si
    mov bx,p1bx

    cmp bx,0h
    je SUBSTATEOFF0
    cmp bx,1h
    je SUBSTATEOFF1
    cmp bx,2h
    je SUBSTATEOFF2
    cmp bx,3h
    je SUBSTATEOFF3
    cmp bx,4h
    je SUBSTATEOFF4
    cmp bx,5h
    je SUBSTATEOFF5
    cmp bx,6h
    je SUBSTATEOFF6
    cmp bx,7h
    je SUBSTATEOFF7
    cmp bx,8h
    je SUBSTATEOFF8
    cmp bx,9h
    je SUBSTATEOFF9
    cmp bx,0ah
    je SUBSTATEOFFA
    cmp bx,0bh
    je SUBSTATEOFFB
    cmp bx,0ch
    je SUBSTATEOFFC
    cmp bx,0dh
    je SUBSTATEOFFD
    cmp bx,0eh
    je SUBSTATEOFFE
    cmp bx,0fh
    je SUBSTATEOFFF
    jmp SUBERORR
   SUBSTATEOFFSI:
  inc si
    mov bx,p1si

    cmp bx,0h
    je SUBSTATEOFF0
    cmp bx,1h
    je SUBSTATEOFF1
    cmp bx,2h
    je SUBSTATEOFF2
    cmp bx,3h
    je SUBSTATEOFF3
    cmp bx,4h
    je SUBSTATEOFF4
    cmp bx,5h
    je SUBSTATEOFF5
    cmp bx,6h
    je SUBSTATEOFF6
    cmp bx,7h
    je SUBSTATEOFF7
    cmp bx,8h
    je SUBSTATEOFF8
    cmp bx,9h
    je SUBSTATEOFF9
    cmp bx,0ah
    je SUBSTATEOFFA
    cmp bx,0bh
    je SUBSTATEOFFB
    cmp bx,0ch
    je SUBSTATEOFFC
    cmp bx,0dh
    je SUBSTATEOFFD
    cmp bx,0eh
    je SUBSTATEOFFE
    cmp bx,0fh
    je SUBSTATEOFFF
    jmp SUBERORR
     SUBSTATEOFFDI:
    inc si
    mov bx,p1di

    cmp bx,0h
    je SUBSTATEOFF0
    cmp bx,1h
    je SUBSTATEOFF1
    cmp bx,2h
    je SUBSTATEOFF2
    cmp bx,3h
    je SUBSTATEOFF3
    cmp bx,4h
    je SUBSTATEOFF4
    cmp bx,5h
    je SUBSTATEOFF5
    cmp bx,6h
    je SUBSTATEOFF6
    cmp bx,7h
    je SUBSTATEOFF7
    cmp bx,8h
    je SUBSTATEOFF8
    cmp bx,9h
    je SUBSTATEOFF9
    cmp bx,0ah
    je SUBSTATEOFFA
    cmp bx,0bh
    je SUBSTATEOFFB
    cmp bx,0ch
    je SUBSTATEOFFC
    cmp bx,0dh
    je SUBSTATEOFFD
    cmp bx,0eh
    je SUBSTATEOFFE
    cmp bx,0fh
    je SUBSTATEOFFF
    jmp SUBERORR


    
    
    
    SUBSTATEA:
    inc si
    mov bx,[si]
    cmp bl, 'x'
    je SUBSTATEAX
    cmp bl , 'h'
    je SUBSTATEAH
    cmp bl , 'l'
    je SUBSTATEAL
     jmp SUBERORR
    SUBSTATEB:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je SUBSTATEBX
    cmp bl , 'h'
    je SUBSTATEBH
    cmp bl , 'l'
    je SUBSTATEBL
    cmp bl , 'p'
    je SUBSTATEBP
 jmp SUBERORR
    
    
    SUBSTATEC:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je SUBSTATECX
    cmp bl , 'h'
    je SUBSTATECH
    cmp bl , 'l'
    je SUBSTATECL
    jmp SUBERORR
    SUBSTATED:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je SUBSTATEDX
    cmp bl , 'h'
    je SUBSTATEDH
    cmp bl , 'l'
    je SUBSTATEDL
    cmp bl, 'i'
    je SUBSTATEDI

jmp SUBERORR
    SUBSTATES:
    inc si
    mov bx,[si]
    cmp bl, 'i'
    je SUBSTATESI
    cmp bl, 'p'
    je SUBSTATESP
jmp SUBERORR
    ;__________________________________________________ 
    ;;;;;
     SUBSTATEAH:
     inc si
     inc si
     mov bx,[si]
     cmp bl,'a'
     je SUBSTATEAHAL
     cmp bl, 'b'
     je SUBSTATEAHB
     
     cmp bl, 'c' 
     je SUBSTATEAHC
     
     cmp bl, 'd' 
     je SUBSTATEAHD
     cmp bl ,'['
     je SUBSTATEAHOFF
     
     cmp bl ,'v'
     je SUBSTATEAHV
     jmp SUBERORR
     ;;;;
     SUBSTATEAL:
     mov cl,88h
     inc si
     inc si
     mov bx, [si]
     mov cx,[si]
     cmp bl, 'a'
     je SUBSTATEALAH
     cmp bl,'b'
     je SUBSTATEALB
     cmp bl,'c'
     je SUBSTATEALC
     cmp bl,'d'
     je SUBSTATEALD
     cmp bl ,'v'
     je SUBSTATEALV 
     cmp bl , '['
      je SUBSTATEALOFF

      jmp SUBERORR

     
     
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      
     SUBSTATEBH:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je SUBSTATEBHA
     
     cmp bl, 'b'
     je SUBSTATEBHBL
     
     cmp bl, 'c' 
     je SUBSTATEBHC
      
     cmp bl, 'd'
     je SUBSTATEBHD 
     cmp bl ,'v'
     je SUBSTATEBHV
     cmp bl , '['
     je SUBSTATEBHOFF
     jmp SUBERORR
     SUBSTATEBL:
      
     inc si
     inc si
     mov cl,[si]
     mov bx,[si]  
     cmp bl,'a'
     je SUBSTATEBLA
     
     cmp bl, 'b'
     je SUBSTATEBLBH
     
     cmp bl, 'c' 
     je SUBSTATEBLC
      
     cmp bl, 'd'
     je SUBSTATEBLD
      cmp bl ,'v'
     je SUBSTATEBLV 
     cmp bl,'['
     je SUBSTATEBLOFF 
      jmp SUBERORR
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
     SUBSTATECH:
      
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je SUBSTATECHA
     
     cmp bl, 'b'
     je SUBSTATECHB
     
     cmp bl, 'c' 
     je SUBSTATECHCl  
      
     cmp bl, 'd'
     je SUBSTATECHD 
       cmp bl ,'v'
       je SUBSTATECHV
       cmp bl ,'['
       je SUBSTATECHOFF
     jmp SUBERORR
     SUBSTATECL:
      
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je SUBSTATECLA
     
     cmp bl, 'b'
     je SUBSTATECLB
     
     cmp bl, 'c' 
     je SUBSTATECLCH    ;;
      
     cmp bl, 'd'
     je SUBSTATECLD 
     
     cmp bl ,'v'
       je SUBSTATECLV 
       cmp bl ,'['
       je SUBSTATECLOFF
       jmp SUBERORR
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
     SUBSTATEDH:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je SUBSTATEDHA
     
     cmp bl, 'b'
     je SUBSTATEDHB
     
     cmp bl, 'c' 
     je SUBSTATEDHC
      
     cmp bl, 'd'
     je SUBSTATEDHDL 
     cmp bl ,'v'
     je SUBSTATEDHV
     cmp bl, '['
     je SUBSTATEDHOFF
     jmp SUBERORR
     SUBSTATEDL:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je SUBSTATEDLA
     
     cmp bl, 'b'
     je SUBSTATEDLB
     
     cmp bl, 'c' 
     je SUBSTATEDLC
      
     cmp bl, 'd'
     je SUBSTATEDLDH   ;;
     
      cmp bl,'v'
     je SUBSTATEDLV
     cmp bl,'['
     je SUBSTATEDLOFF
     jmp SUBERORR
      
      
    ;_________________________________________________
      SUBSTATEAHB:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je SUBSTATEAHBL
      cmp bl,'h'
      je SUBSTATEAHBH
      
      SUBSTATEAHC:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je SUBSTATEAHCL
      cmp bl,'h'
      je SUBSTATEAHCH
      
      jmp SUBERORR
      SUBSTATEAHD:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je SUBSTATEAHDL
      cmp bl,'h'
      je SUBSTATEAHDH
      
      jmp SUBERORR
      SUBSTATEALB:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je SUBSTATEALBL
      cmp bl,'h'
      je SUBSTATEALBH
      
      jmp SUBERORR
      
      SUBSTATEALC:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je SUBSTATEALCL
      cmp bl,'h'
      je SUBSTATEALCH
      
      jmp SUBERORR
      SUBSTATEALD:
      inc si
      mov bx,[si]
      cmp  bl, 'l'
      je SUBSTATEALDL
      cmp bl, 'h'
      je SUBSTATEALDH
jmp SUBERORR
      SUBSTATEAHOFF:
      inc si 
      mov bx,[si]
      cmp bl, 'b'
      je SUBSTATEAHOFFBX
      cmp bl, 's'
      je SUBSTATEAHOFFSI
      cmp bl, 'd'
      je SUBSTATEAHOFFDI
      inc si
      mov bx,[si]
      cmp bl,'0'
      je SUBSTATEAHOFF0
      cmp bl,'1'
      je SUBSTATEAHOFF1
      cmp bl,'2'
      je SUBSTATEAHOFF2
      cmp bl,'3'
      je SUBSTATEAHOFF3
      cmp bl,'4'
      je SUBSTATEAHOFF4
      cmp bl,'5'
      je SUBSTATEAHOFF5
      cmp bl,'6'
      je SUBSTATEAHOFF6
      cmp bl,'7'
      je SUBSTATEAHOFF7
      cmp bl,'8'
      je SUBSTATEAHOFF8
      cmp bl,'9'
      je SUBSTATEAHOFF9
      cmp bl,'A'
      je SUBSTATEAHOFFA
      cmp bl,'B'
      je SUBSTATEAHOFFB
      cmp bl,'C'
      je SUBSTATEAHOFFC
      cmp bl,'D'
      je SUBSTATEAHOFFD
      cmp bl,'E'
      je SUBSTATEAHOFFE
      cmp bl,'F'
      je SUBSTATEAHOFFF
      jmp SUBERORR

      SUBSTATEAHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je SUBSTATEAHOFF0
      cmp bx,1h
      je SUBSTATEAHOFF1
      cmp bx,2h
      je SUBSTATEAHOFF2
      cmp bx,3h
      je SUBSTATEAHOFF3
      cmp bx,4h
      je SUBSTATEAHOFF4
      cmp bx,5h
      je SUBSTATEAHOFF5
      cmp bx,6h
      je SUBSTATEAHOFF6
      cmp bx,7h
      je SUBSTATEAHOFF7
      cmp bx,8h
      je SUBSTATEAHOFF8
      cmp bx,9h
      je SUBSTATEAHOFF9
      cmp bx,0Ah
      je SUBSTATEAHOFFA
      cmp bx,0bh
      je SUBSTATEAHOFFB
      cmp bx,0ch
      je SUBSTATEAHOFFC
      cmp bx,0dh
      je SUBSTATEAHOFFD
      cmp bx,0eh
      je SUBSTATEAHOFFE
      cmp bx,0fh
      je SUBSTATEAHOFFF
jmp SUBERORR
      SUBSTATEAHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je SUBSTATEAHOFF0
      cmp bx,1h
      je SUBSTATEAHOFF1
      cmp bx,2h
      je SUBSTATEAHOFF2
      cmp bx,3h
      je SUBSTATEAHOFF3
      cmp bx,4h
      je SUBSTATEAHOFF4
      cmp bx,5h
      je SUBSTATEAHOFF5
      cmp bx,6h
      je SUBSTATEAHOFF6
      cmp bx,7h
      je SUBSTATEAHOFF7
      cmp bx,8h
      je SUBSTATEAHOFF8
      cmp bx,9h
      je SUBSTATEAHOFF9
      cmp bx,0Ah
      je SUBSTATEAHOFFA
      cmp bx,0bh
      je SUBSTATEAHOFFB
      cmp bx,0ch
      je SUBSTATEAHOFFC
      cmp bx,0dh
      je SUBSTATEAHOFFD
      cmp bx,0eh
      je SUBSTATEAHOFFE
      cmp bx,0fh
      je SUBSTATEAHOFFF
jmp SUBERORR
SUBSTATEAHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je SUBSTATEAHOFF0
      cmp bx,1h
      je SUBSTATEAHOFF1
      cmp bx,2h
      je SUBSTATEAHOFF2
      cmp bx,3h
      je SUBSTATEAHOFF3
      cmp bx,4h
      je SUBSTATEAHOFF4
      cmp bx,5h
      je SUBSTATEAHOFF5
      cmp bx,6h
      je SUBSTATEAHOFF6
      cmp bx,7h
      je SUBSTATEAHOFF7
      cmp bx,8h
      je SUBSTATEAHOFF8
      cmp bx,9h
      je SUBSTATEAHOFF9
      cmp bx,0Ah
      je SUBSTATEAHOFFA
      cmp bx,0bh
      je SUBSTATEAHOFFB
      cmp bx,0ch
      je SUBSTATEAHOFFC
      cmp bx,0dh
      je SUBSTATEAHOFFD
      cmp bx,0eh
      je SUBSTATEAHOFFE
      cmp bx,0fh
      je SUBSTATEAHOFFF
jmp SUBERORR
;;
      SUBSTATEALOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je SUBSTATEALOFFBX
       cmp bl, 's'
      je SUBSTATEALOFFSI
       cmp bl, 'd'
      je SUBSTATEALOFFDI
      inc si 
      mov bx,[si]
       cmp bl,'0'
      je SUBSTATEALOFF0
      cmp bl,'1'
      je SUBSTATEALOFF1
      cmp bl,'2'
      je SUBSTATEALOFF2
      cmp bl,'3'
      je SUBSTATEALOFF3
      cmp bl,'4'
      je SUBSTATEALOFF4
      cmp bl,'5'
      je SUBSTATEALOFF5
      cmp bl,'6'
      je SUBSTATEALOFF6
      cmp bl,'7'
      je SUBSTATEALOFF7
      cmp bl,'8'
      je SUBSTATEALOFF8
      cmp bl,'9'
      je SUBSTATEALOFF9
      cmp bl,'A'
      je SUBSTATEALOFFA
      cmp bl,'B'
      je SUBSTATEALOFFB
      cmp bl,'C'
      je SUBSTATEALOFFC
      cmp bl,'D'
      je SUBSTATEALOFFD
      cmp bl,'E'
      je SUBSTATEALOFFE
      cmp bl,'F'
      je SUBSTATEALOFFF
jmp SUBERORR
      SUBSTATEALOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je SUBSTATEALOFF0
      cmp bx,1h
      je SUBSTATEALOFF1
      cmp bx,2h
      je SUBSTATEALOFF2
      cmp bx,3h
      je SUBSTATEALOFF3
      cmp bx,4h
      je SUBSTATEALOFF4
      cmp bx,5h
      je SUBSTATEALOFF5
      cmp bx,6h
      je SUBSTATEALOFF6
      cmp bx,7h
      je SUBSTATEALOFF7
      cmp bx,8h
      je SUBSTATEALOFF8
      cmp bx,9h
      je SUBSTATEALOFF9
      cmp bx,0Ah
      je SUBSTATEALOFFA
      cmp bx,0bh
      je SUBSTATEALOFFB
      cmp bx,0ch
      je SUBSTATEALOFFC
      cmp bx,0dh
      je SUBSTATEALOFFD
      cmp bx,0eh
      je SUBSTATEALOFFE
      cmp bx,0fh
      je SUBSTATEALOFFF
jmp SUBERORR
      SUBSTATEALOFFSI:
      mov bx,p1si
      cmp bx, 0
      je SUBSTATEALOFF0
      cmp bx,1h
      je SUBSTATEALOFF1
      cmp bx,2h
      je SUBSTATEALOFF2
      cmp bx,3h
      je SUBSTATEALOFF3
      cmp bx,4h
      je SUBSTATEALOFF4
      cmp bx,5h
      je SUBSTATEALOFF5
      cmp bx,6h
      je SUBSTATEALOFF6
      cmp bx,7h
      je SUBSTATEALOFF7
      cmp bx,8h
      je SUBSTATEALOFF8
      cmp bx,9h
      je SUBSTATEALOFF9
      cmp bx,0Ah
      je SUBSTATEALOFFA
      cmp bx,0bh
      je SUBSTATEALOFFB
      cmp bx,0ch
      je SUBSTATEALOFFC
      cmp bx,0dh
      je SUBSTATEALOFFD
      cmp bx,0eh
      je SUBSTATEALOFFE
      cmp bx,0fh
      je SUBSTATEALOFFF
jmp SUBERORR
SUBSTATEALOFFDI:
      mov bx,p1di
      cmp bx, 0
      je SUBSTATEALOFF0
      cmp bx,1h
      je SUBSTATEALOFF1
      cmp bx,2h
      je SUBSTATEALOFF2
      cmp bx,3h
      je SUBSTATEALOFF3
      cmp bx,4h
      je SUBSTATEALOFF4
      cmp bx,5h
      je SUBSTATEALOFF5
      cmp bx,6h
      je SUBSTATEALOFF6
      cmp bx,7h
      je SUBSTATEALOFF7
      cmp bx,8h
      je SUBSTATEALOFF8
      cmp bx,9h
      je SUBSTATEALOFF9
      cmp bx,0Ah
      je SUBSTATEALOFFA
      cmp bx,0bh
      je SUBSTATEALOFFB
      cmp bx,0ch
      je SUBSTATEALOFFC
      cmp bx,0dh
      je SUBSTATEALOFFD
      cmp bx,0eh
      je SUBSTATEALOFFE
      cmp bx,0fh
      je SUBSTATEALOFFF

jmp SUBERORR
;;;;;; BBBBBBB

      SUBSTATEBHOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je SUBSTATEBHOFFBX
      cmp bl, 's'
      je SUBSTATEBHOFFSI
      cmp bl, 'd'
      je SUBSTATEBHOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je SUBSTATEBHOFF0
      cmp bl,'1'
      je SUBSTATEBHOFF1
      cmp bl,'2'
      je SUBSTATEBHOFF2
      cmp bl,'3'
      je SUBSTATEBHOFF3
      cmp bl,'4'
      je SUBSTATEBHOFF4
      cmp bl,'5'
      je SUBSTATEBHOFF5
      cmp bl,'6'
      je SUBSTATEBHOFF6
      cmp bl,'7'
      je SUBSTATEBHOFF7
      cmp bl,'8'
      je SUBSTATEBHOFF8
      cmp bl,'9'
      je SUBSTATEBHOFF9
      cmp bl,'A'
      je SUBSTATEBHOFFA
      cmp bl,'B'
      je SUBSTATEBHOFFB
      cmp bl,'C'
      je SUBSTATEBHOFFC
      cmp bl,'D'
      je SUBSTATEBHOFFD
      cmp bl,'E'
      je SUBSTATEBHOFFE
      cmp bl,'F'
      je SUBSTATEBHOFFF
jmp SUBERORR
      SUBSTATEBHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je SUBSTATEBHOFF0
      cmp bx,1h
      je SUBSTATEBHOFF1
      cmp bx,2h
      je SUBSTATEBHOFF2
      cmp bx,3h
      je SUBSTATEBHOFF3
      cmp bx,4h
      je SUBSTATEBHOFF4
      cmp bx,5h
      je SUBSTATEBHOFF5
      cmp bx,6h
      je SUBSTATEBHOFF6
      cmp bx,7h
      je SUBSTATEBHOFF7
      cmp bx,8h
      je SUBSTATEBHOFF8
      cmp bx,9h
      je SUBSTATEBHOFF9
      cmp bx,0Ah
      je SUBSTATEBHOFFA
      cmp bx,0bh
      je SUBSTATEBHOFFB
      cmp bx,0ch
      je SUBSTATEBHOFFC
      cmp bx,0dh
      je SUBSTATEBHOFFD
      cmp bx,0eh
      je SUBSTATEBHOFFE
      cmp bx,0fh
      je SUBSTATEBHOFFF
jmp SUBERORR
      SUBSTATEBHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je SUBSTATEBHOFF0
      cmp bx,1h
      je SUBSTATEBHOFF1
      cmp bx,2h
      je SUBSTATEBHOFF2
      cmp bx,3h
      je SUBSTATEBHOFF3
      cmp bx,4h
      je SUBSTATEBHOFF4
      cmp bx,5h
      je SUBSTATEBHOFF5
      cmp bx,6h
      je SUBSTATEBHOFF6
      cmp bx,7h
      je SUBSTATEBHOFF7
      cmp bx,8h
      je SUBSTATEBHOFF8
      cmp bx,9h
      je SUBSTATEBHOFF9
      cmp bx,0Ah
      je SUBSTATEBHOFFA
      cmp bx,0bh
      je SUBSTATEBHOFFB
      cmp bx,0ch
      je SUBSTATEBHOFFC
      cmp bx,0dh
      je SUBSTATEBHOFFD
      cmp bx,0eh
      je SUBSTATEBHOFFE
      cmp bx,0fh
      je SUBSTATEBHOFFF
jmp SUBERORR
      SUBSTATEBHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je SUBSTATEBHOFF0
      cmp bx,1h
      je SUBSTATEBHOFF1
      cmp bx,2h
      je SUBSTATEBHOFF2
      cmp bx,3h
      je SUBSTATEBHOFF3
      cmp bx,4h
      je SUBSTATEBHOFF4
      cmp bx,5h
      je SUBSTATEBHOFF5
      cmp bx,6h
      je SUBSTATEBHOFF6
      cmp bx,7h
      je SUBSTATEBHOFF7
      cmp bx,8h
      je SUBSTATEBHOFF8
      cmp bx,9h
      je SUBSTATEBHOFF9
      cmp bx,0Ah
      je SUBSTATEBHOFFA
      cmp bx,0bh
      je SUBSTATEBHOFFB
      cmp bx,0ch
      je SUBSTATEBHOFFC
      cmp bx,0dh
      je SUBSTATEBHOFFD
      cmp bx,0eh
      je SUBSTATEBHOFFE
      cmp bx,0fh
      je SUBSTATEBHOFFF

jmp SUBERORR

;;
      SUBSTATEBLOFF:
      inc si
       mov bx,[si]
      cmp bl, 'b'
      je SUBSTATEBLOFFBX
      cmp bl, 's'
      je SUBSTATEBLOFFSI
      cmp bl, 'd'
      je SUBSTATEBLOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je SUBSTATEBLOFF0
      cmp bl,'1'
      je SUBSTATEBLOFF1
      cmp bl,'2'
      je SUBSTATEBLOFF2
      cmp bl,'3'
      je SUBSTATEBLOFF3
      cmp bl,'4'
      je SUBSTATEBLOFF4
      cmp bl,'5'
      je SUBSTATEBLOFF5
      cmp bl,'6'
      je SUBSTATEBLOFF6
      cmp bl,'7'
      je SUBSTATEBLOFF7
      cmp bl,'8'
      je SUBSTATEBLOFF8
      cmp bl,'9'
      je SUBSTATEBLOFF9
      cmp bl,'A'
      je SUBSTATEBLOFFA
      cmp bl,'B'
      je SUBSTATEBLOFFB
      cmp bl,'C'
      je SUBSTATEBLOFFC
      cmp bl,'D'
      je SUBSTATEBLOFFD
      cmp bl,'E'
      je SUBSTATEBLOFFE
      cmp bl,'F'
      je SUBSTATEBLOFFF

jmp SUBERORR

    SUBSTATEBLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je SUBSTATEBLOFF0
      cmp bx,1h
      je SUBSTATEBLOFF1
      cmp bx,2h
      je SUBSTATEBLOFF2
      cmp bx,3h
      je SUBSTATEBLOFF3
      cmp bx,4h
      je SUBSTATEBLOFF4
      cmp bx,5h
      je SUBSTATEBLOFF5
      cmp bx,6h
      je SUBSTATEBLOFF6
      cmp bx,7h
      je SUBSTATEBLOFF7
      cmp bx,8h
      je SUBSTATEBLOFF8
      cmp bx,9h
      je SUBSTATEBLOFF9
      cmp bx,0Ah
      je SUBSTATEBLOFFA
      cmp bx,0bh
      je SUBSTATEBLOFFB
      cmp bx,0ch
      je SUBSTATEBLOFFC
      cmp bx,0dh
      je SUBSTATEBLOFFD
      cmp bx,0eh
      je SUBSTATEBLOFFE
      cmp bx,0fh
      je SUBSTATEBLOFFF
jmp SUBERORR
      SUBSTATEBLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je SUBSTATEBLOFF0
      cmp bx,1h
      je SUBSTATEBLOFF1
      cmp bx,2h
      je SUBSTATEBLOFF2
      cmp bx,3h
      je SUBSTATEBLOFF3
      cmp bx,4h
      je SUBSTATEBLOFF4
      cmp bx,5h
      je SUBSTATEBLOFF5
      cmp bx,6h
      je SUBSTATEBLOFF6
      cmp bx,7h
      je SUBSTATEBLOFF7
      cmp bx,8h
      je SUBSTATEBLOFF8
      cmp bx,9h
      je SUBSTATEBLOFF9
      cmp bx,0Ah
      je SUBSTATEBLOFFA
      cmp bx,0bh
      je SUBSTATEBLOFFB
      cmp bx,0ch
      je SUBSTATEBLOFFC
      cmp bx,0dh
      je SUBSTATEBLOFFD
      cmp bx,0eh
      je SUBSTATEBLOFFE
      cmp bx,0fh
      je SUBSTATEBLOFFF
jmp SUBERORR
      SUBSTATEBLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je SUBSTATEBLOFF0
      cmp bx,1h
      je SUBSTATEBLOFF1
      cmp bx,2h
      je SUBSTATEBLOFF2
      cmp bx,3h
      je SUBSTATEBLOFF3
      cmp bx,4h
      je SUBSTATEBLOFF4
      cmp bx,5h
      je SUBSTATEBLOFF5
      cmp bx,6h
      je SUBSTATEBLOFF6
      cmp bx,7h
      je SUBSTATEBLOFF7
      cmp bx,8h
      je SUBSTATEBLOFF8
      cmp bx,9h
      je SUBSTATEBLOFF9
      cmp bx,0Ah
      je SUBSTATEBLOFFA
      cmp bx,0bh
      je SUBSTATEBLOFFB
      cmp bx,0ch
      je SUBSTATEBLOFFC
      cmp bx,0dh
      je SUBSTATEBLOFFD
      cmp bx,0eh
      je SUBSTATEBLOFFE
      cmp bx,0fh
      je SUBSTATEBLOFFF

jmp SUBERORR
      ;;CCCCCCCCCC

      SUBSTATECHOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je SUBSTATECHOFFBX
      cmp bl, 's'
      je SUBSTATECHOFFSI
      cmp bl, 'd'
      je SUBSTATECHOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je SUBSTATECHOFF0
      cmp bl,'1'
      je SUBSTATECHOFF1
      cmp bl,'2'
      je SUBSTATECHOFF2
      cmp bl,'3'
      je SUBSTATECHOFF3
      cmp bl,'4'
      je SUBSTATECHOFF4
      cmp bl,'5'
      je SUBSTATECHOFF5
      cmp bl,'6'
      je SUBSTATECHOFF6
      cmp bl,'7'
      je SUBSTATECHOFF7
      cmp bl,'8'
      je SUBSTATECHOFF8
      cmp bl,'9'
      je SUBSTATECHOFF9
      cmp bl,'A'
      je SUBSTATECHOFFA
      cmp bl,'B'
      je SUBSTATECHOFFB
      cmp bl,'C'
      je SUBSTATECHOFFC
      cmp bl,'D'
      je SUBSTATECHOFFD
      cmp bl,'E'
      je SUBSTATECHOFFE
      cmp bl,'F'
      je SUBSTATECHOFFF

jmp SUBERORR
      SUBSTATECHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je SUBSTATECHOFF0
      cmp bx,1h
      je SUBSTATECHOFF1
      cmp bx,2h
      je SUBSTATECHOFF2
      cmp bx,3h
      je SUBSTATECHOFF3
      cmp bx,4h
      je SUBSTATECHOFF4
      cmp bx,5h
      je SUBSTATECHOFF5
      cmp bx,6h
      je SUBSTATECHOFF6
      cmp bx,7h
      je SUBSTATECHOFF7
      cmp bx,8h
      je SUBSTATECHOFF8
      cmp bx,9h
      je SUBSTATECHOFF9
      cmp bx,0Ah
      je SUBSTATECHOFFA
      cmp bx,0bh
      je SUBSTATECHOFFB
      cmp bx,0ch
      je SUBSTATECHOFFC
      cmp bx,0dh
      je SUBSTATECHOFFD
      cmp bx,0eh
      je SUBSTATECHOFFE
      cmp bx,0fh
      je SUBSTATECHOFFF
jmp SUBERORR
      SUBSTATECHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je SUBSTATECHOFF0
      cmp bx,1h
      je SUBSTATECHOFF1
      cmp bx,2h
      je SUBSTATECHOFF2
      cmp bx,3h
      je SUBSTATECHOFF3
      cmp bx,4h
      je SUBSTATECHOFF4
      cmp bx,5h
      je SUBSTATECHOFF5
      cmp bx,6h
      je SUBSTATECHOFF6
      cmp bx,7h
      je SUBSTATECHOFF7
      cmp bx,8h
      je SUBSTATECHOFF8
      cmp bx,9h
      je SUBSTATECHOFF9
      cmp bx,0Ah
      je SUBSTATECHOFFA
      cmp bx,0bh
      je SUBSTATECHOFFB
      cmp bx,0ch
      je SUBSTATECHOFFC
      cmp bx,0dh
      je SUBSTATECHOFFD
      cmp bx,0eh
      je SUBSTATECHOFFE
      cmp bx,0fh
      je SUBSTATECHOFFF
jmp SUBERORR
      SUBSTATECHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je SUBSTATECHOFF0
      cmp bx,1h
      je SUBSTATECHOFF1
      cmp bx,2h
      je SUBSTATECHOFF2
      cmp bx,3h
      je SUBSTATECHOFF3
      cmp bx,4h
      je SUBSTATECHOFF4
      cmp bx,5h
      je SUBSTATECHOFF5
      cmp bx,6h
      je SUBSTATECHOFF6
      cmp bx,7h
      je SUBSTATECHOFF7
      cmp bx,8h
      je SUBSTATECHOFF8
      cmp bx,9h
      je SUBSTATECHOFF9
      cmp bx,0Ah
      je SUBSTATECHOFFA
      cmp bx,0bh
      je SUBSTATECHOFFB
      cmp bx,0ch
      je SUBSTATECHOFFC
      cmp bx,0dh
      je SUBSTATECHOFFD
      cmp bx,0eh
      je SUBSTATECHOFFE
      cmp bx,0fh
      je SUBSTATECHOFFF
jmp SUBERORR

;;
      SUBSTATECLOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je SUBSTATECLOFFBX
      cmp bl, 's'
      je SUBSTATECLOFFSI
      cmp bl, 'd'
      je SUBSTATECLOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je SUBSTATECLOFF0
      cmp bl,'1'
      je SUBSTATECLOFF1
      cmp bl,'2'
      je SUBSTATECLOFF2
      cmp bl,'3'
      je SUBSTATECLOFF3
      cmp bl,'4'
      je SUBSTATECLOFF4
      cmp bl,'5'
      je SUBSTATECLOFF5
      cmp bl,'6'
      je SUBSTATECLOFF6
      cmp bl,'7'
      je SUBSTATECLOFF7
      cmp bl,'8'
      je SUBSTATECLOFF8
      cmp bl,'9'
      je SUBSTATECLOFF9
      cmp bl,'A'
      je SUBSTATECLOFFA
      cmp bl,'B'
      je SUBSTATECLOFFB
      cmp bl,'C'
      je SUBSTATECLOFFC
      cmp bl,'D'
      je SUBSTATECLOFFD
      cmp bl,'E'
      je SUBSTATECLOFFE
      cmp bl,'F'
      je SUBSTATECLOFFF
jmp SUBERORR
      
      SUBSTATECLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je SUBSTATECLOFF0
      cmp bx,1h
      je SUBSTATECLOFF1
      cmp bx,2h
      je SUBSTATECLOFF2
      cmp bx,3h
      je SUBSTATECLOFF3
      cmp bx,4h
      je SUBSTATECLOFF4
      cmp bx,5h
      je SUBSTATECLOFF5
      cmp bx,6h
      je SUBSTATECLOFF6
      cmp bx,7h
      je SUBSTATECLOFF7
      cmp bx,8h
      je SUBSTATECLOFF8
      cmp bx,9h
      je SUBSTATECLOFF9
      cmp bx,0Ah
      je SUBSTATECLOFFA
      cmp bx,0bh
      je SUBSTATECLOFFB
      cmp bx,0ch
      je SUBSTATECLOFFC
      cmp bx,0dh
      je SUBSTATECLOFFD
      cmp bx,0eh
      je SUBSTATECLOFFE
      cmp bx,0fh
      je SUBSTATECLOFFF
jmp SUBERORR
      SUBSTATECLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je SUBSTATECLOFF0
      cmp bx,1h
      je SUBSTATECLOFF1
      cmp bx,2h
      je SUBSTATECLOFF2
      cmp bx,3h
      je SUBSTATECLOFF3
      cmp bx,4h
      je SUBSTATECLOFF4
      cmp bx,5h
      je SUBSTATECLOFF5
      cmp bx,6h
      je SUBSTATECLOFF6
      cmp bx,7h
      je SUBSTATECLOFF7
      cmp bx,8h
      je SUBSTATECLOFF8
      cmp bx,9h
      je SUBSTATECLOFF9
      cmp bx,0Ah
      je SUBSTATECLOFFA
      cmp bx,0bh
      je SUBSTATECLOFFB
      cmp bx,0ch
      je SUBSTATECLOFFC
      cmp bx,0dh
      je SUBSTATECLOFFD
      cmp bx,0eh
      je SUBSTATECLOFFE
      cmp bx,0fh
      je SUBSTATECLOFFF
jmp SUBERORR
      SUBSTATECLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je SUBSTATECLOFF0
      cmp bx,1h
      je SUBSTATECLOFF1
      cmp bx,2h
      je SUBSTATECLOFF2
      cmp bx,3h
      je SUBSTATECLOFF3
      cmp bx,4h
      je SUBSTATECLOFF4
      cmp bx,5h
      je SUBSTATECLOFF5
      cmp bx,6h
      je SUBSTATECLOFF6
      cmp bx,7h
      je SUBSTATECLOFF7
      cmp bx,8h
      je SUBSTATECLOFF8
      cmp bx,9h
      je SUBSTATECLOFF9
      cmp bx,0Ah
      je SUBSTATECLOFFA
      cmp bx,0bh
      je SUBSTATECLOFFB
      cmp bx,0ch
      je SUBSTATECLOFFC
      cmp bx,0dh
      je SUBSTATECLOFFD
      cmp bx,0eh
      je SUBSTATECLOFFE
      cmp bx,0fh
      je SUBSTATECLOFFF

jmp SUBERORR

;;;;DDDDDDDDDDDDDDDD
 SUBSTATEDHOFF:
      inc si 
      mov bx,[si]
      cmp bl, 'b'
      je SUBSTATEDHOFFBX
      cmp bl, 's'
      je SUBSTATEDHOFFSI
      cmp bl, 'd'
      je SUBSTATEDHOFFDI
      inc si
      mov bx,[si]
      cmp bl,'0'
      je SUBSTATEDHOFF0
      cmp bl,'1'
      je SUBSTATEDHOFF1
      cmp bl,'2'
      je SUBSTATEDHOFF2
      cmp bl,'3'
      je SUBSTATEDHOFF3
      cmp bl,'4'
      je SUBSTATEDHOFF4
      cmp bl,'5'
      je SUBSTATEDHOFF5
      cmp bl,'6'
      je SUBSTATEDHOFF6
      cmp bl,'7'
      je SUBSTATEDHOFF7
      cmp bl,'8'
      je SUBSTATEDHOFF8
      cmp bl,'9'
      je SUBSTATEDHOFF9
      cmp bl,'A'
      je SUBSTATEDHOFFA
      cmp bl,'B'
      je SUBSTATEDHOFFB
      cmp bl,'C'
      je SUBSTATEDHOFFC
      cmp bl,'D'
      je SUBSTATEDHOFFD
      cmp bl,'E'
      je SUBSTATEDHOFFE
      cmp bl,'F'
      je SUBSTATEDHOFFF
jmp SUBERORR

      SUBSTATEDHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je SUBSTATEDHOFF0
      cmp bx,1h
      je SUBSTATEDHOFF1
      cmp bx,2h
      je SUBSTATEDHOFF2
      cmp bx,3h
      je SUBSTATEDHOFF3
      cmp bx,4h
      je SUBSTATEDHOFF4
      cmp bx,5h
      je SUBSTATEDHOFF5
      cmp bx,6h
      je SUBSTATEDHOFF6
      cmp bx,7h
      je SUBSTATEDHOFF7
      cmp bx,8h
      je SUBSTATEDHOFF8
      cmp bx,9h
      je SUBSTATEDHOFF9
      cmp bx,0Ah
      je SUBSTATEDHOFFA
      cmp bx,0bh
      je SUBSTATEDHOFFB
      cmp bx,0ch
      je SUBSTATEDHOFFC
      cmp bx,0dh
      je SUBSTATEDHOFFD
      cmp bx,0eh
      je SUBSTATEDHOFFE
      cmp bx,0fh
      je SUBSTATEDHOFFF
jmp SUBERORR
      SUBSTATEDHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je SUBSTATEDHOFF0
      cmp bx,1h
      je SUBSTATEDHOFF1
      cmp bx,2h
      je SUBSTATEDHOFF2
      cmp bx,3h
      je SUBSTATEDHOFF3
      cmp bx,4h
      je SUBSTATEDHOFF4
      cmp bx,5h
      je SUBSTATEDHOFF5
      cmp bx,6h
      je SUBSTATEDHOFF6
      cmp bx,7h
      je SUBSTATEDHOFF7
      cmp bx,8h
      je SUBSTATEDHOFF8
      cmp bx,9h
      je SUBSTATEDHOFF9
      cmp bx,0Ah
      je SUBSTATEDHOFFA
      cmp bx,0bh
      je SUBSTATEDHOFFB
      cmp bx,0ch
      je SUBSTATEDHOFFC
      cmp bx,0dh
      je SUBSTATEDHOFFD
      cmp bx,0eh
      je SUBSTATEDHOFFE
      cmp bx,0fh
      je SUBSTATEDHOFFF
jmp SUBERORR
      SUBSTATEDHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je SUBSTATEDHOFF0
      cmp bx,1h
      je SUBSTATEDHOFF1
      cmp bx,2h
      je SUBSTATEDHOFF2
      cmp bx,3h
      je SUBSTATEDHOFF3
      cmp bx,4h
      je SUBSTATEDHOFF4
      cmp bx,5h
      je SUBSTATEDHOFF5
      cmp bx,6h
      je SUBSTATEDHOFF6
      cmp bx,7h
      je SUBSTATEDHOFF7
      cmp bx,8h
      je SUBSTATEDHOFF8
      cmp bx,9h
      je SUBSTATEDHOFF9
      cmp bx,0Ah
      je SUBSTATEDHOFFA
      cmp bx,0bh
      je SUBSTATEDHOFFB
      cmp bx,0ch
      je SUBSTATEDHOFFC
      cmp bx,0dh
      je SUBSTATEDHOFFD
      cmp bx,0eh
      je SUBSTATEDHOFFE
      cmp bx,0fh
      je SUBSTATEDHOFFF
jmp SUBERORR



;;
      SUBSTATEDLOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je SUBSTATEDLOFFBX
      cmp bl, 's'
      je SUBSTATEDLOFFSI
      cmp bl, 'd'
      je SUBSTATEDLOFFDI
      inc si 
      mov bx,[si]
       cmp bl,'0'
      je SUBSTATEDLOFF0
      cmp bl,'1'
      je SUBSTATEDLOFF1
      cmp bl,'2'
      je SUBSTATEDLOFF2
      cmp bl,'3'
      je SUBSTATEDLOFF3
      cmp bl,'4'
      je SUBSTATEDLOFF4
      cmp bl,'5'
      je SUBSTATEDLOFF5
      cmp bl,'6'
      je SUBSTATEDLOFF6
      cmp bl,'7'
      je SUBSTATEDLOFF7
      cmp bl,'8'
      je SUBSTATEDLOFF8
      cmp bl,'9'
      je SUBSTATEDLOFF9
      cmp bl,'A'
      je SUBSTATEDLOFFA
      cmp bl,'B'
      je SUBSTATEDLOFFB
      cmp bl,'C'
      je SUBSTATEDLOFFC
      cmp bl,'D'
      je SUBSTATEDLOFFD
      cmp bl,'E'
      je SUBSTATEDLOFFE
      cmp bl,'F'
      je SUBSTATEDLOFFF
jmp SUBERORR
      
      SUBSTATEDLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je SUBSTATEDLOFF0
      cmp bx,1h
      je SUBSTATEDLOFF1
      cmp bx,2h
      je SUBSTATEDLOFF2
      cmp bx,3h
      je SUBSTATEDLOFF3
      cmp bx,4h
      je SUBSTATEDLOFF4
      cmp bx,5h
      je SUBSTATEDLOFF5
      cmp bx,6h
      je SUBSTATEDLOFF6
      cmp bx,7h
      je SUBSTATEDLOFF7
      cmp bx,8h
      je SUBSTATEDLOFF8
      cmp bx,9h
      je SUBSTATEDLOFF9
      cmp bx,0Ah
      je SUBSTATEDLOFFA
      cmp bx,0bh
      je SUBSTATEDLOFFB
      cmp bx,0ch
      je SUBSTATEDLOFFC
      cmp bx,0dh
      je SUBSTATEDLOFFD
      cmp bx,0eh
      je SUBSTATEDLOFFE
      cmp bx,0fh
      je SUBSTATEDLOFFF
jmp SUBERORR
      SUBSTATEDLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je SUBSTATEDLOFF0
      cmp bx,1h
      je SUBSTATEDLOFF1
      cmp bx,2h
      je SUBSTATEDLOFF2
      cmp bx,3h
      je SUBSTATEDLOFF3
      cmp bx,4h
      je SUBSTATEDLOFF4
      cmp bx,5h
      je SUBSTATEDLOFF5
      cmp bx,6h
      je SUBSTATEDLOFF6
      cmp bx,7h
      je SUBSTATEDLOFF7
      cmp bx,8h
      je SUBSTATEDLOFF8
      cmp bx,9h
      je SUBSTATEDLOFF9
      cmp bx,0Ah
      je SUBSTATEDLOFFA
      cmp bx,0bh
      je SUBSTATEDLOFFB
      cmp bx,0ch
      je SUBSTATEDLOFFC
      cmp bx,0dh
      je SUBSTATEDLOFFD
      cmp bx,0eh
      je SUBSTATEDLOFFE
      cmp bx,0fh
      je SUBSTATEDLOFFF
jmp SUBERORR
      SUBSTATEDLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je SUBSTATEDLOFF0
      cmp bx,1h
      je SUBSTATEDLOFF1
      cmp bx,2h
      je SUBSTATEDLOFF2
      cmp bx,3h
      je SUBSTATEDLOFF3
      cmp bx,4h
      je SUBSTATEDLOFF4
      cmp bx,5h
      je SUBSTATEDLOFF5
      cmp bx,6h
      je SUBSTATEDLOFF6
      cmp bx,7h
      je SUBSTATEDLOFF7
      cmp bx,8h
      je SUBSTATEDLOFF8
      cmp bx,9h
      je SUBSTATEDLOFF9
      cmp bx,0Ah
      je SUBSTATEDLOFFA
      cmp bx,0bh
      je SUBSTATEDLOFFB
      cmp bx,0ch
      je SUBSTATEDLOFFC
      cmp bx,0dh
      je SUBSTATEDLOFFD
      cmp bx,0eh
      je SUBSTATEDLOFFE
      cmp bx,0fh
      je SUBSTATEDLOFFF
jmp SUBERORR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; copy under
      

      

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      
      SUBSTATEBHA:
      inc si
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATEBHAL
      cmp bl,'h'
      je SUBSTATEBHAH
      jmp SUBERORR
      SUBSTATEBHC:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je SUBSTATEBHCL
      cmp bl,'h'
      je SUBSTATEBHCH
      jmp SUBERORR
      SUBSTATEBHD:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je SUBSTATEBHDL
      cmp bl,'h'
      je SUBSTATEBHDH 
      jmp SUBERORR
      
      
      
      SUBSTATEBLA:
      inc si
      mov bx,[si]
        cmp bl,'l'
      je SUBSTATEBLAL
      cmp bl,'h'
      je SUBSTATEBlAH
      jmp SUBERORR
      SUBSTATEBLC:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je SUBSTATEBLCL
      cmp bl,'h'
      je SUBSTATEBLCH
      jmp SUBERORR
      SUBSTATEBLD:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je SUBSTATEBLDL
      cmp bl,'h'
      je SUBSTATEBLDH 
      jmp SUBERORR
      
      
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
      SUBSTATECHA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATECHAL    
      cmp bl, 'h'
      je SUBSTATECHAH  
      jmp SUBERORR
       SUBSTATECHB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATECHBL      
      cmp bl, 'h'
      je SUBSTATECHBH        
      jmp SUBERORR
      
      SUBSTATECHD:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATECHDL            
      cmp bl, 'h'           
      je SUBSTATECHDH              
      
      jmp SUBERORR
      
      
      SUBSTATECLA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATECLAL    
      cmp bl, 'h'
      je SUBSTATECLAH  
      jmp SUBERORR
       SUBSTATECLB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATECLBL    
      cmp bl, 'h'
      je SUBSTATECLBH        
      jmp SUBERORR
      
      SUBSTATECLD:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATECLDL            
      cmp bl, 'h'           
      je SUBSTATECLDH     
      jmp SUBERORR
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
      SUBSTATEDHA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATEDHAL    
      cmp bl, 'h'
      je SUBSTATEDHAH  
      jmp SUBERORR
      SUBSTATEDHB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATEDHBL    
      cmp bl, 'h'
      je SUBSTATEDHBH   
      jmp SUBERORR
      SUBSTATEDHC:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATEDHCL   
      cmp bl, 'h'
      je SUBSTATEDHCH 
      jmp SUBERORR
      
       SUBSTATEDLA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATEDLAL    
      cmp bl, 'h'
      je SUBSTATEDLAH  
      jmp SUBERORR
      SUBSTATEDLB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATEDLBL    
      cmp bl, 'h'
      je SUBSTATEDLBH   
      jmp SUBERORR
      SUBSTATEDLC:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je SUBSTATEDLCL    
      cmp bl, 'h'
      je SUBSTATEDLCH  
      
      jmp SUBERORR
      
      
      
    ;------------------------------------------------
     
      
    ;---------------------------------------------
    
    SUBSTATESI:
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATESIAX
    cmp bl,'b'
    je SUBSTATESIB
    cmp bl,'c'
    je SUBSTATESICX
    cmp bl,'d'
    je SUBSTATESID
    cmp bl,'s'
    je SUBSTATESISP
    jmp SUBERORR
    SUBSTATESIB:
    inc si
    mov bx ,[si]
    cmp bl ,'p'
    je SUBSTATESIBP
    cmp bl,'x'
    je SUBSTATESIBX
jmp SUBERORR
    SUBSTATESID:
    inc si 
    mov bx,[si]
    cmp bl, 'x'
    je SUBSTATESIDX
    cmp bl,'p'
    je SUBSTATESIDI
jmp SUBERORR
    ;;;;;;;;;
    SUBSTATESP:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATESPAX ;
    cmp bl ,'c'
    je SUBSTATESPCX ;
    cmp bl ,'b'
    je SUBSTATESPB
    cmp bl,'d'
    je SUBSTATESPD
    cmp bl,'s'
    je SUBSTATESPSI ;
jmp SUBERORR
    SUBSTATESPB:
    inc si
    mov bx,[si]
    cmp bl,'x'
    je SUBSTATESPBX ;
    cmp bl, 'p'
    je SUBSTATESPBP ;
jmp SUBERORR
    SUBSTATESPD:
    inc si 
    mov bx,[si]
    cmp bl,'x'
    je SUBSTATESPDX;
    cmp bl,'i'
    je SUBSTATESPDI;
jmp SUBERORR
;;;;;;;;;;;
SUBSTATEDI:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEDIAX ;
    cmp bl ,'c'
    je SUBSTATEDICX ;
    cmp bl ,'b'
    je SUBSTATEDIB
    cmp bl,'d'
    je SUBSTATEDIDX ; 
    cmp bl, 's'
    je SUBSTATEDIS
jmp SUBERORR
    SUBSTATEDIB:
    inc si
    mov bx,[si]
    cmp bl,'x'
    je SUBSTATEDIBX ;
    cmp bl, 'p'
    je SUBSTATEDIBP ;
jmp SUBERORR
    SUBSTATEDIS:
    inc si
    mov bx,[si]
    cmp bl, 'i'
    je SUBSTATEDISI;
    cmp bl, 'p'
    je SUBSTATEDISP;

jmp SUBERORR
    ;;;;;;;;;;;
    SUBSTATEBP:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEBPAX ;
    cmp bl ,'c'
    je SUBSTATEBPCX ;
    cmp bl ,'b'
    je SUBSTATEBPBX ;
    cmp bl,'d'
    je SUBSTATEBPD
    cmp bl, 's'
    je SUBSTATEBPS
jmp SUBERORR
    SUBSTATEBPD:
    inc si
    mov bx,[si]
    cmp bl ,'x'
    je SUBSTATEBPDX;
    cmp bl ,'i'
    je SUBSTATEBPDI;
jmp SUBERORR
    SUBSTATEBPS:
    inc si
    mov bx,[si]
    cmp bl ,'i'
    je SUBSTATEBPSI;
    cmp bl,'p'
    je SUBSTATEBPSP;
jmp SUBERORR
   ;vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
   
   SUBSTATEAXV:
   
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW
   sub al,7
   SUBBELOW:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW2
   sub al,7
   SUBBELOW2:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe SUBBELOW3
   sub al,7
   SUBBELOW3:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW4
   sub al,7
   SUBBELOW4:
   sub al,30h
   add bl,al    
   
   sub p1ax,bx
    jmp exitSUB
  
   SUBSTATEBXV:
    inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW5
   sub al,7
   SUBBELOW5:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW6
   sub al,7
   SUBBELOW6:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe SUBBELOW7
   sub al,7
   SUBBELOW7:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW8
   sub al,7
   SUBBELOW8:
   sub al,30h
   add bl,al    
   
   sub p1bx,bx
    jmp exitSUB
    
    
   SUBSTATEDXV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW9
   sub al,7
   SUBBELOW9:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW10
   sub al,7
   SUBBELOW10:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe SUBBELOW11
   sub al,7
   SUBBELOW11:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW12
   sub al,7
   SUBBELOW12:
   sub al,30h
   add bl,al    
   
   sub p1dx,bx
    jmp exitSUB
    
    
    
   SUBSTATECXV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW13
   sub al,7
   SUBBELOW13:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW14
   sub al,7
   SUBBELOW14:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe SUBBELOW15
   sub al,7
   SUBBELOW15:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW16
   sub al,7
   SUBBELOW16:
   sub al,30h
   add bl,al    
   
   sub p1cx,bx
   jmp exitSUB
      
    
    
   SUBSTATEAHV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW17
   sub al,7
   SUBBELOW17:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW18
   sub al,7
   SUBBELOW18:
   sub al,30h
   add bh,al
   sub p1ah,bh
    jmp exitSUB
    
    
   SUBSTATEALV:
   mov cl,56h
  
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW19
   sub al,7
   SUBBELOW19:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW20
   sub al,7
   SUBBELOW20:
   sub al,30h
   add bh,al 

   sub p1al,bh
   jmp exitSUB
   
     
   SUBSTATEBHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW21
   sub al,7
   SUBBELOW21:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW22
   sub al,7
   SUBBELOW22:
   sub al,30h
   add bh,al 
   sub p1bh,bh
   jmp exitSUB
   
     
   SUBSTATEBLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW23
   sub al,7
   SUBBELOW23:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW24
   sub al,7
   SUBBELOW24:
   sub al,30h
   add bh,al 
   sub p1bl,bh
   jmp exitSUB
   
     
   SUBSTATECHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW25
   sub al,7
   SUBBELOW25:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW26
   sub al,7
   SUBBELOW26:
   sub al,30h
   add bh,al 
   sub p1ch,bh
   jmp exitSUB
   
     
   SUBSTATECLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW27
   sub al,7
   SUBBELOW27:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW28
   sub al,7
   SUBBELOW28:
   sub al,30h
   add bh,al 
   sub p1cl,bh
   jmp exitSUB
   
     
   SUBSTATEDHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW29
   sub al,7
   SUBBELOW29:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW30
   sub al,7
   SUBBELOW30:
   sub al,30h
   add bh,al 
   sub p1dh,bh
   jmp exitSUB
   
     
   SUBSTATEDLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW31
   sub al,7
   SUBBELOW31:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe SUBBELOW32
   sub al,7
   SUBBELOW32:
   sub al,30h
   add bh,al 
   sub p1dl,bh
   jmp exitSUB
    
   ;vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv 
    
    ;OFFFFFFFFFFFFFFFF
    SUBSTATEOFF0:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF0A
    cmp bl, 'b'
    je SUBSTATEOFF0B
    cmp bl, 'c'
    je SUBSTATEOFF0C
    cmp bl, 'd'
    je SUBSTATEOFF0D
jmp SUBERORR
    ;

    SUBSTATEOFF1:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF1A
    cmp bl, 'b'
    je SUBSTATEOFF1B
    cmp bl, 'c'
    je SUBSTATEOFF1C
    cmp bl, 'd'
    je SUBSTATEOFF1D
jmp SUBERORR
;

    SUBSTATEOFF2:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF2A
    cmp bl, 'b'
    je SUBSTATEOFF2B
    cmp bl, 'c'
    je SUBSTATEOFF2C
    cmp bl, 'd'
    je SUBSTATEOFF2D
jmp SUBERORR
;

    SUBSTATEOFF3:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF3A
    cmp bl, 'b'
    je SUBSTATEOFF3B
    cmp bl, 'c'
    je SUBSTATEOFF3C
    cmp bl, 'd'
    je SUBSTATEOFF3D
jmp SUBERORR
    ;
    SUBSTATEOFF4:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF4A
    cmp bl, 'b'
    je SUBSTATEOFF4B
    cmp bl, 'c'
    je SUBSTATEOFF4C
    cmp bl, 'd'
    je SUBSTATEOFF4D
jmp SUBERORR
SUBSTATEOFF5:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF5A
    cmp bl, 'b'
    je SUBSTATEOFF5B
    cmp bl, 'c'
    je SUBSTATEOFF5C
    cmp bl, 'd'
    je SUBSTATEOFF5D
jmp SUBERORR
;
SUBSTATEOFF6:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF6A
    cmp bl, 'b'
    je SUBSTATEOFF6B
    cmp bl, 'c'
    je SUBSTATEOFF6C
    cmp bl, 'd'
    je SUBSTATEOFF6D

jmp SUBERORR
;


SUBSTATEOFF7:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF7A
    cmp bl, 'b'
    je SUBSTATEOFF7B
    cmp bl, 'c'
    je SUBSTATEOFF7C
    cmp bl, 'd'
    je SUBSTATEOFF7D
jmp SUBERORR
    ;

    SUBSTATEOFF8:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF8A
    cmp bl, 'b'
    je SUBSTATEOFF8B
    cmp bl, 'c'
    je SUBSTATEOFF8C
    cmp bl, 'd'
    je SUBSTATEOFF8D
jmp SUBERORR
  SUBSTATEOFF9:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFF9A
    cmp bl, 'b'
    je SUBSTATEOFF9B
    cmp bl, 'c'
    je SUBSTATEOFF9C
    cmp bl, 'd'
    je SUBSTATEOFF9D
jmp SUBERORR
    ;

    SUBSTATEOFFA:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFFAA
    cmp bl, 'b'
    je SUBSTATEOFFAB
    cmp bl, 'c'
    je SUBSTATEOFFAC
    cmp bl, 'd'
    je SUBSTATEOFFAD
jmp SUBERORR
SUBSTATEOFFB:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFFBA
    cmp bl, 'b'
    je SUBSTATEOFFBB
    cmp bl, 'c'
    je SUBSTATEOFFBC
    cmp bl, 'd'
    je SUBSTATEOFFBD
jmp SUBERORR
SUBSTATEOFFC:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFFCA
    cmp bl, 'b'
    je SUBSTATEOFFCB
    cmp bl, 'c'
    je SUBSTATEOFFCC
    cmp bl, 'd'
    je SUBSTATEOFFCD
jmp SUBERORR

SUBSTATEOFFD:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFFDA
    cmp bl, 'b'
    je SUBSTATEOFFDB
    cmp bl, 'c'
    je SUBSTATEOFFDC
    cmp bl, 'd'
    je SUBSTATEOFFDD
jmp SUBERORR
SUBSTATEOFFE:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFFEA
    cmp bl, 'b'
    je SUBSTATEOFFEB
    cmp bl, 'c'
    je SUBSTATEOFFEC
    cmp bl, 'd'
    je SUBSTATEOFFED
jmp SUBERORR
SUBSTATEOFFF:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je SUBSTATEOFFFA
    cmp bl, 'b'
    je SUBSTATEOFFFB
    cmp bl, 'c'
    je SUBSTATEOFFFC
    cmp bl, 'd'
    je SUBSTATEOFFFD
    jmp SUBERORR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    SUBSTATEOFF0A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF0AH
    cmp bl,'l'
    je SUBSTATEOFF0AL
jmp SUBERORR
    SUBSTATEOFF0B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF0BH
    cmp bl,'l'
    je SUBSTATEOFF0BL
jmp SUBERORR
    SUBSTATEOFF0C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF0CH
    cmp bl,'l'
    je SUBSTATEOFF0CL
jmp SUBERORR
    SUBSTATEOFF0D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF0DH
    cmp bl,'l'
    je SUBSTATEOFF0DL
jmp SUBERORR

    SUBSTATEOFF1A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF1AH
    cmp bl,'l'
    je SUBSTATEOFF1AL
jmp SUBERORR
    SUBSTATEOFF1B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF1BH
    cmp bl,'l'
    je SUBSTATEOFF1BL
jmp SUBERORR
    SUBSTATEOFF1C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF1CH
    cmp bl,'l'
    je SUBSTATEOFF1CL
jmp SUBERORR
    SUBSTATEOFF1D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF1DH
    cmp bl,'l'
    je SUBSTATEOFF1DL
jmp SUBERORR

    ;
    SUBSTATEOFF2A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF2AH
    cmp bl,'l'
    je SUBSTATEOFF2AL
jmp SUBERORR
    SUBSTATEOFF2B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF2BH
    cmp bl,'l'
    je SUBSTATEOFF2BL
jmp SUBERORR
    SUBSTATEOFF2C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF2CH
    cmp bl,'l'
    je SUBSTATEOFF2CL
jmp SUBERORR
    SUBSTATEOFF2D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF2DH
    cmp bl,'l'
    je SUBSTATEOFF2DL
jmp SUBERORR
;

SUBSTATEOFF3A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF3AH
    cmp bl,'l'
    je SUBSTATEOFF3AL
jmp SUBERORR
    SUBSTATEOFF3B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF3BH
    cmp bl,'l'
    je SUBSTATEOFF3BL
jmp SUBERORR
    SUBSTATEOFF3C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF3CH
    cmp bl,'l'
    je SUBSTATEOFF3CL
jmp SUBERORR
    SUBSTATEOFF3D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF3DH
    cmp bl,'l'
    je SUBSTATEOFF3DL
jmp SUBERORR
SUBSTATEOFF4A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF4AH
    cmp bl,'l'
    je SUBSTATEOFF4AL
jmp SUBERORR
    SUBSTATEOFF4B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF4BH
    cmp bl,'l'
    je SUBSTATEOFF4BL
jmp SUBERORR
    SUBSTATEOFF4C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF4CH
    cmp bl,'l'
    je SUBSTATEOFF4CL
jmp SUBERORR
    SUBSTATEOFF4D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF4DH
    cmp bl,'l'
    je SUBSTATEOFF4DL
jmp SUBERORR
SUBSTATEOFF5A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF5AH
    cmp bl,'l'
    je SUBSTATEOFF5AL
jmp SUBERORR
    SUBSTATEOFF5B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF5BH
    cmp bl,'l'
    je SUBSTATEOFF5BL
jmp SUBERORR
    SUBSTATEOFF5C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF5CH
    cmp bl,'l'
    je SUBSTATEOFF5CL
jmp SUBERORR
    SUBSTATEOFF5D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF5DH
    cmp bl,'l'
    je SUBSTATEOFF5DL
jmp SUBERORR
SUBSTATEOFF6A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF6AH
    cmp bl,'l'
    je SUBSTATEOFF6AL
jmp SUBERORR
    SUBSTATEOFF6B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF6BH
    cmp bl,'l'
    je SUBSTATEOFF6BL
jmp SUBERORR
    SUBSTATEOFF6C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF6CH
    cmp bl,'l'
    je SUBSTATEOFF6CL
jmp SUBERORR
    SUBSTATEOFF6D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF6DH
    cmp bl,'l'
    je SUBSTATEOFF6DL
jmp SUBERORR
SUBSTATEOFF7A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF7AH
    cmp bl,'l'
    je SUBSTATEOFF7AL
jmp SUBERORR
    SUBSTATEOFF7B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF7BH
    cmp bl,'l'
    je SUBSTATEOFF7BL
jmp SUBERORR
    SUBSTATEOFF7C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF7CH
    cmp bl,'l'
    je SUBSTATEOFF7CL
jmp SUBERORR
    SUBSTATEOFF7D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF7DH
    cmp bl,'l'
    je SUBSTATEOFF7DL
jmp SUBERORR
SUBSTATEOFF8A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF8AH
    cmp bl,'l'
    je SUBSTATEOFF8AL
jmp SUBERORR
    SUBSTATEOFF8B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF8BH
    cmp bl,'l'
    je SUBSTATEOFF8BL
jmp SUBERORR
    SUBSTATEOFF8C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF8CH
    cmp bl,'l'
    je SUBSTATEOFF8CL
jmp SUBERORR
    SUBSTATEOFF8D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF8DH
    cmp bl,'l'
    je SUBSTATEOFF8DL
jmp SUBERORR
SUBSTATEOFF9A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF9AH
    cmp bl,'l'
    je SUBSTATEOFF9AL
jmp SUBERORR
    SUBSTATEOFF9B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF9BH
    cmp bl,'l'
    je SUBSTATEOFF9BL
jmp SUBERORR
    SUBSTATEOFF9C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF9CH
    cmp bl,'l'
    je SUBSTATEOFF9CL
jmp SUBERORR
    SUBSTATEOFF9D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFF9DH
    cmp bl,'l'
    je SUBSTATEOFF9DL
jmp SUBERORR
SUBSTATEOFFAA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFAAH
    cmp bl,'l'
    je SUBSTATEOFFAAL
jmp SUBERORR
    SUBSTATEOFFAB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFABH
    cmp bl,'l'
    je SUBSTATEOFFABL
jmp SUBERORR
    SUBSTATEOFFAC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFACH
    cmp bl,'l'
    je SUBSTATEOFFACL
jmp SUBERORR
    SUBSTATEOFFAD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFADH
    cmp bl,'l'
    je SUBSTATEOFFADL
jmp SUBERORR
SUBSTATEOFFBA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFBAH
    cmp bl,'l'
    je SUBSTATEOFFBAL
jmp SUBERORR
    SUBSTATEOFFBB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFBBH
    cmp bl,'l'
    je SUBSTATEOFFBBL
jmp SUBERORR
    SUBSTATEOFFBC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFBCH
    cmp bl,'l'
    je SUBSTATEOFFBCL
jmp SUBERORR
    SUBSTATEOFFBD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFBDH
    cmp bl,'l'
    je SUBSTATEOFFBDL
jmp SUBERORR
SUBSTATEOFFCA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFCAH
    cmp bl,'l'
    je SUBSTATEOFFCAL
jmp SUBERORR
    SUBSTATEOFFCB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFCBH
    cmp bl,'l'
    je SUBSTATEOFFCBL
jmp SUBERORR
    SUBSTATEOFFCC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFCCH
    cmp bl,'l'
    je SUBSTATEOFFCCL
jmp SUBERORR
    SUBSTATEOFFCD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFCDH
    cmp bl,'l'
    je SUBSTATEOFFCDL
jmp SUBERORR
SUBSTATEOFFDA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFDAH
    cmp bl,'l'
    je SUBSTATEOFFDAL
jmp SUBERORR
    SUBSTATEOFFDB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFDBH
    cmp bl,'l'
    je SUBSTATEOFFDBL
jmp SUBERORR
    SUBSTATEOFFDC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFDCH
    cmp bl,'l'
    je SUBSTATEOFFDCL
jmp SUBERORR
    SUBSTATEOFFDD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFDDH
    cmp bl,'l'
    je SUBSTATEOFFDDL
jmp SUBERORR
SUBSTATEOFFEA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFEAH
    cmp bl,'l'
    je SUBSTATEOFFEAL
jmp SUBERORR
    SUBSTATEOFFEB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFEBH
    cmp bl,'l'
    je SUBSTATEOFFEBL
jmp SUBERORR
    SUBSTATEOFFEC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFECH
    cmp bl,'l'
    je SUBSTATEOFFECL
jmp SUBERORR
    SUBSTATEOFFED:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFEDH
    cmp bl,'l'
    je SUBSTATEOFFEDL
jmp SUBERORR
SUBSTATEOFFFA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFFAH
    cmp bl,'l'
    je SUBSTATEOFFFAL
jmp SUBERORR
    SUBSTATEOFFFB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFFBH
    cmp bl,'l'
    je SUBSTATEOFFFBL
jmp SUBERORR
    SUBSTATEOFFFC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFFCH
    cmp bl,'l'
    je SUBSTATEOFFFCL
jmp SUBERORR
    SUBSTATEOFFFD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je SUBSTATEOFFFDH
    cmp bl,'l'
    je SUBSTATEOFFFDL
jmp SUBERORR



    ;OFFFFFFFFFFFFFFFFFFFF
    SUBSTATEOFF0AL:
    mov ah,p1al
    sub p10,ah  
    jmp exitSUB
    SUBSTATEOFF0AH:
    mov ah,p1ah
    sub p10,ah  
    jmp exitSUB
    SUBSTATEOFF0BL:
    mov ah,p1bl
    sub p10,ah  
    jmp exitSUB
    SUBSTATEOFF0BH:
    mov ah,p1bh
    sub p10,ah  
    jmp exitSUB
    SUBSTATEOFF0CL:
    mov ah,p1cl
    sub p10,ah  
    jmp exitSUB
    SUBSTATEOFF0CH:
    mov ah,p1ch
    sub p10,ah  
    jmp exitSUB
    SUBSTATEOFF0DL:
    mov ah,p1dl
    sub p10,ah  
    jmp exitSUB
    SUBSTATEOFF0DH:
    mov ah,p1dh
    sub p10,ah  
    jmp exitSUB


    ;
    SUBSTATEOFF1AL:
    mov ah,p1al
    sub p11,ah  
    jmp exitSUB
    SUBSTATEOFF1AH:
    mov ah,p1ah
    sub p11,ah  
    jmp exitSUB
    SUBSTATEOFF1BL:
    mov ah,p1bl
    sub p11,ah  
    jmp exitSUB
    SUBSTATEOFF1BH:
    mov ah,p1bh
    sub p11,ah  
    jmp exitSUB
    SUBSTATEOFF1CL:
    mov ah,p1cl
    sub p11,ah  
    jmp exitSUB
    SUBSTATEOFF1CH:
    mov ah,p1ch
    sub p11,ah  
    jmp exitSUB
    SUBSTATEOFF1DL:
    mov ah,p1dl
    sub p11,ah  
    jmp exitSUB
    SUBSTATEOFF1DH:
    mov ah,p1dh
    sub p11,ah  
    jmp exitSUB

    ;

    SUBSTATEOFF2AL:
    mov ah,p1al
    sub p12,ah  
    jmp exitSUB
    SUBSTATEOFF2AH:
    mov ah,p1ah
    sub p12,ah  
    jmp exitSUB
    SUBSTATEOFF2BL:
    mov ah,p1bl
    sub p12,ah  
    jmp exitSUB
    SUBSTATEOFF2BH:
    mov ah,p1bh
    sub p12,ah  
    jmp exitSUB
    SUBSTATEOFF2CL:
    mov ah,p1cl
    sub p12,ah  
    jmp exitSUB
    SUBSTATEOFF2CH:
    mov ah,p1ch
    sub p12,ah  
    jmp exitSUB
    SUBSTATEOFF2DL:
    mov ah,p1dl
    sub p12,ah  
    jmp exitSUB
    SUBSTATEOFF2DH:
    mov ah,p1dh
    sub p12,ah  
    jmp exitSUB

    ;

    SUBSTATEOFF3AL:
    mov ah,p1al
    sub p13,ah  
    jmp exitSUB
    SUBSTATEOFF3AH:
    mov ah,p1ah
    sub p13,ah  
    jmp exitSUB
    SUBSTATEOFF3BL:
    mov ah,p1bl
    sub p13,ah  
    jmp exitSUB
    SUBSTATEOFF3BH:
    mov ah,p1bh
    sub p13,ah  
    jmp exitSUB
    SUBSTATEOFF3CL:
    mov ah,p1cl
    sub p13,ah  
    jmp exitSUB
    SUBSTATEOFF3CH:
    mov ah,p1ch
    sub p13,ah  
    jmp exitSUB
    SUBSTATEOFF3DL:
    mov ah,p1dl
    sub p13,ah  
    jmp exitSUB
    SUBSTATEOFF3DH:
    mov ah,p1dh
    sub p13,ah  
    jmp exitSUB
    ;
    SUBSTATEOFF4AL:
    mov ah,p1al
    sub p14,ah  
    jmp exitSUB
    SUBSTATEOFF4AH:
    mov ah,p1ah
    sub p14,ah  
    jmp exitSUB
    SUBSTATEOFF4BL:
    mov ah,p1bl
    sub p14,ah  
    jmp exitSUB
    SUBSTATEOFF4BH:
    mov ah,p1bh
    sub p14,ah  
    jmp exitSUB
    SUBSTATEOFF4CL:
    mov ah,p1cl
    sub p14,ah  
    jmp exitSUB
    SUBSTATEOFF4CH:
    mov ah,p1ch
    sub p14,ah  
    jmp exitSUB
    SUBSTATEOFF4DL:
    mov ah,p1dl
    sub p14,ah  
    jmp exitSUB
    SUBSTATEOFF4DH:
    mov ah,p1dh
    sub p14,ah  
    jmp exitSUB
;


SUBSTATEOFF5AL:
    mov ah,p1al
    sub p15,ah  
    jmp exitSUB
    SUBSTATEOFF5AH:
    mov ah,p1ah
    sub p15,ah  
    jmp exitSUB
    SUBSTATEOFF5BL:
    mov ah,p1bl
    sub p15,ah  
    jmp exitSUB
    SUBSTATEOFF5BH:
    mov ah,p1bh
    sub p15,ah  
    jmp exitSUB
    SUBSTATEOFF5CL:
    mov ah,p1cl
    sub p15,ah  
    jmp exitSUB
    SUBSTATEOFF5CH:
    mov ah,p1ch
    sub p15,ah  
    jmp exitSUB
    SUBSTATEOFF5DL:
    mov ah,p1dl
    sub p15,ah  
    jmp exitSUB
    SUBSTATEOFF5DH:
    mov ah,p1dh
    sub p15,ah  
    jmp exitSUB
    ;

    SUBSTATEOFF6AL:
    mov ah,p1al
    sub p16,ah  
    jmp exitSUB
    SUBSTATEOFF6AH:
    mov ah,p1ah
    sub p16,ah  
    jmp exitSUB
    SUBSTATEOFF6BL:
    mov ah,p1bl
    sub p16,ah  
    jmp exitSUB
    SUBSTATEOFF6BH:
    mov ah,p1bh
    sub p16,ah  
    jmp exitSUB
    SUBSTATEOFF6CL:
    mov ah,p1cl
    sub p16,ah  
    jmp exitSUB
    SUBSTATEOFF6CH:
    mov ah,p1ch
    sub p16,ah  
    jmp exitSUB
    SUBSTATEOFF6DL:
    mov ah,p1dl
    sub p16,ah  
    jmp exitSUB
    SUBSTATEOFF6DH:
    mov ah,p1dh
    sub p16,ah  
    jmp exitSUB
    ;
    SUBSTATEOFF7AL:
    mov ah,p1al
    sub p17,ah  
    jmp exitSUB
    SUBSTATEOFF7AH:
    mov ah,p1ah
    sub p17,ah  
    jmp exitSUB
    SUBSTATEOFF7BL:
    mov ah,p1bl
    sub p17,ah  
    jmp exitSUB
    SUBSTATEOFF7BH:
    mov ah,p1bh
    sub p17,ah  
    jmp exitSUB
    SUBSTATEOFF7CL:
    mov ah,p1cl
    sub p17,ah  
    jmp exitSUB
    SUBSTATEOFF7CH:
    mov ah,p1ch
    sub p17,ah  
    jmp exitSUB
    SUBSTATEOFF7DL:
    mov ah,p1dl
    sub p17,ah  
    jmp exitSUB
    SUBSTATEOFF7DH:
    mov ah,p1dh
    sub p17,ah  
    jmp exitSUB
    ;

    SUBSTATEOFF8AL:
    mov ah,p1al
    sub p18,ah  
    jmp exitSUB
    SUBSTATEOFF8AH:
    mov ah,p1ah
    sub p18,ah  
    jmp exitSUB
    SUBSTATEOFF8BL:
    mov ah,p1bl
    sub p18,ah  
    jmp exitSUB
    SUBSTATEOFF8BH:
    mov ah,p1bh
    sub p18,ah  
    jmp exitSUB
    SUBSTATEOFF8CL:
    mov ah,p1cl
    sub p18,ah  
    jmp exitSUB
    SUBSTATEOFF8CH:
    mov ah,p1ch
    sub p18,ah  
    jmp exitSUB
    SUBSTATEOFF8DL:
    mov ah,p1dl
    sub p18,ah  
    jmp exitSUB
    SUBSTATEOFF8DH:
    mov ah,p1dh
    sub p18,ah  
    jmp exitSUB
    ;

    SUBSTATEOFF9AL:
    mov ah,p1al
    sub p19,ah  
    jmp exitSUB
    SUBSTATEOFF9AH:
    mov ah,p1ah
    sub p19,ah  
    jmp exitSUB
    SUBSTATEOFF9BL:
    mov ah,p1bl
    sub p19,ah  
    jmp exitSUB
    SUBSTATEOFF9BH:
    mov ah,p1bh
    sub p19,ah  
    jmp exitSUB
    SUBSTATEOFF9CL:
    mov ah,p1cl
    sub p19,ah  
    jmp exitSUB
    SUBSTATEOFF9CH:
    mov ah,p1ch
    sub p19,ah  
    jmp exitSUB
    SUBSTATEOFF9DL:
    mov ah,p1dl
    sub p19,ah  
    jmp exitSUB
    SUBSTATEOFF9DH:
    mov ah,p1dh
    sub p19,ah  
    jmp exitSUB
    ;
    SUBSTATEOFFAAL:
    mov ah,p1al
    sub p1a,ah  
    jmp exitSUB
    SUBSTATEOFFAAH:
    mov ah,p1ah
    sub p1a,ah  
    jmp exitSUB
    SUBSTATEOFFABL:
    mov ah,p1bl
    sub p1a,ah  
    jmp exitSUB
    SUBSTATEOFFABH:
    mov ah,p1bh
    sub p1a,ah  
    jmp exitSUB
    SUBSTATEOFFACL:
    mov ah,p1cl
    sub p1a,ah  
    jmp exitSUB
    SUBSTATEOFFACH:
    mov ah,p1ch
    sub p1a,ah  
    jmp exitSUB
    SUBSTATEOFFADL:
    mov ah,p1dl
    sub p1a,ah  
    jmp exitSUB
    SUBSTATEOFFADH:
    mov ah,p1dh
    sub p1a,ah  
    jmp exitSUB

    ;
    SUBSTATEOFFBAL:
    mov ah,p1al
    sub p1b,ah  
    jmp exitSUB
    SUBSTATEOFFBAH:
    mov ah,p1ah
    sub p1b,ah  
    jmp exitSUB
    SUBSTATEOFFBBL:
    mov ah,p1bl
    sub p1b,ah  
    jmp exitSUB
    SUBSTATEOFFBBH:
    mov ah,p1bh
    sub p1b,ah  
    jmp exitSUB
    SUBSTATEOFFBCL:
    mov ah,p1cl
    sub p1b,ah  
    jmp exitSUB
    SUBSTATEOFFBCH:
    mov ah,p1ch
    sub p1b,ah  
    jmp exitSUB
    SUBSTATEOFFBDL:
    mov ah,p1dl
    sub p1b,ah  
    jmp exitSUB
    SUBSTATEOFFBDH:
    mov ah,p1dh
    sub p1b,ah  
    jmp exitSUB
    ;
    SUBSTATEOFFCAL:
    mov ah,p1al
    sub p1c,ah  
    jmp exitSUB
    SUBSTATEOFFCAH:
    mov ah,p1ah
    sub p1c,ah  
    jmp exitSUB
    SUBSTATEOFFCBL:
    mov ah,p1bl
    sub p1c,ah  
    jmp exitSUB
    SUBSTATEOFFCBH:
    mov ah,p1bh
    sub p1c,ah  
    jmp exitSUB
    SUBSTATEOFFCCL:
    mov ah,p1cl
    sub p1c,ah  
    jmp exitSUB
    SUBSTATEOFFCCH:
    mov ah,p1ch
    sub p1c,ah  
    jmp exitSUB
    SUBSTATEOFFCDL:
    mov ah,p1dl
    sub p1c,ah  
    jmp exitSUB
    SUBSTATEOFFCDH:
    mov ah,p1dh
    sub p1c,ah  
    jmp exitSUB
    ;
    SUBSTATEOFFDAL:
    mov ah,p1al
    sub p1d,ah  
    jmp exitSUB
    SUBSTATEOFFDAH:
    mov ah,p1ah
    sub p1d,ah  
    jmp exitSUB
    SUBSTATEOFFDBL:
    mov ah,p1bl
    sub p1d,ah  
    jmp exitSUB
    SUBSTATEOFFDBH:
    mov ah,p1bh
    sub p1d,ah  
    jmp exitSUB
    SUBSTATEOFFDCL:
    mov ah,p1cl
    sub p1d,ah  
    jmp exitSUB
    SUBSTATEOFFDCH:
    mov ah,p1ch
    sub p1d,ah  
    jmp exitSUB
    SUBSTATEOFFDDL:
    mov ah,p1dl
    sub p1d,ah  
    jmp exitSUB
    SUBSTATEOFFDDH:
    mov ah,p1dh
    sub p1d,ah  
    jmp exitSUB
    ;

    SUBSTATEOFFEAL:
    mov ah,p1al
    sub p1e,ah  
    jmp exitSUB
    SUBSTATEOFFEAH:
    mov ah,p1ah
    sub p1e,ah  
    jmp exitSUB
    SUBSTATEOFFEBL:
    mov ah,p1bl
    sub p1e,ah  
    jmp exitSUB
    SUBSTATEOFFEBH:
    mov ah,p1bh
    sub p1e,ah  
    jmp exitSUB
    SUBSTATEOFFECL:
    mov ah,p1cl
    sub p1e,ah  
    jmp exitSUB
    SUBSTATEOFFECH:
    mov ah,p1ch
    sub p1e,ah  
    jmp exitSUB
    SUBSTATEOFFEDL:
    mov ah,p1dl
    sub p1e,ah  
    jmp exitSUB
    SUBSTATEOFFEDH:
    mov ah,p1dh
    sub p1e,ah  
    jmp exitSUB
    ;

    SUBSTATEOFFFAL:
    mov ah,p1al
    sub p1f,ah  
    jmp exitSUB
    SUBSTATEOFFFAH:
    mov ah,p1ah
    sub p1f,ah  
    jmp exitSUB
    SUBSTATEOFFFBL:
    mov ah,p1bl
    sub p1f,ah  
    jmp exitSUB
    SUBSTATEOFFFBH:
    mov ah,p1bh
    sub p1f,ah  
    jmp exitSUB
    SUBSTATEOFFFCL:
    mov ah,p1cl
    sub p1f,ah  
    jmp exitSUB
    SUBSTATEOFFFCH:
    mov ah,p1ch
    sub p1f,ah  
    jmp exitSUB
    SUBSTATEOFFFDL:
    mov ah,p1dl
    sub p1f,ah  
    jmp exitSUB
    SUBSTATEOFFFDH:
    mov ah,p1dh
    sub p1f,ah  
    jmp exitSUB
   ;====================================================
   SUBSTATEDXTOAX:
   mov ax,p1ax
   sub p1dx,ax
   jmp exitSUB
   SUBSTATEDXTOBX:
   mov bx , p1bx
   sub p1dx,bx
   jmp exitSUB 
   SUBSTATEDXTOCX:
   mov cx, p1cx
   sub p1dx,cx
   jmp exitSUB
   ;===========
   SUBSTATECXTOAX:
   mov ax, p1ax
   sub p1cx,ax
   jmp exitSUB
   SUBSTATECXTOBX:
   mov bx ,p1bx
   sub p1cx,bx
   jmp exitSUB
   SUBSTATECXTODX:
   mov dx, p1dx
   sub p1cx,dx
   jmp exitSUB
   ;=============
   SUBSTATEBXTOAX:
   mov ax,p1ax
   sub p1bx,ax
   jmp exitSUB
   SUBSTATEBXTOCX:
   mov cx,p1cx
   sub p1bx,cx
   jmp exitSUB
   SUBSTATEBXTODX:
   mov dx, p1dx
   sub p1bx,dx
   jmp exitSUB
   ;=========
   SUBSTATEAXTOBX:
   mov bx, p1bx
   sub p1ax,bx
   jmp exitSUB
   SUBSTATEAXTOCX:
   mov cx,p1cx
   sub p1ax,cx 
   jmp exitSUB
   SUBSTATEAXTODX:
   mov dx, p1dx
   sub p1ax,dx
   jmp exitSUB

  SUBSTATEAXTOSI:
  mov bx, p1si
  sub p1ax,bx
  jmp exitSUB

  SUBSTATEAXTODI:
  mov bx, p1di
  sub p1ax,bx
  jmp exitSUB
  SUBSTATEAXTOSP:
  mov bx, p1sp
  sub p1ax,bx
  jmp exitSUB
  
  SUBSTATEAXTOBP:
  mov bx, p1bp
  sub p1ax,bx
  jmp exitSUB
  

  SUBSTATEBXTOBP :
  mov bx, p1bp
  sub p1bx, bx
  jmp exitSUB
  SUBSTATEBXTOSI :
  mov bx, p1si
  sub p1bx, bx
  jmp exitSUB
  
  SUBSTATEBXTOSP :
  mov bx, p1sp
  sub p1bx, bx
  jmp exitSUB
  SUBSTATEBXTODI :
  mov bx, p1di
  sub p1bx, bx
  jmp exitSUB
  
  SUBSTATECXTOSI :
  mov bx, p1si
  sub p1cx, bx
  jmp exitSUB

  SUBSTATECXTOSP :
  mov bx, p1sp
  sub p1cx, bx
  jmp exitSUB
  SUBSTATECXTOBP :
  mov bx, p1bp
  sub p1cx, bx
  jmp exitSUB
  SUBSTATECXTODI :
  mov bx, p1di
  sub p1cx, bx
  jmp exitSUB

  SUBSTATEDXTOSI: 
  mov bx, p1si
  sub p1dx,bx
  jmp exitSUB

SUBSTATEDXTOSP: 
  mov bx, p1sp
  sub p1dx,bx
  jmp exitSUB

SUBSTATEDXTOBP: 
  mov bx, p1bp
  sub p1dx,bx
  jmp exitSUB

SUBSTATEDXTODI: 
  mov bx, p1di
  sub p1dx,bx
  jmp exitSUB

SUBSTATESIAX:
mov ax,p1ax
sub p1si,ax
jmp exitSUB

SUBSTATESICX:
mov cx,p1cx
sub p1si,cx
jmp exitSUB
SUBSTATESIBX:
mov bx,p1bx
sub p1si,bx
jmp exitSUB
SUBSTATESIDX:
mov dx,p1dx
sub p1si,dx
jmp exitSUB

SUBSTATESISP:
mov bx,p1sp
sub p1si,bx
jmp exitSUB
SUBSTATESIBP:
mov bx,p1bp
sub p1si,bx
jmp exitSUB

SUBSTATESIDI:
mov bx,p1di
sub p1si,bx
jmp exitSUB

SUBSTATESPAX:
mov ax,p1ax
sub p1sp,ax
jmp exitSUB

SUBSTATESPBX:
mov bx,p1bx
sub p1sp,bx
jmp exitSUB

SUBSTATESPCX:
mov cx,p1cx
sub p1sp,cx
jmp exitSUB

SUBSTATESPDX:
mov dx,p1dx
sub p1sp,dx
jmp exitSUB

SUBSTATESPSI :
mov bx,p1si
sub p1sp,bx
jmp exitSUB

SUBSTATESPBP:
mov bx,p1bp
sub p1sp,bx
jmp exitSUB

SUBSTATESPDI:
mov bx,p1di
sub p1sp,bx
jmp exitSUB

;
SUBSTATEDIAX:
mov ax,p1ax
sub p1di,ax
jmp exitSUB
SUBSTATEDIBX:
mov bx,p1bx
sub p1di,bx
jmp exitSUB
SUBSTATEDICX:
mov cx,p1cx
sub p1di,cx
jmp exitSUB
SUBSTATEDIDX:
mov dx,p1dx
sub p1di,dx
jmp exitSUB

SUBSTATEDIBP:
mov bx,p1bp
sub p1di,bx
jmp exitSUB

SUBSTATEDISI:
mov bx,p1si
sub p1di,bx
jmp exitSUB

SUBSTATEDISP:
mov bx,p1sp
sub p1di,bx
jmp exitSUB

;;
SUBSTATEBPAX:
mov ax,p1ax
sub p1bp,ax
jmp exitSUB

SUBSTATEBPBX:
mov bx,p1bx
sub p1bp,bx
jmp exitSUB

SUBSTATEBPCX:
mov cx,p1cx
sub p1bp,cx
jmp exitSUB

SUBSTATEBPDX:
mov dx,p1dx
sub p1bp,dx
jmp exitSUB

SUBSTATEBPDI:
mov bx,p1di
sub p1bp,bx
jmp exitSUB

SUBSTATEBPSI:
mov bx,p1si
sub p1bp,bx
jmp exitSUB

SUBSTATEBPSP:
mov bx,p1sp
sub p1bp,bx
jmp exitSUB


SUBSTATEAHOFF0:
      mov al,p10
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFF1:
      mov al,p11
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFF2:
      mov al,p12
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFF3:
      mov al,p13
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFF4:
      mov al,p14
      sub p1ah,al
      jmp exitSUB
      SUBSTATEAHOFF5:
      mov al,p15
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFF6:
      mov al,p16
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFF7:
      mov al,p17
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFF8:
      mov al,p18
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFF9:
      mov al,p19
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFFA:
      mov al,p1a
      sub p1ah,al
      jmp exitSUB

      SUBSTATEAHOFFB:
      mov al,p1b
      sub p1ah,al
      jmp exitSUB
      SUBSTATEAHOFFC:
      mov al,p1c
      sub p1ah,al
      jmp exitSUB
      SUBSTATEAHOFFE:
      mov al,p1e
      sub p1ah,al
      jmp exitSUB
      SUBSTATEAHOFFF:
      mov al,p1f
      sub p1ah,al
      jmp exitSUB
      
      SUBSTATEAHOFFD:
       mov al,p1d
      sub p1ah,al
      jmp exitSUB

;;
SUBSTATEALOFF0:
      mov al,p10
      sub p1al,al
      jmp exitSUB
SUBSTATEALOFF1:
      mov al,p11
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFF2:
      mov al,p12
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFF3:
      mov al,p13
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFF4:
      mov al,p14
      sub p1al,al
      jmp exitSUB
      SUBSTATEALOFF5:
      mov al,p15
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFF6:
      mov al,p16
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFF7:
      mov al,p17
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFF8:
      mov al,p18
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFF9:
      mov al,p19
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFFA:
      mov al,p1a
      sub p1al,al
      jmp exitSUB

      SUBSTATEALOFFB:
      mov al,p1b
      sub p1al,al
      jmp exitSUB
      SUBSTATEALOFFC:
      mov al,p1c
      sub p1al,al
      jmp exitSUB
      SUBSTATEALOFFE:
      mov al,p1e
      sub p1al,al
      jmp exitSUB
      SUBSTATEALOFFF:
      mov al,p1f
      sub p1al,al
      jmp exitSUB
      
      SUBSTATEALOFFD:
       mov al,p1d
      sub p1al,al
      jmp exitSUB



;;;;;BBBB
SUBSTATEBHOFF0:
      mov al,p10
      sub p1bh,al
      jmp exitSUB
SUBSTATEBHOFF1:
      mov al,p11
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFF2:
      mov al,p12
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFF3:
      mov al,p13
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFF4:
      mov al,p14
      sub p1bh,al
      jmp exitSUB
      SUBSTATEBHOFF5:
      mov al,p15
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFF6:
      mov al,p16
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFF7:
      mov al,p17
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFF8:
      mov al,p18
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFF9:
      mov al,p19
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFFA:
      mov al,p1a
      sub p1bh,al
      jmp exitSUB

      SUBSTATEBHOFFB:
      mov al,p1b
      sub p1bh,al
      jmp exitSUB
      SUBSTATEBHOFFC:
      mov al,p1c
      sub p1bh,al
      jmp exitSUB
      SUBSTATEBHOFFE:
      mov al,p1e
      sub p1bh,al
      jmp exitSUB
      SUBSTATEBHOFFF:
      mov al,p1f
      sub p1bh,al
      jmp exitSUB
      
      SUBSTATEBHOFFD:
       mov al,p1d
      sub p1bh,al
      jmp exitSUB
;;
SUBSTATEBLOFF0:
      mov al,p10
      sub p1bL,al
      jmp exitSUB
SUBSTATEBLOFF1:
      mov al,p11
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFF2:
      mov al,p12
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFF3:
      mov al,p13
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFF4:
      mov al,p14
      sub p1bL,al
      jmp exitSUB
      SUBSTATEBLOFF5:
      mov al,p15
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFF6:
      mov al,p16
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFF7:
      mov al,p17
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFF8:
      mov al,p18
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFF9:
      mov al,p19
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFFA:
      mov al,p1a
      sub p1bL,al
      jmp exitSUB

      SUBSTATEBLOFFB:
      mov al,p1b
      sub p1bL,al
      jmp exitSUB
      SUBSTATEBLOFFC:
      mov al,p1c
      sub p1bL,al
      jmp exitSUB
      SUBSTATEBLOFFE:
      mov al,p1e
      sub p1bL,al
      jmp exitSUB
      SUBSTATEBLOFFF:
      mov al,p1f
      sub p1bL,al
      jmp exitSUB
      
      SUBSTATEBLOFFD:
       mov al,p1d
      sub p1bL,al
      jmp exitSUB




      ;;;;;CCCCCCCCCCC
      SUBSTATECHOFF0:
      mov al,p10
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFF1:
      mov al,p11
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFF2:
      mov al,p12
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFF3:
      mov al,p13
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFF4:
      mov al,p14
      sub p1ch,al
      jmp exitSUB
      SUBSTATECHOFF5:
      mov al,p15
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFF6:
      mov al,p16
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFF7:
      mov al,p17
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFF8:
      mov al,p18
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFF9:
      mov al,p19
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFFA:
      mov al,p1a
      sub p1ch,al
      jmp exitSUB

      SUBSTATECHOFFB:
      mov al,p1b
      sub p1ch,al
      jmp exitSUB
      SUBSTATECHOFFC:
      mov al,p1c
      sub p1ch,al
      jmp exitSUB
      SUBSTATECHOFFE:
      mov al,p1e
      sub p1ch,al
      jmp exitSUB
      SUBSTATECHOFFF:
      mov al,p1f
      sub p1ch,al
      jmp exitSUB
      
      SUBSTATECHOFFD:
       mov al,p1d
      sub p1ch,al
      jmp exitSUB

;;
SUBSTATECLOFF0:
      mov al,p10
      sub p1cl,al
      jmp exitSUB
SUBSTATECLOFF1:
      mov al,p11
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFF2:
      mov al,p12
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFF3:
      mov al,p13
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFF4:
      mov al,p14
      sub p1cl,al
      jmp exitSUB
      SUBSTATECLOFF5:
      mov al,p15
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFF6:
      mov al,p16
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFF7:
      mov al,p17
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFF8:
      mov al,p18
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFF9:
      mov al,p19
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFFA:
      mov al,p1a
      sub p1cl,al
      jmp exitSUB

      SUBSTATECLOFFB:
      mov al,p1b
      sub p1cl,al
      jmp exitSUB
      SUBSTATECLOFFC:
      mov al,p1c
      sub p1cl,al
      jmp exitSUB
      SUBSTATECLOFFE:
      mov al,p1e
      sub p1cl,al
      jmp exitSUB
      SUBSTATECLOFFF:
      mov al,p1f
      sub p1cl,al
      jmp exitSUB
      
      SUBSTATECLOFFD:
       mov al,p1d
      sub p1cl,al
      jmp exitSUB
;;;;;;;DDDDDDDDDDDDDDDDDDDDDD

      SUBSTATEDHOFF0:
      mov al,p10
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFF1:
      mov al,p11
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFF2:
      mov al,p12
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFF3:
      mov al,p13
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFF4:
      mov al,p14
      sub p1dh,al
      jmp exitSUB
      SUBSTATEDHOFF5:
      mov al,p15
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFF6:
      mov al,p16
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFF7:
      mov al,p17
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFF8:
      mov al,p18
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFF9:
      mov al,p19
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFFA:
      mov al,p1a
      sub p1dh,al
      jmp exitSUB

      SUBSTATEDHOFFB:
      mov al,p1b
      sub p1dh,al
      jmp exitSUB
      SUBSTATEDHOFFC:
      mov al,p1c
      sub p1dh,al
      jmp exitSUB
      SUBSTATEDHOFFE:
      mov al,p1e
      sub p1dh,al
      jmp exitSUB
      SUBSTATEDHOFFF:
      mov al,p1f
      sub p1dh,al
      jmp exitSUB
      
      SUBSTATEDHOFFD:
       mov al,p1d
      sub p1dh,al
      jmp exitSUB

;;
SUBSTATEDLOFF0:
      mov al,p10
      sub p1dl,al
      jmp exitSUB
SUBSTATEDLOFF1:
      mov al,p11
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFF2:
      mov al,p12
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFF3:
      mov al,p13
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFF4:
      mov al,p14
      sub p1dl,al
      jmp exitSUB
      SUBSTATEDLOFF5:
      mov al,p15
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFF6:
      mov al,p16
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFF7:
      mov al,p17
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFF8:
      mov al,p18
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFF9:
      mov al,p19
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFFA:
      mov al,p1a
      sub p1dl,al
      jmp exitSUB

      SUBSTATEDLOFFB:
      mov al,p1b
      sub p1dl,al
      jmp exitSUB
      SUBSTATEDLOFFC:
      mov al,p1c
      sub p1dl,al
      jmp exitSUB
      SUBSTATEDLOFFE:
      mov al,p1e
      sub p1dl,al
      jmp exitSUB
      SUBSTATEDLOFFF:
      mov al,p1f
      sub p1dl,al
      jmp exitSUB
      
      SUBSTATEDLOFFD:
       mov al,p1d
      sub p1dl,al
      jmp exitSUB

;;

SUBSTATEAHAL:
     mov al, p1al
     sub p1ah,al
     jmp exitSUB
     
     SUBSTATEAHBL:
     mov bl,p1bl
     sub p1ah,bl
     jmp exitSUB
     
     SUBSTATEAHBH:
     mov bh, p1bh
     sub p1ah,bh
     jmp exitSUB
    
     SUBSTATEAHCL:
     mov cl, p1cl
     sub p1ah,cl
     jmp exitSUB
     
     SUBSTATEAHCH:
     mov ch, p1ch
     sub p1ah,ch
     jmp exitSUB
     SUBSTATEAHDL:
     mov dl, p1dl
     sub p1ah,dl
     jmp exitSUB
     
     SUBSTATEAHDH:
     mov dh, p1dh
     sub p1ah,dh
     jmp exitSUB
    
     SUBSTATEALAH:
     mov ah,p1ah
     sub p1al,ah
     jmp exitSUB
     
     SUBSTATEALBL:
     mov bl,p1bl
     sub p1al,bl
     jmp exitSUB
     
     SUBSTATEALBH:
     mov bh,p1bh
     sub p1al,bh
     jmp exitSUB
     
     SUBSTATEALCL:
     mov cl,p1cl
     sub p1al,cl
     jmp exitSUB
     
     SUBSTATEALCH:
     mov ch,p1ch
     sub p1al,ch
     jmp exitSUB
     
     SUBSTATEALDL:
     mov dl,p1dl
     sub p1al,dl
     jmp exitSUB
     
     SUBSTATEALDH:
     mov dh,p1dh
     sub p1al,dh
     jmp exitSUB
     
     ;;;;;;  ;;;;;;;;;;;;;;;;;;;;;;;;
     
     SUBSTATEBHBL:
     mov bl,p1bl
     sub p1bh,bl
     jmp exitSUB
     
     SUBSTATEBHAL:
     mov al, p1al
     sub p1bh,al
     jmp exitSUB
     
     SUBSTATEBHAH:
     mov ah, p1ah
     sub p1bh ,ah
     jmp exitSUB
     
     SUBSTATEBHCL:
     mov cl, p1cl
     sub p1bh,cl
     jmp exitSUB
     
     SUBSTATEBHCH:
     mov ch,p1ch
     sub p1bh,ch
     jmp exitSUB
     
     SUBSTATEBHDL:
     mov dl, p1dl
     sub p1bh,dl
     jmp exitSUB 
     
     SUBSTATEBHDH:
     mov dh, p1dh
     sub p1bh,dh
     jmp exitSUB
     
     
     SUBSTATEBLBH:
     mov bh,p1bh
     sub p1bl,bh
     jmp exitSUB
     
     
     SUBSTATEBLAL:
     mov al, p1al
     sub p1bl,al
     jmp exitSUB
     
     SUBSTATEBLAH:
     mov ah, p1ah
     sub p1bl ,ah
     jmp exitSUB
     
     SUBSTATEBLCL:
     mov cl, p1cl
     sub p1bl,cl
     jmp exitSUB
     
     SUBSTATEBLCH:
     mov ch, p1ch
     sub p1bl,ch
     jmp exitSUB
     
     SUBSTATEBLDL:
     mov dl, p1dl
     sub p1bl,dl
     jmp exitSUB 
     
     SUBSTATEBLDH:
     mov dh, p1dh
     sub p1bl,dh
     jmp exitSUB
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
      SUBSTATECHCl:
      mov cl, p1cl
      sub p1ch,cl
      jmp exitSUB
      
      SUBSTATECHAL:
      mov al, p1al
      sub p1ch,al
      jmp exitSUB
      
      SUBSTATECHAH:
      mov ah, p1ah
      sub p1ch,ah
      jmp exitSUB 
      
      SUBSTATECHBL:
      mov bl, p1bl
      sub p1ch,bl
      jmp exitSUB
      
      SUBSTATECHBH:
      mov bh, p1bh
      sub p1ch,bh
      jmp exitSUB
      
      SUBSTATECHDL:
      mov dl, p1dl
      sub p1ch, dl
      jmp exitSUB
      
      SUBSTATECHDH:
      mov dh, p1dh
      sub p1ch,dh
      jmp exitSUB 
      
      SUBSTATECLCH:
      mov ch, p1ch
      sub p1cl,ch
      jmp exitSUB
      
      SUBSTATECLAL:
      mov al, p1al
      sub p1cl,al
      jmp exitSUB
      
      SUBSTATECLAH:
      mov ah, p1ah
      sub p1cl,ah
      jmp exitSUB 
      
      SUBSTATECLBL:
      mov bl,p1bl
      sub p1cl,bl
      jmp exitSUB
      
      SUBSTATECLBH:
      mov bh, p1bh
      sub p1cl,bh
      jmp exitSUB
      
      SUBSTATECLDL:
      mov dl, p1dl
      sub p1cl,dl
      jmp exitSUB
      
      SUBSTATECLDH:
      mov dh, p1dh
      sub p1cl,dh
      jmp exitSUB 
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      SUBSTATEDHDL:
      mov dl, p1dl
      sub p1dh,dl
      jmp exitSUB
      
      SUBSTATEDHAL:
      mov al, p1al
      sub p1dh,al
      jmp exitSUB
      
      SUBSTATEDHAH:
      mov ah, p1ah
      sub p1dh,ah
      jmp exitSUB
      
      SUBSTATEDHBL: 
      mov bl, p1bl
      sub p1dh,bl
      jmp exitSUB
      
      SUBSTATEDHBH:
      mov bh, p1bh
      sub p1dh,bh
      jmp exitSUB
      
      SUBSTATEDHCL:
      mov cl, p1cl
      sub p1dh,cl
      jmp exitSUB
      
      SUBSTATEDHCH:
      mov ch, p1ch
      sub p1dh,ch
      jmp exitSUB
      
      SUBSTATEDLDH:
      mov dh, p1dh
      sub p1dl,dh
      jmp exitSUB
      
      SUBSTATEDLAL:
      mov al, p1al
      sub p1dl,al
      jmp exitSUB
      
      SUBSTATEDLAH:
      mov ah, p1ah
      sub p1dl,ah
      jmp exitSUB
      
      SUBSTATEDLBL: 
      mov bl, p1bl
      sub p1dl,bl
      jmp exitSUB
      
      SUBSTATEDLBH:
      mov bh, p1bh
      sub p1dl,bh
      jmp exitSUB
      
      SUBSTATEDLCL:
      mov cl, p1cl
      sub p1dl,cl
      jmp exitSUB
      
      SUBSTATEDLCH:
      mov ch, p1ch
      sub p1dl,ch
      jmp exitSUB

   ;==========
   exitSUB:
    ret
    subp endp  
    
 end 
    