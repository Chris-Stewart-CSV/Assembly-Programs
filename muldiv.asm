%include "io.mac"
.STACK 100H

.DATA
	msg1 db "Enter the first number: ", 0
	msg2 db "Enter the second number: ", 0
	product db " * ", 0
	equal db " = ", 0
	divide db "/", 0
	msg3 db "Remainder of ", 0

.CODE
	.STARTUP
	PutStr msg1
	GetInt cx
	nwln
	PutStr msg2
	GetInt bx
	nwln
	mov ax, cx
	imul bx
	PutInt cx
	PutStr product
	PutInt bx
	PutStr equal
	PutInt ax 
	nwln
	mov ax, cx
	cwd		;convert ax to 32-bit dividend
	idiv bx
	PutInt cx
	PutStr divide
	PutInt bx
	PutStr equal
	PutInt ax
	nwln
	PutStr msg3
	PutInt dx

done:
	.EXIT