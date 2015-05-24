                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.3 #9233 (May 15 2015) (Mac OS X i386)
                                      4 ; This file was generated Sun May 24 18:19:11 2015
                                      5 ;--------------------------------------------------------
                                      6 	.module useless
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _enableIdleTimer
                                     14 	.globl _setupTimer
                                     15 	.globl _automata
                                     16 	.globl _error
                                     17 	.globl _motorStop
                                     18 	.globl _motorBackward
                                     19 	.globl _motorForward
                                     20 	.globl _startSleep
                                     21 	.globl _tim3
                                     22 	.globl _tim1
                                     23 	.globl _exti5
                                     24 	.globl _exti0
                                     25 	.globl _isIdleTimerRunning
                                     26 	.globl _isSleeping
                                     27 	.globl _firstEvent
                                     28 	.globl _irritationCount
                                     29 	.globl _getSwitchState
                                     30 	.globl _getStopState
                                     31 	.globl _setMotor
                                     32 	.globl _switchHandler
                                     33 	.globl _stopHandler
                                     34 	.globl _sleepHandler
                                     35 	.globl _keepIdleTimer
                                     36 	.globl _disableIdleTimer
                                     37 	.globl _getDelayForward
                                     38 	.globl _getDelayBackward
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DATA
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area INITIALIZED
      000001                         47 _irritationCount::
      000001                         48 	.ds 2
      000003                         49 _state:
      000003                         50 	.ds 1
      000004                         51 _firstEvent::
      000004                         52 	.ds 1
      000005                         53 _isSleeping::
      000005                         54 	.ds 1
      000006                         55 _isIdleTimerRunning::
      000006                         56 	.ds 1
                                     57 ;--------------------------------------------------------
                                     58 ; Stack segment in internal ram 
                                     59 ;--------------------------------------------------------
                                     60 	.area	SSEG
      000007                         61 __start__stack:
      000007                         62 	.ds	1
                                     63 
                                     64 ;--------------------------------------------------------
                                     65 ; absolute external ram data
                                     66 ;--------------------------------------------------------
                                     67 	.area DABS (ABS)
                                     68 ;--------------------------------------------------------
                                     69 ; interrupt vector 
                                     70 ;--------------------------------------------------------
                                     71 	.area HOME
      008000                         72 __interrupt_vect:
      008000 82 00 80 83             73 	int s_GSINIT ;reset
      008004 82 00 00 00             74 	int 0x0000 ;trap
      008008 82 00 00 00             75 	int 0x0000 ;int0
      00800C 82 00 00 00             76 	int 0x0000 ;int1
      008010 82 00 00 00             77 	int 0x0000 ;int2
      008014 82 00 00 00             78 	int 0x0000 ;int3
      008018 82 00 00 00             79 	int 0x0000 ;int4
      00801C 82 00 00 00             80 	int 0x0000 ;int5
      008020 82 00 00 00             81 	int 0x0000 ;int6
      008024 82 00 00 00             82 	int 0x0000 ;int7
      008028 82 00 80 A0             83 	int _exti0 ;int8
      00802C 82 00 00 00             84 	int 0x0000 ;int9
      008030 82 00 00 00             85 	int 0x0000 ;int10
      008034 82 00 00 00             86 	int 0x0000 ;int11
      008038 82 00 00 00             87 	int 0x0000 ;int12
      00803C 82 00 80 A8             88 	int _exti5 ;int13
      008040 82 00 00 00             89 	int 0x0000 ;int14
      008044 82 00 00 00             90 	int 0x0000 ;int15
      008048 82 00 00 00             91 	int 0x0000 ;int16
      00804C 82 00 00 00             92 	int 0x0000 ;int17
      008050 82 00 00 00             93 	int 0x0000 ;int18
      008054 82 00 00 00             94 	int 0x0000 ;int19
      008058 82 00 00 00             95 	int 0x0000 ;int20
      00805C 82 00 80 D8             96 	int _tim3 ;int21
      008060 82 00 00 00             97 	int 0x0000 ;int22
      008064 82 00 80 B3             98 	int _tim1 ;int23
      008068 82 00 00 00             99 	int 0x0000 ;int24
      00806C 82 00 00 00            100 	int 0x0000 ;int25
      008070 82 00 00 00            101 	int 0x0000 ;int26
      008074 82 00 00 00            102 	int 0x0000 ;int27
      008078 82 00 00 00            103 	int 0x0000 ;int28
      00807C 82 00 00 00            104 	int 0x0000 ;int29
                                    105 ;--------------------------------------------------------
                                    106 ; global & static initialisations
                                    107 ;--------------------------------------------------------
                                    108 	.area HOME
                                    109 	.area GSINIT
                                    110 	.area GSFINAL
                                    111 	.area GSINIT
      008083                        112 __sdcc_gs_init_startup:
      008083                        113 __sdcc_init_data:
                                    114 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]  115 	ldw x, #l_DATA
      008086 27 07            [ 1]  116 	jreq	00002$
      008088                        117 00001$:
      008088 72 4F 00 00      [ 1]  118 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  119 	decw x
      00808D 26 F9            [ 1]  120 	jrne	00001$
      00808F                        121 00002$:
      00808F AE 00 06         [ 2]  122 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  123 	jreq	00004$
      008094                        124 00003$:
      008094 D6 83 96         [ 1]  125 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]  126 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  127 	decw	x
      00809B 26 F7            [ 1]  128 	jrne	00003$
      00809D                        129 00004$:
                                    130 ; stm8_genXINIT() end
                                    131 	.area GSFINAL
      00809D CC 80 80         [ 2]  132 	jp	__sdcc_program_startup
                                    133 ;--------------------------------------------------------
                                    134 ; Home
                                    135 ;--------------------------------------------------------
                                    136 	.area HOME
                                    137 	.area HOME
      008080                        138 __sdcc_program_startup:
      008080 CC 83 3C         [ 2]  139 	jp	_main
                                    140 ;	return from main will return to caller
                                    141 ;--------------------------------------------------------
                                    142 ; code
                                    143 ;--------------------------------------------------------
                                    144 	.area CODE
                                    145 ;	useless.c: 31: void exti0(void) __interrupt(8) {
                                    146 ;	-----------------------------------------
                                    147 ;	 function exti0
                                    148 ;	-----------------------------------------
      0080A0                        149 _exti0:
                                    150 ;	useless.c: 33: EXTI_SR1 |= 1 << 0;
      0080A0 72 10 50 A3      [ 1]  151 	bset	0x50a3, #0
                                    152 ;	useless.c: 35: stopHandler();
      0080A4 CD 82 39         [ 4]  153 	call	_stopHandler
      0080A7 80               [11]  154 	iret
                                    155 ;	useless.c: 38: void exti5(void) __interrupt(13) {
                                    156 ;	-----------------------------------------
                                    157 ;	 function exti5
                                    158 ;	-----------------------------------------
      0080A8                        159 _exti5:
                                    160 ;	useless.c: 40: EXTI_SR1 |= 1 << 5;
      0080A8 AE 50 A3         [ 2]  161 	ldw	x, #0x50a3
      0080AB F6               [ 1]  162 	ld	a, (x)
      0080AC AA 20            [ 1]  163 	or	a, #0x20
      0080AE F7               [ 1]  164 	ld	(x), a
                                    165 ;	useless.c: 42: switchHandler();
      0080AF CD 82 24         [ 4]  166 	call	_switchHandler
      0080B2 80               [11]  167 	iret
                                    168 ;	useless.c: 47: void tim1(void) __interrupt(23) {
                                    169 ;	-----------------------------------------
                                    170 ;	 function tim1
                                    171 ;	-----------------------------------------
      0080B3                        172 _tim1:
                                    173 ;	useless.c: 48: if (TIM1_SR1 & TIM_SR1_UIF) {
      0080B3 AE 52 B6         [ 2]  174 	ldw	x, #0x52b6
      0080B6 F6               [ 1]  175 	ld	a, (x)
      0080B7 44               [ 1]  176 	srl	a
      0080B8 24 19            [ 1]  177 	jrnc	00106$
                                    178 ;	useless.c: 49: if (firstEvent && !isSleeping) { // discard first event
      0080BA 72 5D 00 04      [ 1]  179 	tnz	_firstEvent+0
      0080BE 27 0C            [ 1]  180 	jreq	00102$
      0080C0 72 5D 00 05      [ 1]  181 	tnz	_isSleeping+0
      0080C4 26 06            [ 1]  182 	jrne	00102$
                                    183 ;	useless.c: 50: firstEvent = 0;
      0080C6 72 5F 00 04      [ 1]  184 	clr	_firstEvent+0
      0080CA 20 07            [ 2]  185 	jra	00106$
      0080CC                        186 00102$:
                                    187 ;	useless.c: 52: isSleeping = 0;
      0080CC 72 5F 00 05      [ 1]  188 	clr	_isSleeping+0
                                    189 ;	useless.c: 53: sleepHandler();
      0080D0 CD 82 41         [ 4]  190 	call	_sleepHandler
      0080D3                        191 00106$:
                                    192 ;	useless.c: 57: TIM1_SR1 = 0;
      0080D3 35 00 52 B6      [ 1]  193 	mov	0x52b6+0, #0x00
      0080D7 80               [11]  194 	iret
                                    195 ;	useless.c: 60: void tim3(void) __interrupt(21) {
                                    196 ;	-----------------------------------------
                                    197 ;	 function tim3
                                    198 ;	-----------------------------------------
      0080D8                        199 _tim3:
                                    200 ;	useless.c: 61: TIM3_SR1 = 0;
      0080D8 35 00 52 86      [ 1]  201 	mov	0x5286+0, #0x00
                                    202 ;	useless.c: 62: disableIdleTimer();
      0080DC CD 82 DB         [ 4]  203 	call	_disableIdleTimer
      0080DF 80               [11]  204 	iret
                                    205 ;	useless.c: 65: void startSleep(unsigned short period) { // units are 10 ms
                                    206 ;	-----------------------------------------
                                    207 ;	 function startSleep
                                    208 ;	-----------------------------------------
      0080E0                        209 _startSleep:
      0080E0 52 02            [ 2]  210 	sub	sp, #2
                                    211 ;	useless.c: 66: if (isSleeping) {
      0080E2 72 5D 00 05      [ 1]  212 	tnz	_isSleeping+0
                                    213 ;	useless.c: 67: return; // Already sleeping. ???
      0080E6 26 23            [ 1]  214 	jrne	00103$
                                    215 ;	useless.c: 69: CFG_GCR &= ~CFG_GCR_AL; // disable interrupt-only activation level
      0080E8 AE 7F 60         [ 2]  216 	ldw	x, #0x7f60
      0080EB F6               [ 1]  217 	ld	a, (x)
      0080EC A4 FD            [ 1]  218 	and	a, #0xfd
      0080EE F7               [ 1]  219 	ld	(x), a
                                    220 ;	useless.c: 71: TIM1_ARRH = period >> 8;
      0080EF 7B 05            [ 1]  221 	ld	a, (0x05, sp)
      0080F1 0F 01            [ 1]  222 	clr	(0x01, sp)
      0080F3 AE 52 C3         [ 2]  223 	ldw	x, #0x52c3
      0080F6 F7               [ 1]  224 	ld	(x), a
                                    225 ;	useless.c: 72: TIM1_ARRL = period & 0xff;
      0080F7 7B 06            [ 1]  226 	ld	a, (0x06, sp)
      0080F9 95               [ 1]  227 	ld	xh, a
      0080FA 4F               [ 1]  228 	clr	a
      0080FB 9E               [ 1]  229 	ld	a, xh
      0080FC AE 52 C4         [ 2]  230 	ldw	x, #0x52c4
      0080FF F7               [ 1]  231 	ld	(x), a
                                    232 ;	useless.c: 74: isSleeping = 1;
      008100 35 01 00 05      [ 1]  233 	mov	_isSleeping+0, #0x01
                                    234 ;	useless.c: 75: TIM1_CR1 |= TIM_CR1_CEN;
      008104 AE 52 B0         [ 2]  235 	ldw	x, #0x52b0
      008107 F6               [ 1]  236 	ld	a, (x)
      008108 AA 01            [ 1]  237 	or	a, #0x01
      00810A F7               [ 1]  238 	ld	(x), a
      00810B                        239 00103$:
      00810B 5B 02            [ 2]  240 	addw	sp, #2
      00810D 81               [ 4]  241 	ret
                                    242 ;	useless.c: 78: int getSwitchState(void) { // 1 is on (need to switch off)
                                    243 ;	-----------------------------------------
                                    244 ;	 function getSwitchState
                                    245 ;	-----------------------------------------
      00810E                        246 _getSwitchState:
                                    247 ;	useless.c: 79: return (PE_IDR & (1 << 5)) == 0;
      00810E AE 50 15         [ 2]  248 	ldw	x, #0x5015
      008111 F6               [ 1]  249 	ld	a, (x)
      008112 A4 20            [ 1]  250 	and	a, #0x20
      008114 A1 00            [ 1]  251 	cp	a, #0x00
      008116 26 03            [ 1]  252 	jrne	00104$
      008118 A6 01            [ 1]  253 	ld	a, #0x01
      00811A 21                     254 	.byte 0x21
      00811B                        255 00104$:
      00811B 4F               [ 1]  256 	clr	a
      00811C                        257 00105$:
      00811C 97               [ 1]  258 	ld	xl, a
      00811D 49               [ 1]  259 	rlc	a
      00811E 4F               [ 1]  260 	clr	a
      00811F A2 00            [ 1]  261 	sbc	a, #0x00
      008121 95               [ 1]  262 	ld	xh, a
      008122 81               [ 4]  263 	ret
                                    264 ;	useless.c: 82: int getStopState(void) { // 1 is on (pusher is parked)
                                    265 ;	-----------------------------------------
                                    266 ;	 function getStopState
                                    267 ;	-----------------------------------------
      008123                        268 _getStopState:
                                    269 ;	useless.c: 83: return PE_IDR & (1 << 0);
      008123 AE 50 15         [ 2]  270 	ldw	x, #0x5015
      008126 F6               [ 1]  271 	ld	a, (x)
      008127 A4 01            [ 1]  272 	and	a, #0x01
      008129 5F               [ 1]  273 	clrw	x
      00812A 97               [ 1]  274 	ld	xl, a
      00812B 81               [ 4]  275 	ret
                                    276 ;	useless.c: 86: void motorForward(void) {
                                    277 ;	-----------------------------------------
                                    278 ;	 function motorForward
                                    279 ;	-----------------------------------------
      00812C                        280 _motorForward:
                                    281 ;	useless.c: 87: PB_ODR &= ~MOTOR_A;
      00812C AE 50 05         [ 2]  282 	ldw	x, #0x5005
      00812F F6               [ 1]  283 	ld	a, (x)
      008130 A4 FD            [ 1]  284 	and	a, #0xfd
      008132 F7               [ 1]  285 	ld	(x), a
                                    286 ;	useless.c: 88: PB_ODR |= MOTOR_B;
      008133 72 10 50 05      [ 1]  287 	bset	0x5005, #0
      008137 81               [ 4]  288 	ret
                                    289 ;	useless.c: 91: void motorBackward(void) {
                                    290 ;	-----------------------------------------
                                    291 ;	 function motorBackward
                                    292 ;	-----------------------------------------
      008138                        293 _motorBackward:
                                    294 ;	useless.c: 92: PB_ODR &= ~MOTOR_B;
      008138 72 11 50 05      [ 1]  295 	bres	0x5005, #0
                                    296 ;	useless.c: 93: PB_ODR |= MOTOR_A;
      00813C AE 50 05         [ 2]  297 	ldw	x, #0x5005
      00813F F6               [ 1]  298 	ld	a, (x)
      008140 AA 02            [ 1]  299 	or	a, #0x02
      008142 F7               [ 1]  300 	ld	(x), a
      008143 81               [ 4]  301 	ret
                                    302 ;	useless.c: 96: void motorStop(void) {
                                    303 ;	-----------------------------------------
                                    304 ;	 function motorStop
                                    305 ;	-----------------------------------------
      008144                        306 _motorStop:
                                    307 ;	useless.c: 97: PB_ODR &= ~(MOTOR_A | MOTOR_B);
      008144 AE 50 05         [ 2]  308 	ldw	x, #0x5005
      008147 F6               [ 1]  309 	ld	a, (x)
      008148 A4 FC            [ 1]  310 	and	a, #0xfc
      00814A F7               [ 1]  311 	ld	(x), a
      00814B 81               [ 4]  312 	ret
                                    313 ;	useless.c: 101: void setMotor(void) {
                                    314 ;	-----------------------------------------
                                    315 ;	 function setMotor
                                    316 ;	-----------------------------------------
      00814C                        317 _setMotor:
                                    318 ;	useless.c: 102: switch (state) {
      00814C C6 00 03         [ 1]  319 	ld	a, _state+0
      00814F A1 04            [ 1]  320 	cp	a, #0x04
      008151 22 20            [ 1]  321 	jrugt	00106$
      008153 5F               [ 1]  322 	clrw	x
      008154 97               [ 1]  323 	ld	xl, a
      008155 58               [ 2]  324 	sllw	x
      008156 DE 81 5A         [ 2]  325 	ldw	x, (#00115$, x)
      008159 FC               [ 2]  326 	jp	(x)
      00815A                        327 00115$:
      00815A 81 6E                  328 	.dw	#00103$
      00815C 81 6E                  329 	.dw	#00104$
      00815E 81 64                  330 	.dw	#00101$
      008160 81 6E                  331 	.dw	#00105$
      008162 81 69                  332 	.dw	#00102$
                                    333 ;	useless.c: 103: case FORWARD:
      008164                        334 00101$:
                                    335 ;	useless.c: 104: motorForward();
      008164 CD 81 2C         [ 4]  336 	call	_motorForward
                                    337 ;	useless.c: 105: break;
      008167 20 11            [ 2]  338 	jra	00108$
                                    339 ;	useless.c: 106: case BACKWARD:
      008169                        340 00102$:
                                    341 ;	useless.c: 107: motorBackward();
      008169 CD 81 38         [ 4]  342 	call	_motorBackward
                                    343 ;	useless.c: 108: break;
      00816C 20 0C            [ 2]  344 	jra	00108$
                                    345 ;	useless.c: 109: case IDLE:
      00816E                        346 00103$:
                                    347 ;	useless.c: 110: case WAIT_FORWARD:
      00816E                        348 00104$:
                                    349 ;	useless.c: 111: case WAIT_BACKWARD:
      00816E                        350 00105$:
                                    351 ;	useless.c: 112: motorStop();
      00816E CD 81 44         [ 4]  352 	call	_motorStop
                                    353 ;	useless.c: 113: break;
      008171 20 07            [ 2]  354 	jra	00108$
                                    355 ;	useless.c: 114: default:
      008173                        356 00106$:
                                    357 ;	useless.c: 115: motorStop();
      008173 CD 81 44         [ 4]  358 	call	_motorStop
                                    359 ;	useless.c: 116: state = IDLE;
      008176 72 5F 00 03      [ 1]  360 	clr	_state+0
                                    361 ;	useless.c: 118: }
      00817A                        362 00108$:
      00817A 81               [ 4]  363 	ret
                                    364 ;	useless.c: 121: void error(void) {
                                    365 ;	-----------------------------------------
                                    366 ;	 function error
                                    367 ;	-----------------------------------------
      00817B                        368 _error:
                                    369 ;	useless.c: 122: state = IDLE;
      00817B 72 5F 00 03      [ 1]  370 	clr	_state+0
                                    371 ;	useless.c: 123: return;
      00817F 81               [ 4]  372 	ret
                                    373 ;	useless.c: 127: void automata(int justWokeUp) {
                                    374 ;	-----------------------------------------
                                    375 ;	 function automata
                                    376 ;	-----------------------------------------
      008180                        377 _automata:
      008180 52 04            [ 2]  378 	sub	sp, #4
                                    379 ;	useless.c: 128: int switchState = getSwitchState(); // 1 is need to switch off
      008182 CD 81 0E         [ 4]  380 	call	_getSwitchState
      008185 1F 03            [ 2]  381 	ldw	(0x03, sp), x
                                    382 ;	useless.c: 129: int stopState = getStopState(); // 1 is parked
      008187 CD 81 23         [ 4]  383 	call	_getStopState
      00818A 1F 01            [ 2]  384 	ldw	(0x01, sp), x
                                    385 ;	useless.c: 130: keepIdleTimer();
      00818C CD 82 B5         [ 4]  386 	call	_keepIdleTimer
                                    387 ;	useless.c: 131: switch (state) {
      00818F C6 00 03         [ 1]  388 	ld	a, _state+0
      008192 A1 04            [ 1]  389 	cp	a, #0x04
      008194 23 03            [ 2]  390 	jrule	00172$
      008196 CC 82 1A         [ 2]  391 	jp	00128$
      008199                        392 00172$:
      008199 5F               [ 1]  393 	clrw	x
      00819A 97               [ 1]  394 	ld	xl, a
      00819B 58               [ 2]  395 	sllw	x
      00819C DE 81 A0         [ 2]  396 	ldw	x, (#00173$, x)
      00819F FC               [ 2]  397 	jp	(x)
      0081A0                        398 00173$:
      0081A0 81 AA                  399 	.dw	#00101$
      0081A2 81 BD                  400 	.dw	#00104$
      0081A4 81 DB                  401 	.dw	#00113$
      0081A6 81 EE                  402 	.dw	#00116$
      0081A8 82 08                  403 	.dw	#00123$
                                    404 ;	useless.c: 132: case IDLE:
      0081AA                        405 00101$:
                                    406 ;	useless.c: 133: if (switchState) {
      0081AA 1E 03            [ 2]  407 	ldw	x, (0x03, sp)
      0081AC 27 70            [ 1]  408 	jreq	00129$
                                    409 ;	useless.c: 134: startSleep(getDelayForward());
      0081AE CD 82 F3         [ 4]  410 	call	_getDelayForward
      0081B1 89               [ 2]  411 	pushw	x
      0081B2 CD 80 E0         [ 4]  412 	call	_startSleep
      0081B5 5B 02            [ 2]  413 	addw	sp, #2
                                    414 ;	useless.c: 135: state = WAIT_FORWARD;
      0081B7 35 01 00 03      [ 1]  415 	mov	_state+0, #0x01
                                    416 ;	useless.c: 137: break;
      0081BB 20 61            [ 2]  417 	jra	00129$
                                    418 ;	useless.c: 138: case WAIT_FORWARD:
      0081BD                        419 00104$:
                                    420 ;	useless.c: 139: if (justWokeUp) {
      0081BD 1E 07            [ 2]  421 	ldw	x, (0x07, sp)
      0081BF 27 10            [ 1]  422 	jreq	00111$
                                    423 ;	useless.c: 140: if (!switchState) {
      0081C1 1E 03            [ 2]  424 	ldw	x, (0x03, sp)
      0081C3 26 06            [ 1]  425 	jrne	00106$
                                    426 ;	useless.c: 141: state = IDLE;
      0081C5 72 5F 00 03      [ 1]  427 	clr	_state+0
      0081C9 20 53            [ 2]  428 	jra	00129$
      0081CB                        429 00106$:
                                    430 ;	useless.c: 143: state = FORWARD;
      0081CB 35 02 00 03      [ 1]  431 	mov	_state+0, #0x02
      0081CF 20 4D            [ 2]  432 	jra	00129$
      0081D1                        433 00111$:
                                    434 ;	useless.c: 146: if (!switchState) {
      0081D1 1E 03            [ 2]  435 	ldw	x, (0x03, sp)
      0081D3 26 49            [ 1]  436 	jrne	00129$
                                    437 ;	useless.c: 147: state = IDLE;
      0081D5 72 5F 00 03      [ 1]  438 	clr	_state+0
                                    439 ;	useless.c: 150: break;
      0081D9 20 43            [ 2]  440 	jra	00129$
                                    441 ;	useless.c: 151: case FORWARD:
      0081DB                        442 00113$:
                                    443 ;	useless.c: 152: if (!switchState) {
      0081DB 1E 03            [ 2]  444 	ldw	x, (0x03, sp)
      0081DD 26 3F            [ 1]  445 	jrne	00129$
                                    446 ;	useless.c: 153: startSleep(getDelayBackward());
      0081DF CD 83 11         [ 4]  447 	call	_getDelayBackward
      0081E2 89               [ 2]  448 	pushw	x
      0081E3 CD 80 E0         [ 4]  449 	call	_startSleep
      0081E6 5B 02            [ 2]  450 	addw	sp, #2
                                    451 ;	useless.c: 154: state = WAIT_BACKWARD;
      0081E8 35 03 00 03      [ 1]  452 	mov	_state+0, #0x03
                                    453 ;	useless.c: 158: break;
      0081EC 20 30            [ 2]  454 	jra	00129$
                                    455 ;	useless.c: 159: case WAIT_BACKWARD:
      0081EE                        456 00116$:
                                    457 ;	useless.c: 160: if (justWokeUp) {
      0081EE 1E 07            [ 2]  458 	ldw	x, (0x07, sp)
      0081F0 27 06            [ 1]  459 	jreq	00121$
                                    460 ;	useless.c: 161: state = BACKWARD;
      0081F2 35 04 00 03      [ 1]  461 	mov	_state+0, #0x04
      0081F6 20 10            [ 2]  462 	jra	00123$
      0081F8                        463 00121$:
                                    464 ;	useless.c: 163: if (stopState) {
      0081F8 1E 01            [ 2]  465 	ldw	x, (0x01, sp)
      0081FA 27 06            [ 1]  466 	jreq	00118$
                                    467 ;	useless.c: 164: state = IDLE;
      0081FC 72 5F 00 03      [ 1]  468 	clr	_state+0
      008200 20 1C            [ 2]  469 	jra	00129$
      008202                        470 00118$:
                                    471 ;	useless.c: 166: state = BACKWARD;
      008202 35 04 00 03      [ 1]  472 	mov	_state+0, #0x04
                                    473 ;	useless.c: 168: break;
      008206 20 16            [ 2]  474 	jra	00129$
                                    475 ;	useless.c: 170: case BACKWARD:
      008208                        476 00123$:
                                    477 ;	useless.c: 171: if (stopState) {
      008208 1E 01            [ 2]  478 	ldw	x, (0x01, sp)
      00820A 27 04            [ 1]  479 	jreq	00125$
                                    480 ;	useless.c: 172: state = IDLE;
      00820C 72 5F 00 03      [ 1]  481 	clr	_state+0
      008210                        482 00125$:
                                    483 ;	useless.c: 174: if (switchState) {
      008210 1E 03            [ 2]  484 	ldw	x, (0x03, sp)
      008212 27 0A            [ 1]  485 	jreq	00129$
                                    486 ;	useless.c: 177: state = FORWARD;
      008214 35 02 00 03      [ 1]  487 	mov	_state+0, #0x02
                                    488 ;	useless.c: 179: break;
      008218 20 04            [ 2]  489 	jra	00129$
                                    490 ;	useless.c: 180: default:
      00821A                        491 00128$:
                                    492 ;	useless.c: 181: state = IDLE;
      00821A 72 5F 00 03      [ 1]  493 	clr	_state+0
                                    494 ;	useless.c: 183: }
      00821E                        495 00129$:
                                    496 ;	useless.c: 184: setMotor();
      00821E CD 81 4C         [ 4]  497 	call	_setMotor
      008221 5B 04            [ 2]  498 	addw	sp, #4
      008223 81               [ 4]  499 	ret
                                    500 ;	useless.c: 187: void switchHandler(void) {
                                    501 ;	-----------------------------------------
                                    502 ;	 function switchHandler
                                    503 ;	-----------------------------------------
      008224                        504 _switchHandler:
                                    505 ;	useless.c: 188: if (getSwitchState())
      008224 CD 81 0E         [ 4]  506 	call	_getSwitchState
      008227 5D               [ 2]  507 	tnzw	x
      008228 27 07            [ 1]  508 	jreq	00102$
                                    509 ;	useless.c: 189: irritationCount += 1;
      00822A CE 00 01         [ 2]  510 	ldw	x, _irritationCount+0
      00822D 5C               [ 2]  511 	incw	x
      00822E CF 00 01         [ 2]  512 	ldw	_irritationCount+0, x
      008231                        513 00102$:
                                    514 ;	useless.c: 190: automata(0);
      008231 5F               [ 1]  515 	clrw	x
      008232 89               [ 2]  516 	pushw	x
      008233 CD 81 80         [ 4]  517 	call	_automata
      008236 5B 02            [ 2]  518 	addw	sp, #2
      008238 81               [ 4]  519 	ret
                                    520 ;	useless.c: 193: void stopHandler(void) {
                                    521 ;	-----------------------------------------
                                    522 ;	 function stopHandler
                                    523 ;	-----------------------------------------
      008239                        524 _stopHandler:
                                    525 ;	useless.c: 194: automata(0);
      008239 5F               [ 1]  526 	clrw	x
      00823A 89               [ 2]  527 	pushw	x
      00823B CD 81 80         [ 4]  528 	call	_automata
      00823E 5B 02            [ 2]  529 	addw	sp, #2
      008240 81               [ 4]  530 	ret
                                    531 ;	useless.c: 197: void sleepHandler() {
                                    532 ;	-----------------------------------------
                                    533 ;	 function sleepHandler
                                    534 ;	-----------------------------------------
      008241                        535 _sleepHandler:
                                    536 ;	useless.c: 198: automata(1);
      008241 4B 01            [ 1]  537 	push	#0x01
      008243 4B 00            [ 1]  538 	push	#0x00
      008245 CD 81 80         [ 4]  539 	call	_automata
      008248 5B 02            [ 2]  540 	addw	sp, #2
      00824A 81               [ 4]  541 	ret
                                    542 ;	useless.c: 213: void setupTimer(void) {
                                    543 ;	-----------------------------------------
                                    544 ;	 function setupTimer
                                    545 ;	-----------------------------------------
      00824B                        546 _setupTimer:
                                    547 ;	useless.c: 214: CLK_PCKENR2 |= 1 << 1; // enable timer clock
      00824B AE 50 C4         [ 2]  548 	ldw	x, #0x50c4
      00824E F6               [ 1]  549 	ld	a, (x)
      00824F AA 02            [ 1]  550 	or	a, #0x02
      008251 F7               [ 1]  551 	ld	(x), a
                                    552 ;	useless.c: 217: TIM1_PSCRH = 0x27;
      008252 35 27 52 C1      [ 1]  553 	mov	0x52c1+0, #0x27
                                    554 ;	useless.c: 218: TIM1_PSCRL = 0x10;
      008256 35 10 52 C2      [ 1]  555 	mov	0x52c2+0, #0x10
                                    556 ;	useless.c: 221: TIM1_EGR = 1; // generate UE
      00825A 35 01 52 B8      [ 1]  557 	mov	0x52b8+0, #0x01
                                    558 ;	useless.c: 223: TIM1_SR1 = 0; // Reset events
      00825E 35 00 52 B6      [ 1]  559 	mov	0x52b6+0, #0x00
                                    560 ;	useless.c: 225: TIM1_IER = TIM_IER_UIE; // update interrupt enable
      008262 35 01 52 B5      [ 1]  561 	mov	0x52b5+0, #0x01
                                    562 ;	useless.c: 226: TIM1_CR1 = TIM_CR1_OPM; // up, one pulse
      008266 35 08 52 B0      [ 1]  563 	mov	0x52b0+0, #0x08
      00826A 81               [ 4]  564 	ret
                                    565 ;	useless.c: 230: void enableIdleTimer(void) {
                                    566 ;	-----------------------------------------
                                    567 ;	 function enableIdleTimer
                                    568 ;	-----------------------------------------
      00826B                        569 _enableIdleTimer:
                                    570 ;	useless.c: 232: CLK_PCKENR1 |= 3; // enable clocks
      00826B AE 50 C3         [ 2]  571 	ldw	x, #0x50c3
      00826E F6               [ 1]  572 	ld	a, (x)
      00826F AA 03            [ 1]  573 	or	a, #0x03
      008271 F7               [ 1]  574 	ld	(x), a
                                    575 ;	useless.c: 235: TIM2_ARRH = 7813 >> 8;
      008272 35 1E 52 5F      [ 1]  576 	mov	0x525f+0, #0x1e
                                    577 ;	useless.c: 236: TIM2_ARRL = 7813 & 0xff;
      008276 35 85 52 60      [ 1]  578 	mov	0x5260+0, #0x85
                                    579 ;	useless.c: 238: TIM2_PSCR = 7;
      00827A 35 07 52 5E      [ 1]  580 	mov	0x525e+0, #0x07
                                    581 ;	useless.c: 241: TIM2_EGR = 1; // generate UE
      00827E 35 01 52 58      [ 1]  582 	mov	0x5258+0, #0x01
                                    583 ;	useless.c: 242: TIM2_SR1 = 0; // Reset events
      008282 35 00 52 56      [ 1]  584 	mov	0x5256+0, #0x00
                                    585 ;	useless.c: 244: TIM3_IER = TIM_IER_UIE;
      008286 35 01 52 85      [ 1]  586 	mov	0x5285+0, #0x01
                                    587 ;	useless.c: 251: TIM2_CR2 = TIM_CR2_MMS(2);
      00828A 35 20 52 51      [ 1]  588 	mov	0x5251+0, #0x20
                                    589 ;	useless.c: 263: TIM3_SMCR = TIM_SMCR_MSM | TIM_SMCR_TS(3) | TIM_SMCR_SMS(7);
      00828E 35 B7 52 82      [ 1]  590 	mov	0x5282+0, #0xb7
                                    591 ;	useless.c: 267: TIM3_ARRH = 0;
      008292 35 00 52 8F      [ 1]  592 	mov	0x528f+0, #0x00
                                    593 ;	useless.c: 268: TIM3_ARRL = 60; // 60 s period
      008296 35 3C 52 90      [ 1]  594 	mov	0x5290+0, #0x3c
                                    595 ;	useless.c: 270: TIM3_CR1 |= TIM_CR1_OPM;
      00829A AE 52 80         [ 2]  596 	ldw	x, #0x5280
      00829D F6               [ 1]  597 	ld	a, (x)
      00829E AA 08            [ 1]  598 	or	a, #0x08
      0082A0 F7               [ 1]  599 	ld	(x), a
                                    600 ;	useless.c: 272: TIM2_CR1 |= TIM_CR1_CEN;
      0082A1 72 10 52 50      [ 1]  601 	bset	0x5250, #0
                                    602 ;	useless.c: 273: TIM3_CR1 |= TIM_CR1_CEN;
      0082A5 72 10 52 80      [ 1]  603 	bset	0x5280, #0
                                    604 ;	useless.c: 274: isIdleTimerRunning = 1;
      0082A9 35 01 00 06      [ 1]  605 	mov	_isIdleTimerRunning+0, #0x01
                                    606 ;	useless.c: 275: CFG_GCR &= ~CFG_GCR_AL; // normal activation level
      0082AD AE 7F 60         [ 2]  607 	ldw	x, #0x7f60
      0082B0 F6               [ 1]  608 	ld	a, (x)
      0082B1 A4 FD            [ 1]  609 	and	a, #0xfd
      0082B3 F7               [ 1]  610 	ld	(x), a
      0082B4 81               [ 4]  611 	ret
                                    612 ;	useless.c: 279: void keepIdleTimer(void) {
                                    613 ;	-----------------------------------------
                                    614 ;	 function keepIdleTimer
                                    615 ;	-----------------------------------------
      0082B5                        616 _keepIdleTimer:
                                    617 ;	useless.c: 280: if (!isIdleTimerRunning)
      0082B5 72 5D 00 06      [ 1]  618 	tnz	_isIdleTimerRunning+0
      0082B9 26 03            [ 1]  619 	jrne	00102$
                                    620 ;	useless.c: 281: enableIdleTimer();
      0082BB CD 82 6B         [ 4]  621 	call	_enableIdleTimer
      0082BE                        622 00102$:
                                    623 ;	useless.c: 282: TIM3_IER = 0;
      0082BE 35 00 52 85      [ 1]  624 	mov	0x5285+0, #0x00
                                    625 ;	useless.c: 283: TIM3_CNTRH = 0;
      0082C2 35 00 52 8C      [ 1]  626 	mov	0x528c+0, #0x00
                                    627 ;	useless.c: 284: TIM3_CNTRL = 0;
      0082C6 35 00 52 8D      [ 1]  628 	mov	0x528d+0, #0x00
                                    629 ;	useless.c: 285: TIM2_CNTRH = 0;
      0082CA 35 00 52 5C      [ 1]  630 	mov	0x525c+0, #0x00
                                    631 ;	useless.c: 286: TIM2_CNTRL = 0;
      0082CE 35 00 52 5D      [ 1]  632 	mov	0x525d+0, #0x00
                                    633 ;	useless.c: 287: TIM3_SR1 = 0;
      0082D2 35 00 52 86      [ 1]  634 	mov	0x5286+0, #0x00
                                    635 ;	useless.c: 288: TIM3_IER = TIM_IER_UIE;
      0082D6 35 01 52 85      [ 1]  636 	mov	0x5285+0, #0x01
      0082DA 81               [ 4]  637 	ret
                                    638 ;	useless.c: 291: void disableIdleTimer(void) {
                                    639 ;	-----------------------------------------
                                    640 ;	 function disableIdleTimer
                                    641 ;	-----------------------------------------
      0082DB                        642 _disableIdleTimer:
                                    643 ;	useless.c: 292: TIM2_CR1 &= ~TIM_CR1_CEN;
      0082DB 72 11 52 50      [ 1]  644 	bres	0x5250, #0
                                    645 ;	useless.c: 293: TIM3_CR1 &= ~TIM_CR1_CEN;
      0082DF 72 11 52 80      [ 1]  646 	bres	0x5280, #0
                                    647 ;	useless.c: 295: CLK_PCKENR1 &= ~3; // disable clocks
      0082E3 AE 50 C3         [ 2]  648 	ldw	x, #0x50c3
      0082E6 F6               [ 1]  649 	ld	a, (x)
      0082E7 A4 FC            [ 1]  650 	and	a, #0xfc
      0082E9 F7               [ 1]  651 	ld	(x), a
                                    652 ;	useless.c: 296: isIdleTimerRunning = 0;
      0082EA 72 5F 00 06      [ 1]  653 	clr	_isIdleTimerRunning+0
                                    654 ;	useless.c: 297: irritationCount = 0;
      0082EE 5F               [ 1]  655 	clrw	x
      0082EF CF 00 01         [ 2]  656 	ldw	_irritationCount+0, x
      0082F2 81               [ 4]  657 	ret
                                    658 ;	useless.c: 300: short getDelayForward(void) {
                                    659 ;	-----------------------------------------
                                    660 ;	 function getDelayForward
                                    661 ;	-----------------------------------------
      0082F3                        662 _getDelayForward:
                                    663 ;	useless.c: 301: if (irritationCount < 3) {
      0082F3 CE 00 01         [ 2]  664 	ldw	x, _irritationCount+0
      0082F6 A3 00 03         [ 2]  665 	cpw	x, #0x0003
      0082F9 2E 05            [ 1]  666 	jrsge	00105$
                                    667 ;	useless.c: 302: return 100;
      0082FB AE 00 64         [ 2]  668 	ldw	x, #0x0064
      0082FE 20 10            [ 2]  669 	jra	00107$
      008300                        670 00105$:
                                    671 ;	useless.c: 303: } else if (irritationCount < 10) {
      008300 CE 00 01         [ 2]  672 	ldw	x, _irritationCount+0
      008303 A3 00 0A         [ 2]  673 	cpw	x, #0x000a
      008306 2E 05            [ 1]  674 	jrsge	00102$
                                    675 ;	useless.c: 304: return 10;
      008308 AE 00 0A         [ 2]  676 	ldw	x, #0x000a
      00830B 20 03            [ 2]  677 	jra	00107$
      00830D                        678 00102$:
                                    679 ;	useless.c: 306: return 1000;
      00830D AE 03 E8         [ 2]  680 	ldw	x, #0x03e8
      008310                        681 00107$:
      008310 81               [ 4]  682 	ret
                                    683 ;	useless.c: 310: short getDelayBackward(void) {
                                    684 ;	-----------------------------------------
                                    685 ;	 function getDelayBackward
                                    686 ;	-----------------------------------------
      008311                        687 _getDelayBackward:
                                    688 ;	useless.c: 311: if (irritationCount < 3) {
      008311 CE 00 01         [ 2]  689 	ldw	x, _irritationCount+0
      008314 A3 00 03         [ 2]  690 	cpw	x, #0x0003
      008317 2E 05            [ 1]  691 	jrsge	00108$
                                    692 ;	useless.c: 312: return 10;
      008319 AE 00 0A         [ 2]  693 	ldw	x, #0x000a
      00831C 20 1D            [ 2]  694 	jra	00110$
      00831E                        695 00108$:
                                    696 ;	useless.c: 313: } else if (irritationCount < 10) {
      00831E CE 00 01         [ 2]  697 	ldw	x, _irritationCount+0
      008321 A3 00 0A         [ 2]  698 	cpw	x, #0x000a
      008324 2E 05            [ 1]  699 	jrsge	00105$
                                    700 ;	useless.c: 314: return 200;
      008326 AE 00 C8         [ 2]  701 	ldw	x, #0x00c8
      008329 20 10            [ 2]  702 	jra	00110$
      00832B                        703 00105$:
                                    704 ;	useless.c: 315: } else if (irritationCount < 20) {
      00832B CE 00 01         [ 2]  705 	ldw	x, _irritationCount+0
      00832E A3 00 14         [ 2]  706 	cpw	x, #0x0014
      008331 2E 05            [ 1]  707 	jrsge	00102$
                                    708 ;	useless.c: 316: return 10;
      008333 AE 00 0A         [ 2]  709 	ldw	x, #0x000a
      008336 20 03            [ 2]  710 	jra	00110$
      008338                        711 00102$:
                                    712 ;	useless.c: 318: return 1000;
      008338 AE 03 E8         [ 2]  713 	ldw	x, #0x03e8
      00833B                        714 00110$:
      00833B 81               [ 4]  715 	ret
                                    716 ;	useless.c: 322: int main(void) {
                                    717 ;	-----------------------------------------
                                    718 ;	 function main
                                    719 ;	-----------------------------------------
      00833C                        720 _main:
                                    721 ;	useless.c: 323: CLK_PCKENR2 = 0; // disable boot ROM clock
      00833C 35 00 50 C4      [ 1]  722 	mov	0x50c4+0, #0x00
                                    723 ;	useless.c: 327: PA_CR1 = 0xFF; // pull-up
      008340 35 FF 50 03      [ 1]  724 	mov	0x5003+0, #0xff
                                    725 ;	useless.c: 328: PB_CR1 = 0xFF; // pull-up
      008344 35 FF 50 08      [ 1]  726 	mov	0x5008+0, #0xff
                                    727 ;	useless.c: 329: PC_CR1 = 0xFF; // pull-up
      008348 35 FF 50 0D      [ 1]  728 	mov	0x500d+0, #0xff
                                    729 ;	useless.c: 330: PD_CR1 = 0xFF; // pull-up
      00834C 35 FF 50 12      [ 1]  730 	mov	0x5012+0, #0xff
                                    731 ;	useless.c: 331: PE_CR1 = 0xFF; // pull-up
      008350 35 FF 50 17      [ 1]  732 	mov	0x5017+0, #0xff
                                    733 ;	useless.c: 332: PF_CR1 = 0x01; // pull-up
      008354 35 01 50 1C      [ 1]  734 	mov	0x501c+0, #0x01
                                    735 ;	useless.c: 335: PB_DDR |= MOTOR_A | MOTOR_B; // output
      008358 AE 50 07         [ 2]  736 	ldw	x, #0x5007
      00835B F6               [ 1]  737 	ld	a, (x)
      00835C AA 03            [ 1]  738 	or	a, #0x03
      00835E F7               [ 1]  739 	ld	(x), a
                                    740 ;	useless.c: 341: PE_CR2 |= (1 << 0) | (1 << 5); // interrupt
      00835F AE 50 18         [ 2]  741 	ldw	x, #0x5018
      008362 F6               [ 1]  742 	ld	a, (x)
      008363 AA 21            [ 1]  743 	or	a, #0x21
      008365 F7               [ 1]  744 	ld	(x), a
                                    745 ;	useless.c: 344: EXTI_CR1 = (3) << 0; // any edge on bit 0
      008366 35 03 50 A0      [ 1]  746 	mov	0x50a0+0, #0x03
                                    747 ;	useless.c: 345: EXTI_CR2 = (3) << 2; // any edge on bit 5
      00836A 35 0C 50 A1      [ 1]  748 	mov	0x50a1+0, #0x0c
                                    749 ;	useless.c: 347: state = IDLE;
      00836E 72 5F 00 03      [ 1]  750 	clr	_state+0
                                    751 ;	useless.c: 348: setupTimer();
      008372 CD 82 4B         [ 4]  752 	call	_setupTimer
                                    753 ;	useless.c: 349: automata(0);
      008375 5F               [ 1]  754 	clrw	x
      008376 89               [ 2]  755 	pushw	x
      008377 CD 81 80         [ 4]  756 	call	_automata
      00837A 5B 02            [ 2]  757 	addw	sp, #2
                                    758 ;	useless.c: 350: rim(); // enable interrupts
      00837C 9A               [ 1]  759 	rim 
                                    760 ;	useless.c: 351: while (1) {
      00837D                        761 00106$:
                                    762 ;	useless.c: 352: if (isSleeping || isIdleTimerRunning) {
      00837D 72 5D 00 05      [ 1]  763 	tnz	_isSleeping+0
      008381 26 06            [ 1]  764 	jrne	00101$
      008383 72 5D 00 06      [ 1]  765 	tnz	_isIdleTimerRunning+0
      008387 27 03            [ 1]  766 	jreq	00102$
      008389                        767 00101$:
                                    768 ;	useless.c: 353: wfi();
      008389 8F               [10]  769 	wfi 
      00838A 20 F1            [ 2]  770 	jra	00106$
      00838C                        771 00102$:
                                    772 ;	useless.c: 355: CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
      00838C AE 7F 60         [ 2]  773 	ldw	x, #0x7f60
      00838F F6               [ 1]  774 	ld	a, (x)
      008390 AA 02            [ 1]  775 	or	a, #0x02
      008392 F7               [ 1]  776 	ld	(x), a
                                    777 ;	useless.c: 356: halt();
      008393 8E               [10]  778 	halt 
      008394 20 E7            [ 2]  779 	jra	00106$
                                    780 ;	useless.c: 359: return 0;
      008396 81               [ 4]  781 	ret
                                    782 	.area CODE
                                    783 	.area INITIALIZER
      008397                        784 __xinit__irritationCount:
      008397 00 00                  785 	.dw #0x0000
      008399                        786 __xinit__state:
      008399 00                     787 	.db #0x00	; 0
      00839A                        788 __xinit__firstEvent:
      00839A 01                     789 	.db #0x01	;  1
      00839B                        790 __xinit__isSleeping:
      00839B 00                     791 	.db #0x00	;  0
      00839C                        792 __xinit__isIdleTimerRunning:
      00839C 00                     793 	.db #0x00	;  0
                                    794 	.area CABS (ABS)
