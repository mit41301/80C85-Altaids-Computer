	ORG 2000H	; Origin of the CODE
	LHLD Var116	; Load HL pair direct from 2030(Var1)
	XCHG		; Exchange HL with DE pair
	LHLD Var216	; Load the next 16 bit value into HL
	DAD D		; Perform double addition
	SHLD Res16	; STORE the result at Res16
	HLT		; MOV M,M

	ORG 2030H	; Database STARTING location
Var116	DW 1165D	; 048D <- HEX
Var216	DW 3495D	; 0DA7 <- HEX
Res16	DW 0000H	; 1234 <- HEX RESULT
			; 4660 <- DEC RESULT		
	END