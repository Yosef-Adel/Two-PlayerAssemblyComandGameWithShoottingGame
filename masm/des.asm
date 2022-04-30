
 EXTRN pro3:FAR
 EXTRN pro4:FAR
 EXTRN pro1:FAR
 EXTRN pro2:FAR
 EXTRN pro5:FAR
 EXTRN pro6:FAR
 PUBLIC p1ax, p1bx, p1cx,p1dx,p1si,p1di,p1sp,p1bp,p1ah, p1al, p1bh, p1bl,p1ch, p1cl, p1dh, p1dl,p1sil,p1sih,p1dih,p1dil,p1sph,p1spl,p1bpl,p1bph,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p1a,p1b,p1c,p1d,p1e,p1f,command1,p1stacksize,p1stackindex,p1stack
 PUBLIC p2ax, p2bx, p2cx,p2dx,p2si,p2di,p2sp,p2bp,p2ah, p2al, p2bh, p2bl,p2ch, p2cl, p2dh, p2dl,p2sil,p2sih,p2dih,p2dil,p2sph,p2spl,p2bpl,p2bph,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p2a,p2b,p2c,p2d,p2e,p2f,command2,p2stacksize,p2stackindex,p2stack
 PUBLIC p3ax, p3bx, p3cx,p3dx,p3si,p3di,p3sp,p3bp,p3ah, p3al, p3bh, p3bl,p3ch, p3cl, p3dh, p3dl,p3sil,p3sih,p3dih,p3dil,p3sph,p3spl,p3bpl,p3bph,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p3a,p3b,p3c,p3d,p3e,p3f,p3stacksize,p3stackindex,p3stack
 PUBLIC p1name,p1point,p2name,p2point,comand1,s,preventingchar1,preventingchar2,p1carry,p2carry,p3carry,level,pgpoint,endornot,winvalue
.MODEL SMALL
.386
.STACK 100H
.DATA
  
  ;;;;ram1
  p10 db 0
 p11 db ?
   p12 db 00
   p13 db 00
   p14 db 00
   p15 db 00
   p16 db ?
   p17 db ?
   p18 db ?
   p19 db ?
   p1a db ?
   p1b db ?
   p1c db ?
   p1d db ?
   p1e db ?
   p1f db ?
  ;;;ram2
   p20 db 0
   p21 db 06h
   p22 db ?
   p23 db ?
   p24 db ?
   p25 db ?
   p26 db ?
   p27 db ?
   p28 db ?
   p29 db ?
   p2a db ?
   p2b db 05h
   p2c db 0ch
   p2d db 0dh
   p2e db 8h
   p2f db 00
  ;;;
  
  p30 db 0
   p31 db 06h
   p32 db ?
   p33 db ?
   p34 db ?
   p35 db ?
   p36 db ?
   p37 db ?
   p38 db ?
   p39 db ?
   p3a db ?
   p3b db 05h
   p3c db 0ch
   p3d db 0dh
   p3e db 8h
   p3f db 00

  ;;;
         p1ax Label Word
  p1al   Db   34h
  p1ah   db   12h
         p1bx Label Word
  p1bl   Db   78h
  p1bh   db   56h
         p1cx Label Word
  p1cl   Db   0h
  p1ch   db   00h
         p1dx Label Word
  p1dl   Db   0h
  p1dh   db   0h

  p1di Label Word
  p1dil   Db   0h
  p1dih   db   0h

  p1sp Label Word
  p1spl   Db   0h
  p1sph   db   0h

  p1bp Label Word
  p1bpl   Db   0h
  p1bph   db   0h

  p1si Label Word
  p1sil   Db   0h
  p1sih   db   0h


  p3ax Label Word
  p3al   Db   55h
  p3ah   db   66h
         p3bx Label Word
  p3bl   Db   78h
  p3bh   db   56h
         p3cx Label Word
  p3cl   Db   0h
  p3ch   db   00h
         p3dx Label Word
  p3dl   Db   0h
  p3dh   db   0h

  p3di Label Word
  p3dil   Db   0h
  p3dih   db   0h

  p3sp Label Word
  p3spl   Db   0h
  p3sph   db   0h

  p3bp Label Word
  p3bpl   Db   0h
  p3bph   db   0h

  p3si Label Word
  p3sil   Db   0h
  p3sih   db   0h

  p1stackindex dw 9
  p1stacksize db 10
  p1stack db  30,?,30 dup('$')

  p2stackindex dw 9
  p2stacksize db 10
  p2stack db  30,?,30 dup('$')

  p3stackindex dw 9
  p3stacksize db 10
  p3stack db  30,?,30 dup('$')
           
           

         p2ax Label Word
  p2al   Db   5h
  p2ah   db   0h

  
         p2bx Label Word
  p2bl   Db   0h
  p2bh   db   0h
         p2cx Label Word
  p2cl   Db   0h
  p2ch   db   00h
         p2dx Label Word
  p2dl   Db   0h
  p2dh   db   0h


  p2di Label Word
  p2dil   Db   0h
  p2dih   db   0h

  p2sp Label Word
  p2spl   Db   0h
  p2sph   db   0h

  p2bp Label Word
  p2bpl   Db   0h
  p2bph   db   0h

  p2si Label Word
  p2sil   Db   0h
  p2sih   db   0h
   winvalueenter db   10,?,10 dup('$')
   comand1 db   30,?,30 dup('$')
  comand2 db   30,?,30 dup('$')
  p1name db    30,?,30 dup('$')
  p1point db    30,?,30 dup('$')
  s db    30,?,30 dup('$')
  p2point db    30,?,30 dup('$')
  pgpoint db ?
  p2name db    30,?,30 dup('$')
  command2 db   30,?,30 dup('$')
  command1 db   30,?,30 dup('$')
  preventingchar1 db '5','$'
  prevdone1 db 0
  cleardone1 db 0
   preventingchar2 db '7','$'
   prevdone2 db 0
  cleardone2 db 0
  changewinningkeydone1 db 0
  changewinningkeydone2 db 0
   regname dd   "bx ",'$'


  lpart  db   ?
  ramcounter db 0
  ramccouner db 48
  rampos db 0
  entername db "enter your name",'$' 
  startsctext db "press any key to continue",'$' 
  enterpoint db "enter your point",'$'  
  texpoint1 db "p1 points: ",'$' 
  texpoint2 db "p2 points: ",'$'  

 maintxt1 db "To start chatting press F1",'$' 
 maintxt2 db "To start the game press F2",'$' 
 maintxt3 db "To end the program press ESC",'$'
 carrytxt db "c: "
 forbiddentxt db "FOR:",'$'
 winname db "the win player :",'$'
 wtxt db "WV:",'$'
 adress dw ?
 pwin db ? ; player win
 p1carry db 00h
 p2carry db 00h
 p3carry db 00h
  level db  ?
  winvalue dw 10eh
  anotherwinvalue dw 10eh ;;use when change winning value
  endornot dw 0


