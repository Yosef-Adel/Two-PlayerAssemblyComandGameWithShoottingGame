        
		
		
		
		 EXTRN pgpoint :BYTE
		 
		
		
        PUBLIC PRO2
.MODEL SMALL
.386
.data
Ball_X db 0ah  ; x pos of the ball  
Ball_y db 0ah  ; y pos of the ball  
Ball_Size db 0ah ;ball size
Col db 0fh 

Ball_Velx db 04h
Ball_Vely db 05h 

Time_Aux db 0

gunxobj1pos dw 160
gun1speed dw 2
xgun1width dw 0 
gun1color db 2
lazor1color db 4
gun1buttonright db 4dh
gun1buttonleft db  4bh
gun1buttonshoot db 39h
exitguns db 01h
gunshoothit1 db 0

;p1points db 0


Blue db 0
Red db 0
Green db 0
Yel db 0
LBlue db 0
 
var db 0
var2 db 0



Point_X db 82
.CODE
 pro2 PROC FAR
       MOV AX, @DATA
    MOV DS, AX

    mov ah,0bh
    mov bh,00h
    mov bl,00h
    int 10h   
    mov var2,0
      mov Blue, 0
    mov Red, 0
    mov Green , 0
    mov Yel,0
    mov LBlue, 0
    call Draw_Random 
  

     ret
PRO2 ENDP
DispHitPoits proc near
    mov ah,02
    ;mov dl,Point_x
    mov dh,18
    int 10h
    
    mov ah,02
    mov dl,var     
    add dl,30h
    int 21h
DispHitPoits endp 


Draw_Ball proc near 
 
    ; start delay

mov cx, 0f40h;86A0h
mov dx, 0ffh ;0001h
int 15h
; end delay
   
   mov cl,Ball_x
   mov dl,Ball_y
   mov ch,0
   mov dh,0
   Draw_Ball_Horz:
   mov ah,0ch 
   mov al,Col
   mov bh,00h
   int 10h

   inc cx
   mov ax,cx
   sub al,Ball_X
   cmp al,Ball_Size
   jng Draw_Ball_Horz
   mov cl,Ball_X
   inc dx
   mov ax,dx
   sub al,Ball_Y  
   cmp al,Ball_Size
   jng Draw_Ball_Horz
    
   ret
Draw_Ball endp 

Draw_Random proc near 
 
    Check_Time: ; Func to Check time to do actions 
     mov ah,2ch 
     int 21h ; Ah = 2ch/int 21h to get time return CH= hours ,CL= Minutes ,DH= Seconds, DL=1/100 Seconds
     cmp dl ,Time_Aux ;Id dl == time_Aux so time still the same .. no actions will be taken  
     je Check_Time  ; Check till time pass 
      ; If it is different go and draw ball 
     mov Time_Aux,dl ; Update Time 
     
     mov al ,Ball_Velx
     add Ball_X,al
     ; ----------------- Add black background to remove the tail       
        mov ah,00h
        mov al,13h
        int 10h

        mov ah,0bh
        mov bh,00h
        mov bl,00h
        int 10h
     ; ----------------------------------------------------------
     ; Set ball color 

    mov al ,0bh 
    cmp dl,5h 
    je Col1 
    cmp dl,2 
    je Col1  
    cmp dl,4 
    je Col1  
    cmp dl,0eh
    je Col1
    cmp dl,9h
    je Col1
    jmp Nochnge
    Col1:
     mov Col,dl
     Nochnge:
     

     call Draw_Ball
     push dx
     push cx 
      mov cl,Blue
      mov ch,0
      mov dl,82
      mov var,cl
     call DispHitPoits
     
     mov cl,Red
     mov var,Cl
     mov ch,0
     mov dl,85    
      call DispHitPoits
      
      mov cl,Yel
      mov var,cl
      mov ch,0
      mov dl, 88  
      call DispHitPoits
      
      mov cl,LBlue
      mov var,cl
      mov dl, 91  
      call DispHitPoits
      
      mov cl ,Green  
      mov var,cl
      mov dl, 94  
      call DispHitPoits
      
       pop cx
       pop dx
       mov bl, Ball_y 
       mov al, Ball_x
       mov Cl, Col
       mov ch,0 
       mov bh,0 
       mov ah,0  
       mov dh,0 
       mov dl, Ball_Size
       push ax 
       push bx 
       push cx
       push dx 
       mov Ball_Size,16h
       
       
       mov Ball_y,160
       
       mov Ball_X ,10
       mov Col, 1 
       call Draw_Ball  ; Draw Blue Ball 
       
       
       mov Ball_X ,35
       mov Col, 4 
       call Draw_Ball  ; Draw Red Ball 
       
       
       mov Ball_X ,60
       mov Col, 0eh 
       call Draw_Ball  ; Draw Yellow Ball
       
       
       mov Ball_X ,85
       mov Col, 9 
       call Draw_Ball  ; Draw Light Blue Ball  
       
       
       mov Ball_X ,110
       mov Col, 2 
       call Draw_Ball  ; Draw Green Ball
       pop dx 
       pop cx
       pop bx
       pop ax  
       
       mov Ball_x,al
       mov Ball_y,bl  
       mov Col,Cl 
       mov Ball_Size,dl
     
     call gunmoveandshoot
       
       
       
       
       
       cmp Ball_X,250
       ja GetOut 
    
       
     jmp  Check_Time
    ret          
    GetOut:
    inc var2
    cmp var2,3
    jae GetOut2
    jmp  Check_Time
    ret 
    GetOut2: 
    mov var2,0
    ret
    Draw_Random endp 

