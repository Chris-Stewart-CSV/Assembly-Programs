%include "io.mac"
.STACK 100H	

.DATA
	msg1 db "Enter a number: ", 0
	msg2 db "The quotient is ", 0
	msg3 db "The remainder is ", 0

.CODE
	.STARTUP
	mov si, 0
	mov cx, 5
	repeat:
		PutStr msg1
		GetInt bx
		nwln
		add si, bx
		loop repeat
	push si
	push ax
	mov cx, 5
	push cx
	call MyAvg

done:
	.EXIT 

MyAvg:
	enter 0, 0
	mov ax, si
	cwd
	idiv cx
	PutStr msg2
	PutInt ax
	nwln
	PutStr msg3
	PutInt dx
	leave
	ret 10