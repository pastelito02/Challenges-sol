//Author smnroosen
import std.stdio;
import std.algorithm;
import std.typecons;
import std.range;
import std.conv;
import std.functional;
import std.math;
import std.string;
import std.regex;

import std.bigint;

void main()
{
  readNTuple!double3
    .map!(t => t[0] * t[1] / (t[2]+t[1]))
    .map!(value => format("%.8g", value))
    .implode
    .writeln;
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

auto readNRanges(T)(T zero = T.init, size_t num = readSingle!size_t())
{
  struct ReadRange
  {
    T val;

    bool empty() @property
    {
      return val == zero;
    }

    T front() @property
    {
      return val;
    }

    void popFront()
    {
      readf(" %s", &val);
    }
  }
  auto makeReadRange(Tuple!() a, size_t i)
  {
    auto r = ReadRange();
    r.popFront();
    return r;
  }

  return sequence!makeReadRange.take(num);
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

auto read(T)()
{
  struct Read
  {
    T current;

    enum empty = false;

    public T front() @property
    {
      return current;
    }

    public void popFront()
    {
      static if (isTuple!T) {
        foreach (ref val; current)
        {
          static if (is(typeof(val) == string))
            val = readln(' ');
          else
            readf(" %s", &val);
        }
      } else {
        readf(" %s", &current);
      }
    }
  }

  auto r = Read();
  r.popFront();
  return r;
}

alias stint = Tuple!(char, ulong);
alias uint2 = Tuple!(uint, uint);
alias uint3 = Tuple!(uint, uint, uint);
alias uint4 = Tuple!(uint, uint, uint, uint);
alias uint8 = Tuple!(uint, uint, uint, uint, uint, uint, uint, uint);
alias int2 = Tuple!(int, int);
alias int3 = Tuple!(int, int, int);
alias int4 = Tuple!(int, int, int, int);
alias double3 = Tuple!(double, double, double);
