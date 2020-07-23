/*kaluzap*/
#include <stddef.h>

long arr_plus_arr(const int *a,  const int *b, size_t na, size_t nb)
{
    long total = 0;
    for(int i=0; i<na;i++) total += a[i];
    for(int i=0; i<nb;i++) total += b[i];
    return total;
}