.CODE

MAIN PROC far
    
                MOV  AX, @DATA
                MOV  DS, AX
                mov es,ax
               
                 
                 
                mov  ah, 0    ;change to video mode 
                mov  al, 13h
                int  10h
                 
                  
                 mailop: 
                call setreg_tozero_p2
                call setreg_tozero_p1
                call setram_tozero_p1
                call setram_tozero_p2
                call pro3
                mov pwin,0
           
               call drew

               gamelop1:
                call check_win
                cmp dl,0
                je nowin1
                call endgame
                mov bx,5
                delay:              ;;;;;delay 5 sec
                dec bx
                mov cx,0fh
                mov dx,4240h
                mov ah,86h
                int 15h
                cmp bx,0
                jne delay
                mov endornot,1
                  
                jmp mailop
                nowin1: 
                call chekgame
                cmp dl,4
                jne turn
                mov al,p1point
                mov pgpoint, al
                call pro2
                mov al,pgpoint
                mov p1point, al
                call drew
                turn:
              mov ah,0
               int 16h
              mov endornot,1
               cmp ah,3Eh ;;;;;;;for exit  f4
               je mailop
               cmp al,'p'
               je powerlop1
               cmp al,'c'
               je cmandlop1

               
               jmp gamelop1;;;;;;;;;;;;;for player2


              powerlop1:
                
                mov ah,7
               int 21h
               cmp al,'1'
               je power11
               cmp al,'2'
               je power12
               cmp al,'3'
               je power13
               cmp al,'4'
               je power14
               cmp al,'5'
               je power15
               
               
            jmp gamelop1

              power11:
                 cmp p1point,8
               jb gamelop1
               cmp prevdone1,1
               je gamelop1
               mov ah,7
               int 21h
               mov preventingchar2,al
                sub p1point,8
                mov prevdone1,1
                call printpoint
                call printforbidden2

              jmp gamelop1

              power12:            ;;;;;;;run command player1 on own alu
                cmp p1point,5
               jb gamelop1
                call getcommand1
               call fors
               cmp bl,0
               je declop
               mov al,p1point
                mov pgpoint,al 
               call change_to_p21
               call pro1
               call pro4
               call pro6
               call pro5
       
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               call change_to_p12
               mov al,pgpoint
                mov p1point,al 
               sub p1point,5
                call drew

                jmp gamelop2

                power13:         ;;;;;;;;run command player1 on both alu
                  cmp p1point,3
               jb gamelop1
                call getcommand1
               call fors
               cmp bl,0
               je declop
               mov al,p1point
                mov pgpoint,al 
               call change_to_p31
               call pro1
               call pro4
               call pro6
               call pro5
               call change_to_p13
               call change_to_p21
               call pro1
               call pro4
               call pro6
               call pro5
               call change_to_p12
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               mov al,pgpoint
                mov p1point,al 
               sub p1point,3
                call drew

                jmp gamelop2
                 
               power14:
               cmp p1point,30
               jb gamelop1
               cmp  cleardone1,1
               je gamelop1
               call setreg_tozero_p1
               call setreg_tozero_p2
               sub p1point,30
               call drew
               mov cleardone1,1
               jmp gamelop1


                power15:                     ;;;;;;;;chage the target value
               cmp p1point,25
               jb gamelop1
               mov bl,level
               cmp bl,'2'
               jne gamelop2
               cmp  changewinningkeydone1,1
               je gamelop1
               call getwinningkey
               call checkforwinningkey
               cmp bl,0
               jne gamelop1
               mov ax,anotherwinvalue
               mov winvalue,ax
               sub p1point,25
               call drew
               mov changewinningkeydone1,1
               jmp gamelop1
                  

               gamelop2:
                call check_win
                cmp dl,0
                je nowin
                call endgame
                 mov bx,5
                delay2:
                dec bx
                mov cx,0fh
                mov dx,4240h
                mov ah,86h
                int 15h
                cmp bx,0
                jne delay2
                mov endornot,1

                jmp mailop
                nowin: 
                call chekgame
                cmp dl,4
                jne turn2
                mov al,p2point
                mov pgpoint, al
                call pro2
                mov al,pgpoint
                mov p2point, al
                call drew
                turn2:
               mov ah,0
               int 16h
               cmp ah,71
               je mailop
               cmp al,'p'
               je powerlop2
               cmp al,'c'
               je cmandlop2
               jmp gamelop2

               powerlop2:           ;;;;;;;;;;;power for player 2
                
               mov ah,7
               int 21h
               cmp al,'1'
               je power21
               cmp al,'2'
               je power22
               cmp al,'3'
               je power23
               cmp al,'4'
               je power24
               cmp al,'5'
               je power25
               jmp gamelop2

               power21:
               cmp p2point,8
               jb gamelop2
               cmp prevdone2,1
               je gamelop2
               mov ah,7
               int 21h
               mov preventingchar1,al
                sub p2point,8
                mov prevdone2,1
                call printpoint
                call printforbidden1

               jmp gamelop1


               power22:            ;;;;;;;run command player2 on own alu
                cmp p2point,5
               jb gamelop2
                call getcommand2
               call fors
               cmp bl,0
               je declop2
                mov al,p2point
                  mov pgpoint,al 
               call change_to_p31
               call pro1
               call pro4
               call pro6
               call pro5
       
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               call change_to_p13
                sub pgpoint,5
                  mov al,p2point
                  mov pgpoint,al 
                call drew

                jmp gamelop1

                power23:         ;;;;;;;;run command player2 on both alu
                cmp p2point,3
               jb gamelop2
                call getcommand2
               call fors
               cmp bl,0
               je declop2
                mov al,p2point
               mov pgpoint,al 
               call change_to_p31
               call pro1
               call pro4
               call pro6
               call pro5
               call change_to_p13
               call change_to_p21
               call pro1
               call pro4
               call pro6
               call pro5
               call change_to_p12
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               mov al,pgpoint
                mov p2point,al 
                sub p2point,3
                 
                call drew

                jmp gamelop1


               power24:
               cmp p2point,30
               jb gamelop2
               cmp  cleardone2,1
               je gamelop1
               call setreg_tozero_p1
               call setreg_tozero_p2
               sub p2point,30
               call drew
               mov cleardone2,1
               jmp gamelop2


               power25:                     ;;;;;;;;chage the target value
               cmp p2point,25
               jb gamelop2
               mov bl,level
               cmp bl,'2'
               jne gamelop2
               cmp  changewinningkeydone2,1
               je gamelop2
               call getwinningkey
               call checkforwinningkey
               cmp bl,0
               jne gamelop2
               mov ax,anotherwinvalue
               mov winvalue,ax
               sub p2point,25
               call drew
               mov changewinningkeydone2,1
               jmp gamelop2


               cmandlop1:                       ;; command for player1
               call getcommand1
               cmp bl,0
               je declop
               call fors
               
               mov bl,level
               cmp bl,'2'
               je cmandlop1forlevel2
              call change_to_p31
               mov al,p1point
                  mov pgpoint,al 
               call pro1
               call pro4
               call pro6
               call pro5
       
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               call change_to_p13
                mov al,pgpoint
                  mov p1point,al 
                call drew
               
               jmp gamelop2     ;;;;;;to go back to p2 game
               declop:
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
                jmp gamelop2
                   
                 cmandlop1forlevel2:
                  
                  mov al,p1point
                  mov pgpoint,al
                  mov ah,7
                  int 21h
                  cmp al,'2'
                  je alu1       ;;;;;lop that make command work on other player alu 
                  call change_to_p21
                 call pro1
               call pro4
               call pro6
               call pro5
       
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               call change_to_p12
               mov al,pgpoint
                  mov p1point,al
                call drew
                jmp gamelop2
                alu1:
                call change_to_p31
                 call pro1
               call pro4
               call pro6
               call pro5
       
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               call change_to_p13
               mov al,pgpoint
                mov p1point,al
                call drew


                jmp gamelop2






                cmandlop2:      ;;;;;;;;;;;;;;;;;;;;for player 2
               

               call getcommand2
               cmp bl,0
               je declop2
               call fors
               mov bl,level
               cmp bl,'2'
               je cmandlop2forlevel2
                call change_to_p21
                mov al,p2point
                mov pgpoint,al
               call pro1
               call pro4
               call pro6
               call pro5
               
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               call change_to_p12
               mov al,pgpoint
                mov p2point,al
                call drew
               
               jmp gamelop1 ;;;;;to go to p1 game


               declop2:
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
                jmp gamelop1


                cmandlop2forlevel2:
                   mov al,p2point
                  mov pgpoint,al 
                  mov ah,7
                  int 21h
                  cmp al,'2'
                  je alu2 
                      ;;;;;lop that make command work on other player alu 
                  call change_to_p31
                 call pro1
                  call pro4
                  call pro6
                  call pro5
       
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               call change_to_p13
               mov al,pgpoint
               mov p2point,al
                call drew

                jmp gamelop1
                alu2:
                call change_to_p21
                mov al,p2point
                 mov pgpoint,al
                 call pro1
               call pro4
               call pro6
               call pro5
       
               lea si,  command1
               call change
               lea si,  comand1
               call change
               lea si,  s
               call change
               call change_to_p12
               mov al,pgpoint
                mov p2point,al
                call drew


                jmp gamelop1




                
                 
  final:        
              
               ;hlt
                ret

