        
		
		
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
		EXTRN p1point  :BYTE
		EXTRN p1carry  :BYTE
         EXTRN s  :BYTE

		 EXTRN command1 :BYTE
		EXTRN comand1 :BYTE
		EXTRN pgpoint  :BYTE

		 
		
		
        PUBLIC PRO1
.MODEL SMALL
.386
.data
;command1  db   30,?,30 dup('$')
.CODE
PRO1 PROC FAR
       mov ax,@data
	   mov ds,ax
	   
	  
	   
	   call incp1
	   call decp1
	   call pushp1
	   call popp1
	   call notp1
	   call cmcp
	   call nopp
	   call setcarryp1
	   call clearcarryp1
	   call dem
	  
        RET
PRO1 ENDP

incp1 proc near


cmp command1[0], 'i'
jne skipfunc
cmp command1[1], 'n'
jne skipfunc
cmp command1[2], 'c'
jne skipfunc
cmp command1[3], ' '
jne skipfuncwithpenalty

cmp command1[4], 'a'
je p1a1
cmp command1[4], 'b'
je p1b1
cmp command1[4], 'c'
je p1c1
cmp command1[4], 'd'
je p1d1
cmp command1[4], 's'
je p1s
cmp command1[4], '['
je incvars

jmp skipfuncwithpenalty

p1a1:
cmp command1[5], 'x'
je p1axjmp
cmp command1[5], 'h'
je p1ahjmp
cmp command1[5], 'l'
je p1aljmp

p1b1:
cmp command1[5], 'x'
je p1bxjmp
cmp command1[5], 'h'
je p1bhjmp
cmp command1[5], 'l'
je p1bljmp
cmp command1[5], 'p'
je p1bpjmp

p1c1:
cmp command1[5], 'x'
je p1cxjmp
cmp command1[5], 'h'
je p1chjmp
cmp command1[5], 'l'
je p1cljmp

p1d1:
cmp command1[5], 'x'
je p1dxjmp
cmp command1[5], 'h'
je p1dhjmp
cmp command1[5], 'l'
je p1dljmp
cmp command1[5], 'i'
je p1dijmp


p1s:
cmp command1[5], 'i'
je p1sijmp
cmp command1[5], 'p'
je p1spjmp

jmp skipfuncwithpenalty


p1axjmp:
inc [p1ax]
jmp skipfunc
p1ahjmp:
inc p1ah
jmp skipfunc
p1aljmp:
inc p1al
jmp skipfunc

p1bxjmp:
inc [p1bx]
jmp skipfunc
p1bhjmp:
inc p1bh
jmp skipfunc
p1bljmp:
inc p1bl
jmp skipfunc
p1bpjmp:
inc [p1bp];
jmp skipfunc

p1cxjmp:
inc [p1cx]
jmp skipfunc
p1chjmp:
inc p1ch
jmp skipfunc
p1cljmp:
inc p1cl;
jmp skipfunc

p1dxjmp:
inc [p1dx];
jmp skipfunc
p1dhjmp:
inc p1dh;
jmp skipfunc
p1dljmp:
inc p1dl;
jmp skipfunc
p1dijmp:
inc [p1di];
jmp skipfunc


p1sijmp:
inc [p1si];
jmp skipfunc
p1spjmp:
inc [p1sp];
jmp skipfunc

incvars:
cmp command1[6], ']'
jne skipfuncwithpenalty

cmp command1[5], '0'
je incvar0
cmp command1[5], '1'
je incvar1
cmp command1[5], '2'
je incvar2
cmp command1[5], '3'
je incvar3
cmp command1[5], '4'
je incvar4
cmp command1[5], '5'
je incvar5
cmp command1[5], '6'
je incvar6
cmp command1[5], '7'
je incvar7
cmp command1[5], '8'
je incvar8
cmp command1[5], '9'
je incvar9
cmp command1[5], 'a'
je incvara
cmp command1[5], 'b'
je incvarb
cmp command1[5], 'c'
je incvarc
cmp command1[5], 'd'
je incvard
cmp command1[5], 'e'
je incvare
cmp command1[5], 'f'
je incvarf

jmp skipfuncwithpenalty

incvar0:
inc p10
jmp skipfunc

incvar1:
inc p11
jmp skipfunc

incvar2:
inc p12
jmp skipfunc

incvar3:
inc p13
jmp skipfunc

