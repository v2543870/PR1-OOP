#include <iostream>
using namespace std;

double scalarProduct(double ax, double ay, double bx, double by){
    return ax * bx + ay * by;
}

int main()
{
    double ax, ay, bx, by;

    cout << "Введіть координати вектора A (Ax Ay): ";
    cin >> ax >> ay;
    cout << "Введіть координати вектора B (Bx By): ";
    cin >> bx >> by;

    cout << "Скалярний добуток AB = " << scalarProduct(ax, ay, bx, by) << endl;

    return 0;
}
