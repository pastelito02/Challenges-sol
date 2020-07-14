/*ZnZ*/
import 'dart:math';

int movie(int card, int ticket, double perc) {
  var n = 1;

  var price = card + ticket * perc;

  while (systemA(ticket, n) <= price.ceil()) {
    price += ticket * pow(perc, n++) * perc;
  }

  return n;
}

int systemA(int price, int count) => price * count;
