//Author Ratzenfutz
/*
Problem 47
Caesar Shift Cipher
*/

import std.conv, std.string, std.stdio;

immutable string abc = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

char[] caesar_dec(in string str, in uint shift)
{
    uint len = str.length;
    
    char[] c = [];
    for (uint j = 0; j < len; j++)
    {
        if ((str[j] >= 'A') && (str[j] <= 'Z'))
        {
            int p = (byte(str[j]) - 0x41) - shift;
            if (p < 0) p += 26;
            c ~= abc[p];
        }
        else
            c ~= str[j];
    }
    
    return c;
}

int main()
{
    auto opt = readln.strip.split;
    
    uint set = opt[0].to!uint;
    uint shift = opt[1].to!uint;
    
    string[] lines;
    for (uint k = 0; k < set; k++) lines ~= readln.strip.toUpper;
    
    writeln;
    char[] dec = [];
    for (uint k = 0; k < lines.length; k++)
    {
        dec = caesar_dec(lines[k], shift);
        write(dec, " ");
    }
    writeln;
    
    return 0;
}
