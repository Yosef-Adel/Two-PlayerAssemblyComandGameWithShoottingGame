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

        EXTRN pgpoint  :BYTE

		 EXTRN command1 :BYTE
         EXTRN comand1 :BYTE
         EXTRN s :BYTE

        PUBLIC pro4
.MODEL SMALL
.386
.data


.CODE
pro4 PROC FAR
       mov ax,@data
	   mov ds,ax
	   
	  
	   
	   call MOVP
	  
        RET
pro4 ENDP

MOVP    proc  near
   
    lea si, s
    mov bx,[si]
    cmp bl,'m'
    je Mstate
    mov  dl, 1
    jmp exit
    
    
    
   Mstate: 
   inc si 
   inc si
   mov bx,[si]
   cmp bl, 'v' 
   je MOVSTATEVALIDATION
   mov  dl, 1
   jmp exit
           
   MOVSTATEVALIDATION:
   inc si
   inc si
  mov bx,[si]
  cmp bl,'s'
  je REVALIDATION
  cmp bl, 'd'
  je REVALIDATION
  cmp bl, 'b'
  je REVALIDATION
  cmp bl , '['
  je OFFVAlIDATION
  inc si  
   
   mov bx,[si]
   cmp bl, 'x'
   je XVALIDATION
   cmp bl, 'h'
   je HVALIDATION
           
   cmp bl, 'l'
   je HVALIDATION
   
   jmp ERORR
   
OFFVAlIDATION:
inc si 
mov bx,[si]
cmp bl,'b'
je OFFVAlIDATIONB
cmp bl, 'd'
je OFFVAlIDATIOND
cmp bl,'s'
je OFFVAlIDATIOND
inc si
inc si
mov bx,[si]
cmp bl,']'
je MOVSTATE
jmp ERORR

OFFVAlIDATIONB:
inc si
mov bx,[si]
cmp bl,'x'
jne ERORR
inc si 
mov bx,[si]
cmp bl ,']'
je MOVSTATE
jmp ERORR

OFFVAlIDATIOND:
inc si
mov bx,[si]
cmp bl,'i'
jne ERORR
inc si 
mov bx,[si]
cmp bl,']'
je MOVSTATE
jmp ERORR

   
   HVALIDATION:
   mov cl,03h
   inc si
   inc si
   mov bx,[si]
   cmp bl , 'v'
   je VHVALID  
   cmp bl,'['
   je OFFVALIDATIONG

   inc si
   mov bx,[si]
   cmp bl , 'x'
   je ERORR
   
   cmp bl , 'l'
   je ENDV
    
   cmp bl , 'h'
   je ENDV
   OFFVALIDATIONG:
   inc si
    mov bx,[si]
    cmp bl,'b'
   je OFFVAlIDATIONB
   cmp bl,'s'
   je OFFVAlIDATIOND
   cmp bl,'d'
   je OFFVAlIDATIOND
    inc si
    inc si
    mov bx,[si]
    cmp bl,']'
    je MOVSTATE
    jmp ERORR
   XVALIDATION:
   inc si
   inc si
   mov bx,[si]
   cmp bl, 'v'
   je VVALID
   cmp bl, 's'
   je MOVSTATE
   inc si
   mov bx,[si]
   cmp bl, 'x'
   je ENDV 
   cmp bl, 'x'
   jmp ERORR
   
   VHVALID:
   mov cl,04h
   inc si 
   inc si
   inc si
   mov bx,[si]
   cmp bl,'$'
   je MOVSTATE
   cmp bl, '$'
   jne ERORR
   
   VVALID:
   add si,6h
   mov bx,[si]
   cmp bl, '$'
   je MOVSTATE
   cmp bl, '$'
   jne ERORR
   
   
  REVALIDATION:
  inc si 
  mov bx, [si]
  cmp bl, 'l'
  je HVALIDATION
  cmp bl, "h"
  je HVALIDATION
  cmp bl, 'x'
  je XVALIDATION
   add si ,3
   mov bx, [si]
   cmp bl,'x'
   je MOVSTATE
   jmp ERORR

   ENDV:
   inc si 
   mov bx,[si]
   cmp bl,'$'
   je  MOVSTATE





   ERORR:
   ;mov dl,5
   dec pgpoint
   jmp exit
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
   MOVSTATE:
   lea si ,s +4
   mov bx,[si] 
   ;--
   cmp bl ,'['
   je MOVSTATEOFF
   cmp bl, 'a'
   je MOVSTATEA 
   ;--
   cmp bl ,'s'
   je MOVSTATES
   ;==
   cmp bl, 'b'
   je MOVSTATEB
   ;===
   cmp bl, 'c'
   je MOVSTATEC
   cmp bl, 'd'
   je MOVSTATED
   jmp ERORR
   ;============
   MOVSTATEAX:
   inc si
   inc si
   
   mov bx,[si]
   cmp bl, 'b' 
   je MOVSTATEAXTOB
   cmp bl, 'c' 
   je MOVSTATEAXTOCX
    cmp bl, 'd' 
   je MOVSTATEAXTOD
   cmp bl,'v'
   je MOVSTATEAXV
   cmp bl , 's'
   je  MOVSTATEAXTOS
   jmp ERORR

  MOVSTATEAXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je MOVSTATEAXTOSI
  cmp bl, 'p'
  je MOVSTATEAXTOSP
jmp ERORR
MOVSTATEAXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je MOVSTATEAXTODX

cmp bl, 'i'
je MOVSTATEAXTODI

jmp ERORR
  MOVSTATEAXTOB:
  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je MOVSTATEAXTOBX
  cmp bl, 'p'
  je MOVSTATEAXTOBP
  jmp ERORR
   ;========


   MOVSTATEBX:
   inc si
   inc si
   
   mov bx,[si]
   cmp bl, 'a' 
   je MOVSTATEBXTOAX
   cmp bl, 'c' 
   je MOVSTATEBXTOCX
    cmp bl, 'd' 
   je MOVSTATEBXTOD
   cmp bl ,'v'
   je MOVSTATEBXV
   cmp bl,'b'
   je MOVSTATEBXTOBP

    cmp bl , 's'
   je  MOVSTATEBXTOS

jmp ERORR
  MOVSTATEBXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je MOVSTATEBXTOSI
  cmp bl, 'p'
  je MOVSTATEBXTOSP

jmp ERORR
MOVSTATEBXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je MOVSTATEBXTODX
cmp bl, 'i'
je MOVSTATEBXTODI

jmp ERORR
   ;================
   MOVSTATECX:
   inc si
   inc si
 
   mov bx, [si]
   cmp bl, 'a' 
   je MOVSTATECXTOAX
   cmp bl, 'b' 
   je MOVSTATECXTOBX
    cmp bl, 'd' 
   je MOVSTATECXTOD
    cmp bl ,'v'
   je MOVSTATECXV

    cmp bl , 's'
   je  MOVSTATECXTOS

jmp ERORR

  MOVSTATECXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je MOVSTATECXTOSI
  cmp bl, 'p'
  je MOVSTATECXTOSP

jmp ERORR
  MOVSTATECXTOB:
  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je MOVSTATECXTOBX
  cmp bl, 'p'
  je MOVSTATECXTOBP

jmp ERORR
MOVSTATECXTOD:
inc si 
mov bx, [si]
cmp bl ,'x'
je MOVSTATECXTODX
cmp bl, 'i'
je MOVSTATECXTODI

   ;============
   jmp ERORR
    MOVSTATEDX:
   inc si
   inc si
 
   mov bx,[ si]
   cmp bl, 'a' 
   je MOVSTATEDXTOAX
   cmp bl, 'b' 
   je MOVSTATEDXTOB
    cmp bl, 'c' 
   je MOVSTATEDXTOCX
   cmp bl ,'v'
   je MOVSTATEDXV
    cmp bl ,'d'
    je MOVSTATEDXTODI
  cmp bl , 's'
  je  MOVSTATEDXTOS


jmp ERORR
  MOVSTATEDXTOS: 
  inc si 
  mov bx, [si]
  cmp bl, 'i'
  je MOVSTATEDXTOSI
  cmp bl, 'p'
  je MOVSTATEDXTOSP
jmp ERORR
  MOVSTATEDXTOB:

  inc si 
  mov bx, [si]
  cmp bl, 'x'
  je MOVSTATEDXTOBX
  cmp bl, 'p'
  je MOVSTATEDXTOBP
jmp ERORR
   ;============================================
   
    MOVSTATEOFF:
    inc si
    mov bx,[si]
    cmp bl,'b'
    je MOVSTATEOFFBX
    cmp bl,'s'
    je MOVSTATEOFFSI
    cmp bl,'d' 
    je MOVSTATEOFFDI
    inc si
    mov bx,[si]
    cmp bl,'0'
    je MOVSTATEOFF0
    cmp bl,'1'
    je MOVSTATEOFF1
    cmp bl,'2'
    je MOVSTATEOFF2
    cmp bl,'3'
    je MOVSTATEOFF3   
    cmp bl,'4'
    je MOVSTATEOFF4
    cmp bl,'5'
    je MOVSTATEOFF5
    cmp bl,'6'
    je MOVSTATEOFF6
    cmp bl,'8'
    je MOVSTATEOFF8
    cmp bl,'9'
    je MOVSTATEOFF9
    cmp bl,'A'
    je MOVSTATEOFFA
    cmp bl,'B'
    je MOVSTATEOFFB
    cmp bl,'C'
    je MOVSTATEOFFC
    cmp bl,'D'
    je MOVSTATEOFFD
    cmp bl,'E'
    je MOVSTATEOFFE
    cmp bl,'F'
    je MOVSTATEOFFF
jmp ERORR
    MOVSTATEOFFBX:
    inc si
    mov bx,p1bx

    cmp bx,0h
    je MOVSTATEOFF0
    cmp bx,1h
    je MOVSTATEOFF1
    cmp bx,2h
    je MOVSTATEOFF2
    cmp bx,3h
    je MOVSTATEOFF3
    cmp bx,4h
    je MOVSTATEOFF4
    cmp bx,5h
    je MOVSTATEOFF5
    cmp bx,6h
    je MOVSTATEOFF6
    cmp bx,7h
    je MOVSTATEOFF7
    cmp bx,8h
    je MOVSTATEOFF8
    cmp bx,9h
    je MOVSTATEOFF9
    cmp bx,0ah
    je MOVSTATEOFFA
    cmp bx,0bh
    je MOVSTATEOFFB
    cmp bx,0ch
    je MOVSTATEOFFC
    cmp bx,0dh
    je MOVSTATEOFFD
    cmp bx,0eh
    je MOVSTATEOFFE
    cmp bx,0fh
    je MOVSTATEOFFF
    jmp ERORR
   MOVSTATEOFFSI:
  inc si
    mov bx,p1si

    cmp bx,0h
    je MOVSTATEOFF0
    cmp bx,1h
    je MOVSTATEOFF1
    cmp bx,2h
    je MOVSTATEOFF2
    cmp bx,3h
    je MOVSTATEOFF3
    cmp bx,4h
    je MOVSTATEOFF4
    cmp bx,5h
    je MOVSTATEOFF5
    cmp bx,6h
    je MOVSTATEOFF6
    cmp bx,7h
    je MOVSTATEOFF7
    cmp bx,8h
    je MOVSTATEOFF8
    cmp bx,9h
    je MOVSTATEOFF9
    cmp bx,0ah
    je MOVSTATEOFFA
    cmp bx,0bh
    je MOVSTATEOFFB
    cmp bx,0ch
    je MOVSTATEOFFC
    cmp bx,0dh
    je MOVSTATEOFFD
    cmp bx,0eh
    je MOVSTATEOFFE
    cmp bx,0fh
    je MOVSTATEOFFF
    jmp ERORR
     MOVSTATEOFFDI:
    inc si
    mov bx,p1di

    cmp bx,0h
    je MOVSTATEOFF0
    cmp bx,1h
    je MOVSTATEOFF1
    cmp bx,2h
    je MOVSTATEOFF2
    cmp bx,3h
    je MOVSTATEOFF3
    cmp bx,4h
    je MOVSTATEOFF4
    cmp bx,5h
    je MOVSTATEOFF5
    cmp bx,6h
    je MOVSTATEOFF6
    cmp bx,7h
    je MOVSTATEOFF7
    cmp bx,8h
    je MOVSTATEOFF8
    cmp bx,9h
    je MOVSTATEOFF9
    cmp bx,0ah
    je MOVSTATEOFFA
    cmp bx,0bh
    je MOVSTATEOFFB
    cmp bx,0ch
    je MOVSTATEOFFC
    cmp bx,0dh
    je MOVSTATEOFFD
    cmp bx,0eh
    je MOVSTATEOFFE
    cmp bx,0fh
    je MOVSTATEOFFF
    jmp ERORR


    
    
    
    MOVSTATEA:
    inc si
    mov bx,[si]
    cmp bl, 'x'
    je MOVSTATEAX
    cmp bl , 'h'
    je MOVSTATEAH
    cmp bl , 'l'
    je MOVSTATEAL
     jmp ERORR
    MOVSTATEB:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je MOVSTATEBX
    cmp bl , 'h'
    je MOVSTATEBH
    cmp bl , 'l'
    je MOVSTATEBL
    cmp bl , 'p'
    je MOVSTATEBP
 jmp ERORR
    
    
    MOVSTATEC:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je MOVSTATECX
    cmp bl , 'h'
    je MOVSTATECH
    cmp bl , 'l'
    je MOVSTATECL
    jmp ERORR
    MOVSTATED:
    inc si
    mov bx, [si]
    cmp bl, 'x'
    je MOVSTATEDX
    cmp bl , 'h'
    je MOVSTATEDH
    cmp bl , 'l'
    je MOVSTATEDL
    cmp bl, 'i'
    je MOVSTATEDI

jmp ERORR
    MOVSTATES:
    inc si
    mov bx,[si]
    cmp bl, 'i'
    je MOVSTATESI
    cmp bl, 'p'
    je MOVSTATESP
