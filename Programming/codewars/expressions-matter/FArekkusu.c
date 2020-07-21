/*FArekkusu*/
int expression_matter(int a, int b, int c) {
  int r = a + b + c;
  if ((a + b) * c > r) r = (a + b) * c;
  if (a * (b + c) > r) r = a * (b + c);
  if (a * b * c > r) r = a * b * c;
  return r;
}
