//Author likehood
#include <iostream>

int main()
{
    int cases;
    std::cin >> cases;
   
    while (cases --> 0)
    {
        int d1, h1, m1, s1;
        int d2, h2, m2, s2;
        
        std::cin >> d1 >> h1 >> m1 >> s1;
        std::cin >> d2 >> h2 >> m2 >> s2;
        
        int totalSec_1 = s1 + 60*(m1 + 60*(h1 + 24*d1));
        int totalSec_2 = s2 + 60*(m2 + 60*(h2 + 24*d2));
        
        int diff = totalSec_2 - totalSec_1;
        int ds = diff % 60;
        diff /= 60;
        int dm = diff % 60;
        diff /= 60;
        int dh = diff % 24;
        int dd = diff / 24;
        
        std::cout << "(" << dd << ' ' << dh << ' ' << dm << ' ' << ds << ") ";
    }
}