jmp ERORR
    ;__________________________________________________ 
    ;;;;;
     MOVSTATEAH:
     inc si
     inc si
     mov bx,[si]
     cmp bl,'a'
     je MOVSTATEAHAL
     cmp bl, 'b'
     je MOVSTATEAHB
     
     cmp bl, 'c' 
     je MOVSTATEAHC
     
     cmp bl, 'd' 
     je MOVSTATEAHD
     cmp bl ,'['
     je MOVSTATEAHOFF
     
     cmp bl ,'v'
     je MOVSTATEAHV
     jmp ERORR
     ;;;;
     MOVSTATEAL:
     mov cl,88h
     inc si
     inc si
     mov bx, [si]
     mov cx,[si]
     cmp bl, 'a'
     je MOVSTATEALAH
     cmp bl,'b'
     je MOVSTATEALB
     cmp bl,'c'
     je MOVSTATEALC
     cmp bl,'d'
     je MOVSTATEALD
     cmp bl ,'v'
     je MOVSTATEALV 
     cmp bl , '['
      je MOVSTATEALOFF

      jmp ERORR

     
     
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      
     MOVSTATEBH:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je MOVSTATEBHA
     
     cmp bl, 'b'
     je MOVSTATEBHBL
     
     cmp bl, 'c' 
     je MOVSTATEBHC
      
     cmp bl, 'd'
     je MOVSTATEBHD 
     cmp bl ,'v'
     je MOVSTATEBHV
     cmp bl , '['
     je MOVSTATEBHOFF
     jmp ERORR
     MOVSTATEBL:
      
     inc si
     inc si
     mov cl,[si]
     mov bx,[si]  
     cmp bl,'a'
     je MOVSTATEBLA
     
     cmp bl, 'b'
     je MOVSTATEBLBH
     
     cmp bl, 'c' 
     je MOVSTATEBLC
      
     cmp bl, 'd'
     je MOVSTATEBLD
      cmp bl ,'v'
     je MOVSTATEBLV 
     cmp bl,'['
     je MOVSTATEBLOFF 
      jmp ERORR
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
     MOVSTATECH:
      
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je MOVSTATECHA
     
     cmp bl, 'b'
     je MOVSTATECHB
     
     cmp bl, 'c' 
     je MOVSTATECHCl  
      
     cmp bl, 'd'
     je MOVSTATECHD 
       cmp bl ,'v'
       je MOVSTATECHV
       cmp bl ,'['
       je MOVSTATECHOFF
     jmp ERORR
     MOVSTATECL:
      
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je MOVSTATECLA
     
     cmp bl, 'b'
     je MOVSTATECLB
     
     cmp bl, 'c' 
     je MOVSTATECLCH    ;;
      
     cmp bl, 'd'
     je MOVSTATECLD 
     
     cmp bl ,'v'
       je MOVSTATECLV 
       cmp bl ,'['
       je MOVSTATECLOFF
       jmp ERORR
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
     MOVSTATEDH:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je MOVSTATEDHA
     
     cmp bl, 'b'
     je MOVSTATEDHB
     
     cmp bl, 'c' 
     je MOVSTATEDHC
      
     cmp bl, 'd'
     je MOVSTATEDHDL 
     cmp bl ,'v'
     je MOVSTATEDHV
     cmp bl, '['
     je MOVSTATEDHOFF
     jmp ERORR
     MOVSTATEDL:
     inc si
     inc si
     mov bx,[si]  
     cmp bl,'a'
     je MOVSTATEDLA
     
     cmp bl, 'b'
     je MOVSTATEDLB
     
     cmp bl, 'c' 
     je MOVSTATEDLC
      
     cmp bl, 'd'
     je MOVSTATEDLDH   ;;
     
      cmp bl,'v'
     je MOVSTATEDLV
     cmp bl,'['
     je MOVSTATEDLOFF
     jmp ERORR
      
      
    ;_________________________________________________
      MOVSTATEAHB:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je MOVSTATEAHBL
      cmp bl,'h'
      je MOVSTATEAHBH
      
      MOVSTATEAHC:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je MOVSTATEAHCL
      cmp bl,'h'
      je MOVSTATEAHCH
      
      jmp ERORR
      MOVSTATEAHD:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je MOVSTATEAHDL
      cmp bl,'h'
      je MOVSTATEAHDH
      
      jmp ERORR
      MOVSTATEALB:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je MOVSTATEALBL
      cmp bl,'h'
      je MOVSTATEALBH
      
      jmp ERORR
      
      MOVSTATEALC:
      inc si
      mov bx,[si]
      cmp bl, 'l'
      je MOVSTATEALCL
      cmp bl,'h'
      je MOVSTATEALCH
      
      jmp ERORR
      MOVSTATEALD:
      inc si
      mov bx,[si]
      cmp  bl, 'l'
      je MOVSTATEALDL
      cmp bl, 'h'
      je MOVSTATEALDH
jmp ERORR
      MOVSTATEAHOFF:
      inc si 
      mov bx,[si]
      cmp bl, 'b'
      je MOVSTATEAHOFFBX
      cmp bl, 's'
      je MOVSTATEAHOFFSI
      cmp bl, 'd'
      je MOVSTATEAHOFFDI
      inc si
      mov bx,[si]
      cmp bl,'0'
      je MOVSTATEAHOFF0
      cmp bl,'1'
      je MOVSTATEAHOFF1
      cmp bl,'2'
      je MOVSTATEAHOFF2
      cmp bl,'3'
      je MOVSTATEAHOFF3
      cmp bl,'4'
      je MOVSTATEAHOFF4
      cmp bl,'5'
      je MOVSTATEAHOFF5
      cmp bl,'6'
      je MOVSTATEAHOFF6
      cmp bl,'7'
      je MOVSTATEAHOFF7
      cmp bl,'8'
      je MOVSTATEAHOFF8
      cmp bl,'9'
      je MOVSTATEAHOFF9
      cmp bl,'A'
      je MOVSTATEAHOFFA
      cmp bl,'B'
      je MOVSTATEAHOFFB
      cmp bl,'C'
      je MOVSTATEAHOFFC
      cmp bl,'D'
      je MOVSTATEAHOFFD
      cmp bl,'E'
      je MOVSTATEAHOFFE
      cmp bl,'F'
      je MOVSTATEAHOFFF
      jmp ERORR

      MOVSTATEAHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je MOVSTATEAHOFF0
      cmp bx,1h
      je MOVSTATEAHOFF1
      cmp bx,2h
      je MOVSTATEAHOFF2
      cmp bx,3h
      je MOVSTATEAHOFF3
      cmp bx,4h
      je MOVSTATEAHOFF4
      cmp bx,5h
      je MOVSTATEAHOFF5
      cmp bx,6h
      je MOVSTATEAHOFF6
      cmp bx,7h
      je MOVSTATEAHOFF7
      cmp bx,8h
      je MOVSTATEAHOFF8
      cmp bx,9h
      je MOVSTATEAHOFF9
      cmp bx,0Ah
      je MOVSTATEAHOFFA
      cmp bx,0bh
      je MOVSTATEAHOFFB
      cmp bx,0ch
      je MOVSTATEAHOFFC
      cmp bx,0dh
      je MOVSTATEAHOFFD
      cmp bx,0eh
      je MOVSTATEAHOFFE
      cmp bx,0fh
      je MOVSTATEAHOFFF
jmp ERORR
      MOVSTATEAHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je MOVSTATEAHOFF0
      cmp bx,1h
      je MOVSTATEAHOFF1
      cmp bx,2h
      je MOVSTATEAHOFF2
      cmp bx,3h
      je MOVSTATEAHOFF3
      cmp bx,4h
      je MOVSTATEAHOFF4
      cmp bx,5h
      je MOVSTATEAHOFF5
      cmp bx,6h
      je MOVSTATEAHOFF6
      cmp bx,7h
      je MOVSTATEAHOFF7
      cmp bx,8h
      je MOVSTATEAHOFF8
      cmp bx,9h
      je MOVSTATEAHOFF9
      cmp bx,0Ah
      je MOVSTATEAHOFFA
      cmp bx,0bh
      je MOVSTATEAHOFFB
      cmp bx,0ch
      je MOVSTATEAHOFFC
      cmp bx,0dh
      je MOVSTATEAHOFFD
      cmp bx,0eh
      je MOVSTATEAHOFFE
      cmp bx,0fh
      je MOVSTATEAHOFFF
jmp ERORR
MOVSTATEAHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je MOVSTATEAHOFF0
      cmp bx,1h
      je MOVSTATEAHOFF1
      cmp bx,2h
      je MOVSTATEAHOFF2
      cmp bx,3h
      je MOVSTATEAHOFF3
      cmp bx,4h
      je MOVSTATEAHOFF4
      cmp bx,5h
      je MOVSTATEAHOFF5
      cmp bx,6h
      je MOVSTATEAHOFF6
      cmp bx,7h
      je MOVSTATEAHOFF7
      cmp bx,8h
      je MOVSTATEAHOFF8
      cmp bx,9h
      je MOVSTATEAHOFF9
      cmp bx,0Ah
      je MOVSTATEAHOFFA
      cmp bx,0bh
      je MOVSTATEAHOFFB
      cmp bx,0ch
      je MOVSTATEAHOFFC
      cmp bx,0dh
      je MOVSTATEAHOFFD
      cmp bx,0eh
      je MOVSTATEAHOFFE
      cmp bx,0fh
      je MOVSTATEAHOFFF
jmp ERORR
;;
      MOVSTATEALOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je MOVSTATEALOFFBX
       cmp bl, 's'
      je MOVSTATEALOFFSI
       cmp bl, 'd'
      je MOVSTATEALOFFDI
      inc si 
      mov bx,[si]
       cmp bl,'0'
      je MOVSTATEALOFF0
      cmp bl,'1'
      je MOVSTATEALOFF1
      cmp bl,'2'
      je MOVSTATEALOFF2
      cmp bl,'3'
      je MOVSTATEALOFF3
      cmp bl,'4'
      je MOVSTATEALOFF4
      cmp bl,'5'
      je MOVSTATEALOFF5
      cmp bl,'6'
      je MOVSTATEALOFF6
      cmp bl,'7'
      je MOVSTATEALOFF7
      cmp bl,'8'
      je MOVSTATEALOFF8
      cmp bl,'9'
      je MOVSTATEALOFF9
      cmp bl,'A'
      je MOVSTATEALOFFA
      cmp bl,'B'
      je MOVSTATEALOFFB
      cmp bl,'C'
      je MOVSTATEALOFFC
      cmp bl,'D'
      je MOVSTATEALOFFD
      cmp bl,'E'
      je MOVSTATEALOFFE
      cmp bl,'F'
      je MOVSTATEALOFFF
jmp ERORR
      MOVSTATEALOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je MOVSTATEALOFF0
      cmp bx,1h
      je MOVSTATEALOFF1
      cmp bx,2h
      je MOVSTATEALOFF2
      cmp bx,3h
      je MOVSTATEALOFF3
      cmp bx,4h
      je MOVSTATEALOFF4
      cmp bx,5h
      je MOVSTATEALOFF5
      cmp bx,6h
      je MOVSTATEALOFF6
      cmp bx,7h
      je MOVSTATEALOFF7
      cmp bx,8h
      je MOVSTATEALOFF8
      cmp bx,9h
      je MOVSTATEALOFF9
      cmp bx,0Ah
      je MOVSTATEALOFFA
      cmp bx,0bh
      je MOVSTATEALOFFB
      cmp bx,0ch
      je MOVSTATEALOFFC
      cmp bx,0dh
      je MOVSTATEALOFFD
      cmp bx,0eh
      je MOVSTATEALOFFE
      cmp bx,0fh
      je MOVSTATEALOFFF
jmp ERORR
      MOVSTATEALOFFSI:
      mov bx,p1si
      cmp bx, 0
      je MOVSTATEALOFF0
      cmp bx,1h
      je MOVSTATEALOFF1
      cmp bx,2h
      je MOVSTATEALOFF2
      cmp bx,3h
      je MOVSTATEALOFF3
      cmp bx,4h
      je MOVSTATEALOFF4
      cmp bx,5h
      je MOVSTATEALOFF5
      cmp bx,6h
      je MOVSTATEALOFF6
      cmp bx,7h
      je MOVSTATEALOFF7
      cmp bx,8h
      je MOVSTATEALOFF8
      cmp bx,9h
      je MOVSTATEALOFF9
      cmp bx,0Ah
      je MOVSTATEALOFFA
      cmp bx,0bh
      je MOVSTATEALOFFB
      cmp bx,0ch
      je MOVSTATEALOFFC
      cmp bx,0dh
      je MOVSTATEALOFFD
      cmp bx,0eh
      je MOVSTATEALOFFE
      cmp bx,0fh
      je MOVSTATEALOFFF
jmp ERORR
MOVSTATEALOFFDI:
      mov bx,p1di
      cmp bx, 0
      je MOVSTATEALOFF0
      cmp bx,1h
      je MOVSTATEALOFF1
      cmp bx,2h
      je MOVSTATEALOFF2
      cmp bx,3h
      je MOVSTATEALOFF3
      cmp bx,4h
      je MOVSTATEALOFF4
      cmp bx,5h
      je MOVSTATEALOFF5
      cmp bx,6h
      je MOVSTATEALOFF6
      cmp bx,7h
      je MOVSTATEALOFF7
      cmp bx,8h
      je MOVSTATEALOFF8
      cmp bx,9h
      je MOVSTATEALOFF9
      cmp bx,0Ah
      je MOVSTATEALOFFA
      cmp bx,0bh
      je MOVSTATEALOFFB
      cmp bx,0ch
      je MOVSTATEALOFFC
      cmp bx,0dh
      je MOVSTATEALOFFD
      cmp bx,0eh
      je MOVSTATEALOFFE
      cmp bx,0fh
      je MOVSTATEALOFFF

