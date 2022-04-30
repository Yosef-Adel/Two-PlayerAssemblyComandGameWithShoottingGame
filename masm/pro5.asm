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

        PUBLIC pro5
.MODEL SMALL
.386
.data


.CODE
pro5 proc far
    mov ax,@data
    mov ds, ax 
   
    call addp
    
   
    ret
pro5 ENDP

addp    proc  near
   
    lea si, s
    mov bx,[si]
    cmp bl,'a'
    je Astate
    mov  dl, 1
    jmp exitADD
    
    
    
   Astate: 
   inc si 
   inc si
   mov bx,[si]
   cmp bl, 'd' 
   je ADDSTATEVALIDATION
   mov  dl, 1
   jmp exitADD
           
   ADDSTATEVALIDATION:
   inc si
   inc si
  mov bx,[si]
  cmp bl,'s'
  je RADDEVALIDATION
  cmp bl, 'd'
  je RADDEVALIDATION
  cmp bl, 'b'
  je RADDEVALIDATION
  cmp bl , '['
  je OFFADDVAlIDATION
  inc si  
   
   mov bx,[si]
   cmp bl, 'x'
   je XADDVALIDATION
   cmp bl, 'h'
   je HADDVALIDATION
           
   cmp bl, 'l'
   je HADDVALIDATION
   
   jmp ADDERORR
   
OFFADDVAlIDATION:
inc si 
mov bx,[si]
cmp bl,'b'
je OFFADDVAlIDATIONB
cmp bl, 'd'
je OFFADDVAlIDATIOND
cmp bl,'s'
je OFFADDVAlIDATIOND
inc si
inc si
mov bx,[si]
cmp bl,']'
je ADDSTATE
jmp ADDERORR

OFFADDVAlIDATIONB:
inc si
mov bx,[si]
cmp bl,'x'
jne ADDERORR
inc si 
mov bx,[si]
cmp bl ,']'
je ADDSTATE
jmp ADDERORR

OFFADDVAlIDATIOND:
inc si
mov bx,[si]
cmp bl,'i'
jne ADDERORR
inc si 
mov bx,[si]
cmp bl,']'
je ADDSTATE
jmp ADDERORR

   
   HADDVALIDATION:
   mov cl,03h
   inc si
   inc si
   mov bx,[si]
   cmp bl , 'v'
   je VHADDVALID  
   cmp bl,'['
   je OFFADDVALIDATIONG

   inc si
   mov bx,[si]
   cmp bl , 'x'
   je ADDERORR
   
   cmp bl , 'l'
   je ENDVADD
    
   cmp bl , 'h'
   je ENDVADD
   OFFADDVALIDATIONG:
   inc si
    mov bx,[si]
    cmp bl,'b'
   je OFFADDVAlIDATIONB
   cmp bl,'s'
   je OFFADDVAlIDATIOND
   cmp bl,'d'
   je OFFADDVAlIDATIOND
    inc si
    inc si
    mov bx,[si]
    cmp bl,']'
    je ADDSTATE
    jmp ADDERORR
   XADDVALIDATION:
   inc si
   inc si
   mov bx,[si]
   cmp bl, 'v'
   je VADDVALID
   cmp bl, 's'
   je ADDSTATE
   inc si
   mov bx,[si]
   cmp bl, 'x'
   je ENDVADD 
   cmp bl, 'x'
   jmp ADDERORR
   
   VHADDVALID:
   mov cl,04h
   inc si 
   inc si
   inc si
   mov bx,[si]
   cmp bl,'$'
   je ADDSTATE
   cmp bl, '$'
   jne ADDERORR
   
   VADDVALID:
   add si,6h
   mov bx,[si]
   cmp bl, '$'
   je ADDSTATE
   cmp bl, '$'
   jne ADDERORR
   
   
  RADDEVALIDATION:
  inc si 
  mov bx, [si]
  cmp bl, 'l'
  je HADDVALIDATION
  cmp bl, "h"
  je HADDVALIDATION
  cmp bl, 'x'
  je XADDVALIDATION
   add si ,3
   mov bx, [si]
   cmp bl,'x'
   je ADDSTATE
   jmp ADDERORR

   ENDVADD:
   inc si 
   mov bx,[si]
   cmp bl,'$'
   je  ADDSTATE





   ADDERORR:
   ;mov dl,5
   dec pgpoint
   jmp exitADD
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
   ADDSTATE:
   lea si ,s +4
   mov bx,[si] 
   ;--
   cmp bl ,'['
   je ADDSTATEOFF
   cmp bl, 'a'
   je ADDSTATEA 
   ;--
   cmp bl ,'s'
   je ADDSTATES
   ;==
   cmp bl, 'b'
   je ADDSTATEB
   ;===
   cmp bl, 'c'
   je ADDSTATEC
   cmp bl, 'd'
   je ADDSTATED
   jmp ADDERORR
   ;============
   ADDSTATEAX:
   inc si
   inc si
   
   mov bx,[si]
   cmp bl, 'b' 
   je ADDSTATEAXTOB
   cmp bl, 'c' 
   je ADDSTATEAXTOCX
    cmp bl, 'd' 
   je ADDSTATEAXTOD
   cmp bl,'v'
   je ADDSTATEAXV
   cmp bl , 's'
   je  ADDSTATEAXTOS
   jmp ADDERORR

  ADDSTATEAXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je ADDSTATEAXTOSI
  cmp bl, 'p'
  je ADDSTATEAXTOSP
jmp ADDERORR
ADDSTATEAXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je ADDSTATEAXTODX

cmp bl, 'i'
je ADDSTATEAXTODI

jmp ADDERORR
  ADDSTATEAXTOB:
  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je ADDSTATEAXTOBX
  cmp bl, 'p'
  je ADDSTATEAXTOBP
  jmp ADDERORR
   ;========


   ADDSTATEBX:
   inc si
   inc si
   
   mov bx,[si]
   cmp bl, 'a' 
   je ADDSTATEBXTOAX
   cmp bl, 'c' 
   je ADDSTATEBXTOCX
    cmp bl, 'd' 
   je ADDSTATEBXTOD
   cmp bl ,'v'
   je ADDSTATEBXV
   cmp bl,'b'
   je ADDSTATEBXTOBP

    cmp bl , 's'
   je  ADDSTATEBXTOS

jmp ADDERORR
  ADDSTATEBXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je ADDSTATEBXTOSI
  cmp bl, 'p'
  je ADDSTATEBXTOSP

jmp ADDERORR
ADDSTATEBXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je ADDSTATEBXTODX
cmp bl, 'i'
je ADDSTATEBXTODI

jmp ADDERORR
   ;================
   ADDSTATECX:
   inc si
   inc si
 
   mov bx, [si]
   cmp bl, 'a' 
   je ADDSTATECXTOAX
   cmp bl, 'b' 
   je ADDSTATECXTOBX
    cmp bl, 'd' 
   je ADDSTATECXTOD
    cmp bl ,'v'
   je ADDSTATECXV

    cmp bl , 's'
   je  ADDSTATECXTOS

jmp ADDERORR

  ADDSTATECXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je ADDSTATECXTOSI
  cmp bl, 'p'
  je ADDSTATECXTOSP

jmp ADDERORR
  ADDSTATECXTOB:
  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je ADDSTATECXTOBX
  cmp bl, 'p'
  je ADDSTATECXTOBP

jmp ADDERORR
ADDSTATECXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je ADDSTATECXTODX
cmp bl, 'i'
je ADDSTATECXTODI

   ;============
   jmp ADDERORR
    ADDSTATEDX:
   inc si
   inc si
 
   mov bx,[ si]
   cmp bl, 'a' 
   je ADDSTATEDXTOAX
   cmp bl, 'b' 
   je ADDSTATEDXTOB
    cmp bl, 'c' 
   je ADDSTATEDXTOCX
   cmp bl ,'v'
   je ADDSTATEDXV
    cmp bl ,'d'
    je ADDSTATEDXTODI
  cmp bl , 's'
  je  ADDSTATEDXTOS


jmp ADDERORR
  ADDSTATEDXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je ADDSTATEDXTOSI
  cmp bl, 'p'
  je ADDSTATEDXTOSP
jmp ADDERORR
  ADDSTATEDXTOB:

  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je ADDSTATEDXTOBX
  cmp bl, 'p'
  je ADDSTATEDXTOBP
jmp ADDERORR
   ;============================================
   
    ADDSTATEOFF:
    inc si
    mov bx,[si]
    cmp bl,'b'
    je ADDSTATEOFFBX
    cmp bl,'s'
    je ADDSTATEOFFSI
    cmp bl,'d' 
    je ADDSTATEOFFDI
    inc si
    mov bx,[si]
    cmp bl,'0'
    je ADDSTATEOFF0
    cmp bl,'1'
    je ADDSTATEOFF1
    cmp bl,'2'
    je ADDSTATEOFF2
    cmp bl,'3'
    je ADDSTATEOFF3   
    cmp bl,'4'
    je ADDSTATEOFF4
    cmp bl,'5'
    je ADDSTATEOFF5
    cmp bl,'6'
    je ADDSTATEOFF6
    cmp bl,'8'
    je ADDSTATEOFF8
    cmp bl,'9'
    je ADDSTATEOFF9
    cmp bl,'A'
    je ADDSTATEOFFA
    cmp bl,'B'
    je ADDSTATEOFFB
    cmp bl,'C'
    je ADDSTATEOFFC
    cmp bl,'D'
    je ADDSTATEOFFD
    cmp bl,'E'
    je ADDSTATEOFFE
    cmp bl,'F'
    je ADDSTATEOFFF
jmp ADDERORR
    ADDSTATEOFFBX:
    inc si
    mov bx,p1bx

    cmp bx,0h
    je ADDSTATEOFF0
    cmp bx,1h
    je ADDSTATEOFF1
    cmp bx,2h
    je ADDSTATEOFF2
    cmp bx,3h
    je ADDSTATEOFF3
    cmp bx,4h
    je ADDSTATEOFF4
    cmp bx,5h
    je ADDSTATEOFF5
    cmp bx,6h
    je ADDSTATEOFF6
    cmp bx,7h
    je ADDSTATEOFF7
    cmp bx,8h
    je ADDSTATEOFF8
    cmp bx,9h
    je ADDSTATEOFF9
    cmp bx,0ah
    je ADDSTATEOFFA
    cmp bx,0bh
    je ADDSTATEOFFB
    cmp bx,0ch
    je ADDSTATEOFFC
    cmp bx,0dh
    je ADDSTATEOFFD
    cmp bx,0eh
    je ADDSTATEOFFE
    cmp bx,0fh
    je ADDSTATEOFFF
    jmp ADDERORR
   ADDSTATEOFFSI:
  inc si
    mov bx,p1si

    cmp bx,0h
    je ADDSTATEOFF0
    cmp bx,1h
    je ADDSTATEOFF1
    cmp bx,2h
    je ADDSTATEOFF2
    cmp bx,3h
    je ADDSTATEOFF3
    cmp bx,4h
    je ADDSTATEOFF4
    cmp bx,5h
    je ADDSTATEOFF5
    cmp bx,6h
    je ADDSTATEOFF6
    cmp bx,7h
    je ADDSTATEOFF7
    cmp bx,8h
    je ADDSTATEOFF8
    cmp bx,9h
    je ADDSTATEOFF9
    cmp bx,0ah
    je ADDSTATEOFFA
    cmp bx,0bh
    je ADDSTATEOFFB
    cmp bx,0ch
    je ADDSTATEOFFC
    cmp bx,0dh
    je ADDSTATEOFFD
    cmp bx,0eh
    je ADDSTATEOFFE
    cmp bx,0fh
    je ADDSTATEOFFF
    jmp ADDERORR
     ADDSTATEOFFDI:
    inc si
    mov bx,p1di

    cmp bx,0h
    je ADDSTATEOFF0
    cmp bx,1h
    je ADDSTATEOFF1
    cmp bx,2h
    je ADDSTATEOFF2
    cmp bx,3h
    je ADDSTATEOFF3
    cmp bx,4h
    je ADDSTATEOFF4
    cmp bx,5h
    je ADDSTATEOFF5
    cmp bx,6h
    je ADDSTATEOFF6
    cmp bx,7h
    je ADDSTATEOFF7
    cmp bx,8h
    je ADDSTATEOFF8
    cmp bx,9h
    je ADDSTATEOFF9
    cmp bx,0ah
    je ADDSTATEOFFA
    cmp bx,0bh
    je ADDSTATEOFFB
    cmp bx,0ch
    je ADDSTATEOFFC
    cmp bx,0dh
    je ADDSTATEOFFD
    cmp bx,0eh
    je ADDSTATEOFFE
    cmp bx,0fh
    je ADDSTATEOFFF
    jmp ADDERORR


    
    
    
    ADDSTATEA:
    inc si
    mov bx,[si]
    cmp bl, 'x'
    je ADDSTATEAX
    cmp bl , 'h'
    je ADDSTATEAH
    cmp bl , 'l'
    je ADDSTATEAL
     jmp ADDERORR
    ADDSTATEB:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je ADDSTATEBX
    cmp bl , 'h'
    je ADDSTATEBH
    cmp bl , 'l'
    je ADDSTATEBL
    cmp bl , 'p'
    je ADDSTATEBP
 jmp ADDERORR
    
    
    ADDSTATEC:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je ADDSTATECX
    cmp bl , 'h'
    je ADDSTATECH
    cmp bl , 'l'
    je ADDSTATECL
    jmp ADDERORR
    ADDSTATED:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je ADDSTATEDX
    cmp bl , 'h'
    je ADDSTATEDH
    cmp bl , 'l'
    je ADDSTATEDL
    cmp bl, 'i'
    je ADDSTATEDI

jmp ADDERORR
    ADDSTATES:
    inc si
    mov bx,[si]
    cmp bl, 'i'
    je ADDSTATESI
    cmp bl, 'p'
    je ADDSTATESP
