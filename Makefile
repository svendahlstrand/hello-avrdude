MCU=atmega328
CLOCK_SPEED=16000000UL

PROGRAMMER=stk500v1
PORT=/dev/cu.usbmodem1411
BAUD_RATE=19200

AVRDUDE=avrdude
GCC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-Wall -Os
ALL_CFLAGS=-mmcu=$(MCU) -DF_CPU=$(CLOCK_SPEED) $(CFLAGS)

TARGET=hello

default: program

$(TARGET).elf: $(TARGET).c
	$(GCC) $(ALL_CFLAGS) -o $@ $<

program: $(TARGET).elf
	$(AVRDUDE) -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD_RATE) -U flash:w:$<

clean:
	rm -f $(TARGET).elf
