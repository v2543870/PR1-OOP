#include <iostream>
using namespace std;

int main() {
    char s[500];

    cout << "Введіть речення: ";
    cin.getline(s, 500);

    int max = 0;
    int kilkist = 0;

    for (int i = 0; s[i] != '\0'; i++) {
        if (s[i] == 'a')
            kilkist++;

        if (s[i] == ' ') {
            if (kilkist > max)
                max = kilkist;

            kilkist = 0;
        }
    }

    if (kilkist > max)
        max = kilkist;

    cout << "Слова з максимальною кількістю букв a: ";

    int pochatok = 0;
    kilkist = 0;

    for (int i = 0; ; i++) {
        if (s[i] == 'a')
            kilkist++;

        if (s[i] == ' ' || s[i] == '\0') {
            if (kilkist == max) {
                for (int j = pochatok; j < i; j++)
                    cout << s[j];

                cout << " ";
            }

            kilkist = 0;
            pochatok = i + 1;
        }

        if (s[i] == '\0')
            break;
    }

    return 0;
}