jmp ADDERORR
    ;__________________________________________________ 
    ;;;;;
     ADDSTATEAH:
     inc si
     inc si
     mov bx,[si]
     cmp bl,'a'
     je ADDSTATEAHAL
     cmp bl, 'b'
     je ADDSTATEAHB
     
     cmp bl, 'c' 
     je ADDSTATEAHC
     
     cmp bl, 'd' 
     je ADDSTATEAHD
     cmp bl ,'['
     je ADDSTATEAHOFF
     
     cmp bl ,'v'
     je ADDSTATEAHV
     jmp ADDERORR
     ;;;;
     ADDSTATEAL:
     mov cl,88h
     inc si
     inc si
     mov bx, [si]
     mov cx,[si]
     cmp bl, 'a'
     je ADDSTATEALAH
     cmp bl,'b'
     je ADDSTATEALB
     cmp bl,'c'
     je ADDSTATEALC
     cmp bl,'d'
     je ADDSTATEALD
     cmp bl ,'v'
     je ADDSTATEALV 
     cmp bl , '['
      je ADDSTATEALOFF

      jmp ADDERORR

     
     
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      
     ADDSTATEBH:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je ADDSTATEBHA
     
     cmp bl, 'b'
     je ADDSTATEBHBL
     
     cmp bl, 'c' 
     je ADDSTATEBHC
      
     cmp bl, 'd'
     je ADDSTATEBHD 
     cmp bl ,'v'
     je ADDSTATEBHV
     cmp bl , '['
     je ADDSTATEBHOFF
     jmp ADDERORR
     ADDSTATEBL:
      
     inc si
     inc si
     mov cl,[si]
     mov bx,[si]  
     cmp bl,'a'
     je ADDSTATEBLA
     
     cmp bl, 'b'
     je ADDSTATEBLBH
     
     cmp bl, 'c' 
     je ADDSTATEBLC
      
     cmp bl, 'd'
     je ADDSTATEBLD
      cmp bl ,'v'
     je ADDSTATEBLV 
     cmp bl,'['
     je ADDSTATEBLOFF 
      jmp ADDERORR
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
     ADDSTATECH:
      
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je ADDSTATECHA
     
     cmp bl, 'b'
     je ADDSTATECHB
     
     cmp bl, 'c' 
     je ADDSTATECHCl  
      
     cmp bl, 'd'
     je ADDSTATECHD 
       cmp bl ,'v'
       je ADDSTATECHV
       cmp bl ,'['
       je ADDSTATECHOFF
     jmp ADDERORR
     ADDSTATECL:
      
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je ADDSTATECLA
     
     cmp bl, 'b'
     je ADDSTATECLB
     
     cmp bl, 'c' 
     je ADDSTATECLCH    ;;
      
     cmp bl, 'd'
     je ADDSTATECLD 
     
     cmp bl ,'v'
       je ADDSTATECLV 
       cmp bl ,'['
       je ADDSTATECLOFF
       jmp ADDERORR
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
     ADDSTATEDH:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je ADDSTATEDHA
     
     cmp bl, 'b'
     je ADDSTATEDHB
     
     cmp bl, 'c' 
     je ADDSTATEDHC
      
     cmp bl, 'd'
     je ADDSTATEDHDL 
     cmp bl ,'v'
     je ADDSTATEDHV
     cmp bl, '['
     je ADDSTATEDHOFF
     jmp ADDERORR
     ADDSTATEDL:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je ADDSTATEDLA
     
     cmp bl, 'b'
     je ADDSTATEDLB
     
     cmp bl, 'c' 
     je ADDSTATEDLC
      
     cmp bl, 'd'
     je ADDSTATEDLDH   ;;
     
      cmp bl,'v'
     je ADDSTATEDLV
     cmp bl,'['
     je ADDSTATEDLOFF
     jmp ADDERORR
      
      
    ;_________________________________________________
      ADDSTATEAHB:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je ADDSTATEAHBL
      cmp bl,'h'
      je ADDSTATEAHBH
      
      ADDSTATEAHC:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je ADDSTATEAHCL
      cmp bl,'h'
      je ADDSTATEAHCH
      
      jmp ADDERORR
      ADDSTATEAHD:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je ADDSTATEAHDL
      cmp bl,'h'
      je ADDSTATEAHDH
      
      jmp ADDERORR
      ADDSTATEALB:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je ADDSTATEALBL
      cmp bl,'h'
      je ADDSTATEALBH
      
      jmp ADDERORR
      
      ADDSTATEALC:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je ADDSTATEALCL
      cmp bl,'h'
      je ADDSTATEALCH
      
      jmp ADDERORR
      ADDSTATEALD:
      inc si
      mov bx,[si]
      cmp  bl, 'l'
      je ADDSTATEALDL
      cmp bl, 'h'
      je ADDSTATEALDH
jmp ADDERORR
      ADDSTATEAHOFF:
      inc si 
      mov bx,[si]
      cmp bl, 'b'
      je ADDSTATEAHOFFBX
      cmp bl, 's'
      je ADDSTATEAHOFFSI
      cmp bl, 'd'
      je ADDSTATEAHOFFDI
      inc si
      mov bx,[si]
      cmp bl,'0'
      je ADDSTATEAHOFF0
      cmp bl,'1'
      je ADDSTATEAHOFF1
      cmp bl,'2'
      je ADDSTATEAHOFF2
      cmp bl,'3'
      je ADDSTATEAHOFF3
      cmp bl,'4'
      je ADDSTATEAHOFF4
      cmp bl,'5'
      je ADDSTATEAHOFF5
      cmp bl,'6'
      je ADDSTATEAHOFF6
      cmp bl,'7'
      je ADDSTATEAHOFF7
      cmp bl,'8'
      je ADDSTATEAHOFF8
      cmp bl,'9'
      je ADDSTATEAHOFF9
      cmp bl,'A'
      je ADDSTATEAHOFFA
      cmp bl,'B'
      je ADDSTATEAHOFFB
      cmp bl,'C'
      je ADDSTATEAHOFFC
      cmp bl,'D'
      je ADDSTATEAHOFFD
      cmp bl,'E'
      je ADDSTATEAHOFFE
      cmp bl,'F'
      je ADDSTATEAHOFFF
      jmp ADDERORR

      ADDSTATEAHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je ADDSTATEAHOFF0
      cmp bx,1h
      je ADDSTATEAHOFF1
      cmp bx,2h
      je ADDSTATEAHOFF2
      cmp bx,3h
      je ADDSTATEAHOFF3
      cmp bx,4h
      je ADDSTATEAHOFF4
      cmp bx,5h
      je ADDSTATEAHOFF5
      cmp bx,6h
      je ADDSTATEAHOFF6
      cmp bx,7h
      je ADDSTATEAHOFF7
      cmp bx,8h
      je ADDSTATEAHOFF8
      cmp bx,9h
      je ADDSTATEAHOFF9
      cmp bx,0Ah
      je ADDSTATEAHOFFA
      cmp bx,0bh
      je ADDSTATEAHOFFB
      cmp bx,0ch
      je ADDSTATEAHOFFC
      cmp bx,0dh
      je ADDSTATEAHOFFD
      cmp bx,0eh
      je ADDSTATEAHOFFE
      cmp bx,0fh
      je ADDSTATEAHOFFF
jmp ADDERORR
      ADDSTATEAHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je ADDSTATEAHOFF0
      cmp bx,1h
      je ADDSTATEAHOFF1
      cmp bx,2h
      je ADDSTATEAHOFF2
      cmp bx,3h
      je ADDSTATEAHOFF3
      cmp bx,4h
      je ADDSTATEAHOFF4
      cmp bx,5h
      je ADDSTATEAHOFF5
      cmp bx,6h
      je ADDSTATEAHOFF6
      cmp bx,7h
      je ADDSTATEAHOFF7
      cmp bx,8h
      je ADDSTATEAHOFF8
      cmp bx,9h
      je ADDSTATEAHOFF9
      cmp bx,0Ah
      je ADDSTATEAHOFFA
      cmp bx,0bh
      je ADDSTATEAHOFFB
      cmp bx,0ch
      je ADDSTATEAHOFFC
      cmp bx,0dh
      je ADDSTATEAHOFFD
      cmp bx,0eh
      je ADDSTATEAHOFFE
      cmp bx,0fh
      je ADDSTATEAHOFFF
jmp ADDERORR
ADDSTATEAHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je ADDSTATEAHOFF0
      cmp bx,1h
      je ADDSTATEAHOFF1
      cmp bx,2h
      je ADDSTATEAHOFF2
      cmp bx,3h
      je ADDSTATEAHOFF3
      cmp bx,4h
      je ADDSTATEAHOFF4
      cmp bx,5h
      je ADDSTATEAHOFF5
      cmp bx,6h
      je ADDSTATEAHOFF6
      cmp bx,7h
      je ADDSTATEAHOFF7
      cmp bx,8h
      je ADDSTATEAHOFF8
      cmp bx,9h
      je ADDSTATEAHOFF9
      cmp bx,0Ah
      je ADDSTATEAHOFFA
      cmp bx,0bh
      je ADDSTATEAHOFFB
      cmp bx,0ch
      je ADDSTATEAHOFFC
      cmp bx,0dh
      je ADDSTATEAHOFFD
      cmp bx,0eh
      je ADDSTATEAHOFFE
      cmp bx,0fh
      je ADDSTATEAHOFFF
jmp ADDERORR
;;
      ADDSTATEALOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je ADDSTATEALOFFBX
       cmp bl, 's'
      je ADDSTATEALOFFSI
       cmp bl, 'd'
      je ADDSTATEALOFFDI
      inc si 
      mov bx,[si]
       cmp bl,'0'
      je ADDSTATEALOFF0
      cmp bl,'1'
      je ADDSTATEALOFF1
      cmp bl,'2'
      je ADDSTATEALOFF2
      cmp bl,'3'
      je ADDSTATEALOFF3
      cmp bl,'4'
      je ADDSTATEALOFF4
      cmp bl,'5'
      je ADDSTATEALOFF5
      cmp bl,'6'
      je ADDSTATEALOFF6
      cmp bl,'7'
      je ADDSTATEALOFF7
      cmp bl,'8'
      je ADDSTATEALOFF8
      cmp bl,'9'
      je ADDSTATEALOFF9
      cmp bl,'A'
      je ADDSTATEALOFFA
      cmp bl,'B'
      je ADDSTATEALOFFB
      cmp bl,'C'
      je ADDSTATEALOFFC
      cmp bl,'D'
      je ADDSTATEALOFFD
      cmp bl,'E'
      je ADDSTATEALOFFE
      cmp bl,'F'
      je ADDSTATEALOFFF
jmp ADDERORR
      ADDSTATEALOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je ADDSTATEALOFF0
      cmp bx,1h
      je ADDSTATEALOFF1
      cmp bx,2h
      je ADDSTATEALOFF2
      cmp bx,3h
      je ADDSTATEALOFF3
      cmp bx,4h
      je ADDSTATEALOFF4
      cmp bx,5h
      je ADDSTATEALOFF5
      cmp bx,6h
      je ADDSTATEALOFF6
      cmp bx,7h
      je ADDSTATEALOFF7
      cmp bx,8h
      je ADDSTATEALOFF8
      cmp bx,9h
      je ADDSTATEALOFF9
      cmp bx,0Ah
      je ADDSTATEALOFFA
      cmp bx,0bh
      je ADDSTATEALOFFB
      cmp bx,0ch
      je ADDSTATEALOFFC
      cmp bx,0dh
      je ADDSTATEALOFFD
      cmp bx,0eh
      je ADDSTATEALOFFE
      cmp bx,0fh
      je ADDSTATEALOFFF
jmp ADDERORR
      ADDSTATEALOFFSI:
      mov bx,p1si
      cmp bx, 0
      je ADDSTATEALOFF0
      cmp bx,1h
      je ADDSTATEALOFF1
      cmp bx,2h
      je ADDSTATEALOFF2
      cmp bx,3h
      je ADDSTATEALOFF3
      cmp bx,4h
      je ADDSTATEALOFF4
      cmp bx,5h
      je ADDSTATEALOFF5
      cmp bx,6h
      je ADDSTATEALOFF6
      cmp bx,7h
      je ADDSTATEALOFF7
      cmp bx,8h
      je ADDSTATEALOFF8
      cmp bx,9h
      je ADDSTATEALOFF9
      cmp bx,0Ah
      je ADDSTATEALOFFA
      cmp bx,0bh
      je ADDSTATEALOFFB
      cmp bx,0ch
      je ADDSTATEALOFFC
      cmp bx,0dh
      je ADDSTATEALOFFD
      cmp bx,0eh
      je ADDSTATEALOFFE
      cmp bx,0fh
      je ADDSTATEALOFFF
jmp ADDERORR
ADDSTATEALOFFDI:
      mov bx,p1di
      cmp bx, 0
      je ADDSTATEALOFF0
      cmp bx,1h
      je ADDSTATEALOFF1
      cmp bx,2h
      je ADDSTATEALOFF2
      cmp bx,3h
      je ADDSTATEALOFF3
      cmp bx,4h
      je ADDSTATEALOFF4
      cmp bx,5h
      je ADDSTATEALOFF5
      cmp bx,6h
      je ADDSTATEALOFF6
      cmp bx,7h
      je ADDSTATEALOFF7
      cmp bx,8h
      je ADDSTATEALOFF8
      cmp bx,9h
      je ADDSTATEALOFF9
      cmp bx,0Ah
      je ADDSTATEALOFFA
      cmp bx,0bh
      je ADDSTATEALOFFB
      cmp bx,0ch
      je ADDSTATEALOFFC
      cmp bx,0dh
      je ADDSTATEALOFFD
      cmp bx,0eh
      je ADDSTATEALOFFE
      cmp bx,0fh
      je ADDSTATEALOFFF

