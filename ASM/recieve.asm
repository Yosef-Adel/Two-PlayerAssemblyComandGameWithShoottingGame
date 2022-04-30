.model small
.stack
.data

VALUE db ?

.code

main PROC FAR
    
 call intialize
 call receive  
    
    
main endp

intialize PROC 
     
;	Set Divisor Latch Access Bit
mov dx,3fbh 			; Line Control Register
mov al,10000000b		;Set Divisor Latch Access Bit
out dx,al				;Out it
;	Set LSB byte of the Baud Rate Divisor Latch register.
mov dx,3f8h			
mov al,0ch			
out dx,al
;	Set MSB byte of the Baud Rate Divisor Latch register.
mov dx,3f9h
mov al,00h
out dx,al
;	Set port configuration
mov dx,3fbh
mov al,00011011b 
out dx,al

    ret
intialize endp

send PROC
    
    ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
AGAIN:  	In al , dx 			;Read Line Status
  		test al , 00100000b
  		JZ AGAIN                               ;Not empty

;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,VALUE
  		out dx , al

    ret
    send endp 

receive PROC   
    
    ;Check that Data is Ready
		mov dx , 3FDH		; Line Status Register
	CHK:	in al , dx 
  		test al , 1
  		JZ CHK                                    ;Not Ready
 ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H
  		in al , dx 
  		mov VALUE , al
  		
  		mov ah,2h
  		mov dl,VALUE
  		int 21h

    ret
    receive endp

end main