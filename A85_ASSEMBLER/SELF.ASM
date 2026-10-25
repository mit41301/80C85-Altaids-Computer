	TITLE "Self modifying LED program for MCS-85"

	ORG 2000H 	; RAM starts HERE
	
	XRA 	A
	STC
AGAIN	RAL
	OUT 	61H
;;	PUSH	PSW
;;	CALL 	DELAY
;	CALL 	DELAY
;;	POP	PSW
	CC 	XOR8
	JMP 	AGAIN
XOR8	LDA 	2002
	XRI 	08H
	STA 	2002H	;	AGAIN ; 2002
	XRA 	A
	STC
	RET


; --- 16-bit Delay Routine ---
; Input: HL pair holds the 16-bit count (up to FFFFH)
DELAY:
;    LXI H, 0FFFFH    ; [10 T-states] Load HL with 65,535
    LXI H, 0002H    ; [10 T-states] Load HL with 65,535
LOOP_16:
    DCX H           ; [6 T-states] Decrement HL pair
    MOV A, L        ; [4 T-states] Move Low byte to A
    ORA H           ; [4 T-states] OR with High byte (Sets Zero flag)
    JNZ LOOP_16     ; [10/7 T-states] Jump if result not zero
    RET             ; [10 T-states]
	
	END 		; Added for A85