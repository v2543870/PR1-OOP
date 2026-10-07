#include <iostream>

using namespace std;

int main() {
    int totalSheets;
    cout << "Введіть загальну кількість аркушів n: ";
    cin >> totalSheets;

    cout << "\nУсі можливі варіанти друку книг:" << endl;

    int variantCount = 0;

    int max30 = totalSheets / 30;
    for (int x = 0; x <= max30; ++x) {

        int max40 = (totalSheets - x * 30) / 40;
        for (int y = 0; y <= max40; ++y) {

            int remaining = totalSheets - (x * 30 + y * 40);

            if (remaining % 60 == 0) {
                int z = remaining / 60;
                variantCount++;

                cout << "• Варіант " << variantCount << ":" << endl;
                cout << "  - Книг по 30 арк.: " << x << endl;
                cout << "  - Книг по 40 арк.: " << y << endl;
                cout << "  - Книг по 60 арк.: " << z << endl;
            }
        }
    }

    cout << "Всього знайдено можливих варіантів: " << variantCount << endl;

    return 0;
}
