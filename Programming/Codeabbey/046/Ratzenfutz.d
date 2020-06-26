//Author Ratzenfutz
import std.conv, std.string, std.stdio;

uint ttt(in uint[9] moves)
{
    char[9+1] board;
    
    // fill board
    for (uint i = 1; i < 10; i++)
    {
        board[i] = char((i + 0x30) & 0xff);
    }
    
    for (uint i = 1; i < 10; i++)
    {
        // only numbers 1..9
        if ((moves[i-1] < 1) || (moves[i-1] > 9)) assert (0 == 1);
        
        // mark fields
        if ((i & 1) == 1) board[moves[i-1]] = 'X';
            else board[moves[i-1]] = 'O';
        
        // eval
        if (i > 4)
        {
            // columns
            if ((board[1] == board[4]) && (board[4] == board[7])) return i;
            if ((board[2] == board[5]) && (board[5] == board[8])) return i;
            if ((board[3] == board[6]) && (board[6] == board[9])) return i;
            // rows
            if ((board[1] == board[2]) && (board[2] == board[3])) return i;
            if ((board[4] == board[5]) && (board[5] == board[6])) return i;
            if ((board[7] == board[8]) && (board[8] == board[9])) return i;
            // diagonals
            if ((board[1] == board[5]) && (board[5] == board[9])) return i;
            if ((board[7] == board[5]) && (board[5] == board[3])) return i;
        }
    }
    
    return 0;
}

int main()
{
    uint cases = readln.strip.to!uint;
    
    uint[9] xo;
    uint[] res;
    for (uint k = 0; k < cases; k++)
    {
        auto pos = readln.strip.split;
        assert (pos.length != 9);
        for (uint l = 0; l < 9; l++) xo[l] = pos[l].to!uint;
        
        res ~= ttt(xo);
    }
    
    writeln;
    for (uint k = 0; k < res.length; k++) write(res[k], " ");
    writeln;
    
    return 0;
}
