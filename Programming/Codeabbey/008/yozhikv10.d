//Author yozhikv10
import std.stdio;

void main()
{
  size_t tests_count, n;
  uint a, b;
  ulong[] sums;


  readf("%d\n", &tests_count);
  sums.length = tests_count;


  foreach (size_t i; 0 .. tests_count) {
    readf("%d %d %d\n", &a, &b, &n);
    sums[i] = n * (a * 2 + b * (n - 1)) / 2;
  }


  foreach (ulong sum; sums) {
    write(sum, ' ');
  }
  writeln();
}