incvar4:
inc p14
jmp skipfunc

incvar5:
inc p15
jmp skipfunc

incvar6:
inc p16
jmp skipfunc

incvar7:
inc p17
jmp skipfunc

incvar8:
inc p18
jmp skipfunc

incvar9:
inc p19
jmp skipfunc

incvara:
inc p1a
jmp skipfunc

incvarb:
inc p1b
jmp skipfunc

incvarc:
inc p1c
jmp skipfunc

incvard:
inc p1d
jmp skipfunc

incvare:
inc p1e
jmp skipfunc

incvarf:
inc p1f
jmp skipfunc

skipfuncwithpenalty:
dec pgpoint
skipfunc:


ret
incp1 ENDP

decp1 proc near

cmp command1[0], 'd'
jne decp1skipfunc
cmp command1[1], 'e'
jne decp1skipfunc
cmp command1[2], 'c'
jne decp1skipfunc
cmp command1[3], ' '
jne decp1skipfuncwithpenalty

cmp command1[4], 'a'
je decp1p1a
cmp command1[4], 'b'
je decp1p1b
cmp command1[4], 'c'
je decp1p1c
cmp command1[4], 'd'
je decp1p1d
cmp command1[4], 's'
je decp1p1s
cmp command1[4], '['
je decp1decvars

jmp decp1skipfuncwithpenalty

decp1p1a:
cmp command1[5], 'x'
je decp1p1axjmp
cmp command1[5], 'h'
je decp1p1ahjmp
cmp command1[5], 'l'
je decp1p1aljmp

decp1p1b:
cmp command1[5], 'x'
je decp1p1bxjmp
cmp command1[5], 'h'
je decp1p1bhjmp
cmp command1[5], 'l'
je decp1p1bljmp
cmp command1[5], 'p'
je decp1p1bpjmp

decp1p1c:
cmp command1[5], 'x'
je decp1p1cxjmp
cmp command1[5], 'h'
je decp1p1chjmp
cmp command1[5], 'l'
je decp1p1cljmp

decp1p1d:
cmp command1[5], 'x'
je decp1p1dxjmp
cmp command1[5], 'h'
je decp1p1dhjmp
cmp command1[5], 'l'
je decp1p1dljmp
cmp command1[5], 'i'
je decp1p1dijmp


decp1p1s:
cmp command1[5], 'i'
je decp1p1sijmp
cmp command1[5], 'p'
je decp1p1spjmp

jmp decp1skipfuncwithpenalty


decp1p1axjmp:
dec [p1ax]
jmp decp1skipfunc
decp1p1ahjmp:
dec p1ah
jmp decp1skipfunc
decp1p1aljmp:
dec p1al
jmp decp1skipfunc

decp1p1bxjmp:
dec [p1bx]
jmp decp1skipfunc
decp1p1bhjmp:
dec p1bh
jmp decp1skipfunc
decp1p1bljmp:
dec p1bl
jmp decp1skipfunc
decp1p1bpjmp:
dec [p1bp];
jmp decp1skipfunc

decp1p1cxjmp:
dec [p1cx]
jmp decp1skipfunc
decp1p1chjmp:
dec p1ch
jmp decp1skipfunc
decp1p1cljmp:
dec p1cl;
jmp decp1skipfunc

decp1p1dxjmp:
dec [p1dx];
jmp decp1skipfunc
decp1p1dhjmp:
dec p1dh;
jmp decp1skipfunc
decp1p1dljmp:
dec p1dl;
jmp decp1skipfunc
decp1p1dijmp:
dec [p1di];
jmp decp1skipfunc


decp1p1sijmp:
dec [p1si];
jmp decp1skipfunc
decp1p1spjmp:
dec [p1sp];
jmp decp1skipfunc

decp1decvars:
cmp command1[6], ']'
jne decp1skipfuncwithpenalty

cmp command1[5], '0'
je decp1decvar0
cmp command1[5], '1'
je decp1decvar1
cmp command1[5], '2'
je decp1decvar2
cmp command1[5], '3'
je decp1decvar3
cmp command1[5], '4'
je decp1decvar4
cmp command1[5], '5'
je decp1decvar5
cmp command1[5], '6'
je decp1decvar6
cmp command1[5], '7'
je decp1decvar7
cmp command1[5], '8'
je decp1decvar8
cmp command1[5], '9'
je decp1decvar9
cmp command1[5], 'a'
je decp1decvara
cmp command1[5], 'b'
je decp1decvarb
cmp command1[5], 'c'
je decp1decvarc
cmp command1[5], 'd'
je decp1decvard
cmp command1[5], 'e'
je decp1decvare
cmp command1[5], 'f'
je decp1decvarf

