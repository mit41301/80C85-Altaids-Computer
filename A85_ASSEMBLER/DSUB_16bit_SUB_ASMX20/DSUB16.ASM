	CPU 8085U
;########################################################	
;	TITLE "16 bit Subtraction using DSUB instruction"
;########################################################
; 	DSUB Opcode 08H (H)(L)=(H)(L)-(B)(C)

	ORG	20000O	; Origin of the CODE

	MVI	B,60584/400O	; 0ECH load B with Subtrahend MS Byte
	MVI	C,60584%256	; 0A8H Load C with Subtrahend LS Byte
	LHLD	Minuend	; load the Minuend 
	NOP		; Give some rest
	DSUB		; DSUB (H)(L)=(H)(L)-(B)(C)
	SHLD	Answer	; STORE the result at Answer
	JMP	$-100CH	; Jump to Monitor
	HLT		; MOV M,M

	ORG 20040O	; Database STARTs HERE
Minuend	DW 65244	; 0FEDCH <- HEX-DEC->65,244
Answer	DW -1		; 1234H <- HEX RESULT(FEDCH-ECA8H)
			; 4660D (65,244-60,584)<- DEC RESULT		
;	END