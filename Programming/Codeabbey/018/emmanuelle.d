//Author emmanuelle
void main()
{
  auto f = File("data/square-root.txt", "r");

  int len;
  f.readf("%d\n", &len);

  foreach (_; 0..len) {
    uint num, steps;
    f.readf("%d %d\n", &num, &steps);

    writef("%.10g ", sqrt(num, steps));
  }

  writeln();
}

@safe nothrow pure real sqrt(in uint num, in uint steps)
{
  import std.conv : to;

  immutable real rnum = num.to!(immutable real);
  real r = 1.0;

  foreach (_; 0..steps) {
    r = (r + rnum / r) / 2;
  }

  return r;
}

@safe unittest
{
  assert(sqrt(150, 0).approxEqual(1.0));
  assert(sqrt(5, 1).approxEqual(3.0));
  assert(sqrt(10, 3).approxEqual(3.196));
}
