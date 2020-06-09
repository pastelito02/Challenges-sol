//Author Maxim Ivanov
#include <iostream>
#include <fstream>
#include <string>

void        point_calc(std::string str)
{
    int        i;
    size_t    j;
    size_t    len;
    int        sum = 0;
    char    cards[13] = {'2', '3', '4', '5', '6', '7',
                            '8', '9', 'T', 'J', 'Q', 'K', 'A'};

    j = 0;
    len = str.length();
    while (j < len)
    {
        i = 0;
        while (str[j] != ' ' && i < 13)
        {
            if (str[j] == cards[i])
            {
                if (i < 8)
                    sum += (str[j] - 48);
                else if (i >= 8 && str[j] != 'A')
                    sum += 10;
                else
                    sum += (sum + 11 > 21) ? 1 : 11;
                break ;
            }
            i += 1;
        }
        if (sum > 21)
        {
            std::cout << "Bust";
            return ;
        }
        j += 1;
    }
    std::cout << sum;
}

int            main(void)
{
    std::ifstream    file("file");
    std::ofstream    out("out");
    std::string        line;

    getline(file, line);
    int    i = 0;
    int c = stol(line, NULL, 10);
    while (i < c)
    {
        getline(file, line);
        point_calc(line);
        if (i != c - 1)
            std::cout << " ";
        else
            std::cout << std::endl;
        i += 1;
    }
    return (0);
}