MAIN ENDP

chekgame proc near
  
   getrand:
   MOV AH, 2ch          
   INT 21H        ;;;get clock and ranom variable in dl
   MOV BH, 10    
   MOV AH, DL  
   CMP AH, BH    
   JA getrand ; if not not less than 10
   
   ret
chekgame endp
getwinningkey proc near
  

                mov ah,2       ;;;;move curser
                 mov  dl,1
                mov  dh,0
                mov  bh,0
                int  10h
                
                

                mov ah,10;;;;;;;;;get winning key
                mov dx,offset winvalueenter
                int 21h 
                mov cl,winvalueenter[1]
                cmp cl,4
                jb skip
                lea bx,winvalueenter
                mov cl,[bx+5]
                sub cl,30h
                mov ah,0
                mov al,[bx+4]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov ch,cl

                mov cl,[bx+3]
                sub cl,30h
                mov ah,0
                mov al,[bx+2]
                sub al,30h
                mov dl,10h
                mul dl
                add cl,al
                mov dl,ch
                mov dh,cl
                mov anotherwinvalue,dx
              skip:
                 mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,1
               mov ch,0
               mov dl,5
               mov dh,0
               int 10h 
               call printwinvalue
                  
               


              
  ret
getwinningkey endp
checkforwinningkey proc ;;;;;;;;;;for not continue put v after every number 

 
 mov bx,anotherwinvalue

 cmp p2ax,bx
 je equal
 
 cmp p2bx,bx
 je equal
 cmp p2cx,bx
 je equal
 cmp p2dx,bx
 je equal

 cmp p2si,bx
 je equal
 cmp p2di,bx
 je equal
 cmp p2sp,bx
 je equal
 cmp p2bp,bx
 je equal
 cmp p3ax,bx
 je equal
 cmp p3bx,bx
 je equal
 cmp p3cx,bx
 je equal
 cmp p3dx,bx
 je equal

 cmp p3si,bx
 je equal
 cmp p2di,bx
 je equal
 cmp p3sp,bx
 je equal
 cmp p3bp,bx
 je equal


 mov bl,0
 ret
