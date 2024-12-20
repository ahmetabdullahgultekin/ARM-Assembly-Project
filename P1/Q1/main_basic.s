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
		
		AREA sum_iter, CODE, READONLY
		EXPORT __main
		ALIGN 
		ENTRY

__main PROC
	
		; Declare  variables
		MOV r1, #1	; Assign i = 1
		MOV r2, #3	; Assign a = 3
		MOV r3, #5	; Assign n = 5
		MOV r0, r1	; Assign sum = i = 1
		MOV r4, #5	; Assign temp = 5 to multilply by 10
		
loop	CMP r1, r3 		; i < n ?
		BGE calc_sum		; Terminate loop
		
		; Increase i by one i = i + 1
		ADD r1, r1, #1	; i++
		
		; sum = sum * 10
		; Append new digit (123 <- 4 , sum = 1234)
		LSL	r0, r0, #1	; << 1 (sum * 2)
		;MUL r0, r0, r4	; sum * 5
		;ADD r0, r0, r1	; sum = sum + i (sum = 1230 + 4 = 1234)
		MLA r0, r0, r4, r1 ; sum = (sum * 5) + i (sum = 1230 + 4 = 1234)
		
		B loop 			; go to loop again
		

calc_sum; At the end, multiply by 'a' (1234 * n)
		MUL r0, r0, r2 ; sum = sum * a

stop 	B stop

		ENDP 

