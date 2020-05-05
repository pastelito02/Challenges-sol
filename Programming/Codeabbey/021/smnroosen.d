module GitHub.Challenges-sol.Programming.Codeabbey.021.smnroosen;

//Author smnroosen
import std.stdio;
import std.algorithm;
import std.typecons;
import std.range;
import std.conv;
import std.functional;
import std.array;
import std.traits;

void main()
{
  size_t num = readSingle!size_t;
  uint max = readSingle!uint;

  size_t counter = 1;
  readN!uint(num)
    .array
    .sort
    .reduce!(delegate (a, b) {
      while (a < b) {
        write(" ", counter);
        counter = 0;
        a += 1;
      }
      counter += 1;
      return a;
    });
  write(" ", counter);
}

auto toDigits(uint val)
{
  uint[] digits;

  while (val > 0) {
    digits ~= val % 10;
    val /= 10;
  }

  return digits.retro();
}

int median(int a, int b, int c)
{
  if (a > b)
    swap(a, b);
  if (b > c)
    swap(b, c);
  if (a > b)
    swap(a, b);

  return b;
}

string implode(Range)(Range range)
  if (isInputRange!Range && !isInfinite!Range)
{
  string result;
  bool first = true;

  foreach (element; range) {
    if (!first)
      result ~= " ";
    else
      first = false;

    result ~= to!string(element);
  }

  return result;
}

auto readSingle(T)()
{
  T t;
  readf(" %s", &t);
  return t;
}

auto readN(T)(size_t num = readSingle!size_t())
{
  struct readS
  {
    size_t n;
    size_t i;
    T current;

    this(size_t n)
    {
      this.n = n;
      i = 0;
      readValue();
    }

    public bool empty() @property
    {
      return i >= n;
    }

    public T front() @property
    {
      return current;
    }

    public void popFront()
    {
      i += 1;
      if (!empty())
        readValue();
    }

    private void readValue()
    {
      static if (isTuple!T || isArray!T) {
        foreach (ref val; current)
        {
          readf(" %s", &val);
        }
      } else {
        readf(" %s", &current);
      }
    }
  }

  return readS(num);
}

alias uint2 = Tuple!(uint, uint);
alias uint3 = Tuple!(uint, uint, uint);
alias int2 = Tuple!(int, int);
alias int3 = Tuple!(int, int, int);
