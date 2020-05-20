//Author Ratzenfutz
import std.conv, std.array, std.stdio, std.complex, std.math, std.string;

int main()
{
    /* read from stdin */
    string input = readln();
    uint eq = parse!uint(input);
    
    /* read values */
    string[] line;
    for (uint k = 0; k < eq; k++)
    {
        line ~= strip(readln());
    }
    
    /* evaluate each line */
    for (uint k = 0; k < line.length; k++)
    {
        auto abc = split(line[k]);
        int a = parse!int(abc[0]);
        int b = parse!int(abc[1]);
        int c = parse!int(abc[2]);
        int p = b^^2 - 4*a*c;
        
        if (p >= 0)
        {
            int x1 = cast(int)round((-b + std.math.sqrt(cast(double)p)) / (2*a));
            int x2 = cast(int)round((-b - std.math.sqrt(cast(double)p)) / (2*a));
            write(x1, " ", x2, "; ");
        }
        else
        {
            auto x1 = (-b + std.complex.sqrt(complex(p))) / (2*a);
            auto x2 = (-b - std.complex.sqrt(complex(p))) / (2*a);
            write(x1.toString, " ", x2.toString, "; ");
        }
    }
    
    return 0;
}
