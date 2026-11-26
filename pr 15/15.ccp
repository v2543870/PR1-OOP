#include <iostream>
#include <string>
#include <clocale>

using namespace std;

class Student {
private:
    string name;
    int birthYear;
    int points[4];

public:
    Student() : name(""), birthYear(0) {
        for (int i = 0; i < 4; i++)
            points[i] = 0;
    }

    Student(string n, int year, int p1, int p2, int p3, int p4)
        : name(n), birthYear(year) {
        points[0] = p1;
        points[1] = p2;
        points[2] = p3;
        points[3] = p4;
    }

    void setName(string n) { name = n; }
    void setBirthYear(int year) { birthYear = year; }

    void setPoint(int index, int value) {
        if (index >= 0 && index < 4)
            points[index] = value;
    }

    string getName() const { return name; }
    int getBirthYear() const { return birthYear; }

    int getPoint(int index) const {
        if (index >= 0 && index < 4)
            return points[index];
        return 0;
    }

    void input() {
        cout << "Прізвище та ініціали: ";
        getline(cin, name);

        cout << "Рік народження: ";
        cin >> birthYear;

        cout << "Оцінки з 4 предметів: ";
        for (int i = 0; i < 4; i++)
            cin >> points[i];

        cin.ignore(10000, '\n');
    }

    double average() const {
        int sum = 0;
        for (int i = 0; i < 4; i++)
            sum += points[i];

        return sum / 4.0;
    }

    void print() const {
        cout << name << ", рік народження: " << birthYear
             << ", середній бал: " << average() << endl;
    }
};

int main() {
    setlocale(LC_ALL, "");

    int n;
    cout << "Введіть кількість студентів n: ";
    cin >> n;
    cin.ignore(10000, '\n');

    if (n <= 0) {
        cout << "Некоректна кількість студентів.";
        return 0;
    }

    Student* Group = new Student[n];

    for (int i = 0; i < n; i++) {
        cout << "\nСтудент №" << i + 1 << endl;
        Group[i].input();
    }

    cout << "\nСтуденти із середнім балом > 72.0:" << endl;

    bool found = false;

    for (int i = 0; i < n; i++) {
        if (Group[i].average() > 72.0) {
            cout << Group[i].getName() << ", "
                 << Group[i].getBirthYear() << endl;
            found = true;
        }
    }

    if (!found)
        cout << "Таких студентів немає." << endl;

    delete[] Group;

    return 0;
}
