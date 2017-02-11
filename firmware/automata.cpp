#include <iostream>
using namespace std;

enum State {
	IDLE,
	WAIT_FORWARD,
	FORWARD,
	BACKWARD
};

State state = IDLE;

int getSwitchState() {
	int result = 0;
	cout << "switch = ";
	cin >> result;
	return result;
}

int getStopState() {
	int result = 0;
	cout << "stop = ";
	cin >> result;
	return result;
}

int getSleepState() {
	int result = 0;
	cout << "justWokeUp? ";
	cin >> result;
	return result;	
}

void setMotor() {
	cout << "set motor " << state << endl;
}

void startSleep(short t) {
	cout << "start sleep for " << t << endl;
}

void automata(int justWokeUp) {
	int switchState = getSwitchState(); // 1 is need to switch off
	int stopState = getStopState(); // 1 is parked
	switch (state) {
		case IDLE:
			if (switchState) {
				startSleep(100);
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
				state = BACKWARD;
			}
			break;
		case BACKWARD:
			if (stopState) {
				state = IDLE;
			}
			if (switchState) {
				startSleep(100);
				state = WAIT_FORWARD;
			}
			break;
		default:
			state = IDLE;
			break;
	}
	setMotor();
}

int main() {
	while (true)
		automata(getSleepState());
	return 0;
}