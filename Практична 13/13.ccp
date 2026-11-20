#include <iostream>
#include <clocale>

using namespace std;

class Rectangle {
protected:
    double length;
    double width;

public:
    Rectangle(double l = 0, double w = 0) : length(l), width(w) {}

    double getLength() const { return length; }
    double getWidth() const { return width; }

    double area() const {
        return length * width;
    }

    void print() const {
        cout << "Довжина: " << length << endl;
        cout << "Ширина:  " << width << endl;
        cout << "Площа:   " << area() << endl;
    }
};

class Box : public Rectangle {
private:
    double height;

public:
    Box(double l = 0, double w = 0, double h = 0) : Rectangle(l, w), height(h) {}

    double getHeight() const { return height; }

    double volume() const {
        return area() * height;
    }

    void print() const {
        Rectangle::print();
        cout << "Висота:  " << height << endl;
        cout << "Об'єм:   " << volume() << endl;
    }
};

int main() {
    setlocale(LC_ALL, "Ukrainian");

    Rectangle rect(5, 3);
    Box box(4, 3, 2);

    cout << "===== Прямокутник (Rectangle) =====" << endl;
    rect.print();

    cout << "\n===== Паралелепіпед (Box) =====" << endl;
    box.print();

    return 0;
}