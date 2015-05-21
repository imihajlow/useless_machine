#include "stm8l.h"

#define MOTOR_A 2
#define MOTOR_B 1

enum State {
	IDLE,
	FORWARD,
	BACKWARD
};

static volatile enum State state = IDLE;

void stopHandler(void);
void switchHandler(void);
void setMotor(void);
int getStopState(void);
int getSwitchState(void);

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

void switchHandler(void) {
	// switch state changed
	if (getSwitchState()) { // on
		switch (state) {
			case IDLE:
			case BACKWARD:
			case FORWARD:
			default:
				// Time to go!
				state = FORWARD;
				break;
		}
	} else {
		switch (state) {
			case IDLE:
				// That's ok.
				break;
			case FORWARD:
				// recall
				state = BACKWARD;
				break;
			case BACKWARD:
				// That's ok.
				break;
			default:
				state = IDLE;
				break;
		}
	}
	setMotor();
}

void stopHandler(void) {
	// stop switch state changed
	if (getStopState()) { // parked
		switch (state) {
			case IDLE:
				// already parked
				break;
			case FORWARD:
				// WTF? We were moving forward, but parked. Error!
				error();
				break;
			case BACKWARD:
				// parked
				state = IDLE;
				break;
			default:
				state = IDLE;
				break;
		}
	} else { // unparked
		switch (state) {
			case IDLE:
				// someone moved the pusher
				break;
			case FORWARD:
				// that's ok, pusher has started movement
				break;
			case BACKWARD:
				// WTF? go on, park further
				break;
			default:
				state = BACKWARD;
				break;
		}
	}
	switchHandler(); // switch has higher priority and calls setMotor()
}


#define rim() __asm \
rim \
__endasm

#define halt() __asm \
halt \
__endasm

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
	setMotor();

	rim(); // enable interrupts

	CFG_GCR |= CFG_GCR_AL; // interrupt-only activation level
	halt();
	return 0;
}