;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.3 #9233 (May 15 2015) (Mac OS X i386)
; This file was generated Sun May 24 18:19:11 2015
;--------------------------------------------------------
	.module useless
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _enableIdleTimer
	.globl _setupTimer
	.globl _automata
	.globl _error
	.globl _motorStop
	.globl _motorBackward
	.globl _motorForward
	.globl _startSleep
	.globl _tim3
	.globl _tim1
	.globl _exti5
	.globl _exti0
	.globl _isIdleTimerRunning
	.globl _isSleeping
	.globl _firstEvent
	.globl _irritationCount
	.globl _getSwitchState
	.globl _getStopState
	.globl _setMotor
	.globl _switchHandler
	.globl _stopHandler
	.globl _sleepHandler
	.globl _keepIdleTimer
	.globl _disableIdleTimer
	.globl _getDelayForward
	.globl _getDelayBackward
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_irritationCount::
	.ds 2
_state:
	.ds 1
_firstEvent::
	.ds 1
_isSleeping::
	.ds 1
_isIdleTimerRunning::
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
;	useless.c: 31: void exti0(void) __interrupt(8) {
;	-----------------------------------------
;	 function exti0
;	-----------------------------------------
_exti0:
;	useless.c: 33: EXTI_SR1 |= 1 << 0;
	bset	0x50a3, #0
;	useless.c: 35: stopHandler();
	call	_stopHandler
	iret
;	useless.c: 38: void exti5(void) __interrupt(13) {
;	-----------------------------------------
;	 function exti5
;	-----------------------------------------
_exti5:
;	useless.c: 40: EXTI_SR1 |= 1 << 5;
	ldw	x, #0x50a3
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	useless.c: 42: switchHandler();
	call	_switchHandler
	iret
;	useless.c: 47: void tim1(void) __interrupt(23) {
;	-----------------------------------------
;	 function tim1
;	-----------------------------------------
_tim1:
;	useless.c: 48: if (TIM1_SR1 & TIM_SR1_UIF) {
	ldw	x, #0x52b6
	ld	a, (x)
	srl	a
	jrnc	00106$
;	useless.c: 49: if (firstEvent && !isSleeping) { // discard first event
	tnz	_firstEvent+0
	jreq	00102$
	tnz	_isSleeping+0
	jrne	00102$
;	useless.c: 50: firstEvent = 0;
	clr	_firstEvent+0
	jra	00106$
00102$:
;	useless.c: 52: isSleeping = 0;
	clr	_isSleeping+0
;	useless.c: 53: sleepHandler();
	call	_sleepHandler
00106$:
;	useless.c: 57: TIM1_SR1 = 0;
	mov	0x52b6+0, #0x00
	iret
;	useless.c: 60: void tim3(void) __interrupt(21) {
;	-----------------------------------------
;	 function tim3
;	-----------------------------------------
_tim3:
;	useless.c: 61: TIM3_SR1 = 0;
	mov	0x5286+0, #0x00
;	useless.c: 62: disableIdleTimer();
	call	_disableIdleTimer
	iret
;	useless.c: 65: void startSleep(unsigned short period) { // units are 10 ms
;	-----------------------------------------
;	 function startSleep
;	-----------------------------------------
_startSleep:
	sub	sp, #2
;	useless.c: 66: if (isSleeping) {
	tnz	_isSleeping+0
;	useless.c: 67: return; // Already sleeping. ???
	jrne	00103$
;	useless.c: 69: CFG_GCR &= ~CFG_GCR_AL; // disable interrupt-only activation level
	ldw	x, #0x7f60
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
;	useless.c: 71: TIM1_ARRH = period >> 8;
	ld	a, (0x05, sp)
	clr	(0x01, sp)
	ldw	x, #0x52c3
	ld	(x), a
;	useless.c: 72: TIM1_ARRL = period & 0xff;
	ld	a, (0x06, sp)
	ld	xh, a
	clr	a
	ld	a, xh
	ldw	x, #0x52c4
	ld	(x), a
;	useless.c: 74: isSleeping = 1;
	mov	_isSleeping+0, #0x01
;	useless.c: 75: TIM1_CR1 |= TIM_CR1_CEN;
	ldw	x, #0x52b0
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
00103$:
	addw	sp, #2
	ret
;	useless.c: 78: int getSwitchState(void) { // 1 is on (need to switch off)
;	-----------------------------------------
;	 function getSwitchState
;	-----------------------------------------
_getSwitchState:
;	useless.c: 79: return (PE_IDR & (1 << 5)) == 0;
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
;	useless.c: 82: int getStopState(void) { // 1 is on (pusher is parked)
;	-----------------------------------------
;	 function getStopState
;	-----------------------------------------
_getStopState:
;	useless.c: 83: return PE_IDR & (1 << 0);
	ldw	x, #0x5015
	ld	a, (x)
	and	a, #0x01
	clrw	x
	ld	xl, a
	ret
;	useless.c: 86: void motorForward(void) {
;	-----------------------------------------
;	 function motorForward
;	-----------------------------------------
_motorForward:
;	useless.c: 87: PB_ODR &= ~MOTOR_A;
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
;	useless.c: 88: PB_ODR |= MOTOR_B;
	bset	0x5005, #0
	ret
;	useless.c: 91: void motorBackward(void) {
;	-----------------------------------------
;	 function motorBackward
;	-----------------------------------------
_motorBackward:
;	useless.c: 92: PB_ODR &= ~MOTOR_B;
	bres	0x5005, #0
;	useless.c: 93: PB_ODR |= MOTOR_A;
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	ret
;	useless.c: 96: void motorStop(void) {
;	-----------------------------------------
;	 function motorStop
;	-----------------------------------------
_motorStop:
;	useless.c: 97: PB_ODR &= ~(MOTOR_A | MOTOR_B);
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xfc
	ld	(x), a
	ret
;	useless.c: 101: void setMotor(void) {
;	-----------------------------------------
;	 function setMotor
;	-----------------------------------------
_setMotor:
;	useless.c: 102: switch (state) {
	ld	a, _state+0
	cp	a, #0x04
	jrugt	00106$
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (#00115$, x)
	jp	(x)
00115$:
	.dw	#00103$
	.dw	#00104$
	.dw	#00101$
	.dw	#00105$
	.dw	#00102$
;	useless.c: 103: case FORWARD:
00101$:
;	useless.c: 104: motorForward();
	call	_motorForward
;	useless.c: 105: break;
	jra	00108$
;	useless.c: 106: case BACKWARD:
00102$:
;	useless.c: 107: motorBackward();
	call	_motorBackward
;	useless.c: 108: break;
	jra	00108$
;	useless.c: 109: case IDLE:
00103$:
;	useless.c: 110: case WAIT_FORWARD:
00104$:
;	useless.c: 111: case WAIT_BACKWARD:
00105$:
;	useless.c: 112: motorStop();
	call	_motorStop
;	useless.c: 113: break;
	jra	00108$
;	useless.c: 114: default:
00106$:
;	useless.c: 115: motorStop();
	call	_motorStop
;	useless.c: 116: state = IDLE;
	clr	_state+0
;	useless.c: 118: }
00108$:
	ret
;	useless.c: 121: void error(void) {
;	-----------------------------------------
;	 function error
;	-----------------------------------------
_error:
;	useless.c: 122: state = IDLE;
	clr	_state+0
;	useless.c: 123: return;
	ret
;	useless.c: 127: void automata(int justWokeUp) {
;	-----------------------------------------
;	 function automata
;	-----------------------------------------
_automata:
	sub	sp, #4
;	useless.c: 128: int switchState = getSwitchState(); // 1 is need to switch off
	call	_getSwitchState
	ldw	(0x03, sp), x
;	useless.c: 129: int stopState = getStopState(); // 1 is parked
	call	_getStopState
	ldw	(0x01, sp), x
;	useless.c: 130: keepIdleTimer();
	call	_keepIdleTimer
;	useless.c: 131: switch (state) {
	ld	a, _state+0
	cp	a, #0x04
	jrule	00172$
	jp	00128$
00172$:
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (#00173$, x)
	jp	(x)
00173$:
	.dw	#00101$
	.dw	#00104$
	.dw	#00113$
	.dw	#00116$
	.dw	#00123$
;	useless.c: 132: case IDLE:
00101$:
;	useless.c: 133: if (switchState) {
	ldw	x, (0x03, sp)
	jreq	00129$
;	useless.c: 134: startSleep(getDelayForward());
	call	_getDelayForward
	pushw	x
	call	_startSleep
	addw	sp, #2
;	useless.c: 135: state = WAIT_FORWARD;
	mov	_state+0, #0x01
;	useless.c: 137: break;
	jra	00129$
;	useless.c: 138: case WAIT_FORWARD:
00104$:
;	useless.c: 139: if (justWokeUp) {
	ldw	x, (0x07, sp)
	jreq	00111$
;	useless.c: 140: if (!switchState) {
	ldw	x, (0x03, sp)
	jrne	00106$
;	useless.c: 141: state = IDLE;
	clr	_state+0
	jra	00129$
00106$:
;	useless.c: 143: state = FORWARD;
	mov	_state+0, #0x02
	jra	00129$
00111$:
;	useless.c: 146: if (!switchState) {
	ldw	x, (0x03, sp)
	jrne	00129$
;	useless.c: 147: state = IDLE;
	clr	_state+0
;	useless.c: 150: break;
	jra	00129$
;	useless.c: 151: case FORWARD:
00113$:
;	useless.c: 152: if (!switchState) {
	ldw	x, (0x03, sp)
	jrne	00129$
;	useless.c: 153: startSleep(getDelayBackward());
	call	_getDelayBackward
	pushw	x
	call	_startSleep
	addw	sp, #2
;	useless.c: 154: state = WAIT_BACKWARD;
	mov	_state+0, #0x03
;	useless.c: 158: break;
	jra	00129$
;	useless.c: 159: case WAIT_BACKWARD:
00116$:
;	useless.c: 160: if (justWokeUp) {
	ldw	x, (0x07, sp)
	jreq	00121$
;	useless.c: 161: state = BACKWARD;
	mov	_state+0, #0x04
	jra	00123$
00121$:
;	useless.c: 163: if (stopState) {
	ldw	x, (0x01, sp)
	jreq	00118$
;	useless.c: 164: state = IDLE;
	clr	_state+0
	jra	00129$
00118$:
;	useless.c: 166: state = BACKWARD;
	mov	_state+0, #0x04
;	useless.c: 168: break;
	jra	00129$
;	useless.c: 170: case BACKWARD:
00123$:
;	useless.c: 171: if (stopState) {
	ldw	x, (0x01, sp)
	jreq	00125$
;	useless.c: 172: state = IDLE;
	clr	_state+0
00125$:
;	useless.c: 174: if (switchState) {
	ldw	x, (0x03, sp)
	jreq	00129$
;	useless.c: 177: state = FORWARD;
	mov	_state+0, #0x02
;	useless.c: 179: break;
	jra	00129$
;	useless.c: 180: default:
00128$:
;	useless.c: 181: state = IDLE;
	clr	_state+0
;	useless.c: 183: }
00129$:
;	useless.c: 184: setMotor();
	call	_setMotor
	addw	sp, #4
	ret
;	useless.c: 187: void switchHandler(void) {
;	-----------------------------------------
;	 function switchHandler
;	-----------------------------------------
_switchHandler:
;	useless.c: 188: if (getSwitchState())
	call	_getSwitchState
	tnzw	x
	jreq	00102$
;	useless.c: 189: irritationCount += 1;
	ldw	x, _irritationCount+0
	incw	x
	ldw	_irritationCount+0, x
00102$:
;	useless.c: 190: automata(0);
	clrw	x
	pushw	x
	call	_automata
	addw	sp, #2
	ret
;	useless.c: 193: void stopHandler(void) {
;	-----------------------------------------
;	 function stopHandler
;	-----------------------------------------
_stopHandler:
;	useless.c: 194: automata(0);
	clrw	x
	pushw	x
	call	_automata
	addw	sp, #2
	ret
;	useless.c: 197: void sleepHandler() {
;	-----------------------------------------
;	 function sleepHandler
;	-----------------------------------------
_sleepHandler:
;	useless.c: 198: automata(1);
	push	#0x01
	push	#0x00
	call	_automata
	addw	sp, #2
	ret
;	useless.c: 213: void setupTimer(void) {
;	-----------------------------------------
;	 function setupTimer
;	-----------------------------------------
_setupTimer:
;	useless.c: 214: CLK_PCKENR2 |= 1 << 1; // enable timer clock
	ldw	x, #0x50c4
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	useless.c: 217: TIM1_PSCRH = 0x27;
	mov	0x52c1+0, #0x27
;	useless.c: 218: TIM1_PSCRL = 0x10;
	mov	0x52c2+0, #0x10
;	useless.c: 221: TIM1_EGR = 1; // generate UE
	mov	0x52b8+0, #0x01
;	useless.c: 223: TIM1_SR1 = 0; // Reset events
	mov	0x52b6+0, #0x00
;	useless.c: 225: TIM1_IER = TIM_IER_UIE; // update interrupt enable
	mov	0x52b5+0, #0x01
;	useless.c: 226: TIM1_CR1 = TIM_CR1_OPM; // up, one pulse
	mov	0x52b0+0, #0x08
	ret
;	useless.c: 230: void enableIdleTimer(void) {
;	-----------------------------------------
;	 function enableIdleTimer
;	-----------------------------------------
_enableIdleTimer:
;	useless.c: 232: CLK_PCKENR1 |= 3; // enable clocks
	ldw	x, #0x50c3
	ld	a, (x)
	or	a, #0x03
	ld	(x), a
;	useless.c: 235: TIM2_ARRH = 7813 >> 8;
	mov	0x525f+0, #0x1e
;	useless.c: 236: TIM2_ARRL = 7813 & 0xff;
	mov	0x5260+0, #0x85
;	useless.c: 238: TIM2_PSCR = 7;
	mov	0x525e+0, #0x07
;	useless.c: 241: TIM2_EGR = 1; // generate UE
	mov	0x5258+0, #0x01
;	useless.c: 242: TIM2_SR1 = 0; // Reset events
	mov	0x5256+0, #0x00
;	useless.c: 244: TIM3_IER = TIM_IER_UIE;
	mov	0x5285+0, #0x01
;	useless.c: 251: TIM2_CR2 = TIM_CR2_MMS(2);
	mov	0x5251+0, #0x20
;	useless.c: 263: TIM3_SMCR = TIM_SMCR_MSM | TIM_SMCR_TS(3) | TIM_SMCR_SMS(7);
	mov	0x5282+0, #0xb7
;	useless.c: 267: TIM3_ARRH = 0;
	mov	0x528f+0, #0x00
;	useless.c: 268: TIM3_ARRL = 60; // 60 s period
	mov	0x5290+0, #0x3c
;	useless.c: 270: TIM3_CR1 |= TIM_CR1_OPM;
	ldw	x, #0x5280
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	useless.c: 272: TIM2_CR1 |= TIM_CR1_CEN;
	bset	0x5250, #0
;	useless.c: 273: TIM3_CR1 |= TIM_CR1_CEN;
	bset	0x5280, #0
;	useless.c: 274: isIdleTimerRunning = 1;
	mov	_isIdleTimerRunning+0, #0x01
;	useless.c: 275: CFG_GCR &= ~CFG_GCR_AL; // normal activation level
	ldw	x, #0x7f60
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
	ret
;	useless.c: 279: void keepIdleTimer(void) {
;	-----------------------------------------
;	 function keepIdleTimer
;	-----------------------------------------
_keepIdleTimer:
;	useless.c: 280: if (!isIdleTimerRunning)
	tnz	_isIdleTimerRunning+0
	jrne	00102$
;	useless.c: 281: enableIdleTimer();
	call	_enableIdleTimer
00102$:
;	useless.c: 282: TIM3_IER = 0;
	mov	0x5285+0, #0x00
;	useless.c: 283: TIM3_CNTRH = 0;
	mov	0x528c+0, #0x00
;	useless.c: 284: TIM3_CNTRL = 0;
	mov	0x528d+0, #0x00
;	useless.c: 285: TIM2_CNTRH = 0;
	mov	0x525c+0, #0x00
;	useless.c: 286: TIM2_CNTRL = 0;
	mov	0x525d+0, #0x00
;	useless.c: 287: TIM3_SR1 = 0;
	mov	0x5286+0, #0x00
;	useless.c: 288: TIM3_IER = TIM_IER_UIE;
	mov	0x5285+0, #0x01
	ret
;	useless.c: 291: void disableIdleTimer(void) {
;	-----------------------------------------
;	 function disableIdleTimer
;	-----------------------------------------
_disableIdleTimer:
;	useless.c: 292: TIM2_CR1 &= ~TIM_CR1_CEN;
	bres	0x5250, #0
;	useless.c: 293: TIM3_CR1 &= ~TIM_CR1_CEN;
	bres	0x5280, #0
;	useless.c: 295: CLK_PCKENR1 &= ~3; // disable clocks
	ldw	x, #0x50c3
	ld	a, (x)
	and	a, #0xfc
	ld	(x), a
;	useless.c: 296: isIdleTimerRunning = 0;
	clr	_isIdleTimerRunning+0
;	useless.c: 297: irritationCount = 0;
	clrw	x
	ldw	_irritationCount+0, x
	ret
;	useless.c: 300: short getDelayForward(void) {
;	-----------------------------------------
;	 function getDelayForward
;	-----------------------------------------
_getDelayForward:
;	useless.c: 301: if (irritationCount < 3) {
	ldw	x, _irritationCount+0
	cpw	x, #0x0003
	jrsge	00105$
;	useless.c: 302: return 100;
	ldw	x, #0x0064
	jra	00107$
00105$:
;	useless.c: 303: } else if (irritationCount < 10) {
	ldw	x, _irritationCount+0
	cpw	x, #0x000a
	jrsge	00102$
;	useless.c: 304: return 10;
	ldw	x, #0x000a
	jra	00107$
00102$:
;	useless.c: 306: return 1000;
	ldw	x, #0x03e8
00107$:
	ret
;	useless.c: 310: short getDelayBackward(void) {
;	-----------------------------------------
;	 function getDelayBackward
;	-----------------------------------------
_getDelayBackward:
;	useless.c: 311: if (irritationCount < 3) {
	ldw	x, _irritationCount+0
	cpw	x, #0x0003
	jrsge	00108$
;	useless.c: 312: return 10;
	ldw	x, #0x000a
	jra	00110$
00108$:
;	useless.c: 313: } else if (irritationCount < 10) {
	ldw	x, _irritationCount+0
	cpw	x, #0x000a
	jrsge	00105$
;	useless.c: 314: return 200;
	ldw	x, #0x00c8
	jra	00110$
00105$:
;	useless.c: 315: } else if (irritationCount < 20) {
	ldw	x, _irritationCount+0
	cpw	x, #0x0014
	jrsge	00102$
;	useless.c: 316: return 10;
	ldw	x, #0x000a
	jra	00110$
00102$:
;	useless.c: 318: return 1000;
	ldw	x, #0x03e8
00110$:
	ret
;	useless.c: 322: int main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	useless.c: 323: CLK_PCKENR2 = 0; // disable boot ROM clock
	mov	0x50c4+0, #0x00
;	useless.c: 327: PA_CR1 = 0xFF; // pull-up
	mov	0x5003+0, #0xff
;	useless.c: 328: PB_CR1 = 0xFF; // pull-up
	mov	0x5008+0, #0xff
;	useless.c: 329: PC_CR1 = 0xFF; // pull-up
	mov	0x500d+0, #0xff
;	useless.c: 330: PD_CR1 = 0xFF; // pull-up
	mov	0x5012+0, #0xff
;	useless.c: 331: PE_CR1 = 0xFF; // pull-up
	mov	0x5017+0, #0xff
;	useless.c: 332: PF_CR1 = 0x01; // pull-up
	mov	0x501c+0, #0x01
;	useless.c: 335: PB_DDR |= MOTOR_A | MOTOR_B; // output
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x03
	ld	(x), a
;	useless.c: 341: PE_CR2 |= (1 << 0) | (1 << 5); // interrupt
	ldw	x, #0x5018
	ld	a, (x)
	or	a, #0x21
	ld	(x), a
;	useless.c: 344: EXTI_CR1 = (3) << 0; // any edge on bit 0
	mov	0x50a0+0, #0x03
;	useless.c: 345: EXTI_CR2 = (3) << 2; // any edge on bit 5
	mov	0x50a1+0, #0x0c
;	useless.c: 347: state = IDLE;
	clr	_state+0
;	useless.c: 348: setupTimer();
	call	_setupTimer
;	useless.c: 349: automata(0);
	clrw	x
	pushw	x
	call	_automata
	addw	sp, #2
;	useless.c: 350: rim(); // enable interrupts
	rim 
;	useless.c: 351: while (1) {
00106$:
;	useless.c: 352: if (isSleeping || isIdleTimerRunning) {
	tnz	_isSleeping+0
	jrne	00101$
	tnz	_isIdleTimerRunning+0
	jreq	00102$
00101$:
;	useless.c: 353: wfi();
	wfi 
	jra	00106$
00102$:
;	useless.c: 355: CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
	ldw	x, #0x7f60
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	useless.c: 356: halt();
	halt 
	jra	00106$
;	useless.c: 359: return 0;
	ret
	.area CODE
	.area INITIALIZER
__xinit__irritationCount:
	.dw #0x0000
__xinit__state:
	.db #0x00	; 0
__xinit__firstEvent:
	.db #0x01	;  1
__xinit__isSleeping:
	.db #0x00	;  0
__xinit__isIdleTimerRunning:
	.db #0x00	;  0
	.area CABS (ABS)