jmp decp1skipfuncwithpenalty

decp1decvar0:
dec p10
jmp decp1skipfunc

decp1decvar1:
dec p11
jmp decp1skipfunc

decp1decvar2:
dec p12
jmp decp1skipfunc

decp1decvar3:
dec p13
jmp decp1skipfunc

decp1decvar4:
dec p14
jmp decp1skipfunc

decp1decvar5:
dec p15
jmp decp1skipfunc

decp1decvar6:
dec p16
jmp decp1skipfunc

decp1decvar7:
dec p17
jmp decp1skipfunc

decp1decvar8:
dec p18
jmp decp1skipfunc

decp1decvar9:
dec p19
jmp decp1skipfunc

decp1decvara:
dec p1a
jmp decp1skipfunc

decp1decvarb:
dec p1b
jmp decp1skipfunc

decp1decvarc:
dec p1c
jmp decp1skipfunc

decp1decvard:
dec p1d
jmp decp1skipfunc

decp1decvare:
dec p1e
jmp decp1skipfunc

decp1decvarf:
dec p1f
jmp decp1skipfunc

decp1skipfuncwithpenalty:
dec pgpoint
decp1skipfunc:


ret
decp1 ENDP

pushp1 proc near
;stack index must be word
push bx  
mov bx, p1stackindex
push ax
cmp p1stackindex, 0
jbe pushp1skipfuncwithpenalty

cmp command1[0], 'p'
jne pushp1skipfunc
cmp command1[1], 'u'
jne pushp1skipfunc
cmp command1[2], 's'
jne pushp1skipfunc
cmp command1[3], 'h'
jne pushp1skipfunc
cmp command1[4], ' '
jne pushp1skipfuncwithpenalty


cmp command1[5], 'a'
je pushp1p1a
cmp command1[5], 'b'
je pushp1p1b
cmp command1[5], 'c'
je pushp1p1c
cmp command1[5], 'd'
je pushp1p1dd
cmp command1[5], 's'
je pushp1p1ss



jmp pushp1skipfuncwithpenalty

pushp1p1ss:
cmp command1[6], 'i'
je pushp1p1sij

cmp command1[6], 'p'
je pushp1p1spj

jmp pushp1skipfuncwithpenalty

pushp1p1dd:
cmp command1[6], 'i'
je pushp1p1dij

cmp command1[6], 'p'
je pushp1p1bpj

cmp command1[6], 'd'
je pushp1p1dx

jmp pushp1skipfuncwithpenalty


pushp1p1a:
cmp command1[6], 'x'
jne pushp1skipfuncwithpenalty
mov ax,[p1ax]
mov p1stack[bx],ah
dec bx
mov p1stack[bx],al
dec bx
jmp pushp1skipfunc

pushp1p1b:
cmp command1[6], 'x'
jne pushp1skipfuncwithpenalty
mov ax,[p1bx]
mov p1stack[bx],ah
dec bx
mov p1stack[bx],al
dec bx
jmp pushp1skipfunc

pushp1p1c:
cmp command1[6], 'x'
jne pushp1skipfuncwithpenalty
mov ax,[p1cx]
mov p1stack[bx],ah
dec bx
mov p1stack[bx],al
dec bx
jmp pushp1skipfunc

pushp1p1dx:
cmp command1[6], 'x'
jne pushp1skipfuncwithpenalty
mov ax,[p1dx]
mov p1stack[bx],ah
dec bx
mov p1stack[bx],al
dec bx
jmp pushp1skipfunc


jmp pushp1skipfuncwithpenalty



pushp1p1sij:
mov ax,[p1si]
mov p1stack[bx],ah
dec bx
mov p1stack[bx],al
dec bx

jmp pushp1skipfunc

pushp1p1dij:

mov ax,[p1di]
mov p1stack[bx],ah
dec bx
mov p1stack[bx],al
dec bx
jmp pushp1skipfunc