jmp ADDERORR
;;;;;; BBBBBBB

      ADDSTATEBHOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je ADDSTATEBHOFFBX
      cmp bl, 's'
      je ADDSTATEBHOFFSI
      cmp bl, 'd'
      je ADDSTATEBHOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je ADDSTATEBHOFF0
      cmp bl,'1'
      je ADDSTATEBHOFF1
      cmp bl,'2'
      je ADDSTATEBHOFF2
      cmp bl,'3'
      je ADDSTATEBHOFF3
      cmp bl,'4'
      je ADDSTATEBHOFF4
      cmp bl,'5'
      je ADDSTATEBHOFF5
      cmp bl,'6'
      je ADDSTATEBHOFF6
      cmp bl,'7'
      je ADDSTATEBHOFF7
      cmp bl,'8'
      je ADDSTATEBHOFF8
      cmp bl,'9'
      je ADDSTATEBHOFF9
      cmp bl,'A'
      je ADDSTATEBHOFFA
      cmp bl,'B'
      je ADDSTATEBHOFFB
      cmp bl,'C'
      je ADDSTATEBHOFFC
      cmp bl,'D'
      je ADDSTATEBHOFFD
      cmp bl,'E'
      je ADDSTATEBHOFFE
      cmp bl,'F'
      je ADDSTATEBHOFFF
jmp ADDERORR
      ADDSTATEBHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je ADDSTATEBHOFF0
      cmp bx,1h
      je ADDSTATEBHOFF1
      cmp bx,2h
      je ADDSTATEBHOFF2
      cmp bx,3h
      je ADDSTATEBHOFF3
      cmp bx,4h
      je ADDSTATEBHOFF4
      cmp bx,5h
      je ADDSTATEBHOFF5
      cmp bx,6h
      je ADDSTATEBHOFF6
      cmp bx,7h
      je ADDSTATEBHOFF7
      cmp bx,8h
      je ADDSTATEBHOFF8
      cmp bx,9h
      je ADDSTATEBHOFF9
      cmp bx,0Ah
      je ADDSTATEBHOFFA
      cmp bx,0bh
      je ADDSTATEBHOFFB
      cmp bx,0ch
      je ADDSTATEBHOFFC
      cmp bx,0dh
      je ADDSTATEBHOFFD
      cmp bx,0eh
      je ADDSTATEBHOFFE
      cmp bx,0fh
      je ADDSTATEBHOFFF
jmp ADDERORR
      ADDSTATEBHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je ADDSTATEBHOFF0
      cmp bx,1h
      je ADDSTATEBHOFF1
      cmp bx,2h
      je ADDSTATEBHOFF2
      cmp bx,3h
      je ADDSTATEBHOFF3
      cmp bx,4h
      je ADDSTATEBHOFF4
      cmp bx,5h
      je ADDSTATEBHOFF5
      cmp bx,6h
      je ADDSTATEBHOFF6
      cmp bx,7h
      je ADDSTATEBHOFF7
      cmp bx,8h
      je ADDSTATEBHOFF8
      cmp bx,9h
      je ADDSTATEBHOFF9
      cmp bx,0Ah
      je ADDSTATEBHOFFA
      cmp bx,0bh
      je ADDSTATEBHOFFB
      cmp bx,0ch
      je ADDSTATEBHOFFC
      cmp bx,0dh
      je ADDSTATEBHOFFD
      cmp bx,0eh
      je ADDSTATEBHOFFE
      cmp bx,0fh
      je ADDSTATEBHOFFF
jmp ADDERORR
      ADDSTATEBHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je ADDSTATEBHOFF0
      cmp bx,1h
      je ADDSTATEBHOFF1
      cmp bx,2h
      je ADDSTATEBHOFF2
      cmp bx,3h
      je ADDSTATEBHOFF3
      cmp bx,4h
      je ADDSTATEBHOFF4
      cmp bx,5h
      je ADDSTATEBHOFF5
      cmp bx,6h
      je ADDSTATEBHOFF6
      cmp bx,7h
      je ADDSTATEBHOFF7
      cmp bx,8h
      je ADDSTATEBHOFF8
      cmp bx,9h
      je ADDSTATEBHOFF9
      cmp bx,0Ah
      je ADDSTATEBHOFFA
      cmp bx,0bh
      je ADDSTATEBHOFFB
      cmp bx,0ch
      je ADDSTATEBHOFFC
      cmp bx,0dh
      je ADDSTATEBHOFFD
      cmp bx,0eh
      je ADDSTATEBHOFFE
      cmp bx,0fh
      je ADDSTATEBHOFFF

jmp ADDERORR

;;
      ADDSTATEBLOFF:
      inc si
       mov bx,[si]
      cmp bl, 'b'
      je ADDSTATEBLOFFBX
      cmp bl, 's'
      je ADDSTATEBLOFFSI
      cmp bl, 'd'
      je ADDSTATEBLOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je ADDSTATEBLOFF0
      cmp bl,'1'
      je ADDSTATEBLOFF1
      cmp bl,'2'
      je ADDSTATEBLOFF2
      cmp bl,'3'
      je ADDSTATEBLOFF3
      cmp bl,'4'
      je ADDSTATEBLOFF4
      cmp bl,'5'
      je ADDSTATEBLOFF5
      cmp bl,'6'
      je ADDSTATEBLOFF6
      cmp bl,'7'
      je ADDSTATEBLOFF7
      cmp bl,'8'
      je ADDSTATEBLOFF8
      cmp bl,'9'
      je ADDSTATEBLOFF9
      cmp bl,'A'
      je ADDSTATEBLOFFA
      cmp bl,'B'
      je ADDSTATEBLOFFB
      cmp bl,'C'
      je ADDSTATEBLOFFC
      cmp bl,'D'
      je ADDSTATEBLOFFD
      cmp bl,'E'
      je ADDSTATEBLOFFE
      cmp bl,'F'
      je ADDSTATEBLOFFF

jmp ADDERORR

    ADDSTATEBLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je ADDSTATEBLOFF0
      cmp bx,1h
      je ADDSTATEBLOFF1
      cmp bx,2h
      je ADDSTATEBLOFF2
      cmp bx,3h
      je ADDSTATEBLOFF3
      cmp bx,4h
      je ADDSTATEBLOFF4
      cmp bx,5h
      je ADDSTATEBLOFF5
      cmp bx,6h
      je ADDSTATEBLOFF6
      cmp bx,7h
      je ADDSTATEBLOFF7
      cmp bx,8h
      je ADDSTATEBLOFF8
      cmp bx,9h
      je ADDSTATEBLOFF9
      cmp bx,0Ah
      je ADDSTATEBLOFFA
      cmp bx,0bh
      je ADDSTATEBLOFFB
      cmp bx,0ch
      je ADDSTATEBLOFFC
      cmp bx,0dh
      je ADDSTATEBLOFFD
      cmp bx,0eh
      je ADDSTATEBLOFFE
      cmp bx,0fh
      je ADDSTATEBLOFFF
jmp ADDERORR
      ADDSTATEBLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je ADDSTATEBLOFF0
      cmp bx,1h
      je ADDSTATEBLOFF1
      cmp bx,2h
      je ADDSTATEBLOFF2
      cmp bx,3h
      je ADDSTATEBLOFF3
      cmp bx,4h
      je ADDSTATEBLOFF4
      cmp bx,5h
      je ADDSTATEBLOFF5
      cmp bx,6h
      je ADDSTATEBLOFF6
      cmp bx,7h
      je ADDSTATEBLOFF7
      cmp bx,8h
      je ADDSTATEBLOFF8
      cmp bx,9h
      je ADDSTATEBLOFF9
      cmp bx,0Ah
      je ADDSTATEBLOFFA
      cmp bx,0bh
      je ADDSTATEBLOFFB
      cmp bx,0ch
      je ADDSTATEBLOFFC
      cmp bx,0dh
      je ADDSTATEBLOFFD
      cmp bx,0eh
      je ADDSTATEBLOFFE
      cmp bx,0fh
      je ADDSTATEBLOFFF
jmp ADDERORR
      ADDSTATEBLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je ADDSTATEBLOFF0
      cmp bx,1h
      je ADDSTATEBLOFF1
      cmp bx,2h
      je ADDSTATEBLOFF2
      cmp bx,3h
      je ADDSTATEBLOFF3
      cmp bx,4h
      je ADDSTATEBLOFF4
      cmp bx,5h
      je ADDSTATEBLOFF5
      cmp bx,6h
      je ADDSTATEBLOFF6
      cmp bx,7h
      je ADDSTATEBLOFF7
      cmp bx,8h
      je ADDSTATEBLOFF8
      cmp bx,9h
      je ADDSTATEBLOFF9
      cmp bx,0Ah
      je ADDSTATEBLOFFA
      cmp bx,0bh
      je ADDSTATEBLOFFB
      cmp bx,0ch
      je ADDSTATEBLOFFC
      cmp bx,0dh
      je ADDSTATEBLOFFD
      cmp bx,0eh
      je ADDSTATEBLOFFE
      cmp bx,0fh
      je ADDSTATEBLOFFF

jmp ADDERORR
      ;;CCCCCCCCCC

      ADDSTATECHOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je ADDSTATECHOFFBX
      cmp bl, 's'
      je ADDSTATECHOFFSI
      cmp bl, 'd'
      je ADDSTATECHOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je ADDSTATECHOFF0
      cmp bl,'1'
      je ADDSTATECHOFF1
      cmp bl,'2'
      je ADDSTATECHOFF2
      cmp bl,'3'
      je ADDSTATECHOFF3
      cmp bl,'4'
      je ADDSTATECHOFF4
      cmp bl,'5'
      je ADDSTATECHOFF5
      cmp bl,'6'
      je ADDSTATECHOFF6
      cmp bl,'7'
      je ADDSTATECHOFF7
      cmp bl,'8'
      je ADDSTATECHOFF8
      cmp bl,'9'
      je ADDSTATECHOFF9
      cmp bl,'A'
      je ADDSTATECHOFFA
      cmp bl,'B'
      je ADDSTATECHOFFB
      cmp bl,'C'
      je ADDSTATECHOFFC
      cmp bl,'D'
      je ADDSTATECHOFFD
      cmp bl,'E'
      je ADDSTATECHOFFE
      cmp bl,'F'
      je ADDSTATECHOFFF

jmp ADDERORR
      ADDSTATECHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je ADDSTATECHOFF0
      cmp bx,1h
      je ADDSTATECHOFF1
      cmp bx,2h
      je ADDSTATECHOFF2
      cmp bx,3h
      je ADDSTATECHOFF3
      cmp bx,4h
      je ADDSTATECHOFF4
      cmp bx,5h
      je ADDSTATECHOFF5
      cmp bx,6h
      je ADDSTATECHOFF6
      cmp bx,7h
      je ADDSTATECHOFF7
      cmp bx,8h
      je ADDSTATECHOFF8
      cmp bx,9h
      je ADDSTATECHOFF9
      cmp bx,0Ah
      je ADDSTATECHOFFA
      cmp bx,0bh
      je ADDSTATECHOFFB
      cmp bx,0ch
      je ADDSTATECHOFFC
      cmp bx,0dh
      je ADDSTATECHOFFD
      cmp bx,0eh
      je ADDSTATECHOFFE
      cmp bx,0fh
      je ADDSTATECHOFFF
jmp ADDERORR
      ADDSTATECHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je ADDSTATECHOFF0
      cmp bx,1h
      je ADDSTATECHOFF1
      cmp bx,2h
      je ADDSTATECHOFF2
      cmp bx,3h
      je ADDSTATECHOFF3
      cmp bx,4h
      je ADDSTATECHOFF4
      cmp bx,5h
      je ADDSTATECHOFF5
      cmp bx,6h
      je ADDSTATECHOFF6
      cmp bx,7h
      je ADDSTATECHOFF7
      cmp bx,8h
      je ADDSTATECHOFF8
      cmp bx,9h
      je ADDSTATECHOFF9
      cmp bx,0Ah
      je ADDSTATECHOFFA
      cmp bx,0bh
      je ADDSTATECHOFFB
      cmp bx,0ch
      je ADDSTATECHOFFC
      cmp bx,0dh
      je ADDSTATECHOFFD
      cmp bx,0eh
      je ADDSTATECHOFFE
      cmp bx,0fh
      je ADDSTATECHOFFF
jmp ADDERORR
      ADDSTATECHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je ADDSTATECHOFF0
      cmp bx,1h
      je ADDSTATECHOFF1
      cmp bx,2h
      je ADDSTATECHOFF2
      cmp bx,3h
      je ADDSTATECHOFF3
      cmp bx,4h
      je ADDSTATECHOFF4
      cmp bx,5h
      je ADDSTATECHOFF5
      cmp bx,6h
      je ADDSTATECHOFF6
      cmp bx,7h
      je ADDSTATECHOFF7
      cmp bx,8h
      je ADDSTATECHOFF8
      cmp bx,9h
      je ADDSTATECHOFF9
      cmp bx,0Ah
      je ADDSTATECHOFFA
      cmp bx,0bh
      je ADDSTATECHOFFB
      cmp bx,0ch
      je ADDSTATECHOFFC
      cmp bx,0dh
      je ADDSTATECHOFFD
      cmp bx,0eh
      je ADDSTATECHOFFE
      cmp bx,0fh
      je ADDSTATECHOFFF
jmp ADDERORR

;;
      ADDSTATECLOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je ADDSTATECLOFFBX
      cmp bl, 's'
      je ADDSTATECLOFFSI
      cmp bl, 'd'
      je ADDSTATECLOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je ADDSTATECLOFF0
      cmp bl,'1'
      je ADDSTATECLOFF1
      cmp bl,'2'
      je ADDSTATECLOFF2
      cmp bl,'3'
      je ADDSTATECLOFF3
      cmp bl,'4'
      je ADDSTATECLOFF4
      cmp bl,'5'
      je ADDSTATECLOFF5
      cmp bl,'6'
      je ADDSTATECLOFF6
      cmp bl,'7'
      je ADDSTATECLOFF7
      cmp bl,'8'
      je ADDSTATECLOFF8
      cmp bl,'9'
      je ADDSTATECLOFF9
      cmp bl,'A'
      je ADDSTATECLOFFA
      cmp bl,'B'
      je ADDSTATECLOFFB
      cmp bl,'C'
      je ADDSTATECLOFFC
      cmp bl,'D'
      je ADDSTATECLOFFD
      cmp bl,'E'
      je ADDSTATECLOFFE
      cmp bl,'F'
      je ADDSTATECLOFFF