equal:
 mov bl,1
 ret
checkforwinningkey endp
endgame proc near
               mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h

                mov  ah,2             ;;;move curser
                mov  dl,5
                mov  dh,10
                mov  bh,0
                int  10h
                mov dx,offset texpoint1 ;;;print text p1 points
               mov ah,9
               int 21h
               mov al,p1point
               call printdec1byte
               

               mov  ah,2             ;;;move curser
                mov  dl,25
                mov  dh,10
                mov  bh,0
                int  10h


                mov dx,offset texpoint2 ;;;print text p2 points
               mov ah,9
               int 21h
               mov al,p2point
               call printdec1byte


               mov  ah,2             ;;;move curser
                mov  dl,15
                mov  dh,5
                mov  bh,0
                int  10h


                mov dx,offset winname ;;;print text p2 points
               mov ah,9
               int 21h
               mov dl,pwin
               cmp dl,2
               jne p2namelop
               mov dx,offset p1name+2 ;;;print text p2 points
               mov ah,9
               int 21h
               ret
               p2namelop:
               mov dx,offset p2name+2 ;;;print text p2 points
               mov ah,9
               int 21h

 
 ret


endgame endp

check_win proc near
 mov al,p1point
 cmp al,0
 jbe p3win
 mov al,p2point
 cmp al,0
 jbe p2win

 mov ax,winvalue
 mov bx,p2ax
 cmp ax,bx
 je p3win
 mov bx,p2bx
 cmp ax,bx
 je p3win
 mov bx,p2cx
 cmp ax,bx
 je p3win
 mov bx,p2dx
 cmp ax,bx
 je p3win
 mov bx,p2si
 cmp ax,bx
 je p3win
 mov bx,p2di
 cmp ax,bx
 je p3win
 mov bx,p2sp
 cmp ax,bx
 je p3win
 mov bx,p2bp
 cmp ax,bx
 je p3win


 mov bx,p3ax
 cmp ax,bx
 je p2win
 mov bx,p3bx
 cmp ax,bx
 je p2win
 mov bx,p3cx
 cmp ax,bx
 je p2win
 mov bx,p3dx
 cmp ax,bx
 je p2win
 mov bx,p3si
 cmp ax,bx
 je p2win
 mov bx,p3di
 cmp ax,bx
 je p2win
 mov bx,p3sp
 cmp ax,bx
 je p2win
 mov bx,p3bp
 cmp ax,bx
 je p2win

 mov dl,0
 
 ret
 p3win:

 mov dl,3
 mov pwin,3
 ret
 p2win:
 mov dl,2
 mov pwin,2
 ret
  
  
check_win endp

change_to_p21 proc near 

mov ax,p2ax
mov p1ax,ax
mov ax,p2bx
mov p1bx,ax
mov ax,p2cx
mov p1cx,ax
mov ax,p2dx
mov p1dx,ax
mov ax,p2si
mov p1si,ax
mov ax,p2di
mov p1di,ax
mov ax,p2sp
mov p1sp,ax
mov ax,p2bp
mov p1bp,ax
mov al,p21
mov p11,al
mov al,p20
mov p10,al
mov al,p22
mov p12,al
mov al,p23
mov p13,al
mov al,p24
mov p14,al
mov al,p25
mov p15,al
mov al,p26
mov p16,al
mov al,p27
mov p17,al
mov al,p28
mov p18,al
mov al,p29
mov p19,al
mov al,p2a
mov p1a,al
mov al,p2b
mov p1b,al
mov al,p2c
mov p1c,al
mov al,p2d
mov p1d,al
mov al,p2e
mov p1e,al
mov al,p2f
mov p1f,al
mov al,p2carry
mov p1carry,al


mov al,p2stacksize
mov p1stacksize,al
mov ax,p2stackindex
mov p1stackindex,ax
mov bx,0
mov cl,10
stacklop:
mov al,p2stack[bx]
mov p1stack[bx],al
dec cl
inc bx
cmp cl,0
jnz stacklop


