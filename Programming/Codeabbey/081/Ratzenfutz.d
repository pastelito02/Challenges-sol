//Author Ratzenfutz
import std.conv, std.array, std.stdio;

uint bits(in int n)
{
  asm
  {
    mov     R8, 0;
    mov     RCX, 0;
    mov     EAX, n;
  __nextbit:
    bt      EAX, ECX;
    mov     RDX, 0;
    jnc     __notset;
    add     RDX, 1;
  __notset:
    add     R8, RDX;
    add     RCX, 1;
    cmp     RCX, 32;
    jne     __nextbit;
    mov     RAX, R8;
  }
}

int main()
{
  /* read from stdin */
  string input = readln();
  uint items = parse!uint(input);

  /* read items and process */
  uint[] b;
  auto nums = split(readln());
  for (uint k = 0; k < nums.length; k++)
  {
    int i = parse!int(nums[k]);
    b ~= bits(i);
  }

  for (uint k = 0; k < b.length; k++) write(b[k], " ");
  writeln;

  return 0;
}