jmp ERORR
;;;;;; BBBBBBB

      MOVSTATEBHOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je MOVSTATEBHOFFBX
      cmp bl, 's'
      je MOVSTATEBHOFFSI
      cmp bl, 'd'
      je MOVSTATEBHOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je MOVSTATEBHOFF0
      cmp bl,'1'
      je MOVSTATEBHOFF1
      cmp bl,'2'
      je MOVSTATEBHOFF2
      cmp bl,'3'
      je MOVSTATEBHOFF3
      cmp bl,'4'
      je MOVSTATEBHOFF4
      cmp bl,'5'
      je MOVSTATEBHOFF5
      cmp bl,'6'
      je MOVSTATEBHOFF6
      cmp bl,'7'
      je MOVSTATEBHOFF7
      cmp bl,'8'
      je MOVSTATEBHOFF8
      cmp bl,'9'
      je MOVSTATEBHOFF9
      cmp bl,'A'
      je MOVSTATEBHOFFA
      cmp bl,'B'
      je MOVSTATEBHOFFB
      cmp bl,'C'
      je MOVSTATEBHOFFC
      cmp bl,'D'
      je MOVSTATEBHOFFD
      cmp bl,'E'
      je MOVSTATEBHOFFE
      cmp bl,'F'
      je MOVSTATEBHOFFF
jmp ERORR
      MOVSTATEBHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je MOVSTATEBHOFF0
      cmp bx,1h
      je MOVSTATEBHOFF1
      cmp bx,2h
      je MOVSTATEBHOFF2
      cmp bx,3h
      je MOVSTATEBHOFF3
      cmp bx,4h
      je MOVSTATEBHOFF4
      cmp bx,5h
      je MOVSTATEBHOFF5
      cmp bx,6h
      je MOVSTATEBHOFF6
      cmp bx,7h
      je MOVSTATEBHOFF7
      cmp bx,8h
      je MOVSTATEBHOFF8
      cmp bx,9h
      je MOVSTATEBHOFF9
      cmp bx,0Ah
      je MOVSTATEBHOFFA
      cmp bx,0bh
      je MOVSTATEBHOFFB
      cmp bx,0ch
      je MOVSTATEBHOFFC
      cmp bx,0dh
      je MOVSTATEBHOFFD
      cmp bx,0eh
      je MOVSTATEBHOFFE
      cmp bx,0fh
      je MOVSTATEBHOFFF
jmp ERORR
      MOVSTATEBHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je MOVSTATEBHOFF0
      cmp bx,1h
      je MOVSTATEBHOFF1
      cmp bx,2h
      je MOVSTATEBHOFF2
      cmp bx,3h
      je MOVSTATEBHOFF3
      cmp bx,4h
      je MOVSTATEBHOFF4
      cmp bx,5h
      je MOVSTATEBHOFF5
      cmp bx,6h
      je MOVSTATEBHOFF6
      cmp bx,7h
      je MOVSTATEBHOFF7
      cmp bx,8h
      je MOVSTATEBHOFF8
      cmp bx,9h
      je MOVSTATEBHOFF9
      cmp bx,0Ah
      je MOVSTATEBHOFFA
      cmp bx,0bh
      je MOVSTATEBHOFFB
      cmp bx,0ch
      je MOVSTATEBHOFFC
      cmp bx,0dh
      je MOVSTATEBHOFFD
      cmp bx,0eh
      je MOVSTATEBHOFFE
      cmp bx,0fh
      je MOVSTATEBHOFFF
jmp ERORR
      MOVSTATEBHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je MOVSTATEBHOFF0
      cmp bx,1h
      je MOVSTATEBHOFF1
      cmp bx,2h
      je MOVSTATEBHOFF2
      cmp bx,3h
      je MOVSTATEBHOFF3
      cmp bx,4h
      je MOVSTATEBHOFF4
      cmp bx,5h
      je MOVSTATEBHOFF5
      cmp bx,6h
      je MOVSTATEBHOFF6
      cmp bx,7h
      je MOVSTATEBHOFF7
      cmp bx,8h
      je MOVSTATEBHOFF8
      cmp bx,9h
      je MOVSTATEBHOFF9
      cmp bx,0Ah
      je MOVSTATEBHOFFA
      cmp bx,0bh
      je MOVSTATEBHOFFB
      cmp bx,0ch
      je MOVSTATEBHOFFC
      cmp bx,0dh
      je MOVSTATEBHOFFD
      cmp bx,0eh
      je MOVSTATEBHOFFE
      cmp bx,0fh
      je MOVSTATEBHOFFF

jmp ERORR

;;
      MOVSTATEBLOFF:
      inc si
       mov bx,[si]
      cmp bl, 'b'
      je MOVSTATEBLOFFBX
      cmp bl, 's'
      je MOVSTATEBLOFFSI
      cmp bl, 'd'
      je MOVSTATEBLOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je MOVSTATEBLOFF0
      cmp bl,'1'
      je MOVSTATEBLOFF1
      cmp bl,'2'
      je MOVSTATEBLOFF2
      cmp bl,'3'
      je MOVSTATEBLOFF3
      cmp bl,'4'
      je MOVSTATEBLOFF4
      cmp bl,'5'
      je MOVSTATEBLOFF5
      cmp bl,'6'
      je MOVSTATEBLOFF6
      cmp bl,'7'
      je MOVSTATEBLOFF7
      cmp bl,'8'
      je MOVSTATEBLOFF8
      cmp bl,'9'
      je MOVSTATEBLOFF9
      cmp bl,'A'
      je MOVSTATEBLOFFA
      cmp bl,'B'
      je MOVSTATEBLOFFB
      cmp bl,'C'
      je MOVSTATEBLOFFC
      cmp bl,'D'
      je MOVSTATEBLOFFD
      cmp bl,'E'
      je MOVSTATEBLOFFE
      cmp bl,'F'
      je MOVSTATEBLOFFF

jmp ERORR

    MOVSTATEBLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je MOVSTATEBLOFF0
      cmp bx,1h
      je MOVSTATEBLOFF1
      cmp bx,2h
      je MOVSTATEBLOFF2
      cmp bx,3h
      je MOVSTATEBLOFF3
      cmp bx,4h
      je MOVSTATEBLOFF4
      cmp bx,5h
      je MOVSTATEBLOFF5
      cmp bx,6h
      je MOVSTATEBLOFF6
      cmp bx,7h
      je MOVSTATEBLOFF7
      cmp bx,8h
      je MOVSTATEBLOFF8
      cmp bx,9h
      je MOVSTATEBLOFF9
      cmp bx,0Ah
      je MOVSTATEBLOFFA
      cmp bx,0bh
      je MOVSTATEBLOFFB
      cmp bx,0ch
      je MOVSTATEBLOFFC
      cmp bx,0dh
      je MOVSTATEBLOFFD
      cmp bx,0eh
      je MOVSTATEBLOFFE
      cmp bx,0fh
      je MOVSTATEBLOFFF
jmp ERORR
      MOVSTATEBLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je MOVSTATEBLOFF0
      cmp bx,1h
      je MOVSTATEBLOFF1
      cmp bx,2h
      je MOVSTATEBLOFF2
      cmp bx,3h
      je MOVSTATEBLOFF3
      cmp bx,4h
      je MOVSTATEBLOFF4
      cmp bx,5h
      je MOVSTATEBLOFF5
      cmp bx,6h
      je MOVSTATEBLOFF6
      cmp bx,7h
      je MOVSTATEBLOFF7
      cmp bx,8h
      je MOVSTATEBLOFF8
      cmp bx,9h
      je MOVSTATEBLOFF9
      cmp bx,0Ah
      je MOVSTATEBLOFFA
      cmp bx,0bh
      je MOVSTATEBLOFFB
      cmp bx,0ch
      je MOVSTATEBLOFFC
      cmp bx,0dh
      je MOVSTATEBLOFFD
      cmp bx,0eh
      je MOVSTATEBLOFFE
      cmp bx,0fh
      je MOVSTATEBLOFFF
jmp ERORR
      MOVSTATEBLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je MOVSTATEBLOFF0
      cmp bx,1h
      je MOVSTATEBLOFF1
      cmp bx,2h
      je MOVSTATEBLOFF2
      cmp bx,3h
      je MOVSTATEBLOFF3
      cmp bx,4h
      je MOVSTATEBLOFF4
      cmp bx,5h
      je MOVSTATEBLOFF5
      cmp bx,6h
      je MOVSTATEBLOFF6
      cmp bx,7h
      je MOVSTATEBLOFF7
      cmp bx,8h
      je MOVSTATEBLOFF8
      cmp bx,9h
      je MOVSTATEBLOFF9
      cmp bx,0Ah
      je MOVSTATEBLOFFA
      cmp bx,0bh
      je MOVSTATEBLOFFB
      cmp bx,0ch
      je MOVSTATEBLOFFC
      cmp bx,0dh
      je MOVSTATEBLOFFD
      cmp bx,0eh
      je MOVSTATEBLOFFE
      cmp bx,0fh
      je MOVSTATEBLOFFF

jmp ERORR
      ;;CCCCCCCCCC

      MOVSTATECHOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je MOVSTATECHOFFBX
      cmp bl, 's'
      je MOVSTATECHOFFSI
      cmp bl, 'd'
      je MOVSTATECHOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je MOVSTATECHOFF0
      cmp bl,'1'
      je MOVSTATECHOFF1
      cmp bl,'2'
      je MOVSTATECHOFF2
      cmp bl,'3'
      je MOVSTATECHOFF3
      cmp bl,'4'
      je MOVSTATECHOFF4
      cmp bl,'5'
      je MOVSTATECHOFF5
      cmp bl,'6'
      je MOVSTATECHOFF6
      cmp bl,'7'
      je MOVSTATECHOFF7
      cmp bl,'8'
      je MOVSTATECHOFF8
      cmp bl,'9'
      je MOVSTATECHOFF9
      cmp bl,'A'
      je MOVSTATECHOFFA
      cmp bl,'B'
      je MOVSTATECHOFFB
      cmp bl,'C'
      je MOVSTATECHOFFC
      cmp bl,'D'
      je MOVSTATECHOFFD
      cmp bl,'E'
      je MOVSTATECHOFFE
      cmp bl,'F'
      je MOVSTATECHOFFF

jmp ERORR
      MOVSTATECHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je MOVSTATECHOFF0
      cmp bx,1h
      je MOVSTATECHOFF1
      cmp bx,2h
      je MOVSTATECHOFF2
      cmp bx,3h
      je MOVSTATECHOFF3
      cmp bx,4h
      je MOVSTATECHOFF4
      cmp bx,5h
      je MOVSTATECHOFF5
      cmp bx,6h
      je MOVSTATECHOFF6
      cmp bx,7h
      je MOVSTATECHOFF7
      cmp bx,8h
      je MOVSTATECHOFF8
      cmp bx,9h
      je MOVSTATECHOFF9
      cmp bx,0Ah
      je MOVSTATECHOFFA
      cmp bx,0bh
      je MOVSTATECHOFFB
      cmp bx,0ch
      je MOVSTATECHOFFC
      cmp bx,0dh
      je MOVSTATECHOFFD
      cmp bx,0eh
      je MOVSTATECHOFFE
      cmp bx,0fh
      je MOVSTATECHOFFF
jmp ERORR
      MOVSTATECHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je MOVSTATECHOFF0
      cmp bx,1h
      je MOVSTATECHOFF1
      cmp bx,2h
      je MOVSTATECHOFF2
      cmp bx,3h
      je MOVSTATECHOFF3
      cmp bx,4h
      je MOVSTATECHOFF4
      cmp bx,5h
      je MOVSTATECHOFF5
      cmp bx,6h
      je MOVSTATECHOFF6
      cmp bx,7h
      je MOVSTATECHOFF7
      cmp bx,8h
      je MOVSTATECHOFF8
      cmp bx,9h
      je MOVSTATECHOFF9
      cmp bx,0Ah
      je MOVSTATECHOFFA
      cmp bx,0bh
      je MOVSTATECHOFFB
      cmp bx,0ch
      je MOVSTATECHOFFC
      cmp bx,0dh
      je MOVSTATECHOFFD
      cmp bx,0eh
      je MOVSTATECHOFFE
      cmp bx,0fh
      je MOVSTATECHOFFF
jmp ERORR
      MOVSTATECHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je MOVSTATECHOFF0
      cmp bx,1h
      je MOVSTATECHOFF1
      cmp bx,2h
      je MOVSTATECHOFF2
      cmp bx,3h
      je MOVSTATECHOFF3
      cmp bx,4h
      je MOVSTATECHOFF4
      cmp bx,5h
      je MOVSTATECHOFF5
      cmp bx,6h
      je MOVSTATECHOFF6
      cmp bx,7h
      je MOVSTATECHOFF7
      cmp bx,8h
      je MOVSTATECHOFF8
      cmp bx,9h
      je MOVSTATECHOFF9
      cmp bx,0Ah
      je MOVSTATECHOFFA
      cmp bx,0bh
      je MOVSTATECHOFFB
      cmp bx,0ch
      je MOVSTATECHOFFC
      cmp bx,0dh
      je MOVSTATECHOFFD
      cmp bx,0eh
      je MOVSTATECHOFFE
      cmp bx,0fh
      je MOVSTATECHOFFF
jmp ERORR

;;
      MOVSTATECLOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je MOVSTATECLOFFBX
      cmp bl, 's'
      je MOVSTATECLOFFSI
      cmp bl, 'd'
      je MOVSTATECLOFFDI
      inc si 
      mov bx,[si]
      cmp bl,'0'
      je MOVSTATECLOFF0
      cmp bl,'1'
      je MOVSTATECLOFF1
      cmp bl,'2'
      je MOVSTATECLOFF2
      cmp bl,'3'
      je MOVSTATECLOFF3
      cmp bl,'4'
      je MOVSTATECLOFF4
      cmp bl,'5'
      je MOVSTATECLOFF5
      cmp bl,'6'
      je MOVSTATECLOFF6
      cmp bl,'7'
      je MOVSTATECLOFF7
      cmp bl,'8'
      je MOVSTATECLOFF8
      cmp bl,'9'
      je MOVSTATECLOFF9
      cmp bl,'A'
      je MOVSTATECLOFFA
      cmp bl,'B'
      je MOVSTATECLOFFB
      cmp bl,'C'
      je MOVSTATECLOFFC
      cmp bl,'D'
      je MOVSTATECLOFFD
      cmp bl,'E'
      je MOVSTATECLOFFE
      cmp bl,'F'
      je MOVSTATECLOFFF
