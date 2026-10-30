	CPU 8085U
;########################################################	
;	TITLE "RDEL instruction"
;########################################################
; 	RDEL Opcode 18H 

	ORG	2000H	; Origin of the CODE

	LHLD DATA16	; Load the 16 bit data

	XCHG		; Exchange with DE
	RDEL		; RDEL [18H] Instruction
	XCHG		; Exchange with HL

	SHLD	Answer	; STORE the result at Answer
	JMP	$-100CH	; Jump to Monitor
	HLT		; MOV M,M

	ORG 2020H	; Database STARTs HERE
DATA16	DW 1234H	; 1234H <- HEX-DEC->
Answer	DW -1		; 2468H <- HEX RESULT
			; 		
;	END