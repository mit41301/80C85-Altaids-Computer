	CPU 8085U
;########################################################	
;	TITLE "16 bit Subtraction using DSUB instruction"
;########################################################
; 	DSUB Opcode 08H (H)(L)=(H)(L)-(B)(C)

	ORG	2000H	 ; Origin of the CODE

   	LXI B,Subtrahend ; load BC pair with Subtrahend
   	LHLD Minuend	 ; load the Minuend 
   	DSUB		 ; DSUB (H)(L)=(H)(L)-(B)(C)
   	SHLD Answer	 ; STORE the result at Answer
   	JMP $-100AH	 ; Jump to Monitor

	ORG 	2020H	; Database STARTs HERE

Minuend	   DW  65244	; FEDCH <- HEX-DEC->65,244
Subtrahend EQU 60584	; ECA8H <- HEX-DEC->60,584
Answer	   DW -1	; 1234H <- HEX RESULT(FEDCH-ECA8H)
			; 4660D (65,244-60,584)<- DEC RESULT		
