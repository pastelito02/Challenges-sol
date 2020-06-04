//Author MissPython
// 152RSACryptography.cpp : Defines the entry point for the console application.
//

#include <iostream>
#include <cmath>
#include <string>

int char2int(char a) {
    return (int)a - 48;
}

char int2char(int a) {
    return (char)(a + 48);
}



void strDetrailing(std::string *a) {
    // converts 00034 to 34, removes leading 0's.
    while ((*a)[0] == '0') {
        (*a) = a->substr(1);
    }
}

bool strcompare(std::string a, std::string b) {
    // return 1 if a >= b, 0 otherwise.
    strDetrailing(&a);
    strDetrailing(&b);

    if (a.length() > b.length()) {
        return true;
    }
    else if (a.length() < b.length()) {
        return false;
    }
    else {
        for (int i = 0; i < a.length(); i++) {
            if (a[i] < b[i]) {
                return false;
            }
            else if (a[i] > b[i]) {
                return true;
            }
        }
        return true;
    }
}

std::string strminus(std::string a, std::string b) {
    // Returns a - b.
    if (a == b) {
        return "0";
    }



    bool negative = !strcompare(a, b); // if a>b, return positive; if not, initiate negative protocol.
    std::string* big, *small;
    if (strcompare(a, b)) {
        big = &a;
        small = &b;
        negative = false;
    }
    else {
        big = &b;
        small = &a;
        negative = true;
    }
    int minus1(0), current;


    std::string result = std::string(big->length(), '0');

    for (int i = 0; i < small->length(); i++) {
        current = char2int((*big)[big->length() - i - 1]) - char2int((*small)[small->length() - i - 1]) - minus1;
        if (current < 0) {
            result[big->length() - i - 1] = int2char(current + 10);
            minus1 = 1;
        }
        else {
            result[big->length() - i - 1] = int2char(current);
            minus1 = 0;
        }
    }
    for (int i = small->length(); i < big->length(); i++) {
        current = char2int((*big)[big->length() - i - 1]) - minus1;
        if (current < 0) {
            result[big->length() - i - 1] = int2char(current + 10);
            minus1 = 1;
        }
        else {
            result[big->length() - i - 1] = int2char(current);
            minus1 = 0;
        }
    }
    strDetrailing(&result);
    if (negative) {
        result = '-' + result;
    }
    return result;
}

std::string stradd(std::string a, std::string b) {
    int nmin, nmax, na, nb, plus1(0), current;
    std::string::iterator maxnum;
    na = a.length();
    nb = b.length();
    if (na < nb) {
        nmin = na;
        nmax = nb;
        maxnum = b.begin();
    }
    else {
        nmin = nb;
        nmax = na;
        maxnum = a.begin();
    }
    std::string result = std::string(nmax, '0');
    for (int i = 0; i < nmin; i++) {
        current = char2int(a[na - i - 1]) + char2int(b[nb - i - 1]) + plus1;
        result[nmax - i - 1] = int2char(current % 10);
        plus1 = current / 10;
    }
    for (int i = nmin; i < (nmax); i++) {
        current = char2int(*(maxnum + nmax - i - 1)) + plus1;
        result[nmax - i - 1] = int2char(current % 10);
        plus1 = current / 10;
    }
    if (plus1) {
        result.insert(0, 1, '1');
    }
    return result;
}

std::string strAddMinus(std::string a, std::string b, char symbol) {
    if (symbol == '-') {
        if (a[0] == '-') {
            a = a.substr(1);
            if (b[0] == '-') {
                b = b.substr(1);
                return strminus(b, a);
            }
            else {
                return '-' + stradd(b, a);
            }
        }
        else {
            if (b[0] == '-') {
                b = b.substr(1);
                return stradd(a, b);
            }
            else {
                return strminus(a, b);
            }
        }
    }

    else if (symbol == '+') {
        if (a[0] == '-' && b[0] == '-') {
            a = a.substr(1);
            b = b.substr(1);
            return '-' + stradd(a, b);
        }
        else if (a[0] == '-' && b[0] != '-') {
            return strminus(b, a.substr(1));
        }
        else if (a[0] != '-' && b[0] == '-') {
            return strminus(a, b.substr(1));
        }
        else {
            return stradd(a, b);
        }
    }
    else {
        return "";
    }

}


