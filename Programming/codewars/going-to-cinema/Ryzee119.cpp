/*Ryzee119*/
#include <math.h>       /* ceil */

class Movie
{
public:
    static int movie(int card, int ticket, double perc){
      int systemACost=ticket;
      double systemBCost=card+ticket;
      double prevPrice=ticket;
      int n=0;

    while(ceil(systemBCost)>=systemACost){
        prevPrice*=perc;
        systemBCost+=prevPrice;
        systemACost+=ticket;
        n++;
      }
      return n;
    }
};