pushp1p1bpj:
mov ax,[p1bp]
mov p1stack[bx],ah
dec bx
mov p1stack[bx],al
dec bx
jmp pushp1skipfunc

pushp1p1spj:
mov ax,[p1sp]
mov p1stack[bx],ah
dec bx
mov p1stack[bx],al
dec bx
jmp pushp1skipfunc


pushp1skipfuncwithpenalty:

dec pgpoint

pushp1skipfunc:
mov p1stackindex, bx

cmp bh,00h
je popp1indexskip
mov p1stackindex,0
popp1indexskip:

pop bx
pop ax
ret
pushp1 endp

notp1 proc near

cmp command1[0], 'n'
jne notp1skipfunc
cmp command1[1], 'o'
jne notp1skipfunc
cmp command1[2], 't'
jne notp1skipfunc
cmp command1[3], ' '
jne notp1skipfuncwithpenalty

cmp command1[4], 'a'
je notp1p1a
cmp command1[4], 'b'
je notp1p1b
cmp command1[4], 'c'
je notp1p1c
cmp command1[4], 'd'
je notp1p1d
cmp command1[4], 's'
je notp1p1s
cmp command1[4], '['
je notp1notvars

jmp notp1skipfuncwithpenalty

notp1p1a:
cmp command1[5], 'x'
je notp1p1axjmp
cmp command1[5], 'h'
je notp1p1ahjmp
cmp command1[5], 'l'
je notp1p1aljmp

notp1p1b:
cmp command1[5], 'x'
je notp1p1bxjmp
cmp command1[5], 'h'
je notp1p1bhjmp
cmp command1[5], 'l'
je notp1p1bljmp
cmp command1[5], 'p'
je notp1p1bpjmp

notp1p1c:
cmp command1[5], 'x'
je notp1p1cxjmp
cmp command1[5], 'h'
je notp1p1chjmp
cmp command1[5], 'l'
je notp1p1cljmp

notp1p1d:
cmp command1[5], 'x'
je notp1p1dxjmp
cmp command1[5], 'h'
je notp1p1dhjmp
cmp command1[5], 'l'
je notp1p1dljmp
cmp command1[5], 'i'
je notp1p1dijmp


notp1p1s:
cmp command1[5], 'i'
je notp1p1sijmp
cmp command1[5], 'p'
je notp1p1spjmp

jmp notp1skipfuncwithpenalty


notp1p1axjmp:
not [p1ax]
jmp notp1skipfunc
notp1p1ahjmp:
not p1ah
jmp notp1skipfunc
notp1p1aljmp:
not p1al
jmp notp1skipfunc

notp1p1bxjmp:
not [p1bx]
jmp notp1skipfunc
notp1p1bhjmp:
not p1bh
jmp notp1skipfunc
notp1p1bljmp:
not p1bl
jmp notp1skipfunc
notp1p1bpjmp:
not [p1bp];
jmp notp1skipfunc

notp1p1cxjmp:
not [p1cx]
jmp notp1skipfunc
notp1p1chjmp:
not p1ch
jmp notp1skipfunc
notp1p1cljmp:
not p1cl;
jmp notp1skipfunc

notp1p1dxjmp:
not [p1dx];
jmp notp1skipfunc
notp1p1dhjmp:
not p1dh;
jmp notp1skipfunc
notp1p1dljmp:
not p1dl;
jmp notp1skipfunc
notp1p1dijmp:
not [p1di];
jmp notp1skipfunc


notp1p1sijmp:
not [p1si];
jmp notp1skipfunc
notp1p1spjmp:
not [p1sp];
jmp notp1skipfunc

notp1notvars:
cmp command1[6], ']'
jne notp1skipfuncwithpenalty

cmp command1[5], '0'
je notp1notvar0
cmp command1[5], '1'
je notp1notvar1
cmp command1[5], '2'
je notp1notvar2
cmp command1[5], '3'
je notp1notvar3
cmp command1[5], '4'
je notp1notvar4
cmp command1[5], '5'
je notp1notvar5
cmp command1[5], '6'
je notp1notvar6
cmp command1[5], '7'
je notp1notvar7
cmp command1[5], '8'
je notp1notvar8
cmp command1[5], '9'
je notp1notvar9
cmp command1[5], 'a'
je notp1notvara
cmp command1[5], 'b'
je notp1notvarb
cmp command1[5], 'c'
je notp1notvarc
cmp command1[5], 'd'
je notp1notvard
cmp command1[5], 'e'
je notp1notvare
cmp command1[5], 'f'
je notp1notvarf

