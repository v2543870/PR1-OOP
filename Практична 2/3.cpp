#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

int main() {
    double a, b, h;

    cout << "Введіть початок діапазону (a): ";
    cin >> a;

    cout << "Введіть кінець діапазону (b): ";
    cin >> b;

    cout << "Введіть крок (h): ";
    cin >> h;

    if (h <= 0) {
        cout << "Помилка: крок повинен бути більшим за 0!" << endl;
        return 1;
    }

    cout << "\nЗначення функції Y = cos(x^2) + sin^2(x) + 2:\n\n";

    for (double x = a; x <= b + 1e-9; x += h) {
        double y = cos(x * x) + sin(x) * sin(x) + 2;

        cout << "При x = " << fixed << setprecision(4) << x 
             << ", y = " << y << endl;
    }

    return 0;
}
