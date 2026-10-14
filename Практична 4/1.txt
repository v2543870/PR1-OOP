#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n;
    cout << "Введіть кількість елементів масиву: ";
    cin >> n;

    vector<int> arr(n);
    cout << "Введіть елементи масиву:\n";
    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    int sum = 0;
    cout << "Елементи, що не кратні 10: ";
    for (int x : arr) {
        if (x % 10 != 0) {
            cout << x << " ";
            sum += x;
        }
    }
    cout << "\nСума цих елементів: " << sum << endl;

    return 0;
}
