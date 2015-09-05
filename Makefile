MCU=atmega328
CLOCK_SPEED=8000000UL
LFUSE=0xe2
HFUSE=0xd6
EFUSE=0x05

PROGRAMMER=stk500v1
PORT=/dev/cu.usbmodem1411
BAUD_RATE=19200

AVRDUDE=avrdude
GCC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-Wall -Os
ALL_CFLAGS=-mmcu=$(MCU) -DF_CPU=$(CLOCK_SPEED) $(CFLAGS)

SRC_DIR=src
BUILD_DIR=build
TARGET=blinking-led
BUILD_TARGET=$(BUILD_DIR)/$(TARGET)

all: $(BUILD_TARGET).elf

$(BUILD_TARGET).elf: $(SRC_DIR)/$(TARGET).c
	mkdir -p $(BUILD_DIR)
	$(GCC) $(ALL_CFLAGS) -o $@ $<

flash: $(BUILD_TARGET).elf
	$(AVRDUDE) -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD_RATE) -U flash:w:$<

fuse:
	$(AVRDUDE) -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD_RATE) -U lfuse:w:$(LFUSE):m -U hfuse:w:$(HFUSE):m -U efuse:w:$(EFUSE):m

clean:
	rm -rf $(BUILD_DIR)