jmp ERORR
      
      MOVSTATECLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je MOVSTATECLOFF0
      cmp bx,1h
      je MOVSTATECLOFF1
      cmp bx,2h
      je MOVSTATECLOFF2
      cmp bx,3h
      je MOVSTATECLOFF3
      cmp bx,4h
      je MOVSTATECLOFF4
      cmp bx,5h
      je MOVSTATECLOFF5
      cmp bx,6h
      je MOVSTATECLOFF6
      cmp bx,7h
      je MOVSTATECLOFF7
      cmp bx,8h
      je MOVSTATECLOFF8
      cmp bx,9h
      je MOVSTATECLOFF9
      cmp bx,0Ah
      je MOVSTATECLOFFA
      cmp bx,0bh
      je MOVSTATECLOFFB
      cmp bx,0ch
      je MOVSTATECLOFFC
      cmp bx,0dh
      je MOVSTATECLOFFD
      cmp bx,0eh
      je MOVSTATECLOFFE
      cmp bx,0fh
      je MOVSTATECLOFFF
jmp ERORR
      MOVSTATECLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je MOVSTATECLOFF0
      cmp bx,1h
      je MOVSTATECLOFF1
      cmp bx,2h
      je MOVSTATECLOFF2
      cmp bx,3h
      je MOVSTATECLOFF3
      cmp bx,4h
      je MOVSTATECLOFF4
      cmp bx,5h
      je MOVSTATECLOFF5
      cmp bx,6h
      je MOVSTATECLOFF6
      cmp bx,7h
      je MOVSTATECLOFF7
      cmp bx,8h
      je MOVSTATECLOFF8
      cmp bx,9h
      je MOVSTATECLOFF9
      cmp bx,0Ah
      je MOVSTATECLOFFA
      cmp bx,0bh
      je MOVSTATECLOFFB
      cmp bx,0ch
      je MOVSTATECLOFFC
      cmp bx,0dh
      je MOVSTATECLOFFD
      cmp bx,0eh
      je MOVSTATECLOFFE
      cmp bx,0fh
      je MOVSTATECLOFFF
jmp ERORR
      MOVSTATECLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je MOVSTATECLOFF0
      cmp bx,1h
      je MOVSTATECLOFF1
      cmp bx,2h
      je MOVSTATECLOFF2
      cmp bx,3h
      je MOVSTATECLOFF3
      cmp bx,4h
      je MOVSTATECLOFF4
      cmp bx,5h
      je MOVSTATECLOFF5
      cmp bx,6h
      je MOVSTATECLOFF6
      cmp bx,7h
      je MOVSTATECLOFF7
      cmp bx,8h
      je MOVSTATECLOFF8
      cmp bx,9h
      je MOVSTATECLOFF9
      cmp bx,0Ah
      je MOVSTATECLOFFA
      cmp bx,0bh
      je MOVSTATECLOFFB
      cmp bx,0ch
      je MOVSTATECLOFFC
      cmp bx,0dh
      je MOVSTATECLOFFD
      cmp bx,0eh
      je MOVSTATECLOFFE
      cmp bx,0fh
      je MOVSTATECLOFFF

jmp ERORR

;;;;DDDDDDDDDDDDDDDD
 MOVSTATEDHOFF:
      inc si 
      mov bx,[si]
      cmp bl, 'b'
      je MOVSTATEDHOFFBX
      cmp bl, 's'
      je MOVSTATEDHOFFSI
      cmp bl, 'd'
      je MOVSTATEDHOFFDI
      inc si
      mov bx,[si]
      cmp bl,'0'
      je MOVSTATEDHOFF0
      cmp bl,'1'
      je MOVSTATEDHOFF1
      cmp bl,'2'
      je MOVSTATEDHOFF2
      cmp bl,'3'
      je MOVSTATEDHOFF3
      cmp bl,'4'
      je MOVSTATEDHOFF4
      cmp bl,'5'
      je MOVSTATEDHOFF5
      cmp bl,'6'
      je MOVSTATEDHOFF6
      cmp bl,'7'
      je MOVSTATEDHOFF7
      cmp bl,'8'
      je MOVSTATEDHOFF8
      cmp bl,'9'
      je MOVSTATEDHOFF9
      cmp bl,'A'
      je MOVSTATEDHOFFA
      cmp bl,'B'
      je MOVSTATEDHOFFB
      cmp bl,'C'
      je MOVSTATEDHOFFC
      cmp bl,'D'
      je MOVSTATEDHOFFD
      cmp bl,'E'
      je MOVSTATEDHOFFE
      cmp bl,'F'
      je MOVSTATEDHOFFF
jmp ERORR

      MOVSTATEDHOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je MOVSTATEDHOFF0
      cmp bx,1h
      je MOVSTATEDHOFF1
      cmp bx,2h
      je MOVSTATEDHOFF2
      cmp bx,3h
      je MOVSTATEDHOFF3
      cmp bx,4h
      je MOVSTATEDHOFF4
      cmp bx,5h
      je MOVSTATEDHOFF5
      cmp bx,6h
      je MOVSTATEDHOFF6
      cmp bx,7h
      je MOVSTATEDHOFF7
      cmp bx,8h
      je MOVSTATEDHOFF8
      cmp bx,9h
      je MOVSTATEDHOFF9
      cmp bx,0Ah
      je MOVSTATEDHOFFA
      cmp bx,0bh
      je MOVSTATEDHOFFB
      cmp bx,0ch
      je MOVSTATEDHOFFC
      cmp bx,0dh
      je MOVSTATEDHOFFD
      cmp bx,0eh
      je MOVSTATEDHOFFE
      cmp bx,0fh
      je MOVSTATEDHOFFF
jmp ERORR
      MOVSTATEDHOFFSI:
      mov bx,p1si
      cmp bx, 0
      je MOVSTATEDHOFF0
      cmp bx,1h
      je MOVSTATEDHOFF1
      cmp bx,2h
      je MOVSTATEDHOFF2
      cmp bx,3h
      je MOVSTATEDHOFF3
      cmp bx,4h
      je MOVSTATEDHOFF4
      cmp bx,5h
      je MOVSTATEDHOFF5
      cmp bx,6h
      je MOVSTATEDHOFF6
      cmp bx,7h
      je MOVSTATEDHOFF7
      cmp bx,8h
      je MOVSTATEDHOFF8
      cmp bx,9h
      je MOVSTATEDHOFF9
      cmp bx,0Ah
      je MOVSTATEDHOFFA
      cmp bx,0bh
      je MOVSTATEDHOFFB
      cmp bx,0ch
      je MOVSTATEDHOFFC
      cmp bx,0dh
      je MOVSTATEDHOFFD
      cmp bx,0eh
      je MOVSTATEDHOFFE
      cmp bx,0fh
      je MOVSTATEDHOFFF
jmp ERORR
      MOVSTATEDHOFFDI:
      mov bx,p1di
      cmp bx, 0
      je MOVSTATEDHOFF0
      cmp bx,1h
      je MOVSTATEDHOFF1
      cmp bx,2h
      je MOVSTATEDHOFF2
      cmp bx,3h
      je MOVSTATEDHOFF3
      cmp bx,4h
      je MOVSTATEDHOFF4
      cmp bx,5h
      je MOVSTATEDHOFF5
      cmp bx,6h
      je MOVSTATEDHOFF6
      cmp bx,7h
      je MOVSTATEDHOFF7
      cmp bx,8h
      je MOVSTATEDHOFF8
      cmp bx,9h
      je MOVSTATEDHOFF9
      cmp bx,0Ah
      je MOVSTATEDHOFFA
      cmp bx,0bh
      je MOVSTATEDHOFFB
      cmp bx,0ch
      je MOVSTATEDHOFFC
      cmp bx,0dh
      je MOVSTATEDHOFFD
      cmp bx,0eh
      je MOVSTATEDHOFFE
      cmp bx,0fh
      je MOVSTATEDHOFFF
jmp ERORR



;;
      MOVSTATEDLOFF:
      inc si
      mov bx,[si]
      cmp bl, 'b'
      je MOVSTATEDLOFFBX
      cmp bl, 's'
      je MOVSTATEDLOFFSI
      cmp bl, 'd'
      je MOVSTATEDLOFFDI
      inc si 
      mov bx,[si]
       cmp bl,'0'
      je MOVSTATEDLOFF0
      cmp bl,'1'
      je MOVSTATEDLOFF1
      cmp bl,'2'
      je MOVSTATEDLOFF2
      cmp bl,'3'
      je MOVSTATEDLOFF3
      cmp bl,'4'
      je MOVSTATEDLOFF4
      cmp bl,'5'
      je MOVSTATEDLOFF5
      cmp bl,'6'
      je MOVSTATEDLOFF6
      cmp bl,'7'
      je MOVSTATEDLOFF7
      cmp bl,'8'
      je MOVSTATEDLOFF8
      cmp bl,'9'
      je MOVSTATEDLOFF9
      cmp bl,'A'
      je MOVSTATEDLOFFA
      cmp bl,'B'
      je MOVSTATEDLOFFB
      cmp bl,'C'
      je MOVSTATEDLOFFC
      cmp bl,'D'
      je MOVSTATEDLOFFD
      cmp bl,'E'
      je MOVSTATEDLOFFE
      cmp bl,'F'
      je MOVSTATEDLOFFF
jmp ERORR
      
      MOVSTATEDLOFFBX:
      mov bx,p1bx
      cmp bx, 0
      je MOVSTATEDLOFF0
      cmp bx,1h
      je MOVSTATEDLOFF1
      cmp bx,2h
      je MOVSTATEDLOFF2
      cmp bx,3h
      je MOVSTATEDLOFF3
      cmp bx,4h
      je MOVSTATEDLOFF4
      cmp bx,5h
      je MOVSTATEDLOFF5
      cmp bx,6h
      je MOVSTATEDLOFF6
      cmp bx,7h
      je MOVSTATEDLOFF7
      cmp bx,8h
      je MOVSTATEDLOFF8
      cmp bx,9h
      je MOVSTATEDLOFF9
      cmp bx,0Ah
      je MOVSTATEDLOFFA
      cmp bx,0bh
      je MOVSTATEDLOFFB
      cmp bx,0ch
      je MOVSTATEDLOFFC
      cmp bx,0dh
      je MOVSTATEDLOFFD
      cmp bx,0eh
      je MOVSTATEDLOFFE
      cmp bx,0fh
      je MOVSTATEDLOFFF
jmp ERORR
      MOVSTATEDLOFFSI:
      mov bx,p1si
      cmp bx, 0
      je MOVSTATEDLOFF0
      cmp bx,1h
      je MOVSTATEDLOFF1
      cmp bx,2h
      je MOVSTATEDLOFF2
      cmp bx,3h
      je MOVSTATEDLOFF3
      cmp bx,4h
      je MOVSTATEDLOFF4
      cmp bx,5h
      je MOVSTATEDLOFF5
      cmp bx,6h
      je MOVSTATEDLOFF6
      cmp bx,7h
      je MOVSTATEDLOFF7
      cmp bx,8h
      je MOVSTATEDLOFF8
      cmp bx,9h
      je MOVSTATEDLOFF9
      cmp bx,0Ah
      je MOVSTATEDLOFFA
      cmp bx,0bh
      je MOVSTATEDLOFFB
      cmp bx,0ch
      je MOVSTATEDLOFFC
      cmp bx,0dh
      je MOVSTATEDLOFFD
      cmp bx,0eh
      je MOVSTATEDLOFFE
      cmp bx,0fh
      je MOVSTATEDLOFFF
jmp ERORR
      MOVSTATEDLOFFDI:
      mov bx,p1di
      cmp bx, 0
      je MOVSTATEDLOFF0
      cmp bx,1h
      je MOVSTATEDLOFF1
      cmp bx,2h
      je MOVSTATEDLOFF2
      cmp bx,3h
      je MOVSTATEDLOFF3
      cmp bx,4h
      je MOVSTATEDLOFF4
      cmp bx,5h
      je MOVSTATEDLOFF5
      cmp bx,6h
      je MOVSTATEDLOFF6
      cmp bx,7h
      je MOVSTATEDLOFF7
      cmp bx,8h
      je MOVSTATEDLOFF8
      cmp bx,9h
      je MOVSTATEDLOFF9
      cmp bx,0Ah
      je MOVSTATEDLOFFA
      cmp bx,0bh
      je MOVSTATEDLOFFB
      cmp bx,0ch
      je MOVSTATEDLOFFC
      cmp bx,0dh
      je MOVSTATEDLOFFD
      cmp bx,0eh
      je MOVSTATEDLOFFE
      cmp bx,0fh
      je MOVSTATEDLOFFF
jmp ERORR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; copy under
      

      MOVSTATEAHOFF0:
      mov al,p10
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFF1:
      mov al,p11
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFF2:
      mov al,p12
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFF3:
      mov al,p13
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFF4:
      mov al,p14
      mov p1ah,al
      jmp exit
      MOVSTATEAHOFF5:
      mov al,p15
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFF6:
      mov al,p16
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFF7:
      mov al,p17
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFF8:
      mov al,p18
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFF9:
      mov al,p19
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFFA:
      mov al,p1a
      mov p1ah,al
      jmp exit

      MOVSTATEAHOFFB:
      mov al,p1b
      mov p1ah,al
      jmp exit
      MOVSTATEAHOFFC:
      mov al,p1c
      mov p1ah,al
      jmp exit
      MOVSTATEAHOFFE:
      mov al,p1e
      mov p1ah,al
      jmp exit
      MOVSTATEAHOFFF:
      mov al,p1f
      mov p1ah,al
      jmp exit
      
      MOVSTATEAHOFFD:
       mov al,p1d
      mov p1ah,al
      jmp exit

;;
MOVSTATEALOFF0:
      mov al,p10
      mov p1al,al
      jmp exit
