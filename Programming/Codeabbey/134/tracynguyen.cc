//Author tracynguyen
#include <stdio.h>

int main(void) {
  int w, h, l;
  scanf("%d %d %d", &w, &h, &l);
  int vx = 1, vy = 1, x = 0, y = 0;
  printf("%d %d ", x, y);

  for (int i = 0; i < 100; i++) {
    x += vx;
    y += vy;
    if (x+l == w || x == 0)
      vx = -vx;
    if (y+1 == h || y == 0)
      vy = -vy;
    printf("%d %d ", x, y);
  }
  return 0;
}
