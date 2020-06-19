//Author Ratzenfutz
import std.array, std.conv, std.stdio;

bool prime(in ulong p)
in
{
    assert(p > 1);
}
body
{
    ulong prime_lf(in ulong n)
    {
        if (n == 0) return 0;
        if (n == 1) return 1;
        if (n % 2 == 0) return 2;
        if (n % 3 == 0) return 3;
        if (n % 5 == 0) return 5;

        ulong i = 7;
        while (i * i <= n)
        {
            if (n % i == 0) return i;
            if (n % (i + 4) == 0) return (i + 4);
            if (n % (i + 6) == 0) return (i + 6);
            if (n % (i + 10) == 0) return (i + 10);
            if (n % (i + 12) == 0) return (i + 12);
            if (n % (i + 16) == 0) return (i + 16);
            if (n % (i + 22) == 0) return (i + 22);
            if (n % (i + 24) == 0) return (i + 24);
            i += 30;
        }

        return n;
    }

    if (p == prime_lf(p)) return true;

    return false;
}

int main()
{
    /* generate primes list */
    ubyte[] primes = new ubyte[3_000_000 + 1];
    primes[2] = 1;
    for (uint k = 3; k < 3_000_000; k += 2)
    {
        if (prime(k)) primes[k] = 1;
    }
    
    /* read numbers to process from stdin */
    string input = readln();
    uint items = parse!uint(input);
    
    /* read indices from stdin */
    uint[] count;
    for (uint k = 0; k < items; k++)
    {
        auto limits = split(readln());
        uint lb = parse!uint(limits[0]);
        uint ub = parse!uint(limits[1]);
        uint c = 0;
        for (uint l = lb; l <= ub; l++)
        {
            if (primes[l] == 1) c++;
        }
        count ~= c;
    }
    
    for (uint k = 0; k < count.length; k++) write(count[k], " ");
    writeln;
    
    return 0;
}
