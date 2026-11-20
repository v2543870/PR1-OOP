#include <iostream>
#include <string>
#include <ctime>
#include <clocale>

using namespace std;

class Stuff {
private:
    string name;
    string surname;
    int day, month, year;
    string position;
    double payment;

public:
    Stuff() : name(""), surname(""), day(1), month(1), year(2000), position(""), payment(0) {}

    Stuff(string n, string s, int d, int m, int y, string pos, double pay)
        : name(n), surname(s), day(d), month(m), year(y), position(pos), payment(pay) {}

    void setName(string n) { name = n; }
    void setSurname(string s) { surname = s; }
    void setDateOfBirth(int d, int m, int y) { day = d; month = m; year = y; }
    void setPosition(string pos) { position = pos; }
    void setPayment(double pay) { payment = pay; }

    string getName() const { return name; }
    string getSurname() const { return surname; }
    int getDay() const { return day; }
    int getMonth() const { return month; }
    int getYear() const { return year; }
    string getPosition() const { return position; }
    double getPayment() const { return payment; }

    void input() {
        cout << "Ім'я: ";
        cin >> name;
        cout << "Прізвище: ";
        cin >> surname;
        cout << "Дата народження (день місяць рік): ";
        cin >> day >> month >> year;
        cin.ignore(10000, '\n');
        cout << "Посада: ";
        getline(cin, position);
        cout << "Заробітна плата: ";
        cin >> payment;
    }

    int age() const {
        time_t t = time(nullptr);
        tm *now = localtime(&t);
        int curDay = now->tm_mday;
        int curMonth = now->tm_mon + 1;
        int curYear = now->tm_year + 1900;

        int a = curYear - year;
        if (curMonth < month || (curMonth == month && curDay < day)) {
            a--;
        }
        return a;
    }

    void print() const {
        cout << surname << " " << name
             << ", дата народження: " << day << "." << month << "." << year
             << ", посада: " << position
             << ", зарплата: " << payment
             << ", вік: " << age() << endl;
    }
};

int main() {
    setlocale(LC_ALL, "Ukrainian");

    int n;
    cout << "Введіть кількість працівників n: ";
    cin >> n;

    Stuff *Office = new Stuff[n];

    for (int i = 0; i < n; i++) {
        cout << "\nПрацівник №" << i + 1 << endl;
        Office[i].input();
    }

    double limit;
    cout << "\nВведіть максимальну заробітну плату: ";
    cin >> limit;

    cout << "\nПрацівники молодші 40 років із зарплатою меншою за " << limit << ":" << endl;

    bool found = false;
    for (int i = 0; i < n; i++) {
        if (Office[i].age() < 40 && Office[i].getPayment() < limit) {
            Office[i].print();
            found = true;
        }
    }

    if (!found) {
        cout << "Таких працівників немає." << endl;
    }

    delete[] Office;
    return 0;
}
