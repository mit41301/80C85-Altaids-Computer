 TITLE "Intel 8085 OUT PORT 061H"       
 	;; Anthropic Claude 
	;; Note: ORG 3000H assumes 8085 with 8KB of RAM
        ;; If using 80/10, try adusting to 3D00H instead.
        ;;
          ORG   3000H	; Program starts at 3000H
START:    MVI 	A,01H   ; Initialize A with rightmost bit
          MVI 	B,07H   ; Counter for shifts left
LEFT:     CMA           ; Complement A (invert bits)
          OUT 	061H    ; Output inverted pattern to port 61
          CMA           ; Restore original pattern
          CALL 	DELAY   ; Add delay between shifts
          RLC           ; Rotate bits left
          DCR 	B       ; Decrement counter
          JNZ 	LEFT    ; Continue until leftmost position
          MVI 	B,07H   ; Counter for shifts right
RIGHT:    CMA           ; Complement A (invert bits)
          OUT 	061H    ; Output inverted pattern to port 61
          CMA           ; Restore original pattern
          CALL 	DELAY   ; Add delay between shifts
          RRC           ; Rotate bits right
          DCR   B       ; Decrement counter
          JNZ   RIGHT   ; Continue until rightmost position
          JMP   START   ; Repeat forever
DELAY:    MVI   D,20H   ; Outer loop counter
DELY1:    MVI   C,0FFH  ; Inner loop counter
DELY2:    DCR   C       ; Decrement inner counter
          JNZ   DELY2   ; Continue inner loop
          DCR   D       ; Decrement outer counter
          JNZ   DELY1   ; Continue outer loop
          RET           ; Return from delay
	END