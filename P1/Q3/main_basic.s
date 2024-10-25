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
	LDR r1,=data8bit
	LDR r0,[r1]
    ;bit_0
	MOV r1,#0
	MOVS r2,r0,LSR #1
	ADC r1,#0
	;bit_1
	MOV r2,#0
	MOVS r3,r0,LSR #2
	ADC r2,r2,#0
	;bit_2
	MOV r3,#0
	MOVS r4,r0,LSR #3
	ADC r3,r3,#0
	;bit_3
	MOV r4,#0
	MOVS r5,r0,LSR #4
	ADC r4,r4,#0
	;bit_4
	MOV r5,#0
	MOVS r6,r0,LSR #5
	ADC r5,r5,#0
	;bit_5
	MOV r6,#0
	MOVS r7,r0,LSR #6
	ADC r6,r6,#0
	;bit_6
	MOV r7,#0
	MOVS r8,r0,LSR #7
	ADC r7,r7,#0
	;bit_7
	MOV r8,#0
	MOVS r9,r0,LSR #8
	ADC r8,r8,#0
	;clearing the registers for the p0,p1,p2,p4,p8
	MOV r9,#0
	MOV r10,#0
	MOV r11,#0
	MOV r12,#0
	
	;Adding the values for p1
	ADD r9,r1,r2
	ADD r9,r9,r4
	ADD r9,r9,r5
	ADD r9,r9,r7
	;Adding the values for p2
	ADD r10,r1,r3
	ADD r10,r10,r4
	ADD r10,r10,r6
	ADD r10,r10,r7
	;Adding the values for p4
	ADD r11,r2,r3
	ADD r11,r11,r4
	ADD r11,r11,r8
	;Adding the values for p8
	ADD r12,r5,r6
	ADD r12,r12,r7
	ADD r12,r12,r8
	
	;Loop for the mode operation of p1
loop1 CMP r9,#2
      BLO loop2
	  SUB r9,r9,#2
	  B loop1
	;Loop for the mode operation of p2 
loop2 CMP r10,#2
      BLO loop3
	  SUB r10,r10,#2
	  B loop2
	;Loop for the mode operation of p4  
loop3 CMP r11,#2
      BLO loop4
	  SUB r11,r11,#2
	  B loop3
	;Loop for the mode operation of p8  
loop4 CMP r12,#2
      BLO calculatep0
	  SUB r12,r12,#2
	  B loop4	  
;;Adding the values for p0	  
calculatep0 ADD r0,r1,r2
            ADD r0,r0,r3
			ADD r0,r0,r4
			ADD r0,r0,r5
			ADD r0,r0,r6
			ADD r0,r0,r7
			ADD r0,r0,r8
			ADD r0,r0,r9
			ADD r0,r0,r10
			ADD r0,r0,r11
			ADD r0,r0,r12
			
;Loop for the mode operation of  p0
loop5 CMP r0,#2
      BLO lastop
	  SUB r0,r0,#2
	  B loop5
;Moving the bits for the appropriate locations
lastop MOV r8,r8,LSL #12
       MOV r7,r7,LSL #11
	   MOV r6,r6,LSL #10
	   MOV r5,r5,LSL #9
	   MOV r12,r12,LSL #8
	   MOV r4,r4,LSL #7
	   MOV r3,r3,LSL #6
	   MOV r2,r2,LSL #5
	   MOV r11,r11,LSL #4
	   MOV r1,r1,LSL #3
	   MOV r10,r10,LSL #2
	   MOV r9,r9,LSL #1
;Adding the bits for the wanted 13-bit data	   
	   ADD r0,r0,r1
	   ADD r0,r0,r2
	   ADD r0,r0,r3
	   ADD r0,r0,r4
	   ADD r0,r0,r5
	   ADD r0,r0,r6
	   ADD r0,r0,r7
	   ADD r0,r0,r8
	   ADD r0,r0,r9
	   ADD r0,r0,r10
	   ADD r0,r0,r11
	   ADD r0,r0,r12
;Loading the address of the data-13bit	   
	   LDR r1,=data13bit
;Storing the solution 
	   STR r0,[r1]
	   
		ENDP
        AREA myData, DATA, READWRITE
ALIGN
data8bit	DCB 0xFF ;
data13bit	DCW 0x0000 ;			
		END 