gunmoveandshoot proc near

call drawgun

movegun:       

mov ah, 1   ; peek
int 16h
jz  gunnokey
mov ah, 0   ; get
int 16h
gunnokey:

cmp ah, gun1buttonright
je gunmovementright

cmp ah, gun1buttonleft  
je gunmovementleft

cmp ah, gun1buttonshoot 
je gunshoot


;cmp ah, exitguns 
;je removeguncontrol ;;control should be put outside not here

jmp gunmovement

gunmovementright:
mov bx, gun1speed
add gunxobj1pos,bx
jmp gunmovement

gunmovementleft:
mov bx, gun1speed
sub gunxobj1pos,bx
jmp gunmovement


gunmovement:


call drawgun

jmp removeguncontrol

gunshoot:
call drawgunlazor
     push bx
     push cx 
     push dx
     mov dl,Ball_X
     mov cl,Ball_X
     add cl, Ball_Size
     mov ch,0
     mov dh,0 
     mov bx ,gunxobj1pos
     add bx,3
     
     cmp bx,dx
     jna Continue
     cmp bx,cx
     jnb Continue
       
     Cmp Col,4
     je IncRed
     cmp Col,2 
      je IncGn
     Cmp Col,1
     je IncBl
     Cmp Col,9          
     je IncLBl
     cmp Col,0eh
     je IncYel 
        
      
     IncYel:
     inc Yel
	 add pgpoint,1
     jmp Continue 
     
     IncLBl:
     Inc LBlue
	 add pgpoint,2
     jmp Continue
     
     IncBl: 
     inc Blue
	 add pgpoint,3
     jmp Continue
     
     IncGn:
	 add pgpoint,4
     inc Green
     
     
     IncRed:
     inc Red
	 add pgpoint,5
     jmp Continue 
     
     
       Continue:
      pop dx
      pop cx 
      pop bx
     
  mov ah,0         
mov al, Ball_x
cmp gunxobj1pos, ax    ;;;;;;;;;;repeat those 2 lines here for all flying position objects
jne gunshootmiss1

mov gunshoothit1, 1

gunshootmiss1:

; start delay

mov cx, 0D40h;86A0h
mov dx, 0003h ;0001h
int 15h
; end delay

;jmp movegun

removeguncontrol:


hlt
ret
               
gunmoveandshoot endp
drawgun proc near

                mov bx,gunxobj1pos
                add bx,6            ;change the number here to adjust the width!!  
                
                mov  cx,gunxobj1pos
                drawsquareflyingobj11:
                                   ;vertivalll ine 
                mov  dx,190
                mov  al,gun1color
                mov  ah,0ch	 

                vertcalline11:       
    
                int  10h
                inc  dx
                cmp  dx,200
                jbe  vertcalline11   
                
                inc cx 
                cmp cx,bx
                jbe drawsquareflyingobj11
                
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                mov bx,gunxobj1pos
                add bx,4            ;change the number here to adjust the width!!  
                
                mov  cx,gunxobj1pos
                add cx,2
                drawsquareflyingobj22:
                                   ;vertivalll ine 
                mov  dx,180
                mov  al,gun1color
                mov  ah,0ch	 

                vertcalline22:       
    
                int  10h
                inc  dx
                cmp  dx,185
                jbe  vertcalline22   
                
                inc cx 
                cmp cx,bx
                jbe drawsquareflyingobj22
                ;;;;;;;;;;;;;;;;;;;;;;;
                
                ret

drawgun endp

drawgunlazor proc 
                mov cx,3
                add cx, gunxobj1pos
                                  ;vertivalll ine 
                mov  dx,0
                mov  al,lazor1color
                mov  ah,0ch	 
                
                lazorvertcalline:       
                
                int  10h
                inc  dx
                cmp  dx,200
                jbe  lazorvertcalline   
                
                  
            
ret
drawgunlazor endp
 

END PRO2