std::string strmult(std::string a, std::string b) {
    if (a == "0" || b == "0") {
        return "0";
    }
    bool negative = false;
    if (a[0] == '-') {
        a = a.substr(1);
        if (b[0] == '-') {
            b = b.substr(1);
        }
        else {
            negative = true;
        }
    }
    else if (b[0] == '-') {
        b = b.substr(1);
        negative = true;
    }


    std::string result = "0";
    int dash = 9;

    a = std::string(dash - a.length() % dash, '0') + a;
    b = std::string(dash - b.length() % dash, '0') + b;

    int na = a.length();
    int nb = b.length();

    for (int i = 0; i < na; i += dash) {
        for (int j = 0; j < nb; j += dash) {
            result = strAddMinus(result, std::to_string(stoull(a.substr(na - dash - i, dash)) * stoull(b.substr(nb - dash - j, dash))) + std::string(i + j, '0'), '+');
        }
    }
    if (negative) {
        result = '-' + result;
    }
    return result;
}

std::string strdiv(std::string a, std::string b) {
    bool negative = false;
    if (a[0] == '-') {
        a = a.substr(1);
        if (b[0] == '-') {
            b = b.substr(1);
        }
        else {
            negative = true;
        }
    }
    else if (b[0] == '-') {
        b = b.substr(1);
        negative = true;
    }



    // returns floor(a / b),
    if (a == b) {
        if (negative) {
            return "-1";
        }
        else {
            return "1";
        }
    }
    else if (strcompare(b, a)) {
        return "0";
    }

    // Now a>b...
    std::string inter = "0";
    std::string result = "";
    int result_inter = 0;
    inter = a.substr(0, b.length());
    while (strcompare(inter, b)) {
        inter = strAddMinus(inter, b, '-');
        result_inter++;
    }
    result += int2char(result_inter);

    for (int i = 1; i < a.length() + 1 - b.length(); i++) {

        inter += a[i + b.length() - 1];
        result_inter = 0;
        while (strcompare(inter, b)) {
            inter = strAddMinus(inter, b, '-');
            result_inter++;
        }
        result += int2char(result_inter);

    }
    strDetrailing(&result);

    if (negative) {
        result = '-' + result;
    }

    return result;
}

std::string strmod(std::string a, std::string m) {
    // return a % m.
    if (m[0] == '-') {
        return "error!";
    }

    a = strAddMinus(a, strmult(m, strdiv(a, m)), '-');

    if (a[0] == '-') {
        a = strAddMinus(m, a.substr(1), '-');
    }

    return a;


}

std::string strmodexp(std::string a, std::string b, std::string m) {
    // returns (a^b) % m.
    a = strmod(a, m);

    // use 2 to speed up...
    std::string odd = "13579";
    std::string prod = "1";

    while (b != "0") {
        std::cout << b << std::endl;
        if (odd.find(b[b.length() - 1]) != std::string::npos) {
            prod = strmult(prod, a);
            prod = strmod(prod, m);
        }
        a = strmod(strmult(a, a), m);
        b = strdiv(b, "2");
    }

    return prod;


}

