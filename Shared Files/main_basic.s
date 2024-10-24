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
	
		; Declare  variables
		LDR r0, Matrix2	; Assign address of matrix2
		LDR r1, Matrix1	; Assign address of matrix1
		MOV r2, #3	; Assign row count
		MOV r3, #3	; Assign col count
		MUL r4, r2, r3	; Assign total elements 3 * 3
		MOV r5, #0	; Assign i = 0
		MOV r6, #0	; Assign col# of first col to swap
		MOV r7, #2	; Assign col# of second col to swap
		
; Clone first matrix to second matrix
; This loop fills the second matrix with first matrix
fill_loop
		CMP r5, r3 		; i <  col ? (check each col for operations)
		BGE stop		; Terminate loop
		CMP r5, r6		; if (i == col1)
		BEQ mov_1to2	; move col1 to col2
		CMP r5, r7		; if (i == col1)
		BEQ mov_2to1	; move col2 to col1
		
		STR r1, [r0]
		
		; r1 + 4 and r0 + 4 for the next element
		ADD r1, r1, #4
		ADD r0, r0, #4
		
		; Increase i by one i = i + 1
		ADD r5, r5, #1	; i++
		B swap_loop 	; go to start of loop
		
; Move first col to place of second col
mov_1to2
		
		
		
		
		
		
		
		
		
		


; Move second col to place of first col
mov_2to1










		
swap_loop	
		CMP r4, r2 		; i < row ?
		BGE stop		; Terminate loop
		
		; Increase i by one i = i + 1
		ADD r1, r1, #1	; i++
		
		B swap_loop		; go to loop again
		
		
		
		
		
		

stop 	B stop

		ENDP 

		AREA myData, DATA, READWRITE 

Matrix1 DCB 1, 2, 3, 4, 5, 6, 7, 8, 9
Matrix2 SPACE 72

		END 
