MCU=atmega328
CLOCK_SPEED=8000000UL
LFUSE=0xe2
HFUSE=0xd6
EFUSE=0x05

PROGRAMMER=stk500v1
PORT=/dev/cu.usbmodem1411
BAUD_RATE=19200

VPATH=src
CC=avr-gcc
CFLAGS=-Wall -Os
ALL_CFLAGS=-mmcu=$(MCU) -DF_CPU=$(CLOCK_SPEED) $(CFLAGS)
OBJCOPY=avr-objcopy
AVRDUDE=avrdude
AVRFLAGS=-c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD_RATE)

blinking-led.elf: blinking-led.c
	$(CC) $(ALL_CFLAGS) -o $@ $<

.PHONY: flash fuse clean

flash: blinking-led.elf
	$(AVRDUDE) $(AVRFLAGS) -U flash:w:$<

fuse:
	$(AVRDUDE) $(AVRFLAGS) -U lfuse:w:$(LFUSE):m -U hfuse:w:$(HFUSE):m -U efuse:w:$(EFUSE):m

clean:
	rm -f blinking-led.elf
