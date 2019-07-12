%include "io.mac"
.STACK 100H	

.DATA
	msg1 db "Enter a number: ", 0
	msg2 db "Number of 1 bits is ", 0

.CODE
	.STARTUP
	PutStr msg1
	GetInt ax
	nwln
	mov bx, 0	;position of bit
	mov dx, 0	;total of 1 bits
	mov cx, 16
	repeat:
		bt ax, bx	;test bit position
		jc one		;if position is 1 bit jump
		inc bx		;increment bit position 
		dec cx
		jnz repeat
	PutStr msg2
	PutInt dx
	jmp done
	one:
		inc dx		;increment total 1 bits by 1
		inc bx
		dec cx
		jnz repeat
	PutStr msg2
	PutInt dx 

done:
	.EXIT