jmp ADDERORR
      
      ADDSTATECLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je ADDSTATECLOFF0
      cmp bx,1h
      je ADDSTATECLOFF1
      cmp bx,2h
      je ADDSTATECLOFF2
      cmp bx,3h
      je ADDSTATECLOFF3
      cmp bx,4h
      je ADDSTATECLOFF4
      cmp bx,5h
      je ADDSTATECLOFF5
      cmp bx,6h
      je ADDSTATECLOFF6
      cmp bx,7h
      je ADDSTATECLOFF7
      cmp bx,8h
      je ADDSTATECLOFF8
      cmp bx,9h
      je ADDSTATECLOFF9
      cmp bx,0Ah
      je ADDSTATECLOFFA
      cmp bx,0bh
      je ADDSTATECLOFFB
      cmp bx,0ch
      je ADDSTATECLOFFC
      cmp bx,0dh
      je ADDSTATECLOFFD
      cmp bx,0eh
      je ADDSTATECLOFFE
      cmp bx,0fh
      je ADDSTATECLOFFF
jmp ADDERORR
      ADDSTATECLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je ADDSTATECLOFF0
      cmp bx,1h
      je ADDSTATECLOFF1
      cmp bx,2h
      je ADDSTATECLOFF2
      cmp bx,3h
      je ADDSTATECLOFF3
      cmp bx,4h
      je ADDSTATECLOFF4
      cmp bx,5h
      je ADDSTATECLOFF5
      cmp bx,6h
      je ADDSTATECLOFF6
      cmp bx,7h
      je ADDSTATECLOFF7
      cmp bx,8h
      je ADDSTATECLOFF8
      cmp bx,9h
      je ADDSTATECLOFF9
      cmp bx,0Ah
      je ADDSTATECLOFFA
      cmp bx,0bh
      je ADDSTATECLOFFB
      cmp bx,0ch
      je ADDSTATECLOFFC
      cmp bx,0dh
      je ADDSTATECLOFFD
      cmp bx,0eh
      je ADDSTATECLOFFE
      cmp bx,0fh
      je ADDSTATECLOFFF
jmp ADDERORR
      ADDSTATECLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je ADDSTATECLOFF0
      cmp bx,1h
      je ADDSTATECLOFF1
      cmp bx,2h
      je ADDSTATECLOFF2
      cmp bx,3h
      je ADDSTATECLOFF3
      cmp bx,4h
      je ADDSTATECLOFF4
      cmp bx,5h
      je ADDSTATECLOFF5
      cmp bx,6h
      je ADDSTATECLOFF6
      cmp bx,7h
      je ADDSTATECLOFF7
      cmp bx,8h
      je ADDSTATECLOFF8
      cmp bx,9h
      je ADDSTATECLOFF9
      cmp bx,0Ah
      je ADDSTATECLOFFA
      cmp bx,0bh
      je ADDSTATECLOFFB
      cmp bx,0ch
      je ADDSTATECLOFFC
      cmp bx,0dh
      je ADDSTATECLOFFD
      cmp bx,0eh
      je ADDSTATECLOFFE
      cmp bx,0fh
      je ADDSTATECLOFFF

jmp ADDERORR

;;;;DDDDDDDDDDDDDDDD
 ADDSTATEDHOFF:
      inc si 
      mov bx,[si]
      cmp bl, 'b'
      je ADDSTATEDHOFFBX
      cmp bl, 's'
      je ADDSTATEDHOFFSI
      cmp bl, 'd'
      je ADDSTATEDHOFFDI
      inc si
      mov bx,[si]
      cmp bl,'0'
      je ADDSTATEDHOFF0
      cmp bl,'1'
      je ADDSTATEDHOFF1
      cmp bl,'2'
      je ADDSTATEDHOFF2
      cmp bl,'3'
      je ADDSTATEDHOFF3
      cmp bl,'4'
      je ADDSTATEDHOFF4
      cmp bl,'5'
      je ADDSTATEDHOFF5
      cmp bl,'6'
      je ADDSTATEDHOFF6
      cmp bl,'7'
      je ADDSTATEDHOFF7
      cmp bl,'8'
      je ADDSTATEDHOFF8
      cmp bl,'9'
      je ADDSTATEDHOFF9
      cmp bl,'A'
      je ADDSTATEDHOFFA
      cmp bl,'B'
      je ADDSTATEDHOFFB
      cmp bl,'C'
      je ADDSTATEDHOFFC
      cmp bl,'D'
      je ADDSTATEDHOFFD
      cmp bl,'E'
      je ADDSTATEDHOFFE
      cmp bl,'F'
      je ADDSTATEDHOFFF
jmp ADDERORR

      ADDSTATEDHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je ADDSTATEDHOFF0
      cmp bx,1h
      je ADDSTATEDHOFF1
      cmp bx,2h
      je ADDSTATEDHOFF2
      cmp bx,3h
      je ADDSTATEDHOFF3
      cmp bx,4h
      je ADDSTATEDHOFF4
      cmp bx,5h
      je ADDSTATEDHOFF5
      cmp bx,6h
      je ADDSTATEDHOFF6
      cmp bx,7h
      je ADDSTATEDHOFF7
      cmp bx,8h
      je ADDSTATEDHOFF8
      cmp bx,9h
      je ADDSTATEDHOFF9
      cmp bx,0Ah
      je ADDSTATEDHOFFA
      cmp bx,0bh
      je ADDSTATEDHOFFB
      cmp bx,0ch
      je ADDSTATEDHOFFC
      cmp bx,0dh
      je ADDSTATEDHOFFD
      cmp bx,0eh
      je ADDSTATEDHOFFE
      cmp bx,0fh
      je ADDSTATEDHOFFF
jmp ADDERORR
      ADDSTATEDHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je ADDSTATEDHOFF0
      cmp bx,1h
      je ADDSTATEDHOFF1
      cmp bx,2h
      je ADDSTATEDHOFF2
      cmp bx,3h
      je ADDSTATEDHOFF3
      cmp bx,4h
      je ADDSTATEDHOFF4
      cmp bx,5h
      je ADDSTATEDHOFF5
      cmp bx,6h
      je ADDSTATEDHOFF6
      cmp bx,7h
      je ADDSTATEDHOFF7
      cmp bx,8h
      je ADDSTATEDHOFF8
      cmp bx,9h
      je ADDSTATEDHOFF9
      cmp bx,0Ah
      je ADDSTATEDHOFFA
      cmp bx,0bh
      je ADDSTATEDHOFFB
      cmp bx,0ch
      je ADDSTATEDHOFFC
      cmp bx,0dh
      je ADDSTATEDHOFFD
      cmp bx,0eh
      je ADDSTATEDHOFFE
      cmp bx,0fh
      je ADDSTATEDHOFFF
jmp ADDERORR
      ADDSTATEDHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je ADDSTATEDHOFF0
      cmp bx,1h
      je ADDSTATEDHOFF1
      cmp bx,2h
      je ADDSTATEDHOFF2
      cmp bx,3h
      je ADDSTATEDHOFF3
      cmp bx,4h
      je ADDSTATEDHOFF4
      cmp bx,5h
      je ADDSTATEDHOFF5
      cmp bx,6h
      je ADDSTATEDHOFF6
      cmp bx,7h
      je ADDSTATEDHOFF7
      cmp bx,8h
      je ADDSTATEDHOFF8
      cmp bx,9h
      je ADDSTATEDHOFF9
      cmp bx,0Ah
      je ADDSTATEDHOFFA
      cmp bx,0bh
      je ADDSTATEDHOFFB
      cmp bx,0ch
      je ADDSTATEDHOFFC
      cmp bx,0dh
      je ADDSTATEDHOFFD
      cmp bx,0eh
      je ADDSTATEDHOFFE
      cmp bx,0fh
      je ADDSTATEDHOFFF
jmp ADDERORR



;;
      ADDSTATEDLOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je ADDSTATEDLOFFBX
      cmp bl, 's'
      je ADDSTATEDLOFFSI
      cmp bl, 'd'
      je ADDSTATEDLOFFDI
      inc si 
      mov bx,[si]
       cmp bl,'0'
      je ADDSTATEDLOFF0
      cmp bl,'1'
      je ADDSTATEDLOFF1
      cmp bl,'2'
      je ADDSTATEDLOFF2
      cmp bl,'3'
      je ADDSTATEDLOFF3
      cmp bl,'4'
      je ADDSTATEDLOFF4
      cmp bl,'5'
      je ADDSTATEDLOFF5
      cmp bl,'6'
      je ADDSTATEDLOFF6
      cmp bl,'7'
      je ADDSTATEDLOFF7
      cmp bl,'8'
      je ADDSTATEDLOFF8
      cmp bl,'9'
      je ADDSTATEDLOFF9
      cmp bl,'A'
      je ADDSTATEDLOFFA
      cmp bl,'B'
      je ADDSTATEDLOFFB
      cmp bl,'C'
      je ADDSTATEDLOFFC
      cmp bl,'D'
      je ADDSTATEDLOFFD
      cmp bl,'E'
      je ADDSTATEDLOFFE
      cmp bl,'F'
      je ADDSTATEDLOFFF
jmp ADDERORR
      
      ADDSTATEDLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je ADDSTATEDLOFF0
      cmp bx,1h
      je ADDSTATEDLOFF1
      cmp bx,2h
      je ADDSTATEDLOFF2
      cmp bx,3h
      je ADDSTATEDLOFF3
      cmp bx,4h
      je ADDSTATEDLOFF4
      cmp bx,5h
      je ADDSTATEDLOFF5
      cmp bx,6h
      je ADDSTATEDLOFF6
      cmp bx,7h
      je ADDSTATEDLOFF7
      cmp bx,8h
      je ADDSTATEDLOFF8
      cmp bx,9h
      je ADDSTATEDLOFF9
      cmp bx,0Ah
      je ADDSTATEDLOFFA
      cmp bx,0bh
      je ADDSTATEDLOFFB
      cmp bx,0ch
      je ADDSTATEDLOFFC
      cmp bx,0dh
      je ADDSTATEDLOFFD
      cmp bx,0eh
      je ADDSTATEDLOFFE
      cmp bx,0fh
      je ADDSTATEDLOFFF
jmp ADDERORR
      ADDSTATEDLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je ADDSTATEDLOFF0
      cmp bx,1h
      je ADDSTATEDLOFF1
      cmp bx,2h
      je ADDSTATEDLOFF2
      cmp bx,3h
      je ADDSTATEDLOFF3
      cmp bx,4h
      je ADDSTATEDLOFF4
      cmp bx,5h
      je ADDSTATEDLOFF5
      cmp bx,6h
      je ADDSTATEDLOFF6
      cmp bx,7h
      je ADDSTATEDLOFF7
      cmp bx,8h
      je ADDSTATEDLOFF8
      cmp bx,9h
      je ADDSTATEDLOFF9
      cmp bx,0Ah
      je ADDSTATEDLOFFA
      cmp bx,0bh
      je ADDSTATEDLOFFB
      cmp bx,0ch
      je ADDSTATEDLOFFC
      cmp bx,0dh
      je ADDSTATEDLOFFD
      cmp bx,0eh
      je ADDSTATEDLOFFE
      cmp bx,0fh
      je ADDSTATEDLOFFF
jmp ADDERORR
      ADDSTATEDLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je ADDSTATEDLOFF0
      cmp bx,1h
      je ADDSTATEDLOFF1
      cmp bx,2h
      je ADDSTATEDLOFF2
      cmp bx,3h
      je ADDSTATEDLOFF3
      cmp bx,4h
      je ADDSTATEDLOFF4
      cmp bx,5h
      je ADDSTATEDLOFF5
      cmp bx,6h
      je ADDSTATEDLOFF6
      cmp bx,7h
      je ADDSTATEDLOFF7
      cmp bx,8h
      je ADDSTATEDLOFF8
      cmp bx,9h
      je ADDSTATEDLOFF9
      cmp bx,0Ah
      je ADDSTATEDLOFFA
      cmp bx,0bh
      je ADDSTATEDLOFFB
      cmp bx,0ch
      je ADDSTATEDLOFFC
      cmp bx,0dh
      je ADDSTATEDLOFFD
      cmp bx,0eh
      je ADDSTATEDLOFFE
      cmp bx,0fh
      je ADDSTATEDLOFFF
jmp ADDERORR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; copy under
      

      

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      
      ADDSTATEBHA:
      inc si
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATEBHAL
      cmp bl,'h'
      je ADDSTATEBHAH
      jmp ADDERORR
      ADDSTATEBHC:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je ADDSTATEBHCL
      cmp bl,'h'
      je ADDSTATEBHCH
      jmp ADDERORR
      ADDSTATEBHD:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je ADDSTATEBHDL
      cmp bl,'h'
      je ADDSTATEBHDH 
      jmp ADDERORR
      
      
      
      ADDSTATEBLA:
      inc si
      mov bx,[si]
        cmp bl,'l'
      je ADDSTATEBLAL
      cmp bl,'h'
      je ADDSTATEBlAH
      jmp ADDERORR
      ADDSTATEBLC:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je ADDSTATEBLCL
      cmp bl,'h'
      je ADDSTATEBLCH
      jmp ADDERORR
      ADDSTATEBLD:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je ADDSTATEBLDL
      cmp bl,'h'
      je ADDSTATEBLDH 
      jmp ADDERORR
      
      
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
      ADDSTATECHA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATECHAL    
      cmp bl, 'h'
      je ADDSTATECHAH  
      jmp ADDERORR
       ADDSTATECHB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATECHBL      
      cmp bl, 'h'
      je ADDSTATECHBH        
      jmp ADDERORR
      
      ADDSTATECHD:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATECHDL            
      cmp bl, 'h'           
      je ADDSTATECHDH              
      
      jmp ADDERORR
      
      
      ADDSTATECLA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATECLAL    
      cmp bl, 'h'
      je ADDSTATECLAH  
      jmp ADDERORR
       ADDSTATECLB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATECLBL    
      cmp bl, 'h'
      je ADDSTATECLBH        
      jmp ADDERORR
      
      ADDSTATECLD:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATECLDL            
      cmp bl, 'h'           
      je ADDSTATECLDH     
      jmp ADDERORR
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
      ADDSTATEDHA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATEDHAL    
      cmp bl, 'h'
      je ADDSTATEDHAH  
      jmp ADDERORR
      ADDSTATEDHB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATEDHBL    
      cmp bl, 'h'
      je ADDSTATEDHBH   
      jmp ADDERORR
      ADDSTATEDHC:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATEDHCL   
      cmp bl, 'h'
      je ADDSTATEDHCH 
      jmp ADDERORR
      
       ADDSTATEDLA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATEDLAL    
      cmp bl, 'h'
      je ADDSTATEDLAH  
      jmp ADDERORR
      ADDSTATEDLB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATEDLBL    
      cmp bl, 'h'
      je ADDSTATEDLBH   
      jmp ADDERORR
      ADDSTATEDLC:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je ADDSTATEDLCL    
      cmp bl, 'h'
      je ADDSTATEDLCH  
      
      jmp ADDERORR
      
      
      
    ;------------------------------------------------
     
      
    ;---------------------------------------------
    
    ADDSTATESI:
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATESIAX
    cmp bl,'b'
    je ADDSTATESIB
    cmp bl,'c'
    je ADDSTATESICX
    cmp bl,'d'
    je ADDSTATESID
    cmp bl,'s'
    je ADDSTATESISP
    jmp ADDERORR
    ADDSTATESIB:
    inc si
    mov bx ,[si]
    cmp bl ,'p'
    je ADDSTATESIBP
    cmp bl,'x'
    je ADDSTATESIBX
