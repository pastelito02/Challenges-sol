/*ebx*/
#include <iostream>
#include <cctype>

string to_alternating_case(const string& str)
{
    string ret = str;
    for (char &c : ret) {
        c = isupper(c) ? tolower(c) : toupper(c);
    }
    return ret;
}
