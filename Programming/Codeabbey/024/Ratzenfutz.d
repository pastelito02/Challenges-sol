//Author Ratzenfutz
import std.conv, std.string, std.stdio, std.algorithm;

long neumann(in ulong n)
{
    ulong[] history;
    ulong q = n;
    long f, i = 0;
    
    do
    {
        history ~= q;
        q = ((q * q) / 100) % 10_000;
        f = countUntil(history, q);
        i++;
    }
    while (f == -1);
    
    return i;
}

int main()
{
    uint cases = readln.strip.to!uint;
    
    auto nums = readln.strip.split;
    
    long[] iter;
    for (uint k = 0; k < nums.length; k++)
    {
        ulong p = nums[k].to!ulong;
        iter ~= neumann(p);
    }
    
    writeln;
    for (uint k = 0; k < iter.length; k++) write(iter[k], " ");
    writeln;
    
    return 0;
}
