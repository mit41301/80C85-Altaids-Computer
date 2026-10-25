	TITLE "COUNT HEX on TIL311"

	ORG 2000H 	; RAM starts HERE

;Top of RAM @ 0x4000
START   LXI H, 4000h 	; load HL pair with RAM end location
	SPHL		; init Stack Pointer
	MVI C,00

COUNT   
	MOV A,C		; Move back to ACC after delay loop
	OUT 61H 	; Send it to OUTPUT PORT 61H (97)
;	DCR C   	; Decrement the value to next
	INR C   	; Increment the value to next
	CALL DELAY	; call DELAY to see the result
	JMP COUNT	; Just do it again and again

; --- 16-bit Delay Routine ---
; Input: HL pair holds the 16-bit count (up to FFFFH)
DELAY:
     LXI H, 0FFFFH    ; [10 T-states] Load HL with 65,535
;    LXI H, 0002H    ; [10 T-states] Load HL with 65,535
LOOP_16:
    DCX H           ; [6 T-states] Decrement HL pair
    MOV A, L        ; [4 T-states] Move Low byte to A
    ORA H           ; [4 T-states] OR with High byte (Sets Zero flag)
    JNZ LOOP_16     ; [10/7 T-states] Jump if result not zero
    RET             ; [10 T-states]
	
	END 		; Added for A85