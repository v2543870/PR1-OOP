#include <iostream>
#include <cmath>
#include <clocale>

using namespace std;

class SquareEquation {
private:
    double a, b, c;

public:
    SquareEquation(double a = 1, double b = 0, double c = 0)
        : a(a), b(b), c(c) {}

    void setA(double value) { a = value; }
    void setB(double value) { b = value; }
    void setC(double value) { c = value; }

    double getA() const { return a; }
    double getB() const { return b; }
    double getC() const { return c; }

    double discriminant() const {
        return b * b - 4 * a * c;
    }

    int solve(double &x1, double &x2) const {
        const double EPS = 1e-12;

        if (fabs(a) < EPS) {
            if (fabs(b) < EPS) {
                if (fabs(c) < EPS) return -1;
                return 0;
            }
            x1 = -c / b;
            return 1;
        }

        double D = discriminant();

        if (D < -EPS) {
            return 0;
        } else if (fabs(D) <= EPS) {
            x1 = -b / (2 * a);
            return 1;
        } else {
            double sqrtD = sqrt(D);
            x1 = (-b + sqrtD) / (2 * a);
            x2 = (-b - sqrtD) / (2 * a);
            return 2;
        }
    }

    void print() const {
        cout << getA() << "x^2 ";
        cout << (getB() < 0 ? "- " : "+ ") << fabs(getB()) << "x ";
        cout << (getC() < 0 ? "- " : "+ ") << fabs(getC()) << " = 0" << endl;
    }
};

void showSolution(const SquareEquation &eq) {
    cout << "Рівняння:     ";
    eq.print();
    cout << "Дискримінант: D = " << eq.discriminant() << endl;

    double x1 = 0, x2 = 0;
    int count = eq.solve(x1, x2);

    cout << "Розв'язок:    ";
    switch (count) {
        case -1:
            cout << "безліч розв'язків (підходить будь-яке x)" << endl;
            break;
        case 0:
            cout << "дійсних коренів немає" << endl;
            break;
        case 1:
            cout << "один корінь, x = " << x1 << endl;
            break;
        case 2:
            cout << "два корені, x1 = " << x1 << ", x2 = " << x2 << endl;
            break;
    }
    cout << "----------------------------------------------" << endl;
}

int main() {
    setlocale(LC_ALL, "Ukrainian");

    SquareEquation eq1(1, -5, 6);
    showSolution(eq1);

    SquareEquation eq2(1, -2, 1);
    showSolution(eq2);

    SquareEquation eq3(1, 2, 5);
    showSolution(eq3);

    SquareEquation eq4;
    eq4.setA(2);
    eq4.setB(-8);
    eq4.setC(6);
    showSolution(eq4);

    double a, b, c;
    cout << "\nВведіть рівняння a*x^2 + b*x + c = 0" << endl;
    cout << "a = "; cin >> a;
    cout << "b = "; cin >> b;
    cout << "c = "; cin >> c;

    SquareEquation userEq;
    userEq.setA(a);
    userEq.setB(b);
    userEq.setC(c);

    cout << endl;
    showSolution(userEq);

    return 0;
}
