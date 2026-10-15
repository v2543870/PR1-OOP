#include <iostream>
#include <string>
#include <locale>
using namespace std;

int main() {
    locale::global(locale(""));

    wstring s;
    wcout << L"Введіть речення: ";
    getline(wcin, s);

    int maxA = 0;

    for (int i = 0; i < s.length(); ) {

        while (i < s.length() && s[i] == L' ')
            i++;

        if (i >= s.length())
            break;

        int countA = 0;

        while (i < s.length() && s[i] != L' ') {
            if (s[i] == L'а')
                countA++;

            i++;
        }

        if (countA > maxA)
            maxA = countA;
    }

    wcout << L"Максимальна кількість слів з буквою 'а': " << maxA << endl;

    wcout << L"Слова з максимальною кількістю 'а': ";

    for (int i = 0; i < s.length(); ) {

        while (i < s.length() && s[i] == L' ')
            i++;

        if (i >= s.length())
            break;

        wstring word = L"";
        int countA = 0;

        while (i < s.length() && s[i] != L' ') {
            word += s[i];

            if (s[i] == L'а')
                countA++;

            i++;
        }

        if (countA == maxA)
            wcout << word << L" ";
    }

    return 0;
}
