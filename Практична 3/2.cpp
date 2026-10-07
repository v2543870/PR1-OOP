#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

int main() {
    int n;
    cout << "Введіть натуральне число n: ";
    cin >> n;

    if (n <= 0) {
        cout << "Число n має бути натуральним (більшим за 0)!" << endl;
        return 0;
    }

    double sumY = 0.0;
    double currentSinSum = 0.0; 

    for (int i = 1; i <= n; ++i) {
        currentSinSum += sin(i); 

        if (currentSinSum == 0) {
            cout << "Помилка: знаменник дорівнює нулю при i = " << i << endl;
            return 1;
        }

        sumY += 1.0 / currentSinSum;
    }

    cout << fixed << setprecision(6);
    cout << "Результат обчислення y = " << sumY << "\n\n";

    return 0;
}
