;	Parameter passing via the stack
;	Objective: To show parameter passing via the stack
;   Input: Requests two integers from the user
;   Output: Outputs the sum of the input integers

%include "io.mac"
.STACK 100H
.DATA
     prompt_msg1  db   "Please input the first number: ",0
     prompt_msg2  db   "Please input second number: ",0
     sum_msg      db   "The sum is ",0
.CODE
      .STARTUP
      PutStr  prompt_msg1    ; request first number
      GetInt  CX             ; CX = first number
      nwln
      PutStr  prompt_msg2    ; request second number
      GetInt  DX             ; DX = second number
      nwln
      push    CX             ; place first number on stack
      push    DX             ; place second number on stack
      call    sum            ; returns sum in AX
      PutStr  sum_msg        ; display sum
      PutInt  AX
done:
      .EXIT

;-----------------------------------------------------------
;	Procedure sum receives two integers via the stack.
;	The sum of the two integers is returned in AX.
;-----------------------------------------------------------
sum:
      enter   0,0            ; save EBP
      mov     AX,[EBP+6]     ; sum = first number
      add     AX,[EBP+4]     ; sum = sum + second number
      leave                  ; restore EBP
      ret     4              ; return and clear parameters
