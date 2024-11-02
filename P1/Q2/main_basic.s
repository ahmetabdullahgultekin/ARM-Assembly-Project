;*******************************************************************************
; Ayse Gulsum Eren
; Ahmet Abdullah Gültekin
; Enes Haksoy Öztürk
;*******************************************************************************

		INCLUDE core_cm4_constants.s		; Load Constant Definitions
		INCLUDE stm32l476xx_constants.s      
		
		AREA string_copy, CODE, READONLY
		EXPORT __main
		ALIGN 
		ENTRY

__main PROC
	
		; Declare  variables
		LDR r0, =Matrix2	; Assign address of matrix2 as a return address
		LDR r1, =Matrix1	; Assign address of matrix1
		MOV r2, #10	; Assign row count
		MOV r3, #10	; Assign col count
		MOV r4, #0	; Assign i = 0
		MOV r5, #0  ; Assign j = 0
		MOV r6, #6	; Assign col# of first col to swap
		MOV r7, #9	; Assign col# of second col to swap
		
		
; Clone first matrix to second matrix
; This loop fills the second matrix with first matrix
fill_loop
		CMP r4, r3 		; i <  col ? (check each col for operations)
		BGE stop		; Terminate loop
		
		LSL r9, r4, #2  ; i*4		
		ADD r10, r1, r9 ; calculate the starting address of column for matrix 
		
		LSL r11, r7, #2  ; find col2id * 4 
		ADD r11, r11, r0 ; B[i] + col# * 4 starting of column to paste
		
		CMP r4, r6		; if (i == col1)
		BEQ mov_1to2	; move col1 to col2
		
		LSL r11, r6, #2  ; find col2id * 4 
		ADD r11, r11, r0 ; B[i] + col# * 4 starting of column to paste
		
		CMP r4, r7		; if (i == col2)
		BEQ mov_2to1	; move col2 to col1
		
		ADD r11, r0, r9 ; calculate the starting address of column for new matrix
		B copy_column
		
increment	; to continue the fill loop from right point			
		ADD r4, r4, #1	; i++
		MOV r5, #0  	; j = 0 for other loops
		B fill_loop 	; go to start of loop
		
copy_column
		CMP r5,  r2 	; j == row#
		BGE increment	; continue to fill
		LDR r12, [r10]  ; copy index to reg
        STR r12, [r11]	; copy index to address
		LSL r8, r3, #2  ; find col# * 4
		ADD r10, r8 		; calculate next column index add + (col# * 4)
		ADD r11, r8 		; calculate next column index 
		ADD r5, #1 		; j = j + 1
		B copy_column
		
; Move first col to place of second col
mov_1to2
	CMP r5, r2      ;check if j reaches row count
    BGE increment	        
	LDR r12, [r10]   ;copy index to reg A[][]
	STR r12, [r11]   ; copy to address B[i][]
	LSL r8, r3, #2  ; find col# * 4
	ADD r10, r8 		; calculate next column index add + (col# * 4) to copy
	ADD r11, r8 		; calculate next column index to paste
    ADD r5, r5, #1   ; j++
    B   mov_1to2     ; continue
		

; Move second col to place of first col
mov_2to1
	CMP r5, r2      ;check if j reaches row count
    BGE increment	        
	LDR r12, [r10]   ;copy index to reg
	STR r12, [r11]   ; copy to address
	LSL r8, r3, #2  ; find col# * 4
	ADD r10, r8 		; calculate next column index add + (col# * 4) to copy
	ADD r11, r8 		; calculate next column index to paste
    ADD r5, r5, #1   ; j++
    B   mov_2to1     ; continue
		
stop 	B stop

		ENDP 

		AREA myData, DATA, READWRITE 

;Matrix1 DCD 1, 2, 3, 4, 5, 6 ; matrix to copy 
;Matrix2 DCD 0, 0, 0, 0, 0, 0 ; new matrix
Matrix1 DCD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100

Matrix2 DCD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

	
		END