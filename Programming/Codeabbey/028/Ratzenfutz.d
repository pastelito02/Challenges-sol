//Author Ratzenfutz
import std.array, std.conv, std.stdio;

immutable string[] bmi = ["under ", "normal ", "over ", "obese "];

int main()
{
    /* read number of data */
    string input = readln();
    uint wh = parse!uint(input);
    
    /* read data */
    uint[] index;
    for (uint k = 0; k < wh; k++)
    {
        auto data = split(readln());
        double weight = parse!double(data[0]);
        double height = parse!double(data[1]);
        double r = weight / height^^2;
        if (r < 18.5) index ~= 0;
            else if (r < 25.0) index ~= 1;
            else if (r < 30.0) index ~= 2;
            else index ~= 3;
    }
    
    for (uint k = 0; k < index.length; k++) write(bmi[index[k]]);
    writeln;
    
    return 0;
}
