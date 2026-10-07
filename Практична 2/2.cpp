#include <iostream>
using namespace std;

int main() {
    int n;
    cout << "Введіть суму цифр n (n < 15): ";
    cin >> n;

    if (n <= 0 || n >= 15) {
        cout << "Будь ласка, введіть число n, яке є більшим за 0 і меншим за 15." << endl;
        return 0;
    }

    cout << "Двозначні числа, сума цифр яких дорівнює " << n << ":" << endl;
    
    bool found = false;
    
    for (int i = 10; i <= 99; ++i) {
        int tens = i / 10;  
        int units = i % 10;  
        
        if (tens + units == n) {
            cout << i << " ";
            found = true;
        }
    }

    if (!found) {
        cout << "Немає двозначних чисел з такою сумою цифр.";
    }
    
    cout << endl;

    return 0;
}
