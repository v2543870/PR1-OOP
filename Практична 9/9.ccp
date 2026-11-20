#include <iostream>
#include <cmath>
#include <clocale>

using namespace std;

class Prisma {
private:
    double height;
    double edge;

public:
    Prisma() : height(1), edge(1) {}

    Prisma(double h, double e) : height(h), edge(e) {}

    explicit Prisma(double e) : height(e), edge(e) {}

    Prisma(const Prisma &other) : height(other.height), edge(other.edge) {}

    operator double() const {
        return volume();
    }

    void setHeight(double h) { height = h; }
    void setEdge(double e) { edge = e; }

    double getHeight() const { return height; }
    double getEdge() const { return edge; }

    double baseArea() const {
        return sqrt(3.0) / 4.0 * edge * edge;
    }

    double lateralArea() const {
        return 3 * edge * height;
    }

    double volume() const {
        return baseArea() * height;
    }

    void print() const {
        cout << "Призма: висота = " << height << ", ребро основи = " << edge << endl;
    }
};

int main() {
    setlocale(LC_ALL, "Ukrainian");

    Prisma p1(10, 4);
    p1.print();
    cout << "Площа бічної поверхні: " << p1.lateralArea() << endl;
    cout << "Об'єм: " << p1.volume() << endl;
    cout << endl;

    Prisma p2(p1);
    p2.print();
    cout << "Площа бічної поверхні: " << p2.lateralArea() << endl;
    cout << "Об'єм: " << p2.volume() << endl;
    cout << endl;

    p2.setHeight(7);
    p2.setEdge(2);
    cout << "Після set-методів: h = " << p2.getHeight() << ", a = " << p2.getEdge() << endl;
    cout << "Площа бічної поверхні: " << p2.lateralArea() << endl;
    cout << "Об'єм: " << p2.volume() << endl;
    cout << endl;

    Prisma p3 = Prisma(5.0);
    p3.print();
    cout << endl;

    double v = p1;
    cout << "Перетворення типу Prisma -> double (об'єм p1): " << v << endl;
    cout << endl;

    double h, a;
    cout << "Введіть висоту: ";
    cin >> h;
    cout << "Введіть ребро основи: ";
    cin >> a;

    Prisma p4;
    p4.setHeight(h);
    p4.setEdge(a);
    p4.print();
    cout << "Площа бічної поверхні: " << p4.lateralArea() << endl;
    cout << "Об'єм: " << p4.volume() << endl;

    return 0;
}
