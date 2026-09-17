#include <iostream>
using namespace std;

int main() {
    int a, b, c;
    
    cout << "Введіть три цілі числа через пробіл: ";
    cin >> a >> b >> c;

    if (a == b || b == c || a == c) {
        cout << "Результат: True (серед заданих чисел є принаймні одна пара рівних)." << endl;
    } else {
        cout << "Результат: False (всі три числа різні, рівних пар немає)." << endl;
    }

    return 0;
}
