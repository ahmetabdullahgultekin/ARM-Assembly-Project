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
	;STR r0,[r1]
	;p1
	MOV r2,#0
	MOVS r1,r0,LSR #7
	ADC r2,r2,#0
	MOVS r1,r0,LSR #5
	ADC r2,r2,#0
	MOVS r1,r0,LSR #4
	ADC r2,r2,#0
	MOVS r1,r0,LSR #2
	ADC r2,r2,#0
	MOVS r1,r0,LSR #1
	ADC r2,r2,#0
	;p2
	MOV r3,#0
	MOVS r1,r0,LSR #7
	ADC r3,r3,#0
	MOVS r1,r0,LSR #6
	ADC r3,r3,#0
	MOVS r1,r0,LSR #4
	ADC r3,r3,#0
	MOVS r1,r0,LSR #3
	ADC r3,r3,#0
	MOVS r1,r0,LSR #1
	ADC r3,r3,#0
	;p4
	MOV r4,#0
	MOVS r1,r0,LSR #8
	ADC r4,r4,#0
	MOVS r1,r0,LSR #4
	ADC r4,r4,#0
	MOVS r1,r0,LSR #3
	ADC r4,r4,#0
	MOVS r1,r0,LSR #2
	ADC r4,r4,#0
	;p8
	MOV r5,#0
	MOVS r1,r0,LSR #8
	ADC r5,r5,#0
	MOVS r1,r0,LSR #7
	ADC r5,r5,#0
	MOVS r1,r0,LSR #6
	ADC r5,r5,#0
	MOVS r1,r0,LSR #5
	ADC r5,r5,#0
	;p1
loop1 CMP r2,#2
      BLO loop2
	  SUB r2,r2,#2
	  B loop1
	;p2 
loop2 CMP r3,#2
      BLO loop3
	  SUB r3,r3,#2
	  B loop2
	;p4  
loop3 CMP r4,#2
      BLO loop4
	  SUB r4,r4,#2
	  B loop3
	;p8  
loop4 CMP r5,#2
      BLO calculatep0
	  SUB r5,r5,#2
	  B loop4	  
	  
calculatep0 MOV r0,#0
            ADD r0,r2,r3
            ADD r0,r0,r4
            ADD r0,r0,r5
			LDR r1,=data8bit
			LDR r6,=data13bit
loopfor8bit CMP r1,r6
            BGE loop5
            LDRB r7,[r1],#1
            ADD r0,r0,r7
            B loopfor8bit									
loop5 CMP r0,#2
      BLO lastop
	  SUB r0,r0,#2
	  B loop5
lastop	
	
	

		ENDP
        AREA myData, DATA, READWRITE
ALIGN
data8bit	DCW 0xB3  ;
data13bit	DCW 0x0000 ;			
		END 
