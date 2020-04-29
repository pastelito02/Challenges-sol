/+ Author smnroosen +/
import std.stdio;
import std.algorithm;
import std.typecons;
import std.range;
import std.conv;
import std.functional;

void main()
{
  size_t num = readSingle!size_t();
  readf(" ");

  stdin.byLine
    .take(num)
    .map!countVowels
    .implode
    .writeln();

}

size_t countVowels(T)(T str)
{
  return str.filter!isVowel.count();
}

bool isVowel(Char)(Char c)
{
  immutable static vowels = ['a', 'e', 'i', 'o', 'u', 'y'];
  return vowels.canFind(c);
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

auto readNTuple(T)(size_t num = readSingle!size_t())
  if (isTuple!T)
{
  struct ReadTuple
  {
    size_t num;
    size_t i;
    T current;

    this(size_t num)
    {
      this.num = num;
      i = 0;
      readValue();
    }

    public bool empty() @property
    {
      return i >= num;
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
      foreach (ref val; current)
      {
        readf(" %s", &val);
      }
    }
  }

  return ReadTuple(num);
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
      static if (isTuple!T) {
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
alias int2 = Tuple!(int, int);
alias int3 = Tuple!(int, int, int);
