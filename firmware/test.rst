                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.3 #9233 (May 15 2015) (Mac OS X i386)
                                      4 ; This file was generated Wed May 20 21:19:15 2015
                                      5 ;--------------------------------------------------------
                                      6 	.module test
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _exti5
                                     14 	.globl _exti1
                                     15 	.globl _exti0
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; Stack segment in internal ram 
                                     26 ;--------------------------------------------------------
                                     27 	.area	SSEG
      000001                         28 __start__stack:
      000001                         29 	.ds	1
                                     30 
                                     31 ;--------------------------------------------------------
                                     32 ; absolute external ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DABS (ABS)
                                     35 ;--------------------------------------------------------
                                     36 ; interrupt vector 
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
      008000                         39 __interrupt_vect:
      008000 82 00 80 83             40 	int s_GSINIT ;reset
      008004 82 00 00 00             41 	int 0x0000 ;trap
      008008 82 00 00 00             42 	int 0x0000 ;int0
      00800C 82 00 00 00             43 	int 0x0000 ;int1
      008010 82 00 00 00             44 	int 0x0000 ;int2
      008014 82 00 00 00             45 	int 0x0000 ;int3
      008018 82 00 00 00             46 	int 0x0000 ;int4
      00801C 82 00 00 00             47 	int 0x0000 ;int5
      008020 82 00 00 00             48 	int 0x0000 ;int6
      008024 82 00 00 00             49 	int 0x0000 ;int7
      008028 82 00 80 A0             50 	int _exti0 ;int8
      00802C 82 00 80 A1             51 	int _exti1 ;int9
      008030 82 00 00 00             52 	int 0x0000 ;int10
      008034 82 00 00 00             53 	int 0x0000 ;int11
      008038 82 00 00 00             54 	int 0x0000 ;int12
      00803C 82 00 80 B0             55 	int _exti5 ;int13
      008040 82 00 00 00             56 	int 0x0000 ;int14
      008044 82 00 00 00             57 	int 0x0000 ;int15
      008048 82 00 00 00             58 	int 0x0000 ;int16
      00804C 82 00 00 00             59 	int 0x0000 ;int17
      008050 82 00 00 00             60 	int 0x0000 ;int18
      008054 82 00 00 00             61 	int 0x0000 ;int19
      008058 82 00 00 00             62 	int 0x0000 ;int20
      00805C 82 00 00 00             63 	int 0x0000 ;int21
      008060 82 00 00 00             64 	int 0x0000 ;int22
      008064 82 00 00 00             65 	int 0x0000 ;int23
      008068 82 00 00 00             66 	int 0x0000 ;int24
      00806C 82 00 00 00             67 	int 0x0000 ;int25
      008070 82 00 00 00             68 	int 0x0000 ;int26
      008074 82 00 00 00             69 	int 0x0000 ;int27
      008078 82 00 00 00             70 	int 0x0000 ;int28
      00807C 82 00 00 00             71 	int 0x0000 ;int29
                                     72 ;--------------------------------------------------------
                                     73 ; global & static initialisations
                                     74 ;--------------------------------------------------------
                                     75 	.area HOME
                                     76 	.area GSINIT
                                     77 	.area GSFINAL
                                     78 	.area GSINIT
      008083                         79 __sdcc_gs_init_startup:
      008083                         80 __sdcc_init_data:
                                     81 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]   82 	ldw x, #l_DATA
      008086 27 07            [ 1]   83 	jreq	00002$
      008088                         84 00001$:
      008088 72 4F 00 00      [ 1]   85 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   86 	decw x
      00808D 26 F9            [ 1]   87 	jrne	00001$
      00808F                         88 00002$:
      00808F AE 00 00         [ 2]   89 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   90 	jreq	00004$
      008094                         91 00003$:
      008094 D6 80 EA         [ 1]   92 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]   93 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]   94 	decw	x
      00809B 26 F7            [ 1]   95 	jrne	00003$
      00809D                         96 00004$:
                                     97 ; stm8_genXINIT() end
                                     98 	.area GSFINAL
      00809D CC 80 80         [ 2]   99 	jp	__sdcc_program_startup
                                    100 ;--------------------------------------------------------
                                    101 ; Home
                                    102 ;--------------------------------------------------------
                                    103 	.area HOME
                                    104 	.area HOME
      008080                        105 __sdcc_program_startup:
      008080 CC 80 B1         [ 2]  106 	jp	_main
                                    107 ;	return from main will return to caller
                                    108 ;--------------------------------------------------------
                                    109 ; code
                                    110 ;--------------------------------------------------------
                                    111 	.area CODE
                                    112 ;	test.c: 3: void exti0(void) __interrupt(8) {
                                    113 ;	-----------------------------------------
                                    114 ;	 function exti0
                                    115 ;	-----------------------------------------
      0080A0                        116 _exti0:
                                    117 ;	test.c: 5: }
      0080A0 80               [11]  118 	iret
                                    119 ;	test.c: 7: void exti1(void) __interrupt(9) {
                                    120 ;	-----------------------------------------
                                    121 ;	 function exti1
                                    122 ;	-----------------------------------------
      0080A1                        123 _exti1:
                                    124 ;	test.c: 9: PE_ODR ^= 0x80;
      0080A1 AE 50 14         [ 2]  125 	ldw	x, #0x5014
      0080A4 F6               [ 1]  126 	ld	a, (x)
      0080A5 A8 80            [ 1]  127 	xor	a, #0x80
      0080A7 F7               [ 1]  128 	ld	(x), a
                                    129 ;	test.c: 11: EXTI_SR1 |= 2;
      0080A8 AE 50 A3         [ 2]  130 	ldw	x, #0x50a3
      0080AB F6               [ 1]  131 	ld	a, (x)
      0080AC AA 02            [ 1]  132 	or	a, #0x02
      0080AE F7               [ 1]  133 	ld	(x), a
      0080AF 80               [11]  134 	iret
                                    135 ;	test.c: 14: void exti5(void) __interrupt(13) {
                                    136 ;	-----------------------------------------
                                    137 ;	 function exti5
                                    138 ;	-----------------------------------------
      0080B0                        139 _exti5:
                                    140 ;	test.c: 16: }
      0080B0 80               [11]  141 	iret
                                    142 ;	test.c: 27: int main(void) {
                                    143 ;	-----------------------------------------
                                    144 ;	 function main
                                    145 ;	-----------------------------------------
      0080B1                        146 _main:
      0080B1 52 02            [ 2]  147 	sub	sp, #2
                                    148 ;	test.c: 29: CLK_PCKENR2 = 0; // disable boot ROM clock
      0080B3 35 00 50 C4      [ 1]  149 	mov	0x50c4+0, #0x00
                                    150 ;	test.c: 32: PE_DDR = 0x80; // output
      0080B7 35 80 50 16      [ 1]  151 	mov	0x5016+0, #0x80
                                    152 ;	test.c: 33: PE_CR1 = 0x80; // push-pull
      0080BB 35 80 50 17      [ 1]  153 	mov	0x5017+0, #0x80
                                    154 ;	test.c: 35: PC_DDR |= 0x80; // output
      0080BF 72 1E 50 0C      [ 1]  155 	bset	0x500c, #7
                                    156 ;	test.c: 36: PC_CR1 |= 0x80; // push-pull
      0080C3 72 1E 50 0D      [ 1]  157 	bset	0x500d, #7
                                    158 ;	test.c: 38: PC_CR2 |= 0x02; // interrupt
      0080C7 AE 50 0E         [ 2]  159 	ldw	x, #0x500e
      0080CA F6               [ 1]  160 	ld	a, (x)
      0080CB AA 02            [ 1]  161 	or	a, #0x02
      0080CD F7               [ 1]  162 	ld	(x), a
                                    163 ;	test.c: 39: PC_CR1 |= 0x02; // pull-up
      0080CE AE 50 0D         [ 2]  164 	ldw	x, #0x500d
      0080D1 F6               [ 1]  165 	ld	a, (x)
      0080D2 AA 02            [ 1]  166 	or	a, #0x02
      0080D4 F7               [ 1]  167 	ld	(x), a
                                    168 ;	test.c: 41: EXTI_CR1 = (3) << 2; // any edge
      0080D5 35 0C 50 A0      [ 1]  169 	mov	0x50a0+0, #0x0c
                                    170 ;	test.c: 42: rim(); // enable interrupts
      0080D9 9A               [ 1]  171 	rim 
                                    172 ;	test.c: 44: CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
      0080DA AE 7F 60         [ 2]  173 	ldw	x, #0x7f60
      0080DD F6               [ 1]  174 	ld	a, (x)
      0080DE AA 02            [ 1]  175 	or	a, #0x02
      0080E0 F7               [ 1]  176 	ld	(x), a
                                    177 ;	test.c: 45: halt();
      0080E1 8E               [10]  178 	halt 
                                    179 ;	test.c: 46: PC_ODR |= 0x80;
      0080E2 72 1E 50 0A      [ 1]  180 	bset	0x500a, #7
                                    181 ;	test.c: 47: while (1) ;
      0080E6                        182 00102$:
      0080E6 20 FE            [ 2]  183 	jra	00102$
                                    184 ;	test.c: 48: return 0;
      0080E8 5B 02            [ 2]  185 	addw	sp, #2
      0080EA 81               [ 4]  186 	ret
                                    187 	.area CODE
                                    188 	.area INITIALIZER
                                    189 	.area CABS (ABS)