jmp notp1skipfuncwithpenalty

notp1notvar0:
not p10
jmp notp1skipfunc

notp1notvar1:
not p11
jmp notp1skipfunc

notp1notvar2:
not p12
jmp notp1skipfunc

notp1notvar3:
not p13
jmp notp1skipfunc

notp1notvar4:
not p14
jmp notp1skipfunc

notp1notvar5:
not p15
jmp notp1skipfunc

notp1notvar6:
not p16
jmp notp1skipfunc

notp1notvar7:
not p17
jmp notp1skipfunc

notp1notvar8:
not p18
jmp notp1skipfunc

notp1notvar9:
not p19
jmp notp1skipfunc

notp1notvara:
not p1a
jmp notp1skipfunc

notp1notvarb:
not p1b
jmp notp1skipfunc

notp1notvarc:
not p1c
jmp notp1skipfunc

notp1notvard:
not p1d
jmp notp1skipfunc

notp1notvare:
not p1e
jmp notp1skipfunc

notp1notvarf:
not p1f
jmp notp1skipfunc

notp1skipfuncwithpenalty:
dec pgpoint
notp1skipfunc:


ret
notp1 ENDP
cmcp proc near
     lea si, s
    mov bx,[si]
    cmp bl,'c'
    jne CMCERR
    inc si
    mov bx,[si]
    cmp bl, 'm' 
    jne CMCERR
    inc si
    mov bx,[si]
    cmp bl, 'c' 
    jne CMCERR
    mov al, p1carry
    cmp al,0
    je ZEROO
    cmp al,1
    je ONE
   
   
ZEROO:
mov p1carry,1
jmp exit
ONE:
mov p1carry,0
jmp exit


CMCERR:
mov  dl, 1



exit:
ret
cmcp endp



nopp proc near

lea si, s
    mov bx,[si]
    cmp bl,'n'
    je Nstate
    mov  dl, 1
    jmp exit
    
    
    
   Nstate: 
   inc si 
   inc si
   mov bx,[si]
   cmp bl, 'p' 
   je exitNOP
   mov  dl, 1
   
exitNOP:



ret
    
nopp ENDP

setcarryp1 proc near
    
cmp command1[0],'s'
jne setcarryp1skipfunc
cmp command1[1],'t'
jne setcarryp1skipfunc
cmp command1[2],'c'
jne setcarryp1skipfunc
mov p1carry,1
setcarryp1skipfunc:  
ret  
setcarryp1 endp

clearcarryp1 proc near
    
cmp command1[0],'c'
jne clearcarryp1skipfunc
cmp command1[1],'l'
jne clearcarryp1skipfunc
cmp command1[2],'c'
jne clearcarryp1skipfunc
mov p1carry,0
clearcarryp1skipfunc:  
ret  
clearcarryp1 endp

dem PROC  near               
     


cmp comand1[2], 'i' 
je  LblI 
cmp comand1[2], 'd'
jne l3
cmp comand1[3], 'i' 
je  LblDIV 
l3:        
cmp comand1[2] , 'm'
jne done
cmp comand1[3], 'u' 
je  LblMUL
jmp done


LblDIV:
mov ax,p1ax 
mov dx,p1dx 
cmp comand1[6] ,'b' 
jz  DIVB
cmp comand1[6] ,'c' 
jz  DIVCX
cmp comand1[6] ,'d'
jz  DIVD
cmp comand1[6] ,'s'
jz  DIVSI 
jmp LosePoints


DIVB:
cmp comand1[7] ,'x'  
jz DIVBX
cmp comand1[7] ,'p'  
jne  LosePoints 
mov bp,p1bp
cmp bp,0
je LosePoints
div bp
mov p1ax,ax
mov p1dx,dx
jmp done 

DIVBX: 
mov bx,p1bx
cmp bx,0
je LosePoints
div bx
mov p1ax,ax
mov p1dx,dx
jmp done

DIVD:
cmp comand1[7] ,'i' 
jz DIVDI
cmp  comand1[7] ,'x'
jne LosePoints
cmp dx,0
je LosePoints
mov dx,p1dx
div dx
mov p1ax,ax   
mov p1dx,dx   
jmp done  

