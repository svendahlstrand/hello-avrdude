#include <avr/io.h>
#include <util/delay.h>

int main (void) {
  DDRC |= _BV(DDC5);

  for(;;)
  {
    PORTC ^= _BV(PC5);
    _delay_ms(1000);
  }
}