jmp ADDERORR
    ADDSTATESID:
    inc si 
    mov bx,[si]
    cmp bl, 'x'
    je ADDSTATESIDX
    cmp bl,'p'
    je ADDSTATESIDI
jmp ADDERORR
    ;;;;;;;;;
    ADDSTATESP:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATESPAX ;
    cmp bl ,'c'
    je ADDSTATESPCX ;
    cmp bl ,'b'
    je ADDSTATESPB
    cmp bl,'d'
    je ADDSTATESPD
    cmp bl,'s'
    je ADDSTATESPSI ;
jmp ADDERORR
    ADDSTATESPB:
    inc si
    mov bx,[si]
    cmp bl,'x'
    je ADDSTATESPBX ;
    cmp bl, 'p'
    je ADDSTATESPBP ;
jmp ADDERORR
    ADDSTATESPD:
    inc si 
    mov bx,[si]
    cmp bl,'x'
    je ADDSTATESPDX;
    cmp bl,'i'
    je ADDSTATESPDI;
jmp ADDERORR
;;;;;;;;;;;
ADDSTATEDI:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEDIAX ;
    cmp bl ,'c'
    je ADDSTATEDICX ;
    cmp bl ,'b'
    je ADDSTATEDIB
    cmp bl,'d'
    je ADDSTATEDIDX ; 
    cmp bl, 's'
    je ADDSTATEDIS
jmp ADDERORR
    ADDSTATEDIB:
    inc si
    mov bx,[si]
    cmp bl,'x'
    je ADDSTATEDIBX ;
    cmp bl, 'p'
    je ADDSTATEDIBP ;
jmp ADDERORR
    ADDSTATEDIS:
    inc si
    mov bx,[si]
    cmp bl, 'i'
    je ADDSTATEDISI;
    cmp bl, 'p'
    je ADDSTATEDISP;

jmp ADDERORR
    ;;;;;;;;;;;
    ADDSTATEBP:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEBPAX ;
    cmp bl ,'c'
    je ADDSTATEBPCX ;
    cmp bl ,'b'
    je ADDSTATEBPBX ;
    cmp bl,'d'
    je ADDSTATEBPD
    cmp bl, 's'
    je ADDSTATEBPS
jmp ADDERORR
    ADDSTATEBPD:
    inc si
    mov bx,[si]
    cmp bl ,'x'
    je ADDSTATEBPDX;
    cmp bl ,'i'
    je ADDSTATEBPDI;
jmp ADDERORR
    ADDSTATEBPS:
    inc si
    mov bx,[si]
    cmp bl ,'i'
    je ADDSTATEBPSI;
    cmp bl,'p'
    je ADDSTATEBPSP;
jmp ADDERORR
   ;vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
   
   ADDSTATEAXV:
   
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW
   sub al,7
   ADDBELOW:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW2
   sub al,7
   ADDBELOW2:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe ADDBELOW3
   sub al,7
   ADDBELOW3:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW4
   sub al,7
   ADDBELOW4:
   sub al,30h
   add bl,al    
   
   add p1ax,bx
    jmp exitADD
  
   ADDSTATEBXV:
    inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW5
   sub al,7
   ADDBELOW5:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW6
   sub al,7
   ADDBELOW6:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe ADDBELOW7
   sub al,7
   ADDBELOW7:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW8
   sub al,7
   ADDBELOW8:
   sub al,30h
   add bl,al    
   
   add p1bx,bx
    jmp exitADD
    
    
   ADDSTATEDXV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW9
   sub al,7
   ADDBELOW9:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW10
   sub al,7
   ADDBELOW10:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe ADDBELOW11
   sub al,7
   ADDBELOW11:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW12
   sub al,7
   ADDBELOW12:
   sub al,30h
   add bl,al    
   
   add p1dx,bx
    jmp exitADD
    
    
    
   ADDSTATECXV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW13
   sub al,7
   ADDBELOW13:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW14
   sub al,7
   ADDBELOW14:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe ADDBELOW15
   sub al,7
   ADDBELOW15:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW16
   sub al,7
   ADDBELOW16:
   sub al,30h
   add bl,al    
   
   add p1cx,bx
   jmp exitADD
      
    
    
   ADDSTATEAHV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW17
   sub al,7
   ADDBELOW17:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW18
   sub al,7
   ADDBELOW18:
   sub al,30h
   add bh,al
   add p1ah,bh
    jmp exitADD
    
    
   ADDSTATEALV:
   mov cl,56h
  
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW19
   sub al,7
   ADDBELOW19:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW20
   sub al,7
   ADDBELOW20:
   sub al,30h
   add bh,al 

   add p1al,bh
   jmp exitADD
   
     
   ADDSTATEBHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW21
   sub al,7
   ADDBELOW21:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW22
   sub al,7
   ADDBELOW22:
   sub al,30h
   add bh,al 
   add p1bh,bh
   jmp exitADD
   
     
   ADDSTATEBLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW23
   sub al,7
   ADDBELOW23:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW24
   sub al,7
   ADDBELOW24:
   sub al,30h
   add bh,al 
   add p1bl,bh
   jmp exitADD
   
     
   ADDSTATECHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW25
   sub al,7
   ADDBELOW25:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW26
   sub al,7
   ADDBELOW26:
   sub al,30h
   add bh,al 
   add p1ch,bh
   jmp exitADD
   
     
   ADDSTATECLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW27
   sub al,7
   ADDBELOW27:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW28
   sub al,7
   ADDBELOW28:
   sub al,30h
   add bh,al 
   add p1cl,bh
   jmp exitADD
   
     
   ADDSTATEDHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW29
   sub al,7
   ADDBELOW29:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW30
   sub al,7
   ADDBELOW30:
   sub al,30h
   add bh,al 
   add p1dh,bh
   jmp exitADD
   
     
   ADDSTATEDLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW31
   sub al,7
   ADDBELOW31:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe ADDBELOW32
   sub al,7
   ADDBELOW32:
   sub al,30h
   add bh,al 
   add p1dl,bh
   jmp exitADD
    
   ;vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv 
    
    ;OFFFFFFFFFFFFFFFF
    ADDSTATEOFF0:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF0A
    cmp bl, 'b'
    je ADDSTATEOFF0B
    cmp bl, 'c'
    je ADDSTATEOFF0C
    cmp bl, 'd'
    je ADDSTATEOFF0D
jmp ADDERORR
    ;

    ADDSTATEOFF1:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF1A
    cmp bl, 'b'
    je ADDSTATEOFF1B
    cmp bl, 'c'
    je ADDSTATEOFF1C
    cmp bl, 'd'
    je ADDSTATEOFF1D
jmp ADDERORR
;

    ADDSTATEOFF2:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF2A
    cmp bl, 'b'
    je ADDSTATEOFF2B
    cmp bl, 'c'
    je ADDSTATEOFF2C
    cmp bl, 'd'
    je ADDSTATEOFF2D
jmp ADDERORR
;

    ADDSTATEOFF3:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF3A
    cmp bl, 'b'
    je ADDSTATEOFF3B
    cmp bl, 'c'
    je ADDSTATEOFF3C
    cmp bl, 'd'
    je ADDSTATEOFF3D
jmp ADDERORR
    ;
    ADDSTATEOFF4:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF4A
    cmp bl, 'b'
    je ADDSTATEOFF4B
    cmp bl, 'c'
    je ADDSTATEOFF4C
    cmp bl, 'd'
    je ADDSTATEOFF4D
jmp ADDERORR
ADDSTATEOFF5:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF5A
    cmp bl, 'b'
    je ADDSTATEOFF5B
    cmp bl, 'c'
    je ADDSTATEOFF5C
    cmp bl, 'd'
    je ADDSTATEOFF5D
jmp ADDERORR
;
ADDSTATEOFF6:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF6A
    cmp bl, 'b'
    je ADDSTATEOFF6B
    cmp bl, 'c'
    je ADDSTATEOFF6C
    cmp bl, 'd'
    je ADDSTATEOFF6D

jmp ADDERORR
;


ADDSTATEOFF7:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF7A
    cmp bl, 'b'
    je ADDSTATEOFF7B
    cmp bl, 'c'
    je ADDSTATEOFF7C
    cmp bl, 'd'
    je ADDSTATEOFF7D
jmp ADDERORR
    ;

    ADDSTATEOFF8:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF8A
    cmp bl, 'b'
    je ADDSTATEOFF8B
    cmp bl, 'c'
    je ADDSTATEOFF8C
    cmp bl, 'd'
    je ADDSTATEOFF8D
jmp ADDERORR
  ADDSTATEOFF9:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFF9A
    cmp bl, 'b'
    je ADDSTATEOFF9B
    cmp bl, 'c'
    je ADDSTATEOFF9C
    cmp bl, 'd'
    je ADDSTATEOFF9D
jmp ADDERORR
    ;

    ADDSTATEOFFA:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFFAA
    cmp bl, 'b'
    je ADDSTATEOFFAB
    cmp bl, 'c'
    je ADDSTATEOFFAC
    cmp bl, 'd'
    je ADDSTATEOFFAD
jmp ADDERORR
ADDSTATEOFFB:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFFBA
    cmp bl, 'b'
    je ADDSTATEOFFBB
    cmp bl, 'c'
    je ADDSTATEOFFBC
    cmp bl, 'd'
    je ADDSTATEOFFBD
jmp ADDERORR
ADDSTATEOFFC:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFFCA
    cmp bl, 'b'
    je ADDSTATEOFFCB
    cmp bl, 'c'
    je ADDSTATEOFFCC
    cmp bl, 'd'
    je ADDSTATEOFFCD
jmp ADDERORR

ADDSTATEOFFD:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFFDA
    cmp bl, 'b'
    je ADDSTATEOFFDB
    cmp bl, 'c'
    je ADDSTATEOFFDC
    cmp bl, 'd'
    je ADDSTATEOFFDD
jmp ADDERORR
ADDSTATEOFFE:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFFEA
    cmp bl, 'b'
    je ADDSTATEOFFEB
    cmp bl, 'c'
    je ADDSTATEOFFEC
    cmp bl, 'd'
    je ADDSTATEOFFED
jmp ADDERORR
ADDSTATEOFFF:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je ADDSTATEOFFFA
    cmp bl, 'b'
    je ADDSTATEOFFFB
    cmp bl, 'c'
    je ADDSTATEOFFFC
    cmp bl, 'd'
    je ADDSTATEOFFFD
    jmp ADDERORR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ADDSTATEOFF0A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF0AH
    cmp bl,'l'
    je ADDSTATEOFF0AL
jmp ADDERORR
    ADDSTATEOFF0B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF0BH
    cmp bl,'l'
    je ADDSTATEOFF0BL
jmp ADDERORR
    ADDSTATEOFF0C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF0CH
    cmp bl,'l'
    je ADDSTATEOFF0CL
jmp ADDERORR
    ADDSTATEOFF0D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF0DH
    cmp bl,'l'
    je ADDSTATEOFF0DL
jmp ADDERORR

    ADDSTATEOFF1A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF1AH
    cmp bl,'l'
    je ADDSTATEOFF1AL
jmp ADDERORR
    ADDSTATEOFF1B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF1BH
    cmp bl,'l'
    je ADDSTATEOFF1BL
jmp ADDERORR
    ADDSTATEOFF1C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF1CH
    cmp bl,'l'
    je ADDSTATEOFF1CL
jmp ADDERORR
    ADDSTATEOFF1D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF1DH
    cmp bl,'l'
    je ADDSTATEOFF1DL
jmp ADDERORR

    ;
    ADDSTATEOFF2A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF2AH
    cmp bl,'l'
    je ADDSTATEOFF2AL
jmp ADDERORR
    ADDSTATEOFF2B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF2BH
    cmp bl,'l'
    je ADDSTATEOFF2BL
jmp ADDERORR
    ADDSTATEOFF2C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF2CH
    cmp bl,'l'
    je ADDSTATEOFF2CL
jmp ADDERORR
    ADDSTATEOFF2D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF2DH
    cmp bl,'l'
    je ADDSTATEOFF2DL
jmp ADDERORR
;

ADDSTATEOFF3A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF3AH
    cmp bl,'l'
    je ADDSTATEOFF3AL
jmp ADDERORR
    ADDSTATEOFF3B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF3BH
    cmp bl,'l'
    je ADDSTATEOFF3BL
jmp ADDERORR
    ADDSTATEOFF3C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF3CH
    cmp bl,'l'
    je ADDSTATEOFF3CL
jmp ADDERORR
    ADDSTATEOFF3D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF3DH
    cmp bl,'l'
    je ADDSTATEOFF3DL
jmp ADDERORR
ADDSTATEOFF4A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF4AH
    cmp bl,'l'
    je ADDSTATEOFF4AL
jmp ADDERORR
    ADDSTATEOFF4B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF4BH
    cmp bl,'l'
    je ADDSTATEOFF4BL
