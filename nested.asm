%include "io.mac"
.STACK 100H

.CODE
	.STARTUP
	mov cx, 3
	mov ax, 2
	loop1:		;start outer loop
		PutInt ax
		nwln
		mov bx, ax
		mov dx, ax
		loop2:	;start inner loop
			inc dx
			PutInt dx
			nwln
			dec bx
			jnz loop2	;end inner loop
		inc ax
		cmp ax, cx
		jle loop1	;end outer loop

done:
	.EXIT