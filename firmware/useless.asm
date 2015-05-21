;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9233 (May 15 2015) (Mac OS X i386)
; This file was generated Wed May 20 22:05:16 2015
;--------------------------------------------------------
	.module useless
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _error
	.globl _exti5
	.globl _exti0
	.globl _getSwitchState
	.globl _getStopState
	.globl _setMotor
	.globl _switchHandler
	.globl _stopHandler
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_state:
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
	int 0x0000 ;int9
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
;	useless.c: 20: void exti0(void) __interrupt(8) {
;	-----------------------------------------
;	 function exti0
;	-----------------------------------------
_exti0:
;	useless.c: 22: EXTI_SR1 |= 1 << 0;
	bset	0x50a3, #0
;	useless.c: 27: stopHandler();
	call	_stopHandler
	iret
;	useless.c: 30: void exti5(void) __interrupt(13) {
;	-----------------------------------------
;	 function exti5
;	-----------------------------------------
_exti5:
;	useless.c: 32: EXTI_SR1 |= 1 << 5;
	ldw	x, #0x50a3
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	useless.c: 41: switchHandler();
	call	_switchHandler
	iret
;	useless.c: 44: int getSwitchState(void) { // 1 is on (need to switch off)
;	-----------------------------------------
;	 function getSwitchState
;	-----------------------------------------
_getSwitchState:
;	useless.c: 45: return (PE_IDR & (1 << 5)) == 0;
	ldw	x, #0x5015
	ld	a, (x)
	and	a, #0x20
	cp	a, #0x00
	jrne	00104$
	ld	a, #0x01
	.byte 0x21
00104$:
	clr	a
00105$:
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	ret
;	useless.c: 48: int getStopState(void) { // 1 is on (pusher is parked)
;	-----------------------------------------
;	 function getStopState
;	-----------------------------------------
_getStopState:
;	useless.c: 49: return PE_IDR & (1 << 0);
	ldw	x, #0x5015
	ld	a, (x)
	and	a, #0x01
	clrw	x
	ld	xl, a
	ret
;	useless.c: 53: void setMotor(void) {
;	-----------------------------------------
;	 function setMotor
;	-----------------------------------------
_setMotor:
;	useless.c: 54: switch (state) {
	ld	a, _state+0
	ld	xh, a
;	useless.c: 56: PB_ODR &= ~MOTOR_A;
	ldw	y, #0x5005
	push	a
	ld	a, (y)
	ld	xl, a
	pop	a
;	useless.c: 54: switch (state) {
	cp	a, #0x00
	jreq	00104$
	ld	a, xh
	cp	a, #0x01
	jreq	00101$
	ld	a, xh
	cp	a, #0x02
	jreq	00102$
	jra	00104$
;	useless.c: 55: case FORWARD:
00101$:
;	useless.c: 56: PB_ODR &= ~MOTOR_A;
	ld	a, xl
	and	a, #0xfd
	ldw	x, #0x5005
	ld	(x), a
;	useless.c: 57: PB_ODR |= MOTOR_B;
	bset	0x5005, #0
;	useless.c: 58: break;
	jra	00106$
;	useless.c: 59: case BACKWARD:
00102$:
;	useless.c: 60: PB_ODR &= ~MOTOR_B;
	ld	a, xl
	and	a, #0xfe
	ldw	x, #0x5005
	ld	(x), a
;	useless.c: 61: PB_ODR |= MOTOR_A;
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	useless.c: 62: break;
	jra	00106$
;	useless.c: 64: default:
00104$:
;	useless.c: 65: PB_ODR &= ~(MOTOR_A | MOTOR_B);
	ld	a, xl
	and	a, #0xfc
	ldw	x, #0x5005
	ld	(x), a
;	useless.c: 66: state = IDLE;
	clr	_state+0
;	useless.c: 68: }
00106$:
	ret
;	useless.c: 71: void error(void) {
;	-----------------------------------------
;	 function error
;	-----------------------------------------
_error:
;	useless.c: 72: state = IDLE;
	clr	_state+0
;	useless.c: 73: return;
	ret
;	useless.c: 77: void switchHandler(void) {
;	-----------------------------------------
;	 function switchHandler
;	-----------------------------------------
_switchHandler:
;	useless.c: 79: if (getSwitchState()) { // on
	call	_getSwitchState
	tnzw	x
	jreq	00112$
;	useless.c: 80: switch (state) {
	ld	a, _state+0
;	useless.c: 86: state = FORWARD;
	mov	_state+0, #0x01
;	useless.c: 88: }
	jra	00113$
00112$:
;	useless.c: 90: switch (state) {
	ld	a, _state+0
	ld	xh, a
	cp	a, #0x00
	jreq	00113$
	ld	a, xh
	cp	a, #0x01
	jreq	00107$
	ld	a, xh
	cp	a, #0x02
	jreq	00113$
	jra	00109$
;	useless.c: 94: case FORWARD:
00107$:
;	useless.c: 96: state = BACKWARD;
	mov	_state+0, #0x02
;	useless.c: 97: break;
	jra	00113$
;	useless.c: 101: default:
00109$:
;	useless.c: 102: state = IDLE;
	clr	_state+0
;	useless.c: 104: }
00113$:
;	useless.c: 106: setMotor();
	jp	_setMotor
;	useless.c: 109: void stopHandler(void) {
;	-----------------------------------------
;	 function stopHandler
;	-----------------------------------------
_stopHandler:
;	useless.c: 111: if (getStopState()) { // parked
	call	_getStopState
	tnzw	x
	jreq	00112$
;	useless.c: 112: switch (state) {
	ld	a, _state+0
	ld	xh, a
	cp	a, #0x00
	jreq	00113$
	ld	a, xh
	cp	a, #0x01
	jreq	00102$
	ld	a, xh
	cp	a, #0x02
	jreq	00103$
	jra	00104$
;	useless.c: 116: case FORWARD:
00102$:
;	useless.c: 118: error();
	call	_error
;	useless.c: 119: break;
	jra	00113$
;	useless.c: 120: case BACKWARD:
00103$:
;	useless.c: 122: state = IDLE;
	clr	_state+0
;	useless.c: 123: break;
	jra	00113$
;	useless.c: 124: default:
00104$:
;	useless.c: 125: state = IDLE;
	clr	_state+0
;	useless.c: 127: }
	jra	00113$
00112$:
;	useless.c: 129: switch (state) {
	ld	a, _state+0
	ld	xh, a
	cp	a, #0x00
	jreq	00113$
	ld	a, xh
	cp	a, #0x01
	jreq	00113$
	ld	a, xh
	cp	a, #0x02
	jreq	00113$
;	useless.c: 140: state = BACKWARD;
	mov	_state+0, #0x02
;	useless.c: 142: }
00113$:
;	useless.c: 144: switchHandler(); // switch has higher priority and calls setMotor()
	jp	_switchHandler
;	useless.c: 156: int main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	useless.c: 157: CLK_PCKENR2 = 0; // disable boot ROM clock
	mov	0x50c4+0, #0x00
;	useless.c: 161: PA_CR1 = 0xFF; // pull-up
	mov	0x5003+0, #0xff
;	useless.c: 162: PB_CR1 = 0xFF; // pull-up
	mov	0x5008+0, #0xff
;	useless.c: 163: PC_CR1 = 0xFF; // pull-up
	mov	0x500d+0, #0xff
;	useless.c: 164: PD_CR1 = 0xFF; // pull-up
	mov	0x5012+0, #0xff
;	useless.c: 165: PE_CR1 = 0xFF; // pull-up
	mov	0x5017+0, #0xff
;	useless.c: 166: PF_CR1 = 0x01; // pull-up
	mov	0x501c+0, #0x01
;	useless.c: 169: PB_DDR |= MOTOR_A | MOTOR_B; // output
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x03
	ld	(x), a
;	useless.c: 175: PE_CR2 |= (1 << 0) | (1 << 5); // interrupt
	ldw	x, #0x5018
	ld	a, (x)
	or	a, #0x21
	ld	(x), a
;	useless.c: 178: EXTI_CR1 = (3) << 0; // any edge on bit 0
	mov	0x50a0+0, #0x03
;	useless.c: 179: EXTI_CR2 = (3) << 2; // any edge on bit 5
	mov	0x50a1+0, #0x0c
;	useless.c: 181: state = IDLE;
	clr	_state+0
;	useless.c: 182: setMotor();
	call	_setMotor
;	useless.c: 184: rim(); // enable interrupts
	rim 
;	useless.c: 186: CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
	ldw	x, #0x7f60
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	useless.c: 187: halt();
	halt 
;	useless.c: 188: return 0;
	clrw	x
	ret
	.area CODE
	.area INITIALIZER
__xinit__state:
	.db #0x00	; 0
	.area CABS (ABS)