MOVSTATEALOFF1:
      mov al,p11
      mov p1al,al
      jmp exit

      MOVSTATEALOFF2:
      mov al,p12
      mov p1al,al
      jmp exit

      MOVSTATEALOFF3:
      mov al,p13
      mov p1al,al
      jmp exit

      MOVSTATEALOFF4:
      mov al,p14
      mov p1al,al
      jmp exit
      MOVSTATEALOFF5:
      mov al,p15
      mov p1al,al
      jmp exit

      MOVSTATEALOFF6:
      mov al,p16
      mov p1al,al
      jmp exit

      MOVSTATEALOFF7:
      mov al,p17
      mov p1al,al
      jmp exit

      MOVSTATEALOFF8:
      mov al,p18
      mov p1al,al
      jmp exit

      MOVSTATEALOFF9:
      mov al,p19
      mov p1al,al
      jmp exit

      MOVSTATEALOFFA:
      mov al,p1a
      mov p1al,al
      jmp exit

      MOVSTATEALOFFB:
      mov al,p1b
      mov p1al,al
      jmp exit
      MOVSTATEALOFFC:
      mov al,p1c
      mov p1al,al
      jmp exit
      MOVSTATEALOFFE:
      mov al,p1e
      mov p1al,al
      jmp exit
      MOVSTATEALOFFF:
      mov al,p1f
      mov p1al,al
      jmp exit
      
      MOVSTATEALOFFD:
       mov al,p1d
      mov p1al,al
      jmp exit



;;;;;BBBB
MOVSTATEBHOFF0:
      mov al,p10
      mov p1bh,al
      jmp exit
MOVSTATEBHOFF1:
      mov al,p11
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFF2:
      mov al,p12
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFF3:
      mov al,p13
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFF4:
      mov al,p14
      mov p1bh,al
      jmp exit
      MOVSTATEBHOFF5:
      mov al,p15
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFF6:
      mov al,p16
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFF7:
      mov al,p17
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFF8:
      mov al,p18
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFF9:
      mov al,p19
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFFA:
      mov al,p1a
      mov p1bh,al
      jmp exit

      MOVSTATEBHOFFB:
      mov al,p1b
      mov p1bh,al
      jmp exit
      MOVSTATEBHOFFC:
      mov al,p1c
      mov p1bh,al
      jmp exit
      MOVSTATEBHOFFE:
      mov al,p1e
      mov p1bh,al
      jmp exit
      MOVSTATEBHOFFF:
      mov al,p1f
      mov p1bh,al
      jmp exit
      
      MOVSTATEBHOFFD:
       mov al,p1d
      mov p1bh,al
      jmp exit
;;
MOVSTATEBLOFF0:
      mov al,p10
      mov p1bL,al
      jmp exit
MOVSTATEBLOFF1:
      mov al,p11
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFF2:
      mov al,p12
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFF3:
      mov al,p13
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFF4:
      mov al,p14
      mov p1bL,al
      jmp exit
      MOVSTATEBLOFF5:
      mov al,p15
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFF6:
      mov al,p16
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFF7:
      mov al,p17
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFF8:
      mov al,p18
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFF9:
      mov al,p19
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFFA:
      mov al,p1a
      mov p1bL,al
      jmp exit

      MOVSTATEBLOFFB:
      mov al,p1b
      mov p1bL,al
      jmp exit
      MOVSTATEBLOFFC:
      mov al,p1c
      mov p1bL,al
      jmp exit
      MOVSTATEBLOFFE:
      mov al,p1e
      mov p1bL,al
      jmp exit
      MOVSTATEBLOFFF:
      mov al,p1f
      mov p1bL,al
      jmp exit
      
      MOVSTATEBLOFFD:
       mov al,p1d
      mov p1bL,al
      jmp exit




      ;;;;;CCCCCCCCCCC
      MOVSTATECHOFF0:
      mov al,p10
      mov p1ch,al
      jmp exit

      MOVSTATECHOFF1:
      mov al,p11
      mov p1ch,al
      jmp exit

      MOVSTATECHOFF2:
      mov al,p12
      mov p1ch,al
      jmp exit

      MOVSTATECHOFF3:
      mov al,p13
      mov p1ch,al
      jmp exit

      MOVSTATECHOFF4:
      mov al,p14
      mov p1ch,al
      jmp exit
      MOVSTATECHOFF5:
      mov al,p15
      mov p1ch,al
      jmp exit

      MOVSTATECHOFF6:
      mov al,p16
      mov p1ch,al
      jmp exit

      MOVSTATECHOFF7:
      mov al,p17
      mov p1ch,al
      jmp exit

      MOVSTATECHOFF8:
      mov al,p18
      mov p1ch,al
      jmp exit

      MOVSTATECHOFF9:
      mov al,p19
      mov p1ch,al
      jmp exit

      MOVSTATECHOFFA:
      mov al,p1a
      mov p1ch,al
      jmp exit

      MOVSTATECHOFFB:
      mov al,p1b
      mov p1ch,al
      jmp exit
      MOVSTATECHOFFC:
      mov al,p1c
      mov p1ch,al
      jmp exit
      MOVSTATECHOFFE:
      mov al,p1e
      mov p1ch,al
      jmp exit
      MOVSTATECHOFFF:
      mov al,p1f
      mov p1ch,al
      jmp exit
      
      MOVSTATECHOFFD:
       mov al,p1d
      mov p1ch,al
      jmp exit

;;
MOVSTATECLOFF0:
      mov al,p10
      mov p1cl,al
      jmp exit
MOVSTATECLOFF1:
      mov al,p11
      mov p1cl,al
      jmp exit

      MOVSTATECLOFF2:
      mov al,p12
      mov p1cl,al
      jmp exit

      MOVSTATECLOFF3:
      mov al,p13
      mov p1cl,al
      jmp exit

      MOVSTATECLOFF4:
      mov al,p14
      mov p1cl,al
      jmp exit
      MOVSTATECLOFF5:
      mov al,p15
      mov p1cl,al
      jmp exit

      MOVSTATECLOFF6:
      mov al,p16
      mov p1cl,al
      jmp exit

      MOVSTATECLOFF7:
      mov al,p17
      mov p1cl,al
      jmp exit

      MOVSTATECLOFF8:
      mov al,p18
      mov p1cl,al
      jmp exit

      MOVSTATECLOFF9:
      mov al,p19
      mov p1cl,al
      jmp exit

      MOVSTATECLOFFA:
      mov al,p1a
      mov p1cl,al
      jmp exit

      MOVSTATECLOFFB:
      mov al,p1b
      mov p1cl,al
      jmp exit
      MOVSTATECLOFFC:
      mov al,p1c
      mov p1cl,al
      jmp exit
      MOVSTATECLOFFE:
      mov al,p1e
      mov p1cl,al
      jmp exit
      MOVSTATECLOFFF:
      mov al,p1f
      mov p1cl,al
      jmp exit
      
      MOVSTATECLOFFD:
       mov al,p1d
      mov p1cl,al
      jmp exit
;;;;;;;DDDDDDDDDDDDDDDDDDDDDD

      MOVSTATEDHOFF0:
      mov al,p10
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFF1:
      mov al,p11
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFF2:
      mov al,p12
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFF3:
      mov al,p13
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFF4:
      mov al,p14
      mov p1dh,al
      jmp exit
      MOVSTATEDHOFF5:
      mov al,p15
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFF6:
      mov al,p16
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFF7:
      mov al,p17
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFF8:
      mov al,p18
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFF9:
      mov al,p19
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFFA:
      mov al,p1a
      mov p1dh,al
      jmp exit

      MOVSTATEDHOFFB:
      mov al,p1b
      mov p1dh,al
      jmp exit
      MOVSTATEDHOFFC:
      mov al,p1c
      mov p1dh,al
      jmp exit
      MOVSTATEDHOFFE:
      mov al,p1e
      mov p1dh,al
      jmp exit
      MOVSTATEDHOFFF:
      mov al,p1f
      mov p1dh,al
      jmp exit
      
      MOVSTATEDHOFFD:
       mov al,p1d
      mov p1dh,al
      jmp exit

;;
MOVSTATEDLOFF0:
      mov al,p10
      mov p1dl,al
      jmp exit
MOVSTATEDLOFF1:
      mov al,p11
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFF2:
      mov al,p12
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFF3:
      mov al,p13
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFF4:
      mov al,p14
      mov p1dl,al
      jmp exit
      MOVSTATEDLOFF5:
      mov al,p15
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFF6:
      mov al,p16
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFF7:
      mov al,p17
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFF8:
      mov al,p18
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFF9:
      mov al,p19
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFFA:
      mov al,p1a
      mov p1dl,al
      jmp exit

      MOVSTATEDLOFFB:
      mov al,p1b
      mov p1dl,al
      jmp exit
      MOVSTATEDLOFFC:
      mov al,p1c
      mov p1dl,al
      jmp exit
      MOVSTATEDLOFFE:
      mov al,p1e
      mov p1dl,al
      jmp exit
      MOVSTATEDLOFFF:
      mov al,p1f
      mov p1dl,al
      jmp exit
      
      MOVSTATEDLOFFD:
       mov al,p1d
      mov p1dl,al
      jmp exit


      ;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      
      MOVSTATEBHA:
      inc si
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATEBHAL
      cmp bl,'h'
      je MOVSTATEBHAH
      jmp ERORR
      MOVSTATEBHC:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je MOVSTATEBHCL
      cmp bl,'h'
      je MOVSTATEBHCH
      jmp ERORR
      MOVSTATEBHD:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je MOVSTATEBHDL
      cmp bl,'h'
      je MOVSTATEBHDH 
      jmp ERORR
      
      
      
      MOVSTATEBLA:
      inc si
      mov bx,[si]
        cmp bl,'l'
      je MOVSTATEBLAL
      cmp bl,'h'
      je MOVSTATEBlAH
      jmp ERORR
      MOVSTATEBLC:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je MOVSTATEBLCL
      cmp bl,'h'
      je MOVSTATEBLCH
      jmp ERORR
      MOVSTATEBLD:
      inc si 
      mov bx, [si]
      cmp bl, 'l'
      je MOVSTATEBLDL
      cmp bl,'h'
      je MOVSTATEBLDH 
      jmp ERORR
      
      
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
      MOVSTATECHA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATECHAL    
      cmp bl, 'h'
      je MOVSTATECHAH  
      jmp ERORR
       MOVSTATECHB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATECHBL      
      cmp bl, 'h'
      je MOVSTATECHBH        
      jmp ERORR
      
      MOVSTATECHD:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATECHDL            
      cmp bl, 'h'           
      je MOVSTATECHDH              
      
      jmp ERORR
      
      
      MOVSTATECLA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATECLAL    
      cmp bl, 'h'
      je MOVSTATECLAH  
      jmp ERORR
       MOVSTATECLB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATECLBL    
      cmp bl, 'h'
      je MOVSTATECLBH        
      jmp ERORR
      
      MOVSTATECLD:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATECLDL            
      cmp bl, 'h'           
      je MOVSTATECLDH     
      jmp ERORR
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
      MOVSTATEDHA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATEDHAL    
      cmp bl, 'h'
      je MOVSTATEDHAH  
      jmp ERORR
      MOVSTATEDHB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATEDHBL    
      cmp bl, 'h'
      je MOVSTATEDHBH   
      jmp ERORR
      MOVSTATEDHC:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATEDHCL   
      cmp bl, 'h'
      je MOVSTATEDHCH 
      jmp ERORR
      
       MOVSTATEDLA:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATEDLAL    
      cmp bl, 'h'
      je MOVSTATEDLAH  
      jmp ERORR
      MOVSTATEDLB:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATEDLBL    
      cmp bl, 'h'
      je MOVSTATEDLBH   
      jmp ERORR
      MOVSTATEDLC:
      inc si 
      mov bx,[si]
      cmp bl,'l'
      je MOVSTATEDLCL    
      cmp bl, 'h'
      je MOVSTATEDLCH  
      
      jmp ERORR
      
      
      
    ;------------------------------------------------
     MOVSTATEAHAL:
     mov al, p1al
     mov p1ah,al
     jmp exit
     
     MOVSTATEAHBL:
     mov bl, p1bl
     mov p1ah,bl
     jmp exit
     
     MOVSTATEAHBH:
     mov bh, p1bh
     mov p1ah,bh
     jmp exit
    
     MOVSTATEAHCL:
     mov cl, p1cl
     mov p1ah,cl
     jmp exit
     
     MOVSTATEAHCH:
     mov ch, p1ch
     mov p1ah,ch
     jmp exit
     MOVSTATEAHDL:
     mov dl,p1dl
     mov p1ah,dl
     jmp exit
     
     MOVSTATEAHDH:
     mov dh, p1dh
     mov p1ah,dh
     jmp exit
    
     MOVSTATEALAH:
     mov ah,p1ah
     mov p1al,ah
     jmp exit
     
     MOVSTATEALBL:
     mov bl,p1bl
     mov p1al,bl
     jmp exit
     
     MOVSTATEALBH:
     mov bh,p1bh
     mov p1al,bh
     jmp exit
     
     MOVSTATEALCL:
     mov cl,p1cl
     mov p1al,cl
     jmp exit
     
     MOVSTATEALCH:
     mov ch,p1ch
     mov p1al,ch
     jmp exit
     
     MOVSTATEALDL:
     mov dl,p1dl
     mov p1al,dl
     jmp exit
     
     MOVSTATEALDH:
     mov dh,p1dh
     mov p1al,dh
     jmp exit
     
     ;;;;;;  ;;;;;;;;;;;;;;;;;;;;;;;;
     
     MOVSTATEBHBL:
     mov bl,p1bl
     mov p1bh,bl
     jmp exit
     
     MOVSTATEBHAL:
     mov al, p1al
     mov p1bh,al
     jmp exit
     
     MOVSTATEBHAH:
     mov ah, p1ah
     mov p1bh ,ah
     jmp exit
     
     MOVSTATEBHCL:
     mov cl, p1cl
     mov p1bh,cl
     jmp exit
     
     MOVSTATEBHCH:
     mov ch, p1ch
     mov p1bh,ch
     jmp exit
     
     MOVSTATEBHDL:
     mov dl, p1dl
     mov p1bh,dl
     jmp exit 
     
     MOVSTATEBHDH:
     mov dh, p1dh
     mov p1bh,dh
     jmp exit
     
     
     MOVSTATEBLBH:
     mov bh,p1bh
     mov p1bl,bh
     jmp exit
     
     
     MOVSTATEBLAL:
     mov al, p1al
     mov p1bl,al
     jmp exit
     
     MOVSTATEBLAH:
     mov ah, p1ah
     mov p1bl ,ah
     jmp exit
     
     MOVSTATEBLCL:
     mov cl, p1cl
     mov p1bl,cl
     jmp exit
     
     MOVSTATEBLCH:
     mov ch, p1ch
     mov p1bl,ch
     jmp exit
     
     MOVSTATEBLDL:
     mov dl,p1dl
     mov p1bl,dl
     jmp exit 
     
     MOVSTATEBLDH:
     mov dh, p1dh
     mov p1bl,dh
     jmp exit
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
      MOVSTATECHCl:
      mov cl, p1cl
      mov p1ch,cl
      jmp exit
      
      MOVSTATECHAL:
      mov al, p1al
      mov p1ch,al
      jmp exit
      
      MOVSTATECHAH:
      mov ah, p1ah
      mov p1ch,ah
      jmp exit 
      
      MOVSTATECHBL:
      mov bl, p1bl
      mov p1ch,bl
      jmp exit
      
      MOVSTATECHBH:
      mov bh, p1bh
      mov p1ch,bh
      jmp exit
      
      MOVSTATECHDL:
      mov dl, p1dl
      mov p1ch, dl
      jmp exit
      
      MOVSTATECHDH:
      mov dh,p1dh
      mov p1ch,dh
      jmp exit 
      
      MOVSTATECLCH:
      mov ch, p1ch
      mov p1cl,ch
      jmp exit
      
      MOVSTATECLAL:
      mov al, p1al
      mov p1cl,al
      jmp exit
      
      MOVSTATECLAH:
      mov ah, p1ah
      mov p1cl,ah
      jmp exit 
      
      MOVSTATECLBL:
      mov bl, p1bl
      mov p1cl,bl
      jmp exit
      
      MOVSTATECLBH:
      mov bh, p1bh
            mov p1cl,bh
      jmp exit
      
      MOVSTATECLDL:
      mov dl, p1dl
      mov p1cl,dl
      jmp exit
      
      MOVSTATECLDH:
      mov dh, p1dh
      mov p1cl,dh
      jmp exit 
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      MOVSTATEDHDL:
      mov dl, p1dl
      mov p1dh,dl
      jmp exit
      
      MOVSTATEDHAL:
      mov al, p1al
      mov p1dh,al
      jmp exit
      
      MOVSTATEDHAH:
      mov ah, p1ah
      mov p1dh,ah
      jmp exit
      
      MOVSTATEDHBL: 
      mov bl, p1bl
      mov p1dh,bl
      jmp exit
      
      MOVSTATEDHBH:
      mov bh, p1bh
      mov p1dh,bh
      jmp exit
      
      MOVSTATEDHCL:
      mov cl, p1cl
      mov p1dh,cl
      jmp exit
      
      MOVSTATEDHCH:
      mov ch, p1ch
      mov p1dh,ch
      jmp exit
      
      MOVSTATEDLDH:
      mov dh, p1dh
      mov p1dl,dh
      jmp exit
      
      MOVSTATEDLAL:
      mov al, p1al
      mov p1dl,al
      jmp exit
      
      MOVSTATEDLAH:
      mov ah, p1ah
      mov p1dl,ah
      jmp exit
      
      MOVSTATEDLBL: 
      mov bl, p1bl
      mov p1dl,bl
      jmp exit
      
      MOVSTATEDLBH:
      mov bh, p1bh
      mov p1dl,bh
      jmp exit
      
      MOVSTATEDLCL:
      mov cl, p1cl
      mov p1dl,cl
      jmp exit
      
      MOVSTATEDLCH:
      mov ch, p1ch
      mov p1dl,ch
      jmp exit
      
    ;---------------------------------------------
    
    MOVSTATESI:
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATESIAX
    cmp bl,'b'
    je MOVSTATESIB
    cmp bl,'c'
    je MOVSTATESICX
    cmp bl,'d'
    je MOVSTATESID
    cmp bl,'s'
    je MOVSTATESISP
    jmp ERORR
    MOVSTATESIB:
    inc si
    mov bx ,[si]
    cmp bl ,'p'
    je MOVSTATESIBP
    cmp bl,'x'
    je MOVSTATESIBX
