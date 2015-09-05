# Fuses

    avrdude -c stk500v1 -p atmega328 -P /dev/cu.usbmodem1411 -b 19200 -U lfuse:w:0xe2:m -U hfuse:w:0xd6:m -U efuse:w:0x05:m

Use http://www.engbedded.com/fusecalc