DIVDI:
mov di,p1di
cmp di,0
je LosePoints
div di
mov p1ax,ax   
mov p1dx,dx   
jmp done 
  


DIVCX:
mov cx,p1cx
cmp cx,0
je LosePoints
div cx
mov p1ax,ax
mov p1dx,dx
jmp done 

DIVSI:
cmp comand1[7] ,'p' 
jz DIVSP
 cmp comand1[7] ,'i'
 jne LosePoints 
 cmp si,0
je LosePoints  
mov si,p1si
div si
mov p1ax,ax
mov p1dx,dx
jmp done 

DIVSP: 
mov sp,p1sp
cmp sp,0
je LosePoints
div sp
mov p1ax,ax
mov p1dx,dx
jmp done 
















LblI:
cmp comand1[3], 'm' 
je LblIMUL
cmp comand1[3], 'd' 
je LblIDIV
jmp done


LblIDIV: 
mov ax,p1ax 
mov dx,p1dx 
cmp comand1[7] ,'b' 
jz  IDIVB
cmp comand1[7] ,'c' 
jz  IDIVCX
cmp comand1[7] ,'d'
jz  IDIVD
cmp comand1[7] ,'s'
jz  IDIVSI 
jmp LosePoints

IDIVB:
cmp comand1[8] ,'x'  
jz IDIVBX
cmp comand1[8] ,'p'
jne LosePoints 
mov bp,p1bp
cmp bp,0
je LosePoints
idiv bp
mov p1ax,ax
mov p1dx,dx
jmp done 

IDIVBX: 
mov bx,p1bx
cmp bx,0
je LosePoints
idiv bx
mov p1ax,ax
mov p1dx,dx
jmp done

IDIVD:
cmp comand1[8] ,'i' 
jz IDIVDI 
cmp comand1[8] ,'x'
jne LosePoints 
mov dx,p1dx
cmp dx,0
je LosePoints
idiv dx
mov p1ax,ax   
mov p1dx,dx   
jmp done  

IDIVDI:
mov di,p1di
cmp di,0
je LosePoints
idiv di
mov p1ax,ax   
mov p1dx,dx   
jmp done 
  
IDIVCX:
mov cx,p1cx
cmp cx,0
je LosePoints
idiv cx
mov p1ax,ax
mov p1dx,dx
jmp done 

IDIVSI:
cmp comand1[8] ,'p' 
jz IDIVSP  
cmp comand1[8] ,'i'
jne LosePoints 
mov si,p1si
cmp si,0
je LosePoints
idiv si
mov p1ax,ax
mov p1dx,dx
jmp done 

IDIVSP: 
mov sp,p1sp
cmp sp,0
je LosePoints
idiv sp
mov p1ax,ax
mov p1dx,dx
jmp done 











LblMUL: 
mov ax,p1ax
mov dx,p1dx  
cmp comand1[6] ,'b' 
jz  MULB
cmp comand1[6] ,'c' 
jz  MULCX
cmp comand1[6] ,'d'
jz  MULD
cmp comand1[6] ,'s'
jz  MULSI 
jmp LosePoints 

MULB:
cmp comand1[7] ,'x'  
jz  MULBX 
cmp comand1[7] ,'p'
jne LosePoints 
mov bp,p1bp
mul bp
mov p1ax,ax
mov p1dx,dx
jmp done 

MULBX: 
mov bx,p1bx
mul bx
mov p1ax,ax
mov p1dx,dx
jmp done

MULD:
cmp comand1[7] ,'i' 
jz  MULDI  
cmp comand1[7] ,'x'
jne LosePoints 
mov dx,p1dx
mul dx
mov p1ax,ax   
mov p1dx,dx   
jmp done  

MULDI:
mov di,p1di
mul di
mov p1ax,ax   
mov p1dx,dx   
jmp done 
  


MULCX:
mov cx,p1cx
mul cx
mov p1ax,ax
mov p1dx,dx
jmp done 

MULSI:
cmp comand1[7] ,'p' 
jz MULSP  
cmp comand1[7] ,'i'
jne LosePoints 
mov si,p1si
mul si
mov p1ax,ax
mov p1dx,dx
jmp done 

MULSP: 
mov SP,p1sp
mul sp
mov p1ax,ax
mov p1dx,dx
jmp done 


