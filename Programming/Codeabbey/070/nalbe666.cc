//Author nalbe666
#include <iomanip>
#include <string>
#include <iostream>
#include <iterator>
#include <algorithm>
#include <fstream>
#include <unordered_map>

void gen(int x0) {
    std::ofstream os("words.txt");
    const char cons[] = "bcdfghjklmnprstvwxz";
    const char vow[] = "aeiou";
    for (int i{}; i < 900'000; ++i) {
        int l(6), a(445), c(700001), m(2097152);
        for (int j(1); j <= l; ++j) {
            x0 = (a * x0 + c) % m;
            os << (j % 2 ? cons[x0 % 19] : vow[x0 % 5]);
        }
        os << ' ';
    }
}

int main()
{
    int x0;
    std::cin >> x0;
    gen(x0);

    std::ifstream is("words.txt");
    std::string s;
    std::unordered_map<std::string, int> m;

    while (is >> s) ++m[s];
    std::pair<const std::string, int>* pmap = &*m.begin();
    for (auto& it : m) if (it.second > pmap->second) pmap = &it;
    std::cout << pmap->first;

    return 0;
}
