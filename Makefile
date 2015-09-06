MCU=atmega328
F_CPU=8000000UL

PROGRAMMER=stk500v1
PORT=/dev/cu.usbmodem1411
BAUD_RATE=19200

CC=avr-gcc
CFLAGS=-Wall -Os
ALL_CFLAGS=-mmcu=$(MCU) -DF_CPU=$(F_CPU) $(CFLAGS)
AVRDUDE=avrdude
AVRFLAGS=-c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD_RATE)

all: blinking-led.elf

blinking-led.elf: src/blinking-led.c
	$(CC) $(ALL_CFLAGS) -o $@ $<

.PHONY: flash fuse clean

flash: blinking-led.elf
	$(AVRDUDE) $(AVRFLAGS) -U flash:w:$<

fuse:
ifeq ($(and $(strip $(LFUSE)), $(strip $(HFUSE)), $(strip $(EFUSE))),)
	$(error You have to provide LFUSE, HFUSE and EFUSE)
else
	$(AVRDUDE) $(AVRFLAGS) \
	-U lfuse:w:$(LFUSE):m \
	-U hfuse:w:$(HFUSE):m \
	-U efuse:w:$(EFUSE):m
endif

clean:
	rm -f blinking-led.elf
