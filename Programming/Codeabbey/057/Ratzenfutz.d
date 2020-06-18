//Author Ratzenfutz
import std.conv, std.array, std.string, std.stdio;

int main()
{
    uint cases = readln.strip.to!uint;
    
    auto temp = readln.strip.split;

    double[] degrees, smooth;
    
    for (uint k = 0; k < temp.length; k++) degrees ~= temp[k].to!double;
    
    smooth ~= degrees[0];
    for (uint k = 1; k < degrees.length-1; k++)
    {
        smooth ~= (degrees[k-1] + degrees[k] + degrees[k+1]) / 3;
    }
    smooth ~= degrees[degrees.length-1];
    
    writeln;
    for (uint k = 0; k < smooth.length; k++) writef("%0.10g ", smooth[k]);
    writeln;
    
    return 0;
}
