%include "io.mac"
.STACK 100H	
.DATA
	msg1 db "Enter any integer: ", 0
	msg2 db "Even output is: ", 0
.CODE
	.STARTUP
	PutStr msg1
	GetInt AX
	mov BX, AX
	shr BX, 1
	jc odd
	nwln
	PutStr msg2
	PutInt AX
done:
	.EXIT

odd:
	add AX, 1
	nwln
	PutStr msg2
	PutInt AX
	jmp done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; To assemble and link in nasm:
;;;; >nasm -f obj evenOrOdd.asm
;;;; >link evenOrOdd.obj io.obj
;;;; >evenOrOdd.exe
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;