LblIMUL: 
mov ax,p1ax 
mov dx,p1dx 
cmp comand1[7] ,'b' 
jz  IMULB
cmp comand1[7] ,'c' 
jz  IMULCX
cmp comand1[7] ,'d'
jz  IMULD
cmp comand1[7] ,'s'
jz  IMULI 

jmp LosePoints

IMULB:
cmp comand1[8] ,'x'  
jz IMULBX 
cmp comand1[8] ,'p'
jne LosePoints 
mov bp,p1bp
imul bp
mov p1ax,ax
mov p1dx,dx
jmp done 

IMULBX: 
mov bx,p1bx
imul bx
mov p1ax,ax
mov p1dx,dx
jmp done

IMULD:
cmp comand1[8] ,'i' 
jz IMULI
cmp comand1[8] ,'x'
jne LosePoints   
mov dx,p1dx
imul dx
mov p1ax,ax   
mov p1dx,dx   
jmp done  

IMULI:
mov di,p1di
imul di
mov p1ax,ax   
mov p1dx,dx   
jmp done 
  
IMULCX:
mov cx,p1cx
imul cx
mov p1ax,ax
mov p1dx,dx
jmp done 

IMULSI:
cmp comand1[8] ,'p' 
jz IMULSP  
cmp comand1[8] ,'i'
jne LosePoints 
mov si,p1si
imul si
mov p1ax,ax
mov p1dx,dx
jmp done 

IMULSP: 
mov sp,p1sp
imul sp
mov p1ax,ax
mov p1dx,dx
jmp done 


LosePoints:
; Put Code for Losing points
dec pgpoint

done:
ret
dem ENDP

popp1 proc near
;BIG ASSUPTION THE p2stack IS BYTEs SIZED and the index is word sized
push ax
push bx
mov bx,p1stackindex
mov al,p1stacksize
dec al
cmp bl, al
jae popp1skipfunc
mov ah,0

cmp command1[0], 'p'
jne popp1skipfunc
cmp command1[1], 'o'
jne popp1skipfunc
cmp command1[2], 'p'
jne popp1skipfunc
cmp command1[3], ' '
jne popp1skipfuncwithpenalty

cmp command1[5], 'h'
je popp1skipfuncwithpenalty
cmp command1[5], 'l'
je popp1skipfuncwithpenalty
cmp command1[4], '['
je popp1skipfuncwithpenalty

cmp command1[4], 'a'
je popp1p1a
cmp command1[4], 'b'
je popp1p1b
cmp command1[4], 'c'
je popp1p1c
cmp command1[4], 'd'
je popp1p1d
cmp command1[4], 's'
je popp1p1s

jmp popp1skipfuncwithpenalty

popp1p1a:
cmp command1[5], 'x'
je popp1p1axjmp

popp1p1b:
cmp command1[5], 'x'
je popp1p1bxjmp

popp1p1c:
cmp command1[5], 'x'
je popp1p1cxjmp
cmp command1[5], 'p'
je popp1p1bpjmp

popp1p1d:
cmp command1[5], 'x'
je popp1p1dxjmp
cmp command1[5], 'i'
je popp1p1dijmp

popp1p1s:
cmp command1[5], 'i'
je popp1p1sijmp
cmp command1[5], 'p'
je popp1p1spjmp


jmp popp1skipfuncwithpenalty


popp1p1axjmp:
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1al, ah
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1ah, ah
jmp popp1skipfunc


popp1p1bxjmp:
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1bl, ah
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1bh, ah
jmp popp1skipfunc


popp1p1cxjmp:
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1cl, ah
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1ch, ah
jmp popp1skipfunc


popp1p1dxjmp:
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1dl, ah
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1dh, ah
jmp popp1skipfunc

popp1p1dijmp:
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1dil, ah
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1dih, ah
jmp popp1skipfunc

popp1p1bpjmp:
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1bpl, ah
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1bph, ah
jmp popp1skipfunc

popp1p1sijmp:
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1sil, ah
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1sih, ah
jmp popp1skipfunc

popp1p1spjmp:
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1spl, ah
inc bx
mov ah, p1stack[bx]
mov p1stack[bx], 0
mov p1sph, ah
jmp popp1skipfunc


popp1skipfuncwithpenalty:
dec pgpoint

popp1skipfunc:
mov p1stackindex, bx
pop bx
pop ax

ret
popp1 ENDp

end pro1