jmp ADDERORR
    ADDSTATEOFF4C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF4CH
    cmp bl,'l'
    je ADDSTATEOFF4CL
jmp ADDERORR
    ADDSTATEOFF4D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF4DH
    cmp bl,'l'
    je ADDSTATEOFF4DL
jmp ADDERORR
ADDSTATEOFF5A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF5AH
    cmp bl,'l'
    je ADDSTATEOFF5AL
jmp ADDERORR
    ADDSTATEOFF5B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF5BH
    cmp bl,'l'
    je ADDSTATEOFF5BL
jmp ADDERORR
    ADDSTATEOFF5C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF5CH
    cmp bl,'l'
    je ADDSTATEOFF5CL
jmp ADDERORR
    ADDSTATEOFF5D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF5DH
    cmp bl,'l'
    je ADDSTATEOFF5DL
jmp ADDERORR
ADDSTATEOFF6A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF6AH
    cmp bl,'l'
    je ADDSTATEOFF6AL
jmp ADDERORR
    ADDSTATEOFF6B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF6BH
    cmp bl,'l'
    je ADDSTATEOFF6BL
jmp ADDERORR
    ADDSTATEOFF6C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF6CH
    cmp bl,'l'
    je ADDSTATEOFF6CL
jmp ADDERORR
    ADDSTATEOFF6D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF6DH
    cmp bl,'l'
    je ADDSTATEOFF6DL
jmp ADDERORR
ADDSTATEOFF7A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF7AH
    cmp bl,'l'
    je ADDSTATEOFF7AL
jmp ADDERORR
    ADDSTATEOFF7B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF7BH
    cmp bl,'l'
    je ADDSTATEOFF7BL
jmp ADDERORR
    ADDSTATEOFF7C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF7CH
    cmp bl,'l'
    je ADDSTATEOFF7CL
jmp ADDERORR
    ADDSTATEOFF7D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF7DH
    cmp bl,'l'
    je ADDSTATEOFF7DL
jmp ADDERORR
ADDSTATEOFF8A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF8AH
    cmp bl,'l'
    je ADDSTATEOFF8AL
jmp ADDERORR
    ADDSTATEOFF8B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF8BH
    cmp bl,'l'
    je ADDSTATEOFF8BL
jmp ADDERORR
    ADDSTATEOFF8C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF8CH
    cmp bl,'l'
    je ADDSTATEOFF8CL
jmp ADDERORR
    ADDSTATEOFF8D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF8DH
    cmp bl,'l'
    je ADDSTATEOFF8DL
jmp ADDERORR
ADDSTATEOFF9A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF9AH
    cmp bl,'l'
    je ADDSTATEOFF9AL
jmp ADDERORR
    ADDSTATEOFF9B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF9BH
    cmp bl,'l'
    je ADDSTATEOFF9BL
jmp ADDERORR
    ADDSTATEOFF9C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF9CH
    cmp bl,'l'
    je ADDSTATEOFF9CL
jmp ADDERORR
    ADDSTATEOFF9D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFF9DH
    cmp bl,'l'
    je ADDSTATEOFF9DL
jmp ADDERORR
ADDSTATEOFFAA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFAAH
    cmp bl,'l'
    je ADDSTATEOFFAAL
jmp ADDERORR
    ADDSTATEOFFAB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFABH
    cmp bl,'l'
    je ADDSTATEOFFABL
jmp ADDERORR
    ADDSTATEOFFAC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFACH
    cmp bl,'l'
    je ADDSTATEOFFACL
jmp ADDERORR
    ADDSTATEOFFAD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFADH
    cmp bl,'l'
    je ADDSTATEOFFADL
jmp ADDERORR
ADDSTATEOFFBA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFBAH
    cmp bl,'l'
    je ADDSTATEOFFBAL
jmp ADDERORR
    ADDSTATEOFFBB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFBBH
    cmp bl,'l'
    je ADDSTATEOFFBBL
jmp ADDERORR
    ADDSTATEOFFBC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFBCH
    cmp bl,'l'
    je ADDSTATEOFFBCL
jmp ADDERORR
    ADDSTATEOFFBD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFBDH
    cmp bl,'l'
    je ADDSTATEOFFBDL
jmp ADDERORR
ADDSTATEOFFCA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFCAH
    cmp bl,'l'
    je ADDSTATEOFFCAL
jmp ADDERORR
    ADDSTATEOFFCB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFCBH
    cmp bl,'l'
    je ADDSTATEOFFCBL
jmp ADDERORR
    ADDSTATEOFFCC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFCCH
    cmp bl,'l'
    je ADDSTATEOFFCCL
jmp ADDERORR
    ADDSTATEOFFCD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFCDH
    cmp bl,'l'
    je ADDSTATEOFFCDL
jmp ADDERORR
ADDSTATEOFFDA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFDAH
    cmp bl,'l'
    je ADDSTATEOFFDAL
jmp ADDERORR
    ADDSTATEOFFDB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFDBH
    cmp bl,'l'
    je ADDSTATEOFFDBL
jmp ADDERORR
    ADDSTATEOFFDC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFDCH
    cmp bl,'l'
    je ADDSTATEOFFDCL
jmp ADDERORR
    ADDSTATEOFFDD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFDDH
    cmp bl,'l'
    je ADDSTATEOFFDDL
jmp ADDERORR
ADDSTATEOFFEA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFEAH
    cmp bl,'l'
    je ADDSTATEOFFEAL
jmp ADDERORR
    ADDSTATEOFFEB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFEBH
    cmp bl,'l'
    je ADDSTATEOFFEBL
jmp ADDERORR
    ADDSTATEOFFEC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFECH
    cmp bl,'l'
    je ADDSTATEOFFECL
jmp ADDERORR
    ADDSTATEOFFED:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFEDH
    cmp bl,'l'
    je ADDSTATEOFFEDL
jmp ADDERORR
ADDSTATEOFFFA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFFAH
    cmp bl,'l'
    je ADDSTATEOFFFAL
jmp ADDERORR
    ADDSTATEOFFFB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFFBH
    cmp bl,'l'
    je ADDSTATEOFFFBL
jmp ADDERORR
    ADDSTATEOFFFC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFFCH
    cmp bl,'l'
    je ADDSTATEOFFFCL
jmp ADDERORR
    ADDSTATEOFFFD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je ADDSTATEOFFFDH
    cmp bl,'l'
    je ADDSTATEOFFFDL
jmp ADDERORR



    ;OFFFFFFFFFFFFFFFFFFFF
    ADDSTATEOFF0AL:
    mov ah,p1al
    add p10,ah  
    jmp exitADD
    ADDSTATEOFF0AH:
    mov ah,p1ah
    add p10,ah  
    jmp exitADD
    ADDSTATEOFF0BL:
    mov ah,p1bl
    add p10,ah  
    jmp exitADD
    ADDSTATEOFF0BH:
    mov ah,p1bh
    add p10,ah  
    jmp exitADD
    ADDSTATEOFF0CL:
    mov ah,p1cl
    add p10,ah  
    jmp exitADD
    ADDSTATEOFF0CH:
    mov ah,p1ch
    add p10,ah  
    jmp exitADD
    ADDSTATEOFF0DL:
    mov ah,p1dl
    add p10,ah  
    jmp exitADD
    ADDSTATEOFF0DH:
    mov ah,p1dh
    add p10,ah  
    jmp exitADD


    ;
    ADDSTATEOFF1AL:
    mov ah,p1al
    add p11,ah  
    jmp exitADD
    ADDSTATEOFF1AH:
    mov ah,p1ah
    add p11,ah  
    jmp exitADD
    ADDSTATEOFF1BL:
    mov ah,p1bl
    add p11,ah  
    jmp exitADD
    ADDSTATEOFF1BH:
    mov ah,p1bh
    add p11,ah  
    jmp exitADD
    ADDSTATEOFF1CL:
    mov ah,p1cl
    add p11,ah  
    jmp exitADD
    ADDSTATEOFF1CH:
    mov ah,p1ch
    add p11,ah  
    jmp exitADD
    ADDSTATEOFF1DL:
    mov ah,p1dl
    add p11,ah  
    jmp exitADD
    ADDSTATEOFF1DH:
    mov ah,p1dh
    add p11,ah  
    jmp exitADD

    ;

    ADDSTATEOFF2AL:
    mov ah,p1al
    add p12,ah  
    jmp exitADD
    ADDSTATEOFF2AH:
    mov ah,p1ah
    add p12,ah  
    jmp exitADD
    ADDSTATEOFF2BL:
    mov ah,p1bl
    add p12,ah  
    jmp exitADD
    ADDSTATEOFF2BH:
    mov ah,p1bh
    add p12,ah  
    jmp exitADD
    ADDSTATEOFF2CL:
    mov ah,p1cl
    add p12,ah  
    jmp exitADD
    ADDSTATEOFF2CH:
    mov ah,p1ch
    add p12,ah  
    jmp exitADD
    ADDSTATEOFF2DL:
    mov ah,p1dl
    add p12,ah  
    jmp exitADD
    ADDSTATEOFF2DH:
    mov ah,p1dh
    add p12,ah  
    jmp exitADD

    ;

    ADDSTATEOFF3AL:
    mov ah,p1al
    add p13,ah  
    jmp exitADD
    ADDSTATEOFF3AH:
    mov ah,p1ah
    add p13,ah  
    jmp exitADD
    ADDSTATEOFF3BL:
    mov ah,p1bl
    add p13,ah  
    jmp exitADD
    ADDSTATEOFF3BH:
    mov ah,p1bh
    add p13,ah  
    jmp exitADD
    ADDSTATEOFF3CL:
    mov ah,p1cl
    add p13,ah  
    jmp exitADD
    ADDSTATEOFF3CH:
    mov ah,p1ch
    add p13,ah  
    jmp exitADD
    ADDSTATEOFF3DL:
    mov ah,p1dl
    add p13,ah  
    jmp exitADD
    ADDSTATEOFF3DH:
    mov ah,p1dh
    add p13,ah  
    jmp exitADD
    ;
    ADDSTATEOFF4AL:
    mov ah,p1al
    add p14,ah  
    jmp exitADD
    ADDSTATEOFF4AH:
    mov ah,p1ah
    add p14,ah  
    jmp exitADD
    ADDSTATEOFF4BL:
    mov ah,p1bl
    add p14,ah  
    jmp exitADD
    ADDSTATEOFF4BH:
    mov ah,p1bh
    add p14,ah  
    jmp exitADD
    ADDSTATEOFF4CL:
    mov ah,p1cl
    add p14,ah  
    jmp exitADD
    ADDSTATEOFF4CH:
    mov ah,p1ch
    add p14,ah  
    jmp exitADD
    ADDSTATEOFF4DL:
    mov ah,p1dl
    add p14,ah  
    jmp exitADD
    ADDSTATEOFF4DH:
    mov ah,p1dh
    add p14,ah  
    jmp exitADD
;


