//Author Ratzenfutz
/*
Problem 58
Card Names
*/

import std.conv, std.string, std.stdio;

immutable string[] suit = ["Clubs", "Spades", "Diamonds", "Hearts"];
immutable string[] rank = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"];

int main()
{
    /* skip number of cards */
    readln;
    
    /* will be processed through number of value of cards */
    auto cards = readln.strip.split;
    
    string[] names;
    /* alternative
    string[] r, s;
    */
    for (uint k = 0; k < cards.length; k++)
    {
        uint value = cards[k].to!uint;
        names ~= (rank[value % 13] ~ "-of-" ~ suit[value / 13]);
        /* alternative
        r ~= rank[value % 13];
        s ~= suit[value / 13];
        */
    }
    
    writeln;
    for (uint k = 0; k < names.length; k++) write(names[k], " ");
    /* alternative
    for (uint k = 0; k < r.length; k++) write(r[k], "-of-", s[k], " ");
    */
    writeln;
    
    return 0;
}
