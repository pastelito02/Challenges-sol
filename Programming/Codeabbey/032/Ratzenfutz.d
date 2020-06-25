//Author Ratzenfutz
import std.conv, std.string, std.stdio, std.algorithm;

int main()
{
    auto nk = readln.strip.split;
    uint N = nk[0].to!uint;
    uint K = nk[1].to!uint;
    uint j = 1;
    
    assert (N > K);
    
    uint[] row; row ~= 0;
    for (uint k = 1; k <= N; k++) row ~= k;
    
    while (row[row.length-1] != 0)
    {
        if (j % K != 0) row ~= row[j];
            else row[j] = 0;
        j++;
    }
    
    row[row.length-2].writeln;
    
    return 0;
}
