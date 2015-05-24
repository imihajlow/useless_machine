                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.3 #9233 (May 15 2015) (Mac OS X i386)
                                      4 ; This file was generated Sun May 24 17:37:25 2015
                                      5 ;--------------------------------------------------------
                                      6 	.module test
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _enableIdleTimer
                                     14 	.globl _setupTimer
                                     15 	.globl _tim3
                                     16 	.globl _tim1
                                     17 	.globl _onSleepEnded
                                     18 	.globl _exti5
                                     19 	.globl _exti1
                                     20 	.globl _exti0
                                     21 	.globl _idleTimerRunning
                                     22 	.globl _isSleeping
                                     23 	.globl _firstEvent
                                     24 	.globl _startSleep
                                     25 	.globl _keepIdleTimer
                                     26 	.globl _disableIdleTimer
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area INITIALIZED
      000001                         35 _firstEvent::
      000001                         36 	.ds 1
      000002                         37 _isSleeping::
      000002                         38 	.ds 1
      000003                         39 _idleTimerRunning::
      000003                         40 	.ds 1
                                     41 ;--------------------------------------------------------
                                     42 ; Stack segment in internal ram 
                                     43 ;--------------------------------------------------------
                                     44 	.area	SSEG
      000004                         45 __start__stack:
      000004                         46 	.ds	1
                                     47 
                                     48 ;--------------------------------------------------------
                                     49 ; absolute external ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area DABS (ABS)
                                     52 ;--------------------------------------------------------
                                     53 ; interrupt vector 
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
      008000                         56 __interrupt_vect:
      008000 82 00 80 83             57 	int s_GSINIT ;reset
      008004 82 00 00 00             58 	int 0x0000 ;trap
      008008 82 00 00 00             59 	int 0x0000 ;int0
      00800C 82 00 00 00             60 	int 0x0000 ;int1
      008010 82 00 00 00             61 	int 0x0000 ;int2
      008014 82 00 00 00             62 	int 0x0000 ;int3
      008018 82 00 00 00             63 	int 0x0000 ;int4
      00801C 82 00 00 00             64 	int 0x0000 ;int5
      008020 82 00 00 00             65 	int 0x0000 ;int6
      008024 82 00 00 00             66 	int 0x0000 ;int7
      008028 82 00 80 A0             67 	int _exti0 ;int8
      00802C 82 00 80 A1             68 	int _exti1 ;int9
      008030 82 00 00 00             69 	int 0x0000 ;int10
      008034 82 00 00 00             70 	int 0x0000 ;int11
      008038 82 00 00 00             71 	int 0x0000 ;int12
      00803C 82 00 80 B7             72 	int _exti5 ;int13
      008040 82 00 00 00             73 	int 0x0000 ;int14
      008044 82 00 00 00             74 	int 0x0000 ;int15
      008048 82 00 00 00             75 	int 0x0000 ;int16
      00804C 82 00 00 00             76 	int 0x0000 ;int17
      008050 82 00 00 00             77 	int 0x0000 ;int18
      008054 82 00 00 00             78 	int 0x0000 ;int19
      008058 82 00 00 00             79 	int 0x0000 ;int20
      00805C 82 00 80 D8             80 	int _tim3 ;int21
      008060 82 00 00 00             81 	int 0x0000 ;int22
      008064 82 00 80 B9             82 	int _tim1 ;int23
      008068 82 00 00 00             83 	int 0x0000 ;int24
      00806C 82 00 00 00             84 	int 0x0000 ;int25
      008070 82 00 00 00             85 	int 0x0000 ;int26
      008074 82 00 00 00             86 	int 0x0000 ;int27
      008078 82 00 00 00             87 	int 0x0000 ;int28
      00807C 82 00 00 00             88 	int 0x0000 ;int29
                                     89 ;--------------------------------------------------------
                                     90 ; global & static initialisations
                                     91 ;--------------------------------------------------------
                                     92 	.area HOME
                                     93 	.area GSINIT
                                     94 	.area GSFINAL
                                     95 	.area GSINIT
      008083                         96 __sdcc_gs_init_startup:
      008083                         97 __sdcc_init_data:
                                     98 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]   99 	ldw x, #l_DATA
      008086 27 07            [ 1]  100 	jreq	00002$
      008088                        101 00001$:
      008088 72 4F 00 00      [ 1]  102 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  103 	decw x
      00808D 26 F9            [ 1]  104 	jrne	00001$
      00808F                        105 00002$:
      00808F AE 00 03         [ 2]  106 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  107 	jreq	00004$
      008094                        108 00003$:
      008094 D6 82 01         [ 1]  109 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]  110 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  111 	decw	x
      00809B 26 F7            [ 1]  112 	jrne	00003$
      00809D                        113 00004$:
                                    114 ; stm8_genXINIT() end
                                    115 	.area GSFINAL
      00809D CC 80 80         [ 2]  116 	jp	__sdcc_program_startup
                                    117 ;--------------------------------------------------------
                                    118 ; Home
                                    119 ;--------------------------------------------------------
                                    120 	.area HOME
                                    121 	.area HOME
      008080                        122 __sdcc_program_startup:
      008080 CC 81 B6         [ 2]  123 	jp	_main
                                    124 ;	return from main will return to caller
                                    125 ;--------------------------------------------------------
                                    126 ; code
                                    127 ;--------------------------------------------------------
                                    128 	.area CODE
                                    129 ;	test.c: 7: void exti0(void) __interrupt(8) {
                                    130 ;	-----------------------------------------
                                    131 ;	 function exti0
                                    132 ;	-----------------------------------------
      0080A0                        133 _exti0:
                                    134 ;	test.c: 9: }
      0080A0 80               [11]  135 	iret
                                    136 ;	test.c: 11: void exti1(void) __interrupt(9) {
                                    137 ;	-----------------------------------------
                                    138 ;	 function exti1
                                    139 ;	-----------------------------------------
      0080A1                        140 _exti1:
                                    141 ;	test.c: 13: PE_ODR ^= 0x80;
      0080A1 AE 50 14         [ 2]  142 	ldw	x, #0x5014
      0080A4 F6               [ 1]  143 	ld	a, (x)
      0080A5 A8 80            [ 1]  144 	xor	a, #0x80
      0080A7 F7               [ 1]  145 	ld	(x), a
                                    146 ;	test.c: 14: keepIdleTimer();
      0080A8 CD 81 7C         [ 4]  147 	call	_keepIdleTimer
                                    148 ;	test.c: 15: PC_ODR |= 0x80;
      0080AB 72 1E 50 0A      [ 1]  149 	bset	0x500a, #7
                                    150 ;	test.c: 16: EXTI_SR1 |= 2;
      0080AF AE 50 A3         [ 2]  151 	ldw	x, #0x50a3
      0080B2 F6               [ 1]  152 	ld	a, (x)
      0080B3 AA 02            [ 1]  153 	or	a, #0x02
      0080B5 F7               [ 1]  154 	ld	(x), a
      0080B6 80               [11]  155 	iret
                                    156 ;	test.c: 19: void exti5(void) __interrupt(13) {
                                    157 ;	-----------------------------------------
                                    158 ;	 function exti5
                                    159 ;	-----------------------------------------
      0080B7                        160 _exti5:
                                    161 ;	test.c: 21: }
      0080B7 80               [11]  162 	iret
                                    163 ;	test.c: 23: void onSleepEnded(void) {
                                    164 ;	-----------------------------------------
                                    165 ;	 function onSleepEnded
                                    166 ;	-----------------------------------------
      0080B8                        167 _onSleepEnded:
                                    168 ;	test.c: 24: }
      0080B8 81               [ 4]  169 	ret
                                    170 ;	test.c: 28: void tim1(void) __interrupt(23) {
                                    171 ;	-----------------------------------------
                                    172 ;	 function tim1
                                    173 ;	-----------------------------------------
      0080B9                        174 _tim1:
                                    175 ;	test.c: 29: if (TIM1_SR1 & TIM_SR1_UIF) {
      0080B9 AE 52 B6         [ 2]  176 	ldw	x, #0x52b6
      0080BC F6               [ 1]  177 	ld	a, (x)
      0080BD 44               [ 1]  178 	srl	a
      0080BE 24 13            [ 1]  179 	jrnc	00105$
                                    180 ;	test.c: 30: if (firstEvent) { // discard first event
      0080C0 72 5D 00 01      [ 1]  181 	tnz	_firstEvent+0
      0080C4 27 06            [ 1]  182 	jreq	00102$
                                    183 ;	test.c: 31: firstEvent = 0;
      0080C6 72 5F 00 01      [ 1]  184 	clr	_firstEvent+0
      0080CA 20 07            [ 2]  185 	jra	00105$
      0080CC                        186 00102$:
                                    187 ;	test.c: 33: isSleeping = 0;
      0080CC 72 5F 00 02      [ 1]  188 	clr	_isSleeping+0
                                    189 ;	test.c: 34: onSleepEnded();
      0080D0 CD 80 B8         [ 4]  190 	call	_onSleepEnded
      0080D3                        191 00105$:
                                    192 ;	test.c: 38: TIM1_SR1 = 0;
      0080D3 35 00 52 B6      [ 1]  193 	mov	0x52b6+0, #0x00
      0080D7 80               [11]  194 	iret
                                    195 ;	test.c: 41: void tim3(void) __interrupt(21) {
                                    196 ;	-----------------------------------------
                                    197 ;	 function tim3
                                    198 ;	-----------------------------------------
      0080D8                        199 _tim3:
                                    200 ;	test.c: 42: PC_ODR &= ~0x80;
      0080D8 72 1F 50 0A      [ 1]  201 	bres	0x500a, #7
                                    202 ;	test.c: 43: disableIdleTimer();
      0080DC CD 81 A2         [ 4]  203 	call	_disableIdleTimer
                                    204 ;	test.c: 44: TIM3_SR1 = 0;
      0080DF 35 00 52 86      [ 1]  205 	mov	0x5286+0, #0x00
      0080E3 80               [11]  206 	iret
                                    207 ;	test.c: 47: void startSleep(unsigned short period) { // units are 10 ms
                                    208 ;	-----------------------------------------
                                    209 ;	 function startSleep
                                    210 ;	-----------------------------------------
      0080E4                        211 _startSleep:
      0080E4 52 02            [ 2]  212 	sub	sp, #2
                                    213 ;	test.c: 48: if (isSleeping) {
      0080E6 72 5D 00 02      [ 1]  214 	tnz	_isSleeping+0
                                    215 ;	test.c: 49: return; // Already sleeping. ???
      0080EA 26 23            [ 1]  216 	jrne	00103$
                                    217 ;	test.c: 51: CFG_GCR &= ~CFG_GCR_AL; // disable interrupt-only activation level
      0080EC AE 7F 60         [ 2]  218 	ldw	x, #0x7f60
      0080EF F6               [ 1]  219 	ld	a, (x)
      0080F0 A4 FD            [ 1]  220 	and	a, #0xfd
      0080F2 F7               [ 1]  221 	ld	(x), a
                                    222 ;	test.c: 53: TIM1_ARRH = period >> 8;
      0080F3 7B 05            [ 1]  223 	ld	a, (0x05, sp)
      0080F5 0F 01            [ 1]  224 	clr	(0x01, sp)
      0080F7 AE 52 C3         [ 2]  225 	ldw	x, #0x52c3
      0080FA F7               [ 1]  226 	ld	(x), a
                                    227 ;	test.c: 54: TIM1_ARRL = period & 0xff;
      0080FB 7B 06            [ 1]  228 	ld	a, (0x06, sp)
      0080FD 95               [ 1]  229 	ld	xh, a
      0080FE 4F               [ 1]  230 	clr	a
      0080FF 9E               [ 1]  231 	ld	a, xh
      008100 AE 52 C4         [ 2]  232 	ldw	x, #0x52c4
      008103 F7               [ 1]  233 	ld	(x), a
                                    234 ;	test.c: 56: isSleeping = 1;
      008104 35 01 00 02      [ 1]  235 	mov	_isSleeping+0, #0x01
                                    236 ;	test.c: 57: TIM1_CR1 |= TIM_CR1_CEN;
      008108 AE 52 B0         [ 2]  237 	ldw	x, #0x52b0
      00810B F6               [ 1]  238 	ld	a, (x)
      00810C AA 01            [ 1]  239 	or	a, #0x01
      00810E F7               [ 1]  240 	ld	(x), a
      00810F                        241 00103$:
      00810F 5B 02            [ 2]  242 	addw	sp, #2
      008111 81               [ 4]  243 	ret
                                    244 ;	test.c: 72: void setupTimer(void) {
                                    245 ;	-----------------------------------------
                                    246 ;	 function setupTimer
                                    247 ;	-----------------------------------------
      008112                        248 _setupTimer:
                                    249 ;	test.c: 73: CLK_PCKENR2 |= 1 << 1; // enable timer clock
      008112 AE 50 C4         [ 2]  250 	ldw	x, #0x50c4
      008115 F6               [ 1]  251 	ld	a, (x)
      008116 AA 02            [ 1]  252 	or	a, #0x02
      008118 F7               [ 1]  253 	ld	(x), a
                                    254 ;	test.c: 76: TIM1_PSCRH = 0x27;
      008119 35 27 52 C1      [ 1]  255 	mov	0x52c1+0, #0x27
                                    256 ;	test.c: 77: TIM1_PSCRL = 0x10;
      00811D 35 10 52 C2      [ 1]  257 	mov	0x52c2+0, #0x10
                                    258 ;	test.c: 80: TIM1_EGR = 1; // generate UE
      008121 35 01 52 B8      [ 1]  259 	mov	0x52b8+0, #0x01
                                    260 ;	test.c: 82: TIM1_SR1 = 0; // Reset events
      008125 35 00 52 B6      [ 1]  261 	mov	0x52b6+0, #0x00
                                    262 ;	test.c: 84: TIM1_IER = TIM_IER_UIE; // update interrupt enable
      008129 35 01 52 B5      [ 1]  263 	mov	0x52b5+0, #0x01
                                    264 ;	test.c: 85: TIM1_CR1 = TIM_CR1_OPM; // up, one pulse
      00812D 35 08 52 B0      [ 1]  265 	mov	0x52b0+0, #0x08
      008131 81               [ 4]  266 	ret
                                    267 ;	test.c: 89: void enableIdleTimer(void) {
                                    268 ;	-----------------------------------------
                                    269 ;	 function enableIdleTimer
                                    270 ;	-----------------------------------------
      008132                        271 _enableIdleTimer:
                                    272 ;	test.c: 91: CLK_PCKENR1 |= 3; // enable clocks
      008132 AE 50 C3         [ 2]  273 	ldw	x, #0x50c3
      008135 F6               [ 1]  274 	ld	a, (x)
      008136 AA 03            [ 1]  275 	or	a, #0x03
      008138 F7               [ 1]  276 	ld	(x), a
                                    277 ;	test.c: 94: TIM2_ARRH = 7813 >> 8;
      008139 35 1E 52 5F      [ 1]  278 	mov	0x525f+0, #0x1e
                                    279 ;	test.c: 95: TIM2_ARRL = 7813 & 0xff;
      00813D 35 85 52 60      [ 1]  280 	mov	0x5260+0, #0x85
                                    281 ;	test.c: 97: TIM2_PSCR = 7;
      008141 35 07 52 5E      [ 1]  282 	mov	0x525e+0, #0x07
                                    283 ;	test.c: 100: TIM2_EGR = 1; // generate UE
      008145 35 01 52 58      [ 1]  284 	mov	0x5258+0, #0x01
                                    285 ;	test.c: 101: TIM2_SR1 = 0; // Reset events
      008149 35 00 52 56      [ 1]  286 	mov	0x5256+0, #0x00
                                    287 ;	test.c: 103: TIM3_IER = TIM_IER_UIE;
      00814D 35 01 52 85      [ 1]  288 	mov	0x5285+0, #0x01
                                    289 ;	test.c: 110: TIM2_CR2 = TIM_CR2_MMS(2);
      008151 35 20 52 51      [ 1]  290 	mov	0x5251+0, #0x20
                                    291 ;	test.c: 122: TIM3_SMCR = TIM_SMCR_MSM | TIM_SMCR_TS(3) | TIM_SMCR_SMS(7);
      008155 35 B7 52 82      [ 1]  292 	mov	0x5282+0, #0xb7
                                    293 ;	test.c: 126: TIM3_ARRH = 0;
      008159 35 00 52 8F      [ 1]  294 	mov	0x528f+0, #0x00
                                    295 ;	test.c: 127: TIM3_ARRL = 5; // 5 s period
      00815D 35 05 52 90      [ 1]  296 	mov	0x5290+0, #0x05
                                    297 ;	test.c: 129: TIM3_CR1 |= TIM_CR1_OPM;
      008161 AE 52 80         [ 2]  298 	ldw	x, #0x5280
      008164 F6               [ 1]  299 	ld	a, (x)
      008165 AA 08            [ 1]  300 	or	a, #0x08
      008167 F7               [ 1]  301 	ld	(x), a
                                    302 ;	test.c: 131: TIM2_CR1 |= TIM_CR1_CEN;
      008168 72 10 52 50      [ 1]  303 	bset	0x5250, #0
                                    304 ;	test.c: 132: TIM3_CR1 |= TIM_CR1_CEN;
      00816C 72 10 52 80      [ 1]  305 	bset	0x5280, #0
                                    306 ;	test.c: 133: idleTimerRunning = 1;
      008170 35 01 00 03      [ 1]  307 	mov	_idleTimerRunning+0, #0x01
                                    308 ;	test.c: 134: CFG_GCR &= ~CFG_GCR_AL; // normal activation level
      008174 AE 7F 60         [ 2]  309 	ldw	x, #0x7f60
      008177 F6               [ 1]  310 	ld	a, (x)
      008178 A4 FD            [ 1]  311 	and	a, #0xfd
      00817A F7               [ 1]  312 	ld	(x), a
      00817B 81               [ 4]  313 	ret
                                    314 ;	test.c: 138: void keepIdleTimer(void) {
                                    315 ;	-----------------------------------------
                                    316 ;	 function keepIdleTimer
                                    317 ;	-----------------------------------------
      00817C                        318 _keepIdleTimer:
                                    319 ;	test.c: 139: if (!idleTimerRunning)
      00817C 72 5D 00 03      [ 1]  320 	tnz	_idleTimerRunning+0
      008180 26 03            [ 1]  321 	jrne	00102$
                                    322 ;	test.c: 140: enableIdleTimer();
      008182 CD 81 32         [ 4]  323 	call	_enableIdleTimer
      008185                        324 00102$:
                                    325 ;	test.c: 141: TIM3_IER = 0;
      008185 35 00 52 85      [ 1]  326 	mov	0x5285+0, #0x00
                                    327 ;	test.c: 142: TIM3_CNTRH = 0;
      008189 35 00 52 8C      [ 1]  328 	mov	0x528c+0, #0x00
                                    329 ;	test.c: 143: TIM3_CNTRL = 0;
      00818D 35 00 52 8D      [ 1]  330 	mov	0x528d+0, #0x00
                                    331 ;	test.c: 144: TIM2_CNTRH = 0;
      008191 35 00 52 5C      [ 1]  332 	mov	0x525c+0, #0x00
                                    333 ;	test.c: 145: TIM2_CNTRL = 0;
      008195 35 00 52 5D      [ 1]  334 	mov	0x525d+0, #0x00
                                    335 ;	test.c: 146: TIM3_SR1 = 0;
      008199 35 00 52 86      [ 1]  336 	mov	0x5286+0, #0x00
                                    337 ;	test.c: 147: TIM3_IER = TIM_IER_UIE;
      00819D 35 01 52 85      [ 1]  338 	mov	0x5285+0, #0x01
      0081A1 81               [ 4]  339 	ret
                                    340 ;	test.c: 150: void disableIdleTimer(void) {
                                    341 ;	-----------------------------------------
                                    342 ;	 function disableIdleTimer
                                    343 ;	-----------------------------------------
      0081A2                        344 _disableIdleTimer:
                                    345 ;	test.c: 151: TIM2_CR1 &= ~TIM_CR1_CEN;
      0081A2 72 11 52 50      [ 1]  346 	bres	0x5250, #0
                                    347 ;	test.c: 152: TIM3_CR1 &= ~TIM_CR1_CEN;
      0081A6 72 11 52 80      [ 1]  348 	bres	0x5280, #0
                                    349 ;	test.c: 154: CLK_PCKENR1 &= ~3; // disable clocks
      0081AA AE 50 C3         [ 2]  350 	ldw	x, #0x50c3
      0081AD F6               [ 1]  351 	ld	a, (x)
      0081AE A4 FC            [ 1]  352 	and	a, #0xfc
      0081B0 F7               [ 1]  353 	ld	(x), a
                                    354 ;	test.c: 155: idleTimerRunning = 0;
      0081B1 72 5F 00 03      [ 1]  355 	clr	_idleTimerRunning+0
      0081B5 81               [ 4]  356 	ret
                                    357 ;	test.c: 158: int main(void) {
                                    358 ;	-----------------------------------------
                                    359 ;	 function main
                                    360 ;	-----------------------------------------
      0081B6                        361 _main:
      0081B6 52 02            [ 2]  362 	sub	sp, #2
                                    363 ;	test.c: 160: CLK_PCKENR2 = 0; // disable boot ROM clock
      0081B8 35 00 50 C4      [ 1]  364 	mov	0x50c4+0, #0x00
                                    365 ;	test.c: 161: CLK_ICKR |= 1 << 4; // SAHALT, power regulator is off in HALT mode
      0081BC AE 50 C2         [ 2]  366 	ldw	x, #0x50c2
      0081BF F6               [ 1]  367 	ld	a, (x)
      0081C0 AA 10            [ 1]  368 	or	a, #0x10
      0081C2 F7               [ 1]  369 	ld	(x), a
                                    370 ;	test.c: 164: PE_DDR = 0x80; // output
      0081C3 35 80 50 16      [ 1]  371 	mov	0x5016+0, #0x80
                                    372 ;	test.c: 165: PE_CR1 = 0x80; // push-pull
      0081C7 35 80 50 17      [ 1]  373 	mov	0x5017+0, #0x80
                                    374 ;	test.c: 167: PC_DDR |= 0x80; // output
      0081CB 72 1E 50 0C      [ 1]  375 	bset	0x500c, #7
                                    376 ;	test.c: 168: PC_CR1 |= 0x80; // push-pull
      0081CF 72 1E 50 0D      [ 1]  377 	bset	0x500d, #7
                                    378 ;	test.c: 170: PC_CR2 |= 0x02; // interrupt
      0081D3 AE 50 0E         [ 2]  379 	ldw	x, #0x500e
      0081D6 F6               [ 1]  380 	ld	a, (x)
      0081D7 AA 02            [ 1]  381 	or	a, #0x02
      0081D9 F7               [ 1]  382 	ld	(x), a
                                    383 ;	test.c: 171: PC_CR1 |= 0x02; // pull-up
      0081DA AE 50 0D         [ 2]  384 	ldw	x, #0x500d
      0081DD F6               [ 1]  385 	ld	a, (x)
      0081DE AA 02            [ 1]  386 	or	a, #0x02
      0081E0 F7               [ 1]  387 	ld	(x), a
                                    388 ;	test.c: 173: EXTI_CR1 = (3) << 2; // any edge
      0081E1 35 0C 50 A0      [ 1]  389 	mov	0x50a0+0, #0x0c
                                    390 ;	test.c: 175: rim(); // enable interrupts
      0081E5 9A               [ 1]  391 	rim 
                                    392 ;	test.c: 177: while (1) {
      0081E6                        393 00106$:
                                    394 ;	test.c: 178: if (idleTimerRunning || isSleeping)
      0081E6 72 5D 00 03      [ 1]  395 	tnz	_idleTimerRunning+0
      0081EA 26 06            [ 1]  396 	jrne	00101$
      0081EC 72 5D 00 02      [ 1]  397 	tnz	_isSleeping+0
      0081F0 27 03            [ 1]  398 	jreq	00102$
      0081F2                        399 00101$:
                                    400 ;	test.c: 179: wfi();
      0081F2 8F               [10]  401 	wfi 
      0081F3 20 F1            [ 2]  402 	jra	00106$
      0081F5                        403 00102$:
                                    404 ;	test.c: 181: CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
      0081F5 AE 7F 60         [ 2]  405 	ldw	x, #0x7f60
      0081F8 F6               [ 1]  406 	ld	a, (x)
      0081F9 AA 02            [ 1]  407 	or	a, #0x02
      0081FB F7               [ 1]  408 	ld	(x), a
                                    409 ;	test.c: 182: halt();
      0081FC 8E               [10]  410 	halt 
      0081FD 20 E7            [ 2]  411 	jra	00106$
                                    412 ;	test.c: 194: return 0;
      0081FF 5B 02            [ 2]  413 	addw	sp, #2
      008201 81               [ 4]  414 	ret
                                    415 	.area CODE
                                    416 	.area INITIALIZER
      008202                        417 __xinit__firstEvent:
      008202 01                     418 	.db #0x01	;  1
      008203                        419 __xinit__isSleeping:
      008203 00                     420 	.db #0x00	;  0
      008204                        421 __xinit__idleTimerRunning:
      008204 00                     422 	.db #0x00	;  0
                                    423 	.area CABS (ABS)
