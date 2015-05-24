;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9233 (May 15 2015) (Mac OS X i386)
; This file was generated Sun May 24 17:37:25 2015
;--------------------------------------------------------
	.module test
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _enableIdleTimer
	.globl _setupTimer
	.globl _tim3
	.globl _tim1
	.globl _onSleepEnded
	.globl _exti5
	.globl _exti1
	.globl _exti0
	.globl _idleTimerRunning
	.globl _isSleeping
	.globl _firstEvent
	.globl _startSleep
	.globl _keepIdleTimer
	.globl _disableIdleTimer
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_firstEvent::
	.ds 1
_isSleeping::
	.ds 1
_idleTimerRunning::
	.ds 1
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
	int _tim3 ;int21
	int 0x0000 ;int22
	int _tim1 ;int23
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
;	test.c: 7: void exti0(void) __interrupt(8) {
;	-----------------------------------------
;	 function exti0
;	-----------------------------------------
_exti0:
;	test.c: 9: }
	iret
;	test.c: 11: void exti1(void) __interrupt(9) {
;	-----------------------------------------
;	 function exti1
;	-----------------------------------------
_exti1:
;	test.c: 13: PE_ODR ^= 0x80;
	ldw	x, #0x5014
	ld	a, (x)
	xor	a, #0x80
	ld	(x), a
;	test.c: 14: keepIdleTimer();
	call	_keepIdleTimer
;	test.c: 15: PC_ODR |= 0x80;
	bset	0x500a, #7
;	test.c: 16: EXTI_SR1 |= 2;
	ldw	x, #0x50a3
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	iret
;	test.c: 19: void exti5(void) __interrupt(13) {
;	-----------------------------------------
;	 function exti5
;	-----------------------------------------
_exti5:
;	test.c: 21: }
	iret
;	test.c: 23: void onSleepEnded(void) {
;	-----------------------------------------
;	 function onSleepEnded
;	-----------------------------------------
_onSleepEnded:
;	test.c: 24: }
	ret
;	test.c: 28: void tim1(void) __interrupt(23) {
;	-----------------------------------------
;	 function tim1
;	-----------------------------------------
_tim1:
;	test.c: 29: if (TIM1_SR1 & TIM_SR1_UIF) {
	ldw	x, #0x52b6
	ld	a, (x)
	srl	a
	jrnc	00105$
;	test.c: 30: if (firstEvent) { // discard first event
	tnz	_firstEvent+0
	jreq	00102$
;	test.c: 31: firstEvent = 0;
	clr	_firstEvent+0
	jra	00105$
00102$:
;	test.c: 33: isSleeping = 0;
	clr	_isSleeping+0
;	test.c: 34: onSleepEnded();
	call	_onSleepEnded
00105$:
;	test.c: 38: TIM1_SR1 = 0;
	mov	0x52b6+0, #0x00
	iret
;	test.c: 41: void tim3(void) __interrupt(21) {
;	-----------------------------------------
;	 function tim3
;	-----------------------------------------
_tim3:
;	test.c: 42: PC_ODR &= ~0x80;
	bres	0x500a, #7
;	test.c: 43: disableIdleTimer();
	call	_disableIdleTimer
;	test.c: 44: TIM3_SR1 = 0;
	mov	0x5286+0, #0x00
	iret
;	test.c: 47: void startSleep(unsigned short period) { // units are 10 ms
;	-----------------------------------------
;	 function startSleep
;	-----------------------------------------
_startSleep:
	sub	sp, #2
;	test.c: 48: if (isSleeping) {
	tnz	_isSleeping+0
;	test.c: 49: return; // Already sleeping. ???
	jrne	00103$
;	test.c: 51: CFG_GCR &= ~CFG_GCR_AL; // disable interrupt-only activation level
	ldw	x, #0x7f60
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
;	test.c: 53: TIM1_ARRH = period >> 8;
	ld	a, (0x05, sp)
	clr	(0x01, sp)
	ldw	x, #0x52c3
	ld	(x), a
;	test.c: 54: TIM1_ARRL = period & 0xff;
	ld	a, (0x06, sp)
	ld	xh, a
	clr	a
	ld	a, xh
	ldw	x, #0x52c4
	ld	(x), a
;	test.c: 56: isSleeping = 1;
	mov	_isSleeping+0, #0x01
;	test.c: 57: TIM1_CR1 |= TIM_CR1_CEN;
	ldw	x, #0x52b0
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
00103$:
	addw	sp, #2
	ret
;	test.c: 72: void setupTimer(void) {
;	-----------------------------------------
;	 function setupTimer
;	-----------------------------------------
_setupTimer:
;	test.c: 73: CLK_PCKENR2 |= 1 << 1; // enable timer clock
	ldw	x, #0x50c4
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	test.c: 76: TIM1_PSCRH = 0x27;
	mov	0x52c1+0, #0x27
;	test.c: 77: TIM1_PSCRL = 0x10;
	mov	0x52c2+0, #0x10
;	test.c: 80: TIM1_EGR = 1; // generate UE
	mov	0x52b8+0, #0x01
;	test.c: 82: TIM1_SR1 = 0; // Reset events
	mov	0x52b6+0, #0x00
;	test.c: 84: TIM1_IER = TIM_IER_UIE; // update interrupt enable
	mov	0x52b5+0, #0x01
;	test.c: 85: TIM1_CR1 = TIM_CR1_OPM; // up, one pulse
	mov	0x52b0+0, #0x08
	ret
;	test.c: 89: void enableIdleTimer(void) {
;	-----------------------------------------
;	 function enableIdleTimer
;	-----------------------------------------
_enableIdleTimer:
;	test.c: 91: CLK_PCKENR1 |= 3; // enable clocks
	ldw	x, #0x50c3
	ld	a, (x)
	or	a, #0x03
	ld	(x), a
;	test.c: 94: TIM2_ARRH = 7813 >> 8;
	mov	0x525f+0, #0x1e
;	test.c: 95: TIM2_ARRL = 7813 & 0xff;
	mov	0x5260+0, #0x85
;	test.c: 97: TIM2_PSCR = 7;
	mov	0x525e+0, #0x07
;	test.c: 100: TIM2_EGR = 1; // generate UE
	mov	0x5258+0, #0x01
;	test.c: 101: TIM2_SR1 = 0; // Reset events
	mov	0x5256+0, #0x00
;	test.c: 103: TIM3_IER = TIM_IER_UIE;
	mov	0x5285+0, #0x01
;	test.c: 110: TIM2_CR2 = TIM_CR2_MMS(2);
	mov	0x5251+0, #0x20
;	test.c: 122: TIM3_SMCR = TIM_SMCR_MSM | TIM_SMCR_TS(3) | TIM_SMCR_SMS(7);
	mov	0x5282+0, #0xb7
;	test.c: 126: TIM3_ARRH = 0;
	mov	0x528f+0, #0x00
;	test.c: 127: TIM3_ARRL = 5; // 5 s period
	mov	0x5290+0, #0x05
;	test.c: 129: TIM3_CR1 |= TIM_CR1_OPM;
	ldw	x, #0x5280
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	test.c: 131: TIM2_CR1 |= TIM_CR1_CEN;
	bset	0x5250, #0
;	test.c: 132: TIM3_CR1 |= TIM_CR1_CEN;
	bset	0x5280, #0
;	test.c: 133: idleTimerRunning = 1;
	mov	_idleTimerRunning+0, #0x01
;	test.c: 134: CFG_GCR &= ~CFG_GCR_AL; // normal activation level
	ldw	x, #0x7f60
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
	ret
;	test.c: 138: void keepIdleTimer(void) {
;	-----------------------------------------
;	 function keepIdleTimer
;	-----------------------------------------
_keepIdleTimer:
;	test.c: 139: if (!idleTimerRunning)
	tnz	_idleTimerRunning+0
	jrne	00102$
;	test.c: 140: enableIdleTimer();
	call	_enableIdleTimer
00102$:
;	test.c: 141: TIM3_IER = 0;
	mov	0x5285+0, #0x00
;	test.c: 142: TIM3_CNTRH = 0;
	mov	0x528c+0, #0x00
;	test.c: 143: TIM3_CNTRL = 0;
	mov	0x528d+0, #0x00
;	test.c: 144: TIM2_CNTRH = 0;
	mov	0x525c+0, #0x00
;	test.c: 145: TIM2_CNTRL = 0;
	mov	0x525d+0, #0x00
;	test.c: 146: TIM3_SR1 = 0;
	mov	0x5286+0, #0x00
;	test.c: 147: TIM3_IER = TIM_IER_UIE;
	mov	0x5285+0, #0x01
	ret
;	test.c: 150: void disableIdleTimer(void) {
;	-----------------------------------------
;	 function disableIdleTimer
;	-----------------------------------------
_disableIdleTimer:
;	test.c: 151: TIM2_CR1 &= ~TIM_CR1_CEN;
	bres	0x5250, #0
;	test.c: 152: TIM3_CR1 &= ~TIM_CR1_CEN;
	bres	0x5280, #0
;	test.c: 154: CLK_PCKENR1 &= ~3; // disable clocks
	ldw	x, #0x50c3
	ld	a, (x)
	and	a, #0xfc
	ld	(x), a
;	test.c: 155: idleTimerRunning = 0;
	clr	_idleTimerRunning+0
	ret
;	test.c: 158: int main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #2
;	test.c: 160: CLK_PCKENR2 = 0; // disable boot ROM clock
	mov	0x50c4+0, #0x00
;	test.c: 161: CLK_ICKR |= 1 << 4; // SAHALT, power regulator is off in HALT mode
	ldw	x, #0x50c2
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	test.c: 164: PE_DDR = 0x80; // output
	mov	0x5016+0, #0x80
;	test.c: 165: PE_CR1 = 0x80; // push-pull
	mov	0x5017+0, #0x80
;	test.c: 167: PC_DDR |= 0x80; // output
	bset	0x500c, #7
;	test.c: 168: PC_CR1 |= 0x80; // push-pull
	bset	0x500d, #7
;	test.c: 170: PC_CR2 |= 0x02; // interrupt
	ldw	x, #0x500e
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	test.c: 171: PC_CR1 |= 0x02; // pull-up
	ldw	x, #0x500d
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	test.c: 173: EXTI_CR1 = (3) << 2; // any edge
	mov	0x50a0+0, #0x0c
;	test.c: 175: rim(); // enable interrupts
	rim 
;	test.c: 177: while (1) {
00106$:
;	test.c: 178: if (idleTimerRunning || isSleeping)
	tnz	_idleTimerRunning+0
	jrne	00101$
	tnz	_isSleeping+0
	jreq	00102$
00101$:
;	test.c: 179: wfi();
	wfi 
	jra	00106$
00102$:
;	test.c: 181: CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
	ldw	x, #0x7f60
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	test.c: 182: halt();
	halt 
	jra	00106$
;	test.c: 194: return 0;
	addw	sp, #2
	ret
	.area CODE
	.area INITIALIZER
__xinit__firstEvent:
	.db #0x01	;  1
__xinit__isSleeping:
	.db #0x00	;  0
__xinit__idleTimerRunning:
	.db #0x00	;  0
	.area CABS (ABS)
