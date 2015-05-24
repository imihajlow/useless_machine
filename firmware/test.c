#include "stm8l.h"

void startSleep(unsigned short);
void disableIdleTimer(void);
void keepIdleTimer(void);

void exti0(void) __interrupt(8) {

}

void exti1(void) __interrupt(9) {
	// line 1
	PE_ODR ^= 0x80;
	keepIdleTimer();
	PC_ODR |= 0x80;
	EXTI_SR1 |= 2;
}

void exti5(void) __interrupt(13) {

}

void onSleepEnded(void) {
}

volatile char firstEvent = 1;
volatile char isSleeping = 0;
void tim1(void) __interrupt(23) {
	if (TIM1_SR1 & TIM_SR1_UIF) {
		if (firstEvent) { // discard first event
			firstEvent = 0;
		} else {
			isSleeping = 0;
			onSleepEnded();
		}
	}

	TIM1_SR1 = 0;
}

void tim3(void) __interrupt(21) {
	PC_ODR &= ~0x80;
	disableIdleTimer();
	TIM3_SR1 = 0;
}

void startSleep(unsigned short period) { // units are 10 ms
	if (isSleeping) {
		return; // Already sleeping. ???
	}
	CFG_GCR &= ~CFG_GCR_AL; // disable interrupt-only activation level

	TIM1_ARRH = period >> 8;
	TIM1_ARRL = period & 0xff;

	isSleeping = 1;
	TIM1_CR1 |= TIM_CR1_CEN;
}

#define rim() __asm \
rim \
__endasm

#define halt() __asm \
halt \
__endasm

#define wfi() __asm \
wfi \
__endasm

void setupTimer(void) {
	CLK_PCKENR2 |= 1 << 1; // enable timer clock
	// prescaler is 10000 = 0x2710
	// unit is 10ms
	TIM1_PSCRH = 0x27;
	TIM1_PSCRL = 0x10;


	TIM1_EGR = 1; // generate UE

	TIM1_SR1 = 0; // Reset events

	TIM1_IER = TIM_IER_UIE; // update interrupt enable
	TIM1_CR1 = TIM_CR1_OPM; // up, one pulse
}

volatile char idleTimerRunning = 0;
void enableIdleTimer(void) {
	// TIM2 master, TIM3 slave
	CLK_PCKENR1 |= 3; // enable clocks

	// One TIM3 tick in 128*7813 SYSCLK ~ 1s
	TIM2_ARRH = 7813 >> 8;
	TIM2_ARRL = 7813 & 0xff;

	TIM2_PSCR = 7;

	// Update
	TIM2_EGR = 1; // generate UE
	TIM2_SR1 = 0; // Reset events

	TIM3_IER = TIM_IER_UIE;

	// 1. Configure timer A in master mode so
	// that it outputs a periodic trigger signal on each UEV.
	// To configure that a rising edge is output on TRGO1
	// each time an update event is generated,
	// write MMS = 010 in the TIMx_CR2 register.
	TIM2_CR2 = TIM_CR2_MMS(2);

	// 2. Connect the TRGO1 output of timer A to timer B,
	// timer B must be configured in slave mode
	// using ITR1 as the internal trigger.
	// Select this through the TS bits in the TIMx_SMCR register.

	// 3. Put the clock/trigger controller in external clock mode 1,
	// by writing SMS = 111 in the TIMx_SMCR register.
	// This causes timer B to be clocked by the rising edge
	// of the periodic timer A trigger signal
	// (which corresponds to the timer A counter overflow).
	TIM3_SMCR = TIM_SMCR_MSM | TIM_SMCR_TS(3) | TIM_SMCR_SMS(7);
	
	// 4. Enable both timers by setting their respective CEN bits (TIMx_CR1 register).

	TIM3_ARRH = 0;
	TIM3_ARRL = 5; // 5 s period

	TIM3_CR1 |= TIM_CR1_OPM;

	TIM2_CR1 |= TIM_CR1_CEN;
	TIM3_CR1 |= TIM_CR1_CEN;
	idleTimerRunning = 1;
	CFG_GCR &= ~CFG_GCR_AL; // normal activation level

}

void keepIdleTimer(void) {
	if (!idleTimerRunning)
		enableIdleTimer();
	TIM3_IER = 0;
	TIM3_CNTRH = 0;
	TIM3_CNTRL = 0;
	TIM2_CNTRH = 0;
	TIM2_CNTRL = 0;
	TIM3_SR1 = 0;
	TIM3_IER = TIM_IER_UIE;
}

void disableIdleTimer(void) {
	TIM2_CR1 &= ~TIM_CR1_CEN;
	TIM3_CR1 &= ~TIM_CR1_CEN;

	CLK_PCKENR1 &= ~3; // disable clocks
	idleTimerRunning = 0;
}

int main(void) {
	volatile unsigned char *p = 0;
	CLK_PCKENR2 = 0; // disable boot ROM clock
	CLK_ICKR |= 1 << 4; // SAHALT, power regulator is off in HALT mode

	// Configure pins
	PE_DDR = 0x80; // output
	PE_CR1 = 0x80; // push-pull

	PC_DDR |= 0x80; // output
	PC_CR1 |= 0x80; // push-pull

	PC_CR2 |= 0x02; // interrupt
	PC_CR1 |= 0x02; // pull-up

	EXTI_CR1 = (3) << 2; // any edge

	rim(); // enable interrupts

	while (1) {
		if (idleTimerRunning || isSleeping)
			wfi();
		else {
			CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
			halt();
		}
	}

	while (1) {
		if (isSleeping) {
			wfi();
		} else {
			CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
			halt();
		}
	}
	return 0;
}