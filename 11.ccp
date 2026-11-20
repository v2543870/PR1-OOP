#include <iostream>
#include <string>
#include <clocale>

using namespace std;

class MovieLibrary {
private:
    string title;
    string genre;
    string director;
    int duration;

public:
    MovieLibrary() : title(""), genre(""), director(""), duration(0) {}

    MovieLibrary(string t, string g, string d, int dur)
        : title(t), genre(g), director(d), duration(dur) {}

    void setTitle(string t) { title = t; }
    void setGenre(string g) { genre = g; }
    void setDirector(string d) { director = d; }
    void setDuration(int dur) { duration = dur; }

    string getTitle() const { return title; }
    string getGenre() const { return genre; }
    string getDirector() const { return director; }
    int getDuration() const { return duration; }

    void input() {
        cin.ignore(10000, '\n');
        cout << "Назва: ";
        getline(cin, title);
        cout << "Жанр: ";
        getline(cin, genre);
        cout << "Режисер (прізвище): ";
        getline(cin, director);
        cout << "Тривалість (хв): ";
        cin >> duration;
    }

    void print() const {
        cout << "\"" << title << "\", жанр: " << genre
             << ", режисер: " << director
             << ", тривалість: " << duration << " хв" << endl;
    }
};

class Player {
private:
    MovieLibrary *movies;
    int count;
    int capacity;

    void resize() {
        capacity *= 2;
        MovieLibrary *tmp = new MovieLibrary[capacity];
        for (int i = 0; i < count; i++) {
            tmp[i] = movies[i];
        }
        delete[] movies;
        movies = tmp;
    }

public:
    Player() : count(0), capacity(4) {
        movies = new MovieLibrary[capacity];
    }

    Player(const Player &other) : count(other.count), capacity(other.capacity) {
        movies = new MovieLibrary[capacity];
        for (int i = 0; i < count; i++) {
            movies[i] = other.movies[i];
        }
    }

    Player &operator=(const Player &other) {
        if (this != &other) {
            delete[] movies;
            count = other.count;
            capacity = other.capacity;
            movies = new MovieLibrary[capacity];
            for (int i = 0; i < count; i++) {
                movies[i] = other.movies[i];
            }
        }
        return *this;
    }

    ~Player() {
        delete[] movies;
    }

    int getCount() const { return count; }

    void addMovie(const MovieLibrary &m) {
        if (count == capacity) resize();
        movies[count++] = m;
    }

    void inputMovie() {
        MovieLibrary m;
        m.input();
        addMovie(m);
    }

    bool removeMovie(int index) {
        if (index < 0 || index >= count) return false;
        for (int i = index; i < count - 1; i++) {
            movies[i] = movies[i + 1];
        }
        count--;
        return true;
    }

    void printAll() const {
        if (count == 0) {
            cout << "Бібліотека порожня." << endl;
            return;
        }
        for (int i = 0; i < count; i++) {
            cout << i + 1 << ". ";
            movies[i].print();
        }
    }

    void searchByTitle(const string &title) const {
        bool found = false;
        for (int i = 0; i < count; i++) {
            if (movies[i].getTitle() == title) {
                movies[i].print();
                found = true;
            }
        }
        if (!found) cout << "Фільмів не знайдено." << endl;
    }

    void searchByGenre(const string &genre) const {
        bool found = false;
        for (int i = 0; i < count; i++) {
            if (movies[i].getGenre() == genre) {
                movies[i].print();
                found = true;
            }
        }
        if (!found) cout << "Фільмів не знайдено." << endl;
    }

    void searchByDirector(const string &director) const {
        bool found = false;
        for (int i = 0; i < count; i++) {
            if (movies[i].getDirector() == director) {
                movies[i].print();
                found = true;
            }
        }
        if (!found) cout << "Фільмів не знайдено." << endl;
    }

    void searchByDuration(int minDur, int maxDur) const {
        bool found = false;
        for (int i = 0; i < count; i++) {
            int d = movies[i].getDuration();
            if (d >= minDur && d <= maxDur) {
                movies[i].print();
                found = true;
            }
        }
        if (!found) cout << "Фільмів не знайдено." << endl;
    }
};

int main() {
    setlocale(LC_ALL, "Ukrainian");

    Player player;

    player.addMovie(MovieLibrary("Inception", "Фантастика", "Nolan", 148));
    player.addMovie(MovieLibrary("Interstellar", "Фантастика", "Nolan", 169));
    player.addMovie(MovieLibrary("Godfather", "Драма", "Coppola", 175));
    player.addMovie(MovieLibrary("Psycho", "Трилер", "Hitchcock", 109));

    int choice;
    do {
        cout << "\n===== МЕНЮ =====" << endl;
        cout << "1. Додати фільм" << endl;
        cout << "2. Показати всі фільми" << endl;
        cout << "3. Пошук за назвою" << endl;
        cout << "4. Пошук за жанром" << endl;
        cout << "5. Пошук за режисером" << endl;
        cout << "6. Пошук за тривалістю" << endl;
        cout << "7. Видалити фільм" << endl;
        cout << "0. Вихід" << endl;
        cout << "Ваш вибір: ";
        cin >> choice;

        switch (choice) {
            case 1:
                player.inputMovie();
                break;
            case 2:
                player.printAll();
                break;
            case 3: {
                string t;
                cout << "Введіть назву: ";
                cin.ignore(10000, '\n');
                getline(cin, t);
                player.searchByTitle(t);
                break;
            }
            case 4: {
                string g;
                cout << "Введіть жанр: ";
                cin.ignore(10000, '\n');
                getline(cin, g);
                player.searchByGenre(g);
                break;
            }
            case 5: {
                string d;
                cout << "Введіть прізвище режисера: ";
                cin.ignore(10000, '\n');
                getline(cin, d);
                player.searchByDirector(d);
                break;
            }
            case 6: {
                int mn, mx;
                cout << "Мінімальна тривалість (хв): ";
                cin >> mn;
                cout << "Максимальна тривалість (хв): ";
                cin >> mx;
                player.searchByDuration(mn, mx);
                break;
            }
            case 7: {
                int idx;
                cout << "Номер фільму для видалення: ";
                cin >> idx;
                if (player.removeMovie(idx - 1)) {
                    cout << "Фільм видалено." << endl;
                } else {
                    cout << "Неправильний номер." << endl;
                }
                break;
            }
            case 0:
                cout << "Завершення роботи." << endl;
                break;
            default:
                cout << "Невірний вибір." << endl;
        }
    } while (choice != 0);

    return 0;
}