std::string ExtendedEuclidean(std::string X, std::string Y) {
    /* Returns inv(X) in Z/YZ field. Using Extended Euclidean Algorithm to find integer a,b such that a*X + b*Y = gcd(X,Y) = 1 . Only a would be returned as inv(X). */
    std::string Sprev = "1";
    std::string Scur = "0";
    std::string Tprev = "0";
    std::string Tcur = "1";

    // Make sure X > Y. Otherwise, reassign.
    bool switchTF = false;
    if (strcompare(Y, X)) {
        std::string inter = X;
        X = Y;
        Y = inter;
        switchTF = true;
    }
    std::string q, r, Tnext, Snext;
    r = "100";
    while (r != "0" && r[0] != '-') {
        q = strdiv(X, Y);
        r = strAddMinus(X, strmult(Y, q), '-');
        Snext = strAddMinus(Sprev, strmult(q, Scur), '-');
        Tnext = strAddMinus(Tprev, strmult(q, Tcur), '-');
        X = Y;
        Y = r;
        Sprev = Scur;
        Scur = Snext;
        Tprev = Tcur;
        Tcur = Tnext;

    }
    std::string result;
    if (switchTF) {
        result = Tprev;
    }
    else {
        result = Sprev;
    }
    if (X == "1") {
        return result;
    }
    else {
        return "0";
    }
}

std::string inv(std::string A, std::string M) {
    // Returns inv(A) in M/MZ, with 0 <= inv(A) < M-1.
    return strmod(ExtendedEuclidean(A, M), M);
}


long long int ExtendedEuclidean(long long int X, long long int Y) {
    /* Returns inv(X) in Z/YZ field. Using Extended Euclidean Algorithm to find integer a,b such that a*X + b*Y = gcd(X,Y) = 1 . Only a would be returned as inv(X). */
    long long int Sprev = 1;
    long long int Scur = 0;
    long long int Tprev = 0;
    long long int Tcur = 1;

    // Make sure X > Y. Otherwise, reassign.
    int switchTF = 0;
    if (Y > X) {
        int inter = X;
        X = Y;
        Y = inter;
        switchTF = 1;
    }
    long long int q, r, Tnext, Snext;
    r = 100;
    while (r > 0) {
        q = X / Y;
        r = X - Y*q;
        Snext = Sprev - q * Scur;
        Tnext = Tprev - q * Tcur;
        X = Y;
        Y = r;
        Sprev = Scur;
        Scur = Snext;
        Tprev = Tcur;
        Tcur = Tnext;
    }
    long long int result;
    if (switchTF > 0) {
        result = Tprev;
    }
    else {
        result = Sprev;
    }
    if (X == 1) {
        return result;
    }
    else {
        return 0;
    }
}
long long int Mod(long long int A, long long int M) {
    /* return A%M such that 0 <= A%M < M. */
    while (A < 0 || A > M - 1) {
        if (A < 0) {
            A += M;
        }
        else {
            A -= M;
        }
    }
    return A;
}
long long int inv(long long int A, long long int M) {
    // Returns inv(A) in M/MZ, with 0 <= inv(A) < M-1.
    return Mod(ExtendedEuclidean(A, M), M);
}



std::string asciidecode(std::string numbers) {
    std::string result = "";
    for (int i = 0; i < numbers.length(); i += 2) {
        if (numbers.substr(i, 2) == "00") {
            break;
        }
        result += (char)stoi(numbers.substr(i, 2));
    }

    return result;
}

std::string RSAdecrypt(std::string p, std::string q, std::string cipher, std::string e = "65537") {
    // Will return 
    // a = cipher ^ d (mod n), where d = inv(e) | mod phi(n) = inv(e) | mod (pn - p - q + 1), where n = p*q.
    std::string n = strmult(p, q);
    std::string phin = strAddMinus(strAddMinus(n, strAddMinus(p, q, '+'), '-'), "1", '+');
    std::string d = inv(e, phin);
    std::string a = strmodexp(cipher, d, n);



    return asciidecode(a);
}

int gcd(int a, int b) {
    // return the greatest common divisor of a and b. 1 means relative prime.
    if (a == b) {
        return a;
    }
    else {
        if (a > b) {
            return gcd(a - b, b);
        }
        else {
            return gcd(a, b - a);
        }
    }
}






int main()
{

    std::string p, q, cipher;
    while (std::cin >> p >> q >> cipher) {
        std::cout << RSAdecrypt(p, q, cipher) << std::endl;
    }
    return 0;
}