ADDSTATEOFF5AL:
    mov ah,p1al
    add p15,ah  
    jmp exitADD
    ADDSTATEOFF5AH:
    mov ah,p1ah
    add p15,ah  
    jmp exitADD
    ADDSTATEOFF5BL:
    mov ah,p1bl
    add p15,ah  
    jmp exitADD
    ADDSTATEOFF5BH:
    mov ah,p1bh
    add p15,ah  
    jmp exitADD
    ADDSTATEOFF5CL:
    mov ah,p1cl
    add p15,ah  
    jmp exitADD
    ADDSTATEOFF5CH:
    mov ah,p1ch
    add p15,ah  
    jmp exitADD
    ADDSTATEOFF5DL:
    mov ah,p1dl
    add p15,ah  
    jmp exitADD
    ADDSTATEOFF5DH:
    mov ah,p1dh
    add p15,ah  
    jmp exitADD
    ;

    ADDSTATEOFF6AL:
    mov ah,p1al
    add p16,ah  
    jmp exitADD
    ADDSTATEOFF6AH:
    mov ah,p1ah
    add p16,ah  
    jmp exitADD
    ADDSTATEOFF6BL:
    mov ah,p1bl
    add p16,ah  
    jmp exitADD
    ADDSTATEOFF6BH:
    mov ah,p1bh
    add p16,ah  
    jmp exitADD
    ADDSTATEOFF6CL:
    mov ah,p1cl
    add p16,ah  
    jmp exitADD
    ADDSTATEOFF6CH:
    mov ah,p1ch
    add p16,ah  
    jmp exitADD
    ADDSTATEOFF6DL:
    mov ah,p1dl
    add p16,ah  
    jmp exitADD
    ADDSTATEOFF6DH:
    mov ah,p1dh
    add p16,ah  
    jmp exitADD
    ;
    ADDSTATEOFF7AL:
    mov ah,p1al
    add p17,ah  
    jmp exitADD
    ADDSTATEOFF7AH:
    mov ah,p1ah
    add p17,ah  
    jmp exitADD
    ADDSTATEOFF7BL:
    mov ah,p1bl
    add p17,ah  
    jmp exitADD
    ADDSTATEOFF7BH:
    mov ah,p1bh
    add p17,ah  
    jmp exitADD
    ADDSTATEOFF7CL:
    mov ah,p1cl
    add p17,ah  
    jmp exitADD
    ADDSTATEOFF7CH:
    mov ah,p1ch
    add p17,ah  
    jmp exitADD
    ADDSTATEOFF7DL:
    mov ah,p1dl
    add p17,ah  
    jmp exitADD
    ADDSTATEOFF7DH:
    mov ah,p1dh
    add p17,ah  
    jmp exitADD
    ;

    ADDSTATEOFF8AL:
    mov ah,p1al
    add p18,ah  
    jmp exitADD
    ADDSTATEOFF8AH:
    mov ah,p1ah
    add p18,ah  
    jmp exitADD
    ADDSTATEOFF8BL:
    mov ah,p1bl
    add p18,ah  
    jmp exitADD
    ADDSTATEOFF8BH:
    mov ah,p1bh
    add p18,ah  
    jmp exitADD
    ADDSTATEOFF8CL:
    mov ah,p1cl
    add p18,ah  
    jmp exitADD
    ADDSTATEOFF8CH:
    mov ah,p1ch
    add p18,ah  
    jmp exitADD
    ADDSTATEOFF8DL:
    mov ah,p1dl
    add p18,ah  
    jmp exitADD
    ADDSTATEOFF8DH:
    mov ah,p1dh
    add p18,ah  
    jmp exitADD
    ;

    ADDSTATEOFF9AL:
    mov ah,p1al
    add p19,ah  
    jmp exitADD
    ADDSTATEOFF9AH:
    mov ah,p1ah
    add p19,ah  
    jmp exitADD
    ADDSTATEOFF9BL:
    mov ah,p1bl
    add p19,ah  
    jmp exitADD
    ADDSTATEOFF9BH:
    mov ah,p1bh
    add p19,ah  
    jmp exitADD
    ADDSTATEOFF9CL:
    mov ah,p1cl
    add p19,ah  
    jmp exitADD
    ADDSTATEOFF9CH:
    mov ah,p1ch
    add p19,ah  
    jmp exitADD
    ADDSTATEOFF9DL:
    mov ah,p1dl
    add p19,ah  
    jmp exitADD
    ADDSTATEOFF9DH:
    mov ah,p1dh
    add p19,ah  
    jmp exitADD
    ;
    ADDSTATEOFFAAL:
    mov ah,p1al
    add p1a,ah  
    jmp exitADD
    ADDSTATEOFFAAH:
    mov ah,p1ah
    add p1a,ah  
    jmp exitADD
    ADDSTATEOFFABL:
    mov ah,p1bl
    add p1a,ah  
    jmp exitADD
    ADDSTATEOFFABH:
    mov ah,p1bh
    add p1a,ah  
    jmp exitADD
    ADDSTATEOFFACL:
    mov ah,p1cl
    add p1a,ah  
    jmp exitADD
    ADDSTATEOFFACH:
    mov ah,p1ch
    add p1a,ah  
    jmp exitADD
    ADDSTATEOFFADL:
    mov ah,p1dl
    add p1a,ah  
    jmp exitADD
    ADDSTATEOFFADH:
    mov ah,p1dh
    add p1a,ah  
    jmp exitADD

    ;
    ADDSTATEOFFBAL:
    mov ah,p1al
    add p1b,ah  
    jmp exitADD
    ADDSTATEOFFBAH:
    mov ah,p1ah
    add p1b,ah  
    jmp exitADD
    ADDSTATEOFFBBL:
    mov ah,p1bl
    add p1b,ah  
    jmp exitADD
    ADDSTATEOFFBBH:
    mov ah,p1bh
    add p1b,ah  
    jmp exitADD
    ADDSTATEOFFBCL:
    mov ah,p1cl
    add p1b,ah  
    jmp exitADD
    ADDSTATEOFFBCH:
    mov ah,p1ch
    add p1b,ah  
    jmp exitADD
    ADDSTATEOFFBDL:
    mov ah,p1dl
    add p1b,ah  
    jmp exitADD
    ADDSTATEOFFBDH:
    mov ah,p1dh
    add p1b,ah  
    jmp exitADD
    ;
    ADDSTATEOFFCAL:
    mov ah,p1al
    add p1c,ah  
    jmp exitADD
    ADDSTATEOFFCAH:
    mov ah,p1ah
    add p1c,ah  
    jmp exitADD
    ADDSTATEOFFCBL:
    mov ah,p1bl
    add p1c,ah  
    jmp exitADD
    ADDSTATEOFFCBH:
    mov ah,p1bh
    add p1c,ah  
    jmp exitADD
    ADDSTATEOFFCCL:
    mov ah,p1cl
    add p1c,ah  
    jmp exitADD
    ADDSTATEOFFCCH:
    mov ah,p1ch
    add p1c,ah  
    jmp exitADD
    ADDSTATEOFFCDL:
    mov ah,p1dl
    add p1c,ah  
    jmp exitADD
    ADDSTATEOFFCDH:
    mov ah,p1dh
    add p1c,ah  
    jmp exitADD
    ;
    ADDSTATEOFFDAL:
    mov ah,p1al
    add p1d,ah  
    jmp exitADD
    ADDSTATEOFFDAH:
    mov ah,p1ah
    add p1d,ah  
    jmp exitADD
    ADDSTATEOFFDBL:
    mov ah,p1bl
    add p1d,ah  
    jmp exitADD
    ADDSTATEOFFDBH:
    mov ah,p1bh
    add p1d,ah  
    jmp exitADD
    ADDSTATEOFFDCL:
    mov ah,p1cl
    add p1d,ah  
    jmp exitADD
    ADDSTATEOFFDCH:
    mov ah,p1ch
    add p1d,ah  
    jmp exitADD
    ADDSTATEOFFDDL:
    mov ah,p1dl
    add p1d,ah  
    jmp exitADD
    ADDSTATEOFFDDH:
    mov ah,p1dh
    add p1d,ah  
    jmp exitADD
    ;

    ADDSTATEOFFEAL:
    mov ah,p1al
    add p1e,ah  
    jmp exitADD
    ADDSTATEOFFEAH:
    mov ah,p1ah
    add p1e,ah  
    jmp exitADD
    ADDSTATEOFFEBL:
    mov ah,p1bl
    add p1e,ah  
    jmp exitADD
    ADDSTATEOFFEBH:
    mov ah,p1bh
    add p1e,ah  
    jmp exitADD
    ADDSTATEOFFECL:
    mov ah,p1cl
    add p1e,ah  
    jmp exitADD
    ADDSTATEOFFECH:
    mov ah,p1ch
    add p1e,ah  
    jmp exitADD
    ADDSTATEOFFEDL:
    mov ah,p1dl
    add p1e,ah  
    jmp exitADD
    ADDSTATEOFFEDH:
    mov ah,p1dh
    add p1e,ah  
    jmp exitADD
    ;

    ADDSTATEOFFFAL:
    mov ah,p1al
    add p1f,ah  
    jmp exitADD
    ADDSTATEOFFFAH:
    mov ah,p1ah
    add p1f,ah  
    jmp exitADD
    ADDSTATEOFFFBL:
    mov ah,p1bl
    add p1f,ah  
    jmp exitADD
    ADDSTATEOFFFBH:
    mov ah,p1bh
    add p1f,ah  
    jmp exitADD
    ADDSTATEOFFFCL:
    mov ah,p1cl
    add p1f,ah  
    jmp exitADD
    ADDSTATEOFFFCH:
    mov ah,p1ch
    add p1f,ah  
    jmp exitADD
    ADDSTATEOFFFDL:
    mov ah,p1dl
    add p1f,ah  
    jmp exitADD
    ADDSTATEOFFFDH:
    mov ah,p1dh
    add p1f,ah  
    jmp exitADD
   ;====================================================
   ADDSTATEDXTOAX:
   mov ax,p1ax
   add p1dx,ax
   jmp exitADD
   ADDSTATEDXTOBX:
   mov bx , p1bx
   add p1dx,bx
   jmp exitADD 
   ADDSTATEDXTOCX:
   mov cx, p1cx
   add p1dx,cx
   jmp exitADD
   ;===========
   ADDSTATECXTOAX:
   mov ax, p1ax
   add p1cx,ax
   jmp exitADD
   ADDSTATECXTOBX:
   mov bx ,p1bx
   add p1cx,bx
   jmp exitADD
   ADDSTATECXTODX:
   mov dx, p1dx
   add p1cx,dx
   jmp exitADD
   ;=============
   ADDSTATEBXTOAX:
   mov ax,p1ax
   add p1bx,ax
   jmp exitADD
   ADDSTATEBXTOCX:
   mov cx,p1cx
   add p1bx,cx
   jmp exitADD
   ADDSTATEBXTODX:
   mov dx, p1dx
   add p1bx,dx
   jmp exitADD
   ;=========
   ADDSTATEAXTOBX:
   mov bx, p1bx
   add p1ax,bx
   jmp exitADD
   ADDSTATEAXTOCX:
   mov cx,p1cx
   add p1ax,cx 
   jmp exitADD
   ADDSTATEAXTODX:
   mov dx, p1dx
   add p1ax,dx
   jmp exitADD

  ADDSTATEAXTOSI:
  mov bx, p1si
  add p1ax,bx
  jmp exitADD

  ADDSTATEAXTODI:
  mov bx, p1di
  add p1ax,bx
  jmp exitADD
  ADDSTATEAXTOSP:
  mov bx, p1sp
  add p1ax,bx
  jmp exitADD
  
  ADDSTATEAXTOBP:
  mov bx, p1bp
  add p1ax,bx
  jmp exitADD
  

  ADDSTATEBXTOBP :
  mov bx, p1bp
  add p1bx, bx
  jmp exitADD
  ADDSTATEBXTOSI :
  mov bx, p1si
  add p1bx, bx
  jmp exitADD
  
  ADDSTATEBXTOSP :
  mov bx, p1sp
  add p1bx, bx
  jmp exitADD
  ADDSTATEBXTODI :
  mov bx, p1di
  add p1bx, bx
  jmp exitADD
  
  ADDSTATECXTOSI :
  mov bx, p1si
  add p1cx, bx
  jmp exitADD

  ADDSTATECXTOSP :
  mov bx, p1sp
  add p1cx, bx
  jmp exitADD
  ADDSTATECXTOBP :
  mov bx, p1bp
  add p1cx, bx
  jmp exitADD
  ADDSTATECXTODI :
  mov bx, p1di
  add p1cx, bx
  jmp exitADD

  ADDSTATEDXTOSI: 
  mov bx, p1si
  add p1dx,bx
  jmp exitADD

ADDSTATEDXTOSP: 
  mov bx, p1sp
  add p1dx,bx
  jmp exitADD

ADDSTATEDXTOBP: 
  mov bx, p1bp
  add p1dx,bx
  jmp exitADD

ADDSTATEDXTODI: 
  mov bx, p1di
  add p1dx,bx
  jmp exitADD

ADDSTATESIAX:
mov ax,p1ax
add p1si,ax
jmp exitADD

ADDSTATESICX:
mov cx,p1cx
add p1si,cx
jmp exitADD
ADDSTATESIBX:
mov bx,p1bx
add p1si,bx
jmp exitADD
ADDSTATESIDX:
mov dx,p1dx
add p1si,dx
jmp exitADD

ADDSTATESISP:
mov bx,p1sp
add p1si,bx
jmp exitADD
ADDSTATESIBP:
mov bx,p1bp
add p1si,bx
jmp exitADD

ADDSTATESIDI:
mov bx,p1di
add p1si,bx
jmp exitADD

ADDSTATESPAX:
mov ax,p1ax
add p1sp,ax
jmp exitADD

ADDSTATESPBX:
mov bx,p1bx
add p1sp,bx
jmp exitADD

ADDSTATESPCX:
mov cx,p1cx
add p1sp,cx
jmp exitADD

ADDSTATESPDX:
mov dx,p1dx
add p1sp,dx
jmp exitADD

ADDSTATESPSI :
mov bx,p1si
add p1sp,bx
jmp exitADD

ADDSTATESPBP:
mov bx,p1bp
add p1sp,bx
jmp exitADD

ADDSTATESPDI:
mov bx,p1di
add p1sp,bx
jmp exitADD

;
ADDSTATEDIAX:
mov ax,p1ax
add p1di,ax
jmp exitADD
ADDSTATEDIBX:
mov bx,p1bx
add p1di,bx
jmp exitADD
ADDSTATEDICX:
mov cx,p1cx
add p1di,cx
jmp exitADD
ADDSTATEDIDX:
mov dx,p1dx
add p1di,dx
jmp exitADD

ADDSTATEDIBP:
mov bx,p1bp
add p1di,bx
jmp exitADD

ADDSTATEDISI:
mov bx,p1si
add p1di,bx
jmp exitADD

ADDSTATEDISP:
mov bx,p1sp
add p1di,bx
jmp exitADD

;;
ADDSTATEBPAX:
mov ax,p1ax
add p1bp,ax
jmp exitADD

ADDSTATEBPBX:
mov bx,p1bx
add p1bp,bx
jmp exitADD

ADDSTATEBPCX:
mov cx,p1cx
add p1bp,cx
jmp exitADD

ADDSTATEBPDX:
mov dx,p1dx
add p1bp,dx
jmp exitADD

ADDSTATEBPDI:
mov bx,p1di
add p1bp,bx
jmp exitADD

ADDSTATEBPSI:
mov bx,p1si
add p1bp,bx
jmp exitADD

ADDSTATEBPSP:
mov bx,p1sp
add p1bp,bx
jmp exitADD


ADDSTATEAHOFF0:
      mov al,p10
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFF1:
      mov al,p11
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFF2:
      mov al,p12
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFF3:
      mov al,p13
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFF4:
      mov al,p14
      add p1ah,al
      jmp exitADD
      ADDSTATEAHOFF5:
      mov al,p15
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFF6:
      mov al,p16
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFF7:
      mov al,p17
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFF8:
      mov al,p18
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFF9:
      mov al,p19
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFFA:
      mov al,p1a
      add p1ah,al
      jmp exitADD

      ADDSTATEAHOFFB:
      mov al,p1b
      add p1ah,al
      jmp exitADD
      ADDSTATEAHOFFC:
      mov al,p1c
      add p1ah,al
      jmp exitADD
      ADDSTATEAHOFFE:
      mov al,p1e
      add p1ah,al
      jmp exitADD
      ADDSTATEAHOFFF:
      mov al,p1f
      add p1ah,al
      jmp exitADD
      
      ADDSTATEAHOFFD:
       mov al,p1d
      add p1ah,al
      jmp exitADD

;;
ADDSTATEALOFF0:
      mov al,p10
      add p1al,al
      jmp exitADD