jmp ERORR
    MOVSTATESID:
    inc si 
    mov bx,[si]
    cmp bl, 'x'
    je MOVSTATESIDX
    cmp bl,'p'
    je MOVSTATESIDI
jmp ERORR
    ;;;;;;;;;
    MOVSTATESP:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATESPAX ;
    cmp bl ,'c'
    je MOVSTATESPCX ;
    cmp bl ,'b'
    je MOVSTATESPB
    cmp bl,'d'
    je MOVSTATESPD
    cmp bl,'s'
    je MOVSTATESPSI ;
jmp ERORR
    MOVSTATESPB:
    inc si
    mov bx,[si]
    cmp bl,'x'
    je MOVSTATESPBX ;
    cmp bl, 'p'
    je MOVSTATESPBP ;
jmp ERORR
    MOVSTATESPD:
    inc si 
    mov bx,[si]
    cmp bl,'x'
    je MOVSTATESPDX;
    cmp bl,'i'
    je MOVSTATESPDI;
jmp ERORR
;;;;;;;;;;;
MOVSTATEDI:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEDIAX ;
    cmp bl ,'c'
    je MOVSTATEDICX ;
    cmp bl ,'b'
    je MOVSTATEDIB
    cmp bl,'d'
    je MOVSTATEDIDX ; 
    cmp bl, 's'
    je MOVSTATEDIS
jmp ERORR
    MOVSTATEDIB:
    inc si
    mov bx,[si]
    cmp bl,'x'
    je MOVSTATEDIBX ;
    cmp bl, 'p'
    je MOVSTATEDIBP ;
jmp ERORR
    MOVSTATEDIS:
    inc si
    mov bx,[si]
    cmp bl, 'i'
    je MOVSTATEDISI;
    cmp bl, 'p'
    je MOVSTATEDISP;

jmp ERORR
    ;;;;;;;;;;;
    MOVSTATEBP:
    inc si
    inc si
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEBPAX ;
    cmp bl ,'c'
    je MOVSTATEBPCX ;
    cmp bl ,'b'
    je MOVSTATEBPBX ;
    cmp bl,'d'
    je MOVSTATEBPD
    cmp bl, 's'
    je MOVSTATEBPS
jmp ERORR
    MOVSTATEBPD:
    inc si
    mov bx,[si]
    cmp bl ,'x'
    je MOVSTATEBPDX;
    cmp bl ,'i'
    je MOVSTATEBPDI;
jmp ERORR
    MOVSTATEBPS:
    inc si
    mov bx,[si]
    cmp bl ,'i'
    je MOVSTATEBPSI;
    cmp bl,'p'
    je MOVSTATEBPSP;
jmp ERORR
   ;vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
   
   MOVSTATEAXV:
   
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW
   sub al,7
   BELOW:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW2
   sub al,7
   BELOW2:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe BELOW3
   sub al,7
   BELOW3:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW4
   sub al,7
   BELOW4:
   sub al,30h
   add bl,al    
   
   mov p1ax,bx
    jmp exit
  
   MOVSTATEBXV:
    inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW5
   sub al,7
   BELOW5:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW6
   sub al,7
   BELOW6:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe BELOW7
   sub al,7
   BELOW7:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW8
   sub al,7
   BELOW8:
   sub al,30h
   add bl,al    
   
   mov p1bx,bx
    jmp exit
    
    
   MOVSTATEDXV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW9
   sub al,7
   BELOW9:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW10
   sub al,7
   BELOW10:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe BELOW11
   sub al,7
   BELOW11:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW12
   sub al,7
   BELOW12:
   sub al,30h
   add bl,al    
   
   mov p1dx,bx
    jmp exit
    
    
    
   MOVSTATECXV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW13
   sub al,7
   BELOW13:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW14
   sub al,7
   BELOW14:
   sub al,30h
   add bh,al
   
   inc si 
   mov al ,[si]
   cmp al,39h
   jbe BELOW15
   sub al,7
   BELOW15:
   sub al,30h
   mov dl,10h
   mul dl
   mov bl,al
    inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW16
   sub al,7
   BELOW16:
   sub al,30h
   add bl,al    
   
   mov p1cx,bx
   jmp exit
      
    
    
   MOVSTATEAHV:
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW17
   sub al,7
   BELOW17:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW18
   sub al,7
   BELOW18:
   sub al,30h
   add bh,al
   mov p1ah,bh
    jmp exit
    
    
   MOVSTATEALV:
   mov cl,56h
  
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW19
   sub al,7
   BELOW19:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW20
   sub al,7
   BELOW20:
   sub al,30h
   add bh,al 

   mov p1al,bh
   jmp exit
   
     
   MOVSTATEBHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW21
   sub al,7
   BELOW21:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW22
   sub al,7
   BELOW22:
   sub al,30h
   add bh,al 
   mov p1bh,bh
   jmp exit
   
     
   MOVSTATEBLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW23
   sub al,7
   BELOW23:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW24
   sub al,7
   BELOW24:
   sub al,30h
   add bh,al 
   mov p1bl,bh
   jmp exit
   
     
   MOVSTATECHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW25
   sub al,7
   BELOW25:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW26
   sub al,7
   BELOW26:
   sub al,30h
   add bh,al 
   mov p1ch,bh
   jmp exit
   
     
   MOVSTATECLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW27
   sub al,7
   BELOW27:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW28
   sub al,7
   BELOW28:
   sub al,30h
   add bh,al 
   mov p1cl,bh
   jmp exit
   
     
   MOVSTATEDHV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW29
   sub al,7
   BELOW29:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW30
   sub al,7
   BELOW30:
   sub al,30h
   add bh,al 
   mov p1dh,bh
   jmp exit
   
     
   MOVSTATEDLV:
    
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW31
   sub al,7
   BELOW31:
   sub al,30h
   mov dl,10h
   mul dl
   mov bh,al
   inc si
   mov al,[si]
   cmp al,39h
   jbe BELOW32
   sub al,7
   BELOW32:
   sub al,30h
   add bh,al 
   mov p1dl,bh
   jmp exit
    
   ;vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv 
    
    ;OFFFFFFFFFFFFFFFF
    MOVSTATEOFF0:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF0A
    cmp bl, 'b'
    je MOVSTATEOFF0B
    cmp bl, 'c'
    je MOVSTATEOFF0C
    cmp bl, 'd'
    je MOVSTATEOFF0D
jmp ERORR
    ;

    MOVSTATEOFF1:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF1A
    cmp bl, 'b'
    je MOVSTATEOFF1B
    cmp bl, 'c'
    je MOVSTATEOFF1C
    cmp bl, 'd'
    je MOVSTATEOFF1D
jmp ERORR
;

    MOVSTATEOFF2:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF2A
    cmp bl, 'b'
    je MOVSTATEOFF2B
    cmp bl, 'c'
    je MOVSTATEOFF2C
    cmp bl, 'd'
    je MOVSTATEOFF2D
jmp ERORR
;

    MOVSTATEOFF3:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF3A
    cmp bl, 'b'
    je MOVSTATEOFF3B
    cmp bl, 'c'
    je MOVSTATEOFF3C
    cmp bl, 'd'
    je MOVSTATEOFF3D
jmp ERORR
    ;
    MOVSTATEOFF4:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF4A
    cmp bl, 'b'
    je MOVSTATEOFF4B
    cmp bl, 'c'
    je MOVSTATEOFF4C
    cmp bl, 'd'
    je MOVSTATEOFF4D
jmp ERORR
MOVSTATEOFF5:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF5A
    cmp bl, 'b'
    je MOVSTATEOFF5B
    cmp bl, 'c'
    je MOVSTATEOFF5C
    cmp bl, 'd'
    je MOVSTATEOFF5D
jmp ERORR
;
MOVSTATEOFF6:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF6A
    cmp bl, 'b'
    je MOVSTATEOFF6B
    cmp bl, 'c'
    je MOVSTATEOFF6C
    cmp bl, 'd'
    je MOVSTATEOFF6D

jmp ERORR
;


MOVSTATEOFF7:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF7A
    cmp bl, 'b'
    je MOVSTATEOFF7B
    cmp bl, 'c'
    je MOVSTATEOFF7C
    cmp bl, 'd'
    je MOVSTATEOFF7D
jmp ERORR
    ;

    MOVSTATEOFF8:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF8A
    cmp bl, 'b'
    je MOVSTATEOFF8B
    cmp bl, 'c'
    je MOVSTATEOFF8C
    cmp bl, 'd'
    je MOVSTATEOFF8D
jmp ERORR
  MOVSTATEOFF9:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFF9A
    cmp bl, 'b'
    je MOVSTATEOFF9B
    cmp bl, 'c'
    je MOVSTATEOFF9C
    cmp bl, 'd'
    je MOVSTATEOFF9D
jmp ERORR
    ;

    MOVSTATEOFFA:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFFAA
    cmp bl, 'b'
    je MOVSTATEOFFAB
    cmp bl, 'c'
    je MOVSTATEOFFAC
    cmp bl, 'd'
    je MOVSTATEOFFAD
jmp ERORR
MOVSTATEOFFB:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFFBA
    cmp bl, 'b'
    je MOVSTATEOFFBB
    cmp bl, 'c'
    je MOVSTATEOFFBC
    cmp bl, 'd'
    je MOVSTATEOFFBD
jmp ERORR
MOVSTATEOFFC:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFFCA
    cmp bl, 'b'
    je MOVSTATEOFFCB
    cmp bl, 'c'
    je MOVSTATEOFFCC
    cmp bl, 'd'
    je MOVSTATEOFFCD
jmp ERORR

MOVSTATEOFFD:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFFDA
    cmp bl, 'b'
    je MOVSTATEOFFDB
    cmp bl, 'c'
    je MOVSTATEOFFDC
    cmp bl, 'd'
    je MOVSTATEOFFDD
jmp ERORR
MOVSTATEOFFE:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFFEA
    cmp bl, 'b'
    je MOVSTATEOFFEB
    cmp bl, 'c'
    je MOVSTATEOFFEC
    cmp bl, 'd'
    je MOVSTATEOFFED
jmp ERORR
MOVSTATEOFFF:
    inc si
    inc si
    inc si 
    mov bx,[si]
    cmp bl,'a'
    je MOVSTATEOFFFA
    cmp bl, 'b'
    je MOVSTATEOFFFB
    cmp bl, 'c'
    je MOVSTATEOFFFC
    cmp bl, 'd'
    je MOVSTATEOFFFD
    jmp ERORR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVSTATEOFF0A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF0AH
    cmp bl,'l'
    je MOVSTATEOFF0AL