ret
change_to_p21 endp

change_to_p31 proc near 

mov ax,p3ax
mov p1ax,ax
mov ax,p3bx
mov p1bx,ax
mov ax,p2cx
mov p1cx,ax
mov ax,p3dx
mov p1dx,ax
mov ax,p3si
mov p1si,ax
mov ax,p3di
mov p1di,ax
mov ax,p3sp
mov p1sp,ax
mov ax,p3bp
mov p1bp,ax
mov al,p31
mov p11,al
mov al,p30
mov p10,al
mov al,p32
mov p12,al
mov al,p33
mov p13,al
mov al,p34
mov p14,al
mov al,p35
mov p15,al
mov al,p36
mov p16,al
mov al,p37
mov p17,al
mov al,p38
mov p18,al
mov al,p39
mov p19,al
mov al,p3a
mov p1a,al
mov al,p3b
mov p1b,al
mov al,p3c
mov p1c,al
mov al,p3d
mov p1d,al
mov al,p3e
mov p1e,al
mov al,p3f
mov p1f,al
mov al,p3carry
mov p1carry,al


mov al,p3stacksize
mov p1stacksize,al
mov ax,p3stackindex
mov p1stackindex,ax
mov bx,0
mov cl,11
stacklop2:
mov al,p3stack[bx]
mov p1stack[bx],al
dec cl
inc bx
cmp cl,0
jnz stacklop2


ret
change_to_p31 endp

fors proc near
 mov ax,0
    mov ch,56                     ;;;;;;;;;;for not continue put v after every number 
    lea si, s
    lea di ,comand1  
    mov cl,[di+1]          
    mov bx,0
    lop: 
    mov dl,[di+bx+2]
    cmp dl,48
    jb lop2
    cmp dl,71
    ja lop2 
    cmp ch,2
    je lop2
    mov ch,2
    mov al,'v' 
      mov [si+bx],al
      inc si
    
    lop2:
      mov [si+bx],dl
      inc bx
      cmp bl,cl
      jne lop
 ret
fors endp

setreg_tozero_p1 proc near;;;;;;;set rgester to zero
 
 mov p2ax,0
 mov p2bx,0
 mov p2cx,0
 mov p2dx,0
 mov p2si,0
 mov p2di,0
 mov p2sp,0
 mov p2bp,0
 ret
setreg_tozero_p1 endp

setreg_tozero_p2 proc near;;;;;;;set rgester to zerox
 
 mov p3ax,0
 mov p3bx,0
 mov p3cx,0
 mov p3dx,0
 mov p3si,0
 mov p3di,0
 mov p3sp,0
 mov p3bp,0
 ret
setreg_tozero_p2 endp

setram_tozero_p1 proc near
 
 mov p20,0
 mov p21,0
 mov p22,0
 mov p23,0
 mov p24,0
 mov p25,0
 mov p26,0
 mov p27,0
 mov p28,0
 mov p29,0
 mov p2a,0
 mov p2b,0
 mov p2c,0
 mov p2d,0
 mov p2e,0
 mov p2f,0

 
 
 ret 
setram_tozero_p1 endp

setram_tozero_p2 proc near
 
 mov p30,0
 mov p31,0
 mov p32,0
 mov p33,0
 mov p34,0
 mov p35,0
 mov p36,0
 mov p37,0
 mov p38,0
 mov p39,0
 mov p3a,0
 mov p3b,0
 mov p3c,0
 mov p3d,0
 mov p3e,0
 mov p3f,0

 
 
 ret 
setram_tozero_p2 endp

printcarry1 proc near 
  
  mov ah,13h
 mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset carrytxt
 mov dl,1
 mov dh,1
 mov cx,2
 int 10h

               mov  ah,2             ;;;move curser
                mov  dl,3
                mov  dh,1
                mov  bh,0
                int  10h

                mov  ah,2
                      
                mov  dl,p2carry
                add dl,30h
                int  21h
  
 

 ret
printcarry1 endp

printcarry2 proc near 
  
  mov ah,13h
 mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset carrytxt
 mov dl,21
 mov dh,1
 mov cx,2
 int 10h

               mov  ah,2             ;;;move curser
                mov  dl,23
                mov  dh,1
                mov  bh,0
                int  10h
                mov  ah,2
                      
                mov  dl,p3carry
                add dl,30h
                int  21h
  
 

 ret
printcarry2 endp

printforbidden1 proc near 
  
  mov ah,13h
 mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset forbiddentxt
 mov dl,6
 mov dh,1
 mov cx,4
 int 10h

               mov  ah,2             ;;;move curser
                mov  dl,10
                mov  dh,1
                mov  bh,0
                int  10h

                mov  ah,2
                      
                mov  dl,preventingchar1
                int  21h
  
 

 ret
printforbidden1 endp

printforbidden2 proc near 
  
  mov ah,13h
 mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset forbiddentxt
 mov dl,26
 mov dh,1
 mov cx,4
 int 10h

               mov  ah,2             ;;;move curser
                mov  dl,30
                mov  dh,1
                mov  bh,0
                int  10h

                mov  ah,2
                      
                mov  dl,preventingchar2
                
                int  21h
  
 

 ret
printforbidden2 endp

change proc near   ;;;;;change command2 to $
 
    
    mov cl,28 
    mov bx,0 
    lop28:
    mov dl,'$'
      mov [si+bx],dl
      inc bx
      cmp bl,cl
      jne lop28
 ret
change endp


