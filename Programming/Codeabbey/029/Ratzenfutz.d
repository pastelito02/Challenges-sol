//Author Ratzenfutz
import std.conv, std.string, std.algorithm, std.stdio, std.array, std.container;

void heapSort(T)(T[] data)
{
    for (auto h = data.heapify; !h.empty; h.removeFront) {}
}

int main()
{
    uint cases = readln.strip.to!uint;
    
    auto nums = readln.strip.split;
    int[] data_src, data_dest;
    for (uint k = 0; k < nums.length; k++) data_src ~= nums[k].to!int;
    data_dest = data_src.dup;
    heapSort(data_dest);
    
    writeln;
    for (uint k = 0; k < data_dest.length; k++)
        write(countUntil(data_src, data_dest[k])+1, " ");
    writeln;
    
    return 0;
}
