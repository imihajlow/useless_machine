# Useless machine

This project is an attempt to design a useless machine (the one that does nothing but turing off the switch) from scratch.
The reductor gears are designed to be 3d-printed.
The low-power controller can be reused for other small applications: it provides some GPIO pins, UART, and bidirectional motor driver.
The controller's power consumption is low enough to sustain on a CR2032 battery for more than 1.5 years in standby mode.

* mechanics/ - AutoCAD drawings of the mechanical part of the machine. This folder also contains the belt length calculation script.
* controller/ - the electronic part. Schematic drawing, PCB layout and gerber files for production.
* firmware/ - firmware for the controller. You need SDCC (http://sdcc.sourceforge.net) to compile.
