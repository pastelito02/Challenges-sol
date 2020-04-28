#Author ledesma1

#include <iostream>
#include <vector>
#include <sstream>

using namespace std;

int main()
{
    int numSet;
    cin >> numSet;
    string line;
    std::getline(std::cin, line);

    for (int i = 0; i < numSet; i++)
    {
        std::string line;

        int number;
        int sum = 0;
        std::vector<int> numbers;


        std::cout << "Enter numbers separated by spaces: ";
        std::getline(std::cin, line);
        std::istringstream stream(line);
        while (stream >> number)
            numbers.push_back(number);

        for (int j = 0; j < numbers.size(); j++)
        {
            numbers[j] = numbers[j] * numbers[j];
            sum += numbers[j];
        }
        cout << sum << endl;
    }
    cin.get();
    return 0;
}
