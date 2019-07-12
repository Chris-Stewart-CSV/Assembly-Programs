%include "io.mac"
.STACK 100H	

.DATA
	msg1 db "Input a string up to 40 characters: ", 0
	msg2 db "Input a number between 1 - 10: ", 0
	msg3 db "Here are the first ", 0
	msg4 db " characters of your string: ", 0

.UDATA
	str1 resb 40
	str2 resb 40

.CODE
	.STARTUP
	PutStr msg1
	GetStr str1
	nwln
	PutStr msg2
	GetInt CX
	nwln
	PutStr msg3
	PutInt CX
	PutStr msg4
	mov EBX, str1
	mov EDX, str2
	push CX			;parameter pass integer input 
	call firstn		;call procedure w/ parameter
	PutStr str2		;output first n characters 
done:
	.EXIT 

firstn:
	enter 0, 0
	repeat:
		mov AL, BYTE [EBX]	;AL = str1[0]
		mov [EDX], AL		;str2[0] = AL
		inc EBX				;increment str1 index by 1
		inc EDX				;increment str2 index by 1
		dec CX				;decrement counter by 1
		jnz repeat
	leave
	ret 6