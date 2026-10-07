#include <iostream>

using namespace std;

int main() {
    int n;
    cout << "Введіть кількість чисел (n): ";
    cin >> n;

    if (n <= 0) {
        cout << "Кількість повинна бути більшою за 0!" << endl;
        return 0;
    }

    int count = 0; 
    cout << "Введіть " << n << " цілих чисел через пробіл або Enter: " << endl;

    for (int i = 0; i < n; ++i) {
        int num;
        cin >> num;

        if (num > 0 && num % 2 != 0) {
            count++;
        }
    }

    cout << "Кількість додатних непарних чисел: " << count << "\n\n";

    return 0;
}
