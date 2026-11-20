#include <iostream>
#include <cmath>

using namespace std;

class Segment {
private:
    double x1, y1, x2, y2;

public:
    Segment(double ax = 0, double ay = 0, double bx = 0, double by = 0)
        : x1(ax), y1(ay), x2(bx), y2(by) {}

    void input() {
        cout << "Введіть координати першого кінця (x1 y1): ";
        cin >> x1 >> y1;
        cout << "Введіть координати другого кінця (x2 y2): ";
        cin >> x2 >> y2;
    }

    void print() const {
        cout << "Відрізок: A(" << x1 << "; " << y1 << "), B(" << x2 << "; " << y2 << ")" << endl;
    }

    double length() const {
        double dx = x2 - x1;
        double dy = y2 - y1;
        return sqrt(dx * dx + dy * dy);
    }

    void printLength() const {
        cout << "Довжина відрізка: " << length() << endl;
    }
};

int main() {
    Segment s1(0, 0, 3, 4);
    s1.print();
    s1.printLength();
    cout << endl;

    Segment s2;
    s2.input();
    s2.print();
    s2.printLength();

    return 0;
}
