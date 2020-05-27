//Author Ratzenfutz
import std.conv, std.array, std.string, std.stdio;

int main()
{
    /* read numbers of test cases */
    uint cases = readln.strip.to!uint;
    
    /* read test cases */
    string[] input;
    for (uint k = 0; k < cases; k++)
    {
        input ~= readln.strip;
    }
    
    writeln;
    
    /* process test cases */
    for (uint k = 0; k < input.length; k++)
    {
        auto line = input[k].split;
        int size = line[0].to!int;
        string str = line[1];
        uint len = str.length & 0xffffffff;

        string s1, s2;
        if (size < 0)
        {
            s2 = str[len+size..len];
            s1 = str[0..len+size];
        }
        else
        {
            s1 = str[0..size];
            s2 = str[size..len];
        }
        write(s2, s1, " ");
    }
    
    writeln;
    
    return 0;
}
