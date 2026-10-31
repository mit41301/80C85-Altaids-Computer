; Hello.ASM
; asmx20 -l -o -w -e -C 8085 hello.asm
; 31 OCT 2026
;
; #include <stdio.h>
;
; main()
; {
;     printf("hello, world\n");
; }

	ORG	2000H	;load and run from address 2000H

	LXI 	D, MSG	; load message starting address in DE
	CALL    COUT	; send a char pointed out by DE
	CALL	MONI    ; return to MONITOR. No RESET required
	
MSG     DB      0DH,0AH,'hello, world\n',0AH,0
MONI    EQU	1000H	; monitor start address
COUT	EQU	1021H	; monitor routine
	END