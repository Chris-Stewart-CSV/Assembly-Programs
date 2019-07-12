;	Parameter passing via registers
;	Objective: To show parameter passing via registers
;   Input: Requests two integers from the user
;   Output: Outputs the sum of the input integers

%include "io.mac"
.STACK 100H
.DATA
    prompt_msg1  db   "Please input the first number: ",0
    prompt_msg2  db   "Please input the second number: ",0
    max_msg      db   "The max is ",0
.CODE
      .STARTUP
      PutStr  prompt_msg1    ; request first number
      GetInt  CX             ; CX = first number
      nwln
      PutStr  prompt_msg2    ; request second number
      GetInt  DX             ; DX = second number
      nwln
      call    Findmax        ; returns maximum
done:
      .EXIT

;-----------------------------------------------------------
;Procedure sum receives two integers in CX and DX.
;The sum of the two integers is returned in AX.
;-----------------------------------------------------------
Findmax:
      PutStr  max_msg 
      cmp     CX, DX     ; compare CX to DX 
      jge max1
      jle max2
        max1:
          PutInt CX
          jmp done
        max2:
          PutInt DX
          jmp done 
      ret
;------------------------------------------------------------