jmp ERORR
    MOVSTATEOFF0B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF0BH
    cmp bl,'l'
    je MOVSTATEOFF0BL
jmp ERORR
    MOVSTATEOFF0C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF0CH
    cmp bl,'l'
    je MOVSTATEOFF0CL
jmp ERORR
    MOVSTATEOFF0D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF0DH
    cmp bl,'l'
    je MOVSTATEOFF0DL
jmp ERORR

    MOVSTATEOFF1A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF1AH
    cmp bl,'l'
    je MOVSTATEOFF1AL
jmp ERORR
    MOVSTATEOFF1B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF1BH
    cmp bl,'l'
    je MOVSTATEOFF1BL
jmp ERORR
    MOVSTATEOFF1C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF1CH
    cmp bl,'l'
    je MOVSTATEOFF1CL
jmp ERORR
    MOVSTATEOFF1D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF1DH
    cmp bl,'l'
    je MOVSTATEOFF1DL
jmp ERORR

    ;
    MOVSTATEOFF2A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF2AH
    cmp bl,'l'
    je MOVSTATEOFF2AL
jmp ERORR
    MOVSTATEOFF2B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF2BH
    cmp bl,'l'
    je MOVSTATEOFF2BL
jmp ERORR
    MOVSTATEOFF2C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF2CH
    cmp bl,'l'
    je MOVSTATEOFF2CL
jmp ERORR
    MOVSTATEOFF2D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF2DH
    cmp bl,'l'
    je MOVSTATEOFF2DL
jmp ERORR
;

MOVSTATEOFF3A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF3AH
    cmp bl,'l'
    je MOVSTATEOFF3AL
jmp ERORR
    MOVSTATEOFF3B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF3BH
    cmp bl,'l'
    je MOVSTATEOFF3BL
jmp ERORR
    MOVSTATEOFF3C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF3CH
    cmp bl,'l'
    je MOVSTATEOFF3CL
jmp ERORR
    MOVSTATEOFF3D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF3DH
    cmp bl,'l'
    je MOVSTATEOFF3DL
jmp ERORR
MOVSTATEOFF4A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF4AH
    cmp bl,'l'
    je MOVSTATEOFF4AL
jmp ERORR
    MOVSTATEOFF4B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF4BH
    cmp bl,'l'
    je MOVSTATEOFF4BL
jmp ERORR
    MOVSTATEOFF4C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF4CH
    cmp bl,'l'
    je MOVSTATEOFF4CL
jmp ERORR
    MOVSTATEOFF4D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF4DH
    cmp bl,'l'
    je MOVSTATEOFF4DL
jmp ERORR
MOVSTATEOFF5A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF5AH
    cmp bl,'l'
    je MOVSTATEOFF5AL
jmp ERORR
    MOVSTATEOFF5B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF5BH
    cmp bl,'l'
    je MOVSTATEOFF5BL
jmp ERORR
    MOVSTATEOFF5C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF5CH
    cmp bl,'l'
    je MOVSTATEOFF5CL
jmp ERORR
    MOVSTATEOFF5D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF5DH
    cmp bl,'l'
    je MOVSTATEOFF5DL
jmp ERORR
MOVSTATEOFF6A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF6AH
    cmp bl,'l'
    je MOVSTATEOFF6AL
jmp ERORR
    MOVSTATEOFF6B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF6BH
    cmp bl,'l'
    je MOVSTATEOFF6BL
jmp ERORR
    MOVSTATEOFF6C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF6CH
    cmp bl,'l'
    je MOVSTATEOFF6CL
jmp ERORR
    MOVSTATEOFF6D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF6DH
    cmp bl,'l'
    je MOVSTATEOFF6DL
jmp ERORR
MOVSTATEOFF7A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF7AH
    cmp bl,'l'
    je MOVSTATEOFF7AL
jmp ERORR
    MOVSTATEOFF7B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF7BH
    cmp bl,'l'
    je MOVSTATEOFF7BL
jmp ERORR
    MOVSTATEOFF7C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF7CH
    cmp bl,'l'
    je MOVSTATEOFF7CL
jmp ERORR
    MOVSTATEOFF7D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF7DH
    cmp bl,'l'
    je MOVSTATEOFF7DL
jmp ERORR
MOVSTATEOFF8A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF8AH
    cmp bl,'l'
    je MOVSTATEOFF8AL
jmp ERORR
    MOVSTATEOFF8B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF8BH
    cmp bl,'l'
    je MOVSTATEOFF8BL
jmp ERORR
    MOVSTATEOFF8C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF8CH
    cmp bl,'l'
    je MOVSTATEOFF8CL
jmp ERORR
    MOVSTATEOFF8D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF8DH
    cmp bl,'l'
    je MOVSTATEOFF8DL
jmp ERORR
MOVSTATEOFF9A:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF9AH
    cmp bl,'l'
    je MOVSTATEOFF9AL
jmp ERORR
    MOVSTATEOFF9B:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF9BH
    cmp bl,'l'
    je MOVSTATEOFF9BL
jmp ERORR
    MOVSTATEOFF9C:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF9CH
    cmp bl,'l'
    je MOVSTATEOFF9CL
jmp ERORR
    MOVSTATEOFF9D:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFF9DH
    cmp bl,'l'
    je MOVSTATEOFF9DL
jmp ERORR
MOVSTATEOFFAA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFAAH
    cmp bl,'l'
    je MOVSTATEOFFAAL
jmp ERORR
    MOVSTATEOFFAB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFABH
    cmp bl,'l'
    je MOVSTATEOFFABL
jmp ERORR
    MOVSTATEOFFAC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFACH
    cmp bl,'l'
    je MOVSTATEOFFACL
jmp ERORR
    MOVSTATEOFFAD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFADH
    cmp bl,'l'
    je MOVSTATEOFFADL
jmp ERORR
MOVSTATEOFFBA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFBAH
    cmp bl,'l'
    je MOVSTATEOFFBAL
jmp ERORR
    MOVSTATEOFFBB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFBBH
    cmp bl,'l'
    je MOVSTATEOFFBBL
jmp ERORR
    MOVSTATEOFFBC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFBCH
    cmp bl,'l'
    je MOVSTATEOFFBCL
jmp ERORR
    MOVSTATEOFFBD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFBDH
    cmp bl,'l'
    je MOVSTATEOFFBDL
jmp ERORR
MOVSTATEOFFCA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFCAH
    cmp bl,'l'
    je MOVSTATEOFFCAL
jmp ERORR
    MOVSTATEOFFCB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFCBH
    cmp bl,'l'
    je MOVSTATEOFFCBL
jmp ERORR
    MOVSTATEOFFCC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFCCH
    cmp bl,'l'
    je MOVSTATEOFFCCL
jmp ERORR
    MOVSTATEOFFCD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFCDH
    cmp bl,'l'
    je MOVSTATEOFFCDL
jmp ERORR
MOVSTATEOFFDA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFDAH
    cmp bl,'l'
    je MOVSTATEOFFDAL
jmp ERORR
    MOVSTATEOFFDB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFDBH
    cmp bl,'l'
    je MOVSTATEOFFDBL
jmp ERORR
    MOVSTATEOFFDC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFDCH
    cmp bl,'l'
    je MOVSTATEOFFDCL
jmp ERORR
    MOVSTATEOFFDD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFDDH
    cmp bl,'l'
    je MOVSTATEOFFDDL
jmp ERORR
MOVSTATEOFFEA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFEAH
    cmp bl,'l'
    je MOVSTATEOFFEAL
jmp ERORR
    MOVSTATEOFFEB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFEBH
    cmp bl,'l'
    je MOVSTATEOFFEBL
jmp ERORR
    MOVSTATEOFFEC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFECH
    cmp bl,'l'
    je MOVSTATEOFFECL
jmp ERORR
    MOVSTATEOFFED:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFEDH
    cmp bl,'l'
    je MOVSTATEOFFEDL
jmp ERORR
MOVSTATEOFFFA:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFFAH
    cmp bl,'l'
    je MOVSTATEOFFFAL
jmp ERORR
    MOVSTATEOFFFB:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFFBH
    cmp bl,'l'
    je MOVSTATEOFFFBL
jmp ERORR
    MOVSTATEOFFFC:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFFCH
    cmp bl,'l'
    je MOVSTATEOFFFCL
jmp ERORR
    MOVSTATEOFFFD:
    inc si
    mov bx, [si]
    cmp bl,'h'
    je MOVSTATEOFFFDH
    cmp bl,'l'
    je MOVSTATEOFFFDL
jmp ERORR



    ;OFFFFFFFFFFFFFFFFFFFF
    MOVSTATEOFF0AL:
    mov ah,p1al
    mov p10,ah  
    jmp exit
    MOVSTATEOFF0AH:
    mov ah,p1ah
    mov p10,ah  
    jmp exit
    MOVSTATEOFF0BL:
    mov ah,p1bl
    mov p10,ah  
    jmp exit
    MOVSTATEOFF0BH:
    mov ah,p1bh
    mov p10,ah  
    jmp exit
    MOVSTATEOFF0CL:
    mov ah,p1cl
    mov p10,ah  
    jmp exit
    MOVSTATEOFF0CH:
    mov ah,p1ch
    mov p10,ah  
    jmp exit
    MOVSTATEOFF0DL:
    mov ah,p1dl
    mov p10,ah  
    jmp exit
    MOVSTATEOFF0DH:
    mov ah,p1dh
    mov p10,ah  
    jmp exit


    ;
    MOVSTATEOFF1AL:
    mov ah,p1al
    mov p11,ah  
    jmp exit
    MOVSTATEOFF1AH:
    mov ah,p1ah
    mov p11,ah  
    jmp exit
    MOVSTATEOFF1BL:
    mov ah,p1bl
    mov p11,ah  
    jmp exit
    MOVSTATEOFF1BH:
    mov ah,p1bh
    mov p11,ah  
    jmp exit
    MOVSTATEOFF1CL:
    mov ah,p1cl
    mov p11,ah  
    jmp exit
    MOVSTATEOFF1CH:
    mov ah,p1ch
    mov p11,ah  
    jmp exit
    MOVSTATEOFF1DL:
    mov ah,p1dl
    mov p11,ah  
    jmp exit
    MOVSTATEOFF1DH:
    mov ah,p1dh
    mov p11,ah  
    jmp exit

    ;

    MOVSTATEOFF2AL:
    mov ah,p1al
    mov p12,ah  
    jmp exit
    MOVSTATEOFF2AH:
    mov ah,p1ah
    mov p12,ah  
    jmp exit
    MOVSTATEOFF2BL:
    mov ah,p1bl
    mov p12,ah  
    jmp exit
    MOVSTATEOFF2BH:
    mov ah,p1bh
    mov p12,ah  
    jmp exit
    MOVSTATEOFF2CL:
    mov ah,p1cl
    mov p12,ah  
    jmp exit
    MOVSTATEOFF2CH:
    mov ah,p1ch
    mov p12,ah  
    jmp exit
    MOVSTATEOFF2DL:
    mov ah,p1dl
    mov p12,ah  
    jmp exit
    MOVSTATEOFF2DH:
    mov ah,p1dh
    mov p12,ah  
    jmp exit

    ;

    MOVSTATEOFF3AL:
    mov ah,p1al
    mov p13,ah  
    jmp exit
    MOVSTATEOFF3AH:
    mov ah,p1ah
    mov p13,ah  
    jmp exit
    MOVSTATEOFF3BL:
    mov ah,p1bl
    mov p13,ah  
    jmp exit
    MOVSTATEOFF3BH:
    mov ah,p1bh
    mov p13,ah  
    jmp exit
    MOVSTATEOFF3CL:
    mov ah,p1cl
    mov p13,ah  
    jmp exit
    MOVSTATEOFF3CH:
    mov ah,p1ch
    mov p13,ah  
    jmp exit
    MOVSTATEOFF3DL:
    mov ah,p1dl
    mov p13,ah  
    jmp exit
    MOVSTATEOFF3DH:
    mov ah,p1dh
    mov p13,ah  
    jmp exit
    ;
    MOVSTATEOFF4AL:
    mov ah,p1al
    mov p14,ah  
    jmp exit
    MOVSTATEOFF4AH:
    mov ah,p1ah
    mov p14,ah  
    jmp exit
    MOVSTATEOFF4BL:
    mov ah,p1bl
    mov p14,ah  
    jmp exit
    MOVSTATEOFF4BH:
    mov ah,p1bh
    mov p14,ah  
    jmp exit
    MOVSTATEOFF4CL:
    mov ah,p1cl
    mov p14,ah  
    jmp exit
    MOVSTATEOFF4CH:
    mov ah,p1ch
    mov p14,ah  
    jmp exit
    MOVSTATEOFF4DL:
    mov ah,p1dl
    mov p14,ah  
    jmp exit
    MOVSTATEOFF4DH:
    mov ah,p1dh
    mov p14,ah  
    jmp exit
;


