//Author yozhikv10
import std.stdio;
import std.math;


uint wsdhash(uint num)
{
    uint numdigits = cast(int) log10(num) + 1;

    uint hash;
    foreach (uint i; 0 .. numdigits) {
        hash += (num % 10) * (numdigits - i);
        num /= 10;
    }

    return hash;
}


void main()
{
    uint amount, n; readf("%d\n", &amount);
    uint[] checksums; checksums.length = amount;

    foreach (uint i; 0 .. amount) {
        readf(" %d", &n);
        checksums[i] = wsdhash(n);
    }

    foreach (uint e; checksums) {
        writef("%d ", e);
    }
    writeln();
}
