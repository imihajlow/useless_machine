;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9233 (May 15 2015) (Mac OS X i386)
; This file was generated Wed May 20 21:19:15 2015
;--------------------------------------------------------
	.module test
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _exti5
	.globl _exti1
	.globl _exti0
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int _exti0 ;int8
	int _exti1 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int _exti5 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	test.c: 3: void exti0(void) __interrupt(8) {
;	-----------------------------------------
;	 function exti0
;	-----------------------------------------
_exti0:
;	test.c: 5: }
	iret
;	test.c: 7: void exti1(void) __interrupt(9) {
;	-----------------------------------------
;	 function exti1
;	-----------------------------------------
_exti1:
;	test.c: 9: PE_ODR ^= 0x80;
	ldw	x, #0x5014
	ld	a, (x)
	xor	a, #0x80
	ld	(x), a
;	test.c: 11: EXTI_SR1 |= 2;
	ldw	x, #0x50a3
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	iret
;	test.c: 14: void exti5(void) __interrupt(13) {
;	-----------------------------------------
;	 function exti5
;	-----------------------------------------
_exti5:
;	test.c: 16: }
	iret
;	test.c: 27: int main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #2
;	test.c: 29: CLK_PCKENR2 = 0; // disable boot ROM clock
	mov	0x50c4+0, #0x00
;	test.c: 32: PE_DDR = 0x80; // output
	mov	0x5016+0, #0x80
;	test.c: 33: PE_CR1 = 0x80; // push-pull
	mov	0x5017+0, #0x80
;	test.c: 35: PC_DDR |= 0x80; // output
	bset	0x500c, #7
;	test.c: 36: PC_CR1 |= 0x80; // push-pull
	bset	0x500d, #7
;	test.c: 38: PC_CR2 |= 0x02; // interrupt
	ldw	x, #0x500e
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	test.c: 39: PC_CR1 |= 0x02; // pull-up
	ldw	x, #0x500d
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	test.c: 41: EXTI_CR1 = (3) << 2; // any edge
	mov	0x50a0+0, #0x0c
;	test.c: 42: rim(); // enable interrupts
	rim 
;	test.c: 44: CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
	ldw	x, #0x7f60
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	test.c: 45: halt();
	halt 
;	test.c: 46: PC_ODR |= 0x80;
	bset	0x500a, #7
;	test.c: 47: while (1) ;
00102$:
	jra	00102$
;	test.c: 48: return 0;
	addw	sp, #2
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