printpoint proc near   ;;;;print players points
                mov  ah,2             ;;;move curser
                mov  dl,2
                mov  dh,15
                mov  bh,0
                int  10h
                mov dx,offset texpoint1 ;;;print text p1 points
               mov ah,9
               int 21h
               mov al,p1point
               call printdec1byte
               

               mov  ah,2             ;;;move curser
                mov  dl,22
                mov  dh,15
                mov  bh,0
                int  10h


                mov dx,offset texpoint2 ;;;print text p2 points
               mov ah,9
               int 21h
               mov al,p2point
               call printdec1byte

 
 ret

printpoint endp


getcommand1 proc near
               
               MOV AH,2
                 mov  dl,1
                mov  dh,17
                mov  bh,0
                int  10h

                
               

               mov ah,10
                mov dx,offset comand1
                int 21h 

               
    

    lea si,  command1
    lea di ,comand1  
    mov cl,[di+1] 
    mov bx,0
    lop56: 
    mov dl,[di+bx+2]
      mov dh,preventingchar1
       cmp dl,dh
  je prevlop1
      mov [si+bx],dl
      inc bx
      cmp bl,cl
      jne lop56

              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,1
               mov ch,17
               mov dl,16
               mov dh,18
               int 10h

               ret
               prevlop1:
              
              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,1
               mov ch,17
               mov dl,16
               mov dh,17
               int 10h 
               mov bl,0 
   
 ret
getcommand1 endp


getcommand2 proc near
               

                 mov ah,2       ;;;;move curser
                 mov  dl,21
                mov  dh,17
                mov  bh,0
                int  10h
                
                

               mov ah,10
                mov dx,offset comand1
                int 21h 

                lea si,  command1
                lea di ,comand1  
    mov cl,[di+1] 
    mov bx,0
    lop57: 
    mov dl,[di+bx+2]
    mov dh,preventingchar2
    cmp dl,dh
    je prevlop2
      mov [si+bx],dl
      inc bx
      cmp bl,cl
      jne lop57

              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,21
               mov ch,38
               mov dl,16
               mov dh,18
               int 10h
               mov bh,12;;;;;
               ret

              prevlop2:
              mov bl,0 
              mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cl,21
               mov ch,17
               mov dl,38
               mov dh,17
               int 10h 
               
   
ret
getcommand2 endp


printram1 proc near


               mov rampos,16
               ramp1lop:  
               call print4bit
               inc ramcounter
               inc ramccouner
               cmp ramccouner,58
               je inclop
               lop3:
               cmp ramcounter,16
               jae final3
               jmp ramp1lop

               inclop:
               add ramccouner,7
               jmp lop3
               
               final3:
               mov cl,0
               mov ramcounter,cl
               mov cl,48
               mov ramccouner,cl


ret
printram1 endp

printram2 proc near

               mov rampos,36
               ramp2lop:  
               call print4bit2
               inc ramcounter
               inc ramccouner
               cmp ramccouner,58
               je inc3
               lop4:
               cmp ramcounter,16
               jae final2
               jmp ramp2lop

               inc3:
               add ramccouner,7
               jmp lop4
               
               final2:
               mov cl,0
               mov ramcounter,cl
               mov cl,48
               mov ramccouner,cl


ret
printram2 endp
print4bit proc near
                mov  ah,2
                
                mov  dl,16
                mov  dh,ramcounter
                mov  bh,0
                int  10h
                mov  ah,2                   
                mov  dl,ramccouner
                int  21h
                mov  dl,' '
                int  21h
                lea bx,p20
                add bl,ramcounter
               mov al,[bx]              
               call print1byte
ret
print4bit endp
print4bit2 proc near
                mov  ah,2
                
                mov  dl,36
                mov  dh,ramcounter
                mov  bh,0
                int  10h
                mov  ah,2                   
                mov  dl,ramccouner
                int  21h
                mov  dl,' '
                int  21h
                lea bx,p30
                add bl,ramcounter
               mov al,[bx]              
               call print1byte
ret
print4bit2 endp