MOVSTATEOFF5AL:
    mov ah,p1al
    mov p15,ah  
    jmp exit
    MOVSTATEOFF5AH:
    mov ah,p1ah
    mov p15,ah  
    jmp exit
    MOVSTATEOFF5BL:
    mov ah,p1bl
    mov p15,ah  
    jmp exit
    MOVSTATEOFF5BH:
    mov ah,p1bh
    mov p15,ah  
    jmp exit
    MOVSTATEOFF5CL:
    mov ah,p1cl
    mov p15,ah  
    jmp exit
    MOVSTATEOFF5CH:
    mov ah,p1ch
    mov p15,ah  
    jmp exit
    MOVSTATEOFF5DL:
    mov ah,p1dl
    mov p15,ah  
    jmp exit
    MOVSTATEOFF5DH:
    mov ah,p1dh
    mov p15,ah  
    jmp exit
    ;

    MOVSTATEOFF6AL:
    mov ah,p1al
    mov p16,ah  
    jmp exit
    MOVSTATEOFF6AH:
    mov ah,p1ah
    mov p16,ah  
    jmp exit
    MOVSTATEOFF6BL:
    mov ah,p1bl
    mov p16,ah  
    jmp exit
    MOVSTATEOFF6BH:
    mov ah,p1bh
    mov p16,ah  
    jmp exit
    MOVSTATEOFF6CL:
    mov ah,p1cl
    mov p16,ah  
    jmp exit
    MOVSTATEOFF6CH:
    mov ah,p1ch
    mov p16,ah  
    jmp exit
    MOVSTATEOFF6DL:
    mov ah,p1dl
    mov p16,ah  
    jmp exit
    MOVSTATEOFF6DH:
    mov ah,p1dh
    mov p16,ah  
    jmp exit
    ;
    MOVSTATEOFF7AL:
    mov ah,p1al
    mov p17,ah  
    jmp exit
    MOVSTATEOFF7AH:
    mov ah,p1ah
    mov p17,ah  
    jmp exit
    MOVSTATEOFF7BL:
    mov ah,p1bl
    mov p17,ah  
    jmp exit
    MOVSTATEOFF7BH:
    mov ah,p1bh
    mov p17,ah  
    jmp exit
    MOVSTATEOFF7CL:
    mov ah,p1cl
    mov p17,ah  
    jmp exit
    MOVSTATEOFF7CH:
    mov ah,p1ch
    mov p17,ah  
    jmp exit
    MOVSTATEOFF7DL:
    mov ah,p1dl
    mov p17,ah  
    jmp exit
    MOVSTATEOFF7DH:
    mov ah,p1dh
    mov p17,ah  
    jmp exit
    ;

    MOVSTATEOFF8AL:
    mov ah,p1al
    mov p18,ah  
    jmp exit
    MOVSTATEOFF8AH:
    mov ah,p1ah
    mov p18,ah  
    jmp exit
    MOVSTATEOFF8BL:
    mov ah,p1bl
    mov p18,ah  
    jmp exit
    MOVSTATEOFF8BH:
    mov ah,p1bh
    mov p18,ah  
    jmp exit
    MOVSTATEOFF8CL:
    mov ah,p1cl
    mov p18,ah  
    jmp exit
    MOVSTATEOFF8CH:
    mov ah,p1ch
    mov p18,ah  
    jmp exit
    MOVSTATEOFF8DL:
    mov ah,p1dl
    mov p18,ah  
    jmp exit
    MOVSTATEOFF8DH:
    mov ah,p1dh
    mov p18,ah  
    jmp exit
    ;

    MOVSTATEOFF9AL:
    mov ah,p1al
    mov p19,ah  
    jmp exit
    MOVSTATEOFF9AH:
    mov ah,p1ah
    mov p19,ah  
    jmp exit
    MOVSTATEOFF9BL:
    mov ah,p1bl
    mov p19,ah  
    jmp exit
    MOVSTATEOFF9BH:
    mov ah,p1bh
    mov p19,ah  
    jmp exit
    MOVSTATEOFF9CL:
    mov ah,p1cl
    mov p19,ah  
    jmp exit
    MOVSTATEOFF9CH:
    mov ah,p1ch
    mov p19,ah  
    jmp exit
    MOVSTATEOFF9DL:
    mov ah,p1dl
    mov p19,ah  
    jmp exit
    MOVSTATEOFF9DH:
    mov ah,p1dh
    mov p19,ah  
    jmp exit
    ;
    MOVSTATEOFFAAL:
    mov ah,p1al
    mov p1a,ah  
    jmp exit
    MOVSTATEOFFAAH:
    mov ah,p1ah
    mov p1a,ah  
    jmp exit
    MOVSTATEOFFABL:
    mov ah,p1bl
    mov p1a,ah  
    jmp exit
    MOVSTATEOFFABH:
    mov ah,p1bh
    mov p1a,ah  
    jmp exit
    MOVSTATEOFFACL:
    mov ah,p1cl
    mov p1a,ah  
    jmp exit
    MOVSTATEOFFACH:
    mov ah,p1ch
    mov p1a,ah  
    jmp exit
    MOVSTATEOFFADL:
    mov ah,p1dl
    mov p1a,ah  
    jmp exit
    MOVSTATEOFFADH:
    mov ah,p1dh
    mov p1a,ah  
    jmp exit

    ;
    MOVSTATEOFFBAL:
    mov ah,p1al
    mov p1b,ah  
    jmp exit
    MOVSTATEOFFBAH:
    mov ah,p1ah
    mov p1b,ah  
    jmp exit
    MOVSTATEOFFBBL:
    mov ah,p1bl
    mov p1b,ah  
    jmp exit
    MOVSTATEOFFBBH:
    mov ah,p1bh
    mov p1b,ah  
    jmp exit
    MOVSTATEOFFBCL:
    mov ah,p1cl
    mov p1b,ah  
    jmp exit
    MOVSTATEOFFBCH:
    mov ah,p1ch
    mov p1b,ah  
    jmp exit
    MOVSTATEOFFBDL:
    mov ah,p1dl
    mov p1b,ah  
    jmp exit
    MOVSTATEOFFBDH:
    mov ah,p1dh
    mov p1b,ah  
    jmp exit
    ;
    MOVSTATEOFFCAL:
    mov ah,p1al
    mov p1c,ah  
    jmp exit
    MOVSTATEOFFCAH:
    mov ah,p1ah
    mov p1c,ah  
    jmp exit
    MOVSTATEOFFCBL:
    mov ah,p1bl
    mov p1c,ah  
    jmp exit
    MOVSTATEOFFCBH:
    mov ah,p1bh
    mov p1c,ah  
    jmp exit
    MOVSTATEOFFCCL:
    mov ah,p1cl
    mov p1c,ah  
    jmp exit
    MOVSTATEOFFCCH:
    mov ah,p1ch
    mov p1c,ah  
    jmp exit
    MOVSTATEOFFCDL:
    mov ah,p1dl
    mov p1c,ah  
    jmp exit
    MOVSTATEOFFCDH:
    mov ah,p1dh
    mov p1c,ah  
    jmp exit
    ;
    MOVSTATEOFFDAL:
    mov ah,p1al
    mov p1d,ah  
    jmp exit
    MOVSTATEOFFDAH:
    mov ah,p1ah
    mov p1d,ah  
    jmp exit
    MOVSTATEOFFDBL:
    mov ah,p1bl
    mov p1d,ah  
    jmp exit
    MOVSTATEOFFDBH:
    mov ah,p1bh
    mov p1d,ah  
    jmp exit
    MOVSTATEOFFDCL:
    mov ah,p1cl
    mov p1d,ah  
    jmp exit
    MOVSTATEOFFDCH:
    mov ah,p1ch
    mov p1d,ah  
    jmp exit
    MOVSTATEOFFDDL:
    mov ah,p1dl
    mov p1d,ah  
    jmp exit
    MOVSTATEOFFDDH:
    mov ah,p1dh
    mov p1d,ah  
    jmp exit
    ;

    MOVSTATEOFFEAL:
    mov ah,p1al
    mov p1e,ah  
    jmp exit
    MOVSTATEOFFEAH:
    mov ah,p1ah
    mov p1e,ah  
    jmp exit
    MOVSTATEOFFEBL:
    mov ah,p1bl
    mov p1e,ah  
    jmp exit
    MOVSTATEOFFEBH:
    mov ah,p1bh
    mov p1e,ah  
    jmp exit
    MOVSTATEOFFECL:
    mov ah,p1cl
    mov p1e,ah  
    jmp exit
    MOVSTATEOFFECH:
    mov ah,p1ch
    mov p1e,ah  
    jmp exit
    MOVSTATEOFFEDL:
    mov ah,p1dl
    mov p1e,ah  
    jmp exit
    MOVSTATEOFFEDH:
    mov ah,p1dh
    mov p1e,ah  
    jmp exit
    ;

    MOVSTATEOFFFAL:
    mov ah,p1al
    mov p1f,ah  
    jmp exit
    MOVSTATEOFFFAH:
    mov ah,p1ah
    mov p1f,ah  
    jmp exit
    MOVSTATEOFFFBL:
    mov ah,p1bl
    mov p1f,ah  
    jmp exit
    MOVSTATEOFFFBH:
    mov ah,p1bh
    mov p1f,ah  
    jmp exit
    MOVSTATEOFFFCL:
    mov ah,p1cl
    mov p1f,ah  
    jmp exit
    MOVSTATEOFFFCH:
    mov ah,p1ch
    mov p1f,ah  
    jmp exit
    MOVSTATEOFFFDL:
    mov ah,p1dl
    mov p1f,ah  
    jmp exit
    MOVSTATEOFFFDH:
    mov ah,p1dh
    mov p1f,ah  
    jmp exit
   ;====================================================
   MOVSTATEDXTOAX:
   mov ax,p1ax
mov p1dx,ax
   jmp exit
   MOVSTATEDXTOBX:
   mov bx , p1bx
   mov p1dx,bx
   jmp exit 
   MOVSTATEDXTOCX:
   mov cx, p1cx
   mov p1dx,cx
   jmp exit
   ;===========
   MOVSTATECXTOAX:
   mov ax, p1ax
   mov p1cx,ax
   jmp exit
   MOVSTATECXTOBX:
   mov bx ,p1bx
   mov p1cx,bx
   jmp exit
   MOVSTATECXTODX:
   mov dx, p1dx
   mov p1cx,dx
   jmp exit
   ;=============
   MOVSTATEBXTOAX:
   mov ax,p1ax
   mov p1bx,ax
   jmp exit
   MOVSTATEBXTOCX:
   mov cx,p1cx
   mov p1bx,cx
   jmp exit
   MOVSTATEBXTODX:
   mov dx, p1dx
   mov p1bx,dx
   jmp exit
   ;=========
   MOVSTATEAXTOBX:
   mov bx, p1bx
   mov p1ax,bx
   jmp exit
   MOVSTATEAXTOCX:
   mov cx,p1cx
   mov p1ax,cx 
   jmp exit
   MOVSTATEAXTODX:
   mov dx, p1dx
   mov p1ax,dx
   jmp exit

  MOVSTATEAXTOSI:
  mov bx, p1si
  mov p1ax,bx
  jmp exit

  MOVSTATEAXTODI:
  mov bx, p1di
  mov p1ax,bx
  jmp exit
  MOVSTATEAXTOSP:
  mov bx, p1sp
  mov p1ax,bx
  jmp exit
  
  MOVSTATEAXTOBP:
  mov bx, p1bp
  mov p1ax,bx
  jmp exit
  

  MOVSTATEBXTOBP :
  mov bx, p1bp
  mov p1bx, bx
  jmp exit
  MOVSTATEBXTOSI :
  mov bx, p1si
  mov p1bx, bx
  jmp exit
  
  MOVSTATEBXTOSP :
  mov bx, p1sp
  mov p1bx, bx
  jmp exit
  MOVSTATEBXTODI :
  mov bx, p1di
  mov p1bx, bx
  jmp exit
  
  MOVSTATECXTOSI :
  mov bx, p1si
  mov p1cx, bx
  jmp exit

  MOVSTATECXTOSP :
  mov bx, p1sp
  mov p1cx, bx
  jmp exit
  MOVSTATECXTOBP :
  mov bx, p1bp
  mov p1cx, bx
  jmp exit
  MOVSTATECXTODI :
  mov bx, p1di
  mov p1cx, bx
  jmp exit

  MOVSTATEDXTOSI: 
  mov bx, p1si
  mov p1dx,bx
  jmp exit

MOVSTATEDXTOSP: 
  mov bx, p1sp
  mov p1dx,bx
  jmp exit

MOVSTATEDXTOBP: 
  mov bx, p1bp
  mov p1dx,bx
  jmp exit

MOVSTATEDXTODI: 
  mov bx, p1di
  mov p1dx,bx
  jmp exit

MOVSTATESIAX:
mov ax,p1ax
mov p1si,ax
jmp exit

MOVSTATESICX:
mov cx,p1cx
mov p1si,cx
jmp exit
MOVSTATESIBX:
mov bx,p1bx
mov p1si,bx
jmp exit
MOVSTATESIDX:
mov dx,p1dx
mov p1si,dx
jmp exit

MOVSTATESISP:
mov bx,p1sp
mov p1si,bx
jmp exit
MOVSTATESIBP:
mov bx,p1bp
mov p1si,bx
jmp exit

MOVSTATESIDI:
mov bx,p1di
mov p1si,bx
jmp exit

MOVSTATESPAX:
mov ax,p1ax
mov p1sp,ax
jmp exit

MOVSTATESPBX:
mov bx,p1bx
mov p1sp,bx
jmp exit

MOVSTATESPCX:
mov cx,p1cx
mov p1sp,cx
jmp exit

MOVSTATESPDX:
mov dx,p1dx
mov p1sp,dx
jmp exit

MOVSTATESPSI :
mov bx,p1si
mov p1sp,bx
jmp exit

MOVSTATESPBP:
mov bx,p1bp
mov p1sp,bx
jmp exit

MOVSTATESPDI:
mov bx,p1di
mov p1sp,bx
jmp exit

;
MOVSTATEDIAX:
mov ax,p1ax
mov p1di,ax
jmp exit
MOVSTATEDIBX:
mov bx,p1bx
mov p1di,bx
jmp exit
MOVSTATEDICX:
mov cx,p1cx
mov p1di,cx
jmp exit
MOVSTATEDIDX:
mov dx,p1dx
mov p1di,dx
jmp exit

MOVSTATEDIBP:
mov bx,p1bp
mov p1di,bx
jmp exit

MOVSTATEDISI:
mov bx,p1si
mov p1di,bx
jmp exit

MOVSTATEDISP:
mov bx,p1sp
mov p1di,bx
jmp exit

;;
MOVSTATEBPAX:
mov ax,p1ax
mov p1bp,ax
jmp exit

MOVSTATEBPBX:
mov bx,p1bx
mov p1bp,bx
jmp exit

MOVSTATEBPCX:
mov cx,p1cx
mov p1bp,cx
jmp exit

MOVSTATEBPDX:
mov dx,p1dx
mov p1bp,dx
jmp exit

MOVSTATEBPDI:
mov bx,p1di
mov p1bp,bx
jmp exit

MOVSTATEBPSI:
mov bx,p1si
mov p1bp,bx
jmp exit

MOVSTATEBPSP:
mov bx,p1sp
mov p1bp,bx
jmp exit


   ;==========
   exit:
    ret
    MOVP endp  
    
 end 
    