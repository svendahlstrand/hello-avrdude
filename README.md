# Hello AVRDUDE!

Do you want to get up and running with AVR development on OS X? Maybe you're like me and have a history of Arduino development and want to cut the cord? Or maybe not.

Anyway, this repository contains everything you need to get a blinking LED program (the Hello World of microcontrollers) running on an AVR chip (like the ATmega328p):

* Source code for a blinking LED program (`hello.c`).
* A simple `Makefile` for compiling the project and flash your AVR microcontroller.
* Easy to follow instructions for getting everything setup in OS X and using a programmer to flash your microcontroller.

## Start here

So, we're going to make a LED blink by using and AVR microcontroller. How hard can it be, right? It's actully not that hard but involves quite a few steps. You need to:

* buy an AVR programmer (or make your own with an Arduino UNO)
* make sure you have all parts needed
* build the curcuit
* install AVR toolset and AVRDUDE on OS X
* compile the blinking LED program
* flash the microship
* optionally: set the microship fuse bits

After the above steps you may high five yourself to celebrate.

## Set fuses

    avrdude -c stk500v1 -p atmega328 -P /dev/cu.usbmodem1411 -b 19200 -U lfuse:w:0xe2:m -U hfuse:w:0xd6:m -U efuse:w:0x05:m

Use http://www.engbedded.com/fusecalc
