//Author Ratzenfutz
int main()
{
    uint rounds = readln.strip.to!uint;
    
    uint[] win;
    for (uint k = 0; k < rounds; k++)
    {
        auto game = readln.strip.split;
        
        uint p1 = 0, p2 = 0;
        for (uint m = 0; m < game.length; m++)
        {
            // draw
            if ((game[m] == "SS") || (game[m] == "PP") || (game[m] == "RR"))
            {
                p1++; p2++;
            }
            else
            {
                switch (game[m])
                {
                    case "SP": { p1++; break; }
                    case "SR": { p2++; break; }
                    case "RP": { p2++; break; }
                    case "RS": { p1++; break; }
                    case "PR": { p1++; break; }
                    case "PS": { p2++; break; }
                    default: break;
                }
            }
        }
        if (p1 == p2) win ~= 0;
            else win ~= (p1 > p2) ? 1 : 2;
    }
    
    writeln;
    for (uint k = 0; k < win.length; k++) write(win[k], " ");
    writeln;
    
    return 0;
}
