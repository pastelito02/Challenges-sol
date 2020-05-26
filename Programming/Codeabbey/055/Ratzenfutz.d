//Author Ratzenfutz
import std.conv, std.string, std.stdio;

int main()
{
    auto input = readln.strip.split.sort;
    
    string[] dbl;
    for (uint k = 1; k < input.length; k++)
    {
        if (input[k] == input[k-1])
        {
            dbl ~= input[k];
            do
            {
                k++;
            }
            while (input[k] == input[k-1]);
        }
    }
    
    writeln;
    for (uint k = 0; k < dbl.length; k++) write(dbl[k], " ");
    writeln;
    
    return 0;
}
