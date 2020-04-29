/+ Author yozhikv10 +/
import std.stdio;
import std.algorithm;


void main()
{
  uint n;
  readf("%d\n", &n);

  int a, b, c;
  int[] mins;
  foreach (int i; 0 .. n) {
    readf("%d %d %d\n", &a, &b, &c);
    mins ~= min(a, b, c);
  }

  foreach (int e; mins) {
    writef("%d ", e);
  }
  writeln();
}
