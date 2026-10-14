#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int n;
    cout << "Введіть кількість елементів масиву: ";
    cin >> n;

    if (n <= 0) {
        cout << "Масив порожній." << endl;
        return 0;
    }

    vector<double> arr(n);
    cout << "Введіть елементи масиву:\n";
    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    double first_element = arr[0];
    double min_val = *min_element(arr.begin(), arr.end());
    double product = first_element * min_val;

    cout << "Перший елемент: " << first_element << endl;
    cout << "Мінімальний елемент: " << min_val << endl;
    cout << "Добуток: " << product << endl;

    return 0;
}
