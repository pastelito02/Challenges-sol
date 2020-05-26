//Author Ratzenfutz
/*
Problem 53
King and Queen
*/

import std.conv, std.string, std.stdio;

char eval(in string king, in string queen)
{
    /* vertical */
    if (king[0] == queen[0])
    {
        return 'Y';
    }
    /* horizontal */
    if (king[1] == queen[1])
    {
        return 'Y';
    }
    /* diagonal */
    int kx = byte(king[0]) - 0x40;
    int ky = king[1].to!int;
    int qx = byte(queen[0]) - 0x40;
    int qy = queen[1].to!int;
    int p = qx - kx;
    int q = qy - ky;
    double r;
    asm
    {
        fild    p;
        fidiv   q;
        fabs;
        fstp    r;
    }
    if (r == 1.0) return 'Y';
    
    return 'N';
}

int main()
{
    uint cases = readln.strip.to!uint;
    
    char[] t;
    for (uint k = 0; k < cases; k++)
    {
        auto pos = readln.strip.toUpper.split;
        
        string K = pos[0];
        string Q = pos[1];
        t ~= eval(K, Q);
    }
    
    writeln;
    for (uint k = 0; k < t.length; k++) write(t[k], " ");
    writeln;
    
    return 0;
}
