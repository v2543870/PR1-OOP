#include <iostream>
#include <cmath>
#include <clocale>

using namespace std;

class PolynomPow3 {
private:
    double coef[4];

public:
    PolynomPow3(double c0 = 0, double c1 = 0, double c2 = 0, double c3 = 0) {
        coef[0] = c0;
        coef[1] = c1;
        coef[2] = c2;
        coef[3] = c3;
    }

    PolynomPow3 operator+(const PolynomPow3 &other) const {
        PolynomPow3 result;
        for (int i = 0; i < 4; i++)
            result.coef[i] = coef[i] + other.coef[i];
        return result;
    }

    PolynomPow3 operator-(const PolynomPow3 &other) const {
        PolynomPow3 result;
        for (int i = 0; i < 4; i++)
            result.coef[i] = coef[i] - other.coef[i];
        return result;
    }

    PolynomPow3 operator*(double k) const {
        PolynomPow3 result;
        for (int i = 0; i < 4; i++)
            result.coef[i] = coef[i] * k;
        return result;
    }

    friend PolynomPow3 operator*(double k, const PolynomPow3 &p) {
        return p * k;
    }

    friend istream &operator>>(istream &in, PolynomPow3 &p) {
        cout << "  коефіцієнт при x^3: ";
        in >> p.coef[3];
        cout << "  коефіцієнт при x^2: ";
        in >> p.coef[2];
        cout << "  коефіцієнт при x^1: ";
        in >> p.coef[1];
        cout << "  вільний член (x^0): ";
        in >> p.coef[0];
        return in;
    }

    friend ostream &operator<<(ostream &out, const PolynomPow3 &p) {
        bool first = true;
        for (int i = 3; i >= 0; i--) {
            double c = p.coef[i];
            if (fabs(c) < 1e-12) continue;

            if (first) {
                if (c < 0) out << "-";
            } else {
                out << (c < 0 ? " - " : " + ");
            }

            double absC = fabs(c);
            if (i == 0 || absC != 1) out << absC;
            if (i >= 1) out << "x";
            if (i > 1) out << "^" << i;

            first = false;
        }
        if (first) out << "0";
        return out;
    }
};

int main() {
    setlocale(LC_ALL, "Ukrainian");

    cout << "Поліном має вигляд: a3*x^3 + a2*x^2 + a1*x + a0\n" << endl;

    PolynomPow3 p1, p2;
    double k;

    cout << "Введіть перший поліном P1:" << endl;
    cin >> p1;
    cout << "\nВведіть другий поліном P2:" << endl;
    cin >> p2;
    cout << "\nВведіть число k для множення: ";
    cin >> k;

    cout << "\n------------- Результат -------------" << endl;
    cout << "P1          = " << p1 << endl;
    cout << "P2          = " << p2 << endl;
    cout << "P1 + P2     = " << p1 + p2 << endl;
    cout << "P1 - P2     = " << p1 - p2 << endl;
    cout << "P1 * " << k << "     = " << p1 * k << endl;
    cout << k << " * P2     = " << k * p2 << endl;

    return 0;
}