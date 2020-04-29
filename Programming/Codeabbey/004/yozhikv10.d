/+ Author yozhikv10 +/
import std.stdio;


void main()
{
  uint n;
  readf("%d\n", &n);

  int a, b;
  int[] results;

  foreach (int i; 0 .. n) {
    readf("%d %d\n", &a, &b);
    results ~= (a < b) ? a : b;
  }

  foreach (int e; results) {
    writef("%d ", e);
  }
  writeln();
}