drew proc near ;drew game gui 

              
               
               mov ax,0600h  ;;clear screen
               mov bh,00h
               mov cx,00
               mov dx,184fh
               int 10h

                mov  cx,160   ;;vertivalll ine 
                mov  dx,0
                mov  al,5
                mov  ah,0ch		   
                vertcalline:       
    
    
                int  10h
                inc  dx
                cmp  dx,200
                jne  vertcalline

               ;;;;;;;;;;;;;;;;
                
              
                mov  cx,285  ;;;drew line ram 2
                mov  dx,0
                mov  al,5
                mov  ah,0ch		   
                v2:       
                int  10h
                inc  dx
                cmp  dx,130
                jne  v2
                ;;;;;;;;;;;;

                   mov  cx,125  ;;;drew line ram1
                mov  dx,0
                mov  al,5
                mov  ah,0ch		   
                v3:       
                int  10h
                inc  dx
                cmp  dx,130
                jne  v3

                ;;;;;;;;;;

               mov  cx,0
                mov  dx,130
                mov  al,5
                mov  ah,0ch
				    			   
               hline:    ;herzontal line    
                int  10h
                inc  cx
                cmp  cx,320
                jne  hline
  
               call print_p1reg ;print reg
               call print_p2reg
                                ;;; drew p1 name
                 mov  ah,2
                mov  dl,3
                mov  dh,12
                mov  bh,0
                int  10h
                mov dx,offset p1name+2
                call print_name

               ;;;;drew p1 box
                mov  cx,20  ;set dimension of the box
                mov  dx,90
                mov  al,5
                mov  ah,0ch
               box1:        
                int  10h
                inc  cx
                cmp  cx,100
                jne  box1 
                
                ;;;;;;;;;;;
                
               mov  cx,20
                mov  dx,110
                mov  al,5
                mov  ah,0ch	  
               			   
                 box2:        
                int  10h
                inc  cx
                cmp  cx,100
                jne  box2
                ;;;;;;;;
                mov  cx,20
                mov  dx,90
                mov  al,5
                mov  ah,0ch	  
               			   
                 box3:        
                int  10h
                inc  dx
                cmp  dx,110
                jne  box3
                
                ;;;;;;;;;;;
                mov  cx,100
                mov  dx,90
                mov  al,5
                mov  ah,0ch	  
               			   
                 box4:        
                int  10h
                inc  dx
                cmp  dx,110
                jne  box4
          

                   ;;;;;;;drew p2 box
                 ;drew p2 name 
                 mov  ah,2
                mov  dl,23
                mov  dh,12
                mov  bh,0
                int  10h
                mov dx,offset p2name+2
                call print_name

               

                ;call print_name

                ;;;;drew box
                mov  cx,180  ;set dimension of the box
                mov  dx,90
                mov  al,5
                mov  ah,0ch
               p2box1:        
                int  10h
                inc  cx
                cmp  cx,260
                jne  p2box1 
                
                ;;;;;;;;;;;
                
               mov  cx,180
                mov  dx,110
                mov  al,5
                mov  ah,0ch	  
               			   
                p2box2:        
                int  10h
                inc  cx
                cmp  cx,260
                jne  p2box2
                ;;;;;;;;
                mov  cx,180
                mov  dx,90
                mov  al,5
                mov  ah,0ch	  
               			   
                 p2box3:        
                int  10h
                inc  dx
                cmp  dx,110
                jne  p2box3
                
                ;;;;;;;;;;;
                mov  cx,260
                mov  dx,90
                mov  al,5
                mov  ah,0ch	  
               			   
                 p2box4:        
                int  10h
                inc  dx
                cmp  dx,110
                jne  p2box4

                call printram1
                call printram2
                call printpoint
                call printcarry1
                 call printcarry2
                 mov cl,level
              cmp cl,50
              jne levellop
              call printwinvalue
  ret
  levellop:
  call printforbidden1
  call printforbidden2
  call printwinvalue
  ret

drew endp

printwinvalue proc near 
              
              mov ah,13h
             mov al,0
            mov bh,0
           mov bl,5
            mov bp,offset wtxt
             mov dl,5
           mov dh,0
          mov cx,3
            int 10h
 
                MOV AH,2
                mov  dl,8
                mov  dh,0
                mov  bh,0
                int  10h
 mov ax,winvalue
 call print_nump

  mov ah,13h
             mov al,0
            mov bh,0
           mov bl,5
            mov bp,offset wtxt
             mov dl,25
           mov dh,0
          mov cx,3
            int 10h
 
                MOV AH,2
                mov  dl,29
                mov  dh,0
                mov  bh,0
                int  10h
 mov ax,winvalue
 call print_nump
 ret
printwinvalue endp
print_p1reg proc near  ;print p1 regester
               mov  ah,2
                mov  dl,2
                mov  dh,2
                mov  bh,0
                int  10h
                
                mov ecx,0000
                mov cx,"XA"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,2
                mov  bh,0
                int  10h
                mov  ax,[p2ax]
                call print_nump
                
                mov  dl,2
                mov  dh,3
       
                 mov cx,"XB"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,3
                mov  bh,0
                int  10h
                 mov  ax,[p2bx]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,4
                mov  bh,0
                int  10h
                 mov cx,"XC"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,4
                mov  bh,0
                int  10h
                mov  ax,[p2cx]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,5
                mov  bh,0
                int  10h
                 mov cx,"XD"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,5
                mov  bh,0
                int  10h
                mov  ax,[p2dx]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,6
                mov  bh,0
                int  10h
                 mov cx,"IS"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,6
                mov  bh,0
                int  10h
                mov  ax,[p2si]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,7
                mov  bh,0
                int  10h
                 mov cx,"ID"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,7
                mov  bh,0
                int  10h
                 mov  ax,[p2di]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,8
                mov  bh,0
                int  10h
                 mov cx,"PS"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,8
                mov  bh,0
                int  10h
                  mov  ax,[p2sp]
                call print_nump
                mov  ah,2
                mov  dl,2
                mov  dh,9
                mov  bh,0
                int  10h
                 mov cx,"PB"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,5
                mov  dh,9
                mov  bh,0
                int  10h
                mov  ax,[p2bp]
                call print_nump

ret
print_p1reg endp

print_p2reg proc near ;drew p2 regester
                mov  ah,2
                mov  dl,22
                mov  dh,2
                mov  bh,0
                int  10h
                
                
                mov cx,"XA"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,25
                mov  dh,2
                mov  bh,0
                int  10h
                mov  ax,[p3ax]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,3
                mov  bh,0
                int  10h
                 mov cx,"XB"
                mov regname,ecx
                call print_reg
                mov  ah,2
                mov  dl,25
                mov  dh,3
                mov  bh,0
                int  10h
                mov  ax,[p3bx]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,4
                mov  bh,0
                int  10h
                 mov cx,"XC"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,4
                mov  bh,0
                int  10h
                mov  ax,[p3cx]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,5
                mov  bh,0
                int  10h
                 mov cx,"XD"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,5
                mov  bh,0
                int  10h
                mov  ax,[p3dx]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,6
                mov  bh,0
                int  10h
                 mov cx,"IS"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,6
                mov  bh,0
                int  10h
                mov  ax,[p3si]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,7
                mov  bh,0
                int  10h
                 mov cx,"ID"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,7
                mov  bh,0
                int  10h
                mov  ax,[p3di]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,8
                mov  bh,0
                int  10h
                 mov cx,"PS"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,8
                mov  bh,0
                int  10h
                mov  ax,[p3bp]
                call print_nump
                mov  ah,2
                mov  dl,22
                mov  dh,9
                mov  bh,0
                int  10h
                 mov cx,"PB"
                mov regname,ecx
                call print_reg
                 mov  ah,2
                mov  dl,25
                mov  dh,9
                mov  bh,0
                int  10h
                mov  ax,[p3bp]
                call print_nump
                ret 
