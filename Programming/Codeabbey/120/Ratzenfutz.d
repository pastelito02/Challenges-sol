//Author Ratzenfutz
/*
Problem 120
Selection Sort
*/

import std.conv, std.string, std.stdio;

int main()
{
    /* simply read input, but skip it */
    readln;
    
    /* read data into array */
    auto data = readln.strip.split;

    /* convert to numerics */
    uint[] items;
    for (uint k = 0; k < data.length; k++) items ~= data[k].to!uint;
    
    uint N = (items.length - 1) & 0xffffffff;
    
    uint[] indices;
    while (N > 0)
    {
        uint max_idx = 0;
        for (uint i = 0; i <= N; i++)
        {
            if (items[i] > items[max_idx]) max_idx = i;
        }
        indices ~= max_idx;
        /* swap maximum with last item */
        uint t = items[N];
        items[N] = items[max_idx];
        items[max_idx] = t;
        /* set new limit */
        N--;
    }
    
    writeln;
    for (uint k = 0; k < indices.length; k++) write(indices[k], " ");
    writeln;
    
    return 0;
}
