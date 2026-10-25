	TITLE "COUNT HEX on TIL311"
;Top of RAM @ 0x2000
	ORG 2000H 	; RAM starts HERE

START   LXI H, 4000h 	; load HL pair with RAM end location
	SPHL		; init Stack Pointer
	XRA A		; CLEAR ACC
	MOV C,A 	; MAKE A COPY

COUNT   MOV A,C		; Move back to ACC after delay loop
	OUT 61H 	; Send it to OUTPUT PORT 61H (97)
	INR A   	; Increment the value to next
	MOV C,A 	; save a back-up copy before delay
	CALL DELAY	; call DELAY to see the result
	JMP COUNT	; Just do it again and again

;Delay, return to main when done.

DELAY   MVI A, 0FFh ; load ACC with 255
        MOV B, A	; make a copy to REG B
PT1     DCR A		; Decrement outer LOOP
PT2     DCR B		; Decrement inner LOOP
        JNZ PT2		; check for non ZERO value
        CPI 00h		; Compare with ZERO
        JNZ PT1		; Non Zero check
        RET		; return to FLASH routine
	
	END 		; Added for A85