print_p2reg endp


print_reg proc near 


mov ah,13h
mov al,0
 mov bh,0
 mov bl,5
 mov bp,offset regname
 ;mov dl,2
 ;mov dh,2
mov cx,2
int 10h

ret
print_reg endp


print_name proc near 
mov ah,9

int 21h
ret
print_name endp


print_nump proc near       ;;;print ax 
        
   
                mov  lpart,al
                mov  al,ah
                mov  dl,10h
                mov  ah,0

                div  dl

                mov  dh,ah
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  icrementhex3
                jmp  dec3
                icrementhex3: 
                add  al,7
                 dec3:         
                mov  dl,al
                int  21h
   
                mov  al,dh
                add  al,30h
                mov  ah,2
                cmp  al,39h
                jae  l1
                jmp  dec4
                l1:           
                add  al,7
               dec4:         
                mov  dl,al
                int  21h
   
                mov  al,lpart
                mov  dl,10h
                mov  ah,0

                div  dl

                mov  dh,ah
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  icrementhex1
                jmp  dec1
                icrementhex1: 
                add  al,7
                 dec1:         
                mov  dl,al
                int  21h
   
                mov  al,dh
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  icrementhex12
                jmp  dec2
                icrementhex12:
                add  al,7
                dec2:         
                mov  dl,al
                int  21h
                ret
print_nump endp


print1byte proc near ;print 1byte al
  

                
                mov  dl,10h
                mov  ah,0

                div  dl

                mov  dh,ah
                add  al,30h
                mov  ah,2
                cmp  al,58
                jae  pr1
                jmp  lo1
                pr1: 
                add  al,7
                 lo1:         
                mov  dl,al
                int  21h
   
                mov  al,dh
                add  al,30h
                mov  ah,2
                cmp  al,39h
                jae  pr2
                jmp  l2
                pr2:           
                add  al,7
               l2:         
                mov  dl,al
                int  21h

  ret
print1byte endp

printdec1byte proc near ;;;;;;;print al in byte decimal


       mov  dl,10  
                mov  ah,0

                div  dl

                mov  dh,ah
                add  al,30h
                mov  ah,2
                      
                mov  dl,al
                int  21h
   
                mov  al,dh
                add  al,30h
                mov  ah,2
                    
                mov  dl,al
                int  21h

ret
printdec1byte endp


change_to_p12 proc near 

mov ax,p1ax
mov p2ax,ax
mov ax,p1bx
mov p2bx,ax
mov ax,p1cx
mov p2cx,ax
mov ax,p1dx
mov p2dx,ax
mov ax,p1si
mov p2si,ax
mov ax,p1di
mov p2di,ax
mov ax,p1sp
mov p2sp,ax
mov ax,p1bp
mov p2bp,ax
mov al,p11
mov p21,al
mov al,p10
mov p20,al
mov al,p12
mov p22,al
mov al,p13
mov p23,al
mov al,p14
mov p24,al
mov al,p15
mov p25,al
mov al,p16
mov p26,al
mov al,p17
mov p27,al
mov al,p18
mov p28,al
mov al,p19
mov p29,al
mov al,p1a
mov p2a,al
mov al,p1b
mov p2b,al
mov al,p1c
mov p2c,al
mov al,p1d
mov p2d,al
mov al,p1e
mov p2e,al
mov al,p1f
mov p2f,al
mov al,p1carry
mov p2carry,al

mov al,p1stacksize
mov p2stacksize,al
mov ax,p1stackindex
mov p2stackindex,ax
mov bx,0
mov cl,10
stacklop21:
mov al,p1stack[bx]
mov p2stack[bx],al
dec cl
inc bx
cmp cl,0
jnz stacklop21

ret
change_to_p12 endp

change_to_p13 proc near 

mov ax,p1ax
mov p3ax,ax
mov ax,p1bx
mov p3bx,ax
mov ax,p1cx
mov p3cx,ax
mov ax,p1dx
mov p3dx,ax
mov ax,p1si
mov p3si,ax
mov ax,p1di
mov p3di,ax
mov ax,p1sp
mov p3sp,ax
mov ax,p1bp
mov p3bp,ax
mov al,p11
mov p31,al
mov al,p30
mov p10,al
mov al,p12
mov p32,al
mov al,p13
mov p33,al
mov al,p14
mov p34,al
mov al,p15
mov p35,al
mov al,p16
mov p36,al
mov al,p17
mov p37,al
mov al,p18
mov p38,al
mov al,p19
mov p39,al
mov al,p1a
mov p3a,al
mov al,p1b
mov p3b,al
mov al,p1c
mov p3c,al
mov al,p1d
mov p3d,al
mov al,p1e
mov p3e,al
mov al,p1f
mov p3f,al
mov al,p1carry
mov p3carry,al

mov al,p1stacksize
mov p3stacksize,al
mov ax,p1stackindex
mov p3stackindex,ax
mov bx,0
mov cl,10
stacklop22:
mov al,p1stack[bx]
mov p3stack[bx],al
dec cl
inc bx
cmp cl,0
jnz stacklop22

ret
change_to_p13 endp


END MAIN
    