#include "stm8l.h"

void exti0(void) __interrupt(8) {

}

void exti1(void) __interrupt(9) {
	// line 1
	PE_ODR ^= 0x80;

	EXTI_SR1 |= 2;
}

void exti5(void) __interrupt(13) {

}

#define rim() __asm \
rim \
__endasm

#define halt() __asm \
halt \
__endasm


int main(void) {
	volatile unsigned char *p = 0;
	CLK_PCKENR2 = 0; // disable boot ROM clock

	// Configure pins
	PE_DDR = 0x80; // output
	PE_CR1 = 0x80; // push-pull

	PC_DDR |= 0x80; // output
	PC_CR1 |= 0x80; // push-pull

	PC_CR2 |= 0x02; // interrupt
	PC_CR1 |= 0x02; // pull-up

	EXTI_CR1 = (3) << 2; // any edge
	rim(); // enable interrupts

	CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
	halt();
	PC_ODR |= 0x80;
	while (1) ;
	return 0;
}