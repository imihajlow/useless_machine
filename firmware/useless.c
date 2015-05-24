#include "stm8l.h"

#define MOTOR_A 2
#define MOTOR_B 1

enum State {
	IDLE,
	WAIT_FORWARD,
	FORWARD,
	WAIT_BACKWARD,
	BACKWARD
};

short getDelayForward(void);
short getDelayBackward(void);

volatile int  irritationCount = 0;

static volatile enum State state = IDLE;

void stopHandler(void);
void switchHandler(void);
void sleepHandler(void);
void setMotor(void);
int getStopState(void);
int getSwitchState(void);
void keepIdleTimer(void);
void disableIdleTimer(void);


void exti0(void) __interrupt(8) {
	// stop
	EXTI_SR1 |= 1 << 0;

	stopHandler();
}

void exti5(void) __interrupt(13) {
	// switch
	EXTI_SR1 |= 1 << 5;

	switchHandler();
}

volatile char firstEvent = 1;
volatile char isSleeping = 0;
void tim1(void) __interrupt(23) {
	if (TIM1_SR1 & TIM_SR1_UIF) {
		if (firstEvent && !isSleeping) { // discard first event
			firstEvent = 0;
		} else {
			isSleeping = 0;
			sleepHandler();
		}
	}

	TIM1_SR1 = 0;
}

void tim3(void) __interrupt(21) {
	TIM3_SR1 = 0;
	disableIdleTimer();
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

int getSwitchState(void) { // 1 is on (need to switch off)
	return (PE_IDR & (1 << 5)) == 0;
}

int getStopState(void) { // 1 is on (pusher is parked)
	return PE_IDR & (1 << 0);
}

void motorForward(void) {
	PB_ODR &= ~MOTOR_A;
	PB_ODR |= MOTOR_B;
}

void motorBackward(void) {
	PB_ODR &= ~MOTOR_B;
	PB_ODR |= MOTOR_A;
}

void motorStop(void) {
	PB_ODR &= ~(MOTOR_A | MOTOR_B);
}

// Set motor according to state
void setMotor(void) {
	switch (state) {
	case FORWARD:
		motorForward();
		break;
	case BACKWARD:
		motorBackward();
		break;
	case IDLE:
	case WAIT_FORWARD:
	case WAIT_BACKWARD:
		motorStop();
		break;
	default:
		motorStop();
		state = IDLE;
		break;
	}
}

void error(void) {
	state = IDLE;
	return;
	//while (1) ;
}

void automata(int justWokeUp) {
	int switchState = getSwitchState(); // 1 is need to switch off
	int stopState = getStopState(); // 1 is parked
	keepIdleTimer();
	switch (state) {
		case IDLE:
			if (switchState) {
				startSleep(getDelayForward());
				state = WAIT_FORWARD;
			}
			break;
		case WAIT_FORWARD:
			if (justWokeUp) {
				if (!switchState) {
					state = IDLE;
				} else {
					state = FORWARD;
				}
			} else {
				if (!switchState) {
					state = IDLE;
				}
			}
			break;
		case FORWARD:
			if (!switchState) {
				startSleep(getDelayBackward());
				state = WAIT_BACKWARD;
				
				//state = BACKWARD;
			}
			break;
		case WAIT_BACKWARD:
			if (justWokeUp) {
				state = BACKWARD;
			} else {
				if (stopState) {
					state = IDLE;
				} else {
					state = BACKWARD;
				}
				break;
			}
		case BACKWARD:
			if (stopState) {
				state = IDLE;
			}
			if (switchState) {
				//startSleep(100);
				//state = WAIT_FORWARD;
				state = FORWARD;
			}
			break;
		default:
			state = IDLE;
			break;
	}
	setMotor();
}

void switchHandler(void) {
	if (getSwitchState())
		irritationCount += 1;
	automata(0);
}

void stopHandler(void) {
	automata(0);
}

void sleepHandler() {
	automata(1);
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

volatile char isIdleTimerRunning = 0;
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
	TIM3_ARRL = 60; // 60 s period

	TIM3_CR1 |= TIM_CR1_OPM;

	TIM2_CR1 |= TIM_CR1_CEN;
	TIM3_CR1 |= TIM_CR1_CEN;
	isIdleTimerRunning = 1;
	CFG_GCR &= ~CFG_GCR_AL; // normal activation level

}

void keepIdleTimer(void) {
	if (!isIdleTimerRunning)
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
	isIdleTimerRunning = 0;
	irritationCount = 0;
}

short getDelayForward(void) {
	if (irritationCount < 3) {
		return 100;
	} else if (irritationCount < 10) {
		return 10;
	} else {
		return 1000;
	}
}

short getDelayBackward(void) {
	if (irritationCount < 3) {
		return 10;
	} else if (irritationCount < 10) {
		return 200;
	} else if (irritationCount < 20) {
		return 10;
	} else {
		return 1000;
	}
}

int main(void) {
	CLK_PCKENR2 = 0; // disable boot ROM clock

	// Set all ports to pull-up
	// input and no interrupt by default
	PA_CR1 = 0xFF; // pull-up
	PB_CR1 = 0xFF; // pull-up
	PC_CR1 = 0xFF; // pull-up
	PD_CR1 = 0xFF; // pull-up
	PE_CR1 = 0xFF; // pull-up
	PF_CR1 = 0x01; // pull-up

	// Configure motor pins
	PB_DDR |= MOTOR_A | MOTOR_B; // output
	// already push-pull (CR1 = 1)
	// normal mode by default

	// Configure input pins
	// input by default
	PE_CR2 |= (1 << 0) | (1 << 5); // interrupt
	// already pull-up

	EXTI_CR1 = (3) << 0; // any edge on bit 0
	EXTI_CR2 = (3) << 2; // any edge on bit 5

	state = IDLE;
	setupTimer();
	automata(0);
	rim(); // enable interrupts
	while (1) {
		if (isSleeping || isIdleTimerRunning) {
			wfi();
		} else {
			CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
			halt();
		}
	}
	return 0;
}