//Author Ratzenfutz
/*
Problem 27
Bubble Sort
*/

import std.conv, std.string, std.stdio;

void bubble(uint[] arr, ref uint passes, ref uint swaps)
{
    bool sorted = true;
    uint len = arr.length;
    passes = swaps = 0;
    
    do
    {
        sorted = true;
        passes++;
        for (uint k = 0; k < (len - 1); k++)
        {
            if (arr[k] > arr[k+1])
            {
                sorted = false;
                // swap;
                swaps++;
                uint t = arr[k+1];
                arr[k+1] = arr[k];
                arr[k] = t;
            }
        }
    }
    while (!sorted);
}

int main()
{
    uint p, s, size;
    uint[] a;
    
    size = readln.strip.to!uint;
    
    auto data = readln.strip.split;
    for (uint j = 0; j < data.length; j++) a ~= data[j].to!uint;
    
    bubble(a, p, s);
    writeln;
    writeln(p, " ", s);
    
    return 0;
}
