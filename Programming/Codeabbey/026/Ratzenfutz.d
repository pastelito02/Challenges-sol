//Author Ratzenfutz
import std.array, std.conv, std.stdio;

uint gcd(in uint u, in uint v)
{
    uint a = u, b = v, r;
    
    while (b != 0)
    {
        r = a % b;
        a = b;
        b = r;
    }
    
    return a;
}

uint lcm(in uint u, in uint v)
{
    return ((u / gcd(u, v)) * v);
}

int main()
{
    /* read number of pairs from stdin */
    string input = readln();
    uint pairs = parse!uint(input);
    
    /* read pairs from stdin and eval */
    uint[] d, m;
    for (uint k = 0; k < pairs; k++)
    {
        auto nums = split(readln());
        uint n1 = parse!uint(nums[0]);
        uint n2 = parse!uint(nums[1]);
        d ~= gcd(n1, n2);
        m ~= lcm(n1, n2);
    }
    
    for (uint k = 0; k < d.length; k++) writef("(%d %d) ", d[k], m[k]);
    writeln;
    
    return 0;
}
