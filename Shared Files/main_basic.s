;******************** (C) Yifeng ZHU *******************************************
; @file    main.s
; @author  Yifeng Zhu
; @date    May-17-2015
; @note
;           This code is for the book "Embedded Systems with ARM Cortex-M 
;           Microcontrollers in Assembly Language and C, Yifeng Zhu, 
;           ISBN-13: 978-0982692639, ISBN-10: 0982692633
; @attension
;           This code is provided for education purpose. The author shall not be 
;           held liable for any direct, indirect or consequential damages, for any 
;           reason whatever. More information can be found from book website: 
;           http:;www.eece.maine.edu/~zhu/book
;*******************************************************************************


		INCLUDE core_cm4_constants.s		; Load Constant Definitions
		INCLUDE stm32l476xx_constants.s      
		
		AREA string_copy, CODE, READONLY
		EXPORT __main
		ALIGN 
		ENTRY

__main PROC
	
strcpy	LDR r1, =srcStr		; Retrieve address of the source string
		LDR r0, =dstStr		; Retrieve address of the destination string
loop	LDRB r2, [r1], #1 	; Load a byte & increase src address pointer
		STRB r2, [r0], #1 	; Store a byte & increase dst address pointer
		CMP r2, #0 			; Check for the null terminator
		BNE loop 			; Copy the next byte if string is not ended

stop 	B stop

		ENDP 

		AREA myData, DATA, READWRITE 
		ALIGN
srcStr	DCB "The source string.", 0  ;
dstStr	DCB "The destination string.", 0 ;


		END 
