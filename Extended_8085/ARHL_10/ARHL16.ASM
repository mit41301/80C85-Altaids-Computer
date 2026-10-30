	CPU 8085U
;########################################################	
;	TITLE "ARHL instruction"
;########################################################
; 	ARHL Opcode 10H (H)(L)=(H)(L)-(B)(C)

	ORG	2000H	; Origin of the CODE

	LHLD	DATA16	; load the Minuend 
	STC

	ARHL		; ARHL Instruction

	SHLD	Answer	; STORE the result at Answer
	JMP	$-100CH	; Jump to Monitor
	HLT		; MOV M,M

	ORG 2020H	; Database STARTs HERE
DATA16	DW 4444H	; 4444H <- HEX-DEC->
Answer	DW -1		; 2222H <- HEX RESULT
			; 		
;	END