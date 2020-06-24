//Author Ratzenfutz
import std.conv, std.string, std.stdio;

int main()
{
    uint cases = readln.strip.to!uint;
    
    uint[] iter;
    for (uint k = 0; k < cases; k++)
    {
        auto rec = readln.strip.split;
        uint A = rec[0].to!uint;
        uint C = rec[1].to!uint;
        uint M = rec[2].to!uint;
        uint X0 = rec[3].to!uint;
        uint N = rec[4].to!uint;
        uint X1;
        
        for (uint l = 0; l < N; l++)
        {
            X1 = (A * X0 + C) % M;
            X0 = X1;
        }
        iter ~= X1;
    }
    
    writeln;
    for (uint k = 0; k < iter.length; k++) write(iter[k], " ");
    writeln;
    
    return 0;
}
