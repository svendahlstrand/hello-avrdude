#include <avr/io.h>
#include <util/delay.h>

int main (void) {
  DDRB |= _BV(DDB0);

  while (true)
  {
    PORTB ^= _BV(PB0);
    _delay_ms(1000);
  }
}
