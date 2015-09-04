MCU=atmega328
CLOCK_SPEED=16000000UL

PROGRAMMER=stk500v1
PORT=/dev/cu.usbmodem1411
BAUD_RATE=19200

CC=avr-g++
OBJCOPY=avr-objcopy
CFLAGS=-mmcu=$(MCU) -Wall -Os -DF_CPU=$(CLOCK_SPEED)

TARGET=hello

default: program

$(TARGET).elf: $(TARGET).c
	$(CC) $(CFLAGS) -o $@ $<

program: $(TARGET).elf
	avrdude -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD_RATE) -U flash:w:$<

clean:
	rm -f $(TARGET).elf