ADDSTATEALOFF1:
      mov al,p11
      add p1al,al
      jmp exitADD

      ADDSTATEALOFF2:
      mov al,p12
      add p1al,al
      jmp exitADD

      ADDSTATEALOFF3:
      mov al,p13
      add p1al,al
      jmp exitADD

      ADDSTATEALOFF4:
      mov al,p14
      add p1al,al
      jmp exitADD
      ADDSTATEALOFF5:
      mov al,p15
      add p1al,al
      jmp exitADD

      ADDSTATEALOFF6:
      mov al,p16
      add p1al,al
      jmp exitADD

      ADDSTATEALOFF7:
      mov al,p17
      add p1al,al
      jmp exitADD

      ADDSTATEALOFF8:
      mov al,p18
      add p1al,al
      jmp exitADD

      ADDSTATEALOFF9:
      mov al,p19
      add p1al,al
      jmp exitADD

      ADDSTATEALOFFA:
      mov al,p1a
      add p1al,al
      jmp exitADD

      ADDSTATEALOFFB:
      mov al,p1b
      add p1al,al
      jmp exitADD
      ADDSTATEALOFFC:
      mov al,p1c
      add p1al,al
      jmp exitADD
      ADDSTATEALOFFE:
      mov al,p1e
      add p1al,al
      jmp exitADD
      ADDSTATEALOFFF:
      mov al,p1f
      add p1al,al
      jmp exitADD
      
      ADDSTATEALOFFD:
       mov al,p1d
      add p1al,al
      jmp exitADD



;;;;;BBBB
ADDSTATEBHOFF0:
      mov al,p10
      add p1bh,al
      jmp exitADD
ADDSTATEBHOFF1:
      mov al,p11
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFF2:
      mov al,p12
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFF3:
      mov al,p13
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFF4:
      mov al,p14
      add p1bh,al
      jmp exitADD
      ADDSTATEBHOFF5:
      mov al,p15
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFF6:
      mov al,p16
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFF7:
      mov al,p17
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFF8:
      mov al,p18
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFF9:
      mov al,p19
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFFA:
      mov al,p1a
      add p1bh,al
      jmp exitADD

      ADDSTATEBHOFFB:
      mov al,p1b
      add p1bh,al
      jmp exitADD
      ADDSTATEBHOFFC:
      mov al,p1c
      add p1bh,al
      jmp exitADD
      ADDSTATEBHOFFE:
      mov al,p1e
      add p1bh,al
      jmp exitADD
      ADDSTATEBHOFFF:
      mov al,p1f
      add p1bh,al
      jmp exitADD
      
      ADDSTATEBHOFFD:
       mov al,p1d
      add p1bh,al
      jmp exitADD
;;
ADDSTATEBLOFF0:
      mov al,p10
      add p1bL,al
      jmp exitADD
ADDSTATEBLOFF1:
      mov al,p11
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFF2:
      mov al,p12
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFF3:
      mov al,p13
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFF4:
      mov al,p14
      add p1bL,al
      jmp exitADD
      ADDSTATEBLOFF5:
      mov al,p15
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFF6:
      mov al,p16
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFF7:
      mov al,p17
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFF8:
      mov al,p18
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFF9:
      mov al,p19
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFFA:
      mov al,p1a
      add p1bL,al
      jmp exitADD

      ADDSTATEBLOFFB:
      mov al,p1b
      add p1bL,al
      jmp exitADD
      ADDSTATEBLOFFC:
      mov al,p1c
      add p1bL,al
      jmp exitADD
      ADDSTATEBLOFFE:
      mov al,p1e
      add p1bL,al
      jmp exitADD
      ADDSTATEBLOFFF:
      mov al,p1f
      add p1bL,al
      jmp exitADD
      
      ADDSTATEBLOFFD:
       mov al,p1d
      add p1bL,al
      jmp exitADD




      ;;;;;CCCCCCCCCCC
      ADDSTATECHOFF0:
      mov al,p10
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFF1:
      mov al,p11
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFF2:
      mov al,p12
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFF3:
      mov al,p13
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFF4:
      mov al,p14
      add p1ch,al
      jmp exitADD
      ADDSTATECHOFF5:
      mov al,p15
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFF6:
      mov al,p16
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFF7:
      mov al,p17
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFF8:
      mov al,p18
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFF9:
      mov al,p19
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFFA:
      mov al,p1a
      add p1ch,al
      jmp exitADD

      ADDSTATECHOFFB:
      mov al,p1b
      add p1ch,al
      jmp exitADD
      ADDSTATECHOFFC:
      mov al,p1c
      add p1ch,al
      jmp exitADD
      ADDSTATECHOFFE:
      mov al,p1e
      add p1ch,al
      jmp exitADD
      ADDSTATECHOFFF:
      mov al,p1f
      add p1ch,al
      jmp exitADD
      
      ADDSTATECHOFFD:
       mov al,p1d
      add p1ch,al
      jmp exitADD

;;
ADDSTATECLOFF0:
      mov al,p10
      add p1cl,al
      jmp exitADD
ADDSTATECLOFF1:
      mov al,p11
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFF2:
      mov al,p12
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFF3:
      mov al,p13
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFF4:
      mov al,p14
      add p1cl,al
      jmp exitADD
      ADDSTATECLOFF5:
      mov al,p15
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFF6:
      mov al,p16
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFF7:
      mov al,p17
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFF8:
      mov al,p18
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFF9:
      mov al,p19
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFFA:
      mov al,p1a
      add p1cl,al
      jmp exitADD

      ADDSTATECLOFFB:
      mov al,p1b
      add p1cl,al
      jmp exitADD
      ADDSTATECLOFFC:
      mov al,p1c
      add p1cl,al
      jmp exitADD
      ADDSTATECLOFFE:
      mov al,p1e
      add p1cl,al
      jmp exitADD
      ADDSTATECLOFFF:
      mov al,p1f
      add p1cl,al
      jmp exitADD
      
      ADDSTATECLOFFD:
       mov al,p1d
      add p1cl,al
      jmp exitADD
;;;;;;;DDDDDDDDDDDDDDDDDDDDDD

      ADDSTATEDHOFF0:
      mov al,p10
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFF1:
      mov al,p11
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFF2:
      mov al,p12
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFF3:
      mov al,p13
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFF4:
      mov al,p14
      add p1dh,al
      jmp exitADD
      ADDSTATEDHOFF5:
      mov al,p15
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFF6:
      mov al,p16
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFF7:
      mov al,p17
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFF8:
      mov al,p18
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFF9:
      mov al,p19
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFFA:
      mov al,p1a
      add p1dh,al
      jmp exitADD

      ADDSTATEDHOFFB:
      mov al,p1b
      add p1dh,al
      jmp exitADD
      ADDSTATEDHOFFC:
      mov al,p1c
      add p1dh,al
      jmp exitADD
      ADDSTATEDHOFFE:
      mov al,p1e
      add p1dh,al
      jmp exitADD
      ADDSTATEDHOFFF:
      mov al,p1f
      add p1dh,al
      jmp exitADD
      
      ADDSTATEDHOFFD:
       mov al,p1d
      add p1dh,al
      jmp exitADD

;;
ADDSTATEDLOFF0:
      mov al,p10
      add p1dl,al
      jmp exitADD
ADDSTATEDLOFF1:
      mov al,p11
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFF2:
      mov al,p12
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFF3:
      mov al,p13
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFF4:
      mov al,p14
      add p1dl,al
      jmp exitADD
      ADDSTATEDLOFF5:
      mov al,p15
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFF6:
      mov al,p16
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFF7:
      mov al,p17
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFF8:
      mov al,p18
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFF9:
      mov al,p19
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFFA:
      mov al,p1a
      add p1dl,al
      jmp exitADD

      ADDSTATEDLOFFB:
      mov al,p1b
      add p1dl,al
      jmp exitADD
      ADDSTATEDLOFFC:
      mov al,p1c
      add p1dl,al
      jmp exitADD
      ADDSTATEDLOFFE:
      mov al,p1e
      add p1dl,al
      jmp exitADD
      ADDSTATEDLOFFF:
      mov al,p1f
      add p1dl,al
      jmp exitADD
      
      ADDSTATEDLOFFD:
       mov al,p1d
      add p1dl,al
      jmp exitADD

;;

ADDSTATEAHAL:
     mov al, p1al
     add p1ah,al
     jmp exitADD
     
     ADDSTATEAHBL:
     mov bl, p1bl
     add p1ah,bl
     jmp exitADD
     
     ADDSTATEAHBH:
     mov bh, p1bh
     add p1ah,bh
     jmp exitADD
    
     ADDSTATEAHCL:
     mov cl, p1cl
          add p1ah,cl
     jmp exitADD
     
     ADDSTATEAHCH:
     mov ch, p1ch
     add p1ah,ch
     jmp exitADD
     ADDSTATEAHDL:
     mov dl, p1dl
     add p1ah,dl
     jmp exitADD
     
     ADDSTATEAHDH:
     mov dh, p1dh
     add p1ah,dh
     jmp exitADD
    
     ADDSTATEALAH:
     mov ah,p1ah
     add p1al,ah
     jmp exitADD
     
     ADDSTATEALBL:
     mov bl,p1bl
     add p1al,bl
     jmp exitADD
     
     ADDSTATEALBH:
     mov bh,p1bh
     add p1al,bh
     jmp exitADD
     
     ADDSTATEALCL:
     mov cl,p1cl
     add p1al,cl
     jmp exitADD
     
     ADDSTATEALCH:
     mov ch,p1ch
     add p1al,ch
     jmp exitADD
     
     ADDSTATEALDL:
     mov dl,p1dl
     add p1al,dl
     jmp exitADD
     
     ADDSTATEALDH:
     mov dh,p1dh
     add p1al,dh
     jmp exitADD
     
     ;;;;;;  ;;;;;;;;;;;;;;;;;;;;;;;;
     
     ADDSTATEBHBL:
     mov bl,p1bl
     add p1bh,bl
     jmp exitADD
     
     ADDSTATEBHAL:
     mov al, p1al
     add p1bh,al
     jmp exitADD
     
     ADDSTATEBHAH:
     mov ah, p1ah
     add p1bh ,ah
     jmp exitADD
     
     ADDSTATEBHCL:
     mov cl, p1cl
     add p1bh,cl
     jmp exitADD
     
     ADDSTATEBHCH:
     mov ch, p1ch
     add p1bh,ch
     jmp exitADD
     
     ADDSTATEBHDL:
     mov dl, p1dl
     add p1bh,dl
     jmp exitADD 
     
     ADDSTATEBHDH:
     mov dh, p1dh
     add p1bh,dh
     jmp exitADD
     
     
     ADDSTATEBLBH:
     mov bh,p1bh
     add p1bl,bh
     jmp exitADD
     
     
     ADDSTATEBLAL:
     mov al, p1al
     add p1bl,al
     jmp exitADD
     
     ADDSTATEBLAH:
     mov ah, p1ah
     add p1bl ,ah
     jmp exitADD
     
     ADDSTATEBLCL:
     mov cl, p1cl
     add p1bl,cl
     jmp exitADD
     
     ADDSTATEBLCH:
     mov ch, p1ch
     add p1bl,ch
     jmp exitADD
     
     ADDSTATEBLDL:
     mov dl, p1dl
     add p1bl,dl
     jmp exitADD 
     
     ADDSTATEBLDH:
     mov dh, p1dh
     add p1bl,dh
     jmp exitADD
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
      ADDSTATECHCl:
      mov cl, p1cl
      add p1ch,cl
      jmp exitADD
      
      ADDSTATECHAL:
      mov al, p1al
      add p1ch,al
      jmp exitADD
      
      ADDSTATECHAH:
      mov ah, p1ah
      add p1ch,ah
      jmp exitADD 
      
      ADDSTATECHBL:
      mov bl, p1bl
      add p1ch,bl
      jmp exitADD
      
      ADDSTATECHBH:
      mov bh, p1bh
      add p1ch,bh
      jmp exitADD
      
      ADDSTATECHDL:
      mov dl, p1dl
      add p1ch, dl
      jmp exitADD
      
      ADDSTATECHDH:
      mov dh, p1dh
      add p1ch,dh
      jmp exitADD 
      
      ADDSTATECLCH:
      mov ch, p1ch
      add p1cl,ch
      jmp exitADD
      
      ADDSTATECLAL:
      mov al, p1al
      add p1cl,al
      jmp exitADD
      
      ADDSTATECLAH:
      mov ah, p1ah
      add p1cl,ah
      jmp exitADD 
      
      ADDSTATECLBL:
      mov bl, p1bl
      add p1cl,bl
      jmp exitADD
      
      ADDSTATECLBH:
      mov bh, p1bh
      add p1cl,bh
      jmp exitADD
      
      ADDSTATECLDL:
      mov dl, p1dl
      add p1cl,dl
      jmp exitADD
      
      ADDSTATECLDH:
      mov dh, p1dh
      add p1cl,dh
      jmp exitADD 
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ADDSTATEDHDL:
      mov dl, p1dl
      add p1dh,dl
      jmp exitADD
      
      ADDSTATEDHAL:
      mov al, p1al
      add p1dh,al
      jmp exitADD
      
      ADDSTATEDHAH:
      mov ah, p1ah
      add p1dh,ah
      jmp exitADD
      
      ADDSTATEDHBL: 
      mov bl, p1bl
      add p1dh,bl
      jmp exitADD
      
      ADDSTATEDHBH:
      mov bh, p1bh
      add p1dh,bh
      jmp exitADD
      
      ADDSTATEDHCL:
      mov cl, p1cl
      add p1dh,cl
      jmp exitADD
      
      ADDSTATEDHCH:
      mov ch,p1ch
      add p1dh,ch
      jmp exitADD
      
      ADDSTATEDLDH:
      mov dh, p1dh
      add p1dl,dh
      jmp exitADD
      
      ADDSTATEDLAL:
      mov al, p1al
      add p1dl,al
      jmp exitADD
      
      ADDSTATEDLAH:
      mov ah, p1ah
      add p1dl,ah
      jmp exitADD
      
      ADDSTATEDLBL: 
      mov bl, p1bl
      add p1dl,bl
      jmp exitADD
      
      ADDSTATEDLBH:
      mov bh, p1bh
      add p1dl,bh
      jmp exitADD
      
      ADDSTATEDLCL:
      mov cl, p1cl
      add p1dl,cl
      jmp exitADD
      
      ADDSTATEDLCH:
      mov ch, p1ch
      add p1dl,ch
      jmp exitADD

   ;==========
   exitADD:
    ret
    addp endp  
    
 end 
    